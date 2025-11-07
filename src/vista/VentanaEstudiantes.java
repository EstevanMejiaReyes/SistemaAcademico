package vista;

import controlador.EstudianteController;
import java.awt.*;
import java.util.List;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import modelo.Estudiante;
import modelo.EstudianteDAO;

public class VentanaEstudiantes extends JFrame {

    EstudianteDAO dao = new EstudianteDAO();
    EstudianteController controller = new EstudianteController();
    JTable tabla;
    DefaultTableModel modelo;

    public VentanaEstudiantes() {
        setTitle("Gestión de Estudiantes");
        setSize(800, 400);
        setLayout(new BorderLayout());

        modelo = new DefaultTableModel(new Object[]{
                "ID", "Identificación", "Nombre", "Correo Institucional",
                "Correo Personal", "Teléfono", "Vocero", "Tipo Documento", "Género", "Comentarios"
        }, 0);
        tabla = new JTable(modelo);
        add(new JScrollPane(tabla), BorderLayout.CENTER);

        JPanel panelBotones = new JPanel();
        JButton btnCargar = new JButton("Cargar Estudiantes");
        JButton btnCrear = new JButton("Agregar");
        JButton btnActualizar = new JButton("Actualizar");
        JButton btnEliminar = new JButton("Eliminar");

        btnCargar.addActionListener(e -> cargarDatos());
        btnCrear.addActionListener(e -> controller.crearEstudiante());
        btnActualizar.addActionListener(e -> controller.actualizarEstudiante());
        btnEliminar.addActionListener(e -> controller.eliminarEstudiante());

        panelBotones.add(btnCargar);
        panelBotones.add(btnCrear);
        panelBotones.add(btnActualizar);
        panelBotones.add(btnEliminar);

        add(panelBotones, BorderLayout.SOUTH);

        setLocationRelativeTo(null);
        setVisible(true);
    }

    private void cargarDatos() {
        modelo.setRowCount(0);
        List<Estudiante> lista = dao.listar();
        for (Estudiante e : lista) {
            modelo.addRow(new Object[]{
                    e.getEstudianteId(), e.getIdentificacion(), e.getNombre(),
                    e.getCorreoInstitucional(), e.getCorreoPersonal(),
                    e.getTelefono(), e.isEsVocero(), e.getTipoDocumento(),
                    e.getGenero(), e.getComentarios()
            });
        }
    }
}
