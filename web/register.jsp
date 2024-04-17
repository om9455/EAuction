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
        <div class="container-fluid mb-2">
            <div class="row border-top px-xl-5">
                <div class="col-lg-12">
                    <%@include file="header.jsp" %>
                </div>
            </div>
        </div>

        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Registration</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="index.jsp">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Register</p>
                </div>
            </div>
        </div>
        <div class="container d-flex justify-content-center align-items-center" style="height: 80vh;">

            <form method="POST">
                <div class="text-center mb-4">
                    <h2 class="section-title px-5"><span class="px-2">Register to our System</span></h2>
                </div>
                <div class="mb-3">
                    <label for="exampleInputName" class="form-label">Your Name</label>
                    <input type="text" class="form-control" name="name" id="exampleInputName" aria-describedby="nameHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" id="exampleInputPassword1">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" name="cpassword" id="exampleInputPassword1">
                </div>
                <div class="mb-3">
                    <label for="exampleInputAddress" class="form-label">Address</label>
                    <textarea class="form-control" name="address" id="exampleInputAddress" rows="3"></textarea>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
                <a href="login.jsp" class="btn btn-link">Login?</a>
            </form>
        </div>




        <%@page import="java.sql.*,java.util.*"%>
        <% 
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String uname = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String cpassword = request.getParameter("cpassword");
            String address = request.getParameter("address");
    
            if(password.equals(cpassword)) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auction", "root", "");
                    PreparedStatement pst = conn.prepareStatement("INSERT INTO user (u_name, u_email, password, address) VALUES (?, ?, ?, ?)");
                    pst.setString(1, uname);
                    pst.setString(2, email);
                    pst.setString(3, password); 
                    pst.setString(4, address);
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
        <%@include file="footer.jsp" %>
    </body>
</html>
