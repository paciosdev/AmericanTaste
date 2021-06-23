<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="POST" action="AddCardServlet">
		<input type="text" name="codice" placeholder="Codice" maxLength="16"> <br>
		<input type="text" name="retro" placeholder="CVV" maxLength="3"> <br>
		<input type="date" name="scadenza" placeholder="Scadenza"> <br>
		<input type="submit" value="Salva">
	</form>
</body>
</html>