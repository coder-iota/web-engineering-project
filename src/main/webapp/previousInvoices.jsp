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
<div class="card">
	<div class="card-body">
		<p>Invoice Id</p>
		<p>12/01/2021   Client-Firm Name</p>
		<% session.setAttribute("invoiceId","1") ;%>
		<a href="invoices.jsp"></a><button>See Details</button></a>
	</div>
</div>
</body>
</html>