<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Employee</title>
<style type="text/css">
h1 {
	text-align: center;
}
</style>
</head>
<body>
<h1>Delete Employee</h1>
<hr style="width:100%; text-align:left; margin-left:0">
<%
	//Get the ssn from the request
	Enumeration en = request.getParameterNames();
	String paramName = (String)en.nextElement();
	String paramValue = request.getParameter(paramName);
	
	
	try {	
		//connect to the database
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String str = "DELETE FROM Employee WHERE ssn=" + paramValue;
		
		int result=stmt.executeUpdate(str);
		
		out.println("Employee deletion successful");
		
	}
	
	catch(Exception e){
		out.println("Employee deletion failed. Employee has been involved in a Reservation.");
	}
	
	
	
%>

<br>
	<form method="post" action="../AdminHome.jsp">
		<input type="submit" value="Return Home">
	</form>
<br>

</body>
</html>