<%@page import="persistencia.conexion"%>
<HTML>
    <head>
        <TITLE>Categorias</TITLE>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="../css/default.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>



        <link rel="stylesheet" href="../css/multizoom.css" type="text/css" />

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>

        <script type="text/javascript" src="../js/multizoom.js">

            // Featured Image Zoomer (w/ optional multizoom and adjustable power)- By Dynamic Drive DHTML code library (www.dynamicdrive.com)
            // Multi-Zoom code (c)2012 John Davenport Scheuer
            // as first seen in http://www.dynamicdrive.com/forums/
            // username: jscheuer1 - This Notice Must Remain for Legal Use
            // Visit Dynamic Drive at http://www.dynamicdrive.com/ for this script and 100s more

        </script>

        <script type="text/javascript">

            jQuery(document).ready(function ($) {

                $('#img1').addimagezoom()
                $('#img2').addimagezoom()
                $('#img3').addimagezoom()
                $('#img4').addimagezoom()
                $('#img5').addimagezoom()
                $('#img6').addimagezoom()
                $('#img7').addimagezoom()
                $('#img8').addimagezoom()
                $('#img9').addimagezoom()
                $('#img10').addimagezoom()
                $('#img11').addimagezoom()
                $('#img12').addimagezoom()
                $('#img13').addimagezoom()
                $('#img14').addimagezoom()
                $('#img15').addimagezoom()
                $('#img16').addimagezoom()

            })

        </script>
    </head>


    <body>
        <%@include file="../parts/top.jsp" %>
        <%                
            request.setAttribute("opmenu", "");
            conexion c = new conexion();
            int pagina = 0, cont = 0, cate;
            if (request.getParameter("pagina") != null) {
                pagina = Integer.parseInt(request.getParameter("pagina"));
            } else {
                pagina = 1;
            };
            cont = (pagina - 1) * 12;

            cate = Integer.parseInt(request.getParameter("categoria"));

            String result[] = c.select("SELECT * FROM producto where categoria_IdCate = " + cate + "");
            System.out.print("SELECT * FROM producto where categoria_IdCate = " + cate + "");
            int imgid = 0;

        %>

        <div class="productos">
            <%@include file="../parts/menu_index.jsp" %>
            <div class="lista">
                <%                
                for (int i = 0; i < result.length; i++) {
                        System.out.print("res" + result[i]);
                        String spl[] = result[i].split(", ");
                        imgid++;
                        String idp=spl[0];
                        System.out.print(idp);
                %>



                <div><div class="recprod"><a href="producto_clic.jsp?id=<%=spl[0]%>&cate=<%=cate%>">
                            <img id="img/<%= imgid%>/" width="160px" height="120px;" src="../img/Aretes/<%= spl[1]%>"/>
                            <p class="nombre"><%= spl[6]%>
                            <BR><CENTER><%= "$" + spl[11]%></CENTER>
                            </p>
                    </div>
                </div>


                <% } %>
            </div>
        </div>
        <%@include file="../parts/footer.html" %>
    </body>
</HTML>