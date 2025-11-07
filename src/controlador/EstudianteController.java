// EstudianteController.java
package controlador;

import javax.swing.*;
import modelo.Estudiante;
import modelo.EstudianteDAO;

public class EstudianteController {

    EstudianteDAO dao = new EstudianteDAO();

    public void crearEstudiante() {
    Estudiante e = new Estudiante();
    e.setIdentificacion("111");
    e.setNombre("TEST");
    e.setCorreoInstitucional("TestIns@u.com");
    e.setCorreoPersonal("test@p.com");
    e.setTelefono("123456");
    e.setEsVocero(false);
    e.setTipoDocumento("CC");
    e.setGenero("M");
    e.setComentarios("prueba");

    JOptionPane.showMessageDialog(null, dao.crearEstudiante(e));
}


    public void listarEstudiantes() {
        var lista = dao.listar();
        StringBuilder sb = new StringBuilder();
        for (Estudiante e : lista) {
            sb.append(e.getEstudianteId()).append(" - ").append(e.getNombre()).append("\n");
        }
        JOptionPane.showMessageDialog(null, sb.toString());
    }

    public void actualizarEstudiante() {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID del estudiante:"));
        Estudiante e = dao.obtenerPorId(id);

        if (e == null) {
            JOptionPane.showMessageDialog(null, "Estudiante no encontrado");
            return;
        }

        e.setIdentificacion(JOptionPane.showInputDialog("Identificación:", e.getIdentificacion()));
        e.setNombre(JOptionPane.showInputDialog("Nombre:", e.getNombre()));
        e.setCorreoInstitucional(JOptionPane.showInputDialog("Correo institucional:", e.getCorreoInstitucional()));
        e.setCorreoPersonal(JOptionPane.showInputDialog("Correo personal:", e.getCorreoPersonal()));
        e.setTelefono(JOptionPane.showInputDialog("Teléfono:", e.getTelefono()));
        e.setGenero(JOptionPane.showInputDialog("Género:", e.getGenero()));

        JOptionPane.showMessageDialog(null, dao.actualizarEstudiante(e));
    }

    public void eliminarEstudiante() {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID del estudiante a eliminar:"));
        JOptionPane.showMessageDialog(null, dao.eliminarEstudiante(id));
    }
}
