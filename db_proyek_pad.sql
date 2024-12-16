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

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id_account` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_account`),
  KEY `fk_account_pegawai` (`id_pegawai`),
  CONSTRAINT `fk_account_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `account` */

insert  into `account`(`id_account`,`id_pegawai`,`username`,`password`) values 
(1,1,'Kace','12345');

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

/*Table structure for table `jenis` */

DROP TABLE IF EXISTS `jenis`;

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(100) NOT NULL,
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `jenis` */

insert  into `jenis`(`id_jenis`,`nama_jenis`) values 
(1,'Pensil dan Alat Tulis'),
(2,'Pulpen dan Spidol'),
(3,'Buku dan Kertas'),
(4,'Alat Geometri'),
(5,'Headset Gaming'),
(6,'Mouse Gaming'),
(7,'Keyboard Gaming'),
(8,'USB dan Flashdisk'),
(9,'Tas'),
(10,'Bando'),
(11,'Jepit Rambut'),
(12,'Gantungan Kunci'),
(13,'Kalung Fashion');

/*Table structure for table `jenis_member` */

DROP TABLE IF EXISTS `jenis_member`;

CREATE TABLE `jenis_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_member` varchar(255) DEFAULT NULL,
  `lifetime` tinyint(1) DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `jenis_member` */

insert  into `jenis_member`(`id`,`nama_member`,`lifetime`,`description`,`expired_date`) values 
(1,'Platinum',1,NULL,NULL),
(2,'12.12 Sale',0,NULL,'2025-01-01');

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `kategori` */

insert  into `kategori`(`id_kategori`,`nama_kategori`) values 
(1,'Alat Tulis'),
(2,'Electronic'),
(3,'Aksesoris');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nomor_hp` varchar(15) DEFAULT NULL,
  `tanggal_daftar` datetime DEFAULT NULL,
  `status` enum('active','inactive','suspended','expired') DEFAULT 'inactive',
  `tanggal_expired` date DEFAULT NULL,
  PRIMARY KEY (`id_member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `member` */

/*Table structure for table `merk` */

DROP TABLE IF EXISTS `merk`;

CREATE TABLE `merk` (
  `id_merk` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(11) DEFAULT NULL,
  `nama_merk` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id_merk`),
  KEY `fk_merk_kategori` (`id_kategori`),
  CONSTRAINT `fk_merk_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `merk` */

insert  into `merk`(`id_merk`,`id_kategori`,`nama_merk`) values 
(1,1,'Faber-Castell'),
(2,1,'Pilot'),
(3,1,'Stabilo'),
(4,1,'Paperline'),
(5,1,'Joyko'),
(6,2,'Logitech'),
(7,2,'Razer'),
(8,2,'SteelSeries'),
(9,2,'Corsair'),
(10,2,'HyperX'),
(11,3,'Lovely'),
(12,3,'CuteCraft'),
(13,3,'AccessoriesPro'),
(14,3,'DecorMe'),
(15,3,'StylePoint');

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `NIK` int(25) DEFAULT NULL,
  `umur` int(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kota` varchar(255) DEFAULT NULL,
  `provinsi` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `gaji` decimal(10,2) DEFAULT NULL,
  `tanggal_gabung` date DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pegawai` */

insert  into `pegawai`(`id_pegawai`,`first_name`,`last_name`,`NIK`,`umur`,`email`,`alamat`,`kota`,`provinsi`,`jabatan`,`gaji`,`tanggal_gabung`) values 
(1,'Kevin','Christian',123456789,20,'kevin.c23@mhs.istts.ac.id','Jl.Pahlawan 1','Surabaya','Jawa Timur','Manager',10.00,'2024-12-12');

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
  `jenis` int(11) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_produk`),
  KEY `fk_merk` (`id_merk`),
  KEY `fk_produk_kategori` (`kategori`),
  KEY `fk_produk_jenis` (`jenis`),
  CONSTRAINT `fk_merk` FOREIGN KEY (`id_merk`) REFERENCES `merk` (`id_merk`),
  CONSTRAINT `fk_produk_jenis` FOREIGN KEY (`jenis`) REFERENCES `jenis` (`id_jenis`),
  CONSTRAINT `fk_produk_kategori` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `produk` */

insert  into `produk`(`id_produk`,`nama_produk`,`id_merk`,`kategori`,`jenis`,`harga`,`stok`,`deskripsi`,`gambar`) values 
(1,'Tas Mini Serbaguna',14,3,9,45000.00,50,'Tas kecil untuk menyimpan barang-barang kecil.',NULL),
(2,'Bando Anak Warna-Warni',11,3,10,25000.00,100,'Bando dengan desain warna-warni untuk anak.',NULL),
(3,'Jepit Rambut Elegan',12,3,11,15000.00,200,'Jepit rambut dengan hiasan elegan.',NULL),
(4,'Gantungan Kunci Karakter',13,3,12,10000.00,300,'Gantungan kunci dengan karakter unik.',NULL),
(5,'Kalung Fashion Modis',15,3,13,75000.00,80,'Kalung dengan desain modis untuk berbagai acara.',NULL),
(6,'Pensil Mekanik 0.5',1,1,1,15000.00,100,'Pensil mekanik dengan grip nyaman untuk menulis.',NULL),
(7,'Pulpen Gel Hitam',2,1,2,8000.00,300,'Pulpen gel dengan tinta hitam pekat.',NULL),
(8,'Highlighter Warna-Warni',3,1,2,25000.00,50,'Set highlighter dengan warna cerah.',NULL),
(9,'Kertas HVS A4 80gsm',4,1,3,45000.00,120,'Kertas HVS ukuran A4, berat 80gsm.',NULL),
(10,'Buku Catatan Hardcover',5,1,3,30000.00,100,'Buku catatan hardcover ukuran A5.',NULL),
(11,'Mouse Gaming Logitech G502',6,2,6,650000.00,50,'Mouse gaming dengan DPI tinggi dan 11 tombol.',NULL),
(12,'Keyboard Mekanik Corsair K70',9,2,7,1500000.00,30,'Keyboard mekanik dengan lampu RGB dan switch Cherry MX.',NULL),
(13,'Headset Gaming HyperX Cloud II',10,2,5,1250000.00,40,'Headset gaming dengan surround sound 7.1.',NULL),
(14,'USB Flashdisk 64GB',8,2,8,120000.00,200,'Flashdisk USB 3.0 dengan kapasitas 64GB.',NULL),
(15,'Cooling Pad Laptop',7,2,8,300000.00,50,'Cooling pad dengan kipas besar dan LED.',NULL),
(16,'Tas Mini Serbaguna',14,3,9,45000.00,50,'Tas kecil untuk menyimpan barang-barang kecil.',NULL),
(17,'Bando Anak Warna-Warni',11,3,10,25000.00,100,'Bando dengan desain warna-warni untuk anak.',NULL),
(18,'Jepit Rambut Elegan',12,3,11,15000.00,200,'Jepit rambut dengan hiasan elegan.',NULL),
(19,'Gantungan Kunci Karakter',13,3,12,10000.00,300,'Gantungan kunci dengan karakter unik.',NULL),
(20,'Kalung Fashion Modis',15,3,13,75000.00,80,'Kalung dengan desain modis untuk berbagai acara.',NULL);

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
