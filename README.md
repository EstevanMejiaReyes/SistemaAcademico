# Sistema Académico

Proyecto de gestión académica desarrollado en **Java + MySQL**, que permite administrar estudiantes, docentes, cursos, calificaciones y asistencias.

---

## Descripción
Este sistema fue creado para facilitar la administración académica de una universidad.  
Permite realizar operaciones CRUD (crear, leer, actualizar y eliminar) de estudiantes y docentes, además de manejar cursos, calificaciones y reportes automáticos.

---

## Tecnologías utilizadas
- **Java (JDK 17 o superior)**
- **MySQL 8.0+**
- **JDBC** (Conector: `mysql-connector-j-8.0.33.jar`)
- **Swing** (Interfaz gráfica)
- **Procedimientos almacenados** y **vistas SQL**

---

## Estructura del proyecto

```
/SistemaAcademico  
├─ src/  
│  ├─ modelo/        → Clases y conexión a base de datos  
│  ├─ controlador/   → Lógica entre la vista y el modelo  
│  └─ vista/         → Interfaz de usuario (Swing)  
├─ lib/              → Librerías (conector MySQL)  
├─ bin/              → Archivos compilados  
└─ control-academico.sql → Script para crear la base de datos
```

---

## Cómo ejecutar el proyecto

### Crea la base de datos
Ejecuta en MySQL:
```sql
CREATE DATABASE `control-academico`;
USE `control-academico`;
SOURCE control-academico.sql;
```

### Configura la conexión
En `modelo/Conexion.java`, revisa estos datos:
```java
jdbc:mysql://localhost:3306/control-academico
usuario: root
contraseña: (1113519549)
```

### Compila
Desde la terminal (en la raíz del proyecto):
```bash
javac -cp ".;lib/mysql-connector-j-8.0.33.jar" -d bin src/modelo/*.java src/controlador/*.java src/vista/*.java
```

### Ejecuta
```bash
java -cp ".;bin;lib/*" vista.Main```

---

## Características
- Registro y validación de estudiantes.
- Gestión de docentes y cursos.
- Reportes automáticos con vistas SQL.
- Control de asistencia y calificaciones.

---

## Autor
**Joan Estevan Mejía Reyes**  
jestevanmejia@estudiante.uniajc.edu.co  
GitHub: [EstevanMejiaReyes](https://github.com/EstevanMejiaReyes)

---

*Sistema Académico - UniAJC © 2025*
