-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.68-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema alisveris
--

CREATE DATABASE IF NOT EXISTS alisveris;
USE alisveris;

--
-- Definition of table `kategoriler`
--

DROP TABLE IF EXISTS `kategoriler`;
CREATE TABLE `kategoriler` (
  `k_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ad` varchar(45) NOT NULL,
  PRIMARY KEY (`k_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategoriler`
--

/*!40000 ALTER TABLE `kategoriler` DISABLE KEYS */;
INSERT INTO `kategoriler` (`k_no`,`ad`) VALUES 
 (1,'bilgisayar'),
 (2,'laptop'),
 (3,'televizyon'),
 (4,'cep telefonu'),
 (5,'kitap'),
 (6,'CD');
/*!40000 ALTER TABLE `kategoriler` ENABLE KEYS */;


--
-- Definition of table `musteriler`
--

DROP TABLE IF EXISTS `musteriler`;
CREATE TABLE `musteriler` (
  `m_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ad` varchar(45) DEFAULT NULL,
  `soyad` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `adres` varchar(45) DEFAULT NULL,
  `sehir` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`m_no`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `musteriler`
--

/*!40000 ALTER TABLE `musteriler` DISABLE KEYS */;
INSERT INTO `musteriler` (`m_no`,`ad`,`soyad`,`tel`,`email`,`adres`,`sehir`) VALUES 
 (1,'murat','koç','05054445566','muratkoc@hotmail.com','istasyon','ısparta'),
 (2,'ali','gelim','05442324567','aligelim@hotmail.com','anadolu mah','ısparta'),
 (3,'nurullah','öztürk','05323452233','nurullahozturk@gmail.com','bahcelievler','istanbul'),
 (4,'ufuk','üresin','05556786567','ufukuresin@gmail.com','kecioren','ankara'),
 (5,'ömer','işler','05465562390','omerisl@hotmail.com','karşıyaka','izmir'),
 (6,'yunus','döner','05431223456','yunusdoner@hotmail.com','yalvac','ısparta'),
 (7,'önder','yılmaz','05324553434','onderyilmaz@hotmail.com','yalvac','ısparta'),
 (8,'basak','toru','05542768455','basaktoru@hotmail.com','çevreyolu','antalya'),
 (9,'kübra','yanar','05442337989','kyanar@yahoo.com','manavgat','antalya'),
 (10,'seda','kurt','05542348455','kurtseda@yahoo.com','dedeman','antalya'),
 (11,'cem','cite','05547348455','cite@hotmail.com','güllük','antalya'),
 (12,'akın','çandır','05564423678','akincan@gmail.com','bergama','izmir'),
 (13,'halid','keskin','05433456790','halidkeskin@gmail.com','mecidiyeköy','istanbul'),
 (14,'beklan','benzer','05334568080','bekln@hotmail.com','kartal','istanbul'),
 (15,'mahmut','özdemir','05321234433','info@mahmutozdemir.com','dikmen','ankara'),
 (16,'cem','okuyan','05067779696','cemokuyan@hede.com','yalvac','ısparta'),
 (17,'arda','yuksel','05434456565','sadsda@ssad.cok','tokta','yolar'),
 (18,'yunus','keser','05445676677','yunuskeser@sdu.edu.tr','yalvac','ısparta'),
 (19,'arda','çelik','05665432322','sinanscelik@hotmail.com','keçiören','ankara');
/*!40000 ALTER TABLE `musteriler` ENABLE KEYS */;


--
-- Definition of table `satis`
--

DROP TABLE IF EXISTS `satis`;
CREATE TABLE `satis` (
  `s_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m_no` int(10) unsigned NOT NULL,
  `tarih` date NOT NULL,
  `t_fiyat` int(10) unsigned NOT NULL,
  PRIMARY KEY (`s_no`),
  KEY `FK_satis_1` (`m_no`),
  CONSTRAINT `FK_satis_1` FOREIGN KEY (`m_no`) REFERENCES `musteriler` (`m_no`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `satis`
--

/*!40000 ALTER TABLE `satis` DISABLE KEYS */;
INSERT INTO `satis` (`s_no`,`m_no`,`tarih`,`t_fiyat`) VALUES 
 (1,1,'2011-06-05',1700),
 (2,1,'2011-07-07',6600),
 (3,4,'2012-10-08',15),
 (4,6,'2012-12-11',1500),
 (5,11,'2013-01-13',1400),
 (6,15,'2013-01-14',2850),
 (7,13,'2013-02-06',200),
 (8,3,'2012-03-20',900);
/*!40000 ALTER TABLE `satis` ENABLE KEYS */;


--
-- Definition of table `satis_detay`
--

DROP TABLE IF EXISTS `satis_detay`;
CREATE TABLE `satis_detay` (
  `d_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_no` int(10) unsigned NOT NULL,
  `u_no` int(10) unsigned NOT NULL,
  `miktar` int(10) unsigned NOT NULL,
  PRIMARY KEY (`d_no`),
  KEY `FK_satis_detay_1` (`s_no`),
  KEY `FK_satis_detay_2` (`u_no`),
  CONSTRAINT `FK_satis_detay_1` FOREIGN KEY (`s_no`) REFERENCES `satis` (`s_no`),
  CONSTRAINT `FK_satis_detay_2` FOREIGN KEY (`u_no`) REFERENCES `urunler` (`u_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `satis_detay`
--

/*!40000 ALTER TABLE `satis_detay` DISABLE KEYS */;
INSERT INTO `satis_detay` (`d_no`,`s_no`,`u_no`,`miktar`) VALUES 
 (1,1,1,1),
 (2,1,2,1),
 (3,2,14,1),
 (4,2,18,1),
 (5,3,21,1),
 (6,4,11,2),
 (7,5,7,1),
 (8,6,19,1),
 (9,7,24,10),
 (10,8,2,1);
/*!40000 ALTER TABLE `satis_detay` ENABLE KEYS */;


--
-- Definition of table `urunler`
--

DROP TABLE IF EXISTS `urunler`;
CREATE TABLE `urunler` (
  `u_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `k_no` int(10) unsigned DEFAULT NULL,
  `ad` varchar(45) DEFAULT NULL,
  `fiyat` int(10) unsigned DEFAULT NULL,
  `stok` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`u_no`),
  KEY `FK_urunler_1` (`k_no`),
  CONSTRAINT `FK_urunler_1` FOREIGN KEY (`k_no`) REFERENCES `kategoriler` (`k_no`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `urunler`
--

/*!40000 ALTER TABLE `urunler` DISABLE KEYS */;
INSERT INTO `urunler` (`u_no`,`k_no`,`ad`,`fiyat`,`stok`) VALUES 
 (1,1,'Casper pc',800,12),
 (2,1,'Ibm pc',900,14),
 (3,1,'HP pc',1200,0),
 (4,1,'Toshiba pc',1600,9),
 (5,1,'Exper pc',1250,10),
 (6,2,'sony laptop',2100,5),
 (7,2,'HP laptop',1400,7),
 (8,2,'Toshiba laptop',1600,0),
 (9,3,'Vestel Plazma tv',2200,4),
 (10,3,'Samsung tv',800,13),
 (11,3,'Philips tv',750,5),
 (12,3,'Sony tv',900,16),
 (13,3,'Samsung Plazma tv',3400,0),
 (14,3,'LG Plazma tv',5600,5),
 (15,3,'Samsung Plazma tv',3400,6),
 (16,4,'Nokia Series',500,14),
 (17,4,'Samsung Series',600,6),
 (18,4,'Apple Series',1000,4),
 (19,4,'HTC Series',700,13),
 (20,5,'Kızıl Nehirler',20,10),
 (21,5,'Leyleklerin Uçuşu',15,5),
 (22,5,'Melekler ve Şeytanlar',30,10),
 (23,6,'Film',30,10),
 (24,6,'Müzik',20,30),
 (26,4,'aad',43,66),
 (30,5,'ADS',34,4);
/*!40000 ALTER TABLE `urunler` ENABLE KEYS */;


--
-- Definition of procedure `a2`
--

DROP PROCEDURE IF EXISTS `a2`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `a2`()
    DETERMINISTIC
    COMMENT 'A procedure'
BEGIN
    SELECT * from musteriler;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `aa`
--

DROP PROCEDURE IF EXISTS `aa`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `aa`()
BEGIN
      select * from urunler ;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `aaa`
--

DROP PROCEDURE IF EXISTS `aaa`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `aaa`()
BEGIN
  
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `arda`
--

DROP PROCEDURE IF EXISTS `arda`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `arda`()
    COMMENT 'qq'
BEGIN
        select * from alisveris.urunler ;
        
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `arif`
--

DROP PROCEDURE IF EXISTS `arif`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `arif`()
    COMMENT 'cacaca'
BEGIN
          select ad,soyad from alisveris.musteriler m where m.ad = 'seda';
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
