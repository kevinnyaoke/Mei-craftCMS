-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2020 at 09:34 AM
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
(24, 1, 17, '2020-12-12 05:56:31', 0, 1),
(27, 1, 17, '2020-12-11 21:28:41', 0, 1),
(39, 1, 17, '2020-12-12 07:20:35', 0, 1),
(42, 1, 17, '2020-12-12 09:01:11', 0, 1),
(45, 1, 17, '2020-12-12 06:18:18', 0, 1),
(54, 1, 17, '2020-12-12 09:09:51', 0, 1),
(58, 1, 17, '2020-12-12 06:41:33', 0, 1);

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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, '2020-12-02 10:43:06', '2020-12-02 10:43:06', 'd888dac2-829b-4980-b7bb-9e74f7f62d20'),
(2, 2, 1, 'Home', '2020-12-02 10:53:13', '2020-12-08 20:12:37', '2d18273f-c2da-47f3-9972-4aa58fc3aa94'),
(3, 3, 1, 'home', '2020-12-02 10:53:14', '2020-12-02 10:53:14', '8d745925-9eb8-4561-831c-fefde89ba3dc'),
(4, 4, 1, 'home', '2020-12-02 10:53:14', '2020-12-02 10:53:14', 'fa523a0c-c3c8-49af-af6b-fb7e7c61aeff'),
(5, 5, 1, 'Home', '2020-12-02 12:23:03', '2020-12-02 12:23:03', 'b00f1f34-926b-40f9-91a3-260c02cc722d'),
(6, 6, 1, 'Home', '2020-12-02 12:23:04', '2020-12-02 12:23:04', 'c1c6da17-3d39-43c5-95b7-b6a3c2af2391'),
(7, 7, 1, 'Home', '2020-12-02 12:23:04', '2020-12-02 12:23:04', '0738f92f-e3c2-46a0-8d0a-b61298420d55'),
(8, 8, 1, 'Home', '2020-12-02 14:52:33', '2020-12-02 14:52:33', 'de354d19-ccb4-4053-89cb-d3f945d4fb5b'),
(9, 9, 1, 'Schools', '2020-12-02 15:24:15', '2020-12-02 15:46:05', '44b299ed-5459-4eb4-883d-270f680b846c'),
(10, 10, 1, 'Schools', '2020-12-02 15:24:15', '2020-12-02 15:24:15', 'c3e33cef-0702-40c8-a425-a5f22b35e8da'),
(11, 11, 1, 'Schools', '2020-12-02 15:24:15', '2020-12-02 15:24:15', 'e9b193b1-8ee8-446f-b494-a5b1afc47906'),
(12, 12, 1, 'Greetings', '2020-12-02 15:44:09', '2020-12-02 15:46:26', '46393a0b-d7cd-4a69-83cc-f11e8215ccf7'),
(13, 13, 1, 'Greetings', '2020-12-02 15:44:09', '2020-12-02 15:44:09', '5887d395-2186-40db-875b-4565ca773af7'),
(14, 14, 1, 'Schools', '2020-12-02 15:45:00', '2020-12-02 15:45:00', 'f56e95cb-d0b0-4254-9d17-7badecf309db'),
(15, 15, 1, 'Schools', '2020-12-02 15:45:01', '2020-12-02 15:45:01', '46008c40-ebe6-4b73-b678-10b4ef496006'),
(16, 16, 1, 'Gallery', '2020-12-08 15:41:35', '2020-12-08 15:41:35', 'a5cff6b3-7674-40df-8e48-361bbfbe2f37'),
(17, 17, 1, 'Gallery', '2020-12-08 15:41:35', '2020-12-08 15:41:35', 'e3b10549-a86a-418a-a073-50c4ce3a798b'),
(18, 18, 1, 'Contact', '2020-12-08 15:42:38', '2020-12-08 15:42:38', 'cb969981-dece-4312-ba36-25c4974bffc1'),
(19, 19, 1, 'Contact', '2020-12-08 15:42:38', '2020-12-08 15:42:38', '5d7d4be6-094b-42e6-9631-88ffd71599b8'),
(21, 21, 1, 'About', '2020-12-08 15:43:15', '2020-12-08 16:26:46', '3f63d0e6-d3a8-4584-b350-f860ee914ab8'),
(22, 22, 1, 'About', '2020-12-08 15:43:16', '2020-12-08 15:43:16', 'f6dff6eb-f402-409f-9032-fadd0a71121c'),
(24, 24, 1, 'Greetings', '2020-12-08 15:43:49', '2020-12-12 05:56:30', '270eb0ed-90fa-4372-991f-ccbc43df419e'),
(25, 25, 1, 'Greetings', '2020-12-08 15:43:50', '2020-12-08 15:43:50', '39b27854-c91b-4b4a-a70b-2e99caf2b84e'),
(27, 27, 1, 'Mission Statement', '2020-12-08 15:46:56', '2020-12-11 21:28:39', '7636c353-bf0b-40fe-a63a-ee340fc9d0ed'),
(28, 28, 1, 'Mission Statement', '2020-12-08 15:46:56', '2020-12-08 15:46:56', 'd1c20b35-10ed-4cb9-b854-4264d9584ff0'),
(30, 30, 1, 'Staff', '2020-12-08 15:48:34', '2020-12-08 17:01:29', '71a15fb9-c9d6-4063-b4e0-3b1fc22b2ccf'),
(31, 31, 1, 'Staff', '2020-12-08 15:48:34', '2020-12-08 15:48:34', 'f4f1bb9b-a305-46c9-81a1-5d285a4a9aec'),
(33, 33, 1, 'Alumni', '2020-12-08 15:48:57', '2020-12-08 17:01:46', '2300a3c0-5b40-4a49-ba77-385edbab080c'),
(34, 34, 1, 'Alumni', '2020-12-08 15:48:57', '2020-12-08 15:48:57', '230e4023-469e-4a04-8c5a-67f3d737bc91'),
(36, 36, 1, 'Academics', '2020-12-08 15:51:08', '2020-12-08 16:26:46', 'b6ee46ae-d744-4c24-a1e3-4b3002ffea39'),
(37, 37, 1, 'Academics', '2020-12-08 15:51:08', '2020-12-08 15:51:08', '158703e3-8210-460e-a586-571dd0f33743'),
(39, 39, 1, 'Schools', '2020-12-08 15:52:10', '2020-12-12 07:20:31', 'e00df397-656b-4846-9d08-9fe59d17b5a7'),
(40, 40, 1, 'Schools', '2020-12-08 15:52:10', '2020-12-08 15:52:10', 'dcdecf67-088a-480d-935e-9bfa71e97f64'),
(42, 42, 1, 'Exam Schedule', '2020-12-08 15:53:12', '2020-12-12 09:01:11', '6c80f577-5c01-428f-8838-f8cd71b4562c'),
(43, 43, 1, 'Exam Schedule', '2020-12-08 15:53:12', '2020-12-08 15:53:12', '894060c6-c755-4531-ad5e-e594b7e8fce6'),
(45, 45, 1, 'Examinations', '2020-12-08 15:53:41', '2020-12-12 06:18:17', 'd029c00f-edd8-4e53-ab3b-bcb575c8386e'),
(46, 46, 1, 'Examinations', '2020-12-08 15:53:41', '2020-12-08 15:53:41', '8fcc330b-83ea-4ac7-a6c5-5bdaeda15ce7'),
(48, 48, 1, 'Admissions', '2020-12-08 15:54:26', '2020-12-08 16:26:47', 'df03e2f8-0990-4dd9-8b66-f5577d55643f'),
(49, 49, 1, 'Admissions', '2020-12-08 15:54:26', '2020-12-08 15:54:26', '5d5ca25f-5e87-4a06-83fc-20248ead052d'),
(51, 51, 1, 'Apply', '2020-12-08 15:55:03', '2020-12-08 17:04:51', '3dd76a21-c6d6-4d63-848a-58998b63aa39'),
(52, 52, 1, 'Apply', '2020-12-08 15:55:03', '2020-12-08 15:55:03', '1ab09fb6-16d7-4c81-98be-858c5e3eea90'),
(54, 54, 1, 'Fee Structure', '2020-12-08 15:55:25', '2020-12-12 09:09:50', '8256bd1e-d004-4b50-bc23-971c6a92b1da'),
(55, 55, 1, 'Fee Structure', '2020-12-08 15:55:26', '2020-12-08 15:55:26', '5827029f-a674-49d1-8775-a35e65ae823f'),
(56, 56, 1, 'Fee Structure', '2020-12-08 15:55:46', '2020-12-08 15:55:46', '222c6ea0-3163-4803-aa8c-26532ddcf50c'),
(58, 58, 1, 'Scholarship', '2020-12-08 15:56:56', '2020-12-12 06:41:31', '0c95c3e3-8c02-43a1-95c6-d88b6818cceb'),
(59, 59, 1, 'Scholarship', '2020-12-08 15:56:56', '2020-12-08 15:56:56', '05c8d3a4-03bc-4dcc-9089-91e7b8e554df'),
(61, 61, 1, 'Portal', '2020-12-08 15:57:28', '2020-12-08 16:26:47', '95722fc2-4314-4088-8ada-993f9f91c839'),
(62, 62, 1, 'Portal', '2020-12-08 15:57:28', '2020-12-08 15:57:28', 'd63ac36b-4d3e-425a-bfc0-e78d4cf0c1d3'),
(64, 64, 1, 'Staff Portal', '2020-12-08 15:58:11', '2020-12-08 18:43:42', '3ac4c5fd-a9f5-4a38-8bd5-24c10c900d52'),
(65, 65, 1, 'Staff', '2020-12-08 15:58:12', '2020-12-08 15:58:12', '26973f44-d891-458a-b8b5-76ab30f3f116'),
(67, 67, 1, 'Student', '2020-12-08 15:59:02', '2020-12-08 18:43:11', '1abae8b7-dc78-42f6-ace5-4de9e8336ae7'),
(68, 68, 1, 'Alumni', '2020-12-08 15:59:02', '2020-12-08 15:59:02', '18347b16-e428-4ac7-8b0c-a6c614409a6b'),
(69, 69, 1, 'Greetings', '2020-12-08 16:27:40', '2020-12-08 16:27:40', '72d400a9-86d0-4eb3-9d19-19b08f863408'),
(70, 70, 1, 'Greetings', '2020-12-08 16:28:40', '2020-12-08 16:28:40', '797fbfbd-1b29-4c3d-9930-f24f95c1ae48'),
(71, 71, 1, 'Mission Statement', '2020-12-08 16:41:39', '2020-12-08 16:41:39', 'fe9e9ca1-02fe-4533-baf1-9e8f62bcd0fb'),
(72, 72, 1, 'Greetings', '2020-12-08 16:42:16', '2020-12-08 16:42:16', '19d00b8c-681f-44ec-bd55-faa98cc506eb'),
(73, 73, 1, 'Mission Statement', '2020-12-08 16:53:02', '2020-12-08 16:53:02', '733e77cf-e9eb-430d-ba2c-d4cf7584d7c2'),
(74, 74, 1, 'Mission Statement', '2020-12-08 16:58:08', '2020-12-08 16:58:08', '66900b99-f2df-4144-9a10-a81859fdd13a'),
(75, 75, 1, 'Mission Statement', '2020-12-08 16:59:38', '2020-12-08 16:59:38', 'c0cced31-3a20-4700-ac99-d2d97cdf1d9f'),
(76, 76, 1, 'Staff', '2020-12-08 17:01:29', '2020-12-08 17:01:29', 'd65fe0da-4fbd-430a-b419-36b338106e8a'),
(77, 77, 1, 'Alumni', '2020-12-08 17:01:46', '2020-12-08 17:01:46', 'adb830db-1334-4ea2-a8db-76469506df42'),
(78, 78, 1, 'Schools', '2020-12-08 17:03:16', '2020-12-08 17:03:16', 'bbeb826f-9b08-42d2-a3d7-202a86f28622'),
(79, 79, 1, 'Exam Schedule', '2020-12-08 17:03:45', '2020-12-08 17:03:45', '6635b583-5057-4e11-b88d-32df84417f22'),
(80, 80, 1, 'Examinations', '2020-12-08 17:04:21', '2020-12-08 17:04:21', 'a18b4738-9835-43f1-bec3-c612e57cb7aa'),
(81, 81, 1, 'Examinations', '2020-12-08 17:04:26', '2020-12-08 17:04:26', 'f9915145-0793-4c46-8345-9298181f85b2'),
(82, 82, 1, 'Apply', '2020-12-08 17:04:51', '2020-12-08 17:04:51', 'c572a787-353f-4f39-bac1-17bb85625352'),
(83, 83, 1, 'Fee Structure', '2020-12-08 17:05:06', '2020-12-08 17:05:06', '6a763a3e-9ef9-4068-b09b-3ada56a4b73d'),
(84, 84, 1, 'Scholarship', '2020-12-08 17:05:23', '2020-12-08 17:05:23', '88574e0d-aa9a-4156-a58d-d078f7e8d73f'),
(85, 85, 1, 'Scholarship', '2020-12-08 17:05:36', '2020-12-08 17:05:36', '1a22a9c5-ae8a-43b3-ab75-308f43dd23f7'),
(86, 86, 1, 'Staff', '2020-12-08 17:05:49', '2020-12-08 17:05:49', '6c0c2c0b-de9c-426b-a94a-50fbc01298d7'),
(87, 87, 1, 'Alumni', '2020-12-08 17:06:04', '2020-12-08 17:06:04', 'bd05638b-bf3b-4dae-9a7e-9c7da9c50502'),
(88, 88, 1, 'Alumni', '2020-12-08 17:08:08', '2020-12-08 17:08:13', 'a45343be-fe83-47b2-94f2-951cf2695919'),
(89, 89, 1, NULL, '2020-12-08 17:17:48', '2020-12-08 18:51:35', 'ce0d7731-797d-40f5-830e-a23b5362ed5f'),
(90, 103, 1, 'Student', '2020-12-08 18:42:42', '2020-12-08 18:42:42', '8e1ac168-43ab-44ce-bab6-2c024c143b31'),
(91, 104, 1, 'Student', '2020-12-08 18:43:11', '2020-12-08 18:43:11', '3e906aac-c74d-47ef-822b-9b7db52f4a66'),
(92, 105, 1, 'Staff Portal', '2020-12-08 18:43:42', '2020-12-08 18:43:42', '466d106a-216b-43f8-a4cf-0958dff31f27'),
(94, 107, 1, 'Staff Portal', '2020-12-08 18:44:43', '2020-12-08 18:44:43', 'af795993-9aeb-4f4e-b005-09d661e5a80e'),
(95, 108, 1, 'Staff Portal', '2020-12-08 18:44:43', '2020-12-08 18:44:43', '05574117-9ccd-4c27-81cc-ff3b4a981753'),
(97, 110, 1, 'Student Portal', '2020-12-08 18:45:19', '2020-12-08 18:45:19', '044d49f2-6ff9-4356-b334-bffccef56b55'),
(98, 111, 1, 'Student Portal', '2020-12-08 18:45:19', '2020-12-08 18:45:19', '11336013-c6b8-4904-8aa7-e11418b11641'),
(99, 114, 1, 'Home', '2020-12-08 20:12:37', '2020-12-08 20:12:37', '18148bef-b6d3-4a13-aa22-4472a34be62f'),
(100, 119, 1, 'Greetings', '2020-12-11 14:43:07', '2020-12-11 14:43:07', '80bf6471-28a1-4ef6-be86-8e2699522414'),
(101, 125, 1, 'Greetings', '2020-12-11 20:30:45', '2020-12-11 20:30:45', '908c8095-adf2-46f3-8c4a-4767d30ea6a6'),
(102, 128, 1, 'Greetings', '2020-12-11 20:31:55', '2020-12-11 20:31:55', '486f8b47-2e1e-4066-89ff-b6cb8214ceb6'),
(103, 131, 1, 'Greetings', '2020-12-11 20:49:48', '2020-12-11 20:49:48', '4631a125-f317-4df5-b808-5233c10944ae'),
(104, 133, 1, 'Greetings', '2020-12-11 20:52:01', '2020-12-11 20:52:01', '56a28eb9-d121-43fa-8609-072fe7983548'),
(105, 137, 1, 'Greetings', '2020-12-11 20:55:16', '2020-12-11 20:55:16', '517090a7-0410-41ff-9d1b-0eb20cc53d9b'),
(106, 142, 1, 'Greetings', '2020-12-11 20:57:07', '2020-12-11 20:57:07', 'ee63d0db-c3af-4aea-bbab-fd85d4d62f1b'),
(107, 153, 1, 'Greetings', '2020-12-11 21:07:14', '2020-12-11 21:07:14', 'b3eeddf4-c653-4511-bdc8-f488eb8397e1'),
(108, 165, 1, 'Greetings', '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'c8cc4e7b-0313-4aa1-8dee-de55e9c5061b'),
(109, 184, 1, 'Mission Statement', '2020-12-11 21:16:21', '2020-12-11 21:16:21', '10bd4394-8192-4677-ad4b-001e9c8f3077'),
(110, 192, 1, 'Mission Statement', '2020-12-11 21:17:20', '2020-12-11 21:17:20', '4d75c07c-f059-46aa-b030-7714843b1dac'),
(111, 207, 1, 'Mission Statement', '2020-12-11 21:26:47', '2020-12-11 21:26:47', '95b4b1ba-31c8-4003-9d6d-5eacdd5ef015'),
(112, 223, 1, 'Mission Statement', '2020-12-11 21:28:39', '2020-12-11 21:28:39', '5ccb3607-c300-46b8-93dd-d4fa2041a338'),
(113, 239, 1, 'Greetings', '2020-12-12 05:53:25', '2020-12-12 05:53:25', '05b92f63-b5d5-4c79-89f0-b9437aed4a91'),
(114, 251, 1, 'Greetings', '2020-12-12 05:56:30', '2020-12-12 05:56:30', '423fd22a-9a29-495c-87b4-0721b56d83da'),
(115, 265, 1, 'Exam Schedule', '2020-12-12 06:12:25', '2020-12-12 06:12:25', '768ef14b-995b-4c6b-bd06-1fd3812aeabc'),
(116, 270, 1, 'Examinations', '2020-12-12 06:18:17', '2020-12-12 06:18:17', 'f7527a28-eba1-4b38-b459-4e2cf1bf0251'),
(117, 274, 1, 'Fee Structure', '2020-12-12 06:22:48', '2020-12-12 06:22:48', '1babb193-61ff-450a-9da3-fe475f49d1ba'),
(118, 283, 1, 'Fee Structure', '2020-12-12 06:26:27', '2020-12-12 06:26:27', '7889885c-f27d-4053-abbd-9b21c42d2bfd'),
(119, 302, 1, 'Scholarship', '2020-12-12 06:40:56', '2020-12-12 06:40:56', 'b5fe009c-3983-43e8-be3f-79b071475029'),
(120, 314, 1, 'Scholarship', '2020-12-12 06:41:31', '2020-12-12 06:41:31', '18194291-f4db-4491-b575-2934b6259f22'),
(121, 331, 1, 'Schools', '2020-12-12 06:54:26', '2020-12-12 06:54:26', '433e466e-8b69-4b9e-afa3-51c0a02a0b5d'),
(122, 337, 1, 'Schools', '2020-12-12 06:55:53', '2020-12-12 06:55:53', '9bac4375-9424-486d-b5d9-79f68c8d8efb'),
(123, 347, 1, 'Schools', '2020-12-12 06:59:06', '2020-12-12 06:59:06', '887dd092-11f8-444a-b482-4bf24a26e8c2'),
(124, 363, 1, 'Schools', '2020-12-12 07:04:30', '2020-12-12 07:04:30', 'e00d4106-6b39-44d8-a792-ad6b3d6b3906'),
(125, 382, 1, 'Schools', '2020-12-12 07:06:33', '2020-12-12 07:06:33', '4f91ceb9-e7f7-4c75-8120-b26bcf0dac96'),
(126, 416, 1, 'Schools', '2020-12-12 07:17:31', '2020-12-12 07:17:31', 'edec11a9-969f-4d2d-a66f-3a009a1c2a93'),
(127, 450, 1, 'Schools', '2020-12-12 07:20:31', '2020-12-12 07:20:31', 'bfe52758-2f51-4901-9523-c4fb1c08b72f'),
(128, 484, 1, 'Exam Schedule', '2020-12-12 07:40:33', '2020-12-12 07:40:33', '9090ad24-a319-4425-b0d4-a5d504478dc0'),
(129, 487, 1, 'Exam Schedule', '2020-12-12 07:43:17', '2020-12-12 07:43:17', 'd59804b9-a47e-4f58-895c-13a0aa3bbfff'),
(130, 490, 1, 'Exam Schedule', '2020-12-12 08:02:34', '2020-12-12 08:02:34', 'c36bc829-49a6-4a72-a6dd-52a40a92b858'),
(131, 493, 1, 'Exam Schedule', '2020-12-12 08:47:31', '2020-12-12 08:47:31', '22435333-6ec7-4410-a699-0042fb022b79'),
(132, 496, 1, 'Exam Schedule', '2020-12-12 08:51:43', '2020-12-12 08:51:43', '9a089c52-1507-4bd6-8f1a-99d75382d571'),
(133, 499, 1, 'Exam Schedule', '2020-12-12 08:55:31', '2020-12-12 08:55:31', '4b65810a-7099-48e2-928d-415e2581ba6f'),
(134, 502, 1, 'Exam Schedule', '2020-12-12 08:58:02', '2020-12-12 08:58:02', 'f753d4f9-005e-462e-b8e5-29fbe28347d6'),
(135, 505, 1, 'Exam Schedule', '2020-12-12 08:58:45', '2020-12-12 08:58:45', 'f22615fa-1c79-4702-8054-2e2ac7b7d836'),
(136, 508, 1, 'Exam Schedule', '2020-12-12 09:00:20', '2020-12-12 09:00:20', '8cbf7473-03c9-4c8f-819e-182251102988'),
(137, 511, 1, 'Exam Schedule', '2020-12-12 09:01:11', '2020-12-12 09:01:11', 'dc068966-617c-46a1-be1b-7d7066404559'),
(138, 514, 1, 'Fee Structure', '2020-12-12 09:09:50', '2020-12-12 09:09:50', 'c08bf501-ec0e-4006-936c-81734c313e93');

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
(1, 'ElementQuery::getIterator()', 'C:\\laragon\\www\\mei\\templates\\inside.twig:29', '2020-12-11 20:41:55', 'C:\\laragon\\www\\mei\\templates\\inside.twig', 29, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":568,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\e8\\\\e8d7ec6295da8f7fd4ddae29ddcb4798067d467170ee1532239736adcc890d82.php\",\"line\":91,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":184,\"class\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\b2\\\\b246b4af3496310dab620ab6bab489ea9c782f1aa11f647e54e43fbea13f573d.php\",\"line\":62,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\e8\\\\e8d7ec6295da8f7fd4ddae29ddcb4798067d467170ee1532239736adcc890d82.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about/greetings\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about/greetings\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about/greetings\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about/greetings\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about/greetings\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-12-11 20:41:56', '2020-12-11 20:41:56', '4d52244e-797a-491a-94c5-e662370fb6f9'),
(7, 'ElementQuery::getIterator()', 'C:\\laragon\\www\\mei\\templates\\inside.twig:27', '2020-12-11 20:34:43', 'C:\\laragon\\www\\mei\\templates\\inside.twig', 27, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":568,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\e8\\\\e8d7ec6295da8f7fd4ddae29ddcb4798067d467170ee1532239736adcc890d82.php\",\"line\":86,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":184,\"class\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\b2\\\\b246b4af3496310dab620ab6bab489ea9c782f1aa11f647e54e43fbea13f573d.php\",\"line\":62,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\e8\\\\e8d7ec6295da8f7fd4ddae29ddcb4798067d467170ee1532239736adcc890d82.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about/greetings\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about/greetings\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about/greetings\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about/greetings\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about/greetings\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-12-11 20:34:43', '2020-12-11 20:34:43', '30629c9e-326a-491f-ab2b-b5e231508a28'),
(11, 'ElementQuery::getIterator()', 'C:\\laragon\\www\\mei\\templates\\inside.twig:31', '2020-12-12 09:33:32', 'C:\\laragon\\www\\mei\\templates\\inside.twig', 31, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":568,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\e8\\\\e8d7ec6295da8f7fd4ddae29ddcb4798067d467170ee1532239736adcc890d82.php\",\"line\":93,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":184,\"class\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\b2\\\\b246b4af3496310dab620ab6bab489ea9c782f1aa11f647e54e43fbea13f573d.php\",\"line\":62,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_96646ad47ccae2fe50a502b9f4409b053b77aa73ffce51f2cd5a4e643abb063f\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\storage\\\\runtime\\\\compiled_templates\\\\e8\\\\e8d7ec6295da8f7fd4ddae29ddcb4798067d467170ee1532239736adcc890d82.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_23ec17ef9729f4f7369cdbd0f7140b3302d19c3a7656106fe12b120083ff9a6a\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"inside\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"academics/exam-schedule\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"academics/exam-schedule\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"academics/exam-schedule\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"academics/exam-schedule\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"inside\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"academics/exam-schedule\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\laragon\\\\www\\\\mei\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-12-12 09:33:32', '2020-12-12 09:33:32', '4af067ce-decb-4715-8015-c188611cd775');

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
(2, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-02 10:53:13', '2020-12-08 20:12:37', NULL, '50388e1b-4a59-4f5a-9bb3-707c1e545022'),
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
(24, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:43:49', '2020-12-12 05:56:30', NULL, '160c746a-8189-4efc-ae3c-bd40bd353421'),
(25, NULL, 15, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:43:49', '2020-12-08 15:43:49', NULL, 'aa4d728e-b81a-404f-830b-40e37dd086d6'),
(27, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:46:56', '2020-12-11 21:28:39', NULL, 'a5fec6ad-3ab8-4bb6-8168-f4aa2193f5c5'),
(28, NULL, 16, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:46:56', '2020-12-08 15:46:56', NULL, 'b57763b0-e437-499e-816e-60dea3b59cb2'),
(30, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:48:34', '2020-12-08 17:01:29', NULL, '5c20814f-d5de-4f42-9cdd-ac08faeded81'),
(31, NULL, 17, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:48:34', '2020-12-08 15:48:34', NULL, '9f7465cf-40f6-4ed2-8421-52b101879367'),
(33, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:48:57', '2020-12-08 17:01:46', NULL, '6cc75055-08b6-4e80-a09d-69542185e868'),
(34, NULL, 18, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:48:56', '2020-12-08 15:48:56', NULL, '9c087b34-7451-4539-a24e-3e2eb6c3f7f8'),
(36, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:51:08', '2020-12-08 15:51:08', NULL, 'c0c27585-10cf-460b-a2a1-9f3bafc80c14'),
(37, NULL, 19, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:51:08', '2020-12-08 15:51:08', NULL, '46b8f1cc-7c47-4a05-85fc-5b485b277d59'),
(39, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:52:10', '2020-12-12 07:20:31', NULL, 'f8352f1b-419c-47e0-8258-971785b47a06'),
(40, NULL, 20, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:52:10', '2020-12-08 15:52:10', NULL, '234c0e0f-0eb7-4cc6-852d-3512ae1f3a82'),
(42, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:53:12', '2020-12-12 09:01:11', NULL, '39e75bf8-5cdb-4fa1-8afc-47dea8c8fbca'),
(43, NULL, 21, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:53:12', '2020-12-08 15:53:12', NULL, '6c6116ca-67fc-474f-a831-7f6e83f8a978'),
(45, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:53:41', '2020-12-12 06:18:17', NULL, '646b5501-d44b-4005-920d-c6efd23a8260'),
(46, NULL, 22, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:53:41', '2020-12-08 15:53:41', NULL, '55a1fc24-ac16-44e5-89bf-0e3a172eef68'),
(48, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:54:26', '2020-12-08 15:54:26', NULL, 'b965577f-b3a1-43b8-b643-927cdbae9997'),
(49, NULL, 23, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:54:26', '2020-12-08 15:54:26', NULL, '2a1d9621-bedb-4c01-acde-0a7b5ea40bf1'),
(51, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:55:03', '2020-12-08 17:04:51', NULL, 'd0fd8805-7c62-4da2-9bf6-1bf5de173809'),
(52, NULL, 24, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:55:03', '2020-12-08 15:55:03', NULL, 'ee48ab3f-9f85-436b-a9e0-251691ec1406'),
(54, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:55:25', '2020-12-12 09:09:50', NULL, 'eb9a5068-b289-4d49-9dee-fe4bffe6d143'),
(55, NULL, 25, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:55:25', '2020-12-08 15:55:25', NULL, '71046f19-3324-45f0-b2e9-10bb651e5884'),
(56, NULL, 26, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:55:46', '2020-12-08 15:55:46', NULL, 'b3737b86-4537-4e6b-8ffc-ff8aab59bb87'),
(58, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:56:56', '2020-12-12 06:41:31', NULL, '7d2ff053-7ddf-4918-8229-b0f1e3170446'),
(59, NULL, 27, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:56:55', '2020-12-08 15:56:55', NULL, 'a277e3dd-4902-451f-8f23-65045f07e77a'),
(61, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:57:28', '2020-12-08 15:57:28', '2020-12-08 21:09:47', '5f3dc193-bd91-4c9a-a956-1818ab55badc'),
(62, NULL, 28, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 15:57:28', '2020-12-08 15:57:28', '2020-12-08 21:09:47', '77be035f-adb0-47d1-8c63-2ecc9297349b'),
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
(90, NULL, NULL, 19, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 17:48:37', '2020-12-08 18:51:35', '2020-12-11 14:25:38', '31ff86eb-01b9-4e69-8bf4-3fde77a9fd17'),
(91, NULL, NULL, 19, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 17:48:37', '2020-12-08 18:51:35', '2020-12-11 14:25:38', '5efa103b-f6df-4107-9e17-c2ecd49b2c2d'),
(92, NULL, NULL, 19, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 17:49:16', '2020-12-08 18:51:35', '2020-12-11 14:25:38', 'bc8dd60a-8173-4b4b-9d8b-64e7aaa691dd'),
(93, NULL, NULL, 21, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:06:36', '2020-12-08 18:51:35', '2020-12-11 14:25:30', '6869502d-03fc-4956-b6ae-53b2690ea86d'),
(94, NULL, NULL, 21, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:06:36', '2020-12-08 18:51:35', '2020-12-11 14:25:30', '059177ca-c9f2-4cc8-8aa1-149841067e79'),
(95, NULL, NULL, 21, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:12:37', '2020-12-08 18:51:35', '2020-12-11 14:25:30', '9841fb76-04b3-405d-b86b-a181692190c4'),
(96, NULL, NULL, 21, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:12:38', '2020-12-08 18:51:35', '2020-12-11 14:25:30', '7799399a-c73d-4e56-be9a-b8d555602e50'),
(97, NULL, NULL, 22, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:20:43', '2020-12-08 18:51:35', '2020-12-11 14:25:32', '68b07004-5340-4703-8c18-2abe50bd1ba7'),
(98, NULL, NULL, 22, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:20:43', '2020-12-08 18:51:35', '2020-12-11 14:25:32', '88f9b406-b3ac-48e6-8725-d97628c2c681'),
(99, NULL, NULL, 22, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:20:44', '2020-12-08 18:51:35', '2020-12-11 14:25:32', 'f9a80c9c-71b1-46fc-a928-f81cb6efa6b6'),
(100, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:27:30', '2020-12-08 18:51:35', '2020-12-11 14:25:36', 'd7186c21-523a-4ad1-9fe4-88e0590faf89'),
(101, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:27:30', '2020-12-08 18:51:35', '2020-12-11 14:25:36', 'e688f4aa-0662-4938-88e5-c0e1a27e6fd5'),
(102, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:27:30', '2020-12-08 18:51:35', '2020-12-11 14:25:36', '1f4fa035-fff0-4500-99f5-69d72e291cef'),
(103, NULL, 50, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:42:41', '2020-12-08 18:42:41', '2020-12-08 18:44:08', '0fd0b55a-24a4-42d1-873d-aa9350c04610'),
(104, NULL, 51, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:43:11', '2020-12-08 18:43:11', '2020-12-08 18:44:08', 'fe77947e-d7b4-4587-ad15-6f4859397aa1'),
(105, NULL, 52, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:43:42', '2020-12-08 18:43:42', '2020-12-08 18:44:08', '0ec11745-5f00-4724-8037-838014691fc9'),
(107, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:44:43', '2020-12-08 18:44:43', '2020-12-08 21:09:47', '2712d422-b97d-4a78-85e0-0bbda2329123'),
(108, NULL, 53, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:44:43', '2020-12-08 18:44:43', '2020-12-08 21:09:47', 'b10ee9c8-95dc-4f7b-a431-d0ee2fa347cc'),
(110, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:45:19', '2020-12-08 18:45:19', '2020-12-08 21:09:47', '93312664-fc1f-44a6-905c-2b51b6da1ef0'),
(111, NULL, 54, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-08 18:45:19', '2020-12-08 18:45:19', '2020-12-08 21:09:47', '2ee643da-7ced-4c40-880a-ceb81a8398c6'),
(112, NULL, NULL, 24, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:50:37', '2020-12-08 18:51:35', '2020-12-11 14:25:48', '52aa3529-3467-47cf-a86a-7c417aab7f04'),
(113, NULL, NULL, 24, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-08 18:50:37', '2020-12-08 18:51:35', '2020-12-11 14:25:48', '7a1232b9-580c-439d-bac5-f8b5a3b19f40'),
(114, NULL, 55, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-08 20:12:37', '2020-12-08 20:12:37', NULL, '77c466f4-a3db-4df0-bd7a-0f16b9e931a0'),
(115, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 14:43:07', '2020-12-11 20:31:55', '2020-12-11 20:49:48', 'a0bc8980-4810-4a4c-8fb4-417332f6659a'),
(116, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '2020-12-11 20:30:45', 'fb23db54-bf1d-4304-9250-637d58f38f44'),
(117, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '2020-12-11 20:30:45', '1c9c3663-e7bf-49fe-899a-6a09f7ee5b49'),
(118, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '2020-12-11 20:30:45', 'c4c60d88-ccde-4932-a20e-12ab99255b67'),
(119, NULL, 56, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-11 14:43:07', '2020-12-11 14:43:07', NULL, '83c29c24-1995-47c3-8ebf-4179261d6918'),
(120, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 14:43:07', '2020-12-11 14:43:07', NULL, '70734b5a-e657-4476-97b9-199ed47a0963'),
(121, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 14:43:07', '2020-12-11 14:43:07', NULL, 'f9c04275-68f6-469b-a244-f46ad286c43a'),
(122, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 14:43:07', '2020-12-11 14:43:07', NULL, '47cbf5fc-ef56-43a5-8671-6ca8fe2cc551'),
(123, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 14:43:08', '2020-12-11 14:43:07', NULL, '9d6de362-3c6c-4bf5-a56a-da1680131ffa'),
(124, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:30:45', '2020-12-12 05:56:30', NULL, 'f77d7f54-65df-45f2-9b18-156154394924'),
(125, NULL, 57, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-11 20:30:44', '2020-12-11 20:30:44', NULL, 'ab2acdda-c5d1-43b3-b1c7-4515ef0f93ba'),
(126, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:30:46', '2020-12-11 20:30:44', NULL, '182bd065-d91b-4c57-9ee8-5c7c4ea274a1'),
(127, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:30:46', '2020-12-11 20:30:45', NULL, '425547ee-a970-45a6-a01c-9102221d6281'),
(128, NULL, 58, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-11 20:31:55', '2020-12-11 20:31:55', NULL, '532a2482-e75c-4b88-99cd-c821b0174fa9'),
(129, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:31:55', '2020-12-11 20:31:55', NULL, 'b071bd72-ed69-418f-8a14-00fc59f3a43d'),
(130, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:31:55', '2020-12-11 20:30:45', NULL, '20cb46a5-722e-435d-bcd3-6eeb26c935e5'),
(131, NULL, 59, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-11 20:49:47', '2020-12-11 20:49:47', NULL, 'a4807ed4-96a7-4d8f-8d41-41ec7bbba5d8'),
(132, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:49:48', '2020-12-11 20:49:47', NULL, '959a00e5-29ff-4c19-8313-7766b01f2a2d'),
(133, NULL, 60, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-11 20:52:01', '2020-12-11 20:52:01', NULL, '96340056-6897-4af7-adf3-51712a944b43'),
(134, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:52:02', '2020-12-11 20:52:01', NULL, '0de70365-4375-4730-a8ef-9a3bb238c80f'),
(135, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:55:16', '2020-12-11 21:08:31', NULL, 'b12b94e4-e538-41de-bcf8-48891ce7559d'),
(136, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:55:16', '2020-12-11 21:08:31', NULL, '89ab0f3d-6fb9-447e-bbc1-a0f46ed5d5f1'),
(137, NULL, 61, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-11 20:55:16', '2020-12-11 20:55:16', NULL, 'e8e551eb-cd34-47c7-a1d1-e93d916cf6cb'),
(138, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:55:16', '2020-12-11 20:55:16', NULL, 'd90a9819-fc35-4957-824b-21d84385ffbf'),
(139, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:55:16', '2020-12-11 20:55:16', NULL, '079dc06d-0db1-4fed-9f37-878c4591199d'),
(140, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:55:16', '2020-12-11 20:55:16', NULL, '9456c159-c510-45ba-aa35-a67cd4310a20'),
(141, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:57:07', '2020-12-11 21:08:31', NULL, '305ab053-bf45-4fc4-8e4b-bda2693cb12c'),
(142, NULL, 62, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-11 20:57:07', '2020-12-11 20:57:07', NULL, '5b36c5b5-86fd-4d29-93d6-d64b91ece440'),
(143, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:57:07', '2020-12-11 20:57:07', NULL, '796e84b1-093b-4c86-8e93-79ac4ea5061d'),
(144, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:57:07', '2020-12-11 20:57:07', NULL, 'abaf79fc-bdc1-4638-95e8-5ee9c2d95169'),
(145, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:57:08', '2020-12-11 20:57:07', NULL, '62587ea9-c3c4-4352-8def-049ccb4c907c'),
(146, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 20:57:08', '2020-12-11 20:57:07', NULL, '9dd88b43-c57d-47cf-9b07-1612506b944b'),
(147, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:13', '2020-12-11 21:08:31', NULL, 'e1256fe2-31ba-4d4c-958b-32280877490c'),
(148, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:13', '2020-12-11 21:08:31', NULL, 'd3545c8a-3cd2-4c13-a3e8-de9e6479ee83'),
(149, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:13', '2020-12-11 21:08:31', NULL, '8143421f-3434-4dec-bbaf-0e75aed0aa6e'),
(150, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:14', '2020-12-11 21:08:31', NULL, 'ca204fdd-eeea-4e90-b2ad-c18b6aadfb37'),
(151, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:14', '2020-12-11 21:08:31', NULL, '05158c4a-f60c-474e-afa6-8721290137f5'),
(152, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:14', '2020-12-11 21:08:32', NULL, 'ac62b015-9cb9-46cc-9121-005dcfddcdd6'),
(153, NULL, 63, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-11 21:07:13', '2020-12-11 21:07:13', NULL, 'e0daf41c-57d5-43b1-b3f8-ae359f2291d7'),
(154, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:14', '2020-12-11 21:07:13', NULL, '501d1bce-132d-4cb7-9581-fe40ee952be8'),
(155, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:14', '2020-12-11 21:07:13', NULL, '10e9c40d-062c-4f91-840b-fa485f0a295d'),
(156, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:14', '2020-12-11 21:07:13', NULL, '6e13552b-bb34-4e18-8a17-5edbdf9dbe7e'),
(157, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:14', '2020-12-11 21:07:13', NULL, 'dec4a06b-ed90-4e20-b6a8-07bc40a1bea2'),
(158, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:14', '2020-12-11 21:07:13', NULL, 'a1272aee-86ab-4745-b82d-5b49769cdcdb'),
(159, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:14', '2020-12-11 21:07:13', NULL, '95e2cebf-05eb-4dec-89f0-eb6da2076f2c'),
(160, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:14', '2020-12-11 21:07:13', NULL, 'd081406e-d43c-4bb5-9141-328ce3517a07'),
(161, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:15', '2020-12-11 21:07:14', NULL, '74425ec4-ebf8-49ef-953a-4bfacf767f36'),
(162, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:15', '2020-12-11 21:07:14', NULL, 'b8e43d25-e83a-467e-ad81-00a57eabce28'),
(163, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:07:15', '2020-12-11 21:07:14', NULL, '7b28a0bb-dc2a-4bc6-9a46-50a6b1b95a47'),
(164, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:08:31', '2020-12-11 21:08:31', NULL, '7296087b-eb87-443c-a2f1-5c03cd146a4b'),
(165, NULL, 64, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-11 21:08:31', '2020-12-11 21:08:31', NULL, 'f3895e8e-4ead-4b6f-a40e-bb07bbd78453'),
(166, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:08:32', '2020-12-11 21:08:31', NULL, 'daa274c5-c1b3-47ba-b648-2d19928a751a'),
(167, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:08:32', '2020-12-11 21:08:31', NULL, 'c731b464-ae7d-45b7-814f-822310f259c2'),
(168, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:08:32', '2020-12-11 21:08:31', NULL, 'eecf0d90-6540-4f95-8ea0-6b2fd7e981c4'),
(169, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:08:32', '2020-12-11 21:08:31', NULL, 'c471965a-1454-4ef7-82a9-789c323cd309'),
(170, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:08:32', '2020-12-11 21:08:31', NULL, 'c2fd941c-2a8b-4545-a628-c02fd39a611a'),
(171, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:08:32', '2020-12-11 21:08:31', NULL, '5afa53b2-7cb2-42dd-9a89-465225378a23'),
(172, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:08:32', '2020-12-11 21:08:31', NULL, 'a8186b53-ddf0-408e-b6a7-6a0b45b73715'),
(173, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:08:32', '2020-12-11 21:08:31', NULL, 'aec9ea77-0d41-4e03-86b2-fd7ec5d5b045'),
(174, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:08:32', '2020-12-11 21:08:31', NULL, 'f73459ad-993e-4f0f-9770-fec47b2b5dec'),
(175, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:08:32', '2020-12-11 21:08:31', NULL, '7e6ce24c-f754-40e3-831b-e26af022a71e'),
(176, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:08:32', '2020-12-11 21:08:32', NULL, '9e52c943-232c-445f-adfb-1e7ff31f6a8a'),
(177, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:21', '2020-12-11 21:28:39', NULL, 'cb4686ce-87c1-438d-b4cc-f5a362559812'),
(178, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:21', '2020-12-11 21:28:39', NULL, '2f0d57b4-0096-4fed-b530-bc367d93d247'),
(179, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:21', '2020-12-11 21:28:39', NULL, '11508e71-7fd2-487f-bdbc-6a8b46080128'),
(180, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:21', '2020-12-11 21:28:39', NULL, 'cd0a1735-4713-48a4-9bf2-c20312af5d6d'),
(181, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:21', '2020-12-11 21:28:39', NULL, '7a3bb53a-e5db-4ebb-a308-34234fc0fcc1'),
(182, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:21', '2020-12-11 21:28:39', NULL, '90a7016f-7dec-41da-ad3f-0b783671a302'),
(183, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:21', '2020-12-11 21:28:39', NULL, '878ffe72-d2a4-47d8-90f6-6368c260465a'),
(184, NULL, 65, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-11 21:16:21', '2020-12-11 21:16:21', NULL, '909914ee-d1de-4d5d-bd73-a0603a0658fb'),
(185, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:21', '2020-12-11 21:16:21', NULL, 'c3d1334d-b4c5-4271-b99b-7244f26090f9'),
(186, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:21', '2020-12-11 21:16:21', NULL, '8754217d-eaf5-4e28-84bc-a26690cea146'),
(187, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:21', '2020-12-11 21:16:21', NULL, 'fe7aa7f8-02c9-479c-a46b-cd959e634f69'),
(188, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:21', '2020-12-11 21:16:21', NULL, '7fa50042-8b42-4d87-b457-19b952899f89'),
(189, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:22', '2020-12-11 21:16:21', NULL, '253c6447-26a9-4a03-a49c-66306297f8b2'),
(190, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:22', '2020-12-11 21:16:21', NULL, '1373c456-2c1f-40fd-92a2-737ee62e3b81'),
(191, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:16:22', '2020-12-11 21:16:21', NULL, '25ced520-ae15-426f-9225-7875f0646a4a'),
(192, NULL, 66, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-11 21:17:20', '2020-12-11 21:17:20', NULL, '80dce036-9fb4-41b5-9fdf-471b0b0e5dce'),
(193, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:17:21', '2020-12-11 21:17:20', NULL, '49707111-951a-4664-9fa6-3341ad86200f'),
(194, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:17:21', '2020-12-11 21:17:20', NULL, 'acbb6a65-dee4-48f6-b0e6-afcfc0ad48cc'),
(195, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:17:21', '2020-12-11 21:17:20', NULL, '01b5c4ca-743b-4063-ad7b-e636a5d4acef'),
(196, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:17:21', '2020-12-11 21:17:20', NULL, '6ebd76e3-c772-4e5e-9c66-278d38c1f1d0'),
(197, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:17:21', '2020-12-11 21:17:20', NULL, 'f24e3a5d-931d-4b52-a8ea-fd004838c81d'),
(198, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:17:21', '2020-12-11 21:17:20', NULL, 'ce635449-0c26-466b-8b51-f2d4d31e6b70'),
(199, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:17:21', '2020-12-11 21:17:20', NULL, '9b1b8fcd-70a1-4cd2-b686-12056c68c2b1'),
(200, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:47', '2020-12-11 21:28:39', NULL, '1cdf3a2f-da19-4b33-bf1b-05243e206e08'),
(201, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:47', '2020-12-11 21:28:39', NULL, '5d6cdf38-9aee-4f23-b5be-6806a80d88a0'),
(202, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:47', '2020-12-11 21:28:39', NULL, '76c7a9b3-c027-40aa-843e-8c8405c8030d'),
(203, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:47', '2020-12-11 21:28:39', NULL, 'e3a69797-9335-4793-b98e-6933c64960fb'),
(204, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:47', '2020-12-11 21:28:39', NULL, '2c412ae2-7cc3-4b14-9119-acb664946dd8'),
(205, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:47', '2020-12-11 21:28:39', NULL, '1f7c3d04-836f-4aa7-a88c-64c02d6a3eda'),
(206, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:47', '2020-12-11 21:28:39', NULL, 'a24ce6e7-ebe5-4bef-8c1e-308967f0dcbe'),
(207, NULL, 67, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-11 21:26:47', '2020-12-11 21:26:47', NULL, 'b1c671c3-500e-4641-89ed-494bc9afce45'),
(208, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:48', '2020-12-11 21:26:47', NULL, 'eb384b84-304f-4d7f-9aea-6588844cf22b'),
(209, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:48', '2020-12-11 21:26:47', NULL, '0deda5f8-1f99-4b21-aa8b-d84b4fbf0435'),
(210, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:48', '2020-12-11 21:26:47', NULL, 'db51579a-2e05-4fd0-b15b-2a5e016084e2'),
(211, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:48', '2020-12-11 21:26:47', NULL, 'a03f6d93-8630-48d7-8573-a4c9a14c4153'),
(212, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:48', '2020-12-11 21:26:47', NULL, 'b10e0b80-3c80-4347-a071-9b511e48b85e'),
(213, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:48', '2020-12-11 21:26:47', NULL, '97297bfb-5c45-4d08-930a-7d1391110d74'),
(214, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:48', '2020-12-11 21:26:47', NULL, '713fa3b2-bf09-4ad2-9f48-faac6f62e79d'),
(215, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:48', '2020-12-11 21:26:47', NULL, '0f9517be-712c-4a89-ac44-6d051c3b6e72'),
(216, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:48', '2020-12-11 21:26:47', NULL, 'aae25fc5-2d0c-4083-a6a1-72c3e47dc1cd'),
(217, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:48', '2020-12-11 21:26:47', NULL, 'c8f19fe0-ba94-4739-a7e7-010d2b6100a3'),
(218, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:48', '2020-12-11 21:26:47', NULL, '98431d80-ccb0-4f6d-8f62-6b8e3c33dc95'),
(219, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:48', '2020-12-11 21:26:47', NULL, 'c0a614f9-04d5-40c1-914d-5143333f7ee1'),
(220, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:48', '2020-12-11 21:26:47', NULL, 'dd9b4a7c-dc73-45ea-a69c-1733188225c0'),
(221, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:26:49', '2020-12-11 21:26:47', NULL, '85b9bd6a-d3d1-4211-83cd-2ef2a41888a7'),
(222, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:39', '2020-12-11 21:28:39', NULL, '33a40ebe-0a4f-40c4-9a98-568def4fe467'),
(223, NULL, 68, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-11 21:28:39', '2020-12-11 21:28:39', NULL, 'c4706541-8c1d-4f60-87ff-463b9bc9a375'),
(224, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:40', '2020-12-11 21:28:39', NULL, 'b4741572-6ed4-4b51-a496-d987a19f3e3d'),
(225, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:40', '2020-12-11 21:28:39', NULL, '22926fd8-d8c0-4033-bc44-5cf962d31022'),
(226, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:40', '2020-12-11 21:28:39', NULL, '24df8590-670e-4755-8685-ffe9d6b4cb52'),
(227, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:40', '2020-12-11 21:28:39', NULL, 'fa29fbd8-6a07-4570-9c4e-6b07d4d0e6d4'),
(228, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:40', '2020-12-11 21:28:39', NULL, '714e92cf-35b9-4b84-a8f1-9adc7db80254'),
(229, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:40', '2020-12-11 21:28:39', NULL, 'b670e8b5-1239-429f-ab0a-a758772ca47a'),
(230, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:40', '2020-12-11 21:28:39', NULL, '96f9274c-546d-4d3b-aa9b-9a0becb98182'),
(231, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:41', '2020-12-11 21:28:39', NULL, 'e32d3d1d-65eb-4309-841a-a8b9f040a9bc'),
(232, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:41', '2020-12-11 21:28:39', NULL, '073d5e28-ed19-41bb-ada7-6a848cdec83b'),
(233, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:41', '2020-12-11 21:28:39', NULL, 'b7e45117-3ef0-42d4-b9e2-ee23c246965b'),
(234, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:41', '2020-12-11 21:28:39', NULL, '6b8ec373-3e31-4ec1-a8af-cf46717d73e7'),
(235, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:41', '2020-12-11 21:28:39', NULL, '14d40154-b83c-4229-9283-057121b8850b'),
(236, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:41', '2020-12-11 21:28:39', NULL, '6c7f0aea-8de9-42fc-9ca8-1f83e0798196'),
(237, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:41', '2020-12-11 21:28:39', NULL, '7c6c3dbc-dc1b-4f9a-9cca-16b91f385929'),
(238, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-11 21:28:41', '2020-12-11 21:28:39', NULL, '9a787e90-3563-4afd-8b61-505f0cfee645'),
(239, NULL, 69, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 05:53:24', '2020-12-12 05:53:24', NULL, '3b0f6a54-fbb6-43ac-aa87-59d2d35600c0'),
(240, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:53:25', '2020-12-11 21:08:31', NULL, '3aab32d6-2dd7-489f-994a-2f58940f5071'),
(241, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:53:25', '2020-12-12 05:53:24', NULL, '5b1e4604-1518-4bfc-9421-8ef8d9525f1b'),
(242, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:53:25', '2020-12-11 21:08:31', NULL, '67ded82d-acb7-4393-8812-8221e0487ebf'),
(243, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:53:25', '2020-12-11 21:08:31', NULL, '62a01ce9-5d30-463f-8341-b3298fda91c2'),
(244, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:53:25', '2020-12-11 21:08:31', NULL, '520d62dd-8a32-44ea-9d85-dd1957b1baf4'),
(245, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:53:25', '2020-12-11 21:08:31', NULL, 'e275f0a1-4761-4423-aa7c-9598211bb3d0'),
(246, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:53:25', '2020-12-11 21:08:31', NULL, 'd447e007-ce4b-4873-8abf-bd8ebeb05495'),
(247, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:53:25', '2020-12-11 21:08:31', NULL, '9b5523af-2fd7-44e9-9048-11462c6b5dce'),
(248, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:53:25', '2020-12-11 21:08:31', NULL, '29be3c94-3b96-4932-a6b6-f440528ae12b'),
(249, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:53:26', '2020-12-11 21:08:31', NULL, '38c8d36b-317a-4cb2-830b-ac8200669b0e'),
(250, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:53:26', '2020-12-11 21:08:32', NULL, 'eaeab0cf-8c4a-4661-8408-3b8c47c2dc74'),
(251, NULL, 70, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 05:56:30', '2020-12-12 05:56:30', NULL, '4ddb7c88-36ac-4497-a7aa-364fc1ddc383'),
(252, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:56:30', '2020-12-11 21:08:31', NULL, 'd7eb62cd-1278-4f8b-ba17-d1ffb571fa87'),
(253, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:56:30', '2020-12-12 05:56:30', NULL, '6b6bef84-e554-4f7b-9db5-bed8403fd5d2'),
(254, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:56:30', '2020-12-11 21:08:31', NULL, '01cd8949-e1c6-4375-8d1a-82cd1667af12'),
(255, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:56:30', '2020-12-11 21:08:31', NULL, '143189b4-f4b8-40c4-b640-8694e145dba2'),
(256, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:56:30', '2020-12-11 21:08:31', NULL, '5ce3e026-0c3c-4937-a4d2-97ebffd6037f'),
(257, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:56:30', '2020-12-11 21:08:31', NULL, 'a1ad3afb-87af-401a-9ace-feae7b16b39e'),
(258, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:56:30', '2020-12-11 21:08:31', NULL, 'bedc0fa0-e3bd-484f-a173-13509f71769b'),
(259, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:56:30', '2020-12-11 21:08:31', NULL, '29af41c6-6e1f-467f-a100-2320711928ee'),
(260, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:56:30', '2020-12-11 21:08:31', NULL, '217b0760-c165-4319-8702-8fb3a2ee38e3'),
(261, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:56:30', '2020-12-11 21:08:31', NULL, 'd62e92c1-f950-44af-b160-c361085e7fe8'),
(262, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 05:56:31', '2020-12-11 21:08:32', NULL, '9da4469b-c8b0-4864-a24f-78db6db3a80a'),
(263, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:12:24', '2020-12-12 09:01:11', NULL, '303f1fb1-8845-4146-8ece-5eaa365eb81d'),
(264, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:12:25', '2020-12-12 08:02:34', '2020-12-12 08:47:31', 'a370a154-fd74-448e-8962-0a8012869f92'),
(265, NULL, 71, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 06:12:24', '2020-12-12 06:12:24', NULL, '9384c2fc-785f-473d-9a83-189d7b3c1584'),
(266, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:12:26', '2020-12-12 06:12:24', NULL, '54f714d4-b4bb-4756-b1e4-151d470e46bb'),
(267, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:12:26', '2020-12-12 06:12:25', NULL, 'adbfbd43-c52a-4126-997d-69fd7e05618c'),
(268, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:18:17', '2020-12-12 06:18:17', NULL, 'de2376d7-3afb-416d-ab07-87c2b1720701'),
(269, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:18:17', '2020-12-12 06:18:17', NULL, '64b15cad-c585-4b73-869d-f90655648110'),
(270, NULL, 72, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 06:18:17', '2020-12-12 06:18:17', NULL, '97c4c40c-eb76-4b13-9045-b04c37c3c20c'),
(271, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:18:18', '2020-12-12 06:18:17', NULL, '30cd8a10-758b-4943-9137-d24484e7eae9'),
(272, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:18:18', '2020-12-12 06:18:17', NULL, '2370620a-5591-42ff-a8de-a96703c37fd7'),
(273, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:22:48', '2020-12-12 09:09:50', NULL, '33292f33-016c-4047-8ecf-3d52d40a60e9'),
(274, NULL, 73, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 06:22:48', '2020-12-12 06:22:48', NULL, 'c83129fe-a3d2-4a3b-beaf-88355e60933b'),
(275, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:22:49', '2020-12-12 06:22:48', NULL, '85203dd9-b533-4c65-99e8-61e4144cff9b'),
(276, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:26', '2020-12-12 09:09:50', NULL, 'd74b1598-bbd6-40bf-b2dd-481187aaba62'),
(277, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:27', '2020-12-12 09:09:50', NULL, 'e1b96cd3-8416-4e54-af2a-7b4a11d4ab0d'),
(278, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:27', '2020-12-12 09:09:50', NULL, 'cad40d27-0070-482b-9341-d78067c5c03c'),
(279, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:27', '2020-12-12 09:09:50', NULL, 'c041cb69-dc94-4251-ad2d-ed1d362e0e36'),
(280, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:27', '2020-12-12 09:09:50', NULL, '42014dbb-7b88-49af-83bd-39d594a225d1'),
(281, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:27', '2020-12-12 09:09:50', NULL, '1f457cf9-5d09-4bad-bf12-4e2c8b7b8590'),
(282, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:27', '2020-12-12 09:09:50', NULL, '63228c3f-3768-4e16-a945-d2d3c0d8a7f9'),
(283, NULL, 74, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 06:26:26', '2020-12-12 06:26:26', NULL, '84d23afe-64c7-45aa-a00a-083258ea8853'),
(284, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:27', '2020-12-12 06:26:26', NULL, '9699a052-24fa-4d49-9737-cacf8e76b18a'),
(285, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:27', '2020-12-12 06:26:26', NULL, 'caf80c48-b167-435b-8e8b-12ebfe54dbff'),
(286, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:27', '2020-12-12 06:26:27', NULL, '55eb51b4-24ed-4147-938b-af0cb1027697'),
(287, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:27', '2020-12-12 06:26:27', NULL, '3ed52d2d-9f46-4e95-8c65-c73b37737176'),
(288, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:27', '2020-12-12 06:26:27', NULL, 'f75ec8f1-00e7-41f2-bb6f-bc1a052ae07d'),
(289, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:27', '2020-12-12 06:26:27', NULL, 'd27cebdd-4ece-42dc-85fd-8584bc1b940e'),
(290, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:28', '2020-12-12 06:26:27', NULL, 'ceda5e74-3e58-4d1f-a3d0-cc215c2136bc'),
(291, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:26:28', '2020-12-12 06:26:27', NULL, 'c9e6be74-5f3c-4a0c-9f0a-1d802460e592'),
(292, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:54', '2020-12-12 06:41:31', NULL, '1f26fec1-c797-4c64-bee6-d6f5aca3d6f0'),
(293, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:55', '2020-12-12 06:41:31', NULL, '12fa2798-036b-4efd-8e77-76ba48c7f8aa'),
(294, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:55', '2020-12-12 06:41:31', NULL, 'bde6962e-239e-41f6-af57-94bfa9f1096c'),
(295, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:55', '2020-12-12 06:41:31', NULL, '0f4b1130-7c4c-436b-b69f-08ca92ce93b8'),
(296, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:56', '2020-12-12 06:41:31', NULL, '69b2004b-b77d-42fd-9e62-791a6baf217c'),
(297, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:56', '2020-12-12 06:41:31', NULL, '27930819-7898-47ef-8a03-8c8e101d3bce'),
(298, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:56', '2020-12-12 06:41:31', NULL, '472e9334-e128-4e0a-af26-07a358f2a3b1'),
(299, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:56', '2020-12-12 06:41:31', NULL, 'f252abc5-45ab-4121-8912-d643b498474c'),
(300, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:56', '2020-12-12 06:41:31', NULL, '748e417c-09b0-44dd-bb47-98c69fc5ce90'),
(301, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:56', '2020-12-12 06:41:31', NULL, 'cf355f81-4ee7-466d-aeb9-b161f32d63ca'),
(302, NULL, 75, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 06:40:54', '2020-12-12 06:40:54', NULL, '25fa81b6-f11f-4721-8d06-c379b741ae96'),
(303, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:56', '2020-12-12 06:40:54', NULL, '378f25c6-e521-472d-a65f-6650fc5bc703'),
(304, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:57', '2020-12-12 06:40:55', NULL, 'bf2cd687-a688-451f-9037-b825d62f5c5a'),
(305, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:57', '2020-12-12 06:40:55', NULL, 'f4a44e8d-5601-422e-960a-39ac1860e600'),
(306, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:57', '2020-12-12 06:40:55', NULL, '5f00ea0a-87df-47e8-b795-1069e5893c28'),
(307, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:57', '2020-12-12 06:40:56', NULL, '5f65d79d-2e4d-43d6-ae11-dd29bb41bb15'),
(308, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:57', '2020-12-12 06:40:56', NULL, 'e7c31965-6d13-4e26-bc92-779dae5b8b7c'),
(309, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:57', '2020-12-12 06:40:56', NULL, 'b73d45fc-3229-4725-abd1-44a596d31c73'),
(310, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:57', '2020-12-12 06:40:56', NULL, 'e244ad37-1584-4488-b652-6ea3e9a28de5'),
(311, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:57', '2020-12-12 06:40:56', NULL, 'e42dd9b0-4f3c-467f-a1d3-6b894e284b69'),
(312, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:40:57', '2020-12-12 06:40:56', NULL, '36f84f35-f7a3-496f-a532-b15a0587e97d'),
(313, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:41:31', '2020-12-12 06:41:31', NULL, '9c41f52e-eca3-482a-8867-901fd8ef2ca4'),
(314, NULL, 76, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 06:41:31', '2020-12-12 06:41:31', NULL, '8d4355fc-0a40-4f4e-b7a3-186315de0d50'),
(315, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:41:32', '2020-12-12 06:41:31', NULL, '3322aa9d-3399-476b-b004-7216dcca3874'),
(316, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:41:32', '2020-12-12 06:41:31', NULL, '7a418049-dc32-4f9f-bdba-2a8a00f7a04a'),
(317, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:41:32', '2020-12-12 06:41:31', NULL, 'f1dc059d-8437-4e43-bfaf-83a3038acd7f'),
(318, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:41:32', '2020-12-12 06:41:31', NULL, 'dea7326b-319e-4301-8744-14355b397488'),
(319, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:41:32', '2020-12-12 06:41:31', NULL, 'e1380afb-6c13-4a55-91cc-20410be52900'),
(320, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:41:32', '2020-12-12 06:41:31', NULL, '02a1c62e-acd8-4f84-81f1-12d2a5e6ea30'),
(321, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:41:32', '2020-12-12 06:41:31', NULL, 'bf341f4c-bec6-4c1b-a2fa-41397dac5a62'),
(322, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:41:32', '2020-12-12 06:41:31', NULL, 'fa4d531c-f5c2-44c9-bd02-06bcc278aa71'),
(323, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:41:32', '2020-12-12 06:41:31', NULL, 'e0e3c409-2721-4cda-b052-2189c36f5c68'),
(324, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:41:32', '2020-12-12 06:41:31', NULL, '6da387bf-910c-4c61-bf45-4fb7216f662f'),
(325, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:41:32', '2020-12-12 06:41:31', NULL, 'f8832005-66d4-43ea-841d-2fde6a0e313f'),
(326, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:54:25', '2020-12-12 07:17:27', NULL, 'd63d484c-d4cf-4e89-b68c-db8e8e369a4e'),
(327, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:54:26', '2020-12-12 07:17:28', NULL, 'f7413327-23df-41e4-b276-01a069710998'),
(328, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:54:26', '2020-12-12 07:17:28', NULL, 'ff1b007d-0798-4498-bc66-72e046b4f11b'),
(329, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:54:26', '2020-12-12 07:17:28', NULL, '337fa79a-17bf-4162-917f-dde95bf55ece'),
(330, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:54:26', '2020-12-12 07:17:28', NULL, 'bca2d06c-9393-4915-98e0-563146e4900b'),
(331, NULL, 77, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 06:54:25', '2020-12-12 06:54:25', NULL, '4f412783-f426-4448-81c6-c4ec3f0a2bac'),
(332, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:54:26', '2020-12-12 06:54:25', NULL, 'b8261cdf-5cdf-4996-8888-91a01d69ed31'),
(333, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:54:26', '2020-12-12 06:54:26', NULL, '56ce78e8-3399-43fc-b1c8-ccf0b9fa6068'),
(334, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:54:26', '2020-12-12 06:54:26', NULL, '96bdf39c-8638-477e-b9b7-28879967d730'),
(335, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:54:26', '2020-12-12 06:54:26', NULL, 'b46852ad-5a16-4428-aca4-1b68034e0e7f'),
(336, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:54:27', '2020-12-12 06:54:26', NULL, 'd9bc288f-d474-4e69-a65d-35c80e9e673b'),
(337, NULL, 78, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 06:55:53', '2020-12-12 06:55:53', NULL, '6eb41922-2543-4947-a679-ed515b3da9d5'),
(338, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:55:53', '2020-12-12 06:54:25', NULL, 'ccd84156-1836-4e34-974d-87622be862ec'),
(339, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:55:53', '2020-12-12 06:54:26', NULL, 'cd5e82f9-b369-4644-ae14-d27c11488242'),
(340, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:55:54', '2020-12-12 06:54:26', NULL, '8bde8a43-111e-4b1d-8382-b606a86a9567'),
(341, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:55:54', '2020-12-12 06:54:26', NULL, '3fa91ab4-2389-447f-8e23-5438c7a4fc49'),
(342, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:55:54', '2020-12-12 06:55:53', NULL, 'a959ec4c-c235-4b76-8d34-8b66c937fae8'),
(343, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:59:06', '2020-12-12 07:17:28', NULL, '1cd83bc8-c745-42da-b9d4-e071083e3c9d'),
(344, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:59:06', '2020-12-12 07:17:28', NULL, '6b555318-90cf-46d1-a7fd-5b4d0b37c92f'),
(345, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:59:06', '2020-12-12 07:17:28', NULL, 'd2316be4-d8c8-4ca4-9fef-31aa3489241f'),
(346, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:59:06', '2020-12-12 07:20:31', NULL, 'aa9f6fd5-eba9-4c5e-be87-1dfb1f7f8099'),
(347, NULL, 79, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 06:59:05', '2020-12-12 06:59:05', NULL, '9505e950-2937-4d7e-a141-7c199c6e643c'),
(348, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:59:06', '2020-12-12 06:59:05', NULL, 'f3c67bdf-523a-4ddf-8211-94a60bc6e7c0'),
(349, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:59:06', '2020-12-12 06:59:05', NULL, '8a96e693-ba45-4f7d-a02c-86f828a3a119');
INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(350, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:59:06', '2020-12-12 06:59:06', NULL, 'c413ece2-9138-45e6-8bbc-004c7a0ec21e'),
(351, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:59:06', '2020-12-12 06:59:06', NULL, '9bb17f94-5035-4f4d-a36f-5aefa205f8f5'),
(352, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:59:06', '2020-12-12 06:59:06', NULL, 'af0edf7b-8b30-4aa5-a385-b418792dd330'),
(353, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:59:06', '2020-12-12 06:59:06', NULL, '09b55e08-d371-4213-b267-7012f4940c07'),
(354, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:59:06', '2020-12-12 06:59:06', NULL, '6692e345-dd93-461e-ac4c-0208a060b0bd'),
(355, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:59:06', '2020-12-12 06:59:06', NULL, 'bdd65002-e6ea-4345-bedb-d60eab0a54fe'),
(356, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 06:59:06', '2020-12-12 06:59:06', NULL, 'aaf7bbb7-335d-44ed-83c8-679cd877bc84'),
(357, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:30', '2020-12-12 07:17:28', NULL, 'a6a36037-45ac-4e38-aad5-cfda42cc1d4f'),
(358, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:30', '2020-12-12 07:17:29', NULL, 'b9c307a9-c41a-4594-a922-e93e9f05d065'),
(359, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:30', '2020-12-12 07:17:29', NULL, '5e4465aa-ce70-436c-9443-6260fd4559b2'),
(360, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:30', '2020-12-12 07:17:29', NULL, 'c1707c84-a67c-474e-ad3a-b537613d3147'),
(361, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:30', '2020-12-12 07:17:29', NULL, 'd42acfc7-7d26-4902-9852-a390c3aacb9f'),
(362, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:30', '2020-12-12 07:20:31', NULL, '022104e4-2ccc-4fed-9a8c-c16de55c0e10'),
(363, NULL, 80, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 07:04:30', '2020-12-12 07:04:30', NULL, '09d9c9e3-7eb1-4293-bb11-3d6fae3bd00c'),
(364, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:31', '2020-12-12 07:04:30', NULL, 'af3985c6-f4ae-4c70-b97f-06ff0a9f706c'),
(365, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:31', '2020-12-12 07:04:30', NULL, '0adcf6a6-dcb9-4f11-a421-79c8f721c3f9'),
(366, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:31', '2020-12-12 07:04:30', NULL, '2e1315b4-1338-4b81-8dae-3e1bd1a4936a'),
(367, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:31', '2020-12-12 07:04:30', NULL, 'b608e256-6df8-4ebc-820d-183042e67c24'),
(368, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:31', '2020-12-12 07:04:30', NULL, '334af699-b8c7-48f3-a566-0b5f0ed6bb0b'),
(369, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:31', '2020-12-12 07:04:30', NULL, '8c62b3d9-21af-471b-89f9-084a27fc11c8'),
(370, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:31', '2020-12-12 07:04:30', NULL, '5524e477-5a17-4e9a-9ecf-5a9621566139'),
(371, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:31', '2020-12-12 07:04:30', NULL, '40625a7c-08e7-4304-acff-30d57c7c1c18'),
(372, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:31', '2020-12-12 07:04:30', NULL, '31fb9e7c-0081-4ab7-9bc6-776cf7421dc0'),
(373, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:31', '2020-12-12 07:04:30', NULL, '649a28a4-34ce-47b4-9035-66eda45fb6f7'),
(374, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:31', '2020-12-12 07:04:30', NULL, 'da76810a-93f8-4975-bd17-e84cb38da95d'),
(375, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:31', '2020-12-12 07:04:30', NULL, '448b365b-324f-4a4b-ba87-6aebb1e5e428'),
(376, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:31', '2020-12-12 07:04:30', NULL, '05f8223f-e2f3-4018-bfc6-5dd208f55543'),
(377, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:32', '2020-12-12 07:04:30', NULL, 'd465eccf-3153-476f-8ec4-5c4337e342f0'),
(378, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:04:32', '2020-12-12 07:04:30', NULL, 'da6bf56e-625e-4f0f-aa5e-b8e3080a2705'),
(379, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:33', '2020-12-12 07:17:29', NULL, '0ae32260-dfdb-4cc4-9779-b79e15afcadf'),
(380, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:33', '2020-12-12 07:17:29', NULL, 'a79127ec-4607-4ffe-b275-71415821579f'),
(381, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:33', '2020-12-12 07:17:29', NULL, '35373de2-0953-46de-8118-bca8821d821b'),
(382, NULL, 81, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 07:06:32', '2020-12-12 07:06:32', NULL, '03985627-4f79-4767-b3fb-5bc597abe077'),
(383, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:33', '2020-12-12 07:06:32', NULL, '89849c9b-a771-4895-85ae-74e753844199'),
(384, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:33', '2020-12-12 07:06:32', NULL, '6d8facbb-122e-4f72-9ee2-c9cc5314decc'),
(385, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:34', '2020-12-12 07:06:33', NULL, '729cf7c5-0bf7-414d-b0d6-334b331e33bb'),
(386, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:34', '2020-12-12 07:06:33', NULL, '4cac0ddd-8d1b-4f25-8f17-d60c14e661c3'),
(387, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:34', '2020-12-12 07:06:33', NULL, '13f40c3e-a36d-496e-9995-801383dc932f'),
(388, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:34', '2020-12-12 07:06:33', NULL, '51d6c4c9-dd38-4fdd-bdd1-ec1278310434'),
(389, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:34', '2020-12-12 07:06:33', NULL, '1ada01fb-cbf7-4bd6-b9cf-ad4ae74f0c88'),
(390, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:34', '2020-12-12 07:06:33', NULL, '43406976-dd81-472f-90f9-89ce0ee2bec4'),
(391, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:34', '2020-12-12 07:06:33', NULL, '0c07e974-cb01-4d8b-9536-f5dc39936adf'),
(392, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:34', '2020-12-12 07:06:33', NULL, 'cbd089ab-8898-47c2-9da9-cf6fcd923b68'),
(393, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:34', '2020-12-12 07:06:33', NULL, 'f915e98b-ad2d-4ca5-b13c-451ca7e75426'),
(394, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:34', '2020-12-12 07:06:33', NULL, 'a22934e9-b6c4-4c46-9fc3-e7d160ac9b66'),
(395, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:34', '2020-12-12 07:06:33', NULL, 'c4a1c0ec-0ee0-4e67-b955-41da9bb4271b'),
(396, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:34', '2020-12-12 07:06:33', NULL, '80a02cfd-5d82-4b52-a70f-f3e8420e86e6'),
(397, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:35', '2020-12-12 07:06:33', NULL, '92d49a0c-bec3-406e-b24b-f7fd2e8ad3f9'),
(398, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:35', '2020-12-12 07:06:33', NULL, '39561137-ea46-44df-a98e-9dad962aad93'),
(399, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:35', '2020-12-12 07:06:33', NULL, '4901e281-4696-4698-9471-a31940fa43d3'),
(400, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:06:35', '2020-12-12 07:06:33', NULL, 'f2c534a5-f379-4233-8a61-e02e71c324dd'),
(401, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:29', '2020-12-12 07:17:29', NULL, 'b99ff596-4b60-4703-b31f-e4950fa99cf3'),
(402, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:29', '2020-12-12 07:17:29', NULL, 'ba916056-574c-4bf0-8621-de84cb005518'),
(403, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:29', '2020-12-12 07:17:29', NULL, '63604bfa-0cb2-4ced-9e8f-79806e31fd00'),
(404, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:29', '2020-12-12 07:17:29', NULL, 'b25601c4-dbdc-4858-95c9-643e7c0e852f'),
(405, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:29', '2020-12-12 07:17:29', NULL, '94247030-b3e8-4c79-be8b-7e4b6f6c78cf'),
(406, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:29', '2020-12-12 07:17:29', NULL, '27bbe46a-7d17-433c-b0da-105e045ddfc5'),
(407, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:29', '2020-12-12 07:17:29', NULL, '91e6b29d-485c-45ef-9c29-e3f8f5075d46'),
(408, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:30', '2020-12-12 07:17:30', NULL, '6537c77e-0dc3-4568-a819-ce1d416d21b3'),
(409, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:30', '2020-12-12 07:20:31', NULL, 'e0169ae1-e19d-4220-99b9-9f0629773dd3'),
(410, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:30', '2020-12-12 07:17:30', NULL, 'f68c8885-6800-49de-ac36-e95199b998f7'),
(411, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:30', '2020-12-12 07:17:30', NULL, 'b25a99c9-ad71-43f3-b6e0-94757e43dcbe'),
(412, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:30', '2020-12-12 07:17:30', NULL, '633b46f7-9015-424e-b540-c54bd545a7dd'),
(413, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:30', '2020-12-12 07:17:30', NULL, 'bb3419af-08d4-4923-bda7-57460b41d382'),
(414, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:30', '2020-12-12 07:17:30', NULL, '693c4e60-857b-486b-b00d-2ee242d8e5bc'),
(415, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:30', '2020-12-12 07:17:30', NULL, '19482292-e247-4187-89ae-125b5d8fe949'),
(416, NULL, 82, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 07:17:27', '2020-12-12 07:17:27', NULL, '3a8b837e-d2e4-4c32-aa73-f1c5da71934d'),
(417, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:31', '2020-12-12 07:17:27', NULL, '88a188ca-a954-4f2f-9eb1-824afc6f7980'),
(418, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:31', '2020-12-12 07:17:28', NULL, 'ec57bccb-b87f-4234-9b57-1f4b95fb3bd5'),
(419, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:31', '2020-12-12 07:17:28', NULL, 'd5064b64-8db7-4883-9dc6-66e48a9ddb55'),
(420, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:31', '2020-12-12 07:17:28', NULL, '622d1883-06a8-4042-a5e0-19bb1fa4378d'),
(421, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:31', '2020-12-12 07:17:28', NULL, 'e6574cac-81c3-40b4-9a23-3aeceb634ee8'),
(422, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:32', '2020-12-12 07:17:28', NULL, 'd6686f60-d335-447e-b2e6-9e2f68ee9612'),
(423, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:32', '2020-12-12 07:17:28', NULL, '7882b00c-21d3-4c80-b91c-3f4c8f7ba3c3'),
(424, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:32', '2020-12-12 07:17:28', NULL, '723642c9-0de9-41dd-a056-576f70535a9e'),
(425, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:32', '2020-12-12 07:17:28', NULL, '0203576c-1b18-4349-b81a-6b290928950a'),
(426, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:32', '2020-12-12 07:17:28', NULL, 'fb388909-3adb-4829-98ae-5419a2a7e749'),
(427, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:32', '2020-12-12 07:17:29', NULL, '8a1f8c3f-9538-4817-85ea-76b5a1cd7d99'),
(428, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:32', '2020-12-12 07:17:29', NULL, '841eacc8-f6ed-4c36-b174-2d6d27159451'),
(429, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:32', '2020-12-12 07:17:29', NULL, '2e498569-ed44-4839-a64b-d079dbcfa83c'),
(430, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:32', '2020-12-12 07:17:29', NULL, '6e350e27-88bc-47e9-af8e-38c1daba1b14'),
(431, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:32', '2020-12-12 07:17:29', NULL, 'a20a3186-7695-4fa2-8628-800ef8406952'),
(432, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:32', '2020-12-12 07:17:29', NULL, '61514a10-f4d6-4e3f-b7f5-3c523e1adb2e'),
(433, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:32', '2020-12-12 07:17:29', NULL, '339e6d0f-0c15-4b2e-8680-d7b42286d4c3'),
(434, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:33', '2020-12-12 07:17:29', NULL, '91292647-84f7-4e6e-b1f3-aa62184dd8b4'),
(435, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:33', '2020-12-12 07:17:29', NULL, '7936dca8-81e9-43ea-b221-a3d5743d947f'),
(436, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:33', '2020-12-12 07:17:29', NULL, '4337ac72-932d-49ab-ada1-46d10a01c17a'),
(437, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:33', '2020-12-12 07:17:29', NULL, '9b271b53-65ba-4ddc-a9f9-2af1080c91a0'),
(438, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:33', '2020-12-12 07:17:29', NULL, '91135d00-5e28-4309-ab68-fc91c85beaaf'),
(439, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:33', '2020-12-12 07:17:29', NULL, 'c59f10a7-91ec-44be-9806-1fc9cdcaac89'),
(440, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:33', '2020-12-12 07:17:29', NULL, 'db4bbc33-b75d-4d97-91d6-e6f03798d227'),
(441, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:33', '2020-12-12 07:17:29', NULL, '130318a5-1f0f-4291-92a7-20e6d30d9550'),
(442, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:34', '2020-12-12 07:17:30', NULL, '24a062a6-78a6-4d05-b0c5-ffd2759aaf96'),
(443, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:34', '2020-12-12 07:17:30', NULL, '8e87a1ba-845f-43b3-b78e-4638a906e86e'),
(444, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:34', '2020-12-12 07:17:30', NULL, '4ca9c1d5-ec90-49a2-9e36-de3f9f495c39'),
(445, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:34', '2020-12-12 07:17:30', NULL, '17396587-1040-4a62-aec7-1c7c192267ef'),
(446, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:34', '2020-12-12 07:17:30', NULL, '9d4d2845-e131-4071-bfc3-123d8d25ba63'),
(447, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:34', '2020-12-12 07:17:30', NULL, '50180e5a-8cbe-4a4a-ad68-00093153b300'),
(448, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:34', '2020-12-12 07:17:30', NULL, '5b348cfe-94ef-4353-a9a1-b2d28f53bcc0'),
(449, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:17:34', '2020-12-12 07:17:30', NULL, '14b0d8a7-7813-42d4-a6ab-adcf8b08cb99'),
(450, NULL, 83, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 07:20:31', '2020-12-12 07:20:31', NULL, '4133d687-6553-49f2-b7c0-8f9c7b0858a7'),
(451, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:31', '2020-12-12 07:17:27', NULL, '9c826703-66df-4a74-8786-80c91005df98'),
(452, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:31', '2020-12-12 07:17:28', NULL, 'b3eda406-d0ba-4176-be98-abed5eb57c0a'),
(453, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:31', '2020-12-12 07:17:28', NULL, '859fd32f-702b-4f5e-a6b1-00ef977eaeef'),
(454, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:31', '2020-12-12 07:17:28', NULL, 'c7d330be-eeaf-4c85-bbd7-5f4b44c92b8e'),
(455, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:31', '2020-12-12 07:17:28', NULL, '62911399-9ae5-43e1-bf25-4e02f920edb3'),
(456, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:31', '2020-12-12 07:17:28', NULL, '404cdc37-0570-4529-be2b-3c7e38d2114d'),
(457, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:31', '2020-12-12 07:17:28', NULL, '6eb4d6bf-1dc0-4d55-8285-92821222dd77'),
(458, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:31', '2020-12-12 07:17:28', NULL, '49bd73f9-8466-4556-90b8-9dd3c65ea20c'),
(459, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:32', '2020-12-12 07:20:31', NULL, '65840eb8-121c-4908-a3ed-59468c2bf9fd'),
(460, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:32', '2020-12-12 07:17:28', NULL, 'feb48691-6953-44e6-927c-4060d687c7b2'),
(461, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:32', '2020-12-12 07:17:29', NULL, '4399ed2d-cd44-4195-a326-1f164d27d361'),
(462, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:32', '2020-12-12 07:17:29', NULL, 'd01e1d78-a89c-4112-802a-f831b6c3fe23'),
(463, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:32', '2020-12-12 07:17:29', NULL, '3e4d6cc0-6512-418c-bbad-a1710f30771d'),
(464, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:32', '2020-12-12 07:17:29', NULL, '4a14106f-c95b-4207-beb8-26239d1c704d'),
(465, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:32', '2020-12-12 07:20:31', NULL, '9168bced-3c98-41a8-ae01-f80f50976fbd'),
(466, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:32', '2020-12-12 07:17:29', NULL, '0289bd6e-f415-4203-8e19-3859bfa647d0'),
(467, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:32', '2020-12-12 07:17:29', NULL, '595a13c4-7b4c-4c69-9d7f-200460aca524'),
(468, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:32', '2020-12-12 07:17:29', NULL, '9fb1d316-62d7-40dc-9f0f-22f937608983'),
(469, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:32', '2020-12-12 07:17:29', NULL, 'b4b2245e-97b1-4298-8c03-c0911008074a'),
(470, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:33', '2020-12-12 07:17:29', NULL, 'c3ed16ac-f1eb-47cb-86e5-9ad8f2058b72'),
(471, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:33', '2020-12-12 07:17:29', NULL, '3ec0e0c1-a317-454f-897f-4174e03fc676'),
(472, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:33', '2020-12-12 07:17:29', NULL, 'e5fda316-68ac-4566-9703-4069cdc4d7e8'),
(473, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:34', '2020-12-12 07:17:29', NULL, '6d29b88b-c5a1-4f1d-bd55-c159e509c72e'),
(474, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:34', '2020-12-12 07:17:29', NULL, '3edc163c-3fca-4317-a587-818990204193'),
(475, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:34', '2020-12-12 07:17:29', NULL, '31049a6e-e14f-49df-ad50-0304ab7ccc66'),
(476, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:34', '2020-12-12 07:17:30', NULL, '30d0aac1-4b93-4538-ad50-bb40035d48c9'),
(477, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:34', '2020-12-12 07:20:31', NULL, '7694ba33-dfe9-4f78-ac0f-877d3c75e4ba'),
(478, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:34', '2020-12-12 07:17:30', NULL, 'a6b6f180-7424-4bb2-8836-5013c5706cc9'),
(479, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:35', '2020-12-12 07:17:30', NULL, '329f82ce-efc4-41f3-9cf7-d89d2c6e858f'),
(480, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:35', '2020-12-12 07:17:30', NULL, '2dd8d023-21ec-4326-ae7b-efcc8e0db700'),
(481, NULL, NULL, 25, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:35', '2020-12-12 07:17:30', NULL, '06987db3-9c27-424d-abaf-200dde16f394'),
(482, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:35', '2020-12-12 07:17:30', NULL, 'cc4b83e5-11e2-4399-a3b8-590e7dc284e6'),
(483, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:20:35', '2020-12-12 07:17:30', NULL, 'b9b5a8f5-846f-45fd-95b2-0d1d132c841d'),
(484, NULL, 84, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 07:40:32', '2020-12-12 07:40:32', NULL, '51d5123b-531f-41a6-89da-2f8dd0df40f6'),
(485, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:40:34', '2020-12-12 07:40:32', NULL, '0a3273a3-6795-4ec7-99e7-0a9ca6074a75'),
(486, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:40:34', '2020-12-12 07:40:33', NULL, '936aedfa-8a8c-459a-a21f-f2d544eb97c5'),
(487, NULL, 85, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 07:43:17', '2020-12-12 07:43:17', NULL, '0fc6b6dd-e111-4cfd-9187-aa5b71f0c437'),
(488, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:43:17', '2020-12-12 07:40:32', NULL, '6e0b8ded-ab4e-4514-95e1-cebe955ef23a'),
(489, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 07:43:17', '2020-12-12 07:43:17', NULL, '7a13350c-8ab1-414b-a308-ec225a8aa28e'),
(490, NULL, 86, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 08:02:33', '2020-12-12 08:02:33', NULL, '413c9f5f-b570-4188-8702-24538b8fc37f'),
(491, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 08:02:35', '2020-12-12 08:02:33', NULL, '7b2c4510-51ab-44f8-8e68-08bd682607b6'),
(492, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 08:02:35', '2020-12-12 08:02:34', NULL, 'a3161b40-9e99-48a9-8bcf-2c77cc6e02f2'),
(493, NULL, 87, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 08:47:31', '2020-12-12 08:47:31', NULL, 'c6c8c1b6-027e-4ff1-9957-f32936343559'),
(494, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 08:47:32', '2020-12-12 08:47:31', NULL, '57fc25b6-a3fd-4b8c-adb7-edca88172e4e'),
(495, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 08:51:43', '2020-12-12 09:01:11', NULL, '01411346-8977-44b0-80ed-4a94bcef749b'),
(496, NULL, 88, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 08:51:42', '2020-12-12 08:51:42', NULL, 'a07e376d-6942-4b8e-8b95-a29f3acf3437'),
(497, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 08:51:43', '2020-12-12 08:51:42', NULL, 'f091159d-a4ae-479e-905f-bffa58dc9378'),
(498, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 08:51:43', '2020-12-12 08:51:43', NULL, '7e0eaac5-0038-4bd4-85f8-7f53f36e62ea'),
(499, NULL, 89, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 08:55:30', '2020-12-12 08:55:30', NULL, '80733c6f-f11d-49d5-af30-bc079d55dad2'),
(500, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 08:55:32', '2020-12-12 08:55:30', NULL, 'a999f25c-5d33-42cc-9fef-2070e03c89f8'),
(501, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 08:55:32', '2020-12-12 08:51:43', NULL, 'a175e78f-74fb-47c9-9cd6-9389cd3c6171'),
(502, NULL, 90, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 08:58:02', '2020-12-12 08:58:02', NULL, 'e5740801-25c6-4990-a655-f0d03f448fc0'),
(503, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 08:58:02', '2020-12-12 08:58:02', NULL, 'eecad52d-b6f5-4863-a065-f54d6b1ef36a'),
(504, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 08:58:02', '2020-12-12 08:58:02', NULL, 'ba0bb702-d4e0-4c29-a689-979a85ab343b'),
(505, NULL, 91, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 08:58:45', '2020-12-12 08:58:45', NULL, '9d939322-7c54-4be1-b444-3b77feaef7ad'),
(506, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 08:58:45', '2020-12-12 08:58:02', NULL, '512a6cfe-d9a5-4860-bb64-f43878facfde'),
(507, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 08:58:45', '2020-12-12 08:58:45', NULL, 'dc83f7c9-88a9-4f68-8d6d-879dfd8ccd13'),
(508, NULL, 92, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 09:00:20', '2020-12-12 09:00:20', NULL, 'e859be69-32d6-495d-8ab9-9e61318b5320'),
(509, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 09:00:20', '2020-12-12 09:00:20', NULL, '1306f308-3e48-4479-9ea2-99671d9ab296'),
(510, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 09:00:21', '2020-12-12 09:00:20', NULL, '2516d43e-ab7b-49ff-80c7-a09dadcd894c'),
(511, NULL, 93, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 09:01:11', '2020-12-12 09:01:11', NULL, 'b797ea4b-c2da-4ebe-92d1-6573d500de8f'),
(512, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 09:01:11', '2020-12-12 09:01:11', NULL, 'b9f9ba50-a0ca-434c-a52b-52b86b6f0053'),
(513, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 09:01:11', '2020-12-12 09:01:11', NULL, 'f20a329e-fa97-440d-82c1-0adcb25e7921'),
(514, NULL, 94, 16, 'craft\\elements\\Entry', 1, 0, '2020-12-12 09:09:50', '2020-12-12 09:09:50', NULL, 'ad6cc5d3-aeb6-4df5-851e-8d5a312753ca'),
(515, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 09:09:51', '2020-12-12 09:09:50', NULL, '13d37de4-17ab-48d2-b8d9-d45f98a1da10'),
(516, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 09:09:51', '2020-12-12 09:09:50', NULL, '31668c11-78d1-4295-b3ad-76b859ccccb8'),
(517, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 09:09:51', '2020-12-12 09:09:50', NULL, '250052c9-a6b0-468d-ad61-b83731c37150'),
(518, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 09:09:51', '2020-12-12 09:09:50', NULL, '4c04ea2c-36b3-48a0-89bc-d25b5a4678f9'),
(519, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 09:09:51', '2020-12-12 09:09:50', NULL, 'e561a23b-562a-48d5-ad1e-b463be9af18f'),
(520, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 09:09:51', '2020-12-12 09:09:50', NULL, 'c575e5b1-ca01-4bb0-bca3-cc1d30e40fe9'),
(521, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 09:09:51', '2020-12-12 09:09:50', NULL, '118ceb2e-479e-4f3a-97dc-38aa58f0b9d7'),
(522, NULL, NULL, 27, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-12 09:09:51', '2020-12-12 09:09:50', NULL, '87fe917e-0ee8-4c54-8a0f-90f05fb351e1');

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
(113, 113, 1, NULL, NULL, 1, '2020-12-08 18:50:37', '2020-12-08 18:50:37', '99cb8df4-cf98-488f-a2c2-1521e53dfec8'),
(114, 114, 1, 'home', '__home__', 1, '2020-12-08 20:12:37', '2020-12-08 20:12:37', 'a5e2e591-d7d3-4146-b7c2-ec439c378a85'),
(115, 115, 1, NULL, NULL, 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', 'a47de73b-af8e-4e69-bf36-81f0f66f8b90'),
(116, 116, 1, NULL, NULL, 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '1e13bff1-3ca3-4f04-bea9-29d49c774d28'),
(117, 117, 1, NULL, NULL, 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '413ef135-5680-4be8-9727-422222309664'),
(118, 118, 1, NULL, NULL, 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', 'e537370b-10c9-4fde-aefc-bad1bf549c0a'),
(119, 119, 1, 'greetings', 'about/greetings', 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', 'a7f1632a-912c-48d3-9c07-2989c7614b33'),
(120, 120, 1, NULL, NULL, 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', 'd4ca2a9a-b555-4299-b7f1-d4c5ddb4af58'),
(121, 121, 1, NULL, NULL, 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '1c871fb9-14b4-4b22-9bda-4062b5a682d1'),
(122, 122, 1, NULL, NULL, 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', 'd86f7bb0-f845-41a2-8085-2d9bc07d71f6'),
(123, 123, 1, NULL, NULL, 1, '2020-12-11 14:43:08', '2020-12-11 14:43:08', '98f12e4a-ead3-49fc-9460-a9edb245ec81'),
(124, 124, 1, NULL, NULL, 1, '2020-12-11 20:30:45', '2020-12-11 20:30:45', '1b711046-7133-40a5-ba25-9163669a8fe7'),
(125, 125, 1, 'greetings', 'about/greetings', 1, '2020-12-11 20:30:45', '2020-12-11 20:30:45', 'cc47d1bd-522a-46eb-b421-16cceee004ae'),
(126, 126, 1, NULL, NULL, 1, '2020-12-11 20:30:46', '2020-12-11 20:30:46', '57e2b56c-df8d-44fa-a99e-085ef28b8766'),
(127, 127, 1, NULL, NULL, 1, '2020-12-11 20:30:46', '2020-12-11 20:30:46', 'baa7052b-3624-4c5e-bbab-aad82a5bfc75'),
(128, 128, 1, 'greetings', 'about/greetings', 1, '2020-12-11 20:31:55', '2020-12-11 20:31:55', '5be87f1e-89ee-42f9-b6f8-17fc3313e84b'),
(129, 129, 1, NULL, NULL, 1, '2020-12-11 20:31:55', '2020-12-11 20:31:55', 'ca41a487-1be9-4153-87de-cd02587bce17'),
(130, 130, 1, NULL, NULL, 1, '2020-12-11 20:31:55', '2020-12-11 20:31:55', 'd339b712-e950-4be2-aa77-483f306dc94b'),
(131, 131, 1, 'greetings', 'about/greetings', 1, '2020-12-11 20:49:48', '2020-12-11 20:49:48', 'c297ef48-6ec2-4fa9-a866-99a4286e8806'),
(132, 132, 1, NULL, NULL, 1, '2020-12-11 20:49:48', '2020-12-11 20:49:48', '7de0d4fe-3ca5-43d3-92eb-508d763625b0'),
(133, 133, 1, 'greetings', 'about/greetings', 1, '2020-12-11 20:52:01', '2020-12-11 20:52:01', '9fbe3812-c57a-44e2-8210-dafb1a6bbc94'),
(134, 134, 1, NULL, NULL, 1, '2020-12-11 20:52:02', '2020-12-11 20:52:02', '9764399f-b0b6-48c8-b378-05344af0dbc7'),
(135, 135, 1, NULL, NULL, 1, '2020-12-11 20:55:16', '2020-12-11 20:55:16', '589b0854-974c-40da-9221-860465785cc9'),
(136, 136, 1, NULL, NULL, 1, '2020-12-11 20:55:16', '2020-12-11 20:55:16', '867f3061-22e8-4d7e-b1f1-7a68075edd18'),
(137, 137, 1, 'greetings', 'about/greetings', 1, '2020-12-11 20:55:16', '2020-12-11 20:55:16', '145aaccc-4a8c-4b4d-92e1-6e6d1efe92e2'),
(138, 138, 1, NULL, NULL, 1, '2020-12-11 20:55:16', '2020-12-11 20:55:16', 'efec337b-d2a6-4e27-83b5-138ba348ea65'),
(139, 139, 1, NULL, NULL, 1, '2020-12-11 20:55:16', '2020-12-11 20:55:16', 'a68af39b-dd3b-4a0f-854e-05b25ab18e37'),
(140, 140, 1, NULL, NULL, 1, '2020-12-11 20:55:16', '2020-12-11 20:55:16', '9be557be-afd3-49ba-bf75-dd7255860c27'),
(141, 141, 1, NULL, NULL, 1, '2020-12-11 20:57:07', '2020-12-11 20:57:07', 'a0295e99-0297-4f56-af1a-85fb712a4d6e'),
(142, 142, 1, 'greetings', 'about/greetings', 1, '2020-12-11 20:57:07', '2020-12-11 20:57:07', 'da2ba613-b5c5-482e-b996-c54c36d1e893'),
(143, 143, 1, NULL, NULL, 1, '2020-12-11 20:57:07', '2020-12-11 20:57:07', '338c0d48-21c4-4a63-97ae-5763c2c9942e'),
(144, 144, 1, NULL, NULL, 1, '2020-12-11 20:57:07', '2020-12-11 20:57:07', '182473b5-188f-4a0e-8cf8-da189e777c1f'),
(145, 145, 1, NULL, NULL, 1, '2020-12-11 20:57:08', '2020-12-11 20:57:08', '807c18df-901d-46a5-9b2f-ac3c0ed49551'),
(146, 146, 1, NULL, NULL, 1, '2020-12-11 20:57:08', '2020-12-11 20:57:08', 'ef76dc2c-2c1b-4513-83ea-440711a82ef0'),
(147, 147, 1, NULL, NULL, 1, '2020-12-11 21:07:13', '2020-12-11 21:07:13', '9cf6cf8a-743f-4565-a4a6-af16ddc665db'),
(148, 148, 1, NULL, NULL, 1, '2020-12-11 21:07:13', '2020-12-11 21:07:13', '43ee10f9-6675-42af-ae3b-d82cf6a30d75'),
(149, 149, 1, NULL, NULL, 1, '2020-12-11 21:07:13', '2020-12-11 21:07:13', '6e071cd3-5421-4983-b805-d6eb5a4d8f51'),
(150, 150, 1, NULL, NULL, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '37a885d0-df59-4a00-8a0a-67046188c5da'),
(151, 151, 1, NULL, NULL, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', 'dd4827e9-07b7-4f28-b65b-51a6dcb0c86b'),
(152, 152, 1, NULL, NULL, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '9b9422e8-bcd6-4b3a-a7a7-9d1a5984d173'),
(153, 153, 1, 'greetings', 'about/greetings', 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '189b38a7-0168-4766-b1b3-01b0718290da'),
(154, 154, 1, NULL, NULL, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', 'f1302825-520a-4361-938b-94ca7f6d063a'),
(155, 155, 1, NULL, NULL, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '3dd4d1b8-429c-41b1-85de-aa6386dcf731'),
(156, 156, 1, NULL, NULL, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '97c71f07-363e-4a66-821e-cbcd28ae82c2'),
(157, 157, 1, NULL, NULL, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', 'e3a6e9de-692f-486a-b30e-7feb7e85f688'),
(158, 158, 1, NULL, NULL, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', 'd2b73b55-8025-454d-b732-2905256de8bf'),
(159, 159, 1, NULL, NULL, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '1f69f895-4123-4ae5-b207-5f8f76c5fdd5'),
(160, 160, 1, NULL, NULL, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '19f1a8d1-78f9-4a6e-a8e8-2ecf99cac01f'),
(161, 161, 1, NULL, NULL, 1, '2020-12-11 21:07:15', '2020-12-11 21:07:15', '5d908eba-8b9b-44e9-86c7-e9bca9fac1e2'),
(162, 162, 1, NULL, NULL, 1, '2020-12-11 21:07:15', '2020-12-11 21:07:15', '4e8263fe-0da6-4166-82eb-f5e4d89ce523'),
(163, 163, 1, NULL, NULL, 1, '2020-12-11 21:07:15', '2020-12-11 21:07:15', '063cfb8d-af95-4533-bbf9-8aacbc9e5d7d'),
(164, 164, 1, NULL, NULL, 1, '2020-12-11 21:08:31', '2020-12-11 21:08:31', '8972c25f-9626-4590-800d-6c1d4ac5cfd0'),
(165, 165, 1, 'greetings', 'about/greetings', 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '92f88d34-ca79-4dbe-a345-6e38b7c1de47'),
(166, 166, 1, NULL, NULL, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'd02a389c-c336-4b9d-8eff-f63d36e8242a'),
(167, 167, 1, NULL, NULL, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'bd2f07e4-59ef-4c08-a95a-4db76ef7559c'),
(168, 168, 1, NULL, NULL, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '05a1c4f1-e8d7-4c8c-82f6-af153621585b'),
(169, 169, 1, NULL, NULL, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'c7492f0e-269a-490f-afd1-0b23856c39bf'),
(170, 170, 1, NULL, NULL, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'fd53616d-def9-4472-8cc2-f7a462de5a0c'),
(171, 171, 1, NULL, NULL, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '265e2b94-4bdb-4222-a1b2-e149d7b383fd'),
(172, 172, 1, NULL, NULL, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'a7c622b1-1087-427b-a567-860b8dabce90'),
(173, 173, 1, NULL, NULL, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '8c9ebd16-dd48-4f02-ae32-2c774469fbe3'),
(174, 174, 1, NULL, NULL, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'e2f5bf64-3cce-4beb-b74f-ed63e3c67cce'),
(175, 175, 1, NULL, NULL, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '841e522f-d75a-46a7-973e-c5f271482841'),
(176, 176, 1, NULL, NULL, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'd92bda62-ec81-4a0b-a28c-866836a42bdc'),
(177, 177, 1, NULL, NULL, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', 'ea3feaff-c9b1-4e0b-89cb-1aee07ede4bf'),
(178, 178, 1, NULL, NULL, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', 'efb434d9-ee2f-4873-8522-39b0b28ae5c5'),
(179, 179, 1, NULL, NULL, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', '69bd19ee-e088-4289-b3e5-429b5cce2fc3'),
(180, 180, 1, NULL, NULL, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', 'ba2ad003-f9b6-48a7-a751-2d1bd84b7fe9'),
(181, 181, 1, NULL, NULL, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', '20b376b9-6156-40e5-9c7b-4926cad1dc3e'),
(182, 182, 1, NULL, NULL, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', 'fa8e4e12-77d4-44e0-989c-8bd5fc94f578'),
(183, 183, 1, NULL, NULL, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', 'bf0f1737-230b-4ec2-b06c-8bd64a29bade'),
(184, 184, 1, 'mission-statement', 'about/mission-statement', 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', '6e9dc482-3b95-402c-9f3f-44fa23491520'),
(185, 185, 1, NULL, NULL, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', 'eafe2c26-47af-4a51-80c6-c6e8326d8484'),
(186, 186, 1, NULL, NULL, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', 'e7cdcace-82f0-4679-af73-e91c2069e5b9'),
(187, 187, 1, NULL, NULL, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', '12c99455-8b3c-4e74-843a-aac1c279baff'),
(188, 188, 1, NULL, NULL, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', '9909eb2b-7744-45b9-8344-dd1f2a80ae01'),
(189, 189, 1, NULL, NULL, 1, '2020-12-11 21:16:22', '2020-12-11 21:16:22', 'f96bb7d1-84b4-487e-92b6-dd29006a3f5f'),
(190, 190, 1, NULL, NULL, 1, '2020-12-11 21:16:22', '2020-12-11 21:16:22', '24978204-9ecf-4ca8-a086-be3c0414c9b5'),
(191, 191, 1, NULL, NULL, 1, '2020-12-11 21:16:22', '2020-12-11 21:16:22', 'd5a9c8a8-c0bb-4b57-9483-3bf3980a1c09'),
(192, 192, 1, 'mission-statement', 'about/mission-statement', 1, '2020-12-11 21:17:20', '2020-12-11 21:17:20', '1ecaf64d-8d1e-45b7-82b2-ef7b748f0b73'),
(193, 193, 1, NULL, NULL, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '41b83271-10d9-4943-b578-d944fa6f4d59'),
(194, 194, 1, NULL, NULL, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '59b1fe26-ee74-4d17-ad05-65cd5b9b620f'),
(195, 195, 1, NULL, NULL, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', 'a0a0874c-0af2-41f1-b4c7-b2684573f933'),
(196, 196, 1, NULL, NULL, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '91388d38-372c-4ac4-a1c2-2b9cbb18855b'),
(197, 197, 1, NULL, NULL, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', 'acbeb343-a163-47fa-af56-e31c2cfde95e'),
(198, 198, 1, NULL, NULL, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', 'bfdeb153-0af5-47af-9033-a672bedd774f'),
(199, 199, 1, NULL, NULL, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', 'def0f503-8ffe-4c77-b197-6f2aea526682'),
(200, 200, 1, NULL, NULL, 1, '2020-12-11 21:26:47', '2020-12-11 21:26:47', 'e51f4a4e-2f31-49ec-b92a-73aec0ca30e6'),
(201, 201, 1, NULL, NULL, 1, '2020-12-11 21:26:47', '2020-12-11 21:26:47', '4258ca69-2ac7-4e32-8252-20fee1045551'),
(202, 202, 1, NULL, NULL, 1, '2020-12-11 21:26:47', '2020-12-11 21:26:47', '7ff28e2e-2caf-4986-9fce-bb1112b8c047'),
(203, 203, 1, NULL, NULL, 1, '2020-12-11 21:26:47', '2020-12-11 21:26:47', '7631bc7a-a8ae-43d2-aa2c-bcafd73e201c'),
(204, 204, 1, NULL, NULL, 1, '2020-12-11 21:26:47', '2020-12-11 21:26:47', 'd655e64d-1f55-4ca8-ba24-7d3741925c47'),
(205, 205, 1, NULL, NULL, 1, '2020-12-11 21:26:47', '2020-12-11 21:26:47', '8b0f8da7-96d6-45f3-a2bd-a867d7bb4444'),
(206, 206, 1, NULL, NULL, 1, '2020-12-11 21:26:47', '2020-12-11 21:26:47', 'd44d6882-d349-4a74-a8e5-faa8e9fa1d60'),
(207, 207, 1, 'mission-statement', 'about/mission-statement', 1, '2020-12-11 21:26:47', '2020-12-11 21:26:47', 'b33d020e-e0fd-4570-8bd6-80ae07579091'),
(208, 208, 1, NULL, NULL, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '9649ffb3-606f-4499-8e20-1c84f1e11507'),
(209, 209, 1, NULL, NULL, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'c9e50f03-952c-4936-ac52-962c8e702614'),
(210, 210, 1, NULL, NULL, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'd3211a98-3f17-4d7d-bed3-9ca39a7f16b6'),
(211, 211, 1, NULL, NULL, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'fa7e87f7-7633-492c-bcdc-427b12183e00'),
(212, 212, 1, NULL, NULL, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '529c1211-91fb-49ac-ae1d-8c144667b879'),
(213, 213, 1, NULL, NULL, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'bb162e9b-8d74-4789-bb74-37c52080fc14'),
(214, 214, 1, NULL, NULL, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '12bd48fe-4a88-4bc2-af75-2624683bfc04'),
(215, 215, 1, NULL, NULL, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '6eb456c6-3a14-471c-8229-c25ba554be89'),
(216, 216, 1, NULL, NULL, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '925e6c15-c415-4267-88b2-b97306cebf5c'),
(217, 217, 1, NULL, NULL, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '39281379-a07d-4522-bfa0-dcbb15c47f89'),
(218, 218, 1, NULL, NULL, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'e7a16634-8366-4a8a-b796-c25d2b23a86a'),
(219, 219, 1, NULL, NULL, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '43988727-9c17-4e84-be6a-b5c04a14dc46'),
(220, 220, 1, NULL, NULL, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '4c619098-2e7f-4285-80ae-9b3ac4311379'),
(221, 221, 1, NULL, NULL, 1, '2020-12-11 21:26:49', '2020-12-11 21:26:49', 'edcd19ea-3c08-4ff2-9b88-cecddea51943'),
(222, 222, 1, NULL, NULL, 1, '2020-12-11 21:28:39', '2020-12-11 21:28:39', 'e412c9dd-c5b9-4bfa-a284-67a9024a744b'),
(223, 223, 1, 'mission-statement', 'about/mission-statement', 1, '2020-12-11 21:28:39', '2020-12-11 21:28:39', 'f83557ad-f9e8-476b-b25e-a7b475e3f240'),
(224, 224, 1, NULL, NULL, 1, '2020-12-11 21:28:40', '2020-12-11 21:28:40', 'ac242207-7609-46dd-81ad-6dcfa74c6aee'),
(225, 225, 1, NULL, NULL, 1, '2020-12-11 21:28:40', '2020-12-11 21:28:40', '7ebd9fab-ffce-4ba5-bf9c-75f8548ef2b2'),
(226, 226, 1, NULL, NULL, 1, '2020-12-11 21:28:40', '2020-12-11 21:28:40', '65dd1312-00ab-4a6d-a39e-39432c765699'),
(227, 227, 1, NULL, NULL, 1, '2020-12-11 21:28:40', '2020-12-11 21:28:40', '2c84316c-a06e-4169-b3b1-57f780c1e806'),
(228, 228, 1, NULL, NULL, 1, '2020-12-11 21:28:40', '2020-12-11 21:28:40', '4acc0667-ddd6-4731-8503-c7e8b66ba4b4'),
(229, 229, 1, NULL, NULL, 1, '2020-12-11 21:28:40', '2020-12-11 21:28:40', 'd5233f7f-309b-48e4-a6ad-6f014e4660f5'),
(230, 230, 1, NULL, NULL, 1, '2020-12-11 21:28:40', '2020-12-11 21:28:40', 'f42ebe7c-15d3-4be4-beb0-a62e440304da'),
(231, 231, 1, NULL, NULL, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', 'b1df7d2c-6f63-41c3-8cb9-95d46f227405'),
(232, 232, 1, NULL, NULL, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '08decd0b-f096-4520-9bd7-e69e2a24c0fe'),
(233, 233, 1, NULL, NULL, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '49f7dba2-2190-4920-b392-19cb1787a4a6'),
(234, 234, 1, NULL, NULL, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', 'd548bce2-58b9-4b2c-b9ba-0103fce00a16'),
(235, 235, 1, NULL, NULL, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', 'dbd463dc-bb33-40e3-b978-cb4263ca8cea'),
(236, 236, 1, NULL, NULL, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '45e7f521-10ba-4626-9d7a-e6a02ffbe5fc'),
(237, 237, 1, NULL, NULL, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', 'a80219a1-abad-4f6e-9b16-c160d2c343d1'),
(238, 238, 1, NULL, NULL, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', 'b1685666-8dc4-4337-9a82-714e8f6edfd6'),
(239, 239, 1, 'greetings', 'about/greetings', 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '9ff8811d-5cfc-4df9-95cf-2ad870dc634e'),
(240, 240, 1, NULL, NULL, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '72019a22-765e-448c-94f0-715f82a417bc'),
(241, 241, 1, NULL, NULL, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '4886462e-36f6-4964-a92c-35d57751128f'),
(242, 242, 1, NULL, NULL, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '75abf1f0-d9ac-4fc8-aaff-b52dd958f65e'),
(243, 243, 1, NULL, NULL, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '803a0aea-bea6-4d6f-97b4-d6669400532c'),
(244, 244, 1, NULL, NULL, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '20718396-a243-423f-a090-4f9f62cfc302'),
(245, 245, 1, NULL, NULL, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '5f5eb5d3-c9b0-49df-8763-06c30ef62096'),
(246, 246, 1, NULL, NULL, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '98f08186-b2f0-4f1b-912a-da8918e5a910'),
(247, 247, 1, NULL, NULL, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '6a25d6d5-ce24-44c9-af44-3c90ea8468f5'),
(248, 248, 1, NULL, NULL, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', 'cf53311f-6840-4ee3-9498-e1a3b887ab1d'),
(249, 249, 1, NULL, NULL, 1, '2020-12-12 05:53:26', '2020-12-12 05:53:26', 'a1eb68ec-bc6d-4acf-9428-406a5b9a03ce'),
(250, 250, 1, NULL, NULL, 1, '2020-12-12 05:53:26', '2020-12-12 05:53:26', '1ce1243e-4d61-4cdb-9905-0aace73fcf4b'),
(251, 251, 1, 'greetings', 'about/greetings', 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '6cd28049-1914-4d47-9f3c-c17ca1af1bf5'),
(252, 252, 1, NULL, NULL, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'fb944b72-c4f4-48ca-86cf-ada335db36ca'),
(253, 253, 1, NULL, NULL, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '812a7bf2-83f4-483a-b9a2-600b8759ebf3'),
(254, 254, 1, NULL, NULL, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '0b64ad3a-861a-4818-a287-766cd30c984e'),
(255, 255, 1, NULL, NULL, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'c573ae2a-c646-4b9b-8408-3f0e949015ad'),
(256, 256, 1, NULL, NULL, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '10742807-9cf2-41ce-a66e-de4d52385abe'),
(257, 257, 1, NULL, NULL, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '91888521-c30f-46a8-8214-e1f7b577ad2f'),
(258, 258, 1, NULL, NULL, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '1fa188e4-060d-47d0-8492-bd31a3c5f9ed'),
(259, 259, 1, NULL, NULL, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'bd588ba9-de69-4274-9821-605fc8745ce9'),
(260, 260, 1, NULL, NULL, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'da124914-740c-4477-aea7-7f2fdc601e29'),
(261, 261, 1, NULL, NULL, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '115e26b1-dc9b-4876-9bbb-c9c406ae2313'),
(262, 262, 1, NULL, NULL, 1, '2020-12-12 05:56:31', '2020-12-12 05:56:31', '163dd357-fef8-444a-a79e-f55caef2dae8'),
(263, 263, 1, NULL, NULL, 1, '2020-12-12 06:12:24', '2020-12-12 06:12:24', 'ba98d0a2-4b79-4804-a57d-84dc08e8a4be'),
(264, 264, 1, NULL, NULL, 1, '2020-12-12 06:12:25', '2020-12-12 06:12:25', '33c2934c-ecc7-4ff9-8556-872b853ca050'),
(265, 265, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-12 06:12:25', '2020-12-12 06:12:25', 'b2224f82-e1d8-492c-82df-fbfd6e2bf80a'),
(266, 266, 1, NULL, NULL, 1, '2020-12-12 06:12:26', '2020-12-12 06:12:26', 'fbe26d93-9e15-4e8b-bb7d-96e5c863c910'),
(267, 267, 1, NULL, NULL, 1, '2020-12-12 06:12:26', '2020-12-12 06:12:26', 'd140f043-659e-4b86-bc6b-6c30099dfeeb'),
(268, 268, 1, NULL, NULL, 1, '2020-12-12 06:18:17', '2020-12-12 06:18:17', '95115182-4aef-4925-a4de-6cc81a14a76f'),
(269, 269, 1, NULL, NULL, 1, '2020-12-12 06:18:17', '2020-12-12 06:18:17', 'e442b215-3833-40cb-89b8-6b16feaa5fc1'),
(270, 270, 1, 'examinations', 'academics/examinations', 1, '2020-12-12 06:18:17', '2020-12-12 06:18:17', '444db48b-8e64-4d21-bfb4-fac83f97bde3'),
(271, 271, 1, NULL, NULL, 1, '2020-12-12 06:18:18', '2020-12-12 06:18:18', 'b953f4ba-4f9a-4c18-9115-f006315a5a74'),
(272, 272, 1, NULL, NULL, 1, '2020-12-12 06:18:18', '2020-12-12 06:18:18', '1193c5c0-6cea-453f-858c-af00533df0aa'),
(273, 273, 1, NULL, NULL, 1, '2020-12-12 06:22:48', '2020-12-12 06:22:48', '9cee96f2-4e53-47c7-a4e8-a9fd0d1ffc68'),
(274, 274, 1, 'fee-structure', 'admissions/fee-structure', 1, '2020-12-12 06:22:48', '2020-12-12 06:22:48', '9a7c403d-45ae-4972-89bb-400d281e1419'),
(275, 275, 1, NULL, NULL, 1, '2020-12-12 06:22:49', '2020-12-12 06:22:49', 'd417090a-047c-43cc-9709-48894e3f760e'),
(276, 276, 1, NULL, NULL, 1, '2020-12-12 06:26:26', '2020-12-12 06:26:26', '28449df8-f374-4ac7-858a-e2d848089aa9'),
(277, 277, 1, NULL, NULL, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '719cef29-3a62-45cb-a065-2b9d71003658'),
(278, 278, 1, NULL, NULL, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '09edfa30-0f7b-41a8-8fe4-39674d87cf7b'),
(279, 279, 1, NULL, NULL, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '25f5b586-bd2f-4025-8c62-0d5037b2c401'),
(280, 280, 1, NULL, NULL, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', 'f1bbaf3b-2721-403f-8307-c7cb0a7a6415'),
(281, 281, 1, NULL, NULL, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '63474e75-8b8b-4414-8b61-b6b7112c20a8'),
(282, 282, 1, NULL, NULL, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '2f859513-5933-4ce8-bc37-c35e999e333d'),
(283, 283, 1, 'fee-structure', 'admissions/fee-structure', 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', 'b27b3a3b-06ec-4c37-a7f6-2a5b450397a4'),
(284, 284, 1, NULL, NULL, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '23c42928-b86c-4bfb-9db2-09bb7fd812b1'),
(285, 285, 1, NULL, NULL, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '551e0b27-4bb2-49b0-aa52-f2ad9585a390'),
(286, 286, 1, NULL, NULL, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '9f4282f1-f365-4240-a650-ae003863f00b'),
(287, 287, 1, NULL, NULL, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '36736fa5-7177-4608-bfa0-a6fff1e728f2'),
(288, 288, 1, NULL, NULL, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', 'd256680b-e330-4397-ae29-12a203e562b1'),
(289, 289, 1, NULL, NULL, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '5559e319-6d71-481b-9a1a-472eabdf2353'),
(290, 290, 1, NULL, NULL, 1, '2020-12-12 06:26:28', '2020-12-12 06:26:28', '5f128976-648b-4727-b5e1-06f9793df3da'),
(291, 291, 1, NULL, NULL, 1, '2020-12-12 06:26:28', '2020-12-12 06:26:28', '3da810a8-dd64-4471-933f-e4fbce1ac55c'),
(292, 292, 1, NULL, NULL, 1, '2020-12-12 06:40:54', '2020-12-12 06:40:54', '57f53016-6c6d-4745-b6c4-44b21eff6d3f'),
(293, 293, 1, NULL, NULL, 1, '2020-12-12 06:40:55', '2020-12-12 06:40:55', '7067ea2e-2645-4dc9-9669-6f6f0de42613'),
(294, 294, 1, NULL, NULL, 1, '2020-12-12 06:40:55', '2020-12-12 06:40:55', 'c07187b8-cdef-4c81-9008-592093543228'),
(295, 295, 1, NULL, NULL, 1, '2020-12-12 06:40:55', '2020-12-12 06:40:55', '658eecb7-eba3-4d28-972b-234d389773af'),
(296, 296, 1, NULL, NULL, 1, '2020-12-12 06:40:56', '2020-12-12 06:40:56', '32f75f76-ee4a-4a9c-8d86-d0c088026b44'),
(297, 297, 1, NULL, NULL, 1, '2020-12-12 06:40:56', '2020-12-12 06:40:56', '1c432699-0537-4835-b942-6afc38685555'),
(298, 298, 1, NULL, NULL, 1, '2020-12-12 06:40:56', '2020-12-12 06:40:56', '0f251cb8-af71-4e7e-acc9-f301d2c00c3a'),
(299, 299, 1, NULL, NULL, 1, '2020-12-12 06:40:56', '2020-12-12 06:40:56', 'e0aa8761-8194-4476-8c55-bf35016b3104'),
(300, 300, 1, NULL, NULL, 1, '2020-12-12 06:40:56', '2020-12-12 06:40:56', 'fe364638-b7f5-4d5e-ad56-731a9aa6a1a1'),
(301, 301, 1, NULL, NULL, 1, '2020-12-12 06:40:56', '2020-12-12 06:40:56', '4691c7d7-b638-4361-bf38-522ca2e7fedc'),
(302, 302, 1, 'scholarship', 'admissions/scholarship', 1, '2020-12-12 06:40:56', '2020-12-12 06:40:56', '5dee78cc-1f16-4694-a74c-f9e790fb1e82'),
(303, 303, 1, NULL, NULL, 1, '2020-12-12 06:40:56', '2020-12-12 06:40:56', '979b3c6f-e93f-408c-bbd8-ccd3908ac7a6'),
(304, 304, 1, NULL, NULL, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', 'a1129e5a-9300-4bf1-a6a4-e1c8deb8b9f0'),
(305, 305, 1, NULL, NULL, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '569b372e-1ad8-45ab-a6a3-b0b3f7dd5ab7'),
(306, 306, 1, NULL, NULL, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', 'a14a794a-3631-463b-8e8e-18b93670fd16'),
(307, 307, 1, NULL, NULL, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', 'aaa85f71-43e0-48a7-8eba-d23ef6dbcf4d'),
(308, 308, 1, NULL, NULL, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '34ec3b27-4748-4397-97b1-bb5ab913b857'),
(309, 309, 1, NULL, NULL, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', 'bf8f4c6f-e4a8-42ca-ab1b-efa811f35d6e'),
(310, 310, 1, NULL, NULL, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', 'ffa5c892-96cf-4f1e-ba4e-b9051dde2006'),
(311, 311, 1, NULL, NULL, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', 'c9072c11-e377-4013-8d0a-7831db66b12b'),
(312, 312, 1, NULL, NULL, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', 'fcf501b1-2329-46d6-9703-b8027386a635'),
(313, 313, 1, NULL, NULL, 1, '2020-12-12 06:41:31', '2020-12-12 06:41:31', 'a5e51ff8-8b48-40f9-b235-c5aff776349f'),
(314, 314, 1, 'scholarship', 'admissions/scholarship', 1, '2020-12-12 06:41:31', '2020-12-12 06:41:31', 'a188d010-2986-45e0-ba10-5269a0f8ae29'),
(315, 315, 1, NULL, NULL, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'a9f840ea-ac3e-4e32-9a80-14c6b0911942'),
(316, 316, 1, NULL, NULL, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '29fdf5e6-4110-4b60-888e-fb672994adad'),
(317, 317, 1, NULL, NULL, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'cb83c29f-a792-41b6-a44d-760770f6f7ee'),
(318, 318, 1, NULL, NULL, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '2d126b3d-abb3-41fc-85cc-7bb66e520a81'),
(319, 319, 1, NULL, NULL, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'b048ac2b-f37d-4c63-a765-4e7a1397566c'),
(320, 320, 1, NULL, NULL, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '28a44ebf-e925-4ac5-875d-c567962d2dec'),
(321, 321, 1, NULL, NULL, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'e95d8e6b-ec95-47be-9d61-2673ff6f8001'),
(322, 322, 1, NULL, NULL, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'b1517d0e-7aa8-43fb-b67c-b9e345977eea'),
(323, 323, 1, NULL, NULL, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '0add2643-a22d-4d63-8923-acfe6753536c'),
(324, 324, 1, NULL, NULL, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'a61f7328-2efd-45e9-9038-976cdbc922b4'),
(325, 325, 1, NULL, NULL, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'a4265895-e7f4-4c41-86bb-5079f2e69f45'),
(326, 326, 1, NULL, NULL, 1, '2020-12-12 06:54:25', '2020-12-12 06:54:25', '9164f9e5-d468-4a8c-a27b-ebe8506971fd'),
(327, 327, 1, NULL, NULL, 1, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '629f45f1-0f18-459c-b2d4-7219b0896763'),
(328, 328, 1, NULL, NULL, 1, '2020-12-12 06:54:26', '2020-12-12 06:54:26', 'de5a1894-d1af-4e84-8507-bc1210911d35'),
(329, 329, 1, NULL, NULL, 1, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '5c44985a-534a-400a-868a-fd2843deee6b'),
(330, 330, 1, NULL, NULL, 1, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '181c1238-be21-4d52-8bb4-1ea962f31b62'),
(331, 331, 1, 'schools', 'academics/schools', 1, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '816e204e-f2c4-435c-93c6-62c8cf34afa6'),
(332, 332, 1, NULL, NULL, 1, '2020-12-12 06:54:26', '2020-12-12 06:54:26', 'c42cc7f1-dfe8-4bc2-a3f3-e037a418011b'),
(333, 333, 1, NULL, NULL, 1, '2020-12-12 06:54:26', '2020-12-12 06:54:26', 'c585851f-f726-4939-bdf6-90fba0aad992'),
(334, 334, 1, NULL, NULL, 1, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '3d6affd9-e562-4a6c-b335-c7f5f0de3e4d'),
(335, 335, 1, NULL, NULL, 1, '2020-12-12 06:54:26', '2020-12-12 06:54:26', 'f8a58feb-415a-48c6-bd72-40fe9618e3d4'),
(336, 336, 1, NULL, NULL, 1, '2020-12-12 06:54:27', '2020-12-12 06:54:27', '7ab54d77-0278-4285-b733-2cdd3f0be28e'),
(337, 337, 1, 'schools', 'academics/schools', 1, '2020-12-12 06:55:53', '2020-12-12 06:55:53', '88d5c430-e7a6-412b-a2c8-ed4498421cc7'),
(338, 338, 1, NULL, NULL, 1, '2020-12-12 06:55:53', '2020-12-12 06:55:53', 'ed9f472c-ce43-40dd-bcef-482847c86c61'),
(339, 339, 1, NULL, NULL, 1, '2020-12-12 06:55:53', '2020-12-12 06:55:53', '8a8b4f73-a31c-46ec-9800-bc000c6768a5'),
(340, 340, 1, NULL, NULL, 1, '2020-12-12 06:55:54', '2020-12-12 06:55:54', '357ec975-8af9-4004-9465-3126db44d1b1'),
(341, 341, 1, NULL, NULL, 1, '2020-12-12 06:55:54', '2020-12-12 06:55:54', '8166d10e-5a49-42e1-80f4-d7c7fbae555a'),
(342, 342, 1, NULL, NULL, 1, '2020-12-12 06:55:54', '2020-12-12 06:55:54', '57d164bd-8c9e-44b7-919b-95b7c8e47341'),
(343, 343, 1, NULL, NULL, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '3f522aeb-1c7d-4db8-8f9f-e3783f204813'),
(344, 344, 1, NULL, NULL, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '769a4699-eb9f-4cbb-8f69-86d923ef0c5c'),
(345, 345, 1, NULL, NULL, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '2b816c85-b8f6-4dd5-851b-c4bc86a06e54'),
(346, 346, 1, NULL, NULL, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '96fd604d-365e-4d58-be82-1facc53ed2d5'),
(347, 347, 1, 'schools', 'academics/schools', 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', 'b565a5a8-59bc-4921-bf35-a08a24037fe2'),
(348, 348, 1, NULL, NULL, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '66c500c8-15f6-4cc2-b177-1ef3f4b66918'),
(349, 349, 1, NULL, NULL, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', 'b3a4621a-0d1c-476e-9c51-11e56bab2c23'),
(350, 350, 1, NULL, NULL, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '13aad497-956b-40a0-9e0b-bf229574cc3b'),
(351, 351, 1, NULL, NULL, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', 'a9d4a1ff-654f-441e-97d6-d0a963c0ff0f'),
(352, 352, 1, NULL, NULL, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', 'b0d81312-7aaf-44f7-b337-0b822649249a'),
(353, 353, 1, NULL, NULL, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '965f84aa-c0ea-4365-8dca-037b12226b90'),
(354, 354, 1, NULL, NULL, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '34119b05-402a-4488-9fa6-f822d08043d1'),
(355, 355, 1, NULL, NULL, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '4157ae37-32ff-4ddf-a6d0-0a68eb134c79'),
(356, 356, 1, NULL, NULL, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '4438cf3a-a283-4c51-8aff-3128508e5d81'),
(357, 357, 1, NULL, NULL, 1, '2020-12-12 07:04:30', '2020-12-12 07:04:30', '0775acbe-bf76-4532-964e-6e8431a44829'),
(358, 358, 1, NULL, NULL, 1, '2020-12-12 07:04:30', '2020-12-12 07:04:30', 'b319da7b-c9e3-4d33-8347-0c40bbf65e36'),
(359, 359, 1, NULL, NULL, 1, '2020-12-12 07:04:30', '2020-12-12 07:04:30', 'c0be4429-36ac-44ef-88d0-012850d68fec'),
(360, 360, 1, NULL, NULL, 1, '2020-12-12 07:04:30', '2020-12-12 07:04:30', '853d9b99-1971-4f8b-a90e-8312826c15fc'),
(361, 361, 1, NULL, NULL, 1, '2020-12-12 07:04:30', '2020-12-12 07:04:30', 'd4501692-7d92-4a6e-805b-37e5630e3b3d'),
(362, 362, 1, NULL, NULL, 1, '2020-12-12 07:04:30', '2020-12-12 07:04:30', '8cac738f-9aa2-48a9-8293-0ceee5989926'),
(363, 363, 1, 'schools', 'academics/schools', 1, '2020-12-12 07:04:30', '2020-12-12 07:04:30', 'd3dc6f78-879b-4242-b86e-f3e939770832'),
(364, 364, 1, NULL, NULL, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'd04c1685-aee9-4800-9bf0-196d9f8928fd'),
(365, 365, 1, NULL, NULL, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '483c01ca-8c57-4e7a-8667-63292e1df4dd'),
(366, 366, 1, NULL, NULL, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '86f9c1a0-4554-4221-83ab-6ee133741511'),
(367, 367, 1, NULL, NULL, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'ea614c45-66bf-41a9-a435-dd05a93f1085'),
(368, 368, 1, NULL, NULL, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '81779132-73c5-4193-a4e3-6277415115c8'),
(369, 369, 1, NULL, NULL, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'b49155de-11e2-4679-a67f-39cd42a6345b'),
(370, 370, 1, NULL, NULL, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '591e612a-21c1-49f3-80c8-b22de1266c1d'),
(371, 371, 1, NULL, NULL, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '78011512-06df-4fb2-a567-239b56c7ef61'),
(372, 372, 1, NULL, NULL, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '0035effd-b2df-4443-aef2-2a8f88838a38'),
(373, 373, 1, NULL, NULL, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '4fe21709-c349-4b1d-a405-106166ed6f0e'),
(374, 374, 1, NULL, NULL, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '6c02ac6f-1c73-40cf-893b-5d1f56aef6a4'),
(375, 375, 1, NULL, NULL, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '6310845e-4a9b-4776-8033-95f7ce55731d'),
(376, 376, 1, NULL, NULL, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '8d2af450-b9fe-45db-978f-4d40e39acb1a'),
(377, 377, 1, NULL, NULL, 1, '2020-12-12 07:04:32', '2020-12-12 07:04:32', '9c4430da-a0b0-48a5-88a2-ec4bf3ae804b'),
(378, 378, 1, NULL, NULL, 1, '2020-12-12 07:04:32', '2020-12-12 07:04:32', 'deb87aed-f9bf-484c-9f33-32dd18cf0a47'),
(379, 379, 1, NULL, NULL, 1, '2020-12-12 07:06:33', '2020-12-12 07:06:33', 'e831ccba-0825-4169-91f8-266f987df745'),
(380, 380, 1, NULL, NULL, 1, '2020-12-12 07:06:33', '2020-12-12 07:06:33', '70025dc0-f543-44c6-b95c-545683bb4da5'),
(381, 381, 1, NULL, NULL, 1, '2020-12-12 07:06:33', '2020-12-12 07:06:33', 'a475714e-1c4b-4b7e-88bc-ab50d7fd9616'),
(382, 382, 1, 'schools', 'academics/schools', 1, '2020-12-12 07:06:33', '2020-12-12 07:06:33', '33d0f5b8-9625-4050-9677-e2fa78d81b01'),
(383, 383, 1, NULL, NULL, 1, '2020-12-12 07:06:33', '2020-12-12 07:06:33', '1b8c6dc0-ffb8-4040-8ef0-033cd6d4c3c7'),
(384, 384, 1, NULL, NULL, 1, '2020-12-12 07:06:33', '2020-12-12 07:06:33', 'c07684c8-4a38-42f8-bb0c-481f9bb1e2e9'),
(385, 385, 1, NULL, NULL, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '7ac953bd-9f0a-4c3a-b76e-f0d54beb275e'),
(386, 386, 1, NULL, NULL, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '15e0f05b-be93-47b9-a97b-55ac2688c393'),
(387, 387, 1, NULL, NULL, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '536fae59-2455-4fcf-91e0-1e8b291fb9b0'),
(388, 388, 1, NULL, NULL, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '6582f37b-230b-406b-8855-dc84dc50fa2a'),
(389, 389, 1, NULL, NULL, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '8e703f1a-c5cc-4451-8448-5089bbfeb5bb'),
(390, 390, 1, NULL, NULL, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '735458d4-2be4-45cf-a87a-ec8a8e9b337c'),
(391, 391, 1, NULL, NULL, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '26bea18d-c9b3-43e3-a3e6-e3aaa2a4d004'),
(392, 392, 1, NULL, NULL, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '86ffa148-468c-4c32-a3ed-1ead90a32742'),
(393, 393, 1, NULL, NULL, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', 'ef5410e3-a612-4749-8bea-6c588965c840'),
(394, 394, 1, NULL, NULL, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '029462aa-6e19-474f-b33e-e7ff0d47c1a5'),
(395, 395, 1, NULL, NULL, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '79bda67d-d4c7-4f56-8094-478044218a0b'),
(396, 396, 1, NULL, NULL, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', 'd7176098-0d55-4e4f-b30c-c08438cb6848'),
(397, 397, 1, NULL, NULL, 1, '2020-12-12 07:06:35', '2020-12-12 07:06:35', 'd73838f0-c034-4cb2-9d19-40b669c50db6'),
(398, 398, 1, NULL, NULL, 1, '2020-12-12 07:06:35', '2020-12-12 07:06:35', '932e79dc-c0b3-4011-812d-8a724e12c5b5'),
(399, 399, 1, NULL, NULL, 1, '2020-12-12 07:06:35', '2020-12-12 07:06:35', '3d8a9748-143e-47fe-8c06-024a42ff65f1'),
(400, 400, 1, NULL, NULL, 1, '2020-12-12 07:06:35', '2020-12-12 07:06:35', '9ff33ecb-b696-4910-b072-cfed29deadd4'),
(401, 401, 1, NULL, NULL, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '5966fc9d-be65-492e-8fb3-7eb8f1107988'),
(402, 402, 1, NULL, NULL, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', 'f5bd8981-8959-41a8-888f-22d9a98a7acb'),
(403, 403, 1, NULL, NULL, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '2c591de9-ae67-43a4-876f-d80d3cfa5748'),
(404, 404, 1, NULL, NULL, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '5f9799ba-16a1-402b-8621-c2f93c61a264'),
(405, 405, 1, NULL, NULL, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '8d14cbc8-e777-42e0-bc67-fadc09011668'),
(406, 406, 1, NULL, NULL, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '5aba19f1-4e03-43f8-9928-0150141eff80'),
(407, 407, 1, NULL, NULL, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '3030c566-a6ea-4a02-82f4-30f8b2741333'),
(408, 408, 1, NULL, NULL, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', '4691e088-3421-4fcc-9995-1642fdf8dd0a'),
(409, 409, 1, NULL, NULL, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', '8bbe1bbe-5d88-4ef0-a5f3-606d2ff4661e'),
(410, 410, 1, NULL, NULL, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', 'e9fd68f7-1a57-4bfe-8a7e-60943e0e3839'),
(411, 411, 1, NULL, NULL, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', 'ab723ab9-84d2-4f91-adc2-a8e788a207a4'),
(412, 412, 1, NULL, NULL, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', '448dd6e5-8e0a-4a12-9d94-2670c71bcdc8'),
(413, 413, 1, NULL, NULL, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', '5dbea364-4029-4d9f-a6b3-a495355c9c10'),
(414, 414, 1, NULL, NULL, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', '9ce9ef36-38dc-4220-9446-a1d3e074ed2e'),
(415, 415, 1, NULL, NULL, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', 'f9d8f918-01f7-4723-a8cc-82bec3f435da'),
(416, 416, 1, 'schools', 'academics/schools', 1, '2020-12-12 07:17:31', '2020-12-12 07:17:31', 'e6a01f38-c6fe-4408-9a0c-ec89452cd9cb'),
(417, 417, 1, NULL, NULL, 1, '2020-12-12 07:17:31', '2020-12-12 07:17:31', 'f2260961-dde3-4ae0-b96f-87bf189754bb'),
(418, 418, 1, NULL, NULL, 1, '2020-12-12 07:17:31', '2020-12-12 07:17:31', '6437e751-067f-495a-8757-190714b5374c'),
(419, 419, 1, NULL, NULL, 1, '2020-12-12 07:17:31', '2020-12-12 07:17:31', '42bbd241-8781-4009-b44b-94d7d1eef57b'),
(420, 420, 1, NULL, NULL, 1, '2020-12-12 07:17:31', '2020-12-12 07:17:31', '06cf1409-da82-4b94-92f4-b8d7f42fc20e'),
(421, 421, 1, NULL, NULL, 1, '2020-12-12 07:17:31', '2020-12-12 07:17:31', 'c3b68d31-3a9b-4fb9-8178-8968aae5da5f'),
(422, 422, 1, NULL, NULL, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '5e32a5bc-e806-4950-b877-e748dc1f56f5'),
(423, 423, 1, NULL, NULL, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'c6569a53-80a0-4f08-81f9-8caf703ad0a4'),
(424, 424, 1, NULL, NULL, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '1645b82a-1518-43ba-a3be-c1b433f570ff'),
(425, 425, 1, NULL, NULL, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '03300c08-7a81-454e-92a6-69878b197652'),
(426, 426, 1, NULL, NULL, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'e3670e55-28d3-4187-a6e2-c6f561129196'),
(427, 427, 1, NULL, NULL, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'd4375e19-cd36-4d1a-827e-135e558c7f9e'),
(428, 428, 1, NULL, NULL, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'cf69fc98-bb6e-43aa-9921-ee21b12d9b05'),
(429, 429, 1, NULL, NULL, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'c0811d0d-cd0c-4ba4-b3c4-247dac7f6a8f'),
(430, 430, 1, NULL, NULL, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '931ea97a-4e44-4fe7-a42e-20d63facad36'),
(431, 431, 1, NULL, NULL, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'd9f8d970-2758-4b68-9fda-a37be7350f72'),
(432, 432, 1, NULL, NULL, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'a39c1b90-f0eb-4639-9534-76c4990b43f4'),
(433, 433, 1, NULL, NULL, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '976e801e-e596-4ae0-92cb-6ef0e2b33c12'),
(434, 434, 1, NULL, NULL, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', '8c214e28-ca5b-474d-9573-c3724b34a3a7'),
(435, 435, 1, NULL, NULL, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', '9ad3c6ec-accc-4014-ba4a-56051cde0dd9'),
(436, 436, 1, NULL, NULL, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', 'ebbc0ec4-f5bb-4248-b4d9-0e79f0784b88'),
(437, 437, 1, NULL, NULL, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', 'e5b85b9a-c2a7-4f82-9b35-2165ec786e2b');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(438, 438, 1, NULL, NULL, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', 'c321c653-045a-4186-a02f-8dd34690e139'),
(439, 439, 1, NULL, NULL, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', 'be61f1ab-0497-49f8-8e12-83152058f2b6'),
(440, 440, 1, NULL, NULL, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', '7662c9ae-fbfa-449f-bf95-25035b3cba02'),
(441, 441, 1, NULL, NULL, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', 'e2eee6bb-f0e8-41f0-9465-71185255386f'),
(442, 442, 1, NULL, NULL, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', 'bf1d6d80-014b-4b7f-9937-a67d62c78266'),
(443, 443, 1, NULL, NULL, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '73836977-04b7-46b4-9b96-d76d7ff639b6'),
(444, 444, 1, NULL, NULL, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '950ef3c4-9789-4f1d-a46f-5ab65d2150d4'),
(445, 445, 1, NULL, NULL, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', 'be97e684-0a85-49a5-af9a-3f9c469fb7e4'),
(446, 446, 1, NULL, NULL, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '4e1ebe85-cabf-4cd0-89ab-d61542183701'),
(447, 447, 1, NULL, NULL, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', 'e3978de4-9859-4fc2-ab00-ac4424baaa87'),
(448, 448, 1, NULL, NULL, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '7c58b420-dbc1-4522-a268-019788ff75c8'),
(449, 449, 1, NULL, NULL, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '4b3a0fc4-0194-4ecc-9f24-b3677d7d98d2'),
(450, 450, 1, 'schools', 'academics/schools', 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '03494b11-12fc-4863-8ef8-8608fd7c5601'),
(451, 451, 1, NULL, NULL, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '4c4706dd-d7f1-4150-bb68-02e08260d41f'),
(452, 452, 1, NULL, NULL, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '3b2f3bf9-3b8e-4a77-8071-edc34a1b8581'),
(453, 453, 1, NULL, NULL, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '29886dd9-f3c8-4403-96c9-ac03b259998b'),
(454, 454, 1, NULL, NULL, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', 'ff327b14-d334-41cc-98d3-066e6acb1fb7'),
(455, 455, 1, NULL, NULL, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '7ab68251-5005-48d0-b234-4b10e9d09885'),
(456, 456, 1, NULL, NULL, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '0ccdecea-7caf-4d74-9729-7a91e1b02039'),
(457, 457, 1, NULL, NULL, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', 'f88a86bb-2d33-4adc-b866-318dbb4bcba5'),
(458, 458, 1, NULL, NULL, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', 'e3f9997f-ac8e-422d-a160-80870b86814e'),
(459, 459, 1, NULL, NULL, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '4f5c85cc-f301-4343-b95d-8cd3b962c45a'),
(460, 460, 1, NULL, NULL, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '1757bee3-2995-46d0-8177-025a8e6e7bd1'),
(461, 461, 1, NULL, NULL, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '87919098-cd9d-49a1-b3cb-cbf26ff42b6e'),
(462, 462, 1, NULL, NULL, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', 'e7e53d89-597e-4c20-b9ec-5e8884f908a6'),
(463, 463, 1, NULL, NULL, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', 'b16d298a-ac16-4c41-8f59-ec6da542fbe9'),
(464, 464, 1, NULL, NULL, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '2cc4a2c3-6b8b-4434-892e-b6d4f343d50b'),
(465, 465, 1, NULL, NULL, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '675999a1-2f77-4dec-8dd8-c83a8bebf60a'),
(466, 466, 1, NULL, NULL, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '8fd55959-11b7-4951-ba59-cdc1cebab426'),
(467, 467, 1, NULL, NULL, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', 'c94a6b12-724f-487c-a54f-59031cec6c8f'),
(468, 468, 1, NULL, NULL, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '7d5085a1-ea3f-4b76-8731-b7ec9bf303e7'),
(469, 469, 1, NULL, NULL, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', 'b36c0ec6-e8ef-49a7-a7bd-eff5b10c142d'),
(470, 470, 1, NULL, NULL, 1, '2020-12-12 07:20:33', '2020-12-12 07:20:33', '4213db0b-9cc1-4a0a-9246-9aa581e32455'),
(471, 471, 1, NULL, NULL, 1, '2020-12-12 07:20:33', '2020-12-12 07:20:33', 'fccf51e0-2b4f-4f11-82ea-a09ba883990b'),
(472, 472, 1, NULL, NULL, 1, '2020-12-12 07:20:33', '2020-12-12 07:20:33', 'f9a70322-305a-4d81-a7e8-15bff313ae22'),
(473, 473, 1, NULL, NULL, 1, '2020-12-12 07:20:34', '2020-12-12 07:20:34', '28647bb6-0f19-477c-809b-4aa5d82fa9db'),
(474, 474, 1, NULL, NULL, 1, '2020-12-12 07:20:34', '2020-12-12 07:20:34', 'dc98750d-e77f-4e70-b2c2-d7a02ed07499'),
(475, 475, 1, NULL, NULL, 1, '2020-12-12 07:20:34', '2020-12-12 07:20:34', '8ca32643-996d-496f-a7e4-17e28194c69e'),
(476, 476, 1, NULL, NULL, 1, '2020-12-12 07:20:34', '2020-12-12 07:20:34', '642ec5b6-89b7-4b83-81a1-ad9bf4653877'),
(477, 477, 1, NULL, NULL, 1, '2020-12-12 07:20:34', '2020-12-12 07:20:34', '97067a1e-d69b-44f3-8383-4b468acb583e'),
(478, 478, 1, NULL, NULL, 1, '2020-12-12 07:20:34', '2020-12-12 07:20:34', '019fd091-2fcc-4ca1-be85-2d3de3d08176'),
(479, 479, 1, NULL, NULL, 1, '2020-12-12 07:20:35', '2020-12-12 07:20:35', 'a30be9f3-78b9-4a48-8f76-46f45fc98c26'),
(480, 480, 1, NULL, NULL, 1, '2020-12-12 07:20:35', '2020-12-12 07:20:35', '7f42b982-afcb-4ad4-beb3-c7ef73cd6a92'),
(481, 481, 1, NULL, NULL, 1, '2020-12-12 07:20:35', '2020-12-12 07:20:35', '29a7f003-d943-4c3c-93c5-b82b798c9216'),
(482, 482, 1, NULL, NULL, 1, '2020-12-12 07:20:35', '2020-12-12 07:20:35', 'ae82d42c-1d93-459b-abd0-cdbcd9cd8340'),
(483, 483, 1, NULL, NULL, 1, '2020-12-12 07:20:35', '2020-12-12 07:20:35', '6163b507-8793-4fab-9780-131a7ea4a15b'),
(484, 484, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-12 07:40:33', '2020-12-12 07:40:33', '5bf36641-aeab-405e-a1fe-d55150a07064'),
(485, 485, 1, NULL, NULL, 1, '2020-12-12 07:40:34', '2020-12-12 07:40:34', '86d233de-b2f1-48bf-bf0d-bcd5c373812a'),
(486, 486, 1, NULL, NULL, 1, '2020-12-12 07:40:34', '2020-12-12 07:40:34', 'd64ec7c5-fde6-43cd-a527-6d19a9d87453'),
(487, 487, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-12 07:43:17', '2020-12-12 07:43:17', '3bf4b927-0190-40b2-a9c0-78eb93b376d4'),
(488, 488, 1, NULL, NULL, 1, '2020-12-12 07:43:17', '2020-12-12 07:43:17', 'd96875e2-6824-43d0-a531-c441fde0dfe3'),
(489, 489, 1, NULL, NULL, 1, '2020-12-12 07:43:17', '2020-12-12 07:43:17', 'cb32dfaa-9388-4145-b89e-114d2c432a34'),
(490, 490, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-12 08:02:34', '2020-12-12 08:02:34', 'ae5c9997-8efc-4cf0-84e1-a0cac106d5bd'),
(491, 491, 1, NULL, NULL, 1, '2020-12-12 08:02:35', '2020-12-12 08:02:35', 'a49b7403-6b5e-4bb9-b7b4-06a4032a14bf'),
(492, 492, 1, NULL, NULL, 1, '2020-12-12 08:02:35', '2020-12-12 08:02:35', 'ab361858-8fba-427d-a50b-93b411652799'),
(493, 493, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-12 08:47:31', '2020-12-12 08:47:31', '0aca50a6-7939-4f0a-b10b-aae085064501'),
(494, 494, 1, NULL, NULL, 1, '2020-12-12 08:47:32', '2020-12-12 08:47:32', 'e275d1b8-db93-4caf-a01f-81e75025a922'),
(495, 495, 1, NULL, NULL, 1, '2020-12-12 08:51:43', '2020-12-12 08:51:43', '0d9766c7-657e-4261-997f-b63baad1eadc'),
(496, 496, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-12 08:51:43', '2020-12-12 08:51:43', '694213ad-a29a-4aef-ace1-f82790fa0a25'),
(497, 497, 1, NULL, NULL, 1, '2020-12-12 08:51:43', '2020-12-12 08:51:43', 'f72ee4c8-1112-4a3d-b470-dec73e9a0df3'),
(498, 498, 1, NULL, NULL, 1, '2020-12-12 08:51:43', '2020-12-12 08:51:43', '6f2e860d-1771-44cf-92ec-1dbb3ad3bc47'),
(499, 499, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-12 08:55:31', '2020-12-12 08:55:31', 'da4b7de5-bc8c-412a-9d8d-06e790d5460f'),
(500, 500, 1, NULL, NULL, 1, '2020-12-12 08:55:32', '2020-12-12 08:55:32', 'c6ea9762-290d-4dec-9012-7399ed645375'),
(501, 501, 1, NULL, NULL, 1, '2020-12-12 08:55:32', '2020-12-12 08:55:32', '0f893fe6-53ac-46b4-8540-58ec9add4c6f'),
(502, 502, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-12 08:58:02', '2020-12-12 08:58:02', 'ad60a9bf-bc41-4112-83e8-5c3fb12a8c35'),
(503, 503, 1, NULL, NULL, 1, '2020-12-12 08:58:02', '2020-12-12 08:58:02', 'e19893a6-9185-48ac-a224-5192d4dd08af'),
(504, 504, 1, NULL, NULL, 1, '2020-12-12 08:58:02', '2020-12-12 08:58:02', '6d61c596-4c81-4656-9cf8-faf91a28b59e'),
(505, 505, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-12 08:58:45', '2020-12-12 08:58:45', 'dc590947-0ac5-4fb0-a063-39aebcdca120'),
(506, 506, 1, NULL, NULL, 1, '2020-12-12 08:58:45', '2020-12-12 08:58:45', '3c9cc35d-12f1-4c6b-8ec8-0f692fc86051'),
(507, 507, 1, NULL, NULL, 1, '2020-12-12 08:58:45', '2020-12-12 08:58:45', 'b50b3c0c-4f3c-4c71-903c-56a7659818e0'),
(508, 508, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-12 09:00:20', '2020-12-12 09:00:20', '82f4066c-1be1-4b60-9ff9-a30c36fdf0c5'),
(509, 509, 1, NULL, NULL, 1, '2020-12-12 09:00:20', '2020-12-12 09:00:20', 'd2285467-77ac-4627-82c3-9ec18332ea5d'),
(510, 510, 1, NULL, NULL, 1, '2020-12-12 09:00:21', '2020-12-12 09:00:21', '5fb70612-eb5d-4215-8d18-1522a7023a93'),
(511, 511, 1, 'exam-schedule', 'academics/exam-schedule', 1, '2020-12-12 09:01:11', '2020-12-12 09:01:11', '03f44599-450a-4ae7-adaf-0dfe6c1aab57'),
(512, 512, 1, NULL, NULL, 1, '2020-12-12 09:01:11', '2020-12-12 09:01:11', 'b59130eb-0de9-4d5e-8ee3-c39e2624ecd3'),
(513, 513, 1, NULL, NULL, 1, '2020-12-12 09:01:11', '2020-12-12 09:01:11', 'c0444e70-6839-440e-8ce4-dc0faeb1c94f'),
(514, 514, 1, 'fee-structure', 'admissions/fee-structure', 1, '2020-12-12 09:09:50', '2020-12-12 09:09:50', '6ea93d29-bd63-4ba2-b6d4-32e8601fa00c'),
(515, 515, 1, NULL, NULL, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '60aa6a6f-85c6-4cf4-9348-0bdb933e71b4'),
(516, 516, 1, NULL, NULL, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '0fb937a6-4859-4c98-b11e-0e3259ab1b91'),
(517, 517, 1, NULL, NULL, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', 'cca0bc56-5c47-4922-8da9-f9a1024f9a16'),
(518, 518, 1, NULL, NULL, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '8000901d-c536-4c1a-ba59-09cab09759a0'),
(519, 519, 1, NULL, NULL, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '23467754-2285-4c6c-9905-a987c8e3083b'),
(520, 520, 1, NULL, NULL, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '08b175bf-8e00-499e-b7d1-5d7c56a618fd'),
(521, 521, 1, NULL, NULL, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '9ddaf227-0719-4b6b-8d7a-5f406dab4a2d'),
(522, 522, 1, NULL, NULL, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '1b24490f-557b-4060-b847-6eaa8b8a3c61');

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
(61, 16, NULL, 16, 1, '2020-12-08 15:57:00', NULL, 0, '2020-12-08 15:57:28', '2020-12-08 15:57:28', '87558e0c-f11a-4b8b-9161-a0887ed2483b'),
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
(107, 16, 61, 16, 1, '2020-12-08 18:44:00', NULL, 0, '2020-12-08 18:44:43', '2020-12-08 18:44:43', '7b35ce0a-f5e0-40e9-a0c2-2ee2732a9638'),
(108, 16, NULL, 16, 1, '2020-12-08 18:44:00', NULL, NULL, '2020-12-08 18:44:43', '2020-12-08 18:44:43', '18596753-69b0-48b5-8c11-71f28ef997ae'),
(110, 16, 61, 16, 1, '2020-12-08 18:44:00', NULL, 0, '2020-12-08 18:45:19', '2020-12-08 18:45:19', '39187a33-706a-4a6b-9f2b-1e879f83cf52'),
(111, 16, NULL, 16, 1, '2020-12-08 18:44:00', NULL, NULL, '2020-12-08 18:45:19', '2020-12-08 18:45:19', 'f4f06488-c980-4e52-8b9c-345350e60005'),
(114, 1, NULL, 1, NULL, '2020-12-02 10:53:00', NULL, NULL, '2020-12-08 20:12:37', '2020-12-08 20:12:37', '99183a2a-eaf2-46c5-911b-6e0908618c1b'),
(119, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '1ccf494a-2838-49e7-b1f5-996a06fcb22e'),
(125, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-11 20:30:45', '2020-12-11 20:30:45', 'a3f15ee5-b1e4-4807-9d1d-0e29bdae3d15'),
(128, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-11 20:31:55', '2020-12-11 20:31:55', '2d1ee5d2-8b5b-48ed-bec3-9ff94d6a9a76'),
(131, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-11 20:49:48', '2020-12-11 20:49:48', '2dec17ce-915d-4d49-a83f-7ff2e8a62972'),
(133, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-11 20:52:01', '2020-12-11 20:52:01', '4520a5fe-7445-4f1e-8490-adf09a3905b2'),
(137, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-11 20:55:16', '2020-12-11 20:55:16', '4f1a24f5-4fe1-48b3-a38a-7e7ae8a92a28'),
(142, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-11 20:57:07', '2020-12-11 20:57:07', '5099f95b-7686-46d2-931b-be0acde809d0'),
(153, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '1e74350b-5d03-4689-bce9-499b9586fdae'),
(165, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'bb8eea15-5d0c-4d7b-aa1d-4f8e6473608d'),
(184, 16, NULL, 16, 1, '2020-12-08 15:44:00', NULL, NULL, '2020-12-11 21:16:21', '2020-12-11 21:16:21', 'f7f2c746-73dc-41d2-b3ba-cfe46b23b4c8'),
(192, 16, NULL, 16, 1, '2020-12-08 15:44:00', NULL, NULL, '2020-12-11 21:17:20', '2020-12-11 21:17:20', '23fb0f46-f300-455b-a1b2-7ba051f349d1'),
(207, 16, NULL, 16, 1, '2020-12-08 15:44:00', NULL, NULL, '2020-12-11 21:26:47', '2020-12-11 21:26:47', '77ac7feb-401d-4b38-ba7e-3bd20751f38e'),
(223, 16, NULL, 16, 1, '2020-12-08 15:44:00', NULL, NULL, '2020-12-11 21:28:39', '2020-12-11 21:28:39', 'd119c38e-f377-49c1-92c8-870bc7cb0a20'),
(239, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-12 05:53:25', '2020-12-12 05:53:25', 'b648199b-3091-4220-a5cf-22382fd413d2'),
(251, 16, NULL, 16, 1, '2020-12-08 15:43:00', NULL, NULL, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '7551a9c4-aa56-4a9a-a4a3-4311cc0b7afb'),
(265, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-12 06:12:25', '2020-12-12 06:12:25', '4507fa30-3efa-46d4-9724-40a25f61a443'),
(270, 16, NULL, 16, 1, '2020-12-08 15:53:00', NULL, NULL, '2020-12-12 06:18:17', '2020-12-12 06:18:17', '412bc37e-18f7-46f5-9811-cc23b600eb4f'),
(274, 16, NULL, 16, 1, '2020-12-08 15:55:00', NULL, NULL, '2020-12-12 06:22:48', '2020-12-12 06:22:48', 'a37de00f-f5dd-4522-b7dc-d5be6dbc9c47'),
(283, 16, NULL, 16, 1, '2020-12-08 15:55:00', NULL, NULL, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '29bd3cb2-1d08-4fd5-977a-f26fc396d7fd'),
(302, 16, NULL, 16, 1, '2020-12-08 15:56:00', NULL, NULL, '2020-12-12 06:40:56', '2020-12-12 06:40:56', 'd73a380e-afcd-488a-a684-aa4b15d63df5'),
(314, 16, NULL, 16, 1, '2020-12-08 15:56:00', NULL, NULL, '2020-12-12 06:41:31', '2020-12-12 06:41:31', '95d935f3-6d0d-45a7-84d2-f70b6a9cef58'),
(331, 16, NULL, 16, 1, '2020-12-08 15:51:00', NULL, NULL, '2020-12-12 06:54:26', '2020-12-12 06:54:26', 'a01edd34-f040-4221-b3ae-c37a048758fb'),
(337, 16, NULL, 16, 1, '2020-12-08 15:51:00', NULL, NULL, '2020-12-12 06:55:53', '2020-12-12 06:55:53', '8d360203-534a-4583-af98-4bb586f458ea'),
(347, 16, NULL, 16, 1, '2020-12-08 15:51:00', NULL, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '28fff27d-7a9c-4eb0-8056-bd46a2618373'),
(363, 16, NULL, 16, 1, '2020-12-08 15:51:00', NULL, NULL, '2020-12-12 07:04:30', '2020-12-12 07:04:30', '24b0fe87-8d5c-4150-b4a4-e9965458cb30'),
(382, 16, NULL, 16, 1, '2020-12-08 15:51:00', NULL, NULL, '2020-12-12 07:06:33', '2020-12-12 07:06:33', '834cddeb-6738-4bed-ab7e-afdb1214ab50'),
(416, 16, NULL, 16, 1, '2020-12-08 15:51:00', NULL, NULL, '2020-12-12 07:17:31', '2020-12-12 07:17:31', '904879ba-3a31-45ed-a51d-83b8bf40a60e'),
(450, 16, NULL, 16, 1, '2020-12-08 15:51:00', NULL, NULL, '2020-12-12 07:20:31', '2020-12-12 07:20:31', 'aa4aa081-b016-4d42-bb42-6ddf789a393a'),
(484, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-12 07:40:33', '2020-12-12 07:40:33', 'c2988d59-1694-4aa7-baaa-edf3da0bc846'),
(487, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-12 07:43:17', '2020-12-12 07:43:17', 'f1ea4d94-04b8-431f-910e-cb61c4ca04d7'),
(490, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-12 08:02:34', '2020-12-12 08:02:34', '4be5fd66-b378-4eca-a92e-5e19d7eb7af3'),
(493, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-12 08:47:31', '2020-12-12 08:47:31', '92274061-7983-47b6-85c4-60d1a1d48cf8'),
(496, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-12 08:51:43', '2020-12-12 08:51:43', '819b6a35-aa8f-4eb8-a111-75efeb42d6e7'),
(499, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-12 08:55:31', '2020-12-12 08:55:31', 'e7482a28-41e2-4fc0-b88c-ef8f8c08f299'),
(502, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-12 08:58:02', '2020-12-12 08:58:02', 'a510fc57-c5ed-4cf3-9f79-0ca3fd8004c6'),
(505, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-12 08:58:45', '2020-12-12 08:58:45', '7aa436b4-f2f5-4938-934a-9b8d46506d33'),
(508, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-12 09:00:20', '2020-12-12 09:00:20', '917685db-28a1-4155-b5d0-91013d53b3de'),
(511, 16, NULL, 16, 1, '2020-12-08 15:52:00', NULL, NULL, '2020-12-12 09:01:11', '2020-12-12 09:01:11', '33e8c16c-d204-4d4f-bda7-bf2b3d224db1'),
(514, 16, NULL, 16, 1, '2020-12-08 15:55:00', NULL, NULL, '2020-12-12 09:09:50', '2020-12-12 09:09:50', 'fa5619d1-f5de-424c-99d7-27564790d285');

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
(3, 'pages', '2020-12-11 14:36:34', '2020-12-11 14:36:34', '5bcd0203-19a2-4abc-af8a-aef6269e6b40');

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
(37, 16, 39, 17, 0, 1, '2020-12-11 14:42:33', '2020-12-11 14:42:33', '0a69d0f1-a59a-4ad3-9799-369063cfb13e'),
(61, 25, 59, 18, 0, 0, '2020-12-12 08:49:17', '2020-12-12 08:49:17', 'cb96f4d1-3e1d-4d99-9de0-37dbb15c8ee1'),
(62, 26, 60, 19, 0, 0, '2020-12-12 08:49:18', '2020-12-12 08:49:18', '926cf255-202a-4784-8ba0-0d529d2021e0'),
(63, 27, 61, 20, 0, 0, '2020-12-12 08:49:20', '2020-12-12 08:49:20', '3e7efedd-b60d-48c3-bed4-095ef1b34289');

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
(19, 'craft\\elements\\MatrixBlock', '2020-12-08 17:21:56', '2020-12-08 17:21:56', '2020-12-11 14:25:38', '513dba55-c96d-407d-8afa-26dbc57ca2ca'),
(20, 'craft\\elements\\GlobalSet', '2020-12-08 17:23:10', '2020-12-08 17:23:10', NULL, '9693dd27-4435-4e32-97b5-94f24073ba7f'),
(21, 'craft\\elements\\MatrixBlock', '2020-12-08 18:00:15', '2020-12-08 18:00:15', '2020-12-11 14:25:30', '61e7d1ba-cf48-4d72-8297-3d2170b75080'),
(22, 'craft\\elements\\MatrixBlock', '2020-12-08 18:15:35', '2020-12-08 18:15:35', '2020-12-11 14:25:32', '931853e6-2b82-4542-9593-f899e4a17b8a'),
(23, 'craft\\elements\\MatrixBlock', '2020-12-08 18:25:00', '2020-12-08 18:25:00', '2020-12-11 14:25:36', 'cdb435cb-31d0-4ec3-a596-acb75043007c'),
(24, 'craft\\elements\\MatrixBlock', '2020-12-08 18:39:32', '2020-12-08 18:39:32', '2020-12-11 14:25:48', '3244b2f3-7266-4b65-be84-f5d3d93b7735'),
(25, 'craft\\elements\\MatrixBlock', '2020-12-11 14:42:01', '2020-12-11 14:42:01', NULL, 'fe7e1ecb-e18d-4099-b14b-a9e74ec95f95'),
(26, 'craft\\elements\\MatrixBlock', '2020-12-11 14:42:02', '2020-12-11 14:42:02', NULL, 'aa9476bc-98c8-4f32-8488-c0bf9890c737'),
(27, 'craft\\elements\\MatrixBlock', '2020-12-12 06:02:37', '2020-12-12 06:02:37', NULL, '35c8ef8c-7749-4feb-b978-014c2520b0df'),
(28, 'craft\\elements\\MatrixBlock', '2020-12-12 07:38:19', '2020-12-12 07:38:19', '2020-12-12 07:42:00', '06e75a00-616c-4712-8777-f1b4eb31d7a0');

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
(22, 19, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"46dbcdd3-a122-40e4-86c3-f5e780561716\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"cce6938a-8167-4c99-ac15-e86f2abc2b1f\"}]', 1, '2020-12-08 17:21:56', '2020-12-08 17:21:56', '1ddc3356-f772-40bb-b4bf-30cf3590efdf'),
(31, 21, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"9c6ac610-ed30-42a2-b993-62ca6086aab0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"7d20c2fd-4b78-4e3f-a7ab-f50550446508\"}]', 1, '2020-12-08 18:39:50', '2020-12-08 18:39:50', '0eca0f24-5ba2-44b8-8ebb-6f7b5f2668d2'),
(32, 22, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"2d8244ee-b607-4607-9b49-6200c414c7f1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"0fab4496-80b3-4ab7-b2ee-414de4b12e5d\"}]', 1, '2020-12-08 18:40:09', '2020-12-08 18:40:09', 'd2a76235-2d6c-4dd8-a305-6216cfa30af0'),
(33, 23, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"6dd039e4-fb62-4d70-ada3-4f6fce6921d8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4664af46-0a8c-47d6-ac5f-f116da7c7104\"}]', 1, '2020-12-08 18:40:31', '2020-12-08 18:40:31', '843609ec-f18c-421e-a41c-f90c19e9725f'),
(34, 24, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"ea2653e0-0488-467b-9089-ae51d28f1f33\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"559a17c2-fd93-49ac-b202-3e136746596e\"}]', 1, '2020-12-08 18:40:46', '2020-12-08 18:40:46', 'b9d11394-cd71-4247-818d-7346c0f5225c'),
(35, 20, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"971de349-e94d-4322-8b0d-00ad46dc89dc\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c9f4341b-ab6b-4ec6-a90a-d530baa43734\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"734e77de-9fcf-443c-8e0d-0a2512ab8676\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"80672d7d-1690-47a4-904e-14e353770526\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0348ab67-1309-4352-b4c7-50d888e4193f\"}]', 1, '2020-12-08 18:41:34', '2020-12-08 18:41:34', '15470770-8339-40e5-a697-60f5c0e03322'),
(39, 16, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":\"Page title\",\"instructions\":\"\",\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3cbe8045-904b-49bb-ac50-4926692bbaaf\"}]', 1, '2020-12-11 14:42:33', '2020-12-11 14:42:33', 'bf68646a-ef95-4ded-9bca-117598a62748'),
(46, 28, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"241214b5-1896-4326-a694-84078792a4d9\"}]', 1, '2020-12-12 07:38:19', '2020-12-12 07:38:19', 'e0698fc5-438c-46c9-9e6a-6380b3cae8fa'),
(59, 25, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c4abaacd-d898-499d-a4b2-c07043287716\"}]', 1, '2020-12-12 08:49:17', '2020-12-12 08:49:17', 'fcfdfbd0-9d31-4270-8aa1-62b302caedf8'),
(60, 26, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e\"}]', 1, '2020-12-12 08:49:17', '2020-12-12 08:49:17', '0d58603c-3079-4a07-a0f3-fb7f77c6f751'),
(61, 27, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"87d40e09-ebd6-43fd-a04c-f10c36136d34\"}]', 1, '2020-12-12 08:49:20', '2020-12-12 08:49:20', '18b1a007-c6bb-43cb-8b52-1c3a92f07469');

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
(17, 3, 'Body Content', 'bodyContent', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_bodycontent}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2020-12-11 14:42:01', '2020-12-11 14:42:01', '3cbe8045-904b-49bb-ac50-4926692bbaaf'),
(18, NULL, 'heading', 'heading', 'matrixBlockType:373eed9d-2892-44c3-9762-094eb392c34a', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-11 14:42:01', '2020-12-11 14:42:01', 'c4abaacd-d898-499d-a4b2-c07043287716'),
(19, NULL, 'text', 'text', 'matrixBlockType:6c38c618-958b-4b50-971b-36ad786f4a09', '', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"Simple.json\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}', '2020-12-11 14:42:02', '2020-12-11 14:42:02', 'e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e'),
(20, NULL, 'Links', 'links', 'matrixBlockType:7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe', '', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}', '2020-12-12 06:02:37', '2020-12-12 08:43:57', '87d40e09-ebd6-43fd-a04c-f10c36136d34');

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
(1, '3.5.16', '3.5.13', 0, 'wffdtualejiw', 'fitpqfssinkn', '2020-12-02 10:43:05', '2020-12-12 08:49:20', 'b3876e5d-ef6c-4d26-b725-df99efb8f4bd');

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
(115, 24, 17, 6, 1, 0, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '9eba156e-65fe-4d8f-8b42-098f29f2aab4'),
(116, 24, 17, 7, 2, 0, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '20983621-a96f-4b84-b8dc-a57b5d468c27'),
(117, 24, 17, 6, 3, 0, '2020-12-11 14:43:07', '2020-12-11 14:43:07', 'eba3abf0-860e-4cdf-aa04-3e77ed0339c0'),
(118, 24, 17, 7, 4, 0, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '56a4a7d1-4485-4da9-b19b-3e4ad1de7217'),
(120, 119, 17, 6, 1, NULL, '2020-12-11 14:43:07', '2020-12-11 14:43:07', 'e6691582-ef6c-4b3b-8c0c-e334c83f00b8'),
(121, 119, 17, 7, 2, NULL, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '777b91fd-2cd0-4f24-997a-aa903b224225'),
(122, 119, 17, 6, 3, NULL, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '89513cef-0d73-4b49-b86f-842b3ddc16ca'),
(123, 119, 17, 7, 4, NULL, '2020-12-11 14:43:08', '2020-12-11 14:43:08', '701965a8-a68d-448a-8070-327e6d0b80b1'),
(124, 24, 17, 7, 2, NULL, '2020-12-11 20:30:45', '2020-12-11 20:57:07', '634b50ad-c6b1-4b0d-a3c9-3cfdb43b299b'),
(126, 125, 17, 6, 1, NULL, '2020-12-11 20:30:46', '2020-12-11 20:30:46', '8c893644-3e1e-4acf-903b-ca16f60833b8'),
(127, 125, 17, 7, 2, NULL, '2020-12-11 20:30:46', '2020-12-11 20:30:46', '4b2137eb-4e6e-4ee6-bae8-744d2efad797'),
(129, 128, 17, 6, 1, NULL, '2020-12-11 20:31:55', '2020-12-11 20:31:55', 'a0b8f0fb-b949-4b07-b7c9-5a4a007e9884'),
(130, 128, 17, 7, 2, NULL, '2020-12-11 20:31:55', '2020-12-11 20:31:55', 'e420fff7-ce02-4658-803c-09b909c34561'),
(132, 131, 17, 7, 1, NULL, '2020-12-11 20:49:48', '2020-12-11 20:49:48', 'b430815f-54d6-4bf1-9abf-e79d7ac02a49'),
(134, 133, 17, 7, 1, NULL, '2020-12-11 20:52:02', '2020-12-11 20:52:02', '84e08723-ecab-497b-8870-f800e682454a'),
(135, 24, 17, 7, 3, NULL, '2020-12-11 20:55:16', '2020-12-11 20:57:07', '87996955-5d8c-4584-bdfa-35d34821ebc5'),
(136, 24, 17, 7, 4, NULL, '2020-12-11 20:55:16', '2020-12-11 20:57:07', '763d934c-0e3b-4c08-b214-369313786288'),
(138, 137, 17, 7, 1, NULL, '2020-12-11 20:55:16', '2020-12-11 20:55:16', 'a74d0e46-963f-4584-933a-62f8e9bedfbe'),
(139, 137, 17, 7, 2, NULL, '2020-12-11 20:55:16', '2020-12-11 20:55:16', '997e1b8e-30a2-4b5c-a1bc-b7f79ef531d0'),
(140, 137, 17, 7, 3, NULL, '2020-12-11 20:55:16', '2020-12-11 20:55:16', '810bbd1b-a17e-4f15-976a-e124536596d5'),
(141, 24, 17, 6, 1, NULL, '2020-12-11 20:57:07', '2020-12-11 20:57:07', '62c0fab9-b95c-4a38-8d21-fa1f9cef7813'),
(143, 142, 17, 6, 1, NULL, '2020-12-11 20:57:07', '2020-12-11 20:57:07', 'b8033f9e-bc18-444d-9f65-c2d81059fcd0'),
(144, 142, 17, 7, 2, NULL, '2020-12-11 20:57:07', '2020-12-11 20:57:07', '391c5561-7cb7-43af-b5fa-01f5fc9c1736'),
(145, 142, 17, 7, 3, NULL, '2020-12-11 20:57:08', '2020-12-11 20:57:08', '54e58482-92df-47d1-984c-aa670dc1cbff'),
(146, 142, 17, 7, 4, NULL, '2020-12-11 20:57:08', '2020-12-11 20:57:08', 'f23c2eaa-9f3b-457d-96fe-b6686a419f53'),
(147, 24, 17, 6, 6, NULL, '2020-12-11 21:07:13', '2020-12-11 21:08:31', 'd779d069-8675-4397-958d-a61b25527cec'),
(148, 24, 17, 7, 7, NULL, '2020-12-11 21:07:13', '2020-12-11 21:08:31', '4f4fa1df-f4d9-41f6-b523-2c918a8a13e6'),
(149, 24, 17, 7, 8, NULL, '2020-12-11 21:07:13', '2020-12-11 21:08:31', 'af09f1dd-19f6-4a62-963f-abef86cc12a2'),
(150, 24, 17, 7, 9, NULL, '2020-12-11 21:07:14', '2020-12-11 21:08:31', '6d607302-6a39-4e34-951b-926e9c96fe48'),
(151, 24, 17, 7, 10, NULL, '2020-12-11 21:07:14', '2020-12-11 21:08:31', '3028882e-c4a1-47db-b9ed-3ecc98880c83'),
(152, 24, 17, 7, 11, NULL, '2020-12-11 21:07:14', '2020-12-11 21:08:32', '7ab5859e-50eb-4cf6-b39d-f253a4b4915a'),
(154, 153, 17, 6, 1, NULL, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '6a7bfa88-b91c-4d92-acd0-487198552595'),
(155, 153, 17, 7, 2, NULL, '2020-12-11 21:07:14', '2020-12-11 21:07:14', 'ea21860f-55a0-49ac-b2f3-79c954eca51f'),
(156, 153, 17, 7, 3, NULL, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '963673a1-221b-44cd-bdd6-afaaa7abda26'),
(157, 153, 17, 7, 4, NULL, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '680d1770-5550-4f46-8db3-8c6f31471500'),
(158, 153, 17, 6, 5, NULL, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '0985de32-d284-49ab-830c-217805619850'),
(159, 153, 17, 7, 6, NULL, '2020-12-11 21:07:14', '2020-12-11 21:07:14', 'dda8bd89-c97c-4a4a-b825-f734c53a6b5a'),
(160, 153, 17, 7, 7, NULL, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '566e4570-3622-4576-b9a7-52c98992c296'),
(161, 153, 17, 7, 8, NULL, '2020-12-11 21:07:15', '2020-12-11 21:07:15', '44887d0d-f59c-46aa-ba96-f2092b0e83dc'),
(162, 153, 17, 7, 9, NULL, '2020-12-11 21:07:15', '2020-12-11 21:07:15', 'c56d7503-2f88-48d7-95f8-afe0b2f1fa09'),
(163, 153, 17, 7, 10, NULL, '2020-12-11 21:07:15', '2020-12-11 21:07:15', '31cacc92-8d1c-4974-92fb-909731d2e72b'),
(164, 24, 17, 7, 5, NULL, '2020-12-11 21:08:31', '2020-12-11 21:08:31', 'a61e7f28-6aea-4c5f-941b-33751963f206'),
(166, 165, 17, 6, 1, NULL, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '3e8d0ea9-0871-4698-b6e2-d4063800fb65'),
(167, 165, 17, 7, 2, NULL, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'bc0d85de-db9a-4e60-b3ca-10ece4c2aa82'),
(168, 165, 17, 7, 3, NULL, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '9f7221ab-1dcf-4414-849b-2931433c3218'),
(169, 165, 17, 7, 4, NULL, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '8a8ecd46-66bb-4703-bb4f-d029686c3c58'),
(170, 165, 17, 7, 5, NULL, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '4916c57e-3d80-47d9-805b-48b147f1ca58'),
(171, 165, 17, 6, 6, NULL, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '15e67440-3c40-410e-84da-b44a35a7f493'),
(172, 165, 17, 7, 7, NULL, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'c320c0a9-2b9d-4395-bd68-ffd923e09a8c'),
(173, 165, 17, 7, 8, NULL, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'a0952a3d-8332-410b-ae8e-69f33dc9f29d'),
(174, 165, 17, 7, 9, NULL, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '760f634b-5bc7-436d-972c-3288409216cb'),
(175, 165, 17, 7, 10, NULL, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '8820b37a-63d4-4c92-a535-b956f89ad554'),
(176, 165, 17, 7, 11, NULL, '2020-12-11 21:08:33', '2020-12-11 21:08:33', '29378077-ce18-4463-8bab-c1833d13fa91'),
(177, 27, 17, 6, 1, NULL, '2020-12-11 21:16:21', '2020-12-11 21:16:21', '8f370922-e284-4c58-84f2-a3c4141a583c'),
(178, 27, 17, 7, 2, NULL, '2020-12-11 21:16:21', '2020-12-11 21:16:21', 'd1a55350-c391-489d-af80-31a34bbd284f'),
(179, 27, 17, 7, 3, NULL, '2020-12-11 21:16:21', '2020-12-11 21:16:21', '62c3f3b4-5b17-4b71-b0e7-e64f13be0e46'),
(180, 27, 17, 6, 4, NULL, '2020-12-11 21:16:21', '2020-12-11 21:16:21', '03742036-ac9f-4f08-89ee-9f6a32cc2095'),
(181, 27, 17, 7, 5, NULL, '2020-12-11 21:16:21', '2020-12-11 21:16:21', '72a9ab1e-e29b-46a5-b04a-c500fcd90849'),
(182, 27, 17, 7, 7, NULL, '2020-12-11 21:16:21', '2020-12-11 21:17:20', 'cdde42d3-d6f2-4570-a5fc-61cd48204fa8'),
(183, 27, 17, 6, 6, NULL, '2020-12-11 21:16:21', '2020-12-11 21:17:20', '4afe42f1-f0e0-40d1-9c08-b8a697fa6986'),
(185, 184, 17, 6, 1, NULL, '2020-12-11 21:16:21', '2020-12-11 21:16:21', 'd074ffb2-79c7-43b9-9ad8-e718fd2fa7f2'),
(186, 184, 17, 7, 2, NULL, '2020-12-11 21:16:21', '2020-12-11 21:16:21', 'a1ef112e-3f17-47b2-b944-a390f2a9e0f9'),
(187, 184, 17, 7, 3, NULL, '2020-12-11 21:16:21', '2020-12-11 21:16:21', '4e8c8a16-b2bc-4910-a3ec-ec0351486b77'),
(188, 184, 17, 6, 4, NULL, '2020-12-11 21:16:22', '2020-12-11 21:16:22', 'a82bc2a2-544c-4800-9c59-269050067573'),
(189, 184, 17, 7, 5, NULL, '2020-12-11 21:16:22', '2020-12-11 21:16:22', '22a330c3-52a3-4660-a410-aa92e00ebcd3'),
(190, 184, 17, 7, 6, NULL, '2020-12-11 21:16:22', '2020-12-11 21:16:22', '588da1c3-9c7b-4da7-be2b-7568038f9389'),
(191, 184, 17, 6, 7, NULL, '2020-12-11 21:16:22', '2020-12-11 21:16:22', 'ad3bad49-5f65-40d0-b5f2-4331ddd74cc3'),
(193, 192, 17, 6, 1, NULL, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '3dbc5b10-c311-4f87-b1b0-5861f3a7d8d5'),
(194, 192, 17, 7, 2, NULL, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '178d92ca-45f4-4357-8ee0-cc4e644b1205'),
(195, 192, 17, 7, 3, NULL, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '0e96765e-337b-4e57-99fd-4f7d2d0a1129'),
(196, 192, 17, 6, 4, NULL, '2020-12-11 21:17:21', '2020-12-11 21:17:21', 'f48ae013-7dfc-48a4-ae90-f46a854bb12d'),
(197, 192, 17, 7, 5, NULL, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '177bb50c-cb1e-414d-8206-c3692631951a'),
(198, 192, 17, 6, 6, NULL, '2020-12-11 21:17:21', '2020-12-11 21:17:21', 'd25c21f4-e45b-454a-a552-91c52676086a'),
(199, 192, 17, 7, 7, NULL, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '8a28e8fd-ba21-4e7e-9ee6-af006ff51065'),
(200, 27, 17, 6, 9, NULL, '2020-12-11 21:26:47', '2020-12-11 21:28:39', '4726593f-ab73-4596-aca1-1bcb539432d7'),
(201, 27, 17, 7, 10, NULL, '2020-12-11 21:26:47', '2020-12-11 21:28:39', '14e203c0-30ee-424d-a454-5f072d243fc7'),
(202, 27, 17, 7, 11, NULL, '2020-12-11 21:26:47', '2020-12-11 21:28:39', '8a090ee1-3901-4ef9-b956-e0ab8e149931'),
(203, 27, 17, 6, 12, NULL, '2020-12-11 21:26:47', '2020-12-11 21:28:39', '0c340d48-a21f-4430-93bb-c75720c5f55a'),
(204, 27, 17, 7, 13, NULL, '2020-12-11 21:26:47', '2020-12-11 21:28:39', '91ddf871-a110-4c81-a9c9-c256ab62ad64'),
(205, 27, 17, 6, 14, NULL, '2020-12-11 21:26:47', '2020-12-11 21:28:39', '424b1780-0e53-40d1-9bd0-217981e43765'),
(206, 27, 17, 7, 15, NULL, '2020-12-11 21:26:47', '2020-12-11 21:28:39', '2bd5a424-6ae6-49e6-a7de-3b6060b0f6e5'),
(208, 207, 17, 6, 1, NULL, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '3485635d-7394-45bc-80c7-5886acb95bbd'),
(209, 207, 17, 7, 2, NULL, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'd88606a4-6b23-4fc6-bf56-43e08f1280c7'),
(210, 207, 17, 7, 3, NULL, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '3ff63f09-abfb-40fe-ad13-eed514f27465'),
(211, 207, 17, 6, 4, NULL, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'f6573007-5131-4ada-8c7e-836ccad28f52'),
(212, 207, 17, 7, 5, NULL, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '4d7dd73b-0319-4696-8a3d-6e88c63ada66'),
(213, 207, 17, 6, 6, NULL, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'cb0d11e7-1675-4f73-9879-8f5f435385be'),
(214, 207, 17, 7, 7, NULL, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'bac94c70-18ab-491b-8469-bbe427ac9336'),
(215, 207, 17, 6, 8, NULL, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '381fb565-c6b6-4613-a77c-e9efdac91c48'),
(216, 207, 17, 7, 9, NULL, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '32e498fe-abd9-4ad0-a9a0-4e8db04db8eb'),
(217, 207, 17, 7, 10, NULL, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'eb93c848-f405-42d8-bccf-22dde71f86c5'),
(218, 207, 17, 6, 11, NULL, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'f9925835-d7f9-4b05-b53c-d5cd6cf71837'),
(219, 207, 17, 7, 12, NULL, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'f6d08c23-8284-4575-8d66-24de6a682ac6'),
(220, 207, 17, 6, 13, NULL, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '801a5e9a-4d6f-4057-b5c7-a2c00557d2d2'),
(221, 207, 17, 7, 14, NULL, '2020-12-11 21:26:49', '2020-12-11 21:26:49', '43cb28c9-0db8-4be3-af7a-b1e2e6ad3842'),
(222, 27, 17, 6, 8, NULL, '2020-12-11 21:28:39', '2020-12-11 21:28:39', '7a854791-cbdc-43be-bf45-7186caa43253'),
(224, 223, 17, 6, 1, NULL, '2020-12-11 21:28:40', '2020-12-11 21:28:40', '28e09a88-88d5-49f5-88c5-7193289611ff'),
(225, 223, 17, 7, 2, NULL, '2020-12-11 21:28:40', '2020-12-11 21:28:40', '05f351b2-6246-4b32-89dd-539b8fafbfd3'),
(226, 223, 17, 7, 3, NULL, '2020-12-11 21:28:40', '2020-12-11 21:28:40', '8ba38c92-0459-42a1-9e9b-773e1ad641e6'),
(227, 223, 17, 6, 4, NULL, '2020-12-11 21:28:40', '2020-12-11 21:28:40', '4237940c-752f-453d-b03e-527954c2ee18'),
(228, 223, 17, 7, 5, NULL, '2020-12-11 21:28:40', '2020-12-11 21:28:40', '9c604451-24bd-46d4-91a1-f788a43dcc0f'),
(229, 223, 17, 6, 6, NULL, '2020-12-11 21:28:40', '2020-12-11 21:28:40', 'ac4a83af-b566-4d59-87c2-563cd35b655e'),
(230, 223, 17, 7, 7, NULL, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '3298b009-db6f-457e-aed8-d83d1c7a8546'),
(231, 223, 17, 6, 8, NULL, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '43811958-29a4-426d-aab2-5870ab07d21d'),
(232, 223, 17, 6, 9, NULL, '2020-12-11 21:28:41', '2020-12-11 21:28:41', 'fb37083e-037a-4aff-a42a-0fc725ba5127'),
(233, 223, 17, 7, 10, NULL, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '4484ded0-f185-475c-952d-cded1eee9d8a'),
(234, 223, 17, 7, 11, NULL, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '57a6abae-936c-4d35-b7d3-56b84e6a223c'),
(235, 223, 17, 6, 12, NULL, '2020-12-11 21:28:41', '2020-12-11 21:28:41', 'acc02a43-0935-41ac-9b89-b64d8b285e17'),
(236, 223, 17, 7, 13, NULL, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '55099949-6148-47e0-abee-4267c7643352'),
(237, 223, 17, 6, 14, NULL, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '5bdcf321-3b3d-4c9b-8339-a3a37052f8d5'),
(238, 223, 17, 7, 15, NULL, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '902eccb9-f678-4319-8598-f829842f5350'),
(240, 239, 17, 6, 1, NULL, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '866717f8-bf68-4dd0-8a32-ae8579b870e6'),
(241, 239, 17, 7, 2, NULL, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '8aa88d98-79fd-49b8-aea3-ee062cc6f2a8'),
(242, 239, 17, 7, 3, NULL, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '2a8d68c0-18ec-4839-a7a7-9345ee44981b'),
(243, 239, 17, 7, 4, NULL, '2020-12-12 05:53:25', '2020-12-12 05:53:25', 'e53c379c-cbf3-4d53-81bf-33c536b38a63'),
(244, 239, 17, 7, 5, NULL, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '9f777d1d-b10d-49e5-b3ad-2bc67d31a874'),
(245, 239, 17, 6, 6, NULL, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '179be157-46c5-4115-ac70-3c6fdf80473c'),
(246, 239, 17, 7, 7, NULL, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '2893e941-0d56-4d23-956c-d401121776cf'),
(247, 239, 17, 7, 8, NULL, '2020-12-12 05:53:25', '2020-12-12 05:53:25', 'b79eed24-4617-40b3-bc43-eee2c5efe05d'),
(248, 239, 17, 7, 9, NULL, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '04c58b4c-53c5-4097-886e-a146f0d12e9e'),
(249, 239, 17, 7, 10, NULL, '2020-12-12 05:53:26', '2020-12-12 05:53:26', 'c1a05919-bda7-4829-b6bd-426c123386da'),
(250, 239, 17, 7, 11, NULL, '2020-12-12 05:53:26', '2020-12-12 05:53:26', '87da9d2d-6635-46a9-a592-652029f38b37'),
(252, 251, 17, 6, 1, NULL, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'd54e63ac-cb52-4dec-8a8b-1e026d8d3bde'),
(253, 251, 17, 7, 2, NULL, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '04c88964-5a28-4116-855f-fe1419a67371'),
(254, 251, 17, 7, 3, NULL, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '24b5bece-6f39-4aab-9b94-19f6b590d5f9'),
(255, 251, 17, 7, 4, NULL, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'e89f3a00-ef1a-4c64-9664-6db2b144624d'),
(256, 251, 17, 7, 5, NULL, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'ac22b73a-27eb-4739-ab12-f43a425fd39a'),
(257, 251, 17, 6, 6, NULL, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '5aaed5a3-7f8b-437a-a3f2-d93a716bdd6e'),
(258, 251, 17, 7, 7, NULL, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '63c632fb-88e9-4385-87d4-5bd78f3238b7'),
(259, 251, 17, 7, 8, NULL, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'f9d4e06a-3bd5-44ba-881a-f30f60e8bb62'),
(260, 251, 17, 7, 9, NULL, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '069ed212-4b91-424e-bd12-84327533ed30'),
(261, 251, 17, 7, 10, NULL, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '38464380-0db5-4e6a-8398-a35b7e400a28'),
(262, 251, 17, 7, 11, NULL, '2020-12-12 05:56:31', '2020-12-12 05:56:31', '0f294e96-559b-4fce-8d70-a6ef2501a7d6'),
(263, 42, 17, 8, 1, NULL, '2020-12-12 06:12:24', '2020-12-12 06:12:24', '2c16408e-e0c8-48c3-a657-d03c4fec7653'),
(264, 42, 17, 8, 2, 0, '2020-12-12 06:12:25', '2020-12-12 06:12:25', '4c08b797-7e60-4c07-b0b4-9cf17661e3f3'),
(266, 265, 17, 8, 1, NULL, '2020-12-12 06:12:26', '2020-12-12 06:12:26', '36792eae-55fe-42e2-a3b2-39e8a34279f1'),
(267, 265, 17, 8, 2, NULL, '2020-12-12 06:12:26', '2020-12-12 06:12:26', '5b08aff7-7eca-4e40-b0cb-8c9ece115207'),
(268, 45, 17, 8, 1, NULL, '2020-12-12 06:18:17', '2020-12-12 06:18:17', '95726039-9ea8-4a44-9d9b-74e6e45662fe'),
(269, 45, 17, 8, 2, NULL, '2020-12-12 06:18:17', '2020-12-12 06:18:17', '02f6d7a2-923b-4f61-ac3c-d8bfbb71eae4'),
(271, 270, 17, 8, 1, NULL, '2020-12-12 06:18:18', '2020-12-12 06:18:18', '02538eb8-ae58-4954-bb40-96e7d0e2d17b'),
(272, 270, 17, 8, 2, NULL, '2020-12-12 06:18:18', '2020-12-12 06:18:18', '78a9b39a-0566-4f0a-a4bd-0adee402b6b5'),
(273, 54, 17, 8, 1, NULL, '2020-12-12 06:22:48', '2020-12-12 06:22:48', '6c8642d9-d6b3-4055-8fa1-0b9df5923905'),
(275, 274, 17, 8, 1, NULL, '2020-12-12 06:22:49', '2020-12-12 06:22:49', '8c2edc76-55d1-45a1-8567-76cafa10e90a'),
(276, 54, 17, 8, 2, NULL, '2020-12-12 06:26:26', '2020-12-12 06:26:26', '44577204-626a-4674-891e-346dffe4fd62'),
(277, 54, 17, 8, 3, NULL, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '9eb50721-c1da-4486-b7dd-c62a6b055ce2'),
(278, 54, 17, 8, 4, NULL, '2020-12-12 06:26:27', '2020-12-12 06:26:27', 'a41c1df2-f2fb-4ffc-a723-d65a5737f6c2'),
(279, 54, 17, 8, 5, NULL, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '5ac94134-2a39-4565-816a-a8f3379ce291'),
(280, 54, 17, 8, 6, NULL, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '8fdfa275-e679-4ef8-abfa-4e077221c0e5'),
(281, 54, 17, 8, 7, NULL, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '8898c710-1e1c-4295-819f-ab1fa8bff9c1'),
(282, 54, 17, 8, 8, NULL, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '9326117a-d7e7-412e-a16f-3e9a51c815e5'),
(284, 283, 17, 8, 1, NULL, '2020-12-12 06:26:27', '2020-12-12 06:26:27', 'c1971fbd-c9c1-47a8-a814-42c7ff7c191b'),
(285, 283, 17, 8, 2, NULL, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '32f6b18e-40ab-4c7d-add9-558054be3181'),
(286, 283, 17, 8, 3, NULL, '2020-12-12 06:26:27', '2020-12-12 06:26:27', 'e0e0446f-27cb-49a8-8d39-09d289c61fe4'),
(287, 283, 17, 8, 4, NULL, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '4380b9af-f0b0-4ce8-8214-950dd1fc2b26'),
(288, 283, 17, 8, 5, NULL, '2020-12-12 06:26:27', '2020-12-12 06:26:27', 'f30379b0-e922-42a3-a691-ad20274c9c83'),
(289, 283, 17, 8, 6, NULL, '2020-12-12 06:26:27', '2020-12-12 06:26:27', 'e8b6da3b-7814-401e-a97a-1bd1ddfb86cd'),
(290, 283, 17, 8, 7, NULL, '2020-12-12 06:26:28', '2020-12-12 06:26:28', '7530162b-3e2e-4cd5-9bc6-3a8c5a62e9f0'),
(291, 283, 17, 8, 8, NULL, '2020-12-12 06:26:28', '2020-12-12 06:26:28', '3197277f-94b1-4d3e-b6c6-58fa219aa141'),
(292, 58, 17, 6, 1, NULL, '2020-12-12 06:40:54', '2020-12-12 06:40:54', 'bef11a81-c411-4774-add4-2c322e0786d9'),
(293, 58, 17, 7, 2, NULL, '2020-12-12 06:40:55', '2020-12-12 06:40:55', 'e85559e7-4615-4f6e-8ec9-26b36ebe0fe4'),
(294, 58, 17, 6, 3, NULL, '2020-12-12 06:40:55', '2020-12-12 06:40:55', '2f564768-5151-4107-b529-2b1b23cc92b7'),
(295, 58, 17, 7, 4, NULL, '2020-12-12 06:40:55', '2020-12-12 06:40:55', '85d76707-aaf8-47e9-844b-253a339b722a'),
(296, 58, 17, 6, 5, NULL, '2020-12-12 06:40:56', '2020-12-12 06:40:56', '68a175ae-ce78-44c5-9f56-d016a6b879c9'),
(297, 58, 17, 7, 6, NULL, '2020-12-12 06:40:56', '2020-12-12 06:40:56', '5e34ac80-397d-41e9-a998-0f10116ae1ab'),
(298, 58, 17, 6, 7, NULL, '2020-12-12 06:40:56', '2020-12-12 06:40:56', '134bb822-224e-41b4-8859-ef1a9878dda6'),
(299, 58, 17, 7, 8, NULL, '2020-12-12 06:40:56', '2020-12-12 06:40:56', 'b8d90172-5e4f-4b76-bad6-c48815637327'),
(300, 58, 17, 6, 9, NULL, '2020-12-12 06:40:56', '2020-12-12 06:40:56', '0b475bd1-6514-4797-ad39-b79a60a9fd15'),
(301, 58, 17, 7, 10, NULL, '2020-12-12 06:40:56', '2020-12-12 06:40:56', 'e5fd5b04-3d3f-46af-8fb3-4230c073c294'),
(303, 302, 17, 6, 1, NULL, '2020-12-12 06:40:56', '2020-12-12 06:40:56', '34203078-5585-48fd-8d9a-8d2c67a76e23'),
(304, 302, 17, 7, 2, NULL, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '66214f1d-ecbb-49a4-bf1d-78461c0c4e7f'),
(305, 302, 17, 6, 3, NULL, '2020-12-12 06:40:57', '2020-12-12 06:40:57', 'e6965775-d098-45ed-9e4b-6c951b5a504f'),
(306, 302, 17, 7, 4, NULL, '2020-12-12 06:40:57', '2020-12-12 06:40:57', 'b3dcaddb-6164-4de8-a199-5875d91c1c8d'),
(307, 302, 17, 6, 5, NULL, '2020-12-12 06:40:57', '2020-12-12 06:40:57', 'b8a6ab58-2779-41c2-bed9-1f8ba9062c50'),
(308, 302, 17, 7, 6, NULL, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '4b3b556b-1672-4844-80e4-5c4d5d7bf2d4'),
(309, 302, 17, 6, 7, NULL, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '8e2633de-918e-41c7-b93e-3d9c95048df3'),
(310, 302, 17, 7, 8, NULL, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '613d8a19-519b-4257-b662-6cf37bfd5c02'),
(311, 302, 17, 6, 9, NULL, '2020-12-12 06:40:57', '2020-12-12 06:40:57', 'c2e1fbfb-ce02-4b8f-b776-4448d4f7406e'),
(312, 302, 17, 7, 10, NULL, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '6caac70d-4256-4fc9-946d-bd5721afe535'),
(313, 58, 17, 7, 11, NULL, '2020-12-12 06:41:31', '2020-12-12 06:41:31', 'e1db1fe1-75ab-45ae-8e0e-5b5bd9f0c730'),
(315, 314, 17, 6, 1, NULL, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'eb0391a5-dfa7-4596-8381-a4e4c185ae03'),
(316, 314, 17, 7, 2, NULL, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'f75d0e0d-f58f-46cf-9749-ae563914cf67'),
(317, 314, 17, 6, 3, NULL, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '6ec3ec38-6e28-4cfd-b313-b0ab160fce34'),
(318, 314, 17, 7, 4, NULL, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '6123f6a4-9d68-4eb3-a141-db115e43a53a'),
(319, 314, 17, 6, 5, NULL, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '3f53dc74-2c82-4494-a46a-6e410cad5275'),
(320, 314, 17, 7, 6, NULL, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '1375c35a-86e0-40e3-a75a-5017a0769142'),
(321, 314, 17, 6, 7, NULL, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '45738b73-0d2d-41c6-aa95-9f95b96e07db'),
(322, 314, 17, 7, 8, NULL, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '4011a857-3129-434f-aaf6-8aa2b0d22c1a'),
(323, 314, 17, 6, 9, NULL, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '220062c9-14e2-4223-af35-791bdd79a03b'),
(324, 314, 17, 7, 10, NULL, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'a6384b1b-6086-4325-99d9-15f724ac2e20'),
(325, 314, 17, 7, 11, NULL, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '29255180-f94a-4e89-921b-ac82116208e8'),
(326, 39, 17, 6, 1, NULL, '2020-12-12 06:54:25', '2020-12-12 06:54:25', '1f1164e6-c290-49e8-a294-a363e6bd6988'),
(327, 39, 17, 7, 2, NULL, '2020-12-12 06:54:26', '2020-12-12 06:54:26', 'f10545f2-268d-4bf7-863a-e4edd6644c64'),
(328, 39, 17, 7, 3, NULL, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '0e4e05bf-d5b3-4c53-9419-a0cb7d4b1775'),
(329, 39, 17, 7, 4, NULL, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '93a78926-142a-488b-b8a0-9fa33ae817d6'),
(330, 39, 17, 8, 5, NULL, '2020-12-12 06:54:26', '2020-12-12 06:54:26', 'fc66b717-08dd-442a-80fa-c6d99ae76b42'),
(332, 331, 17, 6, 1, NULL, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '8911dffd-cfad-4322-85fd-bed575a55641'),
(333, 331, 17, 7, 2, NULL, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '6b7b939c-3068-4dfc-b0b9-ba86705a125a'),
(334, 331, 17, 7, 3, NULL, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '5dadb388-4b37-43e7-ace1-16793c1ceffe'),
(335, 331, 17, 7, 4, NULL, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '4f1e9b87-e736-4872-891e-e5368f9ebf0f'),
(336, 331, 17, 8, 5, NULL, '2020-12-12 06:54:27', '2020-12-12 06:54:27', 'd37b1383-fb0d-4913-804c-9d99588567b5'),
(338, 337, 17, 6, 1, NULL, '2020-12-12 06:55:53', '2020-12-12 06:55:53', 'ac997dba-20df-4dba-a423-684f12d63caf'),
(339, 337, 17, 7, 2, NULL, '2020-12-12 06:55:53', '2020-12-12 06:55:53', 'd9eb07cc-4057-46cb-8f06-02dfe2e75882'),
(340, 337, 17, 7, 3, NULL, '2020-12-12 06:55:54', '2020-12-12 06:55:54', '34711691-8717-40dc-a613-60be217e0fc4'),
(341, 337, 17, 7, 4, NULL, '2020-12-12 06:55:54', '2020-12-12 06:55:54', '6b3804c6-21bb-4b6c-bffd-c50edd3fda96'),
(342, 337, 17, 8, 5, NULL, '2020-12-12 06:55:54', '2020-12-12 06:55:54', '8bc03333-4db7-449d-a84a-30541feeb53c'),
(343, 39, 17, 6, 6, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', 'd0229c98-f2bc-4f2f-a0d1-8883af84391f'),
(344, 39, 17, 7, 7, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', 'e36feadd-c258-43fb-8f7b-9722d38f60f9'),
(345, 39, 17, 7, 8, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '96f7aedf-7db5-4aed-806d-073420583b17'),
(346, 39, 17, 8, 9, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '0071c9f1-b346-4283-843f-dbe5e3039df8'),
(348, 347, 17, 6, 1, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', 'c733f2ed-e9d4-4c96-9284-95242808906d'),
(349, 347, 17, 7, 2, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '18c7120b-d009-4dd0-a93e-bafccb37361d'),
(350, 347, 17, 7, 3, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '4457672c-f50b-4cb2-b736-9ce4b2a29ee0'),
(351, 347, 17, 7, 4, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '17b16666-7acc-4256-be27-0f9218c4d3ca'),
(352, 347, 17, 8, 5, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', 'f6424ea2-1eb7-4daf-bb84-573c2008e538'),
(353, 347, 17, 6, 6, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', 'c5f4738b-e90c-475d-98dd-5cb9af2c395a'),
(354, 347, 17, 7, 7, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', 'cb304251-458d-4423-9310-3c76866e0557'),
(355, 347, 17, 7, 8, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '66ba87dd-59f7-484d-a11e-77e614adf3d8'),
(356, 347, 17, 8, 9, NULL, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '5dfc479a-82a4-457f-bd3d-7c7daaa8e0ef'),
(357, 39, 17, 6, 10, NULL, '2020-12-12 07:04:30', '2020-12-12 07:04:30', '32a9a421-24c2-42f5-beeb-2da4fe4edff3'),
(358, 39, 17, 7, 11, NULL, '2020-12-12 07:04:30', '2020-12-12 07:04:30', '9604ef15-5b7c-4133-bac4-c658577438f8'),
(359, 39, 17, 7, 12, NULL, '2020-12-12 07:04:30', '2020-12-12 07:04:30', 'ac6f2bd3-89c6-48a5-9421-73c02abe78d7'),
(360, 39, 17, 7, 13, NULL, '2020-12-12 07:04:30', '2020-12-12 07:04:30', 'dfeeae48-a0e7-4bbe-ae0e-419ff5666de9'),
(361, 39, 17, 7, 14, NULL, '2020-12-12 07:04:30', '2020-12-12 07:04:30', '1957e0c7-ab7d-4713-9c73-6b48bae74f43'),
(362, 39, 17, 8, 15, NULL, '2020-12-12 07:04:30', '2020-12-12 07:04:30', 'cd9abfbe-0d60-4ee0-9f14-3828b17188ef'),
(364, 363, 17, 6, 1, NULL, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'a63ea5e3-3732-43dd-8142-8de39ecfb522'),
(365, 363, 17, 7, 2, NULL, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '56b04c8a-38cb-4d53-929f-0eb007baeca9'),
(366, 363, 17, 7, 3, NULL, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'ae547f32-23ab-4914-a11a-cd208b7f2110'),
(367, 363, 17, 7, 4, NULL, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '5cada821-2fac-43f1-9351-4ab40271eaca'),
(368, 363, 17, 8, 5, NULL, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '8a991a41-9424-46d2-b1eb-b070f49b7163'),
(369, 363, 17, 6, 6, NULL, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'b98fc67b-6129-4c6f-beb9-56d17de80c53'),
(370, 363, 17, 7, 7, NULL, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '36ffbc18-3dc0-4448-827b-4fc55cedfeca'),
(371, 363, 17, 7, 8, NULL, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'dbfa70a2-d97d-4c80-9181-54ffa4a7f06f'),
(372, 363, 17, 8, 9, NULL, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '5eb0eae9-7859-4450-af98-689906c885a6'),
(373, 363, 17, 6, 10, NULL, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'ddffc655-1c95-41df-96d7-ce5a30129bd1'),
(374, 363, 17, 7, 11, NULL, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '1165584b-d2e5-45f4-8348-b657fa11ac9d'),
(375, 363, 17, 7, 12, NULL, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '27c8ca11-b5fb-4cda-8a1d-603e38ba2eab'),
(376, 363, 17, 7, 13, NULL, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'de9b2819-3dbd-41f7-928e-b4f41d565e2d'),
(377, 363, 17, 7, 14, NULL, '2020-12-12 07:04:32', '2020-12-12 07:04:32', 'e7108db9-4c3f-4b3c-82de-114726f1eddb'),
(378, 363, 17, 8, 15, NULL, '2020-12-12 07:04:32', '2020-12-12 07:04:32', '4e2a2ee9-2c17-490a-85c2-51a9c94ac2e3'),
(379, 39, 17, 6, 16, NULL, '2020-12-12 07:06:33', '2020-12-12 07:06:33', 'cd63bac6-b04d-4605-9fcf-be4a6c785f5e'),
(380, 39, 17, 7, 17, NULL, '2020-12-12 07:06:33', '2020-12-12 07:06:33', '96a1ed08-6005-4621-b009-1d1bb7fcf98d'),
(381, 39, 17, 8, 18, NULL, '2020-12-12 07:06:33', '2020-12-12 07:06:33', '8d63b1a5-5ec8-4f1c-85a6-307f90f7d644'),
(383, 382, 17, 6, 1, NULL, '2020-12-12 07:06:33', '2020-12-12 07:06:33', '25f85eb3-e3e5-4e81-baf6-978d26e4a5bf'),
(384, 382, 17, 7, 2, NULL, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '61aa49ae-a36c-496f-9e3f-23c4c693d25d'),
(385, 382, 17, 7, 3, NULL, '2020-12-12 07:06:34', '2020-12-12 07:06:34', 'ad23317a-914d-472b-b1b1-122190238729'),
(386, 382, 17, 7, 4, NULL, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '2b057f48-d06a-4867-b7e3-ba3392cd913b'),
(387, 382, 17, 8, 5, NULL, '2020-12-12 07:06:34', '2020-12-12 07:06:34', 'fb08ed32-4210-4e6c-97b8-f61fe193226d'),
(388, 382, 17, 6, 6, NULL, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '1c8eb49c-3b29-4362-87ff-6b3fe3a4658b'),
(389, 382, 17, 7, 7, NULL, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '8446835c-7eeb-45f9-95e6-a8b4ce91bff6'),
(390, 382, 17, 7, 8, NULL, '2020-12-12 07:06:34', '2020-12-12 07:06:34', 'efa054ed-66b7-4278-986b-97670cdf362b'),
(391, 382, 17, 8, 9, NULL, '2020-12-12 07:06:34', '2020-12-12 07:06:34', 'ad4472c6-9bcf-40e2-b319-92871f8d6eae'),
(392, 382, 17, 6, 10, NULL, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '062d3d00-1540-4d82-aa2e-654bab222844'),
(393, 382, 17, 7, 11, NULL, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '0441b525-4bf8-4308-9a83-3c2cbe043f43'),
(394, 382, 17, 7, 12, NULL, '2020-12-12 07:06:34', '2020-12-12 07:06:34', 'e0980631-654f-44df-affe-320ee222b5af'),
(395, 382, 17, 7, 13, NULL, '2020-12-12 07:06:34', '2020-12-12 07:06:34', 'cbde47ca-4f37-4bcf-a520-480d2312a47d'),
(396, 382, 17, 7, 14, NULL, '2020-12-12 07:06:34', '2020-12-12 07:06:34', 'e52bc1cf-798e-4f34-960a-70528e9261d0'),
(397, 382, 17, 8, 15, NULL, '2020-12-12 07:06:35', '2020-12-12 07:06:35', '1b98cb2d-5634-458a-bb49-355413975d3c'),
(398, 382, 17, 6, 16, NULL, '2020-12-12 07:06:35', '2020-12-12 07:06:35', '1c5e96f8-d949-4e30-8d66-c07af2e31918'),
(399, 382, 17, 7, 17, NULL, '2020-12-12 07:06:35', '2020-12-12 07:06:35', 'db38cf8e-7962-4dab-8f56-39daffc29d68'),
(400, 382, 17, 8, 18, NULL, '2020-12-12 07:06:35', '2020-12-12 07:06:35', '6109263e-ae81-4e9c-9fcb-66ce4a7c91fe'),
(401, 39, 17, 6, 19, NULL, '2020-12-12 07:17:29', '2020-12-12 07:17:29', 'b1c451c9-6e61-445c-9a61-75077d2dbcbd'),
(402, 39, 17, 7, 20, NULL, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '567da195-c873-4e84-a62f-00e15699868c'),
(403, 39, 17, 8, 21, NULL, '2020-12-12 07:17:29', '2020-12-12 07:17:29', 'b43dd3b9-0d35-43b7-85f6-29e5ab7550d4'),
(404, 39, 17, 6, 22, NULL, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '0553e323-01fe-42bc-bb94-b131c7d7bb5d'),
(405, 39, 17, 7, 23, NULL, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '33fa6a14-1462-4f6c-8e64-de9bd9554551'),
(406, 39, 17, 8, 24, NULL, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '779235b5-5522-456d-b5b7-57ce01ca4960'),
(407, 39, 17, 6, 25, NULL, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '0ce758ff-6e18-4284-aac2-e28042ca55f1'),
(408, 39, 17, 7, 26, NULL, '2020-12-12 07:17:30', '2020-12-12 07:17:30', '52843011-92e1-4150-a47c-25afdec52eea'),
(409, 39, 17, 8, 27, NULL, '2020-12-12 07:17:30', '2020-12-12 07:17:30', '00ea6752-67e0-4cb4-a8e2-56ba854d4890'),
(410, 39, 17, 6, 28, NULL, '2020-12-12 07:17:30', '2020-12-12 07:17:30', 'bb43a121-21ce-43bc-ad84-b617ec600bc3'),
(411, 39, 17, 7, 29, NULL, '2020-12-12 07:17:30', '2020-12-12 07:17:30', 'e9897041-9e45-45e6-8311-0cb7c50835e2'),
(412, 39, 17, 8, 30, NULL, '2020-12-12 07:17:30', '2020-12-12 07:17:30', 'b27c62de-ba0b-43cc-8c7f-abd741bc121e'),
(413, 39, 17, 6, 31, NULL, '2020-12-12 07:17:30', '2020-12-12 07:17:30', 'ed143e04-984e-455d-b0a1-408849f784a4'),
(414, 39, 17, 7, 32, NULL, '2020-12-12 07:17:30', '2020-12-12 07:17:30', '796eb645-3542-4cd9-970e-c24b438bb87c'),
(415, 39, 17, 8, 33, NULL, '2020-12-12 07:17:30', '2020-12-12 07:17:30', 'c9fefda6-6d2a-4690-9f8e-232c4fd5c38d'),
(417, 416, 17, 6, 1, NULL, '2020-12-12 07:17:31', '2020-12-12 07:17:31', '2a4e8d5a-d891-41c2-a1d0-b3dd95fde742'),
(418, 416, 17, 7, 2, NULL, '2020-12-12 07:17:31', '2020-12-12 07:17:31', '86fa4da1-5175-4250-b77a-b52b6c9b4bb6'),
(419, 416, 17, 7, 3, NULL, '2020-12-12 07:17:31', '2020-12-12 07:17:31', 'c9f42dab-0f0e-4174-a2b5-c6d43f7f4193'),
(420, 416, 17, 7, 4, NULL, '2020-12-12 07:17:31', '2020-12-12 07:17:31', 'eaddb57f-c651-4c28-9ae3-9a837e62011f'),
(421, 416, 17, 8, 5, NULL, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'd950a515-1437-4bf8-bf35-279359605552'),
(422, 416, 17, 6, 6, NULL, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '8acd009f-17a8-4faf-a386-cac8fd058323'),
(423, 416, 17, 7, 7, NULL, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '8e77f367-86fa-439b-af42-8b24bcf492f1'),
(424, 416, 17, 7, 8, NULL, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'd812ff29-2f58-4110-8f6e-8dd53495b4f6'),
(425, 416, 17, 8, 9, NULL, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '4c44b5d4-9d0a-4209-9c14-90e1032be9c5'),
(426, 416, 17, 6, 10, NULL, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '036995fa-1fed-4cac-bcbf-0ad6241c05b1'),
(427, 416, 17, 7, 11, NULL, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '660aa6cd-c549-44ec-89e8-9a5f7bc3e2ee'),
(428, 416, 17, 7, 12, NULL, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '9801faa3-1b79-4935-aecb-cf44259fde67'),
(429, 416, 17, 7, 13, NULL, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '0f009924-1923-40d4-aec7-1a867c525b6a'),
(430, 416, 17, 7, 14, NULL, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'c3e4f1ec-3dda-4aa5-b90a-dc3106019da5'),
(431, 416, 17, 8, 15, NULL, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'e0ba0c4e-a0c7-4e18-ad5f-6c04abdb4608'),
(432, 416, 17, 6, 16, NULL, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '03ecf04c-ebbd-4572-8090-91beb9ce013d'),
(433, 416, 17, 7, 17, NULL, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '5ceb1db9-01bd-4b23-bf0f-6f8cf6569621'),
(434, 416, 17, 8, 18, NULL, '2020-12-12 07:17:33', '2020-12-12 07:17:33', '8f6902c8-dfa3-4293-8bd9-2558d112a277'),
(435, 416, 17, 6, 19, NULL, '2020-12-12 07:17:33', '2020-12-12 07:17:33', '51b05eef-a244-4f09-8dc7-683f534f791e'),
(436, 416, 17, 7, 20, NULL, '2020-12-12 07:17:33', '2020-12-12 07:17:33', 'af63cb7c-5bc6-4cf4-a176-8ef00bb4882b'),
(437, 416, 17, 8, 21, NULL, '2020-12-12 07:17:33', '2020-12-12 07:17:33', '39474798-7abe-4de9-82e2-2cae9ed5b5f6'),
(438, 416, 17, 6, 22, NULL, '2020-12-12 07:17:33', '2020-12-12 07:17:33', 'ad64e82d-ccc7-49ee-9a74-8da13ae9fbd4'),
(439, 416, 17, 7, 23, NULL, '2020-12-12 07:17:33', '2020-12-12 07:17:33', 'de60328c-d504-472c-ad52-a19a3c875866'),
(440, 416, 17, 8, 24, NULL, '2020-12-12 07:17:33', '2020-12-12 07:17:33', '35d5fd81-5f06-4b01-8f49-8fa41591192f'),
(441, 416, 17, 6, 25, NULL, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '1c4c94c0-a898-4c1c-bc88-0cbcda669297'),
(442, 416, 17, 7, 26, NULL, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '3c5dfaa4-3e01-4531-9534-fd79d486585f'),
(443, 416, 17, 8, 27, NULL, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '30f5a65a-380e-40dc-a4a8-13352f0edb0e'),
(444, 416, 17, 6, 28, NULL, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '97225fc9-3c3a-4624-96f4-d3253ecb5cbf'),
(445, 416, 17, 7, 29, NULL, '2020-12-12 07:17:34', '2020-12-12 07:17:34', 'd223b5be-a22f-40a2-9b88-b22f6f682722'),
(446, 416, 17, 8, 30, NULL, '2020-12-12 07:17:34', '2020-12-12 07:17:34', 'fa247c92-ffca-4542-884a-78e839f4c2e1'),
(447, 416, 17, 6, 31, NULL, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '87cd97f0-90b5-4baa-9acb-5607b2529b35'),
(448, 416, 17, 7, 32, NULL, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '849c69c0-7a62-4a74-a755-575cd1d5a3c5'),
(449, 416, 17, 8, 33, NULL, '2020-12-12 07:17:34', '2020-12-12 07:17:34', 'bea4db10-7a30-40ea-b36a-53d7a44245a0'),
(451, 450, 17, 6, 1, NULL, '2020-12-12 07:20:31', '2020-12-12 07:20:31', 'f29338ab-fa0d-46e5-9b55-43133736c274'),
(452, 450, 17, 7, 2, NULL, '2020-12-12 07:20:31', '2020-12-12 07:20:31', 'd3e17b22-bb19-477b-82cf-18d0fecda935'),
(453, 450, 17, 7, 3, NULL, '2020-12-12 07:20:31', '2020-12-12 07:20:31', 'e147de71-0a3a-456f-952a-e35a66e1d684'),
(454, 450, 17, 7, 4, NULL, '2020-12-12 07:20:31', '2020-12-12 07:20:31', 'e1cab429-aaea-49bb-9046-1e909723ad21'),
(455, 450, 17, 8, 5, NULL, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '77b52c1c-0a79-476b-9c62-f0fa8cd523a5'),
(456, 450, 17, 6, 6, NULL, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '19817f9e-7ebf-49b7-ab09-dd3c9feab414'),
(457, 450, 17, 7, 7, NULL, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '1621dadb-feac-4981-897e-88c17286be21'),
(458, 450, 17, 7, 8, NULL, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '39fff897-12a8-40a5-91fb-ee725f52ad35'),
(459, 450, 17, 8, 9, NULL, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '5debe4e1-d20f-4907-aca2-8d9183b1d9fc'),
(460, 450, 17, 6, 10, NULL, '2020-12-12 07:20:32', '2020-12-12 07:20:32', 'dd7492f6-90e3-43c8-9d4e-64ea7e5438d5'),
(461, 450, 17, 7, 11, NULL, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '4fdef79b-3055-4dea-adbd-8028ca8c7294'),
(462, 450, 17, 7, 12, NULL, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '93c9dda6-cbc9-469f-b900-8c18696fe87e'),
(463, 450, 17, 7, 13, NULL, '2020-12-12 07:20:32', '2020-12-12 07:20:32', 'e50ccbbc-83b5-4b79-8b5b-bd03a259aaaf'),
(464, 450, 17, 7, 14, NULL, '2020-12-12 07:20:32', '2020-12-12 07:20:32', 'd5b500fb-c55a-478b-a942-394341c2690c'),
(465, 450, 17, 8, 15, NULL, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '18cf0d92-76be-4d0b-a917-512fb009ecf2'),
(466, 450, 17, 6, 16, NULL, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '89b495d3-4274-49d2-b29f-0c9247ce9668'),
(467, 450, 17, 7, 17, NULL, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '0926824f-91bd-49ab-8d92-c33e843c09e6'),
(468, 450, 17, 8, 18, NULL, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '32610904-f0a8-4c16-bd90-6701712fd8fb'),
(469, 450, 17, 6, 19, NULL, '2020-12-12 07:20:32', '2020-12-12 07:20:32', 'c55701f4-5cac-4134-8a65-9be44d02916c'),
(470, 450, 17, 7, 20, NULL, '2020-12-12 07:20:33', '2020-12-12 07:20:33', '5b7ae17f-a029-4309-adb2-53f5a9466fcb'),
(471, 450, 17, 8, 21, NULL, '2020-12-12 07:20:33', '2020-12-12 07:20:33', '713577bf-1012-414c-9928-c0526128ec9b'),
(472, 450, 17, 6, 22, NULL, '2020-12-12 07:20:33', '2020-12-12 07:20:33', '5dcfe88e-de48-4589-b3c7-d5c5606f081f'),
(473, 450, 17, 7, 23, NULL, '2020-12-12 07:20:34', '2020-12-12 07:20:34', '47703a12-0b61-436d-bbcc-c86e69b3ac5a'),
(474, 450, 17, 8, 24, NULL, '2020-12-12 07:20:34', '2020-12-12 07:20:34', 'e400256d-e13e-4162-bf29-1318b6631a73'),
(475, 450, 17, 6, 25, NULL, '2020-12-12 07:20:34', '2020-12-12 07:20:34', '2ec34c05-8060-4716-b951-be8288b0b2e7'),
(476, 450, 17, 7, 26, NULL, '2020-12-12 07:20:34', '2020-12-12 07:20:34', '8416da09-c9b8-4c7d-83bb-569fb8188d4c'),
(477, 450, 17, 8, 27, NULL, '2020-12-12 07:20:34', '2020-12-12 07:20:34', '17c04c65-da27-47c3-8abd-56b427360078'),
(478, 450, 17, 6, 28, NULL, '2020-12-12 07:20:34', '2020-12-12 07:20:34', 'e8df293a-aa9a-4a30-8e3d-631ffbe13c3b'),
(479, 450, 17, 7, 29, NULL, '2020-12-12 07:20:35', '2020-12-12 07:20:35', '1a445988-3a4a-4813-879c-60cbb4bd4a8d'),
(480, 450, 17, 8, 30, NULL, '2020-12-12 07:20:35', '2020-12-12 07:20:35', '599b2df4-75ed-4c67-a835-fae6ceaad443'),
(481, 450, 17, 6, 31, NULL, '2020-12-12 07:20:35', '2020-12-12 07:20:35', '919ab7e8-0675-4445-a827-1ff8e7adec16'),
(482, 450, 17, 7, 32, NULL, '2020-12-12 07:20:35', '2020-12-12 07:20:35', '98100b5a-a30a-433a-92d8-4f1b41cfaaf8'),
(483, 450, 17, 8, 33, NULL, '2020-12-12 07:20:35', '2020-12-12 07:20:35', '246687fb-3ce2-4eab-a98c-2c8ad702ea99'),
(485, 484, 17, 8, 1, NULL, '2020-12-12 07:40:34', '2020-12-12 07:40:34', 'd3bf50e6-8dd0-4607-90c5-a5b2f2cf2e45'),
(486, 484, 17, 8, 2, NULL, '2020-12-12 07:40:34', '2020-12-12 07:40:34', '0e8ecb60-14cb-4043-851e-850c0ae3040e'),
(488, 487, 17, 8, 1, NULL, '2020-12-12 07:43:17', '2020-12-12 07:43:17', 'c6aabbc9-e540-4da0-9daf-a7047722dfb8'),
(489, 487, 17, 8, 2, NULL, '2020-12-12 07:43:17', '2020-12-12 07:43:17', 'b7be4a22-2202-48f4-87d7-8782c75bd834'),
(491, 490, 17, 8, 1, NULL, '2020-12-12 08:02:35', '2020-12-12 08:02:35', '8052d048-65d5-4701-b358-35124198f5cd'),
(492, 490, 17, 8, 2, NULL, '2020-12-12 08:02:35', '2020-12-12 08:02:35', '92706f7a-8a31-4039-ab38-3f27d7cda075'),
(494, 493, 17, 8, 1, NULL, '2020-12-12 08:47:32', '2020-12-12 08:47:32', 'f545494a-1c25-4eb4-96ec-69819381eaaa'),
(495, 42, 17, 8, 2, NULL, '2020-12-12 08:51:43', '2020-12-12 08:51:43', '277348a3-d31e-49d3-93b8-9fbb26d9e8e9'),
(497, 496, 17, 8, 1, NULL, '2020-12-12 08:51:43', '2020-12-12 08:51:43', '54ad7325-7faf-4c30-8cca-12132251289a'),
(498, 496, 17, 8, 2, NULL, '2020-12-12 08:51:43', '2020-12-12 08:51:43', '49c2a724-0b9d-49a0-a841-a60b776c0f21'),
(500, 499, 17, 8, 1, NULL, '2020-12-12 08:55:32', '2020-12-12 08:55:32', 'b91d39d6-412f-4216-8a2d-af586cb0e7f9'),
(501, 499, 17, 8, 2, NULL, '2020-12-12 08:55:32', '2020-12-12 08:55:32', 'c6c3247b-f87b-438d-9d55-e28050d67c69'),
(503, 502, 17, 8, 1, NULL, '2020-12-12 08:58:02', '2020-12-12 08:58:02', '6ac8f5c8-bdfd-469e-a34a-466fba5569a6'),
(504, 502, 17, 8, 2, NULL, '2020-12-12 08:58:02', '2020-12-12 08:58:02', '6cc5bd08-1723-47ff-8f39-49b0a1f8f074'),
(506, 505, 17, 8, 1, NULL, '2020-12-12 08:58:45', '2020-12-12 08:58:45', '2ccba854-149f-42ff-8459-5d5364a97ad5'),
(507, 505, 17, 8, 2, NULL, '2020-12-12 08:58:45', '2020-12-12 08:58:45', 'f30f6280-857a-4a82-b226-be51ee956d16'),
(509, 508, 17, 8, 1, NULL, '2020-12-12 09:00:20', '2020-12-12 09:00:20', '4d21177d-147d-4c19-a816-5388267d0425'),
(510, 508, 17, 8, 2, NULL, '2020-12-12 09:00:21', '2020-12-12 09:00:21', '463a594b-88ec-49b0-81dc-a9a2d091c902'),
(512, 511, 17, 8, 1, NULL, '2020-12-12 09:01:11', '2020-12-12 09:01:11', '804de3cd-8bf0-4c88-9f6e-4ce194447c7e'),
(513, 511, 17, 8, 2, NULL, '2020-12-12 09:01:11', '2020-12-12 09:01:11', '59d306da-8f83-4304-85dd-f9ef529494e4'),
(515, 514, 17, 8, 1, NULL, '2020-12-12 09:09:51', '2020-12-12 09:09:51', 'ae2138fe-c6bf-4adb-891a-ae56eceb914f'),
(516, 514, 17, 8, 2, NULL, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '15adc0e2-1c9a-4c32-b3ba-3befedb290d8'),
(517, 514, 17, 8, 3, NULL, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '6337ff02-7777-418b-bc2f-9f554162e128'),
(518, 514, 17, 8, 4, NULL, '2020-12-12 09:09:51', '2020-12-12 09:09:51', 'c968ece2-1779-467a-b7cf-ccffeec5e1de'),
(519, 514, 17, 8, 5, NULL, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '3fbab29d-3481-4eb6-a138-e5d473b51c4c'),
(520, 514, 17, 8, 6, NULL, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '2f8a63fc-20ad-4825-a7e8-390426e9d1d1'),
(521, 514, 17, 8, 7, NULL, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '68d31a92-62a8-4eeb-b176-cd384f6930c3'),
(522, 514, 17, 8, 8, NULL, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '73e67e09-396c-4a84-b9e8-959aa9b67685');

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
(6, 17, 25, 'heading', 'heading', 1, '2020-12-11 14:42:02', '2020-12-11 14:42:02', '373eed9d-2892-44c3-9762-094eb392c34a'),
(7, 17, 26, 'paragraph', 'paragraph', 2, '2020-12-11 14:42:02', '2020-12-11 14:42:02', '6c38c618-958b-4b50-971b-36ad786f4a09'),
(8, 17, 27, 'link', 'link', 3, '2020-12-12 06:02:38', '2020-12-12 06:02:38', '7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_bodycontent`
--

CREATE TABLE `matrixcontent_bodycontent` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_heading_heading` text,
  `field_paragraph_text` text,
  `field_link_links` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_bodycontent`
--

INSERT INTO `matrixcontent_bodycontent` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_heading_heading`, `field_paragraph_text`, `field_link_links`) VALUES
(1, 115, 1, '2020-12-11 14:43:07', '2020-12-11 20:31:55', 'd1b1961e-1a46-4a6f-b371-991ea10267e3', 'Test heading', NULL, NULL),
(2, 116, 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '42c023ae-1d51-4334-a56f-d01589017472', NULL, '<p>fkdsklkfs;kdl;klkfl;ksd;lkdlfkdlklk fs;dkflksdl;f f;ldk;lfdsl;klfdskfd fs;kdfslkl;sdkfdf</p>', NULL),
(3, 117, 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', 'c9268838-4a67-4045-b328-3d1380888982', 'fdl;k;lfkd', NULL, NULL),
(4, 118, 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '99b69ab3-4b39-4e8a-b1d8-f96dfc853419', NULL, '<p>flld;dl;\'l\'f;sdl;\'fl;s\'l;\'dslf;dslf\'dlsd\';lfd\';sf</p>', NULL),
(5, 120, 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '493791eb-0d1b-4d6c-9b6a-dbc32f4e71cd', 'kjdfkjdsljlfksdjflsd', NULL, NULL),
(6, 121, 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '5778be11-28f7-4bf6-b175-653ac74dc173', NULL, '<p>fkdsklkfs;kdl;klkfl;ksd;lkdlfkdlklk fs;dkflksdl;f f;ldk;lfdsl;klfdskfd fs;kdfslkl;sdkfdf</p>', NULL),
(7, 122, 1, '2020-12-11 14:43:07', '2020-12-11 14:43:07', 'ff94904c-9fc4-4e7c-b0cc-3376ae321c67', 'fdl;k;lfkd', NULL, NULL),
(8, 123, 1, '2020-12-11 14:43:08', '2020-12-11 14:43:08', '6e087b35-dd0a-40ae-b2af-0f09347d1b8c', NULL, '<p>flld;dl;\'l\'f;sdl;\'fl;s\'l;\'dslf;dslf\'dlsd\';lfd\';sf</p>', NULL),
(9, 124, 1, '2020-12-11 20:30:45', '2020-12-12 05:56:30', 'e6874ebd-ef0c-4d78-a812-da9895511fdf', NULL, '<p>A few years ago, we held an English speech contest for Korean university students. After listening to them speak such fluent English, I felt that some of these students would arise to become leaders that not only guide their nation, but the rest of the world. All they need is a healthy heart. <br /></p>', NULL),
(10, 126, 1, '2020-12-11 20:30:46', '2020-12-11 20:30:46', 'd7acdf07-78e1-442b-b7bf-83bd6892b364', 'kjdfkjdsljlfksdjflsd', NULL, NULL),
(11, 127, 1, '2020-12-11 20:30:46', '2020-12-11 20:30:46', 'fca544bf-f215-43df-9529-872baa966bba', NULL, 'Test Paragraph', NULL),
(12, 129, 1, '2020-12-11 20:31:55', '2020-12-11 20:31:55', '77a3c4a5-75dc-4fa9-a881-682fdb260575', 'Test heading', NULL, NULL),
(13, 130, 1, '2020-12-11 20:31:55', '2020-12-11 20:31:55', '12583204-eed4-4328-b85a-aaff0b192737', NULL, 'Test Paragraph', NULL),
(14, 132, 1, '2020-12-11 20:49:48', '2020-12-11 20:49:48', 'a30c0827-c8fc-438e-8ab8-1307fdd3437e', NULL, '<p>A few years ago, we held an English speech contest for Korean university<br /> students. After listening to them speak such fluent English, I felt <br />that some of these students would arise to become leaders that not only <br />guide their nation, but the rest of the world. All they need is a <br />healthy heart. I want to teach young people to break out of their molds,<br /> spend time with each other, and share their hearts. There are reasons <br />why we take the time to bend our hearts and empty ourselves of our <br />thoughts. If not done at a young age, it would be impossible to achieve <br />success later in life. Even though we have shortcomings, we can receive <br />the help of others to compensate our shortcomings through unity and <br />fellowship. Tomorrow about this time, next year about this time, even <br />ten years about this time, if young people could foresee the change they<br /> will undergo, they would not live according to the desires of their <br />flesh, but cherish a greater hope in heaven. God has prepared an amazing<br /> future for us, and as young adults we need to learn about the true <br />world of the heart, Mahanaim, which means God’s Camp, will raise them <br />into great men and women with the capacity to lead the world. This <br />change will come through Mahanaim Educational Institute(College).</p>', NULL),
(15, 134, 1, '2020-12-11 20:52:02', '2020-12-11 20:52:02', '5ba0d95a-e69d-49c9-b840-5a33dceaac76', NULL, '<p>A few years ago, we held an English speech contest for Korean university students. After listening to them speak such fluent English, I felt that some of these students would arise to become leaders that not only guide their nation, but the rest of the world. All they need is a healthy heart. <br /></p>\r\n<p>I want to teach young people to break out of their molds, spend time with each other, and share their hearts. There are reasons <br />why we take the time to bend our hearts and empty ourselves of our <br />thoughts. If not done at a young age, it would be impossible to achieve <br />success later in life. Even though we have shortcomings, we can receive <br />the help of others to compensate our shortcomings through unity and <br />fellowship. Tomorrow about this time, next year about this time, even <br />ten years about this time, if young people could foresee the change they<br /> will undergo, they would not live according to the desires of their <br />flesh, but cherish a greater hope in heaven. God has prepared an amazing<br /> future for us, and as young adults we need to learn about the true <br />world of the heart, Mahanaim, which means God’s Camp, will raise them <br />into great men and women with the capacity to lead the world. This <br />change will come through Mahanaim Educational Institute(College).</p>', NULL),
(16, 135, 1, '2020-12-11 20:55:16', '2020-12-11 21:08:31', 'ebdcb9db-7e9b-4ba5-8d8a-a3aaad154aae', NULL, '<p>I want to teach young people to break out of their molds, spend time with each other, and share their hearts. There are reasons why we take the time to bend our hearts and empty ourselves of our thoughts. If not done at a young age, it would be impossible to achieve success later in life. Even though we have shortcomings, we can receive the help of others to compensate our shortcomings through unity and fellowship.</p>', NULL),
(17, 136, 1, '2020-12-11 20:55:16', '2020-12-11 21:08:31', '40f8b9bc-572c-4ca3-b273-2659868c9216', NULL, '<p>Tomorrow about this time, next year about this time, even ten years about this time, if young people could foresee the change they will undergo, they would not live according to the desires of their flesh, but cherish a greater hope in heaven. God has prepared an amazing future for us, and as young adults we need to learn about the true world of the heart, Mahanaim, which means God’s Camp, will raise them into great men and women with the capacity to lead the world. This change will come through Mahanaim Educational Institute(College).</p>', NULL),
(18, 138, 1, '2020-12-11 20:55:16', '2020-12-11 20:55:16', '7db28e69-005e-45c4-9027-54ed1bf2e0de', NULL, '<p>A few years ago, we held an English speech contest for Korean university students. After listening to them speak such fluent English, I felt that some of these students would arise to become leaders that not only guide their nation, but the rest of the world. All they need is a healthy heart. <br /></p>\r\n', NULL),
(19, 139, 1, '2020-12-11 20:55:16', '2020-12-11 20:55:16', '7ab14ac3-be43-4f14-929e-5118320e0bce', NULL, '<p>I want to teach young people to break out of their molds, spend time with each other, and share their hearts. There are reasons why we take the time to bend our hearts and empty ourselves of our thoughts. If not done at a young age, it would be impossible to achieve success later in life. Even though we have shortcomings, we can receive the help of others to compensate our shortcomings through unity and fellowship.</p>', NULL),
(20, 140, 1, '2020-12-11 20:55:16', '2020-12-11 20:55:16', 'b93feb56-a748-408c-8956-70ead9643566', NULL, '<p>Tomorrow about this time, next year about this time, even ten years about this time, if young people could foresee the change they will undergo, they would not live according to the desires of their flesh, but cherish a greater hope in heaven. God has prepared an amazing future for us, and as young adults we need to learn about the true world of the heart, Mahanaim, which means God’s Camp, will raise them into great men and women with the capacity to lead the world. This change will come through Mahanaim Educational Institute(College).</p>', NULL),
(21, 141, 1, '2020-12-11 20:57:07', '2020-12-11 21:08:31', '72b50b78-ba79-4858-90f0-b44795ce0b39', 'Chancellor\'s Message', NULL, NULL),
(22, 143, 1, '2020-12-11 20:57:07', '2020-12-11 20:57:07', 'f3067960-7690-42e9-ba77-818996eea211', 'Chancellor\'s Message', NULL, NULL),
(23, 144, 1, '2020-12-11 20:57:07', '2020-12-11 20:57:07', 'd284908a-6c8b-482a-be85-5f32ac229af6', NULL, '<p>A few years ago, we held an English speech contest for Korean university students. After listening to them speak such fluent English, I felt that some of these students would arise to become leaders that not only guide their nation, but the rest of the world. All they need is a healthy heart. <br /></p>\r\n', NULL),
(24, 145, 1, '2020-12-11 20:57:08', '2020-12-11 20:57:08', 'aed04432-aef8-4cfc-a7a6-43b87fffb76a', NULL, '<p>I want to teach young people to break out of their molds, spend time with each other, and share their hearts. There are reasons why we take the time to bend our hearts and empty ourselves of our thoughts. If not done at a young age, it would be impossible to achieve success later in life. Even though we have shortcomings, we can receive the help of others to compensate our shortcomings through unity and fellowship.</p>', NULL),
(25, 146, 1, '2020-12-11 20:57:08', '2020-12-11 20:57:08', 'ba5c5bc8-a357-44df-9685-f204f4f1812e', NULL, '<p>Tomorrow about this time, next year about this time, even ten years about this time, if young people could foresee the change they will undergo, they would not live according to the desires of their flesh, but cherish a greater hope in heaven. God has prepared an amazing future for us, and as young adults we need to learn about the true world of the heart, Mahanaim, which means God’s Camp, will raise them into great men and women with the capacity to lead the world. This change will come through Mahanaim Educational Institute(College).</p>', NULL),
(26, 147, 1, '2020-12-11 21:07:13', '2020-12-11 21:08:31', 'bab38e46-d157-4c69-b074-f5e8cf5e2ec5', 'Principal\'s Message', NULL, NULL),
(27, 148, 1, '2020-12-11 21:07:13', '2020-12-11 21:08:31', 'b478d64e-8751-41b2-93de-f5b12584a7d9', NULL, '<p>Education in Kenya has taken turns and twists and several Education commissions have made recommendations which have made higher Education what it is today; Latest being the transition from 8-4-4 system of education to the current system of2-6-3-3-3. The demand for higher education increases by the day. In the past two years, the number of students meeting the university cutoff points has reduced drastically while the number of students who can join tertiary institutions has increased.<br /></p>', NULL),
(28, 149, 1, '2020-12-11 21:07:13', '2020-12-11 21:08:31', '649600c3-1189-4cfa-8a70-6c7aefc29af7', NULL, '<p>Education being one of the main pillar to Kenya’s achievement of Vision 2030, mind-shift on perception of tertiary education is very important. Technical colleges are not second class to universities. We should learn from advanced economies such as Germany that have had a successful system of technical training. Mahanaim Educational Institute (MEI) is accredited by the Ministry of Higher Education, through Technical and Vocational Education and Training. </p>', NULL),
(29, 150, 1, '2020-12-11 21:07:14', '2020-12-11 21:08:31', 'bf5f956d-ed9b-40fb-9239-36e31a25505c', NULL, '<p>Authority (TVETA/PRIVATE/TVC/0221/2016) to offer courses both in diploma and certificate levels. In MEI we instill a Godly mindset to our students so that they can be agents of change in Kenya, Africa and the rest of the world. Through our Motto; Challenge, Change and Cohesion, we encourage our students to view themselves as global leaders through challenging them to overcome their own personal limits. We also instill positive values that transform lives. We create cohesion by exposing them to a multicultural environment and enabling participation in exchange programs between youths from over 80 different countries all over the world.<br /></p>', NULL),
(30, 151, 1, '2020-12-11 21:07:14', '2020-12-11 21:08:31', '8d866266-3d94-4fd4-858c-785c6c7df59f', NULL, '<p>We continue to improve our teaching, learning and research facilities so as to create the best environment for our students, such as a well equipped library, modern lecture halls, modern training radio studio for Journalism students, restaurant for Hospitality students, Computer laboratories for ICDL and Graphics students language laboratories among others.<br /></p>', NULL),
(31, 152, 1, '2020-12-11 21:07:14', '2020-12-11 21:08:32', '5caa66bf-9399-4893-8620-1b57a2710b50', NULL, '<p>MEI appreciates the value and the power of practicum. To ensure that the students identify with what is taught in class; MEI has forged collaborations with other institutions of higher learning and the industry at large. I welcome all who are looking forward to studying in a serene environment which offers the best opportunity for excellence in all scopes of life.</p>\r\n\r\n\r\n\r\n\r\n', NULL),
(32, 154, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '99610a65-cbc4-471e-b9df-b3c4d5faae38', 'Chancellor\'s Message', NULL, NULL),
(33, 155, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '574c1960-6a7a-411d-a210-7ab9198337d8', NULL, '<p>A few years ago, we held an English speech contest for Korean university students. After listening to them speak such fluent English, I felt that some of these students would arise to become leaders that not only guide their nation, but the rest of the world. All they need is a healthy heart. <br /></p>\r\n', NULL),
(34, 156, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '5576840e-d110-43f0-b75d-6b02b58ed344', NULL, '<p>I want to teach young people to break out of their molds, spend time with each other, and share their hearts. There are reasons why we take the time to bend our hearts and empty ourselves of our thoughts. If not done at a young age, it would be impossible to achieve success later in life. Even though we have shortcomings, we can receive the help of others to compensate our shortcomings through unity and fellowship.</p>', NULL),
(35, 157, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', 'c964dcde-b804-48bc-b8d7-b72044fc9c21', NULL, '<p>Tomorrow about this time, next year about this time, even ten years about this time, if young people could foresee the change they will undergo, they would not live according to the desires of their flesh, but cherish a greater hope in heaven. God has prepared an amazing future for us, and as young adults we need to learn about the true world of the heart, Mahanaim, which means God’s Camp, will raise them into great men and women with the capacity to lead the world. This change will come through Mahanaim Educational Institute(College).</p>', NULL),
(36, 158, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '5f764175-fa7f-49c3-86d0-6926cb6e9385', 'Principal\'s Message', NULL, NULL),
(37, 159, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', 'ac9f08a6-ec73-43d9-9012-ee5ee37ff978', NULL, '<p>Education in Kenya has taken turns and twists and several Education commissions have made recommendations which have made higher Education what it is today; Latest being the transition from 8-4-4 system of education to the current system of2-6-3-3-3. The demand for higher education increases by the day. In the past two years, the number of students meeting the university cutoff points has reduced drastically while the number of students who can join tertiary institutions has increased.<br /></p>', NULL),
(38, 160, 1, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '88e9c72a-4a36-4293-b6d0-7f133912a99f', NULL, '<p>Education being one of the main pillar to Kenya’s achievement of Vision 2030, mind-shift on perception of tertiary education is very important. Technical colleges are not second class to universities. We should learn from advanced economies such as Germany that have had a successful system of technical training. Mahanaim Educational Institute (MEI) is accredited by the Ministry of Higher Education, through Technical and Vocational Education and Training. </p>', NULL),
(39, 161, 1, '2020-12-11 21:07:15', '2020-12-11 21:07:15', 'd9b687c0-605f-44e6-abe6-13238f70086f', NULL, '<p>Authority (TVETA/PRIVATE/TVC/0221/2016) to offer courses both in diploma and certificate levels. In MEI we instill a Godly mindset to our students so that they can be agents of change in Kenya, Africa and the rest of the world. Through our Motto; Challenge, Change and Cohesion, we encourage our students to view themselves as global leaders through challenging them to overcome their own personal limits. We also instill positive values that transform lives. We create cohesion by exposing them to a multicultural environment and enabling participation in exchange programs between youths from over 80 different countries all over the world.<br /></p>', NULL),
(40, 162, 1, '2020-12-11 21:07:15', '2020-12-11 21:07:15', '97170574-6bcd-4642-9f92-74ff5540f34f', NULL, '<p>We continue to improve our teaching, learning and research facilities so as to create the best environment for our students, such as a well equipped library, modern lecture halls, modern training radio studio for Journalism students, restaurant for Hospitality students, Computer laboratories for ICDL and Graphics students language laboratories among others.<br /></p>', NULL),
(41, 163, 1, '2020-12-11 21:07:15', '2020-12-11 21:07:15', 'e4b1971a-85dc-4e06-8053-d8e5a345df2c', NULL, '<p>MEI appreciates the value and the power of practicum. To ensure that the students identify with what is taught in class; MEI has forged collaborations with other institutions of higher learning and the industry at large. I welcome all who are looking forward to studying in a serene environment which offers the best opportunity for excellence in all scopes of life.</p>\r\n\r\n\r\n\r\n\r\n', NULL),
(42, 164, 1, '2020-12-11 21:08:31', '2020-12-11 21:08:31', '5bf38c71-e0c2-468c-9f9e-3c730c1927ea', NULL, NULL, NULL),
(43, 166, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '3fc06def-0330-43f4-a0f8-5294ed3d5ab8', 'Chancellor\'s Message', NULL, NULL),
(44, 167, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '9b095c41-f234-4e93-9a6e-4fc7ec5f735f', NULL, '<p>A few years ago, we held an English speech contest for Korean university students. After listening to them speak such fluent English, I felt that some of these students would arise to become leaders that not only guide their nation, but the rest of the world. All they need is a healthy heart. <br /></p>\r\n', NULL),
(45, 168, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'b3cc8385-ecef-4ff4-950c-495777536ccd', NULL, '<p>I want to teach young people to break out of their molds, spend time with each other, and share their hearts. There are reasons why we take the time to bend our hearts and empty ourselves of our thoughts. If not done at a young age, it would be impossible to achieve success later in life. Even though we have shortcomings, we can receive the help of others to compensate our shortcomings through unity and fellowship.</p>', NULL),
(46, 169, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '182c76a9-d8d7-47b0-8799-17f2ac1f54f9', NULL, '<p>Tomorrow about this time, next year about this time, even ten years about this time, if young people could foresee the change they will undergo, they would not live according to the desires of their flesh, but cherish a greater hope in heaven. God has prepared an amazing future for us, and as young adults we need to learn about the true world of the heart, Mahanaim, which means God’s Camp, will raise them into great men and women with the capacity to lead the world. This change will come through Mahanaim Educational Institute(College).</p>', NULL),
(47, 170, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '721e9350-0580-4f98-bc36-4f4ba9ee134f', NULL, NULL, NULL),
(48, 171, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '1bab9645-8a29-47c3-8d04-a41c37b082bc', 'Principal\'s Message', NULL, NULL),
(49, 172, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '37cffa88-e94e-4bd3-9e19-3608bf0a1c65', NULL, '<p>Education in Kenya has taken turns and twists and several Education commissions have made recommendations which have made higher Education what it is today; Latest being the transition from 8-4-4 system of education to the current system of2-6-3-3-3. The demand for higher education increases by the day. In the past two years, the number of students meeting the university cutoff points has reduced drastically while the number of students who can join tertiary institutions has increased.<br /></p>', NULL),
(50, 173, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'e2afd60b-64b8-4552-a1d1-d68659cec99a', NULL, '<p>Education being one of the main pillar to Kenya’s achievement of Vision 2030, mind-shift on perception of tertiary education is very important. Technical colleges are not second class to universities. We should learn from advanced economies such as Germany that have had a successful system of technical training. Mahanaim Educational Institute (MEI) is accredited by the Ministry of Higher Education, through Technical and Vocational Education and Training. </p>', NULL),
(51, 174, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '407b722b-d64e-493b-8193-fa51c47d9810', NULL, '<p>Authority (TVETA/PRIVATE/TVC/0221/2016) to offer courses both in diploma and certificate levels. In MEI we instill a Godly mindset to our students so that they can be agents of change in Kenya, Africa and the rest of the world. Through our Motto; Challenge, Change and Cohesion, we encourage our students to view themselves as global leaders through challenging them to overcome their own personal limits. We also instill positive values that transform lives. We create cohesion by exposing them to a multicultural environment and enabling participation in exchange programs between youths from over 80 different countries all over the world.<br /></p>', NULL),
(52, 175, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', 'b38a3092-b549-400e-8661-3f5fb1633484', NULL, '<p>We continue to improve our teaching, learning and research facilities so as to create the best environment for our students, such as a well equipped library, modern lecture halls, modern training radio studio for Journalism students, restaurant for Hospitality students, Computer laboratories for ICDL and Graphics students language laboratories among others.<br /></p>', NULL),
(53, 176, 1, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '2db4dadf-bd30-44be-baa9-309b65857e51', NULL, '<p>MEI appreciates the value and the power of practicum. To ensure that the students identify with what is taught in class; MEI has forged collaborations with other institutions of higher learning and the industry at large. I welcome all who are looking forward to studying in a serene environment which offers the best opportunity for excellence in all scopes of life.</p>\r\n\r\n\r\n\r\n\r\n', NULL),
(54, 177, 1, '2020-12-11 21:16:21', '2020-12-11 21:28:39', '0d3237c7-8f51-40cc-9a87-02e5d9b646f4', 'Mission', NULL, NULL),
(55, 178, 1, '2020-12-11 21:16:21', '2020-12-11 21:28:39', '23401b15-bdaf-424b-9857-8431e3f3249c', NULL, '<p>The mission of MEI is to be a Christian Institution that teaches students the wisdom of God hence cultivating them to become the global leaders. In addition to its commitment of nurturing global leaders, the administration and faculties at MEI will achieve these ends through quality instruction, scholarships, spiritual guidance, student development, service to the community and development of talents fit for its goals in higher education and research. We are taking steps with the faith that God is helping us. <br /></p>', NULL),
(56, 179, 1, '2020-12-11 21:16:21', '2020-12-11 21:28:39', 'ddb39150-048d-492a-a4f2-af44c85878bf', NULL, '<p>We believe God will greatly strengthen MEI to become an institute that serves as a world mission centre and a source of leaders in this era of globalization. Students at Mahanaim will experience an academic and spiritual growth that empowers them to create a more peaceful, blessed and beautiful world based on Godly principles.</p>\r\n\r\n\r\n\r\n\r\n', NULL),
(57, 180, 1, '2020-12-11 21:16:21', '2020-12-11 21:28:39', 'bf986421-a58b-4bc1-996b-fcea98464151', 'Vision', NULL, NULL),
(58, 181, 1, '2020-12-11 21:16:21', '2020-12-11 21:28:39', 'fa16ebb9-ea6e-4818-9a22-b1f8894b3b28', NULL, '<p>To nurture global leaders with a Godly mindset, who will effect positive change in their communities and the world at large</p>', NULL),
(59, 182, 1, '2020-12-11 21:16:21', '2020-12-11 21:28:39', '49c06f2e-f02b-4a93-b312-de944bab683b', NULL, '<p>Mahanaim Educational Institute (College) philosophies are based on utilizing the true word and knowledge of the heart that is manifested in the Bible. Through this methodology many students have amazingly acquired progressive and healthy mindsets while evolving into more effective individuals. We have discovered with assurance how people such as Abraham Lincoln and biblical figures such as Joseph and David gained wisdom from the word of God. We have employed education methodologies that will produce leaders for the next generation who will become catalysts of peace and bliss in the society.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(60, 183, 1, '2020-12-11 21:16:21', '2020-12-11 21:28:39', 'a812c7e4-d21c-4c67-9942-a14c17fed135', 'Philosophy', NULL, NULL),
(61, 185, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', '9781e610-e2b2-474c-b988-cbc1736919b8', 'Mission', NULL, NULL),
(62, 186, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', 'c3141775-2b05-46b0-94b4-8732bdec4196', NULL, '<p>The mission of MEI is to be a Christian Institution that teaches students the wisdom of God hence cultivating them to become the global leaders. In addition to its commitment of nurturing global leaders, the administration and faculties at MEI will achieve these ends through quality instruction, scholarships, spiritual guidance, student development, service to the community and development of talents fit for its goals in higher education and research. We are taking steps with the faith that God is helping us. <br /></p>', NULL),
(63, 187, 1, '2020-12-11 21:16:21', '2020-12-11 21:16:21', '3ac9fd34-3b41-42db-b9de-ec744bef9f4d', NULL, '<p>We believe God will greatly strengthen MEI to become an institute that serves as a world mission centre and a source of leaders in this era of globalization. Students at Mahanaim will experience an academic and spiritual growth that empowers them to create a more peaceful, blessed and beautiful world based on Godly principles.</p>\r\n\r\n\r\n\r\n\r\n', NULL),
(64, 188, 1, '2020-12-11 21:16:22', '2020-12-11 21:16:22', '1bbc8bea-c2b0-411f-bfac-0c9dc04bef01', 'Vision', NULL, NULL),
(65, 189, 1, '2020-12-11 21:16:22', '2020-12-11 21:16:22', 'c76d9df0-b6f4-4802-b0fb-df56dd027d15', NULL, '<p>To nurture global leaders with a Godly mindset, who will effect positive change in their communities and the world at large</p>', NULL),
(66, 190, 1, '2020-12-11 21:16:22', '2020-12-11 21:16:22', '3974c689-009b-4fdc-b88c-227a45ce7c39', NULL, '<p>Mahanaim Educational Institute (College) philosophies are based on utilizing the true word and knowledge of the heart that is manifested in the Bible. Through this methodology many students have amazingly acquired progressive and healthy mindsets while evolving into more effective individuals. We have discovered with assurance how people such as Abraham Lincoln and biblical figures such as Joseph and David gained wisdom from the word of God. We have employed education methodologies that will produce leaders for the next generation who will become catalysts of peace and bliss in the society.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(67, 191, 1, '2020-12-11 21:16:22', '2020-12-11 21:16:22', 'd4bb5d77-445d-4193-8702-c7b29aa74a53', 'Philosophy', NULL, NULL),
(68, 193, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '86bc6616-848e-48a0-86cf-cc5fed99893f', 'Mission', NULL, NULL),
(69, 194, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '6a2a41d1-f210-4b65-a16b-2957ddc93e01', NULL, '<p>The mission of MEI is to be a Christian Institution that teaches students the wisdom of God hence cultivating them to become the global leaders. In addition to its commitment of nurturing global leaders, the administration and faculties at MEI will achieve these ends through quality instruction, scholarships, spiritual guidance, student development, service to the community and development of talents fit for its goals in higher education and research. We are taking steps with the faith that God is helping us. <br /></p>', NULL),
(70, 195, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '07a5b98b-8501-4d50-a128-0d636f519625', NULL, '<p>We believe God will greatly strengthen MEI to become an institute that serves as a world mission centre and a source of leaders in this era of globalization. Students at Mahanaim will experience an academic and spiritual growth that empowers them to create a more peaceful, blessed and beautiful world based on Godly principles.</p>\r\n\r\n\r\n\r\n\r\n', NULL),
(71, 196, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '925745c1-a514-4368-ac9e-9dc728194fad', 'Vision', NULL, NULL),
(72, 197, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '55ddeffe-178c-47a8-9fac-90c89ff4607d', NULL, '<p>To nurture global leaders with a Godly mindset, who will effect positive change in their communities and the world at large</p>', NULL),
(73, 198, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', 'e9638dd8-208b-4d35-a011-9b1e5ffde47a', 'Philosophy', NULL, NULL),
(74, 199, 1, '2020-12-11 21:17:21', '2020-12-11 21:17:21', '7377207c-dc13-4691-8a4a-f044316f66d0', NULL, '<p>Mahanaim Educational Institute (College) philosophies are based on utilizing the true word and knowledge of the heart that is manifested in the Bible. Through this methodology many students have amazingly acquired progressive and healthy mindsets while evolving into more effective individuals. We have discovered with assurance how people such as Abraham Lincoln and biblical figures such as Joseph and David gained wisdom from the word of God. We have employed education methodologies that will produce leaders for the next generation who will become catalysts of peace and bliss in the society.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(75, 200, 1, '2020-12-11 21:26:47', '2020-12-11 21:28:39', 'b3f17e81-d076-4b1b-a739-b45a6ae7ef77', 'Challenge', NULL, NULL),
(76, 201, 1, '2020-12-11 21:26:47', '2020-12-11 21:28:39', '3f5f919e-638f-4f49-a46e-b2989062c826', NULL, '<p>The mission of MEI is to be a Christian Institution that teaches students the wisdom of God hence cultivating them to become the global leaders. In addition to its commitment of nurturing global leaders, the administration and faculties at MEI will achieve these ends through quality instruction, scholarships, spiritual guidance, student development, service to the community and development of talents fit for its goals in higher education and research.</p>', NULL),
(77, 202, 1, '2020-12-11 21:26:47', '2020-12-11 21:28:39', 'a7b9ab35-5a17-454b-a3d6-ad9741e34f4b', NULL, '<p> We are taking steps with the faith that God is helping us. We believe God will greatly strengthen MEI to become an institute that serves as a world mission centre and a source of leaders in this era of globalization. Students at Mahanaim will experience an academic and spiritual growth that empowers them to create a more peaceful, blessed and beautiful world based on Godly principles</p>\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(78, 203, 1, '2020-12-11 21:26:47', '2020-12-11 21:28:39', '8d292856-5196-4791-98ef-5001314e975c', 'Change', NULL, NULL),
(79, 204, 1, '2020-12-11 21:26:47', '2020-12-11 21:28:39', 'b1ca5fbe-1d8e-4aea-a671-77677eafc41f', NULL, '<p>To nurture global leaders with a Godly mindset, who will effect positive change in their communities and the world at large.</p>', NULL),
(80, 205, 1, '2020-12-11 21:26:47', '2020-12-11 21:28:39', '85f70e75-d9d7-42f6-a848-368c3f839719', 'Cohesion', NULL, NULL),
(81, 206, 1, '2020-12-11 21:26:47', '2020-12-11 21:28:39', '68793bad-8e73-41d3-959b-73d59df707a3', NULL, '<p>Mahanaim Educational Institute (College) philosophies are based on utilizing the true word and knowledge of the heart that is manifested in the Bible. Through this methodology many students have amazingly acquired progressive and healthy mindsets while evolving into more effective individuals. We have discovered with assurance how people such as Abraham Lincoln and biblical figures such as Joseph and David gained wisdom from the word of God. We have employed education methodologies that will produce leaders for the next generation who will become catalysts of peace and bliss in the society.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(82, 208, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'b7428b07-5ffd-46c2-b6c0-3c5153255143', 'Mission', NULL, NULL),
(83, 209, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '3399d20b-35e8-43e6-b53e-e7a4de999bd4', NULL, '<p>The mission of MEI is to be a Christian Institution that teaches students the wisdom of God hence cultivating them to become the global leaders. In addition to its commitment of nurturing global leaders, the administration and faculties at MEI will achieve these ends through quality instruction, scholarships, spiritual guidance, student development, service to the community and development of talents fit for its goals in higher education and research. We are taking steps with the faith that God is helping us. <br /></p>', NULL),
(84, 210, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '6d1d14b3-57cd-49f1-b16e-e4f12aa273a2', NULL, '<p>We believe God will greatly strengthen MEI to become an institute that serves as a world mission centre and a source of leaders in this era of globalization. Students at Mahanaim will experience an academic and spiritual growth that empowers them to create a more peaceful, blessed and beautiful world based on Godly principles.</p>\r\n\r\n\r\n\r\n\r\n', NULL),
(85, 211, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '43ab19e9-750f-40bb-9c8a-f741e8ca7b9c', 'Vision', NULL, NULL),
(86, 212, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '903fd5ea-92c0-4528-a8d4-22beaca0f82a', NULL, '<p>To nurture global leaders with a Godly mindset, who will effect positive change in their communities and the world at large</p>', NULL),
(87, 213, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '08ea1b78-07bc-4cb0-ba92-1f6b2d4c74ec', 'Philosophy', NULL, NULL),
(88, 214, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '587584fb-54a9-48da-8ea7-f4a9592a662e', NULL, '<p>Mahanaim Educational Institute (College) philosophies are based on utilizing the true word and knowledge of the heart that is manifested in the Bible. Through this methodology many students have amazingly acquired progressive and healthy mindsets while evolving into more effective individuals. We have discovered with assurance how people such as Abraham Lincoln and biblical figures such as Joseph and David gained wisdom from the word of God. We have employed education methodologies that will produce leaders for the next generation who will become catalysts of peace and bliss in the society.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(89, 215, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'f3bbb6e4-c62d-4b31-b32e-bbe9fc842f2c', 'Challenge', NULL, NULL),
(90, 216, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'e0712935-946f-4eea-8fce-ebeb0b6f1515', NULL, '<p>The mission of MEI is to be a Christian Institution that teaches students the wisdom of God hence cultivating them to become the global leaders. In addition to its commitment of nurturing global leaders, the administration and faculties at MEI will achieve these ends through quality instruction, scholarships, spiritual guidance, student development, service to the community and development of talents fit for its goals in higher education and research.</p>', NULL),
(91, 217, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', 'f4226b5e-a24e-4574-b422-64c1fe9e5150', NULL, '<p> We are taking steps with the faith that God is helping us. We believe God will greatly strengthen MEI to become an institute that serves as a world mission centre and a source of leaders in this era of globalization. Students at Mahanaim will experience an academic and spiritual growth that empowers them to create a more peaceful, blessed and beautiful world based on Godly principles</p>\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(92, 218, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '9689f5d0-9080-4a63-a701-2d3490c12488', 'Change', NULL, NULL),
(93, 219, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '43294977-0f6f-412e-a9ac-fee303300e69', NULL, '<p>To nurture global leaders with a Godly mindset, who will effect positive change in their communities and the world at large.</p>', NULL),
(94, 220, 1, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '939286bc-ed84-48b0-b460-df4af7c035a2', 'Cohesion', NULL, NULL),
(95, 221, 1, '2020-12-11 21:26:49', '2020-12-11 21:26:49', 'd0639ab3-ba9a-4c9b-b1f3-12be80353f89', NULL, '<p>Mahanaim Educational Institute (College) philosophies are based on utilizing the true word and knowledge of the heart that is manifested in the Bible. Through this methodology many students have amazingly acquired progressive and healthy mindsets while evolving into more effective individuals. We have discovered with assurance how people such as Abraham Lincoln and biblical figures such as Joseph and David gained wisdom from the word of God. We have employed education methodologies that will produce leaders for the next generation who will become catalysts of peace and bliss in the society.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(96, 222, 1, '2020-12-11 21:28:39', '2020-12-11 21:28:39', '32c7df23-3ee7-4148-b1fb-b2ac5e4bc83f', 'Our Tagline', NULL, NULL),
(97, 224, 1, '2020-12-11 21:28:40', '2020-12-11 21:28:40', '880199aa-95a0-4df7-af65-6809a9ce059e', 'Mission', NULL, NULL),
(98, 225, 1, '2020-12-11 21:28:40', '2020-12-11 21:28:40', 'b5b5316e-4911-420a-96d2-67c79b6ba2b2', NULL, '<p>The mission of MEI is to be a Christian Institution that teaches students the wisdom of God hence cultivating them to become the global leaders. In addition to its commitment of nurturing global leaders, the administration and faculties at MEI will achieve these ends through quality instruction, scholarships, spiritual guidance, student development, service to the community and development of talents fit for its goals in higher education and research. We are taking steps with the faith that God is helping us. <br /></p>', NULL),
(99, 226, 1, '2020-12-11 21:28:40', '2020-12-11 21:28:40', 'eb63821c-322a-4dc5-8156-b439a7919de7', NULL, '<p>We believe God will greatly strengthen MEI to become an institute that serves as a world mission centre and a source of leaders in this era of globalization. Students at Mahanaim will experience an academic and spiritual growth that empowers them to create a more peaceful, blessed and beautiful world based on Godly principles.</p>\r\n\r\n\r\n\r\n\r\n', NULL),
(100, 227, 1, '2020-12-11 21:28:40', '2020-12-11 21:28:40', 'bc112282-4355-4543-95b9-0c64f8a95d5e', 'Vision', NULL, NULL),
(101, 228, 1, '2020-12-11 21:28:40', '2020-12-11 21:28:40', 'b7ac0c0d-2d44-47a8-a766-3433aa56bfe9', NULL, '<p>To nurture global leaders with a Godly mindset, who will effect positive change in their communities and the world at large</p>', NULL),
(102, 229, 1, '2020-12-11 21:28:40', '2020-12-11 21:28:40', '654954e4-676a-4209-a940-901b56ab961f', 'Philosophy', NULL, NULL),
(103, 230, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '77ed892e-9244-4f04-9333-2614e61a8e5b', NULL, '<p>Mahanaim Educational Institute (College) philosophies are based on utilizing the true word and knowledge of the heart that is manifested in the Bible. Through this methodology many students have amazingly acquired progressive and healthy mindsets while evolving into more effective individuals. We have discovered with assurance how people such as Abraham Lincoln and biblical figures such as Joseph and David gained wisdom from the word of God. We have employed education methodologies that will produce leaders for the next generation who will become catalysts of peace and bliss in the society.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(104, 231, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '8df08044-d441-48b4-a007-b6b476de5303', 'Our Tagline', NULL, NULL),
(105, 232, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', 'dd8095b8-a209-41ee-bf8e-11b397db56a4', 'Challenge', NULL, NULL),
(106, 233, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '0f371c6a-15ea-4fe8-81b8-3100faf03d8f', NULL, '<p>The mission of MEI is to be a Christian Institution that teaches students the wisdom of God hence cultivating them to become the global leaders. In addition to its commitment of nurturing global leaders, the administration and faculties at MEI will achieve these ends through quality instruction, scholarships, spiritual guidance, student development, service to the community and development of talents fit for its goals in higher education and research.</p>', NULL),
(107, 234, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', 'f48a6cf1-6b50-427f-8e08-6f4e07e1487c', NULL, '<p> We are taking steps with the faith that God is helping us. We believe God will greatly strengthen MEI to become an institute that serves as a world mission centre and a source of leaders in this era of globalization. Students at Mahanaim will experience an academic and spiritual growth that empowers them to create a more peaceful, blessed and beautiful world based on Godly principles</p>\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(108, 235, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '04030260-3c69-450c-9df5-517b2646c5ef', 'Change', NULL, NULL),
(109, 236, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', 'a50a3793-72aa-4104-beea-cdb6c3367096', NULL, '<p>To nurture global leaders with a Godly mindset, who will effect positive change in their communities and the world at large.</p>', NULL),
(110, 237, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '8a61420d-3e98-49ed-b9c5-76ecb69f50e5', 'Cohesion', NULL, NULL),
(111, 238, 1, '2020-12-11 21:28:41', '2020-12-11 21:28:41', '0d4337ac-321a-4c4f-8ef7-10128a627f04', NULL, '<p>Mahanaim Educational Institute (College) philosophies are based on utilizing the true word and knowledge of the heart that is manifested in the Bible. Through this methodology many students have amazingly acquired progressive and healthy mindsets while evolving into more effective individuals. We have discovered with assurance how people such as Abraham Lincoln and biblical figures such as Joseph and David gained wisdom from the word of God. We have employed education methodologies that will produce leaders for the next generation who will become catalysts of peace and bliss in the society.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(112, 240, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '2439c58a-383b-40d5-ba9e-0ffb7cd4d24e', 'Chancellor\'s Message', NULL, NULL),
(113, 241, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', 'd0535c47-5ca9-44ab-8d32-a0dd6fa2a53f', NULL, '<p>A few years &lt;b&gt;ago&lt;/b&gt;, we held an English speech contest for Korean university students. After listening to them speak such fluent English, I felt that some of these students would arise to become leaders that not only guide their nation, but the rest of the world. All they need is a healthy heart. <br /></p>', NULL),
(114, 242, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '6cf56728-7dfb-449a-8a39-4509f6ddf3de', NULL, '<p>I want to teach young people to break out of their molds, spend time with each other, and share their hearts. There are reasons why we take the time to bend our hearts and empty ourselves of our thoughts. If not done at a young age, it would be impossible to achieve success later in life. Even though we have shortcomings, we can receive the help of others to compensate our shortcomings through unity and fellowship.</p>', NULL),
(115, 243, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '0d2cb9a3-0aa6-42bb-b82b-ac3f36b17514', NULL, '<p>Tomorrow about this time, next year about this time, even ten years about this time, if young people could foresee the change they will undergo, they would not live according to the desires of their flesh, but cherish a greater hope in heaven. God has prepared an amazing future for us, and as young adults we need to learn about the true world of the heart, Mahanaim, which means God’s Camp, will raise them into great men and women with the capacity to lead the world. This change will come through Mahanaim Educational Institute(College).</p>', NULL),
(116, 244, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '675343d3-a12a-47d6-b229-ad1e7be29d52', NULL, NULL, NULL),
(117, 245, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '1eb95e38-46fd-47cb-9188-ac0e3c3ff415', 'Principal\'s Message', NULL, NULL),
(118, 246, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '98b5be68-5c6c-4dab-97b0-3e797b6244c1', NULL, '<p>Education in Kenya has taken turns and twists and several Education commissions have made recommendations which have made higher Education what it is today; Latest being the transition from 8-4-4 system of education to the current system of2-6-3-3-3. The demand for higher education increases by the day. In the past two years, the number of students meeting the university cutoff points has reduced drastically while the number of students who can join tertiary institutions has increased.<br /></p>', NULL),
(119, 247, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '85d40da7-2947-4731-b362-93a5e8a1e25e', NULL, '<p>Education being one of the main pillar to Kenya’s achievement of Vision 2030, mind-shift on perception of tertiary education is very important. Technical colleges are not second class to universities. We should learn from advanced economies such as Germany that have had a successful system of technical training. Mahanaim Educational Institute (MEI) is accredited by the Ministry of Higher Education, through Technical and Vocational Education and Training. </p>', NULL),
(120, 248, 1, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '19d9ae6e-9b32-49bb-95f3-dd4d243ddf78', NULL, '<p>Authority (TVETA/PRIVATE/TVC/0221/2016) to offer courses both in diploma and certificate levels. In MEI we instill a Godly mindset to our students so that they can be agents of change in Kenya, Africa and the rest of the world. Through our Motto; Challenge, Change and Cohesion, we encourage our students to view themselves as global leaders through challenging them to overcome their own personal limits. We also instill positive values that transform lives. We create cohesion by exposing them to a multicultural environment and enabling participation in exchange programs between youths from over 80 different countries all over the world.<br /></p>', NULL),
(121, 249, 1, '2020-12-12 05:53:26', '2020-12-12 05:53:26', '22b1a013-703c-4ebf-8291-a4fbf40105d2', NULL, '<p>We continue to improve our teaching, learning and research facilities so as to create the best environment for our students, such as a well equipped library, modern lecture halls, modern training radio studio for Journalism students, restaurant for Hospitality students, Computer laboratories for ICDL and Graphics students language laboratories among others.<br /></p>', NULL),
(122, 250, 1, '2020-12-12 05:53:26', '2020-12-12 05:53:26', '81766652-f7f9-4974-87eb-9051b5f3b0c2', NULL, '<p>MEI appreciates the value and the power of practicum. To ensure that the students identify with what is taught in class; MEI has forged collaborations with other institutions of higher learning and the industry at large. I welcome all who are looking forward to studying in a serene environment which offers the best opportunity for excellence in all scopes of life.</p>\r\n\r\n\r\n\r\n\r\n', NULL),
(123, 252, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '3460ca4f-0a2f-43e9-bbab-265cf06032eb', 'Chancellor\'s Message', NULL, NULL),
(124, 253, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '8f6f5153-f72e-44f5-a2bf-b666aac04727', NULL, '<p>A few years ago, we held an English speech contest for Korean university students. After listening to them speak such fluent English, I felt that some of these students would arise to become leaders that not only guide their nation, but the rest of the world. All they need is a healthy heart. <br /></p>', NULL),
(125, 254, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'b2ff5296-3a2a-43e4-b490-6fb62abc145a', NULL, '<p>I want to teach young people to break out of their molds, spend time with each other, and share their hearts. There are reasons why we take the time to bend our hearts and empty ourselves of our thoughts. If not done at a young age, it would be impossible to achieve success later in life. Even though we have shortcomings, we can receive the help of others to compensate our shortcomings through unity and fellowship.</p>', NULL),
(126, 255, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'd1fc468a-0b22-4fb0-9aa9-cd9889df6cc2', NULL, '<p>Tomorrow about this time, next year about this time, even ten years about this time, if young people could foresee the change they will undergo, they would not live according to the desires of their flesh, but cherish a greater hope in heaven. God has prepared an amazing future for us, and as young adults we need to learn about the true world of the heart, Mahanaim, which means God’s Camp, will raise them into great men and women with the capacity to lead the world. This change will come through Mahanaim Educational Institute(College).</p>', NULL),
(127, 256, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '49d6ad19-4d8a-474f-8f0e-c60192c92ef6', NULL, NULL, NULL);
INSERT INTO `matrixcontent_bodycontent` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_heading_heading`, `field_paragraph_text`, `field_link_links`) VALUES
(128, 257, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'a34fb645-b364-4f78-848e-2aff4cf14fc5', 'Principal\'s Message', NULL, NULL),
(129, 258, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'f7f51077-6f28-4f03-91e7-f0825b76fed3', NULL, '<p>Education in Kenya has taken turns and twists and several Education commissions have made recommendations which have made higher Education what it is today; Latest being the transition from 8-4-4 system of education to the current system of2-6-3-3-3. The demand for higher education increases by the day. In the past two years, the number of students meeting the university cutoff points has reduced drastically while the number of students who can join tertiary institutions has increased.<br /></p>', NULL),
(130, 259, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'cc7c63e0-aee9-4028-8728-a5af29d24abc', NULL, '<p>Education being one of the main pillar to Kenya’s achievement of Vision 2030, mind-shift on perception of tertiary education is very important. Technical colleges are not second class to universities. We should learn from advanced economies such as Germany that have had a successful system of technical training. Mahanaim Educational Institute (MEI) is accredited by the Ministry of Higher Education, through Technical and Vocational Education and Training. </p>', NULL),
(131, 260, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', 'e6b5cf25-65e5-45f2-b1bf-a7c86a8632d1', NULL, '<p>Authority (TVETA/PRIVATE/TVC/0221/2016) to offer courses both in diploma and certificate levels. In MEI we instill a Godly mindset to our students so that they can be agents of change in Kenya, Africa and the rest of the world. Through our Motto; Challenge, Change and Cohesion, we encourage our students to view themselves as global leaders through challenging them to overcome their own personal limits. We also instill positive values that transform lives. We create cohesion by exposing them to a multicultural environment and enabling participation in exchange programs between youths from over 80 different countries all over the world.<br /></p>', NULL),
(132, 261, 1, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '588f9c6c-408a-45a4-b0a1-7f5da5c2b3f4', NULL, '<p>We continue to improve our teaching, learning and research facilities so as to create the best environment for our students, such as a well equipped library, modern lecture halls, modern training radio studio for Journalism students, restaurant for Hospitality students, Computer laboratories for ICDL and Graphics students language laboratories among others.<br /></p>', NULL),
(133, 262, 1, '2020-12-12 05:56:31', '2020-12-12 05:56:31', '266aaec8-48f3-48c1-aef9-22050f0f6529', NULL, '<p>MEI appreciates the value and the power of practicum. To ensure that the students identify with what is taught in class; MEI has forged collaborations with other institutions of higher learning and the industry at large. I welcome all who are looking forward to studying in a serene environment which offers the best opportunity for excellence in all scopes of life.</p>\r\n\r\n\r\n\r\n\r\n', NULL),
(134, 263, 1, '2020-12-12 06:12:24', '2020-12-12 09:01:11', '2e8e7874-c85d-4a66-bf03-51e1e32be800', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/TERM%20DATES%20(4).pdf\" target=\"_blank\" rel=\"noreferrer noopener\">2019 Academic Schedule</a></p>'),
(135, 264, 1, '2020-12-12 06:12:25', '2020-12-12 08:02:34', 'ddcf475c-5015-4dcb-9c20-ff0cdc7ca768', NULL, NULL, '2020 Academic Schedule'),
(136, 266, 1, '2020-12-12 06:12:26', '2020-12-12 06:12:26', 'ddabab90-1083-438a-8ca9-d9bf8be75b98', NULL, NULL, '<p>2019 Academic Schedule</p>'),
(137, 267, 1, '2020-12-12 06:12:26', '2020-12-12 06:12:26', '33a290bf-4f82-4b71-9518-fdaafea82715', NULL, NULL, '<p>2020 Academic Schedule</p>'),
(138, 268, 1, '2020-12-12 06:18:17', '2020-12-12 06:18:17', '97d889ae-6993-44ae-867c-eb49b799b8d2', NULL, NULL, '<p>2020 Academic Schedule</p>'),
(139, 269, 1, '2020-12-12 06:18:17', '2020-12-12 06:18:17', '94d69546-083c-4624-9d8c-9a7e9c9ed47f', NULL, NULL, '<p>2020 Academic Schedule</p>'),
(140, 271, 1, '2020-12-12 06:18:18', '2020-12-12 06:18:18', '8bb698bd-5602-4c5c-a256-7220b7da0961', NULL, NULL, '<p>2020 Academic Schedule</p>'),
(141, 272, 1, '2020-12-12 06:18:18', '2020-12-12 06:18:18', '0a759506-dd49-4fb1-8c38-c95659eabd71', NULL, NULL, '<p>2020 Academic Schedule</p>'),
(142, 273, 1, '2020-12-12 06:22:48', '2020-12-12 09:09:50', '1d00fa55-36f1-48e1-9038-99126196c656', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/Hospitality&amp;Tourism%20fee%20structure.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Hospitality &amp; Tourism</a><br /></p>'),
(143, 275, 1, '2020-12-12 06:22:49', '2020-12-12 06:22:49', '0f3f16ca-6bae-43c3-8881-bd73c8e2b424', NULL, NULL, '<p>Journalism</p>'),
(144, 276, 1, '2020-12-12 06:26:26', '2020-12-12 09:09:50', 'e8b94f47-ccbb-4603-af9f-5bcceae2a298', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/JORNALISIM%20FEE%20STRUCTURE.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Journalism</a></p>'),
(145, 277, 1, '2020-12-12 06:26:27', '2020-12-12 09:09:50', 'abffb0d3-2654-4667-9ae2-6efce260ebe2', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/Elecric%20&amp;%20Electronics.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Engineering</a><br /></p>'),
(146, 278, 1, '2020-12-12 06:26:27', '2020-12-12 09:09:50', 'ab81500e-0f43-473b-8e75-4433b58efc34', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/ICT%20&amp;%20IT%20fee%20structure.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Computer Studies</a><br /></p>'),
(147, 279, 1, '2020-12-12 06:26:27', '2020-12-12 09:09:50', 'e617f8f7-26a3-42a1-ab0f-ae01496708d1', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/ICDL.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">ICDL</a></p>'),
(148, 280, 1, '2020-12-12 06:26:27', '2020-12-12 09:09:50', '950b6f70-e497-40e6-a92b-85896b02b50f', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/Business%20(2)%20(1).pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Business Studies</a><br /></p>'),
(149, 281, 1, '2020-12-12 06:26:27', '2020-12-12 09:09:50', 'fa403569-0943-4f4e-99bc-e1418d29c745', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/Fee%20structure%20language.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Languages</a></p>'),
(150, 282, 1, '2020-12-12 06:26:27', '2020-12-12 09:09:50', 'b47e7604-2963-43e4-b259-d182ab519732', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/SCHOOL%20OF%20MUSIC%20AND%20SPORTS%20FEE%20STRUCTURE.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Tae Kwon Do</a><br /></p>'),
(151, 284, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '12ab0f0e-7b25-4939-84de-9fd66f1aa987', NULL, NULL, '<p>Hospitality &amp; tourism</p>'),
(152, 285, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', 'dcb5999d-92e7-4127-97b1-336e9c5482d4', NULL, NULL, 'Journalism'),
(153, 286, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', 'd78627b0-c181-4f56-802e-1facbb7d5e7f', NULL, NULL, 'Engineering'),
(154, 287, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '977be539-6245-4f89-b5c2-fc8f4151aa2b', NULL, NULL, 'Computer Studies'),
(155, 288, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', '3dac26ac-9c36-4710-8c7e-acb35d9be246', NULL, NULL, 'ICDL'),
(156, 289, 1, '2020-12-12 06:26:27', '2020-12-12 06:26:27', 'd7da738b-8ec4-43a1-9ea2-01081f931c04', NULL, NULL, 'Business Studies'),
(157, 290, 1, '2020-12-12 06:26:28', '2020-12-12 06:26:28', 'be4d5d90-01f3-48c5-8e69-e6d8f132fdca', NULL, NULL, 'Languages'),
(158, 291, 1, '2020-12-12 06:26:28', '2020-12-12 06:26:28', '6f403316-5a9f-464f-8fd9-4f9922d64a80', NULL, NULL, 'Tae Kwon Do<br />'),
(159, 292, 1, '2020-12-12 06:40:54', '2020-12-12 06:41:31', 'f2d28eab-b57e-418a-823b-cc85f54922f1', 'Overall Best Performer', NULL, NULL),
(160, 293, 1, '2020-12-12 06:40:55', '2020-12-12 06:41:31', 'e7d60885-2ecd-41a0-b050-aa673617a608', NULL, '<p>This category of scholarship is awarded to students who have shown exemplary performance per department in a given semester. The beneficiary is awarded a 100% scholarship on tuition fee in the subsequent semester. The selection is based on final examination results of a given department that has met the required capacity; usually set at over 20 students.</p>\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(161, 294, 1, '2020-12-12 06:40:55', '2020-12-12 06:41:31', 'dcc1568a-78cc-44c3-8729-e11d9ba27f44', 'Recommendation by High School Principals and Church Pastors', NULL, NULL),
(162, 295, 1, '2020-12-12 06:40:55', '2020-12-12 06:41:31', '945034af-54ee-4439-8500-c12a389e70e9', NULL, '<p>This category of scholarship is awarded to students who join the institute through a recommendation from their former High school principal or their Church pastor. The beneficiary is awarded a 30% scholarship on tuition fee for the period that the MoU is valid.</p>\r\n\r\n\r\n\r\n', NULL),
(163, 296, 1, '2020-12-12 06:40:56', '2020-12-12 06:41:31', '525daa3c-687b-490e-8e9f-a87007d67f66', 'Volunteers Scholarship', NULL, NULL),
(164, 297, 1, '2020-12-12 06:40:56', '2020-12-12 06:41:31', 'cf72fef1-6e1e-4434-8b84-e2e2ccd2d4bb', NULL, '<p>This category of scholarship is awarded to students who have heartily volunteered at Mahanaim Educational Institute. The beneficiary is awarded a stipend of Ksh. 5,000 per month for the selected period.</p>\r\n', NULL),
(165, 298, 1, '2020-12-12 06:40:56', '2020-12-12 06:41:31', '2d929073-aa7d-4283-b178-1d24dc7af21f', 'Affiliation Companies', NULL, NULL),
(166, 299, 1, '2020-12-12 06:40:56', '2020-12-12 06:41:31', '276301cf-dc02-486c-a2a1-c3572ad2a6b1', NULL, '<p>This category of scholarship is awarded to students through the Mahanaim Educational Institute affiliate Companies and Organizations. The beneficiary is awarded the scholarship as per the companies’ policy.</p>\r\n', NULL),
(167, 300, 1, '2020-12-12 06:40:56', '2020-12-12 06:41:31', '39c4d293-0c8b-4bbe-94c9-8ac7fdf3d8eb', 'NGO’s and Organizations', NULL, NULL),
(168, 301, 1, '2020-12-12 06:40:56', '2020-12-12 06:41:31', 'c0ae8c70-dd8b-45d2-a54e-d2bb7641de9b', NULL, '<p>This category of scholarship is awarded to students through the Mahanaim Educational Institute affiliate NGO’s and Organisations whose main objective is to empower youths with educational skills and compitencies. The beneficiary is awarded the scholarship as per the NGOs’ organisations’ policy.</p>\r\n\r\n', NULL),
(169, 303, 1, '2020-12-12 06:40:56', '2020-12-12 06:40:56', '51cdfcd0-0a09-4251-8c6e-dd8394e39a88', 'Overall Best Performer', NULL, NULL),
(170, 304, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '2ebc5daa-5d35-4d5a-a6f6-f36646614dca', NULL, '<p>This category of scholarship is awarded to students who have shown exemplary performance per department in a given semester. The beneficiary is awarded a 100% scholarship on tuition fee in the subsequent semester. The selection is based on final examination results of a given department that has met the required capacity; usually set at over 20 students.</p>\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(171, 305, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '0c38f11a-17d1-424b-87ef-c93ac15d5878', 'Recommendation by High School Principals and Church Pastors', NULL, NULL),
(172, 306, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '762a382c-43f6-4819-9e0f-046402b51abc', NULL, '<p>This category of scholarship is awarded to students who join the institute through a recommendation from their former High school principal or their Church pastor. The beneficiary is awarded a 30% scholarship on tuition fee for the period that the MoU is valid.</p>\r\n\r\n\r\n\r\n', NULL),
(173, 307, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '3babebb6-3c87-42e2-8791-648bf70f1c11', 'Volunteers Scholarship', NULL, NULL),
(174, 308, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '9b796802-9dfc-4754-a9bb-63954daf2b92', NULL, '<p>This category of scholarship is awarded to students who have heartily volunteered at Mahanaim Educational Institute. The beneficiary is awarded a stipend of Ksh. 5,000 per month for the selected period.</p>\r\n', NULL),
(175, 309, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '06b4ce14-4862-4e10-9815-b4830fb62cb9', 'Affiliation Companies', NULL, NULL),
(176, 310, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', '8631981d-fee6-4daf-b0f3-e661b8ae7253', NULL, '<p>This category of scholarship is awarded to students through the Mahanaim Educational Institute affiliate Companies and Organizations. The beneficiary is awarded the scholarship as per the companies’ policy.</p>\r\n', NULL),
(177, 311, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', 'f6df0c75-0fe6-496d-bab4-a2ab560cc6db', 'NGO’s and Organizations', NULL, NULL),
(178, 312, 1, '2020-12-12 06:40:57', '2020-12-12 06:40:57', 'add76fda-fb72-40b1-a2fa-9e7744140756', NULL, '<p>This category of scholarship is awarded to students through the Mahanaim Educational Institute affiliate NGO’s and Organisations whose main objective is to empower youths with educational skills and compitencies. The beneficiary is awarded the scholarship as per the NGOs’ organisations’ policy.</p>\r\n\r\n', NULL),
(179, 313, 1, '2020-12-12 06:41:31', '2020-12-12 06:41:31', 'be57649e-dbb6-4de6-b7a1-95d72b11feb2', NULL, '<h5><em>Please note that these scholarships are either partially or fully awarded.</em></h5>', NULL),
(180, 315, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'bc39e028-57c7-442f-87bd-3dd49e503499', 'Overall Best Performer', NULL, NULL),
(181, 316, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '74687487-eb0b-4016-b7c4-e64ab593f8db', NULL, '<p>This category of scholarship is awarded to students who have shown exemplary performance per department in a given semester. The beneficiary is awarded a 100% scholarship on tuition fee in the subsequent semester. The selection is based on final examination results of a given department that has met the required capacity; usually set at over 20 students.</p>\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(182, 317, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'd97a8645-5f9f-4302-88a0-857e1c7c2d0f', 'Recommendation by High School Principals and Church Pastors', NULL, NULL),
(183, 318, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'e40e9fb6-c661-4309-8f87-066d70de83bd', NULL, '<p>This category of scholarship is awarded to students who join the institute through a recommendation from their former High school principal or their Church pastor. The beneficiary is awarded a 30% scholarship on tuition fee for the period that the MoU is valid.</p>\r\n\r\n\r\n\r\n', NULL),
(184, 319, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '41e74328-ada2-4a8a-9623-6b09d014d7e6', 'Volunteers Scholarship', NULL, NULL),
(185, 320, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '963d6e4a-9479-47eb-baf5-2223319ea445', NULL, '<p>This category of scholarship is awarded to students who have heartily volunteered at Mahanaim Educational Institute. The beneficiary is awarded a stipend of Ksh. 5,000 per month for the selected period.</p>\r\n', NULL),
(186, 321, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '31ec4d86-ed02-4fde-bdab-8e585c3df19d', 'Affiliation Companies', NULL, NULL),
(187, 322, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'd3c4e48b-d364-4824-a083-2eb2ede57aef', NULL, '<p>This category of scholarship is awarded to students through the Mahanaim Educational Institute affiliate Companies and Organizations. The beneficiary is awarded the scholarship as per the companies’ policy.</p>\r\n', NULL),
(188, 323, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', 'd88aba62-4b45-4177-8197-474e30936b44', 'NGO’s and Organizations', NULL, NULL),
(189, 324, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '84b02d81-1865-4521-a1d2-c7338c0efdc7', NULL, '<p>This category of scholarship is awarded to students through the Mahanaim Educational Institute affiliate NGO’s and Organisations whose main objective is to empower youths with educational skills and compitencies. The beneficiary is awarded the scholarship as per the NGOs’ organisations’ policy.</p>\r\n\r\n', NULL),
(190, 325, 1, '2020-12-12 06:41:32', '2020-12-12 06:41:32', '87ad837f-2031-45ea-aa33-0d0318896963', NULL, '<h5><em>Please note that these scholarships are either partially or fully awarded.</em></h5>', NULL),
(191, 326, 1, '2020-12-12 06:54:25', '2020-12-12 07:17:27', '4f7aac15-a3fc-4a25-951f-f7fde03c34ec', 'Hospitality & Tourism', NULL, NULL),
(192, 327, 1, '2020-12-12 06:54:26', '2020-12-12 07:17:28', '179987a9-3ce6-46bb-9967-16efaf22d311', NULL, '<p>The School of Tourism and Hospitality, has two departments, hosting a number of programmes such as Diploma in Tourism Management (KNEC), Diploma in Food and Beverage Management (KNEC), Certificate in Tour Guiding and Travel Operations (KNEC), Certificate in Food and Beverage Sales and Services(KNEC) Diploma and Certificate in Travel and Tourism (ICM), Diploma and Certificate in Hospitality Management, Baking and Pastry, Food and Beverage Production (Cookery), Food and Beverage Service, Housekeeping, Front Office.</p>', NULL),
(193, 328, 1, '2020-12-12 06:54:26', '2020-12-12 07:17:28', '69e85ca6-abce-4e89-8d25-48f73110fa04', NULL, '<p> The school is at the fore-front in bridging training needs and gaps identified in Kenya Vision 2030, National Tourism Policy, and the Ministry of Tourism’s Strategic Plan with regard to the context of the nation’s tourism industry through knowledge, competencies and skills requisite in the management of the travel, tourism and hospitality sectors in Kenya. It aims at offering insights into the real-world problems and issues confronting the tourism industry and; the travel and tour operations, hotel &amp; hospitality sectors, in particular, at the local, regional and international level.The school also has competent faculty members who are all round in practical and theoretical areas of tourism and hospitality.</p>', NULL),
(194, 329, 1, '2020-12-12 06:54:26', '2020-12-12 07:17:28', '8c578565-0a46-4b6c-b061-79df5e54f236', NULL, '<p>Through innovative teaching and learning approaches, such as Tutorials, industry aligned exposure, globally mapped approach and qualified lecturers, the Departments within the school continue to: promote tourism, travel and hospitality research and development through practicals at Safari park Hotel, Dragon Fly Tour</p>', NULL),
(195, 330, 1, '2020-12-12 06:54:26', '2020-12-12 07:17:28', '35b5a7b7-45f8-48e3-b383-45811a69225a', NULL, NULL, '<p><u>Courses</u></p>'),
(196, 332, 1, '2020-12-12 06:54:26', '2020-12-12 06:54:26', 'ab3ab37d-6825-4c18-8c3f-7c21ccce2f6a', 'Hospitality & Tourism', NULL, NULL),
(197, 333, 1, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '851c4de8-e7a7-45e0-a11c-a6d2c814f5d7', NULL, '<p>The School of Tourism and Hospitality, has two departments, hosting a number of programmes such as Diploma in Tourism Management (KNEC), Diploma in Food and Beverage Management (KNEC), Certificate in Tour Guiding and Travel Operations (KNEC), Certificate in Food and Beverage Sales and Services(KNEC) Diploma and Certificate in Travel and Tourism (ICM), Diploma and Certificate in Hospitality Management, Baking and Pastry, Food and Beverage Production (Cookery), Food and Beverage Service, Housekeeping, Front Office.</p>', NULL),
(198, 334, 1, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '1e17d760-9645-451c-b6ad-8d62cae39928', NULL, '<p> The school is at the fore-front in bridging training needs and gaps identified in Kenya Vision 2030, National Tourism Policy, and the Ministry of Tourism’s Strategic Plan with regard to the context of the nation’s tourism industry through knowledge, competencies and skills requisite in the management of the travel, tourism and hospitality sectors in Kenya. It aims at offering insights into the real-world problems and issues confronting the tourism industry and; the travel and tour operations, hotel &amp; hospitality sectors, in particular, at the local, regional and international level.The school also has competent faculty members who are all round in practical and theoretical areas of tourism and hospitality.</p>', NULL),
(199, 335, 1, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '4291c8c1-c774-4e10-bae6-8830928e7484', NULL, '<p>Through innovative teaching and learning approaches, such as Tutorials, industry aligned exposure, globally mapped approach and qualified lecturers, the Departments within the school continue to: promote tourism, travel and hospitality research and development through practicals at Safari park Hotel, Dragon Fly Tour</p>\r\n\r\n\r\n\r\n', NULL),
(200, 336, 1, '2020-12-12 06:54:27', '2020-12-12 06:54:27', '66362184-b8df-4b2d-b0b8-21edaa07a281', NULL, NULL, '<p>Courses</p>'),
(201, 338, 1, '2020-12-12 06:55:53', '2020-12-12 06:55:53', '68a4a7d7-b5a9-4841-a712-900e816d95fc', 'Hospitality & Tourism', NULL, NULL),
(202, 339, 1, '2020-12-12 06:55:53', '2020-12-12 06:55:53', '7d27e407-a56b-46d5-85d7-f7a5ad146180', NULL, '<p>The School of Tourism and Hospitality, has two departments, hosting a number of programmes such as Diploma in Tourism Management (KNEC), Diploma in Food and Beverage Management (KNEC), Certificate in Tour Guiding and Travel Operations (KNEC), Certificate in Food and Beverage Sales and Services(KNEC) Diploma and Certificate in Travel and Tourism (ICM), Diploma and Certificate in Hospitality Management, Baking and Pastry, Food and Beverage Production (Cookery), Food and Beverage Service, Housekeeping, Front Office.</p>', NULL),
(203, 340, 1, '2020-12-12 06:55:54', '2020-12-12 06:55:54', 'e7bbbed0-001f-4c52-8b5f-ae12c878bbdb', NULL, '<p> The school is at the fore-front in bridging training needs and gaps identified in Kenya Vision 2030, National Tourism Policy, and the Ministry of Tourism’s Strategic Plan with regard to the context of the nation’s tourism industry through knowledge, competencies and skills requisite in the management of the travel, tourism and hospitality sectors in Kenya. It aims at offering insights into the real-world problems and issues confronting the tourism industry and; the travel and tour operations, hotel &amp; hospitality sectors, in particular, at the local, regional and international level.The school also has competent faculty members who are all round in practical and theoretical areas of tourism and hospitality.</p>', NULL),
(204, 341, 1, '2020-12-12 06:55:54', '2020-12-12 06:55:54', '34762d2e-4427-4257-af2b-ec0ddf0fcbe2', NULL, '<p>Through innovative teaching and learning approaches, such as Tutorials, industry aligned exposure, globally mapped approach and qualified lecturers, the Departments within the school continue to: promote tourism, travel and hospitality research and development through practicals at Safari park Hotel, Dragon Fly Tour</p>\r\n\r\n\r\n\r\n', NULL),
(205, 342, 1, '2020-12-12 06:55:54', '2020-12-12 06:55:54', '40a538d6-2da5-4583-ae86-deaa47569be3', NULL, NULL, '<p><u>Courses</u></p>'),
(206, 343, 1, '2020-12-12 06:59:06', '2020-12-12 07:17:28', 'e0a3c8b0-4d8a-4364-8c5a-2acebca6bdc9', 'Journalism & Media', NULL, NULL),
(207, 344, 1, '2020-12-12 06:59:06', '2020-12-12 07:17:28', 'b2e72f97-5a04-427d-b012-6f3ebf37ac3e', NULL, '<p>The world today would have remained in optimum darkness if it were not for the various steps put forward by the media to inform and shed light on the daily occurrences, both locally and internationally. We therefore take pride in preparing right minded students for leadership careers in communications and media. This preparation is grounded in solid scholarship and an all rounded approach to education anchored in our philosophy derived from our Christian orientation and biblical teachings. We have talented,skilled and passionate personnel who are out to ensure excellence and success of the students in their faculties.</p>', NULL),
(208, 345, 1, '2020-12-12 06:59:06', '2020-12-12 07:17:28', 'd02e0ea8-f99f-49ee-81c3-857fa5723091', NULL, '<p>At Mahanaim College, it is our duty and practice to bridge the gap between theory and practice in training. For this, our students have practical training sessions at Good News Broadcasting System (GBS), a T.V station which partners with Mahanaim College to offer the best practical training and exposure tour students in their various fields. Through this, we have all the confidence in presenting our students to the job market and to the various organizations whose goals are in demand of such professionals.We would like to invite you to visit us and explore the various opportunities of studies we have in the school of Journalism and Media at Mahanaim College, join us and experience the quality.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(209, 346, 1, '2020-12-12 06:59:06', '2020-12-12 07:20:31', 'd2be776f-f3da-49ca-824c-0bcc6b596b75', NULL, NULL, '<u>Courses</u>'),
(210, 348, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', 'd9d9ba39-7f00-4d17-b87b-15851a7c2351', 'Hospitality & Tourism', NULL, NULL),
(211, 349, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '046dd32e-d212-4d44-84da-c93e59a04596', NULL, '<p>The School of Tourism and Hospitality, has two departments, hosting a number of programmes such as Diploma in Tourism Management (KNEC), Diploma in Food and Beverage Management (KNEC), Certificate in Tour Guiding and Travel Operations (KNEC), Certificate in Food and Beverage Sales and Services(KNEC) Diploma and Certificate in Travel and Tourism (ICM), Diploma and Certificate in Hospitality Management, Baking and Pastry, Food and Beverage Production (Cookery), Food and Beverage Service, Housekeeping, Front Office.</p>', NULL),
(212, 350, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', 'e7e3caec-ba2c-41fa-8bd1-ecd421647901', NULL, '<p> The school is at the fore-front in bridging training needs and gaps identified in Kenya Vision 2030, National Tourism Policy, and the Ministry of Tourism’s Strategic Plan with regard to the context of the nation’s tourism industry through knowledge, competencies and skills requisite in the management of the travel, tourism and hospitality sectors in Kenya. It aims at offering insights into the real-world problems and issues confronting the tourism industry and; the travel and tour operations, hotel &amp; hospitality sectors, in particular, at the local, regional and international level.The school also has competent faculty members who are all round in practical and theoretical areas of tourism and hospitality.</p>', NULL),
(213, 351, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '662bd60d-d05f-4608-815d-3ff4febb7dbf', NULL, '<p>Through innovative teaching and learning approaches, such as Tutorials, industry aligned exposure, globally mapped approach and qualified lecturers, the Departments within the school continue to: promote tourism, travel and hospitality research and development through practicals at Safari park Hotel, Dragon Fly Tour</p>', NULL),
(214, 352, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '0910237c-31c2-49f8-9670-7dc2074edd03', NULL, NULL, '<p><u>Courses</u></p>'),
(215, 353, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '0f9d218c-e59d-43ea-bde0-3955cb6fd517', 'Journalism & Media', NULL, NULL),
(216, 354, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '51745688-2f24-47a3-97ee-c565e6f2414c', NULL, '<p>The world today would have remained in optimum darkness if it were not for the various steps put forward by the media to inform and shed light on the daily occurrences, both locally and internationally. We therefore take pride in preparing right minded students for leadership careers in communications and media. This preparation is grounded in solid scholarship and an all rounded approach to education anchored in our philosophy derived from our Christian orientation and biblical teachings. We have talented,skilled and passionate personnel who are out to ensure excellence and success of the students in their faculties.</p>', NULL),
(217, 355, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '19e9edb0-fd32-41f1-9a6e-bab3d676458e', NULL, '<p>At Mahanaim College, it is our duty and practice to bridge the gap between theory and practice in training. For this, our students have practical training sessions at Good News Broadcasting System (GBS), a T.V station which partners with Mahanaim College to offer the best practical training and exposure tour students in their various fields. Through this, we have all the confidence in presenting our students to the job market and to the various organizations whose goals are in demand of such professionals.We would like to invite you to visit us and explore the various opportunities of studies we have in the school of Journalism and Media at Mahanaim College, join us and experience the quality.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(218, 356, 1, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '3c90be62-ff3d-44dd-a425-6161c1543d94', NULL, NULL, '<p>Courses</p>'),
(219, 357, 1, '2020-12-12 07:04:30', '2020-12-12 07:17:28', 'd83a5e93-a250-474f-832c-38785a10846e', 'Engineering', NULL, NULL),
(220, 358, 1, '2020-12-12 07:04:30', '2020-12-12 07:17:29', '46807618-2759-4401-b99b-55ab6caf4002', NULL, '<p>Engineering is one of the most in demand courses in middle income economies like Kenya. In line with the country’s vision 2030 engineers and technologists are at the center of innovating systems to meet the requirements of our ever changing technological environment. Our school of Engineering offers a really world experience to our students through integration of quality training with our spiritual foundation.We offer Artisan, Craft Certificate and Diploma in Electrical and Electronic Engineering.</p>', NULL),
(221, 359, 1, '2020-12-12 07:04:30', '2020-12-12 07:17:29', '7903ca6c-4619-46e6-a0ce-fd2d074bf7a0', NULL, '<p> The program strives to maintain a balance between classroom lectures and laboratory and design experience, and it emphasizes the problem formulation, system-design, and solving skills that are essential to any engineering discipline. Our state of the art, well equipped modern laboratories is a true testimony that the sky is the lower limit in our training. Our students can also access high speed internet in our computer labs to stay abreast with issues affecting their fields of study as well as complementing their research work. Our staff is a team of highly qualified and committed lecturers working closely with students and stakeholders guaranteeing uttermost standards in Engineering Education. <br /></p>', NULL),
(222, 360, 1, '2020-12-12 07:04:30', '2020-12-12 07:17:29', '532d7dfe-82a2-4e30-8eec-d1ff17b00b0c', NULL, '<p>Our graduates are always prepared to undertake careers and professional practices that provide an opportunity to address the pressing technological needs in their society. Students are as well exposed to world class opportunities where they have a chance to have their industrial attachments and internships in our affiliate companies in Kenya as well as international companies in different parts of the world. They also have a chance to join in exchange programmes with the Engineering Universities and Colleges in the same regions.</p>', NULL),
(223, 361, 1, '2020-12-12 07:04:30', '2020-12-12 07:17:29', '9a8452ac-37a6-471d-af3a-8de596a0a84a', NULL, '<p>The program also strives to develop in each student; self-reliance, innovation, teamwork ability, professional integrity, communication skills and an appreciation of the importance of emerging contemporary issues and lifelong intellectual growth. For interested students, there are opportunities to build solutions and showcase them to potential investors through our various partnership projects.Our courses are regulated by TVETA and examined by KNEC.</p>\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(224, 362, 1, '2020-12-12 07:04:30', '2020-12-12 07:20:31', '744b1d2f-1453-4411-a987-c5bbe7d03978', NULL, NULL, '<p><u>Courses</u></p>'),
(225, 364, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '3b178d8e-d8ec-4fa4-b140-3e20b729b86d', 'Hospitality & Tourism', NULL, NULL),
(226, 365, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'f9971e52-4654-4844-a967-4b80fe8281d8', NULL, '<p>The School of Tourism and Hospitality, has two departments, hosting a number of programmes such as Diploma in Tourism Management (KNEC), Diploma in Food and Beverage Management (KNEC), Certificate in Tour Guiding and Travel Operations (KNEC), Certificate in Food and Beverage Sales and Services(KNEC) Diploma and Certificate in Travel and Tourism (ICM), Diploma and Certificate in Hospitality Management, Baking and Pastry, Food and Beverage Production (Cookery), Food and Beverage Service, Housekeeping, Front Office.</p>', NULL),
(227, 366, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '35e4811d-01af-4d4c-8e76-fdb365136860', NULL, '<p> The school is at the fore-front in bridging training needs and gaps identified in Kenya Vision 2030, National Tourism Policy, and the Ministry of Tourism’s Strategic Plan with regard to the context of the nation’s tourism industry through knowledge, competencies and skills requisite in the management of the travel, tourism and hospitality sectors in Kenya. It aims at offering insights into the real-world problems and issues confronting the tourism industry and; the travel and tour operations, hotel &amp; hospitality sectors, in particular, at the local, regional and international level.The school also has competent faculty members who are all round in practical and theoretical areas of tourism and hospitality.</p>', NULL),
(228, 367, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '8e08dbba-b7f1-4487-806d-94b87df0cba8', NULL, '<p>Through innovative teaching and learning approaches, such as Tutorials, industry aligned exposure, globally mapped approach and qualified lecturers, the Departments within the school continue to: promote tourism, travel and hospitality research and development through practicals at Safari park Hotel, Dragon Fly Tour</p>', NULL),
(229, 368, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '06876e17-3c6c-42e4-b5a5-6f97b038efcb', NULL, NULL, '<p><u>Courses</u></p>'),
(230, 369, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'bf5482df-74d6-42b1-a4c6-e3c592526492', 'Journalism & Media', NULL, NULL),
(231, 370, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'bbf322c0-614d-4ef9-b32e-42f35b392198', NULL, '<p>The world today would have remained in optimum darkness if it were not for the various steps put forward by the media to inform and shed light on the daily occurrences, both locally and internationally. We therefore take pride in preparing right minded students for leadership careers in communications and media. This preparation is grounded in solid scholarship and an all rounded approach to education anchored in our philosophy derived from our Christian orientation and biblical teachings. We have talented,skilled and passionate personnel who are out to ensure excellence and success of the students in their faculties.</p>', NULL),
(232, 371, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'e71c8f4f-dd4a-4a60-b0f8-6a42e97da2a5', NULL, '<p>At Mahanaim College, it is our duty and practice to bridge the gap between theory and practice in training. For this, our students have practical training sessions at Good News Broadcasting System (GBS), a T.V station which partners with Mahanaim College to offer the best practical training and exposure tour students in their various fields. Through this, we have all the confidence in presenting our students to the job market and to the various organizations whose goals are in demand of such professionals.We would like to invite you to visit us and explore the various opportunities of studies we have in the school of Journalism and Media at Mahanaim College, join us and experience the quality.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(233, 372, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '51a335c6-91ba-49cf-b53e-f22303305a5e', NULL, NULL, '<p>Courses</p>'),
(234, 373, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '45a9bd8d-1d36-4949-a23b-a7bc62d8720e', 'Engineering', NULL, NULL),
(235, 374, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '51bf94f8-fcab-4193-b01b-0d952d61d418', NULL, '<p>Engineering is one of the most in demand courses in middle income economies like Kenya. In line with the country’s vision 2030 engineers and technologists are at the center of innovating systems to meet the requirements of our ever changing technological environment. Our school of Engineering offers a really world experience to our students through integration of quality training with our spiritual foundation.We offer Artisan, Craft Certificate and Diploma in Electrical and Electronic Engineering.</p>', NULL),
(236, 375, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '23aa125d-e3d3-4a5b-8a09-9043c1c3bebb', NULL, '<p> The program strives to maintain a balance between classroom lectures and laboratory and design experience, and it emphasizes the problem formulation, system-design, and solving skills that are essential to any engineering discipline. Our state of the art, well equipped modern laboratories is a true testimony that the sky is the lower limit in our training. Our students can also access high speed internet in our computer labs to stay abreast with issues affecting their fields of study as well as complementing their research work. Our staff is a team of highly qualified and committed lecturers working closely with students and stakeholders guaranteeing uttermost standards in Engineering Education. <br /></p>', NULL),
(237, 376, 1, '2020-12-12 07:04:31', '2020-12-12 07:04:31', 'a239efc7-4c93-4315-aaa8-c69e86821bfb', NULL, '<p>Our graduates are always prepared to undertake careers and professional practices that provide an opportunity to address the pressing technological needs in their society. Students are as well exposed to world class opportunities where they have a chance to have their industrial attachments and internships in our affiliate companies in Kenya as well as international companies in different parts of the world. They also have a chance to join in exchange programmes with the Engineering Universities and Colleges in the same regions.</p>', NULL),
(238, 377, 1, '2020-12-12 07:04:32', '2020-12-12 07:04:32', '9036818c-599e-4eff-9435-353d815e0ae4', NULL, '<p>The program also strives to develop in each student; self-reliance, innovation, teamwork ability, professional integrity, communication skills and an appreciation of the importance of emerging contemporary issues and lifelong intellectual growth. For interested students, there are opportunities to build solutions and showcase them to potential investors through our various partnership projects.Our courses are regulated by TVETA and examined by KNEC.</p>\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(239, 378, 1, '2020-12-12 07:04:32', '2020-12-12 07:04:32', 'a7d1c6a4-3a63-4c01-af64-6a1342bf03d3', NULL, NULL, '&lt;&gt;Courses'),
(240, 379, 1, '2020-12-12 07:06:33', '2020-12-12 07:17:29', '02f5e86c-39c6-40e8-ad75-36c7944e30f0', 'Computer Studies', NULL, NULL),
(241, 380, 1, '2020-12-12 07:06:33', '2020-12-12 07:17:29', 'c2f99b55-1319-4b77-a482-cc1c5ba8e3a5', NULL, '<p>The School is guided by our commitment to our college’s mission statement. We offer globally competitive courses which help our students compete internationally. We don’t only offer the curriculum requirements but we go out of our way to train our students the current technology due to the fact that ICT is a dynamic field which changes after a very short period. This makes our students to always be up to date with the current technological trends. I look forward to seeing you in our department</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(242, 381, 1, '2020-12-12 07:06:33', '2020-12-12 07:17:29', '744088d3-7f23-4539-bc42-81224ba6874a', NULL, NULL, '<u>Courses</u>'),
(243, 383, 1, '2020-12-12 07:06:33', '2020-12-12 07:06:33', '33b9a4d5-882d-442e-a267-862d9a05c716', 'Hospitality & Tourism', NULL, NULL),
(244, 384, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', 'bf74e9e9-3dac-4e66-97cf-4f0042053a6a', NULL, '<p>The School of Tourism and Hospitality, has two departments, hosting a number of programmes such as Diploma in Tourism Management (KNEC), Diploma in Food and Beverage Management (KNEC), Certificate in Tour Guiding and Travel Operations (KNEC), Certificate in Food and Beverage Sales and Services(KNEC) Diploma and Certificate in Travel and Tourism (ICM), Diploma and Certificate in Hospitality Management, Baking and Pastry, Food and Beverage Production (Cookery), Food and Beverage Service, Housekeeping, Front Office.</p>', NULL),
(245, 385, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', 'db53c466-6581-4ca5-ab61-ecef35cfd195', NULL, '<p> The school is at the fore-front in bridging training needs and gaps identified in Kenya Vision 2030, National Tourism Policy, and the Ministry of Tourism’s Strategic Plan with regard to the context of the nation’s tourism industry through knowledge, competencies and skills requisite in the management of the travel, tourism and hospitality sectors in Kenya. It aims at offering insights into the real-world problems and issues confronting the tourism industry and; the travel and tour operations, hotel &amp; hospitality sectors, in particular, at the local, regional and international level.The school also has competent faculty members who are all round in practical and theoretical areas of tourism and hospitality.</p>', NULL),
(246, 386, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '418bc3c1-2f13-415a-a60a-37e20696ec8a', NULL, '<p>Through innovative teaching and learning approaches, such as Tutorials, industry aligned exposure, globally mapped approach and qualified lecturers, the Departments within the school continue to: promote tourism, travel and hospitality research and development through practicals at Safari park Hotel, Dragon Fly Tour</p>', NULL),
(247, 387, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', 'ca87870b-1fd6-4946-9a38-26d6e096c46c', NULL, NULL, '<p><u>Courses</u></p>'),
(248, 388, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', 'c46f954e-726c-456d-b1c6-a66f38efaae6', 'Journalism & Media', NULL, NULL),
(249, 389, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '76d7e83f-b357-4af4-99c5-793a223c5500', NULL, '<p>The world today would have remained in optimum darkness if it were not for the various steps put forward by the media to inform and shed light on the daily occurrences, both locally and internationally. We therefore take pride in preparing right minded students for leadership careers in communications and media. This preparation is grounded in solid scholarship and an all rounded approach to education anchored in our philosophy derived from our Christian orientation and biblical teachings. We have talented,skilled and passionate personnel who are out to ensure excellence and success of the students in their faculties.</p>', NULL),
(250, 390, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '52e2c83d-4605-4c69-8a20-f25a9402d1e1', NULL, '<p>At Mahanaim College, it is our duty and practice to bridge the gap between theory and practice in training. For this, our students have practical training sessions at Good News Broadcasting System (GBS), a T.V station which partners with Mahanaim College to offer the best practical training and exposure tour students in their various fields. Through this, we have all the confidence in presenting our students to the job market and to the various organizations whose goals are in demand of such professionals.We would like to invite you to visit us and explore the various opportunities of studies we have in the school of Journalism and Media at Mahanaim College, join us and experience the quality.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(251, 391, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '4c114dea-6818-46cf-a604-cfb0fa624435', NULL, NULL, '<p>Courses</p>'),
(252, 392, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '0857e073-a532-42aa-8e24-caa381f6e0c5', 'Engineering', NULL, NULL),
(253, 393, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '03be73cc-928e-4978-8e03-bb25eb917d99', NULL, '<p>Engineering is one of the most in demand courses in middle income economies like Kenya. In line with the country’s vision 2030 engineers and technologists are at the center of innovating systems to meet the requirements of our ever changing technological environment. Our school of Engineering offers a really world experience to our students through integration of quality training with our spiritual foundation.We offer Artisan, Craft Certificate and Diploma in Electrical and Electronic Engineering.</p>', NULL),
(254, 394, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '2914af40-284c-4630-b84f-b1e8f67fce8d', NULL, '<p> The program strives to maintain a balance between classroom lectures and laboratory and design experience, and it emphasizes the problem formulation, system-design, and solving skills that are essential to any engineering discipline. Our state of the art, well equipped modern laboratories is a true testimony that the sky is the lower limit in our training. Our students can also access high speed internet in our computer labs to stay abreast with issues affecting their fields of study as well as complementing their research work. Our staff is a team of highly qualified and committed lecturers working closely with students and stakeholders guaranteeing uttermost standards in Engineering Education. <br /></p>', NULL),
(255, 395, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '778e98d3-6c92-4db9-ab34-45e7cd53ec62', NULL, '<p>Our graduates are always prepared to undertake careers and professional practices that provide an opportunity to address the pressing technological needs in their society. Students are as well exposed to world class opportunities where they have a chance to have their industrial attachments and internships in our affiliate companies in Kenya as well as international companies in different parts of the world. They also have a chance to join in exchange programmes with the Engineering Universities and Colleges in the same regions.</p>', NULL),
(256, 396, 1, '2020-12-12 07:06:34', '2020-12-12 07:06:34', '84d12590-adde-4d88-b8e1-bee925032f04', NULL, '<p>The program also strives to develop in each student; self-reliance, innovation, teamwork ability, professional integrity, communication skills and an appreciation of the importance of emerging contemporary issues and lifelong intellectual growth. For interested students, there are opportunities to build solutions and showcase them to potential investors through our various partnership projects.Our courses are regulated by TVETA and examined by KNEC.</p>\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(257, 397, 1, '2020-12-12 07:06:35', '2020-12-12 07:06:35', '7d344d06-babb-4f3b-b140-a2788f96b561', NULL, NULL, '&lt;&gt;Courses'),
(258, 398, 1, '2020-12-12 07:06:35', '2020-12-12 07:06:35', 'fbee153d-362e-4936-b0ac-439fbfd6ce7a', 'Computer Studies', NULL, NULL),
(259, 399, 1, '2020-12-12 07:06:35', '2020-12-12 07:06:35', 'c9208bc1-055d-4fbf-bc63-fd23dd3f8f6f', NULL, '<p>The School is guided by our commitment to our college’s mission statement. We offer globally competitive courses which help our students compete internationally. We don’t only offer the curriculum requirements but we go out of our way to train our students the current technology due to the fact that ICT is a dynamic field which changes after a very short period. This makes our students to always be up to date with the current technological trends. I look forward to seeing you in our department</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(260, 400, 1, '2020-12-12 07:06:35', '2020-12-12 07:06:35', '96f992ad-a3a7-4358-b4ea-175e85504440', NULL, NULL, '<u>Courses</u>'),
(261, 401, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '8b810941-d884-4588-963f-09c0278c7672', 'Languages', NULL, NULL),
(262, 402, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '2a63133a-dca5-4193-807e-9b5b99c45663', NULL, '<p>Language is a sure bridge that connects one to diverse cultures and communities. With the world being a global city, it is rather obvious that any individual looking to be globally competitive should consider taking an extra language particularly the most widely spoken worldwide. The Mahanaim Educational Institute (College) Language department offers a wide variety of foreign languages namely Chinese, French, Korean and English. We not only deliver in the four skills of Language namely Writing, Speaking, Listening and Reading but we most importantly deliver the culture as a whole. This is made possible through the use of Professional Lecturers who are Native speakers in the respective Languages.As the Head of Department, I welcome you to not only study a Language but to come and experience diverse culture.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(263, 403, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '0decf32b-3500-414e-b83e-12dfff39e203', NULL, NULL, '<p><u>Courses</u></p>'),
(264, 404, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', 'c38be5bd-ee3d-4662-956b-0c01a4c77e37', 'Music & Sports', NULL, NULL),
(265, 405, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', '879f5a30-6f41-4a8d-82e8-0bb7894f7d39', NULL, '<p>Beyond the world of books there is a need for co-curricular development an important aspect of an individual. Mahanaim Educational Institute (College) music and sports department offer Tae kwon do and Piano lessons to facilitate holistic growth.</p>\r\n\r\n\r\n', NULL),
(266, 406, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', 'f18c8635-491e-4774-8af3-364ae9f4175a', NULL, NULL, '<p><u>Courses</u></p>'),
(267, 407, 1, '2020-12-12 07:17:29', '2020-12-12 07:17:29', 'ffe40b3c-5029-4730-ba69-b4b65b0afa5f', 'Business', NULL, NULL);
INSERT INTO `matrixcontent_bodycontent` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_heading_heading`, `field_paragraph_text`, `field_link_links`) VALUES
(268, 408, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', 'f915853d-7d90-40d5-a4a9-65ebff98103b', NULL, '<p>The School of Business offers competitive courses in the field of Entrepreneurship that equip the students with quality skills. We offer courses in Business Management and CPA among others.</p>\r\n\r\n', NULL),
(269, 409, 1, '2020-12-12 07:17:30', '2020-12-12 07:20:31', 'f5d1206a-1b50-4235-9c1c-30d4f84f52ee', NULL, NULL, '<u>Courses</u>'),
(270, 410, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', 'db38d9c2-fb73-423f-91f3-d4534d5b9b63', 'Short Courses', NULL, NULL),
(271, 411, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', '558d9547-bf6e-4ba4-b0e1-42f4c5269699', NULL, '<p>We offer a variety of short courses in various disciplines.</p>', NULL),
(272, 412, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', '3921a81f-5104-4f07-8b0f-b64d0af33dae', NULL, NULL, '<p><u>Courses</u></p>'),
(273, 413, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', '2ed925c2-1e7b-488b-94d8-90e8589c26bc', 'Christian Ministry', NULL, NULL),
(274, 414, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', '7fada358-7b7a-4a35-9731-f64542733cae', NULL, '<p>This school was established by Rev. Dr. Park to solely convey the heart of God as it is exactly reflected in the Bible. It is guided by the motto: Let\'s go back to the Bible and only by faith.\"</p>\r\n\r\n', NULL),
(275, 415, 1, '2020-12-12 07:17:30', '2020-12-12 07:17:30', '314e5d3a-7f5e-4489-9de5-446c9c7cf0f8', NULL, NULL, '<p><u>Courses</u></p>'),
(276, 417, 1, '2020-12-12 07:17:31', '2020-12-12 07:17:31', '64486834-493e-44d4-be4b-0d8ba58b86b1', 'Hospitality & Tourism', NULL, NULL),
(277, 418, 1, '2020-12-12 07:17:31', '2020-12-12 07:17:31', 'd1d3ecc2-d8bf-4593-94e0-5a5861f45bf7', NULL, '<p>The School of Tourism and Hospitality, has two departments, hosting a number of programmes such as Diploma in Tourism Management (KNEC), Diploma in Food and Beverage Management (KNEC), Certificate in Tour Guiding and Travel Operations (KNEC), Certificate in Food and Beverage Sales and Services(KNEC) Diploma and Certificate in Travel and Tourism (ICM), Diploma and Certificate in Hospitality Management, Baking and Pastry, Food and Beverage Production (Cookery), Food and Beverage Service, Housekeeping, Front Office.</p>', NULL),
(278, 419, 1, '2020-12-12 07:17:31', '2020-12-12 07:17:31', 'd7ca89a2-0ddd-4989-a856-90e10663670b', NULL, '<p> The school is at the fore-front in bridging training needs and gaps identified in Kenya Vision 2030, National Tourism Policy, and the Ministry of Tourism’s Strategic Plan with regard to the context of the nation’s tourism industry through knowledge, competencies and skills requisite in the management of the travel, tourism and hospitality sectors in Kenya. It aims at offering insights into the real-world problems and issues confronting the tourism industry and; the travel and tour operations, hotel &amp; hospitality sectors, in particular, at the local, regional and international level.The school also has competent faculty members who are all round in practical and theoretical areas of tourism and hospitality.</p>', NULL),
(279, 420, 1, '2020-12-12 07:17:31', '2020-12-12 07:17:31', 'fe970f82-7e62-4545-acdb-62fbdc3a18a3', NULL, '<p>Through innovative teaching and learning approaches, such as Tutorials, industry aligned exposure, globally mapped approach and qualified lecturers, the Departments within the school continue to: promote tourism, travel and hospitality research and development through practicals at Safari park Hotel, Dragon Fly Tour</p>', NULL),
(280, 421, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'ebeb601c-d963-4233-9b98-4db6d7efebb7', NULL, NULL, '<p><u>Courses</u></p>'),
(281, 422, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'ec0edd44-f81e-4edf-bf9b-7f4e05285236', 'Journalism & Media', NULL, NULL),
(282, 423, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '0ccddf47-eb07-4b80-a98a-89038302b00b', NULL, '<p>The world today would have remained in optimum darkness if it were not for the various steps put forward by the media to inform and shed light on the daily occurrences, both locally and internationally. We therefore take pride in preparing right minded students for leadership careers in communications and media. This preparation is grounded in solid scholarship and an all rounded approach to education anchored in our philosophy derived from our Christian orientation and biblical teachings. We have talented,skilled and passionate personnel who are out to ensure excellence and success of the students in their faculties.</p>', NULL),
(283, 424, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'bf630db5-f5fa-449e-9767-0a1c8d6a1d90', NULL, '<p>At Mahanaim College, it is our duty and practice to bridge the gap between theory and practice in training. For this, our students have practical training sessions at Good News Broadcasting System (GBS), a T.V station which partners with Mahanaim College to offer the best practical training and exposure tour students in their various fields. Through this, we have all the confidence in presenting our students to the job market and to the various organizations whose goals are in demand of such professionals.We would like to invite you to visit us and explore the various opportunities of studies we have in the school of Journalism and Media at Mahanaim College, join us and experience the quality.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(284, 425, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '113f80d9-b278-4980-96fc-1129c4dd5a1f', NULL, NULL, '<p>Courses</p>'),
(285, 426, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '3dbf97bf-2fc4-4b9d-a79c-9cff933858eb', 'Engineering', NULL, NULL),
(286, 427, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '16555486-8298-41c6-95db-3680c1140401', NULL, '<p>Engineering is one of the most in demand courses in middle income economies like Kenya. In line with the country’s vision 2030 engineers and technologists are at the center of innovating systems to meet the requirements of our ever changing technological environment. Our school of Engineering offers a really world experience to our students through integration of quality training with our spiritual foundation.We offer Artisan, Craft Certificate and Diploma in Electrical and Electronic Engineering.</p>', NULL),
(287, 428, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'a9b2eb06-1243-4c9e-8056-aa439a0baa7a', NULL, '<p> The program strives to maintain a balance between classroom lectures and laboratory and design experience, and it emphasizes the problem formulation, system-design, and solving skills that are essential to any engineering discipline. Our state of the art, well equipped modern laboratories is a true testimony that the sky is the lower limit in our training. Our students can also access high speed internet in our computer labs to stay abreast with issues affecting their fields of study as well as complementing their research work. Our staff is a team of highly qualified and committed lecturers working closely with students and stakeholders guaranteeing uttermost standards in Engineering Education. <br /></p>', NULL),
(288, 429, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', '432d199f-acb4-4e46-a40b-65182bde0f81', NULL, '<p>Our graduates are always prepared to undertake careers and professional practices that provide an opportunity to address the pressing technological needs in their society. Students are as well exposed to world class opportunities where they have a chance to have their industrial attachments and internships in our affiliate companies in Kenya as well as international companies in different parts of the world. They also have a chance to join in exchange programmes with the Engineering Universities and Colleges in the same regions.</p>', NULL),
(289, 430, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'f76c4842-653b-4454-a988-1489d5a0755e', NULL, '<p>The program also strives to develop in each student; self-reliance, innovation, teamwork ability, professional integrity, communication skills and an appreciation of the importance of emerging contemporary issues and lifelong intellectual growth. For interested students, there are opportunities to build solutions and showcase them to potential investors through our various partnership projects.Our courses are regulated by TVETA and examined by KNEC.</p>\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(290, 431, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'e58a96b3-e825-4c2a-8357-c1e81033fd9c', NULL, NULL, '&lt;&gt;Courses'),
(291, 432, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'e7416650-8994-4387-b5f8-70e79c267c42', 'Computer Studies', NULL, NULL),
(292, 433, 1, '2020-12-12 07:17:32', '2020-12-12 07:17:32', 'a566f199-9b93-49d8-90a5-ed9548965eb8', NULL, '<p>The School is guided by our commitment to our college’s mission statement. We offer globally competitive courses which help our students compete internationally. We don’t only offer the curriculum requirements but we go out of our way to train our students the current technology due to the fact that ICT is a dynamic field which changes after a very short period. This makes our students to always be up to date with the current technological trends. I look forward to seeing you in our department</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(293, 434, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', '4252bb26-b8c8-4246-a4c0-94dfdb481396', NULL, NULL, '<u>Courses</u>'),
(294, 435, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', '9769cfc9-e1b3-403d-a5b7-20a53e1cca54', 'Languages', NULL, NULL),
(295, 436, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', '6d596e8f-95c7-45a9-b2f6-5ac86af2f2a7', NULL, '<p>Language is a sure bridge that connects one to diverse cultures and communities. With the world being a global city, it is rather obvious that any individual looking to be globally competitive should consider taking an extra language particularly the most widely spoken worldwide. The Mahanaim Educational Institute (College) Language department offers a wide variety of foreign languages namely Chinese, French, Korean and English. We not only deliver in the four skills of Language namely Writing, Speaking, Listening and Reading but we most importantly deliver the culture as a whole. This is made possible through the use of Professional Lecturers who are Native speakers in the respective Languages.As the Head of Department, I welcome you to not only study a Language but to come and experience diverse culture.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(296, 437, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', 'ff7b6022-c22b-43f2-97d3-a9f08dec3f7a', NULL, NULL, '<p><u>Courses</u></p>'),
(297, 438, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', '96c9d194-b6dc-4422-a534-2140477cd87e', 'Music & Sports', NULL, NULL),
(298, 439, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', '65a3c097-d44b-47b0-b6ec-4e3b3e82ce2c', NULL, '<p>Beyond the world of books there is a need for co-curricular development an important aspect of an individual. Mahanaim Educational Institute (College) music and sports department offer Tae kwon do and Piano lessons to facilitate holistic growth.</p>\r\n\r\n\r\n', NULL),
(299, 440, 1, '2020-12-12 07:17:33', '2020-12-12 07:17:33', '94b63623-2212-46c6-8277-71d885032fc0', NULL, NULL, '<p><u>Courses</u></p>'),
(300, 441, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', 'ff1e0a52-6bee-45bf-98f8-94201ca8c4cb', 'Business', NULL, NULL),
(301, 442, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '36fbda70-adc8-4a50-9f9e-a04d5826ba66', NULL, '<p>The School of Business offers competitive courses in the field of Entrepreneurship that equip the students with quality skills. We offer courses in Business Management and CPA among others.</p>\r\n\r\n', NULL),
(302, 443, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '2dc40eec-8679-4e3a-8446-02464f6fbd5f', NULL, NULL, '<p>Courses</p>'),
(303, 444, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '4d08c2f3-3c55-4a2a-9b95-621cfcca22f5', 'Short Courses', NULL, NULL),
(304, 445, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '78f21322-98af-4c43-a91d-d16c162d2358', NULL, '<p>We offer a variety of short courses in various disciplines.</p>', NULL),
(305, 446, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '4d4ae175-ab50-420a-baad-b3b8ea6c842a', NULL, NULL, '<p><u>Courses</u></p>'),
(306, 447, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '565fa0a4-4459-4355-8080-55b1b0ec47cb', 'Christian Ministry', NULL, NULL),
(307, 448, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', 'fb84e4de-e5dd-4b7c-becd-47321a2f9a4b', NULL, '<p>This school was established by Rev. Dr. Park to solely convey the heart of God as it is exactly reflected in the Bible. It is guided by the motto: Let\'s go back to the Bible and only by faith.\"</p>\r\n\r\n', NULL),
(308, 449, 1, '2020-12-12 07:17:34', '2020-12-12 07:17:34', '1737ce00-6ece-4d83-8fde-6a1eba6bd4cc', NULL, NULL, '<p><u>Courses</u></p>'),
(309, 451, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '655e03d2-eba1-4891-8cd6-9164a511da19', 'Hospitality & Tourism', NULL, NULL),
(310, 452, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '29506c31-bd18-4d77-a9bd-a47eb9095b63', NULL, '<p>The School of Tourism and Hospitality, has two departments, hosting a number of programmes such as Diploma in Tourism Management (KNEC), Diploma in Food and Beverage Management (KNEC), Certificate in Tour Guiding and Travel Operations (KNEC), Certificate in Food and Beverage Sales and Services(KNEC) Diploma and Certificate in Travel and Tourism (ICM), Diploma and Certificate in Hospitality Management, Baking and Pastry, Food and Beverage Production (Cookery), Food and Beverage Service, Housekeeping, Front Office.</p>', NULL),
(311, 453, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', 'cf40fdc4-3c39-4632-b4b8-ed4d3675c970', NULL, '<p> The school is at the fore-front in bridging training needs and gaps identified in Kenya Vision 2030, National Tourism Policy, and the Ministry of Tourism’s Strategic Plan with regard to the context of the nation’s tourism industry through knowledge, competencies and skills requisite in the management of the travel, tourism and hospitality sectors in Kenya. It aims at offering insights into the real-world problems and issues confronting the tourism industry and; the travel and tour operations, hotel &amp; hospitality sectors, in particular, at the local, regional and international level.The school also has competent faculty members who are all round in practical and theoretical areas of tourism and hospitality.</p>', NULL),
(312, 454, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', 'fbe10567-0ff5-4ef6-8264-2a9a04a46f47', NULL, '<p>Through innovative teaching and learning approaches, such as Tutorials, industry aligned exposure, globally mapped approach and qualified lecturers, the Departments within the school continue to: promote tourism, travel and hospitality research and development through practicals at Safari park Hotel, Dragon Fly Tour</p>', NULL),
(313, 455, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '3d14ad5b-41d3-446a-af37-52e9021ce42a', NULL, NULL, '<p><u>Courses</u></p>'),
(314, 456, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '90f0e87d-42a0-4b20-9de6-af2fb8a60aea', 'Journalism & Media', NULL, NULL),
(315, 457, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', 'b92a1210-e745-40a6-8bdb-4f811b5da5e3', NULL, '<p>The world today would have remained in optimum darkness if it were not for the various steps put forward by the media to inform and shed light on the daily occurrences, both locally and internationally. We therefore take pride in preparing right minded students for leadership careers in communications and media. This preparation is grounded in solid scholarship and an all rounded approach to education anchored in our philosophy derived from our Christian orientation and biblical teachings. We have talented,skilled and passionate personnel who are out to ensure excellence and success of the students in their faculties.</p>', NULL),
(316, 458, 1, '2020-12-12 07:20:31', '2020-12-12 07:20:31', '2690a64f-43e2-4900-8495-74f217d5f762', NULL, '<p>At Mahanaim College, it is our duty and practice to bridge the gap between theory and practice in training. For this, our students have practical training sessions at Good News Broadcasting System (GBS), a T.V station which partners with Mahanaim College to offer the best practical training and exposure tour students in their various fields. Through this, we have all the confidence in presenting our students to the job market and to the various organizations whose goals are in demand of such professionals.We would like to invite you to visit us and explore the various opportunities of studies we have in the school of Journalism and Media at Mahanaim College, join us and experience the quality.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(317, 459, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '686e5cc7-bfb3-48fe-9aa3-be0c7cbbb84c', NULL, NULL, '<u>Courses</u>'),
(318, 460, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '1a8a7663-08ed-4a6a-b367-ea16ec8bafd6', 'Engineering', NULL, NULL),
(319, 461, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '7c6a7e56-0e3f-475f-83d7-2532d0e7328f', NULL, '<p>Engineering is one of the most in demand courses in middle income economies like Kenya. In line with the country’s vision 2030 engineers and technologists are at the center of innovating systems to meet the requirements of our ever changing technological environment. Our school of Engineering offers a really world experience to our students through integration of quality training with our spiritual foundation.We offer Artisan, Craft Certificate and Diploma in Electrical and Electronic Engineering.</p>', NULL),
(320, 462, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', 'c94679ce-a233-4b4b-bb55-c889245817a3', NULL, '<p> The program strives to maintain a balance between classroom lectures and laboratory and design experience, and it emphasizes the problem formulation, system-design, and solving skills that are essential to any engineering discipline. Our state of the art, well equipped modern laboratories is a true testimony that the sky is the lower limit in our training. Our students can also access high speed internet in our computer labs to stay abreast with issues affecting their fields of study as well as complementing their research work. Our staff is a team of highly qualified and committed lecturers working closely with students and stakeholders guaranteeing uttermost standards in Engineering Education. <br /></p>', NULL),
(321, 463, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', 'e059dc3f-dfa0-47db-a921-c62471547f74', NULL, '<p>Our graduates are always prepared to undertake careers and professional practices that provide an opportunity to address the pressing technological needs in their society. Students are as well exposed to world class opportunities where they have a chance to have their industrial attachments and internships in our affiliate companies in Kenya as well as international companies in different parts of the world. They also have a chance to join in exchange programmes with the Engineering Universities and Colleges in the same regions.</p>', NULL),
(322, 464, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', 'b01b8675-e1ba-46c2-b1fa-36d6c1b57482', NULL, '<p>The program also strives to develop in each student; self-reliance, innovation, teamwork ability, professional integrity, communication skills and an appreciation of the importance of emerging contemporary issues and lifelong intellectual growth. For interested students, there are opportunities to build solutions and showcase them to potential investors through our various partnership projects.Our courses are regulated by TVETA and examined by KNEC.</p>\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(323, 465, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '3aeda97e-8e15-4663-a493-fefa33bdc0b2', NULL, NULL, '<p><u>Courses</u></p>'),
(324, 466, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', 'a14705df-5f3f-40aa-bcf1-fbb910d78028', 'Computer Studies', NULL, NULL),
(325, 467, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '64dba999-6258-4c06-beed-6be1f9f6971c', NULL, '<p>The School is guided by our commitment to our college’s mission statement. We offer globally competitive courses which help our students compete internationally. We don’t only offer the curriculum requirements but we go out of our way to train our students the current technology due to the fact that ICT is a dynamic field which changes after a very short period. This makes our students to always be up to date with the current technological trends. I look forward to seeing you in our department</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(326, 468, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', 'a6f7ad53-c081-4f57-8a80-2b178910917b', NULL, NULL, '<u>Courses</u>'),
(327, 469, 1, '2020-12-12 07:20:32', '2020-12-12 07:20:32', '420556e2-855c-43ea-9ff8-0b701bcc50d8', 'Languages', NULL, NULL),
(328, 470, 1, '2020-12-12 07:20:33', '2020-12-12 07:20:33', '6f58975e-261b-4492-b629-982b096105c3', NULL, '<p>Language is a sure bridge that connects one to diverse cultures and communities. With the world being a global city, it is rather obvious that any individual looking to be globally competitive should consider taking an extra language particularly the most widely spoken worldwide. The Mahanaim Educational Institute (College) Language department offers a wide variety of foreign languages namely Chinese, French, Korean and English. We not only deliver in the four skills of Language namely Writing, Speaking, Listening and Reading but we most importantly deliver the culture as a whole. This is made possible through the use of Professional Lecturers who are Native speakers in the respective Languages.As the Head of Department, I welcome you to not only study a Language but to come and experience diverse culture.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL),
(329, 471, 1, '2020-12-12 07:20:33', '2020-12-12 07:20:33', '15c6f64e-51c9-4f88-9e44-5b78fb2fa225', NULL, NULL, '<p><u>Courses</u></p>'),
(330, 472, 1, '2020-12-12 07:20:33', '2020-12-12 07:20:33', '92af32f5-7241-4608-8150-e45103aa4b81', 'Music & Sports', NULL, NULL),
(331, 473, 1, '2020-12-12 07:20:34', '2020-12-12 07:20:34', 'd4998986-ccd6-4d6b-a474-07764073b1c8', NULL, '<p>Beyond the world of books there is a need for co-curricular development an important aspect of an individual. Mahanaim Educational Institute (College) music and sports department offer Tae kwon do and Piano lessons to facilitate holistic growth.</p>\r\n\r\n\r\n', NULL),
(332, 474, 1, '2020-12-12 07:20:34', '2020-12-12 07:20:34', '0cfacb34-fc8f-409d-b569-5119beace20c', NULL, NULL, '<p><u>Courses</u></p>'),
(333, 475, 1, '2020-12-12 07:20:34', '2020-12-12 07:20:34', 'fd442afc-09d4-49cf-a461-df1bb139638c', 'Business', NULL, NULL),
(334, 476, 1, '2020-12-12 07:20:34', '2020-12-12 07:20:34', '38b854f0-fe64-497d-88e9-540d10dde38b', NULL, '<p>The School of Business offers competitive courses in the field of Entrepreneurship that equip the students with quality skills. We offer courses in Business Management and CPA among others.</p>\r\n\r\n', NULL),
(335, 477, 1, '2020-12-12 07:20:34', '2020-12-12 07:20:34', 'e8043989-3814-4ffa-86d2-5e551e6f70eb', NULL, NULL, '<u>Courses</u>'),
(336, 478, 1, '2020-12-12 07:20:34', '2020-12-12 07:20:34', '0d832d35-f98c-4143-86c1-e839ab5e8428', 'Short Courses', NULL, NULL),
(337, 479, 1, '2020-12-12 07:20:35', '2020-12-12 07:20:35', '7e88da42-8e17-499c-8273-943cf7ef1617', NULL, '<p>We offer a variety of short courses in various disciplines.</p>', NULL),
(338, 480, 1, '2020-12-12 07:20:35', '2020-12-12 07:20:35', '53a3adf6-089c-42a9-a1a6-599fee075da0', NULL, NULL, '<p><u>Courses</u></p>'),
(339, 481, 1, '2020-12-12 07:20:35', '2020-12-12 07:20:35', '38821677-8041-478e-995d-17e801a0eefc', 'Christian Ministry', NULL, NULL),
(340, 482, 1, '2020-12-12 07:20:35', '2020-12-12 07:20:35', 'aa1dea41-719f-46a9-861c-349eaa981d5e', NULL, '<p>This school was established by Rev. Dr. Park to solely convey the heart of God as it is exactly reflected in the Bible. It is guided by the motto: Let\'s go back to the Bible and only by faith.\"</p>\r\n\r\n', NULL),
(341, 483, 1, '2020-12-12 07:20:35', '2020-12-12 07:20:35', 'cfa63d07-2b0c-4f20-8440-84772c6c8651', NULL, NULL, '<p><u>Courses</u></p>'),
(342, 485, 1, '2020-12-12 07:40:34', '2020-12-12 07:40:34', 'a351bbd4-c79c-41a5-adc4-fb2070ded4c9', NULL, NULL, '<p>2019 Academic Schedule</p>'),
(343, 486, 1, '2020-12-12 07:40:34', '2020-12-12 07:40:34', '32cc0089-1cbb-41f3-a66c-fd2d98ebbfc2', NULL, NULL, '<p>2020 Academic Schedule</p>'),
(344, 488, 1, '2020-12-12 07:43:17', '2020-12-12 07:43:17', '79406eb9-e693-445d-8499-2e0c091c7b46', NULL, NULL, '<p>2019 Academic Schedule</p>'),
(345, 489, 1, '2020-12-12 07:43:17', '2020-12-12 07:43:17', '5ae8733e-eb68-4846-a61a-b0f1846d047b', NULL, NULL, '<p>2020 Academic Schedule</p>'),
(346, 491, 1, '2020-12-12 08:02:35', '2020-12-12 08:02:35', '659e6497-5857-407b-9cb1-0e0998323f13', NULL, NULL, '2019 Academic Schedule'),
(347, 492, 1, '2020-12-12 08:02:35', '2020-12-12 08:02:35', '14c14e2b-d9eb-4ff0-b4f1-70f2d02ee48b', NULL, NULL, '2020 Academic Schedule'),
(348, 494, 1, '2020-12-12 08:47:32', '2020-12-12 08:47:32', '4e7047f7-38bc-4f2f-9205-9cc9ca681007', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/TERM%20DATES%20(4).pdf\">2019 Academic Schedule</a><br /></p>'),
(349, 495, 1, '2020-12-12 08:51:43', '2020-12-12 09:01:11', '37ea1726-f6ae-45ea-b466-0e7b2853a30c', NULL, NULL, '<p><a href=\"https://mei.ac.ke/uploads/TERM%20DATES%202020.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">2020 Academic Schedule</a></p>'),
(350, 497, 1, '2020-12-12 08:51:43', '2020-12-12 08:51:43', '07c13f22-e234-4f92-af21-0401f724e7a1', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/TERM%20DATES%20(4).pdf\" target=\"_blank\" rel=\"noreferrer noopener\">2019 Academic Schedule</a><br /></p>'),
(351, 498, 1, '2020-12-12 08:51:43', '2020-12-12 08:51:43', '403e4783-b9e9-452b-8ee4-895de244ee2e', NULL, NULL, NULL),
(352, 500, 1, '2020-12-12 08:55:32', '2020-12-12 08:55:32', 'cbe34f75-eeba-4f04-a883-ea46ea31c356', NULL, NULL, '<ul><li><a href=\"http://mei.ac.ke/uploads/TERM%20DATES%20(4).pdf\" target=\"_blank\" rel=\"noreferrer noopener\">2019 Academic Scheduledd</a></li></ul>'),
(353, 501, 1, '2020-12-12 08:55:32', '2020-12-12 08:55:32', 'a839ff9c-7f6a-4031-9dad-cfc55baf0c79', NULL, NULL, NULL),
(354, 503, 1, '2020-12-12 08:58:02', '2020-12-12 08:58:02', '5288db4f-178b-435b-a6c6-beda54da2424', NULL, NULL, '<ul><li><a href=\"http://mei.ac.ke/uploads/TERM%20DATES%20(4).pdf\" target=\"_blank\" rel=\"noreferrer noopener\">2019 Academic Schedule</a></li></ul>'),
(355, 504, 1, '2020-12-12 08:58:02', '2020-12-12 08:58:02', '7f157424-8177-4be1-8e50-3fc158166bee', NULL, NULL, '<a href=\"https://mei.ac.ke/uploads/TERM%20DATES%202020.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">2020 Academic Schedule</a><br />'),
(356, 506, 1, '2020-12-12 08:58:45', '2020-12-12 08:58:45', '2bc3fd94-e171-4f90-b132-b09433896d8a', NULL, NULL, '<ul><li><a href=\"http://mei.ac.ke/uploads/TERM%20DATES%20(4).pdf\" target=\"_blank\" rel=\"noreferrer noopener\">2019 Academic Schedule</a></li></ul>'),
(357, 507, 1, '2020-12-12 08:58:45', '2020-12-12 08:58:45', 'b247562f-cf7a-4a18-8909-4e5cdba135de', NULL, NULL, '<ul><li><a href=\"https://mei.ac.ke/uploads/TERM%20DATES%202020.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">2020 Academic Schedule</a></li></ul>'),
(358, 509, 1, '2020-12-12 09:00:20', '2020-12-12 09:00:20', '96f90f45-0706-4637-8093-f8704892c511', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/TERM%20DATES%20(4).pdf\" target=\"_blank\" rel=\"noreferrer noopener\"> 1.2019 Academic Schedule</a></p>'),
(359, 510, 1, '2020-12-12 09:00:21', '2020-12-12 09:00:21', '8efe106b-d9d8-4cf1-8ad8-4e9e0dd76bb6', NULL, NULL, '<p><a href=\"https://mei.ac.ke/uploads/TERM%20DATES%202020.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">2.2020 Academic Schedule</a></p>'),
(360, 512, 1, '2020-12-12 09:01:11', '2020-12-12 09:01:11', 'b574d86c-8e09-433a-851e-a68a955a5780', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/TERM%20DATES%20(4).pdf\" target=\"_blank\" rel=\"noreferrer noopener\">2019 Academic Schedule</a></p>'),
(361, 513, 1, '2020-12-12 09:01:11', '2020-12-12 09:01:11', 'f65d9316-20aa-495c-b24c-9cd13a403535', NULL, NULL, '<p><a href=\"https://mei.ac.ke/uploads/TERM%20DATES%202020.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">2020 Academic Schedule</a></p>'),
(362, 515, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', 'bd1beab6-e2b7-4afe-b74f-313e3a0ef9f4', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/Hospitality&amp;Tourism%20fee%20structure.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Hospitality &amp; Tourism</a><br /></p>'),
(363, 516, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', 'da12d20f-2235-4ad7-810c-0e3cb60e18fc', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/JORNALISIM%20FEE%20STRUCTURE.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Journalism</a></p>'),
(364, 517, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', 'cf376e79-aace-4d72-8e1b-d6fb8c4eb9f9', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/Elecric%20&amp;%20Electronics.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Engineering</a><br /></p>'),
(365, 518, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '4595a1a5-0e88-4d99-a2ab-b00d234eed04', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/ICT%20&amp;%20IT%20fee%20structure.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Computer Studies</a><br /></p>'),
(366, 519, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '62bbec0b-3526-4c8b-915b-7ec648ae09e8', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/ICDL.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">ICDL</a></p>'),
(367, 520, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '20ab6619-58a3-452d-bee6-15aa82a0845d', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/Business%20(2)%20(1).pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Business Studies</a><br /></p>'),
(368, 521, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '51d822f6-c719-43f6-bc0c-c6ca7acee5c0', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/Fee%20structure%20language.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Languages</a></p>'),
(369, 522, 1, '2020-12-12 09:09:51', '2020-12-12 09:09:51', '24657997-0b8a-4046-b2e7-5c995a145e24', NULL, NULL, '<p><a href=\"http://mei.ac.ke/uploads/SCHOOL%20OF%20MUSIC%20AND%20SPORTS%20FEE%20STRUCTURE.pdf\" target=\"_blank\" rel=\"noreferrer noopener\">Tae Kwon Do</a><br /></p>');

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
(1, 'redactor', '2.8.5', '2.3.0', 'unknown', NULL, '2020-12-08 16:23:46', '2020-12-08 16:23:46', '2020-12-11 20:06:26', 'e01a88ea-1452-4d73-8456-f8a6aa918fcd'),
(2, 'cheat-sheet', '2.0.3', '1.0.0', 'unknown', NULL, '2020-12-11 14:45:37', '2020-12-11 14:45:37', '2020-12-11 20:06:26', 'b770e3fc-0b50-442c-af8a-a0ae6161820f');

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
('dateModified', '1607762958'),
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
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.instructions', '\"\"'),
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.0.label', '\"Page title\"'),
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
('entryTypes.881b37d0-96c1-44fe-af2c-81af6cc7ed1d.fieldLayouts.c6646a7e-cb01-4c85-ba32-ab58e713af97.tabs.0.elements.1.fieldUid', '\"3cbe8045-904b-49bb-ac50-4926692bbaaf\"'),
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
('fieldGroups.5bcd0203-19a2-4abc-af8a-aef6269e6b40.name', '\"pages\"'),
('fieldGroups.cfeacf29-a9a2-4dd0-8566-09319a280117.name', '\"Common\"'),
('fields.3cbe8045-904b-49bb-ac50-4926692bbaaf.contentColumnType', '\"string\"'),
('fields.3cbe8045-904b-49bb-ac50-4926692bbaaf.fieldGroup', '\"5bcd0203-19a2-4abc-af8a-aef6269e6b40\"'),
('fields.3cbe8045-904b-49bb-ac50-4926692bbaaf.handle', '\"bodyContent\"'),
('fields.3cbe8045-904b-49bb-ac50-4926692bbaaf.instructions', '\"\"'),
('fields.3cbe8045-904b-49bb-ac50-4926692bbaaf.name', '\"Body Content\"'),
('fields.3cbe8045-904b-49bb-ac50-4926692bbaaf.searchable', 'false'),
('fields.3cbe8045-904b-49bb-ac50-4926692bbaaf.settings.contentTable', '\"{{%matrixcontent_bodycontent}}\"'),
('fields.3cbe8045-904b-49bb-ac50-4926692bbaaf.settings.maxBlocks', '\"\"'),
('fields.3cbe8045-904b-49bb-ac50-4926692bbaaf.settings.minBlocks', '\"\"'),
('fields.3cbe8045-904b-49bb-ac50-4926692bbaaf.settings.propagationMethod', '\"all\"'),
('fields.3cbe8045-904b-49bb-ac50-4926692bbaaf.translationKeyFormat', 'null'),
('fields.3cbe8045-904b-49bb-ac50-4926692bbaaf.translationMethod', '\"site\"'),
('fields.3cbe8045-904b-49bb-ac50-4926692bbaaf.type', '\"craft\\\\fields\\\\Matrix\"'),
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
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.field', '\"3cbe8045-904b-49bb-ac50-4926692bbaaf\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fieldLayouts.fe7e1ecb-e18d-4099-b14b-a9e74ec95f95.tabs.0.elements.0.fieldUid', '\"c4abaacd-d898-499d-a4b2-c07043287716\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fieldLayouts.fe7e1ecb-e18d-4099-b14b-a9e74ec95f95.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fieldLayouts.fe7e1ecb-e18d-4099-b14b-a9e74ec95f95.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fieldLayouts.fe7e1ecb-e18d-4099-b14b-a9e74ec95f95.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fieldLayouts.fe7e1ecb-e18d-4099-b14b-a9e74ec95f95.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fieldLayouts.fe7e1ecb-e18d-4099-b14b-a9e74ec95f95.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fieldLayouts.fe7e1ecb-e18d-4099-b14b-a9e74ec95f95.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fieldLayouts.fe7e1ecb-e18d-4099-b14b-a9e74ec95f95.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fieldLayouts.fe7e1ecb-e18d-4099-b14b-a9e74ec95f95.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fieldLayouts.fe7e1ecb-e18d-4099-b14b-a9e74ec95f95.tabs.0.sortOrder', '1'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.contentColumnType', '\"text\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.fieldGroup', 'null'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.handle', '\"heading\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.instructions', '\"\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.name', '\"heading\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.searchable', 'false'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.settings.byteLimit', 'null'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.settings.charLimit', 'null'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.settings.code', '\"\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.settings.columnType', 'null'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.settings.initialRows', '\"4\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.settings.multiline', '\"\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.settings.placeholder', '\"\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.translationKeyFormat', 'null'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.translationMethod', '\"none\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.fields.c4abaacd-d898-499d-a4b2-c07043287716.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.handle', '\"heading\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.name', '\"heading\"'),
('matrixBlockTypes.373eed9d-2892-44c3-9762-094eb392c34a.sortOrder', '1'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.field', '\"3cbe8045-904b-49bb-ac50-4926692bbaaf\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fieldLayouts.aa9476bc-98c8-4f32-8488-c0bf9890c737.tabs.0.elements.0.fieldUid', '\"e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fieldLayouts.aa9476bc-98c8-4f32-8488-c0bf9890c737.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fieldLayouts.aa9476bc-98c8-4f32-8488-c0bf9890c737.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fieldLayouts.aa9476bc-98c8-4f32-8488-c0bf9890c737.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fieldLayouts.aa9476bc-98c8-4f32-8488-c0bf9890c737.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fieldLayouts.aa9476bc-98c8-4f32-8488-c0bf9890c737.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fieldLayouts.aa9476bc-98c8-4f32-8488-c0bf9890c737.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fieldLayouts.aa9476bc-98c8-4f32-8488-c0bf9890c737.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fieldLayouts.aa9476bc-98c8-4f32-8488-c0bf9890c737.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fieldLayouts.aa9476bc-98c8-4f32-8488-c0bf9890c737.tabs.0.sortOrder', '1'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.contentColumnType', '\"text\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.fieldGroup', 'null'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.handle', '\"text\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.instructions', '\"\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.name', '\"text\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.searchable', 'false'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.availableTransforms', '\"*\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.availableVolumes', '\"*\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.cleanupHtml', 'true'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.columnType', '\"text\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.configSelectionMode', '\"choose\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.defaultTransform', '\"\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.manualConfig', '\"\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.purifierConfig', '\"\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.purifyHtml', '\"1\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.redactorConfig', '\"Simple.json\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.removeEmptyTags', '\"1\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.removeInlineStyles', '\"1\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.removeNbsp', '\"1\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.showHtmlButtonForNonAdmins', '\"\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.showUnpermittedFiles', 'false'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.showUnpermittedVolumes', 'false'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.settings.uiMode', '\"enlarged\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.translationKeyFormat', 'null'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.translationMethod', '\"none\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.fields.e53f8f6a-84e8-4f3c-9714-6f42e2c8b11e.type', '\"craft\\\\redactor\\\\Field\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.handle', '\"paragraph\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.name', '\"paragraph\"'),
('matrixBlockTypes.6c38c618-958b-4b50-971b-36ad786f4a09.sortOrder', '2'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.field', '\"3cbe8045-904b-49bb-ac50-4926692bbaaf\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fieldLayouts.35c8ef8c-7749-4feb-b978-014c2520b0df.tabs.0.elements.0.fieldUid', '\"87d40e09-ebd6-43fd-a04c-f10c36136d34\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fieldLayouts.35c8ef8c-7749-4feb-b978-014c2520b0df.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fieldLayouts.35c8ef8c-7749-4feb-b978-014c2520b0df.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fieldLayouts.35c8ef8c-7749-4feb-b978-014c2520b0df.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fieldLayouts.35c8ef8c-7749-4feb-b978-014c2520b0df.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fieldLayouts.35c8ef8c-7749-4feb-b978-014c2520b0df.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fieldLayouts.35c8ef8c-7749-4feb-b978-014c2520b0df.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fieldLayouts.35c8ef8c-7749-4feb-b978-014c2520b0df.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fieldLayouts.35c8ef8c-7749-4feb-b978-014c2520b0df.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fieldLayouts.35c8ef8c-7749-4feb-b978-014c2520b0df.tabs.0.sortOrder', '1'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.contentColumnType', '\"text\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.fieldGroup', 'null'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.handle', '\"links\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.instructions', '\"\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.name', '\"Links\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.searchable', 'false'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.availableTransforms', '\"*\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.availableVolumes', '\"*\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.cleanupHtml', 'true'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.columnType', '\"text\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.configSelectionMode', '\"choose\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.defaultTransform', '\"\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.manualConfig', '\"\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.purifierConfig', '\"\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.purifyHtml', '\"1\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.redactorConfig', '\"\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.removeEmptyTags', '\"1\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.removeInlineStyles', '\"1\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.removeNbsp', '\"1\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.showHtmlButtonForNonAdmins', '\"\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.showUnpermittedFiles', 'false'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.showUnpermittedVolumes', 'false'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.settings.uiMode', '\"enlarged\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.translationKeyFormat', 'null'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.translationMethod', '\"none\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.fields.87d40e09-ebd6-43fd-a04c-f10c36136d34.type', '\"craft\\\\redactor\\\\Field\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.handle', '\"link\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.name', '\"link\"'),
('matrixBlockTypes.7b01d4d3-3c5a-41f2-b8c0-cdeca4f5effe.sortOrder', '3'),
('plugins.cheat-sheet.edition', '\"standard\"'),
('plugins.cheat-sheet.enabled', 'true'),
('plugins.cheat-sheet.schemaVersion', '\"1.0.0\"'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.enableVersioning', 'true'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.handle', '\"home\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.name', '\"Home\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.propagationMethod', '\"all\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"index\"'),
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
('sections.a33a073b-15ff-49f7-9d47-1e80709c0e74.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"inside\"'),
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
('1c53a70f', '@craft/redactor/assets/redactor/dist'),
('1c5dac01', '@lib/jquery-touch-events'),
('1e55a4d6', '@craft/web/assets/pluginstore/dist'),
('1f9c60ae', '@craft/web/assets/editsection/dist'),
('1fc6a5e8', '@lib/d3'),
('2070412f', '@app/web/assets/craftsupport/dist'),
('20943329', '@lib/axios'),
('20c76e31', '@lib/vue'),
('24c5335d', '@lib/iframe-resizer-cw'),
('26e1a714', '@lib/garnishjs'),
('276ad210', '@lib/d3'),
('2abc426b', '@lib/fabric'),
('2cda3f45', '@lib/element-resize-detector'),
('303e52a7', '@craft/redactor/assets/field/dist'),
('311913d', '@lib/fileupload'),
('32f04902', '@lib/selectize'),
('33528306', '@craft/web/assets/admintable/dist'),
('33f24dca', '@craft/web/assets/login/dist'),
('352be76f', '@craft/redactor/assets/redactor-plugins/dist/video'),
('389c0d88', '@lib/xregexp'),
('3bf4fa07', '@craft/web/assets/craftsupport/dist'),
('3caa71c2', '@craft/web/assets/dashboard/dist'),
('3dbe3ea8', '@app/web/assets/recententries/dist'),
('42210f74', '@craft/web/assets/deprecationerrors/dist'),
('45077818', '@craft/web/assets/matrix/dist'),
('4577c929', '@lib/jquery-ui'),
('45e95709', '@craft/web/assets/feed/dist'),
('495216a8', '@lib/velocity'),
('4da33745', '@lib/picturefill'),
('4e1c743', '@craft/web/assets/feed/dist'),
('5575b940', '@lib/jquery.payment'),
('58dde1d5', '@bower/jquery/dist'),
('5990b018', '@app/web/assets/matrixsettings/dist'),
('59ad685b', '@craft/web/assets/cp/dist'),
('5a020035', '@craft/redactor/assets/field/dist'),
('5a8d45bc', '@app/web/assets/cp/dist'),
('5d042388', '@craft/web/assets/editentry/dist'),
('5e458c0f', '@craft/web/assets/updater/dist'),
('5e94f0e4', '@craft/web/assets/editsection/dist'),
('624b2a15', '@lib/vue'),
('626802e4', '@craft/web/assets/matrixsettings/dist'),
('628a67e6', '@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
('693c883e', '@craft/web/assets/updateswidget/dist'),
('76355fd', '@lib/timepicker'),
('774d4a20', '@lib/element-resize-detector'),
('7afc6a4d', '@craft/web/assets/craftsupport/dist'),
('7da2e188', '@craft/web/assets/dashboard/dist'),
('7fb8d0d', '@lib/jquery-ui'),
('8009f0d6', '@lib/selectize'),
('8626d59f', '@craft/web/assets/cp/dist'),
('8734565b', '@lib/jquery-ui'),
('8a65b45c', '@lib/xregexp'),
('8b63574', '@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
('8f5de5e2', '@craft/web/assets/pluginstore/dist'),
('911b2f57', '@craft/web/assets/fieldsettings/dist'),
('915fa5b4', '@lib/jquery-touch-events'),
('923ed7e5', '@lib/vue'),
('96fb9976', '@lib/picturefill'),
('9708a9c9', '@lib/fileupload'),
('97937f6', '@app/web/assets/feed/dist'),
('984261c7', '@app/web/assets/dashboard/dist'),
('9bab96de', '@lib/iframe-resizer'),
('9c580c0e', '@craft/web/assets/updateswidget/dist'),
('a1d836f0', '@lib/element-resize-detector'),
('a1ff9286', '@app/web/assets/editentry/dist'),
('a2e24e60', '@craft/web/assets/recententries/dist'),
('a2fa0cfe', '@craft/web/assets/login/dist'),
('a532793e', '@craft/redactor/assets/redactor/dist'),
('a7676a9d', '@craft/redactor/assets/redactor-plugins/dist/video'),
('a7be4bde', '@lib/fabric'),
('ab21083f', '@craft/web/assets/updater/dist'),
('b2f89fe0', '@lib/garnishjs'),
('b4081c4a', '@app/web/assets/fields/dist'),
('b59aec29', '@lib/timepicker'),
('bde4671c', '@craft/web/assets/fields/dist'),
('bde528c', '@lib/velocity'),
('c03ce3bb', '@lib/iframe-resizer'),
('c285b4f2', '@lib/selectize'),
('c648bf6', '@app/web/assets/login/dist'),
('c8e9f078', '@lib/xregexp'),
('c9add6ad', '@app/web/assets/editsection/dist'),
('cc9fdcac', '@lib/fileupload'),
('cd5b380f', '@craft/redactor/assets/redactor-plugins/dist/video'),
('cf0e2bac', '@craft/redactor/assets/redactor/dist'),
('d013bf1d', '@craft/web/assets/fieldsettings/dist'),
('d2c6c78f', '@app/web/assets/updateswidget/dist'),
('d2ccd44', '@lib/axios'),
('d3d3e190', '@lib/jquery-touch-events'),
('d40f392c', '@craft/web/assets/matrix/dist'),
('d477dd52', '@lib/picturefill'),
('d5ba6216', '@lib/jquery.payment'),
('d5bb2e41', '@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
('d8123a83', '@bower/jquery/dist'),
('d94e263d', '@app/web/assets/fieldsettings/dist'),
('dad2fd03', '@lib/d3'),
('dcd4ed55', '@craft/web/assets/utilities/dist'),
('e315c66c', '@lib/axios'),
('e4d330f0', '@app/web/assets/matrix/dist'),
('e96fea85', '@lib/garnishjs'),
('efec480d', '@app/web/assets/admintable/dist'),
('f36043d0', '@craft/web/assets/matrixsettings/dist'),
('f42878d3', '@craft/redactor/assets/field/dist'),
('f5c20f83', '@craft/web/assets/admintable/dist'),
('f716a80d', '@lib/timepicker'),
('fb2ae2a', '@lib/iframe-resizer'),
('fbabaf7c', '@lib/velocity'),
('fc293ebb', '@lib/fabric'),
('fcecf756', '@craft/web/assets/fields/dist');

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
(54, 110, 1, 1, NULL),
(55, 2, 1, 7, NULL),
(56, 24, 1, 5, ''),
(57, 24, 1, 6, ''),
(58, 24, 1, 7, ''),
(59, 24, 1, 8, ''),
(60, 24, 1, 9, ''),
(61, 24, 1, 10, ''),
(62, 24, 1, 11, ''),
(63, 24, 1, 12, ''),
(64, 24, 1, 13, ''),
(65, 27, 1, 6, ''),
(66, 27, 1, 7, ''),
(67, 27, 1, 8, ''),
(68, 27, 1, 9, ''),
(69, 24, 1, 14, ''),
(70, 24, 1, 15, ''),
(71, 42, 1, 3, ''),
(72, 45, 1, 4, ''),
(73, 54, 1, 4, ''),
(74, 54, 1, 5, ''),
(75, 58, 1, 4, ''),
(76, 58, 1, 5, ''),
(77, 39, 1, 3, ''),
(78, 39, 1, 4, ''),
(79, 39, 1, 5, ''),
(80, 39, 1, 6, ''),
(81, 39, 1, 7, ''),
(82, 39, 1, 8, ''),
(83, 39, 1, 9, ''),
(84, 42, 1, 4, ''),
(85, 42, 1, 5, ''),
(86, 42, 1, 6, ''),
(87, 42, 1, 7, ''),
(88, 42, 1, 8, ''),
(89, 42, 1, 9, ''),
(90, 42, 1, 10, ''),
(91, 42, 1, 11, ''),
(92, 42, 1, 12, ''),
(93, 42, 1, 13, ''),
(94, 54, 1, 6, '');

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
(24, 'slug', 0, 1, ' greetings '),
(27, 'slug', 0, 1, ' mission statement '),
(30, 'title', 0, 1, ' staff '),
(30, 'slug', 0, 1, ' staff '),
(33, 'title', 0, 1, ' alumni '),
(33, 'slug', 0, 1, ' alumni '),
(36, 'slug', 0, 1, ' academics '),
(36, 'title', 0, 1, ' academics '),
(39, 'slug', 0, 1, ' schools '),
(42, 'slug', 0, 1, ' exam schedule '),
(45, 'title', 0, 1, ' examinations '),
(48, 'slug', 0, 1, ' admissions '),
(48, 'title', 0, 1, ' admissions '),
(51, 'title', 0, 1, ' apply '),
(51, 'slug', 0, 1, ' apply '),
(54, 'title', 0, 1, ' fee structure '),
(61, 'slug', 0, 1, ' portal '),
(61, 'title', 0, 1, ' portal '),
(64, 'slug', 0, 1, ' staff '),
(67, 'title', 0, 1, ' student '),
(24, 'title', 0, 1, ' greetings '),
(27, 'title', 0, 1, ' mission statement '),
(45, 'slug', 0, 1, ' examinations '),
(54, 'slug', 0, 1, ' fee structure '),
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
(113, 'slug', 0, 1, ''),
(2, 'title', 0, 1, ' home '),
(115, 'slug', 0, 1, ''),
(116, 'slug', 0, 1, ''),
(117, 'slug', 0, 1, ''),
(118, 'slug', 0, 1, ''),
(124, 'slug', 0, 1, ''),
(135, 'slug', 0, 1, ''),
(136, 'slug', 0, 1, ''),
(141, 'slug', 0, 1, ''),
(147, 'slug', 0, 1, ''),
(148, 'slug', 0, 1, ''),
(149, 'slug', 0, 1, ''),
(150, 'slug', 0, 1, ''),
(151, 'slug', 0, 1, ''),
(152, 'slug', 0, 1, ''),
(164, 'slug', 0, 1, ''),
(177, 'slug', 0, 1, ''),
(178, 'slug', 0, 1, ''),
(179, 'slug', 0, 1, ''),
(180, 'slug', 0, 1, ''),
(181, 'slug', 0, 1, ''),
(182, 'slug', 0, 1, ''),
(183, 'slug', 0, 1, ''),
(200, 'slug', 0, 1, ''),
(201, 'slug', 0, 1, ''),
(202, 'slug', 0, 1, ''),
(203, 'slug', 0, 1, ''),
(204, 'slug', 0, 1, ''),
(205, 'slug', 0, 1, ''),
(206, 'slug', 0, 1, ''),
(222, 'slug', 0, 1, ''),
(263, 'slug', 0, 1, ''),
(264, 'slug', 0, 1, ''),
(42, 'title', 0, 1, ' exam schedule '),
(268, 'slug', 0, 1, ''),
(269, 'slug', 0, 1, ''),
(273, 'slug', 0, 1, ''),
(276, 'slug', 0, 1, ''),
(277, 'slug', 0, 1, ''),
(278, 'slug', 0, 1, ''),
(279, 'slug', 0, 1, ''),
(280, 'slug', 0, 1, ''),
(281, 'slug', 0, 1, ''),
(282, 'slug', 0, 1, ''),
(292, 'slug', 0, 1, ''),
(293, 'slug', 0, 1, ''),
(294, 'slug', 0, 1, ''),
(295, 'slug', 0, 1, ''),
(296, 'slug', 0, 1, ''),
(297, 'slug', 0, 1, ''),
(298, 'slug', 0, 1, ''),
(299, 'slug', 0, 1, ''),
(300, 'slug', 0, 1, ''),
(301, 'slug', 0, 1, ''),
(58, 'slug', 0, 1, ' scholarship '),
(313, 'slug', 0, 1, ''),
(58, 'title', 0, 1, ' scholarship '),
(326, 'slug', 0, 1, ''),
(327, 'slug', 0, 1, ''),
(328, 'slug', 0, 1, ''),
(329, 'slug', 0, 1, ''),
(330, 'slug', 0, 1, ''),
(39, 'title', 0, 1, ' schools '),
(343, 'slug', 0, 1, ''),
(344, 'slug', 0, 1, ''),
(345, 'slug', 0, 1, ''),
(346, 'slug', 0, 1, ''),
(357, 'slug', 0, 1, ''),
(358, 'slug', 0, 1, ''),
(359, 'slug', 0, 1, ''),
(360, 'slug', 0, 1, ''),
(361, 'slug', 0, 1, ''),
(362, 'slug', 0, 1, ''),
(379, 'slug', 0, 1, ''),
(380, 'slug', 0, 1, ''),
(381, 'slug', 0, 1, ''),
(401, 'slug', 0, 1, ''),
(402, 'slug', 0, 1, ''),
(403, 'slug', 0, 1, ''),
(404, 'slug', 0, 1, ''),
(405, 'slug', 0, 1, ''),
(406, 'slug', 0, 1, ''),
(407, 'slug', 0, 1, ''),
(408, 'slug', 0, 1, ''),
(409, 'slug', 0, 1, ''),
(410, 'slug', 0, 1, ''),
(411, 'slug', 0, 1, ''),
(412, 'slug', 0, 1, ''),
(413, 'slug', 0, 1, ''),
(414, 'slug', 0, 1, ''),
(415, 'slug', 0, 1, ''),
(495, 'slug', 0, 1, '');

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
(1, 1, 1, 1, '__home__', 'index', 1, '2020-12-02 10:53:11', '2020-12-08 20:12:37', '704039d8-ce7c-403f-94e8-bf2626941b9b'),
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
(16, 16, 1, 1, '{parent.uri}/{slug}', 'inside', 1, '2020-12-08 15:40:07', '2020-12-08 21:39:13', '73a7360a-c333-4f3d-9b9e-e3d9db3ab2dc'),
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
(5, 1, 'PCEFALMPK6jEuinGM0EtY4PELCm_sOiYsmIRTS2caFTJkAPJqVuzk2ZVnWuBrNIRumPDLm559GLYkmCKcqp-qOA5Gl-UERrn6Wuz', '2020-12-08 15:32:00', '2020-12-08 18:55:00', 'eebeb177-b84a-4bc4-b683-ed25899f8772'),
(8, 1, 'JHbOWjpurztaG7EkGtv_wWzRuRQqkAYrSkrAc7TlCPC1Sc0GQufV-LDoui6hSnXeFH36NkWwsNK3d5qaZ_IKKo78diIZNlU8y5dt', '2020-12-12 05:52:35', '2020-12-12 09:33:32', '96a3185b-a563-44ee-87ec-66936b981fbf');

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
(5, 17, NULL, 5, 1, 190, 0, '2020-12-08 15:43:06', '2020-12-12 09:09:50', '0cbb698d-335b-4315-bf2b-7d736ce414f1'),
(7, 17, 21, 5, 2, 69, 1, '2020-12-08 15:43:15', '2020-12-12 05:56:30', 'e3a6b42b-1d0a-4252-9836-307f7f2400fe'),
(8, 17, 22, 5, 70, 71, 1, '2020-12-08 15:43:16', '2020-12-12 05:56:30', '3b95fe2b-f05c-438d-a9c3-5e2892e1416d'),
(10, 17, 24, 5, 3, 4, 2, '2020-12-08 15:43:49', '2020-12-08 15:43:50', '3890db26-2165-46e4-8d41-4e2c344a315e'),
(11, 17, 25, 5, 5, 6, 2, '2020-12-08 15:43:50', '2020-12-08 15:43:50', '419ef113-25db-4b42-af4c-2eb6ed9026d3'),
(13, 17, 27, 5, 7, 8, 2, '2020-12-08 15:46:56', '2020-12-08 15:46:56', '53af314d-10a6-4d8d-8165-4c2de8a3a084'),
(14, 17, 28, 5, 9, 10, 2, '2020-12-08 15:46:56', '2020-12-08 15:46:56', '33191e1f-1fd0-4bc5-ab07-5e0db44d0538'),
(16, 17, 30, 5, 11, 12, 2, '2020-12-08 15:48:34', '2020-12-08 15:48:34', '34d887d6-7026-4a99-b66a-c62690d5fe2d'),
(17, 17, 31, 5, 13, 14, 2, '2020-12-08 15:48:34', '2020-12-08 15:48:34', 'f42fc825-4bde-4d6e-8523-47626f5bdd95'),
(19, 17, 33, 5, 15, 16, 2, '2020-12-08 15:48:57', '2020-12-08 15:48:57', '2da0efd0-cd8f-4a71-a007-16e2de36eb74'),
(20, 17, 34, 5, 17, 18, 2, '2020-12-08 15:48:57', '2020-12-08 15:48:57', '06a18356-c694-479c-89c6-63978c6dd81b'),
(22, 17, 36, 5, 72, 131, 1, '2020-12-08 15:51:08', '2020-12-12 09:01:11', '714c8041-f417-4471-9f08-6f9a8e01be41'),
(23, 17, 37, 5, 132, 133, 1, '2020-12-08 15:51:08', '2020-12-12 09:01:11', '7a6a3f3a-24b4-45a6-b9a3-ca6a155ce171'),
(25, 17, 39, 5, 73, 74, 2, '2020-12-08 15:52:10', '2020-12-12 05:56:30', '6842834b-e005-4796-8df8-c17dece471b2'),
(26, 17, 40, 5, 75, 76, 2, '2020-12-08 15:52:10', '2020-12-12 05:56:30', '7e3fb010-7a78-4936-9347-ae7c13fd452c'),
(28, 17, 42, 5, 77, 78, 2, '2020-12-08 15:53:12', '2020-12-12 05:56:30', 'b1f10b1a-6248-437f-8dcb-fde3d71b4fe4'),
(29, 17, 43, 5, 79, 80, 2, '2020-12-08 15:53:12', '2020-12-12 05:56:30', 'de20e8e3-386b-44c3-b16b-60d4f159c223'),
(31, 17, 45, 5, 81, 82, 2, '2020-12-08 15:53:41', '2020-12-12 05:56:30', '411adbbd-4343-49e2-aa9a-515715792f09'),
(32, 17, 46, 5, 83, 84, 2, '2020-12-08 15:53:41', '2020-12-12 05:56:30', 'ec59825f-5187-43b0-9ae6-9b5f1c249495'),
(34, 17, 48, 5, 134, 165, 1, '2020-12-08 15:54:26', '2020-12-12 09:09:50', 'da6c6244-558e-4af0-8c66-1502782829b7'),
(35, 17, 49, 5, 166, 167, 1, '2020-12-08 15:54:26', '2020-12-12 09:09:50', 'ab98c3a9-03a3-46af-b50d-e490be5431e0'),
(37, 17, 51, 5, 135, 136, 2, '2020-12-08 15:55:03', '2020-12-12 09:01:11', '1ae7d404-866f-4a7a-a616-cb599d87d0be'),
(38, 17, 52, 5, 137, 138, 2, '2020-12-08 15:55:03', '2020-12-12 09:01:11', 'f7229aaa-e812-4c40-a8e7-7c646bbb7c06'),
(40, 17, 54, 5, 139, 140, 2, '2020-12-08 15:55:25', '2020-12-12 09:01:11', 'd9143b40-898d-4ffe-93e4-c3ff3047ff36'),
(41, 17, 55, 5, 168, 169, 1, '2020-12-08 15:55:26', '2020-12-12 09:09:50', 'b41876c6-5841-413a-9475-f6c7e99badd4'),
(42, 17, 56, 5, 141, 142, 2, '2020-12-08 15:55:47', '2020-12-12 09:01:11', 'ff95ef3e-d445-4b31-979e-3835eb818fdd'),
(44, 17, 58, 5, 143, 144, 2, '2020-12-08 15:56:56', '2020-12-12 09:01:11', '78d80cec-f5d6-48c2-a747-caf925d650f4'),
(45, 17, 59, 5, 145, 146, 2, '2020-12-08 15:56:56', '2020-12-12 09:01:11', '3ee736c8-9a68-462c-a63a-4414bc26210b'),
(48, 17, 62, 5, 188, 189, 1, '2020-12-08 15:57:28', '2020-12-12 09:09:50', 'fc6be9f4-c384-4568-97da-5958cfbec5f7'),
(51, 17, 65, 5, 170, 171, 1, '2020-12-08 15:58:12', '2020-12-12 09:09:50', 'cb5918fd-7abe-4a92-b72b-ed5982016cc3'),
(54, 17, 68, 5, 172, 173, 1, '2020-12-08 15:59:02', '2020-12-12 09:09:50', '4ee5f30f-6bae-41ad-94d4-421435793427'),
(55, 17, 69, 5, 19, 20, 2, '2020-12-08 16:27:40', '2020-12-08 16:27:40', 'de07b573-3be7-4bee-a3ed-d15a9346ac34'),
(56, 17, 70, 5, 21, 22, 2, '2020-12-08 16:28:40', '2020-12-08 16:28:40', '665032fa-5d02-45a7-ba53-d0fb62ac1b6e'),
(57, 17, 71, 5, 23, 24, 2, '2020-12-08 16:41:39', '2020-12-08 16:41:39', '17a7b24c-dc5c-4cea-aec3-9a111b1a8be5'),
(58, 17, 72, 5, 25, 26, 2, '2020-12-08 16:42:16', '2020-12-08 16:42:16', '5f643759-a31b-4169-99d3-33b931489607'),
(59, 17, 73, 5, 27, 28, 2, '2020-12-08 16:53:02', '2020-12-08 16:53:02', 'a0fab3e1-978a-4fbd-baed-a0b3f44d4880'),
(60, 17, 74, 5, 29, 30, 2, '2020-12-08 16:58:08', '2020-12-08 16:58:08', '9df6f00d-d51d-4eab-a314-bea112a80a51'),
(61, 17, 75, 5, 31, 32, 2, '2020-12-08 16:59:39', '2020-12-08 16:59:39', '9dd7726b-fa5e-4ede-b764-020bba39ab7e'),
(62, 17, 76, 5, 33, 34, 2, '2020-12-08 17:01:29', '2020-12-08 17:01:29', '50c93e9a-67e7-477a-ad8c-ff66afcf4e52'),
(63, 17, 77, 5, 35, 36, 2, '2020-12-08 17:01:46', '2020-12-08 17:01:46', 'd2596e2e-5bb7-4b7b-9394-4d7fa1d61def'),
(64, 17, 78, 5, 85, 86, 2, '2020-12-08 17:03:16', '2020-12-12 05:56:30', '7d02cd4c-ff07-4e65-b49d-44fd29776534'),
(65, 17, 79, 5, 87, 88, 2, '2020-12-08 17:03:45', '2020-12-12 05:56:30', '0f821337-9269-4839-b268-04b6a75d9240'),
(66, 17, 80, 5, 89, 90, 2, '2020-12-08 17:04:21', '2020-12-12 05:56:30', '972cc73a-4b57-412d-8b4a-c1ebf424db14'),
(67, 17, 81, 5, 91, 92, 2, '2020-12-08 17:04:27', '2020-12-12 05:56:30', '30bb8046-f7da-4716-89f5-642173938554'),
(68, 17, 82, 5, 147, 148, 2, '2020-12-08 17:04:51', '2020-12-12 09:01:11', 'abda33cd-f03b-40bd-9e8a-810fd2b664fa'),
(69, 17, 83, 5, 149, 150, 2, '2020-12-08 17:05:06', '2020-12-12 09:01:11', 'b349b301-9df2-4922-a6a2-f8b59a06a048'),
(70, 17, 84, 5, 151, 152, 2, '2020-12-08 17:05:23', '2020-12-12 09:01:11', '5eaa92e3-1c46-4989-916a-6bd0798190af'),
(71, 17, 85, 5, 153, 154, 2, '2020-12-08 17:05:36', '2020-12-12 09:01:11', '62358c04-7e41-4b27-9ee1-569e616af497'),
(72, 17, 86, 5, 174, 175, 1, '2020-12-08 17:05:49', '2020-12-12 09:09:50', '544ac0cc-1d44-421e-8a73-55e34e263184'),
(73, 17, 87, 5, 176, 177, 1, '2020-12-08 17:06:04', '2020-12-12 09:09:50', 'd5f362f5-e058-4380-b305-779029c99914'),
(74, 17, 88, 5, 37, 38, 2, '2020-12-08 17:08:08', '2020-12-08 17:08:08', '5ee0d6d3-7173-4e7a-991f-4b52f46f4337'),
(75, 17, 103, 5, 178, 179, 1, '2020-12-08 18:42:42', '2020-12-12 09:09:50', '6ae1af58-4d5f-47a1-afc1-e77d1f9303c5'),
(76, 17, 104, 5, 180, 181, 1, '2020-12-08 18:43:11', '2020-12-12 09:09:50', '1ebc55ae-2d81-4fd5-9d14-c897dd86f705'),
(77, 17, 105, 5, 182, 183, 1, '2020-12-08 18:43:42', '2020-12-12 09:09:50', 'fac60e60-b50c-43e3-ac0b-2370b7af0ed7'),
(80, 17, 108, 5, 184, 185, 1, '2020-12-08 18:44:43', '2020-12-12 09:09:50', '47afc43b-258e-48a9-85d5-32ed6b99d738'),
(83, 17, 111, 5, 186, 187, 1, '2020-12-08 18:45:19', '2020-12-12 09:09:50', 'f5d01bbe-86c5-4ccd-9198-835b886ae316'),
(84, 17, 119, 5, 39, 40, 2, '2020-12-11 14:43:07', '2020-12-11 14:43:07', '7b74384f-45d0-4e95-a7ad-d21ef9a7d833'),
(85, 17, 125, 5, 41, 42, 2, '2020-12-11 20:30:46', '2020-12-11 20:30:46', 'eb289542-babf-4a4b-bd9d-7c380fef6c24'),
(86, 17, 128, 5, 43, 44, 2, '2020-12-11 20:31:55', '2020-12-11 20:31:55', '0d4353fb-746c-4124-8b23-420ed7d3520e'),
(87, 17, 131, 5, 45, 46, 2, '2020-12-11 20:49:48', '2020-12-11 20:49:48', '8c88eccf-6874-4fb9-8d28-7fc35426481f'),
(88, 17, 133, 5, 47, 48, 2, '2020-12-11 20:52:01', '2020-12-11 20:52:01', '5f6084a9-1b4d-4752-82eb-a507dc4d0423'),
(89, 17, 137, 5, 49, 50, 2, '2020-12-11 20:55:16', '2020-12-11 20:55:16', 'e58c3181-d5cd-4ffe-a21a-dcc510eb809e'),
(90, 17, 142, 5, 51, 52, 2, '2020-12-11 20:57:07', '2020-12-11 20:57:07', '65a18fd6-bdb6-4bfc-944f-23f2ea52133c'),
(91, 17, 153, 5, 53, 54, 2, '2020-12-11 21:07:14', '2020-12-11 21:07:14', '7a49101b-3d09-434d-b5aa-0598c4710fd7'),
(92, 17, 165, 5, 55, 56, 2, '2020-12-11 21:08:32', '2020-12-11 21:08:32', '7e654340-6b37-4c9c-8672-3b80c6ae8774'),
(93, 17, 184, 5, 57, 58, 2, '2020-12-11 21:16:21', '2020-12-11 21:16:21', '38a26113-42e4-49b8-a201-e6e6fe2c7c69'),
(94, 17, 192, 5, 59, 60, 2, '2020-12-11 21:17:20', '2020-12-11 21:17:20', 'c8564cb5-e19b-496b-a969-2b41de566a45'),
(95, 17, 207, 5, 61, 62, 2, '2020-12-11 21:26:48', '2020-12-11 21:26:48', '62689527-f6f1-4f9a-b601-f9143cda88c0'),
(96, 17, 223, 5, 63, 64, 2, '2020-12-11 21:28:40', '2020-12-11 21:28:40', '8f3051a9-26a7-4d38-9f09-227f74ca7595'),
(97, 17, 239, 5, 65, 66, 2, '2020-12-12 05:53:25', '2020-12-12 05:53:25', '0c97c831-b251-468f-b691-5a996481e588'),
(98, 17, 251, 5, 67, 68, 2, '2020-12-12 05:56:30', '2020-12-12 05:56:30', '440a48a0-9c70-4375-a0a2-e1b313da80d4'),
(99, 17, 265, 5, 93, 94, 2, '2020-12-12 06:12:25', '2020-12-12 06:12:25', '2bb07af3-c317-4c1f-811a-9c1e308b1395'),
(100, 17, 270, 5, 95, 96, 2, '2020-12-12 06:18:18', '2020-12-12 06:18:18', 'bb2a29c8-cf58-4574-bde3-ac52617bfa5d'),
(101, 17, 274, 5, 155, 156, 2, '2020-12-12 06:22:49', '2020-12-12 09:01:11', 'df4699f2-2d34-49c1-b410-2ab3f4d97a88'),
(102, 17, 283, 5, 157, 158, 2, '2020-12-12 06:26:27', '2020-12-12 09:01:11', '36da674b-f70a-4494-9d08-cbbdf59b4c71'),
(103, 17, 302, 5, 159, 160, 2, '2020-12-12 06:40:56', '2020-12-12 09:01:11', 'e8f82b0c-da7d-4d80-99fb-05a2f041c5de'),
(104, 17, 314, 5, 161, 162, 2, '2020-12-12 06:41:31', '2020-12-12 09:01:11', '04ebf642-ef53-49ff-b835-02283816f00a'),
(105, 17, 331, 5, 97, 98, 2, '2020-12-12 06:54:26', '2020-12-12 06:54:26', '56e21caa-47d6-43a7-97f3-f09e349c8aa9'),
(106, 17, 337, 5, 99, 100, 2, '2020-12-12 06:55:53', '2020-12-12 06:55:53', 'dc1d87ea-18e0-4c85-a12a-3f843d3dcfa8'),
(107, 17, 347, 5, 101, 102, 2, '2020-12-12 06:59:06', '2020-12-12 06:59:06', '09a8735b-7a17-4029-9ca9-acb60b030a12'),
(108, 17, 363, 5, 103, 104, 2, '2020-12-12 07:04:31', '2020-12-12 07:04:31', '69e99e45-9902-4bb4-9d50-27573b422bdb'),
(109, 17, 382, 5, 105, 106, 2, '2020-12-12 07:06:33', '2020-12-12 07:06:33', '70f0bd32-7b57-419c-8366-db00a903bc7b'),
(110, 17, 416, 5, 107, 108, 2, '2020-12-12 07:17:31', '2020-12-12 07:17:31', '4205694d-5a90-4cb5-ba83-63ff37416c06'),
(111, 17, 450, 5, 109, 110, 2, '2020-12-12 07:20:31', '2020-12-12 07:20:31', 'a1b78a33-88ea-4a24-8519-a4b712fed359'),
(112, 17, 484, 5, 111, 112, 2, '2020-12-12 07:40:34', '2020-12-12 07:40:34', 'db7291e5-3275-44de-9fe9-938d1c16446b'),
(113, 17, 487, 5, 113, 114, 2, '2020-12-12 07:43:17', '2020-12-12 07:43:17', '85bb3970-e49d-4877-9ed1-355af49207e1'),
(114, 17, 490, 5, 115, 116, 2, '2020-12-12 08:02:34', '2020-12-12 08:02:34', '1f2f9ccb-bc24-4d78-8d21-991d2b4d20a7'),
(115, 17, 493, 5, 117, 118, 2, '2020-12-12 08:47:32', '2020-12-12 08:47:32', '02c8df3e-eb29-4ad8-9982-0fb25511c240'),
(116, 17, 496, 5, 119, 120, 2, '2020-12-12 08:51:43', '2020-12-12 08:51:43', 'f52d2111-e5e1-4eb7-83c4-3cd6732bf29d'),
(117, 17, 499, 5, 121, 122, 2, '2020-12-12 08:55:31', '2020-12-12 08:55:31', '52306404-2ecf-4e6f-9879-ee13e2bc7206'),
(118, 17, 502, 5, 123, 124, 2, '2020-12-12 08:58:02', '2020-12-12 08:58:02', '627af99c-a8b7-4284-b926-3ac166ef0bb3'),
(119, 17, 505, 5, 125, 126, 2, '2020-12-12 08:58:45', '2020-12-12 08:58:45', 'ae892680-bf9f-494e-9541-df8ff1e792d9'),
(120, 17, 508, 5, 127, 128, 2, '2020-12-12 09:00:20', '2020-12-12 09:00:20', '4e5c437d-3f11-43d5-b201-1eaa16446223'),
(121, 17, 511, 5, 129, 130, 2, '2020-12-12 09:01:11', '2020-12-12 09:01:11', 'd11c2842-2b24-4dd4-a6ab-f2c5d5f66b9c'),
(122, 17, 514, 5, 163, 164, 2, '2020-12-12 09:09:50', '2020-12-12 09:09:50', '4d859669-10e2-4901-a94c-804381c739e4');

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
(1, 'kevin', NULL, NULL, NULL, 'qevinodhiambo@gmail.com', '$2y$13$jcOtX29w8KeV9pXx6OWKM.NOSDcVw/0qkcPN.AAiLj8U3.4vk9R2u', 1, 0, 0, 0, '2020-12-12 05:52:35', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2020-12-02 10:43:07', '2020-12-02 10:43:07', '2020-12-12 05:52:36', '61f5a495-422a-4685-8686-517181f49c03');

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
-- Indexes for table `matrixcontent_bodycontent`
--
ALTER TABLE `matrixcontent_bodycontent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_bodycontent_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_bodycontent_siteId_fk` (`siteId`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=523;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=523;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `matrixcontent_bodycontent`
--
ALTER TABLE `matrixcontent_bodycontent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

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
-- Constraints for table `matrixcontent_bodycontent`
--
ALTER TABLE `matrixcontent_bodycontent`
  ADD CONSTRAINT `matrixcontent_bodycontent_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_bodycontent_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
