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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla webproyect_1.user: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id`, `email`, `roles`, `password`, `name`, `last_name`, `birthday`, `token`) VALUES
	(1, 'freddy.tandazo@fgupm.upm.es', '["ROLE_ADMIN"]', '$argon2id$v=19$m=65536,t=4,p=1$UXpFTk5pdlZsUUl3RHFqNg$1rWJJlMu7PRL2xfXx3JbTLe0a09886gdtn/8JJr6Jgo', 'Freddy', 'Tandazo', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzA2NzA2NjMsImV4cCI6MTYzMDcyMDY2Mywicm9sZXMiOlsiUk9MRV9BRE1JTiIsIlJPTEVfVVNFUiJdLCJ1c2VybmFtZSI6ImZyZWRkeS50YW5kYXpvQGZndXBtLnVwbS5lcyJ9.BbQZafyRk7x5mNa0P9s4kIcl91kztvnmKMJEzibkNrXRxr4Cl6anbfB6NLIUEjqtvB1pwLxZgDOn_KOACcZvCEP_Dea2OsoA4Vr9cNViYh73aql2i0WTqpYGQm3D8LZtVgLGcA-Yb5aohtwnmycZZ1LkuxTzGujoQbZ9u5XP0rcpsp6wccqME2T4_wBQq2IUaMpFhUr-PpImwvUV9BxsUpW93b60clrd473VS9d-SjtgZwMPjUKZwfePZ2if2Tj5T_uNbGn9si51extu8fi-OnAbzT8tLeMBy1PM32JxRv77I_IUyzJuoxJNog'),
	(27, 'freddy.tandazo@fgupm.upm.es_0303:0909:2121 1212:0909:5050', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$LklHSVpuc0xmNWxaaDdMYw$WerZmc6MB3dEvzcpEaMYPULeiCDEDPMH1N/wUTW4cL4', 'Freddy Alex', 'Tandazo Yanez', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzEwMDMyOTEsImV4cCI6MTYzMTA1MzI5MSwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem9AZmd1cG0udXBtLmVzXzAzMDM6MDkwOToyMTIxIDEyMTI6MDkwOTo1MDUwIn0.0KhAj9Vwm7BXB9DRnObtWBA_wzjDIs2MheiXGSLMxuiNkTeez1GtAdH1tvRCdGKKy3BZM9Rt-gSRV9y6bZfL71NBq78cEDD5VyDo0qEthhQPgl77AHzBDI283cTfA-Ub-p2-WfTl7IAFoUJ_n-_egRrL-QWf1m7k7a6gPnj-J-xdCy9OUPf--xhOdRWnqCxagdgmFLOgarsWIfwrHCYvMOJEt9TZ0eh5JWVEWjvYulTpshcXCfpg6D7gKwc_WTC3O_XZ89LLzr0l6tWD3eVCPSl0-fixjDIklMI'),
	(28, 'user@fgupm.upm.es', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$M1pvTm0vYkpJeXJpSi9oRQ$HM4Nc4B79BAbniZVwTHVQkm2h49w38F8LrAf121Teaw', 'CORREO', 'CORREO', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzEwMDMzOTEsImV4cCI6MTYzMTA1MzM5MSwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoidXNlckBmZ3VwbS51cG0uZXMifQ.mUtOKjmmXHo3haDFOmZxUVb8qDSSP26Tp2frgmmqAc7b3kZfr46waB_WoVO58E9z-tz1QHnWgADVvgLXVpv6nKWV54qcwOAwkq8KNBw0iY53s0ILLSrq7Vlu_5nDqDRtEtSKsQHgx2mIkDztHTZzaB0jZRVZ4QkfLBP8unoAJ2DhEcFaussXngA3POt5zSqZXCfdw18meIsK9tukMGjP8EHbG_r0MuS0gksa6x2QE5c2hcwhzvxJVca3eFzltMf23Y3CYLIFtuNkyRb3zhaB9juMP52xU9ibIBfKipsT2HcKHYRLNTwavdOt5_Qfx3h9cYaIdwRK6Dk6_HQTVeCePQ'),
	(29, 'chatbot@fgupm.upm.es', '["ROLE_CHATBOT"]', '$argon2id$v=19$m=65536,t=4,p=1$UGZJMjRzb1hUZElYS0FLbQ$w2ICor89uBrvqvsz799wHNcKJp7eQ6LoYh9FBcixMuM', 'CHATBOT', 'CHATBOT', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzA2NzkxMjQsImV4cCI6MTYzMDcyOTEyNCwicm9sZXMiOlsiUk9MRV9DSEFUQk9UIiwiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiY2hhdGJvdEBmZ3VwbS51cG0uZXMifQ.hTIiOSBe_kOXbAJiE6E-L4BkALtRI0E0O-nfUIFCubuHnH0qMST1fN1X8GRa54x5Tm1w9kBJndNTvNN2xvIscXVqhyO42fYb6GB9HOH-sO8_cn4XcQ34PatCosadWm9kOehmmPoH8aebPcw8YowOM1Y6B5kkMfJ53W1pymlzTlFLvU6-tYs6feOtK1juIwrH-PoNp7-qpSMxKhn2v_DbxKli3JoPZm1789N1vNxvCPbLLYlPhvvkc6ap7VTCsshjmFTgcJWAFizy6XfVroBUnFSU4sdFQIcX-38y4aVCEf_alAxMbIYe9Pw2YQonxWlL'),
	(30, 'clientes@fgupm.upm.es', '["ROLE_CLIENTES"]', '$argon2id$v=19$m=65536,t=4,p=1$UkhvaEVMalJxSS9UWld1Tw$1UyrYj/XhpaLKw+zKbgSyjCD/LcVcxPWIM3zxb3KroY', 'CLIENTES', 'CLIENTES', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzA2Nzg1OTMsImV4cCI6MTYzMDcyODU5Mywicm9sZXMiOlsiUk9MRV9DTElFTlRFUyIsIlJPTEVfVVNFUiJdLCJ1c2VybmFtZSI6ImNsaWVudGVzQGZndXBtLnVwbS5lcyJ9.i1lOuWesZdUPScpMhT8n8oFa-ew3kEnos4ME7fKYJIEMwxJU_I9cfcst5W00R5QkJc6slU7woy3cdQ7Ywz7IptylZVUautMNfJL5u0QgDfjnZLCYnlMGPmZ8Fe03cmpEF_bbU3oZA6Ck3k6u52n29Q6NBtgZbxYRu-x6tvzNXL1MiQEpB_HYk9IxhHLueQ6N_4fbQqyo2daOdp_qlzBv7naBT4-PGCf_ILjvBXZN2FddTBa5_7zD3lD9YHEk7MM79SFI1bw4TBfP4gFoRJ_IC0PiUfO9_ILDWMKHN5U6A-4xBjE1DxUM73HY-jWAWL'),
	(31, 'freddy.tandazo@fgupm.upm.es_0303:0909:2121 0202:0909:2525', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$THl1Y0xXVFc2cDcwbmxKOA$RNoSQqWd7wx+QtP5QMBPHYkn2CcY6Qy2ZQNgA+GvSg0', 'Freddy Alex', 'Tandazo Yanez', NULL, NULL),
	(45, 'AAA@fgupm.upm.es0404:0909:2121 0909:0909:2020', '["ROLE_USER"]', 'NO_ENCRYPT', 'AAA', 'AAA', NULL, NULL),
	(52, 'BBB@fgupm.upm.es0606:0909:2121 0909:0909:2727', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$T04zendDZGRFcVNEVmhyYQ$4eEK5sDA3E9xFa1uX3mYsTv4wcLmvIx2YSqO2vnfgow', 'BBB', 'BBB', NULL, NULL),
	(53, 'freddy.tandazo@fgupm.upm.es_0606:0909:2121 1111:0909:0808', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$djRLd2V2MmFBbXZ4YzhwNQ$hpPB3E2vjnkKjAXhGQ99kFIOKrHaFc2uLm6B3kMRLBs', 'Freddy Alex', 'Tandazo Yanez', NULL, NULL),
	(54, 'BBB@fgupm.upm.es0606:0909:2121 0101:0909:0707', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$bE1LeWNNY2h4VDUzVlRWcA$1oqr9oOobB6sHDSqq3k0mmk646dOZec1wXhk7d63BbE', 'BBB', 'BBB', NULL, NULL),
	(55, 'BBB@fgupm.upm.es0606:0909:2121 0303:0909:5050', '["ROLE_APIUPM"," ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$b3RSVVZqWnRZRmxsUDJJeg$t69yVpJTkTeAjydnx60TPJ4/1R5fr3OFDpea0UgCezk', 'BBB', 'BBB', NULL, NULL),
	(56, 'BBB@fgupm.upm.es0606:0909:2121 0808:0909:5757', '["ROLE_APIUPM"," ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$dmRmQWRGbmRCVlpET3g3cw$xq5VKk6XY7fJ6dEhB57svpi1M9x1WwQf0ygqZ+xHWqQ', 'BBB', 'BBB', NULL, NULL),
	(57, 'BBB@fgupm.upm.es0606:0909:2121 0808:0909:3838', '["ROLE_APIUPM"," ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$cWNoL3BvclFkOURYUWMxMg$FAl0xH5WCRgR7VOdet9L8JwYvajUJY+4ybcNmt0yw04', 'BBB', 'BBB', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzA5NjE5NzgsImV4cCI6MTYzMTAxMTk3OCwicm9sZXMiOlsiUk9MRV9BUElVUE0iLCIgUk9MRV9VU0VSIiwiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiQkJCQGZndXBtLnVwbS5lczA2MDY6MDkwOToyMTIxIDA4MDg6MDkwOTozODM4In0.gu3b5-6kArB45pEky45ZsjPHO5rBENU_KfRvgF66-WfsS_VFl1_rhyXGIv0QCMCz8Jpfh_43fJQ970FmV5VIklOmFO7ZlhsqXF4hUXOprf8Yv6zynzGRLmpXey_aBXwpzBcPD3miXsiHG_9fCD-2zwCVTag0mXiDnBtbe7ZLbMW2bG83GbDx3UHSz_rK_nCnP3HfCrvL5AkEb1ukrkjCv-uR_PACt9wpI7uYuK5jf5qZLKZG8Ica9_Bxf5mYIcesoZVrb5_ki5lKAem'),
	(58, 'BBB@fgupm.upm.es0606:0909:2121 0909:0909:0909', '["ROLE_APIUPM"," ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$T2d1cEdacGFuTnZndnpmaw$74UbMynqVCZXMbDEP4dXd1BJxixRF8S3gHNxJp9gSK8', 'BBB', 'BBB', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzA5NjIzMTAsImV4cCI6MTYzMTAxMjMxMCwicm9sZXMiOlsiUk9MRV9BUElVUE0iLCIgUk9MRV9VU0VSIiwiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiQkJCQGZndXBtLnVwbS5lczA2MDY6MDkwOToyMTIxIDA5MDk6MDkwOTowOTA5In0.gPnEYrm2qIvzF0rjyCxMDwtwjZKNY8Go81TVpcktO2z0ywTc8jc45edIp3S4k8ICC9e9z2PpXYboS2MnFxz8FW8H2HHXT-o83Hn6AgxKrah1XflxS2PS_jYK0oe7GF0wJfe_y8SCfX2NNGQD1byeD4n0KxLJfSHB4C8elhQzMBR42pNEPXEokfj8USAV9DqUBdKYTXU9EktWhqaamslJY40FupVMQkRc7QuyaqKdvtob0AWYgkcriDzIwOqZCY4PkF2hV_wDbt4MvBw'),
	(59, 'freddy.tandazo@fgupm.upm.es_0606:0909:2121 0909:0909:2929', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$bkpLYlAxSlFURHplZmtrdg$ETl30IbalwRQuj5iXxqe06OHlBebYdXh/t8GEU1zYhc', 'Freddy Alex', 'Tandazo Yanez', NULL, NULL),
	(60, 'freddy.tandazo@fgupm.upm.es_0606:0909:2121 0909:0909:4444', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$NnVhTE1oUVc2MEJuRVhDcw$GLNOxFeJrL24njfhzYN+EY99NNuwSu03g2xOqFbedjA', 'Freddy Alex', 'Tandazo Yanez', NULL, NULL),
	(61, 'BBB@fgupm.upm.es0606:0909:2121 0909:0909:1111', '["ROLE_APIUPM"," ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$MldadWI4L1p4LmNScmxzMQ$dFsC38xLn9//Pr1xgHJ7eNWOkpc8U5EcVKgrbLr4zk8', 'BBB', 'BBB', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzA5NjM5OTIsImV4cCI6MTYzMTAxMzk5Miwicm9sZXMiOlsiUk9MRV9BUElVUE0iLCIgUk9MRV9VU0VSIiwiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiQkJCQGZndXBtLnVwbS5lczA2MDY6MDkwOToyMTIxIDA5MDk6MDkwOToxMTExIn0.OX85irB3aQF0l9ERKL_owKJVnm5_7nR3xhJyHTKn4T_cMaEt-0dq12SCg9lzApbh0k018VzYhCzqllUfB2YKJEraPwJLDndWjlpTqDHHwopo3n32pOwNo9d-5mSEnK4fz3EeuJLBAd6sx3tFjln-pZyjP7qpH7OEAP8Y_BqRRA5n6kUHMPWokm2ZgxaVzh36DacqoY7isam4EoDIaAolDmwjZ6RpiDTfSY-cuIYlri3rarufagRtpGm9l2BhmNDtSGTjStVo5DvYTQV');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
