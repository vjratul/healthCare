<%-- 
    Document   : dailyInfoControl
    Created on : Aug 22, 2017, 5:11:25 AM
    Author     : maruf
--%>

<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Health Care</title>
    </head>
    <body>
        
        <%!
            Connection con;
            CallableStatement cst;
         %>   

         <%
             request.getSession();
             String date,patientName;
             int bpHigh,bpLow,pulse,sugar,water;
             patientName=(String)session.getAttribute("loginuser");
             date=request.getParameter("date");
             bpHigh=Integer.parseInt(request.getParameter("bph"));
             bpLow=Integer.parseInt(request.getParameter("bpl"));
             pulse=Integer.parseInt(request.getParameter("pulse"));
             sugar=Integer.parseInt(request.getParameter("sugar"));
             water=Integer.parseInt(request.getParameter("water"));
             

              try{
                    
           
                    Class.forName("oracle.jdbc.OracleDriver");
                    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","maruf","shuvo007");
                    cst=con.prepareCall("{CALL report_data(?,?,?,?,?,?,?)}");
                    cst.setString(1,date);
                    cst.setInt(2,bpHigh);
                    cst.setInt(3,bpLow);
                    cst.setInt(4,pulse);
                    cst.setInt(5,sugar);
                    cst.setInt(6,water);
                    cst.setString(7,patientName);
                    cst.execute();
                    cst.close();
                    con.close();
                    response.sendRedirect("showStatus.jsp");
                   
                }
                catch(Exception ex){
                out.print("xx"+ex);
                }
                
         
         %>
    </body>
</html>
