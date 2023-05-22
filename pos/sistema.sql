-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2023 a las 16:35:33
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos`
--

CREATE TABLE `abonos` (
  `id` int(11) NOT NULL,
  `abono` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `apertura` int(11) NOT NULL DEFAULT 1,
  `id_credito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `id` int(11) NOT NULL,
  `evento` varchar(30) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `detalle` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartados`
--

CREATE TABLE `apartados` (
  `id` int(11) NOT NULL,
  `productos` longtext NOT NULL,
  `fecha_create` date DEFAULT NULL,
  `fecha_apartado` datetime NOT NULL,
  `fecha_retiro` datetime NOT NULL,
  `abono` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `color` varchar(15) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id` int(11) NOT NULL,
  `monto_inicial` decimal(10,2) NOT NULL,
  `fecha_apertura` date NOT NULL,
  `fecha_cierre` date DEFAULT NULL,
  `monto_final` decimal(10,2) DEFAULT NULL,
  `total_ventas` int(11) DEFAULT NULL,
  `egresos` decimal(10,2) DEFAULT NULL,
  `gastos` decimal(10,2) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id`, `monto_inicial`, `fecha_apertura`, `fecha_cierre`, `monto_final`, `total_ventas`, `egresos`, `gastos`, `estado`, `id_usuario`) VALUES
(1, '700.00', '2023-05-16', '2023-05-17', '0.00', 0, '0.00', '0.00', 0, 3),
(2, '54000.00', '2023-05-21', '2023-05-22', '2700.00', 4, '4100.00', '500.00', 0, 3),
(3, '152000.00', '2022-11-28', '2023-02-15', '1750.00', 3, '3400.00', '0.00', 0, 3),
(5, '7500.00', '2023-02-15', '2023-05-22', '0.00', 0, '0.00', '0.00', 0, 3),
(6, '500000.00', '2023-05-22', '2023-05-22', '5296.00', 25, '200.00', '0.00', 0, 3),
(7, '50000.00', '2023-05-22', NULL, NULL, NULL, NULL, NULL, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `fecha`, `estado`) VALUES
(1, 'Tecnologia', '2023-05-22 20:20:09', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `identidad` varchar(50) NOT NULL,
  `num_identidad` varchar(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `identidad`, `num_identidad`, `nombre`, `telefono`, `correo`, `direccion`, `fecha`, `estado`) VALUES
(1, 'RUC', '1', 'erik', '3322545', 'erik.aguayo2887@alumnos.udg.mx', '<p>calle calle</p>', '2023-05-22 08:07:53', 1),
(2, 'INE', '2', 'Daniela', '3322114455', 'Daniela@gmail.com', '<p>calle daniela</p>', '2023-05-22 08:57:02', 1),
(3, 'INE', '3', 'Ximena', '3322557766', 'ximena@gmail.com', '<p>calle ximena</p>', '2023-05-22 05:42:32', 1),
(4, 'INE', '4', 'Daniel', '33213123123', 'daniel@gmail.com', '<p>calle Daniel</p>', '2023-05-22 08:58:46', 1),
(5, 'INE', '5', 'Oswaldo', '123123123', 'oswaldo@gmail.com', '<p>calle oswaldo</p>', '2023-05-22 08:59:20', 1),
(6, 'INE', '6', 'Crystal', '3231312435456', 'crystal@gmail.com', '<p>calle crystal</p>', '2023-05-22 08:59:46', 1),
(7, 'INE', '7', 'Franco', '63242343', 'franco@gmail.com', '<p>calle Franco</p>', '2023-05-22 09:00:12', 1),
(8, 'INE', '8', 'Prueba', '312312312', 'prueba@gmail.com', '<p>calle prueba</p>', '2023-05-22 13:38:57', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `productos` longtext NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `serie` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `apertura` int(11) NOT NULL DEFAULT 1,
  `id_proveedor` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `productos`, `total`, `fecha`, `hora`, `serie`, `estado`, `apertura`, `id_proveedor`, `id_usuario`) VALUES
(1, '[{\"id\":1,\"nombre\":\"teclado\",\"precio\":\"300.00\",\"cantidad\":4}]', '1200.00', '2023-05-21', '21:26:25', '00000001', 1, 0, 1, 3),
(2, '[{\"id\":1,\"nombre\":\"teclado\",\"precio\":\"300.00\",\"cantidad\":1}]', '300.00', '2023-05-22', '21:51:25', '00000001', 1, 0, 1, 3),
(3, '[{\"id\":1,\"nombre\":\"teclado\",\"precio\":\"300.00\",\"cantidad\":\"5\"}]', '1500.00', '2023-05-21', '21:52:13', '00000002', 1, 0, 1, 3),
(4, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"100.00\",\"cantidad\":1}]', '100.00', '2023-05-21', '22:27:48', '00000003', 1, 0, 1, 3),
(5, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"100.00\",\"cantidad\":\"5\"}]', '500.00', '2023-05-22', '22:28:15', '00000004', 1, 0, 1, 3),
(6, '[{\"id\":1,\"nombre\":\"teclado\",\"precio\":\"300.00\",\"cantidad\":\"6\"}]', '1800.00', '2023-05-22', '18:46:50', '00000004', 1, 0, 1, 3),
(7, '[{\"id\":3,\"nombre\":\"Bocinas\",\"precio\":\"200.00\",\"cantidad\":\"8\"}]', '1600.00', '2023-05-22', '18:47:51', '00000004', 1, 0, 1, 3),
(8, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"100.00\",\"cantidad\":2}]', '200.00', '2023-05-22', '10:32:57', '00000002', 1, 0, 1, 3),
(9, '[{\"id\":4,\"nombre\":\"Audifonos\",\"precio\":\"300.00\",\"cantidad\":\"6\"}]', '1800.00', '2023-05-22', '15:46:25', '00000001', 1, 1, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `ruc` varchar(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  `mensaje` text NOT NULL,
  `impuesto` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `ruc`, `nombre`, `telefono`, `correo`, `direccion`, `mensaje`, `impuesto`) VALUES
(1, 'DevMexShop S.A', 'DevMexShop', '3322485623', 'DevMexShop@gmail.com', 'CUCEI', '<p>GRACIAS POR SU PREFERENCIA</p>', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `id` int(11) NOT NULL,
  `productos` longtext NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `metodo` varchar(20) NOT NULL,
  `validez` varchar(30) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creditos`
--

CREATE TABLE `creditos` (
  `id` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `creditos`
--

INSERT INTO `creditos` (`id`, `monto`, `fecha`, `hora`, `estado`, `id_venta`) VALUES
(1, '950.00', '2022-11-27', '23:30:27', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_apartado`
--

CREATE TABLE `detalle_apartado` (
  `id` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `apertura` int(11) NOT NULL DEFAULT 1,
  `id_apartado` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `foto` varchar(150) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `apertura` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`id`, `monto`, `descripcion`, `foto`, `fecha`, `apertura`, `id_usuario`) VALUES
(1, '500.00', '<p>mantenimiento sistema</p>', NULL, '2022-11-28 00:16:43', 0, 3),
(2, '500.00', '<p>se realizo mtto al sistema</p>', NULL, '2023-05-22 13:42:59', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `movimiento` varchar(100) NOT NULL,
  `accion` varchar(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `stock_actual` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `movimiento`, `accion`, `cantidad`, `stock_actual`, `fecha`, `id_producto`, `id_usuario`) VALUES
(1, 'Compra N°: 1', 'entrada', 4, 4, '2022-11-27 20:26:25', 1, 3),
(2, 'Venta N°: 1', 'salida', 2, 2, '2022-11-27 20:26:59', 1, 3),
(3, 'Venta N°: 2', 'salida', 2, 0, '2022-11-27 20:31:37', 1, 3),
(4, 'Venta N°: 3', 'salida', 2, -2, '2022-11-27 20:31:45', 1, 3),
(5, 'Compra N°: 2', 'entrada', 1, -1, '2022-11-27 20:51:25', 1, 3),
(6, 'Compra N°: 3', 'entrada', 5, 4, '2022-11-27 20:52:13', 1, 3),
(7, 'Compra N°: 4', 'entrada', 1, 1, '2022-11-27 21:27:49', 2, 3),
(8, 'Compra N°: 5', 'entrada', 5, 6, '2022-11-27 21:28:16', 2, 3),
(9, 'Venta N°: 4', 'salida', 2, 2, '2022-11-27 22:30:27', 1, 3),
(10, 'Venta N°: 4', 'salida', 1, 5, '2022-11-27 22:30:27', 2, 3),
(11, 'Compra N°: 6', 'entrada', 6, 8, '2022-11-28 17:46:51', 1, 3),
(12, 'Compra N°: 7', 'entrada', 8, 8, '2022-11-28 17:47:51', 3, 3),
(13, 'Venta N°: 5', 'salida', 2, 6, '2022-11-28 17:49:02', 3, 3),
(14, 'Venta N°: 6', 'salida', 2, 6, '2022-11-28 22:35:12', 1, 3),
(15, 'Venta N°: 6', 'salida', 1, 4, '2022-11-28 22:35:12', 2, 3),
(16, 'Venta N°: 7', 'salida', 2, 2, '2023-02-15 03:19:43', 2, 3),
(17, 'Devolución Venta N°: 7', 'entrada', 2, 4, '2023-05-22 06:05:27', 2, 3),
(18, 'Venta N°: 8', 'salida', 1, 5, '2023-05-22 08:02:17', 1, 3),
(19, 'Venta N°: 8', 'salida', 1, 3, '2023-05-22 08:02:17', 2, 3),
(20, 'Venta N°: 9', 'salida', 1, 2, '2023-05-22 08:13:19', 2, 3),
(21, 'Venta N°: 10', 'salida', 1, 4, '2023-05-22 08:14:25', 1, 3),
(22, 'Venta N°: 11', 'salida', 1, 3, '2023-05-22 08:14:29', 1, 3),
(23, 'Venta N°: 12', 'salida', 1, 1, '2023-05-22 08:15:20', 2, 3),
(24, 'Venta N°: 13', 'salida', 1, 0, '2023-05-22 08:15:23', 2, 3),
(25, 'Venta N°: 14', 'salida', 1, -1, '2023-05-22 08:15:23', 2, 3),
(26, 'Venta N°: 15', 'salida', 1, -2, '2023-05-22 08:15:24', 2, 3),
(27, 'Venta N°: 16', 'salida', 1, -3, '2023-05-22 08:15:24', 2, 3),
(28, 'Venta N°: 17', 'salida', 1, -4, '2023-05-22 08:15:24', 2, 3),
(29, 'Venta N°: 18', 'salida', 1, -5, '2023-05-22 08:15:24', 2, 3),
(30, 'Venta N°: 19', 'salida', 1, -6, '2023-05-22 08:15:24', 2, 3),
(31, 'Venta N°: 20', 'salida', 1, -7, '2023-05-22 08:15:25', 2, 3),
(32, 'Venta N°: 21', 'salida', 1, -8, '2023-05-22 08:15:25', 2, 3),
(33, 'Venta N°: 22', 'salida', 1, -9, '2023-05-22 08:15:25', 2, 3),
(34, 'Venta N°: 23', 'salida', 1, -10, '2023-05-22 08:15:25', 2, 3),
(35, 'Venta N°: 24', 'salida', 1, -11, '2023-05-22 08:15:30', 2, 3),
(36, 'Venta N°: 25', 'salida', 1, -12, '2023-05-22 08:15:31', 2, 3),
(37, 'Venta N°: 26', 'salida', 1, -13, '2023-05-22 08:15:31', 2, 3),
(38, 'Venta N°: 27', 'salida', 1, -14, '2023-05-22 08:15:33', 2, 3),
(39, 'Venta N°: 28', 'salida', 1, -15, '2023-05-22 08:20:04', 2, 3),
(40, 'Venta N°: 29', 'salida', 1, 2, '2023-05-22 08:26:43', 1, 3),
(41, 'Venta N°: 30', 'salida', 1, 14, '2023-05-22 08:28:25', 2, 3),
(42, 'Venta N°: 31', 'salida', 1, 13, '2023-05-22 08:29:25', 2, 3),
(43, 'Venta N°: 32', 'salida', 1, 12, '2023-05-22 08:30:39', 2, 3),
(44, 'Compra N°: 8', 'entrada', 2, 14, '2023-05-22 08:32:57', 2, 3),
(45, 'Compra N°: 9', 'entrada', 6, 6, '2023-05-22 13:46:25', 4, 3),
(46, 'Venta N°: 33', 'salida', 2, 4, '2023-05-22 13:47:57', 4, 3),
(47, 'Venta N°: 34', 'salida', 1, 13, '2023-05-22 14:34:01', 2, 3),
(48, 'Venta N°: 35', 'salida', 1, 12, '2023-05-22 14:34:01', 2, 3),
(49, 'Venta N°: 36', 'salida', 1, 11, '2023-05-22 14:34:01', 2, 3),
(50, 'Venta N°: 37', 'salida', 1, 3, '2023-05-22 14:34:29', 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidas`
--

CREATE TABLE `medidas` (
  `id` int(11) NOT NULL,
  `medida` varchar(100) NOT NULL,
  `nombre_corto` varchar(10) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medidas`
--

INSERT INTO `medidas` (`id`, `medida`, `nombre_corto`, `fecha`, `estado`) VALUES
(1, 'nuevo', 'new', '2022-11-27 20:20:29', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `foto` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ventas` int(11) NOT NULL DEFAULT 0,
  `id_medida` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `descripcion`, `precio_compra`, `precio_venta`, `cantidad`, `foto`, `estado`, `fecha`, `ventas`, `id_medida`, `id_categoria`) VALUES
(1, '1234', 'teclado', '300.00', '500.00', 2, 'assets/images/productos/20221128021241.jpg', 1, '2023-05-22 08:26:43', 14, 1, 1),
(2, '321', 'Mouse', '100.00', '150.00', 11, NULL, 1, '2023-05-22 14:34:01', 27, 1, 1),
(3, '543', 'Bocinas', '200.00', '300.00', 6, NULL, 1, '2022-11-28 17:49:02', 2, 1, 1),
(4, '2342', 'Audifonos', '300.00', '500.00', 3, NULL, 1, '2023-05-22 14:34:29', 3, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `ruc` varchar(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `ruc`, `nombre`, `telefono`, `correo`, `direccion`, `fecha`, `estado`) VALUES
(1, '123', 'lala', '33224455', 'lala@gmail.com', '<p>calle lala</p>', '2022-11-27 20:18:18', 1),
(2, '1234', 'Local Tecnologia', '1231231234', 'tec@gmail.com', '<p>calle tecnologia</p>', '2023-05-22 13:45:43', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `clave` varchar(200) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `correo`, `telefono`, `direccion`, `perfil`, `clave`, `token`, `fecha`, `estado`, `rol`) VALUES
(3, 'erik', 'aguayo', 'erik.aguayo2887@alumnos.udg.mx', '33234312', 'martin galaz', NULL, '$2y$10$V46tu/zOxmQUfxd7MwFaf.ykhPYrHbxcFcYQRCnBENCEsMFAnN1pu', NULL, '2022-11-27 20:14:39', 1, 1),
(4, 'vendedor', 'vende', 'prov@gmail.com', '3321457534', 'rio de janeiro', NULL, '$2y$10$hhAxg2Dc.zs9gC7z5Uxpm.q5IfyM0iStWMn0zYstPtjw421IOB7SS', NULL, '2022-11-28 00:38:36', 1, 2),
(5, 'Admin', 'empresa', 'admin@gmail.com', '3344225533', 'calle admin', NULL, '$2y$10$8tpJxuoPSQWWupnPuEPHBeO0lzOm1P.pU.PKNzIuPlIkNf/XsTiWq', NULL, '2022-11-28 17:51:08', 1, 1),
(6, 'prueba', 'prueba', 'prueba@gmail.com', '32313123', 'asdasdasd', NULL, '$2y$10$7reDnIt3OHZQLkpXjl.BruO5Nxl27DfYNB.VFOP7BJFWw01eZaBNi', NULL, '2023-05-22 13:57:37', 1, 2),
(7, 'daniel', 'neri', 'daniel@gmail.com', '32131242342', 'calle daniel', NULL, '$2y$10$A6PtXBatiPLRNCIP/GshXOrCxGilngdkamfgFKbRgYonQxOyRv01u', NULL, '2023-05-22 13:40:17', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `productos` longtext NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `metodo` varchar(15) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `serie` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `apertura` int(11) NOT NULL DEFAULT 1,
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `productos`, `total`, `fecha`, `hora`, `metodo`, `descuento`, `serie`, `estado`, `apertura`, `id_cliente`, `id_usuario`) VALUES
(1, '[{\"id\":1,\"nombre\":\"teclado\",\"precio\":\"500.00\",\"cantidad\":2}]', '1000.00', '2023-05-18', '21:26:58', 'CONTADO', '200.00', '00000001', 1, 0, 1, 3),
(2, '[{\"id\":1,\"nombre\":\"teclado\",\"precio\":\"500.00\",\"cantidad\":2}]', '1000.00', '2023-05-18', '21:31:36', 'CONTADO', '50.00', '00000002', 1, 0, 1, 3),
(3, '[{\"id\":1,\"nombre\":\"teclado\",\"precio\":\"500.00\",\"cantidad\":2}]', '1000.00', '2023-05-18', '21:31:45', 'CONTADO', '50.00', '00000003', 1, 0, 1, 3),
(4, '[{\"id\":1,\"nombre\":\"teclado\",\"precio\":\"500.00\",\"cantidad\":2},{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '1150.00', '2023-05-19', '23:30:27', 'CREDITO', '200.00', '00000004', 1, 0, 1, 3),
(5, '[{\"id\":3,\"nombre\":\"Bocinas\",\"precio\":\"300.00\",\"cantidad\":\"2\"}]', '600.00', '2023-05-19', '18:49:00', 'CONTADO', '100.00', '00000005', 1, 0, 1, 3),
(6, '[{\"id\":1,\"nombre\":\"teclado\",\"precio\":\"500.00\",\"cantidad\":\"2\"},{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '1150.00', '2023-05-19', '23:35:12', 'CONTADO', '200.00', '00000006', 1, 0, 1, 3),
(7, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":\"2\"}]', '300.00', '2023-02-15', '04:19:41', 'CONTADO', '0.00', '00000007', 0, 0, 1, 3),
(8, '[{\"id\":1,\"nombre\":\"teclado\",\"precio\":\"500.00\",\"cantidad\":1},{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '650.00', '2023-05-22', '10:02:17', 'CONTADO', '0.00', '00000008', 1, 0, 1, 3),
(9, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:13:19', 'CONTADO', '0.00', '00000009', 1, 0, 1, 3),
(10, '[{\"id\":1,\"nombre\":\"teclado\",\"precio\":\"500.00\",\"cantidad\":1}]', '500.00', '2023-05-22', '10:14:25', 'CONTADO', '0.00', '00000010', 1, 0, 1, 3),
(11, '[{\"id\":1,\"nombre\":\"teclado\",\"precio\":\"500.00\",\"cantidad\":1}]', '500.00', '2023-05-22', '10:14:29', 'CONTADO', '0.00', '00000011', 1, 0, 1, 3),
(12, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:20', 'CONTADO', '0.00', '00000012', 1, 0, 1, 3),
(13, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:23', 'CONTADO', '0.00', '00000013', 1, 0, 1, 3),
(14, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:23', 'CONTADO', '0.00', '00000014', 1, 0, 1, 3),
(15, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:24', 'CONTADO', '0.00', '00000015', 1, 0, 1, 3),
(16, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:24', 'CONTADO', '0.00', '00000016', 1, 0, 1, 3),
(17, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:24', 'CONTADO', '0.00', '00000017', 1, 0, 1, 3),
(18, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:24', 'CONTADO', '0.00', '00000018', 1, 0, 1, 3),
(19, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:24', 'CONTADO', '0.00', '00000019', 1, 0, 1, 3),
(20, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:24', 'CONTADO', '0.00', '00000020', 1, 0, 1, 3),
(21, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:25', 'CONTADO', '0.00', '00000021', 1, 0, 1, 3),
(22, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:25', 'CONTADO', '0.00', '00000022', 1, 0, 1, 3),
(23, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:25', 'CONTADO', '0.00', '00000023', 1, 0, 1, 3),
(24, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:30', 'CONTADO', '1.00', '00000024', 1, 0, 1, 3),
(25, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:31', 'CONTADO', '1.00', '00000025', 1, 0, 1, 3),
(26, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:31', 'CONTADO', '1.00', '00000026', 1, 0, 1, 3),
(27, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:15:33', 'CONTADO', '1.00', '00000027', 1, 0, 1, 3),
(28, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:20:04', 'CONTADO', '0.00', '00000028', 1, 0, 1, 3),
(29, '[{\"id\":1,\"nombre\":\"teclado\",\"precio\":\"500.00\",\"cantidad\":1}]', '500.00', '2023-05-22', '10:26:43', 'CONTADO', '0.00', '00000029', 1, 0, 1, 3),
(30, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:28:25', 'CONTADO', '0.00', '00000030', 1, 0, 1, 3),
(31, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:29:25', 'CONTADO', '0.00', '00000031', 1, 0, 1, 3),
(32, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '10:30:39', 'CONTADO', '0.00', '00000032', 1, 0, 1, 3),
(33, '[{\"id\":4,\"nombre\":\"Audifonos\",\"precio\":\"500.00\",\"cantidad\":\"2\"}]', '1000.00', '2023-05-22', '15:47:57', 'CONTADO', '0.00', '00000033', 1, 1, 1, 3),
(34, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '16:34:01', 'CONTADO', '0.00', '00000034', 1, 1, 1, 3),
(35, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '16:34:01', 'CONTADO', '0.00', '00000035', 1, 1, 1, 3),
(36, '[{\"id\":2,\"nombre\":\"Mouse\",\"precio\":\"150.00\",\"cantidad\":1}]', '150.00', '2023-05-22', '16:34:01', 'CONTADO', '0.00', '00000036', 1, 1, 1, 3),
(37, '[{\"id\":4,\"nombre\":\"Audifonos\",\"precio\":\"500.00\",\"cantidad\":1}]', '500.00', '2023-05-22', '16:34:29', 'CONTADO', '0.00', '00000037', 1, 1, 1, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_credito` (`id_credito`);

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `apartados`
--
ALTER TABLE `apartados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `creditos`
--
ALTER TABLE `creditos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `detalle_apartado`
--
ALTER TABLE `detalle_apartado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `medidas`
--
ALTER TABLE `medidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_medida` (`id_medida`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abonos`
--
ALTER TABLE `abonos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `apartados`
--
ALTER TABLE `apartados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `creditos`
--
ALTER TABLE `creditos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_apartado`
--
ALTER TABLE `detalle_apartado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `medidas`
--
ALTER TABLE `medidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD CONSTRAINT `abonos_ibfk_1` FOREIGN KEY (`id_credito`) REFERENCES `creditos` (`id`);

--
-- Filtros para la tabla `apartados`
--
ALTER TABLE `apartados`
  ADD CONSTRAINT `apartados_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `cajas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `creditos`
--
ALTER TABLE `creditos`
  ADD CONSTRAINT `creditos_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_medida`) REFERENCES `medidas` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
