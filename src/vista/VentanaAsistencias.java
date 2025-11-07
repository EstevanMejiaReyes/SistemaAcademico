package vista;

import controlador.AsistenciaController;
import java.awt.*;
import java.util.List;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import modelo.Asistencia;
import modelo.AsistenciaDAO;

public class VentanaAsistencias extends JFrame {

    AsistenciaDAO dao = new AsistenciaDAO();
    AsistenciaController controller = new AsistenciaController();
    JTable tabla;
    DefaultTableModel modelo;

    public VentanaAsistencias() {
        setTitle("Gestión de Asistencias");
        setSize(800, 400);
        setLayout(new BorderLayout());

        modelo = new DefaultTableModel(new Object[]{
                "ID", "Estudiante ID", "Curso ID", "Fecha", "Estado", "Novedades"
        }, 0);
        tabla = new JTable(modelo);
        add(new JScrollPane(tabla), BorderLayout.CENTER);

        JPanel panelBotones = new JPanel();
        JButton btnCargar = new JButton("Cargar Asistencias");
        JButton btnRegistrar = new JButton("Registrar");

        btnCargar.addActionListener(e -> cargarDatos());
        btnRegistrar.addActionListener(e -> controller.registrarAsistencia());

        panelBotones.add(btnCargar);
        panelBotones.add(btnRegistrar);

        add(panelBotones, BorderLayout.SOUTH);
        setLocationRelativeTo(null);
        setVisible(true);
    }

    private void cargarDatos() {
        modelo.setRowCount(0);
        List<Asistencia> lista = dao.obtenerPorEstudianteCurso(1, 1);
        for (Asistencia a : lista) {
            modelo.addRow(new Object[]{
                    a.getAsistenciaId(), a.getEstudianteId(), a.getCursoId(),
                    a.getFechaClase(), a.getEstadoAsistencia(), a.getNovedades()
            });
        }
    }
}
