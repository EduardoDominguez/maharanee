<?php
    session_start();
?>

<!DOCTYPE html>
<html lang ="es">
	<head>
		<title>Preguntas Frecuentes</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="../css/default.css">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
		<script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
		<script src="../js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
		<script src="../js/jquery.validate.js" type="text/javascript"></script>
		
		<script>
			function cambiar(param){
				vista=document.getElementById(param).style.display;
				if (vista=='none')
					vista='block';
				else
					vista='none';
				document.getElementById(param).style.display = vista;
			}
		</script>
	</head>
	<body>
            <%@include file="../parts/top.jsp" %>
            
         
		<div class="registro">
			
			<h1 style="padding:1px 25px; text-align: center;">
				Preguntas Frecuentes</h1>
			
			<p style="padding-left: 20px; padding-right: 20px; text-align: justify;">
                            <strong>¿C&oacute;mo puedo ser un vendedor Maharanee?</strong>&nbsp;
				<a href="#" onclick="cambiar('p'); return false;"><img src="../img/desplegar.png" height="15" width="15"/></a>
			</p>
			<p id="p" style="padding-left: 20px; padding-right: 20px; text-align: justify; display: none;">
				R: Es muy sencillo solo tienes que registrarte para ser un empresario independiente (EMPI), elegir 
                                (escoger mercanc&iacute;a al carrito), comprar, pagar  y recibir tu producto.
			</p>
			
			<p style="padding-left: 20px; padding-right: 20px; text-align: justify;">
                            <strong>¿Cu&aacute;l es el proceso o los pasos para adquirir los productos?</strong>&nbsp;
				<a href="#" onclick="cambiar('p2'); return false;"><img src="../img/desplegar.png" height="15" width="15"/></a>
			</p>
			<p id="p2" style="padding-left: 20px; padding-right: 20px; text-align: justify; display: none;">
                            R: Al elegir el bot&oacute;n comienza f&aacute;cil en la pantalla principal y al dar clic, saldr&aacute;n 4 sencillos pasos con 
                            los cuales podr&aacute;s adquirir y recibir tus productos. (1.- Reg&iacute;strate gratis, 2.- Elige y compra, 3.- Paga y 
				4.- Recibe en tu domicilio).
			</p>
			
			
			<p style="padding-left: 20px; padding-right: 20px; text-align: justify;">
                            <strong>¿Cu&aacute;nto es el m&iacute;nimo de compra?</strong>&nbsp;
				<a href="#" onclick="cambiar('p3'); return false;"><img src="../img/desplegar.png" height="15" width="15"/></a>
			</p>
			<p id="p3" style="padding-left: 20px; padding-right: 20px; text-align: justify; display: none;">
                            R: El m&iacute;nimo de compra son 3000 pesos, aunque te hacemos algunas sugerencias de paquetes con los cuales 
				puedas empezar tu propio negocio en los cuales se te dan obsequios y descuentos.
			</p>
			
			<p style="padding-left: 20px; padding-right: 20px; text-align: justify;">
                            <strong>¿El env&iacute;o es gratis?</strong>&nbsp;
				<a href="#" onclick="cambiar('p4'); return false;"><img src="../img/desplegar.png" height="15" width="15"/></a>
			</p>
			<p id="p4" style="padding-left: 20px; padding-right: 20px; text-align: justify; display: none;">
                            R: Si, el env&iacute;o es gratis.
			</p>
		
			<p style="padding-left: 20px; padding-right: 20px; text-align: justify;">
                            <strong>¿Cu&aacute;nto tiempo puede tardar el envÃ­o de la mercanc&iacute;a?</strong>&nbsp;
				<a href="#" onclick="cambiar('p5'); return false;"><img src="../img/desplegar.png" height="15" width="15"/></a>
			</p>
			<p id="p5" style="padding-left: 20px; padding-right: 20px; text-align: justify; display: none;">
                            R: De 3 a 5 d&iacute;as h&aacute;biles despu&eacute;s de recibir MAHARANEE el pago y haberlo comprobado de recibido.
			</p>
				
			<p style="padding-left: 20px; padding-right: 20px; text-align: justify;">
                            <strong>¿Cu&aacute;nto es la ganancia que tengo como vendedor?</strong>&nbsp;
				<a href="#" onclick="cambiar('p6'); return false;"><img src="../img/desplegar.png" height="15" width="15"/></a>
			</p>
			<p id="p6" style="padding-left: 20px; padding-right: 20px; text-align: justify; display: none;">
                            R: La ganancia m&iacute;nima que obtienes es del 40% pero puedes ser del 45% comprando arriba de 
                                $15,000 pesos en una sola exhibici&oacute;n.
			</p>
			
			<p style="padding-left: 20px; padding-right: 20px; text-align: justify;">
                            <strong>¿A d&oacute;nde puedo empezar a vender?</strong>&nbsp;
				<a href="#" onclick="cambiar('p7'); return false;"><img src="../img/desplegar.png" height="15" width="15"/></a>
			</p>
			<p id="p7" style="padding-left: 20px; padding-right: 20px; text-align: justify; display: none;">
				R: Los lugares que puedes empezar a vender pueden ser instituciones de gobierno u oficinas 
                                donde tengas cautiva a la gente y no est&aacute;n cambiando de puesto consecutivamente (checar la 
				hoja de tips y sugerencias MAHARANEE para empezar a vender de acuerdo a nuestras experiencias 
                                la cual encuentras en la p&aacute;gina principal en tips y sugerencias una vez registrado).
			</p>
			
			<p style="padding-left: 20px; padding-right: 20px; text-align: justify;">
                            <strong>¿Cu&aacute;ntas horas debo trabajar?</strong>&nbsp;
				<a href="#" onclick="cambiar('p8'); return false;"><img src="../img/desplegar.png" height="15" width="15"/></a>
			</p>
			<p id="p8" style="padding-left: 20px; padding-right: 20px; text-align: justify; display: none;">
				R: Lo minino que debes trabajar es de 3 a 4 horas diarias aunque tu decides cuantas horas 
                                trabajar. Lo que MAHARANEE recomienda para tener una buena venta son estas horas como m&iacute;nimo.
			</p>
			
			<p style="padding-left: 20px; padding-right: 20px; text-align: justify;">
                            <strong>¿Cu&aacute;nto debo vender diario para tener una buena ganancia al mes?</strong>&nbsp;
				<a href="#" onclick="cambiar('p9'); return false;"><img src="../img/desplegar.png" height="15" width="15"/></a>
			</p>
			<p id="p9" style="padding-left: 20px; padding-right: 20px; text-align: justify; display: none;">
				R: Un mÃ­nimo de venta de 800 a 5000 pesos diarios de lunes a viernes para obtener una buena 
                                ganancia al mes aunque t&uacute; decides cuantos d&iacute;as trabajar y si trabajas s&aacute;bado y domingo.
			</p>
		
			<p style="padding-left: 20px; padding-right: 20px; text-align: justify;">
                            <strong>¿Cu&aacute;nto es lo conveniente comprar para empezar?</strong>&nbsp;
				<a href="#" onclick="cambiar('p10'); return false;"><img src="../img/desplegar.png" height="15" width="15"/></a>
			</p>
			<p id="p10" style="padding-left: 20px; padding-right: 20px; text-align: justify; display: none;">
                            R: Lo conveniente para empezar a vender es comprar un m&iacute;nimo de 5000 pesos de mercanc&iacute;a, ya 
                            que en este negocio es muy importante la variedad de mercanc&iacute;a ya que puede haber clientes 
				que les guste 2, 3 o 4 productos y te los compren  por tener variedad. AdemÃ¡s que a partir 
				de 5000 pesos de compra MAHARANEE te regala el portafolio de ventas y un medidor de dedos 
				para anillos asÃ­ como un 50% de descuento en la anillera (donde exhibes los anillos) Pero si 
				decides empezar con menos dinero estÃ¡ bien ya que poco a poco puedes empezar a subir tu stock 
                                o inventario y as&iacute; llegar a variedad necesaria para obtenr excelentes ventas.
			</p>
			
			<p style="padding-left: 20px; padding-right: 20px; text-align: justify;">
                            <strong>¿Cu&aacute;les son las formas de pago que puedo hacer?</strong>&nbsp;
				<a href="#" onclick="cambiar('p11'); return false;"><img src="../img/desplegar.png" height="15" width="15"/></a>
			</p>
			<p id="p11" style="padding-left: 20px; padding-right: 20px; text-align: justify; display: none;">
				R: Existen 3 formas de pago <br />
				a) PAYPAL <br />
				b) Deposito en cuenta a nombre de  MAHARANEE  (cuenta Banamex  7941923, cuenta clabe 
				002225700179419236) <br />
                                c) Pago en OXXO (comisi&oacute;n por cuenta del EMPI)<br />
                                TODOS LOS PAGOS POR DEP&Oacute;SITO BANCARIO U OXXO TENDRAN QUE ENVIAR SU FICHA DE DEPOSITO PARA VERIFICAR 
                                SU PAGO Y AS&Iacute; ENVIARLES LA MERCANCIA. <br />
			</p>
			
			<p style="padding-left: 20px; padding-right: 20px; text-align: justify;">
                            <strong>¿De qu&eacute; materiales son los productos?</strong>&nbsp;
				<a href="#" onclick="cambiar('p12'); return false;"><img src="../img/desplegar.png" height="15" width="15"/></a>
			</p>
			<p id="p12" style="padding-left: 20px; padding-right: 20px; text-align: justify; display: none;">
                            R: Los materiales son piedras semipreciosa como jade, cuarzo rosa, etc as&iacute; como de acero 
				inoxidable, los brazaletes son diseÃ±os italianos pintados a mano.
			</p>
			
			<p style="padding-left: 20px; padding-right: 20px; text-align: justify;">
                            <strong>¿Cu&aacute;nto tiempo es la garant&iacute;a?</strong>&nbsp;
				<a href="#" onclick="cambiar('p13'); return false;"><img src="../img/desplegar.png" height="15" width="15"/></a>
			</p>
			<p id="p13" style="padding-left: 20px; padding-right: 20px; text-align: justify; display: none;">
                            R: La garant&iacute;a es de 3 meses despu&eacute;s de su compra con Maharanee y solo es por defectos de fabrica, 
                            no se har&aacute;n cambios si las piedras semipreciosas son rotas o los materiales son quebrados por 
				accidente. <br />
                                MAHARANEE solo hace valida garant&iacute;as por defecto de f&aacute;brica. <br />
                                MAHARANEE no hace devoluci&oacute;n de dinero, solo hace cambios f&iacute;sicos de mercanc&iacute;a por defectos de fabrica. <br />
			</p>
  			
		</div>

		 <%@include file="../parts/footer.html" %>



	</body>
</HTML>