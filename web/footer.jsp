<%-- 
    Document   : footer
    Created on : 15-Apr-2024, 7:42:07 pm
    Author     : ommeg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="container-fluid bg-secondary text-dark mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <a href="" class="text-decoration-none">
                <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">E</span>Auction</h1>
            </a>
            <p>Welcome to E-Auction, your premier destination for online auctions. Explore our wide range of products and start bidding today!</p>
            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Nirma University, Ahmedabad, India</p>
            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@eauction.com</p>
            <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+91 8141287725</p>
        </div>
        <div class="col-lg-8 col-md-12">
            <div class="row">
                <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Products</a>
                        <!--                        <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>-->
                        <% if (session.getAttribute("u_email") != null) {%>
                        <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                        <% } %>
                        <!--                        <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>-->
                        <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4">Categories</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a href="electronics.jsp" class="nav-item nav-link"><i class="fa fa-angle-right mr-2"></i>Electronics</a>
                        <a href="vehicles.jsp" class="nav-item nav-link"><i class="fa fa-angle-right mr-2"></i>Vehicles</a>
                        <a href="realestate.jsp" class="nav-item nav-link"><i class="fa fa-angle-right mr-2"></i>Real Estate</a>
                        <a href="artandantique.jsp" class="nav-item nav-link"><i class="fa fa-angle-right mr-2"></i>Art & Antiques</a>
                        <a href="jwelleryandwatches.jsp" class="nav-item nav-link"><i class="fa fa-angle-right mr-2"></i>Jewelry & Watches</a>
                        <a href="collectibles.jsp" class="nav-item nav-link"><i class="fa fa-angle-right mr-2"></i>Collectibles</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                    <form action="">
                        <div class="form-group">
                            <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                   required="required" />
                        </div>
                        <div>
                            <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row border-top border-light mx-xl-5 py-4">
        <div class="col-md-6 px-xl-0">
            <p class="mb-md-0 text-center text-md-left text-dark">
                &copy; <a class="text-dark font-weight-semi-bold" href="#">EAuction</a>. All Rights Reserved. Designed
                by
                <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">MCA Group</a><br>

            </p>
        </div>
        <div class="col-md-6 px-xl-0 text-center text-md-right">
            <img class="img-fluid" src="img/payments.png" alt="">
        </div>
    </div>
</div>