<%-- 
    Document   : header
    Created on : 15-Apr-2024, 7:38:14 pm
    Author     : ommeg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

            <% if (session.getAttribute("u_email") != null) {%>
            <div class="container-fluid">

                <div class="row align-items-center py-3 px-xl-5">
                    <div class="col-lg-3 d-none d-lg-block">
                        <a href="home.jsp" class="text-decoration-none">
                            <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Auction</h1>
                        </a>
                    </div>
                    <div class="col-lg-6 col-6 text-left">
                        <form action="products.jsp" method="GET">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search by name" name="name">
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
                    </div>
                    <div class="col-lg-3 col-6 text-right">

                        <a href="mywins.jsp" class="btn border">
                            <i class="fas fa-shopping-cart text-primary"></i>
<!--                            <span class="badge">0</span>-->
                        </a>
                    </div>
                </div>
            </div>
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Auction</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <div class="nav-item dropdown">
                            <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown"><%= session.getAttribute("u_name") %>'s Profile</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="additem.jsp" class="dropdown-item">Sell</a>
                                <a href="updatePassword.jsp" class="dropdown-item">Update Password</a>
                                <a href="profile.jsp" class="dropdown-item">Update Profile</a>
                            </div>
                        </div>
                        <a href="home.jsp" class="nav-item nav-link active">Home</a>
                        <a href="shop.jsp" class="nav-item nav-link">Products</a>
                        <div class="nav-item dropdown">
                            <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown">Categories</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="electronics.jsp" class="dropdown-item">Electronics</a>
                                <a href="vehicles.jsp" class="dropdown-item">Vehicles</a>
                                <a href="realestate.jsp" class="dropdown-item">Real Estate</a>
                                <a href="artandantique.jsp" class="dropdown-item">Art & Antiques</a>
                                <a href="jwelleryandwatches.jsp" class="dropdown-item">Jewelry & Watches</a>
                                <a href="collectibles.jsp" class="dropdown-item">Collectibles</a>
                            </div>
                        </div>
                        <a href="contact.html" class="nav-item nav-link">Contact</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0">
                        <a href="logout.jsp" class="nav-item nav-link">Logout</a>

                    </div>
                </div>
            </nav>
            <%  }
          else{
            %>

            <div class="container-fluid">

                <div class="row align-items-center py-3 px-xl-5">
                    <div class="col-lg-3 d-none d-lg-block">
                        <a href="index.jsp" class="text-decoration-none">
                            <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Auction</h1>
                        </a>
                    </div>
                    <div class="col-lg-6 col-6 text-left">
                       <form action="products.jsp" method="GET">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search by name" name="name">
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
                    </div>
                    <!--        <div class="col-lg-3 col-6 text-right">
                                <a href="" class="btn border">
                                    <i class="fas fa-heart text-primary"></i>
                                    <span class="badge">0</span>
                                </a>
                                <a href="" class="btn border">
                                    <i class="fas fa-shopping-cart text-primary"></i>
                                    <span class="badge">0</span>
                                </a>
                            </div>-->
                </div>
            </div>
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Auction</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="index.jsp" class="nav-item nav-link">Home</a>
                        <a href="shop.jsp" class="nav-item nav-link">Shop</a>
                        <!--            <a href="detail.html" class="nav-item nav-link">Shop Detail</a>-->
                        <div class="nav-item dropdown">
                            <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown">Categories</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="electronics.jsp" class="dropdown-item">Electronics</a>
                                <a href="vehicles.jsp" class="dropdown-item">Vehicles</a>
                                <a href="realestate.jsp" class="dropdown-item">Real Estate</a>
                                <a href="artandantique.jsp" class="dropdown-item">Art & Antiques</a>
                                <a href="jwelleryandwatches.jsp" class="dropdown-item">Jewelry & Watches</a>
                                <a href="collectibles.jsp" class="dropdown-item">Collectibles</a>
                            </div>
                        </div>
                        <a href="contact.html" class="nav-item nav-link">Contact</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0">
                        <a href="login.jsp" class="nav-item nav-link">Login</a>
                        <a href="register.jsp" class="nav-item nav-link">Register</a>
                    </div>
                </div>
            </nav>

            <% } %>
