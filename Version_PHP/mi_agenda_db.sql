-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2019 a las 03:50:10
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mi_agenda_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` int(100) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `fecha_inicio` varchar(20) NOT NULL,
  `fecha_fin` varchar(20) NOT NULL DEFAULT 'NULL',
  `hora_inicio` varchar(20) NOT NULL DEFAULT 'NULL',
  `hora_fin` varchar(20) NOT NULL DEFAULT 'NULL',
  `todo_dia` tinyint(1) NOT NULL,
  `fk_usuarios` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `titulo`, `fecha_inicio`, `fecha_fin`, `hora_inicio`, `hora_fin`, `todo_dia`, `fk_usuarios`) VALUES
(1, 'Ir al gym', '2019-10-30', '2019-10-30', '07:00', '09:30', 0, 'joelvergara@gmail.com'),
(2, 'Curso de guitarra', '2019-10-31', '', '', '', 0, 'joelvergara@gmail.com'),
(3, 'Exposicion de Ciencias', '2019-10-28', '2019-10-28', '19:00', '21:00', 0, 'joelvergara@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `email` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`email`, `nombre`, `password`, `fecha_nacimiento`) VALUES
('joelvergara@gmail.com', 'Joel Vergara', '$2y$10$aGKPdM/cxJm9659CFoSBTOpPMVuNRbU3jNGl6nyc3C7KCsYtHA6bW', '1988-09-21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuarios` (`fk_usuarios`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_usuarioemail_evento` FOREIGN KEY (`fk_usuarios`) REFERENCES `usuarios` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
