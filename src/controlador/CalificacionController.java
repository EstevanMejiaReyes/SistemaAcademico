// CalificacionController.java
package controlador;

import javax.swing.*;
import modelo.Calificacion;
import modelo.CalificacionDAO;

public class CalificacionController {

    CalificacionDAO dao = new CalificacionDAO();

    public void registrarCalificacion() {
        Calificacion c = new Calificacion();
        c.setEstudianteId(Integer.parseInt(JOptionPane.showInputDialog("ID estudiante:")));
        c.setComponenteEvaluacionId(Integer.parseInt(JOptionPane.showInputDialog("ID componente evaluación:")));
        c.setNota(Double.parseDouble(JOptionPane.showInputDialog("Nota:")));
        c.setComentarios(JOptionPane.showInputDialog("Comentarios:"));

        JOptionPane.showMessageDialog(null, dao.registrarCalificacion(c));
    }

    public void actualizarCalificacion() {
        Calificacion c = new Calificacion();
        c.setCalificacionId(Integer.parseInt(JOptionPane.showInputDialog("ID calificación:")));
        c.setNota(Double.parseDouble(JOptionPane.showInputDialog("Nueva nota:")));
        c.setComentarios(JOptionPane.showInputDialog("Nuevo comentario:"));

        JOptionPane.showMessageDialog(null, dao.actualizarCalificacion(c));
    }

    public void eliminarCalificacion() {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID calificación a eliminar:"));
        JOptionPane.showMessageDialog(null, dao.eliminarCalificacion(id));
    }
}
