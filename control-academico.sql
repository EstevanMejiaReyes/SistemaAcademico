-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: control-academico
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asistencias`
--

DROP TABLE IF EXISTS `asistencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencias` (
  `asistencia_id` int NOT NULL AUTO_INCREMENT,
  `estudiante_id` int DEFAULT NULL,
  `curso_id` int DEFAULT NULL,
  `fecha_clase` date DEFAULT NULL,
  `estado_asistencia` enum('presente','ausente','tardanza') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `novedades` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`asistencia_id`),
  KEY `estudiante_id` (`estudiante_id`),
  KEY `curso_id` (`curso_id`),
  CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`estudiante_id`),
  CONSTRAINT `asistencias_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`curso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencias`
--

LOCK TABLES `asistencias` WRITE;
/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;
INSERT INTO `asistencias` VALUES (1,1,1,'2025-02-05','presente','Sin novedad'),(2,2,1,'2025-02-05','tardanza','Llegó tarde'),(3,3,2,'2025-02-06','ausente','Ausente por enfermedad'),(4,4,3,'2025-02-10','presente','Sin novedad'),(5,5,4,'2025-02-15','presente','Participación destacada'),(6,1,1,'2025-02-05','presente','Sin novedad'),(7,2,1,'2025-02-05','tardanza','Llegó tarde'),(8,3,2,'2025-02-06','ausente','Ausente por enfermedad'),(9,4,3,'2025-02-10','presente','Sin novedad'),(10,5,4,'2025-02-15','presente','Participación destacada');
/*!40000 ALTER TABLE `asistencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones` (
  `calificacion_id` int NOT NULL AUTO_INCREMENT,
  `estudiante_id` int DEFAULT NULL,
  `componente_evaluacion_id` int DEFAULT NULL,
  `nota` decimal(3,2) NOT NULL,
  `comentarios_calificacion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`calificacion_id`),
  KEY `estudiante_id` (`estudiante_id`),
  KEY `componente_evaluacion_id` (`componente_evaluacion_id`),
  CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`estudiante_id`),
  CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`componente_evaluacion_id`) REFERENCES `componentes_evaluacion` (`componente_evaluacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` VALUES (1,1,1,3.50,'Desempeño Intermedio'),(2,2,2,3.80,'Debe mejorar precisión en resultados.'),(3,3,3,4.20,'Excelente trabajo en proyecto.'),(4,4,4,3.50,'Participación adecuada.'),(5,5,5,4.90,'Dominio total del tema.');
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clases`
--

DROP TABLE IF EXISTS `clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clases` (
  `clase_id` int NOT NULL AUTO_INCREMENT,
  `curso_id` int DEFAULT NULL,
  `numero_clase` int DEFAULT NULL,
  `fecha_clase` date DEFAULT NULL,
  `tema_clase` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion_clase` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `comentarios_clase` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`clase_id`),
  KEY `curso_id` (`curso_id`),
  CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`curso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clases`
--

LOCK TABLES `clases` WRITE;
/*!40000 ALTER TABLE `clases` DISABLE KEYS */;
INSERT INTO `clases` VALUES (1,1,1,'2025-02-05','Introducción al curso','Presentación del programa y metodología.','Clase inicial sin novedades.'),(2,1,2,'2025-02-12','Conceptos básicos','Explicación de tipos de datos y operadores.','Participación activa.'),(3,2,1,'2025-02-06','Límites y derivadas','Inicio del cálculo diferencial.','Buena asistencia.'),(4,3,1,'2025-02-10','Sistemas numéricos','Conversión entre bases y lógica binaria.','Excelente rendimiento.'),(5,4,1,'2025-02-15','Procesos y memoria','Introducción a los sistemas operativos.','Clase práctica en laboratorio.'),(6,1,1,'2025-02-05','Introducción al curso','Presentación del programa y metodología.','Clase inicial sin novedades.'),(7,1,2,'2025-02-12','Conceptos básicos','Explicación de tipos de datos y operadores.','Participación activa.'),(8,2,1,'2025-02-06','Límites y derivadas','Inicio del cálculo diferencial.','Buena asistencia.'),(9,3,1,'2025-02-10','Sistemas numéricos','Conversión entre bases y lógica binaria.','Excelente rendimiento.'),(10,4,1,'2025-02-15','Procesos y memoria','Introducción a los sistemas operativos.','Clase práctica en laboratorio.');
/*!40000 ALTER TABLE `clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componentes_evaluacion`
--

DROP TABLE IF EXISTS `componentes_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componentes_evaluacion` (
  `componente_evaluacion_id` int NOT NULL AUTO_INCREMENT,
  `corte_evaluacion_id` int DEFAULT NULL,
  `nombre_componente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  PRIMARY KEY (`componente_evaluacion_id`),
  KEY `corte_evaluacion_id` (`corte_evaluacion_id`),
  CONSTRAINT `componentes_evaluacion_ibfk_1` FOREIGN KEY (`corte_evaluacion_id`) REFERENCES `cortes_evaluacion` (`corte_evaluacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentes_evaluacion`
--

LOCK TABLES `componentes_evaluacion` WRITE;
/*!40000 ALTER TABLE `componentes_evaluacion` DISABLE KEYS */;
INSERT INTO `componentes_evaluacion` VALUES (1,1,'Taller 1',10.00),(2,1,'Examen Parcial',20.00),(3,2,'Proyecto Intermedio',30.00),(4,3,'Taller Final',20.00),(5,3,'Examen Final',30.00);
/*!40000 ALTER TABLE `componentes_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cortes_evaluacion`
--

DROP TABLE IF EXISTS `cortes_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cortes_evaluacion` (
  `corte_evaluacion_id` int NOT NULL AUTO_INCREMENT,
  `curso_id` int DEFAULT NULL,
  `periodo_academico_id` int DEFAULT NULL,
  `nombre_corte` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  `comentarios_corte` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`corte_evaluacion_id`),
  KEY `curso_id` (`curso_id`),
  KEY `periodo_academico_id` (`periodo_academico_id`),
  CONSTRAINT `cortes_evaluacion_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`curso_id`),
  CONSTRAINT `cortes_evaluacion_ibfk_2` FOREIGN KEY (`periodo_academico_id`) REFERENCES `periodos_academicos` (`periodo_academico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cortes_evaluacion`
--

LOCK TABLES `cortes_evaluacion` WRITE;
/*!40000 ALTER TABLE `cortes_evaluacion` DISABLE KEYS */;
INSERT INTO `cortes_evaluacion` VALUES (1,NULL,NULL,'Corte 1',30.00,NULL),(2,NULL,NULL,'Corte 2',30.00,NULL),(3,NULL,NULL,'Corte 3',40.00,NULL),(4,NULL,NULL,'Recuperación',10.00,NULL),(5,NULL,NULL,'Final',100.00,NULL);
/*!40000 ALTER TABLE `cortes_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `curso_id` int NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `periodo_academico_id` int DEFAULT NULL,
  `docente_id` int DEFAULT NULL,
  `descripcion_curso` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`curso_id`),
  KEY `periodo_academico_id` (`periodo_academico_id`),
  KEY `docente_id` (`docente_id`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`periodo_academico_id`) REFERENCES `periodos_academicos` (`periodo_academico_id`),
  CONSTRAINT `cursos_ibfk_2` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`docente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Programación I',3,1,'Introducción a la programación estructurada en Java'),(2,'Base de Datos I',3,2,'Diseño y consultas SQL básicas'),(3,'Matemáticas Discretas',4,3,'Lógica, conjuntos y estructuras discretas'),(4,'Sistemas Operativos',4,4,'Gestión de procesos, memoria y archivos'),(5,'Gestión de Proyectos TI',5,5,'Planificación y control de proyectos tecnológicos'),(6,'Programación I',3,1,'Introducción a la programación estructurada en Java'),(7,'Base de Datos I',3,2,'Diseño y consultas SQL básicas'),(8,'Matemáticas Discretas',4,3,'Lógica, conjuntos y estructuras discretas'),(9,'Sistemas Operativos',4,4,'Gestión de procesos, memoria y archivos'),(10,'Gestión de Proyectos TI',5,5,'Planificación y control de proyectos tecnológicos');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `docente_id` int NOT NULL AUTO_INCREMENT,
  `nombre_docente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `identificacion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo_identificacion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `genero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `titulo_estudios` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idiomas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `certificaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`docente_id`),
  UNIQUE KEY `identificacion` (`identificacion`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` VALUES (1,'Carlos Gómez','1094887001','CC','M','carlos.gomez@uniajc.edu.co','Ingeniero de Sistemas','Español, Inglés','Certificación Java'),(2,'María Restrepo','1094887002','CC','F','maria.restrepo@uniajc.edu.co','Licenciada en Matemáticas','Español','Certificación en Docencia'),(3,'Andrés López','1094887003','CC','M','andres.lopez@uniajc.edu.co','Ingeniero Electrónico','Español, Inglés','Certificación en Robótica'),(4,'Laura Torres','1094887004','CC','F','laura.torres@uniajc.edu.co','Psicóloga','Español','Especialización en Psicología Educativa'),(5,'Felipe Ramírez','1094887005','CC','M','felipe.ramirez@uniajc.edu.co','Administrador de Empresas','Español, Inglés','MBA en Finanzas'),(17,'Sofía Mendoza','1094887006','CC','F','sofia.mendoza@uniajc.edu.co','Licenciada en Lenguas Modernas','Español, Inglés, Francés','Certificación TOEFL'),(18,'Jorge Herrera','1094887007','CC','M','jorge.herrera@uniajc.edu.co','Ingeniero Civil','Español','Certificación en AutoCAD'),(19,'Natalia Jiménez','1094887008','CC','F','natalia.jimenez@uniajc.edu.co','Bióloga','Español, Inglés','Maestría en Biotecnología'),(20,'Ricardo Díaz','1094887009','CC','M','ricardo.diaz@uniajc.edu.co','Economista','Español','Certificación en Finanzas Internacionales'),(21,'Paola Castillo','1094887010','CC','F','paola.castillo@uniajc.edu.co','Diseñadora Gráfica','Español, Inglés','Certificación Adobe Creative Suite');
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes_cursos`
--

DROP TABLE IF EXISTS `docentes_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_cursos` (
  `docente_id` int NOT NULL,
  `curso_id` int NOT NULL,
  PRIMARY KEY (`docente_id`,`curso_id`),
  KEY `curso_id` (`curso_id`),
  CONSTRAINT `docentes_cursos_ibfk_1` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`docente_id`),
  CONSTRAINT `docentes_cursos_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`curso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes_cursos`
--

LOCK TABLES `docentes_cursos` WRITE;
/*!40000 ALTER TABLE `docentes_cursos` DISABLE KEYS */;
INSERT INTO `docentes_cursos` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `docentes_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `estudiante_id` int NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correo_institucional` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `correo_personal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `es_vocero` tinyint(1) DEFAULT '0',
  `comentarios` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tipo_documento` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `genero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`estudiante_id`),
  UNIQUE KEY `identificacion` (`identificacion`),
  UNIQUE KEY `correo_institucional` (`correo_institucional`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'1113519549','Joan Estevan Mejia Reyes','jestevanmejia@estudiante.edu.co','estevanmejia402@gmail.com','3226589397',0,'Estudiante activo','CC','M'),(2,'100002','Ana Gómez','ana.gomez@uniajc.edu.co','anag@gmail.com','3019876543',1,'Vocera del grupo','CC','F'),(3,'100003','Luis Martínez','luis.martinez@uniajc.edu.co','luism@gmail.com','3025556677',0,'Enfocado en programación','CC','M'),(4,'100004','Carolina Sánchez','carolina.sanchez@uniajc.edu.co','caros@gmail.com','3049988776',0,'Excelente desempeño académico','CC','F'),(5,'1114678543','David Jesus Torrez','david.torres@estudiante.uniajc.edu.co','davidt@gmail.com','3054455667',0,'Participa en grupo de investigación','CC','M'),(6,'123','Test Name','test@uni.com','test@gmail.com','3000000000',0,'ninguno','CC','M'),(12,'100006','Valentina Ruiz','valentina.ruiz@uniajc.edu.co','valruiz@gmail.com','3061122334',0,'Interesada en diseño gráfico','CC','F'),(13,'100007','Camilo Ortega','camilo.ortega@uniajc.edu.co','camortega@gmail.com','3072233445',1,'Vocero del grupo de ingeniería','CC','M'),(14,'100008','Isabela Fernández','isabela.fernandez@uniajc.edu.co','isafer@gmail.com','3083344556',0,'Participa en semillero de investigación','CC','F'),(15,'100009','Mateo Ríos','mateo.rios@uniajc.edu.co','mateor@gmail.com','3094455667',0,'Apasionado por la biología','CC','M'),(16,'100010','Daniela Castro','daniela.castro@uniajc.edu.co','dancas@gmail.com','3105566778',0,'Excelente desempeño en matemáticas','CC','F');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodos_academicos`
--

DROP TABLE IF EXISTS `periodos_academicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodos_academicos` (
  `periodo_academico_id` int NOT NULL AUTO_INCREMENT,
  `nombre_periodo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`periodo_academico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos_academicos`
--

LOCK TABLES `periodos_academicos` WRITE;
/*!40000 ALTER TABLE `periodos_academicos` DISABLE KEYS */;
INSERT INTO `periodos_academicos` VALUES (1,'2024-1','2024-02-01','2024-06-30'),(2,'2024-2','2024-07-01','2024-11-30'),(3,'2025-1','2025-02-01','2025-06-30'),(4,'2025-2','2025-07-01','2025-11-30'),(5,'2026-1','2026-02-01','2026-06-30'),(6,'2024-1','2024-02-01','2024-06-30'),(7,'2024-2','2024-07-01','2024-11-30'),(8,'2025-1','2025-02-01','2025-06-30'),(9,'2025-2','2025-07-01','2025-11-30'),(10,'2026-1','2026-02-01','2026-06-30');
/*!40000 ALTER TABLE `periodos_academicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_asistencias_detalladas`
--

DROP TABLE IF EXISTS `vista_asistencias_detalladas`;
/*!50001 DROP VIEW IF EXISTS `vista_asistencias_detalladas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_asistencias_detalladas` AS SELECT 
 1 AS `asistencia_id`,
 1 AS `estudiante_id`,
 1 AS `estudiante_identificacion`,
 1 AS `estudiante_nombre`,
 1 AS `curso_id`,
 1 AS `nombre_curso`,
 1 AS `nombre_docente`,
 1 AS `nombre_periodo`,
 1 AS `fecha_clase`,
 1 AS `numero_clase`,
 1 AS `tema_clase`,
 1 AS `estado_asistencia`,
 1 AS `estado_texto`,
 1 AS `novedades`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_calificaciones_detalladas`
--

DROP TABLE IF EXISTS `vista_calificaciones_detalladas`;
/*!50001 DROP VIEW IF EXISTS `vista_calificaciones_detalladas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_calificaciones_detalladas` AS SELECT 
 1 AS `calificacion_id`,
 1 AS `estudiante_id`,
 1 AS `estudiante_identificacion`,
 1 AS `estudiante_nombre`,
 1 AS `curso_id`,
 1 AS `nombre_curso`,
 1 AS `nombre_periodo`,
 1 AS `corte_evaluacion_id`,
 1 AS `nombre_corte`,
 1 AS `porcentaje_corte`,
 1 AS `componente_evaluacion_id`,
 1 AS `nombre_componente`,
 1 AS `porcentaje_componente`,
 1 AS `nota`,
 1 AS `comentarios_calificacion`,
 1 AS `nota_ponderada_componente`,
 1 AS `aporte_nota_final`,
 1 AS `concepto_nota`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_clases_completas`
--

DROP TABLE IF EXISTS `vista_clases_completas`;
/*!50001 DROP VIEW IF EXISTS `vista_clases_completas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clases_completas` AS SELECT 
 1 AS `clase_id`,
 1 AS `curso_id`,
 1 AS `nombre_curso`,
 1 AS `nombre_docente`,
 1 AS `nombre_periodo`,
 1 AS `numero_clase`,
 1 AS `fecha_clase`,
 1 AS `tema_clase`,
 1 AS `descripcion_clase`,
 1 AS `comentarios_clase`,
 1 AS `total_asistencias_registradas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_cursos_completa`
--

DROP TABLE IF EXISTS `vista_cursos_completa`;
/*!50001 DROP VIEW IF EXISTS `vista_cursos_completa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cursos_completa` AS SELECT 
 1 AS `curso_id`,
 1 AS `nombre_curso`,
 1 AS `descripcion_curso`,
 1 AS `docente_id`,
 1 AS `nombre_docente`,
 1 AS `correo_docente`,
 1 AS `titulo_estudios`,
 1 AS `periodo_academico_id`,
 1 AS `nombre_periodo`,
 1 AS `periodo_inicio`,
 1 AS `periodo_fin`,
 1 AS `total_clases`,
 1 AS `total_cortes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_docentes_cursos`
--

DROP TABLE IF EXISTS `vista_docentes_cursos`;
/*!50001 DROP VIEW IF EXISTS `vista_docentes_cursos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_docentes_cursos` AS SELECT 
 1 AS `docente_id`,
 1 AS `nombre_docente`,
 1 AS `correo`,
 1 AS `titulo_estudios`,
 1 AS `curso_id`,
 1 AS `nombre_curso`,
 1 AS `periodo_academico_id`,
 1 AS `nombre_periodo`,
 1 AS `fecha_inicio`,
 1 AS `fecha_fin`,
 1 AS `total_estudiantes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_estadisticas_curso`
--

DROP TABLE IF EXISTS `vista_estadisticas_curso`;
/*!50001 DROP VIEW IF EXISTS `vista_estadisticas_curso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_estadisticas_curso` AS SELECT 
 1 AS `curso_id`,
 1 AS `nombre_curso`,
 1 AS `nombre_periodo`,
 1 AS `nombre_docente`,
 1 AS `total_estudiantes`,
 1 AS `total_clases_programadas`,
 1 AS `estudiantes_con_notas`,
 1 AS `promedio_curso`,
 1 AS `nota_mas_alta`,
 1 AS `nota_mas_baja`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_estructura_evaluacion`
--

DROP TABLE IF EXISTS `vista_estructura_evaluacion`;
/*!50001 DROP VIEW IF EXISTS `vista_estructura_evaluacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_estructura_evaluacion` AS SELECT 
 1 AS `curso_id`,
 1 AS `nombre_curso`,
 1 AS `nombre_periodo`,
 1 AS `corte_evaluacion_id`,
 1 AS `nombre_corte`,
 1 AS `porcentaje_corte`,
 1 AS `componente_evaluacion_id`,
 1 AS `nombre_componente`,
 1 AS `porcentaje_componente`,
 1 AS `porcentaje_sobre_total`,
 1 AS `comentarios_corte`,
 1 AS `estudiantes_con_nota`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_estudiantes_contacto`
--

DROP TABLE IF EXISTS `vista_estudiantes_contacto`;
/*!50001 DROP VIEW IF EXISTS `vista_estudiantes_contacto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_estudiantes_contacto` AS SELECT 
 1 AS `estudiante_id`,
 1 AS `identificacion`,
 1 AS `nombre`,
 1 AS `correo_institucional`,
 1 AS `correo_personal`,
 1 AS `telefono`,
 1 AS `tipo_documento`,
 1 AS `genero`,
 1 AS `es_vocero`,
 1 AS `es_vocero_texto`,
 1 AS `comentarios`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_notas_finales`
--

DROP TABLE IF EXISTS `vista_notas_finales`;
/*!50001 DROP VIEW IF EXISTS `vista_notas_finales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_notas_finales` AS SELECT 
 1 AS `estudiante_id`,
 1 AS `identificacion`,
 1 AS `estudiante`,
 1 AS `curso_id`,
 1 AS `nombre_curso`,
 1 AS `nombre_periodo`,
 1 AS `nombre_docente`,
 1 AS `nota_final`,
 1 AS `estado`,
 1 AS `concepto_final`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_porcentaje_asistencia`
--

DROP TABLE IF EXISTS `vista_porcentaje_asistencia`;
/*!50001 DROP VIEW IF EXISTS `vista_porcentaje_asistencia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_porcentaje_asistencia` AS SELECT 
 1 AS `estudiante_id`,
 1 AS `identificacion`,
 1 AS `estudiante`,
 1 AS `curso_id`,
 1 AS `nombre_curso`,
 1 AS `total_clases`,
 1 AS `clases_presentes`,
 1 AS `tardanzas`,
 1 AS `ausencias`,
 1 AS `porcentaje_asistencia`,
 1 AS `cumple_asistencia_minima`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ranking_estudiantes`
--

DROP TABLE IF EXISTS `vista_ranking_estudiantes`;
/*!50001 DROP VIEW IF EXISTS `vista_ranking_estudiantes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ranking_estudiantes` AS SELECT 
 1 AS `ranking`,
 1 AS `estudiante_id`,
 1 AS `estudiante`,
 1 AS `curso_id`,
 1 AS `nombre_curso`,
 1 AS `nota_final`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'control-academico'
--

--
-- Final view structure for view `vista_asistencias_detalladas`
--

/*!50001 DROP VIEW IF EXISTS `vista_asistencias_detalladas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_asistencias_detalladas` AS select `a`.`asistencia_id` AS `asistencia_id`,`e`.`estudiante_id` AS `estudiante_id`,`e`.`identificacion` AS `estudiante_identificacion`,`e`.`nombre` AS `estudiante_nombre`,`c`.`curso_id` AS `curso_id`,`c`.`nombre_curso` AS `nombre_curso`,`d`.`nombre_docente` AS `nombre_docente`,`p`.`nombre_periodo` AS `nombre_periodo`,`a`.`fecha_clase` AS `fecha_clase`,`cl`.`numero_clase` AS `numero_clase`,`cl`.`tema_clase` AS `tema_clase`,`a`.`estado_asistencia` AS `estado_asistencia`,(case when (`a`.`estado_asistencia` = 'presente') then '✓ Presente' when (`a`.`estado_asistencia` = 'ausente') then '✗ Ausente' when (`a`.`estado_asistencia` = 'tardanza') then '⚠ Tardanza' end) AS `estado_texto`,`a`.`novedades` AS `novedades` from (((((`asistencias` `a` join `estudiantes` `e` on((`a`.`estudiante_id` = `e`.`estudiante_id`))) join `cursos` `c` on((`a`.`curso_id` = `c`.`curso_id`))) join `periodos_academicos` `p` on((`c`.`periodo_academico_id` = `p`.`periodo_academico_id`))) left join `docentes` `d` on((`c`.`docente_id` = `d`.`docente_id`))) left join `clases` `cl` on(((`cl`.`curso_id` = `a`.`curso_id`) and (`cl`.`fecha_clase` = `a`.`fecha_clase`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_calificaciones_detalladas`
--

/*!50001 DROP VIEW IF EXISTS `vista_calificaciones_detalladas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_calificaciones_detalladas` AS select `cal`.`calificacion_id` AS `calificacion_id`,`e`.`estudiante_id` AS `estudiante_id`,`e`.`identificacion` AS `estudiante_identificacion`,`e`.`nombre` AS `estudiante_nombre`,`c`.`curso_id` AS `curso_id`,`c`.`nombre_curso` AS `nombre_curso`,`p`.`nombre_periodo` AS `nombre_periodo`,`corte`.`corte_evaluacion_id` AS `corte_evaluacion_id`,`corte`.`nombre_corte` AS `nombre_corte`,`corte`.`porcentaje` AS `porcentaje_corte`,`comp`.`componente_evaluacion_id` AS `componente_evaluacion_id`,`comp`.`nombre_componente` AS `nombre_componente`,`comp`.`porcentaje` AS `porcentaje_componente`,`cal`.`nota` AS `nota`,`cal`.`comentarios_calificacion` AS `comentarios_calificacion`,round(((`cal`.`nota` * `comp`.`porcentaje`) / 100.0),2) AS `nota_ponderada_componente`,round(((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * `corte`.`porcentaje`) / 100.0),2) AS `aporte_nota_final`,(case when (`cal`.`nota` >= 4.5) then 'Excelente' when (`cal`.`nota` >= 4.0) then 'Sobresaliente' when (`cal`.`nota` >= 3.5) then 'Bueno' when (`cal`.`nota` >= 3.0) then 'Aceptable' when (`cal`.`nota` >= 2.0) then 'Insuficiente' else 'Deficiente' end) AS `concepto_nota` from (((((`calificaciones` `cal` join `estudiantes` `e` on((`cal`.`estudiante_id` = `e`.`estudiante_id`))) join `componentes_evaluacion` `comp` on((`cal`.`componente_evaluacion_id` = `comp`.`componente_evaluacion_id`))) join `cortes_evaluacion` `corte` on((`comp`.`corte_evaluacion_id` = `corte`.`corte_evaluacion_id`))) join `cursos` `c` on((`corte`.`curso_id` = `c`.`curso_id`))) join `periodos_academicos` `p` on((`c`.`periodo_academico_id` = `p`.`periodo_academico_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_clases_completas`
--

/*!50001 DROP VIEW IF EXISTS `vista_clases_completas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clases_completas` AS select `cl`.`clase_id` AS `clase_id`,`cl`.`curso_id` AS `curso_id`,`c`.`nombre_curso` AS `nombre_curso`,`d`.`nombre_docente` AS `nombre_docente`,`p`.`nombre_periodo` AS `nombre_periodo`,`cl`.`numero_clase` AS `numero_clase`,`cl`.`fecha_clase` AS `fecha_clase`,`cl`.`tema_clase` AS `tema_clase`,`cl`.`descripcion_clase` AS `descripcion_clase`,`cl`.`comentarios_clase` AS `comentarios_clase`,(select count(0) from `asistencias` `a` where ((`a`.`curso_id` = `cl`.`curso_id`) and (`a`.`fecha_clase` = `cl`.`fecha_clase`))) AS `total_asistencias_registradas` from (((`clases` `cl` join `cursos` `c` on((`cl`.`curso_id` = `c`.`curso_id`))) left join `docentes` `d` on((`c`.`docente_id` = `d`.`docente_id`))) left join `periodos_academicos` `p` on((`c`.`periodo_academico_id` = `p`.`periodo_academico_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cursos_completa`
--

/*!50001 DROP VIEW IF EXISTS `vista_cursos_completa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cursos_completa` AS select `c`.`curso_id` AS `curso_id`,`c`.`nombre_curso` AS `nombre_curso`,`c`.`descripcion_curso` AS `descripcion_curso`,`d`.`docente_id` AS `docente_id`,`d`.`nombre_docente` AS `nombre_docente`,`d`.`correo` AS `correo_docente`,`d`.`titulo_estudios` AS `titulo_estudios`,`p`.`periodo_academico_id` AS `periodo_academico_id`,`p`.`nombre_periodo` AS `nombre_periodo`,`p`.`fecha_inicio` AS `periodo_inicio`,`p`.`fecha_fin` AS `periodo_fin`,(select count(0) from `clases` `cl` where (`cl`.`curso_id` = `c`.`curso_id`)) AS `total_clases`,(select count(0) from `cortes_evaluacion` `ce` where (`ce`.`curso_id` = `c`.`curso_id`)) AS `total_cortes` from ((`cursos` `c` left join `docentes` `d` on((`c`.`docente_id` = `d`.`docente_id`))) left join `periodos_academicos` `p` on((`c`.`periodo_academico_id` = `p`.`periodo_academico_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_docentes_cursos`
--

/*!50001 DROP VIEW IF EXISTS `vista_docentes_cursos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_docentes_cursos` AS select `d`.`docente_id` AS `docente_id`,`d`.`nombre_docente` AS `nombre_docente`,`d`.`correo` AS `correo`,`d`.`titulo_estudios` AS `titulo_estudios`,`c`.`curso_id` AS `curso_id`,`c`.`nombre_curso` AS `nombre_curso`,`p`.`periodo_academico_id` AS `periodo_academico_id`,`p`.`nombre_periodo` AS `nombre_periodo`,`p`.`fecha_inicio` AS `fecha_inicio`,`p`.`fecha_fin` AS `fecha_fin`,(select count(distinct `a`.`estudiante_id`) from `asistencias` `a` where (`a`.`curso_id` = `c`.`curso_id`)) AS `total_estudiantes` from ((`docentes` `d` left join `cursos` `c` on((`d`.`docente_id` = `c`.`docente_id`))) left join `periodos_academicos` `p` on((`c`.`periodo_academico_id` = `p`.`periodo_academico_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_estadisticas_curso`
--

/*!50001 DROP VIEW IF EXISTS `vista_estadisticas_curso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estadisticas_curso` AS select `c`.`curso_id` AS `curso_id`,`c`.`nombre_curso` AS `nombre_curso`,`p`.`nombre_periodo` AS `nombre_periodo`,`d`.`nombre_docente` AS `nombre_docente`,(select count(distinct `a`.`estudiante_id`) from `asistencias` `a` where (`a`.`curso_id` = `c`.`curso_id`)) AS `total_estudiantes`,(select count(0) from `clases` `cl` where (`cl`.`curso_id` = `c`.`curso_id`)) AS `total_clases_programadas`,(select count(distinct `cal`.`estudiante_id`) from ((`calificaciones` `cal` join `componentes_evaluacion` `comp` on((`cal`.`componente_evaluacion_id` = `comp`.`componente_evaluacion_id`))) join `cortes_evaluacion` `corte` on((`comp`.`corte_evaluacion_id` = `corte`.`corte_evaluacion_id`))) where (`corte`.`curso_id` = `c`.`curso_id`)) AS `estudiantes_con_notas`,(select round(avg(`notas`.`nota_final`),2) from (select sum((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * (`corte`.`porcentaje` / 100.0))) AS `nota_final` from ((`calificaciones` `cal` join `componentes_evaluacion` `comp` on((`cal`.`componente_evaluacion_id` = `comp`.`componente_evaluacion_id`))) join `cortes_evaluacion` `corte` on((`comp`.`corte_evaluacion_id` = `corte`.`corte_evaluacion_id`))) where (`corte`.`curso_id` = `c`.`curso_id`) group by `cal`.`estudiante_id`) `notas`) AS `promedio_curso`,(select round(max(`notas`.`nota_final`),2) from (select sum((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * (`corte`.`porcentaje` / 100.0))) AS `nota_final` from ((`calificaciones` `cal` join `componentes_evaluacion` `comp` on((`cal`.`componente_evaluacion_id` = `comp`.`componente_evaluacion_id`))) join `cortes_evaluacion` `corte` on((`comp`.`corte_evaluacion_id` = `corte`.`corte_evaluacion_id`))) where (`corte`.`curso_id` = `c`.`curso_id`) group by `cal`.`estudiante_id`) `notas`) AS `nota_mas_alta`,(select round(min(`notas`.`nota_final`),2) from (select sum((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * (`corte`.`porcentaje` / 100.0))) AS `nota_final` from ((`calificaciones` `cal` join `componentes_evaluacion` `comp` on((`cal`.`componente_evaluacion_id` = `comp`.`componente_evaluacion_id`))) join `cortes_evaluacion` `corte` on((`comp`.`corte_evaluacion_id` = `corte`.`corte_evaluacion_id`))) where (`corte`.`curso_id` = `c`.`curso_id`) group by `cal`.`estudiante_id`) `notas`) AS `nota_mas_baja` from ((`cursos` `c` left join `docentes` `d` on((`c`.`docente_id` = `d`.`docente_id`))) left join `periodos_academicos` `p` on((`c`.`periodo_academico_id` = `p`.`periodo_academico_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_estructura_evaluacion`
--

/*!50001 DROP VIEW IF EXISTS `vista_estructura_evaluacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estructura_evaluacion` AS select `c`.`curso_id` AS `curso_id`,`c`.`nombre_curso` AS `nombre_curso`,`p`.`nombre_periodo` AS `nombre_periodo`,`corte`.`corte_evaluacion_id` AS `corte_evaluacion_id`,`corte`.`nombre_corte` AS `nombre_corte`,`corte`.`porcentaje` AS `porcentaje_corte`,`comp`.`componente_evaluacion_id` AS `componente_evaluacion_id`,`comp`.`nombre_componente` AS `nombre_componente`,`comp`.`porcentaje` AS `porcentaje_componente`,round(((`corte`.`porcentaje` * `comp`.`porcentaje`) / 100.0),2) AS `porcentaje_sobre_total`,`corte`.`comentarios_corte` AS `comentarios_corte`,(select count(distinct `cal`.`estudiante_id`) from `calificaciones` `cal` where (`cal`.`componente_evaluacion_id` = `comp`.`componente_evaluacion_id`)) AS `estudiantes_con_nota` from (((`cursos` `c` join `periodos_academicos` `p` on((`c`.`periodo_academico_id` = `p`.`periodo_academico_id`))) join `cortes_evaluacion` `corte` on((`c`.`curso_id` = `corte`.`curso_id`))) join `componentes_evaluacion` `comp` on((`corte`.`corte_evaluacion_id` = `comp`.`corte_evaluacion_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_estudiantes_contacto`
--

/*!50001 DROP VIEW IF EXISTS `vista_estudiantes_contacto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estudiantes_contacto` AS select `e`.`estudiante_id` AS `estudiante_id`,`e`.`identificacion` AS `identificacion`,`e`.`nombre` AS `nombre`,`e`.`correo_institucional` AS `correo_institucional`,`e`.`correo_personal` AS `correo_personal`,`e`.`telefono` AS `telefono`,`e`.`tipo_documento` AS `tipo_documento`,`e`.`genero` AS `genero`,`e`.`es_vocero` AS `es_vocero`,(case when (`e`.`es_vocero` = 1) then 'Sí' else 'No' end) AS `es_vocero_texto`,`e`.`comentarios` AS `comentarios` from `estudiantes` `e` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_notas_finales`
--

/*!50001 DROP VIEW IF EXISTS `vista_notas_finales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_notas_finales` AS select `e`.`estudiante_id` AS `estudiante_id`,`e`.`identificacion` AS `identificacion`,`e`.`nombre` AS `estudiante`,`c`.`curso_id` AS `curso_id`,`c`.`nombre_curso` AS `nombre_curso`,`p`.`nombre_periodo` AS `nombre_periodo`,`d`.`nombre_docente` AS `nombre_docente`,round(sum((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * (`corte`.`porcentaje` / 100.0))),2) AS `nota_final`,(case when (sum((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * (`corte`.`porcentaje` / 100.0))) >= 3.0) then 'Aprobado' else 'Reprobado' end) AS `estado`,(case when (sum((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * (`corte`.`porcentaje` / 100.0))) >= 4.5) then 'Excelente' when (sum((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * (`corte`.`porcentaje` / 100.0))) >= 4.0) then 'Sobresaliente' when (sum((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * (`corte`.`porcentaje` / 100.0))) >= 3.5) then 'Bueno' when (sum((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * (`corte`.`porcentaje` / 100.0))) >= 3.0) then 'Aceptable' when (sum((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * (`corte`.`porcentaje` / 100.0))) >= 2.0) then 'Insuficiente' else 'Deficiente' end) AS `concepto_final` from ((((((`calificaciones` `cal` join `estudiantes` `e` on((`cal`.`estudiante_id` = `e`.`estudiante_id`))) join `componentes_evaluacion` `comp` on((`cal`.`componente_evaluacion_id` = `comp`.`componente_evaluacion_id`))) join `cortes_evaluacion` `corte` on((`comp`.`corte_evaluacion_id` = `corte`.`corte_evaluacion_id`))) join `cursos` `c` on((`corte`.`curso_id` = `c`.`curso_id`))) join `periodos_academicos` `p` on((`c`.`periodo_academico_id` = `p`.`periodo_academico_id`))) left join `docentes` `d` on((`c`.`docente_id` = `d`.`docente_id`))) group by `e`.`estudiante_id`,`e`.`identificacion`,`e`.`nombre`,`c`.`curso_id`,`c`.`nombre_curso`,`p`.`nombre_periodo`,`d`.`nombre_docente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_porcentaje_asistencia`
--

/*!50001 DROP VIEW IF EXISTS `vista_porcentaje_asistencia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_porcentaje_asistencia` AS select `e`.`estudiante_id` AS `estudiante_id`,`e`.`identificacion` AS `identificacion`,`e`.`nombre` AS `estudiante`,`c`.`curso_id` AS `curso_id`,`c`.`nombre_curso` AS `nombre_curso`,count(0) AS `total_clases`,sum((case when (`a`.`estado_asistencia` = 'presente') then 1 else 0 end)) AS `clases_presentes`,sum((case when (`a`.`estado_asistencia` = 'tardanza') then 1 else 0 end)) AS `tardanzas`,sum((case when (`a`.`estado_asistencia` = 'ausente') then 1 else 0 end)) AS `ausencias`,round(((sum((case when (`a`.`estado_asistencia` = 'presente') then 1 else 0 end)) * 100.0) / count(0)),2) AS `porcentaje_asistencia`,(case when (((sum((case when (`a`.`estado_asistencia` = 'presente') then 1 else 0 end)) * 100.0) / count(0)) >= 80.0) then 'Sí' else 'No' end) AS `cumple_asistencia_minima` from ((`asistencias` `a` join `estudiantes` `e` on((`a`.`estudiante_id` = `e`.`estudiante_id`))) join `cursos` `c` on((`a`.`curso_id` = `c`.`curso_id`))) group by `e`.`estudiante_id`,`e`.`identificacion`,`e`.`nombre`,`c`.`curso_id`,`c`.`nombre_curso` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ranking_estudiantes`
--

/*!50001 DROP VIEW IF EXISTS `vista_ranking_estudiantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ranking_estudiantes` AS select row_number() OVER (PARTITION BY `c`.`curso_id` ORDER BY sum((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * (`corte`.`porcentaje` / 100.0))) desc )  AS `ranking`,`e`.`estudiante_id` AS `estudiante_id`,`e`.`nombre` AS `estudiante`,`c`.`curso_id` AS `curso_id`,`c`.`nombre_curso` AS `nombre_curso`,round(sum((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * (`corte`.`porcentaje` / 100.0))),2) AS `nota_final`,(case when (sum((((`cal`.`nota` * `comp`.`porcentaje`) / 100.0) * (`corte`.`porcentaje` / 100.0))) >= 3.0) then 'Aprobado' else 'Reprobado' end) AS `estado` from ((((`calificaciones` `cal` join `estudiantes` `e` on((`cal`.`estudiante_id` = `e`.`estudiante_id`))) join `componentes_evaluacion` `comp` on((`cal`.`componente_evaluacion_id` = `comp`.`componente_evaluacion_id`))) join `cortes_evaluacion` `corte` on((`comp`.`corte_evaluacion_id` = `corte`.`corte_evaluacion_id`))) join `cursos` `c` on((`corte`.`curso_id` = `c`.`curso_id`))) group by `e`.`estudiante_id`,`e`.`nombre`,`c`.`curso_id`,`c`.`nombre_curso` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-06 20:27:48
