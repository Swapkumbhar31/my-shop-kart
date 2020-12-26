-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2016 at 05:10 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myshopkart`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--
CREATE DATABASE `myshopkart`;
mysql_select_db( `myshopkart` );
CREATE TABLE `cart` (
  `username` varchar(50) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `cart_quantity` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`username`, `product_id`, `cart_quantity`) VALUES
('admin2@gmail.com', 'QkNOUhV9BR5yS9wv', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productid` varchar(20) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `company` varchar(25) NOT NULL,
  `price` double(10,2) NOT NULL,
  `discount` int(11) NOT NULL,
  `product_category` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `entry_date` date NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productid`, `product_name`, `company`, `price`, `discount`, `product_category`, `quantity`, `entry_date`, `rating`) VALUES
('3FE4XvcAr9XPJSN6', 'Nexus 6P (Aluminium Silver, 64GB)', 'Nexus', 38999.00, 3, 'mobile', 7, '2016-09-07', 5),
('3KQj3tX1v5a4bRzq', 'Micromax Canvas Juice 2 AQ5001 (Silver, 8GB)', 'Micromax', 6462.00, 6, 'mobile', 9, '2016-09-04', 4),
('4Sk8UYjmtpInEUKT', 'Micromax Canvas Fire 4 A107 (Cosmic Grey, 8GB)', 'Micromax', 8299.00, 39, 'mobile', 29, '2016-09-07', 5),
('7Cd5HnVy9scSXwqu', 'Dell Inspiron 3555 15.6-inch Laptop (AMD E2-6110/4GB/500GB/Windows 10 Home/Integrated Graphics)', 'Dell', 22720.00, 2, 'laptop', 4, '2016-09-07', 4),
('8HtZxbn4fgmHdLJ8', 'Micromax Canvas Lapbook L1161 11.6-inch Laptop (Intel Atom/2GB/32GB/Windows 10), Black', 'Micromax', 14299.00, 0, 'laptop', 16, '2016-09-02', 3),
('8RgGDG9FjAvqdj9v', 'Lenovo Zuk Z1 (Space Grey, Cyanogen OS)', 'Lenovo', 13499.00, 8, 'mobile', 1, '2016-09-01', 4),
('8Rq7M5RIiMv8MFyi', 'Lenovo Ideapad 15.6-inch Laptop (Core i3 5th Gen/4GB/1TB/DOS/Integrated Graphics) Black', 'Lenovo', 24490.00, 0, 'laptop', 1, '2016-09-07', 3),
('8yewNDgtSuaSqNSl', 'Sony Xperia XA Dual (Graphite Black)', 'Sony', 20990.00, 14, 'mobile', 1, '2016-09-07', 4),
('9txQxJqfnSJtyETo', 'Micromax Canvas Laptab LT666 10.1-inch Touchscreen Laptop (Intel Atom Z3735F/2GB/32GB/Windows 10/Integrated Graphics/With 3G+WiFi), Grey', 'Micromax', 12500.00, 0, 'laptop', 38, '2016-09-08', 3),
('aeadJ7XnqPQIrsqJ', 'Samsung 121 cm (48 inches) 48J5300 Smart LED Television', 'Samsung', 80900.00, 20, 'Television', 1, '2016-09-03', 5),
('afdAG7NyVohBld5V', 'Apple MacBook Air MJVP2HN/A 11-inch (Core i5/4GB/256GB/OS X Yosemite/Intel HD Graphics 6000)', 'Apple', 78048.00, 0, 'laptop', 1, '2016-09-02', 5),
('B4Ximmxk9LHvPUpu', 'Micromax 109 cm (43 inches) L43T6950FHD Full HD LED TV', 'Micromax', 42990.00, 48, 'Television', 14, '2016-09-06', 4),
('bnFBWzlqS97bKsAQ', 'Dell Inspiron 15 3558 Z565106HIN9 15.6-inch Laptop (Core i3-5005U/4GB/1TB/Windows 10/Integrated Graphics), Black', 'Dell', 31980.00, 0, 'laptop', 4, '2016-09-06', 3),
('bPwGOusSIN3tzvN0', 'Apple MacBook Pro MF839HN/A 13-inch Laptop (Core i5/8GB/128GB/OS X Yosemite/Intel Iris Graphics 6100)', 'Apple', 106900.00, 20, 'laptop', 4, '2016-09-08', 5),
('eYmseQ3NLTaCs48u', 'Sony BRAVIA KLV-28R412B 70 cm (28 inches) HD Ready LED TV (Black)', 'Sony', 25900.00, 17, 'Television', 1, '2016-09-05', 3),
('F0wMDEcpg40NMyBH', 'LG 43LF6300 108 cm (43 inches) Full HD Smart LED TV', 'LG', 67000.00, 29, 'Television', 1, '2016-09-01', 4),
('FaB0Tasen450nZa3', 'Micromax 50.8 cm (20 inches) 20E8100HD HD Ready LED TV', 'Micromax', 11000.00, 26, 'Television', 14, '2016-09-01', 3),
('fndo2UUN6ZjRnpmj', 'Micromax 60 cm (24 inches) 24B600HDI HD Ready LED TV', 'Micromax', 13900.00, 32, 'Television', 19, '2016-09-06', 3),
('FVEXvuLqDngM5if2', 'Micromax Canvas Laptab LT666W 10.1-inch Touchscreen Laptop (Intel Atom Z3735F/2GB/32GB/Windows 10/Integrated Graphics/With WiFi Only), Grey', 'Micromax', 15999.00, 21, 'laptop', 34, '2016-09-08', 3),
('gOgqyA5whT32ure4', 'Dell Inspiron 3543 15.6-inch Laptop (Core i5 5200U/4GB/500GB/Windows 8.1/Nvidia GeForce 820M 2GB Graphics), Silver', 'Dell', 45990.00, 13, 'laptop', 1, '2016-09-09', 4),
('Gzh761GuoQEBPgfb', 'LG 123 cm (49 inches) 4K Ultra HDR LED(Black)', 'LG', 124900.00, 23, 'Television', 0, '2016-09-08', 5),
('i6uHotuGI6EpaBe8', 'HP Pavilion S003TU 11.6-inch Laptop (Celeron N3050/2GB/500GB/DOS/Intel HD Graphics), Twinkle Black', 'HP', 16990.00, 0, 'laptop', 7, '2016-09-01', 3),
('iFjqLDyx0GvYmtKZ', 'Lenovo Ideapad 110 80TJ00BNIH 15.6-inch Laptop (AMD A8-7410/8GB/1TB/DOS/2GB Graphics)', 'Lenovo', 25990.00, 0, 'laptop', 9, '2016-09-07', 3),
('IO3giavEqXGqQakp', 'LG 106 cm (42 inches) 42LF6500 Smart LED TV', 'LG', 69900.00, 11, 'Television', 1, '2016-09-04', 4),
('IQtOKMtavraUF493', 'Lenovo G50-80 80E503G1IN 15.6-inch Laptop (Core i3-5005U/8GB/500GB/Windows 10 Home/Integrated Graphics), Black', 'Lenovo', 30990.00, 0, 'laptop', 34, '2016-09-07', 3),
('JRdKMph47pV4RPpr', 'Dell Inspiron-11 3162 3162P4500iBL 11.6-inch Laptop (Pentium N3700/4GB/500GB/Windows 10/Integrated Graphics), Blue', 'Dell', 25399.00, 0, 'laptop', 7, '2016-09-07', 4),
('KT02rIA78COOs3DU', 'Panasonic Viera TH-L32SV6D 81 cm (32 inches) HD Ready LED TV (Black)', 'Panasonic', 32000.00, 20, 'Television', 1, '2016-09-05', 4),
('KYTpGwiH8oHjAZ83', 'Sony Xperia Z5 Premium Dual (Gold)', 'Sony', 44989.00, 5, 'mobile', 18, '2016-09-01', 4),
('l9HLfwHeacfBeofG', 'Sony Xperia M2 (Black, 8GB)', 'Sony', 15000.00, 6, 'mobile', 1, '2016-09-02', 4),
('lP4XqwyKkUsKoxa5', 'Moto G Plus, 4th Gen (Black, 32 GB)', 'Motorola', 14999.00, 5, 'mobile', 4, '2016-09-06', 4),
('Mi3GXvy70YAFcTFc', 'HP 15-AC650TU Portable 4th Gen Intel Core i5 Processor-4210U-4GB RAM-1TB HDD-DOS, JACK BLACK', 'HP', 31189.00, 2, 'laptop', 7, '2016-09-06', 3),
('N7860EkhNCVQeeHW', 'Lenovo Yoga 500 14-inch 2 in 1 Touch Screen Laptop (Core i5 6th Gen/4GB/500GB/Window 10 Home/Integrated Graphics), Black', 'Lenovo', 50015.00, 4, 'laptop', 1, '2016-09-09', 5),
('npPtAquhDZwTpias', 'Lenovo G50-80 15.6-inch Laptop (Core i3-5005U/8GB/1TB/Windows 10 Home/2GB Graphics), Black', 'Lenovo', 41790.00, 14, 'laptop', 29, '2016-09-08', 5),
('npvUhI3gBKnjd4NU', 'Micromax Canvas Pace 4G Q416', 'Micromax', 5461.00, 5, 'mobile', 4, '2016-09-06', 4),
('NyUITjxEl91Td4eX', 'Panasonic TH-49CS580D 124 cm (49 inches) HD  LED TV', 'Panasonic', 67690.00, 0, 'Television', 1, '2016-09-06', 4),
('O3TkU0JI4Pdu6Gdc', 'Huawei Honor 5X (Gold, 16GB)', 'Huawei', 12999.00, 6, 'mobile', 1, '2016-09-05', 3),
('OBeXZaSpBwbse3Fw', 'HP 15-AC168TU 15.6-inch Laptop (Pentium 3825U/4GB/500GB/Windows 10/Integrated Graphics), Black', 'HP', 21999.00, 0, 'laptop', 9, '2016-09-01', 3),
('OjI9hyqmifcfNsJM', 'Sony 60 cm (24 inches) Bravia KLV-24P413D HD Ready LED TV (Black)', 'Sony', 16900.00, 12, 'Television', 9, '2016-09-05', 4),
('PpgRWmiTcwhjwpDV', 'Apple Macbook Pro MD101HN/A 13-inch Laptop (Core i5/4GB/500GB/Mac OS Mavericks/Intel HD Graphics), Silver', 'Apple', 78900.00, 35, 'laptop', 1, '2016-09-06', 4),
('QkNOUhV9BR5yS9wv', 'Apple iPhone 6s (Rose Gold, 16GB)', 'Apple', 42990.00, 2, 'mobile', 0, '2016-09-07', 5),
('qVpgplclbVkd5mJE', 'Lenovo G50-80 80E502Q8IH 15.6-inch Laptop (Core i3-5005U/4GB/1TB/DOS/Integrated Graphics), Black', 'Lenovo', 25950.00, 0, 'laptop', 34, '2016-09-08', 4),
('rCpwvikMJRP5qarc', 'Micromax Canvas Laptab II LT777 11.6-inch Touchscreen Laptop (Intel Atom/2GB/32GB/Windows 10/With 3G and WiFi)', 'Micromax', 17999.00, 14, 'laptop', 7, '2016-09-01', 3),
('rCxawb3zYqB30IYL', 'Honor 7 (Mystery Grey)', 'Honor', 22999.00, 9, 'mobile', 1, '2016-09-01', 2),
('Rd8OdtvHvfyR2Sju', 'HP 15-AY020TU 15.6-inch Laptop (Core i3-5005U/4GB/1TB/Windows 10 Home/Integrated Graphics), Turbo Silver', 'HP', 32478.00, 0, 'laptop', 1, '2016-09-01', 3),
('SP8IdqjgioAIxxoC', 'Samsung On7 Pro (Gold)', 'Samsung', 11190.00, 4, 'mobile', 1, '2016-09-07', 4),
('swoJjNkhS96sRmgU', 'HP 14-AM081TU 14-inch Laptop (Core i5 6th Gen/4GB/1TB/Windows 10 Home/Integrated Graphics), Turbo Silver', 'HP', 39990.00, 0, 'laptop', 4, '2016-09-07', 4),
('UfIg9i1i8YFbnlKL', 'Micromax Neo PQC LPQ61407W 14.1-inch Laptop (Pentium N3700/4GB/500GB/Windows 10/Integrated Graphics),Black', 'Micromax', 17990.00, 0, 'laptop', 34, '2016-09-08', 3),
('v3X3MLgW7SfbuFe5', 'Nokia 130 (Dual SIM, Black)', 'Nokia', 1870.00, 0, 'mobile', 34, '2016-09-01', 4),
('V5ePQta1SvaSFgW2', 'Sony 80.0 cm (32 inches) KLV-W512D HD Ready LED Smart TV', 'Sony', 34900.00, 10, 'Television', 1, '2016-09-08', 4),
('Vl1SZbB3280mYY31', 'Sony Xperia Z1 (Black)', 'Sony', 20500.00, 0, 'mobile', 8, '2016-09-06', 3),
('WamFgzlyI2JNyfH7', 'Panasonic 28D400DX 28 Inches Panasonic LED TV', 'Panasonic', 14246.00, 0, 'Television', 1, '2016-09-06', 3),
('WGrMqu2VOmtGTt28', 'Sony Bravia KD-55X9000C IN5 139.7 cm (55 inches) 4K Ultra HD 3D LED TV (Black)', 'Sony', 284900.00, 25, 'Television', 1, '2016-09-08', 5),
('Ws3NiWEhVIwhUG4z', 'Micromax 81 cm (32 inches) 32T7260HDI HD Ready LED TV (Black)', 'Micromax', 19990.00, 33, 'Television', 9, '2016-09-08', 3),
('x7KvcYx8XH4unjuC', 'Lenovo Vibe K4 Note (Black, 16GB)', 'Lenovo', 10999.00, 4, 'mobile', 1, '2016-09-02', 4),
('xDGAgyPYC0GFvKhF', 'Sony 55 cm (22 inches) Bravia Full HD LED TV (Black)', 'Sony', 14400.00, 10, 'Television', 4, '2016-09-07', 5),
('zU2YQPB6cSATqOU8', 'Apple MacBook Air MMGF2HN/A 13.3-inch Laptop (Core i5/8GB/128GB/Mac OS X/Integrated Graphics)', 'Apple', 61399.00, 0, 'laptop', 0, '2016-09-07', 5);

-- --------------------------------------------------------

--
-- Table structure for table `transcations`
--

CREATE TABLE `transcations` (
  `t_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transcations`
--

INSERT INTO `transcations` (`t_id`, `username`, `address`, `amount`, `date`) VALUES
(42811701, 'admin@gmail.com', 'hello3216', 157572.00, '2016-09-15'),
(77951648, 'admin@gmail.com', 'KALYAN', 37829.03, '2016-10-21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `fname` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `lname` varchar(25) NOT NULL,
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`fname`, `username`, `password`, `lname`, `contact`) VALUES
('Swapnil', 'admin2@gmail.com', 'admin', 'Kumbhar', '1234567890'),
('Swapnil', 'admin@gmail.com', 'admin', 'Kumbhar', '123456890'),
('Swapnil', 'swap96@gmail.com', 'swap', 'Kumbhar', '7738190281');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `transcations`
--
ALTER TABLE `transcations`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
