import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/NewServlet")
@MultipartConfig
public class NewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String itemName = request.getParameter("itemName");
        String itemDescription = request.getParameter("itemDescription");
        String itemCategory = request.getParameter("itemCategory");
        Part filePart = request.getPart("itemImage");
        InputStream itemImageStream = filePart.getInputStream();
        int itemBasePrice = Integer.parseInt(request.getParameter("itemBasePrice"));
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");

        // Database connection variables
        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auction", "root", "");

            // Prepare SQL statement
            String query = "INSERT INTO item (item_name, item_description, item_category, item_img, item_bprice, start_time, end_time) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, itemName);
            ps.setString(2, itemDescription);
            ps.setString(3, itemCategory);
            ps.setBlob(4, itemImageStream);
            ps.setInt(5, itemBasePrice);
            ps.setString(6, startTime);
            ps.setString(7, endTime);

            // Execute the query
            int rowsAffected = ps.executeUpdate();

            // Check if the insertion was successful
            if (rowsAffected > 0) {
                response.getWriter().println("<script>alert('Item Listed Successfully');</script>");
                // Redirect to home.jsp after successful insertion
                response.sendRedirect("additem.jsp");
            } else {
                // Handle insertion failure
                response.getWriter().println("<script>alert('Failed to add item');</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
