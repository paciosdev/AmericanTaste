<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page contentType="text/html; charset=UTF-8" import="it.unisa.model.UserBean,java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>
    
    <%
    Cart cart = (Cart)request.getSession().getAttribute("cart");
	if(cart == null) {
		cart = new Cart();
		request.getSession().setAttribute("cart", cart);
	}
	
	UserBean currentUser = (UserBean)request.getSession().getAttribute("currentSessionUser");
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
		<div class="tableContainer">
		<table class="cartTable">

		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
		
		<tr>
		<td><img src="VisualizzaImmagine?prodId=<%=beancart.getCode()%>" width="100" height="100"></td>
			<td><%=beancart.getName()%></td>
			<td><%if (beancart.getOccurrencies() > 0){ %><a href="product?action=deleteC&id=<%=beancart.getCode()%>"><img src="./assets/minus.png" width="25" height="25"></a> <%} %>
				<%if (beancart.getOccurrencies() < beancart.getQuantity()){ %> <a href="product?action=addC&id=<%=beancart.getCode()%>"><img src="./assets/add.png" width="25" height="25"></a><%} %>
			</td>
			<td>Qta: <%=beancart.getOccurrencies()%></td>
			<td>$<%=Math.round((beancart.getPrice()+beancart.getPrice()* beancart.getIva()/100) * beancart.getOccurrencies()*100) / 100%></td>
			
		</tr>
		
		<%} %>
	</table>	
		
		</div>
		
		<h2>Il totale e' <%=Math.round(cart.getTotalPrice() *100)/100%>$</h2>

	<%if (currentUser != null){ %>
			<h3><a href="ConfirmOrderPage.jsp">Checkout</a></h3>
		
	<%}else{ %>
			<h3><a href="product?action=checkout">Checkout</a></h3>
	<%} %>
	
		
	<% } if (cart.getProducts().isEmpty()){%>
	
	<h1>Carrello vuoto</h1>
	
	<%} %>
	
	 <jsp:include page="footer.jsp" />
	 
	
	
</body>
</html>