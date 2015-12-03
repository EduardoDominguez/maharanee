/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.io.*;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import persistencia.conexion;

/**
 *
 * @author Roge
 */
public class ModificarProducto extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "img\\Aretes";
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50;
    String mensage = "";

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
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);
        String uploadPath = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            String result[] = new String[formItems.size()];
            String img1="", img2="", img3="", img4="";
            int ind = 0;
            if (formItems != null && formItems.size() > 0) {
                for (FileItem item : formItems) {
                    if ("fotog_fls".equals(item.getFieldName()) || "foto1_fls".equals(item.getFieldName()) || "foto2_fls".equals(item.getFieldName()) || "fotoc_fls".equals(item.getFieldName())) {
                        if (!"".equals(item.getString())) {
                            if (!item.isFormField()) {
                                String fileName = new File(item.getName()).getName();
                                String filePath = uploadPath + File.separator + fileName;
                                File storeFile = new File(filePath);
                                item.write(storeFile);
                                mensage = "Producto exitosamente editado";
                                result[ind] = item.getName();
                                ind++;
                            } else if (!"Modificar".equals(item.getFieldName())) {
                                result[ind] = item.getString();
                                ind++;
                            }

                        } else {
                            result[ind] = item.getName();
                            ind++;
                        }
                    } else if (!"Modificar".equals(item.getString())) {
                        result[ind] = item.getString();
                        ind++;
                    }
                }
            }
            if (result[12].equals("")) {
                img1=result[13];
            }else{
                img1=result[12];
            }
            if (result[14].equals("")) {
                img2=result[15];
            }else{
                img2=result[14];
            }
            if (result[16].equals("")) {
                img3=result[17];
            }else{
                img3=result[16];
            }
            if (result[18].equals("")) {
                img4=result[19];
            }else{
                img4=result[18];
            }
            conexion c= new conexion();
            String query="Update producto set ImaGra='"+img1+"', ImaUno='"+img2+"', ImaDos='"+img3+"', ImaCaj='"+img4+"', VidPro='"+result[11]+"', NomPro='"+result[0]+"', CodPro='"+result[2]+"', CarPro='"+result[4]+"', MedPro='"+result[5]+"', PiePro='"+result[6]+"', PreVen='"+result[7]+"', OfePro='"+result[8]+"', EstPro='"+result[9]+"', categoria_IdCate='"+result[10]+"' where IdProd = '"+result[1]+"'";
            String resinsert=c.insUpd(query);
            if(!resinsert.equals("fail")){
                mensage = "Producto exitosamente editado";
            }else{
                mensage = "El producto no pudo ser editado..";
            }
                c.cerrarConexion();
            //String resinsert="insert into producto(ImaGra,ImaUno,ImaDos,ImaCaj,VidPro,NomPro,CodPro,CarPro,MedPro,PiePro,PreVen,OfePro,EstPro,categoria_IdCate) values ('"+res[]+"','$nombre2','$nombre3','$nombrec','$video','$nombreprod','$codigo', '$caracteristicas', '$medidas', '$piezas', '$precio','$oferta','A','$categoria')";
        } catch (Exception ex) {
            mensage = "El producto no pudo ser editado.";
        }
        out.println("<script>alert('"+mensage+"');</script>");
        out.println("<script>location.href='index.jsp?mensaje="+mensage+"'</script>");


        /*
         String nombre=request.getParameter("nombre_txt");
         String codigo=request.getParameter("codigo_txt");
         String medidas=request.getParameter("medidas_txt");
         String caract=request.getParameter("caract_txt");
         String piezas=request.getParameter("piezas_txt");
         Double oferta=Double.parseDouble(request.getParameter("oferta_txt"));
         String categoria=request.getParameter("categoria_slc");
         Double precio=Double.parseDouble(request.getParameter("precio_txt"));
         String video=request.getParameter("video_txt");
         if(oferta>0){
         precio =  precio - ((precio*oferta)/100);
         }
         FileItemFactory factory = new DiskFileItemFactory();
         ServletFileUpload upload = new ServletFileUpload(factory);
         */
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
