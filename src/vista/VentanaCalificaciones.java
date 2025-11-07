package vista;

import controlador.CalificacionController;
import java.awt.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import modelo.CalificacionDAO;
import modelo.Conexion;

public class VentanaCalificaciones extends JFrame {

    CalificacionDAO dao = new CalificacionDAO();
    CalificacionController controller = new CalificacionController();
    JTable tabla;
    DefaultTableModel modelo;

    public VentanaCalificaciones() {
        setTitle("Gestión de Calificaciones");
        setSize(800, 400);
        setLayout(new BorderLayout());

        modelo = new DefaultTableModel(new Object[]{
                "ID", "Estudiante ID", "Componente", "Nota", "Comentarios"
        }, 0);
        tabla = new JTable(modelo);
        add(new JScrollPane(tabla), BorderLayout.CENTER);

        JPanel panelBotones = new JPanel();
        JButton btnCargar = new JButton("Cargar Calificaciones");
        JButton btnRegistrar = new JButton("Registrar");
        JButton btnActualizar = new JButton("Actualizar");
        JButton btnEliminar = new JButton("Eliminar");

        btnCargar.addActionListener(e -> cargarDatos());
        btnRegistrar.addActionListener(e -> controller.registrarCalificacion());
        btnActualizar.addActionListener(e -> controller.actualizarCalificacion());
        btnEliminar.addActionListener(e -> controller.eliminarCalificacion());

        panelBotones.add(btnCargar);
        panelBotones.add(btnRegistrar);
        panelBotones.add(btnActualizar);
        panelBotones.add(btnEliminar);

        add(panelBotones, BorderLayout.SOUTH);
        setLocationRelativeTo(null);
        setVisible(true);
    }

    private void cargarDatos() {
    modelo.setRowCount(0);
    try (var con = Conexion.getConexion();
         var stmt = con.prepareStatement("SELECT * FROM calificaciones");
         var rs = stmt.executeQuery()) {

        while (rs.next()) {
            modelo.addRow(new Object[]{
                    rs.getInt("calificacion_id"),
                    rs.getInt("estudiante_id"),
                    rs.getInt("componente_evaluacion_id"),
                    rs.getDouble("nota"),
                    rs.getString("comentarios_calificacion")
            });
        }

    } catch (Exception e) {
        JOptionPane.showMessageDialog(this, "Error al cargar: " + e.getMessage());
    }
}


}
