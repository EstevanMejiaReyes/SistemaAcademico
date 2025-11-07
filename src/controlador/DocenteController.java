// DocenteController.java
package controlador;

import javax.swing.*;
import modelo.Docente;
import modelo.DocenteDAO;

public class DocenteController {

    DocenteDAO dao = new DocenteDAO();

    public void crearDocente() {
        Docente d = new Docente();
        d.setNombreDocente(JOptionPane.showInputDialog("Nombre:"));
        d.setIdentificacion(JOptionPane.showInputDialog("Identificación:"));
        d.setTipoIdentificacion("CC");
        d.setGenero(JOptionPane.showInputDialog("Género:"));
        d.setCorreo(JOptionPane.showInputDialog("Correo:"));
        d.setTituloEstudios(JOptionPane.showInputDialog("Título de estudios:"));
        d.setIdiomas(JOptionPane.showInputDialog("Idiomas:"));
        d.setCertificaciones(JOptionPane.showInputDialog("Certificaciones:"));

        JOptionPane.showMessageDialog(null, dao.crearDocente(d));
    }

    public void listarDocentes() {
        var lista = dao.listar();
        StringBuilder sb = new StringBuilder();
        for (Docente d : lista) {
            sb.append(d.getDocenteId()).append(" - ").append(d.getNombreDocente()).append("\n");
        }
        JOptionPane.showMessageDialog(null, sb.toString());
    }

    public void eliminarDocente() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    
}
