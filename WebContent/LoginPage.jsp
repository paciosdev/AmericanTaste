

<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.UserBean,it.unisa.model.Cart,it.unisa.model.OrderDAO,it.unisa.model.OrderBean"%>
<%
	UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
ArrayList<OrderBean> orders = new ArrayList<>();
if(currentUser != null){
	 orders = OrderDAO.doRetrieveAll(currentUser.getCf());
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
                                <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<title>Login Page</title>
			<link rel="stylesheet" href="style.css">
		
	</head>

	<body>
	 <jsp:include page="header.jsp" />
	
		<%
				if(currentUser != null){
			%>
		
		<form action="LogoutServlet">
			<button type="Submit">Logout</button>
		</form>
		
		<%
					if (orders != null){
				%>
		<div class="tableContainer">
		<table>
		<tr>
			<th>Order Id </th>
			<th>Data</th>
			<th>Azione</th>
		</tr>
		<%
			Iterator<?> it = orders.iterator();
				while (it.hasNext()) {
					OrderBean bean = (OrderBean) it.next();
		%>
		<tr>
			<td><%=bean.getOrderId()%></td>
			<td><%=bean.getDataOrdine()%></td>
			<td><a href="DetailOrderPage.jsp?orderId=<%=bean.getOrderId()%>&userId=<%=bean.getUserId()%>&dataOrdine=<%=bean.getDataOrdine().toString()%>">Dettagli</a></td>
		</tr>
		<%}} %>
	</table>
		</div>
		
		<%}else{ %>
		<div class="loginContainer">
			<form id="loginForm" name="loginForm" action="Login" onsubmit="return validateForm()">

			Please enter your username 		
			<input type="text" name="un"/><br>		
							
			Please enter your password
			<input type="password" name="pw"/><br>
			
			<button type="submit">Login</button>			
		
		</form>
		<br>Non sei registrato?
		<a href="./RegisterPage.jsp"><button value="Registrati">Registrati</button></a>
				<h2 id="errorMessage"></h2>
		</div>
		
			 <jsp:include page="footer.jsp" />
		<%} %>
		
		
		
		<script>
			function validateForm(){
				var username = document.forms["loginForm"]["un"].value;
				var password = document.forms["loginForm"]["pw"].value;
				
				if(username == "" || password == ""){
					document.getElementById("errorMessage").innerHTML = "Devi riempire tutti i campi!"; 
					return false
				}
			}
		</script>
	</body>
</html>
