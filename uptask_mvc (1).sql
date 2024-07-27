-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2024 a las 19:58:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `uptask_mvc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL,
  `proyecto` varchar(60) DEFAULT NULL,
  `url` varchar(64) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `propietarioId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `proyecto`, `url`, `fecha`, `propietarioId`) VALUES
(1, 'UpTask', '9a8cc665cecc597a2df46f10b9479672', '2021-11-06', NULL),
(2, 'Tienda Virtual', 'bc79d1d2515d9f3b5c808590dd78fb67', '2021-11-08', NULL),
(3, 'HRMS en Odoo', '06afb76b24603ae4d8297f3e81bd0c01', '2021-11-08', NULL),
(4, 'WebSite AppSalon', 'c8577816d2122d182135c1d933dc4ea6', '2021-11-09', NULL),
(5, 'Programas', '07d4d0dd248fa6b75c3010bcb43b9c98', '2021-11-09', NULL),
(6, 'avance de topologia cisco vlan', '03b7a282e0479d4ad3ab617bcc8e0dc3', '2024-07-27', 16),
(7, 'avance de topologia cisco vlan', 'b889079221027d5234e536f804366f4c', '2024-07-27', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `proyectoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `nombre`, `estado`, `proyectoId`) VALUES
(1, 'Configurar Cuenta PayPal', 0, 2),
(2, 'Investigar un Hosting Apropiado', 1, 2),
(3, 'Configurar Cuenta Stripe', 0, 2),
(4, 'Crear un API', 1, 1),
(5, 'Crear modelo de Tareas', 1, 1),
(6, 'Crear barra de progreso en proyectos', 0, 1),
(7, 'Generar catalogo de productos', 0, 2),
(9, 'Consultar los requerimientos del cliente', 0, 3),
(10, 'Elegir la version de Odoo a utilizar', 0, 3),
(11, 'Seleccionar un VPS adecuado al proyecto', 0, 3),
(12, 'Desplegar Servidor de Desarrollo', 0, 3),
(13, 'Buscar un tema de WooComerce', 0, 2),
(15, 'Mostrar tareas en el proyecto', 1, 1),
(16, 'Crear el modelo de Proyectos', 1, 1),
(17, 'Añadir Virtual DOM al crear una Tarea', 1, 1),
(22, 'Descargar Architectural en Español', 0, 5),
(23, 'Descargar Revit 2019', 0, 5),
(29, 'Añadir botones para cambiar de estado', 1, 1),
(31, 'crear topologia', 0, 6),
(33, 'configurar router 0', 0, 6),
(34, 'configurar router 0', 0, 6),
(35, 'configurar router 0', 0, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `token` varchar(64) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `token`, `confirmado`) VALUES
(16, 'isaac', 'isaaccash00@gmail.com', '$2y$10$ao/.nNJ/.QU2IZffMnR8VOcdIHL8b8JpOhyoUQPIIrw5qPm7UqNTS', '', 1),
(17, 'daniel', 'dani.el@hotmail.com', '$2y$10$rP7Y9x/SBP0Tp6WxXPLaGeNN88gSE7.6ICmJwvCCaYDaaXeDpfSLK', '', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_idx` (`propietarioId`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proyectoId_idx` (`proyectoId`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `usuarios` FOREIGN KEY (`propietarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `proyectoId` FOREIGN KEY (`proyectoId`) REFERENCES `proyectos` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
