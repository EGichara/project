-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2022 at 08:45 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4nte`
--

-- --------------------------------------------------------

--
-- Table structure for table `message_list`
--

CREATE TABLE `message_list` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_list`
--

CREATE TABLE `reservation_list` (
  `id` int(30) NOT NULL,
  `seat_num` varchar(50) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `schedule` datetime NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text NOT NULL,
  `lastname` text NOT NULL,
  `seat_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=seater, 2=shuttle',
  `fare_amount` float NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_list`
--

CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `vehicle_id` int(30) NOT NULL,
  `route_from` text NOT NULL,
  `route_to` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = daily, 2= One-Time Schedule',
  `date_schedule` date DEFAULT NULL,
  `time_schedule` time NOT NULL,
  `first_class_fare` float NOT NULL DEFAULT 0,
  `economy_fare` float NOT NULL DEFAULT 0,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `code`, `vehicle_id`, `route_from`, `route_to`, `type`, `date_schedule`, `time_schedule`, `first_class_fare`, `economy_fare`, `delete_flag`, `date_created`, `date_updated`) VALUES
(25, '202207-0014', 21, 'Nairobi', 'Mombasa', 1, NULL, '08:00:00', 1000, 1400, 0, '2022-07-16 16:10:37', NULL),
(26, '202207-0001', 22, 'Mombasa', 'Nairobi', 1, NULL, '08:00:00', 1000, 1400, 0, '2022-07-16 16:17:09', NULL),
(27, '202207-0002', 23, 'Nairobi', 'Kisumu', 1, NULL, '08:00:00', 1000, 1400, 0, '2022-07-16 16:27:07', NULL),
(28, '202207-0003', 24, 'Kisumu', 'Nairobi', 1, NULL, '08:00:00', 1000, 1400, 0, '2022-07-16 16:28:38', NULL),
(29, '202207-0004', 25, 'Nairobi', 'Mombasa', 1, NULL, '09:00:00', 1000, 1400, 0, '2022-07-16 16:30:33', NULL),
(30, '202207-0005', 25, 'Mombasa', 'Nairobi', 1, NULL, '09:00:00', 1000, 1400, 0, '2022-07-16 16:32:00', NULL),
(31, '202207-0006', 27, 'Nairobi', 'Kisumu', 1, NULL, '10:00:00', 1000, 1400, 0, '2022-07-16 16:33:31', NULL),
(32, '202207-0007', 28, 'Nairobi', 'Nyahururu', 1, NULL, '11:00:00', 400, 550, 0, '2022-07-16 16:34:45', NULL),
(33, '202207-0008', 29, 'Nyahururu', 'Nairobi', 1, NULL, '12:00:00', 400, 550, 0, '2022-07-16 16:36:08', NULL),
(34, '202207-0009', 30, 'Mombasa', 'Kisumu', 2, '2022-08-26', '12:00:00', 1500, 1800, 0, '2022-07-16 16:38:08', NULL),
(35, '202207-0010', 31, 'Nakuru', 'Mombasa', 2, '2022-09-10', '16:00:00', 1000, 1400, 0, '2022-07-16 16:40:56', NULL),
(36, '202207-0011', 32, 'Nakuru', 'Nyahururu', 1, NULL, '13:00:00', 300, 400, 0, '2022-07-16 16:43:41', NULL),
(37, '202207-0012', 33, 'Nyahururu', 'Nakuru', 1, NULL, '14:00:00', 300, 400, 0, '2022-07-16 16:45:39', NULL),
(38, '202207-0013', 34, 'Nyahururu', 'Kisumu', 2, '2022-10-12', '10:00:00', 800, 1200, 0, '2022-07-16 16:48:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'TRIPLE S ONLINE BOOKING'),
(6, 'short_name', 'TRIPLE S SACCO'),
(11, 'logo', 'uploads/image1.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/mat1.jpg'),
(15, 'content', 'Array'),
(16, 'email', 'Triplessacco@gmail.com'),
(17, 'contact', '(+254) 700345678'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(20, 'address', 'Nairobi, Tom Mboya Street,1234');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(5, 'Edwin', NULL, 'Mwangi', 'Edwinmwangi', '20e19b5ca908083cc8b370443a18b4b2', 'uploads/avatar-1.png?v=1639468007', NULL, 1, 1, '2022-06-30 19:30:11', '2022-07-19 15:36:38'),
(7, 'Peter', NULL, 'Mwangi', 'Petermwangi', '36d75f5d9b0c7e11aab8cfd6066a4424', NULL, NULL, 2, 1, '2022-07-16 21:33:51', NULL),
(8, 'Jacob', NULL, 'Mwangi', 'Jacobmwangi', 'cd5777ccbaeadc6356fce96493bd2195', 'uploads/image2.png', NULL, 1, 1, '2022-07-19 15:41:35', '2022-07-19 15:42:54');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_list`
--

CREATE TABLE `vehicle_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `first_class_capacity` float NOT NULL DEFAULT 0,
  `economy_capacity` float NOT NULL DEFAULT 0,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_list`
--

INSERT INTO `vehicle_list` (`id`, `code`, `name`, `first_class_capacity`, `economy_capacity`, `delete_flag`, `date_created`, `date_updated`) VALUES
(21, 'KBA-123A', 'Nissan', 14, 10, 0, '2022-07-16 16:09:49', NULL),
(22, 'KBB-123B', 'Nissan', 14, 10, 0, '2022-07-16 16:16:25', '2022-07-16 16:25:35'),
(23, 'KBC-123C', 'Nissan', 14, 10, 0, '2022-07-16 16:26:25', NULL),
(24, 'KBD-123D', 'Nissan', 14, 10, 0, '2022-07-16 16:28:01', NULL),
(25, 'KBE-123E', 'Bus', 50, 30, 0, '2022-07-16 16:29:50', NULL),
(26, 'KBF-123F', 'Bus', 50, 30, 0, '2022-07-16 16:31:28', NULL),
(27, 'KBG-123G', 'Bus', 50, 30, 0, '2022-07-16 16:32:48', NULL),
(28, 'KBH-123H', 'Nissan', 14, 10, 0, '2022-07-16 16:34:08', NULL),
(29, 'KBI-123I', 'Nissan', 14, 10, 0, '2022-07-16 16:35:26', NULL),
(30, 'KBJ-123J', 'Bus', 50, 30, 0, '2022-07-16 16:37:05', NULL),
(31, 'KBK-123K', 'Nissan', 14, 10, 0, '2022-07-16 16:39:49', NULL),
(32, 'KBL-123L', 'Nissan', 14, 10, 0, '2022-07-16 16:42:49', NULL),
(33, 'KBM-123M', 'Nissan', 14, 10, 0, '2022-07-16 16:45:01', NULL),
(34, 'KBN-123N', 'Bus', 50, 30, 0, '2022-07-16 16:47:04', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message_list`
--
ALTER TABLE `message_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation_list`
--
ALTER TABLE `reservation_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_list`
--
ALTER TABLE `vehicle_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message_list`
--
ALTER TABLE `message_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservation_list`
--
ALTER TABLE `reservation_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vehicle_list`
--
ALTER TABLE `vehicle_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation_list`
--
ALTER TABLE `reservation_list`
  ADD CONSTRAINT `reservation_list_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD CONSTRAINT `schedule_list_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
