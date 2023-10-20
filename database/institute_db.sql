-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-10-2023 a las 16:40:15
-- Versión del servidor: 8.0.30
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `institute_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posicion` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`id`, `img`, `posicion`, `created_at`, `updated_at`) VALUES
(1, '1697817407_1.jpg', 1, '2023-10-20 15:56:47', '2023-10-20 15:56:47'),
(2, '1697817772_2.webp', 2, '2023-10-20 16:02:52', '2023-10-20 16:02:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `nombre_sistema`, `alias`, `dir`, `actividad`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'INSTITUTE', 'INSTITUTE', 'LOS OLIVOS', 'ACTIVIDAD', 'logo.png', NULL, '2023-10-07 23:21:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id` bigint UNSIGNED NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mapa` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`id`, `direccion`, `fono1`, `fono2`, `correo`, `mapa`, `created_at`, `updated_at`) VALUES
(1, 'SHOPPING VIZUR CALLE MARISCAL SANTA CRUZ Y CALLE ARENALES CASTEA N° 20', '+591 63326803', '+591 64312163', 'info@tomorrowstoday.com', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d15302.44340797871!2d-68.13196529479978!3d-16.495230895308648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.497514656468287!2d-68.12797416816427!5e0!3m2!1ses-419!2sbo!4v1697748242821!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '2023-10-20 15:40:45', '2023-10-20 15:48:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA CONFIGURACIÓN', 'id: 1<br/>nombre_sistema: INSTITUTE<br/>alias: INSTITUTE<br/>dir: LOS OLIVOS<br/>actividad: ACTIVIDAD<br/>logo: logo.png<br/>created_at: <br/>updated_at: <br/>', 'id: 1<br/>nombre_sistema: INSTITUTE2<br/>alias: INSTITUTE2<br/>dir: <br/>actividad: ACTIVIDAD2<br/>logo: logo.png<br/>created_at: <br/>updated_at: 2023-10-07 19:12:16<br/>', 'CONFIGURACIÓN', '2023-10-07', '19:12:16', '2023-10-07 23:12:16', '2023-10-07 23:12:16'),
(2, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA CONFIGURACIÓN', 'id: 1<br/>nombre_sistema: INSTITUTE2<br/>alias: INSTITUTE2<br/>dir: <br/>actividad: ACTIVIDAD2<br/>logo: logo.png<br/>created_at: <br/>updated_at: 2023-10-07 19:12:16<br/>', 'id: 1<br/>nombre_sistema: INSTITUTE2<br/>alias: INSTITUTE2<br/>dir: LOS OLIVOS<br/>actividad: ACTIVIDAD2<br/>logo: logo.png<br/>created_at: <br/>updated_at: 2023-10-07 19:12:22<br/>', 'CONFIGURACIÓN', '2023-10-07', '19:12:22', '2023-10-07 23:12:22', '2023-10-07 23:12:22'),
(3, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA CONFIGURACIÓN', 'id: 1<br/>nombre_sistema: INSTITUTE2<br/>alias: INSTITUTE2<br/>dir: LOS OLIVOS<br/>actividad: ACTIVIDAD2<br/>logo: logo.png<br/>created_at: <br/>updated_at: 2023-10-07 19:12:22<br/>', 'id: 1<br/>nombre_sistema: INSTITUTE<br/>alias: INSTITUTE<br/>dir: LOS OLIVOS<br/>actividad: ACTIVIDAD<br/>logo: logo.png<br/>created_at: <br/>updated_at: 2023-10-07 19:21:32<br/>', 'CONFIGURACIÓN', '2023-10-07', '19:21:32', '2023-10-07 23:21:32', '2023-10-07 23:21:32'),
(4, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: juan@gmail.com<br/>fono: <br/>password: $2Y$10$WNPWSR5VJP4QDQWGO18CXU20H4BUXUXRQ.YMZNJYHAVXGZTW3NUO.<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:33:20<br/>', NULL, 'USUARIOS', '2023-10-07', '19:33:20', '2023-10-07 23:33:20', '2023-10-07 23:33:20'),
(5, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: juan@gmail.com<br/>fono: <br/>password: $2Y$10$WNPWSR5VJP4QDQWGO18CXU20H4BUXUXRQ.YMZNJYHAVXGZTW3NUO.<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:33:20<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: <br/>password: <br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:35:13<br/>', 'USUARIOS', '2023-10-07', '19:35:13', '2023-10-07 23:35:13', '2023-10-07 23:35:13'),
(6, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: <br/>password: <br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:35:13<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: <br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:35:16<br/>', 'USUARIOS', '2023-10-07', '19:35:16', '2023-10-07 23:35:16', '2023-10-07 23:35:16'),
(7, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: <br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:35:16<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: 123456<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:36:09<br/>', 'USUARIOS', '2023-10-07', '19:36:09', '2023-10-07 23:36:09', '2023-10-07 23:36:09'),
(8, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: 123456<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:36:09<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: <br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:37:02<br/>', 'USUARIOS', '2023-10-07', '19:37:02', '2023-10-07 23:37:02', '2023-10-07 23:37:02'),
(9, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: <br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:37:02<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$ZFBKc72z/fKAplfV04LJW.Iz8Nqsp69iuJEcXMsBMejpeB8I/WjIe<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:37:05<br/>', 'USUARIOS', '2023-10-07', '19:37:05', '2023-10-07 23:37:05', '2023-10-07 23:37:05'),
(10, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$ZFBKc72z/fKAplfV04LJW.Iz8Nqsp69iuJEcXMsBMejpeB8I/WjIe<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:37:05<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$19xXBL3YXjgx5TrAJLmpdevKW5tN4oTKOCalHGEvVM/eN3Ja0awyy<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:37:33<br/>', 'USUARIOS', '2023-10-07', '19:37:33', '2023-10-07 23:37:33', '2023-10-07 23:37:33'),
(11, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$19xXBL3YXjgx5TrAJLmpdevKW5tN4oTKOCalHGEvVM/eN3Ja0awyy<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:37:33<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: <br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:37:42<br/>', 'USUARIOS', '2023-10-07', '19:37:42', '2023-10-07 23:37:42', '2023-10-07 23:37:42'),
(12, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: <br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:37:42<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: <br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:37:42<br/>', 'USUARIOS', '2023-10-07', '19:37:58', '2023-10-07 23:37:58', '2023-10-07 23:37:58'),
(13, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: <br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:37:42<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$PyYyeiVACluSevqQ9FEOm.jLPw744pSMyVy3Ek7DwvDo/bveMFj4q<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:38:48<br/>', 'USUARIOS', '2023-10-07', '19:38:48', '2023-10-07 23:38:48', '2023-10-07 23:38:48'),
(14, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$PyYyeiVACluSevqQ9FEOm.jLPw744pSMyVy3Ek7DwvDo/bveMFj4q<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:38:48<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$PyYyeiVACluSevqQ9FEOm.jLPw744pSMyVy3Ek7DwvDo/bveMFj4q<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:38:48<br/>', 'USUARIOS', '2023-10-07', '19:38:55', '2023-10-07 23:38:55', '2023-10-07 23:38:55'),
(15, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$PyYyeiVACluSevqQ9FEOm.jLPw744pSMyVy3Ek7DwvDo/bveMFj4q<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:38:48<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$PyYyeiVACluSevqQ9FEOm.jLPw744pSMyVy3Ek7DwvDo/bveMFj4q<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:38:48<br/>', 'USUARIOS', '2023-10-07', '19:39:06', '2023-10-07 23:39:06', '2023-10-07 23:39:06'),
(16, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$PyYyeiVACluSevqQ9FEOm.jLPw744pSMyVy3Ek7DwvDo/bveMFj4q<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:38:48<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$PyYyeiVACluSevqQ9FEOm.jLPw744pSMyVy3Ek7DwvDo/bveMFj4q<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 0<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:39:10<br/>', 'USUARIOS', '2023-10-07', '19:39:10', '2023-10-07 23:39:10', '2023-10-07 23:39:10'),
(17, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN USUARIO', 'id: 3<br/>usuario: maria@gmail.com<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: maria@gmail.com<br/>fono: <br/>password: $2y$10$bd0rITfeftm3JW7h.vktRO7406W9Mykg1X2dukizhYvjqZfrzQsTi<br/>tipo: AUXILIAR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:47:44<br/>updated_at: 2023-10-07 19:47:44<br/>', NULL, 'USUARIOS', '2023-10-07', '19:47:44', '2023-10-07 23:47:44', '2023-10-07 23:47:44'),
(18, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 3<br/>usuario: maria@gmail.com<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: maria@gmail.com<br/>fono: <br/>password: $2y$10$bd0rITfeftm3JW7h.vktRO7406W9Mykg1X2dukizhYvjqZfrzQsTi<br/>tipo: AUXILIAR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:47:44<br/>updated_at: 2023-10-07 19:47:44<br/>', 'id: 3<br/>usuario: maria@gmail.com<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: MARIA@GMAIL.COM<br/>fono: <br/>password: $2y$10$bd0rITfeftm3JW7h.vktRO7406W9Mykg1X2dukizhYvjqZfrzQsTi<br/>tipo: AUXILIAR<br/>foto: default.png<br/>acceso: 0<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:47:44<br/>updated_at: 2023-10-20 11:18:50<br/>', 'USUARIOS', '2023-10-20', '11:18:50', '2023-10-20 15:18:50', '2023-10-20 15:18:50'),
(19, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 3<br/>usuario: maria@gmail.com<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: MARIA@GMAIL.COM<br/>fono: <br/>password: $2y$10$bd0rITfeftm3JW7h.vktRO7406W9Mykg1X2dukizhYvjqZfrzQsTi<br/>tipo: AUXILIAR<br/>foto: default.png<br/>acceso: 0<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:47:44<br/>updated_at: 2023-10-20 11:18:50<br/>', 'id: 3<br/>usuario: maria@gmail.com<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: MARIA@GMAIL.COM<br/>fono: <br/>password: $2y$10$bd0rITfeftm3JW7h.vktRO7406W9Mykg1X2dukizhYvjqZfrzQsTi<br/>tipo: AUXILIAR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:47:44<br/>updated_at: 2023-10-20 11:19:04<br/>', 'USUARIOS', '2023-10-20', '11:19:04', '2023-10-20 15:19:04', '2023-10-20 15:19:04'),
(20, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA SECCIÓN CONTACTOS', 'id: 1<br/>direccion: SHOPPING VIZUR CALLE MARISCAL SANTA CRUZ Y CALLE ARENALES CASTEA N° 20<br/>fono1: +591 63326803<br/>fono2: +591 64312163<br/>correo: info@tomorrowstoday.com<br/>mapa: <iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d15302.44340797871!2d-68.13196529479978!3d-16.495230895308648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.497514656468287!2d-68.12797416816427!5e0!3m2!1ses-419!2sbo!4v1697748242821!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe><br/>created_at: 2023-10-20 11:40:45<br/>updated_at: 2023-10-20 11:40:45<br/>', NULL, 'CONTACTOS', '2023-10-20', '11:40:45', '2023-10-20 15:40:45', '2023-10-20 15:40:45'),
(21, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA SECCIÓN CONTACTOS', 'id: 1<br/>direccion: SHOPPING VIZUR CALLE MARISCAL SANTA CRUZ Y CALLE ARENALES CASTEA N° 20<br/>fono1: +591 63326803<br/>fono2: +591 64312163<br/>correo: info2@tomorrowstoday.com<br/>mapa: <iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d15302.44340797871!2d-68.13196529479978!3d-16.495230895308648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.497514656468287!2d-68.12797416816427!5e0!3m2!1ses-419!2sbo!4v1697748242821!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe><br/>created_at: 2023-10-20 11:40:45<br/>updated_at: 2023-10-20 11:48:45<br/>', NULL, 'CONTACTOS', '2023-10-20', '11:48:45', '2023-10-20 15:48:45', '2023-10-20 15:48:45'),
(22, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA SECCIÓN CONTACTOS', 'id: 1<br/>direccion: SHOPPING VIZUR CALLE MARISCAL SANTA CRUZ Y CALLE ARENALES CASTEA N° 20<br/>fono1: +591 63326803<br/>fono2: +591 64312163<br/>correo: info@tomorrowstoday.com<br/>mapa: <iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d15302.44340797871!2d-68.13196529479978!3d-16.495230895308648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.497514656468287!2d-68.12797416816427!5e0!3m2!1ses-419!2sbo!4v1697748242821!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe><br/>created_at: 2023-10-20 11:40:45<br/>updated_at: 2023-10-20 11:48:53<br/>', NULL, 'CONTACTOS', '2023-10-20', '11:48:53', '2023-10-20 15:48:53', '2023-10-20 15:48:53'),
(23, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN BANNER', 'id: 1<br/>img: 1697817407_1.jpg<br/>posicion: 1<br/>created_at: 2023-10-20 11:56:47<br/>updated_at: 2023-10-20 11:56:47<br/>', NULL, 'BANNERS', '2023-10-20', '11:56:47', '2023-10-20 15:56:47', '2023-10-20 15:56:47'),
(24, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN BANNER', 'id: 2<br/>img: 1697817772_2.webp<br/>posicion: 1<br/>created_at: 2023-10-20 12:02:52<br/>updated_at: 2023-10-20 12:02:52<br/>', NULL, 'BANNERS', '2023-10-20', '12:02:52', '2023-10-20 16:02:52', '2023-10-20 16:02:52'),
(25, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN BANNER', 'id: 2<br/>img: 1697817772_2.webp<br/>posicion: 1<br/>created_at: 2023-10-20 12:02:52<br/>updated_at: 2023-10-20 12:02:52<br/>', 'id: 2<br/>img: 1697817772_2.webp<br/>posicion: 2<br/>created_at: 2023-10-20 12:02:52<br/>updated_at: 2023-10-20 12:02:57<br/>', 'BANNERS', '2023-10-20', '12:02:57', '2023-10-20 16:02:57', '2023-10-20 16:02:57'),
(26, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA SECCIÓN REDES SOCIALES', 'id: 1<br/>tiktok: https://www.tiktok.com/es/<br/>facebook: https://www.facebook.com/<br/>instagram: https://www.instagram.com/<br/>youtube: https://www.youtube.com<br/>created_at: 2023-10-20 12:05:51<br/>updated_at: 2023-10-20 12:05:51<br/>', NULL, 'REDES SOCIALES', '2023-10-20', '12:05:51', '2023-10-20 16:05:51', '2023-10-20 16:05:51'),
(27, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA SECCIÓN REDES SOCIALES', 'id: 1<br/>tiktok: https://www.tiktok.com/es/<br/>facebook: https://www.facebook.com/<br/>instagram: https://www.instagram.com/<br/>youtube: https://www.youtube.com/<br/>created_at: 2023-10-20 12:05:51<br/>updated_at: 2023-10-20 12:06:07<br/>', NULL, 'REDES SOCIALES', '2023-10-20', '12:06:07', '2023-10-20 16:06:07', '2023-10-20 16:06:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000002_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2022_10_13_132625_create_configuracions_table', 1),
(4, '2023_08_26_190801_create_historial_accions_table', 1),
(5, '2023_09_28_182536_create_banners_table', 1),
(6, '2023_09_28_182841_create_red_socials_table', 1),
(7, '2023_10_20_110138_create_contactos_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_socials`
--

CREATE TABLE `red_socials` (
  `id` bigint UNSIGNED NOT NULL,
  `tiktok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `red_socials`
--

INSERT INTO `red_socials` (`id`, `tiktok`, `facebook`, `instagram`, `youtube`, `created_at`, `updated_at`) VALUES
(1, 'https://www.tiktok.com/es/', 'https://www.facebook.com/', 'https://www.instagram.com/', 'https://www.youtube.com/', '2023-10-20 16:05:51', '2023-10-20 16:06:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('ADMINISTRADOR','AUXILIAR','PROFESOR','ESTUDIANTE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceso` int NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombre`, `paterno`, `materno`, `dir`, `correo`, `fono`, `password`, `tipo`, `foto`, `acceso`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', 'admin', 'admin', NULL, '', 'admin@gmail.com', NULL, '$2y$10$RrCZZySOwPej2gMFWsrjMe6dLzfaL5Q88h4J75I1FesEBRNPwq1x.', 'ADMINISTRADOR', NULL, 1, '2023-10-05', NULL, NULL),
(2, 'juan@gmail.com', 'JUAN', 'PERES', 'MAMANI', 'LOS OLIVOS', 'JUAN@GMAIL.COM', '7777777', '$2y$10$PyYyeiVACluSevqQ9FEOm.jLPw744pSMyVy3Ek7DwvDo/bveMFj4q', 'ADMINISTRADOR', 'default.png', 1, '2023-10-07', '2023-10-07 23:33:20', '2023-10-07 23:39:10'),
(3, 'maria@gmail.com', 'MARIA', 'MAMANI', 'MAMANI', 'LOS OLIVOS', 'MARIA@GMAIL.COM', '', '$2y$10$bd0rITfeftm3JW7h.vktRO7406W9Mykg1X2dukizhYvjqZfrzQsTi', 'AUXILIAR', 'default.png', 1, '2023-10-07', '2023-10-07 23:47:44', '2023-10-20 15:19:04');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `red_socials`
--
ALTER TABLE `red_socials`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`),
  ADD UNIQUE KEY `users_correo_unique` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `red_socials`
--
ALTER TABLE `red_socials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
