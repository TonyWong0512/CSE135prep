<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CSE135</title>
</head>

<body>
<%
Connection conn=null;
Statement stmt=null;
try{Class.forName("org.postgresql.Driver");}catch(Exception e){System.out.println("Driver error");}
try
{
	String url="jdbc:postgresql://127.0.0.1:5432/CSE135";
	String user="postgres";
	String password="880210";
	conn =DriverManager.getConnection(url, user, password);
	stmt =conn.createStatement();
%>
	<form action="do_add.jsp" method="post">
	<table width="400px"  border="1px" align="center">		
		<tr align="center"><td width="30%"><B>X:</B></td><td align='left'><input type="text" name="x" id="x" size="30" ></td></tr>					           
		<tr align="center"><td width="30%"><B>Y:</B></td><td align='left'><input type="text" name="y" id="y" size="30" ></td></tr>
		<tr align="center"><td colspan="2"><input type="submit"></td></tr>
	</table>
	</form>
	<table width="400px" align="center" border="1">
	<tr align="center"><td width="50%">Table X</td><td width="50%">Table Y</td></tr>
	<tr align="center"><td>
	<%
	try
	{
		ResultSet rs=null;
		String value_x="", value_y="";
		rs=stmt.executeQuery("SELECT value FROM X");
		while(rs.next())
		{
			 value_x=rs.getString(1);
			 out.println(value_x+"<br>");
		}
	%>
	</td>
	<td>
	<%	
		rs=stmt.executeQuery("SELECT value FROM Y");
		while(rs.next())
		{
			 value_y=rs.getString(1);
			 out.println(value_y+"<br>");
		}	
	}
	catch(Exception e)
	{
		out.println("Can not read the tables X and Y.");
	}
	%>
	</td></tr>
	</table>	
<%
}
catch(Exception e)
{
	out.println("Sorry, can not access the database, please check the database status.<br><a href=\"index.jsp\" target=\"_self\">Try again</a>");
}
%>
		


</body>
</html>