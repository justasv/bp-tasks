/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table challenges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `challenges`;

CREATE TABLE `challenges` (
  `challenge_id` int(11) unsigned NOT NULL,
  `college_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`challenge_id`),
  KEY `college_id` (`college_id`),
  CONSTRAINT `challenges_ibfk_1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`colllege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;

INSERT INTO `challenges` (`challenge_id`, `college_id`)
VALUES
	(18765,11219),
	(47127,11219),
	(60292,32473),
	(72974,56685);

/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table colleges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `colleges`;

CREATE TABLE `colleges` (
  `colllege_id` int(11) unsigned NOT NULL,
  `contest_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`colllege_id`),
  KEY `contest_id` (`contest_id`),
  CONSTRAINT `colleges_ibfk_1` FOREIGN KEY (`contest_id`) REFERENCES `contests` (`contest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;

INSERT INTO `colleges` (`colllege_id`, `contest_id`)
VALUES
	(11219,66406),
	(32473,66556),
	(56685,94828);

/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contests`;

CREATE TABLE `contests` (
  `contest_id` int(11) unsigned NOT NULL,
  `hacker_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(20) DEFAULT '',
  PRIMARY KEY (`contest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `contests` WRITE;
/*!40000 ALTER TABLE `contests` DISABLE KEYS */;

INSERT INTO `contests` (`contest_id`, `hacker_id`, `name`)
VALUES
	(66406,17973,'Rose'),
	(66556,79153,'Angela'),
	(94828,80275,'Frank');

/*!40000 ALTER TABLE `contests` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table submission_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `submission_stats`;

CREATE TABLE `submission_stats` (
  `challenge_id` int(11) unsigned NOT NULL,
  `total_submissions` int(7) NOT NULL DEFAULT '0',
  `total_accepted_submissions` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `submission_stats` WRITE;
/*!40000 ALTER TABLE `submission_stats` DISABLE KEYS */;

INSERT INTO `submission_stats` (`challenge_id`, `total_submissions`, `total_accepted_submissions`)
VALUES
	(75516,34,12),
	(47127,27,10),
	(47127,56,18),
	(75516,74,12),
	(75516,83,8),
	(72974,68,24),
	(72974,82,14),
	(47127,28,11);

/*!40000 ALTER TABLE `submission_stats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table view_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `view_stats`;

CREATE TABLE `view_stats` (
  `challenge_id` int(11) unsigned NOT NULL,
  `total_views` int(7) unsigned NOT NULL DEFAULT '0',
  `total_unique_views` int(7) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `view_stats` WRITE;
/*!40000 ALTER TABLE `view_stats` DISABLE KEYS */;

INSERT INTO `view_stats` (`challenge_id`, `total_views`, `total_unique_views`)
VALUES
	(47127,26,19),
	(47127,15,14),
	(18765,43,10),
	(18765,72,13),
	(77516,35,17),
	(60292,11,10),
	(72974,41,15),
	(75516,75,11);

/*!40000 ALTER TABLE `view_stats` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
