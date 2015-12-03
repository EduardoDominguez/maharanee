/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.SQLException;
import javax.servlet.ServletException;
import persistencia.conexion;

/**
 *
 * @author Eduardo
 */
public class InicioBean {

    private int id;
    private String txtInicio;
    private String video;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTxtInicio() {
        return txtInicio;
    }

    public void setTxtInicio(String txtInicio) {
        this.txtInicio = txtInicio;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }    

    public boolean actualiza() throws ServletException {
        conexion c = new conexion();
        try {
            String sql = "update inicio set TextIni=\"" + this.txtInicio + "\", VidIni='"+this.video +"' where IdInicio='"+this.id+"'";
            System.err.println(sql);
            System.err.println(c.insUpd(sql));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public String[] select() throws ServletException, SQLException {
        String spl[] ;
        conexion c = new conexion();
        String result[] = c.select1("select * from inicio");
        spl = new String [result.length];
        return result;
    }
}
