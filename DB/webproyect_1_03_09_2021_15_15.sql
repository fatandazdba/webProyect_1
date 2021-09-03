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

-- Volcando datos para la tabla webproyect_1.doctrine_migration_versions: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
REPLACE INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20210901145147', '2021-09-01 14:52:28', 587),
	('DoctrineMigrations\\Version20210903150356', '2021-09-03 15:04:32', 628),
	('DoctrineMigrations\\Version20210903150824', '2021-09-03 15:09:52', 1395);
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
  `token` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla webproyect_1.user: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id`, `email`, `roles`, `password`, `name`, `last_name`, `birthday`, `token`) VALUES
	(1, 'freddy.tandazo@fgupm.upm.es', '["ROLE_ADMIN"]', '$argon2id$v=19$m=65536,t=4,p=1$UXpFTk5pdlZsUUl3RHFqNg$1rWJJlMu7PRL2xfXx3JbTLe0a09886gdtn/8JJr6Jgo', 'Freddy', 'Tandazo', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzA2NzA2NjMsImV4cCI6MTYzMDcyMDY2Mywicm9sZXMiOlsiUk9MRV9BRE1JTiIsIlJPTEVfVVNFUiJdLCJ1c2VybmFtZSI6ImZyZWRkeS50YW5kYXpvQGZndXBtLnVwbS5lcyJ9.BbQZafyRk7x5mNa0P9s4kIcl91kztvnmKMJEzibkNrXRxr4Cl6anbfB6NLIUEjqtvB1pwLxZgDOn_KOACcZvCEP_Dea2OsoA4Vr9cNViYh73aql2i0WTqpYGQm3D8LZtVgLGcA-Yb5aohtwnmycZZ1LkuxTzGujoQbZ9u5XP0rcpsp6wccqME2T4_wBQq2IUaMpFhUr-PpImwvUV9BxsUpW93b60clrd473VS9d-SjtgZwMPjUKZwfePZ2if2Tj5T_uNbGn9si51extu8fi-OnAbzT8tLeMBy1PM32JxRv77I_IUyzJuoxJNog'),
	(27, 'freddy.tandazo@fgupm.upm.es_0303:0909:2121 1212:0909:5050', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$a0sxYS9DV0lSZGhNeVowZQ$s6JhXEsOy3zI3UePc5hUaO4WNK1scCnyHJbPTu7Fn2s', 'Freddy Alex', 'Tandazo Yanez', NULL, NULL),
	(28, 'user@fgupm.upm.es', '["ROLE_CORREO"]', '$argon2id$v=19$m=65536,t=4,p=1$M1pvTm0vYkpJeXJpSi9oRQ$HM4Nc4B79BAbniZVwTHVQkm2h49w38F8LrAf121Teaw', 'CORREO', 'CORREO', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzA2NzgyODIsImV4cCI6MTYzMDcyODI4Miwicm9sZXMiOlsiUk9MRV9DT1JSRU8iLCJST0xFX1VTRVIiXSwidXNlcm5hbWUiOiJ1c2VyQGZndXBtLnVwbS5lcyJ9.wNehH68m85kTLeOg4kAI5yRuJlydSebakONor_Wz-IBF9qEDcz3vO6yKy_Hk2ACcFPvYr8Hzlo4nid7bqMgH5HZZpVe839YdTHcKVYqIoMySpOZPDsmmhipcBOnliFDOql6e-Uv5uh6jbnIv3sN4XvP14ri1X0M_7cT-MLIvln7fhCx0tSCcR3nl1oItB-G02j_LVubIrhwB6nDUlYsLxKEnLhbjnJ6Gv1NKkY8dWIh8m4jNjNd4S8w1ZMAMSFNfiiG47_nuKoCHod8GFNwzBKlBDNnSo9h9DY5LCp7UNcGQb7BWRE1zvHMnKAGPoE9SnyAuDi'),
	(29, 'chatbot@fgupm.upm.es', '["ROLE_CHATBOT"]', '$argon2id$v=19$m=65536,t=4,p=1$UGZJMjRzb1hUZElYS0FLbQ$w2ICor89uBrvqvsz799wHNcKJp7eQ6LoYh9FBcixMuM', 'CHATBOT', 'CHATBOT', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzA2NzkxMjQsImV4cCI6MTYzMDcyOTEyNCwicm9sZXMiOlsiUk9MRV9DSEFUQk9UIiwiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiY2hhdGJvdEBmZ3VwbS51cG0uZXMifQ.hTIiOSBe_kOXbAJiE6E-L4BkALtRI0E0O-nfUIFCubuHnH0qMST1fN1X8GRa54x5Tm1w9kBJndNTvNN2xvIscXVqhyO42fYb6GB9HOH-sO8_cn4XcQ34PatCosadWm9kOehmmPoH8aebPcw8YowOM1Y6B5kkMfJ53W1pymlzTlFLvU6-tYs6feOtK1juIwrH-PoNp7-qpSMxKhn2v_DbxKli3JoPZm1789N1vNxvCPbLLYlPhvvkc6ap7VTCsshjmFTgcJWAFizy6XfVroBUnFSU4sdFQIcX-38y4aVCEf_alAxMbIYe9Pw2YQonxWlL'),
	(30, 'clientes@fgupm.upm.es', '["ROLE_CLIENTES"]', '$argon2id$v=19$m=65536,t=4,p=1$UkhvaEVMalJxSS9UWld1Tw$1UyrYj/XhpaLKw+zKbgSyjCD/LcVcxPWIM3zxb3KroY', 'CLIENTES', 'CLIENTES', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzA2Nzg1OTMsImV4cCI6MTYzMDcyODU5Mywicm9sZXMiOlsiUk9MRV9DTElFTlRFUyIsIlJPTEVfVVNFUiJdLCJ1c2VybmFtZSI6ImNsaWVudGVzQGZndXBtLnVwbS5lcyJ9.i1lOuWesZdUPScpMhT8n8oFa-ew3kEnos4ME7fKYJIEMwxJU_I9cfcst5W00R5QkJc6slU7woy3cdQ7Ywz7IptylZVUautMNfJL5u0QgDfjnZLCYnlMGPmZ8Fe03cmpEF_bbU3oZA6Ck3k6u52n29Q6NBtgZbxYRu-x6tvzNXL1MiQEpB_HYk9IxhHLueQ6N_4fbQqyo2daOdp_qlzBv7naBT4-PGCf_ILjvBXZN2FddTBa5_7zD3lD9YHEk7MM79SFI1bw4TBfP4gFoRJ_IC0PiUfO9_ILDWMKHN5U6A-4xBjE1DxUM73HY-jWAWL'),
	(31, 'freddy.tandazo@fgupm.upm.es_0303:0909:2121 0202:0909:2525', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$THl1Y0xXVFc2cDcwbmxKOA$RNoSQqWd7wx+QtP5QMBPHYkn2CcY6Qy2ZQNgA+GvSg0', 'Freddy Alex', 'Tandazo Yanez', NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
