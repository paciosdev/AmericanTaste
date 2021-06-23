<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.UserBean,it.unisa.model.Cart"%>
<%
UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="NewFile.css">
</head>
<body>

	<header class="header">
        <nav class="navbar">
            <a href="#" class="nav-logo">American Taste</a>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="ProductView.jsp" class="nav-link">Prodotti</a>
                </li>
                <li class="nav-item">
                    <a href="marchi.jsp" class="nav-link">Marchi</a>
                </li>
                <li class="nav-item">
                    <a href="contact.jsp" class="nav-link">Contatti</a>
                </li>
                <li class="nav-item">
                    <a href="ChiSiamo.jsp" class="nav-link">Chi Siamo</a>
                </li>
            </ul>
            
            
            <a href="CartView.jsp"><img src="./assets/cart.png" width="25" height="25"></a>
                        <a href="LoginPage.jsp"><img src="./assets/user.png" width="25" height="25"></a>
            <div class="hamburger">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
            </div>
            
            
            
        </nav>
</header>

	<script>
	
	const hamburger = document.querySelector(".hamburger");
	const navMenu = document.querySelector(".nav-menu");

	hamburger.addEventListener("click", mobileMenu);

	function mobileMenu() {
	    hamburger.classList.toggle("active");
	    navMenu.classList.toggle("active");
	}
	
	

	</script>
	
	
</body>
</html>