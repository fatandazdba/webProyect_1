-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.19-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para webproyect_1
CREATE DATABASE IF NOT EXISTS `webproyect_1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `webproyect_1`;

-- Volcando estructura para tabla webproyect_1.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `user` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarjeta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IV` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla webproyect_1.clientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla webproyect_1.detail
CREATE TABLE IF NOT EXISTS `detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla webproyect_1.detail: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detail` DISABLE KEYS */;
REPLACE INTO `detail` (`id`, `description`) VALUES
	(1, 'detail1');
/*!40000 ALTER TABLE `detail` ENABLE KEYS */;

-- Volcando estructura para tabla webproyect_1.doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla webproyect_1.doctrine_migration_versions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
REPLACE INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20210901145147', '2021-09-01 14:52:28', 587);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;

-- Volcando estructura para tabla webproyect_1.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla webproyect_1.payment: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;

-- Volcando estructura para tabla webproyect_1.product
CREATE TABLE IF NOT EXISTS `product` (
  `Name` varchar(50) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla webproyect_1.product: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
REPLACE INTO `product` (`Name`, `quantity`) VALUES
	('Product1', 1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Volcando estructura para tabla webproyect_1.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla webproyect_1.user: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id`, `email`, `roles`, `password`, `name`, `last_name`, `birthday`) VALUES
	(1, 'freddy.tandazo@fgupm.upm.es', '["ROLE_ADMIN"]', '$argon2id$v=19$m=65536,t=4,p=1$UXpFTk5pdlZsUUl3RHFqNg$1rWJJlMu7PRL2xfXx3JbTLe0a09886gdtn/8JJr6Jgo', 'Freddy', 'Tandazo', NULL),
	(27, 'freddy.tandazo@fgupm.upm.es_0303:0909:2121 1212:0909:5050', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$a0sxYS9DV0lSZGhNeVowZQ$s6JhXEsOy3zI3UePc5hUaO4WNK1scCnyHJbPTu7Fn2s', 'Freddy Alex', 'Tandazo Yanez', NULL),
	(28, 'user@fgupm.upm.es', '["ROLE_CORREO"]', '$argon2id$v=19$m=65536,t=4,p=1$M1pvTm0vYkpJeXJpSi9oRQ$HM4Nc4B79BAbniZVwTHVQkm2h49w38F8LrAf121Teaw', 'CORREO', 'CORREO', NULL),
	(29, 'chatbot@fgupm.upm.es', '["ROLE_CHATBOT"]', '$argon2id$v=19$m=65536,t=4,p=1$UGZJMjRzb1hUZElYS0FLbQ$w2ICor89uBrvqvsz799wHNcKJp7eQ6LoYh9FBcixMuM', 'CHATBOT', 'CHATBOT', NULL),
	(30, 'clientes@fgupm.upm.es', '["ROLE_CLIENTES"]', '$argon2id$v=19$m=65536,t=4,p=1$UkhvaEVMalJxSS9UWld1Tw$1UyrYj/XhpaLKw+zKbgSyjCD/LcVcxPWIM3zxb3KroY', 'CLIENTES', 'CLIENTES', NULL),
	(31, 'freddy.tandazo@fgupm.upm.es_0303:0909:2121 0202:0909:2525', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$THl1Y0xXVFc2cDcwbmxKOA$RNoSQqWd7wx+QtP5QMBPHYkn2CcY6Qy2ZQNgA+GvSg0', 'Freddy Alex', 'Tandazo Yanez', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
