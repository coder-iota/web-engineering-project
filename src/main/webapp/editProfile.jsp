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
  <h1>	EDIT PROFILE :</h1>
  <div class="card">
   <div class="card-body">
    <form action="invoice.jsp" method="post">
	</br>
     <div class="form-group row">
      <label for="firmName" class="col-sm-2 col-form-label">Firm Name</label>
      <div class="col-sm-7">
       <input type="text" class="form-control" name="firmName"
        placeholder="Enter Firm Name">
      </div>
     </div>
	</br>
     <div class="form-group row">
      <label for="Address" class="col-sm-2 col-form-label">Address</label>
      <div class="col-sm-7">
       <input type="text" class="form-control" name="address"
        placeholder="Address">
      </div>
     </div>
	 </br>
	  <div class="form-group row">
      <label for="Contact-details" class="col-sm-2 col-form-label">Contact -detail</label>
      <div class="col-sm-7">
       <input type="text" class="form-control" name="contactDetail"
        placeholder="Contact-detail">
      </div>
     </div>
     </br>
      <div class="form-group row">
      <label for="gstNo" class="col-sm-2 col-form-label">GST No.</label>
      <div class="col-sm-7">
       <input type="text" class="form-control" name="GSTNo"
        placeholder="GST No.">
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