<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   import="java.util.*" errorPage="" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CSE135</title>
</head>

<body >
<a href="index.jsp" target="_self">Home</a>
<%
String x=null, y=null;
try 
{ 
	x	=	request.getParameter("x"); 
	y	=	request.getParameter("y"); 
}
catch(Exception e) 
{ 
	x	=	null; 
	y	=	null; 
	out.println("Sorry, can not receive the parameters x and y, please try again.<br><a href=\"index.jsp\" target=\"_self\">Try again</a>");
}


Connection conn=null;
Statement stmt=null;
try{Class.forName("org.postgresql.Driver");}catch(Exception e){System.out.println("Driver error");}
try
{
	String url="jdbc:postgresql://127.0.0.1:5432/cse135";
	String user="postgres";
	String password="postgres";
	conn =DriverManager.getConnection(url, user, password);
	stmt =conn.createStatement();
}
catch(Exception e)
{
	out.println("Sorry, can not access the database, please check the database status.<br><a href=\"index.jsp\" target=\"_self\">Try again</a>");
}

if(x!=null && y!=null)
{
	String  SQL_1="INSERT INTO X (value) VALUES('"+x+"');";
	String  SQL_2="INSERT INTO Y (value) VALUES('"+y+"');";	
	try
    {
		conn.setAutoCommit(false);
		stmt.execute(SQL_1);
		stmt.execute(SQL_2);
		conn.commit();
		conn.setAutoCommit(true);
		response.sendRedirect("index.jsp");
	}
	catch(Exception e)
	{
		out.println("Fail, can not insert into the database, please check the values! Please <a href=\"index.jsp\" target=\"_self\">try again</a>.");
		conn.rollback();
	}
	finally
	{
		conn.close();
	}
}
%>

</body>
</html>