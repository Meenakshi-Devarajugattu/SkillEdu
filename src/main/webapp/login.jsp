

	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <title>SkillSync Login</title>
	    <style>
	        body {
	            font-family: Arial, sans-serif;
	            background: linear-gradient(120deg, #8EC5FC, #E0C3FC);
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            height: 100vh;
	            margin: 0;
	        }
	        .login-container {
	            background-color: white;
	            padding: 30px 40px;
	            border-radius: 12px;
	            box-shadow: 0px 4px 12px rgba(0,0,0,0.2);
	            width: 360px;
	        }
	        h2 {
	            text-align: center;
	            margin-bottom: 25px;
	            color: #333;
	        }
	        .server-error {
	            color: #d9534f;
	            background-color: #f2dede;
	            border: 1px solid #ebccd1;
	            padding: 10px;
	            border-radius: 4px;
	            text-align: center;
	            margin-bottom: 20px;
	            font-weight: bold;
	        }
	        label {
	            font-weight: bold;
	            display: block;
	            margin-bottom: 5px;
	            color: #555;
	        }
	        input {
	            width: 100%;
	            padding: 10px;
	            margin: 6px 0 15px 0;
	            border: 1px solid #ccc;
	            border-radius: 6px;
	            outline: none;
	            box-sizing: border-box;
	        }
	        input:focus {
	            border-color: #5A67D8;
	            box-shadow: 0 0 5px rgba(90, 103, 216, 0.3);
	        }
	        .error {
	            color: red;
	            font-size: 13px;
	            margin-top: -10px;
	            margin-bottom: 10px;
	        }
	        button {
	            width: 100%;
	            padding: 12px;
	            background-color: #5A67D8;
	            color: white;
	            border: none;
	            border-radius: 6px;
	            font-size: 16px;
	            cursor: pointer;
	            transition: background-color 0.3s;
	        }
	        button:hover:not(:disabled) {
	            background-color: #4c51bf;
	        }
	        button:disabled {
	            background-color: #ccc;
	            cursor: not-allowed;
	        }
	        .links {
	            text-align: center;
	            margin-top: 20px;
	        }
	        .links a {
	            color: #5A67D8;
	            text-decoration: none;
	            font-weight: bold;
	            margin: 0 10px;
	        }
	        .links a:hover {
	            text-decoration: underline;
	        }
	        .demo-credentials {
	            background-color: #f8f9fa;
	            border: 1px solid #e9ecef;
	            border-radius: 6px;
	            padding: 15px;
	            margin-bottom: 20px;
	            font-size: 14px;
	        }
	        .demo-credentials h3 {
	            margin-top: 0;
	            color: #495057;
	        }
	    </style>
	</head>
	<body>
	<div class="login-container">
	    <h2>Login to SkillEdu</h2>
	
	    
	
	    <% 
	        String errorMsg = (String) request.getAttribute("errorMessage");
	        if (errorMsg != null) {
	    %>
	        <div class="server-error"><%= errorMsg %></div>
	    <% } %>
	
	    <form id="loginForm" action="LoginServlet" method="post" onsubmit="return validateForm()">
	        <label for="username">Username</label>
	        <input type="text" id="username" name="username" placeholder="Enter username" required>
	        <div class="error" id="usernameError"></div>
	
	        <label for="password">Password</label>
	        <input type="password" id="password" name="password" placeholder="Enter password" required>
	        <div class="error" id="passwordError"></div>
	
	        <button type="submit" id="loginBtn">Login</button>
	    </form>
	
	    <div class="links">
	        
	        <span>Don't have an account? <a href="register.jsp">Register here</a></span>
	    </div>
	</div>
	
	<script>
	    const username = document.getElementById("username");
	    const password = document.getElementById("password");
	    const loginBtn = document.getElementById("loginBtn");
	    const userError = document.getElementById("usernameError");
	    const passError = document.getElementById("passwordError");
	
	    const usernameRegex = /^[A-Za-z0-9]{6,}$/;
	    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,15}$/;
	
	    username.addEventListener("input", validateInputs);
	    password.addEventListener("input", validateInputs);
	
	    function validateInputs() {
	        const validUsername = usernameRegex.test(username.value);
	        const validPassword = passwordRegex.test(password.value);
	
	        userError.textContent = "";
	        passError.textContent = "";
	
	        if (!username.value) {
	            userError.textContent = "Enter username first";
	        } else if (username.value.length < 6) {
	            userError.textContent = "Username must be at least 6 characters long";
	        } else if (!/^[A-Za-z0-9]+$/.test(username.value)) {
	            userError.textContent = "Username must contain only letters and numbers";
	        }
	
	        if (password.value && !validPassword) {
	            passError.textContent = "Password must be 8-15 chars with uppercase, lowercase, digit & special character";
	        }
	
	        loginBtn.disabled = !(validUsername && validPassword);
	    }
	
	    function validateForm() {
	        const validUsername = usernameRegex.test(username.value);
	        const validPassword = passwordRegex.test(password.value);
	
	        if (!validUsername || !validPassword) {
	            validateInputs();
	            return false;
	        }
	
	        return true;
	    }
	
	    // Initial validation
	    validateInputs();
	</script>
	</body>
	</html>