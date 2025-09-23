-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Sep 23, 2025 at 12:59 PM
-- Server version: 12.0.2-MariaDB-ubu2404
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `   Zillow`
--

-- --------------------------------------------------------

--
-- Table structure for table `Favorites`
--

CREATE TABLE `Favorites` (
  `FavoriteId` int(10) UNSIGNED NOT NULL,
  `UserId` int(10) UNSIGNED DEFAULT NULL,
  `PropertyId` int(10) UNSIGNED DEFAULT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_estonian_as_cs;

-- --------------------------------------------------------

--
-- Table structure for table `Inquiries`
--

CREATE TABLE `Inquiries` (
  `InquiryId` int(10) UNSIGNED NOT NULL,
  `UserId` int(10) UNSIGNED DEFAULT NULL,
  `PropertyId` int(10) UNSIGNED DEFAULT NULL,
  `Message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `InquiryDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_estonian_as_cs;

-- --------------------------------------------------------

--
-- Table structure for table `Properties`
--

CREATE TABLE `Properties` (
  `PropertyId` int(10) UNSIGNED NOT NULL,
  `OwnerId` int(10) UNSIGNED DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `zipcode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` decimal(12,0) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bedrooms` int(10) UNSIGNED NOT NULL,
  `bathrooms` int(10) UNSIGNED NOT NULL,
  `sqft` int(10) UNSIGNED NOT NULL,
  `ListingDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_estonian_as_cs;

-- --------------------------------------------------------

--
-- Table structure for table `PropertyImages`
--

CREATE TABLE `PropertyImages` (
  `ImgId` int(10) UNSIGNED NOT NULL,
  `PropertyId` int(10) UNSIGNED DEFAULT NULL,
  `ImgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_estonian_as_cs;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UserId` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PasswordHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PhoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CreatedTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_estonian_as_cs;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Favorites`
--
ALTER TABLE `Favorites`
  ADD PRIMARY KEY (`FavoriteId`),
  ADD KEY `user.id` (`UserId`),
  ADD KEY `property.id` (`PropertyId`);

--
-- Indexes for table `Inquiries`
--
ALTER TABLE `Inquiries`
  ADD PRIMARY KEY (`InquiryId`),
  ADD KEY `user.id` (`UserId`),
  ADD KEY `property.id` (`PropertyId`);

--
-- Indexes for table `Properties`
--
ALTER TABLE `Properties`
  ADD PRIMARY KEY (`PropertyId`),
  ADD KEY `owner.id` (`OwnerId`),
  ADD KEY `price` (`price`);

--
-- Indexes for table `PropertyImages`
--
ALTER TABLE `PropertyImages`
  ADD PRIMARY KEY (`ImgId`),
  ADD KEY `property.id` (`PropertyId`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Favorites`
--
ALTER TABLE `Favorites`
  MODIFY `FavoriteId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Inquiries`
--
ALTER TABLE `Inquiries`
  MODIFY `InquiryId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Properties`
--
ALTER TABLE `Properties`
  MODIFY `PropertyId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PropertyImages`
--
ALTER TABLE `PropertyImages`
  MODIFY `ImgId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;


