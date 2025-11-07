package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    private static Connection con = null;

    public static Connection getConexion() {

        try {
            if (con != null && !con.isClosed()) {
                return con;
            }

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/control-academico?useSSL=false&serverTimezone=UTC",
                "root",
                "1113519549"
            );

        } catch (Exception e) {
            System.out.println("Error de conexión: " + e.getMessage());
        }

        return con;
    }
}
