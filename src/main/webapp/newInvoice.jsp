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
 <div class="container">
  <h1>	Create New Invoice :</h1>
  <div class="card">
   <div class="card-body">
    <form action="invoice.jsp" method="post">
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
	  <div class="row">
	  	 
		  <div class="col">
		  	<div class="dropdown show">
			  <a class="btn btn-secondary dropdown-toggle ml" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			     Product ID
			  </a>
	
			  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			    <a class="dropdown-item" href="#">Action</a>
			    <a class="dropdown-item" href="#">Another action</a>
			    <a class="dropdown-item" href="#">Something else here</a>
			  </div>
		  </div>
		  </div>
		  	 
		 
		 <div class="col-5">
		 	 <div class="form-group row ">
		      <label for="Quantity" class="col-sm-2 col-form-label">Quantity</label>
		      <div class="col-sm-5">
		      <input type="text" class="form-control" name="quantity"
		        placeholder="Quantity">
		      </div>
		      
	      </div>
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