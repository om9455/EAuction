<%-- 
    Document   : login
    Created on : 14-Apr-2024, 1:06:22 pm
    Author     : jagdish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="" method="POST">
            <input type="email" name="email" placeholder="Email"><br>
            <input type="password" name="password" placeholder="Password"><br>
            <input type="submit" value="Login">
        </form>
        <a href="register.jsp">Create an account?</a>
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
                session.setAttribute("u_email", u_email);
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
    </body>
</html>
