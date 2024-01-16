-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2023 at 07:53 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `ecommerece`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Michael Kors'),
(2, 'Lacoste'),
(3, 'maybelline'),
(4, 'sheglam'),
(5, 'Gucci'),
(6, 'adidas');

-- --------------------------------------------------------

--
-- Table structure for table `cart NNNNNNNNNN`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Women'),
(2, 'Men'),
(3, 'Kids'),
(4, 'Accessories'),
(5, 'Beauty'),
(6, 'Shoes'),
(7, 'Home');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'sara@gmail.com'),
(5, 'ali@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL  ,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Jumpsuit tops dresses Skirts Weddings Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 1, 'Women Clothing', 100, 'Women Clothing Dress', 'w1.png', 'Women'),
(2, 1, 1, 'Women Clothing', 100, 'Women Clothing Dress', 'w11.png', 'Women'),
(3, 1, 1, 'Women Clothing', 100, 'Women Clothing Dress', 'w2.png', 'Women'),
(4, 1, 2, 'Women Clothing', 100, 'Women Clothing Dress', 'w22.png', 'Women'),
(5, 1, 2, 'Women Clothing', 100, 'Women Clothing Dress', 'w3.png', 'Women'),
(6, 1, 2, 'Women Clothing', 100, 'Women Clothing Dress', 'w33.png', 'Women'),
(7, 1, 5, 'Women Clothing', 100, 'Women Clothing Dress', 'w4.png', 'Women'),
(8, 1, 5, 'Women Clothing', 100, 'Women Clothing Dress', 'w44.png', 'Women'),
(9, 1, 5, 'Women Clothing', 100, 'Women Clothing Dress', 'w5.png', 'Women'),
(10, 1, 6, 'Women Clothing', 100, 'Women Clothing Dress', 'w55.png', 'Women'),
(11, 1, 6, 'Women Clothing', 100, 'Women Clothing Dress', 'w6.png', 'Women'),
(12, 1, 6, 'Women Clothing', 100, 'Women Clothing Dress', 'w66.png', 'Women'),
(13, 1, 6, 'Women Clothing', 100, 'Women Clothing Dress', 'w7.png', 'Women'),
(14, 1, 6, 'Women Clothing', 100, 'Women Clothing Dress', 'w77.png', 'Women'),
(15, 2, 1, 'Men Clothing', 150, 'Men Clothing', 'm1.png', 'Men'),
(16, 2, 1, 'Men Clothing', 150, 'Men Clothing', 'm2.png', 'Men'),
(17, 2, 1, 'Men Clothing', 150, 'Men Clothing', 'm3.png', 'Men'),
(19, 2, 1, 'Men Clothing', 150, 'Men Clothing', 'm4.png', 'Men'),
(20, 2, 2, 'Men Clothing', 150, 'Men Clothing', 'm5.png', 'Men'),
(21, 2, 2, 'Men Clothing', 150, 'Men Clothing', 'm6.png', 'Men'),
(22, 2, 2, 'Men Clothing', 150, 'Men Clothing', 'm7.png', 'Men'),
(23, 2, 2, 'Men Clothing', 150, 'Men Clothing', 'm11.png', 'Men'),
(24, 2, 5, 'Men Clothing', 150, 'Men Clothing', 'm22.png', 'Men'),
(25, 2, 5, 'Men Clothing', 150, 'Men Clothing', 'm33.png', 'Men'),
(27, 2, 5, 'Men Clothing', 150, 'Men Clothing', 'm44.png', 'Men'),
(28, 2, 5, 'Men Clothing', 150, 'Men Clothing', 'm55.png', 'Men'),
(29, 2, 5, 'Men Clothing', 150, 'Men Clothing', 'm66.png', 'Men'),
(30, 2, 5, 'Men Clothing', 150, 'Men Clothing', 'm77.png', 'Men'),
(31, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k1.png', 'kids'),
(32, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k2.png', 'kids'),
(33, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k3.png', 'kids'),
(34, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k4.png', 'kids'),
(35, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k5.png', 'kids'),
(36, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k6.png', 'kids'),
(37, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k7.png', 'kids'),
(38, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k11.png', 'kids'),
(39, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k22.png', 'kids'),
(40, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k33.png', 'kids'),
(41, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k44.png', 'kids'),
(42, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k55.png', 'kids'),
(43, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k66.png', 'kids'),
(44, 3, 5, 'Kids Clothing', 150, 'kids Clothing', 'k77.png', 'kids'),
(45, 5, 4, 'Beauty', 50, 'Makeup', 'b1.png', 'Makeup'),
(46, 5, 4, 'Beauty', 50, 'Makeup', 'b2.png', 'Makeup'),
(47, 5, 4, 'Beauty', 50, 'Makeup', 'b3.png', 'Makeup'),
(48, 5, 4, 'Beauty', 50, 'Makeup', 'b4.png', 'Makeup'),
(49, 5, 4, 'Beauty', 50, 'Makeup', 'b5.png', 'Makeup'),
(50, 5, 4, 'Beauty', 50, 'Makeup', 'b6.png', 'Makeup'),
(51, 5, 4, 'Beauty', 50, 'Makeup', 'b7.png', 'Makeup'),
(52, 5, 3, 'Beauty', 50, 'Makeup', 'b11.png', 'Makeup'),
(53, 5, 3, 'Beauty', 50, 'Makeup', 'b22.png', 'Makeup'),
(54, 5, 3, 'Beauty', 50, 'Makeup', 'b33.png', 'Makeup'),
(55, 5, 3, 'Beauty', 50, 'Makeup', 'b44.png', 'Makeup'),
(56, 5, 3, 'Beauty', 50, 'Makeup', 'b55.png', 'Makeup'),
(57, 5, 3, 'Beauty', 50, 'Makeup', 'b66.png', 'Makeup'),
(58, 5, 3, 'Beauty', 50, 'Makeup', 'b77.png', 'Makeup'),
(59, 5, 3, 'Beauty', 50, 'Makeup', 'b88.png', 'Makeup'),
(60, 1, 6, 'Women Clothing', 70, 'Women Clothing Dress', 'w11.png', 'Women'),
(61, 2, 6, 'Men Clothing', 70, 'Men Clothing', 'm11.png', 'Men'),
(62, 3, 6, 'Kids', 70, 'Kids', 'k11.png', 'kids'),
(63, 4, 6, 'Accessories', 70, 'Accessories', 'j11.png', 'Makeup'),
(64, 5, 3, 'Beauty', 70, 'Makeup', 'b11.png', 'Makeup'),
(65, 5, 3, 'Beauty', 70, 'Makeup', 'b22.png', 'Makeup'),
(66, 4, 6, 'Accessories', 480, 'Accessories', 'j1.JPG', 'Accessories'),
(67, 4, 6, 'Accessories', 480, 'Accessories', 'j2.JPG', 'Accessories'),
(68, 4, 6, 'Accessories', 480, 'Accessories', 'j3.JPG', 'Accessories'),
(69, 4, 6, 'Accessories', 480, 'Accessories', 'j4.JPG', 'Accessories'),
(70, 1, 6, 'Women Clothing', 70, 'Women Clothing Dress', 'w1.png', 'Women'),
(71, 1, 2, 'Women Clothing', 70, 'Women Clothing Dress', 'w2.png', 'Women'),
(72, 2, 2, 'Men Clothing', 70, 'Men Clothing', 'm1.png', 'Men'),
(73, 2, 2, 'Men Clothing', 70, 'Men Clothing', 'm2.png', 'Men'),
(74, 3, 1, 'Kids', 70, 'Kids', 'k1.png', 'kids'),
(75, 4, 1, 'Accessories', 70, 'accessories', 'j1.png', 'accessories'),
(76, 6, 5, 'shoes', 4500, 'shoes', 's1.png', 'shoes'),
(77, 6, 5, 'shoes', 4500, 'shoes', 's2.png', 'shoes'),
(78, 6, 5, 'shoes', 4500, 'shoes', 's3.png', 'shoes'),
(79, 6, 5, 'shoes', 4500, 'shoes', 's4.png', 'shoes'),
(80, 6, 5, 'shoes', 4500, 'shoes', 's5.png', 'shoes'),
(81, 6, 5, 'shoes', 4500, 'shoes', 's6.png', 'shoes');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(2, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(3, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(4, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(5, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(6, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(7, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(8, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(9, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
