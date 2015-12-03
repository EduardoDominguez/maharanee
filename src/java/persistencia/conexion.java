package persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

/**
 *
 * @author Roge
 */
public class conexion {

    static Connection conexión = null;
    Statement sentenciaSQL = null, sentenciaSQLaux = null;
    ResultSet cdr = null, cdraux = null;

    public conexion() throws ServletException {
        try {
            String controlador = "com.mysql.jdbc.Driver";
            Class.forName(controlador).newInstance();
            conexión = DriverManager.getConnection(
                    "jdbc:mysql://127.0.0.1:3306/mhrninven", "root", "");
            sentenciaSQL = conexión.createStatement();
            sentenciaSQLaux = conexión.createStatement();
        } catch (ClassNotFoundException e) {
            System.out.println("No se pudo cargar el controlador: "
                    + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Excepción SQL: " + e.getMessage());
        } catch (InstantiationException e) {
            System.out.println("Objeto no creado. " + e.getMessage());
        } catch (IllegalAccessException e) {
            System.out.println("Acceso ilegal. " + e.getMessage());
        }
    }
    
    public void cerrarConexion() {
        try {
            conexión.close();
        } catch (SQLException ex) {
            System.out.println("Error al cerrar conexión");
        }
    }

    public String[] select(String query) throws SQLException {
        int cont = 0, contaux = 0;
        String ret[];
        try {
            cdr = sentenciaSQL.executeQuery(query);
            cdraux = sentenciaSQLaux.executeQuery(query);
            while (cdr.next()) {
                cont++;
            }
            if (cont > 0) {
                ret = new String[cont];
                while (cdraux.next()) {
                    Integer numColumnas = 0;
                    numColumnas = cdr.getMetaData().getColumnCount();
                    ret[contaux] = "";
                    for (int i = 1; i <= numColumnas; i++) {
                        String column = cdraux.getMetaData().getColumnName(i).toString();
                        ret[contaux] += cdraux.getString(column + "") + ", ";
                    }
                    contaux++;
                }
            } else {
                ret = new String[1];
                ret[0] = "fail";
            }
        } catch (SQLException e) {
            ret = new String[1];
            ret[0] = "fail";
        }
        return ret;
    }
 public String[] select1(String query) throws SQLException {
        int cont = 0, contaux = 0;
        String ret[];
        try {
            cdr = sentenciaSQL.executeQuery(query);
            cdraux = sentenciaSQLaux.executeQuery(query);
            while (cdr.next()) {
                cont++;
            }
            if (cont > 0) {
                ret = new String[cont];
                while (cdraux.next()) {
                    Integer numColumnas = 0;
                    numColumnas = cdr.getMetaData().getColumnCount();
                    ret[contaux] = "";
                    for (int i = 1; i <= numColumnas; i++) {
                        String column = cdraux.getMetaData().getColumnName(i).toString();
                        ret[contaux] += cdraux.getString(column + "") + "# ";
                    }
                    contaux++;
                }
            } else {
                ret = new String[1];
                ret[0] = "fail";
            }
        } catch (SQLException e) {
            ret = new String[1];
            ret[0] = "fail";
        }
        return ret;
    }

    public String delete(String val, String table, String colum) throws SQLException {
        String ret = "";
        try {
            sentenciaSQL.executeUpdate("Delete from " + table + " where " + colum + " = " + val);
            ret = "ok";
        } catch (SQLException e) {
            ret = "fail";
        }
        return ret;
    }

    public String insUpd(String query) {
        String ret = "";
        try {
            sentenciaSQL.executeUpdate(query);
            ret = "ok";
        } catch (SQLException e) {
            ret = "fail";
        }
        return ret;
    }
    
}
