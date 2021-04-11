<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Invoice</title>

		<style>
			.invoice-box {
				max-width: 800px;
				margin: auto;
				padding: 30px;
				border: 1px solid #eee;
				box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
				font-size: 16px;
				line-height: 24px;
				font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
			}

			.invoice-box table {
				width: 100%;
				line-height: inherit;
				text-align: left;
			}

			.invoice-box table td {
				padding: 5px;
				vertical-align: top;
			}

			.invoice-box table tr td:nth-child(2) {
				text-align: right;
			}

			.invoice-box table tr.top table td {
				padding-bottom: 20px;
			}

			.invoice-box table tr.top table td.title {
				font-size: 45px;
				line-height: 45px;
			}

			.invoice-box table tr.information table td {
				padding-bottom: 40px;
			}

			.invoice-box table tr.heading td {
				background: #eee;
				border-bottom: 1px solid #ddd;
				font-weight: bold;
			}

			.invoice-box table tr.details td {
				padding-bottom: 20px;
			}

			.invoice-box table tr.item td {
				border-bottom: 1px solid #eee;
			}

			.invoice-box table tr.item.last td {
				border-bottom: none;
			}

			.invoice-box table tr.total td:nth-child(2) {
				border-top: 2px solid #eee;
				font-weight: bold;
			}

			@media only screen and (max-width: 600px) {
				.invoice-box table tr.top table td {
					width: 100%;
					display: block;
					text-align: center;
				}

				.invoice-box table tr.information table td {
					width: 100%;
					display: block;
					text-align: center;
				}
			}

			/** RTL **/
			.rtl {
				direction: rtl;
				font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
			}

			.rtl table {
				text-align: right;
			}

			.rtl table tr td:nth-child(2) {
				text-align: left;
			}
		</style>
	</head>

	<body>
		<%@ page import="java.sql.*" %>
		<%@ page import="java.util.HashMap" %>
		<%@ page import="java.util.Map" %>
		<%@ page import="java.util.Iterator" %>
		<%@ page import="java.util.Set" %>
		
		<%
		if(request.getParameter("invoiceID") != null)
			session.setAttribute("invoiceID",request.getParameter("invoiceID").substring(15));
		
		String dbDriver = "com.mysql.jdbc.Driver";
        String dbURL = "jdbc:mysql:// localhost:3306/";
        // Database name to access
        String dbName = "we_project";
        String dbUsername = "root";
        String dbPassword = "root12345";
  
        Class.forName(dbDriver);
        Connection con = DriverManager.getConnection(dbURL + dbName,dbUsername,dbPassword);
        Statement stmt = con.createStatement();
		String sql = "SELECT * FROM profile";
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
        String firmName = rs.getString("firm_name");
        String firmAddress = rs.getString("firm_address");
        String firmContact = rs.getString("firm_contact");
        String firmGST = rs.getString("firm_gst_no");
        stmt.close();
        
        Statement st = con.createStatement();
        sql = "select * from invoice where invoice_id = " + session.getAttribute("invoiceID");
        System.out.println(sql);       	
        rs = st.executeQuery(sql);
		rs.next();      
		%>
		
		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0">
				<tr class="top">
					<td colspan="2">
						<table>
							<tr>
								<td class="title">
									<h4 class="name-logo"><%= firmName %></h4>
								</td>

								<td>
									Invoice #: <%= rs.getInt("invoice_id") %><br />
									Created: <%= rs.getTimestamp("time_stamp") %><br />
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr class="information">
					<td colspan="2">
						<table>
							<tr>
								<td>
									<%= firmAddress %> <br />
									<%= firmContact %> <br />
									GST No. : <%= firmGST %>
								</td>

								<td>
									<%= rs.getString("client_name") %><br />
									<%= rs.getString("client_contact") %><br />
									GST No. : <%= rs.getString("client_gst_no") %>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
				<%
					String prodIds = rs.getString("prod_ids");
					String prodQty = rs.getString("prod_qty");
					double finalPrice = 0.0;
					HashMap<String, Integer> prodsMap = new HashMap<String, Integer>();
					String temp1 = "", temp2="";
					int inx=0;
					for(int i=0; i<prodIds.length(); i++){
						if(prodIds.charAt(i)!=',')
							temp1 += prodIds.charAt(i);
						else{
							temp2 = "";
							while(inx<prodQty.length()){
								if(prodQty.charAt(inx) == ','){
									inx++;
									break;
								}
								else 
									temp2 += prodQty.charAt(inx);
								inx++;
							}
							prodsMap.put(temp1, Integer.parseInt(temp2));
							temp1 = "";
						}
					}
					
				%>
				
				<tr class="heading">
					<td>Item</td>
					<td>Quantity</td>
					<td>Price</td>
				</tr>

				<%
					Iterator itr = prodsMap.entrySet().iterator();
					while(itr.hasNext()){
						Map.Entry mentry = (Map.Entry) itr.next();
						sql = "select prod_name, prod_sell_price from inventory where prodid = \"" + mentry.getKey() + "\"";
						ResultSet prodRS = st.executeQuery(sql);
						prodRS.next();
						
						double sellPrice = prodRS.getDouble("prod_sell_price");
						int qty = (int)mentry.getValue();
						finalPrice += sellPrice*qty;
						out.println("<tr class=\"item\">");
						out.println("<td>" + prodRS.getString("prod_name") + "</td>");
						out.println("<td>" + qty + "</td>");
						out.println("<td>" + sellPrice + "</td>");
						out.println("</tr>");
					}
					
					
				%>

				<tr class="total">
					<td></td>

					<td>Total: $<%= finalPrice %></td>
				</tr>
			</table>
		</div>
	</body>
</html>