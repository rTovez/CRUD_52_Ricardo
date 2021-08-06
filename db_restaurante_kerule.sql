-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2021 a las 22:26:59
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_restaurante_kerule`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `APELLIDO` varchar(100) NOT NULL,
  `TELEFONO` int(20) NOT NULL,
  `DIRECCION` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_credito`
--

CREATE TABLE `tbl_credito` (
  `ID_TARJETA` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `NUMERO` varchar(50) NOT NULL,
  `FECHA` varchar(5) NOT NULL,
  `CODIGO` int(3) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `ID_MENU` int(11) NOT NULL,
  `COMIDA` varchar(100) NOT NULL,
  `BEBIDA` varchar(100) NOT NULL,
  `CANTIDAD` int(20) NOT NULL,
  `PRECIO` double NOT NULL,
  `SUBTOTAL` double NOT NULL,
  `IMPUESTO` double NOT NULL,
  `TOTAL` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_menu`
--

INSERT INTO `tbl_menu` (`ID_MENU`, `COMIDA`, `BEBIDA`, `CANTIDAD`, `PRECIO`, `SUBTOTAL`, `IMPUESTO`, `TOTAL`) VALUES
(11, 'Pescado Frito con Tajadas', 'Fresco Tamarindo', 3, 200, 600, 90, 690),
(12, 'Carne Asada con Tajadas', 'Fresco Tamarindo', 2, 100, 200, 30, 230),
(13, 'Carne Asada con Tajadas', 'Fresco Tamarindo', 3, 100, 300, 45, 345),
(14, 'Ensalada KeRule', 'Limonada', 2, 170, 340, 51, 391),
(15, 'Baleadas', 'Jamaica', 7, 20, 140, 21, 161),
(16, 'Pescado Frito con Tajadas', 'Fresco de Nance', 3, 200, 600, 90, 690);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indices de la tabla `tbl_credito`
--
ALTER TABLE `tbl_credito`
  ADD PRIMARY KEY (`ID_TARJETA`),
  ADD KEY `FK_CLIENTES_CREDITO` (`ID_CLIENTE`);

--
-- Indices de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`ID_MENU`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tbl_credito`
--
ALTER TABLE `tbl_credito`
  MODIFY `ID_TARJETA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `ID_MENU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_credito`
--
ALTER TABLE `tbl_credito`
  ADD CONSTRAINT `FK_CLIENTES_CREDITO` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `tbl_clientes` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
