<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Show Customers</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>

    </head>
    <body>
        <div class="container-fluid mb-2">
            <div class="row border-top px-xl-5">
                <div class="col-lg-12">
                    <%@include file="admin_header.jsp" %>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px;
                   margin-top: -1px;
                   padding: 0 30px;">
                    <h6 class="m-0">Admin options</h6>

                </a>
                <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                        <a href="admin_dashboard.jsp" class="nav-item nav-link">Home</a>
                        <a href="show_winners.jsp" class="nav-item nav-link">Show Winners</a>
                        <a href="show_item.jsp" class="nav-item nav-link">Show items</a>
                        <a href="show_customers.jsp" class="nav-item nav-link">Show customers</a>
                    </div>
                </nav>
            </div>

            <div class="col-lg-9">
                <table id='tableToPrint'>
                    <thead>
                        <tr>
                            <th>User Id</th>
                            <th>User Name</th>
                            <th>User Email</th>
                            <th>User Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            // Retrieve data from database and populate table rows
                            try {
                                // Establish database connection
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auction", "root", "");
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT * FROM user");

                                // Iterate over the result set and generate table rows
                                while (rs.next()) {
                                    out.println("<tr>");
                                    out.println("<td>" + rs.getString("u_id") + "</td>");
                                    out.println("<td>" + rs.getString("u_name") + "</td>");
                                    out.println("<td>" + rs.getString("u_email") + "</td>");
                                    out.println("<td>" + rs.getString("address") + "</td>");
                                    out.println("</tr>");
                                }

                                // Close resources
                                rs.close();
                                stmt.close();
                                conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
<!--                <div class="print-button-container mt-3" >
                    <button class="btn btn-primary" onclick="printTableAsPDF()">Print Table as PDF</button>
                </div>-->
            </div>
        </div>

        <%@include file="footer.jsp" %>
        <script>
            function printTableAsPDF() {
                var table = document.getElementById("tableToPrint");

                var doc = new jsPDF();

                doc.autoTable({html: table});

                doc.save("Table.pdf");
            }
        </script>
    </body>
</html>
