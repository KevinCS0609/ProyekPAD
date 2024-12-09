/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - db_proyek_pad
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_proyek_pad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `db_proyek_pad`;

/*Table structure for table `detail_promo` */

DROP TABLE IF EXISTS `detail_promo`;

CREATE TABLE `detail_promo` (
  `id_detail_promo` int(11) NOT NULL AUTO_INCREMENT,
  `id_promo` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `id_merk` int(11) DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `diskon` decimal(5,2) DEFAULT NULL,
  `harga_final` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detail_promo`),
  KEY `fk_promo` (`id_promo`),
  KEY `fk_promo_produk` (`id_produk`),
  KEY `fk_promo_merk` (`id_merk`),
  CONSTRAINT `fk_promo` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`),
  CONSTRAINT `fk_promo_merk` FOREIGN KEY (`id_merk`) REFERENCES `merk` (`id_merk`),
  CONSTRAINT `fk_promo_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detail_promo` */

/*Table structure for table `dtrans` */

DROP TABLE IF EXISTS `dtrans`;

CREATE TABLE `dtrans` (
  `id_dtrans` int(11) NOT NULL AUTO_INCREMENT,
  `id_htrans` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `nama_produk` varchar(255) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `diskon` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_dtrans`),
  KEY `fk_htrans` (`id_htrans`),
  KEY `fk_produk` (`id_produk`),
  CONSTRAINT `fk_htrans` FOREIGN KEY (`id_htrans`) REFERENCES `htrans` (`id_htrans`),
  CONSTRAINT `fk_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dtrans` */

/*Table structure for table `htrans` */

DROP TABLE IF EXISTS `htrans`;

CREATE TABLE `htrans` (
  `id_htrans` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `tanggal_transaksi` datetime DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `grandtotal` decimal(10,2) DEFAULT NULL,
  `pajak` decimal(10,2) DEFAULT NULL,
  `metode_pembayaran` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_htrans`),
  KEY `fk_pegawai` (`id_pegawai`),
  CONSTRAINT `fk_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `htrans` */

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `kategori` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL AUTO_INCREMENT,
  `nama_member` varchar(255) DEFAULT NULL,
  `nomor_hp` varchar(15) DEFAULT NULL,
  `tanggal_daftar` date DEFAULT NULL,
  `status` enum('active','inactive','suspended','expired') DEFAULT 'inactive',
  `tanggal_expired` date DEFAULT NULL,
  PRIMARY KEY (`id_member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `member` */

/*Table structure for table `merk` */

DROP TABLE IF EXISTS `merk`;

CREATE TABLE `merk` (
  `id_merk` int(11) NOT NULL AUTO_INCREMENT,
  `nama_merk` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id_merk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `merk` */

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pegawai` varchar(255) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `gaji` decimal(10,2) DEFAULT NULL,
  `tanggal_gabung` date DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pegawai` */

/*Table structure for table `pembayaran` */

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `id_metode` int(11) NOT NULL,
  `nama_pembayaran` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_metode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pembayaran` */

/*Table structure for table `produk` */

DROP TABLE IF EXISTS `produk`;

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(225) DEFAULT NULL,
  `id_merk` int(11) DEFAULT NULL,
  `kategori` int(11) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  PRIMARY KEY (`id_produk`),
  KEY `fk_merk` (`id_merk`),
  KEY `fk_produk_kategori` (`kategori`),
  CONSTRAINT `fk_merk` FOREIGN KEY (`id_merk`) REFERENCES `merk` (`id_merk`),
  CONSTRAINT `fk_produk_kategori` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `produk` */

/*Table structure for table `promo` */

DROP TABLE IF EXISTS `promo`;

CREATE TABLE `promo` (
  `id_promo` int(11) NOT NULL AUTO_INCREMENT,
  `nama_promo` varchar(255) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `syarat_ketentuan` text DEFAULT NULL,
  `status` enum('active','inactive','pending','expired') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `promo` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
