-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 18, 2022 at 09:06 PM
-- Server version: 10.2.41-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jonarsip_university`
--

-- --------------------------------------------------------

--
-- Table structure for table `arsip`
--

CREATE TABLE `arsip` (
  `id_arsip` int(11) NOT NULL,
  `arsip_name` mediumtext NOT NULL,
  `no_arsip` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gdrive_last_folder_name_target` varchar(255) DEFAULT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) NOT NULL,
  `divisi_id` int(11) NOT NULL,
  `bagian_id` int(11) NOT NULL,
  `rak_id` int(11) NOT NULL,
  `baris_id` int(11) NOT NULL,
  `lokasi_id` int(11) NOT NULL DEFAULT 0,
  `box_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `deskripsi_arsip` mediumtext NOT NULL,
  `keterangan` mediumtext DEFAULT NULL,
  `masa_retensi` date DEFAULT NULL,
  `status_retensi` tinyint(1) NOT NULL DEFAULT 1,
  `link_gdrive` mediumtext DEFAULT NULL,
  `status_file` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_available` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `arsip`
--

INSERT INTO `arsip` (`id_arsip`, `arsip_name`, `no_arsip`, `email`, `gdrive_last_folder_name_target`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `rak_id`, `baris_id`, `lokasi_id`, `box_id`, `map_id`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_retensi`, `link_gdrive`, `status_file`, `user_id`, `is_available`, `created_by`, `created_at`, `modified_by`, `modified_at`, `is_delete`, `deleted_by`, `deleted_at`) VALUES
(1, 'TEST ARSIP 1', '123', NULL, NULL, 12, 54, 47, 10, 60, 14, 39, 8, 56, 'test arsip 1', '1', '2029-03-14', 1, NULL, 1, 60, 1, 'ridargustia', '2021-05-12 15:03:16', '', '2021-05-16 22:20:33', 0, NULL, NULL),
(2, 'TEST ARSIP 2', '123.1', NULL, NULL, 12, 54, 47, 10, 60, 14, 39, 8, 56, 'test arsip 2', '1', '2025-06-10', 1, NULL, 1, 61, 1, 'rektorumy', '2021-05-12 15:22:00', '', '2021-05-21 15:40:56', 0, NULL, NULL),
(3, 'TEST ARSIP 3', '123.2', NULL, NULL, 12, 54, 47, 10, 60, 14, 39, 8, 56, 'test arsip 3', '1', '2025-03-12', 1, NULL, 1, 60, 0, 'dekanfkik', '2021-05-12 15:26:27', '', '2021-05-16 22:20:33', 0, NULL, NULL),
(4, 'TEST ARSIP 4', '123.3', NULL, NULL, 12, 54, 47, 10, 60, 14, 39, 8, 56, 'test arsip 4', '1', '2025-07-30', 1, NULL, 1, 60, 0, 'kaprodidokter', '2021-05-12 15:30:51', '', '2021-05-12 15:31:30', 0, NULL, NULL),
(5, 'TEST ARSIP 5', '123.4', NULL, NULL, 12, 54, 47, 10, 60, 14, 39, 8, 56, 'test arsip 5', '1', '2025-07-23', 1, NULL, 1, 60, 1, 'tudokter', '2021-05-12 15:35:44', '', '2021-05-15 19:24:16', 0, NULL, NULL),
(6, 'TEST ARSIP UAD 1', '123.1', NULL, NULL, 10, 50, 39, 1, 54, 1, 33, 2, 54, 'TEST ARSIP UAD 1', '1', '2029-07-04', 1, NULL, 1, 53, 0, 'ridargustia', '2021-05-16 11:49:52', '', '2021-05-16 11:51:32', 0, NULL, NULL),
(7, 'TEST ARSIP UAD 2', '123.2', NULL, NULL, 10, 50, 39, 1, 54, 1, 33, 2, 54, 'TEST ARSIP UAD 2', '1', '2025-07-17', 1, NULL, 1, 55, 1, 'rektoruad', '2021-05-16 15:23:08', '', '2021-05-16 15:24:07', 0, NULL, NULL),
(8, 'SK Rektor', '500.1', NULL, NULL, 13, 57, 51, 20, 62, 16, 41, 10, 58, '#SK', '1', '2025-03-05', 1, NULL, 0, 66, 1, 'rosirisprio', '2021-10-15 16:05:47', '', NULL, 0, NULL, NULL),
(9, 'SK Dekan', '500.2', NULL, NULL, 13, 57, 51, 19, 62, 16, 41, 10, 58, '#SK', '1', '2025-07-17', 1, NULL, 0, 65, 1, 'adamputra', '2021-10-15 16:09:15', '', NULL, 0, NULL, NULL),
(10, 'SK Kaprodi', '500.3', NULL, NULL, 13, 57, 51, 18, 62, 16, 41, 10, 58, '#SK', '1', '2025-03-05', 1, NULL, 0, 64, 1, 'imamyasir', '2021-10-15 16:12:21', '', NULL, 0, NULL, NULL),
(11, 'SK Pegawai', '500.4', NULL, NULL, 13, 57, 51, 17, 62, 16, 41, 10, 58, '#SK', '1', '2025-07-09', 1, NULL, 0, 63, 1, 'choirulmiftah', '2021-10-15 16:14:40', '', NULL, 0, NULL, NULL),
(13, 'SK', '12', NULL, NULL, 16, 60, 56, 30, 66, 19, 42, 12, 59, 'Yudisium', '0', '2021-12-25', 1, NULL, 1, 84, 1, 'kusriner', '2021-12-04 16:59:43', '', '2021-12-04 17:11:13', 0, NULL, NULL),
(15, 'Edaran Libur Natal', '001', NULL, NULL, 17, 61, 58, 34, 67, 20, 46, 13, 60, '#Edaran\r\n#Libur\r\n#Natal', '1', '2021-12-31', 1, NULL, 1, 85, 1, 'lilyidayu', '2021-12-06 10:11:47', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `arsip_files`
--

CREATE TABLE `arsip_files` (
  `id` int(11) NOT NULL,
  `arsip_id` int(11) NOT NULL,
  `file_upload` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `arsip_jenis`
--

CREATE TABLE `arsip_jenis` (
  `id_arsip_jenis` int(11) NOT NULL,
  `arsip_id` int(11) NOT NULL,
  `jenis_arsip_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `arsip_jenis`
--

INSERT INTO `arsip_jenis` (`id_arsip_jenis`, `arsip_id`, `jenis_arsip_id`, `created_at`) VALUES
(1, 1, 5, '2021-05-12 15:03:17'),
(2, 2, 5, '2021-05-12 15:22:00'),
(3, 3, 5, '2021-05-12 15:26:27'),
(4, 4, 5, '2021-05-12 15:30:52'),
(5, 5, 5, '2021-05-12 15:35:45'),
(6, 6, 5, '2021-05-16 11:49:53'),
(7, 7, 5, '2021-05-16 15:23:10'),
(8, 8, 4, '2021-10-15 16:05:47'),
(9, 9, 4, '2021-10-15 16:09:15'),
(10, 10, 4, '2021-10-15 16:12:21'),
(11, 11, 4, '2021-10-15 16:14:40'),
(13, 13, 5, '2021-12-04 16:59:43'),
(14, 15, 4, '2021-12-06 10:11:47');

-- --------------------------------------------------------

--
-- Table structure for table `bagian`
--

CREATE TABLE `bagian` (
  `id_bagian` int(11) NOT NULL,
  `bagian_name` varchar(100) NOT NULL,
  `bagian_slug` varchar(100) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) NOT NULL,
  `divisi_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete_bagian` tinyint(1) NOT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bagian`
--

INSERT INTO `bagian` (`id_bagian`, `bagian_name`, `bagian_slug`, `instansi_id`, `cabang_id`, `divisi_id`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_bagian`, `deleted_by`, `deleted_at`) VALUES
(1, 'MAHASISWA', 'mahasiswa', 10, 50, 39, '2021-04-19 15:02:34', 'ridargustia', 'kaproditif', '2021-04-22 11:29:50', 0, NULL, NULL),
(2, 'PENGEMBANGAN APLIKASI', 'pengembangan-aplikasi', 11, 51, 40, '2021-04-20 09:59:26', 'ridargustia', '', NULL, 0, NULL, NULL),
(4, 'MAHASISWA', 'mahasiswa', 10, 52, 43, '2021-04-20 10:12:08', 'ridargustia', 'ridargustia', '2021-04-20 15:06:49', 0, NULL, NULL),
(5, 'MAHASISWA', 'mahasiswa', 10, 53, 44, '2021-04-21 13:34:06', 'rektoruad', 'rektoruad', '2021-04-21 14:13:12', 0, NULL, NULL),
(7, 'DOSEN', 'dosen', 10, 52, 42, '2021-04-21 13:59:34', 'rektoruad', 'rektoruad', '2021-04-21 14:04:09', 0, NULL, NULL),
(8, 'MAHASISWA', 'mahasiswa', 10, 50, 41, '2021-04-21 14:02:51', 'rektoruad', '', NULL, 0, NULL, NULL),
(9, 'MAHASISWA', 'mahasiswa', 10, 50, 46, '2021-04-21 14:39:10', 'dekanfti', '', NULL, 0, NULL, NULL),
(10, 'TATA USAHA', 'tata-usaha', 12, 54, 47, '2021-05-08 16:09:33', 'ridargustia', '', NULL, 0, NULL, NULL),
(12, 'TATA USAHA', 'tata-usaha', 12, 56, 49, '2021-05-08 17:24:06', 'rektorumy', '', NULL, 0, NULL, NULL),
(13, 'REKTORAT', 'rektorat', 12, 54, 47, '2021-05-09 12:44:14', 'ridargustia', 'rektorumy', '2021-05-09 13:32:58', 0, NULL, NULL),
(14, 'FAKULTAS', 'fakultas', 12, 54, 47, '2021-05-09 13:33:27', 'rektorumy', '', NULL, 0, NULL, NULL),
(15, 'PRODI', 'prodi', 12, 54, 47, '2021-05-09 13:41:25', 'dekanfkik', '', NULL, 0, NULL, NULL),
(16, 'TATA USAHA', 'tata-usaha', 12, 54, 50, '2021-05-12 15:11:13', 'rektorumy', 'rektorumy', '2021-05-12 15:12:52', 0, NULL, NULL),
(17, 'TATA USAHA', 'tata-usaha', 13, 57, 51, '2021-10-15 15:24:01', 'ridargustia', '', NULL, 0, NULL, NULL),
(18, 'KAPRODI', 'kaprodi', 13, 57, 51, '2021-10-15 15:29:14', 'ridargustia', '', NULL, 0, NULL, NULL),
(19, 'DEKAN', 'dekan', 13, 57, 51, '2021-10-15 15:30:02', 'ridargustia', '', NULL, 0, NULL, NULL),
(20, 'REKTOR', 'rektor', 13, 57, 51, '2021-10-15 15:30:29', 'ridargustia', '', NULL, 0, NULL, NULL),
(21, 'TATA USAHA', 'tata-usaha', 14, 58, 53, '2021-10-16 11:22:27', 'ridargustia', '', NULL, 0, NULL, NULL),
(22, 'TATA USAHA', 'tata-usaha', 14, 58, 52, '2021-10-16 11:22:45', 'ridargustia', '', NULL, 0, NULL, NULL),
(23, 'TATA USAHA', 'tata-usaha', 14, 58, 54, '2021-10-16 11:23:05', 'ridargustia', '', NULL, 0, NULL, NULL),
(24, 'REKTORAT', 'rektorat', 14, 58, 53, '2021-10-16 11:31:24', 'ridargustia', '', NULL, 0, NULL, NULL),
(25, 'DEKANAT', 'dekanat', 14, 58, 53, '2021-10-16 11:31:41', 'ridargustia', '', NULL, 0, NULL, NULL),
(26, 'KAPRODI', 'kaprodi', 14, 58, 53, '2021-10-16 11:31:57', 'ridargustia', '', NULL, 0, NULL, NULL),
(27, 'KAPRODI', 'kaprodi', 14, 58, 54, '2021-10-16 11:49:41', 'ketua1', '', NULL, 0, NULL, NULL),
(28, 'KAPRODI', 'kaprodi', 14, 58, 52, '2021-10-16 11:49:52', 'ketua1', '', NULL, 0, NULL, NULL),
(29, 'DIVISI A', 'divisi-a', 15, 59, 55, '2021-12-03 22:26:41', 'ridargustia', '', NULL, 0, NULL, NULL),
(30, 'DIVISI  A. ADMINISTRASI', 'divisi-a-administrasi', 16, 60, 56, '2021-12-03 22:27:14', 'ridargustia', 'marthinus', '2021-12-10 13:05:33', 0, NULL, NULL),
(31, 'DIVISI A', 'divisi-a', 17, 61, 57, '2021-12-03 22:27:44', 'ridargustia', '', NULL, 0, NULL, NULL),
(32, 'divisi keuangan', 'divisi-keuangan', 16, 60, 56, '2021-12-04 16:08:14', 'marthinus', '', '2021-12-04 16:08:32', 1, 'marthinus', '2021-12-04 16:08:00'),
(33, 'DIVISI B', 'divisi-b', 17, 61, 57, '2021-12-04 16:10:44', 'zahrawaani', '', NULL, 0, NULL, NULL),
(34, 'FEB', 'feb', 17, 61, 58, '2021-12-04 16:52:58', 'lilyidayu', '', NULL, 0, NULL, NULL),
(35, 'DEVISI B. KEUANGAN', 'devisi-b-keuangan', 16, 60, 56, '2021-12-10 13:08:51', 'marthinus', 'marthinus', '2021-12-10 13:09:33', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `baris`
--

CREATE TABLE `baris` (
  `id_baris` int(11) NOT NULL,
  `baris_name` varchar(50) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) NOT NULL,
  `divisi_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete_baris` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `baris`
--

INSERT INTO `baris` (`id_baris`, `baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_baris`, `deleted_by`, `deleted_at`) VALUES
(1, '1', 10, 50, 39, '2021-04-07 13:20:50', 'ridargustia', '', '2021-04-19 12:38:11', 0, NULL, NULL),
(6, '2', 10, 50, 39, '2021-05-04 13:24:22', 'kaproditif', '', '2021-05-05 10:49:44', 1, 'ridargustia', '2021-05-05 10:49:00'),
(10, '1', 10, 52, 43, '2021-05-04 13:32:03', 'ridargustia', '', NULL, 0, NULL, NULL),
(11, '1', 10, 52, 42, '2021-05-04 13:32:19', 'ridargustia', '', NULL, 0, NULL, NULL),
(12, '1', 10, 50, 46, '2021-05-04 13:46:56', 'dekanfti', 'ridargustia', '2021-05-04 14:38:55', 0, NULL, NULL),
(13, '2', 10, 50, 39, '2021-05-05 10:53:52', 'ridargustia', '', NULL, 0, NULL, NULL),
(14, '1', 12, 54, 47, '2021-05-12 15:00:33', 'ridargustia', '', NULL, 0, NULL, NULL),
(15, '1', 12, 54, 50, '2021-05-12 15:13:27', 'rektorumy', '', NULL, 0, NULL, NULL),
(16, '1', 13, 57, 51, '2021-10-15 16:02:10', 'rosirisprio', '', NULL, 0, NULL, NULL),
(17, 'B', 17, 61, 57, '2021-12-04 16:34:13', 'lilyidayu', '', NULL, 0, NULL, NULL),
(18, '3', 15, 59, 55, '2021-12-04 16:40:34', 'adisurya', '', NULL, 0, NULL, NULL),
(19, '10', 16, 60, 56, '2021-12-04 16:55:15', 'kusriner', '', NULL, 0, NULL, NULL),
(20, '2', 17, 61, 58, '2021-12-06 10:10:34', 'lilyidayu', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `box`
--

CREATE TABLE `box` (
  `id_box` int(11) NOT NULL,
  `box_name` varchar(100) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) NOT NULL,
  `divisi_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete_box` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `box`
--

INSERT INTO `box` (`id_box`, `box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_box`, `deleted_by`, `deleted_at`) VALUES
(2, '1', 10, 50, 39, '2021-05-05 11:09:43', 'ridargustia', '', NULL, 0, NULL, NULL),
(7, '1', 10, 52, 43, '2021-05-05 14:33:50', 'rektoruad', '', NULL, 0, NULL, NULL),
(8, '1', 12, 54, 47, '2021-05-12 15:00:59', 'ridargustia', '', NULL, 0, NULL, NULL),
(9, '1', 12, 54, 50, '2021-05-12 15:13:52', 'rektorumy', '', NULL, 0, NULL, NULL),
(10, '1', 13, 57, 51, '2021-10-15 16:02:33', 'rosirisprio', '', NULL, 0, NULL, NULL),
(11, 'BOX 3.1', 15, 59, 55, '2021-12-04 16:39:16', 'adisurya', '', NULL, 0, NULL, NULL),
(12, '03', 16, 60, 56, '2021-12-04 16:52:47', 'kusriner', '', NULL, 0, NULL, NULL),
(13, 'A', 17, 61, 58, '2021-12-06 10:06:11', 'lilyidayu', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `id_cabang` int(11) NOT NULL,
  `cabang_name` varchar(250) DEFAULT NULL,
  `instansi_id` int(11) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete_cabang` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cabang`
--

INSERT INTO `cabang` (`id_cabang`, `cabang_name`, `instansi_id`, `created_by`, `created_at`, `modified_by`, `modified_at`, `is_delete_cabang`, `deleted_by`, `deleted_at`) VALUES
(50, 'FAKULTAS TEKNOLOGI INDUSTRI', 10, 'ridargustia', '2021-04-05 21:29:49', 'ridargustia', '2021-04-06 10:54:26', 0, NULL, NULL),
(51, 'YOGYAKARTA', 11, 'ridargustia', '2021-04-19 13:26:37', '', NULL, 0, NULL, NULL),
(52, 'FAKULTAS KEGURUAN DAN ILMU PENGETAHUAN', 10, 'ridargustia', '2021-04-19 13:47:17', 'rektoruad', '2021-04-21 13:23:48', 0, NULL, NULL),
(53, 'FAKULTAS EKONOMI DAN BISNIS', 10, 'rektoruad', '2021-04-21 13:21:19', '', '2021-04-21 13:24:46', 0, NULL, NULL),
(54, 'FAKULTAS KEDOKTERAN DAN ILMU KESEHATAN', 12, 'ridargustia', '2021-05-08 15:44:08', '', NULL, 0, NULL, NULL),
(56, 'FAKULTAS TEKNIK', 12, 'rektorumy', '2021-05-08 16:47:25', 'rektorumy', '2021-05-08 16:48:36', 0, NULL, NULL),
(57, 'FAKULTAS TEKNIK', 13, 'ridargustia', '2021-10-15 15:22:10', '', NULL, 0, NULL, NULL),
(58, 'STAIA SW', 14, 'ridargustia', '2021-10-16 11:19:45', '', NULL, 0, NULL, NULL),
(59, 'FISIP', 15, 'ridargustia', '2021-12-03 22:21:57', '', NULL, 0, NULL, NULL),
(60, 'FAKULTAS A', 16, 'ridargustia', '2021-12-03 22:23:02', '', NULL, 0, NULL, NULL),
(61, 'FAKULTAS A', 17, 'ridargustia', '2021-12-03 22:23:54', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id_company` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_desc` mediumtext NOT NULL,
  `company_address` mediumtext NOT NULL,
  `company_maps` mediumtext NOT NULL,
  `company_phone` varchar(50) NOT NULL,
  `company_phone2` varchar(50) NOT NULL,
  `company_fax` varchar(50) NOT NULL,
  `company_email` varchar(100) NOT NULL,
  `company_gmail` varchar(50) NOT NULL,
  `company_photo` mediumtext NOT NULL,
  `company_photo_thumb` mediumtext NOT NULL,
  `created_by` char(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(50) NOT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id_company`, `company_name`, `company_desc`, `company_address`, `company_maps`, `company_phone`, `company_phone2`, `company_fax`, `company_email`, `company_gmail`, `company_photo`, `company_photo_thumb`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 'EduArsip', '<p>EduArsip adalah Perusahaan yang bergerak dibidang pengelolaan arsip di Indonesia</p>', 'Graha PBMT Indonesia Lantai 2, Jl. Ring Road Bar. No.66, Baturan, Trihanggo, Kec. Gamping, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55291', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63248.79889074844!2d110.31197864161997!3d-7.7845311706327145!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7a58865904a943%3A0xa0c11184a57f1f85!2sGraha%20PBMT%20Perhimpunan%20BMT%20Indonesia!5e0!3m2!1sen!2sid!4v1595374788862!5m2!1sen!2sid\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\" tabindex=\"0\"></iframe>\r\n', '08976843114', '081262215939', '-', 'info@eduarsip.id', 'joneduarsip@gmail.com', 'eduarsip20210116163119.png', 'eduarsip20210116163119_thumb.png', '', '2017-11-09 06:45:34', '', '2021-03-31 14:04:49');

-- --------------------------------------------------------

--
-- Table structure for table `data_access`
--

CREATE TABLE `data_access` (
  `id_data_access` int(11) NOT NULL,
  `data_access_name` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_access`
--

INSERT INTO `data_access` (`id_data_access`, `data_access_name`, `color`) VALUES
(1, 'Read', 'primary'),
(2, 'Create', 'info'),
(3, 'Update', 'warning'),
(4, 'Delete', 'danger'),
(5, 'Restore', 'success');

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `id_divisi` int(11) NOT NULL,
  `divisi_name` varchar(100) NOT NULL,
  `divisi_slug` varchar(100) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete_divisi` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `divisi_name`, `divisi_slug`, `instansi_id`, `cabang_id`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_divisi`, `deleted_by`, `deleted_at`) VALUES
(39, 'TEKNIK INFORMATIKA', 'teknik-informatika', 10, 50, '2021-04-05 21:32:00', 'ridargustia', 'ridargustia', '2021-04-06 15:01:35', 0, NULL, NULL),
(40, 'IT', 'it', 11, 51, '2021-04-19 13:28:34', 'ridargustia', '', '2021-04-19 13:29:04', 0, NULL, NULL),
(41, 'TEKNIK KIMIA', 'teknik-kimia', 10, 50, '2021-04-19 13:48:51', 'ridargustia', '', NULL, 0, NULL, NULL),
(42, 'PENDIDIKAN MATEMATIKA', 'pendidikan-matematika', 10, 52, '2021-04-19 13:49:52', 'ridargustia', '', NULL, 0, NULL, NULL),
(43, 'PENDIDIKAN BIOLOGI', 'pendidikan-biologi', 10, 52, '2021-04-19 13:50:47', 'ridargustia', '', NULL, 0, NULL, NULL),
(44, 'ILMU EKONOMI', 'ilmu-ekonomi', 10, 53, '2021-04-21 13:25:48', 'rektoruad', 'rektoruad', '2021-04-21 13:29:02', 0, NULL, NULL),
(46, 'TEKNIK ELEKTRO', 'teknik-elektro', 10, 50, '2021-04-21 14:31:28', 'dekanfti', 'dekanfti', '2021-04-21 14:32:36', 0, NULL, NULL),
(47, 'PENDIDIKAN DOKTER', 'pendidikan-dokter', 12, 54, '2021-05-08 15:50:41', 'ridargustia', '', NULL, 0, NULL, NULL),
(49, 'ILMU TEKNIK', 'ilmu-teknik', 12, 56, '2021-05-08 16:59:09', 'rektorumy', '', NULL, 0, NULL, NULL),
(50, 'ILMU KEPERAWATAN', 'ilmu-keperawatan', 12, 54, '2021-05-12 15:10:16', 'rektorumy', 'rektorumy', '2021-05-12 15:12:29', 0, NULL, NULL),
(51, 'TEKNIK INFORMATIKA', 'teknik-informatika', 13, 57, '2021-10-15 15:22:59', 'ridargustia', '', NULL, 0, NULL, NULL),
(52, 'ILMU ALQURAN DAN TAFSIR (IAT)', 'ilmu-alquran-dan-tafsir-iat', 14, 58, '2021-10-16 11:20:36', 'ridargustia', '', NULL, 0, NULL, NULL),
(53, 'EKONOMI SYARIAH (ES)', 'ekonomi-syariah-es', 14, 58, '2021-10-16 11:21:02', 'ridargustia', '', NULL, 0, NULL, NULL),
(54, 'MANAJEMEN PENDIDIKAN ISLAM (MPI)', 'manajemen-pendidikan-islam-mpi', 14, 58, '2021-10-16 11:21:40', 'ridargustia', '', NULL, 0, NULL, NULL),
(55, 'PRODI A', 'prodi-a', 15, 59, '2021-12-03 22:25:08', 'ridargustia', '', NULL, 0, NULL, NULL),
(56, 'PRODI A', 'prodi-a', 16, 60, '2021-12-03 22:25:35', 'ridargustia', '', '2021-12-16 11:24:36', 1, 'kusriner', '2021-12-16 11:24:00'),
(57, 'PRODI A', 'prodi-a', 17, 61, '2021-12-03 22:26:00', 'ridargustia', '', NULL, 0, NULL, NULL),
(58, 'AKUNTANSI', 'akuntansi', 17, 61, '2021-12-04 16:39:47', 'lilyidayu', 'lilyidayu', '2021-12-04 16:40:07', 0, NULL, NULL),
(59, 'S1 KEHUTANAN', 's1-kehutanan', 16, 60, '2021-12-16 11:21:25', 'kusriner', '', NULL, 0, NULL, NULL),
(60, 'D3 KONSERVASI SUMBER DAYA  HUTAN', 'd3-konservasi-sumber-daya-hutan', 16, 60, '2021-12-16 11:22:02', 'kusriner', '', NULL, 0, NULL, NULL),
(61, 'D3 MANAJEMEN HUTAN ALAM PRODUKSI', 'd3-manajemen-hutan-alam-produksi', 16, 60, '2021-12-16 11:22:41', 'kusriner', '', NULL, 0, NULL, NULL),
(62, 'D3 BUDIDAYA HUTAN', 'd3-budidaya-hutan', 16, 60, '2021-12-16 11:23:04', 'kusriner', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `footer`
--

CREATE TABLE `footer` (
  `id_footer` int(11) NOT NULL,
  `content` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `footer`
--

INSERT INTO `footer` (`id_footer`, `content`) VALUES
(1, 'Copyright©2021EduArsip');

-- --------------------------------------------------------

--
-- Table structure for table `instansi`
--

CREATE TABLE `instansi` (
  `id_instansi` int(11) NOT NULL,
  `instansi_name` varchar(250) NOT NULL,
  `instansi_address` mediumtext NOT NULL,
  `instansi_phone` varchar(20) NOT NULL,
  `instansi_img` mediumtext NOT NULL,
  `instansi_img_thumb` mediumtext NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete_instansi` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `instansi`
--

INSERT INTO `instansi` (`id_instansi`, `instansi_name`, `instansi_address`, `instansi_phone`, `instansi_img`, `instansi_img_thumb`, `is_active`, `active_date`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_instansi`, `deleted_by`, `deleted_at`) VALUES
(10, 'Universitas Ahmad Dahlan', 'Yogyakarta, Indonesia', '089625462588', '20210406105744.jpg', '20210406105744_thumb.jpg', 1, '2022-02-24', '2021-04-05 21:28:56', 'ridargustia', 'rektoruad', '2021-04-06 10:57:44', 0, NULL, NULL),
(11, 'EduArsip', 'Yoyakarta', '08967653782', 'eduarsip20210223210201.jpg', 'eduarsip20210223210201_thumb.jpg', 1, '2021-04-19', '2021-04-19 13:24:01', 'ridargustia', '', NULL, 0, NULL, NULL),
(12, 'Universitas Muhammadiyah Yogyakarta', 'Kampus Terpadu UMY, Jl. Brawijaya, Kasihan, Bantul, Yogyakarta 55183', '0274387656', 'universitas-muhammadiyah-yogyakarta20210508153816.png', 'universitas-muhammadiyah-yogyakarta20210508153816_thumb.png', 1, '2025-12-10', '2021-05-08 15:38:17', 'ridargustia', 'rektorumy', '2021-05-08 20:37:52', 0, NULL, NULL),
(13, 'Universitas Riyadi', 'Yogyakarta', '0274650621', 'universitas-riyadi20211015152055.jpg', 'universitas-riyadi20211015152055_thumb.jpg', 1, '2021-12-15', '2021-10-15 15:20:55', 'ridargustia', '', NULL, 0, NULL, NULL),
(14, 'STAIA SW MAGELANG', 'Magelang', '123456789', 'staia-sw-magelang20211016111816.jpg', 'staia-sw-magelang20211016111816_thumb.jpg', 0, '2021-12-15', '2021-10-16 11:18:16', 'ridargustia', 'ridargustia', '2021-12-20 14:19:37', 0, NULL, NULL),
(15, 'UNIVERSITAS BRAWIJAYA', '............', '1234567890', 'universitas-brawijaya20211203221902.jpg', 'universitas-brawijaya20211203221902_thumb.jpg', 0, '2021-12-19', '2021-12-03 22:19:02', 'ridargustia', 'ridargustia', '2021-12-20 14:18:43', 0, NULL, NULL),
(16, 'UNIVERSITAS PAPUA', '...........', '1234567890', 'universitas-papua20211203221955.jpg', 'universitas-papua20211203221955_thumb.jpg', 0, '2021-12-19', '2021-12-03 22:19:55', 'ridargustia', 'ridargustia', '2021-12-20 14:19:10', 0, NULL, NULL),
(17, 'UNIVERSITAS AHMAD DAHLAN', '..........', '1234567890', 'universitas-ahmad-dahlan20211203222107.jpg', 'universitas-ahmad-dahlan20211203222107_thumb.jpg', 0, '2021-12-19', '2021-12-03 22:21:07', 'ridargustia', 'ridargustia', '2021-12-20 14:19:53', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_arsip`
--

CREATE TABLE `jenis_arsip` (
  `id_jenis` int(11) NOT NULL,
  `jenis_name` varchar(100) NOT NULL,
  `jenis_slug` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete_jenis` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_arsip`
--

INSERT INTO `jenis_arsip` (`id_jenis`, `jenis_name`, `jenis_slug`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_jenis`, `deleted_by`, `deleted_at`) VALUES
(1, 'Audio', 'audio', '2020-01-09 06:50:15', '', '', '2020-03-08 21:11:01', 0, NULL, NULL),
(2, 'Video', 'video', '2020-01-09 06:50:15', '', '', '2020-03-08 21:11:01', 0, NULL, NULL),
(3, 'Gambar', 'gambar', '2020-01-09 06:50:15', '', '', '2020-03-08 21:11:01', 0, NULL, NULL),
(4, 'Text (file)', 'text-file', '2020-01-09 06:50:15', '', '', '2020-03-08 21:11:01', 0, NULL, NULL),
(5, 'Multy', 'multy', '2020-03-28 13:03:48', '', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log_queries`
--

CREATE TABLE `log_queries` (
  `id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(15) NOT NULL,
  `user_agent` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_queries`
--

INSERT INTO `log_queries` (`id`, `content`, `created_by`, `created_at`, `ip_address`, `user_agent`) VALUES
(1, 'UPDATE `users` SET `password` = \'$2y$10$8fJYZqH/dt7LN7EEGtKGSO3dVCztN3SyswREK7Hm/pfhzqwjJCmIG\'\nWHERE `id_users` = \'47\'', 'Ridar Gustia Priatama', '2021-04-05 18:44:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(2, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Ridar MasterAdmin\', \'\', \'\', \'1\', \'\', \'\', \'ridarmasteradmin@gmail.com\', \'ridarmasteradmin\', \'$2y$10$bg7ssmESowdZiZqAOYTvkuKLdczu1NwiKPMzrvXZqeqmY8RPuXyZe\', \'9\', \'49\', \'37\', \'1\', \'ridargustia\', \'::1\')', 'Ridar Gustia Priatama', '2021-04-05 18:47:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(3, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (48, \'1\')', 'Ridar Gustia Priatama', '2021-04-05 18:47:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(4, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (48, \'2\')', 'Ridar Gustia Priatama', '2021-04-05 18:47:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(5, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (48, \'3\')', 'Ridar Gustia Priatama', '2021-04-05 18:47:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(6, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (48, \'4\')', 'Ridar Gustia Priatama', '2021-04-05 18:47:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(7, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (48, \'5\')', 'Ridar Gustia Priatama', '2021-04-05 18:47:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(8, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Ridar SuperAdmin\', \'\', \'\', \'1\', \'\', \'\', \'ridarsuperadmin@gmail.com\', \'ridarsuperadmin\', \'$2y$10$DOYjP.kJvH31JJBH9drMoOQTSVefbXm8mYg2oeW0FGgrqYV2rJIZ.\', \'9\', \'49\', \'36\', \'2\', \'ridargustia\', \'::1\')', 'Ridar Gustia Priatama', '2021-04-05 18:49:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(9, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (49, \'1\')', 'Ridar Gustia Priatama', '2021-04-05 18:49:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(10, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (49, \'2\')', 'Ridar Gustia Priatama', '2021-04-05 18:49:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(11, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (49, \'3\')', 'Ridar Gustia Priatama', '2021-04-05 18:49:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(12, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (49, \'4\')', 'Ridar Gustia Priatama', '2021-04-05 18:49:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(13, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (49, \'5\')', 'Ridar Gustia Priatama', '2021-04-05 18:49:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(14, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Ridar Admin\', \'\', \'\', \'1\', \'\', \'\', \'ridaradmin@gmail.com\', \'ridaradmin\', \'$2y$10$X9ql3UgHUXxaPDT7070fE.8O0na7TKE2le840iO6aAq9SoSyOJ/Ye\', \'9\', \'49\', \'37\', \'3\', \'ridargustia\', \'::1\')', 'Ridar Gustia Priatama', '2021-04-05 18:50:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(15, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (50, \'1\')', 'Ridar Gustia Priatama', '2021-04-05 18:50:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(16, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (50, \'2\')', 'Ridar Gustia Priatama', '2021-04-05 18:50:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(17, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (50, \'3\')', 'Ridar Gustia Priatama', '2021-04-05 18:50:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(18, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (50, \'4\')', 'Ridar Gustia Priatama', '2021-04-05 18:50:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(19, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (50, \'5\')', 'Ridar Gustia Priatama', '2021-04-05 18:50:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(20, 'UPDATE `users` SET `name` = \'Ridar SuperAdmin\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'ridarsuperadmin@gmail.com\', `username` = \'ridarsuperadmin\', `instansi_id` = \'9\', `cabang_id` = \'49\', `divisi_id` = \'37\', `usertype_id` = \'2\', `modified_by` = \'ridargustia\'\nWHERE `id_users` = \'49\'', 'Ridar Gustia Priatama', '2021-04-05 18:51:02', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(21, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'49\', \'1\')', 'Ridar Gustia Priatama', '2021-04-05 18:51:02', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(22, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'49\', \'2\')', 'Ridar Gustia Priatama', '2021-04-05 18:51:02', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(23, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'49\', \'3\')', 'Ridar Gustia Priatama', '2021-04-05 18:51:02', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(24, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'49\', \'4\')', 'Ridar Gustia Priatama', '2021-04-05 18:51:02', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(25, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'49\', \'5\')', 'Ridar Gustia Priatama', '2021-04-05 18:51:02', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(26, 'INSERT INTO `instansi` (`instansi_name`, `instansi_address`, `instansi_phone`, `active_date`, `is_active`, `created_by`) VALUES (\'SD IT Hidayatullah\', \'Yogyakarta, Indonesia\', \'089625462588\', \'2022-02-24\', \'1\', \'ridargustia\')', 'Ridar Gustia Priatama', '2021-04-05 21:28:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(27, 'INSERT INTO `cabang` (`cabang_name`, `instansi_id`, `created_by`) VALUES (\'YOGYAKARTA\', \'10\', \'ridargustia\')', 'Ridar Gustia Priatama', '2021-04-05 21:29:50', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(28, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'10\', \'50\', \'Tata Usaha\', \'tata-usaha\', \'ridargustia\')', 'Ridar Gustia Priatama', '2021-04-05 21:32:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(29, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Kepala Sekolah\', \'\', \'\', \'1\', \'\', \'\', \'kepalasekolah@gmail.com\', \'kepalasekolah\', \'$2y$10$LIHZm2RO2dMoQaOg4.ZUEOvc4U8EMnlKU8NyOl2yoA6xFno.eihPS\', \'10\', \'50\', \'39\', \'2\', \'ridargustia\', \'::1\')', 'Ridar Gustia Priatama', '2021-04-05 21:36:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(30, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (51, \'1\')', 'Ridar Gustia Priatama', '2021-04-05 21:36:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(31, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (51, \'2\')', 'Ridar Gustia Priatama', '2021-04-05 21:36:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(32, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (51, \'3\')', 'Ridar Gustia Priatama', '2021-04-05 21:36:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(33, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (51, \'4\')', 'Ridar Gustia Priatama', '2021-04-05 21:36:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(34, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (51, \'5\')', 'Ridar Gustia Priatama', '2021-04-05 21:36:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(35, 'UPDATE `instansi` SET `instansi_name` = \'Universitas Ahmad Dahlan\', `instansi_address` = \'Yogyakarta, Indonesia\', `instansi_phone` = \'089625462588\', `active_date` = \'2022-02-24\', `is_active` = \'1\', `instansi_img` = \'universitas-ahmad-dahlan20210406105136.png\', `instansi_img_thumb` = \'universitas-ahmad-dahlan20210406105136_thumb.png\', `modified_by` = \'ridargustia\'\nWHERE `id_instansi` = \'10\'', 'Ridar Gustia Priatama', '2021-04-06 10:51:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(36, 'UPDATE `users` SET `name` = \'Rektor\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'rektoruad@gmail.com\', `username` = \'rektoruad\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `usertype_id` = \'1\', `modified_by` = \'ridargustia\'\nWHERE `id_users` = \'51\'', 'Ridar Gustia Priatama', '2021-04-06 10:53:23', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(37, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'51\', \'1\')', 'Ridar Gustia Priatama', '2021-04-06 10:53:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(38, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'51\', \'2\')', 'Ridar Gustia Priatama', '2021-04-06 10:53:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(39, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'51\', \'3\')', 'Ridar Gustia Priatama', '2021-04-06 10:53:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(40, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'51\', \'4\')', 'Ridar Gustia Priatama', '2021-04-06 10:53:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(41, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'51\', \'5\')', 'Ridar Gustia Priatama', '2021-04-06 10:53:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(42, 'UPDATE `cabang` SET `cabang_name` = \'FAKULTAS TEKNOLOGI INDUSTRI\', `instansi_id` = \'10\', `modified_by` = \'ridargustia\'\nWHERE `id_cabang` = \'50\'', 'Ridar Gustia Priatama', '2021-04-06 10:54:26', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(43, 'UPDATE `divisi` SET `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_name` = \'REKTOR\', `divisi_slug` = \'rektor\', `modified_by` = \'ridargustia\'\nWHERE `id_divisi` = \'39\'', 'Ridar Gustia Priatama', '2021-04-06 10:55:09', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(44, 'UPDATE `users` SET `name` = \'Rektor UAD\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'rektoruad@gmail.com\', `username` = \'rektoruad\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `usertype_id` = \'1\', `modified_by` = \'ridargustia\'\nWHERE `id_users` = \'51\'', 'Ridar Gustia Priatama', '2021-04-06 10:55:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(45, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'51\', \'1\')', 'Ridar Gustia Priatama', '2021-04-06 10:55:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(46, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'51\', \'2\')', 'Ridar Gustia Priatama', '2021-04-06 10:55:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(47, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'51\', \'3\')', 'Ridar Gustia Priatama', '2021-04-06 10:55:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(48, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'51\', \'4\')', 'Ridar Gustia Priatama', '2021-04-06 10:55:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(49, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'51\', \'5\')', 'Ridar Gustia Priatama', '2021-04-06 10:55:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(50, 'UPDATE `users` SET `password` = \'$2y$10$wjGnHI5HQ00SvjSURfid8eqZkhBBWewaaiWlPzYIH6OMszOOwHzZi\'\nWHERE `id_users` = \'51\'', 'Rektor UAD', '2021-04-06 10:57:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(51, 'UPDATE `instansi` SET `instansi_address` = \'Yogyakarta, Indonesia\', `instansi_phone` = \'089625462588\', `instansi_img` = \'20210406105744.jpg\', `instansi_img_thumb` = \'20210406105744_thumb.jpg\', `modified_by` = \'rektoruad\'\nWHERE `id_instansi` = \'10\'', 'Rektor UAD', '2021-04-06 10:57:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(52, 'UPDATE `divisi` SET `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_name` = \'TEKNIK INFORMATIKA\', `divisi_slug` = \'teknik-informatika\', `modified_by` = \'ridargustia\'\nWHERE `id_divisi` = \'39\'', 'Ridar Gustia Priatama', '2021-04-06 15:01:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(53, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'51\', \'-\', \'-\', \'-\', \'-\', \'-\', \'123\', \'TEST ARSIP\', \'Deskripsi\', \'0\', \'2021-04-30\', \'1\', \'1\', \'ridargustia\')', 'Ridar Gustia Priatama', '2021-04-06 15:05:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(54, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (0, \'4\')', 'Ridar Gustia Priatama', '2021-04-06 15:05:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(55, 'UPDATE `divisi` SET `is_delete_divisi` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-04-07 12:40:pm\'\nWHERE `id_divisi` = \'38\'', 'Ridar Gustia Priatama', '2021-04-07 12:40:18', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(56, 'UPDATE `divisi` SET `is_delete_divisi` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_divisi` = \'38\'', 'Ridar Gustia Priatama', '2021-04-07 12:40:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(57, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `created_by`) VALUES (\'1\', \'10\', \'50\', \'ridargustia\')', 'Ridar Gustia Priatama', '2021-04-07 13:12:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(58, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `created_by`) VALUES (\'1\', \'10\', \'50\', \'ridargustia\')', 'Ridar Gustia Priatama', '2021-04-07 13:20:50', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(59, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `created_by`) VALUES (\'Ruang Arsip\', \'10\', \'50\', \'ridargustia\')', 'Ridar Gustia Priatama', '2021-04-07 14:30:18', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(60, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `created_by`) VALUES (\'1\', \'10\', \'50\', \'ridargustia\')', 'Ridar Gustia Priatama', '2021-04-07 14:30:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(61, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `created_by`) VALUES (\'1\', \'10\', \'50\', \'ridargustia\')', 'Ridar Gustia Priatama', '2021-04-07 14:31:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(62, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'51\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123\', \'Surat Keputusan Rektor\', \'Deskripsi\', \'0\', \'2021-04-29\', \'1\', \'1\', \'ridargustia\')', 'Ridar Gustia Priatama', '2021-04-07 14:32:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(63, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (1, \'4\')', 'Ridar Gustia Priatama', '2021-04-07 14:32:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(64, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'51\', \'32\', \'54\', \'1\', \'45\', \'1\', \'456\', \'Surat Edaran Rektor\', \'Deskripsi\', \'1\', \'2021-04-06\', \'1\', \'1\', \'ridargustia\')', 'Ridar Gustia Priatama', '2021-04-07 14:37:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(65, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (2, \'4\')', 'Ridar Gustia Priatama', '2021-04-07 14:37:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(66, 'UPDATE `arsip` SET `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `user_id` = \'51\', `lokasi_id` = \'32\', `rak_id` = \'54\', `box_id` = \'1\', `map_id` = \'45\', `baris_id` = \'1\', `no_arsip` = \'456\', `arsip_name` = \'Surat Edaran Rektor\', `deskripsi_arsip` = \'Deskripsi\', `keterangan` = \'1\', `masa_retensi` = \'2021-04-05\', `status_retensi` = 0, `status_file` = \'1\', `modified_by` = \'ridargustia\'\nWHERE `id_arsip` = \'2\'', 'Ridar Gustia Priatama', '2021-04-07 14:38:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(67, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (\'2\', \'4\')', 'Ridar Gustia Priatama', '2021-04-07 14:38:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(68, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `created_by`) VALUES (\'1\', \'9\', \'49\', \'ridarsuperadmin\')', 'Ridar SuperAdmin', '2021-04-07 14:58:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(69, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `created_by`) VALUES (\'1\', \'9\', \'49\', \'ridarsuperadmin\')', 'Ridar SuperAdmin', '2021-04-07 14:58:53', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(70, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'9\', \'49\', \'37\', \'50\', \'31\', \'53\', \'2\', \'44\', \'2\', \'789\', \'Daily Activity\', \'Deskripsi\', \'1\', \'2021-04-06\', \'0\', \'1\', \'ridarsuperadmin\')', 'Ridar SuperAdmin', '2021-04-07 15:00:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(71, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (3, \'4\')', 'Ridar SuperAdmin', '2021-04-07 15:00:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(72, 'UPDATE `arsip` SET `instansi_id` = \'9\', `cabang_id` = \'49\', `divisi_id` = \'37\', `user_id` = \'50\', `lokasi_id` = \'31\', `rak_id` = \'53\', `box_id` = \'2\', `map_id` = \'44\', `baris_id` = \'2\', `no_arsip` = \'789\', `arsip_name` = \'Daily Activity\', `deskripsi_arsip` = \'Deskripsi\', `keterangan` = \'1\', `masa_retensi` = \'2021-04-22\', `status_retensi` = 1, `status_file` = \'0\', `modified_by` = \'ridarsuperadmin\'\nWHERE `id_arsip` = \'3\'', 'Ridar SuperAdmin', '2021-04-07 15:01:32', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(73, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (\'3\', \'4\')', 'Ridar SuperAdmin', '2021-04-07 15:01:32', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(74, 'UPDATE `arsip` SET `instansi_id` = \'9\', `cabang_id` = \'49\', `divisi_id` = \'37\', `user_id` = \'50\', `lokasi_id` = \'31\', `rak_id` = \'53\', `box_id` = \'2\', `map_id` = \'44\', `baris_id` = \'2\', `no_arsip` = \'789\', `arsip_name` = \'Daily Activity\', `deskripsi_arsip` = \'Deskripsi\', `keterangan` = \'1\', `masa_retensi` = \'2021-04-06\', `status_retensi` = 0, `status_file` = \'0\', `modified_by` = \'ridarsuperadmin\'\nWHERE `id_arsip` = \'3\'', 'Ridar SuperAdmin', '2021-04-07 15:03:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(75, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (\'3\', \'4\')', 'Ridar SuperAdmin', '2021-04-07 15:03:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(76, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-07 15:05:pm\'\nWHERE `id_arsip` = \'3\'', 'Ridar Admin', '2021-04-07 15:05:18', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(77, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'3\'', 'Ridar Admin', '2021-04-07 15:05:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(78, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-07 15:07:pm\'\nWHERE `id_arsip` = \'2\'', 'Rektor UAD', '2021-04-07 15:07:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(79, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'2\'', 'Rektor UAD', '2021-04-07 15:08:26', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(80, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-07 16:14:pm\'\nWHERE `id_arsip` = \'2\'', 'Rektor UAD', '2021-04-07 16:14:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(81, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'2\'', 'Rektor UAD', '2021-04-07 16:15:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(82, 'UPDATE `arsip` SET `instansi_id` = \'9\', `cabang_id` = \'49\', `divisi_id` = \'37\', `user_id` = \'50\', `lokasi_id` = \'31\', `rak_id` = \'53\', `box_id` = \'2\', `map_id` = \'44\', `baris_id` = \'2\', `no_arsip` = \'789\', `arsip_name` = \'Daily Activity\', `deskripsi_arsip` = \'Deskripsi\', `keterangan` = \'1\', `masa_retensi` = \'2021-04-15\', `status_retensi` = 1, `status_file` = \'0\', `modified_by` = \'ridarsuperadmin\'\nWHERE `id_arsip` = \'3\'', 'Ridar SuperAdmin', '2021-04-07 16:19:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(83, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (\'3\', \'4\')', 'Ridar SuperAdmin', '2021-04-07 16:19:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(84, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-07 16:20:pm\'\nWHERE `id_arsip` = \'3\'', 'Ridar SuperAdmin', '2021-04-07 16:20:53', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(85, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'3\'', 'Ridar SuperAdmin', '2021-04-07 16:21:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(86, 'UPDATE `arsip` SET `instansi_id` = \'9\', `cabang_id` = \'49\', `divisi_id` = \'37\', `user_id` = \'50\', `lokasi_id` = \'31\', `rak_id` = \'53\', `box_id` = \'2\', `map_id` = \'44\', `baris_id` = \'2\', `no_arsip` = \'789\', `arsip_name` = \'Daily Activity\', `deskripsi_arsip` = \'Deskripsi\', `keterangan` = \'1\', `masa_retensi` = \'2021-04-11\', `status_retensi` = 1, `status_file` = \'0\', `modified_by` = \'ridaradmin\'\nWHERE `id_arsip` = \'3\'', 'Ridar Admin', '2021-04-07 16:28:36', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(87, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (\'3\', \'4\')', 'Ridar Admin', '2021-04-07 16:28:36', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(88, 'UPDATE `arsip` SET `instansi_id` = \'9\', `cabang_id` = \'49\', `divisi_id` = \'37\', `user_id` = \'50\', `lokasi_id` = \'31\', `rak_id` = \'53\', `box_id` = \'2\', `map_id` = \'44\', `baris_id` = \'2\', `no_arsip` = \'789\', `arsip_name` = \'Daily Activity\', `deskripsi_arsip` = \'Deskripsi\', `keterangan` = \'1\', `masa_retensi` = \'2021-04-29\', `status_retensi` = 1, `status_file` = \'0\', `modified_by` = \'ridaradmin\'\nWHERE `id_arsip` = \'3\'', 'Ridar Admin', '2021-04-07 16:29:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(89, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (\'3\', \'4\')', 'Ridar Admin', '2021-04-07 16:29:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(90, 'UPDATE `arsip` SET `instansi_id` = \'9\', `cabang_id` = \'49\', `divisi_id` = \'37\', `user_id` = \'50\', `lokasi_id` = \'31\', `rak_id` = \'53\', `box_id` = \'2\', `map_id` = \'44\', `baris_id` = \'2\', `no_arsip` = \'789\', `arsip_name` = \'Daily Activity\', `deskripsi_arsip` = \'Deskripsi\', `keterangan` = \'1\', `masa_retensi` = \'2021-05-07\', `status_retensi` = 1, `status_file` = \'0\', `modified_by` = \'ridaradmin\'\nWHERE `id_arsip` = \'3\'', 'Ridar Admin', '2021-04-07 16:30:04', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(91, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (\'3\', \'4\')', 'Ridar Admin', '2021-04-07 16:30:04', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(92, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-07 16:35:pm\'\nWHERE `id_arsip` = \'3\'', 'Ridar Admin', '2021-04-07 16:35:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(93, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'3\'', 'Ridar Admin', '2021-04-07 16:35:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(94, 'UPDATE `arsip` SET `instansi_id` = \'9\', `cabang_id` = \'49\', `divisi_id` = \'37\', `user_id` = \'50\', `lokasi_id` = \'31\', `rak_id` = \'53\', `box_id` = \'2\', `map_id` = \'44\', `baris_id` = \'2\', `no_arsip` = \'789\', `arsip_name` = \'Daily Activity\', `deskripsi_arsip` = \'Deskripsi\', `keterangan` = \'1\', `masa_retensi` = \'2021-04-17\', `status_retensi` = 1, `status_file` = \'0\', `modified_by` = \'ridaradmin\'\nWHERE `id_arsip` = \'3\'', 'Ridar Admin', '2021-04-07 16:36:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(95, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (\'3\', \'4\')', 'Ridar Admin', '2021-04-07 16:36:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(96, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-07 16:37:pm\'\nWHERE `id_arsip` = \'3\'', 'Ridar Admin', '2021-04-07 16:37:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(97, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'3\'', 'Ridar Admin', '2021-04-07 16:37:21', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(98, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2021-04-07\', \'2021-04-09\', \'2\', \'50\', \'10\', \'50\', \'39\', \'ridargustia\')', 'Ridar Gustia Priatama', '2021-04-07 16:48:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(99, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'2\'', 'Ridar Gustia Priatama', '2021-04-07 16:48:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(100, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `id_peminjaman` = \'1\'', 'Ridar Gustia Priatama', '2021-04-07 17:02:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(101, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'2\'', 'Ridar Gustia Priatama', '2021-04-07 17:02:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(102, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2021-04-07\', \'1\', \'2\', \'50\', \'10\', \'50\', \'39\', \'ridargustia\')', 'Ridar Gustia Priatama', '2021-04-07 17:02:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(103, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-04-07 17:10:pm\'\nWHERE `id_peminjaman` = \'1\'', 'Ridar Gustia Priatama', '2021-04-07 17:10:45', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(104, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_peminjaman` = \'1\'', 'Ridar Gustia Priatama', '2021-04-07 17:11:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(105, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2021-04-07\', \'2021-04-09\', \'3\', \'50\', \'9\', \'49\', \'37\', \'ridarsuperadmin\')', 'Ridar SuperAdmin', '2021-04-07 21:04:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(106, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'3\'', 'Ridar SuperAdmin', '2021-04-07 21:04:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(107, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2021/04/08\', \'2\', \'3\', \'50\', \'9\', \'49\', \'37\', \'ridarsuperadmin\')', 'Ridar SuperAdmin', '2021-04-07 21:07:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(108, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'3\'', 'Ridar SuperAdmin', '2021-04-07 21:07:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(109, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `arsip_id` = \'3\'', 'Ridar SuperAdmin', '2021-04-07 21:07:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(110, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Dekan FTI\', \'\', \'\', \'1\', \'\', \'\', \'dekanfti@gmail.com\', \'dekanfti\', \'$2y$10$hL1ccmhVnkBeMyrMVSPBbuNQUXx8P1DYIZBlJEcnLjK9vflQAxWae\', \'10\', \'50\', \'39\', \'2\', \'rektoruad\', \'::1\')', 'Rektor UAD', '2021-04-07 21:53:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(111, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (52, \'1\')', 'Rektor UAD', '2021-04-07 21:53:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(112, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (52, \'2\')', 'Rektor UAD', '2021-04-07 21:53:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(113, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (52, \'3\')', 'Rektor UAD', '2021-04-07 21:53:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(114, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (52, \'4\')', 'Rektor UAD', '2021-04-07 21:53:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(115, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (52, \'5\')', 'Rektor UAD', '2021-04-07 21:53:38', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(116, 'UPDATE `menu` SET `menu_name` = \'PROGRAM STUDI\', `menu_controller` = \'divisi\', `menu_function` = \'#\', `menu_icon` = \'fa-map-signs\', `order_no` = \'12\'\nWHERE `id_menu` = \'13\'', 'Ridar Gustia Priatama', '2021-04-07 21:59:02', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(117, 'UPDATE `menu` SET `menu_name` = \'PERGURUAN TINGGI\', `menu_controller` = \'instansi\', `menu_function` = \'#\', `menu_icon` = \'fa-arrows\', `order_no` = \'10\'\nWHERE `id_menu` = \'14\'', 'Ridar Gustia Priatama', '2021-04-07 22:00:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(118, 'UPDATE `menu` SET `menu_name` = \'FAKULTAS\', `menu_controller` = \'cabang\', `menu_function` = \'#\', `menu_icon` = \'fa-map-signs\', `order_no` = \'11\'\nWHERE `id_menu` = \'16\'', 'Ridar Gustia Priatama', '2021-04-07 22:01:26', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(119, 'UPDATE `submenu` SET `menu_id` = \'13\', `submenu_name` = \'Tambah Program Studi\', `submenu_function` = \'create\', `order_no` = \'1\'\nWHERE `id_submenu` = \'29\'', 'Ridar Gustia Priatama', '2021-04-07 22:04:04', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(120, 'UPDATE `submenu` SET `menu_id` = \'13\', `submenu_name` = \'Data Program Studi\', `submenu_function` = \'index\', `order_no` = \'2\'\nWHERE `id_submenu` = \'30\'', 'Ridar Gustia Priatama', '2021-04-07 22:05:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(121, 'UPDATE `submenu` SET `menu_id` = \'14\', `submenu_name` = \'Tambah Perguruan Tinggi\', `submenu_function` = \'create\', `order_no` = \'1\'\nWHERE `id_submenu` = \'31\'', 'Ridar Gustia Priatama', '2021-04-07 22:06:01', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(122, 'UPDATE `submenu` SET `menu_id` = \'14\', `submenu_name` = \'Data Perguruan Tinggi\', `submenu_function` = \'index\', `order_no` = \'2\'\nWHERE `id_submenu` = \'32\'', 'Ridar Gustia Priatama', '2021-04-07 22:06:55', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(123, 'UPDATE `submenu` SET `menu_id` = \'16\', `submenu_name` = \'Tambah Fakultas\', `submenu_function` = \'create\', `order_no` = \'1\'\nWHERE `id_submenu` = \'37\'', 'Ridar Gustia Priatama', '2021-04-07 22:08:14', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(124, 'UPDATE `submenu` SET `menu_id` = \'16\', `submenu_name` = \'Data Fakultas\', `submenu_function` = \'index\', `order_no` = \'2\'\nWHERE `id_submenu` = \'38\'', 'Ridar Gustia Priatama', '2021-04-07 22:08:55', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(125, 'INSERT INTO `submenu` (`menu_id`, `submenu_name`, `submenu_function`, `order_no`) VALUES (\'17\', \'Add Usertype\', \'create\', \'1\')', 'Ridar Gustia Priatama', '2021-04-15 13:43:04', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(126, 'INSERT INTO `usertype` (`usertype_name`) VALUES (\'User\')', 'Ridar Gustia Priatama', '2021-04-15 14:07:08', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(127, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Petugas TU\', \'\', \'\', \'1\', \'\', \'\', \'petugastu@gmail.com\', \'petugastu\', \'$2y$10$aZzENJBrc5Z2jhjA/6Eaie0ZfIJMkispuWwrsAU.DgSwevihlL8ui\', \'10\', \'50\', \'39\', \'4\', \'ridargustia\', \'::1\')', 'Ridar Gustia Priatama', '2021-04-15 14:10:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(128, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (53, \'1\')', 'Ridar Gustia Priatama', '2021-04-15 14:10:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(129, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (53, \'2\')', 'Ridar Gustia Priatama', '2021-04-15 14:10:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(130, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (53, \'3\')', 'Ridar Gustia Priatama', '2021-04-15 14:10:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(131, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (53, \'4\')', 'Ridar Gustia Priatama', '2021-04-15 14:10:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(132, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (53, \'5\')', 'Ridar Gustia Priatama', '2021-04-15 14:10:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(133, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Mahasiswa 1\', \'\', \'\', \'1\', \'\', \'\', \'mahasiswa1@gmail.com\', \'mahasiswa1\', \'$2y$10$w1r1iLyX35hC9xGntnerv.NXKYLnopSeookU8GUXd0TzT4ADSS3jS\', \'10\', \'50\', \'39\', \'6\', \'ridargustia\', \'::1\')', 'Ridar Gustia Priatama', '2021-04-15 16:04:14', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(134, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (54, \'1\')', 'Ridar Gustia Priatama', '2021-04-15 16:04:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(135, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (54, \'2\')', 'Ridar Gustia Priatama', '2021-04-15 16:04:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(136, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (54, \'3\')', 'Ridar Gustia Priatama', '2021-04-15 16:04:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(137, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (54, \'4\')', 'Ridar Gustia Priatama', '2021-04-15 16:04:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(138, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (54, \'5\')', 'Ridar Gustia Priatama', '2021-04-15 16:04:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(139, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Kaprodi TIF\', \'\', \'\', \'1\', \'\', \'\', \'kaproditif@gmail.com\', \'kaproditif\', \'$2y$10$NACu4VvbhGwDA95JlegJ0uHzgdSKMu/jTORv9UE.UdE9O55ZtnqvK\', \'10\', \'50\', \'39\', \'3\', \'ridargustia\', \'::1\')', 'Ridar Gustia Priatama', '2021-04-15 16:12:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(140, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (55, \'1\')', 'Ridar Gustia Priatama', '2021-04-15 16:12:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(141, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (55, \'2\')', 'Ridar Gustia Priatama', '2021-04-15 16:12:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(142, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (55, \'3\')', 'Ridar Gustia Priatama', '2021-04-15 16:12:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(143, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (55, \'4\')', 'Ridar Gustia Priatama', '2021-04-15 16:12:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(144, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (55, \'5\')', 'Ridar Gustia Priatama', '2021-04-15 16:12:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(145, 'UPDATE `instansi` SET `is_delete_instansi` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-04-19 13:11:pm\'\nWHERE `id_instansi` = \'9\'', 'Ridar Gustia Priatama', '2021-04-19 13:11:53', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(146, 'UPDATE `cabang` SET `is_delete_cabang` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-04-19 13:12:pm\'\nWHERE `id_cabang` = \'49\'', 'Ridar Gustia Priatama', '2021-04-19 13:12:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(147, 'DELETE FROM `instansi`\nWHERE `id_instansi` = \'9\'', 'Ridar Gustia Priatama', '2021-04-19 13:13:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(148, 'UPDATE `users` SET `password` = \'$2y$10$k.44zdwifB4TTDDUInxqjuCgcFyUC3SgYvAXLyRvIyPt612FX.kEi\'\nWHERE `id_users` = \'56\'', 'Ridar Gustia', '2021-04-19 13:35:50', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(149, 'INSERT INTO `cabang` (`cabang_name`, `instansi_id`, `created_by`) VALUES (\'FAKULTAS KEGURUAN ILMU PENGETAHUAN\', \'10\', \'ridargustia\')', 'Ridar Gustia', '2021-04-19 13:47:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(150, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'10\', \'50\', \'TEKNIK KIMIA\', \'teknik-kimia\', \'ridargustia\')', 'Ridar Gustia', '2021-04-19 13:48:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(151, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'10\', \'52\', \'PENDIDIKAN MATEMATIKA\', \'pendidikan-matematika\', \'ridargustia\')', 'Ridar Gustia', '2021-04-19 13:49:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(152, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'10\', \'52\', \'PENDIDIKAN BIOLOGI\', \'pendidikan-biologi\', \'ridargustia\')', 'Ridar Gustia', '2021-04-19 13:50:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36');
INSERT INTO `log_queries` (`id`, `content`, `created_by`, `created_at`, `ip_address`, `user_agent`) VALUES
(153, 'UPDATE `menu` SET `menu_name` = \'PERGURUAN TINGGI\', `menu_controller` = \'instansi\', `menu_function` = \'#\', `menu_icon` = \'fa-map-signs\', `order_no` = \'10\'\nWHERE `id_menu` = \'14\'', 'Ridar Gustia', '2021-04-19 14:12:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(154, 'INSERT INTO `menu` (`menu_name`, `menu_controller`, `menu_function`, `menu_icon`, `order_no`) VALUES (\'DIVISI\', \'bagian\', \'#\', \'fa-map-signs\', \'13\')', 'Ridar Gustia', '2021-04-19 14:13:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(155, 'INSERT INTO `submenu` (`menu_id`, `submenu_name`, `submenu_function`, `order_no`) VALUES (\'17\', \'Tambah Divisi\', \'create\', \'1\')', 'Ridar Gustia', '2021-04-19 14:17:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(156, 'INSERT INTO `submenu` (`menu_id`, `submenu_name`, `submenu_function`, `order_no`) VALUES (\'17\', \'Data Divisi\', \'index\', \'2\')', 'Ridar Gustia', '2021-04-19 14:17:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(157, 'INSERT INTO `submenu` (`menu_id`, `submenu_name`, `submenu_function`, `order_no`) VALUES (\'17\', \'Recycle Bin\', \'deleted_list\', \'3\')', 'Ridar Gustia', '2021-04-19 14:18:36', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(158, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'11\', \'51\', \'40\', \'PENGEMBANGAN APLIKASI\', \'pengembangan-aplikasi\', \'ridargustia\')', 'Ridar Gustia', '2021-04-20 09:59:26', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(159, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'Mahasiswa\', \'mahasiswa\', \'ridargustia\')', 'Ridar Gustia', '2021-04-20 10:09:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(160, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'10\', \'52\', \'43\', \'DOSEN\', \'dosen\', \'ridargustia\')', 'Ridar Gustia', '2021-04-20 10:12:08', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(161, 'UPDATE `bagian` SET `instansi_id` = \'10\', `cabang_id` = \'52\', `divisi_id` = \'43\', `bagian_name` = \'MAHASISWA\', `bagian_slug` = \'mahasiswa\', `modified_by` = \'ridargustia\'\nWHERE `id_bagian` = \'4\'', 'Ridar Gustia', '2021-04-20 13:45:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(162, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-04-20 13:56:pm\'\nWHERE `id_bagian` = \'3\'', 'Ridar Gustia', '2021-04-20 13:56:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(163, 'UPDATE `bagian` SET `is_delete_bagian` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_bagian` = \'3\'', 'Ridar Gustia', '2021-04-20 14:42:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(164, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-04-20 14:52:pm\'\nWHERE `id_bagian` = \'3\'', 'Ridar Gustia', '2021-04-20 14:52:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(165, 'UPDATE `bagian` SET `is_delete_bagian` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_bagian` = \'3\'', 'Ridar Gustia', '2021-04-20 14:53:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(166, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-04-20 14:53:pm\'\nWHERE `id_bagian` = \'3\'', 'Ridar Gustia', '2021-04-20 14:53:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(167, 'DELETE FROM `bagian`\nWHERE `id_bagian` = \'3\'', 'Ridar Gustia', '2021-04-20 15:05:08', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(168, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-04-20 15:06:pm\'\nWHERE `id_bagian` = \'4\'', 'Ridar Gustia', '2021-04-20 15:06:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(169, 'UPDATE `bagian` SET `is_delete_bagian` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_bagian` = \'4\'', 'Ridar Gustia', '2021-04-20 15:06:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(170, 'INSERT INTO `cabang` (`cabang_name`, `instansi_id`, `created_by`) VALUES (\'FAKULTAS EKONOMI DAN BISNIS\', \'10\', \'rektoruad\')', 'Rektor UAD', '2021-04-21 13:21:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(171, 'UPDATE `cabang` SET `cabang_name` = \'FAKULTAS KEGURUAN ILMU DAN PENGETAHUAN\', `instansi_id` = \'10\', `modified_by` = \'rektoruad\'\nWHERE `id_cabang` = \'52\'', 'Rektor UAD', '2021-04-21 13:23:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(172, 'UPDATE `cabang` SET `cabang_name` = \'FAKULTAS KEGURUAN DAN ILMU PENGETAHUAN\', `instansi_id` = \'10\', `modified_by` = \'rektoruad\'\nWHERE `id_cabang` = \'52\'', 'Rektor UAD', '2021-04-21 13:23:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(173, 'UPDATE `cabang` SET `is_delete_cabang` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-04-21 13:24:pm\'\nWHERE `id_cabang` = \'53\'', 'Rektor UAD', '2021-04-21 13:24:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(174, 'UPDATE `cabang` SET `is_delete_cabang` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_cabang` = \'53\'', 'Rektor UAD', '2021-04-21 13:24:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(175, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'10\', \'53\', \'MANAJEMEN\', \'manajemen\', \'rektoruad\')', 'Rektor UAD', '2021-04-21 13:25:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(176, 'UPDATE `divisi` SET `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_name` = \'MANAJEMEN\', `divisi_slug` = \'manajemen\', `modified_by` = \'rektoruad\'\nWHERE `id_divisi` = \'44\'', 'Rektor UAD', '2021-04-21 13:27:23', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(177, 'UPDATE `divisi` SET `instansi_id` = \'10\', `cabang_id` = \'53\', `divisi_name` = \'MANAJEMEN\', `divisi_slug` = \'manajemen\', `modified_by` = \'rektoruad\'\nWHERE `id_divisi` = \'44\'', 'Rektor UAD', '2021-04-21 13:27:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(178, 'UPDATE `divisi` SET `instansi_id` = \'10\', `cabang_id` = \'53\', `divisi_name` = \'ILMU EKONOMI\', `divisi_slug` = \'ilmu-ekonomi\', `modified_by` = \'rektoruad\'\nWHERE `id_divisi` = \'44\'', 'Rektor UAD', '2021-04-21 13:28:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(179, 'UPDATE `divisi` SET `is_delete_divisi` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-04-21 13:28:pm\'\nWHERE `id_divisi` = \'44\'', 'Rektor UAD', '2021-04-21 13:28:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(180, 'UPDATE `divisi` SET `is_delete_divisi` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_divisi` = \'44\'', 'Rektor UAD', '2021-04-21 13:29:02', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(181, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'10\', \'53\', \'44\', \'DOSEN\', \'dosen\', \'rektoruad\')', 'Rektor UAD', '2021-04-21 13:34:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(182, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'10\', \'52\', \'42\', \'MAHASISWA\', \'mahasiswa\', \'rektoruad\')', 'Rektor UAD', '2021-04-21 13:59:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(183, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'10\', \'50\', \'41\', \'MAHASISWA\', \'mahasiswa\', \'rektoruad\')', 'Rektor UAD', '2021-04-21 14:02:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(184, 'UPDATE `bagian` SET `instansi_id` = \'10\', `cabang_id` = \'52\', `divisi_id` = \'42\', `bagian_name` = \'DOSEN\', `bagian_slug` = \'dosen\', `modified_by` = \'rektoruad\'\nWHERE `id_bagian` = \'7\'', 'Rektor UAD', '2021-04-21 14:04:09', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(185, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-04-21 14:04:pm\'\nWHERE `id_bagian` = \'6\'', 'Rektor UAD', '2021-04-21 14:04:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(186, 'UPDATE `bagian` SET `is_delete_bagian` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_bagian` = \'6\'', 'Rektor UAD', '2021-04-21 14:11:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(187, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-04-21 14:12:pm\'\nWHERE `id_bagian` = \'6\'', 'Rektor UAD', '2021-04-21 14:12:14', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(188, 'DELETE FROM `bagian`\nWHERE `id_bagian` = \'6\'', 'Rektor UAD', '2021-04-21 14:12:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(189, 'UPDATE `bagian` SET `instansi_id` = \'10\', `cabang_id` = \'53\', `divisi_id` = \'44\', `bagian_name` = \'MAHASISWA\', `bagian_slug` = \'mahasiswa\', `modified_by` = \'rektoruad\'\nWHERE `id_bagian` = \'5\'', 'Rektor UAD', '2021-04-21 14:13:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(190, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'10\', \'50\', \'TEKNIK ELEKTRO\', \'teknik-elektro\', \'dekanfti\')', 'Dekan FTI', '2021-04-21 14:14:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(191, 'UPDATE `divisi` SET `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_name` = \'TEKNIK INDUSTRI\', `divisi_slug` = \'teknik-industri\', `modified_by` = \'dekanfti\'\nWHERE `id_divisi` = \'45\'', 'Dekan FTI', '2021-04-21 14:15:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(192, 'UPDATE `divisi` SET `is_delete_divisi` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-04-21 14:15:pm\'\nWHERE `id_divisi` = \'45\'', 'Dekan FTI', '2021-04-21 14:15:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(193, 'UPDATE `divisi` SET `is_delete_divisi` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_divisi` = \'45\'', 'Dekan FTI', '2021-04-21 14:30:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(194, 'UPDATE `divisi` SET `is_delete_divisi` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-04-21 14:30:pm\'\nWHERE `id_divisi` = \'45\'', 'Dekan FTI', '2021-04-21 14:30:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(195, 'DELETE FROM `divisi`\nWHERE `id_divisi` = \'45\'', 'Dekan FTI', '2021-04-21 14:31:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(196, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'10\', \'50\', \'TEKNIK INDUSTRI\', \'teknik-industri\', \'dekanfti\')', 'Dekan FTI', '2021-04-21 14:31:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(197, 'UPDATE `divisi` SET `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_name` = \'TEKNIK ELEKTRO\', `divisi_slug` = \'teknik-elektro\', `modified_by` = \'dekanfti\'\nWHERE `id_divisi` = \'46\'', 'Dekan FTI', '2021-04-21 14:32:36', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(198, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'10\', \'50\', \'46\', \'MAHASISWA\', \'mahasiswa\', \'dekanfti\')', 'Dekan FTI', '2021-04-21 14:39:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(199, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'MAHASISWA\', \'mahasiswa\', \'dekanfti\')', 'Dekan FTI', '2021-04-21 14:54:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(200, 'UPDATE `bagian` SET `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `bagian_name` = \'TATA USAHA\', `bagian_slug` = \'tata-usaha\', `modified_by` = \'dekanfti\'\nWHERE `id_bagian` = \'10\'', 'Dekan FTI', '2021-04-21 14:55:02', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(201, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-04-21 14:55:pm\'\nWHERE `id_bagian` = \'10\'', 'Dekan FTI', '2021-04-21 14:55:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(202, 'UPDATE `bagian` SET `is_delete_bagian` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_bagian` = \'10\'', 'Dekan FTI', '2021-04-21 14:55:38', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(203, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-04-21 14:55:pm\'\nWHERE `id_bagian` = \'10\'', 'Dekan FTI', '2021-04-21 14:55:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(204, 'DELETE FROM `bagian`\nWHERE `id_bagian` = \'10\'', 'Dekan FTI', '2021-04-21 14:56:04', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(205, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'MAHASISWA\', \'mahasiswa\', \'dekanfti\')', 'Dekan FTI', '2021-04-22 11:06:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(206, 'UPDATE `bagian` SET `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `bagian_name` = \'TATA USAHA\', `bagian_slug` = \'tata-usaha\', `modified_by` = \'dekanfti\'\nWHERE `id_bagian` = \'10\'', 'Dekan FTI', '2021-04-22 11:07:18', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(207, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-04-22 11:07:am\'\nWHERE `id_bagian` = \'10\'', 'Dekan FTI', '2021-04-22 11:07:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(208, 'UPDATE `bagian` SET `is_delete_bagian` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_bagian` = \'10\'', 'Dekan FTI', '2021-04-22 11:07:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(209, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-04-22 11:08:am\'\nWHERE `id_bagian` = \'10\'', 'Dekan FTI', '2021-04-22 11:08:13', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(210, 'DELETE FROM `bagian`\nWHERE `id_bagian` = \'10\'', 'Dekan FTI', '2021-04-22 11:08:45', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(211, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'MAHASISWA\', \'mahasiswa\', \'kaproditif\')', 'Kaprodi TIF', '2021-04-22 11:22:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(212, 'UPDATE `bagian` SET `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `bagian_name` = \'TATA USAHA\', `bagian_slug` = \'tata-usaha\', `modified_by` = \'kaproditif\'\nWHERE `id_bagian` = \'11\'', 'Kaprodi TIF', '2021-04-22 11:22:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(213, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-04-22 11:22:am\'\nWHERE `id_bagian` = \'11\'', 'Kaprodi TIF', '2021-04-22 11:22:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(214, 'UPDATE `bagian` SET `is_delete_bagian` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_bagian` = \'11\'', 'Kaprodi TIF', '2021-04-22 11:28:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(215, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-04-22 11:29:am\'\nWHERE `id_bagian` = \'11\'', 'Kaprodi TIF', '2021-04-22 11:29:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(216, 'DELETE FROM `bagian`\nWHERE `id_bagian` = \'11\'', 'Kaprodi TIF', '2021-04-22 11:29:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(217, 'UPDATE `bagian` SET `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `bagian_name` = \'MAHASISWA\', `bagian_slug` = \'mahasiswa\', `modified_by` = \'kaproditif\'\nWHERE `id_bagian` = \'1\'', 'Kaprodi TIF', '2021-04-22 11:29:50', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(218, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'55\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123\', \'TEST ARSIP 1\', \'test arsip 1\', \'1\', \'2024-07-18\', \'1\', \'1\', \'ridargustia\')', 'Ridar Gustia', '2021-04-26 13:23:55', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(219, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (3, \'5\')', 'Ridar Gustia', '2021-04-26 13:23:56', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(220, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'54\', \'32\', \'54\', \'1\', \'45\', \'1\', \'789\', \'TEST ARSIP 2\', \'test arsip 2\', \'1\', \'2021-04-29\', \'1\', \'1\', \'ridargustia\')', 'Ridar Gustia', '2021-04-26 14:55:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(221, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (4, \'5\')', 'Ridar Gustia', '2021-04-26 14:55:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(222, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'54\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.1\', \'TEST ARSIP 1\', \'test arsip 1\', \'1\', \'2021-04-29\', \'1\', \'1\', \'ridargustia\')', 'Ridar Gustia', '2021-04-27 09:24:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(223, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (5, \'5\')', 'Ridar Gustia', '2021-04-27 09:24:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(224, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'55\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.1\', \'TEST ARSIP 1\', \'test arsip 1\', \'1\', \'2021-04-30\', \'1\', \'1\', \'ridargustia\')', 'Ridar Gustia', '2021-04-27 09:40:29', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(225, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (6, \'5\')', 'Ridar Gustia', '2021-04-27 09:40:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(226, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'54\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.1\', \'TEST ARSIP 3\', \'test arsip 3\', \'1\', \'2021-04-30\', \'1\', \'1\', \'ridargustia\')', 'Ridar Gustia', '2021-04-27 09:50:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(227, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (7, \'5\')', 'Ridar Gustia', '2021-04-27 09:50:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(228, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'54\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.2\', \'TEST ARSIP 3\', \'test arsip 3\', \'1\', \'2021-04-30\', \'1\', \'1\', \'ridargustia\')', 'Ridar Gustia', '2021-04-27 09:53:14', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(229, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (8, \'5\')', 'Ridar Gustia', '2021-04-27 09:53:14', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(230, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'54\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.2\', \'TEST ARSIP 4\', \'test arsip 4\', \'1\', \'2021-04-30\', \'1\', \'1\', \'ridargustia\')', 'Ridar Gustia', '2021-04-27 10:01:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(231, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (9, \'5\')', 'Ridar Gustia', '2021-04-27 10:01:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(232, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'54\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.3\', \'TEST ARSIP 5\', \'test arsip 5\', \'1\', \'2021-04-29\', \'1\', \'1\', \'rektoruad\')', 'Rektor UAD', '2021-04-27 10:08:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(233, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (10, \'5\')', 'Rektor UAD', '2021-04-27 10:08:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(234, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'53\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.4\', \'TEST ARSIP 6\', \'test arsip 6\', \'1\', \'2021-04-30\', \'1\', \'1\', \'dekanfti\')', 'Dekan FTI', '2021-04-27 10:15:07', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(235, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (11, \'5\')', 'Dekan FTI', '2021-04-27 10:15:08', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(236, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'55\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.5\', \'TEST ARSIP 7\', \'test arsip 7\', \'1\', \'2021-04-30\', \'1\', \'1\', \'kaproditif\')', 'Kaprodi TIF', '2021-04-27 13:45:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(237, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (12, \'5\')', 'Kaprodi TIF', '2021-04-27 13:45:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(238, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'55\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.6\', \'TEST ARSIP 8\', \'test arsip 8\', \'1\', \'2021-04-29\', \'1\', \'1\', \'kaproditif\')', 'Kaprodi TIF', '2021-04-27 13:46:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(239, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (13, \'5\')', 'Kaprodi TIF', '2021-04-27 13:46:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(240, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'1\', \'54\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.1\', \'TEST ARSIP 1\', \'test arsip 1\', \'1\', \'2021-04-30\', \'1\', \'1\', \'kaproditif\')', 'Kaprodi TIF', '2021-04-27 14:12:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(241, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (14, \'5\')', 'Kaprodi TIF', '2021-04-27 14:12:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(242, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', NULL, \'53\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.2\', \'TEST ARSIP 2\', \'test arsip 2\', \'1\', \'2021-04-30\', \'1\', \'1\', \'petugastu\')', 'Petugas TU', '2021-04-28 09:00:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(243, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (0, \'5\')', 'Petugas TU', '2021-04-28 09:00:55', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(244, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', NULL, \'53\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.2\', \'TEST ARSIP 2\', \'test\', \'1\', \'2021-04-30\', \'1\', \'1\', \'petugastu\')', 'Petugas TU', '2021-04-28 09:03:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(245, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (0, \'5\')', 'Petugas TU', '2021-04-28 09:03:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(246, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', NULL, \'53\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.2\', \'TEST ARSIP 2\', \'tes\', \'1\', \'2021-04-30\', \'1\', \'1\', \'petugastu\')', 'Petugas TU', '2021-04-28 09:06:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(247, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (0, \'5\')', 'Petugas TU', '2021-04-28 09:06:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(248, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'1\', \'53\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.2\', \'TEST ARSIP 2\', \'tes\', \'1\', \'2021-04-30\', \'1\', \'1\', \'petugastu\')', 'Petugas TU', '2021-04-28 09:15:09', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(249, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (15, \'5\')', 'Petugas TU', '2021-04-28 09:15:09', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(250, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'1\', \'55\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.1\', \'TEST ARSIP 1\', \'tes\', \'1\', \'2021-04-30\', \'1\', \'1\', \'ridargustia\')', 'Ridar Gustia', '2021-04-28 09:19:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(251, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (16, \'5\')', 'Ridar Gustia', '2021-04-28 09:19:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(252, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'1\', \'52\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.2\', \'TEST ARSIP 2\', \'test\', \'1\', \'2021-05-01\', \'1\', \'1\', \'rektoruad\')', 'Rektor UAD', '2021-04-28 09:23:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(253, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (17, \'5\')', 'Rektor UAD', '2021-04-28 09:23:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(254, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'1\', \'55\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.3\', \'TEST ARSIP 3\', \'test\', \'1\', \'2021-04-30\', \'1\', \'1\', \'dekanfti\')', 'Dekan FTI', '2021-04-28 09:26:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(255, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (18, \'5\')', 'Dekan FTI', '2021-04-28 09:26:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(256, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'1\', \'53\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.4\', \'TEST ARSIP 4\', \'test\', \'1\', \'2021-04-30\', \'1\', \'1\', \'kaproditif\')', 'Kaprodi TIF', '2021-04-28 09:31:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(257, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (19, \'5\')', 'Kaprodi TIF', '2021-04-28 09:31:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(258, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'1\', \'54\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.5\', \'TEST ARSIP 5\', \'test\', \'1\', \'2021-04-30\', \'1\', \'1\', \'petugastu\')', 'Petugas TU', '2021-04-28 09:35:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(259, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (20, \'5\')', 'Petugas TU', '2021-04-28 09:35:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(260, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-28 11:41:am\'\nWHERE `id_arsip` = \'20\'', 'Petugas TU', '2021-04-28 11:41:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(261, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-28 11:46:am\'\nWHERE `id_arsip` = \'19\'', 'Ridar Gustia', '2021-04-28 11:46:13', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(262, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'19\'', 'Ridar Gustia', '2021-04-28 11:46:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(263, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-28 11:47:am\'\nWHERE `id_arsip` = \'19\'', 'Rektor UAD', '2021-04-28 11:47:32', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(264, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'19\'', 'Rektor UAD', '2021-04-28 11:47:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(265, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-28 11:48:am\'\nWHERE `id_arsip` = \'19\'', 'Dekan FTI', '2021-04-28 11:48:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(266, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'19\'', 'Dekan FTI', '2021-04-28 11:48:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(267, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-28 11:49:am\'\nWHERE `id_arsip` = \'19\'', 'Kaprodi TIF', '2021-04-28 11:49:58', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(268, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'19\'', 'Ridar Gustia', '2021-04-28 11:51:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(269, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'20\'', 'Ridar Gustia', '2021-04-28 11:51:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(270, 'UPDATE `arsip` SET `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `bagian_id` = \'1\', `user_id` = \'53\', `lokasi_id` = \'32\', `rak_id` = \'54\', `box_id` = \'1\', `map_id` = \'45\', `baris_id` = \'1\', `no_arsip` = \'123.5\', `arsip_name` = \'TEST ARSIP 5\', `deskripsi_arsip` = \'test\', `keterangan` = \'1\', `masa_retensi` = \'2021-04-30\', `status_retensi` = 1, `status_file` = \'1\', `modified_by` = \'petugastu\'\nWHERE `id_arsip` = \'20\'', 'Petugas TU', '2021-04-29 11:14:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(271, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (\'20\', \'5\')', 'Petugas TU', '2021-04-29 11:14:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(272, 'UPDATE `arsip` SET `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `bagian_id` = \'1\', `user_id` = \'53\', `lokasi_id` = \'32\', `rak_id` = \'54\', `box_id` = \'1\', `map_id` = \'45\', `baris_id` = \'1\', `no_arsip` = \'123.6\', `arsip_name` = \'TEST ARSIP 6\', `deskripsi_arsip` = \'test 6\', `keterangan` = \'1\', `masa_retensi` = \'2021-04-30\', `status_retensi` = 1, `status_file` = \'1\', `modified_by` = \'kaproditif\'\nWHERE `id_arsip` = \'18\'', 'Kaprodi TIF', '2021-04-29 11:17:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(273, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (\'18\', \'5\')', 'Kaprodi TIF', '2021-04-29 11:17:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(274, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-29 13:45:pm\'\nWHERE `id_arsip` = \'20\'', 'Ridar Gustia', '2021-04-29 13:45:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(275, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-29 14:22:pm\'\nWHERE `id_arsip` = \'16\'', 'Kaprodi TIF', '2021-04-29 14:22:14', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(276, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'20\'', 'Ridar Gustia', '2021-04-29 14:26:21', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(277, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-29 14:27:pm\'\nWHERE `id_arsip` = \'20\'', 'Ridar Gustia', '2021-04-29 14:27:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(278, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'20\'', 'Rektor UAD', '2021-04-29 14:28:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(279, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-29 14:28:pm\'\nWHERE `id_arsip` = \'20\'', 'Rektor UAD', '2021-04-29 14:28:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(280, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'20\'', 'Dekan FTI', '2021-04-29 14:29:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(281, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-29 14:29:pm\'\nWHERE `id_arsip` = \'20\'', 'Dekan FTI', '2021-04-29 14:29:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(282, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'20\'', 'Kaprodi TIF', '2021-04-29 14:36:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(283, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-29 14:38:pm\'\nWHERE `id_arsip` = \'20\'', 'Kaprodi TIF', '2021-04-29 14:38:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(284, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'1\', \'54\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.5\', \'TEST ARSIP 5\', \'test 5\', \'1\', \'2021-05-07\', \'0\', \'1\', \'petugastu\')', 'Petugas TU', '2021-04-29 14:54:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(285, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (21, \'5\')', 'Petugas TU', '2021-04-29 14:54:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(286, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-29 14:54:pm\'\nWHERE `id_arsip` = \'21\'', 'Petugas TU', '2021-04-29 14:54:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(287, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'1\', \'54\', \'32\', \'54\', \'1\', \'45\', \'1\', \'123.5\', \'TEST ARSIP 5\', \'test 5\', \'1\', \'2021-05-07\', \'0\', \'1\', \'petugastu\')', 'Petugas TU', '2021-04-29 15:15:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(288, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (22, \'5\')', 'Petugas TU', '2021-04-29 15:15:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(289, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-29 15:16:pm\'\nWHERE `id_arsip` = \'22\'', 'Petugas TU', '2021-04-29 15:16:09', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(290, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'22\'', 'Petugas TU', '2021-04-29 15:53:32', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(291, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-29 15:53:pm\'\nWHERE `id_arsip` = \'22\'', 'Petugas TU', '2021-04-29 15:53:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(292, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'22\'', 'Petugas TU', '2021-04-29 15:54:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(293, 'UPDATE `arsip` SET `is_delete` = \'1\', `deleted_by` = NULL, `deleted_at` = \'2021-04-30 10:06:am\'\nWHERE `id_arsip` = \'22\'', 'Petugas TU', '2021-04-30 10:06:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(294, 'UPDATE `arsip` SET `is_delete` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = \'22\'', 'Petugas TU', '2021-04-30 10:06:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(295, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2\', \'10\', \'50\', \'39\', \'ridargustia\')', 'Ridar Gustia', '2021-04-30 11:02:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(296, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'3\', \'10\', \'50\', \'39\', \'rektoruad\')', 'Rektor UAD', '2021-04-30 11:14:20', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(297, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'4\', \'10\', \'50\', \'39\', \'dekanfti\')', 'Dekan FTI', '2021-04-30 11:15:55', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(298, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'5\', \'10\', \'50\', \'39\', \'kaproditif\')', 'Kaprodi TIF', '2021-04-30 11:17:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36');
INSERT INTO `log_queries` (`id`, `content`, `created_by`, `created_at`, `ip_address`, `user_agent`) VALUES
(299, 'UPDATE `rak` SET `rak_name` = \'1\', `instansi_id` = \'10\', `cabang_id` = \'52\', `divisi_id` = \'43\', `modified_by` = \'ridargustia\'\nWHERE `id_rak` = \'58\'', 'Ridar Gustia', '2021-04-30 14:00:38', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(300, 'UPDATE `rak` SET `rak_name` = \'1\', `instansi_id` = \'10\', `cabang_id` = \'52\', `divisi_id` = \'42\', `modified_by` = \'rektoruad\'\nWHERE `id_rak` = \'57\'', 'Rektor UAD', '2021-04-30 14:03:50', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(301, 'UPDATE `rak` SET `rak_name` = \'2\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'rektoruad\'\nWHERE `id_rak` = \'56\'', 'Rektor UAD', '2021-04-30 14:04:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(302, 'UPDATE `rak` SET `rak_name` = \'3\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'rektoruad\'\nWHERE `id_rak` = \'56\'', 'Rektor UAD', '2021-04-30 14:11:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(303, 'UPDATE `rak` SET `rak_name` = \'1\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'46\', `modified_by` = \'rektoruad\'\nWHERE `id_rak` = \'56\'', 'Rektor UAD', '2021-04-30 14:12:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(304, 'UPDATE `rak` SET `rak_name` = \'2\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'46\', `modified_by` = \'dekanfti\'\nWHERE `id_rak` = \'56\'', 'Dekan FTI', '2021-04-30 14:14:26', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(305, 'UPDATE `rak` SET `rak_name` = \'1\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'46\', `modified_by` = \'dekanfti\'\nWHERE `id_rak` = \'56\'', 'Dekan FTI', '2021-04-30 14:14:56', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(306, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'3\', \'10\', \'50\', \'39\', \'dekanfti\')', 'Dekan FTI', '2021-04-30 14:16:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(307, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'4\', \'10\', \'50\', \'39\', \'dekanfti\')', 'Dekan FTI', '2021-04-30 14:17:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(308, 'UPDATE `rak` SET `is_delete_rak` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-04-30 14:18:pm\'\nWHERE `id_rak` = \'60\'', 'Dekan FTI', '2021-04-30 14:18:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(309, 'UPDATE `rak` SET `is_delete_rak` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-04-30 14:18:pm\'\nWHERE `id_rak` = \'59\'', 'Dekan FTI', '2021-04-30 14:18:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(310, 'UPDATE `rak` SET `rak_name` = \'3\', `instansi_id` = \'10\', `cabang_id` = \'52\', `divisi_id` = \'43\', `modified_by` = \'ridargustia\'\nWHERE `id_rak` = \'58\'', 'Ridar Gustia', '2021-05-03 11:08:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(311, 'UPDATE `rak` SET `rak_name` = \'1\', `instansi_id` = \'10\', `cabang_id` = \'52\', `divisi_id` = \'43\', `modified_by` = \'ridargustia\'\nWHERE `id_rak` = \'58\'', 'Ridar Gustia', '2021-05-03 11:08:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(312, 'UPDATE `rak` SET `rak_name` = \'3\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'ridargustia\'\nWHERE `id_rak` = \'55\'', 'Ridar Gustia', '2021-05-03 11:18:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(313, 'UPDATE `rak` SET `rak_name` = \'3\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'ridargustia\'\nWHERE `id_rak` = \'55\'', 'Ridar Gustia', '2021-05-03 11:21:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(314, 'UPDATE `rak` SET `rak_name` = \'3\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'ridargustia\'\nWHERE `id_rak` = \'55\'', 'Ridar Gustia', '2021-05-03 11:22:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(315, 'UPDATE `rak` SET `rak_name` = \'2\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'ridargustia\'\nWHERE `id_rak` = \'55\'', 'Ridar Gustia', '2021-05-03 11:22:58', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(316, 'UPDATE `rak` SET `rak_name` = \'1\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'ridargustia\'\nWHERE `id_rak` = \'55\'', 'Ridar Gustia', '2021-05-03 11:27:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(317, 'UPDATE `rak` SET `rak_name` = \'2\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'ridargustia\'\nWHERE `id_rak` = \'55\'', 'Ridar Gustia', '2021-05-03 11:27:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(318, 'UPDATE `rak` SET `rak_name` = \'2\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'ridargustia\'\nWHERE `id_rak` = \'55\'', 'Ridar Gustia', '2021-05-03 11:28:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(319, 'UPDATE `rak` SET `is_delete_rak` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-03 12:05:pm\'\nWHERE `id_rak` = \'55\'', 'Ridar Gustia', '2021-05-03 12:05:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(320, 'UPDATE `rak` SET `is_delete_rak` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_rak` = \'55\'', 'Ridar Gustia', '2021-05-03 12:05:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(321, 'UPDATE `rak` SET `is_delete_rak` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_rak` = \'60\'', 'Ridar Gustia', '2021-05-04 09:09:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(322, 'UPDATE `rak` SET `is_delete_rak` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-04 09:09:am\'\nWHERE `id_rak` = \'60\'', 'Ridar Gustia', '2021-05-04 09:09:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(323, 'DELETE FROM `rak`\nWHERE `id_rak` = \'60\'', 'Ridar Gustia', '2021-05-04 09:09:36', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(324, 'UPDATE `rak` SET `is_delete_rak` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_rak` = \'59\'', 'Ridar Gustia', '2021-05-04 09:09:50', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(325, 'UPDATE `rak` SET `is_delete_rak` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-04 09:14:am\'\nWHERE `id_rak` = \'59\'', 'Ridar Gustia', '2021-05-04 09:14:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(326, 'UPDATE `rak` SET `is_delete_rak` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_rak` = \'59\'', 'Rektor UAD', '2021-05-04 09:17:50', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(327, 'UPDATE `rak` SET `is_delete_rak` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-05-04 09:18:am\'\nWHERE `id_rak` = \'59\'', 'Rektor UAD', '2021-05-04 09:18:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(328, 'DELETE FROM `rak`\nWHERE `id_rak` = \'59\'', 'Rektor UAD', '2021-05-04 09:18:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(329, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'3\', \'10\', \'50\', \'39\', \'rektoruad\')', 'Rektor UAD', '2021-05-04 09:18:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(330, 'UPDATE `rak` SET `is_delete_rak` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-05-04 09:19:am\'\nWHERE `id_rak` = \'61\'', 'Rektor UAD', '2021-05-04 09:19:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(331, 'UPDATE `rak` SET `is_delete_rak` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_rak` = \'61\'', 'Dekan FTI', '2021-05-04 09:19:56', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(332, 'UPDATE `rak` SET `is_delete_rak` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-05-04 09:23:am\'\nWHERE `id_rak` = \'61\'', 'Kaprodi TIF', '2021-05-04 09:23:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(333, 'UPDATE `rak` SET `is_delete_rak` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_rak` = \'61\'', 'Kaprodi TIF', '2021-05-04 09:29:32', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(334, 'UPDATE `rak` SET `is_delete_rak` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-05-04 09:29:am\'\nWHERE `id_rak` = \'61\'', 'Kaprodi TIF', '2021-05-04 09:29:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(335, 'DELETE FROM `rak`\nWHERE `id_rak` = \'61\'', 'Kaprodi TIF', '2021-05-04 09:29:50', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(336, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `created_by`) VALUES (\'2\', \'10\', \'50\', \'ridargustia\')', 'Ridar Gustia', '2021-05-04 10:57:01', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(337, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `created_by`) VALUES (\'3\', \'10\', \'50\', \'rektoruad\')', 'Rektor UAD', '2021-05-04 10:58:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(338, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `created_by`) VALUES (\'4\', \'10\', \'50\', \'dekanfti\')', 'Dekan FTI', '2021-05-04 10:59:45', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(339, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `created_by`) VALUES (\'5\', NULL, NULL, \'kaproditif\')', 'Kaprodi TIF', '2021-05-04 11:01:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(340, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'3\', \'10\', \'50\', \'39\', \'kaproditif\')', 'Kaprodi TIF', '2021-05-04 13:22:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(341, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2\', \'10\', \'50\', \'39\', \'kaproditif\')', 'Kaprodi TIF', '2021-05-04 13:24:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(342, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'3\', \'10\', \'50\', \'39\', \'ridargustia\')', 'Ridar Gustia', '2021-05-04 13:27:23', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(343, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'4\', \'10\', \'50\', \'39\', \'rektoruad\')', 'Rektor UAD', '2021-05-04 13:28:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(344, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'5\', \'10\', \'50\', \'39\', \'dekanfti\')', 'Dekan FTI', '2021-05-04 13:29:21', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(345, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'10\', \'52\', \'43\', \'ridargustia\')', 'Ridar Gustia', '2021-05-04 13:32:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(346, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'10\', \'52\', \'42\', \'ridargustia\')', 'Ridar Gustia', '2021-05-04 13:32:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(347, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'10\', \'50\', \'46\', \'dekanfti\')', 'Dekan FTI', '2021-05-04 13:46:56', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(348, 'UPDATE `baris` SET `baris_name` = \'1\', `instansi_id` = \'10\', `cabang_id` = \'50\', `modified_by` = \'ridargustia\'\nWHERE `id_baris` = \'12\'', 'Ridar Gustia', '2021-05-04 14:38:55', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(349, 'UPDATE `baris` SET `baris_name` = \'4\', `instansi_id` = \'10\', `cabang_id` = \'50\', `modified_by` = \'ridargustia\'\nWHERE `id_baris` = \'9\'', 'Ridar Gustia', '2021-05-04 14:39:36', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(350, 'UPDATE `baris` SET `baris_name` = \'5\', `instansi_id` = \'10\', `cabang_id` = \'50\', `modified_by` = \'ridargustia\'\nWHERE `id_baris` = \'9\'', 'Ridar Gustia', '2021-05-04 14:39:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(351, 'UPDATE `baris` SET `baris_name` = \'5\', `instansi_id` = \'10\', `cabang_id` = \'52\', `divisi_id` = \'43\', `modified_by` = \'ridargustia\'\nWHERE `id_baris` = \'9\'', 'Ridar Gustia', '2021-05-04 15:13:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(352, 'UPDATE `baris` SET `baris_name` = \'5\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'ridargustia\'\nWHERE `id_baris` = \'9\'', 'Ridar Gustia', '2021-05-04 15:13:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(353, 'UPDATE `baris` SET `baris_name` = \'6\', `instansi_id` = \'10\', `cabang_id` = \'52\', `divisi_id` = \'42\', `modified_by` = \'rektoruad\'\nWHERE `id_baris` = \'9\'', 'Rektor UAD', '2021-05-04 15:14:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(354, 'UPDATE `baris` SET `baris_name` = \'6\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'rektoruad\'\nWHERE `id_baris` = \'9\'', 'Rektor UAD', '2021-05-04 15:14:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(355, 'UPDATE `baris` SET `baris_name` = \'5\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'46\', `modified_by` = \'dekanfti\'\nWHERE `id_baris` = \'9\'', 'Dekan FTI', '2021-05-04 15:15:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(356, 'UPDATE `baris` SET `baris_name` = \'5\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'dekanfti\'\nWHERE `id_baris` = \'9\'', 'Dekan FTI', '2021-05-04 15:16:01', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(357, 'UPDATE `baris` SET `baris_name` = \'6\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'kaproditif\'\nWHERE `id_baris` = \'9\'', 'Kaprodi TIF', '2021-05-04 15:16:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(358, 'UPDATE `baris` SET `baris_name` = \'5\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'kaproditif\'\nWHERE `id_baris` = \'9\'', 'Kaprodi TIF', '2021-05-04 15:16:55', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(359, 'UPDATE `baris` SET `is_delete_baris` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-05 09:26:am\'\nWHERE `id_baris` = \'9\'', 'Ridar Gustia', '2021-05-05 09:26:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(360, 'UPDATE `baris` SET `is_delete_baris` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_baris` = \'9\'', 'Ridar Gustia', '2021-05-05 09:46:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(361, 'UPDATE `baris` SET `is_delete_baris` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-05-05 09:48:am\'\nWHERE `id_baris` = \'9\'', 'Rektor UAD', '2021-05-05 09:48:50', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(362, 'UPDATE `baris` SET `is_delete_baris` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_baris` = \'9\'', 'Rektor UAD', '2021-05-05 09:49:02', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(363, 'UPDATE `baris` SET `is_delete_baris` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-05-05 09:49:am\'\nWHERE `id_baris` = \'9\'', 'Rektor UAD', '2021-05-05 09:49:11', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(364, 'DELETE FROM `baris`\nWHERE `id_baris` = \'9\'', 'Rektor UAD', '2021-05-05 09:49:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(365, 'UPDATE `baris` SET `is_delete_baris` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-05-05 09:50:am\'\nWHERE `id_baris` = \'8\'', 'Dekan FTI', '2021-05-05 09:50:29', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(366, 'UPDATE `baris` SET `is_delete_baris` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_baris` = \'8\'', 'Dekan FTI', '2021-05-05 09:50:36', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(367, 'UPDATE `baris` SET `is_delete_baris` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-05-05 09:50:am\'\nWHERE `id_baris` = \'8\'', 'Dekan FTI', '2021-05-05 09:50:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(368, 'DELETE FROM `baris`\nWHERE `id_baris` = \'8\'', 'Dekan FTI', '2021-05-05 09:50:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(369, 'UPDATE `baris` SET `is_delete_baris` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-05-05 09:51:am\'\nWHERE `id_baris` = \'7\'', 'Kaprodi TIF', '2021-05-05 09:51:45', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(370, 'UPDATE `baris` SET `is_delete_baris` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_baris` = \'7\'', 'Kaprodi TIF', '2021-05-05 09:51:55', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(371, 'UPDATE `baris` SET `is_delete_baris` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-05-05 09:52:am\'\nWHERE `id_baris` = \'7\'', 'Kaprodi TIF', '2021-05-05 09:52:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(372, 'DELETE FROM `baris`\nWHERE `id_baris` = \'7\'', 'Kaprodi TIF', '2021-05-05 09:52:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(373, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-05 10:03:am\'\nWHERE `id_box` = \'1\'', 'Ridar Gustia', '2021-05-05 10:03:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(374, 'UPDATE `baris` SET `is_delete_baris` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-05 10:49:am\'\nWHERE `id_baris` = \'6\'', 'Ridar Gustia', '2021-05-05 10:49:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(375, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2\', \'10\', \'50\', \'39\', \'ridargustia\')', 'Ridar Gustia', '2021-05-05 10:53:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(376, 'UPDATE `rak` SET `is_delete_rak` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-05 10:55:am\'\nWHERE `id_rak` = \'55\'', 'Ridar Gustia', '2021-05-05 10:55:38', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(377, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2\', \'10\', \'50\', \'39\', \'ridargustia\')', 'Ridar Gustia', '2021-05-05 11:03:53', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(378, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'10\', \'50\', \'39\', \'ridargustia\')', 'Ridar Gustia', '2021-05-05 11:09:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(379, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2\', \'10\', \'50\', \'39\', \'rektoruad\')', 'Rektor UAD', '2021-05-05 11:14:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(380, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'3\', \'10\', \'50\', \'39\', \'dekanfti\')', 'Dekan FTI', '2021-05-05 11:16:32', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(381, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'4\', \'10\', \'50\', \'39\', \'kaproditif\')', 'Kaprodi TIF', '2021-05-05 11:18:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(382, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'10\', \'50\', \'46\', \'rektoruad\')', 'Rektor UAD', '2021-05-05 14:33:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(383, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'10\', \'52\', \'43\', \'rektoruad\')', 'Rektor UAD', '2021-05-05 14:33:50', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(384, 'UPDATE `box` SET `box_name` = \'1\', `instansi_id` = \'10\', `cabang_id` = \'50\', `modified_by` = \'dekanfti\'\nWHERE `id_box` = \'6\'', 'Dekan FTI', '2021-05-05 14:51:04', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(385, 'UPDATE `box` SET `box_name` = \'4\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'41\', `modified_by` = \'ridargustia\'\nWHERE `id_box` = \'5\'', 'Ridar Gustia', '2021-05-05 15:56:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(386, 'UPDATE `box` SET `box_name` = \'1\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'41\', `modified_by` = \'ridargustia\'\nWHERE `id_box` = \'6\'', 'Ridar Gustia', '2021-05-05 15:57:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(387, 'UPDATE `box` SET `box_name` = \'2\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'41\', `modified_by` = \'ridargustia\'\nWHERE `id_box` = \'6\'', 'Ridar Gustia', '2021-05-05 15:58:36', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(388, 'UPDATE `box` SET `box_name` = \'4\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'rektoruad\'\nWHERE `id_box` = \'5\'', 'Rektor UAD', '2021-05-06 09:15:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(389, 'UPDATE `box` SET `box_name` = \'4\', `instansi_id` = \'10\', `cabang_id` = \'52\', `divisi_id` = \'42\', `modified_by` = \'rektoruad\'\nWHERE `id_box` = \'5\'', 'Rektor UAD', '2021-05-06 09:16:14', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(390, 'UPDATE `box` SET `box_name` = \'5\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'rektoruad\'\nWHERE `id_box` = \'5\'', 'Rektor UAD', '2021-05-06 09:16:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(391, 'UPDATE `box` SET `box_name` = \'4\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'41\', `modified_by` = \'dekanfti\'\nWHERE `id_box` = \'5\'', 'Dekan FTI', '2021-05-06 09:18:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(392, 'UPDATE `box` SET `box_name` = \'4\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'dekanfti\'\nWHERE `id_box` = \'5\'', 'Dekan FTI', '2021-05-06 09:18:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(393, 'UPDATE `box` SET `box_name` = \'5\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'kaproditif\'\nWHERE `id_box` = \'5\'', 'Kaprodi TIF', '2021-05-06 09:19:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(394, 'UPDATE `box` SET `box_name` = \'3\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'kaproditif\'\nWHERE `id_box` = \'5\'', 'Kaprodi TIF', '2021-05-06 09:19:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(395, 'UPDATE `box` SET `box_name` = \'5\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'kaproditif\'\nWHERE `id_box` = \'5\'', 'Kaprodi TIF', '2021-05-06 09:19:55', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(396, 'UPDATE `box` SET `box_name` = \'4\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'kaproditif\'\nWHERE `id_box` = \'5\'', 'Kaprodi TIF', '2021-05-06 09:20:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(397, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-05-06 09:21:am\'\nWHERE `id_box` = \'5\'', 'Kaprodi TIF', '2021-05-06 09:21:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(398, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-06 09:23:am\'\nWHERE `id_box` = \'4\'', 'Ridar Gustia', '2021-05-06 09:23:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(399, 'UPDATE `box` SET `is_delete_box` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_box` = \'4\'', 'Ridar Gustia', '2021-05-06 09:33:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(400, 'UPDATE `box` SET `is_delete_box` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_box` = \'5\'', 'Ridar Gustia', '2021-05-06 09:33:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(401, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-06 09:34:am\'\nWHERE `id_box` = \'5\'', 'Ridar Gustia', '2021-05-06 09:34:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(402, 'UPDATE `box` SET `is_delete_box` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_box` = \'5\'', 'Ridar Gustia', '2021-05-06 09:34:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(403, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-05-06 09:35:am\'\nWHERE `id_box` = \'5\'', 'Rektor UAD', '2021-05-06 09:35:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(404, 'UPDATE `box` SET `is_delete_box` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_box` = \'5\'', 'Rektor UAD', '2021-05-06 09:35:31', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(405, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-05-06 09:35:am\'\nWHERE `id_box` = \'5\'', 'Rektor UAD', '2021-05-06 09:35:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(406, 'UPDATE `box` SET `is_delete_box` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_box` = \'5\'', 'Rektor UAD', '2021-05-06 09:35:58', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(407, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-05-06 09:36:am\'\nWHERE `id_box` = \'5\'', 'Dekan FTI', '2021-05-06 09:36:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(408, 'UPDATE `box` SET `is_delete_box` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_box` = \'5\'', 'Dekan FTI', '2021-05-06 09:36:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(409, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-05-06 09:37:am\'\nWHERE `id_box` = \'5\'', 'Dekan FTI', '2021-05-06 09:37:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(410, 'UPDATE `box` SET `is_delete_box` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_box` = \'5\'', 'Dekan FTI', '2021-05-06 09:37:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(411, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-05-06 09:37:am\'\nWHERE `id_box` = \'5\'', 'Kaprodi TIF', '2021-05-06 09:37:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(412, 'UPDATE `box` SET `is_delete_box` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_box` = \'5\'', 'Kaprodi TIF', '2021-05-06 09:38:04', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(413, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-06 09:40:am\'\nWHERE `id_box` = \'6\'', 'Ridar Gustia', '2021-05-06 09:40:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(414, 'DELETE FROM `box`\nWHERE `id_box` = \'1\'', 'Ridar Gustia', '2021-05-06 09:40:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(415, 'DELETE FROM `box`\nWHERE `id_box` = \'6\'', 'Ridar Gustia', '2021-05-06 09:40:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(416, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-05-06 09:43:am\'\nWHERE `id_box` = \'5\'', 'Rektor UAD', '2021-05-06 09:43:07', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(417, 'DELETE FROM `box`\nWHERE `id_box` = \'5\'', 'Rektor UAD', '2021-05-06 09:44:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(418, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-05-06 09:45:am\'\nWHERE `id_box` = \'4\'', 'Dekan FTI', '2021-05-06 09:45:31', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(419, 'DELETE FROM `box`\nWHERE `id_box` = \'4\'', 'Dekan FTI', '2021-05-06 09:45:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(420, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-05-06 09:46:am\'\nWHERE `id_box` = \'3\'', 'Kaprodi TIF', '2021-05-06 09:46:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(421, 'DELETE FROM `box`\nWHERE `id_box` = \'3\'', 'Kaprodi TIF', '2021-05-06 09:46:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(422, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2\', \'10\', \'50\', \'39\', \'kaproditif\')', 'Kaprodi TIF', '2021-05-06 09:49:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(423, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-05-06 09:49:am\'\nWHERE `id_box` = \'8\'', 'Kaprodi TIF', '2021-05-06 09:49:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(424, 'UPDATE `box` SET `is_delete_box` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_box` = \'8\'', 'Kaprodi TIF', '2021-05-06 09:49:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(425, 'UPDATE `box` SET `is_delete_box` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-05-06 09:49:am\'\nWHERE `id_box` = \'8\'', 'Kaprodi TIF', '2021-05-06 09:49:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(426, 'DELETE FROM `box`\nWHERE `id_box` = \'8\'', 'Kaprodi TIF', '2021-05-06 09:49:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(427, 'UPDATE `map` SET `is_delete_map` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-06 14:04:pm\'\nWHERE `id_map` = \'45\'', 'Ridar Gustia', '2021-05-06 14:04:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(428, 'DELETE FROM `map`\nWHERE `id_map` = \'45\'', 'Ridar Gustia', '2021-05-06 14:05:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(429, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'10\', \'50\', \'39\', \'ridargustia\')', 'Ridar Gustia', '2021-05-06 14:05:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(430, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'10\', \'53\', \'44\', \'ridargustia\')', 'Ridar Gustia', '2021-05-06 14:07:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(431, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'10\', \'52\', \'43\', \'ridargustia\')', 'Ridar Gustia', '2021-05-06 14:07:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(432, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2\', \'10\', \'50\', \'39\', \'rektoruad\')', 'Rektor UAD', '2021-05-06 14:09:11', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(433, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2\', \'10\', \'53\', \'44\', \'rektoruad\')', 'Rektor UAD', '2021-05-06 14:09:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(434, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2\', \'10\', \'52\', \'43\', \'rektoruad\')', 'Rektor UAD', '2021-05-06 14:09:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(435, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'3\', \'10\', \'50\', \'39\', \'dekanfti\')', 'Dekan FTI', '2021-05-06 14:11:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(436, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'4\', \'10\', \'50\', \'39\', \'kaproditif\')', 'Kaprodi TIF', '2021-05-06 14:12:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(437, 'UPDATE `map` SET `is_delete_map` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-06 14:15:pm\'\nWHERE `id_map` = \'46\'', 'Ridar Gustia', '2021-05-06 14:15:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(438, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'10\', \'50\', \'39\', \'ridargustia\')', 'Ridar Gustia', '2021-05-06 14:16:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(439, 'DELETE FROM `map`\nWHERE `id_map` = \'46\'', 'Ridar Gustia', '2021-05-06 14:16:36', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(440, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'10\', \'50\', \'46\', \'dekanfti\')', 'Dekan FTI', '2021-05-06 14:31:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(441, 'UPDATE `map` SET `map_name` = \'2\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'46\', `modified_by` = \'ridargustia\'\nWHERE `id_map` = \'53\'', 'Ridar Gustia', '2021-05-07 09:48:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(442, 'UPDATE `map` SET `map_name` = \'4\', `instansi_id` = \'10\', `cabang_id` = \'52\', `divisi_id` = \'43\', `modified_by` = \'ridargustia\'\nWHERE `id_map` = \'53\'', 'Ridar Gustia', '2021-05-07 09:49:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(443, 'UPDATE `map` SET `map_name` = \'4\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'ridargustia\'\nWHERE `id_map` = \'53\'', 'Ridar Gustia', '2021-05-07 09:49:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(444, 'UPDATE `map` SET `map_name` = \'2\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'rektoruad\'\nWHERE `id_map` = \'51\'', 'Rektor UAD', '2021-05-07 09:51:08', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(445, 'UPDATE `map` SET `map_name` = \'2\', `instansi_id` = \'10\', `cabang_id` = \'52\', `divisi_id` = \'43\', `modified_by` = \'rektoruad\'\nWHERE `id_map` = \'51\'', 'Rektor UAD', '2021-05-07 09:52:02', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(446, 'UPDATE `map` SET `map_name` = \'4\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'41\', `modified_by` = \'dekanfti\'\nWHERE `id_map` = \'53\'', 'Dekan FTI', '2021-05-07 09:53:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(447, 'UPDATE `map` SET `map_name` = \'4\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'kaproditif\'\nWHERE `id_map` = \'52\'', 'Kaprodi TIF', '2021-05-07 09:54:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(448, 'UPDATE `map` SET `is_delete_map` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-07 10:07:am\'\nWHERE `id_map` = \'51\'', 'Ridar Gustia', '2021-05-07 10:07:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(449, 'UPDATE `map` SET `is_delete_map` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_map` = \'51\'', 'Ridar Gustia', '2021-05-07 10:08:53', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(450, 'UPDATE `map` SET `is_delete_map` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-07 10:09:am\'\nWHERE `id_map` = \'51\'', 'Ridar Gustia', '2021-05-07 10:09:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(451, 'DELETE FROM `map`\nWHERE `id_map` = \'51\'', 'Ridar Gustia', '2021-05-07 10:09:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(452, 'UPDATE `map` SET `is_delete_map` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-05-07 10:11:am\'\nWHERE `id_map` = \'53\'', 'Rektor UAD', '2021-05-07 10:11:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(453, 'UPDATE `map` SET `is_delete_map` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_map` = \'53\'', 'Rektor UAD', '2021-05-07 10:11:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(454, 'UPDATE `map` SET `is_delete_map` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-05-07 10:11:am\'\nWHERE `id_map` = \'53\'', 'Rektor UAD', '2021-05-07 10:11:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(455, 'DELETE FROM `map`\nWHERE `id_map` = \'53\'', 'Rektor UAD', '2021-05-07 10:11:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(456, 'UPDATE `map` SET `is_delete_map` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-05-07 10:12:am\'\nWHERE `id_map` = \'52\'', 'Dekan FTI', '2021-05-07 10:12:56', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(457, 'UPDATE `map` SET `is_delete_map` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_map` = \'52\'', 'Dekan FTI', '2021-05-07 10:13:07', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(458, 'UPDATE `map` SET `is_delete_map` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-05-07 10:13:am\'\nWHERE `id_map` = \'52\'', 'Dekan FTI', '2021-05-07 10:13:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(459, 'UPDATE `map` SET `is_delete_map` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_map` = \'52\'', 'Dekan FTI', '2021-05-07 10:13:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(460, 'UPDATE `map` SET `is_delete_map` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-05-07 10:13:am\'\nWHERE `id_map` = \'52\'', 'Dekan FTI', '2021-05-07 10:13:38', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(461, 'DELETE FROM `map`\nWHERE `id_map` = \'52\'', 'Dekan FTI', '2021-05-07 10:13:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(462, 'UPDATE `map` SET `is_delete_map` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-05-07 10:14:am\'\nWHERE `id_map` = \'49\'', 'Kaprodi TIF', '2021-05-07 10:14:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(463, 'UPDATE `map` SET `is_delete_map` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_map` = \'49\'', 'Kaprodi TIF', '2021-05-07 10:14:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(464, 'UPDATE `map` SET `is_delete_map` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-05-07 10:15:am\'\nWHERE `id_map` = \'49\'', 'Kaprodi TIF', '2021-05-07 10:15:09', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(465, 'DELETE FROM `map`\nWHERE `id_map` = \'49\'', 'Kaprodi TIF', '2021-05-07 10:15:36', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(466, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2\', \'10\', \'50\', \'39\', \'rektoruad\')', 'Rektor UAD', '2021-05-07 10:17:09', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(467, 'UPDATE `map` SET `is_delete_map` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-05-07 10:17:am\'\nWHERE `id_map` = \'56\'', 'Rektor UAD', '2021-05-07 10:17:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(468, 'UPDATE `map` SET `is_delete_map` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_map` = \'56\'', 'Rektor UAD', '2021-05-07 10:17:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(469, 'UPDATE `map` SET `is_delete_map` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-05-07 10:17:am\'\nWHERE `id_map` = \'56\'', 'Rektor UAD', '2021-05-07 10:17:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(470, 'DELETE FROM `map`\nWHERE `id_map` = \'56\'', 'Rektor UAD', '2021-05-07 10:17:56', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36');
INSERT INTO `log_queries` (`id`, `content`, `created_by`, `created_at`, `ip_address`, `user_agent`) VALUES
(471, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-07 10:58:am\'\nWHERE `id_lokasi` = \'32\'', 'Ridar Gustia', '2021-05-07 10:58:36', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(472, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'Ruang Arsip 1\', \'10\', \'50\', \'39\', \'ridargustia\')', 'Ridar Gustia', '2021-05-07 10:59:13', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(473, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'Ruang Arsip 2\', \'10\', \'50\', \'39\', \'ridargustia\')', 'Ridar Gustia', '2021-05-07 10:59:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(474, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'Ruang Arsip 1\', \'10\', \'53\', \'44\', \'rektoruad\')', 'Rektor UAD', '2021-05-07 11:01:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(475, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'Ruang Arsip 1\', \'10\', \'52\', \'43\', \'rektoruad\')', 'Rektor UAD', '2021-05-07 11:01:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(476, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'Ruang Arsip 1\', \'10\', \'50\', \'46\', \'dekanfti\')', 'Dekan FTI', '2021-05-07 11:03:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(477, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'Ruang Arsip 1\', \'10\', \'50\', \'41\', \'dekanfti\')', 'Dekan FTI', '2021-05-07 11:04:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(478, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'Ruang Arsip 3\', \'10\', \'50\', \'39\', \'kaproditif\')', 'Kaprodi TIF', '2021-05-07 11:05:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(479, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'Ruang Arsip 4\', \'10\', \'50\', \'39\', \'kaproditif\')', 'Kaprodi TIF', '2021-05-07 11:06:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(480, 'UPDATE `lokasi` SET `lokasi_name` = \'Ruang Arsip 5\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'ridargustia\'\nWHERE `id_lokasi` = \'35\'', 'Ridar Gustia', '2021-05-08 14:17:26', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(481, 'UPDATE `lokasi` SET `lokasi_name` = \'Ruang Arsip 2\', `instansi_id` = \'10\', `cabang_id` = \'53\', `divisi_id` = \'44\', `modified_by` = \'rektoruad\'\nWHERE `id_lokasi` = \'35\'', 'Rektor UAD', '2021-05-08 14:19:26', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(482, 'UPDATE `lokasi` SET `lokasi_name` = \'Ruang Arsip 2\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'46\', `modified_by` = \'dekanfti\'\nWHERE `id_lokasi` = \'40\'', 'Dekan FTI', '2021-05-08 14:21:11', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(483, 'UPDATE `lokasi` SET `lokasi_name` = \'Ruang Arsip 4\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'kaproditif\'\nWHERE `id_lokasi` = \'39\'', 'Kaprodi TIF', '2021-05-08 14:22:31', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(484, 'UPDATE `lokasi` SET `lokasi_name` = \'Ruang Arsip 3\', `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'39\', `modified_by` = \'kaproditif\'\nWHERE `id_lokasi` = \'39\'', 'Kaprodi TIF', '2021-05-08 14:22:58', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(485, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-08 14:44:pm\'\nWHERE `id_lokasi` = \'35\'', 'Ridar Gustia', '2021-05-08 14:44:32', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(486, 'DELETE FROM `lokasi`\nWHERE `id_lokasi` = \'32\'', 'Ridar Gustia', '2021-05-08 14:45:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(487, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_lokasi` = \'35\'', 'Ridar Gustia', '2021-05-08 14:45:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(488, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-05-08 14:46:pm\'\nWHERE `id_lokasi` = \'35\'', 'Rektor UAD', '2021-05-08 14:46:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(489, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_lokasi` = \'35\'', 'Rektor UAD', '2021-05-08 14:46:53', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(490, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-05-08 14:47:pm\'\nWHERE `id_lokasi` = \'39\'', 'Dekan FTI', '2021-05-08 14:47:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(491, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_lokasi` = \'39\'', 'Dekan FTI', '2021-05-08 14:47:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(492, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-05-08 14:48:pm\'\nWHERE `id_lokasi` = \'39\'', 'Dekan FTI', '2021-05-08 14:48:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(493, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_lokasi` = \'39\'', 'Dekan FTI', '2021-05-08 14:48:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(494, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-05-08 14:49:pm\'\nWHERE `id_lokasi` = \'39\'', 'Kaprodi TIF', '2021-05-08 14:49:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(495, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_lokasi` = \'39\'', 'Kaprodi TIF', '2021-05-08 14:49:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(496, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'1\', `deleted_by` = \'kaproditif\', `deleted_at` = \'2021-05-08 14:49:pm\'\nWHERE `id_lokasi` = \'39\'', 'Kaprodi TIF', '2021-05-08 14:49:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(497, 'DELETE FROM `lokasi`\nWHERE `id_lokasi` = \'39\'', 'Kaprodi TIF', '2021-05-08 14:50:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(498, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'1\', `deleted_by` = \'dekanfti\', `deleted_at` = \'2021-05-08 14:51:pm\'\nWHERE `id_lokasi` = \'40\'', 'Dekan FTI', '2021-05-08 14:51:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(499, 'DELETE FROM `lokasi`\nWHERE `id_lokasi` = \'40\'', 'Dekan FTI', '2021-05-08 14:51:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(500, 'UPDATE `lokasi` SET `is_delete_lokasi` = \'1\', `deleted_by` = \'rektoruad\', `deleted_at` = \'2021-05-08 14:54:pm\'\nWHERE `id_lokasi` = \'34\'', 'Rektor UAD', '2021-05-08 14:54:09', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(501, 'DELETE FROM `lokasi`\nWHERE `id_lokasi` = \'34\'', 'Rektor UAD', '2021-05-08 14:54:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(502, 'INSERT INTO `instansi` (`instansi_name`, `instansi_address`, `instansi_phone`, `active_date`, `is_active`, `instansi_img`, `instansi_img_thumb`, `created_by`) VALUES (\'Universitas Muhammadiyah Yogyakarta\', \'Jl. Brawijaya, Kasihan, Bantul, Yogyakarta 55183\', \'+62 274 387656\', \'2025-12-10\', \'1\', \'universitas-muhammadiyah-yogyakarta20210508153816.png\', \'universitas-muhammadiyah-yogyakarta20210508153816_thumb.png\', \'ridargustia\')', 'Ridar Gustia', '2021-05-08 15:38:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(503, 'UPDATE `instansi` SET `instansi_name` = \'Universitas Muhammadiyah Yogyakarta\', `instansi_address` = \'Jl. Brawijaya, Kasihan, Bantul, Yogyakarta 55183\', `instansi_phone` = \'0274387656\', `active_date` = \'2025-12-10\', `is_active` = \'1\', `modified_by` = \'ridargustia\'\nWHERE `id_instansi` = \'12\'', 'Ridar Gustia', '2021-05-08 15:38:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(504, 'UPDATE `instansi` SET `is_delete_instansi` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-08 15:39:pm\'\nWHERE `id_instansi` = \'12\'', 'Ridar Gustia', '2021-05-08 15:39:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(505, 'UPDATE `instansi` SET `is_delete_instansi` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_instansi` = \'12\'', 'Ridar Gustia', '2021-05-08 15:39:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(506, 'INSERT INTO `cabang` (`cabang_name`, `instansi_id`, `created_by`) VALUES (\'FAKULTAS KEDOKTERAN DAN ILMU KESEHATAN\', \'12\', \'ridargustia\')', 'Ridar Gustia', '2021-05-08 15:44:09', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(507, 'INSERT INTO `cabang` (`cabang_name`, `instansi_id`, `created_by`) VALUES (\'FAKULTAS TEKNIK\', \'12\', \'ridargustia\')', 'Ridar Gustia', '2021-05-08 15:45:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(508, 'UPDATE `cabang` SET `cabang_name` = \'FAKULTAS TEKNIK MESIN\', `instansi_id` = \'12\', `modified_by` = \'ridargustia\'\nWHERE `id_cabang` = \'55\'', 'Ridar Gustia', '2021-05-08 15:46:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(509, 'UPDATE `cabang` SET `cabang_name` = \'FAKULTAS TEKNIK\', `instansi_id` = \'12\', `modified_by` = \'ridargustia\'\nWHERE `id_cabang` = \'55\'', 'Ridar Gustia', '2021-05-08 15:47:04', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(510, 'UPDATE `cabang` SET `is_delete_cabang` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-08 15:47:pm\'\nWHERE `id_cabang` = \'55\'', 'Ridar Gustia', '2021-05-08 15:47:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(511, 'UPDATE `cabang` SET `is_delete_cabang` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_cabang` = \'55\'', 'Ridar Gustia', '2021-05-08 15:47:53', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(512, 'UPDATE `cabang` SET `is_delete_cabang` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-08 15:48:pm\'\nWHERE `id_cabang` = \'55\'', 'Ridar Gustia', '2021-05-08 15:48:04', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(513, 'DELETE FROM `cabang`\nWHERE `id_cabang` = \'55\'', 'Ridar Gustia', '2021-05-08 15:48:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(514, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'12\', \'54\', \'PENDIDIKAN DOKTER\', \'pendidikan-dokter\', \'ridargustia\')', 'Ridar Gustia', '2021-05-08 15:50:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(515, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'12\', \'54\', \'PENDIDIKAN DOKTER GIGI\', \'pendidikan-dokter-gigi\', \'ridargustia\')', 'Ridar Gustia', '2021-05-08 15:52:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(516, 'UPDATE `divisi` SET `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_name` = \'PENDIDIKAN DOKTER GIGI LO\', `divisi_slug` = \'pendidikan-dokter-gigi-lo\', `modified_by` = \'ridargustia\'\nWHERE `id_divisi` = \'48\'', 'Ridar Gustia', '2021-05-08 16:01:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(517, 'UPDATE `divisi` SET `instansi_id` = \'10\', `cabang_id` = \'52\', `divisi_name` = \'PENDIDIKAN DOKTER GIGI LO\', `divisi_slug` = \'pendidikan-dokter-gigi-lo\', `modified_by` = \'ridargustia\'\nWHERE `id_divisi` = \'48\'', 'Ridar Gustia', '2021-05-08 16:02:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(518, 'UPDATE `divisi` SET `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_name` = \'PENDIDIKAN DOKTER GIGI\', `divisi_slug` = \'pendidikan-dokter-gigi\', `modified_by` = \'ridargustia\'\nWHERE `id_divisi` = \'48\'', 'Ridar Gustia', '2021-05-08 16:02:50', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(519, 'UPDATE `divisi` SET `is_delete_divisi` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-08 16:03:pm\'\nWHERE `id_divisi` = \'48\'', 'Ridar Gustia', '2021-05-08 16:03:11', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(520, 'UPDATE `divisi` SET `is_delete_divisi` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_divisi` = \'48\'', 'Ridar Gustia', '2021-05-08 16:03:29', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(521, 'UPDATE `divisi` SET `is_delete_divisi` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-08 16:03:pm\'\nWHERE `id_divisi` = \'48\'', 'Ridar Gustia', '2021-05-08 16:03:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(522, 'DELETE FROM `divisi`\nWHERE `id_divisi` = \'48\'', 'Ridar Gustia', '2021-05-08 16:04:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(523, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'12\', \'54\', \'47\', \'TATA USAHA\', \'tata-usaha\', \'ridargustia\')', 'Ridar Gustia', '2021-05-08 16:09:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(524, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'12\', \'54\', \'47\', \'MAHASISWA\', \'mahasiswa\', \'ridargustia\')', 'Ridar Gustia', '2021-05-08 16:10:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(525, 'UPDATE `bagian` SET `instansi_id` = \'10\', `cabang_id` = \'50\', `divisi_id` = \'41\', `bagian_name` = \'MAHASISWA LO\', `bagian_slug` = \'mahasiswa-lo\', `modified_by` = \'ridargustia\'\nWHERE `id_bagian` = \'11\'', 'Ridar Gustia', '2021-05-08 16:21:58', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(526, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-08 16:25:pm\'\nWHERE `id_bagian` = \'11\'', 'Ridar Gustia', '2021-05-08 16:25:01', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(527, 'UPDATE `bagian` SET `is_delete_bagian` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_bagian` = \'11\'', 'Ridar Gustia', '2021-05-08 16:25:13', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(528, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-08 16:25:pm\'\nWHERE `id_bagian` = \'11\'', 'Ridar Gustia', '2021-05-08 16:25:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(529, 'DELETE FROM `bagian`\nWHERE `id_bagian` = \'11\'', 'Ridar Gustia', '2021-05-08 16:26:09', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(530, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Rektor UMY\', \'\', \'\', \'1\', \'\', \'\', \'rektorumy@gmail.com\', \'rektorumy\', \'$2y$10$qvqOn0P4Vmfj27kD36IyVeTJBZ4yNFqLLrSvqftSRNPfJsViNzA5K\', \'12\', \'54\', \'47\', \'1\', \'ridargustia\', \'::1\')', 'Ridar Gustia', '2021-05-08 16:40:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(531, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, \'1\')', 'Ridar Gustia', '2021-05-08 16:40:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(532, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, \'2\')', 'Ridar Gustia', '2021-05-08 16:40:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(533, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, \'3\')', 'Ridar Gustia', '2021-05-08 16:40:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(534, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, \'4\')', 'Ridar Gustia', '2021-05-08 16:40:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(535, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, \'5\')', 'Ridar Gustia', '2021-05-08 16:40:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(536, 'UPDATE `users` SET `name` = \'Rektor UMY LO\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'rektorumy@gmail.com\', `username` = \'rektorumy\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `usertype_id` = \'2\', `modified_by` = \'ridargustia\'\nWHERE `id_users` = \'57\'', 'Ridar Gustia', '2021-05-08 16:42:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(537, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'57\', \'1\')', 'Ridar Gustia', '2021-05-08 16:42:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(538, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'57\', \'2\')', 'Ridar Gustia', '2021-05-08 16:42:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(539, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'57\', \'3\')', 'Ridar Gustia', '2021-05-08 16:42:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(540, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'57\', \'4\')', 'Ridar Gustia', '2021-05-08 16:42:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(541, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'57\', \'5\')', 'Ridar Gustia', '2021-05-08 16:42:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(542, 'UPDATE `users` SET `name` = \'Rektor UMY\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'rektorumy@gmail.com\', `username` = \'rektorumy\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `usertype_id` = \'1\', `modified_by` = \'ridargustia\'\nWHERE `id_users` = \'57\'', 'Ridar Gustia', '2021-05-08 16:42:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(543, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'57\', \'1\')', 'Ridar Gustia', '2021-05-08 16:42:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(544, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'57\', \'2\')', 'Ridar Gustia', '2021-05-08 16:42:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(545, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'57\', \'3\')', 'Ridar Gustia', '2021-05-08 16:42:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(546, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'57\', \'4\')', 'Ridar Gustia', '2021-05-08 16:42:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(547, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'57\', \'5\')', 'Ridar Gustia', '2021-05-08 16:42:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(548, 'INSERT INTO `cabang` (`cabang_name`, `instansi_id`, `created_by`) VALUES (\'FAKULTAS TEKNIK\', \'12\', \'rektorumy\')', 'Rektor UMY', '2021-05-08 16:47:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(549, 'UPDATE `cabang` SET `cabang_name` = \'FAKULTAS TEKNIK LO\', `instansi_id` = \'12\', `modified_by` = \'rektorumy\'\nWHERE `id_cabang` = \'56\'', 'Rektor UMY', '2021-05-08 16:47:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(550, 'UPDATE `cabang` SET `cabang_name` = \'FAKULTAS TEKNIK\', `instansi_id` = \'12\', `modified_by` = \'rektorumy\'\nWHERE `id_cabang` = \'56\'', 'Rektor UMY', '2021-05-08 16:48:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(551, 'UPDATE `cabang` SET `is_delete_cabang` = \'1\', `deleted_by` = \'rektorumy\', `deleted_at` = \'2021-05-08 16:48:pm\'\nWHERE `id_cabang` = \'56\'', 'Rektor UMY', '2021-05-08 16:48:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(552, 'UPDATE `cabang` SET `is_delete_cabang` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_cabang` = \'56\'', 'Rektor UMY', '2021-05-08 16:48:36', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(553, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'12\', \'56\', \'ILMU TEKNIK\', \'ilmu-teknik\', \'rektorumy\')', 'Rektor UMY', '2021-05-08 16:59:09', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(554, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'12\', \'56\', \'TEKNIK MESIN\', \'teknik-mesin\', \'rektorumy\')', 'Rektor UMY', '2021-05-08 17:00:21', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(555, 'UPDATE `divisi` SET `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_name` = \'TEKNIK MESIN LO\', `divisi_slug` = \'teknik-mesin-lo\', `modified_by` = \'rektorumy\'\nWHERE `id_divisi` = \'50\'', 'Rektor UMY', '2021-05-08 17:19:55', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(556, 'UPDATE `divisi` SET `instansi_id` = \'12\', `cabang_id` = \'56\', `divisi_name` = \'TEKNIK MESIN\', `divisi_slug` = \'teknik-mesin\', `modified_by` = \'rektorumy\'\nWHERE `id_divisi` = \'50\'', 'Rektor UMY', '2021-05-08 17:20:08', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(557, 'UPDATE `divisi` SET `is_delete_divisi` = \'1\', `deleted_by` = \'rektorumy\', `deleted_at` = \'2021-05-08 17:20:pm\'\nWHERE `id_divisi` = \'50\'', 'Rektor UMY', '2021-05-08 17:20:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(558, 'UPDATE `divisi` SET `is_delete_divisi` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_divisi` = \'50\'', 'Rektor UMY', '2021-05-08 17:21:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(559, 'UPDATE `divisi` SET `is_delete_divisi` = \'1\', `deleted_by` = \'rektorumy\', `deleted_at` = \'2021-05-08 17:21:pm\'\nWHERE `id_divisi` = \'50\'', 'Rektor UMY', '2021-05-08 17:21:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(560, 'DELETE FROM `divisi`\nWHERE `id_divisi` = \'50\'', 'Rektor UMY', '2021-05-08 17:21:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(561, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'12\', \'56\', \'49\', \'TATA USAHA\', \'tata-usaha\', \'rektorumy\')', 'Rektor UMY', '2021-05-08 17:24:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(562, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'12\', \'56\', \'49\', \'MAHASISWA\', \'mahasiswa\', \'rektorumy\')', 'Rektor UMY', '2021-05-08 17:24:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(563, 'UPDATE `bagian` SET `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `bagian_name` = \'MAHASISWA\', `bagian_slug` = \'mahasiswa\', `modified_by` = \'rektorumy\'\nWHERE `id_bagian` = \'13\'', 'Rektor UMY', '2021-05-08 17:26:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(564, 'UPDATE `bagian` SET `instansi_id` = \'12\', `cabang_id` = \'56\', `divisi_id` = \'49\', `bagian_name` = \'MAHASISWA\', `bagian_slug` = \'mahasiswa\', `modified_by` = \'rektorumy\'\nWHERE `id_bagian` = \'13\'', 'Rektor UMY', '2021-05-08 17:26:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(565, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'rektorumy\', `deleted_at` = \'2021-05-08 17:27:pm\'\nWHERE `id_bagian` = \'13\'', 'Rektor UMY', '2021-05-08 17:27:13', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(566, 'UPDATE `bagian` SET `is_delete_bagian` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_bagian` = \'13\'', 'Rektor UMY', '2021-05-08 17:27:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(567, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'rektorumy\', `deleted_at` = \'2021-05-08 17:28:pm\'\nWHERE `id_bagian` = \'13\'', 'Rektor UMY', '2021-05-08 17:28:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(568, 'DELETE FROM `bagian`\nWHERE `id_bagian` = \'13\'', 'Rektor UMY', '2021-05-08 17:28:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(569, 'UPDATE `instansi` SET `instansi_address` = \'Kampus Terpadu UMY, Jl. Brawijaya, Kasihan, Bantul, Yogyakarta 55183\', `instansi_phone` = \'0274387656\', `modified_by` = \'rektorumy\'\nWHERE `id_instansi` = \'12\'', 'Rektor UMY', '2021-05-08 20:37:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(570, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Dekan FKIK\', \'06/04/1980\', \'Yogyakarta\', \'1\', \'Kasihan, Bantul, Yogyakarta\', \'089697641302\', \'dekanfkik@gmail.com\', \'dekanfkik\', \'$2y$10$Lka7jU7WgddUYQCflHSd.usStBPMk9bK/zSOC70XkV0JU6i76AxHu\', \'12\', \'54\', \'47\', \'2\', \'rektorumy\', \'::1\')', 'Rektor UMY', '2021-05-08 20:51:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(571, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, \'1\')', 'Rektor UMY', '2021-05-08 20:51:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(572, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, \'2\')', 'Rektor UMY', '2021-05-08 20:51:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(573, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, \'3\')', 'Rektor UMY', '2021-05-08 20:51:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(574, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, \'4\')', 'Rektor UMY', '2021-05-08 20:51:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(575, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, \'5\')', 'Rektor UMY', '2021-05-08 20:51:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(576, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Mahasiswa\', \'\', \'\', \'1\', \'\', \'\', \'mahasiswa@gmail.com\', \'mahasiswa\', \'$2y$10$uuie8Ew5fUbfOEXlDSkgMu7BNgneyT32CA0ymp./4pQOxC9X7gW8C\', \'12\', \'54\', \'47\', \'6\', \'rektorumy\', \'::1\')', 'Rektor UMY', '2021-05-08 20:54:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(577, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, \'1\')', 'Rektor UMY', '2021-05-08 20:54:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(578, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, \'2\')', 'Rektor UMY', '2021-05-08 20:54:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(579, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, \'3\')', 'Rektor UMY', '2021-05-08 20:54:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(580, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, \'4\')', 'Rektor UMY', '2021-05-08 20:54:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(581, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, \'5\')', 'Rektor UMY', '2021-05-08 20:54:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(582, 'UPDATE `users` SET `is_delete` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-08 21:37:pm\'\nWHERE `id_users` = \'59\'', 'Ridar Gustia', '2021-05-08 21:37:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(583, 'UPDATE `users` SET `is_delete` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-08 21:37:pm\'\nWHERE `id_users` = \'58\'', 'Ridar Gustia', '2021-05-08 21:37:13', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(584, 'UPDATE `users` SET `is_delete` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-08 21:38:pm\'\nWHERE `id_users` = \'57\'', 'Ridar Gustia', '2021-05-08 21:38:21', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(585, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'12\', \'54\', \'47\', \'REKTOR\', \'rektor\', \'ridargustia\')', 'Ridar Gustia', '2021-05-09 12:44:14', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(586, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Rektor UMY\', \'06/04/1985\', \'Yogyakarta\', \'1\', \'Kasihan, Bantul, Yogyakarta\', \'089697641302\', \'rektorumy@gmail.com\', \'rektorumy\', \'$2y$10$tAjRpe3HMr9OtSXB2bX/IOo3UL1MU.1it2ZyhF3TOlKK4bU8vlqza\', \'12\', \'54\', \'47\', \'13\', \'1\', \'ridargustia\', \'::1\')', 'Ridar Gustia', '2021-05-09 13:26:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(587, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, \'1\')', 'Ridar Gustia', '2021-05-09 13:26:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(588, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, \'2\')', 'Ridar Gustia', '2021-05-09 13:26:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(589, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, \'3\')', 'Ridar Gustia', '2021-05-09 13:26:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(590, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, \'4\')', 'Ridar Gustia', '2021-05-09 13:26:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(591, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, \'5\')', 'Ridar Gustia', '2021-05-09 13:26:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(592, 'UPDATE `bagian` SET `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `bagian_name` = \'REKTORAT\', `bagian_slug` = \'rektorat\', `modified_by` = \'rektorumy\'\nWHERE `id_bagian` = \'13\'', 'Rektor UMY', '2021-05-09 13:32:58', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(593, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'12\', \'54\', \'47\', \'FAKULTAS\', \'fakultas\', \'rektorumy\')', 'Rektor UMY', '2021-05-09 13:33:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(594, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Dekan FKIK\', \'\', \'\', \'2\', \'Condongcatur, Sleman, Yogyakarta\', \'089697641303\', \'dekanfkik@gmail.com\', \'dekanfkik\', \'$2y$10$Gh3fLGKDvPt/bATvP/WoR.lSa.z.3FrMJgl8Il9Ue/DBAJXtcyDdu\', \'12\', \'54\', \'47\', \'14\', \'2\', \'rektorumy\', \'::1\')', 'Rektor UMY', '2021-05-09 13:37:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(595, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, \'1\')', 'Rektor UMY', '2021-05-09 13:37:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(596, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, \'2\')', 'Rektor UMY', '2021-05-09 13:37:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(597, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, \'3\')', 'Rektor UMY', '2021-05-09 13:37:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(598, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, \'4\')', 'Rektor UMY', '2021-05-09 13:37:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(599, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, \'5\')', 'Rektor UMY', '2021-05-09 13:37:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(600, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'12\', \'54\', \'47\', \'PRODI\', \'prodi\', \'dekanfkik\')', 'Dekan FKIK', '2021-05-09 13:41:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(601, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Kaprodi Pend. Dokter\', \'\', \'\', \'1\', \'\', \'\', \'kaprodidokter@gmail.com\', \'kaprodidokter\', \'$2y$10$G/FxpVxpeu2.FGtFPLBG9ed3tYP5pwnjKUEG9o4A/DJEiqRIJ4Lfa\', \'12\', \'54\', \'47\', \'15\', \'3\', \'dekanfkik\', \'::1\')', 'Dekan FKIK', '2021-05-09 13:45:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(602, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, \'1\')', 'Dekan FKIK', '2021-05-09 13:45:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(603, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, \'2\')', 'Dekan FKIK', '2021-05-09 13:45:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(604, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, \'3\')', 'Dekan FKIK', '2021-05-09 13:45:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(605, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, \'4\')', 'Dekan FKIK', '2021-05-09 13:45:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(606, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, \'5\')', 'Dekan FKIK', '2021-05-09 13:45:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(607, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Tata Usaha Pend. Dokter\', \'\', \'\', \'1\', \'\', \'\', \'tudokter@gmail.com\', \'tudokter\', \'$2y$10$BtiYRC6uNfxQMS.cpJ4o..p.1JE2In..92JVTnQ6/38BA4oxi1goW\', \'12\', \'54\', \'47\', \'10\', \'4\', \'kaprodidokter\', \'::1\', \'tudokter20210509141133.png\', \'tudokter20210509141133_thumb.png\')', 'Kaprodi Pend. Dokter', '2021-05-09 14:11:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(608, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (60, \'1\')', 'Kaprodi Pend. Dokter', '2021-05-09 14:11:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(609, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (60, \'2\')', 'Kaprodi Pend. Dokter', '2021-05-09 14:11:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(610, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (60, \'3\')', 'Kaprodi Pend. Dokter', '2021-05-09 14:11:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(611, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (60, \'4\')', 'Kaprodi Pend. Dokter', '2021-05-09 14:11:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(612, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (60, \'5\')', 'Kaprodi Pend. Dokter', '2021-05-09 14:11:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(613, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Staff Administrasi\', \'\', \'\', \'1\', \'\', \'\', \'staffadmin@gmail.com\', \'staffadmin\', \'$2y$10$F0UoBhqTDzdPyAXG7szybObks.Fk5dEGF.c.v/Guld3PKDrW8F67y\', \'12\', \'54\', \'47\', \'10\', \'6\', \'kaprodidokter\', \'::1\')', 'Kaprodi Pend. Dokter', '2021-05-09 14:23:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(614, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (61, \'1\')', 'Kaprodi Pend. Dokter', '2021-05-09 14:23:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(615, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (61, \'2\')', 'Kaprodi Pend. Dokter', '2021-05-09 14:23:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(616, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (61, \'3\')', 'Kaprodi Pend. Dokter', '2021-05-09 14:23:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(617, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (61, \'4\')', 'Kaprodi Pend. Dokter', '2021-05-09 14:23:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(618, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (61, \'5\')', 'Kaprodi Pend. Dokter', '2021-05-09 14:23:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(619, 'UPDATE `users` SET `name` = \'Staff Administrasi\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'staffadmin@gmail.com\', `username` = \'staffadmin\', `instansi_id` = \'10\', `cabang_id` = \'52\', `divisi_id` = \'42\', `bagian_id` = \'7\', `usertype_id` = \'6\', `modified_by` = \'ridargustia\'\nWHERE `id_users` = \'61\'', 'Ridar Gustia', '2021-05-09 21:05:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(620, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'61\', \'1\')', 'Ridar Gustia', '2021-05-09 21:05:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(621, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'61\', \'2\')', 'Ridar Gustia', '2021-05-09 21:05:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(622, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'61\', \'3\')', 'Ridar Gustia', '2021-05-09 21:05:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(623, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'61\', \'4\')', 'Ridar Gustia', '2021-05-09 21:05:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(624, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'61\', \'5\')', 'Ridar Gustia', '2021-05-09 21:05:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(625, 'UPDATE `users` SET `name` = \'Staff Administrasi\', `birthdate` = \'03/05/1996\', `birthplace` = \'Sleman\', `gender` = \'1\', `address` = \'Condong Catur, Sleman, Yogyakarta\', `phone` = \'089697641305\', `email` = \'staffadmin@gmail.com\', `username` = \'staffadmin\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `bagian_id` = \'10\', `usertype_id` = \'6\', `modified_by` = \'ridargustia\'\nWHERE `id_users` = \'61\'', 'Ridar Gustia', '2021-05-09 21:10:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(626, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'61\', \'1\')', 'Ridar Gustia', '2021-05-09 21:10:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(627, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'61\', \'2\')', 'Ridar Gustia', '2021-05-09 21:10:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(628, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'61\', \'3\')', 'Ridar Gustia', '2021-05-09 21:10:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(629, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'61\', \'4\')', 'Ridar Gustia', '2021-05-09 21:10:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(630, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'61\', \'5\')', 'Ridar Gustia', '2021-05-09 21:10:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36');
INSERT INTO `log_queries` (`id`, `content`, `created_by`, `created_at`, `ip_address`, `user_agent`) VALUES
(631, 'UPDATE `users` SET `name` = \'Tata Usaha Pend. Dokter\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'tudokter@gmail.com\', `username` = \'tudokter\', `instansi_id` = \'12\', `cabang_id` = \'56\', `divisi_id` = \'49\', `bagian_id` = \'12\', `usertype_id` = \'4\', `modified_by` = \'rektorumy\'\nWHERE `id_users` = \'60\'', 'Rektor UMY', '2021-05-09 21:13:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(632, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'1\')', 'Rektor UMY', '2021-05-09 21:13:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(633, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'2\')', 'Rektor UMY', '2021-05-09 21:13:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(634, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'3\')', 'Rektor UMY', '2021-05-09 21:13:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(635, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'4\')', 'Rektor UMY', '2021-05-09 21:13:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(636, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'5\')', 'Rektor UMY', '2021-05-09 21:13:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(637, 'UPDATE `users` SET `name` = \'Tata Usaha Pend. Dokter\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'tudokter@gmail.com\', `username` = \'tudokter\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `bagian_id` = \'10\', `usertype_id` = \'4\', `modified_by` = \'rektorumy\'\nWHERE `id_users` = \'60\'', 'Rektor UMY', '2021-05-09 21:13:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(638, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'1\')', 'Rektor UMY', '2021-05-09 21:13:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(639, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'2\')', 'Rektor UMY', '2021-05-09 21:13:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(640, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'3\')', 'Rektor UMY', '2021-05-09 21:13:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(641, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'4\')', 'Rektor UMY', '2021-05-09 21:13:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(642, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'5\')', 'Rektor UMY', '2021-05-09 21:13:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(643, 'UPDATE `users` SET `name` = \'Tata Usaha Pend. Dokter\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'tudokter@gmail.com\', `username` = \'tudokter\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `bagian_id` = \'10\', `usertype_id` = \'4\', `modified_by` = \'dekanfkik\'\nWHERE `id_users` = \'60\'', 'Dekan FKIK', '2021-05-09 21:15:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(644, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'1\')', 'Dekan FKIK', '2021-05-09 21:15:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(645, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'2\')', 'Dekan FKIK', '2021-05-09 21:15:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(646, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'3\')', 'Dekan FKIK', '2021-05-09 21:15:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(647, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'4\')', 'Dekan FKIK', '2021-05-09 21:15:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(648, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'5\')', 'Dekan FKIK', '2021-05-09 21:15:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(649, 'UPDATE `users` SET `name` = \'Tata Usaha Pend. Dokter\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'tudokter@gmail.com\', `username` = \'tudokter\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `bagian_id` = \'15\', `usertype_id` = \'4\', `modified_by` = \'dekanfkik\'\nWHERE `id_users` = \'60\'', 'Dekan FKIK', '2021-05-09 21:16:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(650, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'1\')', 'Dekan FKIK', '2021-05-09 21:16:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(651, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'2\')', 'Dekan FKIK', '2021-05-09 21:16:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(652, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'3\')', 'Dekan FKIK', '2021-05-09 21:16:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(653, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'4\')', 'Dekan FKIK', '2021-05-09 21:16:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(654, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'5\')', 'Dekan FKIK', '2021-05-09 21:16:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(655, 'UPDATE `users` SET `name` = \'Tata Usaha Pend. Dokter\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'tudokter@gmail.com\', `username` = \'tudokter\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `bagian_id` = \'10\', `usertype_id` = \'4\', `modified_by` = \'dekanfkik\'\nWHERE `id_users` = \'60\'', 'Dekan FKIK', '2021-05-09 21:16:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(656, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'1\')', 'Dekan FKIK', '2021-05-09 21:16:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(657, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'2\')', 'Dekan FKIK', '2021-05-09 21:16:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(658, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'3\')', 'Dekan FKIK', '2021-05-09 21:16:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(659, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'4\')', 'Dekan FKIK', '2021-05-09 21:16:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(660, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'5\')', 'Dekan FKIK', '2021-05-09 21:16:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(661, 'UPDATE `users` SET `name` = \'Tata Usaha Pend. Dokter\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'tudokter@gmail.com\', `username` = \'tudokter\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `bagian_id` = \'13\', `usertype_id` = \'4\', `modified_by` = \'kaprodidokter\'\nWHERE `id_users` = \'60\'', 'Kaprodi Pend. Dokter', '2021-05-09 21:18:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(662, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'1\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:18:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(663, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'2\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:18:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(664, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'3\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:18:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(665, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'4\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:18:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(666, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'5\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:18:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(667, 'UPDATE `users` SET `name` = \'Tata Usaha Pend. Dokter\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'tudokter@gmail.com\', `username` = \'tudokter\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `bagian_id` = \'13\', `usertype_id` = \'6\', `modified_by` = \'kaprodidokter\'\nWHERE `id_users` = \'60\'', 'Kaprodi Pend. Dokter', '2021-05-09 21:19:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(668, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'1\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:19:20', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(669, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'2\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:19:20', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(670, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'3\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:19:20', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(671, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'4\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:19:20', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(672, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'5\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:19:20', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(673, 'UPDATE `users` SET `name` = \'Tata Usaha Pend. Dokter\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'tudokter@gmail.com\', `username` = \'tudokter\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `bagian_id` = \'10\', `usertype_id` = \'4\', `modified_by` = \'kaprodidokter\'\nWHERE `id_users` = \'60\'', 'Kaprodi Pend. Dokter', '2021-05-09 21:21:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(674, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'1\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:21:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(675, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'2\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:21:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(676, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'3\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:21:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(677, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'4\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:21:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(678, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'60\', \'5\')', 'Kaprodi Pend. Dokter', '2021-05-09 21:21:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(679, 'UPDATE `users` SET `is_delete` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-09 21:56:pm\'\nWHERE `id_users` = \'61\'', 'Ridar Gustia', '2021-05-09 21:56:26', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(680, 'UPDATE `users` SET `is_delete` = \'1\', `deleted_by` = \'rektorumy\', `deleted_at` = \'2021-05-09 21:58:pm\'\nWHERE `id_users` = \'60\'', 'Rektor UMY', '2021-05-09 21:58:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(681, 'UPDATE `users` SET `is_delete` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-11 13:31:pm\'\nWHERE `id_users` = \'61\'', 'Ridar Gustia', '2021-05-11 13:31:45', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(682, 'UPDATE `users` SET `is_delete` = \'1\', `deleted_by` = \'rektorumy\', `deleted_at` = \'2021-05-11 13:41:pm\'\nWHERE `id_users` = \'60\'', 'Rektor UMY', '2021-05-11 13:41:32', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(683, 'UPDATE `users` SET `is_delete` = \'1\', `deleted_by` = \'dekanfkik\', `deleted_at` = \'2021-05-11 13:43:pm\'\nWHERE `id_users` = \'59\'', 'Dekan FKIK', '2021-05-11 13:43:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(684, 'UPDATE `users` SET `is_delete` = \'1\', `deleted_by` = \'dekanfkik\', `deleted_at` = \'2021-05-11 14:17:pm\'\nWHERE `id_users` = \'61\'', 'Dekan FKIK', '2021-05-11 14:17:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(685, 'UPDATE `users` SET `is_delete` = \'1\', `deleted_by` = \'kaprodidokter\', `deleted_at` = \'2021-05-11 14:19:pm\'\nWHERE `id_users` = \'60\'', 'Kaprodi Pend. Dokter', '2021-05-11 14:19:56', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(686, 'UPDATE `users` SET `name` = \'Rektor UMY\', `birthdate` = \'06/04/1985\', `birthplace` = \'Yogyakarta\', `gender` = \'1\', `address` = \'Kasihan, Bantul, Yogyakarta\', `phone` = \'089697641302\', `email` = \'rektorumy@gmail.com\', `username` = \'rektorumy\', `modified_by` = \'rektorumy\', `photo` = \'rektorumy20210511142855.png\', `photo_thumb` = \'rektorumy20210511142855_thumb.png\'\nWHERE `id_users` = \'57\'', 'Rektor UMY', '2021-05-11 14:28:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(687, 'UPDATE `users` SET `name` = \'Dekan FKIK\', `birthdate` = \'02/20/1990\', `birthplace` = \'Jakarta\', `gender` = \'2\', `address` = \'Condongcatur, Sleman, Yogyakarta\', `phone` = \'089697641303\', `email` = \'dekanfkik@gmail.com\', `username` = \'dekanfkik\', `modified_by` = \'dekanfkik\', `photo` = \'dekanfkik20210511143137.png\', `photo_thumb` = \'dekanfkik20210511143137_thumb.png\'\nWHERE `id_users` = \'58\'', 'Dekan FKIK', '2021-05-11 14:31:38', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(688, 'UPDATE `users` SET `name` = \'Kaprodi Pend. Dokter\', `birthdate` = \'01/01/1998\', `birthplace` = \'Pati\', `gender` = \'1\', `address` = \'Godean\', `phone` = \'085739200383\', `email` = \'kaprodidokter@gmail.com\', `username` = \'kaprodidokter\', `modified_by` = \'kaprodidokter\', `photo` = \'kaprodidokter20210511143428.png\', `photo_thumb` = \'kaprodidokter20210511143428_thumb.png\'\nWHERE `id_users` = \'59\'', 'Kaprodi Pend. Dokter', '2021-05-11 14:34:29', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(689, 'UPDATE `users` SET `name` = \'Tata Usaha Pend. Dokter\', `birthdate` = \'06/22/1989\', `birthplace` = \'Cirebon\', `gender` = \'2\', `address` = \'Gamping, Sleman, Yogyakarta\', `phone` = \'083192837485\', `email` = \'tudokter@gmail.com\', `username` = \'tudokter\', `modified_by` = \'tudokter\'\nWHERE `id_users` = \'60\'', 'Tata Usaha Pend. Dokter', '2021-05-11 14:37:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(690, 'UPDATE `users` SET `password` = \'$2y$10$TJm7l1vp1FfjMfOx6WG/au9rHjbnCUwSNt3OvBkKtmMD.A3Di9xJa\'\nWHERE `id_users` = \'57\'', 'Ridar Gustia', '2021-05-11 15:47:26', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(691, 'UPDATE `users` SET `password` = \'$2y$10$z6ux1ecBgGy75JDfKNfoTOCbz9Ztg.APWLsLvLPVlD1wAp8Pj83IO\'\nWHERE `id_users` = \'58\'', 'Rektor UMY', '2021-05-11 15:52:14', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(692, 'UPDATE `users` SET `password` = \'$2y$10$iPBf0NaL0ctNRq2IoiQrNuQ2zHmCaonam9Ut0LHYx30qG0L7tA7w.\'\nWHERE `id_users` = \'59\'', 'Dekan FKIK', '2021-05-11 15:54:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(693, 'UPDATE `users` SET `password` = \'$2y$10$M.7UPlK.wfs.Lo6G70ZF8esC3T5fNBJkoXQDvSdb7EUIHWawwigQa\'\nWHERE `id_users` = \'60\'', 'Kaprodi Pend. Dokter', '2021-05-11 15:55:38', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(694, 'UPDATE `users` SET `password` = \'$2y$10$X04whWYAZYc3Ido3V9QuJOp8jga0Mqxjf4bMwr0RdMkdbNPv/Pg..\'\nWHERE `id_users` IS NULL', 'Tata Usaha Pend. Dokter', '2021-05-11 15:57:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(695, 'UPDATE `users` SET `password` = \'$2y$10$aAzQOSOXHHHbCPRx9YR7rePr3T4MymZ2mrC28YGRuCFHMSU.hlNzS\'\nWHERE `id_users` = \'60\'', 'Tata Usaha Pend. Dokter', '2021-05-11 16:09:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(696, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'12\', \'54\', \'47\', \'ridargustia\')', 'Ridar Gustia', '2021-05-12 15:00:14', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(697, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'12\', \'54\', \'47\', \'ridargustia\')', 'Ridar Gustia', '2021-05-12 15:00:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(698, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'12\', \'54\', \'47\', \'ridargustia\')', 'Ridar Gustia', '2021-05-12 15:00:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(699, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'12\', \'54\', \'47\', \'ridargustia\')', 'Ridar Gustia', '2021-05-12 15:01:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(700, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'Ruang Arsip\', \'12\', \'54\', \'47\', \'ridargustia\')', 'Ridar Gustia', '2021-05-12 15:01:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(701, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'12\', \'54\', \'47\', \'10\', \'60\', \'39\', \'60\', \'8\', \'56\', \'14\', \'123\', \'TEST ARSIP 1\', \'test arsip 1\', \'1\', \'2029-03-14\', \'1\', \'1\', \'ridargustia\')', 'Ridar Gustia', '2021-05-12 15:03:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(702, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (1, \'5\')', 'Ridar Gustia', '2021-05-12 15:03:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(703, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-12\', \'2021-05-14\', \'1\', \'58\', \'12\', \'54\', \'47\', \'10\', \'ridargustia\')', 'Ridar Gustia', '2021-05-12 15:04:31', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(704, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'1\'', 'Ridar Gustia', '2021-05-12 15:04:31', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(705, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'12\', \'54\', \'Ilmu Keperawatan\', \'ilmu-keperawatan\', \'rektorumy\')', 'Rektor UMY', '2021-05-12 15:10:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(706, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'12\', \'54\', \'50\', \'Tata Usaha\', \'tata-usaha\', \'rektorumy\')', 'Rektor UMY', '2021-05-12 15:11:13', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(707, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'12\', \'54\', \'50\', \'rektorumy\')', 'Rektor UMY', '2021-05-12 15:11:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(708, 'UPDATE `divisi` SET `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_name` = \'ILMU KEPERAWATAN\', `divisi_slug` = \'ilmu-keperawatan\', `modified_by` = \'rektorumy\'\nWHERE `id_divisi` = \'50\'', 'Rektor UMY', '2021-05-12 15:12:29', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(709, 'UPDATE `bagian` SET `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'50\', `bagian_name` = \'TATA USAHA\', `bagian_slug` = \'tata-usaha\', `modified_by` = \'rektorumy\'\nWHERE `id_bagian` = \'16\'', 'Rektor UMY', '2021-05-12 15:12:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(710, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'12\', \'54\', \'50\', \'rektorumy\')', 'Rektor UMY', '2021-05-12 15:13:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(711, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'12\', \'54\', \'50\', \'rektorumy\')', 'Rektor UMY', '2021-05-12 15:13:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(712, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'12\', \'54\', \'50\', \'rektorumy\')', 'Rektor UMY', '2021-05-12 15:14:11', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(713, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'12\', \'54\', \'50\', \'rektorumy\')', 'Rektor UMY', '2021-05-12 15:14:32', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(714, 'UPDATE `lokasi` SET `lokasi_name` = \'Ruang Arsip\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'50\', `modified_by` = \'rektorumy\'\nWHERE `id_lokasi` = \'40\'', 'Rektor UMY', '2021-05-12 15:14:53', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(715, 'UPDATE `lokasi` SET `lokasi_name` = \'RUANG ARSIP\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `modified_by` = \'rektorumy\'\nWHERE `id_lokasi` = \'39\'', 'Rektor UMY', '2021-05-12 15:15:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(716, 'UPDATE `lokasi` SET `lokasi_name` = \'RUANG ARSIP\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'50\', `modified_by` = \'rektorumy\'\nWHERE `id_lokasi` = \'40\'', 'Rektor UMY', '2021-05-12 15:15:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(717, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'Tata Usaha Keperawatan\', \'\', \'\', \'1\', \'\', \'\', \'tukeperawatan@gmail.com\', \'tukeperawatan\', \'$2y$10$W/nrIfGBnWV/KU6.by0toO7FkoBNgxjSslaiM1YBmKiVrnOcKOGlq\', \'12\', \'54\', \'50\', \'16\', \'4\', \'rektorumy\', \'::1\')', 'Rektor UMY', '2021-05-12 15:18:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(718, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (62, \'1\')', 'Rektor UMY', '2021-05-12 15:18:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(719, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (62, \'2\')', 'Rektor UMY', '2021-05-12 15:18:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(720, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (62, \'3\')', 'Rektor UMY', '2021-05-12 15:18:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(721, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (62, \'4\')', 'Rektor UMY', '2021-05-12 15:18:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(722, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (62, \'5\')', 'Rektor UMY', '2021-05-12 15:18:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(723, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'12\', \'54\', \'47\', \'10\', \'61\', \'39\', \'60\', \'8\', \'56\', \'14\', \'123.1\', \'TEST ARSIP 2\', \'test arsip 2\', \'1\', \'2025-06-10\', \'1\', \'1\', \'rektorumy\')', 'Rektor UMY', '2021-05-12 15:22:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(724, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (2, \'5\')', 'Rektor UMY', '2021-05-12 15:22:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(725, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-12\', \'2021-05-20\', \'2\', \'57\', \'12\', \'54\', \'47\', \'10\', \'rektorumy\')', 'Rektor UMY', '2021-05-12 15:23:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(726, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'2\'', 'Rektor UMY', '2021-05-12 15:23:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(727, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'12\', \'54\', \'47\', \'10\', \'60\', \'39\', \'60\', \'8\', \'56\', \'14\', \'123.2\', \'TEST ARSIP 3\', \'test arsip 3\', \'1\', \'2025-03-12\', \'1\', \'1\', \'dekanfkik\')', 'Dekan FKIK', '2021-05-12 15:26:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(728, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (3, \'5\')', 'Dekan FKIK', '2021-05-12 15:26:27', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(729, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-12\', \'2021-05-13\', \'3\', \'59\', \'12\', \'54\', \'47\', \'10\', \'dekanfkik\')', 'Dekan FKIK', '2021-05-12 15:27:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(730, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'3\'', 'Dekan FKIK', '2021-05-12 15:27:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(731, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'12\', \'54\', \'47\', \'10\', \'60\', \'39\', \'60\', \'8\', \'56\', \'14\', \'123.3\', \'TEST ARSIP 4\', \'test arsip 4\', \'1\', \'2025-07-30\', \'1\', \'1\', \'kaprodidokter\')', 'Kaprodi Pend. Dokter', '2021-05-12 15:30:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(732, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (4, \'5\')', 'Kaprodi Pend. Dokter', '2021-05-12 15:30:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(733, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-12\', \'2021-05-26\', \'4\', \'61\', \'12\', \'54\', \'47\', \'10\', \'kaprodidokter\')', 'Kaprodi Pend. Dokter', '2021-05-12 15:31:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(734, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'4\'', 'Kaprodi Pend. Dokter', '2021-05-12 15:31:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(735, 'UPDATE `users` SET `password` = \'$2y$10$4qxieJmogAgOJJ2HzqqrLe7sYmyaG2y.oZLmepY9slJU2cOG1OKqW\'\nWHERE `id_users` = \'60\'', 'Tata Usaha Pend. Dokter', '2021-05-12 15:32:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(736, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'12\', \'54\', \'47\', \'10\', \'60\', \'39\', \'60\', \'8\', \'56\', \'14\', \'123.4\', \'TEST ARSIP 5\', \'test arsip 5\', \'1\', \'2025-07-23\', \'1\', \'1\', \'tudokter\')', 'Tata Usaha Pend. Dokter', '2021-05-12 15:35:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(737, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (5, \'5\')', 'Tata Usaha Pend. Dokter', '2021-05-12 15:35:45', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(738, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-12\', \'2021-05-13\', \'5\', \'61\', \'12\', \'54\', \'47\', \'10\', \'tudokter\')', 'Tata Usaha Pend. Dokter', '2021-05-12 15:36:20', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(739, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'5\'', 'Tata Usaha Pend. Dokter', '2021-05-12 15:36:20', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(740, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `id_peminjaman` = \'5\'', 'Ridar Gustia', '2021-05-15 19:24:15', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(741, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'5\'', 'Ridar Gustia', '2021-05-15 19:24:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(742, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2021-05-15\', \'5\', \'5\', \'61\', \'12\', \'54\', \'47\', \'ridargustia\')', 'Ridar Gustia', '2021-05-15 19:24:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(743, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-15 20:48:pm\'\nWHERE `id_peminjaman` = \'5\'', 'Ridar Gustia', '2021-05-15 20:48:53', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(744, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_peminjaman` = \'5\'', 'Tata Usaha Pend. Dokter', '2021-05-15 21:04:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(745, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = \'1\', `deleted_by` = \'tudokter\', `deleted_at` = \'2021-05-15 21:05:pm\'\nWHERE `id_peminjaman` = \'4\'', 'Tata Usaha Pend. Dokter', '2021-05-15 21:05:00', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(746, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = \'4\'', 'Tata Usaha Pend. Dokter', '2021-05-15 21:05:13', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(747, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `id_peminjaman` = \'3\'', 'Tata Usaha Pend. Dokter', '2021-05-15 21:12:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(748, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'3\'', 'Tata Usaha Pend. Dokter', '2021-05-15 21:12:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(749, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-15\', \'3\', \'3\', \'59\', \'12\', \'54\', \'47\', NULL, \'tudokter\')', 'Tata Usaha Pend. Dokter', '2021-05-15 21:12:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(750, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `id_peminjaman` = \'2\'', 'Ridar Gustia', '2021-05-15 21:15:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(751, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'2\'', 'Ridar Gustia', '2021-05-15 21:15:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(752, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-15\', \'2\', \'2\', \'57\', \'12\', \'54\', \'47\', NULL, \'ridargustia\')', 'Ridar Gustia', '2021-05-15 21:15:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(753, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `id_peminjaman` = \'1\'', 'Ridar Gustia', '2021-05-15 21:23:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(754, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'1\'', 'Ridar Gustia', '2021-05-15 21:23:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(755, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2021-05-15\', \'1\', \'1\', \'58\', \'12\', \'54\', \'47\', \'ridargustia\')', 'Ridar Gustia', '2021-05-15 21:23:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(756, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-15 21:27:pm\'\nWHERE `id_peminjaman` = \'5\'', 'Ridar Gustia', '2021-05-15 21:27:34', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(757, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-15 21:27:pm\'\nWHERE `id_peminjaman` = \'3\'', 'Ridar Gustia', '2021-05-15 21:27:45', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(758, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-15 21:27:pm\'\nWHERE `id_peminjaman` = \'2\'', 'Ridar Gustia', '2021-05-15 21:27:56', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(759, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-15 21:28:pm\'\nWHERE `id_peminjaman` = \'1\'', 'Ridar Gustia', '2021-05-15 21:28:07', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(760, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-15 21:29:pm\'\nWHERE `id_pengembalian` = \'2\'', 'Ridar Gustia', '2021-05-15 21:29:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(761, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-15 21:29:pm\'\nWHERE `id_pengembalian` = \'1\'', 'Ridar Gustia', '2021-05-15 21:29:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(762, 'DELETE FROM `pengembalian`\nWHERE `id_pengembalian` = \'2\'', 'Ridar Gustia', '2021-05-15 21:30:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(763, 'DELETE FROM `pengembalian`\nWHERE `id_pengembalian` = \'1\'', 'Ridar Gustia', '2021-05-15 21:30:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(764, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-15\', \'2021-05-20\', \'1\', \'59\', \'12\', \'54\', \'47\', \'10\', \'ridargustia\')', 'Ridar Gustia', '2021-05-15 21:31:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(765, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'1\'', 'Ridar Gustia', '2021-05-15 21:31:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(766, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = \'1\'', 'Ridar Gustia', '2021-05-15 21:32:58', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(767, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = \'2\'', 'Ridar Gustia', '2021-05-15 21:33:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(768, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = \'3\'', 'Ridar Gustia', '2021-05-15 21:33:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(769, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = \'5\'', 'Ridar Gustia', '2021-05-15 21:33:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(770, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-15\', \'2021-05-17\', \'2\', \'61\', \'12\', \'54\', \'47\', \'10\', \'ridargustia\')', 'Ridar Gustia', '2021-05-15 21:35:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(771, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'2\'', 'Ridar Gustia', '2021-05-15 21:35:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(772, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'3\'', 'Ridar Gustia', '2021-05-15 21:36:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(773, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'2\'', 'Ridar Gustia', '2021-05-15 21:36:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(774, 'UPDATE `peminjaman` SET `tgl_peminjaman` = \'2021-05-15\', `user_id` = \'60\', `arsip_id` = \'3\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `bagian_id` = \'10\', `modified_by` = \'ridargustia\'\nWHERE `id_peminjaman` = \'7\'', 'Ridar Gustia', '2021-05-15 21:36:42', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(775, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `id_peminjaman` = \'6\'', 'Ridar Gustia', '2021-05-15 21:37:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(776, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'1\'', 'Ridar Gustia', '2021-05-15 21:37:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(777, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-15\', \'6\', \'1\', \'59\', \'12\', \'54\', \'47\', \'10\', \'ridargustia\')', 'Ridar Gustia', '2021-05-15 21:37:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(778, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `id_peminjaman` = \'7\'', 'Ridar Gustia', '2021-05-15 21:37:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(779, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'3\'', 'Ridar Gustia', '2021-05-15 21:37:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(780, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-15\', \'7\', \'3\', \'60\', \'12\', \'54\', \'47\', \'10\', \'ridargustia\')', 'Ridar Gustia', '2021-05-15 21:37:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(781, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-16\', \'2021-05-18\', \'1\', \'58\', \'12\', \'54\', \'47\', \'10\', \'ridargustia\')', 'Ridar Gustia', '2021-05-16 11:16:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(782, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'1\'', 'Ridar Gustia', '2021-05-16 11:16:11', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(783, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'1\', \'53\', \'33\', \'54\', \'2\', \'54\', \'1\', \'123.1\', \'TEST ARSIP UAD 1\', \'TEST ARSIP UAD 1\', \'1\', \'2029-07-04\', \'1\', \'1\', \'ridargustia\')', 'Ridar Gustia', '2021-05-16 11:49:53', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(784, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (6, \'5\')', 'Ridar Gustia', '2021-05-16 11:49:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(785, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-16\', \'2021-05-18\', \'6\', \'53\', \'10\', \'50\', \'39\', \'1\', \'ridargustia\')', 'Ridar Gustia', '2021-05-16 11:51:32', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(786, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'6\'', 'Ridar Gustia', '2021-05-16 11:51:32', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(787, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021/05/16\', \'8\', \'1\', \'58\', \'12\', \'54\', \'47\', \'10\', \'ridargustia\')', 'Ridar Gustia', '2021-05-16 13:31:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36');
INSERT INTO `log_queries` (`id`, `content`, `created_by`, `created_at`, `ip_address`, `user_agent`) VALUES
(788, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'1\'', 'Ridar Gustia', '2021-05-16 13:31:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(789, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `arsip_id` = \'1\'', 'Ridar Gustia', '2021-05-16 13:31:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(790, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'10\', \'50\', \'39\', \'1\', \'55\', \'33\', \'54\', \'2\', \'54\', \'1\', \'123.2\', \'TEST ARSIP UAD 2\', \'TEST ARSIP UAD 2\', \'1\', \'2025-07-17\', \'1\', \'1\', \'rektoruad\')', 'Rektor UAD', '2021-05-16 15:23:09', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(791, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (7, \'5\')', 'Rektor UAD', '2021-05-16 15:23:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(792, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-16\', \'2021-05-18\', \'7\', \'52\', \'10\', \'50\', \'39\', \'1\', \'rektoruad\')', 'Rektor UAD', '2021-05-16 15:23:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(793, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'7\'', 'Rektor UAD', '2021-05-16 15:23:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(794, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `id_peminjaman` = \'10\'', 'Rektor UAD', '2021-05-16 15:24:07', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(795, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'7\'', 'Rektor UAD', '2021-05-16 15:24:07', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(796, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-16\', \'10\', \'7\', \'52\', \'10\', \'50\', \'39\', \'1\', \'rektoruad\')', 'Rektor UAD', '2021-05-16 15:24:07', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(797, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-16\', \'2021-05-18\', \'1\', \'61\', \'12\', \'54\', \'47\', \'10\', \'rektorumy\')', 'Rektor UMY', '2021-05-16 16:58:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(798, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'1\'', 'Rektor UMY', '2021-05-16 16:58:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(799, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-16\', \'2021-05-18\', \'3\', \'60\', \'12\', \'54\', \'47\', \'10\', \'ridargustia\')', 'Ridar Gustia', '2021-05-16 17:28:32', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(800, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'3\'', 'Ridar Gustia', '2021-05-16 17:28:32', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(801, 'UPDATE `pengembalian` SET `tgl_kembali` = \'2021-05-16\', `arsip_id` = \'3\', `user_id` = \'60\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `bagian_id` = \'10\', `modified_by` = \'ridargustia\'\nWHERE `id_pengembalian` = \'5\'', 'Ridar Gustia', '2021-05-16 22:15:57', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(802, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'3\'', 'Ridar Gustia', '2021-05-16 22:15:58', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(803, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'1\'', 'Ridar Gustia', '2021-05-16 22:15:58', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(804, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `arsip_id` = \'3\'', 'Ridar Gustia', '2021-05-16 22:15:58', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(805, 'UPDATE `pengembalian` SET `tgl_kembali` = \'2021-05-16\', `arsip_id` = \'1\', `user_id` = \'61\', `instansi_id` = \'12\', `cabang_id` = \'54\', `divisi_id` = \'47\', `bagian_id` = \'10\', `modified_by` = \'ridargustia\'\nWHERE `id_pengembalian` = \'5\'', 'Ridar Gustia', '2021-05-16 22:20:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(806, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'1\'', 'Ridar Gustia', '2021-05-16 22:20:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(807, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'3\'', 'Ridar Gustia', '2021-05-16 22:20:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(808, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `arsip_id` = \'1\'', 'Ridar Gustia', '2021-05-16 22:20:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(809, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-16 22:40:pm\'\nWHERE `id_pengembalian` = \'3\'', 'Ridar Gustia', '2021-05-16 22:40:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(810, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = \'1\', `deleted_by` = \'ridargustia\', `deleted_at` = \'2021-05-16 22:41:pm\'\nWHERE `id_pengembalian` = \'4\'', 'Ridar Gustia', '2021-05-16 22:41:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(811, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_pengembalian` = \'3\'', 'Ridar Gustia', '2021-05-16 22:43:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(812, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = \'1\', `deleted_by` = \'tudokter\', `deleted_at` = \'2021-05-16 22:44:pm\'\nWHERE `id_pengembalian` = \'5\'', 'Tata Usaha Pend. Dokter', '2021-05-16 22:44:58', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(813, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_pengembalian` = \'4\'', 'Tata Usaha Pend. Dokter', '2021-05-16 22:45:28', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(814, 'DELETE FROM `pengembalian`\nWHERE `id_pengembalian` = \'5\'', 'Tata Usaha Pend. Dokter', '2021-05-16 22:49:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(815, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = \'1\', `deleted_by` = \'tudokter\', `deleted_at` = \'2021-05-16 22:49:pm\'\nWHERE `id_pengembalian` = \'4\'', 'Tata Usaha Pend. Dokter', '2021-05-16 22:49:43', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(816, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = \'0\', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_pengembalian` = \'4\'', 'Tata Usaha Pend. Dokter', '2021-05-16 22:50:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(817, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = \'1\', `deleted_by` = \'tudokter\', `deleted_at` = \'2021-05-16 22:50:pm\'\nWHERE `id_pengembalian` = \'4\'', 'Tata Usaha Pend. Dokter', '2021-05-16 22:50:38', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(818, 'DELETE FROM `pengembalian`\nWHERE `id_pengembalian` = \'4\'', 'Tata Usaha Pend. Dokter', '2021-05-16 22:51:01', '::1', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(819, 'UPDATE `users` SET `password` = \'$2y$10$14xJ02mtkPuIUy5Adq.Qpeg2lb6FRvUrRFngEsMzYBQz3voOCGFYG\'\nWHERE `id_users` = \'61\'', 'Kaprodi Pend. Dokter', '2021-05-20 14:23:06', '36.73.44.79', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(820, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-21\', \'2021-05-21\', \'2\', \'61\', \'12\', \'54\', \'47\', \'10\', \'rektorumy\')', 'Rektor UMY', '2021-05-21 15:35:15', '36.73.44.79', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36'),
(821, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'2\'', 'Rektor UMY', '2021-05-21 15:35:15', '36.73.44.79', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36'),
(822, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021/05/21\', \'13\', \'2\', \'61\', \'12\', \'54\', \'47\', \'10\', \'rektorumy\')', 'Rektor UMY', '2021-05-21 15:35:42', '36.73.44.79', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36'),
(823, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'2\'', 'Rektor UMY', '2021-05-21 15:35:42', '36.73.44.79', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36'),
(824, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `arsip_id` = \'2\'', 'Rektor UMY', '2021-05-21 15:35:42', '36.73.44.79', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36'),
(825, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-05-21\', \'2021-05-21\', \'2\', \'61\', \'12\', \'54\', \'47\', \'10\', \'rektorumy\')', 'Rektor UMY', '2021-05-21 15:39:28', '36.73.44.79', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36'),
(826, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'2\'', 'Rektor UMY', '2021-05-21 15:39:28', '36.73.44.79', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36'),
(827, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021/05/21\', \'14\', \'2\', \'61\', \'12\', \'54\', \'47\', \'10\', \'rektorumy\')', 'Rektor UMY', '2021-05-21 15:40:56', '36.73.44.79', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36'),
(828, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'2\'', 'Rektor UMY', '2021-05-21 15:40:56', '36.73.44.79', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36'),
(829, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `arsip_id` = \'2\'', 'Rektor UMY', '2021-05-21 15:40:56', '36.73.44.79', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36'),
(830, 'INSERT INTO `instansi` (`instansi_name`, `instansi_address`, `instansi_phone`, `active_date`, `is_active`, `instansi_img`, `instansi_img_thumb`, `created_by`) VALUES (\'Universitas Riyadi\', \'Yogyakarta\', \'0274650621\', \'2021-12-15\', \'1\', \'universitas-riyadi20211015152055.jpg\', \'universitas-riyadi20211015152055_thumb.jpg\', \'ridargustia\')', 'Ridar Gustia', '2021-10-15 15:20:55', '36.72.215.193', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(831, 'INSERT INTO `cabang` (`cabang_name`, `instansi_id`, `created_by`) VALUES (\'FAKULTAS TEKNIK\', \'13\', \'ridargustia\')', 'Ridar Gustia', '2021-10-15 15:22:10', '36.72.214.164', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(832, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'13\', \'57\', \'TEKNIK INFORMATIKA\', \'teknik-informatika\', \'ridargustia\')', 'Ridar Gustia', '2021-10-15 15:22:59', '36.72.214.164', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(833, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'13\', \'57\', \'51\', \'TATA USAHA\', \'tata-usaha\', \'ridargustia\')', 'Ridar Gustia', '2021-10-15 15:24:01', '36.72.214.164', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(834, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Choirul Miftah\', \'\', \'\', \'1\', \'\', \'\', \'choirulmiftah@gmail.com\', \'choirulmiftah\', \'$2y$10$1pGQhZAe26aR5yo83wuOuuTMg2FEg86j8cr/zIYt/..o85sxPG8yO\', \'13\', \'57\', \'51\', \'17\', \'3\', \'ridargustia\', \'36.72.212.64\', \'choirulmiftah20211015152804.png\', \'choirulmiftah20211015152804_thumb.png\')', 'Ridar Gustia', '2021-10-15 15:28:04', '36.72.212.64', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(835, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (63, \'1\')', 'Ridar Gustia', '2021-10-15 15:28:04', '36.72.212.64', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(836, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (63, \'2\')', 'Ridar Gustia', '2021-10-15 15:28:04', '36.72.212.64', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(837, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (63, \'3\')', 'Ridar Gustia', '2021-10-15 15:28:04', '36.72.212.64', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(838, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (63, \'4\')', 'Ridar Gustia', '2021-10-15 15:28:04', '36.72.212.64', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(839, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (63, \'5\')', 'Ridar Gustia', '2021-10-15 15:28:04', '36.72.212.64', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(840, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'13\', \'57\', \'51\', \'KAPRODI\', \'kaprodi\', \'ridargustia\')', 'Ridar Gustia', '2021-10-15 15:29:14', '36.72.215.193', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(841, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'13\', \'57\', \'51\', \'DEKAN\', \'dekan\', \'ridargustia\')', 'Ridar Gustia', '2021-10-15 15:30:02', '36.72.214.164', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(842, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'13\', \'57\', \'51\', \'REKTOR\', \'rektor\', \'ridargustia\')', 'Ridar Gustia', '2021-10-15 15:30:29', '36.72.214.164', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(843, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Imam Yasir Haidar\', \'\', \'\', \'1\', \'\', \'\', \'imamyasir@gmail.com\', \'imamyasir\', \'$2y$10$wNNS4vy8hkR0Bo4xwytiJOjcAt.Lbzs2UEKmcraJv7jKUwFY9hNiC\', \'13\', \'57\', \'51\', \'18\', \'3\', \'ridargustia\', \'36.72.214.164\', \'imamyasir20211015153518.png\', \'imamyasir20211015153518_thumb.png\')', 'Ridar Gustia', '2021-10-15 15:35:18', '36.72.214.164', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(844, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (64, \'1\')', 'Ridar Gustia', '2021-10-15 15:35:18', '36.72.214.164', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(845, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (64, \'2\')', 'Ridar Gustia', '2021-10-15 15:35:18', '36.72.214.164', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(846, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (64, \'3\')', 'Ridar Gustia', '2021-10-15 15:35:18', '36.72.214.164', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(847, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (64, \'4\')', 'Ridar Gustia', '2021-10-15 15:35:18', '36.72.214.164', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(848, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (64, \'5\')', 'Ridar Gustia', '2021-10-15 15:35:18', '36.72.214.164', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(849, 'UPDATE `users` SET `name` = \'Choirul Miftah\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'choirulmiftah@gmail.com\', `username` = \'choirulmiftah\', `instansi_id` = \'13\', `cabang_id` = \'57\', `divisi_id` = \'51\', `bagian_id` = \'17\', `usertype_id` = \'4\', `modified_by` = \'ridargustia\'\nWHERE `id_users` = \'63\'', 'Ridar Gustia', '2021-10-15 15:36:55', '36.72.213.20', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(850, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'63\', \'1\')', 'Ridar Gustia', '2021-10-15 15:36:55', '36.72.213.20', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(851, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'63\', \'2\')', 'Ridar Gustia', '2021-10-15 15:36:55', '36.72.213.20', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(852, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'63\', \'3\')', 'Ridar Gustia', '2021-10-15 15:36:55', '36.72.213.20', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(853, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'63\', \'4\')', 'Ridar Gustia', '2021-10-15 15:36:55', '36.72.213.20', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(854, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'63\', \'5\')', 'Ridar Gustia', '2021-10-15 15:36:55', '36.72.213.20', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(855, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Adam Putra\', \'\', \'\', \'1\', \'\', \'\', \'adamputra@gmail.com\', \'adamputra\', \'$2y$10$.Hb3kOb9m3Uqh8vE2RT2Je3ySKIqKXiazAeaGgOhDapuCqT7OnWGa\', \'13\', \'57\', \'51\', \'19\', \'2\', \'ridargustia\', \'36.72.212.64\', \'adamputra20211015154005.png\', \'adamputra20211015154005_thumb.png\')', 'Ridar Gustia', '2021-10-15 15:40:05', '36.72.212.64', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(856, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (65, \'1\')', 'Ridar Gustia', '2021-10-15 15:40:05', '36.72.212.64', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(857, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (65, \'2\')', 'Ridar Gustia', '2021-10-15 15:40:05', '36.72.212.64', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(858, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (65, \'3\')', 'Ridar Gustia', '2021-10-15 15:40:05', '36.72.212.64', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(859, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (65, \'4\')', 'Ridar Gustia', '2021-10-15 15:40:05', '36.72.212.64', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(860, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (65, \'5\')', 'Ridar Gustia', '2021-10-15 15:40:05', '36.72.212.64', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(861, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Rosi RM\', \'\', \'\', \'1\', \'\', \'\', \'rosirisprio@gmail.com\', \'rosirisprio\', \'$2y$10$cZWqYtrcviXEsIdqySR83uHI7VLLJn230GNQjljab8gbiWGQ4F1Cm\', \'13\', \'57\', \'51\', \'20\', \'1\', \'ridargustia\', \'36.72.215.193\', \'rosirisprio20211015154239.png\', \'rosirisprio20211015154239_thumb.png\')', 'Ridar Gustia', '2021-10-15 15:42:39', '36.72.215.193', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(862, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (66, \'1\')', 'Ridar Gustia', '2021-10-15 15:42:39', '36.72.215.193', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(863, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (66, \'2\')', 'Ridar Gustia', '2021-10-15 15:42:39', '36.72.215.193', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(864, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (66, \'3\')', 'Ridar Gustia', '2021-10-15 15:42:39', '36.72.215.193', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(865, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (66, \'4\')', 'Ridar Gustia', '2021-10-15 15:42:39', '36.72.215.193', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(866, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (66, \'5\')', 'Ridar Gustia', '2021-10-15 15:42:39', '36.72.215.193', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(867, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'RUANG ARSIP LT 1\', \'13\', \'57\', \'51\', \'rosirisprio\')', 'Rosi RM', '2021-10-15 16:00:26', '36.68.56.53', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(868, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'13\', \'57\', \'51\', \'rosirisprio\')', 'Rosi RM', '2021-10-15 16:01:27', '36.68.56.53', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(869, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'13\', \'57\', \'51\', \'rosirisprio\')', 'Rosi RM', '2021-10-15 16:02:10', '36.68.56.53', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(870, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'13\', \'57\', \'51\', \'rosirisprio\')', 'Rosi RM', '2021-10-15 16:02:33', '36.68.56.53', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(871, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'1\', \'13\', \'57\', \'51\', \'rosirisprio\')', 'Rosi RM', '2021-10-15 16:02:50', '36.68.56.53', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(872, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'13\', \'57\', \'51\', \'20\', \'66\', \'41\', \'62\', \'10\', \'58\', \'16\', \'500.1\', \'SK Rektor\', \'#SK\', \'1\', \'2025-03-05\', \'0\', \'1\', \'rosirisprio\')', 'Rosi RM', '2021-10-15 16:05:47', '36.68.56.53', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(873, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (8, \'4\')', 'Rosi RM', '2021-10-15 16:05:47', '36.68.56.53', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(874, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'13\', \'57\', \'51\', \'19\', \'65\', \'41\', \'62\', \'10\', \'58\', \'16\', \'500.2\', \'SK Dekan\', \'#SK\', \'1\', \'2025-07-17\', \'0\', \'1\', \'adamputra\')', 'Adam Putra', '2021-10-15 16:09:15', '36.68.56.53', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(875, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (9, \'4\')', 'Adam Putra', '2021-10-15 16:09:15', '36.68.56.53', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(876, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'13\', \'57\', \'51\', \'18\', \'64\', \'41\', \'62\', \'10\', \'58\', \'16\', \'500.3\', \'SK Kaprodi\', \'#SK\', \'1\', \'2025-03-05\', \'0\', \'1\', \'imamyasir\')', 'Imam Yasir Haidar', '2021-10-15 16:12:21', '36.68.56.53', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(877, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (10, \'4\')', 'Imam Yasir Haidar', '2021-10-15 16:12:21', '36.68.56.53', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(878, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'13\', \'57\', \'51\', \'17\', \'63\', \'41\', \'62\', \'10\', \'58\', \'16\', \'500.4\', \'SK Pegawai\', \'#SK\', \'1\', \'2025-07-09\', \'0\', \'1\', \'choirulmiftah\')', 'Choirul Miftah', '2021-10-15 16:14:40', '36.68.56.53', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(879, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (11, \'4\')', 'Choirul Miftah', '2021-10-15 16:14:40', '36.68.56.53', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(880, 'UPDATE `users` SET `password` = \'$2y$10$rhk6fDI3Y08dXX3uNX/I7O9XN7a.MM5FcKv5asnYYvzQoJplVs3rq\'\nWHERE `id_users` = \'51\'', 'Ridar Gustia', '2021-10-16 05:18:56', '114.142.171.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0'),
(881, 'INSERT INTO `instansi` (`instansi_name`, `instansi_address`, `instansi_phone`, `active_date`, `is_active`, `instansi_img`, `instansi_img_thumb`, `created_by`) VALUES (\'STAIA SW MAGELANG\', \'Magelang\', \'123456789\', \'2021-12-16\', \'1\', \'staia-sw-magelang20211016111816.jpg\', \'staia-sw-magelang20211016111816_thumb.jpg\', \'ridargustia\')', 'Ridar Gustia', '2021-10-16 11:18:16', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(882, 'INSERT INTO `cabang` (`cabang_name`, `instansi_id`, `created_by`) VALUES (\'STAIA SW\', \'14\', \'ridargustia\')', 'Ridar Gustia', '2021-10-16 11:19:45', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(883, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'14\', \'58\', \'ILMU ALQURAN DAN TAFSIR (IAT)\', \'ilmu-alquran-dan-tafsir-iat\', \'ridargustia\')', 'Ridar Gustia', '2021-10-16 11:20:36', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(884, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'14\', \'58\', \'EKONOMI SYARIAH (ES)\', \'ekonomi-syariah-es\', \'ridargustia\')', 'Ridar Gustia', '2021-10-16 11:21:02', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(885, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'14\', \'58\', \'MANAJEMEN PENDIDIKAN ISLAM (MPI)\', \'manajemen-pendidikan-islam-mpi\', \'ridargustia\')', 'Ridar Gustia', '2021-10-16 11:21:40', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(886, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'14\', \'58\', \'53\', \'TATA USAHA\', \'tata-usaha\', \'ridargustia\')', 'Ridar Gustia', '2021-10-16 11:22:27', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(887, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'14\', \'58\', \'52\', \'TATA USAHA\', \'tata-usaha\', \'ridargustia\')', 'Ridar Gustia', '2021-10-16 11:22:45', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(888, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'14\', \'58\', \'54\', \'TATA USAHA\', \'tata-usaha\', \'ridargustia\')', 'Ridar Gustia', '2021-10-16 11:23:05', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(889, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Administrator1\', \'\', \'\', \'1\', \'\', \'\', \'administrator1@gmail.com\', \'administrator1\', \'$2y$10$cb3q1HXLPKsnfeHyoKOaiOJD1IdAmEw5jZTdmB1qgsTtLVqOnZ9cK\', \'14\', \'58\', \'53\', \'21\', \'4\', \'ridargustia\', \'114.142.171.8\', \'administrator120211016112731.jpg\', \'administrator120211016112731_thumb.jpg\')', 'Ridar Gustia', '2021-10-16 11:27:31', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(890, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (67, \'1\')', 'Ridar Gustia', '2021-10-16 11:27:31', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(891, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (67, \'2\')', 'Ridar Gustia', '2021-10-16 11:27:31', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(892, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (67, \'3\')', 'Ridar Gustia', '2021-10-16 11:27:31', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(893, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (67, \'4\')', 'Ridar Gustia', '2021-10-16 11:27:31', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(894, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (67, \'5\')', 'Ridar Gustia', '2021-10-16 11:27:31', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(895, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Rektorat1\', \'\', \'\', \'1\', \'\', \'\', \'rektorat1@gmail.com\', \'rektorat1\', \'$2y$10$UdA4r2nbdl4PWeM/aIJWuewjS58q2LYYx1T.2rqw5q5PWj6Z3GlLi\', \'14\', \'58\', \'53\', \'21\', \'1\', \'ridargustia\', \'114.142.171.8\', \'rektorat120211016113029.jpg\', \'rektorat120211016113029_thumb.jpg\')', 'Ridar Gustia', '2021-10-16 11:30:29', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(896, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (68, \'1\')', 'Ridar Gustia', '2021-10-16 11:30:29', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(897, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (68, \'2\')', 'Ridar Gustia', '2021-10-16 11:30:29', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(898, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (68, \'3\')', 'Ridar Gustia', '2021-10-16 11:30:29', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(899, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (68, \'4\')', 'Ridar Gustia', '2021-10-16 11:30:29', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(900, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (68, \'5\')', 'Ridar Gustia', '2021-10-16 11:30:29', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(901, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'14\', \'58\', \'53\', \'REKTORAT\', \'rektorat\', \'ridargustia\')', 'Ridar Gustia', '2021-10-16 11:31:24', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(902, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'14\', \'58\', \'53\', \'DEKANAT\', \'dekanat\', \'ridargustia\')', 'Ridar Gustia', '2021-10-16 11:31:41', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(903, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'14\', \'58\', \'53\', \'KAPRODI\', \'kaprodi\', \'ridargustia\')', 'Ridar Gustia', '2021-10-16 11:31:57', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(904, 'UPDATE `users` SET `name` = \'Rektorat1\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'rektorat1@gmail.com\', `username` = \'rektorat1\', `instansi_id` = \'14\', `cabang_id` = \'58\', `divisi_id` = \'53\', `bagian_id` = \'24\', `usertype_id` = \'1\', `modified_by` = \'ridargustia\'\nWHERE `id_users` = \'68\'', 'Ridar Gustia', '2021-10-16 11:32:38', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(905, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'68\', \'1\')', 'Ridar Gustia', '2021-10-16 11:32:38', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(906, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'68\', \'2\')', 'Ridar Gustia', '2021-10-16 11:32:38', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(907, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'68\', \'3\')', 'Ridar Gustia', '2021-10-16 11:32:38', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(908, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'68\', \'4\')', 'Ridar Gustia', '2021-10-16 11:32:38', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(909, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'68\', \'5\')', 'Ridar Gustia', '2021-10-16 11:32:38', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(910, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Dekan 1\', \'\', \'\', \'1\', \'\', \'\', \'dekanat1@gmail.com\', \'dekanat1\', \'$2y$10$YAABjVr9/iq9nRA6EClTvuV54pTJGLLof4xwGZYcYxNflKrY9fCxK\', \'14\', \'58\', \'53\', \'25\', \'2\', \'ridargustia\', \'114.142.171.8\', \'dekanat120211016113502.jpg\', \'dekanat120211016113502_thumb.jpg\')', 'Ridar Gustia', '2021-10-16 11:35:02', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(911, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (69, \'1\')', 'Ridar Gustia', '2021-10-16 11:35:02', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(912, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (69, \'2\')', 'Ridar Gustia', '2021-10-16 11:35:02', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(913, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (69, \'3\')', 'Ridar Gustia', '2021-10-16 11:35:02', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(914, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (69, \'4\')', 'Ridar Gustia', '2021-10-16 11:35:02', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(915, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (69, \'5\')', 'Ridar Gustia', '2021-10-16 11:35:03', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(916, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Kaprodi 1\', \'\', \'\', \'1\', \'\', \'\', \'kaprodi1@gmail.com\', \'kaprodi1\', \'$2y$10$D7IZTP7Fg8CvvCxRtQj7WeLGku/MYC8bYiaI.oirHaCPrLge0wV1e\', \'14\', \'58\', \'53\', \'26\', \'3\', \'ridargustia\', \'114.142.171.8\', \'kaprodi120211016113646.jpg\', \'kaprodi120211016113646_thumb.jpg\')', 'Ridar Gustia', '2021-10-16 11:36:46', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(917, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (70, \'1\')', 'Ridar Gustia', '2021-10-16 11:36:46', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(918, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (70, \'2\')', 'Ridar Gustia', '2021-10-16 11:36:46', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(919, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (70, \'3\')', 'Ridar Gustia', '2021-10-16 11:36:46', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(920, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (70, \'4\')', 'Ridar Gustia', '2021-10-16 11:36:46', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(921, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (70, \'5\')', 'Ridar Gustia', '2021-10-16 11:36:46', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(922, 'UPDATE `users` SET `name` = \'Ketua 1\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'ketua1@gmail.com\', `username` = \'ketua1\', `modified_by` = \'dekanat1\'\nWHERE `id_users` = \'69\'', 'Dekan 1', '2021-10-16 11:43:33', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(923, 'UPDATE `users` SET `name` = \'Kaprodi Ekonomi Syariah\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'kaprodi1@gmail.com\', `username` = \'kaprodi1\', `instansi_id` = \'14\', `cabang_id` = \'58\', `divisi_id` = \'53\', `bagian_id` = \'26\', `usertype_id` = \'3\', `modified_by` = \'ketua1\'\nWHERE `id_users` = \'70\'', 'Ketua 1', '2021-10-16 11:47:17', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(924, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'70\', \'1\')', 'Ketua 1', '2021-10-16 11:47:17', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(925, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'70\', \'2\')', 'Ketua 1', '2021-10-16 11:47:17', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(926, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'70\', \'3\')', 'Ketua 1', '2021-10-16 11:47:17', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(927, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'70\', \'4\')', 'Ketua 1', '2021-10-16 11:47:17', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(928, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'70\', \'5\')', 'Ketua 1', '2021-10-16 11:47:17', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(929, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'14\', \'58\', \'54\', \'KAPRODI\', \'kaprodi\', \'ketua1\')', 'Ketua 1', '2021-10-16 11:49:41', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(930, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'14\', \'58\', \'52\', \'KAPRODI\', \'kaprodi\', \'ketua1\')', 'Ketua 1', '2021-10-16 11:49:52', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(931, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Kaprodi MPI\', \'\', \'\', \'1\', \'\', \'\', \'kaprodimpi@gmail.com\', \'kaprodimpi\', \'$2y$10$ytuQx4VRmTxD5whoCIOL3uKPb4Ojyo3cdEKecg5pB2pLwhLEDIJtC\', \'14\', \'58\', \'54\', \'27\', \'3\', \'ketua1\', \'114.142.171.8\', \'kaprodimpi20211016115142.jpg\', \'kaprodimpi20211016115142_thumb.jpg\')', 'Ketua 1', '2021-10-16 11:51:42', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(932, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (71, \'1\')', 'Ketua 1', '2021-10-16 11:51:42', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(933, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (71, \'2\')', 'Ketua 1', '2021-10-16 11:51:42', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(934, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (71, \'3\')', 'Ketua 1', '2021-10-16 11:51:42', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(935, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (71, \'4\')', 'Ketua 1', '2021-10-16 11:51:42', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(936, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (71, \'5\')', 'Ketua 1', '2021-10-16 11:51:42', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(937, 'UPDATE `users` SET `name` = \'Kaprodi ES\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'kaprodies@gmail.com\', `username` = \'kaprodies\', `instansi_id` = \'14\', `cabang_id` = \'58\', `divisi_id` = \'53\', `bagian_id` = \'26\', `usertype_id` = \'3\', `modified_by` = \'ketua1\'\nWHERE `id_users` = \'70\'', 'Ketua 1', '2021-10-16 11:52:17', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36');
INSERT INTO `log_queries` (`id`, `content`, `created_by`, `created_at`, `ip_address`, `user_agent`) VALUES
(938, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'70\', \'1\')', 'Ketua 1', '2021-10-16 11:52:17', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(939, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'70\', \'2\')', 'Ketua 1', '2021-10-16 11:52:17', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(940, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'70\', \'3\')', 'Ketua 1', '2021-10-16 11:52:17', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(941, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'70\', \'4\')', 'Ketua 1', '2021-10-16 11:52:17', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(942, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'70\', \'5\')', 'Ketua 1', '2021-10-16 11:52:18', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(943, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Kaprodi IAT\', \'\', \'\', \'1\', \'\', \'\', \'kaprodiiat@gmail.com\', \'kaprodiiat\', \'$2y$10$67.bWJ6468A3QuuRLpf3xOOjErQhVthUya5MMWRxEaQ08vjvoynaW\', \'14\', \'58\', \'52\', \'28\', \'3\', \'ketua1\', \'114.142.171.8\', \'kaprodiiat20211016115400.jpg\', \'kaprodiiat20211016115400_thumb.jpg\')', 'Ketua 1', '2021-10-16 11:54:00', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(944, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (72, \'1\')', 'Ketua 1', '2021-10-16 11:54:00', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(945, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (72, \'2\')', 'Ketua 1', '2021-10-16 11:54:00', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(946, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (72, \'3\')', 'Ketua 1', '2021-10-16 11:54:00', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(947, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (72, \'4\')', 'Ketua 1', '2021-10-16 11:54:00', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(948, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (72, \'5\')', 'Ketua 1', '2021-10-16 11:54:00', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(949, 'UPDATE `users` SET `name` = \'Administrator ES\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'1\', `address` = \'\', `phone` = \'\', `email` = \'administratores@gmail.com\', `username` = \'administratores\', `instansi_id` = \'14\', `cabang_id` = \'58\', `divisi_id` = \'53\', `bagian_id` = \'21\', `usertype_id` = \'4\', `modified_by` = \'ketua1\'\nWHERE `id_users` = \'67\'', 'Ketua 1', '2021-10-16 11:54:55', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(950, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'67\', \'1\')', 'Ketua 1', '2021-10-16 11:54:55', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(951, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'67\', \'2\')', 'Ketua 1', '2021-10-16 11:54:55', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(952, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'67\', \'3\')', 'Ketua 1', '2021-10-16 11:54:55', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(953, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'67\', \'4\')', 'Ketua 1', '2021-10-16 11:54:55', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(954, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (\'67\', \'5\')', 'Ketua 1', '2021-10-16 11:54:55', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(955, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Administrator MPI\', \'\', \'\', \'1\', \'\', \'\', \'administratormpi@gmail.com\', \'administratormpi\', \'$2y$10$pYSMLvgT1/9IHcXNXnsfVuyPxwx0pSpvyL6EfgayWcHQuSfBFRbsq\', \'14\', \'58\', \'54\', \'23\', \'4\', \'ketua1\', \'114.142.171.8\', \'administratormpi20211016115700.jpg\', \'administratormpi20211016115700_thumb.jpg\')', 'Ketua 1', '2021-10-16 11:57:00', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(956, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (73, \'1\')', 'Ketua 1', '2021-10-16 11:57:00', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(957, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (73, \'2\')', 'Ketua 1', '2021-10-16 11:57:00', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(958, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (73, \'3\')', 'Ketua 1', '2021-10-16 11:57:00', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(959, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (73, \'4\')', 'Ketua 1', '2021-10-16 11:57:00', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(960, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (73, \'5\')', 'Ketua 1', '2021-10-16 11:57:00', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(961, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Administrator IAT\', \'\', \'\', \'1\', \'\', \'\', \'administratoriat@gmail.com\', \'administratoriat\', \'$2y$10$GMA1WjCne583zSGoANY5WOgi8QS00ocUd.4cYBRph4zzhFhrhuR6C\', \'14\', \'58\', \'52\', \'22\', \'4\', \'ketua1\', \'114.142.171.8\', \'administratoriat20211016115837.jpg\', \'administratoriat20211016115837_thumb.jpg\')', 'Ketua 1', '2021-10-16 11:58:37', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(962, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (74, \'1\')', 'Ketua 1', '2021-10-16 11:58:37', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(963, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (74, \'2\')', 'Ketua 1', '2021-10-16 11:58:37', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(964, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (74, \'3\')', 'Ketua 1', '2021-10-16 11:58:37', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(965, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (74, \'4\')', 'Ketua 1', '2021-10-16 11:58:37', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(966, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (74, \'5\')', 'Ketua 1', '2021-10-16 11:58:37', '114.142.171.8', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(967, 'INSERT INTO `instansi` (`instansi_name`, `instansi_address`, `instansi_phone`, `active_date`, `is_active`, `instansi_img`, `instansi_img_thumb`, `created_by`) VALUES (\'UNIVERSITAS BRAWIJAYA\', \'............\', \'1234567890\', \'2022-02-03\', \'1\', \'universitas-brawijaya20211203221902.jpg\', \'universitas-brawijaya20211203221902_thumb.jpg\', \'ridargustia\')', 'Ridar Gustia', '2021-12-03 22:19:02', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(968, 'INSERT INTO `instansi` (`instansi_name`, `instansi_address`, `instansi_phone`, `active_date`, `is_active`, `instansi_img`, `instansi_img_thumb`, `created_by`) VALUES (\'UNIVERSITAS PAPUA\', \'...........\', \'1234567890\', \'2022-02-03\', \'1\', \'universitas-papua20211203221955.jpg\', \'universitas-papua20211203221955_thumb.jpg\', \'ridargustia\')', 'Ridar Gustia', '2021-12-03 22:19:55', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(969, 'INSERT INTO `instansi` (`instansi_name`, `instansi_address`, `instansi_phone`, `active_date`, `is_active`, `instansi_img`, `instansi_img_thumb`, `created_by`) VALUES (\'UNIVERSITAS AHMAD DAHLAN\', \'..........\', \'1234567890\', \'2022-02-03\', \'1\', \'universitas-ahmad-dahlan20211203222107.jpg\', \'universitas-ahmad-dahlan20211203222107_thumb.jpg\', \'ridargustia\')', 'Ridar Gustia', '2021-12-03 22:21:07', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(970, 'INSERT INTO `cabang` (`cabang_name`, `instansi_id`, `created_by`) VALUES (\'FISIP\', \'15\', \'ridargustia\')', 'Ridar Gustia', '2021-12-03 22:21:57', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(971, 'INSERT INTO `cabang` (`cabang_name`, `instansi_id`, `created_by`) VALUES (\'FAKULTAS A\', \'16\', \'ridargustia\')', 'Ridar Gustia', '2021-12-03 22:23:02', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(972, 'INSERT INTO `cabang` (`cabang_name`, `instansi_id`, `created_by`) VALUES (\'FAKULTAS A\', \'17\', \'ridargustia\')', 'Ridar Gustia', '2021-12-03 22:23:54', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(973, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'15\', \'59\', \'PRODI A\', \'prodi-a\', \'ridargustia\')', 'Ridar Gustia', '2021-12-03 22:25:08', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(974, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'16\', \'60\', \'PRODI A\', \'prodi-a\', \'ridargustia\')', 'Ridar Gustia', '2021-12-03 22:25:35', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(975, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'17\', \'61\', \'PRODI A\', \'prodi-a\', \'ridargustia\')', 'Ridar Gustia', '2021-12-03 22:26:00', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(976, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'15\', \'59\', \'55\', \'DIVISI A\', \'divisi-a\', \'ridargustia\')', 'Ridar Gustia', '2021-12-03 22:26:41', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(977, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'16\', \'60\', \'56\', \'DIVISI A\', \'divisi-a\', \'ridargustia\')', 'Ridar Gustia', '2021-12-03 22:27:14', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(978, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'17\', \'61\', \'57\', \'DIVISI A\', \'divisi-a\', \'ridargustia\')', 'Ridar Gustia', '2021-12-03 22:27:44', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(979, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'ADI SURYA PRADANA\', \'\', \'\', \'1\', \'\', \'\', \'adisurya@gmail.com\', \'adisurya\', \'$2y$10$RWm1jsbsr/BhgN2PMidZLuLsKV2g2OYJculOuwU2qPlsNOq6axo9S\', \'15\', \'59\', \'55\', \'29\', \'2\', \'ridargustia\', \'36.80.201.59\', \'adisurya20211203223041.jpg\', \'adisurya20211203223041_thumb.jpg\')', 'Ridar Gustia', '2021-12-03 22:30:41', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(980, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (75, \'1\')', 'Ridar Gustia', '2021-12-03 22:30:41', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(981, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (75, \'2\')', 'Ridar Gustia', '2021-12-03 22:30:41', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(982, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (75, \'3\')', 'Ridar Gustia', '2021-12-03 22:30:41', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(983, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (75, \'4\')', 'Ridar Gustia', '2021-12-03 22:30:41', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(984, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (75, \'5\')', 'Ridar Gustia', '2021-12-03 22:30:41', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(985, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'EDY ROESANTO\', \'\', \'\', \'1\', \'\', \'\', \'edyroesanto@gmail.com\', \'edyroesanto\', \'$2y$10$I9tQIR0llEIBkmTzq7xTfuznWAtJzP1OlUMSu.D28rB1M7cf8Pg2G\', \'15\', \'59\', \'55\', \'29\', \'3\', \'ridargustia\', \'36.80.201.59\', \'edyroesanto20211203223239.jpg\', \'edyroesanto20211203223239_thumb.jpg\')', 'Ridar Gustia', '2021-12-03 22:32:39', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(986, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (76, \'1\')', 'Ridar Gustia', '2021-12-03 22:32:39', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(987, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (76, \'2\')', 'Ridar Gustia', '2021-12-03 22:32:39', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(988, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (76, \'3\')', 'Ridar Gustia', '2021-12-03 22:32:39', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(989, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (76, \'4\')', 'Ridar Gustia', '2021-12-03 22:32:39', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(990, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (76, \'5\')', 'Ridar Gustia', '2021-12-03 22:32:39', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(991, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'KUSRINER F.M\', \'\', \'\', \'1\', \'\', \'\', \'kusriner@gmail.com\', \'kusriner\', \'$2y$10$rJMten6LgAow02EvineTRewUL/1fihXCkG0kbGNySnzBhvq6mcgfG\', \'16\', \'60\', \'56\', \'30\', \'2\', \'ridargustia\', \'36.80.201.59\', \'kusriner20211203223440.jpg\', \'kusriner20211203223440_thumb.jpg\')', 'Ridar Gustia', '2021-12-03 22:34:40', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(992, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (77, \'1\')', 'Ridar Gustia', '2021-12-03 22:34:40', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(993, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (77, \'2\')', 'Ridar Gustia', '2021-12-03 22:34:40', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(994, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (77, \'3\')', 'Ridar Gustia', '2021-12-03 22:34:40', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(995, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (77, \'4\')', 'Ridar Gustia', '2021-12-03 22:34:40', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(996, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (77, \'5\')', 'Ridar Gustia', '2021-12-03 22:34:40', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(997, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'JULPIUS JAHYA R.\', \'\', \'\', \'1\', \'\', \'\', \'julpiusjahya@gmail.com\', \'julpiusjahya\', \'$2y$10$D72iVBgKIA2uUBzI9huVfeR62mmtwNgaoDqDmE8tS1VNfN/lCQAfi\', \'16\', \'60\', \'56\', \'30\', \'3\', \'ridargustia\', \'36.80.201.59\', \'julpiusjahya20211203223647.jpg\', \'julpiusjahya20211203223647_thumb.jpg\')', 'Ridar Gustia', '2021-12-03 22:36:47', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(998, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (78, \'1\')', 'Ridar Gustia', '2021-12-03 22:36:47', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(999, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (78, \'2\')', 'Ridar Gustia', '2021-12-03 22:36:47', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1000, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (78, \'3\')', 'Ridar Gustia', '2021-12-03 22:36:47', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1001, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (78, \'4\')', 'Ridar Gustia', '2021-12-03 22:36:47', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1002, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (78, \'5\')', 'Ridar Gustia', '2021-12-03 22:36:47', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1003, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'MARTHINUS PETRUS I.\', \'\', \'\', \'1\', \'\', \'\', \'marthinus@gmail.com\', \'marthinus\', \'$2y$10$KKya1W3b.nam7gBf/8oNWuVkKaaEgv3vH/m0ZcJuu2y75Gxv7cgm2\', \'16\', \'60\', \'56\', \'30\', \'3\', \'ridargustia\', \'36.80.201.59\', \'marthinus20211203223836.jpg\', \'marthinus20211203223836_thumb.jpg\')', 'Ridar Gustia', '2021-12-03 22:38:36', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1004, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (79, \'1\')', 'Ridar Gustia', '2021-12-03 22:38:36', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1005, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (79, \'2\')', 'Ridar Gustia', '2021-12-03 22:38:36', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1006, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (79, \'3\')', 'Ridar Gustia', '2021-12-03 22:38:36', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1007, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (79, \'4\')', 'Ridar Gustia', '2021-12-03 22:38:36', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1008, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (79, \'5\')', 'Ridar Gustia', '2021-12-03 22:38:36', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1009, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'LILY IDAYU MURTI\', \'\', \'\', \'2\', \'\', \'\', \'lilyidayu@gmail.com\', \'lilyidayu\', \'$2y$10$A2LldVgZmES7hCVHM3penOY0avit6GugFe8ugCyEIWOZNhOnFvdGa\', \'17\', \'61\', \'57\', \'31\', \'2\', \'ridargustia\', \'36.80.201.59\', \'lilyidayu20211203224050.jpg\', \'lilyidayu20211203224050_thumb.jpg\')', 'Ridar Gustia', '2021-12-03 22:40:50', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1010, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (80, \'1\')', 'Ridar Gustia', '2021-12-03 22:40:50', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1011, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (80, \'2\')', 'Ridar Gustia', '2021-12-03 22:40:50', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1012, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (80, \'3\')', 'Ridar Gustia', '2021-12-03 22:40:50', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1013, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (80, \'4\')', 'Ridar Gustia', '2021-12-03 22:40:50', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1014, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (80, \'5\')', 'Ridar Gustia', '2021-12-03 22:40:50', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1015, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'ZAHRAWAANI FITRI ASTUTI\', \'\', \'\', \'2\', \'\', \'\', \'zahrawaani@gmail.com\', \'zahrawaani\', \'$2y$10$Wl.YmL2vR8LGz/GzxbzpBeekn/Sf9gT1/UX.HpWMfegor5QJe/LcG\', \'17\', \'61\', \'57\', \'31\', \'3\', \'ridargustia\', \'36.80.201.59\', \'zahrawaani20211203224247.jpg\', \'zahrawaani20211203224247_thumb.jpg\')', 'Ridar Gustia', '2021-12-03 22:42:47', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1016, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (81, \'1\')', 'Ridar Gustia', '2021-12-03 22:42:47', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1017, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (81, \'2\')', 'Ridar Gustia', '2021-12-03 22:42:47', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1018, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (81, \'3\')', 'Ridar Gustia', '2021-12-03 22:42:47', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1019, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (81, \'4\')', 'Ridar Gustia', '2021-12-03 22:42:47', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1020, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (81, \'5\')', 'Ridar Gustia', '2021-12-03 22:42:47', '36.80.201.59', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1021, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (\'Nurma Puspitasari\', \'\', \'\', \'2\', \'\', \'\', \'nurmapuspitasari@gmail.com\', \'nurmapuspitasari\', \'$2y$10$eF5TG5CQ2Ga6pIxJQXqHf.du8uzrqs.D2b6UrGCQscN63KoqJSB1C\', \'11\', \'51\', \'40\', \'2\', \'2\', \'ridargustia\', \'121.101.130.170\', \'nurmapuspitasari20211204120056.jpg\', \'nurmapuspitasari20211204120056_thumb.jpg\')', 'Ridar Gustia', '2021-12-04 12:00:56', '121.101.130.170', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1022, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (82, \'1\')', 'Ridar Gustia', '2021-12-04 12:00:56', '121.101.130.170', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1023, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (82, \'2\')', 'Ridar Gustia', '2021-12-04 12:00:56', '121.101.130.170', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1024, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (82, \'3\')', 'Ridar Gustia', '2021-12-04 12:00:56', '121.101.130.170', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1025, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (82, \'4\')', 'Ridar Gustia', '2021-12-04 12:00:56', '121.101.130.170', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1026, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (82, \'5\')', 'Ridar Gustia', '2021-12-04 12:00:56', '121.101.130.170', 'Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1027, 'UPDATE `users` SET `name` = \'ZAHRAWAANI FITRI ASTUTI\', `birthdate` = \'\', `birthplace` = \'\', `gender` = \'2\', `address` = \'\', `phone` = \'\', `email` = \'zahrawani.astuti@staff.uad.ac.id\', `username` = \'zahrawaani\', `modified_by` = \'zahrawaani\'\nWHERE `id_users` = \'81\'', 'ZAHRAWAANI FITRI ASTUTI', '2021-12-04 15:52:39', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0'),
(1028, 'UPDATE `users` SET `name` = \'ADI SURYA PRADANA\', `birthdate` = \'11/04/1998\', `birthplace` = \'Yogyakarta\', `gender` = \'1\', `address` = \'Jl Kertosentono 41 b\', `phone` = \'085259579792\', `email` = \'adisurya@gmail.com\', `username` = \'adisurya\', `modified_by` = \'adisurya\', `photo` = \'adisurya20211204155323.jpg\', `photo_thumb` = \'adisurya20211204155323_thumb.jpg\'\nWHERE `id_users` = \'75\'', 'ADI SURYA PRADANA', '2021-12-04 15:53:23', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1029, 'UPDATE `users` SET `name` = \'ADI SURYA PRADANA\', `birthdate` = \'11/04/1998\', `birthplace` = \'Yogyakarta\', `gender` = \'1\', `address` = \'Jl Kertosentono 41 b\', `phone` = \'085259579792\', `email` = \'adisurya@gmail.com\', `username` = \'adisurya\', `modified_by` = \'adisurya\'\nWHERE `id_users` = \'75\'', 'ADI SURYA PRADANA', '2021-12-04 15:53:31', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1030, 'UPDATE `users` SET `name` = \'ADI SURYA PRADANA\', `birthdate` = \'11/04/1998\', `birthplace` = \'Yogyakarta\', `gender` = \'1\', `address` = \'Jl Kertosentono 41 b\', `phone` = \'085259579792\', `email` = \'adisurya@gmail.com\', `username` = \'adisurya\', `modified_by` = \'adisurya\'\nWHERE `id_users` = \'75\'', 'ADI SURYA PRADANA', '2021-12-04 15:53:42', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1031, 'UPDATE `users` SET `name` = \'MARTHINUS PETRUS I.\', `birthdate` = \'03/25/1971\', `birthplace` = \'manokwari\', `gender` = \'1\', `address` = \'jln. Nangka 1, Reremi, Manokwari\', `phone` = \'081361882056\', `email` = \'marthinus@gmail.com\', `username` = \'marthinus\', `modified_by` = \'marthinus\'\nWHERE `id_users` = \'79\'', 'MARTHINUS PETRUS I.', '2021-12-04 15:56:55', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1032, 'UPDATE `users` SET `name` = \'MARTHINUS PETRUS I.\', `birthdate` = \'03/25/1971\', `birthplace` = \'manokwari\', `gender` = \'1\', `address` = \'jln. Nangka 1, Reremi, Manokwari\', `phone` = \'081361882056\', `email` = \'marthinus@gmail.com\', `username` = \'marthinus\', `modified_by` = \'marthinus\'\nWHERE `id_users` = \'79\'', 'MARTHINUS PETRUS I.', '2021-12-04 15:57:02', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1033, 'UPDATE `users` SET `name` = \'KUSRINER FERNANDO MBAUBEDARI\', `birthdate` = \'17/02/1974\', `birthplace` = \'SERUI\', `gender` = \'1\', `address` = \'FAKULTAS KEHUTANAN UNIVERSITAS PAPUA, MANOKWARI PAPUA BARAT\', `phone` = \'081808383939\', `email` = \'kusriner@gmail.com\', `username` = \'kusriner\', `modified_by` = \'kusriner\', `photo` = \'kusriner20211204155835.jpg\', `photo_thumb` = \'kusriner20211204155835_thumb.jpg\'\nWHERE `id_users` = \'77\'', 'KUSRINER F.M', '2021-12-04 15:58:35', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1034, 'UPDATE `users` SET `password` = \'$2y$10$/O/zgrE7x0G49uG9hkRFX.Bzy.1YLZqNrOENTAfO3RLepWpWRzIQG\'\nWHERE `id_users` = \'75\'', 'ADI SURYA PRADANA', '2021-12-04 16:01:34', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1035, 'UPDATE `users` SET `password` = \'$2y$10$bW9T.XNwjLyhIcuZ0V4oIu2sk.sFjFKxeMYurG2fj6cAA.5e0vPVm\'\nWHERE `id_users` = \'78\'', 'JULPIUS JAHYA R.', '2021-12-04 16:03:51', '182.2.43.63', 'Mozilla/5.0 (Linux; Android 10; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Mobile Safari/537.36'),
(1036, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'15\', \'59\', \'55\', \'29\', \'75\', \'-\', \'-\', \'-\', \'-\', \'-\', \'1223\', \'surat perjalanan dinas\', \'surat perjalanan BIMTEK Kearsipan 2021\', \'1\', \'2021-12-04\', \'0\', \'1\', \'adisurya\')', 'ADI SURYA PRADANA', '2021-12-04 16:05:00', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1037, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (0, \'4\')', 'ADI SURYA PRADANA', '2021-12-04 16:05:00', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1038, 'UPDATE `users` SET `name` = \'JULPIUS JAHYA R.\', `birthdate` = \'10/05/1974\', `birthplace` = \'Manokwari\', `gender` = \'1\', `address` = \'Jl.S. pami .RT.05 amban Manokwari\', `phone` = \'081294013201\', `email` = \'julpiusjahya@gmail.com\', `username` = \'julpiusjahya\', `modified_by` = \'julpiusjahya\'\nWHERE `id_users` = \'78\'', 'JULPIUS JAHYA R.', '2021-12-04 16:07:28', '182.2.43.63', 'Mozilla/5.0 (Linux; Android 10; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Mobile Safari/537.36'),
(1039, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'16\', \'60\', \'56\', \'divisi keuangan\', \'divisi-keuangan\', \'marthinus\')', 'MARTHINUS PETRUS I.', '2021-12-04 16:08:14', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1040, 'UPDATE `bagian` SET `is_delete_bagian` = \'1\', `deleted_by` = \'marthinus\', `deleted_at` = \'2021-12-04 16:08:pm\'\nWHERE `id_bagian` = \'32\'', 'MARTHINUS PETRUS I.', '2021-12-04 16:08:32', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1041, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'17\', \'61\', \'57\', \'DIVISI B\', \'divisi-b\', \'zahrawaani\')', 'ZAHRAWAANI FITRI ASTUTI', '2021-12-04 16:10:44', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0'),
(1042, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'rachman\', \'09/04/1912\', \'Pati\', \'1\', \'Wagir Malang\', \'087654567896\', \'rachman123@gmail.com\', \'rachman123\', \'$2y$10$woQ2sYW7DIsAMJGJKbFehOnKDMAnpntJapds/1HiYNkC8JoZSq4yu\', \'15\', \'59\', \'55\', \'29\', \'4\', \'adisurya\', \'121.101.130.170\')', 'ADI SURYA PRADANA', '2021-12-04 16:11:19', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1043, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (83, \'1\')', 'ADI SURYA PRADANA', '2021-12-04 16:11:19', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1044, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (83, \'2\')', 'ADI SURYA PRADANA', '2021-12-04 16:11:19', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1045, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (83, \'3\')', 'ADI SURYA PRADANA', '2021-12-04 16:11:19', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1046, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (83, \'4\')', 'ADI SURYA PRADANA', '2021-12-04 16:11:19', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1047, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (83, \'5\')', 'ADI SURYA PRADANA', '2021-12-04 16:11:19', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1048, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'gashsdkjjskd\', \'\', \'\', \'1\', \'\', \'\', \'reneerqux@gmail.com\', \'jayapuraqu\', \'$2y$10$e5ICl9vSffqFYhuHaZAxgeQ.ajo0zCB/3b2UJBOufkrVqa2C6U5Qm\', \'16\', \'60\', \'56\', \'30\', \'3\', \'kusriner\', \'121.101.130.170\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 16:24:41', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1049, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (84, \'1\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 16:24:41', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1050, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'RAK BAg Pendidikan\', \'16\', \'60\', \'56\', \'kusriner\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 16:26:31', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1051, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'Gudang A\', \'16\', \'60\', \'56\', \'julpiusjahya\')', 'JULPIUS JAHYA R.', '2021-12-04 16:27:02', '182.2.43.63', 'Mozilla/5.0 (Linux; Android 10; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Mobile Safari/537.36'),
(1052, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'GEDUNG B\', \'11\', \'51\', \'40\', \'nurmapuspitasari\')', 'Nurma Puspitasari', '2021-12-04 16:27:19', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43'),
(1053, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'Gudang B\', \'16\', \'60\', \'56\', \'julpiusjahya\')', 'JULPIUS JAHYA R.', '2021-12-04 16:27:33', '182.2.43.63', 'Mozilla/5.0 (Linux; Android 10; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Mobile Safari/537.36'),
(1054, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'03\', \'16\', \'60\', \'56\', \'marthinus\')', 'MARTHINUS PETRUS I.', '2021-12-04 16:32:11', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1055, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'05\', \'16\', \'60\', \'56\', \'julpiusjahya\')', 'JULPIUS JAHYA R.', '2021-12-04 16:32:23', '182.2.43.63', 'Mozilla/5.0 (Linux; Android 10; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Mobile Safari/537.36'),
(1056, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'01\', \'17\', \'61\', \'57\', \'lilyidayu\')', 'LILY IDAYU MURTI', '2021-12-04 16:33:35', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0'),
(1057, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'B\', \'17\', \'61\', \'57\', \'lilyidayu\')', 'LILY IDAYU MURTI', '2021-12-04 16:34:13', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0'),
(1058, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'BOX 3.1\', \'15\', \'59\', \'55\', \'adisurya\')', 'ADI SURYA PRADANA', '2021-12-04 16:39:16', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1059, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'17\', \'61\', \'AKUNTANSI\', \'akuntansi\', \'lilyidayu\')', 'LILY IDAYU MURTI', '2021-12-04 16:39:47', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0'),
(1060, 'UPDATE `divisi` SET `instansi_id` = \'17\', `cabang_id` = \'61\', `divisi_name` = \'AKUNTANSI\', `divisi_slug` = \'akuntansi\', `modified_by` = \'lilyidayu\'\nWHERE `id_divisi` = \'58\'', 'LILY IDAYU MURTI', '2021-12-04 16:40:07', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0'),
(1061, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'3\', \'15\', \'59\', \'55\', \'adisurya\')', 'ADI SURYA PRADANA', '2021-12-04 16:40:34', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1062, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'03\', \'16\', \'60\', \'56\', \'kusriner\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 16:52:47', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1063, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'17\', \'61\', \'58\', \'FEB\', \'feb\', \'lilyidayu\')', 'LILY IDAYU MURTI', '2021-12-04 16:52:58', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0'),
(1064, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'10\', \'16\', \'60\', \'56\', \'kusriner\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 16:54:47', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1065, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'KAMPUS 1 UAD\', \'17\', \'61\', \'58\', \'lilyidayu\')', 'LILY IDAYU MURTI', '2021-12-04 16:54:54', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0'),
(1066, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'10\', \'16\', \'60\', \'56\', \'kusriner\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 16:55:15', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1067, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'10\', \'16\', \'60\', \'56\', \'kusriner\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 16:56:20', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1068, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'16\', \'60\', \'56\', \'30\', \'84\', \'42\', \'66\', \'12\', \'59\', \'19\', \'12\', \'SK\', \'Yudisium\', \'0\', \'2021-12-25\', \'1\', \'1\', \'kusriner\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 16:59:43', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1069, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (13, \'5\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 16:59:43', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1070, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021-12-06\', \'2021-12-10\', \'13\', \'84\', \'16\', \'60\', \'56\', \'30\', \'kusriner\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 17:10:18', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1071, 'UPDATE `arsip` SET `is_available` = \'0\'\nWHERE `id_arsip` = \'13\'', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 17:10:18', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1072, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_by`) VALUES (\'2021/12/05\', \'15\', \'13\', \'84\', \'16\', \'60\', \'56\', \'30\', \'kusriner\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 17:11:13', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1073, 'UPDATE `arsip` SET `is_available` = \'1\'\nWHERE `id_arsip` = \'13\'', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 17:11:13', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1074, 'UPDATE `peminjaman` SET `is_kembali` = \'1\'\nWHERE `arsip_id` = \'13\'', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-04 17:11:13', '121.101.130.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1075, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'17\', \'61\', \'58\', \'34\', \'-\', \'46\', \'-\', \'-\', \'-\', \'-\', \'2\', \'sk libur\', \'SK Libur Tahun Baru 2021\', \'0\', \'2022-10-27\', \'1\', \'1\', \'lilyidayu\')', 'LILY IDAYU MURTI', '2021-12-06 09:44:17', '103.19.180.1', 'Mozilla/5.0 (Windows NT 6.1; rv:94.0) Gecko/20100101 Firefox/94.0'),
(1076, 'INSERT INTO `box` (`box_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'A\', \'17\', \'61\', \'58\', \'lilyidayu\')', 'LILY IDAYU MURTI', '2021-12-06 10:06:11', '103.19.180.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1077, 'INSERT INTO `map` (`map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'B\', \'17\', \'61\', \'58\', \'lilyidayu\')', 'LILY IDAYU MURTI', '2021-12-06 10:06:28', '103.19.180.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1078, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (\'kiky\', \'\', \'\', \'1\', \'\', \'\', \'muh1600016004@webmail.uad.ac.id\', \'muhsukri\', \'$2y$10$wf5rbaMB5rFqHUtTtxXbJ.fs1Id//rs42JUq6WJ23rPNyvkJwimoS\', \'17\', \'61\', \'58\', \'34\', \'4\', \'lilyidayu\', \'103.19.180.1\')', 'LILY IDAYU MURTI', '2021-12-06 10:09:16', '103.19.180.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36');
INSERT INTO `log_queries` (`id`, `content`, `created_by`, `created_at`, `ip_address`, `user_agent`) VALUES
(1079, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (85, \'1\')', 'LILY IDAYU MURTI', '2021-12-06 10:09:16', '103.19.180.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1080, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (85, \'2\')', 'LILY IDAYU MURTI', '2021-12-06 10:09:16', '103.19.180.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1081, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (85, \'3\')', 'LILY IDAYU MURTI', '2021-12-06 10:09:16', '103.19.180.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1082, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'01\', \'17\', \'61\', \'58\', \'lilyidayu\')', 'LILY IDAYU MURTI', '2021-12-06 10:09:59', '103.19.180.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1083, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (\'2\', \'17\', \'61\', \'58\', \'lilyidayu\')', 'LILY IDAYU MURTI', '2021-12-06 10:10:34', '103.19.180.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1084, 'INSERT INTO `arsip` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `user_id`, `lokasi_id`, `rak_id`, `box_id`, `map_id`, `baris_id`, `no_arsip`, `arsip_name`, `deskripsi_arsip`, `keterangan`, `masa_retensi`, `status_file`, `is_available`, `created_by`) VALUES (\'17\', \'61\', \'58\', \'34\', \'85\', \'46\', \'67\', \'13\', \'60\', \'20\', \'001\', \'Edaran Libur Natal\', \'#Edaran\\r\\n#Libur\\r\\n#Natal\', \'1\', \'2021-12-31\', \'1\', \'1\', \'lilyidayu\')', 'LILY IDAYU MURTI', '2021-12-06 10:11:47', '103.19.180.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1085, 'INSERT INTO `arsip_jenis` (`arsip_id`, `jenis_arsip_id`) VALUES (15, \'4\')', 'LILY IDAYU MURTI', '2021-12-06 10:11:47', '103.19.180.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'),
(1086, 'UPDATE `users` SET `password` = \'$2y$10$jzdEk7MCSILBN88uffZSX.kC.nVGb7.UasJecU5c02JqSosniuW66\'\nWHERE `id_users` = \'56\'', 'Ridar Gustia', '2021-12-10 08:30:44', '36.68.58.127', 'Mozilla/5.0 (Linux; Android 7.1.2; Redmi 4X) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Mobile Safari/537.36'),
(1087, 'UPDATE `users` SET `password` = \'$2y$10$FcPYR7EQCoGBIBRO/FbUhOE9xncUoXGH5VzKNzgUCilVPF/lPUDWu\'\nWHERE `id_users` = \'51\'', 'Ridar Gustia', '2021-12-10 08:36:26', '36.68.58.127', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36'),
(1088, 'UPDATE `users` SET `password` = \'$2y$10$/QYsMukuJ7mVFMVWaDOzRePGXTWzEb8rJ4jn5zKtpjSeh8TSxb6rG\'\nWHERE `id_users` = \'55\'', 'Ridar Gustia', '2021-12-10 08:36:57', '36.68.58.127', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36'),
(1089, 'UPDATE `bagian` SET `instansi_id` = \'16\', `cabang_id` = \'60\', `divisi_id` = \'56\', `bagian_name` = \'DIVISI  A. ADMINISTRASI\', `bagian_slug` = \'divisi-a-administrasi\', `modified_by` = \'marthinus\'\nWHERE `id_bagian` = \'30\'', 'MARTHINUS PETRUS I.', '2021-12-10 13:05:33', '180.250.183.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0'),
(1090, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (\'16\', \'60\', \'56\', \'DEVISI B. KEUANGAN\', \'devisi-b-keuangan\', \'marthinus\')', 'MARTHINUS PETRUS I.', '2021-12-10 13:08:51', '180.250.183.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0'),
(1091, 'UPDATE `bagian` SET `instansi_id` = \'16\', `cabang_id` = \'60\', `divisi_id` = \'56\', `bagian_name` = \'DEVISI B. KEUANGAN\', `bagian_slug` = \'devisi-b-keuangan\', `modified_by` = \'marthinus\'\nWHERE `id_bagian` = \'35\'', 'MARTHINUS PETRUS I.', '2021-12-10 13:09:33', '180.250.183.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0'),
(1092, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'16\', \'60\', \'S1 KEHUTANAN\', \'s1-kehutanan\', \'kusriner\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-16 11:21:25', '180.250.183.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36'),
(1093, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'16\', \'60\', \'D3 KONSERVASI SUMBER DAYA  HUTAN\', \'d3-konservasi-sumber-daya-hutan\', \'kusriner\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-16 11:22:02', '180.250.183.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36'),
(1094, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'16\', \'60\', \'D3 MANAJEMEN HUTAN ALAM PRODUKSI\', \'d3-manajemen-hutan-alam-produksi\', \'kusriner\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-16 11:22:41', '180.250.183.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36'),
(1095, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (\'16\', \'60\', \'D3 BUDIDAYA HUTAN\', \'d3-budidaya-hutan\', \'kusriner\')', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-16 11:23:04', '180.250.183.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36'),
(1096, 'UPDATE `divisi` SET `is_delete_divisi` = \'1\', `deleted_by` = \'kusriner\', `deleted_at` = \'2021-12-16 11:24:am\'\nWHERE `id_divisi` = \'56\'', 'KUSRINER FERNANDO MBAUBEDARI', '2021-12-16 11:24:36', '180.250.183.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36'),
(1097, 'UPDATE `instansi` SET `instansi_name` = \'UNIVERSITAS BRAWIJAYA\', `instansi_address` = \'............\', `instansi_phone` = \'1234567890\', `active_date` = \'2021-12-19\', `is_active` = \'0\', `modified_by` = \'ridargustia\'\nWHERE `id_instansi` = \'15\'', 'Ridar Gustia', '2021-12-20 14:18:43', '36.73.66.24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36'),
(1098, 'UPDATE `instansi` SET `instansi_name` = \'UNIVERSITAS PAPUA\', `instansi_address` = \'...........\', `instansi_phone` = \'1234567890\', `active_date` = \'2021-12-19\', `is_active` = \'0\', `modified_by` = \'ridargustia\'\nWHERE `id_instansi` = \'16\'', 'Ridar Gustia', '2021-12-20 14:19:10', '36.73.66.24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36'),
(1099, 'UPDATE `instansi` SET `instansi_name` = \'STAIA SW MAGELANG\', `instansi_address` = \'Magelang\', `instansi_phone` = \'123456789\', `active_date` = \'2021-12-15\', `is_active` = \'0\', `modified_by` = \'ridargustia\'\nWHERE `id_instansi` = \'14\'', 'Ridar Gustia', '2021-12-20 14:19:37', '36.73.66.24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36'),
(1100, 'UPDATE `instansi` SET `instansi_name` = \'UNIVERSITAS AHMAD DAHLAN\', `instansi_address` = \'..........\', `instansi_phone` = \'1234567890\', `active_date` = \'2021-12-19\', `is_active` = \'0\', `modified_by` = \'ridargustia\'\nWHERE `id_instansi` = \'17\'', 'Ridar Gustia', '2021-12-20 14:19:53', '36.73.66.24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` int(11) NOT NULL,
  `lokasi_name` varchar(100) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) NOT NULL,
  `divisi_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete_lokasi` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_lokasi`, `deleted_by`, `deleted_at`) VALUES
(33, 'Ruang Arsip 1', 10, 50, 39, '2021-05-07 10:59:13', 'ridargustia', '', NULL, 0, NULL, NULL),
(35, 'Ruang Arsip 2', 10, 53, 44, '2021-05-07 11:01:24', 'rektoruad', 'rektoruad', '2021-05-08 14:46:53', 0, NULL, NULL),
(36, 'Ruang Arsip 1', 10, 52, 43, '2021-05-07 11:01:52', 'rektoruad', '', NULL, 0, NULL, NULL),
(37, 'Ruang Arsip 1', 10, 50, 46, '2021-05-07 11:03:15', 'dekanfti', '', NULL, 0, NULL, NULL),
(38, 'Ruang Arsip 1', 10, 50, 41, '2021-05-07 11:04:28', 'dekanfti', '', NULL, 0, NULL, NULL),
(39, 'RUANG ARSIP', 12, 54, 47, '2021-05-12 15:01:41', 'ridargustia', 'rektorumy', '2021-05-12 15:15:16', 0, NULL, NULL),
(40, 'RUANG ARSIP', 12, 54, 50, '2021-05-12 15:14:32', 'rektorumy', 'rektorumy', '2021-05-12 15:15:32', 0, NULL, NULL),
(41, 'RUANG ARSIP LT 1', 13, 57, 51, '2021-10-15 16:00:26', 'rosirisprio', '', NULL, 0, NULL, NULL),
(42, 'RAK BAg Pendidikan', 16, 60, 56, '2021-12-04 16:26:31', 'kusriner', '', NULL, 0, NULL, NULL),
(43, 'Gudang A', 16, 60, 56, '2021-12-04 16:27:02', 'julpiusjahya', '', NULL, 0, NULL, NULL),
(44, 'GEDUNG B', 11, 51, 40, '2021-12-04 16:27:19', 'nurmapuspitasari', '', NULL, 0, NULL, NULL),
(45, 'Gudang B', 16, 60, 56, '2021-12-04 16:27:33', 'julpiusjahya', '', NULL, 0, NULL, NULL),
(46, 'KAMPUS 1 UAD', 17, 61, 58, '2021-12-04 16:54:54', 'lilyidayu', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `map`
--

CREATE TABLE `map` (
  `id_map` int(11) NOT NULL,
  `map_name` varchar(100) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) NOT NULL,
  `divisi_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete_map` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `map`
--

INSERT INTO `map` (`id_map`, `map_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_map`, `deleted_by`, `deleted_at`) VALUES
(47, '1', 10, 53, 44, '2021-05-06 14:07:16', 'ridargustia', '', NULL, 0, NULL, NULL),
(48, '1', 10, 52, 43, '2021-05-06 14:07:40', 'ridargustia', '', NULL, 0, NULL, NULL),
(50, '2', 10, 53, 44, '2021-05-06 14:09:30', 'rektoruad', '', NULL, 0, NULL, NULL),
(54, '1', 10, 50, 39, '2021-05-06 14:16:17', 'ridargustia', '', NULL, 0, NULL, NULL),
(55, '1', 10, 50, 46, '2021-05-06 14:31:28', 'dekanfti', '', NULL, 0, NULL, NULL),
(56, '1', 12, 54, 47, '2021-05-12 15:01:17', 'ridargustia', '', NULL, 0, NULL, NULL),
(57, '1', 12, 54, 50, '2021-05-12 15:14:10', 'rektorumy', '', NULL, 0, NULL, NULL),
(58, '1', 13, 57, 51, '2021-10-15 16:02:50', 'rosirisprio', '', NULL, 0, NULL, NULL),
(59, '10', 16, 60, 56, '2021-12-04 16:56:20', 'kusriner', '', NULL, 0, NULL, NULL),
(60, 'B', 17, 61, 58, '2021-12-06 10:06:28', 'lilyidayu', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `menu_controller` varchar(100) NOT NULL,
  `menu_function` varchar(100) NOT NULL,
  `menu_icon` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `order_no` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `menu_name`, `menu_controller`, `menu_function`, `menu_icon`, `is_active`, `order_no`) VALUES
(5, 'PEMINJAMAN', 'peminjaman', '#', 'fa-edit', 1, 1),
(6, 'PENGEMBALIAN', 'pengembalian', '#', 'fa-edit', 1, 2),
(7, 'ARSIP', 'arsip', '#', 'fa-archive', 1, 3),
(8, 'RAK', 'rak', '#', 'fa-building', 1, 4),
(9, 'BARIS', 'baris', '#', 'fa-bookmark', 1, 5),
(10, 'LAPORAN', 'laporan', '#', 'fa-file', 1, 8),
(11, 'BOX', 'box', '#', 'fa-inbox', 1, 6),
(12, 'MAP', 'map', '#', 'fa-book', 1, 7),
(13, 'PROGRAM STUDI', 'divisi', '#', 'fa-map-signs', 1, 12),
(14, 'PERGURUAN TINGGI', 'instansi', '#', 'fa-map-signs', 1, 10),
(15, 'LOKASI ARSIP', 'lokasi', '#', 'fa-map-pin', 1, 9),
(16, 'FAKULTAS', 'cabang', '#', 'fa-map-signs', 1, 11),
(17, 'DIVISI', 'bagian', '#', 'fa-map-signs', 1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `menu_access`
--

CREATE TABLE `menu_access` (
  `id_menu_access` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `submenu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_access`
--

INSERT INTO `menu_access` (`id_menu_access`, `usertype_id`, `menu_id`, `submenu_id`) VALUES
(1, 1, 5, 7),
(2, 1, 5, 9),
(4, 1, 10, 18),
(5, 1, 10, 19),
(6, 1, 7, 13),
(7, 1, 7, 12),
(8, 1, 9, 17),
(9, 1, 9, 16),
(10, 1, 8, 15),
(11, 1, 8, 14),
(12, 1, 6, 11),
(13, 1, 6, 10),
(18, 1, 7, 20),
(19, 1, 5, 21),
(20, 1, 6, 22),
(21, 1, 9, 23),
(22, 1, 8, 24),
(26, 2, 7, 13),
(27, 2, 7, 20),
(28, 2, 7, 12),
(29, 2, 9, 17),
(30, 2, 9, 23),
(31, 2, 9, 16),
(32, 2, 8, 15),
(33, 2, 8, 14),
(34, 2, 8, 24),
(35, 2, 5, 9),
(36, 2, 5, 21),
(37, 2, 5, 7),
(38, 2, 6, 11),
(39, 2, 6, 22),
(40, 2, 6, 10),
(41, 1, 12, 28),
(42, 1, 12, 27),
(43, 1, 11, 26),
(44, 1, 11, 25),
(45, 2, 11, 26),
(46, 2, 11, 25),
(47, 2, 12, 28),
(48, 2, 12, 27),
(80, 1, 13, 30),
(81, 1, 13, 29),
(89, 3, 7, 13),
(90, 3, 7, 20),
(91, 3, 7, 12),
(92, 3, 5, 9),
(93, 3, 5, 21),
(94, 3, 5, 7),
(95, 3, 6, 11),
(96, 3, 6, 22),
(97, 3, 6, 10),
(98, 2, 13, 30),
(99, 2, 13, 29),
(100, 1, 13, 33),
(101, 2, 13, 33),
(102, 1, 11, 34),
(103, 1, 12, 35),
(105, 2, 11, 34),
(107, 2, 12, 35),
(108, 2, 10, 18),
(109, 2, 10, 19),
(110, 5, 7, 13),
(111, 5, 7, 20),
(112, 5, 7, 12),
(113, 5, 9, 17),
(114, 5, 9, 23),
(115, 5, 9, 16),
(116, 5, 11, 26),
(117, 5, 11, 34),
(118, 5, 11, 25),
(119, 5, 13, 30),
(120, 5, 13, 33),
(121, 5, 13, 29),
(122, 5, 14, 32),
(123, 5, 14, 36),
(124, 5, 14, 31),
(125, 5, 10, 18),
(126, 5, 10, 19),
(127, 5, 12, 28),
(128, 5, 12, 35),
(129, 5, 12, 27),
(130, 5, 5, 9),
(131, 5, 5, 21),
(132, 5, 5, 7),
(133, 5, 6, 11),
(134, 5, 6, 22),
(135, 5, 6, 10),
(136, 5, 8, 15),
(137, 5, 8, 24),
(138, 5, 8, 14),
(139, 5, 16, 38),
(140, 5, 16, 37),
(141, 5, 15, 40),
(142, 5, 15, 39),
(143, 5, 15, 42),
(144, 5, 16, 41),
(148, 1, 15, 40),
(149, 1, 15, 42),
(150, 1, 15, 39),
(151, 5, 7, 43),
(152, 5, 7, 44),
(153, 1, 7, 43),
(154, 1, 7, 44),
(155, 2, 7, 43),
(156, 2, 7, 44),
(157, 3, 7, 44),
(158, 3, 7, 43),
(161, 5, 10, 45),
(165, 1, 10, 45),
(169, 2, 10, 45),
(171, 2, 15, 40),
(172, 2, 15, 42),
(173, 2, 15, 39),
(174, 3, 10, 45),
(175, 3, 10, 18),
(176, 3, 10, 19),
(178, 3, 8, 14),
(179, 3, 8, 15),
(180, 3, 8, 24),
(181, 3, 9, 16),
(182, 3, 9, 17),
(183, 3, 9, 23),
(184, 3, 11, 25),
(185, 3, 11, 26),
(186, 3, 11, 34),
(187, 3, 12, 27),
(188, 3, 12, 28),
(189, 3, 12, 35),
(190, 3, 15, 39),
(191, 3, 15, 40),
(192, 3, 15, 42),
(193, 5, 17, 46),
(194, 5, 17, 47),
(195, 5, 17, 48),
(196, 1, 16, 37),
(197, 1, 16, 38),
(198, 1, 16, 41),
(199, 1, 17, 46),
(200, 1, 17, 47),
(201, 1, 17, 48),
(202, 2, 17, 46),
(203, 2, 17, 47),
(204, 2, 17, 48),
(205, 3, 17, 46),
(206, 3, 17, 47),
(207, 3, 17, 48),
(208, 4, 5, 7),
(209, 4, 5, 9),
(210, 4, 5, 21),
(211, 4, 6, 10),
(212, 4, 6, 11),
(213, 4, 6, 22),
(214, 4, 7, 12),
(215, 4, 7, 13),
(216, 4, 7, 43),
(217, 4, 7, 44),
(218, 4, 7, 20),
(219, 4, 10, 18),
(220, 4, 10, 19),
(221, 4, 10, 45);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `tgl_peminjaman` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `arsip_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) NOT NULL,
  `divisi_id` int(11) NOT NULL,
  `bagian_id` int(11) NOT NULL,
  `is_kembali` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete_peminjaman` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `is_kembali`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_peminjaman`, `deleted_by`, `deleted_at`) VALUES
(6, '2021-05-15', '2021-05-20', 1, 59, 12, 54, 47, 10, 1, '2021-05-15 21:31:17', 'ridargustia', '', '2021-05-15 21:37:05', 0, NULL, NULL),
(7, '2021-05-15', '2021-05-17', 3, 60, 12, 54, 47, 10, 1, '2021-05-15 21:35:19', 'ridargustia', 'ridargustia', '2021-05-15 21:37:57', 0, NULL, NULL),
(8, '2021-05-16', '2021-05-18', 1, 58, 12, 54, 47, 10, 1, '2021-05-16 11:16:10', 'ridargustia', '', '2021-05-16 13:31:35', 0, NULL, NULL),
(9, '2021-05-16', '2021-05-18', 6, 53, 10, 50, 39, 1, 0, '2021-05-16 11:51:32', 'ridargustia', '', NULL, 0, NULL, NULL),
(10, '2021-05-16', '2021-05-18', 7, 52, 10, 50, 39, 1, 1, '2021-05-16 15:23:47', 'rektoruad', '', '2021-05-16 15:24:07', 0, NULL, NULL),
(11, '2021-05-16', '2021-05-18', 1, 61, 12, 54, 47, 10, 1, '2021-05-16 16:58:41', 'rektorumy', '', '2021-05-16 22:20:33', 0, NULL, NULL),
(12, '2021-05-16', '2021-05-18', 3, 60, 12, 54, 47, 10, 1, '2021-05-16 17:28:32', 'ridargustia', '', '2021-05-16 22:15:58', 0, NULL, NULL),
(13, '2021-05-21', '2021-05-21', 2, 61, 12, 54, 47, 10, 1, '2021-05-21 15:35:15', 'rektorumy', '', '2021-05-21 15:35:42', 0, NULL, NULL),
(14, '2021-05-21', '2021-05-21', 2, 61, 12, 54, 47, 10, 1, '2021-05-21 15:39:28', 'rektorumy', '', '2021-05-21 15:40:56', 0, NULL, NULL),
(15, '2021-12-06', '2021-12-10', 13, 84, 16, 60, 56, 30, 1, '2021-12-04 17:10:17', 'kusriner', '', '2021-12-04 17:11:13', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `peminjaman_id` int(11) NOT NULL,
  `arsip_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) NOT NULL,
  `divisi_id` int(11) NOT NULL,
  `bagian_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete_pengembalian` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_pengembalian`, `tgl_kembali`, `peminjaman_id`, `arsip_id`, `user_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_pengembalian`, `deleted_by`, `deleted_at`) VALUES
(3, '2021-05-15', 6, 1, 59, 12, 54, 47, 10, '2021-05-15 21:37:06', 'ridargustia', '', '2021-05-16 22:43:06', 0, NULL, NULL),
(6, '2021-05-16', 10, 7, 52, 10, 50, 39, 1, '2021-05-16 15:24:07', 'rektoruad', '', NULL, 0, NULL, NULL),
(7, '2021-05-21', 13, 2, 61, 12, 54, 47, 10, '2021-05-21 15:35:42', 'rektorumy', '', NULL, 0, NULL, NULL),
(8, '2021-05-21', 14, 2, 61, 12, 54, 47, 10, '2021-05-21 15:40:56', 'rektorumy', '', NULL, 0, NULL, NULL),
(9, '2021-12-05', 15, 13, 84, 16, 60, 56, 30, '2021-12-04 17:11:13', 'kusriner', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rak`
--

CREATE TABLE `rak` (
  `id_rak` int(11) NOT NULL,
  `rak_name` varchar(50) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) NOT NULL,
  `divisi_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete_rak` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rak`
--

INSERT INTO `rak` (`id_rak`, `rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_rak`, `deleted_by`, `deleted_at`) VALUES
(54, '1', 10, 50, 39, '2021-04-07 14:30:42', 'ridargustia', '', '2021-04-19 13:00:34', 0, NULL, NULL),
(55, '2', 10, 50, 39, '2021-04-30 11:02:30', 'ridargustia', 'ridargustia', '2021-05-05 10:55:38', 1, 'ridargustia', '2021-05-05 10:55:00'),
(56, '1', 10, 50, 46, '2021-04-30 11:14:20', 'rektoruad', 'dekanfti', '2021-04-30 14:14:56', 0, NULL, NULL),
(57, '1', 10, 52, 42, '2021-04-30 11:15:55', 'dekanfti', 'rektoruad', '2021-04-30 14:03:50', 0, NULL, NULL),
(58, '1', 10, 52, 43, '2021-04-30 11:17:05', 'kaproditif', 'ridargustia', '2021-05-03 11:08:24', 0, NULL, NULL),
(59, '2', 10, 50, 39, '2021-05-05 11:03:53', 'ridargustia', '', NULL, 0, NULL, NULL),
(60, '1', 12, 54, 47, '2021-05-12 15:00:14', 'ridargustia', '', NULL, 0, NULL, NULL),
(61, '1', 12, 54, 50, '2021-05-12 15:11:48', 'rektorumy', '', NULL, 0, NULL, NULL),
(62, '1', 13, 57, 51, '2021-10-15 16:01:27', 'rosirisprio', '', NULL, 0, NULL, NULL),
(63, '03', 16, 60, 56, '2021-12-04 16:32:11', 'marthinus', '', NULL, 0, NULL, NULL),
(64, '05', 16, 60, 56, '2021-12-04 16:32:23', 'julpiusjahya', '', NULL, 0, NULL, NULL),
(65, '01', 17, 61, 57, '2021-12-04 16:33:35', 'lilyidayu', '', NULL, 0, NULL, NULL),
(66, '10', 16, 60, 56, '2021-12-04 16:54:47', 'kusriner', '', NULL, 0, NULL, NULL),
(67, '01', 17, 61, 58, '2021-12-06 10:09:59', 'lilyidayu', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `submenu`
--

CREATE TABLE `submenu` (
  `id_submenu` int(11) NOT NULL,
  `submenu_name` varchar(100) NOT NULL,
  `submenu_function` varchar(100) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `order_no` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `submenu`
--

INSERT INTO `submenu` (`id_submenu`, `submenu_name`, `submenu_function`, `menu_id`, `order_no`) VALUES
(7, 'Tambah Peminjaman', 'create', 5, 1),
(9, 'Data Peminjaman', 'index', 5, 2),
(10, 'Tambah Pengembalian', 'create', 6, 1),
(11, 'Data Pengembalian', 'index', 6, 2),
(12, 'Tambah Arsip', 'create', 7, 1),
(13, 'Data Arsip', 'index', 7, 2),
(14, 'Tambah Rak', 'create', 8, 1),
(15, 'Data Rak', 'index', 8, 2),
(16, 'Tambah Baris', 'create', 9, 1),
(17, 'Data Baris', 'index', 9, 2),
(18, 'Laporan Peminjaman', 'peminjaman', 10, 1),
(19, 'Laporan Pengembalian', 'pengembalian', 10, 2),
(20, 'Recycle Bin', 'deleted_list', 7, 5),
(21, 'Recycle Bin', 'deleted_list', 5, 3),
(22, 'Recycle Bin', 'deleted_list', 6, 3),
(23, 'Recycle Bin', 'deleted_list', 9, 3),
(24, 'Recycle Bin', 'deleted_list', 8, 3),
(25, 'Tambah Box', 'create', 11, 1),
(26, 'Data Box', 'index', 11, 2),
(27, 'Tambah Map', 'create', 12, 1),
(28, 'Data Map', 'index', 12, 2),
(29, 'Tambah Program Studi', 'create', 13, 1),
(30, 'Data Program Studi', 'index', 13, 2),
(31, 'Tambah Perguruan Tinggi', 'create', 14, 1),
(32, 'Data Perguruan Tinggi', 'index', 14, 2),
(33, 'Recycle Bin', 'deleted_list', 13, 3),
(34, 'Recycle Bin', 'deleted_list', 11, 3),
(35, 'Recycle Bin', 'deleted_list', 12, 3),
(36, 'Recycle Bin', 'deleted_list', 14, 3),
(37, 'Tambah Fakultas', 'create', 16, 1),
(38, 'Data Fakultas', 'index', 16, 2),
(39, 'Tambah Lokasi Arsip', 'create', 15, 1),
(40, 'Data Lokasi Arsip', 'index', 15, 2),
(41, 'Recycle Bin', 'deleted_list', 16, 3),
(42, 'Recycle Bin', 'deleted_list', 15, 3),
(43, 'Data Arsip Aktif', 'aktif', 7, 3),
(44, 'Data Arsip InAktif', 'inaktif', 7, 4),
(45, 'Laporan Arsip', 'arsip', 10, 3),
(46, 'Tambah Divisi', 'create', 17, 1),
(47, 'Data Divisi', 'index', 17, 2),
(48, 'Recycle Bin', 'deleted_list', 17, 3);

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `name`, `value`) VALUES
(1, 'Layout', 'fixed'),
(2, 'Skins', 'skin-blue-light');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) NOT NULL,
  `divisi_id` int(11) NOT NULL,
  `bagian_id` int(11) NOT NULL,
  `birthdate` varchar(100) NOT NULL,
  `birthplace` varchar(100) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `address` mediumtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `photo` mediumtext NOT NULL,
  `photo_thumb` mediumtext NOT NULL,
  `ip_add_reg` varchar(50) NOT NULL,
  `code_activation` varchar(50) DEFAULT NULL,
  `code_forgotten` varchar(50) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_users`, `name`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `usertype_id`, `is_active`, `photo`, `photo_thumb`, `ip_add_reg`, `code_activation`, `code_forgotten`, `last_login`, `created_by`, `created_at`, `modified_by`, `modified_at`, `is_delete`, `deleted_by`, `deleted_at`) VALUES
(51, 'Rektor UAD', 10, 50, 39, 1, '', '', 1, '', '', 'rektoruad@gmail.com', 'rektoruad', '$2y$10$FcPYR7EQCoGBIBRO/FbUhOE9xncUoXGH5VzKNzgUCilVPF/lPUDWu', 1, 1, '', '', '::1', NULL, NULL, '2021-12-10 08:37:39', 'ridargustia', '2021-04-05 21:36:39', 'ridargustia', '2021-12-10 08:37:39', 0, NULL, NULL),
(52, 'Dekan FTI', 10, 50, 39, 1, '', '', 1, '', '', 'dekanfti@gmail.com', 'dekanfti', '$2y$10$hL1ccmhVnkBeMyrMVSPBbuNQUXx8P1DYIZBlJEcnLjK9vflQAxWae', 2, 1, '', '', '::1', NULL, NULL, '2021-12-10 08:40:08', 'rektoruad', '2021-04-07 21:53:37', '', '2021-12-10 08:40:08', 0, NULL, NULL),
(53, 'Petugas TU', 10, 50, 39, 1, '', '', 1, '', '', 'petugastu@gmail.com', 'petugastu', '$2y$10$aZzENJBrc5Z2jhjA/6Eaie0ZfIJMkispuWwrsAU.DgSwevihlL8ui', 4, 1, '', '', '::1', NULL, NULL, '2021-05-16 12:21:13', 'ridargustia', '2021-04-15 14:10:03', '', '2021-05-16 12:21:13', 0, NULL, NULL),
(54, 'Mahasiswa 1', 10, 50, 39, 1, '', '', 1, '', '', 'mahasiswa1@gmail.com', 'mahasiswa1', '$2y$10$w1r1iLyX35hC9xGntnerv.NXKYLnopSeookU8GUXd0TzT4ADSS3jS', 6, 1, '', '', '::1', NULL, NULL, '2021-05-09 12:35:38', 'ridargustia', '2021-04-15 16:04:14', '', '2021-05-09 12:35:38', 0, NULL, NULL),
(55, 'Kaprodi TIF', 10, 50, 39, 1, '', '', 1, '', '', 'kaproditif@gmail.com', 'kaproditif', '$2y$10$/QYsMukuJ7mVFMVWaDOzRePGXTWzEb8rJ4jn5zKtpjSeh8TSxb6rG', 3, 1, '', '', '::1', NULL, NULL, '2021-12-10 08:38:57', 'ridargustia', '2021-04-15 16:12:44', '', '2021-12-10 08:38:57', 0, NULL, NULL),
(56, 'Ridar Gustia', 11, 51, 40, 0, '', '', 1, '', '089697641301', 'ridargp@gmail.com', 'ridargustia', '$2y$10$jzdEk7MCSILBN88uffZSX.kC.nVGb7.UasJecU5c02JqSosniuW66', 5, 1, '', '', '', NULL, NULL, '2021-12-20 14:17:25', 'ridargustia', '2021-04-19 13:33:27', '', '2021-12-20 14:17:25', 0, NULL, NULL),
(57, 'Rektor UMY', 12, 54, 47, 13, '06/04/1985', 'Yogyakarta', 1, 'Kasihan, Bantul, Yogyakarta', '089697641302', 'rektorumy@gmail.com', 'rektorumy', '$2y$10$TJm7l1vp1FfjMfOx6WG/au9rHjbnCUwSNt3OvBkKtmMD.A3Di9xJa', 1, 1, 'rektorumy20210511142855.png', 'rektorumy20210511142855_thumb.png', '::1', NULL, NULL, '2021-09-22 13:06:47', 'ridargustia', '2021-05-09 13:26:40', 'rektorumy', '2021-09-22 13:06:47', 0, NULL, NULL),
(58, 'Dekan FKIK', 12, 54, 47, 14, '02/20/1990', 'Jakarta', 2, 'Condongcatur, Sleman, Yogyakarta', '089697641303', 'dekanfkik@gmail.com', 'dekanfkik', '$2y$10$z6ux1ecBgGy75JDfKNfoTOCbz9Ztg.APWLsLvLPVlD1wAp8Pj83IO', 2, 1, 'dekanfkik20210511143137.png', 'dekanfkik20210511143137_thumb.png', '::1', NULL, NULL, '2021-05-19 16:19:55', 'rektorumy', '2021-05-09 13:37:12', 'dekanfkik', '2021-05-19 16:19:55', 0, NULL, NULL),
(59, 'Kaprodi Pend. Dokter', 12, 54, 47, 15, '01/01/1998', 'Pati', 1, 'Godean', '085739200383', 'kaprodidokter@gmail.com', 'kaprodidokter', '$2y$10$iPBf0NaL0ctNRq2IoiQrNuQ2zHmCaonam9Ut0LHYx30qG0L7tA7w.', 3, 1, 'kaprodidokter20210511143428.png', 'kaprodidokter20210511143428_thumb.png', '::1', NULL, NULL, '2021-05-20 14:22:28', 'dekanfkik', '2021-05-09 13:45:00', 'kaprodidokter', '2021-05-20 14:22:28', 0, NULL, NULL),
(60, 'Tata Usaha Pend. Dokter', 12, 54, 47, 10, '06/22/1989', 'Cirebon', 2, 'Gamping, Sleman, Yogyakarta', '083192837485', 'tudokter@gmail.com', 'tudokter', '$2y$10$4qxieJmogAgOJJ2HzqqrLe7sYmyaG2y.oZLmepY9slJU2cOG1OKqW', 4, 1, 'tudokter20210509141133.png', 'tudokter20210509141133_thumb.png', '::1', NULL, NULL, '2021-05-21 16:44:08', 'kaprodidokter', '2021-05-09 14:11:33', 'tudokter', '2021-05-21 16:44:08', 0, NULL, NULL),
(61, 'Staff Administrasi', 12, 54, 47, 10, '03/05/1996', 'Sleman', 1, 'Condong Catur, Sleman, Yogyakarta', '089697641305', 'staffadmin@gmail.com', 'staffadmin', '$2y$10$14xJ02mtkPuIUy5Adq.Qpeg2lb6FRvUrRFngEsMzYBQz3voOCGFYG', 6, 1, '', '', '::1', NULL, NULL, '2021-05-21 16:43:54', 'kaprodidokter', '2021-05-09 14:23:24', 'ridargustia', '2021-05-21 16:43:54', 0, NULL, NULL),
(62, 'Tata Usaha Keperawatan', 12, 54, 50, 16, '', '', 1, '', '', 'tukeperawatan@gmail.com', 'tukeperawatan', '$2y$10$W/nrIfGBnWV/KU6.by0toO7FkoBNgxjSslaiM1YBmKiVrnOcKOGlq', 4, 1, '', '', '::1', NULL, NULL, NULL, 'rektorumy', '2021-05-12 15:18:27', '', NULL, 0, NULL, NULL),
(63, 'Choirul Miftah', 13, 57, 51, 17, '', '', 1, '', '', 'choirulmiftah@gmail.com', 'choirulmiftah', '$2y$10$1pGQhZAe26aR5yo83wuOuuTMg2FEg86j8cr/zIYt/..o85sxPG8yO', 4, 1, 'choirulmiftah20211015152804.png', 'choirulmiftah20211015152804_thumb.png', '36.72.212.64', NULL, NULL, '2021-10-15 16:25:02', 'ridargustia', '2021-10-15 15:28:04', 'ridargustia', '2021-10-15 16:25:02', 0, NULL, NULL),
(64, 'Imam Yasir Haidar', 13, 57, 51, 18, '', '', 1, '', '', 'imamyasir@gmail.com', 'imamyasir', '$2y$10$wNNS4vy8hkR0Bo4xwytiJOjcAt.Lbzs2UEKmcraJv7jKUwFY9hNiC', 3, 1, 'imamyasir20211015153518.png', 'imamyasir20211015153518_thumb.png', '36.72.214.164', NULL, NULL, '2021-10-15 16:24:23', 'ridargustia', '2021-10-15 15:35:18', '', '2021-10-15 16:24:23', 0, NULL, NULL),
(65, 'Adam Putra', 13, 57, 51, 19, '', '', 1, '', '', 'adamputra@gmail.com', 'adamputra', '$2y$10$.Hb3kOb9m3Uqh8vE2RT2Je3ySKIqKXiazAeaGgOhDapuCqT7OnWGa', 2, 1, 'adamputra20211015154005.png', 'adamputra20211015154005_thumb.png', '36.72.212.64', NULL, NULL, '2021-10-15 16:23:16', 'ridargustia', '2021-10-15 15:40:05', '', '2021-10-15 16:23:16', 0, NULL, NULL),
(66, 'Rosi RM', 13, 57, 51, 20, '', '', 1, '', '', 'rosirisprio@gmail.com', 'rosirisprio', '$2y$10$cZWqYtrcviXEsIdqySR83uHI7VLLJn230GNQjljab8gbiWGQ4F1Cm', 1, 1, 'rosirisprio20211015154239.png', 'rosirisprio20211015154239_thumb.png', '36.72.215.193', NULL, NULL, '2021-10-15 16:21:21', 'ridargustia', '2021-10-15 15:42:39', '', '2021-10-15 16:21:21', 0, NULL, NULL),
(67, 'Administrator ES', 14, 58, 53, 21, '', '', 1, '', '', 'administratores@gmail.com', 'administratores', '$2y$10$cb3q1HXLPKsnfeHyoKOaiOJD1IdAmEw5jZTdmB1qgsTtLVqOnZ9cK', 4, 1, 'administrator120211016112731.jpg', 'administrator120211016112731_thumb.jpg', '114.142.171.8', NULL, NULL, '2021-10-16 12:02:21', 'ridargustia', '2021-10-16 11:27:31', 'ketua1', '2021-10-16 12:02:21', 0, NULL, NULL),
(68, 'Rektorat1', 14, 58, 53, 24, '', '', 1, '', '', 'rektorat1@gmail.com', 'rektorat1', '$2y$10$UdA4r2nbdl4PWeM/aIJWuewjS58q2LYYx1T.2rqw5q5PWj6Z3GlLi', 1, 1, 'rektorat120211016113029.jpg', 'rektorat120211016113029_thumb.jpg', '114.142.171.8', NULL, NULL, '2021-10-16 11:40:57', 'ridargustia', '2021-10-16 11:30:29', 'ridargustia', '2021-10-16 11:40:57', 0, NULL, NULL),
(69, 'Ketua 1', 14, 58, 53, 25, '', '', 1, '', '', 'ketua1@gmail.com', 'ketua1', '$2y$10$YAABjVr9/iq9nRA6EClTvuV54pTJGLLof4xwGZYcYxNflKrY9fCxK', 2, 1, 'dekanat120211016113502.jpg', 'dekanat120211016113502_thumb.jpg', '114.142.171.8', NULL, NULL, '2021-10-16 12:04:27', 'ridargustia', '2021-10-16 11:35:02', 'dekanat1', '2021-10-16 12:04:27', 0, NULL, NULL),
(70, 'Kaprodi ES', 14, 58, 53, 26, '', '', 1, '', '', 'kaprodies@gmail.com', 'kaprodies', '$2y$10$D7IZTP7Fg8CvvCxRtQj7WeLGku/MYC8bYiaI.oirHaCPrLge0wV1e', 3, 1, 'kaprodi120211016113646.jpg', 'kaprodi120211016113646_thumb.jpg', '114.142.171.8', NULL, NULL, '2021-10-16 12:05:41', 'ridargustia', '2021-10-16 11:36:46', 'ketua1', '2021-10-16 12:05:41', 0, NULL, NULL),
(71, 'Kaprodi MPI', 14, 58, 54, 27, '', '', 1, '', '', 'kaprodimpi@gmail.com', 'kaprodimpi', '$2y$10$ytuQx4VRmTxD5whoCIOL3uKPb4Ojyo3cdEKecg5pB2pLwhLEDIJtC', 3, 1, 'kaprodimpi20211016115142.jpg', 'kaprodimpi20211016115142_thumb.jpg', '114.142.171.8', NULL, NULL, '2021-10-16 12:01:02', 'ketua1', '2021-10-16 11:51:42', '', '2021-10-16 12:01:02', 0, NULL, NULL),
(72, 'Kaprodi IAT', 14, 58, 52, 28, '', '', 1, '', '', 'kaprodiiat@gmail.com', 'kaprodiiat', '$2y$10$67.bWJ6468A3QuuRLpf3xOOjErQhVthUya5MMWRxEaQ08vjvoynaW', 3, 1, 'kaprodiiat20211016115400.jpg', 'kaprodiiat20211016115400_thumb.jpg', '114.142.171.8', NULL, NULL, '2021-10-16 12:01:35', 'ketua1', '2021-10-16 11:54:00', '', '2021-10-16 12:01:35', 0, NULL, NULL),
(73, 'Administrator MPI', 14, 58, 54, 23, '', '', 1, '', '', 'administratormpi@gmail.com', 'administratormpi', '$2y$10$pYSMLvgT1/9IHcXNXnsfVuyPxwx0pSpvyL6EfgayWcHQuSfBFRbsq', 4, 1, 'administratormpi20211016115700.jpg', 'administratormpi20211016115700_thumb.jpg', '114.142.171.8', NULL, NULL, NULL, 'ketua1', '2021-10-16 11:57:00', '', NULL, 0, NULL, NULL),
(74, 'Administrator IAT', 14, 58, 52, 22, '', '', 1, '', '', 'administratoriat@gmail.com', 'administratoriat', '$2y$10$GMA1WjCne583zSGoANY5WOgi8QS00ocUd.4cYBRph4zzhFhrhuR6C', 4, 1, 'administratoriat20211016115837.jpg', 'administratoriat20211016115837_thumb.jpg', '114.142.171.8', NULL, NULL, NULL, 'ketua1', '2021-10-16 11:58:37', '', NULL, 0, NULL, NULL),
(75, 'ADI SURYA PRADANA', 15, 59, 55, 29, '11/04/1998', 'Yogyakarta', 1, 'Jl Kertosentono 41 b', '085259579792', 'adisurya@gmail.com', 'adisurya', '$2y$10$/O/zgrE7x0G49uG9hkRFX.Bzy.1YLZqNrOENTAfO3RLepWpWRzIQG', 2, 1, 'adisurya20211204155323.jpg', 'adisurya20211204155323_thumb.jpg', '36.80.201.59', NULL, NULL, '2021-12-04 15:54:00', 'ridargustia', '2021-12-03 22:30:41', 'adisurya', '2021-12-04 16:01:34', 0, NULL, NULL),
(76, 'EDY ROESANTO', 15, 59, 55, 29, '', '', 1, '', '', 'edyroesanto@gmail.com', 'edyroesanto', '$2y$10$I9tQIR0llEIBkmTzq7xTfuznWAtJzP1OlUMSu.D28rB1M7cf8Pg2G', 3, 1, 'edyroesanto20211203223239.jpg', 'edyroesanto20211203223239_thumb.jpg', '36.80.201.59', NULL, NULL, '2021-12-04 09:50:17', 'ridargustia', '2021-12-03 22:32:39', '', '2021-12-04 09:50:17', 0, NULL, NULL),
(77, 'KUSRINER FERNANDO MBAUBEDARI', 16, 60, 56, 30, '17/02/1974', 'SERUI', 1, 'FAKULTAS KEHUTANAN UNIVERSITAS PAPUA, MANOKWARI PAPUA BARAT', '081808383939', 'kusriner@gmail.com', 'kusriner', '$2y$10$rJMten6LgAow02EvineTRewUL/1fihXCkG0kbGNySnzBhvq6mcgfG', 2, 1, 'kusriner20211204155835.jpg', 'kusriner20211204155835_thumb.jpg', '36.80.201.59', NULL, NULL, '2021-12-16 11:12:06', 'ridargustia', '2021-12-03 22:34:40', 'kusriner', '2021-12-16 11:12:06', 0, NULL, NULL),
(78, 'JULPIUS JAHYA R.', 16, 60, 56, 30, '10/05/1974', 'Manokwari', 1, 'Jl.S. pami .RT.05 amban Manokwari', '081294013201', 'julpiusjahya@gmail.com', 'julpiusjahya', '$2y$10$bW9T.XNwjLyhIcuZ0V4oIu2sk.sFjFKxeMYurG2fj6cAA.5e0vPVm', 3, 1, 'julpiusjahya20211203223647.jpg', 'julpiusjahya20211203223647_thumb.jpg', '36.80.201.59', NULL, NULL, '2021-12-16 11:05:59', 'ridargustia', '2021-12-03 22:36:47', 'julpiusjahya', '2021-12-16 11:05:59', 0, NULL, NULL),
(79, 'MARTHINUS PETRUS I.', 16, 60, 56, 30, '03/25/1971', 'manokwari', 1, 'jln. Nangka 1, Reremi, Manokwari', '081361882056', 'marthinus@gmail.com', 'marthinus', '$2y$10$KKya1W3b.nam7gBf/8oNWuVkKaaEgv3vH/m0ZcJuu2y75Gxv7cgm2', 3, 1, 'marthinus20211203223836.jpg', 'marthinus20211203223836_thumb.jpg', '36.80.201.59', NULL, NULL, '2021-12-13 21:17:00', 'ridargustia', '2021-12-03 22:38:36', 'marthinus', '2021-12-13 21:17:00', 0, NULL, NULL),
(80, 'LILY IDAYU MURTI', 17, 61, 57, 31, '', '', 2, '', '', 'lilyidayu@gmail.com', 'lilyidayu', '$2y$10$A2LldVgZmES7hCVHM3penOY0avit6GugFe8ugCyEIWOZNhOnFvdGa', 2, 1, 'lilyidayu20211203224050.jpg', 'lilyidayu20211203224050_thumb.jpg', '36.80.201.59', NULL, NULL, '2021-12-06 10:12:15', 'ridargustia', '2021-12-03 22:40:50', '', '2021-12-06 10:12:15', 0, NULL, NULL),
(81, 'ZAHRAWAANI FITRI ASTUTI', 17, 61, 57, 31, '', '', 2, '', '', 'zahrawani.astuti@staff.uad.ac.id', 'zahrawaani', '$2y$10$Wl.YmL2vR8LGz/GzxbzpBeekn/Sf9gT1/UX.HpWMfegor5QJe/LcG', 3, 1, 'zahrawaani20211203224247.jpg', 'zahrawaani20211203224247_thumb.jpg', '36.80.201.59', NULL, NULL, '2021-12-06 09:54:42', 'ridargustia', '2021-12-03 22:42:47', 'zahrawaani', '2021-12-06 09:54:42', 0, NULL, NULL),
(82, 'Nurma Puspitasari', 11, 51, 40, 2, '', '', 2, '', '', 'nurmapuspitasari@gmail.com', 'nurmapuspitasari', '$2y$10$eF5TG5CQ2Ga6pIxJQXqHf.du8uzrqs.D2b6UrGCQscN63KoqJSB1C', 2, 1, 'nurmapuspitasari20211204120056.jpg', 'nurmapuspitasari20211204120056_thumb.jpg', '121.101.130.170', NULL, NULL, '2021-12-04 14:17:38', 'ridargustia', '2021-12-04 12:00:56', '', '2021-12-04 14:17:38', 0, NULL, NULL),
(83, 'rachman', 15, 59, 55, 29, '09/04/1912', 'Pati', 1, 'Wagir Malang', '087654567896', 'rachman123@gmail.com', 'rachman123', '$2y$10$woQ2sYW7DIsAMJGJKbFehOnKDMAnpntJapds/1HiYNkC8JoZSq4yu', 4, 1, '', '', '121.101.130.170', NULL, NULL, NULL, 'adisurya', '2021-12-04 16:11:19', '', NULL, 0, NULL, NULL),
(84, 'gashsdkjjskd', 16, 60, 56, 30, '', '', 1, '', '', 'reneerqux@gmail.com', 'jayapuraqu', '$2y$10$e5ICl9vSffqFYhuHaZAxgeQ.ajo0zCB/3b2UJBOufkrVqa2C6U5Qm', 3, 1, '', '', '121.101.130.170', NULL, NULL, NULL, 'kusriner', '2021-12-04 16:24:41', '', NULL, 0, NULL, NULL),
(85, 'kiky', 17, 61, 58, 34, '', '', 1, '', '', 'muh1600016004@webmail.uad.ac.id', 'muhsukri', '$2y$10$wf5rbaMB5rFqHUtTtxXbJ.fs1Id//rs42JUq6WJ23rPNyvkJwimoS', 4, 1, '', '', '103.19.180.1', NULL, NULL, NULL, 'lilyidayu', '2021-12-06 10:09:16', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_data_access`
--

CREATE TABLE `users_data_access` (
  `id_users_data_access` int(11) NOT NULL,
  `data_access_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_data_access`
--

INSERT INTO `users_data_access` (`id_users_data_access`, `data_access_id`, `user_id`) VALUES
(629, 1, 51),
(630, 2, 51),
(631, 3, 51),
(632, 4, 51),
(633, 5, 51),
(634, 1, 52),
(635, 2, 52),
(636, 3, 52),
(637, 4, 52),
(638, 5, 52),
(639, 1, 53),
(640, 2, 53),
(641, 3, 53),
(642, 4, 53),
(643, 5, 53),
(644, 1, 54),
(645, 2, 54),
(646, 3, 54),
(647, 4, 54),
(648, 5, 54),
(649, 1, 55),
(650, 2, 55),
(651, 3, 55),
(652, 4, 55),
(653, 5, 55),
(654, 1, 56),
(655, 2, 56),
(656, 3, 56),
(657, 4, 56),
(658, 5, 56),
(659, 1, 57),
(660, 2, 57),
(661, 3, 57),
(662, 4, 57),
(663, 5, 57),
(664, 1, 58),
(665, 2, 58),
(666, 3, 58),
(667, 4, 58),
(668, 5, 58),
(669, 1, 59),
(670, 2, 59),
(671, 3, 59),
(672, 4, 59),
(673, 5, 59),
(689, 1, 61),
(690, 2, 61),
(691, 3, 61),
(692, 4, 61),
(693, 5, 61),
(729, 1, 60),
(730, 2, 60),
(731, 3, 60),
(732, 4, 60),
(733, 5, 60),
(734, 1, 62),
(735, 2, 62),
(736, 3, 62),
(737, 4, 62),
(738, 5, 62),
(744, 1, 64),
(745, 2, 64),
(746, 3, 64),
(747, 4, 64),
(748, 5, 64),
(749, 1, 63),
(750, 2, 63),
(751, 3, 63),
(752, 4, 63),
(753, 5, 63),
(754, 1, 65),
(755, 2, 65),
(756, 3, 65),
(757, 4, 65),
(758, 5, 65),
(759, 1, 66),
(760, 2, 66),
(761, 3, 66),
(762, 4, 66),
(763, 5, 66),
(774, 1, 68),
(775, 2, 68),
(776, 3, 68),
(777, 4, 68),
(778, 5, 68),
(779, 1, 69),
(780, 2, 69),
(781, 3, 69),
(782, 4, 69),
(783, 5, 69),
(794, 1, 71),
(795, 2, 71),
(796, 3, 71),
(797, 4, 71),
(798, 5, 71),
(799, 1, 70),
(800, 2, 70),
(801, 3, 70),
(802, 4, 70),
(803, 5, 70),
(804, 1, 72),
(805, 2, 72),
(806, 3, 72),
(807, 4, 72),
(808, 5, 72),
(809, 1, 67),
(810, 2, 67),
(811, 3, 67),
(812, 4, 67),
(813, 5, 67),
(814, 1, 73),
(815, 2, 73),
(816, 3, 73),
(817, 4, 73),
(818, 5, 73),
(819, 1, 74),
(820, 2, 74),
(821, 3, 74),
(822, 4, 74),
(823, 5, 74),
(824, 1, 75),
(825, 2, 75),
(826, 3, 75),
(827, 4, 75),
(828, 5, 75),
(829, 1, 76),
(830, 2, 76),
(831, 3, 76),
(832, 4, 76),
(833, 5, 76),
(834, 1, 77),
(835, 2, 77),
(836, 3, 77),
(837, 4, 77),
(838, 5, 77),
(839, 1, 78),
(840, 2, 78),
(841, 3, 78),
(842, 4, 78),
(843, 5, 78),
(844, 1, 79),
(845, 2, 79),
(846, 3, 79),
(847, 4, 79),
(848, 5, 79),
(849, 1, 80),
(850, 2, 80),
(851, 3, 80),
(852, 4, 80),
(853, 5, 80),
(854, 1, 81),
(855, 2, 81),
(856, 3, 81),
(857, 4, 81),
(858, 5, 81),
(859, 1, 82),
(860, 2, 82),
(861, 3, 82),
(862, 4, 82),
(863, 5, 82),
(864, 1, 83),
(865, 2, 83),
(866, 3, 83),
(867, 4, 83),
(868, 5, 83),
(869, 1, 84),
(870, 1, 85),
(871, 2, 85),
(872, 3, 85);

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `id_usertype` int(11) NOT NULL,
  `usertype_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id_usertype`, `usertype_name`) VALUES
(1, 'MasterAdmin'),
(2, 'SuperAdmin'),
(3, 'Administrator'),
(4, 'Pegawai'),
(5, 'GrandAdmin'),
(6, 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arsip`
--
ALTER TABLE `arsip`
  ADD PRIMARY KEY (`id_arsip`),
  ADD KEY `FK_arsip_instansi` (`instansi_id`),
  ADD KEY `FK_arsip_rak` (`rak_id`),
  ADD KEY `FK_arsip_baris` (`baris_id`),
  ADD KEY `FK_arsip_box` (`box_id`),
  ADD KEY `FK_arsip_map` (`map_id`),
  ADD KEY `FK_arsip_divisi` (`divisi_id`),
  ADD KEY `FK_arsip_users` (`user_id`),
  ADD KEY `FK_arsip_lokasi` (`lokasi_id`);

--
-- Indexes for table `arsip_files`
--
ALTER TABLE `arsip_files`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_arsip_files_arsip` (`arsip_id`);

--
-- Indexes for table `arsip_jenis`
--
ALTER TABLE `arsip_jenis`
  ADD PRIMARY KEY (`id_arsip_jenis`),
  ADD KEY `FK_arsip_jenis_arsip` (`arsip_id`),
  ADD KEY `FK_arsip_jenis_jenis_arsip` (`jenis_arsip_id`);

--
-- Indexes for table `bagian`
--
ALTER TABLE `bagian`
  ADD PRIMARY KEY (`id_bagian`);

--
-- Indexes for table `baris`
--
ALTER TABLE `baris`
  ADD PRIMARY KEY (`id_baris`),
  ADD KEY `FK_baris_instansi` (`instansi_id`),
  ADD KEY `FK_baris_cabang` (`cabang_id`);

--
-- Indexes for table `box`
--
ALTER TABLE `box`
  ADD PRIMARY KEY (`id_box`),
  ADD KEY `FK_box_instansi` (`instansi_id`),
  ADD KEY `FK_box_cabang` (`cabang_id`);

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`id_cabang`),
  ADD KEY `cabang_FK` (`instansi_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id_company`);

--
-- Indexes for table `data_access`
--
ALTER TABLE `data_access`
  ADD PRIMARY KEY (`id_data_access`);

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id_divisi`),
  ADD KEY `FK_divisi_instansi` (`instansi_id`),
  ADD KEY `FK_divisi_cabang` (`cabang_id`);

--
-- Indexes for table `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`id_footer`);

--
-- Indexes for table `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`id_instansi`);

--
-- Indexes for table `jenis_arsip`
--
ALTER TABLE `jenis_arsip`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_queries`
--
ALTER TABLE `log_queries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`),
  ADD KEY `FK_lokasi_instansi` (`instansi_id`),
  ADD KEY `FK_lokasi_cabang` (`cabang_id`);

--
-- Indexes for table `map`
--
ALTER TABLE `map`
  ADD PRIMARY KEY (`id_map`),
  ADD KEY `FK_map_instansi` (`instansi_id`),
  ADD KEY `FK_map_cabang` (`cabang_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `menu_access`
--
ALTER TABLE `menu_access`
  ADD PRIMARY KEY (`id_menu_access`),
  ADD KEY `FK_menu_access_usertype` (`usertype_id`),
  ADD KEY `FK_menu_access_menu` (`menu_id`),
  ADD KEY `FK_menu_access_submenu` (`submenu_id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `FK_peminjaman_arsip` (`arsip_id`),
  ADD KEY `FK_peminjaman_users` (`user_id`),
  ADD KEY `FK_peminjaman_divisi` (`divisi_id`),
  ADD KEY `FK_peminjaman_instansi` (`instansi_id`),
  ADD KEY `FK_peminjaman_cabang` (`cabang_id`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD KEY `FK_pengembalian_peminjaman` (`peminjaman_id`),
  ADD KEY `FK_pengembalian_arsip` (`arsip_id`),
  ADD KEY `FK_pengembalian_users` (`user_id`),
  ADD KEY `FK_pengembalian_divisi` (`divisi_id`),
  ADD KEY `FK_pengembalian_instansi` (`instansi_id`),
  ADD KEY `FK_pengembalian_cabang` (`cabang_id`);

--
-- Indexes for table `rak`
--
ALTER TABLE `rak`
  ADD PRIMARY KEY (`id_rak`),
  ADD KEY `FK_rak_instansi` (`instansi_id`),
  ADD KEY `FK_rak_cabang` (`cabang_id`);

--
-- Indexes for table `submenu`
--
ALTER TABLE `submenu`
  ADD PRIMARY KEY (`id_submenu`),
  ADD KEY `FK_submenu_menu` (`menu_id`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`),
  ADD KEY `FK_users_usertype` (`usertype_id`) USING BTREE,
  ADD KEY `FK_users_instansi` (`instansi_id`) USING BTREE,
  ADD KEY `FK_users_divisi` (`divisi_id`) USING BTREE,
  ADD KEY `FK_users_cabang` (`cabang_id`);

--
-- Indexes for table `users_data_access`
--
ALTER TABLE `users_data_access`
  ADD PRIMARY KEY (`id_users_data_access`),
  ADD KEY `FK_users_data_access_users` (`user_id`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`id_usertype`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arsip`
--
ALTER TABLE `arsip`
  MODIFY `id_arsip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `arsip_files`
--
ALTER TABLE `arsip_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `arsip_jenis`
--
ALTER TABLE `arsip_jenis`
  MODIFY `id_arsip_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `bagian`
--
ALTER TABLE `bagian`
  MODIFY `id_bagian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `baris`
--
ALTER TABLE `baris`
  MODIFY `id_baris` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `box`
--
ALTER TABLE `box`
  MODIFY `id_box` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cabang`
--
ALTER TABLE `cabang`
  MODIFY `id_cabang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id_company` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_access`
--
ALTER TABLE `data_access`
  MODIFY `id_data_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `footer`
--
ALTER TABLE `footer`
  MODIFY `id_footer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `instansi`
--
ALTER TABLE `instansi`
  MODIFY `id_instansi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `jenis_arsip`
--
ALTER TABLE `jenis_arsip`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `log_queries`
--
ALTER TABLE `log_queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1101;

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `map`
--
ALTER TABLE `map`
  MODIFY `id_map` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `menu_access`
--
ALTER TABLE `menu_access`
  MODIFY `id_menu_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rak`
--
ALTER TABLE `rak`
  MODIFY `id_rak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `users_data_access`
--
ALTER TABLE `users_data_access`
  MODIFY `id_users_data_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=873;

--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id_usertype` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arsip`
--
ALTER TABLE `arsip`
  ADD CONSTRAINT `FK_arsip_baris` FOREIGN KEY (`baris_id`) REFERENCES `baris` (`id_baris`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_arsip_box` FOREIGN KEY (`box_id`) REFERENCES `box` (`id_box`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_arsip_divisi` FOREIGN KEY (`divisi_id`) REFERENCES `divisi` (`id_divisi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_arsip_instansi` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id_instansi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_arsip_lokasi` FOREIGN KEY (`lokasi_id`) REFERENCES `lokasi` (`id_lokasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_arsip_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`id_map`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_arsip_rak` FOREIGN KEY (`rak_id`) REFERENCES `rak` (`id_rak`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_arsip_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `arsip_files`
--
ALTER TABLE `arsip_files`
  ADD CONSTRAINT `FK_arsip_files_arsip` FOREIGN KEY (`arsip_id`) REFERENCES `arsip` (`id_arsip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `arsip_jenis`
--
ALTER TABLE `arsip_jenis`
  ADD CONSTRAINT `FK_arsip_jenis_arsip` FOREIGN KEY (`arsip_id`) REFERENCES `arsip` (`id_arsip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_arsip_jenis_jenis_arsip` FOREIGN KEY (`jenis_arsip_id`) REFERENCES `jenis_arsip` (`id_jenis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `baris`
--
ALTER TABLE `baris`
  ADD CONSTRAINT `FK_baris_cabang` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_baris_instansi` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id_instansi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `box`
--
ALTER TABLE `box`
  ADD CONSTRAINT `FK_box_cabang` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_box_instansi` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id_instansi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cabang`
--
ALTER TABLE `cabang`
  ADD CONSTRAINT `cabang_FK` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id_instansi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `divisi`
--
ALTER TABLE `divisi`
  ADD CONSTRAINT `FK_divisi_cabang` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_divisi_instansi` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id_instansi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD CONSTRAINT `FK_lokasi_cabang` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_lokasi_instansi` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id_instansi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `map`
--
ALTER TABLE `map`
  ADD CONSTRAINT `FK_map_cabang` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_map_instansi` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id_instansi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_access`
--
ALTER TABLE `menu_access`
  ADD CONSTRAINT `FK_menu_access_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_menu_access_submenu` FOREIGN KEY (`submenu_id`) REFERENCES `submenu` (`id_submenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_menu_access_usertype` FOREIGN KEY (`usertype_id`) REFERENCES `usertype` (`id_usertype`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `FK_peminjaman_arsip` FOREIGN KEY (`arsip_id`) REFERENCES `arsip` (`id_arsip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_peminjaman_cabang` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_peminjaman_divisi` FOREIGN KEY (`divisi_id`) REFERENCES `divisi` (`id_divisi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_peminjaman_instansi` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id_instansi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_peminjaman_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `FK_pengembalian_arsip` FOREIGN KEY (`arsip_id`) REFERENCES `arsip` (`id_arsip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pengembalian_cabang` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pengembalian_divisi` FOREIGN KEY (`divisi_id`) REFERENCES `divisi` (`id_divisi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pengembalian_instansi` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id_instansi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pengembalian_peminjaman` FOREIGN KEY (`peminjaman_id`) REFERENCES `peminjaman` (`id_peminjaman`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pengembalian_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rak`
--
ALTER TABLE `rak`
  ADD CONSTRAINT `FK_rak_cabang` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_rak_instansi` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id_instansi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `submenu`
--
ALTER TABLE `submenu`
  ADD CONSTRAINT `FK_submenu_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_users_cabang` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_users_divisi` FOREIGN KEY (`divisi_id`) REFERENCES `divisi` (`id_divisi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_users_instansi` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id_instansi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_users_usertype` FOREIGN KEY (`usertype_id`) REFERENCES `usertype` (`id_usertype`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_data_access`
--
ALTER TABLE `users_data_access`
  ADD CONSTRAINT `FK_users_data_access_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
