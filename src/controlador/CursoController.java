// CursoController.java
package controlador;

import javax.swing.*;
import modelo.Curso;
import modelo.CursoDAO;

public class CursoController {

    CursoDAO dao = new CursoDAO();

    public void crearCurso() {
        Curso c = new Curso();
        c.setNombreCurso(JOptionPane.showInputDialog("Nombre del curso:"));
        c.setPeriodoAcademicoId(Integer.parseInt(JOptionPane.showInputDialog("ID periodo académico:")));
        c.setDocenteId(Integer.parseInt(JOptionPane.showInputDialog("ID docente:")));
        c.setDescripcionCurso(JOptionPane.showInputDialog("Descripción:"));

        JOptionPane.showMessageDialog(null, dao.crearCurso(c));
    }

    public void listarCursos() {
        var lista = dao.listar();
        StringBuilder sb = new StringBuilder();
        for (Curso c : lista) {
            sb.append(c.getCursoId()).append(" - ").append(c.getNombreCurso()).append("\n");
        }
        JOptionPane.showMessageDialog(null, sb.toString());
    }
}
