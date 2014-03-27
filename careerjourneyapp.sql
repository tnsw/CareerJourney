-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 06, 2014 at 02:09 PM
-- Server version: 5.5.34
-- PHP Version: 5.3.10-1ubuntu3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `careerjourneyapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE IF NOT EXISTS `agency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`id`, `name`) VALUES
(1, 'RMS'),
(2, 'TfNSW'),
(3, 'Sydney Trains');

-- --------------------------------------------------------

--
-- Table structure for table `capability`
--

CREATE TABLE IF NOT EXISTS `capability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `capability_group` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `capability_group` (`capability_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `capability_group`
--

CREATE TABLE IF NOT EXISTS `capability_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `capability_level`
--

CREATE TABLE IF NOT EXISTS `capability_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `capability_level`
--

INSERT INTO `capability_level` (`id`, `name`) VALUES
(1, 'Foundational'),
(2, 'Intermediate'),
(3, 'Adept'),
(4, 'Advanced'),
(5, 'Highly Advanced');

-- --------------------------------------------------------

--
-- Table structure for table `capability_level_descriptor`
--

CREATE TABLE IF NOT EXISTS `capability_level_descriptor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `level` int(11) NOT NULL,
  `capability` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `capability` (`capability`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `agency` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agency` (`agency`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `job_position`
--

CREATE TABLE IF NOT EXISTS `job_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `department` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `department` (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `position_capability_level`
--

CREATE TABLE IF NOT EXISTS `position_capability_level` (
  `job_position` int(11) NOT NULL,
  `capability` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`job_position`,`capability`),
  KEY `capability` (`capability`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `capability`
--
ALTER TABLE `capability`
  ADD CONSTRAINT `capability_ibfk_1` FOREIGN KEY (`capability_group`) REFERENCES `capability_group` (`id`);

--
-- Constraints for table `capability_level_descriptor`
--
ALTER TABLE `capability_level_descriptor`
  ADD CONSTRAINT `capability_level_descriptor_ibfk_1` FOREIGN KEY (`capability`) REFERENCES `capability` (`id`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`agency`) REFERENCES `agency` (`id`);

--
-- Constraints for table `job_position`
--
ALTER TABLE `job_position`
  ADD CONSTRAINT `job_position_ibfk_1` FOREIGN KEY (`department`) REFERENCES `department` (`id`);

--
-- Constraints for table `position_capability_level`
--
ALTER TABLE `position_capability_level`
  ADD CONSTRAINT `position_capability_level_ibfk_1` FOREIGN KEY (`job_position`) REFERENCES `job_position` (`id`),
  ADD CONSTRAINT `position_capability_level_ibfk_2` FOREIGN KEY (`capability`) REFERENCES `capability` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
