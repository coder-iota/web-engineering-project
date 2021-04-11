<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  
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
	String method = request.getMethod();
	if(method == "post" || method.equals("POST")){

		String sql = "select max(invoice_id) from invoice";
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
        
        int invoiceID = rs.getInt(1)+1;
        String clientName = request.getParameter("clientName").toString();
        String clientGstNo = request.getParameter("GSTNo").toString();
        String clientContact = request.getParameter("clientContact").toString();
        sql = "select prodid from inventory";
	    rs = stmt.executeQuery(sql);
	    String prodIDs = "";
	    String prodQty = "";
	    while(rs.next()){
	    	if(request.getParameter(rs.getString("prodid")+"_flag") != null){
	    		prodIDs += rs.getString("prodid") + ",";
	    		prodQty += request.getParameter(rs.getString("prodid") + "_qty") + ",";
	    	}
	    }
	    
	    sql = "insert into invoice (invoice_id, client_name,time_stamp,client_contact,client_gst_no,prod_ids,prod_qty) values (";
	    sql += invoiceID + ",'";
	    sql += clientName +"',current_timestamp(),'";
	    sql += clientContact + "','" + clientGstNo + "','" + prodIDs + "','" + prodQty + "')";
        int ress  = stmt.executeUpdate(sql);
        session.setAttribute("invoiceID", invoiceID);
	    response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "/web-engineering-project/invoice");
	}
%>
 <div class="container">
  <h1>	Create New Invoice :</h1>
  <div class="card">
   <div class="card-body">
    <form action="/web-engineering-project/new" method="post">
	</br>
     <div class="form-group row">
      <label for="clientName" class="col-sm-2 col-form-label">Client Name</label>
      <div class="col-sm-7">
       <input type="text" class="form-control" name="clientName"
        placeholder="Enter Client Name">
      </div>
     </div>

     <div class="form-group row">
      <label for="GST NO." class="col-sm-2 col-form-label">GST Number</label>
      <div class="col-sm-7">
       <input type="text" class="form-control" name="GSTNo"
        placeholder="Enter GST NO.">
      </div>
     </div>
     <div class="form-group row">
      <label for="clientContact" class="col-sm-2 col-form-label">Client Contact Details</label>
      <div class="col-sm-7">
       <input type="text" class="form-control" name="clientContact"
        placeholder="Enter contact details.">
      </div>
     </div>
	 </br>
	 
	 <%
		 String sql = "select prodid, prod_name from inventory";
	     ResultSet rs = stmt.executeQuery(sql);
	     while(rs.next()){
	    	 String prodID = rs.getString("prodid");
	    	 String prodName = rs.getString("prod_name");
	    	 out.println("<div class=\"row\">");
	    	 out.println("<div class=\"col-6\">");
	    	 out.println("<label for=\""+ prodID +"\" class =\"col-form-label col-sm-2\">" + prodName + "</label>");
	    	 out.println("<input type=\"checkbox\"  name=\""+ prodID + "_flag" +"\">");
	    	 out.println("</div>");
	    	 out.println("<div class=\"col-6\">");
	    	 out.println("<div class=\"form-group row \">");
	    	 out.println("<label for=\"" + prodID +"_qty\"" +" class=\"col-sm-2 col-form-label\">Quantity</label>");
	    	 out.println("<div class=\"col-sm-5\">");
	    	 out.println("<input type=\"text\" class=\"form-control\" name=\""+ prodID + "_qty\"" + " placeholder=\"Quantity\">");
	    	 out.println("</div>");
	    	 out.println("</div>");
	    	 out.println("</div>");
	    	 out.println("</div>");
	     }

	 %>

     </br>

     <button type="submit" class="btn btn-primary">Submit</button>
    </form>
   </div>
  </div>
 </div>
</body>
</html>