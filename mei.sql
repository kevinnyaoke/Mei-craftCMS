-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2020 at 06:35 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.11

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
(9, 1, 'uri', '2020-12-02 15:45:00', 0, 1);

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
(2, 2, 1, 'Home', '2020-12-02 10:53:13', '2020-12-02 14:52:33', '2d18273f-c2da-47f3-9972-4aa58fc3aa94'),
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
(15, 15, 1, 'Schools', '2020-12-02 15:45:01', '2020-12-02 15:45:01', '46008c40-ebe6-4b73-b678-10b4ef496006');

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
(9, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:24:14', '2020-12-02 15:45:01', NULL, '1ca8687e-7507-41cd-8747-b6bf01a61e27'),
(10, NULL, 7, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:24:14', '2020-12-02 15:24:14', NULL, 'b13846f2-6a45-4b96-af55-b3bc41ccc9e7'),
(11, NULL, 8, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:24:15', '2020-12-02 15:24:15', NULL, '8c591278-3fbc-492f-b321-fd01764edfc9'),
(12, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:44:09', '2020-12-02 15:44:09', NULL, 'ea45511b-023b-422b-957c-e96a3f308780'),
(13, NULL, 9, 2, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:44:09', '2020-12-02 15:44:09', NULL, 'a0583513-d6e9-44d2-a61b-413b5b490337'),
(14, NULL, 10, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:45:00', '2020-12-02 15:45:00', NULL, 'e634a42f-8cae-4213-b74d-0fc1c0dbe93b'),
(15, NULL, 11, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-02 15:45:01', '2020-12-02 15:45:01', NULL, '3a1e3e66-7e71-4911-b140-9ccbdb53a077');

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
(15, 15, 1, 'schools', 'academics/schools', 1, '2020-12-02 15:45:01', '2020-12-02 15:45:01', '7cecd123-bae6-4e04-8764-5b7472a14c98');

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
(9, 6, NULL, 6, 1, '2020-12-02 15:24:00', NULL, NULL, '2020-12-02 15:24:15', '2020-12-02 15:46:05', 'cd519552-4379-4e43-9669-d927a6ca9540'),
(10, 6, NULL, 6, NULL, '2020-12-02 15:24:00', NULL, NULL, '2020-12-02 15:24:15', '2020-12-02 15:24:15', '922a4503-dc2d-452c-bc25-01301c1d8e49'),
(11, 6, NULL, 6, NULL, '2020-12-02 15:24:00', NULL, NULL, '2020-12-02 15:24:15', '2020-12-02 15:24:15', '6692fe1a-7645-4c78-b8f7-74a65367c6a1'),
(12, 2, NULL, 2, 1, '2020-12-02 15:44:00', NULL, NULL, '2020-12-02 15:44:09', '2020-12-02 15:46:26', '735945b1-bbf3-443b-964c-1e4eee370a5a'),
(13, 2, NULL, 2, NULL, '2020-12-02 15:44:00', NULL, NULL, '2020-12-02 15:44:09', '2020-12-02 15:44:09', '51567cc7-4804-4721-bae9-586c8ca86fe9'),
(14, 6, NULL, 6, NULL, '2020-12-02 15:24:00', NULL, NULL, '2020-12-02 15:45:00', '2020-12-02 15:45:00', 'c0c8a413-3560-4d85-b946-46c61019b382'),
(15, 6, NULL, 6, NULL, '2020-12-02 15:24:00', NULL, NULL, '2020-12-02 15:45:01', '2020-12-02 15:45:01', 'df2657fe-ab0a-4ffe-afd1-7f9519fdf81d');

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
(2, 2, 2, 'Greetings', 'greetings', 1, 'site', NULL, NULL, 1, '2020-12-02 11:16:33', '2020-12-02 11:16:33', NULL, 'dca0e860-1dd6-43fc-af50-f6adf3914068'),
(3, 3, 3, 'Mission', 'mission', 1, 'site', NULL, NULL, 1, '2020-12-02 12:19:16', '2020-12-02 12:19:16', NULL, '2fd841d0-b335-4d97-bc79-fd4db0c2ecba'),
(4, 4, 4, 'AboutStaff', 'aboutstaff', 1, 'site', NULL, NULL, 1, '2020-12-02 12:21:34', '2020-12-02 12:21:34', NULL, '95b58764-df3e-4227-81c0-3897b50a4edf'),
(5, 5, 5, 'AboutAlumni', 'aboutalumni', 1, 'site', NULL, NULL, 1, '2020-12-02 12:22:14', '2020-12-02 12:22:14', NULL, 'abcf5fd0-ae5e-4577-923d-aee6ae4b531b'),
(6, 6, 6, 'Schools', 'schools', 1, 'site', NULL, NULL, 1, '2020-12-02 12:24:35', '2020-12-02 12:24:35', NULL, '2710db0e-9638-4b24-bb48-4e2ab1b5f26c'),
(7, 7, 7, 'Schedule', 'schedule', 1, 'site', NULL, NULL, 1, '2020-12-02 12:27:17', '2020-12-02 12:27:17', NULL, 'e1afc9e9-4c3c-4d31-95ec-2212110d0401'),
(8, 8, 8, 'Exam', 'exam', 1, 'site', NULL, NULL, 1, '2020-12-02 12:28:38', '2020-12-02 12:28:38', NULL, '6106ddac-0f1c-43b8-abe1-c8289788ca4f'),
(9, 9, 9, 'Apply', 'apply', 1, 'site', NULL, NULL, 1, '2020-12-02 12:29:20', '2020-12-02 12:29:20', NULL, '0e3571ff-0cce-4079-a1e6-69df3c841450'),
(10, 10, 10, 'Fee', 'fee', 1, 'site', NULL, NULL, 1, '2020-12-02 12:30:20', '2020-12-02 12:30:20', NULL, 'df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1'),
(11, 11, 11, 'Scholarship', 'scholarship', 1, 'site', NULL, NULL, 1, '2020-12-02 12:31:45', '2020-12-02 12:32:26', NULL, '91655e28-563b-4366-9cf8-5b046d9ea034'),
(12, 12, 12, 'Gallery', 'gallery', 1, 'site', NULL, NULL, 1, '2020-12-02 12:33:56', '2020-12-02 12:33:56', NULL, 'cb81be3f-bd15-48cc-8b74-a150d503dce6'),
(13, 13, 13, 'Contact', 'contact', 1, 'site', NULL, NULL, 1, '2020-12-02 12:34:30', '2020-12-02 12:34:30', NULL, '2ef3126b-a69b-4060-808a-40b707b5ea3e'),
(14, 14, 14, 'Alumni', 'alumni', 1, 'site', NULL, NULL, 1, '2020-12-02 12:36:56', '2020-12-02 12:36:56', NULL, '7332022d-0fc1-4456-9497-9716b6740a95'),
(15, 15, 15, 'Staff', 'staff', 1, 'site', NULL, NULL, 1, '2020-12-02 12:39:27', '2020-12-02 12:39:27', NULL, 'c5dd63e5-01a5-4c62-8e13-71add4b4ad68');

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
(1, 'Common', '2020-12-02 10:43:05', '2020-12-02 10:43:05', 'cfeacf29-a9a2-4dd0-8566-09319a280117');

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
(2, 'craft\\elements\\Entry', '2020-12-02 11:16:33', '2020-12-02 11:16:33', NULL, '02f32c2d-e80f-45ef-a55c-9a864803a003'),
(3, 'craft\\elements\\Entry', '2020-12-02 12:19:16', '2020-12-02 12:19:16', NULL, '36a3adaf-0829-4e93-b13e-db2ea9719a94'),
(4, 'craft\\elements\\Entry', '2020-12-02 12:21:34', '2020-12-02 12:21:34', NULL, '5f220621-d955-4433-bf08-b5e2e5df4f0e'),
(5, 'craft\\elements\\Entry', '2020-12-02 12:22:14', '2020-12-02 12:22:14', NULL, 'cde72b09-6161-4e5b-832a-98a96c4f8258'),
(6, 'craft\\elements\\Entry', '2020-12-02 12:24:35', '2020-12-02 12:24:35', NULL, '9033ad55-b824-4eef-a574-c123e2cceaf4'),
(7, 'craft\\elements\\Entry', '2020-12-02 12:27:17', '2020-12-02 12:27:17', NULL, '5a42492e-f378-46b8-983f-3722e83616d3'),
(8, 'craft\\elements\\Entry', '2020-12-02 12:28:38', '2020-12-02 12:28:38', NULL, '3e8e5ee3-cf67-4e8a-8748-5b41338e01fc'),
(9, 'craft\\elements\\Entry', '2020-12-02 12:29:20', '2020-12-02 12:29:20', NULL, '692961db-d3ca-4335-9a15-ffa7e35f4da3'),
(10, 'craft\\elements\\Entry', '2020-12-02 12:30:20', '2020-12-02 12:30:20', NULL, 'bb8e5e61-e950-4942-9780-d6c714763604'),
(11, 'craft\\elements\\Entry', '2020-12-02 12:31:45', '2020-12-02 12:31:45', NULL, '1f24db5c-988c-4e3a-a40f-22b9a85dfc79'),
(12, 'craft\\elements\\Entry', '2020-12-02 12:33:56', '2020-12-02 12:33:56', NULL, '90ab103c-065b-4728-bda3-c691a5873088'),
(13, 'craft\\elements\\Entry', '2020-12-02 12:34:30', '2020-12-02 12:34:30', NULL, '03ab4a56-4407-42aa-b1e5-26237f1b4486'),
(14, 'craft\\elements\\Entry', '2020-12-02 12:36:56', '2020-12-02 12:36:56', NULL, 'bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb'),
(15, 'craft\\elements\\Entry', '2020-12-02 12:39:27', '2020-12-02 12:39:27', NULL, '09dc10b5-e310-4517-8669-fe2489e2b866');

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
(17, 15, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-02 12:39:27', '2020-12-02 12:39:27', '1bda70d0-ad7f-4bdc-a7da-4655f6e1a4d8');

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
(1, '3.5.16', '3.5.13', 0, 'ofhowhghdrxx', 'dfpvjjlgjrmn', '2020-12-02 10:43:05', '2020-12-02 15:46:22', 'b3876e5d-ef6c-4d26-b725-df99efb8f4bd');

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
(176, 'craft', 'm200825_051217_project_config_version', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '2020-12-02 10:43:16', '13c1c518-03c3-4ba1-ba82-78fe31444c36');

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
('dateModified', '1606923982'),
('email.fromEmail', '\"qevinodhiambo@gmail.com\"'),
('email.fromName', '\"Mei\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.class', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.disabled', 'false'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.id', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.instructions', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.label', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.max', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.min', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.name', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.orientation', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.readonly', 'false'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.requirable', 'false'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.size', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.step', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.tip', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.title', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.warning', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.elements.0.width', '100'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.name', '\"Content\"'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.fieldLayouts.692961db-d3ca-4335-9a15-ffa7e35f4da3.tabs.0.sortOrder', '1'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.handle', '\"apply\"'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.hasTitleField', 'true'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.name', '\"Apply\"'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.section', '\"75be57fe-b2db-48fa-bb0e-c45af44dc7ea\"'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.sortOrder', '1'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.titleFormat', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.titleTranslationKeyFormat', 'null'),
('entryTypes.0e3571ff-0cce-4079-a1e6-69df3c841450.titleTranslationMethod', '\"site\"'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.class', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.disabled', 'false'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.id', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.instructions', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.label', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.max', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.min', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.name', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.orientation', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.readonly', 'false'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.requirable', 'false'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.size', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.step', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.tip', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.title', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.warning', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.elements.0.width', '100'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.name', '\"Content\"'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.fieldLayouts.9033ad55-b824-4eef-a574-c123e2cceaf4.tabs.0.sortOrder', '1'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.handle', '\"schools\"'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.hasTitleField', 'true'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.name', '\"Schools\"'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.section', '\"1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7\"'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.sortOrder', '1'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.titleFormat', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.titleTranslationKeyFormat', 'null'),
('entryTypes.2710db0e-9638-4b24-bb48-4e2ab1b5f26c.titleTranslationMethod', '\"site\"'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.class', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.disabled', 'false'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.id', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.instructions', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.label', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.max', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.min', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.name', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.orientation', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.readonly', 'false'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.requirable', 'false'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.size', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.step', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.tip', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.title', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.warning', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.elements.0.width', '100'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.name', '\"Content\"'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.fieldLayouts.03ab4a56-4407-42aa-b1e5-26237f1b4486.tabs.0.sortOrder', '1'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.handle', '\"contact\"'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.hasTitleField', 'true'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.name', '\"Contact\"'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.section', '\"4629d9a3-48f4-4027-9b50-9e60194ca0e6\"'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.sortOrder', '1'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.titleFormat', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.titleTranslationKeyFormat', 'null'),
('entryTypes.2ef3126b-a69b-4060-808a-40b707b5ea3e.titleTranslationMethod', '\"site\"'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.class', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.disabled', 'false'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.id', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.instructions', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.label', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.max', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.min', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.name', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.orientation', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.readonly', 'false'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.requirable', 'false'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.size', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.step', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.tip', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.title', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.warning', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.elements.0.width', '100'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.name', '\"Content\"'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.fieldLayouts.36a3adaf-0829-4e93-b13e-db2ea9719a94.tabs.0.sortOrder', '1'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.handle', '\"mission\"'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.hasTitleField', 'true'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.name', '\"Mission\"'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.section', '\"c4245f71-fd9a-4a75-aa18-f8b49ca3b152\"'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.sortOrder', '1'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.titleFormat', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.titleTranslationKeyFormat', 'null'),
('entryTypes.2fd841d0-b335-4d97-bc79-fd4db0c2ecba.titleTranslationMethod', '\"site\"'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.class', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.disabled', 'false'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.id', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.instructions', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.label', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.max', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.min', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.name', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.orientation', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.readonly', 'false'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.requirable', 'false'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.size', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.step', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.tip', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.title', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.warning', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.elements.0.width', '100'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.name', '\"Content\"'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.fieldLayouts.3e8e5ee3-cf67-4e8a-8748-5b41338e01fc.tabs.0.sortOrder', '1'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.handle', '\"exam\"'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.hasTitleField', 'true'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.name', '\"Exam\"'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.section', '\"66295c0c-8af6-4de9-96ad-638b9d92d5cf\"'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.sortOrder', '1'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.titleFormat', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.titleTranslationKeyFormat', 'null'),
('entryTypes.6106ddac-0f1c-43b8-abe1-c8289788ca4f.titleTranslationMethod', '\"site\"'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.class', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.disabled', 'false'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.id', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.instructions', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.label', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.max', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.min', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.name', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.orientation', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.readonly', 'false'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.requirable', 'false'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.size', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.step', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.tip', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.title', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.warning', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.elements.0.width', '100'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.name', '\"Content\"'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.fieldLayouts.bb49d4cb-6f64-4ee4-8e27-5ad5809b18bb.tabs.0.sortOrder', '1'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.handle', '\"alumni\"'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.hasTitleField', 'true'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.name', '\"Alumni\"'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.section', '\"65e93377-f763-46de-a938-f05317809adc\"'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.sortOrder', '1'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.titleFormat', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.titleTranslationKeyFormat', 'null'),
('entryTypes.7332022d-0fc1-4456-9497-9716b6740a95.titleTranslationMethod', '\"site\"'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.class', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.disabled', 'false'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.id', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.instructions', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.label', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.max', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.min', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.name', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.orientation', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.readonly', 'false'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.requirable', 'false'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.size', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.step', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.tip', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.title', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.warning', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.elements.0.width', '100'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.name', '\"Content\"'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.fieldLayouts.1f24db5c-988c-4e3a-a40f-22b9a85dfc79.tabs.0.sortOrder', '1'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.handle', '\"scholarship\"'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.hasTitleField', 'true'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.name', '\"Scholarship\"'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.section', '\"a22993d6-7a8a-468f-9ac2-e2ddc3b6439e\"'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.sortOrder', '1'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.titleFormat', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.titleTranslationKeyFormat', 'null'),
('entryTypes.91655e28-563b-4366-9cf8-5b046d9ea034.titleTranslationMethod', '\"site\"'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.class', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.disabled', 'false'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.id', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.instructions', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.label', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.max', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.min', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.name', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.orientation', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.readonly', 'false'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.requirable', 'false'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.size', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.step', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.tip', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.title', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.warning', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.elements.0.width', '100'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.name', '\"Content\"'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.fieldLayouts.5f220621-d955-4433-bf08-b5e2e5df4f0e.tabs.0.sortOrder', '1'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.handle', '\"aboutstaff\"'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.hasTitleField', 'true'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.name', '\"AboutStaff\"'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.section', '\"3a58d25d-f80a-4b8e-a429-3f9105852d79\"'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.sortOrder', '1'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.titleFormat', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.titleTranslationKeyFormat', 'null'),
('entryTypes.95b58764-df3e-4227-81c0-3897b50a4edf.titleTranslationMethod', '\"site\"'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.class', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.disabled', 'false'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.id', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.instructions', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.label', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.max', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.min', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.name', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.orientation', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.readonly', 'false'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.requirable', 'false'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.size', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.step', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.tip', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.title', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.warning', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.elements.0.width', '100'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.name', '\"Content\"'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.fieldLayouts.cde72b09-6161-4e5b-832a-98a96c4f8258.tabs.0.sortOrder', '1'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.handle', '\"aboutalumni\"'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.hasTitleField', 'true'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.name', '\"AboutAlumni\"'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.section', '\"a0310744-fdbd-44cc-a7ba-3042cb85ddc4\"'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.sortOrder', '1'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.titleFormat', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.titleTranslationKeyFormat', 'null'),
('entryTypes.abcf5fd0-ae5e-4577-923d-aee6ae4b531b.titleTranslationMethod', '\"site\"'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.class', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.disabled', 'false'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.id', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.instructions', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.label', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.max', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.min', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.name', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.orientation', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.readonly', 'false'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.requirable', 'false'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.size', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.step', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.tip', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.title', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.warning', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.elements.0.width', '100'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.name', '\"Content\"'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.fieldLayouts.09dc10b5-e310-4517-8669-fe2489e2b866.tabs.0.sortOrder', '1'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.handle', '\"staff\"'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.hasTitleField', 'true'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.name', '\"Staff\"'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.section', '\"9a2a7379-35ea-4850-9004-5e29a853ca99\"'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.sortOrder', '1'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.titleFormat', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.titleTranslationKeyFormat', 'null'),
('entryTypes.c5dd63e5-01a5-4c62-8e13-71add4b4ad68.titleTranslationMethod', '\"site\"'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.class', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.disabled', 'false'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.id', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.instructions', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.label', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.max', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.min', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.name', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.orientation', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.readonly', 'false'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.requirable', 'false'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.size', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.step', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.tip', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.title', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.warning', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.elements.0.width', '100'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.name', '\"Content\"'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.fieldLayouts.90ab103c-065b-4728-bda3-c691a5873088.tabs.0.sortOrder', '1'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.handle', '\"gallery\"'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.hasTitleField', 'true'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.name', '\"Gallery\"'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.section', '\"96139a7b-692e-42e1-8bb5-4044c847c566\"'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.sortOrder', '1'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.titleFormat', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.titleTranslationKeyFormat', 'null'),
('entryTypes.cb81be3f-bd15-48cc-8b74-a150d503dce6.titleTranslationMethod', '\"site\"'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.class', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.disabled', 'false'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.id', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.instructions', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.label', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.max', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.min', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.name', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.orientation', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.readonly', 'false'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.requirable', 'false'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.size', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.step', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.tip', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.title', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.warning', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.elements.0.width', '100'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.name', '\"Content\"'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.fieldLayouts.02f32c2d-e80f-45ef-a55c-9a864803a003.tabs.0.sortOrder', '1'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.handle', '\"greetings\"'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.hasTitleField', 'true'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.name', '\"Greetings\"'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.section', '\"73bf7ae6-3a9d-4782-8f37-2dc0c510455b\"'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.sortOrder', '1'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.titleFormat', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.titleTranslationKeyFormat', 'null'),
('entryTypes.dca0e860-1dd6-43fc-af50-f6adf3914068.titleTranslationMethod', '\"site\"'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.class', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.disabled', 'false'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.id', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.instructions', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.label', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.max', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.min', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.name', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.orientation', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.readonly', 'false'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.requirable', 'false'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.size', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.step', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.tip', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.title', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.elements.0.width', '100'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.name', '\"Content\"'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.fieldLayouts.bb8e5e61-e950-4942-9780-d6c714763604.tabs.0.sortOrder', '1'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.handle', '\"fee\"'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.hasTitleField', 'true'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.name', '\"Fee\"'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.section', '\"a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa\"'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.sortOrder', '1'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.titleFormat', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.titleTranslationKeyFormat', 'null'),
('entryTypes.df1ecdd0-fa04-4ccb-8e22-1c2efa747ad1.titleTranslationMethod', '\"site\"'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.class', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.disabled', 'false'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.id', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.instructions', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.label', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.max', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.min', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.name', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.orientation', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.readonly', 'false'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.requirable', 'false'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.size', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.step', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.tip', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.title', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.warning', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.elements.0.width', '100'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.name', '\"Content\"'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.fieldLayouts.5a42492e-f378-46b8-983f-3722e83616d3.tabs.0.sortOrder', '1'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.handle', '\"schedule\"'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.hasTitleField', 'true'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.name', '\"Schedule\"'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.section', '\"2266ef54-1914-4b8b-bed9-12b2455cbd50\"'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.sortOrder', '1'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.titleFormat', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.titleTranslationKeyFormat', 'null'),
('entryTypes.e1afc9e9-4c3c-4d31-95ec-2212110d0401.titleTranslationMethod', '\"site\"'),
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
('fieldGroups.cfeacf29-a9a2-4dd0-8566-09319a280117.name', '\"Common\"'),
('sections.1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7.enableVersioning', 'true'),
('sections.1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7.handle', '\"schools\"'),
('sections.1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7.name', '\"Schools\"'),
('sections.1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7.propagationMethod', '\"all\"'),
('sections.1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"academics\\\\schools\"'),
('sections.1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"academics/schools\"'),
('sections.1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7.structure.maxLevels', 'null'),
('sections.1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7.structure.uid', '\"1dccacb0-7487-4606-8988-4b5674afda3a\"'),
('sections.1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7.type', '\"structure\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.enableVersioning', 'true'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.handle', '\"home\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.name', '\"Home\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.propagationMethod', '\"all\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"home\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"__home__\"'),
('sections.1caa3108-aabf-4588-b715-08f17ff0584f.type', '\"single\"'),
('sections.2266ef54-1914-4b8b-bed9-12b2455cbd50.enableVersioning', 'true'),
('sections.2266ef54-1914-4b8b-bed9-12b2455cbd50.handle', '\"schedule\"'),
('sections.2266ef54-1914-4b8b-bed9-12b2455cbd50.name', '\"Schedule\"'),
('sections.2266ef54-1914-4b8b-bed9-12b2455cbd50.propagationMethod', '\"all\"'),
('sections.2266ef54-1914-4b8b-bed9-12b2455cbd50.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.2266ef54-1914-4b8b-bed9-12b2455cbd50.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.2266ef54-1914-4b8b-bed9-12b2455cbd50.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"academics\\\\schedule\"'),
('sections.2266ef54-1914-4b8b-bed9-12b2455cbd50.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"schedule/schedule\"'),
('sections.2266ef54-1914-4b8b-bed9-12b2455cbd50.structure.maxLevels', 'null'),
('sections.2266ef54-1914-4b8b-bed9-12b2455cbd50.structure.uid', '\"51830600-5fc6-4772-9c10-80719159bbee\"'),
('sections.2266ef54-1914-4b8b-bed9-12b2455cbd50.type', '\"structure\"'),
('sections.3a58d25d-f80a-4b8e-a429-3f9105852d79.enableVersioning', 'true'),
('sections.3a58d25d-f80a-4b8e-a429-3f9105852d79.handle', '\"aboutstaff\"'),
('sections.3a58d25d-f80a-4b8e-a429-3f9105852d79.name', '\"AboutStaff\"'),
('sections.3a58d25d-f80a-4b8e-a429-3f9105852d79.propagationMethod', '\"all\"'),
('sections.3a58d25d-f80a-4b8e-a429-3f9105852d79.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.3a58d25d-f80a-4b8e-a429-3f9105852d79.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.3a58d25d-f80a-4b8e-a429-3f9105852d79.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"about\\\\aboutstaff\"'),
('sections.3a58d25d-f80a-4b8e-a429-3f9105852d79.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"aboutstaff\"'),
('sections.3a58d25d-f80a-4b8e-a429-3f9105852d79.structure.maxLevels', 'null'),
('sections.3a58d25d-f80a-4b8e-a429-3f9105852d79.structure.uid', '\"3c2c2442-68a2-4a1a-8f05-47b158cac0c6\"'),
('sections.3a58d25d-f80a-4b8e-a429-3f9105852d79.type', '\"structure\"'),
('sections.4629d9a3-48f4-4027-9b50-9e60194ca0e6.enableVersioning', 'true'),
('sections.4629d9a3-48f4-4027-9b50-9e60194ca0e6.handle', '\"contact\"'),
('sections.4629d9a3-48f4-4027-9b50-9e60194ca0e6.name', '\"Contact\"'),
('sections.4629d9a3-48f4-4027-9b50-9e60194ca0e6.propagationMethod', '\"all\"'),
('sections.4629d9a3-48f4-4027-9b50-9e60194ca0e6.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.4629d9a3-48f4-4027-9b50-9e60194ca0e6.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.4629d9a3-48f4-4027-9b50-9e60194ca0e6.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"contact\"'),
('sections.4629d9a3-48f4-4027-9b50-9e60194ca0e6.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"contact/{slug}\"'),
('sections.4629d9a3-48f4-4027-9b50-9e60194ca0e6.structure.maxLevels', 'null'),
('sections.4629d9a3-48f4-4027-9b50-9e60194ca0e6.structure.uid', '\"98b7f180-29ea-49b3-af25-d2312fb11495\"'),
('sections.4629d9a3-48f4-4027-9b50-9e60194ca0e6.type', '\"structure\"'),
('sections.65e93377-f763-46de-a938-f05317809adc.enableVersioning', 'true'),
('sections.65e93377-f763-46de-a938-f05317809adc.handle', '\"alumni\"'),
('sections.65e93377-f763-46de-a938-f05317809adc.name', '\"Alumni\"'),
('sections.65e93377-f763-46de-a938-f05317809adc.propagationMethod', '\"all\"'),
('sections.65e93377-f763-46de-a938-f05317809adc.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.65e93377-f763-46de-a938-f05317809adc.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.65e93377-f763-46de-a938-f05317809adc.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"portal\\\\alumni\"'),
('sections.65e93377-f763-46de-a938-f05317809adc.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"portal/alumni/{slug}\"'),
('sections.65e93377-f763-46de-a938-f05317809adc.structure.maxLevels', 'null'),
('sections.65e93377-f763-46de-a938-f05317809adc.structure.uid', '\"0c41d934-4129-490d-aaf3-6f73fa131818\"'),
('sections.65e93377-f763-46de-a938-f05317809adc.type', '\"structure\"'),
('sections.66295c0c-8af6-4de9-96ad-638b9d92d5cf.enableVersioning', 'true'),
('sections.66295c0c-8af6-4de9-96ad-638b9d92d5cf.handle', '\"exam\"'),
('sections.66295c0c-8af6-4de9-96ad-638b9d92d5cf.name', '\"Exam\"'),
('sections.66295c0c-8af6-4de9-96ad-638b9d92d5cf.propagationMethod', '\"all\"'),
('sections.66295c0c-8af6-4de9-96ad-638b9d92d5cf.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.66295c0c-8af6-4de9-96ad-638b9d92d5cf.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.66295c0c-8af6-4de9-96ad-638b9d92d5cf.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"academics\\\\exams\"'),
('sections.66295c0c-8af6-4de9-96ad-638b9d92d5cf.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"academics/exam\"'),
('sections.66295c0c-8af6-4de9-96ad-638b9d92d5cf.structure.maxLevels', 'null'),
('sections.66295c0c-8af6-4de9-96ad-638b9d92d5cf.structure.uid', '\"6d41300a-4f25-47c1-81ca-801d835a57f7\"'),
('sections.66295c0c-8af6-4de9-96ad-638b9d92d5cf.type', '\"structure\"'),
('sections.73bf7ae6-3a9d-4782-8f37-2dc0c510455b.enableVersioning', 'true'),
('sections.73bf7ae6-3a9d-4782-8f37-2dc0c510455b.handle', '\"greetings\"'),
('sections.73bf7ae6-3a9d-4782-8f37-2dc0c510455b.name', '\"Greetings\"'),
('sections.73bf7ae6-3a9d-4782-8f37-2dc0c510455b.propagationMethod', '\"all\"'),
('sections.73bf7ae6-3a9d-4782-8f37-2dc0c510455b.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.73bf7ae6-3a9d-4782-8f37-2dc0c510455b.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.73bf7ae6-3a9d-4782-8f37-2dc0c510455b.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"about\\\\greetings\"'),
('sections.73bf7ae6-3a9d-4782-8f37-2dc0c510455b.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"about/greetings\"'),
('sections.73bf7ae6-3a9d-4782-8f37-2dc0c510455b.structure.maxLevels', 'null'),
('sections.73bf7ae6-3a9d-4782-8f37-2dc0c510455b.structure.uid', '\"42459457-ab3f-4885-b2f5-03ad2e8972e7\"'),
('sections.73bf7ae6-3a9d-4782-8f37-2dc0c510455b.type', '\"structure\"'),
('sections.75be57fe-b2db-48fa-bb0e-c45af44dc7ea.enableVersioning', 'true'),
('sections.75be57fe-b2db-48fa-bb0e-c45af44dc7ea.handle', '\"apply\"'),
('sections.75be57fe-b2db-48fa-bb0e-c45af44dc7ea.name', '\"Apply\"'),
('sections.75be57fe-b2db-48fa-bb0e-c45af44dc7ea.propagationMethod', '\"all\"'),
('sections.75be57fe-b2db-48fa-bb0e-c45af44dc7ea.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.75be57fe-b2db-48fa-bb0e-c45af44dc7ea.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.75be57fe-b2db-48fa-bb0e-c45af44dc7ea.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"admission\\\\apply\"'),
('sections.75be57fe-b2db-48fa-bb0e-c45af44dc7ea.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"admission/apply/{slug}\"'),
('sections.75be57fe-b2db-48fa-bb0e-c45af44dc7ea.structure.maxLevels', 'null'),
('sections.75be57fe-b2db-48fa-bb0e-c45af44dc7ea.structure.uid', '\"f5572ce4-8194-4261-a10d-72749856efe7\"'),
('sections.75be57fe-b2db-48fa-bb0e-c45af44dc7ea.type', '\"structure\"'),
('sections.96139a7b-692e-42e1-8bb5-4044c847c566.enableVersioning', 'true'),
('sections.96139a7b-692e-42e1-8bb5-4044c847c566.handle', '\"gallery\"'),
('sections.96139a7b-692e-42e1-8bb5-4044c847c566.name', '\"Gallery\"'),
('sections.96139a7b-692e-42e1-8bb5-4044c847c566.propagationMethod', '\"all\"'),
('sections.96139a7b-692e-42e1-8bb5-4044c847c566.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.96139a7b-692e-42e1-8bb5-4044c847c566.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.96139a7b-692e-42e1-8bb5-4044c847c566.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"gallery\"'),
('sections.96139a7b-692e-42e1-8bb5-4044c847c566.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"gallery/{slug}\"'),
('sections.96139a7b-692e-42e1-8bb5-4044c847c566.structure.maxLevels', 'null'),
('sections.96139a7b-692e-42e1-8bb5-4044c847c566.structure.uid', '\"871ab187-3dd1-4a3b-a4bb-9ad59e0451b6\"'),
('sections.96139a7b-692e-42e1-8bb5-4044c847c566.type', '\"structure\"'),
('sections.9a2a7379-35ea-4850-9004-5e29a853ca99.enableVersioning', 'true'),
('sections.9a2a7379-35ea-4850-9004-5e29a853ca99.handle', '\"staff\"'),
('sections.9a2a7379-35ea-4850-9004-5e29a853ca99.name', '\"Staff\"'),
('sections.9a2a7379-35ea-4850-9004-5e29a853ca99.propagationMethod', '\"all\"'),
('sections.9a2a7379-35ea-4850-9004-5e29a853ca99.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.9a2a7379-35ea-4850-9004-5e29a853ca99.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.9a2a7379-35ea-4850-9004-5e29a853ca99.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"portal\\\\staff\"'),
('sections.9a2a7379-35ea-4850-9004-5e29a853ca99.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"portal/staff/{slug}\"'),
('sections.9a2a7379-35ea-4850-9004-5e29a853ca99.structure.maxLevels', 'null'),
('sections.9a2a7379-35ea-4850-9004-5e29a853ca99.structure.uid', '\"cc3b1844-83ff-42d8-a436-c4eb10308d25\"'),
('sections.9a2a7379-35ea-4850-9004-5e29a853ca99.type', '\"structure\"'),
('sections.a0310744-fdbd-44cc-a7ba-3042cb85ddc4.enableVersioning', 'true'),
('sections.a0310744-fdbd-44cc-a7ba-3042cb85ddc4.handle', '\"aboutalumni\"'),
('sections.a0310744-fdbd-44cc-a7ba-3042cb85ddc4.name', '\"AboutAlumni\"'),
('sections.a0310744-fdbd-44cc-a7ba-3042cb85ddc4.propagationMethod', '\"all\"'),
('sections.a0310744-fdbd-44cc-a7ba-3042cb85ddc4.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.a0310744-fdbd-44cc-a7ba-3042cb85ddc4.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.a0310744-fdbd-44cc-a7ba-3042cb85ddc4.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"about\\\\aboutalumni\"'),
('sections.a0310744-fdbd-44cc-a7ba-3042cb85ddc4.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"aboutalumni\"'),
('sections.a0310744-fdbd-44cc-a7ba-3042cb85ddc4.structure.maxLevels', 'null'),
('sections.a0310744-fdbd-44cc-a7ba-3042cb85ddc4.structure.uid', '\"1e08bfb4-fbc4-43ce-b5ec-ef562201c03d\"'),
('sections.a0310744-fdbd-44cc-a7ba-3042cb85ddc4.type', '\"structure\"'),
('sections.a22993d6-7a8a-468f-9ac2-e2ddc3b6439e.enableVersioning', 'true'),
('sections.a22993d6-7a8a-468f-9ac2-e2ddc3b6439e.handle', '\"scholarship\"'),
('sections.a22993d6-7a8a-468f-9ac2-e2ddc3b6439e.name', '\"Scholarship\"'),
('sections.a22993d6-7a8a-468f-9ac2-e2ddc3b6439e.propagationMethod', '\"all\"'),
('sections.a22993d6-7a8a-468f-9ac2-e2ddc3b6439e.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.a22993d6-7a8a-468f-9ac2-e2ddc3b6439e.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.a22993d6-7a8a-468f-9ac2-e2ddc3b6439e.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"admission\\\\scholarship\"'),
('sections.a22993d6-7a8a-468f-9ac2-e2ddc3b6439e.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"admission/scholarship/{slug}\"'),
('sections.a22993d6-7a8a-468f-9ac2-e2ddc3b6439e.structure.maxLevels', 'null'),
('sections.a22993d6-7a8a-468f-9ac2-e2ddc3b6439e.structure.uid', '\"08445fd3-cf58-4538-8c44-bb8722e901e0\"'),
('sections.a22993d6-7a8a-468f-9ac2-e2ddc3b6439e.type', '\"structure\"'),
('sections.a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa.enableVersioning', 'true'),
('sections.a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa.handle', '\"fee\"'),
('sections.a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa.name', '\"Fee\"'),
('sections.a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa.propagationMethod', '\"all\"'),
('sections.a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"admission\\\\fee\"'),
('sections.a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"admission/fee/{slug}\"'),
('sections.a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa.structure.maxLevels', 'null'),
('sections.a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa.structure.uid', '\"8fdda822-0ebb-49df-8ea8-766536dd92ce\"'),
('sections.a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa.type', '\"structure\"'),
('sections.c4245f71-fd9a-4a75-aa18-f8b49ca3b152.enableVersioning', 'true'),
('sections.c4245f71-fd9a-4a75-aa18-f8b49ca3b152.handle', '\"mission\"'),
('sections.c4245f71-fd9a-4a75-aa18-f8b49ca3b152.name', '\"Mission\"'),
('sections.c4245f71-fd9a-4a75-aa18-f8b49ca3b152.propagationMethod', '\"all\"'),
('sections.c4245f71-fd9a-4a75-aa18-f8b49ca3b152.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.enabledByDefault', 'true'),
('sections.c4245f71-fd9a-4a75-aa18-f8b49ca3b152.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.hasUrls', 'true'),
('sections.c4245f71-fd9a-4a75-aa18-f8b49ca3b152.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.template', '\"about\\\\mission\"'),
('sections.c4245f71-fd9a-4a75-aa18-f8b49ca3b152.siteSettings.347fb537-1b10-43af-aa22-3b9c7df0448f.uriFormat', '\"mission\"'),
('sections.c4245f71-fd9a-4a75-aa18-f8b49ca3b152.structure.maxLevels', 'null'),
('sections.c4245f71-fd9a-4a75-aa18-f8b49ca3b152.structure.uid', '\"7da97827-5072-4f9b-bab2-ed056930fb46\"'),
('sections.c4245f71-fd9a-4a75-aa18-f8b49ca3b152.type', '\"structure\"'),
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
('1fc6a5e8', '@lib/d3'),
('2cda3f45', '@lib/element-resize-detector'),
('33528306', '@craft/web/assets/admintable/dist'),
('3caa71c2', '@craft/web/assets/dashboard/dist'),
('4577c929', '@lib/jquery-ui'),
('45e95709', '@craft/web/assets/feed/dist'),
('59ad685b', '@craft/web/assets/cp/dist'),
('5e94f0e4', '@craft/web/assets/editsection/dist'),
('624b2a15', '@lib/vue'),
('693c883e', '@craft/web/assets/updateswidget/dist'),
('7afc6a4d', '@craft/web/assets/craftsupport/dist'),
('915fa5b4', '@lib/jquery-touch-events'),
('96fb9976', '@lib/picturefill'),
('9708a9c9', '@lib/fileupload'),
('9bab96de', '@lib/iframe-resizer'),
('a2fa0cfe', '@craft/web/assets/login/dist'),
('a7be4bde', '@lib/fabric'),
('b2f89fe0', '@lib/garnishjs'),
('bde4671c', '@craft/web/assets/fields/dist'),
('bde528c', '@lib/velocity'),
('c285b4f2', '@lib/selectize'),
('c8e9f078', '@lib/xregexp'),
('d013bf1d', '@craft/web/assets/fieldsettings/dist'),
('e315c66c', '@lib/axios');

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
(11, 9, 1, 4, NULL);

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
(12, 'title', 0, 1, ' greetings '),
(12, 'slug', 0, 1, ' greetings '),
(9, 'slug', 0, 1, ' schools ');

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
(2, 16, 'Greetings', 'greetings', 'structure', 1, 'all', NULL, '2020-12-02 11:16:32', '2020-12-02 15:46:22', NULL, '73bf7ae6-3a9d-4782-8f37-2dc0c510455b'),
(3, 2, 'Mission', 'mission', 'structure', 1, 'all', NULL, '2020-12-02 12:19:16', '2020-12-02 12:19:16', NULL, 'c4245f71-fd9a-4a75-aa18-f8b49ca3b152'),
(4, 3, 'AboutStaff', 'aboutstaff', 'structure', 1, 'all', NULL, '2020-12-02 12:21:34', '2020-12-02 12:21:34', NULL, '3a58d25d-f80a-4b8e-a429-3f9105852d79'),
(5, 4, 'AboutAlumni', 'aboutalumni', 'structure', 1, 'all', NULL, '2020-12-02 12:22:14', '2020-12-02 12:22:14', NULL, 'a0310744-fdbd-44cc-a7ba-3042cb85ddc4'),
(6, 15, 'Schools', 'schools', 'structure', 1, 'all', NULL, '2020-12-02 12:24:34', '2020-12-02 15:46:03', NULL, '1a1fb8e8-d72e-48ec-a2d2-efa3c2a990b7'),
(7, 6, 'Schedule', 'schedule', 'structure', 1, 'all', NULL, '2020-12-02 12:27:17', '2020-12-02 12:27:17', NULL, '2266ef54-1914-4b8b-bed9-12b2455cbd50'),
(8, 7, 'Exam', 'exam', 'structure', 1, 'all', NULL, '2020-12-02 12:28:38', '2020-12-02 12:28:38', NULL, '66295c0c-8af6-4de9-96ad-638b9d92d5cf'),
(9, 8, 'Apply', 'apply', 'structure', 1, 'all', NULL, '2020-12-02 12:29:20', '2020-12-02 12:29:20', NULL, '75be57fe-b2db-48fa-bb0e-c45af44dc7ea'),
(10, 9, 'Fee', 'fee', 'structure', 1, 'all', NULL, '2020-12-02 12:30:20', '2020-12-02 12:30:20', NULL, 'a6b822e1-e0e3-4b3d-a5de-0ea3b8d37dfa'),
(11, 10, 'Scholarship', 'scholarship', 'structure', 1, 'all', NULL, '2020-12-02 12:31:45', '2020-12-02 12:38:51', NULL, 'a22993d6-7a8a-468f-9ac2-e2ddc3b6439e'),
(12, 11, 'Gallery', 'gallery', 'structure', 1, 'all', NULL, '2020-12-02 12:33:56', '2020-12-02 12:33:56', NULL, '96139a7b-692e-42e1-8bb5-4044c847c566'),
(13, 12, 'Contact', 'contact', 'structure', 1, 'all', NULL, '2020-12-02 12:34:30', '2020-12-02 12:34:30', NULL, '4629d9a3-48f4-4027-9b50-9e60194ca0e6'),
(14, 13, 'Alumni', 'alumni', 'structure', 1, 'all', NULL, '2020-12-02 12:36:56', '2020-12-02 12:36:56', NULL, '65e93377-f763-46de-a938-f05317809adc'),
(15, 14, 'Staff', 'staff', 'structure', 1, 'all', NULL, '2020-12-02 12:39:27', '2020-12-02 12:39:27', NULL, '9a2a7379-35ea-4850-9004-5e29a853ca99');

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
(15, 15, 1, 1, 'portal/staff/{slug}', 'portal\\staff', 1, '2020-12-02 12:39:27', '2020-12-02 15:02:51', '134b994c-c327-475f-9e1e-01f58743bbd0');

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
(4, 1, 'igNzXxUzRR_1UbnU1z7EnOlgZ3XDojKzNC0qUO5d6WQkC4d6cByVeG7439XHJx_CFzx82k-147AJ4Htl9UzHOmqFdZxLCPYS4pWO', '2020-12-02 18:14:30', '2020-12-02 18:15:32', '688763fa-b126-45e9-bf73-f5915a964a31');

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
(1, 15, NULL, 1, 1, 4, 0, '2020-12-02 15:46:03', '2020-12-02 15:46:03', '52225000-53b0-48d5-9da2-f5e453e3cb08'),
(2, 15, 9, 1, 2, 3, 1, '2020-12-02 15:46:03', '2020-12-02 15:46:03', 'ef0ac6f0-3d5e-4b2b-b9fb-78106a6301d9'),
(3, 16, NULL, 3, 1, 4, 0, '2020-12-02 15:46:22', '2020-12-02 15:46:22', '6b29ca33-e0aa-4a71-baeb-1722ea1c9afd'),
(4, 16, 12, 3, 2, 3, 1, '2020-12-02 15:46:22', '2020-12-02 15:46:22', 'ab2ad220-d1bd-4f9c-ad9a-0ab86beb5d7e');

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
(2, NULL, '2020-12-02 12:19:16', '2020-12-02 12:19:16', NULL, '7da97827-5072-4f9b-bab2-ed056930fb46'),
(3, NULL, '2020-12-02 12:21:34', '2020-12-02 12:21:34', NULL, '3c2c2442-68a2-4a1a-8f05-47b158cac0c6'),
(4, NULL, '2020-12-02 12:22:14', '2020-12-02 12:22:14', NULL, '1e08bfb4-fbc4-43ce-b5ec-ef562201c03d'),
(5, NULL, '2020-12-02 12:24:34', '2020-12-02 12:24:34', '2020-12-02 15:24:14', '7dd618a6-0a65-48ef-90ae-0fab73fa0cae'),
(6, NULL, '2020-12-02 12:27:17', '2020-12-02 12:27:17', NULL, '51830600-5fc6-4772-9c10-80719159bbee'),
(7, NULL, '2020-12-02 12:28:38', '2020-12-02 12:28:38', NULL, '6d41300a-4f25-47c1-81ca-801d835a57f7'),
(8, NULL, '2020-12-02 12:29:20', '2020-12-02 12:29:20', NULL, 'f5572ce4-8194-4261-a10d-72749856efe7'),
(9, NULL, '2020-12-02 12:30:20', '2020-12-02 12:30:20', NULL, '8fdda822-0ebb-49df-8ea8-766536dd92ce'),
(10, NULL, '2020-12-02 12:31:45', '2020-12-02 12:31:45', NULL, '08445fd3-cf58-4538-8c44-bb8722e901e0'),
(11, NULL, '2020-12-02 12:33:56', '2020-12-02 12:33:56', NULL, '871ab187-3dd1-4a3b-a4bb-9ad59e0451b6'),
(12, NULL, '2020-12-02 12:34:30', '2020-12-02 12:34:30', NULL, '98b7f180-29ea-49b3-af25-d2312fb11495'),
(13, NULL, '2020-12-02 12:36:56', '2020-12-02 12:36:56', NULL, '0c41d934-4129-490d-aaf3-6f73fa131818'),
(14, NULL, '2020-12-02 12:39:27', '2020-12-02 12:39:27', NULL, 'cc3b1844-83ff-42d8-a436-c4eb10308d25'),
(15, NULL, '2020-12-02 15:46:03', '2020-12-02 15:46:03', NULL, '1dccacb0-7487-4606-8988-4b5674afda3a'),
(16, NULL, '2020-12-02 15:46:22', '2020-12-02 15:46:22', NULL, '42459457-ab3f-4885-b2f5-03ad2e8972e7');

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
(1, 'kevin', NULL, NULL, NULL, 'qevinodhiambo@gmail.com', '$2y$13$jcOtX29w8KeV9pXx6OWKM.NOSDcVw/0qkcPN.AAiLj8U3.4vk9R2u', 1, 0, 0, 0, '2020-12-03 07:27:04', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2020-12-02 10:43:07', '2020-12-02 10:43:07', '2020-12-03 07:27:04', '61f5a495-422a-4685-8686-517181f49c03');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
