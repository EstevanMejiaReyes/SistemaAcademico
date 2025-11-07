# Sistema Academico

Proyecto de gestión académica desarrollado en Java + MySQL.

## Descripción
Este sistema permite gestionar estudiantes, docentes, cursos, asistencias y calificaciones.  
Incluye una interfaz gráfica (Swing) básica para realizar operaciones CRUD y reportes simples.

## Tecnologías
- Java (JDK [versión])  
- MySQL  
- JDBC (conector `mysql-connector-j-8.0.33.jar`)  
- Swing para la interfaz de usuario  
- Procedimientos almacenados en MySQL para lógica de negocio  

## Características principales
- Gestión de **Estudiantes**  
    - Crear, leer, actualizar, eliminar  
    - Validaciones de duplicados (identificación y correo institucional)  
- Gestión de **Docentes**  
- Gestión de **Cursos**  
- Registro de **Asistencias**  
- Registro de **Calificaciones**  
- Reportes generados mediante vistas SQL para facilitar consultas  

## Estructura del proyecto
/SistemaUniversidad
├─ src/
│ ├─ modelo/ <- Clases de dominio y DAO
│ ├─ controlador/ <- Lógica de control y conexión entre GUI y modelo
│ └─ vista/ <- Interfaz de usuario (ventanas Swing)
├─ lib/ <- Librerías externas (conector MySQL)
├─ bin/ <- Archivos compilados (no se recomienda subir)
└─ control-academico.sql <- Script SQL para crear la base de datos y estructuras

## Configuración y ejecución
1. Importar el script `control-academico.sql` en MySQL para crear la base de datos, tablas, vistas y procedimientos.  
2. En el archivo `modelo/Conexion.java`, actualizar los parámetros de conexión:
   ```java
   jdbc:mysql://localhost:3306/`control-academico`?useSSL=false&serverTimezone=UTC  
   usuario: root  
   contraseña: 1113519549  

## Compila el proyecto
javac -cp ".;lib/mysql-connector-j-8.0.33.jar" -d bin src/modelo/*.java src/controlador/*.java src/vista/*.java

## Ejecuta el proyecto
java -cp ".;bin;lib/*" vista.Main

Consideraciones

Actualmente la interfaz gráfica tiene funcionalidad básica. Se recomienda añadir formularios más completos para docente, curso, etc.

Asegúrese de que el conector de MySQL se encuentre en la carpeta lib y esté actualizado.

Las vistas en la base de datos permiten reportes rápidos sin escribir consultas complejas desde la interfaz.
