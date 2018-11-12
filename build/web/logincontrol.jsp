<%-- 
    Document   : logincontrol
    Created on : Aug 26, 2017, 4:07:59 AM
    Author     : maruf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><%
        String userName;
        
        userName=request.getParameter("patientno");
        session.setAttribute("loginuser", userName);
        response.sendRedirect("showStatus.jsp");
                %>
    </body>
</html>
