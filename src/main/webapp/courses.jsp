<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>SkillEdu - Explore Courses</title>
    <style>
        body {
            margin: 0;
            font-family: "Poppins", sans-serif;
            background: linear-gradient(to bottom right, #ffffff, #fff0f6, #e6ccff);
            color: #333;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 80px;
            background: white;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }
        .navbar h1 {
            font-size: 26px;
            font-weight: 800;
            color: #333;
        }
        .navbar span {
            background: linear-gradient(to right, #ff4dc4, #8000ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .navbar a {
            text-decoration: none;
            color: #555;
            margin-left: 20px;
            font-weight: 500;
            transition: 0.3s;
        }
        .navbar a:hover { color: #ff4dc4; }

        .hero { text-align: center; padding: 80px 30px 50px; }
        .hero h2 { font-size: 40px; color: #111; }
        .hero p { font-size: 18px; color: #555; max-width: 600px; margin: 10px auto; }

        .courses {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            padding: 50px 100px;
        }
        .course-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            transition: 0.3s;
        }
        .course-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.2);
        }
        .course-card img { width: 100%; height: 180px; object-fit: cover; }
        .course-content { padding: 20px; }
        .course-content h3 { color: #ff4dc4; font-size: 20px; margin-bottom: 10px; }
        .course-content p { color: #555; font-size: 15px; }
        .enroll-btn {
            display: inline-block;
            margin-top: 15px;
            background: linear-gradient(to right, #ff4dc4, #8000ff);
            color: white;
            padding: 10px 25px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
        }
        .enroll-btn:hover { opacity: 0.8; }
        footer {
            text-align: center;
            padding: 30px;
            background: #fff;
            color: #555;
            border-top: 1px solid #eee;
            margin-top: 50px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar">
        <h1><span>Skill</span>Edu</h1>
        <div>
            <a href="index.jsp">Home</a>
            <a href="courses.jsp">Courses</a>
            <a href="dashboard.jsp">Dashboard</a>
            <a href="instructor.jsp">Instructors</a>
            <a href="login.jsp">Login</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <h2>Explore Our Popular Courses</h2>
        <p>Boost your skills and career with our expertly designed online courses, guided by top instructors.</p>
    </section>

    <!-- Courses Grid -->
    <section class="courses">

        <!-- AI Course -->
        <div class="course-card">
            <div class="course-content">
                <h3>Artificial Intelligence</h3>
                <p>Master AI fundamentals, neural networks, and deep learning to create smart applications.</p>
                <a href="https://www.geeksforgeeks.org/artificial-intelligence/artificial-intelligence/" target="_blank" class="enroll-btn">
                    Open Notes
                </a>
                
         
            </div>
        </div>

        <!-- Full Stack Web Development -->
        <div class="course-card">
            <div class="course-content">
                <h3>Full Stack Web Development</h3>
                <p>Build dynamic websites and apps with HTML, CSS, JavaScript, React, and Node.js.</p>
                <a href=" https://www.geeksforgeeks.org/websites-apps/fullstack-web-development/" target="_blank" class="enroll-btn">
                    Open Notes
                </a>
            </div>
        </div>

        <!-- Data Science & ML -->
        <div class="course-card">
            <div class="course-content">
                <h3>Data Science & Machine Learning</h3>
                <p>Learn Python, data visualization, and predictive modeling using real-world datasets.</p>
                <a href="https://www.geeksforgeeks.org/machine-learning/ai-ml-and-data-science-tutorial-learn-ai-ml-and-data-science/" target="_blank" class="enroll-btn">
                    Open Notes
                </a>
            </div>
        </div>

        <!-- UI/UX Design -->
        <div class="course-card">
            <div class="course-content">
                <h3>UI/UX Design</h3>
                <p>Design stunning, user-centered interfaces using Figma, Adobe XD, and design systems.</p>
                <a href="https://www.geeksforgeeks.org/blogs/100-days-of-ui-ux/" target="_blank" class="enroll-btn">
                    Open Notes
                </a>
            </div>
        </div>

        <!-- Cloud Computing -->
        <div class="course-card">
            <div class="course-content">
                <h3>Cloud Computing</h3>
                <p>Understand AWS, Azure, and cloud architecture to scale your applications efficiently.</p>
                <a href="https://www.geeksforgeeks.org/cloud-computing/cloud-computing/" target="_blank" class="enroll-btn">
                    Open Notes
                </a>
            </div>
        </div>

        <!-- Cybersecurity Essentials -->
        <div class="course-card">
            <div class="course-content">
                <h3>Cybersecurity Essentials</h3>
                <p>Protect systems from attacks and learn ethical hacking, encryption, and network security.</p>
                <a href="https://www.geeksforgeeks.org/ethical-hacking/cyber-security-tutorial/" target="_blank" class="enroll-btn">
                    Open Notes
                </a>
            </div>
        </div>

    </section>
    
   <div style="text-align: center; margin-top: 30px;">
  <a href="dashboard.jsp" 
     class="enroll-btn" 
     style="
        display: inline-block; 
        background-color: #4CAF50; 
        color: white; 
        padding: 10px 20px; 
        text-decoration: none; 
        border-radius: 8px; 
        font-weight: bold;
        transition: background-color 0.3s ease;
     "
     onmouseover="this.style.backgroundColor='#45a049'"
     onmouseout="this.style.backgroundColor='#4CAF50'">
     Back to Dashboard
  </a>
</div>

              
    <!-- Footer -->
    <footer>
        © 2025 SkillEdu | Built with ❤ for learners
    </footer>
    
     

</body>
</html>