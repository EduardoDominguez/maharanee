/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.InicioBean;

/**
 *
 * @author Eduardo
 */
public class ModificarInicio extends HttpServlet {

    String mensaje = "";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ModificarInicio</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModificarInicio at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
        String opcion = request.getParameter("opcion");
        InicioBean ib = new InicioBean();
        response.setContentType("text/html;charset=UTF-8");
        String datos[];

        switch (opcion) {
//            case "1": {
//                try {
//                    //Recoge datos
//                    datos = ib.select();
//                    request.setAttribute("texto1", datos[1]); //Texto de id 1
//                    request.setAttribute("video1", datos[2]); //Video de id 1
//                    request.setAttribute("texto2", datos[4]); //Texto de id 2
//                    request.setAttribute("video2", datos[5]); //Video de id 2
//                     
//                } catch (SQLException ex) {
//                    Logger.getLogger(ModificarInicio.class.getName()).log(Level.SEVERE, null, ex);
//                }
//            }
//            break;
            case "2"://Actualizar
                ib.setId(Integer.parseInt("1"));
                ib.setTxtInicio(request.getParameter("texto_txt"));
                ib.setVideo(request.getParameter("video_txt"));//Video inicio
                if (ib.actualiza()) {
                    ib.setId(Integer.parseInt("2"));
                    ib.setVideo(request.getParameter("videoreg_txt"));//Video registro
                    if (ib.actualiza()) {
                        mensaje = "Se ha actualizado el inicio con exito";
                    }
                    else {
                        mensaje = "No se pudo actualizar el inicio";
                    }
                } else {
                        mensaje = "No se pudo actualizar el inicio";
                }
                break;
        }
        // Realizar una consulta SQL
        out.println("<script>alert('" + mensaje + "');</script>");
        out.println("<script>location.href='views/modificar_index.jsp'</script>");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
