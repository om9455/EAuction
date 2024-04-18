<%@page import="java.sql.*" %> 
<%@page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>EAuction</title>
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
        <!-- Topbar Start -->

        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-12">
                    <%@include file="header.jsp" %>
                    <div id="header-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active" style="height: 410px;">
                                <img class="img-fluid" src="img/carousel-1.jpg" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Fashionable Dress</h3>
                                        <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item" style="height: 410px;">
                                <img class="img-fluid" src="img/carousel-2.jpg" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Reasonable Price</h3>
                                        <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-prev-icon mb-n2"></span>
                            </div>
                        </a>
                        <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-next-icon mb-n2"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Featured Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured End -->
        <br><br><br>
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Categories</span></h2>
        </div>
        <!-- Categories Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <!-- Auction Category 1 -->
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <p class="text-right">15 Listings</p>
                        <a href="electronics.jsp" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="img/electronic.jpeg" alt="Electronics" style="width:100%; height:200px; object-fit:cover;">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Electronics</h5>
                    </div>
                </div>

                <!-- Auction Category 2 -->
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <p class="text-right">10 Listings</p>
                        <a href="vehicles.jsp" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="img/vehicles.jpg" alt="Vehicles" style="width:100%; height:200px; object-fit:cover;">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Vehicles</h5>
                    </div>
                </div>

                <!-- Auction Category 3 -->
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <p class="text-right">8 Listings</p>
                        <a href="realestate.jsp" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="img/realestate.jpg" alt="Real Estate" style="width:100%; height:200px; object-fit:cover;">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Real Estate</h5>
                    </div>
                </div>

                <!-- Auction Category 4 -->
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <p class="text-right">12 Listings</p>
                        <a href="artandantique.jsp" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="img/artsandantiques.jpg" alt="Art & Antiques" style="width:100%; height:200px; object-fit:cover;">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Art & Antiques</h5>
                    </div>
                </div>

                <!-- Auction Category 5 -->
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <p class="text-right">6 Listings</p>
                        <a href="collectibles.jsp" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="img/collectibles.jpg" alt="Collectibles" style="width:100%; height:200px; object-fit:cover;">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Collectibles</h5>
                    </div>
                </div>

                <!-- Auction Category 6 -->
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <p class="text-right">9 Listings</p>
                        <a href="jwelleryandwatches.jsp" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="img/jwelleryandwatches.jpg" alt="Jewelry & Watches" style="width:100%; height:200px; object-fit:cover;">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Jewelry & Watches</h5>
                    </div>
                </div>
            </div>
        </div>

        <!-- Categories End -->


        <!-- Offer Start -->
        <div class="container-fluid offer pt-5">
            <div class="row px-xl-5">
                <div class="col-md-6 pb-4">
                    <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                        <img src="img/offer-1.png" alt="">
                        <div class="position-relative" style="z-index: 1;">
                            <h1 class="mb-4 font-weight-semi-bold">Arts and Antiques</h1>
                            <h5 class="text-uppercase text-primary mb-3">5% off on winning bid amount</h5>
                            <a href="artandantique.jsp" class="btn btn-outline-primary py-md-2 px-md-3">Bid Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 pb-4">
                    <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                        <img src="img/offer-2.png" alt="">
                        <div class="position-relative" style="z-index: 1;">
                            <h1 class="mb-4 font-weight-semi-bold">Real Estate</h1>
                            <h5 class="text-uppercase text-primary mb-3">1% off on winning bid amount</h5>
                            <a href="realestate.jsp" class="btn btn-outline-primary py-md-2 px-md-3">Bid Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Offer End -->


        <!-- Products Start -->
<!--               <div class="container-fluid pt-5">
                    <div class="text-center mb-4">
                        <h2 class="section-title px-5"><span class="px-2">Featured Products</span></h2>
                    </div>
        
        <%@ page import="java.sql.*" %>
        <%@ page import="java.util.Base64" %>
        <%@ page import="java.text.SimpleDateFormat" %>
        
        <div class="row px-xl-5 pb-3">
//        <%
//           String dbUrl = "jdbc:mysql://localhost:3306/auction";
//            String dbUser = "root";
//            String dbPass = "";
//            
//            Connection conn = null;
//            Statement stmt = null;
//            ResultSet rs = null;
//    
//            SimpleDateFormat dateFormatter = new SimpleDateFormat("MMM dd, yyyy HH:mm:ss");
//    
//           try {
//                Class.forName("com.mysql.cj.jdbc.Driver");
//                
//                conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//                
//                stmt = conn.createStatement();
//                
//                String sql = "SELECT item_id, item_name, item_img, item_bprice, start_time, end_time FROM item WHERE item_type='featured'";
//                
//                rs = stmt.executeQuery(sql);
//               
//                long currentTime = System.currentTimeMillis();
//                
//                while (rs.next()) {
//                    String itemName = rs.getString("item_name");
//                    int itemBPrice = rs.getInt("item_bprice");
//                    
//                    byte[] imgData = rs.getBytes("item_img");
//                    String base64Image = Base64.getEncoder().encodeToString(imgData);
//                    
//                    long startTime = rs.getTimestamp("start_time").getTime();
//                    long endTime = rs.getTimestamp("end_time").getTime();
//                    
//                    String auctionStatus;
//                    if (currentTime < startTime) {
//                        auctionStatus = "Upcoming";
//                    } else if (currentTime >= startTime && currentTime <= endTime) {
//                        auctionStatus = "Ongoing";
//                    } else {
//                        auctionStatus = "Ended";
//                    }
//                    
//                    out.println("<div class=\"col-lg-3 col-md-6 col-sm-12 pb-1\">");
//                    out.println("    <div class=\"card product-item border-0 mb-4\">");
//                    out.println("    <div class=\"card-header product-img position-relative overflow-hidden bg-transparent border p-0\">");
//                    out.println("        <img class=\"img-fluid w-100\" src=\"data:image/jpeg;base64," + base64Image + "\" alt=\"Product Image\">");
//                    out.println("    </div>");
//                    out.println("        <div class=\"card-body border-left border-right text-center p-0 pt-4 pb-3\">");
//                    out.println("            <h6 class=\"text-truncate mb-3\">" + itemName + "</h6>");
//                    out.println("            <div class=\"d-flex justify-content-center\">");
//                    out.println("                <h6>Base Price: $" + itemBPrice + "</h6>");
//                    out.println("            </div>");
//                    out.println("            <div class=\"text-muted\">Start Time: " + dateFormatter.format(startTime) + "</div>");
//                    out.println("            <div class=\"text-muted\">End Time: " + dateFormatter.format(endTime) + "</div>");
//                    out.println("            <div class=\"text-muted\">Status: " + auctionStatus + "</div>");
//                    out.println("        </div>");
//                    out.println("        <div class=\"card-footer d-flex justify-content-between bg-light border\">");
//                    
//                    out.println("    <a href=\"productdetails.jsp?item_id=" + rs.getInt("item_id") + "\" class=\"btn btn-sm text-dark p-0\">");
//                        out.println("        <i class=\"fas fa-eye text-primary mr-1\"></i>View Detail");
//                        out.println("    </a>");
//                            // Modify the next line for the bid button
//                        out.println("    <a href=\"productdetails.jsp?item_id=" + rs.getInt("item_id") + "\" class=\"btn btn-sm text-dark p-0\">");
//                        out.println("        <i class=\"fas fa-gavel text-primary mr-1\"></i>Bid");
//                        out.println("    </a>");
//                    out.println("        </div>");
//                    out.println("    </div>");
//                    out.println("</div>");
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                out.println("Error: " + e.getMessage());
//            } finally {
//                if (rs != null) {
//                    rs.close();
//                }
//                if (stmt != null) {
//                    stmt.close();
//                }
//                if (conn != null) {
//                    conn.close();
//                }
//            }
//        %>
    </div>
            </div>-->
        <!-- Products End -->


        <!-- Subscribe Start -->
        <!--        <div class="container-fluid bg-secondary my-5">
                    <div class="row justify-content-md-center py-5 px-xl-5">
                        <div class="col-md-6 col-12 py-5">
                            <div class="text-center mb-2 pb-2">
                                <h2 class="section-title px-5 mb-3"><span class="bg-secondary px-2">Stay Updated</span></h2>
                                <p>Subscribe to get details of the latest products going live.</p>
                            
                            <form action="">
                                <div class="input-group">
                                    <input type="text" class="form-control border-white p-4" placeholder="Email Goes Here">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary px-4">Subscribe</button>
                                    </div>
                                </div>
                            </form>
                                </div>
                        </div>
                    </div>
                </div>-->
        <!-- Subscribe End -->




        <!-- Vendor Start -->
        <div class="container-fluid py-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">Our Sponsors</span></h2>
            </div>
            <div class="row px-xl-5">
                <div class="col">
                    <div class="owl-carousel vendor-carousel">
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-1.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-2.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-3.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-4.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-5.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-6.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-7.jpg" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="img/vendor-8.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Vendor End -->


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