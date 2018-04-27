-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2017 a las 15:35:28
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `disfrutar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_come` int(13) NOT NULL,
  `nomb_come` varchar(255) NOT NULL,
  `mail_come` varchar(255) NOT NULL,
  `asun_come` varchar(255) NOT NULL,
  `mens_come` varchar(255) NOT NULL,
  `fech_come` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id_come`, `nomb_come`, `mail_come`, `asun_come`, `mens_come`, `fech_come`) VALUES
(12, 'asdd', 'male@hot.com', 'adasd', 'asdpkmadmamd', '2017-11-03'),
(13, 'guidooo', 'guibu@hot.com', 'okakoa', 'maomdma aosdsdad asdsd asdasddwdkokwokdkwodkwd kosodkook', '2017-11-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_deta_vent` int(15) NOT NULL,
  `id_vent` int(255) NOT NULL,
  `id_arti` int(13) NOT NULL,
  `item_cant` int(5) NOT NULL,
  `item_prec` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_deta_vent`, `id_vent`, `id_arti`, `item_cant`, `item_prec`) VALUES
(42, 87, 11, 1, 50),
(43, 87, 8, 1, 15),
(44, 87, 7, 1, 10),
(45, 87, 3, 1, 35),
(46, 88, 21, 1, 26),
(47, 88, 22, 1, 3),
(48, 88, 23, 1, 50),
(49, 88, 24, 2, 4),
(50, 89, 3, 4, 35),
(51, 89, 11, 3, 50),
(52, 89, 10, 1, 30),
(53, 89, 14, 2, 30),
(54, 89, 13, 1, 40),
(55, 91, 13, 4, 40),
(56, 91, 5, 2, 50),
(57, 91, 3, 1, 35),
(58, 92, 10, 0, 30),
(59, 94, 6, 2, 80),
(60, 94, 3, 1, 35),
(61, 95, 12, 0, 30),
(62, 95, 6, 0, 80),
(63, 96, 12, 0, 30),
(64, 96, 6, 0, 80),
(65, 97, 12, 0, 30),
(66, 97, 6, 0, 80),
(67, 98, 23, 0, 50),
(68, 98, 24, 0, 4),
(69, 98, 22, 0, 3),
(70, 99, 21, 0, 26),
(71, 99, 23, 0, 50),
(72, 99, 24, 0, 4),
(73, 99, 22, 0, 3),
(74, 100, 21, 0, 26),
(75, 100, 23, 0, 50),
(76, 100, 24, 0, 4),
(77, 100, 22, 0, 3),
(78, 101, 8, 2, 15),
(79, 101, 7, 5, 10),
(80, 101, 5, 2, 50),
(81, 101, 3, 5, 35),
(82, 102, 6, 2, 80),
(83, 102, 8, 6, 15),
(84, 102, 7, 1, 10),
(85, 102, 5, 4, 50),
(86, 102, 3, 2, 35),
(87, 103, 18, 2, 20),
(88, 103, 16, 3, 39),
(89, 103, 14, 2, 30),
(90, 103, 13, 1, 40),
(91, 103, 12, 5, 30),
(92, 104, 5, 1, 50),
(93, 104, 6, 1, 80),
(94, 105, 6, 2, 80),
(95, 105, 3, 1, 35),
(96, 106, 23, 1, 50),
(97, 106, 7, 1, 10),
(98, 106, 5, 1, 50),
(99, 106, 6, 0, 80),
(100, 107, 23, 2, 50),
(101, 107, 7, 33, 10),
(102, 107, 5, 2, 50),
(103, 107, 6, 0, 80),
(104, 108, 5, 2, 50),
(105, 108, 6, 2, 80),
(106, 108, 3, 1, 35),
(107, 109, 3, 1, 35),
(108, 109, 6, 1, 80),
(109, 109, 5, 1, 50),
(110, 109, 13, 1, 40),
(111, 111, 10, 3, 30),
(112, 111, 8, 1, 15),
(113, 111, 6, 2, 80),
(114, 111, 3, 1, 35),
(115, 112, 21, 2, 26),
(116, 112, 23, 1, 50),
(117, 112, 24, 2, 4),
(118, 112, 3, 1, 35),
(119, 113, 24, 1, 4),
(120, 113, 22, 1, 3),
(121, 113, 21, 1, 26),
(122, 113, 23, 1, 50),
(123, 114, 24, 1, 4),
(124, 114, 22, 1, 3),
(125, 114, 21, 1, 26),
(126, 114, 23, 1, 50),
(127, 115, 24, 1, 4),
(128, 116, 24, 1, 4),
(129, 116, 22, 1, 3),
(130, 117, 24, 1, 4),
(131, 117, 21, 1, 26),
(132, 118, 24, 2, 4),
(133, 118, 21, 1, 26),
(134, 119, 23, 1, 50),
(135, 119, 22, 1, 3),
(136, 119, 24, 2, 4),
(137, 120, 24, 1, 4),
(138, 120, 22, 1, 3),
(139, 121, 23, 1, 50),
(140, 121, 21, 1, 26),
(141, 122, 23, 1, 50),
(142, 122, 21, 1, 26),
(143, 123, 23, 1, 50),
(144, 123, 21, 1, 26),
(145, 124, 23, 1, 50),
(146, 124, 21, 1, 26),
(147, 126, 24, 1, 4),
(148, 126, 23, 1, 50),
(149, 126, 21, 1, 26),
(150, 126, 22, 1, 3),
(151, 127, 24, 1, 4),
(152, 127, 23, 1, 50),
(153, 127, 21, 1, 26),
(154, 127, 22, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `id_envio` int(11) NOT NULL,
  `dire_envi` varchar(255) DEFAULT NULL,
  `id_loca` int(13) NOT NULL,
  `cost_envi` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_venta`
--

CREATE TABLE `estado_venta` (
  `id_esta` int(5) NOT NULL,
  `desc_esta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_venta`
--

INSERT INTO `estado_venta` (`id_esta`, `desc_esta`) VALUES
(1, 'pendiente'),
(2, 'entregado'),
(3, 'devuelto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `id_form_pago` int(13) NOT NULL,
  `desc_form_pago` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `forma_pago`
--

INSERT INTO `forma_pago` (`id_form_pago`, `desc_form_pago`) VALUES
(1, 'Mercado Pago'),
(2, 'Mercado Pago'),
(3, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frutas`
--

CREATE TABLE `frutas` (
  `id` int(11) NOT NULL,
  `frutanombre` varchar(255) NOT NULL,
  `frutaprecio` int(11) NOT NULL,
  `frutaimg` varchar(255) NOT NULL,
  `frutastock` float(11,2) NOT NULL,
  `promo` tinyint(255) NOT NULL,
  `itemtipo` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `frutas`
--

INSERT INTO `frutas` (`id`, `frutanombre`, `frutaprecio`, `frutaimg`, `frutastock`, `promo`, `itemtipo`) VALUES
(2, 'manzana roja', 30, 'manzanaRoja.jpg', 0.00, 1, 'fruta'),
(3, 'pera', 35, 'pera.jpg', 3.00, 1, 'fruta'),
(5, 'uva', 50, 'uva.jpg', 8.00, 1, 'fruta'),
(6, 'palta', 80, 'palta.jpg', 9.00, 0, 'fruta'),
(7, 'naranja', 10, 'naranja.jpg', 15.00, 0, 'fruta'),
(8, 'pepino', 15, 'pepino.jpg', 10.00, 1, 'verdura'),
(9, 'cebolla', 25, 'cebolla.jpg', 20.00, 1, 'verdura'),
(10, 'cebolla colorada', 30, 'cebollaColorada.jpg', 12.00, 0, 'verdura'),
(11, 'frutilla', 50, 'frutilla.jpg', 12.00, 1, 'fruta'),
(12, 'durazno', 30, 'durazno.jpg', 0.00, 0, 'fruta'),
(13, 'coliflor', 40, 'coliflor.jpg', 5.00, 0, 'verdura'),
(14, 'manzana Verde', 30, 'manzanaVerde.jpg', 4.00, 1, 'fruta'),
(15, 'granada', 70, 'granada.jpg', 56.00, 0, 'fruta'),
(16, 'repollo colorado', 39, 'repolloColorado.jpg', 30.00, 0, 'verdura'),
(17, 'papa', 20, 'papa.jpg', 30.00, 0, 'verdura'),
(18, 'pimiento rojo', 20, 'pimientoRojo.jpg', 23.00, 0, 'verdura'),
(19, 'remolacha', 15, 'remolacha.jpg', 0.00, 0, 'verdura'),
(20, 'berenjena', 45, 'berenjena.jpg', 2.00, 1, 'verdura'),
(21, 'zanahoria', 26, 'zanahoria.jpg', 5.00, 1, 'verdura'),
(22, 'sandia', 3, 'sandia.jpg', 6.00, 1, 'fruta'),
(23, 'limon', 50, 'limon.jpg', 90.00, 0, 'fruta'),
(24, ' ajo', 4, 'ajo.jpg', 10.00, 1, 'verdura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id_loca` int(11) NOT NULL,
  `nomb_loca` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` int(15) NOT NULL,
  `email` varchar(35) NOT NULL,
  `password` varchar(35) CHARACTER SET utf8 NOT NULL,
  `tipo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `direccion`, `telefono`, `email`, `password`, `tipo`) VALUES
(21, 'guido', 'millares', 'sdfdf', 0, 'guido@hot.com', 'guido', 'admin'),
(22, 'fran', 'man', 'uiajjsd 7777', 61732715, 'fran@hot.com', 'fran', 'admin'),
(23, 'alda', 'marq', 'jaj ass2 33', 97969, 'oasodijas@asd', 'haha', 'usr'),
(24, 'undefined', 'undefined', 'undefined', 0, 'asdasd', 'asdd', 'usr'),
(25, 'undefined', 'undefined', 'undefined', 0, 'asdasd', 'adasdd', 'usr'),
(26, 'sdsdasd', 'asdasd', 'asdd', 0, 'asdasd', '12313123', 'usr'),
(27, 'asdasdsad', 'asdasd', 'asdsdad', 0, 'Chachiiii', '', 'usr'),
(28, 'aspjd', 'ojsaojdoij', 'dosaijd', 0, 'ojdaoisjd', 'dadjosad', 'usr'),
(29, 'aspjd', 'ojsaojdoij', 'dosaijd', 0, 'ojdaoisjd', '', 'usr'),
(30, 'gui', 'bu', 'undefined', 0, 'guibu', 'guibu', 'admin'),
(31, 'Guille', 'asdad', '43443', 34234, 'dfa@hot.com.ar', 'sdfdsfds', 'usr'),
(32, 'luis', 'suarez', 'juan lopez 23', 24234445, 'luis@hot.com', 'luis', 'usr'),
(33, 'Cilu', 'Lu', 'Across the universe ', 555555555, 'Cilu@mail.com', 'cilu', 'usr');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_vent` int(255) NOT NULL,
  `fech_vent` datetime NOT NULL,
  `id_clie` int(11) NOT NULL,
  `id_envi` int(11) NOT NULL,
  `id_form_pago` int(11) NOT NULL,
  `esta_vent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_vent`, `fech_vent`, `id_clie`, `id_envi`, `id_form_pago`, `esta_vent`) VALUES
(87, '2017-10-29 02:41:47', 22, 3, 2, '1'),
(88, '2017-10-29 02:43:37', 21, 3, 2, '1'),
(89, '2017-10-30 00:19:03', 21, 3, 2, '1'),
(90, '2017-10-30 00:34:49', 33, 3, 2, '1'),
(91, '2017-10-30 00:39:45', 33, 3, 2, '2'),
(92, '2017-10-30 00:58:14', 21, 3, 2, '1'),
(93, '2017-10-31 00:53:52', 22, 3, 2, '1'),
(94, '2017-10-31 01:29:55', 21, 3, 2, '1'),
(95, '2017-10-31 01:52:56', 21, 3, 2, '1'),
(96, '2017-10-31 02:06:44', 21, 3, 2, '3'),
(97, '2017-10-31 02:08:30', 21, 3, 2, '1'),
(98, '2017-10-31 02:09:13', 22, 1, 0, '1'),
(99, '2017-10-31 02:11:51', 22, 3, 0, '1'),
(100, '2017-10-31 02:14:30', 22, 1, 1, '2'),
(101, '2017-10-31 22:24:21', 21, 2, 2, '2'),
(102, '2017-10-31 22:49:22', 21, 1, 2, '3'),
(103, '2017-11-04 02:03:13', 22, 2, 1, '3'),
(104, '2017-11-06 03:17:35', 22, 1, 1, '1'),
(105, '2017-11-06 03:26:30', 32, 1, 1, '1'),
(106, '2017-11-06 03:28:48', 32, 1, 1, '1'),
(107, '2017-11-06 03:29:53', 32, 1, 2, '1'),
(108, '2017-11-06 03:31:23', 21, 1, 1, '1'),
(109, '2017-11-06 05:02:35', 22, 1, 1, '1'),
(110, '2017-11-06 23:00:29', 32, 1, 1, '1'),
(111, '2017-11-06 23:05:08', 32, 1, 1, '1'),
(112, '2017-11-06 23:18:30', 32, 1, 1, '1'),
(113, '2017-11-06 23:22:07', 21, 1, 1, '1'),
(114, '2017-11-06 23:23:49', 21, 1, 3, '1'),
(115, '2017-11-06 23:25:39', 22, 1, 1, '1'),
(116, '2017-11-06 23:26:42', 21, 3, 1, '1'),
(117, '2017-11-06 23:28:08', 21, 1, 1, '1'),
(118, '2017-11-06 23:29:14', 21, 1, 1, '1'),
(119, '2017-11-06 23:30:12', 21, 1, 1, '1'),
(120, '2017-11-06 23:31:42', 22, 1, 1, '1'),
(121, '2017-11-06 23:32:46', 22, 1, 1, '1'),
(122, '2017-11-06 23:34:18', 22, 1, 1, '1'),
(123, '2017-11-06 23:35:43', 22, 1, 1, '1'),
(124, '2017-11-06 23:36:51', 22, 1, 1, '1'),
(125, '2017-11-06 23:43:28', 22, 1, 1, '1'),
(126, '2017-11-07 22:32:42', 22, 1, 1, '1'),
(127, '2017-11-07 22:35:08', 22, 1, 1, '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_come`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_deta_vent`,`id_vent`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`id_envio`,`id_loca`);

--
-- Indices de la tabla `estado_venta`
--
ALTER TABLE `estado_venta`
  ADD PRIMARY KEY (`id_esta`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`id_form_pago`);

--
-- Indices de la tabla `frutas`
--
ALTER TABLE `frutas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id_loca`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_vent`,`id_clie`,`id_envi`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_come` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_deta_vent` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;
--
-- AUTO_INCREMENT de la tabla `estado_venta`
--
ALTER TABLE `estado_venta`
  MODIFY `id_esta` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  MODIFY `id_form_pago` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `frutas`
--
ALTER TABLE `frutas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_vent` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
