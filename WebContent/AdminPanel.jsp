<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="it.unisa.model.UserBean"
	%>

<%
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
%>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<html>
<head>
<meta charset="UTF-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>

 <jsp:include page="header.jsp" />

<div class="centerContainer">
	<div class="adminPanelContainer">
		<%if (currentUser != null && currentUser.getIsAdmin()){%>
	
	<h1>Admin Panel</h1>
 		<h2>Insert</h2>
	<form action="product" method="post" enctype="multipart/form-data">
		<input type="hidden" name="action" value="insert"> 
		
		<label for="name">Name:</label><br> 
		<input name="name" type="text" maxlength="20" required placeholder="enter name"><br> 
		
		<label for="type">Type:</label><br> 
		<input name="type" type="text" maxlength="20" required placeholder="enter type"><br>
		
		<label for="iva">Iva:</label><br> 
		<input name="iva" type="text" maxlength="20" required placeholder="enter iva"><br>
		
		<label for="description">Description:</label><br>
		<textarea name="description" maxlength="100" cols="150" rows="10" required placeholder="enter description"></textarea><br>
		
		<label for="price">Price:</label><br> 
		<input name="price" type="number" min="0" value="0" required><br>

		<label for="quantity">Quantity:</label><br> 
		<input name="quantity" type="number" min="1" value="1" required><br>
		
		<label for="image">Choose image:</label><br> 
		<input name="image" type='file' id="imgInp" /><br>
   <img id="blah" src="#" alt="your image" width="200" height="200"/><br>

		<input type="submit" value="Add"><input type="reset" value="Reset">
		
	</form>
 	<%} %>
	</div>
</div>


	<script>
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#blah').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$("#imgInp").change(function(){
	    readURL(this);
	});
	</script>
	 <jsp:include page="footer.jsp" />
	
</body>
</html>