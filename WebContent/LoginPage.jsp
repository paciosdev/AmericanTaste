

<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.UserBean,it.unisa.model.Cart"%>
<%
UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
                                <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<title>Login Page</title>
	</head>

	<body>
	 <jsp:include page="header.jsp" />
	
		<%if(currentUser != null){ %>
		
		<form action="LogoutServlet">
			<button type="Submit">Logout</button>
		</form>
		
		<%}else{ %>
		<form action="Login">

			Please enter your username 		
			<input type="text" name="un"/><br>		
							
			Please enter your password
			<input type="text" name="pw"/>
			
			<input type="submit" value="submit">			
		
		</form>
		Non sei registrato?
		<a href="./RegisterPage.jsp"><button value="Registrati">Registrati</button></a>
			 <jsp:include page="footer.jsp" />
		<%} %>
		
		
		
	</body>
</html>
