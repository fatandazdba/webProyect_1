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


-- Volcando estructura de base de datos para tienda
CREATE DATABASE IF NOT EXISTS `tienda` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tienda`;

-- Volcando estructura para tabla tienda.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `user` varchar(30) COLLATE latin1_bin NOT NULL,
  `password` varchar(32) COLLATE latin1_bin NOT NULL,
  `tarjeta` varchar(50) COLLATE latin1_bin NOT NULL,
  `IV` varchar(16) COLLATE latin1_bin NOT NULL,
  `Nombre` varchar(30) COLLATE latin1_bin NOT NULL,
  `Apellidos` varchar(50) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla tienda.clientes: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
REPLACE INTO `clientes` (`user`, `password`, `tarjeta`, `IV`, `Nombre`, `Apellidos`) VALUES
	('admin', '204d2d5fdb4f3debd702fbc93cdd1ea1', 'MTIzNCA1Njc4IDkwMTIgMzQ1Ng==', '', '', ''),
	('alberto', 'ae90e9a414cba62ac06dc8724fcd9601', 'U0upaDz4eTeuvv5eLnAN2IU+fbvhjpd6pqaso5ZMcOc=', 'abcd12344321dcba', 'J. Alberto', 'de Frutos'),
	('freddy', 'eda56def9e82a3936a75aff3f4e66330', '', '', 'freddy', 'freddy');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla tienda.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `precio` int(11) NOT NULL,
  `talla` int(11) NOT NULL,
  `imagen` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda.productos: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
REPLACE INTO `productos` (`id`, `nombre`, `precio`, `talla`, `imagen`) VALUES
	(1, 'pantalones', 45, 42, 'img1'),
	(2, 'camiseta', 20, 42, 'img2'),
	(3, 'chaqueta', 125, 6, 'img3'),
	(4, 'zapatos', 60, 40, 'img4'),
	(5, 'sombrero', 28, 55, 'img5');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
