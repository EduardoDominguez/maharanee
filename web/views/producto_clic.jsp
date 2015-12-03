<!DOCTYPE html>
<%-- 
    Document   : producto_clic
    Created on : 1/12/2015, 10:51:32 PM
    Author     : Eduardo
--%>
<%@page import="persistencia.conexion"%>
<HTML>
	<head>
		<title>Producto</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="../css/default.css">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
		<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
		<script src="../js/imgSwitch.js"></script>
	</head>
	<body>
           <%
                conexion c = new conexion();
                String idprod = request.getParameter("id");
                String idcat = request.getParameter("cate");
                Integer.parseInt(idprod);
                //out.print(id);
                String resultprod[] = c.select("SELECT * from producto where IdProd= " + idprod);
                System.out.print("SELECT * from persona where NumEmp = " + idprod);

                for (int i = 0; i < resultprod.length; i++) {
                    System.out.print("res" + resultprod[i]);
                    String splprod[] = resultprod[i].split(", ");
            %>
		<div class="prod_clic">
			<div class="prod_img">
					<img id="mainImg" width="335px" height="251px" src="../img/Aretes/<%= splprod[1]%>"/>">
					<img id="miniIm1" width="80px" height="60px" src="../img/Aretes/<%= splprod[2]%>"/>
					<img id="miniIm2" width="80px" height="60px" src=../img/Aretes/<%= splprod[3]%>"/>
					<img id="miniIm3" width="80px" height="60px" src="../img/Aretes/<%= splprod[4]%>"/>
				<a href="<%= splprod[5]%>" target="_blank">
				<img width="70px" height="70px" src="../img/play.jpg">
				</a>
			</div>
			<div class="prod_info">
				<p class="nombre"><%= splprod[6]%></p>
				<p class="caracteristicas">
                                    <strong>Caracter&iacute;sticas: </strong><%= splprod[8]%>
				</p>
				<p class="medidas">
					<strong>Medidas: </strong><%= splprod[9]%>
				</p>
				<p class="precio">
					<strong>Precio: </strong><%= splprod[11]%>
					</p>
				
 				<form name = "valida_datos_get" action="carrito.php" method="post" enctype = "application/x-www.form-urlencoded"  >
 				<input type= "hidden" name="id" value="<?php echo $id ?>" />
				<p class="cantidad"> <strong>Cantidad: </strong><input type="text" name="cantidad"></p>
 				<input class="agregar" type= "submit"  value= "Agregar al carrito" />

                        <% }%>
			</form>
				<a href="productos.jsp?categoria=<%=idcat%>">
					<button class="regresar" type="button" value="Regresar">Regresar</button>
				</a>
			</div>
		</div>
	</body>
</HTML>