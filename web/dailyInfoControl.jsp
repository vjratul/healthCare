<%-- 
    Document   : dailyInfoControl
    Created on : Aug 22, 2017, 5:11:25 AM
    Author     : maruf
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%!
            Connection con;
            Statement stm;
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
                    
                    String query="insert into Daily_Report values('"+patientName+"','"+date+"',"+bpHigh+","+bpLow+","+pulse+","+sugar+","+water+")";
                    Class.forName("oracle.jdbc.OracleDriver");
                    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","maruf","shuvo007");
                    stm=con.createStatement();
                    stm.executeQuery(query);
                    out.print("data inserted");
                    stm.close();
                    con.close();
                }
                catch(Exception ex){
                out.print("xx"+ex);
                }
                















         %>
    </body>
</html>
