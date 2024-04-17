<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Base64" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
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
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

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
        </style>
    </head>
    <body>
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-12">
                    <%@include file="header.jsp" %>
  
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

        // Query to fetch the product details based on the product ID
        String sql = "SELECT item_id, item_name, item_img, item_bprice, start_time, end_time, item_description FROM item WHERE item_id = '" + productId + "'";

        // Execute the query
        rs = stmt.executeQuery(sql);

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

            // Display product details
            out.println("<div class=\"container-fluid py-5\">");
            out.println("    <div class=\"row px-xl-5\">");
            out.println("        <div class=\"col-lg-5 pb-5\">");
            out.println("            <div id=\"product-carousel\" class=\"carousel slide\" data-ride=\"carousel\">");
            out.println("                <div class=\"carousel-inner border\">");
            out.println("                    <div class=\"carousel-item active\">");
            out.println("                        <img class=\"w-100 h-100\" src=\"data:image/jpeg;base64," + base64Image + "\" alt=\"Image\">");
            out.println("                    </div>");
            // Add more carousel items as needed using different images (if available)
            out.println("                </div>");
            out.println("                <a class=\"carousel-control-prev\" href=\"#product-carousel\" data-slide=\"prev\">");
            out.println("                    <i class=\"fa fa-2x fa-angle-left text-dark\"></i>");
            out.println("                </a>");
            out.println("                <a class=\"carousel-control-next\" href=\"#product-carousel\" data-slide=\"next\">");
            out.println("                    <i class=\"fa fa-2x fa-angle-right text-dark\"></i>");
            out.println("                </a>");
            out.println("            </div>");
            out.println("        </div>");
            out.println("        <div class=\"col-lg-7 pb-5\">");
            out.println("            <h3 class=\"font-weight-semi-bold\">" + itemName + "</h3>");
            out.println("            <div class=\"d-flex mb-3\">");
            // Add your rating and review logic here
            out.println("                <div class=\"text-primary mr-2\">");
            out.println("                    <small class=\"fas fa-star\"></small>");
            out.println("                    <small class=\"fas fa-star\"></small>");
            out.println("                    <small class=\"fas fa-star\"></small>");
            out.println("                    <small class=\"fas fa-star-half-alt\"></small>");
            out.println("                    <small class=\"far fa-star\"></small>");
            out.println("                </div>");
            out.println("                <small class=\"pt-1\">(50 Reviews)</small>");
            out.println("            </div>");
            out.println("            <h3 class=\"font-weight-semi-bold mb-4\">$" + itemBPrice + "</h3>");
            out.println("            <p class=\"mb-4\">" + description + "</p>");
            // Continue adding more HTML content for the product detail section as necessary.
            // You may want to add the size and color selection, add to cart button, and other product details.
            // For example:
            out.println("            <div class=\"d-flex mb-4\">");
            out.println("                <p class=\"text-dark font-weight-medium mb-0 mr-3\">Sizes:</p>");
            out.println("                <form>");
            // Add size selection radio buttons
            out.println("                    <div class=\"custom-control custom-radio custom-control-inline\">");
            out.println("                        <input type=\"radio\" class=\"custom-control-input\" id=\"size-1\" name=\"size\">");
            out.println("                        <label class=\"custom-control-label\" for=\"size-1\">XS</label>");
            out.println("                    </div>");
            // Add other size options...
            out.println("                </form>");
            out.println("            </div>");
            // Add other content such as colors, quantity selection, add to cart button, etc.
            out.println("        </div>");
            out.println("    </div>");
            // Add other content and product detail sections here...
            out.println("</div>");
        } else {
            out.println("<div class=\"container py-5\"><h3>Product not found.</h3></div>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<div class=\"container py-5\"><h3>Error: " + e.getMessage() + "</h3></div>");
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
<%@include file="footer.jsp" %>
    </body>
</html>