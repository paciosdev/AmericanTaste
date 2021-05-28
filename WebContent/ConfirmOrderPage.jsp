<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart,it.unisa.model.UserBean"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="header.jsp" />

	<a href="ConfirmOrderServlet"><button value="Conferma Ordine">Conferma Ordine</button></a>
		 <jsp:include page="footer.jsp" />
	
</body>
</html>