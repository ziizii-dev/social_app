-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 13, 2024 at 09:56 PM
-- Server version: 8.0.36-0ubuntu0.22.04.1
-- PHP Version: 8.3.2-1+ubuntu22.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE `clinics` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clinics`
--

INSERT INTO `clinics` (`id`, `name`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'clinic-one', 'kyoto', '09988777778', '2024-04-10 11:56:08', '2024-04-12 03:40:01');

-- --------------------------------------------------------

--
-- Table structure for table `clinic_times`
--

CREATE TABLE `clinic_times` (
  `id` bigint UNSIGNED NOT NULL,
  `clinic_id` bigint UNSIGNED NOT NULL,
  `day_of_week` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_hour` time DEFAULT '10:00:00',
  `closing_hour` time DEFAULT '19:00:00',
  `is_holiday` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clinic_times`
--

INSERT INTO `clinic_times` (`id`, `clinic_id`, `day_of_week`, `opening_hour`, `closing_hour`, `is_holiday`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sunday', '15:03:00', '08:00:09', 0, '2024-04-12 08:01:36', '2024-04-16 23:59:38'),
(2, 1, 'Monday', '11:11:00', '13:01:00', 1, '2024-04-12 08:03:26', '2024-04-16 23:59:01'),
(3, 1, 'Tuesday', '08:08:00', '09:09:00', 1, '2024-04-12 08:19:13', '2024-04-16 23:59:54'),
(4, 1, 'Wednesday', '05:05:00', '23:11:00', 1, '2024-04-12 08:19:55', '2024-05-13 02:52:23'),
(5, 1, 'Thursday', '06:06:00', '16:06:00', 1, '2024-04-12 08:20:25', '2024-05-13 02:52:21'),
(6, 1, 'Friday', '07:07:00', '18:08:00', 1, '2024-04-12 08:20:49', '2024-05-13 02:52:26'),
(8, 1, 'Saturday', '07:33:00', '15:02:00', 1, '2024-04-12 09:15:01', '2024-04-12 23:03:52');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 'ddd', 16, 12, '2024-05-13 11:09:58', '2024-05-13 11:09:58'),
(3, 'ddere', 14, 10, '2024-05-13 11:15:39', '2024-05-13 11:15:39'),
(4, 'hell im tun tun', 17, 11, '2024-05-13 11:16:18', '2024-05-13 11:16:18'),
(5, 'dddureo-update0', 16, 11, '2024-05-13 11:42:16', '2024-05-13 14:27:21'),
(6, 'Hello', 16, 2, '2024-05-13 14:09:52', '2024-05-13 14:09:52'),
(7, 'I am kyaw kyaw', 18, 2, '2024-05-13 14:12:05', '2024-05-13 14:12:05'),
(8, 'I am kyaw kyaw', 18, 12, '2024-05-13 14:15:08', '2024-05-13 14:15:08'),
(9, 'helooeo', 17, 12, '2024-05-13 14:19:14', '2024-05-13 14:19:14'),
(10, 'heoo3r34', 17, 11, '2024-05-13 14:19:27', '2024-05-13 14:19:27'),
(11, 'hehheirhr', 17, 2, '2024-05-13 14:19:37', '2024-05-13 14:19:37'),
(12, 'gpp', 19, 13, '2024-05-13 15:09:48', '2024-05-13 15:09:48'),
(13, 'hello', 16, 13, '2024-05-13 15:11:19', '2024-05-13 15:11:19');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `default_holidays`
--

CREATE TABLE `default_holidays` (
  `id` bigint UNSIGNED NOT NULL,
  `clinic_id` bigint UNSIGNED NOT NULL,
  `day_of_week` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `long_holidays`
--

CREATE TABLE `long_holidays` (
  `id` bigint UNSIGNED NOT NULL,
  `clinic_id` bigint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `long_holidays`
--

INSERT INTO `long_holidays` (`id`, `clinic_id`, `start_date`, `end_date`, `reason`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-09-13', '2024-08-22', 'for thingyan festival', '2024-04-12 11:56:15', '2024-04-12 13:05:26'),
(3, 1, '2024-05-14', '2024-05-15', 'ee', '2024-05-13 02:54:32', '2024-05-13 02:54:32');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_04_04_153812_create_sessions_table', 1),
(7, '2024_04_04_154302_create_clinics_table', 1),
(8, '2024_04_04_154945_create_clinic_times_table', 1),
(9, '2024_04_04_155057_create_default_holidays_table', 1),
(10, '2024_04_04_155138_create_long_holidays_table', 1),
(11, '2024_05_13_095013_create_posts_table', 2),
(12, '2024_05_13_133357_create_comments_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `post` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post`, `user_id`, `image`, `created_at`, `updated_at`) VALUES
(2, 'd2', 16, NULL, '2024-05-13 05:33:57', '2024-05-13 05:33:57'),
(3, 'd3', 16, NULL, '2024-05-13 05:35:08', '2024-05-13 05:35:08'),
(4, 'dd 9', 16, 'upload/post/1798971249155965.jpeg', '2024-05-13 05:36:09', '2024-05-13 14:07:56'),
(5, 'dd', 16, 'upload/post/1798971270742676.jpeg', '2024-05-13 05:39:36', '2024-05-13 14:08:16'),
(6, 'dd', 16, NULL, '2024-05-13 06:10:21', '2024-05-13 06:10:21'),
(7, 'dd', 16, 'upload/post/1798971287794750.jpeg', '2024-05-13 06:12:44', '2024-05-13 14:08:33'),
(8, 'dd  9', 16, 'upload/post/1798971224503216.jpeg', '2024-05-13 06:12:51', '2024-05-13 14:07:32'),
(9, 'dd  \n                                    dd  \n                                    update', 16, 'upload/post/1798955881595999.jpg', '2024-05-13 06:14:58', '2024-05-13 10:03:40'),
(10, 'dd', 16, 'upload/post/1798941582148440.jpeg', '2024-05-13 06:16:23', '2024-05-13 06:16:23'),
(11, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 16, 'upload/post/1798941595882528.jpeg', '2024-05-13 06:16:36', '2024-05-13 10:08:14'),
(12, 'dd', 17, 'upload/post/1798941785689682.jpeg', '2024-05-13 06:19:37', '2024-05-13 06:19:37'),
(13, 'the 1st post', 19, 'upload/post/1798975110921811.jpg', '2024-05-13 15:09:19', '2024-05-13 15:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('AiyxL6h0QdnWPso6n54cBO8CEjMbmSax7BJgNAMg', 16, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:124.0) Gecko/20100101 Firefox/124.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNzhJeVFGRllpRVFmRlhxaVloVFE4OWVIQ1AwdWFBTTN6Y3dYNGJkeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxNjtzOjQ6InVzZXIiO086MTU6IkFwcFxNb2RlbHNcVXNlciI6MzI6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NToidXNlcnMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxNTp7czoyOiJpZCI7aToxNjtzOjQ6Im5hbWUiO3M6NToicG9vdWkiO3M6NToiZW1haWwiO3M6MTQ6InVzZXJAZ21haWwuY29tIjtzOjU6InBob25lIjtzOjEyOiIwOTk4ODc4Nzg3NzAiO3M6NzoiYWRkcmVzcyI7czozOiJtZHkiO3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtOO3M6ODoicGFzc3dvcmQiO3M6NjA6IiQyeSQxMCRwcEdsbDlBTWlFOVFOaWhYa1ZudGgucWl3TWtCQTBnUmZ0dmxxN3RqOVM1YURnMkF4bU10ZSI7czoxNzoidHdvX2ZhY3Rvcl9zZWNyZXQiO047czoyNToidHdvX2ZhY3Rvcl9yZWNvdmVyeV9jb2RlcyI7TjtzOjIzOiJ0d29fZmFjdG9yX2NvbmZpcm1lZF9hdCI7TjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjE1OiJjdXJyZW50X3RlYW1faWQiO047czoxODoicHJvZmlsZV9waG90b19wYXRoIjtzOjI3OiI2NjE2OTc4YzE3YWYzY29vc3lfbG9nby5qcGciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjQtMDQtMTAgMTI6Mzk6MTgiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjQtMDQtMTcgMDY6MzI6MTkiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxNTp7czoyOiJpZCI7aToxNjtzOjQ6Im5hbWUiO3M6NToicG9vdWkiO3M6NToiZW1haWwiO3M6MTQ6InVzZXJAZ21haWwuY29tIjtzOjU6InBob25lIjtzOjEyOiIwOTk4ODc4Nzg3NzAiO3M6NzoiYWRkcmVzcyI7czozOiJtZHkiO3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtOO3M6ODoicGFzc3dvcmQiO3M6NjA6IiQyeSQxMCRwcEdsbDlBTWlFOVFOaWhYa1ZudGgucWl3TWtCQTBnUmZ0dmxxN3RqOVM1YURnMkF4bU10ZSI7czoxNzoidHdvX2ZhY3Rvcl9zZWNyZXQiO047czoyNToidHdvX2ZhY3Rvcl9yZWNvdmVyeV9jb2RlcyI7TjtzOjIzOiJ0d29fZmFjdG9yX2NvbmZpcm1lZF9hdCI7TjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjE1OiJjdXJyZW50X3RlYW1faWQiO047czoxODoicHJvZmlsZV9waG90b19wYXRoIjtzOjI3OiI2NjE2OTc4YzE3YWYzY29vc3lfbG9nby5qcGciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjQtMDQtMTAgMTI6Mzk6MTgiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjQtMDQtMTcgMDY6MzI6MTkiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjE6e3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtzOjg6ImRhdGV0aW1lIjt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjE6e2k6MDtzOjE3OiJwcm9maWxlX3Bob3RvX3VybCI7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTo0OntpOjA7czo4OiJwYXNzd29yZCI7aToxO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjtpOjI7czoyNToidHdvX2ZhY3Rvcl9yZWNvdmVyeV9jb2RlcyI7aTozO3M6MTc6InR3b19mYWN0b3Jfc2VjcmV0Ijt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMToiACoAZmlsbGFibGUiO2E6NTp7aTowO3M6NDoibmFtZSI7aToxO3M6NToiZW1haWwiO2k6MjtzOjg6InBhc3N3b3JkIjtpOjM7czo1OiJwaG9uZSI7aTo0O3M6NzoiYWRkcmVzcyI7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fXM6MjA6IgAqAHJlbWVtYmVyVG9rZW5OYW1lIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7czoxNDoiACoAYWNjZXNzVG9rZW4iO047fX0=', 1715636887),
('KwN17ibDTtQWSmnv0D8pWqL830UqNv9YMaScAeVS', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:124.0) Gecko/20100101 Firefox/124.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNG1uenlQeE5GVTgyZXBoSXVIaG4zd1diZHJFdEVxZDZtdmhGTW1BQSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAxL2NvbW1lbnQvcGFnZS8xMSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDEvY29tbWVudC9wYWdlLzExIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1715626152),
('leYb5Q0RwU4KoR3uoFhlkbdoyysvDuVIMKtAlmMq', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:124.0) Gecko/20100101 Firefox/124.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0JxQ0tDYmhCUWZiZDNiaVdLSzA0SjVES2szU2tiZGZidDB4NnFiWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1715627800),
('MpBSVLofZcD3lF55TxDLj2Sxjtxz2LwBd7fkZHtO', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:124.0) Gecko/20100101 Firefox/124.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXBVcUptS01JWFJsSnJMZndoVm83OHNjaXNjODdJaVJYWVN3ZWpPbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1715626154),
('pO4MOgl6Jr3a4x3jVMp1eZ2bTJIUKEzAqjSoyIF7', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:124.0) Gecko/20100101 Firefox/124.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibWVLdGhBdjhtT2M1Z0ZIcjVZMjFmTTlyUFpwZnh1RkJ6dnNrOW5yZiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2NvbW1lbnQvcGFnZS8xMSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvY29tbWVudC9wYWdlLzExIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1715627798),
('RBL50kS9M0ft0NpCvWX2roPtsLt5FXspn0SMOBQa', 16, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibnJPcW5xY0hpSUhlUUh5ZkhMdnoyeXM3R1FRbEx2ZGJCSzAxQksxViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb21tZW50L3BhZ2UvMTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxNjtzOjQ6InVzZXIiO086MTU6IkFwcFxNb2RlbHNcVXNlciI6MzI6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NToidXNlcnMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxNTp7czoyOiJpZCI7aToxNjtzOjQ6Im5hbWUiO3M6NToicG9vdWkiO3M6NToiZW1haWwiO3M6MTQ6InVzZXJAZ21haWwuY29tIjtzOjU6InBob25lIjtzOjEyOiIwOTk4ODc4Nzg3NzAiO3M6NzoiYWRkcmVzcyI7czozOiJtZHkiO3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtOO3M6ODoicGFzc3dvcmQiO3M6NjA6IiQyeSQxMCRwcEdsbDlBTWlFOVFOaWhYa1ZudGgucWl3TWtCQTBnUmZ0dmxxN3RqOVM1YURnMkF4bU10ZSI7czoxNzoidHdvX2ZhY3Rvcl9zZWNyZXQiO047czoyNToidHdvX2ZhY3Rvcl9yZWNvdmVyeV9jb2RlcyI7TjtzOjIzOiJ0d29fZmFjdG9yX2NvbmZpcm1lZF9hdCI7TjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjE1OiJjdXJyZW50X3RlYW1faWQiO047czoxODoicHJvZmlsZV9waG90b19wYXRoIjtzOjI3OiI2NjE2OTc4YzE3YWYzY29vc3lfbG9nby5qcGciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjQtMDQtMTAgMTI6Mzk6MTgiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjQtMDQtMTcgMDY6MzI6MTkiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxNTp7czoyOiJpZCI7aToxNjtzOjQ6Im5hbWUiO3M6NToicG9vdWkiO3M6NToiZW1haWwiO3M6MTQ6InVzZXJAZ21haWwuY29tIjtzOjU6InBob25lIjtzOjEyOiIwOTk4ODc4Nzg3NzAiO3M6NzoiYWRkcmVzcyI7czozOiJtZHkiO3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtOO3M6ODoicGFzc3dvcmQiO3M6NjA6IiQyeSQxMCRwcEdsbDlBTWlFOVFOaWhYa1ZudGgucWl3TWtCQTBnUmZ0dmxxN3RqOVM1YURnMkF4bU10ZSI7czoxNzoidHdvX2ZhY3Rvcl9zZWNyZXQiO047czoyNToidHdvX2ZhY3Rvcl9yZWNvdmVyeV9jb2RlcyI7TjtzOjIzOiJ0d29fZmFjdG9yX2NvbmZpcm1lZF9hdCI7TjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjE1OiJjdXJyZW50X3RlYW1faWQiO047czoxODoicHJvZmlsZV9waG90b19wYXRoIjtzOjI3OiI2NjE2OTc4YzE3YWYzY29vc3lfbG9nby5qcGciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjQtMDQtMTAgMTI6Mzk6MTgiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjQtMDQtMTcgMDY6MzI6MTkiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjE6e3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtzOjg6ImRhdGV0aW1lIjt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjE6e2k6MDtzOjE3OiJwcm9maWxlX3Bob3RvX3VybCI7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTo0OntpOjA7czo4OiJwYXNzd29yZCI7aToxO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjtpOjI7czoyNToidHdvX2ZhY3Rvcl9yZWNvdmVyeV9jb2RlcyI7aTozO3M6MTc6InR3b19mYWN0b3Jfc2VjcmV0Ijt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMToiACoAZmlsbGFibGUiO2E6NTp7aTowO3M6NDoibmFtZSI7aToxO3M6NToiZW1haWwiO2k6MjtzOjg6InBhc3N3b3JkIjtpOjM7czo1OiJwaG9uZSI7aTo0O3M6NzoiYWRkcmVzcyI7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fXM6MjA6IgAqAHJlbWVtYmVyVG9rZW5OYW1lIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7czoxNDoiACoAYWNjZXNzVG9rZW4iO047fX0=', 1715626494);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(15, 'ooo', 'oo@gmail.com', '09', 'yy', NULL, '$2y$10$YMFv7urm0Z.VHKl3yhliMuKntuw9WMSwfAcKGThjeZ.kxGHwpvCqS', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 10:06:01', '2024-04-05 10:06:01'),
(16, 'pooui', 'user@gmail.com', '099887878770', 'mdy', NULL, '$2y$10$ppGll9AMiE9QNihXkVnth.qiwMkBA0gRftvlq7tj9S5aDg2AxmMte', NULL, NULL, NULL, NULL, NULL, '6616978c17af3coosy_logo.jpg', '2024-04-10 06:09:18', '2024-04-17 00:02:19'),
(17, 'tuntun', 'tuntun@gmail.com', '09988787877', 'ygn', NULL, '$2y$10$OOSWmb8AppPUolpE2/QaT.QsSJoKSUimdbjUyoX5W2bApw28hRIdS', NULL, NULL, NULL, NULL, NULL, '6642540f614e51785695650844304.png', '2024-05-13 06:18:42', '2024-05-13 11:25:27'),
(18, 'kyaw', 'kyawkyaw@gmail.com', '099887878770', 'ygn', NULL, '$2y$10$/PKUXpkTizNlqotU.4H9ROVjad3IoTRWfybRx.KuPeWmKeSm./VAq', NULL, NULL, NULL, NULL, NULL, '66427b94275b0360_F_326985142_1aaKcEjMQW6ULp6oI9MYuv8lN9f8sFmj.jpg', '2024-05-13 14:11:14', '2024-05-13 14:14:04'),
(19, 'moe', 'moemoe@gmail.com', '099887878770', 'ygn', NULL, '$2y$10$VjCYkE23hllFqNRmtO2MGeRQUcyzFABqCfAuDCErwuLfuFqPaJJ/2', NULL, NULL, NULL, NULL, NULL, '664288cb0549f9520103_R_Z001A.jpeg', '2024-05-13 15:08:27', '2024-05-13 15:10:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clinic_times`
--
ALTER TABLE `clinic_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `default_holidays`
--
ALTER TABLE `default_holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `long_holidays`
--
ALTER TABLE `long_holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `clinics`
--
ALTER TABLE `clinics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clinic_times`
--
ALTER TABLE `clinic_times`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `default_holidays`
--
ALTER TABLE `default_holidays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `long_holidays`
--
ALTER TABLE `long_holidays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
