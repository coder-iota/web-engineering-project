
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<style>

.container1 {
  position: fixed;
  margin: 0px;
  width: 98.4%;
}

.container2 {
  position: fixed;
  margin: 0px;
  width: 98.4%;
  top: 500px;
}

.container3 {
  position: fixed;
  margin: 0px;
  width: 98.4%;
  top: 80px;
}

.heading1 {
  position: absolute;
  top: -5px;
  left: 550px;
  font-size: 48px;
  font-family: "Times New Roman", Times, serif;
  color: black;
}

input[type=text], select {
  width: 50%;
  padding: 0px 12px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 50%;
  background-color: #4CAF50;
  color: white;
  padding: 0px 12px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

</style>
</head>
<body>
<%@ page import="java.sql.*" %>
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
  %>


<div class="container1">
	<div class="heading1">Inventory</div>
</div>

<div class="container2">
	<form action="/web-engineering-project/inventory" method = "post">
	<input type="text" name="prodID" placeholder="Product ID">
	<input type="text" name="prodName" placeholder="Product Name">
	<input type="number" name="prodQty" placeholder="Product Quantity">
	<input type="text" name="prodSellPrice" placeholder="Selling Price">
	<input type="submit" name="submit" value="submit">
</form>
</div>
<div class="container3">
<table class="table table-dark table-hover">
    <thead>
        <th>
            Product ID
        </th>
        <th>
           Product Name 
        </th>
        <th>
            Quantity
        </th>
        <th>
            Selling Price
        </th>
       

    </thead>
    <tbody>
    <%
	  while(rs.next()){
		  out.print("<tr>");
		  out.print("<td>" + rs.getString("prodid") + "</td>");
		  out.print("<td>" + rs.getString("prod_name") + "</td>");
		  out.print("<td>" + rs.getString("prod_qty") + "</td>");
		  out.print("<td>" + rs.getString("prod_sell_price") + "</td>");
		  out.print("</tr>");
	  }

    %>
    </tbody>
      </table>
</div>
</body>
</html>