package skill;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/InternshipServlet")
public class InternshipServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Oracle DB connection details
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "meenakshi";
    private static final String DB_PASS = "meenakshi";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("user");

        // ✅ Get message from session (if any)
        String message = (String) session.getAttribute("message");
        String messageType = (String) session.getAttribute("messageType");

        // Remove them so they don’t show again after refresh
        session.removeAttribute("message");
        session.removeAttribute("messageType");

        List<Internship> internships = getAllInternships(username);
        request.setAttribute("internships", internships);
        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);

        request.getRequestDispatcher("postinternship.jsp").forward(request, response);
    }


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	
	    HttpSession session = request.getSession(false);
	    if (session == null || session.getAttribute("user") == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }
	
	    String username = (String) session.getAttribute("user");
	    String companyName = request.getParameter("companyName");
	    String position = request.getParameter("position");
	    String location = request.getParameter("location");
	
	    String message;
	    String messageType;
	
	    if (companyName == null || companyName.trim().isEmpty() ||
	        position == null || position.trim().isEmpty() ||
	        location == null || location.trim().isEmpty()) {
	
	        message = "All fields are required!";
	        messageType = "error";
	
	    } else if (companyName.length() > 100 || position.length() > 100 || location.length() > 100) {
	
	        message = "Input too long! Maximum 100 characters allowed.";
	        messageType = "error";
	
	    } else {
	        String result = addInternship(companyName.trim(), position.trim(), location.trim(), username);
	        if ("success".equals(result)) {
	            message = "Internship posted successfully!";
	            messageType = "success";
	        } else {
	            message = "Error: " + result;
	            messageType = "error";
	        }
	    }
	
	    // Store message temporarily in session
	    session.setAttribute("message", message);
	    session.setAttribute("messageType", messageType);
	
	    // ✅ Redirect to avoid form resubmission
	    response.sendRedirect("InternshipServlet");
	}


    // --- Insert internship record ---
    private String addInternship(String companyName, String position, String location, String username) {
        String sql = "INSERT INTO INTERNSHIPS (COMPANY_NAME, POSITION, LOCATION, POSTED_DATE, POSTED_BY) "
                   + "VALUES (?, ?, ?, SYSTIMESTAMP, ?)";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, companyName);
            stmt.setString(2, position);
            stmt.setString(3, location);
            stmt.setString(4, username);

            int rows = stmt.executeUpdate();
            return rows > 0 ? "success" : "No rows affected";

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return "Oracle JDBC Driver not found. Add ojdbc8.jar to your project.";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error: " + e.getMessage();
        } catch (Exception e) {
            e.printStackTrace();
            return "Unexpected error: " + e.getMessage();
        }
    }

    // --- Retrieve internships for specific user ---
    private List<Internship> getAllInternships(String username) {
        List<Internship> internships = new ArrayList<>();
        String sql = "SELECT COMPANY_NAME, POSITION, LOCATION, POSTED_DATE, POSTED_BY "
                   + "FROM INTERNSHIPS "
                   + "WHERE POSTED_BY = ? "
                   + "ORDER BY POSTED_DATE DESC";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Internship i = new Internship();
                    i.setCompanyName(rs.getString("COMPANY_NAME"));
                    i.setPosition(rs.getString("POSITION"));
                    i.setLocation(rs.getString("LOCATION"));
                    i.setPostedDate(rs.getTimestamp("POSTED_DATE"));
                    i.setPostedBy(rs.getString("POSTED_BY"));
                    internships.add(i);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return internships;
    }

    // --- Database connection method ---
    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
    }

    // --- Inner class for Internship model ---
    public static class Internship {
        private String companyName;
        private String position;
        private String location;
        private Timestamp postedDate;
        private String postedBy;

        public String getCompanyName() { return companyName; }
        public void setCompanyName(String companyName) { this.companyName = companyName; }

        public String getPosition() { return position; }
        public void setPosition(String position) { this.position = position; }

        public String getLocation() { return location; }
        public void setLocation(String location) { this.location = location; }

        public Timestamp getPostedDate() { return postedDate; }
        public void setPostedDate(Timestamp postedDate) { this.postedDate = postedDate; }

        public String getPostedBy() { return postedBy; }
        public void setPostedBy(String postedBy) { this.postedBy = postedBy; }
    }
}