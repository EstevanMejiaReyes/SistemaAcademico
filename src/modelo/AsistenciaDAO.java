package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class AsistenciaDAO {

    Connection con;

    public AsistenciaDAO() {
        con = Conexion.getConexion();
    }

    public String registrarAsistencia(Asistencia a) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_registrar_asistencia(?,?,?,?,?)}");

            cs.setInt(1, a.getEstudianteId());
            cs.setInt(2, a.getCursoId());
            cs.setDate(3, new java.sql.Date(a.getFechaClase().getTime()));
            cs.setString(4, a.getEstadoAsistencia());
            cs.setString(5, a.getNovedades());

            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString(1);

        } catch (Exception ex) {
            return "Error DAO: " + ex.getMessage();
        }
        return null;
    }

    public List<Asistencia> obtenerPorEstudianteCurso(int estudianteId, int cursoId) {
        List<Asistencia> lista = new ArrayList<>();
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_obtener_asistencias_estudiante(?,?)}");
            cs.setInt(1, estudianteId);
            cs.setInt(2, cursoId);
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                lista.add(new Asistencia(
                    rs.getInt("asistencia_id"),
                    estudianteId,
                    cursoId,
                    rs.getDate("fecha_clase"),
                    rs.getString("estado_asistencia"),
                    rs.getString("novedades")
                ));
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error DAO: " + e);
        }
        return lista;
    }

    public String actualizarAsistencia(Asistencia a) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_actualizar_asistencia(?,?,?)}");

            cs.setInt(1, a.getAsistenciaId());
            cs.setString(2, a.getEstadoAsistencia());
            cs.setString(3, a.getNovedades());

            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString(1);

        } catch (Exception ex) {
            return "Error DAO: " + ex.getMessage();
        }
        return null;
    }

    public String eliminarAsistencia(int id) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_eliminar_asistencia(?)}");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString(1);
        } catch (Exception e) {
            return "Error DAO: " + e.getMessage();
        }
        return null;
    }
}
