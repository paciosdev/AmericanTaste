
    <%@ page contentType="text/html; charset=UTF-8" import="javax.imageio.ImageIO,java.io.*,java.util.*,it.unisa.model.UserBean,it.unisa.model.Cart,it.unisa.model.OrderDAO,it.unisa.model.ProductBean"%>
<%
ArrayList<ProductBean> prodotti = new ArrayList<>();

prodotti = OrderDAO.doRetrieveContains(request.getParameter("userId"), 
		request.getParameter("dataOrdine"),
		Integer.parseInt(request.getParameter("orderId")));

double totale = 0;

for (ProductBean prod : prodotti){
	totale += prod.getPriceWithIva() * prod.getOccurrencies();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
			<link rel="stylesheet" href="style.css">

</head>
<body>
	 <jsp:include page="header.jsp" />
	 <%if (prodotti != null){%>
	 	<h1>Dettagli ordine n° <%=request.getParameter("orderId") %></h1>
	 	<div class="centerContainer">
	 	<table border="1">
		<tr>
			<th>Nome prodotto </th>
			<th>Quantita'</th>
			<th>Action</th>
			<th>Image</th>
		</tr>
		<%
			Iterator<?> it = prodotti.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
		<tr>
			<td><%=bean.getName()%></td>
			<td><%=bean.getOccurrencies()%></td>
			<td><a href="DetailsView.jsp?id=<%=bean.getCode()%>">Details</a></td>
			<td><img src="VisualizzaImmagine?prodId=<%=bean.getCode()%>" width="100" height="100"></td>
		</tr>
		<%} %>
	</table>
	</div>
	
	<h1>Totale: <%=Math.round(100*totale) / 100%>$</h1>
	 	<%} %>
	 <jsp:include page="footer.jsp" />
</body>
</html>