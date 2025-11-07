package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class CursoDAO {

    Connection con;

    public CursoDAO() {
        con = Conexion.getConexion();
    }

    public String crearCurso(Curso c) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_crear_curso(?,?,?,?)}");

            cs.setString(1, c.getNombreCurso());
            cs.setInt(2, c.getPeriodoAcademicoId());
            cs.setInt(3, c.getDocenteId());
            cs.setString(4, c.getDescripcionCurso());

            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString(1);

        } catch (Exception ex) {
            return "Error DAO: " + ex.getMessage();
        }
        return null;
    }

    public Curso obtenerPorId(int id) {
        Curso c = null;
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_obtener_curso(?)}");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();

            if (rs.next()) {
                c = new Curso(
                    rs.getInt("curso_id"),
                    rs.getString("nombre_curso"),
                    rs.getInt("periodo_academico_id"),
                    rs.getInt("docente_id"),
                    rs.getString("descripcion_curso")
                );
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error DAO: " + e);
        }
        return c;
    }

    public List<Curso> listar() {
        List<Curso> lista = new ArrayList<>();
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_listar_cursos()}");
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                lista.add(new Curso(
                    rs.getInt("curso_id"),
                    rs.getString("nombre_curso"),
                    rs.getInt("periodo_academico_id"),
                    rs.getInt("docente_id"),
                    rs.getString("descripcion_curso")
                ));
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error DAO: " + e);
        }
        return lista;
    }

    public String actualizarCurso(Curso c) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_actualizar_curso(?,?,?,?,?)}");

            cs.setInt(1, c.getCursoId());
            cs.setString(2, c.getNombreCurso());
            cs.setInt(3, c.getPeriodoAcademicoId());
            cs.setInt(4, c.getDocenteId());
            cs.setString(5, c.getDescripcionCurso());

            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString(1);

        } catch (Exception ex) {
            return "Error DAO: " + ex.getMessage();
        }
        return null;
    }

    public String eliminarCurso(int id) {
        try {
            CallableStatement cs = con.prepareCall("{CALL sp_eliminar_curso(?)}");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            if (rs.next()) return rs.getString(1);
        } catch (Exception e) {
            return "Error DAO: " + e.getMessage();
        }
        return null;
    }
}
