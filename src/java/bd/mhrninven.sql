-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2015 a las 03:52:50
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mhrninven`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
`IdCate` int(10) unsigned NOT NULL,
  `NomCat` varchar(255) DEFAULT NULL,
  `EstCat` varchar(1) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`IdCate`, `NomCat`, `EstCat`) VALUES
(1, 'a', 'B'),
(2, 'aretes', 'A'),
(3, 'brazaletes', 'A'),
(4, 'Gargantillas', 'A'),
(5, 'pulseras', 'A'),
(6, 'aretess', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
`IdCom` bigint(20) unsigned NOT NULL,
  `producto_IdProd` bigint(20) unsigned NOT NULL,
  `persona_NumEmp` int(10) unsigned NOT NULL,
  `FecCom` datetime DEFAULT NULL,
  `ForPag` varchar(45) DEFAULT NULL,
  `PreProd` int(11) DEFAULT NULL,
  `PreCom` int(11) DEFAULT NULL,
  `CanCom` int(11) DEFAULT NULL,
  `venta_IdVenta` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE IF NOT EXISTS `descuento` (
`IdDesc` bigint(20) unsigned NOT NULL,
  `DesUno` tinyint(3) unsigned DEFAULT NULL,
  `DesDos` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `descuento`
--

INSERT INTO `descuento` (`IdDesc`, `DesUno`, `DesDos`) VALUES
(1, 10, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE IF NOT EXISTS `direccion` (
`IdDire` bigint(20) unsigned NOT NULL,
  `DirCal` varchar(255) DEFAULT NULL,
  `DirCol` varchar(255) DEFAULT NULL,
  `DirMun` varchar(255) DEFAULT NULL,
  `DirEst` varchar(255) DEFAULT NULL,
  `DirPai` varchar(255) DEFAULT NULL,
  `CodPos` mediumint(8) unsigned DEFAULT NULL,
  `RefDat` varchar(255) DEFAULT NULL,
  `persona_NumEmp` int(10) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`IdDire`, `DirCal`, `DirCol`, `DirMun`, `DirEst`, `DirPai`, `CodPos`, `RefDat`, `persona_NumEmp`) VALUES
(1, 'Pino de Jerez 135', 'Jardines de Jerez Primera Sección', 'León', 'Guanajuato', 'México', 37200, 'Entre Calle Chopo y Calle Paseo de la Liebres', 1),
(2, 'Oceano Índico 2340', 'San Isidro', 'León', 'Guanajuato', 'México', 37150, 'Cerca del Blvd. Torres Landa', 2),
(3, '5 de mayo 456', 'Centro', 'Silao', 'Guanajuato', 'México', 37890, 'Referencia para llegar', 3),
(4, 'Pedro Moreno 850', 'Revolucion', 'Querétaro', 'Querétaro', 'México', 39456, 'Referencia para llegar', 4),
(5, 'Paseo de la Reforma 2420', 'Lomas Altas', 'Miguel Hidalgo', 'D.F.', 'México', 11950, 'Referencia para llegar', 5),
(6, 'Pino #135', 'Jardines de Jerez', 'Leon', 'Guanajuato', NULL, 35367, 'poiuyhgrf', 6),
(7, 'ewdfgfgdsfsd', 'fgfggffgsdgf', 'Leon', 'Guanajuato', NULL, 324, 'sadfgh', 7),
(8, 'ewfrthy', 'tttttttttyty', 'Leon', 'Aguascalientes', NULL, 16777215, 'bgffbfvcv', 8),
(9, 'Mar Oceanico #2003', 'Los Fresnos', 'LeÃ³n', 'Guanajuato', NULL, 35367, 'Entre calle hola y adios', 9),
(10, 'Pio V #234', 'San Sebastián', 'León', 'Guanajuato', NULL, 34789, 'Entre calle Pio VI y Pio IV', 10),
(11, 'a 1', 'b', 'León', 'Guanajuato', 'México', 324, 'Esquina con calles a y b', 11),
(12, 'dasasdsadsad', 'adsdsasdadsads', 'adsasddssd', 'Campeche', 'Mexico', 0, 'dsdsaddsadas', 12),
(13, 'test', 'test', 'test', 'Aguascalientes', 'Mexico', 0, 'fdfff', 13),
(14, 'd', 'e', 'g', 'Guanajuato', 'Mexico', 0, 'p', 14),
(15, '', '', 'leon', 'Guanajuato', NULL, 0, '', 15),
(16, '', '', 'León', 'Guanajuato', NULL, 0, '', 16),
(17, 'lijil', 'ijlij', 'jkjk', 'Baja California Nte', 'Mexico', 0, 'utyt', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inicio`
--

CREATE TABLE IF NOT EXISTS `inicio` (
  `IdInicio` int(10) unsigned NOT NULL,
  `TextIni` varchar(4095) DEFAULT NULL,
  `VidIni` varchar(255) DEFAULT '#'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inicio`
--

INSERT INTO `inicio` (`IdInicio`, `TextIni`, `VidIni`) VALUES
(1, 'En MAHARANEE sabemos cï¿½mo te sientes, tambiï¿½n nos hemos sentido asï¿½, conocemos tus necesidades econï¿½micas y el sufrimiento por no tener dinero. Si no confï¿½an en ti, nosotros si. MAHARANEE ha salvado vidas, somos una empresa dedicada a la venta de accesorios para la mujer, nosotros te enseï¿½amos a crear tu propio negocio, sin un jefe y sin horarios fijos. Si necesitas ayuda para salir de tus problemas econï¿½micos nosotros somos tu soluciï¿½n. Bienvenido a MAHARANEE.', '_zn5oRs5h18'),
(2, 'En MAHARANEE sabemos cï¿½mo te sientes, tambiï¿½n nos hemos sentido asï¿½, conocemos tus necesidades econï¿½micas y el sufrimiento por no tener dinero. Si no confï¿½an en ti, nosotros si. MAHARANEE ha salvado vidas, somos una empresa dedicada a la venta de accesorios para la mujer, nosotros te enseï¿½amos a crear tu propio negocio, sin un jefe y sin horarios fijos. Si necesitas ayuda para salir de tus problemas econï¿½micos nosotros somos tu soluciï¿½n. Bienvenido a MAHARANEE.', 'RaqJyJ5lmHM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
`NumEmp` int(10) unsigned NOT NULL,
  `NomPer` varchar(255) DEFAULT NULL,
  `ApePat` varchar(255) DEFAULT NULL,
  `ApeMat` varchar(255) DEFAULT NULL,
  `DirCal` varchar(255) DEFAULT NULL,
  `DirCol` varchar(255) DEFAULT NULL,
  `DirMun` varchar(255) DEFAULT NULL,
  `DirEst` varchar(255) DEFAULT NULL,
  `DirPai` varchar(255) DEFAULT 'Mexico',
  `CodPos` mediumint(8) unsigned DEFAULT NULL,
  `TelFij` varchar(45) DEFAULT NULL,
  `TelCel` varchar(45) DEFAULT NULL,
  `CorEle` varchar(255) DEFAULT NULL,
  `FecNac` date DEFAULT NULL,
  `RfcHom` varchar(45) DEFAULT NULL,
  `SexDat` varchar(1) DEFAULT NULL,
  `FecIni` datetime DEFAULT NULL,
  `UsuPer` varchar(45) NOT NULL,
  `ConPas` varchar(45) NOT NULL,
  `EstPer` varchar(1) NOT NULL,
  `TipPer` varchar(1) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`NumEmp`, `NomPer`, `ApePat`, `ApeMat`, `DirCal`, `DirCol`, `DirMun`, `DirEst`, `DirPai`, `CodPos`, `TelFij`, `TelCel`, `CorEle`, `FecNac`, `RfcHom`, `SexDat`, `FecIni`, `UsuPer`, `ConPas`, `EstPer`, `TipPer`) VALUES
(1, 'Pedro León', 'Cruz', 'Parada', 'Pino #135', 'Jardines de Jerez', 'León', 'Guanajuato', 'Mexico', 37536, '7112080', '7849049', 'pcruz_93@hotmail.com', '1993-01-20', 'NA', 'M', '2014-08-20 21:04:38', 'pcruz93', 'ZKKW', 'A', 'A'),
(2, 'Julio Cesar', 'Rizo', 'Hernández', 'Topografos #215', 'Panorama', 'León', 'Guanajuato', 'Mexico', 37160, '524772291976', '524772291976', 'direccion@maharanee.com.mx', '1972-09-26', 'admin', 'M', '2014-08-20 21:13:07', 'admin', 'admin', 'A', 'A'),
(3, 'JULIO', 'RIZO', 'HERNANDEZ', 'TOPOGRAFOS  215', 'PANORAMA', 'LEON', 'Guanajuato', 'Mexico', 37160, '524772291976', '524772291976', 'direccion@maharanee.com.mx', '1972-09-26', 'RIHJ720926', 'M', '2014-08-20 21:31:24', 'jose', '123', 'A', 'U'),
(4, 'Gabriela', 'Alcazar', 'Ferriz', 'Pedro Moreno ,850', 'Revolucion', 'Querétaro', 'Querétaro', 'México', 39456, '4341029384', '4345656565', '92gabyAL@hotmail.com', '1993-11-12', 'ZXCV022045789', 'F', '2014-07-11 19:01:53', '92Gaby', '92199311', 'A', 'A'),
(5, 'Julio', 'Ramírez', 'De Cruz', 'Paseo de la Reforma 2420', 'Lomas Altas', 'Miguel Hidalgo', 'D.F.', 'México', 11950, '5555180003', '5555291114', 'jrdc@maharanee.com', '1970-04-18', 'ASDF133156890', 'M', '2014-07-11 19:04:39', 'Juli0418', '0418JU110', 'A', 'A'),
(6, 'Pedro', 'Cruz', 'Parada', 'Pino #135', 'Jardines de Jerez', 'Leon', 'Guanajuato', 'Mexico', 35367, '1234567', '4771234567', 'pcruz93@outlook.com', '0000-00-00', '12345678901234567890', 'M', NULL, 'pcruz93', '123', 'A', 'U'),
(7, 'José', 'Maria', 'Maria', 'ewdfgfgdsfsd', 'fgfggffgsdgf', 'Leon', 'Guanajuato', 'Mexico', 324, '5434545454', '545434354545443', 'dsdsdsffd@outlook.com', '1993-01-01', '44567876543438675432', 'M', NULL, 'chema', 'kpWb', 'A', 'U'),
(8, 'Rogelio', 'Sanchez', 'Sanchez', 'ewfrthy', 'tttttttttyty', 'Leon', 'Aguascalientes', 'Mexico', 16777215, '455454', '', 'hghf@fdfdbv', '1993-01-01', '32e2e3eewew', 'M', NULL, 'admin', 'z8XR1tc=', 'A', 'A'),
(9, 'Oscar', 'Ramirez', 'Hernandez', 'Mar Oceanico #2003', 'Los Fresnos', 'LeÃ³n', 'Guanajuato', 'Mexico', 35367, '71111111111111', '111111111111111111', 'hola@gmail.com', '0000-00-00', 'CUPP930120F54 ', 'M', NULL, 'holahola', 'ydfbzcnX280=', 'A', 'U'),
(10, 'José', 'Mendoza', 'Ramírez', 'Pio V #234', 'San Sebastián', 'León', 'Guanajuato', 'Mexico', 34789, '7123456', '4777123456', 'jose@gmail.com', '1993-01-01', 'CUPP930120F54', 'M', NULL, 'jose123', 'ZJyi', 'A', 'U'),
(11, 'x', 'y', 'z', 'a 1', 'b', 'León', 'Guanajuato', 'Mexico', 324, '3443423432', '3333333333333333', '111@111.com', '1993-01-01', 'CUPP901021F12', 'F', '2014-07-31 18:58:47', 'pruebaxyz', 'q6Kl', 'A', 'U'),
(12, 'sasdas', 'adsadsdsdas', 'adsadsdsdas', 'dasasdsadsad', 'adsdsasdadsads', 'adsasddssd', 'Campeche', 'Mexico', 10000, 'dsaadsdasdas', 'dasadsadsdasads', 'dasdaadsads@dsdsds.com', '0000-00-00', '1234567890', 'M', '2014-07-31 20:03:47', 'a', 'kpOU', 'A', 'U'),
(13, 'test', 'test', 'test', 'test', 'test', 'test', 'Aguascalientes', 'Mexico', 0, 'test', 'zxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'test@gha.com', '1993-01-01', '', 'F', '2014-08-07 20:14:24', 'test', '6NnY5w==', 'A', 'U'),
(14, 'a', 'b', 'b', 'd', 'e', 'g', 'Guanajuato', 'Mexico', 0, 'i', 'j', 'h@gmail.com', '0000-00-00', 'm', 'M', '2014-08-27 15:52:46', 'n', 'n6Ch', 'A', 'U'),
(15, 'jose', 'ramon', 'arellano', '', '', 'leon', 'Guanajuato', 'Mexico', 0, '', '4778899999', 'jose@live.com.mx', '0000-00-00', '', '', NULL, 'joseramon', '123', 'A', 'U'),
(16, 'Victoria', 'Díaz', 'García', '', '', 'León', 'Guanajuato', 'Mexico', 0, '', '4771153991', 'sofiadiaz_trabajos@hotmail.com', '0000-00-00', '', '', NULL, 'victoria', '123', 'A', 'U'),
(17, 'jlio', 'ju', 'hihi', 'lijil', 'ijlij', 'jkjk', 'Baja California Nte', 'Mexico', 0, '86666', '5757575', 'Ramon@hotmial.com', '2015-11-26', 'gfgfg5', 'M', '2015-11-03 11:06:03', 'ramon123', 'ZKSU', 'A', 'U');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
`IdProd` bigint(20) unsigned NOT NULL,
  `ImaGra` varchar(255) DEFAULT NULL,
  `ImaUno` varchar(255) DEFAULT NULL,
  `ImaDos` varchar(255) DEFAULT NULL,
  `ImaCaj` varchar(255) DEFAULT NULL,
  `VidPro` varchar(255) DEFAULT '#',
  `NomPro` varchar(45) DEFAULT NULL,
  `CodPro` varchar(45) DEFAULT NULL,
  `CarPro` varchar(45) DEFAULT NULL,
  `MedPro` varchar(45) DEFAULT NULL,
  `PiePro` int(11) DEFAULT '0',
  `PreVen` int(11) DEFAULT NULL,
  `OfePro` tinyint(3) unsigned DEFAULT NULL,
  `EstPro` varchar(45) DEFAULT NULL,
  `categoria_IdCate` int(10) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`IdProd`, `ImaGra`, `ImaUno`, `ImaDos`, `ImaCaj`, `VidPro`, `NomPro`, `CodPro`, `CarPro`, `MedPro`, `PiePro`, `PreVen`, `OfePro`, `EstPro`, `categoria_IdCate`) VALUES
(1, 'ARETE_GOTA_GRANDE.jpg', 'ARETE_GOTA_GRANDE_1.jpg', 'ARETE_GOTA_GRANDE_2.jpg', 'IMG_0007.JPG', '#', 'ARETE_GOTA_GRANDE', '3456789', '$es blanco', '54 x45', 5, 1234, 0, 'A', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
`IdVenta` bigint(20) unsigned NOT NULL,
  `SubVen` int(11) DEFAULT NULL,
  `DesVen` tinyint(4) DEFAULT NULL,
  `TotVen` int(11) DEFAULT NULL,
  `PerVen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
 ADD PRIMARY KEY (`IdCate`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
 ADD PRIMARY KEY (`IdCom`), ADD UNIQUE KEY `IdCompra_UNIQUE` (`IdCom`), ADD KEY `fk_persona_has_producto_producto1_idx` (`producto_IdProd`), ADD KEY `fk_persona_has_producto_persona1_idx` (`persona_NumEmp`), ADD KEY `fk_compra_venta1_idx` (`venta_IdVenta`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
 ADD PRIMARY KEY (`IdDesc`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
 ADD PRIMARY KEY (`IdDire`), ADD KEY `fk_direccion_persona_idx` (`persona_NumEmp`);

--
-- Indices de la tabla `inicio`
--
ALTER TABLE `inicio`
 ADD PRIMARY KEY (`IdInicio`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
 ADD PRIMARY KEY (`NumEmp`), ADD UNIQUE KEY `NumEmp_UNIQUE` (`NumEmp`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
 ADD PRIMARY KEY (`IdProd`), ADD KEY `fk_producto_categoria1_idx` (`categoria_IdCate`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
 ADD PRIMARY KEY (`IdVenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
MODIFY `IdCate` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
MODIFY `IdCom` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `descuento`
--
ALTER TABLE `descuento`
MODIFY `IdDesc` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
MODIFY `IdDire` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
MODIFY `NumEmp` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
MODIFY `IdProd` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
MODIFY `IdVenta` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
ADD CONSTRAINT `fk_compra_venta1` FOREIGN KEY (`venta_IdVenta`) REFERENCES `venta` (`IdVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_persona_has_producto_persona1` FOREIGN KEY (`persona_NumEmp`) REFERENCES `persona` (`NumEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_persona_has_producto_producto1` FOREIGN KEY (`producto_IdProd`) REFERENCES `producto` (`IdProd`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
ADD CONSTRAINT `fk_direccion_persona` FOREIGN KEY (`persona_NumEmp`) REFERENCES `persona` (`NumEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
ADD CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`categoria_IdCate`) REFERENCES `categoria` (`IdCate`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
