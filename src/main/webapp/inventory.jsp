<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inventory JSP</title>
</head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<body style="background-color: cornflowerblue"><div style="align:center;">
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
<%
//int bgid = 4000;
String bgname = request.getParameter("bgname");
float bgquantity = Float.valueOf(request.getParameter("bgquantity"));
try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/ayesha?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","123456789");
  //NOTE --> IN THE URL "bloodbank" IS THE NAME OF THE DATABASE. REPLACE THE  WORD "bloodbank" WITH THE DATABASE NAME TO CONNECT TO YOUR DATABASE.
    String sql="insert into inventory(id,bgname,quantity)values(?,?,?)";
    PreparedStatement preparestatement=con.prepareStatement(sql);
    preparestatement.setString(1,null);
    preparestatement.setString(2,bgname);
    preparestatement.setString(3,String.valueOf(bgquantity));
    preparestatement.execute();
	}
catch(SQLException e)
{
out.println("error in loading data");
out.println(e);
}
%>

<h1>INVENTORY</h1>

<table border="4">
<tr>
<td>Blood Group ID</td>
<td>Blood Group</td>
<td>Quantity</td>
</tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection connect = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/ayesha?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","123456789");
    Statement fetchdata = connect.createStatement();
    String sqlquery = "select * from inventory";
    ResultSet displaydata = fetchdata.executeQuery(sqlquery);
    while(displaydata.next())
    {%>
    <tr>
    <td><%=displaydata.getString("id") %></td>
    <td><%=displaydata.getString("bgname") %></td>
    <td><%=displaydata.getString("quantity") %></td>
    </tr>
    <%
    }
}catch(Exception e)
{
	System.out.println(e);
}
%>
</table>

</center>
</body>
</html>