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

-- Database: `zillow`

-- --------------------------------------------------------

-- Table structure for table `favorites`
CREATE TABLE `favorites` (
  `favorite_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  UNIQUE KEY `unique_favorite` (`user_id`, `property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Table structure for table `inquiries`
CREATE TABLE `inquiries` (
  `inquiry_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `agent_id` int(10) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `inquiry_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Table structure for table `properties`
CREATE TABLE `properties` (
  `property_id` int(10) UNSIGNED NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `price` decimal(12,0) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `bedrooms` int(10) UNSIGNED NOT NULL,
  `bathrooms` int(10) UNSIGNED NOT NULL,
  `sqft` int(10) UNSIGNED NOT NULL,
  `listing_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('active', 'sold', 'pending') DEFAULT 'active',
  `ownership_type` varchar(50) DEFAULT NULL,
  `property_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Table structure for table `property_images`
CREATE TABLE `property_images` (
  `img_id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `img_order` int UNSIGNED DEFAULT 0,
  `alt_text` varchar(255) DEFAULT NULL,
  UNIQUE KEY `unique_property_image` (`property_id`, `img_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Table structure for table `users`
CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Indexes for table `favorites`
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `property_id` (`property_id`);

-- Indexes for table `inquiries`
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`inquiry_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `property_id` (`property_id`),
  ADD KEY `agent_id` (`agent_id`);

-- Indexes for table `properties`
ALTER TABLE `properties`
  ADD PRIMARY KEY (`property_id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `price` (`price`);

-- Indexes for table `property_images`
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `property_id` (`property_id`);

-- Indexes for table `users`
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

-- AUTO_INCREMENT for tables
ALTER TABLE `favorites`
  MODIFY `favorite_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `inquiries`
  MODIFY `inquiry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `properties`
  MODIFY `property_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `property_images`
  MODIFY `img_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

-- Foreign key constraints (optional but recommended)
ALTER TABLE `favorites`
  ADD CONSTRAINT `fk_fav_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_fav_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`);

ALTER TABLE `inquiries`
  ADD CONSTRAINT `fk_inq_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_inq_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`),
  ADD CONSTRAINT `fk_inq_agent` FOREIGN KEY (`agent_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `properties`
  ADD CONSTRAINT `fk_prop_owner` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `property_images`
  ADD CONSTRAINT `fk_img_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`);

COMMIT;



