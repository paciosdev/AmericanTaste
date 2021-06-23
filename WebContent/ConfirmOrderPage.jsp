<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page contentType="text/html; charset=UTF-8" import="it.unisa.model.CardBean,it.unisa.model.CardDAO,java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart,it.unisa.model.UserBean"%>
    
    <%	
    UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));

    	ArrayList<CardBean> cards = CardDAO.doRetrieveAll(currentUser.getCf());
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
 <jsp:include page="header.jsp" />
 
 <h2>Scegli una carta da utilizzare</h2>
<%if(!cards.isEmpty()){ %>
 <select name="cartaScelta">
 	<%
 		for(CardBean card : cards){
 	%>
 	<option value="<%=card.getCodice()%>"><%=card.getCodice()%></option>
 	<%} %>
 </select>
<%} %>

<a href="AddCard.jsp">Aggiungi nuova carta</a>
	<%
	if (!cards.isEmpty()){ %>
		<a href="ConfirmOrderServlet"><button value="Conferma Ordine">Conferma Ordine</button></a>
	<%} %>
		 <jsp:include page="footer.jsp" />
	
</body>
</html>