/*
Navicat MySQL Data Transfer

Source Server         : Alen
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : projekat

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2022-04-16 15:34:25
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `artikal`
-- ----------------------------
DROP TABLE IF EXISTS `artikal`;
CREATE TABLE `artikal` (
  `artikal_id` int(10) NOT NULL auto_increment,
  `naziv_artikla` varchar(50) NOT NULL default '',
  `vrsta_artikla` varchar(50) default NULL,
  `cijena` double(8,4) default NULL,
  PRIMARY KEY  (`artikal_id`,`naziv_artikla`),
  KEY `idx_naziv_artikla` (`naziv_artikla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of artikal
-- ----------------------------
INSERT INTO `artikal` VALUES ('1', 'Paracetamol', 'Lijekovi', '69.7000');
INSERT INTO `artikal` VALUES ('2', 'Razer miš', 'Kompjuterska oprema', '230.0000');
INSERT INTO `artikal` VALUES ('3', 'Polubijeli hljeb', 'Hrana', '93.6000');
INSERT INTO `artikal` VALUES ('4', 'Olimpijska šipka', 'Oprema za teretanu', '84.6500');
INSERT INTO `artikal` VALUES ('5', 'Tene', 'Obuća', '120.9000');

-- ----------------------------
-- Table structure for `kupac`
-- ----------------------------
DROP TABLE IF EXISTS `kupac`;
CREATE TABLE `kupac` (
  `kupac_id` int(10) NOT NULL auto_increment,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `grad` varchar(20) default NULL,
  `adresa` varchar(40) default NULL,
  `telefon` varchar(20) default NULL,
  `user` varchar(40) default NULL,
  `pass` varchar(20) default NULL,
  PRIMARY KEY  (`kupac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kupac
-- ----------------------------
INSERT INTO `kupac` VALUES ('1', 'Admin', 'Admin', 'Admin', 'Admin ', '062062062', 'admin.a', '1admin.a');
INSERT INTO `kupac` VALUES ('2', 'Fake', 'Fakili', 'aa', 'a23', '', 'fake.f', '2fake.f');
INSERT INTO `kupac` VALUES ('3', 'Misko', 'Mukovic', 'Grbavica', 'Grbo 59', '0606060', 'misko.o', '3misko.m');
INSERT INTO `kupac` VALUES ('4', 'Ricko', 'Rickovic', 'Santijago', 'Safeta Zajke 50', '061123321', 'ricko.r', '4ricko.r');
INSERT INTO `kupac` VALUES ('5', 'Faruk', 'Farukovic', 'Hrid', 'Oteska 69', '61213312', 'faruk.f', '5faruk.f');

-- ----------------------------
-- Table structure for `narudzbenica`
-- ----------------------------
DROP TABLE IF EXISTS `narudzbenica`;
CREATE TABLE `narudzbenica` (
  `narudzbenica_id` int(10) NOT NULL auto_increment,
  `kupac_id` int(10) NOT NULL,
  `datum_narudzbe` date default NULL,
  PRIMARY KEY  (`narudzbenica_id`),
  KEY `narudzbenica_kupac` (`kupac_id`),
  CONSTRAINT `narudzbenica_kupac` FOREIGN KEY (`kupac_id`) REFERENCES `kupac` (`kupac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of narudzbenica
-- ----------------------------
INSERT INTO `narudzbenica` VALUES ('1', '2', '2022-04-01');
INSERT INTO `narudzbenica` VALUES ('2', '2', '2022-04-20');
INSERT INTO `narudzbenica` VALUES ('3', '4', '2021-11-18');
INSERT INTO `narudzbenica` VALUES ('4', '5', '2022-04-01');
INSERT INTO `narudzbenica` VALUES ('5', '2', '2019-11-29');

-- ----------------------------
-- Table structure for `skladiste`
-- ----------------------------
DROP TABLE IF EXISTS `skladiste`;
CREATE TABLE `skladiste` (
  `id` int(10) NOT NULL auto_increment,
  `artikal_id` int(10) NOT NULL,
  `naziv_artikla` varchar(50) default NULL,
  `kolicina` int(10) default NULL,
  PRIMARY KEY  (`id`),
  KEY `skladiste_artikal` (`artikal_id`),
  KEY `Aritkal updejta skladiste` (`naziv_artikla`),
  CONSTRAINT `Aritkal updejta skladiste` FOREIGN KEY (`naziv_artikla`) REFERENCES `artikal` (`naziv_artikla`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skladiste_artikal` FOREIGN KEY (`artikal_id`) REFERENCES `artikal` (`artikal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 3072 kB; (`naziv_artikla`) REFER `projekat/arti';

-- ----------------------------
-- Records of skladiste
-- ----------------------------
INSERT INTO `skladiste` VALUES ('1', '1', 'Paracetamol', '58');
INSERT INTO `skladiste` VALUES ('2', '2', 'Razer miš', '17');
INSERT INTO `skladiste` VALUES ('3', '3', 'Polubijeli hljeb', '255');
INSERT INTO `skladiste` VALUES ('4', '4', 'Olimpijska šipka', '33');
INSERT INTO `skladiste` VALUES ('5', '5', 'Tene', '3');

-- ----------------------------
-- Table structure for `stavka_narudzbenice`
-- ----------------------------
DROP TABLE IF EXISTS `stavka_narudzbenice`;
CREATE TABLE `stavka_narudzbenice` (
  `stavka_id` int(10) NOT NULL auto_increment,
  `narudzbenica_id` int(10) NOT NULL,
  `artikal_id` int(10) NOT NULL,
  `kolicina` int(10) default NULL,
  PRIMARY KEY  (`stavka_id`),
  KEY `stavka_narudzbenica` (`narudzbenica_id`),
  KEY `stavka_artikal` (`artikal_id`),
  CONSTRAINT `stavka_artikal` FOREIGN KEY (`artikal_id`) REFERENCES `artikal` (`artikal_id`),
  CONSTRAINT `stavka_narudzbenica` FOREIGN KEY (`narudzbenica_id`) REFERENCES `narudzbenica` (`narudzbenica_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stavka_narudzbenice
-- ----------------------------
