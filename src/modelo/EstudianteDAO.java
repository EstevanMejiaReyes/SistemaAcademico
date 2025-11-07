package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class EstudianteDAO {

    Connection con;

    public EstudianteDAO() {
        con = Conexion.getConexion();
    }

    // CREATE
   public String crearEstudiante(Estudiante e) {
    try {
        CallableStatement cs = con.prepareCall("{CALL sp_crear_estudiante(?,?,?,?,?,?,?,?,?)}");

        cs.setString(1, e.getIdentificacion());
        cs.setString(2, e.getNombre());
        cs.setString(3, e.getCorreoInstitucional());
        cs.setString(4, e.getCorreoPersonal());
        cs.setString(5, e.getTelefono());

        // Valores por defecto porque tu interfaz no los pide aún
        cs.setBoolean(6, false); // es_vocero = 0
        cs.setString(7, "CC");   // tipo_documento = CC
        cs.setString(8, e.getGenero()); // genero sí viene de tu formulario
        cs.setString(9, "");     // comentarios vacíos

       boolean hasResult = cs.execute();

if (hasResult) {
    ResultSet rs = cs.getResultSet();
    if (rs.next()) return rs.getString(1);
} else {
    return "El SP no devolvió resultado";
}


    } catch (Exception ex) {
        return "Error DAO: " + ex.getMessage();
    }
    return null;
}



    // READ ONE
    public Estudiante obtenerPorId(int id) {
        Estudiante est = null;
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_obtener_estudiante(?)}");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();

            if (rs.next()) {
                est = new Estudiante(
                    rs.getInt("estudiante_id"),
                    rs.getString("identificacion"),
                    rs.getString("nombre"),
                    rs.getString("correo_institucional"),
                    rs.getString("correo_personal"),
                    rs.getString("telefono"),
                    rs.getBoolean("es_vocero"),
                    rs.getString("tipo_documento"),
                    rs.getString("genero"),
                    rs.getString("comentarios")
                );
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error DAO: " + e);
        }
        return est;
    }

    // READ LIST
    public List<Estudiante> listar() {
        List<Estudiante> lista = new ArrayList<>();
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_listar_estudiantes()}");
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                lista.add(new Estudiante(
                    rs.getInt("estudiante_id"),
                    rs.getString("identificacion"),
                    rs.getString("nombre"),
                    rs.getString("correo_institucional"),
                    rs.getString("correo_personal"),
                    rs.getString("telefono"),
                    rs.getBoolean("es_vocero"),
                    rs.getString("tipo_documento"),
                    rs.getString("genero"),
                    rs.getString("comentarios")
                ));
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error DAO: " + e);
        }
        return lista;
    }

    // UPDATE
    public String actualizarEstudiante(Estudiante e) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_actualizar_estudiante(?,?,?,?,?,?,?,?,?,?)}");

            cs.setInt(1, e.getEstudianteId());
            cs.setString(2, e.getIdentificacion());
            cs.setString(3, e.getNombre());
            cs.setString(4, e.getCorreoInstitucional());
            cs.setString(5, e.getCorreoPersonal());
            cs.setString(6, e.getTelefono());
            cs.setBoolean(7, e.isEsVocero());
            cs.setString(8, e.getTipoDocumento());
            cs.setString(9, e.getGenero());
            cs.setString(10, e.getComentarios());

            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString("resultado");

        } catch (Exception ex) {
            return "Error DAO: " + ex.getMessage();
        }
        return null;
    }

    // DELETE
    public String eliminarEstudiante(int id) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_eliminar_estudiante(?)}");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString("resultado");
        } catch (Exception e) {
            return "Error DAO: " + e.getMessage();
        }
        return null;
    }
}
