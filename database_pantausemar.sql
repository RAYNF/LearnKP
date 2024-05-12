-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2024 at 08:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_pantausemar`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `judul` varchar(20) DEFAULT NULL,
  `tanggal` timestamp NULL DEFAULT current_timestamp(),
  `description` varchar(30) DEFAULT NULL,
  `urlImage` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id`, `users_id`, `judul`, `tanggal`, `description`, `urlImage`) VALUES
(1, 2, 'semarang  banjir', '2024-05-12 06:23:58', 'aman', 'http:gogle.com');

-- --------------------------------------------------------

--
-- Table structure for table `cctvs`
--

CREATE TABLE `cctvs` (
  `id` int(11) NOT NULL,
  `cctv_categories_id` int(11) NOT NULL,
  `kelurahan_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `ip_nvr` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `ing` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cctvs`
--

INSERT INTO `cctvs` (`id`, `cctv_categories_id`, `kelurahan_id`, `name`, `ip_nvr`, `status`, `username`, `password`, `lat`, `ing`) VALUES
(27, 2, 1, 'dewi sartika', '1112121', 1, 'joko', 'jokojoko', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `cctv_categories`
--

CREATE TABLE `cctv_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cctv_categories`
--

INSERT INTO `cctv_categories` (`id`, `parent_id`, `name`) VALUES
(2, 2, 'sampangan');

-- --------------------------------------------------------

--
-- Table structure for table `cctv_links`
--

CREATE TABLE `cctv_links` (
  `id` int(11) NOT NULL,
  `cctv_id` int(20) NOT NULL,
  `channel` int(20) NOT NULL,
  `link` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `ing` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cctv_links`
--

INSERT INTO `cctv_links` (`id`, `cctv_id`, `channel`, `link`, `status`, `lat`, `ing`) VALUES
(4, 27, 11132, 'https:ggogole.com', 1, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `cctv_link_categories`
--

CREATE TABLE `cctv_link_categories` (
  `id` int(11) NOT NULL,
  `cctv_link_id` int(11) NOT NULL,
  `cctv_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cctv_link_categories`
--

INSERT INTO `cctv_link_categories` (`id`, `cctv_link_id`, `cctv_category_id`) VALUES
(1, 4, 12);

-- --------------------------------------------------------

--
-- Table structure for table `cctv_statuses`
--

CREATE TABLE `cctv_statuses` (
  `id` int(11) NOT NULL,
  `cctv_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `status_detail_id` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cctv_statuses`
--

INSERT INTO `cctv_statuses` (`id`, `cctv_id`, `status_id`, `status_detail_id`, `description`) VALUES
(1, 27, 1, 1, 'aman'),
(2, 27, 1, 1, 'amana');

-- --------------------------------------------------------

--
-- Table structure for table `ips`
--

CREATE TABLE `ips` (
  `id` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `rt` varchar(10) NOT NULL,
  `rw` varchar(10) NOT NULL,
  `kelurahan` varchar(20) NOT NULL,
  `kecamatan` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status_ip` tinyint(1) NOT NULL,
  `ip_internet` varchar(20) NOT NULL,
  `status_internet` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`id`, `name`) VALUES
(1, 'gunung pati');

-- --------------------------------------------------------

--
-- Table structure for table `kelurahans`
--

CREATE TABLE `kelurahans` (
  `id` int(11) NOT NULL,
  `kecamatan_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelurahans`
--

INSERT INTO `kelurahans` (`id`, `kecamatan_id`, `name`) VALUES
(1, 1, 'semarang barat');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `id` int(11) NOT NULL,
  `kelurahans_id` int(11) NOT NULL,
  `total_titik` int(11) NOT NULL,
  `total_titik_aktif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`id`, `kelurahans_id`, `total_titik`, `total_titik_aktif`) VALUES
(1, 1, 12, 11);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `deskripsi` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `deskripsi`, `position`) VALUES
(1, 'sampangan', 'terletak di dekat tu', 'atas'),
(2, 'sampangan', 'tugu', 'atas');

-- --------------------------------------------------------

--
-- Table structure for table `statuses_detail`
--

CREATE TABLE `statuses_detail` (
  `id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `is_required_description` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statuses_detail`
--

INSERT INTO `statuses_detail` (`id`, `status_id`, `value`, `name`, `is_required_description`) VALUES
(1, 1, 12, 'joko', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `username` varchar(15) NOT NULL,
  `phone_number` int(15) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`, `phone_number`, `level`) VALUES
(2, 'joko@gmai.com', 'jokojoko', 'joko', 858968122, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_favorite`
--

CREATE TABLE `user_favorite` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cctv_link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_favorite`
--

INSERT INTO `user_favorite` (`id`, `user_id`, `cctv_link_id`) VALUES
(3, 2, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_berita_users` (`users_id`);

--
-- Indexes for table `cctvs`
--
ALTER TABLE `cctvs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cctvs_cctv_categories` (`cctv_categories_id`),
  ADD KEY `fk_cctvs_kelurahan` (`kelurahan_id`);

--
-- Indexes for table `cctv_categories`
--
ALTER TABLE `cctv_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cctv_links`
--
ALTER TABLE `cctv_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cctv_links_cctvs` (`cctv_id`);

--
-- Indexes for table `cctv_link_categories`
--
ALTER TABLE `cctv_link_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cctvs_link_categories_cctv_links` (`cctv_link_id`);

--
-- Indexes for table `cctv_statuses`
--
ALTER TABLE `cctv_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cctv_statuses_cctv_links` (`cctv_id`),
  ADD KEY `fk_cctv_statuses_statuses` (`status_id`),
  ADD KEY `fk_cctv_statuses_statuses_detail` (`status_detail_id`);

--
-- Indexes for table `ips`
--
ALTER TABLE `ips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelurahans`
--
ALTER TABLE `kelurahans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kelurahans_kecamatans` (`kecamatan_id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_statistics_kelurahans` (`kelurahans_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses_detail`
--
ALTER TABLE `statuses_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_statuses_detail_statuses` (`status_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_favorite`
--
ALTER TABLE `user_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_favorite_users` (`user_id`),
  ADD KEY `fk_user_favorite_cctv_link` (`cctv_link_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cctvs`
--
ALTER TABLE `cctvs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `cctv_categories`
--
ALTER TABLE `cctv_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cctv_links`
--
ALTER TABLE `cctv_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cctv_link_categories`
--
ALTER TABLE `cctv_link_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cctv_statuses`
--
ALTER TABLE `cctv_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ips`
--
ALTER TABLE `ips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kelurahans`
--
ALTER TABLE `kelurahans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `statuses_detail`
--
ALTER TABLE `statuses_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_favorite`
--
ALTER TABLE `user_favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `berita`
--
ALTER TABLE `berita`
  ADD CONSTRAINT `fk_berita_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cctvs`
--
ALTER TABLE `cctvs`
  ADD CONSTRAINT `fk_cctvs_cctv_categories` FOREIGN KEY (`cctv_categories_id`) REFERENCES `cctv_categories` (`id`),
  ADD CONSTRAINT `fk_cctvs_kelurahan` FOREIGN KEY (`kelurahan_id`) REFERENCES `kelurahans` (`id`);

--
-- Constraints for table `cctv_links`
--
ALTER TABLE `cctv_links`
  ADD CONSTRAINT `fk_cctv_links_cctvs` FOREIGN KEY (`cctv_id`) REFERENCES `cctvs` (`id`);

--
-- Constraints for table `cctv_link_categories`
--
ALTER TABLE `cctv_link_categories`
  ADD CONSTRAINT `fk_cctvs_link_categories_cctv_links` FOREIGN KEY (`cctv_link_id`) REFERENCES `cctv_links` (`id`);

--
-- Constraints for table `cctv_statuses`
--
ALTER TABLE `cctv_statuses`
  ADD CONSTRAINT `fk_cctv_statuses_cctv_links` FOREIGN KEY (`cctv_id`) REFERENCES `cctv_links` (`cctv_id`),
  ADD CONSTRAINT `fk_cctv_statuses_statuses` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `fk_cctv_statuses_statuses_detail` FOREIGN KEY (`status_detail_id`) REFERENCES `statuses_detail` (`id`);

--
-- Constraints for table `kelurahans`
--
ALTER TABLE `kelurahans`
  ADD CONSTRAINT `fk_kelurahans_kecamatans` FOREIGN KEY (`kecamatan_id`) REFERENCES `kecamatan` (`id`);

--
-- Constraints for table `statistics`
--
ALTER TABLE `statistics`
  ADD CONSTRAINT `fk_statistics_kelurahans` FOREIGN KEY (`kelurahans_id`) REFERENCES `kelurahans` (`id`);

--
-- Constraints for table `statuses_detail`
--
ALTER TABLE `statuses_detail`
  ADD CONSTRAINT `fk_statuses_detail_statuses` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `user_favorite`
--
ALTER TABLE `user_favorite`
  ADD CONSTRAINT `fk_user_favorite_cctv_link` FOREIGN KEY (`cctv_link_id`) REFERENCES `cctv_links` (`id`),
  ADD CONSTRAINT `fk_user_favorite_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
