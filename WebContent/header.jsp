<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="style.css">
	<style>
	input[type=text] {
  padding: 0 5px 0 10px;
  
  height: 30px;
  position: relative;
  left: 0;
  outline: none;
  border: 1px solid #cdcdcd;
  border-color: rgba(0, 0, 0, .15);
  background-color: white;
  font-size: 16px;
  color: #js91ns;
  border-radius: 6px;
}

.advancedSearchTextbox {
  width: 200px;
  margin-right: -4px;
  padding: 0 20px;
}
	
	</style>

</head>
<body>
	<header>
	<h2>American's Taste</h2>
		<nav>
			<ul class="menu">
				<li><a class="menu-item" href="ProductView.jsp">Prodotti</a>
				<li><a class="menu-item" href="#">Marche</a>
				<li><a class="menu-item" href="#">Chi Siamo</a>
				<li><a class="menu-item" href="#">Contatti</a>
			</ul>
		</nav>
		<input class="advancedSearchTextbox" type="text" placeholder="Ricerca Prodotto...">
		<a href="LoginPage.jsp?action=login"><image src="./assets/user.png" width="20" height="20"></a>
		<a href="CartView.jsp"><image src="./assets/cart.png" width="20" height="20"></a>
	</header>
</body>
</html>