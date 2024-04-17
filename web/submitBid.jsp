<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.logging.*" %>

<%
    // Database connection parameters
    String dbUrl = "jdbc:mysql://localhost:3306/auction";
    String dbUser = "root";
    String dbPass = "";

    // Retrieve form data
    String itemId = request.getParameter("item_id");
    int bidAmount = Integer.parseInt(request.getParameter("bid"));
    
    // Retrieve user ID from the session (assuming the user is logged in and their ID is stored in session)
    String userId = (String) session.getAttribute("u_id"); // Adjust key as per your implementation
    
    // Declare variables for database connection and statement
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to the database
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

        // SQL query to insert the new bid into the `bids` table
        String insertBidSql = "INSERT INTO bids (item_id, u_id, bid_amount, bid_time) VALUES (?, ?, ?, ?)";

        // Create a prepared statement
        pstmt = conn.prepareStatement(insertBidSql);

        // Set parameters for the insert query
        pstmt.setString(1, itemId);
        pstmt.setString(2, userId);
        pstmt.setInt(3, bidAmount);

        // Get the current time and format it as a timestamp
        LocalDateTime currentTime = LocalDateTime.now();
        pstmt.setTimestamp(4, Timestamp.valueOf(currentTime));

        // Execute the insert query
        int rowsInserted = pstmt.executeUpdate();

        // Check if the insertion was successful
        if (rowsInserted > 0) {
            // Redirect to a success page, or display a success message
            out.println("<script>alert('Bid Placed Successfully')</script>");
            response.setHeader("Refresh", "1;url=enterauction.jsp?item_id=" + itemId);
        } else {
            // Display an error message
            out.println("<p>Error placing bid. Please try again.</p>");
        }
    } catch (Exception e) {
        // Handle exceptions (e.g., display error message)
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        // Close resources
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>