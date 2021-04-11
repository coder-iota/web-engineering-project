<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>

.container {
  position: fixed;
  margin: 0px;
  width: 98.4%;
}

.bgtest {
	background-color:#DCDCDC;
		
}
</style>
<meta charset="ISO-8859-1">
<title>Previous Invoices</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body class="mx-5 my-3">
<%@ page import="java.sql.*" %>
<h1>List of all previous Invoices</h1><br>
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
			out.print("<div class=\"card-body bgtest\">");
			out.print( rs.getString("invoice_id") + ".\t");
			out.println(rs.getString("client_name") + "\t\t");
			out.print("<br />");
			out.println(rs.getString("time_stamp").substring(0,10));
			out.print("<br />");
			out.print("<input class=\"btn btn-primary\" type=\"submit\" name=\"invoiceID\" value='See details of " + rs.getString("invoice_id") +" 'style={align:right;}>");
			out.print("</div>");
			out.print("</div>");
			out.print("<br />");
		}
%>
	
</form>
</body>
</html>