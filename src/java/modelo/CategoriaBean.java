/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import javax.servlet.ServletException;
import persistencia.conexion;

/**
 *
 * @author Eduardo
 */
public class CategoriaBean {

    private int idCate;
    private String NomCat;
    private String EstCat;

    public int getIdCate() {
        return idCate;
    }

    public void setIdCate(int idCate) {
        this.idCate = idCate;
    }

    public String getNomCat() {
        return NomCat;
    }

    public void setNomCat(String NomCat) {
        this.NomCat = NomCat;
    }

    public String getEstCat() {
        return EstCat;
    }

    public void setEstCat(String EstCat) {
        this.EstCat = EstCat;
    }

    public boolean inserta() throws ServletException {
        conexion c = new conexion();
        try {
            String sql = "insert into categoria (NomCat,EstCat)"
                    + "values('" + this.NomCat + "','" + this.EstCat + "')";
            c.insUpd(sql);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean actualiza() throws ServletException {
        conexion c = new conexion();
        try {
            String sql = "update categoria set EstCat='" + this.EstCat + "' where IdCate='" + this.idCate + "'";
            System.err.println(c.insUpd(sql));
            System.err.println(sql);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean reactivar() throws ServletException {
        conexion c = new conexion();
        try {
            String sql = "update categoria set EstCat='" + this.EstCat + "' where NomCat='" + this.NomCat + "'";
            System.err.println(c.insUpd(sql));
            System.err.println(sql);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
