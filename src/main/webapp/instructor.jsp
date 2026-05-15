<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Check if user is logged in
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Create instructors list
    class Instructor {
        public int id;
        public String name;
        public String expertise;
        public String experience;
        public String image;
        public String bio;
        public String email;
        
        Instructor(int id, String name, String expertise, String experience) {
            this.id = id;
            this.name = name;
            this.expertise = expertise;
            this.experience = experience;
            this.image = "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face";
            this.bio = "Experienced professional with " + experience + " in " + expertise + ".";
            this.email = name.toLowerCase().replace(" ", ".") + "@skilledu.com";
        }
    }

    List<Instructor> instructors = new ArrayList<>();
    instructors.add(new Instructor(1, "John Doe", "Full Stack Web Development", "8 years"));
    instructors.add(new Instructor(2, "Jane Smith", "UI/UX Design", "6 years"));
    instructors.add(new Instructor(3, "Alice Johnson", "Data Science & Machine Learning", "7 years"));
    instructors.add(new Instructor(4, "Bob Williams", "Digital Marketing", "5 years"));
    instructors.add(new Instructor(5, "Emma Brown", "Cloud Computing & AWS", "6 years"));
    instructors.add(new Instructor(6, "Michael Davis", "Cybersecurity & Ethical Hacking", "9 years"));
    instructors.add(new Instructor(7, "Sophia Wilson", "Mobile App Development", "5 years"));
    instructors.add(new Instructor(8, "David Lee", "Artificial Intelligence", "8 years"));
    instructors.add(new Instructor(9, "Olivia Taylor", "DevOps Engineering", "6 years"));
    instructors.add(new Instructor(10, "James Anderson", "Blockchain Development", "7 years"));
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SkillEdu - Instructors</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .instructor-card {
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .instructor-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }
        .nav-back {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-indigo-50 via-white to-pink-50 min-h-screen">

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

    <!-- Main Content -->
    <div class="container mx-auto px-6 py-12 max-w-7xl">
        <!-- Header -->
        <div class="text-center mb-16">
            <h1 class="text-5xl font-extrabold text-gray-900 mb-6">
                Meet Our <span class="text-transparent bg-clip-text bg-gradient-to-r from-purple-600 to-pink-600">Expert Instructors</span>
            </h1>
            <p class="text-gray-700 text-lg max-w-3xl mx-auto leading-relaxed">
                Learn from industry professionals who bring real-world experience and passion for teaching. 
                Our instructors are dedicated to helping you achieve your learning goals.
            </p>
        </div>

        <!-- Instructors Grid -->
        <div class="grid gap-8 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
            <% for(Instructor instructor : instructors) { %>
                <div class="instructor-card bg-white rounded-2xl p-6 shadow-lg border border-gray-100">
                    <!-- Instructor Image -->
                    <div class="flex justify-center mb-4">
                        <img src="<%= instructor.image %>" 
                             alt="<%= instructor.name %>" 
                             class="w-24 h-24 rounded-full object-cover border-4 border-purple-100 shadow-md">
                    </div>
                    
                    <!-- Instructor Info -->
                    <h3 class="text-xl font-bold text-gray-900 text-center mb-3"><%= instructor.name %></h3>
                    <div class="space-y-2 mb-4">
                        <p class="text-gray-700">
                            <i class="fas fa-graduation-cap text-purple-500 mr-2"></i>
                            <strong>Expertise:</strong> <%= instructor.expertise %>
                        </p>
                        <p class="text-gray-700">
                            <i class="fas fa-briefcase text-purple-500 mr-2"></i>
                            <strong>Experience:</strong> <%= instructor.experience %>
                        </p>
                        <p class="text-gray-600 text-sm">
                            <i class="fas fa-envelope text-purple-500 mr-2"></i>
                            <%= instructor.email %>
                        </p>
                    </div>
                    
                    <!-- Bio -->
                    <p class="text-gray-600 text-sm mb-6 leading-relaxed">
                        <%= instructor.bio %>
                    </p>
                    
                    <!-- Action Buttons -->
                    <div class="flex space-x-3">
                        <a href="instructor-details.jsp?id=<%= instructor.id %>" 
                           class="flex-1 bg-gradient-to-r from-purple-500 to-pink-500 hover:from-purple-600 hover:to-pink-600 text-white text-center font-semibold py-3 px-4 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg">
                            <i class="fas fa-user mr-2"></i>View Profile
                        </a>
                    </div>
                </div>
            <% } %>
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