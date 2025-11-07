package vista;

import controlador.CursoController;
import java.awt.*;
import java.util.List;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import modelo.Curso;
import modelo.CursoDAO;

public class VentanaCursos extends JFrame {

    CursoDAO dao = new CursoDAO();
    CursoController controller = new CursoController();
    JTable tabla;
    DefaultTableModel modelo;

    public VentanaCursos() {
        setTitle("Gestión de Cursos");
        setSize(800, 400);
        setLayout(new BorderLayout());

        modelo = new DefaultTableModel(new Object[]{
                "ID", "Nombre", "Periodo", "Docente", "Descripción"
        }, 0);
        tabla = new JTable(modelo);
        add(new JScrollPane(tabla), BorderLayout.CENTER);

        JPanel panelBotones = new JPanel();
        JButton btnCargar = new JButton("Cargar Cursos");
        JButton btnCrear = new JButton("Agregar");

        btnCargar.addActionListener(e -> cargarDatos());
        btnCrear.addActionListener(e -> controller.crearCurso());

        panelBotones.add(btnCargar);
        panelBotones.add(btnCrear);

        add(panelBotones, BorderLayout.SOUTH);
        setLocationRelativeTo(null);
        setVisible(true);
    }

    private void cargarDatos() {
        modelo.setRowCount(0);
        List<Curso> lista = dao.listar();
        for (Curso c : lista) {
            modelo.addRow(new Object[]{
                    c.getCursoId(), c.getNombreCurso(), c.getPeriodoAcademicoId(),
                    c.getDocenteId(), c.getDescripcionCurso()
            });
        }
    }
}
