package skill;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database configuration
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "meenakshi";
    private static final String DB_PASS = "meenakshi";

    // ✅ Table name fixed to LOGIN
    private static final String AUTH_SQL =
        "SELECT USERNAME, PASSWORD_HASH, FULL_NAME, EMAIL FROM LOGIN WHERE USERNAME = ?";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean authenticated = false;
        String fullName = null;
        String email = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                 PreparedStatement pstmt = conn.prepareStatement(AUTH_SQL)) {

                pstmt.setString(1, username);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        String storedHash = rs.getString("PASSWORD_HASH");
                        fullName = rs.getString("FULL_NAME");
                        email = rs.getString("EMAIL");

                        if (password.equals(storedHash)) {
                            authenticated = true;
                        }
                    }
                }
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database driver not found.");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error. Please try again.");
        }

        if (authenticated) {
            // Store user details in session
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("fullName", fullName);
            session.setAttribute("email", email);
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
