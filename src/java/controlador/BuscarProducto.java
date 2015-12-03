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
import persistencia.conexion;

/**
 *
 * @author Roge
 */
public class BuscarProducto extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String q = request.getParameter("palabra");
        conexion c = new conexion();
        try {
            String result[]=c.select("select * from producto where NomPro like '%"+q+"%'");
            for (int i = 0; i < result.length; i++) {
                String spl[]=result[i].split(", ");
                out.println("<a href=\"producto_completo.jsp?id="+spl[0]+"&palabra="+q+"\" style=\"text-decoration:none;\" >");
                out.println("<div class=\"display_box\" align=\"left\">");
                out.println("<div style=\"float:left; margin-right:6px;\"><img src=\"../img/Aretes/"+spl[1]+"\" width=\"60\" height=\"60\" /></div> ");
                out.println("<div style=\"margin-right:6px;\"><b>"+spl[6]+"</b></div>");
                out.println("<div style=\"margin-right:6px; font-size:14px;\" class=\"desc\">"+spl[7]+"</div></div>");
                out.println("</a>");
            }
            c.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(BuscarProducto.class.getName()).log(Level.SEVERE, null, ex);
            out.println(ex);
        }
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
