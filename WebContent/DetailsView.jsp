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
<h2>Details</h2>
	<%
		if (product != null) {
	%>
	<table border="1">
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Action</th>
		</tr>
		<tr>
			<td><%=product.getCode()%></td>
			<td><%=product.getName()%></td>
			<td><%=product.getDescription()%></td>
			<td><%=product.getPrice()%></td>
			<td><%=product.getQuantity()%></td>
			<td><a href="product?action=addC&id=<%=id%>">Add to cart</a></td>
		</tr>
	</table>
		<%
		}
		%>
</body>
</html>