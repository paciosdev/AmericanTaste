<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>
    
    <%
    Cart cart = (Cart)request.getSession().getAttribute("cart");
	if(cart == null) {
		cart = new Cart();
		request.getSession().setAttribute("cart", cart);
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
</head>
<body>
 <jsp:include page="header.jsp" />

<% if(cart != null && !cart.getProducts().isEmpty()) { %>
		<h2>Cart</h2>
		<table border="1">
		<tr>
			<th>Name</th>
			<th>Action</th>
			<th>Quantity</th>
			<th>Price</th>
		</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
		
		<tr>
			<td><%=beancart.getName()%></td>
			<td><a href="product?action=deleteC&id=<%=beancart.getCode()%>">Delete x1</a> <a href="product?action=addC&id=<%=beancart.getCode()%>">Add x1</a></td>
			<td><%=beancart.getOccurrencies()%></td>
			<td><%=(beancart.getPrice()+beancart.getPrice()* beancart.getIva()/100 )* beancart.getOccurrencies()  %></td>
			
		</tr>
		
		<%} %>
	</table>	
		<h2>Il totale e' <%=cart.getTotalPrice() %></h2>
		<h3><a href="product?action=checkout">Checkout</a></h3>
		
	<% } if (cart.getProducts().isEmpty()){%>
	
	<h1>Carrello vuoto</h1>
	
	<%} %>
	
	 <jsp:include page="footer.jsp" />
	
	
</body>
</html>