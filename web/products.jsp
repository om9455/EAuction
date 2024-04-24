<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Head content here -->
    </head>
    <body>
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-12">
                    <!-- Header included here -->
                    <%@include file="header.jsp" %>
                </div>
            </div>
        </div>
        <!-- Product Display Section -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <div class="col-lg-12 col-md-8">
                    <div class="row pb-3">
                        <%-- Java code to fetch and display products --%>
                        <%@include file="fetch_products.jsp" %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer included here -->
        <%@include file="footer.jsp" %>
    </body>
</html>
