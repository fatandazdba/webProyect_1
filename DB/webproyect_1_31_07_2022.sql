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

-- Volcando datos para la tabla webproyect_1.doctrine_migration_versions: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
REPLACE INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20210901145147', '2021-09-01 14:52:28', 587),
	('DoctrineMigrations\\Version20210903150356', '2021-09-03 15:04:32', 628),
	('DoctrineMigrations\\Version20210903150824', '2021-09-03 15:09:52', 1395),
	('DoctrineMigrations\\Version20210915104732', '2021-09-15 10:50:10', 1086);
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

-- Volcando estructura para tabla webproyect_1.refresh_tokens
CREATE TABLE IF NOT EXISTS `refresh_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refresh_token` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9BACE7E1C74F2195` (`refresh_token`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla webproyect_1.refresh_tokens: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `refresh_tokens` DISABLE KEYS */;
REPLACE INTO `refresh_tokens` (`id`, `refresh_token`, `username`, `valid`) VALUES
	(2, 'b3aebe26dc380984329cc709552134bf7178692d2c81e4ed21ac8acdcd64a8df719c73e29747d41c0ef6525791fa1a5930879fed7351e1dee0595123b86b864b', 'user@fgupm.upm.es', '2021-10-15 11:22:06'),
	(3, '160a481fe1ff02ceb628b1c57170c55350d077ce0e13805894eac7fe1285bdb0f5eeb659bd6566ef5ac14c870871c09b2a8a970961bab1965472ff4349d6a02e', 'freddy.tandazo@fgupm.upm.es', '2021-10-15 11:31:36'),
	(4, 'fb2db7eff5a73bb7cb3e2adfc70cb62ec03c9212ec440943883132592cff10b769abb39a77a31c1ebe525ee27f185c06a61f3be72f8b9f8f28f858353b17a7be', 'freddy.tandazo@fgupm.upm.es', '2021-10-15 15:36:37'),
	(5, '04659b21a53c2afaad0e6cfe1d04c716545e2ca46ac7f320866f324c2ae4580fc1c566effe2806fc76be1c0948737c94820b25208a0d6cdb34a4e7bdbc80f486', 'user@fgupm.upm.es', '2021-10-15 15:37:46'),
	(6, '0c9edd510bf9a09ac3bd3c3aaf8e94b22347691f21d52f720291079a511bd189b5fce2dec1f73aa7aa3559e6d2a6b0bd77713f4b277e47a21f87a353ea945d5a', 'user@fgupm.upm.es', '2021-10-15 16:27:02'),
	(8, '61c4686e200e8b3d363a82d81e8af9e1db407d19822aba7e02e351cb646af095ce9307f0435f0ab191defa5101dde6568f11f94d0fb429e8f8169a8f0fbb5684', 'clientes@fgupm.upm.es', '2021-10-15 16:31:20'),
	(9, '26d1f725d9f5cb9a53ed6ad47ec7c2a5170f5ba2159a01d25d2ef0584915b69d75090e7b732b2e67483d7d520a51cbcf66bf99149dc3f65fe9a781b56c3e6715', 'clientes@fgupm.upm.es', '2021-10-15 16:41:58'),
	(11, '2aeb568841fa9063793b640cdbe870a6c2c3ae8cdd9d5e2ad6052f262b51cdab65f9510de73bc2214733332507a6e62464f27c7bb5e49a24c71d71a39e992fcc', 'clientes@fgupm.upm.es', '2021-09-15 18:44:18'),
	(13, 'aede1daa4b97b000d65ec12192e800841ea58254f699ed45dad6c28e99e9d0208658ae0a00901abec000be7840f3eb3fc906f292d2e38cf0ec5e69f3f48cecf4', 'clientes@fgupm.upm.es', '2021-09-15 18:45:08'),
	(14, 'b3377c9e227a77f0437eddfc05c9a6ce373b36e2e7ff09f44661310e746de28da5937072b190efe7ef5c82d3d10aa6c67ca240a263fe26a917248564466aad49', 'clientes@fgupm.upm.es', '2021-09-15 18:50:24'),
	(15, '7842b8b6f1e3db014c4c0a240dcadfe0c1633a4328c8614a2ef168ab75958be32c7d46f8d66298ba6eadce66da9c3e37f2a46e4a68ccafa91aea3ebcdfda811f', 'clientes@fgupm.upm.es', '2021-09-15 18:50:20'),
	(16, '4aa2e25c0dff0f96d986eb27c73cbe286c64b3b3695a7b903e4d156eb292d42bffffaf1df66581a05c6940e7bafde4568e02e433a3f8b714760664d776d103bf', 'clientes@fgupm.upm.es', '2021-09-15 16:54:37');
/*!40000 ALTER TABLE `refresh_tokens` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla webproyect_1.user: ~31 rows (aproximadamente)
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
	(60, 'freddy.tandazo@fgupm.upm.es_0606:0909:2121 0909:0909:4444', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$NnVhTE1oUVc2MEJuRVhDcw$GLNOxFeJrL24njfhzYN+EY99NNuwSu03g2xOqFbedjA', 'Freddy Alex', 'Tandazo Yanez', NULL, NULL),
	(61, 'BBB@fgupm.upm.es0606:0909:2121 0909:0909:1111', '["ROLE_APIUPM"," ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$MldadWI4L1p4LmNScmxzMQ$dFsC38xLn9//Pr1xgHJ7eNWOkpc8U5EcVKgrbLr4zk8', 'BBB', 'BBB', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzA5NjM5OTIsImV4cCI6MTYzMTAxMzk5Miwicm9sZXMiOlsiUk9MRV9BUElVUE0iLCIgUk9MRV9VU0VSIiwiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiQkJCQGZndXBtLnVwbS5lczA2MDY6MDkwOToyMTIxIDA5MDk6MDkwOToxMTExIn0.OX85irB3aQF0l9ERKL_owKJVnm5_7nR3xhJyHTKn4T_cMaEt-0dq12SCg9lzApbh0k018VzYhCzqllUfB2YKJEraPwJLDndWjlpTqDHHwopo3n32pOwNo9d-5mSEnK4fz3EeuJLBAd6sx3tFjln-pZyjP7qpH7OEAP8Y_BqRRA5n6kUHMPWokm2ZgxaVzh36DacqoY7isam4EoDIaAolDmwjZ6RpiDTfSY-cuIYlri3rarufagRtpGm9l2BhmNDtSGTjStVo5DvYTQV'),
	(62, 'BBB@fgupm.upm.es0707:0909:2121 0909:0909:4343', '["ROLE_APIUPM"," ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$UlB1dVlTci9QTmxhcGx2Rg$dIO+puhs1JuxthZCjGZk4MB0Js74CVHiVh55PgAHB5A', 'BBB', 'BBB', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzEwMDU4NDMsImV4cCI6MTYzMTA1NTg0Mywicm9sZXMiOlsiUk9MRV9BUElVUE0iLCIgUk9MRV9VU0VSIiwiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiQkJCQGZndXBtLnVwbS5lczA3MDc6MDkwOToyMTIxIDA5MDk6MDkwOTo0MzQzIn0.t3cXR3Fvfzka-woZscin4FyFguyPUAc2ee9rJWNkDWLlldJiOw8fwhwpIVx1AdnKKOCh7vvkjdi1fDRSPQTKndffhQp7DbtKx-UBjvss1ALmcq9To4lKNh-I96UMkchraTXFNLdJ7sEJlNVvAGVPeaSBqXP7IevBiRDjKPabz019G_7HfgA67Y8MFaFxLfJjVTELYWRTYmikBS_fiQHa0uop7Ow3i2ZRRfesVjBWVo0RnSP8x289OTXl0Otn0zFhw8V4hzvJ99OrZZ3'),
	(63, 'freddy.tandazo@fgupm.upm.es_0707:0909:2121 0909:0909:5151', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$T3RNd3J6Y2NLOUxwTlRpVg$XRbUaR384ZOqYFGnMFV8VDJdmgifNlTc82oD+fp4L5Q', 'Freddy Alex', 'Tandazo Yanez', NULL, NULL),
	(65, 'freddy.tandazo@fgupm.upm.es_0707:0909:2121 0909:0909:5252', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$ZG5DNThSS084dXBVdXEydg$By7QPGHbGZvBmomUxvIJ9ZElhHVT2z75iFLLVN68qLk', 'Freddy Alex', 'Tandazo Yanez', NULL, NULL),
	(91, 'BBB@fgupm.upm.es1515:0909:2121 0303:0909:5757', '["ROLE_APIUPM"," ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$Li90Y3V3ZEI1cTE5REI0UQ$3nw8L4h6Axc015KpeT6Zzw0UyRPGTNgwf8Knrg2PKhk', 'BBB', 'BBB', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3MjA4NzcsImV4cCI6MTYzMTc3MDg3Nywicm9sZXMiOlsiUk9MRV9BUElVUE0iLCIgUk9MRV9VU0VSIiwiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiQkJCQGZndXBtLnVwbS5lczE1MTU6MDkwOToyMTIxIDAzMDM6MDkwOTo1NzU3In0.h8maGfWUP8E6HK4fkDqt3qanbM3l8UbjQuXQFxwEsWX4a2LtB5V8M4u4KnwTMl3yahtNuy7S1qfh7Eos7dHd4KT0rcYlExZbFWBm12nHQDjZrqx6Boe1Ej985YM_xEepgqbE6al8ox5BI26AfJghFWG6si6ok4JqK_KWWmBA3N1Qh3amn21ymmOxFQq38_WHjH2tnIbIH13tQQk2MehX3yrV5vQo1cB6OKEZoJXdCiBlP0MzaPkDx8X4NK38jT09cqHFG0Nd1T41E9j'),
	(92, 'freddy.tandazo@fgupm.upm.es_1515:0909:2121 0303:0909:3636', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$bDdHMm5KS2FJN2QzWTg3Sg$6ibPSP27BUhUjST5QiZf/VFifMb2K4szC90gsy01WmY', 'Freddy Alex', 'Tandazo Yanez', NULL, NULL),
	(104, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 1212:0909:0909', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$U1V6NW9CUC5BL0k2V1hjSg$rBIvzIYSOSPrmCmJqladQVzb6tF1xmjwohmbLFP98VQ', 'frtandazo.bec@acciona.com', 'Tandazo', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTYwMDksImV4cCI6MTYzMTc5NjA2OSwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMTIxMjowOTA5OjA5MDkifQ.FqKze1qdORJgv4_B0oIIPUqsFxHjrsY7wxTIBJK6LbEWcTs76F40iqrw_n10jLm6txwlglW753iSkrGrpltvu0ZLMtiTQjrhJW06jXAbarL1ELqzq_usBlZF5DaXJw-COgtXmD15MMGT1qsvJGIwJcUUO-fHD5zKF65nf2FsuWAkvCtI_WCvq2jQvB21FY31hPez-hIHzea-nOjui0lxXV1PkRo13cF8Pu07vl6_HAHs-xLJpoh3l97DfvnGuHfssahVTpkJHVAlf5mjCKLkf4h_bLwBKsyJ'),
	(105, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 1212:0909:4747', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$MHpYQ2R3Y1hySVFhUkJSbw$8w0JmIafkxXJ+FZHzXjJOHdgeapC5mXzkv+PrZlxMrc', 'frtandazo.bec@acciona.com', 'Tandazo', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTYwNDcsImV4cCI6MTYzMTc5NjEwNywicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMTIxMjowOTA5OjQ3NDcifQ.qYEoyZ2_nyES9w27bT-0HXjgxANLzwsjJbMmproS_n35RIAzVJYiYFoS1_pN7zHa-PfNSqg6bExOr-cwYiUBMUZz5KiPcBqHP-O6btplKF4iPYhzDiuO6wi3ByEGKVI3z8dW-t1L2HzZlIUiMjMyYa6vnwr_vnQjQ09NI9lQnuFrF0-Y1IuB8UZfDgW3xvpBPu-upCVnAMz50u6zqvVxzQV042B80emc5DB4hMI1gGYd_9reXMpt4rGgAUyN-07n9Jk_xWMb6XIsrPEusr6ExrKl_B2N476n'),
	(106, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 1212:0909:4545', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$T1BJNkl1M2RFbVZLVENqbw$11gmh8BJHPP7rpL8mTqpGFuqKWlapNPEY7tfU/Ky7LQ', 'frtandazo.bec@acciona.com', 'Tandazo', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTY0MDUsImV4cCI6MTYzMTc5NjQ2NSwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMTIxMjowOTA5OjQ1NDUifQ.qgC5unEI8ebDTzTykAZ0rwq3RCcPfMUhMVymsm8zrcW-56riTV_8eGq_C_ZJj6rIIwOolaVDfnGHkhB52NYvcITJAF5p4SiJfizmEfokuHNVGAVai4uaN_MQhr_AhjRCoi0F9ab1EUPofwjkbAIBqRjg3AZKUGfnhAu7VyXjIeTr-2Ozi3E1swRUDQw4uuTLqtgiuvetXaEf7EPq7anCMgeSvK6aFBCFM-xmUhrzxIH_itL3eR1xtO3T7xZCwuAwvz4n6F47FkqPrsTp56_slDwhv6c0nfKN'),
	(107, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 1212:0909:0404', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$cWdvUEFkQnE2TVBkczRoLw$QZa2bf/IiRgpaTzjbXM5HwPc0y2By+fXNOvnPQtADVc', 'frtandazo.bec@acciona.com', '1234', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTY2MDQsImV4cCI6MTYzMTc5NjY2NCwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMTIxMjowOTA5OjA0MDQifQ.ejfHTPWe2gDarwAjjzC5jre-AAM36bR0YPwXGs0WliaK1Rn9M7jI52hkAhkfYku9bi8Zui5M-NeapTuceSCIQ0kBHqNwrIPBL3QomimNggTry92pbYKyurvs2UzGaVcqxf8TuB-9Ji5X4USLPa2Wl_S2LVYNxjyxB_u0g1WTiz9pUZzoLZv9uSC9OTkNSAfRpBmi80__vEuiIyjMvJnCZyyUUSVgPqJ_yJzZNYlXVbe6jWXriGoP21iFUUqGK_R_HnV_KIwf8spUX4L4h734wwuwcTEZsthD'),
	(108, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 1212:0909:3535', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$bWFQUWluWE9IMUthNVNBZg$xz5LOEeuYSUmf5gyK20JxD1yYEbd1cF7EUr1CSPfk00', 'frtandazo.bec@acciona.com', '1234', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTY2MzUsImV4cCI6MTYzMTc5NjY5NSwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMTIxMjowOTA5OjM1MzUifQ.WVx6CU1OxPmqHelsHDQXStlVKQlV7GUSB5tb47gSsS70BpO21rXqtcXG429f9G3pyyGyfnxP-tlD0fRFKRbxx0zmhqvvxKMUVfsrj0y1bqRgUsO1z_PRsgUl-8bmo4fCPcjv2jlGLAF0VHxroEZ24NdTCZTCLnPExrx4m8Wnkd_xczPhUO3REWhXK1xbAMCfr_E45_Ch4NfQhHsL7KzijVb_jTFj7Y_l_NEDYSENJ8rbsTCpm7U3p6QAS8Yx2oGUKUSNuHJuCTOFU1kcAm3x4RgIrHDxGkCe'),
	(109, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 1212:0909:4444', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$bWtLV2Rab0dRY29YanQ2WA$PRtuZerryCFtsjFRvSFeqPx2x2ocDjai1MLicOj2+Ok', 'frtandazo.bec@acciona.com', '1234', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTY2NDQsImV4cCI6MTYzMTc5NjcwNCwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMTIxMjowOTA5OjQ0NDQifQ.NH1nrYW1-2ooEQae3BklUZMZ4syEOUEEenPjZkRRKJe_ZH8dH8BSObDLIpklGQgqFHDZvnKOZl__F0bt4DXuGqCktONw0pudRCHQES2O-y1j-MbJmDDDAiI6fWIL8U4Ib0oVOKS7EUx7h6fnveFu0pP0SYiHoah3aD1Npkpw_oM5x76h8MI-s0GsQLAeMczLjSVrVgxyjvPPRIMax20lpCV_qPySLrDcJ6m7UohESWVURGlpjrBrkZGU8oAI6aLmMOGOlzPCdVFnJwV4rdNDW6CabAC1meDI'),
	(110, 'freddy.tandazo@motorflash.com1616:0909:2121 1212:0909:5454', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$SUs5S2ZCMWhweER4MG9aVw$gbTrntDi/Yoe8jbXau2NER/3xN/CN7fsHOWXhKVGRpo', 'frtandazo.bec@acciona.com', '1234', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTY2NTQsImV4cCI6MTYzMTc5NjcxNCwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem9AbW90b3JmbGFzaC5jb20xNjE2OjA5MDk6MjEyMSAxMjEyOjA5MDk6NTQ1NCJ9.MJKSvjkxQO3-ZJlalp98F6uNRMthDk5yzhuWSR1-I8nVFe1exBu6n8_GHJAE49-jNK3EIruc9xQIZTcmmoo5WprW-qwNg07xIvDESUkw6-JkUcwtO0lt-Ti0ZB-0Hrbf2M7HlqV-ikk-GhaOufqXTurDfA_rEe-Jmi4FTh-sRYu2Kqs2XPu154maVQsgvonEToFTsu_cNO58xsyOqU0S8HsnF8QrpUX_reRs4-iPdNTNaUDAcLN2bQJHy4jE3ez0waW_S5wFuItCijxkL6Xbu0VjOvZ00fv6-5'),
	(112, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 1212:0909:1313', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$Q0JJM0w5cDJWSklWL3ZaVA$yQvouD0i711HtcW3KNDiq0De6liX3xuzzMfeo2seGfQ', 'frtandazo.bec@acciona.com', '1234', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTcwMzMsImV4cCI6MTYzMTc5NzA5Mywicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMTIxMjowOTA5OjEzMTMifQ.LS3e1vYaIeboagfIBgLhx-exYeFB41edUgXzXrqI9rPS1UHt0izVdU3FQSqoHJTnkIZKPcgiamaWQmS0aLB1lxkXqex51TrZ-X2uIOvlnib_XhAym29ScQ8haO92H3tzAlc7v5Wdbwj7xdlQsE84rJyTyKl8gAJqCvxzpeFCer2XXenrUHaT20aiIxc2-eH-gL_2QgT-P-PM_1sZLtTTKxrw7HjImx_-Lg75Yl2U9RLSTockjpYBBnT1IB_hLHbMOj0Rg8cVSbI8wxcpRWsayPBAubw9W3w6'),
	(113, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 0101:0909:5555', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$c3FJQVF0dHFvdlBEQmZyLw$V1u7bpNkyVTdOp8dviwsDAOgn3xD4beyWLp/bBh6/TE', 'frtandazo.bec@acciona.com', '1234', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTc0OTUsImV4cCI6MTYzMTc5NzU1NSwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMDEwMTowOTA5OjU1NTUifQ.N8Ob33jrpuUq7djhKVSWOsOqiTBl8fy8mWu-uvtB-tJ5AXGUR3hZ6HLBBF7uUeLs0dnshDKRicr8pinWVaaZ7gLaM9gWooBgOgR0OU--RaOneoXks-ATRR5Os7qXKHTcYLyEke7CLSRx2DdHrweMyqejuxwusnsIF5o5bBlwT2txscZA-wNpJOuJcDtKN0HifPVS9K71lmcWyyltxilrd-C70rPgUAajK0GBAkWat4BweLgbZnjV82ADQ0ngeUq5UQqH5gKMIQxZp40NtX4bf5o5dKLY1f89'),
	(114, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 0101:0909:0505', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$MnR4cmNiWi9ra2IxUy9sMw$l8XMGz/fWKGjtnwHBI08u0agxoPE0YYBRzSVl+QtzIs', 'frtandazo.bec@acciona.com', '1234', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTgyMjUsImV4cCI6MTYzMTc5ODI4NSwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMDEwMTowOTA5OjA1MDUifQ.MQQ3ev6gAuU8ewrbxqwNDFAxZsMkzW4pCG41DpK7PrCW8PC2iFRNvPOAG9ztfiBJQLMRLgHLtwHQDi0X-viZ4XTu2bIVMIlD706tHrMOrijL8s2FAh3hyQRW_R04Kdz3IujrrsLRcTHMVDBvR17EWG0xsnd5G_71nDIHnaEhV1XG1AsJGNKGP7VOUkZVEwwFF2WRyxOIf7-4FT2oJIFpL3pZskPf3MOiMGG6msh_w7T05tQcBr2Bm6abVcIAmjBWWAj5CaCKD5CtLi-eKBifJCW_TR1LdKSd'),
	(115, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 0101:0909:5959', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$c01QWGNhOFNTc3lVZWprSA$Yd7IYAkNjaJrWNQ7uPTmK1yFKo6BXEWZoAhyAKunAwo', 'frtandazo.bec@acciona.com', '1234', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTgzMzksImV4cCI6MTYzMTc5ODM5OSwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMDEwMTowOTA5OjU5NTkifQ.eyE6PY8SXDY0NbL7zPH7g2NSkNo_hpL6YBjOKplHxja9zxWsEFFn6eaLcJg3afO42YVAZSf0uK8zeG6ZfgZl27hiFXArFXSB52UF7y2KTmMe5A5ue7N4TKqha9C5cmBXogMEqO-Gk5XyKS_OFiEwY79oXvhzEpXxA9Xxs5g685j3JbqoLfhS34S_iAt0vAv1cr4TgSgy5vPAlRaiC_RlQuz0mm_JUVYCP6SPKgPmagAxFUUgPBPLhNS1QASiZj7JUfDx30KgO5ffIRKSOSVgZ25NdDJREget'),
	(116, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 0101:0909:2727', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$Vlc1SUFGbDFqT0QxODM4Ug$UzkmTV9BP0r+vp3XA/NGgl8IsW6O3P1BeI9pcFqJVFQ', 'frtandazo.bec@acciona.com', '1234', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTgzNjgsImV4cCI6MTYzMTc5ODQyOCwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMDEwMTowOTA5OjI3MjcifQ.aWzISdDvhXx-gV-mq3jJw8IvdTfFGJvRFva45-Uk1mzaOC58Wj0-PF8LW94ssClr0eRA97hXnC937tQrMtWsYdlqM3FGVcl1y7L17Oy7cPkhda39g8gwka60155Z9IYwcB8NhGuarQ-6t6edte4fzfEJ7HCaLwb7_8jIzuZXrpvfmwve1si3y6F2YqK6zpvf2RqV9WFsBJQLOTT2r6aqv_0OAN_78X-xM-it2RfajXSbxVPIoMop3b9h3Oi66aZluacPkdZ_Be7jsSUIv-fUoXxMdnttsLpY'),
	(117, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 0101:0909:5656', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$ODI1ck9MZEZqLm9ZQWo0RQ$AlYQUyVoVlU9207njay7ikvnINtaeAgrUHGFmp5N/DA', 'frtandazo.bec@acciona.com', '1234', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTgzOTcsImV4cCI6MTYzMTc5ODQ1Nywicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMDEwMTowOTA5OjU2NTYifQ.qcQRi6FLM5ibSn_NU1LsZ-xnPH0mWOjNsNtLLSLUsXb619Ks4X9NB8LUT1wXsODRYwZGMfeuBqUFSybk4PU6JOH_hzYXc8F3RsGBsYtLYnpaGpNHwpTmJewjHAbFlT8iSd6GvbN_2DTHEIdXmqL3UhhWggtdxqqWuXMtpuswFjTQrpgq3KQZxFtUMpDDDQC1u6ATvMGc9NS3eTGTyB1yruA6MzwrEXM2c8JahckPJT6JDeRM9c-gytPghfHnFVa_1k5N9fF4827meBdLkMWimv_PXoqEBHjq'),
	(118, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 0101:0909:0606', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$bnRJdUFVUzVkYi5hZXhXUg$BvSG3l/GT1tNHymwtp7QatT64G2d/X4fwxlPfiAKAQE', 'frtandazo.bec@acciona.com', '1234', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTg0MDYsImV4cCI6MTYzMTc5ODQ2Niwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMDEwMTowOTA5OjA2MDYifQ.Azu3QTh2qvq6oAdBjUQ0iyrsiAoc-GrzICmkb4KSveMVkPtRcpjLmCixbfxkQ3R1QIQ1HxIMaG4XPucHdHwzv7S9isq6nzBCQ-iqS74ykjctlN6AXDZxCt5UjCZ5nEYLZgbLxgL2u2f91TN5o0W2EBvzXBq-z3AOXLk3sfn65OxU2IfQNo1sUDBzKiiERh-4dEjX3VbgW3-juP2TPKAvE2nKq8ZlOQdTCJKxkWqfquveRMf7pFg1fZxsfka5rBOGwJDRCknNsa911wGmpkcr2ZWgsVlMAXmu'),
	(119, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 0101:0909:1818', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$a0JRT2xoNzRvM09tN0hwNw$ESqrvJ4Zkz3LHrhZ/ky+JgQLY2uehuHmZpdqTYtPJBM', 'frtandazo.bec@acciona.com', '1234', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTg0MTgsImV4cCI6MTYzMTc5ODQ3OCwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMDEwMTowOTA5OjE4MTgifQ.v8E6wXNZGzmsqBxFVvNHXRjax9390kFixYJUMFnabv1HP1RhMZr_aPbHJFFtbXmdK6B6vMY4Alp08WfrmZRlyeZ5MLhvF4sCQbRMY7Ngb15c1znhjf144RNguWjABS-V7aE3oRIE4K3LSFPC74pEmLsX6onnnja6TyP8zPitTQLtr-IZrljiVxz0yXbOsQgY3QhjDgNcyXrG7rPPFFSfaroK7oZOiJNM8rXxzvn41lYKlRrQlg714R48f0t11uhzcRNyK38-e0eA4Pe66IBjuqyMla4I4yl2'),
	(120, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 0101:0909:4747', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$aFVienk2VldxMHovWENEYw$xuZvpOY+76ewidhkQND90/Ovsckv1ZruV559vTSHg0k', 'frtandazo.bec@acciona.com', '1234', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTg0NDcsImV4cCI6MTYzMTc5ODUwNywicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMDEwMTowOTA5OjQ3NDcifQ.o4qfoh09tQXjzapa-qiTXZxWcKNpkKzE8ezIDxN-zfod6TQmeJBIpYLipTBPYNMQaJ6mtNcVLBW5DNZQiLrZLwWyt6hvtPjTlpzkx-8rgvXAN5tg2Okp07F8E_V4TPjs04-3IL1DhrEqJungt6_uVSmPB68ZE2MXV56a572t7D-kHEx_7y-RR2Q-AZWDsLiHLzB3jIrrOQGxOMk492jcgDA1nG_fJrBXH86HuWV21_JMiVSew_zx6bNYJqvlCXxTEL52apq0gvuVTS3uzPeevJW-LWGnRlqM'),
	(122, 'freddy.tandazo.yanez@gmail.com1616:0909:2121 0101:0909:1616', '["ROLE_USER"]', '$argon2id$v=19$m=65536,t=4,p=1$UEZXSXFsWWNQQUFKM29DbA$z24LY3DkBavnKYIGn3sXk0vfPjgzNukeW7rivrIm/Xw', 'frtandazo.bec@acciona.com', 'Tandazo', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MzE3OTg0NzYsImV4cCI6MTYzMTc5ODUzNiwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiZnJlZGR5LnRhbmRhem8ueWFuZXpAZ21haWwuY29tMTYxNjowOTA5OjIxMjEgMDEwMTowOTA5OjE2MTYifQ.M4Y_0rHUOdXVggRn8_F3ERFGAOyMmJHM-ObGAlBTsChxDiDOeWECiJijnq9z-KimMK9CQFmSzImzHfHemHmU1SHFATEUiY-CdJ7lQhxlgrQNUGRmcEKmoxwbvOFjj812guWOR0Tclw4mw5wznvLoF4DHKHQV-bWIF5MG8zLKG9YRpfbPiPkBQqdYsPdqb0khplAtFDs7uBe7-mHiiF6OzFyib3302iHQIxQ4_ClTGLB3lTdd-JfVhic-wYvVfWJkswcYzUO1zH8KT0lDOP0-1YOdWrFBtWQA');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
