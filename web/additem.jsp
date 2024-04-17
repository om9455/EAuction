<%-- 
    Document   : additem
    Created on : 17-Apr-2024, 1:55:01 pm
    Author     : jagdish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sell Product</title>
    </head>
    <body>
        <div class="container-fluid mb-2">
            <div class="row border-top px-xl-5">
                <div class="col-lg-12">
                    <%@include file="header.jsp" %>
                </div>
            </div>
        </div>

        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Sell Product</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="index.jsp">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Sell</p>
                </div>
            </div>
        </div>
        <div class="container d-flex justify-content-center align-items-center" style="height: 120vh;">
               
            
            <form method="POST">
                <div class="text-center mb-4">
                    <h2 class="section-title px-5"><span class="px-2">List your Product</span></h2>
                </div>
                <div class="mb-3">
                    <label for="itemName" class="form-label">Item Name</label>
                    <input type="text" class="form-control" name="itemName" id="itemName">
                </div>
                <div class="mb-3">
                    <label for="itemDescription" class="form-label">Item Description</label>
                    <textarea class="form-control" name="itemDescription" id="itemDescription" rows="3"></textarea>
                </div>
                <div class="mb-3">
                    <label for="itemCategory" class="form-label">Item Category</label>
                    <select class="form-select" name="itemCategory" id="itemCategory">
                        <option value="electronics">Electronics</option>
                        <option value="vehicles">Vehicles</option>
                        <option value="real estate">Real Estate</option>
                        <option value="art and antique">Art & Antiques</option>
                        <option value="jewelry and watches">Jewelry & Watches</option>
                        <option value="collectables">Collectables</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="itemImage" class="form-label">Item Image</label>
                    <input type="file" class="form-control" name="itemImage" id="itemImage">
                </div>
                <div class="mb-3">
                    <label for="itemBasePrice" class="form-label">Item Base Price</label>
                    <input type="number" class="form-control" name="itemBasePrice" id="itemBasePrice">
                </div>
                <div class="mb-3">
                    <label for="startTime" class="form-label">Start Time</label>
                    <input type="datetime-local" class="form-control" name="startTime" id="startTime">
                </div>
                <div class="mb-3">
                    <label for="endTime" class="form-label">End Time</label>
                    <input type="datetime-local" class="form-control" name="endTime" id="endTime">
                </div>
                <button type="submit" class="btn btn-primary">Add Item</button>

            </form>
        </div>




        <%@ page import="java.sql.*,java.util.*,javax.servlet.*"%>
        <%@ page import="java.io.InputStream" %>

        <%
        // Check if the form is submitted
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            // Get form data
            String itemName = request.getParameter("itemName");
            String itemDescription = request.getParameter("itemDescription");
            String itemCategory = request.getParameter("itemCategory");
            Part filePart = request.getPart("itemImage"); // Retrieve <input type="file" name="itemImage">
            InputStream itemImageStream = filePart.getInputStream(); // Get the input stream for the uploaded file
            int itemBasePrice = Integer.parseInt(request.getParameter("itemBasePrice"));
            String startTime = request.getParameter("startTime");
            String endTime = request.getParameter("endTime");
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
                ps.setBlob(4, itemImageStream); // Set the image as a blob
                ps.setInt(5, itemBasePrice);
                ps.setString(6, startTime);
                ps.setString(7, endTime);

                // Execute the query
                int rowsAffected = ps.executeUpdate();

                // Check if the insertion was successful
                if (rowsAffected > 0) {
                    out.println("<script>alert('Item added successfully');</script>");
                    response.sendRedirect("home.jsp");
                } else {
                    out.println("<script>alert('Failed to add item');</script>");
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
        %>

        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!--             Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!--             Template Javascript -->
        <script src="js/main.js"></script>
       

    </body>
</html>

