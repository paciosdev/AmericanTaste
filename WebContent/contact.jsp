<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
	 <jsp:include page="header.jsp" />
	<div class="centerContainer">
        <div class="contactForm">
            <h1>Contattaci</h1>
            <h2>Hai bisogno di qualche informazione? Compila il seguente form</h2>
            <form action="">
                <input type="text" name="name" placeholder="Nome..."><br>
            <input type="text" name="cognome" placeholder="Cognome..."><br>
            <input type="email" name="email" placeholder="Email..."><br>
            <textarea id="testo" name="testo" rows="4" cols="50" placeholder="Scrivi qui il tuo messaggio..."></textarea><br>

            <button type="submit">Invia</button>
            </form>
        </div>
    </div>
    	 <jsp:include page="footer.jsp" />
    
</body>
</html>