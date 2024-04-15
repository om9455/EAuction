<%-- 
    Document   : header
    Created on : 15-Apr-2024, 7:38:14 pm
    Author     : ommeg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container-fluid">

    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a href="" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Auction</h1>
            </a>
        </div>
        <div class="col-lg-6 col-6 text-left">
            <form action="">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for products">
                    <div class="input-group-append">
                        <span class="input-group-text bg-transparent text-primary">
                            <i class="fa fa-search"></i>
                        </span>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-3 col-6 text-right">
            <a href="" class="btn border">
                <i class="fas fa-heart text-primary"></i>
                <span class="badge">0</span>
            </a>
            <a href="" class="btn border">
                <i class="fas fa-shopping-cart text-primary"></i>
                <span class="badge">0</span>
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
            <a href="index.html" class="nav-item nav-link active">Home</a>
            <a href="shop.html" class="nav-item nav-link">Shop</a>
            <a href="detail.html" class="nav-item nav-link">Shop Detail</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                <div class="dropdown-menu rounded-0 m-0">
                    <a href="electronics.jsp" class="dropdown-item">Electronics</a>
                    <a href="vehicles.jsp" class="dropdown-item">Vehicles</a>
                    <a href="real-estate.jsp" class="dropdown-item">Real Estate</a>
                    <a href="art-and-antique.jsp" class="dropdown-item">Art & Antiques</a>
                    <a href="jwellery-and-watches.jsp" class="dropdown-item">Jewelry & Watches</a>
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
