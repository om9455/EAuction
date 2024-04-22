/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class updateProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user input from the form
        String u_id = (String) request.getSession().getAttribute("u_id");
        String u_name = request.getParameter("u_name");
        String u_email = request.getParameter("u_email");
        String u_address = request.getParameter("address");

        // Establish database connection
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            String url = "jdbc:mysql://localhost:3306/auction";
            String username = "root";
            String dbPassword = "";
            conn = DriverManager.getConnection(url, username, dbPassword);

            // Retrieve existing user data from the database
            String query = "SELECT u_name, u_email, address FROM user WHERE u_id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, u_id);
            ResultSet rs = pstmt.executeQuery();

            // Check if the result set has data
            if (rs.next()) {
                // Compare form data with existing data and update if changed
                if (!u_name.equals(rs.getString("u_name")) || !u_email.equals(rs.getString("u_email")) || !u_address.equals(rs.getString("address"))) {
                    String updateQuery = "UPDATE user SET u_name=?, u_email=?, address=? WHERE u_id=?";
                    pstmt = conn.prepareStatement(updateQuery);
                    pstmt.setString(1, u_name);
                    pstmt.setString(2, u_email);
                    pstmt.setString(3, u_address);
                    pstmt.setString(4, u_id);
                    int rowsAffected = pstmt.executeUpdate();

                    if (rowsAffected > 0) {
                        response.getWriter().println("<p>Profile updated successfully!</p>");
                        response.sendRedirect("profile.jsp?message=success");

                    } else {
                        response.getWriter().println("<p>Error updating profile.</p>");
                    }
                } else {
                    response.getWriter().println("<p>No changes detected.</p>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<p>Error updating profile.</p>");
        } finally {
            // Close the database resources
            try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
