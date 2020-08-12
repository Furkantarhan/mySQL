-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.30-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema vt_ders
--

CREATE DATABASE IF NOT EXISTS vt_ders;
USE vt_ders;

--
-- Definition of table `bolumler`
--

DROP TABLE IF EXISTS `bolumler`;
CREATE TABLE `bolumler` (
  `bolumno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bolumad` varchar(45) NOT NULL,
  `fakulteno` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bolumno`),
  KEY `FK_bolumler_1` (`fakulteno`),
  CONSTRAINT `FK_bolumler_1` FOREIGN KEY (`fakulteno`) REFERENCES `fakulteler` (`fakulteno`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bolumler`
--

/*!40000 ALTER TABLE `bolumler` DISABLE KEYS */;
INSERT INTO `bolumler` (`bolumno`,`bolumad`,`fakulteno`) VALUES 
 (10,'Sınıf Öğretmenliği',1),
 (15,'Matematik Öğretmenliği',1),
 (20,'Okul Öğrencisi Öğretmenliği',1),
 (30,'Kimya',5),
 (40,'Biyoloji',5),
 (50,'Tarih',5),
 (60,'Fizik',5),
 (70,'Felsefe',5),
 (90,'Müzik',6),
 (100,'Resim',6),
 (120,'Bilgisayar Mühendisliği',3),
 (125,'Elektrik Mühendisliği',3),
 (130,'Bilgisayar Öğretmenliği',1),
 (180,'Tıp',8);
/*!40000 ALTER TABLE `bolumler` ENABLE KEYS */;


--
-- Definition of table `dersler`
--

DROP TABLE IF EXISTS `dersler`;
CREATE TABLE `dersler` (
  `derskodu` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dersadi` varchar(45) NOT NULL,
  `teorikkredi` int(10) unsigned NOT NULL,
  `uygulamakredi` int(10) unsigned NOT NULL,
  PRIMARY KEY (`derskodu`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dersler`
--

/*!40000 ALTER TABLE `dersler` DISABLE KEYS */;
INSERT INTO `dersler` (`derskodu`,`dersadi`,`teorikkredi`,`uygulamakredi`) VALUES 
 (15,'matematik',3,0),
 (25,'fizik',3,1),
 (30,'programlama',3,2),
 (40,'veritabanı',3,2),
 (50,'TBT',3,1);
/*!40000 ALTER TABLE `dersler` ENABLE KEYS */;


--
-- Definition of table `fakulteler`
--

DROP TABLE IF EXISTS `fakulteler`;
CREATE TABLE `fakulteler` (
  `fakulteno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fakultead` varchar(45) NOT NULL,
  PRIMARY KEY (`fakulteno`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fakulteler`
--

/*!40000 ALTER TABLE `fakulteler` DISABLE KEYS */;
INSERT INTO `fakulteler` (`fakulteno`,`fakultead`) VALUES 
 (1,'Teknik Eğitim Fakültesi'),
 (3,'Mühendislik Fakültesi'),
 (4,'Orman Fakültesi'),
 (5,'Fen Edebiyat Fakültesi'),
 (6,'Eğitim Fakültesi'),
 (7,'İktisadi ve İdari Bilimler Fakultesi'),
 (8,'Tıp Fakultesi');
/*!40000 ALTER TABLE `fakulteler` ENABLE KEYS */;


--
-- Definition of table `notlar`
--

DROP TABLE IF EXISTS `notlar`;
CREATE TABLE `notlar` (
  `ogrno` int(10) unsigned NOT NULL,
  `derskodu` int(10) unsigned NOT NULL,
  `vize` int(10) unsigned NOT NULL,
  `final` int(10) unsigned NOT NULL,
  `but` int(10) unsigned NOT NULL,
  `durum` varchar(45) NOT NULL,
  KEY `FK_notlar_1` (`ogrno`),
  KEY `FK_notlar_2` (`derskodu`),
  CONSTRAINT `FK_notlar_1` FOREIGN KEY (`ogrno`) REFERENCES `ogrenciler` (`ogrno`),
  CONSTRAINT `FK_notlar_2` FOREIGN KEY (`derskodu`) REFERENCES `dersler` (`derskodu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notlar`
--

/*!40000 ALTER TABLE `notlar` DISABLE KEYS */;
INSERT INTO `notlar` (`ogrno`,`derskodu`,`vize`,`final`,`but`,`durum`) VALUES 
 (12,40,56,85,15,'0'),
 (12,50,71,85,80,'0'),
 (15,40,21,65,70,'0'),
 (15,30,61,70,70,'0'),
 (22,30,100,100,90,'0'),
 (22,50,66,75,75,'0'),
 (28,25,100,50,60,'0'),
 (66,30,91,50,80,'0'),
 (85,15,90,40,75,'0'),
 (99,15,60,70,55,'0'),
 (91,40,10,53,60,'0'),
 (29,40,80,100,100,'0'),
 (29,30,70,90,60,'0');
/*!40000 ALTER TABLE `notlar` ENABLE KEYS */;


--
-- Definition of table `ogrenciler`
--

DROP TABLE IF EXISTS `ogrenciler`;
CREATE TABLE `ogrenciler` (
  `ogrno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ograd` varchar(45) NOT NULL,
  `ogrsoyad` varchar(45) NOT NULL,
  `cinsiyet` varchar(45) NOT NULL,
  `dogumtarihi` date NOT NULL,
  `bolumkod` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ogrno`),
  KEY `FK_ogrenciler_1` (`bolumkod`),
  CONSTRAINT `FK_ogrenciler_1` FOREIGN KEY (`bolumkod`) REFERENCES `bolumler` (`bolumno`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ogrenciler`
--

/*!40000 ALTER TABLE `ogrenciler` DISABLE KEYS */;
INSERT INTO `ogrenciler` (`ogrno`,`ograd`,`ogrsoyad`,`cinsiyet`,`dogumtarihi`,`bolumkod`) VALUES 
 (2,'Mehmet','yılmaz','erkek','1988-12-05',120),
 (5,'ahmet','kaya','erkek','1965-11-12',30),
 (6,'mahmut','solmaz','erkek','1987-02-25',100),
 (12,'aykut','saka','erkek','1990-05-29',60),
 (15,'arif','sakarya','erkek','1985-02-11',60),
 (22,'ali veli','solaz','erkek','1974-05-05',100),
 (25,'Halime','Avcı','Bayan','1982-09-01',90),
 (28,'suna','kaya','bayan','1992-11-11',120),
 (29,'emine','solmaz','bayan','1986-03-02',60),
 (30,'fatma','yıldırım','bayan','2000-05-03',10),
 (32,'Alime','Kocabaş','Bayan','1992-01-02',50),
 (66,'idil','kayapınar','bayan','1968-06-05',15),
 (70,'burhanettin','gümüş','erkek','1967-12-12',20),
 (71,'hatice','güneş','bayan','1971-10-06',30),
 (72,'Hatice','Güngör','Bayan','1965-04-13',40),
 (80,'Arif','Doğan','Erkek','1945-03-03',60),
 (83,'Seda','Savcı','Bayan','1974-08-09',90),
 (85,'Veli','Doğan','Erkek','1978-09-06',70),
 (88,'Ali','olgun','Erkek','1975-04-22',120),
 (90,'Serdar','karaman','Erkek','1999-10-10',10),
 (91,'Selami','akkaya','Erkek','1987-05-18',20),
 (92,'Merve','sarp','Bayan','1984-08-14',50),
 (93,'Bülent','kaya','Erkek','1989-05-18',90),
 (94,'Sinan','karaca','Erkek','1974-08-21',100),
 (95,'Emrah','yener','Erkek','1999-05-12',180),
 (96,'Ali','veli','Erkek','1996-05-03',120),
 (97,'Fatma','yılmaz','Bayan','1998-05-18',50),
 (98,'Mehmet','kayalı','Erkek','1997-05-18',20),
 (99,'Memnune','solmaz','Bayan','1999-05-18',10),
 (100,'Salih','durmaz','Erkek','1991-08-18',50);
/*!40000 ALTER TABLE `ogrenciler` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
