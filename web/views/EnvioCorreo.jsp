<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    String result;
    String to = "rogeandrade1@gmail.com";
    String from = "rogeandrade1@gmail.com";
    String host = "localhost";
    Properties properties = System.getProperties();
    properties.setProperty("mail.smtp.host", host);
    Session mailSession = Session.getDefaultInstance(properties);
    String asunto=request.getParameter("asunto");
    String mensaje=request.getParameter("mensaje");
    String nombre=request.getParameter("nombre");
    String correo=request.getParameter("email");
    String mensajeCompleto="Soy: "+nombre+", \n"+" Mi correo es: "+correo+", \n y quiero: "+mensaje;

    try {
        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(to));
        message.setSubject(asunto);
        message.setText(mensajeCompleto);
        Transport.send(message);
        result = "Mensaje enviado correctamente";
    } catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Mensaje no enviado";
    }
%>
<html>
    <head>
        <title>Correo</title>
    </head>
    <body>
    <center>
        <h1>Correo</h1>
    </center>
    <p align="center">
        <%
            out.println("" + result + "\n");
            out.println("<script>setTimeout(function(){location.href='contactanos.jsp'}, 3000);</script>");
        %>
    </p>
</body>
</html>
