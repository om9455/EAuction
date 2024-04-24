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

    // Create date formatter for the times
    SimpleDateFormat dateFormatter = new SimpleDateFormat("MMM dd, yyyy HH:mm:ss");

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to the database
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

        // Create a statement
        stmt = conn.createStatement();

        // Get the search parameter
        String name = request.getParameter("name");

        // Construct the SQL query based on the search parameter
        String sql = "SELECT item_id, item_name, item_img, item_bprice, start_time, end_time FROM item WHERE item_name LIKE '%" + name + "%'";

        // Execute the query
        rs = stmt.executeQuery(sql);

        // Display the products
        while (rs.next()) {
            // Get product details
            int itemId = rs.getInt("item_id");
            String itemName = rs.getString("item_name");
            int itemBPrice = rs.getInt("item_bprice");
            byte[] imgData = rs.getBytes("item_img");
            String base64Image = Base64.getEncoder().encodeToString(imgData);
            long startTime = rs.getTimestamp("start_time").getTime();
            long endTime = rs.getTimestamp("end_time").getTime();

            // Determine the auction status
            String auctionStatus;
            long currentTime = System.currentTimeMillis();
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
            out.println("            <a href=\"productdetails.jsp?item_id=" + itemId + "\" class=\"btn btn-sm text-dark p-0\">");
            out.println("                <i class=\"fas fa-eye text-primary mr-1\"></i>View Detail");
            out.println("            </a>");
            out.println("            <a href=\"productdetails.jsp?item_id=" + itemId + "\" class=\"btn btn-sm text-dark p-0\">");
            out.println("                <i class=\"fas fa-gavel text-primary mr-1\"></i>Bid");
            out.println("            </a>");
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
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
