-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-11-2023 a las 17:39:01
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
-- Estructura de tabla para la tabla `asignacion_grupos`
--

CREATE TABLE `asignacion_grupos` (
  `id` bigint UNSIGNED NOT NULL,
  `grupo_id` bigint UNSIGNED NOT NULL,
  `inscripcion_id` bigint UNSIGNED NOT NULL,
  `inscripcion_solicitud_id` bigint UNSIGNED NOT NULL,
  `curso_id` bigint UNSIGNED NOT NULL,
  `calificacion` double(8,2) DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDIENTE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asignacion_grupos`
--

INSERT INTO `asignacion_grupos` (`id`, `grupo_id`, `inscripcion_id`, `inscripcion_solicitud_id`, `curso_id`, `calificacion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 7, NULL, 'PENDIENTE', '2023-11-04 21:17:52', '2023-11-21 16:55:50'),
(2, 1, 4, 5, 7, 90.00, 'APROBÓ', '2023-11-07 13:58:37', '2023-11-21 17:06:54'),
(3, 2, 3, 4, 1, NULL, 'PENDIENTE', '2023-11-07 13:58:53', '2023-11-07 13:58:53'),
(4, 4, 2, 2, 3, NULL, 'PENDIENTE', '2023-11-07 14:07:55', '2023-11-18 22:49:45'),
(5, 2, 7, 9, 1, NULL, 'PENDIENTE', '2023-11-19 17:36:45', '2023-11-19 17:36:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `posicion` int NOT NULL,
  `titulo` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`id`, `img`, `posicion`, `titulo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '1698252099_1.png', 1, 'Tomorrow\'s Today', 'Descripción imagen 1', '2023-10-20 15:56:47', '2023-11-18 22:26:28'),
(2, '1698252105_2.png', 2, NULL, NULL, '2023-10-20 16:02:52', '2023-11-18 22:30:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunicados`
--

CREATE TABLE `comunicados` (
  `id` bigint UNSIGNED NOT NULL,
  `grupo_id` bigint UNSIGNED NOT NULL,
  `titulo` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comunicados`
--

INSERT INTO `comunicados` (`id`, `grupo_id`, `titulo`, `descripcion`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(2, 3, 'COMUNICADO DESDE USUARIO PROFESOR', 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM. TOMAR NOTA', '2023-11-07', '16:46:00', '2023-11-07 20:46:28', '2023-11-07 20:46:28'),
(3, 1, 'COMUNIDO GRUPO 1', 'COMUNICADO DESDE USE PROFESOR', '2023-11-10', '14:30:00', '2023-11-10 18:30:08', '2023-11-10 18:30:08'),
(4, 3, 'COMUNICADO GRUPO 3', 'DESC. COMUNICADO', '2023-11-10', '14:39:00', '2023-11-10 18:39:35', '2023-11-10 18:39:35'),
(5, 6, 'COMUNICADO GRUPO 5', 'COMUNICADO 5', '2023-11-10', '14:40:00', '2023-11-10 18:40:14', '2023-11-10 18:40:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Estructura de tabla para la tabla `configuracion_gestorias`
--

CREATE TABLE `configuracion_gestorias` (
  `id` bigint UNSIGNED NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mapa` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracion_gestorias`
--

INSERT INTO `configuracion_gestorias` (`id`, `direccion`, `fono1`, `fono2`, `correo`, `mapa`, `created_at`, `updated_at`) VALUES
(1, 'SHOPPING VIZUR CALLE MARISCAL SANTA CRUZ Y CALLE ARENALES CASTEA N° 22', '+591 66666666', '', 'infogestoria@tomorrowstoday.com', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d5409.403545726189!2d-68.11048986981962!3d-16.524788557606783!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.52559586873182!2d-68.1078194457513!5e0!3m2!1ses-419!2sbo!4v1698085176811!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '2023-10-23 18:13:52', '2023-11-03 15:40:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id` bigint UNSIGNED NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mapa` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`id`, `direccion`, `fono1`, `fono2`, `correo`, `mapa`, `created_at`, `updated_at`) VALUES
(1, 'SHOPPING VIZUR CALLE MARISCAL SANTA CRUZ Y CALLE ARENALES CASTEA N° 20', '+591 63326803', '+591 64312163', 'info@tomorrowstoday.com', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d15302.44340797871!2d-68.13196529479978!3d-16.495230895308648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.497514656468287!2d-68.12797416816427!5e0!3m2!1ses-419!2sbo!4v1697748242821!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '2023-10-20 15:40:45', '2023-10-23 16:58:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `imagen`, `descripcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'INGLÉS NIVEL 0', NULL, 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.', '2023-10-25', '2023-10-25 16:19:34', '2023-10-25 16:19:34'),
(2, 'INGLÉS NIVEL 1', '1698251059_2.jpg', 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.', '2023-10-25', '2023-10-25 16:20:29', '2023-10-25 16:24:19'),
(3, 'INGLÉS NIVEL 2', '1698251110_3.jpg', 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.', '2023-10-25', '2023-10-25 16:25:02', '2023-10-25 16:25:10'),
(4, 'CURSO #4', NULL, 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.', '2023-10-25', '2023-10-25 16:25:18', '2023-10-25 16:25:18'),
(5, 'CURSO #5', NULL, 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.', '2023-10-25', '2023-10-25 16:25:22', '2023-10-25 16:25:22'),
(6, 'CURSO #6 MODIFICADO TEXTO LARGO', NULL, 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.', '2023-10-25', '2023-10-25 16:25:27', '2023-10-25 16:40:23'),
(7, 'CURSO #7', NULL, 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.', '2023-10-25', '2023-10-25 16:27:19', '2023-10-25 16:27:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enunciado_preguntas`
--

CREATE TABLE `enunciado_preguntas` (
  `id` bigint UNSIGNED NOT NULL,
  `examen_enunciado_id` bigint UNSIGNED NOT NULL,
  `pregunta` varchar(700) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opciones` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `enunciado_preguntas`
--

INSERT INTO `enunciado_preguntas` (`id`, `examen_enunciado_id`, `pregunta`, `tipo`, `opciones`, `created_at`, `updated_at`) VALUES
(2, 2, 'Tengo diecisiete años. modificado', 'LLENADO', NULL, '2023-11-06 21:31:29', '2023-11-06 22:02:03'),
(4, 3, 'Martes _', 'SELECCIÓN', 'tuesday, thurdsay', '2023-11-06 21:31:29', '2023-11-06 21:31:29'),
(7, 2, 'pregunta #2 nuevo', 'LLENADO', NULL, '2023-11-06 22:02:03', '2023-11-06 22:02:03'),
(8, 3, 'miercoles _', 'SELECCIÓN', 'miercoles', '2023-11-06 22:02:03', '2023-11-06 22:02:03'),
(9, 6, 'pregunta nuevo enunciado', 'LLENADO', NULL, '2023-11-06 22:02:03', '2023-11-06 22:02:03'),
(10, 7, 'Mi nombre es John', 'LLENADO', NULL, '2023-11-07 14:41:22', '2023-11-07 14:41:22'),
(11, 7, 'Tengo diecisiete años', 'LLENADO', NULL, '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(12, 8, '1 _', 'LLENADO INTERMEDIO', NULL, '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(13, 8, '2 _', 'LLENADO INTERMEDIO', NULL, '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(14, 9, 'lunes _', 'SELECCIÓN', 'monday, manday', '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(15, 9, 'martes _', 'SELECCIÓN', 'tuesday, thursday', '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(16, 10, 'the bus arrives _ london _ six o\'clock', 'LLENADO DOBLE INTERMEDIO CON OPCIONES', 'at, on, in', '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(17, 11, 'choose the correct one:', 'ELIGE UNA OPCIÓN', 'My brothers\' car is very nice, My brother\'s car is very nice, My brothers car is very nice', '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(18, 12, 'i don´t understand _ you say. Could your repeat it?', 'LLENADO INTERMEDIO CON OPCIONES', 'that, what, which', '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(19, 13, 'monday _', 'LLENADO INTERMEDIO', NULL, '2023-11-10 18:35:18', '2023-11-10 18:35:18'),
(20, 14, 'hoy es lunes', 'LLENADO', NULL, '2023-11-10 18:35:18', '2023-11-10 18:35:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio_correos`
--

CREATE TABLE `envio_correos` (
  `id` bigint UNSIGNED NOT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'smtp.gmail.com',
  `puerto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '465',
  `encryptado` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ssl',
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'smtp',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `envio_correos`
--

INSERT INTO `envio_correos` (`id`, `host`, `puerto`, `encryptado`, `correo`, `nombre`, `password`, `driver`, `created_at`, `updated_at`) VALUES
(1, 'smtp.hostinger.com', '587', 'tls', 'web@emsytsrl.com', 'Institute', '10-Co20re30oS', 'smtp', '2023-11-08 16:26:26', '2023-11-21 17:31:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_enunciados`
--

CREATE TABLE `examen_enunciados` (
  `id` bigint UNSIGNED NOT NULL,
  `examen_nivelacion_id` bigint UNSIGNED NOT NULL,
  `enunciado` varchar(700) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `examen_enunciados`
--

INSERT INTO `examen_enunciados` (`id`, `examen_nivelacion_id`, `enunciado`, `tipo`, `created_at`, `updated_at`) VALUES
(2, 2, 'Traduce las siguiente soraciones al inglés modificado', 'LLENADO', '2023-11-06 21:31:29', '2023-11-06 22:02:03'),
(3, 2, 'Elige el día de la semana correcto', 'SELECCIÓN', '2023-11-06 21:31:29', '2023-11-06 21:31:29'),
(6, 2, 'nuevo enunciado', 'LLENADO', '2023-11-06 22:02:03', '2023-11-06 22:02:03'),
(7, 4, 'Traduce las siguiente oraciones al ingles', 'LLENADO', '2023-11-07 14:41:22', '2023-11-07 14:41:22'),
(8, 4, 'Escribe los siguientes números en inglés', 'LLENADO INTERMEDIO', '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(9, 4, 'elige el día de la semana correcto', 'SELECCIÓN', '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(10, 4, 'selecciona la opcion correcta', 'LLENADO DOBLE INTERMEDIO CON OPCIONES', '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(11, 4, 'Seleccione la opcion correcta', 'ELIGE UNA OPCIÓN', '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(12, 4, 'selecciona la palabra que correspanda', 'LLENADO INTERMEDIO CON OPCIONES', '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(13, 5, 'traduce los días', 'LLENADO INTERMEDIO', '2023-11-10 18:35:18', '2023-11-10 18:35:18'),
(14, 5, 'Tuesday _', 'LLENADO', '2023-11-10 18:35:18', '2023-11-10 18:35:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_nivelacions`
--

CREATE TABLE `examen_nivelacions` (
  `id` bigint UNSIGNED NOT NULL,
  `curso_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `examen_nivelacions`
--

INSERT INTO `examen_nivelacions` (`id`, `curso_id`, `created_at`, `updated_at`) VALUES
(2, 7, '2023-11-06 21:31:29', '2023-11-06 21:31:29'),
(4, 3, '2023-11-07 14:41:22', '2023-11-07 14:41:22'),
(5, 1, '2023-11-10 18:35:18', '2023-11-10 18:35:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestoria_banners`
--

CREATE TABLE `gestoria_banners` (
  `id` bigint UNSIGNED NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `posicion` int NOT NULL,
  `titulo` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gestoria_banners`
--

INSERT INTO `gestoria_banners` (`id`, `img`, `posicion`, `titulo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '1698252229_1.webp', 1, 'TÍTULO IMAGEN 1 GESTORÍA', 'DESCRIPCIÓN IMAGEN 1', '2023-10-23 17:32:58', '2023-11-18 22:32:05'),
(2, '1698252254_2.jpg', 2, NULL, NULL, '2023-10-23 17:34:03', '2023-10-25 16:44:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestoria_nosotros`
--

CREATE TABLE `gestoria_nosotros` (
  `id` bigint UNSIGNED NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gestoria_nosotros`
--

INSERT INTO `gestoria_nosotros` (`id`, `descripcion`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 'Somos Gestores<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br />\r\nLorem ipsum dolor sit amet.', '1698252640_1.png', '2023-10-23 17:45:35', '2023-11-03 15:38:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestoria_servicios`
--

CREATE TABLE `gestoria_servicios` (
  `id` bigint UNSIGNED NOT NULL,
  `turismo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trabajo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estudiantes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `renovacion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mensaje_servicio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gestoria_servicios`
--

INSERT INTO `gestoria_servicios` (`id`, `turismo`, `trabajo`, `estudiantes`, `renovacion`, `mensaje_servicio`, `created_at`, `updated_at`) VALUES
(2, 'Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Turismo', 'Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Trabajo', 'Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Estudiantes', 'Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Renovación', '“VERIFICA SI ES VIABLE TU CASO PARA OBTENER TU VISA DE ESTADOS UNIDOS POR TAN SÓLO 100BS”', '2023-10-23 18:02:40', '2023-11-02 22:03:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestoria_solicituds`
--

CREATE TABLE `gestoria_solicituds` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `edad` int NOT NULL,
  `nacionalidad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `familiares_eeuu` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentesco` text COLLATE utf8mb4_unicode_ci,
  `familiar_deportado` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivo` text COLLATE utf8mb4_unicode_ci,
  `deportado_otro_pais` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivo_otro_pais` text COLLATE utf8mb4_unicode_ci,
  `antecedentes_penales` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_antecedentes` text COLLATE utf8mb4_unicode_ci,
  `estudios` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `trabajo_actual` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `solicito_visa` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivo_rechazo` text COLLATE utf8mb4_unicode_ci,
  `cuenta_bancaria` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gana_aproximadamente` decimal(24,2) NOT NULL,
  `redes_sociales` text COLLATE utf8mb4_unicode_ci,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recomendado_por` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_solicitud` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gestoria_solicituds`
--

INSERT INTO `gestoria_solicituds` (`id`, `codigo`, `nombres`, `apellidos`, `fecha_nac`, `edad`, `nacionalidad`, `estado`, `sexo`, `fono`, `familiares_eeuu`, `parentesco`, `familiar_deportado`, `motivo`, `deportado_otro_pais`, `motivo_otro_pais`, `antecedentes_penales`, `desc_antecedentes`, `estudios`, `trabajo_actual`, `solicito_visa`, `motivo_rechazo`, `cuenta_bancaria`, `gana_aproximadamente`, `redes_sociales`, `correo`, `recomendado_por`, `estado_solicitud`, `created_at`, `updated_at`) VALUES
(1, 'S.1', 'CARLOS', 'MARTINEZ MARTINEZ', '2000-01-01', 23, 'BOLIVIANO', '', 'HOMBRE', '7777777', 'SI', 'HERMANOS', 'SI', 'MOTIVO DEPORTACIÓN', 'SI', 'MOTIVO DEPORTACIÓN OTRO PAÍS', 'OTRO', 'DESCRIPCIÓN DE ANTECEDENTES OTRO', 'LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS', 'TRABAJO ACTUAL', 'SI', 'MOTIVO RECHAZO SOLICITUD', 'SI', 10000.00, 'HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM', 'carlosm@gmail.com', 'LO VI EN FACEBOOK', 'ATENDIDO', '2023-11-02 22:45:56', '2023-11-10 17:48:02'),
(2, 'S.2', 'JORGE LUIS', 'MARTINEZ MARTINEZ', '2003-03-03', 20, 'BOLIVIANO', 'LA PAZ', 'HOMBRE', '7888888', 'NO', '', 'NO', '', 'NO', '', 'NO', '', 'LIC. EN ECONOMIA', 'AUXILIAR CONTABLE', 'NO', '', 'SI', 9000.00, 'HTTPS://WWW.YOUTUBE.COM', 'jorgeluis@gmail.com', 'LO VI EN TIKTOK', 'PENDIENTE', '2023-11-08 20:11:41', '2023-11-08 20:11:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestoria_tips`
--

CREATE TABLE `gestoria_tips` (
  `id` bigint UNSIGNED NOT NULL,
  `titulo` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gestoria_tips`
--

INSERT INTO `gestoria_tips` (`id`, `titulo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '¿QUÉ HACER EN UNA ENTREVISTA?', 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.\r\nNUEVA LINEA', '2023-11-02 23:08:39', '2023-11-02 23:18:51'),
(2, '¿CÓMO RESPONDER EN LA ENTREVISTA?', 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT', '2023-11-02 23:09:54', '2023-11-02 23:25:38'),
(3, '¿CÓMO PREPARARTE?', 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT', '2023-11-02 23:10:07', '2023-11-02 23:25:35'),
(4, '¿QUÉ HACER EN UNA ENTREVISTA?', 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT', '2023-11-02 23:10:30', '2023-11-02 23:25:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `link_reunion` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`id`, `nombre`, `descripcion`, `link_reunion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'GRUPO #1', 'DESCRIPCION GRUPO #1', NULL, 'ACTIVO', '2023-11-03 16:06:11', '2023-11-03 16:06:11'),
(2, 'GRUPO #2', 'GRUPO DE PRUEBA', NULL, 'ACTIVO', '2023-11-05 18:10:19', '2023-11-05 18:11:28'),
(3, 'GRUPO 3', 'GRUPO #3', 'https://www.youtube.com/', 'ACTIVO', '2023-11-07 14:07:23', '2023-11-07 21:11:17'),
(4, 'GRUPO #4', 'DESC 4', NULL, 'ACTIVO', '2023-11-10 01:50:24', '2023-11-10 01:50:24'),
(6, 'GRUPO #5', 'DESC5', NULL, 'ACTIVO', '2023-11-10 17:42:08', '2023-11-10 17:42:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_profesors`
--

CREATE TABLE `grupo_profesors` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `profesor_id` bigint UNSIGNED NOT NULL,
  `grupo_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `grupo_profesors`
--

INSERT INTO `grupo_profesors` (`id`, `user_id`, `profesor_id`, `grupo_id`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 1, '2023-11-06 15:30:18', '2023-11-06 15:33:33'),
(2, 10, 2, 2, '2023-11-07 14:00:56', '2023-11-07 14:00:56'),
(3, 11, 3, 3, '2023-11-07 14:07:30', '2023-11-07 14:07:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_recursos`
--

CREATE TABLE `grupo_recursos` (
  `id` bigint UNSIGNED NOT NULL,
  `grupo_id` bigint UNSIGNED NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `grupo_recursos`
--

INSERT INTO `grupo_recursos` (`id`, `grupo_id`, `titulo`, `link`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'LECTURA #1', 'https://www.youtube.com', '2023-11-06', '12:12:00', '2023-11-06 16:12:13', '2023-11-06 16:31:22'),
(2, 2, 'TITULO 2', 'https://www.facebook.com/', '2023-11-06', '12:24:00', '2023-11-06 16:24:06', '2023-11-06 16:24:06'),
(3, 1, 'RECURSO #2', 'https://www.facebook.com/', '2023-11-07', '10:01:00', '2023-11-07 14:01:20', '2023-11-07 14:01:20'),
(4, 3, 'RECURSO #1 GRUPO 3', 'https://www.instagram.com/', '2023-11-07', '10:33:00', '2023-11-07 14:33:55', '2023-11-07 14:33:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(27, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA SECCIÓN REDES SOCIALES', 'id: 1<br/>tiktok: https://www.tiktok.com/es/<br/>facebook: https://www.facebook.com/<br/>instagram: https://www.instagram.com/<br/>youtube: https://www.youtube.com/<br/>created_at: 2023-10-20 12:05:51<br/>updated_at: 2023-10-20 12:06:07<br/>', NULL, 'REDES SOCIALES', '2023-10-20', '12:06:07', '2023-10-20 16:06:07', '2023-10-20 16:06:07'),
(28, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ EL COMUNICADO DE LA PÁGINA DE INICIO DEL PORTAL', 'created_at: 2023-10-23 12:30:30<br/>descripcion: PROGRAMA DE INGLÉS INTENSIVO\nAPRENDE EL IDIOMA INGLÉS DE FORMA ESTRUCTURADA Y EFECTIVA.\nEN BEI, TRABAJAMOS CONTIGO PARA DESARROLLAR TUS HABILIDADES Y MEJORAR TU DOMINIO DEL IDIOMA INGLÉS PARA QUE PUEDAS TENER MÁS ÉXITO EN LA VIDA.\n¡ESTUDIANTE F-1 BIENVENIDOS!\nPRUEBA TEXTO<br/>id: 1<br/>updated_at: 2023-10-23 12:30:30<br/>', NULL, 'COMUNICADO PORTAL', '2023-10-23', '12:30:30', '2023-10-23 16:30:30', '2023-10-23 16:30:30'),
(29, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ EL COMUNICADO DE LA PÁGINA DE INICIO DEL PORTAL', 'created_at: 2023-10-23 12:30:51<br/>descripcion: Programa de inglés intensivo\nAprende el idioma inglés de forma estructurada y efectiva.\nEn BEI, trabajamos contigo para desarrollar tus habilidades y mejorar tu dominio del idioma inglés para que puedas tener más éxito en la vida.\n¡Estudiante F-1 bienvenidos!\nTexto de prueba<br/>id: 1<br/>updated_at: 2023-10-23 12:30:51<br/>', NULL, 'COMUNICADO PORTAL', '2023-10-23', '12:30:51', '2023-10-23 16:30:51', '2023-10-23 16:30:51'),
(30, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ EL COMUNICADO DE LA PÁGINA DE INICIO DEL PORTAL', 'created_at: 2023-10-23 12:30:51<br/>descripcion: Programa de inglés intensivo<br />\nAprende el idioma inglés de forma estructurada y efectiva.<br />\nEn BEI, trabajamos contigo para desarrollar tus habilidades y mejorar tu dominio del idioma inglés para que puedas tener más éxito en la vida.<br />\n¡Estudiante F-1 bienvenidos!<br />\nTexto de prueba<br/>id: 1<br/>updated_at: 2023-10-23 12:34:07<br/>', NULL, 'COMUNICADO PORTAL', '2023-10-23', '12:34:07', '2023-10-23 16:34:07', '2023-10-23 16:34:07'),
(31, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ EL COMUNICADO DE LA PÁGINA DE INICIO DEL PORTAL', 'created_at: 2023-10-23 12:30:51<br/>descripcion: Programa de inglés intensivo<br />\nAprende el idioma inglés de forma estructurada y efectiva.<br />\nEn BEI, trabajamos contigo para desarrollar tus habilidades y mejorar tu dominio del idioma inglés para que puedas tener más éxito en la vida.<br />\n¡Estudiante F-1 bienvenidos!<br />\nTexto de prueba<br/>id: 1<br/>updated_at: 2023-10-23 12:34:07<br/>', NULL, 'COMUNICADO PORTAL', '2023-10-23', '12:40:36', '2023-10-23 16:40:36', '2023-10-23 16:40:36'),
(32, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ EL COMUNICADO DE LA PÁGINA DE INICIO DEL PORTAL', 'created_at: 2023-10-23 12:30:51<br/>descripcion: Programa de inglés intensivo<br />\nAprende el idioma inglés de forma estructurada y efectiva.<br />\nEn BEI, trabajamos contigo para desarrollar tus habilidades y mejorar tu dominio del idioma inglés para que puedas tener más éxito en la vida.<br />\n¡Estudiante F-1 bienvenidos!<br />\nTexto de prueba<br />\notro texto de prueba<br/>id: 1<br/>updated_at: 2023-10-23 12:41:36<br/>', NULL, 'COMUNICADO PORTAL', '2023-10-23', '12:41:36', '2023-10-23 16:41:36', '2023-10-23 16:41:36'),
(33, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ EL COMUNICADO DE LA PÁGINA DE INICIO DEL PORTAL', 'created_at: 2023-10-23 12:30:51<br/>descripcion: Programa de inglés intensivo<br />\nAprende el idioma inglés de forma estructurada y efectiva.<br />\nEn BEI, trabajamos contigo para desarrollar tus habilidades y mejorar tu dominio del idioma inglés para que puedas tener más éxito en la vida.<br />\n¡Estudiante F-1 bienvenidos!<br />\nTexto de prueba<br />\notro texto de prueba<br/>id: 1<br/>updated_at: 2023-10-23 12:41:36<br/>', NULL, 'COMUNICADO PORTAL', '2023-10-23', '12:42:07', '2023-10-23 16:42:07', '2023-10-23 16:42:07'),
(34, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ EL COMUNICADO DE LA PÁGINA DE INICIO DEL PORTAL', 'created_at: 2023-10-23 12:30:51<br/>descripcion: Programa de inglés intensivo<br />\nAprende el idioma inglés de forma estructurada y efectiva.<br />\nEn BEI, trabajamos contigo para desarrollar tus habilidades y mejorar tu dominio del idioma inglés para que puedas tener más éxito en la vida.<br />\n¡Estudiante F-1 bienvenidos!<br/>id: 1<br/>updated_at: 2023-10-23 12:42:21<br/>', NULL, 'COMUNICADO PORTAL', '2023-10-23', '12:42:21', '2023-10-23 16:42:21', '2023-10-23 16:42:21'),
(35, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ EL COMUNICADO DE LA PÁGINA DE INICIO DEL PORTAL', 'created_at: 2023-10-23 12:30:51<br/>descripcion: Programa de inglés intensivo<br />\nAprende el idioma inglés de forma estructurada y efectiva.<br />\nEn BEI, trabajamos contigo para desarrollar tus habilidades y mejorar tu dominio del idioma inglés para que puedas tener más éxito en la vida.<br />\n¡Estudiante F-1 bienvenidos!<br/>id: 1<br/>updated_at: 2023-10-23 12:42:21<br/>', NULL, 'COMUNICADO PORTAL', '2023-10-23', '12:42:33', '2023-10-23 16:42:33', '2023-10-23 16:42:33'),
(36, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN BANNER', 'created_at: 2023-10-20 12:02:52<br/>id: 2<br/>img: 1697817772_2.webp<br/>posicion: 2<br/>updated_at: 2023-10-20 12:02:57<br/>', 'created_at: 2023-10-20 12:02:52<br/>id: 2<br/>img: 1698080276_2.webp<br/>posicion: 2<br/>updated_at: 2023-10-23 12:57:56<br/>', 'BANNERS', '2023-10-23', '12:57:56', '2023-10-23 16:57:56', '2023-10-23 16:57:56'),
(37, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ EL COMUNICADO DE LA PÁGINA DE INICIO DEL PORTAL', 'created_at: 2023-10-23 12:30:51<br/>descripcion: Programa de inglés intensivo<br />\nAprende el idioma inglés de forma estructurada y efectiva.<br />\nEn BEI, trabajamos contigo para desarrollar tus habilidades y mejorar tu dominio del idioma inglés para que puedas tener más éxito en la vida.<br />\n¡Estudiante F-1 bienvenidos!<br/>id: 1<br/>updated_at: 2023-10-23 12:42:21<br/>', NULL, 'COMUNICADO PORTAL', '2023-10-23', '12:58:06', '2023-10-23 16:58:06', '2023-10-23 16:58:06'),
(38, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA SECCIÓN CONTACTOS', 'correo: info@tomorrowstoday.com<br/>created_at: 2023-10-20 11:40:45<br/>direccion: SHOPPING VIZUR CALLE MARISCAL SANTA CRUZ Y CALLE ARENALES CASTEA N° 20<br/>fono1: +591 63326803<br/>fono2: +591 64312163<br/>id: 1<br/>mapa: <iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d15302.44340797871!2d-68.13196529479978!3d-16.495230895308648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.497514656468287!2d-68.12797416816427!5e0!3m2!1ses-419!2sbo!4v1697748242821!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe><br/>updated_at: 2023-10-23 12:58:10<br/>', NULL, 'CONTACTOS', '2023-10-23', '12:58:10', '2023-10-23 16:58:10', '2023-10-23 16:58:10'),
(39, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA SECCIÓN REDES SOCIALES', 'created_at: 2023-10-20 12:05:51<br/>facebook: https://www.facebook.com/<br/>id: 1<br/>instagram: https://www.instagram.com/<br/>tiktok: https://www.tiktok.com/es/<br/>updated_at: 2023-10-20 12:06:07<br/>youtube: https://www.youtube.com/<br/>', NULL, 'REDES SOCIALES', '2023-10-23', '12:58:18', '2023-10-23 16:58:18', '2023-10-23 16:58:18'),
(40, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL', 'created_at: 2023-10-23 13:01:37<br/>descripcion_inicio: ¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidaos<br/>id: 1<br/>imagen_inicio: <br/>titulo_inicio: Gestoría de visas para Estados Unidos sin complicaciones<br/>updated_at: 2023-10-23 13:01:37<br/>', NULL, 'PORTAL GESTORÍA', '2023-10-23', '13:01:37', '2023-10-23 17:01:37', '2023-10-23 17:01:37'),
(41, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL', 'created_at: 2023-10-23 13:01:37<br/>descripcion_inicio: ¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidaos<br/>id: 1<br/>imagen_inicio: <br/>titulo_inicio: Gestoría de visas para Estados Unidos sin complicaciones<br/>updated_at: 2023-10-23 13:01:37<br/>', NULL, 'PORTAL GESTORÍA', '2023-10-23', '13:01:54', '2023-10-23 17:01:54', '2023-10-23 17:01:54'),
(42, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL', 'created_at: 2023-10-23 13:01:37<br/>descripcion_inicio: ¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidaos<br/>id: 1<br/>imagen_inicio: 1698080618_1.jpg<br/>titulo_inicio: Gestoría de visas para Estados Unidos sin complicaciones<br/>updated_at: 2023-10-23 13:01:37<br/>', NULL, 'PORTAL GESTORÍA', '2023-10-23', '13:03:38', '2023-10-23 17:03:38', '2023-10-23 17:03:38'),
(43, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL', 'created_at: 2023-10-23 13:01:37<br/>descripcion_inicio: ¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidaos<br/>id: 1<br/>imagen_inicio: 1698080755_1.jpg<br/>titulo_inicio: Gestoría de visas para Estados Unidos sin complicaciones<br/>updated_at: 2023-10-23 13:05:55<br/>', NULL, 'PORTAL GESTORÍA', '2023-10-23', '13:05:55', '2023-10-23 17:05:55', '2023-10-23 17:05:55'),
(44, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL', 'created_at: 2023-10-23 13:01:37<br/>descripcion_inicio: ¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidos<br/>id: 1<br/>imagen_inicio: 1698080755_1.jpg<br/>titulo_inicio: Gestoría de visas para Estados Unidos sin complicaciones<br/>updated_at: 2023-10-23 13:07:50<br/>', NULL, 'PORTAL GESTORÍA', '2023-10-23', '13:07:50', '2023-10-23 17:07:50', '2023-10-23 17:07:50'),
(45, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL', 'created_at: 2023-10-23 13:01:37<br/>descripcion_inicio: ¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidos<br/>id: 1<br/>imagen_inicio: 1698080755_1.jpg<br/>titulo_inicio: Gestoría de visas para Estados Unidos sin complicaciones modificado<br/>updated_at: 2023-10-23 13:07:59<br/>', NULL, 'PORTAL GESTORÍA', '2023-10-23', '13:07:59', '2023-10-23 17:07:59', '2023-10-23 17:07:59'),
(46, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL', 'created_at: 2023-10-23 13:01:37<br/>descripcion_inicio: ¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidos<br/>id: 1<br/>imagen_inicio: 1698080755_1.jpg<br/>titulo_inicio: Gestoría de visas para Estados Unidos sin complicaciones<br/>updated_at: 2023-10-23 13:08:07<br/>', NULL, 'PORTAL GESTORÍA', '2023-10-23', '13:08:07', '2023-10-23 17:08:07', '2023-10-23 17:08:07'),
(47, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL', 'created_at: 2023-10-23 13:01:37<br/>descripcion_inicio: ¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidos<br/>id: 1<br/>imagen_inicio: 1698080895_1.jpg<br/>titulo_inicio: Gestoría de visas para Estados Unidos sin complicaciones<br/>updated_at: 2023-10-23 13:08:15<br/>', NULL, 'PORTAL GESTORÍA', '2023-10-23', '13:08:15', '2023-10-23 17:08:15', '2023-10-23 17:08:15'),
(48, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL', 'created_at: 2023-10-23 13:01:37<br/>descripcion_inicio: ¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidos<br/>id: 1<br/>imagen_inicio: 1698080906_1.jpg<br/>titulo_inicio: Gestoría de visas para Estados Unidos sin complicaciones<br/>updated_at: 2023-10-23 13:08:26<br/>', NULL, 'PORTAL GESTORÍA', '2023-10-23', '13:08:26', '2023-10-23 17:08:26', '2023-10-23 17:08:26'),
(49, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL', 'created_at: 2023-10-23 13:01:37<br/>descripcion_inicio: ¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidos<br/>id: 1<br/>imagen_inicio: 1698080917_1.jpg<br/>titulo_inicio: Gestoría de visas para Estados Unidos sin complicaciones<br/>updated_at: 2023-10-23 13:08:37<br/>', NULL, 'PORTAL GESTORÍA', '2023-10-23', '13:08:37', '2023-10-23 17:08:37', '2023-10-23 17:08:37'),
(50, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL', 'created_at: 2023-10-23 13:01:37<br/>descripcion_inicio: ¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidos<br/>id: 1<br/>imagen_inicio: 1698081146_1.jpg<br/>titulo_inicio: Gestoría de visas para Estados Unidos sin complicaciones<br/>updated_at: 2023-10-23 13:12:26<br/>', NULL, 'PORTAL GESTORÍA', '2023-10-23', '13:12:26', '2023-10-23 17:12:26', '2023-10-23 17:12:26'),
(51, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL', 'created_at: 2023-10-23 13:01:37<br/>descripcion_inicio: ¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidos<br/>id: 1<br/>imagen_inicio: 1698081153_1.jpg<br/>titulo_inicio: Gestoría de visas para Estados Unidos sin complicaciones<br/>updated_at: 2023-10-23 13:12:33<br/>', NULL, 'PORTAL GESTORÍA', '2023-10-23', '13:12:33', '2023-10-23 17:12:33', '2023-10-23 17:12:33'),
(52, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN BANNER DE GESTORÍA', 'created_at: 2023-10-23 13:32:58<br/>id: 1<br/>img: 1698082378_1.jpg<br/>posicion: 1<br/>updated_at: 2023-10-23 13:32:58<br/>', NULL, 'GESTORÍA BANNERS', '2023-10-23', '13:32:58', '2023-10-23 17:32:58', '2023-10-23 17:32:58'),
(53, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN BANNER DE GESTORÍA', 'created_at: 2023-10-23 13:34:03<br/>id: 2<br/>img: 1698082443_2.jpg<br/>posicion: 2<br/>updated_at: 2023-10-23 13:34:03<br/>', NULL, 'GESTORÍA BANNERS', '2023-10-23', '13:34:03', '2023-10-23 17:34:03', '2023-10-23 17:34:03'),
(54, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN ¿QUIENES SOMOS? DE GESTORÍA', 'created_at: 2023-10-23 13:45:35<br/>descripcion: Somos Gestores\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br/>id: 1<br/>imagen: 1698083135_1.jpg<br/>updated_at: 2023-10-23 13:45:35<br/>', NULL, 'GESTORÍA NOSOTROS', '2023-10-23', '13:45:35', '2023-10-23 17:45:35', '2023-10-23 17:45:35'),
(55, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN ¿QUIENES SOMOS? DE GESTORÍA', 'created_at: 2023-10-23 13:45:35<br/>descripcion: Somos Gestores\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo.<br/>id: 1<br/>imagen: 1698083135_1.jpg<br/>updated_at: 2023-10-23 13:46:00<br/>', NULL, 'GESTORÍA NOSOTROS', '2023-10-23', '13:46:00', '2023-10-23 17:46:00', '2023-10-23 17:46:00'),
(56, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN ¿QUIENES SOMOS? DE GESTORÍA', 'created_at: 2023-10-23 13:45:35<br/>descripcion: Somos Gestores<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo.<br/>id: 1<br/>imagen: 1698083135_1.jpg<br/>updated_at: 2023-10-23 13:48:20<br/>', NULL, 'GESTORÍA NOSOTROS', '2023-10-23', '13:48:20', '2023-10-23 17:48:20', '2023-10-23 17:48:20'),
(57, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN ¿QUIENES SOMOS? DE GESTORÍA', 'created_at: 2023-10-23 13:45:35<br/>descripcion: Somos Gestores modificado<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo.<br/>id: 1<br/>imagen: 1698083135_1.jpg<br/>updated_at: 2023-10-23 13:49:06<br/>', NULL, 'GESTORÍA NOSOTROS', '2023-10-23', '13:49:06', '2023-10-23 17:49:06', '2023-10-23 17:49:06'),
(58, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN ¿QUIENES SOMOS? DE GESTORÍA', 'created_at: 2023-10-23 13:45:35<br/>descripcion: Somos Gestores<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo.<br/>id: 1<br/>imagen: 1698083135_1.jpg<br/>updated_at: 2023-10-23 13:49:13<br/>', NULL, 'GESTORÍA NOSOTROS', '2023-10-23', '13:49:13', '2023-10-23 17:49:13', '2023-10-23 17:49:13'),
(59, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN ¿QUIENES SOMOS? DE GESTORÍA', 'created_at: 2023-10-23 13:45:35<br/>descripcion: Somos Gestores<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo.<br/>id: 1<br/>imagen: 1698083385_1.jpg<br/>updated_at: 2023-10-23 13:49:45<br/>', NULL, 'GESTORÍA NOSOTROS', '2023-10-23', '13:49:45', '2023-10-23 17:49:45', '2023-10-23 17:49:45'),
(60, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN ¿QUIENES SOMOS? DE GESTORÍA', 'created_at: 2023-10-23 13:45:35<br/>descripcion: Somos Gestores<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br/>id: 1<br/>imagen: 1698083385_1.jpg<br/>updated_at: 2023-10-23 13:53:44<br/>', NULL, 'GESTORÍA NOSOTROS', '2023-10-23', '13:53:44', '2023-10-23 17:53:44', '2023-10-23 17:53:44'),
(61, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE GESTORÍA SERVICIOS', 'created_at: 2023-10-23 14:02:40<br/>estudiantes: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Estudiantes<br/>id: 2<br/>renovacion: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Renovación<br/>trabajo: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Trabajo<br/>turismo: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país<br/>updated_at: 2023-10-23 14:02:40<br/>', NULL, 'GESTORÍA SERVICIOS', '2023-10-23', '14:02:40', '2023-10-23 18:02:40', '2023-10-23 18:02:40'),
(62, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE GESTORÍA SERVICIOS', 'created_at: 2023-10-23 14:02:40<br/>estudiantes: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Estudiantes<br/>id: 2<br/>renovacion: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Renovación<br/>trabajo: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Trabajo<br/>turismo: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Turismo<br/>updated_at: 2023-10-23 14:04:49<br/>', NULL, 'GESTORÍA SERVICIOS', '2023-10-23', '14:04:49', '2023-10-23 18:04:49', '2023-10-23 18:04:49'),
(63, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE GESTORÍA SERVICIOS', 'created_at: 2023-10-23 14:02:40<br/>estudiantes: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Estudiantes<br/>id: 2<br/>renovacion: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Renovación<br/>trabajo: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Trabajo<br/>turismo: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Turismo<br/>updated_at: 2023-10-23 14:04:49<br/>', NULL, 'GESTORÍA SERVICIOS', '2023-10-23', '14:05:11', '2023-10-23 18:05:11', '2023-10-23 18:05:11'),
(64, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA INFORMACIÓN DE GESTORÍA', 'correo: info@tomorrowstoday.com<br/>created_at: 2023-10-23 14:13:52<br/>direccion: SHOPPING VIZUR CALLE MARISCAL SANTA CRUZ Y CALLE ARENALES CASTEA N° 20<br/>fono1: +591 66666666<br/>fono2: <br/>id: 1<br/>mapa: <iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d15302.44340797871!2d-68.13196529479978!3d-16.495230895308648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.497514656468287!2d-68.12797416816427!5e0!3m2!1ses-419!2sbo!4v1697748242821!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe><br/>updated_at: 2023-10-23 14:13:52<br/>', NULL, 'CONFIGURACIÓN GESTORÍA', '2023-10-23', '14:13:52', '2023-10-23 18:13:52', '2023-10-23 18:13:52'),
(65, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA INFORMACIÓN DE GESTORÍA', 'correo: info@tomorrowstoday.com<br/>created_at: 2023-10-23 14:13:52<br/>direccion: SHOPPING VIZUR CALLE MARISCAL SANTA CRUZ Y CALLE ARENALES CASTEA N° 20<br/>fono1: +591 66666666<br/>fono2: <br/>id: 1<br/>mapa: <iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d5409.403545726189!2d-68.11048986981962!3d-16.524788557606783!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.52559586873182!2d-68.1078194457513!5e0!3m2!1ses-419!2sbo!4v1698085176811!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe><br/>updated_at: 2023-10-23 14:19:43<br/>', NULL, 'CONFIGURACIÓN GESTORÍA', '2023-10-23', '14:19:43', '2023-10-23 18:19:43', '2023-10-23 18:19:43'),
(66, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA INFORMACIÓN DE GESTORÍA', 'correo: info@tomorrowstoday.com<br/>created_at: 2023-10-23 14:13:52<br/>direccion: SHOPPING VIZUR CALLE MARISCAL SANTA CRUZ Y CALLE ARENALES CASTEA N° 20<br/>fono1: +591 66666666<br/>fono2: <br/>id: 1<br/>mapa: <iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d5409.403545726189!2d-68.11048986981962!3d-16.524788557606783!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.52559586873182!2d-68.1078194457513!5e0!3m2!1ses-419!2sbo!4v1698085176811!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe><br/>updated_at: 2023-10-23 14:19:57<br/>', NULL, 'CONFIGURACIÓN GESTORÍA', '2023-10-23', '14:19:57', '2023-10-23 18:19:57', '2023-10-23 18:19:57'),
(67, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA INFORMACIÓN DE GESTORÍA', 'correo: infogestoria@tomorrowstoday.com<br/>created_at: 2023-10-23 14:13:52<br/>direccion: SHOPPING VIZUR CALLE MARISCAL SANTA CRUZ Y CALLE ARENALES CASTEA N° 22<br/>fono1: +591 66666666<br/>fono2: <br/>id: 1<br/>mapa: <iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d5409.403545726189!2d-68.11048986981962!3d-16.524788557606783!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.52559586873182!2d-68.1078194457513!5e0!3m2!1ses-419!2sbo!4v1698085176811!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe><br/>updated_at: 2023-10-23 14:21:17<br/>', NULL, 'CONFIGURACIÓN GESTORÍA', '2023-10-23', '14:21:17', '2023-10-23 18:21:17', '2023-10-23 18:21:17'),
(68, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 1<br/>nombre: INGLÉS NIVEL 0<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR. EXCEPTEUR SINT OCCAECAT CUPIDATAT NON PROIDENT, SUNT IN CULPA QUI OFFICIA DESERUNT MOLLIT ANIM ID EST LABORUM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:00:32<br/>updated_at: 2023-10-25 12:00:32<br/>', NULL, 'CURSOS', '2023-10-25', '12:00:32', '2023-10-25 16:00:32', '2023-10-25 16:00:32'),
(69, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 2<br/>nombre: INGLÉS NIVEL 1<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ET ULTRICES NEQUE ORNARE AENEAN EUISMOD ELEMENTUM NISI. ID ALIQUET LECTUS PROIN NIBH NISL CONDIMENTUM ID. ARCU DICTUM VARIUS DUIS AT. ELEMENTUM NIBH TELLUS MOLESTIE NUNC NON BLANDIT MASSA ENIM NEC.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:01:05<br/>updated_at: 2023-10-25 12:01:05<br/>', NULL, 'CURSOS', '2023-10-25', '12:01:05', '2023-10-25 16:01:05', '2023-10-25 16:01:05'),
(70, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 3<br/>nombre: ASD<br/>descripcion: ASD<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:01:10<br/>updated_at: 2023-10-25 12:01:10<br/>', NULL, 'CURSOS', '2023-10-25', '12:01:10', '2023-10-25 16:01:10', '2023-10-25 16:01:10'),
(71, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ UN CURSO', 'id: 3<br/>nombre: ASD<br/>descripcion: ASD<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:01:10<br/>updated_at: 2023-10-25 12:01:10<br/>', NULL, 'CURSOS', '2023-10-25', '12:03:42', '2023-10-25 16:03:42', '2023-10-25 16:03:42');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(72, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 3<br/>nombre: INGLÉS NIVEL 2<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ET ULTRICES NEQUE ORNARE AENEAN EUISMOD ELEMENTUM NISI. ID ALIQUET LECTUS PROIN NIBH NISL CONDIMENTUM ID. ARCU DICTUM VARIUS DUIS AT. ELEMENTUM NIBH TELLUS MOLESTIE NUNC NON BLANDIT MASSA ENIM NEC.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:04:00<br/>updated_at: 2023-10-25 12:04:00<br/>', NULL, 'CURSOS', '2023-10-25', '12:04:00', '2023-10-25 16:04:00', '2023-10-25 16:04:00'),
(73, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 4<br/>nombre: CURSO #4<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ET ULTRICES NEQUE ORNARE AENEAN EUISMOD ELEMENTUM NISI. ID ALIQUET LECTUS PROIN NIBH NISL CONDIMENTUM ID. ARCU DICTUM VARIUS DUIS AT. ELEMENTUM NIBH TELLUS MOLESTIE NUNC NON BLANDIT MASSA ENIM NEC.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:04:11<br/>updated_at: 2023-10-25 12:04:11<br/>', NULL, 'CURSOS', '2023-10-25', '12:04:11', '2023-10-25 16:04:11', '2023-10-25 16:04:11'),
(74, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 5<br/>nombre: CURSO #5<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ET ULTRICES NEQUE ORNARE AENEAN EUISMOD ELEMENTUM NISI. ID ALIQUET LECTUS PROIN NIBH NISL CONDIMENTUM ID. ARCU DICTUM VARIUS DUIS AT. ELEMENTUM NIBH TELLUS MOLESTIE NUNC NON BLANDIT MASSA ENIM NEC.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:04:16<br/>updated_at: 2023-10-25 12:04:16<br/>', NULL, 'CURSOS', '2023-10-25', '12:04:16', '2023-10-25 16:04:16', '2023-10-25 16:04:16'),
(75, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 6<br/>nombre: CURSO #6<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ET ULTRICES NEQUE ORNARE AENEAN EUISMOD ELEMENTUM NISI. ID ALIQUET LECTUS PROIN NIBH NISL CONDIMENTUM ID. ARCU DICTUM VARIUS DUIS AT. ELEMENTUM NIBH TELLUS MOLESTIE NUNC NON BLANDIT MASSA ENIM NEC.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:04:25<br/>updated_at: 2023-10-25 12:04:25<br/>', NULL, 'CURSOS', '2023-10-25', '12:04:25', '2023-10-25 16:04:25', '2023-10-25 16:04:25'),
(76, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN CURSO', 'id: 6<br/>nombre: CURSO #6<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ET ULTRICES NEQUE ORNARE AENEAN EUISMOD ELEMENTUM NISI. ID ALIQUET LECTUS PROIN NIBH NISL CONDIMENTUM ID. ARCU DICTUM VARIUS DUIS AT. ELEMENTUM NIBH TELLUS MOLESTIE NUNC NON BLANDIT MASSA ENIM NEC.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:04:25<br/>updated_at: 2023-10-25 12:04:25<br/>', 'id: 6<br/>nombre: CURSO #6 MODIFICADO<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ET ULTRICES NEQUE ORNARE AENEAN EUISMOD ELEMENTUM NISI. ID ALIQUET LECTUS PROIN NIBH NISL CONDIMENTUM ID. ARCU DICTUM VARIUS DUIS AT. ELEMENTUM NIBH TELLUS MOLESTIE NUNC NON BLANDIT MASSA ENIM NEC.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:04:25<br/>updated_at: 2023-10-25 12:04:29<br/>', 'CURSOS', '2023-10-25', '12:04:29', '2023-10-25 16:04:29', '2023-10-25 16:04:29'),
(77, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 1<br/>nombre: INGLÉS NIVEL 0<br/>imagen: <br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:19:34<br/>updated_at: 2023-10-25 12:19:34<br/>', NULL, 'CURSOS', '2023-10-25', '12:19:34', '2023-10-25 16:19:34', '2023-10-25 16:19:34'),
(78, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 2<br/>nombre: INGLÉS NIVEL 1<br/>imagen: 1698250829_2.jpg<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:20:29<br/>updated_at: 2023-10-25 12:20:29<br/>', NULL, 'CURSOS', '2023-10-25', '12:20:29', '2023-10-25 16:20:29', '2023-10-25 16:20:29'),
(79, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN CURSO', 'id: 2<br/>nombre: INGLÉS NIVEL 1<br/>imagen: 1698250829_2.jpg<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:20:29<br/>updated_at: 2023-10-25 12:20:29<br/>', 'id: 2<br/>nombre: INGLÉS NIVEL 1<br/>imagen: 1698251059_2.jpg<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:20:29<br/>updated_at: 2023-10-25 12:24:19<br/>', 'CURSOS', '2023-10-25', '12:24:19', '2023-10-25 16:24:19', '2023-10-25 16:24:19'),
(80, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 3<br/>nombre: INGLÉS NIVEL 2<br/>imagen: 1698251102_3.jpg<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:25:02<br/>updated_at: 2023-10-25 12:25:02<br/>', NULL, 'CURSOS', '2023-10-25', '12:25:02', '2023-10-25 16:25:02', '2023-10-25 16:25:02'),
(81, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN CURSO', 'id: 3<br/>nombre: INGLÉS NIVEL 2<br/>imagen: 1698251102_3.jpg<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:25:02<br/>updated_at: 2023-10-25 12:25:02<br/>', 'id: 3<br/>nombre: INGLÉS NIVEL 2<br/>imagen: 1698251110_3.jpg<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:25:02<br/>updated_at: 2023-10-25 12:25:10<br/>', 'CURSOS', '2023-10-25', '12:25:10', '2023-10-25 16:25:10', '2023-10-25 16:25:10'),
(82, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 4<br/>nombre: CURSO #4<br/>imagen: <br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:25:18<br/>updated_at: 2023-10-25 12:25:18<br/>', NULL, 'CURSOS', '2023-10-25', '12:25:18', '2023-10-25 16:25:18', '2023-10-25 16:25:18'),
(83, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 5<br/>nombre: CURSO #5<br/>imagen: <br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:25:22<br/>updated_at: 2023-10-25 12:25:22<br/>', NULL, 'CURSOS', '2023-10-25', '12:25:22', '2023-10-25 16:25:22', '2023-10-25 16:25:22'),
(84, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 6<br/>nombre: CURSO #6<br/>imagen: <br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:25:27<br/>updated_at: 2023-10-25 12:25:27<br/>', NULL, 'CURSOS', '2023-10-25', '12:25:27', '2023-10-25 16:25:27', '2023-10-25 16:25:27'),
(85, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN CURSO', 'id: 6<br/>nombre: CURSO #6<br/>imagen: <br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:25:27<br/>updated_at: 2023-10-25 12:25:27<br/>', 'id: 6<br/>nombre: CURSO #6 MODIFICADO<br/>imagen: <br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:25:27<br/>updated_at: 2023-10-25 12:25:35<br/>', 'CURSOS', '2023-10-25', '12:25:35', '2023-10-25 16:25:35', '2023-10-25 16:25:35'),
(86, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 7<br/>nombre: ASD<br/>imagen: <br/>descripcion: ASD<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:26:17<br/>updated_at: 2023-10-25 12:26:17<br/>', NULL, 'CURSOS', '2023-10-25', '12:26:17', '2023-10-25 16:26:17', '2023-10-25 16:26:17'),
(87, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ UN CURSO', 'id: 7<br/>nombre: ASD<br/>imagen: <br/>descripcion: ASD<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:26:17<br/>updated_at: 2023-10-25 12:26:17<br/>', NULL, 'CURSOS', '2023-10-25', '12:26:34', '2023-10-25 16:26:34', '2023-10-25 16:26:34'),
(88, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 8<br/>nombre: ASD<br/>imagen: 1698251199_8.jpg<br/>descripcion: ASD<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:26:39<br/>updated_at: 2023-10-25 12:26:39<br/>', NULL, 'CURSOS', '2023-10-25', '12:26:39', '2023-10-25 16:26:39', '2023-10-25 16:26:39'),
(89, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ UN CURSO', 'id: 8<br/>nombre: ASD<br/>imagen: 1698251199_8.jpg<br/>descripcion: ASD<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:26:39<br/>updated_at: 2023-10-25 12:26:39<br/>', NULL, 'CURSOS', '2023-10-25', '12:26:45', '2023-10-25 16:26:45', '2023-10-25 16:26:45'),
(90, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 9<br/>nombre: CURSO #7<br/>imagen: <br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:27:05<br/>updated_at: 2023-10-25 12:27:05<br/>', NULL, 'CURSOS', '2023-10-25', '12:27:05', '2023-10-25 16:27:05', '2023-10-25 16:27:05'),
(91, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ UN CURSO', 'id: 9<br/>nombre: CURSO #7<br/>imagen: <br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:27:05<br/>updated_at: 2023-10-25 12:27:05<br/>', NULL, 'CURSOS', '2023-10-25', '12:27:08', '2023-10-25 16:27:08', '2023-10-25 16:27:08'),
(92, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'id: 7<br/>nombre: CURSO #7<br/>imagen: <br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:27:19<br/>updated_at: 2023-10-25 12:27:19<br/>', NULL, 'CURSOS', '2023-10-25', '12:27:19', '2023-10-25 16:27:19', '2023-10-25 16:27:19'),
(93, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN CURSO', 'id: 6<br/>nombre: CURSO #6 MODIFICADO<br/>imagen: <br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:25:27<br/>updated_at: 2023-10-25 12:25:35<br/>', 'id: 6<br/>nombre: CURSO #6 MODIFICADO TEXTO LARGO<br/>imagen: <br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. ID ORNARE ARCU ODIO UT SEM NULLA. AUGUE UT LECTUS ARCU BIBENDUM AT. DIAM VULPUTATE UT PHARETRA SIT. EST PELLENTESQUE ELIT ULLAMCORPER DIGNISSIM.<br/>fecha_registro: 2023-10-25<br/>created_at: 2023-10-25 12:25:27<br/>updated_at: 2023-10-25 12:40:23<br/>', 'CURSOS', '2023-10-25', '12:40:23', '2023-10-25 16:40:23', '2023-10-25 16:40:23'),
(94, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN BANNER', 'id: 1<br/>img: 1697817407_1.jpg<br/>posicion: 1<br/>created_at: 2023-10-20 11:56:47<br/>updated_at: 2023-10-20 11:56:47<br/>', 'id: 1<br/>img: 1698252099_1.png<br/>posicion: 1<br/>created_at: 2023-10-20 11:56:47<br/>updated_at: 2023-10-25 12:41:39<br/>', 'BANNERS', '2023-10-25', '12:41:39', '2023-10-25 16:41:39', '2023-10-25 16:41:39'),
(95, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN BANNER', 'id: 2<br/>img: 1698080276_2.webp<br/>posicion: 2<br/>created_at: 2023-10-20 12:02:52<br/>updated_at: 2023-10-23 12:57:56<br/>', 'id: 2<br/>img: 1698252105_2.png<br/>posicion: 2<br/>created_at: 2023-10-20 12:02:52<br/>updated_at: 2023-10-25 12:41:45<br/>', 'BANNERS', '2023-10-25', '12:41:45', '2023-10-25 16:41:45', '2023-10-25 16:41:45'),
(96, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN BANNER DE GESTORÍA', 'id: 1<br/>img: 1698082378_1.jpg<br/>posicion: 1<br/>created_at: 2023-10-23 13:32:58<br/>updated_at: 2023-10-23 13:32:58<br/>', 'id: 1<br/>img: 1698252229_1.webp<br/>posicion: 1<br/>created_at: 2023-10-23 13:32:58<br/>updated_at: 2023-10-25 12:43:49<br/>', 'GESTORÍA BANNERS', '2023-10-25', '12:43:49', '2023-10-25 16:43:49', '2023-10-25 16:43:49'),
(97, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN BANNER DE GESTORÍA', 'id: 2<br/>img: 1698082443_2.jpg<br/>posicion: 2<br/>created_at: 2023-10-23 13:34:03<br/>updated_at: 2023-10-23 13:34:03<br/>', 'id: 2<br/>img: 1698252254_2.jpg<br/>posicion: 2<br/>created_at: 2023-10-23 13:34:03<br/>updated_at: 2023-10-25 12:44:14<br/>', 'GESTORÍA BANNERS', '2023-10-25', '12:44:14', '2023-10-25 16:44:14', '2023-10-25 16:44:14'),
(98, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL', 'id: 1<br/>imagen_inicio: 1698252586_1.png<br/>titulo_inicio: Gestoría de visas para Estados Unidos sin complicaciones<br/>descripcion_inicio: ¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidos<br/>created_at: 2023-10-23 13:01:37<br/>updated_at: 2023-10-25 12:49:46<br/>', NULL, 'PORTAL GESTORÍA', '2023-10-25', '12:49:46', '2023-10-25 16:49:46', '2023-10-25 16:49:46'),
(99, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN ¿QUIENES SOMOS? DE GESTORÍA', 'id: 1<br/>descripcion: Somos Gestores<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br/>imagen: 1698252640_1.png<br/>created_at: 2023-10-23 13:45:35<br/>updated_at: 2023-10-25 12:50:40<br/>', NULL, 'GESTORÍA NOSOTROS', '2023-10-25', '12:50:40', '2023-10-25 16:50:40', '2023-10-25 16:50:40'),
(100, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: PLAN MENSUAL<br/>costo: 49.99<br/>detalles: Descripción<br />\r\nLorem ipsum dolor sit amet<br />\r\nLorem ipsum dolor sit amet<br />\r\nLorem ipsum dolor sit amet<br />\r\nLorem ipsum dolor sit amet<br />\r\nLorem ipsum dolor sit amet<br />\r\n<br/>created_at: <br/>updated_at: <br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:35:32', '2023-10-31 15:35:32', '2023-10-31 15:35:32'),
(101, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: PLAN TRIMESTRAL<br/>costo: 130.00<br/>detalles: Descripción<br />\r\nLorem ipsum dolor sit amet<br />\r\nLorem ipsum dolor sit amet<br />\r\nLorem ipsum dolor sit amet<br />\r\nLorem ipsum dolor sit amet<br />\r\nLorem ipsum dolor sit amet<br />\r\n<br/>created_at: <br/>updated_at: <br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:35:32', '2023-10-31 15:35:32', '2023-10-31 15:35:32'),
(102, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: PLAN ANUAL<br/>costo: 400.00<br/>detalles: Descripción<br />\r\nLorem ipsum dolor sit amet<br />\r\nLorem ipsum dolor sit amet<br />\r\nLorem ipsum dolor sit amet<br />\r\nLorem ipsum dolor sit amet<br />\r\nLorem ipsum dolor sit amet<br />\r\n<br/>created_at: <br/>updated_at: <br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:35:32', '2023-10-31 15:35:32', '2023-10-31 15:35:32'),
(103, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: PLAN MENSUAL<br/>costo: 49.99<br/>detalles: Descripción<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br/>created_at: <br/>updated_at: <br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:43:51', '2023-10-31 15:43:51', '2023-10-31 15:43:51'),
(104, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: PLAN TRIMESTRAL<br/>costo: 130.00<br/>detalles: Descripción<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit ame\n<br/>created_at: <br/>updated_at: <br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:43:51', '2023-10-31 15:43:51', '2023-10-31 15:43:51'),
(105, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: PLAN ANUAL<br/>costo: 400.00<br/>detalles: Descripción<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br/>created_at: <br/>updated_at: <br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:43:51', '2023-10-31 15:43:51', '2023-10-31 15:43:51'),
(106, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: PLAN MENSUAL<br/>costo: 49.99<br/>detalles: Descripción<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br/>created_at: <br/>updated_at: <br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:45:33', '2023-10-31 15:45:33', '2023-10-31 15:45:33'),
(107, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: PLAN TRIMESTRAL<br/>costo: 130.00<br/>detalles: Descripción<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit ame\n<br/>created_at: <br/>updated_at: <br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:45:33', '2023-10-31 15:45:33', '2023-10-31 15:45:33'),
(108, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: PLAN ANUAL<br/>costo: 400.00<br/>detalles: Descripción<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br/>created_at: <br/>updated_at: <br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:45:33', '2023-10-31 15:45:33', '2023-10-31 15:45:33'),
(109, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: PLAN MENSUAL<br/>costo: 49.99<br/>detalles: Descripción<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br/>created_at: <br/>updated_at: <br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:47:43', '2023-10-31 15:47:43', '2023-10-31 15:47:43'),
(110, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: PLAN TRIMESTRAL<br/>costo: 130.00<br/>detalles: Descripción<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit ame\n<br/>created_at: <br/>updated_at: <br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:47:43', '2023-10-31 15:47:43', '2023-10-31 15:47:43'),
(111, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: PLAN ANUAL<br/>costo: 400.00<br/>detalles: Descripción<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br />\nLorem ipsum dolor sit amet<br/>created_at: <br/>updated_at: <br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:47:43', '2023-10-31 15:47:43', '2023-10-31 15:47:43'),
(112, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: PLAN MENSUAL<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\nMateriales digitales<br />\nRecursos tecnologicos<br />\nClases en vivo<br />\nCursos de preparación<br />\nBeacas academicas<br/>created_at: <br/>updated_at: 2023-10-31 11:49:01<br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:49:01', '2023-10-31 15:49:01', '2023-10-31 15:49:01'),
(113, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: PLAN TRIMESTRAL<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\nPlataforma interactiva<br />\nMateriales digitales<br />\nRecursos tecnologicos<br />\nClases en vivo<br />\nCursos de preparación<br />\nBeacas academicas<br/>created_at: <br/>updated_at: 2023-10-31 11:49:01<br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:49:01', '2023-10-31 15:49:01', '2023-10-31 15:49:01'),
(114, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: PLAN ANUAL<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\nPlataforma interactiva<br />\nMateriales digitales<br />\nRecursos tecnologicos<br />\nClases en vivo<br />\nCursos de preparación<br />\nBeacas academicas<br/>created_at: <br/>updated_at: 2023-10-31 11:49:01<br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:49:01', '2023-10-31 15:49:01', '2023-10-31 15:49:01'),
(115, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\nMateriales digitales<br />\nRecursos tecnologicos<br />\nClases en vivo<br />\nCursos de preparación<br />\nBeacas academicas<br/>created_at: <br/>updated_at: 2023-10-31 11:54:31<br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:54:31', '2023-10-31 15:54:31', '2023-10-31 15:54:31'),
(116, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\nPlataforma interactiva<br />\nMateriales digitales<br />\nRecursos tecnologicos<br />\nClases en vivo<br />\nCursos de preparación<br />\nBeacas academicas<br/>created_at: <br/>updated_at: 2023-10-31 11:54:31<br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:54:31', '2023-10-31 15:54:31', '2023-10-31 15:54:31'),
(117, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\nPlataforma interactiva<br />\nMateriales digitales<br />\nRecursos tecnologicos<br />\nClases en vivo<br />\nCursos de preparación<br />\nBeacas academicas<br/>created_at: <br/>updated_at: 2023-10-31 11:54:31<br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:54:31', '2023-10-31 15:54:31', '2023-10-31 15:54:31'),
(118, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE GESTORÍA SERVICIOS', 'created_at: 2023-10-23 14:02:40<br/>estudiantes: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Estudiantes<br/>id: 2<br/>mensaje_servicio: “VERIFICA SI ES VIABLE TU CASO PARA OBTENER TU VISA DE ESTADOS UNIDOS POR TAN SÓLO 100BS”<br/>renovacion: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Renovación<br/>trabajo: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Trabajo<br/>turismo: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Turismo<br/>updated_at: 2023-11-02 18:03:04<br/>', NULL, 'GESTORÍA SERVICIOS', '2023-11-02', '18:03:04', '2023-11-02 22:03:04', '2023-11-02 22:03:04'),
(119, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN TIP DE GESTORÍA', 'created_at: 2023-11-02 19:08:39<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>id: 1<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:08:39<br/>', NULL, 'GESTORÍA TIPS', '2023-11-02', '19:08:39', '2023-11-02 23:08:39', '2023-11-02 23:08:39'),
(120, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN TIP DE GESTORÍA', 'created_at: 2023-11-02 19:09:54<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>id: 2<br/>titulo: ¿CÓMO RESPONDER EN LA ENTREVISTA?<br/>updated_at: 2023-11-02 19:09:54<br/>', NULL, 'GESTORÍA TIPS', '2023-11-02', '19:09:54', '2023-11-02 23:09:54', '2023-11-02 23:09:54'),
(121, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN TIP DE GESTORÍA', 'created_at: 2023-11-02 19:10:07<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>id: 3<br/>titulo: ¿CÓMO PREPARARTE?<br/>updated_at: 2023-11-02 19:10:07<br/>', NULL, 'GESTORÍA TIPS', '2023-11-02', '19:10:07', '2023-11-02 23:10:07', '2023-11-02 23:10:07'),
(122, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN TIP DE GESTORÍA', 'created_at: 2023-11-02 19:10:30<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>id: 4<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:10:30<br/>', NULL, 'GESTORÍA TIPS', '2023-11-02', '19:10:30', '2023-11-02 23:10:30', '2023-11-02 23:10:30'),
(123, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN TIP DE GESTORÍA', 'created_at: 2023-11-02 19:08:39<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>id: 1<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:08:39<br/>', 'created_at: 2023-11-02 19:08:39<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.<BR />\r\nNUEVA FILA<br/>id: 1<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:11:46<br/>', 'GESTORÍA TIPS', '2023-11-02', '19:11:46', '2023-11-02 23:11:46', '2023-11-02 23:11:46'),
(124, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN TIP DE GESTORÍA', 'created_at: 2023-11-02 19:08:39<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.<BR />\r\nNUEVA FILA<br/>id: 1<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:11:46<br/>', 'created_at: 2023-11-02 19:08:39<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.<BR />\r\nASDASD<br/>id: 1<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:13:59<br/>', 'GESTORÍA TIPS', '2023-11-02', '19:13:59', '2023-11-02 23:13:59', '2023-11-02 23:13:59'),
(125, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN TIP DE GESTORÍA', 'created_at: 2023-11-02 19:08:39<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.<BR />\r\nASDASD<br/>id: 1<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:13:59<br/>', 'created_at: 2023-11-02 19:08:39<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.<BR/><BR />\r\nASDASD<br/>id: 1<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:16:45<br/>', 'GESTORÍA TIPS', '2023-11-02', '19:16:45', '2023-11-02 23:16:45', '2023-11-02 23:16:45'),
(126, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN TIP DE GESTORÍA', 'created_at: 2023-11-02 19:08:39<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.<BR/><BR />\r\nASDASD<br/>id: 1<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:16:45<br/>', 'created_at: 2023-11-02 19:08:39<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.<BR />\r\nASDASD<br/>id: 1<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:16:51<br/>', 'GESTORÍA TIPS', '2023-11-02', '19:16:51', '2023-11-02 23:16:51', '2023-11-02 23:16:51'),
(127, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN TIP DE GESTORÍA', 'created_at: 2023-11-02 19:08:39<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.<BR />\r\nASDASD<br/>id: 1<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:16:51<br/>', 'created_at: 2023-11-02 19:08:39<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.\r\nASDASD<br/>id: 1<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:17:31<br/>', 'GESTORÍA TIPS', '2023-11-02', '19:17:31', '2023-11-02 23:17:31', '2023-11-02 23:17:31'),
(128, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN TIP DE GESTORÍA', 'created_at: 2023-11-02 19:08:39<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.<BR />\nNUEVA FILA<br/>id: 1<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:17:31<br/>', 'created_at: 2023-11-02 19:08:39<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.\r\nNUEVA LINEA<br/>id: 1<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:18:51<br/>', 'GESTORÍA TIPS', '2023-11-02', '19:18:51', '2023-11-02 23:18:51', '2023-11-02 23:18:51'),
(129, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN TIP DE GESTORÍA', 'created_at: 2023-11-02 19:10:30<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>id: 4<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:10:30<br/>', 'created_at: 2023-11-02 19:10:30<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT<br/>id: 4<br/>titulo: ¿QUÉ HACER EN UNA ENTREVISTA?<br/>updated_at: 2023-11-02 19:25:32<br/>', 'GESTORÍA TIPS', '2023-11-02', '19:25:32', '2023-11-02 23:25:32', '2023-11-02 23:25:32'),
(130, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN TIP DE GESTORÍA', 'created_at: 2023-11-02 19:10:07<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>id: 3<br/>titulo: ¿CÓMO PREPARARTE?<br/>updated_at: 2023-11-02 19:10:07<br/>', 'created_at: 2023-11-02 19:10:07<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT<br/>id: 3<br/>titulo: ¿CÓMO PREPARARTE?<br/>updated_at: 2023-11-02 19:25:35<br/>', 'GESTORÍA TIPS', '2023-11-02', '19:25:35', '2023-11-02 23:25:35', '2023-11-02 23:25:35'),
(131, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN TIP DE GESTORÍA', 'created_at: 2023-11-02 19:09:54<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>id: 2<br/>titulo: ¿CÓMO RESPONDER EN LA ENTREVISTA?<br/>updated_at: 2023-11-02 19:09:54<br/>', 'created_at: 2023-11-02 19:09:54<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT<br/>id: 2<br/>titulo: ¿CÓMO RESPONDER EN LA ENTREVISTA?<br/>updated_at: 2023-11-02 19:25:38<br/>', 'GESTORÍA TIPS', '2023-11-02', '19:25:38', '2023-11-02 23:25:38', '2023-11-02 23:25:38'),
(132, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE GESTORÍA SERVICIOS', 'created_at: 2023-10-23 14:02:40<br/>estudiantes: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Estudiantes<br/>id: 2<br/>mensaje_servicio: “VERIFICA SI ES VIABLE TU CASO PARA OBTENER TU VISA DE ESTADOS UNIDOS POR TAN SÓLO 100BS”<br/>renovacion: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Renovación<br/>trabajo: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Trabajo<br/>turismo: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Turismo<br/>updated_at: 2023-11-02 18:03:04<br/>', NULL, 'GESTORÍA SERVICIOS', '2023-11-03', '11:17:55', '2023-11-03 15:17:55', '2023-11-03 15:17:55'),
(133, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE GESTORÍA SERVICIOS', 'created_at: 2023-10-23 14:02:40<br/>estudiantes: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Estudiantes<br/>id: 2<br/>mensaje_servicio: “VERIFICA SI ES VIABLE TU CASO PARA OBTENER TU VISA DE ESTADOS UNIDOS POR TAN SÓLO 100BS”<br/>renovacion: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Renovación<br/>trabajo: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Trabajo<br/>turismo: Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Turismo<br/>updated_at: 2023-11-02 18:03:04<br/>', NULL, 'GESTORÍA SERVICIOS', '2023-11-03', '11:18:53', '2023-11-03 15:18:53', '2023-11-03 15:18:53'),
(134, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN ¿QUIENES SOMOS? DE GESTORÍA', 'created_at: 2023-10-23 13:45:35<br/>descripcion: Somos Gestores<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br/>id: 1<br/>imagen: 1698252640_1.png<br/>updated_at: 2023-11-03 11:38:05<br/>', NULL, 'GESTORÍA NOSOTROS', '2023-11-03', '11:38:05', '2023-11-03 15:38:05', '2023-11-03 15:38:05'),
(135, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA DESCRIPCIÓN ¿QUIENES SOMOS? DE GESTORÍA', 'created_at: 2023-10-23 13:45:35<br/>descripcion: Somos Gestores<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br />\r\nLorem ipsum dolor sit amet.<br/>id: 1<br/>imagen: 1698252640_1.png<br/>updated_at: 2023-11-03 11:38:15<br/>', NULL, 'GESTORÍA NOSOTROS', '2023-11-03', '11:38:15', '2023-11-03 15:38:15', '2023-11-03 15:38:15'),
(136, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ LA INFORMACIÓN DE GESTORÍA', 'correo: infogestoria@tomorrowstoday.com<br/>created_at: 2023-10-23 14:13:52<br/>direccion: SHOPPING VIZUR CALLE MARISCAL SANTA CRUZ Y CALLE ARENALES CASTEA N° 22<br/>fono1: +591 66666666<br/>fono2: <br/>id: 1<br/>mapa: <iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d5409.403545726189!2d-68.11048986981962!3d-16.524788557606783!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.52559586873182!2d-68.1078194457513!5e0!3m2!1ses-419!2sbo!4v1698085176811!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe><br/>updated_at: 2023-11-03 11:40:00<br/>', NULL, 'CONFIGURACIÓN GESTORÍA', '2023-11-03', '11:40:00', '2023-11-03 15:40:00', '2023-11-03 15:40:00'),
(137, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN GRUPO', 'created_at: 2023-11-03 12:05:13<br/>descripcion: DESCRIPCION GRUPO #1<br/>estado: ACTIVO<br/>id: 1<br/>link_reunion: <br/>nombre: GRUPO #1<br/>updated_at: 2023-11-03 12:05:13<br/>', NULL, 'GRUPOS', '2023-11-03', '12:05:13', '2023-11-03 16:05:13', '2023-11-03 16:05:13'),
(138, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN GRUPO', 'created_at: 2023-11-03 12:05:13<br/>descripcion: DESCRIPCION GRUPO #1<br/>estado: ACTIVO<br/>id: 1<br/>link_reunion: <br/>nombre: GRUPO #1<br/>updated_at: 2023-11-03 12:05:13<br/>', 'created_at: 2023-11-03 12:05:13<br/>descripcion: DESCRIPCION GRUPO #1<br/>estado: INACTIVO<br/>id: 1<br/>link_reunion: <br/>nombre: GRUPO #1<br/>updated_at: 2023-11-03 12:05:24<br/>', 'GRUPOS', '2023-11-03', '12:05:24', '2023-11-03 16:05:24', '2023-11-03 16:05:24'),
(139, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN GRUPO', 'created_at: 2023-11-03 12:05:13<br/>descripcion: DESCRIPCION GRUPO #1<br/>estado: INACTIVO<br/>id: 1<br/>link_reunion: <br/>nombre: GRUPO #1<br/>updated_at: 2023-11-03 12:05:24<br/>', 'created_at: 2023-11-03 12:05:13<br/>descripcion: DESCRIPCION GRUPO #1 MODIFICADO<br/>estado: INACTIVO<br/>id: 1<br/>link_reunion: <br/>nombre: GRUPO #1 MODIFICADO<br/>updated_at: 2023-11-03 12:05:32<br/>', 'GRUPOS', '2023-11-03', '12:05:32', '2023-11-03 16:05:32', '2023-11-03 16:05:32'),
(140, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN GRUPO', 'created_at: 2023-11-03 12:05:41<br/>descripcion: DESC<br/>estado: INACTIVO<br/>id: 2<br/>link_reunion: <br/>nombre: GRUPO #2<br/>updated_at: 2023-11-03 12:05:41<br/>', NULL, 'GRUPOS', '2023-11-03', '12:05:41', '2023-11-03 16:05:41', '2023-11-03 16:05:41'),
(141, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ UN GRUPO', 'created_at: 2023-11-03 12:05:13<br/>descripcion: DESCRIPCION GRUPO #1 MODIFICADO<br/>estado: INACTIVO<br/>id: 1<br/>link_reunion: <br/>nombre: GRUPO #1 MODIFICADO<br/>updated_at: 2023-11-03 12:05:32<br/>', NULL, 'GRUPOS', '2023-11-03', '12:05:47', '2023-11-03 16:05:47', '2023-11-03 16:05:47'),
(142, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ UN GRUPO', 'created_at: 2023-11-03 12:05:41<br/>descripcion: DESC<br/>estado: INACTIVO<br/>id: 2<br/>link_reunion: <br/>nombre: GRUPO #2<br/>updated_at: 2023-11-03 12:05:41<br/>', NULL, 'GRUPOS', '2023-11-03', '12:05:52', '2023-11-03 16:05:52', '2023-11-03 16:05:52'),
(143, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN GRUPO', 'created_at: 2023-11-03 12:06:11<br/>descripcion: DESCRIPCION GRUPO #1<br/>estado: ACTIVO<br/>id: 1<br/>link_reunion: <br/>nombre: GRUPO #1<br/>updated_at: 2023-11-03 12:06:11<br/>', NULL, 'GRUPOS', '2023-11-03', '12:06:11', '2023-11-03 16:06:11', '2023-11-03 16:06:11'),
(144, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: PENDIENTE<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-10-31 13:52:08<br/>', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: ACEPTADO<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-11-04 16:37:15<br/>', 'INSCRIPCION SOLICITUD', '2023-11-04', '16:37:15', '2023-11-04 20:37:15', '2023-11-04 20:37:15'),
(145, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: ACEPTADO<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-11-04 16:37:15<br/>', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: NO RESPONDE<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-11-04 16:37:34<br/>', 'INSCRIPCION SOLICITUD', '2023-11-04', '16:37:34', '2023-11-04 20:37:34', '2023-11-04 20:37:34'),
(146, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: NO RESPONDE<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-11-04 16:37:34<br/>', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: DESCARTADO<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-11-04 16:37:36<br/>', 'INSCRIPCION SOLICITUD', '2023-11-04', '16:37:36', '2023-11-04 20:37:36', '2023-11-04 20:37:36');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(147, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: DESCARTADO<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-11-04 16:37:36<br/>', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: ACEPTADO<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-11-04 16:37:38<br/>', 'INSCRIPCION SOLICITUD', '2023-11-04', '16:37:38', '2023-11-04 20:37:38', '2023-11-04 20:37:38'),
(148, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: ACEPTADO<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-11-04 16:37:38<br/>', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: ACEPTADO<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-11-04 16:37:38<br/>', 'INSCRIPCION SOLICITUD', '2023-11-04', '16:38:37', '2023-11-04 20:38:37', '2023-11-04 20:38:37'),
(149, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UNA ASIGNACIÓN DE GRUPO', 'created_at: 2023-11-04 17:15:59<br/>curso_id: 7<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>updated_at: 2023-11-04 17:15:59<br/>', NULL, 'ASIGNACIÓN DE GRUPOS', '2023-11-04', '17:15:59', '2023-11-04 21:15:59', '2023-11-04 21:15:59'),
(150, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ UNA ASIGNACIÓN DE GRUPO', 'created_at: 2023-11-04 17:15:59<br/>curso_id: 7<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>updated_at: 2023-11-04 17:15:59<br/>', NULL, 'ASIGNACIÓN DE GRUPOS', '2023-11-04', '17:16:38', '2023-11-04 21:16:38', '2023-11-04 21:16:38'),
(151, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: ACEPTADO<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-11-04 17:16:38<br/>', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: DESCARTADO<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-11-04 17:16:52<br/>', 'INSCRIPCION SOLICITUD', '2023-11-04', '17:16:52', '2023-11-04 21:16:52', '2023-11-04 21:16:52'),
(152, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: DESCARTADO<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-11-04 17:16:52<br/>', 'archivo_pago: <br/>created_at: 2023-10-31 13:52:08<br/>curso_id: 7<br/>desc_otro_pago: <br/>desc_pago: <br/>desc_se_entero: UN CONOCIDO<br/>estado: ACEPTADO<br/>estado_asignado: NO<br/>forma_pago: DEPÓSITO BANCARIO<br/>id: 1<br/>inscripcion_id: 2<br/>nivel: NIVEL CERO<br/>plan_costo: 400.00<br/>plan_pago_id: 3<br/>se_entero: OTRO<br/>updated_at: 2023-11-04 17:16:59<br/>', 'INSCRIPCION SOLICITUD', '2023-11-04', '17:16:59', '2023-11-04 21:16:59', '2023-11-04 21:16:59'),
(153, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UNA ASIGNACIÓN DE GRUPO', 'created_at: 2023-11-04 17:17:11<br/>curso_id: 7<br/>grupo_id: 1<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>updated_at: 2023-11-04 17:17:11<br/>', NULL, 'ASIGNACIÓN DE GRUPOS', '2023-11-04', '17:17:11', '2023-11-04 21:17:11', '2023-11-04 21:17:11'),
(154, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ UNA ASIGNACIÓN DE GRUPO', 'created_at: 2023-11-04 17:17:11<br/>curso_id: 7<br/>grupo_id: 1<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>updated_at: 2023-11-04 17:17:11<br/>', NULL, 'ASIGNACIÓN DE GRUPOS', '2023-11-04', '17:17:40', '2023-11-04 21:17:40', '2023-11-04 21:17:40'),
(155, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UNA ASIGNACIÓN DE GRUPO', 'created_at: 2023-11-04 17:17:52<br/>curso_id: 7<br/>grupo_id: 1<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>updated_at: 2023-11-04 17:17:52<br/>', NULL, 'ASIGNACIÓN DE GRUPOS', '2023-11-04', '17:17:52', '2023-11-04 21:17:52', '2023-11-04 21:17:52'),
(156, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UNA ASIGNACIÓN DE GRUPO', 'created_at: 2023-11-04 17:17:52<br/>curso_id: 7<br/>grupo_id: 1<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>updated_at: 2023-11-04 17:17:52<br/>', 'created_at: 2023-11-04 17:17:52<br/>curso_id: 5<br/>grupo_id: 1<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>updated_at: 2023-11-04 17:21:11<br/>', 'ASIGNACIÓN DE GRUPOS', '2023-11-04', '17:21:11', '2023-11-04 21:21:11', '2023-11-04 21:21:11'),
(157, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UNA ASIGNACIÓN DE GRUPO', 'created_at: 2023-11-04 17:17:52<br/>curso_id: 5<br/>grupo_id: 1<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>updated_at: 2023-11-04 17:21:11<br/>', 'created_at: 2023-11-04 17:17:52<br/>curso_id: 7<br/>grupo_id: 1<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>updated_at: 2023-11-04 17:21:15<br/>', 'ASIGNACIÓN DE GRUPOS', '2023-11-04', '17:21:15', '2023-11-04 21:21:15', '2023-11-04 21:21:15'),
(158, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PROFESOR', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: <br/>nacionalidad: <br/>pais_residencia: <br/>dir: <br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: FELIPE@GMAIL.COM<br/>user_id: 6<br/>created_at: 2023-11-04 21:35:46<br/>updated_at: 2023-11-04 21:35:46<br/>', NULL, 'PROFESORES', '2023-11-04', '21:35:46', '2023-11-05 01:35:46', '2023-11-05 01:35:46'),
(159, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROFESOR', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: <br/>nacionalidad: <br/>pais_residencia: <br/>dir: <br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: FELIPE@GMAIL.COM<br/>user_id: 6<br/>created_at: 2023-11-04 21:35:46<br/>updated_at: 2023-11-04 21:35:46<br/>', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: <br/>nacionalidad: <br/>pais_residencia: <br/>dir: <br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: felipe@gmail.com<br/>user_id: 6<br/>created_at: 2023-11-04 21:35:46<br/>updated_at: 2023-11-04 21:40:40<br/>', 'PROFESORES', '2023-11-04', '21:40:40', '2023-11-05 01:40:40', '2023-11-05 01:40:40'),
(160, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROFESOR', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: <br/>nacionalidad: <br/>pais_residencia: <br/>dir: <br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: felipe@gmail.com<br/>user_id: 6<br/>created_at: 2023-11-04 21:35:46<br/>updated_at: 2023-11-04 21:40:40<br/>', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: <br/>nacionalidad: <br/>pais_residencia: <br/>dir: <br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: felipe23@gmail.com<br/>user_id: 6<br/>created_at: 2023-11-04 21:35:46<br/>updated_at: 2023-11-04 21:40:54<br/>', 'PROFESORES', '2023-11-04', '21:40:54', '2023-11-05 01:40:54', '2023-11-05 01:40:54'),
(161, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROFESOR', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: <br/>nacionalidad: <br/>pais_residencia: <br/>dir: <br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: felipe23@gmail.com<br/>user_id: 6<br/>created_at: 2023-11-04 21:35:46<br/>updated_at: 2023-11-04 21:40:54<br/>', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: 1111<br/>nacionalidad: BOLIVIANO<br/>pais_residencia: BOLIVIA<br/>dir: LOS OLIVOS<br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: felipe23@gmail.com<br/>user_id: 6<br/>created_at: 2023-11-04 21:35:46<br/>updated_at: 2023-11-04 21:41:11<br/>', 'PROFESORES', '2023-11-04', '21:41:11', '2023-11-05 01:41:11', '2023-11-05 01:41:11'),
(162, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN PROFESOR', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: 1111<br/>nacionalidad: BOLIVIANO<br/>pais_residencia: BOLIVIA<br/>dir: LOS OLIVOS<br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: felipe23@gmail.com<br/>user_id: 6<br/>created_at: 2023-11-04 21:35:46<br/>updated_at: 2023-11-04 21:41:11<br/>', NULL, 'PROFESORES', '2023-11-04', '21:41:20', '2023-11-05 01:41:20', '2023-11-05 01:41:20'),
(163, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PROFESOR', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: 11111<br/>nacionalidad: BOLIVIANO<br/>pais_residencia: BOLIVIA<br/>dir: LOS OLIVOS #32<br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: felipe@gmail.com<br/>user_id: 6<br/>created_at: 2023-11-04 21:43:07<br/>updated_at: 2023-11-04 21:43:07<br/>', NULL, 'PROFESORES', '2023-11-04', '21:43:07', '2023-11-05 01:43:07', '2023-11-05 01:43:07'),
(164, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROFESOR', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: 11111<br/>nacionalidad: BOLIVIANO<br/>pais_residencia: BOLIVIA<br/>dir: LOS OLIVOS #32<br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: felipe@gmail.com<br/>user_id: 6<br/>created_at: 2023-11-04 21:43:07<br/>updated_at: 2023-11-04 21:43:07<br/>', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: 11111<br/>nacionalidad: BOLIVIANO<br/>pais_residencia: BOLIVIA<br/>dir: LOS OLIVOS #32<br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: felipe@gmail.com<br/>user_id: 6<br/>created_at: 2023-11-04 21:43:07<br/>updated_at: 2023-11-05 13:01:53<br/>', 'PROFESORES', '2023-11-05', '13:01:53', '2023-11-05 17:01:53', '2023-11-05 17:01:53'),
(165, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROFESOR', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: 11111<br/>nacionalidad: BOLIVIANO<br/>pais_residencia: BOLIVIA<br/>dir: LOS OLIVOS #32<br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: felipe@gmail.com<br/>user_id: 6<br/>created_at: 2023-11-04 21:43:07<br/>updated_at: 2023-11-05 13:01:53<br/>', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: 11111<br/>nacionalidad: BOLIVIANO<br/>pais_residencia: BOLIVIA<br/>dir: LOS OLIVOS #32<br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: felipe@gmail.com<br/>user_id: 6<br/>created_at: 2023-11-04 21:43:07<br/>updated_at: 2023-11-05 13:02:39<br/>', 'PROFESORES', '2023-11-05', '13:02:39', '2023-11-05 17:02:39', '2023-11-05 17:02:39'),
(166, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROFESOR', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: 11111<br/>nacionalidad: BOLIVIANO<br/>pais_residencia: BOLIVIA<br/>dir: LOS OLIVOS #32<br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: felipe@gmail.com<br/>user_id: 6<br/>created_at: 2023-11-04 21:43:07<br/>updated_at: 2023-11-05 13:02:39<br/>', 'id: 1<br/>nombres: FELIPE<br/>apellidos: GUTIERREZ MARTINES<br/>ci: 11111<br/>nacionalidad: BOLIVIANO<br/>pais_residencia: BOLIVIA<br/>dir: LOS OLIVOS #32<br/>fono: 777777<br/>especialidad: INGLES AVANZADO<br/>correo: felipe@gmail.com<br/>user_id: 6<br/>created_at: 2023-11-04 21:43:07<br/>updated_at: 2023-11-05 13:03:02<br/>', 'PROFESORES', '2023-11-05', '13:03:02', '2023-11-05 17:03:02', '2023-11-05 17:03:02'),
(167, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN HORARIO', 'id: 1<br/>grupo_id: 1<br/>modalidad: VIRTUAL<br/>dias: 1,1,1,1,1,1,1<br/>fecha_inicio: 2023-11-05<br/>fecha_fin: 2023-11-10<br/>hora_inicio: 16:00<br/>hora_fin: 18:00<br/>created_at: 2023-11-05 13:55:54<br/>updated_at: 2023-11-05 13:55:54<br/>', NULL, 'HORARIOS', '2023-11-05', '13:55:54', '2023-11-05 17:55:54', '2023-11-05 17:55:54'),
(168, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN HORARIO', 'id: 1<br/>grupo_id: 1<br/>modalidad: VIRTUAL<br/>dias: 1,1,1,1,1,1,1<br/>fecha_inicio: 2023-11-05<br/>fecha_fin: 2023-11-10<br/>hora_inicio: 16:00:00<br/>hora_fin: 18:00:00<br/>created_at: 2023-11-05 13:55:54<br/>updated_at: 2023-11-05 13:55:54<br/>', 'id: 1<br/>grupo_id: 1<br/>modalidad: VIRTUAL<br/>dias: 1,1,1,1,1,1,1<br/>fecha_inicio: 2023-11-05<br/>fecha_fin: 2023-11-10<br/>hora_inicio: 17:00<br/>hora_fin: 18:30<br/>created_at: 2023-11-05 13:55:54<br/>updated_at: 2023-11-05 14:06:06<br/>', 'HORARIOS', '2023-11-05', '14:06:06', '2023-11-05 18:06:06', '2023-11-05 18:06:06'),
(169, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN HORARIO', 'id: 1<br/>grupo_id: 1<br/>modalidad: VIRTUAL<br/>dias: 1,1,1,1,1,1,1<br/>fecha_inicio: 2023-11-05<br/>fecha_fin: 2023-11-10<br/>hora_inicio: 17:00:00<br/>hora_fin: 18:30:00<br/>created_at: 2023-11-05 13:55:54<br/>updated_at: 2023-11-05 14:06:06<br/>', 'id: 1<br/>grupo_id: 1<br/>modalidad: VIRTUAL<br/>dias: 0,1,1,1,1,1,0<br/>fecha_inicio: 2023-11-05<br/>fecha_fin: 2023-11-10<br/>hora_inicio: 17:00:00<br/>hora_fin: 18:30:00<br/>created_at: 2023-11-05 13:55:54<br/>updated_at: 2023-11-05 14:06:24<br/>', 'HORARIOS', '2023-11-05', '14:06:24', '2023-11-05 18:06:24', '2023-11-05 18:06:24'),
(170, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN HORARIO', 'id: 1<br/>grupo_id: 1<br/>modalidad: VIRTUAL<br/>dias: 0,1,1,1,1,1,0<br/>fecha_inicio: 2023-11-05<br/>fecha_fin: 2023-11-10<br/>hora_inicio: 17:00:00<br/>hora_fin: 18:30:00<br/>created_at: 2023-11-05 13:55:54<br/>updated_at: 2023-11-05 14:06:24<br/>', 'id: 1<br/>grupo_id: 1<br/>modalidad: VIRTUAL<br/>dias: 0,1,1,1,1,1,0<br/>fecha_inicio: 2023-11-06<br/>fecha_fin: 2023-11-12<br/>hora_inicio: 17:00:00<br/>hora_fin: 18:30:00<br/>created_at: 2023-11-05 13:55:54<br/>updated_at: 2023-11-05 14:06:33<br/>', 'HORARIOS', '2023-11-05', '14:06:33', '2023-11-05 18:06:33', '2023-11-05 18:06:33'),
(171, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN HORARIO', 'id: 1<br/>grupo_id: 1<br/>modalidad: VIRTUAL<br/>dias: 0,1,1,1,1,1,0<br/>fecha_inicio: 2023-11-06<br/>fecha_fin: 2023-11-12<br/>hora_inicio: 17:00:00<br/>hora_fin: 18:30:00<br/>created_at: 2023-11-05 13:55:54<br/>updated_at: 2023-11-05 14:06:33<br/>', 'id: 1<br/>grupo_id: 1<br/>modalidad: PRESENCIAL<br/>dias: 0,1,1,1,1,1,0<br/>fecha_inicio: 2023-11-06<br/>fecha_fin: 2023-11-12<br/>hora_inicio: 17:00:00<br/>hora_fin: 18:30:00<br/>created_at: 2023-11-05 13:55:54<br/>updated_at: 2023-11-05 14:06:37<br/>', 'HORARIOS', '2023-11-05', '14:06:37', '2023-11-05 18:06:37', '2023-11-05 18:06:37'),
(172, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN HORARIO', 'id: 1<br/>grupo_id: 1<br/>modalidad: PRESENCIAL<br/>dias: 0,1,1,1,1,1,0<br/>fecha_inicio: 2023-11-06<br/>fecha_fin: 2023-11-12<br/>hora_inicio: 17:00:00<br/>hora_fin: 18:30:00<br/>created_at: 2023-11-05 13:55:54<br/>updated_at: 2023-11-05 14:06:37<br/>', 'id: 1<br/>grupo_id: 1<br/>modalidad: PRESENCIAL<br/>dias: 0,1,1,1,1,1,0<br/>fecha_inicio: 2023-11-06<br/>fecha_fin: 2023-11-12<br/>hora_inicio: 17:00:00<br/>hora_fin: 18:30:00<br/>created_at: 2023-11-05 13:55:54<br/>updated_at: 2023-11-05 14:06:37<br/>', 'HORARIOS', '2023-11-05', '14:08:44', '2023-11-05 18:08:44', '2023-11-05 18:08:44'),
(173, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN HORARIO', 'id: 1<br/>grupo_id: 1<br/>modalidad: PRESENCIAL<br/>dias: 0,1,1,1,1,1,0<br/>fecha_inicio: 2023-11-06<br/>fecha_fin: 2023-11-12<br/>hora_inicio: 17:00:00<br/>hora_fin: 18:30:00<br/>created_at: 2023-11-05 13:55:54<br/>updated_at: 2023-11-05 14:06:37<br/>', 'id: 1<br/>grupo_id: 1<br/>modalidad: PRESENCIAL<br/>dias: 0,1,1,1,1,1,0<br/>fecha_inicio: 2023-11-06<br/>fecha_fin: 2023-11-12<br/>hora_inicio: 17:00:00<br/>hora_fin: 18:30:00<br/>created_at: 2023-11-05 13:55:54<br/>updated_at: 2023-11-05 14:06:37<br/>', 'HORARIOS', '2023-11-05', '14:09:12', '2023-11-05 18:09:12', '2023-11-05 18:09:12'),
(174, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN GRUPO', 'id: 2<br/>nombre: GRUPO #2<br/>descripcion: GRUPO DE PRUEBA<br/>link_reunion: <br/>estado: ACTIVO<br/>created_at: 2023-11-05 14:10:19<br/>updated_at: 2023-11-05 14:10:19<br/>', NULL, 'GRUPOS', '2023-11-05', '14:10:19', '2023-11-05 18:10:19', '2023-11-05 18:10:19'),
(175, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN HORARIO', 'id: 2<br/>grupo_id: 2<br/>modalidad: VIRTUAL<br/>dias: 0,0,1,1,0,0,0<br/>fecha_inicio: 2023-11-12<br/>fecha_fin: 2023-11-21<br/>hora_inicio: 15:00<br/>hora_fin: 17:00<br/>created_at: 2023-11-05 14:11:03<br/>updated_at: 2023-11-05 14:11:03<br/>', NULL, 'HORARIOS', '2023-11-05', '14:11:03', '2023-11-05 18:11:03', '2023-11-05 18:11:03'),
(176, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ UN HORARIO', 'id: 2<br/>grupo_id: 2<br/>modalidad: VIRTUAL<br/>dias: 0,0,1,1,0,0,0<br/>fecha_inicio: 2023-11-12<br/>fecha_fin: 2023-11-21<br/>hora_inicio: 15:00:00<br/>hora_fin: 17:00:00<br/>created_at: 2023-11-05 14:11:03<br/>updated_at: 2023-11-05 14:11:03<br/>', NULL, 'HORARIOS', '2023-11-05', '14:11:10', '2023-11-05 18:11:10', '2023-11-05 18:11:10'),
(177, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN GRUPO', 'id: 2<br/>nombre: GRUPO #2<br/>descripcion: GRUPO DE PRUEBA<br/>link_reunion: <br/>estado: ACTIVO<br/>created_at: 2023-11-05 14:10:19<br/>updated_at: 2023-11-05 14:10:19<br/>', 'id: 2<br/>nombre: GRUPO #2<br/>descripcion: GRUPO DE PRUEBA<br/>link_reunion: <br/>estado: INACTIVO<br/>created_at: 2023-11-05 14:10:19<br/>updated_at: 2023-11-05 14:11:16<br/>', 'GRUPOS', '2023-11-05', '14:11:16', '2023-11-05 18:11:16', '2023-11-05 18:11:16'),
(178, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN GRUPO', 'id: 2<br/>nombre: GRUPO #2<br/>descripcion: GRUPO DE PRUEBA<br/>link_reunion: <br/>estado: INACTIVO<br/>created_at: 2023-11-05 14:10:19<br/>updated_at: 2023-11-05 14:11:16<br/>', 'id: 2<br/>nombre: GRUPO #2<br/>descripcion: GRUPO DE PRUEBA<br/>link_reunion: <br/>estado: ACTIVO<br/>created_at: 2023-11-05 14:10:19<br/>updated_at: 2023-11-05 14:11:28<br/>', 'GRUPOS', '2023-11-05', '14:11:28', '2023-11-05 18:11:28', '2023-11-05 18:11:28'),
(179, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UNA ASIGNACIÓN DE PROFESOR', 'created_at: 2023-11-06 11:29:39<br/>grupo_id: 1<br/>id: 1<br/>profesor_id: 1<br/>updated_at: 2023-11-06 11:29:39<br/>user_id: 6<br/>', NULL, 'GRUPO PROFESOR', '2023-11-06', '11:29:39', '2023-11-06 15:29:39', '2023-11-06 15:29:39'),
(180, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UNA ASIGNACIÓN DE PROFESOR', 'created_at: 2023-11-06 11:29:39<br/>grupo_id: 1<br/>id: 1<br/>profesor_id: 1<br/>updated_at: 2023-11-06 11:29:39<br/>user_id: 6<br/>', 'created_at: 2023-11-06 11:29:39<br/>grupo_id: 2<br/>id: 1<br/>profesor_id: 1<br/>updated_at: 2023-11-06 11:29:44<br/>user_id: 6<br/>', 'GRUPO PROFESOR', '2023-11-06', '11:29:44', '2023-11-06 15:29:44', '2023-11-06 15:29:44'),
(181, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UNA ASIGNACIÓN DE PROFESOR', 'created_at: 2023-11-06 11:29:39<br/>grupo_id: 2<br/>id: 1<br/>profesor_id: 1<br/>updated_at: 2023-11-06 11:29:44<br/>user_id: 6<br/>', 'created_at: 2023-11-06 11:29:39<br/>grupo_id: 1<br/>id: 1<br/>profesor_id: 1<br/>updated_at: 2023-11-06 11:29:59<br/>user_id: 6<br/>', 'GRUPO PROFESOR', '2023-11-06', '11:29:59', '2023-11-06 15:29:59', '2023-11-06 15:29:59'),
(182, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ UNA ASIGNACIÓN DE PROFESOR', 'created_at: 2023-11-06 11:29:39<br/>grupo_id: 1<br/>id: 1<br/>profesor_id: 1<br/>updated_at: 2023-11-06 11:29:59<br/>user_id: 6<br/>', NULL, 'GRUPO PROFESOR', '2023-11-06', '11:30:07', '2023-11-06 15:30:07', '2023-11-06 15:30:07'),
(183, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UNA ASIGNACIÓN DE PROFESOR', 'created_at: 2023-11-06 11:30:18<br/>grupo_id: 1<br/>id: 1<br/>profesor_id: 1<br/>updated_at: 2023-11-06 11:30:18<br/>user_id: 6<br/>', NULL, 'GRUPO PROFESOR', '2023-11-06', '11:30:18', '2023-11-06 15:30:18', '2023-11-06 15:30:18'),
(184, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UNA ASIGNACIÓN DE PROFESOR', 'created_at: 2023-11-06 11:30:18<br/>grupo_id: 1<br/>id: 1<br/>profesor_id: 1<br/>updated_at: 2023-11-06 11:30:18<br/>user_id: 6<br/>', 'created_at: 2023-11-06 11:30:18<br/>grupo_id: 1<br/>id: 1<br/>profesor_id: 1<br/>updated_at: 2023-11-06 11:30:18<br/>user_id: 6<br/>', 'GRUPO PROFESOR', '2023-11-06', '11:33:17', '2023-11-06 15:33:17', '2023-11-06 15:33:17'),
(185, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UNA ASIGNACIÓN DE PROFESOR', 'created_at: 2023-11-06 11:30:18<br/>grupo_id: 1<br/>id: 1<br/>profesor_id: 1<br/>updated_at: 2023-11-06 11:30:18<br/>user_id: 6<br/>', 'created_at: 2023-11-06 11:30:18<br/>grupo_id: 2<br/>id: 1<br/>profesor_id: 1<br/>updated_at: 2023-11-06 11:33:21<br/>user_id: 6<br/>', 'GRUPO PROFESOR', '2023-11-06', '11:33:21', '2023-11-06 15:33:21', '2023-11-06 15:33:21'),
(186, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UNA ASIGNACIÓN DE PROFESOR', 'created_at: 2023-11-06 11:30:18<br/>grupo_id: 2<br/>id: 1<br/>profesor_id: 1<br/>updated_at: 2023-11-06 11:33:21<br/>user_id: 6<br/>', 'created_at: 2023-11-06 11:30:18<br/>grupo_id: 1<br/>id: 1<br/>profesor_id: 1<br/>updated_at: 2023-11-06 11:33:33<br/>user_id: 6<br/>', 'GRUPO PROFESOR', '2023-11-06', '11:33:33', '2023-11-06 15:33:33', '2023-11-06 15:33:33'),
(187, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO RECURSO', 'created_at: 2023-11-06 12:07:15<br/>fecha: 2023-11-06<br/>grupo_id: 1<br/>hora: 12:07<br/>id: 1<br/>link: HTTPS://WWW.YOUTUBE.COM/<br/>titulo: LECTURA #1<br/>updated_at: 2023-11-06 12:07:15<br/>', NULL, 'RECURSOS', '2023-11-06', '12:07:15', '2023-11-06 16:07:15', '2023-11-06 16:07:15'),
(188, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ RECURSO', 'created_at: 2023-11-06 12:07:15<br/>fecha: 2023-11-06<br/>grupo_id: 1<br/>hora: 12:07:00<br/>id: 1<br/>link: HTTPS://WWW.YOUTUBE.COM/<br/>titulo: LECTURA #1<br/>updated_at: 2023-11-06 12:07:15<br/>', 'created_at: 2023-11-06 12:07:15<br/>fecha: 2023-11-06<br/>grupo_id: 1<br/>hora: 12:07:00<br/>id: 1<br/>link: HTTPS://WWW.YOUTUBE.COM/<br/>titulo: LECTURA #1<br/>updated_at: 2023-11-06 12:07:15<br/>', 'RECURSOS', '2023-11-06', '12:10:40', '2023-11-06 16:10:40', '2023-11-06 16:10:40'),
(189, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ RECURSO', 'created_at: 2023-11-06 12:07:15<br/>fecha: 2023-11-06<br/>grupo_id: 1<br/>hora: 12:07:00<br/>id: 1<br/>link: HTTPS://WWW.YOUTUBE.COM/<br/>titulo: LECTURA #1<br/>updated_at: 2023-11-06 12:07:15<br/>', 'created_at: 2023-11-06 12:07:15<br/>fecha: 2023-11-06<br/>grupo_id: 1<br/>hora: 12:07:00<br/>id: 1<br/>link: https://www.youtube.com/<br/>titulo: LECTURA #1<br/>updated_at: 2023-11-06 12:10:47<br/>', 'RECURSOS', '2023-11-06', '12:10:47', '2023-11-06 16:10:47', '2023-11-06 16:10:47'),
(190, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ RECURSO', 'created_at: 2023-11-06 12:07:15<br/>fecha: 2023-11-06<br/>grupo_id: 1<br/>hora: 12:07:00<br/>id: 1<br/>link: https://www.youtube.com/<br/>titulo: LECTURA #1<br/>updated_at: 2023-11-06 12:10:47<br/>', NULL, 'RECURSOS', '2023-11-06', '12:11:22', '2023-11-06 16:11:22', '2023-11-06 16:11:22'),
(191, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO RECURSO', 'created_at: 2023-11-06 12:12:13<br/>fecha: 2023-11-06<br/>grupo_id: 1<br/>hora: 12:12<br/>id: 1<br/>link: https://www.youtube.com/<br/>titulo: LECTURA #1<br/>updated_at: 2023-11-06 12:12:13<br/>', NULL, 'RECURSOS', '2023-11-06', '12:12:13', '2023-11-06 16:12:13', '2023-11-06 16:12:13'),
(192, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO RECURSO', 'created_at: 2023-11-06 12:24:06<br/>fecha: 2023-11-06<br/>grupo_id: 2<br/>hora: 12:24<br/>id: 2<br/>link: https://www.facebook.com/<br/>titulo: TITULO 2<br/>updated_at: 2023-11-06 12:24:06<br/>', NULL, 'RECURSOS', '2023-11-06', '12:24:06', '2023-11-06 16:24:06', '2023-11-06 16:24:06'),
(193, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com MODIFICÓ RECURSO', 'created_at: 2023-11-06 12:12:13<br/>fecha: 2023-11-06<br/>grupo_id: 1<br/>hora: 12:12:00<br/>id: 1<br/>link: https://www.youtube.com/<br/>titulo: LECTURA #1<br/>updated_at: 2023-11-06 12:12:13<br/>', 'created_at: 2023-11-06 12:12:13<br/>fecha: 2023-11-06<br/>grupo_id: 1<br/>hora: 12:12:00<br/>id: 1<br/>link: https://www.youtube.com/mod<br/>titulo: LECTURA #1<br/>updated_at: 2023-11-06 12:31:17<br/>', 'RECURSOS', '2023-11-06', '12:31:17', '2023-11-06 16:31:17', '2023-11-06 16:31:17'),
(194, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com MODIFICÓ RECURSO', 'created_at: 2023-11-06 12:12:13<br/>fecha: 2023-11-06<br/>grupo_id: 1<br/>hora: 12:12:00<br/>id: 1<br/>link: https://www.youtube.com/mod<br/>titulo: LECTURA #1<br/>updated_at: 2023-11-06 12:31:17<br/>', 'created_at: 2023-11-06 12:12:13<br/>fecha: 2023-11-06<br/>grupo_id: 1<br/>hora: 12:12:00<br/>id: 1<br/>link: https://www.youtube.com<br/>titulo: LECTURA #1<br/>updated_at: 2023-11-06 12:31:22<br/>', 'RECURSOS', '2023-11-06', '12:31:22', '2023-11-06 16:31:22', '2023-11-06 16:31:22'),
(195, 6, 'CREACIÓN', 'EL USUARIO felipe@gmail.com REGISTRO UN EXAMEN DE NIVELACION', 'created_at: 2023-11-06 17:31:29<br/>curso_id: 7<br/>id: 2<br/>updated_at: 2023-11-06 17:31:29<br/>', NULL, 'EXAMEN DE NIVELACION', '2023-11-06', '17:31:29', '2023-11-06 21:31:29', '2023-11-06 21:31:29'),
(196, 6, 'CREACIÓN', 'EL USUARIO felipe@gmail.com REGISTRO UN EXAMEN DE NIVELACION', 'created_at: 2023-11-06 17:52:37<br/>curso_id: 7<br/>id: 3<br/>updated_at: 2023-11-06 17:52:37<br/>', NULL, 'EXAMEN DE NIVELACION', '2023-11-06', '17:52:37', '2023-11-06 21:52:37', '2023-11-06 21:52:37'),
(197, 6, 'ELIMINACIÓN', 'EL USUARIO felipe@gmail.com ELIMINÓ UN EXAMEN DE NIVELACION', 'created_at: 2023-11-06 17:52:37<br/>curso_id: 7<br/>id: 3<br/>updated_at: 2023-11-06 17:52:37<br/>', NULL, 'EXAMEN DE NIVELACION', '2023-11-06', '18:00:04', '2023-11-06 22:00:04', '2023-11-06 22:00:04'),
(198, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com MODIFICÓ UN EXAMEN DE NIVELACION', 'created_at: 2023-11-06 17:31:29<br/>curso_id: 7<br/>id: 2<br/>updated_at: 2023-11-06 17:31:29<br/>', 'created_at: 2023-11-06 17:31:29<br/>curso_id: 7<br/>id: 2<br/>updated_at: 2023-11-06 17:31:29<br/>', 'EXAMEN DE NIVELACION', '2023-11-06', '18:02:03', '2023-11-06 22:02:03', '2023-11-06 22:02:03'),
(199, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\nMateriales digitales<br />\nRecursos tecnologicos<br />\nClases en vivo<br />\nCursos de preparación<br />\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-06 20:02:33<br/>', NULL, 'PLAN DE PAGOS', '2023-11-06', '20:02:33', '2023-11-07 00:02:33', '2023-11-07 00:02:33'),
(200, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\nPlataforma interactiva<br />\nMateriales digitales<br />\nRecursos tecnologicos<br />\nClases en vivo<br />\nCursos de preparación<br />\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-06 20:02:33<br/>', NULL, 'PLAN DE PAGOS', '2023-11-06', '20:02:33', '2023-11-07 00:02:33', '2023-11-07 00:02:33'),
(201, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\nPlataforma interactiva<br />\nMateriales digitales<br />\nRecursos tecnologicos<br />\nClases en vivo<br />\nCursos de preparación<br />\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-06 20:02:33<br/>', NULL, 'PLAN DE PAGOS', '2023-11-06', '20:02:33', '2023-11-07 00:02:33', '2023-11-07 00:02:33'),
(202, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'id: 5<br/>inscripcion_id: 4<br/>curso_id: 7<br/>nivel: NIVEL BÁSICO<br/>se_entero: INSTAGRAM<br/>desc_se_entero: <br/>plan_pago_id: 3<br/>plan_costo: 400.00<br/>forma_pago: WESTERN UNION<br/>archivo_pago: 1699362991_5.pdf<br/>desc_pago: WESTER UNION<br />\r\nMAX PONCE<br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: PENDIENTE<br/>created_at: 2023-11-07 09:16:31<br/>updated_at: 2023-11-07 09:16:31<br/>', 'id: 5<br/>inscripcion_id: 4<br/>curso_id: 7<br/>nivel: NIVEL BÁSICO<br/>se_entero: INSTAGRAM<br/>desc_se_entero: <br/>plan_pago_id: 3<br/>plan_costo: 400.00<br/>forma_pago: WESTERN UNION<br/>archivo_pago: 1699362991_5.pdf<br/>desc_pago: WESTER UNION<br />\r\nMAX PONCE<br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: ACEPTADO<br/>created_at: 2023-11-07 09:16:31<br/>updated_at: 2023-11-07 09:58:08<br/>', 'INSCRIPCION SOLICITUD', '2023-11-07', '09:58:08', '2023-11-07 13:58:08', '2023-11-07 13:58:08'),
(203, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'id: 4<br/>inscripcion_id: 3<br/>curso_id: 1<br/>nivel: NIVEL CERO<br/>se_entero: TIKTOK<br/>desc_se_entero: <br/>plan_pago_id: 1<br/>plan_costo: 49.99<br/>forma_pago: DEPÓSITO BANCARIO<br/>archivo_pago: 1699362710_4.png<br/>desc_pago: BANCO UNION<br />\r\nMARIA MAMANI<br />\r\nMONTO: 49.99<br />\r\nNRO. CUENTA: 1000034343<br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: PENDIENTE<br/>created_at: 2023-11-07 09:11:50<br/>updated_at: 2023-11-07 09:11:50<br/>', 'id: 4<br/>inscripcion_id: 3<br/>curso_id: 1<br/>nivel: NIVEL CERO<br/>se_entero: TIKTOK<br/>desc_se_entero: <br/>plan_pago_id: 1<br/>plan_costo: 49.99<br/>forma_pago: DEPÓSITO BANCARIO<br/>archivo_pago: 1699362710_4.png<br/>desc_pago: BANCO UNION<br />\r\nMARIA MAMANI<br />\r\nMONTO: 49.99<br />\r\nNRO. CUENTA: 1000034343<br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: ACEPTADO<br/>created_at: 2023-11-07 09:11:50<br/>updated_at: 2023-11-07 09:58:16<br/>', 'INSCRIPCION SOLICITUD', '2023-11-07', '09:58:16', '2023-11-07 13:58:16', '2023-11-07 13:58:16'),
(204, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UNA ASIGNACIÓN DE GRUPO', 'id: 2<br/>grupo_id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>curso_id: 7<br/>created_at: 2023-11-07 09:58:37<br/>updated_at: 2023-11-07 09:58:37<br/>', NULL, 'ASIGNACIÓN DE GRUPOS', '2023-11-07', '09:58:37', '2023-11-07 13:58:37', '2023-11-07 13:58:37'),
(205, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UNA ASIGNACIÓN DE GRUPO', 'id: 2<br/>grupo_id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>curso_id: 7<br/>created_at: 2023-11-07 09:58:37<br/>updated_at: 2023-11-07 09:58:37<br/>', 'id: 2<br/>grupo_id: 1<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>curso_id: 7<br/>created_at: 2023-11-07 09:58:37<br/>updated_at: 2023-11-07 09:58:45<br/>', 'ASIGNACIÓN DE GRUPOS', '2023-11-07', '09:58:45', '2023-11-07 13:58:45', '2023-11-07 13:58:45'),
(206, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UNA ASIGNACIÓN DE GRUPO', 'id: 3<br/>grupo_id: 2<br/>inscripcion_id: 3<br/>inscripcion_solicitud_id: 4<br/>curso_id: 1<br/>created_at: 2023-11-07 09:58:53<br/>updated_at: 2023-11-07 09:58:53<br/>', NULL, 'ASIGNACIÓN DE GRUPOS', '2023-11-07', '09:58:53', '2023-11-07 13:58:53', '2023-11-07 13:58:53'),
(207, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PROFESOR', 'id: 2<br/>nombres: MANUEL<br/>apellidos: PAREDES GONZALES<br/>ci: 434343<br/>nacionalidad: BOLIVIANO<br/>pais_residencia: BOLIVIA<br/>dir: LOS OLIVOS<br/>fono: 7888888<br/>especialidad: INGLES AVANZADO<br/>correo: manuel@gmail.com<br/>user_id: 10<br/>created_at: 2023-11-07 10:00:37<br/>updated_at: 2023-11-07 10:00:37<br/>', NULL, 'PROFESORES', '2023-11-07', '10:00:37', '2023-11-07 14:00:37', '2023-11-07 14:00:37'),
(208, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UNA ASIGNACIÓN DE PROFESOR', 'id: 2<br/>user_id: 10<br/>profesor_id: 2<br/>grupo_id: 2<br/>created_at: 2023-11-07 10:00:56<br/>updated_at: 2023-11-07 10:00:56<br/>', NULL, 'GRUPO PROFESOR', '2023-11-07', '10:00:56', '2023-11-07 14:00:56', '2023-11-07 14:00:56'),
(209, 6, 'CREACIÓN', 'EL USUARIO felipe@gmail.com REGISTRO RECURSO', 'id: 3<br/>grupo_id: 1<br/>titulo: RECURSO #2<br/>link: https://www.facebook.com/<br/>fecha: 2023-11-07<br/>hora: 10:01<br/>created_at: 2023-11-07 10:01:20<br/>updated_at: 2023-11-07 10:01:20<br/>', NULL, 'RECURSOS', '2023-11-07', '10:01:20', '2023-11-07 14:01:20', '2023-11-07 14:01:20'),
(210, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PROFESOR', 'id: 3<br/>nombres: JUAN LUIS<br/>apellidos: CACERES CORTEZ<br/>ci: 89989<br/>nacionalidad: BOLIVIANO<br/>pais_residencia: BOLIVIA<br/>dir: LOS OLIVOS<br/>fono: 799999<br/>especialidad: INGLES<br/>correo: juanluis@gmail.com<br/>user_id: 11<br/>created_at: 2023-11-07 10:07:06<br/>updated_at: 2023-11-07 10:07:06<br/>', NULL, 'PROFESORES', '2023-11-07', '10:07:06', '2023-11-07 14:07:06', '2023-11-07 14:07:06'),
(211, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN GRUPO', 'id: 3<br/>nombre: GRUPO 3<br/>descripcion: GRUPO #3<br/>link_reunion: <br/>estado: ACTIVO<br/>created_at: 2023-11-07 10:07:23<br/>updated_at: 2023-11-07 10:07:23<br/>', NULL, 'GRUPOS', '2023-11-07', '10:07:23', '2023-11-07 14:07:23', '2023-11-07 14:07:23'),
(212, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UNA ASIGNACIÓN DE PROFESOR', 'id: 3<br/>user_id: 11<br/>profesor_id: 3<br/>grupo_id: 3<br/>created_at: 2023-11-07 10:07:30<br/>updated_at: 2023-11-07 10:07:30<br/>', NULL, 'GRUPO PROFESOR', '2023-11-07', '10:07:30', '2023-11-07 14:07:30', '2023-11-07 14:07:30'),
(213, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'id: 2<br/>inscripcion_id: 2<br/>curso_id: 3<br/>nivel: NIVEL BÁSICO<br/>se_entero: FACEBOOK<br/>desc_se_entero: <br/>plan_pago_id: 3<br/>plan_costo: 400.00<br/>forma_pago: DEPÓSITO BANCARIO<br/>archivo_pago: <br/>desc_pago: <br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: PENDIENTE<br/>created_at: 2023-11-07 08:56:43<br/>updated_at: 2023-11-07 08:56:43<br/>', 'id: 2<br/>inscripcion_id: 2<br/>curso_id: 3<br/>nivel: NIVEL BÁSICO<br/>se_entero: FACEBOOK<br/>desc_se_entero: <br/>plan_pago_id: 3<br/>plan_costo: 400.00<br/>forma_pago: DEPÓSITO BANCARIO<br/>archivo_pago: <br/>desc_pago: <br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: ACEPTADO<br/>created_at: 2023-11-07 08:56:43<br/>updated_at: 2023-11-07 10:07:45<br/>', 'INSCRIPCION SOLICITUD', '2023-11-07', '10:07:45', '2023-11-07 14:07:45', '2023-11-07 14:07:45'),
(214, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UNA ASIGNACIÓN DE GRUPO', 'id: 4<br/>grupo_id: 3<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 2<br/>curso_id: 3<br/>created_at: 2023-11-07 10:07:55<br/>updated_at: 2023-11-07 10:07:55<br/>', NULL, 'ASIGNACIÓN DE GRUPOS', '2023-11-07', '10:07:55', '2023-11-07 14:07:55', '2023-11-07 14:07:55'),
(215, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN HORARIO', 'id: 3<br/>grupo_id: 2<br/>modalidad: VIRTUAL<br/>dias: 1,0,0,0,0,0,1<br/>fecha_inicio: 2023-11-08<br/>fecha_fin: 2023-11-20<br/>hora_inicio: 18:00<br/>hora_fin: 20:00<br/>created_at: 2023-11-07 10:32:30<br/>updated_at: 2023-11-07 10:32:30<br/>', NULL, 'HORARIOS', '2023-11-07', '10:32:30', '2023-11-07 14:32:30', '2023-11-07 14:32:30'),
(216, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN HORARIO', 'id: 4<br/>grupo_id: 3<br/>modalidad: PRESENCIAL<br/>dias: 0,1,1,1,1,1,0<br/>fecha_inicio: 2023-11-10<br/>fecha_fin: 2023-11-30<br/>hora_inicio: 08:00<br/>hora_fin: 12:00<br/>created_at: 2023-11-07 10:32:57<br/>updated_at: 2023-11-07 10:32:57<br/>', NULL, 'HORARIOS', '2023-11-07', '10:32:57', '2023-11-07 14:32:57', '2023-11-07 14:32:57'),
(217, 11, 'CREACIÓN', 'EL USUARIO juanluis@gmail.com REGISTRO RECURSO', 'id: 4<br/>grupo_id: 3<br/>titulo: RECURSO #1 GRUPO 3<br/>link: https://www.instagram.com/<br/>fecha: 2023-11-07<br/>hora: 10:33<br/>created_at: 2023-11-07 10:33:55<br/>updated_at: 2023-11-07 10:33:55<br/>', NULL, 'RECURSOS', '2023-11-07', '10:33:55', '2023-11-07 14:33:55', '2023-11-07 14:33:55'),
(218, 11, 'CREACIÓN', 'EL USUARIO juanluis@gmail.com REGISTRO UN EXAMEN DE NIVELACION', 'id: 4<br/>curso_id: 3<br/>created_at: 2023-11-07 10:41:22<br/>updated_at: 2023-11-07 10:41:22<br/>', NULL, 'EXAMEN DE NIVELACION', '2023-11-07', '10:41:23', '2023-11-07 14:41:23', '2023-11-07 14:41:23'),
(219, 5, 'CREACIÓN', 'EL USUARIO marcos@gmail.com REALIZÓ UN EXAMEN DE NIVELACION', 'id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 2<br/>examen_nivelacion_id: 4<br/>puntaje: <br/>estado: PENDIENTE<br/>created_at: 2023-11-07 12:43:29<br/>updated_at: 2023-11-07 12:43:29<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-07', '12:43:29', '2023-11-07 16:43:29', '2023-11-07 16:43:29'),
(220, 11, 'MODIFICACIÓN', 'EL USUARIO juanluis@gmail.com CALIFICÓ UN EXAMEN DE NIVELACION', 'created_at: 2023-11-07 12:43:29<br/>estado: PENDIENTE<br/>examen_nivelacion_id: 4<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 2<br/>puntaje: 100<br/>updated_at: 2023-11-07 15:59:13<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-07', '15:59:13', '2023-11-07 19:59:13', '2023-11-07 19:59:13'),
(221, 11, 'MODIFICACIÓN', 'EL USUARIO juanluis@gmail.com CALIFICÓ UN EXAMEN DE NIVELACION', 'created_at: 2023-11-07 12:43:29<br/>estado: PENDIENTE<br/>examen_nivelacion_id: 4<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 2<br/>puntaje: 90<br/>updated_at: 2023-11-07 16:00:41<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-07', '16:00:41', '2023-11-07 20:00:41', '2023-11-07 20:00:41'),
(222, 11, 'MODIFICACIÓN', 'EL USUARIO juanluis@gmail.com CALIFICÓ UN EXAMEN DE NIVELACION', 'created_at: 2023-11-07 12:43:29<br/>estado: PENDIENTE<br/>examen_nivelacion_id: 4<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 2<br/>puntaje: 0<br/>updated_at: 2023-11-07 16:00:50<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-07', '16:00:50', '2023-11-07 20:00:50', '2023-11-07 20:00:50'),
(223, 11, 'MODIFICACIÓN', 'EL USUARIO juanluis@gmail.com CALIFICÓ UN EXAMEN DE NIVELACION', 'created_at: 2023-11-07 12:43:29<br/>estado: PENDIENTE<br/>examen_nivelacion_id: 4<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 2<br/>puntaje: 90<br/>updated_at: 2023-11-07 16:01:46<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-07', '16:01:46', '2023-11-07 20:01:46', '2023-11-07 20:01:46'),
(224, 11, 'MODIFICACIÓN', 'EL USUARIO juanluis@gmail.com CALIFICÓ UN EXAMEN DE NIVELACION', 'created_at: 2023-11-07 12:43:29<br/>estado: REVISADO<br/>examen_nivelacion_id: 4<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 2<br/>puntaje: 0<br/>updated_at: 2023-11-07 16:06:14<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-07', '16:06:14', '2023-11-07 20:06:14', '2023-11-07 20:06:14'),
(225, 11, 'MODIFICACIÓN', 'EL USUARIO juanluis@gmail.com CALIFICÓ UN EXAMEN DE NIVELACION', 'created_at: 2023-11-07 12:43:29<br/>estado: REVISADO<br/>examen_nivelacion_id: 4<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 2<br/>puntaje: 90<br/>updated_at: 2023-11-07 16:07:46<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-07', '16:07:46', '2023-11-07 20:07:46', '2023-11-07 20:07:46'),
(226, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN GRUPO', 'created_at: 2023-11-07 16:38:37<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR. EXCEPTEUR SINT OCCAECAT CUPIDATAT NON PROIDENT, SUNT IN CULPA QUI OFFICIA DESERUNT MOLLIT ANIM ID EST LABORUM.<br/>fecha: 2023-11-07<br/>grupo_id: 3<br/>hora: 16:38<br/>id: 1<br/>titulo: COMUNICADO #1<br/>updated_at: 2023-11-07 16:38:37<br/>', NULL, 'GRUPOS', '2023-11-07', '16:38:37', '2023-11-07 20:38:37', '2023-11-07 20:38:37'),
(227, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN GRUPO', 'created_at: 2023-11-07 16:38:37<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR. EXCEPTEUR SINT OCCAECAT CUPIDATAT NON PROIDENT, SUNT IN CULPA QUI OFFICIA DESERUNT MOLLIT ANIM ID EST LABORUM.<br/>fecha: 2023-11-07<br/>grupo_id: 3<br/>hora: 16:38:00<br/>id: 1<br/>titulo: COMUNICADO #1<br/>updated_at: 2023-11-07 16:38:37<br/>', 'created_at: 2023-11-07 16:38:37<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>fecha: 2023-11-07<br/>grupo_id: 3<br/>hora: 16:38:00<br/>id: 1<br/>titulo: COMUNICADO #1<br/>updated_at: 2023-11-07 16:38:47<br/>', 'GRUPOS', '2023-11-07', '16:38:47', '2023-11-07 20:38:47', '2023-11-07 20:38:47'),
(228, 11, 'CREACIÓN', 'EL USUARIO juanluis@gmail.com REGISTRO UN GRUPO', 'created_at: 2023-11-07 16:46:28<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM. TOMAR NOTA<br/>fecha: 2023-11-07<br/>grupo_id: 3<br/>hora: 16:46<br/>id: 2<br/>titulo: COMUNICADO DESDE USUARIO PROFESOR<br/>updated_at: 2023-11-07 16:46:28<br/>', NULL, 'GRUPOS', '2023-11-07', '16:46:28', '2023-11-07 20:46:28', '2023-11-07 20:46:28'),
(229, 11, 'ELIMINACIÓN', 'EL USUARIO juanluis@gmail.com ELIMINÓ UN GRUPO', 'created_at: 2023-11-07 16:38:37<br/>descripcion: LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR.<br/>fecha: 2023-11-07<br/>grupo_id: 3<br/>hora: 16:38:00<br/>id: 1<br/>titulo: COMUNICADO #1<br/>updated_at: 2023-11-07 16:38:47<br/>', NULL, 'GRUPOS', '2023-11-07', '16:47:06', '2023-11-07 20:47:06', '2023-11-07 20:47:06'),
(230, 11, 'MODIFICACIÓN', 'EL USUARIO juanluis@gmail.com ACTUALIZÓ EL LINK DE UN GRUPO', 'created_at: 2023-11-07 10:07:23<br/>descripcion: GRUPO #3<br/>estado: ACTIVO<br/>id: 3<br/>link_reunion: xd<br/>nombre: GRUPO 3<br/>updated_at: 2023-11-07 10:07:23<br/>', 'created_at: 2023-11-07 10:07:23<br/>descripcion: GRUPO #3<br/>estado: ACTIVO<br/>id: 3<br/>link_reunion: https://www.youtube.com/<br/>nombre: GRUPO 3<br/>updated_at: 2023-11-07 17:11:17<br/>', 'GRUPOS', '2023-11-07', '17:11:17', '2023-11-07 21:11:17', '2023-11-07 21:11:17'),
(231, 11, 'MODIFICACIÓN', 'EL USUARIO juanluis@gmail.com ACTUALIZÓ EL LINK DE UN GRUPO', 'created_at: 2023-11-07 10:07:23<br/>descripcion: GRUPO #3<br/>estado: ACTIVO<br/>id: 3<br/>link_reunion: https://www.youtube.com/<br/>nombre: GRUPO 3<br/>updated_at: 2023-11-07 17:11:17<br/>', 'created_at: 2023-11-07 10:07:23<br/>descripcion: GRUPO #3<br/>estado: ACTIVO<br/>id: 3<br/>link_reunion: https://www.youtube.com/<br/>nombre: GRUPO 3<br/>updated_at: 2023-11-07 17:11:17<br/>', 'GRUPOS', '2023-11-07', '17:11:35', '2023-11-07 21:11:35', '2023-11-07 21:11:35'),
(232, 11, 'MODIFICACIÓN', 'EL USUARIO juanluis@gmail.com ACTUALIZÓ EL LINK DE UN GRUPO', 'created_at: 2023-11-07 10:07:23<br/>descripcion: GRUPO #3<br/>estado: ACTIVO<br/>id: 3<br/>link_reunion: https://www.youtube.com/<br/>nombre: GRUPO 3<br/>updated_at: 2023-11-07 17:11:17<br/>', 'created_at: 2023-11-07 10:07:23<br/>descripcion: GRUPO #3<br/>estado: ACTIVO<br/>id: 3<br/>link_reunion: https://www.youtube.com/<br/>nombre: GRUPO 3<br/>updated_at: 2023-11-07 17:11:17<br/>', 'GRUPOS', '2023-11-07', '17:11:45', '2023-11-07 21:11:45', '2023-11-07 21:11:45'),
(233, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD DE GESTORÍA', 'antecedentes_penales: OTRO<br/>apellidos: MARTINEZ MARTINEZ<br/>codigo: S.1<br/>correo: carlosm@gmail.com<br/>created_at: 2023-11-02 18:45:56<br/>cuenta_bancaria: SI<br/>deportado_otro_pais: SI<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>edad: 23<br/>estado: <br/>estado_solicitud: PENDIENTE<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>familiar_deportado: SI<br/>familiares_eeuu: SI<br/>fecha_nac: 2000-01-01<br/>fono: 7777777<br/>gana_aproximadamente: 10000.00<br/>id: 1<br/>motivo: MOTIVO DEPORTACIÓN<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>nacionalidad: BOLIVIANO<br/>nombres: CARLOS<br/>parentesco: HERMANOS<br/>recomendado_por: LO VI EN FACEBOOK<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>sexo: HOMBRE<br/>solicito_visa: SI<br/>trabajo_actual: TRABAJO ACTUAL<br/>updated_at: 2023-11-02 18:45:56<br/>', 'antecedentes_penales: OTRO<br/>apellidos: MARTINEZ MARTINEZ<br/>codigo: S.1<br/>correo: carlosm@gmail.com<br/>created_at: 2023-11-02 18:45:56<br/>cuenta_bancaria: SI<br/>deportado_otro_pais: SI<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>edad: 23<br/>estado: <br/>estado_solicitud: ATENDIDO<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>familiar_deportado: SI<br/>familiares_eeuu: SI<br/>fecha_nac: 2000-01-01<br/>fono: 7777777<br/>gana_aproximadamente: 10000.00<br/>id: 1<br/>motivo: MOTIVO DEPORTACIÓN<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>nacionalidad: BOLIVIANO<br/>nombres: CARLOS<br/>parentesco: HERMANOS<br/>recomendado_por: LO VI EN FACEBOOK<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>sexo: HOMBRE<br/>solicito_visa: SI<br/>trabajo_actual: TRABAJO ACTUAL<br/>updated_at: 2023-11-07 18:11:15<br/>', 'GESTORÍA SOLICITUDES', '2023-11-07', '18:11:15', '2023-11-07 22:11:15', '2023-11-07 22:11:15'),
(234, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD DE GESTORÍA', 'antecedentes_penales: OTRO<br/>apellidos: MARTINEZ MARTINEZ<br/>codigo: S.1<br/>correo: carlosm@gmail.com<br/>created_at: 2023-11-02 18:45:56<br/>cuenta_bancaria: SI<br/>deportado_otro_pais: SI<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>edad: 23<br/>estado: <br/>estado_solicitud: ATENDIDO<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>familiar_deportado: SI<br/>familiares_eeuu: SI<br/>fecha_nac: 2000-01-01<br/>fono: 7777777<br/>gana_aproximadamente: 10000.00<br/>id: 1<br/>motivo: MOTIVO DEPORTACIÓN<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>nacionalidad: BOLIVIANO<br/>nombres: CARLOS<br/>parentesco: HERMANOS<br/>recomendado_por: LO VI EN FACEBOOK<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>sexo: HOMBRE<br/>solicito_visa: SI<br/>trabajo_actual: TRABAJO ACTUAL<br/>updated_at: 2023-11-07 18:11:15<br/>', 'antecedentes_penales: OTRO<br/>apellidos: MARTINEZ MARTINEZ<br/>codigo: S.1<br/>correo: carlosm@gmail.com<br/>created_at: 2023-11-02 18:45:56<br/>cuenta_bancaria: SI<br/>deportado_otro_pais: SI<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>edad: 23<br/>estado: <br/>estado_solicitud: NO RESPONDE<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>familiar_deportado: SI<br/>familiares_eeuu: SI<br/>fecha_nac: 2000-01-01<br/>fono: 7777777<br/>gana_aproximadamente: 10000.00<br/>id: 1<br/>motivo: MOTIVO DEPORTACIÓN<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>nacionalidad: BOLIVIANO<br/>nombres: CARLOS<br/>parentesco: HERMANOS<br/>recomendado_por: LO VI EN FACEBOOK<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>sexo: HOMBRE<br/>solicito_visa: SI<br/>trabajo_actual: TRABAJO ACTUAL<br/>updated_at: 2023-11-07 18:11:19<br/>', 'GESTORÍA SOLICITUDES', '2023-11-07', '18:11:19', '2023-11-07 22:11:19', '2023-11-07 22:11:19');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(235, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD DE GESTORÍA', 'antecedentes_penales: OTRO<br/>apellidos: MARTINEZ MARTINEZ<br/>codigo: S.1<br/>correo: carlosm@gmail.com<br/>created_at: 2023-11-02 18:45:56<br/>cuenta_bancaria: SI<br/>deportado_otro_pais: SI<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>edad: 23<br/>estado: <br/>estado_solicitud: NO RESPONDE<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>familiar_deportado: SI<br/>familiares_eeuu: SI<br/>fecha_nac: 2000-01-01<br/>fono: 7777777<br/>gana_aproximadamente: 10000.00<br/>id: 1<br/>motivo: MOTIVO DEPORTACIÓN<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>nacionalidad: BOLIVIANO<br/>nombres: CARLOS<br/>parentesco: HERMANOS<br/>recomendado_por: LO VI EN FACEBOOK<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>sexo: HOMBRE<br/>solicito_visa: SI<br/>trabajo_actual: TRABAJO ACTUAL<br/>updated_at: 2023-11-07 18:11:19<br/>', 'antecedentes_penales: OTRO<br/>apellidos: MARTINEZ MARTINEZ<br/>codigo: S.1<br/>correo: carlosm@gmail.com<br/>created_at: 2023-11-02 18:45:56<br/>cuenta_bancaria: SI<br/>deportado_otro_pais: SI<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>edad: 23<br/>estado: <br/>estado_solicitud: DESCARTADO<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>familiar_deportado: SI<br/>familiares_eeuu: SI<br/>fecha_nac: 2000-01-01<br/>fono: 7777777<br/>gana_aproximadamente: 10000.00<br/>id: 1<br/>motivo: MOTIVO DEPORTACIÓN<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>nacionalidad: BOLIVIANO<br/>nombres: CARLOS<br/>parentesco: HERMANOS<br/>recomendado_por: LO VI EN FACEBOOK<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>sexo: HOMBRE<br/>solicito_visa: SI<br/>trabajo_actual: TRABAJO ACTUAL<br/>updated_at: 2023-11-07 18:11:21<br/>', 'GESTORÍA SOLICITUDES', '2023-11-07', '18:11:21', '2023-11-07 22:11:21', '2023-11-07 22:11:21'),
(236, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD DE GESTORÍA', 'antecedentes_penales: OTRO<br/>apellidos: MARTINEZ MARTINEZ<br/>codigo: S.1<br/>correo: carlosm@gmail.com<br/>created_at: 2023-11-02 18:45:56<br/>cuenta_bancaria: SI<br/>deportado_otro_pais: SI<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>edad: 23<br/>estado: <br/>estado_solicitud: DESCARTADO<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>familiar_deportado: SI<br/>familiares_eeuu: SI<br/>fecha_nac: 2000-01-01<br/>fono: 7777777<br/>gana_aproximadamente: 10000.00<br/>id: 1<br/>motivo: MOTIVO DEPORTACIÓN<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>nacionalidad: BOLIVIANO<br/>nombres: CARLOS<br/>parentesco: HERMANOS<br/>recomendado_por: LO VI EN FACEBOOK<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>sexo: HOMBRE<br/>solicito_visa: SI<br/>trabajo_actual: TRABAJO ACTUAL<br/>updated_at: 2023-11-07 18:11:21<br/>', 'antecedentes_penales: OTRO<br/>apellidos: MARTINEZ MARTINEZ<br/>codigo: S.1<br/>correo: carlosm@gmail.com<br/>created_at: 2023-11-02 18:45:56<br/>cuenta_bancaria: SI<br/>deportado_otro_pais: SI<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>edad: 23<br/>estado: <br/>estado_solicitud: ATENDIDO<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>familiar_deportado: SI<br/>familiares_eeuu: SI<br/>fecha_nac: 2000-01-01<br/>fono: 7777777<br/>gana_aproximadamente: 10000.00<br/>id: 1<br/>motivo: MOTIVO DEPORTACIÓN<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>nacionalidad: BOLIVIANO<br/>nombres: CARLOS<br/>parentesco: HERMANOS<br/>recomendado_por: LO VI EN FACEBOOK<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>sexo: HOMBRE<br/>solicito_visa: SI<br/>trabajo_actual: TRABAJO ACTUAL<br/>updated_at: 2023-11-07 18:11:23<br/>', 'GESTORÍA SOLICITUDES', '2023-11-07', '18:11:23', '2023-11-07 22:11:23', '2023-11-07 22:11:23'),
(237, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD DE GESTORÍA', 'antecedentes_penales: OTRO<br/>apellidos: MARTINEZ MARTINEZ<br/>codigo: S.1<br/>correo: carlosm@gmail.com<br/>created_at: 2023-11-02 18:45:56<br/>cuenta_bancaria: SI<br/>deportado_otro_pais: SI<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>edad: 23<br/>estado: <br/>estado_solicitud: ATENDIDO<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>familiar_deportado: SI<br/>familiares_eeuu: SI<br/>fecha_nac: 2000-01-01<br/>fono: 7777777<br/>gana_aproximadamente: 10000.00<br/>id: 1<br/>motivo: MOTIVO DEPORTACIÓN<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>nacionalidad: BOLIVIANO<br/>nombres: CARLOS<br/>parentesco: HERMANOS<br/>recomendado_por: LO VI EN FACEBOOK<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>sexo: HOMBRE<br/>solicito_visa: SI<br/>trabajo_actual: TRABAJO ACTUAL<br/>updated_at: 2023-11-07 18:11:23<br/>', 'antecedentes_penales: OTRO<br/>apellidos: MARTINEZ MARTINEZ<br/>codigo: S.1<br/>correo: carlosm@gmail.com<br/>created_at: 2023-11-02 18:45:56<br/>cuenta_bancaria: SI<br/>deportado_otro_pais: SI<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>edad: 23<br/>estado: <br/>estado_solicitud: NO RESPONDE<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>familiar_deportado: SI<br/>familiares_eeuu: SI<br/>fecha_nac: 2000-01-01<br/>fono: 7777777<br/>gana_aproximadamente: 10000.00<br/>id: 1<br/>motivo: MOTIVO DEPORTACIÓN<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>nacionalidad: BOLIVIANO<br/>nombres: CARLOS<br/>parentesco: HERMANOS<br/>recomendado_por: LO VI EN FACEBOOK<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>sexo: HOMBRE<br/>solicito_visa: SI<br/>trabajo_actual: TRABAJO ACTUAL<br/>updated_at: 2023-11-07 18:23:08<br/>', 'GESTORÍA SOLICITUDES', '2023-11-07', '18:23:08', '2023-11-07 22:23:08', '2023-11-07 22:23:08'),
(238, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD DE GESTORÍA', 'antecedentes_penales: OTRO<br/>apellidos: MARTINEZ MARTINEZ<br/>codigo: S.1<br/>correo: carlosm@gmail.com<br/>created_at: 2023-11-02 18:45:56<br/>cuenta_bancaria: SI<br/>deportado_otro_pais: SI<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>edad: 23<br/>estado: <br/>estado_solicitud: NO RESPONDE<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>familiar_deportado: SI<br/>familiares_eeuu: SI<br/>fecha_nac: 2000-01-01<br/>fono: 7777777<br/>gana_aproximadamente: 10000.00<br/>id: 1<br/>motivo: MOTIVO DEPORTACIÓN<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>nacionalidad: BOLIVIANO<br/>nombres: CARLOS<br/>parentesco: HERMANOS<br/>recomendado_por: LO VI EN FACEBOOK<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>sexo: HOMBRE<br/>solicito_visa: SI<br/>trabajo_actual: TRABAJO ACTUAL<br/>updated_at: 2023-11-07 18:23:08<br/>', 'antecedentes_penales: OTRO<br/>apellidos: MARTINEZ MARTINEZ<br/>codigo: S.1<br/>correo: carlosm@gmail.com<br/>created_at: 2023-11-02 18:45:56<br/>cuenta_bancaria: SI<br/>deportado_otro_pais: SI<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>edad: 23<br/>estado: <br/>estado_solicitud: ATENDIDO<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>familiar_deportado: SI<br/>familiares_eeuu: SI<br/>fecha_nac: 2000-01-01<br/>fono: 7777777<br/>gana_aproximadamente: 10000.00<br/>id: 1<br/>motivo: MOTIVO DEPORTACIÓN<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>nacionalidad: BOLIVIANO<br/>nombres: CARLOS<br/>parentesco: HERMANOS<br/>recomendado_por: LO VI EN FACEBOOK<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>sexo: HOMBRE<br/>solicito_visa: SI<br/>trabajo_actual: TRABAJO ACTUAL<br/>updated_at: 2023-11-07 18:23:10<br/>', 'GESTORÍA SOLICITUDES', '2023-11-07', '18:23:10', '2023-11-07 22:23:10', '2023-11-07 22:23:10'),
(239, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LAS CREDENCIALES DE ENVIO DE CORREOS', 'id: 1<br/>correo: correosyseventos@gmail.com<br/>nombre: Institute<br/>password: vzxihjayuqaxorwc<br/>created_at: 2023-11-08 12:26:26<br/>updated_at: 2023-11-08 12:26:26<br/>', NULL, 'ENVIO DE CORREOS', '2023-11-08', '12:26:26', '2023-11-08 16:26:26', '2023-11-08 16:26:26'),
(240, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LAS CREDENCIALES DE ENVIO DE CORREOS', 'id: 1<br/>correo: correosyseventos@gmail.com<br/>nombre: Institute<br/>password: vzxihjayuqaxorwc<br/>created_at: 2023-11-08 12:26:26<br/>updated_at: 2023-11-08 12:26:26<br/>', NULL, 'ENVIO DE CORREOS', '2023-11-08', '12:26:39', '2023-11-08 16:26:39', '2023-11-08 16:26:39'),
(241, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$PyYyeiVACluSevqQ9FEOm.jLPw744pSMyVy3Ek7DwvDo/bveMFj4q<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-10-07 19:39:10<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: VICTORGONZALO.AS@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$PyYyeiVACluSevqQ9FEOm.jLPw744pSMyVy3Ek7DwvDo/bveMFj4q<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-11-08 12:37:58<br/>', 'USUARIOS', '2023-11-08', '12:37:58', '2023-11-08 16:37:58', '2023-11-08 16:37:58'),
(242, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: VICTORGONZALO.AS@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$10$PyYyeiVACluSevqQ9FEOm.jLPw744pSMyVy3Ek7DwvDo/bveMFj4q<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-11-08 12:37:58<br/>', 'id: 2<br/>usuario: victorgonzalo.as@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: victorgonzalo.as@gmail.com<br/>fono: 7777777<br/>password: $2y$10$PyYyeiVACluSevqQ9FEOm.jLPw744pSMyVy3Ek7DwvDo/bveMFj4q<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-11-08 12:39:02<br/>', 'USUARIOS', '2023-11-08', '12:39:02', '2023-11-08 16:39:02', '2023-11-08 16:39:02'),
(243, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: victorgonzalo.as@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: victorgonzalo.as@gmail.com<br/>fono: 7777777<br/>password: $2y$10$0zDT1yKo.p/VfrlLMdZ2R.crem.MX0/26JFHOdA2FJssdu5DBFcWe<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-11-08 12:55:24<br/>', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>dir: LOS OLIVOS<br/>correo: juan@gmail.com<br/>fono: 7777777<br/>password: $2y$10$x7Y89S.ziR0AuMQvI16ex.ckDsy3lb.mJlRy2IruS4qg7eiQLSC2G<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>acceso: 1<br/>fecha_registro: 2023-10-07<br/>created_at: 2023-10-07 19:33:20<br/>updated_at: 2023-11-08 12:56:29<br/>', 'USUARIOS', '2023-11-08', '12:56:29', '2023-11-08 16:56:29', '2023-11-08 16:56:29'),
(244, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN GRUPO', 'created_at: 2023-11-09 21:50:24<br/>descripcion: DESC 4<br/>estado: ACTIVO<br/>id: 4<br/>link_reunion: <br/>nombre: GRUPO #4<br/>updated_at: 2023-11-09 21:50:24<br/>', NULL, 'GRUPOS', '2023-11-09', '21:50:24', '2023-11-10 01:50:24', '2023-11-10 01:50:24'),
(245, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN GRUPO', 'created_at: 2023-11-09 21:50:59<br/>descripcion: DESC 4<br/>estado: ACTIVO<br/>id: 5<br/>link_reunion: <br/>nombre: GRUPO #4<br/>updated_at: 2023-11-09 21:50:59<br/>', NULL, 'GRUPOS', '2023-11-09', '21:50:59', '2023-11-10 01:50:59', '2023-11-10 01:50:59'),
(246, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ UN GRUPO', 'created_at: 2023-11-09 21:50:59<br/>descripcion: DESC 4<br/>estado: ACTIVO<br/>id: 5<br/>link_reunion: <br/>nombre: GRUPO #4<br/>updated_at: 2023-11-09 21:50:59<br/>', NULL, 'GRUPOS', '2023-11-09', '21:54:08', '2023-11-10 01:54:08', '2023-11-10 01:54:08'),
(247, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:32:45', '2023-11-10 15:32:45', '2023-11-10 15:32:45'),
(248, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:32:45', '2023-11-10 15:32:45', '2023-11-10 15:32:45'),
(249, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:32:45', '2023-11-10 15:32:45', '2023-11-10 15:32:45'),
(250, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE PAGOS', 'id: 3<br/>archivo: <br/>otras_formas: <br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '11:32:45', '2023-11-10 15:32:45', '2023-11-10 15:32:45'),
(254, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:33:31', '2023-11-10 15:33:31', '2023-11-10 15:33:31'),
(255, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:33:31', '2023-11-10 15:33:31', '2023-11-10 15:33:31'),
(256, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:33:31', '2023-11-10 15:33:31', '2023-11-10 15:33:31'),
(257, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE PAGOS', 'id: 3<br/>archivo: <br/>otras_formas: <br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '11:33:31', '2023-11-10 15:33:31', '2023-11-10 15:33:31'),
(258, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:33:58', '2023-11-10 15:33:58', '2023-11-10 15:33:58'),
(259, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:33:58', '2023-11-10 15:33:58', '2023-11-10 15:33:58'),
(260, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:33:58', '2023-11-10 15:33:58', '2023-11-10 15:33:58'),
(261, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE PAGOS', 'id: 3<br/>archivo: <br/>otras_formas: <br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '11:33:58', '2023-11-10 15:33:58', '2023-11-10 15:33:58'),
(262, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:35:39', '2023-11-10 15:35:39', '2023-11-10 15:35:39'),
(263, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:35:39', '2023-11-10 15:35:39', '2023-11-10 15:35:39'),
(264, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:35:39', '2023-11-10 15:35:39', '2023-11-10 15:35:39'),
(265, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE PAGOS', 'id: 3<br/>archivo: <br/>otras_formas: <br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '11:35:39', '2023-11-10 15:35:39', '2023-11-10 15:35:39'),
(266, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:35:42', '2023-11-10 15:35:42', '2023-11-10 15:35:42'),
(267, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:35:42', '2023-11-10 15:35:42', '2023-11-10 15:35:42'),
(268, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:35:42', '2023-11-10 15:35:42', '2023-11-10 15:35:42'),
(269, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE PAGOS', 'id: 3<br/>archivo: <br/>otras_formas: <br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '11:35:42', '2023-11-10 15:35:42', '2023-11-10 15:35:42'),
(270, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:35:48', '2023-11-10 15:35:48', '2023-11-10 15:35:48'),
(271, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:35:48', '2023-11-10 15:35:48', '2023-11-10 15:35:48'),
(272, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:35:48', '2023-11-10 15:35:48', '2023-11-10 15:35:48'),
(273, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE PAGOS', 'id: 3<br/>archivo: <br/>otras_formas: <br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '11:35:48', '2023-11-10 15:35:48', '2023-11-10 15:35:48'),
(274, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:36:05', '2023-11-10 15:36:05', '2023-11-10 15:36:05'),
(275, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:36:05', '2023-11-10 15:36:05', '2023-11-10 15:36:05'),
(276, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:36:05', '2023-11-10 15:36:05', '2023-11-10 15:36:05'),
(277, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE PAGOS', 'id: 3<br/>archivo: <br/>otras_formas: <br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '11:36:05', '2023-11-10 15:36:05', '2023-11-10 15:36:05'),
(278, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:36:19', '2023-11-10 15:36:19', '2023-11-10 15:36:19'),
(279, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:32:45<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:36:19', '2023-11-10 15:36:19', '2023-11-10 15:36:19'),
(280, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 300<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:36:19<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:36:19', '2023-11-10 15:36:19', '2023-11-10 15:36:19'),
(281, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE PAGOS', 'id: 3<br/>archivo: <br/>otras_formas: <br/>created_at: <br/>updated_at: 2023-11-10 11:36:19<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '11:36:19', '2023-11-10 15:36:19', '2023-11-10 15:36:19'),
(282, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual m1<br/>costo: 50<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas m1<br/>created_at: <br/>updated_at: 2023-11-10 11:36:53<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:36:53', '2023-11-10 15:36:53', '2023-11-10 15:36:53'),
(283, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral m2<br/>costo: 131<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas m2<br/>created_at: <br/>updated_at: 2023-11-10 11:36:53<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:36:53', '2023-11-10 15:36:53', '2023-11-10 15:36:53'),
(284, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual m3<br/>costo: 401<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas m3<br/>created_at: <br/>updated_at: 2023-11-10 11:36:53<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:36:53', '2023-11-10 15:36:53', '2023-11-10 15:36:53'),
(285, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE PAGOS', 'id: 3<br/>archivo: <br/>otras_formas: <br/>created_at: <br/>updated_at: 2023-11-10 11:36:53<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '11:36:53', '2023-11-10 15:36:53', '2023-11-10 15:36:53'),
(286, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:37:14', '2023-11-10 15:37:14', '2023-11-10 15:37:14'),
(287, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:37:14', '2023-11-10 15:37:14', '2023-11-10 15:37:14'),
(288, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:37:14', '2023-11-10 15:37:14', '2023-11-10 15:37:14'),
(289, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE PAGOS', 'id: 3<br/>archivo: <br/>otras_formas: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '11:37:14', '2023-11-10 15:37:14', '2023-11-10 15:37:14'),
(290, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:46:24', '2023-11-10 15:46:24', '2023-11-10 15:46:24'),
(291, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:46:24', '2023-11-10 15:46:24', '2023-11-10 15:46:24'),
(292, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '11:46:24', '2023-11-10 15:46:24', '2023-11-10 15:46:24'),
(293, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE PAGOS', 'id: 3<br/>archivo: <br/>otras_formas: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '11:46:24', '2023-11-10 15:46:24', '2023-11-10 15:46:24'),
(294, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:32:50', '2023-11-10 16:32:50', '2023-11-10 16:32:50'),
(295, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:32:50', '2023-11-10 16:32:50', '2023-11-10 16:32:50'),
(296, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:32:50', '2023-11-10 16:32:50', '2023-11-10 16:32:50'),
(297, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:32:50', '2023-11-10 16:32:50', '2023-11-10 16:32:50'),
(298, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:33:08', '2023-11-10 16:33:08', '2023-11-10 16:33:08'),
(299, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:33:08', '2023-11-10 16:33:08', '2023-11-10 16:33:08'),
(300, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:33:08', '2023-11-10 16:33:08', '2023-11-10 16:33:08'),
(301, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:33:08', '2023-11-10 16:33:08', '2023-11-10 16:33:08'),
(302, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:35:44', '2023-11-10 16:35:44', '2023-11-10 16:35:44'),
(303, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:35:44', '2023-11-10 16:35:44', '2023-11-10 16:35:44'),
(304, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:35:44', '2023-11-10 16:35:44', '2023-11-10 16:35:44'),
(305, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:35:44', '2023-11-10 16:35:44', '2023-11-10 16:35:44'),
(306, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:36:00', '2023-11-10 16:36:00', '2023-11-10 16:36:00'),
(307, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:36:00', '2023-11-10 16:36:00', '2023-11-10 16:36:00'),
(308, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:36:00', '2023-11-10 16:36:00', '2023-11-10 16:36:00'),
(309, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:36:00', '2023-11-10 16:36:00', '2023-11-10 16:36:00'),
(310, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:36:30', '2023-11-10 16:36:30', '2023-11-10 16:36:30'),
(311, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:36:30', '2023-11-10 16:36:30', '2023-11-10 16:36:30'),
(312, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:36:30', '2023-11-10 16:36:30', '2023-11-10 16:36:30'),
(313, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:36:30', '2023-11-10 16:36:30', '2023-11-10 16:36:30'),
(314, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:38:07', '2023-11-10 16:38:07', '2023-11-10 16:38:07'),
(315, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:38:07', '2023-11-10 16:38:07', '2023-11-10 16:38:07'),
(316, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:38:07', '2023-11-10 16:38:07', '2023-11-10 16:38:07'),
(317, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:38:07', '2023-11-10 16:38:07', '2023-11-10 16:38:07'),
(318, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:38:19', '2023-11-10 16:38:19', '2023-11-10 16:38:19'),
(319, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:38:19', '2023-11-10 16:38:19', '2023-11-10 16:38:19'),
(320, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:38:19', '2023-11-10 16:38:19', '2023-11-10 16:38:19'),
(321, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:38:19', '2023-11-10 16:38:19', '2023-11-10 16:38:19'),
(322, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:40:05', '2023-11-10 16:40:05', '2023-11-10 16:40:05'),
(323, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:40:05', '2023-11-10 16:40:05', '2023-11-10 16:40:05'),
(324, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:40:05', '2023-11-10 16:40:05', '2023-11-10 16:40:05'),
(325, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:40:05', '2023-11-10 16:40:05', '2023-11-10 16:40:05'),
(326, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:41:03', '2023-11-10 16:41:03', '2023-11-10 16:41:03'),
(327, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:41:03', '2023-11-10 16:41:03', '2023-11-10 16:41:03'),
(328, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:41:03', '2023-11-10 16:41:03', '2023-11-10 16:41:03'),
(329, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:41:03', '2023-11-10 16:41:03', '2023-11-10 16:41:03'),
(330, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:42:20', '2023-11-10 16:42:20', '2023-11-10 16:42:20'),
(331, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:42:20', '2023-11-10 16:42:20', '2023-11-10 16:42:20');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(332, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:42:20', '2023-11-10 16:42:20', '2023-11-10 16:42:20'),
(333, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:42:20', '2023-11-10 16:42:20', '2023-11-10 16:42:20'),
(334, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:42:54', '2023-11-10 16:42:54', '2023-11-10 16:42:54'),
(335, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:42:54', '2023-11-10 16:42:54', '2023-11-10 16:42:54'),
(336, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:42:54', '2023-11-10 16:42:54', '2023-11-10 16:42:54'),
(337, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:42:54', '2023-11-10 16:42:54', '2023-11-10 16:42:54'),
(338, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:44:46', '2023-11-10 16:44:46', '2023-11-10 16:44:46'),
(339, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:44:46', '2023-11-10 16:44:46', '2023-11-10 16:44:46'),
(340, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:44:46', '2023-11-10 16:44:46', '2023-11-10 16:44:46'),
(341, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:44:46', '2023-11-10 16:44:46', '2023-11-10 16:44:46'),
(342, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:44:58', '2023-11-10 16:44:58', '2023-11-10 16:44:58'),
(343, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:44:58', '2023-11-10 16:44:58', '2023-11-10 16:44:58'),
(344, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:44:58', '2023-11-10 16:44:58', '2023-11-10 16:44:58'),
(345, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:44:58', '2023-11-10 16:44:58', '2023-11-10 16:44:58'),
(346, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:45:07', '2023-11-10 16:45:07', '2023-11-10 16:45:07'),
(347, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:45:07', '2023-11-10 16:45:07', '2023-11-10 16:45:07'),
(348, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:45:07', '2023-11-10 16:45:07', '2023-11-10 16:45:07'),
(349, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:45:07', '2023-11-10 16:45:07', '2023-11-10 16:45:07'),
(350, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:45:28', '2023-11-10 16:45:28', '2023-11-10 16:45:28'),
(351, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:45:28', '2023-11-10 16:45:28', '2023-11-10 16:45:28'),
(352, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:45:28', '2023-11-10 16:45:28', '2023-11-10 16:45:28'),
(353, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:45:28', '2023-11-10 16:45:28', '2023-11-10 16:45:28'),
(354, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:53:04', '2023-11-10 16:53:04', '2023-11-10 16:53:04'),
(355, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:53:04', '2023-11-10 16:53:04', '2023-11-10 16:53:04'),
(356, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:53:04', '2023-11-10 16:53:04', '2023-11-10 16:53:04'),
(357, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:53:04', '2023-11-10 16:53:04', '2023-11-10 16:53:04'),
(358, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:53:25', '2023-11-10 16:53:25', '2023-11-10 16:53:25'),
(359, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:53:25', '2023-11-10 16:53:25', '2023-11-10 16:53:25'),
(360, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:53:25', '2023-11-10 16:53:25', '2023-11-10 16:53:25'),
(361, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:53:25', '2023-11-10 16:53:25', '2023-11-10 16:53:25'),
(362, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:53:40', '2023-11-10 16:53:40', '2023-11-10 16:53:40'),
(363, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:53:40', '2023-11-10 16:53:40', '2023-11-10 16:53:40'),
(364, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:53:40', '2023-11-10 16:53:40', '2023-11-10 16:53:40'),
(365, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:53:40', '2023-11-10 16:53:40', '2023-11-10 16:53:40'),
(369, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:55:38', '2023-11-10 16:55:38', '2023-11-10 16:55:38'),
(370, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:55:38', '2023-11-10 16:55:38', '2023-11-10 16:55:38'),
(371, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:55:38', '2023-11-10 16:55:38', '2023-11-10 16:55:38'),
(372, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:55:38', '2023-11-10 16:55:38', '2023-11-10 16:55:38'),
(373, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:56:38', '2023-11-10 16:56:38', '2023-11-10 16:56:38'),
(374, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:56:38', '2023-11-10 16:56:38', '2023-11-10 16:56:38'),
(375, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:56:38', '2023-11-10 16:56:38', '2023-11-10 16:56:38'),
(376, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:56:38', '2023-11-10 16:56:38', '2023-11-10 16:56:38'),
(377, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS MENSUAL', 'id: 1<br/>titulo: Plan Mensual<br/>costo: 49.99<br/>detalles: Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:57:11', '2023-11-10 16:57:11', '2023-11-10 16:57:11'),
(378, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL', 'id: 2<br/>titulo: Plan Trimestral<br/>costo: 130.00<br/>detalles: Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:57:11', '2023-11-10 16:57:11', '2023-11-10 16:57:11'),
(379, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas<br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'PLAN DE PAGOS', '2023-11-10', '12:57:11', '2023-11-10 16:57:11', '2023-11-10 16:57:11'),
(380, 1, 'MODIFICAICÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS', 'id: 3<br/>forma_pago: <br/>archivo: <br/>tipo_archivo: <br/>descripcion: <br/>created_at: <br/>updated_at: 2023-11-10 11:37:14<br/>', NULL, 'INFORMACIÓN PAGOS', '2023-11-10', '12:57:11', '2023-11-10 16:57:11', '2023-11-10 16:57:11'),
(381, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN GRUPO', 'id: 6<br/>nombre: GRUPO #5<br/>descripcion: DESC5<br/>link_reunion: <br/>estado: ACTIVO<br/>created_at: 2023-11-10 13:42:08<br/>updated_at: 2023-11-10 13:42:08<br/>', NULL, 'GRUPOS', '2023-11-10', '13:42:08', '2023-11-10 17:42:08', '2023-11-10 17:42:08'),
(382, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD DE GESTORÍA', 'id: 1<br/>codigo: S.1<br/>nombres: CARLOS<br/>apellidos: MARTINEZ MARTINEZ<br/>fecha_nac: 2000-01-01<br/>edad: 23<br/>nacionalidad: BOLIVIANO<br/>estado: <br/>sexo: HOMBRE<br/>fono: 7777777<br/>familiares_eeuu: SI<br/>parentesco: HERMANOS<br/>familiar_deportado: SI<br/>motivo: MOTIVO DEPORTACIÓN<br/>deportado_otro_pais: SI<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>antecedentes_penales: OTRO<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>trabajo_actual: TRABAJO ACTUAL<br/>solicito_visa: SI<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>cuenta_bancaria: SI<br/>gana_aproximadamente: 10000.00<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>correo: carlosm@gmail.com<br/>recomendado_por: LO VI EN FACEBOOK<br/>estado_solicitud: ATENDIDO<br/>created_at: 2023-11-02 18:45:56<br/>updated_at: 2023-11-07 18:23:10<br/>', 'id: 1<br/>codigo: S.1<br/>nombres: CARLOS<br/>apellidos: MARTINEZ MARTINEZ<br/>fecha_nac: 2000-01-01<br/>edad: 23<br/>nacionalidad: BOLIVIANO<br/>estado: <br/>sexo: HOMBRE<br/>fono: 7777777<br/>familiares_eeuu: SI<br/>parentesco: HERMANOS<br/>familiar_deportado: SI<br/>motivo: MOTIVO DEPORTACIÓN<br/>deportado_otro_pais: SI<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>antecedentes_penales: OTRO<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>trabajo_actual: TRABAJO ACTUAL<br/>solicito_visa: SI<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>cuenta_bancaria: SI<br/>gana_aproximadamente: 10000.00<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>correo: carlosm@gmail.com<br/>recomendado_por: LO VI EN FACEBOOK<br/>estado_solicitud: NO RESPONDE<br/>created_at: 2023-11-02 18:45:56<br/>updated_at: 2023-11-10 13:47:52<br/>', 'GESTORÍA SOLICITUDES', '2023-11-10', '13:47:52', '2023-11-10 17:47:52', '2023-11-10 17:47:52'),
(383, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD DE GESTORÍA', 'id: 1<br/>codigo: S.1<br/>nombres: CARLOS<br/>apellidos: MARTINEZ MARTINEZ<br/>fecha_nac: 2000-01-01<br/>edad: 23<br/>nacionalidad: BOLIVIANO<br/>estado: <br/>sexo: HOMBRE<br/>fono: 7777777<br/>familiares_eeuu: SI<br/>parentesco: HERMANOS<br/>familiar_deportado: SI<br/>motivo: MOTIVO DEPORTACIÓN<br/>deportado_otro_pais: SI<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>antecedentes_penales: OTRO<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>trabajo_actual: TRABAJO ACTUAL<br/>solicito_visa: SI<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>cuenta_bancaria: SI<br/>gana_aproximadamente: 10000.00<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>correo: carlosm@gmail.com<br/>recomendado_por: LO VI EN FACEBOOK<br/>estado_solicitud: NO RESPONDE<br/>created_at: 2023-11-02 18:45:56<br/>updated_at: 2023-11-10 13:47:52<br/>', 'id: 1<br/>codigo: S.1<br/>nombres: CARLOS<br/>apellidos: MARTINEZ MARTINEZ<br/>fecha_nac: 2000-01-01<br/>edad: 23<br/>nacionalidad: BOLIVIANO<br/>estado: <br/>sexo: HOMBRE<br/>fono: 7777777<br/>familiares_eeuu: SI<br/>parentesco: HERMANOS<br/>familiar_deportado: SI<br/>motivo: MOTIVO DEPORTACIÓN<br/>deportado_otro_pais: SI<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>antecedentes_penales: OTRO<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>trabajo_actual: TRABAJO ACTUAL<br/>solicito_visa: SI<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>cuenta_bancaria: SI<br/>gana_aproximadamente: 10000.00<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>correo: carlosm@gmail.com<br/>recomendado_por: LO VI EN FACEBOOK<br/>estado_solicitud: DESCARTADO<br/>created_at: 2023-11-02 18:45:56<br/>updated_at: 2023-11-10 13:47:57<br/>', 'GESTORÍA SOLICITUDES', '2023-11-10', '13:47:57', '2023-11-10 17:47:57', '2023-11-10 17:47:57'),
(384, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD DE GESTORÍA', 'id: 1<br/>codigo: S.1<br/>nombres: CARLOS<br/>apellidos: MARTINEZ MARTINEZ<br/>fecha_nac: 2000-01-01<br/>edad: 23<br/>nacionalidad: BOLIVIANO<br/>estado: <br/>sexo: HOMBRE<br/>fono: 7777777<br/>familiares_eeuu: SI<br/>parentesco: HERMANOS<br/>familiar_deportado: SI<br/>motivo: MOTIVO DEPORTACIÓN<br/>deportado_otro_pais: SI<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>antecedentes_penales: OTRO<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>trabajo_actual: TRABAJO ACTUAL<br/>solicito_visa: SI<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>cuenta_bancaria: SI<br/>gana_aproximadamente: 10000.00<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>correo: carlosm@gmail.com<br/>recomendado_por: LO VI EN FACEBOOK<br/>estado_solicitud: DESCARTADO<br/>created_at: 2023-11-02 18:45:56<br/>updated_at: 2023-11-10 13:47:57<br/>', 'id: 1<br/>codigo: S.1<br/>nombres: CARLOS<br/>apellidos: MARTINEZ MARTINEZ<br/>fecha_nac: 2000-01-01<br/>edad: 23<br/>nacionalidad: BOLIVIANO<br/>estado: <br/>sexo: HOMBRE<br/>fono: 7777777<br/>familiares_eeuu: SI<br/>parentesco: HERMANOS<br/>familiar_deportado: SI<br/>motivo: MOTIVO DEPORTACIÓN<br/>deportado_otro_pais: SI<br/>motivo_otro_pais: MOTIVO DEPORTACIÓN OTRO PAÍS<br/>antecedentes_penales: OTRO<br/>desc_antecedentes: DESCRIPCIÓN DE ANTECEDENTES OTRO<br/>estudios: LIC. EN ECONOMÍA<br />\r\nING. EN SISTEMAS<br/>trabajo_actual: TRABAJO ACTUAL<br/>solicito_visa: SI<br/>motivo_rechazo: MOTIVO RECHAZO SOLICITUD<br/>cuenta_bancaria: SI<br/>gana_aproximadamente: 10000.00<br/>redes_sociales: HTTPS://WWW.FACEBOOK.COM<br />\r\nHTTPS://WWW.INSTAGRAM.COM<br/>correo: carlosm@gmail.com<br/>recomendado_por: LO VI EN FACEBOOK<br/>estado_solicitud: ATENDIDO<br/>created_at: 2023-11-02 18:45:56<br/>updated_at: 2023-11-10 13:48:02<br/>', 'GESTORÍA SOLICITUDES', '2023-11-10', '13:48:02', '2023-11-10 17:48:02', '2023-11-10 17:48:02'),
(385, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'id: 8<br/>codigo: C.8<br/>inscripcion_id: 6<br/>curso_id: 7<br/>nivel: NIVEL BÁSICO<br/>se_entero: OTRO<br/>desc_se_entero: DESCRIPCION OTRO<br/>plan_pago_id: 3<br/>plan_costo: 400.00<br/>forma_pago: ZELLE<br/>archivo_pago: <br/>desc_pago: <br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: PENDIENTE<br/>created_at: 2023-11-10 13:15:16<br/>updated_at: 2023-11-10 13:15:16<br/>', 'id: 8<br/>codigo: C.8<br/>inscripcion_id: 6<br/>curso_id: 7<br/>nivel: NIVEL BÁSICO<br/>se_entero: OTRO<br/>desc_se_entero: DESCRIPCION OTRO<br/>plan_pago_id: 3<br/>plan_costo: 400.00<br/>forma_pago: ZELLE<br/>archivo_pago: <br/>desc_pago: <br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: NO RESPONDE<br/>created_at: 2023-11-10 13:15:16<br/>updated_at: 2023-11-10 13:48:54<br/>', 'INSCRIPCION SOLICITUD', '2023-11-10', '13:48:54', '2023-11-10 17:48:54', '2023-11-10 17:48:54'),
(386, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'id: 8<br/>codigo: C.8<br/>inscripcion_id: 6<br/>curso_id: 7<br/>nivel: NIVEL BÁSICO<br/>se_entero: OTRO<br/>desc_se_entero: DESCRIPCION OTRO<br/>plan_pago_id: 3<br/>plan_costo: 400.00<br/>forma_pago: ZELLE<br/>archivo_pago: <br/>desc_pago: <br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: NO RESPONDE<br/>created_at: 2023-11-10 13:15:16<br/>updated_at: 2023-11-10 13:48:54<br/>', 'id: 8<br/>codigo: C.8<br/>inscripcion_id: 6<br/>curso_id: 7<br/>nivel: NIVEL BÁSICO<br/>se_entero: OTRO<br/>desc_se_entero: DESCRIPCION OTRO<br/>plan_pago_id: 3<br/>plan_costo: 400.00<br/>forma_pago: ZELLE<br/>archivo_pago: <br/>desc_pago: <br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: DESCARTADO<br/>created_at: 2023-11-10 13:15:16<br/>updated_at: 2023-11-10 13:48:56<br/>', 'INSCRIPCION SOLICITUD', '2023-11-10', '13:48:56', '2023-11-10 17:48:56', '2023-11-10 17:48:56'),
(387, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'id: 8<br/>codigo: C.8<br/>inscripcion_id: 6<br/>curso_id: 7<br/>nivel: NIVEL BÁSICO<br/>se_entero: OTRO<br/>desc_se_entero: DESCRIPCION OTRO<br/>plan_pago_id: 3<br/>plan_costo: 400.00<br/>forma_pago: ZELLE<br/>archivo_pago: <br/>desc_pago: <br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: DESCARTADO<br/>created_at: 2023-11-10 13:15:16<br/>updated_at: 2023-11-10 13:48:56<br/>', 'id: 8<br/>codigo: C.8<br/>inscripcion_id: 6<br/>curso_id: 7<br/>nivel: NIVEL BÁSICO<br/>se_entero: OTRO<br/>desc_se_entero: DESCRIPCION OTRO<br/>plan_pago_id: 3<br/>plan_costo: 400.00<br/>forma_pago: ZELLE<br/>archivo_pago: <br/>desc_pago: <br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: ACEPTADO<br/>created_at: 2023-11-10 13:15:16<br/>updated_at: 2023-11-10 13:48:58<br/>', 'INSCRIPCION SOLICITUD', '2023-11-10', '13:48:58', '2023-11-10 17:48:58', '2023-11-10 17:48:58'),
(388, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'id: 7<br/>codigo: C.7<br/>inscripcion_id: 6<br/>curso_id: 1<br/>nivel: NIVEL CERO<br/>se_entero: FACEBOOK<br/>desc_se_entero: <br/>plan_pago_id: 1<br/>plan_costo: 49.99<br/>forma_pago: DEPÓSITO BANCARIO<br/>archivo_pago: <br/>desc_pago: <br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: PENDIENTE<br/>created_at: 2023-11-10 13:07:30<br/>updated_at: 2023-11-10 13:07:30<br/>', 'id: 7<br/>codigo: C.7<br/>inscripcion_id: 6<br/>curso_id: 1<br/>nivel: NIVEL CERO<br/>se_entero: FACEBOOK<br/>desc_se_entero: <br/>plan_pago_id: 1<br/>plan_costo: 49.99<br/>forma_pago: DEPÓSITO BANCARIO<br/>archivo_pago: <br/>desc_pago: <br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: ACEPTADO<br/>created_at: 2023-11-10 13:07:30<br/>updated_at: 2023-11-10 13:49:04<br/>', 'INSCRIPCION SOLICITUD', '2023-11-10', '13:49:04', '2023-11-10 17:49:04', '2023-11-10 17:49:04'),
(389, 5, 'CREACIÓN', 'EL USUARIO marcos@gmail.com REALIZÓ UN EXAMEN DE NIVELACION', 'id: 3<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>examen_nivelacion_id: 2<br/>puntaje: 0<br/>estado: PENDIENTE<br/>created_at: 2023-11-10 14:11:35<br/>updated_at: 2023-11-10 14:11:35<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-10', '14:11:36', '2023-11-10 18:11:36', '2023-11-10 18:11:36'),
(390, 3, 'MODIFICACIÓN', 'EL USUARIO maria@gmail.com MODIFICÓ UN EXAMEN DE NIVELACION', 'id: 4<br/>curso_id: 3<br/>created_at: 2023-11-07 10:41:22<br/>updated_at: 2023-11-07 10:41:22<br/>', 'id: 4<br/>curso_id: 3<br/>created_at: 2023-11-07 10:41:22<br/>updated_at: 2023-11-07 10:41:22<br/>', 'EXAMEN DE NIVELACION', '2023-11-10', '14:18:28', '2023-11-10 18:18:28', '2023-11-10 18:18:28'),
(391, 6, 'CREACIÓN', 'EL USUARIO felipe@gmail.com REGISTRO UN GRUPO', 'id: 3<br/>grupo_id: 1<br/>titulo: COMUNIDO GRUPO 1<br/>descripcion: COMUNICADO DESDE USE PROFESOR<br/>fecha: 2023-11-10<br/>hora: 14:30<br/>created_at: 2023-11-10 14:30:08<br/>updated_at: 2023-11-10 14:30:08<br/>', NULL, 'GRUPOS', '2023-11-10', '14:30:08', '2023-11-10 18:30:08', '2023-11-10 18:30:08'),
(392, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN EXAMEN DE NIVELACION', 'id: 5<br/>curso_id: 1<br/>created_at: 2023-11-10 14:35:18<br/>updated_at: 2023-11-10 14:35:18<br/>', NULL, 'EXAMEN DE NIVELACION', '2023-11-10', '14:35:18', '2023-11-10 18:35:18', '2023-11-10 18:35:18'),
(393, 8, 'CREACIÓN', 'EL USUARIO roxana@gmail.com REALIZÓ UN EXAMEN DE NIVELACION', 'id: 4<br/>inscripcion_id: 3<br/>inscripcion_solicitud_id: 4<br/>examen_nivelacion_id: 5<br/>puntaje: 0<br/>estado: REVISADO<br/>created_at: 2023-11-10 14:35:41<br/>updated_at: 2023-11-10 14:35:41<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-10', '14:35:41', '2023-11-10 18:35:41', '2023-11-10 18:35:41'),
(394, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN GRUPO', 'id: 4<br/>grupo_id: 3<br/>titulo: COMUNICADO GRUPO 3<br/>descripcion: DESC. COMUNICADO<br/>fecha: 2023-11-10<br/>hora: 14:39<br/>created_at: 2023-11-10 14:39:35<br/>updated_at: 2023-11-10 14:39:35<br/>', NULL, 'GRUPOS', '2023-11-10', '14:39:35', '2023-11-10 18:39:35', '2023-11-10 18:39:35'),
(395, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN GRUPO', 'id: 5<br/>grupo_id: 6<br/>titulo: COMUNICADO GRUPO 5<br/>descripcion: COMUNICADO 5<br/>fecha: 2023-11-10<br/>hora: 14:40<br/>created_at: 2023-11-10 14:40:14<br/>updated_at: 2023-11-10 14:40:14<br/>', NULL, 'GRUPOS', '2023-11-10', '14:40:14', '2023-11-10 18:40:14', '2023-11-10 18:40:14'),
(396, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN HORARIO', 'created_at: 2023-11-05 13:55:54<br/>dias: 0,1,1,1,1,1,0<br/>fecha_fin: 2023-11-12<br/>fecha_inicio: 2023-11-06<br/>grupo_id: 1<br/>hora_fin: 18:30:00<br/>hora_inicio: 17:00:00<br/>id: 1<br/>modalidad: PRESENCIAL<br/>updated_at: 2023-11-05 14:06:37<br/>', 'created_at: 2023-11-05 13:55:54<br/>dias: 0,1,1,1,1,1,0<br/>fecha_fin: 2023-11-30<br/>fecha_inicio: 2023-11-10<br/>grupo_id: 1<br/>hora_fin: 18:30:00<br/>hora_inicio: 17:00:00<br/>id: 1<br/>modalidad: PRESENCIAL<br/>updated_at: 2023-11-18 17:51:26<br/>', 'HORARIOS', '2023-11-18', '17:51:26', '2023-11-18 21:51:26', '2023-11-18 21:51:26'),
(397, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN CURSO', 'created_at: 2023-11-18 18:13:35<br/>descripcion: DESC<br/>fecha_registro: 2023-11-18<br/>id: 8<br/>imagen: <br/>nombre: CURSO #8<br/>updated_at: 2023-11-18 18:13:35<br/>', NULL, 'CURSOS', '2023-11-18', '18:13:35', '2023-11-18 22:13:35', '2023-11-18 22:13:35'),
(398, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ UN CURSO', 'created_at: 2023-11-18 18:13:35<br/>descripcion: DESC<br/>fecha_registro: 2023-11-18<br/>id: 8<br/>imagen: <br/>nombre: CURSO #8<br/>updated_at: 2023-11-18 18:13:35<br/>', NULL, 'CURSOS', '2023-11-18', '18:13:37', '2023-11-18 22:13:37', '2023-11-18 22:13:37'),
(399, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UN GRUPO', 'created_at: 2023-11-18 18:18:51<br/>descripcion: DESC<br/>estado: ACTIVO<br/>id: 7<br/>link_reunion: <br/>nombre: GRUPO NUEVO<br/>updated_at: 2023-11-18 18:18:51<br/>', NULL, 'GRUPOS', '2023-11-18', '18:18:51', '2023-11-18 22:18:51', '2023-11-18 22:18:51'),
(400, 1, 'ELIMINACIÓN', 'EL USUARIO admin@gmail.com ELIMINÓ UN GRUPO', 'created_at: 2023-11-18 18:18:51<br/>descripcion: DESC<br/>estado: ACTIVO<br/>id: 7<br/>link_reunion: <br/>nombre: GRUPO NUEVO<br/>updated_at: 2023-11-18 18:18:51<br/>', NULL, 'GRUPOS', '2023-11-18', '18:18:54', '2023-11-18 22:18:54', '2023-11-18 22:18:54'),
(401, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN BANNER', 'created_at: 2023-10-20 11:56:47<br/>descripcion: <br/>id: 1<br/>img: 1698252099_1.png<br/>posicion: 1<br/>titulo: <br/>updated_at: 2023-10-25 12:41:39<br/>', 'created_at: 2023-10-20 11:56:47<br/>descripcion: Descripción imagen 1<br/>id: 1<br/>img: 1698252099_1.png<br/>posicion: 1<br/>titulo: Tomorrow\'s Today<br/>updated_at: 2023-11-18 18:26:28<br/>', 'BANNERS', '2023-11-18', '18:26:28', '2023-11-18 22:26:28', '2023-11-18 22:26:28'),
(402, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN BANNER', 'created_at: 2023-10-20 12:02:52<br/>descripcion: <br/>id: 2<br/>img: 1698252105_2.png<br/>posicion: 2<br/>titulo: <br/>updated_at: 2023-10-25 12:41:45<br/>', 'created_at: 2023-10-20 12:02:52<br/>descripcion: <br/>id: 2<br/>img: 1698252105_2.png<br/>posicion: 2<br/>titulo: <br/>updated_at: 2023-11-18 18:30:38<br/>', 'BANNERS', '2023-11-18', '18:30:38', '2023-11-18 22:30:38', '2023-11-18 22:30:38'),
(403, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN BANNER DE GESTORÍA', 'created_at: 2023-10-23 13:32:58<br/>descripcion: <br/>id: 1<br/>img: 1698252229_1.webp<br/>posicion: 1<br/>titulo: <br/>updated_at: 2023-10-25 12:43:49<br/>', 'created_at: 2023-10-23 13:32:58<br/>descripcion: DESCRIPCIÓN IMAGEN 1<br/>id: 1<br/>img: 1698252229_1.webp<br/>posicion: 1<br/>titulo: TÍTULO IMAGEN 1 GESTORÍA<br/>updated_at: 2023-11-18 18:32:05<br/>', 'GESTORÍA BANNERS', '2023-11-18', '18:32:05', '2023-11-18 22:32:05', '2023-11-18 22:32:05'),
(404, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UNA ASIGNACIÓN DE GRUPO', 'created_at: 2023-11-07 10:07:55<br/>curso_id: 3<br/>grupo_id: 3<br/>id: 4<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 2<br/>updated_at: 2023-11-07 10:07:55<br/>', 'created_at: 2023-11-07 10:07:55<br/>curso_id: 3<br/>grupo_id: 4<br/>id: 4<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 2<br/>updated_at: 2023-11-18 18:49:45<br/>', 'ASIGNACIÓN DE GRUPOS', '2023-11-18', '18:49:45', '2023-11-18 22:49:45', '2023-11-18 22:49:45'),
(405, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com CALIFICÓ UN EXAMEN DE NIVELACION', 'created_at: 2023-11-10 14:11:35<br/>estado: APROBÓ<br/>examen_nivelacion_id: 2<br/>id: 3<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>puntaje: 90<br/>updated_at: 2023-11-18 19:58:14<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-18', '19:58:14', '2023-11-18 23:58:14', '2023-11-18 23:58:14'),
(406, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com CALIFICÓ UN EXAMEN DE NIVELACION', 'created_at: 2023-11-10 14:11:35<br/>estado: ABANDONÓ<br/>examen_nivelacion_id: 2<br/>id: 3<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>puntaje: 90<br/>updated_at: 2023-11-18 20:00:25<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-18', '20:00:25', '2023-11-19 00:00:25', '2023-11-19 00:00:25'),
(407, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com CALIFICÓ UN EXAMEN DE NIVELACION', 'created_at: 2023-11-10 14:11:35<br/>estado: ABANDONÓ<br/>examen_nivelacion_id: 2<br/>id: 3<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>puntaje: <br/>updated_at: 2023-11-18 20:00:32<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-18', '20:00:32', '2023-11-19 00:00:32', '2023-11-19 00:00:32'),
(408, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com ACTUALIZÓ EL LINK DE UN GRUPO', 'id: 1<br/>nombre: GRUPO #1<br/>descripcion: DESCRIPCION GRUPO #1<br/>link_reunion: <br/>estado: ACTIVO<br/>created_at: 2023-11-03 12:06:11<br/>updated_at: 2023-11-03 12:06:11<br/>', 'id: 1<br/>nombre: GRUPO #1<br/>descripcion: DESCRIPCION GRUPO #1<br/>link_reunion: <br/>estado: ACTIVO<br/>created_at: 2023-11-03 12:06:11<br/>updated_at: 2023-11-03 12:06:11<br/>', 'GRUPOS', '2023-11-19', '11:33:01', '2023-11-19 15:33:01', '2023-11-19 15:33:01'),
(409, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com CAMBIO EL ESTADO DE UNA SOLICITUD', 'id: 9<br/>codigo: C.9<br/>inscripcion_id: 7<br/>curso_id: 1<br/>nivel: NIVEL CERO<br/>se_entero: INSTAGRAM<br/>desc_se_entero: <br/>plan_pago_id: 3<br/>plan_costo: 400.00<br/>forma_pago: ZELLE<br/>archivo_pago: 1700347400_9.pdf<br/>desc_pago: <br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: PENDIENTE<br/>created_at: 2023-11-18 18:43:20<br/>updated_at: 2023-11-18 18:43:20<br/>', 'id: 9<br/>codigo: C.9<br/>inscripcion_id: 7<br/>curso_id: 1<br/>nivel: NIVEL CERO<br/>se_entero: INSTAGRAM<br/>desc_se_entero: <br/>plan_pago_id: 3<br/>plan_costo: 400.00<br/>forma_pago: ZELLE<br/>archivo_pago: 1700347400_9.pdf<br/>desc_pago: <br/>desc_otro_pago: <br/>estado_asignado: NO<br/>estado: ACEPTADO<br/>created_at: 2023-11-18 18:43:20<br/>updated_at: 2023-11-19 13:36:17<br/>', 'INSCRIPCION SOLICITUD', '2023-11-19', '13:36:17', '2023-11-19 17:36:17', '2023-11-19 17:36:17'),
(410, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com REGISTRO UNA ASIGNACIÓN DE GRUPO', 'id: 5<br/>grupo_id: 2<br/>inscripcion_id: 7<br/>inscripcion_solicitud_id: 9<br/>curso_id: 1<br/>created_at: 2023-11-19 13:36:45<br/>updated_at: 2023-11-19 13:36:45<br/>', NULL, 'ASIGNACIÓN DE GRUPOS', '2023-11-19', '13:36:45', '2023-11-19 17:36:45', '2023-11-19 17:36:45'),
(411, 14, 'CREACIÓN', 'EL USUARIO eric12@gmail.com REALIZÓ UN EXAMEN DE NIVELACION', 'id: 5<br/>inscripcion_id: 7<br/>inscripcion_solicitud_id: 9<br/>examen_nivelacion_id: 5<br/>puntaje: 0<br/>estado: REVISADO<br/>created_at: 2023-11-19 13:37:05<br/>updated_at: 2023-11-19 13:37:05<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-19', '13:37:05', '2023-11-19 17:37:05', '2023-11-19 17:37:05'),
(412, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com CALIFICÓ UN EXAMEN DE NIVELACION', 'created_at: 2023-11-10 14:11:35<br/>estado: <br/>examen_nivelacion_id: 2<br/>id: 3<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>puntaje: 0<br/>updated_at: 2023-11-21 12:12:24<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-21', '12:12:24', '2023-11-21 16:12:24', '2023-11-21 16:12:24'),
(414, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com MODIFICÓ EL ESTADO DE UNA ASIGNACIÓN DE GRUPO', 'created_at: 2023-11-07 09:58:37<br/>curso_id: 7<br/>estado: PENDIENTE<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>updated_at: 2023-11-07 09:58:45<br/>', 'created_at: 2023-11-07 09:58:37<br/>curso_id: 7<br/>estado: APROBÓ<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>updated_at: 2023-11-21 12:46:34<br/>', 'ASIGNACIÓN DE GRUPOS', '2023-11-21', '12:46:34', '2023-11-21 16:46:34', '2023-11-21 16:46:34'),
(415, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com MODIFICÓ EL ESTADO DE UNA ASIGNACIÓN DE GRUPO', 'created_at: 2023-11-07 09:58:37<br/>curso_id: 7<br/>estado: APROBÓ<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>updated_at: 2023-11-21 12:46:34<br/>', 'created_at: 2023-11-07 09:58:37<br/>curso_id: 7<br/>estado: REPROBÓ<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>updated_at: 2023-11-21 12:46:38<br/>', 'ASIGNACIÓN DE GRUPOS', '2023-11-21', '12:46:38', '2023-11-21 16:46:38', '2023-11-21 16:46:38'),
(416, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com MODIFICÓ EL ESTADO DE UNA ASIGNACIÓN DE GRUPO', 'created_at: 2023-11-07 09:58:37<br/>curso_id: 7<br/>estado: REPROBÓ<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>updated_at: 2023-11-21 12:46:38<br/>', 'created_at: 2023-11-07 09:58:37<br/>curso_id: 7<br/>estado: ABANDONÓ<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>updated_at: 2023-11-21 12:46:41<br/>', 'ASIGNACIÓN DE GRUPOS', '2023-11-21', '12:46:41', '2023-11-21 16:46:41', '2023-11-21 16:46:41'),
(417, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com MODIFICÓ EL ESTADO DE UNA ASIGNACIÓN DE GRUPO', 'created_at: 2023-11-07 09:58:37<br/>curso_id: 7<br/>estado: ABANDONÓ<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>updated_at: 2023-11-21 12:46:41<br/>', 'created_at: 2023-11-07 09:58:37<br/>curso_id: 7<br/>estado: APROBÓ<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>updated_at: 2023-11-21 12:46:45<br/>', 'ASIGNACIÓN DE GRUPOS', '2023-11-21', '12:46:45', '2023-11-21 16:46:45', '2023-11-21 16:46:45'),
(418, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com MODIFICÓ EL ESTADO DE UNA ASIGNACIÓN DE GRUPO', 'created_at: 2023-11-04 17:17:52<br/>curso_id: 7<br/>estado: PENDIENTE<br/>grupo_id: 1<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>updated_at: 2023-11-04 17:21:15<br/>', 'created_at: 2023-11-04 17:17:52<br/>curso_id: 7<br/>estado: APROBÓ<br/>grupo_id: 1<br/>id: 1<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>updated_at: 2023-11-21 12:55:50<br/>', 'ASIGNACIÓN DE GRUPOS', '2023-11-21', '12:55:50', '2023-11-21 16:55:50', '2023-11-21 16:55:50'),
(419, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com CALIFICÓ UN EXAMEN DE NIVELACION', 'created_at: 2023-11-10 14:11:35<br/>estado: <br/>examen_nivelacion_id: 2<br/>id: 3<br/>inscripcion_id: 2<br/>inscripcion_solicitud_id: 1<br/>puntaje: 8<br/>updated_at: 2023-11-21 12:56:04<br/>', NULL, 'INSCRIPCIÓN EXAMENES', '2023-11-21', '12:56:04', '2023-11-21 16:56:04', '2023-11-21 16:56:04'),
(420, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com MODIFICÓ EL ESTADO DE UNA ASIGNACIÓN DE GRUPO', 'calificacion: <br/>created_at: 2023-11-07 09:58:37<br/>curso_id: 7<br/>estado: PENDIENTE<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>updated_at: 2023-11-21 12:46:45<br/>', 'calificacion: <br/>created_at: 2023-11-07 09:58:37<br/>curso_id: 7<br/>estado: APROBÓ<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>updated_at: 2023-11-21 13:05:31<br/>', 'ASIGNACIÓN DE GRUPOS', '2023-11-21', '13:05:31', '2023-11-21 17:05:31', '2023-11-21 17:05:31'),
(421, 6, 'MODIFICACIÓN', 'EL USUARIO felipe@gmail.com MODIFICÓ EL ESTADO DE UNA ASIGNACIÓN DE GRUPO', 'calificacion: <br/>created_at: 2023-11-07 09:58:37<br/>curso_id: 7<br/>estado: APROBÓ<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>updated_at: 2023-11-21 13:05:31<br/>', 'calificacion: 90<br/>created_at: 2023-11-07 09:58:37<br/>curso_id: 7<br/>estado: APROBÓ<br/>grupo_id: 1<br/>id: 2<br/>inscripcion_id: 4<br/>inscripcion_solicitud_id: 5<br/>updated_at: 2023-11-21 13:06:54<br/>', 'ASIGNACIÓN DE GRUPOS', '2023-11-21', '13:06:54', '2023-11-21 17:06:54', '2023-11-21 17:06:54'),
(422, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LAS CREDENCIALES DE ENVIO DE CORREOS', 'correo: correosyseventos@gmail.com<br/>created_at: 2023-11-08 12:26:26<br/>encryptado: ssl<br/>host: smtp.gmail.com<br/>id: 1<br/>nombre: Institute<br/>password: vzxihjayuqaxorwc<br/>puerto: 465<br/>updated_at: 2023-11-08 12:26:26<br/>', NULL, 'ENVIO DE CORREOS', '2023-11-21', '13:23:29', '2023-11-21 17:23:29', '2023-11-21 17:23:29'),
(423, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LAS CREDENCIALES DE ENVIO DE CORREOS', 'correo: correosyseventos@gmail.com<br/>created_at: 2023-11-08 12:26:26<br/>encryptado: ssl<br/>host: smtp.gmail.com<br/>id: 1<br/>nombre: Institute<br/>password: vzxihjayuqaxorwc<br/>puerto: 465<br/>updated_at: 2023-11-08 12:26:26<br/>', NULL, 'ENVIO DE CORREOS', '2023-11-21', '13:25:12', '2023-11-21 17:25:12', '2023-11-21 17:25:12'),
(424, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'acceso: 1<br/>correo: juan@gmail.com<br/>created_at: 2023-10-07 19:33:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-10-07<br/>fono: 7777777<br/>foto: default.png<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>password: $2y$10$x7Y89S.ziR0AuMQvI16ex.ckDsy3lb.mJlRy2IruS4qg7eiQLSC2G<br/>paterno: PERES<br/>tipo: ADMINISTRADOR<br/>updated_at: 2023-11-08 12:56:29<br/>usuario: juan@gmail.com<br/>', 'acceso: 1<br/>correo: victorgonzalo.as@gmail.com<br/>created_at: 2023-10-07 19:33:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-10-07<br/>fono: 7777777<br/>foto: default.png<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>password: $2y$10$x7Y89S.ziR0AuMQvI16ex.ckDsy3lb.mJlRy2IruS4qg7eiQLSC2G<br/>paterno: PERES<br/>tipo: ADMINISTRADOR<br/>updated_at: 2023-11-21 13:25:57<br/>usuario: victorgonzalo.as@gmail.com<br/>', 'USUARIOS', '2023-11-21', '13:25:57', '2023-11-21 17:25:57', '2023-11-21 17:25:57'),
(425, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LAS CREDENCIALES DE ENVIO DE CORREOS', 'correo: correosyseventos@gmail.com<br/>created_at: 2023-11-08 12:26:26<br/>driver: smtps<br/>encryptado: ssl<br/>host: smtp.gmail.com<br/>id: 1<br/>nombre: Institute<br/>password: vzxihjayuqaxorwc<br/>puerto: 465<br/>updated_at: 2023-11-21 13:29:37<br/>', NULL, 'ENVIO DE CORREOS', '2023-11-21', '13:29:37', '2023-11-21 17:29:37', '2023-11-21 17:29:37'),
(426, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LAS CREDENCIALES DE ENVIO DE CORREOS', 'correo: correosyseventos@gmail.coms<br/>created_at: 2023-11-08 12:26:26<br/>driver: smtps<br/>encryptado: ssls<br/>host: smtp.gmail.coms<br/>id: 1<br/>nombre: Institutes<br/>password: vzxihjayuqaxorwcs<br/>puerto: 465s<br/>updated_at: 2023-11-21 13:29:47<br/>', NULL, 'ENVIO DE CORREOS', '2023-11-21', '13:29:47', '2023-11-21 17:29:47', '2023-11-21 17:29:47'),
(427, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LAS CREDENCIALES DE ENVIO DE CORREOS', 'correo: correosyseventos@gmail.com<br/>created_at: 2023-11-08 12:26:26<br/>driver: smtp<br/>encryptado: ssl<br/>host: smtp.gmail.com<br/>id: 1<br/>nombre: Institute<br/>password: vzxihjayuqaxorwc<br/>puerto: 465<br/>updated_at: 2023-11-21 13:29:54<br/>', NULL, 'ENVIO DE CORREOS', '2023-11-21', '13:29:54', '2023-11-21 17:29:54', '2023-11-21 17:29:54'),
(428, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ LAS CREDENCIALES DE ENVIO DE CORREOS', 'correo: web@emsytsrl.com<br/>created_at: 2023-11-08 12:26:26<br/>driver: smtp<br/>encryptado: tls<br/>host: smtp.hostinger.com<br/>id: 1<br/>nombre: Institute<br/>password: 10-Co20re30oS<br/>puerto: 587<br/>updated_at: 2023-11-21 13:31:34<br/>', NULL, 'ENVIO DE CORREOS', '2023-11-21', '13:31:34', '2023-11-21 17:31:34', '2023-11-21 17:31:34');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(429, 1, 'MODIFICACIÓN', 'EL USUARIO admin@gmail.com MODIFICÓ UN USUARIO', 'acceso: 1<br/>correo: victorgonzalo.as@gmail.com<br/>created_at: 2023-10-07 19:33:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-10-07<br/>fono: 7777777<br/>foto: default.png<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>password: $2y$10$cziltwKP0tvLg.sPDF5M..jJ7l7ubX66281aDm8QMyGZFw96VXlx6<br/>paterno: PERES<br/>tipo: ADMINISTRADOR<br/>updated_at: 2023-11-21 13:32:14<br/>usuario: juan@gmail.com<br/>', 'acceso: 1<br/>correo: juan@gmail.com<br/>created_at: 2023-10-07 19:33:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-10-07<br/>fono: 7777777<br/>foto: default.png<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>password: $2y$10$cziltwKP0tvLg.sPDF5M..jJ7l7ubX66281aDm8QMyGZFw96VXlx6<br/>paterno: PERES<br/>tipo: ADMINISTRADOR<br/>updated_at: 2023-11-21 13:32:36<br/>usuario: juan@gmail.com<br/>', 'USUARIOS', '2023-11-21', '13:32:36', '2023-11-21 17:32:36', '2023-11-21 17:32:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` bigint UNSIGNED NOT NULL,
  `grupo_id` bigint UNSIGNED NOT NULL,
  `modalidad` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `grupo_id`, `modalidad`, `dias`, `fecha_inicio`, `fecha_fin`, `hora_inicio`, `hora_fin`, `created_at`, `updated_at`) VALUES
(1, 1, 'PRESENCIAL', '0,1,1,1,1,1,0', '2023-11-10', '2023-11-30', '17:00:00', '18:30:00', '2023-11-05 17:55:54', '2023-11-18 21:51:26'),
(3, 2, 'VIRTUAL', '1,0,0,0,0,0,1', '2023-11-08', '2023-11-20', '18:00:00', '20:00:00', '2023-11-07 14:32:30', '2023-11-07 14:32:30'),
(4, 3, 'PRESENCIAL', '0,1,1,1,1,1,0', '2023-11-10', '2023-11-30', '08:00:00', '12:00:00', '2023-11-07 14:32:57', '2023-11-07 14:32:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_pagos`
--

CREATE TABLE `informacion_pagos` (
  `id` bigint UNSIGNED NOT NULL,
  `forma_pago` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `archivo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_archivo` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `informacion_pagos`
--

INSERT INTO `informacion_pagos` (`id`, `forma_pago`, `archivo`, `tipo_archivo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'ZELLE', '1699635431_1.pdf', 'archivo', 'Pago por zelle:<br />\r\nDescripción pago zelle', '2023-11-10 15:32:45', '2023-11-10 16:57:11'),
(2, 'WESTERN UNION', '1699635398_2.png', 'imagen', 'WESTERN UNION<br />\r\ndescripcion pago western', '2023-11-10 15:32:45', '2023-11-10 16:56:38'),
(3, 'DEPÓSITO BANCARIO', '1699630565_1.png', 'imagen', 'NRO. CUENTA BANCARÍA: 10000046944985', '2023-11-10 15:32:45', '2023-11-10 15:46:24'),
(4, 'MERCADO PAGO', '1699635338_4.jpg', 'imagen', 'Mercado pago Argentina<br />\r\nRuben Nina<br />\r\nCVU: 0000003100078154409495<br />\r\nAlias: Tomorrowistoday<br />\r\nCUIT/CUIL: 20946070921', '2023-11-10 15:32:45', '2023-11-10 16:55:38'),
(5, 'OTRAS FORMAS DE PAGO', NULL, NULL, 'OTRAS FORMAS DE PAGO<br />\r\n- Otro pago 1<br />\r\n- Otro pago 2', '2023-11-10 15:32:45', '2023-11-10 16:53:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcions`
--

CREATE TABLE `inscripcions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nro_iden` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `edad` int NOT NULL,
  `pais_residencia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nacionalidad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prov_dpto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_ultima_solicitud` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDIENTE',
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inscripcions`
--

INSERT INTO `inscripcions` (`id`, `user_id`, `nombres`, `apellidos`, `nro_iden`, `fecha_nac`, `edad`, `pais_residencia`, `nacionalidad`, `prov_dpto`, `sexo`, `fono`, `estado_ultima_solicitud`, `correo`, `created_at`, `updated_at`) VALUES
(2, 5, 'MARCOS', 'MAMANI MAMANI', '12345', '2000-01-01', 23, 'BOLIVIA', 'BOLIVIANO', 'LA PAZ', 'HOMBRE', '7777777', 'ACEPTADO', 'marcos@gmail.com', '2023-10-31 17:52:08', '2023-10-31 17:52:08'),
(3, 8, 'ROXANA', 'MAMANI MAMANI', '67678', '2003-01-01', 20, 'BOLIVIA', 'BOLIVIANA', 'LA PAZ', 'MUJER', '7999999', 'PENDIENTE', 'roxana@gmail.com', '2023-11-07 13:11:50', '2023-11-07 13:11:50'),
(4, 9, 'MAX', 'PONCE', '32322', '2000-01-01', 23, 'BOLIVIA', 'BOLIVIANO', 'LA PAZ', 'HOMBRE', '777777', 'PENDIENTE', 'max@gmail.com', '2023-11-07 13:16:31', '2023-11-21 16:04:37'),
(5, 12, 'LUIS', 'CARVAJAL GONZALES', '544544', '1999-01-01', 24, 'BOLIVIA', 'BOLIVIANO', 'LA PAZ', 'HOMBRE', '7666666', 'PENDIENTE', 'luis@gmail.com', '2023-11-08 20:09:48', '2023-11-08 20:09:48'),
(6, 13, 'MARGARITA', 'SOLIZ', '43434', '2000-03-03', 23, 'BOLIVIA', 'BOLIVIANA', 'SANTA CRUZ', 'MUJER', '7888888', 'ACEPTADO', 'margarita@gmail.com', '2023-11-10 17:07:30', '2023-11-10 17:48:58'),
(7, 14, 'ERIC', 'CORTEZ CORTEZ', '66666', '2004-11-11', 19, 'BOLIVIA', 'BOLIVIANO', 'LA PAZ', 'HOMBRE', '777777', 'ACEPTADO', 'eric12@gmail.com', '2023-11-18 22:43:20', '2023-11-19 17:36:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion_examens`
--

CREATE TABLE `inscripcion_examens` (
  `id` bigint UNSIGNED NOT NULL,
  `inscripcion_id` bigint UNSIGNED NOT NULL,
  `inscripcion_solicitud_id` bigint UNSIGNED NOT NULL,
  `examen_nivelacion_id` bigint UNSIGNED NOT NULL,
  `puntaje` double(8,2) DEFAULT NULL,
  `estado` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inscripcion_examens`
--

INSERT INTO `inscripcion_examens` (`id`, `inscripcion_id`, `inscripcion_solicitud_id`, `examen_nivelacion_id`, `puntaje`, `estado`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 4, 90.00, 'REVISADO', '2023-11-07 16:43:29', '2023-11-07 20:07:46'),
(3, 2, 1, 2, 8.00, NULL, '2023-11-10 18:11:35', '2023-11-21 16:56:04'),
(4, 3, 4, 5, 0.00, 'REVISADO', '2023-11-10 18:35:41', '2023-11-10 18:35:41'),
(5, 7, 9, 5, 0.00, 'REVISADO', '2023-11-19 17:37:05', '2023-11-19 17:37:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion_respuestas`
--

CREATE TABLE `inscripcion_respuestas` (
  `id` bigint UNSIGNED NOT NULL,
  `inscripcion_examen_id` bigint UNSIGNED NOT NULL,
  `examen_enunciado_id` bigint UNSIGNED NOT NULL,
  `enunciado_pregunta_id` bigint UNSIGNED NOT NULL,
  `respuesta` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calificacion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inscripcion_respuestas`
--

INSERT INTO `inscripcion_respuestas` (`id`, `inscripcion_examen_id`, `examen_enunciado_id`, `enunciado_pregunta_id`, `respuesta`, `calificacion`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 10, 'My name is John', 'CORRECTO', '2023-11-07 16:43:29', '2023-11-07 20:00:40'),
(2, 1, 7, 11, 'I\'m seventeen years old', 'CORRECTO', '2023-11-07 16:43:29', '2023-11-07 20:00:40'),
(3, 1, 8, 12, 'one', 'CORRECTO', '2023-11-07 16:43:29', '2023-11-07 20:00:40'),
(4, 1, 8, 13, 'two', 'CORRECTO', '2023-11-07 16:43:29', '2023-11-07 20:00:40'),
(5, 1, 9, 14, 'monday', 'CORRECTO', '2023-11-07 16:43:29', '2023-11-07 20:00:40'),
(6, 1, 9, 15, 'tuesday', 'CORRECTO', '2023-11-07 16:43:29', '2023-11-07 20:00:41'),
(7, 1, 10, 16, 'at', 'CORRECTO', '2023-11-07 16:43:29', '2023-11-07 20:00:41'),
(8, 1, 11, 17, 'My brother\'s car is very nice', 'CORRECTO', '2023-11-07 16:43:29', '2023-11-07 20:00:41'),
(9, 1, 12, 18, 'that', 'INCORRECTO', '2023-11-07 16:43:29', '2023-11-07 20:00:50'),
(10, 3, 2, 2, NULL, 'INCORRECTO', '2023-11-10 18:11:35', '2023-11-21 16:12:24'),
(11, 3, 2, 7, NULL, 'CORRECTO', '2023-11-10 18:11:35', '2023-11-21 16:56:04'),
(12, 3, 3, 4, NULL, 'CORRECTO', '2023-11-10 18:11:35', '2023-11-21 16:56:04'),
(13, 3, 3, 8, NULL, 'CORRECTO', '2023-11-10 18:11:35', '2023-11-21 16:56:04'),
(14, 3, 6, 9, NULL, 'CORRECTO', '2023-11-10 18:11:35', '2023-11-21 16:56:04'),
(15, 4, 13, 19, NULL, NULL, '2023-11-10 18:35:41', '2023-11-10 18:35:41'),
(16, 4, 14, 20, NULL, NULL, '2023-11-10 18:35:41', '2023-11-10 18:35:41'),
(17, 5, 13, 19, NULL, NULL, '2023-11-19 17:37:05', '2023-11-19 17:37:05'),
(18, 5, 14, 20, NULL, NULL, '2023-11-19 17:37:05', '2023-11-19 17:37:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion_solicituds`
--

CREATE TABLE `inscripcion_solicituds` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inscripcion_id` bigint UNSIGNED NOT NULL,
  `curso_id` bigint UNSIGNED NOT NULL,
  `nivel` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `se_entero` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_se_entero` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_pago_id` bigint UNSIGNED NOT NULL,
  `plan_costo` decimal(24,2) NOT NULL,
  `forma_pago` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `archivo_pago` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_pago` text COLLATE utf8mb4_unicode_ci,
  `desc_otro_pago` text COLLATE utf8mb4_unicode_ci,
  `estado_asignado` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inscripcion_solicituds`
--

INSERT INTO `inscripcion_solicituds` (`id`, `codigo`, `inscripcion_id`, `curso_id`, `nivel`, `se_entero`, `desc_se_entero`, `plan_pago_id`, `plan_costo`, `forma_pago`, `archivo_pago`, `desc_pago`, `desc_otro_pago`, `estado_asignado`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'C.1', 2, 7, 'NIVEL CERO', 'OTRO', 'UN CONOCIDO', 3, 400.00, 'DEPÓSITO BANCARIO', NULL, NULL, NULL, 'SI', 'ACEPTADO', '2023-10-31 17:52:08', '2023-11-04 21:17:52'),
(2, 'C.2', 2, 3, 'NIVEL BÁSICO', 'FACEBOOK', '', 3, 400.00, 'DEPÓSITO BANCARIO', NULL, NULL, NULL, 'SI', 'ACEPTADO', '2023-11-07 12:56:43', '2023-11-07 14:07:55'),
(3, 'C.3', 2, 6, 'NIVEL CERO', 'FACEBOOK', '', 3, 400.00, 'OTRO', '1699362225_3.png', 'BANCO UNION<br />\r\nMARCOS MAMANI MAMANI<br />\r\nNRO. CUENTA: 100005454545<br />\r\nMONTO: 400 $us<br />', 'PAGO VIA QR', 'NO', 'PENDIENTE', '2023-11-07 13:03:45', '2023-11-07 13:03:45'),
(4, 'C.4', 3, 1, 'NIVEL CERO', 'TIKTOK', '', 1, 49.99, 'DEPÓSITO BANCARIO', '1699362710_4.png', 'BANCO UNION<br />\r\nMARIA MAMANI<br />\r\nMONTO: 49.99<br />\r\nNRO. CUENTA: 1000034343', NULL, 'SI', 'ACEPTADO', '2023-11-07 13:11:50', '2023-11-07 13:58:53'),
(5, 'C.5', 4, 7, 'NIVEL BÁSICO', 'INSTAGRAM', '', 3, 400.00, 'WESTERN UNION', '1699362991_5.pdf', 'WESTER UNION<br />\r\nMAX PONCE', NULL, 'SI', 'ACEPTADO', '2023-11-07 13:16:31', '2023-11-07 13:58:37'),
(6, 'C.6', 5, 3, 'NIVEL BÁSICO', 'INSTAGRAM', '', 2, 130.00, 'DEPÓSITO BANCARIO', '1699474188_6.png', 'BANCO UNION<br />\r\nLUIS CARVAJAL<br />\r\nMONTO: 130<br />\r\nNRO. CUENTA: 10000033333', NULL, 'NO', 'PENDIENTE', '2023-11-08 20:09:48', '2023-11-08 20:09:48'),
(7, 'C.7', 6, 1, 'NIVEL CERO', 'FACEBOOK', '', 1, 49.99, 'DEPÓSITO BANCARIO', NULL, '', NULL, 'NO', 'ACEPTADO', '2023-11-10 17:07:30', '2023-11-10 17:49:04'),
(8, 'C.8', 6, 7, 'NIVEL BÁSICO', 'OTRO', 'DESCRIPCION OTRO', 3, 400.00, 'ZELLE', NULL, '', NULL, 'NO', 'ACEPTADO', '2023-11-10 17:15:16', '2023-11-10 17:48:58'),
(9, 'C.9', 7, 1, 'NIVEL CERO', 'INSTAGRAM', '', 3, 400.00, 'ZELLE', '1700347400_9.pdf', '', NULL, 'SI', 'ACEPTADO', '2023-11-18 22:43:20', '2023-11-19 17:36:45'),
(10, 'C.10', 4, 3, 'NIVEL CERO', 'OTRO', 'OTRA INFORAMCION', 3, 400.00, 'DEPÓSITO BANCARIO', '1700582677_10.png', '', NULL, 'NO', 'PENDIENTE', '2023-11-21 16:04:37', '2023-11-21 16:04:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(7, '2023_10_20_110138_create_contactos_table', 2),
(10, '2023_10_23_113916_create_portal_comunicados_table', 3),
(11, '2023_10_23_113928_create_portal_gestorias_table', 3),
(12, '2023_10_23_115443_create_configuracion_gestorias_table', 3),
(13, '2023_10_23_120403_create_gestoria_nosotros_table', 3),
(14, '2023_10_23_120425_create_gestoria_servicios_table', 3),
(15, '2023_10_23_121730_create_gestoria_banners_table', 4),
(16, '2023_10_24_105103_create_cursos_table', 5),
(17, '2023_10_24_111747_create_inscripcions_table', 5),
(18, '2023_10_24_111949_create_inscripcion_solicituds_table', 5),
(19, '2023_10_24_112811_create_gestoria_solicituds_table', 5),
(20, '2023_10_24_114525_create_grupos_table', 5),
(21, '2023_10_24_114642_create_asignacion_grupos_table', 5),
(22, '2023_10_24_115100_create_horarios_table', 5),
(23, '2023_10_24_115500_create_grupo_profesors_table', 5),
(24, '2023_10_24_115641_create_grupo_recursos_table', 5),
(25, '2023_10_24_120147_create_examen_nivelacions_table', 5),
(26, '2023_10_24_120450_create_examen_enunciados_table', 5),
(27, '2023_10_24_120606_create_enunciado_preguntas_table', 5),
(28, '2023_10_24_121720_create_inscripcion_examens_table', 5),
(29, '2023_10_24_121801_create_inscripcion_respuestas_table', 5),
(30, '2023_10_24_122358_create_comunicados_table', 5),
(31, '2023_10_24_122629_create_profesors_table', 5),
(32, '2023_10_31_104720_create_plan_pagos_table', 6),
(33, '2023_11_02_184740_create_gestoria_tips_table', 7),
(34, '2023_11_08_121007_create_envio_correos_table', 8),
(35, '2023_11_08_121146_create_recuperacions_table', 8),
(36, '2023_11_10_103824_create_informacion_pagos_table', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_pagos`
--

CREATE TABLE `plan_pagos` (
  `id` bigint UNSIGNED NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `costo` decimal(24,2) NOT NULL,
  `detalles` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `plan_pagos`
--

INSERT INTO `plan_pagos` (`id`, `titulo`, `costo`, `detalles`, `created_at`, `updated_at`) VALUES
(1, 'Plan Mensual', 49.99, 'Plataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas', NULL, '2023-11-10 15:37:14'),
(2, 'Plan Trimestral', 130.00, 'Ahora USD 123<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas', NULL, '2023-11-10 15:37:14'),
(3, 'Plan Anual', 400.00, 'Ahora USD 214<br />\r\nPlataforma interactiva<br />\r\nMateriales digitales<br />\r\nRecursos tecnologicos<br />\r\nClases en vivo<br />\r\nCursos de preparación<br />\r\nBecas academicas', NULL, '2023-11-10 15:37:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portal_comunicados`
--

CREATE TABLE `portal_comunicados` (
  `id` bigint UNSIGNED NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `portal_comunicados`
--

INSERT INTO `portal_comunicados` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Programa de inglés intensivo<br />\nAprende el idioma inglés de forma estructurada y efectiva.<br />\nEn BEI, trabajamos contigo para desarrollar tus habilidades y mejorar tu dominio del idioma inglés para que puedas tener más éxito en la vida.<br />\n¡Estudiante F-1 bienvenidos!', '2023-10-23 16:30:51', '2023-10-23 16:42:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portal_gestorias`
--

CREATE TABLE `portal_gestorias` (
  `id` bigint UNSIGNED NOT NULL,
  `imagen_inicio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titulo_inicio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion_inicio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `portal_gestorias`
--

INSERT INTO `portal_gestorias` (`id`, `imagen_inicio`, `titulo_inicio`, `descripcion_inicio`, `created_at`, `updated_at`) VALUES
(1, '1698252586_1.png', 'Gestoría de visas para Estados Unidos sin complicaciones', '¡Prepara tu viaje o cambia tu vida! Encuentra todo lo que necesitas saber sobre las visas de turismo y de trabajo para Estados Unidos', '2023-10-23 17:01:37', '2023-10-25 16:49:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesors`
--

CREATE TABLE `profesors` (
  `id` bigint UNSIGNED NOT NULL,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nacionalidad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pais_residencia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `especialidad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `profesors`
--

INSERT INTO `profesors` (`id`, `nombres`, `apellidos`, `ci`, `nacionalidad`, `pais_residencia`, `dir`, `fono`, `especialidad`, `correo`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'FELIPE', 'GUTIERREZ MARTINES', '11111', 'BOLIVIANO', 'BOLIVIA', 'LOS OLIVOS #32', '777777', 'INGLES AVANZADO', 'felipe@gmail.com', 6, '2023-11-05 01:43:07', '2023-11-05 17:03:02'),
(2, 'MANUEL', 'PAREDES GONZALES', '434343', 'BOLIVIANO', 'BOLIVIA', 'LOS OLIVOS', '7888888', 'INGLES AVANZADO', 'manuel@gmail.com', 10, '2023-11-07 14:00:37', '2023-11-07 14:00:37'),
(3, 'JUAN LUIS', 'CACERES CORTEZ', '89989', 'BOLIVIANO', 'BOLIVIA', 'LOS OLIVOS', '799999', 'INGLES', 'juanluis@gmail.com', 11, '2023-11-07 14:07:06', '2023-11-07 14:07:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recuperacions`
--

CREATE TABLE `recuperacions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recuperacions`
--

INSERT INTO `recuperacions` (`id`, `user_id`, `correo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 2, 'victorgonzalo.as@gmail.com', 1, '2023-11-08 16:47:10', '2023-11-08 16:55:24'),
(2, 2, 'victorgonzalo.as@gmail.com', 1, '2023-11-21 17:31:50', '2023-11-21 17:32:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_socials`
--

CREATE TABLE `red_socials` (
  `id` bigint UNSIGNED NOT NULL,
  `tiktok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('ADMINISTRADOR','AUXILIAR','PROFESOR','ESTUDIANTE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(2, 'juan@gmail.com', 'JUAN', 'PERES', 'MAMANI', 'LOS OLIVOS', 'juan@gmail.com', '7777777', '$2y$10$cziltwKP0tvLg.sPDF5M..jJ7l7ubX66281aDm8QMyGZFw96VXlx6', 'ADMINISTRADOR', 'default.png', 1, '2023-10-07', '2023-10-07 23:33:20', '2023-11-21 17:32:36'),
(3, 'maria@gmail.com', 'MARIA', 'MAMANI', 'MAMANI', 'LOS OLIVOS', 'MARIA@GMAIL.COM', '', '$2y$10$bd0rITfeftm3JW7h.vktRO7406W9Mykg1X2dukizhYvjqZfrzQsTi', 'AUXILIAR', 'default.png', 1, '2023-10-07', '2023-10-07 23:47:44', '2023-10-20 15:19:04'),
(5, 'marcos@gmail.com', 'MARCOS', 'MAMANI MAMANI', NULL, 'LA PAZ - BOLIVIA', 'marcos@gmail.com', '7777777', '$2y$10$w.iN4dL8Pj/dTt/0kWD1oeQvb26B4mi2s/imbyJotYGTRui42RGKy', 'ESTUDIANTE', NULL, 1, '2023-10-31', '2023-10-31 17:52:08', '2023-10-31 17:52:08'),
(6, 'felipe@gmail.com', 'Felipe', 'gutierrez martines', NULL, 'los olivos #32', 'felipe@gmail.com', '777777', '$2y$10$8gDTDoXbvcslnnkzc/qSY.qPv65eIxrpgVKCTtX7vnuYR6/UGP2Me', 'PROFESOR', '1699148587_6.jpg', 1, '2023-11-04', '2023-11-05 01:43:07', '2023-11-05 17:03:02'),
(8, 'roxana@gmail.com', 'ROXANA', 'MAMANI MAMANI', NULL, 'LA PAZ - BOLIVIA', 'roxana@gmail.com', '7999999', '$2y$10$cdSiPQQZ1WXd6tucfs5L8uMqFAklzf7WFr2ltVAUEieI/wsTus42e', 'ESTUDIANTE', NULL, 1, '2023-11-07', '2023-11-07 13:11:50', '2023-11-07 13:11:50'),
(9, 'max@gmail.com', 'MAX', 'PONCE', NULL, 'LA PAZ - BOLIVIA', 'max@gmail.com', '777777', '$2y$10$6jdKoSvkXNrl7agUS9DfYuymVPV7.MsmMZy9IIZUT5sw1AddzTvna', 'ESTUDIANTE', NULL, 1, '2023-11-07', '2023-11-07 13:16:31', '2023-11-07 13:16:31'),
(10, 'manuel@gmail.com', 'manuel', 'paredes gonzales', NULL, 'los olivos', 'manuel@gmail.com', '7888888', '$2y$10$oO9sg7RbCB376kiFKCaX4egOISpOc75VE7Gzglq7KCctvJLy/DHqS', 'PROFESOR', NULL, 1, '2023-11-07', '2023-11-07 14:00:37', '2023-11-07 14:00:37'),
(11, 'juanluis@gmail.com', 'juan luis', 'caceres cortez', NULL, 'los olivos', 'juanluis@gmail.com', '799999', '$2y$10$CgvPDe2OTj623Ffux4h.QuzhcOaa5IBipn37Dj9ehDK2Z9VSpLt4O', 'PROFESOR', NULL, 1, '2023-11-07', '2023-11-07 14:07:06', '2023-11-07 14:07:06'),
(12, 'luis@gmail.com', 'LUIS', 'CARVAJAL GONZALES', NULL, 'LA PAZ - BOLIVIA', 'luis@gmail.com', '7666666', '$2y$10$n/zlM/JfzUUs7JBDX4BgjORR9BaUZtQrUXHsZSFPRSMEinv9z/6su', 'ESTUDIANTE', NULL, 1, '2023-11-08', '2023-11-08 20:09:48', '2023-11-08 20:09:48'),
(13, 'margarita@gmail.com', 'MARGARITA', 'SOLIZ', NULL, 'SANTA CRUZ - BOLIVIA', 'margarita@gmail.com', '7888888', '$2y$10$QuCrk.6s/eHUKJiQBpjMNe7Kdd6E.HDD2gf0eKC3M927y7IqctpsC', 'ESTUDIANTE', NULL, 1, '2023-11-10', '2023-11-10 17:07:30', '2023-11-10 17:07:30'),
(14, 'eric12@gmail.com', 'ERIC', 'CORTEZ CORTEZ', NULL, 'LA PAZ - BOLIVIA', 'eric12@gmail.com', '777777', '$2y$10$40OnwsnTQiQ7Dh/2gvJl5u1HLwjSlSlnqOnDvvk/bfIAmm35e4Wb2', 'ESTUDIANTE', NULL, 1, '2023-11-18', '2023-11-18 22:43:20', '2023-11-18 22:43:20');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion_grupos`
--
ALTER TABLE `asignacion_grupos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asignacion_grupos_grupo_id_foreign` (`grupo_id`),
  ADD KEY `asignacion_grupos_inscripcion_id_foreign` (`inscripcion_id`),
  ADD KEY `asignacion_grupos_inscripcion_solicitud_id_foreign` (`inscripcion_solicitud_id`),
  ADD KEY `asignacion_grupos_curso_id_foreign` (`curso_id`);

--
-- Indices de la tabla `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comunicados`
--
ALTER TABLE `comunicados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion_gestorias`
--
ALTER TABLE `configuracion_gestorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `enunciado_preguntas`
--
ALTER TABLE `enunciado_preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enunciado_preguntas_examen_enunciado_id_foreign` (`examen_enunciado_id`);

--
-- Indices de la tabla `envio_correos`
--
ALTER TABLE `envio_correos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `examen_enunciados`
--
ALTER TABLE `examen_enunciados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examen_enunciados_examen_nivelacion_id_foreign` (`examen_nivelacion_id`);

--
-- Indices de la tabla `examen_nivelacions`
--
ALTER TABLE `examen_nivelacions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examen_nivelacions_curso_id_foreign` (`curso_id`);

--
-- Indices de la tabla `gestoria_banners`
--
ALTER TABLE `gestoria_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gestoria_nosotros`
--
ALTER TABLE `gestoria_nosotros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gestoria_servicios`
--
ALTER TABLE `gestoria_servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gestoria_solicituds`
--
ALTER TABLE `gestoria_solicituds`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gestoria_tips`
--
ALTER TABLE `gestoria_tips`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupo_profesors`
--
ALTER TABLE `grupo_profesors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_profesors_user_id_foreign` (`user_id`),
  ADD KEY `grupo_profesors_grupo_id_foreign` (`grupo_id`);

--
-- Indices de la tabla `grupo_recursos`
--
ALTER TABLE `grupo_recursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_recursos_grupo_id_foreign` (`grupo_id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `informacion_pagos`
--
ALTER TABLE `informacion_pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inscripcions`
--
ALTER TABLE `inscripcions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inscripcions_correo_unique` (`correo`),
  ADD KEY `inscripcions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `inscripcion_examens`
--
ALTER TABLE `inscripcion_examens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inscripcion_examens_inscripcion_id_foreign` (`inscripcion_id`),
  ADD KEY `inscripcion_examens_inscripcion_solicitud_id_foreign` (`inscripcion_solicitud_id`),
  ADD KEY `inscripcion_examens_examen_nivelacion_id_foreign` (`examen_nivelacion_id`);

--
-- Indices de la tabla `inscripcion_respuestas`
--
ALTER TABLE `inscripcion_respuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inscripcion_respuestas_inscripcion_examen_id_foreign` (`inscripcion_examen_id`),
  ADD KEY `inscripcion_respuestas_examen_enunciado_id_foreign` (`examen_enunciado_id`),
  ADD KEY `inscripcion_respuestas_enunciado_pregunta_id_foreign` (`enunciado_pregunta_id`);

--
-- Indices de la tabla `inscripcion_solicituds`
--
ALTER TABLE `inscripcion_solicituds`
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
-- Indices de la tabla `plan_pagos`
--
ALTER TABLE `plan_pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `portal_comunicados`
--
ALTER TABLE `portal_comunicados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `portal_gestorias`
--
ALTER TABLE `portal_gestorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesors`
--
ALTER TABLE `profesors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profesors_correo_unique` (`correo`);

--
-- Indices de la tabla `recuperacions`
--
ALTER TABLE `recuperacions`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `asignacion_grupos`
--
ALTER TABLE `asignacion_grupos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comunicados`
--
ALTER TABLE `comunicados`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `configuracion_gestorias`
--
ALTER TABLE `configuracion_gestorias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `enunciado_preguntas`
--
ALTER TABLE `enunciado_preguntas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `envio_correos`
--
ALTER TABLE `envio_correos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `examen_enunciados`
--
ALTER TABLE `examen_enunciados`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `examen_nivelacions`
--
ALTER TABLE `examen_nivelacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `gestoria_banners`
--
ALTER TABLE `gestoria_banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gestoria_nosotros`
--
ALTER TABLE `gestoria_nosotros`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `gestoria_servicios`
--
ALTER TABLE `gestoria_servicios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gestoria_solicituds`
--
ALTER TABLE `gestoria_solicituds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gestoria_tips`
--
ALTER TABLE `gestoria_tips`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `grupo_profesors`
--
ALTER TABLE `grupo_profesors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `grupo_recursos`
--
ALTER TABLE `grupo_recursos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `informacion_pagos`
--
ALTER TABLE `informacion_pagos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `inscripcions`
--
ALTER TABLE `inscripcions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `inscripcion_examens`
--
ALTER TABLE `inscripcion_examens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `inscripcion_respuestas`
--
ALTER TABLE `inscripcion_respuestas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `inscripcion_solicituds`
--
ALTER TABLE `inscripcion_solicituds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plan_pagos`
--
ALTER TABLE `plan_pagos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `portal_comunicados`
--
ALTER TABLE `portal_comunicados`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `portal_gestorias`
--
ALTER TABLE `portal_gestorias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `profesors`
--
ALTER TABLE `profesors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `recuperacions`
--
ALTER TABLE `recuperacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `red_socials`
--
ALTER TABLE `red_socials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion_grupos`
--
ALTER TABLE `asignacion_grupos`
  ADD CONSTRAINT `asignacion_grupos_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `asignacion_grupos_grupo_id_foreign` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`),
  ADD CONSTRAINT `asignacion_grupos_inscripcion_id_foreign` FOREIGN KEY (`inscripcion_id`) REFERENCES `inscripcions` (`id`),
  ADD CONSTRAINT `asignacion_grupos_inscripcion_solicitud_id_foreign` FOREIGN KEY (`inscripcion_solicitud_id`) REFERENCES `inscripcion_solicituds` (`id`);

--
-- Filtros para la tabla `enunciado_preguntas`
--
ALTER TABLE `enunciado_preguntas`
  ADD CONSTRAINT `enunciado_preguntas_examen_enunciado_id_foreign` FOREIGN KEY (`examen_enunciado_id`) REFERENCES `examen_enunciados` (`id`);

--
-- Filtros para la tabla `examen_enunciados`
--
ALTER TABLE `examen_enunciados`
  ADD CONSTRAINT `examen_enunciados_examen_nivelacion_id_foreign` FOREIGN KEY (`examen_nivelacion_id`) REFERENCES `examen_nivelacions` (`id`);

--
-- Filtros para la tabla `examen_nivelacions`
--
ALTER TABLE `examen_nivelacions`
  ADD CONSTRAINT `examen_nivelacions_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);

--
-- Filtros para la tabla `grupo_profesors`
--
ALTER TABLE `grupo_profesors`
  ADD CONSTRAINT `grupo_profesors_grupo_id_foreign` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`),
  ADD CONSTRAINT `grupo_profesors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `grupo_recursos`
--
ALTER TABLE `grupo_recursos`
  ADD CONSTRAINT `grupo_recursos_grupo_id_foreign` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`);

--
-- Filtros para la tabla `inscripcions`
--
ALTER TABLE `inscripcions`
  ADD CONSTRAINT `inscripcions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `inscripcion_examens`
--
ALTER TABLE `inscripcion_examens`
  ADD CONSTRAINT `inscripcion_examens_examen_nivelacion_id_foreign` FOREIGN KEY (`examen_nivelacion_id`) REFERENCES `examen_nivelacions` (`id`),
  ADD CONSTRAINT `inscripcion_examens_inscripcion_id_foreign` FOREIGN KEY (`inscripcion_id`) REFERENCES `inscripcions` (`id`),
  ADD CONSTRAINT `inscripcion_examens_inscripcion_solicitud_id_foreign` FOREIGN KEY (`inscripcion_solicitud_id`) REFERENCES `inscripcion_solicituds` (`id`);

--
-- Filtros para la tabla `inscripcion_respuestas`
--
ALTER TABLE `inscripcion_respuestas`
  ADD CONSTRAINT `inscripcion_respuestas_enunciado_pregunta_id_foreign` FOREIGN KEY (`enunciado_pregunta_id`) REFERENCES `enunciado_preguntas` (`id`),
  ADD CONSTRAINT `inscripcion_respuestas_examen_enunciado_id_foreign` FOREIGN KEY (`examen_enunciado_id`) REFERENCES `examen_enunciados` (`id`),
  ADD CONSTRAINT `inscripcion_respuestas_inscripcion_examen_id_foreign` FOREIGN KEY (`inscripcion_examen_id`) REFERENCES `inscripcion_examens` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
