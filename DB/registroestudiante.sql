-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2025 a las 06:25:49
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
-- Base de datos: `registroestudiante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `matricula` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `contacto` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `nombre`, `matricula`, `direccion`, `contacto`, `foto`, `created_at`, `updated_at`) VALUES
(1, 'Mrs. Elody Klocko', 'MAT-5555', '742 Ward Route Suite 118\r\nHalieburgh, CO 01575', '706-952-8738', 'RxymkEF2Lr8KBwX0lSL9p2WVpE77qdFsWfLgDScr.png', '2025-07-24 06:49:47', '2025-07-24 07:05:15'),
(2, 'Theresia Heathcote', 'MAT-5749', '639 Block Junctions\nBrownchester, GA 64858', '+1-615-619-9495', 'https://via.placeholder.com/200x200.png/00dd99?text=people+Estudiante+id', '2025-07-24 06:49:47', '2025-07-24 06:49:47'),
(3, 'Rudy Prohaska III', 'MAT-6766', '45597 Huel Shoals Suite 916\nNorth Devantehaven, MT 44160-9741', '(323) 631-5039', 'https://via.placeholder.com/200x200.png/009900?text=people+Estudiante+enim', '2025-07-24 06:49:47', '2025-07-24 06:49:47'),
(4, 'Prof. Gayle Predovic', 'MAT-7096', '3476 Ned Underpass\nSouth Sigurdtown, NH 51658', '+1-726-408-8498', 'https://via.placeholder.com/200x200.png/0066aa?text=people+Estudiante+sit', '2025-07-24 06:49:47', '2025-07-24 06:49:47'),
(5, 'Barbara McKenzie', 'MAT-0373', '787 Gleichner Spurs\nIvorystad, DC 59687', '+1-608-372-9065', 'https://via.placeholder.com/200x200.png/00aaaa?text=people+Estudiante+voluptas', '2025-07-24 06:49:47', '2025-07-24 06:49:47'),
(6, 'Dr. Oleta Weissnat', 'MAT-7894', '59309 Audrey Ville\nEdwardoshire, MI 87658-9959', '(947) 542-1597', 'https://via.placeholder.com/200x200.png/007799?text=people+Estudiante+qui', '2025-07-24 06:49:47', '2025-07-24 06:49:47'),
(7, 'Lura Marks', 'MAT-7737', '43000 Adrien Village\nAndersonhaven, MS 12372', '+1-754-368-4577', 'https://via.placeholder.com/200x200.png/005500?text=people+Estudiante+sint', '2025-07-24 06:49:47', '2025-07-24 06:49:47'),
(8, 'Hertha Baumbach', 'MAT-4191', '98765 Oda Expressway\nShanehaven, OR 96781-0004', '(256) 436-7935', 'https://via.placeholder.com/200x200.png/00ff55?text=people+Estudiante+nihil', '2025-07-24 06:49:47', '2025-07-24 06:49:47'),
(9, 'Derrick Krajcik', 'MAT-2099', '974 Schmeler Spurs\nNorth Kaylinshire, WY 28630-3812', '507.955.5351', 'https://via.placeholder.com/200x200.png/000022?text=people+Estudiante+rem', '2025-07-24 06:49:47', '2025-07-24 06:49:47'),
(10, 'Theresa Shanahan', 'MAT-7189', '26897 Beatty Stravenue\nSouth Krystina, PA 95872', '765-400-1946', 'https://via.placeholder.com/200x200.png/00ddff?text=people+Estudiante+eaque', '2025-07-24 06:49:47', '2025-07-24 06:49:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_07_23_145805_create_estudiantes_table', 1),
(6, '2025_07_23_145813_create_usuarios_table', 1),
(7, '2025_07_23_145823_create_notas_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `estudiante_id` bigint(20) UNSIGNED NOT NULL,
  `matematicas_p1` double(8,2) DEFAULT NULL,
  `matematicas_p2` double(8,2) DEFAULT NULL,
  `lengua_p1` double(8,2) DEFAULT NULL,
  `lengua_p2` double(8,2) DEFAULT NULL,
  `ciencias_p1` double(8,2) DEFAULT NULL,
  `ciencias_p2` double(8,2) DEFAULT NULL,
  `sociales_p1` double(8,2) DEFAULT NULL,
  `sociales_p2` double(8,2) DEFAULT NULL,
  `ingles_p1` double(8,2) DEFAULT NULL,
  `ingles_p2` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `estudiante_id`, `matematicas_p1`, `matematicas_p2`, `lengua_p1`, `lengua_p2`, `ciencias_p1`, `ciencias_p2`, `sociales_p1`, `sociales_p2`, `ingles_p1`, `ingles_p2`, `created_at`, `updated_at`) VALUES
(1, 1, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, '2025-07-24 06:57:58', '2025-07-24 07:09:00'),
(2, 2, 2.00, 2.00, 8.00, 10.00, 7.00, 5.00, 9.00, 8.00, 7.00, 2.00, '2025-07-24 06:57:58', '2025-07-24 06:57:58'),
(3, 3, 9.00, 1.00, 0.00, 0.00, 4.00, 5.00, 9.00, 0.00, 3.00, 2.00, '2025-07-24 06:57:58', '2025-07-24 06:57:58'),
(4, 4, 3.00, 3.00, 3.00, 6.00, 6.00, 2.00, 6.00, 1.00, 6.00, 0.00, '2025-07-24 06:57:58', '2025-07-24 06:57:58'),
(5, 5, 7.00, 1.00, 0.00, 8.00, 5.00, 8.00, 1.00, 6.00, 8.00, 5.00, '2025-07-24 06:57:58', '2025-07-24 06:57:58'),
(6, 6, 6.00, 1.00, 5.00, 8.00, 3.00, 9.00, 9.00, 5.00, 10.00, 0.00, '2025-07-24 06:57:58', '2025-07-24 06:57:58'),
(7, 7, 2.00, 9.00, 10.00, 7.00, 1.00, 6.00, 0.00, 3.00, 2.00, 5.00, '2025-07-24 06:57:58', '2025-07-24 06:57:58'),
(8, 8, 9.00, 3.00, 10.00, 9.00, 8.00, 4.00, 6.00, 8.00, 3.00, 6.00, '2025-07-24 06:57:58', '2025-07-24 06:57:58'),
(9, 9, 9.00, 1.00, 4.00, 8.00, 2.00, 6.00, 6.00, 9.00, 0.00, 4.00, '2025-07-24 06:57:58', '2025-07-24 06:57:58'),
(10, 10, 1.00, 7.00, 9.00, 0.00, 0.00, 2.00, 6.00, 0.00, 8.00, 6.00, '2025-07-24 06:57:58', '2025-07-24 06:57:58'),
(11, 1, 6.00, 9.00, 6.00, 3.00, 2.00, 0.00, 7.00, 5.00, 0.00, 9.00, '2025-07-24 06:59:07', '2025-07-24 06:59:07'),
(12, 2, 9.00, 0.00, 6.00, 9.00, 1.00, 6.00, 2.00, 1.00, 1.00, 7.00, '2025-07-24 06:59:07', '2025-07-24 06:59:07'),
(13, 3, 3.00, 8.00, 10.00, 8.00, 8.00, 10.00, 9.00, 3.00, 4.00, 0.00, '2025-07-24 06:59:07', '2025-07-24 06:59:07'),
(14, 4, 7.00, 2.00, 6.00, 0.00, 6.00, 6.00, 5.00, 3.00, 2.00, 4.00, '2025-07-24 06:59:07', '2025-07-24 06:59:07'),
(15, 5, 4.00, 6.00, 9.00, 7.00, 4.00, 6.00, 9.00, 0.00, 6.00, 4.00, '2025-07-24 06:59:07', '2025-07-24 06:59:07'),
(16, 6, 2.00, 4.00, 7.00, 2.00, 4.00, 0.00, 3.00, 4.00, 0.00, 0.00, '2025-07-24 06:59:07', '2025-07-24 06:59:07'),
(17, 7, 5.00, 0.00, 2.00, 10.00, 2.00, 5.00, 3.00, 7.00, 7.00, 9.00, '2025-07-24 06:59:07', '2025-07-24 06:59:07'),
(18, 8, 4.00, 0.00, 7.00, 8.00, 10.00, 7.00, 0.00, 6.00, 9.00, 9.00, '2025-07-24 06:59:07', '2025-07-24 06:59:07'),
(19, 9, 2.00, 8.00, 9.00, 2.00, 2.00, 9.00, 5.00, 0.00, 9.00, 4.00, '2025-07-24 06:59:07', '2025-07-24 06:59:07'),
(20, 10, 8.00, 7.00, 2.00, 1.00, 1.00, 7.00, 3.00, 10.00, 4.00, 3.00, '2025-07-24 06:59:07', '2025-07-24 06:59:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(255) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `telefono`, `direccion`, `foto`, `password`, `rol`, `created_at`, `updated_at`) VALUES
(2, 'Admin', 'Principal', 'admin@admin.com', '0999999999', 'Principal 123', '84qzTHbDK31QJ3HYwAjidIrYBKMQDNkuWMNN9WYA.png', '$2y$10$daylPFzsMmnsLUQnp92cOOSDQJoRFe3SfqGX4DEO1eZiArRg8LJ5O', 'admin', '2025-07-24 08:29:36', '2025-07-24 09:01:13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `estudiantes_matricula_unique` (`matricula`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notas_estudiante_id_foreign` (`estudiante_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarios_correo_unique` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_estudiante_id_foreign` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
