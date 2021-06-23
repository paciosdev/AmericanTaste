<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="it.unisa.model.UserBean"
	%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Storage DS/BF</title>
	<link rel="stylesheet" href="NewFile.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

 <jsp:include page="header.jsp" />
 <image class="img" src="./assets/banner.png">
 
 <%if (currentUser != null && currentUser.getIsAdmin()){%>
 	<h1><a href="AdminPanel.jsp">Open Admin Panel</a></h1>
 <%} %>
 
 	
 	<h2 class="title">I nostri prodotti</h2>

	<div class="searchBox">
		<form action="Ricerca">
		    <input name="searchField" type="text" placeholder="Ricerca...">
		    <input id="searchSubmit" type="submit" value="Cerca"/>
		</form>
	</div>
	
	<div class="wrapper">
  <%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
		<div class="productCell">
			<a href="DetailsView.jsp?id=<%=bean.getCode()%>"><img src="VisualizzaImmagine?prodId=<%=bean.getCode()%>" width="200" height="200"></a> <br>
			<h2><%=bean.getName() %></h2><br>
			<%if(bean.getQuantity() == 1){ %>
			<h2 id="red"> ULTIMO RIMASTO!</h2>
			<%}else{ %>
			<h2>Rimanenti: <%=bean.getQuantity()%></h2>
			<%} %>
			<h2><%=bean.getPrice()%>€</h2>
			<a href="product?action=addC&id=<%=bean.getCode()%>"><button id="addToCart">Add to Cart</button></a>
			<%if (currentUser != null && currentUser.getIsAdmin()){ %>
			<a href="product?action=delete&id=<%=bean.getCode()%>"><button>Delete</button></a><br>
				
			<%} %>
		</div>
		<%}} %>
</div>

	
	
	
	
	
 <jsp:include page="footer.jsp" />
	
</body>
</html>