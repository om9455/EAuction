<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Base64" %>
<!DOCTYPE html
    <html>
<head>
    <meta charset="utf-8">
    <title>EShopper - Bootstrap Shop Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax.com/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

    <style>
        /* Style for product images */
        .product-img img {
            width: 100%; /* Set image width to 100% of the container */
            height: 200px; /* Set a fixed height */
            object-fit: cover; /* Maintain aspect ratio and crop excess */
        }
        #timer-end{

            font-size: 2rem; /* Increase font size */
        }
    </style>
</head>
<body>
    <div class="container-fluid mb-5">
        <div class="row border-top px-xl-5">
            <div class="col-lg-12">
                <%@ include file="header.jsp" %>
            </div>
        </div>
    </div>

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

        // Get the product ID from the query parameter
        String productId = request.getParameter("item_id");

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

            // Create a statement
            stmt = conn.createStatement();
            
            String currentUserId = (String) request.getSession().getAttribute("u_id");

// Query to fetch the most recent bid


            // Query to fetch the product details based on the product ID
            String sql = "SELECT item_id, item_name, item_img, item_bprice, start_time, end_time, item_description FROM item WHERE item_id = '" + productId + "'";

            // Execute the query
            rs = stmt.executeQuery(sql);
            long endTime1=0; 
            // Check if the product exists
            if (rs.next()) {
                // Retrieve product details from the result set
                String itemName = rs.getString("item_name");
                int itemBPrice = rs.getInt("item_bprice");
                byte[] imgData = rs.getBytes("item_img");
                String base64Image = Base64.getEncoder().encodeToString(imgData);
                long startTime = rs.getTimestamp("start_time").getTime();
                long endTime = rs.getTimestamp("end_time").getTime();
                String description = rs.getString("item_description");
                endTime1=endTime;
                // Display product details
                out.println("<div class='container-fluid py-5'>");
                out.println("    <div class='row px-xl-5'>");
                out.println("        <div class='col-lg-5 pb-5'>");
                out.println("            <div id='product-carousel' class='carousel slide' data-ride='carousel'>");
                out.println("                <div class='carousel-inner border'>");
                out.println("                    <div class='carousel-item active'>");
                out.println("                        <img class='w-100' src='data:image/jpeg;base64," + base64Image + "' alt='Image'>");
                out.println("                    </div>");
                // Add more carousel items as needed using different images (if available)
                out.println("                </div>");
                out.println("                <a class='carousel-control-prev' href='#product-carousel' data-slide='prev'>");
                out.println("                    <i class='fa fa-2x fa-angle-left text-dark'></i>");
                out.println("                </a>");
                out.println("                <a class='carousel-control-next' href='#product-carousel' data-slide='next'>");
                out.println("                    <i class='fa fa-2x fa-angle-right text-dark'></i>");
                out.println("                </a>");
                out.println("            </div>");
                out.println("        </div>");
                out.println("        <div class='col-lg-7 pb-5'>");
                out.println("            <p>Time Until Auction Ends: <span id='timer-end'></span></p>");
                out.println("            <h3 class='font-weight-semi-bold'>" + itemName + "</h3><br>");
                out.println("            <h5 class='font-weight-semi-bold mb-4'>Auction Starting Price: $" + itemBPrice + "</h5>");
                out.println("            <p class='mb-4'>" + description + "</p>");
                // Display countdown timer for start and end times
                out.println("            <p>Time Until Auction Starts: <span id='timer-start'></span></p>");
                    
                out.println("            <br>");
                ResultSet lastBidRs = stmt.executeQuery("SELECT u_id FROM bids WHERE item_id = '" + productId + "' ORDER BY bid_time DESC LIMIT 1");
boolean isLastBidder = false;
if (lastBidRs.next()) {
String lastBidderId = lastBidRs.getString("u_id");
// Check if the current user is the last bidder
isLastBidder = currentUserId.equals(lastBidderId);
}

// Output the isLastBidder flag as a JavaScript variable
out.println("<script>");
out.println("var isLastBidder = " + isLastBidder + ";");
out.println("</script>");
                // Add bidding form
                out.println("            <form id='bidding-form' action='submitBid.jsp' method='POST'>");
                out.println("                <input type='hidden' name='item_id' value='" + productId + "'>");
                out.println("                <div class='form-group'>");
                out.println("                    <label for='bid'>Enter Your Bid:</label>");
                out.println("                    <input type='number' class='form-control' name='bid' id='bid' required min='" + itemBPrice + "'>");
                out.println("                </div>");
                out.println("                <button type='submit' class='btn btn-primary' id='bidButton'>Submit Bid</button>");
                out.println("            </form>");
//                    out.println("            <a href='enterAuction.jsp?item_id=" + productId + "&item_bprice=" + itemBPrice + "&end_time=" + endTime + "' class='btn btn-primary'>Enter Auction</a>");
                    
                out.println("        </div>");
                out.println("    </div>");
                out.println("</div>");
                    
                // Assume 'currentUserId' is the ID of the user currently viewing the page

                    
                    
                    
                    
                // JavaScript code for real-time countdown timer
                out.println("<script>");
                out.println("document.addEventListener('DOMContentLoaded', function() {");
                out.println("    var now = new Date().getTime();");
                out.println("    var startTime = new Date(" + startTime + ").getTime();");
                out.println("    var endTime = new Date(" + endTime + ").getTime();");
                
                
                
               
                    
                out.println("    function updateTimers() {");
                out.println("        var currentTime = new Date().getTime();");
                out.println("        var timeUntilStart = startTime - currentTime;");
                out.println("        var timeUntilEnd = endTime - currentTime;");
                    
                out.println("        function formatTime(time) {");
                out.println("            if (time <= 0) {");
                out.println("                return '00:00:00';");
                out.println("            }");
                out.println("            var hours = Math.floor(time / (1000 * 60 * 60));");
                out.println("            var minutes = Math.floor((time % (1000 * 60 * 60)) / (1000 * 60));");
                out.println("            var seconds = Math.floor((time % (1000 * 60)) / 1000);");
                out.println("            return hours.toString().padStart(2, '0') + ':' +");
                out.println("                   minutes.toString().padStart(2, '0') + ':' +");
                out.println("                   seconds.toString().padStart(2, '0');");
                out.println("        }");
                    
                // Display the time until start or end
                out.println("        if (timeUntilStart > 0) {");
                out.println("            document.getElementById('timer-start').innerText = formatTime(timeUntilStart);");
                out.println("            document.getElementById('timer-end').innerText = '';"); // Hide end timer
                out.println("            document.getElementById('bidButton').disabled = true;");
                out.println("        } else if (timeUntilEnd > 0) {");
                out.println("            document.getElementById('timer-end').innerText = formatTime(timeUntilEnd);");
                out.println("            document.getElementById('timer-start').innerText = '00:00:00';");
                out.println("            document.getElementById('bidButton').disabled = false;");
                out.println("            var bidButton = document.getElementById('bidButton');");
                out.println("                    if(isLastBidder) {");
                out.println("                           bidButton.disabled = true;");
                out.println("                    }");
                out.println("        } else {");
                out.println("            document.getElementById('timer-end').innerText = '00:00:00';");
                out.println("            document.getElementById('timer-start').innerText = '00:00:00';");
                out.println("            document.getElementById('bidButton').disabled = true;");
                out.println("        }");
                out.println("    }");
                out.println(" setInterval(updateTimers, 1000);");
                out.println("});");
                
                out.println("</script>");
            } else {
                // Display message if product not found
                out.println("<div class='container py-5'><h3>Product not found.</h3></div>");
            }
            ResultSet bidderRs;
                     // Query to fetch the highest bid
            bidderRs = stmt.executeQuery("SELECT b.bid_id, b.bid_amount, b.u_id, u.u_name " +
                                         "FROM bids b JOIN user u ON b.u_id = u.u_id " +
                                         "WHERE b.item_id = '" + productId + "' " +
                                         "ORDER BY b.bid_amount DESC, b.bid_time ASC LIMIT 1");

            if (bidderRs.next()) {
                // Retrieve the highest bid details
                String highestBidId = bidderRs.getString("bid_id");
                int highestBidAmount = bidderRs.getInt("bid_amount");
                String highestBidderId = bidderRs.getString("u_id");
                String highestBidderName = bidderRs.getString("u_name");
                    
                // Display the highest bid and its bidder
                out.println("<div class='container py-5'>");
                out.println("<h4>Highest Bidder for this Product</h4>");
                out.println("<p>Bidder Name: " + highestBidderName + "</p>");
                out.println("<p>Bid Amount: $" + highestBidAmount + "</p>");
                out.println("</div>");

                // Store the winner in the winners table only if the auction has ended
                if (System.currentTimeMillis() >= endTime1) {
                    // Insert the winner details into the winners table
                    String insertWinnerSql = "INSERT INTO winners (u_id, item_id, bid_id, bid_amount) VALUES (?, ?, ?, ?)";
                    PreparedStatement pstmt = conn.prepareStatement(insertWinnerSql);
                    pstmt.setString(1, productId);
                    pstmt.setString(2, highestBidderId);
                    pstmt.setString(3, highestBidId);
                    pstmt.setInt(4, highestBidAmount);
                    pstmt.executeUpdate();
                    pstmt.close();
                }
            }

            // Close the ResultSet for bidders
            if (bidderRs != null) {
                bidderRs.close();
            }
                            // Query to fetch the bid details based on the product ID
            String bidderSql = "SELECT b.bid_id, b.bid_amount, b.bid_time, u.u_name " +
                               "FROM bids b JOIN user u ON b.u_id = u.u_id " +
                               "WHERE b.item_id = '" + productId + "' " +
                               "ORDER BY b.bid_time DESC";

            // Execute the query
            bidderRs = stmt.executeQuery(bidderSql);

            // Check if there are bids for the product
            if (bidderRs.next()) {
                out.println("<div class='container py-5'>");
                out.println("<h4>All Bidders for this Product</h4>");
                out.println("<table class='table table-striped'>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>Bidder ID</th>");
                out.println("<th>Username</th>");
                out.println("<th>Bid Amount</th>");
                out.println("<th>Bid Time</th>");
                out.println("</tr>");
                out.println("</thead>");
                out.println("<tbody>");

                // Iterate through the results and display the bidders
                do {
                    String bidderId = bidderRs.getString("bid_id");
                    String username = bidderRs.getString("u_name");
                    int bidAmount = bidderRs.getInt("bid_amount");
                    Timestamp bidTime = bidderRs.getTimestamp("bid_time");

                    out.println("<tr>");
                    out.println("<td>" + bidderId + "</td>");
                    out.println("<td>" + username + "</td>");
                    out.println("<td>$" + bidAmount + "</td>");
                    out.println("<td>" + dateFormatter.format(bidTime) + "</td>");
                    out.println("</tr>");
                } while (bidderRs.next());

                out.println("</tbody>");
                out.println("</table>");
                out.println("</div>");
            } else {
                // Display message if no bids found
                out.println("<div class='container py-5'><h3>No bids found for this product.</h3></div>");
            }

       
        } catch (Exception e) {
            // Handle exceptions
            e.printStackTrace();
            out.println("<div class='container py-5'><h3>Error: " + e.getMessage() + "</h3></div>");
        } finally {
            // Close resources
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

    <%@ include file="footer.jsp" %>
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
