package skill;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/InternshipApplyServlet")
public class InternshipApplyServlet extends HttpServlet {
    
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "meenakshi";
    private static final String DB_PASSWORD = "meenakshi";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement checkStmt = null;
        ResultSet rs = null;
        
        try {
            // Check if user is logged in
            if (session == null || session.getAttribute("user") == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            String username = (String) session.getAttribute("user");
            String internshipTitle = request.getParameter("internshipTitle");
            String internshipType = request.getParameter("internshipType");
            String company = request.getParameter("company");
            
            // Validate parameters
            if (internshipTitle == null || internshipTitle.trim().isEmpty()) {
                session.setAttribute("error", "Internship title is required");
                response.sendRedirect("internships.jsp");
                return;
            }
            
            // Load Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            // Establish connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            // First, check if user already applied
            boolean alreadyApplied = checkIfApplied(conn, username, internshipTitle);
            
            if (alreadyApplied) {
                session.setAttribute("error", "You have already applied for: " + internshipTitle);
            } else {
                // Prepare SQL statement
                String sql = "INSERT INTO internship_applications (username, internship_title, status) " +
                            "VALUES (?, ?, 'Applied')";
                
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, internshipTitle);
                
                int rowsAffected = pstmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    session.setAttribute("success", "Successfully applied for: " + internshipTitle);
                    
                    // Store applied internships in session for UI updates
                    updateAppliedInternshipsInSession(session, conn, username);
                    
                    System.out.println("Application stored - User: " + username + 
                                     ", Internship: " + internshipTitle);
                } else {
                    session.setAttribute("error", "Failed to apply for internship. Please try again.");
                }
            }
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            session.setAttribute("error", "Database driver not found: " + e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("error", "Database error: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Unexpected error: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (checkStmt != null) checkStmt.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            
            // Redirect back to internships page
            response.sendRedirect("internships.jsp");
        }
    }
    
    private boolean checkIfApplied(Connection conn, String username, String internshipTitle) 
            throws SQLException {
        String sql = "SELECT COUNT(*) FROM internship_applications WHERE username = ? AND internship_title = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, internshipTitle);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            return false;
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
        }
    }
    
    private void updateAppliedInternshipsInSession(HttpSession session, Connection conn, String username) 
            throws SQLException {
        String sql = "SELECT internship_title FROM internship_applications WHERE username = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            
            java.util.Set<String> appliedInternships = new java.util.HashSet<>();
            while (rs.next()) {
                appliedInternships.add(rs.getString("internship_title"));
            }
            
            session.setAttribute("appliedInternships", appliedInternships);
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
        }
    }
}