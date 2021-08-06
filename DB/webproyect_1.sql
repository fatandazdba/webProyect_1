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

-- Volcando estructura para tabla webproyect_1.detail
CREATE TABLE IF NOT EXISTS `detail` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla webproyect_1.detail: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `detail` DISABLE KEYS */;
REPLACE INTO `detail` (`id`, `description`) VALUES
	(1, 'detail1');
/*!40000 ALTER TABLE `detail` ENABLE KEYS */;

-- Volcando estructura para tabla webproyect_1.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL,
  `quantity` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla webproyect_1.payment: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;

-- Volcando estructura para tabla webproyect_1.product
CREATE TABLE IF NOT EXISTS `product` (
  `Name` varchar(50) NOT NULL DEFAULT '',
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla webproyect_1.user: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id`, `name`, `last_name`, `birthday`) VALUES
	(1, 'freddy', 'tandazo', NULL),
	(2, 'freddy', 'tandazo', NULL),
	(3, 'freddy', 'tandazo', NULL),
	(4, 'freddy', 'tandazo', NULL),
	(5, 'freddy', 'tandazo', NULL),
	(6, 'freddy', 'tandazo', NULL),
	(7, 'freddy', 'tandazo', NULL),
	(8, 'freddy', 'tandazo', NULL),
	(9, 'freddy', 'tandazo', NULL),
	(10, 'freddy', 'tandazo', NULL),
	(11, 'freddy', 'tandazo', NULL),
	(12, 'freddy', 'tandazo', NULL),
	(13, 'freddy', 'tandazo', NULL),
	(14, 'freddy', 'tandazo', NULL),
	(15, 'freddy', 'tandazo', NULL),
	(16, 'freddy', 'tandazo', NULL),
	(17, 'freddy', 'tandazo', NULL),
	(18, 'freddy', 'tandazo', NULL),
	(19, 'freddy', 'tandazo', NULL),
	(20, 'freddy', 'tandazo', NULL),
	(21, 'freddy', 'tandazo', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
