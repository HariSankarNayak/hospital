-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2021 at 09:33 PM
-- Server version: 5.7.33-0ubuntu0.18.04.1
-- PHP Version: 7.2.34-18+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic_appointment`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(20) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_token` varchar(255) NOT NULL,
  `admin_registered` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_pass`, `admin_email`, `admin_token`, `admin_registered`) VALUES
(1, 'Admin', '3cVaxePSLtU0JOrUNCgvbxFaSMgH9+lJSOZCR1DHfnSMUo4LNff3bMwLqCg5PS4j', 'admin@admin.com', '1488714734152752384749', '2020-01-15 03:28:10');

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `ann_id` int(11) NOT NULL,
  `ann_title` varchar(255) NOT NULL,
  `ann_content` text NOT NULL,
  `date_created` datetime NOT NULL,
  `clinic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`ann_id`, `ann_title`, `ann_content`, `date_created`, `clinic_id`) VALUES
(1, 'zZX', 'zxZX', '2021-05-10 12:55:13', 2);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `app_id` int(11) NOT NULL,
  `app_date` date NOT NULL,
  `app_time` varchar(255) NOT NULL,
  `treatment_type` varchar(255) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1: Confirm, 0: Not Confirm',
  `consult_status` int(11) NOT NULL COMMENT '1: Visited 0: None',
  `arrive_status` int(11) NOT NULL COMMENT '1: Arrived 0: None'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_hour`
--

CREATE TABLE `appointment_hour` (
  `appointmenthour_id` int(11) NOT NULL,
  `open_week` varchar(255) DEFAULT NULL,
  `close_week` varchar(255) DEFAULT NULL,
  `open_sat` varchar(255) DEFAULT NULL,
  `close_sat` varchar(255) DEFAULT NULL,
  `open_sun` varchar(255) DEFAULT NULL,
  `close_sun` varchar(255) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment_hour`
--

INSERT INTO `appointment_hour` (`appointmenthour_id`, `open_week`, `close_week`, `open_sat`, `close_sat`, `open_sun`, `close_sun`, `business_id`) VALUES
(10, NULL, NULL, NULL, NULL, NULL, NULL, 14);

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `business_id` int(11) NOT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `business_email` varchar(255) DEFAULT NULL,
  `business_url` varchar(255) DEFAULT NULL,
  `business_contact` varchar(15) DEFAULT NULL,
  `business_address` varchar(255) DEFAULT NULL,
  `business_city` varchar(255) DEFAULT NULL,
  `business_state` varchar(255) DEFAULT NULL,
  `business_zipcode` varchar(10) DEFAULT NULL,
  `business_status` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`business_id`, `business_name`, `business_email`, `business_url`, `business_contact`, `business_address`, `business_city`, `business_state`, `business_zipcode`, `business_status`, `date_created`) VALUES
(1, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 22:41:04'),
(2, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 22:42:46'),
(3, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 22:47:16'),
(4, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 22:49:28'),
(5, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 22:50:48'),
(6, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 22:53:26'),
(7, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 23:19:03'),
(8, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 23:20:41'),
(9, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 23:21:07'),
(10, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 23:23:46'),
(11, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 23:46:43'),
(12, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 23:47:56'),
(13, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 23:49:13'),
(14, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 23:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `business_hour`
--

CREATE TABLE `business_hour` (
  `businesshour_id` int(11) NOT NULL,
  `open_week` varchar(255) DEFAULT NULL,
  `close_week` varchar(255) DEFAULT NULL,
  `open_sat` varchar(255) DEFAULT NULL,
  `close_sat` varchar(255) DEFAULT NULL,
  `open_sun` varchar(255) DEFAULT NULL,
  `close_sun` varchar(255) DEFAULT NULL,
  `clinic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business_hour`
--

INSERT INTO `business_hour` (`businesshour_id`, `open_week`, `close_week`, `open_sat`, `close_sat`, `open_sun`, `close_sun`, `clinic_id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, 5),
(2, NULL, NULL, NULL, NULL, NULL, NULL, 6),
(3, '8:49 AM', '10:54 PM', '8:49 AM', '10:50 AM', '10:53 AM', '2:53 PM', 7),
(4, NULL, NULL, NULL, NULL, NULL, NULL, 8),
(5, NULL, NULL, NULL, NULL, NULL, NULL, 9),
(6, NULL, NULL, NULL, NULL, NULL, NULL, 10),
(7, NULL, NULL, NULL, NULL, NULL, NULL, 11),
(8, NULL, NULL, NULL, NULL, NULL, NULL, 12),
(9, NULL, NULL, NULL, NULL, NULL, NULL, 13);

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE `clinics` (
  `clinic_id` int(11) NOT NULL,
  `clinic_name` varchar(255) DEFAULT NULL,
  `clinic_email` varchar(255) DEFAULT NULL,
  `clinic_url` varchar(255) DEFAULT NULL,
  `clinic_contact` varchar(15) DEFAULT NULL,
  `clinic_address` varchar(255) DEFAULT NULL,
  `clinic_city` varchar(255) DEFAULT NULL,
  `clinic_state` varchar(255) DEFAULT NULL,
  `clinic_zipcode` varchar(10) DEFAULT NULL,
  `clinic_status` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clinics`
--

INSERT INTO `clinics` (`clinic_id`, `clinic_name`, `clinic_email`, `clinic_url`, `clinic_contact`, `clinic_address`, `clinic_city`, `clinic_state`, `clinic_zipcode`, `clinic_status`, `date_created`) VALUES
(1, 'clinic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-09 21:10:37'),
(2, 'clinic', 'clinic3@clinic.com', 'http://localhost/doclab/clinic/clinic-register.php', '09658666648', 'GA 65, Saileshree vihar', 'fdgfdgd', 'Kelantan', '45354345', '0', '2021-05-09 21:19:15'),
(3, 'clinic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-09 21:19:20'),
(4, 'clinic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-09 21:20:38'),
(5, 'clinic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-09 21:21:35'),
(6, 'clinic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-10 12:52:59'),
(7, 'bikash', 'bikash@gmail.com', 'bikash.com', '8249784136', 'bikash', 'bikash', 'Kedah', '752118', '1', '2021-05-10 13:18:55'),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 12:45:00'),
(9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 13:49:40'),
(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 13:52:16'),
(11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 13:53:08'),
(12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 14:22:04'),
(13, 'clinic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 14:31:30'),
(14, 'Hadsfsdfri dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 22:38:52');

-- --------------------------------------------------------

--
-- Table structure for table `clinic_images`
--

CREATE TABLE `clinic_images` (
  `clinicimg_id` int(11) NOT NULL,
  `clinicimg_filename` varchar(255) NOT NULL,
  `clinic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clinic_manager`
--

CREATE TABLE `clinic_manager` (
  `clinicadmin_id` int(11) NOT NULL,
  `clinicadmin_name` varchar(255) DEFAULT NULL,
  `clinicadmin_password` varchar(255) DEFAULT NULL,
  `clinicadmin_token` varchar(255) DEFAULT NULL,
  `clinicadmin_email` varchar(255) DEFAULT NULL,
  `clinicadmin_contact` varchar(15) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `clinic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clinic_manager`
--

INSERT INTO `clinic_manager` (`clinicadmin_id`, `clinicadmin_name`, `clinicadmin_password`, `clinicadmin_token`, `clinicadmin_email`, `clinicadmin_contact`, `date_created`, `clinic_id`) VALUES
(1, 'clinic manager', 'KEa6O6QNsrHXqddauchLi3K9wDXdimzVaxBjxUCrsSl/k2Ipaqe0sn83tggD3jMe', '4243336501520154599221', 'clinic@clinic.com', '9658666648', '2021-05-09 21:19:15', 2),
(5, 'bikash', 'Ln2Wp0h55vAyfXRnsjcn3mqxGmp5x+VJLpPuRRnIOSk1n4oF+dhBcNmW/Iqsouwv', '8301373219845711586005', 'bikash@gmail.com', '8249784136', '2021-05-10 13:18:55', 7),
(6, NULL, 'HbTjLwrjKHIhclbFN2W/ZScZ/0LNvouNpT1gYuc6ER8AyDeiXChFAUgOFCgfpoAA', '1316680643922293832156', '', '', '2021-05-22 12:45:00', 8),
(7, 'clinic', '/e2/3El7/toAn36G0LGIxod7/WQxvGHOquJwx+xxTLgTz7X2S7XUf/zcvNnJnJfe', '3191191739267874901589', 'eaqreqaw@fsdfs.vsdf', '09658666648', '2021-05-22 14:31:30', 13);

-- --------------------------------------------------------

--
-- Table structure for table `clinic_reset`
--

CREATE TABLE `clinic_reset` (
  `reset_id` int(11) NOT NULL,
  `reset_email` varchar(255) NOT NULL,
  `reset_selector` text NOT NULL,
  `reset_token` longtext NOT NULL,
  `reset_expires` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `doctor_avatar` varchar(255) DEFAULT NULL,
  `doctor_firstname` varchar(255) DEFAULT NULL,
  `doctor_lastname` varchar(255) DEFAULT NULL,
  `doctor_speciality` varchar(255) DEFAULT NULL,
  `doctor_experience` varchar(10) DEFAULT NULL,
  `doctor_desc` text,
  `doctor_password` varchar(500) DEFAULT NULL,
  `doctor_token` varchar(500) DEFAULT NULL,
  `doctor_spoke` varchar(255) DEFAULT NULL,
  `doctor_gender` varchar(10) DEFAULT NULL,
  `doctor_dob` date DEFAULT NULL,
  `doctor_email` varchar(255) DEFAULT NULL,
  `doctor_contact` varchar(15) DEFAULT NULL,
  `consult_fee` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `clinic_id` int(11) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `doctor_avatar`, `doctor_firstname`, `doctor_lastname`, `doctor_speciality`, `doctor_experience`, `doctor_desc`, `doctor_password`, `doctor_token`, `doctor_spoke`, `doctor_gender`, `doctor_dob`, `doctor_email`, `doctor_contact`, `consult_fee`, `date_created`, `clinic_id`, `business_id`) VALUES
(1, '', 'Hari', 'Nayak', '2', '5', 'LIGOTGOIY', 'Ln2Wp0h55vAyfXRnsjcn3mqxGmp5x+VJLpPuRRnIOSk1n4oF+dhBcNmW/Iqsouwv', NULL, 'English', 'male', '2021-05-10', 'doctor@doctor.com', '09658666648', 20, '2021-05-10 13:43:51', 7, 0),
(2, NULL, '', '', NULL, '0', NULL, NULL, NULL, NULL, 'female', NULL, '', '', NULL, NULL, NULL, 0),
(3, NULL, '', '', NULL, '0', NULL, NULL, NULL, NULL, 'female', NULL, '', '', NULL, NULL, NULL, 0),
(4, NULL, '', '', NULL, '0', NULL, NULL, NULL, NULL, 'female', NULL, '', '', NULL, NULL, NULL, 0),
(5, NULL, 'Hari', 'Nayak', '2', '5', NULL, NULL, NULL, NULL, 'male', NULL, 'bikashdoc@gmail.com', '09658666648', NULL, NULL, NULL, 0),
(6, 'Screenshot from 2021-05-22 00-29-05.png', 'Hari', 'Nayak', '1', '5', 'qewqrwer', NULL, NULL, 'English,Malay,Chinese,Tamil,Portuguese,Dutch,Russian', 'male', '2021-05-22', 'nayak.harisankar12@gmail.com', '09658666648', 400, '2021-05-22 16:56:10', NULL, 0),
(7, 'Screenshot from 2021-05-22 00-29-05.png', 'Hari', 'Nayak', '1', '5', 'qewqrwer', NULL, NULL, 'English,Malay,Chinese,Tamil,Portuguese,Dutch,Russian', 'male', '2021-05-22', 'nayak.harisankar12@gmail.com', '09658666648', 400, '2021-05-22 17:00:07', NULL, 0),
(8, 'Screenshot from 2021-05-22 00-29-05.png', 'Hari', 'Nayak', '1', '5', 'qewqrwer', NULL, NULL, 'English,Malay,Chinese,Tamil,Portuguese,Dutch,Russian', 'male', '2021-05-22', 'nayak.harisankar12@gmail.com', '09658666648', 400, '2021-05-22 17:00:28', NULL, 0),
(9, NULL, 'Hadsfsdfri', 'dsfsdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, 'Hadsfsdfri', 'dsfsdff', NULL, NULL, NULL, 'eqAUZfmaMvOiXz+WWDl5VuzuKArmyJU/Xgxan+79MA2c461+MjomjbOu1HP0JrnC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, 'Hadsfsdfri', 'dsfsdff', '1', NULL, NULL, 'Xwigyl1n41U82CQPzbJkQ5tOQK56MR8eTaZsSw0GLJ2MPxLZH+Qg6GIIqQNi3sco', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, NULL, 'Hadsfsdfri', 'dsfsdff', '1', '4', NULL, '/7pfp8yTD3wkNWfHSnJAAqIrhmAGro/r4wxMlcRVz8MFbkof0d7tAbAtFWgg/mad', NULL, NULL, 'male', NULL, 'admin@admin.com', NULL, NULL, NULL, NULL, NULL),
(13, NULL, 'Hadsfsdfri', 'dsfsdff', '1', '4', NULL, 'oM51W128HJhLkuvWx+8mvBW/VAfUyoDUYlovfZvWSlrWbnCOEweDp5wOHLgndjBZ', NULL, NULL, 'male', NULL, 'admin@admin.com', '09658666648', NULL, '2021-05-22 23:45:27', NULL, NULL),
(14, NULL, 'Hadsfsdfri', 'dsfsdff', '1', '4', NULL, 'XAu0S+TAqRkX7mudXeBQbQ32yiZ16uZj5M9jwy6C1D9xb+ic4FZ4PpxVLvDNn6PQ', NULL, NULL, 'male', NULL, 'admin@admin.com', '09658666648', NULL, '2021-05-22 23:47:56', NULL, 12),
(15, NULL, 'Hadsfsdfri', 'dsfsdff', '1', '4', NULL, 'AizC0NNeM+hkbW82PlBsfHbOzTzCVlKglJ2ejy5RHtqOhTR6fDjL4TNjJrgSxPCO', NULL, NULL, 'male', NULL, 'admin@admin.com', '09658666648', NULL, '2021-05-22 23:49:13', NULL, 13),
(16, NULL, 'Hadsfsdfri', 'dsfsdff', '1', '4', NULL, 'b1r9rPLd/ftm8In4g6iQIbyPct7S5pjZLcDjt/B6falaYmPL+c4Inq9jnugtsqf2', NULL, NULL, 'male', NULL, 'admin@admin.com', '09658666648', NULL, '2021-05-22 23:49:56', NULL, 14);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_reset`
--

CREATE TABLE `doctor_reset` (
  `reset_id` int(11) NOT NULL,
  `reset_email` varchar(255) NOT NULL,
  `reset_selector` text NOT NULL,
  `reset_token` longtext NOT NULL,
  `reset_expires` text NOT NULL,
  `activate_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_reset`
--

INSERT INTO `doctor_reset` (`reset_id`, `reset_email`, `reset_selector`, `reset_token`, `reset_expires`, `activate_token`) VALUES
(4, 'nayak.harisankar12@gmail.com', '83ab192f62915f6e', '$2y$10$B/MdFpVzUPcM3blOzrWrTODbk0ZE6MINOJW9gqJBbPrE2E7DXiqNm', '1621760428', '6b47141fecef35376c121b7f05ce2dfb');

-- --------------------------------------------------------

--
-- Table structure for table `medical_record`
--

CREATE TABLE `medical_record` (
  `med_id` int(11) NOT NULL,
  `med_sympton` text NOT NULL,
  `med_diagnosis` text NOT NULL,
  `med_date` datetime NOT NULL,
  `med_advice` text NOT NULL,
  `patient_id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `patient_avatar` varchar(255) DEFAULT NULL,
  `patient_firstname` varchar(255) DEFAULT NULL,
  `patient_lastname` varchar(255) DEFAULT NULL,
  `patient_email` varchar(255) DEFAULT NULL,
  `patient_password` varchar(255) DEFAULT NULL,
  `patient_token` varchar(255) DEFAULT NULL,
  `patient_identity` varchar(255) DEFAULT NULL,
  `patient_nationality` varchar(255) DEFAULT NULL,
  `patient_gender` varchar(255) DEFAULT NULL,
  `patient_maritalstatus` varchar(255) DEFAULT NULL,
  `patient_dob` date DEFAULT NULL,
  `patient_age` varchar(11) DEFAULT NULL,
  `patient_contact` varchar(255) DEFAULT NULL,
  `patient_address` varchar(255) DEFAULT NULL,
  `patient_city` varchar(255) DEFAULT NULL,
  `patient_state` varchar(255) DEFAULT NULL,
  `patient_zipcode` varchar(255) DEFAULT NULL,
  `patient_country` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `patient_avatar`, `patient_firstname`, `patient_lastname`, `patient_email`, `patient_password`, `patient_token`, `patient_identity`, `patient_nationality`, `patient_gender`, `patient_maritalstatus`, `patient_dob`, `patient_age`, `patient_contact`, `patient_address`, `patient_city`, `patient_state`, `patient_zipcode`, `patient_country`, `date_created`) VALUES
(1, NULL, 'Hari', 'Nayak', 'test@test.com', 'A98zyLGqCoBnt6pJNdFhoe2cy0/8B2gYwS+R441eMzXiJcUnhIVjNdmFuyqJx3r/', '2799554229252872339176', '1445454545445454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-10 00:05:26'),
(2, NULL, 'sdsd', 'Nayak', 'test@gmail.com', 's7/wOk+VD22j9EBVU1HkhV7PkFcNU9B98RRp0d7bgmfQF2Go8JWLZU9dRn9oybDd', '0241960660488608845196', 'xccxzcxzczxc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-13 01:52:08');

-- --------------------------------------------------------

--
-- Table structure for table `patient_reset`
--

CREATE TABLE `patient_reset` (
  `reset_id` int(11) NOT NULL,
  `reset_email` varchar(255) NOT NULL,
  `reset_selector` text NOT NULL,
  `reset_token` longtext NOT NULL,
  `reset_expires` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` text NOT NULL,
  `date` date NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `schedule_week` varchar(255) DEFAULT NULL,
  `status` int(5) DEFAULT NULL COMMENT '1=Active | 0= Inactive',
  `doctor_id` int(11) DEFAULT NULL,
  `clinic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `date_from`, `date_to`, `schedule_week`, `status`, `doctor_id`, `clinic_id`) VALUES
(1, '2021-05-04', '2021-05-07', 'Monday', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_detail`
--

CREATE TABLE `schedule_detail` (
  `schdetail_id` int(11) NOT NULL,
  `time_slot` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1= Active 0 = Inactive',
  `schedule_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule_detail`
--

INSERT INTO `schedule_detail` (`schdetail_id`, `time_slot`, `duration`, `status`, `schedule_id`) VALUES
(1, '9:32 AM', 30, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `speciality`
--

CREATE TABLE `speciality` (
  `speciality_id` int(11) NOT NULL,
  `speciality_name` varchar(255) DEFAULT NULL,
  `speciality_icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `speciality`
--

INSERT INTO `speciality` (`speciality_id`, `speciality_name`, `speciality_icon`) VALUES
(1, 'GP/Family', 'family.png'),
(2, 'Dentist', 'dentist.png'),
(3, 'Acupuncturist', 'acupuncture.png'),
(4, 'Audiologist', 'hearing.png'),
(5, 'Anaesthetist', 'anaesthetist.png'),
(6, 'Optometrist', 'optometrist.png'),
(7, 'Baby Sitter', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `treatment_type`
--

CREATE TABLE `treatment_type` (
  `treatment_id` int(11) NOT NULL,
  `treatment_name` varchar(255) NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment_type`
--

INSERT INTO `treatment_type` (`treatment_id`, `treatment_name`, `doctor_id`) VALUES
(1, 'New Patient', 1),
(2, 'New Patient', 6),
(3, 'New Patient', 7),
(4, 'New Patient', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`ann_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`app_id`);

--
-- Indexes for table `appointment_hour`
--
ALTER TABLE `appointment_hour`
  ADD PRIMARY KEY (`appointmenthour_id`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`business_id`);

--
-- Indexes for table `business_hour`
--
ALTER TABLE `business_hour`
  ADD PRIMARY KEY (`businesshour_id`);

--
-- Indexes for table `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`clinic_id`);

--
-- Indexes for table `clinic_images`
--
ALTER TABLE `clinic_images`
  ADD PRIMARY KEY (`clinicimg_id`);

--
-- Indexes for table `clinic_manager`
--
ALTER TABLE `clinic_manager`
  ADD PRIMARY KEY (`clinicadmin_id`);

--
-- Indexes for table `clinic_reset`
--
ALTER TABLE `clinic_reset`
  ADD PRIMARY KEY (`reset_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `clinic_id` (`clinic_id`);

--
-- Indexes for table `doctor_reset`
--
ALTER TABLE `doctor_reset`
  ADD PRIMARY KEY (`reset_id`);

--
-- Indexes for table `medical_record`
--
ALTER TABLE `medical_record`
  ADD PRIMARY KEY (`med_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `schedule_detail`
--
ALTER TABLE `schedule_detail`
  ADD PRIMARY KEY (`schdetail_id`);

--
-- Indexes for table `speciality`
--
ALTER TABLE `speciality`
  ADD PRIMARY KEY (`speciality_id`);

--
-- Indexes for table `treatment_type`
--
ALTER TABLE `treatment_type`
  ADD PRIMARY KEY (`treatment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `ann_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `appointment_hour`
--
ALTER TABLE `appointment_hour`
  MODIFY `appointmenthour_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `business_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `business_hour`
--
ALTER TABLE `business_hour`
  MODIFY `businesshour_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `clinics`
--
ALTER TABLE `clinics`
  MODIFY `clinic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `clinic_images`
--
ALTER TABLE `clinic_images`
  MODIFY `clinicimg_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clinic_manager`
--
ALTER TABLE `clinic_manager`
  MODIFY `clinicadmin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `doctor_reset`
--
ALTER TABLE `doctor_reset`
  MODIFY `reset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `medical_record`
--
ALTER TABLE `medical_record`
  MODIFY `med_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `schedule_detail`
--
ALTER TABLE `schedule_detail`
  MODIFY `schdetail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `speciality`
--
ALTER TABLE `speciality`
  MODIFY `speciality_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `treatment_type`
--
ALTER TABLE `treatment_type`
  MODIFY `treatment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`clinic_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
