<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Registration Result</title>
</head>
<body>
<%
    String employee_id = request.getParameter("eid");
    String employee_name = request.getParameter("ename");
    String password = request.getParameter("epassword");
    String salary = request.getParameter("esalary");
    String gender = request.getParameter("egender");
    String experience = request.getParameter("experience");
    String[] langs = request.getParameterValues("languages");
    String district = request.getParameter("district");

    String languages = "";
    if (langs != null) {
        languages = String.join(",", langs);
    }

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("oracle.jdbc.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "meenakshi", "meenakshi");

        String sql = "INSERT INTO employee (eid, ename, epassword, esalary, egender, experience, languages, district) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        ps = con.prepareStatement(sql);

        ps.setInt(1, Integer.parseInt(employee_id));
        ps.setString(2, employee_name);
        ps.setString(3, password);
        ps.setInt(4, Integer.parseInt(salary));
        ps.setString(5, gender);
        ps.setString(6, experience);
        ps.setString(7, languages);
        ps.setString(8, district);

        int i = ps.executeUpdate();

        if (i > 0) {
            out.println("<h3 style='color:green;'>Employee Registered Successfully!</h3>");
        } else {
            out.println("<h3 style='color:red;'>Registration Failed. Try Again.</h3>");
        }
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    } finally {
        if (ps != null) try { ps.close(); } catch (Exception e) {}
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
%>

<br><a href="register.html">Go Back to Register Page</a>

</body>
</html>
