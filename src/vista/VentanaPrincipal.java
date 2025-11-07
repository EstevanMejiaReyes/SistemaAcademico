// Actualizar VentanaPrincipal para incluir calificaciones
package vista;

import javax.swing.*;
import java.awt.*;

public class VentanaPrincipal extends JFrame {

    public VentanaPrincipal() {
        setTitle("Sistema Control Académico");
        setSize(400, 350);
        setLayout(new GridLayout(6, 1));

        JButton btnEstudiantes = new JButton("Estudiantes");
        JButton btnDocentes = new JButton("Docentes");
        JButton btnCursos = new JButton("Cursos");
        JButton btnAsistencias = new JButton("Asistencias");
        JButton btnCalificaciones = new JButton("Calificaciones");
        JButton btnSalir = new JButton("Salir");

        btnEstudiantes.addActionListener(e -> new VentanaEstudiantes());
        btnDocentes.addActionListener(e -> new VentanaDocentes());
        btnCursos.addActionListener(e -> new VentanaCursos());
        btnAsistencias.addActionListener(e -> new VentanaAsistencias());
        btnCalificaciones.addActionListener(e -> new VentanaCalificaciones());
        btnSalir.addActionListener(e -> System.exit(0));

        add(btnEstudiantes);
        add(btnDocentes);
        add(btnCursos);
        add(btnAsistencias);
        add(btnCalificaciones);
        add(btnSalir);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setVisible(true);
    }
}
