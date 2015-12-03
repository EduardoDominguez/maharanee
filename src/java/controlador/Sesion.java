    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import persistencia.conexion;

/**
 *
 * @author Arellano
 */
public class Sesion extends HttpServlet {
        
 

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
        processRequest(request, response);
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
         PrintWriter out = response.getWriter();
        processRequest(request, response);
             conexion c= new conexion();
         String usu=request.getParameter("usuario_txt");
         String pass=request.getParameter("pwd");
         String accesar = request.getParameter("Accesar");
         String Salir = request.getParameter("Salir");
         
        if("Accesar".equals(accesar)){
            try {
                String res[]=c.select("SELECT * from persona where UsuPer ='"+usu+"'&& ConPas = '"+pass+"' && EstPer = 'A'");
                System.out.println("SELECT * from persona where UsuPer ='"+usu+"' && ConPas = '"+pass+"' && EstPer = 'A'");
                if(res[0].equals("fail")){
                   String mensaje= "Datos incorrectos";
                   out.println("<script>alert('"+mensaje+"');</script>");
                   out.println("<script>location.href='index.jsp?mensaje="+mensaje+"'</script>");
                }else{
                     HttpSession sesion = request.getSession(true);
                    String spl[]=res[0].split(", ");
                    if(spl[20].equals("A")) {
                      sesion.setAttribute("numeroUSu", spl[0]);  
                      sesion.setAttribute("logeo", "admin"); 
                      sesion.setAttribute("estatuslogeo", "si"); 
                      sesion.setAttribute("name", spl[1]); 
                    }else{
                       sesion.setAttribute("logeo", "usuario");
                       sesion.setAttribute("numeroUSu", spl[0]);  
                       sesion.setAttribute("estatuslogeo", "si"); 
                       sesion.setAttribute("name", spl[1]); 
                     }
                      response.sendRedirect("index.jsp");
                }
            } catch (SQLException ex) {
                Logger.getLogger(Sesion.class.getName()).log(Level.SEVERE, null, ex);
            }

        }else if("Salir".equals(Salir)){
            HttpSession sesion = request.getSession(true);
            sesion.invalidate();
            sesion = request.getSession();
            response.sendRedirect("index.jsp");
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
