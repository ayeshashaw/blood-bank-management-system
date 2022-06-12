<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Receiver</title>
</head><link rel="stylesheet" type="text/css" href="mystyle.css">
<body style="background-color: #85c5f2"><div style="align:center;">
<center>
 <div class="main">
        <div class="navbar">
            <div class="icon">
           <a href="#default" class="logo"><img class="logo" src="logo6.png"></a>
            </div>

            <div class="menu">
                <ul>
                   <li><a href="menu.html">HOME</a></li></li>
                    <li><a href="index.html">lOGIN</a></li>
                    <li><a href="donor.html">DONOR</a>
                    <li><a href="receiver.jsp">RECEIVER</a></li>
                    <li><a href="doctor.html">DOCTOR</a></li>
                    <li><a href="inventory.html">INVENTORY</a></li>
                     <li><a href="delete.jsp">DELETE</a></li></li>
                </ul>
            </div>

        </div>
<body>
<center>

<div class="center">
<h1> Enter Reciver Details</h1>
<form method="post" action="receiveraction.jsp">

  <div class="txt_field">
    <input type="text" required>
          <span></span>
   <label>Name</label>
        </div>
        <div class="txt_field">
          <input type="gender" required>
          <span></span>
          <label>Gender</label>
        </div>
         <div class="txt_field">
          <input type="text" required>
          <span></span>
          <label>Address</label>
        </div>
         <div class="txt_field">
          <input type="date" required>
          <span></span>
          <label>Date</label>
        </div>
         <div class="txt_field">
          <input type="number" required>
          <span></span>
          <label>Contact</label>
        </div>
Blood Group:
<select name="receiverbg">
<option>A+</option>
<option>A-</option>
<option>B+</option>
<option>B-</option>
<option>AB+</option>
<option>AB-</option>
<option>O-</option>
<option>O+</option>
</select><br><br>
<%
ResultSet doctornames=null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection
("jdbc:mysql://localhost:3306/ayesha?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","123456789");
//NOTE --> IN THE URL "bloodbank" IS THE NAME OF THE DATABASE. REPLACE THE  WORD "bloodbank" WITH THE DATABASE NAME TO CONNECT TO YOUR DATABASE.
Statement fetchdoctorname=con.createStatement() ;
doctornames=fetchdoctorname.executeQuery("select doctorname from doctor");
%>
Select Doctor name:
<select name="doclist">
<%  while(doctornames.next()){ %>
<option><%= doctornames.getString(1)%></option>
<% } %>
</select><br><br>
<%
}
catch(Exception e)
{
out.println(e);
}
%>
<%
ResultSet donorids=null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection
("jdbc:mysql://localhost:3306/ayesha?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","123456789");
Statement fetchdonorid=con.createStatement() ;
donorids=fetchdonorid.executeQuery("select id from donor");
%>
Select Donor id:
<select name="donlist">
<%  while(donorids.next()){ %>
<option><%= donorids.getString(1)%></option>
<% } %>
</select><br><br>
<%
}
catch(Exception e)
{
out.println(e);
}
%>
<input type="submit" value="Submit" />
<input type="reset" value="Cancel" />
</form><br><br>

</center>
</body>
</html>