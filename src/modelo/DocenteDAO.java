package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class DocenteDAO {

    Connection con;

    public DocenteDAO() {
        con = Conexion.getConexion();
    }

    public String crearDocente(Docente d) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_crear_docente(?,?,?,?,?,?,?,?)}");

            cs.setString(1, d.getNombreDocente());
            cs.setString(2, d.getIdentificacion());
            cs.setString(3, d.getTipoIdentificacion());
            cs.setString(4, d.getGenero());
            cs.setString(5, d.getCorreo());
            cs.setString(6, d.getTituloEstudios());
            cs.setString(7, d.getIdiomas());
            cs.setString(8, d.getCertificaciones());

            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString(1);

        } catch (Exception ex) {
            return "Error DAO: " + ex.getMessage();
        }
        return null;
    }

    public Docente obtenerPorId(int id) {
        Docente d = null;
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_obtener_docente(?)}");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();

            if (rs.next()) {
                d = new Docente(
                    rs.getInt("docente_id"),
                    rs.getString("nombre_docente"),
                    rs.getString("identificacion"),
                    rs.getString("tipo_identificacion"),
                    rs.getString("genero"),
                    rs.getString("correo"),
                    rs.getString("titulo_estudios"),
                    rs.getString("idiomas"),
                    rs.getString("certificaciones")
                );
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error DAO: " + e);
        }
        return d;
    }

    public List<Docente> listar() {
        List<Docente> lista = new ArrayList<>();
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_listar_docentes()}");
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                lista.add(new Docente(
                    rs.getInt("docente_id"),
                    rs.getString("nombre_docente"),
                    rs.getString("identificacion"),
                    rs.getString("tipo_identificacion"),
                    rs.getString("genero"),
                    rs.getString("correo"),
                    rs.getString("titulo_estudios"),
                    rs.getString("idiomas"),
                    rs.getString("certificaciones")
                ));
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error DAO: " + e);
        }
        return lista;
    }

    public String actualizarDocente(Docente d) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_actualizar_docente(?,?,?,?,?,?,?,?,?)}");

            cs.setInt(1, d.getDocenteId());
            cs.setString(2, d.getNombreDocente());
            cs.setString(3, d.getIdentificacion());
            cs.setString(4, d.getTipoIdentificacion());
            cs.setString(5, d.getGenero());
            cs.setString(6, d.getCorreo());
            cs.setString(7, d.getTituloEstudios());
            cs.setString(8, d.getIdiomas());
            cs.setString(9, d.getCertificaciones());

            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString(1);

        } catch (Exception ex) {
            return "Error DAO: " + ex.getMessage();
        }
        return null;
    }

    public String eliminarDocente(int id) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_eliminar_docente(?)}");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString(1);
        } catch (Exception e) {
            return "Error DAO: " + e.getMessage();
        }
        return null;
    }
}
