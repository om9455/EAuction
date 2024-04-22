<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>My Wins</title>
    </head>

    <body>

        <div class="container-fluid mb-2">
            <div class="row border-top px-xl-5">
                <div class="col-lg-12">
                    <%@include file="header.jsp" %>
                </div>
            </div>
        </div>

        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">My Wins</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">My Auction Wins</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <%@ page import="java.sql.*" %>
        <%@ page import="java.util.Base64" %>
        <%@ page import="java.text.SimpleDateFormat" %>

        <!-- Main Content -->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <% 
                        // Assuming you have retrieved the current user's ID (u_id) and stored it in a variable named currentUserID
                        String currentUserID = (String) session.getAttribute("u_id"); // Replace this with the actual current user's ID

                        // Establish connection to the database
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            // Your database connection code here

                            // Make sure to replace the database connection details below
                            String url = "jdbc:mysql://localhost:3306/auction";
                            String username = "root";
                            String password = "";
                            Class.forName("com.mysql.jdbc.Driver");
                            conn = DriverManager.getConnection(url, username, password);

                            // Check if the database connection is successful
                            if (conn != null) {

                                // SQL query to retrieve the item details for the current user from the winners table
                                String query = "SELECT i.item_img, w.item_id, i.item_name, w.bid_amount " +
                                                "FROM winners w " +
                                                "INNER JOIN item i ON w.item_id = i.item_id " +
                                                "WHERE w.u_id = '" + currentUserID + "'";


                                stmt = conn.createStatement();
                                boolean queryExecuted = stmt.execute(query);

                                // Check if the query is executed successfully
                                if (queryExecuted) {
                                    rs = stmt.getResultSet();
                                }

                                // Loop through the result set and display the item details
                    %>
                    <div class="row">
                        <% while (rs.next()) { %>
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <% // Retrieve item details %>
                                <% Blob imageBlob = rs.getBlob("item_img"); %>
                                <% String itemName = rs.getString("item_name"); %>
                                <% double bidAmount = rs.getDouble("bid_amount"); %>


                                <% // Convert blob image to base64 format for display %>
                                <% byte[] imgBytes = imageBlob.getBytes(1, (int) imageBlob.length()); %>
                                <% String base64Image = Base64.getEncoder().encodeToString(imgBytes); %>

                                <img src="data:image/jpeg;base64, <%= base64Image %>" class="card-img-top" alt="Item Image">
                                <div class="card-body">
                                    <h5 class="card-title"><%= itemName %></h5>
                                    <p class="card-text">Your Bid Amount: <%= bidAmount %></p>
                                    <a href="enterauction.jsp?item_id=<%= rs.getInt("item_id") %>">View Details</a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div> <!-- End row -->
                    <% 
                            } else { // Failed to connect to the database
                                out.println("<p>Failed to connect to the database!</p>");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Close database connections
                            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>
                </div>
            </div>
        </div>
        <!-- End Main Content -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <%@include file="footer.jsp" %>
    </body>

</html>
