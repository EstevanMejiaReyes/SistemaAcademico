package modelo;

import java.sql.*;

public class CalificacionDAO {

    Connection con;

    public CalificacionDAO() {
        con = Conexion.getConexion();
    }

    public String registrarCalificacion(Calificacion c) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_registrar_calificacion(?,?,?,?)}");

            cs.setInt(1, c.getEstudianteId());
            cs.setInt(2, c.getComponenteEvaluacionId());
            cs.setDouble(3, c.getNota());
            cs.setString(4, c.getComentarios());

            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString(1);

        } catch (Exception ex) {
            return "Error DAO: " + ex.getMessage();
        }
        return null;
    }

    public String actualizarCalificacion(Calificacion c) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_actualizar_calificacion(?,?,?)}");

            cs.setInt(1, c.getCalificacionId());
            cs.setDouble(2, c.getNota());
            cs.setString(3, c.getComentarios());

            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString(1);

        } catch (Exception ex) {
            return "Error DAO: " + ex.getMessage();
        }
        return null;
    }

    public String eliminarCalificacion(int id) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_eliminar_calificacion(?)}");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString(1);

        } catch (Exception e) {
            return "Error DAO: " + e.getMessage();
        }
        return null;
    }
}
