<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
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
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Change Password</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="index.jsp">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Change Password</p>
                </div>
            </div>
        </div>
                 <%
    String message = request.getParameter("message");
    if (message != null && message.equals("success")) {
        %>
        <div class="alert alert-success" role="alert">
            Password Changed successfully!
        </div>
        <%
            }
        %>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form method="POST" action="passwordChange"> 
                        <div class="mb-3">
                            <label for="current_password" class="form-label">Current Password</label>
                            <input type="password" class="form-control" id="current_password" name="current_password" required>
                        </div>
                        <div class="mb-3">
                            <label for="new_password" class="form-label">New Password</label>
                            <input type="password" class="form-control" id="new_password" name="new_password" required>
                        </div>

                        <div class="mb-3">
                            <label for="confirm_password" class="form-label">Confirm Password</label>
                            <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
                        </div>
                        <button type="submit" class="btn btn-primary" disabled>Update Password</button>
                    </form>
                </div>
            </div>
        </div>

        <script>
            // Enable button only if new password and confirm password match
            document.getElementById("new_password").addEventListener("input", function () {
                var newPassword = document.getElementById("new_password").value;
                var confirmPassword = document.getElementById("confirm_password").value;
                var updateButton = document.querySelector("button[type='submit']");

                if (newPassword === confirmPassword) {
                    updateButton.disabled = false;
                } else {
                    updateButton.disabled = true;
                }
            });

            document.getElementById("confirm_password").addEventListener("input", function () {
                var newPassword = document.getElementById("new_password").value;
                var confirmPassword = document.getElementById("confirm_password").value;
                var updateButton = document.querySelector("button[type='submit']");

                if (newPassword === confirmPassword) {
                    updateButton.disabled = false;
                } else {
                    updateButton.disabled = true;
                }
            });
        </script>
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
        <%@include file="footer.jsp" %>
    </body>
</html>
