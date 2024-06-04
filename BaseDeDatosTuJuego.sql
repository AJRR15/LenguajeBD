CREATE DATABASE  IF NOT EXISTS `catalogojuegos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `catalogojuegos`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: catalogojuegos
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) DEFAULT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Accion','https://wallpaperaccess.com/full/5485133.jpg',1),(2,'Aventura','https://miracomosehace.com/wp-content/uploads/2021/06/rayman-adventures.jpg',1),(3,'Deporte','https://www.fantasymundo.com/wp-content/uploads/2021/02/videojuegos-deporte-696x380.jpg',1),(4,'RPG','https://th.bing.com/th/id/R.5b3d6655abf958e6ff260ab950602fd3?rik=CmQkRHp8KU6XtA&pid=ImgRaw&r=0',1),(5,'Puzzle','https://th.bing.com/th/id/R.91c869569c86dbfd2271d79697bbb1c5?rik=A%2bO9LHlLUaEqhw&pid=ImgRaw&r=0',1),(6,'Estrategia','https://media.vandal.net/m/1-2019/2019181558171_1.jpg',1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto` (
  `id_contacto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `numero` int NOT NULL,
  `mensaje` varchar(1200) NOT NULL,
  PRIMARY KEY (`id_contacto`),
  UNIQUE KEY `idContacto_UNIQUE` (`id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES (1,'Miguel','Reyes',81127811,'Excelente Servico'),(2,'Alejhandro','Rivero',61166561,'Excelente Aplicacion'),(3,'a','v',12,'C'),(4,'Jose','Sanchez',17621,'Soy Jose gracias perros los quiero'),(6,'juan','fernandez',67545321,'Gracias por el servicio'),(7,'a','v',89812230,'c'),(8,'Ale','Rivero',89812230,'AKAKA');
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `estado` int DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,3,'2024-04-23',0,1),(2,3,'2024-04-23',0,1),(3,3,'2024-04-23',0,1),(4,1,'2024-04-24',0,1),(5,1,'2024-04-24',119.99000000000001,1),(6,3,'2024-04-24',60,1),(7,3,'2024-04-24',60,1),(8,3,'2024-04-24',120,1),(9,1,'2024-04-24',60,1),(10,1,'2024-04-24',60,1),(11,1,'2024-04-24',0,1),(12,1,'2024-04-24',0,1),(13,1,'2024-04-24',0,1),(14,1,'2024-04-24',0,1),(15,1,'2024-04-24',0,1),(16,1,'2024-04-24',0,1),(17,3,'2024-04-24',60,1),(18,20,'2024-04-24',49.99,1),(19,1,'2024-04-24',0,1),(20,1,'2024-04-24',0,1),(21,1,'2024-04-24',0,1);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacion`
--

DROP TABLE IF EXISTS `informacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informacion` (
  `id_informacion` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` int NOT NULL,
  `correo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_informacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion`
--

LOCK TABLES `informacion` WRITE;
/*!40000 ALTER TABLE `informacion` DISABLE KEYS */;
INSERT INTO `informacion` VALUES (1,'TuJuego.com',87900098,'TuJuego@gmail.com'),(2,'Servicio al CLiente TuJuego',89762311,'ServiciosTuJuego@gmail.com');
/*!40000 ALTER TABLE `informacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego`
--

DROP TABLE IF EXISTS `juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego` (
  `id_juego` int NOT NULL AUTO_INCREMENT,
  `imagen` varchar(1024) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  `precio` double NOT NULL,
  `existencias` int NOT NULL,
  `activo` tinyint NOT NULL,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_juego`),
  UNIQUE KEY `id_juego_UNIQUE` (`id_juego`),
  KEY `fk_juego_categoria` (`id_categoria`),
  CONSTRAINT `fk_juego_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego`
--

LOCK TABLES `juego` WRITE;
/*!40000 ALTER TABLE `juego` DISABLE KEYS */;
INSERT INTO `juego` VALUES (1,'https://metodologic.net/wp-content/uploads/2017/11/Mario_Odyssey_portada.jpg','Super Mario Odyssey','Nintendo',59.99,1,1,2),(2,'https://media.vandal.net/i/1440x1080/5-2023/20235223395250_1.jpg','The Legend of Zelda: Breath of the Wild','Nintendo',59.99,1,1,2),(3,'https://e1.pngegg.com/pngimages/517/222/png-clipart-grand-theft-auto-v-game-icon-gta-5-7-gta-v-game-cover-thumbnail.png','Grand Theft Auto V','Rockstar Games',29.99,1,1,1),(4,'https://futbolete.com/apuestas/wp-content/uploads/2021/09/FIFA-22-Esta-es-la-valoracion-de-Kylian-Mbappe-portada-del-juego-1200x900.jpg','FIFA 22','EA Sports',49.99,1,1,3),(5,'https://img.zonared.com/images/noticias/portada/47000/47269-h2.jpg','Minecraft','Mojang Studios',29.99,1,1,2),(6,'https://media.vandal.net/i/640x360/12-2022/202212111754215_1.jpg','The Witcher 3: Wild Hunt','CD Projekt',39.99,1,1,4),(7,'https://i.blogs.es/88d2ec/cod_mw/450_1000.webp','Call of Duty: Modern Warfare','Activision',59.99,1,1,1),(8,'https://peru21.pe/resizer/Fa-Svhhk_AnTXXhCNXXaBit9nlQ=/1200x900/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/EBZX3XFTAZAUVO4CVX3RZJ6JY4.jpg','Assassin\'s Creed Valhalla','Ubisoft',49.99,1,1,1),(9,'https://fs-prod-cdn.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_AmongUs_image1600w.jpg','Among Us','InnerSloth',4.99,1,1,5),(10,'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2023/08/29/16933298615638.jpg','League of Legends','Riot Games',0,0,1,6),(18,'https://th.bing.com/th/id/OIF.iQc8fGLtmroEcTQFjyQYpA?rs=1&pid=ImgDetMain','Battlefield 5','EA Digital',60,1,1,1);
/*!40000 ALTER TABLE `juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_rol`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ROLE_ADMIN',1),(2,'ROLE_VENDEDOR',1),(3,'ROLE_USER',1),(4,'ROLE_VENDEDOR',2),(5,'ROLE_USER',2),(6,'ROLE_USER',3),(20,'ROLE_USER',14),(25,'ROLE_USER',18),(26,'ROLE_USER',20);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `correo` varchar(25) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'juan','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Juan','Castro Mora','jcastro@gmail.com','4556-8978','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg',1),(2,'rebeca','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','Rebeca','Contreras Mora','acontreras@gmail.com','5456-8789','https://upload.wikimedia.org/wikipedia/commons/0/06/Photo_of_Rebeca_Arthur.jpg',1),(3,'pedro','$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO','Pedro','Mena Loria','lmena@gmail.com','7898-8936','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Eduardo_de_Pedro_2019.jpg/480px-Eduardo_de_Pedro_2019.jpg?20200109230854',1),(14,'ale','$2a$10$lDXwnIzDRUdpVHb3ilkDlekv8aAbwAJmXRo3h1087HuDqgk.cdPZy','Ale','Rivero','alejhandrorr@gmail.com','61166561','https://storage.googleapis.com/techshop-1fd1c.appspot.com/techshop/usuarios/img0000000000000000014share.jpg?GoogleAccessId=firebase-adminsdk-fmz9j@techshop-1fd1c.iam.gserviceaccount.com&Expires=1712164255&Signature=qKTqrvtmMkbNXn9ibzmXORX%2BZhdPsiAn1dHieoCgWZxlH2SIJj%2FZm2vUzC0uwAPKUSeqrLpBDVFkypKg6oR0oM34S9td5aB5GPTebTV77aa%2BsIoi4g%2FeemA71Pr2URugtEkzuhg49dxbA6l8Byycwnc93IkeJOkFvknNQVfqt9Ul3NtelJOg6QzjnwNetJl0LLegSj55SwcZFzUhtzzPHZ0CgqxEL5Y9fee%2FU4DsvsWdOhL749Rna2bdMSwKrNxNTfSor6J5ppigdopGkVXyqM0nK5mAsPYDcNL56s0bOu0V6fZrXZMJ1ZeOiBTHS7Kq2054Wg0siklLLfhuSnNb1Q%3D%3D',0),(18,'jose','$2a$10$3UOak6uB4WbNIV8RX8waGOmLGmVDRQz59nSzdbDnoFcAwP391yPHO','jose','jose','jose@gmail.com','15241',NULL,1),(20,'kja','$2a$10$WRdsUha2WhLnpPZ2B53UzuTrHUjK6MvuICjDboJNgQZekFcyvn8pu','nskans','alkla','kja@gmail.com','65789012',NULL,1),(31,'JoseM','XjJ*8dMqm_B1*v03rhjIDxr-2RGCszAOjkF+rJeh','JoseM','JoseM','JoseMario@gmail.com',NULL,NULL,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_factura` int DEFAULT NULL,
  `id_juego` int DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_factura` (`id_factura`),
  KEY `venta_ibfk_2` (`id_juego`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,5,2,59.99,1),(2,5,18,60,1),(3,6,18,60,1),(4,7,18,60,1),(5,8,18,60,2),(6,9,18,60,1),(7,10,18,60,1),(8,11,10,0,1),(9,14,10,0,1),(10,15,10,0,1),(11,16,10,0,1),(12,17,18,60,1),(13,18,4,49.99,1),(14,19,10,0,1),(15,20,10,0,1);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-24 17:24:35
