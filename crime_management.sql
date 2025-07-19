-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 19, 2025 lúc 08:38 AM
-- Phiên bản máy phục vụ: 10.11.13-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `crime_management`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `arrests`
--

CREATE TABLE `arrests` (
  `arrest_id` int(11) NOT NULL,
  `suspect_miranda_signature` longtext DEFAULT NULL,
  `arrest_start_time` datetime(6) DEFAULT NULL,
  `arrest_end_time` datetime(6) DEFAULT NULL,
  `holiday_conflict` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `holiday_id` int(11) DEFAULT NULL,
  `officer_id` varchar(50) DEFAULT NULL,
  `suspect_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `arrests`
--

INSERT INTO `arrests` (`arrest_id`, `suspect_miranda_signature`, `arrest_start_time`, `arrest_end_time`, `holiday_conflict`, `is_deleted`, `holiday_id`, `officer_id`, `suspect_id`) VALUES
(40, '1', '2025-05-01 12:05:00.000000', '2025-05-01 12:30:00.000000', 0, 0, 1, 'patrol.jane', 1),
(41, '1', '2025-05-05 23:10:00.000000', '2025-05-05 23:40:00.000000', 0, 0, 2, 'inv.mike', 5),
(42, '1', '2025-05-14 12:20:00.000000', '2025-05-14 12:50:00.000000', 0, 0, 3, 'inv.mike', 14),
(43, '1', '2025-05-19 19:10:00.000000', '2025-05-19 19:40:00.000000', 0, 0, 4, 'patrol.jane', 19),
(44, '0', '2025-05-02 02:10:00.000000', '2025-05-02 02:40:00.000000', 0, 0, 5, 'det.lisa', 2),
(45, '1', '2025-05-04 11:00:00.000000', '2025-05-04 11:30:00.000000', 0, 0, 6, 'det.lisa', 4),
(46, '0', '2025-05-07 12:30:00.000000', '2025-05-07 13:00:00.000000', 0, 0, 7, 'det.lisa', 7),
(47, '1', '2025-05-09 13:00:00.000000', '2025-05-09 13:30:00.000000', 0, 0, 8, 'det.lisa', 9),
(48, '1', '2025-05-10 16:00:00.000000', '2025-05-10 16:30:00.000000', 0, 0, 9, 'cyber.anna', 10),
(49, '1', '2025-05-11 05:00:00.000000', '2025-05-11 05:30:00.000000', 0, 0, 10, 'det.lisa', 11),
(50, '1', '2025-05-12 19:00:00.000000', '2025-05-12 19:30:00.000000', 0, 0, 11, 'det.lisa', 12),
(51, '1', '2025-05-13 22:30:00.000000', '2025-05-13 23:00:00.000000', 0, 0, 12, 'inv.mike', 13),
(52, '1', '2025-05-16 18:00:00.000000', '2025-05-16 18:30:00.000000', 0, 0, 13, 'det.lisa', 16),
(53, '1', '2025-05-17 12:30:00.000000', '2025-05-17 13:00:00.000000', 0, 0, 14, 'inv.mike', 17),
(54, '1', '2025-05-18 16:30:00.000000', '2025-05-18 17:00:00.000000', 0, 0, 5, 'det.lisa', 18),
(55, '1', '2025-05-20 11:00:00.000000', '2025-05-20 11:30:00.000000', 0, 0, 3, 'patrol.jane', 20),
(56, '1', '2025-05-01 12:45:00.000000', '2025-05-01 13:15:00.000000', 0, 0, 11, 'inv.mike', 1),
(57, '1', '2025-05-04 17:00:00.000000', '2025-05-04 17:30:00.000000', 0, 0, 6, 'det.lisa', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add report', 7, 'add_report'),
(26, 'Can change report', 7, 'change_report'),
(27, 'Can delete report', 7, 'delete_report'),
(28, 'Can view report', 7, 'view_report'),
(29, 'Can add suspect', 8, 'add_suspect'),
(30, 'Can change suspect', 8, 'change_suspect'),
(31, 'Can delete suspect', 8, 'delete_suspect'),
(32, 'Can view suspect', 8, 'view_suspect'),
(33, 'Can add report victim', 9, 'add_reportvictim'),
(34, 'Can change report victim', 9, 'change_reportvictim'),
(35, 'Can delete report victim', 9, 'delete_reportvictim'),
(36, 'Can view report victim', 9, 'view_reportvictim'),
(37, 'Can add report witness', 10, 'add_reportwitness'),
(38, 'Can change report witness', 10, 'change_reportwitness'),
(39, 'Can delete report witness', 10, 'delete_reportwitness'),
(40, 'Can view report witness', 10, 'view_reportwitness'),
(41, 'Can add report suspect', 11, 'add_reportsuspect'),
(42, 'Can change report suspect', 11, 'change_reportsuspect'),
(43, 'Can delete report suspect', 11, 'delete_reportsuspect'),
(44, 'Can view report suspect', 11, 'view_reportsuspect'),
(45, 'Can add permission', 12, 'add_permission'),
(46, 'Can change permission', 12, 'change_permission'),
(47, 'Can delete permission', 12, 'delete_permission'),
(48, 'Can view permission', 12, 'view_permission'),
(49, 'Can add role', 13, 'add_role'),
(50, 'Can change role', 13, 'change_role'),
(51, 'Can delete role', 13, 'delete_role'),
(52, 'Can view role', 13, 'view_role'),
(53, 'Can add user', 14, 'add_user'),
(54, 'Can change user', 14, 'change_user'),
(55, 'Can delete user', 14, 'delete_user'),
(56, 'Can view user', 14, 'view_user'),
(57, 'Can add role permission', 15, 'add_rolepermission'),
(58, 'Can change role permission', 15, 'change_rolepermission'),
(59, 'Can delete role permission', 15, 'delete_rolepermission'),
(60, 'Can view role permission', 15, 'view_rolepermission'),
(61, 'Can add case arrest', 16, 'add_casearrest'),
(62, 'Can change case arrest', 16, 'change_casearrest'),
(63, 'Can delete case arrest', 16, 'delete_casearrest'),
(64, 'Can view case arrest', 16, 'view_casearrest'),
(65, 'Can add arrest', 17, 'add_arrest'),
(66, 'Can change arrest', 17, 'change_arrest'),
(67, 'Can delete arrest', 17, 'delete_arrest'),
(68, 'Can view arrest', 17, 'view_arrest'),
(69, 'Can add case', 18, 'add_case'),
(70, 'Can change case', 18, 'change_case'),
(71, 'Can delete case', 18, 'delete_case'),
(72, 'Can view case', 18, 'view_case'),
(73, 'Can add indictment', 19, 'add_indictment'),
(74, 'Can change indictment', 19, 'change_indictment'),
(75, 'Can delete indictment', 19, 'delete_indictment'),
(76, 'Can view indictment', 19, 'view_indictment'),
(77, 'Can add inmate', 20, 'add_inmate'),
(78, 'Can change inmate', 20, 'change_inmate'),
(79, 'Can delete inmate', 20, 'delete_inmate'),
(80, 'Can view inmate', 20, 'view_inmate'),
(81, 'Can add prosecution', 21, 'add_prosecution'),
(82, 'Can change prosecution', 21, 'change_prosecution'),
(83, 'Can delete prosecution', 21, 'delete_prosecution'),
(84, 'Can view prosecution', 21, 'view_prosecution'),
(85, 'Can add prosecution suspect', 22, 'add_prosecutionsuspect'),
(86, 'Can change prosecution suspect', 22, 'change_prosecutionsuspect'),
(87, 'Can delete prosecution suspect', 22, 'delete_prosecutionsuspect'),
(88, 'Can view prosecution suspect', 22, 'view_prosecutionsuspect'),
(89, 'Can add sentence', 23, 'add_sentence'),
(90, 'Can change sentence', 23, 'change_sentence'),
(91, 'Can delete sentence', 23, 'delete_sentence'),
(92, 'Can view sentence', 23, 'view_sentence'),
(93, 'Can add timeline', 24, 'add_timeline'),
(94, 'Can change timeline', 24, 'change_timeline'),
(95, 'Can delete timeline', 24, 'delete_timeline'),
(96, 'Can view timeline', 24, 'view_timeline'),
(97, 'Can add user case', 25, 'add_usercase'),
(98, 'Can change user case', 25, 'change_usercase'),
(99, 'Can delete user case', 25, 'delete_usercase'),
(100, 'Can view user case', 25, 'view_usercase'),
(101, 'Can add case result', 26, 'add_caseresult'),
(102, 'Can change case result', 26, 'change_caseresult'),
(103, 'Can delete case result', 26, 'delete_caseresult'),
(104, 'Can view case result', 26, 'view_caseresult'),
(105, 'Can add event', 27, 'add_event'),
(106, 'Can change event', 27, 'change_event'),
(107, 'Can delete event', 27, 'delete_event'),
(108, 'Can view event', 27, 'view_event'),
(109, 'Can add record info', 28, 'add_recordinfo'),
(110, 'Can change record info', 28, 'change_recordinfo'),
(111, 'Can delete record info', 28, 'delete_recordinfo'),
(112, 'Can view record info', 28, 'view_recordinfo'),
(113, 'Can add suspect evidence', 29, 'add_suspectevidence'),
(114, 'Can change suspect evidence', 29, 'change_suspectevidence'),
(115, 'Can delete suspect evidence', 29, 'delete_suspectevidence'),
(116, 'Can view suspect evidence', 29, 'view_suspectevidence'),
(117, 'Can add case evidence', 30, 'add_caseevidence'),
(118, 'Can change case evidence', 30, 'change_caseevidence'),
(119, 'Can delete case evidence', 30, 'delete_caseevidence'),
(120, 'Can view case evidence', 30, 'view_caseevidence'),
(121, 'Can add evidence', 31, 'add_evidence'),
(122, 'Can change evidence', 31, 'change_evidence'),
(123, 'Can delete evidence', 31, 'delete_evidence'),
(124, 'Can view evidence', 31, 'view_evidence'),
(125, 'Can add financial invest', 32, 'add_financialinvest'),
(126, 'Can change financial invest', 32, 'change_financialinvest'),
(127, 'Can delete financial invest', 32, 'delete_financialinvest'),
(128, 'Can view financial invest', 32, 'view_financialinvest'),
(129, 'Can add investigation plan', 33, 'add_investigationplan'),
(130, 'Can change investigation plan', 33, 'change_investigationplan'),
(131, 'Can delete investigation plan', 33, 'delete_investigationplan'),
(132, 'Can view investigation plan', 33, 'view_investigationplan'),
(133, 'Can add interview', 34, 'add_interview'),
(134, 'Can change interview', 34, 'change_interview'),
(135, 'Can delete interview', 34, 'delete_interview'),
(136, 'Can view interview', 34, 'view_interview'),
(137, 'Can add forensic invest result', 35, 'add_forensicinvestresult'),
(138, 'Can change forensic invest result', 35, 'change_forensicinvestresult'),
(139, 'Can delete forensic invest result', 35, 'delete_forensicinvestresult'),
(140, 'Can view forensic invest result', 35, 'view_forensicinvestresult'),
(141, 'Can add digital invest result', 36, 'add_digitalinvestresult'),
(142, 'Can change digital invest result', 36, 'change_digitalinvestresult'),
(143, 'Can delete digital invest result', 36, 'delete_digitalinvestresult'),
(144, 'Can view digital invest result', 36, 'view_digitalinvestresult'),
(145, 'Can add physical invest result', 37, 'add_physicalinvestresult'),
(146, 'Can change physical invest result', 37, 'change_physicalinvestresult'),
(147, 'Can delete physical invest result', 37, 'delete_physicalinvestresult'),
(148, 'Can view physical invest result', 37, 'view_physicalinvestresult'),
(149, 'Can add question', 38, 'add_question'),
(150, 'Can change question', 38, 'change_question'),
(151, 'Can delete question', 38, 'delete_question'),
(152, 'Can view question', 38, 'view_question'),
(153, 'Can add victim', 39, 'add_victim'),
(154, 'Can change victim', 39, 'change_victim'),
(155, 'Can delete victim', 39, 'delete_victim'),
(156, 'Can view victim', 39, 'view_victim'),
(157, 'Can add witness', 40, 'add_witness'),
(158, 'Can change witness', 40, 'change_witness'),
(159, 'Can delete witness', 40, 'delete_witness'),
(160, 'Can view witness', 40, 'view_witness'),
(161, 'Can add victim interview', 41, 'add_victiminterview'),
(162, 'Can change victim interview', 41, 'change_victiminterview'),
(163, 'Can delete victim interview', 41, 'delete_victiminterview'),
(164, 'Can view victim interview', 41, 'view_victiminterview'),
(165, 'Can add witness interview', 42, 'add_witnessinterview'),
(166, 'Can change witness interview', 42, 'change_witnessinterview'),
(167, 'Can delete witness interview', 42, 'delete_witnessinterview'),
(168, 'Can view witness interview', 42, 'view_witnessinterview'),
(169, 'Can add measure survey', 43, 'add_measuresurvey'),
(170, 'Can change measure survey', 43, 'change_measuresurvey'),
(171, 'Can delete measure survey', 43, 'delete_measuresurvey'),
(172, 'Can view measure survey', 43, 'view_measuresurvey'),
(173, 'Can add warrant', 44, 'add_warrant'),
(174, 'Can change warrant', 44, 'change_warrant'),
(175, 'Can delete warrant', 44, 'delete_warrant'),
(176, 'Can view warrant', 44, 'view_warrant'),
(177, 'Can add warrant result', 45, 'add_warrantresult'),
(178, 'Can change warrant result', 45, 'change_warrantresult'),
(179, 'Can delete warrant result', 45, 'delete_warrantresult'),
(180, 'Can view warrant result', 45, 'view_warrantresult'),
(181, 'Can add warrant evidence', 46, 'add_warrantevidence'),
(182, 'Can change warrant evidence', 46, 'change_warrantevidence'),
(183, 'Can delete warrant evidence', 46, 'delete_warrantevidence'),
(184, 'Can view warrant evidence', 46, 'view_warrantevidence'),
(185, 'Can add holiday', 47, 'add_holiday'),
(186, 'Can change holiday', 47, 'change_holiday'),
(187, 'Can delete holiday', 47, 'delete_holiday'),
(188, 'Can view holiday', 47, 'view_holiday'),
(189, 'Can add holiday type', 48, 'add_holidaytype'),
(190, 'Can change holiday type', 48, 'change_holidaytype'),
(191, 'Can delete holiday type', 48, 'delete_holidaytype'),
(192, 'Can view holiday type', 48, 'view_holidaytype'),
(193, 'Can add holiday observance', 49, 'add_holidayobservance'),
(194, 'Can change holiday observance', 49, 'change_holidayobservance'),
(195, 'Can delete holiday observance', 49, 'delete_holidayobservance'),
(196, 'Can view holiday observance', 49, 'view_holidayobservance'),
(197, 'Can add state holiday', 50, 'add_stateholiday'),
(198, 'Can change state holiday', 50, 'change_stateholiday'),
(199, 'Can delete state holiday', 50, 'delete_stateholiday'),
(200, 'Can view state holiday', 50, 'view_stateholiday'),
(201, 'Can add scene response', 51, 'add_sceneresponse'),
(202, 'Can change scene response', 51, 'change_sceneresponse'),
(203, 'Can delete scene response', 51, 'delete_sceneresponse'),
(204, 'Can view scene response', 51, 'view_sceneresponse'),
(205, 'Can add scene preservation', 52, 'add_scenepreservation'),
(206, 'Can change scene preservation', 52, 'change_scenepreservation'),
(207, 'Can delete scene preservation', 52, 'delete_scenepreservation'),
(208, 'Can view scene preservation', 52, 'view_scenepreservation'),
(209, 'Can add scene description', 53, 'add_scenedescription'),
(210, 'Can change scene description', 53, 'change_scenedescription'),
(211, 'Can delete scene description', 53, 'delete_scenedescription'),
(212, 'Can view scene description', 53, 'view_scenedescription'),
(213, 'Can add medical support', 54, 'add_medicalsupport'),
(214, 'Can change medical support', 54, 'change_medicalsupport'),
(215, 'Can delete medical support', 54, 'delete_medicalsupport'),
(216, 'Can view medical support', 54, 'view_medicalsupport'),
(217, 'Can add scene statement', 55, 'add_scenestatement'),
(218, 'Can change scene statement', 55, 'change_scenestatement'),
(219, 'Can delete scene statement', 55, 'delete_scenestatement'),
(220, 'Can view scene statement', 55, 'view_scenestatement');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$L4CjcWYObN9mroaj1T8dhu$geCLl4GJR3rcaCx9PfOMDo9d2rF0YdSyg7IAt1jKO00=', '2025-07-14 09:01:20.643605', 1, 'maiviet283', '', '', 'maiviet28@gmail.com', 1, 1, '2025-07-11 02:05:11.850084');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cases`
--

CREATE TABLE `cases` (
  `case_id` int(11) NOT NULL,
  `case_number` varchar(100) DEFAULT NULL,
  `type_case` varchar(100) DEFAULT NULL,
  `severity` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `case_target` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cases`
--

INSERT INTO `cases` (`case_id`, `case_number`, `type_case`, `severity`, `status`, `summary`, `create_at`, `case_target`, `is_deleted`) VALUES
(1, 'CR2025-0001-THE', 'Theft', 'Moderate', 'Under Investigation', 'Shoplifting at supermarket, goods stolen.', '2025-05-01 11:00:00.000000', 'Identify suspect and recover stolen goods', 0),
(2, 'CR2025-0002-ASS', 'Assault', 'Low', 'Under Investigation', 'Bar fight, minor injury.', '2025-05-02 02:00:00.000000', 'Identify attacker and victim support', 0),
(3, 'CR2025-0003-MIS', 'Missing Person', 'High', 'Closed', 'Teenager disappearance, search ongoing.', '2025-05-03 16:30:00.000000', 'Locate missing person', 0),
(4, 'CR2025-0004-BUR', 'Burglary', 'High', 'Under Investigation', 'Residential break-in, electronics stolen.', '2025-05-04 10:00:00.000000', 'Recover items and arrest burglar', 0),
(5, 'CR2025-0005-DRG', 'Drug Offense', 'Moderate', 'Closed', 'Drug dealing in alley, suspect identified.', '2025-05-05 22:30:00.000000', 'Prepare evidence for court', 0),
(6, 'CR2025-0006-TRA', 'Traffic Accident', 'Low', 'OPEN', 'Minor car collision, resolved.', '2025-05-06 14:30:00.000000', 'Complete accident report', 0),
(7, 'CR2025-0007-FRA', 'Fraud', 'High', 'Under Investigation', 'Elderly scam, significant financial loss.', '2025-05-07 11:30:00.000000', 'Identify fraudster and recover funds', 0),
(8, 'CR2025-0008-VAN', 'Vandalism', 'Low', 'OPEN', 'Graffiti removed, no suspect.', '2025-05-08 08:00:00.000000', 'Close case due to no suspect', 0),
(9, 'CR2025-0009-ROB', 'Armed Robbery', 'Critical', 'Under Investigation', 'Bank robbery, high priority.', '2025-05-09 10:30:00.000000', 'Identify robbers and recover money', 0),
(10, 'CR2025-0010-CYB', 'Cybercrime', 'High', 'Under Investigation', 'Company data breach, forensic analysis needed.', '2025-05-10 14:15:00.000000', 'Trace breach source', 0),
(11, 'CR2025-0011-HOM', 'Homicide', 'Critical', 'Under Investigation', 'Stabbing death, active investigation.', '2025-05-11 03:30:00.000000', 'Identify killer and gather evidence', 0),
(12, 'CR2025-0012-KID', 'Kidnapping', 'Critical', 'Under Investigation', 'Child abduction, urgent search.', '2025-05-12 17:30:00.000000', 'Locate victim and arrest kidnapper', 0),
(13, 'CR2025-0013-ARS', 'Arson', 'High', 'Under Investigation', 'Intentional warehouse fire, evidence collection.', '2025-05-13 21:00:00.000000', 'Determine cause and suspect', 0),
(14, 'CR2025-0014-COU', 'Counterfeiting', 'Moderate', 'Awaiting Prosecution', 'Fake currency discovered, suspect apprehended.', '2025-05-14 11:30:00.000000', 'Prepare evidence for trial', 0),
(15, 'CR2025-0015-DOM', 'Domestic Violence', 'Moderate', 'OPEN', 'Ongoing domestic issues, victim support needed.', '2025-05-15 09:30:00.000000', 'Protect victim and arrest suspect', 0),
(16, 'CR2025-0016-TRAF', 'Human Trafficking', 'Critical', 'Under Investigation', 'Complex trafficking operation uncovered.', '2025-05-16 16:30:00.000000', 'Identify network and rescue victims', 0),
(17, 'CR2025-0017-SMG', 'Smuggling', 'High', 'Under Investigation', 'Contraband found at port, large scale.', '2025-05-17 10:45:00.000000', 'Trace source and destination', 0),
(18, 'CR2025-0018-EXT', 'Extortion', 'Moderate', 'Closed', 'Business threats, ongoing surveillance.', '2025-05-18 15:00:00.000000', 'Catch suspect in act', 0),
(19, 'CR2025-0019-PBD', 'Public Disturbance', 'Moderate', 'Closed', 'Protest dispersed, minor property damage.', '2025-05-19 18:30:00.000000', 'File report and close case', 0),
(20, 'CR2025-0020-ANI', 'Animal Cruelty', 'Low', 'OPEN', 'Animal rescue, suspect being identified.', '2025-05-20 09:30:00.000000', 'Protect animal and arrest suspect', 0),
(21, 'CR2025-0021-MOT', 'Motorbike Theft', 'Moderate', 'Under Investigation', 'Motorbike stolen from apartment parking.', '2025-05-21 07:30:00.000000', 'Locate motorbike and suspect', 0),
(22, 'CR2025-0022-STF', 'Street Fight', 'Low', 'Closed', 'Altercation outside a nightclub.', '2025-05-22 03:30:00.000000', 'Identify participants', 0),
(23, '1a475602', 'Assault', 'Low', 'Closed', '', '2025-07-09 18:15:47.000000', 'Investigation', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `case_arrests`
--

CREATE TABLE `case_arrests` (
  `id` bigint(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `arrest_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `case_arrests`
--

INSERT INTO `case_arrests` (`id`, `is_deleted`, `arrest_id`, `case_id`) VALUES
(1, 0, 40, 1),
(2, 0, 41, 5),
(3, 0, 42, 14),
(4, 0, 43, 19),
(5, 0, 44, 2),
(6, 0, 45, 4),
(7, 0, 46, 7),
(8, 0, 47, 9),
(9, 0, 48, 10),
(10, 0, 49, 11),
(11, 0, 50, 12),
(12, 0, 51, 13),
(13, 0, 52, 16),
(14, 0, 53, 17),
(15, 0, 54, 18),
(16, 0, 55, 20),
(17, 0, 56, 1),
(18, 0, 57, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `case_evidences`
--

CREATE TABLE `case_evidences` (
  `id` bigint(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_id` int(11) NOT NULL,
  `evidence_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `case_evidences`
--

INSERT INTO `case_evidences` (`id`, `is_deleted`, `case_id`, `evidence_id`) VALUES
(24, 0, 1, 1),
(25, 0, 1, 2),
(26, 0, 2, 3),
(27, 0, 3, 4),
(28, 0, 4, 5),
(29, 0, 4, 6),
(30, 0, 5, 7),
(31, 0, 6, 8),
(32, 0, 7, 9),
(33, 0, 9, 10),
(34, 0, 9, 11),
(35, 0, 10, 12),
(36, 0, 11, 13),
(37, 0, 12, 14),
(38, 0, 13, 15),
(39, 0, 14, 16),
(40, 0, 16, 17),
(41, 0, 17, 18),
(42, 0, 18, 19),
(43, 0, 19, 20),
(44, 0, 20, 21),
(45, 0, 21, 22),
(46, 0, 22, 23);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `case_results`
--

CREATE TABLE `case_results` (
  `case_result_id` int(11) NOT NULL,
  `report_time` datetime(6) DEFAULT NULL,
  `report_analyst` varchar(100) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `identify_motive` longtext DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `case_results`
--

INSERT INTO `case_results` (`case_result_id`, `report_time`, `report_analyst`, `summary`, `identify_motive`, `status`, `is_deleted`, `case_id`) VALUES
(1, '2025-06-30 10:00:00.000000', 'Prosecutor Chris White', 'Shoplifting case, suspect apprehended, goods recovered.', 'Financial gain', 'Resolved', 0, 1),
(2, '2025-06-15 11:00:00.000000', 'Prosecutor Olivia Taylor', 'Assault case, insufficient evidence, charges dismissed.', 'Personal dispute', 'Closed', 0, 2),
(3, '2025-07-05 14:00:00.000000', 'Investigator Mike Brown', 'Missing person located safely.', 'Voluntary disappearance', 'Closed', 0, 3),
(4, '2025-07-10 15:00:00.000000', 'Detective Lisa Wong', 'Burglary case, suspect identified, items not fully recovered.', 'Financial gain', 'Unresolved', 0, 4),
(5, '2025-06-18 16:00:00.000000', 'Prosecutor Chris White', 'Drug offense, suspect convicted.', 'Drug distribution', 'Resolved', 0, 5),
(6, '2025-06-10 10:00:00.000000', 'Patrol Officer Jane Doe', 'Traffic accident, minor damage, insurance settled.', 'Driver error', 'Closed', 0, 6),
(7, '2025-07-20 09:00:00.000000', 'Detective Lisa Wong', 'Fraud case, primary scammer still at large, partial recovery.', 'Financial gain', 'Ongoing', 0, 7),
(8, '2025-06-12 10:00:00.000000', 'Patrol Officer Susan Miller', 'Vandalism case, no suspect identified.', 'Recklessness', 'Closed', 0, 8),
(9, '2025-07-25 11:00:00.000000', 'Detective Lisa Wong', 'Armed robbery, suspect identified, manhunt ongoing.', 'Financial gain', 'Ongoing', 0, 9),
(10, '2025-08-01 12:00:00.000000', 'Cybercrime Specialist Anna Chen', 'Cyber attack, vulnerabilities patched, origin traced to foreign entity.', 'Espionage', 'Resolved', 0, 10),
(11, '2025-08-08 13:00:00.000000', 'Detective Lisa Wong', 'Homicide case, suspect apprehended, awaiting trial.', 'Revenge', 'Resolved', 0, 11),
(12, '2025-08-15 14:00:00.000000', 'Detective Lisa Wong', 'Kidnapping case, child rescued, kidnapper apprehended.', 'Ransom', 'Resolved', 0, 12),
(13, '2025-07-30 15:00:00.000000', 'Investigator Mike Brown', 'Arson case, suspect identified, active investigation.', 'Vandalism', 'Ongoing', 0, 13),
(14, '2025-06-25 16:00:00.000000', 'Prosecutor Chris White', 'Counterfeiting case, suspect convicted.', 'Financial gain', 'Resolved', 0, 14),
(15, '2025-07-01 17:00:00.000000', 'Patrol Officer Nancy Clark', 'Domestic violence case, victim received protection order.', 'Personal conflict', 'Resolved', 0, 15),
(16, '2025-08-25 10:00:00.000000', 'Detective Lisa Wong', 'Human trafficking ring dismantled, victims rescued.', 'Profit', 'Resolved', 0, 16),
(17, '2025-08-05 11:00:00.000000', 'Investigator Mike Brown', 'Smuggling case, large quantity of contraband seized, investigation ongoing.', 'Profit', 'Ongoing', 0, 17),
(18, '2025-08-12 12:00:00.000000', 'Detective Lisa Wong', 'Extortion case, suspect apprehended.', 'Financial gain', 'Resolved', 0, 18),
(19, '2025-06-28 13:00:00.000000', 'Patrol Officer Steve Baker', 'Public disturbance case, individuals charged with minor offenses.', 'Protest related', 'Closed', 0, 19),
(20, '2025-07-02 14:00:00.000000', 'Patrol Officer Jane Doe', 'Animal cruelty case, animal recovered, suspect charged.', 'Neglect', 'Resolved', 0, 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `digital_invest_results`
--

CREATE TABLE `digital_invest_results` (
  `result_id` int(11) NOT NULL,
  `device_type` varchar(100) DEFAULT NULL,
  `analyst_tool` varchar(100) DEFAULT NULL,
  `result` longtext DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `evidence_id` int(11) DEFAULT NULL,
  `investigation_plan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `digital_invest_results`
--

INSERT INTO `digital_invest_results` (`result_id`, `device_type`, `analyst_tool`, `result`, `created_at`, `is_deleted`, `evidence_id`, `investigation_plan_id`) VALUES
(1, 'CCTV System', 'Video Forensics Software', 'Suspect identified in footage.', '2025-05-01 15:00:00.000000', 0, 1, 1),
(2, 'CCTV System', 'Facial Recognition', 'Suspect A identified.', '2025-05-01 16:00:00.000000', 0, 1, 1),
(3, 'Mobile Phone', 'Cellebrite', 'Call logs and messages analyzed.', '2025-05-03 10:00:00.000000', 0, 4, 2),
(4, 'Mobile Phone', 'Data Recovery Tool', 'Deleted messages recovered.', '2025-05-03 11:00:00.000000', 0, 4, 2),
(5, 'Dashcam', 'Video Playback Software', 'Collision sequence confirmed.', '2025-05-06 16:00:00.000000', 0, 8, 3),
(6, 'Dashcam', 'Speed Analysis', 'Vehicle speeds determined.', '2025-05-06 17:00:00.000000', 0, 8, 3),
(7, 'Email Server', 'Email Forensics Tool', 'Scam emails traced to foreign IP.', '2025-05-07 14:00:00.000000', 0, 9, 4),
(8, 'Email Server', 'Header Analyzer', 'Originating email server identified.', '2025-05-07 15:00:00.000000', 0, 9, 4),
(9, 'Bank CCTV System', 'Video Enhancement', 'Robber\'s face partially obscured.', '2025-05-09 13:00:00.000000', 0, 10, 5),
(10, 'Bank CCTV System', 'Object Tracking', 'Movement of robbers tracked.', '2025-05-09 14:00:00.000000', 0, 10, 5),
(11, 'Company Server', 'Network Forensics', 'Malware identified, data exfiltration confirmed.', '2025-05-10 17:00:00.000000', 0, 12, 6),
(12, 'Company Server', 'Malware Signature DB', 'Specific malware variant identified.', '2025-05-10 18:00:00.000000', 0, 12, 6),
(13, 'Mobile Phone', 'Mobile Forensics Kit', 'Communication data linked to trafficking ring.', '2025-05-16 19:00:00.000000', 0, 17, 7),
(14, 'Mobile Phone', 'GPS Tracker', 'Suspects\' movements mapped.', '2025-05-16 20:00:00.000000', 0, 17, 7),
(15, 'Messaging App', 'Chat Analyzer', 'Threatening messages retrieved.', '2025-05-18 17:00:00.000000', 0, 19, 8),
(16, 'Messaging App', 'Sender ID Trace', 'Extortionist\'s phone number obtained.', '2025-05-18 18:00:00.000000', 0, 19, 8),
(17, 'Digital Camera', 'Image Authenticator', 'Photos of property damage authenticated.', '2025-05-19 20:00:00.000000', 0, 20, 9),
(18, 'Digital Camera', 'EXIF Data Reader', 'Timestamp and camera model verified.', '2025-05-19 21:00:00.000000', 0, 20, 9),
(19, 'CCTV System', 'Video Forensics Software', 'Motorbike theft confirmed, suspect direction of travel.', '2025-05-21 09:00:00.000000', 0, 22, 10),
(20, 'Mobile Phone', 'Video Playback Software', 'Street fight clearly visible.', '2025-05-22 05:00:00.000000', 0, 23, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-07-11 07:15:56.342790', '23', 'Report #23 - 32 huynh ngoc du', 3, '', 7, 1),
(2, '2025-07-11 07:15:56.342830', '24', 'Report #24 - 32 huynh ngoc du', 3, '', 7, 1),
(3, '2025-07-11 07:15:56.342847', '25', 'Report #25 - 32 huynh ngoc du', 3, '', 7, 1),
(4, '2025-07-11 07:15:56.342860', '26', 'Report #26 - 32 huynh ngoc du', 3, '', 7, 1),
(5, '2025-07-11 07:15:56.342873', '27', 'Report #27 - 32 huynh ngoc du', 3, '', 7, 1),
(6, '2025-07-11 07:15:56.342885', '28', 'Report #28 - 32 huynh ngoc dudd', 3, '', 7, 1),
(7, '2025-07-11 07:15:56.342896', '29', 'Report #29 - 32 huynh ngoc dudd', 3, '', 7, 1),
(8, '2025-07-11 07:15:56.342907', '30', 'Report #30 - fff', 3, '', 7, 1),
(9, '2025-07-11 07:15:56.342919', '31', 'Report #31 - 32 huynh ngoc dudd', 3, '', 7, 1),
(10, '2025-07-11 07:15:56.342930', '32', 'Report #32 - vvv', 3, '', 7, 1),
(11, '2025-07-11 07:15:56.342941', '33', 'Report #33 - bb', 3, '', 7, 1),
(12, '2025-07-11 07:15:56.342953', '34', 'Report #34 - 32 huynh ngoc du', 3, '', 7, 1),
(13, '2025-07-11 07:15:56.342964', '35', 'Report #35 - 32 huynh ngoc dudd', 3, '', 7, 1),
(14, '2025-07-11 07:15:56.342975', '36', 'Report #36 - 32 huynh ngoc dudd', 3, '', 7, 1),
(15, '2025-07-11 07:15:56.342986', '37', 'Report #37 - fff', 3, '', 7, 1),
(16, '2025-07-11 07:15:56.342998', '38', 'Report #38 - 32 huynh ngoc dudd', 3, '', 7, 1),
(17, '2025-07-11 07:15:56.343018', '39', 'Report #39 - 32 huynh ngoc du', 3, '', 7, 1),
(18, '2025-07-11 07:15:56.343030', '40', 'Report #40 - No location', 3, '', 7, 1),
(19, '2025-07-11 07:15:56.343043', '41', 'Report #41 - No location', 3, '', 7, 1),
(20, '2025-07-11 07:15:56.343054', '42', 'Report #42 - No location', 3, '', 7, 1),
(21, '2025-07-11 07:15:56.343064', '43', 'Report #43 - No location', 3, '', 7, 1),
(22, '2025-07-11 07:15:56.343075', '44', 'Report #44 - hh', 3, '', 7, 1),
(23, '2025-07-11 07:15:56.343086', '45', 'Report #45 - 32 huynh ngoc dudd', 3, '', 7, 1),
(24, '2025-07-11 07:15:56.343097', '46', 'Report #46 - No location', 3, '', 7, 1),
(25, '2025-07-11 07:15:56.343108', '47', 'Report #47 - 32 huynh ngoc dudd', 3, '', 7, 1),
(26, '2025-07-11 07:15:56.343119', '48', 'Report #48 - 32 huynh ngoc dudd', 3, '', 7, 1),
(27, '2025-07-11 07:15:56.343131', '49', 'Report #49 - No location', 3, '', 7, 1),
(28, '2025-07-11 07:15:56.343141', '50', 'Report #50 - No location', 3, '', 7, 1),
(29, '2025-07-11 07:15:56.343151', '51', 'Report #51 - No location', 3, '', 7, 1),
(30, '2025-07-11 07:15:56.343162', '52', 'Report #52 - No location', 3, '', 7, 1),
(31, '2025-07-11 07:15:56.343173', '53', 'Report #53 - fff', 3, '', 7, 1),
(32, '2025-07-11 07:15:56.343184', '54', 'Report #54 - vv', 3, '', 7, 1),
(33, '2025-07-11 07:15:56.343195', '55', 'Report #55 - 32 huynh ngoc dudd', 3, '', 7, 1),
(34, '2025-07-11 07:15:56.343206', '56', 'Report #56 - ff', 3, '', 7, 1),
(35, '2025-07-11 07:15:56.343216', '57', 'Report #57 - No location', 3, '', 7, 1),
(36, '2025-07-11 07:15:56.343226', '58', 'Report #58 - 32 huynh ngoc du', 3, '', 7, 1),
(37, '2025-07-11 07:15:56.343237', '59', 'Report #59 - No location', 3, '', 7, 1),
(38, '2025-07-11 07:15:56.343248', '60', 'Report #60 - No location', 3, '', 7, 1),
(39, '2025-07-11 07:15:56.343258', '61', 'Report #61 - No location', 3, '', 7, 1),
(40, '2025-07-11 07:15:56.343269', '62', 'Report #62 - 32 huynh ngoc du', 3, '', 7, 1),
(41, '2025-07-11 07:15:56.343280', '63', 'Report #63 - No location', 3, '', 7, 1),
(42, '2025-07-11 07:15:56.343290', '64', 'Report #64 - No location', 3, '', 7, 1),
(43, '2025-07-11 07:15:56.343301', '65', 'Report #65 - No location', 3, '', 7, 1),
(44, '2025-07-11 08:05:26.311861', '23', 'Case #23 - 1a475602', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(45, '2025-07-11 08:05:32.046232', '6', 'Case #6 - CR2025-0006-TRA', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(46, '2025-07-11 08:05:44.281865', '23', 'Case #23 - 1a475602', 2, '[{\"changed\": {\"fields\": [\"Type case\"]}}]', 18, 1),
(47, '2025-07-11 08:05:50.331580', '23', 'Case #23 - 1a475602', 2, '[{\"changed\": {\"fields\": [\"Severity\"]}}]', 18, 1),
(48, '2025-07-11 08:29:44.835846', '21', 'InvestigationPlan #21', 2, '[{\"changed\": {\"fields\": [\"Is deleted\"]}}]', 33, 1),
(49, '2025-07-14 13:09:21.827779', '23', 'Case #23 - 1a475602', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(50, '2025-07-14 13:09:25.928223', '22', 'Case #22 - CR2025-0022-STF', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(51, '2025-07-14 13:09:30.679300', '18', 'Case #18 - CR2025-0018-EXT', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(52, '2025-07-14 13:12:32.898194', '20', 'Report #20 - Binh Tan District, House S', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 7, 1),
(53, '2025-07-14 13:12:38.627076', '20', 'Report #20 - Binh Tan District, House S', 2, '[{\"changed\": {\"fields\": [\"Severity\"]}}]', 7, 1),
(54, '2025-07-14 13:12:43.804100', '15', 'Report #15 - Phu Nhuan District, House N', 2, '[{\"changed\": {\"fields\": [\"Severity\", \"Status\"]}}]', 7, 1),
(55, '2025-07-14 13:12:49.470107', '8', 'Report #8 - Go Vap District, Public Wall G', 2, '[{\"changed\": {\"fields\": [\"Severity\", \"Status\"]}}]', 7, 1),
(56, '2025-07-14 13:12:56.636880', '6', 'Report #6 - District 5, Intersection E', 2, '[{\"changed\": {\"fields\": [\"Severity\", \"Status\"]}}]', 7, 1),
(57, '2025-07-14 13:13:14.984985', '4', 'Case #4 - CR2025-0004-BUR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(58, '2025-07-14 13:13:50.223309', '15', 'Case #15 - CR2025-0015-DOM', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(59, '2025-07-14 13:14:03.334648', '1', 'Case #1 - CR2025-0001-THE', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(60, '2025-07-14 13:14:17.934589', '3', 'Case #3 - CR2025-0003-MIS', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(61, '2025-07-14 13:14:47.078810', '6', 'Case #6 - CR2025-0006-TRA', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(62, '2025-07-14 13:15:09.396099', '20', 'Case #20 - CR2025-0020-ANI', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(63, '2025-07-14 13:15:17.254632', '2', 'Case #2 - CR2025-0002-ASS', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(64, '2025-07-16 06:33:44.692156', '21', 'InvestigationPlan #21', 2, '[{\"changed\": {\"fields\": [\"Is deleted\"]}}]', 33, 1),
(65, '2025-07-16 08:32:49.310709', '25', 'InvestigationPlan #25', 2, '[{\"changed\": {\"fields\": [\"Is deleted\"]}}]', 33, 1),
(66, '2025-07-16 08:40:58.640767', '1', 'Case #1 - CR2025-0001-THE', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(67, '2025-07-16 08:41:09.606142', '2', 'Case #2 - CR2025-0002-ASS', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(68, '2025-07-16 08:41:12.768837', '3', 'Case #3 - CR2025-0003-MIS', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(69, '2025-07-16 08:41:20.695261', '8', 'Case #8 - CR2025-0008-VAN', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(70, '2025-07-16 08:41:43.774665', '4', 'Case #4 - CR2025-0004-BUR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(71, '2025-07-16 08:42:01.903050', '5', 'Case #5 - CR2025-0005-DRG', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(72, '2025-07-16 08:42:50.590410', '1', 'Case #1 - CR2025-0001-THE', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(73, '2025-07-16 08:43:04.413869', '2', 'Case #2 - CR2025-0002-ASS', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(74, '2025-07-16 08:43:18.871305', '4', 'Case #4 - CR2025-0004-BUR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(12, 'accounts', 'permission'),
(13, 'accounts', 'role'),
(15, 'accounts', 'rolepermission'),
(14, 'accounts', 'user'),
(1, 'admin', 'logentry'),
(17, 'arrests', 'arrest'),
(16, 'arrests', 'casearrest'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(18, 'cases', 'case'),
(26, 'cases', 'caseresult'),
(27, 'cases', 'event'),
(19, 'cases', 'indictment'),
(20, 'cases', 'inmate'),
(21, 'cases', 'prosecution'),
(22, 'cases', 'prosecutionsuspect'),
(23, 'cases', 'sentence'),
(24, 'cases', 'timeline'),
(25, 'cases', 'usercase'),
(5, 'contenttypes', 'contenttype'),
(30, 'evidence', 'caseevidence'),
(31, 'evidence', 'evidence'),
(28, 'evidence', 'recordinfo'),
(29, 'evidence', 'suspectevidence'),
(36, 'investigations', 'digitalinvestresult'),
(32, 'investigations', 'financialinvest'),
(35, 'investigations', 'forensicinvestresult'),
(34, 'investigations', 'interview'),
(33, 'investigations', 'investigationplan'),
(37, 'investigations', 'physicalinvestresult'),
(38, 'investigations', 'question'),
(39, 'investigations', 'victim'),
(41, 'investigations', 'victiminterview'),
(40, 'investigations', 'witness'),
(42, 'investigations', 'witnessinterview'),
(47, 'moderation', 'holiday'),
(49, 'moderation', 'holidayobservance'),
(48, 'moderation', 'holidaytype'),
(50, 'moderation', 'stateholiday'),
(7, 'reports', 'report'),
(11, 'reports', 'reportsuspect'),
(9, 'reports', 'reportvictim'),
(10, 'reports', 'reportwitness'),
(8, 'reports', 'suspect'),
(54, 'scene', 'medicalsupport'),
(53, 'scene', 'scenedescription'),
(52, 'scene', 'scenepreservation'),
(51, 'scene', 'sceneresponse'),
(55, 'scene', 'scenestatement'),
(6, 'sessions', 'session'),
(43, 'warrants', 'measuresurvey'),
(44, 'warrants', 'warrant'),
(46, 'warrants', 'warrantevidence'),
(45, 'warrants', 'warrantresult');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'accounts', '0001_initial', '2025-07-09 16:58:31.380316'),
(2, 'contenttypes', '0001_initial', '2025-07-09 16:58:31.466278'),
(3, 'auth', '0001_initial', '2025-07-09 16:58:32.946500'),
(4, 'admin', '0001_initial', '2025-07-09 16:58:33.270355'),
(5, 'admin', '0002_logentry_remove_auto_add', '2025-07-09 16:58:33.284371'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2025-07-09 16:58:33.300014'),
(7, 'moderation', '0001_initial', '2025-07-09 16:58:33.998007'),
(8, 'cases', '0001_initial', '2025-07-09 16:58:34.851897'),
(9, 'evidence', '0001_initial', '2025-07-09 16:58:35.449060'),
(10, 'investigations', '0001_initial', '2025-07-09 16:58:39.130098'),
(11, 'reports', '0001_initial', '2025-07-09 16:58:40.726313'),
(12, 'arrests', '0001_initial', '2025-07-09 16:58:41.152012'),
(13, 'arrests', '0002_initial', '2025-07-09 16:58:41.631672'),
(14, 'contenttypes', '0002_remove_content_type_name', '2025-07-09 16:58:41.874950'),
(15, 'auth', '0002_alter_permission_name_max_length', '2025-07-09 16:58:42.006602'),
(16, 'auth', '0003_alter_user_email_max_length', '2025-07-09 16:58:42.044053'),
(17, 'auth', '0004_alter_user_username_opts', '2025-07-09 16:58:42.059632'),
(18, 'auth', '0005_alter_user_last_login_null', '2025-07-09 16:58:42.185485'),
(19, 'auth', '0006_require_contenttypes_0002', '2025-07-09 16:58:42.193031'),
(20, 'auth', '0007_alter_validators_add_error_messages', '2025-07-09 16:58:42.208454'),
(21, 'auth', '0008_alter_user_username_max_length', '2025-07-09 16:58:42.342858'),
(22, 'auth', '0009_alter_user_last_name_max_length', '2025-07-09 16:58:42.483127'),
(23, 'auth', '0010_alter_group_name_max_length', '2025-07-09 16:58:42.513910'),
(24, 'auth', '0011_update_proxy_permissions', '2025-07-09 16:58:42.568365'),
(25, 'auth', '0012_alter_user_first_name_max_length', '2025-07-09 16:58:42.712093'),
(26, 'cases', '0002_initial', '2025-07-09 16:58:44.799357'),
(27, 'warrants', '0001_initial', '2025-07-09 16:58:45.748515'),
(28, 'evidence', '0002_initial', '2025-07-09 16:58:47.060827'),
(29, 'scene', '0001_initial', '2025-07-09 16:58:48.033619'),
(30, 'sessions', '0001_initial', '2025-07-09 16:58:48.125514'),
(31, 'reports', '0002_suspect_report_id', '2025-07-09 17:57:22.266695'),
(32, 'investigations', '0002_victim_report_id_witness_report_id', '2025-07-09 17:57:22.709283'),
(33, 'evidence', '0003_evidence_evidence_type', '2025-07-09 19:32:39.025493'),
(34, 'reports', '0003_report_severity_alter_report_status', '2025-07-10 02:28:47.762541'),
(35, 'reports', '0004_alter_report_severity', '2025-07-10 02:28:47.956249'),
(36, 'reports', '0005_alter_report_severity', '2025-07-10 02:28:48.150478'),
(37, 'reports', '0006_alter_report_severity', '2025-07-10 02:28:48.309635');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('680t7lwju57qqhijq9sdcu2sr9givjrf', '.eJxVjDsOwyAQBe9CHSF2_YOU6XMGa1mW4HxAwnYV5e6xJRdJ-2bevNVI65LGdZY6TkGdFajT7-aJH5J3EO6Ub0VzyUudvN4VfdBZX0uQ5-Vw_wKJ5rS9nbf9YN2A0QGx9DBAZx1Ygw5M6wNGjxAQG264xa5rA_QE0YBhAYlui-65TC_ZapwmiboWL3VRny-4nD_j:1ua7YV:ndhxiVTZPnJpUwJF3KVbnJnu6ECRcyxzH-ixmxo7HXI', '2025-07-25 06:48:23.255858'),
('a7vypoada1obdx93ka8z9zslppi09cj6', 'eyJ1c2VybmFtZSI6ImFkbWluLmpvaG4ifQ:1uabnD:Ro-DJgDSBKfmV8rICalR54EjGcTrUghAq7OVt4Z9H80', '2025-07-26 15:05:35.235327'),
('hf3gdiyp2wo2qbpjbk1edz66u3ic9x9u', '.eJxVjMsOwiAQRf-FtSHMlKdL934DgQGkaiAp7cr479qkC93ec859MR-2tfpt5MXPiZ0ZsNPvFgM9cttBuod265x6W5c58l3hBx382lN-Xg7376CGUb-1i1Yb6wwWB4GyBgPKOrACHQgZE5aIkBAnmkiiUjKBDlAECMqQi2PvD7IkNto:1ud0nZ:Uxea8B0e64BccorefIGzUxO8Q_lbmYSj9mTSwVXl14o', '2025-08-02 06:11:53.849280'),
('ijxuad1a5rd4ncmka4e9harzfzl8kkn3', '.eJw9i1EKgCAQRO-y3xF9exlZcKONUlm3jMS7ZyT9zZs3U-BIJB53AgPodvbjGhYPA2S-UZwVikHUdjqZMpgCSSm2w9R2b7QOFVtfO868UfqYLhX8fa0PEfUozQ:1uabaA:spC0ibZSUCJmM3dE0XMjhFQ6diYKoY1CAC3028DerfM', '2025-07-26 14:52:06.249264'),
('jj99cbgh75dbsvn8xvx2bwcntzwp72ih', '.eJxlkE9vgkAQxb_LnrUR-SPhVGqC2CrYNG1Ba8gWBtm4sGRZpNbw3esKXOxlMu_N7_DmXVBDfjFPIg4l4yLq1YlAg6wLqgSUyEIKGt3WKMECS38iR1zxNCdJQqHBHAQ7QoGsHTJO66O7CgK6VB3NXHpxGNp6uolds-GLT3dzIEY9d9TzfPpkiy12lBdfd19ndJs_r_SPYIH2I_Q_zTiuOYdCRF2k3TXClZuMOxJ4lNaUFjgHeRPZV60AVtkdAzkmtAMwezxI9RCz_I4qM1ZAUeffwCWrTFVNN2amaQ4cxYKwosrILYjt-V649t_f0L5t-55SQqEaipIu_AiOh_qk0X9IEmQZWvsHwnKFBQ:1uZsk7:0iipkcG0Xdp1hUNmhYjXCu0oAUyx98MI572fDthW1Ck', '2025-07-24 14:59:23.896152'),
('tqjluf2teqbdknxbo4sj2jcyeas6f7fv', '.eJxVjMsOgjAQRf-la9N0hgKtS_d-A5lOp4KPklAwJsZ_FxIWur3n3PNWHS1z3y1Fpm6I6qhAHX63QHyTvIF4pXwZNY95noagN0XvtOjzGOV-2t2_QE-lX98-uKZ1vsXkgVgaaKF2HpxBD8aGiCkgRMSKK7ZY1zZCQ5AMGBaQ5Nfolsv0kLXGVES_6DnIpD5feLg_gQ:1ua6U4:hZcGmwuWvT4S8DZsoP9x4TxnIsSQo04nFuQBiV6u05g', '2025-07-25 05:39:44.980833'),
('wqjfanq9yq8zwycafloqwna7cxtn9o5w', '.eJxVjMsOwiAQRf-FtSHMlKdL934DgQGkaiAp7cr479qkC93ec859MR-2tfpt5MXPiZ0ZsNPvFgM9cttBuod265x6W5c58l3hBx382lN-Xg7376CGUb-1i1Yb6wwWB4GyBgPKOrACHQgZE5aIkBAnmkiiUjKBDlAECMqQi2PvD7IkNto:1ua5jA:F5OwfG3a_yrEqq_Au525z573v_rAf2evc1s0oKCGY2A', '2025-07-25 04:51:16.086157');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `time_start` datetime(6) DEFAULT NULL,
  `time_end` datetime(6) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `holiday_conflict` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `holiday_id` int(11) DEFAULT NULL,
  `suspect_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `events`
--

INSERT INTO `events` (`event_id`, `time_start`, `time_end`, `event_name`, `description`, `holiday_conflict`, `is_deleted`, `case_id`, `holiday_id`, `suspect_id`) VALUES
(1, '2025-01-01 10:00:00.000000', '2025-01-01 12:00:00.000000', 'Suspect Surveillance', 'Monitoring suspect movements on New Year\'s Day.', 1, 0, 1, 1, 1),
(2, '2025-03-15 14:00:00.000000', '2025-03-15 15:30:00.000000', 'Witness Interview', 'Interviewing key witness at police station.', 0, 0, 2, 2, 2),
(3, '2025-05-30 09:00:00.000000', '2025-05-30 11:00:00.000000', 'Crime Scene Investigation', 'Collecting evidence at scene, limited personnel due to Memorial Day.', 1, 0, 3, 4, 3),
(4, '2025-06-10 16:00:00.000000', '2025-06-10 17:30:00.000000', 'Undercover Operation', 'Meeting with informant to exchange intel.', 0, 0, 4, 6, 4),
(5, '2025-07-04 13:00:00.000000', '2025-07-04 15:00:00.000000', 'Stakeout Operation', 'Observing suspect location during holiday crowd.', 1, 0, 5, 5, 5),
(6, '2025-08-12 09:30:00.000000', '2025-08-12 10:30:00.000000', 'Evidence Review Meeting', 'Internal meeting to review digital evidence.', 0, 0, 6, 14, 6),
(7, '2025-11-27 17:00:00.000000', '2025-11-27 19:00:00.000000', 'Emergency Arrest Operation', 'Executing arrest warrant during holiday evening.', 1, 0, 7, 9, 7),
(8, '2025-12-10 14:00:00.000000', '2025-12-10 15:00:00.000000', 'Forensic Lab Visit', 'Delivering samples for lab analysis.', 0, 0, 8, 13, 8),
(9, '2025-12-25 08:00:00.000000', '2025-12-25 10:00:00.000000', 'High Risk Surveillance', 'Monitoring suspect expected to appear during Christmas morning.', 1, 0, 9, 10, 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `evidences`
--

CREATE TABLE `evidences` (
  `evidence_id` int(11) NOT NULL,
  `description` longtext DEFAULT NULL,
  `date_collected` datetime(6) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `detailed_description` longtext DEFAULT NULL,
  `initial_condition` longtext DEFAULT NULL,
  `preservation_measures` longtext DEFAULT NULL,
  `location_at_scene` longtext DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `attached_file` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `collector_username` varchar(50) DEFAULT NULL,
  `measure_survey_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `warrant_result_id` int(11) DEFAULT NULL,
  `evidence_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `evidences`
--

INSERT INTO `evidences` (`evidence_id`, `description`, `date_collected`, `status`, `detailed_description`, `initial_condition`, `preservation_measures`, `location_at_scene`, `created_at`, `attached_file`, `is_deleted`, `case_id`, `collector_username`, `measure_survey_id`, `report_id`, `warrant_result_id`, `evidence_type`) VALUES
(1, 'CCTV footage from supermarket.', '2025-05-01 11:30:00.000000', 'Analyzed', 'Footage showing suspect taking items without payment.', 'Original digital copy', 'Stored on secure server', 'Entrance area', '2025-05-01 12:00:00.000000', 'http://evidence.com/cctv_case1.mp4', 0, 1, 'evidence.david', 1, 1, 1, NULL),
(2, 'Stolen goods packaging.', '2025-05-01 12:00:00.000000', 'Processed', 'Plastic bag containing stolen items.', 'Slightly torn', 'Stored in sealed bag', 'Supermarket checkout', '2025-05-01 12:30:00.000000', 'http://evidence.com/packaging_case1.jpg', 0, 1, 'evidence.david', 1, 1, 2, NULL),
(3, 'Broken glass from bar.', '2025-05-02 02:30:00.000000', 'Under Analysis', 'Shattered glass found near victim.', 'Broken but complete', 'Placed in evidence box', 'Bar floor near incident', '2025-05-02 03:00:00.000000', 'http://evidence.com/glass_case2.jpg', 0, 2, 'evidence.david', 2, 2, 3, NULL),
(4, 'Missing person\'s phone records.', '2025-05-03 17:00:00.000000', 'Reviewed', 'Call history and messages before disappearance.', 'Digital files', 'Encrypted digital copy', 'N/A', '2025-05-03 17:30:00.000000', 'http://evidence.com/phone_case3.pdf', 0, 3, 'evidence.david', 10, 3, 4, NULL),
(5, 'Fingerprints from window.', '2025-05-04 10:30:00.000000', 'Under Analysis', 'Lifted fingerprints possibly from suspect.', 'Clear print', 'Stored on acetate sheet', 'Window frame', '2025-05-04 11:00:00.000000', 'http://evidence.com/fingerprints_case4.jpg', 0, 4, 'evidence.david', 18, 4, 5, NULL),
(6, 'Forced entry tools.', '2025-05-04 11:00:00.000000', 'Pending Analysis', 'Crowbar and screwdriver found near scene.', 'Slight wear', 'Tagged and bagged', 'Bushes outside house', '2025-05-04 11:30:00.000000', 'http://evidence.com/tools_case4.jpg', 0, 4, 'evidence.david', 4, 4, NULL, NULL),
(7, 'Bag of suspected narcotics.', '2025-05-05 22:45:00.000000', 'Analyzed', 'White powder tested positive.', 'Sealed plastic bag', 'Secured in drug evidence locker', 'Alley', '2025-05-05 23:00:00.000000', 'http://evidence.com/drugs_case5.jpg', 0, 5, 'evidence.david', 5, 5, 6, NULL),
(8, 'Dashcam footage.', '2025-05-06 15:00:00.000000', 'Reviewed', 'Video showing collision sequence.', 'Unedited file', 'Copied to evidence server', 'Inside suspect vehicle', '2025-05-06 15:30:00.000000', 'http://evidence.com/dashcam_case6.mp4', 0, 6, 'evidence.david', 6, 6, 7, NULL),
(9, 'Scam email correspondence.', '2025-05-07 12:00:00.000000', 'Analyzed', 'Emails used to deceive victim.', 'PDF printouts', 'Stored digitally and physically', 'N/A', '2025-05-07 12:30:00.000000', 'http://evidence.com/email_case7.pdf', 0, 7, 'evidence.david', 7, 7, 8, NULL),
(10, 'Bank surveillance footage.', '2025-05-09 11:00:00.000000', 'Analyzed', 'Shows suspect during robbery.', 'Digital copy', 'Encrypted storage', 'Bank lobby', '2025-05-09 11:30:00.000000', 'http://evidence.com/bank_cctv_case9.mp4', 0, 9, 'evidence.david', 9, 9, 9, NULL),
(11, 'Robber\'s discarded mask.', '2025-05-09 11:30:00.000000', 'Under Analysis', 'Black mask dropped during escape.', 'Dusty, intact', 'Bagged and tagged', 'Alley behind bank', '2025-05-09 12:00:00.000000', 'http://evidence.com/mask_case9.jpg', 0, 9, 'evidence.david', 12, 9, 10, NULL),
(12, 'Compromised server logs.', '2025-05-10 15:00:00.000000', 'Under Analysis', 'Access logs showing unauthorized entry.', 'CSV and text files', 'Stored on secure server', 'N/A', '2025-05-10 15:30:00.000000', 'http://evidence.com/logs_case10.zip', 0, 10, 'evidence.david', 3, 10, 11, NULL),
(13, 'Stabbing weapon.', '2025-05-11 04:00:00.000000', 'Under Analysis', 'Kitchen knife with blood traces.', 'Intact blade', 'Sealed evidence bag', 'Alley where victim found', '2025-05-11 04:30:00.000000', 'http://evidence.com/knife_case11.jpg', 0, 11, 'evidence.david', 11, 11, 12, NULL),
(14, 'Child\'s backpack.', '2025-05-12 18:00:00.000000', 'Processed', 'Found near scene.', 'Slightly dirty', 'Stored in evidence locker', 'Playground area', '2025-05-12 18:30:00.000000', 'http://evidence.com/backpack_case12.jpg', 0, 12, 'evidence.david', 8, 12, 13, NULL),
(15, 'Accelerant samples.', '2025-05-13 21:30:00.000000', 'Under Analysis', 'Collected from burn site.', 'Liquid traces', 'Stored in sealed vials', 'Warehouse floor', '2025-05-13 22:00:00.000000', 'http://evidence.com/accelerant_case13.jpg', 0, 13, 'evidence.david', 13, 13, 14, NULL),
(16, 'Counterfeit banknotes.', '2025-05-14 12:30:00.000000', 'Processed', 'Series of fake notes seized from suspect.', 'Good condition', 'Stored in anti-static sleeves', 'Market stall', '2025-05-14 13:00:00.000000', 'http://evidence.com/fake_money_case14.jpg', 0, 14, 'evidence.david', 14, 14, 15, NULL),
(17, 'Suspects\' phone data (trafficking).', '2025-05-16 17:00:00.000000', 'Under Analysis', 'Extracted call logs, messages related to trafficking network.', 'Digital files', 'Encrypted USB drive', 'Suspects\' residence', '2025-05-16 17:30:00.000000', 'http://evidence.com/phone_data_case16.zip', 0, 16, 'evidence.david', 5, 16, 16, NULL),
(18, 'Contraband in container.', '2025-05-17 11:30:00.000000', 'Processed', 'Large quantity of illegal goods discovered.', 'Sealed packages', 'Locked evidence storage', 'Shipping container at port', '2025-05-17 12:00:00.000000', 'http://evidence.com/contraband_case17.jpg', 0, 17, 'evidence.david', 17, 17, 17, NULL),
(19, 'Threatening messages.', '2025-05-18 15:30:00.000000', 'Reviewed', 'Printouts of messages demanding money.', 'Clean printouts', 'Stored in document folder', 'Business office', '2025-05-18 16:00:00.000000', 'http://evidence.com/threats_case18.pdf', 0, 18, 'evidence.david', 15, 18, 18, NULL),
(20, 'Photos of protest damage.', '2025-05-19 19:00:00.000000', 'Processed', 'Images showing broken windows and graffiti.', 'High-res images', 'Digital archive', 'City square', '2025-05-19 19:30:00.000000', 'http://evidence.com/damage_case19.jpg', 0, 19, 'evidence.david', 8, 19, 19, NULL),
(21, 'Veterinary report on animals.', '2025-05-20 10:00:00.000000', 'Reviewed', 'Details on condition of rescued animals.', 'Original PDF', 'Digital and paper copies', 'Abandoned house', '2025-05-20 10:30:00.000000', 'http://evidence.com/vet_report_case20.pdf', 0, 20, 'evidence.david', 19, 20, 18, NULL),
(22, 'CCTV from parking lot.', '2025-05-21 08:00:00.000000', 'Analyzed', 'Footage showing suspect stealing motorbike.', 'Original video', 'Stored on secure server', 'Apartment parking', '2025-05-21 08:30:00.000000', 'http://evidence.com/cctv_case21.mp4', 0, 21, 'evidence.david', 21, 21, 20, NULL),
(23, 'Eyewitness video of fight.', '2025-05-22 04:00:00.000000', 'Under Analysis', 'Phone video capturing street fight.', 'Slightly shaky footage', 'Copied to evidence server', 'Street outside club', '2025-05-22 04:30:00.000000', 'http://evidence.com/fight_case22.mp4', 0, 22, 'evidence.david', 20, 22, 19, NULL),
(24, 'fff', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'fff', '2025-07-09 19:17:01.100664', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'vvv', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'vvv', '2025-07-09 19:44:05.351541', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'clothing'),
(26, 'hh', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'hh', '2025-07-09 20:14:29.903320', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'document'),
(27, 'ggg', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'ggg', '2025-07-09 20:20:31.904089', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'clothing'),
(28, 'ao ngan', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'ao', '2025-07-09 20:24:59.369781', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'clothing'),
(29, 'mat quan\r\n', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'quan', '2025-07-09 20:28:12.538375', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'clothing'),
(30, 'hhh', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'hhh', '2025-07-09 20:50:50.140946', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'clothing'),
(31, 'ggg', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'ggg', '2025-07-09 21:00:15.503094', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'document'),
(32, 'ff', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'ff', '2025-07-09 21:11:44.575319', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'document'),
(33, 'gg', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'gg', '2025-07-09 21:12:03.928271', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'electronic'),
(34, 'ff', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'ff', '2025-07-09 21:13:51.425079', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'clothing'),
(35, 'gggg', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'ggg', '2025-07-09 21:29:54.991908', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'electronic'),
(36, 'gg', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'gg', '2025-07-09 21:46:11.556947', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'weapon'),
(37, 'ff', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'ff', '2025-07-09 22:35:54.250309', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'weapon'),
(38, 'hh', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'hh', '2025-07-09 23:03:55.243140', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'electronic'),
(39, 'hhh', '2025-07-09 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'hh', '2025-07-09 23:18:37.625394', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'electronic'),
(40, 'fff', '2025-07-10 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'ff', '2025-07-10 12:54:29.752324', 'file/evidence/2024.docx', 0, NULL, NULL, NULL, NULL, NULL, 'document'),
(41, 'gg', '2025-07-10 00:00:00.000000', 'COLLECTED', NULL, NULL, NULL, 'gg', '2025-07-10 13:03:39.789582', 'file/evidence/đề tài.txt', 0, NULL, NULL, NULL, NULL, NULL, 'document');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `financial_invests`
--

CREATE TABLE `financial_invests` (
  `evidence_id` int(11) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `financial_invests`
--

INSERT INTO `financial_invests` (`evidence_id`, `summary`, `is_deleted`) VALUES
(7, 'Tracing fraudulent transactions, reviewing victim\'s bank statements and attempting to freeze fraudulent accounts.', 0),
(10, 'Analysis of bank transactions, investigating suspect accounts, and identifying co-conspirators via financial links.', 0),
(16, 'Tracing flow of counterfeit money, examining distribution channels, and forensic accounting on suspect\'s finances.', 0),
(17, 'Analyzing financial records of suspected trafficking organization, international funds transfer tracking, and identification of shell corporations.', 0),
(18, 'Tracing payments related to smuggling operations, analyzing victim company\'s financial records, and assessing total financial impact.', 0),
(19, 'Analyzing financial demands and payments in extortion case.', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `forensic_invest_results`
--

CREATE TABLE `forensic_invest_results` (
  `result_id` int(11) NOT NULL,
  `lab_name` varchar(100) DEFAULT NULL,
  `report` longtext DEFAULT NULL,
  `result_summary` longtext DEFAULT NULL,
  `received_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `evidence_id` int(11) DEFAULT NULL,
  `investigation_plan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `forensic_invest_results`
--

INSERT INTO `forensic_invest_results` (`result_id`, `lab_name`, `report`, `result_summary`, `received_at`, `created_at`, `is_deleted`, `evidence_id`, `investigation_plan_id`) VALUES
(1, 'Forensics Lab HCM', 'Report_FL_001', 'Trace evidence (fibers, hair) found on packaging.', '2025-05-02 10:00:00.000000', '2025-05-02 09:30:00.000000', 0, 2, 1),
(2, 'Forensics Lab HCM', 'Report_FL_002', 'Glass analysis confirmed origin from bar window.', '2025-05-03 11:00:00.000000', '2025-05-03 10:30:00.000000', 0, 3, 2),
(3, 'Forensics Lab HCM', 'Report_FL_003', 'Fingerprints matched suspect database entry.', '2025-05-05 12:00:00.000000', '2025-05-05 11:30:00.000000', 0, 5, 4),
(4, 'Forensics Lab HCM', 'Report_FL_004', 'Tool marks matched forced entry point.', '2025-05-05 13:00:00.000000', '2025-05-05 12:30:00.000000', 0, 6, 4),
(5, 'Forensics Lab HCM', 'Report_FL_005', 'Narcotics identified as cocaine.', '2025-05-06 10:00:00.000000', '2025-05-06 09:30:00.000000', 0, 7, 5),
(6, 'Forensics Lab HCM', 'Report_FL_006', 'DNA extracted from mask matched suspect.', '2025-05-10 14:00:00.000000', '2025-05-10 13:30:00.000000', 0, 11, 7),
(7, 'Forensics Lab HCM', 'Report_FL_007', 'Blood on knife matched victim\'s DNA.', '2025-05-12 11:00:00.000000', '2025-05-12 10:30:00.000000', 0, 13, 9),
(8, 'Forensics Lab HCM', 'Report_FL_008', 'Accelerant identified as gasoline.', '2025-05-14 10:00:00.000000', '2025-05-14 09:30:00.000000', 0, 15, 11),
(9, 'Forensics Lab HCM', 'Report_FL_009', 'Counterfeit features confirmed on banknotes.', '2025-05-15 10:00:00.000000', '2025-05-15 09:30:00.000000', 0, 16, 12),
(10, 'Forensics Lab HCM', 'Report_FL_010', 'Drug residue found on contraband.', '2025-05-18 10:00:00.000000', '2025-05-18 09:30:00.000000', 0, 18, 15),
(11, 'Forensics Lab B', 'Report_FL_011', 'Micro-fibers analyzed from packaging.', '2025-05-02 15:00:00.000000', '2025-05-02 14:30:00.000000', 0, 2, 1),
(12, 'Forensics Lab B', 'Report_FL_012', 'Material composition analysis on glass.', '2025-05-03 16:00:00.000000', '2025-05-03 15:30:00.000000', 0, 3, 2),
(13, 'Forensics Lab B', 'Report_FL_013', 'Latent fingerprint development.', '2025-05-05 17:00:00.000000', '2025-05-05 16:30:00.000000', 0, 5, 4),
(14, 'Forensics Lab B', 'Report_FL_014', 'Tool mark impression analysis.', '2025-05-05 18:00:00.000000', '2025-05-05 17:30:00.000000', 0, 6, 4),
(15, 'Forensics Lab B', 'Report_FL_015', 'Chemical analysis of narcotics.', '2025-05-06 19:00:00.000000', '2025-05-06 18:30:00.000000', 0, 7, 5),
(16, 'Forensics Lab B', 'Report_FL_016', 'Hair follicle analysis from mask.', '2025-05-10 20:00:00.000000', '2025-05-10 19:30:00.000000', 0, 11, 7),
(17, 'Forensics Lab B', 'Report_FL_017', 'Ballistic comparison (if applicable).', '2025-05-12 21:00:00.000000', '2025-05-12 20:30:00.000000', 0, 13, 9),
(18, 'Forensics Lab B', 'Report_FL_018', 'Ignitable liquid residue test.', '2025-05-14 22:00:00.000000', '2025-05-14 21:30:00.000000', 0, 15, 11),
(19, 'Forensics Lab B', 'Report_FL_019', 'Paper and ink analysis of currency.', '2025-05-15 23:00:00.000000', '2025-05-15 22:30:00.000000', 0, 16, 12),
(20, 'Forensics Lab B', 'Report_FL_020', 'Packaging analysis of contraband.', '2025-05-18 23:00:00.000000', '2025-05-18 22:30:00.000000', 0, 18, 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `holidays`
--

CREATE TABLE `holidays` (
  `holiday_id` int(11) NOT NULL,
  `holiday_name` varchar(255) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `week_of_month` int(11) DEFAULT NULL,
  `weekday_name` varchar(20) DEFAULT NULL,
  `fixed_date` date DEFAULT NULL,
  `is_federal` tinyint(1) DEFAULT NULL,
  `is_traditional` tinyint(1) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `holiday_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `holidays`
--

INSERT INTO `holidays` (`holiday_id`, `holiday_name`, `month`, `week_of_month`, `weekday_name`, `fixed_date`, `is_federal`, `is_traditional`, `description`, `is_deleted`, `holiday_type_id`) VALUES
(1, 'New Year\'s Day', 1, NULL, NULL, '2025-01-01', 1, 0, 'Celebrates the beginning of the new year.', 0, 1),
(2, 'Martin Luther King, Jr. Day', 1, 3, 'Monday', NULL, 1, 0, 'Honors the civil rights leader Martin Luther King, Jr.', 0, 1),
(3, 'Presidents\' Day', 2, 3, 'Monday', NULL, 1, 0, 'Honors all U.S. presidents, especially Washington and Lincoln.', 0, 1),
(4, 'Memorial Day', 5, NULL, NULL, '2025-05-30', 1, 0, 'Honors military personnel who died in service.', 0, 1),
(5, 'Independence Day', 7, NULL, NULL, '2025-07-04', 1, 0, 'Celebrates the Declaration of Independence (1776).', 0, 1),
(6, 'Labor Day', 9, 1, 'Monday', NULL, 1, 0, 'Celebrates the contributions of workers.', 0, 1),
(7, 'Columbus Day', 10, 2, 'Monday', NULL, 1, 0, 'Commemorates Christopher Columbus\' landing in the Americas.', 0, 1),
(8, 'Veterans Day', 11, NULL, NULL, '2025-11-11', 1, 0, 'Honors military veterans.', 0, 1),
(9, 'Thanksgiving Day', 11, 4, 'Thursday', NULL, 1, 0, 'Day of giving thanks, traditionally with a family meal.', 0, 1),
(10, 'Christmas Day', 12, NULL, NULL, '2025-12-25', 1, 0, 'Celebrates the birth of Jesus Christ.', 0, 1),
(11, 'Cesar Chavez Day', 3, NULL, NULL, '2025-03-31', 0, 0, 'Honors labor leader Cesar Chavez.', 0, 2),
(12, 'Kamehameha Day', 6, NULL, NULL, '2025-06-11', 0, 0, 'Commemorates King Kamehameha I of Hawaii.', 0, 2),
(13, 'Valentine\'s Day', 2, NULL, NULL, '2025-02-14', 0, 1, 'Celebrates love and affection.', 0, 3),
(14, 'Halloween', 10, NULL, NULL, '2025-10-31', 0, 1, 'Traditionally celebrates spirits, costumes and trick-or-treating.', 0, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `holiday_observances`
--

CREATE TABLE `holiday_observances` (
  `observance_id` int(11) NOT NULL,
  `applies_to` varchar(100) DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `holiday_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `holiday_observances`
--

INSERT INTO `holiday_observances` (`observance_id`, `applies_to`, `notes`, `is_deleted`, `holiday_id`) VALUES
(1, 'All states', 'Observed nationwide; most businesses closed.', 0, 1),
(2, 'All states', 'Federal offices closed; some schools open.', 0, 2),
(3, 'Most states', 'Federal holiday; not universally observed by private businesses.', 0, 3),
(4, 'All states', 'Observed on fixed date May 30 in 2025.', 0, 4),
(5, 'All states', 'Fireworks and parades widely held.', 0, 5),
(6, 'All states', 'Marks the end of summer vacation season.', 0, 6),
(7, 'Most states', 'Observed primarily in federal institutions.', 0, 7),
(8, 'All states', 'Military parades and ceremonies.', 0, 8),
(9, 'All states', 'Family gatherings and special meals.', 0, 9),
(10, 'All states', 'Widely observed; most retail stores open with reduced hours.', 0, 10),
(11, 'California', 'Public schools and state offices closed.', 0, 11),
(12, 'Hawaii', 'Cultural celebrations and parades.', 0, 12),
(13, 'Most states', 'Popular but unofficial holiday; retail promotions.', 0, 13),
(14, 'Most states', 'Costume events, trick-or-treating.', 0, 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `holiday_types`
--

CREATE TABLE `holiday_types` (
  `holiday_type_id` int(11) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `holiday_types`
--

INSERT INTO `holiday_types` (`holiday_type_id`, `type_name`, `description`, `is_deleted`) VALUES
(1, 'Federal Holiday', 'Official holidays established by federal law, observed nationwide.', 0),
(2, 'State Holiday', 'Holidays recognized by individual states, may not be observed nationwide.', 0),
(3, 'Unofficial / Traditional Holiday', 'Widely celebrated holidays that are not established by law.', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `indictments`
--

CREATE TABLE `indictments` (
  `indictments_id` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  `issued_at` datetime(6) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `prosecution_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `indictments`
--

INSERT INTO `indictments` (`indictments_id`, `content`, `issued_at`, `is_deleted`, `prosecution_id`) VALUES
(1, 'Indictment for grand theft.', '2025-06-03 00:00:00.000000', 0, 1),
(2, 'Indictment for destruction of property (related).', '2025-06-03 00:00:00.000000', 0, 1),
(3, 'Indictment for possession with intent to distribute.', '2025-06-12 00:00:00.000000', 0, 2),
(4, 'Indictment for manufacturing counterfeit currency.', '2025-06-22 00:00:00.000000', 0, 3),
(5, 'Indictment for incitement to riot.', '2025-06-27 00:00:00.000000', 0, 4),
(6, 'Indictment for aggravated assault.', '2025-06-27 00:00:00.000000', 0, 5),
(7, 'Indictment for residential burglary.', '2025-06-17 00:00:00.000000', 0, 7),
(8, 'Indictment for wire fraud.', '2025-06-24 00:00:00.000000', 0, 8),
(9, 'Indictment for armed robbery.', '2025-07-03 00:00:00.000000', 0, 9),
(10, 'Indictment for illegal possession of firearm.', '2025-07-03 00:00:00.000000', 0, 9),
(11, 'Indictment for unauthorized access to computer systems.', '2025-07-07 00:00:00.000000', 0, 10),
(12, 'Indictment for first-degree murder.', '2025-07-12 00:00:00.000000', 0, 11),
(13, 'Indictment for kidnapping.', '2025-07-17 00:00:00.000000', 0, 12),
(14, 'Indictment for arson.', '2025-07-22 00:00:00.000000', 0, 13),
(15, 'Indictment for human trafficking.', '2025-07-27 00:00:00.000000', 0, 15),
(16, 'Indictment for smuggling narcotics.', '2025-08-01 00:00:00.000000', 0, 16),
(17, 'Indictment for extortion.', '2025-08-07 00:00:00.000000', 0, 17),
(18, 'Indictment for animal cruelty.', '2025-08-12 00:00:00.000000', 0, 18),
(19, 'Indictment for grand theft auto.', '2025-08-17 00:00:00.000000', 0, 19),
(20, 'Indictment for conspiracy to distribute narcotics.', '2025-06-13 00:00:00.000000', 0, 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inmates`
--

CREATE TABLE `inmates` (
  `inmate_id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `assigned_facility` longtext DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expected_release` date DEFAULT NULL,
  `health_status` longtext DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `sentence_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `inmates`
--

INSERT INTO `inmates` (`inmate_id`, `fullname`, `assigned_facility`, `start_date`, `expected_release`, `health_status`, `status`, `is_deleted`, `sentence_id`) VALUES
(1, 'Suspect A', 'Central Correctional Facility', '2025-07-15', '2026-01-15', 'Healthy', 'Active', 0, 1),
(2, 'Suspect E', 'Provincial Detention Center', '2025-07-01', '2027-07-01', 'Healthy', 'Active', 0, 2),
(3, 'Suspect L', 'Local Penitentiary', '2025-07-01', '2026-07-01', 'Healthy', 'Active', 0, 3),
(4, 'Suspect I', 'Maximum Security Prison', '2025-09-01', '2050-09-01', 'Healthy', 'Active', 0, 6),
(5, 'Kidnapper J', 'High Security Detention', '2025-09-05', '2040-09-05', 'Healthy', 'Active', 0, 7),
(6, 'Trafficker M', 'Federal Correctional Complex', '2025-09-10', '2035-09-10', 'Healthy', 'Active', 0, 8),
(7, 'Extortionist O', 'Medium Security Prison', '2025-09-15', '2030-09-15', 'Healthy', 'Active', 0, 9),
(8, 'Suspect R', 'Local Detention Center', '2025-08-01', '2026-02-01', 'Healthy', 'Active', 0, 10),
(9, 'Suspect S', 'Local Detention Center', '2025-07-15', '2025-10-15', 'Healthy', 'Active', 0, 11),
(10, 'Suspect P', 'Local Detention Center', '2025-07-06', '2025-08-06', 'Healthy', 'Active', 0, 12),
(11, 'Suspect T', 'Central Correctional Facility', '2025-07-16', '2026-07-16', 'Healthy', 'Active', 0, 13),
(12, 'Suspect D', 'Provincial Detention Center', '2025-06-16', '2026-06-16', 'Healthy', 'Active', 0, 14),
(13, 'Robber G', 'Maximum Security Prison', '2025-07-04', '2045-07-04', 'Healthy', 'Active', 0, 15),
(14, 'Hacker H', 'Cybercrime Detention Unit', '2025-07-08', '2030-07-08', 'Healthy', 'Active', 0, 16),
(15, 'Arsonist K', 'Rehabilitation Center', '2025-07-25', '2030-07-25', 'Under medical care', 'Active', 0, 17),
(16, 'Smuggler N', 'Federal Correctional Complex', '2025-08-02', '2032-08-02', 'Healthy', 'Active', 0, 18),
(17, 'Cruelty Suspect Q', 'Local Detention Center', '2025-08-12', '2026-08-12', 'Healthy', 'Active', 0, 19),
(18, 'Suspect A', 'Central Correctional Facility', '2025-07-17', '2026-01-17', 'Healthy', 'Active', 0, 20),
(19, 'Suspect E', 'Provincial Detention Center', '2025-07-03', '2027-07-03', 'Healthy', 'Active', 0, 21),
(20, 'Suspect A (Re-entry)', 'Central Correctional Facility', '2026-02-01', '2026-08-01', 'Healthy', 'Active', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `interviews`
--

CREATE TABLE `interviews` (
  `interview_id` int(11) NOT NULL,
  `location` longtext DEFAULT NULL,
  `attached_file` longtext DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `holiday_conflict` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `holiday_id` int(11) DEFAULT NULL,
  `interviewer_id` varchar(50) DEFAULT NULL,
  `investigation_plan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `interviews`
--

INSERT INTO `interviews` (`interview_id`, `location`, `attached_file`, `start_time`, `end_time`, `holiday_conflict`, `is_deleted`, `holiday_id`, `interviewer_id`, `investigation_plan_id`) VALUES
(1, 'Police Station D1', NULL, '2025-05-05 14:00:00.000000', '2025-05-05 15:00:00.000000', 0, 0, 1, 'inv.mike', 1),
(2, 'Interrogation Room', NULL, '2025-05-01 13:30:00.000000', '2025-05-01 14:30:00.000000', 1, 0, 3, 'inv.mike', 1),
(3, 'Victim Residence', NULL, '2025-05-03 10:30:00.000000', '2025-05-03 11:30:00.000000', 0, 0, 3, 'det.lisa', 2),
(4, 'Family Residence', NULL, '2025-05-04 15:00:00.000000', '2025-05-04 16:00:00.000000', 0, 0, 2, 'inv.mike', 3),
(5, 'Neighbor Residence', NULL, '2025-05-05 13:00:00.000000', '2025-05-05 14:00:00.000000', 0, 0, 4, 'det.lisa', 4),
(6, 'Interrogation Room', NULL, '2025-05-06 10:00:00.000000', '2025-05-06 11:00:00.000000', 0, 0, 5, 'inv.mike', 5),
(7, 'Victim Residence', NULL, '2025-05-08 14:00:00.000000', '2025-05-08 15:00:00.000000', 0, 0, 6, 'det.lisa', 7),
(8, 'Bank Staff Room', NULL, '2025-05-10 11:00:00.000000', '2025-05-10 12:00:00.000000', 0, 0, 7, 'det.lisa', 9),
(9, 'Crime Scene', NULL, '2025-05-12 10:00:00.000000', '2025-05-12 11:00:00.000000', 1, 0, 4, 'det.lisa', 11),
(10, 'Police Station D2', NULL, '2025-05-13 15:00:00.000000', '2025-05-13 16:00:00.000000', 0, 0, 8, 'det.lisa', 12),
(11, 'Fire Station', NULL, '2025-05-14 10:00:00.000000', '2025-05-14 11:00:00.000000', 0, 0, 9, 'inv.mike', 13),
(12, 'Interrogation Room', NULL, '2025-05-15 10:00:00.000000', '2025-05-15 11:00:00.000000', 0, 0, 11, 'inv.mike', 14),
(13, 'Victim Support Center', NULL, '2025-05-16 14:00:00.000000', '2025-05-16 15:00:00.000000', 0, 0, 12, 'patrol.jane', 15),
(14, 'Safe House', NULL, '2025-05-17 10:00:00.000000', '2025-05-17 11:00:00.000000', 0, 0, 13, 'det.lisa', 16),
(15, 'Port Authority Office', NULL, '2025-05-18 10:00:00.000000', '2025-05-18 11:00:00.000000', 0, 0, 14, 'inv.mike', 17),
(16, 'Police Station D1', NULL, '2025-05-19 14:00:00.000000', '2025-05-19 15:00:00.000000', 0, 0, 11, 'det.lisa', 18),
(17, 'Interrogation Room', NULL, '2025-05-21 10:00:00.000000', '2025-05-21 11:00:00.000000', 0, 0, 2, 'patrol.jane', 20),
(18, 'Police Station D1', NULL, '2025-05-25 10:00:00.000000', '2025-05-25 10:30:00.000000', 1, 0, 10, 'inv.mike', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `investigation_plans`
--

CREATE TABLE `investigation_plans` (
  `investigation_plan_id` int(11) NOT NULL,
  `deadline_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `plan_content` longtext DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `holiday_conflict` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `accepted_officer_username` varchar(50) DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  `created_officer_username` varchar(50) DEFAULT NULL,
  `holiday_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `investigation_plans`
--

INSERT INTO `investigation_plans` (`investigation_plan_id`, `deadline_date`, `status`, `create_at`, `plan_content`, `type`, `holiday_conflict`, `is_deleted`, `accepted_officer_username`, `case_id`, `created_officer_username`, `holiday_id`) VALUES
(1, '2025-06-15', 'Ongoing', '2025-05-02 09:00:00.000000', 'Identify suspect, recover stolen goods, interview witnesses.', 'Standard', 0, 0, 'det.lisa', 1, 'inv.mike', 1),
(2, '2025-06-20', 'Ongoing', '2025-05-03 10:00:00.000000', 'Interview victim and witnesses, review security footage.', 'Standard', 0, 0, 'inv.mike', 2, 'det.lisa', 2),
(3, '2025-07-01', 'Ongoing', '2025-05-04 11:00:00.000000', 'Coordinate search efforts, analyze phone data, issue public appeal.', 'Urgent', 1, 0, 'chief.robert', 3, 'inv.mike', 3),
(4, '2025-06-25', 'Ongoing', '2025-05-05 12:00:00.000000', 'Process crime scene, collect fingerprints, interview neighbors.', 'Standard', 0, 0, 'det.lisa', 4, 'det.lisa', 4),
(5, '2025-06-10', 'Completed', '2025-05-06 09:00:00.000000', 'Apprehend suspect, secure narcotics, gather testimony.', 'Urgent', 0, 0, 'inv.mike', 5, 'inv.mike', 5),
(6, '2025-07-10', 'Ongoing', '2025-05-08 10:00:00.000000', 'Trace fraudulent transactions, identify online aliases, alert banks.', 'Standard', 0, 0, 'det.lisa', 7, 'det.lisa', 6),
(7, '2025-07-15', 'Ongoing', '2025-05-10 09:00:00.000000', 'Analyze surveillance, track getaway vehicle, identify suspects.', 'Urgent', 1, 0, 'inv.mike', 9, 'det.lisa', 7),
(8, '2025-08-01', 'Ongoing', '2025-05-11 10:00:00.000000', 'Perform forensic analysis of servers, trace attack origin, secure network.', 'Standard', 0, 0, 'cyber.anna', 10, 'cyber.anna', 8),
(9, '2025-08-05', 'Ongoing', '2025-05-12 11:00:00.000000', 'Secure crime scene, collect evidence, interview witnesses, identify suspect.', 'Urgent', 0, 0, 'det.lisa', 11, 'det.lisa', 9),
(10, '2025-08-10', 'Ongoing', '2025-05-13 12:00:00.000000', 'Coordinate rescue efforts, analyze ransom demand, gather intelligence.', 'Urgent', 1, 0, 'inv.mike', 12, 'det.lisa', 10),
(11, '2025-07-20', 'Ongoing', '2025-05-14 09:00:00.000000', 'Investigate fire origin, collect samples, interview potential witnesses.', 'Standard', 0, 0, 'inv.mike', 13, 'inv.mike', 1),
(12, '2025-06-30', 'Completed', '2025-05-15 10:00:00.000000', 'Trace fake currency source, interview suspect, gather evidence.', 'Standard', 0, 0, 'det.lisa', 14, 'inv.mike', 11),
(13, '2025-06-28', 'Ongoing', '2025-05-16 11:00:00.000000', 'Interview parties, assess safety, provide support resources.', 'Follow-up', 0, 0, 'patrol.jane', 15, 'patrol.jane', 2),
(14, '2025-08-20', 'Ongoing', '2025-05-17 12:00:00.000000', 'Undercover operation, intelligence gathering, coordination with international agencies.', 'Urgent', 1, 0, 'chief.robert', 16, 'det.lisa', 12),
(15, '2025-07-25', 'Ongoing', '2025-05-18 09:00:00.000000', 'Inspect container, track origin/destination, interview involved parties.', 'Standard', 0, 0, 'det.lisa', 17, 'inv.mike', 13),
(16, '2025-08-15', 'Ongoing', '2025-05-19 10:00:00.000000', 'Surveillance of suspect, gather evidence of threats, protect victim.', 'Standard', 0, 0, 'det.lisa', 18, 'det.lisa', 14),
(17, '2025-06-30', 'Ongoing', '2025-05-21 09:00:00.000000', 'Document animal condition, interview suspect, ensure animal welfare.', 'Standard', 0, 0, 'inv.mike', 20, 'patrol.jane', 12),
(18, '2025-07-05', 'Ongoing', '2025-05-22 10:00:00.000000', 'Review CCTV, trace stolen motorbike, interview witnesses.', 'Standard', 0, 0, 'det.lisa', 21, 'inv.mike', 2),
(19, '2025-06-29', 'Ongoing', '2025-05-23 11:00:00.000000', 'Interview participants, gather witness statements, review video.', 'Follow-up', 0, 0, 'patrol.jane', 22, 'patrol.jane', 5),
(20, '2025-07-01', 'Ongoing', '2025-05-24 10:00:00.000000', 'Follow up on leads for recovered goods.', 'Follow-up', 0, 0, 'inv.mike', 1, 'inv.tom', 8),
(21, '2025-07-18', 'Completed', '2025-07-09 23:33:36.000000', 'Preservation plan #1 for case 3', 'Preservation', 0, 1, 'officer10', 3, 'officer10', 1),
(22, '2025-07-18', 'Completed', '2025-07-10 11:33:36.177235', 'Preservation plan #2 for case 3', 'Preservation', 0, 0, 'officer9', 3, 'officer9', 2),
(23, '2025-07-18', 'In Progress', '2025-07-10 22:33:36.179325', 'Preservation plan #3 for case 1', 'Interrogation', 0, 0, 'officer8', 1, 'officer8', 2),
(24, '2025-07-16', 'Pending', '2025-07-09 21:33:36.181299', 'Preservation plan #4 for case 3', 'Evidence Review', 0, 0, 'officer7', 3, 'officer7', 1),
(25, '2025-07-21', 'Pending', '2025-07-10 04:33:36.000000', 'Preservation plan #5 for case 3', 'Evidence Review', 1, 0, 'officer10', 3, 'officer10', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `measure_surveys`
--

CREATE TABLE `measure_surveys` (
  `measure_survey_id` int(11) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `source` longtext DEFAULT NULL,
  `result` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `measure_surveys`
--

INSERT INTO `measure_surveys` (`measure_survey_id`, `type_name`, `source`, `result`, `is_deleted`) VALUES
(1, 'Crime Scene Sketch', 'Crime Scene Unit', 'Detailed drawing of theft scene layout.', 0),
(2, 'Blood Spatter Analysis', 'Forensic Lab', 'Analysis of blood spatter patterns at assault scene.', 0),
(3, 'Search Grid Map', 'Search & Rescue Team', 'Map of search areas for missing person.', 0),
(4, 'Entry Point Dimensions', 'CSI', 'Measurements of forced entry points for burglary.', 0),
(5, 'Drug Weight Measurement', 'Evidence Lab', 'Precise weight of seized narcotics.', 0),
(6, 'Skid Mark Analysis', 'Traffic Police', 'Analysis of skid marks at accident scene.', 0),
(7, 'Financial Loss Calculation', 'Financial Crimes Unit', 'Total calculated loss from fraud.', 0),
(8, 'Vandalism Damage Estimation', 'City Property Management', 'Estimated cost of graffiti removal and repair.', 0),
(9, 'Bank Layout Diagram', 'Bank Security', 'Diagram of bank interior for robbery reconstruction.', 0),
(10, 'Network Topology Map', 'Cybercrime Unit', 'Diagram of compromised network layout.', 0),
(11, 'Bullet Trajectory Analysis', 'Forensic Ballistics', 'Reconstruction of bullet trajectory in homicide.', 0),
(12, 'Abduction Site Survey', 'FBI/Police', 'Detailed survey of child abduction site.', 0),
(13, 'Fire Spread Pattern', 'Fire Dept Investigator', 'Analysis of fire spread from ignition point.', 0),
(14, 'Currency Security Features', 'National Bank', 'Analysis of security features on counterfeit notes.', 0),
(15, 'Domestic Violence Risk Assessment', 'Social Services', 'Assessment of risk to victim in domestic violence case.', 0),
(16, 'Trafficking Route Map', 'Intelligence Unit', 'Map of suspected human trafficking routes.', 0),
(17, 'Container Manifest Audit', 'Customs Audit', 'Audit of shipping container contents against manifest.', 0),
(18, 'Threat Severity Assessment', 'Threat Assessment Unit', 'Evaluation of risk posed by extortionist.', 0),
(19, 'Crowd Movement Analysis', 'Public Order Police', 'Analysis of crowd movement during protest.', 0),
(20, 'Animal Health Assessment', 'Veterinary Services', 'Detailed report on animal health and condition.', 0),
(21, 'Vehicle ID Check', 'Traffic Police', 'Verification of motorbike VIN and registration.', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `medical_supports`
--

CREATE TABLE `medical_supports` (
  `support_id` int(11) NOT NULL,
  `unit_id` varchar(100) DEFAULT NULL,
  `type_of_support` varchar(100) DEFAULT NULL,
  `personnel_assigned` longtext DEFAULT NULL,
  `location_assigned` longtext DEFAULT NULL,
  `scene_sketch_url` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `scene_response_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `medical_supports`
--

INSERT INTO `medical_supports` (`support_id`, `unit_id`, `type_of_support`, `personnel_assigned`, `location_assigned`, `scene_sketch_url`, `notes`, `is_deleted`, `scene_response_id`) VALUES
(1, 'MED-01', 'Emergency medical aid', 'Paramedic John, Nurse Anna', 'North entrance', 'http://scene.com/sketch1.png', 'Stabilized victim on scene.', 0, 1),
(2, 'MED-02', 'Ambulance evacuation', 'Paramedic Lee', 'Near victim position', 'http://scene.com/sketch2.png', 'Victim transported to hospital.', 0, 2),
(3, 'MED-03', 'First aid & triage', 'Nurse Kate', 'Intersection area', 'http://scene.com/sketch3.png', 'Multiple minor injuries treated.', 0, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `permission_id` int(11) NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`permission_id`, `description`, `is_deleted`) VALUES
(1, 'View_All_Cases', 0),
(2, 'Create_Case', 0),
(3, 'Edit_Case', 0),
(4, 'Delete_Case', 0),
(5, 'Approve_Report', 0),
(6, 'Create_Report', 0),
(7, 'Edit_Report', 0),
(8, 'Delete_Report', 0),
(9, 'Manage_Users', 0),
(10, 'Manage_Roles', 0),
(11, 'Add_Evidence', 0),
(12, 'Analyze_Evidence', 0),
(13, 'Approve_Arrest', 0),
(14, 'Create_Arrest', 0),
(15, 'Manage_Warrants', 0),
(16, 'Conduct_Interview', 0),
(17, 'View_Financial_Records', 0),
(18, 'Manage_Inmates', 0),
(19, 'Access_Forensics_Lab', 0),
(20, 'Manage_Investigation_Plans', 0),
(21, 'View_Sensitive_Data', 0),
(22, 'Issue_Indictment', 0),
(23, 'Approve_Prosecution', 0),
(24, 'Issue_Sentence', 0),
(25, 'Manage_Timeline_Entries', 0),
(26, 'View_Victims', 0),
(27, 'View_Suspects', 0),
(28, 'View_Witnesses', 0),
(29, 'Conduct_Physical_Invest', 0),
(30, 'Conduct_Digital_Invest', 0),
(31, 'Conduct_Financial_Invest', 0),
(32, 'Create_Measure_Survey', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `physical_invest_results`
--

CREATE TABLE `physical_invest_results` (
  `result_id` int(11) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `attached_file` longtext DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `evidence_id` int(11) DEFAULT NULL,
  `investigation_plan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `physical_invest_results`
--

INSERT INTO `physical_invest_results` (`result_id`, `summary`, `attached_file`, `created_at`, `is_deleted`, `evidence_id`, `investigation_plan_id`) VALUES
(1, 'Initial packaging analysis for fiber evidence.', 'http://invest.com/physical/packaging_analysis.jpg', '2025-05-02 10:00:00.000000', 0, 2, 1),
(2, 'Glass fragment examination from crime scene.', 'http://invest.com/physical/glass_analysis.jpg', '2025-05-03 11:00:00.000000', 0, 3, 3),
(3, 'Enhanced fingerprint analysis from knife handle.', 'http://invest.com/physical/fingerprint_enhanced.jpg', '2025-05-05 12:00:00.000000', 0, 5, 5),
(4, 'Tool mark comparison on forced entry point.', 'http://invest.com/physical/tools_analysis.jpg', '2025-05-05 13:00:00.000000', 0, 6, 4),
(5, 'Mask fiber and shape analysis.', 'http://invest.com/physical/mask_analysis.jpg', '2025-05-10 14:00:00.000000', 0, 11, 11),
(6, 'Detailed knife blade analysis and stain confirmation.', 'http://invest.com/physical/knife_analysis.jpg', '2025-05-12 11:00:00.000000', 0, 13, 13),
(7, 'Inspection of suspect’s backpack.', 'http://invest.com/physical/backpack_analysis.jpg', '2025-05-13 10:00:00.000000', 0, 14, 12),
(8, 'Accelerant pattern review from fire debris.', 'http://invest.com/physical/accelerant_analysis.jpg', '2025-05-14 10:00:00.000000', 0, 15, 15),
(9, 'Close-up examination of counterfeit banknotes.', 'http://invest.com/physical/fake_money_detailed.jpg', '2025-05-15 10:00:00.000000', 0, 16, 16),
(10, 'Detailed photo review of seized contraband.', 'http://invest.com/physical/contraband_detailed.jpg', '2025-05-18 10:00:00.000000', 0, 18, 18),
(11, 'Secondary fiber analysis from packaging.', 'http://invest.com/physical/packaging_retest.jpg', '2025-05-19 09:00:00.000000', 0, 2, 1),
(12, 'Re-test on glass fragment for composition.', 'http://invest.com/physical/glass_retest.jpg', '2025-05-20 10:00:00.000000', 0, 3, 3),
(13, 'Latent fingerprint re-examination.', 'http://invest.com/physical/fingerprint_retest.jpg', '2025-05-21 11:00:00.000000', 0, 5, 5),
(14, 'Tool mark retest for deeper cuts.', 'http://invest.com/physical/tools_retest.jpg', '2025-05-22 12:00:00.000000', 0, 6, 4),
(15, 'Secondary mask fiber consistency check.', 'http://invest.com/physical/mask_retest.jpg', '2025-05-23 13:00:00.000000', 0, 11, 11),
(16, 'Follow-up stain verification on knife.', 'http://invest.com/physical/knife_retest.jpg', '2025-05-24 14:00:00.000000', 0, 13, 13),
(17, 'Backpack fabric strength testing.', 'http://invest.com/physical/backpack_retest.jpg', '2025-05-25 15:00:00.000000', 0, 14, 12),
(18, 'Confirmatory test on accelerant residue.', 'http://invest.com/physical/accelerant_retest.jpg', '2025-05-26 16:00:00.000000', 0, 15, 15),
(19, 'Re-examination of counterfeit ink patterns.', 'http://invest.com/physical/fake_money_retest.jpg', '2025-05-27 17:00:00.000000', 0, 16, 16),
(20, 'Further packaging analysis of seized contraband.', 'http://invest.com/physical/contraband_retest.jpg', '2025-05-28 18:00:00.000000', 0, 18, 18);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `prosecutions`
--

CREATE TABLE `prosecutions` (
  `prosecution_id` int(11) NOT NULL,
  `decision` longtext DEFAULT NULL,
  `decision_date` date DEFAULT NULL,
  `reasion` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `prosecutor_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `prosecutions`
--

INSERT INTO `prosecutions` (`prosecution_id`, `decision`, `decision_date`, `reasion`, `is_deleted`, `case_id`, `prosecutor_id`) VALUES
(1, 'Proceed with Charges', '2025-06-01', 'Sufficient evidence for theft.', 0, 1, 'pros.chris'),
(2, 'Proceed with Charges', '2025-06-10', 'Drug possession and distribution.', 0, 5, 'pros.chris'),
(3, 'Proceed with Charges', '2025-06-20', 'Counterfeiting charges.', 0, 14, 'pros.chris'),
(4, 'Proceed with Charges', '2025-06-25', 'Public disturbance and property damage.', 0, 19, 'pros.chris'),
(5, 'Proceed with Charges', '2025-06-26', 'Assault charges.', 0, 22, 'pros.chris'),
(6, 'Dismiss', '2025-06-05', 'Insufficient evidence for assault.', 0, 2, 'pros.olivia'),
(7, 'Proceed with Charges', '2025-06-15', 'Evidence supports burglary.', 0, 4, 'pros.olivia'),
(8, 'Proceed with Charges', '2025-06-22', 'Elder fraud charges.', 0, 7, 'pros.olivia'),
(9, 'Proceed with Charges', '2025-07-01', 'Armed robbery charges.', 0, 9, 'pros.olivia'),
(10, 'Proceed with Charges', '2025-07-05', 'Cybercrime and data theft.', 0, 10, 'pros.chris'),
(11, 'Proceed with Charges', '2025-07-10', 'Homicide charges.', 0, 11, 'pros.chris'),
(12, 'Proceed with Charges', '2025-07-15', 'Kidnapping charges.', 0, 12, 'pros.olivia'),
(13, 'Proceed with Charges', '2025-07-20', 'Arson charges.', 0, 13, 'pros.olivia'),
(14, 'Proceed with Charges', '2025-07-25', 'Human trafficking and related offenses.', 0, 16, 'pros.chris'),
(15, 'Proceed with Charges', '2025-07-30', 'Large-scale smuggling.', 0, 17, 'pros.olivia'),
(16, 'Proceed with Charges', '2025-08-05', 'Extortion charges.', 0, 18, 'pros.chris'),
(17, 'Proceed with Charges', '2025-08-10', 'Animal cruelty charges.', 0, 20, 'pros.olivia'),
(18, 'Proceed with Charges', '2025-08-15', 'Motorbike theft charges.', 0, 21, 'pros.chris'),
(19, 'Proceed with Charges', '2025-06-02', 'Additional charges related to theft case.', 0, 1, 'pros.olivia'),
(20, 'Proceed with Charges', '2025-06-11', 'Conspiracy to distribute drugs.', 0, 5, 'pros.olivia');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `prosecution_suspects`
--

CREATE TABLE `prosecution_suspects` (
  `id` bigint(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `prosecution_id` int(11) NOT NULL,
  `suspect_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `prosecution_suspects`
--

INSERT INTO `prosecution_suspects` (`id`, `is_deleted`, `prosecution_id`, `suspect_id`) VALUES
(1, 0, 1, 1),
(2, 0, 1, 20),
(3, 0, 2, 5),
(4, 0, 3, 14),
(5, 0, 4, 19),
(6, 0, 5, 20),
(7, 0, 7, 4),
(8, 0, 8, 7),
(9, 0, 9, 9),
(10, 0, 10, 10),
(11, 0, 11, 11),
(12, 0, 12, 12),
(13, 0, 13, 13),
(14, 0, 14, 14),
(15, 0, 15, 16),
(16, 0, 16, 17),
(17, 0, 17, 18),
(18, 0, 18, 20),
(19, 0, 19, 19),
(20, 0, 20, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `reliability` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `interview_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `questions`
--

INSERT INTO `questions` (`question_id`, `content`, `answer`, `reliability`, `is_deleted`, `created_by`, `interview_id`) VALUES
(1, 'Can you describe the suspect?', 'Tall, wearing a black hoodie.', 'High', 0, 'inv.mike', 1),
(2, 'What time did you notice the incident?', 'Around 10:15 AM.', 'High', 0, 'inv.mike', 1),
(3, 'Why did you take the items?', 'I needed money.', 'Low', 0, 'inv.mike', 2),
(4, 'What happened before the fight?', 'They were arguing loudly.', 'Medium', 0, 'det.lisa', 3),
(5, 'When was the last time you saw your child?', 'Yesterday evening, before dinner.', 'High', 0, 'inv.mike', 4),
(6, 'Did you hear anything suspicious?', 'A loud crash around 3 AM.', 'High', 0, 'det.lisa', 5),
(7, 'Where did you get the drugs?', 'From a supplier in District 10.', 'Low', 0, 'inv.mike', 6),
(8, 'How did the scammer contact you?', 'Through a phishing email.', 'High', 0, 'det.lisa', 7),
(9, 'What did you see during the robbery?', 'A masked man with a gun.', 'High', 0, 'det.lisa', 8),
(10, 'Did you notice any distinguishing features?', 'No, he was heavily disguised.', 'Medium', 0, 'det.lisa', 8),
(11, 'What data was accessed?', 'Customer records and financial data.', 'High', 0, 'det.lisa', 9),
(12, 'What did you find at the scene?', 'A deceased male, knife nearby.', 'High', 0, 'det.lisa', 10),
(13, 'When was the last time the child was seen?', 'Around 4:30 PM on the playground.', 'High', 0, 'det.lisa', 11),
(14, 'What makes you suspect arson?', 'Strong smell of gasoline, quick spread of fire.', 'High', 0, 'inv.mike', 12),
(15, 'How did you obtain the fake currency?', 'Someone paid with it at my shop.', 'High', 0, 'inv.mike', 13),
(16, 'Do you know the source of these fake notes?', 'No, not directly.', 'Low', 0, 'inv.mike', 14),
(17, 'Are you afraid for your safety?', 'Yes, very much so.', 'High', 0, 'patrol.jane', 15),
(18, 'Can you describe the trafficking network?', 'It\'s an organized group with international links.', 'High', 0, 'det.lisa', 16),
(19, 'What was hidden in the container?', 'Illegal firearms and drugs.', 'High', 0, 'inv.mike', 17),
(20, 'What are the demands of the extortionist?', 'Large sum of money for protection.', 'High', 0, 'det.lisa', 18),
(21, 'Can you identify the suspect from this photo?', 'Yes, that\'s him.', 'High', 0, 'inv.mike', 1),
(22, 'Were there any weapons involved in the fight?', 'Only fists.', 'High', 0, 'det.lisa', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `record_infos`
--

CREATE TABLE `record_infos` (
  `record_info_id` int(11) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `source` longtext DEFAULT NULL,
  `date_collected` date DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `evidence_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `record_infos`
--

INSERT INTO `record_infos` (`record_info_id`, `type_name`, `source`, `date_collected`, `summary`, `is_deleted`, `evidence_id`) VALUES
(1, 'Chain of Custody', 'Evidence Custodian', '2025-05-01', 'Initial logging of CCTV footage.', 0, 1),
(2, 'Phone Data Log', 'Police IT', '2025-05-03', 'Summary of retrieved call and text data.', 0, 4),
(3, 'Accident Report', 'Patrol Officer', '2025-05-06', 'Formal report of traffic collision details.', 0, 8),
(4, 'Fraudulent Email Header', 'Victim\'s Email Provider', '2025-05-07', 'Technical details of phishing email origin.', 0, 9),
(5, 'Bank Robbery Report', 'Bank Security', '2025-05-09', 'Internal bank report on robbery.', 0, 10),
(6, 'Cyber Attack Incident Report', 'Company IT Security', '2025-05-10', 'Detailed report on server breach.', 0, 12),
(7, 'Trafficking Intelligence Brief', 'Undercover Unit', '2025-05-16', 'Summary of intelligence gathered on trafficking.', 0, 17),
(8, 'Extortion Communication Log', 'Victim\'s Phone', '2025-05-18', 'Chronological log of threatening messages.', 0, 19),
(9, 'Public Damage Assessment', 'City Works Dept', '2025-05-19', 'Report detailing cost of vandalism.', 0, 20),
(10, 'Veterinary Examination Report', 'Animal Shelter', '2025-05-20', 'Health assessment of rescued animal.', 0, 21),
(11, 'Motorbike Registration', 'DMV', '2025-05-21', 'Ownership details of stolen motorbike.', 0, 22),
(12, 'Witness Statement Transcription', 'Police Interview', '2025-05-22', 'Written record of eyewitness account.', 0, 23),
(13, 'CCTV Log Entry', 'Security Personnel', '2025-05-01', 'Time of CCTV footage handover.', 0, 1),
(14, 'Deleted Call Recovery Log', 'Digital Forensics', '2025-05-03', 'Log of recovered deleted call data.', 0, 4),
(15, 'Accident Scene Sketch', 'Patrol Officer', '2025-05-06', 'Diagram of the accident scene.', 0, 8),
(16, 'Fraud Investigation Request', 'Financial Crimes Unit', '2025-05-07', 'Request for detailed financial investigation.', 0, 9),
(17, 'Bank Alarm Log', 'Bank Security', '2025-05-09', 'System log of bank alarm activation.', 0, 10),
(18, 'Forensic Image Hash', 'Cybercrime Unit', '2025-05-10', 'Cryptographic hash of server forensic image.', 0, 12),
(19, 'Surveillance Report', 'Investigator', '2025-05-16', 'Report from surveillance on trafficking suspects.', 0, 17),
(20, 'Threat Analysis Report', 'Intelligence Unit', '2025-05-18', 'Analysis of threats received.', 0, 19);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `type_report` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `case_location` longtext DEFAULT NULL,
  `reported_at` datetime(6) DEFAULT NULL,
  `reporter_fullname` varchar(100) DEFAULT NULL,
  `reporter_email` varchar(100) DEFAULT NULL,
  `reporter_phonenumber` varchar(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `officer_approve_username` varchar(50) DEFAULT NULL,
  `severity` varchar(220) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reports`
--

INSERT INTO `reports` (`report_id`, `type_report`, `description`, `case_location`, `reported_at`, `reporter_fullname`, `reporter_email`, `reporter_phonenumber`, `status`, `is_deleted`, `case_id`, `officer_approve_username`, `severity`) VALUES
(1, 'Theft', 'Shoplifting incident at local supermarket, suspect fled with goods.', 'District 1, Supermarket A', '2025-05-01 10:30:00.000000', 'Store Manager', 'managerA@shop.com', '0910000001', 'Approved', 0, 1, 'admin.john', 'high'),
(2, 'Assault', 'Minor altercation at a bar, victim sustained a cut.', 'District 3, Bar B', '2025-05-02 01:15:00.000000', 'Eyewitness', 'eye.witness@mail.com', '0910000002', 'Pending', 0, 2, 'det.kevin', NULL),
(3, 'Missing Person', 'Teenager missing since yesterday, last seen near park.', 'District 7, Central Park', '2025-05-03 16:00:00.000000', 'Parents', 'parents@mail.com', '0910000003', 'Approved', 0, 3, 'chief.robert', NULL),
(4, 'Burglary', 'Residence broken into, valuable electronics stolen.', 'Thu Duc City, Residential Area C', '2025-05-04 09:45:00.000000', 'Homeowner', 'homeowner@mail.com', '0910000004', 'Rejected', 0, 4, 'admin.john', NULL),
(5, 'Drug Related Incident', 'Suspicious drug activity observed in an alleyway.', 'District 10, Alley D', '2025-05-05 22:00:00.000000', 'Concerned Citizen', NULL, NULL, 'Pending', 0, 5, 'inv.mark', NULL),
(6, 'Traffic Accident', 'Two-car collision at intersection, no serious injuries.', 'District 5, Intersection E', '2025-05-06 14:00:00.000000', 'Patrol Officer', 'patrol.susan@police.gov', '0901000012', 'APPROVED', 0, 6, 'patrol.susan', 'LOW'),
(7, 'Fraud', 'Elderly victim defrauded of savings through online scam.', 'Binh Thanh District, Apartment F', '2025-05-07 11:00:00.000000', 'Daughter of Victim', 'daughter@mail.com', '0910000007', 'Pending', 0, 7, 'det.kevin', NULL),
(8, 'Vandalism', 'Public property defaced with graffiti.', 'Go Vap District, Public Wall G', '2025-05-08 07:30:00.000000', 'City Employee', 'employee@city.gov', '0910000008', 'PENDING', 0, 8, 'patrol.susan', 'HIGH'),
(9, 'Armed Robbery', 'Bank branch robbed, perpetrator fled with cash.', 'District 1, Bank H', '2025-05-09 10:00:00.000000', 'Bank Manager', 'managerH@bank.com', '0910000009', 'Approved', 0, 9, 'admin.john', NULL),
(10, 'Cyber Attack', 'Company servers breached, data stolen.', 'District 4, Tech Company I', '2025-05-10 13:45:00.000000', 'IT Security', 'security@companyI.com', '0910000010', 'Pending', 0, 10, 'cyber.anna', NULL),
(11, 'Homicide', 'Fatal stabbing incident, victim found in alley.', 'District 6, Alley J', '2025-05-11 03:00:00.000000', 'First Responder', 'responder@ems.gov', '0910000011', 'Approved', 0, 11, 'chief.robert', NULL),
(12, 'Kidnapping', 'Child abducted from park, ransom demand received.', 'District 2, Park K', '2025-05-12 17:00:00.000000', 'Family Member', 'family@mail.com', '0910000012', 'Pending', 0, 12, 'admin.john', NULL),
(13, 'Arson', 'Warehouse fire, believed to be intentionally set.', 'District 9, Warehouse L', '2025-05-13 20:30:00.000000', 'Fire Investigator', 'fire.inv@gov.vn', '0910000013', 'Approved', 0, 13, 'inv.mark', NULL),
(14, 'Counterfeiting', 'Discovery of fake currency in circulation.', 'District 11, Market M', '2025-05-14 11:00:00.000000', 'Shop Owner', 'ownerM@shop.com', '0910000014', 'Approved', 0, 14, 'inv.mark', NULL),
(15, 'Domestic Violence', 'Repeated domestic disputes reported at address.', 'Phu Nhuan District, House N', '2025-05-15 09:00:00.000000', 'Neighbor', 'neighborN@mail.com', '0910000015', 'APPROVED', 0, 15, 'patrol.susan', 'HIGH'),
(16, 'Human Trafficking', 'Suspicious activity indicating human trafficking.', 'District 8, Seaport Area O', '2025-05-16 16:00:00.000000', 'Undercover Agent', NULL, NULL, 'Pending', 0, 16, 'chief.robert', NULL),
(17, 'Smuggling', 'Contraband discovered in shipping container.', 'District 7, Port P', '2025-05-17 10:15:00.000000', 'Customs Officer', 'customs@gov.vn', '0910000017', 'Approved', 0, 17, 'inv.mark', NULL),
(18, 'Extortion', 'Business owner receiving threats for protection money.', 'District 1, Business Q', '2025-05-18 14:30:00.000000', 'Business Owner', 'ownerQ@business.com', '0910000018', 'Rejected', 0, 18, 'forensic.paul', NULL),
(19, 'Public Disturbance', 'Large protest turning violent, property damage.', 'District 1, City Square R', '2025-05-19 18:00:00.000000', 'News Reporter', 'reporterR@news.com', '0910000019', 'Approved', 0, 19, 'chief.robert', NULL),
(20, 'Animal Cruelty', 'Neglected animals found in abandoned house.', 'Binh Tan District, House S', '2025-05-20 09:00:00.000000', 'Animal Welfare Officer', 'welfare@org.com', '0910000020', 'REJECTED', 0, 20, 'patrol.susan', 'URGENT'),
(21, 'Theft', 'Motorbike theft reported from apartment building parking.', 'District 5, Apartment XYZ', '2025-05-21 07:00:00.000000', 'Resident', 'resident@mail.com', '0910000021', 'Pending', 0, 21, 'det.kevin', NULL),
(22, 'Assault', 'Street fight outside a nightclub.', 'District 1, Nightclub', '2025-05-22 03:00:00.000000', 'Bouncer', 'bouncer@club.com', '0910000022', 'Approved', 0, 22, 'inv.mark', NULL),
(66, 'Initial Response', 'Sample description 1', 'Park D', '2025-07-10 23:18:37.807020', 'Reporter 1', 'reporter1@example.com', '09090000', 'PENDING', 0, 2, 'officer3', 'MEDIUM'),
(67, 'Follow-up', 'Sample description 2', 'Alley C', '2025-07-10 22:18:37.810703', 'Reporter 2', 'reporter2@example.com', '09090001', 'PENDING', 0, 2, 'officer6', 'LOW'),
(68, 'Follow-up', 'Sample description 3', 'Alley C', '2025-07-10 04:18:37.812444', 'Reporter 3', 'reporter3@example.com', '09090002', 'PENDING', 0, 5, 'patrol.nancy', 'HIGH'),
(69, 'Scene Assessment', 'Sample description 4', 'Warehouse B', '2025-07-09 03:18:37.814054', 'Reporter 4', 'reporter4@example.com', '09090003', 'PENDING', 0, 3, 'officer9', 'LOW'),
(70, 'Initial Response', 'Sample description 5', 'Alley C', '2025-07-09 05:18:37.815595', 'Reporter 5', 'reporter5@example.com', '09090004', 'REJECTED', 0, 3, 'officer3', 'HIGH'),
(71, 'Scene Assessment', 'Sample description 6', 'Park D', '2025-07-08 17:18:37.817277', 'Reporter 6', 'reporter6@example.com', '09090005', 'APPROVED', 0, 1, 'officer1', 'URGENT'),
(72, 'Follow-up', 'Sample description 7', 'Bridge E', '2025-07-10 05:18:37.819186', 'Reporter 7', 'reporter7@example.com', '09090006', 'PENDING', 0, 2, 'officer9', 'HIGH'),
(73, 'Scene Assessment', 'Sample description 8', 'Warehouse B', '2025-07-10 16:18:37.821030', 'Reporter 8', 'reporter8@example.com', '09090007', 'PENDING', 0, 4, 'patrol.susan', 'LOW'),
(74, 'Follow-up', 'Sample description 9', 'Warehouse B', '2025-07-09 18:18:37.823089', 'Reporter 9', 'reporter9@example.com', '09090008', 'APPROVED', 0, 3, 'officer2', 'URGENT'),
(75, 'Initial Response', 'Sample description 10', 'Park D', '2025-07-09 04:18:37.825680', 'Reporter 10', 'reporter10@example.com', '09090009', 'APPROVED', 0, 4, 'officer10', 'MEDIUM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report_suspects`
--

CREATE TABLE `report_suspects` (
  `id` bigint(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `report_id` int(11) NOT NULL,
  `suspect_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `report_suspects`
--

INSERT INTO `report_suspects` (`id`, `is_deleted`, `report_id`, `suspect_id`) VALUES
(1, 0, 1, 1),
(2, 0, 1, 20),
(3, 0, 2, 2),
(4, 0, 3, 3),
(5, 0, 4, 4),
(6, 0, 5, 5),
(7, 0, 7, 7),
(8, 0, 9, 9),
(9, 0, 10, 10),
(10, 0, 11, 11),
(11, 0, 12, 12),
(12, 0, 13, 13),
(13, 0, 14, 14),
(14, 0, 16, 16),
(15, 0, 17, 17),
(16, 0, 18, 18),
(17, 0, 19, 19),
(18, 0, 20, 20),
(19, 0, 21, 20),
(20, 0, 22, 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report_victims`
--

CREATE TABLE `report_victims` (
  `id` bigint(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `report_id` int(11) NOT NULL,
  `victim_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `report_victims`
--

INSERT INTO `report_victims` (`id`, `is_deleted`, `report_id`, `victim_id`) VALUES
(1, 0, 1, 1),
(2, 0, 2, 2),
(3, 0, 3, 3),
(4, 0, 4, 4),
(5, 0, 5, 5),
(6, 0, 7, 6),
(7, 0, 9, 7),
(8, 0, 10, 8),
(9, 0, 11, 9),
(10, 0, 12, 10),
(11, 0, 13, 11),
(12, 0, 14, 12),
(13, 0, 15, 13),
(14, 0, 16, 14),
(15, 0, 17, 15),
(16, 0, 18, 16),
(17, 0, 19, 17),
(18, 0, 20, 18),
(19, 0, 21, 19),
(20, 0, 22, 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report_witnesses`
--

CREATE TABLE `report_witnesses` (
  `id` bigint(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `report_id` int(11) NOT NULL,
  `witness_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `report_witnesses`
--

INSERT INTO `report_witnesses` (`id`, `is_deleted`, `report_id`, `witness_id`) VALUES
(1, 0, 1, 1),
(2, 0, 1, 2),
(3, 0, 2, 3),
(4, 0, 2, 4),
(5, 0, 3, 5),
(6, 0, 3, 6),
(7, 0, 3, 7),
(8, 0, 4, 2),
(9, 0, 4, 8),
(10, 0, 5, 9),
(11, 0, 5, 10),
(12, 0, 6, 1),
(13, 0, 7, 3),
(14, 0, 7, 4),
(15, 0, 8, 5),
(16, 0, 9, 6),
(17, 0, 9, 7),
(18, 0, 10, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`role_id`, `description`, `is_deleted`) VALUES
(1, 'Admin', 0),
(2, 'Patrol Officer', 0),
(3, 'Investigator', 0),
(4, 'Forensic Analyst', 0),
(5, 'Prosecutor', 0),
(6, 'Financial Analyst', 0),
(7, 'Evidence Custodian', 0),
(8, 'Chief of Police', 0),
(9, 'Detective', 0),
(10, 'Cybercrime Specialist', 0),
(11, 'Report Approver', 0),
(12, 'Legal Counsel', 0),
(13, 'Records Manager', 0),
(14, 'Public Relations Officer', 0),
(15, 'Training Officer', 0),
(16, 'Field Officer', 0),
(17, 'Case Manager', 0),
(18, 'Security Analyst', 0),
(19, 'Witness Protection Officer', 0),
(20, 'Intelligence Analyst', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `is_deleted`, `permission_id`, `role_id`) VALUES
(1, 0, 1, 1),
(2, 0, 2, 1),
(3, 0, 3, 1),
(4, 0, 4, 1),
(5, 0, 5, 1),
(6, 0, 6, 1),
(7, 0, 7, 1),
(8, 0, 8, 1),
(9, 0, 9, 1),
(10, 0, 10, 1),
(11, 0, 11, 1),
(12, 0, 12, 1),
(13, 0, 13, 1),
(14, 0, 14, 1),
(15, 0, 15, 1),
(16, 0, 16, 1),
(17, 0, 17, 1),
(18, 0, 18, 1),
(19, 0, 19, 1),
(20, 0, 20, 1),
(21, 0, 21, 1),
(22, 0, 22, 1),
(23, 0, 23, 1),
(24, 0, 24, 1),
(25, 0, 25, 1),
(26, 0, 26, 1),
(27, 0, 27, 1),
(28, 0, 28, 1),
(29, 0, 29, 1),
(30, 0, 30, 1),
(31, 0, 31, 1),
(32, 0, 32, 1),
(33, 0, 1, 2),
(34, 0, 6, 2),
(35, 0, 7, 2),
(36, 0, 11, 2),
(37, 0, 14, 2),
(38, 0, 26, 2),
(39, 0, 27, 2),
(40, 0, 28, 2),
(41, 0, 1, 3),
(42, 0, 2, 3),
(43, 0, 3, 3),
(44, 0, 7, 3),
(45, 0, 11, 3),
(46, 0, 14, 3),
(47, 0, 15, 3),
(48, 0, 16, 3),
(49, 0, 20, 3),
(50, 0, 26, 3),
(51, 0, 27, 3),
(52, 0, 28, 3),
(53, 0, 29, 3),
(54, 0, 30, 3),
(55, 0, 1, 4),
(56, 0, 11, 4),
(57, 0, 12, 4),
(58, 0, 19, 4),
(59, 0, 21, 4),
(60, 0, 1, 5),
(61, 0, 21, 5),
(62, 0, 22, 5),
(63, 0, 23, 5),
(64, 0, 24, 5),
(65, 0, 1, 6),
(66, 0, 17, 6),
(67, 0, 21, 6),
(68, 0, 31, 6),
(69, 0, 1, 7),
(70, 0, 11, 7),
(71, 0, 1, 8),
(72, 0, 3, 8),
(73, 0, 5, 8),
(74, 0, 9, 8),
(75, 0, 10, 8),
(76, 0, 13, 8),
(77, 0, 21, 8),
(78, 0, 23, 8),
(79, 0, 24, 8),
(80, 0, 1, 9),
(81, 0, 2, 9),
(82, 0, 3, 9),
(83, 0, 7, 9),
(84, 0, 11, 9),
(85, 0, 14, 9),
(86, 0, 15, 9),
(87, 0, 16, 9),
(88, 0, 20, 9),
(89, 0, 21, 9),
(90, 0, 26, 9),
(91, 0, 27, 9),
(92, 0, 28, 9),
(93, 0, 29, 9),
(94, 0, 30, 9),
(95, 0, 31, 9),
(96, 0, 1, 10),
(97, 0, 11, 10),
(98, 0, 12, 10),
(99, 0, 21, 10),
(100, 0, 30, 10),
(101, 0, 1, 11),
(102, 0, 5, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `scene_descriptions`
--

CREATE TABLE `scene_descriptions` (
  `description_id` int(11) NOT NULL,
  `detail_description` longtext DEFAULT NULL,
  `important_object_locations` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `scene_response_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `scene_descriptions`
--

INSERT INTO `scene_descriptions` (`description_id`, `detail_description`, `important_object_locations`, `is_deleted`, `scene_response_id`) VALUES
(1, 'Broken glass near cashier desk, blood stains found.', 'Glass near entrance, blood on aisle 2.', 0, 1),
(2, 'Victim lying face down near sofa, signs of struggle.', 'Sofa, coffee table overturned.', 0, 2),
(3, 'Skid marks on road, damaged guardrail.', 'Guardrail section, point of impact.', 0, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `scene_preservations`
--

CREATE TABLE `scene_preservations` (
  `preservation_id` int(11) NOT NULL,
  `officer_name` varchar(100) DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `protection_methods` longtext DEFAULT NULL,
  `area_covered` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `attachment_url` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `scene_response_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `scene_preservations`
--

INSERT INTO `scene_preservations` (`preservation_id`, `officer_name`, `start_time`, `end_time`, `protection_methods`, `area_covered`, `notes`, `attachment_url`, `is_deleted`, `scene_response_id`) VALUES
(1, 'Officer Mike', '2025-05-01 13:00:00.000000', '2025-05-01 16:00:00.000000', 'Crime scene tape, guarded entry', 'Main hall & entrance', 'Secured until forensic team arrival.', 'http://scene.com/preservation1.jpg', 0, 1),
(2, 'Officer Lisa', '2025-05-03 09:45:00.000000', '2025-05-03 12:00:00.000000', 'Locked doors, access list maintained', 'Living room & hallway', 'No unauthorized access noted.', 'http://scene.com/preservation2.jpg', 0, 2),
(3, 'Officer Kevin', '2025-05-06 14:30:00.000000', '2025-05-06 17:00:00.000000', 'Traffic cones, police vehicle block', 'Intersection area', 'Controlled traffic during investigation.', 'http://scene.com/preservation3.jpg', 0, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `scene_responses`
--

CREATE TABLE `scene_responses` (
  `scene_response_id` int(11) NOT NULL,
  `dispatch_time` datetime(6) DEFAULT NULL,
  `arrival_time` datetime(6) DEFAULT NULL,
  `preliminary_assessment` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `scene_responses`
--

INSERT INTO `scene_responses` (`scene_response_id`, `dispatch_time`, `arrival_time`, `preliminary_assessment`, `is_deleted`, `case_id`) VALUES
(1, '2025-05-01 12:30:00.000000', '2025-05-01 12:50:00.000000', 'Initial assessment showed forced entry at supermarket.', 0, 1),
(2, '2025-05-03 09:15:00.000000', '2025-05-03 09:30:00.000000', 'Victim found unconscious; no witnesses present.', 0, 2),
(3, '2025-05-06 14:00:00.000000', '2025-05-06 14:25:00.000000', 'Vehicle collision; debris scattered across road.', 0, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `scene_statements`
--

CREATE TABLE `scene_statements` (
  `statement_id` int(11) NOT NULL,
  `provider_name` varchar(100) DEFAULT NULL,
  `statement_date` date DEFAULT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `file_url` longtext DEFAULT NULL,
  `statement_content` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `scene_response_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `scene_statements`
--

INSERT INTO `scene_statements` (`statement_id`, `provider_name`, `statement_date`, `contact_info`, `role`, `file_url`, `statement_content`, `is_deleted`, `scene_response_id`) VALUES
(1, 'John Smith', '2025-05-01', 'john.smith@email.com', 'Witness', 'http://scene.com/statement1.pdf', 'Saw a masked individual leaving quickly.', 0, 1),
(2, 'Mary Johnson', '2025-05-03', 'mary.j@email.com', 'Neighbor', 'http://scene.com/statement2.pdf', 'Heard loud noises around 9 AM.', 0, 2),
(3, 'Tom Brown', '2025-05-06', 'tom.brown@email.com', 'Driver', 'http://scene.com/statement3.pdf', 'Saw the car lose control before the crash.', 0, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sentences`
--

CREATE TABLE `sentences` (
  `sentence_id` int(11) NOT NULL,
  `sentence_type` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `condition` longtext DEFAULT NULL,
  `sentencing_date` date DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `case_result_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sentences`
--

INSERT INTO `sentences` (`sentence_id`, `sentence_type`, `duration`, `condition`, `sentencing_date`, `is_deleted`, `case_id`, `case_result_id`) VALUES
(1, 'Imprisonment', '6 months', 'No parole', '2025-07-15', 0, 1, 1),
(2, 'Imprisonment', '2 years', 'Parole eligibility after 1 year', '2025-07-01', 0, 5, 5),
(3, 'Imprisonment', '1 year', 'Community service after release', '2025-07-01', 0, 14, 14),
(4, 'Community Service', '80 hours', 'Must attend anger management', '2025-07-05', 0, 19, 19),
(5, 'Probation', '6 months', 'No further incidents', '2025-07-10', 0, 22, 2),
(6, 'Imprisonment', '3 months', 'Good behavior', '2025-07-15', 0, 22, 5),
(7, 'Fine', '1000 USD', 'Paid within 30 days', '2025-07-05', 0, 22, 19),
(8, 'Life Imprisonment', 'Life', 'No parole', '2025-09-01', 0, 11, 11),
(9, 'Imprisonment', '15 years', 'No early release', '2025-09-05', 0, 12, 12),
(10, 'Imprisonment', '10 years', 'Cooperation with authorities', '2025-09-10', 0, 16, 16),
(11, 'Imprisonment', '5 years', 'Repayment of extorted funds', '2025-09-15', 0, 18, 18),
(12, 'Fine', '500 USD', 'Attend animal welfare classes', '2025-07-10', 0, 20, 20),
(13, 'Probation', '1 year', 'Regular check-ins', '2025-07-16', 0, 1, 1),
(14, 'Fine', '2000 USD', 'Paid within 60 days', '2025-07-02', 0, 5, 5),
(15, 'Community Service', '120 hours', 'Supervised by officer', '2025-07-02', 0, 14, 14),
(16, 'Imprisonment', '1 month', 'No contact with co-defendants', '2025-07-06', 0, 19, 19),
(17, 'Imprisonment', '6 months', 'Parole after 3 months', '2025-08-01', 0, 21, 1),
(18, 'Fine', '750 USD', 'Paid within 45 days', '2025-08-02', 0, 21, 2),
(19, 'Community Service', '40 hours', 'Complete within 90 days', '2025-07-06', 0, 22, 19),
(20, 'Reparations', '1000 USD', 'Paid to victim', '2025-07-17', 0, 1, 1),
(21, 'Drug Rehabilitation', '6 months', 'Mandatory attendance', '2025-07-03', 0, 5, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `state_holidays`
--

CREATE TABLE `state_holidays` (
  `state_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `holiday_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `state_holidays`
--

INSERT INTO `state_holidays` (`state_id`, `is_deleted`, `holiday_id`) VALUES
(1, 0, 1),
(1, 0, 2),
(1, 0, 3),
(1, 0, 4),
(1, 0, 5),
(1, 0, 6),
(1, 0, 7),
(1, 0, 8),
(1, 0, 9),
(1, 0, 10),
(1, 0, 11),
(2, 0, 1),
(2, 0, 2),
(2, 0, 3),
(2, 0, 4),
(2, 0, 5),
(2, 0, 6),
(2, 0, 7),
(2, 0, 8),
(2, 0, 9),
(2, 0, 10),
(3, 0, 1),
(3, 0, 2),
(3, 0, 3),
(3, 0, 4),
(3, 0, 5),
(3, 0, 6),
(3, 0, 7),
(3, 0, 8),
(3, 0, 9),
(3, 0, 10),
(4, 0, 1),
(4, 0, 2),
(4, 0, 3),
(4, 0, 4),
(4, 0, 5),
(4, 0, 6),
(4, 0, 7),
(4, 0, 8),
(4, 0, 9),
(4, 0, 10),
(4, 0, 12),
(5, 0, 1),
(5, 0, 2),
(5, 0, 3),
(5, 0, 4),
(5, 0, 5),
(5, 0, 6),
(5, 0, 7),
(5, 0, 8),
(5, 0, 9),
(5, 0, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suspects`
--

CREATE TABLE `suspects` (
  `suspect_id` int(11) NOT NULL,
  `suspect_role` varchar(50) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `national` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `identification` varchar(50) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `catch_time` datetime(6) DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `mugshot_url` longtext DEFAULT NULL,
  `fingerprints_hash` longtext DEFAULT NULL,
  `health_status` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `suspects`
--

INSERT INTO `suspects` (`suspect_id`, `suspect_role`, `fullname`, `national`, `gender`, `dob`, `identification`, `phonenumber`, `description`, `address`, `catch_time`, `notes`, `status`, `mugshot_url`, `fingerprints_hash`, `health_status`, `is_deleted`, `case_id`, `report_id`) VALUES
(1, 'Primary Suspect', 'Suspect A', 'Vietnam', 'Male', '1990-01-01', 'ID123456789', '0987654321', 'Known shoplifter.', 'District 1, Apt 101', '2025-05-01 12:00:00.000000', 'Prior convictions for theft.', 'Apprehended', 'https://example.com/mugshots/suspectA.jpg', 'hash123', 'Healthy', 0, 1, NULL),
(2, 'Primary Suspect', 'Suspect B', 'Vietnam', 'Male', '1985-03-15', 'ID987654321', '0987654322', 'Involved in bar fight, denies assault.', 'District 3, House 202', NULL, 'Cooperative.', 'Identified', NULL, NULL, 'Healthy', 0, 2, NULL),
(3, 'Missing Person', 'Suspect C (Missing Person)', 'Unknown', 'Male', '1992-07-20', 'Unknown', '0987654321', 'Person of interest in teenager disappearance.', 'Unknown', NULL, 'High risk.', 'At Large', NULL, NULL, 'Unknown', 0, 3, NULL),
(4, 'Primary Suspect', 'Suspect D', 'Unknown', 'Male', '1992-07-20', 'Unknown', '0987654321', 'Suspect in multiple burglaries.', 'Unknown', NULL, 'High risk.', 'At Large', NULL, NULL, 'Unknown', 0, 4, NULL),
(5, 'Primary Suspect', 'Suspect E', 'Vietnam', 'Female', '1998-09-05', 'ID112233445', '0987654323', 'Drug dealer, caught with substances.', 'District 10, Condo 303', '2025-05-05 23:00:00.000000', 'Resisted arrest.', 'Apprehended', 'https://example.com/mugshots/suspectE.jpg', 'hash456', 'Healthy', 0, 5, NULL),
(6, 'Scammer', 'Scammer F', 'Unknown', 'Male', '1970-11-25', 'N/A', '0987654324', 'Online fraudster, difficult to trace.', 'Online IP', NULL, 'Sophisticated methods.', 'At Large', NULL, NULL, 'Unknown', 0, 7, NULL),
(7, 'Robber', 'Robber G', 'Vietnam', 'Male', '1980-02-10', 'ID556677889', '0987654325', 'Armed robbery suspect, dangerous.', 'District 1, Safe House', NULL, 'Believed to be part of a gang.', 'At Large', NULL, NULL, 'Unknown', 0, 9, NULL),
(8, 'Hacker', 'Hacker H', 'Foreign', 'Unknown', '2000-04-30', 'N/A', '0987654321', 'Cybercriminal, likely state-sponsored.', 'Dark Web', NULL, 'Highly skilled.', 'At Large', NULL, NULL, 'Unknown', 0, 10, NULL),
(9, 'Primary Suspect', 'Suspect I (Homicide)', 'Vietnam', 'Male', '1993-06-08', 'ID998877665', '0987654326', 'Primary suspect in fatal stabbing.', 'District 6, Apt 404', NULL, 'Violent history.', 'Identified', NULL, NULL, 'Unknown', 0, 11, NULL),
(10, 'Kidnapper', 'Kidnapper J', 'Vietnam', 'Female', '1975-08-12', 'ID443322110', '0987654327', 'Kidnapping suspect, linked to organized crime.', 'District 2, Hidden Lair', NULL, 'Demanding ransom.', 'At Large', NULL, NULL, 'Unknown', 0, 12, NULL),
(11, 'Arsonist', 'Arsonist K', 'Vietnam', 'Male', '1988-10-01', 'ID102030405', '0987654328', 'Suspect in multiple arson cases.', 'District 9, Old Factory', NULL, 'Psychological issues.', 'Identified', NULL, NULL, 'Unknown', 0, 13, NULL),
(12, 'Counterfeiter', 'Counterfeiter L', 'Vietnam', 'Male', '1972-12-20', 'ID504030201', '0987654329', 'Caught distributing fake currency.', 'District 11, Printing Shop', '2025-05-14 12:00:00.000000', 'Cooperative.', 'Apprehended', 'https://example.com/mugshots/suspectL.jpg', 'hash789', 'Healthy', 0, 14, NULL),
(13, 'Leader', 'Trafficker M', 'Foreign', 'Male', '1980-01-01', 'PassportXYZ', '0987654330', 'Leader of human trafficking ring.', 'Undisclosed location', NULL, 'International connections.', 'At Large', NULL, NULL, 'Unknown', 0, 16, NULL),
(14, 'Smuggler', 'Smuggler N', 'Vietnam', 'Male', '1970-03-01', 'ID667788990', '0987654331', 'Involved in large-scale contraband smuggling.', 'Port Area', NULL, 'Well-connected.', 'Identified', NULL, NULL, 'Unknown', 0, 17, NULL),
(15, 'Extortionist', 'Extortionist O', 'Vietnam', 'Male', '1985-05-01', 'ID112233446', '0987654332', 'Demanding protection money.', 'Local Gang HQ', NULL, 'Gang member.', 'Identified', NULL, NULL, 'Unknown', 0, 18, NULL),
(16, 'Rioter', 'Rioter P', 'Vietnam', 'Male', '2000-07-01', 'ID778899001', '0987654333', 'Participated in violent protest.', 'City Square', '2025-05-19 19:00:00.000000', 'Previously arrested for similar acts.', 'Apprehended', 'https://example.com/mugshots/suspectP.jpg', 'hash012', 'Healthy', 0, 19, NULL),
(17, 'Owner', 'Cruelty Suspect Q', 'Vietnam', 'Female', '1995-09-01', 'ID223344556', '0987654334', 'Owner of neglected animals.', 'Binh Tan District, House S', NULL, 'Known for hoarding.', 'Identified', NULL, NULL, 'Unknown', 0, 20, NULL),
(18, 'Thief', 'Motorbike Thief R', 'Vietnam', 'Male', '1993-02-05', 'ID334455667', '0987654335', 'Known for motorbike theft.', 'District 5, Back Alley', NULL, 'Prior convictions.', 'Identified', NULL, NULL, 'Healthy', 0, 21, NULL),
(19, 'Instigator', 'Fighter S', 'Vietnam', 'Male', '1991-04-20', 'ID445566778', '0987654336', 'Instigator of street fight.', 'District 1, Nightclub', '2025-05-22 03:45:00.000000', 'Aggressive behavior.', 'Apprehended', 'https://example.com/mugshots/suspectS.jpg', 'hash345', 'Healthy', 0, 22, NULL),
(20, 'Accomplice', 'Suspect T', 'Vietnam', 'Female', '1993-02-05', 'ID334455668', '0987654339', 'Accomplice in shoplifting.', 'District 1, Apt 102', '2025-05-01 12:15:00.000000', 'Minor role.', 'Apprehended', 'https://example.com/mugshots/suspectT.jpg', 'hash346', 'Healthy', 0, 1, NULL),
(26, 'Suspect', 'nn', 'n', 'male', NULL, 'dc15209d-76b', NULL, 'n', 'Unknown', NULL, '', '', NULL, NULL, 'Unknown', 0, NULL, NULL),
(27, 'Suspect', 'đ', 'đ', 'other', NULL, '8fcfffd0-5ca', NULL, 'đ', 'Unknown', NULL, '', '', NULL, NULL, 'Unknown', 0, NULL, NULL),
(28, 'Suspect', 'f', 'f', 'female', NULL, 'e7bf7a6e-9b9', NULL, 'f', 'Unknown', NULL, '', '', NULL, NULL, 'Unknown', 0, NULL, NULL),
(29, 'Suspect', 'v', 'vv', 'other', NULL, 'cfc11a70-4ce', NULL, 'vv', 'Unknown', NULL, '', '', NULL, NULL, 'Unknown', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suspect_evidences`
--

CREATE TABLE `suspect_evidences` (
  `id` bigint(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `evidence_id` int(11) NOT NULL,
  `suspect_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `suspect_evidences`
--

INSERT INTO `suspect_evidences` (`id`, `is_deleted`, `evidence_id`, `suspect_id`) VALUES
(1, 0, 1, 1),
(2, 0, 2, 1),
(3, 0, 5, 4),
(4, 0, 6, 4),
(5, 0, 7, 5),
(6, 0, 9, 7),
(7, 0, 10, 9),
(8, 0, 11, 9),
(9, 0, 12, 10),
(10, 0, 13, 11),
(11, 0, 14, 12),
(12, 0, 15, 13),
(13, 0, 16, 14),
(14, 0, 17, 16),
(15, 0, 18, 17),
(16, 0, 19, 18),
(17, 0, 20, 19),
(18, 0, 21, 20),
(19, 0, 22, 20),
(20, 0, 23, 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `timelines`
--

CREATE TABLE `timelines` (
  `timeline_id` int(11) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `attached_file` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `activity` longtext DEFAULT NULL,
  `holiday_conflict` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_result_id` int(11) DEFAULT NULL,
  `holiday_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `timelines`
--

INSERT INTO `timelines` (`timeline_id`, `start_time`, `end_time`, `attached_file`, `notes`, `activity`, `holiday_conflict`, `is_deleted`, `case_result_id`, `holiday_id`) VALUES
(1, '2025-07-01 09:00:00.000000', '2025-07-01 10:00:00.000000', NULL, NULL, 'Legal Proceeding', 1, 0, 1, 3),
(2, '2025-07-15 10:00:00.000000', '2025-07-15 11:00:00.000000', NULL, NULL, 'Legal Proceeding', 0, 0, 1, 1),
(3, '2025-06-16 09:00:00.000000', '2025-06-16 10:00:00.000000', NULL, NULL, 'Legal Proceeding', 0, 0, 2, 4),
(4, '2025-07-06 14:00:00.000000', '2025-07-06 15:00:00.000000', NULL, NULL, 'Investigation Update', 0, 0, 3, 5),
(5, '2025-07-11 10:00:00.000000', '2025-07-11 11:00:00.000000', NULL, NULL, 'Case Management', 0, 0, 4, 6),
(6, '2025-06-19 10:00:00.000000', '2025-06-19 11:00:00.000000', NULL, NULL, 'Legal Proceeding', 1, 0, 5, 2),
(7, '2025-06-11 14:00:00.000000', '2025-06-11 15:00:00.000000', NULL, NULL, 'Case Resolution', 0, 0, 6, 7),
(8, '2025-07-21 09:00:00.000000', '2025-07-21 10:00:00.000000', NULL, NULL, 'Investigation Update', 0, 0, 7, 8),
(9, '2025-07-26 11:00:00.000000', '2025-07-26 12:00:00.000000', NULL, NULL, 'Investigation Update', 0, 0, 9, 9),
(10, '2025-08-02 10:00:00.000000', '2025-08-02 11:00:00.000000', NULL, NULL, 'Technical Resolution', 0, 0, 10, 10),
(11, '2025-08-09 10:00:00.000000', '2025-08-09 11:00:00.000000', NULL, NULL, 'Legal Proceeding', 1, 0, 11, 4),
(12, '2025-08-16 14:00:00.000000', '2025-08-16 15:00:00.000000', NULL, NULL, 'Investigation Update', 0, 0, 12, 11),
(13, '2025-07-31 10:00:00.000000', '2025-07-31 11:00:00.000000', NULL, NULL, 'Investigation Update', 0, 0, 13, 12),
(14, '2025-06-26 10:00:00.000000', '2025-06-26 11:00:00.000000', NULL, NULL, 'Legal Proceeding', 1, 0, 14, 1),
(15, '2025-07-02 10:00:00.000000', '2025-07-02 11:00:00.000000', NULL, NULL, 'Legal Proceeding', 0, 0, 15, 13),
(16, '2025-08-26 10:00:00.000000', '2025-08-26 11:00:00.000000', NULL, NULL, 'Investigation Update', 0, 0, 16, 14),
(17, '2025-08-06 10:00:00.000000', '2025-08-06 11:00:00.000000', NULL, NULL, 'Investigation Update', 0, 0, 17, 12),
(18, '2025-08-13 10:00:00.000000', '2025-08-13 11:00:00.000000', NULL, NULL, 'Investigation Update', 0, 0, 18, 5),
(19, '2025-06-29 10:00:00.000000', '2025-06-29 11:00:00.000000', NULL, NULL, 'Legal Proceeding', 0, 0, 19, 4),
(20, '2025-07-03 10:00:00.000000', '2025-07-03 11:00:00.000000', NULL, NULL, 'Case Resolution', 0, 0, 20, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password_hash` longtext DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `presentstatus` longtext NOT NULL,
  `avatar_url` longtext DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `zone` longtext NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`username`, `password_hash`, `fullname`, `presentstatus`, `avatar_url`, `email`, `phonenumber`, `zone`, `create_at`, `is_deleted`, `role_id`) VALUES
('admin.john', 'pbkdf2_sha256$1000000$oFxkMZk50NN7HVGYHn9XOE$yvvyMMtAsgquHQPFn47q8obQdfl224QwbXaQ/RV0DRM=', 'John Smith', 'Idle', 'https://i.pinimg.com/736x/c6/e5/65/c6e56503cfdd87da299f72dc416023d4.jpg', 'john.smith@police.gov', '0901000001', 'Sector 5, District 2', '2024-01-15 10:00:00.000000', 0, 1),
('case.xavier', 'pbkdf2_sha256$1000000$95Wufof26wsU3ZKcoSz6ZK$q3Oc85flTtv6F9xtmTOwPIYiFlzClkMznGzu8oWPboU=', 'Xavier Nash', 'Idle', 'https://example.com/avatars/xavier.jpg', 'xavier.n@police.gov', '0901000024', 'Sector 5, District 2', '2024-05-30 13:00:00.000000', 0, 17),
('chief.robert', 'pbkdf2_sha256$1000000$66uLKdJWFmy8Utc2FQonNm$BZTpZGN3Tn2rR4NKD+VX2zFlbOKg+VoQoxVLay2eJd8=', 'Robert Lee', 'Idle', 'https://i.pinimg.com/736x/c6/e5/65/c6e56503cfdd87da299f72dc416023d4.jpg', 'robert.l@police.gov', '0901000008', 'Sector 5, District 2', '2023-11-01 09:00:00.000000', 0, 8),
('cyber.anna', 'pbkdf2_sha256$1000000$AB8F9mGQ8IY7hoWINwytPH$iSmTOjCDR/ALaK4rrMS1vhYWFFdawd5HNzY4RZMQPfU=', 'Anna Chen', 'Idle', 'https://example.com/avatars/anna.jpg', 'anna.c@police.gov', '0901000010', 'Sector 5, District 2', '2024-03-01 11:00:00.000000', 0, 10),
('cyber.peter', 'pbkdf2_sha256$1000000$NZXJDd0hYgXdQmIsS2dULy$aDEPDfJZNyeb0W+M9nHF5DEKx5AlOV+N3O4AZi6GIns=', 'Peter Adams', 'Idle', 'https://example.com/avatars/peter.jpg', 'peter.a@police.gov', '0901000018', 'Sector 5, District 2', '2024-11-01 10:00:00.000000', 0, 10),
('det.kevin', 'pbkdf2_sha256$1000000$Qp0VvXvglalyMTF9jCBPK8$LtENuBbFN0UK75zpxl+OP9Grt1Adi8xyJrBgvAUguks=', 'Kevin Hall', 'Idle', 'https://example.com/avatars/kevin.jpg', 'kevin.h@police.gov', '0901000017', 'Sector 5, District 2', '2024-10-01 13:00:00.000000', 0, 9),
('det.lisa', 'pbkdf2_sha256$1000000$H2z3ifdMGL0ZdTbXhpDFGK$K2LvsTXT3WuimtGEN3HrOwE6jyVw9iAzs90BkQlztP0=', 'Lisa Wong', 'Idle', 'https://example.com/avatars/lisa.jpg', 'lisa.w@police.gov', '0901000009', 'Sector 5, District 2', '2024-01-20 15:00:00.000000', 0, 9),
('evidence.david', 'pbkdf2_sha256$1000000$y2oK4VS2Z2if2h9eqLCnTA$x95BMBJf/tyiPkb1+ZKJKqG1kCy0GLv1iKzCDR8xzRM=', 'David Black', 'Idle', 'https://example.com/avatars/david.jpg', 'david.b@police.gov', '0901000007', 'Sector 5, District 2', '2024-07-10 13:00:00.000000', 0, 7),
('field.ursula', 'pbkdf2_sha256$1000000$mNPePR0Aq23aUFafEnd08e$DfEbJCZfPJuCKd7xek+Et+5pJFdG+fGTIfiuC7vA+B4=', 'Ursula Lane', 'Idle', 'https://example.com/avatars/ursula.jpg', 'ursula.l@police.gov', '0901000023', 'Sector 5, District 2', '2024-04-25 12:00:00.000000', 0, 16),
('fin.emily', 'pbkdf2_sha256$1000000$j54L7gB6sgyVPRau4U8sqp$hDOW0HTASdJGNPAG2wgrTikE5k7W+6WEUFzv6oiunLc=', 'Emily Grey', 'Idle', 'https://example.com/avatars/emily.jpg', 'emily.g@police.gov', '0901000006', 'Sector 5, District 2', '2024-06-01 10:00:00.000000', 0, 6),
('forensic.paul', 'pbkdf2_sha256$1000000$cakclXUxiS9UUUnqM5J3cM$Yhndyu0jwc3rxiBT49lvCikFUNeMsjh4JdS2ccZMNrE=', 'Paul Wilson', 'Idle', 'https://example.com/avatars/paul.jpg', 'paul.w@police.gov', '0901000013', 'Sector 5, District 2', '2024-06-15 14:00:00.000000', 0, 4),
('forensic.sarah', 'pbkdf2_sha256$1000000$n49fZbPkVlXfG3OW636hTl$RaIhfWeVIq39X/vFycMsrVsONCulMpXpgb5rC7MKw4k=', 'Sarah Green', 'Idle', 'https://example.com/avatars/sarah.jpg', 'sarah.g@police.gov', '0901000004', 'Sector 5, District 2', '2024-04-05 14:00:00.000000', 0, 4),
('inv.mark', 'pbkdf2_sha256$1000000$DQ4VyFVjNftcWA1uTBa2eJ$HEbpDwWEOLMCTXdC4U4qKS0SaObGvFit53IgNV1jn8k=', 'Mark Davis', 'Idle', 'https://example.com/avatars/mark.jpg', 'mark.d@police.gov', '0901000011', 'Sector 5, District 2', '2024-04-10 12:00:00.000000', 0, 3),
('inv.mike', 'pbkdf2_sha256$1000000$L5gzwXk2NfFljqUHMjrrt9$offnpHC53UnW64diLi8nadWoMlF6sb4BAZZ9M/4QARE=', 'Mike Brown', 'Idle', 'https://example.com/avatars/mike.jpg', 'mike.b@police.gov', '0901000003', 'Sector 5, District 2', '2024-03-10 09:00:00.000000', 0, 3),
('inv.rachel', 'pbkdf2_sha256$1000000$LLM7m8A1S8UAmTptk532bz$6XPKrf7USr/J3/ArEo50P4c47y91u529q/USDv3/sIY=', 'Rachel Scott', 'Idle', 'https://example.com/avatars/rachel.jpg', 'rachel.s@police.gov', '0901000019', 'Sector 5, District 2', '2024-12-01 12:00:00.000000', 0, 3),
('inv.tom', 'pbkdf2_sha256$1000000$5pF1CsAEEZgacLJ7PMYw9J$oAuuOsA3aq+vtDrSf1m9To6Zor9m70TCjlZFgl8Jj2w=', 'Tom Roberts', 'Idle', 'https://example.com/avatars/tom.jpg', 'tom.r@police.gov', '0901000015', 'Sector 5, District 2', '2024-08-01 11:00:00.000000', 0, 3),
('officer1', 'pbkdf2_sha256$...$...', 'Officer 1', 'Idle', '', 'officer1@example.com', '0900000001', 'Sector 5, District 2', '2025-07-11 07:08:28.766384', 0, 2),
('officer10', 'pbkdf2_sha256$...$...', 'Officer 10', 'Idle', '', 'officer10@example.com', '0900000010', 'Sector 5, District 2', '2025-07-11 07:08:28.797252', 0, 2),
('officer2', 'pbkdf2_sha256$...$...', 'Officer 2', 'Idle', '', 'officer2@example.com', '0900000002', 'Sector 5, District 2', '2025-07-11 07:08:28.770792', 0, 2),
('officer3', 'pbkdf2_sha256$...$...', 'Officer 3', 'Idle', '', 'officer3@example.com', '0900000003', 'Sector 5, District 2', '2025-07-11 07:08:28.773735', 0, 2),
('officer4', 'pbkdf2_sha256$...$...', 'Officer 4', 'Idle', '', 'officer4@example.com', '0900000004', 'Sector 5, District 2', '2025-07-11 07:08:28.776354', 0, 2),
('officer5', 'pbkdf2_sha256$...$...', 'Officer 5', 'Idle', '', 'officer5@example.com', '0900000005', 'Sector 5, District 2', '2025-07-11 07:08:28.780057', 0, 2),
('officer6', 'pbkdf2_sha256$...$...', 'Officer 6', 'Idle', '', 'officer6@example.com', '0900000006', 'Sector 5, District 2', '2025-07-11 07:08:28.783214', 0, 2),
('officer7', 'pbkdf2_sha256$...$...', 'Officer 7', 'Idle', '', 'officer7@example.com', '0900000007', 'Sector 5, District 2', '2025-07-11 07:08:28.787352', 0, 2),
('officer8', 'pbkdf2_sha256$...$...', 'Officer 8', 'Idle', '', 'officer8@example.com', '0900000008', 'Sector 5, District 2', '2025-07-11 07:08:28.790427', 0, 2),
('officer9', 'pbkdf2_sha256$...$...', 'Officer 9', 'Idle', '', 'officer9@example.com', '0900000009', 'Sector 5, District 2', '2025-07-11 07:08:28.793509', 0, 2),
('patrol.jane', 'pbkdf2_sha256$1000000$Kh2aERAz1hHKbPiJSebAOF$LaVUlz1rTr1uzOm8FMsKJSWdy/130/53lthasq3kfLw=', 'Jane Doe', 'On Above Case', 'https://example.com/avatars/jane.jpg', 'jane.doe@police.gov', '0901000002', 'Sector 5, District 2', '2024-02-01 11:30:00.000000', 0, 2),
('patrol.nancy', 'pbkdf2_sha256$1000000$qkJoVzRBAz2OcBP0VxcJs6$oplF4iEnbPOONBf5J59/Qc/6E5gVXF5GbV+gx/U2OU4=', 'Nancy Clark', 'Idle', 'https://example.com/avatars/nancy.jpg', 'nancy.c@police.gov', '0901000016', 'Sector 5, District 2', '2024-09-01 08:30:00.000000', 0, 2),
('patrol.steve', 'pbkdf2_sha256$1000000$v9hKw1apbSvmoLnPaoLpHd$02CS6BS3eI/oLB4Fu/95OAG6VaqoBBmwmYEV9W5uF6U=', 'Steve Baker', 'On Call', 'https://example.com/avatars/steve.jpg', 'steve.b@police.gov', '0901000020', 'Sector 5, District 2', '2025-01-01 09:00:00.000000', 0, 2),
('patrol.susan', 'pbkdf2_sha256$1000000$H1xcaz8xV08A57mSO73fGx$s0MUOXXtuMo9Sg8MPLBudS8Vrw9thEds1760JSPZvXc=', 'Susan Miller', 'Idle', 'https://example.com/avatars/susan.jpg', 'susan.m@police.gov', '0901000012', 'Sector 5, District 2', '2024-05-01 09:30:00.000000', 0, 2),
('pros.chris', 'pbkdf2_sha256$1000000$favpS9jsl0AzPKbt9VrKON$x4b30PFwFi61GAhZ1H47C/1Tp/woUFvYDn8BZOhh3+U=', 'Chris White', 'Idle', 'https://example.com/avatars/chris.jpg', 'chris.w@police.gov', '0901000005', 'Sector 5, District 2', '2024-05-20 08:00:00.000000', 0, 5),
('pros.olivia', 'pbkdf2_sha256$1000000$Ldenx7yegB3lCZdFwSQ12T$eg1FxusbGBvt+qtXixBa07ogU6E8HoWVQf+99SD2akI=', 'Olivia Taylor', 'Idle', 'https://example.com/avatars/olivia.jpg', 'olivia.t@police.gov', '0901000014', 'Sector 5, District 2', '2024-07-20 10:00:00.000000', 0, 5),
('records.wendy', 'pbkdf2_sha256$1000000$LO19G5eQFC7E0ttESfdclW$NE1WgLxnCDlg+LrJM/RcUCb36eYYOkJfWux7HPpvVq0=', 'Wendy King', 'Idle', 'https://example.com/avatars/wendy.jpg', 'wendy.k@police.gov', '0901000022', 'Sector 5, District 2', '2024-03-20 11:00:00.000000', 0, 13),
('repapp.victor', 'pbkdf2_sha256$1000000$BEiZmU5XgLRqUYRxB7xPJO$UGxdY4kkm4W6rioxIx1fxnCUBGqEBBhB3YcdcVWhgDg=', 'Victor Young', 'Idle', 'https://i.pinimg.com/736x/c6/e5/65/c6e56503cfdd87da299f72dc416023d4.jpg', 'victor.y@police.gov', '0901000021', 'Sector 5, District 2', '2024-02-15 10:00:00.000000', 0, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_cases`
--

CREATE TABLE `user_cases` (
  `id` bigint(20) NOT NULL,
  `responsible` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_id` int(11) NOT NULL,
  `officer_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_cases`
--

INSERT INTO `user_cases` (`id`, `responsible`, `is_deleted`, `case_id`, `officer_id`) VALUES
(1, 0, 0, 1, 'det.lisa'),
(2, 1, 0, 1, 'inv.mike'),
(3, 1, 0, 2, 'det.lisa'),
(4, 0, 0, 2, 'inv.mike'),
(5, 0, 0, 3, 'det.lisa'),
(6, 1, 0, 3, 'inv.mike'),
(7, 0, 0, 4, 'det.kevin'),
(8, 1, 0, 4, 'det.lisa'),
(9, 0, 0, 5, 'inv.mark'),
(10, 1, 0, 5, 'inv.mike'),
(11, 1, 0, 6, 'patrol.susan'),
(12, 0, 0, 7, 'det.kevin'),
(13, 1, 0, 7, 'det.lisa'),
(14, 0, 0, 8, 'patrol.nancy'),
(15, 1, 0, 8, 'patrol.susan'),
(16, 0, 0, 9, 'det.kevin'),
(17, 1, 0, 9, 'det.lisa'),
(18, 1, 0, 10, 'cyber.anna'),
(19, 0, 0, 10, 'cyber.peter'),
(20, 0, 0, 11, 'det.kevin'),
(21, 1, 0, 11, 'det.lisa'),
(22, 1, 0, 12, 'det.lisa'),
(23, 0, 0, 12, 'inv.mike'),
(24, 1, 0, 13, 'inv.mike'),
(25, 0, 0, 13, 'inv.tom'),
(26, 1, 0, 14, 'inv.mike'),
(27, 0, 0, 14, 'inv.tom'),
(28, 0, 0, 15, 'patrol.nancy'),
(29, 1, 0, 15, 'patrol.susan'),
(30, 0, 0, 16, 'det.kevin'),
(31, 1, 0, 16, 'det.lisa'),
(32, 1, 0, 17, 'inv.mike'),
(33, 0, 0, 17, 'inv.tom'),
(34, 0, 0, 18, 'det.kevin'),
(35, 1, 0, 18, 'det.lisa'),
(36, 0, 0, 19, 'patrol.nancy'),
(37, 1, 0, 19, 'patrol.susan'),
(38, 0, 0, 20, 'patrol.nancy'),
(39, 1, 0, 20, 'patrol.susan'),
(40, 1, 0, 21, 'inv.mike'),
(41, 0, 0, 21, 'inv.tom'),
(42, 0, 0, 22, 'patrol.nancy'),
(43, 1, 0, 22, 'patrol.susan');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `victims`
--

CREATE TABLE `victims` (
  `victim_id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `injurie` longtext DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `victims`
--

INSERT INTO `victims` (`victim_id`, `fullname`, `contact`, `injurie`, `status`, `is_deleted`, `case_id`, `report_id`) VALUES
(1, 'Supermarket A', 'managerA@shop.com', 'Financial loss', 'Affected', 0, 1, NULL),
(2, 'Bob Williams', 'bob.w@mail.com', 'Cut on arm', 'Stable', 0, 2, NULL),
(3, 'Charlie Brown', 'charlie.b@mail.com', 'Missing person', 'Critical', 0, 3, NULL),
(4, 'Diana Prince', 'diana.p@mail.com', 'No physical injury', 'Distressed', 0, 4, NULL),
(5, 'Concerned Citizen', 'citizen@mail.com', 'Psychological distress', 'Stable', 0, 5, NULL),
(6, 'Elderly Victim A', 'victimA@mail.com', 'Financial loss', 'Distressed', 0, 7, NULL),
(7, 'Bank ABC', 'manager@bankabc.com', 'Financial loss', 'Affected', 0, 9, NULL),
(8, 'Tech Company I', 'it@companyI.com', 'Data breach', 'Affected', 0, 10, NULL),
(9, 'Ethan Hunt', 'ethan.h@mail.com', 'Fatal wound', 'Deceased', 0, 11, NULL),
(10, 'Fiona Glenanne', 'fiona.g@mail.com', 'Abducted', 'Critical', 0, 12, NULL),
(11, 'Warehouse L Owner', 'ownerL@mail.com', 'Property loss', 'Affected', 0, 13, NULL),
(12, 'Shop Owner M', 'ownerM@shop.com', 'Financial loss', 'Affected', 0, 14, NULL),
(13, 'Grace Hopper', 'grace.h@mail.com', 'Emotional distress', 'Distressed', 0, 15, NULL),
(14, 'Human Trafficking Victim 1', 'N/A', 'Physical trauma', 'Critical', 0, 16, NULL),
(15, 'Customs Agency', 'customs@gov.vn', 'Financial loss', 'Affected', 0, 17, NULL),
(16, 'Business Q Owner', 'ownerQ@business.com', 'Threatened', 'Distressed', 0, 18, NULL),
(17, 'Local Resident R', 'residentR@mail.com', 'Property damage', 'Affected', 0, 19, NULL),
(18, 'Abandoned Dog 1', 'N/A', 'Malnourished', 'Recovering', 0, 20, NULL),
(19, 'Motorbike Owner Z', 'ownerZ@mail.com', 'Property loss', 'Distressed', 0, 21, NULL),
(20, 'Nightclub Bouncer', 'bouncer@club.com', 'Minor bruises', 'Stable', 0, 22, NULL),
(21, 'Employee 1 (Supermarket A)', 'emp1@shop.com', 'Emotional distress', 'Stable', 0, 1, NULL),
(22, 'Family of Charlie Brown', 'family.cb@mail.com', 'Emotional distress', 'Critical', 0, 3, NULL),
(37, 'bbb', 'Unknown', 'bbb', '', 0, NULL, NULL),
(38, 'ff', 'Unknown', 'ff', '', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `victim_interviews`
--

CREATE TABLE `victim_interviews` (
  `id` bigint(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `interview_id` int(11) NOT NULL,
  `victim_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `victim_interviews`
--

INSERT INTO `victim_interviews` (`id`, `is_deleted`, `interview_id`, `victim_id`) VALUES
(1, 0, 1, 1),
(2, 0, 2, 1),
(3, 0, 3, 2),
(4, 0, 4, 3),
(5, 0, 5, 4),
(6, 0, 6, 5),
(7, 0, 7, 6),
(8, 0, 9, 7),
(9, 0, 9, 8),
(10, 0, 9, 9),
(11, 0, 12, 10),
(12, 0, 13, 11),
(13, 0, 12, 12),
(14, 0, 15, 13),
(15, 0, 14, 14),
(16, 0, 16, 16),
(17, 0, 18, 18),
(18, 0, 17, 20),
(19, 0, 17, 21),
(20, 0, 18, 22);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warrants`
--

CREATE TABLE `warrants` (
  `warrant_id` int(11) NOT NULL,
  `warrant_name` varchar(255) DEFAULT NULL,
  `attached_file` longtext DEFAULT NULL,
  `time_pulish` datetime(6) DEFAULT NULL,
  `warrant_status` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `officer_username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `warrants`
--

INSERT INTO `warrants` (`warrant_id`, `warrant_name`, `attached_file`, `time_pulish`, `warrant_status`, `is_deleted`, `case_id`, `officer_username`) VALUES
(21, 'Search Warrant Supermarket', 'http://warrant.com/warrant_1.pdf', '2025-05-01 13:00:00.000000', 'Issued', 0, 1, 'inv.mike'),
(22, 'Search Warrant Residence', 'http://warrant.com/warrant_2.pdf', '2025-05-04 12:00:00.000000', 'Executed', 0, 4, 'det.lisa'),
(23, 'Arrest Warrant Suspect E', 'http://warrant.com/warrant_3.pdf', '2025-05-05 23:30:00.000000', 'Executed', 0, 5, 'inv.mike'),
(24, 'Search Warrant Bank Robbery', 'http://warrant.com/warrant_4.pdf', '2025-05-09 12:00:00.000000', 'Issued', 0, 9, 'det.lisa'),
(25, 'Arrest Warrant Robber G', 'http://warrant.com/warrant_5.pdf', '2025-05-09 12:15:00.000000', 'Pending', 0, 9, 'det.kevin'),
(26, 'Search Warrant Cyber Suspect', 'http://warrant.com/warrant_6.pdf', '2025-05-10 15:30:00.000000', 'Issued', 0, 10, 'cyber.anna'),
(27, 'Arrest Warrant Suspect I (Homicide)', 'http://warrant.com/warrant_7.pdf', '2025-05-11 05:00:00.000000', 'Executed', 0, 11, 'det.lisa'),
(28, 'Search Warrant Kidnapping', 'http://warrant.com/warrant_8.pdf', '2025-05-12 18:30:00.000000', 'Issued', 0, 12, 'inv.mike'),
(29, 'Arrest Warrant Kidnapper J', 'http://warrant.com/warrant_9.pdf', '2025-05-12 18:45:00.000000', 'Executed', 0, 12, 'det.kevin'),
(30, 'Search Warrant Arson Site', 'http://warrant.com/warrant_10.pdf', '2025-05-13 22:00:00.000000', 'Executed', 0, 13, 'det.lisa'),
(31, 'Search Warrant Counterfeiting', 'http://warrant.com/warrant_11.pdf', '2025-05-14 13:00:00.000000', 'Issued', 0, 14, 'inv.mike'),
(32, 'Arrest Warrant Counterfeiter L', 'http://warrant.com/warrant_12.pdf', '2025-05-14 13:15:00.000000', 'Executed', 0, 14, 'inv.tom'),
(33, 'Search Warrant Trafficking Hub', 'http://warrant.com/warrant_13.pdf', '2025-05-16 17:30:00.000000', 'Executed', 0, 16, 'det.lisa'),
(34, 'Arrest Warrant Trafficker M', 'http://warrant.com/warrant_14.pdf', '2025-05-16 17:45:00.000000', 'Executed', 0, 16, 'det.kevin'),
(35, 'Search Warrant Smuggling Container', 'http://warrant.com/warrant_15.pdf', '2025-05-17 12:00:00.000000', 'Issued', 0, 17, 'inv.mike'),
(36, 'Search Warrant Extortionist HQ', 'http://warrant.com/warrant_16.pdf', '2025-05-18 16:00:00.000000', 'Issued', 0, 18, 'det.lisa'),
(37, 'Arrest Warrant Extortionist O', 'http://warrant.com/warrant_17.pdf', '2025-05-18 16:15:00.000000', 'Pending', 0, 18, 'det.kevin'),
(38, 'Search Warrant Animal Cruelty', 'http://warrant.com/warrant_18.pdf', '2025-05-20 10:30:00.000000', 'Executed', 0, 20, 'patrol.susan'),
(39, 'Search Warrant Motorbike Thief', 'http://warrant.com/warrant_19.pdf', '2025-05-21 09:00:00.000000', 'Issued', 0, 21, 'inv.mike'),
(40, 'Arrest Warrant Fighter S', 'http://warrant.com/warrant_20.pdf', '2025-05-22 04:30:00.000000', 'Executed', 0, 22, 'patrol.susan');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warrant_evidences`
--

CREATE TABLE `warrant_evidences` (
  `id` bigint(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `evidence_id` int(11) NOT NULL,
  `warrant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `warrant_evidences`
--

INSERT INTO `warrant_evidences` (`id`, `is_deleted`, `evidence_id`, `warrant_id`) VALUES
(1, 0, 1, 21),
(2, 0, 2, 21),
(3, 0, 23, 21),
(4, 0, 1, 22),
(5, 0, 4, 22),
(6, 0, 5, 22),
(7, 0, 2, 23),
(8, 0, 7, 23),
(9, 0, 3, 24),
(10, 0, 10, 24),
(11, 0, 12, 26),
(12, 0, 13, 27),
(13, 0, 14, 28),
(14, 0, 15, 30),
(15, 0, 16, 31),
(16, 0, 17, 33),
(17, 0, 18, 35),
(18, 0, 19, 36),
(19, 0, 21, 38),
(20, 0, 22, 39);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warrant_results`
--

CREATE TABLE `warrant_results` (
  `warrant_result_id` int(11) NOT NULL,
  `police_response` longtext DEFAULT NULL,
  `location` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `time_active` datetime(6) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `warrant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `warrant_results`
--

INSERT INTO `warrant_results` (`warrant_result_id`, `police_response`, `location`, `notes`, `time_active`, `is_deleted`, `warrant_id`) VALUES
(1, 'Executed successfully', 'Supermarket A', 'CCTV footage and packaging seized.', '2025-05-01 13:30:00.000000', 0, 21),
(2, 'Executed successfully', 'Residence C', 'Electronics recovered, fingerprints found.', '2025-05-04 12:30:00.000000', 0, 22),
(3, 'Suspect apprehended', 'Condo 303', 'Suspect E taken into custody, narcotics found.', '2025-05-05 23:45:00.000000', 0, 23),
(4, 'Executed, partial findings', 'Bank H', 'CCTV footage secured, no direct evidence on premises.', '2025-05-09 12:45:00.000000', 0, 24),
(5, 'Suspect at large', 'Safe House', 'Warrant executed, suspect not found at location.', '2025-05-09 13:00:00.000000', 0, 25),
(6, 'Executed successfully', 'Tech Company I', 'Server logs and network data obtained.', '2025-05-10 16:00:00.000000', 0, 26),
(7, 'Suspect apprehended', 'Apt 404', 'Suspect I taken into custody, weapon recovered nearby.', '2025-05-11 05:30:00.000000', 0, 27),
(8, 'Executed, partial findings', 'Park K', 'Child\'s belongings found, no sign of child.', '2025-05-12 19:00:00.000000', 0, 28),
(9, 'Suspect at large', 'Hidden Lair', 'Warrant executed, suspect not found, signs of recent occupancy.', '2025-05-12 19:15:00.000000', 0, 29),
(10, 'Executed successfully', 'Warehouse L', 'Accelerant samples collected.', '2025-05-13 22:30:00.000000', 0, 30),
(11, 'Executed successfully', 'Printing Shop', 'Counterfeit currency and printing equipment seized.', '2025-05-14 13:45:00.000000', 0, 31),
(12, 'Suspect apprehended', 'Printing Shop', 'Suspect L taken into custody.', '2025-05-14 14:00:00.000000', 0, 32),
(13, 'Executed successfully', 'Trafficking Hub', 'Evidence of trafficking operations found, no suspects present.', '2025-05-16 18:00:00.000000', 0, 33),
(14, 'Suspect apprehended', 'Trafficking Hub', 'Suspect M taken into custody.', '2025-05-16 18:15:00.000000', 0, 34),
(15, 'Executed successfully', 'Port P', 'Contraband found and seized from container.', '2025-05-17 12:30:00.000000', 0, 35),
(16, 'Executed, partial findings', 'Local Gang HQ', 'Threatening materials found, suspect not present.', '2025-05-18 16:45:00.000000', 0, 36),
(17, 'Suspect apprehended', 'Local Gang HQ', 'Suspect O taken into custody.', '2025-05-18 17:00:00.000000', 0, 37),
(18, 'Executed successfully', 'House S', 'Neglected animals removed, evidence collected.', '2025-05-20 11:00:00.000000', 0, 38),
(19, 'Executed, no suspect', 'Apartment XYZ', 'Motorbike not found, but similar tools were.', '2025-05-21 09:30:00.000000', 0, 39),
(20, 'Suspect apprehended', 'Nightclub', 'Suspect S taken into custody.', '2025-05-22 04:45:00.000000', 0, 40);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `witnesses`
--

CREATE TABLE `witnesses` (
  `witness_id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `statement` longtext DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `witnesses`
--

INSERT INTO `witnesses` (`witness_id`, `fullname`, `contact`, `statement`, `is_deleted`, `case_id`, `report_id`) VALUES
(1, 'Witness A.1', 'witnessA1@mail.com', 'Saw suspect running from supermarket.', 0, 1, NULL),
(2, 'Witness B.1', 'witnessB1@mail.com', 'Observed the fight start.', 0, 2, NULL),
(3, 'Witness C.1', 'witnessC1@mail.com', 'Last person to see the missing teenager.', 0, 3, NULL),
(4, 'Witness D.1', 'witnessD1@mail.com', 'Neighbor heard strange noises.', 0, 4, NULL),
(5, 'Witness E.1', 'witnessE1@mail.com', 'Reported drug activity.', 0, 5, NULL),
(6, 'Witness F.1', 'witnessF1@mail.com', 'Saw the traffic accident happen.', 0, 6, NULL),
(7, 'Witness G.1', 'witnessG1@mail.com', 'Helped elderly victim after the scam.', 0, 7, NULL),
(8, 'Witness H.1', 'witnessH1@mail.com', 'Saw teenagers near the vandalized wall.', 0, 8, NULL),
(9, 'Witness I.1', 'witnessI1@mail.com', 'Inside the bank during robbery.', 0, 9, NULL),
(10, 'Witness J.1', 'witnessJ1@mail.com', 'IT staff who detected the breach.', 0, 10, NULL),
(11, 'Witness K.1', 'witnessK1@mail.com', 'Found the victim of the homicide.', 0, 11, NULL),
(12, 'Witness L.1', 'witnessL1@mail.com', 'Saw the child being taken from the park.', 0, 12, NULL),
(13, 'Witness M.1', 'witnessM1@mail.com', 'Saw smoke before the fire.', 0, 13, NULL),
(14, 'Witness N.1', 'witnessN1@mail.com', 'Received fake currency.', 0, 14, NULL),
(15, 'Witness O.1', 'witnessO1@mail.com', 'Neighbor reported loud arguments.', 0, 15, NULL),
(16, 'Witness P.1', 'witnessP1@mail.com', 'Reported suspicious activity related to human trafficking.', 0, 16, NULL),
(17, 'Witness Q.1', 'witnessQ1@mail.com', 'Customs officer who found contraband.', 0, 17, NULL),
(18, 'Witness R.1', 'witnessR1@mail.com', 'Employee overheard threats.', 0, 18, NULL),
(19, 'Witness S.1', 'witnessS1@mail.com', 'Participated in the protest, saw violence.', 0, 19, NULL),
(20, 'Witness T.1', 'witnessT1@mail.com', 'Reported animal neglect.', 0, 20, NULL),
(21, 'Witness U.1', 'witnessU1@mail.com', 'Saw the motorbike being stolen.', 0, 21, NULL),
(22, 'Witness V.1', 'witnessV1@mail.com', 'Saw the street fight from afar.', 0, 22, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `witness_interviews`
--

CREATE TABLE `witness_interviews` (
  `id` bigint(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `interview_id` int(11) NOT NULL,
  `witness_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `witness_interviews`
--

INSERT INTO `witness_interviews` (`id`, `is_deleted`, `interview_id`, `witness_id`) VALUES
(65, 0, 1, 1),
(66, 0, 3, 2),
(67, 0, 5, 4),
(68, 0, 6, 5),
(69, 0, 8, 6),
(70, 0, 9, 8),
(71, 0, 9, 9),
(72, 0, 10, 10),
(73, 0, 11, 11),
(74, 0, 13, 13),
(75, 0, 14, 14),
(76, 0, 17, 17),
(77, 0, 17, 19),
(78, 0, 1, 21),
(79, 0, 17, 21),
(80, 0, 17, 22);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `arrests`
--
ALTER TABLE `arrests`
  ADD PRIMARY KEY (`arrest_id`),
  ADD KEY `arrests_holiday_id_782ecb30_fk_holidays_holiday_id` (`holiday_id`),
  ADD KEY `arrests_officer_id_ed4cf8e7_fk_users_username` (`officer_id`),
  ADD KEY `arrests_suspect_id_849f527f_fk_suspects_suspect_id` (`suspect_id`);

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`case_id`),
  ADD UNIQUE KEY `case_number` (`case_number`);

--
-- Chỉ mục cho bảng `case_arrests`
--
ALTER TABLE `case_arrests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `case_arrests_arrest_id_case_id_c93394b2_uniq` (`arrest_id`,`case_id`),
  ADD KEY `case_arrests_case_id_8830d6be_fk_cases_case_id` (`case_id`);

--
-- Chỉ mục cho bảng `case_evidences`
--
ALTER TABLE `case_evidences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `case_evidences_case_id_evidence_id_27c9d327_uniq` (`case_id`,`evidence_id`),
  ADD KEY `case_evidences_evidence_id_4c069ac2_fk_evidences_evidence_id` (`evidence_id`);

--
-- Chỉ mục cho bảng `case_results`
--
ALTER TABLE `case_results`
  ADD PRIMARY KEY (`case_result_id`),
  ADD KEY `case_results_case_id_dd55f331_fk_cases_case_id` (`case_id`);

--
-- Chỉ mục cho bảng `digital_invest_results`
--
ALTER TABLE `digital_invest_results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `digital_invest_resul_evidence_id_6bf164fe_fk_evidences` (`evidence_id`),
  ADD KEY `digital_invest_resul_investigation_plan_i_732ffc08_fk_investiga` (`investigation_plan_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `events_case_id_5b5df543_fk_cases_case_id` (`case_id`),
  ADD KEY `events_holiday_id_98527ddc_fk_holidays_holiday_id` (`holiday_id`),
  ADD KEY `events_suspect_id_68cb981a_fk_suspects_suspect_id` (`suspect_id`);

--
-- Chỉ mục cho bảng `evidences`
--
ALTER TABLE `evidences`
  ADD PRIMARY KEY (`evidence_id`),
  ADD KEY `evidences_case_id_edd5e374_fk_cases_case_id` (`case_id`),
  ADD KEY `evidences_collector_username_2c336256_fk_users_username` (`collector_username`),
  ADD KEY `evidences_measure_survey_id_a39b9f31_fk_measure_s` (`measure_survey_id`),
  ADD KEY `evidences_report_id_5ffae24c_fk_reports_report_id` (`report_id`),
  ADD KEY `evidences_warrant_result_id_bebee19c_fk_warrant_r` (`warrant_result_id`);

--
-- Chỉ mục cho bảng `financial_invests`
--
ALTER TABLE `financial_invests`
  ADD PRIMARY KEY (`evidence_id`);

--
-- Chỉ mục cho bảng `forensic_invest_results`
--
ALTER TABLE `forensic_invest_results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `forensic_invest_resu_evidence_id_50f352d9_fk_evidences` (`evidence_id`),
  ADD KEY `forensic_invest_resu_investigation_plan_i_416740a9_fk_investiga` (`investigation_plan_id`);

--
-- Chỉ mục cho bảng `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`holiday_id`),
  ADD KEY `holidays_holiday_type_id_58988bcf_fk_holiday_t` (`holiday_type_id`);

--
-- Chỉ mục cho bảng `holiday_observances`
--
ALTER TABLE `holiday_observances`
  ADD PRIMARY KEY (`observance_id`),
  ADD KEY `holiday_observances_holiday_id_94a640f4_fk_holidays_holiday_id` (`holiday_id`);

--
-- Chỉ mục cho bảng `holiday_types`
--
ALTER TABLE `holiday_types`
  ADD PRIMARY KEY (`holiday_type_id`);

--
-- Chỉ mục cho bảng `indictments`
--
ALTER TABLE `indictments`
  ADD PRIMARY KEY (`indictments_id`),
  ADD KEY `indictments_prosecution_id_df4ce827_fk_prosecuti` (`prosecution_id`);

--
-- Chỉ mục cho bảng `inmates`
--
ALTER TABLE `inmates`
  ADD PRIMARY KEY (`inmate_id`),
  ADD KEY `inmates_sentence_id_cb935b1b_fk_sentences_sentence_id` (`sentence_id`);

--
-- Chỉ mục cho bảng `interviews`
--
ALTER TABLE `interviews`
  ADD PRIMARY KEY (`interview_id`),
  ADD KEY `interviews_holiday_id_4a1eca7b_fk_holidays_holiday_id` (`holiday_id`),
  ADD KEY `interviews_interviewer_id_dba7baab_fk_users_username` (`interviewer_id`),
  ADD KEY `interviews_investigation_plan_i_e06b4cf5_fk_investiga` (`investigation_plan_id`);

--
-- Chỉ mục cho bảng `investigation_plans`
--
ALTER TABLE `investigation_plans`
  ADD PRIMARY KEY (`investigation_plan_id`),
  ADD KEY `investigation_plans_accepted_officer_use_64ac9e68_fk_users_use` (`accepted_officer_username`),
  ADD KEY `investigation_plans_case_id_165b2b16_fk_cases_case_id` (`case_id`),
  ADD KEY `investigation_plans_created_officer_user_c0eb6ad3_fk_users_use` (`created_officer_username`),
  ADD KEY `investigation_plans_holiday_id_f6fd97f8_fk_holidays_holiday_id` (`holiday_id`);

--
-- Chỉ mục cho bảng `measure_surveys`
--
ALTER TABLE `measure_surveys`
  ADD PRIMARY KEY (`measure_survey_id`);

--
-- Chỉ mục cho bảng `medical_supports`
--
ALTER TABLE `medical_supports`
  ADD PRIMARY KEY (`support_id`),
  ADD KEY `medical_supports_scene_response_id_f6387a45_fk_scene_res` (`scene_response_id`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission_id`);

--
-- Chỉ mục cho bảng `physical_invest_results`
--
ALTER TABLE `physical_invest_results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `physical_invest_resu_evidence_id_ab3dfe38_fk_evidences` (`evidence_id`),
  ADD KEY `physical_invest_resu_investigation_plan_i_1a71134e_fk_investiga` (`investigation_plan_id`);

--
-- Chỉ mục cho bảng `prosecutions`
--
ALTER TABLE `prosecutions`
  ADD PRIMARY KEY (`prosecution_id`),
  ADD KEY `prosecutions_case_id_2075dca0_fk_cases_case_id` (`case_id`),
  ADD KEY `prosecutions_prosecutor_id_fc8b3fdd_fk_users_username` (`prosecutor_id`);

--
-- Chỉ mục cho bảng `prosecution_suspects`
--
ALTER TABLE `prosecution_suspects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prosecution_suspects_prosecution_id_suspect_id_2c8eed4f_uniq` (`prosecution_id`,`suspect_id`),
  ADD KEY `prosecution_suspects_suspect_id_6530cf59_fk_suspects_suspect_id` (`suspect_id`);

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `questions_created_by_9031f676_fk_users_username` (`created_by`),
  ADD KEY `questions_interview_id_9af3b2b0_fk_interviews_interview_id` (`interview_id`);

--
-- Chỉ mục cho bảng `record_infos`
--
ALTER TABLE `record_infos`
  ADD PRIMARY KEY (`record_info_id`),
  ADD KEY `record_infos_evidence_id_00ce4f3a_fk_evidences_evidence_id` (`evidence_id`);

--
-- Chỉ mục cho bảng `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `reports_case_id_203ed236_fk_cases_case_id` (`case_id`),
  ADD KEY `reports_officer_approve_username_7ac6f2d3_fk_users_username` (`officer_approve_username`);

--
-- Chỉ mục cho bảng `report_suspects`
--
ALTER TABLE `report_suspects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_suspects_report_id_suspect_id_299df6de_uniq` (`report_id`,`suspect_id`),
  ADD KEY `report_suspects_suspect_id_148cbc3e_fk_suspects_suspect_id` (`suspect_id`);

--
-- Chỉ mục cho bảng `report_victims`
--
ALTER TABLE `report_victims`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_victims_report_id_victim_id_4e642d41_uniq` (`report_id`,`victim_id`),
  ADD KEY `report_victims_victim_id_705c735e_fk_victims_victim_id` (`victim_id`);

--
-- Chỉ mục cho bảng `report_witnesses`
--
ALTER TABLE `report_witnesses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_witnesses_report_id_witness_id_dea858f6_uniq` (`report_id`,`witness_id`),
  ADD KEY `report_witnesses_witness_id_b8c8bdb6_fk_witnesses_witness_id` (`witness_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_permissions_role_id_permission_id_04f77df0_uniq` (`role_id`,`permission_id`),
  ADD KEY `role_permissions_permission_id_ad343843_fk_permissio` (`permission_id`);

--
-- Chỉ mục cho bảng `scene_descriptions`
--
ALTER TABLE `scene_descriptions`
  ADD PRIMARY KEY (`description_id`),
  ADD KEY `scene_descriptions_scene_response_id_5c7cece6_fk_scene_res` (`scene_response_id`);

--
-- Chỉ mục cho bảng `scene_preservations`
--
ALTER TABLE `scene_preservations`
  ADD PRIMARY KEY (`preservation_id`),
  ADD KEY `scene_preservations_scene_response_id_425bd48c_fk_scene_res` (`scene_response_id`);

--
-- Chỉ mục cho bảng `scene_responses`
--
ALTER TABLE `scene_responses`
  ADD PRIMARY KEY (`scene_response_id`),
  ADD KEY `scene_responses_case_id_c6eb1391_fk_cases_case_id` (`case_id`);

--
-- Chỉ mục cho bảng `scene_statements`
--
ALTER TABLE `scene_statements`
  ADD PRIMARY KEY (`statement_id`),
  ADD KEY `scene_statements_scene_response_id_fa5ceebe_fk_scene_res` (`scene_response_id`);

--
-- Chỉ mục cho bảng `sentences`
--
ALTER TABLE `sentences`
  ADD PRIMARY KEY (`sentence_id`),
  ADD KEY `sentences_case_id_2a414284_fk_cases_case_id` (`case_id`),
  ADD KEY `sentences_case_result_id_d3e8cbcc_fk_case_results_case_result_id` (`case_result_id`);

--
-- Chỉ mục cho bảng `state_holidays`
--
ALTER TABLE `state_holidays`
  ADD PRIMARY KEY (`state_id`,`holiday_id`),
  ADD KEY `state_holidays_holiday_id_0046af55_fk_holidays_holiday_id` (`holiday_id`);

--
-- Chỉ mục cho bảng `suspects`
--
ALTER TABLE `suspects`
  ADD PRIMARY KEY (`suspect_id`),
  ADD KEY `suspects_case_id_05376449_fk_cases_case_id` (`case_id`),
  ADD KEY `suspects_report_id_c5d5d9d7_fk_reports_report_id` (`report_id`);

--
-- Chỉ mục cho bảng `suspect_evidences`
--
ALTER TABLE `suspect_evidences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suspect_evidences_suspect_id_evidence_id_2a4a33b2_uniq` (`suspect_id`,`evidence_id`),
  ADD KEY `suspect_evidences_evidence_id_adb08bf7_fk_evidences_evidence_id` (`evidence_id`);

--
-- Chỉ mục cho bảng `timelines`
--
ALTER TABLE `timelines`
  ADD PRIMARY KEY (`timeline_id`),
  ADD KEY `timelines_case_result_id_d3901d00_fk_case_results_case_result_id` (`case_result_id`),
  ADD KEY `timelines_holiday_id_9f7d6807_fk_holidays_holiday_id` (`holiday_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD KEY `users_role_id_1900a745_fk_roles_role_id` (`role_id`);

--
-- Chỉ mục cho bảng `user_cases`
--
ALTER TABLE `user_cases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_cases_case_id_officer_id_4da14b03_uniq` (`case_id`,`officer_id`),
  ADD KEY `user_cases_officer_id_f014f54b_fk_users_username` (`officer_id`);

--
-- Chỉ mục cho bảng `victims`
--
ALTER TABLE `victims`
  ADD PRIMARY KEY (`victim_id`),
  ADD KEY `victims_case_id_717d41a2_fk_cases_case_id` (`case_id`),
  ADD KEY `victims_report_id_cdf57390_fk_reports_report_id` (`report_id`);

--
-- Chỉ mục cho bảng `victim_interviews`
--
ALTER TABLE `victim_interviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `victim_interviews_victim_id_interview_id_fc163618_uniq` (`victim_id`,`interview_id`),
  ADD KEY `victim_interviews_interview_id_8fd78ea4_fk_interview` (`interview_id`);

--
-- Chỉ mục cho bảng `warrants`
--
ALTER TABLE `warrants`
  ADD PRIMARY KEY (`warrant_id`),
  ADD KEY `warrants_case_id_7a993950_fk_cases_case_id` (`case_id`),
  ADD KEY `warrants_officer_username_8fe799a5_fk_users_username` (`officer_username`);

--
-- Chỉ mục cho bảng `warrant_evidences`
--
ALTER TABLE `warrant_evidences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warrant_evidences_warrant_id_evidence_id_fd7f6e46_uniq` (`warrant_id`,`evidence_id`),
  ADD KEY `warrant_evidences_evidence_id_571d32ca_fk_evidences_evidence_id` (`evidence_id`);

--
-- Chỉ mục cho bảng `warrant_results`
--
ALTER TABLE `warrant_results`
  ADD PRIMARY KEY (`warrant_result_id`),
  ADD KEY `warrant_results_warrant_id_2f69c5df_fk_warrants_warrant_id` (`warrant_id`);

--
-- Chỉ mục cho bảng `witnesses`
--
ALTER TABLE `witnesses`
  ADD PRIMARY KEY (`witness_id`),
  ADD KEY `witnesses_case_id_ae2875d5_fk_cases_case_id` (`case_id`),
  ADD KEY `witnesses_report_id_ffdb2f5b_fk_reports_report_id` (`report_id`);

--
-- Chỉ mục cho bảng `witness_interviews`
--
ALTER TABLE `witness_interviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `witness_interviews_witness_id_interview_id_e87d38d9_uniq` (`witness_id`,`interview_id`),
  ADD KEY `witness_interviews_interview_id_81e5e155_fk_interview` (`interview_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `arrests`
--
ALTER TABLE `arrests`
  MODIFY `arrest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cases`
--
ALTER TABLE `cases`
  MODIFY `case_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `case_arrests`
--
ALTER TABLE `case_arrests`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `case_evidences`
--
ALTER TABLE `case_evidences`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `case_results`
--
ALTER TABLE `case_results`
  MODIFY `case_result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `digital_invest_results`
--
ALTER TABLE `digital_invest_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `evidences`
--
ALTER TABLE `evidences`
  MODIFY `evidence_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `forensic_invest_results`
--
ALTER TABLE `forensic_invest_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `holidays`
--
ALTER TABLE `holidays`
  MODIFY `holiday_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `holiday_observances`
--
ALTER TABLE `holiday_observances`
  MODIFY `observance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `holiday_types`
--
ALTER TABLE `holiday_types`
  MODIFY `holiday_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `indictments`
--
ALTER TABLE `indictments`
  MODIFY `indictments_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `inmates`
--
ALTER TABLE `inmates`
  MODIFY `inmate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `interviews`
--
ALTER TABLE `interviews`
  MODIFY `interview_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `investigation_plans`
--
ALTER TABLE `investigation_plans`
  MODIFY `investigation_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `measure_surveys`
--
ALTER TABLE `measure_surveys`
  MODIFY `measure_survey_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `medical_supports`
--
ALTER TABLE `medical_supports`
  MODIFY `support_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `physical_invest_results`
--
ALTER TABLE `physical_invest_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `prosecutions`
--
ALTER TABLE `prosecutions`
  MODIFY `prosecution_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `prosecution_suspects`
--
ALTER TABLE `prosecution_suspects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `record_infos`
--
ALTER TABLE `record_infos`
  MODIFY `record_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT cho bảng `report_suspects`
--
ALTER TABLE `report_suspects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `report_victims`
--
ALTER TABLE `report_victims`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `report_witnesses`
--
ALTER TABLE `report_witnesses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT cho bảng `scene_descriptions`
--
ALTER TABLE `scene_descriptions`
  MODIFY `description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `scene_preservations`
--
ALTER TABLE `scene_preservations`
  MODIFY `preservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `scene_responses`
--
ALTER TABLE `scene_responses`
  MODIFY `scene_response_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `scene_statements`
--
ALTER TABLE `scene_statements`
  MODIFY `statement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sentences`
--
ALTER TABLE `sentences`
  MODIFY `sentence_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `suspects`
--
ALTER TABLE `suspects`
  MODIFY `suspect_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `suspect_evidences`
--
ALTER TABLE `suspect_evidences`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `timelines`
--
ALTER TABLE `timelines`
  MODIFY `timeline_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `user_cases`
--
ALTER TABLE `user_cases`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `victims`
--
ALTER TABLE `victims`
  MODIFY `victim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `victim_interviews`
--
ALTER TABLE `victim_interviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `warrants`
--
ALTER TABLE `warrants`
  MODIFY `warrant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `warrant_evidences`
--
ALTER TABLE `warrant_evidences`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `warrant_results`
--
ALTER TABLE `warrant_results`
  MODIFY `warrant_result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `witnesses`
--
ALTER TABLE `witnesses`
  MODIFY `witness_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `witness_interviews`
--
ALTER TABLE `witness_interviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `arrests`
--
ALTER TABLE `arrests`
  ADD CONSTRAINT `arrests_holiday_id_782ecb30_fk_holidays_holiday_id` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`holiday_id`),
  ADD CONSTRAINT `arrests_officer_id_ed4cf8e7_fk_users_username` FOREIGN KEY (`officer_id`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `arrests_suspect_id_849f527f_fk_suspects_suspect_id` FOREIGN KEY (`suspect_id`) REFERENCES `suspects` (`suspect_id`);

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `case_arrests`
--
ALTER TABLE `case_arrests`
  ADD CONSTRAINT `case_arrests_arrest_id_8d2f7248_fk_arrests_arrest_id` FOREIGN KEY (`arrest_id`) REFERENCES `arrests` (`arrest_id`),
  ADD CONSTRAINT `case_arrests_case_id_8830d6be_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`);

--
-- Các ràng buộc cho bảng `case_evidences`
--
ALTER TABLE `case_evidences`
  ADD CONSTRAINT `case_evidences_case_id_e8416ebe_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`),
  ADD CONSTRAINT `case_evidences_evidence_id_4c069ac2_fk_evidences_evidence_id` FOREIGN KEY (`evidence_id`) REFERENCES `evidences` (`evidence_id`);

--
-- Các ràng buộc cho bảng `case_results`
--
ALTER TABLE `case_results`
  ADD CONSTRAINT `case_results_case_id_dd55f331_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`);

--
-- Các ràng buộc cho bảng `digital_invest_results`
--
ALTER TABLE `digital_invest_results`
  ADD CONSTRAINT `digital_invest_resul_evidence_id_6bf164fe_fk_evidences` FOREIGN KEY (`evidence_id`) REFERENCES `evidences` (`evidence_id`),
  ADD CONSTRAINT `digital_invest_resul_investigation_plan_i_732ffc08_fk_investiga` FOREIGN KEY (`investigation_plan_id`) REFERENCES `investigation_plans` (`investigation_plan_id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_case_id_5b5df543_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`),
  ADD CONSTRAINT `events_holiday_id_98527ddc_fk_holidays_holiday_id` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`holiday_id`),
  ADD CONSTRAINT `events_suspect_id_68cb981a_fk_suspects_suspect_id` FOREIGN KEY (`suspect_id`) REFERENCES `suspects` (`suspect_id`);

--
-- Các ràng buộc cho bảng `evidences`
--
ALTER TABLE `evidences`
  ADD CONSTRAINT `evidences_case_id_edd5e374_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`),
  ADD CONSTRAINT `evidences_collector_username_2c336256_fk_users_username` FOREIGN KEY (`collector_username`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `evidences_measure_survey_id_a39b9f31_fk_measure_s` FOREIGN KEY (`measure_survey_id`) REFERENCES `measure_surveys` (`measure_survey_id`),
  ADD CONSTRAINT `evidences_report_id_5ffae24c_fk_reports_report_id` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  ADD CONSTRAINT `evidences_warrant_result_id_bebee19c_fk_warrant_r` FOREIGN KEY (`warrant_result_id`) REFERENCES `warrant_results` (`warrant_result_id`);

--
-- Các ràng buộc cho bảng `financial_invests`
--
ALTER TABLE `financial_invests`
  ADD CONSTRAINT `financial_invests_evidence_id_3b20c7aa_fk_evidences_evidence_id` FOREIGN KEY (`evidence_id`) REFERENCES `evidences` (`evidence_id`);

--
-- Các ràng buộc cho bảng `forensic_invest_results`
--
ALTER TABLE `forensic_invest_results`
  ADD CONSTRAINT `forensic_invest_resu_evidence_id_50f352d9_fk_evidences` FOREIGN KEY (`evidence_id`) REFERENCES `evidences` (`evidence_id`),
  ADD CONSTRAINT `forensic_invest_resu_investigation_plan_i_416740a9_fk_investiga` FOREIGN KEY (`investigation_plan_id`) REFERENCES `investigation_plans` (`investigation_plan_id`);

--
-- Các ràng buộc cho bảng `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_holiday_type_id_58988bcf_fk_holiday_t` FOREIGN KEY (`holiday_type_id`) REFERENCES `holiday_types` (`holiday_type_id`);

--
-- Các ràng buộc cho bảng `holiday_observances`
--
ALTER TABLE `holiday_observances`
  ADD CONSTRAINT `holiday_observances_holiday_id_94a640f4_fk_holidays_holiday_id` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`holiday_id`);

--
-- Các ràng buộc cho bảng `indictments`
--
ALTER TABLE `indictments`
  ADD CONSTRAINT `indictments_prosecution_id_df4ce827_fk_prosecuti` FOREIGN KEY (`prosecution_id`) REFERENCES `prosecutions` (`prosecution_id`);

--
-- Các ràng buộc cho bảng `inmates`
--
ALTER TABLE `inmates`
  ADD CONSTRAINT `inmates_sentence_id_cb935b1b_fk_sentences_sentence_id` FOREIGN KEY (`sentence_id`) REFERENCES `sentences` (`sentence_id`);

--
-- Các ràng buộc cho bảng `interviews`
--
ALTER TABLE `interviews`
  ADD CONSTRAINT `interviews_holiday_id_4a1eca7b_fk_holidays_holiday_id` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`holiday_id`),
  ADD CONSTRAINT `interviews_interviewer_id_dba7baab_fk_users_username` FOREIGN KEY (`interviewer_id`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `interviews_investigation_plan_i_e06b4cf5_fk_investiga` FOREIGN KEY (`investigation_plan_id`) REFERENCES `investigation_plans` (`investigation_plan_id`);

--
-- Các ràng buộc cho bảng `investigation_plans`
--
ALTER TABLE `investigation_plans`
  ADD CONSTRAINT `investigation_plans_accepted_officer_use_64ac9e68_fk_users_use` FOREIGN KEY (`accepted_officer_username`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `investigation_plans_case_id_165b2b16_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`),
  ADD CONSTRAINT `investigation_plans_created_officer_user_c0eb6ad3_fk_users_use` FOREIGN KEY (`created_officer_username`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `investigation_plans_holiday_id_f6fd97f8_fk_holidays_holiday_id` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`holiday_id`);

--
-- Các ràng buộc cho bảng `medical_supports`
--
ALTER TABLE `medical_supports`
  ADD CONSTRAINT `medical_supports_scene_response_id_f6387a45_fk_scene_res` FOREIGN KEY (`scene_response_id`) REFERENCES `scene_responses` (`scene_response_id`);

--
-- Các ràng buộc cho bảng `physical_invest_results`
--
ALTER TABLE `physical_invest_results`
  ADD CONSTRAINT `physical_invest_resu_evidence_id_ab3dfe38_fk_evidences` FOREIGN KEY (`evidence_id`) REFERENCES `evidences` (`evidence_id`),
  ADD CONSTRAINT `physical_invest_resu_investigation_plan_i_1a71134e_fk_investiga` FOREIGN KEY (`investigation_plan_id`) REFERENCES `investigation_plans` (`investigation_plan_id`);

--
-- Các ràng buộc cho bảng `prosecutions`
--
ALTER TABLE `prosecutions`
  ADD CONSTRAINT `prosecutions_case_id_2075dca0_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`),
  ADD CONSTRAINT `prosecutions_prosecutor_id_fc8b3fdd_fk_users_username` FOREIGN KEY (`prosecutor_id`) REFERENCES `users` (`username`);

--
-- Các ràng buộc cho bảng `prosecution_suspects`
--
ALTER TABLE `prosecution_suspects`
  ADD CONSTRAINT `prosecution_suspects_prosecution_id_f96acc24_fk_prosecuti` FOREIGN KEY (`prosecution_id`) REFERENCES `prosecutions` (`prosecution_id`),
  ADD CONSTRAINT `prosecution_suspects_suspect_id_6530cf59_fk_suspects_suspect_id` FOREIGN KEY (`suspect_id`) REFERENCES `suspects` (`suspect_id`);

--
-- Các ràng buộc cho bảng `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_created_by_9031f676_fk_users_username` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `questions_interview_id_9af3b2b0_fk_interviews_interview_id` FOREIGN KEY (`interview_id`) REFERENCES `interviews` (`interview_id`);

--
-- Các ràng buộc cho bảng `record_infos`
--
ALTER TABLE `record_infos`
  ADD CONSTRAINT `record_infos_evidence_id_00ce4f3a_fk_evidences_evidence_id` FOREIGN KEY (`evidence_id`) REFERENCES `evidences` (`evidence_id`);

--
-- Các ràng buộc cho bảng `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_case_id_203ed236_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`),
  ADD CONSTRAINT `reports_officer_approve_username_7ac6f2d3_fk_users_username` FOREIGN KEY (`officer_approve_username`) REFERENCES `users` (`username`);

--
-- Các ràng buộc cho bảng `report_suspects`
--
ALTER TABLE `report_suspects`
  ADD CONSTRAINT `report_suspects_report_id_f0718e12_fk_reports_report_id` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  ADD CONSTRAINT `report_suspects_suspect_id_148cbc3e_fk_suspects_suspect_id` FOREIGN KEY (`suspect_id`) REFERENCES `suspects` (`suspect_id`);

--
-- Các ràng buộc cho bảng `report_victims`
--
ALTER TABLE `report_victims`
  ADD CONSTRAINT `report_victims_report_id_e6c399c5_fk_reports_report_id` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  ADD CONSTRAINT `report_victims_victim_id_705c735e_fk_victims_victim_id` FOREIGN KEY (`victim_id`) REFERENCES `victims` (`victim_id`);

--
-- Các ràng buộc cho bảng `report_witnesses`
--
ALTER TABLE `report_witnesses`
  ADD CONSTRAINT `report_witnesses_report_id_f4b898fd_fk_reports_report_id` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  ADD CONSTRAINT `report_witnesses_witness_id_b8c8bdb6_fk_witnesses_witness_id` FOREIGN KEY (`witness_id`) REFERENCES `witnesses` (`witness_id`);

--
-- Các ràng buộc cho bảng `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_ad343843_fk_permissio` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`),
  ADD CONSTRAINT `role_permissions_role_id_216516f2_fk_roles_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

--
-- Các ràng buộc cho bảng `scene_descriptions`
--
ALTER TABLE `scene_descriptions`
  ADD CONSTRAINT `scene_descriptions_scene_response_id_5c7cece6_fk_scene_res` FOREIGN KEY (`scene_response_id`) REFERENCES `scene_responses` (`scene_response_id`);

--
-- Các ràng buộc cho bảng `scene_preservations`
--
ALTER TABLE `scene_preservations`
  ADD CONSTRAINT `scene_preservations_scene_response_id_425bd48c_fk_scene_res` FOREIGN KEY (`scene_response_id`) REFERENCES `scene_responses` (`scene_response_id`);

--
-- Các ràng buộc cho bảng `scene_responses`
--
ALTER TABLE `scene_responses`
  ADD CONSTRAINT `scene_responses_case_id_c6eb1391_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`);

--
-- Các ràng buộc cho bảng `scene_statements`
--
ALTER TABLE `scene_statements`
  ADD CONSTRAINT `scene_statements_scene_response_id_fa5ceebe_fk_scene_res` FOREIGN KEY (`scene_response_id`) REFERENCES `scene_responses` (`scene_response_id`);

--
-- Các ràng buộc cho bảng `sentences`
--
ALTER TABLE `sentences`
  ADD CONSTRAINT `sentences_case_id_2a414284_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`),
  ADD CONSTRAINT `sentences_case_result_id_d3e8cbcc_fk_case_results_case_result_id` FOREIGN KEY (`case_result_id`) REFERENCES `case_results` (`case_result_id`);

--
-- Các ràng buộc cho bảng `state_holidays`
--
ALTER TABLE `state_holidays`
  ADD CONSTRAINT `state_holidays_holiday_id_0046af55_fk_holidays_holiday_id` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`holiday_id`);

--
-- Các ràng buộc cho bảng `suspects`
--
ALTER TABLE `suspects`
  ADD CONSTRAINT `suspects_case_id_05376449_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`),
  ADD CONSTRAINT `suspects_report_id_c5d5d9d7_fk_reports_report_id` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`);

--
-- Các ràng buộc cho bảng `suspect_evidences`
--
ALTER TABLE `suspect_evidences`
  ADD CONSTRAINT `suspect_evidences_evidence_id_adb08bf7_fk_evidences_evidence_id` FOREIGN KEY (`evidence_id`) REFERENCES `evidences` (`evidence_id`),
  ADD CONSTRAINT `suspect_evidences_suspect_id_74657213_fk_suspects_suspect_id` FOREIGN KEY (`suspect_id`) REFERENCES `suspects` (`suspect_id`);

--
-- Các ràng buộc cho bảng `timelines`
--
ALTER TABLE `timelines`
  ADD CONSTRAINT `timelines_case_result_id_d3901d00_fk_case_results_case_result_id` FOREIGN KEY (`case_result_id`) REFERENCES `case_results` (`case_result_id`),
  ADD CONSTRAINT `timelines_holiday_id_9f7d6807_fk_holidays_holiday_id` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`holiday_id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_1900a745_fk_roles_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

--
-- Các ràng buộc cho bảng `user_cases`
--
ALTER TABLE `user_cases`
  ADD CONSTRAINT `user_cases_case_id_1b0ca0f5_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`),
  ADD CONSTRAINT `user_cases_officer_id_f014f54b_fk_users_username` FOREIGN KEY (`officer_id`) REFERENCES `users` (`username`);

--
-- Các ràng buộc cho bảng `victims`
--
ALTER TABLE `victims`
  ADD CONSTRAINT `victims_case_id_717d41a2_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`),
  ADD CONSTRAINT `victims_report_id_cdf57390_fk_reports_report_id` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`);

--
-- Các ràng buộc cho bảng `victim_interviews`
--
ALTER TABLE `victim_interviews`
  ADD CONSTRAINT `victim_interviews_interview_id_8fd78ea4_fk_interview` FOREIGN KEY (`interview_id`) REFERENCES `interviews` (`interview_id`),
  ADD CONSTRAINT `victim_interviews_victim_id_4af3f8fb_fk_victims_victim_id` FOREIGN KEY (`victim_id`) REFERENCES `victims` (`victim_id`);

--
-- Các ràng buộc cho bảng `warrants`
--
ALTER TABLE `warrants`
  ADD CONSTRAINT `warrants_case_id_7a993950_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`),
  ADD CONSTRAINT `warrants_officer_username_8fe799a5_fk_users_username` FOREIGN KEY (`officer_username`) REFERENCES `users` (`username`);

--
-- Các ràng buộc cho bảng `warrant_evidences`
--
ALTER TABLE `warrant_evidences`
  ADD CONSTRAINT `warrant_evidences_evidence_id_571d32ca_fk_evidences_evidence_id` FOREIGN KEY (`evidence_id`) REFERENCES `evidences` (`evidence_id`),
  ADD CONSTRAINT `warrant_evidences_warrant_id_a8e2be29_fk_warrants_warrant_id` FOREIGN KEY (`warrant_id`) REFERENCES `warrants` (`warrant_id`);

--
-- Các ràng buộc cho bảng `warrant_results`
--
ALTER TABLE `warrant_results`
  ADD CONSTRAINT `warrant_results_warrant_id_2f69c5df_fk_warrants_warrant_id` FOREIGN KEY (`warrant_id`) REFERENCES `warrants` (`warrant_id`);

--
-- Các ràng buộc cho bảng `witnesses`
--
ALTER TABLE `witnesses`
  ADD CONSTRAINT `witnesses_case_id_ae2875d5_fk_cases_case_id` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`),
  ADD CONSTRAINT `witnesses_report_id_ffdb2f5b_fk_reports_report_id` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`);

--
-- Các ràng buộc cho bảng `witness_interviews`
--
ALTER TABLE `witness_interviews`
  ADD CONSTRAINT `witness_interviews_interview_id_81e5e155_fk_interview` FOREIGN KEY (`interview_id`) REFERENCES `interviews` (`interview_id`),
  ADD CONSTRAINT `witness_interviews_witness_id_bff35505_fk_witnesses_witness_id` FOREIGN KEY (`witness_id`) REFERENCES `witnesses` (`witness_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
