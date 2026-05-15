package skill;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
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
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String passwordHash = request.getParameter("password");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                String sql = "UPDATE users SET full_name=?, email=?, password_Hash=? WHERE username=?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, fullName);
                    ps.setString(2, email);
                    ps.setString(3, passwordHash);
                    ps.setString(4, username);
                    ps.executeUpdate();
                }
            }

            // Update session attributes
            session.setAttribute("fullName", fullName);
            session.setAttribute("email", email);

            // Redirect back to profile page
            response.sendRedirect("ProfileServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating profile: " + e.getMessage());
        }
    }
}