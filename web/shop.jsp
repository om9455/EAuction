<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Shop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <style>
        .product-img img {
            width: 100%; /* Set image width to 100% of the container */
            height: 200px; /* Set a fixed height */
            object-fit: cover; /* Maintain aspect ratio and crop excess */
        }
    </style>
</head>

<body>
    <!-- Topbar Start -->

    <!-- Page Header End -->

    <div class="container-fluid mb-5">
        <div class="row border-top px-xl-5">
            <div class="col-lg-12">
                <%@include file="header.jsp" %>
            </div>
        </div>
    </div>
    <!-- Shop Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <!-- Shop Sidebar End -->

            <!-- Shop Product Start -->
            <div class="col-lg-12 col-md-8">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <form action="">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search by name" name="search">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <i class="fa fa-search"></i>
                                        </span>
                                    </div>
                                </div>
                            </form>
                            <div class="dropdown ml-4">
                                <button class="btn border dropdown-toggle" type="button" id="triggerId"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Sort by
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                    <a class="dropdown-item" href="?sort=latest">Latest</a>
                                    <a class="dropdown-item" href="?sort=baseprice">Base Price</a>
                                    <a class="dropdown-item" href="?sort=statusactive">Status Active</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%@ page import="java.sql.*" %>
                    <%@ page import="java.util.Base64" %>
                    <%@ page import="java.text.SimpleDateFormat" %>
                    <%
                        // Database connection parameters
                        String dbUrl = "jdbc:mysql://localhost:3306/auction";
                        String dbUser = "root";
                        String dbPass = "";

                        // Variables for the database connection and query results
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        // Create date formatters for the times
                        SimpleDateFormat dateFormatter = new SimpleDateFormat("MMM dd, yyyy HH:mm:ss");

                        try {
                            // Load the JDBC driver
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            // Connect to the database
                            conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

                            // Create a statement
                            stmt = conn.createStatement();

                            // Query to fetch the data
                            String sql = "SELECT item_id, item_name, item_img, item_bprice, start_time, end_time FROM item";

                            // Check if search query parameter is present
                            String searchQuery = request.getParameter("search");
                            if (searchQuery != null && !searchQuery.isEmpty()) {
                                sql += " WHERE item_name LIKE '%" + searchQuery + "%'";
                            }

                            // Check for sorting parameter
                            String sort = request.getParameter("sort");
                            if (sort != null) {
                                switch (sort) {
                                    case "latest":
                                        // No sorting needed for "Latest"
                                        break;
                                    case "baseprice":
                                        sql += " ORDER BY item_bprice ASC";
                                        break;
                                    case "statusactive":
                                        sql += " WHERE NOW() BETWEEN start_time AND end_time";
                                        break;
                                    default:
                                        // Default case: no sorting
                                }
                            }

                            // Execute the query
                            rs = stmt.executeQuery(sql);

                            // Get the current time
                            long currentTime = System.currentTimeMillis();

                            // Loop through the results and display the product cards
                            while (rs.next()) {
                                String itemName = rs.getString("item_name");
                                int itemBPrice = rs.getInt("item_bprice");

                                // Convert the image data to base64
                                byte[] imgData = rs.getBytes("item_img");
                                String base64Image = Base64.getEncoder().encodeToString(imgData);

                                // Get start and end times as long (milliseconds since epoch)
                                long startTime = rs.getTimestamp("start_time").getTime();
                                long endTime = rs.getTimestamp("end_time").getTime();

                                // Determine the auction status
                                String auctionStatus;
                                if (currentTime < startTime) {
                                    auctionStatus = "Upcoming";
                                } else if (currentTime >= startTime && currentTime <= endTime) {
                                    auctionStatus = "Ongoing";
                                } else {
                                    auctionStatus = "Ended";
                                }

                                // Display the product card
                                out.println("<div class=\"col-lg-4 col-md-6 col-sm-12 pb-1\">");
                                out.println("    <div class=\"card product-item border-0 mb-4\">");
                                out.println("    <div class=\"card-header product-img position-relative overflow-hidden bg-transparent border p-0\">");
                                out.println("        <img class=\"img-fluid w-100\" src=\"data:image/jpeg;base64," + base64Image + "\" alt=\"Product Image\">");
                                out.println("    </div>");
                                out.println("        <div class=\"card-body border-left border-right text-center p-0 pt-4 pb-3\">");
                                out.println("            <h6 class=\"text-truncate mb-3\">" + itemName + "</h6>");
                                out.println("            <div class=\"d-flex justify-content-center\">");
                                out.println("                <h6>Base Price: $" + itemBPrice + "</h6>");
                                out.println("            </div>");
                                out.println("            <div class=\"text-muted\">Start Time: " + dateFormatter.format(startTime) + "</div>");
                                out.println("            <div class=\"text-muted\">End Time: " + dateFormatter.format(endTime) + "</div>");
                                out.println("            <div class=\"text-muted\">Status: " + auctionStatus + "</div>");
                                out.println("        </div>");
                                out.println("        <div class=\"card-footer d-flex justify-content-between bg-light border\">");

                                // Change this section to replace "Add to Cart" with "Bid"
                                out.println("    <a href=\"productdetails.jsp?item_id=" + rs.getInt("item_id") + "\" class=\"btn btn-sm text-dark p-0\">");
                                out.println("        <i class=\"fas fa-eye text-primary mr-1\"></i>View Detail");
                                out.println("    </a>");
                                // Modify the next line for the bid button
                                out.println("    <a href=\"productdetails.jsp?item_id=" + rs.getInt("item_id") + "\" class=\"btn btn-sm text-dark p-0\">");
                                out.println("        <i class=\"fas fa-gavel text-primary mr-1\"></i>Bid");
                                out.println("    </a>");

                                out.println("        </div>");
                                out.println("    </div>");
                                out.println("</div>");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("Error: " + e.getMessage());
                        } finally {
                            // Close the resources
                            if (rs != null) {
                                rs.close();
                            }
                            if (stmt != null) {
                                stmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        }
                    %>

                </div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
    <!-- Shop End -->


    <!-- Footer Start -->
    <%@include file="footer.jsp" %>
    <!-- Footer End -->


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
</body>

</html>
