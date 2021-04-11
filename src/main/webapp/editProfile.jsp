<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Profile</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
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
	    
	    String sql = "update profile set ";
	    sql += "firm_name = '" + request.getParameter("firmName") + "',";
	    sql += "firm_address = '" + request.getParameter("address") + "',";
	    sql += "firm_contact = '" + request.getParameter("contactDetail") + "',";
	    sql += "firm_gst_no = '" + request.getParameter("GSTNo") + "'";
	    System.out.println(sql);
        int ress  = stmt.executeUpdate(sql);
	    response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "/web-engineering-project/");
	}
    
	String sql = "SELECT * FROM profile";
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
	%>


	<div class="container">
  <h1>	EDIT PROFILE :</h1>
  <div class="card">
   <div class="card-body">
    <form action="/web-engineering-project/profile" method="post">
	</br>
     <div class="form-group row">
      <label for="firmName" class="col-sm-2 col-form-label">Firm Name</label>
      <div class="col-sm-7">
       <input type="text" class="form-control" name="firmName" value=<%="'"+rs.getString("firm_name")+"'" %>>
      </div>
     </div>
	</br>
     <div class="form-group row">
      <label for="Address" class="col-sm-2 col-form-label">Address</label>
      <div class="col-sm-7">
       <input type="text" class="form-control" name="address" value=<%="'"+rs.getString("firm_address")+"'" %>">
      </div>
     </div>
	 </br>
	  <div class="form-group row">
      <label for="Contact-details" class="col-sm-2 col-form-label">Contact -detail</label>
      <div class="col-sm-7">
       <input type="text" class="form-control" name="contactDetail" value=<%="'"+rs.getString("firm_contact")+"'" %>>
      </div>
     </div>
     </br>
      <div class="form-group row">
      <label for="gstNo" class="col-sm-2 col-form-label">GST No.</label>
      <div class="col-sm-7">
       <input type="text" class="form-control" name="GSTNo" value=<%="'"+rs.getString("firm_gst_no")+"'" %>>
      </div>
     </div>

     
     </br>

     <button type="submit" class="btn btn-primary">Submit</button>
    </form>
   </div>
  </div>
 </div>

</body>
</html>