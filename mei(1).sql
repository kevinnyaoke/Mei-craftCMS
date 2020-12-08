-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2020 at 07:50 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mei`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 'title', '2020-12-02 12:23:03', 0, 1),
(9, 1, 'uri', '2020-12-02 15:45:00', 0, 1),
(54, 1, 'uri', '2020-12-08 15:55:47', 0, 1),
(64, 1, 'title', '2020-12-08 18:43:42', 0, 1),
(67, 1, 'title', '2020-12-08 18:42:42', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(21, 1, 1, '2020-12-08 16:26:46', 0, 1),
(24, 1, 1, '2020-12-08 16:42:16', 0, 1),
(27, 1, 1, '2020-12-08 16:59:39', 0, 1),
(30, 1, 1, '2020-12-08 17:01:29', 0, 1),
(33, 1, 1, '2020-12-08 17:01:46', 0, 1),
(36, 1, 1, '2020-12-08 16:26:46', 0, 1),
(39, 1, 1, '2020-12-08 17:03:17', 0, 1),
(42, 1, 1, '2020-12-08 17:03:45', 0, 1),
(45, 1, 1, '2020-12-08 17:04:21', 0, 1),
(48, 1, 1, '2020-12-08 16:26:47', 0, 1),
(51, 1, 1, '2020-12-08 17:04:51', 0, 1),
(54, 1, 1, '2020-12-08 17:05:06', 0, 1),
(58, 1, 1, '2020-12-08 17:05:23', 0, 1),
(61, 1, 1, '2020-12-08 16:26:47', 0, 1),
(64, 1, 1, '2020-12-08 18:43:42', 0, 1),
(67, 1, 1, '2020-12-08 18:43:11', 0, 1),
(88, 1, 1, '2020-12-08 17:08:13', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_pageHeading` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_pageHeading`) VALUES
(1, 1, 1, NULL, '2020-12-02 10:43:06', '2020-12-02 10:43:06', 'd888dac2-829b-4980-b7bb-9e74f7f62d20', NULL),
(2, 2, 1, 'Home', '2020-12-02 10:53:13', '2020-12-02 14:52:33', '2d18273f-c2da-47f3-9972-4aa58fc3aa94', NULL),
(3, 3, 1, 'home', '2020-12-02 10:53:14', '2020-12-02 10:53:14', '8d745925-9eb8-4561-831c-fefde89ba3dc', NULL),
(4, 4, 1, 'home', '2020-12-02 10:53:14', '2020-12-02 10:53:14', 'fa523a0c-c3c8-49af-af6b-fb7e7c61aeff', NULL),
(5, 5, 1, 'Home', '2020-12-02 12:23:03', '2020-12-02 12:23:03', 'b00f1f34-926b-40f9-91a3-260c02cc722d', NULL),
(6, 6, 1, 'Home', '2020-12-02 12:23:04', '2020-12-02 12:23:04', 'c1c6da17-3d39-43c5-95b7-b6a3c2af2391', NULL),
(7, 7, 1, 'Home', '2020-12-02 12:23:04', '2020-12-02 12:23:04', '0738f92f-e3c2-46a0-8d0a-b61298420d55', NULL),
(8, 8, 1, 'Home', '2020-12-02 14:52:33', '2020-12-02 14:52:33', 'de354d19-ccb4-4053-89cb-d3f945d4fb5b', NULL),
(9, 9, 1, 'Schools', '2020-12-02 15:24:15', '2020-12-02 15:46:05', '44b299ed-5459-4eb4-883d-270f680b846c', NULL),
(10, 10, 1, 'Schools', '2020-12-02 15:24:15', '2020-12-02 15:24:15', 'c3e33cef-0702-40c8-a425-a5f22b35e8da', NULL),
(11, 11, 1, 'Schools', '2020-12-02 15:24:15', '2020-12-02 15:24:15', 'e9b193b1-8ee8-446f-b494-a5b1afc47906', NULL),
(12, 12, 1, 'Greetings', '2020-12-02 15:44:09', '2020-12-02 15:46:26', '46393a0b-d7cd-4a69-83cc-f11e8215ccf7', NULL),
(13, 13, 1, 'Greetings', '2020-12-02 15:44:09', '2020-12-02 15:44:09', '5887d395-2186-40db-875b-4565ca773af7', NULL),
(14, 14, 1, 'Schools', '2020-12-02 15:45:00', '2020-12-02 15:45:00', 'f56e95cb-d0b0-4254-9d17-7badecf309db', NULL),
(15, 15, 1, 'Schools', '2020-12-02 15:45:01', '2020-12-02 15:45:01', '46008c40-ebe6-4b73-b678-10b4ef496006', NULL),
(16, 16, 1, 'Gallery', '2020-12-08 15:41:35', '2020-12-08 15:41:35', 'a5cff6b3-7674-40df-8e48-361bbfbe2f37', NULL),
(17, 17, 1, 'Gallery', '2020-12-08 15:41:35', '2020-12-08 15:41:35', 'e3b10549-a86a-418a-a073-50c4ce3a798b', NULL),
(18, 18, 1, 'Contact', '2020-12-08 15:42:38', '2020-12-08 15:42:38', 'cb969981-dece-4312-ba36-25c4974bffc1', NULL),
(19, 19, 1, 'Contact', '2020-12-08 15:42:38', '2020-12-08 15:42:38', '5d7d4be6-094b-42e6-9631-88ffd71599b8', NULL),
(21, 21, 1, 'About', '2020-12-08 15:43:15', '2020-12-08 16:26:46', '3f63d0e6-d3a8-4584-b350-f860ee914ab8', NULL),
(22, 22, 1, 'About', '2020-12-08 15:43:16', '2020-12-08 15:43:16', 'f6dff6eb-f402-409f-9032-fadd0a71121c', NULL),
(24, 24, 1, 'Greetings', '2020-12-08 15:43:49', '2020-12-08 16:42:16', '270eb0ed-90fa-4372-991f-ccbc43df419e', '<h1>Greetings</h1>'),
(25, 25, 1, 'Greetings', '2020-12-08 15:43:50', '2020-12-08 15:43:50', '39b27854-c91b-4b4a-a70b-2e99caf2b84e', NULL),
(27, 27, 1, 'Mission Statement', '2020-12-08 15:46:56', '2020-12-08 16:59:38', '7636c353-bf0b-40fe-a63a-ee340fc9d0ed', '<p>Mission Statement</p>'),
(28, 28, 1, 'Mission Statement', '2020-12-08 15:46:56', '2020-12-08 15:46:56', 'd1c20b35-10ed-4cb9-b854-4264d9584ff0', NULL),
(30, 30, 1, 'Staff', '2020-12-08 15:48:34', '2020-12-08 17:01:29', '71a15fb9-c9d6-4063-b4e0-3b1fc22b2ccf', '<p>About Staff</p>'),
(31, 31, 1, 'Staff', '2020-12-08 15:48:34', '2020-12-08 15:48:34', 'f4f1bb9b-a305-46c9-81a1-5d285a4a9aec', NULL),
(33, 33, 1, 'Alumni', '2020-12-08 15:48:57', '2020-12-08 17:01:46', '2300a3c0-5b40-4a49-ba77-385edbab080c', '<p>About Alumni</p>'),
(34, 34, 1, 'Alumni', '2020-12-08 15:48:57', '2020-12-08 15:48:57', '230e4023-469e-4a04-8c5a-67f3d737bc91', NULL),
(36, 36, 1, 'Academics', '2020-12-08 15:51:08', '2020-12-08 16:26:46', 'b6ee46ae-d744-4c24-a1e3-4b3002ffea39', NULL),
(37, 37, 1, 'Academics', '2020-12-08 15:51:08', '2020-12-08 15:51:08', '158703e3-8210-460e-a586-571dd0f33743', NULL),
(39, 39, 1, 'Schools', '2020-12-08 15:52:10', '2020-12-08 17:03:16', 'e00df397-656b-4846-9d08-9fe59d17b5a7', '<p>Schools</p>'),
(40, 40, 1, 'Schools', '2020-12-08 15:52:10', '2020-12-08 15:52:10', 'dcdecf67-088a-480d-935e-9bfa71e97f64', NULL),
(42, 42, 1, 'Exam Schedule', '2020-12-08 15:53:12', '2020-12-08 17:03:44', '6c80f577-5c01-428f-8838-f8cd71b4562c', '<p>Exam Schedule</p>'),
(43, 43, 1, 'Exam Schedule', '2020-12-08 15:53:12', '2020-12-08 15:53:12', '894060c6-c755-4531-ad5e-e594b7e8fce6', NULL),
(45, 45, 1, 'Examinations', '2020-12-08 15:53:41', '2020-12-08 17:04:26', 'd029c00f-edd8-4e53-ab3b-bcb575c8386e', '<p>Examinations</p>'),
(46, 46, 1, 'Examinations', '2020-12-08 15:53:41', '2020-12-08 15:53:41', '8fcc330b-83ea-4ac7-a6c5-5bdaeda15ce7', NULL),
(48, 48, 1, 'Admissions', '2020-12-08 15:54:26', '2020-12-08 16:26:47', 'df03e2f8-0990-4dd9-8b66-f5577d55643f', NULL),
(49, 49, 1, 'Admissions', '2020-12-08 15:54:26', '2020-12-08 15:54:26', '5d5ca25f-5e87-4a06-83fc-20248ead052d', NULL),
(51, 51, 1, 'Apply', '2020-12-08 15:55:03', '2020-12-08 17:04:51', '3dd76a21-c6d6-4d63-848a-58998b63aa39', '<p>Apply</p>'),
(52, 52, 1, 'Apply', '2020-12-08 15:55:03', '2020-12-08 15:55:03', '1ab09fb6-16d7-4c81-98be-858c5e3eea90', NULL),
(54, 54, 1, 'Fee Structure', '2020-12-08 15:55:25', '2020-12-08 17:05:06', '8256bd1e-d004-4b50-bc23-971c6a92b1da', '<p>Fee Structure</p>'),
(55, 55, 1, 'Fee Structure', '2020-12-08 15:55:26', '2020-12-08 15:55:26', '5827029f-a674-49d1-8775-a35e65ae823f', NULL),
(56, 56, 1, 'Fee Structure', '2020-12-08 15:55:46', '2020-12-08 15:55:46', '222c6ea0-3163-4803-aa8c-26532ddcf50c', NULL),
(58, 58, 1, 'Scholarship', '2020-12-08 15:56:56', '2020-12-08 17:05:36', '0c95c3e3-8c02-43a1-95c6-d88b6818cceb', '<p>Scholarship</p>'),
(59, 59, 1, 'Scholarship', '2020-12-08 15:56:56', '2020-12-08 15:56:56', '05c8d3a4-03bc-4dcc-9089-91e7b8e554df', NULL),
(61, 61, 1, 'Portal', '2020-12-08 15:57:28', '2020-12-08 16:26:47', '95722fc2-4314-4088-8ada-993f9f91c839', NULL),
(62, 62, 1, 'Portal', '2020-12-08 15:57:28', '2020-12-08 15:57:28', 'd63ac36b-4d3e-425a-bfc0-e78d4cf0c1d3', NULL),
(64, 64, 1, 'Staff Portal', '2020-12-08 15:58:11', '2020-12-08 18:43:42', '3ac4c5fd-a9f5-4a38-8bd5-24c10c900d52', '<p>Staff Portal</p>'),
(65, 65, 1, 'Staff', '2020-12-08 15:58:12', '2020-12-08 15:58:12', '26973f44-d891-458a-b8b5-76ab30f3f116', NULL),
(67, 67, 1, 'Student', '2020-12-08 15:59:02', '2020-12-08 18:43:11', '1abae8b7-dc78-42f6-ace5-4de9e8336ae7', '<p>Student Portal</p>'),
(68, 68, 1, 'Alumni', '2020-12-08 15:59:02', '2020-12-08 15:59:02', '18347b16-e428-4ac7-8b0c-a6c614409a6b', NULL),
(69, 69, 1, 'Greetings', '2020-12-08 16:27:40', '2020-12-08 16:27:40', '72d400a9-86d0-4eb3-9d19-19b08f863408', '<p><strong>Greetings</strong></p>'),
(70, 70, 1, 'Greetings', '2020-12-08 16:28:40', '2020-12-08 16:28:40', '797fbfbd-1b29-4c3d-9930-f24f95c1ae48', '<p><strong>Greetings</strong></p>'),
(71, 71, 1, 'Mission Statement', '2020-12-08 16:41:39', '2020-12-08 16:41:39', 'fe9e9ca1-02fe-4533-baf1-9e8f62bcd0fb', '<h1>Mission Statement</h1>'),
(72, 72, 1, 'Greetings', '2020-12-08 16:42:16', '2020-12-08 16:42:16', '19d00b8c-681f-44ec-bd55-faa98cc506eb', '<h1>Greetings</h1>'),
(73, 73, 1, 'Mission Statement', '2020-12-08 16:53:02', '2020-12-08 16:53:02', '733e77cf-e9eb-430d-ba2c-d4cf7584d7c2', '<h1><strong>Mission Statement</strong></h1>'),
(74, 74, 1, 'Mission Statement', '2020-12-08 16:58:08', '2020-12-08 16:58:08', '66900b99-f2df-4144-9a10-a81859fdd13a', '<h1><strong>Mission Statement</strong></h1>'),
(75, 75, 1, 'Mission Statement', '2020-12-08 16:59:38', '2020-12-08 16:59:38', 'c0cced31-3a20-4700-ac99-d2d97cdf1d9f', '<p>Mission Statement</p>'),
(76, 76, 1, 'Staff', '2020-12-08 17:01:29', '2020-12-08 17:01:29', 'd65fe0da-4fbd-430a-b419-36b338106e8a', '<p>About Staff</p>'),
(77, 77, 1, 'Alumni', '2020-12-08 17:01:46', '2020-12-08 17:01:46', 'adb830db-1334-4ea2-a8db-76469506df42', '<p>About Alumni</p>'),
(78, 78, 1, 'Schools', '2020-12-08 17:03:16', '2020-12-08 17:03:16', 'bbeb826f-9b08-42d2-a3d7-202a86f28622', '<p>Schools</p>'),
(79, 79, 1, 'Exam Schedule', '2020-12-08 17:03:45', '2020-12-08 17:03:45', '6635b583-5057-4e11-b88d-32df84417f22', '<p>Exam Schedule</p>'),
(80, 80, 1, 'Examinations', '2020-12-08 17:04:21', '2020-12-08 17:04:21', 'a18b4738-9835-43f1-bec3-c612e57cb7aa', '<p>Examinations</p>'),
(81, 81, 1, 'Examinations', '2020-12-08 17:04:26', '2020-12-08 17:04:26', 'f9915145-0793-4c46-8345-9298181f85b2', '<p>Examinations</p>'),
(82, 82, 1, 'Apply', '2020-12-08 17:04:51', '2020-12-08 17:04:51', 'c572a787-353f-4f39-bac1-17bb85625352', '<p>Apply</p>'),
(83, 83, 1, 'Fee Structure', '2020-12-08 17:05:06', '2020-12-08 17:05:06', '6a763a3e-9ef9-4068-b09b-3ada56a4b73d', '<p>Fee Structure</p>'),
(84, 84, 1, 'Scholarship', '2020-12-08 17:05:23', '2020-12-08 17:05:23', '88574e0d-aa9a-4156-a58d-d078f7e8d73f', '<p>Scholarship</p>'),
(85, 85, 1, 'Scholarship', '2020-12-08 17:05:36', '2020-12-08 17:05:36', '1a22a9c5-ae8a-43b3-ab75-308f43dd23f7', '<p>Scholarship</p>'),
(86, 86, 1, 'Staff', '2020-12-08 17:05:49', '2020-12-08 17:05:49', '6c0c2c0b-de9c-426b-a94a-50fbc01298d7', '<p>Staff</p>'),
(87, 87, 1, 'Alumni', '2020-12-08 17:06:04', '2020-12-08 17:06:04', 'bd05638b-bf3b-4dae-9a7e-9c7da9c50502', '<p>Alumni</p>'),
(88, 88, 1, 'Alumni', '2020-12-08 17:08:08', '2020-12-08 17:08:13', 'a45343be-fe83-47b2-94f2-951cf2695919', '<p>About Alumni</p>'),
(89, 89, 1, NULL, '2020-12-08 17:17:48', '2020-12-08 18:51:35', 'ce0d7731-797d-40f5-830e-a23b5362ed5f', NULL),
(90, 103, 1, 'Student', '2020-12-08 18:42:42', '2020-12-08 18:42:42', '8e1ac168-43ab-44ce-bab6-2c024c143b31', '<p>Alumni</p>'),
(91, 104, 1, 'Student', '2020-12-08 18:43:11', '2020-12-08 18:43:11', '3e906aac-c74d-47ef-822b-9b7db52f4a66', '<p>Student Portal</p>'),
(92, 105, 1, 'Staff Portal', '2020-12-08 18:43:42', '2020-12-08 18:43:42', '466d106a-216b-43f8-a4cf-0958dff31f27', '<p>Staff Portal</p>'),
(94, 107, 1, 'Staff Portal', '2020-12-08 18:44:43', '2020-12-08 18:44:43', 'af795993-9aeb-4f4e-b005-09d661e5a80e', '<p>Staff Portal</p>'),
(95, 108, 1, 'Staff Portal', '2020-12-08 18:44:43', '2020-12-08 18:44:43', '05574117-9ccd-4c27-81cc-ff3b4a981753', '<p>Staff Portal</p>'),
(97, 110, 1, 'Student Portal', '2020-12-08 18:45:19', '2020-12-08 18:45:19', '044d49f2-6ff9-4356-b334-bffccef56b55', '<p>Student Portal</p>'),
(98, 111, 1, 'Student Portal', '2020-12-08 18:45:19', '2020-12-08 18:45:19', '11336013-c6b8-4904-8aa7-e11418b11641', '<p>Student Portal</p>');

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deprecationerrors`
--

INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ElementQuery::getIterator()', 'C:\\laragon\\www\\mei\\templates\\index.twig:47', '2020-12-08 18:22:13', 'C:\\laragon\\www\\mei\\templates\\index.twig', 47, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":568,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\2f\\\\2fd328fbc5b1cba2b049e6aef12a61ef1f2b796514d5e0d65f0bdf42c75f3db8.php\",\"line\":95,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\14\\\\14415cc5c24c5837d7fad0861bf1765ff022b4e5a4fc96249944595a59886e10.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-12-08 18:22:13', '2020-12-08 18:22:13', 'ee0656b1-0a3a-425b-99ae-f7cde982b81a'),
(13, 'ElementQuery::getIterator()', 'C:\\laragon\\www\\mei\\templates\\index.twig:89', '2020-12-08 18:06:46', 'C:\\laragon\\www\\mei\\templates\\index.twig', 89, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":568,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\2f\\\\2fd328fbc5b1cba2b049e6aef12a61ef1f2b796514d5e0d65f0bdf42c75f3db8.php\",\"line\":155,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\14\\\\14415cc5c24c5837d7fad0861bf1765ff022b4e5a4fc96249944595a59886e10.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-12-08 18:06:47', '2020-12-08 18:06:47', 'c35f7cc2-a907-412b-a9ae-91d5a07e0972'),
(17, 'ElementQuery::getIterator()', 'C:\\laragon\\www\\mei\\templates\\index.twig:87', '2020-12-08 18:22:13', 'C:\\laragon\\www\\mei\\templates\\index.twig', 87, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":568,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\2f\\\\2fd328fbc5b1cba2b049e6aef12a61ef1f2b796514d5e0d65f0bdf42c75f3db8.php\",\"line\":153,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\14\\\\14415cc5c24c5837d7fad0861bf1765ff022b4e5a4fc96249944595a59886e10.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-12-08 18:22:13', '2020-12-08 18:22:13', '17b8ba94-8ec8-46b0-a6ab-e7fabd78bbad'),
(34, 'ElementQuery::getIterator()', 'C:\\laragon\\www\\mei\\templates\\index.twig:140', '2020-12-08 18:22:13', 'C:\\laragon\\www\\mei\\templates\\index.twig', 140, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":568,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\2f\\\\2fd328fbc5b1cba2b049e6aef12a61ef1f2b796514d5e0d65f0bdf42c75f3db8.php\",\"line\":225,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\14\\\\14415cc5c24c5837d7fad0861bf1765ff022b4e5a4fc96249944595a59886e10.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-12-08 18:22:13', '2020-12-08 18:22:13', 'e1fe9f3c-8c82-4428-925a-b6dde1bf053b');
INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(50, 'ElementQuery::getIterator()', 'C:\\laragon\\www\\mei\\templates\\index.twig:49', '2020-12-08 18:55:01', 'C:\\laragon\\www\\mei\\templates\\index.twig', 49, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":568,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\2f\\\\2fd328fbc5b1cba2b049e6aef12a61ef1f2b796514d5e0d65f0bdf42c75f3db8.php\",\"line\":98,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\14\\\\14415cc5c24c5837d7fad0861bf1765ff022b4e5a4fc96249944595a59886e10.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-12-08 18:55:01', '2020-12-08 18:55:01', '04c68e32-fe4f-4721-b221-3c14f3cb04d7'),
(51, 'ElementQuery::getIterator()', 'C:\\laragon\\www\\mei\\templates\\index.twig:93', '2020-12-08 18:55:01', 'C:\\laragon\\www\\mei\\templates\\index.twig', 93, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":568,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\2f\\\\2fd328fbc5b1cba2b049e6aef12a61ef1f2b796514d5e0d65f0bdf42c75f3db8.php\",\"line\":162,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\14\\\\14415cc5c24c5837d7fad0861bf1765ff022b4e5a4fc96249944595a59886e10.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-12-08 18:55:01', '2020-12-08 18:55:01', '1d1edcba-4049-49c3-bb3f-48715fd25cd4'),
(52, 'ElementQuery::getIterator()', 'C:\\laragon\\www\\mei\\templates\\index.twig:149', '2020-12-08 18:55:01', 'C:\\laragon\\www\\mei\\templates\\index.twig', 149, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":568,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\2f\\\\2fd328fbc5b1cba2b049e6aef12a61ef1f2b796514d5e0d65f0bdf42c75f3db8.php\",\"line\":239,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\14\\\\14415cc5c24c5837d7fad0861bf1765ff022b4e5a4fc96249944595a59886e10.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-12-08 18:55:01', '2020-12-08 18:55:01', '17bc937e-e744-474e-b3cc-54c5c02dcc37'),
(53, 'ElementQuery::getIterator()', 'C:\\laragon\\www\\mei\\templates\\index.twig:206', '2020-12-08 18:55:01', 'C:\\laragon\\www\\mei\\templates\\index.twig', 206, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":568,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\2f\\\\2fd328fbc5b1cba2b049e6aef12a61ef1f2b796514d5e0d65f0bdf42c75f3db8.php\",\"line\":317,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\14\\\\14415cc5c24c5837d7fad0861bf1765ff022b4e5a4fc96249944595a59886e10.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-12-08 18:55:01', '2020-12-08 18:55:01', '0c3904d1-03dc-4d14-badb-3f360bde45bc');
INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(54, 'ElementQuery::getIterator()', 'C:\\laragon\\www\\mei\\templates\\index.twig:261', '2020-12-08 18:55:01', 'C:\\laragon\\www\\mei\\templates\\index.twig', 261, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":568,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\2f\\\\2fd328fbc5b1cba2b049e6aef12a61ef1f2b796514d5e0d65f0bdf42c75f3db8.php\",\"line\":393,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_634d78a7d46d40d15b519fc61b1ce28b51da793f47a356f582d393153570b2bf\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\14\\\\14415cc5c24c5837d7fad0861bf1765ff022b4e5a4fc96249944595a59886e10.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_276c8c3b6dbaef9c807ddfa6378e5f5c0751233349cf38e95c0b1d203c6c3fb9\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-12-08 18:55:01', '2020-12-08 18:55:01', '98b4cbb5-421f-46d2-b72f-e3ac17b47b65');

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drafts`
--

INSERT INTO `drafts` (`id`, `sourceId`, `creatorId`, `name`, `notes`, `trackChanges`, `dateLastMerged`) VALUES
(17, 33, 1, 'Draft 1', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elementindexsettings`
--

INSERT INTO `elementindexsettings` (`id`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '{\"sources\":{\"section:a33a073b-15ff-49f7-9d47-1e80709c0e74\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"link\",\"3\":\"section\",\"4\":\"slug\",\"5\":\"uri\"}}}}', '2020-12-08 15:47:36', '2020-12-08 15:47:36', 'd9b156ea-f56d-47a5-9360-20dd4038902a');

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2020-12-02 10:43:06', '2020-12-02 10:43:06', NULL, 'a68b09de-62dc-49e2-a9ca-278108290039'),
(2, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-02 10:53:13', '2020-12-02 14:52:33', NULL, '50388e1b-4a59-4f5a-9bb3-707c1e545022'),
(3, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-02 10:53:13', '2020-12-02 10:53:13', NULL, '873b4487-9497-491c-b9c2-b4a4cb2c5602'),
(4, NULL, 2, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-02 10:53:14', '2020-12-02 10:53:14', NULL, '52ec6632-d386-48fd-a577-d1a64c730da3'),
(5, NULL, 3, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-02 12:23:02', '2020-12-02 12:23:02', NULL, '7a2a8cb9-a889-4fef-b112-2b23bb39aa25'),
(6, NULL, 4, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-02 12:23:03', '2020-12-02 12:23:03', NULL, 'a557c033-ef0b-40f0-be6d-388ac6eaea25'),
(7, NULL, 5, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-02 12:23:04', '2020-12-02 12:23:04', NULL, '17858b11-10d4-4cb8-b1f1-140da8082f26'),
(8, NULL, 6, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-02 14:52:33', '2020-12-02 14:52:33', NULL, '629e69f1-4c83-4e7f-9bc1-c7a765e8fc41'),
(9, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:24:14', '2020-12-02 15:45:01', '2020-12-08 15:34:31', '1ca8687e-7507-41cd-8747-b6bf01a61e27'),
(10, NULL, 7, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:24:14', '2020-12-02 15:24:14', '2020-12-08 15:34:31', 'b13846f2-6a45-4b96-af55-b3bc41ccc9e7'),
(11, NULL, 8, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:24:15', '2020-12-02 15:24:15', '2020-12-08 15:34:31', '8c591278-3fbc-492f-b321-fd01764edfc9'),
(12, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:44:09', '2020-12-02 15:44:09', '2020-12-08 15:34:16', 'ea45511b-023b-422b-957c-e96a3f308780'),
(13, NULL, 9, 2, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:44:09', '2020-12-02 15:44:09', '2020-12-08 15:34:16', 'a0583513-d6e9-44d2-a61b-413b5b490337'),
(14, NULL, 10, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:45:00', '2020-12-02 15:45:00', '2020-12-08 15:34:31', 'e634a42f-8cae-4213-b74d-0fc1c0dbe93b'),
(15, NULL, 11, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:45:01', '2020-12-02 15:45:01', '2020-12-08 15:34:31', '3a1e3e66-7e71-4911-b140-9ccbdb53a077'),
(16, NULL, NULL, 17, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:41:35', '2020-12-08 15:41:35', NULL, 'dc5f2627-ae0c-4d8c-88ac-f99f8b24cdc5'),
(17, NULL, 12, 17, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:41:35', '2020-12-08 15:41:35', NULL, '63fa32d6-d87a-4c0e-9692-a7fc9f92e12d'),
(18, NULL, NULL, 18, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:42:38', '2020-12-08 15:42:38', NULL, '2f5b67f6-236a-438e-b0c7-41a4ea989ffb'),
(19, NULL, 13, 18, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:42:38', '2020-12-08 15:42:38', NULL, 'c3db4a22-9191-42bf-bfe8-abd353b788c8'),
(21, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:43:15', '2020-12-08 15:43:15', NULL, 'e857b5a4-5582-4813-85c7-7a1541d2e9fd'),
(22, NULL, 14, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:43:15', '2020-12-08 15:43:15', NULL, '2a0cf744-6488-4add-9396-4e2090515c9f'),
(24, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:43:49', '2020-12-08 16:42:16', NULL, '160c746a-8189-4efc-ae3c-bd40bd353421'),
(25, NULL, 15, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:43:49', '2020-12-08 15:43:49', NULL, 'aa4d728e-b81a-404f-830b-40e37dd086d6'),
(27, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:46:56', '2020-12-08 16:59:38', NULL, 'a5fec6ad-3ab8-4bb6-8168-f4aa2193f5c5'),
(28, NULL, 16, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:46:56', '2020-12-08 15:46:56', NULL, 'b57763b0-e437-499e-816e-60dea3b59cb2'),
(30, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:48:34', '2020-12-08 17:01:29', NULL, '5c20814f-d5de-4f42-9cdd-ac08faeded81'),
(31, NULL, 17, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:48:34', '2020-12-08 15:48:34', NULL, '9f7465cf-40f6-4ed2-8421-52b101879367'),
(33, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:48:57', '2020-12-08 17:01:46', NULL, '6cc75055-08b6-4e80-a09d-69542185e868'),
(34, NULL, 18, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:48:56', '2020-12-08 15:48:56', NULL, '9c087b34-7451-4539-a24e-3e2eb6c3f7f8'),
(36, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:51:08', '2020-12-08 15:51:08', NULL, 'c0c27585-10cf-460b-a2a1-9f3bafc80c14'),
(37, NULL, 19, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:51:08', '2020-12-08 15:51:08', NULL, '46b8f1cc-7c47-4a05-85fc-5b485b277d59'),
(39, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:52:10', '2020-12-08 17:03:16', NULL, 'f8352f1b-419c-47e0-8258-971785b47a06'),
(40, NULL, 20, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:52:10', '2020-12-08 15:52:10', NULL, '234c0e0f-0eb7-4cc6-852d-3512ae1f3a82'),
(42, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:53:12', '2020-12-08 17:03:44', NULL, '39e75bf8-5cdb-4fa1-8afc-47dea8c8fbca'),
(43, NULL, 21, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:53:12', '2020-12-08 15:53:12', NULL, '6c6116ca-67fc-474f-a831-7f6e83f8a978'),
(45, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:53:41', '2020-12-08 17:04:26', NULL, '646b5501-d44b-4005-920d-c6efd23a8260'),
(46, NULL, 22, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:53:41', '2020-12-08 15:53:41', NULL, '55a1fc24-ac16-44e5-89bf-0e3a172eef68'),
(48, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:54:26', '2020-12-08 15:54:26', NULL, 'b965577f-b3a1-43b8-b643-927cdbae9997'),
(49, NULL, 23, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:54:26', '2020-12-08 15:54:26', NULL, '2a1d9621-bedb-4c01-acde-0a7b5ea40bf1'),
(51, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:55:03', '2020-12-08 17:04:51', NULL, 'd0fd8805-7c62-4da2-9bf6-1bf5de173809'),
(52, NULL, 24, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:55:03', '2020-12-08 15:55:03', NULL, 'ee48ab3f-9f85-436b-a9e0-251691ec1406'),
(54, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:55:25', '2020-12-08 17:05:06', NULL, 'eb9a5068-b289-4d49-9dee-fe4bffe6d143'),
(55, NULL, 25, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:55:25', '2020-12-08 15:55:25', NULL, '71046f19-3324-45f0-b2e9-10bb651e5884'),
(56, NULL, 26, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:55:46', '2020-12-08 15:55:46', NULL, 'b3737b86-4537-4e6b-8ffc-ff8aab59bb87'),
(58, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:56:56', '2020-12-08 17:05:36', NULL, '7d2ff053-7ddf-4918-8229-b0f1e3170446'),
(59, NULL, 27, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:56:55', '2020-12-08 15:56:55', NULL, 'a277e3dd-4902-451f-8f23-65045f07e77a'),
(61, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:57:28', '2020-12-08 15:57:28', NULL, '5f3dc193-bd91-4c9a-a956-1818ab55badc'),
(62, NULL, 28, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:57:28', '2020-12-08 15:57:28', NULL, '77be035f-adb0-47d1-8c63-2ecc9297349b'),
(64, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:58:11', '2020-12-08 18:43:42', '2020-12-08 18:44:08', '1f0176f6-61ac-4111-bfaf-f420bdfe4db3'),
(65, NULL, 29, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:58:11', '2020-12-08 15:58:11', '2020-12-08 18:44:08', '646a60f0-4661-47a9-ab35-c234abce80d3'),
(67, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:59:02', '2020-12-08 18:43:11', '2020-12-08 18:44:08', 'd88ec905-3078-4a4f-aabe-09b51b238a81'),
(68, NULL, 30, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:59:02', '2020-12-08 15:59:02', '2020-12-08 18:44:08', '96a3e279-0fb2-4a82-90dc-3ae376569c9e'),
(69, NULL, 31, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 16:27:40', '2020-12-08 16:27:40', NULL, '37f72aa2-8351-4d88-9656-2399de1f514b'),
(70, NULL, 32, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 16:28:40', '2020-12-08 16:28:40', NULL, 'de90073d-824e-4362-b51d-48995b7cd76f'),
(71, NULL, 33, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 16:41:39', '2020-12-08 16:41:39', NULL, '4c8de84b-32ab-49d3-949d-0500d5340684'),
(72, NULL, 34, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 16:42:16', '2020-12-08 16:42:16', NULL, '202fddae-38e4-49c1-b13c-7021c26bc640'),
(73, NULL, 35, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 16:53:02', '2020-12-08 16:53:02', NULL, 'a03673b6-8e3b-4767-9475-75dd646dcd74'),
(74, NULL, 36, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 16:58:08', '2020-12-08 16:58:08', NULL, '446f4152-297f-4a10-8f26-17999a28702f'),
(75, NULL, 37, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 16:59:38', '2020-12-08 16:59:38', NULL, 'c8edda28-5517-4b69-8a2e-ed136dd12c2f'),
(76, NULL, 38, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 17:01:29', '2020-12-08 17:01:29', NULL, '1c4d320e-e378-4312-8cdb-5374916a42be'),
(77, NULL, 39, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 17:01:46', '2020-12-08 17:01:46', NULL, 'be8ac023-3c99-4f9f-b318-dc2272f80a11'),
(78, NULL, 40, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 17:03:16', '2020-12-08 17:03:16', NULL, '704765b2-12ca-494e-9cbd-154a2a0e5328'),
(79, NULL, 41, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 17:03:44', '2020-12-08 17:03:44', NULL, 'bcea5019-9c1e-498f-85dc-539233c014e3'),
(80, NULL, 42, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 17:04:21', '2020-12-08 17:04:21', NULL, 'b191ab11-6c9a-4331-b161-277772d5a618'),
(81, NULL, 43, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 17:04:26', '2020-12-08 17:04:26', NULL, '885d2f80-d709-425b-bd76-618e4715cfcc'),
(82, NULL, 44, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 17:04:51', '2020-12-08 17:04:51', NULL, '118dbcf0-17f7-42f4-a235-ee019038c949'),
(83, NULL, 45, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 17:05:06', '2020-12-08 17:05:06', NULL, '85e0d034-1c32-4502-acdb-fdbbe96a7c70'),
(84, NULL, 46, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 17:05:23', '2020-12-08 17:05:23', NULL, '36702960-6e3a-4990-b4c3-233af5b410fd'),
(85, NULL, 47, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 17:05:36', '2020-12-08 17:05:36', NULL, 'f63fb0e3-068e-486b-8163-52d05945f492'),
(86, NULL, 48, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 17:05:49', '2020-12-08 17:05:49', '2020-12-08 18:44:08', '64397201-4d61-4900-abaa-fa7e544b5a42'),
(87, NULL, 49, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 17:06:04', '2020-12-08 17:06:04', '2020-12-08 18:44:08', 'e447f5a5-b83d-4d33-b1cd-4be9f086850c'),
(88, 17, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 17:08:08', '2020-12-08 17:08:13', NULL, '4e1368ea-879f-4dfb-81fd-d66c365260f0'),
(89, NULL, NULL, 20, 'craft\\elements\\GlobalSet', 1, 0, '2020-12-08 17:17:48', '2020-12-08 18:51:35', NULL, '6da785e4-bd50-43e4-ab27-4ff5f9293e9e'),
(90, NULL, NULL, 19, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 17:48:37', '2020-12-08 18:51:35', NULL, '31ff86eb-01b9-4e69-8bf4-3fde77a9fd17'),
(91, NULL, NULL, 19, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 17:48:37', '2020-12-08 18:51:35', NULL, '5efa103b-f6df-4107-9e17-c2ecd49b2c2d'),
(92, NULL, NULL, 19, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 17:49:16', '2020-12-08 18:51:35', NULL, 'bc8dd60a-8173-4b4b-9d8b-64e7aaa691dd'),
(93, NULL, NULL, 21, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:06:36', '2020-12-08 18:51:35', NULL, '6869502d-03fc-4956-b6ae-53b2690ea86d'),
(94, NULL, NULL, 21, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:06:36', '2020-12-08 18:51:35', NULL, '059177ca-c9f2-4cc8-8aa1-149841067e79'),
(95, NULL, NULL, 21, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:12:37', '2020-12-08 18:51:35', NULL, '9841fb76-04b3-405d-b86b-a181692190c4'),
(96, NULL, NULL, 21, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:12:38', '2020-12-08 18:51:35', NULL, '7799399a-c73d-4e56-be9a-b8d555602e50'),
(97, NULL, NULL, 22, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:20:43', '2020-12-08 18:51:35', NULL, '68b07004-5340-4703-8c18-2abe50bd1ba7'),
(98, NULL, NULL, 22, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:20:43', '2020-12-08 18:51:35', NULL, '88f9b406-b3ac-48e6-8725-d97628c2c681'),
(99, NULL, NULL, 22, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:20:44', '2020-12-08 18:51:35', NULL, 'f9a80c9c-71b1-46fc-a928-f81cb6efa6b6'),
(100, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:27:30', '2020-12-08 18:51:35', NULL, 'd7186c21-523a-4ad1-9fe4-88e0590faf89'),
(101, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:27:30', '2020-12-08 18:51:35', NULL, 'e688f4aa-0662-4938-88e5-c0e1a27e6fd5'),
(102, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:27:30', '2020-12-08 18:51:35', NULL, '1f4fa035-fff0-4500-99f5-69d72e291cef'),
(103, NULL, 50, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:42:41', '2020-12-08 18:42:41', '2020-12-08 18:44:08', '0fd0b55a-24a4-42d1-873d-aa9350c04610'),
(104, NULL, 51, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:43:11', '2020-12-08 18:43:11', '2020-12-08 18:44:08', 'fe77947e-d7b4-4587-ad15-6f4859397aa1'),
(105, NULL, 52, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:43:42', '2020-12-08 18:43:42', '2020-12-08 18:44:08', '0ec11745-5f00-4724-8037-838014691fc9'),
(107, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:44:43', '2020-12-08 18:44:43', NULL, '2712d422-b97d-4a78-85e0-0bbda2329123'),
(108, NULL, 53, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:44:43', '2020-12-08 18:44:43', NULL, 'b10ee9c8-95dc-4f7b-a431-d0ee2fa347cc'),
(110, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:45:19', '2020-12-08 18:45:19', NULL, '93312664-fc1f-44a6-905c-2b51b6da1ef0'),
(111, NULL, 54, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:45:19', '2020-12-08 18:45:19', NULL, '2ee643da-7ced-4c40-880a-ceb81a8398c6'),
(112, NULL, NULL, 24, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:50:37', '2020-12-08 18:51:35', NULL, '52aa3529-3467-47cf-a86a-7c417aab7f04'),
(113, NULL, NULL, 24, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:50:37', '2020-12-08 18:51:35', NULL, '7a1232b9-580c-439d-bac5-f8b5a3b19f40');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2020-12-02 10:43:06', '2020-12-02 10:43:06', '80f3552c-931e-43fa-9dc0-71fe0069d0ba'),
(2, 2, 1, 'home', '__home__', 1, '2020-12-02 10:53:13', '2020-12-02 10:53:13', '58e6c1d5-1b2a-4792-8bfe-4ecdf777c4c2'),
(3, 3, 1, 'home', '__home__', 1, '2020-12-02 10:53:14', '2020-12-02 10:53:14', 'b1c2047d-8aef-4135-86ba-b67a2f64d89b'),
(4, 4, 1, 'home', '__home__', 1, '2020-12-02 10:53:14', '2020-12-02 10:53:14', 'f6d88cf5-c5f2-404f-a51d-d18e46ef1b1d'),
(5, 5, 1, 'home', '__home__', 1, '2020-12-02 12:23:03', '2020-12-02 12:23:03', 'ef5e474c-4c91-4847-a8d8-7a068c0c3377'),
(6, 6, 1, 'home', '__home__', 1, '2020-12-02 12:23:03', '2020-12-02 12:23:03', 'd5eefbdf-5166-49ca-b28d-fb5a47c60122'),
(7, 7, 1, 'home', '__home__', 1, '2020-12-02 12:23:04', '2020-12-02 12:23:04', '6a0a8e25-5044-43d3-813f-c239c9b97c91'),
(8, 8, 1, 'home', '__home__', 1, '2020-12-02 14:52:33', '2020-12-02 14:52:33', 'f7b2f796-30f2-4e6c-aa97-9e333ae15d30'),
(9, 9, 1, 'schools', 'academics/schools', 1, '2020-12-02 15:24:15', '2020-12-02 15:45:00', '33c5dd9e-2f2b-43a1-a368-f5472a59cd6b'),
(10, 10, 1, 'schools', NULL, 1, '2020-12-02 15:24:15', '2020-12-02 15:24:15', '208e0065-367c-4849-8fe3-3f10e2d99b1c'),
(11, 11, 1, 'schools', NULL, 1, '2020-12-02 15:24:15', '2020-12-02 15:24:15', '2fffbf1c-f8f1-42ac-9614-574e2863ce66'),
(12, 12, 1, 'greetings', 'about/greetings', 1, '2020-12-02 15:44:09', '2020-12-02 15:44:09', '7e54dbc1-d3f4-4055-a592-efffbd8f6ad3'),
(13, 13, 1, 'greetings', 'about/greetings', 1, '2020-12-02 15:44:09', '2020-12-02 15:44:09', 'cf8ef991-0702-4333-8128-43306835060e'),
(14, 14, 1, 'schools', 'academics/schools', 1, '2020-12-02 15:45:00', '2020-12-02 15:45:00', '2310cc31-5a66-423d-a3cb-c534a4db1614'),
(15, 15, 1, 'schools', 'academics/schools', 1, '2020-12-02 15:45:01', '2020-12-02 15:45:01', '7cecd123-bae6-4e04-8764-5b7472a14c98'),
(16, 16, 1, 'gallery', 'gallery', 1, '2020-12-08 15:41:35', '2020-12-08 15:41:35', '425e85f3-39f8-499f-95f0-061d2f761b4d'),
(17, 17, 1, 'gallery', 'gallery', 1, '2020-12-08 15:41:35', '2020-12-08 15:41:35', '41b278c2-9b72-434f-a705-854c7c45682a'),
(18, 18, 1, 'contact', 'contact', 1, '2020-12-08 15:42:38', '2020-12-08 15:42:38', '626ae8f0-1fa0-4e1d-a605-64bca9f9de1d'),
(19, 19, 1, 'contact', 'contact', 1, '2020-12-08 15:42:38', '2020-12-08 15:42:38', 'ea765f0c-837c-48ed-8922-61263d9580a7'),
(21, 21, 1, 'about', 'about', 1, '2020-12-08 15:43:15', '2020-12-08 15:43:18', '8e12a108-cf02-478e-ae50-8a897ac696f3'),
(22, 22, 1, 'about', 'about', 1, '2020-12-08 15:43:16', '2020-12-08 15:43:16', 'ff1ef2fb-f568-4782-8987-ea69387b34f1'),
(24, 24, 1, 'greetings', 'about/greetings', 1, '2020-12-08 15:43:49', '2020-12-08 16:26:48', 'bd4d5a09-dc16-4ebe-baf9-b46a53db1cc3'),
(25, 25, 1, 'greetings', 'about/greetings', 1, '2020-12-08 15:43:50', '2020-12-08 15:43:50', 'af8adc58-268e-4c0e-b96a-76df2d645b98'),
(27, 27, 1, 'mission-statement', 'about/mission-statement', 1, '2020-12-08 15:46:56', '2020-12-08 16:26:48', '1e1950b5-2a72-4ae1-97d1-d76e4d077582'),
(28, 28, 1, 'mission-statement', 'about/mission-statement', 1, '2020-12-08 15:46:56', '2020-12-08 15:46:56', '0bde3810-e1e0-44ec-a0b0-cf37f508f044'),
(30, 30, 1, 'staff', 'about/staff', 1, '2020-12-08 15:48:34', '2020-12-08 16:26:48', '8f929275-3647-4487-a977-9a109606d12a'),
(31, 31, 1, 'staff', 'about/staff', 1, '2020-12-08 15:48:34', '2020-12-08 15:48:34', 'd05da828-5355-4d92-b05c-96459a8ca431'),
(33, 33, 1, 'alumni', 'about/alumni', 1, '2020-12-08 15:48:57', '2020-12-08 16:26:48', 'c6c73d42-cc99-4605-bce3-8742f08b7fb4'),
(34, 34, 1, 'alumni', 'about/alumni', 1, '2020-12-08 15:48:57', '2020-12-08 15:48:57', 'b21942e3-94a0-440a-8253-4ddba00745e7'),
(36, 36, 1, 'academics', 'academics', 1, '2020-12-08 15:51:08', '2020-12-08 15:51:10', '98da5d3e-4203-41fc-a772-d42b2005fb5c'),
(37, 37, 1, 'academics', 'academics', 1, '2020-12-08 15:51:08', '2020-12-08 15:51:08', '9517a41b-7d3f-48cb-a05d-ff47d99d6a13'),
(39, 39, 1, 'schools', 'academics/schools', 1, '2020-12-08 15:52:10', '2020-12-08 16:26:48', 'ed0b71be-38ad-4da5-9b0a-dc967929124e'),
(40, 40, 1, 'schools', 'academics/schools', 1, '2020-12-08 15:52:10', '2020-12-08 15:52:10', 'd80aade5-d02f-49a4-b01d-e411b83e92f2'),
(42, 42, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-08 15:53:12', '2020-12-08 16:26:48', '84c1729c-b407-4d45-9e25-4e6e9929d3a0'),
(43, 43, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-08 15:53:12', '2020-12-08 15:53:12', 'd66fe09a-e9ab-4141-902a-60540c4a9e70'),
(45, 45, 1, 'examinations', 'academics/examinations', 1, '2020-12-08 15:53:41', '2020-12-08 16:26:48', 'fba0dad1-5fbd-48ce-9942-31546eb0819a'),
(46, 46, 1, 'examinations', 'academics/examinations', 1, '2020-12-08 15:53:41', '2020-12-08 15:53:41', '5851efd3-1f09-4cc1-94c9-e3424f48399c'),
(48, 48, 1, 'admissions', 'admissions', 1, '2020-12-08 15:54:26', '2020-12-08 15:54:28', 'e2e27056-6e98-4798-8d9c-75bbb0e4b63f'),
(49, 49, 1, 'admissions', 'admissions', 1, '2020-12-08 15:54:26', '2020-12-08 15:54:26', '8dda9a85-1e41-4b05-89af-c0fbe3271bfc'),
(51, 51, 1, 'apply', 'admissions/apply', 1, '2020-12-08 15:55:03', '2020-12-08 16:26:48', '9b96b1df-52a0-4977-bb78-c45aa2c71e34'),
(52, 52, 1, 'apply', 'admissions/apply', 1, '2020-12-08 15:55:03', '2020-12-08 15:55:03', '9dc273b0-228c-4006-a331-148ddd6432be'),
(54, 54, 1, 'fee-structure', 'admissions/fee-structure', 1, '2020-12-08 15:55:25', '2020-12-08 16:26:48', '696e7bbb-02df-46ff-9027-b933ef8837e3'),
(55, 55, 1, 'fee-structure', 'fee-structure', 1, '2020-12-08 15:55:26', '2020-12-08 15:55:26', '58fb3717-1041-4394-be0a-969910723fae'),
(56, 56, 1, 'fee-structure', 'admissions/fee-structure', 1, '2020-12-08 15:55:46', '2020-12-08 15:55:46', 'a6feab47-c58d-4ca0-8a5f-5f90315f8339'),
(58, 58, 1, 'scholarship', 'admissions/scholarship', 1, '2020-12-08 15:56:56', '2020-12-08 16:26:49', '26ce6d68-d939-448d-bd0b-393e2f662248'),
(59, 59, 1, 'scholarship', 'admissions/scholarship', 1, '2020-12-08 15:56:56', '2020-12-08 15:56:56', '1e5ea149-63f3-496f-bd57-ed2a6d33005c'),
(61, 61, 1, 'portal', 'portal', 1, '2020-12-08 15:57:28', '2020-12-08 15:57:30', '8918d7f0-e59f-4ebd-9103-1321af9f3859'),
(62, 62, 1, 'portal', 'portal', 1, '2020-12-08 15:57:28', '2020-12-08 15:57:28', 'ea8b0e98-7dee-417e-8ec9-61dd463323e9'),
(64, 64, 1, 'staff', 'portal/staff', 1, '2020-12-08 15:58:11', '2020-12-08 16:26:49', '8c8dbdc9-9bdd-4e78-bab5-b832a5c1fa04'),
(65, 65, 1, 'staff', 'portal/staff', 1, '2020-12-08 15:58:12', '2020-12-08 15:58:12', '0daf3aee-68a1-4939-8fe3-f26fea152b9b'),
(67, 67, 1, 'alumni', 'portal/alumni', 1, '2020-12-08 15:59:02', '2020-12-08 16:26:49', '93e06481-9d8f-4452-882f-72b10821d916'),
(68, 68, 1, 'alumni', 'portal/alumni', 1, '2020-12-08 15:59:02', '2020-12-08 15:59:02', 'e393e217-7ea4-49a2-b3b0-06d2844403c1'),
(69, 69, 1, 'greetings', 'about/greetings', 1, '2020-12-08 16:27:40', '2020-12-08 16:27:40', '642fd3c5-f400-4874-b13c-4a816000e722'),
(70, 70, 1, 'greetings', 'about/greetings', 1, '2020-12-08 16:28:40', '2020-12-08 16:28:40', '895b1443-9121-473e-9829-e4fd3a857683'),
(71, 71, 1, 'mission-statement', 'about/mission-statement', 1, '2020-12-08 16:41:39', '2020-12-08 16:41:39', 'e7628b44-fe5b-4519-a909-35f4b1546d01'),
(72, 72, 1, 'greetings', 'about/greetings', 1, '2020-12-08 16:42:16', '2020-12-08 16:42:16', 'b69fa3a3-fd67-409b-a708-2fd79f8efd6c'),
(73, 73, 1, 'mission-statement', 'about/mission-statement', 1, '2020-12-08 16:53:02', '2020-12-08 16:53:02', '7e21359d-3382-4300-b57a-6d85f9062514'),
(74, 74, 1, 'mission-statement', 'about/mission-statement', 1, '2020-12-08 16:58:08', '2020-12-08 16:58:08', '68380feb-afc4-47c2-9f3b-36b7b46636ed'),
(75, 75, 1, 'mission-statement', 'about/mission-statement', 1, '2020-12-08 16:59:38', '2020-12-08 16:59:38', '6dd6a3bf-fb8c-4fb4-922a-b36a1bcd5a82'),
(76, 76, 1, 'staff', 'about/staff', 1, '2020-12-08 17:01:29', '2020-12-08 17:01:29', 'e3364c6e-3c6c-4f51-a76f-613f573bbd57'),
(77, 77, 1, 'alumni', 'about/alumni', 1, '2020-12-08 17:01:46', '2020-12-08 17:01:46', '13e270aa-8912-4cb0-a51c-e0eab7c5a61f'),
(78, 78, 1, 'schools', 'academics/schools', 1, '2020-12-08 17:03:16', '2020-12-08 17:03:16', 'aa7fadda-89bc-4f5a-b7f6-de0bb5e55f8d'),
(79, 79, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-08 17:03:44', '2020-12-08 17:03:44', '897e9784-043f-4114-ad3d-b718ee52fa50'),
(80, 80, 1, 'examinations', 'academics/examinations', 1, '2020-12-08 17:04:21', '2020-12-08 17:04:21', '7eec20c5-0c35-4bec-aff6-e0a4419fd573'),
(81, 81, 1, 'examinations', 'academics/examinations', 1, '2020-12-08 17:04:26', '2020-12-08 17:04:26', '604adaf3-42c9-4290-b875-85c21c328d08'),
(82, 82, 1, 'apply', 'admissions/apply', 1, '2020-12-08 17:04:51', '2020-12-08 17:04:51', '9c62618f-7f75-44a9-8ff5-c6e46a7b4fcc'),
(83, 83, 1, 'fee-structure', 'admissions/fee-structure', 1, '2020-12-08 17:05:06', '2020-12-08 17:05:06', 'a2e99469-0402-4df4-892c-5f550efc2f0f'),
(84, 84, 1, 'scholarship', 'admissions/scholarship', 1, '2020-12-08 17:05:23', '2020-12-08 17:05:23', 'cc31f04c-9dfb-405f-aa51-be4b060fc0f9'),
(85, 85, 1, 'scholarship', 'admissions/scholarship', 1, '2020-12-08 17:05:36', '2020-12-08 17:05:36', 'bc3b435a-e8d6-464d-8aa8-13078c44d62b'),
(86, 86, 1, 'staff', 'portal/staff', 1, '2020-12-08 17:05:49', '2020-12-08 17:05:49', 'afd61ea2-eaa5-4d80-ae4c-b768f026d13a'),
(87, 87, 1, 'alumni', 'portal/alumni', 1, '2020-12-08 17:06:04', '2020-12-08 17:06:04', '1b56c10d-2340-4268-8abc-6834dbfce429'),
(88, 88, 1, 'alumni', 'about/alumni', 1, '2020-12-08 17:08:08', '2020-12-08 17:08:08', '81945318-5ae8-4dee-8ddc-5482a390a0d0'),
(89, 89, 1, NULL, NULL, 1, '2020-12-08 17:17:48', '2020-12-08 17:17:48', 'ebde0f0e-12e0-47da-be4f-39a78de4ee05'),
(90, 90, 1, NULL, NULL, 1, '2020-12-08 17:48:37', '2020-12-08 17:48:37', '375816fd-2c1a-4b34-859a-be6bc5d83386'),
(91, 91, 1, NULL, NULL, 1, '2020-12-08 17:48:37', '2020-12-08 17:48:37', '6a6ec8ba-52f3-49e6-bb15-690b45360325'),
(92, 92, 1, NULL, NULL, 1, '2020-12-08 17:49:16', '2020-12-08 17:49:16', '458af2c5-5fa4-4ade-872c-9e14d4e80d05'),
(93, 93, 1, NULL, NULL, 1, '2020-12-08 18:06:36', '2020-12-08 18:06:36', 'a0f957a1-1f02-470e-bd09-71aebe494e60'),
(94, 94, 1, NULL, NULL, 1, '2020-12-08 18:06:36', '2020-12-08 18:06:36', 'e7db4cfa-0cd4-4fd6-8aa9-9d4048975659'),
(95, 95, 1, NULL, NULL, 1, '2020-12-08 18:12:37', '2020-12-08 18:12:37', '6c436940-3aaa-4d4b-8ecd-c027a91c1e1d'),
(96, 96, 1, NULL, NULL, 1, '2020-12-08 18:12:38', '2020-12-08 18:12:38', 'ed029bdb-018e-49f0-b966-0cee8ea497a3'),
(97, 97, 1, NULL, NULL, 1, '2020-12-08 18:20:43', '2020-12-08 18:20:43', 'cf450303-7689-4655-8436-a19cade197d1'),
(98, 98, 1, NULL, NULL, 1, '2020-12-08 18:20:43', '2020-12-08 18:20:43', 'b2f8c647-7bd4-4dea-b24a-e48dadf65835'),
(99, 99, 1, NULL, NULL, 1, '2020-12-08 18:20:44', '2020-12-08 18:20:44', '22d9cfc6-8ac0-4b1e-8226-9ef254c19ab1'),
(100, 100, 1, NULL, NULL, 1, '2020-12-08 18:27:30', '2020-12-08 18:27:30', '9cb1cb9b-7dc3-422c-878b-05a7759ef2c3'),
(101, 101, 1, NULL, NULL, 1, '2020-12-08 18:27:30', '2020-12-08 18:27:30', '43f4d392-5dd1-43d8-8bf6-3d00902c1af1'),
(102, 102, 1, NULL, NULL, 1, '2020-12-08 18:27:30', '2020-12-08 18:27:30', '38d7eafa-effe-4092-b9fe-1794adb17554'),
(103, 103, 1, 'alumni', 'portal/alumni', 1, '2020-12-08 18:42:42', '2020-12-08 18:42:42', '0bfff33c-f6ad-48c6-a628-e8585f608b45'),
(104, 104, 1, 'alumni', 'portal/alumni', 1, '2020-12-08 18:43:11', '2020-12-08 18:43:11', '03d3ff5c-e448-4597-9c70-4e133a45384a'),
(105, 105, 1, 'staff', 'portal/staff', 1, '2020-12-08 18:43:42', '2020-12-08 18:43:42', '99b5ee87-2eb1-446c-9436-ba6fe4e91186'),
(107, 107, 1, 'staff-portal', 'portal/staff-portal', 1, '2020-12-08 18:44:43', '2020-12-08 18:44:46', 'ed331164-8a31-47e0-bea9-9ec31649dcaf'),
(108, 108, 1, 'staff-portal', 'portal/staff-portal', 1, '2020-12-08 18:44:43', '2020-12-08 18:44:43', 'ff1c02e4-e5c2-47b6-8c2c-d5ede883dec1'),
(110, 110, 1, 'student-portal', 'portal/student-portal', 1, '2020-12-08 18:45:19', '2020-12-08 18:45:22', '5ed02867-e2a1-4987-ac3c-828219f42a9e'),
(111, 111, 1, 'student-portal', 'portal/student-portal', 1, '2020-12-08 18:45:19', '2020-12-08 18:45:19', '6b361181-fb5e-4f05-b9ae-0b8dae5d4fb2'),
(112, 112, 1, NULL, NULL, 1, '2020-12-08 18:50:37', '2020-12-08 18:50:37', '5b1d27de-45eb-4c13-be5b-b74a03f7152e'),
(113, 113, 1, NULL, NULL, 1, '2020-12-08 18:50:37', '2020-12-08 18:50:37', '99cb8df4-cf98-488f-a2c2-1521e53dfec8');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, 1, NULL, '2020-12-02 10:53:00', NULL, NULL, '2020-12-02 10:53:14', '2020-12-02 10:53:14', '5b3a1292-102c-4d13-b819-2d56d87e8be8'),
(3, 1, NULL, 1, NULL, '2020-12-02 10:53:00', NULL, NULL, '2020-12-02 10:53:14', '2020-12-02 10:53:14', '8df5139a-4b55-4c9c-926a-795b0899fc7e'),
(4, 1, NULL, 1, NULL, '2020-12-02 10:53:00', NULL, NULL, '2020-12-02 10:53:14', '2020-12-02 10:53:14', 'fc698baf-4e06-4ecd-aaa3-b090157b024e'),
(5, 1, NULL, 1, NULL, '2020-12-02 10:53:00', NULL, NULL, '2020-12-02 12:23:03', '2020-12-02 12:23:03', 'b7927c3f-bf86-49b1-929f-3626993c8af1'),
(6, 1, NULL, 1, NULL, '2020-12-02 10:53:00', NULL, NULL, '2020-12-02 12:23:04', '2020-12-02 12:23:04', '7e96a117-e84e-4f38-9780-e22646b14ec1'),
(7, 1, NULL, 1, NULL, '2020-12-02 10:53:00', NULL, NULL, '2020-12-02 12:23:04', '2020-12-02 12:23:04', '931a8dc4-11ac-4710-a85e-0158d3c21373'),
(8, 1, NULL, 1, NULL, '2020-12-02 10:53:00', NULL, NULL, '2020-12-02 14:52:33', '2020-12-02 14:52:33', '11879f9f-9721-4b25-9274-6107ac3a41f6'),
(9, 6, NULL, 6, 1, '2020-12-02 15:24:00', NULL, 1, '2020-12-02 15:24:15', '2020-12-02 15:46:05', 'cd519552-4379-4e43-9669-d927a6ca9540'),
(10, 6, NULL, 6, NULL, '2020-12-02 15:24:00', NULL, NULL, '2020-12-02 15:24:15', '2020-12-02 15:24:15', '922a4503-dc2d-452c-bc25-01301c1d8e49'),
(11, 6, NULL, 6, NULL, '2020-12-02 15:24:00', NULL, NULL, '2020-12-02 15:24:15', '2020-12-02 15:24:15', '6692fe1a-7645-4c78-b8f7-74a65367c6a1'),
(12, 2, NULL, 2, 1, '2020-12-02 15:44:00', NULL, 1, '2020-12-02 15:44:09', '2020-12-02 15:46:26', '735945b1-bbf3-443b-964c-1e4eee370a5a'),
(13, 2, NULL, 2, NULL, '2020-12-02 15:44:00', NULL, NULL, '2020-12-02 15:44:09', '2020-12-02 15:44:09', '51567cc7-4804-4721-bae9-586c8ca86fe9'),
(14, 6, NULL, 6, NULL, '2020-12-02 15:24:00', NULL, NULL, '2020-12-02 15:45:00', '2020-12-02 15:45:00', 'c0c8a413-3560-4d85-b946-46c61019b382'),
(15, 6, NULL, 6, NULL, '2020-12-02 15:24:00', NULL, NULL, '2020-12-02 15:45:01', '2020-12-02 15:45:01', 'df2657fe-ab0a-4ffe-afd1-7f9519fdf81d'),
(16, 17, NULL, 17, NULL, '2020-12-08 15:41:00', NULL, NULL, '2020-12-08 15:41:35', '2020-12-08 15:41:35', '25eeeb99-3bc9-4a17-b3ff-b08464991c9e'),
(17, 17, NULL, 17, NULL, '2020-12-08 15:41:00', NULL, NULL, '2020-12-08 15:41:35', '2020-12-08 15:41:35', 'a7684989-fd7e-46ca-89ec-79d0e1fc779c'),
(18, 18, NULL, 18, NULL, '2020-12-08 15:42:00', NULL, NULL, '2020-12-08 15:42:38', '2020-12-08 15:42:38', 'de7d6604-5dad-4853-a512-ad6b2ad7171c'),
(19, 18, NULL, 18, NULL, '2020-12-08 15:42:00', NULL, NULL, '2020-12-08 15:42:38', '2020-12-08 15:42:38', '75887e2a-5c3d-4007-b875-5c9ed880605f'),
(21, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-08 15:43:15', '2020-12-08 15:43:15', '1e06ff9a-db11-4418-9ce0-1ee7af39c4d6'),
(22, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-08 15:43:16', '2020-12-08 15:43:16', 'b708952f-6659-4746-877e-09821f6a0847'),
(24, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-08 15:43:49', '2020-12-08 15:43:49', '6ed890d8-6662-4228-bde1-6fe6f06267ae'),
(25, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-08 15:43:50', '2020-12-08 15:43:50', '9836a25b-793c-434f-be58-10381f01aa1b'),
(27, 16, NULL, 16, 1, '2020-12-08 15:44:00', NULL, NULL, '2020-12-08 15:46:56', '2020-12-08 15:46:56', '630e2b41-3958-4fe0-8205-e791c09f630f'),
(28, 16, NULL, 16, 1, '2020-12-08 15:44:00', NULL, NULL, '2020-12-08 15:46:56', '2020-12-08 15:46:56', '596b62c5-50cd-4dda-814a-ae5669c9d686'),
(30, 16, NULL, 16, 1, '2020-12-08 15:47:00', NULL, NULL, '2020-12-08 15:48:34', '2020-12-08 15:48:34', 'e34ad18c-8e90-4db5-8b93-3c6d4586e884'),
(31, 16, NULL, 16, 1, '2020-12-08 15:47:00', NULL, NULL, '2020-12-08 15:48:34', '2020-12-08 15:48:34', 'a7e0dabd-dba9-4e51-a8c2-de6e0453f76c'),
(33, 16, NULL, 16, 1, '2020-12-08 15:48:00', NULL, NULL, '2020-12-08 15:48:57', '2020-12-08 15:48:57', '67f6fd78-9db6-4085-9266-277d13426c91'),
(34, 16, NULL, 16, 1, '2020-12-08 15:48:00', NULL, NULL, '2020-12-08 15:48:57', '2020-12-08 15:48:57', '0dd596e4-81fc-4c7e-b2bf-ddc3f120e57d'),
(36, 16, NULL, 16, 1, '2020-12-08 15:50:00', NULL, NULL, '2020-12-08 15:51:08', '2020-12-08 15:51:08', 'f0bfa173-52a0-4435-bc7d-c7cb7e2b7e51'),
(37, 16, NULL, 16, 1, '2020-12-08 15:50:00', NULL, NULL, '2020-12-08 15:51:08', '2020-12-08 15:51:08', '4123341c-5ce7-45f4-9160-9f2ac04bf08f'),
(39, 16, NULL, 16, 1, '2020-12-08 15:51:00', NULL, NULL, '2020-12-08 15:52:10', '2020-12-08 15:52:10', 'c41c2449-8d17-4eb4-807c-efb84de05686'),
(40, 16, NULL, 16, 1, '2020-12-08 15:51:00', NULL, NULL, '2020-12-08 15:52:10', '2020-12-08 15:52:10', '1b57f8fa-97af-441b-b932-e8df4f8704fd'),
(42, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-08 15:53:12', '2020-12-08 15:53:12', 'c4c3ad38-8b8c-4f87-add4-c50398f3e0c3'),
(43, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-08 15:53:12', '2020-12-08 15:53:12', 'ae66ae30-7234-44fa-a685-5914e2d6bc78'),
(45, 16, NULL, 16, 1, '2020-12-08 15:53:00', NULL, NULL, '2020-12-08 15:53:41', '2020-12-08 15:53:41', 'd0b0cad8-b63a-4b64-bdeb-5d0bcfb61dd7'),
(46, 16, NULL, 16, 1, '2020-12-08 15:53:00', NULL, NULL, '2020-12-08 15:53:41', '2020-12-08 15:53:41', '9f29c524-ffd0-462e-9265-3f24b747af00'),
(48, 16, NULL, 16, 1, '2020-12-08 15:54:00', NULL, NULL, '2020-12-08 15:54:26', '2020-12-08 15:54:26', '893dfff2-3739-47a1-9dc4-f5029d0da892'),
(49, 16, NULL, 16, 1, '2020-12-08 15:54:00', NULL, NULL, '2020-12-08 15:54:26', '2020-12-08 15:54:26', '99d30688-00ec-44bc-8809-036b220106f7'),
(51, 16, NULL, 16, 1, '2020-12-08 15:54:00', NULL, NULL, '2020-12-08 15:55:03', '2020-12-08 15:55:03', '9d7c237a-bd83-4d71-a135-224973249559'),
(52, 16, NULL, 16, 1, '2020-12-08 15:54:00', NULL, NULL, '2020-12-08 15:55:03', '2020-12-08 15:55:03', 'e73b6ff5-0aeb-462f-8ea8-5835539877a2'),
(54, 16, NULL, 16, 1, '2020-12-08 15:55:00', NULL, NULL, '2020-12-08 15:55:25', '2020-12-08 15:55:25', '8f34bfb6-ac6a-47cb-9acb-7fcba6865b4f'),
(55, 16, NULL, 16, 1, '2020-12-08 15:55:00', NULL, NULL, '2020-12-08 15:55:26', '2020-12-08 15:55:26', 'ee5b6acc-25fc-4017-b4e3-b4fd78c5fd27'),
(56, 16, NULL, 16, 1, '2020-12-08 15:55:00', NULL, NULL, '2020-12-08 15:55:46', '2020-12-08 15:55:46', 'c89fdcef-5ac0-4479-95a1-ce72d6ac1165'),
(58, 16, NULL, 16, 1, '2020-12-08 15:56:00', NULL, NULL, '2020-12-08 15:56:56', '2020-12-08 15:56:56', '2e924621-b724-4702-b269-6416e7110964'),
(59, 16, NULL, 16, 1, '2020-12-08 15:56:00', NULL, NULL, '2020-12-08 15:56:56', '2020-12-08 15:56:56', '6a907325-0f62-4dd8-b395-8261172cc51c'),
(61, 16, NULL, 16, 1, '2020-12-08 15:57:00', NULL, NULL, '2020-12-08 15:57:28', '2020-12-08 15:57:28', '87558e0c-f11a-4b8b-9161-a0887ed2483b'),
(62, 16, NULL, 16, 1, '2020-12-08 15:57:00', NULL, NULL, '2020-12-08 15:57:28', '2020-12-08 15:57:28', '17a836ed-3933-4cef-aa9b-a97dc7371a81'),
(64, 16, 61, 16, 1, '2020-12-08 15:57:00', NULL, 0, '2020-12-08 15:58:11', '2020-12-08 15:58:11', 'a0f3b239-8a9c-477f-ace2-3ddd1083435c'),
(65, 16, NULL, 16, 1, '2020-12-08 15:57:00', NULL, NULL, '2020-12-08 15:58:12', '2020-12-08 15:58:12', '03aa7840-c402-4d5c-9692-7e409dded65c'),
(67, 16, 61, 16, 1, '2020-12-08 15:58:00', NULL, 0, '2020-12-08 15:59:02', '2020-12-08 15:59:02', 'c18e734f-7cf5-4f14-9ff6-ae2239d1869c'),
(68, 16, NULL, 16, 1, '2020-12-08 15:58:00', NULL, NULL, '2020-12-08 15:59:02', '2020-12-08 15:59:02', '285e01ac-abf6-4e95-b9ee-03f5ac33803d'),
(69, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-08 16:27:40', '2020-12-08 16:27:40', '4d5cd3be-15b4-43f2-ad83-5cacc4aaaf7a'),
(70, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-08 16:28:40', '2020-12-08 16:28:40', '5ee6c42c-3711-49d2-bf0c-aa3ecea72734'),
(71, 16, NULL, 16, 1, '2020-12-08 15:44:00', NULL, NULL, '2020-12-08 16:41:39', '2020-12-08 16:41:39', 'e2fc5586-a066-462c-993e-c2bf6c49956a'),
(72, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-08 16:42:16', '2020-12-08 16:42:16', '7dde8183-ccca-4baf-8a33-5f8902aba105'),
(73, 16, NULL, 16, 1, '2020-12-08 15:44:00', NULL, NULL, '2020-12-08 16:53:02', '2020-12-08 16:53:02', 'ea5cbc61-882a-44d6-bd0c-825c9c93c785'),
(74, 16, NULL, 16, 1, '2020-12-08 15:44:00', NULL, NULL, '2020-12-08 16:58:08', '2020-12-08 16:58:08', '9b5863af-d328-4f89-a33f-3cd2ff48c992'),
(75, 16, NULL, 16, 1, '2020-12-08 15:44:00', NULL, NULL, '2020-12-08 16:59:38', '2020-12-08 16:59:38', '1749b1e9-4009-4297-b99f-d4dace9964b1'),
(76, 16, NULL, 16, 1, '2020-12-08 15:47:00', NULL, NULL, '2020-12-08 17:01:29', '2020-12-08 17:01:29', 'a4ca7735-9ce1-4c55-9952-bb97b5fc62c0'),
(77, 16, NULL, 16, 1, '2020-12-08 15:48:00', NULL, NULL, '2020-12-08 17:01:46', '2020-12-08 17:01:46', '449e247f-d056-4011-8c84-a88bfa9385fd'),
(78, 16, NULL, 16, 1, '2020-12-08 15:51:00', NULL, NULL, '2020-12-08 17:03:16', '2020-12-08 17:03:16', '67859216-87e3-4fe9-a2ba-278ab18d0b85'),
(79, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-08 17:03:45', '2020-12-08 17:03:45', 'f170bdae-590c-44ab-8348-651046e09c39'),
(80, 16, NULL, 16, 1, '2020-12-08 15:53:00', NULL, NULL, '2020-12-08 17:04:21', '2020-12-08 17:04:21', '0f9c2d22-e098-4b65-b700-0ba6782cd859'),
(81, 16, NULL, 16, 1, '2020-12-08 15:53:00', NULL, NULL, '2020-12-08 17:04:26', '2020-12-08 17:04:26', '5c26798b-0f0e-41d8-b280-d10c5e177353'),
(82, 16, NULL, 16, 1, '2020-12-08 15:54:00', NULL, NULL, '2020-12-08 17:04:51', '2020-12-08 17:04:51', '1569be4f-3966-4b56-b47a-327354d103be'),
(83, 16, NULL, 16, 1, '2020-12-08 15:55:00', NULL, NULL, '2020-12-08 17:05:06', '2020-12-08 17:05:06', '2da6d1d0-0c19-434d-b368-70e2f8e2c89e'),
(84, 16, NULL, 16, 1, '2020-12-08 15:56:00', NULL, NULL, '2020-12-08 17:05:23', '2020-12-08 17:05:23', '525c37fb-1db3-4b55-a899-955d6dfc02bc'),
(85, 16, NULL, 16, 1, '2020-12-08 15:56:00', NULL, NULL, '2020-12-08 17:05:36', '2020-12-08 17:05:36', 'd03c0ba0-7aac-40bf-9c14-5e4360bf4963'),
(86, 16, NULL, 16, 1, '2020-12-08 15:57:00', NULL, NULL, '2020-12-08 17:05:49', '2020-12-08 17:05:49', '5e82e66f-2808-4650-b392-d3d9824465e9'),
(87, 16, NULL, 16, 1, '2020-12-08 15:58:00', NULL, NULL, '2020-12-08 17:06:04', '2020-12-08 17:06:04', '456db96f-d767-4db6-a939-57cd10fcf28d'),
(88, 16, NULL, 16, 1, '2020-12-08 15:48:00', NULL, NULL, '2020-12-08 17:08:08', '2020-12-08 17:08:08', '9edf7b46-cfb1-4e97-80c7-f33ea760dfdf'),
(103, 16, NULL, 16, 1, '2020-12-08 15:58:00', NULL, NULL, '2020-12-08 18:42:42', '2020-12-08 18:42:42', 'f2bbdf3c-ac04-4563-a7bd-8e2a668a0d7e'),
(104, 16, NULL, 16, 1, '2020-12-08 15:58:00', NULL, NULL, '2020-12-08 18:43:11', '2020-12-08 18:43:11', 'a2bc851e-46a3-40c3-92d2-0c418c4f622f'),
(105, 16, NULL, 16, 1, '2020-12-08 15:57:00', NULL, NULL, '2020-12-08 18:43:42', '2020-12-08 18:43:42', 'f0296a48-74e8-404b-b0a7-5cf5dfc22069'),
(107, 16, NULL, 16, 1, '2020-12-08 18:44:00', NULL, NULL, '2020-12-08 18:44:43', '2020-12-08 18:44:43', '7b35ce0a-f5e0-40e9-a0c2-2ee2732a9638'),
(108, 16, NULL, 16, 1, '2020-12-08 18:44:00', NULL, NULL, '2020-12-08 18:44:43', '2020-12-08 18:44:43', '18596753-69b0-48b5-8c11-71f28ef997ae'),
(110, 16, NULL, 16, 1, '2020-12-08 18:44:00', NULL, NULL, '2020-12-08 18:45:19', '2020-12-08 18:45:19', '39187a33-706a-4a6b-9f2b-1e879f83cf52'),
(111, 16, NULL, 16, 1, '2020-12-08 18:44:00', NULL, NULL, '2020-12-08 18:45:19', '2020-12-08 18:45:19', 'f4f06488-c980-4e52-8b9c-345350e60005');

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Home', 'home', 0, 'site', NULL, '{section.name|raw}', 1, '2020-12-02 10:53:12', '2020-12-02 12:23:04', NULL, 'ea72ba98-4cc1-485f-a8d7-079f860f5188'),
(2, 2, 2, 'Greetings', 'greetings', 1, 'site', NULL, NULL, 1, '2020-12-02 11:16:33', '2020-12-02 11:16:33', '2020-12-08 15:34:16', 'dca0e860-1dd6-43fc-af50-f6adf3914068'),
(3, 3, 3, 'Mission', 'mission', 1, 'site', NULL, NULL, 1, '2020-12-02 12:19:16', '2020-12-02 12:19:16', '2020-12-08 15:34:23', '2fd841d0-b335-4d97-bc79-fd4db0c2ecba'),
(4, 4, 4, 'AboutStaff', 'aboutstaff', 1, 'site', NULL, NULL, 1, '2020-12-02 12:21:34', '2020-12-02 12:21:34', '2020-12-08 15:33:53', '95b58764-df3e-4227-81c0-3897b50a4edf'),
(5, 5, 5, 'AboutAlumni', 'aboutalumni', 1, 'site', NULL, NULL, 1, '2020-12-02 12:22:14', '2020-12-02 12:22:14', '2020-12-08 15:33:49', 'abcf5fd0-ae5e-4577-923d-aee6ae4b531b'),
(6, 6, 6, 'Schools', 'schools', 1, 'site', NULL, NULL, 1, '2020-12-02 12:24:35', '2020-12-02 12:24:35', '2020-12-08 15:34:31', '2710db0e-9638-4b24-bb48-4e2ab1b5f26c'),
(7, 7, 7, 'Schedule', 'schedule', 1, 'site', NULL, NULL, 1, '2020-12-02 12:27:17', '2020-12-02 12:27:17', '2020-12-08 15:34:26', 'e1afc9e9-4c3c-4d31-95ec-2212110d0401'),
(8, 8, 8, 'Exam', 'exam', 1, 'site', NULL, NULL, 1, '2020-12-02 12:28:38', '2020-12-02 12:28:38', '2020-12-08 15:34:07', '6106ddac-0f1c-43b8-abe1-c8289788ca4f'),
(9, 9, 9, 'Apply', 'apply', 1, 'site', NULL, NULL, 1, '2020-12-02 12:29:20', '2020-12-02 12:29:20', '2020-12-08 15:34:01', '0e3571ff-0cce-4079-a1e6-69df3c841450'),
(10, 10, 10, 'Fee', 'fee', 1, 'site', NULL, NULL, 1, '2020-12-02 12:30:20', '2020-12-02 12:30:20', '2020-12-08 15:34:10', 'df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1'),
(11, 11, 11, 'Scholarship', 'scholarship', 1, 'site', NULL, NULL, 1, '2020-12-02 12:31:45', '2020-12-02 12:32:26', '2020-12-08 15:34:28', '91655e28-563b-4366-9cf8-5b046d9ea034'),
(12, 12, 12, 'Gallery', 'gallery', 1, 'site', NULL, NULL, 1, '2020-12-02 12:33:56', '2020-12-02 12:33:56', '2020-12-08 15:34:13', 'cb81be3f-bd15-48cc-8b74-a150d503dce6'),
(13, 13, 13, 'Contact', 'contact', 1, 'site', NULL, NULL, 1, '2020-12-02 12:34:30', '2020-12-02 12:34:30', '2020-12-08 15:34:04', '2ef3126b-a69b-4060-808a-40b707b5ea3e'),
(14, 14, 14, 'Alumni', 'alumni', 1, 'site', NULL, NULL, 1, '2020-12-02 12:36:56', '2020-12-02 12:36:56', '2020-12-08 15:33:57', '7332022d-0fc1-4456-9497-9716b6740a95'),
(15, 15, 15, 'Staff', 'staff', 1, 'site', NULL, NULL, 1, '2020-12-02 12:39:27', '2020-12-02 12:39:27', '2020-12-08 15:34:34', 'c5dd63e5-01a5-4c62-8e13-71add4b4ad68'),
(16, 16, 16, 'Pages', 'pages', 1, 'site', NULL, 'title', 1, '2020-12-08 15:40:08', '2020-12-08 16:26:44', NULL, '881b37d0-96c1-44fe-af2c-81af6cc7ed1d'),
(17, 17, 17, 'Gallery', 'gallery', 0, 'site', NULL, '{section.name|raw}', 1, '2020-12-08 15:41:34', '2020-12-08 15:41:34', NULL, '26a64db7-b03d-4e57-bcfb-19d075610625'),
(18, 18, 18, 'Contact', 'contact', 0, 'site', NULL, '{section.name|raw}', 1, '2020-12-08 15:42:38', '2020-12-08 15:42:38', NULL, '5af62b8d-ef56-4202-9388-1635a2acf935');

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2020-12-02 10:43:05', '2020-12-02 10:43:05', 'cfeacf29-a9a2-4dd0-8566-09319a280117'),
(2, 'Dropdowns', '2020-12-08 17:55:11', '2020-12-08 17:55:11', '89a801dc-4207-40dc-9685-25404b21694d');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 16, 21, 1, 0, 1, '2020-12-08 16:26:44', '2020-12-08 16:26:44', 'be5a7641-90a6-4051-8e1d-565e65684e70'),
(2, 19, 22, 3, 1, 0, '2020-12-08 17:21:56', '2020-12-08 17:21:56', 'ebecd28a-766e-4b4c-8e24-c3ba88a67a1b'),
(3, 19, 22, 4, 1, 1, '2020-12-08 17:21:56', '2020-12-08 17:21:56', '0d5307c8-bf94-4b83-b681-3a10aca9c1de'),
(22, 21, 31, 7, 1, 0, '2020-12-08 18:39:50', '2020-12-08 18:39:50', '3281c99d-79e3-4d96-a4c1-89c5796f2ef4'),
(23, 21, 31, 6, 1, 1, '2020-12-08 18:39:50', '2020-12-08 18:39:50', 'd88d76be-9557-4cab-aebc-755669c0cb9b'),
(24, 22, 32, 10, 1, 0, '2020-12-08 18:40:09', '2020-12-08 18:40:09', 'ae26024e-ccbf-416f-aaa7-db4db9b3df04'),
(25, 22, 32, 9, 1, 1, '2020-12-08 18:40:09', '2020-12-08 18:40:09', '18dd1172-b765-46ed-99e5-04844a0bbc48'),
(26, 23, 33, 13, 1, 0, '2020-12-08 18:40:31', '2020-12-08 18:40:31', 'a2a43f01-b85f-45e1-82d1-405391daa914'),
(27, 23, 33, 12, 0, 1, '2020-12-08 18:40:31', '2020-12-08 18:40:31', '78889dc5-e617-4ab4-8453-dce67eb913c2'),
(28, 24, 34, 16, 1, 0, '2020-12-08 18:40:46', '2020-12-08 18:40:46', 'a6aa9678-5978-4239-ba7e-cb523305b1bc'),
(29, 24, 34, 15, 1, 1, '2020-12-08 18:40:46', '2020-12-08 18:40:46', '4e780451-63c8-4f9a-9a6d-0769756e9cb1'),
(30, 20, 35, 2, 0, 0, '2020-12-08 18:41:34', '2020-12-08 18:41:34', 'fe6b5fbf-d8a2-4bed-acff-6fd94318bb8d'),
(31, 20, 35, 5, 0, 1, '2020-12-08 18:41:34', '2020-12-08 18:41:34', 'bb2e6bae-abc1-4f3a-959d-4341a472c0c5'),
(32, 20, 35, 8, 0, 2, '2020-12-08 18:41:34', '2020-12-08 18:41:34', '272635f7-b850-433f-aba5-9da178b6d3a5'),
(33, 20, 35, 11, 0, 3, '2020-12-08 18:41:34', '2020-12-08 18:41:34', '4671d4ec-abeb-4f90-af60-1e4bad2ddb2b'),
(34, 20, 35, 14, 0, 4, '2020-12-08 18:41:34', '2020-12-08 18:41:34', '095a6316-5e7b-4cfb-b1fb-505b08541151');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2020-12-02 10:53:12', '2020-12-02 10:53:12', NULL, 'f09c9fce-8670-428c-9ad8-867dd6fe5cb7'),
(2, 'craft\\elements\\Entry', '2020-12-02 11:16:33', '2020-12-02 11:16:33', '2020-12-08 15:34:16', '02f32c2d-e80f-45ef-a55c-9a864803a003'),
(3, 'craft\\elements\\Entry', '2020-12-02 12:19:16', '2020-12-02 12:19:16', '2020-12-08 15:34:23', '36a3adaf-0829-4e93-b13e-db2ea9719a94'),
(4, 'craft\\elements\\Entry', '2020-12-02 12:21:34', '2020-12-02 12:21:34', '2020-12-08 15:33:53', '5f220621-d955-4433-bf08-b5e2e5df4f0e'),
(5, 'craft\\elements\\Entry', '2020-12-02 12:22:14', '2020-12-02 12:22:14', '2020-12-08 15:33:49', 'cde72b09-6161-4e5b-832a-98a96c4f8258'),
(6, 'craft\\elements\\Entry', '2020-12-02 12:24:35', '2020-12-02 12:24:35', '2020-12-08 15:34:31', '9033ad55-b824-4eef-a574-c123e2cceaf4'),
(7, 'craft\\elements\\Entry', '2020-12-02 12:27:17', '2020-12-02 12:27:17', '2020-12-08 15:34:26', '5a42492e-f378-46b8-983f-3722e83616d3'),
(8, 'craft\\elements\\Entry', '2020-12-02 12:28:38', '2020-12-02 12:28:38', '2020-12-08 15:34:07', '3e8e5ee3-cf67-4e8a-8748-5b41338e01fc'),
(9, 'craft\\elements\\Entry', '2020-12-02 12:29:20', '2020-12-02 12:29:20', '2020-12-08 15:34:01', '692961db-d3ca-4335-9a15-ffa7e35f4da3'),
(10, 'craft\\elements\\Entry', '2020-12-02 12:30:20', '2020-12-02 12:30:20', '2020-12-08 15:34:10', 'bb8e5e61-e950-4942-9780-d6c714763604'),
(11, 'craft\\elements\\Entry', '2020-12-02 12:31:45', '2020-12-02 12:31:45', '2020-12-08 15:34:28', '1f24db5c-988c-4e3a-a40f-22b9a85dfc79'),
(12, 'craft\\elements\\Entry', '2020-12-02 12:33:56', '2020-12-02 12:33:56', '2020-12-08 15:34:13', '90ab103c-065b-4728-bda3-c691a5873088'),
(13, 'craft\\elements\\Entry', '2020-12-02 12:34:30', '2020-12-02 12:34:30', '2020-12-08 15:34:04', '03ab4a56-4407-42aa-b1e5-26237f1b4486'),
(14, 'craft\\elements\\Entry', '2020-12-02 12:36:56', '2020-12-02 12:36:56', '2020-12-08 15:33:57', 'bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb'),
(15, 'craft\\elements\\Entry', '2020-12-02 12:39:27', '2020-12-02 12:39:27', '2020-12-08 15:34:34', '09dc10b5-e310-4517-8669-fe2489e2b866'),
(16, 'craft\\elements\\Entry', '2020-12-08 15:40:07', '2020-12-08 15:40:07', NULL, 'c6646a7e-cb01-4c85-ba32-ab58e713af97'),
(17, 'craft\\elements\\Entry', '2020-12-08 15:41:34', '2020-12-08 15:41:34', NULL, '919bf5a6-1dcf-47eb-bcc8-246b4da07d08'),
(18, 'craft\\elements\\Entry', '2020-12-08 15:42:38', '2020-12-08 15:42:38', NULL, '85eda2dc-e12f-4973-9cc4-dea2ae7fa120'),
(19, 'craft\\elements\\MatrixBlock', '2020-12-08 17:21:56', '2020-12-08 17:21:56', NULL, '513dba55-c96d-407d-8afa-26dbc57ca2ca'),
(20, 'craft\\elements\\GlobalSet', '2020-12-08 17:23:10', '2020-12-08 17:23:10', NULL, '9693dd27-4435-4e32-97b5-94f24073ba7f'),
(21, 'craft\\elements\\MatrixBlock', '2020-12-08 18:00:15', '2020-12-08 18:00:15', NULL, '61e7d1ba-cf48-4d72-8297-3d2170b75080'),
(22, 'craft\\elements\\MatrixBlock', '2020-12-08 18:15:35', '2020-12-08 18:15:35', NULL, '931853e6-2b82-4542-9593-f899e4a17b8a'),
(23, 'craft\\elements\\MatrixBlock', '2020-12-08 18:25:00', '2020-12-08 18:25:00', NULL, 'cdb435cb-31d0-4ec3-a596-acb75043007c'),
(24, 'craft\\elements\\MatrixBlock', '2020-12-08 18:39:32', '2020-12-08 18:39:32', NULL, '3244b2f3-7266-4b65-be84-f5d3d93b7735');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `elements` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 2, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 11:16:33', '2020-12-02 11:16:33', '284c8f79-81e5-4421-92d0-f53f376a0078'),
(3, 3, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:19:16', '2020-12-02 12:19:16', 'f41e43fa-99e9-4366-b32d-92fee67cfb0a'),
(4, 4, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:21:34', '2020-12-02 12:21:34', '9eb06d41-55da-4278-8857-7b05faf9a17c'),
(5, 5, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:22:14', '2020-12-02 12:22:14', '5a2e8cb3-9383-4157-9a55-3147fe928afb'),
(6, 1, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:23:04', '2020-12-02 12:23:04', '253e5203-28a6-4963-8bd4-7b71d50075cf'),
(7, 6, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:24:35', '2020-12-02 12:24:35', '54b6e917-c260-4f48-ac03-5b0a96696053'),
(8, 7, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:27:17', '2020-12-02 12:27:17', '9c800470-3e5f-4937-9944-2127b81e989d'),
(9, 8, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:28:38', '2020-12-02 12:28:38', 'b7a914b8-067e-4db5-b98e-17f30ed02bd0'),
(10, 9, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:29:20', '2020-12-02 12:29:20', '74abbe29-6945-4410-b61e-4cfd84231797'),
(11, 10, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:30:20', '2020-12-02 12:30:20', '5f141abc-5a4b-4ee6-a8d4-0a6d8d50f57d'),
(13, 11, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:32:26', '2020-12-02 12:32:26', '4cfe0a3c-89f7-4bc2-906a-1e2d7f657cf0'),
(14, 12, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:33:56', '2020-12-02 12:33:56', '6e63a4a4-145f-41f7-8ee2-51e8c080483c'),
(15, 13, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:34:30', '2020-12-02 12:34:30', 'b6b71431-5f40-4698-9da2-677fa68ed967'),
(16, 14, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:36:56', '2020-12-02 12:36:56', '2754ea7d-4089-4e1a-bd42-85e6da7e5e74'),
(17, 15, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:39:27', '2020-12-02 12:39:27', '1bda70d0-ad7f-4bdc-a7da-4655f6e1a4d8'),
(19, 17, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-08 15:41:34', '2020-12-08 15:41:34', '4e7431a8-9be0-4e45-8b2f-1e18af2fe8c3'),
(20, 18, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-08 15:42:38', '2020-12-08 15:42:38', 'eb7c3afb-c5ce-48f4-b22c-89b3364aff61'),
(21, 16, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c7321563-1442-4106-8ac4-8fb704f32b30\"}]', 1, '2020-12-08 16:26:44', '2020-12-08 16:26:44', '1401b79b-0a02-4cb4-8bab-46de0f280e27'),
(22, 19, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"46dbcdd3-a122-40e4-86c3-f5e780561716\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"cce6938a-8167-4c99-ac15-e86f2abc2b1f\"}]', 1, '2020-12-08 17:21:56', '2020-12-08 17:21:56', '1ddc3356-f772-40bb-b4bf-30cf3590efdf'),
(31, 21, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"9c6ac610-ed30-42a2-b993-62ca6086aab0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"7d20c2fd-4b78-4e3f-a7ab-f50550446508\"}]', 1, '2020-12-08 18:39:50', '2020-12-08 18:39:50', '0eca0f24-5ba2-44b8-8ebb-6f7b5f2668d2'),
(32, 22, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"2d8244ee-b607-4607-9b49-6200c414c7f1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"0fab4496-80b3-4ab7-b2ee-414de4b12e5d\"}]', 1, '2020-12-08 18:40:09', '2020-12-08 18:40:09', 'd2a76235-2d6c-4dd8-a305-6216cfa30af0'),
(33, 23, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"6dd039e4-fb62-4d70-ada3-4f6fce6921d8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4664af46-0a8c-47d6-ac5f-f116da7c7104\"}]', 1, '2020-12-08 18:40:31', '2020-12-08 18:40:31', '843609ec-f18c-421e-a41c-f90c19e9725f'),
(34, 24, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"ea2653e0-0488-467b-9089-ae51d28f1f33\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"559a17c2-fd93-49ac-b202-3e136746596e\"}]', 1, '2020-12-08 18:40:46', '2020-12-08 18:40:46', 'b9d11394-cd71-4247-818d-7346c0f5225c'),
(35, 20, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"971de349-e94d-4322-8b0d-00ad46dc89dc\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c9f4341b-ab6b-4ec6-a90a-d530baa43734\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"734e77de-9fcf-443c-8e0d-0a2512ab8676\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"80672d7d-1690-47a4-904e-14e353770526\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0348ab67-1309-4352-b4c7-50d888e4193f\"}]', 1, '2020-12-08 18:41:34', '2020-12-08 18:41:34', '15470770-8339-40e5-a697-60f5c0e03322');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Page Heading', 'pageHeading', 'global', '', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}', '2020-12-08 16:25:44', '2020-12-08 16:25:44', 'c7321563-1442-4106-8ac4-8fb704f32b30'),
(2, 1, 'Navigation', 'navigation', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_navigation}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2020-12-08 17:21:53', '2020-12-08 17:21:53', '971de349-e94d-4322-8b0d-00ad46dc89dc'),
(3, NULL, 'Link Text', 'linkText', 'matrixBlockType:135253d8-9314-43b5-ba87-badaf563f0c6', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-08 17:21:55', '2020-12-08 17:21:55', '46dbcdd3-a122-40e4-86c3-f5e780561716'),
(4, NULL, 'Link Destination', 'linkDestination', 'matrixBlockType:135253d8-9314-43b5-ba87-badaf563f0c6', '', 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-12-08 17:21:56', '2020-12-08 17:21:56', 'cce6938a-8167-4c99-ac15-e86f2abc2b1f'),
(5, 2, 'About', 'about', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_about}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2020-12-08 18:00:12', '2020-12-08 18:00:12', 'c9f4341b-ab6b-4ec6-a90a-d530baa43734'),
(6, NULL, 'Link Destination', 'linkDestination', 'matrixBlockType:03f57808-35f2-4d69-88c1-29a81988f974', '', 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-12-08 18:00:14', '2020-12-08 18:39:50', '7d20c2fd-4b78-4e3f-a7ab-f50550446508'),
(7, NULL, 'Link Text', 'linkText', 'matrixBlockType:03f57808-35f2-4d69-88c1-29a81988f974', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-08 18:00:15', '2020-12-08 18:00:15', '9c6ac610-ed30-42a2-b993-62ca6086aab0'),
(8, 2, 'Academics', 'academics', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_academics}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2020-12-08 18:15:33', '2020-12-08 18:15:33', '734e77de-9fcf-443c-8e0d-0a2512ab8676'),
(9, NULL, 'Link Destination', 'linkDestination', 'matrixBlockType:106a6fcb-82be-4c8e-be6d-e9a983e4cf8e', '', 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-12-08 18:15:34', '2020-12-08 18:40:09', '0fab4496-80b3-4ab7-b2ee-414de4b12e5d'),
(10, NULL, 'Link Text', 'linkText', 'matrixBlockType:106a6fcb-82be-4c8e-be6d-e9a983e4cf8e', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-08 18:15:35', '2020-12-08 18:40:09', '2d8244ee-b607-4607-9b49-6200c414c7f1'),
(11, 2, 'Admissions', 'admissions', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_admissions}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2020-12-08 18:24:57', '2020-12-08 18:24:57', '80672d7d-1690-47a4-904e-14e353770526'),
(12, NULL, 'Link Destination', 'linkDestination', 'matrixBlockType:cc6d6a90-0dc1-455d-b29d-bf6afefdfe62', '', 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-12-08 18:24:59', '2020-12-08 18:40:30', '4664af46-0a8c-47d6-ac5f-f116da7c7104'),
(13, NULL, 'Link Text', 'linkText', 'matrixBlockType:cc6d6a90-0dc1-455d-b29d-bf6afefdfe62', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-08 18:25:00', '2020-12-08 18:25:00', '6dd039e4-fb62-4d70-ada3-4f6fce6921d8'),
(14, 2, 'Portal', 'portal', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_portal}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2020-12-08 18:39:30', '2020-12-08 18:39:30', '0348ab67-1309-4352-b4c7-50d888e4193f'),
(15, NULL, 'Link Destination', 'linkDestination', 'matrixBlockType:f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9', '', 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-12-08 18:39:32', '2020-12-08 18:40:46', '559a17c2-fd93-49ac-b202-3e136746596e'),
(16, NULL, 'Link text', 'linkText', 'matrixBlockType:f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-08 18:39:32', '2020-12-08 18:39:32', 'ea2653e0-0488-467b-9089-ae51d28f1f33');

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `globalsets`
--

INSERT INTO `globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(89, 'Header', 'header', 20, '2020-12-08 17:17:48', '2020-12-08 17:23:10', '6da785e4-bd50-43e4-ab27-4ff5f9293e9e');

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.5.16', '3.5.13', 0, 'oruerbztwfxa', 'nvqrnuymwtbu', '2020-12-02 10:43:05', '2020-12-08 18:42:43', 'b3876e5d-ef6c-4d26-b725-df99efb8f4bd');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixblocks`
--

INSERT INTO `matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(90, 89, 2, 1, 1, NULL, '2020-12-08 17:48:37', '2020-12-08 17:48:37', 'c10ff230-da78-44d8-9bc7-1936830e889a'),
(91, 89, 2, 1, 2, NULL, '2020-12-08 17:48:38', '2020-12-08 17:48:38', '31f2b9db-1dec-46c3-9177-824fb540b8a0'),
(92, 89, 2, 1, 3, NULL, '2020-12-08 17:49:16', '2020-12-08 17:49:16', 'e130e9a3-efae-4a09-ab3f-200427b01e9d'),
(93, 89, 5, 2, 1, NULL, '2020-12-08 18:06:36', '2020-12-08 18:06:36', '7b221c6e-a48f-41c5-a45a-3fc50cc70317'),
(94, 89, 5, 2, 2, NULL, '2020-12-08 18:06:36', '2020-12-08 18:06:36', '68f2c4cd-5848-4433-b8f4-09a40a87dac9'),
(95, 89, 5, 2, 3, NULL, '2020-12-08 18:12:37', '2020-12-08 18:12:37', '2b3146f4-328e-4981-ad6e-c1e0b755fbbd'),
(96, 89, 5, 2, 4, NULL, '2020-12-08 18:12:38', '2020-12-08 18:12:38', '8778bd49-6968-4014-a846-f74262002c4d'),
(97, 89, 8, 3, 1, NULL, '2020-12-08 18:20:43', '2020-12-08 18:20:43', '0f3aae6b-467a-43d4-85d4-613721083351'),
(98, 89, 8, 3, 2, NULL, '2020-12-08 18:20:43', '2020-12-08 18:20:43', '13d252fe-1255-4d1e-9760-15eeb246d46f'),
(99, 89, 8, 3, 3, NULL, '2020-12-08 18:20:44', '2020-12-08 18:20:44', '5914f90b-e4ce-4f1e-9006-19d2940a646d'),
(100, 89, 11, 4, 1, NULL, '2020-12-08 18:27:30', '2020-12-08 18:27:30', 'a2398c1e-cd36-4ee1-8320-16f41297ffed'),
(101, 89, 11, 4, 2, NULL, '2020-12-08 18:27:30', '2020-12-08 18:27:30', 'cc714b91-4ab5-4c68-aa49-375cdf633612'),
(102, 89, 11, 4, 3, NULL, '2020-12-08 18:27:30', '2020-12-08 18:27:30', '93da6d92-8219-41b7-868e-45e37140f655'),
(112, 89, 14, 5, 1, NULL, '2020-12-08 18:50:37', '2020-12-08 18:50:37', 'fee7b8d4-221e-44e0-b4a6-1445129e6ae3'),
(113, 89, 14, 5, 2, NULL, '2020-12-08 18:50:37', '2020-12-08 18:50:37', 'a7e80295-3b80-424c-b55a-d2f74d8a8158');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixblocktypes`
--

INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 19, 'Nav Link', 'navLink', 1, '2020-12-08 17:21:56', '2020-12-08 17:21:56', '135253d8-9314-43b5-ba87-badaf563f0c6'),
(2, 5, 21, 'Nav Link', 'navLink', 1, '2020-12-08 18:00:15', '2020-12-08 18:00:15', '03f57808-35f2-4d69-88c1-29a81988f974'),
(3, 8, 22, 'Nav Link', 'navLink', 1, '2020-12-08 18:15:35', '2020-12-08 18:15:35', '106a6fcb-82be-4c8e-be6d-e9a983e4cf8e'),
(4, 11, 23, 'Nav Link', 'navLink', 1, '2020-12-08 18:25:00', '2020-12-08 18:25:00', 'cc6d6a90-0dc1-455d-b29d-bf6afefdfe62'),
(5, 14, 24, 'Nav Link', 'navLink', 1, '2020-12-08 18:39:32', '2020-12-08 18:39:32', 'f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_about`
--

CREATE TABLE `matrixcontent_about` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_navLink_linkText` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_about`
--

INSERT INTO `matrixcontent_about` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_navLink_linkText`) VALUES
(1, 93, 1, '2020-12-08 18:06:36', '2020-12-08 18:51:35', 'bd1b2554-9e37-484f-b028-e3aff8d79d7e', 'Greetings'),
(2, 94, 1, '2020-12-08 18:06:36', '2020-12-08 18:51:35', '2f8643a4-cc83-45b5-81f5-c5b2c2498df5', 'Mission Statement'),
(3, 95, 1, '2020-12-08 18:12:37', '2020-12-08 18:51:35', '21025e24-2bf5-4e58-b473-40958526fc14', 'Staff'),
(4, 96, 1, '2020-12-08 18:12:38', '2020-12-08 18:51:35', '584308f0-4b30-4a87-b06f-28076ca4b6ca', 'Alumni');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_academics`
--

CREATE TABLE `matrixcontent_academics` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_navLink_linkText` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_academics`
--

INSERT INTO `matrixcontent_academics` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_navLink_linkText`) VALUES
(1, 97, 1, '2020-12-08 18:20:43', '2020-12-08 18:51:35', 'b98fdf57-f768-4d49-9f3d-62f0f1658936', 'Schools'),
(2, 98, 1, '2020-12-08 18:20:43', '2020-12-08 18:51:35', '29b76f49-f2e2-4f34-aef4-0f3083250283', 'Exam Schedule'),
(3, 99, 1, '2020-12-08 18:20:44', '2020-12-08 18:51:35', 'ad034eb5-7e44-4b19-9a88-fd7e79ba8932', 'Examination');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_admissions`
--

CREATE TABLE `matrixcontent_admissions` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_navLink_linkText` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_admissions`
--

INSERT INTO `matrixcontent_admissions` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_navLink_linkText`) VALUES
(1, 100, 1, '2020-12-08 18:27:30', '2020-12-08 18:51:35', '95e95ce8-475c-4151-aaff-372537621c0f', 'Apply'),
(2, 101, 1, '2020-12-08 18:27:30', '2020-12-08 18:51:35', '65cae555-93ba-443e-a151-e7fea3370a66', 'Fee Structure'),
(3, 102, 1, '2020-12-08 18:27:30', '2020-12-08 18:51:35', 'a0fd747c-930c-4690-b470-ff5800e37152', 'Scholarship');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_navigation`
--

CREATE TABLE `matrixcontent_navigation` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_navLink_linkText` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_navigation`
--

INSERT INTO `matrixcontent_navigation` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_navLink_linkText`) VALUES
(1, 90, 1, '2020-12-08 17:48:37', '2020-12-08 18:51:35', '5ab6f8cf-ee1b-4245-b2ef-670022d3e6be', 'Home'),
(2, 91, 1, '2020-12-08 17:48:38', '2020-12-08 18:51:35', '070afba5-3228-4f21-8376-2b94cadf73e9', 'Contact'),
(3, 92, 1, '2020-12-08 17:49:16', '2020-12-08 18:51:35', 'bd371b28-0e65-40d5-8f82-4396c93bf33d', 'Gallery');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_portal`
--

CREATE TABLE `matrixcontent_portal` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_navLink_linkText` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_portal`
--

INSERT INTO `matrixcontent_portal` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_navLink_linkText`) VALUES
(1, 112, 1, '2020-12-08 18:50:37', '2020-12-08 18:51:35', '9f45978a-a121-4500-be35-5d1aa72b6b93', 'Staff'),
(2, 113, 1, '2020-12-08 18:50:37', '2020-12-08 18:51:35', '986ffdd5-ffe0-4d20-aeda-71b7c60adf42', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '2020-12-02 10:43:09', 'a04612a9-85f7-48a5-bcc4-94a141115278'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '015051f7-07f3-4c21-ab6f-518a7268efee'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '2020-12-02 10:43:09', 'f6b7eec5-bac8-415a-b7ea-6243714c23b6'),
(4, 'craft', 'm150403_184533_field_version', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '1edda1b1-9ab1-40ef-860b-6f33a547573b'),
(5, 'craft', 'm150403_184729_type_columns', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '05d09d65-00f3-4960-88dc-6689973ed631'),
(6, 'craft', 'm150403_185142_volumes', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '7487d5b6-29a7-4f3b-8fbf-db58485cf4e2'),
(7, 'craft', 'm150428_231346_userpreferences', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '2020-12-02 10:43:09', 'a4bd1db3-2381-4579-a486-0b3c7b316c88'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '89899859-a145-4de6-8df9-348a3f204021'),
(9, 'craft', 'm150617_213829_update_email_settings', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '5943541a-7e9f-411e-bb50-c24097fa29e5'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '8f354a9b-072b-49c6-8032-fbf5e17d1e17'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '71ccc1a4-c9da-4107-8bb2-0b6ab2b0e221'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '2020-12-02 10:43:09', '54e47477-b39f-4176-a921-50091e6c2fa2'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '8e9f854a-b1d7-4bfc-9470-fe364078ccd4'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '92d2a3d6-b768-4afe-9f12-ea25bacddb94'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '4cc2f229-c7d7-4e14-ad19-9c72614cb0b0'),
(16, 'craft', 'm151209_000000_move_logo', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', 'bf44ea52-ca2d-4b7f-a507-87ca224c1b47'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '61d2f9f4-cac2-4a67-a115-effaaafe37c0'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '32b35162-a3d2-4b7a-a6d5-51efb85b16e2'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', 'a243b790-7075-4882-b454-54220aba1df8'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '6df481e9-58e4-4399-81b8-c3bcc87e82d0'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', 'b6e3906e-5b1a-4ab5-82b7-0b440b5d1ff9'),
(22, 'craft', 'm160727_194637_column_cleanup', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', 'e29aa29a-9f8e-4293-8b15-6acc033b32fc'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '74e63503-74f7-4c57-b84c-a3898e539973'),
(24, 'craft', 'm160807_144858_sites', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '40ea1702-2fc0-42b8-86e8-b021cf98a714'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '4753fe35-2e2f-4666-be96-5016cd70df6e'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '157b1875-b80d-4f34-95f8-82fb15acf69f'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '065c6bac-f216-424e-8cfb-dabc2c5f200b'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', 'ed93f9db-bc25-4441-a64b-8bdd9f155959'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '37302616-b5c4-4c9c-8ee2-b32b6d7aab99'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '28a80a65-3b7c-40b8-a2b6-248489e44c08'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', 'b47d6b7a-3b95-4ba7-94e5-7c664a62beeb'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', 'f2b413aa-ffba-4e34-b5e3-182da6002ab8'),
(33, 'craft', 'm161007_130653_update_email_settings', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '4b5b11cd-f2a9-4c35-9e16-72e74f203c4b'),
(34, 'craft', 'm161013_175052_newParentId', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '38a52b90-5ff8-47a2-b864-3fae6d0173e2'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '7a175e6b-410c-446d-b452-157ec6e020ab'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', 'f24550fd-a840-4127-af5a-001ede908ea9'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '44b12511-1163-4df3-a90e-f7e8981452af'),
(38, 'craft', 'm161029_124145_email_message_languages', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '3c2a94a7-9614-4a7c-b690-bda47c116a07'),
(39, 'craft', 'm161108_000000_new_version_format', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2546da6e-14c3-4aa3-bcfd-f6c76fc1096b'),
(40, 'craft', 'm161109_000000_index_shuffle', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', 'b9b30cb2-5034-4c6f-87bf-bb9169c2a997'),
(41, 'craft', 'm161122_185500_no_craft_app', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', 'be4f1e9e-c56b-47fe-b2e2-e98fee06df3d'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2020-12-02 10:43:10', '2020-12-02 10:43:10', '2020-12-02 10:43:10', 'ac538db3-b396-42fb-bbd5-5c8eb03679d5'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '336dbf24-8d98-4b7e-aa49-baa4086d24ab'),
(44, 'craft', 'm170114_161144_udates_permission', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '53a64b1a-71d7-48d5-9b1c-58d48cf7a7ca'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '90c345c0-9d35-4c38-a885-e0a9f9c6d1a7'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', 'caf55d82-bf36-43db-8d13-5d6df43adefb'),
(47, 'craft', 'm170206_142126_system_name', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '3ae4946f-761e-4248-ac81-f2dfaa4a39de'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '79d51151-de27-41da-a46d-9fdff350e70f'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', 'd87667a4-eea9-4bbe-bfd7-fdbe2fc14839'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2b983ef7-6080-410b-9492-c98777ab84e0'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '0645c50b-da52-42ed-8d77-2f9605da2752'),
(52, 'craft', 'm170228_171113_system_messages', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', 'a5a15b08-a323-4681-b5bb-77c63b31dec8'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '544b8112-be51-4314-89c2-73c3745f9bda'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '7ec2a351-e770-47c8-82fd-3a69b2bfc740'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '10623267-71a3-4064-a3cd-cf7e9028cd98'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '34f9561a-a1fa-4cad-9295-5c56a22d294a'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '0d6e1504-2cff-4907-9e07-ecb1d1a5b649'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '90655d4d-24ac-4014-aa7e-57a60be6b7dc'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '97affb76-de0f-4e0b-a7f5-37af403f749c'),
(60, 'craft', 'm170704_134916_sites_tables', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '15755607-ea6c-48e4-9f6a-f42f0ccfcf44'),
(61, 'craft', 'm170706_183216_rename_sequences', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '48ddbeae-bb25-4fb5-9ae4-8d841209bfa6'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '01acc1ce-12e7-4540-a2c9-55132d8bf387'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '0ca95a31-b025-4722-87c1-98f93fed2f41'),
(64, 'craft', 'm170810_201318_create_queue_table', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '4e0b918c-ad43-4254-b29b-9b259c567f2c'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '2020-12-02 10:43:11', '689004ce-cb14-4b57-ba55-d050825f6d17'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', 'ec2215fe-af59-4622-b4c6-5765291a4244'),
(67, 'craft', 'm171011_214115_site_groups', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '5b403e91-7092-4741-b4ef-6c54abeeab24'),
(68, 'craft', 'm171012_151440_primary_site', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '42dd2e12-0ae9-499b-8e62-a9e300cb493d'),
(69, 'craft', 'm171013_142500_transform_interlace', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '4ed5652e-5704-47e3-a7b6-28d35e182f71'),
(70, 'craft', 'm171016_092553_drop_position_select', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '3fc2c283-e3c2-4d88-b6a4-af165d9c292e'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '1220664b-8b52-4f5c-9cc0-b0fc289f29a4'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', 'bd5dc88e-a484-4a32-96ff-c44c1df68c05'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '0d1d7c99-2a21-4db6-b83c-de8e68bc74e6'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '3d30f201-011b-487e-9c3a-c1f897674b86'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '46290146-063b-4dea-b11e-e04191c2925e'),
(76, 'craft', 'm171202_004225_update_email_settings', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '33a70022-5d49-4b7f-866f-52c176388199'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '48bad1e0-3a1a-4f7f-9988-2727cf1938a4'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', 'd8b193c2-2c7e-4b36-85e2-e577e3d4d94b'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '34f13687-46d7-45b0-8e5a-5572db1420f4'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '148406e8-1d27-4cb8-8483-6433d0c8bbc1'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '4f02d09a-144d-498d-a71a-f6bc4e6e8429'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', 'a5f779df-1a1d-4a16-ae62-4c749afcffc1'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '65c11dec-9dcb-4658-bc3b-f165560ffbe6'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '92b2a108-6421-4788-9941-6a7b20df5393'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', 'e32efa9e-c178-4f87-8115-a2b18bd71fc7'),
(86, 'craft', 'm180217_172123_tiny_ints', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', 'a7aa8e2b-c0f2-4fee-b506-8a3a3e5f35fc'),
(87, 'craft', 'm180321_233505_small_ints', '2020-12-02 10:43:12', '2020-12-02 10:43:12', '2020-12-02 10:43:12', 'c98ff89f-07f5-47b7-8eef-40976272e0c8'),
(88, 'craft', 'm180328_115523_new_license_key_statuses', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', 'a4a772b3-a35c-43e6-a2e5-96b240912317'),
(89, 'craft', 'm180404_182320_edition_changes', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '6aab2b8d-66d5-4f27-991a-443f60d32cd6'),
(90, 'craft', 'm180411_102218_fix_db_routes', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '8fa2d779-8cbc-4357-881f-e5ed71940494'),
(91, 'craft', 'm180416_205628_resourcepaths_table', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '0174d016-b0e9-40b9-ae1a-cbb705dd58e8'),
(92, 'craft', 'm180418_205713_widget_cleanup', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '44e3074f-e30b-472f-a312-74ee869bfd09'),
(93, 'craft', 'm180425_203349_searchable_fields', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '83099e3d-f528-4e49-b799-71183ebde34d'),
(94, 'craft', 'm180516_153000_uids_in_field_settings', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', 'e2b308e7-f0b4-4aa9-a850-3c2b17d9e046'),
(95, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '3c48eef5-b90d-46ab-a927-8cc14aa08c2c'),
(96, 'craft', 'm180518_173000_permissions_to_uid', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '446d07c3-63a7-4b19-ad27-f0e371a2ccc6'),
(97, 'craft', 'm180520_173000_matrix_context_to_uids', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2ce79bd0-2623-4c19-a479-b27cdaa66333'),
(98, 'craft', 'm180521_172900_project_config_table', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '1cdb4e5a-5ef8-4b93-bb0c-99deda58b5d1'),
(99, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '6a1997a1-b2b4-4aa0-80d0-d633fa90a5f9'),
(100, 'craft', 'm180731_162030_soft_delete_sites', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', 'f03f5efa-7575-48e0-997b-78e1b942c5f1'),
(101, 'craft', 'm180810_214427_soft_delete_field_layouts', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', 'edc3cacb-b36e-493b-a895-b5ab54f78f58'),
(102, 'craft', 'm180810_214439_soft_delete_elements', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '7ba08581-ed83-4752-a3f4-3d6a6f6c6db1'),
(103, 'craft', 'm180824_193422_case_sensitivity_fixes', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2193f196-778f-42a0-966f-209ef3a15aa9'),
(104, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '6789c7a6-c5fa-46d3-9f74-bcc372cded97'),
(105, 'craft', 'm180904_112109_permission_changes', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '44f921a6-a9f4-48ea-a843-e90e927b403b'),
(106, 'craft', 'm180910_142030_soft_delete_sitegroups', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', 'c671db15-73ec-419a-8885-d089f3bbb729'),
(107, 'craft', 'm181011_160000_soft_delete_asset_support', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', 'cc600d27-9402-4c79-9285-c433050525e5'),
(108, 'craft', 'm181016_183648_set_default_user_settings', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '8bfba1da-0b9e-4b61-a084-d8dcbba3fa48'),
(109, 'craft', 'm181017_225222_system_config_settings', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '3a99e20d-2a1c-4b12-9f48-3a9a850fe8f2'),
(110, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '9bec3b10-eac0-46cb-b172-b2e16ab17420'),
(111, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '0dc7c6c7-cf45-44dd-8135-6f690eadba8a'),
(112, 'craft', 'm181112_203955_sequences_table', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '7687a98a-afbc-4c93-be29-641a7738d017'),
(113, 'craft', 'm181121_001712_cleanup_field_configs', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '238590ee-075d-4bc2-91f6-d8733e394f59'),
(114, 'craft', 'm181128_193942_fix_project_config', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '54493a50-0599-4775-80e0-55e63b7fc502'),
(115, 'craft', 'm181130_143040_fix_schema_version', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '1f804834-d3b2-4732-8856-1fd6a9bbcefb'),
(116, 'craft', 'm181211_143040_fix_entry_type_uids', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '44fcbd77-c199-4ce3-bedd-99bad3db297c'),
(117, 'craft', 'm181217_153000_fix_structure_uids', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', 'e1b2ae3f-8704-46d1-a92a-6eaa01c773ca'),
(118, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2020-12-02 10:43:13', '2020-12-02 10:43:13', '2020-12-02 10:43:13', 'fbaaf761-0742-400d-9617-8cf4dd26192a'),
(119, 'craft', 'm190108_110000_cleanup_project_config', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '4c34ae84-71a6-493a-ad55-1b91a1c47f88'),
(120, 'craft', 'm190108_113000_asset_field_setting_change', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '150f4f81-859b-41a9-80e0-be81b0c071b8'),
(121, 'craft', 'm190109_172845_fix_colspan', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', 'f7b5c1c1-157d-462f-b144-51ba2151e7c2'),
(122, 'craft', 'm190110_150000_prune_nonexisting_sites', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '3944f158-03ca-48e3-b212-9dcbe022d707'),
(123, 'craft', 'm190110_214819_soft_delete_volumes', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', 'b20abf75-5546-4567-b15b-461e3765a16d'),
(124, 'craft', 'm190112_124737_fix_user_settings', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '1ebd7225-aaa6-4496-903b-26d719492d40'),
(125, 'craft', 'm190112_131225_fix_field_layouts', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', 'baf9e64e-2f19-4eab-bedc-c5b568c5f5e1'),
(126, 'craft', 'm190112_201010_more_soft_deletes', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2160731c-28e4-4479-9c97-b77dd3fcc010'),
(127, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '32fdf7a7-4585-4054-bb9d-579666a6f6de'),
(128, 'craft', 'm190121_120000_rich_text_config_setting', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '54434078-c793-482e-9f1f-96f3803cd006'),
(129, 'craft', 'm190125_191628_fix_email_transport_password', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '64bdf296-c8b8-4ce5-9e74-fa8404d7bf2b'),
(130, 'craft', 'm190128_181422_cleanup_volume_folders', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '962a62f5-dc8f-48a9-965f-bd80dee99829'),
(131, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '5fdfb716-8a05-4b68-b2a3-559bb1a99a28'),
(132, 'craft', 'm190218_143000_element_index_settings_uid', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', 'eaf1aecf-8b58-427e-9268-b16cf8c4c61d'),
(133, 'craft', 'm190312_152740_element_revisions', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', 'd535ffc6-7632-45c2-be0c-0bad03bd9b33'),
(134, 'craft', 'm190327_235137_propagation_method', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '60668311-031d-481b-bc1a-f065fbd26f43'),
(135, 'craft', 'm190401_223843_drop_old_indexes', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '6ac3fd02-1b9b-4e16-bd1f-38bf35d786d7'),
(136, 'craft', 'm190416_014525_drop_unique_global_indexes', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', 'a98a6e7a-7ebf-4393-9cba-158b503c0966'),
(137, 'craft', 'm190417_085010_add_image_editor_permissions', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '0681d034-d496-4660-b7c5-f75dc17cf793'),
(138, 'craft', 'm190502_122019_store_default_user_group_uid', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '13be93fd-c12b-46d5-b043-745d357153fe'),
(139, 'craft', 'm190504_150349_preview_targets', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2065b506-afc0-4087-99f8-0cbb95c848a5'),
(140, 'craft', 'm190516_184711_job_progress_label', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '1529b525-cca9-47b0-8121-b8f8d187b690'),
(141, 'craft', 'm190523_190303_optional_revision_creators', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '23ec2ed3-2819-4a0b-a5c4-df8d9fa14254'),
(142, 'craft', 'm190529_204501_fix_duplicate_uids', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '52afa40b-9505-453c-a607-ce0e5bd5e30a'),
(143, 'craft', 'm190605_223807_unsaved_drafts', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', 'a18c16bd-f15e-4478-b3fa-7c97a31c5865'),
(144, 'craft', 'm190607_230042_entry_revision_error_tables', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '38c7f1fa-5eac-47bd-8f06-62e59459b181'),
(145, 'craft', 'm190608_033429_drop_elements_uid_idx', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '2020-12-02 10:43:14', '10a8b831-5d62-4a66-92c2-0350c81ac7ad'),
(146, 'craft', 'm190617_164400_add_gqlschemas_table', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '56953a89-a896-4668-90b5-0761a07acd23'),
(147, 'craft', 'm190624_234204_matrix_propagation_method', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', 'b3c9e23a-fa6f-4e73-a5f8-dd89a0960ab9'),
(148, 'craft', 'm190711_153020_drop_snapshots', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '315b315f-a73f-4f61-840f-bf9e2a682c10'),
(149, 'craft', 'm190712_195914_no_draft_revisions', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '1c152822-ab4e-45ba-ade3-b4991981f760'),
(150, 'craft', 'm190723_140314_fix_preview_targets_column', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', 'a2d8508c-aa6f-40b2-aec7-ea789ca151f6'),
(151, 'craft', 'm190820_003519_flush_compiled_templates', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', 'e5649692-5f00-4bbf-bd95-eb62f68ad408'),
(152, 'craft', 'm190823_020339_optional_draft_creators', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', 'bd7f2948-13b9-41e3-829e-da0d3524bf0f'),
(153, 'craft', 'm190913_152146_update_preview_targets', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '001be03f-265f-4133-a96f-1580f2a0c9a2'),
(154, 'craft', 'm191107_122000_add_gql_project_config_support', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '1add01f1-ed30-457f-9056-a878c8aea6f5'),
(155, 'craft', 'm191204_085100_pack_savable_component_settings', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', 'e328f5e2-8e56-4645-8afa-8a16526d2018'),
(156, 'craft', 'm191206_001148_change_tracking', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '558c2865-8fee-4b9e-9822-d45abac34916'),
(157, 'craft', 'm191216_191635_asset_upload_tracking', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', 'a1940f30-2605-4c49-9867-dba466642be8'),
(158, 'craft', 'm191222_002848_peer_asset_permissions', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', 'da89d12c-39dd-4fbd-99d1-a44fcf1b8ab2'),
(159, 'craft', 'm200127_172522_queue_channels', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '0173a782-778d-4245-8771-caa419b9e4ce'),
(160, 'craft', 'm200211_175048_truncate_element_query_cache', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '09c5ecd7-1d7f-4b75-a6ee-6f1074042124'),
(161, 'craft', 'm200213_172522_new_elements_index', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', 'a1d079c8-e5db-49b7-a5c0-44c12b1823b9'),
(162, 'craft', 'm200228_195211_long_deprecation_messages', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '71413efd-ea13-4f24-bf14-bc6e931629d2'),
(163, 'craft', 'm200306_054652_disabled_sites', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '80d2ea3c-da20-4918-a284-168818af01b2'),
(164, 'craft', 'm200522_191453_clear_template_caches', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', 'bad5f228-fd8e-43ba-a26f-b420f8266e96'),
(165, 'craft', 'm200606_231117_migration_tracks', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '2020-12-02 10:43:15', '9828e441-a500-4f26-81e7-c3bae11d86c1'),
(166, 'craft', 'm200619_215137_title_translation_method', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '2020-12-02 10:43:16', 'f03a6885-76b9-4229-8b1f-6697961e6df9'),
(167, 'craft', 'm200620_005028_user_group_descriptions', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '7b0645ef-cc8d-4216-bce8-f9bd887339a0'),
(168, 'craft', 'm200620_230205_field_layout_changes', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '313ecb90-7e95-46f2-9e2e-306cef85597b'),
(169, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '3f5c4e95-2302-48a6-baec-2f93d17e71ea'),
(170, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '85a5d160-215b-4f08-b055-9f28a1746c3d'),
(171, 'craft', 'm200630_183000_drop_configmap', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '0b69c661-95cc-4b64-871d-2d8faf864204'),
(172, 'craft', 'm200715_113400_transform_index_error_flag', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '2020-12-02 10:43:16', 'd0e2ae25-4166-43ae-82d5-8db9a84b5363'),
(173, 'craft', 'm200716_110900_replace_file_asset_permissions', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '036b01ae-1847-4ef5-8b6f-0476c724453c'),
(174, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '98eebf03-dd7c-47b8-bda6-4e03b597637c'),
(175, 'craft', 'm200720_175543_drop_unique_constraints', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '2020-12-02 10:43:16', 'f61ce29c-74cc-4ba4-8025-dc5da282f5af'),
(176, 'craft', 'm200825_051217_project_config_version', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '13c1c518-03c3-4ba1-ba82-78fe31444c36'),
(177, 'plugin:redactor', 'm180430_204710_remove_old_plugins', '2020-12-08 16:23:46', '2020-12-08 16:23:46', '2020-12-08 16:23:46', '79019327-ed79-44e3-9cce-39e660995377'),
(178, 'plugin:redactor', 'Install', '2020-12-08 16:23:46', '2020-12-08 16:23:46', '2020-12-08 16:23:46', '78f1c3a4-6d30-40d9-96b3-987262897fb1'),
(179, 'plugin:redactor', 'm190225_003922_split_cleanup_html_settings', '2020-12-08 16:23:46', '2020-12-08 16:23:46', '2020-12-08 16:23:46', 'b7f1d7ef-4533-491e-83b7-96501daaccd4');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'redactor', '2.8.5', '2.3.0', 'unknown', NULL, '2020-12-08 16:23:46', '2020-12-08 16:23:46', '2020-12-08 18:42:43', 'e01a88ea-1452-4d73-8456-f8a6aa918fcd');

-- --------------------------------------------------------

--
-- Table structure for table `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1607452894'),
('email.fromEmail', '\"qevinodhiambo@gmail.com\"'),
('email.fromName', '\"Mei\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.class', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.disabled', 'false'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.id', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.instructions', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.label', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.max', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.min', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.name', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.orientation', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.readonly', 'false'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.requirable', 'false'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.size', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.step', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.tip', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.title', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.warning', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.elements.0.width', '100'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.name', '\"Content\"'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.fieldLayouts.919bf5a6-1dcf-47eb-bcc8-246b4da07d08.tabs.0.sortOrder', '1'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.handle', '\"gallery\"'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.hasTitleField', 'false'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.name', '\"Gallery\"'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.section', '\"f39f3846-6552-4346-a3c2-bd797d2d9890\"'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.sortOrder', '1'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.titleTranslationKeyFormat', 'null'),
('entryTypes.26a64db7-b03d-4e57-bcfb-19d075610625.titleTranslationMethod', '\"site\"'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.class', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.disabled', 'false'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.id', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.instructions', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.label', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.max', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.min', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.name', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.orientation', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.readonly', 'false'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.requirable', 'false'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.size', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.step', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.tip', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.title', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.warning', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.elements.0.width', '100'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.name', '\"Content\"'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.fieldLayouts.85eda2dc-e12f-4973-9cc4-dea2ae7fa120.tabs.0.sortOrder', '1'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.handle', '\"contact\"'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.hasTitleField', 'false'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.name', '\"Contact\"'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.section', '\"721d595b-1310-457f-856e-9e1c16b0f412\"'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.sortOrder', '1'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.titleTranslationKeyFormat', 'null'),
('entryTypes.5af62b8d-ef56-4202-9388-1635a2acf935.titleTranslationMethod', '\"site\"'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.class', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.disabled', 'false'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.id', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.instructions', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.label', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.max', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.min', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.name', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.orientation', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.readonly', 'false'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.requirable', 'false'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.size', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.step', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.tip', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.title', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.warning', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.width', '100'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.1.fieldUid', '\"c7321563-1442-4106-8ac4-8fb704f32b30\"'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.1.instructions', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.1.label', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.1.required', 'false'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.1.tip', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.1.warning', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.1.width', '100'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.name', '\"Content\"'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.sortOrder', '1'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.handle', '\"pages\"'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.hasTitleField', 'true'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.name', '\"Pages\"'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.section', '\"a33a073b-15ff-49f7-9d47-1e80709c0e74\"'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.sortOrder', '1'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.titleFormat', '\"title\"'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.titleTranslationKeyFormat', 'null'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.titleTranslationMethod', '\"site\"'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.class', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.disabled', 'false'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.id', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.instructions', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.label', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.max', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.min', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.name', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.orientation', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.readonly', 'false'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.requirable', 'false'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.size', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.step', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.tip', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.title', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.warning', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.elements.0.width', '100'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.name', '\"Content\"'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.fieldLayouts.f09c9fce-8670-428c-9ad8-867dd6fe5cb7.tabs.0.sortOrder', '1'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.handle', '\"home\"'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.hasTitleField', 'false'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.name', '\"Home\"'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.section', '\"1caa3108-aabf-4588-b715-08f17ff0584f\"'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.sortOrder', '1'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.titleTranslationKeyFormat', 'null'),
('entryTypes.ea72ba98-4cc1-485f-a8d7-079f860f5188.titleTranslationMethod', '\"site\"'),
('fieldGroups.89a801dc-4207-40dc-9685-25404b21694d.name', '\"Dropdowns\"'),
('fieldGroups.cfeacf29-a9a2-4dd0-8566-09319a280117.name', '\"Common\"'),
('fields.0348ab67-1309-4352-b4c7-50d888e4193f.contentColumnType', '\"string\"'),
('fields.0348ab67-1309-4352-b4c7-50d888e4193f.fieldGroup', '\"89a801dc-4207-40dc-9685-25404b21694d\"'),
('fields.0348ab67-1309-4352-b4c7-50d888e4193f.handle', '\"portal\"'),
('fields.0348ab67-1309-4352-b4c7-50d888e4193f.instructions', '\"\"'),
('fields.0348ab67-1309-4352-b4c7-50d888e4193f.name', '\"Portal\"'),
('fields.0348ab67-1309-4352-b4c7-50d888e4193f.searchable', 'false'),
('fields.0348ab67-1309-4352-b4c7-50d888e4193f.settings.contentTable', '\"{{%matrixcontent_portal}}\"'),
('fields.0348ab67-1309-4352-b4c7-50d888e4193f.settings.maxBlocks', '\"\"'),
('fields.0348ab67-1309-4352-b4c7-50d888e4193f.settings.minBlocks', '\"\"'),
('fields.0348ab67-1309-4352-b4c7-50d888e4193f.settings.propagationMethod', '\"all\"'),
('fields.0348ab67-1309-4352-b4c7-50d888e4193f.translationKeyFormat', 'null'),
('fields.0348ab67-1309-4352-b4c7-50d888e4193f.translationMethod', '\"site\"'),
('fields.0348ab67-1309-4352-b4c7-50d888e4193f.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.734e77de-9fcf-443c-8e0d-0a2512ab8676.contentColumnType', '\"string\"'),
('fields.734e77de-9fcf-443c-8e0d-0a2512ab8676.fieldGroup', '\"89a801dc-4207-40dc-9685-25404b21694d\"'),
('fields.734e77de-9fcf-443c-8e0d-0a2512ab8676.handle', '\"academics\"'),
('fields.734e77de-9fcf-443c-8e0d-0a2512ab8676.instructions', '\"\"'),
('fields.734e77de-9fcf-443c-8e0d-0a2512ab8676.name', '\"Academics\"'),
('fields.734e77de-9fcf-443c-8e0d-0a2512ab8676.searchable', 'false'),
('fields.734e77de-9fcf-443c-8e0d-0a2512ab8676.settings.contentTable', '\"{{%matrixcontent_academics}}\"'),
('fields.734e77de-9fcf-443c-8e0d-0a2512ab8676.settings.maxBlocks', '\"\"'),
('fields.734e77de-9fcf-443c-8e0d-0a2512ab8676.settings.minBlocks', '\"\"'),
('fields.734e77de-9fcf-443c-8e0d-0a2512ab8676.settings.propagationMethod', '\"all\"'),
('fields.734e77de-9fcf-443c-8e0d-0a2512ab8676.translationKeyFormat', 'null'),
('fields.734e77de-9fcf-443c-8e0d-0a2512ab8676.translationMethod', '\"site\"'),
('fields.734e77de-9fcf-443c-8e0d-0a2512ab8676.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.80672d7d-1690-47a4-904e-14e353770526.contentColumnType', '\"string\"'),
('fields.80672d7d-1690-47a4-904e-14e353770526.fieldGroup', '\"89a801dc-4207-40dc-9685-25404b21694d\"'),
('fields.80672d7d-1690-47a4-904e-14e353770526.handle', '\"admissions\"'),
('fields.80672d7d-1690-47a4-904e-14e353770526.instructions', '\"\"'),
('fields.80672d7d-1690-47a4-904e-14e353770526.name', '\"Admissions\"'),
('fields.80672d7d-1690-47a4-904e-14e353770526.searchable', 'false'),
('fields.80672d7d-1690-47a4-904e-14e353770526.settings.contentTable', '\"{{%matrixcontent_admissions}}\"'),
('fields.80672d7d-1690-47a4-904e-14e353770526.settings.maxBlocks', '\"\"'),
('fields.80672d7d-1690-47a4-904e-14e353770526.settings.minBlocks', '\"\"'),
('fields.80672d7d-1690-47a4-904e-14e353770526.settings.propagationMethod', '\"all\"'),
('fields.80672d7d-1690-47a4-904e-14e353770526.translationKeyFormat', 'null'),
('fields.80672d7d-1690-47a4-904e-14e353770526.translationMethod', '\"site\"'),
('fields.80672d7d-1690-47a4-904e-14e353770526.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.971de349-e94d-4322-8b0d-00ad46dc89dc.contentColumnType', '\"string\"'),
('fields.971de349-e94d-4322-8b0d-00ad46dc89dc.fieldGroup', '\"cfeacf29-a9a2-4dd0-8566-09319a280117\"'),
('fields.971de349-e94d-4322-8b0d-00ad46dc89dc.handle', '\"navigation\"'),
('fields.971de349-e94d-4322-8b0d-00ad46dc89dc.instructions', '\"\"'),
('fields.971de349-e94d-4322-8b0d-00ad46dc89dc.name', '\"Navigation\"'),
('fields.971de349-e94d-4322-8b0d-00ad46dc89dc.searchable', 'false'),
('fields.971de349-e94d-4322-8b0d-00ad46dc89dc.settings.contentTable', '\"{{%matrixcontent_navigation}}\"'),
('fields.971de349-e94d-4322-8b0d-00ad46dc89dc.settings.maxBlocks', '\"\"'),
('fields.971de349-e94d-4322-8b0d-00ad46dc89dc.settings.minBlocks', '\"\"'),
('fields.971de349-e94d-4322-8b0d-00ad46dc89dc.settings.propagationMethod', '\"all\"'),
('fields.971de349-e94d-4322-8b0d-00ad46dc89dc.translationKeyFormat', 'null'),
('fields.971de349-e94d-4322-8b0d-00ad46dc89dc.translationMethod', '\"site\"'),
('fields.971de349-e94d-4322-8b0d-00ad46dc89dc.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.contentColumnType', '\"text\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.fieldGroup', '\"cfeacf29-a9a2-4dd0-8566-09319a280117\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.handle', '\"pageHeading\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.instructions', '\"\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.name', '\"Page Heading\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.searchable', 'false'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.availableTransforms', '\"*\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.availableVolumes', '\"*\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.cleanupHtml', 'true'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.columnType', '\"text\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.configSelectionMode', '\"choose\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.defaultTransform', '\"\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.manualConfig', '\"\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.purifierConfig', '\"\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.purifyHtml', '\"1\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.redactorConfig', '\"\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.removeEmptyTags', '\"1\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.removeInlineStyles', '\"1\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.removeNbsp', '\"1\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.showHtmlButtonForNonAdmins', '\"\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.showUnpermittedFiles', 'false'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.showUnpermittedVolumes', 'false'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.settings.uiMode', '\"enlarged\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.translationKeyFormat', 'null'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.translationMethod', '\"none\"'),
('fields.c7321563-1442-4106-8ac4-8fb704f32b30.type', '\"craft\\\\redactor\\\\Field\"'),
('fields.c9f4341b-ab6b-4ec6-a90a-d530baa43734.contentColumnType', '\"string\"'),
('fields.c9f4341b-ab6b-4ec6-a90a-d530baa43734.fieldGroup', '\"89a801dc-4207-40dc-9685-25404b21694d\"'),
('fields.c9f4341b-ab6b-4ec6-a90a-d530baa43734.handle', '\"about\"'),
('fields.c9f4341b-ab6b-4ec6-a90a-d530baa43734.instructions', '\"\"'),
('fields.c9f4341b-ab6b-4ec6-a90a-d530baa43734.name', '\"About\"'),
('fields.c9f4341b-ab6b-4ec6-a90a-d530baa43734.searchable', 'false'),
('fields.c9f4341b-ab6b-4ec6-a90a-d530baa43734.settings.contentTable', '\"{{%matrixcontent_about}}\"'),
('fields.c9f4341b-ab6b-4ec6-a90a-d530baa43734.settings.maxBlocks', '\"\"'),
('fields.c9f4341b-ab6b-4ec6-a90a-d530baa43734.settings.minBlocks', '\"\"'),
('fields.c9f4341b-ab6b-4ec6-a90a-d530baa43734.settings.propagationMethod', '\"all\"'),
('fields.c9f4341b-ab6b-4ec6-a90a-d530baa43734.translationKeyFormat', 'null'),
('fields.c9f4341b-ab6b-4ec6-a90a-d530baa43734.translationMethod', '\"site\"'),
('fields.c9f4341b-ab6b-4ec6-a90a-d530baa43734.type', '\"craft\\\\fields\\\\Matrix\"'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.0.fieldUid', '\"971de349-e94d-4322-8b0d-00ad46dc89dc\"'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.0.instructions', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.0.label', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.0.required', 'false'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.0.tip', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.0.warning', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.0.width', '100'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.1.fieldUid', '\"c9f4341b-ab6b-4ec6-a90a-d530baa43734\"'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.1.instructions', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.1.label', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.1.required', 'false'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.1.tip', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.1.warning', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.1.width', '100'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.2.fieldUid', '\"734e77de-9fcf-443c-8e0d-0a2512ab8676\"'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.2.instructions', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.2.label', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.2.required', 'false'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.2.tip', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.2.warning', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.2.width', '100'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.3.fieldUid', '\"80672d7d-1690-47a4-904e-14e353770526\"'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.3.instructions', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.3.label', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.3.required', 'false'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.3.tip', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.3.warning', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.3.width', '100'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.4.fieldUid', '\"0348ab67-1309-4352-b4c7-50d888e4193f\"'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.4.instructions', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.4.label', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.4.required', 'false'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.4.tip', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.4.warning', 'null'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.elements.4.width', '100'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.name', '\"Content\"'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.fieldLayouts.9693dd27-4435-4e32-97b5-94f24073ba7f.tabs.0.sortOrder', '1'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.handle', '\"header\"'),
('globalSets.6da785e4-bd50-43e4-ab27-4ff5f9293e9e.name', '\"Header\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.field', '\"c9f4341b-ab6b-4ec6-a90a-d530baa43734\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.0.fieldUid', '\"9c6ac610-ed30-42a2-b993-62ca6086aab0\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.0.required', 'true'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.1.fieldUid', '\"7d20c2fd-4b78-4e3f-a7ab-f50550446508\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.1.required', 'true'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fieldLayouts.61e7d1ba-cf48-4d72-8297-3d2170b75080.tabs.0.sortOrder', '1'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.contentColumnType', '\"string\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.fieldGroup', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.handle', '\"linkDestination\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.instructions', '\"\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.name', '\"Link Destination\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.searchable', 'false'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.settings.limit', '\"1\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.settings.localizeRelations', 'false'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.settings.showSiteMenu', 'true'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.settings.source', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.settings.sources', '\"*\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.settings.targetSiteId', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.settings.viewMode', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.translationKeyFormat', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.translationMethod', '\"site\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.7d20c2fd-4b78-4e3f-a7ab-f50550446508.type', '\"craft\\\\fields\\\\Entries\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.contentColumnType', '\"text\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.fieldGroup', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.handle', '\"linkText\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.instructions', '\"\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.name', '\"Link Text\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.searchable', 'false'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.settings.byteLimit', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.settings.charLimit', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.settings.code', '\"\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.settings.columnType', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.settings.initialRows', '\"4\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.settings.multiline', '\"\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.settings.placeholder', '\"\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.translationKeyFormat', 'null'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.translationMethod', '\"none\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.fields.9c6ac610-ed30-42a2-b993-62ca6086aab0.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.handle', '\"navLink\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.name', '\"Nav Link\"'),
('matrixBlockTypes.03f57808-35f2-4d69-88c1-29a81988f974.sortOrder', '1'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.field', '\"734e77de-9fcf-443c-8e0d-0a2512ab8676\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.0.fieldUid', '\"2d8244ee-b607-4607-9b49-6200c414c7f1\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.0.required', 'true'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.1.fieldUid', '\"0fab4496-80b3-4ab7-b2ee-414de4b12e5d\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.1.required', 'true'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fieldLayouts.931853e6-2b82-4542-9593-f899e4a17b8a.tabs.0.sortOrder', '1'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.contentColumnType', '\"string\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.fieldGroup', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.handle', '\"linkDestination\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.instructions', '\"\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.name', '\"Link Destination\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.searchable', 'false'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.settings.limit', '\"1\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.settings.localizeRelations', 'false'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.settings.showSiteMenu', 'true'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.settings.source', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.settings.sources', '\"*\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.settings.targetSiteId', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.settings.viewMode', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.translationKeyFormat', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.translationMethod', '\"site\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.0fab4496-80b3-4ab7-b2ee-414de4b12e5d.type', '\"craft\\\\fields\\\\Entries\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.contentColumnType', '\"text\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.fieldGroup', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.handle', '\"linkText\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.instructions', '\"\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.name', '\"Link Text\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.searchable', 'false'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.settings.byteLimit', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.settings.charLimit', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.settings.code', '\"\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.settings.columnType', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.settings.initialRows', '\"4\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.settings.multiline', '\"\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.settings.placeholder', '\"\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.translationKeyFormat', 'null'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.translationMethod', '\"none\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.fields.2d8244ee-b607-4607-9b49-6200c414c7f1.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.handle', '\"navLink\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.name', '\"Nav Link\"'),
('matrixBlockTypes.106a6fcb-82be-4c8e-be6d-e9a983e4cf8e.sortOrder', '1'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.field', '\"971de349-e94d-4322-8b0d-00ad46dc89dc\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.0.fieldUid', '\"46dbcdd3-a122-40e4-86c3-f5e780561716\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.0.required', 'true'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.1.fieldUid', '\"cce6938a-8167-4c99-ac15-e86f2abc2b1f\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.1.required', 'true'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fieldLayouts.513dba55-c96d-407d-8afa-26dbc57ca2ca.tabs.0.sortOrder', '1'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.contentColumnType', '\"text\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.fieldGroup', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.handle', '\"linkText\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.instructions', '\"\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.name', '\"Link Text\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.searchable', 'false'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.settings.byteLimit', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.settings.charLimit', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.settings.code', '\"\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.settings.columnType', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.settings.initialRows', '\"4\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.settings.multiline', '\"\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.settings.placeholder', '\"\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.translationKeyFormat', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.translationMethod', '\"none\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.46dbcdd3-a122-40e4-86c3-f5e780561716.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.contentColumnType', '\"string\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.fieldGroup', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.handle', '\"linkDestination\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.instructions', '\"\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.name', '\"Link Destination\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.searchable', 'false'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.settings.limit', '\"\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.settings.localizeRelations', 'false'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.settings.showSiteMenu', 'false'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.settings.source', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.settings.sources', '\"*\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.settings.targetSiteId', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.settings.viewMode', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.translationKeyFormat', 'null'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.translationMethod', '\"site\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.fields.cce6938a-8167-4c99-ac15-e86f2abc2b1f.type', '\"craft\\\\fields\\\\Entries\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.handle', '\"navLink\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.name', '\"Nav Link\"'),
('matrixBlockTypes.135253d8-9314-43b5-ba87-badaf563f0c6.sortOrder', '1'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.field', '\"80672d7d-1690-47a4-904e-14e353770526\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.0.fieldUid', '\"6dd039e4-fb62-4d70-ada3-4f6fce6921d8\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.0.required', 'true'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.1.fieldUid', '\"4664af46-0a8c-47d6-ac5f-f116da7c7104\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fieldLayouts.cdb435cb-31d0-4ec3-a596-acb75043007c.tabs.0.sortOrder', '1'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.contentColumnType', '\"string\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.fieldGroup', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.handle', '\"linkDestination\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.instructions', '\"\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.name', '\"Link Destination\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.searchable', 'false'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.settings.limit', '\"1\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.settings.localizeRelations', 'false'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.settings.showSiteMenu', 'true'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.settings.source', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.settings.sources', '\"*\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.settings.targetSiteId', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.settings.viewMode', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.translationKeyFormat', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.translationMethod', '\"site\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.4664af46-0a8c-47d6-ac5f-f116da7c7104.type', '\"craft\\\\fields\\\\Entries\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.contentColumnType', '\"text\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.fieldGroup', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.handle', '\"linkText\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.instructions', '\"\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.name', '\"Link Text\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.searchable', 'false'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.settings.byteLimit', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.settings.charLimit', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.settings.code', '\"\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.settings.columnType', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.settings.initialRows', '\"4\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.settings.multiline', '\"\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.settings.placeholder', '\"\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.translationKeyFormat', 'null'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.translationMethod', '\"none\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.fields.6dd039e4-fb62-4d70-ada3-4f6fce6921d8.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.handle', '\"navLink\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.name', '\"Nav Link\"'),
('matrixBlockTypes.cc6d6a90-0dc1-455d-b29d-bf6afefdfe62.sortOrder', '1'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.field', '\"0348ab67-1309-4352-b4c7-50d888e4193f\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.0.fieldUid', '\"ea2653e0-0488-467b-9089-ae51d28f1f33\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.0.required', 'true'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.1.fieldUid', '\"559a17c2-fd93-49ac-b202-3e136746596e\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.1.required', 'true'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fieldLayouts.3244b2f3-7266-4b65-be84-f5d3d93b7735.tabs.0.sortOrder', '1'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.contentColumnType', '\"string\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.fieldGroup', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.handle', '\"linkDestination\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.instructions', '\"\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.name', '\"Link Destination\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.searchable', 'false'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.settings.limit', '\"1\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.settings.localizeRelations', 'false'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.settings.showSiteMenu', 'true'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.settings.source', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.settings.sources', '\"*\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.settings.targetSiteId', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.settings.viewMode', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.translationKeyFormat', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.translationMethod', '\"site\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.559a17c2-fd93-49ac-b202-3e136746596e.type', '\"craft\\\\fields\\\\Entries\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.contentColumnType', '\"text\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.fieldGroup', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.handle', '\"linkText\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.instructions', '\"\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.name', '\"Link text\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.searchable', 'false'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.settings.byteLimit', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.settings.charLimit', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.settings.code', '\"\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.settings.columnType', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.settings.initialRows', '\"4\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.settings.multiline', '\"\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.settings.placeholder', '\"\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.translationKeyFormat', 'null'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.translationMethod', '\"none\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.fields.ea2653e0-0488-467b-9089-ae51d28f1f33.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.handle', '\"navLink\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.name', '\"Nav Link\"'),
('matrixBlockTypes.f12e0a88-d66e-4de4-b5a0-11db4ca1c5a9.sortOrder', '1'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.enableVersioning', 'true'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.handle', '\"home\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.name', '\"Home\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.propagationMethod', '\"all\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"home\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"__home__\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.type', '\"single\"'),
('sections.721d595b-1310-457f-856e-9e1c16b0f412.enableVersioning', 'true'),
('sections.721d595b-1310-457f-856e-9e1c16b0f412.handle', '\"contact\"'),
('sections.721d595b-1310-457f-856e-9e1c16b0f412.name', '\"Contact\"'),
('sections.721d595b-1310-457f-856e-9e1c16b0f412.propagationMethod', '\"all\"'),
('sections.721d595b-1310-457f-856e-9e1c16b0f412.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.721d595b-1310-457f-856e-9e1c16b0f412.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.721d595b-1310-457f-856e-9e1c16b0f412.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"contact\"'),
('sections.721d595b-1310-457f-856e-9e1c16b0f412.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"contact\"'),
('sections.721d595b-1310-457f-856e-9e1c16b0f412.type', '\"single\"'),
('sections.a33a073b-15ff-49f7-9d47-1e80709c0e74.enableVersioning', 'true'),
('sections.a33a073b-15ff-49f7-9d47-1e80709c0e74.handle', '\"pages\"'),
('sections.a33a073b-15ff-49f7-9d47-1e80709c0e74.name', '\"Pages\"'),
('sections.a33a073b-15ff-49f7-9d47-1e80709c0e74.propagationMethod', '\"all\"'),
('sections.a33a073b-15ff-49f7-9d47-1e80709c0e74.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.a33a073b-15ff-49f7-9d47-1e80709c0e74.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.a33a073b-15ff-49f7-9d47-1e80709c0e74.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"pages\\\\_entry\"'),
('sections.a33a073b-15ff-49f7-9d47-1e80709c0e74.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"{parent.uri}/{slug}\"'),
('sections.a33a073b-15ff-49f7-9d47-1e80709c0e74.structure.maxLevels', 'null'),
('sections.a33a073b-15ff-49f7-9d47-1e80709c0e74.structure.uid', '\"53181348-b700-4aec-8cd7-acec6aed6385\"'),
('sections.a33a073b-15ff-49f7-9d47-1e80709c0e74.type', '\"structure\"'),
('sections.f39f3846-6552-4346-a3c2-bd797d2d9890.enableVersioning', 'true'),
('sections.f39f3846-6552-4346-a3c2-bd797d2d9890.handle', '\"gallery\"'),
('sections.f39f3846-6552-4346-a3c2-bd797d2d9890.name', '\"Gallery\"'),
('sections.f39f3846-6552-4346-a3c2-bd797d2d9890.propagationMethod', '\"all\"'),
('sections.f39f3846-6552-4346-a3c2-bd797d2d9890.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.f39f3846-6552-4346-a3c2-bd797d2d9890.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.f39f3846-6552-4346-a3c2-bd797d2d9890.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"gallery\"'),
('sections.f39f3846-6552-4346-a3c2-bd797d2d9890.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"gallery\"'),
('sections.f39f3846-6552-4346-a3c2-bd797d2d9890.type', '\"single\"'),
('siteGroups.258eafb0-787f-4cd4-bdea-e9bd1e62d909.name', '\"Mei\"'),
('sites.347fb537-1b10-43af-aa22-3b9c7df0448f.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.347fb537-1b10-43af-aa22-3b9c7df0448f.handle', '\"default\"'),
('sites.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sites.347fb537-1b10-43af-aa22-3b9c7df0448f.language', '\"en\"'),
('sites.347fb537-1b10-43af-aa22-3b9c7df0448f.name', '\"Mei\"'),
('sites.347fb537-1b10-43af-aa22-3b9c7df0448f.primary', 'true'),
('sites.347fb537-1b10-43af-aa22-3b9c7df0448f.siteGroup', '\"258eafb0-787f-4cd4-bdea-e9bd1e62d909\"'),
('sites.347fb537-1b10-43af-aa22-3b9c7df0448f.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"Mei\"'),
('system.schemaVersion', '\"3.5.13\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 4, 90, NULL, 2, 1, '2020-12-08 17:48:37', '2020-12-08 17:48:37', 'b288b93f-b5bf-41b7-96aa-25b62691da81'),
(2, 4, 91, NULL, 18, 1, '2020-12-08 17:48:38', '2020-12-08 17:48:38', '72cc6056-5dbe-4747-a4d0-1f82f8c4d99d'),
(3, 4, 92, NULL, 16, 1, '2020-12-08 17:49:16', '2020-12-08 17:49:16', '68f21020-15f4-4a17-9574-31c38a916d1b'),
(4, 6, 93, NULL, 24, 1, '2020-12-08 18:06:36', '2020-12-08 18:06:36', '0bc67e66-3e2f-4e72-b9d6-1e940e150474'),
(5, 6, 94, NULL, 27, 1, '2020-12-08 18:06:36', '2020-12-08 18:06:36', '78181f61-f470-409f-91be-8b60116379de'),
(6, 6, 95, NULL, 30, 1, '2020-12-08 18:12:38', '2020-12-08 18:12:38', 'f39f86f6-3e8e-4a78-8d9e-4995149f0205'),
(7, 6, 96, NULL, 33, 1, '2020-12-08 18:12:38', '2020-12-08 18:12:38', 'c3decb7f-04f3-4872-8f25-cf8b31c08735'),
(8, 9, 97, NULL, 39, 1, '2020-12-08 18:20:43', '2020-12-08 18:20:43', '3da7cd5e-54a0-42ec-abbd-71f899b0fed0'),
(9, 9, 98, NULL, 42, 1, '2020-12-08 18:20:43', '2020-12-08 18:20:43', '50e4b42b-dbc7-40c0-814a-dedb37fb028e'),
(10, 9, 99, NULL, 45, 1, '2020-12-08 18:20:44', '2020-12-08 18:20:44', '4996228b-c950-4d7e-9cad-fd0a4856bbae'),
(11, 12, 100, NULL, 51, 1, '2020-12-08 18:27:30', '2020-12-08 18:27:30', '41ffcc6a-9bf1-4bde-9779-25182ca192b3'),
(12, 12, 101, NULL, 54, 1, '2020-12-08 18:27:30', '2020-12-08 18:27:30', '13ad562b-8785-4def-ad42-39dc179377c5'),
(13, 12, 102, NULL, 58, 1, '2020-12-08 18:27:30', '2020-12-08 18:27:30', '6fdee324-e21c-46d0-9b95-2c3ae911c837'),
(14, 15, 112, NULL, 107, 1, '2020-12-08 18:50:37', '2020-12-08 18:50:37', '967281b3-9dd2-46d2-9f14-6bb41daa5bf9'),
(15, 15, 113, NULL, 110, 1, '2020-12-08 18:50:37', '2020-12-08 18:50:37', '13f54f71-ce00-44a1-af56-459c6f88e0aa');

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('17f9fd64', '@lib/jquery.payment'),
('18c75c97', '@craft/web/assets/recententries/dist'),
('1a51a5f1', '@bower/jquery/dist'),
('1a52cf7d', '@craft/web/assets/installer/dist'),
('1c0cb3c2', '@craft/web/assets/editentry/dist'),
('1e55a4d6', '@craft/web/assets/pluginstore/dist'),
('1fc6a5e8', '@lib/d3'),
('24c5335d', '@lib/iframe-resizer-cw'),
('2cda3f45', '@lib/element-resize-detector'),
('303e52a7', '@craft/redactor/assets/field/dist'),
('33528306', '@craft/web/assets/admintable/dist'),
('3caa71c2', '@craft/web/assets/dashboard/dist'),
('45077818', '@craft/web/assets/matrix/dist'),
('4577c929', '@lib/jquery-ui'),
('45e95709', '@craft/web/assets/feed/dist'),
('59ad685b', '@craft/web/assets/cp/dist'),
('5e458c0f', '@craft/web/assets/updater/dist'),
('5e94f0e4', '@craft/web/assets/editsection/dist'),
('624b2a15', '@lib/vue'),
('693c883e', '@craft/web/assets/updateswidget/dist'),
('7afc6a4d', '@craft/web/assets/craftsupport/dist'),
('8b63574', '@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
('915fa5b4', '@lib/jquery-touch-events'),
('96fb9976', '@lib/picturefill'),
('9708a9c9', '@lib/fileupload'),
('9bab96de', '@lib/iframe-resizer'),
('a2fa0cfe', '@craft/web/assets/login/dist'),
('a532793e', '@craft/redactor/assets/redactor/dist'),
('a7676a9d', '@craft/redactor/assets/redactor-plugins/dist/video'),
('a7be4bde', '@lib/fabric'),
('b2f89fe0', '@lib/garnishjs'),
('bde4671c', '@craft/web/assets/fields/dist'),
('bde528c', '@lib/velocity'),
('c285b4f2', '@lib/selectize'),
('c8e9f078', '@lib/xregexp'),
('d013bf1d', '@craft/web/assets/fieldsettings/dist'),
('e315c66c', '@lib/axios'),
('f36043d0', '@craft/web/assets/matrixsettings/dist'),
('f716a80d', '@lib/timepicker');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, NULL),
(2, 2, 1, 2, NULL),
(3, 2, 1, 3, NULL),
(4, 2, 1, 4, NULL),
(5, 2, 1, 5, NULL),
(6, 2, 1, 6, NULL),
(7, 9, 1, 1, NULL),
(8, 9, 1, 2, NULL),
(9, 12, 1, 1, NULL),
(10, 9, 1, 3, NULL),
(11, 9, 1, 4, NULL),
(12, 16, 1, 1, NULL),
(13, 18, 1, 1, NULL),
(14, 21, 1, 1, NULL),
(15, 24, 1, 1, NULL),
(16, 27, 1, 1, NULL),
(17, 30, 1, 1, NULL),
(18, 33, 1, 1, NULL),
(19, 36, 1, 1, NULL),
(20, 39, 1, 1, NULL),
(21, 42, 1, 1, NULL),
(22, 45, 1, 1, NULL),
(23, 48, 1, 1, NULL),
(24, 51, 1, 1, NULL),
(25, 54, 1, 1, NULL),
(26, 54, 1, 2, ''),
(27, 58, 1, 1, NULL),
(28, 61, 1, 1, NULL),
(29, 64, 1, 1, NULL),
(30, 67, 1, 1, NULL),
(31, 24, 1, 2, ''),
(32, 24, 1, 3, ''),
(33, 27, 1, 2, ''),
(34, 24, 1, 4, ''),
(35, 27, 1, 3, ''),
(36, 27, 1, 4, ''),
(37, 27, 1, 5, ''),
(38, 30, 1, 2, ''),
(39, 33, 1, 2, ''),
(40, 39, 1, 2, ''),
(41, 42, 1, 2, ''),
(42, 45, 1, 2, ''),
(43, 45, 1, 3, ''),
(44, 51, 1, 2, ''),
(45, 54, 1, 3, ''),
(46, 58, 1, 2, ''),
(47, 58, 1, 3, ''),
(48, 64, 1, 2, ''),
(49, 67, 1, 2, ''),
(50, 67, 1, 3, ''),
(51, 67, 1, 4, ''),
(52, 64, 1, 3, ''),
(53, 107, 1, 1, NULL),
(54, 110, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' kevin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' qevinodhiambo gmail com '),
(1, 'slug', 0, 1, ''),
(2, 'slug', 0, 1, ' home '),
(2, 'title', 0, 1, ' home '),
(9, 'title', 0, 1, ' schools '),
(16, 'title', 0, 1, ' gallery '),
(12, 'title', 0, 1, ' greetings '),
(12, 'slug', 0, 1, ' greetings '),
(9, 'slug', 0, 1, ' schools '),
(16, 'slug', 0, 1, ' gallery '),
(18, 'title', 0, 1, ' contact '),
(18, 'slug', 0, 1, ' contact '),
(21, 'slug', 0, 1, ' about '),
(21, 'title', 0, 1, ' about '),
(24, 'title', 0, 1, ' greetings '),
(27, 'slug', 0, 1, ' mission statement '),
(30, 'title', 0, 1, ' staff '),
(30, 'slug', 0, 1, ' staff '),
(33, 'title', 0, 1, ' alumni '),
(33, 'slug', 0, 1, ' alumni '),
(36, 'slug', 0, 1, ' academics '),
(36, 'title', 0, 1, ' academics '),
(39, 'title', 0, 1, ' schools '),
(39, 'slug', 0, 1, ' schools '),
(42, 'title', 0, 1, ' exam schedule '),
(42, 'slug', 0, 1, ' exam schedule '),
(45, 'slug', 0, 1, ' examinations '),
(48, 'slug', 0, 1, ' admissions '),
(48, 'title', 0, 1, ' admissions '),
(51, 'title', 0, 1, ' apply '),
(51, 'slug', 0, 1, ' apply '),
(54, 'slug', 0, 1, ' fee structure '),
(61, 'slug', 0, 1, ' portal '),
(61, 'title', 0, 1, ' portal '),
(64, 'slug', 0, 1, ' staff '),
(67, 'title', 0, 1, ' student '),
(24, 'slug', 0, 1, ' greetings '),
(27, 'title', 0, 1, ' mission statement '),
(45, 'title', 0, 1, ' examinations '),
(54, 'title', 0, 1, ' fee structure '),
(58, 'slug', 0, 1, ' scholarship '),
(58, 'title', 0, 1, ' scholarship '),
(89, 'slug', 0, 1, ''),
(90, 'slug', 0, 1, ''),
(91, 'slug', 0, 1, ''),
(92, 'slug', 0, 1, ''),
(93, 'slug', 0, 1, ''),
(94, 'slug', 0, 1, ''),
(95, 'slug', 0, 1, ''),
(96, 'slug', 0, 1, ''),
(97, 'slug', 0, 1, ''),
(98, 'slug', 0, 1, ''),
(99, 'slug', 0, 1, ''),
(100, 'slug', 0, 1, ''),
(101, 'slug', 0, 1, ''),
(102, 'slug', 0, 1, ''),
(67, 'slug', 0, 1, ' alumni '),
(64, 'title', 0, 1, ' staff portal '),
(107, 'slug', 0, 1, ' staff portal '),
(107, 'title', 0, 1, ' staff portal '),
(110, 'slug', 0, 1, ' student portal '),
(110, 'title', 0, 1, ' student portal '),
(112, 'slug', 0, 1, ''),
(113, 'slug', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Home', 'home', 'single', 1, 'all', NULL, '2020-12-02 10:53:11', '2020-12-02 12:23:02', NULL, '1caa3108-aabf-4588-b715-08f17ff0584f'),
(2, 16, 'Greetings', 'greetings', 'structure', 1, 'all', NULL, '2020-12-02 11:16:32', '2020-12-02 15:46:22', '2020-12-08 15:34:16', '73bf7ae6-3a9d-4782-8f37-2dc0c510455b'),
(3, 2, 'Mission', 'mission', 'structure', 1, 'all', NULL, '2020-12-02 12:19:16', '2020-12-02 12:19:16', '2020-12-08 15:34:23', 'c4245f71-fd9a-4a75-aa18-f8b49ca3b152'),
(4, 3, 'AboutStaff', 'aboutstaff', 'structure', 1, 'all', NULL, '2020-12-02 12:21:34', '2020-12-02 12:21:34', '2020-12-08 15:33:54', '3a58d25d-f80a-4b8e-a429-3f9105852d79'),
(5, 4, 'AboutAlumni', 'aboutalumni', 'structure', 1, 'all', NULL, '2020-12-02 12:22:14', '2020-12-02 12:22:14', '2020-12-08 15:33:49', 'a0310744-fdbd-44cc-a7ba-3042cb85ddc4'),
(6, 15, 'Schools', 'schools', 'structure', 1, 'all', NULL, '2020-12-02 12:24:34', '2020-12-02 15:46:03', '2020-12-08 15:34:31', '1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7'),
(7, 6, 'Schedule', 'schedule', 'structure', 1, 'all', NULL, '2020-12-02 12:27:17', '2020-12-02 12:27:17', '2020-12-08 15:34:26', '2266ef54-1914-4b8b-bed9-12b2455cbd50'),
(8, 7, 'Exam', 'exam', 'structure', 1, 'all', NULL, '2020-12-02 12:28:38', '2020-12-02 12:28:38', '2020-12-08 15:34:07', '66295c0c-8af6-4de9-96ad-638b9d92d5cf'),
(9, 8, 'Apply', 'apply', 'structure', 1, 'all', NULL, '2020-12-02 12:29:20', '2020-12-02 12:29:20', '2020-12-08 15:34:01', '75be57fe-b2db-48fa-bb0e-c45af44dc7ea'),
(10, 9, 'Fee', 'fee', 'structure', 1, 'all', NULL, '2020-12-02 12:30:20', '2020-12-02 12:30:20', '2020-12-08 15:34:10', 'a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa'),
(11, 10, 'Scholarship', 'scholarship', 'structure', 1, 'all', NULL, '2020-12-02 12:31:45', '2020-12-02 12:38:51', '2020-12-08 15:34:28', 'a22993d6-7a8a-468f-9ac2-e2ddc3b6439e'),
(12, 11, 'Gallery', 'gallery', 'structure', 1, 'all', NULL, '2020-12-02 12:33:56', '2020-12-02 12:33:56', '2020-12-08 15:34:13', '96139a7b-692e-42e1-8bb5-4044c847c566'),
(13, 12, 'Contact', 'contact', 'structure', 1, 'all', NULL, '2020-12-02 12:34:30', '2020-12-02 12:34:30', '2020-12-08 15:34:04', '4629d9a3-48f4-4027-9b50-9e60194ca0e6'),
(14, 13, 'Alumni', 'alumni', 'structure', 1, 'all', NULL, '2020-12-02 12:36:56', '2020-12-02 12:36:56', '2020-12-08 15:33:57', '65e93377-f763-46de-a938-f05317809adc'),
(15, 14, 'Staff', 'staff', 'structure', 1, 'all', NULL, '2020-12-02 12:39:27', '2020-12-02 12:39:27', '2020-12-08 15:34:34', '9a2a7379-35ea-4850-9004-5e29a853ca99'),
(16, 17, 'Pages', 'pages', 'structure', 1, 'all', NULL, '2020-12-08 15:40:07', '2020-12-08 15:40:07', NULL, 'a33a073b-15ff-49f7-9d47-1e80709c0e74'),
(17, NULL, 'Gallery', 'gallery', 'single', 1, 'all', NULL, '2020-12-08 15:41:34', '2020-12-08 15:41:34', NULL, 'f39f3846-6552-4346-a3c2-bd797d2d9890'),
(18, NULL, 'Contact', 'contact', 'single', 1, 'all', NULL, '2020-12-08 15:42:38', '2020-12-08 15:42:38', NULL, '721d595b-1310-457f-856e-9e1c16b0f412');

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', 'home', 1, '2020-12-02 10:53:11', '2020-12-02 10:53:11', '704039d8-ce7c-403f-94e8-bf2626941b9b'),
(2, 2, 1, 1, 'about/greetings', 'about\\greetings', 1, '2020-12-02 11:16:32', '2020-12-02 14:59:03', '26000d56-67c8-4535-a1b4-fbc60d6759e1'),
(3, 3, 1, 1, 'mission', 'about\\mission', 1, '2020-12-02 12:19:16', '2020-12-02 15:14:43', 'fbed8144-47ef-4ef5-ab91-a453c9cd140d'),
(4, 4, 1, 1, 'aboutstaff', 'about\\aboutstaff', 1, '2020-12-02 12:21:34', '2020-12-02 15:00:06', '4817a2f7-b2f5-4d1f-979c-3b99ad5d7f23'),
(5, 5, 1, 1, 'aboutalumni', 'about\\aboutalumni', 1, '2020-12-02 12:22:14', '2020-12-02 14:59:54', 'c2130e15-2b3a-406c-9929-01e4335037cb'),
(6, 6, 1, 1, 'academics/schools', 'academics\\schools', 1, '2020-12-02 12:24:35', '2020-12-02 15:45:00', '7520e6c6-b4b9-41af-9962-17422c6ea659'),
(7, 7, 1, 1, 'schedule/schedule', 'academics\\schedule', 1, '2020-12-02 12:27:17', '2020-12-02 15:00:49', '9acd6129-1dfb-4da8-931d-dee7afc506d1'),
(8, 8, 1, 1, 'academics/exam', 'academics\\exams', 1, '2020-12-02 12:28:38', '2020-12-02 15:01:06', 'b75c4bab-b9fd-4e39-a938-664efd81828d'),
(9, 9, 1, 1, 'admission/apply/{slug}', 'admission\\apply', 1, '2020-12-02 12:29:20', '2020-12-02 15:01:34', 'd1a40f18-9938-447b-9bc2-b63b9117d5d9'),
(10, 10, 1, 1, 'admission/fee/{slug}', 'admission\\fee', 1, '2020-12-02 12:30:20', '2020-12-02 15:02:04', '464a2f0d-4bde-4103-a0d9-b44676072662'),
(11, 11, 1, 1, 'admission/scholarship/{slug}', 'admission\\scholarship', 1, '2020-12-02 12:31:45', '2020-12-02 15:02:25', '24b3e6cf-86ea-42d9-8a3e-4b343c6b10f5'),
(12, 12, 1, 1, 'gallery/{slug}', 'gallery', 1, '2020-12-02 12:33:56', '2020-12-02 12:33:56', '418135c6-8d8c-48f6-86f6-1ac3a83a6a2b'),
(13, 13, 1, 1, 'contact/{slug}', 'contact', 1, '2020-12-02 12:34:30', '2020-12-02 12:34:30', '0261712e-14f4-4fe8-bfc9-960a10ea33f8'),
(14, 14, 1, 1, 'portal/alumni/{slug}', 'portal\\alumni', 1, '2020-12-02 12:36:56', '2020-12-02 15:03:07', '9baab500-f812-449b-b495-804d6fc556de'),
(15, 15, 1, 1, 'portal/staff/{slug}', 'portal\\staff', 1, '2020-12-02 12:39:27', '2020-12-02 15:02:51', '134b994c-c327-475f-9e1e-01f58743bbd0'),
(16, 16, 1, 1, '{parent.uri}/{slug}', 'pages\\_entry', 1, '2020-12-08 15:40:07', '2020-12-08 15:40:07', '73a7360a-c333-4f3d-9b9e-e3d9db3ab2dc'),
(17, 17, 1, 1, 'gallery', 'gallery', 1, '2020-12-08 15:41:34', '2020-12-08 15:41:34', '2a3cb211-b830-44e8-86b7-e96348ec0276'),
(18, 18, 1, 1, 'contact', 'contact', 1, '2020-12-08 15:42:38', '2020-12-08 15:42:38', 'e2da99cf-8570-4b9f-bce7-29ccf6a8d2d3');

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, '7wCjvM1jhu0pnMmD3PgujKLWUId5ShmKjhES0eyKt0HcbhXwZfZjUEVJQKU_-Rp9LjJgaXIw8_FFtQ7fyR5A3Gdgx8Rgre42tlVW', '2020-12-02 10:43:08', '2020-12-02 15:06:31', '76074f4c-fb07-4c44-8e28-d550a3f90d89'),
(3, 1, '3HJU3d_s_rc-Mmt9ClsvqvtXQ0NfJEfI1VY83OWgiIsqdIrp5cluqbpv7O042JFHlaTNza1iqqIBY39S1OGptjr6HJUsLzhEmAtC', '2020-12-02 15:12:49', '2020-12-02 15:12:49', 'b8c3861b-56f3-4f03-804e-940db4550567'),
(4, 1, 'igNzXxUzRR_1UbnU1z7EnOlgZ3XDojKzNC0qUO5d6WQkC4d6cByVeG7439XHJx_CFzx82k-147AJ4Htl9UzHOmqFdZxLCPYS4pWO', '2020-12-02 18:14:30', '2020-12-02 18:15:32', '688763fa-b126-45e9-bf73-f5915a964a31'),
(5, 1, 'PCEFALMPK6jEuinGM0EtY4PELCm_sOiYsmIRTS2caFTJkAPJqVuzk2ZVnWuBrNIRumPDLm559GLYkmCKcqp-qOA5Gl-UERrn6Wuz', '2020-12-08 15:32:00', '2020-12-08 18:55:00', 'eebeb177-b84a-4bc4-b683-ed25899f8772');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Mei', '2020-12-02 10:43:06', '2020-12-02 10:43:06', NULL, '258eafb0-787f-4cd4-bdea-e9bd1e62d909');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Mei', 'default', 'en', 1, '$PRIMARY_SITE_URL', 1, '2020-12-02 10:43:06', '2020-12-02 10:43:06', NULL, '347fb537-1b10-43af-aa22-3b9c7df0448f');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `structureelements`
--

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 15, NULL, 1, 1, 2, 0, '2020-12-02 15:46:03', '2020-12-08 15:34:31', '52225000-53b0-48d5-9da2-f5e453e3cb08'),
(3, 16, NULL, 3, 1, 2, 0, '2020-12-02 15:46:22', '2020-12-08 15:34:16', '6b29ca33-e0aa-4a71-baeb-1722ea1c9afd'),
(5, 17, NULL, 5, 1, 118, 0, '2020-12-08 15:43:06', '2020-12-08 18:45:19', '0cbb698d-335b-4315-bf2b-7d736ce414f1'),
(7, 17, 21, 5, 2, 39, 1, '2020-12-08 15:43:15', '2020-12-08 17:08:08', 'e3a6b42b-1d0a-4252-9836-307f7f2400fe'),
(8, 17, 22, 5, 40, 41, 1, '2020-12-08 15:43:16', '2020-12-08 17:08:08', '3b95fe2b-f05c-438d-a9c3-5e2892e1416d'),
(10, 17, 24, 5, 3, 4, 2, '2020-12-08 15:43:49', '2020-12-08 15:43:50', '3890db26-2165-46e4-8d41-4e2c344a315e'),
(11, 17, 25, 5, 5, 6, 2, '2020-12-08 15:43:50', '2020-12-08 15:43:50', '419ef113-25db-4b42-af4c-2eb6ed9026d3'),
(13, 17, 27, 5, 7, 8, 2, '2020-12-08 15:46:56', '2020-12-08 15:46:56', '53af314d-10a6-4d8d-8165-4c2de8a3a084'),
(14, 17, 28, 5, 9, 10, 2, '2020-12-08 15:46:56', '2020-12-08 15:46:56', '33191e1f-1fd0-4bc5-ab07-5e0db44d0538'),
(16, 17, 30, 5, 11, 12, 2, '2020-12-08 15:48:34', '2020-12-08 15:48:34', '34d887d6-7026-4a99-b66a-c62690d5fe2d'),
(17, 17, 31, 5, 13, 14, 2, '2020-12-08 15:48:34', '2020-12-08 15:48:34', 'f42fc825-4bde-4d6e-8523-47626f5bdd95'),
(19, 17, 33, 5, 15, 16, 2, '2020-12-08 15:48:57', '2020-12-08 15:48:57', '2da0efd0-cd8f-4a71-a007-16e2de36eb74'),
(20, 17, 34, 5, 17, 18, 2, '2020-12-08 15:48:57', '2020-12-08 15:48:57', '06a18356-c694-479c-89c6-63978c6dd81b'),
(22, 17, 36, 5, 42, 63, 1, '2020-12-08 15:51:08', '2020-12-08 17:08:08', '714c8041-f417-4471-9f08-6f9a8e01be41'),
(23, 17, 37, 5, 64, 65, 1, '2020-12-08 15:51:08', '2020-12-08 17:08:08', '7a6a3f3a-24b4-45a6-b9a3-ca6a155ce171'),
(25, 17, 39, 5, 43, 44, 2, '2020-12-08 15:52:10', '2020-12-08 17:08:08', '6842834b-e005-4796-8df8-c17dece471b2'),
(26, 17, 40, 5, 45, 46, 2, '2020-12-08 15:52:10', '2020-12-08 17:08:08', '7e3fb010-7a78-4936-9347-ae7c13fd452c'),
(28, 17, 42, 5, 47, 48, 2, '2020-12-08 15:53:12', '2020-12-08 17:08:08', 'b1f10b1a-6248-437f-8dcb-fde3d71b4fe4'),
(29, 17, 43, 5, 49, 50, 2, '2020-12-08 15:53:12', '2020-12-08 17:08:08', 'de20e8e3-386b-44c3-b16b-60d4f159c223'),
(31, 17, 45, 5, 51, 52, 2, '2020-12-08 15:53:41', '2020-12-08 17:08:08', '411adbbd-4343-49e2-aa9a-515715792f09'),
(32, 17, 46, 5, 53, 54, 2, '2020-12-08 15:53:41', '2020-12-08 17:08:08', 'ec59825f-5187-43b0-9ae6-9b5f1c249495'),
(34, 17, 48, 5, 66, 87, 1, '2020-12-08 15:54:26', '2020-12-08 17:08:08', 'da6c6244-558e-4af0-8c66-1502782829b7'),
(35, 17, 49, 5, 88, 89, 1, '2020-12-08 15:54:26', '2020-12-08 17:08:08', 'ab98c3a9-03a3-46af-b50d-e490be5431e0'),
(37, 17, 51, 5, 67, 68, 2, '2020-12-08 15:55:03', '2020-12-08 17:08:08', '1ae7d404-866f-4a7a-a616-cb599d87d0be'),
(38, 17, 52, 5, 69, 70, 2, '2020-12-08 15:55:03', '2020-12-08 17:08:08', 'f7229aaa-e812-4c40-a8e7-7c646bbb7c06'),
(40, 17, 54, 5, 71, 72, 2, '2020-12-08 15:55:25', '2020-12-08 17:08:08', 'd9143b40-898d-4ffe-93e4-c3ff3047ff36'),
(41, 17, 55, 5, 90, 91, 1, '2020-12-08 15:55:26', '2020-12-08 17:08:08', 'b41876c6-5841-413a-9475-f6c7e99badd4'),
(42, 17, 56, 5, 73, 74, 2, '2020-12-08 15:55:47', '2020-12-08 17:08:08', 'ff95ef3e-d445-4b31-979e-3835eb818fdd'),
(44, 17, 58, 5, 75, 76, 2, '2020-12-08 15:56:56', '2020-12-08 17:08:08', '78d80cec-f5d6-48c2-a747-caf925d650f4'),
(45, 17, 59, 5, 77, 78, 2, '2020-12-08 15:56:56', '2020-12-08 17:08:08', '3ee736c8-9a68-462c-a63a-4414bc26210b'),
(47, 17, 61, 5, 92, 115, 1, '2020-12-08 15:57:28', '2020-12-08 18:45:19', '84ad6e37-6339-4d90-a7ce-dfba288b6faf'),
(48, 17, 62, 5, 116, 117, 1, '2020-12-08 15:57:28', '2020-12-08 18:45:19', 'fc6be9f4-c384-4568-97da-5958cfbec5f7'),
(51, 17, 65, 5, 93, 94, 2, '2020-12-08 15:58:12', '2020-12-08 18:44:08', 'cb5918fd-7abe-4a92-b72b-ed5982016cc3'),
(54, 17, 68, 5, 95, 96, 2, '2020-12-08 15:59:02', '2020-12-08 18:44:08', '4ee5f30f-6bae-41ad-94d4-421435793427'),
(55, 17, 69, 5, 19, 20, 2, '2020-12-08 16:27:40', '2020-12-08 16:27:40', 'de07b573-3be7-4bee-a3ed-d15a9346ac34'),
(56, 17, 70, 5, 21, 22, 2, '2020-12-08 16:28:40', '2020-12-08 16:28:40', '665032fa-5d02-45a7-ba53-d0fb62ac1b6e'),
(57, 17, 71, 5, 23, 24, 2, '2020-12-08 16:41:39', '2020-12-08 16:41:39', '17a7b24c-dc5c-4cea-aec3-9a111b1a8be5'),
(58, 17, 72, 5, 25, 26, 2, '2020-12-08 16:42:16', '2020-12-08 16:42:16', '5f643759-a31b-4169-99d3-33b931489607'),
(59, 17, 73, 5, 27, 28, 2, '2020-12-08 16:53:02', '2020-12-08 16:53:02', 'a0fab3e1-978a-4fbd-baed-a0b3f44d4880'),
(60, 17, 74, 5, 29, 30, 2, '2020-12-08 16:58:08', '2020-12-08 16:58:08', '9df6f00d-d51d-4eab-a314-bea112a80a51'),
(61, 17, 75, 5, 31, 32, 2, '2020-12-08 16:59:39', '2020-12-08 16:59:39', '9dd7726b-fa5e-4ede-b764-020bba39ab7e'),
(62, 17, 76, 5, 33, 34, 2, '2020-12-08 17:01:29', '2020-12-08 17:01:29', '50c93e9a-67e7-477a-ad8c-ff66afcf4e52'),
(63, 17, 77, 5, 35, 36, 2, '2020-12-08 17:01:46', '2020-12-08 17:01:46', 'd2596e2e-5bb7-4b7b-9394-4d7fa1d61def'),
(64, 17, 78, 5, 55, 56, 2, '2020-12-08 17:03:16', '2020-12-08 17:08:08', '7d02cd4c-ff07-4e65-b49d-44fd29776534'),
(65, 17, 79, 5, 57, 58, 2, '2020-12-08 17:03:45', '2020-12-08 17:08:08', '0f821337-9269-4839-b268-04b6a75d9240'),
(66, 17, 80, 5, 59, 60, 2, '2020-12-08 17:04:21', '2020-12-08 17:08:08', '972cc73a-4b57-412d-8b4a-c1ebf424db14'),
(67, 17, 81, 5, 61, 62, 2, '2020-12-08 17:04:27', '2020-12-08 17:08:08', '30bb8046-f7da-4716-89f5-642173938554'),
(68, 17, 82, 5, 79, 80, 2, '2020-12-08 17:04:51', '2020-12-08 17:08:08', 'abda33cd-f03b-40bd-9e8a-810fd2b664fa'),
(69, 17, 83, 5, 81, 82, 2, '2020-12-08 17:05:06', '2020-12-08 17:08:08', 'b349b301-9df2-4922-a6a2-f8b59a06a048'),
(70, 17, 84, 5, 83, 84, 2, '2020-12-08 17:05:23', '2020-12-08 17:08:08', '5eaa92e3-1c46-4989-916a-6bd0798190af'),
(71, 17, 85, 5, 85, 86, 2, '2020-12-08 17:05:36', '2020-12-08 17:08:08', '62358c04-7e41-4b27-9ee1-569e616af497'),
(72, 17, 86, 5, 97, 98, 2, '2020-12-08 17:05:49', '2020-12-08 18:44:08', '544ac0cc-1d44-421e-8a73-55e34e263184'),
(73, 17, 87, 5, 99, 100, 2, '2020-12-08 17:06:04', '2020-12-08 18:44:08', 'd5f362f5-e058-4380-b305-779029c99914'),
(74, 17, 88, 5, 37, 38, 2, '2020-12-08 17:08:08', '2020-12-08 17:08:08', '5ee0d6d3-7173-4e7a-991f-4b52f46f4337'),
(75, 17, 103, 5, 101, 102, 2, '2020-12-08 18:42:42', '2020-12-08 18:44:08', '6ae1af58-4d5f-47a1-afc1-e77d1f9303c5'),
(76, 17, 104, 5, 103, 104, 2, '2020-12-08 18:43:11', '2020-12-08 18:44:08', '1ebc55ae-2d81-4fd5-9d14-c897dd86f705'),
(77, 17, 105, 5, 105, 106, 2, '2020-12-08 18:43:42', '2020-12-08 18:44:08', 'fac60e60-b50c-43e3-ac0b-2370b7af0ed7'),
(79, 17, 107, 5, 107, 108, 2, '2020-12-08 18:44:43', '2020-12-08 18:44:43', '1513b05f-6d3c-4519-ac9b-9e526aa232ed'),
(80, 17, 108, 5, 109, 110, 2, '2020-12-08 18:44:43', '2020-12-08 18:44:43', '47afc43b-258e-48a9-85d5-32ed6b99d738'),
(82, 17, 110, 5, 111, 112, 2, '2020-12-08 18:45:19', '2020-12-08 18:45:19', 'a6e713f3-c7b1-4114-9f76-e0d8465eacb6'),
(83, 17, 111, 5, 113, 114, 2, '2020-12-08 18:45:19', '2020-12-08 18:45:19', 'f5d01bbe-86c5-4ccd-9198-835b886ae316');

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `structures`
--

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, '2020-12-02 11:16:32', '2020-12-02 11:16:32', '2020-12-02 15:44:08', '6a9a9735-b709-4e84-999b-b6df9df3859e'),
(2, NULL, '2020-12-02 12:19:16', '2020-12-02 12:19:16', '2020-12-08 15:34:23', '7da97827-5072-4f9b-bab2-ed056930fb46'),
(3, NULL, '2020-12-02 12:21:34', '2020-12-02 12:21:34', '2020-12-08 15:33:54', '3c2c2442-68a2-4a1a-8f05-47b158cac0c6'),
(4, NULL, '2020-12-02 12:22:14', '2020-12-02 12:22:14', '2020-12-08 15:33:49', '1e08bfb4-fbc4-43ce-b5ec-ef562201c03d'),
(5, NULL, '2020-12-02 12:24:34', '2020-12-02 12:24:34', '2020-12-02 15:24:14', '7dd618a6-0a65-48ef-90ae-0fab73fa0cae'),
(6, NULL, '2020-12-02 12:27:17', '2020-12-02 12:27:17', '2020-12-08 15:34:26', '51830600-5fc6-4772-9c10-80719159bbee'),
(7, NULL, '2020-12-02 12:28:38', '2020-12-02 12:28:38', '2020-12-08 15:34:07', '6d41300a-4f25-47c1-81ca-801d835a57f7'),
(8, NULL, '2020-12-02 12:29:20', '2020-12-02 12:29:20', '2020-12-08 15:34:01', 'f5572ce4-8194-4261-a10d-72749856efe7'),
(9, NULL, '2020-12-02 12:30:20', '2020-12-02 12:30:20', '2020-12-08 15:34:10', '8fdda822-0ebb-49df-8ea8-766536dd92ce'),
(10, NULL, '2020-12-02 12:31:45', '2020-12-02 12:31:45', '2020-12-08 15:34:28', '08445fd3-cf58-4538-8c44-bb8722e901e0'),
(11, NULL, '2020-12-02 12:33:56', '2020-12-02 12:33:56', '2020-12-08 15:34:13', '871ab187-3dd1-4a3b-a4bb-9ad59e0451b6'),
(12, NULL, '2020-12-02 12:34:30', '2020-12-02 12:34:30', '2020-12-08 15:34:04', '98b7f180-29ea-49b3-af25-d2312fb11495'),
(13, NULL, '2020-12-02 12:36:56', '2020-12-02 12:36:56', '2020-12-08 15:33:57', '0c41d934-4129-490d-aaf3-6f73fa131818'),
(14, NULL, '2020-12-02 12:39:27', '2020-12-02 12:39:27', '2020-12-08 15:34:34', 'cc3b1844-83ff-42d8-a436-c4eb10308d25'),
(15, NULL, '2020-12-02 15:46:03', '2020-12-02 15:46:03', '2020-12-08 15:34:31', '1dccacb0-7487-4606-8988-4b5674afda3a'),
(16, NULL, '2020-12-02 15:46:22', '2020-12-02 15:46:22', '2020-12-08 15:34:16', '42459457-ab3f-4885-b2f5-03ad2e8972e7'),
(17, NULL, '2020-12-08 15:40:07', '2020-12-08 15:40:07', NULL, '53181348-b700-4aec-8cd7-acec6aed6385');

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `route`, `usageLimit`, `usageCount`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'vKrwKcqOmXQGC3bE7g7cIWVXtU9PY1zw', '[\"preview/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"sourceId\":33,\"siteId\":1,\"draftId\":17,\"revisionId\":null}]', NULL, NULL, '2020-12-09 17:08:09', '2020-12-08 17:08:09', '2020-12-08 17:08:09', '9bd01817-0903-43d5-b1da-cd8409f30e19');

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'kevin', NULL, NULL, NULL, 'qevinodhiambo@gmail.com', '$2y$13$jcOtX29w8KeV9pXx6OWKM.NOSDcVw/0qkcPN.AAiLj8U3.4vk9R2u', 1, 0, 0, 0, '2020-12-08 15:32:00', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2020-12-02 10:43:07', '2020-12-02 10:43:07', '2020-12-08 15:32:00', '61f5a495-422a-4685-8686-517181f49c03');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2020-12-02 10:43:20', '2020-12-02 10:43:20', 'd6880bd9-b110-4f74-a793-c7e3e53e587a'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2020-12-02 10:43:20', '2020-12-02 10:43:20', '8df6ba0d-880e-4115-ab44-9c822fbb914a'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2020-12-02 10:43:21', '2020-12-02 10:43:21', '696c446c-62a4-49b5-bb4a-dd73b4241874'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2020-12-02 10:43:21', '2020-12-02 10:43:21', '28f329ed-d988-4ee5-a173-f6604a7d0b33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  ADD KEY `assets_folderId_idx` (`folderId`),
  ADD KEY `assets_volumeId_idx` (`volumeId`),
  ADD KEY `assets_uploaderId_fk` (`uploaderId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransforms_name_idx` (`name`),
  ADD KEY `assettransforms_handle_idx` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_groupId_idx` (`groupId`),
  ADD KEY `categories_parentId_fk` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorygroups_name_idx` (`name`),
  ADD KEY `categorygroups_handle_idx` (`handle`),
  ADD KEY `categorygroups_structureId_idx` (`structureId`),
  ADD KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `categorygroups_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `changedattributes_siteId_fk` (`siteId`),
  ADD KEY `changedattributes_userId_fk` (`userId`);

--
-- Indexes for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `changedfields_siteId_fk` (`siteId`),
  ADD KEY `changedfields_fieldId_fk` (`fieldId`),
  ADD KEY `changedfields_userId_fk` (`userId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `content_siteId_idx` (`siteId`),
  ADD KEY `content_title_idx` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drafts_creatorId_fk` (`creatorId`),
  ADD KEY `drafts_sourceId_fk` (`sourceId`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `elements_type_idx` (`type`),
  ADD KEY `elements_enabled_idx` (`enabled`),
  ADD KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  ADD KEY `elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  ADD KEY `elements_draftId_fk` (`draftId`),
  ADD KEY `elements_revisionId_fk` (`revisionId`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `elements_sites_siteId_idx` (`siteId`),
  ADD KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `elements_sites_enabled_idx` (`enabled`),
  ADD KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_postDate_idx` (`postDate`),
  ADD KEY `entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `entries_authorId_idx` (`authorId`),
  ADD KEY `entries_sectionId_idx` (`sectionId`),
  ADD KEY `entries_typeId_idx` (`typeId`),
  ADD KEY `entries_parentId_fk` (`parentId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  ADD KEY `entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `entrytypes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldgroups_name_idx` (`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fields_handle_context_idx` (`handle`,`context`),
  ADD KEY `fields_groupId_idx` (`groupId`),
  ADD KEY `fields_context_idx` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `globalsets_name_idx` (`name`),
  ADD KEY `globalsets_handle_idx` (`handle`),
  ADD KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  ADD UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  ADD KEY `gqltokens_schemaId_fk` (`schemaId`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `matrixblocks_sortOrder_idx` (`sortOrder`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocktypes_name_fieldId_idx` (`name`,`fieldId`),
  ADD KEY `matrixblocktypes_handle_fieldId_idx` (`handle`,`fieldId`),
  ADD KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `matrixcontent_about`
--
ALTER TABLE `matrixcontent_about`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_about_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_about_siteId_fk` (`siteId`);

--
-- Indexes for table `matrixcontent_academics`
--
ALTER TABLE `matrixcontent_academics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_academics_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_academics_siteId_fk` (`siteId`);

--
-- Indexes for table `matrixcontent_admissions`
--
ALTER TABLE `matrixcontent_admissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_admissions_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_admissions_siteId_fk` (`siteId`);

--
-- Indexes for table `matrixcontent_navigation`
--
ALTER TABLE `matrixcontent_navigation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_navigation_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_navigation_siteId_fk` (`siteId`);

--
-- Indexes for table `matrixcontent_portal`
--
ALTER TABLE `matrixcontent_portal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_portal_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_portal_siteId_fk` (`siteId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `migrations_track_name_unq_idx` (`track`,`name`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plugins_handle_unq_idx` (`handle`);

--
-- Indexes for table `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `relations_sourceId_idx` (`sourceId`),
  ADD KEY `relations_targetId_idx` (`targetId`),
  ADD KEY `relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  ADD KEY `revisions_creatorId_fk` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_handle_idx` (`handle`),
  ADD KEY `sections_name_idx` (`name`),
  ADD KEY `sections_structureId_idx` (`structureId`),
  ADD KEY `sections_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_uid_idx` (`uid`),
  ADD KEY `sessions_token_idx` (`token`),
  ADD KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `sessions_userId_idx` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sitegroups_name_idx` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `sites_handle_idx` (`handle`),
  ADD KEY `sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `sites_groupId_fk` (`groupId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `structureelements_root_idx` (`root`),
  ADD KEY `structureelements_lft_idx` (`lft`),
  ADD KEY `structureelements_rgt_idx` (`rgt`),
  ADD KEY `structureelements_level_idx` (`level`),
  ADD KEY `structureelements_elementId_idx` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `systemmessages_language_idx` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taggroups_name_idx` (`name`),
  ADD KEY `taggroups_handle_idx` (`handle`),
  ADD KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_groupId_idx` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unq_idx` (`token`),
  ADD KEY `tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usergroups_handle_idx` (`handle`),
  ADD KEY `usergroups_name_idx` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_uid_idx` (`uid`),
  ADD KEY `users_verificationCode_idx` (`verificationCode`),
  ADD KEY `users_email_idx` (`email`),
  ADD KEY `users_username_idx` (`username`),
  ADD KEY `users_photoId_fk` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `volumefolders_parentId_idx` (`parentId`),
  ADD KEY `volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volumes_name_idx` (`name`),
  ADD KEY `volumes_handle_idx` (`handle`),
  ADD KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `volumes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `matrixcontent_about`
--
ALTER TABLE `matrixcontent_about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matrixcontent_academics`
--
ALTER TABLE `matrixcontent_academics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `matrixcontent_admissions`
--
ALTER TABLE `matrixcontent_admissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `matrixcontent_navigation`
--
ALTER TABLE `matrixcontent_navigation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `matrixcontent_portal`
--
ALTER TABLE `matrixcontent_portal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixcontent_about`
--
ALTER TABLE `matrixcontent_about`
  ADD CONSTRAINT `matrixcontent_about_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_about_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_academics`
--
ALTER TABLE `matrixcontent_academics`
  ADD CONSTRAINT `matrixcontent_academics_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_academics_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_admissions`
--
ALTER TABLE `matrixcontent_admissions`
  ADD CONSTRAINT `matrixcontent_admissions_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_admissions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_navigation`
--
ALTER TABLE `matrixcontent_navigation`
  ADD CONSTRAINT `matrixcontent_navigation_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_navigation_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_portal`
--
ALTER TABLE `matrixcontent_portal`
  ADD CONSTRAINT `matrixcontent_portal_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_portal_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;