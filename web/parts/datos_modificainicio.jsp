<%@page import="controlador.ModificarInicio"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="persistencia.conexion"%>
<%@page import="modelo.InicioBean"%>
<%
    String datos[], spl[], spl1[];
    InicioBean ib = new InicioBean();
    conexion c = new conexion();
        spl = new String [5];
        //Recoge datos
        datos = ib.select();
       for (int i = 0; i < datos.length; i++) {
              System.out.print(datos[i]);
      }
        
        //request.setAttribute("texto1", datos[1]); //Texto de id 1
        
        spl = datos[0].split("# ");
        spl1 = datos[1].split("# ");
        out.println("<input placeholder='Texto de inicio' type='text' value='"+spl[1]+"' name='texto_txt' required>");
        out.println("<p>Video Inicio:</p>");
        out.println("<input placeholder='Video de inicio' type='text' value='"+spl[2]+"' name='video_txt' required>");
        out.println("<p>Video Registro:</p>");
        out.println("<input placeholder='Video de inicio' type='text' value='"+spl1[2]+"' name='videoreg_txt' required>");
    c.cerrarConexion();
%> 