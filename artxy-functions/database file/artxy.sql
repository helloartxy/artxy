-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2017 at 04:45 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `artxy`
--

-- --------------------------------------------------------

--
-- Table structure for table `artxy_user`
--

CREATE TABLE `artxy_user` (
  `ID` bigint(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `joined_date` datetime NOT NULL,
  `user_activated` enum('0','1') NOT NULL DEFAULT '0',
  `profile_ID` int(11) NOT NULL COMMENT '6 digit numbers that can handle up to 999999'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` bigint(20) NOT NULL,
  `cateogry_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `cateogry_name`) VALUES
(3, 'Tools'),
(4, 'Inspire'),
(5, 'Learn'),
(6, 'Events');

-- --------------------------------------------------------

--
-- Table structure for table `category_type`
--

CREATE TABLE `category_type` (
  `ID` bigint(20) NOT NULL,
  `category_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_category`
--

CREATE TABLE `event_category` (
  `ID` bigint(20) NOT NULL,
  `event_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_post`
--

CREATE TABLE `event_post` (
  `ID` bigint(20) NOT NULL,
  `post_ID` bigint(20) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_place` varchar(255) NOT NULL,
  `event_category_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_images`
--

CREATE TABLE `post_images` (
  `ID` bigint(20) NOT NULL,
  `post_ID` bigint(20) NOT NULL,
  `path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='store all images of post';

-- --------------------------------------------------------

--
-- Table structure for table `post_like`
--

CREATE TABLE `post_like` (
  `ID` bigint(20) NOT NULL,
  `post_ID` bigint(20) NOT NULL,
  `profile_ID` bigint(20) NOT NULL,
  `like_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_primary_image`
--

CREATE TABLE `post_primary_image` (
  `ID` bigint(20) NOT NULL,
  `post_ID` bigint(20) NOT NULL,
  `path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='store the primary image of post';

-- --------------------------------------------------------

--
-- Table structure for table `resources_category`
--

CREATE TABLE `resources_category` (
  `ID` bigint(20) NOT NULL,
  `resources_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resources_category_post`
--

CREATE TABLE `resources_category_post` (
  `ID` bigint(20) NOT NULL,
  `resources_category_ID` bigint(20) NOT NULL,
  `post_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `store_category`
--

CREATE TABLE `store_category` (
  `ID` bigint(20) NOT NULL,
  `store_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `store_description`
--

CREATE TABLE `store_description` (
  `ID` bigint(20) NOT NULL,
  `post_ID` bigint(20) NOT NULL,
  `address` text NOT NULL,
  `store_type` enum('Online','Physical','Online and Physical','') NOT NULL,
  `popular_products` varchar(255) NOT NULL,
  `store_category_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `ID` bigint(20) NOT NULL,
  `sub_category_name` varchar(255) NOT NULL,
  `category_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`ID`, `sub_category_name`, `category_ID`) VALUES
(1, 'Acrylic/Oil', 3),
(2, 'Calligraphy', 3),
(3, 'Acrylic/Oil', 3),
(4, 'Calligraphy', 3),
(5, 'Digital Painting', 3),
(6, 'Watercolor', 3),
(7, 'Art Stores', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_activation_code`
--

CREATE TABLE `user_activation_code` (
  `ID` bigint(20) NOT NULL,
  `user_ID` bigint(20) NOT NULL,
  `activation_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_credentials`
--

CREATE TABLE `user_credentials` (
  `ID` bigint(20) NOT NULL,
  `user_ID` bigint(20) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `ID` bigint(20) NOT NULL,
  `user_ID` bigint(20) NOT NULL,
  `login_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_post`
--

CREATE TABLE `user_post` (
  `ID` bigint(20) NOT NULL,
  `user_ID` bigint(20) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_description` text NOT NULL,
  `post_date` datetime NOT NULL,
  `sub_category_ID` bigint(20) NOT NULL,
  `category_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_post`
--

INSERT INTO `user_post` (`ID`, `user_ID`, `post_title`, `post_description`, `post_date`, `sub_category_ID`, `category_ID`) VALUES
(8, 0, 'sample', 'sample', '0000-00-00 00:00:00', 0, 0),
(9, 0, 'sampl1', 'sample1', '2017-07-30 15:45:51', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artxy_user`
--
ALTER TABLE `artxy_user`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `category_type`
--
ALTER TABLE `category_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `event_category`
--
ALTER TABLE `event_category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `event_post`
--
ALTER TABLE `event_post`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_ID` (`post_ID`,`event_category_ID`);

--
-- Indexes for table `post_images`
--
ALTER TABLE `post_images`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_ID` (`post_ID`);

--
-- Indexes for table `post_like`
--
ALTER TABLE `post_like`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_ID` (`post_ID`),
  ADD KEY `profile_ID` (`profile_ID`);

--
-- Indexes for table `post_primary_image`
--
ALTER TABLE `post_primary_image`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_ID` (`post_ID`);

--
-- Indexes for table `resources_category`
--
ALTER TABLE `resources_category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `resources_category_post`
--
ALTER TABLE `resources_category_post`
  ADD KEY `resources_category_ID` (`resources_category_ID`,`post_ID`),
  ADD KEY `resources_category_ID_2` (`resources_category_ID`),
  ADD KEY `post_ID` (`post_ID`),
  ADD KEY `post_ID_2` (`post_ID`);

--
-- Indexes for table `store_category`
--
ALTER TABLE `store_category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `store_description`
--
ALTER TABLE `store_description`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_ID` (`post_ID`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `category_ID` (`category_ID`);

--
-- Indexes for table `user_activation_code`
--
ALTER TABLE `user_activation_code`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `user_ID` (`user_ID`);

--
-- Indexes for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `user_post`
--
ALTER TABLE `user_post`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_ID` (`user_ID`),
  ADD KEY `category_type_ID` (`sub_category_ID`),
  ADD KEY `user_ID_2` (`user_ID`),
  ADD KEY `user_ID_3` (`user_ID`),
  ADD KEY `category_ID` (`category_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artxy_user`
--
ALTER TABLE `artxy_user`
  MODIFY `ID` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `category_type`
--
ALTER TABLE `category_type`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_category`
--
ALTER TABLE `event_category`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_post`
--
ALTER TABLE `event_post`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post_images`
--
ALTER TABLE `post_images`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post_like`
--
ALTER TABLE `post_like`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post_primary_image`
--
ALTER TABLE `post_primary_image`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resources_category`
--
ALTER TABLE `resources_category`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `store_category`
--
ALTER TABLE `store_category`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `store_description`
--
ALTER TABLE `store_description`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_activation_code`
--
ALTER TABLE `user_activation_code`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_credentials`
--
ALTER TABLE `user_credentials`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_post`
--
ALTER TABLE `user_post`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `artxy_user`
--
ALTER TABLE `artxy_user`
  ADD CONSTRAINT `artxy_user_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `user_activation_code` (`user_ID`);

--
-- Constraints for table `event_post`
--
ALTER TABLE `event_post`
  ADD CONSTRAINT `event_post_ibfk_1` FOREIGN KEY (`post_ID`) REFERENCES `user_post` (`ID`);

--
-- Constraints for table `post_like`
--
ALTER TABLE `post_like`
  ADD CONSTRAINT `post_like_ibfk_1` FOREIGN KEY (`profile_ID`) REFERENCES `artxy_user` (`ID`);

--
-- Constraints for table `resources_category`
--
ALTER TABLE `resources_category`
  ADD CONSTRAINT `resources_category_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `resources_category_post` (`resources_category_ID`);

--
-- Constraints for table `store_description`
--
ALTER TABLE `store_description`
  ADD CONSTRAINT `store_description_ibfk_1` FOREIGN KEY (`post_ID`) REFERENCES `user_post` (`ID`);

--
-- Constraints for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD CONSTRAINT `user_credentials_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `artxy_user` (`ID`);

--
-- Constraints for table `user_login`
--
ALTER TABLE `user_login`
  ADD CONSTRAINT `user_login_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `artxy_user` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
