<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=initial-scale=1.0">
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Arima+Madurai:wght@300&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="home.css">

</head>
<body>
     <div class="profile">
    <span><u><h1> Royal Trading Firm </h1></u></span>
   
    <a href="newInvoice.jsp">
    	 <button type="button" class="btn btn-primary" style="margin:3px;">New Invoice</button>
    </a>
    <a href="editProfile.jsp">
    	<button type="button" class="btn btn-primary" style="margin: 3px">Edit Profile</button>
    </a>
    
    </div>

    <div class="latestInventories col-9 mx-auto">
        <div class="inventory_card">  card 1 </div>
        <div class="inventory_card">  card 2 </div>
        <div class="inventory_card">  card 3 </div>
    </div>

    <div class="d-grid gap-2 col-8 mx-auto">
	    <a href="inventory.jsp">
	    	<button class="btn btn-primary tabs" type="button">INVENTORY</button>
	    </a>
	    <a href="previousInvoices.jsp">
	    	<button class="btn btn-primary tabs" type="button">PREVIOUS INVOICES</button>
	    </a> 
    </div>
  
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>