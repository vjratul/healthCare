<%-- 
    Document   : showStatus
    Created on : Aug 22, 2017, 5:15:28 AM
    Author     : maruf
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.jsp.jstl.sql.Result"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Types"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            table, td, th {    
                border: 1px solid #ddd;
                text-align: left;
            }

            table {
                border-collapse: collapse;
                width: 60%;
                height: 60%;
            }

            th, td {
                padding: 5px;
            }
            p.normal {
                font-variant: stylistic;
                color: chocolate;
            }

        </style>
    </head>
    <body>

        <%!
            Connection con;
            CallableStatement cst;
            Statement stmt;
            ResultSet res;
            int output_bphigh;
            int output_bplow;
            int output_pulse;
            int output_bloodsugar;
            int output_water;
            String userfullname;
            String userage;
        %>

         <%
            request.getSession();
            String date, patientName;
            int bpHigh, bpLow, pulse, sugar, water;
            patientName = (String) session.getAttribute("loginuser");

            try {

                Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "maruf", "shuvo007");
                stmt = con.createStatement();
                res = stmt.executeQuery("select * from patient_register where patientno='"+patientName+"'");
     
                if(res.next()){
                userfullname=res.getString("patientname");
                userage=res.getString("age");
        
     }
                cst = con.prepareCall("{? = call blood_pressure(?)}");
                cst.registerOutParameter(1, Types.INTEGER);
                cst.setString(2, patientName);
                cst.execute();
                output_bphigh = cst.getInt(1);

                cst = con.prepareCall("{? = call blood_pressure_low(?)}");
                cst.registerOutParameter(1, Types.INTEGER);
                cst.setString(2, patientName);
                cst.execute();
                output_bplow = cst.getInt(1);

                cst = con.prepareCall("{? = call pulse_average(?)}");
                cst.registerOutParameter(1, Types.INTEGER);
                cst.setString(2, patientName);
                cst.execute();
                output_pulse = cst.getInt(1);

                cst = con.prepareCall("{? = call blood_sugar_average(?)}");
                cst.registerOutParameter(1, Types.INTEGER);
                cst.setString(2, patientName);
                cst.execute();
                output_bloodsugar = cst.getInt(1);

                cst = con.prepareCall("{? = call water_average(?)}");
                cst.registerOutParameter(1, Types.INTEGER);
                cst.setString(2, patientName);
                cst.execute();
                output_water = cst.getInt(1);

            } catch (Exception ex) {
                out.print("xx" + ex);
            }


        %>




        <h2> Health Care</h2>

          
        <a href="showStatus.jsp">Home</a></div>
        <a href="dailyInfo.jsp">Daily Info</a></div>
        <a href="index.html">Health Status</a></div>
        <a href="index.html">User Profile</a></div>
        <a href="index.html">Contact</a></div>



<%        out.print("logged in as" + " userID (" + patientName + ")");
%>

<p class="normal">Report On : Mr.  <%=userfullname%>      <br>      Age :<%=userage%>years</p>

<h2>statistics of your recent health status </h2>

<table>
    <tr>
        <th>Blood Pressure High</th>
        <th>Blood Pressure Low</th>
        <th>Pulse</th>
        <th>Blood Sugar</th>
        <th>Water</th>
    </tr>
    <tr>
        <td> <%=output_bphigh%> </td>
        <td><%=output_bplow%> </td>
        <td><%=output_pulse%></td>
        <td><%=output_bloodsugar%></td>
        <td><%=output_water%></td>
    </tr>
    <tr>

    </tr>
    <tr>

    </tr>
    <tr>

    </tr>
</table>

<%! 
    String showbp;
    String showpulse;
    String showbloodsugar;
    String showwater;

%>

<%
                cst = con.prepareCall("{? = call blood_pressure_final(?)}");
                cst.registerOutParameter(1, Types.VARCHAR);
                cst.setString(2, patientName);
                cst.execute();
                showbp= cst.getString(1);
                
                cst = con.prepareCall("{? = call pulse_final(?)}");
                cst.registerOutParameter(1, Types.VARCHAR);
                cst.setString(2, patientName);
                cst.execute();
                showpulse= cst.getString(1);
                
                cst = con.prepareCall("{? = call blood_sugar_final(?)}");
                cst.registerOutParameter(1, Types.VARCHAR);
                cst.setString(2, patientName);
                cst.execute();
                showbloodsugar= cst.getString(1);
                
                 cst = con.prepareCall("{? = call water_final(?)}");
                cst.registerOutParameter(1, Types.VARCHAR);
                cst.setString(2, patientName);
                cst.execute();
                showwater= cst.getString(1);
%>


<br>
<br>
<br>
<h2> your <%=showbp%></h2>
<h2> your <%=showpulse%></h2>
<h2> your <%=showbloodsugar%></h2>
<h2> <%=showwater%></h2>
</body>
</html>
