<%-- 
    Document   : logout
    Created on : 17-Apr-2024, 11:47:25 am
    Author     : jagdish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% // Invalidate the session if it exists
    if (request.getSession(false) != null) {
        request.getSession(false).invalidate(); // Invalidate the session
    }
    
    // Redirect the user to the login page after logout
    response.sendRedirect("login.jsp"); %>
