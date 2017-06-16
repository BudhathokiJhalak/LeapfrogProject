-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2017 at 06:23 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leapfrog_academy`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `payment_id` int(11) NOT NULL,
  `paid_amount` float NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`payment_id`, `paid_amount`, `added_date`, `modified_date`, `student_id`) VALUES
(1, 10000, '2017-05-30 16:47:50', NULL, 1),
(2, 18000, '2017-05-30 17:21:41', NULL, 3),
(3, 2000, '2017-05-31 09:25:13', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `middle_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `gender` enum('Male','Female','Others') NOT NULL,
  `role` enum('ROLE_ADMIN','ROLE_USER','ROLE_ACCOUNTANT') NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `first_name`, `middle_name`, `last_name`, `email`, `address`, `contact_no`, `gender`, `role`, `username`, `password`, `status`) VALUES
(1, 'Jhalak', NULL, 'Budhathoki', 'dayfeb1217@gmail.com', 'Buddhanagar, Kathmandu', '+9779843632668', 'Male', 'ROLE_ADMIN', 'budhalak', 'Password1', 1),
(2, 'Kripesh', NULL, 'Lamichhane', 'kripeshlamichhane@gmail.com', 'lokanthali, Bhaktapur', '+9779847635210', 'Male', 'ROLE_ADMIN', 'kripesh', 'hsepirk', 1),
(4, 'Ruman', NULL, 'Dangol', 'goldanruman@gmail.com', 'Lalitpur', '+9779845346221', 'Male', 'ROLE_ACCOUNTANT', 'goldan', 'ruman', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_batches`
--

CREATE TABLE `tbl_batches` (
  `batch_id` int(11) NOT NULL,
  `batch_name` varchar(25) NOT NULL,
  `shift` enum('Morning','Day','Evening') NOT NULL,
  `time` varchar(15) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tutor_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_batches`
--

INSERT INTO `tbl_batches` (`batch_id`, `batch_name`, `shift`, `time`, `added_date`, `modified_date`, `tutor_id`, `status`) VALUES
(1, 'CJV0001', 'Morning', '7 AM - 9 AM', '2017-05-06 08:54:38', NULL, 1, 1),
(2, 'ADJ0001', 'Morning', '9 AM - 10 AM', '2017-05-06 09:00:18', NULL, 1, 0),
(3, 'ADJ0002', 'Evening', '6 PM - 7.30 PM', '2017-05-06 09:01:06', NULL, 1, 1),
(4, 'A.N0001', 'Day', '1 PM - 2.30 PM', '2017-05-06 08:40:09', NULL, 1, 0),
(5, 'A.N0002', 'Evening', '5PM - 6.30PM', '2017-06-01 09:07:48', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_certification`
--

CREATE TABLE `tbl_certification` (
  `certificate_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_certification`
--

INSERT INTO `tbl_certification` (`certificate_id`, `added_date`, `modified_date`, `student_id`) VALUES
(1, '2017-05-08 07:40:48', '2017-05-08 07:40:48', 1),
(2, '2017-05-08 07:40:48', '2017-05-08 07:40:48', 2),
(3, '2017-05-23 06:44:52', NULL, 5),
(4, '2017-06-01 09:09:38', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_courses`
--

CREATE TABLE `tbl_courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `fees` float NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_courses`
--

INSERT INTO `tbl_courses` (`course_id`, `course_name`, `description`, `fees`, `added_date`, `modified_date`, `status`) VALUES
(1, 'Core JAVA', 'Core Java Core Java', 12000, '2017-04-29 18:17:26', NULL, 1),
(2, 'Advanced JAVA', 'Advanced JAVA Advanced JAVA Advanced JAVA Advanced JAVA', 20000, '2017-04-29 16:08:01', NULL, 1),
(3, 'Asp .NET', 'Asp .NET Asp .NET Asp .NET', 20000, '2017-06-01 09:09:06', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_enquiries`
--

CREATE TABLE `tbl_enquiries` (
  `enquiry_id` int(11) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `middle_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `address` varchar(30) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `course_id` int(11) NOT NULL,
  `enquiry_status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_enquiries`
--

INSERT INTO `tbl_enquiries` (`enquiry_id`, `first_name`, `middle_name`, `last_name`, `email`, `contact_no`, `address`, `added_date`, `modified_date`, `course_id`, `enquiry_status_id`) VALUES
(1, 'Satish', '', 'Chaudhary', 'satish4link@gmail.com', '+9779860019821', 'Kritipur, Lalitput', '2017-06-01 09:09:19', NULL, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_enquiry_status`
--

CREATE TABLE `tbl_enquiry_status` (
  `enquiry_status_id` int(11) NOT NULL,
  `enquiry_status` varchar(15) NOT NULL,
  `color` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_enquiry_status`
--

INSERT INTO `tbl_enquiry_status` (`enquiry_status_id`, `enquiry_status`, `color`) VALUES
(1, 'Pending', '#ffff00'),
(2, 'Enrolled', '#99ffff'),
(3, 'Not Interested', '#ff3333');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_isp`
--

CREATE TABLE `tbl_isp` (
  `isp_id` int(11) NOT NULL,
  `isp_name` varchar(30) NOT NULL,
  `value` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_isp`
--

INSERT INTO `tbl_isp` (`isp_id`, `isp_name`, `value`) VALUES
(1, 'Vianet Communication', 'smtp.vianet.com.np'),
(2, 'WorldLink Communication', 'smtp.wlink.com.np'),
(3, 'Subisu', 'smtp.subisu.net.np');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mail_address`
--

CREATE TABLE `tbl_mail_address` (
  `mail_address_id` int(11) NOT NULL,
  `mail_address` varchar(30) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mail_address`
--

INSERT INTO `tbl_mail_address` (`mail_address_id`, `mail_address`, `added_date`, `modified_date`) VALUES
(1, 'dayfeb1217@gmail.com', '2017-05-08 09:05:54', NULL),
(2, 'mgr.amrit1@gmail.com', '2017-05-08 10:06:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_students`
--

CREATE TABLE `tbl_students` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) NOT NULL,
  `gender` enum('Male','Female','Others') NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(25) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `additional_contact_no` varchar(15) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `course_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_students`
--

INSERT INTO `tbl_students` (`student_id`, `first_name`, `middle_name`, `last_name`, `gender`, `email`, `address`, `contact_no`, `additional_contact_no`, `added_date`, `modified_date`, `course_id`, `batch_id`, `status`) VALUES
(1, 'Bibek', '', 'Thapa', 'Male', 'mgr.amrit1@gmail.com', 'Kapan, Kathmandu', '+9779860559853', '', '2017-05-06 12:35:08', NULL, 2, 3, 1),
(2, 'Kripesh', NULL, 'Lamichhane', 'Male', 'kripeshlammi@gmail.com', 'Lokanthali, Bhaktapur', '+9779842466514', '', '2017-05-05 18:44:37', NULL, 2, 3, 1),
(3, 'Bibek', '', 'Bagdash', 'Male', 'bibekbagdash11@gmail.com', 'Shantinagar, Kathmandu', '+9779849867190', '', '2017-05-23 10:07:05', NULL, 2, 3, 0),
(4, 'Ruman', '', 'Dangol', 'Male', 'goldenruman@gmail.com', 'Satdobato, Lalitpur', '+9779810019221', '', '2017-05-05 19:20:15', NULL, 2, 3, 1),
(5, 'Sangharsha', '', 'Chaulagain', 'Male', 'sangharsha1101@gmail.com', 'Chabahil, Kathmandu', '+9779865634371', '', '2017-06-01 09:08:57', NULL, 3, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tutors`
--

CREATE TABLE `tbl_tutors` (
  `tutor_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) NOT NULL,
  `gender` enum('Male','Female','Others') NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(25) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `additional_contact_no` varchar(15) DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `course_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tutors`
--

INSERT INTO `tbl_tutors` (`tutor_id`, `first_name`, `middle_name`, `last_name`, `gender`, `email`, `address`, `contact_no`, `additional_contact_no`, `added_date`, `modified_date`, `course_id`, `status`) VALUES
(1, 'Dixanta', 'Bahadur', 'Shrestha', 'Male', 'dixanta11@gmail.com', 'Kathmandu', '+9779843896610', '', '2017-04-29 18:00:52', NULL, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tbl_batches`
--
ALTER TABLE `tbl_batches`
  ADD PRIMARY KEY (`batch_id`),
  ADD UNIQUE KEY `batch_name` (`batch_name`),
  ADD KEY `tutor_id` (`tutor_id`);

--
-- Indexes for table `tbl_certification`
--
ALTER TABLE `tbl_certification`
  ADD PRIMARY KEY (`certificate_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `tbl_enquiries`
--
ALTER TABLE `tbl_enquiries`
  ADD PRIMARY KEY (`enquiry_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `enquiry_status_id` (`enquiry_status_id`);

--
-- Indexes for table `tbl_enquiry_status`
--
ALTER TABLE `tbl_enquiry_status`
  ADD PRIMARY KEY (`enquiry_status_id`);

--
-- Indexes for table `tbl_isp`
--
ALTER TABLE `tbl_isp`
  ADD PRIMARY KEY (`isp_id`);

--
-- Indexes for table `tbl_mail_address`
--
ALTER TABLE `tbl_mail_address`
  ADD PRIMARY KEY (`mail_address_id`),
  ADD UNIQUE KEY `mail_address` (`mail_address`);

--
-- Indexes for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `batch_id` (`batch_id`);

--
-- Indexes for table `tbl_tutors`
--
ALTER TABLE `tbl_tutors`
  ADD PRIMARY KEY (`tutor_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `course_id` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_batches`
--
ALTER TABLE `tbl_batches`
  MODIFY `batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_certification`
--
ALTER TABLE `tbl_certification`
  MODIFY `certificate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_enquiries`
--
ALTER TABLE `tbl_enquiries`
  MODIFY `enquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_enquiry_status`
--
ALTER TABLE `tbl_enquiry_status`
  MODIFY `enquiry_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_isp`
--
ALTER TABLE `tbl_isp`
  MODIFY `isp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_mail_address`
--
ALTER TABLE `tbl_mail_address`
  MODIFY `mail_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_students`
--
ALTER TABLE `tbl_students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_tutors`
--
ALTER TABLE `tbl_tutors`
  MODIFY `tutor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD CONSTRAINT `tbl_account_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tbl_students` (`student_id`);

--
-- Constraints for table `tbl_batches`
--
ALTER TABLE `tbl_batches`
  ADD CONSTRAINT `tbl_batches_ibfk_1` FOREIGN KEY (`tutor_id`) REFERENCES `tbl_tutors` (`tutor_id`);

--
-- Constraints for table `tbl_certification`
--
ALTER TABLE `tbl_certification`
  ADD CONSTRAINT `tbl_certification_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tbl_students` (`student_id`);

--
-- Constraints for table `tbl_enquiries`
--
ALTER TABLE `tbl_enquiries`
  ADD CONSTRAINT `tbl_enquiries_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`course_id`),
  ADD CONSTRAINT `tbl_enquiries_ibfk_2` FOREIGN KEY (`enquiry_status_id`) REFERENCES `tbl_enquiry_status` (`enquiry_status_id`);

--
-- Constraints for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD CONSTRAINT `tbl_students_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`course_id`),
  ADD CONSTRAINT `tbl_students_ibfk_2` FOREIGN KEY (`batch_id`) REFERENCES `tbl_batches` (`batch_id`);

--
-- Constraints for table `tbl_tutors`
--
ALTER TABLE `tbl_tutors`
  ADD CONSTRAINT `tbl_tutors_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`course_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
