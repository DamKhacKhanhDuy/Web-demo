-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 30, 2022 lúc 05:55 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `weblinhkien`
--
CREATE DATABASE IF NOT EXISTS `weblinhkien` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `weblinhkien`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adminId` int(11) NOT NULL,
  `adminName` varchar(255) NOT NULL,
  `adminEmail` varchar(150) NOT NULL,
  `adminUser` varchar(255) NOT NULL,
  `adminPass` varchar(200) NOT NULL,
  `level` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminId`, `adminName`, `adminEmail`, `adminUser`, `adminPass`, `level`) VALUES
(1, 'DuyAdmin', 'duy@gmail.com', 'duy', 'e10adc3949ba59abbe56e057f20f883e', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brandId` int(11) UNSIGNED NOT NULL,
  `brandName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(6, 'GIGABYTE'),
(7, 'MSI'),
(8, 'ASUS'),
(9, 'INTEL'),
(10, 'AMD'),
(11, 'Samsung'),
(12, 'Acer'),
(13, 'HP'),
(14, 'XIGMATEK');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartId` int(11) NOT NULL,
  `productId` int(11) UNSIGNED NOT NULL,
  `sId` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` varchar(200) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_cart`
--

INSERT INTO `tbl_cart` (`cartId`, `productId`, `sId`, `productName`, `price`, `quantity`, `image`) VALUES
(32, 17, 'dam0prr4pcnejrqn4u4dnicdcb', 'Mainboard MSI B450 TOMAHAWK MAX', '1190000', 2, '365e37f96c.jfif');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catId` int(11) UNSIGNED NOT NULL,
  `catName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`) VALUES
(10, 'Bo mạch chủ (Mainboard)'),
(11, 'Bộ vi xử lý (CPU)'),
(12, 'Ram máy tính'),
(13, 'Card đồ họa'),
(14, 'Ổ cứng (HDD hoặc SSD)'),
(15, 'Nguồn máy tính PSU'),
(16, 'Case'),
(17, 'Màn hình');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `city`, `phone`, `email`, `password`) VALUES
(7, 'Khánh Duy', 'HaNoi', 'HN', '09123456721', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `productId` int(11) UNSIGNED NOT NULL,
  `productName` varchar(255) NOT NULL,
  `customer_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date_order` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `productId`, `productName`, `customer_id`, `quantity`, `price`, `image`, `status`, `date_order`) VALUES
(12, 11, 'Mainboard GIGABYTE B365M AORUS ELITE', 7, 3, '7050000', 'eff4d0f1b8.png', 0, '2022-05-29 14:56:13'),
(13, 17, 'Mainboard MSI B450 TOMAHAWK MAX', 7, 1, '1190000', '365e37f96c.jfif', 0, '2022-05-29 16:47:23'),
(14, 38, 'Màn Hình cong Samsung 27\" LC27F397FHEXXV', 7, 1, '5900000', '23998f9e40.jpg', 0, '2022-05-29 16:47:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productId` int(11) UNSIGNED NOT NULL,
  `productName` varchar(255) NOT NULL,
  `catId` int(11) UNSIGNED NOT NULL,
  `brandId` int(11) UNSIGNED NOT NULL,
  `product_desc` text NOT NULL,
  `type` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `catId`, `brandId`, `product_desc`, `type`, `price`, `image`) VALUES
(11, 'Mainboard GIGABYTE B365M AORUS ELITE', 10, 6, '<p><span>Mainboard GIGABYTE B365M AORUS ELITE</span></p>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '2350000', 'eff4d0f1b8.png'),
(12, 'Mainboard GIGABYTE GA-A320M-S2H', 10, 6, '<p><span>Mainboard GIGABYTE GA-A320M-S2H</span></p>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '1290000', '16359ad347.jpg'),
(13, 'Mainboard MSI H310M PRO-VDH PLUS', 10, 7, '<h4 class=\"font-weight-bold\"><span>Mainboard MSI H310M PRO-VDH PLUS</span></h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '1600000', '083da1f506.jpg'),
(14, 'Mainboard GIGABYTE B365M-DS3H', 10, 6, '<p>Mainboard GIGABYTE B365M-DS3H</p>', 0, '1690000', 'ef4ece9995.jpg'),
(15, 'Mainboard ASUS EX-H310M-V3 R2.0', 10, 8, '<h4 class=\"font-weight-bold\">Mainboard ASUS EX-H310M-V3 R2.0</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '1690000', '99eb07157a.jfif'),
(16, 'Mainboard GIGABYTE GA-H81M-DS2', 10, 6, '<h4 class=\"font-weight-bold\">Mainboard GIGABYTE GA-H81M-DS2</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '2210000', '7699f5f94b.jpg'),
(17, 'Mainboard MSI B450 TOMAHAWK MAX', 10, 7, '<h4 class=\"font-weight-bold\">Mainboard MSI B450 TOMAHAWK MAX</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '1190000', '365e37f96c.jfif'),
(18, 'Mainboard GIGABYTE GA-A320M-S2H SKU: 1810767', 10, 6, '<h4 class=\"font-weight-bold\">Mainboard GIGABYTE GA-A320M-S2H SKU: 1810767</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '1790000', 'c3188a2754.jpg'),
(19, 'CPU INTEL Core i7-9700 (8C/8T, 3.00 GHz up to 4.70 GHz, 12MB) - 1151-v2', 11, 9, '<h4 class=\"font-weight-bold\">CPU INTEL Core i7-9700 (8C/8T, 3.00 GHz up to 4.70 GHz, 12MB) - 1151-v2</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '8990000', '0186005d82.jpg'),
(20, 'CPU Intel Core i5-9400F (6C/6T, 2.9 - 4.1 GHz, 9MB) - LGA 1151-v2', 11, 9, '<h4 class=\"font-weight-bold\">CPU Intel Core i5-9400F (6C/6T, 2.9 - 4.1 GHz, 9MB) - LGA 1151-v2</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '3790000', '99563a1bdf.jpg'),
(21, 'CPU Intel Core i3-9100F(4C/4T, 3.60 GHz)', 11, 9, '<h4 class=\"font-weight-bold\">CPU Intel Core i3-9100F(4C/4T, 3.60 GHz)</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '2100000', '57a79c8f2b.jpg'),
(22, 'CPU Intel Pentium G5400 (2C/4T, 3.7 GHz, 4MB)', 11, 9, '<h4 class=\"font-weight-bold\">CPU Intel Pentium G5400 (2C/4T, 3.7 GHz, 4MB)</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '1600000', '3efc3c156c.jpg'),
(23, 'CPU INTEL Core i5-10400 (6C/12T, 2.90 GHz Up to 4.30 GHz, 12MB) - 1200', 11, 9, '<h4 class=\"font-weight-bold\">CPU INTEL Core i5-10400 (6C/12T, 2.90 GHz Up to 4.30 GHz, 12MB) - 1200</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '2999999', 'ca7e1caf02.webp'),
(24, 'CPU AMD Ryzen 3 3200G (4C/4T, 3.6 GHz - 4.0 GHz', 11, 9, '<h4 class=\"font-weight-bold\">CPU AMD Ryzen 3 3200G (4C/4T, 3.6 GHz - 4.0 GHz</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '3090000', '5335bcf66a.jfif'),
(25, 'CPU INTEL Core i7-9200 (8C/8T, 3.00 GHz up to 4.7', 11, 9, '<h4 class=\"font-weight-bold\">CPU INTEL Core i7-9200 (8C/8T, 3.00 GHz up to 4.7</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '7900000', '2bb2ed7ee5.jpeg'),
(26, 'CPU AMD Ryzen 5 3400G (4C/8T, 3.7 GHz - 4.2 GHz, 4MB) - AM4', 11, 10, '<h4 class=\"font-weight-bold\">CPU AMD Ryzen 5 3400G (4C/8T, 3.7 GHz - 4.2 GHz, 4MB) - AM4</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '3290000', 'c535c6719f.jpeg'),
(27, 'Card màn hình ASUS ROG Strix RTX 2060 8GB GAMING', 13, 8, '<h4 class=\"font-weight-bold\">Card m&agrave;n h&igrave;nh ASUS ROG Strix RTX 2060 8GB GAMING</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '12990000', 'a1f195f3c2.jpg'),
(28, 'Card màn hình MSI GeForce GTX 1050Ti 4GB GDDR5 OCV1', 13, 7, '<h4 class=\"font-weight-bold\">Card m&agrave;n h&igrave;nh MSI GeForce GTX 1050Ti 4GB GDDR5 OCV1</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '4890000', 'ce0177ca54.jpg'),
(29, 'Card màn hình MSI GeForce GTX 1050Ti 4GB GDDR5 OCV1', 13, 7, '<h4 class=\"font-weight-bold\">Card m&agrave;n h&igrave;nh MSI GeForce GTX 1050Ti 4GB GDDR5</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '9000000', '9f80d36666.jpg'),
(30, 'Card màn hình GIGABYTE GeForce GTX 1650 4GB', 13, 6, '<h4 class=\"font-weight-bold\">Card m&agrave;n h&igrave;nh GIGABYTE GeForce GTX 1650 4GB</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '7900000', '203395e9f8.png'),
(31, 'Case máy tính Sama Jax 10', 16, 6, '<h4 class=\"font-weight-bold\">Case m&aacute;y t&iacute;nh Sama Jax 10</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '670000', 'eb9882270d.jpg'),
(32, 'Case máy tính Sama M1', 16, 6, '<p>&nbsp;</p>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '490000', 'dc2271d55a.jpg'),
(33, 'Case máy tính Sama Shadow', 16, 8, '<p>Case m&aacute;y t&iacute;nh Sama Shadow</p>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '890000', '50df1021de.jpg'),
(34, 'Case máy tính XIGMATEK Gemini Queen - Mid Tower (Hồng)', 16, 14, '<h4 class=\"font-weight-bold\">Case m&aacute;y t&iacute;nh XIGMATEK Gemini Queen - Mid Tower (Hồng)</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '730000', 'c379343c8c.png'),
(35, 'Màn hình Acer 21.5\" HA220QA', 17, 12, '<h4 class=\"font-weight-bold\">M&agrave;n h&igrave;nh Acer 21.5\" HA220QA</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '5980000', 'be4927e879.jpg'),
(36, 'Màn Hình HP 21.5\" 22fw 3KS61AA', 17, 13, '<h4 class=\"font-weight-bold\">M&agrave;n H&igrave;nh HP 21.5\" 22fw 3KS61AA</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '5600000', 'da9d7e1e50.jpg'),
(37, 'Màn Hình cong Samsung 23.5\" LC24F390FHEXXV', 17, 11, '<h4 class=\"font-weight-bold\">M&agrave;n H&igrave;nh cong Samsung 23.5\" LC24F390FHEXXV</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '6790000', '214ad280e2.jpg'),
(38, 'Màn Hình cong Samsung 27\" LC27F397FHEXXV', 17, 11, '<h4 class=\"font-weight-bold\">M&agrave;n H&igrave;nh cong Samsung 27\" LC27F397FHEXXV</h4>\r\n<div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\">&nbsp;</div>', 0, '5900000', '23998f9e40.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `sliderId` int(11) NOT NULL,
  `sliderName` varchar(255) NOT NULL,
  `slider_image` varchar(255) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_slider`
--

INSERT INTO `tbl_slider` (`sliderId`, `sliderName`, `slider_image`, `type`) VALUES
(4, 'slider1', 'd47794fde0.jpg', 1),
(5, 'slider2', '267ff4a851.jpg', 1),
(6, 'slider3', 'b43e3830a8.jpg', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Chỉ mục cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Chỉ mục cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartId`),
  ADD KEY `productId` (`productId`);

--
-- Chỉ mục cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catId`);

--
-- Chỉ mục cho bảng `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`,`customer_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `catId` (`catId`,`brandId`),
  ADD KEY `brandId` (`brandId`);

--
-- Chỉ mục cho bảng `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`sliderId`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `sliderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD CONSTRAINT `tbl_cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `tbl_product` (`productId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `tbl_product` (`productId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `tbl_category` (`catId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `tbl_brand` (`brandId`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
