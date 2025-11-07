// AsistenciaController.java
package controlador;

import javax.swing.*;
import java.sql.Date;
import modelo.Asistencia;
import modelo.AsistenciaDAO;

public class AsistenciaController {

    AsistenciaDAO dao = new AsistenciaDAO();

    public void registrarAsistencia() {
        Asistencia a = new Asistencia();
        a.setEstudianteId(Integer.parseInt(JOptionPane.showInputDialog("ID estudiante:")));
        a.setCursoId(Integer.parseInt(JOptionPane.showInputDialog("ID curso:")));
        a.setFechaClase(Date.valueOf(JOptionPane.showInputDialog("Fecha clase (YYYY-MM-DD):")));
        a.setEstadoAsistencia(JOptionPane.showInputDialog("Estado (presente/ausente/tardanza):"));
        a.setNovedades(JOptionPane.showInputDialog("Novedades:"));

        JOptionPane.showMessageDialog(null, dao.registrarAsistencia(a));
    }

    public void consultarAsistencias() {
        int est = Integer.parseInt(JOptionPane.showInputDialog("ID estudiante:"));
        int cur = Integer.parseInt(JOptionPane.showInputDialog("ID curso:"));

        var lista = dao.obtenerPorEstudianteCurso(est, cur);
        StringBuilder sb = new StringBuilder();
        for (Asistencia a : lista) {
            sb.append(a.getAsistenciaId()).append(" - ").append(a.getEstadoAsistencia()).append("\n");
        }
        JOptionPane.showMessageDialog(null, sb.toString());
    }
}
