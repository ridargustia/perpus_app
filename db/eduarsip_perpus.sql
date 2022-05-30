-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2022 at 05:00 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eduarsip_perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `no_induk` varchar(25) NOT NULL,
  `anggota_name` varchar(100) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `angkatan` year(4) NOT NULL,
  `address` mediumtext NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `no_induk`, `anggota_name`, `instansi_id`, `gender`, `angkatan`, `address`, `created_by`, `created_at`, `modified_by`, `modified_at`, `is_delete`, `deleted_by`, `deleted_at`) VALUES
(1, '1600018161', 'Ridar Gustia', 10, 1, 2016, 'Ketandan Wetan, Imogiri', 'ridargustia', '2022-03-01 10:00:24', NULL, '2022-03-01 11:26:13', 0, NULL, NULL),
(2, '1600018162', 'Gilang Herjun', 10, 1, 2016, 'D2S, Imogiri, Bantul, Yogyakarta', 'ridargustia', '2022-03-01 10:00:24', 'ridargustia', '2022-03-02 10:27:05', 0, NULL, NULL),
(3, '1600018163', 'Denny', 11, 1, 2016, 'Barongan', 'ridargustia', '2022-03-03 13:46:02', NULL, NULL, 0, NULL, NULL);

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
  `cabang_id` int(11) DEFAULT NULL,
  `divisi_id` int(11) DEFAULT NULL,
  `bagian_id` int(11) DEFAULT NULL,
  `rak_id` int(11) NOT NULL,
  `baris_id` int(11) NOT NULL,
  `lokasi_id` int(11) NOT NULL,
  `box_id` int(11) DEFAULT NULL,
  `map_id` int(11) DEFAULT NULL,
  `penulis_buku` varchar(125) DEFAULT NULL,
  `jumlah_halaman` int(11) DEFAULT NULL,
  `bahasa_id` int(11) DEFAULT NULL,
  `tema_buku` varchar(225) DEFAULT NULL,
  `penerbit` varchar(125) DEFAULT NULL,
  `kota_penerbit` varchar(100) DEFAULT NULL,
  `tahun_terbit` year(4) DEFAULT NULL,
  `deskripsi_arsip` mediumtext NOT NULL,
  `cover_buku` varchar(200) DEFAULT NULL,
  `cover_buku_thumb` varchar(200) DEFAULT NULL,
  `keterangan` mediumtext,
  `masa_retensi` date DEFAULT NULL,
  `status_retensi` tinyint(1) DEFAULT NULL,
  `link_gdrive` mediumtext,
  `status_file` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `is_available` int(11) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `arsip`
--

INSERT INTO `arsip` (`id_arsip`, `arsip_name`, `no_arsip`, `email`, `gdrive_last_folder_name_target`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `rak_id`, `baris_id`, `lokasi_id`, `box_id`, `map_id`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `cover_buku`, `cover_buku_thumb`, `keterangan`, `masa_retensi`, `status_retensi`, `link_gdrive`, `status_file`, `user_id`, `is_available`, `qty`, `created_by`, `created_at`, `modified_by`, `modified_at`, `is_delete`, `deleted_by`, `deleted_at`) VALUES
(22, 'Testing Book Satu', 'SR 738.29 WIN t', NULL, NULL, 10, NULL, NULL, NULL, 59, 19, 40, NULL, NULL, 'Gilang Herjun Winarta', 98, 1, 'Testing Aplikasi Aplikasi Perpustakaan', 'Erlangga', 'Jakarta', 2019, 'Oleh Gilang Herjun Winarta. Terdiri dari 98 halaman berbahasa Indonesia tentang "Testing Aplikasi Aplikasi Perpustakaan". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022', 'testing-book-satu20220518193527.jpg', 'testing-book-satu20220518193527_thumb.jpg', NULL, NULL, NULL, NULL, 0, NULL, 1, 5, 'admin', '2022-03-24 15:57:32', 'ridargustia', '2022-05-20 13:55:23', 0, NULL, NULL),
(23, 'Soal Ujian Akhir Sekolah', 'SR 7567.9565 SET s', NULL, NULL, 10, NULL, NULL, NULL, 59, 19, 40, NULL, NULL, 'Deny Setyanto dan Jeghison Riyadi', 20, 1, 'teknologi pendidikan - metode', 'Pustaka Ilmu', 'Surabaya', 2009, 'Oleh Deny Setyanto dan Jeghison Riyadi. Terdiri dari 20 halaman berbahasa Indonesia tentang "teknologi pendidikan - metode". Diterbitkan di Surabaya oleh Pustaka Ilmu pada tahun 2009 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022', 'soal-ujian-akhir-sekolah20220518192758.png', 'soal-ujian-akhir-sekolah20220518192758_thumb.png', NULL, NULL, NULL, NULL, 0, NULL, 1, 3, 'admin', '2022-03-24 16:04:06', 'ridargustia', '2022-05-21 23:36:26', 0, NULL, NULL),
(24, 'Filsafat', 'PS 2873.49 PRI f', NULL, NULL, 10, NULL, NULL, NULL, 59, 19, 40, NULL, NULL, 'Ridar Gustia Priatama dkk.', 56, 2, 'Testing Aplikasi', 'Graha Ilmu', 'Surabaya', 2019, 'Oleh Ridar Gustia Priatama dkk.. Terdiri dari 56 halaman berbahasa Inggris tentang "Testing Aplikasi". Diterbitkan di Surabaya oleh Graha Ilmu pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022', 'filsafat20220518193439.jpg', 'filsafat20220518193439_thumb.jpg', NULL, NULL, NULL, NULL, 0, NULL, 1, 15, 'admin', '2022-03-24 16:07:24', 'ridargustia', '2022-05-25 11:23:56', 0, NULL, NULL),
(25, 'Perjanjian Kontrak EduArsip', 'SR 87349.93 AJI p', NULL, NULL, 10, NULL, NULL, NULL, 59, 19, 40, NULL, NULL, 'Muhammad Satrio Aji dkk', 86, 1, 'kamus bahasa jawa kuno - indonesia', 'Sinar Dunia Indonesia', 'Surabaya', 2020, 'Oleh Muhammad Satrio Aji dkk. Terdiri dari 86 halaman berbahasa Indonesia tentang "kamus bahasa jawa kuno - indonesia". Diterbitkan di Surabaya oleh Sinar Dunia Indonesia pada tahun 2020 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022', 'perjanjian-kontrak-eduarsip20220518170226.jpg', 'perjanjian-kontrak-eduarsip20220518170226_thumb.jpg', NULL, NULL, NULL, NULL, 1, NULL, 1, 8, 'admin', '2022-03-24 16:13:29', 'ridargustia', '2022-05-21 23:56:14', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `arsip_files`
--

CREATE TABLE `arsip_files` (
  `id` int(11) NOT NULL,
  `arsip_id` int(11) NOT NULL,
  `file_upload` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `arsip_files`
--

INSERT INTO `arsip_files` (`id`, `arsip_id`, `file_upload`, `created_at`, `created_by`) VALUES
(1, 1, 'Invoice-328259_(1).pdf', '2022-02-16 11:58:08', 'ridargustia'),
(2, 1, 'Invoice-328259.pdf', '2022-02-16 11:58:08', 'ridargustia'),
(3, 19, 'Invoice-419174_(1)4.pdf', '2022-03-16 14:57:38', 'admin'),
(4, 19, 'Invoice-4191744.pdf', '2022-03-16 14:57:38', 'admin'),
(5, 20, 'Invoice-4191745.pdf', '2022-03-16 15:02:15', 'admin'),
(6, 20, 'Invoice-416198.pdf', '2022-03-16 15:02:15', 'admin'),
(7, 20, 'Invoice-395850.pdf', '2022-03-16 15:02:15', 'admin'),
(8, 20, 'Invoice-383380.pdf', '2022-03-16 15:02:15', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `arsip_jenis`
--

CREATE TABLE `arsip_jenis` (
  `id_arsip_jenis` int(11) NOT NULL,
  `arsip_id` int(11) NOT NULL,
  `jenis_arsip_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `arsip_jenis`
--

INSERT INTO `arsip_jenis` (`id_arsip_jenis`, `arsip_id`, `jenis_arsip_id`, `created_at`) VALUES
(1, 1, 5, '2021-05-12 15:03:17');

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
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
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
(7, 'MAHASISWA', 'dosen', 10, 52, 42, '2021-04-21 13:59:34', 'rektoruad', 'rektoruad', '2022-01-25 11:20:40', 0, NULL, NULL),
(8, 'MAHASISWA', 'mahasiswa', 10, 50, 41, '2021-04-21 14:02:51', 'rektoruad', '', NULL, 0, NULL, NULL),
(9, 'MAHASISWA', 'mahasiswa', 10, 50, 46, '2021-04-21 14:39:10', 'dekanfti', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bahasa`
--

CREATE TABLE `bahasa` (
  `id_bahasa` int(11) NOT NULL,
  `bahasa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahasa`
--

INSERT INTO `bahasa` (`id_bahasa`, `bahasa`) VALUES
(1, 'Indonesia'),
(2, 'Inggris');

-- --------------------------------------------------------

--
-- Table structure for table `baris`
--

CREATE TABLE `baris` (
  `id_baris` int(11) NOT NULL,
  `baris_name` varchar(50) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) DEFAULT NULL,
  `divisi_id` int(11) DEFAULT NULL,
  `lokasi_id` int(11) NOT NULL,
  `rak_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete_baris` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `baris`
--

INSERT INTO `baris` (`id_baris`, `baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `lokasi_id`, `rak_id`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_baris`, `deleted_by`, `deleted_at`) VALUES
(15, '1', 10, NULL, NULL, 40, 58, '2022-02-04 14:23:47', 'admin', '', NULL, 0, NULL, NULL),
(16, '2', 10, NULL, NULL, 40, 58, '2022-02-04 14:25:28', 'admin', '', NULL, 0, NULL, NULL),
(17, '3', 10, NULL, NULL, 40, 58, '2022-02-04 14:26:51', 'admin', '', NULL, 0, NULL, NULL),
(18, '1', 10, NULL, NULL, 40, 59, '2022-02-04 14:28:18', 'admin', '', NULL, 0, NULL, NULL),
(19, '2', 10, NULL, NULL, 40, 59, '2022-02-04 14:28:47', 'admin', '', NULL, 0, NULL, NULL),
(20, '3', 10, NULL, NULL, 40, 59, '2022-02-04 14:28:58', 'admin', '', NULL, 0, NULL, NULL),
(21, '1', 10, NULL, NULL, 40, 62, '2022-02-04 14:29:10', 'admin', '', NULL, 0, NULL, NULL),
(22, '2', 10, NULL, NULL, 40, 62, '2022-02-04 14:29:37', 'admin', 'admin', '2022-02-07 11:02:06', 0, NULL, NULL),
(23, '3', 10, NULL, NULL, 40, 62, '2022-02-04 14:29:52', 'admin', 'ridargustia', '2022-02-07 11:05:29', 0, NULL, NULL);

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
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete_box` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `id_cabang` int(11) NOT NULL,
  `cabang_name` varchar(250) DEFAULT NULL,
  `instansi_id` int(11) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete_cabang` tinyint(1) NOT NULL DEFAULT '0',
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
(53, 'FAKULTAS EKONOMI DAN BISNIS', 10, 'rektoruad', '2021-04-21 13:21:19', '', '2021-04-21 13:24:46', 0, NULL, NULL);

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
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` char(50) NOT NULL,
  `modified_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id_company`, `company_name`, `company_desc`, `company_address`, `company_maps`, `company_phone`, `company_phone2`, `company_fax`, `company_email`, `company_gmail`, `company_photo`, `company_photo_thumb`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 'EduArsip', '<p>EduArsip adalah Perusahaan yang bergerak dibidang pengelolaan arsip di Indonesia</p>', 'Graha PBMT Indonesia Lantai 2, Jl. Ring Road Bar. No.66, Baturan, Trihanggo, Kec. Gamping, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55291', '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63248.79889074844!2d110.31197864161997!3d-7.7845311706327145!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7a58865904a943%3A0xa0c11184a57f1f85!2sGraha%20PBMT%20Perhimpunan%20BMT%20Indonesia!5e0!3m2!1sen!2sid!4v1595374788862!5m2!1sen!2sid" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>\r\n', '08976843114', '081262215939', '-', 'info@eduarsip.id', 'joneduarsip@gmail.com', 'eduarsip20210116163119.png', 'eduarsip20210116163119_thumb.png', '', '2017-11-09 06:45:34', '', '2021-03-31 14:04:49');

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
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete_divisi` tinyint(1) NOT NULL DEFAULT '0',
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
(46, 'TEKNIK ELEKTRO', 'teknik-elektro', 10, 50, '2021-04-21 14:31:28', 'dekanfti', 'dekanfti', '2021-04-21 14:32:36', 0, NULL, NULL);

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
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete_instansi` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `instansi`
--

INSERT INTO `instansi` (`id_instansi`, `instansi_name`, `instansi_address`, `instansi_phone`, `instansi_img`, `instansi_img_thumb`, `is_active`, `active_date`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_instansi`, `deleted_by`, `deleted_at`) VALUES
(10, 'Universitas Ahmad Dahlan', 'Yogyakarta, Indonesia', '089625462588', '20210406105744.jpg', '20210406105744_thumb.jpg', 1, '2022-02-24', '2021-04-05 21:28:56', 'ridargustia', 'admin', '2022-01-25 13:13:01', 0, NULL, NULL),
(11, 'EduArsip', 'Yoyakarta', '08967653782', 'eduarsip20210223210201.jpg', 'eduarsip20210223210201_thumb.jpg', 1, '2021-04-19', '2021-04-19 13:24:01', 'ridargustia', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_arsip`
--

CREATE TABLE `jenis_arsip` (
  `id_jenis` int(11) NOT NULL,
  `jenis_name` varchar(100) NOT NULL,
  `jenis_slug` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete_jenis` tinyint(1) NOT NULL DEFAULT '0',
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
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log_queries`
--

CREATE TABLE `log_queries` (
  `id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(15) NOT NULL,
  `user_agent` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_queries`
--

INSERT INTO `log_queries` (`id`, `content`, `created_by`, `created_at`, `ip_address`, `user_agent`) VALUES
(1115, 'UPDATE `users` SET `password` = ''$2y$10$HOhYbQVwTYwe1aeACSAtGeafcqYarJ1h5p6pRaYce.CQBSNGNaTGe''\nWHERE `id_users` = ''51''', 'Ridar Gustia', '2022-01-25 10:13:19', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1116, 'UPDATE `users` SET `password` = ''$2y$10$/NFhDr8bI7faX3pQ/Ur.r.Y8k.TKokoq7HaVvbNm08/MLoNpjmmHu''\nWHERE `id_users` = ''54''', 'Ridar Gustia', '2022-01-25 10:14:10', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1117, 'UPDATE `users` SET `name` = ''Admin'', `birthdate` = '''', `birthplace` = '''', `gender` = ''1'', `address` = '''', `phone` = '''', `email` = ''admin@gmail.com'', `username` = ''admin'', `modified_by` = ''admin'', `photo` = ''admin20220125110318.png'', `photo_thumb` = ''admin20220125110318_thumb.png''\nWHERE `id_users` = ''51''', 'Admin', '2022-01-25 11:03:18', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1118, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (''Rosi Risprio M'', '''', '''', ''1'', '''', '''', ''rosi@gmail.com'', ''rosi'', ''$2y$10$Qs64.zUyRpoM7IHsJB/v8ukpWGA6vuTwaSd/QPn8MzlO2UirZXBFq'', ''10'', ''53'', ''44'', ''5'', ''6'', ''admin'', ''::1'')', 'Admin', '2022-01-25 11:22:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1119, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, ''1'')', 'Admin', '2022-01-25 11:22:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1120, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, ''2'')', 'Admin', '2022-01-25 11:22:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1121, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, ''3'')', 'Admin', '2022-01-25 11:22:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1122, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, ''4'')', 'Admin', '2022-01-25 11:22:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1123, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (57, ''5'')', 'Admin', '2022-01-25 11:22:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1124, 'UPDATE `users` SET `name` = ''Jeghison Riyadi'', `birthdate` = '''', `birthplace` = '''', `gender` = ''1'', `address` = '''', `phone` = '''', `email` = ''eghi@gmail.com'', `username` = ''eghi'', `instansi_id` = ''10'', `cabang_id` = ''50'', `divisi_id` = ''39'', `bagian_id` = ''1'', `usertype_id` = ''6'', `modified_by` = ''admin''\nWHERE `id_users` = ''54''', 'Admin', '2022-01-25 11:58:10', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1125, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''54'', ''1'')', 'Admin', '2022-01-25 11:58:10', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1126, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''54'', ''2'')', 'Admin', '2022-01-25 11:58:10', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1127, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''54'', ''3'')', 'Admin', '2022-01-25 11:58:10', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1128, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''54'', ''4'')', 'Admin', '2022-01-25 11:58:10', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1129, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''54'', ''5'')', 'Admin', '2022-01-25 11:58:10', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1130, 'UPDATE `instansi` SET `instansi_address` = ''Yogyakarta, Indonesia'', `instansi_phone` = ''089625462588'', `modified_by` = ''admin''\nWHERE `id_instansi` = ''10''', 'Admin', '2022-01-25 13:13:01', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1131, 'UPDATE `users` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-25 13:13:pm''\nWHERE `id_users` = ''57''', 'Admin', '2022-01-25 13:13:42', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1132, 'INSERT INTO `bagian` (`instansi_id`, `cabang_id`, `divisi_id`, `bagian_name`, `bagian_slug`, `created_by`) VALUES (''10'', ''53'', ''44'', ''Anggota'', ''anggota'', ''admin'')', 'Admin', '2022-01-25 13:17:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1133, 'UPDATE `bagian` SET `instansi_id` = ''10'', `cabang_id` = ''53'', `divisi_id` = ''44'', `bagian_name` = ''ANGGOTA'', `bagian_slug` = ''anggota'', `modified_by` = ''admin''\nWHERE `id_bagian` = ''36''', 'Admin', '2022-01-25 13:18:16', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1134, 'UPDATE `bagian` SET `is_delete_bagian` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-25 13:18:pm''\nWHERE `id_bagian` = ''36''', 'Admin', '2022-01-25 13:18:32', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1135, 'UPDATE `bagian` SET `is_delete_bagian` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_bagian` = ''36''', 'Admin', '2022-01-25 13:18:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1136, 'UPDATE `bagian` SET `is_delete_bagian` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-25 13:19:pm''\nWHERE `id_bagian` = ''36''', 'Admin', '2022-01-25 13:19:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1137, 'DELETE FROM `bagian`\nWHERE `id_bagian` = ''36''', 'Admin', '2022-01-25 13:21:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1138, 'INSERT INTO `divisi` (`instansi_id`, `cabang_id`, `divisi_name`, `divisi_slug`, `created_by`) VALUES (''10'', ''50'', ''TEKNOLOGI PANGAN'', ''teknologi-pangan'', ''admin'')', 'Admin', '2022-01-25 13:22:47', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1139, 'UPDATE `divisi` SET `is_delete_divisi` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-25 13:23:pm''\nWHERE `id_divisi` = ''63''', 'Admin', '2022-01-25 13:23:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1140, 'UPDATE `divisi` SET `is_delete_divisi` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_divisi` = ''63''', 'Admin', '2022-01-25 13:23:29', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1141, 'UPDATE `divisi` SET `is_delete_divisi` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-25 13:25:pm''\nWHERE `id_divisi` = ''63''', 'Admin', '2022-01-25 13:25:44', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1142, 'DELETE FROM `divisi`\nWHERE `id_divisi` = ''63''', 'Admin', '2022-01-25 13:25:54', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1143, 'INSERT INTO `cabang` (`cabang_name`, `instansi_id`, `created_by`) VALUES (''FAKULTAS KESEHATAN MASYARAKAT'', ''10'', ''admin'')', 'Admin', '2022-01-25 13:28:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1144, 'UPDATE `cabang` SET `cabang_name` = ''FAKULTAS KESEHATAN MASYARAKAT BRO'', `instansi_id` = ''10'', `modified_by` = ''admin''\nWHERE `id_cabang` = ''62''', 'Admin', '2022-01-25 13:28:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1145, 'UPDATE `cabang` SET `is_delete_cabang` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-25 13:29:pm''\nWHERE `id_cabang` = ''62''', 'Admin', '2022-01-25 13:29:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1146, 'UPDATE `cabang` SET `is_delete_cabang` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_cabang` = ''62''', 'Admin', '2022-01-25 13:29:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1147, 'UPDATE `cabang` SET `is_delete_cabang` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-25 13:29:pm''\nWHERE `id_cabang` = ''62''', 'Admin', '2022-01-25 13:29:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1148, 'DELETE FROM `cabang`\nWHERE `id_cabang` = ''62''', 'Admin', '2022-01-25 13:29:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1149, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''Ruang Baca'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-01-26 10:49:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1150, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `created_by`) VALUES (''Ruang Baca'', ''10'', ''admin'')', 'Admin', '2022-01-26 11:09:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1151, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `created_by`) VALUES (''Ruang Baca'', ''10'', ''admin'')', 'Admin', '2022-01-26 11:11:33', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1152, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''Perpustakaan'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-01-26 14:30:15', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1153, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-26 14:41:pm''\nWHERE `id_lokasi` = ''41''', 'Admin', '2022-01-26 14:41:24', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1154, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_lokasi` = ''41''', 'Admin', '2022-01-26 14:41:38', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1155, 'UPDATE `lokasi` SET `lokasi_name` = ''Perpustakaan 1'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_lokasi` = ''41''', 'Admin', '2022-01-26 14:48:42', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1156, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-26 14:48:pm''\nWHERE `id_lokasi` = ''41''', 'Admin', '2022-01-26 14:48:52', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1157, 'DELETE FROM `lokasi`\nWHERE `id_lokasi` = ''41''', 'Admin', '2022-01-26 14:49:13', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1158, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''11'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-01-26 15:14:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1159, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''1'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-01-26 15:17:32', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1160, 'INSERT INTO `baris` (`baris_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''3'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-01-26 15:49:50', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1161, 'UPDATE `baris` SET `baris_name` = ''2'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_baris` = ''22''', 'Admin', '2022-01-26 15:54:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1162, 'UPDATE `baris` SET `baris_name` = ''4'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_baris` = ''22''', 'Admin', '2022-01-26 15:54:54', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1163, 'UPDATE `baris` SET `is_delete_baris` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-26 15:55:pm''\nWHERE `id_baris` = ''22''', 'Admin', '2022-01-26 15:55:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1164, 'UPDATE `baris` SET `is_delete_baris` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_baris` = ''22''', 'Admin', '2022-01-26 15:56:12', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1165, 'UPDATE `baris` SET `is_delete_baris` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-26 15:56:pm''\nWHERE `id_baris` = ''22''', 'Admin', '2022-01-26 15:56:24', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1166, 'DELETE FROM `baris`\nWHERE `id_baris` = ''22''', 'Admin', '2022-01-26 15:56:33', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1167, 'DELETE FROM `baris`\nWHERE `id_baris` = ''6''', 'Admin', '2022-01-26 15:56:59', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1168, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''Ruang Baca 1'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-01-26 16:02:35', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1169, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-26 16:02:pm''\nWHERE `id_lokasi` = ''42''', 'Admin', '2022-01-26 16:02:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1170, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_lokasi` = ''42''', 'Admin', '2022-01-26 16:03:00', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1171, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-26 16:03:pm''\nWHERE `id_lokasi` = ''42''', 'Admin', '2022-01-26 16:03:59', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1172, 'DELETE FROM `lokasi`\nWHERE `id_lokasi` = ''42''', 'Admin', '2022-01-26 16:04:09', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1173, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-26 16:04:pm''\nWHERE `id_lokasi` = ''40''', 'Admin', '2022-01-26 16:04:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1174, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_lokasi` = ''40''', 'Admin', '2022-01-26 16:04:42', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1175, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-26 16:04:pm''\nWHERE `id_lokasi` = ''40''', 'Admin', '2022-01-26 16:04:53', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1176, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_lokasi` = ''40''', 'Admin', '2022-01-26 16:05:03', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1177, 'UPDATE `baris` SET `is_delete_baris` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-26 16:07:pm''\nWHERE `id_baris` = ''21''', 'Admin', '2022-01-26 16:07:18', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1178, 'UPDATE `baris` SET `is_delete_baris` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_baris` = ''21''', 'Admin', '2022-01-26 16:07:31', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1179, 'UPDATE `baris` SET `is_delete_baris` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-26 16:07:pm''\nWHERE `id_baris` = ''21''', 'Admin', '2022-01-26 16:07:40', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1180, 'DELETE FROM `baris`\nWHERE `id_baris` = ''21''', 'Admin', '2022-01-26 16:07:48', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1181, 'UPDATE `baris` SET `is_delete_baris` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-27 10:09:am''\nWHERE `id_baris` = ''13''', 'Admin', '2022-01-27 10:09:32', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1182, 'UPDATE `baris` SET `is_delete_baris` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_baris` = ''13''', 'Admin', '2022-01-27 10:10:27', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1183, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''satu'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-01-27 11:24:51', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1184, 'INSERT INTO `rak` (`rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''dua'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-01-27 11:31:06', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1185, 'UPDATE `rak` SET `rak_name` = ''duatiga'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_rak` = ''61''', 'Admin', '2022-01-27 11:32:50', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1186, 'UPDATE `rak` SET `is_delete_rak` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-27 11:33:am''\nWHERE `id_rak` = ''61''', 'Admin', '2022-01-27 11:33:06', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1187, 'UPDATE `rak` SET `is_delete_rak` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_rak` = ''61''', 'Admin', '2022-01-27 11:37:49', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1188, 'UPDATE `rak` SET `is_delete_rak` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-27 11:39:am''\nWHERE `id_rak` = ''61''', 'Admin', '2022-01-27 11:39:04', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1189, 'DELETE FROM `rak`\nWHERE `id_rak` = ''61''', 'Admin', '2022-01-27 11:39:18', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1190, 'DELETE FROM `rak`\nWHERE `id_rak` = ''55''', 'Admin', '2022-01-27 11:39:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1191, 'INSERT INTO `rak` (`rak_name`, `lokasi_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''tiga'', ''40'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-01-27 16:08:40', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1192, 'INSERT INTO `baris` (`baris_name`, `lokasi_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''3'', ''40'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-01-28 10:12:42', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1193, 'UPDATE `baris` SET `is_delete_baris` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-28 10:13:am''\nWHERE `id_baris` = ''21''', 'Admin', '2022-01-28 10:13:28', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1194, 'UPDATE `baris` SET `is_delete_baris` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_baris` = ''21''', 'Admin', '2022-01-28 10:13:41', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1195, 'UPDATE `baris` SET `is_delete_baris` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-01-28 10:13:am''\nWHERE `id_baris` = ''21''', 'Admin', '2022-01-28 10:13:52', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1196, 'DELETE FROM `baris`\nWHERE `id_baris` = ''21''', 'Admin', '2022-01-28 10:14:41', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1197, 'UPDATE `rak` SET `rak_name` = ''3'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_rak` = ''62''', 'Admin', '2022-01-28 10:30:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1198, 'UPDATE `rak` SET `rak_name` = ''1'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_rak` = ''60''', 'Admin', '2022-01-28 10:31:16', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1199, 'UPDATE `rak` SET `rak_name` = ''1'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_rak` = ''60''', 'Admin', '2022-01-28 10:35:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1200, 'UPDATE `rak` SET `rak_name` = ''1'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_rak` = ''60''', 'Admin', '2022-01-28 10:35:33', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1201, 'UPDATE `rak` SET `rak_name` = ''2'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_rak` = ''59''', 'Admin', '2022-01-28 10:35:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1202, 'UPDATE `rak` SET `rak_name` = ''1'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_rak` = ''58''', 'Admin', '2022-01-28 10:37:06', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1203, 'UPDATE `rak` SET `rak_name` = ''1'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_rak` = ''57''', 'Admin', '2022-01-28 10:37:22', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1204, 'UPDATE `rak` SET `rak_name` = ''1'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_rak` = ''56''', 'Admin', '2022-01-28 10:37:32', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1205, 'UPDATE `rak` SET `rak_name` = ''1'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_rak` = ''54''', 'Admin', '2022-01-28 10:37:40', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1206, 'UPDATE `baris` SET `baris_name` = ''2'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_baris` = ''13''', 'Admin', '2022-01-28 10:42:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1207, 'UPDATE `baris` SET `baris_name` = ''2'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_baris` = ''13''', 'Admin', '2022-01-28 10:43:35', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1208, 'UPDATE `baris` SET `baris_name` = ''2'', `lokasi_id` = ''33'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_baris` = ''13''', 'Admin', '2022-01-28 10:45:06', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1209, 'UPDATE `baris` SET `baris_name` = ''1'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_baris` = ''12''', 'Admin', '2022-01-28 10:45:51', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1210, 'UPDATE `baris` SET `baris_name` = ''1'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_baris` = ''11''', 'Admin', '2022-01-28 10:46:04', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1211, 'UPDATE `baris` SET `baris_name` = ''1'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_baris` = ''10''', 'Admin', '2022-01-28 10:46:13', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1212, 'UPDATE `baris` SET `baris_name` = ''1'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_baris` = ''1''', 'Admin', '2022-01-28 10:46:22', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'),
(1213, 'INSERT INTO `baris` (`baris_name`, `lokasi_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''1'', ''40'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-02-04 14:06:41', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1214, 'INSERT INTO `baris` (`baris_name`, `lokasi_id`, `rak_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''1'', ''40'', ''58'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-02-04 14:23:47', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1215, 'INSERT INTO `baris` (`baris_name`, `lokasi_id`, `rak_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''2'', ''40'', ''58'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-02-04 14:25:28', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1216, 'INSERT INTO `baris` (`baris_name`, `lokasi_id`, `rak_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''3'', ''40'', ''58'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-02-04 14:26:51', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1217, 'INSERT INTO `baris` (`baris_name`, `lokasi_id`, `rak_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''1'', ''40'', ''59'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-02-04 14:28:18', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1218, 'INSERT INTO `baris` (`baris_name`, `lokasi_id`, `rak_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''2'', ''40'', ''59'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-02-04 14:28:47', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1219, 'INSERT INTO `baris` (`baris_name`, `lokasi_id`, `rak_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''3'', ''40'', ''59'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-02-04 14:28:58', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1220, 'INSERT INTO `baris` (`baris_name`, `lokasi_id`, `rak_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''1'', ''40'', ''62'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-02-04 14:29:10', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1221, 'INSERT INTO `baris` (`baris_name`, `lokasi_id`, `rak_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''2'', ''40'', ''62'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-02-04 14:29:37', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1222, 'INSERT INTO `baris` (`baris_name`, `lokasi_id`, `rak_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''3'', ''40'', ''62'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-02-04 14:29:52', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1223, 'UPDATE `baris` SET `baris_name` = ''4'', `lokasi_id` = ''40'', `rak_id` = ''58'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_baris` = ''22''', 'Admin', '2022-02-07 11:01:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1224, 'UPDATE `baris` SET `baris_name` = ''2'', `lokasi_id` = ''40'', `rak_id` = ''62'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_baris` = ''22''', 'Admin', '2022-02-07 11:02:06', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1225, 'UPDATE `baris` SET `baris_name` = ''Tiga'', `lokasi_id` = ''40'', `rak_id` = ''62'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_baris` = ''23''', 'Admin', '2022-02-07 11:03:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1226, 'UPDATE `baris` SET `baris_name` = ''3'', `lokasi_id` = ''40'', `rak_id` = ''62'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''ridargustia''\nWHERE `id_baris` = ''23''', 'Ridar Gustia', '2022-02-07 11:05:29', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1227, 'UPDATE `baris` SET `baris_name` = ''3'', `lokasi_id` = ''40'', `rak_id` = ''62'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''ridargustia''\nWHERE `id_baris` = ''23''', 'Ridar Gustia', '2022-02-07 11:06:11', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1228, 'INSERT INTO `baris` (`baris_name`, `lokasi_id`, `rak_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''4'', ''40'', ''62'', ''10'', NULL, NULL, ''ridargustia'')', 'Ridar Gustia', '2022-02-07 11:41:29', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1229, 'UPDATE `baris` SET `is_delete_baris` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-07 11:46:am''\nWHERE `id_baris` = ''24''', 'Ridar Gustia', '2022-02-07 11:46:58', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1230, 'UPDATE `baris` SET `is_delete_baris` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_baris` = ''24''', 'Ridar Gustia', '2022-02-07 13:48:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1231, 'UPDATE `baris` SET `is_delete_baris` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-07 13:48:pm''\nWHERE `id_baris` = ''24''', 'Ridar Gustia', '2022-02-07 13:48:44', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1232, 'DELETE FROM `baris`\nWHERE `id_baris` = ''24''', 'Ridar Gustia', '2022-02-07 13:49:13', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1233, 'INSERT INTO `rak` (`rak_name`, `lokasi_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''4'', ''40'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-02-08 11:42:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1234, 'INSERT INTO `rak` (`rak_name`, `lokasi_id`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''5'', ''40'', ''10'', NULL, NULL, ''ridargustia'')', 'Ridar Gustia', '2022-02-08 11:44:26', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1235, 'UPDATE `rak` SET `rak_name` = ''Lima'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''admin''\nWHERE `id_rak` = ''64''', 'Admin', '2022-02-08 15:15:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1236, 'UPDATE `rak` SET `rak_name` = ''5'', `lokasi_id` = ''40'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''ridargustia''\nWHERE `id_rak` = ''64''', 'Ridar Gustia', '2022-02-08 15:16:19', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1237, 'UPDATE `rak` SET `is_delete_rak` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-02-08 15:52:pm''\nWHERE `id_rak` = ''63''', 'Admin', '2022-02-08 15:52:21', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1238, 'UPDATE `rak` SET `is_delete_rak` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_rak` = ''63''', 'Ridar Gustia', '2022-02-08 15:53:28', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1239, 'UPDATE `rak` SET `is_delete_rak` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-08 15:53:pm''\nWHERE `id_rak` = ''64''', 'Ridar Gustia', '2022-02-08 15:53:51', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1240, 'DELETE FROM `rak`\nWHERE `id_rak` = ''64''', 'Ridar Gustia', '2022-02-08 15:55:12', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1241, 'UPDATE `rak` SET `is_delete_rak` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-02-08 15:57:pm''\nWHERE `id_rak` = ''63''', 'Admin', '2022-02-08 15:57:27', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1242, 'UPDATE `rak` SET `is_delete_rak` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_rak` = ''63''', 'Admin', '2022-02-08 15:57:40', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1243, 'UPDATE `rak` SET `is_delete_rak` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-02-08 15:57:pm''\nWHERE `id_rak` = ''63''', 'Admin', '2022-02-08 15:57:48', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1244, 'DELETE FROM `rak`\nWHERE `id_rak` = ''63''', 'Admin', '2022-02-08 15:58:01', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1245, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''Ruang Baca 2'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-02-08 16:20:52', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1246, 'UPDATE `lokasi` SET `lokasi_name` = ''Ruang Baca dua'', `instansi_id` = ''10'', `cabang_id` = NULL, `divisi_id` = NULL, `modified_by` = ''ridargustia''\nWHERE `id_lokasi` = ''41''', 'Ridar Gustia', '2022-02-08 16:54:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1247, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-02-09 09:40:am''\nWHERE `id_lokasi` = ''41''', 'Admin', '2022-02-09 09:40:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1248, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_lokasi` = ''41''', 'Ridar Gustia', '2022-02-09 10:12:12', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1249, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-09 10:12:am''\nWHERE `id_lokasi` = ''41''', 'Ridar Gustia', '2022-02-09 10:12:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1250, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_lokasi` = ''41''', 'Ridar Gustia', '2022-02-09 10:12:58', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1251, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-02-09 10:17:am''\nWHERE `id_lokasi` = ''41''', 'Admin', '2022-02-09 10:17:00', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1252, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_lokasi` = ''41''', 'Admin', '2022-02-09 10:17:11', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1253, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-02-09 10:17:am''\nWHERE `id_lokasi` = ''41''', 'Admin', '2022-02-09 10:17:35', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1254, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_lokasi` = ''41''', 'Admin', '2022-02-09 10:19:53', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1255, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-02-09 10:20:am''\nWHERE `id_lokasi` = ''41''', 'Admin', '2022-02-09 10:20:04', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1256, 'DELETE FROM `lokasi`\nWHERE `id_lokasi` = ''41''', 'Admin', '2022-02-09 10:20:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1257, 'INSERT INTO `lokasi` (`lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_by`) VALUES (''Ruang Baca 2'', ''10'', NULL, NULL, ''admin'')', 'Admin', '2022-02-09 10:20:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1258, 'UPDATE `lokasi` SET `is_delete_lokasi` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-09 10:21:am''\nWHERE `id_lokasi` = ''42''', 'Ridar Gustia', '2022-02-09 10:21:22', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1259, 'DELETE FROM `lokasi`\nWHERE `id_lokasi` = ''42''', 'Ridar Gustia', '2022-02-09 10:23:06', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1260, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (''Admin 2'', ''11/01/1995'', ''Bantul'', ''1'', ''Sleman, Yogyakarta'', ''087293023844'', ''admin2@gmail.com'', ''admin2'', ''$2y$10$8LpMmqTXIhQCtSU3oVnUgeH5.YAn5cVIEVUa.v4l0QTJvoJy5UOMy'', ''10'', 1, ''admin'', ''::1'', ''admin220220209134719.jpg'', ''admin220220209134719_thumb.jpg'')', 'Admin', '2022-02-09 13:47:19', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1261, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, ''1'')', 'Admin', '2022-02-09 13:47:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1262, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, ''2'')', 'Admin', '2022-02-09 13:47:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1263, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, ''3'')', 'Admin', '2022-02-09 13:47:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1264, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, ''4'')', 'Admin', '2022-02-09 13:47:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1265, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (58, ''5'')', 'Admin', '2022-02-09 13:47:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1266, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `usertype_id`, `created_by`, `ip_add_reg`, `photo`, `photo_thumb`) VALUES (''Admin 2'', ''12/20/1995'', ''Sleman'', ''1'', ''Sleman, Yogyakarta'', ''085928377338'', ''admin2@gmail.com'', ''admin2'', ''$2y$10$QVA0a9pZ4DredMQfixP2P.8sCBo440ZKBdakRahPZ.F1/pED8f7Ta'', ''10'', 1, ''admin'', ''::1'', ''admin220220209135224.jpg'', ''admin220220209135224_thumb.jpg'')', 'Admin', '2022-02-09 13:52:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1267, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, ''1'')', 'Admin', '2022-02-09 13:52:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1268, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, ''2'')', 'Admin', '2022-02-09 13:52:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1269, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, ''3'')', 'Admin', '2022-02-09 13:52:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1270, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, ''4'')', 'Admin', '2022-02-09 13:52:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1271, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (59, ''5'')', 'Admin', '2022-02-09 13:52:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1272, 'INSERT INTO `users` (`name`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `instansi_id`, `usertype_id`, `created_by`, `ip_add_reg`) VALUES (''Admin 3'', '''', '''', ''1'', '''', '''', ''admin3@gmail.com'', ''admin3'', ''$2y$10$7qtD0n0khdHH5BiVzdFDDOjkwh1M9.1n7B7TWkrL.OktZZRtPWLxu'', ''10'', 1, ''admin'', ''::1'')', 'Admin', '2022-02-09 13:54:59', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1273, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (60, ''1'')', 'Admin', '2022-02-09 13:54:59', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1274, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (60, ''2'')', 'Admin', '2022-02-09 13:54:59', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1275, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (60, ''3'')', 'Admin', '2022-02-09 13:54:59', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1276, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (60, ''4'')', 'Admin', '2022-02-09 13:54:59', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1277, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (60, ''5'')', 'Admin', '2022-02-09 13:54:59', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'),
(1278, 'UPDATE `users` SET `is_delete` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-10 14:55:pm''\nWHERE `id_users` = ''60''', 'Ridar Gustia', '2022-02-10 14:55:26', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1279, 'UPDATE `users` SET `is_delete` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-10 15:41:pm''\nWHERE `id_users` = ''60''', 'Ridar Gustia', '2022-02-10 15:41:57', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1280, 'UPDATE `users` SET `is_delete` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-10 15:42:pm''\nWHERE `id_users` = ''60''', 'Ridar Gustia', '2022-02-10 15:42:19', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1281, 'UPDATE `users` SET `name` = ''Ridar Gustia'', `birthdate` = '''', `birthplace` = '''', `gender` = ''1'', `address` = '''', `phone` = ''089697641301'', `email` = ''ridargp@gmail.com'', `username` = ''ridargustia'', `modified_by` = ''ridargustia''\nWHERE `id_users` = ''56''', 'Ridar Gustia', '2022-02-11 10:06:42', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1282, 'UPDATE `users` SET `name` = ''Ridar Gustia'', `birthdate` = '''', `birthplace` = '''', `gender` = ''1'', `address` = '''', `phone` = ''089697641301'', `email` = ''ridargp@gmail.com'', `username` = ''ridargustia'', `modified_by` = ''ridargustia''\nWHERE `id_users` = ''56''', 'Ridar Gustia', '2022-02-11 10:06:59', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1283, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''119''', 'Ridar Gustia', '2022-02-11 10:32:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1284, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''120''', 'Ridar Gustia', '2022-02-11 10:33:57', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36');
INSERT INTO `log_queries` (`id`, `content`, `created_by`, `created_at`, `ip_address`, `user_agent`) VALUES
(1285, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''121''', 'Ridar Gustia', '2022-02-11 10:34:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1286, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''151''', 'Ridar Gustia', '2022-02-11 10:36:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1287, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''153''', 'Ridar Gustia', '2022-02-11 10:36:38', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1288, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''154''', 'Ridar Gustia', '2022-02-11 10:37:00', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1289, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''152''', 'Ridar Gustia', '2022-02-11 10:37:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1290, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''139''', 'Ridar Gustia', '2022-02-11 10:38:40', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1291, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''140''', 'Ridar Gustia', '2022-02-11 10:39:05', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1292, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''144''', 'Ridar Gustia', '2022-02-11 10:39:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1293, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''193''', 'Ridar Gustia', '2022-02-11 10:40:11', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1294, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''194''', 'Ridar Gustia', '2022-02-11 10:40:50', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1295, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''195''', 'Ridar Gustia', '2022-02-11 10:41:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1296, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''80''', 'Ridar Gustia', '2022-02-11 10:57:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1297, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''81''', 'Ridar Gustia', '2022-02-11 10:58:05', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1298, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''100''', 'Ridar Gustia', '2022-02-11 10:58:58', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1299, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''196''', 'Ridar Gustia', '2022-02-11 10:59:31', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1300, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''197''', 'Ridar Gustia', '2022-02-11 10:59:42', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1301, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''198''', 'Ridar Gustia', '2022-02-11 11:00:11', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1302, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''199''', 'Ridar Gustia', '2022-02-11 11:00:38', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1303, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''200''', 'Ridar Gustia', '2022-02-11 11:00:54', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1304, 'DELETE FROM `menu_access`\nWHERE `id_menu_access` = ''201''', 'Ridar Gustia', '2022-02-11 11:01:11', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1305, 'UPDATE `users` SET `name` = ''Admin Dua'', `birthdate` = ''12/20/1995'', `birthplace` = ''Sleman'', `gender` = ''1'', `address` = ''Sleman, Yogyakarta'', `phone` = ''085928377338'', `email` = ''admin2@gmail.com'', `username` = ''admin2'', `instansi_id` = ''10'', `usertype_id` = ''1'', `modified_by` = ''ridargustia''\nWHERE `id_users` = ''59''', 'Ridar Gustia', '2022-02-14 09:59:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1306, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''59'', ''1'')', 'Ridar Gustia', '2022-02-14 09:59:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1307, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''59'', ''2'')', 'Ridar Gustia', '2022-02-14 09:59:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1308, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''59'', ''3'')', 'Ridar Gustia', '2022-02-14 09:59:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1309, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''59'', ''4'')', 'Ridar Gustia', '2022-02-14 09:59:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1310, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''59'', ''5'')', 'Ridar Gustia', '2022-02-14 09:59:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1311, 'UPDATE `users` SET `name` = ''Admin 2'', `birthdate` = ''12/20/1995'', `birthplace` = ''Sleman'', `gender` = ''1'', `address` = ''Sleman, Yogyakarta'', `phone` = ''085928377338'', `email` = ''admin2@gmail.com'', `username` = ''admin2'', `instansi_id` = ''10'', `usertype_id` = ''1'', `modified_by` = ''ridargustia'', `photo` = ''admin220220214100007.jpg'', `photo_thumb` = ''admin220220214100007_thumb.jpg''\nWHERE `id_users` = ''59''', 'Ridar Gustia', '2022-02-14 10:00:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1312, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''59'', ''1'')', 'Ridar Gustia', '2022-02-14 10:00:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1313, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''59'', ''2'')', 'Ridar Gustia', '2022-02-14 10:00:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1314, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''59'', ''3'')', 'Ridar Gustia', '2022-02-14 10:00:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1315, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''59'', ''4'')', 'Ridar Gustia', '2022-02-14 10:00:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1316, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''59'', ''5'')', 'Ridar Gustia', '2022-02-14 10:00:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1317, 'UPDATE `users` SET `is_delete` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-14 10:00:am''\nWHERE `id_users` = ''59''', 'Ridar Gustia', '2022-02-14 10:00:26', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1318, 'UPDATE `users` SET `name` = ''Admin'', `birthdate` = ''02/16/1994'', `birthplace` = ''Yogyakarta'', `gender` = ''1'', `address` = ''Bantul, Yogyakarta'', `phone` = ''081722390264'', `email` = ''admin@gmail.com'', `username` = ''admin'', `instansi_id` = ''10'', `usertype_id` = ''1'', `modified_by` = ''ridargustia''\nWHERE `id_users` = ''51''', 'Ridar Gustia', '2022-02-14 10:01:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1319, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''51'', ''1'')', 'Ridar Gustia', '2022-02-14 10:01:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1320, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''51'', ''2'')', 'Ridar Gustia', '2022-02-14 10:01:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1321, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''51'', ''3'')', 'Ridar Gustia', '2022-02-14 10:01:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1322, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''51'', ''4'')', 'Ridar Gustia', '2022-02-14 10:01:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1323, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''51'', ''5'')', 'Ridar Gustia', '2022-02-14 10:01:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1324, 'UPDATE `users` SET `name` = ''Admin'', `birthdate` = ''02/16/1994'', `birthplace` = ''Yogyakarta'', `gender` = ''1'', `address` = ''Bantul, Yogyakarta'', `phone` = ''081722390264'', `email` = ''admin@gmail.com'', `username` = ''admin'', `instansi_id` = ''10'', `usertype_id` = ''1'', `modified_by` = ''ridargustia''\nWHERE `id_users` = ''51''', 'Ridar Gustia', '2022-02-14 10:01:54', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1325, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''51'', ''1'')', 'Ridar Gustia', '2022-02-14 10:01:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1326, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''51'', ''2'')', 'Ridar Gustia', '2022-02-14 10:01:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1327, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''51'', ''3'')', 'Ridar Gustia', '2022-02-14 10:01:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1328, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''51'', ''4'')', 'Ridar Gustia', '2022-02-14 10:01:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1329, 'INSERT INTO `users_data_access` (`user_id`, `data_access_id`) VALUES (''51'', ''5'')', 'Ridar Gustia', '2022-02-14 10:01:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1330, 'UPDATE `users` SET `is_delete` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-14 10:02:am''\nWHERE `id_users` = ''59''', 'Ridar Gustia', '2022-02-14 10:02:06', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1331, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `created_by`) VALUES (''10'', ''40'', ''58'', ''15'', ''A123'', ''Buku Test'', ''Saiful, Muhammad'', ''22'', ''1'', ''Testing'', ''Erlangga'', ''Jakarta'', ''2018'', ''Oleh Saiful, Muhammad. Terdiri dari 22 halaman berbahasa Indonesia tentang \\"Testing\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2018 dan kemudian menjadi koleksi perpustakaan sejak 16 February 2022'', ''1'', ''ridargustia'')', 'Ridar Gustia', '2022-02-16 11:58:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1332, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''15'', ''A23'', ''Buku Test 2'', ''Saiful, Muhammad'', ''12'', ''2'', ''Testing'', ''Erlangga'', ''Jakarta'', ''2020'', ''Oleh Saiful, Muhammad. Terdiri dari 12 halaman berbahasa Inggris tentang \\"Testing\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2020 dan kemudian menjadi koleksi perpustakaan sejak 16 February 2022'', ''1'', ''ridargustia'', ''buku-test-220220216120551.jpg'', ''buku-test-220220216120551_thumb.jpg'')', 'Ridar Gustia', '2022-02-16 12:05:54', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1333, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''17'', ''A123'', ''Buku Test'', ''Muhammad Saiful'', ''23'', ''1'', ''Testing Aplikasi'', ''Erlangga'', ''Jakarta'', ''2019'', ''Oleh Muhammad Saiful. Terdiri dari 23 halaman berbahasa Indonesia tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 16 February 2022'', ''1'', ''ridargustia'', ''buku-test20220216134338.jpeg'', ''buku-test20220216134338_thumb.jpeg'')', 'Ridar Gustia', '2022-02-16 13:43:39', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1334, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `created_by`) VALUES (''10'', ''40'', ''62'', ''21'', ''A321'', ''Buku Test 3'', ''Fulan dan Fulana'', ''10'', ''2'', ''Testing Aplikasi'', ''Erlangga'', ''Jakarta'', ''2019'', ''Oleh Fulan dan Fulana. Terdiri dari 10 halaman berbahasa Inggris tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 16 February 2022'', ''1'', ''ridargustia'')', 'Ridar Gustia', '2022-02-16 13:50:50', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1335, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `created_by`) VALUES (''10'', ''40'', ''59'', ''18'', ''A1234'', ''Buku Test 1'', ''Choirul'', ''23'', ''1'', ''Testing Aplikasi'', ''Erlangga'', ''Jakarta'', ''2019'', ''Oleh Choirul. Terdiri dari 23 halaman berbahasa Indonesia tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 16 February 2022'', ''1'', ''ridargustia'')', 'Ridar Gustia', '2022-02-16 17:04:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1336, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `created_by`) VALUES (''10'', ''40'', ''59'', ''18'', ''A4321'', ''Buku Test 4'', ''Choirul Anwar'', ''23'', ''2'', ''Testing Aplikasi'', ''Erlangga'', ''Jakarta'', ''2019'', ''Oleh Choirul Anwar. Terdiri dari 23 halaman berbahasa Inggris tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 16 February 2022'', ''1'', ''ridargustia'')', 'Ridar Gustia', '2022-02-16 17:08:47', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1337, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''15'', ''A12345'', ''Buku Testing'', ''Choirul Anwar'', ''23'', ''2'', ''Testing Aplikasi'', ''Erlangga'', ''Jakarta'', ''2019'', ''Oleh Choirul Anwar. Terdiri dari 23 halaman berbahasa Inggris tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 01 January 1970'', ''1'', ''ridargustia'', ''buku-testing20220218083324.jpg'', ''buku-testing20220218083324_thumb.jpg'')', 'Ridar Gustia', '2022-02-18 08:33:27', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1338, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''15'', ''AB1'', ''Buku Testing 2'', ''Fulan'', ''13'', ''2'', ''Testing Aplikasi'', ''Erlangga'', ''Jakarta'', ''2019'', ''Oleh Fulan. Terdiri dari 13 halaman berbahasa Inggris tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 18 February 2022'', ''1'', ''ridargustia'', ''buku-testing-220220218084215.jpg'', ''buku-testing-220220218084215_thumb.jpg'')', 'Ridar Gustia', '2022-02-18 08:42:15', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1339, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''16'', ''AB1233'', ''Buku Testing APK'', ''Ridar'', ''23'', ''1'', ''Testing Aplikasi'', ''Erlangga'', ''Yogyakarta'', ''2019'', ''Oleh Ridar. Terdiri dari 23 halaman berbahasa Indonesia tentang \\"Testing Aplikasi\\". Diterbitkan di Yogyakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 18 February 2022'', ''1'', ''ridargustia'', ''buku-testing-apk20220218143304.jpg'', ''buku-testing-apk20220218143304_thumb.jpg'')', 'Ridar Gustia', '2022-02-18 14:33:04', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1340, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''58'', `baris_id` = ''16'', `no_arsip` = ''AB1233'', `arsip_name` = ''Buku Testing APK'', `penulis_buku` = ''Ridar Gustia'', `jumlah_halaman` = ''50'', `bahasa_id` = ''2'', `tema_buku` = ''Testing Aplikasi Aplikasi Perpustakaan'', `penerbit` = ''Erlangga Indonesia'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2014'', `deskripsi_arsip` = ''Oleh Ridar Gustia. Terdiri dari 50 halaman berbahasa Inggris tentang \\"Testing Aplikasi Aplikasi Perpustakaan\\". Diterbitkan di Jakarta oleh Erlangga Indonesia pada tahun 2014 dan kemudian menjadi koleksi perpustakaan sejak 22 February 2022'', `modified_by` = ''ridargustia'', `cover_buku` = ''buku-testing-apk20220222143243.jpg'', `cover_buku_thumb` = ''buku-testing-apk20220222143243_thumb.jpg''\nWHERE `id_arsip` = ''9''', 'Ridar Gustia', '2022-02-22 14:32:44', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1341, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''62'', `baris_id` = ''23'', `no_arsip` = ''AB1233'', `arsip_name` = ''Buku Testing APK'', `penulis_buku` = ''Ridar Gustia'', `jumlah_halaman` = ''50'', `bahasa_id` = ''2'', `tema_buku` = ''Testing Aplikasi Aplikasi Perpustakaan'', `penerbit` = ''Erlangga Indonesia'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2014'', `deskripsi_arsip` = ''Oleh Ridar Gustia. Terdiri dari 50 halaman berbahasa Inggris tentang \\"Testing Aplikasi Aplikasi Perpustakaan\\". Diterbitkan di Jakarta oleh Erlangga Indonesia pada tahun 2014 dan kemudian menjadi koleksi perpustakaan sejak 30 April 2021'', `modified_by` = ''ridargustia''\nWHERE `id_arsip` = ''9''', 'Ridar Gustia', '2022-02-22 15:14:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1342, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''AB089'', `arsip_name` = ''Buku Testing App'', `penulis_buku` = ''Ridar GP'', `jumlah_halaman` = ''35'', `bahasa_id` = ''1'', `tema_buku` = ''Testing Aplikasi Aplikasi Ruang Baca'', `penerbit` = ''Erlangga'', `kota_penerbit` = ''Bandung'', `tahun_terbit` = ''2016'', `deskripsi_arsip` = ''Oleh Ridar GP. Terdiri dari 35 halaman berbahasa Indonesia tentang \\"Testing Aplikasi Aplikasi Ruang Baca\\". Diterbitkan di Bandung oleh Erlangga pada tahun 2016 dan kemudian menjadi koleksi perpustakaan sejak 27 January 2022'', `modified_by` = ''ridargustia'', `cover_buku` = ''buku-testing-app20220222151858.png'', `cover_buku_thumb` = ''buku-testing-app20220222151858_thumb.png''\nWHERE `id_arsip` = ''9''', 'Ridar Gustia', '2022-02-22 15:18:59', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1343, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''AB089'', `arsip_name` = ''Buku Testing App'', `penulis_buku` = ''Ridar GP'', `jumlah_halaman` = ''35'', `bahasa_id` = ''1'', `tema_buku` = ''Testing Aplikasi Aplikasi Ruang Baca'', `penerbit` = ''Erlangga'', `kota_penerbit` = ''Bandung'', `tahun_terbit` = ''2016'', `deskripsi_arsip` = ''Oleh Ridar GP. Terdiri dari 35 halaman berbahasa Indonesia tentang \\"Testing Aplikasi Aplikasi Ruang Baca\\". Diterbitkan di Bandung oleh Erlangga pada tahun 2016 dan kemudian menjadi koleksi perpustakaan sejak 18 February 2022'', `modified_by` = ''ridargustia''\nWHERE `id_arsip` = ''9''', 'Ridar Gustia', '2022-02-22 16:06:26', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1344, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''58'', `baris_id` = ''15'', `no_arsip` = ''AB1'', `arsip_name` = ''Buku Testing 2'', `penulis_buku` = ''Fulan'', `jumlah_halaman` = ''13'', `bahasa_id` = ''2'', `tema_buku` = ''Testing Aplikasi'', `penerbit` = ''Erlangga'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2019'', `deskripsi_arsip` = ''Oleh Fulan. Terdiri dari 13 halaman berbahasa Inggris tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 18 February 2022'', `modified_by` = ''ridargustia''\nWHERE `id_arsip` = ''8''', 'Ridar Gustia', '2022-02-22 16:08:29', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1345, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''58'', `baris_id` = ''15'', `no_arsip` = ''AB1'', `arsip_name` = ''Buku Testing 2'', `penulis_buku` = ''Fulan'', `jumlah_halaman` = ''13'', `bahasa_id` = ''2'', `tema_buku` = ''Testing Aplikasi'', `penerbit` = ''Erlangga'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2019'', `deskripsi_arsip` = ''Oleh Fulan. Terdiri dari 13 halaman berbahasa Inggris tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 18 February 2022'', `modified_by` = ''ridargustia''\nWHERE `id_arsip` = ''8''', 'Ridar Gustia', '2022-02-22 16:09:48', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36'),
(1346, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-24 20:55:pm''\nWHERE `id_arsip` = ''9''', 'Ridar Gustia', '2022-02-24 20:55:33', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1347, 'UPDATE `arsip` SET `is_delete` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = ''9''', 'Admin', '2022-02-24 22:18:04', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1348, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-02-24 22:18:pm''\nWHERE `id_arsip` = ''9''', 'Admin', '2022-02-24 22:18:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1349, 'UPDATE `arsip` SET `is_delete` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = ''9''', 'Admin', '2022-02-24 22:18:29', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1350, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-02-24 22:18:pm''\nWHERE `id_arsip` = ''9''', 'Admin', '2022-02-24 22:18:39', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1351, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''16'', ''T111'', ''Last Testing'', ''Ridar Gustia Priatama'', ''12'', ''1'', ''Testing Terakhir Aplikasi Perpustakaan'', ''Sinar Dunia'', ''Surabaya'', ''2014'', ''Oleh Ridar Gustia Priatama. Terdiri dari 12 halaman berbahasa Indonesia tentang \\"Testing Terakhir Aplikasi Perpustakaan\\". Diterbitkan di Surabaya oleh Sinar Dunia pada tahun 2014 dan kemudian menjadi koleksi perpustakaan sejak 25 February 2022'', ''1'', ''ridargustia'', ''last-testing20220225103325.jpeg'', ''last-testing20220225103325_thumb.jpeg'')', 'Ridar Gustia', '2022-02-25 10:33:26', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1352, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''62'', `baris_id` = ''21'', `no_arsip` = ''T111'', `arsip_name` = ''Last Testing Aplikasi'', `penulis_buku` = ''Ridar GP'', `jumlah_halaman` = ''22'', `bahasa_id` = ''2'', `tema_buku` = ''Testing Tambah Buku Terakhir Aplikasi Perpustakaan'', `penerbit` = ''Sinar Dunia Indonesia'', `kota_penerbit` = ''Surabaya'', `tahun_terbit` = ''2011'', `deskripsi_arsip` = ''Oleh Ridar GP. Terdiri dari 22 halaman berbahasa Inggris tentang \\"Testing Tambah Buku Terakhir Aplikasi Perpustakaan\\". Diterbitkan di Surabaya oleh Sinar Dunia Indonesia pada tahun 2011 dan kemudian menjadi koleksi perpustakaan sejak 25 February 2022'', `modified_by` = ''ridargustia'', `cover_buku` = ''last-testing-aplikasi20220225103835.jpg'', `cover_buku_thumb` = ''last-testing-aplikasi20220225103835_thumb.jpg''\nWHERE `id_arsip` = ''9''', 'Ridar Gustia', '2022-02-25 10:38:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1353, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-25 10:39:am''\nWHERE `id_arsip` = ''9''', 'Ridar Gustia', '2022-02-25 10:39:39', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1354, 'UPDATE `arsip` SET `is_delete` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = ''9''', 'Ridar Gustia', '2022-02-25 10:40:02', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1355, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-25 10:40:am''\nWHERE `id_arsip` = ''9''', 'Ridar Gustia', '2022-02-25 10:40:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1356, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-02-25 10:48:am''\nWHERE `id_arsip` = ''8''', 'Ridar Gustia', '2022-02-25 10:48:12', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1357, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''59'', ''20'', ''T222'', ''Last Testing Aplikasi'', ''Rosi RM'', ''86'', ''2'', ''Sembarang'', ''Sanubari'', ''Yogyakarta'', ''2019'', ''Oleh Rosi RM. Terdiri dari 86 halaman berbahasa Inggris tentang \\"Sembarang\\". Diterbitkan di Yogyakarta oleh Sanubari pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 25 February 2022'', ''1'', ''admin'', ''last-testing-aplikasi20220225105202.jpg'', ''last-testing-aplikasi20220225105202_thumb.jpg'')', 'Admin', '2022-02-25 10:52:04', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1358, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''62'', `baris_id` = ''21'', `no_arsip` = ''T222'', `arsip_name` = ''Last Testing Add Buku Aplikasi'', `penulis_buku` = ''Rosi Risprio'', `jumlah_halaman` = ''50'', `bahasa_id` = ''1'', `tema_buku` = ''Terserah kamu aja'', `penerbit` = ''Sanubari Indonesia'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2017'', `deskripsi_arsip` = ''Oleh Rosi Risprio. Terdiri dari 50 halaman berbahasa Indonesia tentang \\"Terserah kamu aja\\". Diterbitkan di Jakarta oleh Sanubari Indonesia pada tahun 2017 dan kemudian menjadi koleksi perpustakaan sejak 25 February 2022'', `modified_by` = ''admin'', `cover_buku` = ''last-testing-add-buku-aplikasi20220225105508.jpg'', `cover_buku_thumb` = ''last-testing-add-buku-aplikasi20220225105508_thumb.jpg''\nWHERE `id_arsip` = ''10''', 'Admin', '2022-02-25 10:55:09', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1359, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-02-25 10:55:am''\nWHERE `id_arsip` = ''10''', 'Admin', '2022-02-25 10:55:48', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1360, 'UPDATE `arsip` SET `is_delete` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_arsip` = ''10''', 'Admin', '2022-02-25 10:56:02', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1361, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-02-25 10:56:am''\nWHERE `id_arsip` = ''10''', 'Admin', '2022-02-25 10:56:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1362, 'INSERT INTO `menu` (`menu_name`, `menu_controller`, `menu_function`, `menu_icon`, `order_no`) VALUES (''ANGGOTA'', ''anggota'', ''#'', ''fa-users'', ''14'')', 'Ridar Gustia', '2022-02-26 10:46:39', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1363, 'INSERT INTO `submenu` (`menu_id`, `submenu_name`, `submenu_function`, `order_no`) VALUES (''18'', ''Tambah Anggota'', ''create'', ''1'')', 'Ridar Gustia', '2022-02-26 10:49:22', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1364, 'INSERT INTO `submenu` (`menu_id`, `submenu_name`, `submenu_function`, `order_no`) VALUES (''18'', ''Data Anggota'', ''index'', ''2'')', 'Ridar Gustia', '2022-02-26 10:50:31', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1365, 'INSERT INTO `submenu` (`menu_id`, `submenu_name`, `submenu_function`, `order_no`) VALUES (''18'', ''Recycle Bin'', ''deleted_list'', ''3'')', 'Ridar Gustia', '2022-02-26 10:51:49', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1366, 'INSERT INTO `anggota` (`no_induk`, `anggota_name`, `instansi_id`, `gender`, `angkatan`, `address`) VALUES (''1600018161'', ''Ridar Gustia'', ''10'', ''1'', ''2016'', ''Ketandan Wetan, Imogiri'')', 'Ridar Gustia', '2022-02-27 15:02:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1367, 'INSERT INTO `anggota` (`no_induk`, `anggota_name`, `instansi_id`, `gender`, `angkatan`, `address`) VALUES (''1600018162'', ''Gilang'', ''10'', ''1'', ''2016'', ''D2S'')', 'Admin', '2022-02-27 15:09:37', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1368, 'INSERT INTO `anggota` (`no_induk`, `anggota_name`, `instansi_id`, `gender`, `angkatan`, `address`) VALUES (''1600018163'', ''Denny'', ''11'', ''1'', ''2016'', ''Barongan'')', 'Ridar Gustia', '2022-02-27 15:12:05', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1369, 'INSERT INTO `anggota` (`no_induk`, `anggota_name`, `instansi_id`, `gender`, `angkatan`, `address`) VALUES (''1600018166'', ''Choirul Huda'', ''10'', ''1'', ''2016'', ''Jambi'')', 'Admin', '2022-03-01 11:27:48', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1370, 'INSERT INTO `anggota` (`no_induk`, `anggota_name`, `instansi_id`, `gender`, `angkatan`, `address`, `created_by`) VALUES (''1600018166'', ''Choirul Huda'', ''10'', ''1'', ''2016'', ''Jambi'', ''admin'')', 'Admin', '2022-03-01 11:32:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1371, 'UPDATE `anggota` SET `no_induk` = ''1600018162'', `anggota_name` = ''Gilang Herjun'', `instansi_id` = ''10'', `gender` = ''1'', `angkatan` = ''2016'', `address` = ''D2S, Imogiri, Bantul, Yogyakarta'', `modified_by` = ''ridargustia''\nWHERE `id_anggota` = ''2''', 'Ridar Gustia', '2022-03-01 16:26:22', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1372, 'UPDATE `anggota` SET `is_delete` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-02 09:29:am''\nWHERE `id_anggota` = ''5''', 'Ridar Gustia', '2022-03-02 09:29:41', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1373, 'DELETE FROM `anggota`\nWHERE `id_anggota` = ''5''', 'Ridar Gustia', '2022-03-02 10:16:06', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1374, 'UPDATE `anggota` SET `is_delete` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-02 10:16:am''\nWHERE `id_anggota` = ''3''', 'Ridar Gustia', '2022-03-02 10:16:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1375, 'DELETE FROM `anggota`\nWHERE `id_anggota` = ''3''', 'Ridar Gustia', '2022-03-02 10:18:12', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1376, 'UPDATE `anggota` SET `is_delete` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-02 10:26:am''\nWHERE `id_anggota` = ''2''', 'Ridar Gustia', '2022-03-02 10:26:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1377, 'UPDATE `anggota` SET `is_delete` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_anggota` = ''2''', 'Ridar Gustia', '2022-03-02 10:27:05', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'),
(1378, 'INSERT INTO `anggota` (`no_induk`, `anggota_name`, `instansi_id`, `gender`, `angkatan`, `address`, `created_by`) VALUES (''1600018163'', ''Denny'', ''11'', ''1'', ''2016'', ''Barongan'', ''ridargustia'')', 'Ridar Gustia', '2022-03-03 13:46:02', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1379, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `qty`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''15'', ''AB1234'', ''Testing'', ''Jeghison'', ''12'', ''1'', ''Testing Aplikasi Aplikasi Perpustakaan'', ''Sinar Dunia Indonesia'', ''Surabaya'', ''2011'', ''Oleh Jeghison. Terdiri dari 12 halaman berbahasa Indonesia tentang \\"Testing Aplikasi Aplikasi Perpustakaan\\". Diterbitkan di Surabaya oleh Sinar Dunia Indonesia pada tahun 2011 dan kemudian menjadi koleksi perpustakaan sejak 07 March 2022'', ''1'', ''12'', ''ridargustia'', ''testing20220307092534.jpg'', ''testing20220307092534_thumb.jpg'')', 'Ridar Gustia', '2022-03-07 09:25:37', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1380, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''58'', `baris_id` = ''15'', `no_arsip` = ''AB1234'', `arsip_name` = ''Testing'', `penulis_buku` = ''Jeghison'', `jumlah_halaman` = ''12'', `bahasa_id` = ''1'', `tema_buku` = ''Testing Aplikasi Aplikasi Perpustakaan'', `penerbit` = ''Sinar Dunia Indonesia'', `kota_penerbit` = ''Surabaya'', `tahun_terbit` = ''2011'', `deskripsi_arsip` = ''Oleh Jeghison. Terdiri dari 12 halaman berbahasa Indonesia tentang \\"Testing Aplikasi Aplikasi Perpustakaan\\". Diterbitkan di Surabaya oleh Sinar Dunia Indonesia pada tahun 2011 dan kemudian menjadi koleksi perpustakaan sejak 07 March 2022'', `qty` = ''10'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''8''', 'Admin', '2022-03-07 10:04:02', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1381, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''58'', `baris_id` = ''15'', `no_arsip` = ''A12345'', `arsip_name` = ''Buku Testing'', `penulis_buku` = ''Choirul Anwar'', `jumlah_halaman` = ''23'', `bahasa_id` = ''2'', `tema_buku` = ''Testing Aplikasi'', `penerbit` = ''Erlangga'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2019'', `deskripsi_arsip` = ''Oleh Choirul Anwar. Terdiri dari 23 halaman berbahasa Inggris tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 18 February 2022'', `qty` = ''5'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''7''', 'Admin', '2022-03-07 10:05:02', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1382, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''18'', `no_arsip` = ''A4321'', `arsip_name` = ''Buku Test 4'', `penulis_buku` = ''Choirul Anwar'', `jumlah_halaman` = ''23'', `bahasa_id` = ''2'', `tema_buku` = ''Testing Aplikasi'', `penerbit` = ''Erlangga'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2019'', `deskripsi_arsip` = ''Oleh Choirul Anwar. Terdiri dari 23 halaman berbahasa Inggris tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 16 February 2022'', `qty` = ''3'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''6''', 'Admin', '2022-03-07 10:05:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1383, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''18'', `no_arsip` = ''A1234'', `arsip_name` = ''Buku Test 1'', `penulis_buku` = ''Choirul'', `jumlah_halaman` = ''23'', `bahasa_id` = ''1'', `tema_buku` = ''Testing Aplikasi'', `penerbit` = ''Erlangga'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2019'', `deskripsi_arsip` = ''Oleh Choirul. Terdiri dari 23 halaman berbahasa Indonesia tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 16 February 2022'', `qty` = ''7'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''5''', 'Admin', '2022-03-07 10:05:37', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1384, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''62'', `baris_id` = ''21'', `no_arsip` = ''A321'', `arsip_name` = ''Buku Test 3'', `penulis_buku` = ''Fulan dan Fulana'', `jumlah_halaman` = ''10'', `bahasa_id` = ''2'', `tema_buku` = ''Testing Aplikasi'', `penerbit` = ''Erlangga'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2019'', `deskripsi_arsip` = ''Oleh Fulan dan Fulana. Terdiri dari 10 halaman berbahasa Inggris tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 16 February 2022'', `qty` = ''19'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''4''', 'Admin', '2022-03-07 10:05:56', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1385, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''58'', `baris_id` = ''15'', `no_arsip` = ''A23'', `arsip_name` = ''Buku Test 2'', `penulis_buku` = ''Saiful, Muhammad'', `jumlah_halaman` = ''12'', `bahasa_id` = ''2'', `tema_buku` = ''Testing'', `penerbit` = ''Erlangga'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2020'', `deskripsi_arsip` = ''Oleh Saiful, Muhammad. Terdiri dari 12 halaman berbahasa Inggris tentang \\"Testing\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2020 dan kemudian menjadi koleksi perpustakaan sejak 16 February 2022'', `qty` = ''7'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''2''', 'Admin', '2022-03-07 10:06:13', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1386, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-07'', ''2022-03-09'', ''6'', ''1'', ''10'', ''admin'')', 'Admin', '2022-03-07 12:05:57', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1387, 'UPDATE `arsip` SET `qty` = 2\nWHERE `id_arsip` = ''6''', 'Admin', '2022-03-07 12:05:57', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1388, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-07'', ''2022-03-09'', ''6'', ''1'', ''10'', ''admin'')', 'Admin', '2022-03-07 13:37:12', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1389, 'UPDATE `arsip` SET `qty` = 1\nWHERE `id_arsip` = ''6''', 'Admin', '2022-03-07 13:37:12', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1390, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-07'', ''2022-03-09'', ''8'', ''1'', ''10'', ''admin'')', 'Admin', '2022-03-07 13:45:05', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1391, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''8''', 'Admin', '2022-03-07 13:45:05', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1392, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `instansi_id`, `created_by`) VALUES (''2022-03-07'', ''2022-03-09'', ''8'', ''10'', ''admin'')', 'Admin', '2022-03-07 14:13:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1393, 'UPDATE `arsip` SET `qty` = 8\nWHERE `id_arsip` = ''8''', 'Admin', '2022-03-07 14:13:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1394, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-07'', ''2022-03-09'', ''8'', ''1'', ''10'', ''admin'')', 'Admin', '2022-03-07 14:30:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1395, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''8''', 'Admin', '2022-03-07 14:30:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1396, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-07'', ''2022-03-09'', ''8'', ''1'', ''10'', ''admin'')', 'Admin', '2022-03-07 14:38:58', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1397, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''8''', 'Admin', '2022-03-07 14:38:58', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1398, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-08'', ''2022-03-09'', ''8'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-08 09:48:13', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1399, 'UPDATE `arsip` SET `qty` = 5\nWHERE `id_arsip` = ''8''', 'Ridar Gustia', '2022-03-08 09:48:13', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1400, 'UPDATE `arsip` SET `qty` = 18\nWHERE `id_arsip` = ''4''', 'Ridar Gustia', '2022-03-09 10:57:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1401, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''8''', 'Ridar Gustia', '2022-03-09 10:57:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1402, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-03-08'', `tgl_kembali` = ''2022-03-09'', `anggota_id` = ''2'', `arsip_id` = ''4'', `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''3''', 'Ridar Gustia', '2022-03-09 10:57:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1403, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''5''', 'Ridar Gustia', '2022-03-09 11:48:26', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1404, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''8''', 'Ridar Gustia', '2022-03-09 11:48:26', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1405, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-03-09'', `tgl_kembali` = ''2022-03-18'', `anggota_id` = ''2'', `arsip_id` = ''5'', `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''2''', 'Ridar Gustia', '2022-03-09 11:48:26', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1406, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''3''', 'Ridar Gustia', '2022-03-09 12:49:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1407, 'UPDATE `arsip` SET `qty` = 19\nWHERE `id_arsip` = ''4''', 'Ridar Gustia', '2022-03-09 12:49:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36');
INSERT INTO `log_queries` (`id`, `content`, `created_by`, `created_at`, `ip_address`, `user_agent`) VALUES
(1408, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-09'', ''3'', ''4'', ''2'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-09 12:49:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1409, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''2''', 'Ridar Gustia', '2022-03-09 13:57:50', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1410, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''5''', 'Ridar Gustia', '2022-03-09 13:57:50', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1411, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-09'', ''2'', ''5'', ''2'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-09 13:57:50', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1412, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-09 15:03:pm''\nWHERE `id_peminjaman` = ''3''', 'Ridar Gustia', '2022-03-09 15:03:51', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1413, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_peminjaman` = ''3''', 'Ridar Gustia', '2022-03-09 15:55:09', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1414, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-09 15:56:pm''\nWHERE `id_peminjaman` = ''3''', 'Ridar Gustia', '2022-03-09 15:56:16', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1415, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = ''3''', 'Ridar Gustia', '2022-03-09 15:57:16', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1416, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-10'', ''2022-03-12'', ''8'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-10 15:58:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1417, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''8''', 'Ridar Gustia', '2022-03-10 15:58:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1418, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022/03/12'', ''3'', ''8'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-10 16:43:37', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1419, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''8''', 'Ridar Gustia', '2022-03-10 16:43:37', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1420, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''3''', 'Ridar Gustia', '2022-03-10 16:43:37', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1421, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-10'', ''2022-03-12'', ''8'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-10 16:46:09', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1422, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''8''', 'Ridar Gustia', '2022-03-10 16:46:09', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1423, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022/03/12'', ''4'', ''8'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-10 16:48:16', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1424, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''8''', 'Ridar Gustia', '2022-03-10 16:48:16', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1425, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''4''', 'Ridar Gustia', '2022-03-10 16:48:16', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1426, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-11'', ''2022-03-12'', ''8'', ''2'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-11 11:28:38', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1427, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''8''', 'Ridar Gustia', '2022-03-11 11:28:38', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1428, 'UPDATE `pengembalian` SET `tgl_kembali` = ''2022-03-09'', `arsip_id` = ''8'', `anggota_id` = ''2'', `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_pengembalian` = ''2''', 'Ridar Gustia', '2022-03-11 14:52:14', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1429, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''8''', 'Ridar Gustia', '2022-03-11 14:52:14', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1430, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''5''', 'Ridar Gustia', '2022-03-11 14:52:14', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1431, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''5''', 'Ridar Gustia', '2022-03-11 14:52:14', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1432, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-11'', ''2022-03-15'', ''4'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-11 14:56:18', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1433, 'UPDATE `arsip` SET `qty` = 19\nWHERE `id_arsip` = ''4''', 'Ridar Gustia', '2022-03-11 14:56:18', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1434, 'UPDATE `pengembalian` SET `tgl_kembali` = ''2022-03-09'', `arsip_id` = ''4'', `anggota_id` = ''1'', `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_pengembalian` = ''2''', 'Ridar Gustia', '2022-03-11 15:06:57', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1435, 'UPDATE `arsip` SET `qty` = 20\nWHERE `id_arsip` = ''4''', 'Ridar Gustia', '2022-03-11 15:06:57', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1436, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''8''', 'Ridar Gustia', '2022-03-11 15:06:57', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1437, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''6''', 'Ridar Gustia', '2022-03-11 15:06:57', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1438, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-11'', ''2022-03-14'', ''5'', ''2'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-11 15:54:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1439, 'UPDATE `arsip` SET `qty` = 5\nWHERE `id_arsip` = ''5''', 'Ridar Gustia', '2022-03-11 15:54:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1440, 'UPDATE `pengembalian` SET `tgl_kembali` = ''2022-03-09'', `arsip_id` = ''5'', `anggota_id` = ''2'', `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_pengembalian` = ''2''', 'Ridar Gustia', '2022-03-11 15:56:24', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1441, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''5''', 'Ridar Gustia', '2022-03-11 15:56:24', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1442, 'UPDATE `arsip` SET `qty` = 19\nWHERE `id_arsip` = ''4''', 'Ridar Gustia', '2022-03-11 15:56:24', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1443, 'UPDATE `peminjaman` SET `is_kembali` = ''0''\nWHERE `id_peminjaman` = ''2''', 'Ridar Gustia', '2022-03-11 15:56:24', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1444, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-11 15:58:pm''\nWHERE `id_peminjaman` = ''7''', 'Ridar Gustia', '2022-03-11 15:58:12', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1445, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-11 15:58:pm''\nWHERE `id_peminjaman` = ''6''', 'Ridar Gustia', '2022-03-11 15:58:18', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1446, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-11 15:58:pm''\nWHERE `id_peminjaman` = ''5''', 'Ridar Gustia', '2022-03-11 15:58:24', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1447, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-11 15:58:pm''\nWHERE `id_peminjaman` = ''4''', 'Ridar Gustia', '2022-03-11 15:58:33', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1448, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-11 15:58:pm''\nWHERE `id_pengembalian` = ''4''', 'Ridar Gustia', '2022-03-11 15:58:51', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1449, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-11 15:58:pm''\nWHERE `id_pengembalian` = ''3''', 'Ridar Gustia', '2022-03-11 15:58:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1450, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-11 15:59:pm''\nWHERE `id_peminjaman` = ''3''', 'Ridar Gustia', '2022-03-11 15:59:10', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1451, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-11 15:59:pm''\nWHERE `id_peminjaman` = ''2''', 'Ridar Gustia', '2022-03-11 15:59:14', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1452, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = ''2''', 'Ridar Gustia', '2022-03-11 16:00:06', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1453, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = ''3''', 'Ridar Gustia', '2022-03-11 16:00:11', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1454, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = ''4''', 'Ridar Gustia', '2022-03-11 16:00:16', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1455, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = ''5''', 'Ridar Gustia', '2022-03-11 16:00:21', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1456, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = ''6''', 'Ridar Gustia', '2022-03-11 16:00:31', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1457, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = ''7''', 'Ridar Gustia', '2022-03-11 16:00:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1458, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-11'', ''2022-03-13'', ''4'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-11 16:02:19', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1459, 'UPDATE `arsip` SET `qty` = 19\nWHERE `id_arsip` = ''4''', 'Ridar Gustia', '2022-03-11 16:02:19', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1460, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022/03/12'', ''8'', ''4'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-11 16:05:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1461, 'UPDATE `arsip` SET `qty` = 20\nWHERE `id_arsip` = ''4''', 'Ridar Gustia', '2022-03-11 16:05:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1462, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''8''', 'Ridar Gustia', '2022-03-11 16:05:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1463, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-11'', ''2022-03-14'', ''5'', ''2'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-11 16:06:48', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1464, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''5''', 'Ridar Gustia', '2022-03-11 16:06:48', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1465, 'UPDATE `pengembalian` SET `tgl_kembali` = ''2022-03-12'', `arsip_id` = ''5'', `anggota_id` = ''2'', `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_pengembalian` = ''5''', 'Ridar Gustia', '2022-03-11 16:10:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1466, 'UPDATE `arsip` SET `qty` = 8\nWHERE `id_arsip` = ''5''', 'Ridar Gustia', '2022-03-11 16:10:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1467, 'UPDATE `arsip` SET `qty` = 19\nWHERE `id_arsip` = ''4''', 'Ridar Gustia', '2022-03-11 16:10:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1468, 'UPDATE `peminjaman` SET `is_kembali` = ''0''\nWHERE `id_peminjaman` = ''8''', 'Ridar Gustia', '2022-03-11 16:10:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1469, 'UPDATE `pengembalian` SET `tgl_kembali` = ''2022-03-12'', `peminjaman_id` = ''8'', `arsip_id` = ''4'', `anggota_id` = ''1'', `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_pengembalian` = ''5''', 'Ridar Gustia', '2022-03-11 16:26:22', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1470, 'UPDATE `arsip` SET `qty` = 20\nWHERE `id_arsip` = ''4''', 'Ridar Gustia', '2022-03-11 16:26:22', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1471, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''5''', 'Ridar Gustia', '2022-03-11 16:26:22', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1472, 'UPDATE `peminjaman` SET `is_kembali` = ''0''\nWHERE `id_peminjaman` = ''8''', 'Ridar Gustia', '2022-03-11 16:26:22', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1473, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-11 16:29:pm''\nWHERE `id_peminjaman` = ''9''', 'Ridar Gustia', '2022-03-11 16:29:18', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1474, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-11 16:29:pm''\nWHERE `id_peminjaman` = ''8''', 'Ridar Gustia', '2022-03-11 16:29:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1475, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = ''8''', 'Ridar Gustia', '2022-03-11 16:29:32', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1476, 'DELETE FROM `peminjaman`\nWHERE `id_peminjaman` = ''9''', 'Ridar Gustia', '2022-03-11 16:29:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1477, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-11'', ''2022-03-16'', ''4'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-11 16:31:14', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1478, 'UPDATE `arsip` SET `qty` = 20\nWHERE `id_arsip` = ''4''', 'Ridar Gustia', '2022-03-11 16:31:14', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1479, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''10''', 'Ridar Gustia', '2022-03-11 16:31:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1480, 'UPDATE `arsip` SET `qty` = 21\nWHERE `id_arsip` = ''4''', 'Ridar Gustia', '2022-03-11 16:31:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1481, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-11'', ''10'', ''4'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-11 16:31:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1482, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-03-11'', ''2022-03-14'', ''5'', ''2'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-03-11 16:32:24', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1483, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''5''', 'Ridar Gustia', '2022-03-11 16:32:24', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1484, 'UPDATE `pengembalian` SET `tgl_kembali` = ''2022-03-11'', `peminjaman_id` = ''11'', `arsip_id` = ''5'', `anggota_id` = ''2'', `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_pengembalian` = ''6''', 'Ridar Gustia', '2022-03-11 16:34:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1485, 'UPDATE `arsip` SET `qty` = 8\nWHERE `id_arsip` = ''5''', 'Ridar Gustia', '2022-03-11 16:34:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1486, 'UPDATE `arsip` SET `qty` = 20\nWHERE `id_arsip` = ''4''', 'Ridar Gustia', '2022-03-11 16:34:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1487, 'UPDATE `peminjaman` SET `is_kembali` = ''0''\nWHERE `id_peminjaman` = ''10''', 'Ridar Gustia', '2022-03-11 16:34:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1488, 'UPDATE `pengembalian` SET `tgl_kembali` = ''2022-03-11'', `peminjaman_id` = ''10'', `arsip_id` = ''4'', `anggota_id` = ''1'', `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_pengembalian` = ''6''', 'Ridar Gustia', '2022-03-11 16:37:29', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1489, 'UPDATE `arsip` SET `qty` = 21\nWHERE `id_arsip` = ''4''', 'Ridar Gustia', '2022-03-11 16:37:29', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1490, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''5''', 'Ridar Gustia', '2022-03-11 16:37:29', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1491, 'UPDATE `peminjaman` SET `is_kembali` = ''0''\nWHERE `id_peminjaman` = ''11''', 'Ridar Gustia', '2022-03-11 16:37:29', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1492, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-12 20:03:pm''\nWHERE `id_pengembalian` = ''6''', 'Ridar Gustia', '2022-03-12 20:03:48', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1493, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = ''0'', `deleted_by` = NULL, `deleted_at` = NULL\nWHERE `id_pengembalian` = ''6''', 'Ridar Gustia', '2022-03-12 20:04:03', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1494, 'UPDATE `pengembalian` SET `is_delete_pengembalian` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-03-12 20:04:pm''\nWHERE `id_pengembalian` = ''6''', 'Ridar Gustia', '2022-03-12 20:04:21', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1495, 'DELETE FROM `pengembalian`\nWHERE `id_pengembalian` = ''6''', 'Ridar Gustia', '2022-03-12 20:04:38', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1496, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-15 16:01:pm''\nWHERE `id_arsip` = ''8''', 'Admin', '2022-03-15 16:01:50', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1497, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-15 16:02:pm''\nWHERE `id_arsip` = ''7''', 'Admin', '2022-03-15 16:02:03', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1498, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-15 16:02:pm''\nWHERE `id_arsip` = ''6''', 'Admin', '2022-03-15 16:02:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1499, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-15 16:02:pm''\nWHERE `id_arsip` = ''5''', 'Admin', '2022-03-15 16:02:12', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1500, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-15 16:02:pm''\nWHERE `id_arsip` = ''4''', 'Admin', '2022-03-15 16:02:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1501, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-15 16:02:pm''\nWHERE `id_arsip` = ''3''', 'Admin', '2022-03-15 16:02:22', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1502, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-15 16:02:pm''\nWHERE `id_arsip` = ''2''', 'Admin', '2022-03-15 16:02:28', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1503, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `qty`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''15'', ''sr 273.2'', ''Teknologi Pembelajaran'', ''Deni Darmawan'', ''221'', ''1'', ''teknologi pendidikan'', ''Erlangga Indonesia'', ''Jakarta'', ''2008'', ''Oleh Deni Darmawan. Terdiri dari 221 halaman berbahasa Indonesia tentang \\"teknologi pendidikan\\". Diterbitkan di Jakarta oleh Erlangga Indonesia pada tahun 2008 dan kemudian menjadi koleksi perpustakaan sejak 15 March 2022'', ''1'', ''10'', ''admin'', ''teknologi-pembelajaran20220315162346.jpg'', ''teknologi-pembelajaran20220315162346_thumb.jpg'')', 'Admin', '2022-03-15 16:23:48', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1504, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `qty`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''15'', ''SR 123.22 GUS t'', ''Teknologi Pendidikan'', ''Ridar Gustia'', ''211'', ''1'', ''teknologi pendidikan'', ''Sanubari Indonesia'', ''Jakarta'', ''2005'', ''Oleh Ridar Gustia. Terdiri dari 211 halaman berbahasa Indonesia tentang \\"teknologi pendidikan\\". Diterbitkan di Jakarta oleh Sanubari Indonesia pada tahun 2005 dan kemudian menjadi koleksi perpustakaan sejak 15 March 2022'', ''1'', ''24'', ''admin'', ''teknologi-pendidikan20220315204320.jpg'', ''teknologi-pendidikan20220315204320_thumb.jpg'')', 'Admin', '2022-03-15 20:43:21', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1505, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-15 20:58:pm''\nWHERE `id_arsip` = ''9''', 'Admin', '2022-03-15 20:58:03', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1506, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `qty`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''16'', ''SR 173.3 SUP s'', ''sdfsdfsd'', ''Agus Supanto'', ''322'', ''1'', ''teknologi pendidikan'', ''Graha Ilmu'', ''Jakarta'', ''2009'', ''Oleh Agus Supanto. Terdiri dari 322 halaman berbahasa Indonesia tentang \\"teknologi pendidikan\\". Diterbitkan di Jakarta oleh Graha Ilmu pada tahun 2009 dan kemudian menjadi koleksi perpustakaan sejak 15 March 2022'', ''1'', ''10'', ''admin'', ''sdfsdfsd20220315215832.jpg'', ''sdfsdfsd20220315215832_thumb.jpg'')', 'Admin', '2022-03-15 21:58:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1507, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `qty`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''16'', ''SR 371.3 SET s'', ''sasffgdfg'', ''Denny Setyanto'', ''194'', ''1'', ''teknologi pendidikan - metode'', ''Graha Ilmu'', ''Yogyakarta'', ''2012'', ''Oleh Denny Setyanto. Terdiri dari 194 halaman berbahasa Indonesia tentang \\"teknologi pendidikan - metode\\". Diterbitkan di Yogyakarta oleh Graha Ilmu pada tahun 2012 dan kemudian menjadi koleksi perpustakaan sejak 15 March 2022'', ''1'', ''20'', ''admin'', ''sasffgdfg20220315221739.jpg'', ''sasffgdfg20220315221739_thumb.jpg'')', 'Admin', '2022-03-15 22:17:42', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1508, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `qty`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''15'', ''SR 620.001 WIN t'', ''Teknologi Dan Masyarakat: (pemikiran Pemikiran Seorang Teknologi)'', ''Gilang Herjun Winarta'', ''174'', ''1'', ''teknologi pendidikan - metode'', ''Graha Ilmu'', ''Yogyakarta'', ''2012'', ''Oleh Gilang Herjun Winarta. Terdiri dari 174 halaman berbahasa Indonesia tentang \\"teknologi pendidikan - metode\\". Diterbitkan di Yogyakarta oleh Graha Ilmu pada tahun 2012 dan kemudian menjadi koleksi perpustakaan sejak 15 March 2022'', ''1'', ''20'', ''admin'', ''teknologi-dan-masyarakat-pemikiran-pemikiran-seorang-teknologi20220315224757.jpg'', ''teknologi-dan-masyarakat-pemikiran-pemikiran-seorang-teknologi20220315224757_thumb.jpg'')', 'Admin', '2022-03-15 22:48:00', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1509, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `qty`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''59'', ''18'', ''RF 499.222 3 WIR c'', ''Candakaranika Adiparwa Kamus Bahasa Jawa Kuna - Indonesia'', ''Sucipto Wiryosuparto'', ''66'', ''1'', ''kamus bahasa jawa kuno - indonesia'', ''Indira'', ''Jakarta'', ''2008'', ''Oleh Sucipto Wiryosuparto. Terdiri dari 66 halaman berbahasa Indonesia tentang \\"kamus bahasa jawa kuno - indonesia\\". Diterbitkan di Jakarta oleh Indira pada tahun 2008 dan kemudian menjadi koleksi perpustakaan sejak 15 March 2022'', ''1'', ''17'', ''admin'', ''candakaranika-adiparwa-kamus-bahasa-jawa-kuna-indonesia20220315230357.jpg'', ''candakaranika-adiparwa-kamus-bahasa-jawa-kuna-indonesia20220315230357_thumb.jpg'')', 'Admin', '2022-03-15 23:03:57', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1510, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `qty`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''16'', ''SR 378.3 BES t'', ''Teknologi Di Nusantara: Empatpuluh Abad Hambatan Inovasi'', ''M. Sahari Besari'', ''229'', ''1'', ''teknologi pendidikan islam'', ''Graha Ilmu'', ''Yogyakarta'', ''2012'', ''Oleh M. Sahari Besari. Terdiri dari 229 halaman berbahasa Indonesia tentang \\"teknologi pendidikan islam\\". Diterbitkan di Yogyakarta oleh Graha Ilmu pada tahun 2012 dan kemudian menjadi koleksi perpustakaan sejak 16 March 2022'', ''1'', ''15'', ''admin'', ''teknologi-di-nusantara-empatpuluh-abad-hambatan-inovasi20220316103829.jpg'', ''teknologi-di-nusantara-empatpuluh-abad-hambatan-inovasi20220316103829_thumb.jpg'')', 'Admin', '2022-03-16 10:38:29', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1511, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''58'', `baris_id` = ''16'', `no_arsip` = ''SR 378.3 BES t'', `arsip_name` = ''Teknologi Di Nusantara: Empatpuluh Abad Hambatan Inovasi'', `penulis_buku` = ''M. Sahari Besari'', `jumlah_halaman` = ''229'', `bahasa_id` = ''1'', `tema_buku` = ''teknologi pendidikan islam'', `penerbit` = ''Graha Ilmu'', `kota_penerbit` = ''Yogyakarta'', `tahun_terbit` = ''2012'', `deskripsi_arsip` = ''Oleh M. Sahari Besari. Terdiri dari 229 halaman berbahasa Indonesia tentang \\"teknologi pendidikan islam\\". Diterbitkan di Yogyakarta oleh Graha Ilmu pada tahun 2012 dan kemudian menjadi koleksi perpustakaan sejak 16 March 2022'', `qty` = ''15'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''15''', 'Admin', '2022-03-16 13:04:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1512, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''58'', `baris_id` = ''16'', `no_arsip` = ''SR 378.3 WIN n'', `arsip_name` = ''Nusantara: Empatpuluh Abad Hambatan Inovasi'', `penulis_buku` = ''Gilang Herjun Winarta'', `jumlah_halaman` = ''229'', `bahasa_id` = ''1'', `tema_buku` = ''teknologi pendidikan islam'', `penerbit` = ''Graha Ilmu'', `kota_penerbit` = ''Yogyakarta'', `tahun_terbit` = ''2012'', `deskripsi_arsip` = ''Oleh Gilang Herjun Winarta. Terdiri dari 229 halaman berbahasa Indonesia tentang \\"teknologi pendidikan islam\\". Diterbitkan di Yogyakarta oleh Graha Ilmu pada tahun 2012 dan kemudian menjadi koleksi perpustakaan sejak 16 March 2022'', `qty` = ''15'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''15''', 'Admin', '2022-03-16 13:07:05', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1513, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-16 13:21:pm''\nWHERE `id_arsip` = ''10''', 'Admin', '2022-03-16 13:21:03', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1514, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-16 13:21:pm''\nWHERE `id_arsip` = ''11''', 'Admin', '2022-03-16 13:21:09', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1515, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-16 13:21:pm''\nWHERE `id_arsip` = ''12''', 'Admin', '2022-03-16 13:21:15', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1516, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-16 13:21:pm''\nWHERE `id_arsip` = ''13''', 'Admin', '2022-03-16 13:21:21', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1517, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-16 13:21:pm''\nWHERE `id_arsip` = ''14''', 'Admin', '2022-03-16 13:21:26', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1518, 'UPDATE `arsip` SET `is_delete` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-03-16 13:21:pm''\nWHERE `id_arsip` = ''15''', 'Admin', '2022-03-16 13:21:33', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1519, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `qty`, `created_by`) VALUES (''10'', ''40'', ''58'', ''16'', ''SR 664.7 SUP t'', ''Teknologi Cokelat'', ''Haryadi dan Supriyanto'', ''283'', ''1'', ''teknologi cokelat'', ''Gadjah Mada University Press'', ''Yogyakarta'', ''2012'', ''Oleh Haryadi dan Supriyanto. Terdiri dari 283 halaman berbahasa Indonesia tentang \\"teknologi cokelat\\". Diterbitkan di Yogyakarta oleh Gadjah Mada University Press pada tahun 2012 dan kemudian menjadi koleksi perpustakaan sejak 16 March 2022'', ''1'', ''3'', ''admin'')', 'Admin', '2022-03-16 13:38:58', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1520, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''58'', `baris_id` = ''16'', `no_arsip` = ''SR 664.7 HAR t'', `arsip_name` = ''Teknologi Cokelat'', `penulis_buku` = ''Haryadi'', `jumlah_halaman` = ''283'', `bahasa_id` = ''1'', `tema_buku` = ''teknologi cokelat'', `penerbit` = ''Gadjah Mada University Press'', `kota_penerbit` = ''Yogyakarta'', `tahun_terbit` = ''2012'', `deskripsi_arsip` = ''Oleh Haryadi. Terdiri dari 283 halaman berbahasa Indonesia tentang \\"teknologi cokelat\\". Diterbitkan di Yogyakarta oleh Gadjah Mada University Press pada tahun 2012 dan kemudian menjadi koleksi perpustakaan sejak 16 March 2022'', `qty` = ''3'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''16''', 'Admin', '2022-03-16 13:39:39', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1521, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `qty`, `created_by`) VALUES (''10'', ''40'', ''58'', ''16'', ''SR 283.2 SUP a'', ''Agama Islam'', ''Agus Supanto'', ''27'', ''1'', ''Pendidikan Agama Islam'', ''Graha Ilmu'', ''Yogyakarta'', ''2020'', ''Oleh Agus Supanto. Terdiri dari 27 halaman berbahasa Indonesia tentang \\"Pendidikan Agama Islam\\". Diterbitkan di Yogyakarta oleh Graha Ilmu pada tahun 2020 dan kemudian menjadi koleksi perpustakaan sejak 16 March 2022'', ''1'', ''12'', ''admin'')', 'Admin', '2022-03-16 13:53:21', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1522, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `qty`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''58'', ''16'', ''SR 278.3 DAR t'', ''Teknologi Pembelajaran'', ''Deni Darmawan'', ''45'', ''1'', ''teknologi pendidikan - metode'', ''Indira'', ''Yogyakarta'', ''2020'', ''Oleh Deni Darmawan. Terdiri dari 45 halaman berbahasa Indonesia tentang \\"teknologi pendidikan - metode\\". Diterbitkan di Yogyakarta oleh Indira pada tahun 2020 dan kemudian menjadi koleksi perpustakaan sejak 16 March 2022'', ''1'', ''10'', ''admin'', ''teknologi-pembelajaran20220316145445.jpg'', ''teknologi-pembelajaran20220316145445_thumb.jpg'')', 'Admin', '2022-03-16 14:54:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1523, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `qty`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''59'', ''19'', ''SR 672.3 RIY t'', ''Teknologi Informasi Pendidikan: Membahas Materi Dasar Teknologi Informasi Yang Wajib Dikuasai Pemula TI'', ''Lantip Diat Prasojo dan Riyanto'', ''78'', ''1'', ''teknologi pendidikan'', ''Graha Ilmu'', ''Jakarta'', ''2019'', ''Oleh Lantip Diat Prasojo dan Riyanto. Terdiri dari 78 halaman berbahasa Indonesia tentang \\"teknologi pendidikan\\". Diterbitkan di Jakarta oleh Graha Ilmu pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 16 March 2022'', ''1'', ''15'', ''admin'', ''teknologi-informasi-pendidikan-membahas-materi-dasar-teknologi-informasi-yang-wajib-dikuasai-pemula-ti20220316145736.jpg'', ''teknologi-informasi-pendidikan-membahas-materi-dasar-teknologi-informasi-yang-wajib-dikuasai-pemula-ti20220316145736_thumb.jpg'')', 'Admin', '2022-03-16 14:57:38', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1524, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `qty`, `created_by`, `cover_buku`, `cover_buku_thumb`) VALUES (''10'', ''40'', ''59'', ''19'', ''SR 263.2 AYU t'', ''Teknologi Pangan : Teori Praktis Dan Aplikasi'', ''Fitriyono Ayustaningwarno'', ''67'', ''1'', ''teknologi pendidikan - metode'', ''Graha Ilmu'', ''Jakarta'', ''2014'', ''Oleh Fitriyono Ayustaningwarno. Terdiri dari 67 halaman berbahasa Indonesia tentang \\"teknologi pendidikan - metode\\". Diterbitkan di Jakarta oleh Graha Ilmu pada tahun 2014 dan kemudian menjadi koleksi perpustakaan sejak 16 March 2022'', ''1'', ''7'', ''admin'', ''teknologi-pangan-teori-praktis-dan-aplikasi20220316150215.jpg'', ''teknologi-pangan-teori-praktis-dan-aplikasi20220316150215_thumb.jpg'')', 'Admin', '2022-03-16 15:02:15', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36'),
(1525, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `status_file`, `qty`, `created_by`) VALUES (''10'', ''40'', ''58'', ''16'', ''SR 267.22 GUS t'', ''Testing Book'', ''Ridar Gustia'', ''34'', ''1'', ''Testing Aplikasi'', ''Graha Ilmu'', ''Jakarta'', ''2019'', ''Oleh Ridar Gustia. Terdiri dari 34 halaman berbahasa Indonesia tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Graha Ilmu pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 23 March 2022'', ''1'', ''0'', ''15'', ''admin'')', 'Admin', '2022-03-23 20:45:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36'),
(1526, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''58'', `baris_id` = ''16'', `no_arsip` = ''SR 267.22 GUS t'', `arsip_name` = ''Testing Book'', `penulis_buku` = ''Ridar Gustia'', `jumlah_halaman` = ''34'', `bahasa_id` = ''1'', `tema_buku` = ''Testing Aplikasi'', `penerbit` = ''Graha Ilmu'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2019'', `deskripsi_arsip` = ''Oleh Ridar Gustia. Terdiri dari 34 halaman berbahasa Indonesia tentang \\"Testing Aplikasi\\". Diterbitkan di Jakarta oleh Graha Ilmu pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 23 March 2022'', `status_file` = ''1'', `qty` = ''15'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''21''', 'Admin', '2022-03-23 20:55:11', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36'),
(1527, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''SR 672.3 RIY t'', `arsip_name` = ''Teknologi Informasi Pendidikan: Membahas Materi Dasar Teknologi Informasi Yang Wajib Dikuasai Pemula TI'', `penulis_buku` = ''Lantip Diat Prasojo dan Riyanto'', `jumlah_halaman` = ''78'', `bahasa_id` = ''1'', `tema_buku` = ''teknologi pendidikan'', `penerbit` = ''Graha Ilmu'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2019'', `deskripsi_arsip` = ''Oleh Lantip Diat Prasojo dan Riyanto. Terdiri dari 78 halaman berbahasa Indonesia tentang \\"teknologi pendidikan\\". Diterbitkan di Jakarta oleh Graha Ilmu pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 16 March 2022'', `status_file` = ''0'', `qty` = ''15'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''19''', 'Admin', '2022-03-23 21:42:24', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36'),
(1528, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `status_file`, `qty`, `created_by`) VALUES (''10'', ''40'', ''59'', ''19'', ''SR 738.29 WIN t'', ''Testing Book Satu'', ''Gilang Herjun Winarta'', ''98'', ''1'', ''Testing Aplikasi Aplikasi Perpustakaan'', ''Erlangga'', ''Jakarta'', ''2019'', ''Oleh Gilang Herjun Winarta. Terdiri dari 98 halaman berbahasa Indonesia tentang \\"Testing Aplikasi Aplikasi Perpustakaan\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', ''1'', ''0'', ''10'', ''admin'')', 'Admin', '2022-03-24 15:57:32', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36'),
(1529, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `status_file`, `qty`, `created_by`) VALUES (''10'', ''40'', ''59'', ''19'', ''SR 738.93 SET s'', ''Soal Ujian Akhir Sekolah'', ''Deny Setyanto dan Jeghison Riyadi'', ''20'', ''1'', ''teknologi pendidikan - metode'', ''Pustaka Ilmu'', ''Surabaya'', ''2009'', ''Oleh Deny Setyanto dan Jeghison Riyadi. Terdiri dari 20 halaman berbahasa Indonesia tentang \\"teknologi pendidikan - metode\\". Diterbitkan di Surabaya oleh Pustaka Ilmu pada tahun 2009 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', ''1'', ''0'', ''7'', ''admin'')', 'Admin', '2022-03-24 16:04:06', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36'),
(1530, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `status_file`, `qty`, `created_by`) VALUES (''10'', ''40'', ''59'', ''19'', ''PS 2873.49 PRI f'', ''Filsafat'', ''Ridar Gustia Priatama dkk.'', ''56'', ''2'', ''Testing Aplikasi'', ''Graha Ilmu'', ''Surabaya'', ''2019'', ''Oleh Ridar Gustia Priatama dkk.. Terdiri dari 56 halaman berbahasa Inggris tentang \\"Testing Aplikasi\\". Diterbitkan di Surabaya oleh Graha Ilmu pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', ''1'', ''0'', ''12'', ''admin'')', 'Admin', '2022-03-24 16:07:24', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36'),
(1531, 'INSERT INTO `arsip` (`instansi_id`, `lokasi_id`, `rak_id`, `baris_id`, `no_arsip`, `arsip_name`, `penulis_buku`, `jumlah_halaman`, `bahasa_id`, `tema_buku`, `penerbit`, `kota_penerbit`, `tahun_terbit`, `deskripsi_arsip`, `is_available`, `status_file`, `qty`, `created_by`) VALUES (''10'', ''40'', ''59'', ''19'', ''SR 87349.93 ARD m'', ''Mou EduArsip'', ''Muhammad Fahmi Ardi dkk'', ''86'', ''1'', ''kamus bahasa jawa kuno - indonesia'', ''Sinar Dunia Indonesia'', ''Surabaya'', ''2020'', ''Oleh Muhammad Fahmi Ardi dkk. Terdiri dari 86 halaman berbahasa Indonesia tentang \\"kamus bahasa jawa kuno - indonesia\\". Diterbitkan di Surabaya oleh Sinar Dunia Indonesia pada tahun 2020 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', ''1'', ''1'', ''10'', ''admin'')', 'Admin', '2022-03-24 16:13:29', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36');
INSERT INTO `log_queries` (`id`, `content`, `created_by`, `created_at`, `ip_address`, `user_agent`) VALUES
(1532, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''SR 87349.93 FAH k'', `arsip_name` = ''Kontrak EduArsip'', `penulis_buku` = ''Muhammad Fahmi dan Ridar Gustia Priatama'', `jumlah_halaman` = ''86'', `bahasa_id` = ''1'', `tema_buku` = ''kamus bahasa jawa kuno - indonesia'', `penerbit` = ''Sinar Dunia Indonesia'', `kota_penerbit` = ''Surabaya'', `tahun_terbit` = ''2020'', `deskripsi_arsip` = ''Oleh Muhammad Fahmi dan Ridar Gustia Priatama. Terdiri dari 86 halaman berbahasa Indonesia tentang \\"kamus bahasa jawa kuno - indonesia\\". Diterbitkan di Surabaya oleh Sinar Dunia Indonesia pada tahun 2020 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', `status_file` = ''1'', `qty` = ''10'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''25''', 'Admin', '2022-03-24 16:15:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36'),
(1533, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''SR 87349.93 FAH k'', `arsip_name` = ''Kontrak EduArsip'', `penulis_buku` = ''Muhammad Fahmi dkk.'', `jumlah_halaman` = ''86'', `bahasa_id` = ''1'', `tema_buku` = ''kamus bahasa jawa kuno - indonesia'', `penerbit` = ''Sinar Dunia Indonesia'', `kota_penerbit` = ''Surabaya'', `tahun_terbit` = ''2020'', `deskripsi_arsip` = ''Oleh Muhammad Fahmi dkk.. Terdiri dari 86 halaman berbahasa Indonesia tentang \\"kamus bahasa jawa kuno - indonesia\\". Diterbitkan di Surabaya oleh Sinar Dunia Indonesia pada tahun 2020 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', `status_file` = ''1'', `qty` = ''10'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''25''', 'Admin', '2022-03-24 16:16:13', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36'),
(1534, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''SR 87349.93 HUD p'', `arsip_name` = ''Perjanjian Kontrak EduArsip'', `penulis_buku` = ''Muhammad Choirul Huda dkk.'', `jumlah_halaman` = ''86'', `bahasa_id` = ''1'', `tema_buku` = ''kamus bahasa jawa kuno - indonesia'', `penerbit` = ''Sinar Dunia Indonesia'', `kota_penerbit` = ''Surabaya'', `tahun_terbit` = ''2020'', `deskripsi_arsip` = ''Oleh Muhammad Choirul Huda dkk.. Terdiri dari 86 halaman berbahasa Indonesia tentang \\"kamus bahasa jawa kuno - indonesia\\". Diterbitkan di Surabaya oleh Sinar Dunia Indonesia pada tahun 2020 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', `status_file` = ''1'', `qty` = ''10'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''25''', 'Admin', '2022-03-24 16:17:18', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36'),
(1535, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''SR 87349.93 AJI p'', `arsip_name` = ''Perjanjian Kontrak EduArsip'', `penulis_buku` = ''Muhammad Satrio Aji dkk'', `jumlah_halaman` = ''86'', `bahasa_id` = ''1'', `tema_buku` = ''kamus bahasa jawa kuno - indonesia'', `penerbit` = ''Sinar Dunia Indonesia'', `kota_penerbit` = ''Surabaya'', `tahun_terbit` = ''2020'', `deskripsi_arsip` = ''Oleh Muhammad Satrio Aji dkk. Terdiri dari 86 halaman berbahasa Indonesia tentang \\"kamus bahasa jawa kuno - indonesia\\". Diterbitkan di Surabaya oleh Sinar Dunia Indonesia pada tahun 2020 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', `status_file` = ''1'', `qty` = ''10'', `modified_by` = ''admin''\nWHERE `id_arsip` = ''25''', 'Admin', '2022-03-24 16:18:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36'),
(1536, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022/04/07'', ''2022/04/14'', ''24'', ''2'', '''', ''ridargustia'')', 'Ridar Gustia', '2022-04-07 15:51:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1537, 'UPDATE `arsip` SET `qty` = 11\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-04-07 15:51:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1538, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-08'', ''2022-04-15'', ''24'', ''2'', ''10'', ''admin'')', 'Admin', '2022-04-08 10:16:58', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1539, 'UPDATE `arsip` SET `qty` = 10\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-08 10:16:59', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1540, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-04-08'', `tgl_kembali` = ''2022-04-15'', `modified_by` = ''admin''\nWHERE `id_peminjaman` = ''1''', 'Admin', '2022-04-08 10:32:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1541, 'UPDATE `arsip` SET `qty` = 2\nWHERE `id_arsip` = ''16''', 'Admin', '2022-04-11 14:01:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1542, 'UPDATE `arsip` SET `qty` = 11\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-11 14:01:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1543, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-04-08'', `tgl_kembali` = ''2022-04-15'', `anggota_id` = ''1'', `arsip_id` = ''16'', `instansi_id` = ''10'', `modified_by` = ''admin''\nWHERE `id_peminjaman` = ''Array''', 'Admin', '2022-04-11 14:01:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1544, 'UPDATE `arsip` SET `qty` = 1\nWHERE `id_arsip` = ''16''', 'Admin', '2022-04-11 14:14:11', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1545, 'UPDATE `arsip` SET `qty` = 12\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-11 14:14:11', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1546, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-04-08'', `tgl_kembali` = ''2022-04-15'', `anggota_id` = 1, `arsip_id` = 16, `instansi_id` = ''10'', `modified_by` = ''admin''\nWHERE `id_peminjaman` = ''Array''', 'Admin', '2022-04-11 14:14:11', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1547, 'UPDATE `arsip` SET `qty` = 0\nWHERE `id_arsip` = ''16''', 'Admin', '2022-04-11 14:19:40', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1548, 'UPDATE `arsip` SET `qty` = 13\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-11 14:19:40', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1549, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-04-08'', `tgl_kembali` = ''2022-04-15'', `anggota_id` = 1, `arsip_id` = 16, `instansi_id` = ''10'', `modified_by` = ''admin''\nWHERE `id_peminjaman` = ''Array''', 'Admin', '2022-04-11 14:19:40', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1550, 'UPDATE `arsip` SET `qty` = 11\nWHERE `id_arsip` = ''17''', 'Admin', '2022-04-11 14:40:30', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1551, 'UPDATE `arsip` SET `qty` = 14\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-11 14:40:30', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1552, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-04-08'', `tgl_kembali` = ''2022-04-15'', `anggota_id` = 1, `arsip_id` = 17, `instansi_id` = ''10'', `modified_by` = ''admin''\nWHERE `id_peminjaman` = ''Array''', 'Admin', '2022-04-11 14:40:30', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1553, 'UPDATE `arsip` SET `qty` = 10\nWHERE `id_arsip` = ''17''', 'Admin', '2022-04-11 14:46:51', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1554, 'UPDATE `arsip` SET `qty` = 15\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-11 14:46:51', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1555, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''17''', 'Admin', '2022-04-11 14:49:28', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1556, 'UPDATE `arsip` SET `qty` = 16\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-11 14:49:28', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1557, 'UPDATE `arsip` SET `qty` = 8\nWHERE `id_arsip` = ''17''', 'Admin', '2022-04-11 14:52:44', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1558, 'UPDATE `arsip` SET `qty` = 17\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-11 14:52:44', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1559, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''17''', 'Admin', '2022-04-11 14:53:19', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1560, 'UPDATE `arsip` SET `qty` = 18\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-11 14:53:19', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1561, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''17''', 'Admin', '2022-04-11 15:10:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1562, 'UPDATE `arsip` SET `qty` = 19\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-11 15:10:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1563, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-04-08'', `tgl_kembali` = ''2022-04-15'', `anggota_id` = 1, `arsip_id` = 17, `instansi_id` = ''10'', `modified_by` = ''admin''\nWHERE `id_peminjaman` = ''1''', 'Admin', '2022-04-11 15:10:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1564, 'UPDATE `arsip` SET `qty` = 18\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-11 15:28:40', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1565, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''17''', 'Admin', '2022-04-11 15:28:40', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1566, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-04-08'', `tgl_kembali` = ''2022-04-15'', `anggota_id` = 2, `arsip_id` = 24, `instansi_id` = ''10'', `modified_by` = ''admin''\nWHERE `id_peminjaman` = ''1''', 'Admin', '2022-04-11 15:28:40', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1567, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''17''', 'Admin', '2022-04-11 15:30:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1568, 'UPDATE `arsip` SET `qty` = 19\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-11 15:30:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1569, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-04-08'', `tgl_kembali` = ''2022-04-15'', `anggota_id` = 1, `arsip_id` = 17, `instansi_id` = ''10'', `modified_by` = ''admin''\nWHERE `id_peminjaman` = ''1''', 'Admin', '2022-04-11 15:30:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'),
(1570, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-14'', ''2022-04-21'', ''25'', ''2'', ''10'', ''admin'')', 'Admin', '2022-04-14 20:35:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36'),
(1571, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''25''', 'Admin', '2022-04-14 20:35:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36'),
(1572, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-14'', ''2022-04-21'', ''24'', ''2'', ''10'', ''admin'')', 'Admin', '2022-04-14 20:37:38', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36'),
(1573, 'UPDATE `arsip` SET `qty` = 18\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-14 20:37:39', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36'),
(1574, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-19'', ''3'', ''24'', ''2'', ''10'', ''admin'')', 'Admin', '2022-04-19 22:22:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1575, 'UPDATE `arsip` SET `qty` = 19\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-19 22:22:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1576, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''3''', 'Admin', '2022-04-19 22:22:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1577, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-19'', ''2'', ''25'', ''2'', ''10'', ''admin'')', 'Admin', '2022-04-19 22:34:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1578, 'UPDATE `arsip` SET `qty` = 10\nWHERE `id_arsip` = ''25''', 'Admin', '2022-04-19 22:34:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1579, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''2''', 'Admin', '2022-04-19 22:34:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1580, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-19'', ''1'', ''17'', ''1'', ''10'', ''admin'')', 'Admin', '2022-04-19 22:51:31', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1581, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''17''', 'Admin', '2022-04-19 22:51:31', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1582, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''1''', 'Admin', '2022-04-19 22:51:31', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1583, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-20'', ''2022-04-27'', ''24'', ''2'', '''', ''ridargustia'')', 'Ridar Gustia', '2022-04-20 10:39:05', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1584, 'UPDATE `arsip` SET `qty` = 18\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-04-20 10:39:05', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1585, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-20'', ''2022-04-27'', ''24'', ''2'', '''', ''ridargustia'')', 'Ridar Gustia', '2022-04-20 10:43:14', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1586, 'UPDATE `arsip` SET `qty` = 17\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-04-20 10:43:14', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1587, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-20'', ''2022-04-27'', ''17'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-04-20 11:00:56', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1588, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''17''', 'Ridar Gustia', '2022-04-20 11:00:56', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1589, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-20'', ''2022-04-27'', ''24'', ''1'', '''', ''ridargustia'')', 'Ridar Gustia', '2022-04-20 11:06:02', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1590, 'UPDATE `arsip` SET `qty` = 16\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-04-20 11:06:02', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1591, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-20'', ''7'', ''24'', ''1'', ''0'', ''ridargustia'')', 'Ridar Gustia', '2022-04-20 11:09:38', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1592, 'UPDATE `arsip` SET `qty` = 17\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-04-20 11:09:38', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1593, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''7''', 'Ridar Gustia', '2022-04-20 11:09:39', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1594, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-20'', ''6'', ''17'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-04-20 11:20:33', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1595, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''17''', 'Ridar Gustia', '2022-04-20 11:20:33', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1596, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''6''', 'Ridar Gustia', '2022-04-20 11:20:33', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1597, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-20'', ''2022-04-27'', ''24'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-04-20 11:28:53', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1598, 'UPDATE `arsip` SET `qty` = 16\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-04-20 11:28:54', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1599, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-20'', ''2022-04-27'', ''25'', ''1'', '''', ''ridargustia'')', 'Ridar Gustia', '2022-04-20 11:37:03', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1600, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''25''', 'Ridar Gustia', '2022-04-20 11:37:03', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1601, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-20'', ''2022-04-27'', ''24'', ''2'', '''', ''ridargustia'')', 'Ridar Gustia', '2022-04-20 14:00:54', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1602, 'UPDATE `arsip` SET `qty` = 15\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-04-20 14:00:54', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1603, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-20'', ''2022-04-27'', ''25'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-04-20 14:03:13', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1604, 'UPDATE `arsip` SET `qty` = 8\nWHERE `id_arsip` = ''25''', 'Ridar Gustia', '2022-04-20 14:03:13', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1605, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-20'', ''2022-04-27'', ''25'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-04-20 14:11:49', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1606, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''25''', 'Ridar Gustia', '2022-04-20 14:11:49', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1607, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-20'', ''2022-04-27'', ''23'', ''2'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-04-20 14:13:15', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1608, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''23''', 'Ridar Gustia', '2022-04-20 14:13:16', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1609, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-20'', ''2022-04-27'', ''25'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-04-20 15:06:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1610, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''25''', 'Ridar Gustia', '2022-04-20 15:06:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1611, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''17''', 'Ridar Gustia', '2022-04-20 15:33:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1612, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''25''', 'Ridar Gustia', '2022-04-20 15:33:56', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1613, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-04-20'', `tgl_kembali` = ''2022-04-27'', `anggota_id` = 2, `arsip_id` = 17, `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''14''', 'Ridar Gustia', '2022-04-20 15:33:56', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1614, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-04-20'', `tgl_kembali` = ''2022-04-27'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''14''', 'Ridar Gustia', '2022-04-20 15:35:18', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1615, 'UPDATE `arsip` SET `qty` = 14\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-04-20 15:49:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1616, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''17''', 'Ridar Gustia', '2022-04-20 15:49:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1617, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-04-20'', `tgl_kembali` = ''2022-04-27'', `anggota_id` = 3, `arsip_id` = 24, `instansi_id` = ''11'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''14''', 'Ridar Gustia', '2022-04-20 15:49:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1618, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-04-20'', `tgl_kembali` = ''2022-04-27'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''14''', 'Ridar Gustia', '2022-04-20 15:51:07', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1619, 'UPDATE `peminjaman` SET `anggota_id` = ''1'', `tgl_peminjaman` = ''2022-04-20'', `tgl_kembali` = ''2022-04-27'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''14''', 'Ridar Gustia', '2022-04-20 15:52:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1620, 'UPDATE `peminjaman` SET `anggota_id` = ''2'', `instansi_id` = ''10'', `tgl_peminjaman` = ''2022-04-20'', `tgl_kembali` = ''2022-04-27'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''14''', 'Ridar Gustia', '2022-04-20 15:55:29', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1621, 'UPDATE `peminjaman` SET `anggota_id` = ''3'', `instansi_id` = ''11'', `tgl_peminjaman` = ''2022-04-20'', `tgl_kembali` = ''2022-04-27'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''14''', 'Ridar Gustia', '2022-04-20 15:56:14', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1622, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''17''', 'Ridar Gustia', '2022-04-20 15:57:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1623, 'UPDATE `arsip` SET `qty` = 15\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-04-20 15:57:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1624, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-04-20'', `tgl_kembali` = ''2022-04-27'', `anggota_id` = 1, `arsip_id` = 17, `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''14''', 'Ridar Gustia', '2022-04-20 15:57:08', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1625, 'UPDATE `peminjaman` SET `anggota_id` = ''2'', `instansi_id` = ''10'', `tgl_peminjaman` = ''2022-04-20'', `tgl_kembali` = ''2022-04-27'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''14''', 'Ridar Gustia', '2022-04-21 10:08:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1626, 'UPDATE `peminjaman` SET `anggota_id` = ''1'', `instansi_id` = ''10'', `tgl_peminjaman` = ''2022-04-20'', `tgl_kembali` = ''2022-04-27'', `modified_by` = ''admin''\nWHERE `id_peminjaman` = ''14''', 'Admin', '2022-04-21 10:23:03', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1627, 'UPDATE `peminjaman` SET `anggota_id` = ''1'', `instansi_id` = ''10'', `tgl_peminjaman` = ''2022-04-20'', `tgl_kembali` = ''2022-04-27'', `modified_by` = ''admin''\nWHERE `id_peminjaman` = ''14''', 'Admin', '2022-04-21 10:23:44', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1628, 'UPDATE `peminjaman` SET `anggota_id` = ''2'', `instansi_id` = ''10'', `tgl_peminjaman` = ''2022-04-20'', `tgl_kembali` = ''2022-04-27'', `modified_by` = ''admin''\nWHERE `id_peminjaman` = ''14''', 'Admin', '2022-04-21 10:36:22', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1629, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-21'', ''10'', ''24'', ''2'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-04-21 11:10:53', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1630, 'UPDATE `arsip` SET `qty` = 16\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-04-21 11:10:53', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1631, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''10''', 'Ridar Gustia', '2022-04-21 11:10:53', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1632, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-21'', ''14'', ''17'', ''2'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-04-21 11:11:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1633, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''17''', 'Ridar Gustia', '2022-04-21 11:11:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1634, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''14''', 'Ridar Gustia', '2022-04-21 11:11:25', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1635, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-21'', ''8'', ''24'', ''1'', ''10'', ''admin'')', 'Admin', '2022-04-21 11:16:16', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1636, 'UPDATE `arsip` SET `qty` = 17\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-21 11:16:16', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1637, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''8''', 'Admin', '2022-04-21 11:16:16', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1638, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-21'', ''9'', ''25'', ''1'', ''10'', ''admin'')', 'Admin', '2022-04-21 11:16:52', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1639, 'UPDATE `arsip` SET `qty` = 8\nWHERE `id_arsip` = ''25''', 'Admin', '2022-04-21 11:16:52', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1640, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''9''', 'Admin', '2022-04-21 11:16:52', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1641, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-21'', ''11'', ''25'', ''1'', ''10'', ''admin'')', 'Admin', '2022-04-21 11:17:51', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1642, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''25''', 'Admin', '2022-04-21 11:17:51', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1643, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''11''', 'Admin', '2022-04-21 11:17:51', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1644, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-21'', ''12'', ''25'', ''1'', ''10'', ''admin'')', 'Admin', '2022-04-21 13:51:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1645, 'UPDATE `arsip` SET `qty` = 10\nWHERE `id_arsip` = ''25''', 'Admin', '2022-04-21 13:51:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1646, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''12''', 'Admin', '2022-04-21 13:51:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1647, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-22'', ''2022-04-29'', ''22'', ''2'', ''10'', ''admin'')', 'Admin', '2022-04-22 13:40:03', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1648, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''22''', 'Admin', '2022-04-22 13:40:03', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1649, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-22'', ''2022-04-29'', ''23'', ''2'', ''10'', ''admin'')', 'Admin', '2022-04-22 13:41:52', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1650, 'UPDATE `arsip` SET `qty` = 5\nWHERE `id_arsip` = ''23''', 'Admin', '2022-04-22 13:41:52', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1651, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-22'', ''2022-04-29'', ''24'', ''1'', ''10'', ''admin'')', 'Admin', '2022-04-22 13:43:45', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1652, 'UPDATE `arsip` SET `qty` = 16\nWHERE `id_arsip` = ''24''', 'Admin', '2022-04-22 13:43:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1653, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-22'', ''16'', ''23'', ''2'', ''10'', ''admin'')', 'Admin', '2022-04-22 13:48:41', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1654, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''23''', 'Admin', '2022-04-22 13:48:41', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1655, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''16''', 'Admin', '2022-04-22 13:48:41', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1656, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-04-22'', ''15'', ''22'', ''2'', ''10'', ''admin'')', 'Admin', '2022-04-22 14:23:50', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1657, 'UPDATE `arsip` SET `qty` = 10\nWHERE `id_arsip` = ''22''', 'Admin', '2022-04-22 14:23:50', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1658, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''15''', 'Admin', '2022-04-22 14:23:50', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(1659, 'UPDATE `pengembalian` SET `tgl_kembali` = ''2022-05-10'', `peminjaman_id` = ''17'', `arsip_id` = ''24'', `anggota_id` = ''1'', `instansi_id` = ''10'', `modified_by` = ''admin''\nWHERE `id_pengembalian` = ''13''', 'Admin', '2022-05-10 16:53:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1660, 'UPDATE `arsip` SET `qty` = 17\nWHERE `id_arsip` = ''24''', 'Admin', '2022-05-10 16:53:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1661, 'UPDATE `peminjaman` SET `is_kembali` = ''0''\nWHERE `id_peminjaman` = ''15''', 'Admin', '2022-05-10 16:53:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1662, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''22''', 'Admin', '2022-05-10 16:53:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1663, 'UPDATE `pengembalian` SET `tgl_kembali` = ''2022-05-11'', `peminjaman_id` = ''15'', `arsip_id` = ''22'', `anggota_id` = ''2'', `instansi_id` = ''10'', `modified_by` = ''admin''\nWHERE `id_pengembalian` = ''13''', 'Admin', '2022-05-11 09:50:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1664, 'UPDATE `arsip` SET `qty` = 10\nWHERE `id_arsip` = ''22''', 'Admin', '2022-05-11 09:50:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1665, 'UPDATE `peminjaman` SET `is_kembali` = ''0''\nWHERE `id_peminjaman` = ''17''', 'Admin', '2022-05-11 09:50:35', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1666, 'UPDATE `arsip` SET `qty` = 16\nWHERE `id_arsip` = ''24''', 'Admin', '2022-05-11 09:50:35', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1667, 'UPDATE `pengembalian` SET `peminjaman_id` = ''17'', `arsip_id` = ''24'', `anggota_id` = ''1'', `instansi_id` = ''10'', `modified_by` = ''admin''\nWHERE `id_pengembalian` = ''12''', 'Admin', '2022-05-11 10:08:35', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1668, 'UPDATE `arsip` SET `qty` = 17\nWHERE `id_arsip` = ''24''', 'Admin', '2022-05-11 10:08:35', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1669, 'UPDATE `peminjaman` SET `is_kembali` = ''0''\nWHERE `id_peminjaman` = ''16''', 'Admin', '2022-05-11 10:08:35', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1670, 'UPDATE `arsip` SET `qty` = 5\nWHERE `id_arsip` = ''23''', 'Admin', '2022-05-11 10:08:35', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1671, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-11'', ''2022-05-18'', ''25'', ''1'', ''10'', ''admin'')', 'Admin', '2022-05-11 11:01:31', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1672, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''25''', 'Admin', '2022-05-11 11:01:31', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1673, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''18''', 'Admin', '2022-05-11 11:02:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1674, 'UPDATE `arsip` SET `qty` = 10\nWHERE `id_arsip` = ''25''', 'Admin', '2022-05-11 11:02:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1675, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-11'', ''18'', ''25'', ''1'', ''10'', ''admin'')', 'Admin', '2022-05-11 11:02:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1676, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-11'', ''2022-05-18'', ''25'', ''1'', ''10'', ''admin'')', 'Admin', '2022-05-11 11:04:57', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1677, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''25''', 'Admin', '2022-05-11 11:04:57', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1678, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''19''', 'Admin', '2022-05-11 11:05:30', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1679, 'UPDATE `arsip` SET `qty` = 10\nWHERE `id_arsip` = ''25''', 'Admin', '2022-05-11 11:05:30', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1680, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-11'', ''19'', ''25'', ''1'', ''10'', ''admin'')', 'Admin', '2022-05-11 11:05:30', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1681, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-11'', ''2022-05-18'', ''22'', ''1'', ''10'', ''admin'')', 'Admin', '2022-05-11 13:57:12', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1682, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''22''', 'Admin', '2022-05-11 13:57:13', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
(1683, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''PS 2873.49 PRI f'', `arsip_name` = ''Filsafat'', `penulis_buku` = ''Ridar Gustia Priatama dkk.'', `jumlah_halaman` = ''56'', `bahasa_id` = ''2'', `tema_buku` = ''Testing Aplikasi'', `penerbit` = ''Graha Ilmu'', `kota_penerbit` = ''Surabaya'', `tahun_terbit` = ''2019'', `deskripsi_arsip` = ''Oleh Ridar Gustia Priatama dkk.. Terdiri dari 56 halaman berbahasa Inggris tentang \\"Testing Aplikasi\\". Diterbitkan di Surabaya oleh Graha Ilmu pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', `status_file` = ''0'', `qty` = ''17'', `modified_by` = ''ridargustia'', `cover_buku` = ''filsafat20220518170037.jpg'', `cover_buku_thumb` = ''filsafat20220518170037_thumb.jpg''\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-05-18 17:00:38', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1684, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''SR 738.93 SET s'', `arsip_name` = ''Soal Ujian Akhir Sekolah'', `penulis_buku` = ''Deny Setyanto dan Jeghison Riyadi'', `jumlah_halaman` = ''20'', `bahasa_id` = ''1'', `tema_buku` = ''teknologi pendidikan - metode'', `penerbit` = ''Pustaka Ilmu'', `kota_penerbit` = ''Surabaya'', `tahun_terbit` = ''2009'', `deskripsi_arsip` = ''Oleh Deny Setyanto dan Jeghison Riyadi. Terdiri dari 20 halaman berbahasa Indonesia tentang \\"teknologi pendidikan - metode\\". Diterbitkan di Surabaya oleh Pustaka Ilmu pada tahun 2009 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', `status_file` = ''0'', `qty` = ''5'', `modified_by` = ''ridargustia'', `cover_buku` = ''soal-ujian-akhir-sekolah20220518170119.png'', `cover_buku_thumb` = ''soal-ujian-akhir-sekolah20220518170119_thumb.png''\nWHERE `id_arsip` = ''23''', 'Ridar Gustia', '2022-05-18 17:01:19', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1685, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''SR 87349.93 AJI p'', `arsip_name` = ''Perjanjian Kontrak EduArsip'', `penulis_buku` = ''Muhammad Satrio Aji dkk'', `jumlah_halaman` = ''86'', `bahasa_id` = ''1'', `tema_buku` = ''kamus bahasa jawa kuno - indonesia'', `penerbit` = ''Sinar Dunia Indonesia'', `kota_penerbit` = ''Surabaya'', `tahun_terbit` = ''2020'', `deskripsi_arsip` = ''Oleh Muhammad Satrio Aji dkk. Terdiri dari 86 halaman berbahasa Indonesia tentang \\"kamus bahasa jawa kuno - indonesia\\". Diterbitkan di Surabaya oleh Sinar Dunia Indonesia pada tahun 2020 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', `status_file` = ''1'', `qty` = ''10'', `modified_by` = ''ridargustia'', `cover_buku` = ''perjanjian-kontrak-eduarsip20220518170226.jpg'', `cover_buku_thumb` = ''perjanjian-kontrak-eduarsip20220518170226_thumb.jpg''\nWHERE `id_arsip` = ''25''', 'Ridar Gustia', '2022-05-18 17:02:26', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1686, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''SR 738.29 WIN t'', `arsip_name` = ''Testing Book Satu'', `penulis_buku` = ''Gilang Herjun Winarta'', `jumlah_halaman` = ''98'', `bahasa_id` = ''1'', `tema_buku` = ''Testing Aplikasi Aplikasi Perpustakaan'', `penerbit` = ''Erlangga'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2019'', `deskripsi_arsip` = ''Oleh Gilang Herjun Winarta. Terdiri dari 98 halaman berbahasa Indonesia tentang \\"Testing Aplikasi Aplikasi Perpustakaan\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', `status_file` = ''0'', `qty` = ''9'', `modified_by` = ''ridargustia'', `cover_buku` = ''testing-book-satu20220518192145.jpeg'', `cover_buku_thumb` = ''testing-book-satu20220518192145_thumb.jpeg''\nWHERE `id_arsip` = ''22''', 'Ridar Gustia', '2022-05-18 19:21:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1687, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''SR 738.93 SET s'', `arsip_name` = ''Soal Ujian Akhir Sekolah'', `penulis_buku` = ''Deny Setyanto dan Jeghison Riyadi'', `jumlah_halaman` = ''20'', `bahasa_id` = ''1'', `tema_buku` = ''teknologi pendidikan - metode'', `penerbit` = ''Pustaka Ilmu'', `kota_penerbit` = ''Surabaya'', `tahun_terbit` = ''2009'', `deskripsi_arsip` = ''Oleh Deny Setyanto dan Jeghison Riyadi. Terdiri dari 20 halaman berbahasa Indonesia tentang \\"teknologi pendidikan - metode\\". Diterbitkan di Surabaya oleh Pustaka Ilmu pada tahun 2009 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', `status_file` = ''0'', `qty` = ''5'', `modified_by` = ''ridargustia'', `cover_buku` = ''soal-ujian-akhir-sekolah20220518192758.png'', `cover_buku_thumb` = ''soal-ujian-akhir-sekolah20220518192758_thumb.png''\nWHERE `id_arsip` = ''23''', 'Ridar Gustia', '2022-05-18 19:27:58', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1688, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''PS 2873.49 PRI f'', `arsip_name` = ''Filsafat'', `penulis_buku` = ''Ridar Gustia Priatama dkk.'', `jumlah_halaman` = ''56'', `bahasa_id` = ''2'', `tema_buku` = ''Testing Aplikasi'', `penerbit` = ''Graha Ilmu'', `kota_penerbit` = ''Surabaya'', `tahun_terbit` = ''2019'', `deskripsi_arsip` = ''Oleh Ridar Gustia Priatama dkk.. Terdiri dari 56 halaman berbahasa Inggris tentang \\"Testing Aplikasi\\". Diterbitkan di Surabaya oleh Graha Ilmu pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', `status_file` = ''0'', `qty` = ''17'', `modified_by` = ''ridargustia'', `cover_buku` = ''filsafat20220518193439.jpg'', `cover_buku_thumb` = ''filsafat20220518193439_thumb.jpg''\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-05-18 19:34:39', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36');
INSERT INTO `log_queries` (`id`, `content`, `created_by`, `created_at`, `ip_address`, `user_agent`) VALUES
(1689, 'UPDATE `arsip` SET `instansi_id` = ''10'', `lokasi_id` = ''40'', `rak_id` = ''59'', `baris_id` = ''19'', `no_arsip` = ''SR 738.29 WIN t'', `arsip_name` = ''Testing Book Satu'', `penulis_buku` = ''Gilang Herjun Winarta'', `jumlah_halaman` = ''98'', `bahasa_id` = ''1'', `tema_buku` = ''Testing Aplikasi Aplikasi Perpustakaan'', `penerbit` = ''Erlangga'', `kota_penerbit` = ''Jakarta'', `tahun_terbit` = ''2019'', `deskripsi_arsip` = ''Oleh Gilang Herjun Winarta. Terdiri dari 98 halaman berbahasa Indonesia tentang \\"Testing Aplikasi Aplikasi Perpustakaan\\". Diterbitkan di Jakarta oleh Erlangga pada tahun 2019 dan kemudian menjadi koleksi perpustakaan sejak 24 March 2022'', `status_file` = ''0'', `qty` = ''9'', `modified_by` = ''ridargustia'', `cover_buku` = ''testing-book-satu20220518193527.jpg'', `cover_buku_thumb` = ''testing-book-satu20220518193527_thumb.jpg''\nWHERE `id_arsip` = ''22''', 'Ridar Gustia', '2022-05-18 19:35:28', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1690, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-18'', ''2022-05-25'', ''23'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-05-18 20:39:40', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1691, 'UPDATE `arsip` SET `qty` = 4\nWHERE `id_arsip` = ''23''', 'Ridar Gustia', '2022-05-18 20:39:41', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1692, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-05-18 21:04:pm''\nWHERE `id_peminjaman` = ''21''', 'Ridar Gustia', '2022-05-18 21:04:10', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1693, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-05-18 21:37:pm''\nWHERE `id_peminjaman` = ''16''', 'Ridar Gustia', '2022-05-18 21:37:59', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1694, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-18'', ''2022-05-25'', ''24'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-05-18 21:38:41', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1695, 'UPDATE `arsip` SET `qty` = 16\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-05-18 21:38:41', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1696, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-18'', ''2022-05-25'', ''25'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-05-18 21:39:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1697, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''25''', 'Ridar Gustia', '2022-05-18 21:39:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1698, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-18'', ''2022-05-25'', ''23'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-05-18 21:40:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1699, 'UPDATE `arsip` SET `qty` = 3\nWHERE `id_arsip` = ''23''', 'Ridar Gustia', '2022-05-18 21:40:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1700, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-18'', ''2022-05-25'', ''22'', ''2'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-05-18 21:41:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1701, 'UPDATE `arsip` SET `qty` = 8\nWHERE `id_arsip` = ''22''', 'Ridar Gustia', '2022-05-18 21:41:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1702, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-18'', ''2022-05-25'', ''24'', ''2'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-05-18 21:42:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1703, 'UPDATE `arsip` SET `qty` = 15\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-05-18 21:42:20', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1704, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-05-18 21:47:pm''\nWHERE `id_peminjaman` = ''26''', 'Ridar Gustia', '2022-05-18 21:47:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1705, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''22''', 'Ridar Gustia', '2022-05-19 08:37:11', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1706, 'UPDATE `arsip` SET `qty` = 16\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-05-19 08:37:11', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1707, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-19'', ''22'', ''24'', ''1'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-05-19 08:37:11', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1708, 'UPDATE `arsip` SET `qty` = 15\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-05-19 10:48:42', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1709, 'UPDATE `arsip` SET `qty` = 10\nWHERE `id_arsip` = ''25''', 'Ridar Gustia', '2022-05-19 10:48:42', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1710, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-05-18'', `tgl_kembali` = ''2022-05-25'', `anggota_id` = 1, `arsip_id` = 24, `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''23''', 'Ridar Gustia', '2022-05-19 10:48:42', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1711, 'UPDATE `arsip` SET `qty` = 2\nWHERE `id_arsip` = ''23''', 'Ridar Gustia', '2022-05-19 10:52:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1712, 'UPDATE `arsip` SET `qty` = 16\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-05-19 10:52:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1713, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-05-18'', `tgl_kembali` = ''2022-05-25'', `anggota_id` = 1, `arsip_id` = 23, `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''23''', 'Ridar Gustia', '2022-05-19 10:52:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1714, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''25''', 'Ridar Gustia', '2022-05-19 10:53:35', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1715, 'UPDATE `arsip` SET `qty` = 3\nWHERE `id_arsip` = ''23''', 'Ridar Gustia', '2022-05-19 10:53:35', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1716, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-05-18'', `tgl_kembali` = ''2022-05-25'', `anggota_id` = 1, `arsip_id` = 25, `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''24''', 'Ridar Gustia', '2022-05-19 10:53:35', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1717, 'UPDATE `peminjaman` SET `anggota_id` = ''2'', `instansi_id` = ''10'', `tgl_peminjaman` = ''2022-05-18'', `tgl_kembali` = ''2022-05-25'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''24''', 'Ridar Gustia', '2022-05-19 10:54:35', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1718, 'UPDATE `arsip` SET `qty` = 15\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-05-19 11:02:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1719, 'UPDATE `arsip` SET `qty` = 10\nWHERE `id_arsip` = ''25''', 'Ridar Gustia', '2022-05-19 11:02:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1720, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-05-18'', `tgl_kembali` = ''2022-05-25'', `anggota_id` = 2, `arsip_id` = 24, `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''24''', 'Ridar Gustia', '2022-05-19 11:02:34', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1721, 'UPDATE `arsip` SET `qty` = 7\nWHERE `id_arsip` = ''22''', 'Ridar Gustia', '2022-05-19 11:14:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1722, 'UPDATE `arsip` SET `qty` = 16\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-05-19 11:14:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1723, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-05-18'', `tgl_kembali` = ''2022-05-25'', `anggota_id` = 1, `arsip_id` = 22, `instansi_id` = ''10'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''24''', 'Ridar Gustia', '2022-05-19 11:14:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1724, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-19'', ''2022-05-26'', ''24'', ''2'', ''10'', ''ridargustia'')', 'Ridar Gustia', '2022-05-19 11:17:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1725, 'UPDATE `arsip` SET `qty` = 15\nWHERE `id_arsip` = ''24''', 'Ridar Gustia', '2022-05-19 11:17:17', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1726, 'UPDATE `peminjaman` SET `anggota_id` = ''1'', `instansi_id` = ''10'', `tgl_peminjaman` = ''2022-05-19'', `tgl_kembali` = ''2022-05-26'', `modified_by` = ''ridargustia''\nWHERE `id_peminjaman` = ''27''', 'Ridar Gustia', '2022-05-19 11:19:14', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1727, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-05-19 11:39:am''\nWHERE `id_peminjaman` = ''24''', 'Ridar Gustia', '2022-05-19 11:39:41', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1728, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''ridargustia'', `deleted_at` = ''2022-05-19 16:13:pm''\nWHERE `id_peminjaman` = ''27''', 'Ridar Gustia', '2022-05-19 16:13:55', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1729, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-20'', ''2022-05-27'', ''24'', ''1'', ''10'', ''admin'')', 'Admin', '2022-05-20 09:46:57', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1730, 'UPDATE `arsip` SET `qty` = 14\nWHERE `id_arsip` = ''24''', 'Admin', '2022-05-20 09:46:57', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1731, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-20'', ''2022-05-27'', ''25'', ''2'', ''10'', ''admin'')', 'Admin', '2022-05-20 09:48:52', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1732, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''25''', 'Admin', '2022-05-20 09:48:52', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1733, 'UPDATE `arsip` SET `qty` = 6\nWHERE `id_arsip` = ''22''', 'Admin', '2022-05-20 10:01:01', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1734, 'UPDATE `arsip` SET `qty` = 4\nWHERE `id_arsip` = ''23''', 'Admin', '2022-05-20 10:01:01', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1735, 'UPDATE `peminjaman` SET `tgl_peminjaman` = ''2022-05-18'', `tgl_kembali` = ''2022-05-25'', `anggota_id` = 1, `arsip_id` = 22, `instansi_id` = ''10'', `modified_by` = ''admin''\nWHERE `id_peminjaman` = ''23''', 'Admin', '2022-05-20 10:01:01', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1736, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-05-20 10:01:am''\nWHERE `id_peminjaman` = ''23''', 'Admin', '2022-05-20 10:01:19', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1737, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-20'', ''29'', ''25'', ''2'', ''10'', ''admin'')', 'Admin', '2022-05-20 10:03:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1738, 'UPDATE `arsip` SET `qty` = 10\nWHERE `id_arsip` = ''25''', 'Admin', '2022-05-20 10:03:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1739, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''29''', 'Admin', '2022-05-20 10:03:43', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1740, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-20'', ''2022-05-27'', ''23'', ''1'', ''10'', ''admin'')', 'Admin', '2022-05-20 11:02:05', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1741, 'UPDATE `arsip` SET `qty` = 3\nWHERE `id_arsip` = ''23''', 'Admin', '2022-05-20 11:02:05', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1742, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-20'', ''2022-05-27'', ''25'', ''1'', ''10'', ''admin'')', 'Admin', '2022-05-20 13:54:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1743, 'UPDATE `arsip` SET `qty` = 9\nWHERE `id_arsip` = ''25''', 'Admin', '2022-05-20 13:54:36', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1744, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-20'', ''2022-05-27'', ''22'', ''1'', ''10'', ''admin'')', 'Admin', '2022-05-20 13:55:22', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1745, 'UPDATE `arsip` SET `qty` = 5\nWHERE `id_arsip` = ''22''', 'Admin', '2022-05-20 13:55:23', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1746, 'UPDATE `peminjaman` SET `is_delete_peminjaman` = ''1'', `deleted_by` = ''admin'', `deleted_at` = ''2022-05-21 23:54:pm''\nWHERE `id_peminjaman` = ''31''', 'Admin', '2022-05-21 23:54:46', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1747, 'INSERT INTO `peminjaman` (`tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-21'', ''2022-05-28'', ''25'', ''2'', ''10'', ''admin'')', 'Admin', '2022-05-21 23:56:14', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1748, 'UPDATE `arsip` SET `qty` = 8\nWHERE `id_arsip` = ''25''', 'Admin', '2022-05-21 23:56:14', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1749, 'INSERT INTO `pengembalian` (`tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `created_by`) VALUES (''2022-05-25'', ''28'', ''24'', ''1'', ''10'', ''admin'')', 'Admin', '2022-05-25 11:23:56', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1750, 'UPDATE `arsip` SET `qty` = 15\nWHERE `id_arsip` = ''24''', 'Admin', '2022-05-25 11:23:56', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36'),
(1751, 'UPDATE `peminjaman` SET `is_kembali` = ''1''\nWHERE `id_peminjaman` = ''28''', 'Admin', '2022-05-25 11:23:56', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` int(11) NOT NULL,
  `lokasi_name` varchar(100) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) DEFAULT NULL,
  `divisi_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete_lokasi` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `lokasi_name`, `instansi_id`, `cabang_id`, `divisi_id`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_lokasi`, `deleted_by`, `deleted_at`) VALUES
(40, 'Ruang Baca', 10, NULL, NULL, '2022-01-26 11:11:33', 'admin', '', '2022-01-26 16:05:03', 0, NULL, NULL);

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
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete_map` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `order_no` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `menu_name`, `menu_controller`, `menu_function`, `menu_icon`, `is_active`, `order_no`) VALUES
(5, 'PEMINJAMAN', 'peminjaman', '#', 'fa-edit', 1, 1),
(6, 'PENGEMBALIAN', 'pengembalian', '#', 'fa-edit', 1, 2),
(7, 'BUKU', 'buku', '#', 'fa-book', 1, 3),
(8, 'RAK', 'rak', '#', 'fa-building', 1, 4),
(9, 'BARIS', 'baris', '#', 'fa-bookmark', 1, 5),
(10, 'LAPORAN', 'laporan', '#', 'fa-file', 0, 8),
(13, 'PROGRAM STUDI', 'divisi', '#', 'fa-map-signs', 1, 12),
(14, 'PERGURUAN TINGGI', 'instansi', '#', 'fa-map-signs', 1, 10),
(15, 'LOKASI BUKU', 'lokasi', '#', 'fa-map-pin', 1, 9),
(16, 'FAKULTAS', 'cabang', '#', 'fa-map-signs', 1, 11),
(17, 'DIVISI', 'bagian', '#', 'fa-map-signs', 1, 13),
(18, 'ANGGOTA', 'anggota', '#', 'fa-users', 1, 14);

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
(110, 5, 7, 13),
(111, 5, 7, 20),
(112, 5, 7, 12),
(113, 5, 9, 17),
(114, 5, 9, 23),
(115, 5, 9, 16),
(122, 5, 14, 32),
(123, 5, 14, 36),
(124, 5, 14, 31),
(130, 5, 5, 9),
(131, 5, 5, 21),
(132, 5, 5, 7),
(133, 5, 6, 11),
(134, 5, 6, 22),
(135, 5, 6, 10),
(136, 5, 8, 15),
(137, 5, 8, 24),
(138, 5, 8, 14),
(141, 5, 15, 40),
(142, 5, 15, 39),
(143, 5, 15, 42),
(148, 1, 15, 40),
(149, 1, 15, 42),
(150, 1, 15, 39),
(166, 5, 18, 49),
(167, 5, 18, 50),
(168, 5, 18, 51),
(169, 1, 18, 49),
(170, 1, 18, 50),
(171, 1, 18, 51);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `tgl_peminjaman` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `arsip_id` int(11) NOT NULL,
  `anggota_id` int(11) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) DEFAULT NULL,
  `divisi_id` int(11) DEFAULT NULL,
  `bagian_id` int(11) DEFAULT NULL,
  `is_kembali` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete_peminjaman` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `tgl_peminjaman`, `tgl_kembali`, `arsip_id`, `anggota_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `is_kembali`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_peminjaman`, `deleted_by`, `deleted_at`) VALUES
(15, '2022-04-22', '2022-04-29', 22, 2, 10, NULL, NULL, NULL, 1, '2022-04-22 13:40:03', 'admin', NULL, '2022-05-11 09:50:35', 0, NULL, NULL),
(16, '2022-04-22', '2022-04-29', 23, 2, 10, NULL, NULL, NULL, 0, '2022-04-22 13:41:52', 'admin', NULL, '2022-05-18 21:37:59', 1, 'ridargustia', '2022-05-18 21:37:00'),
(17, '2022-04-22', '2022-04-29', 24, 1, 10, NULL, NULL, NULL, 1, '2022-04-22 13:43:45', 'admin', NULL, '2022-05-11 10:08:35', 0, NULL, NULL),
(18, '2022-05-11', '2022-05-18', 25, 1, 10, NULL, NULL, NULL, 1, '2022-05-11 11:01:31', 'admin', NULL, '2022-05-11 11:02:22', 0, NULL, NULL),
(19, '2022-05-11', '2022-05-18', 25, 1, 10, NULL, NULL, NULL, 1, '2022-05-11 11:04:57', 'admin', NULL, '2022-05-11 11:05:30', 0, NULL, NULL),
(20, '2022-05-11', '2022-05-18', 22, 1, 10, NULL, NULL, NULL, 0, '2022-05-11 13:57:12', 'admin', NULL, '2022-05-18 21:04:10', 1, 'ridargustia', '2022-05-18 21:04:00'),
(21, '2022-05-18', '2022-05-25', 23, 1, 10, NULL, NULL, NULL, 0, '2022-05-18 20:39:40', 'ridargustia', NULL, '2022-05-18 21:04:10', 1, 'ridargustia', '2022-05-18 21:04:00'),
(22, '2022-05-18', '2022-05-25', 24, 1, 10, NULL, NULL, NULL, 1, '2022-05-18 21:38:41', 'ridargustia', NULL, '2022-05-19 08:37:10', 0, NULL, NULL),
(23, '2022-05-18', '2022-05-25', 22, 1, 10, NULL, NULL, NULL, 0, '2022-05-18 21:39:17', 'ridargustia', 'admin', '2022-05-20 10:01:19', 1, 'admin', '2022-05-20 10:01:00'),
(24, '2022-05-18', '2022-05-25', 22, 1, 10, NULL, NULL, NULL, 0, '2022-05-18 21:40:17', 'ridargustia', 'ridargustia', '2022-05-19 11:39:41', 1, 'ridargustia', '2022-05-19 11:39:00'),
(25, '2022-05-18', '2022-05-25', 22, 2, 10, NULL, NULL, NULL, 0, '2022-05-18 21:41:20', 'ridargustia', NULL, '2022-05-18 21:47:43', 1, 'ridargustia', '2022-05-18 21:47:00'),
(26, '2022-05-18', '2022-05-25', 24, 2, 10, NULL, NULL, NULL, 0, '2022-05-18 21:42:20', 'ridargustia', NULL, '2022-05-18 21:47:43', 1, 'ridargustia', '2022-05-18 21:47:00'),
(27, '2022-05-19', '2022-05-26', 24, 1, 10, NULL, NULL, NULL, 0, '2022-05-19 11:17:17', 'ridargustia', 'ridargustia', '2022-05-19 16:13:55', 1, 'ridargustia', '2022-05-19 16:13:00'),
(28, '2022-05-20', '2022-05-27', 24, 1, 10, NULL, NULL, NULL, 1, '2022-05-20 09:46:57', 'admin', NULL, '2022-05-25 11:23:56', 0, NULL, NULL),
(29, '2022-05-20', '2022-05-27', 25, 2, 10, NULL, NULL, NULL, 1, '2022-05-20 09:48:52', 'admin', NULL, '2022-05-20 10:03:43', 0, NULL, NULL),
(30, '2022-05-17', '2022-05-24', 23, 1, 10, NULL, NULL, NULL, 0, '2022-05-20 11:02:05', 'admin', NULL, '2022-05-25 13:12:24', 0, NULL, NULL),
(31, '2022-05-20', '2022-05-27', 25, 1, 10, NULL, NULL, NULL, 0, '2022-05-20 13:54:36', 'admin', NULL, '2022-05-21 23:54:46', 1, 'admin', '2022-05-21 23:54:00'),
(32, '2022-05-17', '2022-05-23', 22, 1, 10, NULL, NULL, NULL, 0, '2022-05-20 13:55:21', 'admin', NULL, '2022-05-25 11:05:57', 0, NULL, NULL),
(33, '2022-05-21', '2022-05-28', 25, 2, 10, NULL, NULL, NULL, 0, '2022-05-21 23:56:14', 'admin', NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `peminjaman_id` int(11) NOT NULL,
  `arsip_id` int(11) NOT NULL,
  `anggota_id` int(11) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) DEFAULT NULL,
  `divisi_id` int(11) DEFAULT NULL,
  `bagian_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete_pengembalian` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_pengembalian`, `tgl_kembali`, `peminjaman_id`, `arsip_id`, `anggota_id`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_pengembalian`, `deleted_by`, `deleted_at`) VALUES
(12, '2022-04-22', 17, 24, 1, 10, NULL, NULL, NULL, '2022-04-22 13:48:41', 'admin', 'admin', '2022-05-11 10:08:35', 0, NULL, NULL),
(13, '2022-05-11', 15, 22, 2, 10, NULL, NULL, NULL, '2022-04-22 14:23:50', 'admin', 'admin', '2022-05-11 09:50:34', 0, NULL, NULL),
(14, '2022-05-11', 18, 25, 1, 10, NULL, NULL, NULL, '2022-05-11 11:02:23', 'admin', '', NULL, 0, NULL, NULL),
(15, '2022-05-11', 19, 25, 1, 10, NULL, NULL, NULL, '2022-05-11 11:05:30', 'admin', '', NULL, 0, NULL, NULL),
(16, '2022-05-19', 22, 24, 1, 10, NULL, NULL, NULL, '2022-05-19 08:37:11', 'ridargustia', '', NULL, 0, NULL, NULL),
(17, '2022-05-20', 29, 25, 2, 10, NULL, NULL, NULL, '2022-05-20 10:03:43', 'admin', '', NULL, 0, NULL, NULL),
(18, '2022-05-25', 28, 24, 1, 10, NULL, NULL, NULL, '2022-05-25 11:23:56', 'admin', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rak`
--

CREATE TABLE `rak` (
  `id_rak` int(11) NOT NULL,
  `rak_name` varchar(50) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `cabang_id` int(11) DEFAULT NULL,
  `divisi_id` int(11) DEFAULT NULL,
  `lokasi_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete_rak` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rak`
--

INSERT INTO `rak` (`id_rak`, `rak_name`, `instansi_id`, `cabang_id`, `divisi_id`, `lokasi_id`, `created_at`, `created_by`, `modified_by`, `modified_at`, `is_delete_rak`, `deleted_by`, `deleted_at`) VALUES
(58, '1', 10, NULL, NULL, 40, '2021-04-30 11:17:05', 'kaproditif', 'admin', '2022-01-28 10:37:06', 0, NULL, NULL),
(59, '2', 10, NULL, NULL, 40, '2021-05-05 11:03:53', 'ridargustia', 'admin', '2022-01-28 10:35:55', 0, NULL, NULL),
(62, '3', 10, NULL, NULL, 40, '2022-01-27 16:08:40', 'admin', 'admin', '2022-01-28 10:30:55', 0, NULL, NULL);

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
(7, 'Tambah Peminjaman', 'create_book', 5, 1),
(9, 'Data Peminjaman', 'index', 5, 2),
(10, 'Tambah Pengembalian', 'create', 6, 1),
(11, 'Data Pengembalian', 'index', 6, 2),
(12, 'Tambah Buku', 'create', 7, 1),
(13, 'Data Buku', 'index', 7, 2),
(14, 'Tambah Rak', 'create', 8, 1),
(15, 'Data Rak', 'index', 8, 2),
(16, 'Tambah Baris', 'create', 9, 1),
(17, 'Data Baris', 'index', 9, 2),
(20, 'Recycle Bin', 'deleted_list', 7, 5),
(21, 'Recycle Bin', 'deleted_list', 5, 3),
(22, 'Recycle Bin', 'deleted_list', 6, 3),
(23, 'Recycle Bin', 'deleted_list', 9, 3),
(24, 'Recycle Bin', 'deleted_list', 8, 3),
(29, 'Tambah Program Studi', 'create', 13, 1),
(30, 'Data Program Studi', 'index', 13, 2),
(31, 'Tambah Perguruan Tinggi', 'create', 14, 1),
(32, 'Data Perguruan Tinggi', 'index', 14, 2),
(33, 'Recycle Bin', 'deleted_list', 13, 3),
(36, 'Recycle Bin', 'deleted_list', 14, 3),
(37, 'Tambah Fakultas', 'create', 16, 1),
(38, 'Data Fakultas', 'index', 16, 2),
(39, 'Tambah Lokasi Buku', 'create', 15, 1),
(40, 'Data Lokasi Buku', 'index', 15, 2),
(41, 'Recycle Bin', 'deleted_list', 16, 3),
(42, 'Recycle Bin', 'deleted_list', 15, 3),
(46, 'Tambah Divisi', 'create', 17, 1),
(47, 'Data Divisi', 'index', 17, 2),
(48, 'Recycle Bin', 'deleted_list', 17, 3),
(49, 'Tambah Anggota', 'create', 18, 1),
(50, 'Data Anggota', 'index', 18, 2),
(51, 'Recycle Bin', 'deleted_list', 18, 3);

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
  `cabang_id` int(11) DEFAULT NULL,
  `divisi_id` int(11) DEFAULT NULL,
  `bagian_id` int(11) DEFAULT NULL,
  `birthdate` varchar(100) NOT NULL,
  `birthplace` varchar(100) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `address` mediumtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `photo` mediumtext NOT NULL,
  `photo_thumb` mediumtext NOT NULL,
  `ip_add_reg` varchar(50) NOT NULL,
  `code_activation` varchar(50) DEFAULT NULL,
  `code_forgotten` varchar(50) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_users`, `name`, `instansi_id`, `cabang_id`, `divisi_id`, `bagian_id`, `birthdate`, `birthplace`, `gender`, `address`, `phone`, `email`, `username`, `password`, `usertype_id`, `is_active`, `photo`, `photo_thumb`, `ip_add_reg`, `code_activation`, `code_forgotten`, `last_login`, `created_by`, `created_at`, `modified_by`, `modified_at`, `is_delete`, `deleted_by`, `deleted_at`) VALUES
(51, 'Admin', 10, 50, 39, 1, '02/16/1994', 'Yogyakarta', 1, 'Bantul, Yogyakarta', '081722390264', 'admin@gmail.com', 'admin', '$2y$10$HOhYbQVwTYwe1aeACSAtGeafcqYarJ1h5p6pRaYce.CQBSNGNaTGe', 1, 1, 'admin20220125110318.png', 'admin20220125110318_thumb.png', '::1', NULL, NULL, '2022-05-26 09:30:16', 'ridargustia', '2021-04-05 21:36:39', 'ridargustia', '2022-05-26 09:30:16', 0, NULL, NULL),
(56, 'Ridar Gustia', 11, 51, 40, 0, '', '', 1, '', '089697641301', 'ridargp@gmail.com', 'ridargustia', '$2y$10$jzdEk7MCSILBN88uffZSX.kC.nVGb7.UasJecU5c02JqSosniuW66', 5, 1, '', '', '', NULL, NULL, '2022-05-19 14:17:13', 'ridargustia', '2021-04-19 13:33:27', 'ridargustia', '2022-05-19 14:17:13', 0, NULL, NULL);

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
(654, 1, 56),
(655, 2, 56),
(656, 3, 56),
(657, 4, 56),
(658, 5, 56),
(883, 1, 57),
(884, 2, 57),
(885, 3, 57),
(886, 4, 57),
(887, 5, 57),
(888, 1, 54),
(889, 2, 54),
(890, 3, 54),
(891, 4, 54),
(892, 5, 54),
(918, 1, 51),
(919, 2, 51),
(920, 3, 51),
(921, 4, 51),
(922, 5, 51);

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
(5, 'GrandAdmin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

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
-- Indexes for table `bahasa`
--
ALTER TABLE `bahasa`
  ADD PRIMARY KEY (`id_bahasa`);

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
  ADD KEY `FK_peminjaman_users` (`anggota_id`),
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
  ADD KEY `FK_pengembalian_users` (`anggota_id`),
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
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `arsip`
--
ALTER TABLE `arsip`
  MODIFY `id_arsip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `arsip_files`
--
ALTER TABLE `arsip_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `arsip_jenis`
--
ALTER TABLE `arsip_jenis`
  MODIFY `id_arsip_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bagian`
--
ALTER TABLE `bagian`
  MODIFY `id_bagian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `bahasa`
--
ALTER TABLE `bahasa`
  MODIFY `id_bahasa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `baris`
--
ALTER TABLE `baris`
  MODIFY `id_baris` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `box`
--
ALTER TABLE `box`
  MODIFY `id_box` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cabang`
--
ALTER TABLE `cabang`
  MODIFY `id_cabang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
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
  MODIFY `id_divisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `footer`
--
ALTER TABLE `footer`
  MODIFY `id_footer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `instansi`
--
ALTER TABLE `instansi`
  MODIFY `id_instansi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `jenis_arsip`
--
ALTER TABLE `jenis_arsip`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log_queries`
--
ALTER TABLE `log_queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1752;
--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `map`
--
ALTER TABLE `map`
  MODIFY `id_map` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `menu_access`
--
ALTER TABLE `menu_access`
  MODIFY `id_menu_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;
--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `rak`
--
ALTER TABLE `rak`
  MODIFY `id_rak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `users_data_access`
--
ALTER TABLE `users_data_access`
  MODIFY `id_users_data_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=923;
--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id_usertype` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
  ADD CONSTRAINT `FK_peminjaman_cabang` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_peminjaman_divisi` FOREIGN KEY (`divisi_id`) REFERENCES `divisi` (`id_divisi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `FK_pengembalian_cabang` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pengembalian_divisi` FOREIGN KEY (`divisi_id`) REFERENCES `divisi` (`id_divisi`) ON DELETE CASCADE ON UPDATE CASCADE;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
