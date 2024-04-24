<%-- 
    Document   : admin_dashboard
    Created on : 17-Apr-2024, 4:10:04 pm
    Author     : Priyank
--%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
    </head>
    <body>
        <div class="container-fluid mb-2">
            <div class="row border-top px-xl-5">
                <div class="col-lg-12">
                    <%@include file="admin_header.jsp" %>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0">Admin options</h6>
                </a>
                <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                        <a href="admin_dashboard.jsp" class="nav-item nav-link">Home</a>
                        <a href="show_winners.jsp" class="nav-item nav-link">Show Winners</a>
                        <a href="show_item.jsp" class="nav-item nav-link">Show items</a>
                        <a href="" class="nav-item nav-link">Show Auctions details</a>
                        <a href="show_customers.jsp" class="nav-item nav-link">Show customers</a>
                    </div>
                </nav>
            </div>
            <div class="col-lg-3">
                <% 
                    // Retrieve the total number of users from the database
                    int totalUsers = 0; // Initialize totalUsers
                    try {
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auction", "root", "");

                        // Prepare SQL query to count total products
                        String sql = "SELECT COUNT(*) AS total_Users FROM user";
                        PreparedStatement statement = conn.prepareStatement(sql);

                        // Execute query
                        ResultSet resultSet = statement.executeQuery();
                        if (resultSet.next()) {
                            totalUsers = resultSet.getInt("total_Users");
                        }

                        // Close database resources
                        resultSet.close();
                        statement.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                <!-- Total users box -->
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Total Users</h5>
                        <p class="card-text"><%= totalUsers %></p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3">
                <% 
                    // Retrieve the total number of users from the database
                    int totalItems = 0; // Initialize totalUsers
                    try {
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auction", "root", "");

                        // Prepare SQL query to count total products
                        String sql = "SELECT COUNT(*) AS total_items FROM item";
                        PreparedStatement statement = conn.prepareStatement(sql);

                        // Execute query
                        ResultSet resultSet = statement.executeQuery();
                        if (resultSet.next()) {
                            totalItems = resultSet.getInt("total_items");
                        }

                        // Close database resources
                        resultSet.close();
                        statement.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                <!-- Total users box -->
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Total Items</h5>
                        <p class="card-text"><%= totalItems %></p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <% 
                    // Retrieve the total number of users from the database
                    int totalWinners = 0; // Initialize totalUsers
                    try {
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auction", "root", "");

                        // Prepare SQL query to count total products
                        String sql = "SELECT COUNT(*) AS total_winners FROM winners";
                        PreparedStatement statement = conn.prepareStatement(sql);

                        // Execute query
                        ResultSet resultSet = statement.executeQuery();
                        if (resultSet.next()) {
                            totalWinners = resultSet.getInt("total_winners");
                        }

                        // Close database resources
                        resultSet.close();
                        statement.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                <!-- Total users box -->
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Total Winners</h5>
                        <p class="card-text"><%= totalWinners %></p>
                    </div>
                </div>
        </div>
    </div>            
    <%@include file="footer.jsp" %>
</body>
</html>
