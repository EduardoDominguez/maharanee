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
 * @author Arellano
 */
public class UsuarioBean {

    private String nombre;
    private String apepa;
    private String apema;
    private String callenum;
    private String colonia;
    private String codigopsotal;
    private String municio;
    private String estado;
    private String correo;
    private String tel1;
    private String tel2;
    private String fecha_nac;
    private String sexo;
    private String rfc;
    private String usuario;
    private String contraseña;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApepa() {
        return apepa;
    }

    public void setApepa(String apepa) {
        this.apepa = apepa;
    }

    public String getApema() {
        return apema;
    }

    public void setApema(String apema) {
        this.apema = apema;
    }

    public String getCallenum() {
        return callenum;
    }

    public void setCallenum(String callenum) {
        this.callenum = callenum;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getCodigopsotal() {
        return codigopsotal;
    }

    public void setCodigopsotal(String codigopsotal) {
        this.codigopsotal = codigopsotal;
    }

    public String getMunicio() {
        return municio;
    }

    public void setMunicio(String municio) {
        this.municio = municio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTel1() {
        return tel1;
    }

    public void setTel1(String tel1) {
        this.tel1 = tel1;
    }

    public String getTel2() {
        return tel2;
    }

    public void setTel2(String tel2) {
        this.tel2 = tel2;
    }

    public String getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(String fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public boolean AltaAlumno() throws ServletException {
        conexion c = new conexion();
        try {
            String sql = "INSERT INTO persona (NomPer, ApePat, ApeMat, DirCal, DirCol, DirMun, DirEst, DirPai, CodPos, TelFij, TelCel, CorEle, FecNac, RfcHom, SexDat, FecIni, UsuPer, ConPas, EstPer, TipPer) "
                    + "VALUES ('" + this.nombre + "','" + this.apepa + "','" + this.apema + "','" + this.callenum + "',"
                    + "'" + this.colonia + "','" + this.municio + "','" + this.estado + "','Mexico',"
                    + "'" + this.codigopsotal + "','" + this.tel1 + "','" + this.tel2 + "','" + this.correo + "',"
                    + "'" + this.fecha_nac + "','" + this.rfc + "','" + this.sexo + "','null',"
                    + "'" + this.usuario + "','" + this.contraseña + "','A','U'"
                    + ")";
            c.insUpd(sql);
            System.out.println("" + sql);
            System.out.println("" + c.insUpd(sql));
            return true;
        } catch (Exception e) {
            return false;
        }

    }

    public String BuscarUsuarios() throws ServletException, SQLException {
        String consulta = "";
        conexion c = new conexion();
        String result[] = c.select("select * from persona where UsuPer like '%"+this.usuario+"%'");
            for (int i = 0; i < result.length; i++) {
                String spl[] = result[i].split(", ");
                consulta += "<a style=\"text-decoration:none;\" href=\"usuario_completo.jsp?id="+spl[0]+"\">";
                consulta += "<div class=\"display_box\" align=\"left\">";
                consulta += "<div style=\"margin-right:6px;\"><b>" + spl[1] + " " + spl[2] + " " + spl[3] + "</b></div>";
                consulta += "<div style=\"margin-right:6px; font-size:14px;\" class=\"desc\">" + spl[17] + "</div></div>";
                consulta += "</a>";
            }
            return consulta;
    }
}
