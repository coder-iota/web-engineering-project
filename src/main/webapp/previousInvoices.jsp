<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body class="mx-5 my-3">
<%@ page import="java.sql.*" %>
<h6>List of all previous Invoices</h6><br>
<form action="/web-engineering-project/invoice" method="GET">
	<%
		String dbDriver = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql:// localhost:3306/";
		// Database name to access
		String dbName = "we_project";
		String dbUsername = "root";
		String dbPassword = "root12345";
		
		Class.forName(dbDriver);
		Connection con = DriverManager.getConnection(dbURL + dbName,dbUsername,dbPassword);
		Statement stmt = con.createStatement();
		String sql = "SELECT * FROM invoice";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			out.print("<div class=\"card\">");
			out.print("<div class=\"card-body\">");
			out.print( rs.getString("invoice_id") + ".\t");
			out.print(rs.getString("time_stamp").substring(0,10) + "\t" + rs.getString("client_name") + "\t\t");
			out.print("<span><input type=\"submit\" name=\"invoiceID\" value='See details of " + rs.getString("invoice_id") +"'></span>");
			out.print("</div>");
			out.print("</div>");
		}
%>
	
</form>
</body>
</html>