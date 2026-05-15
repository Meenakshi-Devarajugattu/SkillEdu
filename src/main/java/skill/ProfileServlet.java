package skill;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database Configuration
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "meenakshi";
    private static final String DB_PASS = "meenakshi";

    private static final String AUTH_SQL = "SELECT USERNAME, PASSWORD_HASH, FULL_NAME, EMAIL FROM USERS WHERE USERNAME = ?";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("Login attempt - Username: " + username);

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
                        String dbUsername = rs.getString("USERNAME");
                        String storedHash = rs.getString("PASSWORD_HASH");
                        fullName = rs.getString("FULL_NAME");
                        email = rs.getString("EMAIL");

                        System.out.println("Database - Username: " + dbUsername + ", Stored Hash: " + storedHash);

                        if (password.equals(storedHash)) {
                            authenticated = true;
                            System.out.println("Authentication SUCCESSFUL");
                        } else {
                            System.out.println("Password mismatch");
                        }
                    } else {
                        System.out.println("No user found with username: " + username);
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            System.err.println("Oracle JDBC Driver not found: " + e.getMessage());
            log("Oracle JDBC Driver not found", e);
            request.setAttribute("errorMessage", "Database connection error. Please try again.");
        } catch (SQLException e) {
            System.err.println("Database error during login: " + e.getMessage());
            log("Database error during login", e);
            request.setAttribute("errorMessage", "Database error. Please try again.");
        }

        if (authenticated) {
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            session.setAttribute("fullName", fullName);
            session.setAttribute("email", email);
            session.setMaxInactiveInterval(30 * 60);
            
            System.out.println("Redirecting to dashboard.jsp");
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid username or password.");
            System.out.println("Login failed - redirecting to login.jsp");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}