/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updatePassword")
public class passwordChange extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user input from the form
        String currentPassword = request.getParameter("current_password");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");

        // Retrieve user ID from session
        HttpSession session = request.getSession();
        String currentUID = (String) session.getAttribute("u_id");

        // Establish database connection
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Your database connection code goes here
            String url = "jdbc:mysql://localhost:3306/auction";
            String username = "root";
            String dbPassword = "";
            conn = DriverManager.getConnection(url, username, dbPassword);
            
            // Query to retrieve current password from the database
            String query = "SELECT password FROM user WHERE u_id=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, currentUID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");

                // Check if current password matches
                if (passwordsMatch(storedPassword, currentPassword)) {
                    // Check if new password matches confirmation
                    if (newPassword.equals(confirmPassword)) {
                        // Update password
                        updatePassword(newPassword, currentUID, response.getWriter(), conn, response);
                    } else {
                        response.getWriter().println("<p>New password and confirmation do not match.</p>");
                    }
                } else {
                    response.getWriter().println("<p>Current password is incorrect.</p>");
                }
            } else {
                response.getWriter().println("<p>User not found.</p>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the database resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to check if passwords match
    private boolean passwordsMatch(String storedPassword, String enteredPassword) {
        return storedPassword.equals(enteredPassword);
    }

    // Method to update password
    private void updatePassword(String newPassword, String currentUID, PrintWriter out, Connection conn,
            HttpServletResponse response) throws SQLException, IOException {
        PreparedStatement pstmt = null;
        try {
            // Update user's password in the database
            String updateQuery = "UPDATE user SET password=? WHERE u_id=?";
            pstmt = conn.prepareStatement(updateQuery);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, currentUID);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<p>Password updated successfully!</p>");
                response.sendRedirect("updatePassword.jsp?message=success");
            } else {
                out.println("<p>Error updating password.</p>");
            }
        } finally {
            // Close the PreparedStatement
            if (pstmt != null) {
                pstmt.close();
            }
        }
    }
}
