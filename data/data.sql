-- phpMyAdmin SQL Dump
-- version 4.3.0-dev
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 19, 2015 at 08:46 AM
-- Server version: 5.5.40-0ubuntu0.12.04.1-log
-- PHP Version: 5.5.20-1+deb.sury.org~precise+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `data`
--

-- --------------------------------------------------------

--
-- Table structure for table `12306`
--

CREATE TABLE IF NOT EXISTS `12306` (
`id` int(11) NOT NULL,
  `account` varchar(30) NOT NULL COMMENT '账号',
  `pwd` varchar(30) NOT NULL COMMENT '密码',
  `name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `id_number` varchar(30) DEFAULT NULL COMMENT '身份证号码',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `mobile` text COMMENT '电话号码',
  `email` varchar(30) DEFAULT NULL COMMENT '注册邮箱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='12306.cn 2015年泄露数据';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `12306`
--
ALTER TABLE `12306`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `12306`
--
ALTER TABLE `12306`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
