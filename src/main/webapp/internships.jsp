<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if user is logged in
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SkillEdu - Internships</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .internship-card {
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .internship-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }
        .nav-back {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .pay-scale {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
        }
        .urgency-badge {
            background: linear-gradient(135deg, #ff5858 0%, #f09819 100%);
            color: white;
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
    </style>
</head>
<body class="bg-gradient-to-br from-purple-50 via-pink-50 to-blue-50 min-h-screen">

    <!-- Navigation Bar -->
    <nav class="nav-back text-white shadow-lg">
        <div class="container mx-auto px-6 py-4">
            <div class="flex justify-between items-center">
                <div class="flex items-center space-x-4">
                    <a href="dashboard.jsp" class="text-white hover:text-gray-200 transition">
                        <i class="fas fa-arrow-left mr-2"></i>Back to Dashboard
                    </a>
                    <h1 class="text-2xl font-bold">SkillEdu</h1>
                </div>
                <div class="flex items-center space-x-4">
                    <span class="text-white">Welcome, <%= session.getAttribute("fullName") != null ? session.getAttribute("fullName") : user %>!</span>
                    <a href="logout.jsp" class="bg-white text-purple-600 px-4 py-2 rounded-lg font-semibold hover:bg-gray-100 transition">
                        <i class="fas fa-sign-out-alt mr-2"></i>Logout
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Success/Error Messages -->
    <div class="container mx-auto px-6 py-4">
        <% 
            String success = (String) session.getAttribute("success");
            String error = (String) session.getAttribute("error");
            
            if (success != null) {
        %>
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                <strong class="font-bold">Success! </strong>
                <span class="block sm:inline"><%= success %></span>
                <%
                    session.removeAttribute("success");
                %>
            </div>
        <%
            }
            
            if (error != null) {
        %>
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
                <strong class="font-bold">Error! </strong>
                <span class="block sm:inline"><%= error %></span>
                <%
                    session.removeAttribute("error");
                %>
            </div>
        <%
            }
        %>
    </div>

    <!-- Main Content -->
    <div class="container mx-auto px-6 py-12 max-w-6xl">
        <!-- Header -->
        <div class="text-center mb-16">
            <h1 class="text-5xl font-extrabold text-gray-900 mb-6">
                Explore <span class="text-transparent bg-clip-text bg-gradient-to-r from-purple-600 to-pink-600">Internship Opportunities</span>
            </h1>
            <p class="text-gray-700 text-lg max-w-3xl mx-auto leading-relaxed">
                Kickstart your career with hands-on experience. Apply for internships that match your skills and interests.
            </p>
        </div>

        <!-- Internships Grid -->
        <div class="grid gap-8 md:grid-cols-2 lg:grid-cols-3">
            <!-- Internship Card 1: Full Stack Developer -->
            <div class="internship-card bg-white rounded-2xl p-6 shadow-lg border border-gray-100">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center mr-4">
                        <i class="fas fa-laptop-code text-blue-600 text-xl"></i>
                    </div>
                    <div>
                        <h3 class="text-xl font-bold text-gray-900">Full Stack Developer Internship</h3>
                        <p class="text-gray-600">Tech Solutions Inc.</p>
                    </div>
                </div>
                <p class="text-gray-700 mb-4">Build modern web applications with frontend and backend technologies.</p>
                <div class="space-y-2 mb-4">
                    <div class="flex justify-between items-center">
                        <span class="bg-green-100 text-green-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-map-marker-alt mr-1"></i>Work From Home
                        </span>
                        <span class="bg-purple-100 text-purple-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-calendar-alt mr-1"></i>3 months
                        </span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="bg-red-100 text-red-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-money-bill-wave mr-1"></i>Unpaid
                        </span>
                        <span class="urgency-badge px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-clock mr-1"></i>Apply by 25 Oct 2025
                        </span>
                    </div>
                </div>
                <div class="space-y-3">
                    <a href="https://in.jobsii.com/uWKfR" target="_blank" 
                       class="w-full bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg flex items-center justify-center">
                        <i class="fas fa-external-link-alt mr-2"></i>Open Now
                    </a>
                    <form action="InternshipApplyServlet" method="post" class="w-full">
                        <input type="hidden" name="internshipType" value="fullstack">
                        <input type="hidden" name="internshipTitle" value="Full Stack Developer Internship">
                        <input type="hidden" name="company" value="Tech Solutions Inc.">
                        <button type="submit" 
                                class="w-full bg-gradient-to-r from-green-500 to-teal-600 hover:from-green-600 hover:to-teal-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg flex items-center justify-center">
                            <i class="fas fa-paper-plane mr-2"></i>Apply Now
                        </button>
                    </form>
                </div>
            </div>

            <!-- Internship Card 2: Web Developer -->
            <div class="internship-card bg-white rounded-2xl p-6 shadow-lg border border-gray-100">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center mr-4">
                        <i class="fas fa-code text-green-600 text-xl"></i>
                    </div>
                    <div>
                        <h3 class="text-xl font-bold text-gray-900">Web Developer Internship</h3>
                        <p class="text-gray-600">Web Innovators</p>
                    </div>
                </div>
                <p class="text-gray-700 mb-4">Develop responsive websites and web applications using modern frameworks.</p>
                <div class="space-y-2 mb-4">
                    <div class="flex justify-between items-center">
                        <span class="bg-green-100 text-green-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-map-marker-alt mr-1"></i>Work From Home
                        </span>
                        <span class="bg-purple-100 text-purple-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-calendar-alt mr-1"></i>2 months
                        </span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="pay-scale px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-money-bill-wave mr-1"></i>₹12,000 – ₹15,000 / Month
                        </span>
                        <span class="urgency-badge px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-clock mr-1"></i>Apply by 17 Oct 2025
                        </span>
                    </div>
                </div>
                <div class="space-y-3">
                    <a href="https://in.jobsii.com/Jm8" target="_blank" 
                       class="w-full bg-gradient-to-r from-green-500 to-blue-600 hover:from-green-600 hover:to-blue-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg flex items-center justify-center">
                        <i class="fas fa-external-link-alt mr-2"></i>Open Now
                    </a>
                    <form action="InternshipApplyServlet" method="post" class="w-full">
                        <input type="hidden" name="internshipType" value="webdev">
                        <input type="hidden" name="internshipTitle" value="Web Developer Internship">
                        <input type="hidden" name="company" value="Web Innovators">
                        <button type="submit" 
                                class="w-full bg-gradient-to-r from-green-500 to-teal-600 hover:from-green-600 hover:to-teal-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg flex items-center justify-center">
                            <i class="fas fa-paper-plane mr-2"></i>Apply Now
                        </button>
                    </form>
                </div>
            </div>

            <!-- Internship Card 3: Multi-Company Internship Program -->
            <div class="internship-card bg-white rounded-2xl p-6 shadow-lg border border-gray-100">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-yellow-100 rounded-lg flex items-center justify-center mr-4">
                        <i class="fas fa-certificate text-yellow-600 text-xl"></i>
                    </div>
                    <div>
                        <h3 class="text-xl font-bold text-gray-900">Multi-Company Internship Program</h3>
                        <p class="text-gray-600">Microsoft, IBM, Adobe</p>
                    </div>
                </div>
                <p class="text-gray-700 mb-4">Internship and certificate opportunity from top companies. Learn 15+ industry required skills.</p>
                <div class="space-y-2 mb-4">
                    <div class="flex justify-between items-center">
                        <span class="bg-green-100 text-green-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-map-marker-alt mr-1"></i>Work From Home
                        </span>
                        <span class="bg-purple-100 text-purple-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-calendar-alt mr-1"></i>Flexible
                        </span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="bg-indigo-100 text-indigo-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-graduation-cap mr-1"></i>Certificate & Internship
                        </span>
                        <span class="bg-red-500 text-white px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-exclamation-circle mr-1"></i>Don't Miss!
                        </span>
                    </div>
                </div>
                <div class="space-y-3">
                    <a href="https://rb.gy/qunos" target="_blank" 
                       class="w-full bg-gradient-to-r from-yellow-500 to-orange-600 hover:from-yellow-600 hover:to-orange-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg flex items-center justify-center">
                        <i class="fas fa-external-link-alt mr-2"></i>Open Now
                    </a>
                    <form action="InternshipApplyServlet" method="post" class="w-full">
                        <input type="hidden" name="internshipType" value="multi">
                        <input type="hidden" name="internshipTitle" value="Multi-Company Internship Program">
                        <input type="hidden" name="company" value="Microsoft, IBM, Adobe">
                        <button type="submit" 
                                class="w-full bg-gradient-to-r from-green-500 to-teal-600 hover:from-green-600 hover:to-teal-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg flex items-center justify-center">
                            <i class="fas fa-paper-plane mr-2"></i>Apply Now
                        </button>
                    </form>
                </div>
            </div>

            <!-- Internship Card 4: Backend Developer -->
            <div class="internship-card bg-white rounded-2xl p-6 shadow-lg border border-gray-100">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-red-100 rounded-lg flex items-center justify-center mr-4">
                        <i class="fas fa-server text-red-600 text-xl"></i>
                    </div>
                    <div>
                        <h3 class="text-xl font-bold text-gray-900">Backend Developer Internship</h3>
                        <p class="text-gray-600">Backend Solutions</p>
                    </div>
                </div>
                <p class="text-gray-700 mb-4">Work on server-side development, APIs, and database management.</p>
                <div class="space-y-2 mb-4">
                    <div class="flex justify-between items-center">
                        <span class="bg-green-100 text-green-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-map-marker-alt mr-1"></i>Work From Home
                        </span>
                        <span class="bg-purple-100 text-purple-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-calendar-alt mr-1"></i>3 months
                        </span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="bg-red-100 text-red-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-money-bill-wave mr-1"></i>Unpaid
                        </span>
                        <span class="urgency-badge px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-clock mr-1"></i>Apply by 14 Oct 2025
                        </span>
                    </div>
                </div>
                <div class="space-y-3">
                    <a href="https://in.jobsii.com/2f3ES" target="_blank" 
                       class="w-full bg-gradient-to-r from-red-500 to-pink-600 hover:from-red-600 hover:to-pink-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg flex items-center justify-center">
                        <i class="fas fa-external-link-alt mr-2"></i>Open Now
                    </a>
                    <form action="InternshipApplyServlet" method="post" class="w-full">
                        <input type="hidden" name="internshipType" value="backend">
                        <input type="hidden" name="internshipTitle" value="Backend Developer Internship">
                        <input type="hidden" name="company" value="Backend Solutions">
                        <button type="submit" 
                                class="w-full bg-gradient-to-r from-green-500 to-teal-600 hover:from-green-600 hover:to-teal-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg flex items-center justify-center">
                            <i class="fas fa-paper-plane mr-2"></i>Apply Now
                        </button>
                    </form>
                </div>
            </div>

            <!-- Internship Card 5: Full Stack Development with Gen AI -->
            <div class="internship-card bg-white rounded-2xl p-6 shadow-lg border border-gray-100">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-indigo-100 rounded-lg flex items-center justify-center mr-4">
                        <i class="fas fa-robot text-indigo-600 text-xl"></i>
                    </div>
                    <div>
                        <h3 class="text-xl font-bold text-gray-900">Full Stack Development with Gen AI</h3>
                        <p class="text-gray-600">AccioJob Program</p>
                    </div>
                </div>
                <p class="text-gray-700 mb-4">Master Full Stack Development with Gen AI. 2000+ Students Placed. Pay after Placement Program.</p>
                <div class="space-y-2 mb-4">
                    <div class="flex justify-between items-center">
                        <span class="bg-green-100 text-green-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-map-marker-alt mr-1"></i>Work From Home
                        </span>
                        <span class="bg-purple-100 text-purple-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-calendar-alt mr-1"></i>Flexible Duration
                        </span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="pay-scale px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-chart-line mr-1"></i>₹7.4 LPA Avg | ₹41 LPA Highest
                        </span>
                        <span class="bg-green-500 text-white px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-star mr-1"></i>Free Program
                        </span>
                    </div>
                </div>
                <div class="space-y-3">
                    <a href="https://go.acciojob.com/tQ9yBt" target="_blank" 
                       class="w-full bg-gradient-to-r from-indigo-500 to-purple-600 hover:from-indigo-600 hover:to-purple-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg flex items-center justify-center">
                        <i class="fas fa-external-link-alt mr-2"></i>Open Now
                    </a>
                    <form action="InternshipApplyServlet" method="post" class="w-full">
                        <input type="hidden" name="internshipType" value="genai">
                        <input type="hidden" name="internshipTitle" value="Full Stack Development with Gen AI">
                        <input type="hidden" name="company" value="AccioJob Program">
                        <button type="submit" 
                                class="w-full bg-gradient-to-r from-green-500 to-teal-600 hover:from-green-600 hover:to-teal-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg flex items-center justify-center">
                            <i class="fas fa-paper-plane mr-2"></i>Apply Now
                        </button>
                    </form>
                </div>
            </div>

            <!-- Internship Card 6: Digital Marketing -->
            <div class="internship-card bg-white rounded-2xl p-6 shadow-lg border border-gray-100">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-pink-100 rounded-lg flex items-center justify-center mr-4">
                        <i class="fas fa-bullhorn text-pink-600 text-xl"></i>
                    </div>
                    <div>
                        <h3 class="text-xl font-bold text-gray-900">Digital Marketing Intern</h3>
                        <p class="text-gray-600">Market Growers</p>
                    </div>
                </div>
                <p class="text-gray-700 mb-4">Execute digital marketing campaigns and analyze social media performance.</p>
                <div class="space-y-2 mb-4">
                    <div class="flex justify-between items-center">
                        <span class="bg-green-100 text-green-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-map-marker-alt mr-1"></i>Work From Home
                        </span>
                        <span class="bg-purple-100 text-purple-800 px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-calendar-alt mr-1"></i>2 months
                        </span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="pay-scale px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-money-bill-wave mr-1"></i>₹5,000 – ₹8,000 / Month
                        </span>
                        <span class="urgency-badge px-3 py-1 rounded-full text-sm font-medium">
                            <i class="fas fa-clock mr-1"></i>Apply by 24 Oct 2025
                        </span>
                    </div>
                </div>
                <div class="space-y-3">
                    <a href="https://in.jobsii.com/c8zd" target="_blank" 
                       class="w-full bg-gradient-to-r from-pink-500 to-rose-600 hover:from-pink-600 hover:to-rose-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg flex items-center justify-center">
                        <i class="fas fa-external-link-alt mr-2"></i>Open Now
                    </a>
                    <form action="InternshipApplyServlet" method="post" class="w-full">
                        <input type="hidden" name="internshipType" value="marketing">
                        <input type="hidden" name="internshipTitle" value="Digital Marketing Intern">
                        <input type="hidden" name="company" value="Market Growers">
                        <button type="submit" 
                                class="w-full bg-gradient-to-r from-green-500 to-teal-600 hover:from-green-600 hover:to-teal-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg flex items-center justify-center">
                            <i class="fas fa-paper-plane mr-2"></i>Apply Now
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-gradient-to-r from-purple-600 to-pink-600 text-white mt-20">
        <div class="container mx-auto px-6 py-8">
            <div class="text-center">
                <p>&copy; 2025 SkillEdu. All Rights Reserved.</p>
                <div class="flex justify-center space-x-6 mt-4">
                    <a href="#" class="text-white hover:text-gray-200 transition"><i class="fab fa-facebook fa-lg"></i></a>
                    <a href="#" class="text-white hover:text-gray-200 transition"><i class="fab fa-twitter fa-lg"></i></a>
                    <a href="#" class="text-white hover:text-gray-200 transition"><i class="fab fa-linkedin fa-lg"></i></a>
                    <a href="#" class="text-white hover:text-gray-200 transition"><i class="fab fa-instagram fa-lg"></i></a>
                </div>
            </div>
        </div>
    </footer>

</body>
</html>