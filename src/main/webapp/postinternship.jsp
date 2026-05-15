<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.text.SimpleDateFormat, skill.InternshipServlet.Internship" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Internship Recruitment Portal</title>
    <style>
        /* Base Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

       /* 🔹 Back to Dashboard Section */
.flex {
    display: flex;
    align-items: center;
    gap: 1rem;
    margin-bottom: 25px;
}

/* Make it look like a simple text link */
.flex a {
    color: #5a67d8;
    text-decoration: none;
    font-weight: 600;
    font-size: 20px;
    transition: color 0.3s ease;
    color:white;
    
}

.flex a:hover {
    color: pink; /* subtle hover color */
    text-decoration: none;
}

.flex i {
    margin-right: 6px;
    font-size: 18px;
    color: #5a67d8;
}

        /* Header Section */
        .header {
            text-align: center;
            margin-bottom: 40px;
            color: white;
        }
        
        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        /* Layout Grid */
        .main-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 40px;
        }
        
        @media (max-width: 768px) {
            .main-content {
                grid-template-columns: 1fr;
            }
        }

        /* Card Sections */
        .form-section, .list-section {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .section-title {
            color: #4a5568;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e2e8f0;
            font-size: 1.5rem;
        }

        /* Form Styling */
        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #4a5568;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 14px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s ease;
            width: 100%;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        /* Message Boxes */
        .message {
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 8px;
            font-weight: 500;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        /* Internship List */
        .internship-list {
            max-height: 500px;
            overflow-y: auto;
        }

        .internship-item {
            background: #f8fafc;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 10px;
            border-left: 4px solid #667eea;
            transition: all 0.3s ease;
        }

        .internship-item:hover {
            transform: translateX(5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .company-name {
            font-size: 1.2rem;
            font-weight: 700;
            color: #2d3748;
        }

        .position {
            font-size: 1.1rem;
            color: #4a5568;
            margin-bottom: 8px;
        }

        .location {
            color: #718096;
            margin-bottom: 8px;
        }

        .posted-date {
            font-size: 0.9rem;
            color: #a0aec0;
        }

        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #718096;
        }
    </style>
    <!-- Font Awesome for arrow icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="flex">
            <a href="dashboard.jsp">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>

        <div class="header">
            <h1>🎯 Internship Recruitment Portal</h1>
            <p>Post and manage internship opportunities</p>
        </div>
        
        <div class="main-content">
            <!-- Form Section -->
            <div class="form-section">
                <h2 class="section-title">📝 Post New Internship</h2>
                
                <% if (request.getAttribute("message") != null) { %>
                    <div class="message <%= request.getAttribute("messageType") %>">
                        <%= request.getAttribute("message") %>
                    </div>
                <% } %>
                
                <form action="InternshipServlet" method="post">
                    <div class="form-group">
                        <label for="companyName">🏢 Company Name</label>
                        <input type="text" id="companyName" name="companyName" placeholder="Enter company name" required maxlength="100">
                    </div>
                    
                    <div class="form-group">
                        <label for="position">💼 Position</label>
                        <input type="text" id="position" name="position" placeholder="e.g., Software Development Intern" required maxlength="100">
                    </div>
                    
                    <div class="form-group">
                        <label for="location">📍 Location</label>
                        <input type="text" id="location" name="location" placeholder="e.g., Remote, New York, NY" required maxlength="100">
                    </div>
                    
                    <button type="submit" class="btn">🚀 Post Internship</button>
                </form>
            </div>
            
            <!-- List Section -->
            <div class="list-section">
                <h2 class="section-title">📋 Posted Internships</h2>
                
                <div class="internship-list">
                    <%
                        List<Internship> internships = (List<Internship>) request.getAttribute("internships");
                        if (internships != null && !internships.isEmpty()) {
                            SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy 'at' hh:mm a");
                            for (Internship internship : internships) {
                    %>
                        <div class="internship-item">
                            <div class="company-name"><%= internship.getCompanyName() %></div>
                            <div class="position"><%= internship.getPosition() %></div>
                            <div class="location">📍 <%= internship.getLocation() %></div>
                            <div class="posted-date">📅 Posted on: <%= dateFormat.format(internship.getPostedDate()) %></div>
                        </div>
                    <%
                            }
                        } else {
                    %>
                        <div class="empty-state">
                            <div>📭</div>
                            <h3>No Internships Posted Yet</h3>
                            <p>Be the first to post an internship opportunity!</p>
                        </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
