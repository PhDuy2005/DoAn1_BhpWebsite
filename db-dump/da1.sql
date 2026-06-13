-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: da1
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `da1`
--

USE `da1`;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances` (
  `attendance_uuid` binary(16) NOT NULL,
  `attd_time` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `lesson_uuid` binary(16) NOT NULL,
  `user_uuid` binary(16) NOT NULL,
  PRIMARY KEY (`attendance_uuid`),
  UNIQUE KEY `UKkpo77enqlxhrn1j5rhewfars6` (`user_uuid`,`lesson_uuid`),
  KEY `FKg2myc21fo84skdr3brtrrhv9i` (`lesson_uuid`),
  CONSTRAINT `FKdc8bg1d9ah399nqmire6vcdml` FOREIGN KEY (`user_uuid`) REFERENCES `students` (`user_uuid`),
  CONSTRAINT `FKg2myc21fo84skdr3brtrrhv9i` FOREIGN KEY (`lesson_uuid`) REFERENCES `lessons` (`lesson_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
INSERT INTO `attendances` VALUES (_binary 'À\İ\ì1s;™¸~ş	HJ','2026-06-07 14:00:00.000000','2026-06-13 12:03:49.937289','duy@example.com',NULL,NULL,_binary '¿{|´µ\Î”ÿg„\÷',_binary '˜P\'+}/Œ_\ÔF\ğ'),(_binary 'ÀŞ…¥{\r»\ï|9 º¾H','2026-06-07 14:00:00.000000','2026-06-13 12:04:29.222026','duy@example.com',NULL,NULL,_binary '¿{|´µ\Î”ÿg„\÷',_binary 'œa]‚x¦»€\ÄÿR'),(_binary 'Á½RrÔ¸\Ğ\ny“£','2026-06-07 17:30:00.000000','2026-06-13 13:05:53.490506','duy@example.com',NULL,NULL,_binary '¿{!r•‡n> bk\Ä',_binary 'Àüƒ£}ú¹\í¹cø0b'),(_binary 'Á½RrÔ¹nË£\ŞY\í','2026-06-07 17:30:00.000000','2026-06-13 13:05:53.490585','duy@example.com',NULL,NULL,_binary '¿{!r•‡n> bk\Ä',_binary 'œa]‚x¦»€\ÄÿR');
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_tags`
--

DROP TABLE IF EXISTS `cost_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cost_tags` (
  `cost_tag_id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `cost_tag_name` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cost_tag_id`),
  UNIQUE KEY `UKf87vsepncmbdavrq2pu5910n8` (`cost_tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_tags`
--

LOCK TABLES `cost_tags` WRITE;
/*!40000 ALTER TABLE `cost_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cost_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costs`
--

DROP TABLE IF EXISTS `costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costs` (
  `cost_uuid` binary(16) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `debt` decimal(15,2) NOT NULL,
  `cost_name` varchar(255) NOT NULL,
  `cost_paid_status` enum('APPROVED','REJECTED','SAVED') NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `confirmed_by_user_uuid` binary(16) DEFAULT NULL,
  `paid_by_user_uuid` binary(16) NOT NULL,
  `cost_tag_id` bigint DEFAULT NULL,
  PRIMARY KEY (`cost_uuid`),
  KEY `FK4yikgqgva3sjokllqaknqyd5o` (`confirmed_by_user_uuid`),
  KEY `FKobyxtcr8qfoku88uyktdxdk9u` (`paid_by_user_uuid`),
  KEY `FK6hy1kr3fn0t23fbf95k7kn9g1` (`cost_tag_id`),
  CONSTRAINT `FK4yikgqgva3sjokllqaknqyd5o` FOREIGN KEY (`confirmed_by_user_uuid`) REFERENCES `users` (`user_uuid`),
  CONSTRAINT `FK6hy1kr3fn0t23fbf95k7kn9g1` FOREIGN KEY (`cost_tag_id`) REFERENCES `cost_tags` (`cost_tag_id`),
  CONSTRAINT `FKobyxtcr8qfoku88uyktdxdk9u` FOREIGN KEY (`paid_by_user_uuid`) REFERENCES `users` (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costs`
--

LOCK TABLES `costs` WRITE;
/*!40000 ALTER TABLE `costs` DISABLE KEYS */;
INSERT INTO `costs` VALUES (_binary 'œ\Ù\æz\÷¿\ç{>§<pŠ',10000000.00,'2026-06-06 12:13:06.561235','duy@example.com',3000000.00,'Mua mÃ¡y tÃ­nh','APPROVED','2026-06-06 12:13:45.562472','duy@example.com',_binary 'ci}yw¿°}b\ñ\é?',_binary '—\å†n|“”\Ê\ÑÁ´K',NULL);
/*!40000 ALTER TABLE `costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_ra_template_items`
--

DROP TABLE IF EXISTS `employee_ra_template_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_ra_template_items` (
  `employee_ra_template_item_uuid` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `day_of_week` enum('FRIDAY','MONDAY','SATURDAY','SUNDAY','THURSDAY','TUESDAY','WEDNESDAY') NOT NULL,
  `sort_order` int NOT NULL,
  `start_time` time NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `employee_ra_template_uuid` binary(16) NOT NULL,
  `lesson_type_uuid` binary(16) NOT NULL,
  `user_uuid` binary(16) NOT NULL,
  PRIMARY KEY (`employee_ra_template_item_uuid`),
  UNIQUE KEY `UK72k471cj5uqt9kf2gs0xcgty1` (`employee_ra_template_uuid`,`lesson_type_uuid`,`day_of_week`,`start_time`,`user_uuid`),
  KEY `FK3s44w8n8bm055cea39ro20wc7` (`lesson_type_uuid`),
  KEY `FK1x7kpngs55uwr3in6k0h9vc58` (`user_uuid`),
  CONSTRAINT `FK1x7kpngs55uwr3in6k0h9vc58` FOREIGN KEY (`user_uuid`) REFERENCES `users` (`user_uuid`),
  CONSTRAINT `FK3s44w8n8bm055cea39ro20wc7` FOREIGN KEY (`lesson_type_uuid`) REFERENCES `lesson_types` (`lesson_type_uuid`),
  CONSTRAINT `FKqj0tiv4hcx5xo5x2sh92ona0k` FOREIGN KEY (`employee_ra_template_uuid`) REFERENCES `employee_ra_templates` (`employee_ra_template_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_ra_template_items`
--

LOCK TABLES `employee_ra_template_items` WRITE;
/*!40000 ALTER TABLE `employee_ra_template_items` DISABLE KEYS */;
INSERT INTO `employee_ra_template_items` VALUES (_binary '—\å‰={•²²hjDPyÁ','2026-06-05 13:07:43.038526','system','WEDNESDAY',1,'19:30:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary '—\å‰>vb†=@\ô¥ 9‡','2026-06-05 13:07:43.038526','system','WEDNESDAY',2,'19:30:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary '—\å‰?s›\æO¶j>i','2026-06-05 13:07:43.039517','system','WEDNESDAY',3,'19:30:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'ciœ\ØqT—[§\í^Sƒ'),(_binary '—\å‰@xÒ±\ÉIP\ô\Éik','2026-06-05 13:07:43.040521','system','THURSDAY',4,'17:45:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'ci’¿vN…\÷\Ş\ò\ğ\ÛU'),(_binary '—\å‰@xÒ±\Êm)\ò~\Ä','2026-06-05 13:07:43.040521','system','THURSDAY',5,'17:45:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary '—\å‰@xÒ±\Ëú‚¡-X','2026-06-05 13:07:43.040521','system','THURSDAY',6,'17:45:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary '—\å‰A~“™x¿­s¸','2026-06-05 13:07:43.041517','system','THURSDAY',7,'17:45:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary '—\å‰A~“™y¦h£','2026-06-05 13:07:43.041517','system','FRIDAY',8,'19:30:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary '—\å‰A~“™z ”Q\í','2026-06-05 13:07:43.041517','system','FRIDAY',9,'19:30:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ciœ\ØqT—[§\í^Sƒ'),(_binary '—\å‰A~“™{Ö¾2\İ\Õ}','2026-06-05 13:07:43.041517','system','FRIDAY',10,'19:30:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary '—\å‰A~“™|mCj.1¥','2026-06-05 13:07:43.041517','system','SATURDAY',11,'14:30:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci—t Ÿˆ4°˜*'),(_binary '—\å‰A~“™}ù\ïV-i]','2026-06-05 13:07:43.041517','system','SATURDAY',12,'14:30:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary '—\å‰A~“™~\'\Z\î?','2026-06-05 13:07:43.041517','system','SATURDAY',13,'14:30:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary '—\å‰C{Ö­Œ\öÂ».\Ã','2026-06-05 13:07:43.043036','system','SATURDAY',14,'14:30:00',NULL,NULL,_binary 'cW61}–\0M\öMb',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary '¼¸tŠrºœOg3ß´l','2026-06-12 16:44:25.610873','duy@example.com','WEDNESDAY',1,'18:00:00',NULL,NULL,_binary 'cW5\ãv§hJp\0\â',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'ci•\Şz}¡k)>™“{'),(_binary '¼¸t‹}n¿Ô•\ö[I','2026-06-12 16:44:25.611722','duy@example.com','WEDNESDAY',2,'18:00:00',NULL,NULL,_binary 'cW5\ãv§hJp\0\â',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'ci”-~\õƒ0V¨;,'),(_binary '¼¸tŒ|È¸K\ÍKQ¬','2026-06-12 16:44:25.612210','duy@example.com','WEDNESDAY',3,'18:00:00',NULL,NULL,_binary 'cW5\ãv§hJp\0\â',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary '¼¸tŒ|È¸LE\î¯\Ê1','2026-06-12 16:44:25.612682','duy@example.com','WEDNESDAY',4,'18:00:00',NULL,NULL,_binary 'cW5\ãv§hJp\0\â',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary '¼¸tz·\á E\Åt\ï','2026-06-12 16:44:25.613543','duy@example.com','SUNDAY',5,'14:00:00',NULL,NULL,_binary 'cW5\ãv§hJp\0\â',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary '¼¸tz·\âS\"”\ğD]','2026-06-12 16:44:25.613927','duy@example.com','SUNDAY',6,'17:30:00',NULL,NULL,_binary 'cW5\ãv§hJp\0\â',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'ci”-~\õƒ0V¨;,'),(_binary '¼¸tß¯H6\'T1\İ','2026-06-12 16:44:25.614331','duy@example.com','SUNDAY',7,'17:30:00',NULL,NULL,_binary 'cW5\ãv§hJp\0\â',_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'ci™uva¶Ä„ÿş¹û'),(_binary '¼¸tß¯I\àZ6\Ê\İx','2026-06-12 16:44:25.614578','duy@example.com','SATURDAY',8,'16:15:00',NULL,NULL,_binary 'cW5\ãv§hJp\0\â',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary '¼¸tÜ²„Œ3¡b«Š','2026-06-12 16:44:25.616177','duy@example.com','SATURDAY',9,'16:15:00',NULL,NULL,_binary 'cW5\ãv§hJp\0\â',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci”-~\õƒ0V¨;,'),(_binary '¼¸tÜ²…\ÖË†\ïA{','2026-06-12 16:44:25.616528','duy@example.com','SATURDAY',10,'16:15:00',NULL,NULL,_binary 'cW5\ãv§hJp\0\â',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci•\Şz}¡k)>™“{'),(_binary '¼¸tÜ²†\nš\n*+š','2026-06-12 16:44:25.617038','duy@example.com','SATURDAY',11,'16:15:00',NULL,NULL,_binary 'cW5\ãv§hJp\0\â',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary '¼¸t‘rú±qw¯­\Ø+ü','2026-06-12 16:44:25.617290','duy@example.com','SATURDAY',12,'18:00:00',NULL,NULL,_binary 'cW5\ãv§hJp\0\â',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci”-~\õƒ0V¨;,'),(_binary '¿~Ğ}\n¸Lz0ü%\ó®','2026-06-13 05:40:19.742743','duy@example.com','SUNDAY',0,'11:00:00',NULL,NULL,_binary 'cW6¨y^°¡ú\İ@\ÇEV',_binary '“\ÙEIú\ñ‚l\n\0\'\0\0',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary '¿~Ğ¢yl«\İkÌ¢T†?','2026-06-13 05:40:19.746361','duy@example.com','SUNDAY',1,'11:00:00',NULL,NULL,_binary 'cW6¨y^°¡ú\İ@\ÇEV',_binary '“\ÙEIú\ñ‚l\n\0\'\0\0',_binary 'ci–…w]……³S\'ki\Ã'),(_binary 'À\ÕŞ¾qĞ„\nH\Õ*%','2026-06-13 11:55:02.206782','duy@example.com','SUNDAY',1,'06:00:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ci–…w]……³S\'ki\Ã'),(_binary 'À\ÕŞ¿~ŸT\åx\Å\Ì\â•','2026-06-13 11:55:02.207655','duy@example.com','SUNDAY',2,'06:00:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ci—·t„kÕ¯¨„,û'),(_binary 'À\ÕŞ¿~ŸUh…6	','2026-06-13 11:55:02.207804','duy@example.com','SUNDAY',3,'06:00:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ci™uva¶Ä„ÿş¹û'),(_binary 'À\ÕŞ¿~ŸV\É•\r\å','2026-06-13 11:55:02.208006','duy@example.com','SUNDAY',4,'06:00:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary 'À\Õ\ŞÀyÏ¹1O5\êº\Ü\ñ','2026-06-13 11:55:02.208170','duy@example.com','MONDAY',5,'17:45:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ci•\Şz}¡k)>™“{'),(_binary 'À\Õ\ŞÀyÏ¹25\ZWq:\è','2026-06-13 11:55:02.208479','duy@example.com','MONDAY',6,'17:45:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary 'À\Õ\ŞÀyÏ¹3\'1gx„','2026-06-13 11:55:02.208648','duy@example.com','MONDAY',7,'17:45:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary 'À\Õ\ŞÀyÏ¹4\Ì\ïIbi','2026-06-13 11:55:02.208821','duy@example.com','MONDAY',8,'17:45:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ci“–}<–¯\É;`yos'),(_binary 'À\Õ\ŞÁ}j—\È3|\ô F','2026-06-13 11:55:02.209097','duy@example.com','TUESDAY',9,'17:45:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ci“–}<–¯\É;`yos'),(_binary 'À\Õ\ŞÁ}j—\Élı\Æ\ZŸ\ã','2026-06-13 11:55:02.209589','duy@example.com','TUESDAY',10,'17:45:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ci—t Ÿˆ4°˜*'),(_binary 'À\Õ\ŞÁ}j—\Ê\Ö\Z\ğƒ\Çk','2026-06-13 11:55:02.209874','duy@example.com','TUESDAY',11,'17:45:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary 'À\Õ\ŞÁ}j—\Ëi\Z\Ç','2026-06-13 11:55:02.210008','duy@example.com','TUESDAY',12,'17:45:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary 'À\Õ\Ş\Âz¶¯R‘:ÿyŸ\ç','2026-06-13 11:55:02.210662','duy@example.com','WEDNESDAY',13,'14:00:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ci—·t„kÕ¯¨„,û'),(_binary 'À\Õ\Ş\Ãv¨¯\ÜU”¨nQ','2026-06-13 11:55:02.211075','duy@example.com','WEDNESDAY',14,'14:00:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ci—t Ÿˆ4°˜*'),(_binary 'À\Õ\Ş\Ãv¨¯	{¡\Ø¤','2026-06-13 11:55:02.211416','duy@example.com','WEDNESDAY',15,'14:00:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'À\Õ\Ş\Ãv¨¯\n¶¢ \Ã\Ó','2026-06-13 11:55:02.211939','duy@example.com','THURSDAY',16,'15:30:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'À\Õ\Ş\Äu\èU\è_	\à','2026-06-13 11:55:02.212322','duy@example.com','THURSDAY',17,'15:30:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci’¿vN…\÷\Ş\ò\ğ\ÛU'),(_binary 'À\Õ\Ş\Äu\èVei\ÚvŒ','2026-06-13 11:55:02.212698','duy@example.com','THURSDAY',18,'15:30:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary 'À\Õ\Ş\Äu\èW;t¥X','2026-06-13 11:55:02.212809','duy@example.com','THURSDAY',19,'19:30:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary 'À\Õ\Ş\Äu\èX\ñs<\Õ}','2026-06-13 11:55:02.212985','duy@example.com','THURSDAY',20,'19:30:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci–…w]……³S\'ki\Ã'),(_binary 'À\Õ\Ş\Åw\n¤F”³\Ì.\Â','2026-06-13 11:55:02.213133','duy@example.com','THURSDAY',21,'19:30:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary 'À\Õ\Ş\Åw\n¤G¸•¼TC	','2026-06-13 11:55:02.213426','duy@example.com','THURSDAY',22,'19:30:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary 'À\Õ\Ş\Åw\n¤H†d½2\×<','2026-06-13 11:55:02.213717','duy@example.com','FRIDAY',23,'17:45:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci—·t„kÕ¯¨„,û'),(_binary 'À\Õ\Ş\ÆzÕ©\ğm\õÇ¨','2026-06-13 11:55:02.214463','duy@example.com','FRIDAY',24,'17:45:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary 'À\Õ\Ş\ÆzÕ©\ñ/‹øqû','2026-06-13 11:55:02.214660','duy@example.com','FRIDAY',25,'17:45:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary 'À\Õ\Ş\ÆzÕ©\ò7I…û','2026-06-13 11:55:02.214885','duy@example.com','FRIDAY',26,'17:45:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci•\Şz}¡k)>™“{'),(_binary 'À\Õ\Ş\ÆzÕ©\óX°q','2026-06-13 11:55:02.214989','duy@example.com','SATURDAY',27,'13:00:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary 'À\Õ\Ş\Ç¬Zc\ñ›','2026-06-13 11:55:02.215073','duy@example.com','SATURDAY',28,'13:00:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci—t Ÿˆ4°˜*'),(_binary 'À\Õ\Ş\Ç¬[1kV‡','2026-06-13 11:55:02.215335','duy@example.com','SATURDAY',29,'13:00:00',NULL,NULL,_binary 'cW5Fvùº™¤½^}\ÛA',_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary 'Áf|FŸ]e+R\è\ñ','2026-06-13 13:04:01.382280','duy@example.com','SUNDAY',1,'14:00:00',NULL,NULL,_binary '—å‰›~Š{Ÿ8q<\Ë',_binary '“\×\ÆIú\ñ‚l\n\0\'\0\0',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary 'Áf|FŸ^[\'n+=|','2026-06-13 13:04:01.385252','duy@example.com','SUNDAY',2,'14:00:00',NULL,NULL,_binary '—å‰›~Š{Ÿ8q<\Ë',_binary '“\×\ÆIú\ñ‚l\n\0\'\0\0',_binary 'ciœKr5½\ó\Æ\ØK]E');
/*!40000 ALTER TABLE `employee_ra_template_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_ra_templates`
--

DROP TABLE IF EXISTS `employee_ra_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_ra_templates` (
  `employee_ra_template_uuid` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `employee_ra_template_name` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `timetable_template_uuid` binary(16) NOT NULL,
  PRIMARY KEY (`employee_ra_template_uuid`),
  UNIQUE KEY `UKa2yk34fb5gn97k9bakj3u4m0a` (`timetable_template_uuid`),
  CONSTRAINT `FKm845uvaaodbpx6tuy0vf73w2` FOREIGN KEY (`timetable_template_uuid`) REFERENCES `timetable_templates` (`timetable_template_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_ra_templates`
--

LOCK TABLES `employee_ra_templates` WRITE;
/*!40000 ALTER TABLE `employee_ra_templates` DISABLE KEYS */;
INSERT INTO `employee_ra_templates` VALUES (_binary 'cW5Fvùº™¤½^}\ÛA','2026-05-26 08:12:00.199074','system','K12-2026-DEFAULT-EMPLOYEE-RA',NULL,NULL,_binary '“\Û#yIú\ñ‚l\n\0\'\0\0'),(_binary 'cW5\ãv§hJp\0\â','2026-05-26 08:12:00.355452','system','K10-2026-DEFAULT-EMPLOYEE-RA',NULL,NULL,_binary '“\Ş*Iú\ñ‚l\n\0\'\0\0'),(_binary 'cW61}–\0M\öMb','2026-05-26 08:12:00.433945','system','K11-2026-DEFAULT-EMPLOYEE-RA',NULL,NULL,_binary '“Ü¡‰Iú\ñ‚l\n\0\'\0\0'),(_binary 'cW6¨y^°¡ú\İ@\ÇEV','2026-05-26 08:12:00.552903','system','VDC-2026-DEFAULT-EMPLOYEE-RA',NULL,NULL,_binary '“ß…¡Iú\ñ‚l\n\0\'\0\0'),(_binary '—å‰›~Š{Ÿ8q<\Ë','2026-06-05 13:07:43.131451','system','DGNL-2026-DEFAULT-EMPLOYEE-RA',NULL,NULL,_binary '“\á\')Iú\ñ‚l\n\0\'\0\0');
/*!40000 ALTER TABLE `employee_ra_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `file_uuid` binary(16) NOT NULL,
  `chapter` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `file_link` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_overview` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `file_valid_from` date NOT NULL,
  `file_valid_to` date NOT NULL,
  `grade_id` bigint NOT NULL,
  PRIMARY KEY (`file_uuid`),
  KEY `FKgiwu6njj9eoo5dh2e85j44ov4` (`grade_id`),
  CONSTRAINT `FKgiwu6njj9eoo5dh2e85j44ov4` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `grade_id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `grade_name` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`grade_id`),
  UNIQUE KEY `UKoimhh5v4bseu9oqiv8gm4lwoa` (`grade_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,'2026-05-07 16:53:19.000000','system','K10',NULL,NULL),(2,'2026-05-07 16:53:19.000000','system','K11',NULL,NULL),(3,'2026-05-07 16:53:19.000000','system','K12',NULL,NULL),(4,'2026-05-07 16:53:19.000000','system','VDC',NULL,NULL),(5,'2026-05-07 16:53:19.000000','system','DGNL',NULL,NULL);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_employee_assignments`
--

DROP TABLE IF EXISTS `lesson_employee_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson_employee_assignments` (
  `lesson_employee_assignment_uuid` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `lesson_uuid` binary(16) NOT NULL,
  `user_uuid` binary(16) NOT NULL,
  PRIMARY KEY (`lesson_employee_assignment_uuid`),
  UNIQUE KEY `UKhvs8euqhsisingg227q0gi8v3` (`lesson_uuid`,`user_uuid`),
  KEY `FKoyqvhvnos2o4kwb9mn34s6n1r` (`user_uuid`),
  CONSTRAINT `FKleik9xcopjwxop1pm6jp91uy` FOREIGN KEY (`lesson_uuid`) REFERENCES `lessons` (`lesson_uuid`),
  CONSTRAINT `FKoyqvhvnos2o4kwb9mn34s6n1r` FOREIGN KEY (`user_uuid`) REFERENCES `users` (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_employee_assignments`
--

LOCK TABLES `lesson_employee_assignments` WRITE;
/*!40000 ALTER TABLE `lesson_employee_assignments` DISABLE KEYS */;
INSERT INTO `lesson_employee_assignments` VALUES (_binary '—øK`u£&\ñ‡š8±','2026-06-05 13:28:12.385139','duy@example.com',NULL,NULL,_binary '—øKD~wƒF\Éi\Ùba¼',_binary 'ci•\Şz}¡k)>™“{'),(_binary '—øKryª\nº\è·u­O','2026-06-05 13:28:12.402469','duy@example.com',NULL,NULL,_binary '—øKD~wƒF\Éi\Ùba¼',_binary 'ci”-~\õƒ0V¨;,'),(_binary '—øKw}í‚†‡X ²·¢','2026-06-05 13:28:12.407032','duy@example.com',NULL,NULL,_binary '—øKD~wƒF\Éi\Ùba¼',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary '—øKw}í‚‡\à9-)\÷','2026-06-05 13:28:12.407032','duy@example.com',NULL,NULL,_binary '—øKD~wƒF\Éi\Ùba¼',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary '—øK—zÒ‚¬Vl\Ì\êo','2026-06-05 13:28:12.439702','duy@example.com',NULL,NULL,_binary '—øK‡|Ü¤˜Ë“\í7\ØD',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary '—øK¨­¾=SùTj¢#','2026-06-05 13:28:12.456708','duy@example.com',NULL,NULL,_binary '—øK˜y‚º‚ˆ\ßw-zx',_binary 'ci”-~\õƒ0V¨;,'),(_binary '—øK¯y”¿B 3\Ì\Ùy','2026-06-05 13:28:12.463084','duy@example.com',NULL,NULL,_binary '—øK˜y‚º‚ˆ\ßw-zx',_binary 'ci™uva¶Ä„ÿş¹û'),(_binary '—øK\Êz\í¥?\å\Ã,¼\\','2026-06-05 13:28:12.490224','duy@example.com',NULL,NULL,_binary '—øK¹{““<_\àCš',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary '—øK\Êz\í¥@¶ıÀ\Z','2026-06-05 13:28:12.490224','duy@example.com',NULL,NULL,_binary '—øK¹{““<_\àCš',_binary 'ci”-~\õƒ0V¨;,'),(_binary '—øK\Ø|\ïˆ\Õw\ê_>','2026-06-05 13:28:12.504255','duy@example.com',NULL,NULL,_binary '—øK¹{““<_\àCš',_binary 'ci•\Şz}¡k)>™“{'),(_binary '—øK\Üz§·…\0Ç”N\Ü','2026-06-05 13:28:12.508853','duy@example.com',NULL,NULL,_binary '—øK¹{““<_\àCš',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary '—øK\ëQŠ\Ò6\Ê.“|	','2026-06-05 13:28:12.523556','duy@example.com',NULL,NULL,_binary '—øK\ãw:±x\èD^?{',_binary 'ci”-~\õƒ0V¨;,'),(_binary '—øL|8µ\Ò\ZÃ¢™','2026-06-05 13:28:12.562545','duy@example.com',NULL,NULL,_binary '—øKü}¶D\'´sTX¡',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary '—øLtî©¯4&F^\r','2026-06-05 13:28:12.573096','duy@example.com',NULL,NULL,_binary '—øKü}¶D\'´sTX¡',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary '—øL x¼¬{º¶n¾','2026-06-05 13:28:12.576726','duy@example.com',NULL,NULL,_binary '—øKü}¶D\'´sTX¡',_binary 'ciœ\ØqT—[§\í^Sƒ'),(_binary '—øL-|¸¥¤\ì	#‹','2026-06-05 13:28:12.589934','duy@example.com',NULL,NULL,_binary '—øL*~Î¤¹¼\æ‘T',_binary 'ci’¿vN…\÷\Ş\ò\ğ\ÛU'),(_binary '—øLAzÛb¢\nø','2026-06-05 13:28:12.609539','duy@example.com',NULL,NULL,_binary '—øL*~Î¤¹¼\æ‘T',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary '—øLFw|‡ü\ßV”&²','2026-06-05 13:28:12.614854','duy@example.com',NULL,NULL,_binary '—øL*~Î¤¹¼\æ‘T',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary '—øLQ}{·\õ	6\íºÿ¡','2026-06-05 13:28:12.625832','duy@example.com',NULL,NULL,_binary '—øL*~Î¤¹¼\æ‘T',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary '—øLor¹\àQ\ë6k¥¿','2026-06-05 13:28:12.655523','duy@example.com',NULL,NULL,_binary '—øL]y\n…ÔÌ©y\ßV',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary '—øLq|O°B\õ\Öÿ(‹¿','2026-06-05 13:28:12.657202','duy@example.com',NULL,NULL,_binary '—øL]y\n…ÔÌ©y\ßV',_binary 'ciœ\ØqT—[§\í^Sƒ'),(_binary '—øL€~½İ¬/¯\Èø¦','2026-06-05 13:28:12.672331','duy@example.com',NULL,NULL,_binary '—øL]y\n…ÔÌ©y\ßV',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary '—øL’xú»\ŞE™·¬\İ]','2026-06-05 13:28:12.690989','duy@example.com',NULL,NULL,_binary '—øL‡}bµ;\íw|”ˆ­',_binary 'ci—t Ÿˆ4°˜*'),(_binary '—øL¢v‚¶h|e2«?±','2026-06-05 13:28:12.706860','duy@example.com',NULL,NULL,_binary '—øL‡}bµ;\íw|”ˆ­',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary '—øL¢v‚¶ij\Ü\çV\×','2026-06-05 13:28:12.706860','duy@example.com',NULL,NULL,_binary '—øL‡}bµ;\íw|”ˆ­',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary '—øL²yl¯¼\n\Ì\Ë+','2026-06-05 13:28:12.722570','duy@example.com',NULL,NULL,_binary '—øL‡}bµ;\íw|”ˆ­',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary '—øL\Òm\ÎJ’Gµ™&','2026-06-05 13:28:12.754308','duy@example.com',NULL,NULL,_binary '—øL³w#›qNû(,ş„',_binary 'ci–…w]……³S\'ki\Ã'),(_binary '—øL\Õ®™û|³Eü','2026-06-05 13:28:12.757470','duy@example.com',NULL,NULL,_binary '—øL³w#›qNû(,ş„',_binary 'ci—·t„kÕ¯¨„,û'),(_binary '—øL\Õ®™ü\"\Ã(','2026-06-05 13:28:12.757470','duy@example.com',NULL,NULL,_binary '—øL³w#›qNû(,ş„',_binary 'ci™uva¶Ä„ÿş¹û'),(_binary '—øL\äs\÷‚$\Äù’H$\Ğ','2026-06-05 13:28:12.772851','duy@example.com',NULL,NULL,_binary '—øL³w#›qNû(,ş„',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary '—øL\öqÁ¨B?ƒ\Æú','2026-06-05 13:28:12.790308','duy@example.com',NULL,NULL,_binary '—øL\ëq‹½_Ş©\Ó\è\Û',_binary 'ci•\Şz}¡k)>™“{'),(_binary '—øMpş¹nıı\r{','2026-06-05 13:28:12.804349','duy@example.com',NULL,NULL,_binary '—øL\ëq‹½_Ş©\Ó\è\Û',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary '—øMrI³†­\å°\\v\×','2026-06-05 13:28:12.806114','duy@example.com',NULL,NULL,_binary '—øL\ëq‹½_Ş©\Ó\è\Û',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary '—øMrI³‡†ø\Ëıky','2026-06-05 13:28:12.806114','duy@example.com',NULL,NULL,_binary '—øL\ëq‹½_Ş©\Ó\è\Û',_binary 'ci“–}<–¯\É;`yos'),(_binary '—øM%yø¬A˜th0@','2026-06-05 13:28:12.837073','duy@example.com',NULL,NULL,_binary '—øM{š’Y–/\×(©c',_binary 'ci“–}<–¯\É;`yos'),(_binary '—øM\'r\n»/\ä±-\Öuy','2026-06-05 13:28:12.839638','duy@example.com',NULL,NULL,_binary '—øM{š’Y–/\×(©c',_binary 'ci—t Ÿˆ4°˜*'),(_binary '—øM1xÃ‡T‘~$„','2026-06-05 13:28:12.849207','duy@example.com',NULL,NULL,_binary '—øM{š’Y–/\×(©c',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary '—øM9xdµƒ2Kv=<!','2026-06-05 13:28:12.857180','duy@example.com',NULL,NULL,_binary '—øM{š’Y–/\×(©c',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary '—øMLr‚—´ux³','2026-06-05 13:28:12.876815','duy@example.com',NULL,NULL,_binary '—øM<{‡†xš\r`',_binary 'ci—·t„kÕ¯¨„,û'),(_binary '—øMZ}w›Qùx=»\Ş','2026-06-05 13:28:12.890543','duy@example.com',NULL,NULL,_binary '—øM<{‡†xš\r`',_binary 'ci—t Ÿˆ4°˜*'),(_binary '—øMZ}wœŒÇ†€½Á','2026-06-05 13:28:12.890543','duy@example.com',NULL,NULL,_binary '—øM<{‡†xš\r`',_binary 'ci”-~\õƒ0V¨;,'),(_binary '—øMx~†ª0‘\Ë','2026-06-05 13:28:12.920886','duy@example.com',NULL,NULL,_binary '—øMjzr™G\ë\ÈÏŸF',_binary 'ci”-~\õƒ0V¨;,'),(_binary '—øM{{±&\Ï\Ò|¶','2026-06-05 13:28:12.923056','duy@example.com',NULL,NULL,_binary '—øMjzr™G\ë\ÈÏŸF',_binary 'ci’¿vN…\÷\Ş\ò\ğ\ÛU'),(_binary '—øM{{±‘şVo\ÄO','2026-06-05 13:28:12.923056','duy@example.com',NULL,NULL,_binary '—øMjzr™G\ë\ÈÏŸF',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary '—øMœr…ª1hA`ºU','2026-06-05 13:28:12.956445','duy@example.com',NULL,NULL,_binary '—øMŒr\'ºK\ïp©\ì…',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary '—øM¢vI\'M\Ó\Ö?\r“','2026-06-05 13:28:12.962477','duy@example.com',NULL,NULL,_binary '—øMŒr\'ºK\ïp©\ì…',_binary 'ci–…w]……³S\'ki\Ã'),(_binary '—øM¢vI(\İÔ™Vÿ\â','2026-06-05 13:28:12.970444','duy@example.com',NULL,NULL,_binary '—øMŒr\'ºK\ïp©\ì…',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary '—øM°q$¨—tn­\ó‚\Ë','2026-06-05 13:28:12.976685','duy@example.com',NULL,NULL,_binary '—øMŒr\'ºK\ïp©\ì…',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary '—øM¾y~‹\êÒ¥\Ü\ä','2026-06-05 13:28:12.990206','duy@example.com',NULL,NULL,_binary '—øM°q$¨˜\Zšf²-<',_binary 'ci—·t„kÕ¯¨„,û'),(_binary '—øM¾y~‹\Ì\Ø#l','2026-06-05 13:28:12.990206','duy@example.com',NULL,NULL,_binary '—øM°q$¨˜\Zšf²-<',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary '—øM\Îyï†¥0[e\×FA','2026-06-05 13:28:13.006562','duy@example.com',NULL,NULL,_binary '—øM°q$¨˜\Zšf²-<',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary '—øM\Îyï†¦\rQ=¸\Ô\\','2026-06-05 13:28:13.006562','duy@example.com',NULL,NULL,_binary '—øM°q$¨˜\Zšf²-<',_binary 'ci•\Şz}¡k)>™“{'),(_binary '—øM\ìqM‹\ò\Ã]\ô6Á','2026-06-05 13:28:13.036965','duy@example.com',NULL,NULL,_binary '—øM\ŞyÖ¡Ÿ\é³C;',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary '—øM\ït‡9a\\\äbb(','2026-06-05 13:28:13.039769','duy@example.com',NULL,NULL,_binary '—øM\ŞyÖ¡Ÿ\é³C;',_binary 'ci—t Ÿˆ4°˜*'),(_binary '—øM\ït‡:¡À½<\Æ','2026-06-05 13:28:13.039769','duy@example.com',NULL,NULL,_binary '—øM\ŞyÖ¡Ÿ\é³C;',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary '—øNr’²]K\ì\n\İP','2026-06-05 13:28:13.076660','duy@example.com',NULL,NULL,_binary '—øNwÈŒ`X0Œ',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary '—øNvÃ—o\î\0\ßV\İ','2026-06-05 13:28:13.080418','duy@example.com',NULL,NULL,_binary '—øNwÈŒ`X0Œ',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary '—øN2w0¸˜\óP\Øø‚\Æ','2026-06-05 13:28:13.106825','duy@example.com',NULL,NULL,_binary '—øN\"v3¸\Õ24ÀS\Ş',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary '—øN2w0¸™\Å|\ê‘*A','2026-06-05 13:28:13.106825','duy@example.com',NULL,NULL,_binary '—øN\"v3¸\Õ24ÀS\Ş',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary '¿z\çx\ñª\ğ\÷l\Ì','2026-06-13 05:41:03.335372','duy@example.com',NULL,NULL,_binary '¿z\×sµ™“ …\ê3™',_binary 'ci•\Şz}¡k)>™“{'),(_binary '¿z\÷|	œ*€\ñ\Ã','2026-06-13 05:41:03.351493','duy@example.com',NULL,NULL,_binary '¿z\×sµ™“ …\ê3™',_binary 'ci”-~\õƒ0V¨;,'),(_binary '¿zşr¾´\á\ÂÖ‘ÿ¡','2026-06-13 05:41:03.358989','duy@example.com',NULL,NULL,_binary '¿z\×sµ™“ …\ê3™',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary '¿{s2¼»¯%\ôe²\ß','2026-06-13 05:41:03.366586','duy@example.com',NULL,NULL,_binary '¿z\×sµ™“ …\ê3™',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary '¿{z\'¦„R‡)Œ','2026-06-13 05:41:03.388206','duy@example.com',NULL,NULL,_binary '¿{|´µ\Î”ÿg„\÷',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary '¿{1vÓ›x5 \ó\n¿','2026-06-13 05:41:03.409255','duy@example.com',NULL,NULL,_binary '¿{!r•‡n> bk\Ä',_binary 'ci”-~\õƒ0V¨;,'),(_binary '¿{9uyk=\ğ\0\èl','2026-06-13 05:41:03.417012','duy@example.com',NULL,NULL,_binary '¿{!r•‡n> bk\Ä',_binary 'ci™uva¶Ä„ÿş¹û'),(_binary '¿{Ly.ƒ“T™JW ','2026-06-13 05:41:03.436332','duy@example.com',NULL,NULL,_binary '¿{=s ²Q¡dYuc',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary '¿{Rv¹´F½\ë¿D‰','2026-06-13 05:41:03.442834','duy@example.com',NULL,NULL,_binary '¿{=s ²Q¡dYuc',_binary 'ci”-~\õƒ0V¨;,'),(_binary '¿{Yu‚µE\É\Z\é\Ş`','2026-06-13 05:41:03.449571','duy@example.com',NULL,NULL,_binary '¿{=s ²Q¡dYuc',_binary 'ci•\Şz}¡k)>™“{'),(_binary '¿{`~<²\Íj.\Ì\öı','2026-06-13 05:41:03.456861','duy@example.com',NULL,NULL,_binary '¿{=s ²Q¡dYuc',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary '¿{qp1†w`Û·»\Ò','2026-06-13 05:41:03.473814','duy@example.com',NULL,NULL,_binary '¿{dw\àoËŸH«Š\Ë',_binary 'ci”-~\õƒ0V¨;,'),(_binary '¿{Šrò€†8\èø	\à','2026-06-13 05:41:03.498995','duy@example.com',NULL,NULL,_binary '¿{x}E¤a\é·€G',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary '¿{‘s­ƒCm0Á','2026-06-13 05:41:03.505923','duy@example.com',NULL,NULL,_binary '¿{x}E¤a\é·€G',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary '¿{™xp\Ö_ŒG7z','2026-06-13 05:41:03.513245','duy@example.com',NULL,NULL,_binary '¿{x}E¤a\é·€G',_binary 'ciœ\ØqT—[§\í^Sƒ'),(_binary '¿|9wY–IYf`pŒ','2026-06-13 05:41:03.673429','duy@example.com',NULL,NULL,_binary '¿{p\ñ±\ß\í\ÈI1{ƒ',_binary 'ci’¿vN…\÷\Ş\ò\ğ\ÛU'),(_binary '¿|@r‚ª1~\Ê?›{H','2026-06-13 05:41:03.680368','duy@example.com',NULL,NULL,_binary '¿{p\ñ±\ß\í\ÈI1{ƒ',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary '¿|H{Ü£\ó5t\È\ì','2026-06-13 05:41:03.688390','duy@example.com',NULL,NULL,_binary '¿{p\ñ±\ß\í\ÈI1{ƒ',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary '¿|PsÊµ\óIT¬sh+','2026-06-13 05:41:03.696512','duy@example.com',NULL,NULL,_binary '¿{p\ñ±\ß\í\ÈI1{ƒ',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary '¿|ht?µD@P?c\õ','2026-06-13 05:41:03.720546','duy@example.com',NULL,NULL,_binary '¿|V|\ì€\óHq\Å',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary '¿|nv®‚\è¢p\ì\èA','2026-06-13 05:41:03.726851','duy@example.com',NULL,NULL,_binary '¿|V|\ì€\óHq\Å',_binary 'ciœ\ØqT—[§\í^Sƒ'),(_binary '¿|uv˜\Ú$]9\Ã5†','2026-06-13 05:41:03.733441','duy@example.com',NULL,NULL,_binary '¿|V|\ì€\óHq\Å',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary '¿|ˆ|?„\òehP1J','2026-06-13 05:41:03.752281','duy@example.com',NULL,NULL,_binary '¿|zxrúQK›H\áû',_binary 'ci—t Ÿˆ4°˜*'),(_binary '¿|t{¥¢¥‰ÏŒG\n','2026-06-13 05:41:03.759897','duy@example.com',NULL,NULL,_binary '¿|zxrúQK›H\áû',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary '¿|–~€¢¹Y+å»€','2026-06-13 05:41:03.766489','duy@example.com',NULL,NULL,_binary '¿|zxrúQK›H\áû',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary '¿|}dµ©f®–¥','2026-06-13 05:41:03.773375','duy@example.com',NULL,NULL,_binary '¿|zxrúQK›H\áû',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary '¿|·qÂ§\ï\â >>X\á','2026-06-13 05:41:03.799126','duy@example.com',NULL,NULL,_binary '¿|¢tä©Œ\îz¼n>',_binary 'ci–…w]……³S\'ki\Ã'),(_binary '¿|Áuğ§“–oC¨œ\Ş','2026-06-13 05:41:03.809336','duy@example.com',NULL,NULL,_binary '¿|¢tä©Œ\îz¼n>',_binary 'ci—·t„kÕ¯¨„,û'),(_binary '¿|\É{T£\ÃÁ|b».ƒ','2026-06-13 05:41:03.817504','duy@example.com',NULL,NULL,_binary '¿|¢tä©Œ\îz¼n>',_binary 'ci™uva¶Ä„ÿş¹û'),(_binary '¿|\Ñx¸¥²œc\Ëb','2026-06-13 05:41:03.825746','duy@example.com',NULL,NULL,_binary '¿|¢tä©Œ\îz¼n>',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary '¿|\íx#‘¾0LS\ë','2026-06-13 05:41:03.853716','duy@example.com',NULL,NULL,_binary '¿|\Ù{¿$1o\Ús',_binary 'ci•\Şz}¡k)>™“{'),(_binary '¿|\÷~K‰‘˜/‘\Ë5û','2026-06-13 05:41:03.863068','duy@example.com',NULL,NULL,_binary '¿|\Ù{¿$1o\Ús',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary '¿|ÿxp‘aÇ¦Š\í?k','2026-06-13 05:41:03.871894','duy@example.com',NULL,NULL,_binary '¿|\Ù{¿$1o\Ús',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary '¿}zÙ¨…\ò\åûX³¹','2026-06-13 05:41:03.879763','duy@example.com',NULL,NULL,_binary '¿|\Ù{¿$1o\Ús',_binary 'ci“–}<–¯\É;`yos'),(_binary '¿}!y\ñ¹>û‰5\n\Şg','2026-06-13 05:41:03.905871','duy@example.com',NULL,NULL,_binary '¿}r¡rGb\Ù\Z.8',_binary 'ci“–}<–¯\É;`yos'),(_binary '¿},{İPº>(\÷','2026-06-13 05:41:03.916244','duy@example.com',NULL,NULL,_binary '¿}r¡rGb\Ù\Z.8',_binary 'ci—t Ÿˆ4°˜*'),(_binary '¿}4t)Œ\Ê\ÅşMc','2026-06-13 05:41:03.924761','duy@example.com',NULL,NULL,_binary '¿}r¡rGb\Ù\Z.8',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary '¿}=|Lƒ=4ü\èa','2026-06-13 05:41:03.933720','duy@example.com',NULL,NULL,_binary '¿}r¡rGb\Ù\Z.8',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary '¿}Svd ¼‘\Ñ\å\0M','2026-06-13 05:41:03.955719','duy@example.com',NULL,NULL,_binary '¿}DvBŸ\á+B\÷\ÚN—',_binary 'ci—·t„kÕ¯¨„,û'),(_binary '¿}[p+\Í\ñ¥\å\0\Ğz','2026-06-13 05:41:03.963150','duy@example.com',NULL,NULL,_binary '¿}DvBŸ\á+B\÷\ÚN—',_binary 'ci—t Ÿˆ4°˜*'),(_binary '¿}cÉ	j‘:…B','2026-06-13 05:41:03.971088','duy@example.com',NULL,NULL,_binary '¿}DvBŸ\á+B\÷\ÚN—',_binary 'ci”-~\õƒ0V¨;,'),(_binary '¿}w~»¼—o º\è\à','2026-06-13 05:41:03.991576','duy@example.com',NULL,NULL,_binary '¿}hv£™ı\ê…\Â\ë',_binary 'ci”-~\õƒ0V¨;,'),(_binary '¿}~v¾˜±@I\Öu\'\É','2026-06-13 05:41:03.998450','duy@example.com',NULL,NULL,_binary '¿}hv£™ı\ê…\Â\ë',_binary 'ci’¿vN…\÷\Ş\ò\ğ\ÛU'),(_binary '¿}†v3‹À·jÊ²XS','2026-06-13 05:41:04.006139','duy@example.com',NULL,NULL,_binary '¿}hv£™ı\ê…\Â\ë',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary '¿}šsH“\ñ²\ä”','2026-06-13 05:41:04.026149','duy@example.com',NULL,NULL,_binary '¿}‹rµˆ§¡i',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary '¿}¡|Ø¨2j«d\Ò\Ã','2026-06-13 05:41:04.033930','duy@example.com',NULL,NULL,_binary '¿}‹rµˆ§¡i',_binary 'ci–…w]……³S\'ki\Ã'),(_binary '¿}©~\õ’¬?>ìŒŠ','2026-06-13 05:41:04.041549','duy@example.com',NULL,NULL,_binary '¿}‹rµˆ§¡i',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary '¿}°t0\"\ÅB¡\Û','2026-06-13 05:41:04.048969','duy@example.com',NULL,NULL,_binary '¿}‹rµˆ§¡i',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary '¿}\Êv£›O[r~;£S','2026-06-13 05:41:04.074615','duy@example.com',NULL,NULL,_binary '¿}¶z¬¤5Õ›\İE\î',_binary 'ci—·t„kÕ¯¨„,û'),(_binary '¿}\Òx¡%š\ï]€S','2026-06-13 05:41:04.082305','duy@example.com',NULL,NULL,_binary '¿}¶z¬¤5Õ›\İE\î',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary '¿}\Úw¬R\0-dy','2026-06-13 05:41:04.090297','duy@example.com',NULL,NULL,_binary '¿}¶z¬¤5Õ›\İE\î',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary '¿}\á@”bk\ğFªa','2026-06-13 05:41:04.097991','duy@example.com',NULL,NULL,_binary '¿}¶z¬¤5Õ›\İE\î',_binary 'ci•\Şz}¡k)>™“{'),(_binary '¿}\õ~Ã‡Gs«²\õ','2026-06-13 05:41:04.117333','duy@example.com',NULL,NULL,_binary '¿}\çp\éœø‘´‘Ÿ',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary '¿}û½›‘e¨Z\Ş\ò','2026-06-13 05:41:04.123948','duy@example.com',NULL,NULL,_binary '¿}\çp\éœø‘´‘Ÿ',_binary 'ci—t Ÿˆ4°˜*'),(_binary '¿~r¡|‘\ôF\Ëm','2026-06-13 05:41:04.130804','duy@example.com',NULL,NULL,_binary '¿}\çp\éœø‘´‘Ÿ',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary '¿~Ôº¾$JPº','2026-06-13 05:41:04.153233','duy@example.com',NULL,NULL,_binary '¿~|Õ®\É/¹F\Ø',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary '¿~!z=‹+–\ö\'¢¡','2026-06-13 05:41:04.161283','duy@example.com',NULL,NULL,_binary '¿~|Õ®\É/¹F\Ø',_binary 'ci–…w]……³S\'ki\Ã'),(_binary '¿~>~ºµG¥¨zWn','2026-06-13 05:41:04.190117','duy@example.com',NULL,NULL,_binary '¿~&y2ƒ(r^\ÎKG…',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary '¿~HrŸ,Dg[Ç«j','2026-06-13 05:41:04.200186','duy@example.com',NULL,NULL,_binary '¿~&y2ƒ(r^\ÎKG…',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary 'À\Ö&kwy¨ĞˆC{','2026-06-13 11:55:20.555040','duy@example.com',NULL,NULL,_binary 'À\Ö&W}96ÿ\ìœ\Ù',_binary 'ci•\Şz}¡k)>™“{'),(_binary 'À\Ö&~ze°\â\0w\ì	ck','2026-06-13 11:55:20.574204','duy@example.com',NULL,NULL,_binary 'À\Ö&W}96ÿ\ìœ\Ù',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'À\Ö&†x^µŒhDTzM\Ó','2026-06-13 11:55:20.582833','duy@example.com',NULL,NULL,_binary 'À\Ö&W}96ÿ\ìœ\Ù',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary 'À\Ö&pJ‘.7\Çw²´X','2026-06-13 11:55:20.589625','duy@example.com',NULL,NULL,_binary 'À\Ö&W}96ÿ\ìœ\Ù',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary 'À\Ö&£{\ó1j‰7\ç\\,','2026-06-13 11:55:20.611567','duy@example.com',NULL,NULL,_binary 'À\Ö&“y\Z••&\ãp¯„…',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary 'À\Ö&¸s°™\Æ]\êV\Æ','2026-06-13 11:55:20.632054','duy@example.com',NULL,NULL,_binary 'À\Ö&¨s¦†$Šb˜7N',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'À\Ö&¾~±…	Q1\ä¯\n','2026-06-13 11:55:20.638727','duy@example.com',NULL,NULL,_binary 'À\Ö&¨s¦†$Šb˜7N',_binary 'ci™uva¶Ä„ÿş¹û'),(_binary 'À\Ö&\Òq¸¬yâ»¸\ôx','2026-06-13 11:55:20.658170','duy@example.com',NULL,NULL,_binary 'À\Ö&\Ätˆ\È\á\ä[n',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary 'À\Ö&\Ù~\rŠšIŒ\Ó¦','2026-06-13 11:55:20.665486','duy@example.com',NULL,NULL,_binary 'À\Ö&\Ätˆ\È\á\ä[n',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'À\Ö&\à{İ²>»\Æ\ä\ä\Ö','2026-06-13 11:55:20.672840','duy@example.com',NULL,NULL,_binary 'À\Ö&\Ätˆ\È\á\ä[n',_binary 'ci•\Şz}¡k)>™“{'),(_binary 'À\Ö&\èub¬²\ÊV>\Şr','2026-06-13 11:55:20.680461','duy@example.com',NULL,NULL,_binary 'À\Ö&\Ätˆ\È\á\ä[n',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary 'À\Ö&ût¨e\ĞWq€','2026-06-13 11:55:20.699631','duy@example.com',NULL,NULL,_binary 'À\Ö&\ìxş¿o1|Q)Ç¸',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'À\Ö\'v‡cT©»\Ç\Î','2026-06-13 11:55:20.725619','duy@example.com',NULL,NULL,_binary 'À\Ö&ÿxŠ\\\"\ÙC\Zª',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary 'À\Ö\'}_”\Ö.sû\è¼\ê','2026-06-13 11:55:20.732977','duy@example.com',NULL,NULL,_binary 'À\Ö&ÿxŠ\\\"\ÙC\Zª',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary 'À\Ö\'#qpµ\ÍJ™_>N','2026-06-13 11:55:20.739571','duy@example.com',NULL,NULL,_binary 'À\Ö&ÿxŠ\\\"\ÙC\Zª',_binary 'ciœ\ØqT—[§\í^Sƒ'),(_binary 'À\Ö\'?zw \ö˜\Ò\"\' \Å','2026-06-13 11:55:20.767140','duy@example.com',NULL,NULL,_binary 'À\Ö\'){\0ˆkASGA',_binary 'ci’¿vN…\÷\Ş\ò\ğ\ÛU'),(_binary 'À\Ö\'Gtå…\'6»W‹‰','2026-06-13 11:55:20.775267','duy@example.com',NULL,NULL,_binary 'À\Ö\'){\0ˆkASGA',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary 'À\Ö\'OrÒ²oo\éÁ®À','2026-06-13 11:55:20.783888','duy@example.com',NULL,NULL,_binary 'À\Ö\'){\0ˆkASGA',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary 'À\Ö\'Vu+­`0š:l§','2026-06-13 11:55:20.790644','duy@example.com',NULL,NULL,_binary 'À\Ö\'){\0ˆkASGA',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary 'À\Ö\'lrO§K\Ò\õb{©T','2026-06-13 11:55:20.812221','duy@example.com',NULL,NULL,_binary 'À\Ö\']q7ª\ë\÷¯3u',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary 'À\Ö\'srÏ’·rpo™­\Î','2026-06-13 11:55:20.819087','duy@example.com',NULL,NULL,_binary 'À\Ö\']q7ª\ë\÷¯3u',_binary 'ciœ\ØqT—[§\í^Sƒ'),(_binary 'À\Ö\'|pCªŸt\é†Áo¸','2026-06-13 11:55:20.828061','duy@example.com',NULL,NULL,_binary 'À\Ö\']q7ª\ë\÷¯3u',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary 'À\Ö\'‘~,13Â±dÿ','2026-06-13 11:55:20.849357','duy@example.com',NULL,NULL,_binary 'À\Ö\'€|ÆŒ[>\îü¶',_binary 'ci—t Ÿˆ4°˜*'),(_binary 'À\Ö\'˜x¡·O©Z\É\ß\Ï1','2026-06-13 11:55:20.856382','duy@example.com',NULL,NULL,_binary 'À\Ö\'€|ÆŒ[>\îü¶',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary 'À\Ö\' }‚ƒ–S\Z[Ÿ\à','2026-06-13 11:55:20.864863','duy@example.com',NULL,NULL,_binary 'À\Ö\'€|ÆŒ[>\îü¶',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary 'À\Ö\'¨s‹’\ìŒ\Ó\Èùe','2026-06-13 11:55:20.872210','duy@example.com',NULL,NULL,_binary 'À\Ö\'€|ÆŒ[>\îü¶',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary 'À\Ö\'\ÃV¤O1µp²]C','2026-06-13 11:55:20.899497','duy@example.com',NULL,NULL,_binary 'À\Ö\'­v 3g$<=',_binary 'ci–…w]……³S\'ki\Ã'),(_binary 'À\Ö\'\Êp\ï°$_R\Âf\Î','2026-06-13 11:55:20.906657','duy@example.com',NULL,NULL,_binary 'À\Ö\'­v 3g$<=',_binary 'ci—·t„kÕ¯¨„,û'),(_binary 'À\Ö\'\Ò{ë’†¨“\Ø*§','2026-06-13 11:55:20.914596','duy@example.com',NULL,NULL,_binary 'À\Ö\'­v 3g$<=',_binary 'ci™uva¶Ä„ÿş¹û'),(_binary 'À\Ö\'\Ùx\ë\Ñ\Í','2026-06-13 11:55:20.921787','duy@example.com',NULL,NULL,_binary 'À\Ö\'­v 3g$<=',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary 'À\Ö\'\ïh¶‹¼[E®\å','2026-06-13 11:55:20.943947','duy@example.com',NULL,NULL,_binary 'À\Ö\'\Şv°IÀ%¥\È',_binary 'ci•\Şz}¡k)>™“{'),(_binary 'À\Ö\'\÷q9‹f`•\÷\Ğ','2026-06-13 11:55:20.951428','duy@example.com',NULL,NULL,_binary 'À\Ö\'\Şv°IÀ%¥\È',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary 'À\Ö\'ÿt€¾\ßG\Û³','2026-06-13 11:55:20.959128','duy@example.com',NULL,NULL,_binary 'À\Ö\'\Şv°IÀ%¥\È',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary 'À\Ö(|`ş\ğ	P\î\àı','2026-06-13 11:55:20.967123','duy@example.com',NULL,NULL,_binary 'À\Ö\'\Şv°IÀ%¥\È',_binary 'ci“–}<–¯\É;`yos'),(_binary 'À\Ö(vE„<ú!0x\Â\í','2026-06-13 11:55:20.987744','duy@example.com',NULL,NULL,_binary 'À\Ö(v\ZŸıÙ\ëO™',_binary 'ci“–}<–¯\É;`yos'),(_binary 'À\Ö(${aŠp5¢\Îy','2026-06-13 11:55:20.996139','duy@example.com',NULL,NULL,_binary 'À\Ö(v\ZŸıÙ\ëO™',_binary 'ci—t Ÿˆ4°˜*'),(_binary 'À\Ö(+u\èj“\Û1','2026-06-13 11:55:21.003896','duy@example.com',NULL,NULL,_binary 'À\Ö(v\ZŸıÙ\ëO™',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary 'À\Ö(4v6¿³·R\ÔAµ','2026-06-13 11:55:21.012626','duy@example.com',NULL,NULL,_binary 'À\Ö(v\ZŸıÙ\ëO™',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary 'À\Ö(I|.¦ı¢•\òW¤\÷','2026-06-13 11:55:21.033454','duy@example.com',NULL,NULL,_binary 'À\Ö(9|ˆª¤˜ŸRF×',_binary 'ci—·t„kÕ¯¨„,û'),(_binary 'À\Ö(Pu\ôƒQ\ÃQTe\î','2026-06-13 11:55:21.040851','duy@example.com',NULL,NULL,_binary 'À\Ö(9|ˆª¤˜ŸRF×',_binary 'ci—t Ÿˆ4°˜*'),(_binary 'À\Ö(XwG¹—\åp/','2026-06-13 11:55:21.048990','duy@example.com',NULL,NULL,_binary 'À\Ö(9|ˆª¤˜ŸRF×',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'À\Ö(mxÒ‰§D2w\Ñ\Ã','2026-06-13 11:55:21.069383','duy@example.com',NULL,NULL,_binary 'À\Ö(]q;Š¸k¾\çO\ç%',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'À\Ö(u~É¢3=Ø’®\ç','2026-06-13 11:55:21.077485','duy@example.com',NULL,NULL,_binary 'À\Ö(]q;Š¸k¾\çO\ç%',_binary 'ci’¿vN…\÷\Ş\ò\ğ\ÛU'),(_binary 'À\Ö(}u\ğ¼‰\ìHf','2026-06-13 11:55:21.085249','duy@example.com',NULL,NULL,_binary 'À\Ö(]q;Š¸k¾\çO\ç%',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary 'À\Ö(‘sH†L˜­<ü‚','2026-06-13 11:55:21.105736','duy@example.com',NULL,NULL,_binary 'À\Ö(r|[^¢º©\Â',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary 'À\Ö(™pø¬Ë‰È¦G','2026-06-13 11:55:21.113384','duy@example.com',NULL,NULL,_binary 'À\Ö(r|[^¢º©\Â',_binary 'ci–…w]……³S\'ki\Ã'),(_binary 'À\Ö(¡r\ã±\õÓƒ\ä¢\Æ[','2026-06-13 11:55:21.121932','duy@example.com',NULL,NULL,_binary 'À\Ö(r|[^¢º©\Â',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary 'À\Ö(ª{·‹o\ç','2026-06-13 11:55:21.130149','duy@example.com',NULL,NULL,_binary 'À\Ö(r|[^¢º©\Â',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary 'À\Ö(À~E /\Ô8am”U','2026-06-13 11:55:21.152132','duy@example.com',NULL,NULL,_binary 'À\Ö(¯uÚ¸û­|Wq\ê\ò',_binary 'ci—·t„kÕ¯¨„,û'),(_binary 'À\Ö(\É|GV¥Ó‰\Ò','2026-06-13 11:55:21.161208','duy@example.com',NULL,NULL,_binary 'À\Ö(¯uÚ¸û­|Wq\ê\ò',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary 'À\Ö(\Ó}\"¸v\Ö<y','2026-06-13 11:55:21.171484','duy@example.com',NULL,NULL,_binary 'À\Ö(¯uÚ¸û­|Wq\ê\ò',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary 'À\Ö(\ŞyL­\õav	','2026-06-13 11:55:21.182454','duy@example.com',NULL,NULL,_binary 'À\Ö(¯uÚ¸û­|Wq\ê\ò',_binary 'ci•\Şz}¡k)>™“{'),(_binary 'À\Ö(ûr0…lùI…\óg\ã','2026-06-13 11:55:21.211172','duy@example.com',NULL,NULL,_binary 'À\Ö(\ãr ´m˜y²z',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary 'À\Ö)}¥6 \ÊÇ®','2026-06-13 11:55:21.220128','duy@example.com',NULL,NULL,_binary 'À\Ö(\ãr ´m˜y²z',_binary 'ci—t Ÿˆ4°˜*'),(_binary 'À\Ö)\rq–Ê	£$ËŠ','2026-06-13 11:55:21.229075','duy@example.com',NULL,NULL,_binary 'À\Ö(\ãr ´m˜y²z',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary 'À\Ö)(vÓ™X\Ì\Zk\ÏB\ê','2026-06-13 11:55:21.256378','duy@example.com',NULL,NULL,_binary 'À\Ö)}’… ©\÷0s3',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary 'À\Ö)1vq“ˆ\"?\Æq–','2026-06-13 11:55:21.265384','duy@example.com',NULL,NULL,_binary 'À\Ö)}’… ©\÷0s3',_binary 'ci–…w]……³S\'ki\Ã'),(_binary 'À\Ö)Mpû¡‘ük\â\Îk','2026-06-13 11:55:21.293229','duy@example.com',NULL,NULL,_binary 'À\Ö)6}y˜–{‹(\æ,;',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary 'À\Ö)V|¼ùø\Ó0\ZFˆ','2026-06-13 11:55:21.302867','duy@example.com',NULL,NULL,_binary 'À\Ö)6}y˜–{‹(\æ,;',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary 'Á][|ú·\÷{¥\"\\\0','2026-06-13 13:05:28.923313','duy@example.com',NULL,NULL,_binary 'Á]?}İ\Z\r\Ì×½\ß',_binary 'ci•\Şz}¡k)>™“{'),(_binary 'Á]vx®€B\ĞĞ•E\Èk','2026-06-13 13:05:28.950913','duy@example.com',NULL,NULL,_binary 'Á]?}İ\Z\r\Ì×½\ß',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'Á]€\n\íú¹\ñš','2026-06-13 13:05:28.960629','duy@example.com',NULL,NULL,_binary 'Á]?}İ\Z\r\Ì×½\ß',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary 'Á]p Ág\Ê\ğG5','2026-06-13 13:05:28.973179','duy@example.com',NULL,NULL,_binary 'Á]?}İ\Z\r\Ì×½\ß',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary 'Á]ªv\õ•¸\Ø]q','2026-06-13 13:05:29.002544','duy@example.com',NULL,NULL,_binary 'Á]•|‡:\ñŠ^J:',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary 'Á]\Äi£ß¾qMjf','2026-06-13 13:05:29.028534','duy@example.com',NULL,NULL,_binary 'Á]°u½¼p\ÙÎƒ¶¥',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'Á]\Ïp\ô±1\Z\Ğ\Ã\Ëh.','2026-06-13 13:05:29.039680','duy@example.com',NULL,NULL,_binary 'Á]°u½¼p\ÙÎƒ¶¥',_binary 'ci™uva¶Ä„ÿş¹û'),(_binary 'Á]\ï¹¯\ã48?','2026-06-13 13:05:29.071948','duy@example.com',NULL,NULL,_binary 'Á]\Õy©›ú‘P)¼',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary 'Á]û}=‚¼§\0\æ','2026-06-13 13:05:29.087190','duy@example.com',NULL,NULL,_binary 'Á]\Õy©›ú‘P)¼',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'Á^y“…Í†¼¦\×','2026-06-13 13:05:29.099614','duy@example.com',NULL,NULL,_binary 'Á]\Õy©›ú‘P)¼',_binary 'ci•\Şz}¡k)>™“{'),(_binary 'Á^wL¶\\#¤e','2026-06-13 13:05:29.111499','duy@example.com',NULL,NULL,_binary 'Á]\Õy©›ú‘P)¼',_binary 'ciœKr5½\ó\Æ\ØK]E'),(_binary 'Á^6pØ«\Ğ,›\á#\Õ/','2026-06-13 13:05:29.142242','duy@example.com',NULL,NULL,_binary 'Á^|„—UX‡t(K',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'Á^\\ra 4	;¿q','2026-06-13 13:05:29.180131','duy@example.com',NULL,NULL,_binary 'Á^>~§©MC\\-Z',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary 'Á^fx±–ˆ¯x|¥“','2026-06-13 13:05:29.190639','duy@example.com',NULL,NULL,_binary 'Á^>~§©MC\\-Z',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary 'Á^r\ä‰\÷7’ü°','2026-06-13 13:05:29.202974','duy@example.com',NULL,NULL,_binary 'Á^>~§©MC\\-Z',_binary 'ciœ\ØqT—[§\í^Sƒ'),(_binary 'Á^r•·\í\×\Ó^„\Z5','2026-06-13 13:05:29.231125','duy@example.com',NULL,NULL,_binary 'Á^yy\ó6£\Ü+!\\',_binary 'ci’¿vN…\÷\Ş\ò\ğ\ÛU'),(_binary 'Á^—s‚‰6\Ûm\Òv(','2026-06-13 13:05:29.239297','duy@example.com',NULL,NULL,_binary 'Á^yy\ó6£\Ü+!\\',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary 'Á^¡s§¿\Ö\Ôşı\ĞAK','2026-06-13 13:05:29.249949','duy@example.com',NULL,NULL,_binary 'Á^yy\ó6£\Ü+!\\',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary 'Á^­ur¦60E\ò','2026-06-13 13:05:29.261177','duy@example.com',NULL,NULL,_binary 'Á^yy\ó6£\Ü+!\\',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary 'Á^\Êu(½˜b\ì5W\Ø:','2026-06-13 13:05:29.290537','duy@example.com',NULL,NULL,_binary 'Á^´~É˜‹µf:7±',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary 'Á^\Ô~«G¢\İ	\ó¸','2026-06-13 13:05:29.300598','duy@example.com',NULL,NULL,_binary 'Á^´~É˜‹µf:7±',_binary 'ciœ\ØqT—[§\í^Sƒ'),(_binary 'Á^\Ş}>”–\ó8b\'ˆ','2026-06-13 13:05:29.310971','duy@example.com',NULL,NULL,_binary 'Á^´~É˜‹µf:7±',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary 'Á^ú|Ø¼‚¥,¡Q¬','2026-06-13 13:05:29.338882','duy@example.com',NULL,NULL,_binary 'Á^\æs2ˆ\åÉ¡\ğz—',_binary 'ci—t Ÿˆ4°˜*'),(_binary 'Á_ta¹¬l_C}¤','2026-06-13 13:05:29.350043','duy@example.com',NULL,NULL,_binary 'Á^\æs2ˆ\åÉ¡\ğz—',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary 'Á_{¹ª4*\Ì(	V','2026-06-13 13:05:29.358959','duy@example.com',NULL,NULL,_binary 'Á^\æs2ˆ\åÉ¡\ğz—',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary 'Á_v*“ü,º\Ô','2026-06-13 13:05:29.368804','duy@example.com',NULL,NULL,_binary 'Á^\æs2ˆ\åÉ¡\ğz—',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary 'Á_:t¿±gv¤IŸ','2026-06-13 13:05:29.403013','duy@example.com',NULL,NULL,_binary 'Á_}y­>\ğÓ”\ì-*',_binary 'ci–…w]……³S\'ki\Ã'),(_binary 'Á_Dz†‡\ó\nrHr^','2026-06-13 13:05:29.412796','duy@example.com',NULL,NULL,_binary 'Á_}y­>\ğÓ”\ì-*',_binary 'ci—·t„kÕ¯¨„,û'),(_binary 'Á_N}û˜{M\ôC¦U','2026-06-13 13:05:29.422656','duy@example.com',NULL,NULL,_binary 'Á_}y­>\ğÓ”\ì-*',_binary 'ci™uva¶Ä„ÿş¹û'),(_binary 'Á_Y}¸“z[S\ç“\Ü','2026-06-13 13:05:29.433249','duy@example.com',NULL,NULL,_binary 'Á_}y­>\ğÓ”\ì-*',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary 'Á_x[\ëŸ¤TÀ²','2026-06-13 13:05:29.464435','duy@example.com',NULL,NULL,_binary 'Á_`u8¬<8œ=`ş\÷',_binary 'ci•\Şz}¡k)>™“{'),(_binary 'Á_ƒ{°ù\öi¶¾','2026-06-13 13:05:29.475920','duy@example.com',NULL,NULL,_binary 'Á_`u8¬<8œ=`ş\÷',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary 'Á_{˜ƒDu¯\æ› ','2026-06-13 13:05:29.485487','duy@example.com',NULL,NULL,_binary 'Á_`u8¬<8œ=`ş\÷',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary 'Á_~¥’M{\\d¦','2026-06-13 13:05:29.502556','duy@example.com',NULL,NULL,_binary 'Á_`u8¬<8œ=`ş\÷',_binary 'ci“–}<–¯\É;`yos'),(_binary 'Á_»tÙ–Cà¯£}t\Ì','2026-06-13 13:05:29.531019','duy@example.com',NULL,NULL,_binary 'Á_¦x¸\Ã2O_H4',_binary 'ci“–}<–¯\É;`yos'),(_binary 'Á_\ÄzP·K§Uu','2026-06-13 13:05:29.540178','duy@example.com',NULL,NULL,_binary 'Á_¦x¸\Ã2O_H4',_binary 'ci—t Ÿˆ4°˜*'),(_binary 'Á_\Íq\ñ€n\rOŠ»:X','2026-06-13 13:05:29.549967','duy@example.com',NULL,NULL,_binary 'Á_¦x¸\Ã2O_H4',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary 'Á_\× ˜7\÷ZmÀ','2026-06-13 13:05:29.559908','duy@example.com',NULL,NULL,_binary 'Á_¦x¸\Ã2O_H4',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary 'Á_\ñqª¯¨¿_G\r\ê','2026-06-13 13:05:29.585572','duy@example.com',NULL,NULL,_binary 'Á_\Şuúœ€Šo™!n´',_binary 'ci—·t„kÕ¯¨„,û'),(_binary 'Á_ûys¤t\õœ\Ü\Z\ç','2026-06-13 13:05:29.596029','duy@example.com',NULL,NULL,_binary 'Á_\Şuúœ€Šo™!n´',_binary 'ci—t Ÿˆ4°˜*'),(_binary 'Á`v¬a.r³­N','2026-06-13 13:05:29.605352','duy@example.com',NULL,NULL,_binary 'Á_\Şuúœ€Šo™!n´',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'Á`!s—„{Å¼}6]','2026-06-13 13:05:29.633211','duy@example.com',NULL,NULL,_binary 'Á`;¾\×?¤\÷\05\0',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'Á`*½¹N\Ò³Ä«\Ç','2026-06-13 13:05:29.642895','duy@example.com',NULL,NULL,_binary 'Á`;¾\×?¤\÷\05\0',_binary 'ci’¿vN…\÷\Ş\ò\ğ\ÛU'),(_binary 'Á`4y+­\"5u3(b','2026-06-13 13:05:29.652548','duy@example.com',NULL,NULL,_binary 'Á`;¾\×?¤\÷\05\0',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary 'Á`Lq¬jt\å\'u\ò','2026-06-13 13:05:29.677010','duy@example.com',NULL,NULL,_binary 'Á`:q-:£ü\Ö\Å\Ç',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary 'Á`V¼\Û]%:\ğ','2026-06-13 13:05:29.686840','duy@example.com',NULL,NULL,_binary 'Á`:q-:£ü\Ö\Å\Ç',_binary 'ci–…w]……³S\'ki\Ã'),(_binary 'Á`_t©m©§|\'','2026-06-13 13:05:29.696013','duy@example.com',NULL,NULL,_binary 'Á`:q-:£ü\Ö\Å\Ç',_binary 'ci›1x\0“\Õ\ÎĞ½n\áq'),(_binary 'Á`j~¿Kø\Ât¦„','2026-06-13 13:05:29.706439','duy@example.com',NULL,NULL,_binary 'Á`:q-:£ü\Ö\Å\Ç',_binary 'ciš£v—‹ÿ”E\Íÿ˜z'),(_binary 'Á`„|«˜˜uk\å¹','2026-06-13 13:05:29.733011','duy@example.com',NULL,NULL,_binary 'Á`ppÇ±s\è\÷··o¼',_binary 'ci—·t„kÕ¯¨„,û'),(_binary 'Á`sI…\Å\ÚÉ¾1±O','2026-06-13 13:05:29.743230','duy@example.com',NULL,NULL,_binary 'Á`ppÇ±s\è\÷··o¼',_binary 'ci˜OsO˜8o\Ì\Ø¾'),(_binary 'Á`˜~ü„Ÿ£ë·«\Å','2026-06-13 13:05:29.752583','duy@example.com',NULL,NULL,_binary 'Á`ppÇ±s\è\÷··o¼',_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ'),(_binary 'Á`¢}ü¼…4o¤\Â\Z','2026-06-13 13:05:29.762886','duy@example.com',NULL,NULL,_binary 'Á`ppÇ±s\è\÷··o¼',_binary 'ci•\Şz}¡k)>™“{'),(_binary 'Á`½}N®ù\Ú\èú6-','2026-06-13 13:05:29.789222','duy@example.com',NULL,NULL,_binary 'Á`¨q–\Z¸‡\Ø\å\ö5',_binary 'cišx¿¹·°\õbŞ™¬'),(_binary 'Á`\Æse€ø¨2\\a','2026-06-13 13:05:29.798279','duy@example.com',NULL,NULL,_binary 'Á`¨q–\Z¸‡\Ø\å\ö5',_binary 'ci—t Ÿˆ4°˜*'),(_binary 'Á`\ĞpU¿½r\Ê\'\Úe¦','2026-06-13 13:05:29.808401','duy@example.com',NULL,NULL,_binary 'Á`¨q–\Z¸‡\Ø\å\ö5',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary 'Á`\ïsÒˆhfE7%','2026-06-13 13:05:29.839095','duy@example.com',NULL,NULL,_binary 'Á`\Öt·{d±F\ÕV',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary 'Á`ø}p¬\nf-M‡Ox','2026-06-13 13:05:29.848718','duy@example.com',NULL,NULL,_binary 'Á`\Öt·{d±F\ÕV',_binary 'ci–…w]……³S\'ki\Ã'),(_binary 'ÁasC§raŒcREG','2026-06-13 13:05:29.881326','duy@example.com',NULL,NULL,_binary 'Á`ÿ~J©Ÿ§\òNBW\Æ',_binary 'ci”¾~\íŠ.]\ÌY »y'),(_binary 'Áa$r\÷œna®7¼:','2026-06-13 13:05:29.892861','duy@example.com',NULL,NULL,_binary 'Á`ÿ~J©Ÿ§\òNBW\Æ',_binary 'ciœKr5½\ó\Æ\ØK]E');
/*!40000 ALTER TABLE `lesson_employee_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_types`
--

DROP TABLE IF EXISTS `lesson_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson_types` (
  `lesson_type_uuid` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `lesson_time` int NOT NULL,
  `lesson_type_name` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`lesson_type_uuid`),
  UNIQUE KEY `UKggx39v0ejcxvu6out3k60kkdg` (`lesson_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_types`
--

LOCK TABLES `lesson_types` WRITE;
/*!40000 ALTER TABLE `lesson_types` DISABLE KEYS */;
INSERT INTO `lesson_types` VALUES (_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0','2026-05-07 16:53:19.000000','system',90,'Äáº¡i sá»‘',NULL,NULL),(_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0','2026-05-07 16:53:19.000000','system',195,'Äáº¡i sá»‘ 12',NULL,NULL),(_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0','2026-05-07 16:53:19.000000','system',90,'HÃ¬nh há»c',NULL,NULL),(_binary '“\×\ÆIú\ñ‚l\n\0\'\0\0','2026-05-07 16:53:19.000000','system',240,'DGNL',NULL,NULL),(_binary '“\ÙEIú\ñ‚l\n\0\'\0\0','2026-05-07 16:53:19.000000','system',120,'VDC',NULL,NULL);
/*!40000 ALTER TABLE `lesson_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `lesson_uuid` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `lesson_date` date NOT NULL,
  `lesson_start_time` time NOT NULL,
  `real_lesson_length` int NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `grade_id` bigint NOT NULL,
  `lesson_type_uuid` binary(16) NOT NULL,
  `week_uuid` binary(16) NOT NULL,
  `manual_lesson_status` enum('COMPLETED','IN_PROGRESS','NOT_STARTED') DEFAULT NULL,
  PRIMARY KEY (`lesson_uuid`),
  UNIQUE KEY `UK41w0u4fw9rcdrb920cka9ocsj` (`week_uuid`,`lesson_type_uuid`,`lesson_date`,`lesson_start_time`,`grade_id`),
  KEY `FKor4k0t1p8n35nylfrm77it9ay` (`grade_id`),
  KEY `FKbip1mf51hu4icbjgu7udnlt71` (`lesson_type_uuid`),
  CONSTRAINT `FK74xvvt2gtoasy7k7hdo7g5gyf` FOREIGN KEY (`week_uuid`) REFERENCES `study_weeks` (`week_uuid`),
  CONSTRAINT `FKbip1mf51hu4icbjgu7udnlt71` FOREIGN KEY (`lesson_type_uuid`) REFERENCES `lesson_types` (`lesson_type_uuid`),
  CONSTRAINT `FKor4k0t1p8n35nylfrm77it9ay` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (_binary '—øKD~wƒF\Éi\Ùba¼','2026-06-05 13:28:12.356155','duy@example.com','2026-06-03','17:45:00',0,NULL,NULL,1,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øK‡|Ü¤˜Ë“\í7\ØD','2026-06-05 13:28:12.423814','duy@example.com','2026-05-31','14:00:00',0,NULL,NULL,1,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øK˜y‚º‚ˆ\ßw-zx','2026-06-05 13:28:12.440534','duy@example.com','2026-05-31','17:30:00',0,NULL,NULL,1,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øK¹{““<_\àCš','2026-06-05 13:28:12.473477','duy@example.com','2026-06-06','16:15:00',0,NULL,NULL,1,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øK\ãw:±x\èD^?{','2026-06-05 13:28:12.515087','duy@example.com','2026-06-06','18:00:00',0,NULL,NULL,1,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øKü}¶D\'´sTX¡','2026-06-05 13:28:12.540650','duy@example.com','2026-06-03','19:30:00',0,NULL,NULL,2,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øL*~Î¤¹¼\æ‘T','2026-06-05 13:28:12.586910','duy@example.com','2026-06-04','17:45:00',0,NULL,NULL,2,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øL]y\n…ÔÌ©y\ßV','2026-06-05 13:28:12.637810','duy@example.com','2026-06-05','19:30:00',0,NULL,NULL,2,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øL‡}bµ;\íw|”ˆ­','2026-06-05 13:28:12.679458','duy@example.com','2026-06-06','14:30:00',0,NULL,NULL,2,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øL³w#›qNû(,ş„','2026-06-05 13:28:12.723569','duy@example.com','2026-05-31','07:15:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øL\ëq‹½_Ş©\Ó\è\Û','2026-06-05 13:28:12.779648','duy@example.com','2026-06-01','17:45:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øM{š’Y–/\×(©c','2026-06-05 13:28:12.823272','duy@example.com','2026-06-02','17:45:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øM<{‡†xš\r`','2026-06-05 13:28:12.860512','duy@example.com','2026-06-03','14:00:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øMjzr™G\ë\ÈÏŸF','2026-06-05 13:28:12.906774','duy@example.com','2026-06-04','15:30:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øMŒr\'ºK\ïp©\ì…','2026-06-05 13:28:12.940273','duy@example.com','2026-06-04','19:30:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øM°q$¨˜\Zšf²-<','2026-06-05 13:28:12.976685','duy@example.com','2026-06-05','17:45:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øM\ŞyÖ¡Ÿ\é³C;','2026-06-05 13:28:13.022960','duy@example.com','2026-06-06','13:00:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øNwÈŒ`X0Œ','2026-06-05 13:28:13.059309','duy@example.com','2026-05-31','10:30:00',0,NULL,NULL,4,_binary '“\ÙEIú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '—øN\"v3¸\Õ24ÀS\Ş','2026-06-05 13:28:13.090145','duy@example.com','2026-05-31','13:00:00',0,NULL,NULL,5,_binary '“\×\ÆIú\ñ‚l\n\0\'\0\0',_binary '—øJÿz´\õ®ND)',NULL),(_binary '¿z\×sµ™“ …\ê3™','2026-06-13 05:41:03.319749','duy@example.com','2026-06-10','18:00:00',0,NULL,NULL,1,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿{|´µ\Î”ÿg„\÷','2026-06-13 05:41:03.371823','duy@example.com','2026-06-07','14:00:00',120,'2026-06-13 12:08:05.189230','duy@example.com',1,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿{!r•‡n> bk\Ä','2026-06-13 05:41:03.393431','duy@example.com','2026-06-07','17:30:00',90,'2026-06-13 13:07:46.200537','duy@example.com',1,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿{=s ²Q¡dYuc','2026-06-13 05:41:03.421568','duy@example.com','2026-06-13','16:15:00',0,NULL,NULL,1,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿{dw\àoËŸH«Š\Ë','2026-06-13 05:41:03.460679','duy@example.com','2026-06-13','18:00:00',0,NULL,NULL,1,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿{x}E¤a\é·€G','2026-06-13 05:41:03.480384','duy@example.com','2026-06-10','19:30:00',0,NULL,NULL,2,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿{p\ñ±\ß\í\ÈI1{ƒ','2026-06-13 05:41:03.517994','duy@example.com','2026-06-11','17:45:00',0,NULL,NULL,2,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿|V|\ì€\óHq\Å','2026-06-13 05:41:03.702107','duy@example.com','2026-06-12','19:30:00',0,NULL,NULL,2,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿|zxrúQK›H\áû','2026-06-13 05:41:03.738086','duy@example.com','2026-06-13','14:30:00',0,NULL,NULL,2,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿|¢tä©Œ\îz¼n>','2026-06-13 05:41:03.778644','duy@example.com','2026-06-07','07:15:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿|\Ù{¿$1o\Ús','2026-06-13 05:41:03.833270','duy@example.com','2026-06-08','17:45:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿}r¡rGb\Ù\Z.8','2026-06-13 05:41:03.886219','duy@example.com','2026-06-09','17:45:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿}DvBŸ\á+B\÷\ÚN—','2026-06-13 05:41:03.940184','duy@example.com','2026-06-10','14:00:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿}hv£™ı\ê…\Â\ë','2026-06-13 05:41:03.976279','duy@example.com','2026-06-11','15:30:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿}‹rµˆ§¡i','2026-06-13 05:41:04.011153','duy@example.com','2026-06-11','19:30:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿}¶z¬¤5Õ›\İE\î','2026-06-13 05:41:04.054075','duy@example.com','2026-06-12','17:45:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿}\çp\éœø‘´‘Ÿ','2026-06-13 05:41:04.103093','duy@example.com','2026-06-13','13:00:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿~|Õ®\É/¹F\Ø','2026-06-13 05:41:04.135431','duy@example.com','2026-06-07','11:00:00',30,'2026-06-13 05:41:54.747839','duy@example.com',4,_binary '“\ÙEIú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary '¿~&y2ƒ(r^\ÎKG…','2026-06-13 05:41:04.166949','duy@example.com','2026-06-07','13:45:00',0,NULL,NULL,5,_binary '“\×\ÆIú\ñ‚l\n\0\'\0\0',_binary '¿z¥r=§¯o\É\Ô†\Î',NULL),(_binary 'À\Ö&W}96ÿ\ìœ\Ù','2026-06-13 11:55:20.535320','duy@example.com','2026-06-17','18:00:00',0,NULL,NULL,1,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö&“y\Z••&\ãp¯„…','2026-06-13 11:55:20.595494','duy@example.com','2026-06-14','14:00:00',0,'2026-06-13 12:03:25.157924','duy@example.com',1,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö&¨s¦†$Šb˜7N','2026-06-13 11:55:20.616152','duy@example.com','2026-06-14','17:30:00',0,NULL,NULL,1,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö&\Ätˆ\È\á\ä[n','2026-06-13 11:55:20.644340','duy@example.com','2026-06-20','16:15:00',0,NULL,NULL,1,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö&\ìxş¿o1|Q)Ç¸','2026-06-13 11:55:20.684890','duy@example.com','2026-06-20','18:00:00',0,NULL,NULL,1,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö&ÿxŠ\\\"\ÙC\Zª','2026-06-13 11:55:20.703677','duy@example.com','2026-06-17','19:30:00',0,NULL,NULL,2,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö\'){\0ˆkASGA','2026-06-13 11:55:20.745379','duy@example.com','2026-06-18','17:45:00',0,NULL,NULL,2,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö\']q7ª\ë\÷¯3u','2026-06-13 11:55:20.797112','duy@example.com','2026-06-19','19:30:00',0,NULL,NULL,2,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö\'€|ÆŒ[>\îü¶','2026-06-13 11:55:20.832385','duy@example.com','2026-06-20','14:30:00',0,NULL,NULL,2,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö\'­v 3g$<=','2026-06-13 11:55:20.877276','duy@example.com','2026-06-14','06:00:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö\'\Şv°IÀ%¥\È','2026-06-13 11:55:20.926962','duy@example.com','2026-06-15','17:45:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö(v\ZŸıÙ\ëO™','2026-06-13 11:55:20.971611','duy@example.com','2026-06-16','17:45:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö(9|ˆª¤˜ŸRF×','2026-06-13 11:55:21.017432','duy@example.com','2026-06-17','14:00:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö(]q;Š¸k¾\çO\ç%','2026-06-13 11:55:21.053787','duy@example.com','2026-06-18','15:30:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö(r|[^¢º©\Â','2026-06-13 11:55:21.089737','duy@example.com','2026-06-18','19:30:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö(¯uÚ¸û­|Wq\ê\ò','2026-06-13 11:55:21.135156','duy@example.com','2026-06-19','17:45:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö(\ãr ´m˜y²z','2026-06-13 11:55:21.187885','duy@example.com','2026-06-20','13:00:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö)}’… ©\÷0s3','2026-06-13 11:55:21.234189','duy@example.com','2026-06-14','11:00:00',0,NULL,NULL,4,_binary '“\ÙEIú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'À\Ö)6}y˜–{‹(\æ,;','2026-06-13 11:55:21.270259','duy@example.com','2026-06-14','13:45:00',0,NULL,NULL,5,_binary '“\×\ÆIú\ñ‚l\n\0\'\0\0',_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ',NULL),(_binary 'Á]?}İ\Z\r\Ì×½\ß','2026-06-13 13:05:28.895093','duy@example.com','2026-06-24','18:00:00',0,NULL,NULL,1,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á]•|‡:\ñŠ^J:','2026-06-13 13:05:28.981257','duy@example.com','2026-06-21','14:00:00',0,NULL,NULL,1,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á]°u½¼p\ÙÎƒ¶¥','2026-06-13 13:05:29.008158','duy@example.com','2026-06-21','17:30:00',0,NULL,NULL,1,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á]\Õy©›ú‘P)¼','2026-06-13 13:05:29.045705','duy@example.com','2026-06-27','16:15:00',0,NULL,NULL,1,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á^|„—UX‡t(K','2026-06-13 13:05:29.118701','duy@example.com','2026-06-27','18:00:00',0,NULL,NULL,1,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á^>~§©MC\\-Z','2026-06-13 13:05:29.150954','duy@example.com','2026-06-24','19:30:00',0,NULL,NULL,2,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á^yy\ó6£\Ü+!\\','2026-06-13 13:05:29.209450','duy@example.com','2026-06-25','17:45:00',0,NULL,NULL,2,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á^´~É˜‹µf:7±','2026-06-13 13:05:29.268168','duy@example.com','2026-06-26','19:30:00',0,NULL,NULL,2,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á^\æs2ˆ\åÉ¡\ğz—','2026-06-13 13:05:29.318252','duy@example.com','2026-06-27','14:30:00',0,NULL,NULL,2,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á_}y­>\ğÓ”\ì-*','2026-06-13 13:05:29.375026','duy@example.com','2026-06-21','06:00:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á_`u8¬<8œ=`ş\÷','2026-06-13 13:05:29.440916','duy@example.com','2026-06-22','17:45:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á_¦x¸\Ã2O_H4','2026-06-13 13:05:29.510109','duy@example.com','2026-06-23','17:45:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á_\Şuúœ€Šo™!n´','2026-06-13 13:05:29.566578','duy@example.com','2026-06-24','14:00:00',0,NULL,NULL,3,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á`;¾\×?¤\÷\05\0','2026-06-13 13:05:29.612020','duy@example.com','2026-06-25','15:30:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á`:q-:£ü\Ö\Å\Ç','2026-06-13 13:05:29.658552','duy@example.com','2026-06-25','19:30:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á`ppÇ±s\è\÷··o¼','2026-06-13 13:05:29.712990','duy@example.com','2026-06-26','17:45:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á`¨q–\Z¸‡\Ø\å\ö5','2026-06-13 13:05:29.768551','duy@example.com','2026-06-27','13:00:00',0,NULL,NULL,3,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á`\Öt·{d±F\ÕV','2026-06-13 13:05:29.814585','duy@example.com','2026-06-21','11:00:00',0,NULL,NULL,4,_binary '“\ÙEIú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL),(_binary 'Á`ÿ~J©Ÿ§\òNBW\Æ','2026-06-13 13:05:29.855055','duy@example.com','2026-06-21','14:00:00',0,NULL,NULL,5,_binary '“\×\ÆIú\ñ‚l\n\0\'\0\0',_binary 'Á\\\é|}¥•yşxC#',NULL);
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_lectures`
--

DROP TABLE IF EXISTS `online_lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_lectures` (
  `lecture_uuid` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `lecture_link` varchar(255) NOT NULL,
  `lecture_name` varchar(255) NOT NULL,
  `lecture_overview` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `lecture_valid_from` date NOT NULL,
  `lecture_valid_to` date NOT NULL,
  `grade_id` bigint NOT NULL,
  `week_uuid` binary(16) NOT NULL,
  PRIMARY KEY (`lecture_uuid`),
  KEY `FKnedun18rop4s5l9pnwmcjdoht` (`grade_id`),
  KEY `FKdtiahi22mrxdgou05y2g9wg3` (`week_uuid`),
  CONSTRAINT `FKdtiahi22mrxdgou05y2g9wg3` FOREIGN KEY (`week_uuid`) REFERENCES `study_weeks` (`week_uuid`),
  CONSTRAINT `FKnedun18rop4s5l9pnwmcjdoht` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_lectures`
--

LOCK TABLES `online_lectures` WRITE;
/*!40000 ALTER TABLE `online_lectures` DISABLE KEYS */;
INSERT INTO `online_lectures` VALUES (_binary '\ì\Ü}ü£ÿ3\è~\Z','2026-06-06 17:13:26.277627','duy@example.com','bhp.com/daiso1','Äáº¡i sá»‘ 1','BÃ i Ä‘áº§u tiÃªn','2026-06-06 17:13:54.698368','duy@example.com','2026-06-07','2026-06-13',1,_binary '—øJÿz´\õ®ND)'),(_binary 'h2v±\r\Î1ü7Á','2026-06-06 17:40:15.026361','duy@example.com','youtube.com','Äáº¡i sá»‘ 1','BÃ i nháº­p mÃ´n','2026-06-06 17:40:45.411017','duy@example.com','2026-06-07','2026-06-13',2,_binary '—øJÿz´\õ®ND)');
/*!40000 ALTER TABLE `online_lectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalties`
--

DROP TABLE IF EXISTS `penalties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penalties` (
  `penalty_uuid` binary(16) NOT NULL,
  `penalty_content` text NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `lesson_uuid` binary(16) NOT NULL,
  `user_uuid` binary(16) NOT NULL,
  PRIMARY KEY (`penalty_uuid`),
  KEY `FK4xm8orkom38eeovxqh360smg4` (`lesson_uuid`),
  KEY `FKji5aelkwa7ux9e1j9ndu9uapt` (`user_uuid`),
  CONSTRAINT `FK4xm8orkom38eeovxqh360smg4` FOREIGN KEY (`lesson_uuid`) REFERENCES `lessons` (`lesson_uuid`),
  CONSTRAINT `FKji5aelkwa7ux9e1j9ndu9uapt` FOREIGN KEY (`user_uuid`) REFERENCES `users` (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalties`
--

LOCK TABLES `penalties` WRITE;
/*!40000 ALTER TABLE `penalties` DISABLE KEYS */;
/*!40000 ALTER TABLE `penalties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty_penalty_tag`
--

DROP TABLE IF EXISTS `penalty_penalty_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penalty_penalty_tag` (
  `penalty_uuid` binary(16) NOT NULL,
  `penalty_tag_id` bigint NOT NULL,
  PRIMARY KEY (`penalty_uuid`,`penalty_tag_id`),
  KEY `FKri28gem43p1v2dqquhj45j6ao` (`penalty_tag_id`),
  CONSTRAINT `FKa0lnl1yobg0t54agcqlm57t4r` FOREIGN KEY (`penalty_uuid`) REFERENCES `penalties` (`penalty_uuid`),
  CONSTRAINT `FKri28gem43p1v2dqquhj45j6ao` FOREIGN KEY (`penalty_tag_id`) REFERENCES `penalty_tags` (`penalty_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty_penalty_tag`
--

LOCK TABLES `penalty_penalty_tag` WRITE;
/*!40000 ALTER TABLE `penalty_penalty_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `penalty_penalty_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty_tags`
--

DROP TABLE IF EXISTS `penalty_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penalty_tags` (
  `penalty_tag_id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `penalty_tag_description` varchar(255) DEFAULT NULL,
  `penalty_tag_name` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`penalty_tag_id`),
  UNIQUE KEY `UKran6m48dp3ahr5fnkmyqjedba` (`penalty_tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty_tags`
--

LOCK TABLES `penalty_tags` WRITE;
/*!40000 ALTER TABLE `penalty_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `penalty_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `period_setting_lesson_type`
--

DROP TABLE IF EXISTS `period_setting_lesson_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `period_setting_lesson_type` (
  `pslt_uuid` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `lessons_per_week` int NOT NULL,
  `sort_order` int NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `lesson_type_uuid` binary(16) NOT NULL,
  `uuid_period_setting` binary(16) NOT NULL,
  PRIMARY KEY (`pslt_uuid`),
  KEY `FK2rm4bd4c4no3q9u4m0i1yiiwa` (`lesson_type_uuid`),
  KEY `FKofservk0rckttnnnpodrkax63` (`uuid_period_setting`),
  CONSTRAINT `FK2rm4bd4c4no3q9u4m0i1yiiwa` FOREIGN KEY (`lesson_type_uuid`) REFERENCES `lesson_types` (`lesson_type_uuid`),
  CONSTRAINT `FKofservk0rckttnnnpodrkax63` FOREIGN KEY (`uuid_period_setting`) REFERENCES `period_settings` (`uuid_period_setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `period_setting_lesson_type`
--

LOCK TABLES `period_setting_lesson_type` WRITE;
/*!40000 ALTER TABLE `period_setting_lesson_type` DISABLE KEYS */;
INSERT INTO `period_setting_lesson_type` VALUES (_binary 'S\ÓA\Zr·	>µ.´&','2026-05-23 07:53:34.234268','duy@example.com',3,1,NULL,NULL,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'S\ÓAtE’\Ø\ÙSo\é@˜'),(_binary 'S\ÓA\Zr·\n£œ\Ô\ò”\'','2026-05-23 07:53:34.234823','duy@example.com',2,2,NULL,NULL,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'S\ÓAtE’\Ø\ÙSo\é@˜'),(_binary 'S\Ö\é\Úz-§Èˆ\Ş','2026-05-23 07:57:34.042234','duy@example.com',2,1,NULL,NULL,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary 'S\Ö\é\×|\ò’e\Ş\Ï\Ë|—\è'),(_binary 'S\Ö\é\Úz.1\ÛÛ\è³','2026-05-23 07:57:34.042234','duy@example.com',2,2,NULL,NULL,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary 'S\Ö\é\×|\ò’e\Ş\Ï\Ë|—\è'),(_binary 'SÚ¤v-ª?ˆx\İ\Ú\÷','2026-05-23 08:01:38.334555','duy@example.com',1,1,NULL,NULL,_binary '“\×\ÆIú\ñ‚l\n\0\'\0\0',_binary 'SÚ¤v-ª>\nL\ç\ó/'),(_binary 'SŞ“r^µ§›¯•_…','2026-05-23 08:05:56.117438','duy@example.com',4,1,NULL,NULL,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary '5pq\ĞzG©ÿNrŸ7r'),(_binary 'SŞ“r^µ¨Gy\Ùh','2026-05-23 08:05:56.117985','duy@example.com',4,2,NULL,NULL,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '5pq\ĞzG©ÿNrŸ7r'),(_binary 'SŞ»]y=‚i\è„+\è\ê¿','2026-05-23 08:06:06.429562','duy@example.com',1,1,NULL,NULL,_binary '“\ÙEIú\ñ‚l\n\0\'\0\0',_binary 'S\Ø\ò„z‹‘3ÿzE¨a\Ì');
/*!40000 ALTER TABLE `period_setting_lesson_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `period_settings`
--

DROP TABLE IF EXISTS `period_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `period_settings` (
  `uuid_period_setting` binary(16) NOT NULL,
  `apply_from` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `period_setting_name` varchar(255) NOT NULL,
  `number_of_week` int NOT NULL,
  `school_year` int NOT NULL,
  `tuition` decimal(15,2) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `grade_id` bigint NOT NULL,
  PRIMARY KEY (`uuid_period_setting`),
  KEY `FK5amnr2x0cs120xinmhrj5aq4o` (`grade_id`),
  CONSTRAINT `FK5amnr2x0cs120xinmhrj5aq4o` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `period_settings`
--

LOCK TABLES `period_settings` WRITE;
/*!40000 ALTER TABLE `period_settings` DISABLE KEYS */;
INSERT INTO `period_settings` VALUES (_binary '5pq\ĞzG©ÿNrŸ7r','2026-05-17','2026-05-17 10:17:02.161496','duy@example.com','K12_2026_ver1',12,2026,3600000.00,'2026-05-23 07:57:45.755468','duy@example.com',3),(_binary 'S\ÓAtE’\Ø\ÙSo\é@˜','2026-05-17','2026-05-23 07:53:34.229913','duy@example.com','K10_2026_ver1',12,2026,3600000.00,NULL,NULL,1),(_binary 'S\Ö\é\×|\ò’e\Ş\Ï\Ë|—\è','2026-05-23','2026-05-23 07:57:34.042234','duy@example.com','K11_2026_ver1',12,2026,3600000.00,NULL,NULL,2),(_binary 'S\Ø\ò„z‹‘3ÿzE¨a\Ì','2026-05-23','2026-05-23 07:59:47.332927','duy@example.com','VDC_2026_ver1',12,2026,3600000.00,NULL,NULL,4),(_binary 'SÚ¤v-ª>\nL\ç\ó/','2026-05-23','2026-05-23 08:01:38.334555','duy@example.com','DGNL-2026-ver1',12,2026,3600000.00,NULL,NULL,5);
/*!40000 ALTER TABLE `period_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periods`
--

DROP TABLE IF EXISTS `periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periods` (
  `period_uuid` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `debt` decimal(15,2) NOT NULL,
  `enroll_date` date NOT NULL,
  `estimate_expire_date` date NOT NULL,
  `is_editted_from_setting` bit(1) NOT NULL,
  `note` text,
  `number_of_week` int NOT NULL,
  `period_start_week` int NOT NULL,
  `school_year` int NOT NULL,
  `tuition` decimal(15,2) NOT NULL,
  `tuition_status` enum('PAID','PARTIAL','UNPAID') NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `use_study_week_start_date` bit(1) NOT NULL,
  `week_left` int NOT NULL,
  `grade_id` bigint NOT NULL,
  `uuid_period_setting` binary(16) DEFAULT NULL,
  `user_uuid` binary(16) NOT NULL,
  `timetable_template_uuid` binary(16) DEFAULT NULL,
  PRIMARY KEY (`period_uuid`),
  KEY `FKidry2xks103r84cpy65p6ebo4` (`grade_id`),
  KEY `FKqp4xu7scrwmgw2ck5xfpxsk73` (`uuid_period_setting`),
  KEY `FKqgirkl409dhf1t1bql0d97skv` (`user_uuid`),
  KEY `FKkxjd7n3ryj4tavmeput62u2e3` (`timetable_template_uuid`),
  CONSTRAINT `FKidry2xks103r84cpy65p6ebo4` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`),
  CONSTRAINT `FKkxjd7n3ryj4tavmeput62u2e3` FOREIGN KEY (`timetable_template_uuid`) REFERENCES `timetable_templates` (`timetable_template_uuid`),
  CONSTRAINT `FKqgirkl409dhf1t1bql0d97skv` FOREIGN KEY (`user_uuid`) REFERENCES `students` (`user_uuid`),
  CONSTRAINT `FKqp4xu7scrwmgw2ck5xfpxsk73` FOREIGN KEY (`uuid_period_setting`) REFERENCES `period_settings` (`uuid_period_setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods`
--

LOCK TABLES `periods` WRITE;
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
INSERT INTO `periods` VALUES (_binary 'Sw¶¤€Á&P¦\ì','2026-05-23 04:24:05.303429','duy@example.com',0.00,'2026-05-23','2026-08-08',_binary '\0',NULL,12,1,2026,3600000.00,'PAID',NULL,NULL,_binary '',12,3,_binary '5pq\ĞzG©ÿNrŸ7r',_binary '%úI¢tš‹YV›a=¦©',NULL),(_binary 'Sß¢‹O¯€=k4\Û ','2026-05-23 08:07:05.611355','duy@example.com',0.00,'2026-05-23','2026-08-08',_binary '\0',NULL,12,1,2026,3600000.00,'PAID',NULL,NULL,_binary '',12,1,_binary 'S\ÓAtE’\Ø\ÙSo\é@˜',_binary '“¨y\íº\n_GûÚ§”',_binary '“\Ş*Iú\ñ‚l\n\0\'\0\0'),(_binary 'S\â_rˆ‡\ç†\ö6\ÔT','2026-05-23 08:09:44.287507','duy@example.com',3600000.00,'2026-05-23','2026-08-08',_binary '\0',NULL,12,1,2026,3600000.00,'UNPAID',NULL,NULL,_binary '',12,1,_binary 'S\ÓAtE’\Ø\ÙSo\é@˜',_binary '!·†\İwŞµbyeµf\öt',_binary '“\Ş*Iú\ñ‚l\n\0\'\0\0'),(_binary '_ —\Ú~Øªl\ë\à”Åºh','2026-05-25 14:53:40.699414','duy@example.com',0.00,'2026-05-25','2026-08-15',_binary '\0',NULL,12,2,2026,3600000.00,'PAID',NULL,NULL,_binary '',12,3,_binary '5pq\ĞzG©ÿNrŸ7r',_binary '_œ\÷^|Y‡«7$³…v\Ï',_binary '“\Û#yIú\ñ‚l\n\0\'\0\0'),(_binary '_ ®\àu‚&Ÿ¢+ûş','2026-05-25 14:53:46.592995','duy@example.com',3600000.00,'2026-05-25','2026-08-15',_binary '\0',NULL,12,2,2026,3600000.00,'UNPAID',NULL,NULL,_binary '',12,4,_binary 'S\Ø\ò„z‹‘3ÿzE¨a\Ì',_binary '_œ\÷^|Y‡«7$³…v\Ï',_binary '“ß…¡Iú\ñ‚l\n\0\'\0\0'),(_binary 'R\×vÎ±ª\äHƒ','2026-06-06 17:39:04.023764','duy@example.com',0.00,'2026-06-06','2026-08-22',_binary '\0',NULL,12,1,2026,3600000.00,'PAID','2026-06-06 17:39:21.635083','duy@example.com',_binary '',12,2,_binary 'S\Ö\é\×|\ò’e\Ş\Ï\Ë|—\è',_binary '\'>\\4tµ§ù\æiQ\'úo',_binary '“Ü¡‰Iú\ñ‚l\n\0\'\0\0'),(_binary '¡–V„}º†O\Ó	\Êÿ','2026-06-07 10:17:24.868867','duy@example.com',0.00,'2026-06-07','2026-08-29',_binary '\0',NULL,12,1,2026,3600000.00,'PAID',NULL,NULL,_binary '',12,1,_binary 'S\ÓAtE’\Ø\ÙSo\é@˜',_binary '˜P\'+}/Œ_\ÔF\ğ',_binary '“\Ş*Iú\ñ‚l\n\0\'\0\0'),(_binary 'À\Şg\÷uxœùSDÀ','2026-06-13 12:04:21.623926','duy@example.com',0.00,'2026-06-13','2026-08-29',_binary '\0',NULL,12,2,2026,3600000.00,'PAID',NULL,NULL,_binary '',12,1,_binary 'S\ÓAtE’\Ø\ÙSo\é@˜',_binary 'œa]‚x¦»€\ÄÿR',_binary '“\Ş*Iú\ñ‚l\n\0\'\0\0'),(_binary 'Á9ú{¹¼½€\î\İ!','2026-06-13 12:42:23.610286','duy@example.com',2000000.00,'2026-06-13','2026-08-29',_binary '\0',NULL,12,2,2026,3600000.00,'PARTIAL','2026-06-13 12:42:48.946606','duy@example.com',_binary '',9,1,_binary 'S\ÓAtE’\Ø\ÙSo\é@˜',_binary 'Àüƒ£}ú¹\í¹cø0b',_binary '“\Ş*Iú\ñ‚l\n\0\'\0\0');
/*!40000 ALTER TABLE `periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `api_path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK4dop3ui4oh3iohyx4yi970ojj` (`api_path`,`method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_attendances`
--

DROP TABLE IF EXISTS `record_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record_attendances` (
  `ra_attd_uuid` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `ra_lesson_time` int NOT NULL,
  `ra_overtime` int NOT NULL,
  `ra_attd_time` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `lesson_uuid` binary(16) NOT NULL,
  `user_uuid` binary(16) NOT NULL,
  PRIMARY KEY (`ra_attd_uuid`),
  UNIQUE KEY `UKsuenchii3p9aqru20tbrbxic2` (`user_uuid`,`lesson_uuid`),
  KEY `FKnwwo3bnf3mpepekc49gk7c6py` (`lesson_uuid`),
  CONSTRAINT `FKjs8eaypo8w9a3p0xpaocjfrrp` FOREIGN KEY (`user_uuid`) REFERENCES `users` (`user_uuid`),
  CONSTRAINT `FKnwwo3bnf3mpepekc49gk7c6py` FOREIGN KEY (`lesson_uuid`) REFERENCES `lessons` (`lesson_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_attendances`
--

LOCK TABLES `record_attendances` WRITE;
/*!40000 ALTER TABLE `record_attendances` DISABLE KEYS */;
INSERT INTO `record_attendances` VALUES (_binary '—ü2(~\ó‚\Ó\Æ^hZÓ¡','2026-06-05 13:32:28.072640','duy@example.com',90,0,'2026-05-31 07:20:00.000000',NULL,NULL,_binary '—øL³w#›qNû(,ş„',_binary 'ci™uva¶Ä„ÿş¹û'),(_binary 'À\ãhtÇ¾†\ä@>¥B]','2026-06-13 12:09:49.317875','duy@example.com',120,0,'2026-06-07 19:09:00.000000',NULL,NULL,_binary 'À\Ö&“y\Z••&\ãp¯„…',_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ'),(_binary 'Ák¡qŠ­Nu<nŒı','2026-06-13 13:06:38.113536','duy@example.com',90,0,'2026-06-13 13:06:38.113024','2026-06-13 13:09:12.527269','duy@example.com',_binary '¿{!r•‡n> bk\Ä',_binary 'ci”-~\õƒ0V¨;,'),(_binary 'Ák£“ƒnÛ“4…^¨','2026-06-13 13:06:38.115533','duy@example.com',90,0,'2026-06-13 13:06:00.000000','2026-06-13 13:10:32.081468','duy@example.com',_binary '¿{!r•‡n> bk\Ä',_binary 'ci™uva¶Ä„ÿş¹û'),(_binary 'Áº¼|Î²ê«­E|','2026-06-13 13:11:20.508881','duy@example.com',0,0,'2026-06-13 13:11:20.508693',NULL,NULL,_binary '¿|¢tä©Œ\îz¼n>',_binary 'ci–…w]……³S\'ki\Ã'),(_binary 'Á(jqºN\ó— \"\î@','2026-06-13 13:12:54.122599','duy@example.com',0,0,'2026-06-13 13:12:54.122222',NULL,NULL,_binary '¿}hv£™ı\ê…\Â\ë',_binary 'ci’¿vN…\÷\Ş\ò\ğ\ÛU'),(_binary 'Á …-uT–\rº3\Ì~\Ä','2026-06-13 13:16:34.477201','duy@example.com',90,0,'2026-06-13 13:16:34.475715',NULL,NULL,_binary '¿}‹rµˆ§¡i',_binary 'ci–…w]……³S\'ki\Ã'),(_binary 'Á%Gu_¸`3\ÑQZ°','2026-06-13 13:21:33.767480','duy@example.com',0,0,'2026-06-13 13:21:33.766842',NULL,NULL,_binary '¿}\çp\éœø‘´‘Ÿ',_binary 'ci—t Ÿˆ4°˜*'),(_binary 'Á%Kwø–\ÇÿK\×\ì@','2026-06-13 13:21:33.771520','duy@example.com',0,0,'2026-06-13 13:21:33.771259',NULL,NULL,_binary '¿}\çp\éœø‘´‘Ÿ',_binary 'ci›¿}ì¸‹j”1`i/'),(_binary 'Á%t~ª|\ê\é\Ä\ñ\Ñ','2026-06-13 13:21:33.812551','duy@example.com',0,0,'2026-06-13 13:21:33.812323',NULL,NULL,_binary '¿}\çp\éœø‘´‘Ÿ',_binary 'cišx¿¹·°\õbŞ™¬');
/*!40000 ALTER TABLE `record_attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `role_id` bigint NOT NULL,
  `permission_id` bigint NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `FK2xn8qv4vw30i04xdxrpvn3bdi` (`permission_id`),
  CONSTRAINT `FK2xn8qv4vw30i04xdxrpvn3bdi` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `FKtfgq8q9blrp0pt1pvggyli3v9` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,_binary '','2026-05-07 16:53:19.000000','system','Student role','STUDENT',NULL,NULL),(2,_binary '','2026-05-07 16:53:19.000000','system','Teacher role','TEACHER',NULL,NULL),(3,_binary '','2026-05-07 16:53:19.000000','system','Manager role','MANAGER',NULL,NULL),(4,_binary '','2026-05-07 16:53:19.000000','system','Teaching assistant role','TA',NULL,NULL),(5,_binary '','2026-05-07 16:53:19.000000','system','Collaborating teacher role','COLAB_TEACHER',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_grade`
--

DROP TABLE IF EXISTS `student_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_grade` (
  `user_uuid` binary(16) NOT NULL,
  `grade_id` bigint NOT NULL,
  PRIMARY KEY (`user_uuid`,`grade_id`),
  KEY `FKmc5i6fv3c5qlpg1ib0qbbqn4j` (`grade_id`),
  CONSTRAINT `FKjsdthla0l2cab6vklbj7ypgjd` FOREIGN KEY (`user_uuid`) REFERENCES `students` (`user_uuid`),
  CONSTRAINT `FKmc5i6fv3c5qlpg1ib0qbbqn4j` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_grade`
--

LOCK TABLES `student_grade` WRITE;
/*!40000 ALTER TABLE `student_grade` DISABLE KEYS */;
INSERT INTO `student_grade` VALUES (_binary '“¨y\íº\n_GûÚ§”',1),(_binary '!·†\İwŞµbyeµf\öt',1),(_binary '˜P\'+}/Œ_\ÔF\ğ',1),(_binary 'œT‹şyšm\Ùkş/',1),(_binary 'œa]‚x¦»€\ÄÿR',1),(_binary 'œb|>|„¿¿\ía\'P ',1),(_binary 'Àüƒ£}ú¹\í¹cø0b',1),(_binary '\'>\\4tµ§ù\æiQ\'úo',2),(_binary 'œmµV}^‹\ğÕƒs&º',2),(_binary 'œo—#}c«³dvv­gF',2),(_binary '%úI¢tš‹YV›a=¦©',3),(_binary '_œ\÷^|Y‡«7$³…v\Ï',3),(_binary '_\Ñ\0}}K¬{Ô®\ã\æX',3),(_binary '¡^\Ë\æy\0¿\Ú-¸Ô¬k\Ò',3),(_binary '¡_À\Å{N¸\íÇ“\à\ÑLO',3),(_binary '5W‚h{s®ø”…§yY',4),(_binary '_œ\÷^|Y‡«7$³…v\Ï',4),(_binary '_\Ñ\0}}K¬{Ô®\ã\æX',4),(_binary '_\Ñ\0}}K¬{Ô®\ã\æX',5);
/*!40000 ALTER TABLE `student_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `user_uuid` binary(16) NOT NULL,
  `student_class` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `debt` decimal(15,2) DEFAULT NULL,
  `parent_name` varchar(255) DEFAULT NULL,
  `parent_number` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `school_year` int NOT NULL,
  `student_first_enroll_date` date DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `student_status` enum('ACTIVE','INACTIVE','WAITING') NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_uuid`),
  UNIQUE KEY `UKcwsoyy0jqb7iju6gfjnb3wy5f` (`student_id`,`school_year`),
  CONSTRAINT `FKqiuda7oc578kcamvutcf7as68` FOREIGN KEY (`user_uuid`) REFERENCES `users` (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (_binary '“¨y\íº\n_GûÚ§”','10A1','2026-05-13 04:34:41.315188','anonymousUser',0.00,'P1 Smoke Parent','0987654321','P1 Smoke School',2026,'2026-05-23','1001','ACTIVE','2026-05-23 08:06:25.586700','duy@example.com'),(_binary '!·†\İwŞµbyeµf\öt','10A1','2026-05-13 14:22:16.387294','tuantd.cntt@gmail.com',3600000.00,'Nga Duong','0976746167','Hoang Le Kha',2026,'2026-05-21','10002','ACTIVE','2026-06-06 10:06:25.432489','duy@example.com'),(_binary '%úI¢tš‹YV›a=¦©','12A1','2026-05-14 10:13:40.431553','anonymousUser',0.00,'Duy Father','0123456789','LHP',2026,'2026-05-23','2201','ACTIVE','2026-05-23 04:24:05.347417','duy@example.com'),(_binary '\'>\\4tµ§ù\æiQ\'úo','11A2','2026-05-14 16:07:38.854614','duy@example.com',0.00,'Nhan Father','0123456789','UIT',2026,'2026-06-06','1101','ACTIVE','2026-06-06 17:39:21.661288','duy@example.com'),(_binary '5W‚h{s®ø”…§yY',NULL,'2026-05-17 09:49:48.033404','duy@example.com',NULL,'Vuong Ngo','0978653241','THPT DÄ© An',2026,NULL,'1301','ACTIVE','2026-05-17 09:50:17.111069','duy@example.com'),(_binary '_œ\÷^|Y‡«7$³…v\Ï','12A2','2026-05-25 14:49:43.040744','duy@example.com',3600000.00,NULL,'0987654321',NULL,2026,'2026-05-25','22002','ACTIVE','2026-06-13 05:43:32.177641','duy@example.com'),(_binary '_\Ñ\0}}K¬{Ô®\ã\æX','12A1','2026-05-25 15:46:33.236096','duy@example.com',NULL,'Bá»‘ DÆ°Æ¡ng','0123456789','Trá»‹nh HoÃ i Äá»©c',2026,NULL,'22003','ACTIVE','2026-06-13 05:43:44.769728','duy@example.com'),(_binary '˜P\'+}/Œ_\ÔF\ğ',NULL,'2026-06-05 15:04:10.355179','duy@example.com',0.00,'Pham Tháº¯ng','0987654321','VÃµ Thá»‹ SÃ¡u',2026,'2026-06-07','10003','ACTIVE','2026-06-07 10:17:24.941441','duy@example.com'),(_binary 'œT‹şyšm\Ùkş/',NULL,'2026-06-06 09:47:27.182771','duy@example.com',NULL,'Tráº§n VÄƒn Hai','0987654321','LHP',2026,NULL,NULL,'INACTIVE','2026-06-13 11:56:26.360428','duy@example.com'),(_binary 'œa]‚x¦»€\ÄÿR',NULL,'2026-06-06 10:01:27.176721','duy@example.com',0.00,NULL,NULL,NULL,2026,'2026-06-13','10004','ACTIVE','2026-06-13 12:04:21.770762','duy@example.com'),(_binary 'œb|>|„¿¿\ía\'P ',NULL,'2026-06-06 10:02:40.580733','duy@example.com',NULL,NULL,NULL,NULL,2026,NULL,NULL,'WAITING',NULL,NULL),(_binary 'œmµV}^‹\ğÕƒs&º',NULL,'2026-06-06 10:14:56.129358','duy@example.com',NULL,NULL,NULL,NULL,2026,NULL,'11001','ACTIVE','2026-06-06 10:15:05.452652','duy@example.com'),(_binary 'œo—#}c«³dvv­gF',NULL,'2026-06-06 10:16:59.434835','duy@example.com',NULL,NULL,NULL,NULL,2026,NULL,NULL,'WAITING',NULL,NULL),(_binary '¡^\Ë\æy\0¿\Ú-¸Ô¬k\Ò',NULL,'2026-06-07 09:16:44.988772','duy@example.com',NULL,NULL,NULL,NULL,2026,NULL,'22001','ACTIVE','2026-06-07 09:16:57.998308','duy@example.com'),(_binary '¡_À\Å{N¸\íÇ“\à\ÑLO',NULL,'2026-06-07 09:17:47.596787','duy@example.com',NULL,NULL,NULL,NULL,2026,NULL,NULL,'WAITING',NULL,NULL),(_binary 'Àüƒ£}ú¹\í¹cø0b',NULL,'2026-06-13 12:37:15.170443','duy@example.com',2000000.00,NULL,NULL,NULL,2026,'2026-06-13','10005','ACTIVE','2026-06-13 12:42:23.682378','duy@example.com');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_weeks`
--

DROP TABLE IF EXISTS `study_weeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_weeks` (
  `week_uuid` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `week_end_date` date NOT NULL,
  `school_year` int NOT NULL,
  `week_start_date` date NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `week_number` int NOT NULL,
  PRIMARY KEY (`week_uuid`),
  UNIQUE KEY `UKtm9i0siy6q6h83vkuyg071fbk` (`week_number`,`school_year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_weeks`
--

LOCK TABLES `study_weeks` WRITE;
/*!40000 ALTER TABLE `study_weeks` DISABLE KEYS */;
INSERT INTO `study_weeks` VALUES (_binary '—øJÿz´\õ®ND)','2026-06-05 13:28:12.287840','duy@example.com','2026-06-06',2026,'2026-05-31',NULL,NULL,1),(_binary '¿z¥r=§¯o\É\Ô†\Î','2026-06-13 05:41:03.269926','duy@example.com','2026-06-13',2026,'2026-06-07',NULL,NULL,2),(_binary 'À\Ö&yÅ»\Ô\à\Épx\Õ','2026-06-13 11:55:20.469580','duy@example.com','2026-06-20',2026,'2026-06-14',NULL,NULL,3),(_binary 'Á\\\é|}¥•yşxC#','2026-06-13 13:05:28.809380','duy@example.com','2026-06-27',2026,'2026-06-21',NULL,NULL,4);
/*!40000 ALTER TABLE `study_weeks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thamso`
--

DROP TABLE IF EXISTS `thamso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thamso` (
  `config_key` varchar(255) NOT NULL,
  `config_value` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thamso`
--

LOCK TABLES `thamso` WRITE;
/*!40000 ALTER TABLE `thamso` DISABLE KEYS */;
INSERT INTO `thamso` VALUES ('10xx','1002','2026-05-16 16:00:55.348943','duy@example.com','2026-05-23 05:32:29.072137','duy@example.com'),('11xx','1101','2026-05-14 16:08:21.780226','duy@example.com',NULL,NULL),('22xx','2203','2026-05-17 09:49:48.066966','duy@example.com','2026-06-05 10:33:03.717027','duy@example.com'),('DGNL-2026-SID','22003','2026-06-13 05:43:44.752505','duy@example.com',NULL,NULL),('K10-2026-SID','10005','2026-06-06 10:06:25.426395','duy@example.com','2026-06-13 12:37:24.445554','duy@example.com'),('K11-2026-SID','11001','2026-06-06 10:15:05.442980','duy@example.com',NULL,NULL),('K12-2026-SID','22003','2026-06-07 09:16:57.985097','duy@example.com','2026-06-13 05:43:44.770056','duy@example.com'),('VDC-2026-SID','22003','2026-06-13 05:43:32.174282','duy@example.com','2026-06-13 05:43:44.770276','duy@example.com');
/*!40000 ALTER TABLE `thamso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_template_items`
--

DROP TABLE IF EXISTS `timetable_template_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable_template_items` (
  `timetable_template_item_uuid` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `day_of_week` enum('FRIDAY','MONDAY','SATURDAY','SUNDAY','THURSDAY','TUESDAY','WEDNESDAY') NOT NULL,
  `sort_order` int NOT NULL,
  `start_time` time NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `lesson_type_uuid` binary(16) NOT NULL,
  `timetable_template_uuid` binary(16) NOT NULL,
  PRIMARY KEY (`timetable_template_item_uuid`),
  KEY `FK3kg25vqkq416hiians111c7l0` (`lesson_type_uuid`),
  KEY `FKgm7yq2yxl60nmjs1fxeltf7s9` (`timetable_template_uuid`),
  CONSTRAINT `FK3kg25vqkq416hiians111c7l0` FOREIGN KEY (`lesson_type_uuid`) REFERENCES `lesson_types` (`lesson_type_uuid`),
  CONSTRAINT `FKgm7yq2yxl60nmjs1fxeltf7s9` FOREIGN KEY (`timetable_template_uuid`) REFERENCES `timetable_templates` (`timetable_template_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_template_items`
--

LOCK TABLES `timetable_template_items` WRITE;
/*!40000 ALTER TABLE `timetable_template_items` DISABLE KEYS */;
INSERT INTO `timetable_template_items` VALUES (_binary '¼¸u+v‡›\èB\çxm','2026-06-12 16:44:25.771550','duy@example.com','WEDNESDAY',1,'18:00:00',NULL,NULL,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '“\Ş*Iú\ñ‚l\n\0\'\0\0'),(_binary '¼¸u+v‡œ¤^~\ï\0','2026-06-12 16:44:25.771892','duy@example.com','SUNDAY',2,'14:00:00',NULL,NULL,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '“\Ş*Iú\ñ‚l\n\0\'\0\0'),(_binary '¼¸u,wÈIEœ–,\ï','2026-06-12 16:44:25.772086','duy@example.com','SUNDAY',3,'17:30:00',NULL,NULL,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '“\Ş*Iú\ñ‚l\n\0\'\0\0'),(_binary '¼¸u,wÈJ4Cy\âvS','2026-06-12 16:44:25.772698','duy@example.com','SATURDAY',4,'16:15:00',NULL,NULL,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '“\Ş*Iú\ñ‚l\n\0\'\0\0'),(_binary '¼¸u-pš\Å;\ó‹—','2026-06-12 16:44:25.773563','duy@example.com','SATURDAY',5,'18:00:00',NULL,NULL,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '“\Ş*Iú\ñ‚l\n\0\'\0\0'),(_binary '¿7yK¯\ÑªTxY','2026-06-13 03:34:59.895986','duy@example.com','SUNDAY',1,'11:00:00',NULL,NULL,_binary '“\ÙEIú\ñ‚l\n\0\'\0\0',_binary '“ß…¡Iú\ñ‚l\n\0\'\0\0'),(_binary 'À\Õß›u?´M\öšk&','2026-06-13 11:55:02.427321','duy@example.com','SUNDAY',1,'06:00:00',NULL,NULL,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary '“\Û#yIú\ñ‚l\n\0\'\0\0'),(_binary 'À\Õß›u?´NÎ–º\Ğk¡','2026-06-13 11:55:02.427658','duy@example.com','MONDAY',2,'17:45:00',NULL,NULL,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary '“\Û#yIú\ñ‚l\n\0\'\0\0'),(_binary 'À\Õßœu’¦b\Ğ~/·o','2026-06-13 11:55:02.428605','duy@example.com','TUESDAY',3,'17:45:00',NULL,NULL,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary '“\Û#yIú\ñ‚l\n\0\'\0\0'),(_binary 'À\Õßœu’¦c¶\Ø3pm','2026-06-13 11:55:02.428739','duy@example.com','WEDNESDAY',4,'14:00:00',NULL,NULL,_binary '“\Ôq\ÒIú\ñ‚l\n\0\'\0\0',_binary '“\Û#yIú\ñ‚l\n\0\'\0\0'),(_binary 'À\Õßœu’¦d©fQÌ¡','2026-06-13 11:55:02.428886','duy@example.com','THURSDAY',5,'15:30:00',NULL,NULL,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '“\Û#yIú\ñ‚l\n\0\'\0\0'),(_binary 'À\Õßœu’¦er€×Fp','2026-06-13 11:55:02.428988','duy@example.com','THURSDAY',6,'19:30:00',NULL,NULL,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '“\Û#yIú\ñ‚l\n\0\'\0\0'),(_binary 'À\Õßz¬„\n\"©‘\Î\Ô','2026-06-13 11:55:02.429225','duy@example.com','FRIDAY',7,'17:45:00',NULL,NULL,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '“\Û#yIú\ñ‚l\n\0\'\0\0'),(_binary 'À\Õßz¬„e/8‰\0','2026-06-13 11:55:02.429533','duy@example.com','SATURDAY',8,'13:00:00',NULL,NULL,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '“\Û#yIú\ñ‚l\n\0\'\0\0'),(_binary 'Á®x¿ı\r9X\ÛÙ','2026-06-13 13:05:06.478366','duy@example.com','SUNDAY',1,'14:00:00',NULL,NULL,_binary '“\×\ÆIú\ñ‚l\n\0\'\0\0',_binary '“\á\')Iú\ñ‚l\n\0\'\0\0'),(_binary '“\ğNIIú\ñ‚l\n\0\'\0\0','2026-05-07 16:53:19.000000','system','WEDNESDAY',1,'19:30:00',NULL,NULL,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '“Ü¡‰Iú\ñ‚l\n\0\'\0\0'),(_binary '“\ñŞ´Iú\ñ‚l\n\0\'\0\0','2026-05-07 16:53:19.000000','system','THURSDAY',2,'17:45:00',NULL,NULL,_binary '“\Ò\ëiIú\ñ‚l\n\0\'\0\0',_binary '“Ü¡‰Iú\ñ‚l\n\0\'\0\0'),(_binary '“\ó‹uIú\ñ‚l\n\0\'\0\0','2026-05-07 16:53:19.000000','system','FRIDAY',3,'19:30:00',NULL,NULL,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '“Ü¡‰Iú\ñ‚l\n\0\'\0\0'),(_binary '“\õ$Iú\ñ‚l\n\0\'\0\0','2026-05-07 16:53:19.000000','system','SATURDAY',4,'14:30:00',NULL,NULL,_binary '“\ÖF3Iú\ñ‚l\n\0\'\0\0',_binary '“Ü¡‰Iú\ñ‚l\n\0\'\0\0');
/*!40000 ALTER TABLE `timetable_template_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_templates`
--

DROP TABLE IF EXISTS `timetable_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable_templates` (
  `timetable_template_uuid` binary(16) NOT NULL,
  `active` bit(1) NOT NULL,
  `apply_from` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `timetable_template_name` varchar(255) NOT NULL,
  `school_year` int NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `grade_id` bigint NOT NULL,
  PRIMARY KEY (`timetable_template_uuid`),
  KEY `FKkxgah7p2ywwe6u8tk0vr5ksb9` (`grade_id`),
  CONSTRAINT `FKkxgah7p2ywwe6u8tk0vr5ksb9` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_templates`
--

LOCK TABLES `timetable_templates` WRITE;
/*!40000 ALTER TABLE `timetable_templates` DISABLE KEYS */;
INSERT INTO `timetable_templates` VALUES (_binary '“\Û#yIú\ñ‚l\n\0\'\0\0',_binary '','2026-06-14','2026-05-07 16:53:19.000000','system','K12-2026-DEFAULT',2026,'2026-06-13 11:55:01.740822','duy@example.com',3),(_binary '“Ü¡‰Iú\ñ‚l\n\0\'\0\0',_binary '','2026-01-01','2026-05-07 16:53:19.000000','system','K11-2026-DEFAULT',2026,NULL,NULL,2),(_binary '“\Ş*Iú\ñ‚l\n\0\'\0\0',_binary '','2026-06-07','2026-05-07 16:53:19.000000','system','K10-2026-DEFAULT',2026,'2026-06-12 16:44:25.097552','duy@example.com',1),(_binary '“ß…¡Iú\ñ‚l\n\0\'\0\0',_binary '','2026-06-07','2026-05-07 16:53:19.000000','system','VDC-2026-DEFAULT',2026,'2026-06-13 03:34:59.898124','duy@example.com',4),(_binary '“\á\')Iú\ñ‚l\n\0\'\0\0',_binary '','2026-06-21','2026-05-07 16:53:19.000000','system','DGNL-2026-DEFAULT',2026,'2026-06-13 13:05:06.485499','duy@example.com',5);
/*!40000 ALTER TABLE `timetable_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_uuid` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `user_email` varchar(255) NOT NULL,
  `fb_link` varchar(255) DEFAULT NULL,
  `user_fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_phone_number` varchar(255) DEFAULT NULL,
  `refresh_token` mediumtext,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`user_uuid`),
  UNIQUE KEY `UK33uo7vet9c79ydfuwg1w848f` (`user_email`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (_binary '\rS(pÕœ„–A\î\nK','2026-05-09 15:20:40.488295','anonymousUser','user@example.com','string','Pham Tran Khanh Duy','$2a$10$2BNbj4WhwSwHJcXxW26vkupxZggLwdNvA16BvQTDcAqjic0X8gJx.','0356998049',NULL,NULL,NULL,4),(_binary '“¨y\íº\n_GûÚ§”','2026-05-13 04:34:41.192530','anonymousUser','p1-smoke-student-20260513113440@example.com',NULL,'HoÃ ng TÃ¢n','$2a$10$INDdZvwfej30HNznYS8cCewdFjaD.alqA0/CSyfnV2EXiBil4Bj6W','0948409052','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwMS1zbW9rZS1zdHVkZW50LTIwMjYwNTEzMTEzNDQwQGV4YW1wbGUuY29tIiwiZXhwIjoxNzc5NTExNTkzLCJpYXQiOjE3Nzg2NDc1OTMsInVzZXIiOnsiaWQiOiIwMTllMWY5ZC05M2E4LTc5ZWQtYmEwYS01ZjQ3ZmJkYWE3OTQiLCJlbWFpbCI6InAxLXNtb2tlLXN0dWRlbnQtMjAyNjA1MTMxMTM0NDBAZXhhbXBsZS5jb20iLCJmdWxsTmFtZSI6IlAxIFNtb2tlIFN0dWRlbnQgMjAyNjA1MTMxMTM0NDAifX0.MJchqd0LL3ZKnViMGha_jnFHhNjMEdJW_QKeZce-OEQ','2026-05-23 05:32:29.072137','duy@example.com',1),(_binary '!b\ò|—¸B\Ô\ôV¿\Ù\à','2026-05-13 12:49:53.294671','anonymousUser','tuantd.cntt@gmail.com','sstringcom','DÆ°Æ¡ng Tuáº¥n','$2a$10$fS8E8gH0e8x3rB2vmDwfIeXE/V42Mt/EZkTL0Sb/VbZQbUqMHInuS','0123456789',NULL,'2026-05-14 10:06:19.487412','tuantd.cntt@gmail.com',1),(_binary '!·†\İwŞµbyeµf\öt','2026-05-13 14:22:16.285167','tuantd.cntt@gmail.com','tranduongtuan2005@gmail.com','https://www.facebook.com/tuan.tranduong.505','Tuan Duong Tran','$2a$10$taWghXdB38pqjAbTclFece1Jjz3wgPKjIT/70xzaChrsS06FIIa5G','0987654321',NULL,'2026-05-16 16:07:40.839075','duy@example.com',1),(_binary '%\ä¬[{³¾\Åå—o¿','2026-05-14 09:50:03.867748','anonymousUser','duy@example.com','string','Pink Duy','$2a$10$TV11A6GWDU/JePRfyskdPO0k/4hVxfvRamxb0Un26PoLrZDCCYPmW','0123456789','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkdXlAZXhhbXBsZS5jb20iLCJleHAiOjE3ODIyMTgyMDEsImlhdCI6MTc4MTM1NDIwMSwidXNlciI6eyJpZCI6IjAxOWUyNWU0LWFjNWItN2JiMy1iZWM1LWU1OTc4MTZmYmYxMSIsImVtYWlsIjoiZHV5QGV4YW1wbGUuY29tIiwiZnVsbE5hbWUiOiJQaW5rIER1eSIsInN0dWRlbnRJZCI6bnVsbH19.JmZMOO2jAG5ziZmNbXOluskyo_pvwcHG8R7hyCye9fc','2026-06-13 12:36:41.177791','duy@example.com',3),(_binary '%úI¢tš‹YV›a=¦©','2026-05-14 10:13:40.386272','anonymousUser','duy@uit.edu.vn','https://www.facebook.com/KDuy.preO22','Duy','$2a$10$WWVcz982QPW6bZuqPEs6yetFRANOMfUHDH6l6fLORDAoT/YNJSHNm','0123456789',NULL,'2026-05-15 09:00:58.135793','duy@uit.edu.vn',1),(_binary '\'>\\4tµ§ù\æiQ\'úo','2026-05-14 16:07:38.804598','duy@example.com','nhan@uit.edu.vn',NULL,'Nhan Ho','$2a$10$4ZhtRv9E3iGTeAcsFM8NnOxxY0RfSDusl2z5mCPQHVRN8NwtmWUNi','0123456789',NULL,'2026-06-06 17:56:00.419513','nhan@uit.edu.vn',1),(_binary '1\ÂIXum¬\ğ\ÔYü\Ê\Ğ','2026-05-16 17:07:56.888290','duy@example.com','thang@gmail.com',NULL,'Thang Tran','$2a$10$kUniYg6xLWnwUA/nwA55u.tHZAJA0agYROpgzabI.sBwkkblKlhhi','0123456789',NULL,NULL,NULL,3),(_binary '5W‚h{s®ø”…§yY','2026-05-17 09:49:48.009069','duy@example.com','vuongnv@mindx.net.vn',NULL,'Ngo Minh Vuong','$2a$10$udlgZJmU8jTFJnorOfvtwukxNyrPy50PL8MzOwV4g.ahA4keNB36q','0978653241',NULL,NULL,NULL,1),(_binary 'R\ÄPu–¶¬\Å\ÇwB‰','2026-05-23 02:57:18.416476','anonymousUser','tuan@uit.edu.vn','string','Tuan Tran','$2a$10$LbIoW3/8G95LhnUn9mdDvuLAibOrBxfmTIfzeA2bgeuGz8uGs3BC2','0976746167',NULL,NULL,NULL,3),(_binary '_œ\÷^|Y‡«7$³…v\Ï','2026-05-25 14:49:43.006745','duy@example.com','duy@hcmus.edu.vn',NULL,'Pink Duy','$2a$10$eGvpQD9S3yDlr2R//HfPeec6qCizCRxuVzInK7.psiIAt.VoxpYnK','0987654321',NULL,NULL,NULL,1),(_binary '_\Ñ\0}}K¬{Ô®\ã\æX','2026-05-25 15:46:33.213309','duy@example.com','duongpt@uit.edu.vn',NULL,'Pháº¡m Triá»u DÆ°Æ¡ng','$2a$10$VnvbKkMpQbX96N8bQ4OA1OUwZhrSIKEWgR4Fr5sxZ0woVdu5nZ4uO','0123456789',NULL,NULL,NULL,1),(_binary 'ci’¿vN…\÷\Ş\ò\ğ\ÛU','2026-05-26 08:32:03.775746','system','mtuan@gmail.com',NULL,'Äáº·ng Minh Tuáº¥n','$2a$10$JSR2NuC9D6txTW6iQAF3C.ZGk4cpHQtx4KIg8YbQRPh7xba9j39Ka','0123456789',NULL,NULL,NULL,4),(_binary 'ci“–}<–¯\É;`yos','2026-05-26 08:32:03.990821','system','quan@gmail.com',NULL,'TÃ´n Ngá»c Minh QuÃ¢n','$2a$10$Z0nSMsZ9/PbGn27oUAEcn.qrXuK9TjsfEF9p80FbrgJDbYr4oK2kK','0123456790',NULL,NULL,NULL,3),(_binary 'ci”-~\õƒ0V¨;,','2026-05-26 08:32:04.141048','system','huuan@gmail.com',NULL,'Nguyá»…n Ngá»c Há»¯u Ã‚n','$2a$10$9csuwXbIcB55pcLIfXHoBOt9Vo90ERWIXr0adyTbhvBKJ1qQ4s6je','0123456791',NULL,NULL,NULL,4),(_binary 'ci”¾~\íŠ.]\ÌY »y','2026-05-26 08:32:04.286134','system','khang@gmail.com',NULL,'Táº¡ Gia Khang','$2a$10$KxfbQ.N4jJj2FacsOTDinOsdp8Jg0n.J3SUz8UIFV1f5yYdGZrWNq','0123456792',NULL,NULL,NULL,4),(_binary 'ci•QwÉ½¯F¹–Ÿƒ\æ','2026-05-26 08:32:04.433072','system','ngan@gmail.com',NULL,'LÃª Tráº§n HoÃ ng NgÃ¢n','$2a$10$Snl4j/t20QBzcFxpLqdMk.w6bGgftv9Gw3DkACGGdXtQ9KZjHRliq','0123456793',NULL,NULL,NULL,4),(_binary 'ci•\Şz}¡k)>™“{','2026-05-26 08:32:04.574869','system','nhan@gmail.com',NULL,'Nguyá»…n Thiá»‡n NhÃ¢n','$2a$10$EioU/pz/MyC/D7oEx3HmVO2UhcKVWanSBSnm4upv1AOw1MZYZgVHy','0123456794',NULL,NULL,NULL,4),(_binary 'ci–…w]……³S\'ki\Ã','2026-05-26 08:32:04.741581','system','kduy1706@gmail.com',NULL,'Pháº¡m Tráº§n KhÃ¡nh Duy','$2a$10$ATtQBJqkXcL7ITdQhsMr4uTEW4YfcAz9vOJIuJKQAyxFINUUEXEWO','0123456795',NULL,NULL,NULL,4),(_binary 'ci—t Ÿˆ4°˜*','2026-05-26 08:32:04.893964','system','tu@gmail.com',NULL,'Nguyá»…n Anh TÃº','$2a$10$p4wuaZRmDx5pxYB/.gEdaeUtIbIYqNr/oD9UZMDllu4Gm/v9/wvuK','0123456796',NULL,NULL,NULL,4),(_binary 'ci—·t„kÕ¯¨„,û','2026-05-26 08:32:05.048258','system','nhi@gmail.com',NULL,'Nguyá»…n Ã Nhi','$2a$10$0YRrLLSwrD1sRQ5kwC7zvOvigRL7aVIrQb34JAwuwGVJQ19RZAlzm','0123456797',NULL,NULL,NULL,4),(_binary 'ci˜OsO˜8o\Ì\Ø¾','2026-05-26 08:32:05.199956','system','uyen@gmail.com',NULL,'Pháº¡m HoÃ ng Tháº£o UyÃªn','$2a$10$a61Qc.u4sQuqEoj4hH7K9.ZWsNHzPo/tb/XyrQLZhxN/Bh8rgXEjK','0123456798',NULL,NULL,NULL,4),(_binary 'ci˜\âÚ¨\âd\ë\ìÏŒ','2026-05-26 08:32:05.347000','system','tin@gmail.com',NULL,'VÃµ LÃª TrÃ­ TÃ­n','$2a$10$P9Vfcq97TusvHTExVfJvW.iRdkSH45S7pT5gJemwIWy4MbkkWUZDi','0123456799',NULL,NULL,NULL,4),(_binary 'ci™uva¶Ä„ÿş¹û','2026-05-26 08:32:05.493874','system','thuong@gmail.com',NULL,'Nguyá»…n Phi ThÆ°á»ng','$2a$10$YLs7jRVnVLQLl2.t57dBnuBGiKaP4Oig.abd0XZO1or1jXI6Hu.Iq','0123456800',NULL,NULL,NULL,4),(_binary 'cišx¿¹·°\õbŞ™¬','2026-05-26 08:32:05.647760','system','chi@gmail.com',NULL,'Nguyá»…n Há»¯u ChÃ­','$2a$10$sh/fLym2iwmnYqBUce5WN.3iKNr7//m5G..bpa9iol6yK6WOKfHuG','0123456801',NULL,NULL,NULL,4),(_binary 'ciš£v—‹ÿ”E\Íÿ˜z','2026-05-26 08:32:05.795571','system','khang.nguyen@gmail.com',NULL,'Nguyá»…n Nháº­t Khang','$2a$10$X3j6dP6x6jeGqYjpRSBGAelG4vFlAbFG1XyqamPAn3fqqDbGBdiCi','0123456802',NULL,NULL,NULL,4),(_binary 'ci›1x\0“\Õ\ÎĞ½n\áq','2026-05-26 08:32:05.937015','system','hung@gmail.com',NULL,'Äá»— Gia HÆ°ng','$2a$10$citoeEPcJ9iAv7GGWmQMLOEqtlRlkBIzxGXnmSciozvck32RAhsI2','0123456803',NULL,NULL,NULL,4),(_binary 'ci›¿}ì¸‹j”1`i/','2026-05-26 08:32:06.080957','system','mai@gmail.com',NULL,'Nguyá»…n Quá»³nh Mai','$2a$10$nrIfW3s7zM.sUudzJbYb4eMoQpSJwFul580bJBMt2NuZb2/IxMfyK','0123456804',NULL,NULL,NULL,4),(_binary 'ciœKr5½\ó\Æ\ØK]E','2026-05-26 08:32:06.219759','system','baoan@gmail.com',NULL,'Nguyá»…n Báº£o Ã‚n','$2a$10$A/r.7yc5VvO/R/tL5msj4etjyNRaxNtek2R1MkubcLq88SgMYc1bC','0123456805',NULL,NULL,NULL,4),(_binary 'ciœ\ØqT—[§\í^Sƒ','2026-05-26 08:32:06.360721','system','vananh@gmail.com',NULL,'Nguyá»…n VÃ¢n Anh','$2a$10$auhh4J8cphmoxib3RJ7owObhdYF9EjSNv6DZ9nxr8byaqyHBD086K','0123456806',NULL,NULL,NULL,4),(_binary 'cie|¦(¯Oÿ*\ò™','2026-05-26 08:32:06.501339','system','tram@gmail.com',NULL,'Nguyá»…n TrÃ¢m','$2a$10$2SYcAlVHm15ApgcRwlatYeS10pkKr1wVZRFWaZWgRbr7R0aOUwImK','0123456807',NULL,NULL,NULL,3),(_binary 'ci\ñtz\ğ¨\Ölª;f','2026-05-26 08:32:06.642021','system','ha@gmail.com',NULL,'Nguyá»…n Háº¡','$2a$10$qxcOACbpGIHyHXL0DI9NLewr6GOTnjgfCKEsrnWKmeVXgMV1jUbUK','0123456808',NULL,NULL,NULL,3),(_binary 'ci}yw¿°}b\ñ\é?','2026-05-26 08:32:06.782485','system','nhan.do@gmail.com',NULL,'Äá»— Há»¯u NhÃ¢n','$2a$10$rCeA5pugahxIpV3n5T5plOvPG0UUidseUxdfRsYyeTWa.w62SZmn2','0123456809','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuaGFuLmRvQGdtYWlsLmNvbSIsImV4cCI6MTc4MjAyNjc2OCwiaWF0IjoxNzgxMTYyNzY4LCJ1c2VyIjp7ImlkIjoiMDE5ZTYzNjktOWU3ZC03OTc3LWJmYjAtN2Q2MmYxZTkzZjBmIiwiZW1haWwiOiJuaGFuLmRvQGdtYWlsLmNvbSIsImZ1bGxOYW1lIjoixJDhu5cgSOG7r3UgTmjDom4iLCJzdHVkZW50SWQiOm51bGx9fQ.8q6wYPCD-kJJC7f5_vwmPFwtKZaDX3w7rML7Tm6J0Oc','2026-06-11 08:03:13.486170','nhan.do@gmail.com',2),(_binary '—\å†n|“”\Ê\ÑÁ´K','2026-06-05 13:07:42.318631','system','tuan@gmail.com',NULL,'Äáº·ng Minh Tuáº¥n','$2a$10$QbqSDQZX1K5pUiX/ziFQZuwya2PC8UcVIusc87w8wT6kgXyyG2dWK','0123456789',NULL,NULL,NULL,4),(_binary '˜P\'+}/Œ_\ÔF\ğ','2026-06-05 15:04:10.283720','duy@example.com','tan@gmail.com',NULL,'Pháº¡m TÃ¢n','$2a$10$3ZeNeVgwypApq1SgDl8nMeiQgXWAGUT3U.d4UYMQ7YNd1QF7U8vMe','0123456789','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0YW5AZ21haWwuY29tIiwiZXhwIjoxNzgxNjkxMzczLCJpYXQiOjE3ODA4MjczNzMsInVzZXIiOnsiaWQiOiIwMTllOTg1MC0yNzJiLTdkMmYtOGM5ZS0xNjVmZDQ0NmYwN2YiLCJlbWFpbCI6InRhbkBnbWFpbC5jb20iLCJmdWxsTmFtZSI6IlBo4bqhbSBUw6JuIiwic3R1ZGVudElkIjpudWxsfX0.wk4--bR063D2BN8gFNwWuonUDdkErFTAkjtlErEhcL8','2026-06-07 10:16:13.065555','tan@gmail.com',1),(_binary 'œT‹şyšm\Ùkş/','2026-06-06 09:47:27.102511','duy@example.com','danh@gmail.com',NULL,'Tráº§n CÃ´ng Danh','$2a$10$ILPLpTG1PHOBVJvSY1urI.YhIWI.zBgXQcBFlzVqEnzpb1Za3zyw2','0123456789',NULL,NULL,NULL,1),(_binary 'œa]‚x¦»€\ÄÿR','2026-06-06 10:01:27.170094','duy@example.com','nghia@gmail.com',NULL,'Nguyá»…n NghÄ©a','$2a$10$CLM8aGCHm/vSUkT91Lyuf.5Bi3z4Mhp/Zl47N.9U1xoRXVKhe6Uq.','0123456789',NULL,NULL,NULL,1),(_binary 'œb|>|„¿¿\ía\'P ','2026-06-06 10:02:40.575220','duy@example.com','sang@gmail.com',NULL,'Nguyá»…n Sang','$2a$10$Hxs9DxfFOmU3TC7C3V9VKequjSk2ijrgXktHFHLVymsqdwFP6Nhu2','0123456789',NULL,NULL,NULL,1),(_binary 'œmµV}^‹\ğÕƒs&º','2026-06-06 10:14:56.086440','duy@example.com','an@gmail.com',NULL,'Tráº§n An','$2a$10$Y2tC0yKK1jgH1Zb8GvNRB.xJvrfrPVsRXEXYDluBsDsTzzIhhpNt.','0123456789',NULL,NULL,NULL,1),(_binary 'œo—#}c«³dvv­gF','2026-06-06 10:16:59.428370','duy@example.com','bao@gmail.com',NULL,'Nguyá»…n Báº£o','$2a$10$PwmWEc5diomMlcycDgZUCelrsSPdFzhxHUqCeOSOCCq8Ah0LVxlXe','0123456789',NULL,NULL,NULL,1),(_binary '\'­KŸq†µŸs\ï\×','2026-06-06 13:38:03.724285','duy@example.com','thangtran@gmail.com',NULL,'Tháº¯ng Tráº§n','$2a$10$wBVqyKJIbhm0cwbDQr4Dre/OGgM38nGnXYfIDzYEIBjLaI8dkK0A2','0976746167','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0aGFuZ3RyYW5AZ21haWwuY29tIiwiZXhwIjoxNzgyMjE0MTc2LCJpYXQiOjE3ODEzNTAxNzYsInVzZXIiOnsiaWQiOiIwMTllOWQyNy1hZDRiLTdmMTYtOWY3MS04NmI1OWY3M2VmZDciLCJlbWFpbCI6InRoYW5ndHJhbkBnbWFpbC5jb20iLCJmdWxsTmFtZSI6IlRo4bqvbmcgVHLhuqduIiwic3R1ZGVudElkIjpudWxsfX0.GGcOo4iTXi_sNft1a6q8mHvxfKL5-N7krYXeHDopAgk','2026-06-13 11:29:36.943099','thangtran@gmail.com',4),(_binary '¡^\Ë\æy\0¿\Ú-¸Ô¬k\Ò','2026-06-07 09:16:44.902062','duy@example.com','nghi@gmail.com',NULL,'Nghi Tran','$2a$10$iZwmEPt7.hvDMSp.OyG0redBTEXaEz2o0bDil8AOqSh4eQJpI/GnS','0123456789',NULL,NULL,NULL,1),(_binary '¡_À\Å{N¸\íÇ“\à\ÑLO','2026-06-07 09:17:47.589805','duy@example.com','anhvan@gmail.com',NULL,'Van Anh','$2a$10$h3AjJJFR6aVOQtkcrCv4C.oWe9RCMQTA15HaPZGows6C1PflIYOE.','0123456789',NULL,NULL,NULL,1),(_binary 'Àüƒ£}ú¹\í¹cø0b','2026-06-13 12:37:14.787527','duy@example.com','tuananh@gmail.com',NULL,'VÅ© Tuáº¥n Anh','$2a$10$Z50z2/wKpoM9oWAMnD6x5OS13dxpKJFcNL7D.IrrE0jE81EA2LXfO','0987654321','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0dWFuYW5oQGdtYWlsLmNvbSIsImV4cCI6MTc4MjIxODI5OCwiaWF0IjoxNzgxMzU0Mjk4LCJ1c2VyIjp7ImlkIjoiMDE5ZWMwZmMtODNhMy03ZGZhLWI5ZWQtYjkwMzYzZjgzMDYyIiwiZW1haWwiOiJ0dWFuYW5oQGdtYWlsLmNvbSIsImZ1bGxOYW1lIjoiVsWpIFR14bqlbiBBbmgiLCJzdHVkZW50SWQiOm51bGx9fQ.-IA0llE2Xgc5Y2ig5CQupevtxKNvUcAtd7Lcdi-zmfM','2026-06-13 12:38:18.620858','tuananh@gmail.com',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'da1'
--

--
-- Dumping routines for database 'da1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-13 23:52:39
