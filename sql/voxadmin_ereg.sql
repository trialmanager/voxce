-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 02, 2013 at 01:40 AM
-- Server version: 5.1.66-cll
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `voxadmin_ereg`
--

-- --------------------------------------------------------

--
-- Table structure for table `action_texts`
--

CREATE TABLE IF NOT EXISTS `action_texts` (
  `ACTION_TEXT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` int(11) NOT NULL DEFAULT '0',
  `CODE` varchar(100) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `TEXT` varchar(100) NOT NULL,
  `CREATED_BY` int(11) NOT NULL DEFAULT '0',
  `DATE_CREATED` date NOT NULL,
  `MODIFIED_BY` int(11) NOT NULL DEFAULT '0',
  `DATE_MODIFIED` date DEFAULT NULL,
  PRIMARY KEY (`ACTION_TEXT_ID`),
  KEY `LANGUAGE_ID` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `answer_texts`
--

CREATE TABLE IF NOT EXISTS `answer_texts` (
  `answer_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `code` char(255) NOT NULL,
  `name` char(255) NOT NULL,
  `text` char(255) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  `answer_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`answer_text_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `approval_status_type`
--

CREATE TABLE IF NOT EXISTS `approval_status_type` (
  `approval_status_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date NOT NULL,
  PRIMARY KEY (`approval_status_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE IF NOT EXISTS `audit_trail` (
  `audit_trail_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `patientCrf_id` int(11) NOT NULL,
  `section` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text,
  `modified_by` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `question_opration` varchar(255) NOT NULL,
  `most_recent` varchar(255) DEFAULT 'yes',
  PRIMARY KEY (`audit_trail_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `audit_trail`
--


-- --------------------------------------------------------

--
-- Table structure for table `aud_responses`
--

CREATE TABLE IF NOT EXISTS `aud_responses` (
  `response_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` longtext,
  `operation` varchar(1) NOT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `received_crf_id` int(11) NOT NULL DEFAULT '0',
  `crf_question_id` int(11) NOT NULL DEFAULT '0',
  `answer_text_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`response_id`),
  KEY `received_crf_id` (`received_crf_id`),
  KEY `crf_question_id` (`crf_question_id`),
  KEY `answer_text_id` (`answer_text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `case_report_forms`
--

CREATE TABLE IF NOT EXISTS `case_report_forms` (
  `crf_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `crf_code` char(250) DEFAULT NULL,
  `crf_name_text_id` int(11) NOT NULL DEFAULT '0',
  `crf_name` text NOT NULL,
  `validator` char(250) DEFAULT NULL,
  `crf_edit_html` longtext NOT NULL,
  `crf_html` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`crf_id`),
  KEY `crf_name_text_id` (`crf_name_text_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `case_report_forms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `category_code` varchar(255) NOT NULL DEFAULT '',
  `category_name` varchar(255) NOT NULL DEFAULT '',
  `category_description` longtext,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `constraint_names`
--

CREATE TABLE IF NOT EXISTS `constraint_names` (
  `constraint_name_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `field` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `created_by` int(10) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(10) NOT NULL DEFAULT '0',
  `date_modified` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`constraint_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contact_requests`
--

CREATE TABLE IF NOT EXISTS `contact_requests` (
  `contact_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `salutation` varchar(255) NOT NULL,
  `first_name` char(255) NOT NULL,
  `last_name` char(255) NOT NULL,
  `title` char(255) NOT NULL,
  `department` char(255) NOT NULL,
  `company` char(255) NOT NULL,
  `email` char(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` char(255) NOT NULL,
  `city` char(255) NOT NULL,
  `state` char(255) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `country_id` int(255) NOT NULL,
  `information` char(255) NOT NULL,
  `refferal_name` char(255) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`contact_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE IF NOT EXISTS `contracts` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `study_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `signed_dt` date NOT NULL,
  `returned_dt` date NOT NULL,
  `type_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date NOT NULL,
  `protocol_id` varchar(11) NOT NULL,
  `protocol_version` varchar(200) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `file_description` varchar(250) NOT NULL,
  `type` varchar(200) NOT NULL,
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='contracts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `conversions`
--

CREATE TABLE IF NOT EXISTS `conversions` (
  `conversion_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_unit_id` int(11) NOT NULL DEFAULT '0',
  `to_unit_id_factor` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`conversion_id`),
  KEY `from_unit_id` (`from_unit_id`),
  KEY `to_unit_id_factor` (`to_unit_id_factor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `COUNTRY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `COUNTRY_CODE` varchar(10) NOT NULL DEFAULT '',
  `COUNTRY_NAME` varchar(255) NOT NULL DEFAULT '',
  `DESCRIPTION` longtext NOT NULL,
  `CREATED_BY` int(11) NOT NULL DEFAULT '0',
  `DATE_CREATED` date NOT NULL DEFAULT '0000-00-00',
  `MODIFIED_BY` int(11) DEFAULT '0',
  `DATE_MODIFIED` date DEFAULT '0000-00-00',
  PRIMARY KEY (`COUNTRY_ID`),
  UNIQUE KEY `COUNTRY_ID` (`COUNTRY_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=190 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`COUNTRY_ID`, `subscriber_id`, `COUNTRY_CODE`, `COUNTRY_NAME`, `DESCRIPTION`, `CREATED_BY`, `DATE_CREATED`, `MODIFIED_BY`, `DATE_MODIFIED`) VALUES
(1, 0, 'eg', 'Egypt', 'Egypt', 1, '2008-01-21', 0, '2011-12-27'),
(2, 0, 'sv', 'El Salvador', 'El Salvador', 1, '2008-01-21', 0, '2011-12-27'),
(3, 0, 'gq', 'Equatorial Guinea', 'Equatorial Guinea', 1, '2008-01-21', 0, '2011-12-27'),
(4, 0, 'er', 'Eritrea', 'Eritrea', 1, '2008-01-21', 0, '2011-12-27'),
(5, 0, 'ee', 'Estonia', 'Estonia', 1, '2008-01-21', 0, '2011-12-27'),
(6, 0, 'et', 'Ethiopia', 'Ethiopia', 1, '2008-01-21', 0, '2011-12-27'),
(7, 0, 'fk', 'Falkland Islands', 'Falkland Islands', 1, '2008-01-21', 0, '2011-12-27'),
(8, 0, 'fo', 'Faroe Islands', 'Faroe Islands', 1, '2008-01-21', 0, '2011-12-27'),
(9, 0, 'fj', 'Fiji', 'Fiji', 1, '2008-01-21', 0, '2011-12-27'),
(10, 0, 'fi', 'Finland', 'Finland', 1, '2008-01-21', 0, '2011-12-27'),
(11, 0, 'cs', 'Former Czechoslovakia', 'Former Czechoslovakia', 1, '2008-01-21', 0, '2011-12-27'),
(12, 0, 'su', 'Former USSR', 'Former USSR', 1, '2008-01-21', 0, '2011-12-27'),
(13, 0, 'fr', 'France', 'France', 1, '2008-01-21', 0, '2011-12-27'),
(14, 0, 'fx', 'France (European Territory)', 'France (European Territory)', 1, '2008-01-21', 0, '2011-12-27'),
(15, 0, 'gf', 'French Guyana', 'French Guyana', 1, '2008-01-21', 0, '2011-12-27'),
(16, 0, 'tf', 'French Southern Territories', 'French Southern Territories', 1, '2008-01-21', 0, '2011-12-27'),
(17, 0, 'ga', 'Gabon', 'Gabon', 1, '2008-01-21', 0, '2011-12-27'),
(18, 0, 'gm', 'Gambia', 'Gambia', 1, '2008-01-21', 0, '2011-12-27'),
(19, 0, 'ge', 'Georgia', 'Georgia', 1, '2008-01-21', 0, '2011-12-27'),
(20, 0, 'de', 'Germany', 'Germany', 1, '2008-01-21', 0, '2011-12-27'),
(21, 0, 'gh', 'Ghana', 'Ghana', 1, '2008-01-21', 0, '2011-12-27'),
(22, 0, 'gi', 'Gibraltar', 'Gibraltar', 1, '2008-01-21', 0, '2011-12-27'),
(23, 0, 'gb', 'Great Britain', 'Great Britain', 1, '2008-01-21', 0, '2011-12-27'),
(24, 0, 'gr', 'Greece', 'Greece', 1, '2008-01-21', 0, '2011-12-27'),
(25, 0, 'gl', 'Greenland', 'Greenland', 1, '2008-01-21', 0, '2011-12-27'),
(26, 0, 'gd', 'Grenada', 'Grenada', 1, '2008-01-21', 0, '2011-12-27'),
(27, 0, 'gp', 'Guadeloupe (French)', 'Guadeloupe (French)', 1, '2008-01-21', 0, '2011-12-27'),
(28, 0, 'gu', 'Guam (USA)', 'Guam (USA)', 1, '2008-01-21', 0, '2011-12-27'),
(29, 0, 'gt', 'Guatemala', 'Guatemala', 1, '2008-01-21', 0, '2011-12-27'),
(30, 0, 'gn', 'Guinea', 'Guinea', 1, '2008-01-21', 0, '2011-12-27'),
(31, 0, 'gw', 'Guinea Bissau', 'Guinea Bissau', 1, '2008-01-21', 0, '2011-12-26'),
(32, 0, 'gy', 'Guyana', 'Guyana', 1, '2008-01-21', 0, '2011-12-26'),
(33, 0, 'ht', 'Haiti', 'Haiti', 1, '2008-01-21', 0, '2011-12-26'),
(34, 0, 'hm', 'Heard and McDonald Islands', 'Heard and McDonald Islands', 1, '2008-01-21', 0, '2011-12-26'),
(35, 0, 'hn', 'Honduras', 'Honduras', 1, '2008-01-21', 0, '2011-12-26'),
(36, 0, 'hk', 'Hong Kong', 'Hong Kong', 1, '2008-01-21', 0, '2011-12-26'),
(37, 0, 'hu', 'Hungary', 'Hungary', 1, '2008-01-21', 0, '2011-12-26'),
(38, 0, 'is', 'Iceland', 'Iceland', 1, '2008-01-21', 0, '2011-12-26'),
(39, 0, 'in', 'India', 'India', 1, '2008-01-21', 0, '2011-12-26'),
(40, 0, 'id', 'Indonesia', 'Indonesia', 1, '2008-01-21', 0, '2011-12-26'),
(41, 0, 'ir', 'Iran', 'Iran', 1, '2008-01-21', 0, '2011-12-26'),
(42, 0, 'iq', 'Iraq', 'Iraq', 1, '2008-01-21', 0, '2011-12-26'),
(43, 0, 'ie', 'Ireland', 'Ireland', 1, '2008-01-21', 0, '2011-12-26'),
(44, 0, 'il', 'Israel', 'Israel', 1, '2008-01-21', 0, '2011-12-26'),
(45, 0, 'it', 'Italy', 'Italy', 1, '2008-01-21', 0, '2011-12-26'),
(46, 0, 'ci', 'String(Ivory Coast (Cote D''Ivoire)', 'Ivory Coast (Cote D'' Ivoire)', 1, '2008-01-21', 0, '2011-12-26'),
(47, 0, 'jm', 'Jamaica', 'Jamaica', 1, '2008-01-21', 0, '2011-12-26'),
(48, 0, 'jp', 'Japan', 'Japan', 1, '2008-01-21', 0, '2011-12-26'),
(49, 0, 'jo', 'Jordan', 'Jordan', 1, '2008-01-21', 0, '2011-12-26'),
(50, 0, 'kz', 'Kazakhstan', 'Kazakhstan', 1, '2008-01-21', 0, '2011-12-26'),
(51, 0, 'ke', 'Kenya', 'Kenya', 1, '2008-01-21', 0, '2011-12-26'),
(52, 0, 'ki', 'Kiribati', 'Kiribati', 1, '2008-01-21', 0, '2011-12-26'),
(53, 0, 'kw', 'Kuwait', 'Kuwait', 1, '2008-01-21', 0, '2011-12-26'),
(54, 0, 'kg', 'Kyrgyzstan', 'Kyrgyzstan', 1, '2008-01-21', 0, '2011-12-26'),
(55, 0, 'la', 'Laos', 'Laos', 1, '2008-01-21', 0, '2011-12-26'),
(56, 0, 'lv', 'Latvia', 'Latvia', 1, '2008-01-21', 0, '2011-12-26'),
(57, 0, 'lb', 'Lebanon', 'Lebanon', 1, '2008-01-21', 0, '2011-12-26'),
(58, 0, 'ls', 'Lesotho', 'Lesotho', 1, '2008-01-21', 0, '2011-12-26'),
(59, 0, 'lr', 'Liberia', 'Liberia', 1, '2008-01-21', 0, '2011-12-26'),
(60, 0, 'ly', 'Libya', 'Libya', 1, '2008-01-21', 0, '2011-12-26'),
(61, 0, 'li', 'Liechtenstein', 'Liechtenstein', 1, '2008-01-21', 0, '2011-12-26'),
(62, 0, 'lt', 'Lithuania', 'Lithuania', 1, '2008-01-21', 0, '2011-12-26'),
(63, 0, 'lu', 'Luxembourg', 'Luxembourg', 1, '2008-01-21', 0, '2011-12-26'),
(64, 0, 'mo', 'Macau', 'Macau', 1, '2008-01-21', 0, '2011-12-26'),
(65, 0, 'mk', 'Macedonia', 'Macedonia', 1, '2008-01-21', 0, '2011-12-26'),
(66, 0, 'mg', 'Madagascar', 'Madagascar', 1, '2008-01-21', 0, '2011-12-26'),
(67, 0, 'mw', 'Malawi', 'Malawi', 1, '2008-01-21', 0, '2011-12-26'),
(68, 0, 'my', 'Malaysia', 'Malaysia', 1, '2008-01-21', 0, '2011-12-26'),
(69, 0, 'mv', 'Maldives', 'Maldives', 1, '2008-01-21', 0, '2011-12-26'),
(70, 0, 'ml', 'Mali', 'Mali', 1, '2008-01-21', 0, '2011-12-26'),
(71, 0, 'mt', 'Malta', 'Malta', 1, '2008-01-21', 0, '2011-12-26'),
(72, 0, 'mh', 'Marshall Islands', 'Marshall Islands', 1, '2008-01-21', 0, '2011-12-26'),
(73, 0, 'mq', 'Martinique (French)', 'Martinique (French)', 1, '2008-01-21', 0, '2011-12-26'),
(74, 0, 'mr', 'Mauritania', 'Mauritania', 1, '2008-01-21', 0, '2011-12-26'),
(75, 0, 'mu', 'Mauritius', 'Mauritius', 1, '2008-01-21', 0, '2011-12-26'),
(76, 0, 'yt', 'Mayotte', 'Mayotte', 1, '2008-01-21', 0, '2011-12-26'),
(77, 0, 'mx', 'Mexico', 'Mexico', 1, '2008-01-21', 0, '2011-12-26'),
(78, 0, 'fm', 'Micronesia', 'Micronesia', 1, '2008-01-21', 0, '2011-12-26'),
(79, 0, 'md', 'Moldavia', 'Moldavia', 1, '2008-01-21', 0, '2011-12-26'),
(80, 0, 'mc', 'Monaco', 'Monaco', 1, '2008-01-21', 0, '2011-12-26'),
(81, 0, 'mn', 'Mongolia', 'Mongolia', 1, '2008-01-21', 0, '2011-12-26'),
(82, 0, 'ms', 'Montserrat', 'Montserrat', 1, '2008-01-21', 0, '2011-12-26'),
(83, 0, 'ma', 'Morocco', 'Morocco', 1, '2008-01-21', 0, '2011-12-26'),
(84, 0, 'mz', 'Mozambique', 'Mozambique', 1, '2008-01-21', 0, '2011-12-26'),
(85, 0, 'mm', 'Myanmar', 'Myanmar', 1, '2008-01-21', 0, '2011-12-26'),
(86, 0, 'na', 'Namibia', 'Namibia', 1, '2008-01-21', 0, '2011-12-26'),
(87, 0, 'nr', 'Nauru', 'Nauru', 1, '2008-01-21', 0, '2011-12-26'),
(88, 0, 'np', 'Nepal', 'Nepal', 1, '2008-01-21', 0, '2011-12-26'),
(89, 0, 'nl', 'Netherlands', 'Netherlands', 1, '2008-01-21', 0, '2011-12-26'),
(90, 0, 'an', 'Netherlands Antilles', 'Netherlands Antilles', 1, '2008-01-21', 0, '2011-12-26'),
(91, 0, 'net', 'Network', 'Network', 1, '2008-01-21', 0, '2011-12-26'),
(92, 0, 'nt', 'Neutral Zone', 'Neutral Zone', 1, '2008-01-21', 0, '2011-12-26'),
(93, 0, 'nc', 'New Caledonia (French)', 'New Caledonia (French)', 1, '2008-01-21', 0, '2011-12-26'),
(94, 0, 'nz', 'New Zealand', 'New Zealand', 1, '2008-01-21', 0, '2011-12-26'),
(95, 0, 'ni', 'Nicaragua', 'Nicaragua', 1, '2008-01-21', 0, '2011-12-26'),
(96, 0, 'ne', 'Niger', 'Niger', 1, '2008-01-21', 0, '2011-12-26'),
(97, 0, 'ng', 'Nigeria', 'Nigeria', 1, '2008-01-21', 0, '2011-12-26'),
(98, 0, 'nu', 'Niue', 'Niue', 1, '2008-01-21', 0, '2011-12-26'),
(99, 0, 'org', 'Non-Profit Making Organisations (sic)', 'Non-Profit Making Organisations (sic)', 1, '2008-01-21', 0, '2011-12-26'),
(100, 0, 'nf', 'Norfolk Island', 'Norfolk Island', 1, '2008-01-21', 0, '2011-12-26'),
(101, 0, 'kp', 'North Korea', 'North Korea', 1, '2008-01-21', 0, '2011-12-26'),
(102, 0, 'mp', 'Northern Mariana Islands', 'Northern Mariana Islands', 1, '2008-01-21', 0, '2011-12-26'),
(103, 0, 'no', 'Norway', 'Norway', 1, '2008-01-21', 0, '2011-12-26'),
(104, 0, 'arpa', 'Old style Arpanet', 'Old style Arpanet', 1, '2008-01-21', 0, '2011-12-26'),
(105, 0, 'om', 'Oman', 'Oman', 1, '2008-01-21', 0, '2011-12-26'),
(106, 0, 'pk', 'Pakistan', 'Pakistan', 1, '2008-01-21', 0, '2011-12-26'),
(107, 0, 'pw', 'Palau', 'Palau', 1, '2008-01-21', 0, '2011-12-26'),
(108, 0, 'pa', 'Panama', 'Panama', 1, '2008-01-21', 0, '2011-12-26'),
(109, 0, 'pg', 'Papua New Guinea', 'Papua New Guinea', 1, '2008-01-21', 0, '2011-12-26'),
(110, 0, 'py', 'Paraguay', 'Paraguay', 1, '2008-01-21', 0, '2011-12-26'),
(111, 0, 'pe', 'Peru', 'Peru', 1, '2008-01-21', 0, '2011-12-26'),
(112, 0, 'ph', 'Philippines', 'Philippines', 1, '2008-01-21', 0, '2011-12-26'),
(113, 0, 'pn', 'Pitcairn Island', 'Pitcairn Island', 1, '2008-01-21', 0, '2011-12-26'),
(114, 0, 'pl', 'Poland', 'Poland', 1, '2008-01-21', 0, '2011-12-26'),
(115, 0, 'pf', 'Polynesia (French)', 'Polynesia (French)', 1, '2008-01-21', 0, '2011-12-26'),
(116, 0, 'pt', 'Portugal', 'Portugal', 1, '2008-01-21', 0, '2011-12-26'),
(117, 0, 'pr', 'Puerto Rico', 'Puerto Rico', 1, '2008-01-21', 0, '2011-12-26'),
(118, 0, 'qa', 'Qatar', 'Qatar', 1, '2008-01-21', 0, '2011-12-26'),
(119, 0, 're', 'Reunion (French)', 'Reunion (French)', 1, '2008-01-21', 0, '2011-12-26'),
(120, 0, 'ro', 'Romania', 'Romania', 1, '2008-01-21', 0, '2011-12-26'),
(121, 0, 'ru', 'Russian Federation', 'Russian Federation', 1, '2008-01-21', 0, '2011-12-26'),
(122, 0, 'rw', 'Rwanda', 'Rwanda', 1, '2008-01-21', 0, '2011-12-26'),
(123, 0, 'gs', 'S. Georgia & S. Sandwich Isls.', 'S. Georgia & S. Sandwich Isls.', 1, '2008-01-21', 0, '2011-12-26'),
(124, 0, 'sh', 'Saint Helena', 'Saint Helena', 1, '2008-01-21', 0, '2011-12-26'),
(125, 0, 'kn', 'Saint Kitts & Nevis Anguilla', 'Saint Kitts & Nevis Anguilla', 1, '2008-01-21', 0, '2011-12-26'),
(126, 0, 'lc', 'Saint Lucia', 'Saint Lucia', 1, '2008-01-21', 0, '2011-12-26'),
(127, 0, 'pm', 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 1, '2008-01-21', 0, '2011-12-26'),
(128, 0, 'st', 'Saint Tome (Sao Tome) and Principe', 'Saint Tome (Sao Tome) and Principe', 1, '2008-01-21', 0, '2011-12-26'),
(129, 0, 'vc', 'Saint Vincent & Grenadines', 'Saint Vincent & Grenadines', 1, '2008-01-21', 0, '2011-12-26'),
(130, 0, 'ws', 'Samoa', 'Samoa', 1, '2008-01-21', 0, '2011-12-26'),
(131, 0, 'sm', 'San Marino', 'San Marino', 1, '2008-01-21', 0, '2011-12-26'),
(132, 0, 'sa', 'Saudi Arabia', 'Saudi Arabia', 1, '2008-01-21', 0, '2011-12-26'),
(133, 0, 'sn', 'Senegal', 'Senegal', 1, '2008-01-21', 0, '2011-12-26'),
(134, 0, 'sc', 'Seychelles', 'Seychelles', 1, '2008-01-21', 0, '2011-12-26'),
(135, 0, 'sl', 'Sierra Leone', 'Sierra Leone', 1, '2008-01-21', 0, '2011-12-26'),
(136, 0, 'sg', 'Singapore', 'Singapore', 1, '2008-01-21', 0, '2011-12-26'),
(137, 0, 'sk', 'Slovak Republic', 'Slovak Republic', 1, '2008-01-21', 0, '2011-12-26'),
(138, 0, 'si', 'Slovenia', 'Slovenia', 1, '2008-01-21', 0, '2011-12-26'),
(139, 0, 'sb', 'Solomon Islands', 'Solomon Islands', 1, '2008-01-21', 0, '2011-12-26'),
(140, 0, 'so', 'Somalia', 'Somalia', 1, '2008-01-21', 0, '2011-12-26'),
(141, 0, 'za', 'South Africa', 'South Africa', 1, '2008-01-21', 0, '2011-12-26'),
(142, 0, 'kr', 'South Korea', 'South Korea', 1, '2008-01-21', 0, '2011-12-26'),
(143, 0, 'es', 'Spain', 'Spain', 1, '2008-01-21', 0, '2011-12-26'),
(144, 0, 'lk', 'Sri Lanka', 'Sri Lanka', 1, '2008-01-21', 0, '2011-12-26'),
(145, 0, 'sd', 'Sudan', 'Sudan', 1, '2008-01-21', 0, '2011-12-26'),
(146, 0, 'sr', 'Suricountry_name', 'Suricountry_name', 1, '2008-01-21', 0, '2011-12-26'),
(147, 0, 'sj', 'Svalbard and Jan Mayen Islands', 'Svalbard and Jan Mayen Islands', 1, '2008-01-21', 0, '2011-12-26'),
(148, 0, 'sz', 'Swaziland', 'Swaziland', 1, '2008-01-21', 0, '2011-12-26'),
(149, 0, 'se', 'Sweden', 'Sweden', 1, '2008-01-21', 0, '2011-12-26'),
(150, 0, 'ch', 'Switzerland', 'Switzerland', 1, '2008-01-21', 0, '2011-12-26'),
(151, 0, 'sy', 'Syria', 'Syria', 1, '2008-01-21', 0, '2011-12-26'),
(152, 0, 'tj', 'Tadjikistan', 'Tadjikistan', 1, '2008-01-21', 0, '2011-12-26'),
(153, 0, 'tw', 'Taiwan', 'Taiwan', 1, '2008-01-21', 0, '2011-12-26'),
(154, 0, 'tz', 'Tanzania', 'Tanzania', 1, '2008-01-21', 0, '2011-12-26'),
(155, 0, 'th', 'Thailand', 'Thailand', 1, '2008-01-21', 0, '2011-12-26'),
(156, 0, 'tg', 'Togo', 'Togo', 1, '2008-01-21', 0, '2011-12-26'),
(157, 0, 'tk', 'Tokelau', 'Tokelau', 1, '2008-01-21', 0, '2011-12-26'),
(158, 0, 'to', 'Tonga', 'Tonga', 1, '2008-01-21', 0, '2011-12-26'),
(159, 0, 'tt', 'Trinidad and Tobago', 'Trinidad and Tobago', 1, '2008-01-21', 0, '2011-12-26'),
(160, 0, 'tn', 'Tunisia', 'Tunisia', 1, '2008-01-21', 0, '2011-12-26'),
(161, 0, 'tr', 'Turkey', 'Turkey', 1, '2008-01-21', 0, '2011-12-26'),
(162, 0, 'tm', 'Turkmenistan', 'Turkmenistan', 1, '2008-01-21', 0, '2011-12-26'),
(163, 0, 'tc', 'Turks and Caicos Islands', 'Turks and Caicos Islands', 1, '2008-01-21', 0, '2011-12-26'),
(164, 0, 'tv', 'Tuvalu', 'Tuvalu', 1, '2008-01-21', 0, '2011-12-26'),
(165, 0, 'ug', 'Uganda', 'Uganda', 1, '2008-01-21', 0, '2011-12-26'),
(166, 0, 'ua', 'Ukraine', 'Ukraine', 1, '2008-01-21', 0, '2011-12-26'),
(167, 0, 'ae', 'United Arab Emirates', 'United Arab Emirates', 1, '2008-01-21', 0, '2011-12-26'),
(168, 0, 'uk', 'United Kingdom', 'United Kingdom', 1, '2008-01-21', 0, '2011-12-26'),
(169, 0, 'us', 'United States', 'United States', 1, '2008-01-21', 0, '2011-12-26'),
(170, 0, 'uy', 'Uruguay', 'Uruguay', 1, '2008-01-21', 0, '2011-12-26'),
(171, 0, 'uz', 'Uzbekistan', 'Uzbekistan', 1, '2008-01-21', 0, '2011-12-26'),
(172, 0, 'vu', 'Vanuatu', 'Vanuatu', 1, '2008-01-21', 0, '2011-12-26'),
(173, 0, 'va', 'Vatican City State', 'Vatican City State', 1, '2008-01-21', 0, '2011-12-26'),
(174, 0, 've', 'Venezuela', 'Venezuela', 1, '2008-01-21', 0, '2011-12-26'),
(175, 0, 'vn', 'Vietnam', 'Vietnam', 1, '2008-01-21', 0, '2011-12-26'),
(176, 0, 'vg', 'Virgin Islands (British)', 'Virgin Islands (British)', 1, '2008-01-21', 0, '2011-12-26'),
(177, 0, 'vi', 'Virgin Islands (USA)', 'Virgin Islands (USA)', 1, '2008-01-21', 0, '2011-12-26'),
(178, 0, 'wf', 'Wallis and Futuna Islands', 'Wallis and Futuna Islands', 1, '2008-01-21', 0, '2011-12-26'),
(179, 0, 'eh', 'Western Sahara', 'Western Sahara', 1, '2008-01-21', 0, '2011-12-26'),
(180, 0, 'ye', 'Yemen', 'Yemen', 1, '2008-01-21', 0, '2011-12-26'),
(181, 0, 'yu', 'Yugoslavia', 'Yugoslavia', 1, '2008-01-21', 0, '2011-12-26'),
(182, 0, 'zr', 'Zaire', 'Zaire', 1, '2008-01-21', 0, '2011-12-26'),
(183, 0, 'zm', 'Zambia', 'Zambia', 1, '2008-01-21', 0, '2011-12-26'),
(184, 0, 'zw', 'Zimbabwe', 'Zimbabwe', 1, '2008-01-21', 0, '2011-12-26'),
(185, 0, 'au', 'Australia', 'Australia-Kangaroo', 1, '2012-01-02', 1, '2012-01-02'),
(186, 0, 'me', 'Malee', 'Malee', 1, '2012-01-03', 0, NULL),
(187, 0, 'cr', 'Czech Republic', 'test description updated', 1, '2012-01-12', 0, '2012-01-12'),
(188, 0, 'aus', 'Austria', '', 0, '2012-12-13', 0, '2012-12-13'),
(189, 0, 'BE', 'Belgium', '', 0, '2012-12-13', 0, '2012-12-13');

-- --------------------------------------------------------

--
-- Table structure for table `crf_name_texts`
--

CREATE TABLE IF NOT EXISTS `crf_name_texts` (
  `crf_name_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `crf_code` char(255) DEFAULT NULL,
  `crf_name` char(255) DEFAULT NULL,
  `crf_text` char(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`crf_name_text_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crf_pages`
--

CREATE TABLE IF NOT EXISTS `crf_pages` (
  `crf_page_id` int(11) NOT NULL AUTO_INCREMENT,
  `crf_id` int(11) NOT NULL DEFAULT '0',
  `page_code` char(250) NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `page_name_text_id` int(11) NOT NULL DEFAULT '0',
  `template` char(250) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`crf_page_id`),
  KEY `crf_id` (`crf_id`),
  KEY `page_name_text_id` (`page_name_text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crf_patient_data`
--

CREATE TABLE IF NOT EXISTS `crf_patient_data` (
  `crf_patient_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `study_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `patientCrf_id` int(11) NOT NULL,
  `section` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text,
  `modified_by` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`crf_patient_data_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `crf_patient_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `crf_questions`
--

CREATE TABLE IF NOT EXISTS `crf_questions` (
  `crf_question_id` int(11) NOT NULL AUTO_INCREMENT,
  `crf_id` int(11) NOT NULL DEFAULT '0',
  `code` char(255) NOT NULL,
  `crf_section_id` int(11) NOT NULL DEFAULT '0',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `is_mandatory` char(1) NOT NULL DEFAULT '',
  `is_hidden` char(1) NOT NULL DEFAULT '',
  `question_text_id` int(11) NOT NULL DEFAULT '0',
  `question_type_id` int(11) DEFAULT NULL,
  `question_size` tinyint(4) DEFAULT NULL,
  `lab_id` int(11) DEFAULT NULL,
  `preferred_unit_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`crf_question_id`),
  KEY `crf_id` (`crf_id`),
  KEY `crf_section_id` (`crf_section_id`),
  KEY `question_text_id` (`question_text_id`),
  KEY `question_type_id` (`question_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crf_question_answer_lists`
--

CREATE TABLE IF NOT EXISTS `crf_question_answer_lists` (
  `crf_question_answer_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `crf_question_id` int(11) NOT NULL DEFAULT '0',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `answer_text_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`crf_question_answer_list_id`),
  KEY `crf_question_id` (`crf_question_id`),
  KEY `answer_text_id` (`answer_text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crf_sections`
--

CREATE TABLE IF NOT EXISTS `crf_sections` (
  `crf_section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_code` char(250) NOT NULL DEFAULT '',
  `crf_page_id` int(11) NOT NULL DEFAULT '0',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `section_name_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`crf_section_id`),
  KEY `crf_page_id` (`crf_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_dictionary`
--

CREATE TABLE IF NOT EXISTS `data_dictionary` (
  `data_dictionary_id` int(10) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) NOT NULL DEFAULT '',
  `column_name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `created_by` int(10) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(10) NOT NULL DEFAULT '0',
  `date_modified` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`data_dictionary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `default_answer_texts`
--

CREATE TABLE IF NOT EXISTS `default_answer_texts` (
  `default_answer_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `question_text_id` int(11) NOT NULL DEFAULT '0',
  `display_order` int(11) DEFAULT NULL,
  `answer_text_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`default_answer_text_id`),
  KEY `question_text_id` (`question_text_id`),
  KEY `answer_text_id` (`answer_text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `discrepancies`
--

CREATE TABLE IF NOT EXISTS `discrepancies` (
  `discrepancy_id` int(11) NOT NULL AUTO_INCREMENT,
  `received_crf_id` int(11) NOT NULL DEFAULT '0',
  `discrepancy_number` int(11) NOT NULL DEFAULT '0',
  `response_id` int(11) NOT NULL DEFAULT '0',
  `response_value` varchar(255) DEFAULT NULL,
  `response_answer_text_id` int(11) DEFAULT NULL,
  `resolution_id` int(11) DEFAULT NULL,
  `query_id` int(11) DEFAULT NULL,
  `validation_rule_id` int(11) DEFAULT NULL,
  `discrepancy_text` varchar(255) DEFAULT NULL,
  `discrepancy_text_id` int(11) DEFAULT NULL,
  `action_text` varchar(255) DEFAULT NULL,
  `action_text_id` int(11) DEFAULT NULL,
  `explanation` longtext,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `is_manual_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`discrepancy_id`),
  KEY `received_crf_id` (`received_crf_id`),
  KEY `validation_rule_id` (`validation_rule_id`),
  KEY `discrepancy_text_id` (`discrepancy_text_id`),
  KEY `response_answer_text_id` (`response_answer_text_id`),
  KEY `action_text_id` (`action_text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `discrepancy_on_crf`
--

CREATE TABLE IF NOT EXISTS `discrepancy_on_crf` (
  `discrepancy_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_crf_id` int(11) NOT NULL,
  `study_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `question_text` varchar(255) NOT NULL,
  `discrepancy_text` text NOT NULL,
  `responce_text` text,
  `status` varchar(255) DEFAULT 'Open',
  `section` varchar(255) DEFAULT NULL,
  `orignal_value` varchar(255) DEFAULT NULL,
  `current_value` varchar(255) DEFAULT NULL,
  `reasion` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_date` date DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`discrepancy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `discrepancy_texts`
--

CREATE TABLE IF NOT EXISTS `discrepancy_texts` (
  `DISCREPANCY_TEXT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` int(11) NOT NULL DEFAULT '0',
  `CODE` varchar(100) NOT NULL DEFAULT '',
  `NAME` varchar(100) NOT NULL DEFAULT '',
  `TEXT` varchar(255) NOT NULL,
  `CREATED_BY` int(11) NOT NULL DEFAULT '0',
  `DATE_CREATED` date NOT NULL,
  `MODIFIED_BY` int(11) NOT NULL DEFAULT '0',
  `DATE_MODIFIED` date DEFAULT NULL,
  PRIMARY KEY (`DISCREPANCY_TEXT_ID`),
  KEY `LANGUAGE_ID` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `study_document_id` int(11) NOT NULL,
  `data` blob NOT NULL,
  PRIMARY KEY (`study_document_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE IF NOT EXISTS `drugs` (
  `drug_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(250) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `dose` varchar(255) DEFAULT NULL,
  `normal_value` int(11) DEFAULT NULL,
  `per_normal_value` int(11) DEFAULT '0',
  `refillable` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `instructions` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `date_created` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `drugs`
--

-- --------------------------------------------------------

--
-- Table structure for table `email_message`
--

CREATE TABLE IF NOT EXISTS `email_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `email_message`
--

INSERT INTO `email_message` (`message_id`, `message`) VALUES
(1, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\n<head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\r\n<title>The CTMS</title>\r\n<style>\r\nbody{ margin:0; font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#666;}\r\n.line{ background-color:#bcbcbc;}\r\nh1{ font-family:Arial, Helvetica, sans-serif; font-size:28px; color:#0e8ecd; margin:0; padding:0;}\r\nh2{ font-family:Arial, Helvetica, sans-serif; font-size:14px; color:#0e8ecd; margin:0; padding:0;}\r\na:link{ font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#0e8ecd; text-decoration:underline;}\r\na:visited{ font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#0e8ecd; text-decoration:underline;}\r\na:active{ font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#0e8ecd; text-decoration:underline;}\r\na:hover{ font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#0e8ecd; text-decoration:none;}\r\n\r\n.background_grey{ background-color:#eee; padding:10px;}\r\n\r\n</style>\r\n</head>\r\n\r\n<body>\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n  <tr>\r\n    <td valign="top" align="center">\r\n    <table width="600" border="0" cellspacing="0" cellpadding="0">\r\n  <tr>\r\n    <td valign="middle" align="left"><img src="https://72.167.246.31/thectms/logo.jpg" /></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="5" class="line" ></td>\r\n  </tr>\r\n  <tr>\r\n    <td valign="middle" align="left" height="50"><h1>Thanks for creating an account.</h1></td>\r\n  </tr>\r\n  <tr>\r\n    <td valign="middle" align="left">You''re all set. You''ll find your username and a link to sign in below.</td>\r\n  </tr>\r\n  <tr>\r\n    <td valign="top" align="left"><br />\r\n    <strong>Your new username is:</strong><br />\r\nUSERNAME <br /><br />\r\n<strong>Your new password is:</strong><br />\r\nPASSWORD <br /><br />\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td valign="top" align="left"><h2>Access your VOXCE account now:</h2>\r\n<a href="http://www.voxce.com">\r\nwww.voxce.com</a><br /><br />\r\n\r\n<strong>VOXCE™</strong> is an affordable SaaS Clinical Trial Management solution providing flexible and configurable tools to help users effectively manage their trials.  This subscription based solution allows each subscription owner to configure their own approval types, submission types, create assessment forms and more.  </td>\r\n  </tr>\r\n  <tr>\r\n    <td>&nbsp;</td>\r\n  </tr>\r\n  \r\n    <tr>\r\n    <td class="background_grey" valign="top" align="left">\r\n    <table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n \r\n  <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>First Name:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp; FNAME </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>Middle Name:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp; MNAME </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>Last Name:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp; LNAME </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>E-mail:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp; EMAIL </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>Address1:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp; ADD1 </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>Address2:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp; ADD2 </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>Address3:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp; ADD3 </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>City:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp; CITY </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>State:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp; STATE </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>Country:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp;	COUNTRY </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>Zip Code:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp;	ZIP </td>\r\n  </tr>\r\n    <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>Phone:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp; PHONE </td>\r\n  </tr>\r\n    <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>Cell:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp; CELL </td>\r\n  </tr>\r\n    <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>Fax:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp; FAX </td>\r\n  </tr>\r\n      <tr>\r\n    <td width="21%" height="20" align="left" valign="middle"><strong>Company:</strong></td>\r\n    <td width="79%" align="left" valign="middle">&nbsp;	COMPANY </td>\r\n  \r\n</table>\r\n\r\n    </td>\r\n  </tr>\r\n    <tr>\r\n    <td height="40" align="left" valign="middle">© 2012, All Rights Reserved.</td>\r\n  </tr>\r\n</table>\r\n\r\n    </td>\r\n  </tr>\r\n</table>\r\n\r\n</body>\r\n</html>');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_schedule`
--

CREATE TABLE IF NOT EXISTS `enrollment_schedule` (
  `enrollment_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `protocol_id` text NOT NULL,
  `version` varchar(250) NOT NULL,
  `month_year` text NOT NULL,
  `patients` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date NOT NULL,
  `next_protocol_date` date DEFAULT '0000-00-00',
  PRIMARY KEY (`enrollment_schedule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `enrollment_schedule`
--

-- --------------------------------------------------------

--
-- Table structure for table `financial_disc`
--

CREATE TABLE IF NOT EXISTS `financial_disc` (
  `financial_disc_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `study_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `signed_dt` date NOT NULL,
  `received_dt` date NOT NULL,
  `type_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date DEFAULT NULL,
  `protocol_id` varchar(11) NOT NULL,
  `protocol_version` varchar(200) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `file_description` varchar(250) NOT NULL,
  `type` varchar(200) NOT NULL,
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`financial_disc_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='financial disclosure' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `GROUP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `GROUP_NAME` varchar(100) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `IS_GLOBAL` varchar(50) NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `DATE_CREATED` date NOT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `DATE_MODIFIED` date NOT NULL,
  PRIMARY KEY (`GROUP_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `groups`
--
-- --------------------------------------------------------

--
-- Table structure for table `group_rights`
--

CREATE TABLE IF NOT EXISTS `group_rights` (
  `GROUP_RIGHT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL DEFAULT '0',
  `RESOURCE_ID` int(11) NOT NULL DEFAULT '0',
  `RIGHT_TYPE_ID` int(11) NOT NULL DEFAULT '0',
  `CREATED_BY` int(11) NOT NULL,
  `DATE_CREATED` date NOT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `DATE_MODIFIED` date DEFAULT NULL,
  PRIMARY KEY (`GROUP_RIGHT_ID`),
  KEY `GROUP_ID` (`GROUP_ID`),
  KEY `RESOURCE_ID` (`RESOURCE_ID`),
  KEY `RIGHT_TYPE_ID` (`RIGHT_TYPE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2533 ;

--
-- Dumping data for table `group_rights`

-- --------------------------------------------------------

--
-- Table structure for table `label_texts`
--

CREATE TABLE IF NOT EXISTS `label_texts` (
  `label_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `code` char(255) DEFAULT NULL,
  `name` char(255) DEFAULT NULL,
  `text` char(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`label_text_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `labratory`
--

CREATE TABLE IF NOT EXISTS `labratory` (
  `labratory_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `lab_name` char(255) NOT NULL DEFAULT '',
  `email` char(255) DEFAULT NULL,
  `address1` char(255) DEFAULT NULL,
  `address2` char(255) DEFAULT NULL,
  `address3` char(255) DEFAULT NULL,
  `city` char(255) DEFAULT NULL,
  `state` char(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `postal_code` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `cell` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`labratory_id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `labratory`
--

-- --------------------------------------------------------

--
-- Table structure for table `labs`
--

CREATE TABLE IF NOT EXISTS `labs` (
  `lab_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `code` char(255) NOT NULL,
  `name` char(255) NOT NULL,
  `description` char(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lab_normals`
--

CREATE TABLE IF NOT EXISTS `lab_normals` (
  `lab_normal_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `labratory_id` int(11) NOT NULL DEFAULT '0',
  `lab_id` int(11) NOT NULL DEFAULT '0',
  `unit_id` int(11) NOT NULL DEFAULT '0',
  `normal_low` int(11) NOT NULL DEFAULT '0',
  `normal_low_unit` int(11) NOT NULL DEFAULT '0',
  `normal_high` int(11) NOT NULL DEFAULT '0',
  `normal_high_unit` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`lab_normal_id`),
  KEY `labratory_id` (`labratory_id`),
  KEY `unit_id` (`unit_id`),
  KEY `lab_id` (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` char(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `language_id` (`language_id`),
  KEY `language_id_2` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=140 ;

--
-- Dumping data for table `languages`
--

-- --------------------------------------------------------

--
-- Table structure for table `medical_license`
--

CREATE TABLE IF NOT EXISTS `medical_license` (
  `site_id` int(11) NOT NULL,
  `study_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `begin_dt` date NOT NULL,
  `start_dt` date NOT NULL,
  `expire_dt` date NOT NULL,
  `type_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `medical_lic_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date NOT NULL,
  `filename` varchar(200) NOT NULL,
  `file_description` varchar(250) NOT NULL,
  `type` varchar(200) NOT NULL,
  `data` mediumblob NOT NULL,
  `protocol_id` varchar(11) NOT NULL,
  `protocol_version` varchar(200) NOT NULL,
  PRIMARY KEY (`medical_lic_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Medical Licenses' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_page_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `template` varchar(255) DEFAULT NULL,
  `description` longtext,
  `page_keywords` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  KEY `resource_id` (`resource_id`),
  KEY `parent_page_id` (`parent_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `page_links`
--

CREATE TABLE IF NOT EXISTS `page_links` (
  `page_link_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_page_id` int(11) NOT NULL DEFAULT '0',
  `to_page_id` int(11) NOT NULL DEFAULT '0',
  `link_parameters` char(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`page_link_id`),
  KEY `from_page_id` (`from_page_id`),
  KEY `to_page_id` (`to_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `page_name_texts`
--

CREATE TABLE IF NOT EXISTS `page_name_texts` (
  `page_name_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `code` char(250) DEFAULT NULL,
  `name` char(250) NOT NULL,
  `text` char(250) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`page_name_text_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `patent_crf`
--

CREATE TABLE IF NOT EXISTS `patent_crf` (
  `patient_crf` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `crf_id` int(11) NOT NULL,
  `crf_name` varchar(255) DEFAULT NULL,
  `crf_html` text NOT NULL,
  `crf_status` varchar(25) NOT NULL DEFAULT 'unfilled',
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `filld_by` int(11) NOT NULL DEFAULT '0',
  `filled_date` date NOT NULL DEFAULT '1901-01-01',
  PRIMARY KEY (`patient_crf`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=145 ;

--
-- Dumping data for table `patent_crf`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE IF NOT EXISTS `patients` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `study_id` int(11) NOT NULL DEFAULT '0',
  `patient_number` char(10) NOT NULL DEFAULT '',
  `site_id` int(11) NOT NULL DEFAULT '0',
  `initials` varchar(5) DEFAULT NULL,
  `gender` char(1) NOT NULL DEFAULT '',
  `date_of_birth` date DEFAULT NULL,
  `date_of_informed_consent` date DEFAULT NULL,
  `date_of_randomization` date DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `study_id` (`study_id`),
  KEY `study_site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `patients`
--

-- --------------------------------------------------------

--
-- Table structure for table `patient_payment`
--

CREATE TABLE IF NOT EXISTS `patient_payment` (
  `patient_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_code_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `study_id` int(11) NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `crf_id` int(11) DEFAULT NULL,
  `payment_amount` double NOT NULL,
  `cheque_no` int(11) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `po` varchar(20) DEFAULT NULL,
  `invoice` varchar(20) DEFAULT NULL,
  `over_head` int(11) DEFAULT NULL,
  `total_payment` double NOT NULL,
  `paid` int(11) DEFAULT NULL,
  `pay_to` int(11) DEFAULT NULL,
  `pay_to_user_name` varchar(20) DEFAULT NULL,
  `pay_to_user_address` varchar(250) DEFAULT NULL,
  `payment_status` varchar(25) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`patient_payment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `site_id` (`site_id`),
  KEY `study_id` (`study_id`),
  KEY `visit_id` (`visit_id`),
  KEY `payment_code_id_2` (`payment_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `patient_visits`
--

CREATE TABLE IF NOT EXISTS `patient_visits` (
  `patient_visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `visit_id` int(11) NOT NULL DEFAULT '0',
  `visit_date` date DEFAULT NULL,
  `visit_status` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  `optimum_days` int(11) NOT NULL DEFAULT '0',
  `start_date_for_visit` date DEFAULT NULL,
  `last_date_for_visit` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT 'Missed',
  `rel_visit_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_visit_id`),
  KEY `patient_id` (`patient_id`),
  KEY `visit_status_id` (`visit_status`),
  KEY `visit_id` (`visit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=145 ;

--
-- Dumping data for table `patient_visits`
--

-- --------------------------------------------------------

--
-- Table structure for table `payment_code`
--

CREATE TABLE IF NOT EXISTS `payment_code` (
  `payment_code_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL,
  `study_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `text` varchar(100) NOT NULL,
  `Related_to` varchar(20) NOT NULL,
  `description` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`payment_code_id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_schedule`
--

CREATE TABLE IF NOT EXISTS `payment_schedule` (
  `payment_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `site` int(11) DEFAULT NULL,
  `payment_type` int(11) NOT NULL,
  `visit` int(11) NOT NULL,
  `crf` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `amount` double NOT NULL,
  `description` varchar(500) NOT NULL,
  `created_by` int(10) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(10) NOT NULL,
  `date_modified` date NOT NULL,
  PRIMARY KEY (`payment_schedule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `protocol_versions`
--

CREATE TABLE IF NOT EXISTS `protocol_versions` (
  `protocol_version_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `study_id` int(11) NOT NULL,
  `protocol_id` text NOT NULL,
  `version` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `duration` int(11) NOT NULL,
  `max_enrollment` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`protocol_version_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `protocol_versions`
--

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE IF NOT EXISTS `queries` (
  `query_id` int(11) NOT NULL AUTO_INCREMENT,
  `query_number` int(11) NOT NULL DEFAULT '0',
  `received_crf_id` int(11) NOT NULL DEFAULT '0',
  `query_status_id` int(11) NOT NULL DEFAULT '0',
  `verified_by` int(11) DEFAULT NULL,
  `date_verified` date DEFAULT NULL,
  `received_by` int(11) DEFAULT NULL,
  `date_reviewed` date DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`query_id`),
  KEY `received_crf_id` (`received_crf_id`),
  KEY `query_status_id` (`query_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `query_statuses`
--

CREATE TABLE IF NOT EXISTS `query_statuses` (
  `query_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` longtext,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`query_status_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `question_html`
--

CREATE TABLE IF NOT EXISTS `question_html` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `question_name` text NOT NULL,
  `question_edit_html` text NOT NULL,
  `question_html` text NOT NULL,
  `createdBy` int(11) NOT NULL,
  `modfiedBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `modifiedDate` date NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=24 ;

--
-- Dumping data for table `question_html`
--

-- --------------------------------------------------------

--
-- Table structure for table `question_logs`
--

CREATE TABLE IF NOT EXISTS `question_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `question_name` varchar(255) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `change_info` text NOT NULL,
  `modified_date` date NOT NULL,
  `modified_time` time NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `question_logs`
--

-- --------------------------------------------------------

--
-- Table structure for table `question_texts`
--

CREATE TABLE IF NOT EXISTS `question_texts` (
  `question_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `code` char(255) NOT NULL,
  `name` char(255) NOT NULL,
  `text` char(255) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`question_text_id`),
  KEY `category_id` (`category_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `question_types`
--

CREATE TABLE IF NOT EXISTS `question_types` (
  `question_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`question_type_id`),
  UNIQUE KEY `question_type_id` (`question_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `received_crfs`
--

CREATE TABLE IF NOT EXISTS `received_crfs` (
  `received_crf_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(250) NOT NULL,
  `patient_visit_id` int(11) NOT NULL DEFAULT '0',
  `visit_crf_id` int(11) NOT NULL DEFAULT '0',
  `received_crf_status_id` int(11) NOT NULL DEFAULT '0',
  `date_verified` date DEFAULT NULL,
  `verified_by` int(11) DEFAULT NULL,
  `reviewed_by` int(11) DEFAULT NULL,
  `date_reviewed` date DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`received_crf_id`),
  KEY `patient_visit_id` (`patient_visit_id`),
  KEY `visit_crf_id` (`visit_crf_id`),
  KEY `received_crf_status_id` (`received_crf_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `received_crf_statuses`
--

CREATE TABLE IF NOT EXISTS `received_crf_statuses` (
  `received_crf_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `description` longtext,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`received_crf_status_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `received_monitor`
--

CREATE TABLE IF NOT EXISTS `received_monitor` (
  `received_monitor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(250) NOT NULL,
  `patient_visit_id` int(11) NOT NULL DEFAULT '0',
  `visit_monitor_id` int(11) NOT NULL DEFAULT '0',
  `status_id` int(11) NOT NULL DEFAULT '0',
  `date_verified` date DEFAULT NULL,
  `verified_by` int(11) DEFAULT NULL,
  `reviewed_by` int(11) DEFAULT NULL,
  `date_reviewed` date DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`received_monitor_id`),
  KEY `patient_visit_id` (`patient_visit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `resolutions`
--

CREATE TABLE IF NOT EXISTS `resolutions` (
  `resolution_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`resolution_id`),
  UNIQUE KEY `resolution_id_2` (`resolution_id`),
  KEY `resolution_id` (`resolution_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE IF NOT EXISTS `resources` (
  `resource_id` int(11) NOT NULL,
  `code` varchar(60) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date NOT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`resource_id`, `code`, `created_by`, `date_created`, `modified_by`, `date_modified`) VALUES
(1, 'Home', 1, '2012-07-22', 1, '2012-07-22'),
(2, 'STUDY', 1, '2012-07-22', 1, '2012-07-22'),
(3, 'Study List', 1, '2012-07-22', 1, '2012-07-22'),
(4, 'Create Study', 1, '2012-07-22', 1, '2012-07-22'),
(5, 'Edit Study', 1, '2012-07-22', 1, '2012-07-22'),
(6, 'View Study', 1, '2012-07-22', 1, '2012-07-22'),
(7, 'Edit Study', 1, '2012-07-22', 1, '2012-07-22'),
(8, 'View Study Sites', 1, '2012-07-22', 1, '2012-07-22'),
(9, 'Enrollment Schedule', 1, '2012-07-22', 1, '2012-07-22'),
(10, 'View Study Detail', 1, '2012-07-22', 1, '2012-07-22'),
(11, 'View Study Investigators', 1, '2012-07-22', 1, '2012-07-22'),
(12, 'View Study Users', 1, '2012-07-22', 1, '2012-07-22'),
(13, 'View Study Laboratory', 1, '2012-07-22', 1, '2012-07-22'),
(14, 'View Site Details', 1, '2012-07-22', 1, '2012-07-22'),
(15, 'View Document', 1, '2012-07-22', 1, '2012-07-22'),
(16, 'Download Document', 1, '2012-07-22', 1, '2012-07-22'),
(17, 'Delete Document', 1, '2012-07-22', 1, '2012-07-22'),
(18, 'View Study Site Investigators', 1, '2012-07-22', 1, '2012-07-22'),
(19, 'View Study Site Users', 1, '2012-07-22', 1, '2012-07-22'),
(20, 'View Study Site Laboratories', 1, '2012-07-22', 1, '2012-07-22'),
(21, 'Discripency in Study', 1, '2012-07-22', 1, '2012-07-22'),
(22, 'Payment', 1, '2012-07-22', 1, '2012-07-22'),
(23, 'View Payments', 1, '2012-07-22', 1, '2012-07-22'),
(24, 'Edit Payments', 1, '2012-07-22', 1, '2012-07-22'),
(25, 'Add Payments', 1, '2012-07-22', 1, '2012-07-22'),
(26, 'Create Study Payment', 1, '2012-07-22', 1, '2012-07-22'),
(27, 'Create Site Payment', 1, '2012-07-22', 1, '2012-07-22'),
(28, 'Create Visit CRF Payment', 1, '2012-07-22', 1, '2012-07-22'),
(29, 'View Payment Code', 1, '2012-07-22', 1, '2012-07-22'),
(30, 'Edit Payment Code', 1, '2012-07-22', 1, '2012-07-22'),
(31, 'Create Payment Code', 1, '2012-07-22', 1, '2012-07-22'),
(32, 'View Payment Schedule', 1, '2012-07-22', 1, '2012-07-22'),
(33, 'Edit Payment Schedule', 1, '2012-07-22', 1, '2012-07-22'),
(34, 'Create Payment Schedule', 1, '2012-07-22', 1, '2012-07-22'),
(35, 'Trail Managment', 1, '2012-07-22', 1, '2012-07-22'),
(36, 'View Approval Status Type', 1, '2012-07-22', 1, '2012-07-22'),
(37, 'Add Approval Status Type', 1, '2012-07-22', 1, '2012-07-22'),
(38, 'Edit Approval Status Type', 1, '2012-07-22', 1, '2012-07-22'),
(39, 'View Training Type', 1, '2012-07-22', 1, '2012-07-22'),
(40, 'Edit Training Type', 1, '2012-07-22', 1, '2012-07-22'),
(41, 'Download Training Type', 1, '2012-07-22', 1, '2012-07-22'),
(42, 'Add Training Type', 1, '2012-07-22', 1, '2012-07-22'),
(43, 'View User CV', 1, '2012-07-22', 1, '2012-07-22'),
(44, 'Download User CV', 1, '2012-07-22', 1, '2012-07-22'),
(45, 'Edit User CV', 1, '2012-07-22', 1, '2012-07-22'),
(46, 'Create User CV', 1, '2012-07-22', 1, '2012-07-22'),
(47, 'View User Training', 1, '2012-07-22', 1, '2012-07-22'),
(48, 'Edit User Training', 1, '2012-07-22', 1, '2012-07-22'),
(49, 'Create User Training', 1, '2012-07-22', 1, '2012-07-22'),
(50, 'View Submissions', 1, '2012-07-22', 1, '2012-07-22'),
(51, 'Edit Submissions', 1, '2012-07-22', 1, '2012-07-22'),
(52, 'Add Submissions', 1, '2012-07-22', 1, '2012-07-22'),
(53, 'Download Submissions', 1, '2012-07-22', 1, '2012-07-22'),
(54, 'View Medical License', 1, '2012-07-22', 1, '2012-07-22'),
(55, 'Edit Medical License', 1, '2012-07-22', 1, '2012-07-22'),
(56, 'Download Medical License', 1, '2012-07-22', 1, '2012-07-22'),
(57, 'Create Medical License', 1, '2012-07-22', 1, '2012-07-22'),
(58, 'View Financial Disclosure', 1, '2012-07-22', 1, '2012-07-22'),
(59, 'Edit Financial Disclosure', 1, '2012-07-22', 1, '2012-07-22'),
(60, 'Download Financial Disclosure', 1, '2012-07-22', 1, '2012-07-22'),
(61, 'Create Financial Disclosure', 1, '2012-07-22', 1, '2012-07-22'),
(62, 'View Contracts', 1, '2012-07-22', 1, '2012-07-22'),
(63, 'View Contracts', 1, '2012-07-22', 1, '2012-07-22'),
(64, 'Create Contracts', 1, '2012-07-22', 1, '2012-07-22'),
(65, 'Edit Contracts', 1, '2012-07-22', 1, '2012-07-22'),
(66, 'Download Contracts', 1, '2012-07-22', 1, '2012-07-22'),
(67, 'Patients', 1, '2012-07-22', 1, '2012-07-22'),
(68, 'View Patients', 1, '2012-07-22', 1, '2012-07-22'),
(69, 'Add Patient', 1, '2012-07-22', 1, '2012-07-22'),
(70, 'Edit Patient', 1, '2012-07-22', 1, '2012-07-22'),
(71, 'Patient Visits History', 1, '2012-07-22', 1, '2012-07-22'),
(72, 'Patient Advers Event Visit History', 1, '2012-07-22', 1, '2012-07-22'),
(73, 'Patient Monitor Visit History', 1, '2012-07-22', 1, '2012-07-22'),
(74, 'Patient Case Report Forms', 1, '2012-07-22', 1, '2012-07-22'),
(75, 'Fill Patient Case Report Forms', 1, '2012-07-22', 1, '2012-07-22'),
(76, 'User Management', 1, '2012-07-22', 1, '2012-07-22'),
(77, 'Create User', 1, '2012-07-22', 1, '2012-07-22'),
(78, 'View User', 1, '2012-07-22', 1, '2012-07-22'),
(79, 'Edit User', 1, '2012-07-22', 1, '2012-07-22'),
(80, 'Avtive/Inaactive User', 1, '2012-07-22', 1, '2012-07-22'),
(81, 'User Groups', 1, '2012-07-22', 1, '2012-07-22'),
(82, 'Group Management', 1, '2012-07-22', 1, '2012-07-22'),
(83, 'Create Group', 1, '2012-07-22', 1, '2012-07-22'),
(84, 'Edit Group', 1, '2012-07-22', 1, '2012-07-22'),
(85, 'Set Group Rights', 1, '2012-07-22', 1, '2012-07-22'),
(86, 'Library', 1, '2012-07-22', 1, '2012-07-22'),
(87, 'Drugs', 1, '2012-07-22', 1, '2012-07-22'),
(88, 'Add Drugs', 1, '2012-07-22', 1, '2012-07-22'),
(89, 'View Drugs', 1, '2012-07-22', 1, '2012-07-22'),
(90, 'Edit Drugs', 1, '2012-07-22', 1, '2012-07-22'),
(91, 'Countries', 1, '2012-07-22', 1, '2012-07-22'),
(92, 'Add Countries', 1, '2012-07-22', 1, '2012-07-22'),
(93, 'View Countries', 1, '2012-07-22', 1, '2012-07-22'),
(94, 'Edit Countries', 1, '2012-07-22', 1, '2012-07-22'),
(95, 'Labs', 1, '2012-07-22', 1, '2012-07-22'),
(96, 'Add Labs', 1, '2012-07-22', 1, '2012-07-22'),
(97, 'View Labs', 1, '2012-07-22', 1, '2012-07-22'),
(98, 'Edit Labs', 1, '2012-07-22', 1, '2012-07-22'),
(99, 'Laboratory', 1, '2012-07-22', 1, '2012-07-22'),
(100, 'Add Laboratory', 1, '2012-07-22', 1, '2012-07-22'),
(101, 'View Laboratory', 1, '2012-07-22', 1, '2012-07-22'),
(102, 'Edit Laboratory', 1, '2012-07-22', 1, '2012-07-22'),
(103, 'Units of Measures', 1, '2012-07-22', 1, '2012-07-22'),
(104, 'Add Units of Measure', 1, '2012-07-22', 1, '2012-07-22'),
(105, 'View Units of Measure', 1, '2012-07-22', 1, '2012-07-22'),
(106, 'Edit Units of Measure', 1, '2012-07-22', 1, '2012-07-22'),
(107, 'Action Texts', 1, '2012-07-22', 1, '2012-07-22'),
(108, 'Add Action Texts', 1, '2012-07-22', 1, '2012-07-22'),
(109, 'View Action Texts', 1, '2012-07-22', 1, '2012-07-22'),
(110, 'Edit Action Texts', 1, '2012-07-22', 1, '2012-07-22'),
(111, 'Categories', 1, '2012-07-22', 1, '2012-07-22'),
(112, 'Add Categories', 1, '2012-07-22', 1, '2012-07-22'),
(113, 'View Categories', 1, '2012-07-22', 1, '2012-07-22'),
(114, 'Edit Categories', 1, '2012-07-22', 1, '2012-07-22'),
(115, 'Query Statuses', 1, '2012-07-22', 1, '2012-07-22'),
(116, 'Add Query Status', 1, '2012-07-22', 1, '2012-07-22'),
(117, 'View Query Statuses', 1, '2012-07-22', 1, '2012-07-22'),
(118, 'Edit Query Statuses', 1, '2012-07-22', 1, '2012-07-22'),
(119, 'Resolutions', 1, '2012-07-22', 1, '2012-07-22'),
(120, 'Add Resolution', 1, '2012-07-22', 1, '2012-07-22'),
(121, 'View Resolutions', 1, '2012-07-22', 1, '2012-07-22'),
(122, 'Edit Resolutions', 1, '2012-07-22', 1, '2012-07-22'),
(123, 'Discrepency Texts', 1, '2012-07-22', 1, '2012-07-22'),
(124, 'Add Discrepency Text', 1, '2012-07-22', 1, '2012-07-22'),
(125, 'View Discrepency Texts', 1, '2012-07-22', 1, '2012-07-22'),
(126, 'Edit Discrepency Texts', 1, '2012-07-22', 1, '2012-07-22'),
(127, 'Recieved CRF Statuses', 1, '2012-07-22', 1, '2012-07-22'),
(128, 'Add Recieved CRF Statuses', 1, '2012-07-22', 1, '2012-07-22'),
(129, 'View Recieved CRF Statuses', 1, '2012-07-22', 1, '2012-07-22'),
(130, 'Edit Recieved CRF Statuses', 1, '2012-07-22', 1, '2012-07-22'),
(131, 'Section Name Texts', 1, '2012-07-22', 1, '2012-07-22'),
(132, 'Add Section Name Text', 1, '2012-07-22', 1, '2012-07-22'),
(133, 'View Section Name Texts', 1, '2012-07-22', 1, '2012-07-22'),
(134, 'Edit Section Name Texts', 1, '2012-07-22', 1, '2012-07-22'),
(135, 'Validation Rules', 1, '2012-07-22', 1, '2012-07-22'),
(136, 'Add Validation Rule', 1, '2012-07-22', 1, '2012-07-22'),
(137, 'View Validation Rule', 1, '2012-07-22', 1, '2012-07-22'),
(138, 'Edit Validation Rule', 1, '2012-07-22', 1, '2012-07-22'),
(139, 'Sponsor & Division', 1, '2012-07-22', 1, '2012-07-22'),
(140, 'Add Sponsor', 1, '2012-07-22', 1, '2012-07-22'),
(141, 'View Sponsor', 1, '2012-07-22', 1, '2012-07-22'),
(142, 'Edit Sponsor', 1, '2012-07-22', 1, '2012-07-22'),
(143, 'Add Division', 1, '2012-07-22', 1, '2012-07-22'),
(144, 'View Division', 1, '2012-07-22', 1, '2012-07-22'),
(145, 'Edit Division', 1, '2012-07-22', 1, '2012-07-22'),
(146, 'Add Sponsor User', 1, '2012-07-22', 1, '2012-07-22'),
(147, 'View Sponsor Users', 1, '2012-07-22', 1, '2012-07-22'),
(148, 'Delete Sponsor Users', 1, '2012-07-22', 1, '2012-07-22'),
(149, 'Sites', 1, '2012-07-22', 1, '2012-07-22'),
(150, 'Add Site', 1, '2012-07-22', 1, '2012-07-22'),
(151, 'View Sites', 1, '2012-07-22', 1, '2012-07-22'),
(152, 'Edit Sites', 1, '2012-07-22', 1, '2012-07-22'),
(153, 'Add Study Site', 1, '2012-07-22', 1, '2012-07-22'),
(154, 'View Study Sites', 1, '2012-07-22', 1, '2012-07-22'),
(155, 'Delete Study Sites', 1, '2012-07-22', 1, '2012-07-22'),
(156, 'View Site Users', 1, '2012-07-22', 1, '2012-07-22'),
(157, 'Study Site Users', 1, '2012-07-22', 1, '2012-07-22'),
(158, 'View Site Laboratory', 1, '2012-07-22', 1, '2012-07-22'),
(159, 'Visits', 1, '2012-07-22', 1, '2012-07-22'),
(160, 'Create Visit', 1, '2012-07-22', 1, '2012-07-22'),
(161, 'View Visit', 1, '2012-07-22', 1, '2012-07-22'),
(162, 'Edit Visit', 1, '2012-07-22', 1, '2012-07-22'),
(163, 'Delete Visit', 1, '2012-07-22', 1, '2012-07-22'),
(164, 'CRF''s', 1, '2012-07-22', 1, '2012-07-22'),
(165, 'Question', 1, '2012-07-22', 1, '2012-07-22'),
(166, 'Create Question', 1, '2012-07-22', 1, '2012-07-22'),
(167, 'View Questions', 1, '2012-07-22', 1, '2012-07-22'),
(168, 'Edit Questions', 1, '2012-07-22', 1, '2012-07-22'),
(169, 'Delete Questions', 1, '2012-07-22', 1, '2012-07-22'),
(170, 'Section', 1, '2012-07-22', 1, '2012-07-22'),
(171, 'Create Section', 1, '2012-07-22', 1, '2012-07-22'),
(172, 'View Section', 1, '2012-07-22', 1, '2012-07-22'),
(173, 'Edit Section', 1, '2012-07-22', 1, '2012-07-22'),
(174, 'Delete Section', 1, '2012-07-22', 1, '2012-07-22'),
(175, 'CRF', 1, '2012-07-22', 1, '2012-07-22'),
(176, 'Create CRF', 1, '2012-07-22', 1, '2012-07-22'),
(177, 'View CRFs', 1, '2012-07-22', 1, '2012-07-22'),
(178, 'Edit CRFs', 1, '2012-07-22', 1, '2012-07-22'),
(179, 'Delete CRFs', 1, '2012-07-22', 1, '2012-07-22'),
(180, 'Reports', 0, '2012-11-01', 0, '2012-11-01'),
(181, 'View Reports', 0, '2012-11-06', 0, '2012-11-06');

-- --------------------------------------------------------

--
-- Table structure for table `resource_rights`
--

CREATE TABLE IF NOT EXISTS `resource_rights` (
  `resource_right_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `right_type_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`resource_right_id`),
  KEY `resource_id` (`resource_id`),
  KEY `right_type_id` (`right_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=357 ;

--
-- Dumping data for table `resource_rights`
--

-- --------------------------------------------------------

--
-- Table structure for table `responses`
--

CREATE TABLE IF NOT EXISTS `responses` (
  `response_id` int(11) NOT NULL AUTO_INCREMENT,
  `response_value` longtext,
  `received_crf_id` int(11) NOT NULL DEFAULT '0',
  `crf_question_id` int(11) NOT NULL DEFAULT '0',
  `answer_text_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`response_id`),
  KEY `received_crf_id` (`received_crf_id`),
  KEY `crf_question_id` (`crf_question_id`),
  KEY `answer_text_id` (`answer_text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `right_types`
--

CREATE TABLE IF NOT EXISTS `right_types` (
  `right_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` tinytext NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date NOT NULL,
  PRIMARY KEY (`right_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rule_action_texts`
--

CREATE TABLE IF NOT EXISTS `rule_action_texts` (
  `rule_action_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `validation_rule_id` int(11) NOT NULL DEFAULT '0',
  `action_text_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`rule_action_text_id`),
  KEY `validation_rule_id` (`validation_rule_id`),
  KEY `action_text_id` (`action_text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rule_discrepancy_texts`
--

CREATE TABLE IF NOT EXISTS `rule_discrepancy_texts` (
  `rule_discrepancy_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `validation_rule_id` int(11) NOT NULL DEFAULT '0',
  `discrepancy_text_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`rule_discrepancy_text_id`),
  KEY `validation_rule_id` (`validation_rule_id`),
  KEY `discrepancy_text_id` (`discrepancy_text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rule_validation_text`
--

CREATE TABLE IF NOT EXISTS `rule_validation_text` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_code` varchar(50) NOT NULL,
  `rule_type` varchar(50) NOT NULL,
  `rule_name` varchar(100) NOT NULL,
  `rule_description` varchar(200) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date NOT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `section_html`
--

CREATE TABLE IF NOT EXISTS `section_html` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `section_name` text NOT NULL,
  `section_edit_html` longtext NOT NULL,
  `section_html` longtext NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `section_html`
--

-- --------------------------------------------------------

--
-- Table structure for table `section_name_texts`
--

CREATE TABLE IF NOT EXISTS `section_name_texts` (
  `section_name_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `snt_code` char(255) NOT NULL DEFAULT '',
  `snt_name` char(255) NOT NULL DEFAULT '',
  `snt_text` char(255) NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`section_name_text_id`,`snt_code`),
  UNIQUE KEY `UI_SECTION_NAME_TEXTS` (`language_id`,`snt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `server_configurations`
--

CREATE TABLE IF NOT EXISTS `server_configurations` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(100) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `port` varchar(5) NOT NULL,
  `from` varchar(50) NOT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `server_configurations`
--

INSERT INTO `server_configurations` (`config_id`, `host`, `user_name`, `password`, `port`, `from`) VALUES
(1, 'smtp.gmail.com', 'info@voxce.com', 'voxce!23', '465', 'info@voxce.com');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE IF NOT EXISTS `sites` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `site_name` char(255) NOT NULL DEFAULT '',
  `email` char(255) DEFAULT NULL,
  `address1` char(255) NOT NULL DEFAULT '',
  `address2` char(255) DEFAULT NULL,
  `address3` char(255) DEFAULT NULL,
  `city` char(255) DEFAULT '',
  `state` char(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `postal_code` char(20) DEFAULT NULL,
  `phone` char(20) NOT NULL DEFAULT '',
  `cell` char(20) DEFAULT NULL,
  `fax` char(20) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `Status` int(1) NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sites`
--


-- --------------------------------------------------------

--
-- Table structure for table `sites_users`
--

CREATE TABLE IF NOT EXISTS `sites_users` (
  `site_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assigned_by` int(11) DEFAULT NULL,
  `assigned_date` date DEFAULT NULL,
  PRIMARY KEY (`site_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `sites_users`
--

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE IF NOT EXISTS `sponsor` (
  `sponsor_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`sponsor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sponsor`
--

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_devision`
--

CREATE TABLE IF NOT EXISTS `sponsor_devision` (
  `devision_id` int(11) NOT NULL AUTO_INCREMENT,
  `sponsor_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`devision_id`),
  KEY `sponsor_id` (`sponsor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sponsor_devision`
--

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_devision_user`
--

CREATE TABLE IF NOT EXISTS `sponsor_devision_user` (
  `sponsor_devision_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `sponsor_id` int(11) NOT NULL,
  `devision_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sponsor_devision_user_id`),
  KEY `sponsor_id` (`sponsor_id`),
  KEY `devision_id` (`devision_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sponsor_devision_user`
--

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_user`
--

CREATE TABLE IF NOT EXISTS `sponsor_user` (
  `sponsor_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sponsor_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date NOT NULL,
  PRIMARY KEY (`sponsor_user_id`),
  KEY `sponsor_id` (`sponsor_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `studies`
--

CREATE TABLE IF NOT EXISTS `studies` (
  `study_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `client_name` int(11) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `study_name` varchar(500) NOT NULL,
  `study_text` text NOT NULL,
  `welcome_template` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`study_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `studies`
--

-- --------------------------------------------------------

--
-- Table structure for table `study_code`
--

CREATE TABLE IF NOT EXISTS `study_code` (
  `study_code_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `study_code` varchar(20) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date NOT NULL,
  PRIMARY KEY (`study_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `study_documents`
--

CREATE TABLE IF NOT EXISTS `study_documents` (
  `study_document_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL DEFAULT '0',
  `study_site_id` int(11) DEFAULT NULL,
  `document_name` varchar(250) NOT NULL DEFAULT '',
  `description` longtext,
  `type` varchar(500) NOT NULL,
  `filename` varchar(250) NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`study_document_id`),
  KEY `study_id` (`study_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `study_documents`
--


-- --------------------------------------------------------

--
-- Table structure for table `study_name_texts`
--

CREATE TABLE IF NOT EXISTS `study_name_texts` (
  `study_name_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `code` char(100) DEFAULT NULL,
  `study_name` char(200) NOT NULL DEFAULT '',
  `study_text` char(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`study_name_text_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `study_payment`
--

CREATE TABLE IF NOT EXISTS `study_payment` (
  `study_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `payment_code_id` int(11) NOT NULL,
  `overhead` int(11) DEFAULT NULL,
  `pay_to` varchar(50) DEFAULT NULL,
  `pay_to_user_name` varchar(20) DEFAULT NULL,
  `pay_to_user_address` varchar(250) DEFAULT NULL,
  `cheque_no` int(11) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `po_no` int(11) DEFAULT NULL,
  `invoice_no` int(11) DEFAULT NULL,
  `payment_status` varchar(30) DEFAULT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `crf_id` int(11) DEFAULT NULL,
  `pay_amount` double NOT NULL,
  `total_payment` double NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date NOT NULL,
  PRIMARY KEY (`study_payment_id`),
  KEY `study_id` (`study_id`,`site_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `study_sites`
--

CREATE TABLE IF NOT EXISTS `study_sites` (
  `study_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `study_site_number` int(11) NOT NULL DEFAULT '0',
  `study_id` int(11) NOT NULL DEFAULT '0',
  `site_id` int(11) NOT NULL DEFAULT '0',
  `principal_investigator_id` int(11) NOT NULL DEFAULT '0',
  `date_activated` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`study_site_id`),
  KEY `principal_investigator_id` (`principal_investigator_id`),
  KEY `study_id` (`study_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `study_sites`
--

INSERT INTO `study_sites` (`study_site_id`, `subscriber_id`, `study_site_number`, `study_id`, `site_id`, `principal_investigator_id`, `date_activated`, `created_by`, `date_created`, `modified_by`, `date_modified`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `study_site_labroratories`
--

CREATE TABLE IF NOT EXISTS `study_site_labroratories` (
  `study_site_lab_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `study_site_id` int(11) NOT NULL DEFAULT '0',
  `lab_id` int(11) NOT NULL DEFAULT '0',
  `is_default` char(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`study_site_lab_id`),
  KEY `study_site_id` (`study_site_id`),
  KEY `lab_id` (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `study_site_users`
--

CREATE TABLE IF NOT EXISTS `study_site_users` (
  `study_site_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `study_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`study_site_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `study_site_users`
--

INSERT INTO `study_site_users` (`study_site_user_id`, `subscriber_id`, `study_id`, `site_id`, `user_id`, `created_by`, `date_created`, `modified_by`, `date_modified`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `study_site_user_patients`
--

CREATE TABLE IF NOT EXISTS `study_site_user_patients` (
  `study_site_user_patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_site_user_id` int(11) NOT NULL DEFAULT '0',
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`study_site_user_patient_id`),
  KEY `study_site_user_id` (`study_site_user_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `study_users`
--

CREATE TABLE IF NOT EXISTS `study_users` (
  `study_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`study_user_id`),
  KEY `study_id` (`study_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `study_user_countries`
--

CREATE TABLE IF NOT EXISTS `study_user_countries` (
  `study_user_country_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_user_id` int(11) NOT NULL DEFAULT '0',
  `country_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`study_user_country_id`),
  KEY `study_user_id` (`study_user_id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `study_user_groups`
--

CREATE TABLE IF NOT EXISTS `study_user_groups` (
  `study_user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_user_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`study_user_group_id`),
  KEY `study_user_id` (`study_user_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE IF NOT EXISTS `submission` (
  `submission_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `protocol_id` varchar(250) NOT NULL,
  `protocol_version` varchar(200) NOT NULL,
  `submission_type_id` int(11) NOT NULL,
  `submission_name` varchar(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `approval_status_type_id` int(11) NOT NULL,
  `submission_date` date NOT NULL,
  `material_sent_date` date DEFAULT NULL,
  `sched_review_date` date DEFAULT NULL,
  `actual_review_date` date DEFAULT NULL,
  `approval_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `letter_file` int(11) DEFAULT NULL,
  `consent_date` date DEFAULT NULL,
  `description` varchar(1000) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `file_description` varchar(250) DEFAULT NULL,
  `regulatorybody_country` varchar(200) NOT NULL,
  `regulatorybody_name` varchar(200) NOT NULL,
  `type` varchar(200) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `data` mediumblob,
  PRIMARY KEY (`submission_id`),
  KEY `protocol_id` (`protocol_id`),
  KEY `submission_type_id` (`submission_type_id`),
  KEY `site_id` (`site_id`),
  KEY `approval_status_type_id` (`approval_status_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `submission_type`
--

CREATE TABLE IF NOT EXISTS `submission_type` (
  `submission_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date NOT NULL,
  PRIMARY KEY (`submission_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

CREATE TABLE IF NOT EXISTS `subscriber` (
  `subscriber_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1',
  `first_visit` int(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`subscriber_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `subscriber`
--

INSERT INTO `subscriber` (`subscriber_id`, `name`, `is_active`, `first_visit`, `created_by`, `date_created`, `modified_by`, `date_modified`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `subscriptionrquest`
--

CREATE TABLE IF NOT EXISTS `subscriptionrquest` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `user_type` varchar(255) NOT NULL DEFAULT 'normal user',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `devision_id` int(11) NOT NULL,
  `preferred_language_id` int(11) NOT NULL DEFAULT '0',
  `login` char(255) NOT NULL,
  `password` char(255) NOT NULL,
  `title` char(255) DEFAULT NULL,
  `first_name` char(255) NOT NULL,
  `middle_name` char(255) DEFAULT NULL,
  `last_name` char(255) NOT NULL,
  `suffix` char(255) DEFAULT NULL,
  `email` char(255) NOT NULL,
  `sha1_password` varchar(40) DEFAULT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `address1` char(255) DEFAULT NULL,
  `address2` char(255) DEFAULT NULL,
  `address3` char(255) DEFAULT NULL,
  `city` char(255) DEFAULT NULL,
  `state` char(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `postal_code` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `cell` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `company` char(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `preferred_language_id` (`preferred_language_id`),
  KEY `country_id` (`country_id`),
  KEY `devision_id` (`devision_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `subscriptionrquest`
--

INSERT INTO `subscriptionrquest` (`user_id`, `subscriber_id`, `user_type`, `is_active`, `devision_id`, `preferred_language_id`, `login`, `password`, `title`, `first_name`, `middle_name`, `last_name`, `suffix`, `email`, `sha1_password`, `salt`, `address1`, `address2`, `address3`, `city`, `state`, `country_id`, `postal_code`, `phone`, `cell`, `fax`, `company`, `last_login`, `last_logout`, `created_by`, `date_created`, `modified_by`, `date_modified`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `substudies`
--

CREATE TABLE IF NOT EXISTS `substudies` (
  `substudy_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `study_id` int(11) NOT NULL,
  `client_name` int(11) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `study_name` varchar(500) NOT NULL,
  `study_text` text NOT NULL,
  `protocol_number` int(11) DEFAULT NULL,
  `welcome_template` longtext NOT NULL,
  `start_date` date NOT NULL,
  `duration` int(11) NOT NULL,
  `max_enrollment` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`substudy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE IF NOT EXISTS `training` (
  `training_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`training_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Training Date Info' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `training_user`
--

CREATE TABLE IF NOT EXISTS `training_user` (
  `training_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `study_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `protocol_id` varchar(11) NOT NULL,
  `protocol_version` varchar(200) NOT NULL,
  `training_dt` date NOT NULL,
  `type_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `approval` varchar(128) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` date NOT NULL,
  `training_type` int(11) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `file_description` varchar(250) DEFAULT NULL,
  `type` varchar(200) NOT NULL,
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`training_user_id`),
  KEY `user_id` (`user_id`),
  KEY `study_id` (`study_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Training Date Info' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `units_of_measure`
--

CREATE TABLE IF NOT EXISTS `units_of_measure` (
  `unit_of_measure_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `code` char(255) NOT NULL,
  `name` char(255) NOT NULL,
  `description` char(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`unit_of_measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `user_type` varchar(255) NOT NULL DEFAULT 'normal user',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `devision_id` int(11) NOT NULL,
  `preferred_language_id` int(11) NOT NULL DEFAULT '0',
  `login` char(255) NOT NULL,
  `password` char(255) NOT NULL,
  `title` char(255) DEFAULT NULL,
  `first_name` char(255) NOT NULL,
  `middle_name` char(255) DEFAULT NULL,
  `last_name` char(255) NOT NULL,
  `suffix` char(255) DEFAULT NULL,
  `email` char(255) NOT NULL,
  `sha1_password` varchar(40) DEFAULT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `address1` char(255) DEFAULT NULL,
  `address2` char(255) DEFAULT NULL,
  `address3` char(255) DEFAULT NULL,
  `city` char(255) DEFAULT NULL,
  `state` char(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `postal_code` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `cell` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `company` char(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `preferred_language_id` (`preferred_language_id`),
  KEY `country_id` (`country_id`),
  KEY `devision_id` (`devision_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `subscriber_id`, `user_type`, `is_active`, `devision_id`, `preferred_language_id`, `login`, `password`, `title`, `first_name`, `middle_name`, `last_name`, `suffix`, `email`, `sha1_password`, `salt`, `address1`, `address2`, `address3`, `city`, `state`, `country_id`, `postal_code`, `phone`, `cell`, `fax`, `company`, `last_login`, `last_logout`, `created_by`, `date_created`, `modified_by`, `date_modified`) VALUES
(1, 0, 'super admin', 1, 0, 1, 'demo', '{SMD5}AMTR5PYxLzdR8oVmoJS/h9eKysejSSyV', 'Mr.', 'demo', '', 'demo', NULL, 'info@voxce.com', NULL, NULL, ' ', '', '', ' ', '', 169, '', '2147483647', '2147483647', '0', '', NULL, NULL, 0, NULL, 0, '2012-12-24 04:01:33'),

-- --------------------------------------------------------

--
-- Table structure for table `user_cv`
--

CREATE TABLE IF NOT EXISTS `user_cv` (
  `user_cv_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `study_id` int(11) NOT NULL,
  `received_dt` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `data` mediumblob NOT NULL,
  `filename` varchar(200) NOT NULL,
  `file_description` varchar(250) NOT NULL,
  `type` varchar(200) NOT NULL,
  PRIMARY KEY (`user_cv_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='CV' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE IF NOT EXISTS `user_groups` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`user_group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`user_group_id`, `subscriber_id`, `user_id`, `group_id`, `created_by`, `date_created`, `modified_by`, `date_modified`) VALUES


-- --------------------------------------------------------

--
-- Table structure for table `user_rights`
--

CREATE TABLE IF NOT EXISTS `user_rights` (
  `user_right_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `right_type_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`user_right_id`),
  KEY `user_id` (`user_id`),
  KEY `resource_id` (`resource_id`),
  KEY `right_type_id` (`right_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_track`
--

CREATE TABLE IF NOT EXISTS `user_track` (
  `user_track_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `page` varchar(100) NOT NULL,
  `visit_dt` datetime NOT NULL,
  PRIMARY KEY (`user_track_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `validation_rules`
--

CREATE TABLE IF NOT EXISTS `validation_rules` (
  `validation_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `text` char(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `argument` varchar(1000) NOT NULL,
  `crf_question_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`validation_rule_id`),
  KEY `crf_question_id` (`crf_question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE IF NOT EXISTS `visits` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `study_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `visit_name_text_id` int(11) NOT NULL DEFAULT '0',
  `is_scheduled` char(1) NOT NULL DEFAULT 'N',
  `is_mandatory` char(1) NOT NULL DEFAULT 'N',
  `is_adverse` char(1) NOT NULL DEFAULT 'N',
  `is_monitor` char(1) NOT NULL DEFAULT 'N',
  `window_open` int(11) NOT NULL,
  `window_close` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `visit_optimum` int(11) NOT NULL DEFAULT '0',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `related_visit_id` int(11) NOT NULL DEFAULT '0',
  `is_primary` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`visit_id`),
  KEY `study_id` (`study_id`),
  KEY `visit_name_text_id` (`visit_name_text_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`visit_id`, `subscriber_id`, `study_id`, `description`, `visit_name_text_id`, `is_scheduled`, `is_mandatory`, `is_adverse`, `is_monitor`, `window_open`, `window_close`, `created_by`, `date_created`, `visit_optimum`, `modified_by`, `date_modified`, `related_visit_id`, `is_primary`) VALUES


-- --------------------------------------------------------

--
-- Table structure for table `visit_crfs`
--

CREATE TABLE IF NOT EXISTS `visit_crfs` (
  `visit_crf_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `visit_id` int(11) NOT NULL DEFAULT '0',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `case_report_form_id` int(11) NOT NULL DEFAULT '0',
  `is_mandatory` char(1) NOT NULL DEFAULT '',
  `is_repeating` char(1) NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`visit_crf_id`),
  KEY `case_report_form_id` (`case_report_form_id`),
  KEY `visit_id` (`visit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `visit_crfs`
--

INSERT INTO `visit_crfs` (`visit_crf_id`, `subscriber_id`, `visit_id`, `display_order`, `case_report_form_id`, `is_mandatory`, `is_repeating`, `created_by`, `date_created`, `modified_by`, `modified_date`) VALUES


-- --------------------------------------------------------

--
-- Table structure for table `visit_name_texts`
--

CREATE TABLE IF NOT EXISTS `visit_name_texts` (
  `visit_name_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `code` char(100) DEFAULT NULL,
  `visit_name` char(255) NOT NULL DEFAULT '',
  `visit_text` char(250) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL DEFAULT '0000-00-00',
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`visit_name_text_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `visit_name_texts`
--

INSERT INTO `visit_name_texts` (`visit_name_text_id`, `subscriber_id`, `language_id`, `code`, `visit_name`, `visit_text`, `created_by`, `date_created`, `modified_by`, `date_modified`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `visit_status`
--

CREATE TABLE IF NOT EXISTS `visit_status` (
  `visit_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`visit_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This visit status links to Patient Visits ' AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer_texts`
--
ALTER TABLE `answer_texts`
  ADD CONSTRAINT `answer_texts_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`);

--
-- Constraints for table `default_answer_texts`
--
ALTER TABLE `default_answer_texts`
  ADD CONSTRAINT `default_answer_texts_ibfk_1` FOREIGN KEY (`question_text_id`) REFERENCES `question_texts` (`question_text_id`),
  ADD CONSTRAINT `default_answer_texts_ibfk_2` FOREIGN KEY (`answer_text_id`) REFERENCES `answer_texts` (`answer_text_id`);

--
-- Constraints for table `labratory`
--
ALTER TABLE `labratory`
  ADD CONSTRAINT `labratory_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`COUNTRY_ID`);

--
-- Constraints for table `lab_normals`
--
ALTER TABLE `lab_normals`
  ADD CONSTRAINT `lab_normals_ibfk_1` FOREIGN KEY (`labratory_id`) REFERENCES `labratory` (`labratory_id`),
  ADD CONSTRAINT `lab_normals_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `units_of_measure` (`unit_of_measure_id`),
  ADD CONSTRAINT `lab_normals_ibfk_3` FOREIGN KEY (`lab_id`) REFERENCES `labs` (`lab_id`);

--
-- Constraints for table `query_statuses`
--
ALTER TABLE `query_statuses`
  ADD CONSTRAINT `query_statuses_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`);

--
-- Constraints for table `study_documents`
--
ALTER TABLE `study_documents`
  ADD CONSTRAINT `study_documents_ibfk_1` FOREIGN KEY (`study_id`) REFERENCES `studies` (`study_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
