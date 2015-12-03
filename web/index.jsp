<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang ="es">

    <head>
        <title>JOYERIA</title>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="css/default.css"/>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'/>
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    </head>

    <body>	
        <%@include file="parts/top3.jsp"%>
        <%request.setAttribute("opmenu", "views/");%>
        <div class="index">
            <%@include file="parts/menu_index2.jsp"%>
            <div>
                <img src="img/bannermhrn.jpg" width="900" height="150">
            </div>
            <div class="textvid">
               <%@include file="parts/datos_index.jsp"%> 
            </div>
        </div>
        <%@include file="parts/footer2.html"%>
    </body>

</html>
