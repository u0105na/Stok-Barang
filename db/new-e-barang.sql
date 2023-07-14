/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - e-barang
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`e-barang` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `e-barang`;

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(11) DEFAULT NULL,
  `nama_barang` varchar(30) DEFAULT NULL,
  `qty_paket` int(10) DEFAULT NULL,
  `harga_paket` int(11) DEFAULT NULL,
  `id_kategori_barang` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_barang`),
  KEY `id_kategori_barang` (`id_kategori_barang`),
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori_barang`) REFERENCES `kategori_barang` (`id_kategori_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `barang` */

insert  into `barang`(`id_barang`,`kode_barang`,`nama_barang`,`qty_paket`,`harga_paket`,`id_kategori_barang`) values 
(11,'KDM006','aaaa',3333,3322,1);

/*Table structure for table `barang_keluar` */

DROP TABLE IF EXISTS `barang_keluar`;

CREATE TABLE `barang_keluar` (
  `id_barang_keluar` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang_keluar` varchar(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `id_barang_masuk` int(11) DEFAULT NULL,
  `tgl_barang_keluar` date DEFAULT NULL,
  `total_barang_keluar` int(10) DEFAULT NULL,
  `harga_total_keluar` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_barang_keluar`),
  KEY `id_barang` (`id_barang`),
  KEY `id_barang_masuk` (`id_barang_masuk`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `barang_keluar` */

insert  into `barang_keluar`(`id_barang_keluar`,`kode_barang_keluar`,`id_barang`,`id_barang_masuk`,`tgl_barang_keluar`,`total_barang_keluar`,`harga_total_keluar`) values 
(32,'KBK001',1,25,'2023-03-21',10,10);

/*Table structure for table `barang_masuk` */

DROP TABLE IF EXISTS `barang_masuk`;

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang_masuk` varchar(10) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `kts_satuan` int(10) DEFAULT NULL,
  `tgl_barang_masuk` date DEFAULT NULL,
  `tgl_barang_expired` date DEFAULT NULL,
  `harga_total` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_barang_masuk`),
  KEY `id_barang` (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `barang_masuk` */

insert  into `barang_masuk`(`id_barang_masuk`,`kode_barang_masuk`,`id_barang`,`kts_satuan`,`tgl_barang_masuk`,`tgl_barang_expired`,`harga_total`) values 
(37,'DBM001',2,5,'2023-05-04','2023-05-09',15),
(38,'DBM002',2,5,'2023-05-25','2023-05-17',15),
(39,'DBM003',1,3,'2023-05-25','2023-05-09',3),
(40,'DBM004',3,0,'2023-05-25','2023-05-17',81);

/*Table structure for table `barang_return` */

DROP TABLE IF EXISTS `barang_return`;

CREATE TABLE `barang_return` (
  `id_barang_return` int(11) NOT NULL AUTO_INCREMENT,
  `total_barang_return` int(10) DEFAULT NULL,
  `kode_barang_return` varchar(10) DEFAULT NULL,
  `id_barang_masuk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_barang_return`),
  KEY `id_barang_masuk` (`total_barang_return`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `barang_return` */

insert  into `barang_return`(`id_barang_return`,`total_barang_return`,`kode_barang_return`,`id_barang_masuk`) values 
(17,10,'KBR001',30),
(18,10,'KBR002',31),
(19,9,'KBR003',40);

/*Table structure for table `barang_rusak` */

DROP TABLE IF EXISTS `barang_rusak`;

CREATE TABLE `barang_rusak` (
  `id_barang_rusak` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang_masuk` int(11) DEFAULT NULL,
  `qty_barang_rusak` int(10) DEFAULT NULL,
  `keterangan` varchar(30) DEFAULT NULL,
  `kode_barang_rusak` varchar(10) DEFAULT NULL,
  `tgl_barang_rusak` date DEFAULT NULL,
  `harga_total_rusak` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_barang_rusak`),
  KEY `id_barang` (`id_barang_masuk`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `barang_rusak` */

insert  into `barang_rusak`(`id_barang_rusak`,`id_barang_masuk`,`qty_barang_rusak`,`keterangan`,`kode_barang_rusak`,`tgl_barang_rusak`,`harga_total_rusak`) values 
(16,37,2,'aaaa','DBR001','2023-05-23',6),
(17,37,3,'Rusak','DBR002','2023-05-17',9);

/*Table structure for table `detail_barang_keluar` */

DROP TABLE IF EXISTS `detail_barang_keluar`;

CREATE TABLE `detail_barang_keluar` (
  `id_detail_barang_keluar` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang_keluar` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detail_barang_keluar`),
  KEY `id_barang_keluar` (`id_barang_keluar`),
  CONSTRAINT `detail_barang_keluar_ibfk_1` FOREIGN KEY (`id_barang_keluar`) REFERENCES `barang_keluar` (`id_barang_keluar`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detail_barang_keluar` */

insert  into `detail_barang_keluar`(`id_detail_barang_keluar`,`id_barang_keluar`) values 
(1,32);

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `kategori_barang` */

DROP TABLE IF EXISTS `kategori_barang`;

CREATE TABLE `kategori_barang` (
  `id_kategori_barang` int(11) NOT NULL AUTO_INCREMENT,
  `kode_kategori_barang` varchar(11) DEFAULT NULL,
  `kategori_barang` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_kategori_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `kategori_barang` */

insert  into `kategori_barang`(`id_kategori_barang`,`kode_kategori_barang`,`kategori_barang`) values 
(1,'KDB001','Drinkaaa');

/*Table structure for table `laporan` */

DROP TABLE IF EXISTS `laporan`;

CREATE TABLE `laporan` (
  `id_laporan` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang` int(11) DEFAULT NULL,
  `id_barang_masuk` int(11) DEFAULT NULL,
  `id_barang_keluar` int(11) DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `id_barang_rusak` int(11) DEFAULT NULL,
  `id_barang_return` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  KEY `id_barang` (`id_barang`),
  KEY `id_barang_masuk` (`id_barang_masuk`),
  KEY `id_barang_keluar` (`id_barang_keluar`),
  KEY `id_supplier` (`id_supplier`),
  KEY `id_barang_rusak` (`id_barang_rusak`),
  KEY `id_barang_return` (`id_barang_return`),
  CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`id_barang_masuk`) REFERENCES `barang_masuk` (`id_barang_masuk`),
  CONSTRAINT `laporan_ibfk_3` FOREIGN KEY (`id_barang_keluar`) REFERENCES `barang_keluar` (`id_barang_keluar`),
  CONSTRAINT `laporan_ibfk_4` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`),
  CONSTRAINT `laporan_ibfk_5` FOREIGN KEY (`id_barang_rusak`) REFERENCES `barang_rusak` (`id_barang_rusak`),
  CONSTRAINT `laporan_ibfk_6` FOREIGN KEY (`id_barang_return`) REFERENCES `barang_return` (`id_barang_return`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `laporan` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `request_barang` */

DROP TABLE IF EXISTS `request_barang`;

CREATE TABLE `request_barang` (
  `id_request_barang` int(11) NOT NULL AUTO_INCREMENT,
  `kode_request_barang` varchar(11) DEFAULT NULL,
  `nama_barang` varchar(30) DEFAULT NULL,
  `kts_satuan` int(11) DEFAULT NULL,
  `tgl_request_barang` date DEFAULT NULL,
  `status_request` int(11) DEFAULT NULL,
  `id_kategori_barang` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_request_barang`),
  KEY `id_kategori_barang` (`id_kategori_barang`),
  CONSTRAINT `request_barang_ibfk_1` FOREIGN KEY (`id_kategori_barang`) REFERENCES `kategori_barang` (`id_kategori_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `request_barang` */

insert  into `request_barang`(`id_request_barang`,`kode_request_barang`,`nama_barang`,`kts_satuan`,`tgl_request_barang`,`status_request`,`id_kategori_barang`) values 
(16,'RQ001','aaaa',3333,'2023-06-14',3,1);

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL AUTO_INCREMENT,
  `kode_supplier` varchar(10) DEFAULT NULL,
  `nama_supplier` varchar(30) DEFAULT NULL,
  `alamat_supplier` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `supplier` */

insert  into `supplier`(`id_supplier`,`kode_supplier`,`nama_supplier`,`alamat_supplier`) values 
(2,'SP001','aaaaa','rrrrrrrrrr');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`username`,`email`,`password`) values 
(1,'Superadmin','admin','admin@mail.com','ef4dbc1b3dcddea1ed05b40126646d1c'),
(6,'asdasda','adasdas','adasd','50f84daf3a6dfd6a9f20c9f8ef428942');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
