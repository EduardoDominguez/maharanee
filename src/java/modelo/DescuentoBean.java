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
public class DescuentoBean {
    private int IdDescuento;
    private String Desc1;
    private String Desc2;

    public int getIdDescuento() {
        return IdDescuento;
    }

    public void setIdDescuento(int IdDescuento) {
        this.IdDescuento = IdDescuento;
    }

    public String getDesc1() {
        return Desc1;
    }

    public void setDesc1(String Desc1) {
        this.Desc1 = Desc1;
    }

    public String getDesc2() {
        return Desc2;
    }

    public void setDesc2(String Desc2) {
        this.Desc2 = Desc2;
    }
    
        public boolean actualiza() throws ServletException {
        conexion c = new conexion();
        try {
            String sql = "update descuento set DesUno=\"" + this.Desc1 + "\", DesDos='"+this.Desc2 +"' where IdDesc='"+this.IdDescuento+"'";
            System.err.println(sql);
            System.err.println(c.insUpd(sql));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    
}
