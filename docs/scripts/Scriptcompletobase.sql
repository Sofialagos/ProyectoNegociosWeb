-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: tiendaelect
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `bitacoracod` int NOT NULL AUTO_INCREMENT,
  `bitacorafch` datetime DEFAULT NULL,
  `bitprograma` varchar(255) DEFAULT NULL,
  `bitdescripcion` varchar(255) DEFAULT NULL,
  `bitobservacion` mediumtext,
  `bitTipo` char(3) DEFAULT NULL,
  `bitusuario` bigint DEFAULT NULL,
  PRIMARY KEY (`bitacoracod`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `carritoid` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `productId` bigint DEFAULT NULL,
  `cantidadTotal` int DEFAULT NULL,
  PRIMARY KEY (`carritoid`),
  KEY `productId_idx` (`productId`),
  CONSTRAINT `productId` FOREIGN KEY (`productId`) REFERENCES `productos` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `catid` bigint NOT NULL AUTO_INCREMENT,
  `catproduct` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Dispositivo movil'),(2,'Tablets'),(3,'Home Gadgets');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `clientid` bigint NOT NULL AUTO_INCREMENT,
  `clientname` varchar(128) DEFAULT NULL,
  `clientgender` char(3) DEFAULT NULL,
  `clientphone1` varchar(255) DEFAULT NULL,
  `clientemail` varchar(255) DEFAULT NULL,
  `clientIdnumber` varchar(45) DEFAULT NULL,
  `clientusercreates` bigint DEFAULT NULL,
  PRIMARY KEY (`clientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones`
--

DROP TABLE IF EXISTS `funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(45) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL,
  PRIMARY KEY (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones`
--

LOCK TABLES `funciones` WRITE;
/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` VALUES ('Controllers\\Admin\\Admin','Controllers\\Admin\\Admin','ACT','CTR'),('Controllers\\Mnt\\Categoria','Controllers\\Mnt\\Categoria','ACT','CTR'),('Controllers\\Mnt\\Categorias','Controllers\\Mnt\\Categorias','ACT','CTR'),('Controllers\\Mnt\\Funcion','Controllers\\Mnt\\Funcion','ACT','CTR'),('Controllers\\Mnt\\Funciones','Controllers\\Mnt\\Funciones','ACT','CTR'),('Controllers\\Mnt\\Producto','Controllers\\Mnt\\Producto','ACT','CTR'),('Controllers\\Mnt\\Productos','Controllers\\Mnt\\Productos','ACT','CTR'),('Controllers\\Mnt\\Roles','Controllers\\Mnt\\Roles','ACT','CTR'),('Controllers\\Mnt\\Usuario','Controllers\\Mnt\\Usuario','ACT','CTR'),('Controllers\\Mnt\\Usuarios','Controllers\\Mnt\\Usuarios','ACT','CTR'),('Controllers\\Mnt\\Usuario\\Del','Controllers\\Mnt\\Usuario\\Del','ACT','CTR'),('Controllers\\Mnt\\Usuario\\Dsp','Controllers\\Mnt\\Usuario\\Dsp','ACT','CTR'),('Controllers\\Mnt\\Usuario\\New','Controllers\\Mnt\\Usuario\\New','ACT','CTR'),('Controllers\\Mnt\\Usuario\\Upd','Controllers\\Mnt\\Usuario\\Upd','ACT','CTR'),('Controllers\\Mnt\\Venta','Controllers\\Mnt\\Venta','ACT','CTR'),('Controllers\\Mnt\\Ventas','Controllers\\Mnt\\Ventas','ACT','CTR'),('MntUsuarios','MntUsuarios','ACT','CTR');
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones_roles`
--

DROP TABLE IF EXISTS `funciones_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones_roles` (
  `rolescod` varchar(15) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL,
  PRIMARY KEY (`rolescod`,`fncod`),
  KEY `rol_funcion_key_idx` (`fncod`),
  CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`),
  CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones_roles`
--

LOCK TABLES `funciones_roles` WRITE;
/*!40000 ALTER TABLE `funciones_roles` DISABLE KEYS */;
INSERT INTO `funciones_roles` VALUES ('ADMIN','Controllers\\Admin\\Admin','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Categoria','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Categorias','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Funcion','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Funciones','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Producto','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Productos','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Roles','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Usuario','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Usuarios','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Usuario\\Del','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Usuario\\Dsp','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Usuario\\New','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Usuario\\Upd','ACT','2030-02-08 00:00:00'),('ADMIN','Controllers\\Mnt\\Ventas','ACT','2030-02-08 00:00:00'),('ADMIN','MntUsuarios','ACT','2030-02-08 00:00:00');
/*!40000 ALTER TABLE `funciones_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `productId` bigint NOT NULL AUTO_INCREMENT,
  `productname` varchar(45) DEFAULT NULL,
  `catid` bigint DEFAULT NULL,
  `productprice` float(9,2) DEFAULT NULL,
  `productCodInt` varchar(45) DEFAULT NULL,
  `proimg` varchar(100) DEFAULT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`productId`),
  KEY `catid_idx` (`catid`),
  CONSTRAINT `catid` FOREIGN KEY (`catid`) REFERENCES `categorias` (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Galaxy Flip 5G',1,23000.00,'333225546600','uploads/Galaxy_Zflip3.png',3),(3,'Iphone 14',1,30500.00,'1234567890000','uploads/Iphone14.png',5);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rolescod` varchar(15) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL,
  PRIMARY KEY (`rolescod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('ADMIN','administrador','ACT');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_usuarios` (
  `usercod` bigint NOT NULL,
  `rolescod` varchar(15) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL,
  PRIMARY KEY (`usercod`,`rolescod`),
  KEY `rol_usuario_key_idx` (`rolescod`),
  CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`),
  CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_usuarios`
--

LOCK TABLES `roles_usuarios` WRITE;
/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
INSERT INTO `roles_usuarios` VALUES (1,'ADMIN','ACT','2022-12-12 00:00:00','2030-12-31 00:00:00'),(3,'ADMIN','ACT','2022-12-12 00:00:00','2030-12-31 00:00:00');
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usercod` bigint NOT NULL AUTO_INCREMENT,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  PRIMARY KEY (`usercod`),
  UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'soflag@gmail.com','sofffffia','Sofia12345.','2022-12-04 16:48:17','ACT','2023-03-04 00:00:00','ACT','f4f07623945da3275fa922ab13b00548f16d92a953869245bf8aadc5de23bbcb','2022-12-04 16:48:17','ADM'),(2,'alma08@gmail.com','John Doe','$2y$10$kPyMpfGCohEQMwiPILXGTuBpyXJ1O4JtpObDWk8uqlih3vOIrYoW2','2022-12-04 16:51:27','ACT','2023-03-04 00:00:00','ACT','db3ecd49fe45d07c777b757f809bab8149bddc5389ae729c597da92b3a903d7b','2022-12-04 16:51:27','PBL'),(3,'merid@gmail.com','John Doe','$2y$10$7YLGL5qyHZCY9e7fC5.s4esEu57gO8/xk5i1DIJFHmPY56G3vWKSe','2022-12-05 02:00:38','ACT','2023-03-05 00:00:00','ACT','04f76e237ea19655c7521ef9509da40cd764b2f19755fbaf207a46604681cd49','2022-12-05 02:00:38','PBL'),(6,'oscarmart@gmail.com','John Doe','$2y$10$MRTQoREd/5.elaZgIuO0M.6LdW0W2imO1PAUhfluOEQEHH6oOylja','2022-12-07 01:08:32','ACT','2023-03-07 00:00:00','ACT','a81615309f84282e098bfca80f5a0a7138d61f2c25d6882963ce8ed0b4d7f317','2022-12-07 01:08:32','PBL');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `Ventaid` bigint NOT NULL AUTO_INCREMENT,
  `fechaventa` datetime DEFAULT NULL,
  `productoVendido` text COLLATE utf8mb3_bin,
  `monto` double DEFAULT NULL,
  PRIMARY KEY (`Ventaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-07  2:07:48