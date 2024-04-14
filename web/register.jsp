<%-- 
    Document   : register
    Created on : 14-Apr-2024, 1:26:29 pm
    Author     : jagdish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration Page</title>
</head>
<body>
    <form action="" method="POST">
        <input type="text" name="name" placeholder="Name"><br>
        <input type="email" name="email" placeholder="Email"><br>
        <input type="password" name="password" placeholder="Password"><br>
        <input type="password" name="cpassword" placeholder="Confirm Password"><br>
        <input type="submit" value="Sign up"><br> 
    </form>
    Already have an Account? <a href="login.jsp">Login</a>
    <%@page import="java.sql.*,java.util.*"%>
    <% 
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String uname = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
    
        if(password.equals(cpassword)) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auction", "root", "");
                PreparedStatement pst = conn.prepareStatement("INSERT INTO user (u_name, u_email, password) VALUES (?, ?, ?)");
                pst.setString(1, uname);
                pst.setString(2, email);
                pst.setString(3, password); 
                int i = pst.executeUpdate();
                if (i > 0) {
    %>
                    <script>
                        alert("Thank you for registering! Please login to continue.");
                        window.location.href = "login.jsp";
                    </script>
    <%          
                } else {
    %>
                    <script>
                        alert("Registration failed. Please try again.");
                    </script>
    <%          
                }
            } catch (Exception e) {
                e.printStackTrace();
    %>
                <script>
                    alert("An error occurred: <%= e.getMessage() %>. Please try again later.");
                </script>
    <%      
            }
        } else {
    %>
            <script>
                alert("Passwords don't match");
            </script>
    <%      
        }
    }
    %>
</body>
</html>
