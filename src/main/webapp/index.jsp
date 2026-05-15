<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SkillEdu - Unlock Your Potential</title>
    <style>
        body {
            margin: 0;
            font-family: "Poppins", sans-serif;
            background: linear-gradient(to bottom, white, #ffe6f2);
            color: #333;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 80px;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar h1 {
            font-size: 26px;
            font-weight: 900;
            color: #111;
        }

        .navbar .brand span {
            background: linear-gradient(to right, #ff4dc4, #8000ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .navbar .nav-buttons a {
            text-decoration: none;
            color: white;
            background: linear-gradient(to right, #ff4dc4, #8000ff);
            padding: 10px 20px;
            border-radius: 25px;
            margin-left: 10px;
            font-weight: bold;
            transition: 0.3s;
        }

        .navbar .nav-buttons a:hover {
            opacity: 0.8;
        }

        /* Hero Section */
        .hero {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 80px 100px;
            flex-wrap: wrap;
        }

        .hero-text {
            max-width: 500px;
        }

        .hero-text h1 {
            font-size: 50px;
            font-weight: 900;
            color: #111;
        }

        .highlight {
            background: linear-gradient(to right, #ff4dc4, #8000ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero-text p {
            margin-top: 10px;
            font-size: 18px;
            color: #555;
        }

        .hero-text a {
            display: inline-block;
            margin-top: 20px;
            background: linear-gradient(to right, #ff4dc4, #8000ff);
            color: white;
            padding: 12px 30px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            transition: 0.3s;
        }

        .hero-text a:hover {
            opacity: 0.8;
        }

        .hero img {
            width: 500px;
            height: 400px;
            border-radius: 45px;
            box-shadow: 0 9px 35px rgba(0,0,0,0.2);
        }

        /* Login Form */
        .login-form {
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
            max-width: 350px;
            width: 100%;
            margin-top: 20px;
        }

        .login-form h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #111;
        }

        .login-form input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .login-form button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 25px;
            background: linear-gradient(to right, #ff4dc4, #8000ff);
            color: #fff;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }

        .login-form button:hover {
            opacity: 0.9;
        }

        .login-form .note {
            text-align: center;
            margin-top: 15px;
        }

        .login-form a {
            color: #9c27b0;
            text-decoration: none;
        }

        /* Other Sections */
        .instructors, .trusted {
            text-align: center;
            padding: 80px 100px;
        }

        .instructors h2, .trusted h2 {
            font-size: 36px;
            margin-bottom: 50px;
        }

        .instructor-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: 0.3s;
        }

        .card:hover {
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        }

        .card h3 {
            color: #ff4dc4;
            margin-bottom: 5px;
        }

        .card p {
            color: #555;
        }

        .instructors a {
            display: inline-block;
            margin-top: 30px;
            background: linear-gradient(to right, #ff4dc4, #8000ff);
            color: white;
            padding: 12px 35px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
        }

        .trusted .logos {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 80px;
        }

        .trusted .logos img {
            height: 40px;
            opacity: 0.8;
            transition: 0.3s;
        }

        .trusted .logos img:hover {
            opacity: 1;
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <div class="navbar">
        <div class="brand">
            <h1><span>SkillEdu</span></h1>
        </div>
        <div class="nav-buttons">
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>
    </div>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-text">
            <h1>Unlock Your Potential with <span class="highlight">SkillEdu</span></h1>
            <p>Join thousands of learners mastering in-demand skills through our expert-led courses. From coding to creativity — your journey begins here.</p>
            <a href="courses.jsp">Explore Courses →</a>
        </div>

        

        <img src="https://img.freepik.com/free-photo/learning-education-ideas-insight-intelligence-study-concept_53876-120116.jpg?semt=ais_hybrid&w=740&q=80" alt="SkillEdu learning illustration">
    </section>

    <!-- Instructors Section -->
    <section class="instructors">
        <h2>Learn From Industry Experts</h2>
        <div class="instructor-grid">
            <div class="card">
                <h3>Aisha Patel</h3>
                <p><strong>AI & Data Science Expert</strong></p>
                <p>Aisha has over 10 years of experience in AI, helping learners master data-driven insights.</p>
            </div>
            <div class="card">
                <h3>Daniel Roberts</h3>
                <p><strong>Fu	ll Stack Web Developer</strong></p>
                <p>Daniel is a software engineer who blends theory and hands-on coding experience.</p>
            </div>
            <div class="card">
                <h3>Emily Chen</h3>
                <p><strong>UI/UX Design Mentor</strong></p>
                <p>Emily guides learners in design thinking, prototyping, and creative storytelling.</p>
            </div>
        </div>
        <a href="instructor.jsp">View All Instructors →</a>
    </section>

    <!-- Trusted Section -->
    <section class="trusted">
        <h2>Trusted by <span style="color:#ff4dc4;">50,000+</span> learners and professionals worldwide</h2>
        <div class="logos">
            <img src="https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg" alt="Amazon">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Google_2015_logo.svg" alt="Google">
            <img src="https://upload.wikimedia.org/wikipedia/commons/4/44/Microsoft_logo.svg" alt="Microsoft">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/05/Facebook_Logo_%282019%29.png" alt="Meta">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/08/Netflix_2015_logo.svg" alt="Netflix">
            <img src="https://upload.wikimedia.org/wikipedia/commons/5/51/IBM_logo.svg" alt="IBM">
        </div>
    </section>

</body>
</html>
