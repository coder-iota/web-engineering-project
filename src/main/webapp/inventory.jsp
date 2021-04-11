<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/inventory.css" />
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
	<h1>Inventory</h1>

<table class="responstable">
  
  <tr>
    <th>Product ID</th>
    <th >Product Name</span></th>
    <th>Quantity</th>
    <th>Selling Price</th>
  </tr>
  
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

	  String method = request.getMethod();
	  if(method == "post" || method.equals("POST")){
		    String sql = "select prodid from inventory";
		  	ResultSet rs = stmt.executeQuery(sql);
		  	boolean exists = false;
		  	while(!exists && rs.next())
		  		if(rs.getString("prodid").equals(request.getParameter("prodID")))
		  			exists=true;
		  	if(exists){
			    sql = "update inventory set ";
			    sql += "prod_name = '" + request.getParameter("prodName") + "',";
			    sql += "prod_qty = " + Integer.parseInt(request.getParameter("prodQty")) + ",";
			    sql += "prod_sell_price = " + Double.parseDouble(request.getParameter("prodSellPrice")) ;
			    sql += " where prodid='" + request.getParameter("prodID") + "'";
			    System.out.println(sql);
		        int ress  = stmt.executeUpdate(sql);
			    response.setStatus(response.SC_MOVED_TEMPORARILY);
		        response.setHeader("Location", "/web-engineering-project/inventory");
		  	} else{
		  		sql = "insert into inventory (prodid,prod_name,prod_qty,prod_sell_price) values (";
			    sql += "'" + request.getParameter("prodID") + "',";
			    sql += "'" + request.getParameter("prodName") + "',";
			    sql += Integer.parseInt(request.getParameter("prodQty")) + ",";
			    sql += Double.parseDouble(request.getParameter("prodSellPrice")) + ")";
			    System.out.println(sql);
		        int ress  = stmt.executeUpdate(sql);
			    response.setStatus(response.SC_MOVED_TEMPORARILY);
		        response.setHeader("Location", "/web-engineering-project/inventory");
		  	}
		  }
	  
	  String sql = "select * from inventory";
	  ResultSet rs = stmt.executeQuery(sql);
	  
	  while(rs.next()){
		  out.print("<tr>");
		  out.print("<td>" + rs.getString("prodid") + "</td>");
		  out.print("<td>" + rs.getString("prod_name") + "</td>");
		  out.print("<td>" + rs.getString("prod_qty") + "</td>");
		  out.print("<td>" + rs.getString("prod_sell_price") + "</td>");
		  out.print("</tr>");
	  }
	  
  %>
  
</table>

<form action="/web-engineering-project/inventory" method = "post">
	<input type="text" name="prodID" placeholder="Product ID">
	<input type="text" name="prodName" placeholder="Product Name">
	<input type="number" name="prodQty" placeholder="Product Quantity">
	<input type="text" name="prodSellPrice" placeholder="Selling Price">
	<input type="submit" name="submit" value="submit">
</form>

</body>
</html>