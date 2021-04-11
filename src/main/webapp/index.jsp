<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=initial-scale=1.0">
    <title>Home</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Arima+Madurai:wght@300&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="home.css">
<style>

.heading {
  position: absolute;
  top: -5px;
  left: 30px;
  font-size: 48px;
  font-family: "Times New Roman", Times, serif;
  color: white;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: right;
  color: #f2f2f2;
  text-align: right;
  padding: 70px 30px;
  text-decoration: none;
  font-size: 17px;
  
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}


.container {
  position: fixed;
  margin: 0px;
  width: 98.4%;
}

.container .btn1 {
  position: absolute;
  top: 412px;
  left: 250px;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  background-color: #555;
  color: white;
  font-size: 16px;
  padding: 12px 24px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  text-align: center;
}
.container .btn1:hover {
  background-color: black;
}

.container .btn2 {
  position: absolute;
  top: 300px;
  left: 300px;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  background-color: #555;
  color: white;
  font-size: 16px;
  padding: 70px 70px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  text-align: center;
}
.container .btn2:hover {
  background-color: black;
}

.container .btn3 {
  position: absolute;
  top: 300px;
  left: 700px;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  background-color: #555;
  color: white;
  font-size: 16px;
  padding: 70px 70px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  text-align: center;
  
}
.container .btn3:hover {
  background-color: black;
}

.container .btn4 {
  position: absolute;
  top: 300px;
  left: 1100px;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  background-color: #555;
  color: white;
  font-size: 16px;
  padding: 70px 60px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  text-align: center;
}
.container .btn4:hover {
  background-color: black;
}
.h1 {
  position: absolute;
  top: 70px;
  left: 50px;
  font-size: 16px;
  font-family: "Times New Roman", Times, serif;
  color:white;
}
.h2 {
  position: absolute;
  top: 90px;
  left: 50px;
  font-size: 16px;
  font-family: "Times New Roman", Times, serif;
  color:white;
}
.h3 {
  position: absolute;
  top: 110px;
  left: 50px;
  font-size: 16px;
  font-family: "Times New Roman", Times, serif;
  color:white;
}

</style>
</head>

<body>

	<%@ page import="java.sql.*" %>

	<%
		String dbDriver = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql:// localhost:3306/";
		String dbName = "we_project";
		String dbUsername = "root";
		String dbPassword = "root12345";
		
		Class.forName(dbDriver);
		Connection con = DriverManager.getConnection(dbURL + dbName,dbUsername,dbPassword);
		Statement stmt = con.createStatement();
		
		String sql = "select * from profile";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
	%>
	
    <div class="heading"><%= rs.getString("firm_name") %></div>
    <div class="h1"><%= rs.getString("firm_address") %> </div>
    <div class="h2"> GSTIN - <%= rs.getString("firm_gst_no") %> </div>
    <div class="h3"> Contact - <%= rs.getString("firm_contact") %> </div>
    <div class = "topnav">
     	<a href="/web-engineering-project/profile">Edit Profile</a>
    
    </div>
    
     <div class="container">
	    <a href="/web-engineering-project/new">
	    	<button type="button" class="btn2" style="text-decoration: none; color:#ddd">NEW INVOICE</button>
	    </a>
	</div>
    <div class="container">
	    <a href="/web-engineering-project/inventory">
	    	<button type="button" class="btn3" style="text-decoration: none; color:#ddd">INVENTORY</button>
	    </a>
	</div>
	<div class="container">
	    <a href="/web-engineering-project/previousInvoices">
	    	<button type="button" class="btn4" style="text-decoration: none; color:#ddd">PREVIOUS INVOICES</button>
	    </a> 
    </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>