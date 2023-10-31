-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 31-10-2023 a las 18:18:06
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `posicion` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`id`, `img`, `posicion`, `created_at`, `updated_at`) VALUES
(1, '1698252099_1.png', 1, '2023-10-20 15:56:47', '2023-10-25 16:41:39'),
(2, '1698252105_2.png', 2, '2023-10-20 16:02:52', '2023-10-25 16:41:45');

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
(1, 'SHOPPING VIZUR CALLE MARISCAL SANTA CRUZ Y CALLE ARENALES CASTEA N° 22', '+591 66666666', '', 'infogestoria@tomorrowstoday.com', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d5409.403545726189!2d-68.11048986981962!3d-16.524788557606783!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.52559586873182!2d-68.1078194457513!5e0!3m2!1ses-419!2sbo!4v1698085176811!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '2023-10-23 18:13:52', '2023-10-23 18:21:17');

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
  `opciones` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_enunciados`
--

CREATE TABLE `examen_enunciados` (
  `id` bigint UNSIGNED NOT NULL,
  `examen_nivelacion_id` bigint UNSIGNED NOT NULL,
  `enunciado` varchar(700) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestoria_banners`
--

CREATE TABLE `gestoria_banners` (
  `id` bigint UNSIGNED NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `posicion` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gestoria_banners`
--

INSERT INTO `gestoria_banners` (`id`, `img`, `posicion`, `created_at`, `updated_at`) VALUES
(1, '1698252229_1.webp', 1, '2023-10-23 17:32:58', '2023-10-25 16:43:49'),
(2, '1698252254_2.jpg', 2, '2023-10-23 17:34:03', '2023-10-25 16:44:14');

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
(1, 'Somos Gestores<br />\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '1698252640_1.png', '2023-10-23 17:45:35', '2023-10-25 16:50:40');

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
(2, 'Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Turismo', 'Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Trabajo', 'Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Estudiantes', 'Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país. Renovación', NULL, '2023-10-23 18:02:40', '2023-10-23 18:04:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestoria_solicituds`
--

CREATE TABLE `gestoria_solicituds` (
  `id` bigint UNSIGNED NOT NULL,
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_profesors`
--

CREATE TABLE `grupo_profesors` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `grupo_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(117, 1, 'CREACIÓN', 'EL USUARIO admin@gmail.com ACTUALIZÓ EL PLAN DE PAGOS ANUAL', 'id: 3<br/>titulo: Plan Anual<br/>costo: 400.00<br/>detalles: Ahora USD 214<br />\nPlataforma interactiva<br />\nMateriales digitales<br />\nRecursos tecnologicos<br />\nClases en vivo<br />\nCursos de preparación<br />\nBeacas academicas<br/>created_at: <br/>updated_at: 2023-10-31 11:54:31<br/>', NULL, 'PLAN DE PAGOS', '2023-10-31', '11:54:31', '2023-10-31 15:54:31', '2023-10-31 15:54:31');

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
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inscripcions`
--

INSERT INTO `inscripcions` (`id`, `user_id`, `nombres`, `apellidos`, `nro_iden`, `fecha_nac`, `edad`, `pais_residencia`, `nacionalidad`, `prov_dpto`, `sexo`, `fono`, `correo`, `created_at`, `updated_at`) VALUES
(2, 5, 'MARCOS', 'MAMANI MAMANI', '12345', '2000-01-01', 23, 'BOLIVIA', 'BOLIVIANO', 'LA PAZ', 'HOMBRE', '7777777', 'marcos@gmail.com', '2023-10-31 17:52:08', '2023-10-31 17:52:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion_examens`
--

CREATE TABLE `inscripcion_examens` (
  `id` bigint UNSIGNED NOT NULL,
  `inscripcion_id` bigint UNSIGNED NOT NULL,
  `inscripcion_solicitud_id` bigint UNSIGNED NOT NULL,
  `examen_nivelacion_id` bigint UNSIGNED NOT NULL,
  `puntaje` double(8,2) NOT NULL,
  `estado` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion_respuestas`
--

CREATE TABLE `inscripcion_respuestas` (
  `id` bigint UNSIGNED NOT NULL,
  `inscripcion_examen_id` bigint UNSIGNED NOT NULL,
  `examen_enunciado_id` bigint UNSIGNED NOT NULL,
  `enunciado_pregunta_id` bigint UNSIGNED NOT NULL,
  `respuesta` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calificacion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion_solicituds`
--

CREATE TABLE `inscripcion_solicituds` (
  `id` bigint UNSIGNED NOT NULL,
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

INSERT INTO `inscripcion_solicituds` (`id`, `inscripcion_id`, `curso_id`, `nivel`, `se_entero`, `desc_se_entero`, `plan_pago_id`, `plan_costo`, `forma_pago`, `archivo_pago`, `desc_pago`, `desc_otro_pago`, `estado_asignado`, `estado`, `created_at`, `updated_at`) VALUES
(1, 2, 7, 'NIVEL CERO', 'OTRO', 'UN CONOCIDO', 3, 400.00, 'DEPÓSITO BANCARIO', NULL, NULL, NULL, 'NO', 'PENDIENTE', '2023-10-31 17:52:08', '2023-10-31 17:52:08');

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
(32, '2023_10_31_104720_create_plan_pagos_table', 6);

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
(1, 'Plan Mensual', 49.99, 'Plataforma interactiva<br />\nMateriales digitales<br />\nRecursos tecnologicos<br />\nClases en vivo<br />\nCursos de preparación<br />\nBeacas academicas', NULL, '2023-10-31 15:54:31'),
(2, 'Plan Trimestral', 130.00, 'Ahora USD 123<br />\nPlataforma interactiva<br />\nMateriales digitales<br />\nRecursos tecnologicos<br />\nClases en vivo<br />\nCursos de preparación<br />\nBeacas academicas', NULL, '2023-10-31 15:54:31'),
(3, 'Plan Anual', 400.00, 'Ahora USD 214<br />\nPlataforma interactiva<br />\nMateriales digitales<br />\nRecursos tecnologicos<br />\nClases en vivo<br />\nCursos de preparación<br />\nBeacas academicas', NULL, '2023-10-31 15:54:31');

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
(2, 'juan@gmail.com', 'JUAN', 'PERES', 'MAMANI', 'LOS OLIVOS', 'JUAN@GMAIL.COM', '7777777', '$2y$10$PyYyeiVACluSevqQ9FEOm.jLPw744pSMyVy3Ek7DwvDo/bveMFj4q', 'ADMINISTRADOR', 'default.png', 1, '2023-10-07', '2023-10-07 23:33:20', '2023-10-07 23:39:10'),
(3, 'maria@gmail.com', 'MARIA', 'MAMANI', 'MAMANI', 'LOS OLIVOS', 'MARIA@GMAIL.COM', '', '$2y$10$bd0rITfeftm3JW7h.vktRO7406W9Mykg1X2dukizhYvjqZfrzQsTi', 'AUXILIAR', 'default.png', 1, '2023-10-07', '2023-10-07 23:47:44', '2023-10-20 15:19:04'),
(5, 'marcos@gmail.com', 'MARCOS', 'MAMANI MAMANI', NULL, 'LA PAZ - BOLIVIA', 'marcos@gmail.com', '7777777', '$2y$10$w.iN4dL8Pj/dTt/0kWD1oeQvb26B4mi2s/imbyJotYGTRui42RGKy', 'ESTUDIANTE', NULL, 1, '2023-10-31', '2023-10-31 17:52:08', '2023-10-31 17:52:08');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comunicados`
--
ALTER TABLE `comunicados`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `enunciado_preguntas`
--
ALTER TABLE `enunciado_preguntas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `examen_enunciados`
--
ALTER TABLE `examen_enunciados`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `examen_nivelacions`
--
ALTER TABLE `examen_nivelacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo_profesors`
--
ALTER TABLE `grupo_profesors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo_recursos`
--
ALTER TABLE `grupo_recursos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripcions`
--
ALTER TABLE `inscripcions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inscripcion_examens`
--
ALTER TABLE `inscripcion_examens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripcion_respuestas`
--
ALTER TABLE `inscripcion_respuestas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripcion_solicituds`
--
ALTER TABLE `inscripcion_solicituds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
