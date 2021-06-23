<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="it.unisa.model.ProductModel" %>
    <%@ page import="it.unisa.model.Cart" %>
    <%@ page import="it.unisa.model.ProductBean" %>
    <%@ page import="it.unisa.model.ProductModelDS" %>
    
<%


Cart cart = (Cart)request.getSession().getAttribute("cart");
if(cart == null) {
	cart = new Cart();
	request.getSession().setAttribute("cart", cart);
}

final ProductModel model = new ProductModelDS();

int id = Integer.parseInt(request.getParameter("id"));

ProductBean product = model.doRetrieveByKey(id);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
 <jsp:include page="header.jsp" />

	<%
		if (product != null) {
	%>
	<div class="centerContainer">
		<div class="detailBox">
			<img src="VisualizzaImmagine?prodId=<%=product.getCode()%>" width="200" height="200">
			<div id="details">
				<h1><%=product.getName() %></h1>
				<h2><%=product.getDescription() %></h2>
				<h2>Tipo: <%=product.getType() %></h2>
				<h1><%=product.getPrice() %>$</h1>
				
				<a href="product?action=addC&id=<%=product.getCode()%>"><button id="addToCart">Add to Cart</button></a>
			</div>	
				
		</div>
		
	</div>
		<%
		}
		%>
			 <jsp:include page="footer.jsp" />
		
</body>
</html>