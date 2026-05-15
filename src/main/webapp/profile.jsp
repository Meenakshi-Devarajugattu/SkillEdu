<%
if (request.getAttribute("appliedInternships") == null) {
    response.sendRedirect("ProfileServlet");
    return;
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .profile-container {
            max-width: 800px;
            width: 100%;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            overflow: hidden;
            animation: fadeIn 0.5s ease-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .profile-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
            position: relative;
        }

        /* 🔹 Back to Dashboard Link */
        .back-link {
            position: absolute;
            top: 20px;
            left: 20px;
        }

        .back-link a {
            display: inline-flex;
            align-items: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            font-weight: 600;
            padding: 8px 14px;
            border-radius: 8px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
            font-size: 0.9em;
        }

        .back-link a:hover {
            background: linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 14px rgba(0,0,0,0.25);
        }

        .back-link i {
            margin-right: 6px;
        }

        .profile-header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        .profile-content {
            padding: 30px;
        }
        .info-section, .internships-section {
            margin-bottom: 30px;
        }
        .info-section h2, .internships-section h2 {
            color: #333;
            border-bottom: 2px solid #667eea;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .user-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        @media (max-width: 600px) {
            .user-info {
                grid-template-columns: 1fr;
            }
        }
        .info-item {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            border-left: 4px solid #667eea;
            transition: transform 0.2s;
        }
        .info-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .info-item strong {
            color: #333;
        }
        .internship-list {
            list-style: none;
        }
        .internship-item {
            background: #f8f9fa;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 8px;
            border-left: 4px solid #28a745;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: transform 0.2s;
        }
        .internship-item:hover {
            transform: translateX(5px);
        }
        .no-internships {
            text-align: center;
            color: #666;
            font-style: italic;
            padding: 30px;
            background: #f8f9fa;
            border-radius: 8px;
        }
        .no-internships p {
            margin-bottom: 15px;
        }
        .browse-link {
            display: inline-block;
            background: #667eea;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background 0.3s;
        }
        .browse-link:hover {
            background: #5a6fd8;
            text-decoration: none;
            color: white;
        }
        .status-badge {
            background: #28a745;
            color: white;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.8em;
            margin-left: 10px;
        }
        .welcome-message {
            font-size: 1.1em;
            opacity: 0.9;
        }
    </style>
    <!-- Font Awesome for Back Icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <div class="profile-container">
    <div class="back-link">
                <a href="dashboard.jsp">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>
        <div class="profile-header">
            
            <h1>User Profile</h1>
            <p class="welcome-message">Welcome to your personal dashboard</p>
        </div>
        
        <div class="profile-content">
            <!-- User Information Section -->
            <div class="info-section">
                <h2>Personal Information</h2>
                <div class="user-info">
                    <div class="info-item">
                        <strong>Full Name:</strong><br>
                        <%= session.getAttribute("fullName") != null ? session.getAttribute("fullName") : "Not provided" %>
                    </div>
                    <div class="info-item">
                        <strong>Username:</strong><br>
                        <%= session.getAttribute("user") != null ? session.getAttribute("user") : "Not provided" %>
                    </div>
                    <div class="info-item">
                        <strong>Email:</strong><br>
                        <%= session.getAttribute("email") != null ? session.getAttribute("email") : "Not provided" %>
                    </div>
                </div>
            </div>
            
            <!-- Update Profile Section -->
            <div class="info-section">
                <h2>Update Profile</h2>
                <form action="UpdateProfileServlet" method="post">
                    <div class="user-info">
                        <div class="info-item">
                            <strong>Full Name:</strong><br>
                            <input type="text" name="fullName" value="<%= session.getAttribute("fullName") != null ? session.getAttribute("fullName") : "" %>" required>
                        </div>
                        <div class="info-item">
                            <strong>Email:</strong><br>
                            <input type="email" name="email" value="<%= session.getAttribute("email") != null ? session.getAttribute("email") : "" %>" required>
                        </div>
                        <div class="info-item">
                            <strong>Password:</strong><br>
                            <input type="password" name="password" placeholder="Enter new password" required>
                        </div>
                    </div>
                    <br>
                    <button type="submit" class="browse-link" style="background:#28a745;">Update Profile</button>
                </form>
            </div>
            
            <!-- Applied Internships Section -->
            <div class="internships-section">
                <h2>Applied Internships</h2>
                <%
                    List<String> appliedInternships = (List<String>) request.getAttribute("appliedInternships");
                    if (appliedInternships != null && !appliedInternships.isEmpty()) {
                %>
                    <ul class="internship-list">
                        <% for (String internship : appliedInternships) { %>
                            <li class="internship-item">
                                <span><%= internship %></span>
                                <span class="status-badge">Applied</span>
                            </li>
                        <% } %>
                    </ul>
                <% } else { %>
                    <div class="no-internships">
                        <p>You haven't applied for any internships yet.</p>
                        <p>Start exploring opportunities to boost your career!</p>
                        <a href="internships.jsp" class="browse-link">Browse Available Internships</a>
                    </div>
                <% } %>

                <!-- Posted Internships Section -->
                <div class="internships-section">
                    <h2>Posted Internships</h2>
                    <%
                        List<String> postedInternships = (List<String>) request.getAttribute("postedInternships");
                        if (postedInternships != null && !postedInternships.isEmpty()) {
                    %>
                        <ul class="internship-list">
                            <% for (String internship : postedInternships) { %>
                                <li class="internship-item">
                                    <span><%= internship %></span>
                                    <span class="status-badge">Posted</span>
                                    <!-- Delete button -->
                                    <form action="DeletePostedInternshipServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="internshipTitle" value="<%= internship %>">
                                        <button type="submit" style="background:#dc3545; color:white; border:none; padding:5px 10px; border-radius:5px; cursor:pointer;">Delete</button>
                                    </form>
                                </li>
                            <% } %>
                        </ul>
                    <% } else { %>
                        <div class="no-internships">
                            <p>You haven't posted any internships yet.</p>
                            <a href="postinternship.jsp" class="browse-link">Post an Internship</a>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
