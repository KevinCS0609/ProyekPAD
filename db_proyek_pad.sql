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
  `status` enum('Active') DEFAULT NULL,
  PRIMARY KEY (`id_account`),
  KEY `fk_account_pegawai` (`id_pegawai`),
  CONSTRAINT `fk_account_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `account` */

insert  into `account`(`id_account`,`id_pegawai`,`username`,`password`,`status`) values 
(1,1,'Kace','12345','Active'),
(2,2,'Matt','12345','Active');

/*Table structure for table `applied_discount` */

DROP TABLE IF EXISTS `applied_discount`;

CREATE TABLE `applied_discount` (
  `id_applied` int(11) NOT NULL AUTO_INCREMENT,
  `id_dtrans` int(11) NOT NULL,
  `id_promo` int(11) DEFAULT NULL COMMENT 'Dari promo regular',
  `id_member_rule` int(11) DEFAULT NULL COMMENT 'Dari member discount',
  `nilai_diskon` decimal(10,2) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_applied`),
  KEY `id_dtrans` (`id_dtrans`),
  KEY `id_promo` (`id_promo`),
  KEY `id_member_rule` (`id_member_rule`),
  CONSTRAINT `applied_discount_ibfk_1` FOREIGN KEY (`id_dtrans`) REFERENCES `dtrans` (`id_dtrans`),
  CONSTRAINT `applied_discount_ibfk_2` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`),
  CONSTRAINT `applied_discount_ibfk_3` FOREIGN KEY (`id_member_rule`) REFERENCES `member_discount_rules` (`id_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `applied_discount` */

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dtrans` */

insert  into `dtrans`(`id_dtrans`,`id_htrans`,`id_produk`,`nama_produk`,`jumlah`,`subtotal`,`diskon`) values 
(1,1,1,'Tas Mini Serbaguna',5,225000.00,0.00),
(2,2,2,'Bando Anak Warna-Warni',5,125000.00,12500.00),
(3,3,4,'Gantungan Kunci Karakter',5,50000.00,2500.00),
(4,4,2,'Bando Anak Warna-Warni',5,125000.00,12500.00),
(5,5,2,'Bando Anak Warna-Warni',5,125000.00,12500.00),
(6,6,3,'Jepit Rambut Elegan',5,75000.00,0.00),
(7,7,4,'Gantungan Kunci Karakter',5,50000.00,2500.00),
(8,8,6,'Pensil Mekanik 0.5',5,75000.00,7500.00),
(9,9,2,'Bando Anak Warna-Warni',4,100000.00,10000.00),
(10,9,8,'Highlighter Warna-Warni',2,50000.00,5000.00),
(11,10,1,'Tas Mini Serbaguna',5,225000.00,22500.00);

/*Table structure for table `htrans` */

DROP TABLE IF EXISTS `htrans`;

CREATE TABLE `htrans` (
  `id_htrans` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) NOT NULL,
  `id_member` varchar(255) DEFAULT NULL,
  `tanggal_transaksi` datetime DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `grandtotal` decimal(10,2) DEFAULT NULL,
  `pajak` decimal(10,2) DEFAULT NULL,
  `metode_pembayaran` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_htrans`),
  KEY `fk_pegawai` (`id_pegawai`),
  CONSTRAINT `fk_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `htrans` */

insert  into `htrans`(`id_htrans`,`id_pegawai`,`id_member`,`tanggal_transaksi`,`subtotal`,`grandtotal`,`pajak`,`metode_pembayaran`) values 
(1,1,NULL,'2025-01-08 10:17:05',249750.00,249750.00,0.00,2),
(2,1,NULL,'2025-01-08 11:07:37',125000.00,132500.00,13750.00,1),
(3,1,NULL,'2025-01-08 12:02:29',50000.00,53000.00,5500.00,3),
(4,1,NULL,'2025-01-08 13:00:05',125000.00,138750.00,13750.00,1),
(5,1,NULL,'2025-01-09 10:46:52',125000.00,138750.00,13750.00,2),
(6,1,NULL,'2025-01-09 10:55:52',75000.00,83250.00,8250.00,2),
(7,2,NULL,'2025-01-09 10:56:50',50000.00,55500.00,5500.00,1),
(8,1,NULL,'2025-01-09 11:03:45',75000.00,83250.00,8250.00,3),
(9,2,NULL,'2025-01-09 13:49:16',150000.00,166500.00,16500.00,3),
(10,1,NULL,'2025-01-09 13:52:34',225000.00,249750.00,24750.00,3);

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
  `biaya_registrasi` decimal(10,2) DEFAULT NULL COMMENT 'Biaya pendaftaran membership',
  `status` enum('Active','Expired') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `jenis_member` */

insert  into `jenis_member`(`id`,`nama_member`,`lifetime`,`description`,`expired_date`,`biaya_registrasi`,`status`) values 
(1,'Platinum',1,NULL,NULL,10.00,'Active'),
(2,'12.12 Sale',0,NULL,'2025-01-01',10.00,'Expired'),
(3,'A Member',0,'System.Windows.Forms.TextBox, Text: Halo','2025-01-08',10.00,'Active'),
(4,'B Member',0,'Halo','2025-01-08',10.00,'Active');

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
  `id_member` varchar(255) NOT NULL,
  `jenis_member` int(11) DEFAULT NULL,
  `nomor_hp` varchar(15) DEFAULT NULL,
  `status` enum('active','inactive','suspended','expired') DEFAULT 'inactive',
  `tanggal_expired` date DEFAULT NULL,
  PRIMARY KEY (`id_member`),
  KEY `FK_Jenis_member` (`jenis_member`),
  CONSTRAINT `FK_Jenis_member` FOREIGN KEY (`jenis_member`) REFERENCES `jenis_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `member` */

insert  into `member`(`id_member`,`jenis_member`,`nomor_hp`,`status`,`tanggal_expired`) values 
('B 2025010901',4,'08521234567','active',NULL),
('B 2025010902',4,'08521234567','active',NULL),
('B 2025010903',4,'08521234567','active',NULL),
('B 2025010904',4,'08521234567','active',NULL),
('LT2025010101',1,'08113322771','active',NULL);

/*Table structure for table `member_discount_rules` */

DROP TABLE IF EXISTS `member_discount_rules`;

CREATE TABLE `member_discount_rules` (
  `id_rule` int(11) NOT NULL AUTO_INCREMENT,
  `id_jenis_member` int(11) NOT NULL,
  `tipe_target` enum('kategori','merk','produk') DEFAULT NULL,
  `id_target` int(11) DEFAULT NULL,
  `diskon_persen` decimal(5,2) DEFAULT NULL,
  `diskon_nilai` decimal(10,2) DEFAULT NULL,
  `excluded` tinyint(1) DEFAULT 0 COMMENT 'Produk dikecualikan dari diskon (1) atau tidak (0)',
  PRIMARY KEY (`id_rule`),
  KEY `id_jenis_member` (`id_jenis_member`),
  CONSTRAINT `member_discount_rules_ibfk_1` FOREIGN KEY (`id_jenis_member`) REFERENCES `jenis_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `member_discount_rules` */

insert  into `member_discount_rules`(`id_rule`,`id_jenis_member`,`tipe_target`,`id_target`,`diskon_persen`,`diskon_nilai`,`excluded`) values 
(3,3,'produk',1,10.00,NULL,0),
(4,4,'kategori',1,10.00,NULL,0);

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
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pegawai` */

insert  into `pegawai`(`id_pegawai`,`first_name`,`last_name`,`NIK`,`umur`,`email`,`alamat`,`kota`,`provinsi`,`jabatan`,`foto`) values 
(1,'Kevin','Christian',123456789,20,'kevin.c23@mhs.istts.ac.id','Jl.Pahlawan 1','Surabaya','Jawa Timur','Manager','D:\\Semester 3\\PAD\\Proyek\\Admin\\Manager\\Manager\\Assets\\Profile2.jpg'),
(2,'Martthew','Fernando',112233445,21,'MT2025@gmail.com','Jl.Darmo Permai Utara','Surabaya','Jawa Timur','Pegawai','D:\\Semester 3\\PAD\\Proyek\\Admin\\Manager\\Manager\\Assets\\Profile1.jpg'),
(3,'Budi','Sanjaya',123123123,40,'BudiSanjaya@gmail.com','Jl.Ngagel Jaya 10','Surabaya','Jawa Timur','Pegawai','D:\\Semester 3\\PAD\\Proyek\\Admin\\Manager\\Manager\\Assets\\Profile2.jpg');

/*Table structure for table `pembayaran` */

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `id_metode` int(11) NOT NULL,
  `nama_pembayaran` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_metode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pembayaran` */

insert  into `pembayaran`(`id_metode`,`nama_pembayaran`) values 
(1,'Cash'),
(2,'Card'),
(3,'Qris');

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
(1,'Tas Mini Serbaguna',14,3,9,45000.00,40,'Tas kecil untuk menyimpan barang-barang kecil.',NULL),
(2,'Bando Anak Warna-Warni',11,3,10,25000.00,81,'Bando dengan desain warna-warni untuk anak.',NULL),
(3,'Jepit Rambut Elegan',12,3,11,15000.00,195,'Jepit rambut dengan hiasan elegan.',NULL),
(4,'Gantungan Kunci Karakter',13,3,12,10000.00,290,'Gantungan kunci dengan karakter unik.',NULL),
(5,'Kalung Fashion Modis',15,3,13,75000.00,80,'Kalung dengan desain modis untuk berbagai acara.',NULL),
(6,'Pensil Mekanik 0.5',1,1,1,15000.00,95,'Pensil mekanik dengan grip nyaman untuk menulis.',NULL),
(7,'Pulpen Gel Hitam',2,1,2,8000.00,300,'Pulpen gel dengan tinta hitam pekat.',NULL),
(8,'Highlighter Warna-Warni',3,1,2,25000.00,48,'Set highlighter dengan warna cerah.',NULL),
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
  `Nama_Promo` varchar(255) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `status` enum('active','inactive','pending','expired') NOT NULL DEFAULT 'pending',
  `min_pembelian` decimal(10,2) DEFAULT NULL COMMENT 'Minimum pembelian untuk promo',
  `max_diskon` decimal(10,2) DEFAULT NULL COMMENT 'Maksimum nilai diskon',
  `syarat_member` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_promo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `promo` */

insert  into `promo`(`id_promo`,`Nama_Promo`,`expired_date`,`status`,`min_pembelian`,`max_diskon`,`syarat_member`) values 
(1,'New Year Promo 2024','2025-01-07','active',NULL,NULL,NULL);

/*Table structure for table `promo_rules` */

DROP TABLE IF EXISTS `promo_rules`;

CREATE TABLE `promo_rules` (
  `id_rule` int(11) NOT NULL AUTO_INCREMENT,
  `id_promo` int(11) NOT NULL,
  `tipe_target` enum('kategori','merk','produk') NOT NULL COMMENT 'Target diskon berdasarkan apa',
  `id_target` int(11) NOT NULL COMMENT 'ID dari kategori/merk/produk yang ditarget',
  `diskon_persen` decimal(5,2) DEFAULT NULL COMMENT 'Besaran diskon dalam persen',
  PRIMARY KEY (`id_rule`),
  KEY `id_promo` (`id_promo`),
  CONSTRAINT `promo_rules_ibfk_1` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `promo_rules` */

insert  into `promo_rules`(`id_rule`,`id_promo`,`tipe_target`,`id_target`,`diskon_persen`) values 
(1,1,'kategori',1,10.00),
(2,1,'produk',1,10.00),
(3,1,'produk',2,10.00),
(4,1,'produk',4,5.00);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
