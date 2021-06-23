<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="it.unisa.model.ProductModelDS, it.unisa.model.ProductModel,it.unisa.model.UserBean"%>
    <%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>
    
    <%
		String nomeCercato = request.getParameter("nomeCercato");
    
    ProductModel model = new ProductModelDS();
 
    Collection<?> products = model.doRetrieveByName(nomeCercato);
    
	UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));

	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <jsp:include page="header.jsp" />
 	<h1>Risultati per <%=nomeCercato%></h1>
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