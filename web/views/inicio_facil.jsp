<?php 
session_start(); 
?> 
<HTML>
	<head>
		<title>Comienza FÃ¡cil</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="../css/default.css">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	</head>

	<body>
		
		<%@include file="../parts/top.jsp" %>
            
		
		<div class="inicio">
			<h1 style="padding:1px 20px; text-align: center;">
				Comienza Fácil:</h1>
			<div class="instrucciones">

                            <a target="_blank" href="../views/registro.jsp">
				<div class="p1">
					<div class="circulo">
						<img src="../img/notepencil32.jpg">
					</div>
						<p>1. Registrate<br>gratis</p>

				</div>
				</a>

                            <a target="_blank" href="../views/productos.jsp?categoria=1">
				<div class="p2">
					<div class="circulo">
						<img width="75px" height="75px" src="../img/carrito.jpg">
					</div>
					<p>2. Elige<br>y<br>compra</p>
				</div>
				</a>

                            <a target="_blank" href="../views/carrito.jsp">
				<div class="p3">
					<div class="circulo">
						<img src="../img/moneyreceipt32.jpg">
					</div>
					<p>3. Paga</p>
				</div>
				</a>

			
			</div>
		</div>
		
                <%@include file="../parts/footer.html" %>
            
		
	</body>
</HTML>
