-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2024 at 01:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ejusticesys`
--

-- --------------------------------------------------------

--
-- Table structure for table `movrate`
--

CREATE TABLE `movrate` (
  `id` int(11) NOT NULL,
  `barangay` int(11) NOT NULL,
  `mov_id` int(255) NOT NULL,
  `IA_1a_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IA_1b_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IA_2a_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IA_2b_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IA_2c_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IA_2d_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IA_2e_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IB_1forcities_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IB_1aformuni_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IB_1bformuni_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IB_2_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IB_3_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IB_4_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IC_1_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IC_2_pdf_rate` decimal(11,0) DEFAULT NULL,
  `ID_1_pdf_rate` decimal(11,0) DEFAULT NULL,
  `ID_2_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IIA_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IIB_1_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IIB_2_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IIC_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IIIA_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IIIB_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IIIC_1forcities_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IIIC_1forcities2_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IIIC_1forcities3_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IIIC_2formuni1_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IIIC_2formuni2_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IIIC_2formuni3_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IIID_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IV_forcities_pdf_rate` decimal(11,0) DEFAULT NULL,
  `IV_muni_pdf_rate` decimal(11,0) DEFAULT NULL,
  `V_1_pdf_rate` decimal(11,0) DEFAULT NULL,
  `threepeoplesorg_rate` decimal(11,0) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movrate`
--
ALTER TABLE `movrate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mov_id` (`mov_id`),
  ADD KEY `barangay` (`barangay`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movrate`
--
ALTER TABLE `movrate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movrate`
--
ALTER TABLE `movrate`
  ADD CONSTRAINT `movrate_ibfk_2` FOREIGN KEY (`barangay`) REFERENCES `mov` (`barangay_id`),
  ADD CONSTRAINT `movrate_ibfk_3` FOREIGN KEY (`mov_id`) REFERENCES `mov` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
