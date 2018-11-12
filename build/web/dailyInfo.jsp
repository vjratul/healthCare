<%-- 
    Document   : dailyInfo
    Created on : Aug 22, 2017, 4:23:27 AM
    Author     : maruf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Health Care</h2>
        
          
        <a href="showStatus.jsp">Home</a></div>
        <a href="dailyInfo.jsp">Daily Info</a></div>
        <a href="index.html">Health Status</a></div>
        <a href="index.html">User Profile</a></div>
        <a href="index.html">Contact</a></div>



        <form action="dailyInfoControl1.jsp"><br>
            Enter Date:<input type="text" name="date"><br>
            BP High:<input type="text" name="bph"><br>
            BP Low:<input type="text" name="bpl"><br>
            Pulse:<input type="text" name="pulse"><br>
            Blood Sugar:<input type="text" name="sugar"><br>
            water:<input type="text" name="water"><br>
            
           <input type="submit" value="save"><br>
              
            
            
            
        </form>
    </body>
</html>
