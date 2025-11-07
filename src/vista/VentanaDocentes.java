package vista;

import controlador.DocenteController;
import java.awt.*;
import java.util.List;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import modelo.Docente;
import modelo.DocenteDAO;

public class VentanaDocentes extends JFrame {

    DocenteDAO dao = new DocenteDAO();
    DocenteController controller = new DocenteController();
    JTable tabla;
    DefaultTableModel modelo;

    public VentanaDocentes() {
        setTitle("Gestión de Docentes");
        setSize(800, 400);
        setLayout(new BorderLayout());

        modelo = new DefaultTableModel(new Object[]{
                "ID", "Nombre", "Identificación", "Tipo ID", "Género",
                "Correo", "Título", "Idiomas", "Certificaciones"
        }, 0);
        tabla = new JTable(modelo);
        add(new JScrollPane(tabla), BorderLayout.CENTER);

        JPanel panelBotones = new JPanel();
        JButton btnCargar = new JButton("Cargar Docentes");
        JButton btnCrear = new JButton("Agregar");
        JButton btnActualizar = new JButton("Actualizar");
        JButton btnEliminar = new JButton("Eliminar");

        btnCargar.addActionListener(e -> cargarDatos());
        btnCrear.addActionListener(e -> controller.crearDocente());
        btnActualizar.addActionListener(e -> controller.listarDocentes());
        btnEliminar.addActionListener(e -> controller.eliminarDocente());

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
        List<Docente> lista = dao.listar();
        for (Docente d : lista) {
            modelo.addRow(new Object[]{
                    d.getDocenteId(), d.getNombreDocente(), d.getIdentificacion(),
                    d.getTipoIdentificacion(), d.getGenero(), d.getCorreo(),
                    d.getTituloEstudios(), d.getIdiomas(), d.getCertificaciones()
            });
        }
    }
}
