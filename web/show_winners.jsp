<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Show Winners</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
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
                <a href="" class="nav-item nav-link">Show Auctions details</a>
                <a href="show_customers.jsp" class="nav-item nav-link">Show customers</a>
                <a href="" class="nav-item nav-link">Show sold items</a>
                <a href="" class="nav-item nav-link">Logout</a>
            </div>
        </nav>
    </div>
    <div class="col-lg-9">
        <table id='tableToPrint'>
            <thead>
            <tr>
                <th>User Id</th>
                <th>User Name</th>
                <th>Item Id</th>
                <th>Item Name</th>
                <th>Bid Amount</th>
            </tr>
            </thead>
            <tbody>
            <%
                // Retrieve data from database and populate table rows
                try {
                    // Establish database connection
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auction", "root", "");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT w.u_id AS user_id, u.u_name AS user_name, i.item_id AS item_id,i.item_name AS item_name, w.bid_amount AS bid_amount FROM winners w INNER JOIN user u ON w.u_id = u.u_id INNER JOIN item i ON w.item_id = i.item_id");

                    // Iterate over the result set and generate table rows
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("user_id") + "</td>");
                        out.println("<td>" + rs.getString("user_name") + "</td>");
                        out.println("<td>" + rs.getString("item_id") + "</td>");
                        out.println("<td>" + rs.getString("item_name") + "</td>");
                        out.println("<td>" + rs.getString("bid_amount") + "</td>");
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
        <div class="print-button-container mt-3">
            <button class="btn btn-primary" onclick="DataTable()">Print Table</button>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.dataTables.js"></script>    
<script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.js"></script>    
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>    
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>    
<script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>    
<script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script> 
<script>
    new DataTable('#example', {
    layout: {
        topStart: {
            buttons: ['copy', 'csv', 'excel', 'pdf', 'print']
        }
    }
});
    }
</script>
</body>
</html>
