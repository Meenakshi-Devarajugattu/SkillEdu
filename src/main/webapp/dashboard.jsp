<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("user");
    String fullName = (String) session.getAttribute("fullName");
    
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SkillEdu Dashboard</title>
<style>
    body {
        margin: 0;
        font-family: "Poppins", sans-serif;
        background: linear-gradient(to bottom, #ffffff, #f3e8ff);
        color: #333;
        min-height: 100vh;
    }

    /* Navbar */
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 50px;
        background-color: #fff;
        box-shadow: 0px 2px 6px rgba(0,0,0,0.1);
        position: sticky;
        top: 0;
        z-index: 1000;
    }
    .navbar .logo {
        font-size: 24px;
        font-weight: 700;
        color: #5A3BE0;
    }
    .navbar ul {
        list-style: none;
        display: flex;
        gap: 30px;
        margin: 0;
        padding: 0;
    }
    .navbar ul li a {
        text-decoration: none;
        color: #333;
        font-weight: 500;
    }
    .navbar ul li a:hover {
        color: #5A3BE0;
    }
    .user-info {
        display: flex;
        align-items: center;
        gap: 15px;
    }
    .welcome-text {
        color: #5A3BE0;
        font-weight: 500;
    }
    .navbar .btns a {
        text-decoration: none;
        color: white;
        background: #5A3BE0;
        padding: 8px 18px;
        border-radius: 6px;
        font-weight: 500;
        margin-left: 10px;
    }
    .navbar .btns a:hover {
        background: #462bb7;
    }

    /* Main content */
    .dashboard {
        text-align: center;
        margin-top: 70px;
        padding: 20px;
    }
    .dashboard h1 {
        font-size: 32px;
        color: #4B0082;
        margin-bottom: 10px;
    }
    .dashboard p {
        color: #555;
        margin-top: 10px;
        font-size: 16px;
    }

    /* Buttons section */
    .card-container {
        display: flex;
        justify-content: center;
        gap: 40px;
        margin-top: 40px;
        flex-wrap: wrap;
    }
    .card {
        width: 200px;
        height: 140px;
        border-radius: 16px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 18px;
        font-weight: 600;
        cursor: pointer;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        transition: transform 0.2s, box-shadow 0.2s;
        text-decoration: none;
    }
    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(0,0,0,0.3);
    }

    .courses { background: linear-gradient(135deg, #7B61FF, #5A3BE0); }
    .internships { background: linear-gradient(135deg, #FF4F91, #FF0080); }
    .post-internship { background: linear-gradient(135deg, #FFA62E, #FF7B00); }
    .profile { background: linear-gradient(135deg, #00C9FF, #92FE9D); }
    .logout { background: linear-gradient(135deg, #4b4b4b, #2c2c2c); }

    /* Quote */
    .quote {
        text-align: center;
        font-style: italic;
        color: #555;
        margin: 40px 0;
        font-size: 18px;
        padding: 0 20px;
    }

    /* Footer */
    footer {
        background: linear-gradient(90deg, #5A3BE0, #FF0080);
        color: white;
        text-align: center;
        padding: 25px 10px;
        margin-top: 50px;
    }
    footer p {
        margin: 8px 0;
    }
    .social-icons {
        margin-top: 10px;
    }
    .social-icons a {
        color: white;
        text-decoration: none;
        margin: 0 10px;
        font-size: 20px;
    }
</style>
<!-- Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar">
        <div class="logo">SkillEdu</div>
        <ul>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">FAQ</a></li>
        </ul>
        <div class="user-info">
            <span class="welcome-text">Welcome, <%= fullName != null ? fullName : user %>!</span>
            <div class="btns">
                <a href="logout.jsp">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Dashboard Section -->
    <div class="dashboard">
        <h1>Welcome to Your Dashboard</h1>
        <p>Manage your learning journey — access courses, internships, and update your profile with ease.</p>

        <div class="card-container">
            <a href="courses.jsp" class="card courses">
                <i class="fa-solid fa-book fa-2x"></i><br>View Courses
            </a>

            <a href="internships.jsp" class="card internships">
                <i class="fa-solid fa-briefcase fa-2x"></i><br>View Internships
            </a>

            <a href="postinternship.jsp" class="card post-internship">
                <i class="fa-solid fa-plus-circle fa-2x"></i><br>Post Internship
            </a>

            <a href="profile.jsp" class="card profile">
                <i class="fa-solid fa-user fa-2x"></i><br>My Profile
            </a>

            <a href="logout.jsp" class="card logout">
                <i class="fa-solid fa-right-from-bracket fa-2x"></i><br>Logout
            </a>
        </div>
    </div>

    <div class="quote">
        "The future belongs to those who learn more skills and combine them in creative ways."
    </div>

    <footer>
        <p>Stay in Touch</p>
        <div class="social-icons">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-linkedin"></i></a>
            <a href="#"><i class="fab fa-github"></i></a>
        </div>
        <p>&copy; 2025 SkillEdu. All Rights Reserved.</p>
    </footer>

</body>
</html>