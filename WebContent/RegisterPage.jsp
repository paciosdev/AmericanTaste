<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="header.jsp" />

 <form action="Register">
  <label for="username">Username:</label><br>
  <input type="text" id="username" name="username"><br>
  <label for="email">Email:</label><br>
  <input type="email" id="email" name="email"><br>
  <label for ="password">Password:</label><br>
  <input type="password" id="password" name="password"><br>
  <label for="firstName">First name:</label><br>
  <input type="text" id="firstName" name="firstName"><br>
  <label for="lastName">Last name:</label><br>
  <input type="text" id="lastName" name="lastName"><br>
  <label for="cf">Codice Fiscale:</label><br>
  <input type="text" id="cf" name="cf" maxLength="16"><br>
  <label for="regione">Regione:</label><br>
  <input type="text" id="regione" name="regione"><br>
  <label for="provincia">Provincia:</label><br>
  <input type="text" id="provincia" name="provincia"><br>
  <label for="citta">Citta:</label><br>
  <input type="text" id="citta" name="citta"><br>
  <label for="civico">Civico:</label><br>
  <input type="number" id="civico" name="civico"><br>
  
  <input type="submit" value="Registrati">
  
</form> 
	 <jsp:include page="footer.jsp" />

</body>
</html>