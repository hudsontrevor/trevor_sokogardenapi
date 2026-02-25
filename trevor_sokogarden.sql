-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 25, 2026 at 09:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trevor_sokogarden`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_description` text NOT NULL,
  `product_category` varchar(255) NOT NULL,
  `product_cost` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `product_name`, `product_description`, `product_category`, `product_cost`, `product_image`) VALUES
(14, 'infinix', '16 gb ram 128 storage red in color android 14', 'electronics', 14000, 'infinix1.avif'),
(15, 'lenovo laptop', 'black in color 16 gb ram and 1TB ssd 1ntel core 8 enhanced graphics proccesor', 'electronics', 40500, 'lenovo 1.jpeg'),
(16, 'samsung galaxy s24', 'black in color 16 gb ram and 256 gb ram 60mp camera inbuilt galaxy AI', 'electronics', 40500, 'samsung111.jpeg'),
(17, 'samsung galaxy s25', 'black in color 16 gb ram and 256 gb ram 100mp camera inbuilt galaxy AI', 'electronics', 110000, 'samsung24+1.jpeg'),
(18, 'mika toaster', 'white in color mika bread toaster', 'electronics', 5600, 'Mika2slicetoaster.png'),
(19, 'alions kettle', 'white in color alions kettle', 'electronics', 7100, 'alionskettle.jpg'),
(20, 'magic book', 'wheat in color 16gb ram and 256gb rom enhanced graphics card and inbuilt AI assistant ', 'electronics', 120600, 'magic-book-7456276_1920.jpg'),
(21, 'mac book', 'white in color 16gb ram and 256gb rom enhanced graphics card and inbuilt AI assistant ', 'electronics', 110700, 'mac bookj pro.jpeg'),
(22, 'cooker', 'brown mika cooker uquiped qith an oven an 4 gaslights ', 'electronics', 56000, 'cooker.jpg'),
(24, 'elite book', 'grey elite book 16gb ram 256 gb rom backligjht inbuilt AI assistant wi warranty!!', 'electronics', 56000, 'elite book.avif'),
(26, 'washing machine mika', 'black in color durable wash equioed with dryier', 'electronics', 18000, 'washing machine.jpeg'),
(27, 'usb port expand ', 'durable usb port expand  has 9 usb ports for use', 'electronics', 7500, 'usb port expand.jpeg'),
(28, 'electric cooker', 'black in color electric cooker with five year warranty', 'electronics', 14000, 'electric cooker.jpeg'),
(29, 'smart watch', 'white in color aplle smart watch with inbuilt AI assistant', 'electronics', 10000, 'smart watch.jpeg'),
(30, 'thermometer ', 'colorless medical thermometer (uses mercury ) comes in dozen packs', 'medical equipment', 1000, 'thermometer-1539191_1920.jpg'),
(31, 'jbl earphones', 'red in color jbl earphones', 'electronics', 6000, 'jbl earphones.jpeg'),
(32, 'jars ', 'colorless jars comes in dozen packs ', 'utilities', 1200, 'jars-1853439_1920.jpg'),
(33, 'TCL television', 'TCL television 65inch display ', 'elestronics', 72000, 'screen6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `phone`, `password`) VALUES
(7, 'Mporine', 'trevorhudson190@gmail.com', '0713616426', '!@#$1234qwer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_name` (`product_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email_2` (`email`,`phone`),
  ADD UNIQUE KEY `phone_2` (`phone`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
