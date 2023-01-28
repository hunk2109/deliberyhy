CREATE DATABASE  IF NOT EXISTS `delivery_data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `delivery_data`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: delivery_data
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `promocion_share`
--

DROP TABLE IF EXISTS `promocion_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocion_share` (
  `id_cliente` int NOT NULL,
  `id_promocion` int NOT NULL,
  `shares` int unsigned NOT NULL DEFAULT '1',
  `like` tinyint(1) DEFAULT '0',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`,`id_promocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion_share`
--

/*!40000 ALTER TABLE `promocion_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocion_share` ENABLE KEYS */;

--
-- Table structure for table `puntos`
--

DROP TABLE IF EXISTS `puntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntos` (
  `id_cliente_refiere` int NOT NULL,
  `id_cliente_referido` int NOT NULL,
  `tipo` tinyint(1) NOT NULL,
  `puntos` smallint NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente_refiere`,`id_cliente_referido`,`tipo`),
  UNIQUE KEY `unico_referido` (`id_cliente_referido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntos`
--

/*!40000 ALTER TABLE `puntos` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntos` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `puntos_AFTER_INSERT` AFTER INSERT ON `puntos` FOR EACH ROW BEGIN
	UPDATE `delivery`.`cliente` SET `puntos` = puntos + NEW.puntos WHERE (`id_cliente` = NEW.id_cliente_refiere);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `referido_agencia`
--

DROP TABLE IF EXISTS `referido_agencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referido_agencia` (
  `id_agencia` int NOT NULL,
  `id_cliente` int NOT NULL,
  `referidos` int unsigned NOT NULL DEFAULT '1',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_agencia`,`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referido_agencia`
--

/*!40000 ALTER TABLE `referido_agencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `referido_agencia` ENABLE KEYS */;

--
-- Table structure for table `referido_promocion`
--

DROP TABLE IF EXISTS `referido_promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referido_promocion` (
  `id_promocion` int NOT NULL,
  `id_cliente` int NOT NULL,
  `referidos` int unsigned NOT NULL DEFAULT '1',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_promocion`,`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referido_promocion`
--

/*!40000 ALTER TABLE `referido_promocion` DISABLE KEYS */;
/*!40000 ALTER TABLE `referido_promocion` ENABLE KEYS */;

--
-- Table structure for table `view`
--

DROP TABLE IF EXISTS `view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view` (
  `id_cliente` int NOT NULL,
  `id_agencia` int NOT NULL,
  `views` int unsigned NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`,`id_agencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view`
--

/*!40000 ALTER TABLE `view` DISABLE KEYS */;
/*!40000 ALTER TABLE `view` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `view_AFTER_INSERT` AFTER INSERT ON `view` FOR EACH ROW BEGIN
	UPDATE `delivery`.`agencia` SET `views` = views + 1 WHERE (`id_agencia` = NEW.id_agencia);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `view_AFTER_UPDATE` AFTER UPDATE ON `view` FOR EACH ROW BEGIN
	UPDATE `delivery`.`agencia` SET `views` = views + 1 WHERE (`id_agencia` = NEW.id_agencia);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'delivery_data'
--

--
-- Dumping routines for database 'delivery_data'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-11 14:09:38
CREATE DATABASE  IF NOT EXISTS `delivery_notificacion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `delivery_notificacion`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: delivery_notificacion
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensaje` (
  `id_mensaje` int unsigned NOT NULL AUTO_INCREMENT,
  `id_aplicativo` int NOT NULL DEFAULT '1000001',
  `id_urbe` int NOT NULL DEFAULT '-1',
  `id_plataforma` int NOT NULL DEFAULT '-1',
  `perfil` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '-1 todos, demas se usa el valor del perfil',
  `min_vs` smallint NOT NULL DEFAULT '0',
  `min_correctos` smallint NOT NULL DEFAULT '0',
  `hint` varchar(125) NOT NULL,
  `detalle` varchar(325) NOT NULL,
  `omitir` varchar(15) NOT NULL DEFAULT 'OMITIR',
  `boton` varchar(15) NOT NULL DEFAULT 'REVISAR',
  `img` varchar(255) NOT NULL,
  `datos` json NOT NULL COMMENT 'Tipo: 1//UrlLaunch\nTipo: 2//Navigator\nTipo: 3//Local',
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  `ac_omitir` int NOT NULL DEFAULT '0',
  `ac_aceptar` int NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fehca-registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_mensaje`),
  KEY `desde` (`desde`),
  KEY `hasta` (`hasta`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
INSERT INTO `mensaje` VALUES (10001,1000001,-1,-1,-1,0,10,'Despliega tu propia APP de DELIVERY','Genera ingresos con tu propia APP ??',' OMITIR ','MAS INFO','https://firebasestorage.googleapis.com/v0/b/resources-a24a1.appspot.com/o/delivery.jpeg?alt=media','{\"url\": \"https://udemy.planck.biz/delivery\", \"tipo\": \"1\"}','2020-09-22','2029-09-27',0,0,0,1,'2022-04-15 23:56:27'),(10002,1000001,-1,-1,-1,0,0,'Gana propinas con tu propio Instagram & Smart Contracts','Amplía tu portafolio como desarrollador ? aprendiendo Vue.js & Smart Contracts',' OMITIR ','MAS INFO','https://firebasestorage.googleapis.com/v0/b/resources-a24a1.appspot.com/o/smart.jpeg?alt=media','{\"url\": \"https://udemy.planck.biz/vuejs-smart\", \"tipo\": \"1\"}','2020-09-22','2029-09-27',0,0,0,1,'2022-04-15 23:56:27'),(10003,1000001,-1,-1,-1,0,3,'Acepta pagos con CRIPTOMONEDAS en tu propia APP','Innova implementando pagos ? con criptomonedas. ',' OMITIR ','MAS INFO','https://firebasestorage.googleapis.com/v0/b/resources-a24a1.appspot.com/o/pay.jpeg?alt=media','{\"url\": \"https://udemy.planck.biz/pay\", \"tipo\": \"1\"}','2020-09-22','2029-09-27',0,0,0,1,'2022-04-15 23:56:27'),(10004,1000001,-1,-1,-1,0,1,'Despliega tu propio BOT para WhatsApp','Envía campañas de MARKETING y personaliza ? mensajes AUTOMÁTICOS. ',' OMITIR ','MAS INFO','https://firebasestorage.googleapis.com/v0/b/resources-a24a1.appspot.com/o/bot.jpeg?alt=media','{\"url\": \"https://udemy.planck.biz/whatsapp\", \"tipo\": \"1\"}','2020-09-22','2029-09-27',0,0,0,1,'2022-04-15 23:56:27');
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;

--
-- Table structure for table `mensaje_leido`
--

DROP TABLE IF EXISTS `mensaje_leido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensaje_leido` (
  `id_mensaje` int unsigned NOT NULL,
  `id_cliente` int NOT NULL,
  `omitir` tinyint(1) DEFAULT NULL,
  `aceptar` tinyint(1) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_mensaje`,`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje_leido`
--

/*!40000 ALTER TABLE `mensaje_leido` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensaje_leido` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mensaje_leido_AFTER_INSERT` AFTER INSERT ON `mensaje_leido` FOR EACH ROW BEGIN
UPDATE `delivery_notificacion`.`mensaje` SET `views` = views + 1 WHERE (`id_mensaje` = NEW.id_mensaje);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mensaje_leido_AFTER_UPDATE` AFTER UPDATE ON `mensaje_leido` FOR EACH ROW BEGIN

IF OLD.omitir IS NULL AND NEW.omitir = 1 THEN
	UPDATE `delivery_notificacion`.`mensaje` SET `ac_omitir` = ac_omitir + 1 WHERE (`id_mensaje` = NEW.id_mensaje);
ELSEIF OLD.aceptar IS NULL AND NEW.aceptar = 1 THEN
	UPDATE `delivery_notificacion`.`mensaje` SET `ac_aceptar` = ac_aceptar + 1 WHERE (`id_mensaje` = NEW.id_mensaje);
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'delivery_notificacion'
--

--
-- Dumping routines for database 'delivery_notificacion'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-11 14:09:39
CREATE DATABASE  IF NOT EXISTS `delivery_track` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `delivery_track`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: delivery_track
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `fecha` date NOT NULL,
  `id_cliente` int NOT NULL,
  `imei` varchar(33) NOT NULL DEFAULT 'S/N',
  `p` json NOT NULL,
  `hora` time NOT NULL,
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY HASH (dayofyear(`fecha`))
PARTITIONS 366 */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

/*!40000 ALTER TABLE `register` DISABLE KEYS */;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;

--
-- Dumping events for database 'delivery_track'
--

--
-- Dumping routines for database 'delivery_track'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-11 14:09:39
CREATE DATABASE  IF NOT EXISTS `delivery_register` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `delivery_register`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: delivery_register
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `agencia`
--

DROP TABLE IF EXISTS `agencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencia` (
  `id_agencia` int NOT NULL AUTO_INCREMENT,
  `agencia` varchar(90) NOT NULL,
  `id_urbe` int NOT NULL,
  `tipo` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 Catalogo.\n2 Servicios.',
  `direccion` varchar(245) NOT NULL,
  `img` varchar(300) NOT NULL DEFAULT '',
  `lt` double(10,6) NOT NULL,
  `lg` double(10,6) NOT NULL,
  `contacto` varchar(15) NOT NULL,
  `mail` varchar(60) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 Pre-Registrado, 0 Rechazado, 2 Autorizado',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_agencia`),
  UNIQUE KEY `mail_UNIQUE` (`mail`),
  UNIQUE KEY `contacto_UNIQUE` (`contacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencia`
--

/*!40000 ALTER TABLE `agencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `agencia` ENABLE KEYS */;

--
-- Table structure for table `cliente_hashtag`
--

DROP TABLE IF EXISTS `cliente_hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_hashtag` (
  `id_hashtag` int unsigned NOT NULL,
  `id_cliente` int NOT NULL,
  `imei` varchar(45) NOT NULL,
  `promocion` double(10,2) NOT NULL,
  `transaccion` double(10,2) NOT NULL,
  `costo_envio` double(10,2) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `id_cliente` (`id_cliente`),
  KEY `id_hashtag` (`id_hashtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_hashtag`
--

/*!40000 ALTER TABLE `cliente_hashtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_hashtag` ENABLE KEYS */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id_contac` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `ip` varchar(25) NOT NULL,
  `id_cliente` int NOT NULL,
  `calificacion` double(4,2) NOT NULL,
  `contacto` varchar(500) NOT NULL,
  `header` json NOT NULL,
  `info` json NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id_contac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;

--
-- Table structure for table `descuento`
--

DROP TABLE IF EXISTS `descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descuento` (
  `id_conductor` int NOT NULL,
  `id_despacho` bigint unsigned NOT NULL,
  `saldo` double(10,2) NOT NULL,
  `credito` double(10,2) NOT NULL,
  `descuento` double(10,2) NOT NULL,
  `costo` double(10,2) NOT NULL,
  `costo_entrega` double(10,2) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reverso` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_reverso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_conductor`,`id_despacho`),
  KEY `index_conductor` (`id_conductor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuento`
--

/*!40000 ALTER TABLE `descuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `descuento` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `descuento_BEFORE_INSERT` BEFORE INSERT ON `descuento` FOR EACH ROW BEGIN
	DECLARE _saldo DOUBLE(10,2);
    DECLARE _credito DOUBLE(10,2);
    
    SELECT s.saldo INTO _saldo FROM delivery.saldo s WHERE s.id_cliente = NEW.id_conductor LIMIT 1;
    SELECT s.credito INTO _credito FROM delivery.saldo s WHERE s.id_cliente = NEW.id_conductor LIMIT 1;
    
    SET NEW.saldo = IFNULL(_saldo, 0);
    SET NEW.credito = IFNULL(_credito, 0);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `descuento_AFTER_UPDATE` AFTER UPDATE ON `descuento` FOR EACH ROW BEGIN
	IF (OLD.reverso = 0 AND NEW.reverso = 1 AND OLD.fecha_reverso IS NULL) THEN
		INSERT INTO `delivery`.`saldo` (`id_cliente`, `saldo`) 
        VALUES (OLD.id_conductor, OLD.descuento) 
        ON DUPLICATE KEY UPDATE saldo = (saldo + OLD.descuento);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'delivery_register'
--

--
-- Dumping routines for database 'delivery_register'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-11 14:09:40
CREATE DATABASE  IF NOT EXISTS `delivery_rubro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `delivery_rubro`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: delivery_rubro
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `cash`
--

DROP TABLE IF EXISTS `cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash` (
  `id_cash` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `cash` double(10,2) NOT NULL COMMENT 'Monto que se recarga a la tarjeta',
  `detalle` varchar(2500) NOT NULL,
  `body` json NOT NULL,
  `header` json NOT NULL,
  `status` int NOT NULL DEFAULT '100' COMMENT '100 Registrada\\n200 Aprobada',
  `response` json DEFAULT NULL,
  `otp` json DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_response` datetime DEFAULT NULL,
  `fecha_otp` varchar(45) DEFAULT NULL,
  `reembolso_cash` double(10,2) DEFAULT NULL,
  `status_reembolso` int DEFAULT NULL,
  `reembolso` json DEFAULT NULL COMMENT '100 Se solicito reembolso.\\\\n200 Reembolso exitoso.\\\\n300 Esperando reembolso.',
  `fecha_reembolso` datetime DEFAULT NULL,
  `fecha_autorizo_reembolso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cash`),
  KEY `index_id_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash`
--

/*!40000 ALTER TABLE `cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cash_AFTER_UPDATE` AFTER UPDATE ON `cash` FOR EACH ROW BEGIN
    #Registramos el credito en el saldo del cliente
    IF ((OLD.status = 100 OR OLD.status = 300) AND NEW.status = 200) THEN
		INSERT INTO `delivery`.`saldo` (`id_cliente`, `cash`, `cashes`, `fecha_cash`) 
		VALUES (NEW.id_cliente, NEW.cash, 1, NOW()) 
		ON DUPLICATE KEY UPDATE cash = (cash + NEW.cash), cashes = cashes + 1, fecha_cash = NOW();
    END IF;
    
    #Registramos el reembolso quitando el chas en el saldo del cliente.
    IF (OLD.status_reembolso = 100 AND NEW.status_reembolso = 200) THEN
		UPDATE `delivery`.`saldo` SET cash = (cash - NEW.reembolso_cash), reembolsos = reembolsos + 1, fecha_reembolso = NOW() 
        WHERE `id_cliente` = NEW.id_cliente;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cupon`
--

DROP TABLE IF EXISTS `cupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupon` (
  `id_cupon` int NOT NULL AUTO_INCREMENT,
  `id_gift` int NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_agencia` int NOT NULL,
  `saludo` varchar(500) NOT NULL,
  `cupon` double(10,2) NOT NULL,
  `token` varchar(125) NOT NULL COMMENT 'Usamos para poner la imagen del Cupón. ',
  `holder_name` varchar(45) NOT NULL COMMENT 'Orden 20 USD',
  `number` varchar(45) NOT NULL COMMENT 'Pizza House',
  `mensaje` varchar(300) NOT NULL COMMENT 'Mensaje de error cuando el cupón es valido para otra agencia no seleccionada en el carrito',
  `terminos` varchar(300) NOT NULL,
  `id_forma_pago` int NOT NULL DEFAULT '36',
  `status` varchar(10) NOT NULL DEFAULT 'valid',
  `bin` varchar(6) NOT NULL DEFAULT '511915',
  `modo` varchar(45) NOT NULL DEFAULT 'CUPÓN',
  `type` varchar(45) NOT NULL DEFAULT 'CUPÓN',
  `cajes` int unsigned NOT NULL DEFAULT '0',
  `fecha_canje` datetime DEFAULT NULL,
  `reversos` int unsigned NOT NULL DEFAULT '0',
  `fecha_reverso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cupon`),
  UNIQUE KEY `id_gift_UNIQUE` (`id_gift`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupon`
--

/*!40000 ALTER TABLE `cupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupon` ENABLE KEYS */;

--
-- Table structure for table `tarjeta_cliente`
--

DROP TABLE IF EXISTS `tarjeta_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta_cliente` (
  `id_tarjeta_cliente` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_tarjeta` int NOT NULL,
  `saldo` double(8,2) NOT NULL,
  `promocion` double(8,2) NOT NULL,
  `recaudado` double(8,2) NOT NULL,
  `credito` double(10,2) NOT NULL DEFAULT '0.00',
  `nota` varchar(345) NOT NULL DEFAULT '',
  `id_registro` int NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caja` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_caja` datetime DEFAULT NULL,
  `facturado` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_facturado` datetime DEFAULT NULL,
  `autorizacion` varchar(145) NOT NULL DEFAULT '',
  `datos` json DEFAULT NULL,
  PRIMARY KEY (`id_tarjeta_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta_cliente`
--

/*!40000 ALTER TABLE `tarjeta_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta_cliente` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tarjeta_cliente_AFTER_INSERT` AFTER INSERT ON `tarjeta_cliente` FOR EACH ROW BEGIN
    INSERT INTO `delivery`.`saldo` (`id_cliente`, `saldo`) 
    VALUES (NEW.id_cliente, (NEW.saldo + NEW.promocion)) 
    ON DUPLICATE KEY UPDATE saldo = (saldo + (NEW.saldo + NEW.promocion));
    
     IF(NEW.credito > 0)THEN
		INSERT INTO `delivery_rubro`.`transaccion` 
		(`id_transaccion_estado`, `id_transaccion_tipo`, `id_cliente`,  `debitos`, `transaccion`, `recaudado`, `coste`, `id_tarjeta_cliente`) 
        #Especificamos el coste de cero peus es esta transaccion no se cobra comision.
		VALUES ('1', '2', NEW.id_cliente, NEW.credito, (NEW.credito + NEW.recaudado), (NEW.credito + NEW.recaudado), 0, NEW.id_tarjeta_cliente);
    END IF;
    
    IF(NEW.id_tarjeta = 1)THEN
		UPDATE `delivery`.`cliente` SET `perfil` = '2' WHERE `id_cliente` = NEW.id_cliente LIMIT 2;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `id_transaccion` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_transaccion_estado` int NOT NULL,
  `id_transaccion_tipo` int NOT NULL,
  `id_cliente` int NOT NULL,
  `debitos` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Valor del importe que egresa (Sale) para el despachador.',
  `creditos` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Valor del importe que ingresa para el despachador.',
  `descuento` double(10,2) DEFAULT '0.00' COMMENT 'Es el valor que se descuenta al tomar el despacho',
  `tipo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Tipo de transacción 1 Normal 2 Asignado directo, se identifica en culi q paga crédito aparte para no sumar descontado pues se registra el valor que pasan en reporte directamente',
  `transaccion` double(10,2) NOT NULL COMMENT 'Valor de la transacción',
  `recaudado` double(10,2) NOT NULL COMMENT 'Valor recaudado para Planck',
  `credito` double(10,2) NOT NULL COMMENT 'Credito antes de la transacción',
  `saldo` double(10,2) NOT NULL COMMENT 'Saldo antes de la transacción',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `importe` double(5,2) NOT NULL,
  `coste` double(5,2) NOT NULL COMMENT 'Porcentaje que se aprovisiona Planck por el despacho en creditos.',
  `id_despacho` bigint unsigned DEFAULT NULL,
  `id_tarjeta_cliente` bigint unsigned DEFAULT NULL,
  `nota` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `fk_transaccion_transaccion_estado_idx` (`id_transaccion_estado`),
  KEY `fk_transaccion_transaccion_tipo_idx` (`id_transaccion_tipo`),
  CONSTRAINT `fk_transaccion_transaccion_estado` FOREIGN KEY (`id_transaccion_estado`) REFERENCES `transaccion_estado` (`id_transaccion_estado`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_transaccion_transaccion_tipo` FOREIGN KEY (`id_transaccion_tipo`) REFERENCES `transaccion_tipo` (`id_transaccion_tipo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `transaccion_BEFORE_INSERT` BEFORE INSERT ON `transaccion` FOR EACH ROW BEGIN
	DECLARE _saldo DOUBLE(10,2);
	DECLARE _credito DOUBLE(10,2);
    DECLARE _descuento DOUBLE(10,2);
	DECLARE _importe DOUBLE(5,2);
	DECLARE _coste DOUBLE(5,2);#Porcentaje que beneficia a Planck
    
    DECLARE _recaudado DOUBLE(10,2);#Es el dinero que ingresa como transaccion ya sea para debitos o creditos segun el tipo
    DECLARE _creditos DOUBLE(10,2);
    
	SELECT s.saldo INTO _saldo FROM delivery.saldo s WHERE s.id_cliente = NEW.id_cliente LIMIT 1;
	SELECT s.credito INTO _credito FROM delivery.saldo s WHERE s.id_cliente = NEW.id_cliente LIMIT 1;
	SELECT s.importe INTO _importe FROM delivery.saldo s WHERE s.id_cliente = NEW.id_cliente LIMIT 1;
    SELECT d.descuento INTO _descuento FROM delivery_register.descuento d WHERE d.id_conductor = NEW.id_cliente AND d.id_despacho = NEW.id_despacho LIMIT 1;
    
    IF(NEW.coste IS NULL)THEN
		SELECT s.coste INTO _coste FROM delivery.saldo s WHERE s.id_cliente = NEW.id_cliente LIMIT 1;
	ELSE
		SELECT NEW.coste INTO _coste;
	END IF;
    
    IF (NEW.id_transaccion_tipo = 1)THEN
    
		SELECT ROUND((_coste * NEW.transaccion / 100 ), 2) INTO _recaudado;
        SELECT ROUND((NEW.transaccion - _recaudado), 2) INTO _creditos; 
        
		#Acreditamos a la moto su credito de tarjeta
        #Si es tipo uno se suma descontado para acreditar el monto total de la tarejta
        IF (NEW.tipo = 1) THEN
			INSERT INTO `delivery`.`saldo` (`id_cliente`, `credito`) 
			VALUES (NEW.id_cliente, _creditos) 
			ON DUPLICATE KEY UPDATE credito = (credito + _creditos + IFNULL(_descuento, 0));
	
        #Si es tipo dos no se suma descontado pues el valor de transaccion pasan integreo desde cuxi
		ELSEIF (NEW.tipo = 2)THEN 
			INSERT INTO `delivery`.`saldo` (`id_cliente`, `credito`) 
			VALUES (NEW.id_cliente, _creditos) 
			ON DUPLICATE KEY UPDATE credito = (credito + _creditos);
		END IF;
        
		SET NEW.creditos = _creditos;#Orden importante
		SET NEW.recaudado = _recaudado;#Orden importante
        SET NEW.descuento = _descuento; 
        
	ELSEIF (NEW.id_transaccion_tipo = 2)THEN 
    
		SELECT NEW.transaccion INTO _recaudado;
        
		INSERT INTO `delivery`.`saldo` (`id_cliente`, `credito`) 
        VALUES (NEW.id_cliente, (NEW.debitos * -1)) 
        ON DUPLICATE KEY UPDATE credito = (credito - NEW.debitos);
	
	END IF;
    
	SET NEW.saldo = _saldo;
	SET NEW.credito = _credito;
	SET NEW.importe = _importe;
	SET NEW.coste = _coste;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transaccion_estado`
--

DROP TABLE IF EXISTS `transaccion_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion_estado` (
  `id_transaccion_estado` int NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_transaccion_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion_estado`
--

/*!40000 ALTER TABLE `transaccion_estado` DISABLE KEYS */;
INSERT INTO `transaccion_estado` VALUES (1,'AUTORIZADA'),(2,'RECHAZADA');
/*!40000 ALTER TABLE `transaccion_estado` ENABLE KEYS */;

--
-- Table structure for table `transaccion_tipo`
--

DROP TABLE IF EXISTS `transaccion_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion_tipo` (
  `id_transaccion_tipo` int NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_transaccion_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion_tipo`
--

/*!40000 ALTER TABLE `transaccion_tipo` DISABLE KEYS */;
INSERT INTO `transaccion_tipo` VALUES (1,'INGRESO'),(2,'EGRESO');
/*!40000 ALTER TABLE `transaccion_tipo` ENABLE KEYS */;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_sucursal` int NOT NULL,
  `anio` year NOT NULL,
  `mes` tinyint(1) NOT NULL,
  `id_forma_pago` int NOT NULL,
  `ventas` int unsigned NOT NULL,
  `credito` double(10,2) unsigned NOT NULL,
  `credito_producto` double(10,2) unsigned DEFAULT NULL,
  `credito_envio` double(10,2) unsigned NOT NULL,
  `costo` double(10,2) unsigned NOT NULL,
  `costo_producto` double(10,2) unsigned NOT NULL,
  `costo_entrega` double(10,2) unsigned NOT NULL,
  `hashtag` double(10,2) unsigned NOT NULL,
  `descontado` double(10,2) unsigned NOT NULL,
  `transaccion` double(10,2) unsigned NOT NULL,
  `ingresos` double(10,2) unsigned NOT NULL,
  `devuelto` double(10,2) unsigned NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sucursal`,`anio`,`mes`,`id_forma_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

--
-- Dumping events for database 'delivery_rubro'
--

--
-- Dumping routines for database 'delivery_rubro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-11 14:09:40
CREATE DATABASE  IF NOT EXISTS `delivery` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `delivery`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: delivery
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `agencia`
--

DROP TABLE IF EXISTS `agencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencia` (
  `id_agencia` int NOT NULL AUTO_INCREMENT COMMENT 'mensualidad, registro, casilleros',
  `agencia` varchar(90) NOT NULL,
  `criterio` varchar(100) NOT NULL DEFAULT '',
  `label` varchar(17) NOT NULL DEFAULT '',
  `tipo` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 Catalogo.\n2 Servicios.',
  `mensaje` varchar(305) NOT NULL DEFAULT 'Gracias por usar nuestro servicio.',
  `direccion` varchar(245) NOT NULL,
  `observacion` varchar(245) NOT NULL DEFAULT '',
  `img` varchar(300) NOT NULL DEFAULT '',
  `lt` double(10,6) NOT NULL,
  `lg` double(10,6) NOT NULL,
  `contacto` varchar(15) NOT NULL,
  `mail` varchar(60) NOT NULL,
  `restriccion` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 No se restringe\n1 Se restringe',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `orden` smallint NOT NULL DEFAULT '2000',
  `views` int unsigned NOT NULL DEFAULT '0',
  `ventas` int unsigned NOT NULL DEFAULT '0',
  `vs` smallint NOT NULL DEFAULT '0',
  `recomendado` tinyint(1) NOT NULL DEFAULT '0',
  `shares` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_agencia`),
  KEY `fk_agencia__clienteRegistro_idx` (`id_registro`),
  KEY `fk_agencia__clienteActualizo_idx` (`id_actualizo`),
  FULLTEXT KEY `criterio` (`criterio`),
  CONSTRAINT `fk_agencia__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_agencia__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencia`
--

/*!40000 ALTER TABLE `agencia` DISABLE KEYS */;
INSERT INTO `agencia` VALUES (1,'Encomiendas - Compras','Encomiendas - Compras','',2,'Invita a mas amigos a descargar Opportunity','Nicargahua y Huoranies','','https://image.freepik.com/vector-gratis/servicio-entrega-concepto-mascaras-medicas_23-2148504161.jpg',0.000000,0.000000,'+593991786786','',0,1,100000,NULL,'2020-01-31 15:58:05','2021-06-22 13:05:26',-1000,5219,6765,0,0,6),(2,'Cuxibamba Loja','Cuxibamba Loja','',1,'Invita a mas amigos a descargar Opportunity','Alonso de Mercadillo, Loja','','delivery-0001.appspot.com/o/ag%2F2.jpg',0.000000,0.000000,'+593991786786','',0,1,100000,NULL,'2020-02-17 19:31:46','2021-06-25 21:26:19',9378,16956,1002,0,0,24),(3,'Huaquillitas Encebollados','Huaquillitas Encebollados','',1,'Invita a mas amigos a descargar Opportunity','Calle Perú y Uruguay','','delivery-0001.appspot.com/o/ag%2F3.jpg',-4.005632,-79.208525,'+593991786786','',0,1,100000,100000,'2020-03-09 14:07:03','2021-06-22 15:38:11',9920,2178,521,0,0,2),(7,'Pollos Sandi Merca..','Pollos Sandi Merca..','',1,'Invita a mas amigos a descargar Opportunity','Mercadillo entre sucre y bolivar','','delivery-0001.appspot.com/o/ag%2F7.jpg',-4.001779,-79.202109,'+593991786786','',0,1,100000,100000,'2020-03-09 14:07:03','2021-06-23 20:25:49',9800,2199,518,0,0,2),(9,'La Hueca del pollo','La Hueca del pollo','',1,'Invita a mas amigos a descargar Opportunity','Av. Pío Jaramillo y Gob. de Mainas','','delivery-0001.appspot.com/o/ag%2F9.jpg',-4.012466,-79.203789,'+593991786786','',0,1,100000,NULL,'2020-03-18 20:30:22','2022-07-11 19:02:32',9924,1275,114,0,0,0),(12,'MERCATOA','MERCATOA','',1,'Invita a mas amigos a descargar Opportunity','Av. Pío Jaramillo alvaro y Leonardo da Vinci','','delivery-0001.appspot.com/o/ag%2F12.jpg',-4.022525,-79.203254,'+593991786786','',0,1,100000,NULL,'2020-03-21 03:52:05','2021-06-22 13:05:26',9862,2624,140,0,0,0),(15,'Panadería y Pastelería del K-cho','Panadería y Pastelería del K-cho','',1,'Invita a mas amigos a descargar Opportunity','Juan de Salinas entre Sucre y Bolivar','','delivery-0001.appspot.com/o/ag%2F15.jpg',-3.991590,-79.203033,'+593991786786','',0,1,100000,NULL,'2020-03-23 03:20:42','2021-06-22 13:05:26',9698,3151,372,0,0,1),(16,'Panaderia Tertulia','Panaderia Tertulia','',1,'Invita a mas amigos a descargar Opportunity','Sucre y Colón, frente a correos del Ecuador ','','delivery-0001.appspot.com/o/ag%2F16.jpg',-3.995208,-79.203195,'+593991786786','',0,1,100000,NULL,'2020-03-25 00:13:07','2021-06-22 13:05:26',9902,1509,206,0,0,0),(17,'La granja 100 % orgánico','La granja 100 % orgánico','',1,'Invita a mas amigos a descargar Opportunity','Rosario entre Iquitos y Potosí, Clodoveo Jaramillo','','delivery-0001.appspot.com/o/ag%2F17.jpg',-3.980751,-79.211301,'+593991786786','',0,1,100000,100000,'2020-03-26 22:28:44','2021-06-22 13:05:26',9953,1914,125,0,0,0),(19,'Horno de Leña','Horno de Leña','',1,'Invita a mas amigos a descargar Opportunity','Miguel Riofrío y Av. Manuel Agustín Aguirre, detrás de la parada','','delivery-0001.appspot.com/o/ag%2F19.jpg',-3.999331,-79.205138,'+593991786786','',0,1,100000,NULL,'2020-03-28 21:54:42','2022-07-11 19:02:32',9694,3179,518,0,0,0),(23,'Pañalera Baby Shop','Pañalera Baby Shop','',1,'Invita a mas amigos a descargar Opportunity','Lourdes ente Olmedo y Bernardo Valdivieso','','delivery-0001.appspot.com/o/ag%2F23.jpg',-4.002371,-79.200734,'+593991786786','',0,1,100000,100000,'2020-03-31 00:53:49','2021-06-22 13:05:26',8997,1954,1339,0,0,5),(24,'Las papas del hueco','Las papas del hueco','',1,'Invita a mas amigos a descargar Opportunity','Quito entre Bolivar y Bernarndo Valdivieso','','delivery-0001.appspot.com/o/ag%2F24.jpg',-3.993332,-79.202058,'+593991786786','',0,1,100000,100000,'2020-03-31 18:56:46','2021-06-22 23:37:28',9870,4867,604,0,6,2),(28,'Lanzaca avícola','Lanzaca avícola','',1,'Invita a mas amigos a descargar Opportunity','Bernardo Valdivieso y Lourdes','','delivery-0001.appspot.com/o/ag%2F28.jpg',-4.002300,-79.200797,'+593991786786','',0,1,100000,100000,'2020-04-03 22:37:41','2021-06-22 20:52:50',9940,1177,114,0,0,1),(41,'Pollos Sandi Terminal','Pollos Sandi Terminal','',1,'Invita a mas amigos a descargar Opportunity','Av. Pablo Palacio y Gerónimo carrión','','delivery-0001.appspot.com/o/ag%2F41.jpg',-3.976335,-79.204498,'+593991786786','',0,1,100000,NULL,'2020-04-08 23:36:29','2022-07-11 19:02:32',9879,2362,334,0,0,2),(42,'Parrilladas el Fogón Terminal','Parrilladas el Fogón Terminal','',1,'Invita a mas amigos a descargar Opportunity','Av. Pablo Palacio y Gerónimo Carrión','','delivery-0001.appspot.com/o/ag%2F42.jpg',-3.976335,-79.204498,'+593991786786','',0,1,100000,NULL,'2020-04-10 21:38:07','2022-07-11 19:02:32',9950,2387,143,0,0,3),(43,'Pizza House','Pizza House','',1,'Invita a mas amigos a descargar Opportunity','Mercadillo entre José Maria Peña y Nicolás Garcia','','delivery-0001.appspot.com/o/ag%2F43.jpg',-4.001491,-79.207038,'+593991786786','',0,1,100000,NULL,'2020-04-13 23:54:42','2022-07-11 19:02:32',9958,4040,293,0,10,2),(44,'Alitas y Bandejitas','Alitas y Bandejitas','',1,'Invita a mas amigos a descargar Opportunity','24 de mayo entre J.A. eguiguren y 10 de Agosto','','delivery-0001.appspot.com/o/ag%2F44.jpg',-3.996253,-79.198263,'+593991786786','',0,1,100000,NULL,'2020-04-14 18:33:06','2021-06-23 19:56:08',9953,3291,200,0,7,0),(46,'El mago rey Pollos a la Brasa','El mago rey Pollos a la Brasa','',1,'Invita a mas amigos a descargar Opportunity','Av. Orillas del Zamora y juan José Peña','','delivery-0001.appspot.com/o/ag%2F46.jpg',-3.994113,-79.199450,'+593991786786','',0,1,100000,NULL,'2020-04-15 22:25:13','2021-06-22 13:05:26',9778,3204,927,0,0,1),(47,'Juancho Moretti','Juancho Moretti','',1,'Invita a mas amigos a descargar Opportunity','Machala y jaramijó','','delivery-0001.appspot.com/o/ag%2F47.jpg',-3.978606,-79.203910,'+593991786786','',0,1,100000,NULL,'2020-04-16 17:26:04','2021-06-23 01:09:03',9929,3244,378,0,5,3),(55,'Suco´s encebollados','Suco´s encebollados','',1,'Invita a mas amigos a descargar Opportunity','18 de noviembre entre celica y gonzanamá','','delivery-0001.appspot.com/o/ag%2F55.jpg',-4.007117,-79.203265,'+593991786786','',0,1,100000,NULL,'2020-04-23 22:59:37','2021-06-22 13:05:26',9965,1736,174,0,0,0),(58,'El tamal lojano','El tamal lojano','',1,'Invita a mas amigos a descargar Opportunity','24 de mayo y mercadillo','','delivery-0001.appspot.com/o/ag%2F58.jpg',-3.994545,-79.204223,'+593991786786','',0,1,100000,NULL,'2020-04-29 21:07:41','2021-06-22 13:05:26',9955,2394,206,0,10,1),(62,'Fruques Jugos y Ensaladas','Fruques Jugos y Ensaladas','',1,'Invita a mas amigos a descargar Opportunity','Fruquest','','delivery-0001.appspot.com/o/ag%2F62.jpg',-4.009008,-79.203024,'+593991786786','',0,1,100000,NULL,'2020-05-05 05:15:51','2022-07-11 19:02:32',9949,3025,183,0,3,11),(65,'Papas De Balde','Papas De Balde','',1,'Invita a mas amigos a descargar Opportunity','Papas del balde','','delivery-0001.appspot.com/o/ag%2F65.jpg',-4.001265,-79.199492,'+593991786786','',0,1,100000,NULL,'2020-05-07 03:01:24','2021-06-22 13:05:26',9936,3423,385,0,0,1),(69,'Piscis Marisquería','Piscis Marisquería','',1,'Invita a mas amigos a descargar Opportunity','Piscis marisquería','','delivery-0001.appspot.com/o/ag%2F69.jpg',-3.994809,-79.203261,'+593991786786','',0,1,100000,NULL,'2020-05-11 06:32:04','2022-07-11 19:02:32',9972,1696,196,0,0,0),(70,'Artesanale','Artesanale','',1,'Invita a mas amigos a descargar Opportunity','Artesanale','','delivery-0001.appspot.com/o/ag%2F70.jpg',-3.993179,-79.198574,'+593991786786','',0,1,100000,NULL,'2020-05-17 23:58:46','2021-06-22 13:05:26',9957,3775,396,0,10,3),(87,'Cuxibamba Ortopedia','Cuxibamba Ortopedia','',1,'Invita a mas amigos a descargar Opportunity','Alonso de Mercadillo, Loja','','delivery-0001.appspot.com/o/ag%2F87.jpg',0.000000,0.000000,'+593991786786','',0,1,100000,NULL,'2020-02-17 19:31:46','2021-06-22 13:05:26',9468,1366,549,0,0,2),(88,'Cuxibamba Demartologica','Cuxibamba Demartologica','',1,'Invita a mas amigos a descargar Opportunity','Alonso de Mercadillo, Loja','','delivery-0001.appspot.com/o/ag%2F88.jpg',0.000000,0.000000,'+593991786786','',0,1,100000,NULL,'2020-02-17 19:31:46','2021-06-22 13:24:35',9468,2642,540,0,0,3),(97,'Papá Charro','Papá Charro','',1,'Invita a mas amigos a descargar Opportunity','Dirección','#PapáCharro ','delivery-0001.appspot.com/o/ag%2F97.jpg',-3.996420,-79.198277,'+593991786786','',0,1,100000,NULL,'2020-06-01 04:42:28','2022-07-11 19:02:32',9989,2002,150,0,3,6),(101,'Kentucky Fried Chicken','Kentucky Fried Chicken','',1,'Invita a mas amigos a descargar Opportunity','Dirección','','delivery-0001.appspot.com/o/ag%2F101.jpg',-4.012104,-79.202318,'+593991786786','',0,1,100000,NULL,'2020-06-11 05:21:22','2021-06-22 13:05:26',9945,1377,101,0,0,0),(104,'Pincheria el Valle','Pincheria el Valle','',1,'Invita a mas amigos a descargar Opportunity','Opportunity','','delivery-0001.appspot.com/o/ag%2F104.jpg',-3.981538,-79.202466,'+593991786786','',0,1,100000,NULL,'2020-06-15 23:49:39','2022-07-11 19:02:32',9997,1656,176,0,0,17),(105,'Pollos Gusy','Pollos Gusy','',1,'Invita a mas amigos a descargar Opportunity','Dirección','','delivery-0001.appspot.com/o/ag%2F105.jpg',-3.976421,-79.204432,'+593991786786','',0,1,100000,NULL,'2020-06-16 21:29:54','2021-06-29 20:29:35',9998,1482,188,0,2,3),(108,'Repe & Bolón','Repe & Bolón','',1,'Invita a mas amigos a descargar Opportunity','Dirección','','delivery-0001.appspot.com/o/ag%2F108.jpg',-3.994958,-79.204160,'+593991786786','',0,1,100000,NULL,'2020-06-24 23:28:28','2022-07-11 19:02:32',2000,1913,166,0,10,4),(109,'Mama Lola','Mama Lola','',1,'Invita a mas amigos a descargar Opportunity','Dirección','','delivery-0001.appspot.com/o/ag%2F109.jpg',-3.977951,-79.201010,'+593991786786','',0,1,100000,NULL,'2020-06-27 02:42:54','2021-06-29 19:57:20',2000,1714,107,0,10,1),(115,'Dragon Wings','Dragon Wings','',1,'Invita a mas amigos a descargar Opportunity','Dirección','','delivery-0001.appspot.com/o/ag%2F115.jpg',-4.002151,-79.207228,'+593991786786','',0,1,100000,NULL,'2020-07-12 03:45:10','2022-07-11 19:02:32',2000,2056,155,0,3,3),(117,'Hamburguesas Cuadradas','Hamburguesas Cuadradas','',1,'Invita a mas amigos a descargar Opportunity','Dirección','','delivery-0001.appspot.com/o/ag%2F117.jpg',-4.002534,-79.202947,'+593991786786','',0,1,100000,NULL,'2020-07-19 03:27:08','2022-07-11 19:02:32',2000,1671,243,0,1,14),(124,'Carbonero Mirador','Carbonero Mirador','',1,'Invita a mas amigos a descargar Opportunity','Dirección','','delivery-0001.appspot.com/o/ag%2F124.jpg',-3.998461,-79.207858,'+593991786786','',0,1,100000,NULL,'2020-07-25 00:38:19','2021-06-23 19:36:23',2000,2170,265,0,0,6),(127,'Nachos del Güero','Nachos del Güero','',1,'Invita a mas amigos a descargar Opportunity','Dirección','','delivery-0001.appspot.com/o/ag%2F127.jpg',-3.993908,-79.198319,'+593991786786','',0,1,100000,NULL,'2020-08-03 03:01:37','2021-06-22 13:05:26',2000,1596,203,0,4,3),(128,'Chifa Oriental','Chifa Oriental','',1,'Invita a mas amigos a descargar Opportunity','Dirección','','delivery-0001.appspot.com/o/ag%2F128_1.jpg',-4.000615,-79.204945,'+593991786786','',0,1,100000,NULL,'2020-08-07 05:04:53','2021-06-22 13:05:26',2000,1720,244,0,0,0),(135,'Los Moros','Los Moros','',1,'Invita a mas amigos a descargar Opportunity','Dirección','','delivery-0001.appspot.com/o/ag%2F135.jpg',-3.980185,-79.208134,'+593991786786','',0,1,100000,NULL,'2020-08-24 01:48:39','2022-07-11 19:02:32',2000,983,114,0,10,1),(140,'delivery','delivery','',1,'Invita a mas amigos a descargar Opportunity','Redondel terminal','','delivery-0001.appspot.com/o/ag%2F1.png',-4.004191,-79.209259,'+593991786786','',0,1,100000,NULL,'2020-09-10 01:29:15','2021-06-22 13:05:26',25000,586,277,0,0,0);
/*!40000 ALTER TABLE `agencia` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `agencia_BEFORE_INSERT` BEFORE INSERT ON `agencia` FOR EACH ROW BEGIN
	SET NEW.agencia = TRIM(NEW.agencia);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `agencia_aplicativo`
--

DROP TABLE IF EXISTS `agencia_aplicativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencia_aplicativo` (
  `id_agencia` int NOT NULL,
  `id_aplicativo` int NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `isTarjeta` tinyint(1) DEFAULT '0',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_agencia`,`id_aplicativo`),
  KEY `fk_agencia_aplicativo__aplicativo_idx` (`id_aplicativo`),
  KEY `fk_agencia_aplicativo__agenciaRegistro_idx` (`id_registro`),
  KEY `fk_agencia_aplicativo__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_agencia_aplicativo__agencia` FOREIGN KEY (`id_agencia`) REFERENCES `agencia` (`id_agencia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_agencia_aplicativo__aplicativo` FOREIGN KEY (`id_aplicativo`) REFERENCES `aplicativo` (`id_aplicativo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_agencia_aplicativo__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_agencia_aplicativo__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencia_aplicativo`
--

/*!40000 ALTER TABLE `agencia_aplicativo` DISABLE KEYS */;
INSERT INTO `agencia_aplicativo` VALUES (1,1000001,0,0,100000,NULL,'2020-04-12 01:17:11','2021-06-03 23:28:49'),(2,1000001,1,0,100000,NULL,'2020-03-02 00:00:03','2020-10-01 04:16:44'),(3,1000001,1,0,100000,NULL,'2020-03-18 00:27:02','2020-04-01 13:31:28'),(7,1000001,1,0,100000,NULL,'2020-03-18 00:27:02','2021-05-02 23:58:38'),(9,1000001,1,1,100000,NULL,'2020-03-18 00:27:02','2021-04-29 14:57:12'),(12,1000001,1,0,100000,NULL,'2020-03-21 18:44:23','2020-03-23 13:27:30'),(15,1000001,1,0,100000,NULL,'2020-03-21 18:49:44','2020-03-28 20:29:45'),(16,1000001,1,0,100000,NULL,'2020-03-26 01:45:14','2020-03-26 01:45:14'),(17,1000001,1,0,100000,NULL,'2020-03-27 00:50:17','2020-03-27 00:50:17'),(19,1000001,1,1,100000,NULL,'2020-03-28 23:56:00','2021-04-29 14:57:12'),(23,1000001,1,0,100000,NULL,'2020-03-31 01:29:14','2020-03-31 01:29:14'),(24,1000001,1,0,100000,NULL,'2020-03-31 22:34:45','2020-03-31 22:34:45'),(28,1000001,1,0,100000,NULL,'2020-04-03 23:15:48','2020-04-03 23:15:48'),(41,1000001,1,1,100000,NULL,'2020-04-09 00:03:34','2021-04-29 14:57:12'),(42,1000001,1,1,100000,NULL,'2020-04-12 22:15:53','2021-04-29 14:57:12'),(43,1000001,1,1,100000,NULL,'2020-04-14 00:46:06','2021-04-29 14:57:12'),(44,1000001,1,0,100000,NULL,'2020-04-14 23:56:18','2020-04-14 23:56:18'),(46,1000001,1,0,100000,NULL,'2020-04-15 23:53:07','2020-04-15 23:53:07'),(47,1000001,1,0,100000,NULL,'2020-04-17 00:52:35','2020-04-17 00:52:35'),(55,1000001,1,0,100000,NULL,'2020-04-24 02:42:29','2020-04-24 02:42:29'),(58,1000001,1,0,100000,NULL,'2020-04-30 16:38:16','2020-04-30 16:38:16'),(62,1000001,1,1,100000,NULL,'2020-05-05 05:15:51','2021-04-29 14:57:12'),(65,1000001,1,0,100000,NULL,'2020-05-07 03:01:24','2020-05-07 03:01:24'),(69,1000001,1,1,100000,NULL,'2020-05-11 06:32:04','2021-04-29 14:57:12'),(70,1000001,1,0,100000,NULL,'2020-05-17 23:58:46','2020-05-17 23:58:46'),(87,1000001,1,0,100000,NULL,'2020-10-16 13:59:55','2020-10-16 13:59:55'),(88,1000001,1,0,100000,NULL,'2020-10-16 14:02:13','2020-10-16 14:02:13'),(97,1000001,1,1,100000,NULL,'2020-06-01 04:42:28','2021-04-29 14:57:12'),(101,1000001,0,0,100000,NULL,'2020-06-11 05:21:22','2020-07-09 18:07:44'),(104,1000001,1,1,100000,NULL,'2020-06-15 23:49:39','2021-04-29 14:57:12'),(105,1000001,1,0,100000,NULL,'2020-06-16 21:29:54','2020-06-16 21:29:54'),(108,1000001,1,1,100000,NULL,'2020-06-24 23:28:28','2021-04-29 14:57:12'),(109,1000001,1,0,100000,NULL,'2020-06-27 02:42:54','2020-06-27 02:42:54'),(115,1000001,1,1,100000,NULL,'2020-07-12 03:45:10','2021-04-29 14:57:12'),(117,1000001,1,1,100000,NULL,'2020-07-19 03:27:08','2021-04-29 14:57:12'),(124,1000001,1,0,100000,NULL,'2020-07-25 00:38:19','2020-07-25 00:38:19'),(127,1000001,1,0,100000,NULL,'2020-08-03 03:01:37','2020-08-03 03:01:37'),(128,1000001,1,0,100000,NULL,'2020-08-07 05:04:53','2020-08-07 05:04:53'),(135,1000001,1,1,100000,NULL,'2020-08-24 01:48:39','2021-04-29 14:57:12'),(140,1000001,0,0,100000,NULL,'2020-12-09 15:07:38','2021-01-18 22:48:18');
/*!40000 ALTER TABLE `agencia_aplicativo` ENABLE KEYS */;

--
-- Table structure for table `agencia_categoria`
--

DROP TABLE IF EXISTS `agencia_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencia_categoria` (
  `id_agencia` int NOT NULL,
  `id_categoria` int NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_agencia`,`id_categoria`),
  KEY `fk_agencia_categoria__categoria_idx` (`id_categoria`),
  KEY `fk_agencia_categoria__agenciaRegistro_idx` (`id_registro`),
  KEY `fk_agencia_categoria__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_agencia_categoria__agencia` FOREIGN KEY (`id_agencia`) REFERENCES `agencia` (`id_agencia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_agencia_categoria__categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_agencia_categoria__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_agencia_categoria__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencia_categoria`
--

/*!40000 ALTER TABLE `agencia_categoria` DISABLE KEYS */;
INSERT INTO `agencia_categoria` VALUES (1,117,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(2,116,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(3,106,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(7,110,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(9,110,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(15,109,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(16,109,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(17,113,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(19,109,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(23,115,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(24,102,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(24,104,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(28,113,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(41,110,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(42,105,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(43,101,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(44,103,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(44,104,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(44,107,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(46,110,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(47,101,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(55,106,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(58,108,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(62,109,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(65,102,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(65,104,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(69,106,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(70,101,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(70,108,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(87,116,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(88,116,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(97,104,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(97,107,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(101,104,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(101,110,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(104,105,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(104,108,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(105,104,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(105,110,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(108,108,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(109,108,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(115,103,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(115,104,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(117,104,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(124,105,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(127,104,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(127,107,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(128,111,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12'),(135,108,1,100000,NULL,'2021-05-17 16:14:12','2021-05-17 16:14:12');
/*!40000 ALTER TABLE `agencia_categoria` ENABLE KEYS */;

--
-- Table structure for table `aplicativo`
--

DROP TABLE IF EXISTS `aplicativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aplicativo` (
  `id_aplicativo` int NOT NULL,
  `aplicativo` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `restringir` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cuando no se restringe la agencia y se quiere notificar solicitudes solo entre mismos clientes de la misma app. ',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_aplicativo`),
  KEY `fk_aplicativo__clienteRegistro_idx` (`id_registro`),
  KEY `fk_aplicativo__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_aplicativo__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_aplicativo__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplicativo`
--

/*!40000 ALTER TABLE `aplicativo` DISABLE KEYS */;
INSERT INTO `aplicativo` VALUES (1000001,'delivery',0,0,100000,NULL,'2020-01-24 17:28:00','2021-06-09 15:03:43');
/*!40000 ALTER TABLE `aplicativo` ENABLE KEYS */;

--
-- Table structure for table `asignado`
--

DROP TABLE IF EXISTS `asignado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignado` (
  `id_conductor` int NOT NULL,
  `asignados` int NOT NULL COMMENT 'Viajando',
  `recogido` int NOT NULL DEFAULT '0',
  `entregado` int NOT NULL DEFAULT '0',
  `cancelada` int NOT NULL DEFAULT '0',
  `fecha_asignado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora de la ultimo pedido asignado',
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_conductor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignado`
--

/*!40000 ALTER TABLE `asignado` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignado` ENABLE KEYS */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `categoria` varchar(145) NOT NULL,
  `img` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (0,'Todas','0'),(101,'Pizza','101'),(102,'Papas','102'),(103,'Alitas','103'),(104,'FastFood','104'),(105,'Grill','105'),(106,'Mariscos','106'),(107,'Mexicana','107'),(108,'Tradicional','108'),(109,'Pasteleria','109'),(110,'Pollo','110'),(111,'Asiatica','111'),(112,'Sushi','112'),(113,'Super','113'),(114,'Licores','114'),(115,'Pañalera','115'),(116,'Farmacia','116'),(117,'Help','117');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `id_aplicativo` int NOT NULL,
  `id_plataforma` int NOT NULL,
  `perfil` tinyint(1) NOT NULL DEFAULT '0',
  `history` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'History del perfil',
  `idFacebook` varchar(60) DEFAULT NULL,
  `idGoogle` varchar(60) DEFAULT NULL,
  `idApple` varchar(60) DEFAULT NULL,
  `id_urbe` int NOT NULL DEFAULT '0',
  `codigoPais` varchar(5) NOT NULL DEFAULT '+593',
  `simCountryCode` varchar(5) NOT NULL DEFAULT 'EC',
  `celular` varchar(20) DEFAULT NULL,
  `smn` varchar(30) DEFAULT NULL,
  `celularValidado` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 celular no validado\n1 celular validado',
  `correo` varchar(125) NOT NULL,
  `correoValidado` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 correo no validado\n1 correo validado',
  `clave` varchar(45) DEFAULT NULL,
  `nombres` varchar(65) NOT NULL,
  `apellidos` varchar(65) NOT NULL,
  `sexo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 no definido\n1 Mujer\n2 Hombre',
  `cedula` varchar(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `cambiarClave` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 cuando no es necesario que el usuario cambie su contraseña\\n2 cuando se debe obligar al usuario a cambiar la contraseña',
  `claveTemporal` varchar(45) DEFAULT NULL COMMENT 'sera la calve que se usara para ingresar al sistema, esto cuando el cliente recupera la clave varias veces',
  `link` varchar(125) NOT NULL DEFAULT '',
  `url` varchar(45) DEFAULT NULL COMMENT 'has para validar el correo electronico de un usuario mediante el uso de un link de validacion',
  `personalidad` varchar(125) DEFAULT NULL,
  `img` varchar(300) NOT NULL DEFAULT '',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `beta` json DEFAULT NULL,
  `id_registro` int DEFAULT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_recupero` datetime DEFAULT NULL,
  `puntos` int unsigned NOT NULL DEFAULT '0',
  `direcciones` int unsigned NOT NULL DEFAULT '0',
  `calificaciones` int unsigned NOT NULL DEFAULT '0',
  `calificacion` double(10,2) unsigned NOT NULL DEFAULT '0.00',
  `likes` int unsigned NOT NULL DEFAULT '0',
  `views` int unsigned NOT NULL DEFAULT '0',
  `header` json DEFAULT NULL,
  `registros` int unsigned NOT NULL DEFAULT '0',
  `confirmados` int unsigned NOT NULL DEFAULT '0',
  `correctos` int unsigned NOT NULL DEFAULT '0',
  `canceladas` int unsigned NOT NULL DEFAULT '0',
  `meta` json NOT NULL,
  `on_line` tinyint(1) NOT NULL DEFAULT '0',
  `cio` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_ultima` datetime DEFAULT NULL,
  `bloqueado` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_bloqueado` datetime DEFAULT NULL,
  `motivo_bloqueado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `unico_correo_aplicativo` (`id_aplicativo`,`correo`) /*!80000 INVISIBLE */,
  UNIQUE KEY `unico_celular_aplicativo` (`id_aplicativo`,`celular`) /*!80000 INVISIBLE */,
  UNIQUE KEY `unico_facebook_aplicativo` (`id_aplicativo`,`idFacebook`) /*!80000 INVISIBLE */,
  UNIQUE KEY `unico_cedula_aplicativo` (`id_aplicativo`,`cedula`) /*!80000 INVISIBLE */,
  UNIQUE KEY `unico_google_aplicativo` (`id_aplicativo`,`idGoogle`),
  UNIQUE KEY `unico_apple_aplicativo` (`id_aplicativo`,`idApple`),
  KEY `fk_cliente_aplicativo_idx` (`id_aplicativo`),
  KEY `fk_cliente_plataforma_idx` (`id_plataforma`),
  KEY `fk_cliente__clienteRegistro_idx` (`id_registro`),
  KEY `fk_cliente__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_cliente__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_aplicativo` FOREIGN KEY (`id_aplicativo`) REFERENCES `aplicativo` (`id_aplicativo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_plataforma` FOREIGN KEY (`id_plataforma`) REFERENCES `plataforma` (`id_plataforma`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=233318 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (100000,1000001,1,1,1,NULL,NULL,NULL,1,'+593','EC','+593969901640','593593969901641',1,'info@planck.biz',1,'8b9fd96dee79a179005983953b92ff92','Administrador','',2,NULL,'1991-02-17',0,'8b9fd96dee79a179005983953b92ff92','https://delivery.hopfor.shop/XH3T','001099dc4b4f56a64174334e2811c976',NULL,'https://apollo-virginia.akamaized.net/v1/files/iu76w7lvc6lh1-GT/image;s=550x0',1,'{\"v\": \"1\", \"ar\": \"1\"}',NULL,NULL,'2020-01-31 15:51:57','2022-04-15 14:36:04','2020-02-17 18:17:44',0,1,58,265.50,3,180,'{\"headers\": {\"so\": \"28\", \"vs\": \"0.0.1\", \"iph\": \"true\", \"red\": \"x\", \"host\": \"api.hopfor.shop\", \"imei\": \"12e06778c2c69caa829c75c6d0a353d7\", \"marca\": \"HUAWEI\", \"modelo\": \"ANELX3 910355C605E4R1P3\", \"pysics\": \"f51787c3d20e2a2a9dbf0306a5dcc2ac\", \"system\": \"android\", \"connection\": \"upgrade\", \"referencia\": \"12.03.91\", \"user-agent\": \"Dart/2.13 (dart:io)\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"idaplicativo\": \"1000001\", \"idplataforma\": \"1\", \"content-length\": \"152\", \"accept-encoding\": \"gzip\", \"x-forwarded-for\": \"157.100.93.238\"}}',0,0,0,0,'{\"ipInfo\": {\"eu\": \"0\", \"ll\": [-2.1664, -79.9011], \"area\": 500, \"city\": \"Guayaquil\", \"metro\": 0, \"range\": [3191861248, 3191863295], \"region\": \"G\", \"country\": \"EC\", \"timezone\": \"America/Guayaquil\"}, \"headers\": {\"so\": \"28\", \"vs\": \"1.24.109\", \"iph\": \"true\", \"red\": \"x\", \"host\": \"www.roveropportunity.com\", \"imei\": \"12e06778c2c69caa829c75c6d0a353d7\", \"marca\": \"HUAWEI\", \"modelo\": \"ANE-LX3 9.1.0.258(C605E4R1P3)\", \"pysics\": \"f51787c3d20e2a2a9dbf0306a5dcc2ac\", \"system\": \"android\", \"connection\": \"upgrade\", \"referencia\": \"12.03.91\", \"user-agent\": \"Dart/2.7 (dart:io)\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"idaplicativo\": \"1000001\", \"idplataforma\": \"1\", \"content-length\": \"409\", \"accept-encoding\": \"gzip\", \"x-forwarded-for\": \"190.63.240.58\"}}',0,1,'2021-06-29 21:00:41',0,NULL,NULL),(233159,1000001,1,2,0,NULL,NULL,NULL,1,'+593','EC','+593969901642',NULL,1,'moto@gmail.com',0,'8b9fd96dee79a179005983953b92ff92','Juan Pablo','null',0,NULL,NULL,0,'8b9fd96dee79a179005983953b92ff92','https://delivery.hopfor.shop/8a9f','9b3dad2c9775675ce4804bf1c0ae97a1',NULL,'https://firebasestorage.googleapis.com/v0/b/delivery-0001.appspot.com/o/m.jpg?alt=media',1,NULL,NULL,NULL,'2021-05-22 15:04:12','2022-04-15 14:36:04','2021-05-22 15:22:24',0,3,0,0.00,0,921,'{\"headers\": {\"so\": \"27\", \"vs\": \"0.0.1\", \"iph\": \"true\", \"key\": \"d62708cb39252085b13b48eccdf29750\", \"red\": \"x\", \"host\": \"167.99.60.223\", \"imei\": \"8598bde7560279cc031449ab2301b23c\", \"marca\": \"samsung\", \"modelo\": \"M1AJQG610MUBS8CTG1\", \"system\": \"android\", \"connection\": \"upgrade\", \"referencia\": \"12.03.91\", \"user-agent\": \"Dart/2.13 (dart:io)\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"idaplicativo\": \"1000001\", \"idplataforma\": \"1\", \"content-length\": \"170\", \"accept-encoding\": \"gzip\", \"x-forwarded-for\": \"157.100.93.238\"}}',0,0,0,0,'{\"ipInfo\": {\"eu\": \"0\", \"ip\": \"157.100.75.26\", \"ll\": [-2, -77.5], \"area\": 50, \"city\": \"\", \"metro\": 0, \"range\": [2640592896, 2640609279], \"region\": \"\", \"country\": \"EC\", \"timezone\": \"America/Guayaquil\"}, \"headers\": {\"so\": \"28\", \"vs\": \"3.60.408\", \"iph\": \"true\", \"red\": \"x\", \"host\": \"167.99.60.223\", \"imei\": \"71472d885080e2219385fa8054c93161\", \"marca\": \"HUAWEI\", \"modelo\": \"ANELX3 910355C605E4R1P3\", \"pysics\": \"941fb62cd21fd0797a9b4638d960d41f\", \"system\": \"android\", \"connection\": \"upgrade\", \"referencia\": \"12.03.91\", \"user-agent\": \"Dart/2.12 (dart:io)\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"idaplicativo\": \"1000001\", \"idplataforma\": \"1\", \"content-length\": \"389\", \"accept-encoding\": \"gzip\", \"x-forwarded-for\": \"157.100.75.26\"}}',1,0,'2021-06-29 21:00:46',0,NULL,NULL),(233302,1000001,1,0,0,NULL,NULL,NULL,1,'+593','EC','+593969901641',NULL,1,'juanpa.desert@gmail.com',0,'8b9fd96dee79a179005983953b92ff92','Juan Pablo','null',0,NULL,NULL,0,'8b9fd96dee79a179005983953b92ff92','https://delivery.hopfor.shop/25ee','1fd59cd91459221a571a94c8f3a42b30',NULL,'',1,NULL,NULL,NULL,'2021-06-20 13:55:14','2022-04-15 14:36:04','2021-06-22 12:50:30',0,1,1,5.00,0,83,'{\"headers\": {\"so\": \"28\", \"vs\": \"0.0.1\", \"iph\": \"true\", \"key\": \"f51787c3d20e2a2a9dbf0306a5dcc2ac\", \"red\": \"x\", \"host\": \"167.99.60.223\", \"imei\": \"763f897b3350a0bd6f130d64e8786fd5\", \"marca\": \"HUAWEI\", \"modelo\": \"ANELX3 910355C605E4R1P3\", \"system\": \"android\", \"connection\": \"upgrade\", \"referencia\": \"12.03.91\", \"user-agent\": \"Dart/2.13 (dart:io)\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"idaplicativo\": \"1000001\", \"idplataforma\": \"1\", \"content-length\": \"143\", \"accept-encoding\": \"gzip\", \"x-forwarded-for\": \"157.100.93.238\"}}',0,0,0,0,'{\"ipInfo\": {\"eu\": \"0\", \"ip\": \"157.100.93.238\", \"ll\": [-2, -77.5], \"area\": 50, \"city\": \"\", \"metro\": 0, \"range\": [2640592896, 2640609279], \"region\": \"\", \"country\": \"EC\", \"timezone\": \"America/Guayaquil\"}, \"headers\": {\"so\": \"28\", \"vs\": \"3.61.434\", \"iph\": \"true\", \"red\": \"x\", \"host\": \"167.99.60.223\", \"imei\": \"ff2db521f5d5224b671ba31b94381bd1\", \"marca\": \"HUAWEI\", \"modelo\": \"ANELX3 910355C605E4R1P3\", \"pysics\": \"a9f29837c3fb1ef503e1ac9acfc20e5b\", \"system\": \"android\", \"connection\": \"upgrade\", \"referencia\": \"12.03.91\", \"user-agent\": \"Dart/2.13 (dart:io)\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"idaplicativo\": \"1000001\", \"idplataforma\": \"1\", \"content-length\": \"389\", \"accept-encoding\": \"gzip\", \"x-forwarded-for\": \"157.100.93.238\"}}',1,0,'2021-06-29 21:00:41',0,NULL,NULL),(233314,1000001,1,2,0,NULL,NULL,NULL,1,'+593','EC','+593969900001',NULL,1,'moto2831@gmail.com',0,'8b9fd96dee79a179005983953b92ff92','Moto Paraguay','null',0,NULL,NULL,0,'8b9fd96dee79a179005983953b92ff92','https://delivery.hopfor.shop/8a9f','9b3dad2c9775675ce4804bf1c0ae97a1',NULL,'https://firebasestorage.googleapis.com/v0/b/delivery-0001.appspot.com/o/m.jpg?alt=media',1,NULL,NULL,NULL,'2021-05-22 15:04:12','2022-04-15 14:36:04','2021-05-22 15:22:24',0,3,0,0.00,0,849,'{\"headers\": {\"so\": \"28\", \"vs\": \"0.0.1\", \"iph\": \"true\", \"key\": \"f51787c3d20e2a2a9dbf0306a5dcc2ac\", \"red\": \"x\", \"host\": \"www.api-delivery.planck.biz\", \"imei\": \"763f897b3350a0bd6f130d64e8786fd5\", \"marca\": \"HUAWEI\", \"modelo\": \"ANELX3 910355C605E4R1P3\", \"system\": \"android\", \"connection\": \"upgrade\", \"referencia\": \"12.03.91\", \"user-agent\": \"Dart/2.13 (dart:io)\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"idaplicativo\": \"1000001\", \"idplataforma\": \"1\", \"content-length\": \"148\", \"accept-encoding\": \"gzip\", \"x-forwarded-for\": \"157.100.93.238\"}}',0,0,0,0,'{\"ipInfo\": {\"eu\": \"0\", \"ip\": \"157.100.75.26\", \"ll\": [-2, -77.5], \"area\": 50, \"city\": \"\", \"metro\": 0, \"range\": [2640592896, 2640609279], \"region\": \"\", \"country\": \"EC\", \"timezone\": \"America/Guayaquil\"}, \"headers\": {\"so\": \"28\", \"vs\": \"3.60.408\", \"iph\": \"true\", \"red\": \"x\", \"host\": \"167.99.60.223\", \"imei\": \"71472d885080e2219385fa8054c93161\", \"marca\": \"HUAWEI\", \"modelo\": \"ANELX3 910355C605E4R1P3\", \"pysics\": \"941fb62cd21fd0797a9b4638d960d41f\", \"system\": \"android\", \"connection\": \"upgrade\", \"referencia\": \"12.03.91\", \"user-agent\": \"Dart/2.12 (dart:io)\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"idaplicativo\": \"1000001\", \"idplataforma\": \"1\", \"content-length\": \"389\", \"accept-encoding\": \"gzip\", \"x-forwarded-for\": \"157.100.75.26\"}}',0,0,'2021-06-22 13:22:33',0,NULL,NULL),(233315,1000001,1,2,0,NULL,NULL,NULL,1,'+593','EC','+593969400012',NULL,1,'moto2552@gmail.com',0,'8b9fd96dee79a179005983953b92ff92','Moto Madrid','null',0,NULL,NULL,0,'8b9fd96dee79a179005983953b92ff92','https://delivery.hopfor.shop/8a9f','9b3dad2c9775675ce4804bf1c0ae97a1',NULL,'https://firebasestorage.googleapis.com/v0/b/delivery-0001.appspot.com/o/m.jpg?alt=media',1,NULL,NULL,NULL,'2021-05-22 15:04:12','2022-04-15 14:36:04','2021-05-22 15:22:24',0,4,0,0.00,0,907,'{\"headers\": {\"so\": \"27\", \"vs\": \"0.0.1\", \"iph\": \"true\", \"red\": \"x\", \"host\": \"api.hopfor.shop\", \"imei\": \"ffa3c1b6e00af559630f0aa8e2a4c4ed\", \"marca\": \"samsung\", \"modelo\": \"M1AJQJ710MNUBS4CTF2\", \"pysics\": \"a2bf9ba7d10c7dd7867cbfe8aa0908d8\", \"system\": \"android\", \"connection\": \"upgrade\", \"referencia\": \"12.03.91\", \"user-agent\": \"Dart/2.13 (dart:io)\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"idaplicativo\": \"1000001\", \"idplataforma\": \"1\", \"content-length\": \"156\", \"accept-encoding\": \"gzip\", \"x-forwarded-for\": \"45.239.44.178\"}}',0,0,0,0,'{\"ipInfo\": {\"eu\": \"0\", \"ip\": \"157.100.75.26\", \"ll\": [-2, -77.5], \"area\": 50, \"city\": \"\", \"metro\": 0, \"range\": [2640592896, 2640609279], \"region\": \"\", \"country\": \"EC\", \"timezone\": \"America/Guayaquil\"}, \"headers\": {\"so\": \"28\", \"vs\": \"3.60.408\", \"iph\": \"true\", \"red\": \"x\", \"host\": \"167.99.60.223\", \"imei\": \"71472d885080e2219385fa8054c93161\", \"marca\": \"HUAWEI\", \"modelo\": \"ANELX3 910355C605E4R1P3\", \"pysics\": \"941fb62cd21fd0797a9b4638d960d41f\", \"system\": \"android\", \"connection\": \"upgrade\", \"referencia\": \"12.03.91\", \"user-agent\": \"Dart/2.12 (dart:io)\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"idaplicativo\": \"1000001\", \"idplataforma\": \"1\", \"content-length\": \"389\", \"accept-encoding\": \"gzip\", \"x-forwarded-for\": \"157.100.75.26\"}}',0,0,'2021-06-23 02:18:42',0,NULL,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cliente_BEFORE_INSERT` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
	SET NEW.nombres = f_mayusculaMinuscula(TRIM(NEW.nombres));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cliente_BEFORE_UPDATE` BEFORE UPDATE ON `cliente` FOR EACH ROW BEGIN
	DECLARE _celularValidado BOOL;
    SET NEW.nombres = f_mayusculaMinuscula(TRIM(NEW.nombres));
    IF (OLD.celular != NEW.celular) THEN
        SELECT IF(id_cliente IS NULL, FALSE, TRUE) INTO _celularValidado FROM delivery.cliente_celular WHERE id_cliente = NEW.id_cliente AND celular = NEW.celular;
		IF (_celularValidado IS TRUE) THEN
			SET NEW.celularValidado = 1;
		ELSE 
			SET NEW.celularValidado = 0;
		END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente_agencia`
--

DROP TABLE IF EXISTS `cliente_agencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_agencia` (
  `id_cliente` int NOT NULL,
  `id_agencia` int NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Se debe activar solo si se le permite administrar su productos desde el perfil de asesor.',
  `me_gusta` tinyint(1) NOT NULL DEFAULT '1',
  `shares` int unsigned NOT NULL DEFAULT '0',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`,`id_agencia`),
  KEY `fk_cliente__agencia_idx` (`id_agencia`),
  KEY `fk_cliente_agencia__clienteRegistro_idx` (`id_registro`),
  KEY `fk_cliente_agencia__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_cliente__agencia` FOREIGN KEY (`id_agencia`) REFERENCES `agencia` (`id_agencia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_agencia__cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_agencia__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_agencia__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Like del USUARIO.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_agencia`
--

/*!40000 ALTER TABLE `cliente_agencia` DISABLE KEYS */;
INSERT INTO `cliente_agencia` VALUES (233159,108,0,0,1,233159,NULL,'2021-06-23 20:26:08','2021-06-23 20:26:08'),(233302,117,0,0,1,233302,NULL,'2021-06-23 18:01:03','2021-06-23 18:01:03');
/*!40000 ALTER TABLE `cliente_agencia` ENABLE KEYS */;

--
-- Table structure for table `cliente_aplicativo`
--

DROP TABLE IF EXISTS `cliente_aplicativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_aplicativo` (
  `id_cliente` int NOT NULL,
  `id_aplicativo` int NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`,`id_aplicativo`),
  KEY `fk_cliente_aplicativo__aplicativo_idx` (`id_aplicativo`),
  KEY `fk_cliente_aplicativo__clienteRegistro_idx` (`id_registro`),
  KEY `fk_cliente_aplicativo__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_cliente_aplicativo__aplicativo` FOREIGN KEY (`id_aplicativo`) REFERENCES `aplicativo` (`id_aplicativo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_aplicativo__cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_aplicativo__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_aplicativo__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_aplicativo`
--

/*!40000 ALTER TABLE `cliente_aplicativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_aplicativo` ENABLE KEYS */;

--
-- Table structure for table `cliente_celular`
--

DROP TABLE IF EXISTS `cliente_celular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_celular` (
  `id_cliente` int NOT NULL,
  `celular` varchar(20) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`,`celular`),
  CONSTRAINT `fk_cliente_celular__cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_celular`
--

/*!40000 ALTER TABLE `cliente_celular` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_celular` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cliente_celular_BEFORE_INSERT` BEFORE INSERT ON `cliente_celular` FOR EACH ROW BEGIN
	UPDATE `delivery`.`cliente` SET `celularValidado` = '1' WHERE `id_cliente` = NEW.id_cliente;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente_session`
--

DROP TABLE IF EXISTS `cliente_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_session` (
  `id_cliente` int NOT NULL,
  `imei` varchar(33) NOT NULL,
  `id_aplicativo` int NOT NULL,
  `id_plataforma` int NOT NULL,
  `on_line` tinyint(1) NOT NULL DEFAULT '1',
  `id_rastreo` int NOT NULL DEFAULT '0',
  `id` varchar(45) DEFAULT NULL,
  `auth` varchar(33) NOT NULL,
  `token` varchar(400) DEFAULT NULL,
  `activado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 Iniciada,\\\\n0 Cerrada.',
  `marca` varchar(125) NOT NULL,
  `modelo` varchar(125) NOT NULL,
  `so` varchar(45) NOT NULL,
  `vs` varchar(45) NOT NULL,
  `meta` json DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_cerrado` datetime DEFAULT NULL,
  `fecha_cambio_token` datetime DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int DEFAULT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rastrear` tinyint(1) NOT NULL DEFAULT '0',
  `lt` double(10,6) NOT NULL DEFAULT '0.000000',
  `lg` double(10,6) NOT NULL DEFAULT '0.000000',
  `utc` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente`,`imei`),
  UNIQUE KEY `token_UNIQUE` (`token`),
  KEY `index_id_rastreo` (`id_rastreo`),
  CONSTRAINT `fk_clientePush_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_session`
--

/*!40000 ALTER TABLE `cliente_session` DISABLE KEYS */;
INSERT INTO `cliente_session` VALUES (100000,'12e06778c2c69caa829c75c6d0a353d7',1000001,1,0,0,'SBYa2X0XGp3jv-nmAAAF','b7c93d30632e4ec005a8ff6441b1e914','egyuPjCfT7KpGmUhgK-a8s:APA91bHTRPQ3rwISfxwyPpJXeqgvGwpEXvzkSqGwVUR-10O6vZYmZc2ca0psJl6SZOOvv30HWfRGhFTyJ3I2Ahq6JGs9AQ4iessptTlqYjgC75pL6CtmbgEb-eDfnbYZs4WSs6oXXPHQ',1,'HUAWEI','ANELX3 910355C605E4R1P3','28','0.0.1','{\"ipInfo\": {\"eu\": \"0\", \"ip\": \"157.100.93.238\", \"ll\": [-2, -77.5], \"area\": 50, \"city\": \"\", \"metro\": 0, \"range\": [2640592896, 2640609279], \"region\": \"\", \"country\": \"EC\", \"timezone\": \"America/Guayaquil\"}, \"headers\": {\"so\": \"28\", \"vs\": \"0.0.1\", \"iph\": \"true\", \"red\": \"x\", \"host\": \"api.hopfor.shop\", \"imei\": \"12e06778c2c69caa829c75c6d0a353d7\", \"marca\": \"HUAWEI\", \"modelo\": \"ANELX3 910355C605E4R1P3\", \"pysics\": \"f51787c3d20e2a2a9dbf0306a5dcc2ac\", \"system\": \"android\", \"connection\": \"upgrade\", \"referencia\": \"12.03.91\", \"user-agent\": \"Dart/2.13 (dart:io)\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"idaplicativo\": \"1000001\", \"idplataforma\": \"1\", \"content-length\": \"270\", \"accept-encoding\": \"gzip\", \"x-forwarded-for\": \"157.100.93.238\"}}','2021-06-23 15:56:37',NULL,'2021-06-23 16:13:01',1,NULL,NULL,'2021-06-23 15:56:37','2021-06-23 16:13:22',0,0.000000,0.000000,NULL),(233159,'8598bde7560279cc031449ab2301b23c',1000001,1,1,0,'ivNp7hIH2HPTcaZiAAAG','f0e1fbca6cb84aded648db709bae912f','eu_If8ZuT4e_I7qAjR6IE_:APA91bHTXux5iGpg94ME1RSV9j5TXHqmMhUN649aXu7AC0VBQNTVNUyybOjvdNKn8MyvfuYOgFHSqrZdNhj5PQLYaZDbifA73MdLzTOV6wHLewC-3_JYOy51oQUJn4PWN7b_xiGAjkZW',1,'samsung','M1AJQG610MUBS8CTG1','27','0.0.1','{\"ipInfo\": {\"eu\": \"0\", \"ip\": \"157.100.93.238\", \"ll\": [-2, -77.5], \"area\": 50, \"city\": \"\", \"metro\": 0, \"range\": [2640592896, 2640609279], \"region\": \"\", \"country\": \"EC\", \"timezone\": \"America/Guayaquil\"}, \"headers\": {\"so\": \"27\", \"vs\": \"0.0.1\", \"iph\": \"true\", \"key\": \"d62708cb39252085b13b48eccdf29750\", \"red\": \"x\", \"host\": \"167.99.60.223\", \"imei\": \"8598bde7560279cc031449ab2301b23c\", \"marca\": \"samsung\", \"modelo\": \"M1AJQG610MUBS8CTG1\", \"system\": \"android\", \"connection\": \"upgrade\", \"referencia\": \"12.03.91\", \"user-agent\": \"Dart/2.13 (dart:io)\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"idaplicativo\": \"1000001\", \"idplataforma\": \"1\", \"content-length\": \"270\", \"accept-encoding\": \"gzip\", \"x-forwarded-for\": \"157.100.93.238\"}}','2021-06-29 20:41:15',NULL,'2021-06-29 21:00:58',1,NULL,NULL,'2021-06-29 20:41:15','2021-06-29 21:07:23',0,-4.004220,-79.209233,'2021-06-29 21:00:58'),(233302,'763f897b3350a0bd6f130d64e8786fd5',1000001,1,1,233159,'IXF00CKX79YkuYk3AAAH','b944853b7eb94f5f46121d91d67e17de','fSe6lgn_Q7KJmtgsataqP9:APA91bFMy375b7LQrYiFN6474H5w4yzzfrVqbPUyt01e1ora-2wWJN_Wgp2A5vJEPsL9binqbVVP4Dlr1YME4ygfOEZNLT7qNkiPgno58fdMNpfVKWaLxI1dR9QknGjuhmgS-ZqgtwQg',1,'HUAWEI','ANELX3 910355C605E4R1P3','28','0.0.1','{\"ipInfo\": {\"eu\": \"0\", \"ip\": \"157.100.93.238\", \"ll\": [-2, -77.5], \"area\": 50, \"city\": \"\", \"metro\": 0, \"range\": [2640592896, 2640609279], \"region\": \"\", \"country\": \"EC\", \"timezone\": \"America/Guayaquil\"}, \"headers\": {\"so\": \"28\", \"vs\": \"0.0.1\", \"iph\": \"true\", \"key\": \"f51787c3d20e2a2a9dbf0306a5dcc2ac\", \"red\": \"x\", \"host\": \"167.99.60.223\", \"imei\": \"763f897b3350a0bd6f130d64e8786fd5\", \"marca\": \"HUAWEI\", \"modelo\": \"ANELX3 910355C605E4R1P3\", \"system\": \"android\", \"connection\": \"upgrade\", \"referencia\": \"12.03.91\", \"user-agent\": \"Dart/2.13 (dart:io)\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"idaplicativo\": \"1000001\", \"idplataforma\": \"1\", \"content-length\": \"270\", \"accept-encoding\": \"gzip\", \"x-forwarded-for\": \"157.100.93.238\"}}','2021-06-29 20:30:51',NULL,'2021-06-29 21:00:59',1,NULL,NULL,'2021-06-29 20:30:51','2021-06-29 21:00:59',0,0.000000,0.000000,NULL);
/*!40000 ALTER TABLE `cliente_session` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cliente_session_AFTER_INSERT` AFTER INSERT ON `cliente_session` FOR EACH ROW BEGIN
	UPDATE `delivery`.`sucursal` s 
	INNER JOIN delivery.sucursal_cajero cs ON s.id_sucursal = cs.id_sucursal
	SET s.`sessiones` = s.`sessiones` + '1' 
	WHERE cs.id_cajero = NEW.id_cliente;
    
    UPDATE `delivery`.`cliente` SET `on_line` = '1' WHERE `id_cliente` = NEW.id_cliente LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cliente_session_BEFORE_UPDATE` BEFORE UPDATE ON `cliente_session` FOR EACH ROW BEGIN
    DECLARE _online TINYINT(1); 
    
    IF(NEW.on_line = 1)THEN
         UPDATE `delivery`.`cliente` SET `on_line` = '1' WHERE `id_cliente` = NEW.id_cliente LIMIT 1;
    ELSEIF (NEW.on_line = 0)THEN
		SELECT cs.on_line INTO _online FROM delivery.cliente_session cs WHERE cs.id_cliente = NEW.id_cliente AND cs.on_line = 1 AND cs.imei != NEW.imei LIMIT 1;
        UPDATE `delivery`.`cliente` SET `on_line` = IFNULL(_online, 0) WHERE `id_cliente` = NEW.id_cliente LIMIT 1;
	END IF;
   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cliente_session_BEFORE_DELETE` BEFORE DELETE ON `cliente_session` FOR EACH ROW BEGIN
		DECLARE _online TINYINT(1); 
            
        UPDATE `delivery`.`sucursal` s 
		INNER JOIN delivery.sucursal_cajero cs ON s.id_sucursal = cs.id_sucursal
		SET s.`sessiones` = s.`sessiones` - '1' 
		WHERE cs.id_cajero = OLD.id_cliente AND s.`sessiones` > 0;
        
		SELECT cs.on_line INTO _online FROM delivery.cliente_session cs WHERE cs.id_cliente = OLD.id_cliente AND cs.on_line = 1 AND cs.imei != OLD.imei LIMIT 1;
        UPDATE `delivery`.`cliente` SET `on_line` = IFNULL(_online, 0) WHERE `id_cliente` = OLD.id_cliente LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente_settings`
--

DROP TABLE IF EXISTS `cliente_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_settings` (
  `id_cliente` int NOT NULL,
  `settings` json NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_cliente_settings__clienteRegistro_idx` (`id_registro`),
  KEY `fk_cliente_settings__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_cliente_settings__cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_settings__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_settings__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_settings`
--

/*!40000 ALTER TABLE `cliente_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_settings` ENABLE KEYS */;

--
-- Table structure for table `cliente_sucursal`
--

DROP TABLE IF EXISTS `cliente_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_sucursal` (
  `id_cliente` int NOT NULL,
  `id_sucursal` int NOT NULL,
  `id_agencia` int NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`,`id_sucursal`),
  KEY `fk_cliente__sucursal_idx` (`id_sucursal`),
  KEY `fk_cliente_sucursal__clienteRegistro_idx` (`id_registro`),
  KEY `fk_cliente_sucursal__clienteActualizo_idx` (`id_actualizo`),
  KEY `fk_cliente_sucursal__agencia_idx` (`id_agencia`),
  CONSTRAINT `fk_cliente__sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_sucursal__agencia` FOREIGN KEY (`id_agencia`) REFERENCES `agencia` (`id_agencia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_sucursal__cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_sucursal__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_sucursal__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_sucursal`
--

/*!40000 ALTER TABLE `cliente_sucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_sucursal` ENABLE KEYS */;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_aplicativo` int NOT NULL,
  `id_sucursal` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_despacho` bigint NOT NULL DEFAULT '0',
  `id_conductor` int NOT NULL DEFAULT '0',
  `fecha` date NOT NULL,
  `anio` year NOT NULL,
  `mes` tinyint(1) NOT NULL,
  `id_pago` int NOT NULL DEFAULT '1',
  `id_forma_pago` int NOT NULL DEFAULT '0',
  `id_cupon` int NOT NULL DEFAULT '0',
  `id_cajero` int NOT NULL,
  `id_compra_estado` int NOT NULL,
  `id_cancelo` int DEFAULT NULL,
  `id_direccion` int DEFAULT NULL,
  `id_chat` bigint unsigned DEFAULT NULL COMMENT 'Chat con el que se acuerda la compra',
  `id_cash` bigint unsigned NOT NULL DEFAULT '0',
  `cash` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Valor del credito',
  `credito` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Valor de los productos pendiente al local (Cliente pago en tarjeta, cupón o descuento)',
  `credito_producto` double(10,2) NOT NULL DEFAULT '0.00',
  `credito_envio` double(10,2) NOT NULL DEFAULT '0.00',
  `costo` double(10,2) DEFAULT NULL COMMENT 'Valor total que invierte el Opportunity Despachador (costo_producto + costo_entrega)',
  `costo_producto` double(10,2) DEFAULT NULL,
  `costo_entrega` double(10,2) DEFAULT NULL COMMENT 'Valor del costo de entrega',
  `id_hashtag` int NOT NULL DEFAULT '0',
  `hashtag` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Valor del descuento por caje de hashtag',
  `descontado` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Valor del descuento por uso de Oportunity Money',
  `transaccion` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Valor que se evalúa para acreditar credito al Opportunity Despachador',
  `detalle` varchar(1200) NOT NULL DEFAULT ' ',
  `referencia` varchar(125) DEFAULT NULL,
  `lt` double(10,6) DEFAULT NULL,
  `lg` double(10,6) DEFAULT NULL,
  `acreditado` tinyint NOT NULL DEFAULT '-1' COMMENT '-1 Indiferente\n1 Dinero acreditado\n0 Dinero no acreditado\n',
  `sinLeerCajero` tinyint NOT NULL DEFAULT '1',
  `sinLeerCliente` tinyint NOT NULL DEFAULT '1',
  `calificarCliente` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Se considera en el chat del cliente\n0 No se pide calificar\\\\n1 Se pide calificar\\\\n2 Ya se califico\n',
  `calificarCajero` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Se considera en el chat del cajero\n0 No se pide calificar\\\\n1 Se pide calificar\\\\n2 Ya se califico',
  `calificacionCliente` double(2,1) DEFAULT '4.5' COMMENT 'Calificacion que dio el cliente al cajero',
  `calificacionCajero` double(2,1) DEFAULT '5.0' COMMENT 'Calificacion que dio el cajero al cliente',
  `comentarioCliente` varchar(180) DEFAULT NULL,
  `comentarioCajero` varchar(180) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_comprada` datetime DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL COMMENT 'Fecha que se entrego la compra es la fecha que pago.',
  `fecha_referencia` datetime DEFAULT NULL,
  `fecha_califico_cajero` datetime DEFAULT NULL,
  `fecha_califico_cliente` datetime DEFAULT NULL,
  `fecha_cancelo` datetime DEFAULT NULL,
  `fecha_despachado` datetime DEFAULT NULL,
  `fecha_acreditado` datetime DEFAULT NULL,
  `chats` smallint unsigned NOT NULL DEFAULT '0',
  `meta` json NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 Visible 0, No visible para el usuario',
  PRIMARY KEY (`id_compra`),
  KEY `fk_compra__compra_estado_idx` (`id_compra_estado`),
  KEY `fk_compra__cliente_idx` (`id_cliente`),
  KEY `fk_compra__cajero_idx` (`id_cajero`),
  KEY `fk_compra__chat_idx` (`id_chat`),
  KEY `fk_compra__aplicativo_idx` (`id_aplicativo`),
  KEY `fk_compra__sucursal_idx` (`id_sucursal`),
  KEY `index_anio_mes` (`anio`,`mes`,`fecha`) /*!80000 INVISIBLE */,
  KEY `index_fecha` (`fecha`),
  CONSTRAINT `fk_compra__aplicativo` FOREIGN KEY (`id_aplicativo`) REFERENCES `aplicativo` (`id_aplicativo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_compra__cajero` FOREIGN KEY (`id_cajero`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_compra__chat` FOREIGN KEY (`id_chat`) REFERENCES `compra_chat` (`id_chat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_compra__cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_compra__compra_estado` FOREIGN KEY (`id_compra_estado`) REFERENCES `compra_estado` (`id_compra_estado`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_compra__sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=330692 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `compra_BEFORE_INSERT` BEFORE INSERT ON `compra` FOR EACH ROW BEGIN
	IF(NEW.descontado > 0)THEN
		SET NEW.id_pago = 4; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `compra_AFTER_INSERT` AFTER INSERT ON `compra` FOR EACH ROW BEGIN
	
    UPDATE `delivery`.`cliente` SET `registros` = registros + 1, fecha_ultima = NOW() 
		WHERE `id_cliente` = NEW.id_cliente  OR `id_cliente` = NEW.id_cajero LIMIT 2;
        
    UPDATE `delivery`.`sucursal_cajero` SET `registros` = registros + 1 
		WHERE `id_cajero` = NEW.id_cajero AND `id_sucursal` = NEW.id_sucursal LIMIT 1;
        
	IF(NEW.descontado > 0)THEN
		UPDATE `delivery`.`saldo` SET `saldo` = saldo - NEW.descontado WHERE `id_cliente` = NEW.id_cliente LIMIT 1;
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `compra_BEFORE_UPDATE` BEFORE UPDATE ON `compra` FOR EACH ROW BEGIN

	DECLARE _devuelto DOUBLE(10,2);
	#Nos aseguramos que el estado se cambie una unca vez

    IF(OLD.id_compra_estado = 2 AND NEW.id_compra_estado = 3)THEN
		IF(NEW.id_cupon > 0 AND NEW.credito > 0)THEN
			UPDATE `delivery_rubro`.`cupon` SET `cupon` = (cupon - NEW.credito), cajes = cajes + 1, fecha_canje = NOW() WHERE `id_cupon` = NEW.id_cupon LIMIT 1;
		END IF;
        #Quitamos el cash
        IF(NEW.cash > 0)THEN
			UPDATE `delivery`.`saldo` SET `cash` = `cash` - NEW.cash WHERE `id_cliente` = NEW.id_cliente LIMIT 1;
		END IF;
	END IF;
    
     IF (OLD.fecha_cancelo IS NULL AND NEW.fecha_cancelo IS NOT NULL) THEN
		IF (NEW.id_cupon > 0 AND NEW.credito > 0) THEN
			UPDATE `delivery_rubro`.`cupon` SET `cupon` = (cupon + NEW.credito), reversos = reversos + 1, fecha_reverso = NOW() WHERE `id_cupon` = NEW.id_cupon LIMIT 1;
		END IF;
        IF(NEW.cash > 0)THEN
			#Regresamos el cash
			UPDATE `delivery`.`saldo` SET `cash` = `cash` + NEW.cash WHERE `id_cliente` = NEW.id_cliente LIMIT 1;
		END IF;
	END IF;
    
	#Si el pago es acreditacion de credito se registra la transaccion una unica vez
    IF (NEW.id_compra_estado = 200 AND OLD.fecha_pago IS NULL)THEN
		IF (NEW.id_forma_pago = 10)THEN
            SET _devuelto := NEW.costo_producto; 
		ELSE
			SET _devuelto := NEW.costo_producto - NEW.credito_producto;
		END IF;
		IF (NEW.transaccion > 0)THEN
			INSERT INTO `delivery_rubro`.`transaccion` 
			(`id_transaccion_estado`, `id_transaccion_tipo`, `id_cliente`, `transaccion`, `id_despacho`) 
			VALUES ('1', '1', NEW.id_conductor, NEW.transaccion, NEW.id_despacho);
		END IF;
		#Registramos una unica vez el pago
		INSERT INTO `delivery_rubro`.`venta` 
		(id_sucursal, anio, mes, id_forma_pago, 
		ventas, credito, credito_producto, credito_envio, costo, costo_producto, costo_entrega, hashtag, descontado, transaccion, 
        ingresos, devuelto) 
		VALUES(
		NEW.id_sucursal, NEW.anio, NEW.mes, NEW.id_forma_pago, 1, NEW.credito, NEW.credito_producto, NEW.credito_envio, NEW.costo,
		NEW.costo_producto, NEW.costo_entrega, NEW.hashtag, NEW.descontado, NEW.transaccion, 
        NEW.costo_producto, _devuelto 
        ) 
		ON DUPLICATE KEY UPDATE
		ventas = ventas + 1, credito = credito + NEW.credito, credito_producto = credito_producto + NEW.credito_producto, credito_envio = credito_envio + NEW.credito_envio, costo = costo + NEW.costo,
		costo_producto = costo_producto + NEW.costo_producto, costo_entrega = costo_entrega + NEW.costo_entrega, hashtag = hashtag + NEW.hashtag, descontado = descontado + NEW.descontado, 
		transaccion = transaccion + NEW.transaccion, 
        ingresos = ingresos + NEW.costo_producto, devuelto = devuelto + _devuelto; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `compra_AFTER_UPDATE` AFTER UPDATE ON `compra` FOR EACH ROW BEGIN
	
    IF OLD.fecha_cancelo IS NULL AND NEW.fecha_cancelo IS NOT NULL THEN
    
		UPDATE `delivery`.`cliente` SET `canceladas` = canceladas + 1 
			WHERE `id_cliente` = OLD.id_cliente OR `id_cliente` = OLD.id_cajero LIMIT 2;
        
		UPDATE `delivery`.`sucursal_cajero` SET `canceladas` = canceladas + 1 
			WHERE `id_cajero` = NEW.id_cajero AND `id_sucursal` = NEW.id_sucursal LIMIT 1;
        
	ELSEIF OLD.fecha_comprada IS NULL AND NEW.fecha_comprada IS NOT NULL THEN
		
        UPDATE `delivery`.`cliente` SET `confirmados` = confirmados + 1 
			WHERE `id_cliente` = OLD.id_cliente OR `id_cliente` = OLD.id_cajero LIMIT 2;
        
        UPDATE `delivery`.`sucursal_cajero` SET `confirmados` = confirmados + 1 
			WHERE `id_cajero` = NEW.id_cajero AND `id_sucursal` = NEW.id_sucursal LIMIT 1;
	
    ELSEIF OLD.fecha_pago IS NULL AND NEW.fecha_pago IS NOT NULL THEN
		
        UPDATE `delivery`.`cliente` SET `correctos` = correctos + 1 
			WHERE `id_cliente` = OLD.id_cliente OR `id_cliente` = OLD.id_cajero LIMIT 2;
        
        UPDATE `delivery`.`sucursal_cajero` SET `correctos` = correctos + 1 
			WHERE `id_cajero` = NEW.id_cajero AND `id_sucursal` = NEW.id_sucursal LIMIT 1;
	
    ELSEIF OLD.fecha_califico_cajero IS NULL AND NEW.fecha_califico_cajero IS NOT NULL THEN
		
        UPDATE `delivery`.`cliente` SET `calificacion` = calificacion + NEW.calificacionCajero, calificaciones = calificaciones + 1  
			WHERE `id_cliente` = OLD.id_cliente LIMIT 1;
	
    ELSEIF OLD.fecha_califico_cliente IS NULL AND NEW.fecha_califico_cliente IS NOT NULL THEN
    
		UPDATE `delivery`.`cliente` SET `calificacion` = calificacion + NEW.calificacionCliente, calificaciones = calificaciones + 1  
			WHERE `id_cliente` = OLD.id_cajero LIMIT 1;
            
		UPDATE `delivery`.`sucursal_cajero` SET `calificacion` = calificacion + NEW.calificacionCliente, calificaciones = calificaciones + 1  
			WHERE `id_cajero` = NEW.id_cajero AND `id_sucursal` = NEW.id_sucursal LIMIT 1;
            
	END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `compra_chat`
--

DROP TABLE IF EXISTS `compra_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_chat` (
  `id_chat` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_compra` bigint unsigned NOT NULL,
  `id_compra_estado` int NOT NULL COMMENT '1 Muestra el mensaje\\n2 Confirma la compra',
  `id_cliente_envia` int NOT NULL,
  `id_cliente_recibe` int NOT NULL,
  `envia` tinyint(1) NOT NULL COMMENT '1 Envia cliente que solicita receta\\n2 Envia operador (cliente operador)',
  `tipo` tinyint(1) NOT NULL COMMENT '1 Texto\n2 Presupuesto',
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 En servidor\n2 Entregado\n3 Leido',
  `mensaje` varchar(1200) NOT NULL,
  `valor` varchar(250) NOT NULL DEFAULT '',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_entregado` datetime DEFAULT NULL,
  `fecha_leido` datetime DEFAULT NULL,
  PRIMARY KEY (`id_chat`),
  KEY `fk_chat_compra_idx` (`id_compra`),
  CONSTRAINT `fk_chat_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=508579 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_chat`
--

/*!40000 ALTER TABLE `compra_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_chat` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `chat_BEFORE_INSERT` BEFORE INSERT ON `compra_chat` FOR EACH ROW BEGIN
	UPDATE `delivery`.`compra` SET `chats` = chats + 1 WHERE (`id_compra` = NEW.id_compra);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `compra_estado`
--

DROP TABLE IF EXISTS `compra_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_estado` (
  `id_compra_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_compra_estado`),
  KEY `fk_compra_estado__clienteRegistro_idx` (`id_registro`),
  KEY `fk_compra_estado__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_compra_estado__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_compra_estado__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_estado`
--

/*!40000 ALTER TABLE `compra_estado` DISABLE KEYS */;
INSERT INTO `compra_estado` VALUES (1,'Iniciada',0,100000,NULL,'2020-01-24 17:36:25','2020-01-24 17:36:25'),(2,'Consultando',0,100000,NULL,'2020-01-24 17:36:25','2020-01-24 17:36:25'),(3,'Comprada',0,100000,NULL,'2020-01-24 17:36:25','2020-01-24 17:36:25'),(4,'Despachado',0,100000,NULL,'2020-02-11 12:18:47','2020-02-15 20:48:45'),(100,'Cancelada',0,100000,NULL,'2020-01-24 17:36:26','2020-02-15 20:10:30'),(200,'Entregada',0,100000,NULL,'2020-01-24 17:36:25','2020-02-15 20:48:22');
/*!40000 ALTER TABLE `compra_estado` ENABLE KEYS */;

--
-- Table structure for table `compra_promocion`
--

DROP TABLE IF EXISTS `compra_promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_promocion` (
  `id_compra` bigint unsigned NOT NULL,
  `id_promocion` int unsigned NOT NULL,
  `incentivo` varchar(25) NOT NULL,
  `producto` varchar(150) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `precio` double(10,2) NOT NULL,
  `cantidad` tinyint(1) NOT NULL,
  `total` double(10,2) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_compra`,`id_promocion`),
  KEY `fk_compra_promocion__promocion_idx` (`id_promocion`),
  CONSTRAINT `fk_compra_promocion__compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_compra_promocion__promocion` FOREIGN KEY (`id_promocion`) REFERENCES `promocion` (`id_promocion`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_promocion`
--

/*!40000 ALTER TABLE `compra_promocion` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_promocion` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `compra_promocion_AFTER_INSERT` AFTER INSERT ON `compra_promocion` FOR EACH ROW BEGIN
	UPDATE `delivery`.`promocion` SET `ventas` = ventas + NEW.cantidad WHERE (`id_promocion` = NEW.id_promocion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `despacho`
--

DROP TABLE IF EXISTS `despacho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despacho` (
  `id_despacho` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '1 Producto normal,\\n2 Publicidad,\\n3 Compra,\\n4 Encomienda.\\n',
  `id_aplicativo` int NOT NULL,
  `id_compra` bigint unsigned DEFAULT NULL COMMENT 'Se usa para delivery',
  `id_promocion` int unsigned DEFAULT NULL COMMENT 'Se usa para trueque, es el id de la promocion que se selecciona, debe ser unico con el id_cliente que es el propietario de la promoción',
  `id_trueque` int NOT NULL DEFAULT '0' COMMENT 'Es la promocion que del cliente esta es con la que desea intercambiar, si es cero usara efectivo o producto no creado',
  `id_cliente` int DEFAULT NULL,
  `id_conductor` int DEFAULT NULL,
  `fecha` date NOT NULL,
  `anio` year NOT NULL,
  `mes` tinyint(1) NOT NULL,
  `tipo` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '1 Producto normal,\\n2 Publicidad,\\n3 Compra,\\n4 Encomienda.\\n',
  `id_cancelo` int DEFAULT NULL,
  `id_finalizo` int DEFAULT NULL COMMENT 'Se usa en trueque para saber quien es quien finalizo el trato. ',
  `id_despacho_estado` int NOT NULL,
  `id_chat` bigint unsigned DEFAULT NULL COMMENT 'Chat con el que se acuerda la despacho',
  `costo` double(10,2) DEFAULT NULL,
  `costo_entrega` double(10,2) DEFAULT NULL,
  `ltA` double(10,5) NOT NULL,
  `lgA` double(10,5) NOT NULL,
  `ltB` double(10,5) NOT NULL,
  `lgB` double(10,5) NOT NULL,
  `despacho` json NOT NULL,
  `ruta` json DEFAULT NULL,
  `sinLeerConductor` tinyint NOT NULL DEFAULT '0',
  `sinLeerCliente` tinyint NOT NULL DEFAULT '0',
  `calificarCliente` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Se considera en el chat del cliente\n0 No se pide calificar\\\\n1 Se pide calificar\\\\n2 Ya se califico\n',
  `calificarConductor` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Se considera en el chat del conductor\n0 No se pide calificar\\\\n1 Se pide calificar\\\\n2 Ya se califico',
  `calificacionCliente` double(2,1) DEFAULT '0.0' COMMENT 'Calificacion que dio el cliente al conductor',
  `calificacionConductor` double(2,1) DEFAULT '0.0' COMMENT 'Calificacion que dio el conductor al cliente',
  `comentarioCliente` varchar(180) DEFAULT NULL,
  `comentarioConductor` varchar(180) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_iniciado` datetime DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL COMMENT 'Fecha que el conductor pago al local',
  `fecha_referencia` datetime DEFAULT NULL,
  `fecha_califico_conductor` datetime DEFAULT NULL,
  `fecha_califico_cliente` datetime DEFAULT NULL,
  `fecha_cancelo` datetime DEFAULT NULL,
  `chats` smallint unsigned NOT NULL DEFAULT '0',
  `meta` json NOT NULL,
  `preparandose` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_confirmo_preparandose` datetime DEFAULT NULL,
  `llegada` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_confirmo_llegada` datetime DEFAULT NULL,
  `fecha_reverso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_despacho`),
  KEY `fk_despacho__despacho_estado_idx` (`id_despacho_estado`),
  KEY `fk_despacho__cliente_idx` (`id_cliente`),
  KEY `fk_despacho__conductor_idx` (`id_conductor`),
  KEY `fk_despacho__chat_idx` (`id_chat`),
  KEY `fk_despacho__aplicativo_idx` (`id_aplicativo`),
  KEY `index_anio_mes` (`anio`,`mes`,`fecha`) /*!80000 INVISIBLE */,
  KEY `index_fecha` (`fecha`),
  KEY `fk_despacho_compra` (`id_compra`),
  CONSTRAINT `fk_despacho__aplicativo` FOREIGN KEY (`id_aplicativo`) REFERENCES `aplicativo` (`id_aplicativo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_despacho__chat` FOREIGN KEY (`id_chat`) REFERENCES `compra_chat` (`id_chat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_despacho__cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_despacho__conductor` FOREIGN KEY (`id_conductor`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_despacho__despacho_estado` FOREIGN KEY (`id_despacho_estado`) REFERENCES `despacho_estado` (`id_despacho_estado`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_despacho_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=299853 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despacho`
--

/*!40000 ALTER TABLE `despacho` DISABLE KEYS */;
/*!40000 ALTER TABLE `despacho` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `despacho_AFTER_INSERT` AFTER INSERT ON `despacho` FOR EACH ROW BEGIN
	UPDATE `delivery`.`compra` SET `id_despacho` = NEW.id_despacho WHERE (`id_compra` = NEW.id_compra);
    UPDATE `delivery`.`cliente` SET `fecha_ultima` = NOW() WHERE `id_cliente` = NEW.id_cliente;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `despacho_BEFORE_UPDATE` BEFORE UPDATE ON `despacho` FOR EACH ROW BEGIN
	
    DECLARE _descuento DOUBLE;
    
    IF (OLD.id_despacho_estado = 1 AND NEW.id_despacho_estado = 2)THEN
		UPDATE `delivery`.`compra` SET `id_compra_estado` = 4, `fecha_despachado` = NOW(), id_despacho = NEW.id_despacho, id_conductor = NEW.id_conductor WHERE (`id_compra` = NEW.id_compra);
        INSERT INTO `delivery`.`asignado` (`id_conductor`, `asignados`) VALUES (NEW.id_conductor, 1) ON DUPLICATE KEY UPDATE asignados = asignados + 1, fecha_asignado = CURTIME();
    
		SELECT ROUND((s.importe * d.costo_entrega / 100 ), 2)  INTO _descuento 
        FROM delivery.saldo s, delivery.despacho d 
		WHERE d.id_despacho = OLD.id_despacho AND s.id_cliente = NEW.id_conductor;

		INSERT INTO `delivery`.`saldo` (`id_cliente`, `saldo`) 
		VALUES (NEW.id_conductor, IFNULL(_descuento, 0.0)) ON DUPLICATE KEY UPDATE saldo = (saldo - IFNULL(_descuento, 0.0));
        
        INSERT INTO `delivery_register`.`descuento` (`id_conductor`, `id_despacho`, `descuento`, `costo`, `costo_entrega`) 
        VALUES (NEW.id_conductor, NEW.id_despacho, IFNULL(_descuento, 0.0), NEW.costo, NEW.costo_entrega);
        
		UPDATE `delivery`.`cliente` SET `confirmados` = confirmados + 1, `registros` = registros + 1
		WHERE `id_cliente` = NEW.id_conductor LIMIT 1;
        
		UPDATE `delivery`.`cliente` SET `fecha_ultima` = NOW() WHERE `id_cliente` = NEW.id_conductor;
    END IF;
	
    IF (OLD.id_despacho_estado = 2 AND NEW.id_despacho_estado = 3)THEN
		UPDATE `delivery`.`asignado` SET recogido = recogido + 1 WHERE id_conductor = NEW.id_conductor;
    END IF;
    
	IF (OLD.id_despacho_estado = 3 AND NEW.id_despacho_estado = 4)THEN
		UPDATE `delivery`.`asignado` SET entregado = entregado + 1 WHERE id_conductor = NEW.id_conductor;
        
		UPDATE `delivery`.`cliente` SET `correctos` = correctos + 1
		WHERE `id_cliente` = NEW.id_conductor LIMIT 1;
    END IF;
    
	IF (OLD.id_despacho_estado != 100 AND NEW.id_despacho_estado = 100)THEN
		UPDATE `delivery`.`asignado` SET cancelada = cancelada + 1 WHERE id_conductor = NEW.id_conductor;
        
		UPDATE `delivery`.`cliente` SET `canceladas` = canceladas + 1
		WHERE `id_cliente` = NEW.id_conductor LIMIT 1;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `despacho_chat`
--

DROP TABLE IF EXISTS `despacho_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despacho_chat` (
  `id_chat` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_despacho` bigint unsigned NOT NULL,
  `id_despacho_estado` int NOT NULL COMMENT '1 Muestra el mensaje\\n2 Confirma la despacho',
  `id_cliente_envia` int NOT NULL,
  `id_cliente_recibe` int NOT NULL,
  `envia` tinyint(1) NOT NULL COMMENT '1 Envia cliente que solicita receta\\n2 Envia operador (cliente operador)',
  `tipo` tinyint(1) NOT NULL COMMENT '1 Texto\n2 Presupuesto',
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 En servidor\n2 Entregado\n3 Leido',
  `mensaje` varchar(1200) NOT NULL,
  `valor` varchar(250) NOT NULL DEFAULT '',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_entregado` datetime DEFAULT NULL,
  `fecha_leido` datetime DEFAULT NULL,
  PRIMARY KEY (`id_chat`),
  KEY `fk_chat_despacho_idx` (`id_despacho`),
  CONSTRAINT `fk_chat_despacho` FOREIGN KEY (`id_despacho`) REFERENCES `despacho` (`id_despacho`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=461603 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despacho_chat`
--

/*!40000 ALTER TABLE `despacho_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `despacho_chat` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `despacho_chat_BEFORE_INSERT` BEFORE INSERT ON `despacho_chat` FOR EACH ROW BEGIN
	UPDATE `delivery`.`despacho` SET `chats` = chats + 1 WHERE (`id_despacho` = NEW.id_despacho);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `despacho_estado`
--

DROP TABLE IF EXISTS `despacho_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despacho_estado` (
  `id_despacho_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_despacho_estado`),
  KEY `fk_despacho_estado__clienteRegistro_idx` (`id_registro`),
  KEY `fk_despacho_estado__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_despacho_estado__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_despacho_estado__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despacho_estado`
--

/*!40000 ALTER TABLE `despacho_estado` DISABLE KEYS */;
INSERT INTO `despacho_estado` VALUES (1,'Procesando',0,100000,NULL,'2020-01-24 17:30:13','2020-02-21 17:05:05'),(2,'Viajando',0,100000,NULL,'2020-02-09 19:07:30','2020-02-21 17:05:05'),(3,'Recogido',0,100000,NULL,'2020-02-13 02:31:02','2020-02-13 02:31:02'),(4,'Entregado',0,100000,NULL,'2020-02-13 14:06:38','2020-02-13 14:06:38'),(100,'Cancelada',0,100000,NULL,'2020-02-15 20:12:30','2020-02-15 20:12:30');
/*!40000 ALTER TABLE `despacho_estado` ENABLE KEYS */;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_urbe` int DEFAULT NULL,
  `alias` varchar(45) NOT NULL,
  `referencia` varchar(125) NOT NULL,
  `img` varchar(75) NOT NULL DEFAULT 'S/N',
  `lt` double(10,6) NOT NULL,
  `lg` double(10,6) NOT NULL,
  `eliminada` tinyint(1) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int DEFAULT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `orden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_direccion`),
  KEY `fk_direccion__clienteRegistro_idx` (`id_registro`),
  KEY `fk_direccion__clienteActualizo_idx` (`id_actualizo`),
  KEY `fk_direccion_urbe_idx` (`id_urbe`),
  CONSTRAINT `fk_direccion__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_direccion__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_direccion_urbe` FOREIGN KEY (`id_urbe`) REFERENCES `urbe` (`id_urbe`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,233302,1,'Casa','10 56','delivery-server-b99ff.appspot.com/o/cr%2Fdir%2F233302-1624197339059.jpg',-4.007891,-79.211277,0,1,NULL,NULL,'2021-06-20 13:55:40','2021-06-20 13:55:40',0),(2,233311,1,'Casa','Casa','delivery-server-b99ff.appspot.com/o/cr%2Fdir%2F233311-1624328993250.jpg',-4.004198,-79.209065,0,1,NULL,NULL,'2021-06-22 02:29:54','2021-06-22 02:29:54',0),(3,233159,1,'Casa','Casa','delivery-server-b99ff.appspot.com/o/cr%2Fdir%2F233159-1624329834889.jpg',-3.960342,-79.206844,0,1,NULL,NULL,'2021-06-22 02:43:56','2021-06-22 02:43:56',0),(4,233312,1,'Cada','Vasa','delivery-server-b99ff.appspot.com/o/cr%2Fdir%2F233312-1624330063665.jpg',-4.004143,-79.209112,0,1,NULL,NULL,'2021-06-22 02:47:45','2021-06-22 02:47:45',0),(5,233313,1,'Condominios','30136','delivery-server-b99ff.appspot.com/o/cr%2Fdir%2F233313-1624330412972.jpg',-4.011810,-79.215748,0,1,NULL,NULL,'2021-06-22 02:53:34','2021-06-22 02:53:34',0),(6,233315,1,'Casa','Casa verde','delivery-server-b99ff.appspot.com/o/cr%2Fdir%2F233315-1624371264234.jpg',39.678456,-104.970227,0,1,NULL,NULL,'2021-06-22 14:14:25','2021-06-22 14:14:25',0),(7,233316,1,'Depto','5to piso','delivery-server-b99ff.appspot.com/o/cr%2Fdir%2F233316-1624375378065.jpg',-25.528878,-56.565733,0,1,NULL,NULL,'2021-06-22 15:22:59','2021-06-22 15:22:59',0),(8,233317,1,'Depto','Casa de 2 pisos ','delivery-server-b99ff.appspot.com/o/cr%2Fdir%2F233317-1624404970308.jpg',-25.784249,-56.450818,0,1,NULL,NULL,'2021-06-22 23:36:11','2021-06-22 23:36:11',0);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `direccion_AFTER_INSERT` AFTER INSERT ON `direccion` FOR EACH ROW BEGIN
	UPDATE `delivery`.`cliente` SET `direcciones` = direcciones + 1, id_urbe = NEW.id_urbe WHERE (`id_cliente` = NEW.id_cliente);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `direccion_AFTER_UPDATE` AFTER UPDATE ON `direccion` FOR EACH ROW BEGIN
	IF NEW.eliminada = 1 AND OLD.eliminada = 0 THEN
		UPDATE `delivery`.`cliente` SET `direcciones` = direcciones - 1 WHERE (`id_cliente` = OLD.id_cliente);
	END IF;
    UPDATE `delivery`.`cliente` SET id_urbe = NEW.id_urbe WHERE (`id_cliente` = NEW.id_cliente);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `dni` varchar(45) NOT NULL,
  `nombres` varchar(125) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `direccion` varchar(255) NOT NULL DEFAULT 'S/N',
  `correo` varchar(75) NOT NULL,
  `eliminada` tinyint(1) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int DEFAULT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `orden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_factura`),
  KEY `fk_factura__clienteRegistro_idx` (`id_registro`),
  KEY `fk_factura__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_factura__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_factura__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,233298,'345345345345','delivery Opportunity','345345345','Loja','delivery.3561@gmail.com',1,1,NULL,NULL,'2021-06-10 16:54:56','2021-06-10 17:03:48',1),(2,233298,'456456456456','delivery Opportunity','345345345','Ecuador','delivery.3561@gmail.com',0,1,NULL,NULL,'2021-06-10 16:55:06','2021-06-10 17:03:48',2),(3,233167,'110852752','Marjorie Ordeñez','+593969901641','Loha','juanpa.desert@gmail.com',0,1,NULL,NULL,'2021-06-18 01:48:52','2021-06-18 01:48:52',0),(4,233159,'8734658376459876','Juan Pablo','+593969901642','Loja','moto@gmail.com',0,1,NULL,NULL,'2021-06-18 03:15:42','2021-06-18 03:15:42',0),(5,233302,'87346586345','Juan Pablo','+593969901641','Loja','juanpa.desert@gmail.com',0,1,NULL,NULL,'2021-06-20 13:56:14','2021-06-20 13:56:14',0),(6,233315,'12345678','Moto Madrid','+593969400012','Depto','moto2552@gmail.com',0,1,NULL,NULL,'2021-06-22 14:15:01','2021-06-22 14:15:01',0);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pago` (
  `id_forma_pago` int NOT NULL,
  `forma_pago` varchar(45) NOT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
INSERT INTO `forma_pago` VALUES (10,'EFECTIVO'),(23,'TARJETA'),(36,'CUPÓN'),(41,'PAGO');
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;

--
-- Table structure for table `gift`
--

DROP TABLE IF EXISTS `gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gift` (
  `id_gift` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) NOT NULL,
  `id_agencia` int NOT NULL,
  `saludo` varchar(500) NOT NULL,
  `cupon` double(10,2) NOT NULL,
  `mensaje` varchar(300) NOT NULL COMMENT 'Mensaje de error cuando el cupón es valido para otra agencia no seleccionada en el carrito',
  `terminos` varchar(300) NOT NULL DEFAULT 'Si el valor de tu compra supera el valor del GIFT deberás cancelar la diferencia en efectivo.',
  `token` varchar(125) NOT NULL COMMENT 'Usamos para poner la imagen del Cupón. ',
  `holder_name` varchar(20) NOT NULL COMMENT 'Se ve en columna tabla Productos',
  `number` varchar(45) NOT NULL COMMENT 'Pizza House',
  `canejada` tinyint(1) NOT NULL DEFAULT '0',
  `id_cliente_canjeo` int DEFAULT NULL,
  `fecha_canjeada` datetime DEFAULT NULL,
  PRIMARY KEY (`id_gift`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=1030 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift`
--

/*!40000 ALTER TABLE `gift` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gift_AFTER_UPDATE` AFTER UPDATE ON `gift` FOR EACH ROW BEGIN
	IF (OLD.canejada = 0 AND NEW.canejada = 1) THEN
		INSERT INTO `delivery_rubro`.`cupon` 
		(`id_gift`, `codigo`, `id_cliente`, `id_agencia`, `saludo`, `cupon`, `token`, `holder_name`, `number`, `mensaje`, `terminos`) 
		VALUES (NEW.id_gift, NEW.codigo, NEW.id_cliente_canjeo, NEW.id_agencia, NEW.saludo, NEW.cupon, NEW.token, NEW.holder_name, NEW.`number`, NEW.mensaje, NEW.terminos);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hashtag`
--

DROP TABLE IF EXISTS `hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtag` (
  `id_hashtag` int unsigned NOT NULL AUTO_INCREMENT,
  `id_agencia` int NOT NULL DEFAULT '-1',
  `inversion` double(10,2) NOT NULL,
  `canjes` int NOT NULL DEFAULT '0' COMMENT 'Cuando el cliente lo canjea desde el APP',
  `descontados` int NOT NULL DEFAULT '0' COMMENT 'Cuando el cliente compra y se descuenta del monto',
  `monto` double(10,2) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '0',
  `hashtag` varchar(20) DEFAULT NULL,
  `promocion` double(10,2) NOT NULL,
  `mIzquierda` varchar(45) NOT NULL,
  `mBotonDerechaError` varchar(45) NOT NULL,
  `mBotonDerechaCaduco` varchar(45) DEFAULT NULL,
  `error` varchar(155) NOT NULL,
  `caduco` varchar(155) DEFAULT NULL,
  `url` varchar(225) NOT NULL,
  PRIMARY KEY (`id_hashtag`),
  UNIQUE KEY `hashtag_UNIQUE` (`hashtag`)
) ENGINE=InnoDB AUTO_INCREMENT=954272 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='id_hashtag, id_agencia, estado, promocion, mBotonDerecha, mIzquierda,error,url';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
INSERT INTO `hashtag` VALUES (1001,-1,0.00,0,0,100.00,0,'OpportunityCool',100.00,'CANCELAR','VER MENU','SEGUIR','','El hashtag a caducado, síguenos en redes sociales para estar al tanto de los Hashtag promocionales. ','https://www.facebook.com/opportunity.planck');
/*!40000 ALTER TABLE `hashtag` ENABLE KEYS */;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL,
  `tipo` tinyint(1) NOT NULL,
  `pago` varchar(45) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pago`),
  KEY `fk_pago__clienteRegistro_idx` (`id_registro`),
  KEY `fk_pago__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_pago__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pago__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,1,'Descuento a saldo',1,100000,NULL,'2020-06-01 04:47:27','2020-06-01 04:47:27'),(2,2,'Acredita credito producto',1,100000,NULL,'2020-06-30 06:15:31','2020-06-30 06:15:31'),(3,3,'Acredita credito codigo',1,100000,NULL,'2020-07-09 05:41:27','2020-07-09 05:41:27'),(4,4,'Acredita credito saldo',1,100000,NULL,'2020-07-09 05:42:52','2020-07-09 05:42:52');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;

--
-- Table structure for table `plataforma`
--

DROP TABLE IF EXISTS `plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataforma` (
  `id_plataforma` int NOT NULL,
  `plataforma` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_plataforma`),
  KEY `fk_plataforma__clienteRegistro_idx` (`id_registro`),
  KEY `fk_plataforma__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_plataforma__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_plataforma__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma`
--

/*!40000 ALTER TABLE `plataforma` DISABLE KEYS */;
INSERT INTO `plataforma` VALUES (1,'ANDROID',0,100000,NULL,'2020-01-24 17:26:14','2020-01-24 17:26:14'),(2,'iOS',0,100000,NULL,'2020-01-24 17:26:29','2020-01-24 17:26:29'),(932418999,'WEB',0,100000,NULL,'2020-07-25 15:30:07','2020-07-25 15:39:17');
/*!40000 ALTER TABLE `plataforma` ENABLE KEYS */;

--
-- Table structure for table `preferencia`
--

DROP TABLE IF EXISTS `preferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferencia` (
  `id_preferencia` int NOT NULL AUTO_INCREMENT,
  `preferencia` varchar(45) NOT NULL,
  `codigo` varchar(5) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_preferencia`),
  KEY `fk_preferencia__clienteRegistro_idx` (`id_registro`),
  KEY `fk_preferencia__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_preferencia__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_preferencia__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferencia`
--

/*!40000 ALTER TABLE `preferencia` DISABLE KEYS */;
INSERT INTO `preferencia` VALUES (1,'Mensajes predeterminados','P0001',1,100000,NULL,'2020-01-25 13:41:01','2020-01-25 13:41:01'),(2,'Menu','P0002',1,100000,NULL,'2020-02-29 15:15:06','2020-02-29 15:15:06'),(3,'TARJETA','T0001',1,100000,NULL,'2020-09-23 00:09:33','2020-09-23 00:09:33'),(4,'TARJETA vs 351','T0002',1,100000,NULL,'2020-09-23 00:09:33','2020-09-23 00:09:33');
/*!40000 ALTER TABLE `preferencia` ENABLE KEYS */;

--
-- Table structure for table `preferencia_aplicativo`
--

DROP TABLE IF EXISTS `preferencia_aplicativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferencia_aplicativo` (
  `id_preferencia` int NOT NULL,
  `id_aplicativo` int NOT NULL,
  `configuracion` json NOT NULL,
  `min_vs` varchar(45) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_preferencia`,`id_aplicativo`),
  KEY `fk_preferencia_aplicativo__aplicativo_idx` (`id_aplicativo`),
  KEY `fk_preferencia_aplicativo__preferenciaRegistro_idx` (`id_registro`),
  KEY `fk_preferencia_aplicativo__preferenciaActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_preferencia_aplicativo__aplicativo` FOREIGN KEY (`id_aplicativo`) REFERENCES `aplicativo` (`id_aplicativo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_preferencia_aplicativo__preferencia` FOREIGN KEY (`id_preferencia`) REFERENCES `preferencia` (`id_preferencia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_preferencia_aplicativo__preferenciaActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_preferencia_aplicativo__preferenciaRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferencia_aplicativo`
--

/*!40000 ALTER TABLE `preferencia_aplicativo` DISABLE KEYS */;
INSERT INTO `preferencia_aplicativo` VALUES (1,1000001,'[{\"m\": \"Deseas algun otro producto mas antes de enviar el presupuesto?\"}, {\"m\": \"Agradecemos tu confianza\"}]','0',1,100000,NULL,'2020-01-25 13:55:25','2020-01-25 15:37:29'),(3,1000001,'[{\"e\": 0, \"m\": \"Para agregar una tarjeta de crédito o débito por favor actualiza el APP..\"}]','0',1,100000,NULL,'2020-09-23 00:10:40','2020-10-06 00:56:14'),(4,1000001,'[{\"e\": 1, \"m\": \"Muy pronto podrás pagar con tus tarjetas favoritas.\\n\\nSíguenos en redes sociales para no perderte nuestros famosos #hashtag promocionales.\"}]','0',1,100000,NULL,'2020-09-23 00:10:40','2020-10-05 16:02:46');
/*!40000 ALTER TABLE `preferencia_aplicativo` ENABLE KEYS */;

--
-- Table structure for table `promocion`
--

DROP TABLE IF EXISTS `promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocion` (
  `id_promocion` int unsigned NOT NULL AUTO_INCREMENT,
  `id_agencia` int NOT NULL,
  `id_urbe` int NOT NULL DEFAULT '1',
  `tipo` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 Producto normal,\n2 Publicidad,\n3 Compra,\n4 Encomienda.\n',
  `producto` varchar(150) NOT NULL DEFAULT '',
  `incentivo` varchar(150) NOT NULL DEFAULT '',
  `descripcion` varchar(400) NOT NULL DEFAULT '',
  `productos` json DEFAULT NULL,
  `promocion` tinyint NOT NULL DEFAULT '0' COMMENT '1 Se muestra como promoción\n0 No se muestra como promoción.',
  `activo` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `aprobado` tinyint(1) NOT NULL DEFAULT '1',
  `destacado` tinyint(1) DEFAULT '0' COMMENT 'Solo si el producto esta destacado se envía en productos al app. (No es el recurso del menú)',
  `precio` double(10,2) NOT NULL DEFAULT '0.00',
  `imagen` varchar(500) NOT NULL DEFAULT '',
  `minimo` tinyint unsigned NOT NULL DEFAULT '1',
  `maximo` tinyint unsigned NOT NULL DEFAULT '20',
  `inventario` int NOT NULL DEFAULT '1000',
  `ventas` int unsigned NOT NULL DEFAULT '0',
  `orden` smallint NOT NULL DEFAULT '200',
  `criterio` varchar(100) NOT NULL DEFAULT '',
  `link` varchar(125) NOT NULL DEFAULT '',
  `id_registro` int NOT NULL DEFAULT '100000',
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shares` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_promocion`),
  KEY `fk_promocion__clienteRegistro_idx` (`id_registro`),
  KEY `fk_promocion__clienteActualizo_idx` (`id_actualizo`),
  KEY `fk_promocion__urbe_idx` (`id_urbe`),
  KEY `fk_promocion__agencia_idx` (`id_agencia`),
  FULLTEXT KEY `criterio` (`criterio`),
  CONSTRAINT `fk_promocion__agencia` FOREIGN KEY (`id_agencia`) REFERENCES `agencia` (`id_agencia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_promocion__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_promocion__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_promocion__urbe` FOREIGN KEY (`id_urbe`) REFERENCES `urbe` (`id_urbe`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4095 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion`
--

/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
INSERT INTO `promocion` VALUES (1,3,1,1,'Encebollado','','Encebollado simple',NULL,0,1,1,1,0,3.00,'delivery-server-b99ff.appspot.com/o/cr%2Fpr%2F1-1623979493019.jpg',1,20,875,775,200,'Encebollado','',100000,100000,'2020-03-19 00:04:02','2021-06-18 01:24:54',0),(2,3,1,1,'Encebollado  doble','','Encebollado doble pescado',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F2-1597348465211.jpg',1,20,983,64,200,'Encebollado  doble','',100000,100000,'2020-03-19 00:12:09','2021-06-04 13:08:17',0),(3,3,1,1,'Guatita','','Guatita + arroz  ',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F3-1597348479996.jpg',1,20,0,98,200,'Guatita','',100000,100000,'2020-03-19 00:17:04','2021-06-04 13:08:17',0),(4,3,1,1,'Mixta con encebollado','','Guatita + arroz  + pescado ','{\"lP\": [{\"d\": \"Mixta con pescado\", \"p\": \"5.0\", \"id\": \"0\"}, {\"d\": \"Mixta con carne \", \"p\": \"5.0\", \"id\": \"1\"}]}',0,1,1,1,0,4.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F4-1597348489808.jpg',1,20,0,22,200,'Mixta con encebollado','',100000,100000,'2020-03-19 00:19:54','2021-06-22 15:38:11',0),(12,7,1,1,'1/8 pollo asado','','Incluye: consomé, arroz, papas, ensalada. ',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F12-1597348541953.jpg',1,20,58,45,200,'1/8 pollo asado','',100000,100000,'2020-03-19 00:48:20','2021-06-22 23:54:05',0),(13,7,1,1,'Cuarto de pollo','','+ consomé, arroz, papas, ensalada',NULL,0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F13-1597348550371.jpg',1,20,82,114,200,'Cuarto de pollo','',100000,100000,'2020-03-19 01:05:28','2021-06-22 23:54:05',1),(14,7,1,1,'Medio pollo asado','','Incluye consomé, arroz, papas, ensalada',NULL,0,1,1,1,0,7.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F14-1597348560939.jpg',1,20,59,122,200,'Medio pollo asado','',100000,100000,'2020-03-19 01:06:43','2021-06-22 03:49:27',0),(15,7,1,1,'Pollo entero asado ','','+ consomé, arroz, papas, ensalada',NULL,0,1,1,1,0,15.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F15-1597348597833.jpg',1,20,55,107,200,'Pollo entero asado ','',100000,100000,'2020-03-19 01:08:36','2021-06-22 03:49:27',0),(16,7,1,1,'Refresco','','coco o fresa',NULL,0,1,1,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F16-1597348615171.jpg',1,20,993,37,200,'Refresco','',100000,100000,'2020-03-19 01:11:53','2021-06-04 13:08:17',0),(17,7,1,1,'Cola 1l','','Varios sabores',NULL,0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F17-1597348624397.jpg',1,20,9977,23,200,'Cola 1l','',100000,100000,'2020-03-19 01:12:46','2021-06-04 13:08:17',0),(18,7,1,1,'Cola 2l','','Varios sabores',NULL,0,1,1,1,0,2.60,'delivery-0001.appspot.com/o/rv%2Fpr%2F18-1597348632419.jpg',1,20,94,21,200,'Cola 2l','',100000,100000,'2020-03-19 01:14:56','2021-06-04 13:08:17',0),(49,9,1,1,'Octavo de pollo','','1/8 de pollo asado + arroz + papas fritas + consomé + bebida','{\"lP\": [{\"d\": \"Promo dia de la mujer\", \"p\": \"10.0\", \"id\": \"0\"}]}',0,1,1,1,0,2.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F49-1599024026590.jpg',1,20,995,0,200,'Octavo de pollo','',100000,100000,'2020-03-19 04:26:19','2021-06-04 13:08:17',0),(50,9,1,1,'1/4 de pollo asado','','1/4 de pollo asado + arroz + papas fritas + consomé',NULL,0,1,1,1,0,3.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F50-1599024037893.jpg',1,20,995,8,200,'1/4 de pollo asado','',100000,100000,'2020-03-19 04:28:44','2021-06-04 13:08:17',0),(51,9,1,1,'Medio pollo asado ','','1/2 pollo asado + arroz + papas fritas + consomé',NULL,0,1,1,1,0,7.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F51-1599024048900.jpg',1,20,973,27,200,'Medio pollo asado ','',100000,100000,'2020-03-19 04:33:23','2021-06-04 13:08:17',0),(52,9,1,1,'Pollo entero','','pollo asado + arroz + papas fritas + consomé+cola y todas las salsas',NULL,0,1,1,1,0,14.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F52-1599024061227.jpg',1,20,987,7,200,'Pollo entero','',100000,100000,'2020-03-19 04:34:32','2021-06-04 13:08:17',0),(53,9,1,1,'Salchipapa','',' Papas fritas + salchicha + salsas ',NULL,0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F53-1599024070533.jpg',1,20,987,2,200,'Salchipapa','',100000,100000,'2020-03-19 04:35:35','2021-06-04 13:08:17',0),(54,9,1,1,'Gaseosa 1.5 l','','Sabores: pepsi, tropical, 7 up, manzana, gallito','{\"lP\": [{\"d\": \"Manzana y Tropical Personal Descartable \", \"p\": \"0.5\", \"id\": \"0\"}, {\"d\": \"Pepsi y 7 up personal descartable\", \"p\": \"0.75\", \"id\": \"1\"}, {\"d\": \"1litro\", \"p\": \"1.0\", \"id\": \"2\"}, {\"d\": \"2litros\", \"p\": \"2.0\", \"id\": \"3\"}]}',0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/op%2Fpr%2F54-1615156373264.jpg',1,20,100,1,200,'Gaseosa 1.5 l','',100000,100000,'2020-03-19 04:36:33','2021-06-04 13:08:17',0),(78,12,1,1,'Bebidas sin alcohol','','Agua, Jugos, gaseosas, colas',NULL,0,0,0,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F78-1597349170449.jpg',1,20,994,1,200,'Bebidas sin alcohol','',100000,100000,'2020-03-21 20:17:02','2021-06-04 13:08:17',0),(79,12,1,1,'Aseo del hogar','','Detergente, cloro, jabón, desinfectante',NULL,0,0,0,1,0,1.45,'delivery-0001.appspot.com/o/rv%2Fpr%2F79-1597349214807.jpg',1,20,994,2,200,'Aseo del hogar','',100000,100000,'2020-03-21 20:18:11','2021-06-04 13:08:17',0),(80,12,1,1,'Granos secos','','Arveja, lenteja, leguminosas varias',NULL,0,0,0,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F80-1597349272091.jpg',1,20,986,0,200,'Granos secos','',100000,100000,'2020-03-21 20:19:16','2021-06-04 13:08:17',0),(81,12,1,1,'Snacks','','Papitas, rufles, doritos, cheetos, chifles',NULL,0,0,0,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F81-1597349299807.jpg',1,20,986,0,200,'Snacks','',100000,100000,'2020-03-21 20:20:26','2021-06-04 13:08:17',0),(82,12,1,1,'Electrodomésticos','','Cocina, refrigerador, televisor, radio, licuadora',NULL,0,0,0,1,0,150.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F82-1597349344478.jpg',1,20,984,1,200,'Electrodomésticos','',100000,100000,'2020-03-21 20:21:23','2021-06-04 13:08:17',0),(83,12,1,1,'Panadería','','Pan de sal, pan de dulce, varios',NULL,0,0,0,1,0,2.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F83-1597349370517.jpg',1,20,974,0,200,'Panadería','',100000,100000,'2020-03-21 20:24:08','2021-06-04 13:08:17',0),(84,12,1,1,'Azucar','','Azucar  libra, azúcar  kilo, azúcar 2 kilos',NULL,0,0,0,1,0,0.35,'delivery-0001.appspot.com/o/rv%2Fpr%2F84-1597349424603.jpg',1,20,993,0,200,'Azucar','',100000,100000,'2020-03-21 20:26:02','2021-06-04 13:08:17',0),(86,12,1,1,'Pastas y fideos','','Pasta, fideos, spaghetti',NULL,0,0,0,1,0,12.90,'delivery-0001.appspot.com/o/rv%2Fpr%2F86-1597349468563.jpg',1,20,17,2,200,'Pastas y fideos','',100000,100000,'2020-03-21 22:31:38','2021-06-04 13:08:17',0),(87,12,1,1,'Panela malacatos','','',NULL,0,1,1,1,0,0.40,'delivery-0001.appspot.com/o/rv%2Fpr%2F87-1597349718112.jpg',1,20,927,7,200,'Panela malacatos','',100000,100000,'2020-03-21 22:37:37','2021-06-04 13:08:17',0),(88,12,1,1,'Gelatina royal 200 gr','','',NULL,0,1,1,1,0,2.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F88-1597349779401.jpg',1,20,998,0,200,'Gelatina royal 200 gr','',100000,100000,'2020-03-21 22:39:06','2021-06-04 13:08:17',0),(89,12,1,1,'Colgate anticaries 60ml','','',NULL,0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F89-1597349835573.jpg',1,20,997,0,200,'Colgate anticaries 60ml','',100000,100000,'2020-03-21 22:40:43','2021-06-04 13:08:17',0),(90,12,1,1,'Yogurt toni 950 gr natural','','',NULL,0,1,1,1,0,3.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F90-1597349865140.jpg',1,20,997,0,200,'Yogurt toni 950 gr natural','',100000,100000,'2020-03-21 22:41:52','2021-06-04 13:08:17',0),(91,12,1,1,'Froot lops 370 gr','','',NULL,0,1,1,1,0,6.20,'delivery-0001.appspot.com/o/rv%2Fpr%2F91-1597349905352.jpg',1,20,999,0,200,'Froot lops 370 gr','',100000,100000,'2020-03-21 22:43:25','2021-06-04 13:08:17',0),(92,12,1,1,'Aceite cocinero 1l','','',NULL,0,1,1,1,0,2.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F92-1597349936831.jpg',1,20,993,1,200,'Aceite cocinero 1l','',100000,100000,'2020-03-21 22:44:40','2021-06-04 13:08:17',0),(105,15,1,1,'Roscas','','',NULL,0,1,1,1,0,0.12,'delivery-0001.appspot.com/o/rv%2Fpr%2F105-1597350384123.jpg',1,20,34,129,200,'Roscas','',100000,100000,'2020-03-23 03:54:42','2021-06-04 13:08:17',0),(106,15,1,1,'Pan varios sabores','','Pan de dulce, pan de sal, bollos','{\"lP\": [{\"d\": \"Bollos\", \"p\": \"0.18\", \"id\": \"0\"}, {\"d\": \"Pan de sal\", \"p\": \"0.18\", \"id\": \"1\"}, {\"d\": \"Pan de dulce\", \"p\": \"0.18\", \"id\": \"2\"}]}',0,1,1,1,0,0.18,'delivery-0001.appspot.com/o/rv%2Fpr%2F106-1597350396119.jpg',1,20,0,77,200,'Pan varios sabores','',100000,100000,'2020-03-23 04:23:56','2021-06-04 13:08:17',0),(107,15,1,1,'Cachos','','',NULL,0,1,1,1,0,0.20,'delivery-0001.appspot.com/o/rv%2Fpr%2F107-1597350407495.jpg',1,20,-6,441,200,'Cachos','',100000,100000,'2020-03-23 04:24:17','2021-06-04 13:08:17',0),(108,15,1,1,'Empanadas de queso','','',NULL,0,1,1,1,0,0.35,'delivery-0001.appspot.com/o/rv%2Fpr%2F108-1597350418260.jpg',1,20,0,215,200,'Empanadas de queso','',100000,100000,'2020-03-23 04:24:38','2021-06-04 13:08:17',0),(109,15,1,1,'Bollo grande','','',NULL,0,0,0,1,0,0.60,'delivery-0001.appspot.com/o/rv%2Fpr%2F109-1597350428600.jpg',1,20,0,0,200,'Bollo grande','',100000,100000,'2020-03-23 04:25:02','2021-06-04 13:08:17',0),(110,15,1,1,'Funda de rosquillas','','',NULL,0,1,1,1,0,0.80,'delivery-0001.appspot.com/o/rv%2Fpr%2F110-1597350438626.jpg',1,20,23,19,200,'Funda de rosquillas','',100000,100000,'2020-03-23 04:25:54','2021-06-04 13:08:17',0),(111,15,1,1,'Brownies','','',NULL,0,1,1,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F111-1597350458495.jpg',1,20,1,72,200,'Brownies','',100000,100000,'2020-03-23 04:29:36','2021-06-04 13:08:17',0),(112,15,1,1,'Pan de sal','','',NULL,0,1,1,1,0,0.18,'delivery-0001.appspot.com/o/rv%2Fpr%2F112-1597350468931.jpg',1,20,0,404,200,'Pan de sal','',100000,100000,'2020-03-25 14:16:49','2021-06-04 13:08:17',0),(113,15,1,1,'Pan de dulce','','',NULL,0,1,1,1,0,0.18,'delivery-0001.appspot.com/o/rv%2Fpr%2F113-1597350479792.jpg',1,20,33,250,200,'Pan de dulce','',100000,100000,'2020-03-25 14:17:53','2021-06-04 13:08:17',0),(114,15,1,1,'Bollos','','',NULL,0,1,1,1,0,0.18,'delivery-0001.appspot.com/o/rv%2Fpr%2F114-1597350512704.jpg',1,20,17,284,200,'Bollos','',100000,100000,'2020-03-25 14:18:10','2021-06-04 13:08:17',0),(115,16,1,1,'Paspas','','',NULL,0,1,1,1,0,0.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F115-1597351285214.jpg',1,20,50,191,200,'Paspas','',100000,100000,'2020-03-26 00:00:59','2021-06-22 03:27:37',0),(116,16,1,1,'Pan lojano','','',NULL,0,1,1,1,0,0.20,'delivery-0001.appspot.com/o/rv%2Fpr%2F116-1597351299306.jpg',1,20,38,76,200,'Pan lojano','',100000,100000,'2020-03-26 00:04:38','2021-06-22 03:27:37',0),(117,16,1,1,'Pan de yema','','',NULL,0,1,1,1,0,0.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F117-1597351309453.jpg',1,20,40,66,200,'Pan de yema','',100000,100000,'2020-03-26 00:04:57','2021-06-04 13:08:17',0),(118,16,1,1,'Enrollado','','',NULL,0,1,1,1,0,0.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F118-1597351322396.jpg',1,20,0,1154,200,'Enrollado','',100000,100000,'2020-03-26 00:05:14','2021-06-04 13:08:17',0),(119,16,1,1,'Enrollado con queso','','',NULL,0,1,1,1,0,0.20,'delivery-0001.appspot.com/o/rv%2Fpr%2F119-1597351333754.jpg',1,20,50,67,200,'Enrollado con queso','',100000,100000,'2020-03-26 00:07:06','2021-06-04 13:08:17',0),(120,16,1,1,'Pan especial','','',NULL,0,1,1,1,0,0.20,'delivery-0001.appspot.com/o/rv%2Fpr%2F120-1597351356533.jpg',1,20,43,66,200,'Pan especial','',100000,100000,'2020-03-26 00:08:39','2021-06-04 13:08:17',0),(121,16,1,1,'Pan de dulce','','','{\"lP\": []}',0,1,1,1,0,0.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F121-1597351374228.jpg',1,20,50,127,200,'Pan de dulce','',100000,100000,'2020-03-26 00:08:59','2021-06-04 13:08:17',0),(122,16,1,1,'Bollo grande','','',NULL,0,1,1,1,0,0.40,'delivery-0001.appspot.com/o/rv%2Fpr%2F122-1597351385769.jpg',1,20,30,24,200,'Bollo grande','',100000,100000,'2020-03-26 00:10:20','2021-06-04 13:08:17',0),(123,16,1,1,'Bollo pequeño','','',NULL,0,1,1,1,0,0.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F123-1597351402407.jpg',1,20,37,202,200,'Bollo pequeño','',100000,100000,'2020-03-26 00:10:42','2021-06-04 13:08:17',0),(124,16,1,1,'Figuras de pan','','',NULL,0,1,1,1,0,0.40,'delivery-0001.appspot.com/o/rv%2Fpr%2F124-1597351415215.jpg',1,20,0,139,200,'Figuras de pan','',100000,100000,'2020-03-26 00:21:49','2021-06-04 13:08:17',0),(125,16,1,1,'Roscas','','',NULL,0,1,1,1,0,0.10,'delivery-0001.appspot.com/o/rv%2Fpr%2F125-1597351425145.jpg',1,20,100,113,200,'Roscas','',100000,100000,'2020-03-26 00:22:38','2021-06-04 13:08:17',0),(126,16,1,1,'Keyes','','',NULL,0,1,1,1,0,0.35,'delivery-0001.appspot.com/o/rv%2Fpr%2F126-1597351437080.jpg',1,20,35,10,200,'Keyes','',100000,100000,'2020-03-26 00:23:20','2021-06-04 13:08:17',0),(128,17,1,1,'Quesillo lojano','','1 Lb.',NULL,0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F128-1597351723389.jpg',1,20,3,104,200,'Quesillo lojano','',100000,100000,'2020-03-26 22:47:43','2021-05-16 20:16:40',0),(129,17,1,1,'Queso Amasado','','430 gr.',NULL,0,1,1,1,0,2.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F129-1597351733124.jpg',1,20,90,18,200,'Queso Amasado','',100000,100000,'2020-03-26 23:00:41','2021-05-02 22:57:55',0),(130,17,1,1,'Huevos de Campo','','100% Órganicos\nCaja 8 unidades',NULL,0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F130-1597351742085.jpg',1,20,9,17,200,'Huevos de Campo','',100000,100000,'2020-03-26 23:02:35','2021-06-04 13:08:17',0),(131,17,1,1,'Manjar de leche','','Certificado Öko-Garantie\nFrasco 275 gr',NULL,0,1,1,1,0,2.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F131-1597351752613.jpg',1,20,3,1,200,'Manjar de leche','',100000,100000,'2020-03-26 23:05:09','2021-06-04 13:08:17',0),(132,17,1,1,'Dulce de babaco','','Certificado Öko-Garantie\nFrasco 275 gr',NULL,0,1,1,1,0,2.60,'delivery-0001.appspot.com/o/rv%2Fpr%2F132-1597351761758.jpg',1,20,9,3,200,'Dulce de babaco','',100000,100000,'2020-03-26 23:06:33','2021-06-04 13:08:17',0),(133,17,1,1,'Miel de abeja','','100% Natural - 290 g.',NULL,0,1,1,1,0,4.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F133-1597351771300.jpg',1,20,0,0,200,'Miel de abeja','',100000,100000,'2020-03-26 23:10:08','2021-06-04 13:08:17',0),(134,17,1,1,'Granola','','Ingredientes: Avena, Nueces Variadas, Coco, Panela y Miel.',NULL,0,1,1,1,0,3.49,'delivery-0001.appspot.com/o/rv%2Fpr%2F134-1597351780444.jpg',1,20,4,1,200,'Granola','',100000,100000,'2020-03-26 23:11:05','2021-06-04 13:08:17',0),(140,12,1,1,'Papa bolona 1 lb','','',NULL,0,1,1,1,0,0.35,'delivery-0001.appspot.com/o/rv%2Fpr%2F140-1597349961790.jpg',1,20,999,10,200,'Papa bolona 1 lb','',100000,100000,'2020-03-28 04:21:09','2021-06-04 13:08:17',0),(141,12,1,1,'Quesillo 1 lb','','',NULL,0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F141-1597349980535.jpg',1,20,995,0,200,'Quesillo 1 lb','',100000,100000,'2020-03-28 04:23:07','2021-06-04 13:08:17',0),(142,12,1,1,'Yuca','','',NULL,0,0,0,0,0,0.35,'delivery-0001.appspot.com/o/rv%2Fpr%2F142-1597350004394.jpg',1,20,0,0,200,'Yuca','',100000,100000,'2020-03-28 04:23:36','2021-06-04 13:08:17',0),(143,12,1,1,'Plátano verde u','','',NULL,0,1,1,1,0,0.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F143-1597350022370.jpg',1,20,999,10,200,'Plátano verde u','',100000,100000,'2020-03-28 04:24:29','2021-06-04 13:08:17',0),(144,12,1,1,'Plátano maduro u','','',NULL,0,1,1,1,0,0.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F144-1597350037944.jpg',1,20,993,10,200,'Plátano maduro u','',100000,100000,'2020-03-28 04:29:32','2021-06-04 13:08:17',0),(145,12,1,1,'Tomate riñon 1 lb','','',NULL,0,1,1,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F145-1597350054825.jpg',1,20,997,5,200,'Tomate riñon 1 lb','',100000,100000,'2020-03-28 05:05:12','2021-06-04 13:08:17',0),(146,12,1,1,'Limón mediano','','por unidades',NULL,0,1,1,1,0,0.10,'delivery-0001.appspot.com/o/rv%2Fpr%2F146-1597350069143.jpg',1,20,12,20,200,'Limón mediano','',100000,100000,'2020-03-28 05:06:31','2021-06-04 13:08:17',0),(147,12,1,1,'Ajo pepa','','Funda 4 Oz',NULL,0,0,0,0,0,0.22,'delivery-0001.appspot.com/o/rv%2Fpr%2F147-1597350083540.jpg',1,20,0,0,200,'Ajo pepa','',100000,100000,'2020-03-28 05:07:30','2021-06-04 13:08:17',0),(148,12,1,1,'Guineo verde mediano','','por unidades',NULL,0,1,1,1,0,0.05,'delivery-0001.appspot.com/o/rv%2Fpr%2F148-1597350097556.jpg',1,20,993,23,200,'Guineo verde mediano','',100000,100000,'2020-03-28 05:08:19','2021-06-04 13:08:17',0),(149,19,1,1,'Torta de vainilla ','','','{\"lP\": [{\"d\": \"Brazo gitano vainilla grande \", \"p\": \"8.0\", \"id\": \"0\"}, {\"d\": \"Brazo gitano vainilla pequeño\", \"p\": \"5.0\", \"id\": \"1\"}, {\"d\": \"Torta de vainilla grande\", \"p\": \"10.0\", \"id\": \"2\"}, {\"d\": \"Torta de vainilla mediana\", \"p\": \"7.0\", \"id\": \"3\"}, {\"d\": \"Torta de vainilla pequeña\", \"p\": \"5.0\", \"id\": \"4\"}]}',0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F149-1597425162478.jpg',1,20,11,103,200,'Torta de vainilla ','',100000,100000,'2020-03-28 21:58:31','2021-06-04 13:08:17',0),(150,19,1,1,'Torta de chocolate','','','{\"lP\": [{\"d\": \"Brazo gitano chocolate grande \", \"p\": \"8.0\", \"id\": \"0\"}, {\"d\": \"Brazo gitano chocolate pequeño\", \"p\": \"5.0\", \"id\": \"1\"}, {\"d\": \"Torta de chocolate grande\", \"p\": \"12.0\", \"id\": \"2\"}, {\"d\": \"Torta de chocolate mediana\", \"p\": \"8.0\", \"id\": \"3\"}, {\"d\": \"Torta de chocolate pequeña \", \"p\": \"6.0\", \"id\": \"4\"}]}',0,1,1,1,0,6.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F150-1597425171587.jpg',1,20,43,408,200,'Torta de chocolate','',100000,100000,'2020-03-28 21:58:51','2021-06-04 13:08:17',0),(151,19,1,1,'Repostería','','Brazo gitano, tres leches, mini tortas, keyes, roscones','{\"lP\": [{\"d\": \"Porción brazo gitano \", \"p\": \"1.0\", \"id\": \"0\"}, {\"d\": \"Mini tortas \", \"p\": \"2.0\", \"id\": \"1\"}, {\"d\": \"Key naranja grande \", \"p\": \"1.75\", \"id\": \"2\"}, {\"d\": \"Key naranja redondo pequeño\", \"p\": \"1.0\", \"id\": \"3\"}, {\"d\": \"Funda de roscón grande \", \"p\": \"1.25\", \"id\": \"4\"}, {\"d\": \"Key de naranja corazón \", \"p\": \"0.75\", \"id\": \"5\"}, {\"d\": \"Porción tres leches \", \"p\": \"1.25\", \"id\": \"6\"}]}',0,1,1,1,0,0.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F151-1597425313456.jpg',1,20,7,119,200,'Repostería','',100000,100000,'2020-03-28 21:59:20','2021-06-04 13:08:17',0),(152,19,1,1,'Pan de dulce','','Bollos, pan de dulce, pan de chocolate, pan de leche, cortados','{\"lP\": [{\"d\": \"Pan de chocolate \", \"p\": \"0.15\", \"id\": \"0\"}, {\"d\": \"Cortados\", \"p\": \"0.15\", \"id\": \"1\"}, {\"d\": \"Pan de dulce\", \"p\": \"0.15\", \"id\": \"2\"}, {\"d\": \"Pan de leche\", \"p\": \"0.15\", \"id\": \"3\"}, {\"d\": \"Bollos\", \"p\": \"0.15\", \"id\": \"4\"}]}',0,1,1,1,0,0.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F152-1597425367390.jpg',1,20,30,1196,200,'Pan de dulce','',100000,100000,'2020-03-28 22:01:32','2021-06-04 13:08:17',0),(153,19,1,1,'Empanadas ','','Empanadas de queso, empanadas de manjar, empanadas especiales ','{\"lP\": [{\"d\": \"Empanada especial de queso\", \"p\": \"0.4\", \"id\": \"0\"}, {\"d\": \"Empanada de manjar grande\", \"p\": \"0.25\", \"id\": \"1\"}, {\"d\": \"Empanada de manjar pequeña\", \"p\": \"0.15\", \"id\": \"2\"}, {\"d\": \"Empanada de queso grande\", \"p\": \"0.25\", \"id\": \"3\"}, {\"d\": \"Empanada de queso pequeña\", \"p\": \"0.15\", \"id\": \"4\"}]}',0,1,1,1,0,0.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F153-1597425376816.jpg',1,20,0,346,200,'Empanadas ','',100000,100000,'2020-03-28 22:01:43','2021-06-04 13:08:17',0),(154,19,1,1,'Pan de sal ','','Pan especial, pan de yema, paspas, pan lojano, pan de casa, cachos, enrollados, gusanitos, pan especial','{\"lP\": [{\"d\": \"Pan lojano\", \"p\": \"0.12\", \"id\": \"0\"}, {\"d\": \"Pan integral \", \"p\": \"0.15\", \"id\": \"1\"}, {\"d\": \"Gusanitos\", \"p\": \"0.15\", \"id\": \"2\"}, {\"d\": \"Cachos \", \"p\": \"0.15\", \"id\": \"3\"}, {\"d\": \"Enrollados\", \"p\": \"0.15\", \"id\": \"4\"}, {\"d\": \"Palanqueta \", \"p\": \"0.15\", \"id\": \"5\"}, {\"d\": \"Pan de casa\", \"p\": \"0.15\", \"id\": \"6\"}, {\"d\": \"Paspas\", \"p\": \"0.15\", \"id\": \"7\"}, {\"d\": \"Pan de yema \", \"p\": \"0.15\", \"id\": \"8\"}, {\"d\": \"Pan especial \", \"p\": \"0.15\", \"id\": \"9\"}]}',0,1,1,1,0,0.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F154-1597425385293.jpg',1,20,38,1397,200,'Pan de sal ','',100000,100000,'2020-03-28 22:01:53','2021-06-04 13:08:17',0),(155,19,1,1,'Galletería con chocolate','','Melbas, galletas, herrajes, alfajores','{\"lP\": [{\"d\": \"Melva mediana\", \"p\": \"0.25\", \"id\": \"0\"}, {\"d\": \"Rosquillas de leche\", \"p\": \"0.1\", \"id\": \"1\"}, {\"d\": \"Galleta redonda\", \"p\": \"0.5\", \"id\": \"2\"}, {\"d\": \"Herrajes\", \"p\": \"0.5\", \"id\": \"3\"}, {\"d\": \"Donas\", \"p\": \"0.5\", \"id\": \"4\"}, {\"d\": \"Alfajores\", \"p\": \"0.2\", \"id\": \"5\"}, {\"d\": \"Gusanitos\", \"p\": \"0.5\", \"id\": \"6\"}, {\"d\": \"Melba grande\", \"p\": \"0.5\", \"id\": \"7\"}, {\"d\": \"Melba pequeña \", \"p\": \"0.15\", \"id\": \"8\"}]}',0,1,1,1,0,0.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F155-1597425394436.jpg',1,20,30,367,200,'Galletería con chocolate','',100000,100000,'2020-03-28 22:02:00','2021-06-04 13:08:17',0),(156,19,1,1,'Hojaldres','','Conos, torres, mil hojas, pañuelos','{\"lP\": [{\"d\": \"Mil hojas \", \"p\": \"0.5\", \"id\": \"0\"}, {\"d\": \"Orejas\", \"p\": \"0.5\", \"id\": \"1\"}, {\"d\": \"Empanadillas \", \"p\": \"0.25\", \"id\": \"2\"}, {\"d\": \"Conos \", \"p\": \"0.5\", \"id\": \"3\"}, {\"d\": \"Pañuelos \", \"p\": \"0.5\", \"id\": \"4\"}, {\"d\": \"Torres\", \"p\": \"0.5\", \"id\": \"5\"}]}',0,1,1,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F156-1597425403485.jpg',1,20,27,236,200,'Hojaldres','',100000,100000,'2020-03-28 22:02:08','2021-06-04 13:08:17',0),(157,19,1,1,'Galletas','','Galletas, elenas, rizadas, biscochos','{\"lP\": [{\"d\": \"Galleta chispas de chocolate\", \"p\": \"0.25\", \"id\": \"0\"}, {\"d\": \"Besitos\", \"p\": \"0.05\", \"id\": \"1\"}, {\"d\": \"Rizada\", \"p\": \"0.05\", \"id\": \"2\"}, {\"d\": \"Elena grande \", \"p\": \"0.5\", \"id\": \"3\"}, {\"d\": \"Elena mediana\", \"p\": \"0.25\", \"id\": \"4\"}, {\"d\": \"Bizcocho de sal \", \"p\": \"0.05\", \"id\": \"5\"}, {\"d\": \"Bizcocho de dulce\", \"p\": \"0.05\", \"id\": \"6\"}, {\"d\": \"Rosquillas de leche\", \"p\": \"0.1\", \"id\": \"7\"}]}',0,1,1,1,0,0.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F157-1597425424509.jpg',1,20,7,476,200,'Galletas','',100000,100000,'2020-03-28 22:02:17','2021-06-04 13:08:17',0),(162,17,1,1,'Pollo ahumado','','Entero - Tamaño grande',NULL,0,1,1,1,0,8.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F162-1597351790800.jpg',1,20,0,2,200,'Pollo ahumado','',100000,100000,'2020-03-29 05:44:58','2021-06-04 13:08:17',0),(163,15,1,1,'Alcaparras','','tarrina ',NULL,0,0,0,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F163-1597350525823.jpg',1,20,0,0,200,'Alcaparras','',100000,100000,'2020-03-30 03:21:39','2021-06-04 13:08:17',0),(164,15,1,1,'Higos','','tarrina ',NULL,0,0,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F164-1597350538729.jpg',1,20,19,5,200,'Higos','',100000,100000,'2020-03-30 03:21:59','2021-06-04 13:08:17',0),(165,15,1,1,'Café 1/2 libra','','',NULL,0,1,1,1,0,1.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F165-1597350549878.jpg',1,20,9,7,200,'Café 1/2 libra','',100000,100000,'2020-03-30 03:23:18','2021-06-04 13:08:17',0),(166,15,1,1,'Dulce de leche','','',NULL,0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F166-1597350561702.jpg',1,20,4,6,200,'Dulce de leche','',100000,100000,'2020-03-30 03:30:12','2021-06-04 13:08:17',0),(171,19,1,1,'Enrrollados','','',NULL,0,1,1,1,0,0.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F171-1597425722756.jpg',1,20,0,77,200,'Enrrollados','',100000,100000,'2020-03-31 04:04:43','2021-06-04 13:08:17',0),(172,19,1,1,'Cachos','','',NULL,0,1,1,1,0,0.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F172-1597425736366.jpg',1,20,0,109,200,'Cachos','',100000,100000,'2020-03-31 04:04:51','2021-06-04 13:08:17',0),(173,19,1,1,'Roscas','','',NULL,0,0,0,1,0,0.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F173-1597425750966.jpg',1,20,0,80,200,'Roscas','',100000,100000,'2020-03-31 04:04:58','2021-06-04 13:08:17',0),(174,19,1,1,'Keyes redondos','','',NULL,0,0,0,1,0,1.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F174-1597425765992.jpg',1,20,11,16,200,'Keyes redondos','',100000,100000,'2020-03-31 04:05:54','2021-06-04 13:08:17',0),(175,19,1,1,'Keyes de corazón','','',NULL,0,0,0,1,0,0.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F175-1597425829137.jpg',1,20,3,7,200,'Keyes de corazón','',100000,100000,'2020-03-31 04:06:55','2021-06-04 13:08:17',0),(176,19,1,1,'Empanadas de queso','','','{\"lP\": [{\"d\": \"Empanadas de Manjar\", \"p\": \"0.25\", \"id\": \"0\"}]}',0,0,0,1,0,0.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F176-1597425840828.jpg',1,20,15,178,200,'Empanadas de queso','',100000,100000,'2020-03-31 04:07:57','2021-06-04 13:08:17',0),(177,24,1,1,'Alitas brosterizadas 2 piezas','','2 Piezas de Alitas',NULL,0,0,0,1,1,2.25,'delivery-001.appspot.com/o/cr%2Fpr%2F177-1623638216467.jpg',1,20,0,684,200,'Alitas brosterizadas 2 piezas','',100000,100000,'2020-03-31 19:08:20','2021-06-14 02:44:12',0),(178,24,1,1,'Alitas brosterizadas 4 piezas','','4 Piezas de Alitas',NULL,1,1,0,1,0,3.25,'delivery-server-b99ff.appspot.com/o/cr%2Fpr%2F178-1623638887031.jpg',1,20,0,191,200,'Alitas brosterizadas 4 piezas','',100000,100000,'2020-03-31 19:09:50','2021-06-20 13:11:36',0),(179,24,1,1,'Presa de pollo brosterizada','','','{\"lP\": [{\"d\": \"Doble presa brosterizada\", \"p\": \"4.0\", \"id\": \"0\"}, {\"d\": \"Una presa brosterizada\", \"p\": \"2.5\", \"id\": \"1\"}]}',0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F179-1597593892740.jpg',1,20,26,46,200,'Presa de pollo brosterizada','',100000,100000,'2020-03-31 19:52:43','2021-06-04 13:08:17',0),(180,24,1,1,'Doble presa brosterizada','','','{\"lP\": []}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F180-1597594350604.jpg',1,20,0,20,200,'Doble presa brosterizada','',100000,100000,'2020-03-31 19:53:02','2021-06-04 13:08:17',0),(181,24,1,1,'Chulepapa','','',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F181-1597594368794.jpg',1,20,30,2,200,'Chulepapa','',100000,100000,'2020-03-31 21:59:01','2021-06-04 13:08:17',0),(182,24,1,1,'Hamburguesa super especial extra papa','','',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F182-1597594426942.jpg',1,20,25,5,200,'Hamburguesa super especial extra papa','',100000,100000,'2020-03-31 21:59:40','2021-06-04 13:08:17',0),(183,24,1,1,'Superpapa','','Carne de hamburguesa, jamón y salchicha con papas fritas, ensalada fresca, mayonesa y salsa de tomate ',NULL,0,1,1,1,0,3.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F183-1597594440405.jpg',1,20,24,38,200,'Superpapa','',100000,100000,'2020-03-31 22:00:14','2021-06-04 13:08:17',0),(184,24,1,1,'Hamburguesa especial extra papa','','',NULL,0,1,1,1,0,3.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F184-1597594450849.jpg',1,20,24,10,200,'Hamburguesa especial extra papa','',100000,100000,'2020-03-31 22:00:54','2021-06-04 13:08:17',0),(185,24,1,1,'Hamburguesa simple extra papa','','',NULL,0,1,1,1,0,2.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F185-1597594460663.jpg',1,20,24,16,200,'Hamburguesa simple extra papa','',100000,100000,'2020-03-31 22:05:13','2021-06-04 13:08:17',0),(186,24,1,1,'Super plato especial','','Lomo de chancho, filete de pollo, chorizo de ternera y jamón. Acompañado de papas fritas, ensalada, y salsaa',NULL,0,1,1,1,0,7.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F186-1597594471793.jpg',1,20,29,0,200,'Super plato especial','',100000,100000,'2020-03-31 22:05:40','2021-06-04 13:08:17',0),(187,24,1,1,'Filete de pollo medio','','',NULL,0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F187-1597594485093.jpg',1,20,14,42,200,'Filete de pollo medio','',100000,100000,'2020-03-31 22:06:07','2021-06-04 13:08:17',0),(188,24,1,1,'Filete de pollo completo','','',NULL,0,1,1,1,0,7.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F188-1597594496562.jpg',1,20,15,1,200,'Filete de pollo completo','',100000,100000,'2020-03-31 22:06:33','2021-06-04 13:08:17',0),(190,24,1,1,'Salchipapa','','',NULL,0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F190-1597594509804.jpg',1,20,0,104,200,'Salchipapa','',100000,100000,'2020-04-01 03:11:45','2021-06-04 13:08:17',0),(191,24,1,1,'Lomo a la plancha entero','','',NULL,0,1,1,1,0,7.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F191-1597594520873.jpg',1,20,19,8,200,'Lomo a la plancha entero','',100000,100000,'2020-04-01 03:26:03','2021-06-22 23:37:28',0),(192,24,1,1,'Lomo a la plancha medio','','',NULL,0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F192-1597594531728.jpg',1,20,20,34,200,'Lomo a la plancha medio','',100000,100000,'2020-04-01 03:26:17','2021-06-04 13:08:17',0),(193,15,1,1,'Palanqueta','','',NULL,0,1,1,1,0,0.18,'delivery-0001.appspot.com/o/rv%2Fpr%2F193-1597350574653.jpg',1,20,0,118,200,'Palanqueta','',100000,100000,'2020-04-01 03:39:57','2021-06-04 13:08:17',0),(194,15,1,1,'Palanqueta con mermelada de piña','','',NULL,0,1,1,1,0,0.20,'delivery-0001.appspot.com/o/rv%2Fpr%2F194-1597350585346.jpg',1,20,0,72,200,'Palanqueta con mermelada de piña','',100000,100000,'2020-04-01 03:40:19','2021-06-04 13:08:17',0),(195,15,1,1,'Key pequeño','','',NULL,0,0,0,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F195-1597350595829.jpg',1,20,0,0,200,'Key pequeño','',100000,100000,'2020-04-01 03:40:54','2021-06-04 13:08:17',0),(196,15,1,1,'Dulce de babaco','','',NULL,0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F196-1597350605725.jpg',1,20,28,0,200,'Dulce de babaco','',100000,100000,'2020-04-01 03:41:29','2021-06-04 13:08:17',0),(197,7,1,1,'1/8 Pollo broster','','Incluye: consomé, arroz, papas, ensalada',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F197-1597348654383.jpg',1,20,30,7,200,'1/8 Pollo broster','',100000,100000,'2020-04-01 04:42:20','2021-06-04 13:08:17',0),(198,7,1,1,'1/4 pollo broster','','',NULL,0,1,1,1,0,4.35,'delivery-0001.appspot.com/o/rv%2Fpr%2F198-1597348671791.jpg',1,20,30,12,200,'1/4 pollo broster','',100000,100000,'2020-04-01 04:43:36','2021-06-04 13:08:17',0),(199,7,1,1,'1/2 pollo broster','','',NULL,0,1,1,1,0,8.50,'delivery-0001.appspot.com/o/op%2Fpr%2F199-1617496753248.jpg',1,20,26,12,200,'1/2 pollo broster','',100000,100000,'2020-04-01 04:43:52','2021-06-04 13:08:17',0),(200,7,1,1,'Pollo entero broster','','',NULL,0,1,1,1,0,17.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F200-1597348692658.jpg',1,20,28,6,200,'Pollo entero broster','',100000,100000,'2020-04-01 04:44:07','2021-06-04 13:08:17',0),(224,28,1,1,'Pollo entero 5 lb','','',NULL,0,1,1,1,0,6.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F224-1597597107457.jpg',1,20,10,33,200,'Pollo entero 5 lb','',100000,100000,'2020-04-03 22:58:02','2021-06-04 13:08:17',0),(225,28,1,1,'Menudencia 1 lb','','',NULL,0,1,1,1,0,0.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F225-1597597121214.jpg',1,20,10,11,200,'Menudencia 1 lb','',100000,100000,'2020-04-03 22:58:56','2021-06-04 13:08:17',0),(226,28,1,1,'Higadilla 1 lb','','',NULL,0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F226-1597597133235.jpg',1,20,10,13,200,'Higadilla 1 lb','',100000,100000,'2020-04-03 22:59:29','2021-06-04 13:08:17',0),(326,41,1,1,'Pollo asado o broster ','','Domingo,por la compra de un pollo, una presa gratis','{\"lP\": [{\"d\": \"1 Pollo asado\", \"p\": \"17\", \"id\": \"0\"}, {\"d\": \"1 Pollo broster\", \"p\": \"17\", \"id\": \"1\"}]}',1,1,1,1,0,17.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F326-1597622166375.jpg',1,20,99,49,200,'Pollo asado o broster ','',100000,100000,'2020-04-08 23:43:52','2022-07-11 19:02:47',0),(328,12,1,1,'Lacteos','','Leche, yogurt, queso, quesillo','{\"lP\": [{\"d\": \"Parmalat cart 1lt\", \"p\": \"1.35\", \"id\": \"0\"}, {\"d\": \"Nutrí Ent 900ml fnda\", \"p\": \"0.85\", \"id\": \"1\"}, {\"d\": \"Rey Leche Ent 900ml fnda\", \"p\": \"0.9\", \"id\": \"2\"}, {\"d\": \"Nutrí Semid TTPK 900mk\", \"p\": \"1.05\", \"id\": \"3\"}, {\"d\": \"Ecolac 1lt\", \"p\": \"0.85\", \"id\": \"4\"}]}',0,0,0,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F328-1597349111519.jpg',1,20,95,2,200,'Lacteos','',100000,100000,'2020-04-10 00:06:00','2021-06-04 13:08:17',0),(329,12,1,1,'Carnes','','Carne de cerdo, res, pollo ',NULL,0,0,0,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F329-1597349120658.jpg',1,20,96,3,200,'Carnes','',100000,100000,'2020-04-10 00:06:17','2021-06-04 13:08:17',0),(330,12,1,1,'Embutidos','','Salchicha, chorizo, jamón, mortadela',NULL,0,0,0,1,0,1.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F330-1597349131269.jpg',1,20,95,0,200,'Embutidos','',100000,100000,'2020-04-10 00:07:25','2021-06-04 13:08:17',0),(331,12,1,1,'Frutas','','Naranja, fresas, mora, banana, papaya, frutos rojos',NULL,0,0,0,1,0,0.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F331-1597349140159.jpg',1,20,99,0,200,'Frutas','',100000,100000,'2020-04-10 00:08:10','2021-06-04 13:08:17',0),(332,12,1,1,'Vegetales','','Legumbres, hortalizas, tubérculos',NULL,0,0,0,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F332-1597349150885.jpg',1,20,95,3,200,'Vegetales','',100000,100000,'2020-04-10 00:08:32','2021-06-04 13:08:17',0),(333,12,1,1,'Cereales','','Chocapic, nesquik, zucaritas, cereales varios ',NULL,0,0,0,1,0,2.40,'delivery-0001.appspot.com/o/rv%2Fpr%2F333-1597349159569.jpg',1,20,100,0,200,'Cereales','',100000,100000,'2020-04-10 00:09:03','2021-06-04 13:08:17',0),(334,12,1,1,'Aseo personal ','','Pasta de dientes, shampoo, jaboncillo, rasuradora ',NULL,0,0,0,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F334-1597349200116.jpg',1,20,99,0,200,'Aseo personal ','',100000,100000,'2020-04-10 00:09:27','2021-06-04 13:08:17',0),(335,12,1,1,'Comida para perro','','Procan, dog chow, pro plan, comida para perro variada','{\"lP\": [{\"d\": \"Pasta de dientes \", \"p\": \"1.0\", \"id\": \"0\"}]}',0,0,0,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F335-1597349234018.jpg',1,20,98,0,200,'Comida para perro','',100000,100000,'2020-04-10 00:09:48','2021-06-04 13:08:17',0),(336,12,1,1,'Confitería','','Galletas, chocolates, dulces, Helados',NULL,0,0,0,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F336-1597349289515.jpg',1,20,100,0,200,'Confitería','',100000,100000,'2020-04-10 00:10:40','2021-06-04 13:08:17',0),(337,12,1,1,'Pastelería','','Tortas, keyes, postres',NULL,0,0,0,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F337-1597349312204.jpg',1,20,100,0,200,'Pastelería','',100000,100000,'2020-04-10 00:10:54','2021-06-04 13:08:17',0),(338,12,1,1,'Juguetes','','Carros, muñecas, muñecos, figuras de acción',NULL,0,0,0,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F338-1597349357115.jpg',1,20,100,0,200,'Juguetes','',100000,100000,'2020-04-10 00:13:12','2021-06-04 13:08:17',0),(339,12,1,1,'Arroz','','Arroz en funda, arroz  arroba, arroz libra, arroz integral, saco de arroz ',NULL,0,0,0,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F339-1597349412487.jpg',1,20,98,1,200,'Arroz','',100000,100000,'2020-04-10 00:13:58','2021-06-04 13:08:17',0),(340,12,1,1,'Sal funda ','','Sal 1 kilo, sal 2 kilos, sal 1/2 kilo, sal funda',NULL,0,0,0,1,0,0.35,'delivery-0001.appspot.com/o/rv%2Fpr%2F340-1597349440829.jpg',1,20,100,0,200,'Sal funda ','',100000,100000,'2020-04-10 00:14:07','2021-06-04 13:08:17',0),(341,12,1,1,'Harina','','Harina 1 libra, harina 1 kilo, funda de harina',NULL,0,0,0,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F341-1597349455871.jpg',1,20,17,0,200,'Harina','',100000,100000,'2020-04-10 00:14:46','2021-06-04 13:08:17',0),(342,12,1,1,'Víveres varios','','',NULL,0,0,0,1,0,6.05,'delivery-0001.appspot.com/o/rv%2Fpr%2F342-1597349513378.jpg',1,20,18,1,200,'Víveres varios','',100000,100000,'2020-04-10 00:15:26','2021-06-04 13:08:17',0),(343,12,1,1,'Combo frutas 1','','',NULL,0,1,1,1,0,10.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F343-1597349736187.jpg',1,20,15,0,200,'Combo frutas 1','',100000,100000,'2020-04-10 00:16:03','2021-06-04 13:08:17',0),(344,12,1,1,'Combo frutas 2','','',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F344-1597349802915.jpg',1,20,19,2,200,'Combo frutas 2','',100000,100000,'2020-04-10 00:16:19','2021-06-04 13:08:17',0),(348,17,1,1,'Mix verdura','','',NULL,0,0,0,0,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpromo%2F348-1595522697890.jpg',1,20,0,0,200,'Mix verdura','',100000,100000,'2020-04-10 14:15:43','2021-06-04 13:08:17',0),(349,41,1,1,'1/2 pollo asado o broster','','Incluye consomé, arroz, papas y ensalada. ','{\"lP\": [{\"d\": \"1/2 pollo asado\", \"p\": \"8.5\", \"id\": \"0\"}, {\"d\": \"1/2 pollo broster\", \"p\": \"8.5\", \"id\": \"1\"}]}',0,1,1,1,1,8.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F349-1597622175716.jpg',1,20,91,107,200,'1/2 pollo asado o broster','',100000,100000,'2020-04-10 21:19:32','2021-06-04 13:08:17',0),(350,41,1,1,'1/4 pollo asado o broster','','Incluye consomé, arroz, papas y ensalada. ','{\"lP\": [{\"d\": \"1/4 pollo broster\", \"p\": \"4.5\", \"id\": \"0\"}, {\"d\": \"1/4 pollo asado\", \"p\": \"4.5\", \"id\": \"1\"}]}',0,1,1,1,0,4.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F350-1597622195096.jpg',1,20,98,55,200,'1/4 pollo asado o broster','',100000,100000,'2020-04-10 21:23:56','2021-06-04 13:08:17',0),(351,41,1,1,'Presa de  pollo asado o broster','','Incluye consomé, arroz, papas y ensalada. ','{\"lP\": [{\"d\": \"Presa de  pollo broster\", \"p\": \"3.5\", \"id\": \"0\"}, {\"d\": \"Presa de  pollo asado\", \"p\": \"3.5\", \"id\": \"1\"}]}',0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F351-1597622202503.jpg',1,20,98,26,200,'Presa de  pollo asado o broster','',100000,100000,'2020-04-10 21:24:22','2021-06-04 13:08:17',0),(352,41,1,1,'Porción de arroz grande','','Arroz cocido una porción',NULL,0,1,1,1,0,1.80,'delivery-0001.appspot.com/o/rv%2Fpr%2F352-1597622211537.jpg',1,20,100,2,200,'Porción de arroz grande','',100000,100000,'2020-04-10 21:25:05','2021-06-04 13:08:17',0),(353,41,1,1,'Papa con pollo','','papas fritas con presa de pollo',NULL,0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F353-1597622219938.jpg',1,20,100,83,200,'Papa con pollo','',100000,100000,'2020-04-10 21:26:19','2021-06-04 13:08:17',0),(354,41,1,1,'Porción de papa grande','','',NULL,0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F354-1597622229152.jpg',1,20,99,15,200,'Porción de papa grande','',100000,100000,'2020-04-10 21:26:50','2021-06-04 13:08:17',0),(355,41,1,1,'Consomé grande','','Sopa  de pollo tamaño grande',NULL,0,1,1,1,0,1.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F355-1597622238476.jpg',1,20,100,4,200,'Consomé grande','',100000,100000,'2020-04-10 21:27:03','2021-06-04 13:08:17',0),(356,42,1,1,'Parrillada familiar (6 personas)','','Chuleta cerdo, res, chorizo, ubre, riñón, chinchulin, 1 presa de pollo ? gratis el domingo',NULL,1,1,1,1,0,56.20,'delivery-0001.appspot.com/o/rv%2Fpr%2F356-1597624062907.jpg',1,20,49,9,1,'Parrillada familiar (6 personas)','',100000,100000,'2020-04-10 21:44:48','2022-07-11 19:02:47',0),(357,42,1,1,'Parrillada junior   (2 personas)','','Chuleta chancho carne de res pollo un chorizo riñón higadillas  Yuca mote y ensalada',NULL,1,1,1,1,0,25.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F357-1597624145604.jpg',1,20,48,38,2,'Parrillada junior   (2 personas)','',100000,100000,'2020-04-10 21:45:20','2021-06-04 13:08:17',0),(358,42,1,1,'Lomo a la tabla','','Acompañado de papas y ensalada',NULL,0,1,1,1,0,9.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F358-1597624156180.jpg',1,20,48,9,200,'Lomo a la tabla','',100000,100000,'2020-04-10 21:46:07','2021-06-04 13:08:17',0),(359,42,1,1,'Lomo fino','','Acompañado de papas fritas y vegetales',NULL,0,1,1,1,0,13.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F359-1597624171688.jpg',1,20,49,3,200,'Lomo fino','',100000,100000,'2020-04-10 21:46:21','2021-06-04 13:08:17',0),(360,42,1,1,'Bife el fogón','','Acompañado de papas fritas ',NULL,0,1,1,1,0,15.85,'delivery-0001.appspot.com/o/rv%2Fpr%2F360-1597624183962.jpg',1,20,50,10,200,'Bife el fogón','',100000,100000,'2020-04-10 21:46:42','2021-06-04 13:08:17',0),(361,42,1,1,'Costillas en salsa bbq','','Acompañado de mote y papas fritas','{\"lP\": [{\"d\": \"1/2 costilla en salsa bbq\", \"p\": \"8.1\", \"id\": \"0\"}, {\"d\": \"Costilla en salsa bbq\", \"p\": \"12.8\", \"id\": \"1\"}]}',0,1,1,1,0,8.10,'delivery-0001.appspot.com/o/rv%2Fpr%2F361-1597624192307.jpg',1,20,46,28,200,'Costillas en salsa bbq','',100000,100000,'2020-04-10 21:47:24','2021-06-04 13:08:17',0),(362,42,1,1,'½ costilla en salsa bbq','','Acompañada de mote y papas',NULL,0,0,0,1,0,8.10,'delivery-0001.appspot.com/o/rv%2Fpr%2F362-1597624202290.jpg',1,20,49,15,200,'½ costilla en salsa bbq','',100000,100000,'2020-04-10 21:47:41','2021-06-04 13:08:17',0),(363,42,1,1,'Cecina','','Acompañada de yuca y ensalada',NULL,0,1,1,1,0,8.80,'delivery-0001.appspot.com/o/rv%2Fpr%2F363-1597624211498.jpg',1,20,49,3,200,'Cecina','',100000,100000,'2020-04-10 21:48:00','2021-06-04 13:08:17',0),(364,42,1,1,'Lomo apanado','','Acompañado de papas y ensalada',NULL,0,1,1,1,0,9.55,'delivery-0001.appspot.com/o/rv%2Fpr%2F364-1597624222242.jpg',1,20,50,0,200,'Lomo apanado','',100000,100000,'2020-04-10 21:48:24','2021-06-04 13:08:17',0),(365,42,1,1,'Pollo apanado','','Acompañado de papas , ensalada y arroz',NULL,0,1,1,1,0,9.55,'delivery-0001.appspot.com/o/rv%2Fpr%2F365-1597624232018.jpg',1,20,50,1,200,'Pollo apanado','',100000,100000,'2020-04-10 21:48:35','2021-06-04 13:08:17',0),(366,42,1,1,'Pollo a la plancha','','Acompañado de papas,ensalada y arroz',NULL,0,1,1,1,0,9.10,'delivery-0001.appspot.com/o/rv%2Fpr%2F366-1597624241107.jpg',1,20,49,8,200,'Pollo a la plancha','',100000,100000,'2020-04-10 21:48:49','2021-06-04 13:08:17',0),(367,42,1,1,'Alitas en salsa bbq','','Acompañadas de papas,ensalada y salsa BBQQ',NULL,0,1,1,1,0,8.10,'delivery-0001.appspot.com/o/rv%2Fpr%2F367-1597624251404.jpg',1,20,48,6,200,'Alitas en salsa bbq','',100000,100000,'2020-04-10 21:49:11','2021-06-04 13:08:17',0),(368,42,1,1,'Chuleta ahumada','','Acompañada de papas,ensalada y arroz',NULL,0,1,1,1,0,10.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F368-1597624262668.jpg',1,20,50,0,200,'Chuleta ahumada','',100000,100000,'2020-04-10 21:49:34','2021-06-04 13:08:17',0),(369,42,1,1,'Cuarto de pollo a la parrilla','','Acompañado de papas,arroz,ensalada y consome',NULL,0,1,1,1,0,5.40,'delivery-0001.appspot.com/o/rv%2Fpr%2F369-1597624275752.jpg',1,20,46,46,200,'Cuarto de pollo a la parrilla','',100000,100000,'2020-04-10 21:50:05','2021-06-04 13:08:17',1),(371,43,1,1,'Combo friends 2 pizzas','','2 pizzas de 4 porciones c/u, (ingredientes a elegir: jamón con queso mozarella o pepperoni con queso mozarella), incluye 2 bebidas personales',NULL,0,1,1,1,0,6.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F371-1597624830046.jpg',1,20,17,29,3,'Combo friends 2 pizzas','',100000,100000,'2020-04-14 00:40:55','2022-07-11 19:02:47',0),(372,43,1,1,'Promo big family','','1 pizza mediana, 1 pizza de 4 porciones, porción nachos con queso, bebida de 1lt. (ingredientes a elegir por pizza, jamón con queso mozzarella, peperoni con queso mozarella)',NULL,0,1,1,1,0,11.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F372-1597624820676.jpg',1,20,15,21,2,'Promo big family','',100000,100000,'2020-04-14 00:43:11','2022-07-11 19:02:47',0),(373,43,1,1,'Mega combo 3 pizzas','','2 Pizzas Medianas, 1 pizza 4 porciones, 1 bebida de 1lt, Ingredientes a escoger( jamón con queso mosarella, pepperoni con queso mozarella)',NULL,0,1,1,1,0,14.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F373-1597624843259.jpg',1,20,18,9,4,'Mega combo 3 pizzas','',100000,100000,'2020-04-14 00:44:22','2021-06-04 13:08:17',0),(374,43,1,1,'Combo mediana','','Pizza mediana 8porciones, más bebida de 750ml. Ingredientes a elegir (jamón con queso mozarella o pepperoni co',NULL,0,1,1,1,0,6.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F374-1597624910506.jpg',1,20,19,38,200,'Combo mediana','',100000,100000,'2020-04-14 00:45:27','2021-06-04 13:08:17',0),(375,16,1,1,'Quesadillas','','',NULL,0,1,1,1,0,0.35,'delivery-0001.appspot.com/o/rv%2Fpr%2F375-1597351346327.jpg',1,20,10,45,200,'Quesadillas','',100000,100000,'2020-04-14 01:27:01','2021-06-04 13:08:17',0),(376,44,1,1,'Alitas','','Alitas en salsa bbq, melimostaza, búfalo o cheese;  acompañadas de papas fritas apio y zanahoria','{\"lP\": [{\"d\": \"9 presas \", \"p\": \"8.99\", \"id\": \"0\"}, {\"d\": \"6 presas \", \"p\": \"6.99\", \"id\": \"1\"}, {\"d\": \"3 presas \", \"p\": \"3.99\", \"id\": \"2\"}]}',0,1,1,1,0,3.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F376-1597250924140.jpg',1,20,49,25,200,'Alitas','',100000,100000,'2020-04-14 20:35:07','2021-06-04 13:08:17',0),(377,44,1,1,'Arroz moro con papas fritas','','arroz Amarillo con lenteja, bastante queso con la opción que tú elijas , acompañado de papas fritas, apio y ?','{\"lP\": [{\"d\": \"Con huevo frito y chorizo\", \"p\": \"3.99\", \"id\": \"0\"}, {\"d\": \"Con tres alitas bbq\", \"p\": \"3.99\", \"id\": \"1\"}, {\"d\": \"Con pollo ahumado\", \"p\": \"3.99\", \"id\": \"2\"}, {\"d\": \"Con dos chorizo paisa\", \"p\": \"3.99\", \"id\": \"3\"}, {\"d\": \"Con pollo a la plancha \", \"p\": \"3.99\", \"id\": \"4\"}, {\"d\": \"Con chuleta y pollo a la plancha\", \"p\": \"5.5\", \"id\": \"5\"}]}',0,1,1,1,0,3.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F377-1597250936865.jpg',1,20,50,3,200,'Arroz moro con papas fritas','',100000,100000,'2020-04-14 20:46:55','2021-06-04 13:08:17',0),(383,44,1,1,'Especial alitas','','Acompañadas de la salsa que sea de tu elección , papas fritas, nachos , apio y zanahoria','{\"lP\": [{\"d\": \"36 alitas \", \"p\": \"31.99\", \"id\": \"0\"}, {\"d\": \"24 alitas \", \"p\": \"25.99\", \"id\": \"1\"}, {\"d\": \"14 alitas \", \"p\": \"15.99\", \"id\": \"2\"}, {\"d\": \"10 alitas \", \"p\": \"11.99\", \"id\": \"3\"}, {\"d\": \"8 alitas \", \"p\": \"9.99\", \"id\": \"4\"}, {\"d\": \"6 alitas \", \"p\": \"7.99\", \"id\": \"5\"}]}',0,1,1,1,0,7.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F383-1597250953736.jpg',1,20,48,24,200,'Especial alitas','',100000,100000,'2020-04-14 21:35:32','2021-06-04 13:08:17',0),(388,44,1,1,'Costillas','','Costillas en salsa bbq acompañadas de papas fritas, apio y zanahoria','{\"lP\": [{\"d\": \"10 presas \", \"p\": \"11.99\", \"id\": \"0\"}, {\"d\": \"7 presas \", \"p\": \"7.99\", \"id\": \"1\"}, {\"d\": \"4 presas \", \"p\": \"5.5\", \"id\": \"2\"}]}',0,1,1,1,0,5.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F388-1597250969350.jpg',1,20,49,11,200,'Costillas','',100000,100000,'2020-04-14 21:39:42','2021-06-04 13:08:17',0),(389,44,1,1,'Papas fritas ','','Papas fritas en balde con la opción que elijas ??','{\"lP\": [{\"d\": \"Pollo ahuamado\", \"p\": \"3.5\", \"id\": \"0\"}, {\"d\": \"Cuatro alitas \", \"p\": \"3.99\", \"id\": \"1\"}, {\"d\": \"1 alita y 1 salchicha\", \"p\": \"2.99\", \"id\": \"2\"}, {\"d\": \"2 chorizo paisa\", \"p\": \"2.99\", \"id\": \"3\"}, {\"d\": \"3 alitas \", \"p\": \"3.99\", \"id\": \"4\"}, {\"d\": \"2 alitas y salchicha \", \"p\": \"3.5\", \"id\": \"5\"}]}',0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F389-1597250982411.jpg',1,20,48,23,200,'Papas fritas ','',100000,100000,'2020-04-14 21:42:14','2021-06-04 13:08:17',0),(391,44,1,1,'Choclo fréjol nacho','','Choclo y fréjol, carne a elegir, guacamole y pico de gallo','{\"lP\": [{\"d\": \"Carne\", \"p\": \"3.75\", \"id\": \"0\"}, {\"d\": \"Pollo\", \"p\": \"3.75\", \"id\": \"1\"}, {\"d\": \"Chorizo paisa\", \"p\": \"3.75\", \"id\": \"2\"}, {\"d\": \"Embutidos\", \"p\": \"3.75\", \"id\": \"3\"}, {\"d\": \"Mixto\", \"p\": \"5.99\", \"id\": \"4\"}, {\"d\": \"Vegetariano\", \"p\": \"3.75\", \"id\": \"5\"}]}',0,1,1,1,0,3.75,'delivery-0001.appspot.com/o/op%2Fpr%2F391-1614217938295.jpg',1,20,48,24,200,'Choclo fréjol nacho','',100000,100000,'2020-04-14 21:42:40','2021-06-04 13:08:17',0),(393,44,1,1,'Bandejitas','','Choclo asado desgranado, papas fritas, un toque de arroz moro, choricillo','{\"lP\": [{\"d\": \"Carne molida\", \"p\": \"3.99\", \"id\": \"0\"}, {\"d\": \"Pollo en cuadritos\", \"p\": \"3.99\", \"id\": \"1\"}, {\"d\": \"Pollo ahumado\", \"p\": \"3.99\", \"id\": \"2\"}, {\"d\": \"Con 2 chorizo paisa\", \"p\": \"3.99\", \"id\": \"3\"}, {\"d\": \"Con huevo frito y chorizo\", \"p\": \"3.99\", \"id\": \"4\"}, {\"d\": \"Con tres alitas \", \"p\": \"3.99\", \"id\": \"5\"}, {\"d\": \"Pollo, carne y chorizo\", \"p\": \"5.99\", \"id\": \"6\"}, {\"d\": \"Full: pollo, carne, chorizo, 2 alitas, 2 costillas\", \"p\": \"6.99\", \"id\": \"7\"}]}',0,1,1,1,0,5.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F393-1597251019283.jpg',1,20,49,2,200,'Bandejitas','',100000,100000,'2020-04-14 21:46:39','2021-06-04 13:08:17',0),(401,44,1,1,'Nachos','','nachos con queso derretido , frejol , pimiento de colores, cebolla perla , carne que ud elija, guacamole y pico de gallo','{\"lP\": [{\"d\": \"Sencillo\", \"p\": \"2.99\", \"id\": \"0\"}, {\"d\": \"Embutidos\", \"p\": \"3.75\", \"id\": \"1\"}, {\"d\": \"Carne molida\", \"p\": \"3.75\", \"id\": \"2\"}, {\"d\": \"Pollo\", \"p\": \"3.75\", \"id\": \"3\"}, {\"d\": \"Chorizo paisa\", \"p\": \"3.75\", \"id\": \"4\"}, {\"d\": \"Mixto\", \"p\": \"5.99\", \"id\": \"5\"}, {\"d\": \"Texano mixto\", \"p\": \"6.5\", \"id\": \"6\"}, {\"d\": \"Vegetariano\", \"p\": \"3.75\", \"id\": \"7\"}]}',0,1,1,1,1,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F401-1597251050038.jpg',1,20,49,24,200,'Nachos','',100000,100000,'2020-04-14 22:01:19','2021-06-04 13:08:17',0),(406,44,1,1,'Cheese fries','','papas fritas con queso derretido , frejol , pimiento de colores, cebolla perla , carne que Ud elija, guacamole y pico de gallo','{\"lP\": [{\"d\": \"Vegetariano\", \"p\": \"3.75\", \"id\": \"0\"}, {\"d\": \"Sencillo\", \"p\": \"2.99\", \"id\": \"1\"}, {\"d\": \"Carne molida\", \"p\": \"3.75\", \"id\": \"2\"}, {\"d\": \"Embutidos\", \"p\": \"3.75\", \"id\": \"3\"}, {\"d\": \"Pollo\", \"p\": \"3.75\", \"id\": \"4\"}, {\"d\": \"Chorizo paisa\", \"p\": \"3.75\", \"id\": \"5\"}, {\"d\": \"Alitas bbq\", \"p\": \"6.5\", \"id\": \"6\"}, {\"d\": \"Mixto\", \"p\": \"6.5\", \"id\": \"7\"}]}',0,1,1,1,0,2.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F406-1597251062285.jpg',1,20,50,10,200,'Cheese fries','',100000,100000,'2020-04-14 22:15:37','2021-06-04 13:08:17',0),(413,44,1,1,'Nachos mix','','nachos con papas fritas y con queso derretido , frejol , pimiento de colores, cebolla perla , carne que Ud elija, guacamole y pico de gallo','{\"lP\": [{\"d\": \"Vegetariano\", \"p\": \"3.99\", \"id\": \"0\"}, {\"d\": \"Sencillo\", \"p\": \"3.0\", \"id\": \"1\"}, {\"d\": \"Carne molida\", \"p\": \"3.99\", \"id\": \"2\"}, {\"d\": \"Pollos\", \"p\": \"3.99\", \"id\": \"3\"}, {\"d\": \"Embutidos\", \"p\": \"3.99\", \"id\": \"4\"}, {\"d\": \"Chorizo\", \"p\": \"3.99\", \"id\": \"5\"}, {\"d\": \"Alitas BBQ \", \"p\": \"6.5\", \"id\": \"6\"}, {\"d\": \"Mixto\", \"p\": \"6.5\", \"id\": \"7\"}, {\"d\": \"Texano embutidos\", \"p\": \"6.75\", \"id\": \"8\"}, {\"d\": \"Texano mixto\", \"p\": \"6.75\", \"id\": \"9\"}]}',0,0,0,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F413-1597251076310.jpg',1,20,46,55,200,'Nachos mix','',100000,100000,'2020-04-14 23:07:38','2021-06-04 13:08:17',0),(418,44,1,1,'Hamburguesa 2x1 con papas fritas ','','pan de hamburguesa, queso, carne, vegetales','{\"lP\": [{\"d\": \"Clásica\", \"p\": \"5.99\", \"id\": \"0\"}, {\"d\": \"Bacon con chorizo: carne, queso, tocino, choricillo\", \"p\": \"6.5\", \"id\": \"1\"}, {\"d\": \"Latín burger: carne, queso, tocino, chorizo, huevo\", \"p\": \"7.5\", \"id\": \"2\"}, {\"d\": \"Doble: doble carne, chorizo, ? y huevo frito\", \"p\": \"7.99\", \"id\": \"3\"}]}',0,1,1,1,0,5.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F418-1597251091743.jpg',1,20,50,11,200,'Hamburguesa 2x1 con papas fritas ','',100000,100000,'2020-04-14 23:13:38','2021-06-04 13:08:17',0),(422,44,1,1,'Hot dog 2x1 con papas fritas','','Paga 1 lleva 2 con papas fritas','{\"lP\": [{\"d\": \"Sencillo\", \"p\": \"4.5\", \"id\": \"0\"}, {\"d\": \"Sencillo con tocino\", \"p\": \"5.5\", \"id\": \"1\"}, {\"d\": \"Doble\", \"p\": \"5.5\", \"id\": \"2\"}, {\"d\": \"Doble con tocino\", \"p\": \"6.5\", \"id\": \"3\"}]}',0,1,1,1,0,4.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F422-1597251108913.jpg',1,20,48,13,200,'Hot dog 2x1 con papas fritas','',100000,100000,'2020-04-14 23:18:40','2021-06-04 13:08:17',0),(425,44,1,1,'Micheladas 2x1','','Paga 1 lleva 2','{\"lP\": [{\"d\": \"Chelada\", \"p\": \"4.5\", \"id\": \"0\"}, {\"d\": \"Clásica\", \"p\": \"4.5\", \"id\": \"1\"}, {\"d\": \"Maracuyá\", \"p\": \"4.5\", \"id\": \"2\"}, {\"d\": \"Mora \", \"p\": \"4.5\", \"id\": \"3\"}, {\"d\": \"Mango\", \"p\": \"4.5\", \"id\": \"4\"}]}',0,1,1,1,0,4.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F425-1597251136597.jpg',1,20,46,4,200,'Micheladas 2x1','',100000,100000,'2020-04-14 23:22:10','2021-06-04 13:08:17',0),(429,16,1,1,'Torta de naranja','','Sabores: naranja y vainilla',NULL,0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F429-1597351451190.jpg',1,20,0,7,200,'Torta de naranja','',100000,100000,'2020-04-15 17:49:02','2021-06-04 13:08:17',0),(430,16,1,1,'Café 1 lb','','',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F430-1597351463848.jpg',1,20,20,4,200,'Café 1 lb','',100000,100000,'2020-04-15 17:49:27','2021-06-04 13:08:17',0),(431,16,1,1,'Café molido','','','{\"lP\": []}',0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F431-1597351481743.jpg',1,20,20,2,200,'Café molido','',100000,100000,'2020-04-15 17:49:38','2021-06-04 13:08:17',0),(443,46,1,1,'Pollo asado','','Incluye arroz, papas y consomé. ',NULL,0,1,1,1,0,13.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F443-1597765271211.jpg',1,20,29,191,200,'Pollo asado','',100000,100000,'2020-04-15 22:31:27','2021-06-04 13:08:17',0),(444,46,1,1,'Medio pollo','','Incluye arroz, papas y consomé. ',NULL,0,1,1,1,0,6.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F444-1597765281460.jpg',1,20,20,375,200,'Medio pollo','',100000,100000,'2020-04-15 22:31:53','2021-06-04 13:08:17',0),(445,46,1,1,'1/4 de pollo','','Incluye arroz, papas y consomé. ',NULL,0,1,1,1,0,3.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F445-1597765312393.jpg',1,20,8,287,200,'1/4 de pollo','',100000,100000,'2020-04-15 22:32:08','2021-06-04 13:08:17',0),(446,46,1,1,'1/8  pollo','','Incluye arroz, papas y consomé. ',NULL,0,1,1,1,0,2.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F446-1597765321292.jpg',1,20,45,116,200,'1/8  pollo','',100000,100000,'2020-04-15 22:35:14','2021-06-04 13:08:17',0),(447,46,1,1,'Papi pollo','','presa de pollo asado + papas fritas y salsas',NULL,0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F447-1597765330547.jpg',1,20,49,24,200,'Papi pollo','',100000,100000,'2020-04-15 22:35:27','2021-06-04 13:08:17',0),(448,46,1,1,'Porción arroz','','Porción de arroz cocido',NULL,0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F448-1597765339576.jpg',1,20,50,11,200,'Porción arroz','',100000,100000,'2020-04-15 22:35:45','2021-06-04 13:08:17',0),(449,46,1,1,'Porción papas','','Papas fritas + salsas',NULL,0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F449-1597765349287.jpg',1,20,43,47,200,'Porción papas','',100000,100000,'2020-04-15 22:35:52','2021-06-04 13:08:17',0),(450,46,1,1,'Consomé','','Sopa de pollo con especias',NULL,0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F450-1597765359685.jpg',1,20,49,39,200,'Consomé','',100000,100000,'2020-04-15 22:36:14','2021-06-04 13:08:17',0),(451,46,1,1,'Salchipapa','','Papas fritas + salchicha',NULL,0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F451-1597765370227.jpg',1,20,50,23,200,'Salchipapa','',100000,100000,'2020-04-15 22:36:33','2021-06-04 13:08:17',0),(452,2,1,1,'Umbrella Kids max 60 gr','','Protector solar especialmente diseñado para niños, muy resistente al agua, de amplio espectro.',NULL,0,1,1,1,0,14.17,'delivery-0001.appspot.com/o/op%2Fpr%2F452-1610051777523.jpg',1,20,49,2,200,'Umbrella Kids max 60 gr','',100000,100000,'2020-04-16 13:32:46','2021-06-22 15:38:11',0),(453,2,1,1,'Umbrella Kids emulsión 120 gr','','Diseñada para niños que ofrece la protección contra el sol que la piel necesita.',NULL,0,1,1,1,0,16.10,'delivery-0001.appspot.com/o/op%2Fpr%2F453-1610052069805.jpg',1,20,50,1,200,'Umbrella Kids emulsión 120 gr','',100000,100000,'2020-04-16 13:33:19','2021-06-04 13:08:17',0),(454,2,1,1,'Umbrella Intelligent SPF 100 50 gr','','Protege la piel de la radiación solar UV-B, UV-A y de los efectos nocivos de la radiación.',NULL,0,1,1,1,0,15.26,'delivery-0001.appspot.com/o/op%2Fpr%2F454-1610052669984.jpg',1,20,0,1,200,'Umbrella Intelligent SPF 100 50 gr','',100000,100000,'2020-04-16 13:33:45','2021-06-04 13:08:17',0),(455,2,1,1,'Umbrella Intelligent Fluido 50 gr','','Protector solar en emulsión ultra fluida, con textura ligera y apariencia invisible en la aplicación.',NULL,0,1,1,1,0,15.96,'delivery-0001.appspot.com/o/op%2Fpr%2F455-1610052724303.jpg',1,20,49,1,200,'Umbrella Intelligent Fluido 50 gr','',100000,100000,'2020-04-16 13:34:19','2021-06-04 13:08:17',0),(456,2,1,1,'Umbrella Gel 50+ 60g','','Actua contra las radiaciones en el rango UVA/UVB visible e infrarroja.',NULL,0,1,1,1,0,15.27,'delivery-0001.appspot.com/o/op%2Fpr%2F456-1610053210701.jpg',1,20,100,0,200,'Umbrella Gel 50+ 60g','',100000,100000,'2020-04-16 13:38:43','2021-06-04 13:08:17',0),(457,2,1,1,'Umbrella Crema 50 +','','Contiene vitamina E, vitamina antioxidante que neutraliza la agresión de los radicales libres.',NULL,0,1,1,1,0,15.27,'delivery-0001.appspot.com/o/op%2Fpr%2F457-1610053675011.jpg',1,20,50,0,200,'Umbrella Crema 50 +','',100000,100000,'2020-04-16 13:39:07','2021-06-04 13:08:17',0),(458,2,1,1,'Pliance Protector Solar en Emulsión','','Protector solar ideal para prevenir y tratar la piel mixta a seca.',NULL,0,1,1,1,0,30.53,'delivery-0001.appspot.com/o/op%2Fpr%2F458-1610373208825.jpg',1,20,50,1,200,'Pliance Protector Solar en Emulsión','',100000,100000,'2020-04-16 13:40:29','2022-07-11 19:02:47',0),(459,2,1,1,'Yeux contorno de ojos','','Emulgel diseñado para mejorar el aspecto de la zona del contorno de los ojos.',NULL,0,1,1,1,0,30.00,'delivery-0001.appspot.com/o/op%2Fpr%2F459-1610373470248.jpg',1,20,100,2,200,'Yeux contorno de ojos','',100000,100000,'2020-04-16 13:41:10','2022-07-11 19:02:47',0),(460,2,1,1,'Cebión sobre x 12 naranja','','Fortalece tus niveles de vitamina C con Cebión Tabletas Masticables.',NULL,0,1,1,1,0,3.20,'delivery-0001.appspot.com/o/op%2Fpr%2F460-1610746292764.jpg',1,20,50,1,200,'Cebión sobre x 12 naranja','',100000,100000,'2020-04-16 13:42:35','2021-06-22 15:38:11',0),(461,2,1,1,'Diclofenaco gel 1% 50gr Genfar','','Alivio local del dolor y la inflamación leves, pequeñas contusiones, golpes, distensiones.',NULL,0,1,1,1,0,6.08,'delivery-0001.appspot.com/o/op%2Fpr%2F461-1610747066493.jpg',1,20,50,2,200,'Diclofenaco gel 1% 50gr Genfar','',100000,100000,'2020-04-16 13:43:24','2021-06-04 13:08:17',0),(462,2,1,1,'Hidrolágeno Hidrolizado naranja sobres','','Se usa para tratar la artritis y la artrosis.',NULL,0,1,1,1,0,76.80,'delivery-0001.appspot.com/o/op%2Fpr%2F462-1610747249006.jpg',1,20,100,0,200,'Hidrolágeno Hidrolizado naranja sobres','',100000,100000,'2020-04-16 13:44:04','2021-06-04 13:08:17',0),(463,2,1,1,'Irbesartan 150 mg tabletas','','Relaja los vasos sanguíneos y reduce la presión arterial.',NULL,0,1,1,1,0,12.60,'delivery-0001.appspot.com/o/op%2Fpr%2F463-1610747875670.jpg',1,20,50,0,200,'Irbesartan 150 mg tabletas','',100000,100000,'2020-04-16 13:44:53','2021-06-04 13:08:17',0),(464,2,1,1,'Kufer-Q Forte tabletas','','Indicado especialmente para la profilaxis del hígado graso.',NULL,0,1,1,1,0,33.60,'delivery-0001.appspot.com/o/op%2Fpr%2F464-1610748564612.jpg',1,20,50,0,200,'Kufer-Q Forte tabletas','',100000,100000,'2020-04-16 13:45:24','2021-06-04 13:08:17',0),(465,2,1,1,'Lactibón 3.5 Syndet barra','','Limpiador suave para uso diario en la limpieza de pieles con acné, pieles sensibles o irritadas.',NULL,0,1,1,1,0,14.65,'delivery-0001.appspot.com/o/op%2Fpr%2F465-1610749229821.jpg',1,20,50,0,200,'Lactibón 3.5 Syndet barra','',100000,100000,'2020-04-16 13:46:07','2021-06-04 13:08:17',0),(466,2,1,1,'Lactibón espuma limpiadora 160 ml','','Limpiador suave para uso diario en la limpieza de pieles con acné, pieles sensibles o irritadas.',NULL,0,1,1,1,0,22.00,'delivery-0001.appspot.com/o/op%2Fpr%2F466-1610749976941.jpg',1,20,0,3,200,'Lactibón espuma limpiadora 160 ml','',100000,100000,'2020-04-16 13:46:54','2021-06-04 13:08:17',0),(467,2,1,1,'Liparon 10 mg tabletas','','Indicado como un complemento de la dieta en el tratamiento de la hipercolesterolemia',NULL,0,1,1,1,0,50.00,'delivery-0001.appspot.com/o/op%2Fpr%2F467-1610750670342.jpg',1,20,0,0,200,'Liparon 10 mg tabletas','',100000,100000,'2020-04-16 13:47:31','2021-06-04 13:08:17',0),(468,2,1,1,'Tamsulosina 0.4 mg tabletas nifa','','se utiliza para el tratamiento de los síntomas al orinar causados por la hiperplasia benigna de próstata',NULL,0,1,1,1,0,16.00,'delivery-0001.appspot.com/o/op%2Fpr%2F468-1610751607161.jpg',1,20,50,1,200,'Tamsulosina 0.4 mg tabletas nifa','',100000,100000,'2020-04-16 13:48:18','2021-06-04 13:08:17',0),(469,2,1,1,'Vita Sweet Stevia gotas 40 ml','','Endulzante natural cero calorías, indicado para control de diabetes, sobrepeso y obesidad.',NULL,0,1,1,1,0,8.17,'delivery-0001.appspot.com/o/op%2Fpr%2F469-1610980435984.jpg',1,20,50,0,200,'Vita Sweet Stevia gotas 40 ml','',100000,100000,'2020-04-16 13:48:46','2021-06-04 13:08:17',0),(470,2,1,1,'Vita Sweet Stevia sobres x 100','','Endulzante natural cero calorías, indicado para control de diabetes, sobrepeso y obesidad.',NULL,0,1,1,1,0,4.92,'delivery-0001.appspot.com/o/op%2Fpr%2F470-1610981076980.jpg',1,20,50,0,200,'Vita Sweet Stevia sobres x 100','',100000,100000,'2020-04-16 13:49:37','2021-06-04 13:08:17',0),(471,47,1,1,'Pizza sencilla familiar','','Sabores: hawaina, embutidos, pollo champiñón, jamón y queso, salami, pepperoni, bolonnesa. multisabores, tocino. \n',NULL,0,1,1,1,0,10.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F471-1597765966646.jpg',1,20,46,8,200,'Pizza sencilla familiar','',100000,100000,'2020-04-16 17:48:33','2021-06-04 13:08:17',0),(472,47,1,1,'Pizza sencilla mediana','','Sabores: hawaina, embutidos, pollo champiñón, jamón y queso, salami, pepperoni, bolonnesa. multisabores, tocino. \n',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F472-1597765977841.jpg',1,20,42,140,200,'Pizza sencilla mediana','',100000,100000,'2020-04-16 17:48:47','2021-06-04 13:08:17',0),(473,47,1,1,'Pizza sencilla porción','','Sabores: hawaina, embutidos, pollo champiñón, jamón y queso, salami, pepperoni, bolonnesa. multisabores, tocino. \n',NULL,0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F473-1597765987577.jpg',1,20,50,4,200,'Pizza sencilla porción','',100000,100000,'2020-04-16 17:48:59','2021-06-04 13:08:17',0),(474,47,1,1,'Pizza especial familiar','','Mexicana: carne molida, tomate, jamón, jalapeños tostados. Suprema: jamón, mortadela, salami, cebolla, pimiento. Vegetariana: tomate, cebolla, pimiento, champiñones, aceitunas. Frutimile: piña, cerezas, doble queso. ',NULL,0,1,1,1,0,16.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F474-1597766002040.jpg',1,20,25,0,200,'Pizza especial familiar','',100000,100000,'2020-04-16 17:52:26','2021-06-04 13:08:17',1),(475,47,1,1,'Pizza especial mediana','','Mexicana: carne molida, tomate, jamón, jalapeños tostados. Suprema: jamón, mortadela, salami, cebolla, pimiento. Vegetariana: tomate, cebolla, pimiento, champiñones, aceitunas. Frutimile: piña, cerezas, doble queso.',NULL,0,1,1,1,0,8.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F475-1597766011995.jpg',1,20,25,3,200,'Pizza especial mediana','',100000,100000,'2020-04-16 17:52:33','2021-06-04 13:08:17',0),(476,47,1,1,'Promoción tres hamburguesas','','??',NULL,1,1,1,1,0,5.00,'delivery-0001.appspot.com/o/op%2Fpr%2F476-1608423390664.jpg',1,20,25,7,200,'Promoción tres hamburguesas','',100000,100000,'2020-04-16 17:54:53','2021-06-04 13:08:17',0),(477,47,1,1,'Super pizza','','Estofada: jamón, mortadela, salami, pollo, champiñón, doble queso. Carníbora: mortadela, salami, pepperoni, carne molida, pollo, tocino, chorizo, queso. Molle: jamón, salami, pepperoni, chorizo, aceitunas, pimiento, cebolla, queso. ',NULL,0,1,1,1,0,20.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F477-1597766035257.jpg',1,20,19,0,200,'Super pizza','',100000,100000,'2020-04-16 17:58:07','2021-06-04 13:08:17',0),(478,47,1,1,'Super pizza mediana','','Estofada: jamón, mortadela, salami, pollo, champiñón, doble queso. Carníbora: mortadela, salami, pepperoni, carne molida, pollo, tocino, chorizo, queso. Molle: jamón, salami, pepperoni, chorizo, aceitunas, pimiento, cebolla, queso. ',NULL,0,1,1,1,0,10.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F478-1597766047099.jpg',1,20,19,3,200,'Super pizza mediana','',100000,100000,'2020-04-16 17:58:19','2021-06-04 13:08:17',0),(479,47,1,1,'Super pizza porción','','Estofada: jamón, mortadela, salami, pollo, champiñón, doble queso. Carníbora: mortadela, salami, pepperoni, carne molida, pollo, tocino, chorizo, queso. Molle: jamón, salami, pepperoni, chorizo, aceitunas, pimiento, cebolla, queso. ',NULL,0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F479-1597766063230.jpg',1,20,30,2,200,'Super pizza porción','',100000,100000,'2020-04-16 17:58:32','2021-06-23 01:09:03',1),(531,15,1,1,'Galletas con chispas de chocolate','','Paquete de 10',NULL,0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F531-1597350363959.jpg',1,20,8,42,200,'Galletas con chispas de chocolate','',100000,100000,'2020-04-20 12:59:35','2021-06-04 13:08:17',0),(532,15,1,1,'Bandeja de empapizzas','','Bandeja de 4 U',NULL,0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F532-1597350373038.jpg',1,20,1,1,200,'Bandeja de empapizzas','',100000,100000,'2020-04-20 13:00:07','2021-06-04 13:08:17',0),(536,47,1,1,'Pizza familiar + pizza junior + bebida','','1 pizza  familiar, pizza junior + bebida 1 L. Sabores: pepperoni, jamón, salami','{\"lP\": [{\"d\": \"Pizza familiar + junior de jamón \", \"p\": \"12.5\", \"id\": \"0\"}, {\"d\": \"Pizza familiar + junior de salami\", \"p\": \"12.5\", \"id\": \"1\"}, {\"d\": \"Pizza familiar + junior de peperonni\", \"p\": \"12.5\", \"id\": \"2\"}]}',1,1,1,1,0,12.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F536-1597765564765.jpg',1,20,48,31,200,'Pizza familiar + pizza junior + bebida','',100000,100000,'2020-04-21 00:10:03','2021-06-04 13:08:17',0),(537,28,1,1,'Pollo entero 4 lb','','',NULL,0,0,0,1,0,5.20,'delivery-0001.appspot.com/o/rv%2Fpr%2F537-1597596977595.jpg',1,20,42,13,200,'Pollo entero 4 lb','',100000,100000,'2020-04-21 03:23:30','2021-06-04 13:08:17',0),(538,28,1,1,'Pollo entero 6.00 lb','','',NULL,0,1,1,1,0,7.80,'delivery-0001.appspot.com/o/rv%2Fpr%2F538-1597597009785.jpg',1,20,44,28,200,'Pollo entero 6.00 lb','',100000,100000,'2020-04-21 03:25:16','2021-06-04 13:08:17',0),(539,28,1,1,'Pollo entero 7.00 lb','','',NULL,0,0,0,0,0,8.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F539-1597597025338.jpg',1,20,48,3,200,'Pollo entero 7.00 lb','',100000,100000,'2020-04-21 03:25:30','2021-06-04 13:08:17',0),(540,43,1,1,'Pizza hawaiana','','Masa especial de pizza, queso mozarella y piña hawaiana. Elegir entre 4 u 8 porciones ','{\"lP\": [{\"d\": \"Pizza hawaiana 8 porciones\", \"p\": \"6.5\", \"id\": \"0\"}, {\"d\": \"Pizza hawaiana 4 porciones\", \"p\": \"4\", \"id\": \"1\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/op%2Fpr%2F540-1605628245978.jpg',1,20,49,9,200,'Pizza hawaiana','',100000,100000,'2020-04-21 03:54:51','2021-06-04 13:08:17',0),(541,43,1,1,'Pizza mix salami-pepperoni','','Masa especial de pizza, queso mozarella, salami, pepperoni. Elegir entre 4 u 8 porciones','{\"lP\": [{\"d\": \"Pizza mix salami-pepperoni 8 porciones\", \"p\": \"6.5\", \"id\": \"0\"}, {\"d\": \"Pizza mix salami-pepperoni 4  porciones\", \"p\": \"4\", \"id\": \"1\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/op%2Fpr%2F541-1605628968825.jpg',1,20,50,7,200,'Pizza mix salami-pepperoni','',100000,100000,'2020-04-21 03:55:25','2021-06-04 13:08:17',0),(542,43,1,1,'Pizza ranchera','','Salami, choclito dulce, salchica premiun, pimientos, queso mozarella derretido','{\"lP\": [{\"d\": \"Pizza ranchera 8 porciones\", \"p\": \"6.5\", \"id\": \"0\"}, {\"d\": \"Pizza ranchera 4 porciones\", \"p\": \"4\", \"id\": \"1\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/op%2Fpr%2F542-1605629258018.jpg',1,20,49,1,200,'Pizza ranchera','',100000,100000,'2020-04-21 03:55:58','2021-06-04 13:08:17',0),(571,55,1,1,'Encebollado mixto','','Encebollado de pescado con camarón, acompañado de chifles y tostado',NULL,0,1,1,1,0,5.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F571-1598843287561.jpg',1,20,50,16,200,'Encebollado mixto','',100000,100000,'2020-04-23 23:08:54','2021-06-04 13:08:17',0),(572,55,1,1,'Encebollado','','Encebollado de pescado, acompañado de chifles o tostado','{\"lP\": [{\"d\": \"Encebollado normal \", \"p\": \"3.1\", \"id\": \"0\"}, {\"d\": \"Encebollado pequeño \", \"p\": \"2.6\", \"id\": \"1\"}]}',0,1,1,1,0,3.10,'delivery-0001.appspot.com/o/rv%2Fpr%2F572-1598843298300.jpg',1,20,37,165,200,'Encebollado','',100000,100000,'2020-04-23 23:09:21','2022-07-11 19:02:47',0),(573,55,1,1,'Encebollado pequeño','','Encebollado de pescado pequeño, acompañado de chifles o tostado',NULL,0,0,0,1,0,2.60,'delivery-0001.appspot.com/o/rv%2Fpr%2F573-1597962042802.jpg',1,20,44,14,200,'Encebollado pequeño','',100000,100000,'2020-04-23 23:09:32','2021-06-04 13:08:17',0),(574,55,1,1,'Guatita','','Arroz con guatita acompañado de plátano frito ','{\"lP\": [{\"d\": \"Guatita media\", \"p\": \"2.25\", \"id\": \"0\"}, {\"d\": \"Guatita entera \", \"p\": \"2.75\", \"id\": \"1\"}]}',0,1,1,1,0,2.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F574-1598843310347.jpg',1,20,42,35,200,'Guatita','',100000,100000,'2020-04-23 23:10:17','2021-06-04 13:08:17',0),(575,55,1,1,'Guatita media','','Arroz con guatita acompañado de plátano frito ',NULL,0,0,0,1,0,2.25,'delivery-0001.appspot.com/o/rv%2Fpromo%2F575-1587694566635.jpg',1,20,50,11,200,'Guatita media','',100000,100000,'2020-04-23 23:10:26','2021-06-04 13:08:17',0),(576,55,1,1,'Bandera','','Arroz con guatita acompañado de pescado y camarón','{\"lP\": [{\"d\": \"Bandera media \", \"p\": \"4.25\", \"id\": \"0\"}, {\"d\": \"Bandera entera \", \"p\": \"6.25\", \"id\": \"1\"}]}',0,1,1,1,0,6.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F576-1598843333401.jpg',1,20,49,25,200,'Bandera','',100000,100000,'2020-04-23 23:10:47','2021-06-04 13:08:17',0),(577,55,1,1,'Bandera media','','Arroz con guatita acompañado de pescado y camarón',NULL,0,0,0,1,0,4.25,'delivery-0001.appspot.com/o/rv%2Fpromo%2F577-1587694899644.jpg',1,20,49,3,200,'Bandera media','',100000,100000,'2020-04-23 23:10:59','2021-06-04 13:08:17',0),(578,55,1,1,'Americana','','Arroz con guatita acompañado de bistec de carne','{\"lP\": [{\"d\": \"Americana media \", \"p\": \"2.75\", \"id\": \"0\"}, {\"d\": \"Americana entera \", \"p\": \"3.75\", \"id\": \"1\"}]}',0,0,1,1,0,3.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F578-1598843354387.jpg',1,20,50,13,200,'Americana','',100000,100000,'2020-04-23 23:11:47','2021-06-04 13:08:17',0),(579,55,1,1,'Americana media','','Arroz con guatita acompañado de bistec de carne',NULL,0,0,0,1,0,2.75,'delivery-0001.appspot.com/o/rv%2Fpromo%2F579-1587694934639.jpg',1,20,50,3,200,'Americana media','',100000,100000,'2020-04-23 23:12:06','2021-06-04 13:08:17',0),(580,55,1,1,'Mixta','','Arroz con guatita Acompañado de camarón o pescado','{\"lP\": [{\"d\": \"Mixta entera con camarón \", \"p\": \"5.25\", \"id\": \"0\"}, {\"d\": \"Mixta entera con pescado\", \"p\": \"5.25\", \"id\": \"1\"}, {\"d\": \"Mixta media con camarón \", \"p\": \"3.75\", \"id\": \"2\"}, {\"d\": \"Mixta media con pescado \", \"p\": \"3.75\", \"id\": \"3\"}]}',0,1,1,1,0,5.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F580-1598843371273.jpg',1,20,49,12,200,'Mixta','',100000,100000,'2020-04-23 23:12:59','2021-06-04 13:08:17',0),(581,55,1,1,'Mixta media','','Arroz con guatita Acompañado de camarón o pescado','{\"lP\": [{\"d\": \"Mixta media pescado\", \"p\": \"3.75\", \"id\": \"0\"}, {\"d\": \"Mixta media camarón \", \"p\": \"3.75\", \"id\": \"1\"}]}',0,0,0,1,0,3.75,'delivery-0001.appspot.com/o/rv%2Fpromo%2F581-1587694973902.jpg',1,20,49,7,200,'Mixta media','',100000,100000,'2020-04-23 23:13:13','2021-06-04 13:08:17',0),(582,55,1,1,'Ceviche de pescado','','Pescado, tomate, cebolla, limón acompañado de chifles ',NULL,0,0,1,1,0,5.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F582-1598843409653.jpg',1,20,50,3,200,'Ceviche de pescado','',100000,100000,'2020-04-23 23:14:03','2021-06-04 13:08:17',0),(583,55,1,1,'Ceviche de camarón','','Camarón, tomate, cebolla, limón acompañado de chifles ',NULL,0,1,1,1,0,6.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F583-1598843423133.jpg',1,20,50,8,200,'Ceviche de camarón','',100000,100000,'2020-04-23 23:15:53','2021-06-04 13:08:17',0),(584,55,1,1,'Bollo de pescado','','Bollo se plátano con maní relleno de pescado, acompañado de arroz ',NULL,0,0,1,1,0,3.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F584-1598843438574.jpg',1,20,10,11,200,'Bollo de pescado','',100000,100000,'2020-04-23 23:16:11','2021-06-04 13:08:17',0),(585,55,1,1,'Pescado frito','','Pescado frito acompañado de arroz, patacones, chifles y ensalada',NULL,0,1,1,1,0,8.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F585-1598843451688.jpg',1,20,10,4,200,'Pescado frito','',100000,100000,'2020-04-23 23:17:40','2021-06-04 13:08:17',0),(586,55,1,1,'Sudado de pescado','','Sudado de pescado o sudado mixto con plátano acompañado de arroz','{\"lP\": [{\"d\": \"Sudado mixto\", \"p\": \"10.25\", \"id\": \"0\"}, {\"d\": \"Sudado de pescado \", \"p\": \"8.25\", \"id\": \"1\"}]}',0,0,1,1,0,8.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F586-1598843469548.jpg',1,20,10,0,200,'Sudado de pescado','',100000,100000,'2020-04-23 23:18:02','2021-06-04 13:08:17',0),(587,55,1,1,'Sudado de mixto','','Sudado de pescado y camarón con plátano acompañado de arroz',NULL,0,0,0,1,0,10.25,'delivery-0001.appspot.com/o/rv%2Fpromo%2F587-1587695059402.jpg',1,20,15,0,200,'Sudado de mixto','',100000,100000,'2020-04-23 23:19:57','2021-06-04 13:08:17',0),(588,55,1,1,'Chicharrón de marisco','','Mariscos varios apanados y fritos acompañados de deditos de yuca y ensalada',NULL,0,0,1,1,0,7.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F588-1598843497780.jpg',1,20,50,3,200,'Chicharrón de marisco','',100000,100000,'2020-04-24 00:07:04','2021-06-04 13:08:17',0),(589,55,1,1,'Camarones reventados','','Camarones reventados acompañados de chifles y ensalada ',NULL,0,0,1,1,0,6.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F589-1598843509642.jpg',1,20,49,7,200,'Camarones reventados','',100000,100000,'2020-04-24 00:07:47','2021-06-04 13:08:17',0),(590,55,1,1,'Chicharrón de pescado','','Chicharrón de pescado acompañado de arroz, deditos de yuca y ensalada ',NULL,0,0,1,1,0,6.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F590-1598843522049.jpg',1,20,50,3,200,'Chicharrón de pescado','',100000,100000,'2020-04-24 00:08:29','2021-06-04 13:08:17',0),(591,55,1,1,'Sango','','Sango de camarón, pescado o mixto, acompañado de arroz y plátano maduro frito ','{\"lP\": [{\"d\": \"Sango mixto\", \"p\": \"6.25\", \"id\": \"0\"}, {\"d\": \"Sango de pescado\", \"p\": \"4.5\", \"id\": \"1\"}, {\"d\": \"Sango de camarón \", \"p\": \"4.5\", \"id\": \"2\"}]}',0,1,1,1,0,4.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F591-1598843537720.jpg',1,20,50,0,200,'Sango','',100000,100000,'2020-04-24 00:09:03','2021-06-04 13:08:17',0),(592,55,1,1,'Sango de pescado','','Sango de pescado acompañado de arroz y plátano maduro frito ',NULL,0,1,0,1,0,4.50,'delivery-0001.appspot.com/o/rv%2Fpromo%2F592-1587695306069.jpg',1,20,50,0,200,'Sango de pescado','',100000,100000,'2020-04-24 00:09:29','2021-06-04 13:08:17',0),(593,55,1,1,'Sango mixto','','Sango mixto acompañado de arroz y plátano maduro frito ',NULL,0,1,0,1,0,6.25,'delivery-0001.appspot.com/o/rv%2Fpromo%2F593-1587695321036.jpg',1,20,50,1,200,'Sango mixto','',100000,100000,'2020-04-24 00:09:44','2021-06-04 13:08:17',0),(594,55,1,1,'Arroz marinero','','Arroz con mariscos varios acompañado de chifles y cama de lechuga ',NULL,0,0,1,1,0,6.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F594-1598843578631.jpg',1,20,50,1,200,'Arroz marinero','',100000,100000,'2020-04-24 00:10:03','2021-06-04 13:08:17',0),(595,55,1,1,'Arroz con camarón','','Arroz con camarones acompañado de chifles y cama de lechuga ',NULL,0,0,1,1,0,6.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F595-1598843605994.jpg',1,20,49,1,200,'Arroz con camarón','',100000,100000,'2020-04-24 00:10:19','2021-06-04 13:08:17',0),(596,55,1,1,'Jugo de coco o tamarindo','','Vaso o jarra sabores: tamarindo o coco','{\"lP\": [{\"d\": \"Jarra jugo de tamarindo\", \"p\": \"3.25\", \"id\": \"0\"}, {\"d\": \"Jarra jugo de coco\", \"p\": \"3.25\", \"id\": \"1\"}, {\"d\": \"Vaso jugo tamarindo\", \"p\": \"0.5\", \"id\": \"2\"}, {\"d\": \"Vaso jugo de coco\", \"p\": \"0.5\", \"id\": \"3\"}]}',0,1,1,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F596-1598843616719.jpg',1,20,50,44,200,'Jugo de coco o tamarindo','',100000,100000,'2020-04-24 00:11:57','2021-06-04 13:08:17',0),(597,55,1,1,'Jarra de jugo','','sabores: tamarindo o coco','{\"lP\": [{\"d\": \"Jarra de jugo de tamarindo \", \"p\": \"3.25\", \"id\": \"0\"}, {\"d\": \"Jarra de jugo de coco\", \"p\": \"3.25\", \"id\": \"1\"}]}',0,0,0,1,0,3.25,'delivery-0001.appspot.com/o/rv%2Fpromo%2F597-1587695381928.jpg',1,20,49,3,200,'Jarra de jugo','',100000,100000,'2020-04-24 00:12:19','2021-06-04 13:08:17',0),(609,47,1,1,'Pizza mediana + pizza junior + bebida','','1 Pizza mediana, 1 pizza junior + bebida 1 L. Sabores: pepperoni, jamón, salami','{\"lP\": [{\"d\": \"Pizza mediana + pizza junior sabor jamón \", \"p\": \"7.5\", \"id\": \"0\"}, {\"d\": \"Pizza mediana + pizza junior sabor salami\", \"p\": \"7.5\", \"id\": \"1\"}, {\"d\": \"Pizza mediana + pizza junior sabor pepperonni \", \"p\": \"7.5\", \"id\": \"2\"}]}',1,1,1,1,0,7.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F609-1597765865596.jpg',1,20,38,114,200,'Pizza mediana + pizza junior + bebida','',100000,100000,'2020-04-27 18:30:16','2021-06-04 13:08:17',0),(619,58,1,1,'Café ','','',NULL,0,1,1,1,0,1.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F619-1598845449444.jpg',1,20,50,11,8,'Café ','',100000,100000,'2020-04-29 23:12:53','2021-06-04 13:08:17',0),(620,58,1,1,'Mote pillo','','',NULL,0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F620-1598845438857.jpg',1,20,50,12,7,'Mote pillo','',100000,100000,'2020-04-29 23:13:28','2021-06-04 13:08:17',0),(621,58,1,1,'Mote con chicharrón','','',NULL,0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F621-1598845429746.jpg',1,20,46,27,6,'Mote con chicharrón','',100000,100000,'2020-04-29 23:13:57','2021-06-04 13:08:17',0),(622,58,1,1,'Tigrillo tradicional','','',NULL,0,1,1,1,0,3.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F622-1598845460211.jpg',1,20,99,36,200,'Tigrillo tradicional','',100000,100000,'2020-04-29 23:14:15','2021-04-02 14:35:20',0),(623,58,1,1,'Tigrillo especial','','',NULL,0,1,1,1,0,5.20,'delivery-0001.appspot.com/o/rv%2Fpr%2F623-1598845420132.jpg',1,20,100,8,5,'Tigrillo especial','',100000,100000,'2020-04-29 23:14:35','2021-04-02 00:22:39',0),(624,58,1,1,'Empanada de verde','','',NULL,0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F624-1598845410584.jpg',1,20,99,304,4,'Empanada de verde','',100000,100000,'2020-04-29 23:14:50','2021-05-13 22:44:24',0),(625,58,1,1,'Quimbolito','','',NULL,0,1,1,1,0,1.35,'delivery-0001.appspot.com/o/rv%2Fpr%2F625-1598845472224.jpg',1,20,44,30,200,'Quimbolito','',100000,100000,'2020-04-29 23:16:54','2021-06-04 13:08:17',0),(626,58,1,1,'Humita','','',NULL,0,1,1,1,0,1.35,'delivery-0001.appspot.com/o/rv%2Fpr%2F626-1598845401653.jpg',1,20,100,116,3,'Humita','',100000,100000,'2020-04-29 23:18:02','2021-06-04 13:08:17',0),(627,58,1,1,'Bolón ','','Bolón de verde o de maduro ','{\"lP\": [{\"d\": \"Bolón de verde\", \"p\": \"1.65\", \"id\": \"0\"}, {\"d\": \"Bolón de maduro \", \"p\": \"1.65\", \"id\": \"1\"}]}',0,1,1,1,1,1.65,'delivery-0001.appspot.com/o/rv%2Fpr%2F627-1598845393027.jpg',1,20,98,114,2,'Bolón ','',100000,100000,'2020-04-29 23:18:55','2022-07-11 19:02:47',0),(628,58,1,1,'Tamal','','de pollo o chancho',NULL,0,1,1,1,0,1.35,'delivery-0001.appspot.com/o/rv%2Fpr%2F628-1598845383399.jpg',1,20,194,206,1,'Tamal','',100000,100000,'2020-04-29 23:19:39','2021-06-04 13:08:17',0),(629,47,1,1,'Combo 1','','4 hamburguesas + Gaseosa 1.14 lt',NULL,0,1,1,1,0,10.49,'delivery-0001.appspot.com/o/rv%2Fpr%2F629-1597765875733.jpg',1,20,200,0,200,'Combo 1','',100000,100000,'2020-04-30 04:00:53','2021-06-04 13:08:17',0),(630,47,1,1,'Combo 2','','2 Pizzas medianas + 2 hamburguesas sencillas + gaseosa 1.14 lt',NULL,0,0,1,1,0,14.49,'delivery-0001.appspot.com/o/rv%2Fpr%2F630-1597765886165.jpg',1,20,199,9,200,'Combo 2','',100000,100000,'2020-04-30 04:02:59','2021-06-04 13:08:17',0),(631,47,1,1,'Combo 3','','2 Lasagñas sencillas + 2 hamburguesas + gaseosa 1.14 lt',NULL,0,1,1,1,0,12.49,'delivery-0001.appspot.com/o/rv%2Fpr%2F631-1597765895380.jpg',1,20,200,4,200,'Combo 3','',100000,100000,'2020-04-30 04:14:17','2021-06-04 13:08:17',0),(632,47,1,1,'Pizza mediana + 2 hamburguesas + bebida','','1 Pizza mediana + 2 hamburguesas sencillas + gaseosa 1.14 lt',NULL,0,1,1,1,0,8.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F632-1597765907725.jpg',1,20,200,53,200,'Pizza mediana + 2 hamburguesas + bebida','',100000,100000,'2020-04-30 04:15:37','2021-06-04 13:08:17',0),(633,47,1,1,'Combo 5','','1 Pizza familiar + 2 hamburguesas sencillas + gaseosa 1.14 lt',NULL,0,1,1,1,0,14.49,'delivery-0001.appspot.com/o/rv%2Fpr%2F633-1597765935531.jpg',1,20,200,3,200,'Combo 5','',100000,100000,'2020-04-30 04:16:23','2021-06-04 13:08:17',0),(634,47,1,1,'Combo 6','','1 Pizza mediana+ lasagña + hamburguesa + gaseosa 1.14 lt',NULL,0,1,1,1,0,12.49,'delivery-0001.appspot.com/o/rv%2Fpr%2F634-1597765945922.jpg',1,20,200,10,200,'Combo 6','',100000,100000,'2020-04-30 04:22:24','2021-06-04 13:08:17',0),(635,47,1,1,'Combo 7','','1 Pizza familiar + 1 pizza mediana +1 lasagña + 1 hamburguesa +  gaseosa 1.14 lt',NULL,0,1,1,1,0,21.49,'delivery-0001.appspot.com/o/rv%2Fpr%2F635-1597765956501.jpg',1,20,100,1,200,'Combo 7','',100000,100000,'2020-04-30 04:24:56','2021-06-23 01:09:03',0),(636,28,1,1,'1/2 pollo 2.5 lb','','',NULL,0,1,1,1,0,3.40,'delivery-0001.appspot.com/o/rv%2Fpr%2F636-1597597043739.jpg',1,20,199,3,200,'1/2 pollo 2.5 lb','',100000,100000,'2020-04-30 04:42:45','2021-06-04 13:08:17',0),(637,28,1,1,'Pierna y muslo 1 lb','','',NULL,0,1,1,1,0,1.60,'delivery-0001.appspot.com/o/rv%2Fpr%2F637-1597597073305.jpg',1,20,200,37,200,'Pierna y muslo 1 lb','',100000,100000,'2020-04-30 04:43:53','2021-06-04 13:08:17',0),(638,28,1,1,'Pechuga 1 lb','','',NULL,0,1,1,1,0,1.80,'delivery-0001.appspot.com/o/rv%2Fpr%2F638-1597597083822.jpg',1,20,200,48,200,'Pechuga 1 lb','',100000,100000,'2020-04-30 04:44:32','2021-06-04 13:08:17',0),(639,28,1,1,'Pechuga fileteada','','1 lb',NULL,0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F639-1597597095326.jpg',1,20,200,67,200,'Pechuga fileteada','',100000,100000,'2020-04-30 04:47:41','2021-06-04 13:08:17',0),(640,2,1,1,'Bloqueador Solar 100 SPF','','Natures Garden 120 gr',NULL,0,1,1,1,0,16.60,'delivery-0001.appspot.com/o/op%2Fpr%2F640-1610378736622.jpg',1,20,200,0,200,'Bloqueador Solar 100 SPF','',100000,100000,'2020-04-30 22:35:58','2022-07-11 19:02:47',0),(641,2,1,1,'DCalVit reforzado tabletas','','Suplemento Alimenticio a base de Calcio y Vitamina D3',NULL,0,1,1,1,0,17.40,'delivery-0001.appspot.com/o/op%2Fpr%2F641-1610379270917.jpg',1,20,0,5,200,'DCalVit reforzado tabletas','',100000,100000,'2020-04-30 22:36:30','2022-07-11 19:02:47',0),(642,2,1,1,'HepaComplex forte tabletas','','Regenerador Hepático a base de Coenzima Q10, Silimarina y Complejo B.',NULL,0,1,1,1,0,18.60,'delivery-0001.appspot.com/o/op%2Fpr%2F642-1610379842144.jpg',1,20,199,2,200,'HepaComplex forte tabletas','',100000,100000,'2020-04-30 22:37:37','2022-07-11 19:02:47',0),(643,2,1,1,'Protector facial nanox','','Protector facial nanox ajustable.',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F643-1603491606845.jpg',1,20,200,8,200,'Protector facial nanox','',100000,100000,'2020-04-30 22:38:37','2021-06-04 13:08:17',1),(649,9,1,1,'Mega entero familiar','','1 pollo asado + medio pollo asado + papas fritas + salsas',NULL,0,1,1,1,0,18.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F649-1599024091633.jpg',1,20,200,5,200,'Mega entero familiar','',100000,100000,'2020-05-01 19:10:05','2021-06-04 13:08:17',0),(650,9,1,1,'Promocion mes de abril','','1 pollo asado + papas fritas+salsas',NULL,0,1,1,1,0,11.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F650-1599024103842.jpg',1,20,200,7,200,'Promocion mes de abril','',100000,100000,'2020-05-01 19:10:31','2021-06-04 13:08:17',0),(651,9,1,1,'Papi pollo','','Presa de pollo + papas fritas + salsas',NULL,0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F651-1599024115443.jpg',1,20,200,2,200,'Papi pollo','',100000,100000,'2020-05-01 19:22:42','2021-06-04 13:08:17',0),(654,2,1,1,'Shampoo Polimiel 600 ml','','Hidrata y restaura el cabello. Contiene nutrientes esenciales que aportan vitalidad, elasticidad y movimiento.',NULL,0,1,1,1,0,16.60,'delivery-0001.appspot.com/o/op%2Fpr%2F654-1610397537484.jpg',1,20,200,0,200,'Shampoo Polimiel 600 ml','',100000,100000,'2020-05-01 21:14:56','2022-07-11 19:02:47',0),(656,41,1,1,'2 hamburguesa sandi+papas','','ingredientes: carne, jamón, queso cheddar, tomate lechuga+papas fritas',NULL,0,1,1,1,0,6.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F656-1597622246827.jpg',1,20,200,13,200,'2 hamburguesa sandi+papas','',100000,100000,'2020-05-02 21:59:25','2021-06-04 13:08:17',0),(657,42,1,1,'Alitas','','4 unidades de alitas+papas fritas+ensalada',NULL,0,1,1,1,0,5.60,'delivery-0001.appspot.com/o/rv%2Fpr%2F657-1597624287199.jpg',1,20,200,6,200,'Alitas','',100000,100000,'2020-05-02 22:08:16','2021-06-04 13:08:17',0),(658,42,1,1,'Combo 4 - dos costillas','','1/2 libra de costilla, mote, papa frita, ensalada','{\"lP\": []}',0,1,1,1,0,14.80,'delivery-0001.appspot.com/o/rv%2Fpr%2F658-1597624296485.jpg',1,20,200,1,200,'Combo 4 - dos costillas','',100000,100000,'2020-05-02 22:20:56','2021-06-04 13:08:17',0),(659,42,1,1,'Combo 5- piqueo el fogón','','Pollo,  res, chorizo, papa frita, ensalada',NULL,0,1,1,1,0,9.05,'delivery-0001.appspot.com/o/rv%2Fpr%2F659-1597624477649.jpg',1,20,200,8,200,'Combo 5- piqueo el fogón','',100000,100000,'2020-05-02 22:28:56','2021-06-04 13:08:17',0),(660,42,1,1,'Combo 1- chorizo especial','','3 U de chorizo,  mote, ensalada',NULL,0,1,1,1,0,6.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F660-1597624488114.jpg',1,20,200,2,200,'Combo 1- chorizo especial','',100000,100000,'2020-05-02 22:33:34','2021-06-04 13:08:17',0),(686,62,1,1,'Ensalada personal','','Crema + Queso, Yogur + Granola.',NULL,0,1,1,1,0,2.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F686-1598846601460.jpg',1,20,1000,216,200,'Ensalada personal','',100000,100000,'2020-05-05 06:28:04','2021-06-04 13:08:17',0),(687,62,1,1,'Ensalada grande','','Crema + Queso, Yogur + Granola.',NULL,0,1,1,1,0,3.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F687-1598846609621.jpg',1,20,1000,86,200,'Ensalada grande','',100000,100000,'2020-05-05 06:28:04','2021-06-04 13:08:17',0),(688,62,1,1,'Sándwiches de pollo','','En Pan Integral+lechuga+tomate+pepino+mayonesa',NULL,0,1,1,1,0,2.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F688-1598846721149.jpg',1,20,1000,28,200,'Sándwiches de pollo','',100000,100000,'2020-05-05 06:28:04','2021-06-04 13:08:17',0),(689,62,1,1,'Waffle especial','','Waffle+fruta+helado+chocolate',NULL,0,1,1,1,0,3.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F689-1598846729973.jpg',1,20,1000,24,200,'Waffle especial','',100000,100000,'2020-05-05 06:28:04','2021-06-04 13:08:17',0),(690,62,1,1,'Postre porción','','Escoger:chesse Cake De Durazno, Flotatina',NULL,0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F690-1598846738980.jpg',1,20,1000,7,200,'Postre porción','',100000,100000,'2020-05-05 06:28:04','2021-06-04 13:08:17',0),(691,62,1,1,'-','','-',NULL,0,0,0,0,0,0.00,'-',1,20,1000,0,200,'-','',100000,100000,'2020-05-05 06:28:04','2021-06-04 13:08:17',0),(692,62,1,1,'-','','-',NULL,0,0,0,0,0,0.00,'-',1,20,1000,0,200,'-','',100000,100000,'2020-05-05 06:28:04','2021-06-04 13:08:17',0),(693,2,1,1,'Umbrella Perfect Skin tono oscuro','','Protegen la piel de la radiación solar UV-B, UV-A y del efecto nocivo de la radiación UV.',NULL,0,1,1,1,0,20.30,'delivery-0001.appspot.com/o/op%2Fpr%2F693-1610042411320.jpg',1,20,200,2,200,'Umbrella Perfect Skin tono oscuro','',100000,100000,'2020-05-05 17:31:16','2021-06-04 13:08:17',0),(694,2,1,1,'Umbrella Perfect Skin tono claro','','Protector solar gracias a sus ingredientes exclusivos, que protegen la piel de la radiación solar.',NULL,0,1,1,1,0,20.30,'delivery-0001.appspot.com/o/op%2Fpr%2F694-1610050018520.jpg',1,20,200,2,200,'Umbrella Perfect Skin tono claro','',100000,100000,'2020-05-05 17:32:08','2021-06-04 13:08:17',0),(695,2,1,1,'Umbrella max 100 spray uva','','Bloquea el 99% de la radiación solar. Brinda una efectiva y balanceada protección contra los rayos UVA.',NULL,0,1,1,1,0,15.68,'delivery-0001.appspot.com/o/op%2Fpr%2F695-1610051117789.jpg',1,20,200,0,200,'Umbrella max 100 spray uva','',100000,100000,'2020-05-05 17:32:59','2021-06-04 13:08:17',0),(696,43,1,1,'Pizza margarita','','Masa especial de pizza, salami, jamón, pimiento rojo y verde, queso mozarella. Elegir entre 4 u 8 porciones','{\"lP\": [{\"d\": \"Pizza margarita 8 porciones\", \"p\": \"7.5\", \"id\": \"0\"}, {\"d\": \"Pizza margarita 4 porciones\", \"p\": \"4.5\", \"id\": \"1\"}]}',0,1,1,1,0,4.50,'delivery-0001.appspot.com/o/op%2Fpr%2F696-1605629427477.jpg',1,20,200,6,200,'Pizza margarita','',100000,100000,'2020-05-06 04:08:42','2021-06-04 13:08:17',0),(697,43,1,1,'lasaña de pollo','','Incluye 4 pancitos de ajo',NULL,0,1,1,1,0,5.50,'delivery-0001.appspot.com/o/op%2Fpr%2F697-1605630494770.jpg',1,20,200,3,200,'lasaña de pollo','',100000,100000,'2020-05-06 04:09:47','2021-06-04 13:08:17',0),(703,55,1,1,'2 encebollados + camarones reventados','','2 encebollados normales + chifle + camarones reventados acompañados de deditos de yuca ',NULL,1,0,1,1,0,10.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F703-1598843644199.jpg',1,20,200,7,200,'2 encebollados + camarones reventados','',100000,100000,'2020-05-06 17:41:34','2021-06-04 13:08:17',0),(704,55,1,1,'Encebollado + ceviche  camarón + guatita','','Enncebollado normal+ chifle + ceviche de camarón + arroz con guatita ',NULL,1,0,1,1,0,9.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F704-1598843722122.jpg',1,20,200,8,200,'Encebollado + ceviche  camarón + guatita','',100000,100000,'2020-05-06 17:42:57','2021-06-04 13:08:17',0),(705,55,1,1,'Arroz marinero +  guatita + encebollado','','Arroz marinero+ arroz con  guatita + encebollado ',NULL,1,0,1,1,0,10.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F705-1598843744197.jpg',1,20,200,6,200,'Arroz marinero +  guatita + encebollado','',100000,100000,'2020-05-06 17:44:01','2021-06-04 13:08:17',0),(720,65,1,1,'Alitas+papas','','4 Alitas Brosterizadas + papas fritas + alitas ',NULL,0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F720-1598847125994.jpg',1,20,1000,9,200,'Alitas+papas','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(721,65,1,1,'Combo 1','','Hamburguesa+papas+cola',NULL,1,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F721-1598847134025.jpg',1,20,1000,41,200,'Combo 1','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(722,65,1,1,'Combo 2','','Hamburguesa Doble + papas fritas + cola',NULL,1,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F722-1598847141390.jpg',1,20,1000,31,200,'Combo 2','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(723,65,1,1,'Combo 3','','6 Alitas + papas fritas + cola',NULL,1,1,1,1,0,5.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F723-1598847151336.jpg',1,20,1000,12,200,'Combo 3','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(724,65,1,1,'Combo 4','','Pollo + menestra + arroz + ensalada + papas + hamburguesa + cola',NULL,1,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F724-1598847162618.jpg',1,20,1000,8,200,'Combo 4','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(725,65,1,1,'Lomo a la plancha','','Lomo de res  + ensalada + papas fritas',NULL,0,1,1,1,0,4.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F725-1598847172197.jpg',1,20,1000,1,200,'Lomo a la plancha','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(726,65,1,1,'Megasuprema','','Presa de pollo + carne + jamón +chorizo + papas fritad',NULL,0,1,1,1,0,4.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F726-1598847181068.jpg',1,20,1000,3,200,'Megasuprema','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(727,65,1,1,'Milanesa','','Pollo Apañado + papas fritas',NULL,0,1,1,1,0,3.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F727-1598847192686.jpg',1,20,1000,3,200,'Milanesa','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(728,65,1,1,'Papi carne','','Carne + papas fritas',NULL,0,1,1,1,0,2.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F728-1598847204764.jpg',1,20,1000,2,200,'Papi carne','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(729,65,1,1,'Pollo a la plancha','','Presa de pollo + arroz + menestra + papas fritas',NULL,0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F729-1598847216021.jpg',1,20,1000,4,200,'Pollo a la plancha','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(730,65,1,1,'Presa de pollo','','Presa de pollo + menestra + arroz + ensalada + papas ',NULL,0,1,1,1,0,5.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F730-1598847250886.jpg',1,20,1000,0,200,'Presa de pollo','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(731,65,1,1,'Suprema','','Carne + chorizo + papas + cola',NULL,0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F731-1598847261703.jpg',1,20,1000,8,200,'Suprema','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(732,65,1,1,'Papas+una alita','','Papas fritas + una alita brosterizada ',NULL,0,1,1,1,1,1.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F732-1598847272217.jpg',1,20,1000,488,200,'Papas+una alita','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(733,65,1,1,'Papas + dos alitas','','Papas fritas + dos alitas brosterizada ',NULL,0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F733-1598847281694.jpg',1,20,1000,118,200,'Papas + dos alitas','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(734,65,1,1,'Papas + 3 alitas','','Papas fritas + tres alitas brosterizadas',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F734-1598847290923.jpg',1,20,1000,49,200,'Papas + 3 alitas','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(735,65,1,1,'Papa + chorizo','','Papas fritas + chorizo',NULL,0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F735-1598847302556.jpg',1,20,1000,16,200,'Papa + chorizo','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(736,65,1,1,'Papa + salchicha + pollo','','Papas fritas + salchicha + alita de pollo ',NULL,0,1,1,1,0,2.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F736-1598847313987.jpg',1,20,1000,56,200,'Papa + salchicha + pollo','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(737,65,1,1,'Papa + huevo','','Papas fritas + huevo frito ',NULL,0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F737-1598847336472.jpg',1,20,1000,1,200,'Papa + huevo','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(738,65,1,1,'Papa + tocino + queso','','Papas fritas + tocino + queso derretido ',NULL,0,1,1,1,0,2.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F738-1598847349726.jpg',1,20,1000,9,200,'Papa + tocino + queso','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(739,65,1,1,'Salchipapa grande','','Papas fritas + salchicha ',NULL,0,1,1,1,0,1.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F739-1598847360811.jpg',1,20,1000,27,200,'Salchipapa grande','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(740,65,1,1,'Salchipapa estudiantil','','Papas fritas + salchicha ',NULL,0,1,1,1,0,0.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F740-1598847371100.jpg',1,20,1000,10,200,'Salchipapa estudiantil','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(741,65,1,1,'Salchipapa normal','','Papas fritas + salchicha ',NULL,0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F741-1598847380282.jpg',1,20,1000,17,200,'Salchipapa normal','',100000,100000,'2020-05-07 12:58:24','2021-06-04 13:08:17',0),(816,65,1,1,'Lomo + pollo + mega suprema','','Lomo de res + gaseosa familiar + papa de balde + pollo a la plancha + mega suprema + postre.',NULL,1,1,1,1,0,15.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F816-1598847118147.jpg',1,20,200,3,1,'Lomo + pollo + mega suprema','',100000,100000,'2020-05-09 19:48:48','2021-06-04 13:08:17',0),(873,69,1,1,'Guatita','','Guatita, arroz, yuca y cebolla opcional','{\"lP\": [{\"d\": \"Guatita media \", \"p\": \"2.0\", \"id\": \"0\"}, {\"d\": \"Guatita Entera\", \"p\": \"3.0\", \"id\": \"1\"}]}',0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F873-1598850385657.jpg',1,20,1000,76,200,'Guatita','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',0),(874,69,1,1,'Guatita media','','-',NULL,0,0,0,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpromo%2F874-1589179656747.jpg',1,20,1000,22,200,'Guatita media','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',0),(875,69,1,1,'Mixta','','','{\"lP\": [{\"d\": \"Mixta media\", \"p\": \"3.25\", \"id\": \"0\"}, {\"d\": \"Mixta entera \", \"p\": \"4.0\", \"id\": \"1\"}]}',0,1,1,1,0,3.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F875-1598850410827.jpg',1,20,1000,40,200,'Mixta','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',0),(876,69,1,1,'Bandera','','','{\"lP\": [{\"d\": \"Bandera media \", \"p\": \"4.0\", \"id\": \"0\"}, {\"d\": \"Bandera entera\", \"p\": \"6.0\", \"id\": \"1\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F876-1598850421830.jpg',1,20,1000,72,200,'Bandera','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',0),(877,69,1,1,'Americana','','','{\"lP\": [{\"d\": \"Americana media\", \"p\": \"3.0\", \"id\": \"0\"}, {\"d\": \"Americana entera\", \"p\": \"4.0\", \"id\": \"1\"}]}',0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F877-1598850433441.jpg',1,20,1000,34,200,'Americana','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',1),(878,69,1,1,'Caldo de bagre','','',NULL,0,1,1,1,0,3.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F878-1598850442940.jpg',1,20,1000,23,200,'Caldo de bagre','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',0),(879,69,1,1,'Salvaje','','',NULL,0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F879-1598850454757.jpg',1,20,1000,15,200,'Salvaje','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',0),(880,69,1,1,'Chaulafán','','','{\"lP\": [{\"d\": \"Chaulafán medio\", \"p\": \"4.0\", \"id\": \"0\"}, {\"d\": \"Chaulafán completo\", \"p\": \"6.0\", \"id\": \"1\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F880-1598850463547.jpg',1,20,1000,37,200,'Chaulafán','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',0),(881,69,1,1,'Camarón apanado','','',NULL,0,1,1,1,0,8.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F881-1598850476364.jpg',1,20,1000,12,200,'Camarón apanado','',100000,100000,'2020-05-11 06:32:39','2022-07-11 19:02:47',0),(882,69,1,1,'Encebollado','','','{\"lP\": [{\"d\": \"Encebollado medio\", \"p\": \"3.0\", \"id\": \"0\"}, {\"d\": \"Encebollado completo\", \"p\": \"4.0\", \"id\": \"1\"}]}',0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F882-1598850485321.jpg',1,20,1000,35,200,'Encebollado','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',0),(883,69,1,1,'Ceviche de camarón','','','{\"lP\": [{\"d\": \"Ceviche de camarón completo\", \"p\": \"9.0\", \"id\": \"0\"}, {\"d\": \"Medio ceviche de camarón\", \"p\": \"4.5\", \"id\": \"1\"}]}',0,1,1,1,0,4.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F883-1598850494802.jpg',1,20,1000,16,200,'Ceviche de camarón','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',0),(884,69,1,1,'Arroz con concha','','','{\"lP\": [{\"d\": \"Arroz con concha medio\", \"p\": \"4.0\", \"id\": \"0\"}, {\"d\": \"Arroz con concha completo\", \"p\": \"8.0\", \"id\": \"1\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F884-1598850505545.jpg',1,20,1000,6,200,'Arroz con concha','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',0),(885,69,1,1,'Arroz con camarón','','','{\"lP\": [{\"d\": \"Arroz con camarón medio\", \"p\": \"4.0\", \"id\": \"0\"}, {\"d\": \"Arroz con camarón completo\", \"p\": \"8.0\", \"id\": \"1\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F885-1598850521757.jpg',1,20,1000,18,200,'Arroz con camarón','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',0),(886,69,1,1,'Trilogía de mariscos','','',NULL,0,1,1,1,0,8.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F886-1598850541282.jpg',1,20,1000,8,200,'Trilogía de mariscos','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',0),(887,69,1,1,'Arroz marinero','','',NULL,0,1,1,1,0,8.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F887-1598850551889.jpg',1,20,1000,3,200,'Arroz marinero','',100000,100000,'2020-05-11 06:32:39','2021-06-04 13:08:17',0),(888,69,1,1,'Mixta media','','',NULL,0,0,0,1,0,3.25,'delivery-0001.appspot.com/o/rv%2Fpromo%2F888-1589207577228.jpg',1,20,200,5,200,'Mixta media','',100000,100000,'2020-05-11 14:30:22','2021-06-04 13:08:17',0),(889,69,1,1,'Bandera media','','',NULL,0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F889-1598850582088.jpg',1,20,200,17,200,'Bandera media','',100000,100000,'2020-05-11 15:13:53','2021-06-04 13:08:17',0),(890,69,1,1,'Americana media','','',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F890-1598850593184.jpg',1,20,200,7,200,'Americana media','',100000,100000,'2020-05-11 15:18:14','2021-06-04 13:08:17',0),(891,69,1,1,'Chaulafán medio','','',NULL,0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F891-1598850607629.jpg',1,20,200,16,200,'Chaulafán medio','',100000,100000,'2020-05-11 15:32:12','2021-06-04 13:08:17',0),(892,69,1,1,'Encebollado medio','','',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F892-1598850627584.jpg',1,20,200,1,200,'Encebollado medio','',100000,100000,'2020-05-11 15:36:25','2021-06-04 13:08:17',0),(893,69,1,1,'Medio ceviche de camarón','','',NULL,0,0,0,1,0,4.50,'delivery-0001.appspot.com/o/rv%2Fpromo%2F893-1589212297932.jpg',1,20,200,3,200,'Medio ceviche de camarón','',100000,100000,'2020-05-11 15:41:44','2021-06-04 13:08:17',0),(894,69,1,1,'Medio  arroz con concha','','',NULL,0,0,0,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpromo%2F894-1589212528102.jpg',1,20,200,1,200,'Medio  arroz con concha','',100000,100000,'2020-05-11 15:54:38','2021-06-04 13:08:17',0),(895,69,1,1,'Medio  arroz con camarón','','',NULL,0,0,0,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpromo%2F895-1589212651741.jpg',1,20,200,7,200,'Medio  arroz con camarón','',100000,100000,'2020-05-11 15:56:53','2021-06-04 13:08:17',0),(896,2,1,1,'AzVits reforzado tabletas','','Suplemento Alimenticio a base de Vitaminas, Ginkgo Biloba, Ginseng y Minerales.',NULL,0,1,1,1,0,17.70,'delivery-0001.appspot.com/o/op%2Fpr%2F896-1610379055263.jpg',1,20,200,0,200,'AzVits reforzado tabletas','',100000,100000,'2020-05-12 02:46:42','2022-07-11 19:02:47',0),(897,2,1,1,'Hepabett Forte tabletas','','Suplemento Alimenticio a base de Silimarina, Coenzima Q10 y Complejo B',NULL,0,1,1,1,0,17.60,'delivery-0001.appspot.com/o/op%2Fpr%2F897-1610379579405.jpg',1,20,200,1,200,'Hepabett Forte tabletas','',100000,100000,'2020-05-12 02:53:47','2022-07-11 19:02:47',0),(898,2,1,1,'Higadgras tabletas','','Suplemento Alimenticio a base de Silimarina, Coenzima Q10 y Vitaminas',NULL,0,1,1,1,0,17.60,'delivery-0001.appspot.com/o/op%2Fpr%2F898-1610380104900.jpg',1,20,200,0,200,'Higadgras tabletas','',100000,100000,'2020-05-12 02:54:55','2022-07-11 19:02:47',0),(899,2,1,1,'Omega live 3-6-9 cápsulas','','Mantiene la estructura de las células y del sistema nervioso.',NULL,0,1,1,1,0,15.60,'delivery-0001.appspot.com/o/op%2Fpr%2F899-1610386951086.jpg',1,20,200,0,200,'Omega live 3-6-9 cápsulas','',100000,100000,'2020-05-12 02:55:19','2022-07-11 19:02:47',0),(900,2,1,1,'Osteo Live tabletas','','Alivio de los síntomas de la artrosis leve a moderada.',NULL,0,1,1,1,0,27.60,'delivery-0001.appspot.com/o/op%2Fpr%2F900-1610387105787.jpg',1,20,200,0,200,'Osteo Live tabletas','',100000,100000,'2020-05-12 02:55:35','2022-07-11 19:02:47',0),(901,2,1,1,'Ovarina tabletas','','Regula desbalaces hormonales',NULL,0,1,1,1,0,18.60,'delivery-0001.appspot.com/o/op%2Fpr%2F901-1610387297462.jpg',1,20,200,0,200,'Ovarina tabletas','',100000,100000,'2020-05-12 02:56:03','2022-07-11 19:02:47',1),(902,2,1,1,'Propolis gotas 30 ml','','Indicado en casos de inflamación de amígdalas o irritación de la garganta.',NULL,0,1,1,1,0,8.57,'delivery-0001.appspot.com/o/op%2Fpr%2F902-1610387422190.jpg',1,20,200,2,200,'Propolis gotas 30 ml','',100000,100000,'2020-05-12 02:56:31','2021-06-04 13:08:17',0),(903,2,1,1,'Prostalex cápsulas','','Controla los síntomas y trastornos de la próstata inflamada.',NULL,0,1,1,1,0,18.60,'delivery-0001.appspot.com/o/op%2Fpr%2F903-1610387607887.jpg',1,20,200,1,200,'Prostalex cápsulas','',100000,100000,'2020-05-12 02:56:55','2022-07-11 19:02:47',0),(904,2,1,1,'Protein mujer vainilla 250 gr','','Suplemento más utilizado cuando el objetivo es aumentar masa muscular o hipertrofiar.',NULL,0,1,1,1,0,11.33,'delivery-0001.appspot.com/o/op%2Fpr%2F904-1610387751596.jpg',1,20,200,1,200,'Protein mujer vainilla 250 gr','',100000,100000,'2020-05-12 02:57:17','2022-07-11 19:02:47',0),(905,2,1,1,'Sábila natural 210 gr','','Proporciona beneficios sobre la piel y el cabello, contiene sustancias mucilaginosas y quercetina',NULL,0,1,1,1,0,9.72,'delivery-0001.appspot.com/o/op%2Fpr%2F905-1610387924266.jpg',1,20,200,4,200,'Sábila natural 210 gr','',100000,100000,'2020-05-14 01:59:15','2022-07-11 19:02:47',0),(906,2,1,1,'Shampoo Anticaspa 600 ml','','Es un producto para el cabello que elimina la caspa que ya se ha creado.',NULL,0,1,1,1,0,7.59,'delivery-0001.appspot.com/o/op%2Fpr%2F906-1610388176667.jpg',1,20,200,0,200,'Shampoo Anticaspa 600 ml','',100000,100000,'2020-05-14 02:01:23','2021-06-04 13:08:17',0),(907,2,1,1,'Shampoo Herbal 600 ml','','Hidrata en profundidad, otorga más brillo y cuerpo al cabello.',NULL,0,1,1,1,0,11.33,'delivery-0001.appspot.com/o/op%2Fpr%2F907-1610397315409.jpg',1,20,200,0,200,'Shampoo Herbal 600 ml','',100000,100000,'2020-05-14 02:01:59','2022-07-11 19:02:47',0),(908,70,1,1,'Típicos','','Bolón queso o chicharrón; bolón queso + bolón chicharrón + huevo + café; tigrillo; tigrillo + cecina + huevo','{\"lP\": [{\"d\": \"Bolón de chicharrón\", \"p\": \"1.0\", \"id\": \"0\"}, {\"d\": \"Bolón queso\", \"p\": \"1.0\", \"id\": \"1\"}, {\"d\": \"Combo bolón\", \"p\": \"2.9\", \"id\": \"2\"}, {\"d\": \"Tigrillo\", \"p\": \"2.5\", \"id\": \"3\"}, {\"d\": \"Combo tigrillo\", \"p\": \"4.5\", \"id\": \"4\"}]}',0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F908-1598850761774.jpg',1,20,200,39,200,'Típicos','',100000,100000,'2020-05-19 05:40:47','2021-06-04 13:08:17',0),(909,70,1,1,'Sanduches y empanadas','','Sanduches de pollo; parrillero; jamón y queso; artesanale; steak; prensados; empanadas Chilenas ','{\"lP\": [{\"d\": \"Sanduche de pollo\", \"p\": \"2.15\", \"id\": \"1\"}, {\"d\": \"Sanduche parrillero\", \"p\": \"4.6\", \"id\": \"2\"}, {\"d\": \"Sanduche parrillero\", \"p\": \"4.6\", \"id\": \"3\"}, {\"d\": \"Sanduche jamón y queso\", \"p\": \"4.6\", \"id\": \"4\"}, {\"d\": \"Sanduche artesanale\", \"p\": \"6.6\", \"id\": \"5\"}, {\"d\": \"Steak sandwich\", \"p\": \"4.6\", \"id\": \"6\"}, {\"d\": \"Prensado de queso\", \"p\": \"1.3\", \"id\": \"7\"}, {\"d\": \"Prensado mixto\", \"p\": \"1.45\", \"id\": \"8\"}, {\"d\": \"Prensado de pollo\", \"p\": \"1.45\", \"id\": \"9\"}, {\"d\": \"Empanadas chilenas\", \"p\": \"1.25\", \"id\": \"10\"}]}',0,1,1,1,0,2.15,'delivery-0001.appspot.com/o/rv%2Fpr%2F909-1598850772685.jpg',1,20,200,86,200,'Sanduches y empanadas','',100000,100000,'2020-05-19 05:54:30','2022-07-11 19:02:47',0),(910,70,1,1,'Pasta y lasaña','','Lasaña de pollo; pasta a la carbonara;  pasta a la bolognesa; pasta de pollo y champiñones.','{\"lP\": [{\"d\": \"Lasaña de pollo\", \"p\": \"4.99\", \"id\": \"0\"}, {\"d\": \"Pasta a la carbonara\", \"p\": \"4.99\", \"id\": \"1\"}, {\"d\": \"Pasta a la bolognesa\", \"p\": \"4.99\", \"id\": \"2\"}, {\"d\": \"Pasta de pollo y champiñones\", \"p\": \"4.99\", \"id\": \"3\"}]}',0,1,1,1,1,4.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F910-1598850783471.jpg',1,20,200,295,200,'Pasta y lasaña','',100000,100000,'2020-05-19 15:06:09','2021-06-04 13:08:17',0),(911,70,1,1,'Postres','','Selva negra; tres leches; tres chocolates; chesse cake De Maracuyá; Chess de Oreo Y Chocolate; Artesanale','{\"lP\": [{\"d\": \"Selva negra\", \"p\": \"1.90\", \"id\": \"1\"}, {\"d\": \"Tres leches\", \"p\": \"1.90\", \"id\": \"2\"}, {\"d\": \"chesse cake maracuyá\", \"p\": \"1.90\", \"id\": \"3\"}, {\"d\": \"Tres chocolates\", \"p\": \"1.90\", \"id\": \"4\"}]}',0,1,1,1,0,1.90,'delivery-0001.appspot.com/o/rv%2Fpr%2F911-1598850792193.jpg',1,20,200,64,200,'Postres','',100000,100000,'2020-05-19 15:46:45','2021-06-04 13:08:17',0),(912,70,1,1,'Dulces','','Mousse mix chocolates, brazo gitano, artesanale.','{\"lP\": [{\"d\": \"Mousse mix chocolate\", \"p\": \"1.90\", \"id\": \"1\"}, {\"d\": \"Brazo gitano\", \"p\": \"1.90\", \"id\": \"2\"}, {\"d\": \"Artesanale\", \"p\": \"2.0\", \"id\": \"3\"}, {\"d\": \"Fresas con crema\", \"p\": \"2.15\", \"id\": \"4\"}, {\"d\": \"Strawberry-banana cream\", \"p\": \"2.25\", \"id\": \"5\"}, {\"d\": \"Donuts\", \"p\": \"0.90\", \"id\": \"6\"}, {\"d\": \"Brownies al gelato\", \"p\": \"2.50\", \"id\": \"7\"}]}',0,1,1,1,0,1.90,'delivery-0001.appspot.com/o/rv%2Fpr%2F912-1598850802455.jpg',1,20,200,44,200,'Dulces','',100000,100000,'2020-05-19 15:54:02','2021-06-04 13:08:17',0),(913,70,1,1,'Ensaladas de frutas','','Ensalada de frutas, con crema y helado, con granola y yogurt, con queso','{\"lP\": [{\"d\": \"Ensalada de frutas\", \"p\": \"2.8\", \"id\": \"1\"}, {\"d\": \"Ensalada de frutas con crema y helado\", \"p\": \"4.2\", \"id\": \"2\"}, {\"d\": \"Ensalada de frutas con granola y yogurt\", \"p\": \"3.4\", \"id\": \"3\"}, {\"d\": \"Ensalada de frutas con queso\", \"p\": \"4.2\", \"id\": \"4\"}]}',0,1,1,1,0,2.80,'delivery-0001.appspot.com/o/rv%2Fpr%2F913-1598850812051.jpg',1,20,200,9,200,'Ensaladas de frutas','',100000,100000,'2020-05-19 20:15:44','2021-06-04 13:08:17',0),(914,70,1,1,'Pizza personal','','Sabores a elegir','{\"lP\": [{\"d\": \"Margarita\", \"p\": \"2.0\", \"id\": \"1\"}, {\"d\": \"Jamón\", \"p\": \"2.25\", \"id\": \"2\"}, {\"d\": \"Pepperoni\", \"p\": \"2.50\", \"id\": \"3\"}, {\"d\": \"MeatLovers\", \"p\": \"2.75\", \"id\": \"4\"}, {\"d\": \"Artesanale\", \"p\": \"3.0\", \"id\": \"5\"}, {\"d\": \"Pollo\", \"p\": \"2.50\", \"id\": \"6\"}, {\"d\": \"Parrillera\", \"p\": \"2.50\", \"id\": \"7\"}, {\"d\": \"Hawaianna\", \"p\": \"2.25\", \"id\": \"8\"}, {\"d\": \"Champiñones\", \"p\": \"2.50\", \"id\": \"9\"}, {\"d\": \"4 estaciones\", \"p\": \"3.25\", \"id\": \"10\"}]}',0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F914-1598850822460.jpg',1,20,200,17,200,'Pizza personal','',100000,100000,'2020-05-19 22:01:29','2021-06-04 13:08:17',0),(915,70,1,1,'Pizza pequeña','','Sabores a elegir','{\"lP\": [{\"d\": \"Margarita\", \"p\": \"4.25\", \"id\": \"1\"}, {\"d\": \"Jamón\", \"p\": \"4.80\", \"id\": \"2\"}, {\"d\": \"Pepperoni\", \"p\": \"5.35\", \"id\": \"3\"}, {\"d\": \"MeatLovers\", \"p\": \"5.85\", \"id\": \"4\"}, {\"d\": \"Artesanale\", \"p\": \"6.40\", \"id\": \"5\"}, {\"d\": \"Pollo\", \"p\": \"5.35\", \"id\": \"6\"}, {\"d\": \"Parrillera\", \"p\": \"5.35\", \"id\": \"7\"}, {\"d\": \"Hawaianna\", \"p\": \"4.80\", \"id\": \"8\"}, {\"d\": \"Champiñones\", \"p\": \"5.35\", \"id\": \"9\"}, {\"d\": \"4 estaciones\", \"p\": \"6.95\", \"id\": \"10\"}]}',0,1,1,1,0,4.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F915-1598850832467.jpg',1,20,500,26,200,'Pizza pequeña','',100000,100000,'2020-05-19 22:01:38','2021-04-29 23:43:21',0),(916,70,1,1,'Pizza mediana','','Sabores a elegir','{\"lP\": [{\"d\": \"Margarita\", \"p\": \"7.70\", \"id\": \"1\"}, {\"d\": \"Jamón\", \"p\": \"8.65\", \"id\": \"2\"}, {\"d\": \"Pepperoni\", \"p\": \"9.60\", \"id\": \"3\"}, {\"d\": \"MeatLovers\", \"p\": \"10.60\", \"id\": \"4\"}, {\"d\": \"Artesanale\", \"p\": \"11.50\", \"id\": \"5\"}, {\"d\": \"Pollo\", \"p\": \"9.60\", \"id\": \"6\"}, {\"d\": \"Parrillera\", \"p\": \"9.60\", \"id\": \"7\"}, {\"d\": \"Hawaianna\", \"p\": \"8.65\", \"id\": \"8\"}, {\"d\": \"Champiñones\", \"p\": \"9.60\", \"id\": \"9\"}, {\"d\": \"4 estaciones\", \"p\": \"12.50\", \"id\": \"10\"}]}',0,1,1,1,0,7.70,'delivery-0001.appspot.com/o/rv%2Fpr%2F916-1598850844341.jpg',1,20,200,18,200,'Pizza mediana','',100000,100000,'2020-05-19 22:02:01','2021-06-04 13:08:17',0),(917,70,1,1,'Pizza grande','','Sabores a elegir','{\"lP\": [{\"d\": \"Margarita\", \"p\": \"11.40\", \"id\": \"1\"}, {\"d\": \"Jamón\", \"p\": \"12.80\", \"id\": \"2\"}, {\"d\": \"Pepperoni\", \"p\": \"14.20\", \"id\": \"3\"}, {\"d\": \"MeatLovers\", \"p\": \"15.60\", \"id\": \"4\"}, {\"d\": \"Artesanale\", \"p\": \"17.00\", \"id\": \"5\"}, {\"d\": \"Pollo\", \"p\": \"14.20\", \"id\": \"6\"}, {\"d\": \"Parrillera\", \"p\": \"14.20\", \"id\": \"7\"}, {\"d\": \"Hawaianna\", \"p\": \"12.80\", \"id\": \"8\"}, {\"d\": \"Champiñones\", \"p\": \"14.20\", \"id\": \"9\"}, {\"d\": \"4 estaciones\", \"p\": \"18.50\", \"id\": \"10\"}]}',0,1,1,1,0,11.40,'delivery-0001.appspot.com/o/rv%2Fpr%2F917-1598850854242.jpg',1,20,200,9,200,'Pizza grande','',100000,100000,'2020-05-19 22:02:13','2021-06-04 13:08:17',0),(918,70,1,1,'Pizza extra grande','','Sabores a elegir','{\"lP\": [{\"d\": \"Margarita\", \"p\": \"16.20\", \"id\": \"1\"}, {\"d\": \"Jamón\", \"p\": \"18.25\", \"id\": \"2\"}, {\"d\": \"Pepperoni\", \"p\": \"20.25\", \"id\": \"3\"}, {\"d\": \"MeatLovers\", \"p\": \"22.25\", \"id\": \"4\"}, {\"d\": \"Artesanale\", \"p\": \"24.30\", \"id\": \"5\"}, {\"d\": \"Pollo\", \"p\": \"20.25\", \"id\": \"6\"}, {\"d\": \"Parrillera\", \"p\": \"20.25\", \"id\": \"7\"}, {\"d\": \"Hawaianna\", \"p\": \"18.25\", \"id\": \"8\"}, {\"d\": \"Champiñones\", \"p\": \"20.25\", \"id\": \"9\"}, {\"d\": \"4 estaciones\", \"p\": \"26.30\", \"id\": \"10\"}]}',0,1,1,1,0,16.20,'delivery-0001.appspot.com/o/rv%2Fpr%2F918-1598850864741.jpg',1,20,200,4,200,'Pizza extra grande','',100000,100000,'2020-05-19 22:02:27','2021-06-04 13:08:17',1),(919,70,1,1,'Brazo gitano','','Pequeño o grande','{\"lP\": [{\"d\": \"pequeño\", \"p\": \"9.00\", \"id\": \"1\"}, {\"d\": \"Grande\", \"p\": \"13.0\", \"id\": \"2\"}]}',0,1,1,1,0,9.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F919-1598850875290.jpg',1,20,200,25,200,'Brazo gitano','',100000,100000,'2020-05-19 23:32:02','2021-06-04 13:08:17',0),(920,70,1,1,'Pastel tradicional','','Pequeño, mediano o grande','{\"lP\": [{\"d\": \"Pequeño\", \"p\": \"5.75\", \"id\": \"1\"}, {\"d\": \"Mediano\", \"p\": \"9.00\", \"id\": \"2\"}, {\"d\": \"Grande\", \"p\": \"13.0\", \"id\": \"3\"}]}',0,1,1,1,0,5.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F920-1598850891292.jpg',1,20,200,12,200,'Pastel tradicional','',100000,100000,'2020-05-19 23:32:48','2021-06-04 13:08:17',0),(921,70,1,1,'Tortas especiales','','Tres leches, tres chocolates, chessecake maracuyá, mousse de oreo, selva negra, artesanale.','{\"lP\": [{\"d\": \"Tres leches\", \"p\": \"11.50\", \"id\": \"1\"}, {\"d\": \"Chessecake macaracuyá\", \"p\": \"11.50\", \"id\": \"2\"}, {\"d\": \"Mousse oreo y chocolate\", \"p\": \"11.50\", \"id\": \"3\"}, {\"d\": \"Tres chocolates\", \"p\": \"11.50\", \"id\": \"4\"}, {\"d\": \"Selva negra\", \"p\": \"11.50\", \"id\": \"5\"}, {\"d\": \"Artesanale\", \"p\": \"13.60\", \"id\": \"6\"}]}',0,1,1,1,0,11.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F921-1598850902956.jpg',1,20,200,66,200,'Tortas especiales','',100000,100000,'2020-05-19 23:35:03','2021-06-04 13:08:17',0),(922,70,1,1,'Bebidas calientes','','Cubano, Irishcoffe, Cappuccino, Mokaccino, Tinto, cafe latte, Espresso, Chocolate, Café Amore, Aguas aromáticas.','{\"lP\": [{\"d\": \"Cubano\", \"p\": \"1.5\", \"id\": \"1\"}, {\"d\": \"Irishcoffe\", \"p\": \"3.5\", \"id\": \"2\"}, {\"d\": \"Capuccino\", \"p\": \"1.7\", \"id\": \"3\"}, {\"d\": \"Mokaccino\", \"p\": \"1.8\", \"id\": \"4\"}, {\"d\": \"Tinto\", \"p\": \"0.7\", \"id\": \"5\"}, {\"d\": \"Cafe latte\", \"p\": \"1.25\", \"id\": \"6\"}, {\"d\": \"Espresso\", \"p\": \"1.25\", \"id\": \"7\"}, {\"d\": \"Chocolate\", \"p\": \"1.8\", \"id\": \"8\"}, {\"d\": \"Café amore\", \"p\": \"2.3\", \"id\": \"9\"}, {\"d\": \"té, horchata, agua aromática\", \"p\": \"0.70\", \"id\": \"10\"}]}',0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F922-1598850913857.jpg',1,20,200,22,200,'Bebidas calientes','',100000,100000,'2020-05-20 02:58:33','2021-06-04 13:08:17',0),(933,2,1,1,'Umbrella base compacta bronceado tono 5','','Protector solar de amplio espectro como base de maquillaje.',NULL,0,1,1,1,0,27.79,'delivery-0001.appspot.com/o/op%2Fpr%2F933-1610040323500.jpg',1,20,200,2,200,'Umbrella base compacta bronceado tono 5','',100000,100000,'2020-05-23 03:13:34','2021-06-04 13:08:17',0),(934,2,1,1,'Umbrella Water proof 225 gr','','Protector solar de amplio espectro resistente al agua.',NULL,0,1,1,1,0,19.25,'delivery-0001.appspot.com/o/op%2Fpr%2F934-1610040670434.jpg',1,20,200,3,200,'Umbrella Water proof 225 gr','',100000,100000,'2020-05-23 03:13:55','2021-06-04 13:08:17',0),(935,2,1,1,'Umbrella Urban Emulsión 50 gr','','Protector solar de última generación especialmente diseñado para el uso diario en ciudad.',NULL,0,1,1,1,0,16.80,'delivery-0001.appspot.com/o/op%2Fpr%2F935-1610041022071.jpg',1,20,200,0,200,'Umbrella Urban Emulsión 50 gr','',100000,100000,'2020-05-23 03:14:34','2021-06-04 13:08:17',0),(936,2,1,1,'Umbrella plus spray 30 gr mochilero','','Te permite una práctica aplicación con estuche especial para llevar en la mochila.',NULL,0,1,1,1,0,5.89,'delivery-0001.appspot.com/o/op%2Fpr%2F936-1610041294343.jpg',1,20,200,0,200,'Umbrella plus spray 30 gr mochilero','',100000,100000,'2020-05-23 03:17:37','2021-06-04 13:08:17',0),(937,2,1,1,'Umbrella plus 50+ spray 120g','','Brinda a la piel una alta protección contra la radiación ultravioleta de origen natural y artificial.',NULL,0,1,1,1,0,15.26,'delivery-0001.appspot.com/o/op%2Fpr%2F937-1610041539670.jpg',1,20,200,0,200,'Umbrella plus 50+ spray 120g','',100000,100000,'2020-05-23 03:17:46','2021-06-04 13:08:17',0),(938,2,1,1,'Umbrella piel sensible 60 gr ','','Emulsión ligera, 100% libre de filtros químicos, formulada para la piel sensible, muy seca y delicada.',NULL,0,1,1,1,0,16.80,'delivery-0001.appspot.com/o/op%2Fpr%2F938-1610042048006.jpg',1,20,200,0,200,'Umbrella piel sensible 60 gr ','',100000,100000,'2020-05-23 03:17:53','2021-06-04 13:08:17',0),(1056,87,1,1,'Muleta (x2) axilar de aluminio','','',NULL,0,1,1,1,0,26.20,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1056-1590814909576.jpg',1,20,200,0,200,'Muleta (x2) axilar de aluminio','',100000,100000,'2020-05-30 04:55:22','2021-06-04 13:08:17',0),(1057,87,1,1,'Inodoro fijo portátil','','',NULL,0,1,1,1,0,71.20,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1057-1590814921840.jpg',1,20,200,0,200,'Inodoro fijo portátil','',100000,100000,'2020-05-30 04:55:23','2021-06-04 13:08:17',0),(1058,87,1,1,'Bastón de aluminio fijo','','',NULL,0,1,1,1,0,26.25,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1058-1590814939071.jpg',1,20,200,0,200,'Bastón de aluminio fijo','',100000,100000,'2020-05-30 04:55:24','2021-06-04 13:08:17',0),(1059,87,1,1,'Andador estándar ki','','',NULL,0,1,1,1,0,36.30,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1059-1590814951202.jpg',1,20,200,0,200,'Andador estándar ki','',100000,100000,'2020-05-30 04:55:25','2021-06-04 13:08:17',0),(1060,87,1,1,'Silla de ruedas con inodoro','','',NULL,0,1,1,1,0,196.50,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1060-1590814963839.jpg',1,20,200,0,200,'Silla de ruedas con inodoro','',100000,100000,'2020-05-30 04:55:26','2021-06-04 13:08:17',0),(1061,87,1,1,'Bastón de aluminio con mango ergonómico','','',NULL,0,1,1,1,0,24.55,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1061-1590814976086.jpg',1,20,200,0,200,'Bastón de aluminio con mango ergonómico','',100000,100000,'2020-05-30 04:55:27','2021-06-04 13:08:17',0),(1062,87,1,1,'Bastón tipo cisne regulable','','',NULL,0,1,1,1,0,17.10,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1062-1590815005742.jpg',1,20,200,0,200,'Bastón tipo cisne regulable','',100000,100000,'2020-05-30 04:55:28','2021-06-04 13:08:17',0),(1063,88,1,1,'Effaclar BB Blur - ROCHE Posay','','',NULL,0,1,1,1,0,48.46,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1063-1590815604723.jpg',1,20,200,1,200,'Effaclar BB Blur - ROCHE Posay','',100000,100000,'2020-05-30 05:07:40','2021-06-04 13:08:17',0),(1064,88,1,1,'Geneskin lift ISISPHARMA','','',NULL,0,1,1,1,0,43.48,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1064-1590815617259.jpg',1,20,200,1,200,'Geneskin lift ISISPHARMA','',100000,100000,'2020-05-30 05:08:30','2021-06-04 13:08:17',0),(1065,88,1,1,'Metroruboril A.Z ISIPHARMA','','',NULL,0,1,1,1,0,19.20,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1065-1590815690936.jpg',1,20,200,0,200,'Metroruboril A.Z ISIPHARMA','',100000,100000,'2020-05-30 05:09:09','2021-06-04 13:08:17',0),(1066,88,1,1,'Sensylia ISISPHARMA 24h','','',NULL,0,1,1,1,0,15.21,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1066-1590815702323.jpg',1,20,200,0,200,'Sensylia ISISPHARMA 24h','',100000,100000,'2020-05-30 05:09:55','2021-06-04 13:08:17',0),(1067,88,1,1,'Teem derm gel sensitive','','',NULL,0,1,1,1,0,23.56,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1067-1590815713043.jpg',1,20,200,0,200,'Teem derm gel sensitive','',100000,100000,'2020-05-30 05:10:38','2021-06-04 13:08:17',0),(1074,87,1,1,'Almohada con gel theramart','','',NULL,0,1,1,1,0,72.80,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1074-1590890745505.jpg',1,20,200,0,200,'Almohada con gel theramart','',100000,100000,'2020-05-31 02:00:36','2021-06-04 13:08:17',0),(1075,87,1,1,'Masajeador con infrarrojo mg21 beurer','','',NULL,0,1,1,1,0,43.70,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1075-1590890756984.jpg',1,20,200,0,200,'Masajeador con infrarrojo mg21 beurer','',100000,100000,'2020-05-31 02:01:00','2021-06-04 13:08:17',0),(1076,87,1,1,'Masajeador con infrarojo mg70 beuerer','','',NULL,0,1,1,1,0,93.40,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1076-1590890771364.jpg',1,20,200,0,200,'Masajeador con infrarojo mg70 beuerer','',100000,100000,'2020-05-31 02:01:01','2021-06-04 13:08:17',0),(1077,87,1,1,'Nebulizador roscoe dog','','',NULL,0,1,1,1,0,65.00,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1077-1590890781074.jpg',1,20,200,0,200,'Nebulizador roscoe dog','',100000,100000,'2020-05-31 02:01:02','2021-06-04 13:08:17',0),(1078,87,1,1,'Rodillera abierta con ajuste en velcro','','',NULL,0,1,1,1,0,18.75,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1078-1590890806014.jpg',1,20,200,0,200,'Rodillera abierta con ajuste en velcro','',100000,100000,'2020-05-31 02:01:03','2021-06-04 13:08:17',0),(1079,87,1,1,'Rodillera con ajuste en neopreno','','',NULL,0,1,1,1,0,19.45,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1079-1590890819134.jpg',1,20,200,0,200,'Rodillera con ajuste en neopreno','',100000,100000,'2020-05-31 02:01:04','2021-06-04 13:08:17',0),(1080,88,1,1,'Aquaprim crema hidratante hidrisage','','',NULL,0,1,1,1,0,24.43,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1080-1590892188358.jpg',1,20,200,0,200,'Aquaprim crema hidratante hidrisage','',100000,100000,'2020-05-31 02:21:41','2021-06-04 13:08:17',0),(1081,88,1,1,'Bo2look elixir arkana','','',NULL,0,1,1,1,0,50.75,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1081-1590892198619.jpg',1,20,200,0,200,'Bo2look elixir arkana','',100000,100000,'2020-05-31 02:21:52','2021-06-04 13:08:17',0),(1082,88,1,1,'Bo2look wrinkle relaxer arkana','','',NULL,0,1,1,1,0,55.44,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1082-1590892212670.jpg',1,20,200,0,200,'Bo2look wrinkle relaxer arkana','',100000,100000,'2020-05-31 02:21:53','2021-06-04 13:08:17',0),(1083,88,1,1,'Crema hidratante biofemme','','',NULL,0,1,1,1,0,14.45,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1083-1590892222913.jpg',1,20,200,0,200,'Crema hidratante biofemme','',100000,100000,'2020-05-31 02:21:54','2021-06-04 13:08:17',0),(1084,88,1,1,'Desmaquillante bifásico de ojos biofemme','','',NULL,0,1,1,1,0,14.45,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1084-1590892236069.jpg',1,20,200,1,200,'Desmaquillante bifásico de ojos biofemme','',100000,100000,'2020-05-31 02:21:55','2021-06-22 13:24:35',0),(1085,88,1,1,'Hidrin hyalurinic noche','','',NULL,0,1,1,1,0,24.14,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1085-1590892247094.jpg',1,20,200,0,200,'Hidrin hyalurinic noche','',100000,100000,'2020-05-31 02:21:56','2021-06-04 13:08:17',0),(1086,88,1,1,'Hydrin hyalurinic día bassa','','',NULL,0,1,1,1,0,23.92,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1086-1590892259033.jpg',1,20,200,0,200,'Hydrin hyalurinic día bassa','',100000,100000,'2020-05-31 02:21:57','2021-06-04 13:08:17',0),(1087,88,1,1,'Lumed base fluida hidrisage','','',NULL,0,1,1,1,0,29.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1087-1590892271363.jpg',1,20,200,0,200,'Lumed base fluida hidrisage','',100000,100000,'2020-05-31 02:21:57','2021-06-04 13:08:17',0),(1088,88,1,1,'Pliance base compacta hidrisage','','',NULL,0,1,1,1,0,27.47,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1088-1590892281765.jpg',1,20,200,0,200,'Pliance base compacta hidrisage','',100000,100000,'2020-05-31 02:21:59','2021-06-04 13:08:17',0),(1089,88,1,1,'Rejuvenating serum biofenme','','',NULL,0,1,1,1,0,22.10,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1089-1590892292489.jpg',1,20,200,0,200,'Rejuvenating serum biofenme','',100000,100000,'2020-05-31 02:22:00','2021-06-04 13:08:17',0),(1090,88,1,1,'Rpr elixir arkana','','',NULL,0,1,1,1,0,51.87,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1090-1590892303025.jpg',1,20,200,0,200,'Rpr elixir arkana','',100000,100000,'2020-05-31 02:22:01','2021-06-04 13:08:17',0),(1091,88,1,1,'Velvet su creen protector en gel','','',NULL,0,1,1,1,0,26.72,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1091-1590892312158.jpg',1,20,200,0,200,'Velvet su creen protector en gel','',100000,100000,'2020-05-31 02:29:22','2021-06-04 13:08:17',0),(1092,97,1,1,'Super nachos','','Nachos con queso derretido, pimientos de colores, cebolla perla, frejol negro, carne a su elección y guacamole','{\"lP\": [{\"d\": \"Super Nachos Carnita 2x1\", \"p\": \"5.5\", \"id\": \"0\"}, {\"d\": \"Super nachos texano mixto\", \"p\": \"6.25\", \"id\": \"1\"}, {\"d\": \"Super nachos texano (pollo o carne) \", \"p\": \"5.75\", \"id\": \"2\"}, {\"d\": \"Super nachos Alitas picantes \", \"p\": \"5.75\", \"id\": \"3\"}, {\"d\": \"Super nachos Alitas BBQ\", \"p\": \"5.25\", \"id\": \"4\"}, {\"d\": \"Super nachos costillas BBQ\", \"p\": \"5.25\", \"id\": \"5\"}, {\"d\": \"Super nachos mixto\", \"p\": \"5.25\", \"id\": \"6\"}, {\"d\": \"Super nachos pastor \", \"p\": \"4.75\", \"id\": \"7\"}, {\"d\": \"Super nachos vegetariano\", \"p\": \"3.75\", \"id\": \"8\"}, {\"d\": \"Super nachos chorizo paisa\", \"p\": \"3.75\", \"id\": \"9\"}, {\"d\": \"Super nachos pollo \", \"p\": \"3.75\", \"id\": \"10\"}, {\"d\": \"Super nachos sencillo\", \"p\": \"2.25\", \"id\": \"11\"}, {\"d\": \"Super nachos carnita\", \"p\": \"3.25\", \"id\": \"12\"}, {\"d\": \"Super nachos triple queso\", \"p\": \"3.75\", \"id\": \"13\"}]}',0,1,1,1,0,2.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1092-1598851610830.jpg',1,20,1000,43,200,'Super nachos','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1093,97,1,1,'Tacos','','Tortilla de maíz o trigo, frejol negro, carne a su elección y guacamole','{\"lP\": [{\"d\": \"Tacos de Carnita 2x1\", \"p\": \"5.0\", \"id\": \"0\"}, {\"d\": \"Tacos mixto \", \"p\": \"4.75\", \"id\": \"1\"}, {\"d\": \"Tacos pastor\", \"p\": \"4.75\", \"id\": \"2\"}, {\"d\": \"Tacos vegetariano\", \"p\": \"4.25\", \"id\": \"3\"}, {\"d\": \"Tacos de chorizo paisa\", \"p\": \"3.75\", \"id\": \"4\"}, {\"d\": \"Tacos de pollo\", \"p\": \"3.75\", \"id\": \"5\"}, {\"d\": \"Tacos de carnita\", \"p\": \"3.25\", \"id\": \"6\"}]}',0,1,1,1,0,3.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1093-1598851625937.jpg',1,20,1000,14,200,'Tacos','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1094,97,1,1,'Burritos','','Tortilla de trigo, frejol negro, pimientos de colores, cebolla perla, queso, carne a su elección y guacamole. ',NULL,0,1,1,1,0,4.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1094-1598851636075.jpg',1,20,1000,3,200,'Burritos','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1095,97,1,1,'Enchiladas ','','Tortilla de trigo, bastante queso, pimientos de colores y cebolla perla, chile, carne a su elección','{\"lP\": [{\"d\": \"Enchilada mixto \", \"p\": \"5.25\", \"id\": \"0\"}, {\"d\": \"Enchilada pastor \", \"p\": \"4.75\", \"id\": \"1\"}, {\"d\": \"Enchilada pollo \", \"p\": \"4.75\", \"id\": \"2\"}, {\"d\": \"Enchilada vegetariano\", \"p\": \"4.25\", \"id\": \"3\"}, {\"d\": \"Enchilada chorizo paisa\", \"p\": \"4.25\", \"id\": \"4\"}, {\"d\": \"Enchilada carnita \", \"p\": \"4.25\", \"id\": \"5\"}]}',0,1,1,1,0,4.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1095-1598851649701.jpg',1,20,1000,2,200,'Enchiladas ','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1096,97,1,1,'Fajitas','','3 conos en tortilla de trigo, pimientos de colores y cebolla perla, carne a su elección','{\"lP\": [{\"d\": \"Fajitas mixto \", \"p\": \"5.75\", \"id\": \"0\"}, {\"d\": \"Fajitas pastor \", \"p\": \"5.25\", \"id\": \"1\"}, {\"d\": \"Fajitas de pollo \", \"p\": \"4.75\", \"id\": \"2\"}, {\"d\": \"Fajitas vegetariano\", \"p\": \"4.25\", \"id\": \"3\"}, {\"d\": \"Fajitas de chorizo paisa\", \"p\": \"4.25\", \"id\": \"4\"}, {\"d\": \"Fajitas de carnita \", \"p\": \"4.25\", \"id\": \"5\"}]}',0,1,1,1,0,4.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1096-1598851664047.jpg',1,20,1000,2,200,'Fajitas','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1097,97,1,1,'Tostadas de alambre','','Tortilla de maíz, pasta de frejol, carne a su elección, pimientos de colores, cebolla perla y guacamole','{\"lP\": [{\"d\": \"Tostadas de alambre mixto\", \"p\": \"6.25\", \"id\": \"0\"}, {\"d\": \"Tostadas de alambre pollo\", \"p\": \"5.25\", \"id\": \"1\"}, {\"d\": \"Tostadas de alambre vegetariano\", \"p\": \"4.75\", \"id\": \"2\"}, {\"d\": \"Tostadas de alambre chorizo paisa\", \"p\": \"5.25\", \"id\": \"3\"}, {\"d\": \"Tostadas de alambre carnita\", \"p\": \"4.25\", \"id\": \"4\"}]}',0,1,1,1,0,4.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F1097-1598851677593.jpg',1,20,1000,1,200,'Tostadas de alambre','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1098,97,1,1,'Burrito crunch','','Tortilla de trigo, nachos triturados, frejol negro, pimientos colores, cebolla perla, queso, carne, guacamole','{\"lP\": [{\"d\": \"Burrito crunch pastor\", \"p\": \"5.25\", \"id\": \"0\"}, {\"d\": \"Burrito crunch mixto\", \"p\": \"5.75\", \"id\": \"1\"}, {\"d\": \"Burrito crunch full chesse\", \"p\": \"5.25\", \"id\": \"2\"}, {\"d\": \"Burrito crunch chorizo paisa\", \"p\": \"4.25\", \"id\": \"3\"}, {\"d\": \"Burrito crunch vegetariano\", \"p\": \"5.25\", \"id\": \"4\"}, {\"d\": \"Burrito crunch pollo\", \"p\": \"5.25\", \"id\": \"5\"}, {\"d\": \"Burrito crunch carnita\", \"p\": \"4.75\", \"id\": \"6\"}]}',0,1,1,1,0,4.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F1098-1598851689995.jpg',1,20,1000,2,200,'Burrito crunch','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1099,97,1,1,'Wraps','','Tortilla de trigo, queso holandés, y chedar derretido, lechuga, tomate, carne a su elección.','{\"lP\": [{\"d\": \"Wraps mixto\", \"p\": \"4.5\", \"id\": \"0\"}, {\"d\": \"Wraps pastor\", \"p\": \"4.25\", \"id\": \"1\"}, {\"d\": \"Wraps pollo\", \"p\": \"3.75\", \"id\": \"2\"}, {\"d\": \"Wraps vegetariano\", \"p\": \"3.75\", \"id\": \"3\"}, {\"d\": \"Wraps chorizo paisa\", \"p\": \"3.75\", \"id\": \"4\"}, {\"d\": \"Wraps carnita\", \"p\": \"3.25\", \"id\": \"5\"}]}',0,1,1,1,0,3.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1099-1598851701917.jpg',1,20,1000,1,200,'Wraps','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1100,97,1,1,'Quesadillas','','4 triángulos en tortilla de trigo, bastante queso, cebolla perla, frejol, carne a su elección y guacamole','{\"lP\": [{\"d\": \"Quesadilla mixto\", \"p\": \"6.25\", \"id\": \"0\"}, {\"d\": \"Quesadilla pollo\", \"p\": \"5.75\", \"id\": \"1\"}, {\"d\": \"Quesadilla vegetariano\", \"p\": \"5.25\", \"id\": \"2\"}, {\"d\": \"Quesadilla chorizo paisa\", \"p\": \"5.25\", \"id\": \"3\"}, {\"d\": \"Quesadilla carnita \", \"p\": \"5.25\", \"id\": \"4\"}]}',0,1,1,1,0,5.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1100-1598851715769.jpg',1,20,1000,2,200,'Quesadillas','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1101,97,1,1,'Piqueos','','Piqueos güerito, criollo, del charro o super macho','{\"lP\": [{\"d\": \"Supermacho: pollo, lomo, costilla, alitas, papas, nacho\", \"p\": \"14\", \"id\": \"0\"}, {\"d\": \"Charro: pollo, lomo, costilla, papas fritas y nachos\", \"p\": \"12\", \"id\": \"1\"}, {\"d\": \"Criollo: pollo, lomo, choclo,queso, papas y nachos \", \"p\": \"10\", \"id\": \"2\"}, {\"d\": \"Güerito: nachos, frejol, carne, queso, guacamole\", \"p\": \"6.5\", \"id\": \"3\"}]}',0,1,1,1,0,6.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1101-1598851732884.jpg',1,20,1000,11,200,'Piqueos','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1102,97,1,1,'Bandejitas','','Choclo asado desgranado con papas fritas, queso y la carne en cuadritos a su elección','{\"lP\": [{\"d\": \"Bandejitas super charro\", \"p\": \"7.25\", \"id\": \"0\"}, {\"d\": \"Bandejitas el charro \", \"p\": \"6.25\", \"id\": \"1\"}, {\"d\": \"Bandejitas mixta\", \"p\": \"5.75\", \"id\": \"2\"}, {\"d\": \"Bandejitas costillas \", \"p\": \"5.75\", \"id\": \"3\"}, {\"d\": \"Bandejitas criolla \", \"p\": \"5.75\", \"id\": \"4\"}, {\"d\": \"Bandejitas vegetariana \", \"p\": \"5.25\", \"id\": \"5\"}, {\"d\": \"Bandejitas de chorizo paisa \", \"p\": \"5.25\", \"id\": \"6\"}, {\"d\": \"Bandejitas de lomo de cerdo \", \"p\": \"5.25\", \"id\": \"7\"}, {\"d\": \"Bandejitas de lomo de res\", \"p\": \"5.25\", \"id\": \"8\"}, {\"d\": \"Bandejitas de pollo \", \"p\": \"5.25\", \"id\": \"9\"}]}',0,1,1,1,0,5.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1102-1598851747753.jpg',1,20,1000,7,200,'Bandejitas','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1103,97,1,1,'Alitas','','5 Alitas más papas fritas ','{\"lP\": [{\"d\": \"Alitas picantes\", \"p\": \"5.75\", \"id\": \"0\"}, {\"d\": \"Alitas teriyaki\", \"p\": \"5.25\", \"id\": \"1\"}, {\"d\": \"Alitas melimostaza \", \"p\": \"5.25\", \"id\": \"2\"}, {\"d\": \"Alitas BBQ\", \"p\": \"5.25\", \"id\": \"3\"}]}',0,1,1,1,0,5.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1103-1598851761546.jpg',1,20,1000,9,200,'Alitas','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1104,97,1,1,'Papa nachos','','Papas fritas con queso derretido, pimientos, cebolla perla, frejol negro, carne a elección, guacamole','{\"lP\": [{\"d\": \"Texano mixto\", \"p\": \"6.25\", \"id\": \"0\"}, {\"d\": \"Papa nachos texano (pollo o carne) \", \"p\": \"5.75\", \"id\": \"1\"}, {\"d\": \"Papa nachos costilla BBQ\", \"p\": \"4.75\", \"id\": \"2\"}, {\"d\": \"Papa nachos chorizo paisa \", \"p\": \"3.75\", \"id\": \"3\"}, {\"d\": \"Papa nachos mixto\", \"p\": \"4.75\", \"id\": \"4\"}, {\"d\": \"Papa nachos full chesse\", \"p\": \"3.75\", \"id\": \"5\"}, {\"d\": \"Papa nachos pollo\", \"p\": \"3.75\", \"id\": \"6\"}, {\"d\": \"Papa nachos carnita \", \"p\": \"3.25\", \"id\": \"7\"}, {\"d\": \"Papa nachos sencillo \", \"p\": \"2.25\", \"id\": \"8\"}]}',0,1,1,1,0,3.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1104-1598851773938.jpg',1,20,1000,42,200,'Papa nachos','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1105,97,1,1,'Nachos mix','','Nachos y papas fritas con queso derretido, pimientos, cebolla, frejol negro, carne a su elección y guacamole','{\"lP\": [{\"d\": \"Nachos mix texano mixto\", \"p\": \"6.25\", \"id\": \"0\"}, {\"d\": \"Nachos mix texano (pollo o carne) \", \"p\": \"5.25\", \"id\": \"1\"}, {\"d\": \"Nachos mix costillas BBQ\", \"p\": \"5.25\", \"id\": \"2\"}, {\"d\": \"Nachos mix chorizo paisa\", \"p\": \"4.25\", \"id\": \"3\"}, {\"d\": \"Nachos mix mixto\", \"p\": \"5.25\", \"id\": \"4\"}, {\"d\": \"Nachos mix full chesse\", \"p\": \"4.25\", \"id\": \"5\"}, {\"d\": \"Nachos mix pollo\", \"p\": \"4.25\", \"id\": \"6\"}, {\"d\": \"Nachos mix carnita \", \"p\": \"3.25\", \"id\": \"7\"}, {\"d\": \"Nachos mix sencillo \", \"p\": \"2.75\", \"id\": \"8\"}]}',0,1,1,1,0,2.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F1105-1598851787323.jpg',1,20,1000,41,200,'Nachos mix','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1106,97,1,1,'Micheladas','','Clásica 3.50\nMaracuya 4.00\nTamarindo 4.00\n','{\"lP\": [{\"d\": \"Michelada piña \", \"p\": \"4.0\", \"id\": \"0\"}, {\"d\": \"Michelada Tamarindo\", \"p\": \"4.0\", \"id\": \"1\"}, {\"d\": \"Michelada chelada\", \"p\": \"3.0\", \"id\": \"2\"}, {\"d\": \"Michelada chequila\", \"p\": \"5.0\", \"id\": \"3\"}, {\"d\": \"Michelada maracuyá\", \"p\": \"4.0\", \"id\": \"4\"}, {\"d\": \"Michelada diabla\", \"p\": \"4.0\", \"id\": \"5\"}, {\"d\": \"Michelada clásica \", \"p\": \"3.5\", \"id\": \"6\"}, {\"d\": \"Michelada mixta \", \"p\": \"2.0\", \"id\": \"7\"}]}',0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1106-1598851801583.jpg',1,20,1000,9,200,'Micheladas','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1107,97,1,1,'Papas fritas','','','{\"lP\": [{\"d\": \"Papa + chorizo paisa\", \"p\": \"3.0\", \"id\": \"0\"}, {\"d\": \"Papa + tocino \", \"p\": \"3.5\", \"id\": \"1\"}, {\"d\": \"Papa + 3 alitas BBQ o picantes \", \"p\": \"3.0\", \"id\": \"2\"}, {\"d\": \"Super papa charro \", \"p\": \"2.0\", \"id\": \"3\"}, {\"d\": \"Papa charro \", \"p\": \"1.5\", \"id\": \"4\"}]}',0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1107-1598851816177.jpg',1,20,1000,6,200,'Papas fritas','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1108,97,1,1,'Hot dogs','','Salchicha especial, frejol negro, nachos triturados','{\"lP\": [{\"d\": \"Hot dog chesse dog\", \"p\": \"3.5\", \"id\": \"0\"}, {\"d\": \"Hot dog super charro \", \"p\": \"2.5\", \"id\": \"1\"}, {\"d\": \"Hot dog el charro \", \"p\": \"2.0\", \"id\": \"2\"}]}',0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1108-1598851829528.jpg',1,20,1000,3,200,'Hot dogs','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1109,97,1,1,'Hamburguesa','','Todas acompañadas de papas fritas ','{\"lP\": [{\"d\": \"Hamburguesa papa charro\", \"p\": \"5.5\", \"id\": \"0\"}, {\"d\": \"Hamburguesa carne, huevo y tocino\", \"p\": \"4.0\", \"id\": \"1\"}, {\"d\": \"Hamburguesa mexicana \", \"p\": \"3.75\", \"id\": \"2\"}, {\"d\": \"Hamburguesa sencilla\", \"p\": \"3.0\", \"id\": \"3\"}]}',0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1109-1598851843715.jpg',1,20,1000,3,200,'Hamburguesa','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1110,97,1,1,'Aguas frescas ','','Refrescos de sabores varios','{\"lP\": [{\"d\": \"Agua de limonada\", \"p\": \"1.0\", \"id\": \"0\"}, {\"d\": \"Agua de coco\", \"p\": \"1.0\", \"id\": \"1\"}, {\"d\": \"Agua de jamaica\", \"p\": \"1.0\", \"id\": \"2\"}]}',0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1110-1598851857541.jpg',1,20,1000,10,200,'Aguas frescas ','',100000,100000,'2020-06-01 04:42:28','2021-06-04 13:08:17',0),(1111,97,1,1,'Burrito carne + nachos carne+ taco carne','','Burrito, nachos con guacamole, taco de carne','{\"lP\": []}',1,1,1,1,0,10.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1111-1598851911620.jpg',1,20,1000,8,200,'Burrito carne + nachos carne+ taco carne','',100000,100000,'2020-06-01 04:42:28','2021-06-22 23:45:29',0),(1134,43,1,1,'Pizza nutella','','3 tipos de chocolate, fresa y durazno, queso mozarella','{\"lP\": [{\"d\": \"Pizza 8 porciones\", \"p\": \"7.0\", \"id\": \"0\"}, {\"d\": \"Pizza cuatro porciones\", \"p\": \"4.0\", \"id\": \"1\"}]}',0,0,0,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1134-1597624900010.jpg',1,20,200,8,200,'Pizza nutella','',100000,100000,'2020-06-03 21:34:42','2021-06-04 13:08:17',0),(1135,43,1,1,'Combo pizza nutella','','Pizza cuatro porciones: 3 tipos de chocolate, fresa y durazno, queso mozarella + helado bombom.',NULL,0,0,0,1,0,5.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F1135-1597624797704.jpg',1,20,200,21,1,'Combo pizza nutella','',100000,100000,'2020-06-04 00:38:48','2021-06-04 13:08:17',0),(1138,97,1,1,'Promo dos tacos de carne','','',NULL,1,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1138-1598851570515.jpg',1,20,200,3,200,'Promo dos tacos de carne','',100000,100000,'2020-06-07 15:09:23','2021-06-04 13:08:17',0),(1139,97,1,1,'Promo dos nachos carnita','','Nachos + queso derretido + carne + frejol negro',NULL,1,1,1,1,0,5.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1139-1598851582719.jpg',1,20,200,8,200,'Promo dos nachos carnita','',100000,100000,'2020-06-07 15:09:39','2021-06-04 13:08:17',0),(1140,97,1,1,'Promo dos papa nachos de carne','','Papas fritas + carne + guacamole ',NULL,1,1,1,1,0,5.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1140-1598851599042.jpg',1,20,200,14,200,'Promo dos papa nachos de carne','',100000,100000,'2020-06-07 15:10:01','2021-06-04 13:08:17',0),(1141,97,1,1,'Promo hamburguesa sencilla+tres alitas+papas','','',NULL,1,1,1,1,0,5.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1141-1598851964484.jpg',1,20,200,2,200,'Promo hamburguesa sencilla+tres alitas+papas','',100000,100000,'2020-06-07 15:10:42','2021-06-04 13:08:17',0),(1142,97,1,1,'Promo piqueo super macho+bebida','','',NULL,1,1,1,1,0,13.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1142-1598851989262.jpg',1,20,200,0,200,'Promo piqueo super macho+bebida','',100000,100000,'2020-06-07 15:11:15','2021-06-04 13:08:17',0),(1143,97,1,1,'Promo 10 alitas BBQ+bebida','','La bebida puede ser coco o jamaica',NULL,1,1,1,1,0,8.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1143-1598852005020.jpg',1,20,200,1,200,'Promo 10 alitas BBQ+bebida','',100000,100000,'2020-06-07 15:11:54','2021-06-04 13:08:17',0),(1147,24,1,1,'Frescos de coco y mixto','','Elegir entre fresco de coco o mixto (naranja con maracuyá) ','{\"lP\": [{\"d\": \"Fresco mixto\", \"p\": \"0.5\", \"id\": \"0\"}, {\"d\": \"Fresco de coco\", \"p\": \"0.5\", \"id\": \"1\"}]}',0,1,1,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1147-1597593852741.jpg',1,50,200,152,200,'Frescos de coco y mixto','',100000,100000,'2020-06-08 22:33:21','2021-06-04 13:08:17',0),(1156,43,1,1,'Pizza cuatro estaciones','','4 sabores de pizza integrados en una sola: hawaiana, salami, jamón y pepperonni','{\"lP\": [{\"d\": \"Pizza 4 estaciones 8 porciones\", \"p\": \"7.5\", \"id\": \"0\"}, {\"d\": \"Pizza 4 estaciones 4 porciones\", \"p\": \"4.5\", \"id\": \"1\"}]}',0,1,1,1,0,4.50,'delivery-0001.appspot.com/o/op%2Fpr%2F1156-1605627909638.jpg',1,50,200,6,2,'Pizza cuatro estaciones','',100000,100000,'2020-06-10 18:57:09','2021-06-04 13:08:17',0),(1157,43,1,1,'Promo dos pizzas medianas','','2 Pizzas medianas sabores: jamón o pepperonni + bebida 750 ml, aplica de lunes a viernes',NULL,1,1,1,1,0,8.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F1157-1597625003211.jpg',1,50,200,114,200,'Promo dos pizzas medianas','',100000,100000,'2020-06-10 19:13:54','2022-07-11 19:02:47',0),(1158,43,1,1,'SUPER COMBO','','Dos pizzas medianas premium + bebida litro + nachos al horno con queso mozarella',NULL,1,0,0,1,0,11.99,'delivery-0001.appspot.com/o/op%2Fpr%2F1158-1605624832355.jpg',1,50,200,0,200,'SUPER COMBO','',100000,100000,'2020-06-10 19:17:35','2021-06-04 13:08:17',0),(1159,101,1,1,'PRESAS SOLAS KFC ','','Balde de Presas KFC solas \n(Receta:Original o Crispi)','{\"lP\": [{\"d\": \"14 Presas solas\", \"p\": \"21.5\", \"id\": \"0\"}, {\"d\": \"10 Presas solas\", \"p\": \"15.99\", \"id\": \"1\"}, {\"d\": \"7 Presas solas\", \"p\": \"11.99\", \"id\": \"2\"}]}',0,1,1,1,0,12.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1159-1591853568715.jpg',1,20,1000,1,200,'PRESAS SOLAS KFC ','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1160,101,1,1,'PROMOCIONES','','Baldes de presas y Festines \n(Receta:Original o Crispi)','{\"lP\": [{\"d\": \"Mega Festin 1 Promo (10 presas + 12 alitas)\", \"p\": \"14.99\", \"id\": \"0\"}, {\"d\": \"10 presas KFC solas promo\", \"p\": \"12.99\", \"id\": \"1\"}, {\"d\": \"15 Presas KFC solas promo\", \"p\": \"16.99\", \"id\": \"2\"}]}',0,1,1,1,0,14.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1160-1591914953361.jpg',1,20,1000,8,200,'PROMOCIONES','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1161,101,1,1,'FESTIN ALITAS','','6 presas+6 alitas picantes+1 papa frita grande + gaseosa 1.25L\n(Receta:Original o Crispi)',NULL,0,1,1,1,0,14.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1161-1592959410472.jpg',1,20,1000,3,200,'FESTIN ALITAS','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1162,101,1,1,'FESTIN ALITAS FULL','','6 presas+6 alitas picantes+1 papa frita grande+1 ensalada de col+bebida\n(Receta:Original o Crispi)',NULL,0,1,1,1,0,14.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1162-1592926174684.jpg',1,20,1000,8,200,'FESTIN ALITAS FULL','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1163,101,1,1,'FESTIN FAMILIAR 1','','8 presas+1 papa frita grande+1 ensalada de col grande + gaseosa 1.25L\n(Receta:Original o Crispi)',NULL,0,1,1,1,0,18.50,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1163-1592935477075.jpg',1,20,1000,1,200,'FESTIN FAMILIAR 1','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1164,101,1,1,'FESTIN FAMILIAR 2','','10 presas+1 papa frita grande+1 ensalada de col grande +gaseosa 2L\n(Receta:Original o Crispi)',NULL,0,1,1,1,0,20.50,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1164-1592935531248.jpg',1,20,1000,3,200,'FESTIN FAMILIAR 2','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1165,101,1,1,'FESTIN FAMILIAR 3','','12 presas+1 papa frita grande+ 1 ensalada de col grande + gaseosa de 2L\n(Receta:Original o Crispi)',NULL,0,1,1,1,0,22.50,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1165-1592935594987.jpg',1,20,1000,0,200,'FESTIN FAMILIAR 3','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1166,101,1,1,'FESTIN SIN IGUAL','','9 presas+1 papa frita grande+bebida 1.25 litros gratis\n(Receta:Original o Crispi)',NULL,0,1,1,1,0,16.50,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1166-1591853892994.jpg',1,20,1000,1,200,'FESTIN SIN IGUAL','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1167,101,1,1,'MEGA FESTIN','','12 presas+1papa grande+1ensalada col grande+2 porciones menestra+2porciones de arroz(Receta:Original o Crispi)',NULL,0,1,1,1,0,22.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1167-1591853902141.jpg',1,20,1000,0,200,'MEGA FESTIN','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1168,101,1,1,'PARTE Y COMPARTE 5 PRESAS','','5 presas+2 papas pequeñas+2bebidas 400 ml\n(Receta:Original o Crispi)',NULL,0,1,1,1,0,10.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1168-1592926833460.jpg',1,20,1000,4,200,'PARTE Y COMPARTE 5 PRESAS','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1169,101,1,1,'PARTE Y COMPARTE 2 PRESAS 2 POP MEDIANO ','','2 presas+2 popcorn mediano+2 papas fritas pequeñas+2 bebidas 400 ml\n(Receta:Original o Crispi)',NULL,0,1,1,1,0,10.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1169-1591912573337.jpg',1,20,1000,2,200,'PARTE Y COMPARTE 2 PRESAS 2 POP MEDIANO ','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1170,101,1,1,'VIERNES LOCO','','7 presas + 7 alitas picantes \n(Receta: Original o Crispi) ',NULL,0,0,0,1,0,10.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1170-1593194959947.jpg',1,20,1000,5,200,'VIERNES LOCO','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1171,101,1,1,'PARTE Y COMPARTE 3 PRESAS 6 ALITAS ','','3 presas+6 alitas picantes+2 papas fritas regulares+2 bebidas 400 ml\n(Receta:Original o Crispi)',NULL,0,1,1,1,0,10.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1171-1591853951219.jpg',1,20,1000,7,200,'PARTE Y COMPARTE 3 PRESAS 6 ALITAS ','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1172,101,1,1,'6 PRESAS','','6 presas + 3 papas pequeñas + 1 gaseosa 1.25L\n(Receta:Original o Crispi)',NULL,0,1,1,1,0,14.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1172-1593195051153.jpg',1,20,1000,1,200,'6 PRESAS','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1173,101,1,1,'MEGA FES REC 10PRE 8HOT W POP MED GAS2L ','','10 presas + 8 alitas picantes + popcorn mediano + 1bebida de 2L (Receta:Original o Crispi)',NULL,0,1,1,1,0,18.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1173-1591918016728.jpg',1,20,1000,0,200,'MEGA FES REC 10PRE 8HOT W POP MED GAS2L ','',100000,100000,'2020-06-11 05:21:22','2021-06-04 13:08:17',0),(1182,101,1,1,'MEGA FESTIN 12 PRESAS ','','Nuevo! 12 presas + 12 alitas picantes + 1 papá frita grande (PVP Normal: $31.50)\n(Receta:Original o Crispi)',NULL,0,1,1,1,0,21.50,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1182-1591917863238.jpg',1,50,200,0,200,'MEGA FESTIN 12 PRESAS ','',100000,100000,'2020-06-11 21:26:24','2021-06-04 13:08:17',0),(1183,101,1,1,'MEGA FESTIN 10 PRESAS','','Nuevo! 10 presas + 10 alitas picantes + 1 papá frita grande (PVP Normal: $26.50)\n(Receta:Original o Crispi)',NULL,0,1,1,1,0,18.50,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1183-1591916607066.jpg',1,50,200,0,200,'MEGA FESTIN 10 PRESAS','',100000,100000,'2020-06-11 21:26:26','2021-06-04 13:08:17',0),(1184,101,1,1,'MEGA FESTIN 8 PRESAS','','8 presas + 8 alitas picantes + 1 papa frita grande+gaseosa 1.25L (PVP Normal:$21.50)(Receta:Original o Crispi)',NULL,0,1,1,1,0,16.50,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1184-1592926344106.jpg',1,50,200,3,200,'MEGA FESTIN 8 PRESAS','',100000,100000,'2020-06-11 21:26:27','2021-06-04 13:08:17',0),(1185,101,1,1,'MEGA FESTIN 1 10 PRESAS 12 HOT WING','','10 presas + 12 alitas picantes\n(Receta:Original o Crispi)',NULL,0,1,1,1,0,16.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1185-1591916154054.jpg',1,50,200,0,200,'MEGA FESTIN 1 10 PRESAS 12 HOT WING','',100000,100000,'2020-06-11 21:26:28','2021-06-04 13:08:17',0),(1186,101,1,1,'BEBIDAS','','Gaseosas de 2L, 1.25L\nJugos Naturales ','{\"lP\": [{\"d\": \"Agua Natural \", \"p\": \"0.7\", \"id\": \"0\"}, {\"d\": \"Jugo de Guanabana\", \"p\": \"1.85\", \"id\": \"1\"}, {\"d\": \"Jugo de Mora\", \"p\": \"1.85\", \"id\": \"2\"}, {\"d\": \"Limonada\", \"p\": \"1.75\", \"id\": \"3\"}, {\"d\": \"Gaseosa personal 400ml\", \"p\": \"1.25\", \"id\": \"4\"}, {\"d\": \"Gaseosa 2 Litros \", \"p\": \"1.99\", \"id\": \"5\"}, {\"d\": \"Gaseosa 1.25 Litros\", \"p\": \"1.5\", \"id\": \"6\"}]}',0,1,1,1,0,1.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1186-1591915105409.jpg',1,50,200,2,200,'BEBIDAS','',100000,100000,'2020-06-11 21:26:28','2021-06-04 13:08:17',0),(1187,101,1,1,'BIG BOX','','Big Box Recargado\nBig Box 5 Estrellas \nBig Box para Mi \n(Receta:Original o Crispi)','{\"lP\": [{\"d\": \"BigBox 5estrellas(presa+2alitas+papá peq+popcorn+ensa..\", \"p\": \"6.25\", \"id\": \"0\"}, {\"d\": \"BigBox Recargado(2presas+2alitas picant+papa peq+ensa..\", \"p\": \"6.25\", \"id\": \"1\"}, {\"d\": \"BigBox para Mi(presa+hamb+papa peq+ensalcol peq+bebida)\", \"p\": \"5.25\", \"id\": \"2\"}]}',0,1,1,1,0,6.25,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1187-1591925319586.jpg',1,50,200,17,200,'BIG BOX','',100000,100000,'2020-06-12 00:05:46','2021-06-04 13:08:17',0),(1188,101,1,1,'COMBOS','','Combo Ideal\nCombo completo \nWow Box Hamburguesa \nWow Box 3 Alitas picantes (Receta:Original o Crispi)','{\"lP\": [{\"d\": \"Wow Box 3 alitas(1presa+3alitas picant+papa peq+bebida)\", \"p\": \"4.5\", \"id\": \"0\"}, {\"d\": \"Wow Box Hamburguesa(hamburguesa+1presa+papa peq+bebida)\", \"p\": \"4.75\", \"id\": \"1\"}, {\"d\": \"Combo Completo (2presas+papa peq+gaseosa400ml+moncaiba)\", \"p\": \"4.75\", \"id\": \"2\"}, {\"d\": \"Combo ideal (3presas+papa peq+gaseosa 400ml+moncaiba)\", \"p\": \"6.5\", \"id\": \"3\"}]}',0,1,1,1,0,6.50,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1188-1591924265311.jpg',1,50,200,16,200,'COMBOS','',100000,100000,'2020-06-12 00:05:48','2021-06-04 13:08:17',0),(1189,101,1,1,'COMBOS CON ARROZ','','Combos con arroz de 1 presas, 2 presas, 3 presas (Receta:Original o Crispi)','{\"lP\": [{\"d\": \"Mega Combo1 (1presa+arroz+menestra+3alitas pica+bebida)\", \"p\": \"4.25\", \"id\": \"0\"}, {\"d\": \"Mega Combo 2 (2presas+3alitas+arroz+menes+madu+bebida)\", \"p\": \"6.5\", \"id\": \"1\"}, {\"d\": \"Súper Combo 3 (3presas+arroz+menestra+maduros+bebida)\", \"p\": \"6.5\", \"id\": \"2\"}, {\"d\": \"Súper Combo 2 (2presas+arroz+menestra+maduros+bebida)\", \"p\": \"5.25\", \"id\": \"3\"}]}',0,1,1,1,0,5.25,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1189-1591922230566.jpg',1,50,200,18,200,'COMBOS CON ARROZ','',100000,100000,'2020-06-12 00:05:52','2021-06-04 13:08:17',0),(1190,101,1,1,'HAMBURGUESAS Y TWISTER ','','Hamburguesa normal\nHamburguesa Deluxe\nTwister','{\"lP\": [{\"d\": \"Hamburguesa KFC sola\", \"p\": \"1.5\", \"id\": \"0\"}, {\"d\": \"Twister solo\", \"p\": \"2.3\", \"id\": \"1\"}, {\"d\": \"Sándwich Deluxe solo\", \"p\": \"2.99\", \"id\": \"2\"}, {\"d\": \"Combo Hamburguesa (hamburguesa +papa peq+gaseosa)\", \"p\": \"3.5\", \"id\": \"3\"}, {\"d\": \"Combo Deluxe( deluxe con queso+papa peq+gaseosa)\", \"p\": \"4.5\", \"id\": \"4\"}, {\"d\": \"Combo Twister( twister+papa peq+gaseosa)\", \"p\": \"3.99\", \"id\": \"5\"}]}',0,1,1,1,0,3.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1190-1591921355762.jpg',1,50,200,11,200,'HAMBURGUESAS Y TWISTER ','',100000,100000,'2020-06-12 00:05:53','2021-06-04 13:08:17',0),(1191,101,1,1,'POPCORN ','','Popcorn','{\"lP\": [{\"d\": \"Popcorn Mediano solo\", \"p\": \"2.5\", \"id\": \"0\"}, {\"d\": \"Popcorn Familiar solo \", \"p\": \"6.99\", \"id\": \"1\"}, {\"d\": \"Combo Popcorn Mediano (popcorn med+papa peq +gaseosa)\", \"p\": \"4.25\", \"id\": \"2\"}]}',0,1,1,1,0,4.25,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1191-1591921085316.jpg',1,50,200,18,200,'POPCORN ','',100000,100000,'2020-06-12 00:05:54','2021-06-04 13:08:17',0),(1192,101,1,1,'COMPLEMENTOS','','Porciones de arroz, menestra\nPorciones de Papas\nEnsaladas de Col','{\"lP\": [{\"d\": \"Porción de Menestra\", \"p\": \"1.3\", \"id\": \"0\"}, {\"d\": \"Porción de Arroz \", \"p\": \"1.3\", \"id\": \"1\"}, {\"d\": \"Papá Frita Mediana\", \"p\": \"1.65\", \"id\": \"2\"}, {\"d\": \"Ensalada de col grande \", \"p\": \"2.85\", \"id\": \"3\"}, {\"d\": \"Ensalada de col pequeña\", \"p\": \"0.99\", \"id\": \"4\"}, {\"d\": \"Papá Grande\", \"p\": \"2.5\", \"id\": \"5\"}, {\"d\": \"2 Papas Grandes \", \"p\": \"4.0\", \"id\": \"6\"}]}',0,1,1,1,0,1.30,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1192-1592335787179.jpg',1,50,200,10,200,'COMPLEMENTOS','',100000,100000,'2020-06-12 00:05:55','2021-06-04 13:08:17',0),(1193,101,1,1,'ALITAS KFC','','Festin Pica Pica\nCombo 6 alitas picantes \nFestin 18 Alitas  picantes \nCombo 12 Alitas picantes ','{\"lP\": [{\"d\": \"Combo alitas (6alitas picantes+papa pequeña+gaseosa)\", \"p\": \"6.25\", \"id\": \"0\"}, {\"d\": \"Combo 12alitas(12alitas+papa grande+2 gaseosas 355ml)\", \"p\": \"9.99\", \"id\": \"1\"}, {\"d\": \"Festin 18alitas(18alitas+papa grande+ gaseosa  1.25L)\", \"p\": \"12.99\", \"id\": \"2\"}, {\"d\": \"Festin Pica Pica (25alitas+1papá grande+ gaseosa 1.25L)\", \"p\": \"15.99\", \"id\": \"3\"}]}',0,1,1,1,0,6.25,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1193-1592959356181.jpg',1,50,200,4,200,'ALITAS KFC','',100000,100000,'2020-06-12 01:43:39','2021-06-04 13:08:17',0),(1194,101,1,1,'MARTES LOCO ','','9 presas KFC solas (Receta:Original o Crispi)','{\"lP\": [{\"d\": \"7 presas + 7 alitas picantes + 2 papas grandes \", \"p\": \"14.99\", \"id\": \"0\"}, {\"d\": \"7 presas +7 alitas picantes +1 papa grande \", \"p\": \"13.49\", \"id\": \"1\"}, {\"d\": \"7 presas + 7alitas picantes \", \"p\": \"10.99\", \"id\": \"2\"}, {\"d\": \"9 presas + 2 papas grandes\", \"p\": \"13.99\", \"id\": \"3\"}, {\"d\": \"9 presas + 1 papa grande \", \"p\": \"12.49\", \"id\": \"4\"}, {\"d\": \"9 presas solas\", \"p\": \"9.99\", \"id\": \"5\"}]}',0,0,0,1,0,9.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1194-1593531137818.jpg',1,50,200,7,1,'MARTES LOCO ','',100000,100000,'2020-06-12 01:43:45','2021-06-04 13:08:17',0),(1207,101,1,1,'3 PRESAS 9 ALITAS','','3 presas + 9 alitas picantes + 3 papas pequeñas + gaseosa 1.25L (Receta: Original o Crispi)',NULL,0,1,1,1,0,14.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1207-1593195408978.jpg',1,50,200,0,1,'3 PRESAS 9 ALITAS','',100000,100000,'2020-06-15 23:18:20','2021-06-04 13:08:17',0),(1208,101,1,1,'3 PRESAS POPCORN FAMILIAR ','','3 presas + 1 popcorn familiar + 3 papas pequeñas + gaseosa 1.25L  (Receta: Original o Crispi)',NULL,0,1,1,1,0,14.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1208-1593195483021.jpg',1,50,200,1,2,'3 PRESAS POPCORN FAMILIAR ','',100000,100000,'2020-06-15 23:18:22','2021-06-04 13:08:17',0),(1209,104,1,1,'Pincho Mixto Res','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ','{\"lP\": [{\"d\": \"Pincho mixto con carne de cerdo, chorizo y salchicha \", \"p\": \"2.25\", \"id\": \"0\"}, {\"d\": \"Pincho mixto con carne de res, salchicha y chorizo \", \"p\": \"2.25\", \"id\": \"1\"}, {\"d\": \"Pincho mixto con carne de pollo, chorizo y salchicha \", \"p\": \"2.25\", \"id\": \"2\"}]}',0,1,1,1,0,2.25,'delivery-0001.appspot.com/o/op%2Fpr%2F1209-1617350837508.jpg',1,20,1000,48,200,'Pincho Mixto Res','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',2),(1210,104,1,1,'Pincho Mixto de Chancho ','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,2.25,'delivery-0001.appspot.com/o/op%2Fpr%2F1210-1617379359878.jpg',1,20,1000,28,200,'Pincho Mixto de Chancho ','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',1),(1211,104,1,1,'Pincho de higadilla ','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ','{\"lP\": [{\"d\": \"Chorizo parrillero\", \"p\": \"2.75\", \"id\": \"0\"}, {\"d\": \"Chorizo de ternera\", \"p\": \"2.75\", \"id\": \"1\"}, {\"d\": \"Chorizo paisa\", \"p\": \"2.75\", \"id\": \"2\"}]}',0,1,1,1,0,2.25,'delivery-0001.appspot.com/o/op%2Fpr%2F1211-1617380110192.jpg',1,20,1000,17,200,'Pincho de higadilla ','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',0),(1212,104,1,1,'Pincho de Chorizo de Ternera','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ','{\"lP\": [{\"d\": \"Filete de Res. \", \"p\": \"2.75\", \"id\": \"0\"}, {\"d\": \"Filete de chancho\", \"p\": \"3.0\", \"id\": \"1\"}, {\"d\": \"Filete de pollo\", \"p\": \"2.75\", \"id\": \"2\"}]}',0,1,1,1,0,2.75,'delivery-0001.appspot.com/o/op%2Fpr%2F1212-1617379541274.jpg',1,20,1000,28,200,'Pincho de Chorizo de Ternera','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',1),(1213,104,1,1,'Pincho de Chorizo Paisa ','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ','{\"lP\": []}',0,1,1,1,0,2.75,'delivery-0001.appspot.com/o/op%2Fpr%2F1213-1617380223741.jpg',1,20,1000,12,200,'Pincho de Chorizo Paisa ','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',0),(1214,104,1,1,'Pincho de Chorizo Parrillero ','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,2.75,'delivery-0001.appspot.com/o/op%2Fpr%2F1214-1617380361993.jpg',1,20,1000,69,200,'Pincho de Chorizo Parrillero ','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',0),(1215,104,1,1,'Pincho de Filete de Pollo','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,2.75,'delivery-0001.appspot.com/o/op%2Fpr%2F1215-1617380609156.jpg',1,20,1000,12,200,'Pincho de Filete de Pollo','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',0),(1216,104,1,1,'Pincho de Filete de Res','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ','{\"lP\": [{\"d\": \"Costilla ahumada.\", \"p\": \"6.0\", \"id\": \"0\"}, {\"d\": \"Costilla Grande \", \"p\": \"6.0\", \"id\": \"1\"}]}',0,1,1,1,0,2.75,'delivery-0001.appspot.com/o/op%2Fpr%2F1216-1617380691518.jpg',1,20,1000,11,200,'Pincho de Filete de Res','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',0),(1217,104,1,1,'Pincho de Filete de Chancho ','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1217-1617380869766.jpg',1,20,1000,7,200,'Pincho de Filete de Chancho ','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',0),(1218,104,1,1,'Pincho Mixto de pollo ','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ','{\"lP\": [{\"d\": \"15 alitas más dos porciones de papa. \", \"p\": \"12.0\", \"id\": \"0\"}, {\"d\": \"10 alitas más papa\", \"p\": \"8.0\", \"id\": \"1\"}]}',1,1,1,1,0,2.25,'delivery-0001.appspot.com/o/op%2Fpr%2F1218-1617379037849.jpg',1,20,1000,9,200,'Pincho Mixto de pollo ','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',0),(1219,104,1,1,'Pincho de Filete de Pollo con Chorizo','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ','{\"lP\": []}',0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1219-1617381101443.jpg',1,20,1000,44,200,'Pincho de Filete de Pollo con Chorizo','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',0),(1220,104,1,1,'Pincho de Filete de Res con Chorizo','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1220-1617381174570.jpg',1,20,1000,7,200,'Pincho de Filete de Res con Chorizo','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',0),(1221,104,1,1,'Pincho de Filete de chancho con Chorizo ','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1221-1617381283027.jpg',1,20,1000,10,200,'Pincho de Filete de chancho con Chorizo ','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',0),(1222,104,1,1,'Pincho de Presa de pollo','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ','{\"lP\": []}',0,1,1,1,0,2.75,'delivery-0001.appspot.com/o/op%2Fpr%2F1222-1617381405417.jpg',1,20,1000,10,200,'Pincho de Presa de pollo','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',0),(1223,104,1,1,'Cuarto de Pollo Asado','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,3.25,'delivery-0001.appspot.com/o/op%2Fpr%2F1223-1617381624155.jpg',1,20,1000,1,200,'Cuarto de Pollo Asado','',100000,100000,'2020-06-15 23:49:39','2021-06-04 13:08:17',0),(1229,105,1,1,'Pollo entero ','','Promoción bebida de 750cc. Incluye consomé, papas, arroz, ensaladas y salsas.','{\"lP\": [{\"d\": \"Pollo entero asado\", \"p\": \"17.0\", \"id\": \"0\"}, {\"d\": \"Pollo entero broster\", \"p\": \"17.0\", \"id\": \"1\"}]}',0,1,1,1,0,17.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1229-1598966289317.jpg',1,20,1000,17,200,'Pollo entero ','',100000,100000,'2020-06-16 21:29:54','2022-07-11 19:02:47',0),(1230,105,1,1,'Medio pollo','','Promoción bebida 750cc. Incluye consomé, arroz, papas, ensalada y salsas.','{\"lP\": [{\"d\": \"Medio pollo broster\", \"p\": \"8.5\", \"id\": \"0\"}, {\"d\": \"Medio pollo asado \", \"p\": \"8.5\", \"id\": \"1\"}]}',0,1,1,1,0,8.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1230-1598966296553.jpg',1,20,1000,72,200,'Medio pollo','',100000,100000,'2020-06-16 21:29:54','2022-07-11 19:02:47',1),(1231,105,1,1,'1/4 de pollo ','','Incluye consomé, papas, arroz, ensalada y salsas ','{\"lP\": [{\"d\": \"1/4 De pollo asado\", \"p\": \"4.25\", \"id\": \"0\"}, {\"d\": \"1/4 de pollo broster\", \"p\": \"4.25\", \"id\": \"1\"}]}',0,1,1,1,0,4.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1231-1598966304296.jpg',1,20,1000,43,200,'1/4 de pollo ','',100000,100000,'2020-06-16 21:29:54','2021-06-22 13:23:22',1),(1232,105,1,1,'Combo económico','','Incluye consomé, papas, arroz, salsas y bebida.','{\"lP\": [{\"d\": \"Combo económico pollo asado\", \"p\": \"3.0\", \"id\": \"0\"}, {\"d\": \"Combo económico pollo broster \", \"p\": \"3.0\", \"id\": \"1\"}]}',0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1232-1598966318065.jpg',1,20,1000,28,200,'Combo económico','',100000,100000,'2020-06-16 21:29:54','2021-06-04 13:08:17',0),(1233,105,1,1,'Combo sabrosón','','Incluye bebida, arroz, papas, y menestra ','{\"lP\": [{\"d\": \"Combo sabrosón pollo asado \", \"p\": \"2.25\", \"id\": \"0\"}, {\"d\": \"Combo sabrosón pollo broster\", \"p\": \"2.25\", \"id\": \"1\"}]}',0,1,1,1,0,2.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1233-1598966327316.jpg',1,20,1000,19,200,'Combo sabrosón','',100000,100000,'2020-06-16 21:29:54','2021-06-04 13:08:17',0),(1234,105,1,1,'Bandeja full','','Incluye pollo broster, pollo asado, salchicha, arroz, menestra, papas, ensalada y salsas.',NULL,0,1,1,1,0,13.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F1234-1598966343417.jpg',1,20,1000,2,200,'Bandeja full','',100000,100000,'2020-06-16 21:29:54','2021-06-04 13:08:17',0),(1235,105,1,1,'Hamburguesa súper','','Incluye jamón, queso, huevo, salsas y papas.',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1235-1598966362062.jpg',1,20,1000,15,200,'Hamburguesa súper','',100000,100000,'2020-06-16 21:29:54','2021-06-04 13:08:17',0),(1236,105,1,1,'Hamburguesa junior','','Incluye carne, vegetales, salsas y papas',NULL,0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1236-1598966403824.jpg',1,20,1000,9,200,'Hamburguesa junior','',100000,100000,'2020-06-16 21:29:54','2021-06-04 13:08:17',0),(1237,105,1,1,'Salchipapa','','Incluye salchicha, papas y salsas.','{\"lP\": [{\"d\": \"Salchipapa pequeña\", \"p\": \"1.0\", \"id\": \"0\"}, {\"d\": \"Salchipapa grande \", \"p\": \"1.5\", \"id\": \"1\"}]}',0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1237-1598966422374.jpg',1,20,1000,5,200,'Salchipapa','',100000,100000,'2020-06-16 21:29:54','2021-06-04 13:08:17',0),(1238,105,1,1,'Papipollo ','','Incluye pollo, papas y salsas.','{\"lP\": [{\"d\": \"Papipollo broster grande\", \"p\": \"2.0\", \"id\": \"0\"}, {\"d\": \"Papipollo broster pequeña\", \"p\": \"1.5\", \"id\": \"1\"}]}',0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1238-1598966433679.jpg',1,20,1000,39,200,'Papipollo ','',100000,100000,'2020-06-16 21:29:54','2021-06-04 13:08:17',0),(1239,105,1,1,'Bebidas','','Puede elegir entre refrescos o gaseosas.','{\"lP\": [{\"d\": \"Gaseosa 750 cc\", \"p\": \"1.0\", \"id\": \"0\"}, {\"d\": \"Refresco \", \"p\": \"0.5\", \"id\": \"1\"}]}',0,1,1,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1239-1598966444282.jpg',1,20,1000,8,200,'Bebidas','',100000,100000,'2020-06-16 21:29:54','2021-06-04 13:08:17',0),(1247,2,1,1,'Babysec Ultra M x 48','','Pañales Ultra Absorbentes',NULL,0,1,1,1,0,11.45,'delivery-0001.appspot.com/o/op%2Fpr%2F1247-1611002844949.jpg',1,50,200,0,200,'Babysec Ultra M x 48','',100000,100000,'2020-06-17 01:50:16','2022-07-11 19:02:47',0),(1248,2,1,1,'Huggies Active Sec XG x 18','','Mantiene protegido hasta por 12 horas. Más absorción y menos cambios, hipoalegénicos. Libre de Parabenos',NULL,0,1,1,1,0,8.80,'delivery-0001.appspot.com/o/op%2Fpr%2F1248-1611065999500.jpg',1,50,200,0,200,'Huggies Active Sec XG x 18','',100000,100000,'2020-06-17 01:50:17','2022-07-11 19:02:47',0),(1249,2,1,1,'Huggies pañitos Active Fresh x 96','','Están hechas con fibras naturales que limpian delicadamente la piel sensible del bebé',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1249-1611066533362.jpg',1,50,200,0,200,'Huggies pañitos Active Fresh x 96','',100000,100000,'2020-06-17 01:50:18','2022-07-11 19:02:47',0),(1250,2,1,1,'Pañalin Classic Plus P x 24','','Cubierta interna hipoalergénica que permite proteger la piel del bebé de irritaciones y mantener su piel sana',NULL,0,1,1,1,0,3.81,'delivery-0001.appspot.com/o/op%2Fpr%2F1250-1611067065159.jpg',1,50,200,0,200,'Pañalin Classic Plus P x 24','',100000,100000,'2020-06-17 01:50:19','2022-07-11 19:02:47',0),(1251,2,1,1,'Babysec Premium M x 20','','Centro súper absorbente, que permite una rápida absorción y retención de líquidos',NULL,0,1,1,1,0,6.30,'delivery-0001.appspot.com/o/op%2Fpr%2F1251-1611067430141.jpg',1,50,200,0,200,'Babysec Premium M x 20','',100000,100000,'2020-06-17 01:50:20','2021-06-04 13:08:17',0),(1252,2,1,1,'Babysec Premium P x 48','','Centro súper absorbente, que permite una rápida absorción y retención de líquidos',NULL,0,1,1,1,0,11.75,'delivery-0001.appspot.com/o/op%2Fpr%2F1252-1611068935800.jpg',1,50,200,0,200,'Babysec Premium P x 48','',100000,100000,'2020-06-17 01:50:20','2021-06-04 13:08:17',0),(1253,2,1,1,'Babysec Ultra Sec P x 24','','Su cómodo ajuste brinda mayor comodidad y libertad de movimiento',NULL,0,1,1,1,0,4.96,'delivery-0001.appspot.com/o/op%2Fpr%2F1253-1611069308047.jpg',1,50,200,0,200,'Babysec Ultra Sec P x 24','',100000,100000,'2020-06-17 01:50:21','2021-06-04 13:08:17',0),(1254,2,1,1,'Babysec Ultra Sec M x 20','','Su cómodo ajuste brinda mayor comodidad y libertad de movimiento',NULL,0,1,1,1,0,4.90,'delivery-0001.appspot.com/o/op%2Fpr%2F1254-1611069578182.jpg',1,50,200,0,200,'Babysec Ultra Sec M x 20','',100000,100000,'2020-06-17 01:50:22','2021-06-04 13:08:17',0),(1255,2,1,1,'Enguaje Oral B Hierba Buena + Pasta','','Enguaje 500 ml\nPasta 80 g',NULL,0,1,1,1,0,5.67,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1255-1592359060203.jpg',1,50,200,0,200,'Enguaje Oral B Hierba Buena + Pasta','',100000,100000,'2020-06-17 01:50:23','2021-06-04 13:08:17',0),(1256,2,1,1,'Oral B Pasta Complete 4 en 1 ','','80 g',NULL,0,0,0,1,0,1.02,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1256-1592359071006.jpg',1,50,200,0,200,'Oral B Pasta Complete 4 en 1 ','',100000,100000,'2020-06-17 01:50:24','2021-06-04 13:08:17',0),(1257,2,1,1,'Pack Cepillo Oral B Indicator ','','',NULL,0,1,1,1,0,2.44,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1257-1592359084108.jpg',1,50,200,0,200,'Pack Cepillo Oral B Indicator ','',100000,100000,'2020-06-17 01:50:25','2021-06-04 13:08:17',0),(1258,43,1,1,'Pizza mexican ','','Pasta especial, chorizo premiun, pepperonni, rebanadas finas de pimiento, jalapeños, queso mozarella derretido','{\"lP\": [{\"d\": \"Pizza mexican 8 porciones\", \"p\": \"7.5\", \"id\": \"0\"}, {\"d\": \"Pizza mexican 4 porciones\", \"p\": \"4.0\", \"id\": \"1\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1258-1597625379614.jpg',1,50,200,2,200,'Pizza mexican ','',100000,100000,'2020-06-20 13:54:53','2021-06-04 13:08:17',0),(1327,108,1,1,'Bolón de tocino','','El mejor plátano seleccionado junto a la mejor receta tradicional con tocino, ají y salsas',NULL,1,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1327-1598972043065.jpg',1,20,1000,13,200,'Bolón de tocino','',100000,100000,'2020-06-24 23:28:28','2021-06-23 17:04:59',0),(1328,108,1,1,'Bolón de camarón','','El mejor plátano seleccionado junto a la mejor receta tradicional con camarones, ají y salsas',NULL,1,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1328-1598972060306.jpg',1,20,1000,4,200,'Bolón de camarón','',100000,100000,'2020-06-24 23:28:28','2021-06-04 13:08:17',0),(1329,108,1,1,'Bolón','','El mejor plátano seleccionado junto a la mejor receta tradicional, café y salsas','{\"lP\": [{\"d\": \"Bolón + café \", \"p\": \"1.5\", \"id\": \"0\"}, {\"d\": \"Solo bolón\", \"p\": \"1.0\", \"id\": \"1\"}]}',1,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1329-1598972070649.jpg',1,20,1000,137,200,'Bolón','',100000,100000,'2020-06-24 23:28:28','2021-06-04 13:08:17',0),(1330,108,1,1,'Bolón + café y huevo frito','','El mejor plátano seleccionado junto a la mejor receta tradicional, huevo frito, café y salsas',NULL,1,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1330-1598972080651.jpg',1,20,1000,14,200,'Bolón + café y huevo frito','',100000,100000,'2020-06-24 23:28:28','2021-06-04 13:08:17',0),(1331,108,1,1,'Bolón + bistec de carne + café','','El mejor plátano seleccionado junto a la mejor receta tradicional, bistec de carne, café y salsas',NULL,1,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1331-1598972097119.jpg',1,20,1000,36,200,'Bolón + bistec de carne + café','',100000,100000,'2020-06-24 23:28:28','2021-06-04 13:08:17',0),(1332,108,1,1,'Bolón + bistec de carne + huevo + café','','El mejor plátano seleccionado junto a la mejor receta tradicional, bistec de carne, huevo frito, café y salsas',NULL,0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1332-1598972109035.jpg',1,20,1000,18,200,'Bolón + bistec de carne + huevo + café','',100000,100000,'2020-06-24 23:28:28','2021-06-04 13:08:17',0),(1333,108,1,1,'Tigrillo','','El mejor plátano seleccionado, junto a lo mejores ingredientes, queso, chicharrón y salsas',NULL,0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1333-1598972159163.jpg',1,20,1000,60,200,'Tigrillo','',100000,100000,'2020-06-24 23:28:28','2021-06-04 13:08:17',0),(1334,108,1,1,'Empanada de verde','','Receta única tradicional, acompañada del mejor plátano verde, rellenas de pollo, incluye salsas y ají ',NULL,1,1,1,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1334-1598972170183.jpg',1,20,1000,41,200,'Empanada de verde','',100000,100000,'2020-06-24 23:28:28','2022-07-11 19:02:47',0),(1335,108,1,1,'Café ','','Café filtrado tradicional ',NULL,0,1,1,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1335-1598972206070.jpg',1,20,1000,4,200,'Café ','',100000,100000,'2020-06-24 23:28:28','2021-06-04 13:08:17',0),(1336,44,1,1,'Combo alitas + arroz moro','','8 alitas + 8 nuggets + arroz moro + papas fritas',NULL,1,1,1,1,0,12.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1336-1597250907281.jpg',1,50,200,9,200,'Combo alitas + arroz moro','',100000,100000,'2020-06-25 14:33:17','2021-06-04 13:08:17',0),(1337,44,1,1,'Combo alitas + hamburguesas','','8 alitas + 2 hamburguesas + papas fritas + 2 gaseosas',NULL,1,1,1,1,0,12.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1337-1597250724207.jpg',1,50,200,28,200,'Combo alitas + hamburguesas','',100000,100000,'2020-06-25 14:34:13','2021-06-04 13:08:17',0),(1338,101,1,1,'ALITA MANIA','','Alitas picantes ','{\"lP\": [{\"d\": \"12 alitas picantes + 1 papa grande + bebida 1.25L\", \"p\": \"11.99\", \"id\": \"0\"}, {\"d\": \"12 alitas picantes + 2 papas peq.+ 2 bebidas regulares\", \"p\": \"7.99\", \"id\": \"1\"}]}',0,1,1,1,0,11.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1338-1593196270943.jpg',1,50,200,1,200,'ALITA MANIA','',100000,100000,'2020-06-26 18:30:04','2021-06-04 13:08:17',0),(1339,109,1,1,'Alitas al carbón','','Incluye papa salteada y ensalada','{\"lP\": [{\"d\": \"Alitas al carbón encuyadas\", \"p\": \"5.25\", \"id\": \"0\"}, {\"d\": \"Alitas al carbón en salsa de piña\", \"p\": \"5.25\", \"id\": \"1\"}]}',0,1,1,1,0,5.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1339-1598972423086.jpg',1,20,1000,19,200,'Alitas al carbón','',100000,100000,'2020-06-27 02:42:54','2022-07-11 19:02:47',0),(1340,109,1,1,'Cecina de pollo ','','Incluye papa salteada, yuca y ensalada',NULL,0,1,1,1,0,7.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1340-1598972444516.jpg',1,20,1000,7,200,'Cecina de pollo ','',100000,100000,'2020-06-27 02:42:54','2021-06-04 13:08:17',0),(1341,109,1,1,'Cuyes','','Incluye papa amarilla y ensalada','{\"lP\": [{\"d\": \"Medio cuy pequeño\", \"p\": \"9.25\", \"id\": \"0\"}, {\"d\": \"Medio cuy mediano\", \"p\": \"9.75\", \"id\": \"1\"}, {\"d\": \"Medio cuy grande\", \"p\": \"10.25\", \"id\": \"2\"}, {\"d\": \"Cuy entero pequeño\", \"p\": \"17.25\", \"id\": \"3\"}, {\"d\": \"Cuy entero medio\", \"p\": \"18.25\", \"id\": \"4\"}, {\"d\": \"Cuy entero grande\", \"p\": \"19.25\", \"id\": \"5\"}]}',0,1,1,1,0,9.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1341-1598972456226.jpg',1,20,1000,15,200,'Cuyes','',100000,100000,'2020-06-27 02:42:54','2021-06-04 13:08:17',0),(1342,109,1,1,'Cecina de cerdo ','','Incluye papa salteada, yuca y ensalada ','{\"lP\": [{\"d\": \"Cecina de cerdo entera\", \"p\": \"7.25\", \"id\": \"0\"}, {\"d\": \"Media cecina de cerdo\", \"p\": \"5.25\", \"id\": \"1\"}]}',0,1,1,1,0,5.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1342-1598972469619.jpg',1,20,1000,48,200,'Cecina de cerdo ','',100000,100000,'2020-06-27 02:42:54','2021-06-04 13:08:17',0),(1343,109,1,1,'Pollo acuyado','','Incluye papa estofada, arroz, ensalada y consomé ','{\"lP\": [{\"d\": \"1/8 pollo acuyado\", \"p\": \"5.25\", \"id\": \"0\"}, {\"d\": \"1/4 de pollo acuyado \", \"p\": \"7.25\", \"id\": \"1\"}]}',0,1,1,1,0,5.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1343-1598972484148.jpg',1,20,1000,74,200,'Pollo acuyado','',100000,100000,'2020-06-27 02:42:54','2021-06-04 13:08:17',0),(1344,109,1,1,'Costilla de cerdo ','','Incluye papa salteada, yuca y ensalada ',NULL,0,1,1,1,0,8.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1344-1598972496498.jpg',1,20,1000,32,200,'Costilla de cerdo ','',100000,100000,'2020-06-27 02:42:54','2021-06-04 13:08:17',0),(1345,109,1,1,'Platos mixtos ','','Incluye yuca y ensalada','{\"lP\": [{\"d\": \"Pollo + cerdo \", \"p\": \"8.75\", \"id\": \"0\"}, {\"d\": \"Pollo + cuy \", \"p\": \"8.75\", \"id\": \"1\"}, {\"d\": \"Cecina + costilla \", \"p\": \"8.75\", \"id\": \"2\"}, {\"d\": \"Cuy + cecina + pollo \", \"p\": \"12.25\", \"id\": \"3\"}]}',0,1,1,1,0,8.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1345-1598972509168.jpg',1,20,1000,9,200,'Platos mixtos ','',100000,100000,'2020-06-27 02:42:54','2021-06-04 13:08:17',0),(1346,109,1,1,'Bandeja Mama Lola','','Incluye cuy, costilla, lomo de cerdo, yuca y ensalada','{\"lP\": [{\"d\": \"Bandeja para tres personas\", \"p\": \"29.5\", \"id\": \"0\"}, {\"d\": \"Bandeja para 5 personas \", \"p\": \"40.0\", \"id\": \"1\"}]}',0,1,1,1,0,29.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1346-1598972524557.jpg',1,20,1000,0,200,'Bandeja Mama Lola','',100000,100000,'2020-06-27 02:42:54','2021-06-04 13:08:17',0),(1347,109,1,1,'Postres ','','','{\"lP\": [{\"d\": \"Miel con quesillo \", \"p\": \"1.75\", \"id\": \"0\"}, {\"d\": \"Babaco con coco\", \"p\": \"1.75\", \"id\": \"1\"}]}',0,1,1,1,0,1.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F1347-1598972539021.jpg',1,20,1000,11,200,'Postres ','',100000,100000,'2020-06-27 02:42:54','2021-06-04 13:08:17',0),(1348,109,1,1,'Porciones ','','','{\"lP\": [{\"d\": \"Porción de papa\", \"p\": \"1.75\", \"id\": \"0\"}, {\"d\": \"Porción de yuca \", \"p\": \"1.75\", \"id\": \"1\"}, {\"d\": \"Porción de ensalada\", \"p\": \"2.0\", \"id\": \"2\"}, {\"d\": \"Porción de mote pillo\", \"p\": \"3.75\", \"id\": \"3\"}, {\"d\": \"Porción de mote sucio\", \"p\": \"3.75\", \"id\": \"4\"}]}',0,1,1,1,0,1.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F1348-1598972553481.jpg',1,20,1000,6,200,'Porciones ','',100000,100000,'2020-06-27 02:42:54','2021-06-04 13:08:17',0),(1349,109,1,1,'Bebidas ','','','{\"lP\": [{\"d\": \"Jarra de crema de coco\", \"p\": \"5.5\", \"id\": \"0\"}, {\"d\": \"Vaso de crema de coco\", \"p\": \"1.5\", \"id\": \"1\"}, {\"d\": \"Jarra de limonada tropical\", \"p\": \"5.5\", \"id\": \"2\"}, {\"d\": \"Vaso de limonada tropical\", \"p\": \"1.5\", \"id\": \"3\"}, {\"d\": \"Jarra de horchata\", \"p\": \"4.0\", \"id\": \"4\"}, {\"d\": \"Vaso de horchata\", \"p\": \"1.0\", \"id\": \"5\"}]}',0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1349-1598972567763.jpg',1,20,1000,5,200,'Bebidas ','',100000,100000,'2020-06-27 02:42:54','2021-06-04 13:08:17',0),(1380,23,1,1,'Pack recién nacido pequeñín','','2 gigapack 50 U, etapa 0 + premiun touch etapa 1 x 28 unidades + 2 crema protectora pequeñín',NULL,1,0,0,0,0,26.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1380-1597593345364.jpg',1,50,200,0,200,'Pack recién nacido pequeñín','',100000,100000,'2020-07-03 01:46:45','2021-06-04 13:08:17',0),(1381,23,1,1,'Pack etapa 1 pequeñín x 56 U','','2 pequeñín etapa 1 x 56 U + pequeñín etapa 1 x 28 U + 2 crema protectora pequeñín',NULL,0,0,0,1,0,25.90,'delivery-0001.appspot.com/o/rv%2Fpr%2F1381-1597593367214.jpg',1,50,200,0,200,'Pack etapa 1 pequeñín x 56 U','',100000,100000,'2020-07-03 01:46:48','2021-06-04 13:08:17',0),(1382,23,1,1,'Pack premium touch etapa 1 x 50 U','','3 pequeñín premiun touch etapa 1 x 50 unidades + 2 crema protectora pequeñín ',NULL,0,0,0,1,0,27.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1382-1597593375778.jpg',1,50,200,0,200,'Pack premium touch etapa 1 x 50 U','',100000,100000,'2020-07-03 01:46:49','2021-06-04 13:08:17',0),(1383,23,1,1,'Pack premium touch etapa 2 x 40 U','','Pequeñín premiun touch etapa 2 x 40 unidades + pañitos húmedos x 100 unidades ',NULL,0,0,0,1,0,26.40,'delivery-0001.appspot.com/o/rv%2Fpr%2F1383-1597593382808.jpg',1,50,200,0,200,'Pack premium touch etapa 2 x 40 U','',100000,100000,'2020-07-03 01:46:51','2021-06-04 13:08:17',0),(1384,23,1,1,'Pack premium touch etapa 2 x 66 U','','3 pequeñín premiun touch etapa 2 x 66 unidades + pañitos húmedos x 120 unidades ',NULL,0,0,0,1,0,41.30,'delivery-0001.appspot.com/o/rv%2Fpr%2F1384-1597593390757.jpg',1,50,200,0,200,'Pack premium touch etapa 2 x 66 U','',100000,100000,'2020-07-03 01:46:52','2021-06-04 13:08:17',0),(1385,23,1,1,'Pack premium touch etapa 3 x 58 U ','','Envío gratis: 3 pequeñín premiun touch etapa 3 x 58 unidades + pañitos húmedos x 120 unidades ',NULL,0,0,0,1,0,41.30,'delivery-0001.appspot.com/o/rv%2Fpr%2F1385-1597593400561.jpg',1,50,200,0,200,'Pack premium touch etapa 3 x 58 U ','',100000,100000,'2020-07-03 01:46:52','2021-06-04 13:08:17',0),(1386,23,1,1,'Pack premium touch etapa 4 x 50 U','','Envío gratis: 3 pequeñín premiun touch etapa 4 x 50 unidades + pañitos húmedos x 120 unidades ',NULL,0,0,0,1,0,41.30,'delivery-0001.appspot.com/o/rv%2Fpr%2F1386-1597593410121.jpg',1,50,200,1,200,'Pack premium touch etapa 4 x 50 U','',100000,100000,'2020-07-03 01:46:53','2021-06-04 13:08:17',0),(1387,23,1,1,'Pack premium touch etapa 3 x 34 U','','Envío gratis: 3 pequeñín premiun touch etapa 3 x 34 unidades + pañitos húmedos x 100 unidades ',NULL,0,0,0,1,0,26.40,'delivery-0001.appspot.com/o/rv%2Fpr%2F1387-1597593420123.jpg',1,50,200,0,200,'Pack premium touch etapa 3 x 34 U','',100000,100000,'2020-07-03 01:46:54','2021-06-04 13:08:17',0),(1388,23,1,1,'Pack premium touch etapa 4 x 28 U','','Envío gratis: 3 pequeñín premiun touch etapa 4 x 28 unidades + pañitos húmedos x 100 unidades ',NULL,0,0,0,1,0,26.40,'delivery-0001.appspot.com/o/rv%2Fpr%2F1388-1597593428203.jpg',1,50,200,0,200,'Pack premium touch etapa 4 x 28 U','',100000,100000,'2020-07-03 01:47:02','2021-06-04 13:08:17',0),(1389,23,1,1,'Pack premium touch etapa 5 x 26 U','','Envío gratis: 3 pequeñín premiun touch etapa 5 x 26 unidades + pañitos húmedos x 100 unidades ',NULL,0,0,0,1,0,26.40,'delivery-0001.appspot.com/o/rv%2Fpr%2F1389-1597593437694.jpg',1,50,200,0,200,'Pack premium touch etapa 5 x 26 U','',100000,100000,'2020-07-03 01:47:03','2021-06-04 13:08:17',0),(1390,23,1,1,'Jumbo pack etapa 2 + 24 U + pañitos 300 u','','Envío gratis: pequeñín jumbo pack etapa 2  x 100 U + pequeñín extra protección 24 U + pañitos x 300 unidades',NULL,0,0,0,1,0,25.70,'delivery-0001.appspot.com/o/rv%2Fpr%2F1390-1597593449509.jpg',1,50,200,0,200,'Jumbo pack etapa 2 + 24 U + pañitos 300 u','',100000,100000,'2020-07-03 01:47:03','2021-06-04 13:08:17',0),(1391,23,1,1,'Jumbo pack etapa 3 + 20 U + pañitos 120 ','','Envío gratis: pequeñín jumbo pack etapa 3  x 100 U + pequeñín extra protección 20 U + pañitos x 120 unidades',NULL,0,0,0,1,0,25.70,'delivery-0001.appspot.com/o/rv%2Fpr%2F1391-1597593466884.jpg',1,50,200,3,200,'Jumbo pack etapa 3 + 20 U + pañitos 120 ','',100000,100000,'2020-07-03 01:47:04','2021-06-04 13:08:17',0),(1392,23,1,1,'Merthio baby crema + spray ','','Merthio baby crema + merthio baby spray',NULL,0,0,0,1,0,5.20,'delivery-0001.appspot.com/o/rv%2Fpr%2F1392-1597593477845.jpg',1,50,200,0,200,'Merthio baby crema + spray ','',100000,100000,'2020-07-03 01:47:05','2021-06-04 13:08:17',0),(1393,23,1,1,'Cámara glimpse','','Cámara vigía para bebé glimpse',NULL,0,1,1,1,0,125.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1393-1597593488911.jpg',1,50,200,0,200,'Cámara glimpse','',100000,100000,'2020-07-03 01:47:06','2021-06-04 13:08:17',0),(1394,23,1,1,'Carro plástico para niño ','','',NULL,0,1,1,1,0,100.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1394-1597593503203.jpg',1,50,200,0,200,'Carro plástico para niño ','',100000,100000,'2020-07-03 01:47:08','2021-06-04 13:08:17',0),(1395,23,1,1,'Silla mecedora ibaby','','Silla mecedora para niña marca ibaby ',NULL,0,1,1,1,0,57.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1395-1597593514745.jpg',1,50,200,0,200,'Silla mecedora ibaby','',100000,100000,'2020-07-03 01:47:09','2021-06-04 13:08:17',0),(1396,23,1,1,'Building blocks ','','Juego de bloques amables para niños',NULL,0,1,1,1,0,11.20,'delivery-0001.appspot.com/o/rv%2Fpr%2F1396-1597593527150.jpg',1,50,200,0,200,'Building blocks ','',100000,100000,'2020-07-03 01:47:10','2021-06-04 13:08:17',0),(1397,23,1,1,'Sillón para bebé, incluye seguros ','','',NULL,0,1,1,1,0,35.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1397-1597593538391.jpg',1,50,200,0,200,'Sillón para bebé, incluye seguros ','',100000,100000,'2020-07-03 01:47:11','2021-06-04 13:08:17',0),(1398,23,1,1,'Carro plástico para niño ','','','{\"lP\": [{\"d\": \"Carro plástico color amarillo\", \"p\": \"35.0\", \"id\": \"0\"}, {\"d\": \"Carro plástico color celeste \", \"p\": \"35.0\", \"id\": \"1\"}]}',0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1398-1597593549465.jpg',1,50,200,0,200,'Carro plástico para niño ','',100000,100000,'2020-07-03 01:47:12','2021-06-04 13:08:17',0),(1399,23,1,1,'Pañalera porta biberones ','','',NULL,0,1,1,1,0,21.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1399-1597593560786.jpg',1,50,200,0,200,'Pañalera porta biberones ','',100000,100000,'2020-07-03 01:47:13','2021-06-04 13:08:17',0),(1400,23,1,1,'Almohada de lactancia','','',NULL,0,1,1,0,0,36.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1400-1597593571422.jpg',1,50,200,0,200,'Almohada de lactancia','',100000,100000,'2020-07-03 01:47:15','2021-06-04 13:08:17',0),(1401,23,1,1,'Baby s piano gym mat','','','{\"lP\": []}',0,1,1,0,0,46.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1401-1597593586363.jpg',1,50,200,0,200,'Baby s piano gym mat','',100000,100000,'2020-07-03 01:47:16','2021-06-04 13:08:17',0),(1402,23,1,1,'Jumbo pack etapa 4 + 18 U + pañitos 100 ','','Envío gratis: pequeñín jumbo pack etapa 4  x 100 U + pequeñín extra protección 18 U + pañitos x 100 unidades',NULL,0,0,0,0,0,28.70,'delivery-0001.appspot.com/o/rv%2Fpr%2F1402-1597593597369.jpg',1,50,200,0,200,'Jumbo pack etapa 4 + 18 U + pañitos 100 ','',100000,100000,'2020-07-03 01:47:17','2021-06-04 13:08:17',0),(1403,23,1,1,'Pequeñín etapa 5 x 64 U + 16 U + pañitos','','Pequeñín extra protección etapa 5 x 64 U + pack 16 unidades + pañitos x 250',NULL,1,0,0,1,0,25.70,'delivery-0001.appspot.com/o/rv%2Fpr%2F1403-1597593356052.jpg',1,50,200,7,200,'Pequeñín etapa 5 x 64 U + 16 U + pañitos','',100000,100000,'2020-07-03 01:47:18','2021-06-04 13:08:17',0),(1417,101,1,1,'SEMANA DEL POLLO 9 PRESAS','','9 presas + 1 papa grande\n(Receta: Original o Crispi) ',NULL,0,1,1,1,0,12.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1417-1594049619429.jpg',1,50,200,2,200,'SEMANA DEL POLLO 9 PRESAS','',100000,100000,'2020-07-06 02:39:21','2021-06-04 13:08:17',0),(1418,101,1,1,'SEMANA DEL POLLO 7 PRESAS 7 ALITAS','','7 presas + 7 alitas picantes + 1 papa grande \n(Receta: Original o Crispi) ',NULL,0,1,1,1,0,12.99,'delivery-0001.appspot.com/o/rv%2Fpromo%2F1418-1594049632160.jpg',1,50,200,0,200,'SEMANA DEL POLLO 7 PRESAS 7 ALITAS','',100000,100000,'2020-07-06 02:39:23','2021-06-04 13:08:17',0),(1419,108,1,1,'Cinco bolones +  bolón con tocino','','5 bolones + 1 bolón con tocino + ensalada + salsas',NULL,0,1,1,1,0,4.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F1419-1598972287050.jpg',1,50,200,30,200,'Cinco bolones +  bolón con tocino','',100000,100000,'2020-07-07 01:23:18','2021-06-04 13:08:17',1),(1420,108,1,1,'Diez bolones +  bolón con camarón','','10 bolones + 1 bolón con camaron + ensalada + salsas',NULL,0,1,1,1,0,9.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F1420-1598972302769.jpg',1,50,200,4,200,'Diez bolones +  bolón con camarón','',100000,100000,'2020-07-07 01:23:20','2021-06-04 13:08:17',0),(1433,2,1,1,'Shampoo Revitalizador con Ortiga 600 ml','','Penetra en la cutícula del cabello, hidrata en profundidad, otorga más brillo y cuerpo al cabello.',NULL,0,1,1,1,0,11.33,'delivery-0001.appspot.com/o/op%2Fpr%2F1433-1610397698096.jpg',1,50,200,0,200,'Shampoo Revitalizador con Ortiga 600 ml','',100000,100000,'2020-07-07 21:59:14','2022-07-11 19:02:47',0),(1434,2,1,1,'Shampoo Varon Dandy 500 ml','','Fortalece la fibra capilar y contribuye a la oxigenación del bulbo, logrando profunda limpieza.',NULL,0,1,1,1,0,11.33,'delivery-0001.appspot.com/o/op%2Fpr%2F1434-1610397870771.jpg',1,50,200,0,200,'Shampoo Varon Dandy 500 ml','',100000,100000,'2020-07-07 21:59:37','2022-07-11 19:02:47',0),(1435,2,1,1,'Vitakalcio Kids jarabe 120 ml','','Previene el dolor articular. Previene la degradación de tendones, ligamentos y cartílagos.',NULL,0,1,1,1,0,11.25,'delivery-0001.appspot.com/o/op%2Fpr%2F1435-1610398051821.jpg',1,50,200,0,200,'Vitakalcio Kids jarabe 120 ml','',100000,100000,'2020-07-07 21:59:38','2022-07-11 19:02:47',0),(1436,2,1,1,'Triple C Forte Vitamina C + Zinc 500 ml','','Ayuda al mantenimiento normal del sistema inmunológico. - Potente Antioxidante.',NULL,0,1,1,1,0,8.41,'delivery-0001.appspot.com/o/op%2Fpr%2F1436-1610398659165.jpg',1,50,200,0,200,'Triple C Forte Vitamina C + Zinc 500 ml','',100000,100000,'2020-07-07 21:59:39','2021-06-04 13:08:17',0),(1437,2,1,1,'VitaToro etiqueta roja jarabe 500 ml','','Combate el cansancio, la debilidad y cansancio por el trabajo, la fatiga mental, anemia e insomnio.','{\"lP\": [{\"d\": \"Umbrella base compacta spf 50 tono claro\", \"p\": \"39.7\", \"id\": \"0\"}]}',0,1,1,1,0,18.60,'delivery-0001.appspot.com/o/op%2Fpr%2F1437-1610398849371.jpg',1,50,200,0,200,'VitaToro etiqueta roja jarabe 500 ml','',100000,100000,'2020-07-07 21:59:40','2022-07-11 19:02:47',0),(1438,2,1,1,'Umbrella base compacta beige tono 2','','Protector solar de amplio espectro, que bloquea el 98% de la radiación solar y actúa como base de maquillaje.',NULL,0,1,1,1,0,27.79,'delivery-0001.appspot.com/o/op%2Fpr%2F1438-1610039148657.jpg',1,50,200,0,200,'Umbrella base compacta beige tono 2','',100000,100000,'2020-07-07 21:59:40','2021-06-04 13:08:17',0),(1439,2,1,1,'Umbrella base compacta miel tono 3','','Protector solar forma una película homogénea, proporcionando excelente cobertura y un efecto mate a la piel.',NULL,0,1,1,1,0,27.79,'delivery-0001.appspot.com/o/op%2Fpr%2F1439-1610039534026.jpg',1,50,200,0,200,'Umbrella base compacta miel tono 3','',100000,100000,'2020-07-07 21:59:41','2021-06-04 13:08:17',0),(1440,2,1,1,'Umbrella base compacta durazno tono 4','','Protector solar forma una película homogénea, proporcionando excelente cobertura y un efecto mate a la piel.',NULL,0,1,1,1,0,27.79,'delivery-0001.appspot.com/o/op%2Fpr%2F1440-1610039967659.jpg',1,50,200,0,200,'Umbrella base compacta durazno tono 4','',100000,100000,'2020-07-07 21:59:42','2021-06-04 13:08:17',0),(1478,43,1,1,'Pizza mix - tocino','','Salami, pepperoni, tocino premium, rebanadas finas de pimiento fresco y delicioso queso mozarella derretido','{\"lP\": [{\"d\": \"Mix - tocino mediana 8 porciones\", \"p\": \"7.0\", \"id\": \"0\"}, {\"d\": \"Mix - tocino personal 4 porciones \", \"p\": \"4.0\", \"id\": \"1\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1478-1597625341550.jpg',1,50,200,9,200,'Pizza mix - tocino','',100000,100000,'2020-07-09 05:29:33','2021-06-04 13:08:17',0),(1479,43,1,1,'Pizza mix chorizo parrillero','','Nueva salsa, jamón, pepperoni, chorizo parrilero, acompañados de delicioso queso mozarella','{\"lP\": [{\"d\": \"Mix chorizo parrilero mediana 8 porciones\", \"p\": \"7.0\", \"id\": \"0\"}, {\"d\": \"Mix chorizo parrilero personal 4 porciones\", \"p\": \"4.0\", \"id\": \"1\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1479-1597625353098.jpg',1,50,200,6,200,'Pizza mix chorizo parrillero','',100000,100000,'2020-07-09 05:29:34','2021-06-04 13:08:17',0),(1489,115,1,1,'6 alitas ','','Incluye zanahoria, papa y apio. Salsas a elegir: clásica, mango BBQ, honey mustang, asia, buffalo y bourbon. ',NULL,0,1,1,1,0,5.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1489-1599017325850.jpg',1,20,1000,39,200,'6 alitas ','',100000,100000,'2020-07-12 03:45:10','2021-06-04 13:08:17',0),(1490,115,1,1,'Ocho alitas','','Incluye zanahoria, papa y apio. Salsas a elegir: clásica, mango BBQ, honey mustang, asia, buffalo y bourbon. ',NULL,0,1,1,1,0,6.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F1490-1599017337923.jpg',1,20,1000,35,200,'Ocho alitas','',100000,100000,'2020-07-12 03:45:10','2021-06-04 13:08:17',1),(1491,115,1,1,'Doce alitas ','','Incluye zanahoria, papa y apio. Salsas a elegir: clásica, mango BBQ, honey mustang, asia, buffalo y bourbon. ',NULL,0,1,1,1,0,8.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F1491-1599017355670.jpg',1,20,1000,55,200,'Doce alitas ','',100000,100000,'2020-07-12 03:45:10','2021-06-04 13:08:17',0),(1492,115,1,1,'20 alitas ','','Incluye zanahoria, papas y apio. Salsas a elegir: clásica, mango BBQ, honey mustang, asia, buffalo y bourbon. ',NULL,0,1,1,1,0,15.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1492-1599017366690.jpg',1,20,1000,34,200,'20 alitas ','',100000,100000,'2020-07-12 03:45:10','2021-06-04 13:08:17',0),(1493,115,1,1,'Promo alitas ','','2do a mitad de precio. Salsas a elegir: clásica, mango BBQ, honey mustang, asia, buffalo y bourbon. ','{\"lP\": [{\"d\": \"40 alitas \", \"p\": \"23.5\", \"id\": \"0\"}, {\"d\": \"24 Alitas\", \"p\": \"13.25\", \"id\": \"1\"}, {\"d\": \"16 Alitas\", \"p\": \"10.0\", \"id\": \"2\"}, {\"d\": \"12 Alitas \", \"p\": \"8.0\", \"id\": \"3\"}]}',1,0,0,1,0,8.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1493-1599017313407.jpg',1,20,1000,4,1,'Promo alitas ','',100000,100000,'2020-07-12 03:45:10','2022-07-11 19:02:47',0),(1494,115,1,1,'Hamburguesa','','Incluyen pan, lechucha, tomate y cebolla, papas fritas y bebida','{\"lP\": [{\"d\": \"Hamburguesa con Queso\", \"p\": \"3.75\", \"id\": \"0\"}, {\"d\": \"Hamburguesa Clasica\", \"p\": \"3.5\", \"id\": \"1\"}, {\"d\": \"Hamburguesa con Tocino\", \"p\": \"4.0\", \"id\": \"2\"}, {\"d\": \"Hamburguesa Doble Carne\", \"p\": \"4.0\", \"id\": \"3\"}]}',0,0,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1494-1599017401346.jpg',1,20,1000,17,200,'Hamburguesa','',100000,100000,'2020-07-12 03:45:10','2021-06-04 13:08:17',0),(1495,115,1,1,'Nachos','','Nachos con queso derretido, acompañados de pollo, carne o mixto','{\"lP\": [{\"d\": \"Nacho con Queso Gratinado\", \"p\": \"2.75\", \"id\": \"0\"}, {\"d\": \"Nacho con Carne\", \"p\": \"3.75\", \"id\": \"1\"}, {\"d\": \"Nacho con Pollo\", \"p\": \"3.75\", \"id\": \"2\"}, {\"d\": \"Nacho Mixto (Pollo y Carne) \", \"p\": \"4.0\", \"id\": \"3\"}]}',0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1495-1599017417055.jpg',1,20,1000,5,200,'Nachos','',100000,100000,'2020-07-12 03:45:10','2021-06-04 13:08:17',0),(1496,115,1,1,'Bebidas ','','Micheladas, cervezas, bebidas sin alcohol ','{\"lP\": [{\"d\": \"Cola de Litro\", \"p\": \"1.75\", \"id\": \"0\"}, {\"d\": \"Michelada sin Alcohol \", \"p\": \"2.0\", \"id\": \"1\"}, {\"d\": \"Biela (personal) \", \"p\": \"1.75\", \"id\": \"2\"}, {\"d\": \"Michelada clásica\", \"p\": \"3.5\", \"id\": \"3\"}, {\"d\": \"Michelada jr clásica\", \"p\": \"2.5\", \"id\": \"4\"}, {\"d\": \"Michelada mango\", \"p\": \"3.0\", \"id\": \"5\"}, {\"d\": \"Michelada maracuyá\", \"p\": \"3.0\", \"id\": \"6\"}, {\"d\": \"Michelada submarina mango\", \"p\": \"5.0\", \"id\": \"7\"}, {\"d\": \"Michelada submarina maracuyá\", \"p\": \"5.0\", \"id\": \"8\"}, {\"d\": \"Chelada \", \"p\": \"2.5\", \"id\": \"9\"}, {\"d\": \"Heineken\", \"p\": \"2.0\", \"id\": \"10\"}, {\"d\": \"Corona\", \"p\": \"3.5\", \"id\": \"11\"}, {\"d\": \"Club personal\", \"p\": \"2.0\", \"id\": \"12\"}, {\"d\": \"Club grande\", \"p\": \"2.5\", \"id\": \"13\"}, {\"d\": \"Cola personal\", \"p\": \"0.75\", \"id\": \"14\"}, {\"d\": \"Fuze tea\", \"p\": \"1.25\", \"id\": \"15\"}]}',0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1496-1599017428086.jpg',1,20,1000,6,200,'Bebidas ','',100000,100000,'2020-07-12 03:45:10','2021-06-04 13:08:17',0),(1497,43,1,1,'Dos Pizzas: 1  personal y 1 mediana','','Pasta especial, chorizo, pepperonni, pimiento, jalapeños, queso mozarella derretido. Gratis nachos y bebida',NULL,0,1,1,1,0,9.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F1497-1597625368202.jpg',1,50,200,6,200,'Dos Pizzas: 1  personal y 1 mediana','',100000,100000,'2020-07-14 18:52:36','2021-06-04 13:08:17',0),(1505,117,1,1,'Hamburguesa Solita ','','Pan, carne, salsas y aderezos.','{\"lP\": [{\"d\": \"Solita\", \"p\": \"2.99\", \"id\": \"0\"}, {\"d\": \"Solita + nachos\", \"p\": \"3.99\", \"id\": \"1\"}, {\"d\": \"Solita + papas\", \"p\": \"3.99\", \"id\": \"2\"}]}',0,1,1,1,0,2.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F1505-1599018908040.jpg',1,20,1000,71,200,'Hamburguesa Solita ','',100000,100000,'2020-07-19 03:27:08','2021-06-20 13:56:22',0),(1506,117,1,1,'Hamburguesa soltera','','Pan, carne, queso mozzarella, salsas y aderezos','{\"lP\": [{\"d\": \"Soltera\", \"p\": \"3.7\", \"id\": \"0\"}, {\"d\": \"Soltera + nachos\", \"p\": \"4.7\", \"id\": \"1\"}, {\"d\": \"Soltera + papas\", \"p\": \"4.7\", \"id\": \"2\"}]}',0,1,1,1,0,3.70,'delivery-0001.appspot.com/o/rv%2Fpr%2F1506-1599018918125.jpg',1,20,1000,11,200,'Hamburguesa soltera','',100000,100000,'2020-07-19 03:27:08','2021-06-11 14:28:35',0),(1507,117,1,1,'Hamburguesas con Salsas','','Pan, 100 grcarne, salsa a elección (guacamole, picante o bbq), queso mozzarella, salsas y aderezos','{\"lP\": [{\"d\": \"Hamburguesa güerita con papas\", \"p\": \"4.9\", \"id\": \"0\"}, {\"d\": \"Hamburguesa güerita con nachos \", \"p\": \"4.9\", \"id\": \"1\"}, {\"d\": \"Hamburguesa güerita\", \"p\": \"3.9\", \"id\": \"2\"}]}',0,1,1,1,0,3.90,'delivery-0001.appspot.com/o/rv%2Fpr%2F1507-1599018938614.jpg',1,20,1000,3,200,'Hamburguesas con Salsas','',100000,100000,'2020-07-19 03:27:08','2021-06-04 13:08:17',0),(1508,117,1,1,'Hamburguesa curiosa','','Pan, carne, plátanos fritos, queso mozzarella, salsas y aderezos','{\"lP\": [{\"d\": \"Hamburguesa curiosa \", \"p\": \"4.0\", \"id\": \"0\"}, {\"d\": \"Hamburguesa curiosa + nachos \", \"p\": \"5.0\", \"id\": \"1\"}, {\"d\": \"Hamburguesa curiosa + papas\", \"p\": \"5.0\", \"id\": \"2\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1508-1599018950404.jpg',1,20,1000,3,200,'Hamburguesa curiosa','',100000,100000,'2020-07-19 03:27:08','2021-06-04 13:08:17',0),(1509,117,1,1,'Hamburguesa traicionera ','','Pan, carne, cebolla (original o caramelizada), queso mozzarella, salsas y aderezos','{\"lP\": [{\"d\": \"Hamburguesa traicionera con nachos \", \"p\": \"4.7\", \"id\": \"0\"}, {\"d\": \"Hamburguesa traicionera con papas\", \"p\": \"4.7\", \"id\": \"1\"}, {\"d\": \"Hamburguesa traicionera \", \"p\": \"3.7\", \"id\": \"2\"}]}',0,1,1,1,0,3.70,'delivery-0001.appspot.com/o/rv%2Fpr%2F1509-1599018962002.jpg',1,20,1000,3,200,'Hamburguesa traicionera ','',100000,100000,'2020-07-19 03:27:08','2021-06-04 13:08:17',0),(1510,117,1,1,'Hamburguesa enamorada','','Pan, carne, tocino, queso mozzarella, salsas y aderezos','{\"lP\": [{\"d\": \"Hamburguesa Enamorada\", \"p\": \"4.5\", \"id\": \"0\"}, {\"d\": \"Hamburguesa enamorada + nachos\", \"p\": \"5.5\", \"id\": \"1\"}, {\"d\": \"Hamburguesa enamorada + papas\", \"p\": \"5.5\", \"id\": \"2\"}]}',0,1,1,1,0,4.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1510-1599018972484.jpg',1,20,1000,14,200,'Hamburguesa enamorada','',100000,100000,'2020-07-19 03:27:08','2021-06-04 13:08:17',0),(1511,117,1,1,'Hamburguesa caribeña','','Pan, carne, doble piña asada, queso mozzarella, salsas y aderezos','{\"lP\": [{\"d\": \"Hamburguesa caribeña \", \"p\": \"4.5\", \"id\": \"0\"}, {\"d\": \"Hamburguesa caribeña + nachos\", \"p\": \"5.5\", \"id\": \"1\"}, {\"d\": \"Hamburguesa caribeña + papa\", \"p\": \"5.5\", \"id\": \"2\"}]}',0,1,1,1,0,4.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1511-1599018997803.jpg',1,20,1000,5,200,'Hamburguesa caribeña','',100000,100000,'2020-07-19 03:27:08','2021-06-04 13:08:17',0),(1512,117,1,1,'Hamburguesa golosa','','Pan, carne, chorizo, huevo, queso mozzarella, salsas y aderezos','{\"lP\": [{\"d\": \"Hamburguesa golosa\", \"p\": \"4.7\", \"id\": \"0\"}, {\"d\": \"Hamburguesa + nachos\", \"p\": \"5.7\", \"id\": \"1\"}, {\"d\": \"Hamburguesa golosa + papas\", \"p\": \"5.7\", \"id\": \"2\"}]}',0,1,1,1,0,4.70,'delivery-0001.appspot.com/o/rv%2Fpr%2F1512-1599019011651.jpg',1,20,1000,12,200,'Hamburguesa golosa','',100000,100000,'2020-07-19 03:27:08','2021-06-16 15:04:48',0),(1513,117,1,1,'Hamburguesa atrevida ','','Pan, carne, chuleta ahumada, queso mozzarella, salsas y aderezos','{\"lP\": [{\"d\": \"Hamburguesa atrevida\", \"p\": \"5.0\", \"id\": \"0\"}, {\"d\": \"Hamburguesa atrevida + nachos \", \"p\": \"6.0\", \"id\": \"1\"}, {\"d\": \"Hamburguesa atrevida + papas\", \"p\": \"6.0\", \"id\": \"2\"}]}',0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1513-1599019024952.jpg',1,20,1000,14,200,'Hamburguesa atrevida ','',100000,100000,'2020-07-19 03:27:08','2021-06-04 13:08:17',0),(1514,117,1,1,'Hamburguesa divorciada ','','Pan, carne, jamón, queso mozzarella, salsas y aderezos','{\"lP\": [{\"d\": \"Hamburguesa divorciada \", \"p\": \"4.25\", \"id\": \"0\"}, {\"d\": \"Hamburguesa divorciada + nachos \", \"p\": \"5.25\", \"id\": \"1\"}, {\"d\": \"Hamburguesa divorciada + papas \", \"p\": \"5.25\", \"id\": \"2\"}]}',0,1,1,1,0,4.10,'delivery-0001.appspot.com/o/rv%2Fpr%2F1514-1599019036411.jpg',1,20,1000,4,200,'Hamburguesa divorciada ','',100000,100000,'2020-07-19 03:27:08','2021-06-04 13:08:17',0),(1515,117,1,1,'Hamburguesa súper cuadrada ','','Pan, triple carne, jamón, chorizo, tocino, salami, doble queso mozzarella, salsas y aderezos','{\"lP\": [{\"d\": \"Hamburguesa súper cuadrada con nachos \", \"p\": \"8.25\", \"id\": \"0\"}, {\"d\": \"Hamburguesa súper cuadrada con papas \", \"p\": \"8.25\", \"id\": \"1\"}, {\"d\": \"Hamburguesa súper cuadrada \", \"p\": \"7.25\", \"id\": \"2\"}]}',0,1,1,1,0,7.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1515-1599019047386.jpg',1,20,1000,3,200,'Hamburguesa súper cuadrada ','',100000,100000,'2020-07-19 03:27:08','2021-06-04 13:08:17',0),(1516,117,1,1,'Hot dogs','','Todos incluyen salchicha, salsas y aderezos','{\"lP\": [{\"d\": \"Hot dog amante + nachos\", \"p\": \"3.5\", \"id\": \"0\"}, {\"d\": \"Hot dog amante + papas \", \"p\": \"3.5\", \"id\": \"1\"}, {\"d\": \"Hot dog amante: tocino+ queso+ aderezos+ salsas\", \"p\": \"2.5\", \"id\": \"2\"}, {\"d\": \"Hot dog solitario + nachos\", \"p\": \"3.0\", \"id\": \"3\"}, {\"d\": \"Hot dog solitario + papas \", \"p\": \"3.0\", \"id\": \"4\"}, {\"d\": \"Hot dog solitario\", \"p\": \"2.0\", \"id\": \"5\"}]}',0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1516-1599019058773.jpg',1,20,1000,29,200,'Hot dogs','',100000,100000,'2020-07-19 03:27:08','2021-06-20 13:34:04',0),(1517,117,1,1,'Porciones ','','Papas, nuggets, pollo, nachos, guacamole, salsa bbq','{\"lP\": [{\"d\": \"Porción de papas fritas\", \"p\": \"2.0\", \"id\": \"0\"}, {\"d\": \"Vanidosa: 3 salchichas y papitas fritas\", \"p\": \"2.0\", \"id\": \"1\"}, {\"d\": \"Adicional salsa de queso cheddar \", \"p\": \"0.5\", \"id\": \"2\"}, {\"d\": \"Adicional guacamole\", \"p\": \"0.5\", \"id\": \"3\"}, {\"d\": \"Adicional salsa bbq\", \"p\": \"0.5\", \"id\": \"4\"}]}',0,1,1,1,0,0.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1517-1599019074168.jpg',1,20,1000,53,200,'Porciones ','',100000,100000,'2020-07-19 03:27:08','2021-06-29 21:00:41',1),(1518,117,1,1,'Bandeja de nachos','','Nachos, carne molida, frejol negro, guacamole, salsa de queso cheddar y salsas',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1518-1599019087238.jpg',1,20,1000,4,200,'Bandeja de nachos','',100000,100000,'2020-07-19 03:27:08','2021-06-04 13:08:17',0),(1539,117,1,1,'Alitas ','','Alitas acompañadas de papas fritas, deditos de zanahoria, salsas y aderezos.','{\"lP\": [{\"d\": \"8 alitas bbq\", \"p\": \"7.5\", \"id\": \"0\"}, {\"d\": \"4 alitas picantes\", \"p\": \"4.0\", \"id\": \"1\"}, {\"d\": \"4 alitas bbq\", \"p\": \"4.0\", \"id\": \"2\"}, {\"d\": \"8 alitas picantes\", \"p\": \"7.5\", \"id\": \"3\"}, {\"d\": \"12 alitas picantes\", \"p\": \"11.0\", \"id\": \"4\"}, {\"d\": \"12 alitas bbq\", \"p\": \"11.0\", \"id\": \"5\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1539-1599018651108.jpg',1,50,200,17,200,'Alitas ','',100000,100000,'2020-07-20 04:26:11','2021-06-22 02:45:29',0),(1540,117,1,1,'Choripan','','Todos incluyen pan, chorizo de ternera asado, salsas y aderezos.','{\"lP\": [{\"d\": \"Choripan salvaje: chorizo+ tocino+queso mozzarella\", \"p\": \"3.5\", \"id\": \"0\"}, {\"d\": \"Choripan recatado: chorizo+ salsas + aderezos\", \"p\": \"3.0\", \"id\": \"1\"}]}',0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1540-1599018660037.jpg',1,50,200,14,200,'Choripan','',100000,100000,'2020-07-20 04:26:14','2021-06-04 13:08:17',1),(1541,117,1,1,'Papitas mexicanas','','Papitas fritas con carne molida, frejol negro, queso mozzarella gratinado, guacamole y salsa de queso cheddar.',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1541-1599018667659.jpg',1,50,200,3,200,'Papitas mexicanas','',100000,100000,'2020-07-20 04:26:15','2021-06-04 13:08:17',0),(1542,117,1,1,'Picadita peñizcadita','','Rollitos de jamón rellenos de queso mozzarella y champiñones, acompañados de papas fritas, nachos, guacamole .',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1542-1599018675950.jpg',1,50,200,8,200,'Picadita peñizcadita','',100000,100000,'2020-07-20 04:26:16','2021-06-08 01:27:39',0),(1543,117,1,1,'Flaquita','','Picadita acompañada de papas fritas, filete de pollo a la parrilla, salchicha, deditos de zanahoria y salsas.',NULL,0,0,0,1,0,4.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1543-1599018685892.jpg',1,50,200,2,200,'Flaquita','',100000,100000,'2020-07-20 04:26:17','2021-06-04 13:08:17',0),(1544,117,1,1,'Promo familiar ','','2 hamburguesas casadas + 2 hot dogs solitarios + 4 alitas + por mixta de nachos y papas + gaseosa de 1 Lt','{\"lP\": [{\"d\": \"Hamburguesa+nachos\", \"p\": \"8.75\", \"id\": \"0\"}, {\"d\": \"Hamburguesa+ papas\", \"p\": \"8.75\", \"id\": \"1\"}, {\"d\": \"Sólo hamburguesa \", \"p\": \"6.75\", \"id\": \"2\"}]}',1,1,1,1,0,19.99,'delivery-0001.appspot.com/o/op%2Fpr%2F1544-1618605011880.jpg',1,50,200,8,200,'Promo familiar ','',100000,100000,'2020-07-20 04:26:18','2021-06-04 13:08:17',0),(1545,117,1,1,'Promo dos hamburguesas + nachos','','Elegir: 2 caribeñas, 2 casadas o 2 traviesas. Todas acompañadas de nachos ','{\"lP\": [{\"d\": \"2 hamburguesas traviesas + nachos\", \"p\": \"7.99\", \"id\": \"0\"}, {\"d\": \"2 hamburguesas casadas + nachos\", \"p\": \"7.99\", \"id\": \"1\"}, {\"d\": \"Dos hamburguesas caribeñas + nachos\", \"p\": \"7.99\", \"id\": \"2\"}]}',0,0,0,1,0,7.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F1545-1599018889507.jpg',1,50,200,7,200,'Promo dos hamburguesas + nachos','',100000,100000,'2020-07-20 04:26:20','2021-06-04 13:08:17',0),(1546,117,1,1,'Bebidas','','Cerveza, jugos, limonada','{\"lP\": [{\"d\": \"Michelada santa\", \"p\": \"3.0\", \"id\": \"0\"}, {\"d\": \"Jugo de guanábana y maracuyá\", \"p\": \"1.75\", \"id\": \"1\"}, {\"d\": \"Jugo de mora y frutilla \", \"p\": \"1.75\", \"id\": \"2\"}, {\"d\": \"Fuze tea 550 ml\", \"p\": \"1.0\", \"id\": \"3\"}, {\"d\": \"Limonada grande\", \"p\": \"1.0\", \"id\": \"4\"}, {\"d\": \"Refresco de coco grande\", \"p\": \"1.0\", \"id\": \"5\"}]}',0,1,1,1,0,0.50,'delivery-0001.appspot.com/o/op%2Fpr%2F1546-1619110009701.jpg',1,50,200,14,200,'Bebidas','',100000,100000,'2020-07-20 04:26:21','2021-06-04 13:08:17',0),(1607,124,1,1,'Combo 1','','Tres parrilladas de Filete de pollo + Chuleta de cerdo + chorizo + mote sucio+ papa carbonero + ensalada',NULL,1,1,1,1,0,11.50,'delivery-0001.appspot.com/o/op%2Fpr%2F1607-1618674578949.jpg',1,20,1000,197,200,'Combo 1','',100000,100000,'2020-07-25 00:38:19','2021-06-04 13:08:17',0),(1608,124,1,1,'Combo 2','','Tres parrilladas de langostinos: langostinos, patacones, ensalda',NULL,1,1,1,1,0,11.50,'delivery-0001.appspot.com/o/op%2Fpr%2F1608-1618674626316.jpg',1,20,1000,2,200,'Combo 2','',100000,100000,'2020-07-25 00:38:19','2021-06-04 13:08:17',0),(1609,124,1,1,'Combo 3','','Dos parrilldas mini junior + una parrillada de langostinos',NULL,1,1,1,1,0,11.50,'delivery-0001.appspot.com/o/op%2Fpr%2F1609-1618674643902.jpg',1,20,1000,17,200,'Combo 3','',100000,100000,'2020-07-25 00:38:19','2021-06-04 13:08:17',0),(1610,124,1,1,'Costillas de Cerdo BBQ','','Costillas de cerdo + mote sucio + papa carbonero + ensala',NULL,0,1,1,1,0,8.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1610-1619208424715.jpg',1,20,1000,13,200,'Costillas de Cerdo BBQ','',100000,100000,'2020-07-25 00:38:19','2021-06-23 01:14:12',1),(1611,124,1,1,'Chuleta de Cerdo Carbonero BBQ','','Chuleta de lomo de cerdo + mote sucio + papa carnonero + ensalada.',NULL,0,1,1,1,0,6.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1611-1619208951713.jpg',1,20,1000,2,200,'Chuleta de Cerdo Carbonero BBQ','',100000,100000,'2020-07-25 00:38:19','2021-06-04 13:08:17',0),(1612,124,1,1,'Filete de Pollo','','Filete de Pollo + mote sucio + papa carbonero + ensalada',NULL,0,1,1,1,0,6.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1612-1619209067998.jpg',1,20,1000,5,200,'Filete de Pollo','',100000,100000,'2020-07-25 00:38:19','2021-06-04 13:08:17',0),(1613,124,1,1,'Combo 4','','Parrillada jr. + 6 alitas: filete  res y pollo, chuleta de cerdo, chorizo, alitas, mote sucio, papa y ensalada',NULL,1,1,1,1,0,11.50,'delivery-0001.appspot.com/o/op%2Fpr%2F1613-1619474463285.jpg',1,20,1000,22,200,'Combo 4','',100000,100000,'2020-07-25 00:38:19','2021-06-04 13:08:17',0),(1614,124,1,1,'Alitas BBQ','','Alitas, 6 unid. + papa artesanal + ensalada','{\"lP\": [{\"d\": \"Mote sucio\", \"p\": \"3\", \"id\": \"0\"}, {\"d\": \"Alitas\", \"p\": \"4.5\", \"id\": \"1\"}, {\"d\": \"Chorizo\", \"p\": \"4\", \"id\": \"2\"}, {\"d\": \"Papa carbonero\", \"p\": \"3\", \"id\": \"3\"}, {\"d\": \"ensalada normal\", \"p\": \"3\", \"id\": \"4\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1614-1619207162535.jpg',1,20,1000,13,200,'Alitas BBQ','',100000,100000,'2020-07-25 00:38:19','2021-06-04 13:08:17',0),(1615,124,1,1,'Lomo fino de Res Carbonero','','Sotalomo + mote sucio + papa carbonero + ensalada',NULL,0,1,1,1,0,9.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1615-1619209462581.jpg',1,20,1000,5,200,'Lomo fino de Res Carbonero','',100000,100000,'2020-07-25 00:38:19','2021-06-04 13:08:17',0),(1616,124,1,1,'Horchata','','Horchata 1 litro','{\"lP\": []}',1,1,1,1,0,1.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1616-1619206990994.jpg',1,20,1000,24,200,'Horchata','',100000,100000,'2020-07-25 00:38:19','2021-06-04 13:08:17',0),(1617,124,1,1,'Parrillada junior','','Lomo de res tipo bife + filete de pollo + chuleta de cerdo BBQ + chorizo argentino + mote sucio + papa carbone','{\"lP\": [{\"d\": \"Lomo fino de res carbonero\", \"p\": \"9.5\", \"id\": \"0\"}, {\"d\": \"Bife carbonero\", \"p\": \"7\", \"id\": \"1\"}, {\"d\": \"Filete de pollo carbonero\", \"p\": \"6.5\", \"id\": \"2\"}, {\"d\": \"Chuleta de cerdo carbonero\", \"p\": \"6.5\", \"id\": \"3\"}, {\"d\": \"Lomo de cerdo carbonero\", \"p\": \"7.5\", \"id\": \"4\"}, {\"d\": \"Parrillada Jr. Carbonero\", \"p\": \"8\", \"id\": \"5\"}, {\"d\": \"Costilla de cerdo carbonero\", \"p\": \"8.5\", \"id\": \"6\"}]}',1,1,1,1,0,5.50,'delivery-0001.appspot.com/o/op%2Fpr%2F1617-1619209609124.jpg',1,20,1000,36,200,'Parrillada junior','',100000,100000,'2020-07-25 00:38:19','2021-06-04 13:08:17',0),(1649,127,1,1,'Burrito machote','','tortilla, frejol negro o canario, pimientos, cebolla, queso, carne a elegir, guacamole, salsas, pico de gallo ','{\"lP\": [{\"d\": \"Burrito camarón\", \"p\": \"7.25\", \"id\": \"0\"}, {\"d\": \"Burrito vegetariano\", \"p\": \"5.00\", \"id\": \"1\"}, {\"d\": \"Burrito mixto\", \"p\": \"6.00\", \"id\": \"2\"}, {\"d\": \"Burrito chorizo paisa\", \"p\": \"5.00\", \"id\": \"3\"}, {\"d\": \"Burrito al pastor\", \"p\": \"5.50\", \"id\": \"4\"}, {\"d\": \"Burrito de lomo\", \"p\": \"5.50\", \"id\": \"5\"}, {\"d\": \"Burrito carnita\", \"p\": \"5.0\", \"id\": \"6\"}, {\"d\": \"Burrito de pollo\", \"p\": \"5.50\", \"id\": \"7\"}]}',0,1,1,1,0,4.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F1649-1599020977997.jpg',1,20,1000,3,200,'Burrito machote','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1650,127,1,1,'Enchiladas del güero','','Tortilla de trigo,  bastante queso, pimientos, cebolla, chile, carne a elegir, pimiento, guacamole, pico gallo','{\"lP\": [{\"d\": \"Enchilada de pollo\", \"p\": \"5.0\", \"id\": \"0\"}, {\"d\": \"Enchilada carnita\", \"p\": \"4.50\", \"id\": \"1\"}, {\"d\": \"Enchilada de lomo\", \"p\": \"5.50\", \"id\": \"2\"}, {\"d\": \"Enchilada al pastor\", \"p\": \"5.50\", \"id\": \"3\"}, {\"d\": \"Enchilada de chorizo paisa\", \"p\": \"5.0\", \"id\": \"4\"}, {\"d\": \"Enchilada mixta\", \"p\": \"5.50\", \"id\": \"5\"}, {\"d\": \"Enchilada vegetariana\", \"p\": \"5.0\", \"id\": \"6\"}]}',0,1,1,1,0,4.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F1650-1599020986164.jpg',1,20,1000,4,200,'Enchiladas del güero','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1651,127,1,1,'Burrito crunch y potato','','Tortilla de trigo, nachos triturados o arroz, guacamole, frejol negro o canario, pico de gallo, salsa, carne','{\"lP\": [{\"d\": \"Burrito crunch de pollo\", \"p\": \"6.0\", \"id\": \"0\"}, {\"d\": \"Burrito crunch carnita\", \"p\": \"5.50\", \"id\": \"1\"}, {\"d\": \"Burrito crunch de lomo\", \"p\": \"6.00\", \"id\": \"2\"}, {\"d\": \"Burrito crunch al pastor\", \"p\": \"6.00\", \"id\": \"3\"}, {\"d\": \"Burrito crunch chorizo paisa\", \"p\": \"5.50\", \"id\": \"4\"}, {\"d\": \"Burrito crunch mixto\", \"p\": \"6.50\", \"id\": \"5\"}, {\"d\": \"Burrito crunch vegetariano\", \"p\": \"5.50\", \"id\": \"6\"}, {\"d\": \"Burrito crunch de camarón\", \"p\": \"8.00\", \"id\": \"7\"}]}',0,1,1,1,0,5.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1651-1599020996079.jpg',1,20,1000,1,200,'Burrito crunch y potato','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1652,127,1,1,'Enchiladas güey','','Arroz amarillo con choclo y frijol acompañado de enchilada en su salsa, guacamole, nachos, pico de gallo ','{\"lP\": [{\"d\": \"Enchilada güey de pollo\", \"p\": \"5.50\", \"id\": \"0\"}, {\"d\": \"Enchilada güey de camarón\", \"p\": \"7.0\", \"id\": \"1\"}, {\"d\": \"Enchilada güey de lomo\", \"p\": \"6.25\", \"id\": \"2\"}, {\"d\": \"Enchilada güey mixta\", \"p\": \"7.25\", \"id\": \"3\"}, {\"d\": \"Enchilada güey chorizo paisa\", \"p\": \"5.25\", \"id\": \"4\"}]}',0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1652-1599021003413.jpg',1,20,1000,1,200,'Enchiladas güey','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1653,127,1,1,'Cheese nachos','','Nachos, queso cheddar, holandés y parmesano, cebolla, guacamole, salsa de la casa, pimiento, carne y frijol','{\"lP\": [{\"d\": \"Cheese nacho\", \"p\": \"2.75\", \"id\": \"0\"}, {\"d\": \"Cheese nacho simple\", \"p\": \"3.0\", \"id\": \"1\"}, {\"d\": \"Cheese nacho supremo carne\", \"p\": \"4.0\", \"id\": \"2\"}, {\"d\": \"Cheese nacho supremo pollo\", \"p\": \"5.0\", \"id\": \"3\"}, {\"d\": \"Cheese nacho supremo mixto\", \"p\": \"6.0\", \"id\": \"4\"}, {\"d\": \"Cheese nacho supremo chorizo\", \"p\": \"5.0\", \"id\": \"5\"}, {\"d\": \"Cheese nacho supremo costillas\", \"p\": \"6.0\", \"id\": \"6\"}, {\"d\": \"Cheese nacho supremo cerdo\", \"p\": \"6.0\", \"id\": \"7\"}, {\"d\": \"Cheese nacho supremo camarón\", \"p\": \"7.0\", \"id\": \"8\"}, {\"d\": \"Cheese nacho supremo vegetariano\", \"p\": \"5.0\", \"id\": \"9\"}, {\"d\": \"Cheese nacho supremo de lomo\", \"p\": \"5.50\", \"id\": \"10\"}, {\"d\": \"Supremo napolitano: carne molida, salsa roja, choricill\", \"p\": \"5.50\", \"id\": \"11\"}, {\"d\": \"Supremo agridulce: carne con salsa agriculce\", \"p\": \"5.0\", \"id\": \"12\"}, {\"d\": \"Supremo texano: tocino, carnita o pollo, salsa roja\", \"p\": \"6.0\", \"id\": \"13\"}]}',0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1653-1599021011879.jpg',1,20,1000,4,200,'Cheese nachos','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1654,127,1,1,'Cheese burritos','','Tortilla trigo, queso cheddar, holandés y parmesano, frijol negro o canario,  pimiento, cebolla, carne, guacam','{\"lP\": [{\"d\": \"Cheese burrito de pollo\", \"p\": \"6.50\", \"id\": \"0\"}, {\"d\": \"Cheese burrito carnita\", \"p\": \"6.0\", \"id\": \"1\"}, {\"d\": \"Cheese burrito de lomo\", \"p\": \"6.50\", \"id\": \"2\"}, {\"d\": \"Cheese burrito al pastor\", \"p\": \"6.50\", \"id\": \"3\"}, {\"d\": \"Cheese burrito chorizo paisa\", \"p\": \"6.00\", \"id\": \"4\"}, {\"d\": \"Cheese burrito mixto\", \"p\": \"7.0\", \"id\": \"5\"}, {\"d\": \"Cheese burrito vegetariano\", \"p\": \"6.00\", \"id\": \"6\"}, {\"d\": \"Cheese burrito camarón\", \"p\": \"8.0\", \"id\": \"7\"}]}',0,1,1,1,0,5.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F1654-1599021022563.jpg',1,20,1000,0,200,'Cheese burritos','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1655,127,1,1,'Wraps','','Tortilla de trigo, queso holandés derretido, lehcuga, tomate, carne a su gusto','{\"lP\": [{\"d\": \"Wraps de pollo\", \"p\": \"4.25\", \"id\": \"0\"}, {\"d\": \"Wraps de carne\", \"p\": \"3.75\", \"id\": \"1\"}, {\"d\": \"Wraps mixto\", \"p\": \"4.75\", \"id\": \"2\"}, {\"d\": \"Wraps de camarón\", \"p\": \"5.75\", \"id\": \"3\"}, {\"d\": \"Wraps de cerdo\", \"p\": \"4.25\", \"id\": \"4\"}, {\"d\": \"Wraps de chorizo paisa\", \"p\": \"3.75\", \"id\": \"5\"}, {\"d\": \"Wraps vegetarinao\", \"p\": \"3.75\", \"id\": \"6\"}]}',0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1655-1599021031264.jpg',1,20,1000,3,200,'Wraps','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1656,127,1,1,'Wraps crunch','','tortilla de trigo, queso holandés derretido, lechuga, tomate, carne a su gusto y nachos triturados','{\"lP\": [{\"d\": \"Wraps crunch de pollo\", \"p\": \"4.75\", \"id\": \"0\"}, {\"d\": \"Wraps crunch de carne\", \"p\": \"4.25\", \"id\": \"1\"}, {\"d\": \"Wraps crunch mixto\", \"p\": \"5.25\", \"id\": \"2\"}, {\"d\": \"Wraps crunch  de camarón\", \"p\": \"6.25\", \"id\": \"3\"}, {\"d\": \"Wraps crunch de cerdo \", \"p\": \"4.75\", \"id\": \"4\"}, {\"d\": \"Wraps crunch chorizo paisa\", \"p\": \"4.25\", \"id\": \"5\"}, {\"d\": \"Wraps crunch vegetariano\", \"p\": \"4.25\", \"id\": \"6\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1656-1599021041842.jpg',1,20,1000,1,200,'Wraps crunch','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1657,127,1,1,'Nachos supremos','','Nachos, queso derretido, cebolla perla, guacamole, salsa, pimiento de colores, carne a su elección, frejol','{\"lP\": [{\"d\": \"Nacho\", \"p\": \"1.75\", \"id\": \"0\"}, {\"d\": \"Nacho simple\", \"p\": \"2.00\", \"id\": \"1\"}, {\"d\": \"Nacho supremo de carne\", \"p\": \"3.00\", \"id\": \"2\"}, {\"d\": \"Nacho supremo de pollo\", \"p\": \"3.75\", \"id\": \"3\"}, {\"d\": \"Nacho supremo mixto\", \"p\": \"5.00\", \"id\": \"4\"}, {\"d\": \"Nacho supremo de chorizo\", \"p\": \"4.00\", \"id\": \"5\"}, {\"d\": \"Nacho supremo de costillas\", \"p\": \"5.25\", \"id\": \"6\"}, {\"d\": \"Nacho supremo de cerdo\", \"p\": \"5.25\", \"id\": \"7\"}, {\"d\": \"Nacho supremo de camarón\", \"p\": \"6.25\", \"id\": \"8\"}, {\"d\": \"Nacho supremo vegetariano\", \"p\": \"3.75\", \"id\": \"9\"}, {\"d\": \"Nacho supremo de lomo\", \"p\": \"4.50\", \"id\": \"10\"}, {\"d\": \"Supremo napolitano: carne molida, salsa roja, choricill\", \"p\": \"4.50\", \"id\": \"11\"}, {\"d\": \"Supremo agridulce: carne con salsa agridulce\", \"p\": \"3.75\", \"id\": \"12\"}, {\"d\": \"Supremo texano: tocino, carnita o pollo, salsa roja\", \"p\": \"5.00\", \"id\": \"13\"}]}',0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1657-1599021052429.jpg',1,20,1000,61,200,'Nachos supremos','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1658,127,1,1,'Nacho supremo mix','','nachos, papas, queso, cebolla, guacamole, salsa, pimientos, carne a elegir, fréjol a elegir','{\"lP\": [{\"d\": \"Nacho mix\", \"p\": \"2.25\", \"id\": \"0\"}, {\"d\": \"Nacho simple mix\", \"p\": \"2.50\", \"id\": \"1\"}, {\"d\": \"Nacho supremo mix de carne\", \"p\": \"3.50\", \"id\": \"2\"}, {\"d\": \"Nacho supremo mix de pollo\", \"p\": \"4.25\", \"id\": \"3\"}, {\"d\": \"Nacho supremo mix de pollo y carne\", \"p\": \"5.50\", \"id\": \"4\"}, {\"d\": \"Nacho supremo mix de chorizo\", \"p\": \"4.50\", \"id\": \"5\"}, {\"d\": \"Nacho supremo mix de costillas\", \"p\": \"5.75\", \"id\": \"6\"}, {\"d\": \"Nacho supremo mix de cerdo\", \"p\": \"5.50\", \"id\": \"7\"}, {\"d\": \"Nacho supremo mix de camarón\", \"p\": \"6.25\", \"id\": \"8\"}, {\"d\": \"Nacho supremo mix vegetariano\", \"p\": \"4.25\", \"id\": \"9\"}, {\"d\": \"Nacho supremo mix de lomo\", \"p\": \"5.00\", \"id\": \"10\"}, {\"d\": \"Supremo napolitano mix\", \"p\": \"5.00\", \"id\": \"11\"}, {\"d\": \"Supremo agridulce mix\", \"p\": \"4.25\", \"id\": \"12\"}, {\"d\": \"Supremo texano mix: tocino, carnita o pollo, salsa roja\", \"p\": \"5.50\", \"id\": \"13\"}]}',0,1,1,1,0,2.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1658-1599021064558.jpg',1,20,1000,136,200,'Nacho supremo mix','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1659,127,1,1,'Tacos del güero','','Tortilla de maíz o trigo, fréjol negro o canario, pico de gallo,  salsa de la casa, guacamole y carne.','{\"lP\": [{\"d\": \"Taco de pollo\", \"p\": \"4.25\", \"id\": \"0\"}, {\"d\": \"Taco de carnita\", \"p\": \"3.75\", \"id\": \"1\"}, {\"d\": \"Taco de lomo\", \"p\": \"4.50\", \"id\": \"2\"}, {\"d\": \"Taco al pastor\", \"p\": \"4.25\", \"id\": \"3\"}, {\"d\": \"taco de chorizo paisa\", \"p\": \"4.0\", \"id\": \"4\"}, {\"d\": \"Taco mixto\", \"p\": \"4.75\", \"id\": \"5\"}, {\"d\": \"Taco de camarón\", \"p\": \"6.25\", \"id\": \"6\"}, {\"d\": \"Taco vegetariano\", \"p\": \"3.75\", \"id\": \"7\"}]}',0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1659-1599021075890.jpg',1,20,1000,16,200,'Tacos del güero','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1660,127,1,1,'Tacos crunch y potato','','Tortilla de maíz o trigo, fréjol negro o canario, pico de gallo, salsa, guacamole, carne y nachos triturados','{\"lP\": [{\"d\": \"Taco crunch  de pollo\", \"p\": \"4.75\", \"id\": \"0\"}, {\"d\": \"Taco crunch de carnita\", \"p\": \"4.25\", \"id\": \"1\"}, {\"d\": \"Taco crunch  de lomo\", \"p\": \"5.00\", \"id\": \"2\"}, {\"d\": \"Taco crunch al pastor\", \"p\": \"4.75\", \"id\": \"3\"}, {\"d\": \"Taco crunch  chorizo paisa\", \"p\": \"4.50\", \"id\": \"4\"}, {\"d\": \"Taco crunch  mixto\", \"p\": \"5.25\", \"id\": \"5\"}, {\"d\": \"Taco crunch de camarón\", \"p\": \"6.75\", \"id\": \"6\"}, {\"d\": \"Taco crunch vegetariano\", \"p\": \"4.25\", \"id\": \"7\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1660-1599021089379.jpg',1,20,1000,2,200,'Tacos crunch y potato','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1661,127,1,1,'Papa güero','','Papas fritas, queso derretido, frejol a su elección, guacamole, pico de gallo, salsa, carne a elegir ','{\"lP\": [{\"d\": \"Papa güero de pollo\", \"p\": \"3.75\", \"id\": \"0\"}, {\"d\": \"Papa güero de carne\", \"p\": \"3.50\", \"id\": \"1\"}, {\"d\": \"Papa güero mixta\", \"p\": \"5.00\", \"id\": \"2\"}, {\"d\": \"Papa güero chorizo paisa\", \"p\": \"4.00\", \"id\": \"3\"}, {\"d\": \"Papa güero de lomo\", \"p\": \"4.50\", \"id\": \"4\"}, {\"d\": \"Papa güero de cerdo\", \"p\": \"4.50\", \"id\": \"5.25\"}, {\"d\": \"Papa güero vegetariana\", \"p\": \"3.50\", \"id\": \"6\"}]}',0,1,1,1,0,3.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1661-1599021102654.jpg',1,20,1000,41,200,'Papa güero','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1662,127,1,1,'Potato taco','','Tortilla de maiz o trigo, fréjol negro o canario, pico de gallo, salsa de la casa, guacamole, papas y carne','{\"lP\": [{\"d\": \"Potato taco de pollo\", \"p\": \"4.75\", \"id\": \"0\"}, {\"d\": \"Potato taco de carnita\", \"p\": \"4.25\", \"id\": \"1\"}, {\"d\": \"Potato taco al pastor\", \"p\": \"5.00\", \"id\": \"2\"}, {\"d\": \"Potato taco chorizo paisa\", \"p\": \"5.00\", \"id\": \"3\"}, {\"d\": \"Potato taco mixto\", \"p\": \"5.00\", \"id\": \"4\"}, {\"d\": \"Potato taco vegetariano\", \"p\": \"4.75\", \"id\": \"5\"}, {\"d\": \"Potato taco de camarón\", \"p\": \"6.75\", \"id\": \"6\"}]}',0,1,1,1,0,4.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1662-1599021152861.jpg',1,20,1000,1,200,'Potato taco','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1663,127,1,1,'Potato burritos','','Tortilla de trigo, fréjol negro o canario, pimiento, cebolla, queso, carne, guacamole, salsa, papa y pico gall','{\"lP\": [{\"d\": \"Potato burrito de pollo\", \"p\": \"6\", \"id\": \"0\"}, {\"d\": \"Potato burrito de carnita\", \"p\": \"5.5\", \"id\": \"1\"}, {\"d\": \"Potato burrito al pastor\", \"p\": \"6\", \"id\": \"2\"}, {\"d\": \"Potato burrito chorizo paisa\", \"p\": \"5.5\", \"id\": \"3\"}, {\"d\": \"Potato burrito mixto\", \"p\": \"6.5\", \"id\": \"4\"}, {\"d\": \"Potato burrito vegetariano\", \"p\": \"5.5\", \"id\": \"5\"}, {\"d\": \"Potato burrito de camarón\", \"p\": \"7.5\", \"id\": \"6\"}]}',0,1,1,1,0,5.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1663-1599021167516.jpg',1,20,1000,0,200,'Potato burritos','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1664,127,1,1,'Bandejitas del güero','','Papas fritas, chifles, platanitos, carne a su elección, choricillo','{\"lP\": [{\"d\": \"Bandejita de pollo\", \"p\": \"5.25\", \"id\": \"0\"}, {\"d\": \"Bandejita de lomo\", \"p\": \"5.75\", \"id\": \"1\"}, {\"d\": \"Bandejita mixto\", \"p\": \"6.75\", \"id\": \"2\"}, {\"d\": \"Bandejita chorizo paisa\", \"p\": \"5.25\", \"id\": \"3\"}, {\"d\": \"Bandejita de costillas\", \"p\": \"6.25\", \"id\": \"4\"}, {\"d\": \"Bandejita de cerdo\", \"p\": \"5.25\", \"id\": \"5\"}, {\"d\": \"Bandejita de camarón\", \"p\": \"7.75\", \"id\": \"6\"}, {\"d\": \"Bandejita super cuate: pollo, lomo, costillas, 3 alitas\", \"p\": \"8.25\", \"id\": \"7\"}, {\"d\": \"Bandejita el cuate: pollo, lomo, costillas\", \"p\": \"7.25\", \"id\": \"8\"}, {\"d\": \"Bandejita paisa\", \"p\": \"8.75\", \"id\": \"9\"}, {\"d\": \"Bandejita extreme\", \"p\": \"9.75\", \"id\": \"10\"}]}',0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1664-1599021179393.jpg',1,20,1000,5,200,'Bandejitas del güero','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1665,127,1,1,'3 Garrotazos de chile','','Fréjol canario o negro, chile, cebolla, pimiento, carne, guacamole, pico de gallo, salsa, nachos','{\"lP\": [{\"d\": \"3 G de pollo\", \"p\": \"4.25\", \"id\": \"0\"}, {\"d\": \"3 G de carne\", \"p\": \"3.75\", \"id\": \"1\"}, {\"d\": \"3 G mixto\", \"p\": \"5.75\", \"id\": \"2\"}, {\"d\": \"3 G chorizo paisa\", \"p\": \"3.75\", \"id\": \"3\"}, {\"d\": \"3 G de cerdo\", \"p\": \"4.25\", \"id\": \"4\"}, {\"d\": \"3 G de lomo\", \"p\": \"4.25\", \"id\": \"5\"}, {\"d\": \"3 G vegetariano\", \"p\": \"3.75\", \"id\": \"6\"}]}',0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1665-1599021191399.jpg',1,20,1000,0,200,'3 Garrotazos de chile','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1666,127,1,1,'Alitas y costillitas','','Papas fritas, nachos o choclo, choricillo y 5 alitas o costillas con salsa a su elección','{\"lP\": [{\"d\": \"Alitas BBQ\", \"p\": \"5.25\", \"id\": \"0\"}, {\"d\": \"Alitas picantes\", \"p\": \"5.25\", \"id\": \"1\"}, {\"d\": \"Alitas melimostaza\", \"p\": \"5.25\", \"id\": \"2\"}, {\"d\": \"Alitas jack daniels\", \"p\": \"6.25\", \"id\": \"3\"}, {\"d\": \"Alitas en salsa búfalo\", \"p\": \"6.25\", \"id\": \"4\"}, {\"d\": \"Costillas bbq\", \"p\": \"5.25\", \"id\": \"5\"}, {\"d\": \"Costillas búfalo\", \"p\": \"6.25\", \"id\": \"6\"}, {\"d\": \"Costillas melimostaza \", \"p\": \"5.25\", \"id\": \"7\"}]}',0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1666-1599021202089.jpg',1,20,1000,35,200,'Alitas y costillitas','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1667,127,1,1,'Super papa','','Papas fritas, mayonesa, choricillo, platanito y carne a su elección','{\"lP\": [{\"d\": \"Papa sencilla\", \"p\": \"1.75\", \"id\": \"0\"}, {\"d\": \"Papas\", \"p\": \"1.25\", \"id\": \"1\"}, {\"d\": \"Salchipapa\", \"p\": \"2.25\", \"id\": \"2\"}, {\"d\": \"Súper papa paisa\", \"p\": \"3.75\", \"id\": \"3\"}, {\"d\": \"Súper papa de lomo\", \"p\": \"4.50\", \"id\": \"4\"}, {\"d\": \"Súper papa de pollo\", \"p\": \"4.50\", \"id\": \"5\"}, {\"d\": \"Súper papa de costilla\", \"p\": \"5.25\", \"id\": \"6\"}, {\"d\": \"Súper papa vegetariana\", \"p\": \"3.50\", \"id\": \"7\"}, {\"d\": \"Papa + 3 alitas\", \"p\": \"3.75\", \"id\": \"8\"}, {\"d\": \"Papa mixta\", \"p\": \"5.0\", \"id\": \"9\"}]}',0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1667-1599021213981.jpg',1,20,1000,7,200,'Super papa','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1668,127,1,1,'Camarones','','Camarón a su elección, acompañado de papas fritas, nachos o choclo, choricillo y platanito','{\"lP\": [{\"d\": \"Camarones a la BBQ\", \"p\": \"6.75\", \"id\": \"0\"}, {\"d\": \"camarones texanos\", \"p\": \"7.25\", \"id\": \"1\"}, {\"d\": \"Camarones en salsa búfalo\", \"p\": \"7.25\", \"id\": \"2\"}]}',0,1,1,1,0,6.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1668-1599021224959.jpg',1,20,1000,6,200,'Camarones','',100000,100000,'2020-08-03 03:01:37','2021-06-04 13:08:17',0),(1669,128,1,1,'Sopas','','Sopa de marisco, pan poc, pollo, wantan, verdura','{\"lP\": [{\"d\": \"Sopa de marisco\", \"p\": \"3.1\", \"id\": \"0\"}, {\"d\": \"Sopa pan poc \", \"p\": \"3.1\", \"id\": \"1\"}, {\"d\": \"Sopa de pollo\", \"p\": \"3.1\", \"id\": \"2\"}, {\"d\": \"Sopa de wantan\", \"p\": \"3.1\", \"id\": \"3\"}, {\"d\": \"Sopa de verdura\", \"p\": \"1.6\", \"id\": \"4\"}]}',0,1,1,1,0,1.60,'delivery-0001.appspot.com/o/rv%2Fpr%2F1669-1599021309637.jpg',1,20,1000,10,200,'Sopas','',100000,100000,'2020-08-07 05:04:53','2021-06-04 13:08:17',0),(1670,128,1,1,'Chaulafán','','Arroz, pollo, carne, chancho, camarón, mariscos, huevo, vegetales ','{\"lP\": [{\"d\": \"1/2 Chaulafán especial\", \"p\": \"4.0\", \"id\": \"0\"}, {\"d\": \"1/2 Chaulafán de pollo\", \"p\": \"4.0\", \"id\": \"1\"}, {\"d\": \"1/2 Chaulafán de chancho\", \"p\": \"4.0\", \"id\": \"2\"}, {\"d\": \"1/2 Chaulafán de camarón\", \"p\": \"5.25\", \"id\": \"3\"}, {\"d\": \"Chaulafán vegetariano\", \"p\": \"4.0\", \"id\": \"4\"}, {\"d\": \"Chaulafán oriental\", \"p\": \"5.75\", \"id\": \"5\"}, {\"d\": \"Chaulafán especial\", \"p\": \"5.75\", \"id\": \"6\"}, {\"d\": \"Chaulafán de pollo\", \"p\": \"5.75\", \"id\": \"7\"}, {\"d\": \"Chaulafán de chancho\", \"p\": \"5.75\", \"id\": \"8\"}, {\"d\": \"Chaulafán de mariscos\", \"p\": \"6.75\", \"id\": \"9\"}, {\"d\": \"Chaulafán de camarón\", \"p\": \"7.25\", \"id\": \"10\"}, {\"d\": \"Chaulafán chop suey\", \"p\": \"6.75\", \"id\": \"11\"}, {\"d\": \"Chaulafán de huevo\", \"p\": \"4.0\", \"id\": \"12\"}]}',0,1,1,1,1,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1670-1599021317426.jpg',1,20,1000,249,200,'Chaulafán','',100000,100000,'2020-08-07 05:04:53','2021-06-22 03:51:52',0),(1671,128,1,1,'Tallarines','','Tallarín, carne, pollo, mariscos, camarón, vegetales','{\"lP\": [{\"d\": \"Tallarín mixto\", \"p\": \"7.25\", \"id\": \"0\"}, {\"d\": \"Tallarín especial\", \"p\": \"6.25\", \"id\": \"1\"}, {\"d\": \"Tallarín de pollo\", \"p\": \"6.25\", \"id\": \"2\"}, {\"d\": \"Tallarín de res \", \"p\": \"6.25\", \"id\": \"3\"}, {\"d\": \"Tallarín de chancho\", \"p\": \"6.25\", \"id\": \"4\"}, {\"d\": \"Tallarín de marisco\", \"p\": \"6.75\", \"id\": \"5\"}, {\"d\": \"Tallarín de camarón \", \"p\": \"9.25\", \"id\": \"6\"}, {\"d\": \"Tallarín chop suey\", \"p\": \"6.75\", \"id\": \"7\"}, {\"d\": \"Tallarín  de verdura\", \"p\": \"4.0\", \"id\": \"8\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1671-1599021325743.jpg',1,20,1000,17,200,'Tallarines','',100000,100000,'2020-08-07 05:04:53','2021-06-04 13:08:17',0),(1672,128,1,1,'Planchas','','Camarón, mariscos, pollo, chancho, lomo, chop suey','{\"lP\": [{\"d\": \"Camarón con brócoli a la plancha\", \"p\": \"9.25\", \"id\": \"0\"}, {\"d\": \"Marisco con brócoli a la plancha\", \"p\": \"7.25\", \"id\": \"1\"}, {\"d\": \"Plancha especial\", \"p\": \"6.25\", \"id\": \"2\"}, {\"d\": \"Pollo a la plancha\", \"p\": \"6.25\", \"id\": \"3\"}, {\"d\": \"Lomo a la plancha\", \"p\": \"6.25\", \"id\": \"4\"}, {\"d\": \"Chancho a la plancha\", \"p\": \"6.25\", \"id\": \"5\"}, {\"d\": \"Marisco a la plancha\", \"p\": \"7.25\", \"id\": \"6\"}, {\"d\": \"Camarón a la plancha\", \"p\": \"9.25\", \"id\": \"7\"}, {\"d\": \"Plancha chop suey\", \"p\": \"7.25\", \"id\": \"8\"}]}',0,1,1,1,0,6.25,'delivery-0001.appspot.com/o/rv%2Fpr%2F1672-1599021334011.jpg',1,20,1000,4,200,'Planchas','',100000,100000,'2020-08-07 05:04:53','2021-06-04 13:08:17',0),(1673,128,1,1,'Verduras','','Verduras, brócoli, pollo, mariscos, camarón, pollo, chancho','{\"lP\": [{\"d\": \"Lomo con verduras\", \"p\": \"5.75\", \"id\": \"0\"}, {\"d\": \"Plato con verduras\", \"p\": \"4.0\", \"id\": \"1\"}, {\"d\": \"Pollo con verduras\", \"p\": \"5.75\", \"id\": \"2\"}, {\"d\": \"Pollo con brócoli\", \"p\": \"6.25\", \"id\": \"3\"}, {\"d\": \"Lomo con brócoli \", \"p\": \"6.25\", \"id\": \"4\"}, {\"d\": \"Chancho con verduras\", \"p\": \"5.75\", \"id\": \"5\"}, {\"d\": \"Chancho con brócoli\", \"p\": \"6.25\", \"id\": \"6\"}, {\"d\": \"Marisco con verduras\", \"p\": \"6.75\", \"id\": \"7\"}, {\"d\": \"Marisco con brócoli\", \"p\": \"6.75\", \"id\": \"8\"}, {\"d\": \"Gran chop suey\", \"p\": \"6.75\", \"id\": \"9\"}, {\"d\": \"Pescado con verduras\", \"p\": \"6.75\", \"id\": \"10\"}, {\"d\": \"Camarón con verduras\", \"p\": \"9.25\", \"id\": \"11\"}, {\"d\": \"Camarón con brócoli \", \"p\": \"9.25\", \"id\": \"12\"}]}',0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1673-1599021343076.jpg',1,20,1000,12,200,'Verduras','',100000,100000,'2020-08-07 05:04:53','2021-06-04 13:08:17',0),(1674,128,1,1,'Apanados y fritos','','Pollo, lomo, chancho, camarón, churrasco','{\"lP\": [{\"d\": \"Pollo apanado\", \"p\": \"5.75\", \"id\": \"0\"}, {\"d\": \"Pollo frito especial\", \"p\": \"5.75\", \"id\": \"1\"}, {\"d\": \"Lomo apanado\", \"p\": \"5.75\", \"id\": \"2\"}, {\"d\": \"Lomo frito especial\", \"p\": \"5.75\", \"id\": \"3\"}, {\"d\": \"Chancho frito especial\", \"p\": \"5.75\", \"id\": \"4\"}, {\"d\": \"Camarón reventado\", \"p\": \"9.25\", \"id\": \"5\"}, {\"d\": \"Camarón apanado\", \"p\": \"9.25\", \"id\": \"6\"}, {\"d\": \"Churrasco\", \"p\": \"6.75\", \"id\": \"7\"}]}',0,1,1,1,0,5.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F1674-1599021352378.jpg',1,20,1000,9,200,'Apanados y fritos','',100000,100000,'2020-08-07 05:04:53','2021-06-04 13:08:17',0),(1675,128,1,1,'Carnes y mariscos en salsas','','Pollo, chancho, camarón, pescado en salsa agridulce y tamarindo','{\"lP\": [{\"d\": \"Pollo agridulce\", \"p\": \"6.75\", \"id\": \"0\"}, {\"d\": \"Chancho con tamarindo\", \"p\": \"6.75\", \"id\": \"1\"}, {\"d\": \"Chancho agridulce \", \"p\": \"6.75\", \"id\": \"2\"}, {\"d\": \"Chancho con tamarindo\", \"p\": \"6.75\", \"id\": \"3\"}, {\"d\": \"Camarón agridulce\", \"p\": \"9.25\", \"id\": \"4\"}, {\"d\": \"Camarón con tamarindo\", \"p\": \"9.25\", \"id\": \"5\"}, {\"d\": \"Pescado agridulce \", \"p\": \"6.75\", \"id\": \"6\"}]}',0,1,1,1,0,6.75,'delivery-0001.appspot.com/o/rv%2Fpr%2F1675-1599021362073.jpg',1,20,1000,2,200,'Carnes y mariscos en salsas','',100000,100000,'2020-08-07 05:04:53','2021-06-04 13:08:17',0),(1676,128,1,1,'Mixtos','','Mixto de res, pollo, chancho, mariscos, camarón, chop suey, verduras','{\"lP\": [{\"d\": \"Mixto de verduras: sólo verduras\", \"p\": \"5.0\", \"id\": \"0\"}, {\"d\": \"Mixto oriental\", \"p\": \"7.25\", \"id\": \"1\"}, {\"d\": \"Mixto especial\", \"p\": \"7.25\", \"id\": \"2\"}, {\"d\": \"Mixto de pollo\", \"p\": \"7.25\", \"id\": \"3\"}, {\"d\": \"Mixto de res\", \"p\": \"7.25\", \"id\": \"4\"}, {\"d\": \"Mixto de chancho\", \"p\": \"7.25\", \"id\": \"5\"}, {\"d\": \"Mixto de mariscos\", \"p\": \"7.75\", \"id\": \"6\"}, {\"d\": \"Mixto chop suey\", \"p\": \"7.75\", \"id\": \"7\"}, {\"d\": \"Mixto de camarón\", \"p\": \"9.25\", \"id\": \"8\"}]}',0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1676-1599021372024.jpg',1,20,1000,16,200,'Mixtos','',100000,100000,'2020-08-07 05:04:53','2021-06-04 13:08:17',0),(1677,128,1,1,'Gran promoción especial','','1 chaufarín especial + 1 mixto especial + 1 chaw mein especial + bebida 1 L gratis + wantán frito gratis','{\"lP\": []}',1,1,1,1,0,19.25,'delivery-0001.appspot.com/o/op%2Fpr%2F1677-1608569060102.jpg',1,20,1000,1,200,'Gran promoción especial','',100000,100000,'2020-08-07 05:04:53','2021-06-04 13:08:17',0),(1678,128,1,1,'Porciones y bebidas ','','Cervezas, Jugos, agua, y porciones ','{\"lP\": [{\"d\": \"Wantán frito\", \"p\": \"3.8\", \"id\": \"0\"}, {\"d\": \"Porción de arroz\", \"p\": \"1.1\", \"id\": \"1\"}, {\"d\": \"Porción de papas\", \"p\": \"1.6\", \"id\": \"2\"}, {\"d\": \"Porción de tallarín\", \"p\": \"1.1\", \"id\": \"3\"}, {\"d\": \"Cola litro 1/4\", \"p\": \"1.5\", \"id\": \"4\"}, {\"d\": \"Cola 2 L\", \"p\": \"2.0\", \"id\": \"5\"}, {\"d\": \"Pony Malta\", \"p\": \"0.8\", \"id\": \"6\"}, {\"d\": \"Agüa con gas\", \"p\": \"0.8\", \"id\": \"7\"}, {\"d\": \"Agua aromática\", \"p\": \"0.6\", \"id\": \"8\"}, {\"d\": \"Agua \", \"p\": \"0.5\", \"id\": \"9\"}, {\"d\": \"Café \", \"p\": \"0.6\", \"id\": \"10\"}, {\"d\": \"Té frio\", \"p\": \"1.2\", \"id\": \"11\"}, {\"d\": \"Jugo de piña \", \"p\": \"1.6\", \"id\": \"12\"}, {\"d\": \"Jugo de tomate\", \"p\": \"1.6\", \"id\": \"13\"}, {\"d\": \"Cerveza club personal\", \"p\": \"1.5\", \"id\": \"14\"}, {\"d\": \"Cerveza pilsener normal\", \"p\": \"1.75\", \"id\": \"15\"}, {\"d\": \"Cerveza pilsener litro\", \"p\": \"2.5\", \"id\": \"16\"}, {\"d\": \"Cola mediana\", \"p\": \"0.5\", \"id\": \"17\"}, {\"d\": \"Crema de coco\", \"p\": \"1.25\", \"id\": \"18\"}]}',0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1678-1599021394740.jpg',1,20,1000,8,200,'Porciones y bebidas ','',100000,100000,'2020-08-07 05:04:53','2021-06-04 13:08:17',0),(1734,104,1,1,'Pincho de Presa de Pollo con Chorizo. ','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ','{\"lP\": [{\"d\": \"Choclo asado con salsa de queso\", \"p\": \"1\", \"id\": \"0\"}, {\"d\": \"Llapingacho\", \"p\": \"0.5\", \"id\": \"1\"}]}',0,1,1,1,0,3.25,'delivery-0001.appspot.com/o/op%2Fpr%2F1734-1617381523846.jpg',1,20,1000,15,200,'Pincho de Presa de Pollo con Chorizo. ','',100000,100000,'2020-08-14 13:16:15','2021-06-04 13:08:17',0),(1735,44,1,1,'Monster nacho','','Nachos a lo monster, pimientos de colores, cebolla perla,  carne que elijas,  guacamole y pico de gallo','{\"lP\": [{\"d\": \"Mixto\", \"p\": \"9.99\", \"id\": \"0\"}, {\"d\": \"Carne\", \"p\": \"9.99\", \"id\": \"1\"}, {\"d\": \"Pollo\", \"p\": \"9.99\", \"id\": \"2\"}, {\"d\": \"Chorizo paisa\", \"p\": \"9.99\", \"id\": \"3\"}, {\"d\": \"Embutidos\", \"p\": \"9.99\", \"id\": \"4\"}]}',0,1,1,1,0,9.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F1735-1597685634684.jpg',1,20,1000,1,200,'Monster nacho','',100000,100000,'2020-08-17 17:06:14','2021-06-04 13:08:17',0),(1736,44,1,1,'Papas cheese 2x1','','papas fritas, queso derretido, carne a su elección','{\"lP\": [{\"d\": \"Carne molida\", \"p\": \"6.5\", \"id\": \"0\"}, {\"d\": \"Pollo\", \"p\": \"6.5\", \"id\": \"1\"}, {\"d\": \"Chorizo paisa\", \"p\": \"6.5\", \"id\": \"2\"}, {\"d\": \"Embutidos\", \"p\": \"6.5\", \"id\": \"3\"}, {\"d\": \"Mixto\", \"p\": \"6.5\", \"id\": \"4\"}]}',0,1,1,1,0,6.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1736-1597685842450.jpg',1,20,1000,1,200,'Papas cheese 2x1','',100000,100000,'2020-08-17 17:06:14','2021-06-04 13:08:17',0),(1737,44,1,1,'Bandejota bestial','','Cholo desgranado, papas fritas, arroz moro a lo bestia, carne que tú elijas','{\"lP\": [{\"d\": \"6 filetes de pollo\", \"p\": \"11.99\", \"id\": \"0\"}, {\"d\": \"6 presas pollo ahumado\", \"p\": \"11.99\", \"id\": \"1\"}, {\"d\": \"6 chuletas \", \"p\": \"12.99\", \"id\": \"2\"}, {\"d\": \"3 pollo, 3 chuleta, 3 carne, 3 chorizo, 3 alitas, costi\", \"p\": \"16.99\", \"id\": \"3\"}]}',0,1,1,1,0,11.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F1737-1597685916502.jpg',1,20,1000,0,200,'Bandejota bestial','',100000,100000,'2020-08-17 17:06:14','2021-06-04 13:08:17',0),(1738,43,1,1,'Combo fiesta 2 pizzas','','2 pizzas de 4 porciones cada una + helado de litro. Ingredientes a elegir: jamón o pepperoni',NULL,0,1,1,1,0,9.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1738-1597684696380.jpg',1,20,1000,1,200,'Combo fiesta 2 pizzas','',100000,100000,'2020-08-17 17:06:24','2021-06-04 13:08:17',0),(1739,43,1,1,'Mega combo # 2','','2 pizzas medianas + pizza personal + helado litro. Ingredientes: jamón, pepperoni, hawaiana, chorizo parriller',NULL,0,1,1,1,0,17.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1739-1597684709855.jpg',1,20,1000,0,200,'Mega combo # 2','',100000,100000,'2020-08-17 17:06:24','2021-06-04 13:08:17',1),(1804,135,1,1,'Almuerzos y Cenas','','3 opciones diarias de Plato fuerte, Sopas de la casa, bebida siempre de fruta natural, salsa, aderezos y ajíes','{\"lP\": [{\"d\": \"Seco de Pollo\", \"p\": \"2.5\", \"id\": \"0\"}, {\"d\": \"Tortilla de Camaron\", \"p\": \"2.5\", \"id\": \"1\"}, {\"d\": \"Milanesa Napolitana \", \"p\": \"2.5\", \"id\": \"2\"}]}',1,0,1,1,0,2.50,'delivery-0001.appspot.com/o/op%2Fpr%2F1804-1620096201386.jpg',1,20,1000,61,200,'Almuerzos y Cenas','',100000,100000,'2020-08-24 01:48:39','2021-06-04 13:08:17',0),(1805,135,1,1,'SUPER Moro parrillero','','Lomo de cerdo + filete de pollo + lomo de res + chorizo parrillero papitas fritas hechas a mano + arroz moro',NULL,0,1,1,1,0,6.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1805-1598413399467.jpg',1,20,1000,28,200,'SUPER Moro parrillero','',100000,100000,'2020-08-24 01:48:39','2021-06-04 13:08:17',1),(1806,135,1,1,'Moro con lomo de res','','Lomo de res acompañado de arroz moro + papitas fritas hechas a mano + ensalada fría y aderezos ',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1806-1598413418835.jpg',1,20,1000,18,200,'Moro con lomo de res','',100000,100000,'2020-08-24 01:48:39','2021-06-04 13:08:17',0),(1807,135,1,1,'Moro con filete de pollo','','Filete de pollo acompañado de arroz moro + papitas fritas hechas a mano + ensalada fría y aderezos',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1807-1598413463216.jpg',1,20,1000,35,200,'Moro con filete de pollo','',100000,100000,'2020-08-24 01:48:39','2022-07-11 19:02:47',0),(1808,135,1,1,'Moro con cerdo','','Lomo de cerdo acompañado de arroz moro + papitas fritas hechas a mano + ensalada fría y aderezos',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1808-1598413522866.jpg',1,20,1000,12,200,'Moro con cerdo','',100000,100000,'2020-08-24 01:48:39','2021-06-04 13:08:17',0),(1809,135,1,1,'Moros en la costa con camarón reventado','','Camarón reventado acompañado de arroz moro + papitas fritas hechas a mano + ensalada fría y aderezos',NULL,0,1,1,1,0,4.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1809-1598413555520.jpg',1,20,1000,5,200,'Moros en la costa con camarón reventado','',100000,100000,'2020-08-24 01:48:39','2021-06-04 13:08:17',0),(1810,135,1,1,'Moro a lo criollo','','Delicioso arroz moro acompañado de chorizo, huevo, papitas fritas hechas a mano +  ensalada fría y aderezos',NULL,0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1810-1598413707921.jpg',1,20,1000,5,200,'Moro a lo criollo','',100000,100000,'2020-08-24 01:48:39','2021-06-04 13:08:17',0),(1811,135,1,1,'Ceviche de camarón','','',NULL,0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1811-1598413761246.jpg',1,20,1000,1,200,'Ceviche de camarón','',100000,100000,'2020-08-24 01:48:39','2021-06-04 13:08:17',0),(1812,135,1,1,'Camarón Reventado','','Gran porción de camarón reventado acompañado de arroz blanco + papitas fritas hechas a mano + ensalada fría ',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1812-1598413774240.jpg',1,20,1000,7,200,'Camarón Reventado','',100000,100000,'2020-08-24 01:48:39','2021-06-04 13:08:17',0),(1813,135,1,1,'Pescado frito','','Pescado frito acompañado de patacones + arroz blanco o moro + ensalada fría y aderezos',NULL,0,0,1,1,0,5.00,'delivery-0001.appspot.com/o/rv%2Fpr%2F1813-1598413788929.jpg',1,20,1000,1,200,'Pescado frito','',100000,100000,'2020-08-24 01:48:39','2021-06-04 13:08:17',0),(1814,135,1,1,'Salchipapas','','Papitas fritas hechas a mano acompañadas de salchicha premiun o chorizo + ensalada fría y aderezos','{\"lP\": [{\"d\": \"Supersalchipapa: papitas + salchicha premiun + ensalada\", \"p\": \"2.5\", \"id\": \"0\"}, {\"d\": \"Super choripapa: papitas + chorizo ahumado + ensalada\", \"p\": \"2.75\", \"id\": \"1\"}]}',0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1814-1598413805202.jpg',1,20,1000,4,200,'Salchipapas','',100000,100000,'2020-08-24 01:48:39','2021-06-04 13:08:17',0),(1815,135,1,1,'Porción de moro','','Moro de lenteja, moro de arveja o  moro de frejol negro','{\"lP\": [{\"d\": \"Moro de lenteja\", \"p\": \"1.5\", \"id\": \"0\"}, {\"d\": \"Moro de arveja\", \"p\": \"1.5\", \"id\": \"1\"}, {\"d\": \"Moro de frejol negro\", \"p\": \"1.5\", \"id\": \"2\"}]}',0,1,1,0,0,1.50,'delivery-0001.appspot.com/o/rv%2Fpr%2F1815-1598413824173.jpg',1,20,1000,0,200,'Porción de moro','',100000,100000,'2020-08-24 01:48:39','2021-06-04 13:08:17',0),(1816,135,1,1,'MINI PARRILLADA','','Delicioso filete de pollo, lomo de cerdo, beff de res, chorizo gaucho, menestra del dia, arroz moro o blanco','{\"lP\": [{\"d\": \"Mini parrillada con arroz blanco\", \"p\": \"3.5\", \"id\": \"0\"}, {\"d\": \"Mini parrillada con arroz morito\", \"p\": \"3.5\", \"id\": \"1\"}]}',1,1,1,1,0,3.50,'delivery-0001.appspot.com/o/op%2Fpr%2F1816-1620088146654.jpg',1,20,1000,49,200,'MINI PARRILLADA','',100000,100000,'2020-08-24 01:48:39','2021-06-22 13:21:42',0),(1817,135,1,1,'','','',NULL,0,0,0,0,0,0.00,'',1,20,1000,0,200,'','',100000,100000,'2020-08-24 01:48:39','2021-06-04 13:08:17',0),(1906,117,1,1,'Promo alitas','','4 o 12 alitas, incluye papas + nanahoria + club o jugo','{\"lP\": [{\"d\": \"4 alitas + papas + zanahoria + 1 jugo\", \"p\": \"4.99\", \"id\": \"0\"}, {\"d\": \"4 alitas + papas + zanahoria + 1 club\", \"p\": \"4.99\", \"id\": \"1\"}, {\"d\": \"12 alitas + papas + zanahoria + 3 jugos\", \"p\": \"13.99\", \"id\": \"2\"}, {\"d\": \"12 alitas + papas + zanahoria + 3 club\", \"p\": \"13.99\", \"id\": \"3\"}]}',0,0,0,1,0,4.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F1906-1599525632576.jpg',1,20,1000,1,200,'Promo alitas','',100000,100000,'2020-09-07 23:28:54','2021-06-04 13:08:17',0),(1907,117,1,1,'Promo nachos o papas','','Nachos o papas + carne molida + chorizo + club o jugo','{\"lP\": [{\"d\": \"Papas + carne molida + chorizo + jugo\", \"p\": \"3.99\", \"id\": \"0\"}, {\"d\": \"Papas + carne molida + chorizo + club\", \"p\": \"3.99\", \"id\": \"1\"}, {\"d\": \"Nachos + carne molida + chorizo + jugo\", \"p\": \"3.99\", \"id\": \"2\"}, {\"d\": \"Nachos + carne molida + chorizo + club\", \"p\": \"3.99\", \"id\": \"3\"}]}',0,0,0,1,0,3.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F1907-1599525641191.jpg',1,20,1000,7,200,'Promo nachos o papas','',100000,100000,'2020-09-07 23:28:54','2021-06-04 13:08:17',0),(1908,117,1,1,'Promo hamburguesa solita o comprometida','','Hamburguesa solita o comprometida + papas + club o jugo','{\"lP\": [{\"d\": \"Hamburguesa comprometida (doble carne) + papas + jugo\", \"p\": \"6.99\", \"id\": \"0\"}, {\"d\": \"Hamburguesa comprometida (doble carne) + papas + club\", \"p\": \"6.99\", \"id\": \"1\"}, {\"d\": \"Hamburguesa solita + papas + jugo\", \"p\": \"4.99\", \"id\": \"2\"}, {\"d\": \"Hamburguesa solita + papas + club\", \"p\": \"4.99\", \"id\": \"3\"}]}',0,0,0,1,0,4.99,'delivery-0001.appspot.com/o/rv%2Fpr%2F1908-1599525651896.jpg',1,20,1000,3,200,'Promo hamburguesa solita o comprometida','',100000,100000,'2020-09-07 23:28:54','2021-06-04 13:08:17',0),(1994,2,1,1,'Colmag Z Tarro 300g','','Polvo a base de colágeno, magnesio, calcio y Vitamina C.',NULL,0,1,1,1,0,21.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1994-1610373663985.jpg',1,20,1000,0,200,'Colmag Z Tarro 300g','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(1995,2,1,1,'Colmag Z x 30 sobres','','Polvo a base de colágeno, magnesio, calcio y Vitamina C.',NULL,0,1,1,1,0,23.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1995-1610373859563.jpg',1,20,1000,0,200,'Colmag Z x 30 sobres','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(1996,2,1,1,'Gelicart','','Colágeno 30 sobres',NULL,0,1,1,1,0,49.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1996-1610374137125.jpg',1,20,1000,0,200,'Gelicart','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(1997,2,1,1,'Gelicart Action','','Colágeno 30 sobres',NULL,0,1,1,1,0,59.10,'delivery-0001.appspot.com/o/op%2Fpr%2F1997-1610376554380.jpg',1,20,1000,0,200,'Gelicart Action','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(1998,2,1,1,'Inmunolive jarabe 120 ml','','Equilibra y fortalece el sistema inmunológico, para combatir infecciones virales repetitivas.',NULL,0,1,1,1,0,18.00,'delivery-0001.appspot.com/o/op%2Fpr%2F1998-1610747496089.jpg',1,20,1000,0,200,'Inmunolive jarabe 120 ml','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(1999,2,1,1,'Kaloba gotas 20 ml','','Fortalece la respuesta del sistema inmunológico.',NULL,0,1,1,1,0,6.51,'delivery-0001.appspot.com/o/op%2Fpr%2F1999-1610748358407.jpg',1,20,1000,0,200,'Kaloba gotas 20 ml','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2000,2,1,1,'Kufer Q-ECV cápsulas','','Indicado en hígado graso, síndrome metabólico prevención primaria cardiovascular.',NULL,0,1,1,1,0,36.80,'delivery-0001.appspot.com/o/op%2Fpr%2F2000-1610748923595.jpg',1,20,1000,0,200,'Kufer Q-ECV cápsulas','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2001,2,1,1,'Lactibón PH 3,5 loción FCO','','Limpiador suave y restaurador del manto ácido.',NULL,0,1,1,1,0,22.38,'delivery-0001.appspot.com/o/op%2Fpr%2F2001-1610749487076.jpg',1,20,1000,0,200,'Lactibón PH 3,5 loción FCO','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2002,2,1,1,'Lasea 80 mg tabletas','','Se utiliza para el tratamiento de los síntomas transitorios de la ansiedad',NULL,0,1,1,1,0,42.00,'delivery-0001.appspot.com/o/op%2Fpr%2F2002-1610750485899.jpg',1,20,1000,0,200,'Lasea 80 mg tabletas','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2003,2,1,1,'Sutribol naranja jalea','','Llego el multivitaminico para el crecimiento y desarrollo de nuestros niños',NULL,0,1,1,1,0,7.42,'delivery-0001.appspot.com/o/op%2Fpr%2F2003-1610751241418.jpg',1,20,1000,0,200,'Sutribol naranja jalea','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2004,2,1,1,'Terbinafina Genfar 250mg tabletas','','Actúa impidiendo el desarrollo de los hongos',NULL,0,1,1,1,0,22.96,'delivery-0001.appspot.com/o/op%2Fpr%2F2004-1610980137117.jpg',1,20,1000,0,200,'Terbinafina Genfar 250mg tabletas','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2005,2,1,1,'Vita Sweet Stevia sobres x 50','','Endulzante natural cero calorías, indicado para control de diabetes, sobrepeso y obesidad.',NULL,0,1,1,1,0,2.83,'delivery-0001.appspot.com/o/op%2Fpr%2F2005-1610980866784.jpg',1,20,1000,0,200,'Vita Sweet Stevia sobres x 50','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2006,2,1,1,'Vita Sweet Stevia sobres x 200','','Endulzante natural cero calorías, indicado para control de diabetes, sobrepeso y obesidad.',NULL,0,1,1,1,0,9.04,'delivery-0001.appspot.com/o/op%2Fpr%2F2006-1610981192520.jpg',1,20,1000,0,200,'Vita Sweet Stevia sobres x 200','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2007,2,1,1,'Vita Sweet Sucralosa gotas 40ml','','Endulzante no aporta calorías. Además, es apto para diabéticos y personas con regímenes dietéticos',NULL,0,1,1,1,0,6.63,'delivery-0001.appspot.com/o/op%2Fpr%2F2007-1610981356578.jpg',1,20,1000,0,200,'Vita Sweet Sucralosa gotas 40ml','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2008,2,1,1,'Vita Sweet Sucralosa sobres x 100','','Endulzante no aporta calorías. Además, es apto para diabéticos y personas con regímenes dietéticos',NULL,0,1,1,1,0,4.76,'delivery-0001.appspot.com/o/op%2Fpr%2F2008-1610981679566.jpg',1,20,1000,0,200,'Vita Sweet Sucralosa sobres x 100','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2009,2,1,1,'Vita Sweet Sucralosa sobres x 200','','Endulzante no aporta calorías. Además, es apto para diabéticos y personas con regímenes dietéticos.',NULL,0,1,1,1,0,8.71,'delivery-0001.appspot.com/o/op%2Fpr%2F2009-1610982143975.jpg',1,20,1000,0,200,'Vita Sweet Sucralosa sobres x 200','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2010,2,1,1,'Vitamina C Tutti-Frutti La Sante x 12','','Vitamina soluble sirve para el crecimiento y reparación de tejidos en todas las partes del cuerpo.',NULL,0,1,1,1,0,2.52,'delivery-0001.appspot.com/o/op%2Fpr%2F2010-1610982297203.jpg',1,20,1000,0,200,'Vitamina C Tutti-Frutti La Sante x 12','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2011,2,1,1,'Vitamina C + Propóleo jarabe 240 ml','','Previene las infecciones respiratorias,se considera un antibiótico natural, y favorece al sistema digestivo.',NULL,0,1,1,1,0,8.44,'delivery-0001.appspot.com/o/op%2Fpr%2F2011-1610982686224.jpg',1,20,1000,0,200,'Vitamina C + Propóleo jarabe 240 ml','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2012,2,1,1,'VitaToro etiqueta azul adultos 500 ml','','Vigorizante y potenciador, estimulador y activador.',NULL,0,1,1,1,0,11.12,'delivery-0001.appspot.com/o/op%2Fpr%2F2012-1610983166859.jpg',1,20,1000,0,200,'VitaToro etiqueta azul adultos 500 ml','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2013,2,1,1,'Babysec Plus CH G x 24','','Pañales Ultra Absorbentes',NULL,0,1,1,1,0,4.47,'delivery-0001.appspot.com/o/op%2Fpr%2F2013-1611001892260.jpg',1,20,1000,0,200,'Babysec Plus CH G x 24','',100000,100000,'2020-10-24 15:25:47','2022-07-11 19:02:47',0),(2014,2,1,1,'Babysec Plus M x 60','','Pañales Ultra Absorbentes',NULL,0,1,1,1,0,11.40,'delivery-0001.appspot.com/o/op%2Fpr%2F2014-1611002265489.jpg',1,20,1000,0,200,'Babysec Plus M x 60','',100000,100000,'2020-10-24 15:25:47','2022-07-11 19:02:47',0),(2015,2,1,1,'Panolini Premium Plus M x 24','','Máxima protección durante toda la noche',NULL,0,1,1,1,0,8.30,'delivery-0001.appspot.com/o/op%2Fpr%2F2015-1611009898272.jpg',1,20,1000,0,200,'Panolini Premium Plus M x 24','',100000,100000,'2020-10-24 15:25:47','2022-07-11 19:02:47',0),(2016,2,1,1,'Huggies Active Sec G x 22','','Mantiene protegido hasta por 12 horas. Más absorción y menos cambios, hipoalegénicos. Libre de Parabenos',NULL,0,1,1,1,0,9.00,'delivery-0001.appspot.com/o/op%2Fpr%2F2016-1611066195805.jpg',1,20,1000,0,200,'Huggies Active Sec G x 22','',100000,100000,'2020-10-24 15:25:47','2022-07-11 19:02:47',0),(2017,2,1,1,'Huggies pañitos One Done x 80','','Mantén su piel libre de irritaciones, te permiten lidiar fácilmente con la suciedad',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/op%2Fpr%2F2017-1611066689648.jpg',1,20,1000,0,200,'Huggies pañitos One Done x 80','',100000,100000,'2020-10-24 15:25:47','2022-07-11 19:02:47',0),(2018,2,1,1,'Babysec Plus G x 24','','La mejor seguridad y protección para tu bebé',NULL,0,1,1,1,0,5.50,'delivery-0001.appspot.com/o/op%2Fpr%2F2018-1611067242067.jpg',1,20,1000,0,200,'Babysec Plus G x 24','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2019,2,1,1,'Babysec Ultra Sec XG x 16','','Su cómodo ajuste brinda mayor comodidad y libertad de movimiento',NULL,0,1,1,1,0,4.90,'delivery-0001.appspot.com/o/op%2Fpr%2F2019-1611069736321.jpg',1,20,1000,0,200,'Babysec Ultra Sec XG x 16','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2020,2,1,1,'Babysec Ultra Sec XG x 32','','Su cómodo ajuste brinda mayor comodidad y libertad de movimiento',NULL,0,1,1,1,0,9.62,'delivery-0001.appspot.com/o/op%2Fpr%2F2020-1611070438481.jpg',1,20,1000,0,200,'Babysec Ultra Sec XG x 32','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2021,2,1,1,'Babysec Ultra Sec XXG x 32','','Su cómodo ajuste brinda mayor comodidad y libertad de movimiento',NULL,0,1,1,1,0,9.62,'delivery-0001.appspot.com/o/op%2Fpr%2F2021-1611070511720.jpg',1,20,1000,0,200,'Babysec Ultra Sec XXG x 32','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2022,2,1,1,'Babysec Ultra sec XXG x 16','','Su cómodo ajuste brinda mayor comodidad y libertad de movimiento',NULL,0,1,1,1,0,4.90,'delivery-0001.appspot.com/o/op%2Fpr%2F2022-1611148369168.jpg',1,20,1000,0,200,'Babysec Ultra sec XXG x 16','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2023,2,1,1,'Pequeñin pañitos Aloe Vera x 50','','Regenerador celular que limpia y calma las irritaciones de la piel',NULL,0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/op%2Fpr%2F2023-1611148643506.jpg',1,20,1000,0,200,'Pequeñin pañitos Aloe Vera x 50','',100000,100000,'2020-10-24 15:25:47','2022-07-11 19:02:47',0),(2024,2,1,1,'Pequeñin pañitos Aloe Vera x 100','','Regenerador celular que limpia y calma las irritaciones de la piel',NULL,0,1,1,1,0,5.60,'delivery-0001.appspot.com/o/op%2Fpr%2F2024-1611148763781.jpg',1,20,1000,1,200,'Pequeñin pañitos Aloe Vera x 100','',100000,100000,'2020-10-24 15:25:47','2022-07-11 19:02:47',0),(2025,2,1,1,'Pequeñin Extraprotección XG x 18','','Cuentan con doble barrera antifugas, para evitar filtraciones',NULL,0,1,1,1,0,8.90,'delivery-0001.appspot.com/o/op%2Fpr%2F2025-1611148847079.jpg',1,20,1000,1,200,'Pequeñin Extraprotección XG x 18','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2026,2,1,1,'Pequeñin Extraprotección G x 3','','Cuentan con doble barrera antifugas, para evitar filtraciones',NULL,0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/op%2Fpr%2F2026-1611149026448.jpg',1,20,1000,0,200,'Pequeñin Extraprotección G x 3','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2027,2,1,1,'Pequeñin Extraprotección XG x 3','','Cuentan con doble barrera antifugas, para evitar filtraciones',NULL,0,1,1,1,0,1.65,'delivery-0001.appspot.com/o/op%2Fpr%2F2027-1611149111444.jpg',1,20,1000,0,200,'Pequeñin Extraprotección XG x 3','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2028,2,1,1,'Pañalin Ultra Sec XG x 20','','Cubierta interna hipoalergénica que permite proteger la piel del bebé de irritaciones y mantener su piel sana',NULL,0,1,1,1,0,4.65,'delivery-0001.appspot.com/o/op%2Fpr%2F2028-1611149228178.jpg',1,20,1000,0,200,'Pañalin Ultra Sec XG x 20','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2029,2,1,1,'Chupetes de vitamina C x 10 unidades','','Nutriente esencial y necesario para la formación y mantenimiento saludable del material intercelular.',NULL,0,1,1,1,0,2.70,'delivery-0001.appspot.com/o/op%2Fpr%2F2029-1611674497118.jpg',1,20,1000,0,200,'Chupetes de vitamina C x 10 unidades','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2030,2,1,1,'Jarabe propóleo + vitamina C Bee Farma','','Ayuda a reforzar el sisitema inmune y prevención de enfermedades.',NULL,0,1,1,1,0,10.80,'delivery-0001.appspot.com/o/op%2Fpr%2F2030-1611675548158.jpg',1,20,1000,0,200,'Jarabe propóleo + vitamina C Bee Farma','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2031,2,1,1,'Alcohol antiséptico 1000 ml Laturi','','Desinfección de la piel, utensilios, equipo y material de laboratorio','{\"lP\": []}',0,1,1,1,0,3.97,'delivery-0001.appspot.com/o/op%2Fpr%2F2031-1611675772379.jpg',1,20,1000,0,200,'Alcohol antiséptico 1000 ml Laturi','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2032,2,1,1,'Alcohol antiséptico 500 ml Laturi','','Desinfección de la piel, utensilios, equipo y material de laboratorio',NULL,0,1,1,1,0,2.69,'delivery-0001.appspot.com/o/op%2Fpr%2F2032-1611676003532.jpg',1,20,1000,0,200,'Alcohol antiséptico 500 ml Laturi','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2033,2,1,1,'Alcohol antisép. 500 ml + spray 250 ml','','Desinfección de la piel, utensilios, equipo y material de laboratorio',NULL,0,1,1,1,0,5.40,'delivery-0001.appspot.com/o/op%2Fpr%2F2033-1611676221401.jpg',1,20,1000,0,200,'Alcohol antisép. 500 ml + spray 250 ml','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2034,2,1,1,'Gel antibacterial Garden 250 ml','','Elimina el 99.9% de gérmenes y bacterias',NULL,0,1,1,1,0,4.80,'delivery-0001.appspot.com/o/op%2Fpr%2F2034-1611676406117.jpg',1,20,1000,0,200,'Gel antibacterial Garden 250 ml','',100000,100000,'2020-10-24 15:25:47','2022-07-11 19:02:47',0),(2035,2,1,1,'Alcohol antiséptico 70% galón','','Desinfección de la piel, utensilios, equipo y material de laboratorio',NULL,0,1,1,1,0,10.90,'delivery-0001.appspot.com/o/op%2Fpr%2F2035-1611676677050.jpg',1,20,1000,0,200,'Alcohol antiséptico 70% galón','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2036,2,1,1,'Carioca Burbuja 500 ml','','Espuma de Carnaval Capitán Burbuja Una carioca que ✅ No mancha ✅ No huele mal',NULL,0,1,1,1,0,1.75,'delivery-0001.appspot.com/o/op%2Fpr%2F2036-1611676755118.jpg',1,20,1000,0,200,'Carioca Burbuja 500 ml','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2037,2,1,1,'Heliocare 360 gel oil free bronze 50 ML','','Fotoprotector ultraligero con color y un acabado natural indicado para pieles mixtas, grasas',NULL,0,1,1,1,0,25.47,'delivery-0001.appspot.com/o/op%2Fpr%2F2037-1611845997557.jpg',1,20,1000,0,200,'Heliocare 360 gel oil free bronze 50 ML','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2038,2,1,1,'Heliocare 360 gel oil free beige 50 ML','','Fotoprotector ultraligero con color y un acabado natural indicado para pieles mixtas, grasas.',NULL,0,1,1,1,0,26.12,'delivery-0001.appspot.com/o/op%2Fpr%2F2038-1611846410749.jpg',1,20,1000,0,200,'Heliocare 360 gel oil free beige 50 ML','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2039,2,1,1,'Heliocare cápsulas','','complemento oral antioxidante y fotoprotector para pieles sensibles.',NULL,0,1,1,1,0,0.87,'delivery-0001.appspot.com/o/op%2Fpr%2F2039-1613685486887.jpg',1,20,1000,0,200,'Heliocare cápsulas','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2040,2,1,1,'Progress Gold Alula 3 1800 g','','Contiene hierro y un sistema de Biofactores con luteína y ácido araquidónico.',NULL,0,1,1,1,0,38.44,'delivery-0001.appspot.com/o/op%2Fpr%2F2040-1615480584176.jpg',1,20,1000,0,200,'Progress Gold Alula 3 1800 g','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2041,2,1,1,'Aquaprim crema hidratante 30 g','','Hidratante no graso y de rápida absorción especialmente diseñado para la piel del rostro, cuello, escote.',NULL,0,1,1,1,0,40.71,'delivery-0001.appspot.com/o/op%2Fpr%2F2041-1615482384744.jpg',1,20,1000,0,200,'Aquaprim crema hidratante 30 g','',100000,100000,'2020-10-24 15:25:47','2021-06-04 13:08:17',0),(2042,2,1,1,'Bahía solar bebés SPF 50+ 60 gr','','Bloqueador Solar especial para la piel del bebé con Protección UVA/UVB, es resistente al agua y sudor.',NULL,0,1,1,1,0,9.30,'delivery-0001.appspot.com/o/op%2Fpr%2F2042-1616537923958.jpg',1,20,1000,0,200,'Bahía solar bebés SPF 50+ 60 gr','',100000,100000,'2020-10-24 15:25:47','2022-07-11 19:02:47',0),(2043,2,1,1,'Bahía solar Super Kids SPF70  60 gr','','Bloqueador Solar especialmente diseñado para la piel sensible de los niños.',NULL,0,1,1,1,0,9.30,'delivery-0001.appspot.com/o/op%2Fpr%2F2043-1616537953031.jpg',1,20,1000,0,200,'Bahía solar Super Kids SPF70  60 gr','',100000,100000,'2020-10-24 15:25:47','2022-07-11 19:02:47',0),(2179,128,1,1,'Promoción 1','','Chaulafán especial + tallarin especial + camarón reventado+ 1/2 chaulafán especial + watan frito + bebida 1 L.',NULL,1,1,1,1,0,25.25,'delivery-0001.appspot.com/o/op%2Fpr%2F2179-1608567940055.jpg',1,20,1000,0,200,'Promoción 1','',100000,100000,'2020-12-21 16:23:29','2021-06-04 13:08:17',0),(2180,128,1,1,'Promoción 2','','2 chaulafán especial entero + wantan frito gratis',NULL,1,1,1,1,0,11.50,'delivery-0001.appspot.com/o/op%2Fpr%2F2180-1608567954590.jpg',1,20,1000,7,200,'Promoción 2','',100000,100000,'2020-12-21 16:23:29','2021-06-04 13:08:17',0),(2181,128,1,1,'Promoción 3','','1 tallarín especial + 1/2 chaulafán especial + wantan frito gratis',NULL,1,1,1,1,0,10.25,'delivery-0001.appspot.com/o/op%2Fpr%2F2181-1608567965505.jpg',1,20,1000,9,200,'Promoción 3','',100000,100000,'2020-12-21 16:23:29','2021-06-04 13:08:17',0),(2182,128,1,1,'Promoción 4','','1 pollo frito especial + 1 chaulafán especial entero + watán frito gratis',NULL,1,1,1,0,0,11.50,'delivery-0001.appspot.com/o/op%2Fpr%2F2182-1608567977069.jpg',1,20,1000,0,200,'Promoción 4','',100000,100000,'2020-12-21 16:23:29','2021-06-04 13:08:17',0),(3513,140,1,1,'TV box','','Incluye el teclado. ',NULL,0,0,1,1,0,40.00,'delivery-0001.appspot.com/o/li%2Fpr%2F3513-1609548307422.jpg',1,20,1000,0,200,'TV box','https://lili.planck.biz/hxSC',100000,100000,'2021-01-02 00:39:20','2022-07-11 19:02:47',0),(3515,140,1,1,'Moto Dukare 150','','Moto Dukare motor 150 año 2020',NULL,0,0,1,1,0,1200.00,'delivery-0001.appspot.com/o/li%2Fpr%2F3515-1610030687200.jpg',1,20,1000,0,200,'Moto Dukare 150','https://lili.planck.biz/AuLA',100000,100000,'2021-01-02 03:49:30','2022-07-11 19:02:47',0),(3519,140,1,1,'Scooter 350 w','','Nuevo',NULL,0,0,1,1,0,375.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1609649409028.jpg',1,20,1000,0,200,'Scooter 350 w','https://lili.planck.biz/pWkG',100000,100000,'2021-01-03 04:50:09','2022-07-11 19:02:47',0),(3522,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1609771800340.jpg',1,20,1000,0,200,'','',100000,100000,'2021-01-04 14:50:00','2021-06-04 13:08:17',0),(3549,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1610671035710.jpg',1,20,1000,0,200,'','',100000,100000,'2021-01-15 00:37:16','2021-06-04 13:08:17',0),(3551,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1610834880989.jpg',1,20,1000,0,200,'','',100000,100000,'2021-01-16 22:08:01','2021-06-04 13:08:17',0),(3570,2,1,1,'Heliocare 360 bronze cushion compact','','Fotoprotección con color y textura fluida, de aplicación diaria, efecto natural y unificador del tono.',NULL,0,1,1,1,0,53.65,'delivery-0001.appspot.com/o/op%2Fpr%2F3570-1612362004160.jpg',1,20,1000,0,200,'Heliocare 360 bronze cushion compact','',100000,100000,'2021-02-01 17:20:27','2022-07-11 19:02:47',0),(3571,2,1,1,'Heliocare 360 beige cushion compact','','Fotoprotección con color y textura fluida, de aplicación diaria, efecto natural y unificador del tono.',NULL,0,1,1,1,0,53.65,'delivery-0001.appspot.com/o/op%2Fpr%2F3571-1612362226492.jpg',1,20,1000,0,200,'Heliocare 360 beige cushion compact','',100000,100000,'2021-02-01 17:20:27','2022-07-11 19:02:47',0),(3572,2,1,1,'Heliocare 360 mineral fluido SPF 50+','','Con su textura fluida, fácil de aplicar y de rápida absorción, está indicado para todo tipo de piel.',NULL,0,1,1,1,0,20.74,'delivery-0001.appspot.com/o/op%2Fpr%2F3572-1612362374255.jpg',1,20,1000,0,200,'Heliocare 360 mineral fluido SPF 50+','',100000,100000,'2021-02-01 17:20:27','2021-06-04 13:08:17',0),(3573,2,1,1,'Heliocare 360 gel oil free 50 ml','','Permite su uso en pieles grasas y acnéicas por su acción seborreguladora y matificante que absorbe brillos.',NULL,0,1,1,1,0,22.24,'delivery-0001.appspot.com/o/op%2Fpr%2F3573-1612362578094.jpg',1,20,1000,0,200,'Heliocare 360 gel oil free 50 ml','',100000,100000,'2021-02-01 17:20:27','2021-06-04 13:08:17',0),(3574,2,1,1,'Heliocare compact brown','','Tiene una alta protección solar y es muy cubriente, ideal para pieles con imperfecciones.',NULL,0,1,1,1,0,45.97,'delivery-0001.appspot.com/o/op%2Fpr%2F3574-1613681598091.jpg',1,20,1000,0,200,'Heliocare compact brown','',100000,100000,'2021-02-01 17:20:27','2022-07-11 19:02:47',0),(3575,2,1,1,'Heliocare compacto light','','Ideal para pieles con imperfecciones, cicatrices o pieles sometidas a tratamientos fotosensibilizantes.',NULL,0,1,1,1,0,33.60,'delivery-0001.appspot.com/o/op%2Fpr%2F3575-1612448481789.jpg',1,20,1000,0,200,'Heliocare compacto light','',100000,100000,'2021-02-01 17:20:27','2022-07-11 19:02:47',0),(3576,2,1,1,'Heliocare gelcrema laight 50 x 50ml','','Atenúa las imperfecciones del rostro aportando un tono uniforme.',NULL,0,1,1,1,0,33.56,'delivery-0001.appspot.com/o/op%2Fpr%2F3576-1612448721174.jpg',1,20,1000,0,200,'Heliocare gelcrema laight 50 x 50ml','',100000,100000,'2021-02-01 17:20:27','2021-06-04 13:08:17',0),(3577,2,1,1,'Heliocare gelcrema brown 50 x 50ml','','Una fórmula antioxidante y reparadora que combina lo mejor de la fotoprotección de Heliocare',NULL,0,1,1,1,0,19.27,'delivery-0001.appspot.com/o/op%2Fpr%2F3577-1612449087692.jpg',1,20,1000,0,200,'Heliocare gelcrema brown 50 x 50ml','',100000,100000,'2021-02-01 17:20:27','2022-07-11 19:02:47',0),(3578,2,1,1,'Heliocare 50 spray 200 ml','','Su textura ligera de rápida absorción, resistente al agua y fácil de extender.',NULL,0,1,1,1,0,27.62,'delivery-0001.appspot.com/o/op%2Fpr%2F3578-1612449355482.jpg',1,20,1000,0,200,'Heliocare 50 spray 200 ml','',100000,100000,'2021-02-01 17:20:27','2021-06-04 13:08:17',0),(3579,2,1,1,'Heliocare ultra gel 90 x 50 ml','','Protector solar en textura gel cremoso ligera libre de grasas indicado para todo tipo de pieles.',NULL,0,1,1,1,0,25.41,'delivery-0001.appspot.com/o/op%2Fpr%2F3579-1612449584371.jpg',1,20,1000,0,200,'Heliocare ultra gel 90 x 50 ml','',100000,100000,'2021-02-01 17:20:27','2021-06-04 13:08:17',0),(3580,2,1,1,'Heliocare ultra crema 90 x 50 ml','','Asegura una alta protección de la piel del rostro y previene la aparición de manchas y arrugas.',NULL,0,1,1,1,0,24.19,'delivery-0001.appspot.com/o/op%2Fpr%2F3580-1612450276107.jpg',1,20,1000,0,200,'Heliocare ultra crema 90 x 50 ml','',100000,100000,'2021-02-01 17:20:27','2021-06-04 13:08:17',0),(3581,2,1,1,'Bahía solar faces SPF90+ 60 gr','','Diseñado para la piel sensible del rostro, enriquecido con un complejo antioxidante.',NULL,0,1,1,1,0,16.00,'delivery-0001.appspot.com/o/op%2Fpr%2F3581-1615482975447.jpg',1,20,1000,0,200,'Bahía solar faces SPF90+ 60 gr','',100000,100000,'2021-02-01 17:20:27','2022-07-11 19:02:47',0),(3582,2,1,1,'Propóleo cereza','','Poderoso antibacteriano, antiflamatorio, antioxidante y antialergico',NULL,0,1,1,1,0,9.80,'delivery-0001.appspot.com/o/op%2Fpr%2F3582-1612546963931.jpg',1,20,1000,0,200,'Propóleo cereza','',100000,100000,'2021-02-01 17:20:27','2022-07-11 19:02:47',0),(3583,2,1,1,'Katrina loción capilar','','Se usa para tratar las infestaciones de piojos en la cabeza, el cuerpo y el área del pubis',NULL,0,1,1,1,0,4.26,'delivery-0001.appspot.com/o/op%2Fpr%2F3583-1612547161096.jpg',1,20,1000,0,200,'Katrina loción capilar','',100000,100000,'2021-02-01 17:20:27','2021-06-04 13:08:17',0),(3584,2,1,1,'Heliocare advanced gel 50 ml','','Su textura ligera no comedogénica de rápida absorción es perfecta para todo tipo de piel',NULL,0,1,1,1,0,16.43,'delivery-0001.appspot.com/o/op%2Fpr%2F3584-1612361182175.jpg',1,20,1000,2,200,'Heliocare advanced gel 50 ml','',100000,100000,'2021-02-01 17:20:27','2021-06-04 13:08:17',1),(3585,2,1,1,'Heliocare cápsulas 360','','Fotoinmunoprotección oral con mayor concentración de Fernblock y Vitamina D, Vitamina B3 y Vitamina E',NULL,0,1,1,1,0,0.92,'delivery-0001.appspot.com/o/op%2Fpr%2F3585-1612360895352.jpg',1,20,1000,0,200,'Heliocare cápsulas 360','',100000,100000,'2021-02-01 17:20:27','2021-06-04 13:08:17',0),(3586,2,1,1,'Heliocare advanced cream 50 ml','','Su textura en crema no comedogénica es perfecta para pieles normales o secas',NULL,0,1,1,1,0,16.43,'delivery-0001.appspot.com/o/op%2Fpr%2F3586-1612361761937.jpg',1,20,1000,0,200,'Heliocare advanced cream 50 ml','',100000,100000,'2021-02-01 17:20:27','2021-06-04 13:08:17',0),(3587,2,1,1,'Heliocare 360 water gel 50 ml','','No deja residuo, mejora la apariencia de la piel y es compatible con todos los cosméticos',NULL,0,1,1,1,0,20.70,'delivery-0001.appspot.com/o/op%2Fpr%2F3587-1612360300360.jpg',1,20,1000,0,200,'Heliocare 360 water gel 50 ml','',100000,100000,'2021-02-01 17:20:27','2021-06-04 13:08:17',0),(3588,2,1,1,'Vitatoro cápsulas','','Nutricional, energético con vitaminas y minerales, energía para mente y cuerpo.',NULL,0,1,1,1,0,18.60,'delivery-0001.appspot.com/o/op%2Fpr%2F3588-1613165641959.jpg',1,20,1000,0,200,'Vitatoro cápsulas','',100000,100000,'2021-02-01 17:20:27','2022-07-11 19:02:47',0),(3589,2,1,1,'Heliocare 360 Pediatrics Lotion 200 ml','','Filtros específicos y activos reparadores y antioxidantes, protege frente a las 4 radiaciones',NULL,0,1,1,1,0,25.92,'delivery-0001.appspot.com/o/op%2Fpr%2F3589-1612359961212.jpg',1,20,1000,0,200,'Heliocare 360 Pediatrics Lotion 200 ml','',100000,100000,'2021-02-01 17:20:27','2021-06-04 13:08:17',0),(3591,2,1,1,'Propóleo Cereza','','Poderoso antibacteriano, antiflamatorio, antioxidante y antialergico',NULL,0,1,1,1,0,9.80,'delivery-0001.appspot.com/o/op%2Fpr%2F3591-1613144988238.jpg',1,20,1000,0,200,'Propóleo Cereza','',100000,100000,'2021-02-12 15:26:41','2022-07-11 19:02:47',0),(3592,2,1,1,'Vitamina E x 40 tabletas','','Actúa como antioxidante, al ayudar a proteger las células contra los daños causados por los radicales libres.',NULL,0,1,1,1,0,12.48,'delivery-0001.appspot.com/o/op%2Fpr%2F3592-1614114262449.jpg',1,20,1000,0,200,'Vitamina E x 40 tabletas','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3593,2,1,1,'Lagricel Gotas','','Se utiliza como lubricante ocular, para el alivio temporal del ardor.',NULL,0,1,1,1,0,19.22,'delivery-0001.appspot.com/o/op%2Fpr%2F3593-1613145856110.jpg',1,20,1000,0,200,'Lagricel Gotas','',100000,100000,'2021-02-12 15:26:41','2022-07-11 19:02:47',0),(3594,2,1,1,'Lumed Base Compacta tono oscuro','','Maquilla y proporciona de forma inmediata a la piel una apariencia uniforme',NULL,0,1,1,1,0,50.00,'delivery-0001.appspot.com/o/op%2Fpr%2F3594-1613147234119.jpg',1,20,1000,0,200,'Lumed Base Compacta tono oscuro','',100000,100000,'2021-02-12 15:26:41','2022-07-11 19:02:47',0),(3595,2,1,1,'Resverax crema facial 30 gr','','Retrasa las manifestaciones del envejecimiento cutáneo',NULL,0,1,1,1,0,40.71,'delivery-0001.appspot.com/o/op%2Fpr%2F3595-1613147505964.jpg',1,20,1000,0,200,'Resverax crema facial 30 gr','',100000,100000,'2021-02-12 15:26:41','2022-07-11 19:02:47',0),(3596,2,1,1,'Nutrifort Vainilla polvo 500 gr','','Aporta con 20 vitaminas y minerales, favorece el normal desarrollo del cerebro y sistema nervioso.',NULL,0,1,1,1,0,18.48,'delivery-0001.appspot.com/o/op%2Fpr%2F3596-1613148496814.jpg',1,20,1000,0,200,'Nutrifort Vainilla polvo 500 gr','',100000,100000,'2021-02-12 15:26:41','2022-07-11 19:02:47',0),(3597,2,1,1,'Nutrifort Fresa polvo 500 gr','','Aporta con 20 vitaminas y minerales, favorece el normal desarrollo del cerebro y sistema nervioso.',NULL,0,1,1,1,0,18.48,'delivery-0001.appspot.com/o/op%2Fpr%2F3597-1613148619239.jpg',1,20,1000,0,200,'Nutrifort Fresa polvo 500 gr','',100000,100000,'2021-02-12 15:26:41','2022-07-11 19:02:47',0),(3598,2,1,1,'Gelibett Reforzado sobres','','Reforzado con magnesio , calcio y vitamina C',NULL,0,1,1,1,0,26.67,'delivery-0001.appspot.com/o/op%2Fpr%2F3598-1613149614868.jpg',1,20,1000,0,200,'Gelibett Reforzado sobres','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3599,2,1,1,'Heliocare Gel crema Brown 50 x 50ml','','Atenúa las imperfecciones del rostro aportando un tono uniforme.',NULL,0,1,1,1,0,38.54,'delivery-0001.appspot.com/o/op%2Fpr%2F3599-1613681010491.jpg',1,20,1000,0,200,'Heliocare Gel crema Brown 50 x 50ml','',100000,100000,'2021-02-12 15:26:41','2022-07-11 19:02:47',0),(3600,2,1,1,'Vita Sweet Stevia vainilla x 100 sobres','','Es ideal para endulzar bebidas calientes y frías.',NULL,0,1,1,1,0,4.92,'delivery-0001.appspot.com/o/op%2Fpr%2F3600-1614011271933.jpg',1,20,1000,0,200,'Vita Sweet Stevia vainilla x 100 sobres','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3601,2,1,1,'Vita Sweet Stevia miel x 100 sobres','','Es ideal para endulzar bebidas calientes y frías, tales como: café, té, bebidas aromáticas, jugos, etc.',NULL,0,1,1,1,0,4.92,'delivery-0001.appspot.com/o/op%2Fpr%2F3601-1614011423114.jpg',1,20,1000,0,200,'Vita Sweet Stevia miel x 100 sobres','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3602,2,1,1,'Vita Sweet Stevia gotas 20ml','','Es ideal para endulzar bebidas calientes y frías, tales como: café, té, bebidas aromáticas, jugos, etc.',NULL,0,1,1,1,0,4.43,'delivery-0001.appspot.com/o/op%2Fpr%2F3602-1614011544337.jpg',1,20,1000,0,200,'Vita Sweet Stevia gotas 20ml','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3603,2,1,1,'Vita Sweet Sucralosa gotas 20 ml','','Es ideal para endulzar bebidas calientes y frías, tales como: café, té, bebidas aromáticas, jugos, etc.',NULL,0,1,1,1,0,3.62,'delivery-0001.appspot.com/o/op%2Fpr%2F3603-1614011755315.jpg',1,20,1000,0,200,'Vita Sweet Sucralosa gotas 20 ml','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3604,2,1,1,'Vita Sweet sucralosa sobres x 50','','Es ideal para endulzar bebidas calientes y frías, tales como: café, té, bebidas aromáticas, jugos, etc.',NULL,0,1,1,1,0,2.61,'delivery-0001.appspot.com/o/op%2Fpr%2F3604-1614011858258.jpg',1,20,1000,0,200,'Vita Sweet sucralosa sobres x 50','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3605,2,1,1,'Vita Sweet Stevia mocachino x 100 sobres','','Está indicado para control de peso, sobrepeso, obesidad y diabetes.',NULL,0,1,1,1,0,4.92,'delivery-0001.appspot.com/o/op%2Fpr%2F3605-1614011923268.jpg',1,20,1000,0,200,'Vita Sweet Stevia mocachino x 100 sobres','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3606,2,1,1,'Venoflash tabletas','','Suplemento formulado para ayudar a promover la circulación de sus piernas, dolor, hinchazón y cansancio.',NULL,0,1,1,1,0,10.45,'delivery-0001.appspot.com/o/op%2Fpr%2F3606-1614114410251.jpg',1,20,1000,0,200,'Venoflash tabletas','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3607,2,1,1,'Venoflash crema 230 ml','','Suplemento formulado para ayudar a promover la circulación de sus piernas, dolor, hinchazón y cansancio.',NULL,0,1,1,1,0,9.45,'delivery-0001.appspot.com/o/op%2Fpr%2F3607-1614114713330.jpg',1,20,1000,0,200,'Venoflash crema 230 ml','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3608,2,1,1,'Triple C Forte Vitamina C + Zinc 1000 ml','','Ayuda al mantenimiento normal del sistema inmunológico. - Potente Antioxidante.',NULL,0,1,1,1,0,11.78,'delivery-0001.appspot.com/o/op%2Fpr%2F3608-1614606834556.jpg',1,20,1000,0,200,'Triple C Forte Vitamina C + Zinc 1000 ml','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3609,2,1,1,'Vitafos adulto 800 gr','','El complemento alimenticio que te ayuda a cubrir tus necesidades de energía y nutrientes.',NULL,0,1,1,1,0,28.57,'delivery-0001.appspot.com/o/op%2Fpr%2F3609-1614613373914.jpg',1,20,1000,0,200,'Vitafos adulto 800 gr','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3610,2,1,1,'Vitafos adulto fresa 400 gr','','El complemento alimenticio que te ayuda a cubrir tus necesidades de energía y nutrientes.',NULL,0,1,1,1,0,14.71,'delivery-0001.appspot.com/o/op%2Fpr%2F3610-1614613548909.jpg',1,20,1000,0,200,'Vitafos adulto fresa 400 gr','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3611,2,1,1,'Vitafos adulto vainilla 400 gr','','El complemento alimenticio que te ayuda a cubrir tus necesidades de energía y nutrientes.',NULL,0,1,1,1,0,14.47,'delivery-0001.appspot.com/o/op%2Fpr%2F3611-1614614381360.jpg',1,20,1000,0,200,'Vitafos adulto vainilla 400 gr','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3612,2,1,1,'Vitafos Junior 800 gr','','El complemento alimenticio que te ayuda a cubrir tus necesidades de energía y nutrientes.',NULL,0,1,1,1,0,31.19,'delivery-0001.appspot.com/o/op%2Fpr%2F3612-1614615351101.jpg',1,20,1000,0,200,'Vitafos Junior 800 gr','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3613,2,1,1,'Vitafos Junior fresa 400 gr','','El complemento alimenticio que te ayuda a cubrir tus necesidades de energía y nutrientes.',NULL,0,1,1,1,0,15.63,'delivery-0001.appspot.com/o/op%2Fpr%2F3613-1614615570064.jpg',1,20,1000,0,200,'Vitafos Junior fresa 400 gr','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3614,2,1,1,'Vitafos Junior vainilla 400 gr','','El complemento alimenticio que te ayuda a cubrir tus necesidades de energía y nutrientes.',NULL,0,1,1,1,0,15.61,'delivery-0001.appspot.com/o/op%2Fpr%2F3614-1614618906696.jpg',1,20,1000,0,200,'Vitafos Junior vainilla 400 gr','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3615,2,1,1,'Blemil 3 1200 gr','','Indicada para la alimentación de bebés con problemas o limitaciones en la absorción, digestión de nutrientes.',NULL,0,1,1,1,0,27.72,'delivery-0001.appspot.com/o/op%2Fpr%2F3615-1614619101260.jpg',1,20,1000,0,200,'Blemil 3 1200 gr','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3616,2,1,1,'Blemil 3 800 gr','','Indicada para la alimentación de bebés con problemas o limitaciones en la absorción, digestión de nutrientes.',NULL,0,1,1,1,0,12.09,'delivery-0001.appspot.com/o/op%2Fpr%2F3616-1614619485594.jpg',1,20,1000,0,200,'Blemil 3 800 gr','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3617,2,1,1,'Blemil Confort 400 mg','','Fórmula para lactantes especialmente indicada para el tratamiento dietético del cólico.',NULL,0,1,1,1,0,16.97,'delivery-0001.appspot.com/o/op%2Fpr%2F3617-1614619805654.jpg',1,20,1000,0,200,'Blemil Confort 400 mg','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3618,2,1,1,'Blemil plus SL 400 gr','','Indicada para la intolerancia primaria y secundaria a la lactosa.',NULL,0,1,1,1,0,15.66,'delivery-0001.appspot.com/o/op%2Fpr%2F3618-1614619927554.jpg',1,20,1000,0,200,'Blemil plus SL 400 gr','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3619,2,1,1,'Blemil Prematuros 400 gr','','Enriquecida en vitaminas y minerales, para cubrir los requerimientos diarios del recién nacido.',NULL,0,1,1,1,0,16.19,'delivery-0001.appspot.com/o/op%2Fpr%2F3619-1614620115804.jpg',1,20,1000,0,200,'Blemil Prematuros 400 gr','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3620,2,1,1,'Blemil 2 arroz 400 gr','','Fórmula de continuación que proporciona un óptimo aporte de nutrientes.',NULL,0,1,1,1,0,18.51,'delivery-0001.appspot.com/o/op%2Fpr%2F3620-1614630992974.jpg',1,20,1000,0,200,'Blemil 2 arroz 400 gr','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3621,2,1,1,'Sauber Kids','','Cepillos de Dientes con Cabezas Intercambiables.',NULL,0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/op%2Fpr%2F3621-1614953602708.jpg',1,20,1000,0,200,'Sauber Kids','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3622,2,1,1,'Sauber adulto','','Cepillos de Dientes con Cabezas Intercambiables.',NULL,0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/op%2Fpr%2F3622-1614953885395.jpg',1,20,1000,0,200,'Sauber adulto','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3623,2,1,1,'Cloruro de Magnesio','','Proporciona ese equilibrio mineral que tu cuerpo necesita para mantener una salud óptima.',NULL,0,1,1,1,0,10.41,'delivery-0001.appspot.com/o/op%2Fpr%2F3623-1614954166452.jpg',1,20,1000,0,200,'Cloruro de Magnesio','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3624,2,1,1,'Detoxan 400 mg x 60 cápsulas','','Brinda una protección antioxidante y antiinflamatoria a ojos, cerebro, sistema nervioso central.',NULL,0,1,1,1,0,16.66,'delivery-0001.appspot.com/o/op%2Fpr%2F3624-1614954541816.jpg',1,20,1000,0,200,'Detoxan 400 mg x 60 cápsulas','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3625,2,1,1,'Fortal C 900 mg x 60 cápsulas','','Es un suplemento alimenticio que contiene Vitamina C,  Calcio, Magnesio y Zinc.',NULL,0,1,1,1,0,18.34,'delivery-0001.appspot.com/o/op%2Fpr%2F3625-1614954978638.jpg',1,20,1000,0,200,'Fortal C 900 mg x 60 cápsulas','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3626,2,1,1,'Fucoslim 550 mg x 60 cápsulas','','Potente quemador de grasa, combate la obesidad, celulitis, oxidación del cuerpo, vascularización.',NULL,0,1,1,1,0,15.83,'delivery-0001.appspot.com/o/op%2Fpr%2F3626-1614955489983.jpg',1,20,1000,0,200,'Fucoslim 550 mg x 60 cápsulas','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3627,2,1,1,'Glucovento 300 mg x 60 cápsulas','','Suplemento alimenticio a base de Ácido Alfa Lipoico.',NULL,0,1,1,1,0,16.24,'delivery-0001.appspot.com/o/op%2Fpr%2F3627-1614955722867.jpg',1,20,1000,0,200,'Glucovento 300 mg x 60 cápsulas','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3628,2,1,1,'Inmunoter 900 mg x 60 cápsulas','','Suplemento alimenticio formulado con extractos de Echinacea angustifolia, Vitamina C, Vitamina A, Calcio.',NULL,0,1,1,1,0,19.34,'delivery-0001.appspot.com/o/op%2Fpr%2F3628-1614956246496.jpg',1,20,1000,0,200,'Inmunoter 900 mg x 60 cápsulas','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3629,2,1,1,'Perfect Skin Magnesio','','Brinda una mayor limpieza, nutrición, humectación y  desinfección de la piel.',NULL,0,1,1,1,0,12.93,'delivery-0001.appspot.com/o/op%2Fpr%2F3629-1614957180575.jpg',1,20,1000,0,200,'Perfect Skin Magnesio','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3630,2,1,1,'Vitamina C 1200mg bebible','','Combinación de Vitamina C, Calcio, Zinc y VitaminaD.',NULL,0,1,1,1,0,12.75,'delivery-0001.appspot.com/o/op%2Fpr%2F3630-1614957367222.jpg',1,20,1000,0,200,'Vitamina C 1200mg bebible','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3631,2,1,1,'Apetitol 240 ml jarabe grande','','Excelente para la buena formación de huesos y dientes. Interviene en la formación de proteínas.',NULL,0,1,1,1,0,7.50,'delivery-0001.appspot.com/o/op%2Fpr%2F3631-1615473237044.jpg',1,20,1000,0,200,'Apetitol 240 ml jarabe grande','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3632,2,1,1,'Apetitol Plus Jarabe 120 ml','','excelente para la buena formación de huesos y dientes. Interviene en la formación de proteínas.',NULL,0,1,1,1,0,6.50,'delivery-0001.appspot.com/o/op%2Fpr%2F3632-1615473568943.jpg',1,20,1000,0,200,'Apetitol Plus Jarabe 120 ml','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3633,2,1,1,'Cebión gotas fresa','','Estimulante de las defensas orgánicas en época de mayor peligro de infecciones.',NULL,0,1,1,1,0,3.17,'delivery-0001.appspot.com/o/op%2Fpr%2F3633-1615473712632.jpg',1,20,1000,0,200,'Cebión gotas fresa','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3634,2,1,1,'Leche S-26 Mamá','','Ayuda a satisfacer las necesidades de energía, proteínas, hierro y otros nutrientes que son requeridos.',NULL,0,1,1,1,0,14.47,'delivery-0001.appspot.com/o/op%2Fpr%2F3634-1615474079420.jpg',1,20,1000,0,200,'Leche S-26 Mamá','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3635,2,1,1,'Cetaphil Pro AD control hidratante','','Clínicamente probado para restaurar la barrera cutánea de la piel sensible, con tendencia atópica.',NULL,0,1,1,1,0,42.83,'delivery-0001.appspot.com/o/op%2Fpr%2F3635-1615477007309.jpg',1,20,1000,0,200,'Cetaphil Pro AD control hidratante','',100000,100000,'2021-02-12 15:26:41','2022-07-11 19:02:47',0),(3636,2,1,1,'Velvet Sunscreen gel transparente 50ml','','Bloqueador solar facial con una fórmula anhidra (libre de agua).',NULL,0,1,1,1,0,32.42,'delivery-0001.appspot.com/o/op%2Fpr%2F3636-1615477312142.jpg',1,20,1000,0,200,'Velvet Sunscreen gel transparente 50ml','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3637,2,1,1,'Velvet face color gel protector','','Bloqueador solar facial con una fórmula anhidra (libre de agua).',NULL,0,1,1,1,0,33.40,'delivery-0001.appspot.com/o/op%2Fpr%2F3637-1615477693445.jpg',1,20,1000,0,200,'Velvet face color gel protector','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3638,2,1,1,'Velvet Sunscreen spray 200 ml','','Especialmente para la piel corporal de adultos y niños (mayores de 3 años).',NULL,0,1,1,1,0,23.90,'delivery-0001.appspot.com/o/op%2Fpr%2F3638-1615477841669.jpg',1,20,1000,0,200,'Velvet Sunscreen spray 200 ml','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3639,2,1,1,'Progress Gold Alula 3 400 g','','Ideada para niños de 1 a 3 años, ya que contiene hierro y un sistema de Biofactores.',NULL,0,1,1,1,0,9.90,'delivery-0001.appspot.com/o/op%2Fpr%2F3639-1615479637597.jpg',1,20,1000,0,200,'Progress Gold Alula 3 400 g','',100000,100000,'2021-02-12 15:26:41','2021-06-04 13:08:17',0),(3640,2,1,1,'Progress Gold Alula 3 800 g','','Ideada para niños de 1 a 3 años, ya que contiene hierro y un sistema de Biofactores.',NULL,0,1,1,1,0,15.37,'delivery-0001.appspot.com/o/op%2Fpr%2F3640-1615479840090.jpg',1,20,1000,0,200,'Progress Gold Alula 3 800 g','',100000,100000,'2021-02-12 15:26:41','2022-07-11 19:02:47',0),(3701,9,1,1,'Jugos','','Jugo de tomate de arbol o piña','{\"lP\": [{\"d\": \"Jugo de piña\", \"p\": \"1.0\", \"id\": \"0\"}, {\"d\": \"Jugo de tomate de arbol\", \"p\": \"1.0\", \"id\": \"1\"}]}',0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1615059015418.jpg',1,20,1000,0,200,'Jugos','',100000,100000,'2021-03-06 19:30:15','2021-06-04 13:08:17',0),(3708,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1615497496144.jpg',1,20,1000,0,200,'','',100000,100000,'2021-03-11 21:18:16','2021-06-04 13:08:17',0),(3710,140,1,1,'planta en maceta \"palo de Brasil\"','','Aproximadamente 2.10 metros de altura ',NULL,0,0,1,1,0,300.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1615599345417.jpg',1,20,1000,0,200,'planta en maceta \"palo de Brasil\"','',100000,100000,'2021-03-13 01:35:46','2022-07-11 19:02:47',0),(3724,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1615786345674.jpg',1,20,1000,0,200,'','',100000,100000,'2021-03-15 05:32:26','2021-06-04 13:08:17',0),(3727,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1616072979800.jpg',1,20,1000,0,200,'','',100000,100000,'2021-03-18 13:09:40','2021-06-04 13:08:17',0),(3782,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1616360121388.jpg',1,20,1000,0,200,'','',100000,100000,'2021-03-21 20:55:21','2021-06-04 13:08:17',0),(3807,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1617157497435.jpg',1,20,1000,0,200,'','',100000,100000,'2021-03-31 02:24:57','2021-06-04 13:08:17',0),(3808,140,1,1,'Tratamiento contra la caída del cabello','','Marca Irganic Olivia',NULL,0,0,1,1,0,400.00,'delivery-0001.appspot.com/o/li%2Fpr%2F3808-1617214554782.jpg',1,20,1000,0,200,'Tratamiento contra la caída del cabello','',100000,100000,'2021-03-31 18:12:08','2022-07-11 19:02:47',0),(3809,140,1,1,'Kit x55 boquillas','','Marca Arteco',NULL,0,0,1,1,0,200.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1617214930214.jpg',1,20,1000,0,200,'Kit x55 boquillas','',100000,100000,'2021-03-31 18:22:10','2022-07-11 19:02:47',0),(3810,140,1,1,'Botas gamuza','','Marca Derek, talla 39, 1 sola postura',NULL,0,0,1,1,0,180.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1617215023991.jpg',1,20,1000,0,200,'Botas gamuza','',100000,100000,'2021-03-31 18:23:44','2022-07-11 19:02:47',0),(3811,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1617298607952.jpg',1,20,1000,0,200,'','',100000,100000,'2021-04-01 17:36:48','2021-06-04 13:08:17',0),(3812,104,1,1,'Pincho de Pollo Ahumado','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617381936321.jpg',1,20,1000,0,200,'Pincho de Pollo Ahumado','',100000,100000,'2021-04-02 16:45:36','2021-06-04 13:08:17',0),(3813,104,1,1,'Pincho de Camarón ','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617382058300.jpg',1,20,1000,0,200,'Pincho de Camarón ','',100000,100000,'2021-04-02 16:47:38','2021-06-04 13:08:17',0),(3814,104,1,1,'Chuleta Asada','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617382161049.jpg',1,20,1000,0,200,'Chuleta Asada','',100000,100000,'2021-04-02 16:49:21','2021-06-04 13:08:17',0),(3815,104,1,1,'Chuleta Ahumada','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617382301246.jpg',1,20,1000,0,200,'Chuleta Ahumada','',100000,100000,'2021-04-02 16:51:41','2021-06-04 13:08:17',0),(3816,104,1,1,'Chuleta con Chorizo','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,3.00,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617382396947.jpg',1,20,1000,2,200,'Chuleta con Chorizo','',100000,100000,'2021-04-02 16:53:17','2021-06-04 13:08:17',0),(3817,104,1,1,'Costilla Ahumada','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617384800592.jpg',1,20,1000,0,200,'Costilla Ahumada','',100000,100000,'2021-04-02 17:33:21','2021-06-04 13:08:17',0),(3818,104,1,1,'Costilla Grande','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,6.00,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617384985532.jpg',1,20,1000,0,200,'Costilla Grande','',100000,100000,'2021-04-02 17:36:26','2021-06-04 13:08:17',0),(3819,104,1,1,'Costilla Pequeña. ','','Guarniciones: Papa frita, cocinada, choclo, arroz, menestra, papa, choclo llapingachos, platano, usted elige. ',NULL,0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617385066470.jpg',1,20,1000,0,200,'Costilla Pequeña. ','',100000,100000,'2021-04-02 17:37:46','2021-06-04 13:08:17',0),(3820,104,1,1,'Miniparrilada ','','F. Pollo Res, chancho, chorizo, arroz, papa y choclo ',NULL,0,1,1,1,0,4.00,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617386286460.jpg',1,20,1000,7,200,'Miniparrilada ','',100000,100000,'2021-04-02 17:58:07','2021-06-04 13:08:17',0),(3821,104,1,1,'Parrillada junior ','','F. Pollo, res, chacho, chorizo, costilla. Platano, choclo, y papa. ',NULL,0,1,1,1,0,5.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617386439590.jpg',1,20,1000,6,200,'Parrillada junior ','',100000,100000,'2021-04-02 18:00:40','2021-06-04 13:08:17',0),(3822,104,1,1,'Parrillada mediana ','','F. Pollo, res, chacho, costilla, chuleta, chorizo, ternera, paisa. ',NULL,0,1,1,1,0,10.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617386964551.jpg',1,20,1000,3,200,'Parrillada mediana ','',100000,100000,'2021-04-02 18:09:25','2021-06-04 13:08:17',0),(3823,104,1,1,'Parrillada Ahumada','','Todo Ahumado, Presa de pollo, chorizo, chuleta, costilla. Plátanos, arroz, papa, choclo. ',NULL,0,1,1,1,0,12.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617387180025.jpg',1,20,1000,1,200,'Parrillada Ahumada','',100000,100000,'2021-04-02 18:13:00','2021-06-04 13:08:17',0),(3824,104,1,1,'Parrillada Familiar','','F. Pollo, res, chacho, chuleta, costilla, higadilla, chorizos paisa, ternera, parrillero. Arroz, platano, papa',NULL,0,1,1,1,0,20.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617387476847.jpg',1,20,1000,0,200,'Parrillada Familiar','',100000,100000,'2021-04-02 18:17:57','2021-06-04 13:08:17',0),(3825,104,1,1,'Patitas Asadas','','Palpita cocinada y choclo. ',NULL,0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617387791951.jpg',1,20,1000,1,200,'Patitas Asadas','',100000,100000,'2021-04-02 18:23:12','2021-06-04 13:08:17',0),(3826,104,1,1,'Salchipapa','','Papa y salchicha',NULL,0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617388010629.jpg',1,20,1000,10,200,'Salchipapa','',100000,100000,'2021-04-02 18:26:51','2021-06-04 13:08:17',0),(3827,104,1,1,'Salchipapa Grande','','Papa con doble salchicha ',NULL,0,1,1,1,0,1.50,'delivery-0001.appspot.com/o/op%2Fpr%2F3827-1617388445011.jpg',1,20,1000,3,200,'Salchipapa Grande','',100000,100000,'2021-04-02 18:27:36','2021-06-04 13:08:17',0),(3828,104,1,1,'Choclo Asado ','','Cloclo asado con salsa de queso. ',NULL,0,1,1,1,0,1.00,'delivery-0001.appspot.com/o/op%2Fpr%2F3828-1617388529107.jpg',1,20,1000,2,200,'Choclo Asado ','',100000,100000,'2021-04-02 18:28:09','2021-06-04 13:08:17',0),(3829,104,1,1,'Llapingachos. ','','Llapingachos con salsa verde y ensalada ',NULL,0,1,1,1,0,0.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617388593698.jpg',1,20,1000,4,200,'Llapingachos. ','',100000,100000,'2021-04-02 18:36:34','2021-06-04 13:08:17',0),(3830,104,1,1,'Bebidas ','','',NULL,0,1,1,1,0,0.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1617389039530.jpg',1,20,1000,0,200,'Bebidas ','',100000,100000,'2021-04-02 18:44:00','2021-06-04 13:08:17',0),(3831,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1617402364942.jpg',1,20,1000,0,200,'','',100000,100000,'2021-04-02 22:26:05','2021-06-04 13:08:17',0),(3832,140,1,1,'Cámara samsung hmx-qf30','','Videocámara Digital, Wifi, Full Hd, Todos sus accesorios, 20x Optical Zoom, Muy Buen Estado ',NULL,0,0,1,1,0,1500.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1617449209954.jpg',1,20,1000,0,200,'Cámara samsung hmx-qf30','',100000,100000,'2021-04-03 11:26:50','2022-07-11 19:02:47',0),(3833,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1617462004038.jpg',1,20,1000,0,200,'','',100000,100000,'2021-04-03 15:00:04','2021-06-04 13:08:17',0),(3846,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1617681486778.jpg',1,20,1000,0,200,'','',100000,100000,'2021-04-06 03:58:07','2021-06-04 13:08:17',0),(3909,2,1,1,'Nutrilon Pepti Junior 400 gr','','Fórmula nutricionalmente completa adecuada para lactantes y niños con alergia a la proteína de leche de vaca.',NULL,0,1,1,1,0,30.06,'delivery-0001.appspot.com/o/op%2Fpr%2F3909-1617920796018.jpg',1,20,1000,0,200,'Nutrilon Pepti Junior 400 gr','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3910,2,1,1,'Bebelac Gold 3 900 gr','','Diseñado para complementar el componente de alimentos sólidos de la dieta al proporcionar más nutrientes.',NULL,0,1,1,1,0,20.76,'delivery-0001.appspot.com/o/op%2Fpr%2F3910-1617920837622.jpg',1,20,1000,0,200,'Bebelac Gold 3 900 gr','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3911,2,1,1,'Nido crecimiento etapa 1 2 kg','','Contribuye al normal desarrollo del cerebro y del sistema nervioso, además contiene Vitaminas A, C, D, Hierro.',NULL,0,1,1,1,0,34.00,'delivery-0001.appspot.com/o/op%2Fpr%2F3911-1617922415067.jpg',1,20,1000,0,200,'Nido crecimiento etapa 1 2 kg','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3912,2,1,1,'Bahia solar 365 defensa diaria SPF 60','','Producto que protege tu piel, brindándote una protección absoluta ante los rayos del sol.',NULL,0,1,1,1,0,10.00,'delivery-0001.appspot.com/o/op%2Fpr%2F3912-1618348186181.jpg',1,20,1000,0,200,'Bahia solar 365 defensa diaria SPF 60','',100000,100000,'2021-04-07 21:30:20','2022-07-11 19:02:47',0),(3913,2,1,1,'C Vit Trio Reforzado','','Sus componentes tienen altos niveles inmunologicos y antioxidantes.',NULL,0,1,1,1,0,11.66,'delivery-0001.appspot.com/o/op%2Fpr%2F3913-1618432438115.jpg',1,20,1000,0,200,'C Vit Trio Reforzado','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3914,2,1,1,'Complejo B life jarabe','','Desempeña un papel importante para tener el sistema inmune en buenas condiciones.',NULL,0,1,1,1,0,2.32,'delivery-0001.appspot.com/o/op%2Fpr%2F3914-1618432643308.jpg',1,20,1000,0,200,'Complejo B life jarabe','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3915,2,1,1,'BagoVital Digest sobre 20 g','','Ayudan a restaurar el equilibrio de la flora intestinal, favoreciendo el desarrollo del sistema inmune.',NULL,0,1,1,1,0,19.01,'delivery-0001.appspot.com/o/op%2Fpr%2F3915-1618433159858.jpg',1,20,1000,0,200,'BagoVital Digest sobre 20 g','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3916,2,1,1,'BagoVital Inmune sobres 15 g','','Restablece el equilibrio de la flora intestinal. Gran utilidad en la diarrea asociada con antibióticos (AAD).',NULL,0,1,1,1,0,19.73,'delivery-0001.appspot.com/o/op%2Fpr%2F3916-1618433327673.jpg',1,20,1000,0,200,'BagoVital Inmune sobres 15 g','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3917,2,1,1,'Supradyn Gomitas masticables frasco','','Ayuda a activar y mantener tu energía interior.',NULL,0,1,1,1,0,10.30,'delivery-0001.appspot.com/o/op%2Fpr%2F3917-1618846929497.jpg',1,20,1000,0,200,'Supradyn Gomitas masticables frasco','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3918,2,1,1,'Cranberry jarabe 120 ml','','Estudiado y demostrado que promueve la salud del tracto urinario, los riñones y la vejiga.',NULL,0,1,1,1,0,24.00,'delivery-0001.appspot.com/o/op%2Fpr%2F3918-1618846962672.jpg',1,20,1000,0,200,'Cranberry jarabe 120 ml','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3919,2,1,1,'Redoxitos gomitas total','','Son gomitas masticables con vitaminas que aumentan las defensas de los niños, mejoran el sistema inmunológico.',NULL,0,1,1,1,0,4.63,'delivery-0001.appspot.com/o/op%2Fpr%2F3919-1618846984002.jpg',1,20,1000,0,200,'Redoxitos gomitas total','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3920,2,1,1,'Kaloba 20 mg tabletas','','Fortalece la respuesta del sistema inmunológico.',NULL,0,1,1,1,0,10.15,'delivery-0001.appspot.com/o/op%2Fpr%2F3920-1619462222395.jpg',1,20,1000,0,200,'Kaloba 20 mg tabletas','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3921,2,1,1,'Kaloba gotas 50 ml','','Fortalece la respuesta del sistema inmunológico.',NULL,0,1,1,1,0,13.87,'delivery-0001.appspot.com/o/op%2Fpr%2F3921-1619462346511.jpg',1,20,1000,0,200,'Kaloba gotas 50 ml','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3922,2,1,1,'Blemil 3 1200 gr','','Se adapta a la capacidad digestiva y renal de los niños de corta edad y sin azúcar añadido.',NULL,0,1,1,1,0,34.66,'delivery-0001.appspot.com/o/op%2Fpr%2F3922-1619470535896.jpg',1,20,1000,0,200,'Blemil 3 1200 gr','',100000,100000,'2021-04-07 21:30:20','2022-07-11 19:02:47',0),(3923,2,1,1,'Vitafos adulto 800 gr','','Complemento alimenticio que cubrirá tus necesidades de energía y nutrientes.',NULL,0,1,1,1,0,36.86,'delivery-0001.appspot.com/o/op%2Fpr%2F3923-1619472108347.jpg',1,20,1000,0,200,'Vitafos adulto 800 gr','',100000,100000,'2021-04-07 21:30:20','2022-07-11 19:02:47',0),(3924,2,1,1,'Chocolate Chocosol 30 gr.','','Chocolate relleno con coco y crema de avellana.',NULL,0,1,1,1,0,0.75,'delivery-0001.appspot.com/o/op%2Fpr%2F3924-1620261781080.jpg',1,20,1000,0,200,'Chocolate Chocosol 30 gr.','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3925,2,1,1,'Grageas de Uvilla chocolate 200 gr','','Grageas de Uvilla deshidratada recubiertas de Chocolate.',NULL,0,1,1,1,0,4.01,'delivery-0001.appspot.com/o/op%2Fpr%2F3925-1620261947122.jpg',1,20,1000,0,200,'Grageas de Uvilla chocolate 200 gr','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3926,2,1,1,'Grageas de Pasas Chocolate 200 gr','','Grageas de Pasas recubiertas de Chocolate.',NULL,0,1,1,1,0,2.93,'delivery-0001.appspot.com/o/op%2Fpr%2F3926-1620262140711.jpg',1,20,1000,0,200,'Grageas de Pasas Chocolate 200 gr','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3927,2,1,1,'Grageas de Almendras Chocolate 200 gr','','Grageas de Almendras recubiertas Chocolate',NULL,0,1,1,1,0,4.24,'delivery-0001.appspot.com/o/op%2Fpr%2F3927-1620262245425.jpg',1,20,1000,0,200,'Grageas de Almendras Chocolate 200 gr','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3928,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3929,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3930,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3931,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3932,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3933,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3934,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3935,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3936,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3937,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3938,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3939,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3940,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3941,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3942,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3943,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3944,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3945,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3946,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3947,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3948,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3949,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3950,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3951,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3952,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3953,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3954,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3955,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3956,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3957,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3958,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3959,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3960,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3961,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3962,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3963,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3964,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3965,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3966,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3967,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3968,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3969,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3970,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3971,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3972,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3973,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3974,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3975,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3976,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3977,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3978,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3979,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3980,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3981,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3982,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3983,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3984,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3985,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3986,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3987,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3988,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3989,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3990,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3991,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3992,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3993,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3994,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3995,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3996,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3997,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3998,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(3999,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4000,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4001,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4002,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4003,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4004,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4005,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4006,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4007,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4008,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4009,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4010,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4011,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4012,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4013,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4014,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4015,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4016,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4017,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4018,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4019,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4020,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4021,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4022,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4023,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4024,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4025,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4026,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4027,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4028,2,1,1,'NUEVO','','',NULL,0,0,0,1,0,0.00,'',1,20,1000,0,200,'NUEVO','',100000,100000,'2021-04-07 21:30:20','2021-06-04 13:08:17',0),(4032,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1618110112380.jpg',1,20,1000,0,200,'','',100000,100000,'2021-04-11 03:01:52','2021-06-04 13:08:17',0),(4034,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1618383875890.jpg',1,20,1000,0,200,'','',100000,100000,'2021-04-14 07:04:36','2021-06-04 13:08:17',0),(4036,117,1,1,'PROMOCIÓN DE HAMBURGUESAS A TU GUSTO:','','Elegir entre: 2 caribeñas, 2  casadas, 2 celosas, incluye porción mixta de papa y nachos ','{\"lP\": [{\"d\": \"2 Caribeñas (piña+ queso) +papas y nachos\", \"p\": \"8.99\", \"id\": \"0\"}, {\"d\": \"2 Casadas (Chorizo y queso) + papa y nacho\", \"p\": \"8.99\", \"id\": \"1\"}, {\"d\": \"2 Celosas (Pimiento,champiñones y queso) +papa y nacho\", \"p\": \"8.99\", \"id\": \"2\"}]}',1,1,1,1,0,8.99,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1618520557033.jpg',1,20,1000,6,200,'PROMOCIÓN DE HAMBURGUESAS A TU GUSTO:','',100000,100000,'2021-04-15 21:02:37','2021-06-04 13:08:17',0),(4037,117,1,1,'Super promoción','','Hamburguesa solita, papas y nachos, alitas, bebida','{\"lP\": [{\"d\": \"2 hamburguesas solitas + 1 papanachos + 4 alitas + 2 ?\", \"p\": \"10.5\", \"id\": \"0\"}, {\"d\": \"Hamburguesa solita + papanachos + 2 alitas + bebida\", \"p\": \"5.75\", \"id\": \"1\"}]}',1,1,1,1,0,5.75,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1618520864205.jpg',1,20,1000,4,200,'Super promoción','',100000,100000,'2021-04-15 21:07:44','2021-06-04 13:08:17',0),(4041,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1618699797095.jpg',1,20,1000,0,200,'','',100000,100000,'2021-04-17 22:49:57','2021-06-04 13:08:17',0),(4042,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1618939443758.jpg',1,20,1000,0,200,'','',100000,100000,'2021-04-20 17:24:04','2021-06-04 13:08:17',0),(4043,117,1,1,'Promo hamburguesa solita o doble carne','','Elegir entre hamburguesa solita o comprometida (doble carne), acompañada de papas y jugo ','{\"lP\": [{\"d\": \"Hamburguesa solita + papas + jugo\", \"p\": \"4.75\", \"id\": \"0\"}, {\"d\": \"Hamburguesa doble carne + papas + jugo \", \"p\": \"6.75\", \"id\": \"1\"}]}',1,1,1,1,0,4.75,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1618949486961.jpg',1,20,1000,1,200,'Promo hamburguesa solita o doble carne','',100000,100000,'2021-04-20 20:11:27','2022-07-11 19:02:47',0),(4045,117,1,1,'Promoción alitas ','','Escoger entre cuatro o doce alitas, acompañadas de jugo, papas y zanahoria.','{\"lP\": [{\"d\": \"12 alitas + 3 jugos + zanahoria \", \"p\": \"13.25\", \"id\": \"0\"}, {\"d\": \"4 alitas + jugo + zanahoria\", \"p\": \"4.5\", \"id\": \"1\"}]}',1,1,1,1,0,4.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1619030535794.jpg',1,20,1000,58,200,'Promoción alitas ','',100000,100000,'2021-04-21 18:42:16','2021-06-29 20:41:31',0),(4051,124,1,1,'Higadillas Carbonero','','Higadillas +  papa carbonero + ensalada',NULL,0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1619210228070.jpg',1,20,1000,1,200,'Higadillas Carbonero','',100000,100000,'2021-04-23 20:37:08','2021-06-04 13:08:17',0),(4052,124,1,1,'Porcion de Mote sucio','','Mote Sucio',NULL,0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1619211963947.jpg',1,20,1000,1,200,'Porcion de Mote sucio','',100000,100000,'2021-04-23 21:06:04','2021-06-04 13:08:17',0),(4053,124,1,1,'Porción de Papa ','','Papa Carbonero',NULL,0,1,1,1,0,2.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1619212046336.jpg',1,20,1000,2,200,'Porción de Papa ','',100000,100000,'2021-04-23 21:07:26','2021-06-04 13:08:17',0),(4054,124,1,1,'Parrillada Mini Junior','','Filete de Pollo + Chulete de cerdo BBQ + chorizo argentino + mote sucio + papa ensalada + ensalada',NULL,0,1,1,1,0,5.00,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1619212331344.jpg',1,20,1000,30,200,'Parrillada Mini Junior','',100000,100000,'2021-04-23 21:12:11','2021-06-04 13:08:17',0),(4055,124,1,1,'Porción de Chorizo','','Chorizo argentino + papa carbonero + ensalada',NULL,0,1,1,1,0,3.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1619212890287.jpg',1,20,1000,1,200,'Porción de Chorizo','',100000,100000,'2021-04-23 21:21:30','2021-06-04 13:08:17',0),(4056,124,1,1,'Lomo de Cerdo Carbonero','','Lomo de cerdo + mote sucio + papa carbonero + ensalada ',NULL,0,1,1,1,0,7.00,'delivery-0001.appspot.com/o/op%2Fpr%2F4056-1620840148196.jpg',1,20,1000,1,200,'Lomo de Cerdo Carbonero','',100000,100000,'2021-04-23 21:49:41','2021-06-04 13:08:17',0),(4057,124,1,1,'Parrillada de Camarones','','Deliciosos camarones + patacones + ensalada',NULL,0,1,1,1,0,5.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1619214696552.jpg',1,20,1000,4,200,'Parrillada de Camarones','',100000,100000,'2021-04-23 21:51:37','2021-06-04 13:08:17',0),(4058,124,1,1,'Bife Carbonero','','Lomo de res + mote sucio + papa carbonero + ensalada',NULL,0,1,1,1,0,6.50,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1619215076566.jpg',1,20,1000,2,200,'Bife Carbonero','',100000,100000,'2021-04-23 21:57:57','2021-06-04 13:08:17',0),(4065,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1619276996753.jpg',1,20,1000,0,200,'','',100000,100000,'2021-04-24 15:09:57','2021-06-04 13:08:17',0),(4068,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1619412631358.jpg',1,20,1000,0,200,'','',100000,100000,'2021-04-26 04:50:31','2021-06-04 13:08:17',0),(4073,140,1,1,'Cama semidoble','','Madera fina 120 estado 9/10',NULL,0,0,1,1,0,11900.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1619640492709.jpg',1,20,1000,0,200,'Cama semidoble','https://lili.planck.biz/zcq3',100000,100000,'2021-04-28 20:08:13','2022-07-11 19:02:47',0),(4079,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1620314460367.jpg',1,20,1000,0,200,'','',100000,100000,'2021-05-06 15:21:00','2021-06-04 13:08:17',0),(4080,43,1,1,'Promo mamá','','2 pizzas personales de cuatro porciones cada una ( mixtas de jamón y pepperoni), más litro de helado',NULL,1,1,1,1,0,8.99,'delivery-0001.appspot.com/o/op%2Fpr%2F-100-1620410964653.jpg',1,20,1000,0,200,'Promo mamá','',100000,100000,'2021-05-07 18:09:25','2021-06-04 13:08:17',0),(4081,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1620592514842.jpg',1,20,1000,0,200,'','',100000,100000,'2021-05-09 20:35:15','2021-06-04 13:08:17',0),(4082,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1620602735956.jpg',1,20,1000,0,200,'','',100000,100000,'2021-05-09 23:25:36','2021-06-04 13:08:17',0),(4085,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1620959151643.jpg',1,20,1000,0,200,'','',100000,100000,'2021-05-14 02:25:52','2021-06-04 13:08:17',0),(4086,140,1,1,'','','',NULL,0,2,1,1,0,0.00,'delivery-0001.appspot.com/o/li%2Fpr%2F-100-1621182603965.jpg',1,20,1000,0,200,'','',100000,100000,'2021-05-16 16:30:04','2021-06-04 13:08:17',0);
/*!40000 ALTER TABLE `promocion` ENABLE KEYS */;

--
-- Table structure for table `punto_razon`
--

DROP TABLE IF EXISTS `punto_razon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `punto_razon` (
  `id_aplicativo` int NOT NULL,
  `tipo` tinyint(1) NOT NULL COMMENT '1 Referido\\n2 Compras',
  `razon` varchar(45) NOT NULL,
  `puntos` smallint NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_aplicativo`,`tipo`),
  KEY `fk_puntos_razon__clienteRegistro_idx` (`id_registro`),
  KEY `fk_puntos_razon__clienteActualizo_idx` (`id_actualizo`),
  KEY `fk_punto_razon__aplicativo_idx` (`id_aplicativo`),
  CONSTRAINT `fk_punto_razon__aplicativo` FOREIGN KEY (`id_aplicativo`) REFERENCES `aplicativo` (`id_aplicativo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_puntos_razon__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_puntos_razon__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punto_razon`
--

/*!40000 ALTER TABLE `punto_razon` DISABLE KEYS */;
INSERT INTO `punto_razon` VALUES (1000001,1,'Referido',10,1,100000,NULL,'2020-02-23 16:29:07','2020-02-23 16:58:41');
/*!40000 ALTER TABLE `punto_razon` ENABLE KEYS */;

--
-- Table structure for table `saldo`
--

DROP TABLE IF EXISTS `saldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saldo` (
  `id_cliente` int NOT NULL,
  `saldo` double(10,2) NOT NULL DEFAULT '0.00',
  `credito` double(10,2) NOT NULL DEFAULT '0.00',
  `cash` double(10,2) NOT NULL DEFAULT '0.00',
  `importe` double(5,2) NOT NULL DEFAULT '20.00' COMMENT 'Porcentaje que se aprovisiona Planck por el despacho en saldo.',
  `coste` double(5,2) NOT NULL DEFAULT '20.00',
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cashes` int unsigned NOT NULL DEFAULT '0',
  `fecha_cash` datetime DEFAULT NULL,
  `reembolsos` int unsigned NOT NULL DEFAULT '0',
  `fecha_reembolso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `fk_saldo__cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saldo`
--

/*!40000 ALTER TABLE `saldo` DISABLE KEYS */;
INSERT INTO `saldo` VALUES (233159,0.00,0.00,0.00,20.00,20.00,'2021-06-22 13:22:29',0,NULL,0,NULL),(233302,0.00,0.00,0.00,20.00,20.00,'2021-06-29 21:00:41',2,'2021-06-29 21:00:41',0,NULL),(233314,0.00,0.00,0.00,20.00,20.00,'2021-06-22 02:57:11',0,NULL,0,NULL),(233315,0.00,0.00,0.00,20.00,20.00,'2021-06-22 02:57:11',0,NULL,0,NULL);
/*!40000 ALTER TABLE `saldo` ENABLE KEYS */;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `id_despacho` int unsigned NOT NULL,
  `id_conductor` int NOT NULL,
  `asignados` smallint NOT NULL,
  PRIMARY KEY (`id_despacho`,`id_conductor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `id_agencia` int NOT NULL,
  `id_urbe` int NOT NULL,
  `sucursal` varchar(90) NOT NULL,
  `pin` char(4) DEFAULT NULL,
  `direccion` varchar(245) NOT NULL,
  `observacion` varchar(245) NOT NULL DEFAULT '',
  `img` varchar(300) NOT NULL DEFAULT '',
  `lt` double(10,6) NOT NULL,
  `lg` double(10,6) NOT NULL,
  `tipo` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1, Despachan con Chat\\n2. Poseen un stock. No usan chat.\\n3, Poseen los dos perfiles. ',
  `contacto` varchar(15) NOT NULL,
  `mail` varchar(60) NOT NULL,
  `costo_arranque` double(10,2) NOT NULL DEFAULT '0.00',
  `costo_km_recorrido` double(10,2) NOT NULL DEFAULT '0.00',
  `sessiones` tinyint NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `cerrado_desde` date DEFAULT NULL,
  `cerrado_hasta` date DEFAULT NULL,
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cio` tinyint(1) NOT NULL DEFAULT '0',
  `prioridad` tinyint(1) NOT NULL DEFAULT '1',
  `saludo` varchar(200) NOT NULL DEFAULT 'Hola, estamos procesando tu compra...' COMMENT '$-CAJERO-$ Nombre que se reemplaza con el cajero',
  PRIMARY KEY (`id_sucursal`),
  UNIQUE KEY `pin_UNIQUE` (`pin`),
  KEY `fk_sucursal__agencia_idx` (`id_agencia`),
  KEY `fk_sucursal__clienteRegistro_idx` (`id_registro`),
  KEY `fk_sucursal__clienteActualizo_idx` (`id_actualizo`),
  KEY `fk_sucursal__urbe_idx` (`id_urbe`),
  CONSTRAINT `fk_sucursal__agencia` FOREIGN KEY (`id_agencia`) REFERENCES `agencia` (`id_agencia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal__urbe` FOREIGN KEY (`id_urbe`) REFERENCES `urbe` (`id_urbe`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,1,1,'Opportunity Help',NULL,'Nicargahua y Huoranies','Opportunity Help','https://image.freepik.com/vector-gratis/servicio-entrega-concepto-mascaras-medicas_23-2148504161.jpg',-4.001473,-79.202832,2,'+593991786786','',0.00,0.00,4,1,'2021-02-25','2021-02-27',100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(2,2,1,'Farmacia Cuxi Vilcabamba',NULL,'Alonso de Mercadillo, Loja','Farmacia Cuxi Vilcabamba','delivery-0001.appspot.com/o/ag%2F2.jpg',-3.999061,-79.205177,2,'+593991786786','',0.00,0.00,5,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(3,3,1,'Huaquillitas',NULL,'Calle Perú y Uruguay','Huaquillitas','delivery-0001.appspot.com/o/ag%2F3.jpg',-4.006765,-79.202440,2,'+593991786786','',0.00,0.00,7,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(4,2,1,'Farmacia Cuxi el Valle',NULL,'Alonso de Mercadillo, Loja','Farmacia Cuxi el Valle','delivery-0001.appspot.com/o/ag%2F2.jpg',-3.981192,-79.203051,1,'+593991786786','',0.00,0.00,7,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(5,2,1,'Farmacia Cuxi San Sebastian',NULL,'Alonso de Mercadillo, Loja','Farmacia Cuxi San Sebastian','delivery-0001.appspot.com/o/ag%2F2.jpg',-4.001200,-79.201843,1,'+593991786786','',0.00,0.00,6,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(6,2,1,'Farmacia Cuxi Principal',NULL,'Alonso de Mercadillo, Loja','Farmacia Cuxi Principal','delivery-0001.appspot.com/o/ag%2F2.jpg',-4.001309,-79.202738,3,'+593991786786','',0.00,0.00,5,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(10,7,1,'Pollos Sandy  Merca..',NULL,'Mercadillo entre sucre y bolivar','Pollos Sandy  Merca..','delivery-0001.appspot.com/o/ag%2F7.jpg',-4.001779,-79.202109,2,'+593991786786','',0.00,0.00,3,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(12,9,1,'Hueca del pollo',NULL,'Av. Pío Jaramillo y Gob. de Mainas','Hueca del pollo','delivery-0001.appspot.com/o/ag%2F9.jpg',-4.012466,-79.203789,2,'+593991786786','',0.00,0.00,4,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(15,12,1,'Supermercado MERCATOA',NULL,'Av. Pío Jaramillo alvaro y Leonardo da Vinci','Supermercado MERCATOA','delivery-0001.appspot.com/o/ag%2F12.jpg',-4.022525,-79.203254,3,'+593991786786','',0.00,0.00,7,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(18,15,1,'Panadería y Pastelería del K-cho',NULL,'Juan de Salinas entre Sucre y Bolivar','Panadería y Pastelería del K-cho','delivery-0001.appspot.com/o/ag%2F15.jpg',-3.991590,-79.203033,2,'+593991786786','',0.00,0.00,6,1,NULL,NULL,100000,NULL,'2020-03-22 20:56:35','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(19,16,1,'Panaderia Tertulia',NULL,'Sucre y Colón, frente a correos del Ecuador ','Panaderia Tertulia','delivery-0001.appspot.com/o/ag%2F16.jpg',-3.995208,-79.203195,2,'+593991786786','',0.00,0.00,4,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(20,17,1,'La granja 100 % orgánico',NULL,'Rosario entre Iquitos y Potosí, Clodoveo Jaramillo','La granja 100 % orgánico','delivery-0001.appspot.com/o/ag%2F17.jpg',-3.980751,-79.211301,2,'+593991786786','',0.00,0.00,7,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(22,19,1,'Horno de Leña',NULL,'Miguel Riofrío y Av. Manuel Agustín Aguirre, detrás de la parada','Horno de Leña','delivery-0001.appspot.com/o/ag%2F19.jpg',-3.999416,-79.205138,2,'+593991786786','',0.00,0.00,8,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(24,2,1,'Farmacia Cuxi UTPL',NULL,'Alonso de Mercadillo, Loja','Farmacia Cuxi UTPL','delivery-0001.appspot.com/o/ag%2F2.jpg',-4.003049,-79.198868,1,'+593991786786','',0.00,0.00,9,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(25,2,1,'Farmacia Cuxi Bayer',NULL,'Alonso de Mercadillo, Loja','Farmacia Cuxi Bayer','delivery-0001.appspot.com/o/ag%2F2.jpg',-4.000395,-79.203893,1,'+593991786786','',0.00,0.00,7,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(26,2,1,'Farmacia Cuxi José Felix',NULL,'Alonso de Mercadillo, Loja','Farmacia Cuxi José Felix','delivery-0001.appspot.com/o/ag%2F2.jpg',-3.992608,-79.205481,1,'+593991786786','',0.00,0.00,9,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(28,23,1,'Pañalera Baby Shop',NULL,'Mexico 529-36 y Chile,  La Tebaida','Pañalera Baby Shop','delivery-0001.appspot.com/o/ag%2F23.jpg',-4.002371,-79.200734,3,'+593991786786','',0.00,0.00,12,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,0,'Hola, estamos procesando tu compra...'),(30,24,1,'Las papas del hueco',NULL,'Quito entre Bolivar y Bernarndo Valdivieso','Las papas del hueco','delivery-0001.appspot.com/o/ag%2F24.jpg',-3.993332,-79.202058,2,'+593991786786','',0.00,0.00,6,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(33,28,1,'Lanzaca avícola',NULL,'Bernardo Valdivieso y Lourdes','Lanzaca avícola','delivery-0001.appspot.com/o/ag%2F28.jpg',-4.002300,-79.200797,2,'+593991786786','',0.00,0.00,10,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(47,41,1,'Pollos Sandy Terminal',NULL,'Av. Pablo Palacio y Gerónimo carrión','Pollos Sandy Terminal','delivery-0001.appspot.com/o/ag%2F41.jpg',-3.976335,-79.204498,2,'+593991786786','',0.00,0.00,6,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(49,42,1,'Parrilladas el Fogón Terminal',NULL,'Av. Pablo Palacio y Gerónimo Carrión','Parrilladas el Fogón Terminal','delivery-0001.appspot.com/o/ag%2F42.jpg',-3.976335,-79.204498,2,'+593991786786','',0.00,0.00,6,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(50,43,1,'Pizza House',NULL,'Mercadillo entre José Maria Peña y Nicolás Garcia','Pizza House','delivery-0001.appspot.com/o/ag%2F43.jpg',-4.001491,-79.207038,2,'+593991786786','',0.00,0.00,8,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(51,44,1,'Alitas y Bandejitas',NULL,'24 de mayo entre J.A. eguiguren y 10 de Agosto','Alitas y Bandejitas','delivery-0001.appspot.com/o/ag%2F44.jpg',-3.996253,-79.198263,2,'+593991786786','',0.00,0.00,7,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(53,46,1,'El mago rey Pollos a la Brasa',NULL,'Av. Orillas del Zamora y juan José Peña','El mago rey Pollos a la Brasa','delivery-0001.appspot.com/o/ag%2F46.jpg',-3.994113,-79.199450,2,'+593991786786','',0.00,0.00,6,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(55,47,1,'Juancho Moretti',NULL,'Machala y jaramijó','Juancho Moretti','delivery-0001.appspot.com/o/ag%2F47.jpg',-3.978606,-79.203910,2,'+593991786786','',0.00,0.00,7,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(63,55,1,'Suco´s encebollados',NULL,'18 de noviembre entre celica y gonzanamá','Suco´s encebollados','delivery-0001.appspot.com/o/ag%2F55.jpg',-4.007117,-79.203265,2,'+593991786786','',0.00,0.00,8,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(66,2,1,'Farmacia Cuxi Abendaño',NULL,'','Farmacia Cuxi Abendaño','delivery-0001.appspot.com/o/ag%2F2.jpg',-4.003131,-79.199727,1,'+593991786786','',0.00,0.00,10,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(67,2,1,'Farmacia Cuxi Bolivar',NULL,'','Farmacia Cuxi Bolivar','delivery-0001.appspot.com/o/ag%2F2.jpg',-3.995585,-79.202208,1,'+593991786786','',0.00,0.00,9,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(68,88,1,'Farmacia Cuxi Dermatológica',NULL,'','Farmacia Cuxi Dermatológica','delivery-0001.appspot.com/o/ag%2F88.jpg',-3.999604,-79.201968,3,'+593991786786','',0.00,0.00,11,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,10,'Hola, estamos procesando tu compra...'),(69,2,1,'Farmacia Cuxi Juan José Peña',NULL,'','Farmacia Cuxi Juan José Peña','delivery-0001.appspot.com/o/ag%2F2.jpg',-3.998997,-79.198945,1,'+593991786786','',0.00,0.00,10,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(70,2,1,'Farmacia Cuxi Lourdes',NULL,'','Farmacia Cuxi Lourdes','delivery-0001.appspot.com/o/ag%2F2.jpg',-4.002548,-79.203609,1,'+593991786786','',0.00,0.00,9,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(71,2,1,'Farmacia Cuxi Mayorista',NULL,'','Farmacia Cuxi Mayorista','delivery-0001.appspot.com/o/ag%2F2.jpg',-3.986209,-79.204430,1,'+593991786786','',0.00,0.00,10,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(72,2,1,'Farmacia Cuxi Médicos',NULL,'','Farmacia Cuxi Médicos','delivery-0001.appspot.com/o/ag%2F2.jpg',-3.996388,-79.204091,1,'+593991786786','',0.00,0.00,8,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(73,2,1,'Farmacia Cuxi Mogrovejo',NULL,'','Farmacia Cuxi Mogrovejo','delivery-0001.appspot.com/o/ag%2F2.jpg',-4.003014,-79.203635,1,'+593991786786','',0.00,0.00,9,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(74,87,1,'Farmacia Cuxi Ortopedia Carmita Armijos',NULL,'','Farmacia Cuxi Ortopedia Carmita Armijos','delivery-0001.appspot.com/o/ag%2F87.jpg',-4.001452,-79.204446,3,'+593991786786','',0.00,0.00,9,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,11,'Hola, estamos procesando tu compra...'),(75,2,1,'Farmacia Cuxi Sindicato',NULL,'','Farmacia Cuxi Sindicato','delivery-0001.appspot.com/o/ag%2F2.jpg',-3.997953,-79.204868,1,'+593991786786','',0.00,0.00,9,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(76,2,1,'Farmacia Cuxi Vida',NULL,'','Farmacia Cuxi Vida','delivery-0001.appspot.com/o/ag%2F2.jpg',-3.999239,-79.201945,1,'+593991786786','',0.00,0.00,9,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(77,2,1,'Farmacia Cuxi Emergencia',NULL,'','Farmacia Cuxi Emergencia','delivery-0001.appspot.com/o/ag%2F2.jpg',-3.994593,-79.206345,1,'+593991786786','',0.00,0.00,8,0,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(78,2,1,'Farmacia Cuxi Asesor Xiomara Betancourt',NULL,'','Farmacia Cuxi Asesor Xiomara Betancourt','delivery-0001.appspot.com/o/ag%2F2.jpg',-4.001395,-79.202855,3,'+593991786786','',0.00,0.00,11,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(79,58,1,'El tamal lojano',NULL,'24 de mayo y mercadillo','El tamal lojano','delivery-0001.appspot.com/o/ag%2F58.jpg',-3.994545,-79.204223,2,'+593991786786','',0.00,0.00,7,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(83,62,1,'Fruques',NULL,'18 de noviembre y saraguro','Fruques','delivery-0001.appspot.com/o/ag%2F62.jpg',-4.009108,-79.203021,2,'+593991786786','',0.00,0.00,3,1,NULL,NULL,100000,100000,'2020-05-05 05:15:51','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(86,65,1,'Papas De Balde',NULL,'Papas del balde','Papas De Balde','delivery-0001.appspot.com/o/ag%2F65.jpg',-4.001265,-79.199492,2,'+593991786786','',0.00,0.00,4,1,NULL,NULL,100000,NULL,'2020-05-07 03:01:24','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(90,69,1,'Piscis Marisquería',NULL,'Piscis marisquería','Piscis Marisquería','delivery-0001.appspot.com/o/ag%2F69.jpg',-3.994809,-79.203261,2,'+593991786786','',0.00,0.00,5,1,NULL,NULL,100000,NULL,'2020-05-11 06:32:04','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(91,70,1,'Artesanale',NULL,'Artesanale','Artesanale','delivery-0001.appspot.com/o/ag%2F70.jpg',-3.992958,-79.198569,2,'+593991786786','',0.00,0.00,4,1,NULL,NULL,100000,NULL,'2020-05-17 23:58:46','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(98,47,1,'Juancho Moretti Colón',NULL,'Colón y Lauro Guerrero','Juancho Moretti Colón','delivery-0001.appspot.com/o/ag%2F47.jpg',-3.995482,-79.205849,2,'+593991786786','',0.00,0.00,3,1,NULL,NULL,100000,NULL,'2020-05-23 16:08:23','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(99,47,1,'Juancho Moretti Mall Don Daniel',NULL,'Mall Don Daniel','Juancho Moretti Mall Don Daniel','delivery-0001.appspot.com/o/ag%2F47.jpg',-4.009579,-79.202747,2,'+593991786786','',0.00,0.00,3,1,NULL,NULL,100000,NULL,'2020-05-23 16:18:38','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(100,47,1,'Juancho Moretti Redondel UNL',NULL,'Redondel UNL','Juancho Moretti Redondel UNL','delivery-0001.appspot.com/o/ag%2F47.jpg',-4.032721,-79.202593,2,'+593991786786','',0.00,0.00,3,1,NULL,NULL,100000,NULL,'2020-05-23 16:20:04','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(101,47,1,'Juancho Moretti La Estación',NULL,'La Estación, alado de la bomba quemada','Juancho Moretti La Estación','delivery-0001.appspot.com/o/ag%2F47.jpg',-4.001873,-79.207701,2,'+593991786786','',0.00,0.00,6,1,NULL,NULL,100000,NULL,'2020-05-23 16:21:30','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(105,2,1,'Farmacia Cuxi Asesor Paul Jimenez',NULL,'','Farmacia Cuxi Asesor Paul Jimenez','delivery-0001.appspot.com/o/ag%2F2.jpg',-4.001432,-79.202914,3,'+593991786786','',0.00,0.00,13,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(106,2,1,'Farmacia Cuxi Asesor Leonardo Costa',NULL,'','Farmacia Cuxi Asesor Leonardo Costa','delivery-0001.appspot.com/o/ag%2F2.jpg',-4.001465,-79.202795,3,'+593991786786','',0.00,0.00,12,1,NULL,NULL,100000,NULL,'2020-01-31 16:01:51','2021-06-23 15:56:37',0,2,'Hola, estamos procesando tu compra...'),(124,97,1,'Papá Charro',NULL,'Dirección','Papá Charro','delivery-0001.appspot.com/o/ag%2F97.jpg',-3.996420,-79.198277,2,'+593991786786','',0.00,0.00,4,1,'2021-03-01','2021-03-02',100000,NULL,'2020-06-01 04:42:28','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(128,101,1,'Kentucky Fried Chicken mayorista',NULL,'Gran aki mayorista','Kentucky Fried Chicken mayorista','delivery-0001.appspot.com/o/ag%2F101.jpg',-3.987868,-79.202543,2,'+593991786786','',0.00,0.00,3,1,NULL,NULL,100000,100000,'2020-06-11 05:21:22','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(131,104,1,'Pincheria el Valle',NULL,'Opportunity','Pincheria el Valle','delivery-0001.appspot.com/o/ag%2F104.jpg',-3.981538,-79.202466,2,'+593991786786','',0.00,0.00,3,1,NULL,NULL,100000,NULL,'2020-06-15 23:49:39','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(132,105,1,'Pollos Gusy',NULL,'Dirección','Pollos Gusy','delivery-0001.appspot.com/o/ag%2F105.jpg',-3.976421,-79.204432,2,'+593991786786','',0.00,0.00,3,1,NULL,NULL,100000,NULL,'2020-06-16 21:29:54','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(134,105,1,'Pollos gusy parque bolivar',NULL,'colon y av universitaria','Pollos gusy parque bolivar','delivery-0001.appspot.com/o/ag%2F105.jpg',-3.995257,-79.205491,2,'+593991786786','',0.00,0.00,2,1,NULL,NULL,100000,NULL,'2020-06-17 00:49:50','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(136,108,1,'Repe & Bolón',NULL,'Dirección','Repe & Bolón','delivery-0001.appspot.com/o/ag%2F108.jpg',-3.994958,-79.204160,2,'+593991786786','',0.00,0.00,4,1,NULL,NULL,100000,NULL,'2020-06-24 23:28:28','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(137,109,1,'Mama Lola',NULL,'Dirección','Mama Lola','delivery-0001.appspot.com/o/ag%2F109.jpg',-3.977951,-79.201010,2,'+593991786786','',0.00,0.00,3,1,NULL,NULL,100000,NULL,'2020-06-27 02:42:54','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(145,115,1,'Dragon Wings',NULL,'Dirección','Dragon Wings','delivery-0001.appspot.com/o/ag%2F115.jpg',-4.002151,-79.207228,2,'+593991786786','',0.00,0.00,5,1,NULL,NULL,100000,NULL,'2020-07-12 03:45:10','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(147,117,1,'Hamburguesas Cuadradas',NULL,'Dirección','Hamburguesas Cuadradas','delivery-0001.appspot.com/o/ag%2F117.jpg',-4.002534,-79.202947,2,'+593991786786','',0.00,0.00,8,1,NULL,NULL,100000,NULL,'2020-07-19 03:27:08','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(155,62,1,'Fruques Rocafuerte',NULL,'calle rocafuerte','Fruques Rocafuerte','delivery-0001.appspot.com/o/ag%2F62.jpg',-3.997923,-79.199061,2,'+593991786786','',0.00,0.00,2,1,NULL,NULL,100000,NULL,'2020-07-24 23:33:39','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(156,124,1,'Carbonero Mirador',NULL,'Dirección','Carbonero Mirador','delivery-0001.appspot.com/o/ag%2F124.jpg',-3.998461,-79.207858,2,'+593991786786','',0.00,0.00,4,1,NULL,NULL,100000,NULL,'2020-07-25 00:38:19','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(159,127,1,'Nachos del Güero',NULL,'Dirección','Nachos del Güero','delivery-0001.appspot.com/o/ag%2F127.jpg',-3.993908,-79.198319,2,'+593991786786','',0.00,0.00,4,1,NULL,NULL,100000,NULL,'2020-08-03 03:01:37','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(160,128,1,'Chifa Oriental',NULL,'Dirección','Chifa Oriental','delivery-0001.appspot.com/o/ag%2F128_1.jpg',-4.000615,-79.204945,2,'+593991786786','',0.00,0.00,4,1,NULL,NULL,100000,NULL,'2020-08-07 05:04:53','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(167,135,1,'Los Moros',NULL,'Dirección','Los Moros','delivery-0001.appspot.com/o/ag%2F135.jpg',-3.980185,-79.208134,2,'+593991786786','',0.00,0.00,5,1,NULL,NULL,100000,NULL,'2020-08-24 01:48:39','2021-06-23 15:56:37',0,1,'Hola, estamos procesando tu compra...'),(172,140,1,'delivery','3693','Redondel terminal','delivery','delivery-0001.appspot.com/o/ag%2F1.png',-4.004191,-79.209259,2,'+593991786786','',0.00,0.00,3,1,NULL,NULL,100000,NULL,'2020-09-10 01:29:15','2021-06-23 15:56:37',0,123,'Hola, estamos procesando tu compra...');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sucursal_BEFORE_INSERT` BEFORE INSERT ON `sucursal` FOR EACH ROW BEGIN
	SET NEW.sucursal = TRIM(NEW.sucursal);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sucursal_cajero`
--

DROP TABLE IF EXISTS `sucursal_cajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal_cajero` (
  `id_cajero` int NOT NULL,
  `id_sucursal` int NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `calificaciones` int unsigned NOT NULL DEFAULT '0',
  `calificacion` double(10,2) unsigned NOT NULL DEFAULT '0.00',
  `registros` int unsigned NOT NULL DEFAULT '0',
  `confirmados` int unsigned NOT NULL DEFAULT '0',
  `correctos` int unsigned NOT NULL DEFAULT '0',
  `canceladas` int unsigned NOT NULL DEFAULT '0',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cajero`,`id_sucursal`),
  KEY `fk_sucursal_cajero__sucursal_idx` (`id_sucursal`),
  KEY `fk_sucursal_cajero__clienteRegistro_idx` (`id_registro`),
  KEY `fk_sucursal_cajero__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_sucursal_cajero__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal_cajero__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal_cajero__sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Debe existir siempre solo un cajero activo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal_cajero`
--

/*!40000 ALTER TABLE `sucursal_cajero` DISABLE KEYS */;
INSERT INTO `sucursal_cajero` VALUES (100000,1,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,2,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,3,1,173,798.00,242,241,128,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 15:43:17'),(100000,4,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,5,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,6,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,10,1,174,803.00,243,242,128,98,100000,NULL,'2020-07-19 03:27:08','2021-06-22 23:55:30'),(100000,12,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,15,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,18,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,19,1,173,798.00,242,241,128,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:30:06'),(100000,20,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,22,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,24,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,25,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,26,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,28,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,30,1,173,798.00,242,241,128,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 23:42:47'),(100000,33,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,47,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,49,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,50,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,51,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,53,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,55,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,63,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,66,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,67,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,68,1,174,802.50,242,241,128,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 13:24:51'),(100000,69,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,70,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,71,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,72,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,73,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,74,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,75,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,76,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,77,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,78,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,79,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,83,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,86,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,90,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,91,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,98,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,99,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,100,1,174,802.50,242,241,128,97,100000,NULL,'2020-07-19 03:27:08','2021-06-23 01:13:24'),(100000,101,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,105,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,106,1,173,798.00,242,241,128,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 23:34:05'),(100000,124,1,174,802.50,242,241,128,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 23:48:58'),(100000,128,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,131,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,132,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,134,1,174,802.50,243,242,129,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 13:23:54'),(100000,136,1,174,802.50,243,242,129,97,100000,NULL,'2020-07-19 03:27:08','2021-06-23 17:06:01'),(100000,137,1,174,802.50,242,241,128,97,100000,NULL,'2020-07-19 03:27:08','2021-06-23 20:06:32'),(100000,145,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,147,1,176,811.50,244,243,129,98,100000,NULL,'2020-07-19 03:27:08','2021-06-29 21:00:59'),(100000,155,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,156,1,173,798.00,242,241,128,97,100000,NULL,'2020-07-19 03:27:08','2021-06-23 02:17:22'),(100000,159,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20'),(100000,160,1,174,803.00,242,241,128,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:54:03'),(100000,167,1,174,802.50,242,241,128,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 13:22:59'),(100000,172,1,173,798.00,241,240,127,97,100000,NULL,'2020-07-19 03:27:08','2021-06-22 03:01:20');
/*!40000 ALTER TABLE `sucursal_cajero` ENABLE KEYS */;

--
-- Table structure for table `sucursal_horario`
--

DROP TABLE IF EXISTS `sucursal_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal_horario` (
  `id_sucursal_horario` int NOT NULL AUTO_INCREMENT,
  `id_sucursal` int NOT NULL,
  `tipo` tinyint(1) NOT NULL COMMENT '1 Horario especificado por día 0 Domingo 1 Lunes, etc\n2 Horario especificado por fecha. Posee mayor prioridad para evaluar.',
  `dia` tinyint(1) NOT NULL,
  `fecha` date DEFAULT NULL,
  `desde` time NOT NULL,
  `hasta` time NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TZ` varchar(25) NOT NULL DEFAULT 'America/Guayaquil',
  PRIMARY KEY (`id_sucursal_horario`),
  UNIQUE KEY `unico_dia_sucursal` (`id_sucursal`,`dia`),
  KEY `fk_sucursal_horario__sucursal_idx` (`id_sucursal`),
  KEY `fk_sucursal_horario__clienteRegistro_idx` (`id_registro`),
  KEY `fk_sucursal_horario__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_sucursal_horario__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal_horario__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal_horario__sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=1276 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal_horario`
--

/*!40000 ALTER TABLE `sucursal_horario` DISABLE KEYS */;
INSERT INTO `sucursal_horario` VALUES (29,3,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(30,3,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(31,3,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(32,3,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(33,3,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(34,3,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(35,3,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(57,10,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(58,10,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(59,10,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(60,10,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(61,10,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(62,10,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(63,10,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(71,12,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(72,12,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(73,12,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(74,12,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(75,12,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(76,12,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(77,12,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(92,15,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(93,15,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(94,15,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(95,15,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(96,15,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(97,15,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(98,15,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(173,2,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(174,2,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(175,2,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(176,2,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(177,2,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(178,2,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(179,2,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(180,4,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(181,4,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(182,4,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(183,4,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(184,4,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(185,4,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(186,4,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(187,5,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(188,5,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(189,5,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(190,5,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(191,5,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(192,5,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(193,5,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(195,18,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(196,18,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(197,18,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(198,18,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(199,18,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(200,18,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(201,18,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(205,6,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(206,6,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(207,6,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(208,6,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(209,6,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(210,6,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(211,6,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(212,19,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(213,19,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(214,19,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(215,19,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(216,19,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(217,19,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(218,19,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(219,1,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(220,1,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(221,1,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(222,1,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(223,1,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(224,1,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(225,1,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(226,20,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(227,20,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(228,20,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(229,20,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(230,20,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(231,20,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(232,20,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(241,22,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(242,22,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(243,22,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(244,22,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(245,22,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(246,22,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(247,22,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(256,24,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(257,24,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(258,24,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(259,24,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(260,24,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(261,24,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(262,24,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(263,25,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(264,25,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(265,25,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(266,25,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(267,25,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(268,25,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(269,25,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(270,26,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(271,26,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(272,26,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(273,26,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(274,26,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(275,26,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(276,26,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(284,28,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(285,28,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(286,28,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(287,28,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(288,28,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(289,28,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(290,28,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(298,30,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(299,30,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(300,30,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(301,30,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(302,30,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(303,30,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(304,30,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(319,33,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(320,33,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(321,33,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(322,33,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(323,33,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(324,33,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(325,33,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(417,47,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(418,47,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(419,47,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(420,47,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(421,47,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(422,47,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(423,47,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(431,49,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(432,49,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(433,49,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(434,49,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(435,49,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(436,49,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(437,49,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(438,50,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(439,50,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(440,50,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(441,50,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(442,50,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(443,50,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(444,50,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(445,51,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(446,51,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(447,51,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(448,51,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(449,51,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(450,51,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(451,51,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(459,53,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(460,53,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(461,53,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(462,53,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(463,53,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(464,53,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(465,53,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(473,55,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(474,55,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(475,55,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(476,55,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(477,55,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(478,55,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(479,55,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(529,63,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(530,63,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(531,63,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(532,63,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(533,63,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(534,63,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(535,63,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(550,66,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(551,66,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(552,66,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(553,66,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(554,66,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(555,66,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(556,66,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(557,67,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(558,67,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(559,67,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(560,67,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(561,67,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(562,67,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(563,67,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(564,68,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(565,68,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(566,68,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(567,68,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(568,68,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(569,68,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(570,68,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(571,69,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(572,69,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(573,69,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(574,69,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(575,69,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(576,69,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(577,69,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(578,70,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(579,70,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(580,70,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(581,70,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(582,70,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(583,70,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(584,70,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(585,71,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(586,71,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(587,71,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(588,71,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(589,71,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(590,71,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(591,71,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(592,72,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(593,72,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(594,72,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(595,72,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(596,72,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(597,72,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(598,72,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(600,73,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(601,73,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(602,73,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(603,73,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(604,73,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(605,73,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(606,73,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(607,74,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(608,74,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(609,74,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(610,74,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(611,74,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(612,74,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(613,74,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(615,75,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(616,75,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(617,75,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(618,75,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(619,75,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(620,75,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(621,75,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(622,76,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(623,76,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(624,76,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(625,76,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(626,76,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(627,76,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(628,76,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(629,77,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(630,77,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(631,77,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(632,77,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(633,77,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(634,77,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(635,77,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(636,78,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(637,78,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(638,78,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(639,78,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(640,78,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(641,78,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(642,78,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(643,79,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(644,79,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(645,79,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(646,79,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(647,79,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(648,79,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(649,79,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-02-04 15:30:56','2021-06-05 04:16:55','America/Guayaquil'),(672,83,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-05 05:15:51','2021-06-05 04:16:55','America/Guayaquil'),(673,83,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-05 05:15:51','2021-06-05 04:16:55','America/Guayaquil'),(674,83,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-05 05:15:51','2021-06-05 04:16:55','America/Guayaquil'),(675,83,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-05 05:15:51','2021-06-05 04:16:55','America/Guayaquil'),(676,83,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-05 05:15:51','2021-06-05 04:16:55','America/Guayaquil'),(677,83,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-05 05:15:51','2021-06-05 04:16:55','America/Guayaquil'),(678,83,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-05 05:15:51','2021-06-05 04:16:55','America/Guayaquil'),(693,86,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-07 03:01:24','2021-06-05 04:16:55','America/Guayaquil'),(694,86,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-07 03:01:24','2021-06-05 04:16:55','America/Guayaquil'),(695,86,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-07 03:01:24','2021-06-05 04:16:55','America/Guayaquil'),(696,86,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-07 03:01:24','2021-06-05 04:16:55','America/Guayaquil'),(697,86,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-07 03:01:24','2021-06-05 04:16:55','America/Guayaquil'),(698,86,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-07 03:01:24','2021-06-05 04:16:55','America/Guayaquil'),(699,86,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-07 03:01:24','2021-06-05 04:16:55','America/Guayaquil'),(721,90,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-11 06:32:04','2021-06-05 04:16:55','America/Guayaquil'),(722,90,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-11 06:32:04','2021-06-05 04:16:55','America/Guayaquil'),(723,90,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-11 06:32:04','2021-06-05 04:16:55','America/Guayaquil'),(724,90,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-11 06:32:04','2021-06-05 04:16:55','America/Guayaquil'),(725,90,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-11 06:32:04','2021-06-05 04:16:55','America/Guayaquil'),(726,90,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-11 06:32:04','2021-06-05 04:16:55','America/Guayaquil'),(727,90,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-11 06:32:04','2021-06-05 04:16:55','America/Guayaquil'),(728,91,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-17 23:58:46','2021-06-05 04:16:55','America/Guayaquil'),(729,91,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-17 23:58:46','2021-06-05 04:16:55','America/Guayaquil'),(730,91,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-17 23:58:46','2021-06-05 04:16:55','America/Guayaquil'),(731,91,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-17 23:58:46','2021-06-05 04:16:55','America/Guayaquil'),(732,91,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-17 23:58:46','2021-06-05 04:16:55','America/Guayaquil'),(733,91,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-17 23:58:46','2021-06-05 04:16:55','America/Guayaquil'),(734,91,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-17 23:58:46','2021-06-05 04:16:55','America/Guayaquil'),(756,98,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:07','2021-06-05 04:16:55','America/Guayaquil'),(757,98,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:07','2021-06-05 04:16:55','America/Guayaquil'),(758,98,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:07','2021-06-05 04:16:55','America/Guayaquil'),(759,98,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:07','2021-06-05 04:16:55','America/Guayaquil'),(760,98,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:07','2021-06-05 04:16:55','America/Guayaquil'),(761,98,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:07','2021-06-05 04:16:55','America/Guayaquil'),(762,98,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:07','2021-06-05 04:16:55','America/Guayaquil'),(763,99,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:12','2021-06-05 04:16:55','America/Guayaquil'),(764,99,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:12','2021-06-05 04:16:55','America/Guayaquil'),(765,99,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:12','2021-06-05 04:16:55','America/Guayaquil'),(766,99,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:12','2021-06-05 04:16:55','America/Guayaquil'),(767,99,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:12','2021-06-05 04:16:55','America/Guayaquil'),(768,99,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:12','2021-06-05 04:16:55','America/Guayaquil'),(769,99,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:12','2021-06-05 04:16:55','America/Guayaquil'),(770,100,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:18','2021-06-05 04:16:55','America/Guayaquil'),(771,100,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:18','2021-06-05 04:16:55','America/Guayaquil'),(772,100,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:18','2021-06-05 04:16:55','America/Guayaquil'),(773,100,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:18','2021-06-05 04:16:55','America/Guayaquil'),(774,100,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:18','2021-06-05 04:16:55','America/Guayaquil'),(775,100,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:18','2021-06-05 04:16:55','America/Guayaquil'),(776,100,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:18','2021-06-05 04:16:55','America/Guayaquil'),(777,101,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:22','2021-06-05 04:16:55','America/Guayaquil'),(778,101,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:22','2021-06-05 04:16:55','America/Guayaquil'),(779,101,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:22','2021-06-05 04:16:55','America/Guayaquil'),(780,101,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:22','2021-06-05 04:16:55','America/Guayaquil'),(781,101,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:22','2021-06-05 04:16:55','America/Guayaquil'),(782,101,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:22','2021-06-05 04:16:55','America/Guayaquil'),(783,101,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-23 16:23:22','2021-06-05 04:16:55','America/Guayaquil'),(805,105,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:52','2021-06-05 04:16:55','America/Guayaquil'),(806,105,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:52','2021-06-05 04:16:55','America/Guayaquil'),(807,105,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:52','2021-06-05 04:16:55','America/Guayaquil'),(808,105,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:52','2021-06-05 04:16:55','America/Guayaquil'),(809,105,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:52','2021-06-05 04:16:55','America/Guayaquil'),(810,105,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:52','2021-06-05 04:16:55','America/Guayaquil'),(811,105,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:52','2021-06-05 04:16:55','America/Guayaquil'),(812,106,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:57','2021-06-05 04:16:55','America/Guayaquil'),(813,106,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:57','2021-06-05 04:16:55','America/Guayaquil'),(814,106,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:57','2021-06-05 04:16:55','America/Guayaquil'),(815,106,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:57','2021-06-05 04:16:55','America/Guayaquil'),(816,106,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:57','2021-06-05 04:16:55','America/Guayaquil'),(817,106,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:57','2021-06-05 04:16:55','America/Guayaquil'),(818,106,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-05-24 16:02:57','2021-06-05 04:16:55','America/Guayaquil'),(939,124,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-01 04:42:28','2021-06-05 04:16:55','America/Guayaquil'),(940,124,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-01 04:42:28','2021-06-05 04:16:55','America/Guayaquil'),(941,124,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-01 04:42:28','2021-06-05 04:16:55','America/Guayaquil'),(942,124,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-01 04:42:28','2021-06-05 04:16:55','America/Guayaquil'),(943,124,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-01 04:42:28','2021-06-05 04:16:55','America/Guayaquil'),(944,124,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-01 04:42:28','2021-06-05 04:16:55','America/Guayaquil'),(945,124,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-01 04:42:28','2021-06-05 04:16:55','America/Guayaquil'),(967,128,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-11 05:21:22','2021-06-05 04:16:55','America/Guayaquil'),(968,128,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-11 05:21:22','2021-06-05 04:16:55','America/Guayaquil'),(969,128,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-11 05:21:22','2021-06-05 04:16:55','America/Guayaquil'),(970,128,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-11 05:21:22','2021-06-05 04:16:55','America/Guayaquil'),(971,128,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-11 05:21:22','2021-06-05 04:16:55','America/Guayaquil'),(972,128,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-11 05:21:22','2021-06-05 04:16:55','America/Guayaquil'),(973,128,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-11 05:21:22','2021-06-05 04:16:55','America/Guayaquil'),(988,131,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-15 23:49:39','2021-06-05 04:16:55','America/Guayaquil'),(989,131,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-15 23:49:39','2021-06-05 04:16:55','America/Guayaquil'),(990,131,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-15 23:49:39','2021-06-05 04:16:55','America/Guayaquil'),(991,131,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-15 23:49:39','2021-06-05 04:16:55','America/Guayaquil'),(992,131,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-15 23:49:39','2021-06-05 04:16:55','America/Guayaquil'),(993,131,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-15 23:49:39','2021-06-05 04:16:55','America/Guayaquil'),(994,131,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-15 23:49:39','2021-06-05 04:16:55','America/Guayaquil'),(995,132,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-16 21:29:54','2021-06-05 04:16:55','America/Guayaquil'),(996,132,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-16 21:29:54','2021-06-05 04:16:55','America/Guayaquil'),(997,132,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-16 21:29:54','2021-06-05 04:16:55','America/Guayaquil'),(998,132,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-16 21:29:54','2021-06-05 04:16:55','America/Guayaquil'),(999,132,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-16 21:29:54','2021-06-05 04:16:55','America/Guayaquil'),(1000,132,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-16 21:29:54','2021-06-05 04:16:55','America/Guayaquil'),(1001,132,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-16 21:29:54','2021-06-05 04:16:55','America/Guayaquil'),(1009,134,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-17 14:59:29','2021-06-05 04:16:55','America/Guayaquil'),(1010,134,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-17 14:59:29','2021-06-05 04:16:55','America/Guayaquil'),(1011,134,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-17 14:59:29','2021-06-05 04:16:55','America/Guayaquil'),(1012,134,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-17 14:59:29','2021-06-05 04:16:55','America/Guayaquil'),(1013,134,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-17 14:59:29','2021-06-05 04:16:55','America/Guayaquil'),(1014,134,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-17 14:59:29','2021-06-05 04:16:55','America/Guayaquil'),(1015,134,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-17 14:59:29','2021-06-05 04:16:55','America/Guayaquil'),(1023,136,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-24 23:28:28','2021-06-05 04:16:55','America/Guayaquil'),(1024,136,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-24 23:28:28','2021-06-05 04:16:55','America/Guayaquil'),(1025,136,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-24 23:28:28','2021-06-05 04:16:55','America/Guayaquil'),(1026,136,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-24 23:28:28','2021-06-05 04:16:55','America/Guayaquil'),(1027,136,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-24 23:28:28','2021-06-05 04:16:55','America/Guayaquil'),(1028,136,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-24 23:28:28','2021-06-05 04:16:55','America/Guayaquil'),(1029,136,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-24 23:28:28','2021-06-05 04:16:55','America/Guayaquil'),(1030,137,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-27 02:42:54','2021-06-05 04:16:55','America/Guayaquil'),(1031,137,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-27 02:42:54','2021-06-05 04:16:55','America/Guayaquil'),(1032,137,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-27 02:42:54','2021-06-05 04:16:55','America/Guayaquil'),(1033,137,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-27 02:42:54','2021-06-05 04:16:55','America/Guayaquil'),(1034,137,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-27 02:42:54','2021-06-05 04:16:55','America/Guayaquil'),(1035,137,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-27 02:42:54','2021-06-05 04:16:55','America/Guayaquil'),(1036,137,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-06-27 02:42:54','2021-06-05 04:16:55','America/Guayaquil'),(1086,145,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-12 03:45:10','2021-06-05 04:16:55','America/Guayaquil'),(1087,145,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-12 03:45:10','2021-06-05 04:16:55','America/Guayaquil'),(1088,145,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-12 03:45:10','2021-06-05 04:16:55','America/Guayaquil'),(1089,145,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-12 03:45:10','2021-06-05 04:16:55','America/Guayaquil'),(1090,145,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-12 03:45:10','2021-06-05 04:16:55','America/Guayaquil'),(1091,145,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-12 03:45:10','2021-06-05 04:16:55','America/Guayaquil'),(1092,145,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-12 03:45:10','2021-06-05 04:16:55','America/Guayaquil'),(1100,147,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-19 03:27:08','2021-06-05 04:16:55','America/Guayaquil'),(1101,147,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-19 03:27:08','2021-06-05 04:16:55','America/Guayaquil'),(1102,147,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-19 03:27:08','2021-06-05 04:16:55','America/Guayaquil'),(1103,147,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-19 03:27:08','2021-06-05 04:16:55','America/Guayaquil'),(1104,147,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-19 03:27:08','2021-06-05 04:16:55','America/Guayaquil'),(1105,147,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-19 03:27:08','2021-06-05 04:16:55','America/Guayaquil'),(1106,147,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-19 03:27:08','2021-06-05 04:16:55','America/Guayaquil'),(1149,156,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-25 00:38:19','2021-06-05 04:16:55','America/Guayaquil'),(1150,156,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-25 00:38:19','2021-06-05 04:16:55','America/Guayaquil'),(1151,156,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-25 00:38:19','2021-06-05 04:16:55','America/Guayaquil'),(1152,156,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-25 00:38:19','2021-06-05 04:16:55','America/Guayaquil'),(1153,156,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-25 00:38:19','2021-06-05 04:16:55','America/Guayaquil'),(1154,156,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-25 00:38:19','2021-06-05 04:16:55','America/Guayaquil'),(1155,156,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-07-25 00:38:19','2021-06-05 04:16:55','America/Guayaquil'),(1178,159,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-03 03:01:37','2021-06-05 04:16:55','America/Guayaquil'),(1179,159,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-03 03:01:37','2021-06-05 04:16:55','America/Guayaquil'),(1180,159,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-03 03:01:37','2021-06-05 04:16:55','America/Guayaquil'),(1181,159,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-03 03:01:37','2021-06-05 04:16:55','America/Guayaquil'),(1182,159,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-03 03:01:37','2021-06-05 04:16:55','America/Guayaquil'),(1183,159,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-03 03:01:37','2021-06-05 04:16:55','America/Guayaquil'),(1184,159,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-03 03:01:37','2021-06-05 04:16:55','America/Guayaquil'),(1185,160,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-07 05:04:53','2021-06-05 04:16:55','America/Guayaquil'),(1186,160,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-07 05:04:53','2021-06-05 04:16:55','America/Guayaquil'),(1187,160,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-07 05:04:53','2021-06-05 04:16:55','America/Guayaquil'),(1188,160,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-07 05:04:53','2021-06-05 04:16:55','America/Guayaquil'),(1189,160,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-07 05:04:53','2021-06-05 04:16:55','America/Guayaquil'),(1190,160,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-07 05:04:53','2021-06-05 04:16:55','America/Guayaquil'),(1191,160,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-07 05:04:53','2021-06-05 04:16:55','America/Guayaquil'),(1234,167,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-24 01:48:39','2021-06-05 04:16:55','America/Guayaquil'),(1235,167,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-24 01:48:39','2021-06-05 04:16:55','America/Guayaquil'),(1236,167,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-24 01:48:39','2021-06-05 04:16:55','America/Guayaquil'),(1237,167,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-24 01:48:39','2021-06-05 04:16:55','America/Guayaquil'),(1238,167,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-24 01:48:39','2021-06-05 04:16:55','America/Guayaquil'),(1239,167,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-24 01:48:39','2021-06-05 04:16:55','America/Guayaquil'),(1240,167,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-08-24 01:48:39','2021-06-05 04:16:55','America/Guayaquil'),(1269,172,1,0,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-09-10 01:29:15','2021-06-05 04:16:55','America/Guayaquil'),(1270,172,1,1,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-09-10 01:29:15','2021-06-05 04:16:55','America/Guayaquil'),(1271,172,1,2,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-09-10 01:29:15','2021-06-04 13:05:08','America/Guayaquil'),(1272,172,1,3,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-09-10 01:29:15','2021-06-05 04:16:55','America/Guayaquil'),(1273,172,1,4,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-09-10 01:29:15','2021-06-05 04:16:55','America/Guayaquil'),(1274,172,1,5,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-09-10 01:29:15','2021-06-04 13:05:08','America/Guayaquil'),(1275,172,1,6,NULL,'00:00:00','23:59:59',1,100000,100000,'2020-09-10 01:29:15','2021-06-05 04:16:55','America/Guayaquil');
/*!40000 ALTER TABLE `sucursal_horario` ENABLE KEYS */;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta` (
  `id_tarjeta` int NOT NULL AUTO_INCREMENT,
  `costo` double(8,2) NOT NULL,
  `saldo` double(8,2) NOT NULL,
  `promocion` double(8,2) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_tarjeta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` VALUES (1,28.00,0.00,8.00,0),(2,10.00,5.00,6.00,1),(3,20.00,17.85,0.00,1),(4,30.00,26.78,0.00,1);
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;

--
-- Table structure for table `urbe`
--

DROP TABLE IF EXISTS `urbe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urbe` (
  `id_urbe` int NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(45) NOT NULL,
  `urbe` varchar(45) NOT NULL,
  `detalle` varchar(125) NOT NULL,
  `img` varchar(300) NOT NULL,
  `lt` double(10,6) NOT NULL,
  `lg` double(10,6) NOT NULL,
  `frontera` polygon DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_registro` int NOT NULL,
  `id_actualizo` int DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_urbe`),
  KEY `fk_urbe__clienteRegistro_idx` (`id_registro`),
  KEY `fk_urbe__clienteActualizo_idx` (`id_actualizo`),
  CONSTRAINT `fk_urbe__clienteActualizo` FOREIGN KEY (`id_actualizo`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_urbe__clienteRegistro` FOREIGN KEY (`id_registro`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urbe`
--

/*!40000 ALTER TABLE `urbe` DISABLE KEYS */;
INSERT INTO `urbe` VALUES (1,'Loja','Ecuador','LATAM','017456832465897236',1.000000,1.000000,NULL,1,100000,NULL,'2021-05-22 15:07:49','2021-06-18 15:02:09');
/*!40000 ALTER TABLE `urbe` ENABLE KEYS */;

--
-- Table structure for table `urbe_categoria`
--

DROP TABLE IF EXISTS `urbe_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urbe_categoria` (
  `id_urbe` int NOT NULL,
  `id_aplicativo` int NOT NULL DEFAULT '1000001',
  `id_categoria` int NOT NULL,
  `nombre` varchar(125) NOT NULL,
  `label` varchar(125) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `orden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_urbe`,`id_categoria`,`id_aplicativo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urbe_categoria`
--

/*!40000 ALTER TABLE `urbe_categoria` DISABLE KEYS */;
INSERT INTO `urbe_categoria` VALUES (1,1000001,0,'Todas','Todo',1,0),(1,1000001,101,'Pizza',' ',1,101),(1,1000001,102,'Papas',' ',1,102),(1,1000001,103,'Alitas',' ',1,103),(1,1000001,104,'FastFood',' ',1,104),(1,1000001,105,'Grill',' ',1,105),(1,1000001,106,'Mariscos',' ',1,106),(1,1000001,107,'Mexicana',' ',1,107),(1,1000001,108,'Tradicional',' ',1,108),(1,1000001,109,'Pasteleria',' ',1,109),(1,1000001,110,'Pollo',' ',1,110),(1,1000001,111,'Asiatica',' ',1,111),(1,1000001,112,'Sushi',' ',1,112),(1,1000001,113,'Super',' ',1,113),(1,1000001,114,'Licores',' ',1,114),(1,1000001,115,'Pañalera',' ',1,115),(1,1000001,116,'Farmacia','Farmacias',1,116);
/*!40000 ALTER TABLE `urbe_categoria` ENABLE KEYS */;

--
-- Dumping events for database 'delivery'
--

--
-- Dumping routines for database 'delivery'
--
/*!50003 DROP FUNCTION IF EXISTS `f_mayusculaMinuscula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_mayusculaMinuscula`(cadena varchar(65)) RETURNS varchar(65) CHARSET utf8mb4
BEGIN
    DECLARE len INT;
    DECLARE i INT;
    DECLARE input varchar(65);
    SET len   = CHAR_LENGTH(cadena);
    SET input = LOWER(cadena);
    SET i = 0;
    WHILE (i < len) DO
        IF (MID(input,i,1) = ' ' OR i = 0) THEN
            IF (i < len) THEN
                SET input = CONCAT(
                    LEFT(input,i),
                    UPPER(MID(input,i + 1,1)),
                    RIGHT(input,len - i - 1));
            END IF;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_redondear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_redondear`(num FLOAT) RETURNS float
BEGIN
   RETURN ROUND(CAST(num AS FLOAT)/CAST(5 AS FLOAT),2) * 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-11 14:09:41
