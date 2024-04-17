<%-- 
    Document   : login
    Created on : 14-Apr-2024, 1:06:22 pm
    Author     : jagdish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Login</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="index.jsp">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">login</p>
                </div>
            </div>
        </div>
        <div class="container d-flex justify-content-center align-items-center" style="height: 60vh;">

            <form method="POST">
                <div class="text-center mb-4">
                    <h2 class="section-title px-5"><span class="px-2">Login to enter Bidding</span></h2>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" id="exampleInputPassword1">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
                <a href="register.jsp" class="btn btn-link">Create an account?</a>
            </form>
        </div>

        <%@ page import="java.sql.*,java.util.*,javax.servlet.*"%>
        <%
 
if (session.getAttribute("u_email") != null) {
    // User is already logged in, redirect to index page
    response.sendRedirect("home.jsp");
} else {

if ("POST".equalsIgnoreCase(request.getMethod())){
    String u_email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auction", "root", "");

        String query = "SELECT * FROM user WHERE u_email=? AND password=?";
        ps = con.prepareStatement(query);
        ps.setString(1, u_email);
        ps.setString(2, password);
        rs = ps.executeQuery();

        if (rs.next()) {
            String u_name = rs.getString("u_name");
            session.setAttribute("u_email", u_email);
            session.setAttribute("u_name", u_name);
            response.sendRedirect("home.jsp");
        } else {
                
        %>              <script type="text/javascript">

            alert("please enter valid email adress");

        </script>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (con != null) con.close();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
            }
        }
        %>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <%@include file="footer.jsp" %>

    </body>

</html>
