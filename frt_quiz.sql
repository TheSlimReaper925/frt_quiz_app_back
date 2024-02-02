-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2024 at 06:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `frt_quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `answer` text NOT NULL,
  `is_correct` blob NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `answer`, `is_correct`, `created_at`, `updated_at`) VALUES
(1, 8, 'John F. Kennedy', 0x30, '2024-02-01 13:26:49', '2024-02-01 13:26:49'),
(2, 8, 'Franklin D. Roosevelt', 0x31, '2024-02-01 13:26:49', '2024-02-01 13:26:49'),
(3, 8, 'Winston Churchill', 0x30, '2024-02-01 13:26:49', '2024-02-01 13:26:49'),
(4, 12, 'Moses', 0x31, '2024-02-02 13:01:43', '2024-02-02 13:01:43'),
(5, 12, 'Abraham', 0x30, '2024-02-02 13:01:43', '2024-02-02 13:01:43'),
(6, 12, 'Paul', 0x30, '2024-02-02 13:01:43', '2024-02-02 13:01:43');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_29_163706_create_questions_table', 1),
(6, '2024_01_29_163850_create_answers_table', 1),
(7, '2024_02_02_102135_create_quiz_responses_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'myApp', '995343399ad9e56b82905559e8b1d3dd4c32a4c5bdcf8a8a88b32905750c6422', '[\"*\"]', NULL, '2024-01-29 15:35:10', '2024-01-29 15:35:10'),
(2, 'App\\Models\\User', 1, 'myApp', '893d9f5e2b091e44d754a457b5b45450d9c00f8a461b87e6317ffe26bc5c5edb', '[\"*\"]', NULL, '2024-01-29 15:48:10', '2024-01-29 15:48:10'),
(3, 'App\\Models\\User', 1, 'admin@admin.com', '3b8371a83aae7545555e4db957113954068e1d4a911db3d01d9686eb6d51863c', '[\"*\"]', NULL, '2024-01-29 15:49:38', '2024-01-29 15:49:38'),
(4, 'App\\Models\\User', 1, 'admin@admin.com', '79ac2cc694cbc77303040e42d8963a33e15e991935d0ae42d56c4b214d55683c', '[\"*\"]', NULL, '2024-01-29 15:53:36', '2024-01-29 15:53:36'),
(5, 'App\\Models\\User', 1, 'admin@admin.com', '48f7235a373bf931c5e98998cbadbb4d6407775ab323bb9e485d1e9f4cf5445c', '[\"*\"]', NULL, '2024-01-29 16:09:51', '2024-01-29 16:09:51'),
(6, 'App\\Models\\User', 1, 'admin@admin.com', '7a2286fd541673b8c6ba87da9bdb1edeb652a24f7ba7ddf7b7a5979f8f19481b', '[\"*\"]', NULL, '2024-01-29 16:13:46', '2024-01-29 16:13:46'),
(7, 'App\\Models\\User', 1, 'admin@admin.com', '19febc496c7dc4b4d445dfe40b752cbeb560c40bbcd734827821b56102179262', '[\"*\"]', NULL, '2024-01-29 16:13:59', '2024-01-29 16:13:59'),
(8, 'App\\Models\\User', 1, 'admin@admin.com', 'cbbee69a324330218f1d419b3d357f84e72d2f9e0830b44dec65483677132db8', '[\"*\"]', '2024-01-29 16:19:18', '2024-01-29 16:19:12', '2024-01-29 16:19:18'),
(9, 'App\\Models\\User', 1, 'admin@admin.com', '8b924c8324a1a2964ef98fc9d3525834639bf71f61de92a1e20457b464518c6f', '[\"*\"]', '2024-01-29 16:21:21', '2024-01-29 16:21:14', '2024-01-29 16:21:21'),
(10, 'App\\Models\\User', 1, 'admin@admin.com', 'f53b069daad7f8081bc1e4bab467046e5eb5dddcee514baa56fc42317381dcb1', '[\"*\"]', '2024-01-29 16:21:56', '2024-01-29 16:21:54', '2024-01-29 16:21:56'),
(11, 'App\\Models\\User', 1, 'admin@admin.com', '9283fd0fedb4eb23cbe13b75aee0eba90e792dafe9f57f5e5d253a8b595e74ae', '[\"*\"]', NULL, '2024-01-30 12:41:24', '2024-01-30 12:41:24'),
(12, 'App\\Models\\User', 1, 'admin@admin.com', 'de54e4ff25b2799270ff6a666a8b068d5720e3d4ac94ffd3b5dd6c5610a88d25', '[\"*\"]', '2024-01-30 13:51:38', '2024-01-30 13:38:25', '2024-01-30 13:51:38'),
(13, 'App\\Models\\User', 1, 'admin@admin.com', 'd07080e806507a8397900398bbc369f3853187072509cf0c765e9aa8cdd4bd98', '[\"*\"]', '2024-01-30 14:27:23', '2024-01-30 14:09:48', '2024-01-30 14:27:23'),
(14, 'App\\Models\\User', 1, 'admin@admin.com', '2f498719776746349f86eb6397ed6c10e39645793b8b242a144b3f474706ba48', '[\"*\"]', '2024-01-30 14:28:50', '2024-01-30 14:27:41', '2024-01-30 14:28:50'),
(15, 'App\\Models\\User', 1, 'admin@admin.com', 'd0c20321c7a6f4a3644add51fdc5a2a652cdfb4acae00853262c9a2431d7a368', '[\"*\"]', '2024-01-30 14:40:26', '2024-01-30 14:30:24', '2024-01-30 14:40:26'),
(16, 'App\\Models\\User', 1, 'admin@admin.com', 'e453442a5c32fd2450c934f1e37fdb5d63f13d6f27cb357e3c169b42c130dfad', '[\"*\"]', '2024-01-30 15:20:00', '2024-01-30 14:42:15', '2024-01-30 15:20:00'),
(17, 'App\\Models\\User', 1, 'admin@admin.com', '5db92087bb4c4c5fb16229de8beaf7e828569dd78298fa8a033e4ccd49c218ba', '[\"*\"]', '2024-01-31 13:09:28', '2024-01-31 12:41:35', '2024-01-31 13:09:28'),
(18, 'App\\Models\\User', 1, 'admin@admin.com', '15eb50299bc29a3de9dbf4ce8955a7302b01aed7864d5ed640721dc0ec004ad5', '[\"*\"]', '2024-01-31 13:34:06', '2024-01-31 13:10:41', '2024-01-31 13:34:06'),
(19, 'App\\Models\\User', 1, 'admin@admin.com', 'eeeefc1b34cdcd7be3ffb14387d784dfde477235e3e1002ff93633bccb8dc850', '[\"*\"]', '2024-01-31 13:43:26', '2024-01-31 13:37:41', '2024-01-31 13:43:26'),
(20, 'App\\Models\\User', 1, 'admin@admin.com', 'a61068f3b9d394ea3f010fc095773bdf612d5756564953e93d577db3a6587721', '[\"*\"]', NULL, '2024-01-31 13:47:31', '2024-01-31 13:47:31'),
(21, 'App\\Models\\User', 1, 'admin@admin.com', 'fb8eabee912169c11f94c6772c676ed7c0c073016bcc7b046efff3ce5292a5be', '[\"*\"]', '2024-02-01 13:15:43', '2024-01-31 13:48:45', '2024-02-01 13:15:43'),
(22, 'App\\Models\\User', 1, 'admin@admin.com', 'ce51562627c8b71997a9332caeb20151286ae5ebd6f9a773609e5d0a233e52fd', '[\"*\"]', '2024-02-02 13:08:18', '2024-02-01 13:22:36', '2024-02-02 13:08:18');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `type` enum('binary','multipleChoice') NOT NULL,
  `correct_answer` tinyint(1) DEFAULT NULL COMMENT '1/0 if type is binary, otherwise null',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `type`, `correct_answer`, `created_at`, `updated_at`) VALUES
(1, 'Did Mahatma Gandhi say, \"Be the change that you wish to see in the world\"?', 'binary', 1, '2024-02-01 13:11:41', '2024-02-01 13:11:41'),
(8, 'Who said, \"The only thing we have to fear is fear itself\"?', 'multipleChoice', NULL, '2024-02-01 13:26:49', '2024-02-01 13:26:49'),
(10, 'Is the quote \"To be or not to be, that is the question\" attributed to William Shakespeare?', 'binary', 1, '2024-02-01 15:12:25', '2024-02-01 15:12:25'),
(11, 'Did Albert Einstein say, \"Imagination is more important than knowledge\"?', 'binary', 1, '2024-02-01 15:13:07', '2024-02-01 15:13:07'),
(12, 'Who is credited with the quote, \"In the beginning God created the heavens and the earth\"?', 'multipleChoice', NULL, '2024-02-02 13:01:43', '2024-02-02 13:01:43');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_responses`
--

CREATE TABLE `quiz_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `incorrect_answers` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_responses`
--

INSERT INTO `quiz_responses` (`id`, `name`, `last_name`, `email`, `score`, `incorrect_answers`, `created_at`, `updated_at`) VALUES
(77, 'lasha', 'Nuroshvili', 'admin@admin.com', 0, 0, '2024-02-02 11:26:38', '2024-02-02 11:26:38'),
(78, 'lasha', 'Nuroshvili', 'lashanur123@gmail.com', 3, 0, '2024-02-02 11:28:51', '2024-02-02 11:29:05'),
(83, 'lasha', 'Nuroshvili', 'lashanur123@gmail.com', 2, 1, '2024-02-02 11:50:53', '2024-02-02 11:51:01'),
(84, 'lasha', 'Nuroshvili', 'lashanur123@gmail.com', 2, 1, '2024-02-02 11:52:59', '2024-02-02 11:53:10'),
(87, 'lasha', 'nuroshvili', 'lashanur123@gmail.com', 0, 0, '2024-02-02 12:49:41', '2024-02-02 12:49:41'),
(90, 'lasha', 'nuroshvili', 'lashanur123@gmail.com', 0, 0, '2024-02-02 12:54:22', '2024-02-02 12:54:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$Y8qcdAN.iE9drTUDhS.UmuecjDNWc73ZgZCzaZdq3z5gyQOaRm3Vm', NULL, '2024-01-29 15:26:51', '2024-01-29 15:26:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answers_question_id_foreign` (`question_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_responses`
--
ALTER TABLE `quiz_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `quiz_responses`
--
ALTER TABLE `quiz_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
