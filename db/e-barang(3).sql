-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2023 at 04:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `kode_barang` varchar(11) DEFAULT NULL,
  `nama_barang` varchar(30) DEFAULT NULL,
  `qty_paket` int(10) DEFAULT NULL,
  `harga_paket` int(11) DEFAULT NULL,
  `id_kategori_barang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `kode_barang`, `nama_barang`, `qty_paket`, `harga_paket`, `id_kategori_barang`) VALUES
(12, 'KDM001', 'kkkk', 33, 110, 1),
(15, 'KDM002', 'ssssssaaaaa', 44, 33333, 1);

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barang_keluar` int(11) NOT NULL,
  `kode_barang_keluar` varchar(11) DEFAULT NULL,
  `nama_barang` varchar(30) DEFAULT NULL,
  `kategori_barang` varchar(30) DEFAULT NULL,
  `kts_satuan` int(11) DEFAULT NULL,
  `harga_total` int(11) DEFAULT NULL,
  `harga_paket` int(10) DEFAULT NULL,
  `tgl_barang_keluar` date DEFAULT NULL,
  `tgl_barang_expired` date DEFAULT NULL,
  `id_kategori_barang` int(11) DEFAULT NULL,
  `id_request_barang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_barang_keluar`, `kode_barang_keluar`, `nama_barang`, `kategori_barang`, `kts_satuan`, `harga_total`, `harga_paket`, `tgl_barang_keluar`, `tgl_barang_expired`, `id_kategori_barang`, `id_request_barang`) VALUES
(81, 'KBK001', 'Sunlight', 'Drinkaaa', 1, 10, 10, '2023-06-28', '2023-07-08', 1, 30),
(82, 'KBK002', 'Kopi', 'Makanan', 33, 3300, 100, '2023-06-21', '2023-07-07', 4, 31);

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` int(11) NOT NULL,
  `kode_barang_masuk` varchar(10) DEFAULT NULL,
  `nama_barang` varchar(30) DEFAULT NULL,
  `kts_satuan` int(10) DEFAULT NULL,
  `harga_paket` int(11) DEFAULT NULL,
  `tgl_barang_masuk` date DEFAULT NULL,
  `tgl_barang_expired` date DEFAULT NULL,
  `harga_total` int(10) DEFAULT NULL,
  `id_kategori_barang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barang_masuk`, `kode_barang_masuk`, `nama_barang`, `kts_satuan`, `harga_paket`, `tgl_barang_masuk`, `tgl_barang_expired`, `harga_total`, `id_kategori_barang`) VALUES
(49, 'DBM001', 'Sunlight', 0, 10, '2023-01-05', '2023-05-09', 90, 1),
(50, 'DBM002', 'Kopi', 0, 100, '2023-06-21', '2023-07-07', 0, 4),
(51, 'DBM003', 'Kopi', 19, 100, '2023-06-15', '2023-06-12', 1900, 1);

-- --------------------------------------------------------

--
-- Table structure for table `barang_return`
--

CREATE TABLE `barang_return` (
  `id_barang_return` int(11) NOT NULL,
  `kode_barang_return` varchar(10) DEFAULT NULL,
  `nama_barang` varchar(30) DEFAULT NULL,
  `kategori_barang` varchar(30) DEFAULT NULL,
  `kts_satuan` int(11) DEFAULT NULL,
  `harga_paket` int(11) DEFAULT NULL,
  `harga_total_rusak` int(11) DEFAULT NULL,
  `tgl_barang_expired` date DEFAULT NULL,
  `keterangan` varchar(30) DEFAULT NULL,
  `id_barang_masuk` int(11) DEFAULT NULL,
  `status_return` int(11) DEFAULT NULL,
  `tgl_konfirmasi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_return`
--

INSERT INTO `barang_return` (`id_barang_return`, `kode_barang_return`, `nama_barang`, `kategori_barang`, `kts_satuan`, `harga_paket`, `harga_total_rusak`, `tgl_barang_expired`, `keterangan`, `id_barang_masuk`, `status_return`, `tgl_konfirmasi`) VALUES
(30, 'DBR001', 'Kopi', 'Drinkaaa', 1, 100, 100, '2023-06-30', 'kodok', 51, 2, NULL),
(33, 'DBR002', 'Kopi', 'Drinkaaa', 1, 100, 2000, '2023-06-12', 'kodok', 51, 2, NULL),
(34, 'DBR003', 'Kopi', 'Drinkaaa', 1, 100, 100, '2023-06-12', 'kodok', 51, 1, '2023-07-11');

-- --------------------------------------------------------

--
-- Table structure for table `barang_rusak`
--

CREATE TABLE `barang_rusak` (
  `id_barang_rusak` int(11) NOT NULL,
  `id_barang_masuk` int(11) DEFAULT NULL,
  `qty_barang_rusak` int(10) DEFAULT NULL,
  `keterangan` varchar(30) DEFAULT NULL,
  `kode_barang_rusak` varchar(10) DEFAULT NULL,
  `tgl_barang_rusak` date DEFAULT NULL,
  `harga_total_rusak` int(10) DEFAULT NULL,
  `kategori_barang` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_rusak`
--

INSERT INTO `barang_rusak` (`id_barang_rusak`, `id_barang_masuk`, `qty_barang_rusak`, `keterangan`, `kode_barang_rusak`, `tgl_barang_rusak`, `harga_total_rusak`, `kategori_barang`) VALUES
(47, 49, 1, 'Rusak', 'DBR001', '2023-06-14', 10, 'Drinkaaa');

-- --------------------------------------------------------

--
-- Table structure for table `detail_barang_keluar`
--

CREATE TABLE `detail_barang_keluar` (
  `id_detail_barang_keluar` int(11) NOT NULL,
  `id_barang_keluar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id_kategori_barang` int(11) NOT NULL,
  `kode_kategori_barang` varchar(11) DEFAULT NULL,
  `kategori_barang` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`id_kategori_barang`, `kode_kategori_barang`, `kategori_barang`) VALUES
(1, 'KDB001', 'Drinkaaa'),
(4, 'KKB002', 'Makanan');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `id_barang_masuk` int(11) DEFAULT NULL,
  `id_barang_keluar` int(11) DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `id_barang_rusak` int(11) DEFAULT NULL,
  `id_barang_return` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_barang`
--

CREATE TABLE `request_barang` (
  `id_request_barang` int(11) NOT NULL,
  `kode_request_barang` varchar(11) DEFAULT NULL,
  `nama_barang` varchar(30) DEFAULT NULL,
  `kts_satuan` int(11) DEFAULT NULL,
  `harga_paket` int(11) DEFAULT NULL,
  `harga_total_request` int(11) DEFAULT NULL,
  `tgl_barang_expired` date DEFAULT NULL,
  `tgl_request_barang` date DEFAULT NULL,
  `status_request` int(11) DEFAULT NULL,
  `id_kategori_barang` int(11) DEFAULT NULL,
  `id_barang_masuk` int(11) DEFAULT NULL,
  `keterangan` varchar(30) DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_barang`
--

INSERT INTO `request_barang` (`id_request_barang`, `kode_request_barang`, `nama_barang`, `kts_satuan`, `harga_paket`, `harga_total_request`, `tgl_barang_expired`, `tgl_request_barang`, `status_request`, `id_kategori_barang`, `id_barang_masuk`, `keterangan`) VALUES
(30, 'RQ001', 'Sunlight', 0, 10, 0, '2023-07-08', '2023-06-13', 3, 1, 49, '-'),
(31, 'RQ002', 'Kopi', 0, 100, 0, '2023-07-07', '2023-06-13', 3, 4, 50, '-'),
(32, 'RQ003', 'Kopi', 10, 100, 1000, '2023-06-30', '2023-06-22', 2, 1, 51, '-'),
(33, 'RQ004', 'Kopi', 10, 100, 1000, '2023-06-30', '2023-06-15', 1, 1, 51, '-'),
(34, 'RQ005', 'Kopi', 10, 100, 1000, '2023-06-30', '2023-06-15', 0, 1, 51, 'rusak parah'),
(35, 'RQ006', 'Kopi', 1, 100, 100, '2023-06-30', '2023-06-18', 1, 1, 51, '-');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `kode_supplier` varchar(10) DEFAULT NULL,
  `nama_supplier` varchar(30) DEFAULT NULL,
  `alamat_supplier` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `kode_supplier`, `nama_supplier`, `alamat_supplier`) VALUES
(2, 'SP001', 'aaaaa', 'rrrrrrrrrr');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('super admin','gudang','toko') NOT NULL DEFAULT 'toko'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `role`) VALUES
(1, 'Superadmin', 'admin', 'admin@mail.com', 'ef4dbc1b3dcddea1ed05b40126646d1c', 'super admin'),
(13, 'Admin Gudang', 'admin-gudang', 'admin_gudang@mail.com', 'ef4dbc1b3dcddea1ed05b40126646d1c', 'gudang'),
(14, 'Admin Toko', 'admin-toko', 'admin_toko@mail.com', 'ef4dbc1b3dcddea1ed05b40126646d1c', 'toko');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_kategori_barang` (`id_kategori_barang`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_barang_keluar`),
  ADD KEY `id_barang` (`nama_barang`),
  ADD KEY `id_barang_masuk` (`kategori_barang`),
  ADD KEY `barang_keluar_ibfk_3` (`id_kategori_barang`),
  ADD KEY `id_request_barang` (`id_request_barang`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`),
  ADD KEY `id_barang` (`nama_barang`),
  ADD KEY `id_kategori_barang` (`id_kategori_barang`);

--
-- Indexes for table `barang_return`
--
ALTER TABLE `barang_return`
  ADD PRIMARY KEY (`id_barang_return`),
  ADD KEY `id_barang_masuk` (`nama_barang`),
  ADD KEY `id_barang_masuk_2` (`kategori_barang`),
  ADD KEY `id_barang_masuk_3` (`id_barang_masuk`);

--
-- Indexes for table `barang_rusak`
--
ALTER TABLE `barang_rusak`
  ADD PRIMARY KEY (`id_barang_rusak`),
  ADD KEY `id_barang` (`id_barang_masuk`);

--
-- Indexes for table `detail_barang_keluar`
--
ALTER TABLE `detail_barang_keluar`
  ADD PRIMARY KEY (`id_detail_barang_keluar`),
  ADD KEY `id_barang_keluar` (`id_barang_keluar`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id_kategori_barang`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_barang_masuk` (`id_barang_masuk`),
  ADD KEY `id_barang_keluar` (`id_barang_keluar`),
  ADD KEY `id_supplier` (`id_supplier`),
  ADD KEY `id_barang_rusak` (`id_barang_rusak`),
  ADD KEY `id_barang_return` (`id_barang_return`);

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
-- Indexes for table `request_barang`
--
ALTER TABLE `request_barang`
  ADD PRIMARY KEY (`id_request_barang`),
  ADD KEY `id_kategori_barang` (`id_kategori_barang`),
  ADD KEY `id_barang_masuk` (`id_barang_masuk`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

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
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id_barang_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id_barang_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `barang_return`
--
ALTER TABLE `barang_return`
  MODIFY `id_barang_return` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `barang_rusak`
--
ALTER TABLE `barang_rusak`
  MODIFY `id_barang_rusak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `detail_barang_keluar`
--
ALTER TABLE `detail_barang_keluar`
  MODIFY `id_detail_barang_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id_kategori_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_barang`
--
ALTER TABLE `request_barang`
  MODIFY `id_request_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori_barang`) REFERENCES `kategori_barang` (`id_kategori_barang`);

--
-- Constraints for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_3` FOREIGN KEY (`id_kategori_barang`) REFERENCES `kategori_barang` (`id_kategori_barang`),
  ADD CONSTRAINT `barang_keluar_ibfk_4` FOREIGN KEY (`id_request_barang`) REFERENCES `request_barang` (`id_request_barang`);

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_kategori_barang`) REFERENCES `kategori_barang` (`id_kategori_barang`);

--
-- Constraints for table `barang_return`
--
ALTER TABLE `barang_return`
  ADD CONSTRAINT `barang_return_ibfk_1` FOREIGN KEY (`id_barang_masuk`) REFERENCES `barang_masuk` (`id_barang_masuk`);

--
-- Constraints for table `barang_rusak`
--
ALTER TABLE `barang_rusak`
  ADD CONSTRAINT `barang_rusak_ibfk_1` FOREIGN KEY (`id_barang_masuk`) REFERENCES `barang_masuk` (`id_barang_masuk`);

--
-- Constraints for table `detail_barang_keluar`
--
ALTER TABLE `detail_barang_keluar`
  ADD CONSTRAINT `detail_barang_keluar_ibfk_1` FOREIGN KEY (`id_barang_keluar`) REFERENCES `barang_keluar` (`id_barang_keluar`);

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`id_barang_masuk`) REFERENCES `barang_masuk` (`id_barang_masuk`),
  ADD CONSTRAINT `laporan_ibfk_3` FOREIGN KEY (`id_barang_keluar`) REFERENCES `barang_keluar` (`id_barang_keluar`),
  ADD CONSTRAINT `laporan_ibfk_4` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`),
  ADD CONSTRAINT `laporan_ibfk_5` FOREIGN KEY (`id_barang_rusak`) REFERENCES `barang_rusak` (`id_barang_rusak`),
  ADD CONSTRAINT `laporan_ibfk_6` FOREIGN KEY (`id_barang_return`) REFERENCES `barang_return` (`id_barang_return`);

--
-- Constraints for table `request_barang`
--
ALTER TABLE `request_barang`
  ADD CONSTRAINT `request_barang_ibfk_1` FOREIGN KEY (`id_kategori_barang`) REFERENCES `kategori_barang` (`id_kategori_barang`),
  ADD CONSTRAINT `request_barang_ibfk_2` FOREIGN KEY (`id_barang_masuk`) REFERENCES `barang_masuk` (`id_barang_masuk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
