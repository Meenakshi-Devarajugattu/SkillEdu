package skill;
	
	import java.io.IOException;
	import java.sql.*;
	import javax.servlet.*;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.*;
	
	@WebServlet("/DeletePostedInternshipServlet")
	public class DeletePostedInternshipServlet extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	    private static final String DB_USER = "meenakshi";
	    private static final String DB_PASS = "meenakshi";
	
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	
	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("user") == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }
	
	        String username = (String) session.getAttribute("user");
	        String internshipTitle = request.getParameter("internshipTitle");
	
	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
	                // Delete internship where the user posted it
	                String sql = "DELETE FROM internships WHERE position=? AND posted_by=?";
	                try (PreparedStatement ps = conn.prepareStatement(sql)) {
	                    ps.setString(1, internshipTitle);
	                    ps.setString(2, username);
	                    ps.executeUpdate();
	                }
	            }
	
	            // Redirect back to profile page
	            response.sendRedirect("ProfileServlet");
	
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error deleting internship: " + e.getMessage());
	        }
	    }
	}