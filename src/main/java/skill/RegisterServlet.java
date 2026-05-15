package skill;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database configuration
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "meenakshi";
    private static final String DB_PASS = "meenakshi";

    // ✅ Table name fixed to match your database
    private static final String INSERT_SQL =
        "INSERT INTO LOGIN (FULL_NAME, USERNAME, EMAIL, PASSWORD_HASH) VALUES (?, ?, ?, ?)";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // For simplicity (no hashing yet)
        String passwordHash = password;

        boolean success = false;
        String errorMessage = null;

        try {
            // Load Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                 PreparedStatement pstmt = conn.prepareStatement(INSERT_SQL)) {

                pstmt.setString(1, fullName);
                pstmt.setString(2, username);
                pstmt.setString(3, email);
                pstmt.setString(4, passwordHash);

                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    success = true;

                    // Create session after registration
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("fullName", fullName);
                    session.setAttribute("email", email);
                }
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            errorMessage = "Internal Error: Database driver not found.";
        } catch (SQLException e) {
            e.printStackTrace();
            if (e.getErrorCode() == 1) { // ORA-00001 unique constraint violation
                errorMessage = "Username or Email already exists. Try different credentials.";
            } else {
                errorMessage = "Database error: " + e.getMessage();
            }
        }

        if (success) {
            // Redirect to login page after successful registration
            response.sendRedirect("login.jsp");
        } else {
            // Show error message in registration page
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }
}
