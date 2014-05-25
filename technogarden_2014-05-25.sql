# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Hôte: 10.12.9.2 (MySQL 5.5.36)
# Base de données: technogarden
# Temps de génération: 2014-05-25 06:33:09 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_ibfk_1` (`team_id`),
  KEY `event_ibfk_2` (`user_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `event_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;

INSERT INTO `event` (`id`, `type`, `user_id`, `title`, `content`, `created_on`, `team_id`)
VALUES
	(41,'',19,'','qsdqsd','2014-05-25 06:17:24',4),
	(42,'',19,'','qsdqsds','2014-05-25 06:19:55',4);

/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table event_team
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_team`;

CREATE TABLE `event_team` (
  `id_event` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_event`,`id_team`),
  KEY `id_team` (`id_team`),
  CONSTRAINT `event_team_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `event` (`id`),
  CONSTRAINT `event_team_ibfk_2` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table event_techno
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_techno`;

CREATE TABLE `event_techno` (
  `id_event` int(11) NOT NULL,
  `id_techno` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_event`,`id_techno`),
  KEY `id_techno` (`id_techno`),
  CONSTRAINT `event_techno_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `event` (`id`),
  CONSTRAINT `event_techno_ibfk_2` FOREIGN KEY (`id_techno`) REFERENCES `techno` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table event_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_user`;

CREATE TABLE `event_user` (
  `id_event` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_event`,`id_user`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `event_user_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `event` (`id`),
  CONSTRAINT `event_user_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table team_common_technos
# ------------------------------------------------------------

DROP VIEW IF EXISTS `team_common_technos`;

CREATE TABLE `team_common_technos` (
   `id_team1` INT(11) NOT NULL DEFAULT '0',
   `id_team2` INT(11) NOT NULL DEFAULT '0',
   `common_technos` BIGINT(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;



# Affichage de la table team_distance
# ------------------------------------------------------------

DROP VIEW IF EXISTS `team_distance`;

CREATE TABLE `team_distance` (
   `id_team1` INT(11) NOT NULL DEFAULT '0',
   `id_team2` INT(11) NOT NULL DEFAULT '0',
   `common_technos` BIGINT(21) NOT NULL DEFAULT '0',
   `different_technos` BIGINT(24) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;



# Affichage de la table team_techno
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team_techno`;

CREATE TABLE `team_techno` (
  `id_team` int(11) NOT NULL,
  `id_techno` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `level_usage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_team`,`id_techno`),
  KEY `id_techno` (`id_techno`),
  CONSTRAINT `team_techno_ibfk_1` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id`),
  CONSTRAINT `team_techno_ibfk_2` FOREIGN KEY (`id_techno`) REFERENCES `techno` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `team_techno` WRITE;
/*!40000 ALTER TABLE `team_techno` DISABLE KEYS */;

INSERT INTO `team_techno` (`id_team`, `id_techno`, `created_on`, `level_usage`)
VALUES
	(1,1,'2014-05-24 16:34:44',NULL),
	(1,2,'2014-05-24 16:34:44',NULL),
	(1,5,'2014-05-24 16:34:44',NULL),
	(1,6,'2014-05-24 16:34:44',NULL),
	(1,12,'2014-05-24 16:34:44',NULL),
	(1,15,'2014-05-24 16:34:44',NULL),
	(2,1,'2014-05-24 16:34:44',NULL),
	(2,3,'2014-05-24 16:34:44',NULL),
	(2,4,'2014-05-24 16:34:44',NULL),
	(2,5,'2014-05-24 16:34:44',NULL),
	(2,6,'2014-05-24 16:34:44',NULL),
	(3,7,'2014-05-24 16:34:44',NULL),
	(3,8,'2014-05-24 16:34:44',NULL),
	(4,7,'2014-05-24 16:34:44',NULL),
	(4,9,'2014-05-24 16:34:44',NULL),
	(4,10,'2014-05-24 16:34:44',NULL),
	(4,11,'2014-05-24 16:34:44',NULL),
	(4,12,'2014-05-24 16:34:44',NULL),
	(5,5,'2014-05-24 16:34:44',NULL),
	(5,6,'2014-05-24 16:34:44',NULL),
	(5,12,'2014-05-24 16:34:44',NULL),
	(5,13,'2014-05-24 16:34:44',NULL),
	(6,1,'2014-05-24 16:34:44',NULL),
	(6,2,'2014-05-24 16:34:44',NULL),
	(6,5,'2014-05-24 16:34:44',NULL),
	(6,14,'2014-05-24 16:34:44',NULL);

/*!40000 ALTER TABLE `team_techno` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table team_total_technos
# ------------------------------------------------------------

DROP VIEW IF EXISTS `team_total_technos`;

CREATE TABLE `team_total_technos` (
   `id_team` INT(11) NOT NULL,
   `total_technos` BIGINT(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;



# Affichage de la table teams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `location` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;

INSERT INTO `teams` (`id`, `name`, `summary`, `location`, `tel`, `email`, `img_url`)
VALUES
	(1,'BSC-CSI-Techno Garden','An awesome techno garden','paris',NULL,NULL,NULL),
	(2,'GBIS-SEC-ZPP-WIP','Work In Progress','Paris',NULL,NULL,NULL),
	(3,'GBIS-COT-Noblabla','','Paris',NULL,NULL,NULL),
	(4,'BSC-AFD-Aptenodytes','kjsdlkajsdlmkfjs','Paris',NULL,NULL,NULL),
	(5,'GBIS-DAG-HUBBLE','','Paris',NULL,NULL,NULL),
	(6,'GTS-DDF-BUBBLE','','Paris',NULL,NULL,NULL),
	(7,'SG-KGR-CODSHAFU','jeu dev pour gagner il faut modifier le code des cases du damier ','',NULL,NULL,'http://twitpic.com/e4mpci');

/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table techno
# ------------------------------------------------------------

DROP TABLE IF EXISTS `techno`;

CREATE TABLE `techno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `code_2` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

LOCK TABLES `techno` WRITE;
/*!40000 ALTER TABLE `techno` DISABLE KEYS */;

INSERT INTO `techno` (`id`, `label`, `description`, `type`, `code`)
VALUES
	(1,'PHP','PHP','language','php'),
	(2,'Javascript','Javascript','language','js'),
	(3,'JQuery','Simplified Javascript','library','jquery'),
	(4,'GitHub API','Github\'s Api','API','github'),
	(5,'HTML5','HTML5','language','html'),
	(6,'CSS','CSS','language','css'),
	(7,'Java','Java','language','java'),
	(8,'XML','XML','language','xml'),
	(9,'J2EE','Java 2 Platform Enterprise Edition','platform','j2ee'),
	(10,'Spring','An open source application framework and inversion of control container for the Java platform.','framework','spring'),
	(11,'Hibernate','Hibernate ORM (Hibernate in short) is an object-relational mapping library for the Java language','library','hiber'),
	(12,'AngularJS','An open-source web application framework, that assists with creating single-page applications, one-page web applications that only require HTML, CSS, and JavaScript on the client side.','framework','ang'),
	(13,'Bootstrap','A collection of tools for creating websites and web applications. It contains HTML and CSS-based design templates for typography, forms, buttons, navigation and other interface components, as well as optional JavaScript extensions.','framework','boot'),
	(14,'3dJS','A 3D JavaScript library','library','3djs'),
	(15,'Drupal','A content management platform ','platform','drupal'),
	(16,'C','','language','c'),
	(56,'Objective-C','','language','objc'),
	(57,'C++','','language','cpp'),
	(58,'Visual Basic','','language','visualbas'),
	(59,'C#','','language','c#'),
	(91,'Python','','language','python'),
	(92,'Perl','','language','perl'),
	(93,'Ruby','','language','ruby'),
	(94,'F#','','language','f#'),
	(95,'TransactSQL','','language','trans'),
	(96,'Delphi','','language','delphi'),
	(97,'Lisp','','language','lisp'),
	(98,'Assembly','','language','assembly'),
	(99,'Pascal','','language','pascal'),
	(100,'MATLAB','','language','matlab'),
	(101,'ActionScript','','language','action');

/*!40000 ALTER TABLE `techno` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table techno_techno
# ------------------------------------------------------------

DROP TABLE IF EXISTS `techno_techno`;

CREATE TABLE `techno_techno` (
  `name_techno1` varchar(255) NOT NULL,
  `name_techno2` varchar(255) NOT NULL,
  PRIMARY KEY (`name_techno1`,`name_techno2`),
  KEY `techno_techno_ibfk_2` (`name_techno2`),
  CONSTRAINT `techno_techno_ibfk_1` FOREIGN KEY (`name_techno1`) REFERENCES `techno` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `techno_techno_ibfk_2` FOREIGN KEY (`name_techno2`) REFERENCES `techno` (`code`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `techno_techno` WRITE;
/*!40000 ALTER TABLE `techno_techno` DISABLE KEYS */;

INSERT INTO `techno_techno` (`name_techno1`, `name_techno2`)
VALUES
	('js','ang'),
	('boot','css'),
	('html','css'),
	('php','drupal'),
	('spring','j2ee'),
	('j2ee','java'),
	('spring','java'),
	('js','jquery'),
	('3djs','js');

/*!40000 ALTER TABLE `techno_techno` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table user_team
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_team`;

CREATE TABLE `user_team` (
  `id_user` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `id_techno` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`id_team`,`id_techno`),
  KEY `id_team` (`id_team`),
  KEY `id_techno` (`id_techno`),
  CONSTRAINT `user_team_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  CONSTRAINT `user_team_ibfk_2` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id`),
  CONSTRAINT `user_team_ibfk_3` FOREIGN KEY (`id_techno`) REFERENCES `techno` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_team` WRITE;
/*!40000 ALTER TABLE `user_team` DISABLE KEYS */;

INSERT INTO `user_team` (`id_user`, `id_team`, `id_techno`, `created_on`)
VALUES
	(1,1,1,'2014-05-24 16:36:57'),
	(2,1,1,'2014-05-24 16:36:57'),
	(3,1,1,'2014-05-24 16:36:57'),
	(4,1,1,'2014-05-24 16:36:57'),
	(5,1,1,'2014-05-24 16:36:57'),
	(6,1,1,'2014-05-24 16:36:57'),
	(7,1,1,'2014-05-24 16:36:57'),
	(8,2,1,'2014-05-24 16:36:57'),
	(9,2,1,'2014-05-24 16:36:57'),
	(10,2,1,'2014-05-24 16:36:57'),
	(13,2,1,'2014-05-24 16:36:57'),
	(14,2,1,'2014-05-24 16:36:57'),
	(15,3,1,'2014-05-24 16:36:57'),
	(16,3,1,'2014-05-24 16:36:57'),
	(17,3,1,'2014-05-24 16:36:57'),
	(18,4,1,'2014-05-24 16:36:57'),
	(19,4,1,'2014-05-24 16:36:57'),
	(20,5,1,'2014-05-24 16:36:57'),
	(21,5,1,'2014-05-24 16:36:57'),
	(22,5,1,'2014-05-24 16:36:57'),
	(23,5,1,'2014-05-24 16:36:57'),
	(24,6,1,'2014-05-24 16:36:57'),
	(25,6,1,'2014-05-24 16:36:57'),
	(26,6,1,'2014-05-24 16:36:57'),
	(27,6,1,'2014-05-24 16:36:57');

/*!40000 ALTER TABLE `user_team` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table user_techno
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_techno`;

CREATE TABLE `user_techno` (
  `id_user` int(11) NOT NULL,
  `id_techno` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `level_interest` int(11) DEFAULT NULL,
  `level_skill` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`,`id_techno`),
  KEY `id_techno` (`id_techno`),
  CONSTRAINT `user_techno_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  CONSTRAINT `user_techno_ibfk_2` FOREIGN KEY (`id_techno`) REFERENCES `techno` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_techno` WRITE;
/*!40000 ALTER TABLE `user_techno` DISABLE KEYS */;

INSERT INTO `user_techno` (`id_user`, `id_techno`, `created_on`, `level_interest`, `level_skill`)
VALUES
	(1,1,'2014-05-24 17:19:53',NULL,NULL),
	(1,12,'2014-05-24 17:19:53',NULL,NULL),
	(1,13,'2014-05-24 17:19:53',NULL,NULL),
	(2,1,'2014-05-24 17:20:33',NULL,NULL),
	(2,13,'2014-05-24 17:20:33',NULL,NULL),
	(3,2,'2014-05-24 17:20:52',NULL,NULL),
	(3,6,'2014-05-24 17:21:05',NULL,NULL),
	(3,12,'2014-05-24 17:20:52',NULL,NULL),
	(6,15,'2014-05-24 17:20:52',NULL,NULL),
	(7,15,'2014-05-24 17:20:52',NULL,NULL);

/*!40000 ALTER TABLE `user_techno` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `IMusernme` varchar(255) NOT NULL,
  `teamname` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `twittername` varchar(255) DEFAULT NULL,
  `id_team` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `IMusernme`, `teamname`, `username`, `tel`, `description`, `twittername`, `id_team`)
VALUES
	(1,'Florence','BECK','fbeck@student.42.fr','fbeck','Techno Garden','fbeck',NULL,'',NULL,1),
	(2,'Valere','JEANTET','valere.jeantet@gmail.com','vjeantet','Techno Garden','vjeantet',NULL,'',NULL,1),
	(3,'Meriadec','PILLET','mpillet@student.42.fr','mpillet','Techno Garden','mpillet',NULL,'',NULL,1),
	(4,'Jasmin','ANTEUNIS','janteuni@student.42.fr','janteuni','Techno Garden','janteuni',NULL,'',NULL,1),
	(5,'Balthazar','GRONON','bgronon@student.42.fr','bgronon','Techno Garden','bgronon',NULL,'',NULL,1),
	(6,'Thomas','GUILLIER','thomas.guillier@gmail.com','tguillier','Techno Garden','tguillier',NULL,'',NULL,1),
	(7,'JB','INGOLD','ingold.jb@gmail.com','jbingold','Techno Garden','jbingold',NULL,'',NULL,1),
	(8,'Melodie','SAGODIRA','msagodir@studet.42.fr','msagodir','WIP','msagodir',NULL,'',NULL,2),
	(9,'Remi','BRIEUC','rbrieuc@student.42.fr','rbrieuc','WIP','rbrieuc',NULL,'',NULL,2),
	(10,'Yann','PRINGAULT','ypringau@student.42.fr','ypringau','WIP','ypringau',NULL,'',NULL,2),
	(13,'Hugo','MASSING','hmassing@student.42.fr','hmassing','WIP','hmassing',NULL,'',NULL,2),
	(14,'Adrien','AUER','aaeur@student.42.fr','aaeur','WIP','aaeur',NULL,'',NULL,2),
	(15,'Pierre','','pierre@mail.fr','pierre','Noblabla','pierre',NULL,'',NULL,3),
	(16,'Kevin','','kevin@mail.fr','kevin','Noblabla','kevin',NULL,'',NULL,3),
	(17,'Ahmed','','ahmed@mail.fr','ahmed','Noblabla','ahmed',NULL,'',NULL,3),
	(18,'Jeremy','Drouet','jdrouet@mail.fr','jdrouet','Aptenodytes','jdrouet',NULL,'',NULL,4),
	(19,'Yann','Bonsens','ybonsens@mail.fr','ybonsens','Aptenodytes','ybonsens',NULL,'',NULL,4),
	(20,'Marie','','marie@mail.fr','marie','Hubble','marie',NULL,'',NULL,5),
	(21,'Brice','','brice@mail.fr','brice','Hubble','brice',NULL,'',NULL,5),
	(22,'Fabien','','fabien@mail.fr','fabien','Hubble','fabien',NULL,'',NULL,5),
	(23,'Waiki','','waiki@mail.fr','waiki','Hubble','waiki',NULL,'',NULL,5),
	(24,'Selim','','sbenhabb@student.42.fr','sbenhabb','Bubble','sbenhabb',NULL,'',NULL,6),
	(25,'Fernand','','fernand@mail.fr','fernand','Bubble','fernand',NULL,'',NULL,6),
	(26,'Andre','','andre@mail.fr','andre','Bubble','andre',NULL,'',NULL,6),
	(27,'Corentin','','corentin@mail.fr','corentin','Bubble','corentin',NULL,'',NULL,6);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;




# Replace placeholder table for team_common_technos with correct view syntax
# ------------------------------------------------------------

DROP TABLE `team_common_technos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`technogarden`@`%` SQL SECURITY DEFINER VIEW `team_common_technos`
AS SELECT
   `t1`.`id` AS `id_team1`,
   `t2`.`id` AS `id_team2`,count(distinct `te`.`id`) AS `common_technos`
FROM ((((`teams` `t1` join `team_techno` `tt1` on((`tt1`.`id_team` = `t1`.`id`))) join `techno` `te` on((`te`.`id` = `tt1`.`id_techno`))) join `team_techno` `tt2` on((`tt2`.`id_techno` = `te`.`id`))) join `teams` `t2` on(((`t2`.`id` = `tt2`.`id_team`) and (`tt2`.`id_team` <> `tt1`.`id_team`)))) group by `t1`.`id`,`t2`.`id`;


# Replace placeholder table for team_distance with correct view syntax
# ------------------------------------------------------------

DROP TABLE `team_distance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`technogarden`@`%` SQL SECURITY DEFINER VIEW `team_distance`
AS SELECT
   `ct`.`id_team1` AS `id_team1`,
   `ct`.`id_team2` AS `id_team2`,
   `ct`.`common_technos` AS `common_technos`,(((`tt1`.`total_technos` - `ct`.`common_technos`) + `tt2`.`total_technos`) - `ct`.`common_technos`) AS `different_technos`
FROM ((`team_common_technos` `ct` join `team_total_technos` `tt1` on((`tt1`.`id_team` = `ct`.`id_team1`))) join `team_total_technos` `tt2` on((`tt2`.`id_team` = `ct`.`id_team2`)));


# Replace placeholder table for team_total_technos with correct view syntax
# ------------------------------------------------------------

DROP TABLE `team_total_technos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`technogarden`@`%` SQL SECURITY DEFINER VIEW `team_total_technos`
AS SELECT
   `tt`.`id_team` AS `id_team`,count(distinct `tt`.`id_techno`) AS `total_technos`
FROM `team_techno` `tt` group by `tt`.`id_team`;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
