-- phpMyAdmin SQL Dump
-- version 4.3.0-dev
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 19, 2015 at 09:01 AM
-- Server version: 5.5.40-0ubuntu0.12.04.1-log
-- PHP Version: 5.5.20-1+deb.sury.org~precise+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wei_call`
--

-- --------------------------------------------------------

--
-- Table structure for table `sms_status`
--

CREATE TABLE IF NOT EXISTS `sms_status` (
`id` int(11) NOT NULL,
  `to_userid` varchar(15) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `create` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='安卓被叫短信状态表';

-- --------------------------------------------------------

--
-- Table structure for table `tb1_channel_list`
--

CREATE TABLE IF NOT EXISTS `tb1_channel_list` (
`id` int(15) NOT NULL,
  `channelname` varchar(12) NOT NULL COMMENT '通道名称',
  `status` int(15) NOT NULL COMMENT '状态：1为首选，2为备用，0为禁用',
  `type` varchar(15) NOT NULL COMMENT '移动运营商'
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_device_info`
--

CREATE TABLE IF NOT EXISTS `tbl_device_info` (
`id` int(11) NOT NULL,
  `userid` bigint(14) unsigned NOT NULL,
  `platform` varchar(32) NOT NULL,
  `version` varchar(32) NOT NULL,
  `udid` varchar(64) NOT NULL,
  `imei` varchar(32) NOT NULL,
  `mac` varchar(32) NOT NULL,
  `imsi` varchar(32) NOT NULL,
  `token` varchar(64) NOT NULL,
  `ispb` int(1) NOT NULL,
  `ca` varchar(16) NOT NULL DEFAULT '',
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_ip` varchar(15) NOT NULL,
  `login_time` datetime NOT NULL,
  `last_ip` varchar(15) NOT NULL,
  `last_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE IF NOT EXISTS `tbl_feedback` (
`id` int(11) NOT NULL,
  `udid` int(11) NOT NULL,
  `userid` bigint(14) unsigned NOT NULL,
  `type` varchar(32) NOT NULL,
  `branchs` varchar(128) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL,
  `version` varchar(32) NOT NULL,
  `contact` varchar(64) NOT NULL,
  `content` text NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT '0' COMMENT '状态0未回复1已回复2已解决',
  `reward` varchar(32) NOT NULL,
  `customer` varchar(32) NOT NULL,
  `minisec` int(4) NOT NULL COMMENT '小秘书id',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `create_time` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login_code`
--

CREATE TABLE IF NOT EXISTS `tbl_login_code` (
`id` int(11) NOT NULL,
  `userid` bigint(14) unsigned NOT NULL,
  `country` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `code` varchar(16) NOT NULL,
  `type` varchar(10) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0',
  `step` smallint(1) DEFAULT '1',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lottery_rules`
--

CREATE TABLE IF NOT EXISTS `tbl_lottery_rules` (
`id` int(11) unsigned NOT NULL,
  `red_id` varchar(280) NOT NULL DEFAULT '' COMMENT '红包id',
  `start_num` int(5) NOT NULL DEFAULT '0' COMMENT '开始v币数量',
  `end_num` int(5) NOT NULL DEFAULT '0' COMMENT '结束v币数量'
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='抽奖规则表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_message_log`
--

CREATE TABLE IF NOT EXISTS `tbl_message_log` (
`id` bigint(20) NOT NULL COMMENT '消息ID主键',
  `fromid` varchar(80) DEFAULT NULL COMMENT '发送者用户ID号',
  `toid` varchar(80) DEFAULT NULL COMMENT '接收者用户ID号',
  `msgtype` varchar(20) DEFAULT NULL COMMENT '消息类型',
  `msgcontent` text COMMENT '消息内容',
  `callid` varchar(40) DEFAULT NULL COMMENT '消息ID',
  `domain` varchar(25) DEFAULT NULL COMMENT '存消息opensips的IP',
  `time` varchar(20) DEFAULT NULL COMMENT '发送时间',
  `gid` bigint(20) DEFAULT NULL COMMENT '??????',
  `response` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否收到回复0否1是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息日志表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mobile_local`
--

CREATE TABLE IF NOT EXISTS `tbl_mobile_local` (
`ID` int(11) NOT NULL,
  `MobileNumber` varchar(20) DEFAULT NULL,
  `MobileArea` varchar(50) DEFAULT NULL,
  `MobileType` varchar(50) DEFAULT NULL,
  `AreaCode` varchar(10) DEFAULT NULL,
  `PostCode` varchar(50) DEFAULT NULL,
  `UserCode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_red_award`
--

CREATE TABLE IF NOT EXISTS `tbl_red_award` (
`id` int(11) unsigned NOT NULL,
  `award_name` varchar(255) NOT NULL DEFAULT '' COMMENT '奖品名称',
  `award_data` varchar(255) NOT NULL DEFAULT '' COMMENT '奖品数据',
  `userid` varchar(14) NOT NULL DEFAULT '' COMMENT '中奖人id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `win_time` datetime NOT NULL COMMENT '中奖时间'
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='V币奖品';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_red_envelope`
--

CREATE TABLE IF NOT EXISTS `tbl_red_envelope` (
`id` int(11) unsigned NOT NULL,
  `type` varchar(15) NOT NULL DEFAULT '' COMMENT '类型',
  `face_value` int(11) NOT NULL DEFAULT '0' COMMENT '面值'
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='红包表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_red_envelope_config`
--

CREATE TABLE IF NOT EXISTS `tbl_red_envelope_config` (
`id` int(11) unsigned NOT NULL,
  `userid` bigint(14) unsigned NOT NULL COMMENT '用户id',
  `is_receive` int(1) NOT NULL DEFAULT '0' COMMENT '是否接收红包1停收0接收',
  `new_red_num` int(6) NOT NULL DEFAULT '0' COMMENT '未打开的红包数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='红包配置表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_red_envelope_list`
--

CREATE TABLE IF NOT EXISTS `tbl_red_envelope_list` (
`id` int(11) unsigned NOT NULL,
  `userid` bigint(14) unsigned NOT NULL COMMENT '用户id',
  `red_id` int(11) NOT NULL COMMENT '红包id',
  `face_value` int(11) NOT NULL DEFAULT '0' COMMENT '面值',
  `is_open` int(1) NOT NULL DEFAULT '0' COMMENT '是否打开红包0未打开1打开',
  `from_userid` bigint(14) unsigned NOT NULL COMMENT '主叫用户id',
  `call_uuid` varchar(64) NOT NULL DEFAULT '' COMMENT '话单唯一id',
  `open_time` datetime NOT NULL COMMENT '红包打开时间',
  `created_time` datetime NOT NULL COMMENT '红包创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='红包明细表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_register_code`
--

CREATE TABLE IF NOT EXISTS `tbl_register_code` (
`id` int(11) NOT NULL,
  `device_id` bigint(14) unsigned DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `udid` varchar(64) NOT NULL,
  `type` varchar(10) NOT NULL,
  `code` varchar(56) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0',
  `step` smallint(1) NOT NULL DEFAULT '1',
  `datetime` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_register_code_bak`
--

CREATE TABLE IF NOT EXISTS `tbl_register_code_bak` (
`id` int(11) NOT NULL,
  `device_id` bigint(14) unsigned DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `udid` varchar(64) NOT NULL,
  `type` varchar(10) NOT NULL,
  `code` varchar(56) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0',
  `step` smallint(1) NOT NULL DEFAULT '1',
  `datetime` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_resource_category`
--

CREATE TABLE IF NOT EXISTS `tbl_resource_category` (
`category_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `category_type` varchar(32) NOT NULL,
  `category_name` varchar(32) NOT NULL,
  `category_description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_resource_category`
--

INSERT INTO `tbl_resource_category` (`category_id`, `parent_id`, `category_type`, `category_name`, `category_description`, `status`) VALUES
(1, 0, '', '主题', '主题包', 1),
(2, 0, '', '键盘背景', '键盘背景图', 1),
(3, 0, '', '按键音总类', '', 1),
(4, 3, '', '按键音', '按键音ZIP包', 1),
(5, 3, '', '按键乐谱', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_resource_list`
--

CREATE TABLE IF NOT EXISTS `tbl_resource_list` (
`id` int(11) NOT NULL,
  `platform` varchar(16) NOT NULL,
  `version_min` varchar(32) NOT NULL DEFAULT '000.000.000',
  `version_max` varchar(32) NOT NULL DEFAULT '999.999.999',
  `mapping` varchar(16) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `discription` text NOT NULL,
  `author` varchar(32) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `preview` varchar(255) NOT NULL,
  `download_url` varchar(255) NOT NULL,
  `filesize` int(11) NOT NULL,
  `file_md5` char(32) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `is_new` int(1) NOT NULL DEFAULT '0',
  `is_check` int(11) NOT NULL DEFAULT '0' COMMENT '审核时是否屏蔽',
  `status` int(1) NOT NULL,
  `weight` int(11) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modified_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=755 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_resource_list`
--

INSERT INTO `tbl_resource_list` (`id`, `platform`, `version_min`, `version_max`, `mapping`, `category_id`, `name`, `discription`, `author`, `thumb`, `preview`, `download_url`, `filesize`, `file_md5`, `price`, `hits`, `is_new`, `is_check`, `status`, `weight`, `create_datetime`, `modified_datetime`) VALUES
(2, 'ios', '000.000.000', '003.006.099', 'small', 2, '260-粉色杯子', '', '爱聊', 'weicall/thumbnails/44c4746ab0c8e703b1e47e259e5743b8.jpg', '', 'weicall/keybg/bg_ios_01.jpg', 13742, 'dd7f9104ec2028098f53efcc3191811f', 0, 0, 0, 0, 1, 1271, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(3, 'ios', '000.000.000', '099.099.099', '', 3, '古琴', '', '爱聊', '', '', 'weicall/archive/iso_key_gq.zip', 141480, 'c174716e9b4529098fff1f99c7ea1f11', 0, 0, 0, 0, 1, 971, '2013-05-22 05:12:12', '2014-11-03 04:16:02'),
(4, 'android', '000.000.000', '003.002.099', 'small', 1, '自然原木', '', '爱聊', 'weicall/thumbnails/muwen-android.jpg', '', 'weicall/archive/muwen_320.zip', 214995, '9f1d8a9c01d5e9d630f116164bc8162f', 0, 0, 0, 0, 1, 1061, '2013-05-22 05:12:12', '2014-11-03 04:02:42'),
(5, 'android', '000.000.000', '003.006.099', 'small', 2, '260-粉色杯子-S', '', '爱聊', 'weicall/thumbnails/8ac6e745bb7e29ff0e30a6bb87a63e97.jpg', '', 'weicall/keybg/bg_android_320_01.jpg', 7884, '90eda127e555408230efc23dcbfba5c9', 0, 0, 0, 0, 1, 1271, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(6, 'android', '000.000.000', '099.099.099', '', 3, '古琴', '', '爱聊', '', '', 'weicall/archive/android_key_gq.zip', 68432, '', 0, 0, 0, 0, 1, 971, '2013-05-22 05:12:12', '2014-11-03 04:16:06'),
(7, 'android', '000.000.000', '003.002.099', 'middle', 1, '自然原木', '', '爱聊', 'weicall/thumbnails/muwen-android.jpg', '', 'weicall/archive/muwen_480.zip', 366701, 'd39f4a98f87ef6d38482f2c1c2b4747f', 0, 0, 0, 0, 1, 1061, '2013-05-22 05:12:12', '2014-11-03 04:02:51'),
(9, 'android', '000.000.000', '099.099.099', '', 3, '古筝', '', '爱聊', '', '', 'weicall/archive/android_key_gz.zip', 71740, '', 0, 0, 0, 0, 1, 981, '2013-05-22 05:12:12', '2014-11-03 04:16:09'),
(10, 'android', '000.000.000', '003.002.099', 'large', 1, '自然原木', '', '爱聊', 'weicall/thumbnails/muwen-android.jpg', '', 'weicall/archive/c75164cbff9d41d2edf7966746c33f83.zip', 542788, '1fa9cccfb1323944049b9441460495b7', 0, 0, 0, 0, 1, 1061, '2013-05-22 05:12:12', '2014-11-03 03:47:34'),
(11, 'android', '000.000.000', '003.006.099', 'large', 2, '260-粉色杯子-L', '', '爱聊', 'weicall/thumbnails/fa2aaa6d95fd0fe24e5b0b0d5c358c32.jpg', '', 'weicall/keybg/bg_android_640_01.jpg', 27490, '39d00aeeadf2d4bc52a38176e8ff1408', 0, 0, 0, 0, 1, 1271, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(12, 'android', '000.000.000', '099.099.099', '', 3, '粤语女声', '', '爱聊', '', '', 'weicall/archive/android_key_rs.zip', 43995, '', 0, 0, 0, 0, 1, 1001, '2013-05-22 05:12:12', '2014-11-03 04:16:12'),
(13, 'android', '000.000.000', '099.099.099', '', 3, '水滴', '', '爱聊', '', '', 'weicall/archive/android_key_sd.zip', 40103, '', 0, 0, 0, 0, 1, 961, '2013-05-22 05:12:12', '2014-11-03 04:16:14'),
(14, 'ios', '000.000.000', '099.099.099', '', 3, '古筝', '', '爱聊', '', '', 'weicall/archive/iso_key_qz.zip', 122410, 'b1c5c342fad6b0e998b734b7e8654329', 0, 0, 0, 0, 1, 981, '2013-05-22 05:12:12', '2014-11-03 04:16:17'),
(15, 'ios', '000.000.000', '099.099.099', '', 3, '水滴', '', '爱聊', '', '', 'weicall/archive/iso_key_sd.zip', 88270, '28d3a1e1180543d006a80dccb7cd4a4e', 0, 0, 0, 0, 1, 961, '2013-05-22 05:12:12', '2014-11-03 04:16:19'),
(16, 'ios', '000.000.000', '099.099.099', '', 3, '中文女声', '', '爱聊', '', '', 'weicall/archive/iso_key_wlrs.zip', 51275, '7d1e31d12da3fd60598e04683d2e5e87', 0, 0, 0, 0, 1, 991, '2013-05-22 05:12:12', '2014-11-03 04:16:22'),
(17, 'ios', '000.000.000', '099.099.099', '', 3, '粤语女声', '', '爱聊', '', '', 'weicall/archive/iso_key_yyrs.zip', 80837, 'c3155035930f00014dfebfb5c67fb703', 0, 0, 0, 0, 1, 1001, '2013-05-22 05:12:12', '2014-11-03 04:16:25'),
(18, 'ios', '000.000.000', '003.002.099', 'small', 1, '绿意盎然', '', '爱聊', 'weicall/thumbnails/green-ios.jpg', '', 'weicall/archive/0f12bcac588d3da892b288f185d34bcc.zip', 397031, '5eeda6b6841303534dec242a5612616d', 0, 0, 0, 0, 1, 1081, '2013-05-22 05:12:12', '2014-11-03 03:47:39'),
(24, 'ios', '000.000.000', '003.006.099', 'small', 2, '028-一朵小菊花', '', '爱聊', 'weicall/thumbnails/a31f7cb6de004544e0df1ddeac9e331b.jpg', '', 'weicall/keybg/bg_ios_02.jpg', 24324, 'f9bcc717af3c3f28ce8073489fcba176', 0, 0, 0, 0, 1, 1341, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(25, 'ios', '000.000.000', '003.006.099', 'small', 2, '033-紫蝴蝶', '', '爱聊', 'weicall/thumbnails/8fe51cf2515394efc7bb614eebcf370f.jpg', '', 'weicall/keybg/bg_ios_03.jpg', 66784, '93cc068e2ec282fe670ddf80bd0d9537', 0, 0, 0, 0, 1, 1391, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(26, 'ios', '000.000.000', '003.006.099', 'small', 2, '031-小燕子', '', '爱聊', 'weicall/thumbnails/f5fcfb0993dcf016fa2ff29c581162fd.jpg', '', 'weicall/keybg/bg_ios_04.jpg', 45779, 'dd60e84dd0527bca10377a9e8ece9255', 0, 0, 0, 0, 1, 1371, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(27, 'ios', '000.000.000', '003.006.099', 'small', 2, '034-雪地情侣画', '', '爱聊', 'weicall/thumbnails/ad6bd7c61ad2ca3f83bc49c4fb03eb12.jpg', '', 'weicall/keybg/bg_ios_05.jpg', 37229, '91a375774d92b2c08d030d34a3ba9bc8', 0, 0, 0, 0, 1, 1401, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(31, 'android', '000.000.000', '003.002.099', 'large', 1, '绿意盎然', '', '爱聊', 'weicall/thumbnails/green-android.jpg', '', 'weicall/archive/lvse_640.zip', 290160, '94c9047827d24e6da2123210acb72277', 0, 0, 0, 0, 1, 1081, '2013-05-22 05:12:12', '2014-11-03 04:02:55'),
(32, 'android', '000.000.000', '003.002.099', 'middle', 1, '绿意盎然', '', '爱聊', 'weicall/thumbnails/green-android.jpg', '', 'weicall/archive/lvse_480.zip', 194902, 'ac393ebfb9a9a563e1b36f819dbd0759', 0, 0, 0, 0, 1, 1081, '2013-05-22 05:12:12', '2014-11-03 04:02:58'),
(33, 'android', '000.000.000', '003.002.099', 'small', 1, '绿意盎然', '', '爱聊', 'weicall/thumbnails/green-android.jpg', '', 'weicall/archive/lvse_320.zip', 142945, '93af70e0412e5528635d057faf27d464', 0, 0, 0, 0, 1, 1081, '2013-05-22 05:12:12', '2014-11-03 04:03:01'),
(34, 'android', '000.000.000', '003.002.099', 'small', 1, '粉红回忆', '', '爱聊', 'weicall/thumbnails/fense-android.jpg', '', 'weicall/archive/fense_320.zip', 177061, '595685b0e0a4fa15ed81ba8079db9b84', 0, 0, 0, 0, 1, 1071, '2013-05-22 05:12:12', '2014-11-03 04:03:04'),
(35, 'android', '000.000.000', '003.002.099', 'middle', 1, '粉红回忆', '', '爱聊', 'weicall/thumbnails/fense-android.jpg', '', 'weicall/archive/fense_480.zip', 264391, 'e64c8653c0058cda3367d6cb14c67219', 0, 0, 0, 0, 1, 1071, '2013-05-22 05:12:12', '2014-11-03 04:03:07'),
(36, 'android', '000.000.000', '003.002.099', 'large', 1, '粉红回忆', '', '爱聊', 'weicall/thumbnails/fense-android.jpg', '', 'weicall/archive/fense_640.zip', 371638, 'ee98d0810bb4713c53ecf5ae701379cb', 0, 0, 0, 0, 1, 1071, '2013-05-22 05:12:12', '2014-11-03 04:03:11'),
(38, 'ios', '000.000.000', '003.006.099', 'small', 2, '035-橘红花朵', '', '爱聊', 'weicall/thumbnails/c91330df08b48bbefc3c7db3f0e856a2.jpg', '', 'weicall/keybg/bg_ios_07.jpg', 24637, 'de73aa237d91c6c6aa56028e74bccb71', 0, 0, 0, 0, 1, 1411, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(39, 'ios', '000.000.000', '003.006.099', 'small', 2, '420-水彩菊花图', '', '爱聊', 'weicall/thumbnails/fb186cd20cb97dcff64ca5cc226efaa8.jpg', '', 'weicall/keybg/bg_ios_08.jpg', 47347, '874ddf3c3dec5dee7f33f6f0ef64774c', 0, 0, 0, 0, 1, 1431, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(41, 'ios', '000.000.000', '003.006.099', 'small', 2, '440-高原雪地', '', '爱聊', 'weicall/thumbnails/d789593fbe32dc1cd23b618d702a745f.jpg', '', 'weicall/keybg/bg_ios_10.jpg', 23387, 'e12004d1d5a40fe894d740b9e7625009', 0, 0, 0, 0, 1, 1451, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(42, 'ios', '000.000.000', '003.006.099', 'small', 2, '030-咖啡幻想', '', '爱聊', 'weicall/thumbnails/5cddd2aa80054976dd2d54141f10e702.jpg', '', 'weicall/keybg/bg_ios_11.jpg', 29418, 'b64fbf34972f784bb7670ced053c5d9c', 0, 0, 0, 0, 1, 1361, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(43, 'ios', '000.000.000', '003.006.099', 'small', 2, '430-蓝天心型光影', '', '爱聊', 'weicall/thumbnails/17d86a8ecfe6d2a0be021a7c2e04c26a.jpg', '', 'weicall/keybg/bg_ios_12.jpg', 9249, '13b06b71e0fbad8965ce206f0c1a585e', 0, 0, 0, 0, 1, 1441, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(45, 'ios', '000.000.000', '003.006.099', 'small', 2, '005-两只小熊', '', '爱聊', 'weicall/thumbnails/5512d839dea72bc6d8ff4f60a0dae3d8.jpg', '', 'weicall/keybg/bg_ios_14.jpg', 32980, '040561fede4caf00b234c4334edd0e54', 0, 0, 1, 0, 1, 41, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(51, 'ios', '000.000.000', '003.006.099', 'small', 2, '036-花丛蓝天', '', '爱聊', 'weicall/thumbnails/b5ff2b3e34023b9b30fdc2679220ce34.jpg', '', 'weicall/keybg/bg_ios_20.jpg', 19592, '9b0bc6ff5e3cb077091c258af25fbcfb', 0, 0, 0, 0, 1, 1421, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(53, 'ios', '000.000.000', '003.006.099', 'small', 2, '027-白色小T恤', '', '爱聊', 'weicall/thumbnails/03ebebb14fb0b42ae3f075db9ac94392.jpg', '', 'weicall/keybg/bg_ios_22.jpg', 34150, '5f6dc9a5797fc9cdab9c1004384d83a3', 0, 0, 0, 0, 1, 1331, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(54, 'android', '000.000.000', '003.006.099', 'small', 2, '028一朵小菊花-S', '', '爱聊', 'weicall/thumbnails/53e0aa31eac87dde53c645c9d104d49f.jpg', '', 'weicall/keybg/bg_android_320_02.jpg', 13138, '3818b84f29d62fa7423b55b9bf32f31b', 0, 0, 0, 0, 1, 1341, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(55, 'android', '000.000.000', '003.006.099', 'small', 2, '033-紫蝴蝶-S', '', '爱聊', 'weicall/thumbnails/28503d06d97be1ccfaab62302e6a7181.jpg', '', 'weicall/keybg/bg_android_320_03.jpg', 21365, 'ec0e74b9791daeebd74668d45063fbb7', 0, 0, 0, 0, 1, 1391, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(56, 'android', '000.000.000', '003.006.099', 'small', 2, '031-小燕子-S', '', '爱聊', 'weicall/thumbnails/fbda7049c208e920c9d0cb9c092df677.jpg', '', 'weicall/keybg/bg_android_320_04.jpg', 17977, 'b1a2abf04dd3ca8b388e3a94dd9b21a5', 0, 0, 0, 0, 1, 1371, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(57, 'android', '000.000.000', '003.006.099', 'small', 2, '034-雪地情侣画-S', '', '爱聊', 'weicall/thumbnails/4d077ec6d92926b76cd2b8ab9b70c414.jpg', '', 'weicall/keybg/bg_android_320_05.jpg', 16589, '1b4cc558915aa7e045eaa40a430a122e', 0, 0, 0, 0, 1, 1401, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(59, 'android', '000.000.000', '003.006.099', 'small', 2, '035-橘红花朵-S', '', '爱聊', 'weicall/thumbnails/35b757d5864c0a43a372bd4861f6014b.jpg', '', 'weicall/keybg/bg_android_320_07.jpg', 14187, '80ab9bcea1cdff95bd29631f6650f24b', 0, 0, 0, 0, 1, 1411, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(60, 'android', '000.000.000', '003.006.099', 'small', 2, '420-水彩菊花图-S', '', '爱聊', 'weicall/thumbnails/ab03d96df532cfe55ca80d88268aa83a.jpg', '', 'weicall/keybg/bg_android_320_08.jpg', 22865, '0d02f5847a8e9a7be0ce5e23cc8e31be', 0, 0, 0, 0, 1, 1431, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(62, 'android', '000.000.000', '003.006.099', 'small', 2, '440-高原雪地-S', '', '爱聊', 'weicall/thumbnails/53610a7726bb8d9853c2cc9505f39126.jpg', '', 'weicall/keybg/bg_android_320_10.jpg', 11471, 'a55837cea434013f464612f88ec3e4c9', 0, 0, 0, 0, 1, 1451, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(63, 'android', '000.000.000', '003.006.099', 'small', 2, '030-咖啡幻想-S', '', '爱聊', 'weicall/thumbnails/8ee3955da071ed72e8fe743ee4cf2bbe.jpg', '', 'weicall/keybg/bg_android_320_11.jpg', 14696, '89bee7033573ab4cf9f883d0eedb9486', 0, 0, 0, 0, 1, 1361, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(64, 'android', '000.000.000', '003.006.099', 'small', 2, '430-蓝天心型光影-S', '', '爱聊', 'weicall/thumbnails/885a782d5da2c2407fe916c5eb448cfa.jpg', '', 'weicall/keybg/bg_android_320_12.jpg', 4761, 'fddfd43096374f90fdc8a1949bdc6940', 0, 0, 0, 0, 1, 1441, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(66, 'android', '000.000.000', '003.006.099', 'small', 2, '005-两只小熊-S', '', '爱聊', 'weicall/thumbnails/121dcd99431dada0695c2b8de81165a7.jpg', '', 'weicall/keybg/bg_android_320_14.jpg', 12747, '8425c67034a2a28f4fa3d67d02895755', 0, 0, 1, 0, 1, 41, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(72, 'android', '000.000.000', '003.006.099', 'small', 2, '036-花丛蓝天-S', '', '爱聊', 'weicall/thumbnails/60d6c6d46b6db582076cb7845005d8c2.jpg', '', 'weicall/keybg/bg_android_320_20.jpg', 12557, 'eac4e32dce8969b55387b12509ed18c5', 0, 0, 0, 0, 1, 1421, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(74, 'android', '000.000.000', '003.006.099', 'small', 2, '027-白色小T恤-S', '', '爱聊', 'weicall/thumbnails/746fb1b20edbb0a37363ea480d1c9814.jpg', '', 'weicall/keybg/bg_android_320_22.jpg', 11391, '23e91017ffa40c7081de2125f9879ad0', 0, 0, 0, 0, 1, 1331, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(75, 'android', '000.000.000', '003.006.099', 'middle', 2, '028一朵小菊花-M', '', '爱聊', 'weicall/thumbnails/bea074020d017aefc6c4c529dd6da6a9.jpg', '', 'weicall/keybg/bg_android_480_02.jpg', 24545, '91d880d6702920b2f7b4ddb47caec66f', 0, 0, 0, 0, 1, 1341, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(76, 'android', '000.000.000', '003.006.099', 'middle', 2, '033-紫蝴蝶-M', '', '爱聊', 'weicall/thumbnails/d7f7fc10ffabaae8a5c4f8d2e672828a.jpg', '', 'weicall/keybg/bg_android_480_03.jpg', 41821, 'adf5acaaeb6bc737a0d59cb4a49a1b52', 0, 0, 0, 0, 1, 1391, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(77, 'android', '000.000.000', '003.006.099', 'middle', 2, '031-小燕子-M', '', '爱聊', 'weicall/thumbnails/41886f3e0a792857922a76e378880b76.jpg', '', 'weicall/keybg/bg_android_480_04.jpg', 38789, 'bf84dac933fc09f6af99b738a34c3464', 0, 0, 0, 0, 1, 1371, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(78, 'android', '000.000.000', '003.006.099', 'middle', 2, '034-雪地情侣画-M', '', '爱聊', 'weicall/thumbnails/723535eb3fd3153915b9036901734b97.jpg', '', 'weicall/keybg/bg_android_480_05.jpg', 32213, '9477105bf40610a4ff052c06ea08a3e7', 0, 0, 0, 0, 1, 1401, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(80, 'android', '000.000.000', '003.006.099', 'middle', 2, '035-橘红花朵-M', '', '爱聊', 'weicall/thumbnails/739248b4c9eef700b3590acc2dac5dbc.jpg', '', 'weicall/keybg/bg_android_480_07.jpg', 25546, '10547c30b1717c28d58bfac84446cb1b', 0, 0, 0, 0, 1, 1411, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(81, 'android', '000.000.000', '003.006.099', 'middle', 2, '420-水彩菊花图-M', '', '爱聊', 'weicall/thumbnails/d9437b75414f6b704d64af3aedea0dc7.jpg', '', 'weicall/keybg/bg_android_480_08.jpg', 43857, '5d1ffc035bf0a62686b1481f72b629d6', 0, 0, 0, 0, 1, 1431, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(83, 'android', '000.000.000', '003.006.099', 'middle', 2, '440-高原雪地-M', '', '爱聊', 'weicall/thumbnails/3673d83a71bd8448cda913b27a307296.jpg', '', 'weicall/keybg/bg_android_480_10.jpg', 21041, '0032c5f31110867319eadd31baa3abd1', 0, 0, 0, 0, 1, 1451, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(84, 'android', '000.000.000', '003.006.099', 'middle', 2, '030-咖啡幻想-M', '', '爱聊', 'weicall/thumbnails/0d4620f2d4531dd821a8d8489a21e4f6.jpg', '', 'weicall/keybg/bg_android_480_11.jpg', 27995, '49b424d2dedbb8989f5bf21d21808eca', 0, 0, 0, 0, 1, 1361, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(85, 'android', '000.000.000', '003.006.099', 'middle', 2, '430-蓝天心型光影-M', '', '爱聊', 'weicall/thumbnails/92328f79f057c9d67440a4af3edc9740.jpg', '', 'weicall/keybg/bg_android_480_12.jpg', 8512, '2626212d4c049393227c2d0357d7a522', 0, 0, 0, 0, 1, 1441, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(87, 'android', '000.000.000', '003.006.099', 'middle', 2, '005-两只小熊-M', '', '爱聊', 'weicall/thumbnails/f4eb18d7d477bb9a78eb90afb7e3af4c.jpg', '', 'weicall/keybg/bg_android_480_14.jpg', 23823, '40b2b3fe3caf9e82bf52daa8149ad5ff', 0, 0, 1, 0, 1, 41, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(93, 'android', '000.000.000', '003.006.099', 'middle', 2, '036-花丛蓝天-M', '', '爱聊', 'weicall/thumbnails/e495a2864a4af2d2260722f96ac6fc9e.jpg', '', 'weicall/keybg/bg_android_480_20.jpg', 20990, '6f702475cf86adff9b146bdf119b41dd', 0, 0, 0, 0, 1, 1421, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(95, 'android', '000.000.000', '003.006.099', 'middle', 2, '027-白色小T恤-M', '', '爱聊', 'weicall/thumbnails/58bb1ccab3eeac7e041e408d0b1a8893.jpg', '', 'weicall/keybg/bg_android_480_22.jpg', 21701, 'b5bd2345029833ecfe88328311894f65', 0, 0, 0, 0, 1, 1331, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(96, 'android', '000.000.000', '003.006.099', 'large', 2, '028一朵小菊花-L', '', '爱聊', 'weicall/thumbnails/a6d876bcb46711f763625f3033fc7a14.jpg', '', 'weicall/keybg/bg_android_640_02.jpg', 47690, '1bb6731ce5105df4ae1b589e3dde84ab', 0, 0, 0, 0, 1, 1341, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(97, 'android', '000.000.000', '003.006.099', 'large', 2, '033-紫蝴蝶-L', '', '爱聊', 'weicall/thumbnails/081dc6129492e212ad917f9da48a566d.jpg', '', 'weicall/keybg/bg_android_640_03.jpg', 79657, 'a880fb9374b29e713ddb897d5c824356', 0, 0, 0, 0, 1, 1391, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(98, 'android', '000.000.000', '003.006.099', 'large', 2, '031-小燕子-L', '', '爱聊', 'weicall/thumbnails/28a96f5f2c6bca2c8cd8e8daae506f83.jpg', '', 'weicall/keybg/bg_android_640_04.jpg', 69417, 'a61fe564b66d642aa00d885d440e9e52', 0, 0, 0, 0, 1, 1371, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(99, 'android', '000.000.000', '003.006.099', 'large', 2, '034-雪地情侣画-L', '', '爱聊', 'weicall/thumbnails/c5255c8ebf2312e114bf60b80e8658d9.jpg', '', 'weicall/keybg/bg_android_640_05.jpg', 71658, 'ef26f9834954a19f5d9f5e812d94d08d', 0, 0, 0, 0, 1, 1401, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(101, 'android', '000.000.000', '003.006.099', 'large', 2, '035-橘红花朵-L', '', '爱聊', 'weicall/thumbnails/0847123fd9272780d7755b2d114a755d.jpg', '', 'weicall/keybg/bg_android_640_07.jpg', 48008, 'e81916384667e868db7c66808492835b', 0, 0, 0, 0, 1, 1411, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(102, 'android', '000.000.000', '003.006.099', 'large', 2, '420-水彩菊花图-L', '', '爱聊', 'weicall/thumbnails/cae6a17e499e585d4f9088cbf4f5d6e6.jpg', '', 'weicall/keybg/bg_android_640_08.jpg', 84364, '3c9b84e7b0f9db376c2c81d01006e318', 0, 0, 0, 0, 1, 1431, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(104, 'android', '000.000.000', '003.006.099', 'large', 2, '440-高原雪地-L', '', '爱聊', 'weicall/thumbnails/feeb7f29babc691dcc4c0091e42ee110.jpg', '', 'weicall/keybg/bg_android_640_10.jpg', 40246, 'fe0fbcb7c257564976eca60a1e0563fc', 0, 0, 0, 0, 1, 1451, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(105, 'android', '000.000.000', '003.006.099', 'large', 2, '030-咖啡幻想-L', '', '爱聊', 'weicall/thumbnails/d768e5ff95ad41f1bda23c3f758d08b4.jpg', '', 'weicall/keybg/bg_android_640_11.jpg', 36310, '29b97cf79fcfe70f2ed30fbffc21534e', 0, 0, 0, 0, 1, 1361, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(106, 'android', '000.000.000', '003.006.099', 'large', 2, '430-蓝天心型光影-L', '', '爱聊', 'weicall/thumbnails/4443d918e63ee8d0f741f379c330eff6.jpg', '', 'weicall/keybg/bg_android_640_12.jpg', 15644, '74a313cbd93ac8506f1ae252af6a1db0', 0, 0, 0, 0, 1, 1441, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(108, 'android', '000.000.000', '003.006.099', 'large', 2, '005-两只小熊-L', '', '爱聊', 'weicall/thumbnails/f9f30dad2a871deba47e5fb960b9cb86.jpg', '', 'weicall/keybg/bg_android_640_14.jpg', 38267, '970a602b4944d11afe931c2e509b3925', 0, 0, 1, 0, 1, 41, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(114, 'android', '000.000.000', '003.006.099', 'large', 2, '036-花丛蓝天-L', '', '爱聊', 'weicall/thumbnails/e863d38efdbf2b897f90f6edd0230a30.jpg', '', 'weicall/keybg/bg_android_640_20.jpg', 37834, 'f1a9cb6eab3bd89faba477943a5087f2', 0, 0, 0, 0, 1, 1421, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(116, 'android', '000.000.000', '003.006.099', 'large', 2, '027-白色小T恤-L', '', '爱聊', 'weicall/thumbnails/3851dae8ac6c769d6c798fe552b61e57.jpg', '', 'weicall/keybg/bg_android_640_22.jpg', 45165, 'e02030e4e29dde1ddf965ead7b7a14bb', 0, 0, 0, 0, 1, 1331, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(117, 'ios', '000.000.000', '003.002.099', 'small', 1, '自然原木', '', '爱聊', 'weicall/thumbnails/muwen-android.jpg', '', 'weicall/archive/0bd662532c3534c60e673448de6e93db.zip', 1190634, '28cba892ff1c61aaf0aca94b3cab8bfd', 0, 0, 0, 0, 1, 1061, '2013-05-22 05:12:12', '2014-11-03 03:48:10'),
(119, 'android', '000.000.000', '003.002.099', 'small', 1, '蓝色经典', '', '爱聊', 'weicall/thumbnails/791ce6b39c19c857cb54bd0fb9d40aad.jpg', '', 'weicall/archive/lanse_320.zip', 157125, 'c81ce8102bb5606b5b13d7d49dfba02b', 0, 0, 0, 0, 1, 1091, '2013-05-22 05:12:12', '2014-11-03 04:03:15'),
(120, 'android', '000.000.000', '003.002.099', 'large', 1, '蓝色经典', '', '爱聊', 'weicall/thumbnails/5e8e60bc9114dca8988d3ec48cbd3ffd.jpg', '', 'weicall/archive/lanse_640.zip', 323272, '34fa0c321489dee8bd78bd8aa7ccc0d8', 0, 0, 0, 0, 1, 1091, '2013-05-22 05:12:12', '2014-11-03 04:03:18'),
(121, 'android', '000.000.000', '003.002.099', 'middle', 1, '蓝色经典', '', '爱聊', 'weicall/thumbnails/1d844b59e29aea8ede773790fd9b8ebc.jpg', '', 'weicall/archive/lanse_480.zip', 223059, '34f2d5ce1770770b2a1519bb69318161', 0, 0, 0, 0, 1, 1091, '2013-05-22 05:12:12', '2014-11-03 04:03:21'),
(122, 'ios', '000.000.000', '003.002.099', 'small', 1, '蓝色经典', '', '爱聊', 'weicall/thumbnails/46a15c7197738502bdbb3d8a4a05bc32.jpg', '', 'weicall/archive/ios_blue.zip', 657413, '10d0b2d358ca0cb8ac601511919b6708', 0, 0, 0, 0, 1, 1091, '2013-05-22 05:12:12', '2014-11-03 04:09:40'),
(123, 'android', '000.000.000', '099.099.099', '', 3, '中文女声', '', '爱聊', '', '', 'weicall/archive/android_key_wlrs.zip', 71581, '', 0, 0, 0, 0, 1, 991, '2013-05-22 05:12:12', '2014-11-03 04:16:27'),
(131, 'android', '000.000.000', '003.006.099', 'small', 2, '029-爱心小猫公仔-S', '', '爱聊', 'weicall/thumbnails/17fdc8612c1bcc613ae1472236f22208.jpg', '', 'weicall/keybg/bg_android_320_26.jpg', 13392, '247c7260762bd40f86cd1499f3dd7819', 0, 0, 0, 0, 1, 1351, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(132, 'android', '000.000.000', '003.006.099', 'small', 2, '270-夕阳情侣-S', '', '爱聊', 'weicall/thumbnails/0f1944c50cedf912b4b82c833accf3a4.jpg', '', 'weicall/keybg/bg_android_320_27.jpg', 17075, 'd7585e9c1159e056c2f2a058a9fa7696', 0, 0, 0, 0, 1, 1281, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(134, 'android', '000.000.000', '003.006.099', 'small', 2, '032-蒲公英-S', '', '爱聊', 'weicall/thumbnails/d2b316258eaac68e3d9bbb3bf6c3b112.jpg', '', 'weicall/keybg/bg_android_320_29.jpg', 17018, 'a7fd5a63e99757826ee4e5b08555d089', 0, 0, 0, 0, 1, 1381, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(139, 'android', '000.000.000', '003.006.099', 'middle', 2, '029-爱心小猫公仔-M', '', '爱聊', 'weicall/thumbnails/59ac1a05032c2c661c7572838b2ef6aa.jpg', '', 'weicall/keybg/bg_android_480_26.jpg', 23347, '16ecea59a9e069d9dd37ca198c1bfe20', 0, 0, 0, 0, 1, 1351, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(140, 'android', '000.000.000', '003.006.099', 'middle', 2, '270-夕阳情侣-M', '', '爱聊', 'weicall/thumbnails/ec818bf28aee2a3cfaaca4927d1c8135.jpg', '', 'weicall/keybg/bg_android_480_27.jpg', 26951, '2107a4290155cd7dcfca908e2e64cb8b', 0, 0, 0, 0, 1, 1281, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(142, 'android', '000.000.000', '003.006.099', 'middle', 2, '032-蒲公英-M', '', '爱聊', 'weicall/thumbnails/9acaa91062edebc3a48b39919bf14701.jpg', '', 'weicall/keybg/bg_android_480_29.jpg', 34668, '816a2c6ef9b4d00e98785c68bdba5287', 0, 0, 0, 0, 1, 1381, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(147, 'android', '000.000.000', '003.006.099', 'large', 2, '029-爱心小猫公仔-L', '', '爱聊', 'weicall/thumbnails/372d709788b0c9ad7761c367549a09b1.jpg', '', 'weicall/keybg/bg_android_640_26.jpg', 40564, '0d5e0b1b2a9d40a92f17c5042ac57f1c', 0, 0, 0, 0, 1, 1351, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(148, 'android', '000.000.000', '003.006.099', 'large', 2, '270-夕阳情侣-L', '', '爱聊', 'weicall/thumbnails/c5029317118d4e592cca8bf6aca1463f.jpg', '', 'weicall/keybg/bg_android_640_27.jpg', 55191, 'c427fa77363093601749af33634bdefe', 0, 0, 0, 0, 1, 1281, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(150, 'android', '000.000.000', '003.006.099', 'large', 2, '032-蒲公英-L', '', '爱聊', 'weicall/thumbnails/beccb9733ac97863925ee1204c264903.jpg', '', 'weicall/keybg/bg_android_640_29.jpg', 73845, '9707586fc42d2cea782ae4060fbc2c12', 0, 0, 0, 0, 1, 1381, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(155, 'ios', '000.000.000', '003.006.099', 'small', 2, '029-爱心小猫公仔', '', '爱聊', 'weicall/thumbnails/0f5d4dbd1834072de2664e848cf9110a.jpg', '', 'weicall/keybg/bg_ios_26.jpg', 23833, 'c697ea02c9a52c798c9fd6cde4d1a544', 0, 0, 0, 0, 1, 1351, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(156, 'ios', '000.000.000', '003.006.099', 'small', 2, '270-夕阳情侣', '', '爱聊', 'weicall/thumbnails/b05fb9f3cfc892fe62fedcbedd83d771.jpg', '', 'weicall/keybg/bg_ios_27.jpg', 27225, '355ef5dd6f96cc5f2eb13919785f15da', 0, 0, 0, 0, 1, 1281, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(158, 'ios', '000.000.000', '003.006.099', 'small', 2, '032-蒲公英', '', '爱聊', 'weicall/thumbnails/a4ebd4d42527212c5bfbb1c32a01189b.jpg', '', 'weicall/keybg/bg_ios_29.jpg', 39687, 'b8ab30944cd0bbd036a636a18cf5d694', 0, 0, 0, 0, 1, 1381, '2013-05-22 05:12:12', '2014-11-06 05:58:42'),
(161, 'android', '000.000.000', '003.002.099', 'small', 1, '愤怒小鸟', '', '爱聊', 'weicall/thumbnails/49f6188e6fa429afcfadc50aa30ae737.jpg', '', 'weicall/archive/fennuxiaoniao_320.zip', 188442, '4d4c4e8fa617e2c21a31016bda9dfa9e', 0, 0, 0, 0, 1, 1041, '2013-08-16 14:20:00', '2014-11-03 04:03:24'),
(162, 'android', '000.000.000', '003.002.099', 'large', 1, '愤怒小鸟', '', '爱聊', 'weicall/thumbnails/5a88a35c4fd6f3090035e796021c33e6.jpg', '', 'weicall/archive/fennuxiaoniao_640.zip', 334468, '7b1718d8b5504671b50fb24810d7850d', 0, 0, 0, 0, 1, 1041, '2013-08-16 14:20:00', '2014-11-03 04:03:27'),
(163, 'android', '000.000.000', '003.002.099', 'middle', 1, '哆啦a梦', '', '爱聊', 'weicall/thumbnails/a4bb579cc3627b538968757156e655ad.jpg', '', 'weicall/archive/doraemon_480.zip', 227213, 'd048ad391a2779bc0d9bcb21cd2dee25', 0, 0, 0, 0, 1, 1021, '2013-08-16 14:20:00', '2014-11-03 04:03:30'),
(164, 'android', '000.000.000', '003.002.099', 'small', 1, '哆啦a梦', '', '爱聊', 'weicall/thumbnails/42e2dac29e74b6bbf010f0048fed5def.jpg', '', 'weicall/archive/doraemon_320.zip', 160209, '5d9eace953ab1c814c358051a2fa1914', 0, 0, 0, 0, 1, 1021, '2013-08-16 14:20:00', '2014-11-03 04:03:39'),
(189, 'android', '000.000.000', '003.002.099', 'middle', 1, '愤怒小鸟', '', '爱聊', 'weicall/thumbnails/37c3087a594c01e232477cad1c0f850a.jpg', '', 'weicall/archive/df85af97a34fa19a2bd88d96e6449844.zip', 279545, '1aca324b8934c31e9f09e54276e6190f', 0, 0, 0, 0, 1, 1041, '2014-03-21 11:22:56', '2014-08-05 07:30:08'),
(190, 'ios', '000.000.000', '099.099.099', 'small', 4, '钢琴', '普通钢琴按键音', '', '', '', 'weicall/archive/key_ios_gq.zip', 80850, '91aaf855aec73632a30fdf220c961bdf', 0, 0, 0, 0, 1, 1012, '2013-10-12 15:01:52', '2014-11-03 04:16:38'),
(191, 'android', '000.000.000', '099.099.099', 'small', 4, '钢琴', '', '', '', '', 'weicall/archive/key_android_gq.zip', 54709, '6d10912b04f17d2133ac811fa1d412b3', 0, 0, 0, 0, 1, 951, '2013-10-12 15:00:14', '2014-11-03 04:16:41'),
(212, 'all', '000.000.000', '099.099.099', '', 5, '欢乐颂', '', '', '', '', 'weicall/archive/e0178790d62f6bc16fc7200db3040bd9.zip', 166, '9776ecf6f7ae08b5d55d95def1750c10', 0, 0, 0, 0, 1, 1012, '2014-04-09 15:30:55', '2014-08-05 07:30:08'),
(214, 'all', '000.000.000', '099.099.099', '', 5, '秋日私语', '', '', '', '', 'weicall/archive/4103c1471932c9fb09961108941ea368.zip', 592, '5e71068bba5e05a051df67c2065b70cf', 0, 0, 0, 1, 1, 1014, '2014-04-14 14:37:56', '2014-08-05 07:30:08'),
(215, 'all', '000.000.000', '099.099.099', '', 5, '千千阙歌', '', '', '', '', 'weicall/archive/70186aade3687899f35f3d16d68031b4.zip', 283, '', 0, 0, 0, 1, 1, 1021, '2014-04-09 16:02:55', '2014-08-05 07:30:08'),
(216, 'all', '000.000.000', '099.099.099', '', 5, '童年', '', '', '', '', 'weicall/archive/8e9449334d83be1f13d5e64e784bff5b.zip', 235, '', 0, 0, 0, 1, 1, 1026, '2014-04-09 16:02:55', '2014-08-05 07:30:08'),
(217, 'all', '000.000.000', '099.099.099', '', 5, '大海', '', '', '', '', 'weicall/archive/473873ee12b5f7bf60e70b11f4875872.zip', 254, '', 0, 0, 0, 1, 1, 1029, '2014-04-09 16:02:55', '2014-08-05 07:30:08'),
(219, 'all', '000.000.000', '099.099.099', '', 5, '同桌的你', '', '', '', '', 'weicall/archive/b3ec7a860d895c9a6cf601b7edd02a3f.zip', 245, '', 0, 0, 0, 1, 1, 1038, '2014-04-09 16:02:55', '2014-08-05 07:30:08'),
(220, 'all', '000.000.000', '099.099.099', '', 5, '我只在乎你', '', '', '', '', 'weicall/archive/1aa7d90f88eed5cdd685cc555aba3b20.zip', 256, '', 0, 0, 0, 1, 1, 1041, '2014-04-09 16:02:55', '2014-08-05 07:30:08'),
(221, 'all', '000.000.000', '099.099.099', '', 5, '一千个伤心的理由', '', '', '', '', 'weicall/archive/6266c646cfa5cf3440f9c239d7df7cb0.zip', 252, '', 0, 0, 0, 1, 1, 1046, '2014-04-09 16:02:55', '2014-08-05 07:30:08'),
(223, 'all', '000.000.000', '099.099.099', '', 5, '青花瓷', '', '', '', '', 'weicall/archive/f1c85431ec3352360eb046d9441f589f.zip', 359, 'c1fff5a4c61c0f2e6af917370d9e3112', 0, 0, 0, 1, 0, 1061, '2014-04-14 14:26:05', '2014-08-05 07:30:08'),
(224, 'all', '000.000.000', '099.099.099', '', 5, '因为爱情', '', '', '', '', 'weicall/archive/3731cffce03e8bcdd63916436530e217.zip', 246, '', 0, 0, 0, 1, 1, 1066, '2014-04-09 16:02:55', '2014-08-05 07:30:08'),
(225, 'all', '000.000.000', '099.099.099', '', 5, '红豆', '', '', '', '', 'weicall/archive/ce920c5800459684c0a7000bac4b2c12.zip', 251, '', 0, 0, 0, 1, 1, 1071, '2014-04-09 16:02:55', '2014-08-05 07:30:08'),
(228, 'all', '000.000.000', '099.099.099', '', 5, '那些年', '', '', '', '', 'weicall/archive/94515e35117a9be51113efcb0c8c89b7.zip', 308, 'eafc2dbd11166ec89775cb904ac38453', 0, 0, 0, 1, 0, 1086, '2014-04-14 14:25:52', '2014-08-05 07:30:08'),
(229, 'all', '000.000.000', '099.099.099', '', 5, '两只老虎', '', '', '', '', 'weicall/archive/9d4faeadf67d8a907ada8d29cf62a947.zip', 209, 'dd9a3242aee75880425013ed08f7cf92', 0, 0, 0, 1, 1, 1091, '2014-04-09 16:02:55', '2014-08-05 07:30:08'),
(230, 'all', '000.000.000', '099.099.099', '', 5, '虫儿飞', '', '', '', '', 'weicall/archive/e00cd0a5ae1049cabe6354811be9fdb5.zip', 177, 'edf2e64308f05f2a73ce7d27f442e8d8', 0, 0, 0, 1, 0, 1101, '2014-04-14 14:26:32', '2014-08-05 07:30:08'),
(231, 'all', '000.000.000', '099.099.099', '', 5, '生日快乐', '', '', '', '', 'weicall/archive/3054c5b761862c3eeeb88e1e56005927.zip', 192, '', 0, 0, 0, 1, 1, 1106, '2014-04-09 16:02:55', '2014-08-05 07:30:08'),
(233, 'all', '000.000.000', '099.099.099', '', 5, '海阔天空', '', '', '', '', 'weicall/archive/0d81f70977409372d04eab6581595779.zip', 256, '', 0, 0, 0, 1, 1, 1056, '2014-04-09 16:02:55', '2014-08-05 07:30:08'),
(239, 'all', '000.000.000', '099.099.099', '', 5, '冰雨', '', '', '', '', 'weicall/archive/c30dadcc981eed67de12f35822f98cdc.zip', 278, '', 0, 0, 0, 1, 1, 1051, '2014-04-09 16:02:55', '2014-08-05 07:30:08'),
(240, 'all', '000.000.000', '099.099.099', '', 5, '月亮代表我的心', '', '', '', '', 'weicall/archive/4733feb945e7f06be8d5a9483e6790a7.zip', 193, '', 0, 0, 0, 1, 1, 1031, '2014-04-09 16:02:55', '2014-08-05 07:30:08'),
(248, 'android', '000.000.000', '003.002.099', 'small', 1, '牧场物语', '', '爱聊', 'weicall/thumbnails/1cfe22a1dfe021ffe307bc9b475a858b.jpg', '', 'weicall/archive/2a575e8130810e1e83ed16b30851c7b4.zip', 213999, '38ffe5b9f25746ef7077e7ad0714066a', 0, 0, 0, 0, 1, 1031, '2014-03-21 11:22:36', '2014-08-05 07:30:08'),
(250, 'ios', '000.000.000', '003.002.099', 'small', 1, '牧场物语', '', '爱聊', 'weicall/thumbnails/aaf167ac0317b6b01142a0c3c6dea40d.jpg', '', 'weicall/archive/4b47d52e341b63fdcb1055f22b1313e2.zip', 507361, 'cb1d565bd6dfe74350a66b07d1203014', 0, 0, 0, 1, 1, 1024, '2014-04-19 11:32:34', '2014-08-05 07:30:08'),
(251, 'ios', '000.000.000', '003.006.099', 'small', 2, '460-黄色小野花', '', '', 'weicall/thumbnails/87babf6a631aa92fd0d8cd2b18791560.jpg', '', 'weicall/archive/df3e3f4a7f864c1448cc377c40996d0e.jpg', 25234, '50a58445f1920555f0e17061707b4d22', 0, 0, 0, 0, 1, 1471, '2014-03-11 10:59:30', '2014-11-06 05:58:42'),
(253, 'ios', '000.000.000', '003.006.099', 'small', 2, '470-紫色百合图', '', '', 'weicall/thumbnails/1e5abed2a52edd73ffbc218261925129.jpg', '', 'weicall/archive/6df4d26e6e9b7cbc79ecd1456cc10d89.jpg', 36556, 'ebdb54f45bcf7b2f4debd6dc3e391c88', 0, 0, 0, 0, 1, 1481, '2014-03-11 11:00:15', '2014-11-06 05:58:42'),
(261, 'ios', '000.000.000', '003.006.099', 'small', 2, '450-小屋插画', '', '', 'weicall/thumbnails/100693222e8810538f2683749d34f001.jpg', '', 'weicall/archive/dbbb54f7b256e81f82641e297633baba.jpg', 54366, '20b2c4ce6ac127ff8847eb51f263c2dd', 0, 0, 0, 0, 1, 1461, '2014-03-11 11:01:56', '2014-11-06 05:58:42'),
(264, 'android', '000.000.000', '003.006.099', 'small', 2, '460-黄色小野花-S', '', '', 'weicall/thumbnails/2704c7a5b68d0dc272af56bb146f9620.jpg', '', 'weicall/archive/746e273240439c7d4c0f66d6816ed6c3.jpg', 7095, 'e7907d34f92c93bb6c712d8d013d92ec', 0, 0, 0, 0, 1, 1471, '2014-03-19 13:54:44', '2014-11-06 05:58:42'),
(266, 'android', '000.000.000', '003.006.099', 'small', 2, '470-紫色百合图-S', '', '', 'weicall/thumbnails/131458309a8bc0571c2cda6aa73a0b10.jpg', '', 'weicall/archive/7394249534aaa515df57a447f083e58b.jpg', 14234, '491abbe24e5764b1406ed4dc0983f018', 0, 0, 0, 0, 1, 1481, '2014-04-21 14:59:58', '2014-11-06 05:58:42'),
(274, 'android', '000.000.000', '003.006.099', 'small', 2, '450-小屋插画-S', '', '', 'weicall/thumbnails/b31c5501e1be5ebfa8948f24f7e3b3b4.jpg', '', 'weicall/archive/d9c8d1712687ef83f37b040c9718b552.jpg', 17537, '06819ec61f0dee7d67f326e4713fd25d', 0, 0, 0, 0, 1, 1461, '2014-03-19 13:54:52', '2014-11-06 05:58:42'),
(276, 'android', '000.000.000', '003.006.099', 'middle', 2, '460-黄色小野花-M', '', '', 'weicall/thumbnails/c7846e500e8a4f0e252a07249cb6e572.jpg', '', 'weicall/archive/6b89fb6546ea8264f1966eccc2715f4f.jpg', 10228, 'e80136b6794e0bf2254c748f59a6cd45', 0, 0, 0, 0, 1, 1471, '2014-03-19 14:16:35', '2014-11-06 05:58:42'),
(278, 'android', '000.000.000', '003.006.099', 'middle', 2, '470-紫色百合图-M', '', '', 'weicall/thumbnails/fe65e09c24c09dac9f0de470227318ce.jpg', '', 'weicall/archive/923bb7bdadaba21efdc8d94c3252f50a.jpg', 17414, 'c7ba3e409c51510c010e46d0b39143d8', 0, 0, 0, 0, 1, 1481, '2014-03-19 14:16:54', '2014-11-06 05:58:42'),
(286, 'android', '000.000.000', '003.006.099', 'middle', 2, '450-小屋插画-M', '', '', 'weicall/thumbnails/6cdf8235fbba37ba9f4b946d06a45ab1.jpg', '', 'weicall/archive/317edcce158dbf272cbde0c6b9160afb.jpg', 27974, 'ee4ca5101ee3c9f3b0b0d9a3fbac2017', 0, 0, 0, 0, 1, 1461, '2014-03-19 14:16:28', '2014-11-06 05:58:42'),
(288, 'all', '000.000.000', '099.099.099', '', 5, '梦中的婚礼', '', '', '', '', 'weicall/archive/54aa17f28afa85629a3da8fc180662a7.zip', 432, '2c891ae17fe0ab2423c0e2dbbad2ea16', 0, 0, 0, 1, 1, 0, '2014-04-14 17:51:33', '2014-08-05 07:30:08'),
(289, 'android', '000.000.000', '003.006.099', 'large', 2, '460-黄色小野花-L', '', '', 'weicall/thumbnails/d89c822d65350440bb5f936a5322df50.jpg', '', 'weicall/archive/550b6c8e27b963948f73841c06595a8b.jpg', 45335, 'c5b33214397782dbe0dd10b1cc7a9aa7', 0, 0, 0, 0, 1, 1471, '2014-03-19 14:25:58', '2014-11-06 05:58:42'),
(291, 'android', '000.000.000', '003.006.099', 'large', 2, '470-紫色百合图-L', '', '', 'weicall/thumbnails/45b277522dd36721de6958e9ab7d8937.jpg', '', 'weicall/archive/85ccf974d50d4129d8ad6d423c7d71b4.jpg', 58241, 'dea57121c11261c771552a5c9d189853', 0, 0, 0, 0, 1, 1481, '2014-04-21 15:00:27', '2014-11-06 05:58:42'),
(298, 'android', '000.000.000', '003.006.099', 'large', 2, '450-小屋插画-L', '', '', 'weicall/thumbnails/6b312cccb8c36724221139cc39e5bfb7.jpg', '', 'weicall/archive/ce209730bdce9c21897c18b763ffd584.jpg', 80330, '7944f160c33100c3e9386b5f4cb59de2', 0, 0, 0, 0, 1, 1461, '2014-03-19 14:25:52', '2014-11-06 05:58:42'),
(300, 'ios', '000.000.000', '003.002.099', 'small', 1, '粉红回忆', '粉红色主题', 'wu', 'weicall/thumbnails/a11edf0828b5c5754556479d38a60872.jpg', '', 'weicall/archive/43f2eebecbb4abef9895551c116e171c.zip', 563196, 'cc46f6e98b88767a522b33ffe07b7243', 0, 0, 0, 0, 1, 1071, '2014-03-17 17:31:40', '2014-08-05 07:30:08'),
(306, 'android', '000.000.000', '003.002.099', 'small', 1, '魔法精灵', '', '', 'weicall/thumbnails/06496a29b0799074e21bfbb4f4a5bc66.jpg', '', 'weicall/archive/4e32586702f66fb4bdd29627d3525a6a.zip', 190685, '04e2c1b0be401e3a9605c164570ffd0c', 0, 0, 0, 0, 1, 1022, '2014-04-15 11:05:51', '2014-08-05 07:30:08'),
(307, 'android', '000.000.000', '003.002.099', 'large', 1, '魔法精灵', '', '', 'weicall/thumbnails/dbdf026a90fb5b56b72354bdf65fd461.jpg', '', 'weicall/archive/7d56e35a1c51279f020c81e52169bbb3.zip', 368212, '0bed943fc30c1625b59ba292c23f9d3b', 0, 0, 0, 0, 1, 1022, '2014-04-15 11:05:45', '2014-08-05 07:30:08'),
(308, 'android', '000.000.000', '003.002.099', 'small', 1, '活力水果', '', '', 'weicall/thumbnails/d4bc9a7c66718f5a09174e90f5996b70.jpg', '', 'weicall/archive/232053bd7a31005719a01af0aad408d4.zip', 153507, '1fd4987c8af260dd6e94c54e806ea8bb', 0, 0, 0, 0, 1, 1023, '2014-04-15 11:06:12', '2014-08-05 07:30:08'),
(309, 'android', '000.000.000', '003.002.099', 'middle', 1, '活力水果', '', '', 'weicall/thumbnails/2e9534f1295e7865300727d1068fbb31.jpg', '', 'weicall/archive/25ad56f46ac0278483dc706eed8e75eb.zip', 207881, '5ee89ceea81f377cda79d7204775e18a', 0, 0, 0, 0, 1, 1023, '2014-04-15 11:06:07', '2014-08-05 07:30:08'),
(310, 'android', '000.000.000', '003.002.099', 'large', 1, '活力水果', '', '', 'weicall/thumbnails/6a4c7723eac92d44152ad1cc8aa5d64c.jpg', '', 'weicall/archive/eb21fb11b12c0287fb860bfafb420ef0.zip', 313145, '0653e24e9e389e747b598b1428842f49', 0, 0, 0, 0, 1, 1023, '2014-04-15 11:06:02', '2014-08-05 07:30:08'),
(311, 'ios', '000.000.000', '003.002.099', 'small', 1, '活力水果', '', '', 'weicall/thumbnails/af7ef904bafc2b7a730651262801d88b.jpg', '', 'weicall/archive/6f5f7d9dd0bd0ed24d02daf9d46ddd28.zip', 491701, 'ea37506777f00666d76bf062ab2422ad', 0, 0, 0, 0, 1, 1023, '2014-04-15 11:05:57', '2014-08-05 07:30:08'),
(319, 'ios', '000.000.000', '003.002.099', 'small', 1, '魔法精灵', '', '', 'weicall/thumbnails/c6291c8b31ac6644ffb675f215e95e6e.jpg', '', 'weicall/archive/62fdac98a7e35f0a2b9fd6e7694576ee.zip', 437029, 'a97d7e54e1b84443cd1dcea0d36c95f0', 0, 0, 0, 0, 1, 1022, '2014-04-15 11:05:35', '2014-08-05 07:30:08'),
(320, 'android', '000.000.000', '003.002.099', 'middle', 1, '热血篮球', '', '', 'weicall/thumbnails/89fa58c8b4aa72772467b6fbb2694935.jpg', '', 'weicall/archive/52fccf832aa3df73b8264d8034eede17.zip', 226884, '5b8f5dff231d9bbadff00d23ac2a3387', 0, 0, 1, 0, 1, 1018, '2014-03-21 11:18:26', '2014-08-05 07:30:08'),
(321, 'ios', '000.000.000', '003.002.099', 'small', 1, '热血篮球', '', '', 'weicall/thumbnails/79684d6b56370faaa8b1e0549f4a4193.jpg', '', 'weicall/archive/1ecdac748e9fe57537dd8591bcaccf15.zip', 575021, 'cd3b2b3ff2d1998478da35b06505cbf3', 0, 0, 1, 0, 1, 1018, '2014-03-17 17:55:14', '2014-08-05 07:30:08'),
(324, 'android', '000.000.000', '003.002.099', 'large', 1, '热血篮球', '', '', 'weicall/thumbnails/9b81628824b89f75c01fd2ea5fcb64b4.jpg', '', 'weicall/archive/f9c4fb82fb3ed1cf42b6b55216cb7306.zip', 392609, '33044919855f0a892051ece7818f53c5', 0, 0, 1, 1, 1, 1018, '2014-03-21 11:18:17', '2014-08-05 07:30:08'),
(325, 'android', '000.000.000', '003.002.099', 'small', 1, '热血篮球', '', '', 'weicall/thumbnails/a4298610b248535bd37709fdd9b3999c.jpg', '', 'weicall/archive/5bd6351da6428db4127ffe9e5a1dae66.zip', 175799, 'fff9ddc280ad4859fd5208f114dfa149', 0, 0, 1, 1, 1, 1018, '2014-03-21 11:18:10', '2014-08-05 07:30:08'),
(327, 'ios', '000.000.000', '003.002.099', 'small', 1, '黑色简约', '', '', 'weicall/thumbnails/23866cf5f9af794d227050730c5b53cf.jpg', '', 'weicall/archive/55809ed2266d90c566e4d3ce33e6fa06.zip', 284601, 'd4aef62e68b3a121768ea3ad93cf7e16', 0, 0, 1, 0, 1, 1017, '2014-03-20 18:09:14', '2014-08-05 07:30:08'),
(329, 'android', '000.000.000', '003.002.099', 'small', 1, '黑色简约', '', '', 'weicall/thumbnails/fbddd54b3fc784039bcce57d85cac5df.jpg', '', 'weicall/archive/450dca88e207a8db13ac8ed2a4430e0d.zip', 191715, '342e0d5b268e270e8eeeb0ce9e499e8a', 0, 0, 1, 0, 1, 1017, '2014-03-21 15:02:13', '2014-08-05 07:30:08'),
(333, 'android', '000.000.000', '003.002.099', 'middle', 1, '黑色简约', '', '', 'weicall/thumbnails/36af304a418c785cd775d006d45ab29c.jpg', '', 'weicall/archive/60443ff1c84c1b8962d0069fcb1bd0dc.zip', 241808, 'cee6c30db2f0f849eb55e8dee4e5918a', 0, 0, 1, 0, 1, 1017, '2014-03-21 14:49:38', '2014-08-05 07:30:08'),
(347, 'android', '000.000.000', '003.002.099', 'middle', 1, '缤纷圣诞', '', '', 'weicall/thumbnails/5e3ea86107588668106ac91f40b688f2.jpg', '', 'weicall/archive/0d8c491ccc9738502904d7965078addc.zip', 306826, '9370f398cc9cd7c0e99424bee6c6267b', 0, 0, 0, 0, 1, 1019, '2014-04-15 11:06:33', '2014-08-05 07:30:08'),
(351, 'android', '000.000.000', '003.002.099', 'small', 1, '缤纷圣诞', '', '', 'weicall/thumbnails/76ac3ef20865cacda6c2f3c7f79f7161.jpg', '', 'weicall/archive/07e3a4d914a5e2f31c500ee2289b50ce.zip', 189388, '966651b0663de36f4f6c6d94a8c096c8', 0, 0, 0, 0, 1, 1019, '2014-04-15 11:06:27', '2014-08-05 07:30:08'),
(352, 'ios', '000.000.000', '003.002.099', 'small', 1, '缤纷圣诞', '', '', 'weicall/thumbnails/9656c207d1f9f2967c3d50449706ff43.jpg', '', 'weicall/archive/e7e93d04c66b8849979b2446da8993c9.zip', 471090, 'a78b6c357b7c9df6e7a271ca0ebed773', 0, 0, 0, 0, 1, 1019, '2014-04-15 11:06:38', '2014-08-05 07:30:08'),
(355, 'android', '000.000.000', '003.002.099', 'large', 1, '缤纷圣诞', '', '', 'weicall/thumbnails/b812cfba5b31c05dca733a16ac2a71b7.jpg', '', 'weicall/archive/a09c8af41c8bab0b403999cbceb08b41.zip', 393374, '11a623b58c566fdc664a05f4ef2350f7', 0, 0, 0, 0, 1, 1019, '2014-04-15 11:06:21', '2014-08-05 07:30:08'),
(356, 'android', '000.000.000', '003.002.099', 'large', 1, '黑色简约', '', '', 'weicall/thumbnails/627a0c816de4963237c11c0cfaff3d9a.jpg', '', 'weicall/archive/a8b635a5a9d2b6e836ee81c42eb758e9.zip', 335926, 'e984e308f9389b1060adc22d318e2479', 0, 0, 1, 0, 1, 1017, '2014-03-21 14:49:30', '2014-08-05 07:30:08'),
(358, 'android', '000.000.000', '003.002.099', 'middle', 1, '牧场物语', '', '', 'weicall/thumbnails/2812a9699c48bd88cd989f25e5e7b3a8.jpg', '', 'weicall/archive/6a3305a3341693211c3ab2c0515d56be.zip', 276365, '766099da433118e69f3736921cc8bed6', 0, 0, 0, 0, 1, 1031, '2014-04-15 11:02:43', '2014-08-05 07:30:08'),
(359, 'android', '000.000.000', '003.002.099', 'large', 1, '牧场物语', '', '', 'weicall/thumbnails/bdaa6813ff4e84b8f527b2341d3322cc.jpg', '', 'weicall/archive/740a807b1db259d90ceff4e515b38e17.zip', 399190, '3d0595aa89f6e5c1773d5bf6870135a5', 0, 0, 0, 0, 1, 1031, '2014-03-21 11:22:45', '2014-08-05 07:30:08'),
(360, 'android', '000.000.000', '003.002.099', 'large', 1, '哆啦a梦', '', '', 'weicall/thumbnails/8c0990ca53c5a168200a2fa66a367811.jpg', '', 'weicall/archive/42fbaa434af636580d6eb1f212c906c6.zip', 307940, 'aa439a752267ea6e794780268901c9ed', 0, 0, 0, 0, 1, 1021, '2014-03-21 11:22:04', '2014-08-05 07:30:08'),
(389, 'ios', '000.000.000', '003.006.099', 'small', 2, '001-ILOVEYOU桃心', '', '', 'weicall/thumbnails/f0ad18b9ac4c31e514e34d4438be3f2a.jpg', '', 'weicall/archive/a5940f81a8a120954f0a35438bdd35e3.jpg', 54511, '37f1ea7ea69fcad24a035a77f9f52770', 0, 0, 1, 0, 1, 1, '2014-03-11 10:30:14', '2014-11-06 05:58:42'),
(390, 'android', '000.000.000', '003.006.099', 'small', 2, '001-ILOVEYOU桃心-S', '', '', 'weicall/thumbnails/94fb83765f2446ab2ff5b547ed2b6e86.jpg', '', 'weicall/archive/89ead1d05646a1ed60a507b022402bd8.jpg', 17639, 'fa2269f1f0ba320d07d00103a11f5977', 0, 0, 1, 0, 1, 1, '2014-03-19 14:08:28', '2014-11-06 05:58:42'),
(391, 'android', '000.000.000', '003.006.099', 'middle', 2, '001-ILOVEYOU桃心-M', '', '', 'weicall/thumbnails/ca4277b3b051ebeb9d3211c9e19668dd.jpg', '', 'weicall/archive/3bd8128c3cd76236b47af7096bed6a8d.jpg', 31293, '304548732fbe0f7dcb87289dfed208fd', 0, 0, 1, 0, 1, 1, '2014-03-19 14:08:54', '2014-11-06 05:58:42'),
(392, 'android', '000.000.000', '003.006.099', 'large', 2, '001-ILOVEYOU桃心-L', '', '', 'weicall/thumbnails/648050857db4cbdf13c1f838a0c67a08.jpg', '', 'weicall/archive/1b44720123db80a6dca0fa8951468560.jpg', 56197, '6d7a21ac1c2853f1a2274becc2159714', 0, 0, 1, 0, 1, 1, '2014-03-19 14:17:23', '2014-11-06 05:58:42'),
(393, 'ios', '000.000.000', '003.006.099', 'small', 2, '002-双白桃心', '', '', 'weicall/thumbnails/1e5723785aa6c5cc6ce074a2f82b28e3.jpg', '', 'weicall/archive/c03bc72545c1e2bdb1b13be9fd04ce47.jpg', 19932, '8e566c2f5ffad659f15abbeda96be605', 0, 0, 1, 0, 1, 11, '2014-03-11 10:30:18', '2014-11-06 05:58:42'),
(394, 'android', '000.000.000', '003.006.099', 'small', 2, '002-双白桃心-S', '', '', 'weicall/thumbnails/03f0ca71bec78968ffba042e9bd9f20c.jpg', '', 'weicall/archive/bbbbbed0a98aca0bb628fee0264cfb8e.jpg', 7056, 'c222cd117382558a3f7e86b217f1f245', 0, 0, 1, 0, 1, 11, '2014-03-19 14:08:21', '2014-11-06 05:58:42'),
(395, 'android', '000.000.000', '003.006.099', 'middle', 2, '002-双白桃心-M', '', '', 'weicall/thumbnails/bbda497cd6eb289181c187d6fbbc7c95.jpg', '', 'weicall/archive/cc8915e6ac050dbd0f2e8016e714b438.jpg', 11812, 'c3d49dbff895d9cd9ea7f8bcd5018788', 0, 0, 1, 0, 1, 11, '2014-03-19 14:09:00', '2014-11-06 05:58:42'),
(396, 'android', '000.000.000', '003.006.099', 'large', 2, '002-双白桃心-L', '', '', 'weicall/thumbnails/d35017e6a4dc6f71ba1a1b7bc4e2acf1.jpg', '', 'weicall/archive/cecdb0823452e1dbbc643c8beebd4e8a.jpg', 21184, 'e755a0c8a94255238c3254922ea8ba49', 0, 0, 1, 0, 1, 11, '2014-03-19 14:17:30', '2014-11-06 05:58:42'),
(401, 'ios', '000.000.000', '003.006.099', 'small', 2, '004-草莓', '', '', 'weicall/thumbnails/f5470df3b08b70ed6b950243e89baed0.jpg', '', 'weicall/archive/dcad9d4c402a6529d13e50ad0478b559.jpg', 75714, '1f2f6d85e971acf6eadbd2eec6e64ecf', 0, 0, 1, 0, 1, 31, '2014-03-11 10:31:38', '2014-11-06 05:58:42'),
(402, 'android', '000.000.000', '003.006.099', 'small', 2, '004-草莓-S', '', '', 'weicall/thumbnails/69cecd053d4556d2ccda9a13bc03f628.jpg', '', 'weicall/archive/df8adc4f1775155347e738589ba16f8b.jpg', 19452, '53529f19fd658d8494c3adc6e9d357d1', 0, 0, 1, 0, 1, 31, '2014-03-19 14:08:08', '2014-11-06 05:58:42'),
(403, 'android', '000.000.000', '003.006.099', 'middle', 2, '004-草莓-M', '', '', 'weicall/thumbnails/452a13a6c2d656f1980db26e71119324.jpg', '', 'weicall/archive/14a74f0ccc512ca731667549b7aa7f91.jpg', 39460, 'd4e8892192b84d4b16c59235cac2c863', 0, 0, 1, 0, 1, 31, '2014-03-19 14:09:14', '2014-11-06 05:58:42'),
(404, 'android', '000.000.000', '003.006.099', 'large', 2, '004-草莓-L', '', '', 'weicall/thumbnails/6edc0ae6cd29499b296b44a63ebb8043.jpg', '', 'weicall/archive/0cfc1d378884c5435b15ceaa80714043.jpg', 79599, 'eac68af43f2671bc5ee60f2d93a383f5', 0, 0, 1, 0, 1, 31, '2014-03-19 14:17:42', '2014-11-06 05:58:42'),
(405, 'ios', '000.000.000', '003.006.099', 'small', 2, '005-小黄狗', '', '', 'weicall/thumbnails/09e0201506ad94c2495c25eac0109c91.jpg', '', 'weicall/archive/d5df8631bbfebec5009ee815abd9b8c5.jpg', 35811, 'd25b0974a798951afc0347371bab6404', 0, 0, 1, 0, 1, 925, '2014-03-11 09:38:48', '2014-11-06 05:58:42'),
(406, 'android', '000.000.000', '003.006.099', 'small', 2, '005-小黄狗-S', '', '', 'weicall/thumbnails/274ce5b435416d631d55f3709e9134b4.jpg', '', 'weicall/archive/e02b734c60b008e20dcee377a8d8a321.jpg', 12833, 'fb4d6924db27093c591ecdba1a3de3a2', 0, 0, 1, 0, 1, 925, '2014-03-11 09:38:38', '2014-11-06 05:58:42'),
(407, 'android', '000.000.000', '003.006.099', 'middle', 2, '005-小黄狗-M', '', '', 'weicall/thumbnails/cce4c2974dfe103bbde60065e2261976.jpg', '', 'weicall/archive/81a9f53eb2be91174f1bde05bc04bb68.jpg', 21208, '3168168d9c795f87c1caf9c90ea483d4', 0, 0, 1, 0, 1, 925, '2014-03-19 14:10:36', '2014-11-06 05:58:42'),
(408, 'android', '000.000.000', '003.006.099', 'large', 2, '005-小黄狗-L', '', '', 'weicall/thumbnails/03ab07a0d018242a69b090fac41085f7.jpg', '', 'weicall/archive/d65b088e0b0227b920a7c33810b6c4a1.jpg', 42047, 'e293faa85eabe7c94db4d8b2c3007f1d', 0, 0, 1, 0, 1, 925, '2014-03-19 14:19:10', '2014-11-06 05:58:42'),
(409, 'ios', '000.000.000', '003.006.099', 'small', 2, '006-哈士奇', '', '', 'weicall/thumbnails/720cb07e7c3252fda6b1ed406d5d47be.jpg', '', 'weicall/archive/4a53dca9dd2c7072e6f98cdb4f40020f.jpg', 48800, '9441cb327cda24569f016fb08fd0eb7c', 0, 0, 1, 0, 1, 61, '2014-03-11 10:33:46', '2014-11-06 05:58:42'),
(410, 'android', '000.000.000', '003.006.099', 'small', 2, '006-哈士奇-S', '', '', 'weicall/thumbnails/d424fc69d08662409faf8ca7623a6d70.jpg', '', 'weicall/archive/cb0daa5d6b5e54c8ff70add5fbf49e77.jpg', 14765, 'e7c3a0406b455cbf43efe89fc7d30359', 0, 0, 1, 0, 1, 61, '2014-03-19 14:07:12', '2014-11-06 05:58:42'),
(411, 'android', '000.000.000', '003.006.099', 'middle', 2, '006-哈士奇-M', '', '', 'weicall/thumbnails/0b8c76f898171f43b7ceb1b820f79811.jpg', '', 'weicall/archive/c215f6547b9079e933ed71cf4939bc9f.jpg', 28324, '626a9b7d4f4f3dc2bdec590ab158ae1a', 0, 0, 1, 0, 1, 61, '2014-03-19 14:09:38', '2014-11-06 05:58:42'),
(412, 'android', '000.000.000', '003.006.099', 'large', 2, '006-哈士奇-L', '', '', 'weicall/thumbnails/5e3b1784db6f2c34689adf3dabde0ee9.jpg', '', 'weicall/archive/704a79afde2d9f5036b70db7123a0e74.jpg', 57782, '36973fbf7498b44a9fddd7bbfbe04a46', 0, 0, 1, 0, 1, 61, '2014-03-19 14:18:01', '2014-11-06 05:58:42'),
(413, 'ios', '000.000.000', '003.006.099', 'small', 2, '007-粉色小花丛', '', '', 'weicall/thumbnails/4d685b2de71c5cd7e41f3aa78d0f811b.jpg', '', 'weicall/archive/87ed93158504bb24e255235ccfcbc193.jpg', 56775, '7d3f39051f9dede1c209916298b21f94', 0, 0, 1, 0, 1, 71, '2014-03-11 10:34:11', '2014-11-06 05:58:42'),
(414, 'android', '000.000.000', '003.006.099', 'small', 2, '007-粉色小花丛-S', '', '', 'weicall/thumbnails/14e74a1bfb92588ff9c0b01b71946546.jpg', '', 'weicall/archive/bac269afed9b8820164354bede84a739.jpg', 17104, '1fa66752646c6fc09dbc380ffab87733', 0, 0, 1, 0, 1, 71, '2014-03-19 14:07:05', '2014-11-06 05:58:42'),
(415, 'android', '000.000.000', '003.006.099', 'middle', 2, '007-粉色小花丛-M', '', '', 'weicall/thumbnails/e6ba9423d85ede3c4a369fec85db7263.jpg', '', 'weicall/archive/5bacb44aba26c26e3eed993eaee4c6da.jpg', 33309, '3b81898c465846b0601cab44ca32b26b', 0, 0, 1, 0, 1, 71, '2014-03-19 14:09:45', '2014-11-06 05:58:42'),
(416, 'android', '000.000.000', '003.006.099', 'large', 2, '007-粉色小花丛-L', '', '', 'weicall/thumbnails/41747dc41e2632a70ce9ed0e10665e73.jpg', '', 'weicall/archive/a2c8cca8d90e1620a4787bcb66472505.jpg', 63980, 'ccd225c6d7071c866f63611f9ceaf5d3', 0, 0, 1, 0, 1, 71, '2014-03-19 14:18:08', '2014-11-06 05:58:42'),
(417, 'ios', '000.000.000', '003.006.099', 'small', 2, '008-绿叶', '', '', 'weicall/thumbnails/9f510dbde91b4871bc160d6b26712bc2.jpg', '', 'weicall/archive/4ecae5cb7b347b14401eadb7bdc36c85.jpg', 29185, 'd5d11e03cd28f329a2b3836ca4d9ed44', 0, 0, 1, 0, 1, 81, '2014-03-11 10:34:25', '2014-11-06 05:58:42'),
(418, 'android', '000.000.000', '003.006.099', 'small', 2, '008-绿叶-S', '', '', 'weicall/thumbnails/cdd9adbfce23a1a2f53dfc344532dc9f.jpg', '', 'weicall/archive/97ac868aaa1f74d04d69aeceac714778.jpg', 10152, 'e56dea984ea880deef8df9705fc1d84e', 0, 0, 1, 0, 1, 81, '2014-03-19 14:06:57', '2014-11-06 05:58:42');
INSERT INTO `tbl_resource_list` (`id`, `platform`, `version_min`, `version_max`, `mapping`, `category_id`, `name`, `discription`, `author`, `thumb`, `preview`, `download_url`, `filesize`, `file_md5`, `price`, `hits`, `is_new`, `is_check`, `status`, `weight`, `create_datetime`, `modified_datetime`) VALUES
(419, 'android', '000.000.000', '003.006.099', 'middle', 2, '008-绿叶-M', '', '', 'weicall/thumbnails/f328f2c27ef00d92ed06c61ac5bedd29.jpg', '', 'weicall/archive/e39d0c4328da557cf469107e060f430d.jpg', 18387, '5e646210929178f80c31eccffa78b3a6', 0, 0, 1, 0, 1, 81, '2014-03-19 14:09:51', '2014-11-06 05:58:42'),
(420, 'android', '000.000.000', '003.006.099', 'large', 2, '008-绿叶-L', '', '', 'weicall/thumbnails/d6a6cad6ee2093e58903201af3612bd9.jpg', '', 'weicall/archive/da32a7ff7a0a9ff79716cd6f4e843204.jpg', 34802, '168aa03416081c6c4e417b9b86b8721e', 0, 0, 1, 0, 1, 81, '2014-03-19 14:18:15', '2014-11-06 05:58:42'),
(421, 'ios', '000.000.000', '003.006.099', 'small', 2, '009-一匹骏马', '', '', 'weicall/thumbnails/6721db047eac6a466e08598e2dc6bf5c.jpg', '', 'weicall/archive/66f696a5f49fae4600da209c51a683a8.jpg', 43568, '8a64d31d13df2e7ff7b152e889722a0e', 0, 0, 1, 0, 1, 91, '2014-03-11 10:34:42', '2014-11-06 05:58:42'),
(422, 'android', '000.000.000', '003.006.099', 'small', 2, '009-一匹骏马-S', '', '', 'weicall/thumbnails/5eaf3f8eacb4bf57e802abd72370a260.jpg', '', 'weicall/archive/2f6fd25225182a8df5b48b75e64a7536.jpg', 15274, '590a31b53c138d30c66cc60767f04ed6', 0, 0, 1, 0, 1, 91, '2014-03-19 14:06:49', '2014-11-06 05:58:42'),
(423, 'android', '000.000.000', '003.006.099', 'middle', 2, '009-一匹骏马-M', '', '', 'weicall/thumbnails/8e0d34adffd45ab4f783d8d64662a527.jpg', '', 'weicall/archive/7139de3d928b0fd0778fbd3e8f11a084.jpg', 32355, 'd1dd3028098236736a8e5df1fed50dd2', 0, 0, 1, 0, 1, 91, '2014-03-19 14:10:00', '2014-11-06 05:58:42'),
(424, 'android', '000.000.000', '003.006.099', 'large', 2, '009-一匹骏马-L', '', '', 'weicall/thumbnails/cceedd90bd32b5c190018d0f8a92e0ab.jpg', '', 'weicall/archive/df8428cbb45f1ee8e723a0b35fefd5d9.jpg', 68679, '5ff2e719e2cc10cbd9e82a358172e9d2', 0, 0, 1, 0, 1, 91, '2014-03-19 14:18:22', '2014-11-06 05:58:42'),
(425, 'ios', '000.000.000', '003.006.099', 'small', 2, '010-黄色小猫', '', '', 'weicall/thumbnails/a9366b4790620139aec77404a3f4b05f.jpg', '', 'weicall/archive/a72c223fee8049a61ed2ab649772fd20.jpg', 44687, '37f81a97a82b5a4eb4653734c93e29c9', 0, 0, 1, 0, 1, 920, '2014-03-10 14:18:09', '2014-11-06 05:58:42'),
(426, 'android', '000.000.000', '003.006.099', 'small', 2, '010-黄色小猫-S', '', '', 'weicall/thumbnails/3cceddcf96a3ff3940f23f66e70b43f7.jpg', '', 'weicall/archive/497edd18e432a4e66548aded9911a4a4.jpg', 10848, '8d54f90168d3b97e178bb255309ad6bb', 0, 0, 1, 0, 1, 101, '2014-03-19 14:06:40', '2014-11-06 05:58:42'),
(427, 'android', '000.000.000', '003.006.099', 'middle', 2, '010-黄色小猫-M', '', '', 'weicall/thumbnails/fd3a03959692d6175cf67a9f69631407.jpg', '', 'weicall/archive/33ae77fd9a6b95d2c4c6c0d9bb84aeda.jpg', 23143, '0a33d853fdec00dbf4f20549ec98428e', 0, 0, 1, 0, 1, 101, '2014-03-19 14:10:09', '2014-11-06 05:58:42'),
(428, 'android', '000.000.000', '003.006.099', 'large', 2, '010-黄色小猫-L', '', '', 'weicall/thumbnails/29169d53caade0e9ed15429f1fd1accb.jpg', '', 'weicall/archive/8e4a20a46754222097ab0464b709ee39.jpg', 46166, 'd9b31a859cd23152c396bf88ef2234a7', 0, 0, 1, 0, 1, 101, '2014-03-19 14:18:33', '2014-11-06 05:58:42'),
(429, 'ios', '000.000.000', '003.006.099', 'small', 2, '011-圣诞老人袜', '', '', 'weicall/thumbnails/16e4209abc3a0144cb1012e802081677.jpg', '', 'weicall/archive/718c32c04cda6affad932471d471c144.jpg', 51740, '37cd4041da0e03161d501117c5e5ec9e', 0, 0, 1, 0, 1, 921, '2014-03-10 14:25:39', '2014-11-06 05:58:42'),
(430, 'android', '000.000.000', '003.006.099', 'small', 2, '011-圣诞老人袜-S', '', '', 'weicall/thumbnails/3fcef01a891599e5fbd4c3cff8067f76.jpg', '', 'weicall/archive/a6d5868ae5b4026216e2012c9abdc5c9.jpg', 15130, '14b1583a33302126c749c4877eb86611', 0, 0, 1, 0, 1, 921, '2014-03-19 14:06:34', '2014-11-06 05:58:42'),
(431, 'android', '000.000.000', '003.006.099', 'middle', 2, '011-圣诞老人袜-M', '', '', 'weicall/thumbnails/eccdb0440cb7858a06479ec0064ec964.jpg', '', 'weicall/archive/09c08a8c18996a186c8c034a4e9b4244.jpg', 26965, '2fbc491f91cf4b056e45b9f730ea5d09', 0, 0, 1, 0, 1, 921, '2014-03-19 14:10:14', '2014-11-06 05:58:42'),
(432, 'android', '000.000.000', '003.006.099', 'large', 2, '011-圣诞老人袜-L', '', '', 'weicall/thumbnails/27c3161bd5293ac5fadf0a00b65f305c.jpg', '', 'weicall/archive/ecf9625cc38dae19e16d0092eb8ea98b.jpg', 50911, '4ad704beca3006ec5f6b6e4ddbda661e', 0, 0, 1, 0, 1, 921, '2014-03-19 14:18:40', '2014-11-06 05:58:42'),
(433, 'ios', '000.000.000', '003.006.099', 'small', 2, '012-黄毛小鸟', '', '', 'weicall/thumbnails/69db6a2abcae5158a3298d54116633de.jpg', '', 'weicall/archive/e896eb0bae28e14f524c9a542b740c9e.jpg', 41611, 'd5d9391e0be357e227d1767d611f7847', 0, 0, 1, 0, 1, 922, '2014-03-10 14:27:48', '2014-11-06 05:58:42'),
(434, 'android', '000.000.000', '003.006.099', 'small', 2, '012-黄毛小鸟-S', '', '', 'weicall/thumbnails/f04e5ac212b23b902bb170cb7f4d6c13.jpg', '', 'weicall/archive/e3d361890ede3c5c8a4a3c30c32d53eb.jpg', 12370, '6f93b3c9f4be17325d4de3be251158bd', 0, 0, 1, 0, 1, 922, '2014-03-19 14:06:26', '2014-11-06 05:58:42'),
(435, 'android', '000.000.000', '003.006.099', 'middle', 2, '012-黄毛小鸟-M', '', '', 'weicall/thumbnails/299f6dad5d97d5464ac6837a9c9e6a4e.jpg', '', 'weicall/archive/0ae63724a7b985168ac5e6f980327637.jpg', 22680, '65e0bf0ac4382b7b9f042463ffc70336', 0, 0, 1, 0, 1, 922, '2014-03-19 14:10:20', '2014-11-06 05:58:42'),
(436, 'android', '000.000.000', '003.006.099', 'large', 2, '012-黄毛小鸟-L', '', '', 'weicall/thumbnails/e80dcc2357908455678f7c5d103dc5e5.jpg', '', 'weicall/archive/d957852263b8bf4093a6fdd64fbc85b5.jpg', 47528, '8b58697b20a67fe9b4755f0fac9b7ef6', 0, 0, 1, 0, 1, 922, '2014-03-19 14:18:46', '2014-11-06 05:58:42'),
(437, 'ios', '000.000.000', '003.006.099', 'small', 2, '013-一朵粉菊', '', '', 'weicall/thumbnails/cc6e040356a4a57a067f79ae58182d69.jpg', '', 'weicall/archive/822d9485a1307e11d24a4682d3cb72a8.jpg', 46344, '8d3a7a73b4567893140a552171e4c36a', 0, 0, 1, 0, 1, 923, '2014-03-10 14:30:21', '2014-11-06 05:58:42'),
(438, 'android', '000.000.000', '003.006.099', 'small', 2, '013-一朵粉菊-S', '', '', 'weicall/thumbnails/f9a63d80fe4f6f0960a25a9c1eb99150.jpg', '', 'weicall/archive/4eadfae06210a9bad5e9566e26bd897c.jpg', 16230, '47ed0faf8bea37193265cf12740ecdb5', 0, 0, 1, 0, 1, 923, '2014-03-19 14:06:16', '2014-11-06 05:58:42'),
(439, 'android', '000.000.000', '003.006.099', 'middle', 2, '013-一朵粉菊-M', '', '', 'weicall/thumbnails/1874f0c40fcfac0c1b637ab0c7c783d4.jpg', '', 'weicall/archive/624ed912de0b0e222adac7aaf7d82e8c.jpg', 31440, 'd081aa37ba00a70ea9dd1bfce08d946d', 0, 0, 1, 0, 1, 923, '2014-03-19 14:10:25', '2014-11-06 05:58:42'),
(440, 'android', '000.000.000', '003.006.099', 'large', 2, '013-一朵粉菊-L', '', '', 'weicall/thumbnails/71d551bab239041727e83d8d8798e717.jpg', '', 'weicall/archive/238ed4904f3d5467d371707977cb957d.jpg', 63385, '948471fed80da77b145f65da3a9b1b19', 0, 0, 1, 0, 1, 923, '2014-03-19 14:18:55', '2014-11-06 05:58:42'),
(441, 'ios', '000.000.000', '003.006.099', 'small', 2, '014-小松鼠', '', '', 'weicall/thumbnails/46a24026072be9d4ed2287f8ede5c924.jpg', '', 'weicall/archive/cb15125acce7f9e85a16f16b6d2ce09e.jpg', 44910, '4fe58c44057b860f8c3aa84552a3bfc3', 0, 0, 1, 0, 1, 924, '2014-03-10 14:32:44', '2014-11-06 05:58:42'),
(442, 'android', '000.000.000', '003.006.099', 'small', 2, '014-小松鼠-S', '', '', 'weicall/thumbnails/6c8cdc3f96f114a34368f4bc8cee2d23.jpg', '', 'weicall/archive/5ecfb1d95b8b60cfe150d13d0dc545be.jpg', 13188, '449c9f212af0f93a214596c43ee01e1a', 0, 0, 1, 0, 1, 924, '2014-03-19 14:06:11', '2014-11-06 05:58:42'),
(443, 'android', '000.000.000', '003.006.099', 'middle', 2, '014-小松鼠-M', '', '', 'weicall/thumbnails/3757574ae580af7f80db68265c3db04f.jpg', '', 'weicall/archive/544eec1c6784cfcc62586108d7d5f938.jpg', 39643, '69b8541c26cd5cca1f8ab817c15b816a', 0, 0, 1, 0, 1, 924, '2014-03-19 14:10:30', '2014-11-06 05:58:42'),
(444, 'android', '000.000.000', '003.006.099', 'large', 2, '014-小松鼠-L', '', '', 'weicall/thumbnails/b04e8d3e5057aa3f6f147b1042c8f7ae.jpg', '', 'weicall/archive/672b7d71a77fb5059f81f3b7b04c34ee.jpg', 76295, 'a34b731f95e8a0edccb163651c76b77b', 0, 0, 1, 0, 1, 924, '2014-03-19 14:19:01', '2014-11-06 05:58:42'),
(445, 'ios', '000.000.000', '003.006.099', 'small', 2, '015-白色跑车', '', '', 'weicall/thumbnails/f7d28d87169929df57d77ecb43809521.jpg', '', 'weicall/archive/6146638129a0725b2abcbc73ec945d54.jpg', 54485, 'a9f78a5bb50fcd3ed9722692a8f989b7', 0, 0, 1, 0, 1, 925, '2014-03-10 14:35:08', '2014-11-06 05:58:42'),
(446, 'android', '000.000.000', '003.006.099', 'small', 2, '015-白色跑车-S', '', '', 'weicall/thumbnails/74298f9261581a9de9efa20a4076a552.jpg', '', 'weicall/archive/970e16ef2be0c4c4ea93860b6de90688.jpg', 18379, 'b8abf6d58e3c6775f4e9e97453471e9f', 0, 0, 1, 0, 1, 925, '2014-03-19 14:06:04', '2014-11-06 05:58:42'),
(447, 'android', '000.000.000', '003.006.099', 'middle', 2, '015-白色跑车-M', '', '', 'weicall/thumbnails/ad424225e73e7c978af3088a7a082059.jpg', '', 'weicall/archive/d2100c736b549a97522c6b6bcedd714e.jpg', 35805, '44cff2cf087a5bc262ba4c356920c9a2', 0, 0, 1, 0, 1, 925, '2014-03-19 14:10:41', '2014-11-06 05:58:42'),
(448, 'android', '000.000.000', '003.006.099', 'large', 2, '015-白色跑车-L', '', '', 'weicall/thumbnails/89fddaf7c2a6214bcd797469ac6673d1.jpg', '', 'weicall/archive/1f702ffde53a89f9107c8d866ced1300.jpg', 73409, 'f2138a802e73567fa5a93a6a1bd7c70d', 0, 0, 1, 0, 1, 925, '2014-03-19 14:19:16', '2014-11-06 05:58:42'),
(449, 'ios', '000.000.000', '003.006.099', 'small', 2, '016-蓝色星星', '', '', 'weicall/thumbnails/6dc055803445f9e8575c760ad14d49cd.jpg', '', 'weicall/archive/72c47d90b4bf2407a0de41b2b93617ef.jpg', 32464, '1af263a0f8a16fee0e111c9877ea818f', 0, 0, 1, 0, 1, 926, '2014-03-10 14:37:48', '2014-11-06 05:58:42'),
(450, 'android', '000.000.000', '003.006.099', 'small', 2, '016-蓝色星星-S', '', '', 'weicall/thumbnails/2c70b62e51cabb857242822938e007b5.jpg', '', 'weicall/archive/5a3adcbc50ecedad04c1b58352f93f75.jpg', 6823, '80b060b47c0b314800ba901a169a515c', 0, 0, 1, 0, 1, 926, '2014-03-19 14:05:27', '2014-11-06 05:58:42'),
(451, 'android', '000.000.000', '003.006.099', 'middle', 2, '016-蓝色星星-M', '', '', 'weicall/thumbnails/f7cf993c4cde2fab129e1e04d1c76304.jpg', '', 'weicall/archive/942ae154831e3e0886c03016538e7811.jpg', 11694, '2eb0fbb5c5b791725d07ea588e238456', 0, 0, 1, 0, 1, 926, '2014-03-19 14:11:58', '2014-11-06 05:58:42'),
(452, 'android', '000.000.000', '003.006.099', 'large', 2, '016-蓝色星星-L', '', '', 'weicall/thumbnails/0d7abe4d0c926dea9d34a07fa1508549.jpg', '', 'weicall/archive/bd0b258decf6b1540394c427a60490f1.jpg', 20471, '130bba6899b92b6fb226399b24d44a8b', 0, 0, 1, 0, 1, 926, '2014-03-19 14:19:24', '2014-11-06 05:58:42'),
(453, 'ios', '000.000.000', '003.006.099', 'small', 2, '017-雪地大树', '', '', 'weicall/thumbnails/44f3cf6a8fa45146adac4da4ca74beb4.jpg', '', 'weicall/archive/edbbdd469469c9f3b76f1d6ae82fff0c.jpg', 56157, '17148502b99803bfa47c26bf9113dcfa', 0, 0, 1, 0, 1, 927, '2014-03-10 14:40:13', '2014-11-06 05:58:42'),
(454, 'android', '000.000.000', '003.006.099', 'small', 2, '199-雪地大树-S', '', '', 'weicall/thumbnails/f05826834a976e0498dd67723ac80cb0.jpg', '', 'weicall/archive/eabc080f8906011e48a629325eb2fee5.jpg', 16816, 'f65f88d5e0b2a69858251dbc3e8e6fc7', 0, 0, 1, 0, 1, 1210, '2014-03-19 14:05:41', '2014-11-06 05:58:42'),
(455, 'android', '000.000.000', '003.006.099', 'middle', 2, '017-雪地大树-M', '', '', 'weicall/thumbnails/8e022352aeed06400dd420b3bba26a1c.jpg', '', 'weicall/archive/0a412283c6c3f2372e548f3941a5191a.jpg', 37100, 'ff344f9070eda0b0b200600305c9ddb0', 0, 0, 1, 0, 1, 927, '2014-03-19 14:12:05', '2014-11-06 05:58:42'),
(456, 'android', '000.000.000', '003.006.099', 'large', 2, '017-雪地大树-L', '', '', 'weicall/thumbnails/06ed4d7f9ac95a3528b49f3809b2223c.jpg', '', 'weicall/archive/ac1551a7d5d09ba39e9841a3862c5848.jpg', 70485, 'e7c3898120b337ae25d6627937574254', 0, 0, 1, 0, 1, 927, '2014-03-19 14:19:31', '2014-11-06 05:58:42'),
(457, 'ios', '000.000.000', '003.006.099', 'small', 2, '006-蘑菇房', '', '', 'weicall/thumbnails/6ce56177f98cb79a88030b22084fd6de.jpg', '', 'weicall/archive/5d286cd07adaf675a7cc79ff422445b1.jpg', 61553, '8c18b2de3659fce01c01faee9b0592b3', 0, 0, 1, 0, 1, 51, '2014-03-11 10:33:18', '2014-11-06 05:58:42'),
(458, 'android', '000.000.000', '003.006.099', 'small', 2, '006-蘑菇房-S', '', '', 'weicall/thumbnails/1eb089ebedcd3a023b5c512b57949051.jpg', '', 'weicall/archive/a1e1d63a075e516c9300a8f6f4f4caa1.jpg', 15375, '2515309a69acc7d2b635102a2412a718', 0, 0, 1, 0, 1, 51, '2014-03-19 14:07:19', '2014-11-06 05:58:42'),
(459, 'android', '000.000.000', '003.006.099', 'middle', 2, '006-蘑菇房-M', '', '', 'weicall/thumbnails/66cd258cd4f6b7baa55a223a47174b00.jpg', '', 'weicall/archive/ea7d1fa4cc679fa9ecd54853b0a0b528.jpg', 29383, '850370af2d5b6af3457de7ddb23b8b4e', 0, 0, 1, 0, 1, 51, '2014-03-19 14:09:32', '2014-11-06 05:58:42'),
(460, 'android', '000.000.000', '003.006.099', 'large', 2, '006-蘑菇房-L', '', '', 'weicall/thumbnails/6185722602e6559530525765bbf59914.jpg', '', 'weicall/archive/b7d7aceb79dbe0315104c308ecdae032.jpg', 50472, '1e2d4e90c669760a1d335f7176ddb094', 0, 0, 1, 0, 1, 51, '2014-03-19 14:17:54', '2014-11-06 05:58:42'),
(461, 'ios', '000.000.000', '003.006.099', 'small', 2, '200-海星', '', '', 'weicall/thumbnails/905396fca1cb6a53673fd0b8e53a0bfb.jpg', '', 'weicall/archive/56a3d2edca4c9c9d970fd99fb3a494dc.jpg', 39757, '436e111155e244ef64136949d2fa0c54', 0, 0, 1, 0, 1, 1211, '2014-03-11 15:41:23', '2014-11-06 05:58:42'),
(462, 'android', '000.000.000', '003.006.099', 'small', 2, '200-海星-S', '', '', 'weicall/thumbnails/ee88c2044cdffa8ab40a07ca1b7fc454.jpg', '', 'weicall/archive/78320ce9270c7f543f9052f7b9378acc.jpg', 17458, '56c57b1aaaeb4b78c387d75acf565f46', 0, 0, 1, 0, 1, 1211, '2014-03-19 14:05:09', '2014-11-06 05:58:42'),
(463, 'android', '000.000.000', '003.006.099', 'middle', 2, '200-海星-M', '', '', 'weicall/thumbnails/0b9badf9cad4894d2d14e3989026e4d0.jpg', '', 'weicall/archive/759be8d6528a3a6b72c4f1b5d6fd4868.jpg', 35601, '7887fc86a6c7bd45925ddc6a2907285f', 0, 0, 1, 0, 1, 1211, '2014-03-19 14:12:11', '2014-11-06 05:58:42'),
(464, 'android', '000.000.000', '003.006.099', 'large', 2, '200-海星-L', '', '', 'weicall/thumbnails/a9cb97996525f7d62b4a47af0ec834b6.jpg', '', 'weicall/archive/93973059d56ef8ab9c1375cc0e7cb2de.jpg', 71322, '94e6e81c422081ad92918093968816e4', 0, 0, 1, 0, 1, 1211, '2014-03-19 14:19:42', '2014-11-06 05:58:42'),
(465, 'ios', '000.000.000', '003.006.099', 'small', 2, '210-向日葵', '', '', 'weicall/thumbnails/2d518e95ffc87df77528b97a94107b40.jpg', '', 'weicall/archive/6f609c386d3b9a36a477981ef281a249.jpg', 47758, '2a1914c7a546fd5953bb461c837894fe', 0, 0, 1, 0, 1, 1221, '2014-03-11 15:40:30', '2014-11-06 05:58:42'),
(466, 'android', '000.000.000', '003.006.099', 'small', 2, '210-向日葵-S', '', '', 'weicall/thumbnails/c0d44917f696d721f0f7d8fe41a673f2.jpg', '', 'weicall/archive/4624ee6ef59ca6f3ae34aaca84f7da17.jpg', 17522, 'f31912d8ccc6ad95664658d13b7f7a7f', 0, 0, 1, 0, 1, 1221, '2014-03-19 14:00:24', '2014-11-06 05:58:42'),
(467, 'android', '000.000.000', '003.006.099', 'middle', 2, '210-向日葵-M', '', '', 'weicall/thumbnails/425732234cf18a61ca11babf23248a13.jpg', '', 'weicall/archive/f0ca751f00802e64710beeccad24f41c.jpg', 34429, '110181e5f90a1f32b58e874038e682aa', 0, 0, 1, 0, 1, 1221, '2014-03-19 14:12:20', '2014-11-06 05:58:42'),
(468, 'android', '000.000.000', '003.006.099', 'large', 2, '210-向日葵-L', '', '', 'weicall/thumbnails/c23482b94a944cf8eac27d2b67123d2f.jpg', '', 'weicall/archive/fa081ac547113364430414ec342b6c32.jpg', 67243, '78565be8b24a5fe514a6706750c1ae92', 0, 0, 1, 0, 1, 1221, '2014-03-19 14:19:50', '2014-11-06 05:58:42'),
(469, 'ios', '000.000.000', '003.006.099', 'small', 2, '220-彩色雨伞', '', '', 'weicall/thumbnails/692cc4d71799419deb6907a80126e130.jpg', '', 'weicall/archive/67283b8c2eedead77f8784b6f7862efb.jpg', 42012, '7e7420f5c80230a18f5bfc323f24ab4c', 0, 0, 1, 0, 1, 1231, '2014-03-11 15:40:18', '2014-11-06 05:58:42'),
(470, 'android', '000.000.000', '003.006.099', 'small', 2, '220-彩色雨伞-S', '', '', 'weicall/thumbnails/b7b73c41cab101d8ef1dbbe51057871e.jpg', '', 'weicall/archive/6055e97d2370726c96bd5f2bd2b1d959.jpg', 12530, '659d6bb2816a4ef855ccf72713bd8796', 0, 0, 1, 0, 1, 1231, '2014-03-19 14:00:11', '2014-11-06 05:58:42'),
(471, 'android', '000.000.000', '003.006.099', 'middle', 2, '220-彩色雨伞-M', '', '', 'weicall/thumbnails/0ed09b9c77fb82a6d832084d767929b1.jpg', '', 'weicall/archive/6a546a33c77713be6982f9921ed223c1.jpg', 23547, '2f46cdcd464cc496e3f1254e7488c85d', 0, 0, 1, 0, 1, 1231, '2014-03-19 14:12:26', '2014-11-06 05:58:42'),
(473, 'android', '000.000.000', '003.006.099', 'large', 2, '220-彩色雨伞-L', '', '', 'weicall/thumbnails/e29831a561cf97d7698b42cf43cf7960.jpg', '', 'weicall/archive/393e0dfe16469963c20ae90a4a17faa7.jpg', 41648, '3a2215dc6bca591215e7234972532c5d', 0, 0, 1, 0, 1, 1231, '2014-03-19 14:19:55', '2014-11-06 05:58:42'),
(474, 'ios', '000.000.000', '003.006.099', 'small', 2, '230-紫色LOVE石', '', '', 'weicall/thumbnails/7da76e44a35691faae9c9d2c3ce6f8e3.jpg', '', 'weicall/archive/0bca5b3e6e8a0ed30e3181d15b2dc5eb.jpg', 49288, '2aa6c14d725de1758f81ece0e6cdc228', 0, 0, 1, 0, 1, 1241, '2014-03-11 15:38:09', '2014-11-06 05:58:42'),
(475, 'android', '000.000.000', '003.006.099', 'small', 2, '230-紫色LOVE石-S', '', '', 'weicall/thumbnails/3a95c5ac6fb06254e8b255823ddb1db9.jpg', '', 'weicall/archive/1560292e8b10299cfc113affd92c06ca.jpg', 18645, 'd9fe669271e964ed1a36a7792b05ec92', 0, 0, 1, 0, 1, 1241, '2014-03-19 14:00:03', '2014-11-06 05:58:42'),
(476, 'android', '000.000.000', '003.006.099', 'middle', 2, '230-紫色LOVE石-M', '', '', 'weicall/thumbnails/5d2eda2a784b39ced70232780736e861.jpg', '', 'weicall/archive/c482dff9b89fb5e23726b9d063fb574d.jpg', 40972, 'e51dfc9a082078ce9a9aeff8b695a071', 0, 0, 1, 0, 1, 1241, '2014-03-19 14:12:32', '2014-11-06 05:58:42'),
(477, 'android', '000.000.000', '003.006.099', 'large', 2, '230-紫色LOVE石-L', '', '', 'weicall/thumbnails/5492e357993dd97fb3d367c976f098d5.jpg', '', 'weicall/archive/5cc15a97c24949921c23e7635ed19da7.jpg', 89534, 'c0c0af4ce8232d640207945b37e5b618', 0, 0, 1, 0, 1, 1241, '2014-03-19 14:20:03', '2014-11-06 05:58:42'),
(478, 'ios', '000.000.000', '003.006.099', 'small', 2, '240-粉花蓝天', '', '', 'weicall/thumbnails/1101a125cf2258e291fef172f6f48f6a.jpg', '', 'weicall/archive/d7f3b59fd444e7ac3596c0afc77842b8.jpg', 46022, 'be11904a44652bebbeb136227355b950', 0, 0, 1, 0, 1, 1251, '2014-03-11 15:37:47', '2014-11-06 05:58:42'),
(479, 'android', '000.000.000', '003.006.099', 'small', 2, '240-粉花蓝天-S', '', '', 'weicall/thumbnails/0f12776cc87421ac126aa3aa12aec85f.jpg', '', 'weicall/archive/45eea46425e2535d482cbceb34433a76.jpg', 11270, 'fdc13e786bdb588660f6a639ba955c49', 0, 0, 1, 0, 1, 1251, '2014-03-19 13:59:56', '2014-11-06 05:58:42'),
(480, 'android', '000.000.000', '003.006.099', 'middle', 2, '240-粉花蓝天-M', '', '', 'weicall/thumbnails/7d14241f1ce93b757acd5c9c3062b12d.jpg', '', 'weicall/archive/a40fa7e3961833276a728bd44116ca1a.jpg', 19122, '77a249ef4ed46ef197de7fb80be94f27', 0, 0, 1, 0, 1, 1251, '2014-03-19 14:12:39', '2014-11-06 05:58:42'),
(481, 'android', '000.000.000', '003.006.099', 'large', 2, '240-粉花蓝天-L', '', '', 'weicall/thumbnails/ee3730d7e52c1ae7c0ce8096e9bdd4b2.jpg', '', 'weicall/archive/48579a4044aab43c8ec0b44d73a18cce.jpg', 34151, 'f7edc4347fa6aedc44ebc076853b8337', 0, 0, 1, 0, 1, 1251, '2014-03-19 14:20:09', '2014-11-06 05:58:42'),
(482, 'ios', '000.000.000', '003.006.099', 'small', 2, '250-一杯彩色豆', '', '', 'weicall/thumbnails/ac641d7af22a4f41495086c5dc93a9d5.jpg', '', 'weicall/archive/8f0ff89d59d30385a621ef178f44fe7e.jpg', 43572, '21b956e06b51107a29fd196a327977ae', 0, 0, 1, 0, 1, 1261, '2014-03-11 15:35:05', '2014-11-06 05:58:42'),
(483, 'android', '000.000.000', '003.006.099', 'small', 2, '250-一杯彩色豆-S', '', '', 'weicall/thumbnails/57390fb9d258d5adf8b1d610faddad56.jpg', '', 'weicall/archive/0cd21e8e89087a5f111c4c1a18ccba2a.jpg', 17433, 'b6e0e33ff3a342f16b3692467ad1b456', 0, 0, 1, 0, 1, 1261, '2014-03-19 13:59:39', '2014-11-06 05:58:42'),
(484, 'android', '000.000.000', '003.006.099', 'middle', 2, '250-一杯彩色豆-M', '', '', 'weicall/thumbnails/a55b274e46d357f8427adac3dfb71544.jpg', '', 'weicall/archive/e268dee3beb00a03c1a4897cb290ac51.jpg', 39324, 'ca45c1d25ef509afdadbed73dff18bbc', 0, 0, 1, 0, 1, 1261, '2014-03-11 15:34:56', '2014-11-06 05:58:42'),
(485, 'android', '000.000.000', '003.006.099', 'large', 2, '250-一杯彩色豆-L', '', '', 'weicall/thumbnails/3af910d5720e5579e4f343c06296d054.jpg', '', 'weicall/archive/a59b6a13829564414ad33a82d38df577.jpg', 50534, '2f1298d6e2b81d7bb41423f4dd5fc1e3', 0, 0, 1, 0, 1, 1261, '2014-03-19 14:20:17', '2014-11-06 05:58:42'),
(486, 'android', '000.000.000', '003.006.099', 'middle', 2, '260-粉色杯子-M', '', '', 'weicall/thumbnails/2d565a78b2a2fa4be0528d81f8ebef12.jpg', '', 'weicall/archive/58f9d3b1508dada11d16209e4d594262.jpg', 14519, '322cf178e86a49fd0c01d29c3e06c278', 0, 0, 0, 0, 1, 1271, '2014-03-19 14:13:51', '2014-11-06 05:58:42'),
(487, 'ios', '000.000.000', '003.006.099', 'small', 2, '310-西瓜园小女孩', '', '', 'weicall/thumbnails/34c4942ec9d7e4dce8e28714dddc2145.jpg', '', 'weicall/archive/8f694c3a6d7730b55b4c15dc8467d5fc.jpg', 41174, '914c10c53426016936b78749e7195bdd', 0, 0, 0, 0, 1, 1321, '2014-03-11 10:50:07', '2014-11-06 05:58:42'),
(488, 'android', '000.000.000', '003.006.099', 'small', 2, '310-西瓜园小女孩-S', '', '', 'weicall/thumbnails/4197eacf3967e4b3f1d904b748e8433e.jpg', '', 'weicall/archive/ac25c00e419988dc94fb21ce761ed123.jpg', 18076, '8ca66b9269b7ac49328e87885ed023c7', 0, 0, 0, 0, 1, 1321, '2014-03-19 13:57:05', '2014-11-06 05:58:42'),
(489, 'android', '000.000.000', '003.006.099', 'middle', 2, '310-西瓜园小女孩-M', '', '', 'weicall/thumbnails/ad51e12bbf45c26b04a146b97551ef4c.jpg', '', 'weicall/archive/6e29a5f7c67586b1c7b6da1c003d2850.jpg', 25553, '4329ed986418e40bcc0fe3eb1cb189a2', 0, 0, 0, 0, 1, 1321, '2014-03-19 14:14:37', '2014-11-06 05:58:42'),
(490, 'android', '000.000.000', '003.006.099', 'large', 2, '310-西瓜园小女孩-L', '', '', 'weicall/thumbnails/5a4faac491eb2f2d89c16bde79f5d81b.jpg', '', 'weicall/archive/b97ec600f398736107b950a4f473d559.jpg', 67471, '974e548e3b8e2ca8f678e1ead1247c92', 0, 0, 0, 0, 1, 1321, '2014-03-19 14:21:27', '2014-11-06 05:58:42'),
(491, 'ios', '000.000.000', '003.006.099', 'small', 2, '300-小白猫漫画', '', '', 'weicall/thumbnails/3593047d06d83c1c3f6881438799c4cb.jpg', '', 'weicall/archive/2f80b0dfe433203e99fd033c61604290.jpg', 40675, '380e06cf6bbe5d4c9568f456ad071ff9', 0, 0, 0, 0, 1, 1311, '2014-03-11 10:52:33', '2014-11-06 05:58:42'),
(492, 'android', '000.000.000', '003.006.099', 'small', 2, '300-小白猫漫画-S', '', '', 'weicall/thumbnails/8325fae504ea3ca4d157d16b8f67cda5.jpg', '', 'weicall/archive/135e4102601d6314e682a6b478d5482e.jpg', 17365, '875b07da23e43bd8f9cd4f483e1c1c18', 0, 0, 0, 0, 1, 1311, '2014-03-19 13:57:15', '2014-11-06 05:58:42'),
(493, 'android', '000.000.000', '003.006.099', 'middle', 2, '300-小白猫漫画-M', '', '', 'weicall/thumbnails/f7f11fdf4c750e6614b636fc7fd5ce05.jpg', '', 'weicall/archive/a09e61b212652731f8899b84d06934c0.jpg', 20378, '462059c5b0dff939677ebb39cdd7e221', 0, 0, 0, 0, 1, 1311, '2014-03-19 14:14:25', '2014-11-06 05:58:42'),
(494, 'android', '000.000.000', '003.006.099', 'large', 2, '300-小白猫漫画-L', '', '', 'weicall/thumbnails/14169833e99df733508c2e54f7cdf292.jpg', '', 'weicall/archive/68cfe4067c5b4cca33e45aae54ec4aeb.jpg', 54461, 'c06755ce2fabd3e29599c81080e90f3e', 0, 0, 0, 0, 1, 1311, '2014-03-19 14:21:15', '2014-11-06 05:58:42'),
(495, 'ios', '000.000.000', '003.006.099', 'small', 2, '290-粉背心情侣', '', '', 'weicall/thumbnails/5de129268b30304aa9bba4094509b6de.jpg', '', 'weicall/archive/571e3a770ddb464081a44650ef2a63dd.jpg', 59946, '2838b7ba3823a357515bda8eceff4cc5', 0, 0, 0, 0, 1, 1301, '2014-03-11 10:55:05', '2014-11-06 05:58:42'),
(496, 'android', '000.000.000', '003.006.099', 'large', 2, '290-粉背心情侣-L', '', '', 'weicall/thumbnails/dd89bf837bbf20fc73dc92c671f623c6.jpg', '', 'weicall/archive/d880096b10c4d2ee6fb1705789c3fc8b.jpg', 83535, '032f517c74c29542d2e381602ba7a221', 0, 0, 0, 0, 1, 1301, '2014-03-19 14:21:08', '2014-11-06 05:58:42'),
(497, 'android', '000.000.000', '003.006.099', 'middle', 2, '290-粉背心情侣-M', '', '', 'weicall/thumbnails/10aee8774c4662aac1259be3a23332eb.jpg', '', 'weicall/archive/3d7d7df726f4628cd72737abfc274e9c.jpg', 31434, '1e4d9f51ee006074ec7a41d9c0e3e01d', 0, 0, 0, 0, 1, 1301, '2014-03-19 14:14:19', '2014-11-06 05:58:42'),
(498, 'android', '000.000.000', '003.006.099', 'small', 2, '290-粉背心情侣-S', '', '', 'weicall/thumbnails/f2b3761efc9a5450ef8599b492daa23c.jpg', '', 'weicall/archive/0cde90174593e16c79379fcaaa5f0b07.jpg', 21660, 'c3cbdf2a1cf7677ed6ff31e5e33bab33', 0, 0, 0, 0, 1, 1301, '2014-03-19 13:57:24', '2014-11-06 05:58:42'),
(499, 'ios', '000.000.000', '003.006.099', 'small', 2, '280-黄花蓝裙女孩', '', '', 'weicall/thumbnails/cd8cf3377a90b9ad53f7ed6f53873d79.jpg', '', 'weicall/archive/23d99546c42ae50765064d23f275b5b0.jpg', 54968, '562724565f88b22dc927155c811f8897', 0, 0, 0, 0, 1, 1291, '2014-03-11 10:56:52', '2014-11-06 05:58:42'),
(500, 'android', '000.000.000', '003.006.099', 'large', 2, '280-黄花蓝裙女孩-L', '', '', 'weicall/thumbnails/edd385f962d685e3f262d33fdae810df.jpg', '', 'weicall/archive/adebdb571132b24cdd1d51cbf0c985e8.jpg', 66902, '04c5875137322c06685ace5c01ddbf38', 0, 0, 0, 0, 1, 1291, '2014-03-19 14:21:02', '2014-11-06 05:58:42'),
(501, 'android', '000.000.000', '003.006.099', 'middle', 2, '280-黄花蓝裙女孩-M', '', '', 'weicall/thumbnails/be6da5631a746ab4a544fff03b5edcc0.jpg', '', 'weicall/archive/fe61c3692d0a39171cfada9a95bfae6a.jpg', 21398, 'a8daf97733d8cbb87389a3783f03bde7', 0, 0, 0, 0, 1, 1291, '2014-03-19 14:14:05', '2014-11-06 05:58:42'),
(502, 'android', '000.000.000', '003.006.099', 'small', 2, '280-黄花蓝裙女孩-S', '', '', 'weicall/thumbnails/bca181f06829a90703b80662de066250.jpg', '', 'weicall/archive/46499fce11748528865db4d0462edd4a.jpg', 19109, '626564d52dfcf11ff25b3fb642d30b8b', 0, 0, 0, 0, 1, 1291, '2014-03-19 13:57:33', '2014-11-06 05:58:42'),
(541, 'android', '000.000.000', '003.002.099', 'middle', 1, '魔法精灵', '', '', 'weicall/thumbnails/e3d0b3d2034828e5dd987640e9a2d08e.jpg', '', 'weicall/archive/9597077d36b816622bd3eeaaa62efc4e.zip', 281453, '9143b7c8d0ccd5c9aa775783b5770aaa', 0, 0, 0, 0, 1, 1022, '2014-04-15 11:05:40', '2014-08-05 07:30:08'),
(542, 'android', '003.003.000', '003.004.099', 'small', 1, '黑色简约', '', '', 'weicall/thumbnails/6dcb94065536b2493650e20f1a8b5606.jpg', '', 'weicall/archive/1ba6f6a7d43ebc3a2b94ec0260087cbf.zip', 186901, '74affd29fc6943a5be643840a77f01b1', 0, 0, 0, 0, 0, 1017, '2014-04-01 18:07:43', '2014-08-05 07:30:08'),
(546, 'all', '000.000.000', '099.099.099', '', 5, '卡农1', '', '', '', '', 'weicall/archive/4d266205ce43c63e858c14b5fcb2ecba.zip', 464, 'a924438423bce700eeebd5a5a66fb448', 0, 0, 1, 1, 0, 1011, '2014-04-15 21:25:45', '2014-08-05 07:30:08'),
(547, 'all', '000.000.000', '099.099.099', '', 5, '卡农', '', '', '', '', 'weicall/archive/dfa15e5df6c71ca8744cffcada44ae84.zip', 357, '5ca5e6dae7dd0e7aafac6472df497f2c', 0, 0, 1, 0, 1, 1, '2014-04-15 21:24:07', '2014-08-05 07:30:08'),
(548, 'android', '003.003.000', '003.004.099', 'large', 1, '黑色简约', '', '', 'weicall/thumbnails/7ac81e38cde93fc188e13aac7d04938b.jpg', '', 'weicall/archive/69d90152971b31227416eab11c1651a2.zip', 308122, '98e8b0f343693c2f09dd7e607a167cef', 0, 0, 0, 0, 1, 1017, '2014-04-16 14:15:07', '2014-08-05 07:30:08'),
(549, 'all', '000.000.000', '099.099.099', '', 5, '雨的印记', '', '', '', '', 'weicall/archive/02cb02873c2428e9bb69976f6f6632bb.zip', 436, 'a5f9888974f4304d850a510f1a15bde5', 0, 0, 1, 1, 1, 1, '2014-04-15 21:23:55', '2014-08-05 07:30:08'),
(552, 'ios', '003.003.000', '003.004.099', 'small', 1, '白色简约', '', '', 'weicall/thumbnails/4c76ac216cfc9415a263d27d23bb9811.jpg', '', 'weicall/archive/67126a8211370c1b7691fd439e2af997.zip', 451347, 'c2fa0f8e9f0fedb0d900d898ab95c6a9', 0, 0, 1, 0, 1, 1015, '2014-04-18 17:09:21', '2014-08-05 07:30:08'),
(554, 'ios', '000.000.000', '003.002.099', 'small', 1, '哆啦A梦', '', '', 'weicall/thumbnails/f6db0709173a122d8042226d4a998c2e.jpg', '', 'weicall/archive/609c489c07f2083ca353dc67843b5ba7.zip', 565044, '848f14f5373bd045f1981031ed467c8c', 0, 0, 0, 0, 1, 1021, '2014-04-21 09:45:22', '2014-08-05 07:30:08'),
(555, 'ios', '003.003.000', '003.004.099', 'small', 1, '黑色简约', '', '', 'weicall/thumbnails/35d6c7a598d517b13046f25cb484db81.jpg', '', 'weicall/archive/199cffa06c17ad4686a9eee3cdf40730.zip', 421226, 'ef2b081a45544b2b5c46703edcec9d74', 0, 0, 0, 0, 1, 1017, '2014-04-21 11:37:20', '2014-08-05 07:30:08'),
(556, 'all', '000.000.000', '003.002.099', '', 1, 'test', '', '', '', '', 'weicall/archive/94f7f11940b5b97d8ca6a3710a5f873b.jpg', 3895, 'c791234d40876855e121af5ba60b10ce', 0, 0, 0, 0, 0, 1011, '2014-04-21 15:06:42', '2014-08-05 07:30:08'),
(559, 'ios', '003.003.000', '003.004.099', 'small', 1, '炫蓝水晶', '', '', 'weicall/thumbnails/8a50bdd1c498c36f4809e9b77a5be600.jpg', '', 'weicall/archive/3a81b02e2d6d9f0b9809d96b122588be.zip', 831127, '550d1938e34d74e59eaf1dcbd867e7cf', 0, 0, 1, 0, 1, 1016, '2014-04-24 11:26:46', '2014-08-05 07:30:08'),
(560, 'ios', '000.000.000', '003.002.099', 'xlarge', 1, 'testxcz', 'ssdsd', '', '', '', 'weicall/archive/5cc8acc28466b36dbcbb539e47fde85c.jpg', 3895, 'c791234d40876855e121af5ba60b10ce', 0, 0, 0, 0, 0, 1011, '2014-04-30 11:00:21', '2014-08-05 07:30:08'),
(561, 'android', '003.003.000', '003.004.099', 'large', 1, '哆啦A梦', '', '', 'weicall/thumbnails/66850953d1009d797a2f7d7cf0aae8ca.jpg', '', 'weicall/archive/311a7ddb34befa61106437d0c8b58c8c.zip', 379446, '92d74ce1a2cf2fe7063dd1888f4a1347', 0, 0, 0, 0, 1, 1021, '2014-04-30 11:14:07', '2014-08-05 07:30:08'),
(563, 'ios', '003.003.000', '003.004.099', 'small', 1, '魔法精灵', '', '', 'weicall/thumbnails/20d956c200efb7088ddf08b624882732.jpg', '', 'weicall/archive/5d0dbf9c0a9fc08fa14bd3b070e94ad0.zip', 588356, 'a1206dd0fa255c1f8c150477f603e75a', 0, 0, 0, 0, 1, 1022, '2014-05-05 11:30:01', '2014-08-05 07:30:08'),
(564, 'android', '003.003.000', '003.004.099', 'middle', 1, '黑色简约', '', '', 'weicall/thumbnails/eac90400d0f2413ccdd861f7871b169c.jpg', '', 'weicall/archive/1c05a51cd93025e3971900451a119e7d.zip', 244033, '3b329a5b50e23bd65d6f57a1aa766d8f', 0, 0, 0, 0, 1, 1017, '2014-05-07 13:52:34', '2014-08-05 07:30:08'),
(565, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '黑色简约', '', '', 'weicall/thumbnails/0cd05b72704c92adfee4718123573ecd.jpg', '', 'weicall/archive/dbdb44468f6db7291e975bd027c8affd.zip', 392180, '439b2bce5a434704ca176cc0c705fa71', 0, 0, 0, 0, 1, 1017, '2014-05-07 13:54:44', '2014-08-05 07:30:08'),
(566, 'android', '003.003.000', '003.004.099', 'small', 1, '白色简约', '', '', 'weicall/thumbnails/24453b5cb097baab7c0b2264d348e16b.jpg', '', 'weicall/archive/f200d2ccba029097eb1bbf0380266e3c.zip', 133204, '042c51cbe77bfa34cd6b77dae9125323', 0, 0, 1, 0, 0, 1015, '2014-05-08 14:00:17', '2014-08-05 07:30:08'),
(567, 'android', '003.003.000', '003.004.099', 'middle', 1, '白色简约', '', '', 'weicall/thumbnails/7ed3f72b2c738763c33e9f29fad1f4e5.jpg', '', 'weicall/archive/20ba8f295bb4cce34b45dab3a69b62d0.rar', 226870, '31ba4d9e857dbdc4c1a43275c9581db8', 0, 0, 1, 0, 1, 1015, '2014-05-08 14:01:07', '2014-08-05 07:30:08'),
(568, 'android', '003.003.000', '003.004.099', 'large', 1, '白色简约', '', '', 'weicall/thumbnails/945a54983a07147f404cad76747a756a.jpg', '', 'weicall/archive/47486f2ea9e76248b12daa6e765e3fbd.zip', 392142, 'd804092fcce83d8af4a2c0b903dae7dd', 0, 0, 1, 0, 1, 1015, '2014-05-08 14:03:33', '2014-08-05 07:30:08'),
(569, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '白色简约', '', '', 'weicall/thumbnails/025abbde80dc94cd82e9e293cfe5e6a5.jpg', '', 'weicall/archive/ee8c50bdd3627d0e256014ea8f5080e6.zip', 589003, '318e35bc012795f0c99f17d89fef5023', 0, 0, 1, 0, 1, 1015, '2014-05-08 14:04:20', '2014-08-05 07:30:08'),
(571, 'android', '003.003.000', '003.004.099', 'middle', 1, '哆啦A梦', '', '', 'weicall/thumbnails/51c071f3270c65d8eb624329ad329561.jpg', '', 'weicall/archive/61bdbec2ded44fa260b458b79884c206.zip', 284564, '5e918253c2dc8d59b09c3ebb8546ef60', 0, 0, 0, 0, 1, 1021, '2014-05-08 14:20:56', '2014-08-05 07:30:08'),
(572, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '哆啦A梦', '', '', 'weicall/thumbnails/c667cfcdc5cd8758112525e7570c42ff.jpg', '', 'weicall/archive/e05b95475e64fdd946b48d38edac8597.zip', 493580, '571ca60e3c3b53e121eee6ef7a5c156a', 0, 0, 0, 0, 1, 1021, '2014-05-08 14:22:12', '2014-08-05 07:30:08'),
(573, 'android', '003.003.000', '003.004.099', 'large', 1, '粉红回忆', '', '', 'weicall/thumbnails/248f5ecd797f84e3ec61f2a53aa190ba.jpg', '', 'weicall/archive/d323117f232dd01e1032e3ef01bcae46.zip', 444320, '39540185865c3e87a128889d00fdfd7c', 0, 0, 0, 0, 1, 1027, '2014-05-08 14:28:44', '2014-08-05 07:30:08'),
(574, 'android', '003.003.000', '003.004.099', 'middle', 1, '粉红回忆', '', '', 'weicall/thumbnails/92b4440b1e4ecfe027ee3297967889b3.jpg', '', 'weicall/archive/f90ba0e8191061de103b385a7a7ef5f7.zip', 310218, '17ceb2edaf2e7e8c77e303ce7c1369d9', 0, 0, 0, 0, 1, 1027, '2014-05-08 14:29:20', '2014-08-05 07:30:08'),
(575, 'android', '003.003.000', '003.004.099', 'small', 1, '粉红回忆', '', '', 'weicall/thumbnails/7ed386095e2fc4dec13ccd0261d67e6b.jpg', '', 'weicall/archive/7b6d0180f2782a0171035ae69b6c06a0.zip', 201315, '33783e35a5be172693377da5a1248ac7', 0, 0, 0, 0, 0, 1027, '2014-05-08 14:29:51', '2014-08-05 07:30:08'),
(576, 'android', '003.003.000', '003.004.099', 'small', 1, '愤怒小鸟', '', '', 'weicall/thumbnails/0007adfbd19bd47e17a66e0c3c94da5a.jpg', '', 'weicall/archive/ab798a869f04d68fc5ad8557684b4b39.zip', 224869, '0fa607bdf07d903cb0e7fc7166335392', 0, 0, 0, 0, 0, 1025, '2014-05-08 14:49:05', '2014-08-05 07:30:08'),
(577, 'android', '003.003.000', '003.004.099', 'middle', 1, '愤怒小鸟', '', '', 'weicall/thumbnails/d3b78527dcdc7b67bd06a022f284c037.jpg', '', 'weicall/archive/0ba40f80a51544231792b0475ecc8261.zip', 334481, '5749436f80e08cc4410c13a6105dea25', 0, 0, 0, 0, 1, 1025, '2014-05-08 14:49:48', '2014-08-05 07:30:08'),
(578, 'android', '003.003.000', '003.004.099', 'large', 1, '愤怒小鸟', '', '', 'weicall/thumbnails/25f1b0fcd0a0e3d15e57e0a554f40bdc.jpg', '', 'weicall/archive/d69f3845e5b2f71217fb02cc7b73a81a.zip', 402113, '36311263bc9074698e5dfafe7765856d', 0, 0, 0, 0, 1, 1025, '2014-05-08 14:50:22', '2014-08-05 07:30:08'),
(579, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '愤怒小鸟', '', '', 'weicall/thumbnails/b8065888053ff8cab51f965e526b02c3.jpg', '', 'weicall/archive/79e5a3e58508eb01b384ff9793b9bcfb.zip', 520663, '559fd920fff11f0d9ad75f0e4f46cc7f', 0, 0, 0, 0, 1, 1025, '2014-05-08 14:50:54', '2014-08-05 07:30:08'),
(580, 'ios', '003.003.000', '003.004.099', 'small', 1, '缤纷圣诞', '', '', 'weicall/thumbnails/d0e3b52ddfde2470e5e590ee0d6360ad.jpg', '', 'weicall/archive/67f1b220e308551ba1d5011e56fc0ca6.zip', 604599, '2dd55cfdb5c63aacbdce7cd95e808e2f', 0, 0, 0, 0, 1, 1019, '2014-05-09 11:15:05', '2014-08-05 07:30:08'),
(581, 'ios', '003.003.000', '003.004.099', 'small', 1, '哆啦A梦', '', '', 'weicall/thumbnails/a9eb34b1f0df5c1443121db7b3013fd8.jpg', '', 'weicall/archive/b5fa5d1cfedb93de95e249046feb1790.zip', 683635, '37b96fee2943ccc3fcc4f47764b63c0e', 0, 0, 0, 0, 1, 1021, '2014-05-09 11:16:29', '2014-08-05 07:30:08'),
(582, 'ios', '003.003.000', '003.004.099', 'small', 1, '粉红回忆', '', '', 'weicall/thumbnails/1a0b0eafab7b575a5a92529ed783671d.jpg', '', 'weicall/archive/973d644104db7c55cdc8dc1c07c86a21.zip', 716724, '6613ad417bd2e837dad772d4229c7f94', 0, 0, 0, 0, 1, 1027, '2014-05-09 11:17:45', '2014-08-05 07:30:08'),
(583, 'ios', '003.003.000', '003.004.099', 'small', 1, '活力水果', '', '', 'weicall/thumbnails/9540d9a9e87e61b820fa6ffef79f234f.jpg', '', 'weicall/archive/d36cf1cef4052aa9090df8345333464e.zip', 609244, 'f82db8b43a1f2b7d56da5c31daa487d4', 0, 0, 0, 0, 1, 1023, '2014-05-09 11:22:35', '2014-08-05 07:30:08'),
(584, 'ios', '003.003.000', '003.004.099', 'small', 1, '蓝色经典', '', '', 'weicall/thumbnails/5f3002d97c8c92cae7ec3c3989ac03b1.jpg', '', 'weicall/archive/bcc815e4ab4211e7cd161597905d8416.zip', 817579, '7536c68d17f64b6842d1895a87e0488e', 0, 0, 0, 0, 1, 1029, '2014-05-09 11:23:56', '2014-08-05 07:30:08'),
(585, 'ios', '003.003.000', '003.004.099', 'small', 1, '绿意盎然', '', '', 'weicall/thumbnails/6096caa170dc4bad84fcf645e2bb94b0.jpg', '', 'weicall/archive/eaa4adc012ed5acb20ddedd4203630ad.zip', 590868, '75db25db38b9fd002ee2b614ad28925b', 0, 0, 0, 0, 1, 1028, '2014-05-09 11:25:05', '2014-08-05 07:30:08'),
(586, 'ios', '003.003.000', '003.004.099', 'small', 1, '牧场物语', '', '', 'weicall/thumbnails/3ca07393ecf8e8064c56d6fc1e9761fc.jpg', '', 'weicall/archive/b3d0636af69239f0f603c0738350fdd9.zip', 679755, 'e3cfd97454b34433a4cf92146579398c', 0, 0, 0, 0, 1, 1024, '2014-05-09 11:29:39', '2014-08-05 07:30:08'),
(587, 'ios', '003.003.000', '003.004.099', 'small', 1, '热血篮球', '', '', 'weicall/thumbnails/8fbbe7b738419cff826aa5a13d4736b3.jpg', '', 'weicall/archive/18ab727e73f6dc9454f3614d3cfd01cb.zip', 711862, '1d29e72fa810bc84ed4f5d27598b9499', 0, 0, 0, 0, 1, 1018, '2014-05-09 11:31:39', '2014-08-05 07:30:08'),
(588, 'ios', '003.003.000', '003.004.099', 'small', 1, '自然原木', '', '', 'weicall/thumbnails/a9281ed1602930877457966176c75463.jpg', '', 'weicall/archive/fcfb6802457619e9846acdb799d149d0.zip', 1549705, '4639c8c4e9a3a0b29e7c6aa0852d027c', 0, 0, 0, 0, 1, 1026, '2014-05-09 11:32:38', '2014-08-05 07:30:08'),
(589, 'android', '003.003.000', '003.004.099', 'small', 1, '缤纷圣诞', '', '', 'weicall/thumbnails/1971dce1bd4e5e64603a0088cc1a73a6.jpg', '', 'weicall/archive/ab3201cbe7749bc8347af307eb39c485.zip', 170975, '2e147677d7ba710a8d8a75b5b41d348d', 0, 0, 0, 0, 0, 1019, '2014-05-09 15:41:35', '2014-08-05 07:30:08'),
(590, 'android', '003.003.000', '003.004.099', 'middle', 1, '缤纷圣诞', '', '', 'weicall/thumbnails/580ea4a503c683927288c959c14e9f6d.jpg', '', 'weicall/archive/be84b8526a0d608595a7e887cd6f34c8.zip', 460001, '110aa316e00a9516b7e075f9428bf92b', 0, 0, 0, 0, 1, 1019, '2014-05-09 15:42:12', '2014-08-05 07:30:08'),
(591, 'android', '003.003.000', '003.004.099', 'large', 1, '缤纷圣诞', '', '', 'weicall/thumbnails/5adbc2a49ee79ab3f3b9e97dac94864a.jpg', '', 'weicall/archive/960d79b1d9abd74a35a9b6fec9a63e67.zip', 331288, 'd7e73424926428312a48699d7c376bcd', 0, 0, 0, 0, 1, 1019, '2014-05-09 15:42:47', '2014-08-05 07:30:08'),
(592, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '缤纷圣诞', '', '', 'weicall/thumbnails/e3c515141331781378e0a9aff9cc31d7.jpg', '', 'weicall/archive/302e311780d2cc78dcba5f06c5a7bb57.zip', 439737, '892dddbb1be26eadedb622134933561b', 0, 0, 0, 0, 1, 1019, '2014-05-09 15:43:23', '2014-08-05 07:30:08'),
(593, 'android', '003.003.000', '003.004.099', 'small', 1, '活力水果', '', '', 'weicall/thumbnails/5c5b4bc7cb37792f679ec78b784366c4.jpg', '', 'weicall/archive/d1412d31aeb92438be3628207b38b25a.zip', 181481, 'b1e0e3d659fb8f7ae5727e306a3234d0', 0, 0, 0, 0, 0, 1023, '2014-05-09 15:51:05', '2014-08-05 07:30:08'),
(594, 'android', '003.003.000', '003.004.099', 'middle', 1, '活力水果', '', '', 'weicall/thumbnails/aa28907ea001be6b307c5da540ac21cc.jpg', '', 'weicall/archive/3cba6e27b6aa4d5bf545b2880b6c4ec6.zip', 258058, 'dcb298e9c28795e8261c2246c8d3fa8a', 0, 0, 0, 0, 1, 1023, '2014-05-09 15:51:47', '2014-08-05 07:30:08'),
(595, 'android', '003.003.000', '003.004.099', 'large', 1, '活力水果', '', '', 'weicall/thumbnails/f9cd97830dc857d1e0cfc756a1caebc5.jpg', '', 'weicall/archive/ccd6bd4233991ab0b3dfd4cb71a91199.zip', 351732, '97ad392745b570a033e940d7c6eca1cc', 0, 0, 0, 0, 1, 1023, '2014-05-09 15:52:35', '2014-08-05 07:30:08'),
(596, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '活力水果', '', '', 'weicall/thumbnails/4674d8d06ce628ef594448e06d12d158.jpg', '', 'weicall/archive/dba29167c93cd62415bf53d65045a8a5.zip', 478788, '1acaa337e9905df956ed1b6b6aa46ce5', 0, 0, 0, 0, 1, 1023, '2014-05-09 15:53:13', '2014-08-05 07:30:08'),
(597, 'android', '003.003.000', '003.004.099', 'small', 1, '蓝色经典', '', '', 'weicall/thumbnails/e188dcd38cfff32c2b4414dfd0064324.jpg', '', 'weicall/archive/95c432505c4d432b92a78239ddb4c4a6.zip', 178702, 'f9f7a88f6c10a2305f2151bfa798c29a', 0, 0, 0, 0, 0, 1029, '2014-05-09 15:57:58', '2014-08-05 07:30:08'),
(598, 'android', '003.003.000', '003.004.099', 'middle', 1, '蓝色经典', '', '', 'weicall/thumbnails/62f8a6be1acdbb526cf8884ebaef6a39.jpg', '', 'weicall/archive/35e83a9e8924b9db865fee7c8b931248.zip', 252499, 'be7acf06b9b1c044969a692dca009fc4', 0, 0, 0, 0, 1, 1029, '2014-05-09 15:58:32', '2014-08-05 07:30:08'),
(599, 'android', '003.003.000', '003.004.099', 'large', 1, '蓝色经典', '', '', 'weicall/thumbnails/c8aebce8ad4e2b05195c52c5fe7bbdf9.jpg', '', 'weicall/archive/c62e8282c999b24d014f2cda7c2c5091.zip', 365567, '856de0e3978a35cb318fbd5eb085bd90', 0, 0, 0, 0, 1, 1029, '2014-05-09 15:59:01', '2014-08-05 07:30:08'),
(600, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '蓝色经典', '', '', 'weicall/thumbnails/26da4d4e3ded1aa302b16fd1f0db1dcc.jpg', '', 'weicall/archive/7916bd78cc681e29d1a1ab2f25e86bab.zip', 472711, 'c2e565390ca54f65a8f17b4140a6ec87', 0, 0, 0, 0, 1, 1029, '2014-05-09 15:59:48', '2014-08-05 07:30:08'),
(601, 'android', '003.003.000', '003.004.099', 'small', 1, '绿意盎然', '', '', 'weicall/thumbnails/59f65a0f3a08ced28400e4c2b471bd7a.jpg', '', 'weicall/archive/af94dca5a198771df5f774ce1c0af556.zip', 165781, '550261e750eda0cad4c274a6ae6758cb', 0, 0, 0, 0, 0, 1028, '2014-05-09 16:04:41', '2014-08-05 07:30:08'),
(602, 'android', '003.003.000', '003.004.099', 'middle', 1, '绿意盎然', '', '', 'weicall/thumbnails/b49465119f7813982c40be6d4cacbbdd.jpg', '', 'weicall/archive/a066902a955d973f93e1efe4fdf13d11.zip', 227998, 'febf291c55d6fbe727cd2a86c309df5b', 0, 0, 0, 0, 1, 1028, '2014-05-09 16:05:18', '2014-08-05 07:30:08'),
(603, 'android', '003.003.000', '003.004.099', 'large', 1, '绿意盎然', '', '', 'weicall/thumbnails/836a5fa17615550dac70203207beaeb9.jpg', '', 'weicall/archive/574eed93f99538ee3272303137dbf000.zip', 319499, '287f4d228f7fa1bc21db1be035807c99', 0, 0, 0, 0, 1, 1028, '2014-05-09 16:05:47', '2014-08-05 07:30:08'),
(604, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '绿意盎然', '', '', 'weicall/thumbnails/f85a3b6a067462a8d66952cc8732a826.jpg', '', 'weicall/archive/30d937e4dc08adfba9e3d9bd8beac3ed.zip', 411434, 'a73be9905386c29c3c1fc84fb500f4b7', 0, 0, 0, 0, 1, 1028, '2014-05-09 16:06:19', '2014-08-05 07:30:08'),
(605, 'android', '003.003.000', '003.004.099', 'small', 1, '魔法精灵', '', '', 'weicall/thumbnails/ddd31ffea6d175842102776203eaa194.jpg', '', 'weicall/archive/90a6be2d471561923e67a9ff54584b5f.zip', 231495, '7c0adfd304afb11fe45e0ca240736bfe', 0, 0, 0, 0, 0, 1022, '2014-05-09 16:10:31', '2014-08-05 07:30:08'),
(606, 'android', '003.003.000', '003.004.099', 'middle', 1, '魔法精灵', '', '', 'weicall/thumbnails/76e9541a22dcb71aa755ddeb2cb78058.jpg', '', 'weicall/archive/b25ff664705c20709cc6b0516a990254.zip', 355739, 'dcea60dc2cd4679dcc31b79100c6dcba', 0, 0, 0, 0, 1, 1022, '2014-05-09 16:11:04', '2014-08-05 07:30:08'),
(607, 'android', '003.003.000', '003.004.099', 'large', 1, '魔法精灵', '', '', 'weicall/thumbnails/9ee42745cb49fa20c480faec3902ec16.jpg', '', 'weicall/archive/0ca2e6d582fdadb8cb064fb8a4b1bda6.zip', 477996, 'b2b73fa026ecc32468252413a05032bc', 0, 0, 0, 0, 1, 1022, '2014-05-09 16:11:36', '2014-08-05 07:30:08'),
(608, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '魔法精灵', '', '', 'weicall/thumbnails/6a289b23d9fc9e8a32e5edee6d11e8d0.jpg', '', 'weicall/archive/287bac614dfc381bf71ad7ad65d042d6.zip', 645745, '1ef155333f76e8e9d43d17b7020d625f', 0, 0, 0, 0, 1, 1022, '2014-05-09 16:12:13', '2014-08-05 07:30:08'),
(609, 'android', '003.003.000', '003.004.099', 'small', 1, '牧场物语', '', '', 'weicall/thumbnails/292077f51b22d099253207bb13b12317.jpg', '', 'weicall/archive/3951325a13e227d1a8053d91ef552695.zip', 249590, '514dc2caacfd325a64a25869d10e2fe7', 0, 0, 0, 0, 0, 1024, '2014-05-09 16:33:39', '2014-08-05 07:30:08'),
(610, 'android', '003.003.000', '003.004.099', 'middle', 1, '牧场物语', '', '', 'weicall/thumbnails/890d74748671394941cbea90bc08a3eb.jpg', '', 'weicall/archive/547b1e84d6266dc249af02d3af067f3f.zip', 339496, '70a12b4096d65a2ecb4bfc8df045b766', 0, 0, 0, 0, 1, 1024, '2014-05-09 16:34:20', '2014-08-05 07:30:08'),
(611, 'android', '003.003.000', '003.004.099', 'large', 1, '牧场物语', '', '', 'weicall/thumbnails/167be46ead6166b945366e6b997bea65.jpg', '', 'weicall/archive/48bc9658815648af6fa0935cb25dd9fd.zip', 488253, '2d9b38df00040b27a6b079505330fde5', 0, 0, 0, 0, 1, 1024, '2014-05-09 16:34:50', '2014-08-05 07:30:08'),
(612, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '牧场物语', '', '', 'weicall/thumbnails/6c9511f7971c9db949c3392dab0b0842.jpg', '', 'weicall/archive/176f615ffced3a73ee5dc0693b09c1f4.zip', 641781, 'a456a7342f63920d3d63f1b90521361b', 0, 0, 0, 0, 1, 1024, '2014-05-09 16:35:24', '2014-08-05 07:30:08'),
(613, 'android', '003.003.000', '003.004.099', 'small', 1, '热血篮球', '', '', 'weicall/thumbnails/3c8713c993468931177b59ca1f662c75.jpg', '', 'weicall/archive/186d4a517e7f307faa49b1279320dbf0.zip', 187212, '070f659e4dd24fa3a2da715447d55151', 0, 0, 0, 0, 0, 1018, '2014-05-09 16:39:32', '2014-08-05 07:30:08'),
(614, 'android', '003.003.000', '003.004.099', 'middle', 1, '热血篮球', '', '', 'weicall/thumbnails/7f9929256ab393a8dc03b9f1f2cc1eef.jpg', '', 'weicall/archive/dfee36cb18c25b971e4af1880db40674.zip', 268853, '8cec2c64426f57c4423d7e95e902b105', 0, 0, 0, 0, 1, 1018, '2014-05-09 16:40:02', '2014-08-05 07:30:08'),
(615, 'android', '003.003.000', '003.004.099', 'large', 1, '热血篮球', '', '', 'weicall/thumbnails/d037d58372ba5e5c32f40da11236d272.jpg', '', 'weicall/archive/49fe2387a9b92fc0c943b9ce9ba43a0e.zip', 415860, '328706cc1f32efa18ad52fad0c8a26a9', 0, 0, 0, 0, 1, 1018, '2014-05-09 16:40:45', '2014-08-05 07:30:08'),
(616, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '热血篮球', '', '', 'weicall/thumbnails/b0b096b8d63a7d79e1c651bedaf6fe38.jpg', '', 'weicall/archive/1f9ff088ddeaa359ed5d7565b1a2a0ea.zip', 512569, 'cc9a8403ed4543b74f45cf5573bb9d69', 0, 0, 0, 0, 1, 1018, '2014-05-09 16:41:26', '2014-08-05 07:30:08'),
(617, 'android', '003.003.000', '003.004.099', 'small', 1, '自然原木', '', '', 'weicall/thumbnails/3d966239ea9a984a566d761ed28d4252.jpg', '', 'weicall/archive/2f3906c3640ad54f171f822ada84e4de.zip', 253183, '8ca5d4c7459914d1d196bfc89b1562a5', 0, 0, 0, 0, 0, 1026, '2014-05-09 16:46:06', '2014-08-05 07:30:08'),
(618, 'android', '003.003.000', '003.004.099', 'middle', 1, '自然原木', '', '', 'weicall/thumbnails/da7a8713c7d192187ec898db654ee6d3.jpg', '', 'weicall/archive/5388565a8f4219bdf648271b7ea9bc80.zip', 427676, '60aacc95efacebdf5d2db331ddf71f69', 0, 0, 0, 0, 1, 1026, '2014-05-09 16:46:38', '2014-08-05 07:30:08'),
(619, 'android', '003.003.000', '003.004.099', 'large', 1, '自然原木', '', '', 'weicall/thumbnails/79702873536c7c8c73be1677d7e3340a.jpg', '', 'weicall/archive/1c0c591788c4668c5787addc7a709821.zip', 670818, '1229f066a15cb4962e38404437e048aa', 0, 0, 0, 0, 1, 1026, '2014-05-09 16:47:10', '2014-08-05 07:30:08'),
(620, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '自然原木', '', '', 'weicall/thumbnails/1df5a605ee41356ec507210b6cd6272c.jpg', '', 'weicall/archive/bb7360758a90c4913a649afb92b933b1.zip', 1172545, '10dfb4f30ec40772db43350a335767ee', 0, 0, 0, 0, 1, 1026, '2014-05-09 16:47:43', '2014-08-05 07:30:08'),
(621, 'android', '003.003.000', '003.004.099', 'small', 1, '炫蓝水晶', '', '', 'weicall/thumbnails/e98f4ee192a12543787af549489892a5.jpg', '', 'weicall/archive/1d4a5e44976b0cc040e5d01d0de1e917.zip', 178820, '811c731a21a3ccc3506f268455730355', 0, 0, 1, 0, 0, 1016, '2014-05-10 17:52:09', '2014-08-05 07:30:08'),
(622, 'android', '003.003.000', '003.004.099', 'middle', 1, '炫蓝水晶', '', '', 'weicall/thumbnails/d6c663774a90200b7c2497a5fc9a1896.jpg', '', 'weicall/archive/7d40a411ca3709ba455b4b421b4a0be8.zip', 264529, '6e6c563c47959240464dddbcb448180f', 0, 0, 1, 0, 1, 1016, '2014-05-10 17:52:42', '2014-08-05 07:30:08'),
(623, 'android', '003.003.000', '003.004.099', 'large', 1, '炫蓝水晶', '', '', 'weicall/thumbnails/1e11a6ad5c9f8d71458b05165b7d754d.jpg', '', 'weicall/archive/d98ea8802645923a71f620d01128ddcc.zip', 389014, '51b63f190085c48c77d829f0b62a7825', 0, 0, 1, 0, 1, 1016, '2014-05-10 17:53:20', '2014-08-05 07:30:08'),
(624, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '炫蓝水晶', '', '', 'weicall/thumbnails/310b3c2540c27ac640d839d46adcf862.jpg', '', 'weicall/archive/a09fb40b1315bc2c4c1c74a52e04d77a.zip', 561394, '35d5852f7b697ac6d83586cfc851dead', 0, 0, 1, 0, 1, 1016, '2014-05-10 17:53:52', '2014-08-05 07:30:08'),
(626, 'all', '003.003.000', '099.099.099', '', 5, '蓝色的爱', '', '', '', '', 'weicall/archive/690f92a47f44a48234f28c45d43d0421.zip', 248, 'f0d48f1c7b7530d814f6c5f6dd5de8ba', 0, 0, 1, 0, 0, 1011, '2014-05-19 17:25:08', '2014-08-05 07:30:08'),
(627, 'all', '000.000.000', '099.099.099', '', 5, '莫斯科郊外的晚上', '', '', '', '', 'weicall/archive/9864b14614fe7f6bf37dd3a469921bf5.zip', 225, 'e76e1269ec9a43536c97e412aef44ac1', 0, 0, 1, 0, 1, 1, '2014-05-19 20:19:29', '2014-08-05 07:30:08'),
(628, 'android', '003.003.000', '003.004.099', 'small', 1, '哆啦A梦', '', '', 'weicall/thumbnails/314d7fdedf8426a481bda8c17347c561.jpg', '', 'weicall/archive/816484a579cd27e75c2db48d08fe6e9a.zip', 197170, 'c964651a3fdfc274fa987fd67f9cd77d', 0, 0, 0, 0, 0, 1021, '2014-05-20 15:53:43', '2014-08-05 07:30:08'),
(630, 'android', '003.003.000', '003.004.099', 'xlarge', 1, '粉红回忆', '', '', 'weicall/thumbnails/5bd7b2d274009c0694ef2d4b1fbda0ec.jpg', '', 'weicall/archive/b169a7c7abd087a9b267ccbaac29e8c6.zip', 624906, '21ee052b49920e5358c923376b73794f', 0, 0, 0, 0, 1, 1027, '2014-05-22 21:54:16', '2014-08-05 07:30:08'),
(635, 'ios', '003.005.000', '003.006.099', 'small', 1, '炫蓝水晶', '', '', 'weicall/thumbnails/b8be08e2110d90ffdf7219c11f88bea9.jpg', '', 'weicall/archive/22de014d840a4242568b7e80dbb54082.zip', 955107, '3e19ba6536106bd867d44ec5b78d74cd', 0, 0, 1, 0, 1, 1016, '2014-06-05 20:14:12', '2014-11-06 05:58:42'),
(636, 'ios', '003.005.000', '003.006.099', 'small', 1, '黑色简约', '', '', 'weicall/thumbnails/1ead85c86ecfdc1ff5b3762453ed85fd.jpg', '', 'weicall/archive/bc3c73e12798b35af610d899db0d7218.zip', 617719, 'cfd38efa471f5356b05189a37dcaa2f9', 0, 0, 0, 0, 1, 1017, '2014-06-07 09:51:07', '2014-11-06 05:58:42'),
(637, 'ios', '003.005.000', '003.006.099', 'small', 1, '缤纷圣诞', '', '', 'weicall/thumbnails/e2d154689403dfd3a63c933ea3698da3.jpg', '', 'weicall/archive/2b5762f79448d64fe07780bef42ebdb2.zip', 765550, '9d61f70b39aff01560e68f0d9d2d9aff', 0, 0, 0, 0, 1, 1019, '2014-06-07 10:02:59', '2014-11-06 05:58:42');
INSERT INTO `tbl_resource_list` (`id`, `platform`, `version_min`, `version_max`, `mapping`, `category_id`, `name`, `discription`, `author`, `thumb`, `preview`, `download_url`, `filesize`, `file_md5`, `price`, `hits`, `is_new`, `is_check`, `status`, `weight`, `create_datetime`, `modified_datetime`) VALUES
(638, 'ios', '003.005.000', '003.006.099', 'small', 1, '哆啦A梦', '', '', 'weicall/thumbnails/3ef904b88acb8996adf49c35d5500741.jpg', '', 'weicall/archive/3b502787189d6f57955946a91ce0790b.zip', 855936, 'c49382a9964f3e1fce4be32f5b089481', 0, 0, 0, 1, 1, 1021, '2014-06-09 10:24:51', '2014-11-06 05:58:42'),
(639, 'ios', '003.005.000', '003.006.099', 'small', 1, '粉红回忆', '', '', 'weicall/thumbnails/bb07627bae8dcdd2a0575f42f9cae427.jpg', '', 'weicall/archive/d5dcd9dccaa82e4b08db7b92ba72d944.zip', 850522, 'c24522046ef1b9984c2ae4d827200dea', 0, 0, 0, 0, 1, 1027, '2014-06-09 10:25:26', '2014-11-06 05:58:42'),
(640, 'ios', '003.005.000', '003.006.099', 'small', 1, '愤怒小鸟', '', '', 'weicall/thumbnails/faa7370a5dcc711a433a2f80937083ed.jpg', '', 'weicall/archive/4cbc1ab6839f6761325262d6b2ed2bea.zip', 982588, '3bc2dbc35ed7e8ea82ccc7ee80cf5458', 0, 0, 0, 1, 1, 1025, '2014-06-09 10:26:00', '2014-11-06 05:58:42'),
(641, 'ios', '003.005.000', '003.006.099', 'small', 1, '活力水果', '', '', 'weicall/thumbnails/ecc0356df28b9dac21a38a0acbd80e62.jpg', '', 'weicall/archive/3d634fc28a175f85ece74afd4eb8a763.zip', 671175, 'ef900b3a97f46b11e0542d6f7c835db1', 0, 0, 0, 0, 1, 1023, '2014-06-09 10:27:21', '2014-11-06 05:58:42'),
(642, 'ios', '003.005.000', '003.006.099', 'small', 1, '蓝色经典', '', '', 'weicall/thumbnails/8409111f616eaea3a4727c0a6e8eb4d8.jpg', '', 'weicall/archive/f9815cb18912c16b885bfc7412ff7193.zip', 1019827, '17888f69fffc8922ad034fee5d17ddea', 0, 0, 0, 0, 1, 1029, '2014-06-09 10:27:52', '2014-11-06 05:58:42'),
(643, 'ios', '003.005.000', '003.006.099', 'small', 1, '绿意盎然', '', '', 'weicall/thumbnails/789254350a81638a0ee2b0c069f710cc.jpg', '', 'weicall/archive/1e01c8b1fe5d6aa55a2fcdcfe41b8409.zip', 772031, '83deddfa71181cf0c30cf2b6c397a121', 0, 0, 0, 0, 1, 1028, '2014-06-09 10:28:23', '2014-11-06 05:58:42'),
(644, 'ios', '003.005.000', '003.006.099', 'small', 1, '魔法精灵', '', '', 'weicall/thumbnails/e3563ab308322552748df3e40d435bf3.jpg', '', 'weicall/archive/d2819921b825f9343d8b24ca773be9ae.zip', 801301, 'a4e8d20aa92d41305f215ed3b29c4c5e', 0, 0, 0, 0, 1, 1022, '2014-06-09 10:28:54', '2014-11-06 05:58:42'),
(645, 'ios', '003.005.000', '003.006.099', 'small', 1, '牧场物语', '', '', 'weicall/thumbnails/f55cee524ce5fa2d6b9348eb22b0a89d.jpg', '', 'weicall/archive/b5962ff343f2ae3e5238bd9d683b9359.zip', 905936, '2e2a7080739c10309dc30f3779bd2b95', 0, 0, 0, 0, 1, 1024, '2014-06-09 10:29:24', '2014-11-06 05:58:42'),
(646, 'ios', '003.005.000', '003.006.099', 'small', 1, '热血篮球', '', '', 'weicall/thumbnails/0c13d1d1d18f210949d0c8add9bf6277.jpg', '', 'weicall/archive/5dddc264528af23007ee9a0da7df621e.zip', 872131, '434e20511089bd8e5d8088f447636524', 0, 0, 0, 0, 1, 1018, '2014-06-09 10:29:54', '2014-11-06 05:58:42'),
(647, 'ios', '003.005.000', '003.006.099', 'small', 1, '自然原木', '', '', 'weicall/thumbnails/c7cbcb463933dcd43a5f0a65a0202517.jpg', '', 'weicall/archive/2cfd3ba07d490c5b328df08c68dce535.zip', 1734156, '652585aa4565dd17528247c40cc9c174', 0, 0, 0, 0, 1, 1026, '2014-06-09 10:30:26', '2014-11-06 05:58:42'),
(648, 'ios', '003.005.000', '003.006.099', 'small', 1, '白色简约', '', '', 'weicall/thumbnails/33af79091139e970759030bc5ffc5f22.jpg', '', 'weicall/archive/d3c304aba2445f8693d33dfcb4971e14.zip', 343530, '7e4fb7da1b69926d89aac45486048ded', 0, 0, 1, 0, 1, 1015, '2014-06-09 10:31:16', '2014-11-06 05:58:42'),
(650, 'android', '003.005.000', '003.006.099', 'middle', 1, '缤纷圣诞', '', '', 'weicall/thumbnails/07fe156ea7160119d386c6c907d394a3.jpg', '', 'weicall/archive/2d3e53fb5ead0bc1941746427a866738.zip', 599239, '950c787e494edf60075ec5f87430a84b', 0, 0, 0, 0, 1, 1019, '2014-06-25 20:00:52', '2014-11-06 05:58:42'),
(651, 'android', '003.005.000', '003.006.099', 'large', 1, '缤纷圣诞', '', '', 'weicall/thumbnails/411d7819e194d9f2442a7ce937c11826.jpg', '', 'weicall/archive/7cb72fa54177f0feedf0462dc7678fe0.zip', 528965, '7dfe4db388cd3f612f54651cf9b16ad1', 0, 0, 0, 0, 1, 1019, '2014-06-25 20:02:31', '2014-11-06 05:58:42'),
(652, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '缤纷圣诞', '', '', 'weicall/thumbnails/74962a6f1325cfdf1e5964cb9655bcf3.jpg', '', 'weicall/archive/c89615af9635394b19d6c493d8d9a9d5.zip', 716579, '4fb31413cfd19b0292d08dc5f1a5955a', 0, 0, 0, 0, 1, 1019, '2014-06-25 20:02:58', '2014-11-06 05:58:42'),
(653, 'android', '003.005.000', '003.006.099', 'middle', 1, '白色简约', '', '', 'weicall/thumbnails/6b81c3dcfd264484bf844e1b91924d89.jpg', '', 'weicall/archive/b5f43ba069e15c1560787d8e8ae773e2.zip', 202140, 'b0b9cb3374b133726b59210543a3d854', 0, 0, 1, 0, 1, 1015, '2014-06-26 11:02:15', '2014-11-06 05:58:42'),
(654, 'android', '003.005.000', '003.006.099', 'large', 1, '白色简约', '', '', 'weicall/thumbnails/1c1ef94d99d8b0168cdb7338c744d306.jpg', '', 'weicall/archive/d9a31f56e6e66f9074d7a99655bd522d.zip', 271343, 'cf556b8e727d77710e6733bc528351ef', 0, 0, 1, 0, 1, 1015, '2014-06-26 11:02:47', '2014-11-06 05:58:42'),
(655, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '白色简约', '', '', 'weicall/thumbnails/f0874316e653e6734a52c6fabb9ec531.jpg', '', 'weicall/archive/14d3f2ec33d42041fa822e5dd49fd7c3.zip', 380653, '55c4b19a768a1e7a7901a3f43c90f6a1', 0, 0, 1, 0, 1, 1015, '2014-06-26 11:03:15', '2014-11-06 05:58:42'),
(656, 'android', '003.005.000', '003.006.099', 'middle', 1, '哆啦A梦', '', '', 'weicall/thumbnails/0d52e3d32ad78f9f7ca393718891c9f5.jpg', '', 'weicall/archive/4b38e6ddeab8aba13250b529119735aa.zip', 419143, '71fc6200aca0895faae76666eff9e7dc', 0, 0, 0, 0, 1, 1021, '2014-06-26 11:12:41', '2014-11-06 05:58:42'),
(657, 'android', '003.005.000', '003.006.099', 'large', 1, '哆啦A梦', '', '', 'weicall/thumbnails/cdb5125ec5ebe5c14b968f7341dbe37e.jpg', '', 'weicall/archive/8bb0e73f3f0ea46a6de0825516322119.zip', 567248, '08e0bc23a6ee2b63f2f6d6955f4585e1', 0, 0, 0, 0, 1, 1021, '2014-06-26 11:13:09', '2014-11-06 05:58:42'),
(658, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '哆啦A梦', '', '', 'weicall/thumbnails/88aa6ce8cda091485f4ab8da9bd92fc4.jpg', '', 'weicall/archive/ddc6a7b4e7d7c5593b2606ceab66237b.zip', 774848, 'fb7984166d2907bb91111eb27fb17062', 0, 0, 0, 0, 1, 1021, '2014-06-26 11:13:35', '2014-11-06 05:58:42'),
(659, 'android', '003.005.000', '003.006.099', 'middle', 1, '粉红回忆', '', '', 'weicall/thumbnails/0938c19283ce94b79e7a8595d07eb6a2.jpg', '', 'weicall/archive/d944a8237a1d6d7a460f33fa5a8915e6.zip', 453645, 'd170aa62112de5991df9c8f35ef5d2f0', 0, 0, 0, 0, 1, 1027, '2014-06-26 11:14:34', '2014-11-06 05:58:42'),
(660, 'android', '003.005.000', '003.006.099', 'large', 1, '粉红回忆', '', '', 'weicall/thumbnails/0011a65f647b421ed1e050683186d05c.jpg', '', 'weicall/archive/b1a0231aae93775973d2ceb83adf6de7.zip', 664064, '7e3e662b49718064738a911b0d48719a', 0, 0, 0, 0, 1, 1027, '2014-06-26 11:15:03', '2014-11-06 05:58:42'),
(661, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '粉红回忆', '', '', 'weicall/thumbnails/9368ff9ed2b8c2487902b1a3501bf2d1.jpg', '', 'weicall/archive/74db17f2acbd2f81626f0f129ad5ccc5.zip', 983847, '74dac0cf4361621c2d613221bb5b3770', 0, 0, 0, 0, 1, 1027, '2014-06-26 11:15:24', '2014-11-06 05:58:42'),
(662, 'android', '003.005.000', '003.006.099', 'middle', 1, '愤怒小鸟', '', '', 'weicall/thumbnails/746af1be1e37816d73ccb607153622d2.jpg', '', 'weicall/archive/e561732b9b544a7f801411b4950d4c63.zip', 474569, 'aac5132c75fa4818728cac38736f09b5', 0, 0, 0, 0, 1, 1025, '2014-06-26 11:17:55', '2014-11-06 05:58:42'),
(663, 'android', '003.005.000', '003.006.099', 'large', 1, '愤怒小鸟', '', '', 'weicall/thumbnails/b3dcfa6130ab98e33ae947b2b56b4dc7.jpg', '', 'weicall/archive/e3173b4502e738d003619c6aeec67dca.zip', 594564, 'c0ab46e552115dc07a935a45b837d692', 0, 0, 0, 0, 1, 1025, '2014-06-26 11:18:24', '2014-11-06 05:58:42'),
(664, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '愤怒小鸟', '', '', 'weicall/thumbnails/8b18ae55520e457355c972b68a028081.jpg', '', 'weicall/archive/3231c44f732e645a8d310f7fc0267710.zip', 810255, 'e5b5720ef11c85e272da79172700ea45', 0, 0, 0, 0, 1, 1025, '2014-06-26 11:18:45', '2014-11-06 05:58:42'),
(665, 'android', '003.005.000', '003.006.099', 'middle', 1, '黑色简约', '', '', 'weicall/thumbnails/ea48351c51426a974fd6915e8e6b4f02.jpg', '', 'weicall/archive/b462aa5cd414821f64fbf6841bafcdea.zip', 308015, '4a7bf5b4b283e0fc2b000a401b915206', 0, 0, 0, 0, 1, 1017, '2014-06-26 11:19:26', '2014-11-06 05:58:42'),
(666, 'android', '003.005.000', '003.006.099', 'large', 1, '黑色简约', '', '', 'weicall/thumbnails/ee24bd8240245a0a4797dbe9c3550612.jpg', '', 'weicall/archive/ef0d87d31d907285f95886564b0525a7.zip', 462317, '47c2c9fd6da7c4345ca7e7fa902805a0', 0, 0, 0, 0, 1, 1017, '2014-06-26 11:20:00', '2014-11-06 05:58:42'),
(667, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '黑色简约', '', '', 'weicall/thumbnails/61ff244bd6c1d1f23ab7f0fd8368ec8e.jpg', '', 'weicall/archive/19bb28719aa28b6ba623226e370156ac.zip', 785865, 'e95700a979296a4a712c0b7f5f1b5210', 0, 0, 0, 0, 1, 1017, '2014-06-26 11:25:06', '2014-11-06 05:58:42'),
(668, 'android', '003.005.000', '003.006.099', 'middle', 1, '活力水果', '', '', 'weicall/thumbnails/6c2426edd5eec8b6b2a1b87ccd61898e.jpg', '', 'weicall/archive/38b787325dfcbd10d7cf765b906ad457.zip', 377390, 'efee0a2ee30ef066a5bc1206eed49b6e', 0, 0, 0, 0, 1, 1023, '2014-06-26 11:26:17', '2014-11-06 05:58:42'),
(669, 'android', '003.005.000', '003.006.099', 'large', 1, '活力水果', '', '', 'weicall/thumbnails/dd408692262c3cd8c209642a1964a07f.jpg', '', 'weicall/archive/296201f01a213d9183e2e52bb1d18ef7.zip', 519252, 'ef118ba4382759cc5185b546c7635729', 0, 0, 0, 0, 1, 1023, '2014-06-26 11:26:42', '2014-11-06 05:58:42'),
(670, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '活力水果', '', '', 'weicall/thumbnails/e0da6d237650fce95716d32ea9872ae4.jpg', '', 'weicall/archive/21e0e73195272ccfd295cd80c7596bc1.zip', 731920, '4a75ccf50521497f2d0723c8f9200906', 0, 0, 0, 0, 1, 1023, '2014-06-26 11:27:04', '2014-11-06 05:58:42'),
(671, 'android', '003.005.000', '003.006.099', 'middle', 1, '蓝色经典', '', '', 'weicall/thumbnails/88bdea946497f26b1b7ae993d2994a6d.jpg', '', 'weicall/archive/de0e2a68ae92d08e293124f9caeca05f.zip', 397190, '66d0d7ddbc31aaf4ac499c8a4395e0f0', 0, 0, 0, 0, 1, 1029, '2014-06-26 11:27:53', '2014-11-06 05:58:42'),
(672, 'android', '003.005.000', '003.006.099', 'large', 1, '蓝色经典', '', '', 'weicall/thumbnails/e3449ed656b506bd63dd03cfc16efbd6.jpg', '', 'weicall/archive/2030d2b4c6b44e18d4f7c0e14033a1a0.zip', 612331, '28605cbdebe98561d38c4736a5a5a492', 0, 0, 0, 0, 1, 1029, '2014-06-26 11:28:13', '2014-11-06 05:58:42'),
(673, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '蓝色经典', '', '', 'weicall/thumbnails/47ccd3b190913c1c37c9cbf8a1567adb.jpg', '', 'weicall/archive/3699d3636ed671c3dce4474e7643c1df.zip', 903229, 'a2b2dc7412d07800f361d803ca192946', 0, 0, 0, 0, 1, 1029, '2014-06-26 11:28:46', '2014-11-06 05:58:42'),
(674, 'android', '003.005.000', '003.006.099', 'middle', 1, '绿意盎然', '', '', 'weicall/thumbnails/35ddcb37f547032d1b326d1a17ef8126.jpg', '', 'weicall/archive/2028cf5ed9ea9c2b55e094d953fc4dff.zip', 384011, '7487dbcaabfae0311dc60c9a6b5890cb', 0, 0, 0, 0, 1, 1028, '2014-06-26 11:42:29', '2014-11-06 05:58:42'),
(675, 'android', '003.005.000', '003.006.099', 'large', 1, '绿意盎然', '', '', 'weicall/thumbnails/ebc81a261a255b0a3780eae21db25eac.jpg', '', 'weicall/archive/9dd62251023e7fa2219afcd13affb6cd.zip', 577607, '5d44769d46b3821eedddde3290d45732', 0, 0, 0, 0, 1, 1028, '2014-06-26 11:43:30', '2014-11-06 05:58:42'),
(676, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '绿意盎然', '', '', 'weicall/thumbnails/01d808bfab6d6ed8d0d7ff5ff67a9355.jpg', '', 'weicall/archive/f8a0e5a3a0f8802852220236171a25bc.zip', 876087, 'a7f9f1df9f84dd2051c432b0c65bb76b', 0, 0, 0, 0, 1, 1028, '2014-06-26 11:45:30', '2014-11-06 05:58:42'),
(677, 'android', '003.005.000', '003.006.099', 'middle', 1, '魔法精灵', '', '', 'weicall/thumbnails/db20ef6d8309f2a66666aa3ad32de19e.jpg', '', 'weicall/archive/c3aa4d65e626a98fbc8b7432be4ae6e2.zip', 515502, 'f68fd1bf0209e6e929e4fc7b5341c672', 0, 0, 0, 0, 1, 1022, '2014-06-26 11:46:07', '2014-11-06 05:58:42'),
(678, 'android', '003.005.000', '003.006.099', 'large', 1, '魔法精灵', '', '', 'weicall/thumbnails/d6d25c58d8fa5e24f543a2e6b52e56a6.jpg', '', 'weicall/archive/a805b5a41721a8cc8703434b02cc6ef7.zip', 740375, '9c260d1693e33eb485cbc1d4a8a4dc7d', 0, 0, 0, 0, 1, 1022, '2014-06-26 11:46:34', '2014-11-06 05:58:42'),
(679, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '魔法精灵', '', '', 'weicall/thumbnails/9f5f44318c582d19b5e0479cdd5aa2f3.jpg', '', 'weicall/archive/835c7c0234817bd81f501c9aa3d2aedd.zip', 1122106, 'e2589568ded0f4ea90448342e4cd7468', 0, 0, 0, 0, 1, 1022, '2014-06-26 11:46:55', '2014-11-06 05:58:42'),
(680, 'android', '003.005.000', '003.006.099', 'middle', 1, '牧场物语', '', '', 'weicall/thumbnails/41bbb6feba1882e3b57adafd5dfbaefd.jpg', '', 'weicall/archive/cd85e2210f6373ffab5525d18d6a6acb.zip', 505129, 'e1d861cf2f13055a52c9619188da3e95', 0, 0, 0, 0, 1, 1024, '2014-06-26 11:47:30', '2014-11-06 05:58:42'),
(681, 'android', '003.005.000', '003.006.099', 'large', 1, '牧场物语', '', '', 'weicall/thumbnails/42f2c8ac1f8940d08461ca649df0b5d7.jpg', '', 'weicall/archive/e073f58532616f41e6c4ca6e3b88006f.zip', 756120, 'a0fa8e8ba1291adb450cfba19f6d4138', 0, 0, 0, 0, 1, 1024, '2014-06-26 11:47:49', '2014-11-06 05:58:42'),
(682, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '牧场物语', '', '', 'weicall/thumbnails/f228b30bd948779900fc17782d942071.jpg', '', 'weicall/archive/16a5ee902ff9ecd6f090beb7d5e1c39c.zip', 1115359, '7cbf4941e39404dada6311ea22c8c0d0', 0, 0, 0, 0, 1, 1024, '2014-06-26 11:48:08', '2014-11-06 05:58:42'),
(683, 'android', '003.005.000', '003.006.099', 'middle', 1, '热血篮球', '', '', 'weicall/thumbnails/ae2a0b0a9b7ea09b50eb587c697bc06b.jpg', '', 'weicall/archive/33c66f54103ed5a9d68b6e92c8f9aaa2.zip', 406968, '9dde82ff5d6157f3513f9a77bcf7be51', 0, 0, 0, 0, 1, 1018, '2014-06-26 11:49:40', '2014-11-06 05:58:42'),
(684, 'android', '003.005.000', '003.006.099', 'large', 1, '热血篮球', '', '', 'weicall/thumbnails/4d55ef9a071cb647098bd43984dfcea6.jpg', '', 'weicall/archive/a8ebbee61db6253737776263c1effb2c.zip', 601818, '585f4d7a5352a9504ba6d6b3de336bf6', 0, 0, 0, 0, 1, 1018, '2014-06-26 11:50:11', '2014-11-06 05:58:42'),
(685, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '热血篮球', '', '', 'weicall/thumbnails/f03f42ec67f37f38d0eaa329d56c36cb.jpg', '', 'weicall/archive/2aae7399c6f57dc93689ef492fd8594d.zip', 796291, 'db9a19f438f2ba4cdd03361be70f65d9', 0, 0, 0, 0, 1, 1018, '2014-06-26 11:50:32', '2014-11-06 05:58:42'),
(686, 'android', '003.005.000', '003.006.099', 'middle', 1, '炫蓝水晶', '', '', 'weicall/thumbnails/769967c8a44ed950a1a95e294ad7966f.jpg', '', 'weicall/archive/99cbbf6414f9bf3a4bf0c03b58ca5d8e.zip', 380492, '37fb214590b11be4335c3b343f574383', 0, 0, 1, 0, 1, 1016, '2014-06-26 11:51:11', '2014-11-06 05:58:42'),
(687, 'android', '005.000.000', '003.006.099', 'large', 1, '炫蓝4.0', '', '', 'weicall/thumbnails/1a0670bf9aeaeecffc264db31458442f.jpg', '', 'weicall/archive/fec4adb502099b35b4e36cfe1b738aa7.zip', 471873, 'e49f24b6571d486b7de87997fb10593a', 0, 0, 0, 0, 1, 1016, '2014-06-26 11:51:32', '2014-11-06 05:58:42'),
(688, 'android', '003.005.000', '003.006.099', 'large', 1, '炫蓝水晶', '', '', 'weicall/thumbnails/4a2254e415b3db25e776054d48eeafa2.jpg', '', 'weicall/archive/d082ac5144c3f02f2262cffb9eea2993.zip', 564248, 'a2cd6c5cb96024a71c09afb9cd54a62d', 0, 0, 1, 0, 1, 1016, '2014-06-26 11:51:52', '2014-11-06 05:58:42'),
(689, 'android', '003.005.000', '003.006.099', 'middle', 1, '自然原木', '', '', 'weicall/thumbnails/f5af5321d07ab14a30bb9b854209ddee.jpg', '', 'weicall/archive/844c6a379227b13d71fce7344900ddf6.zip', 564373, '415390f190089bc9fbd85a001a8ce401', 0, 0, 0, 0, 1, 1026, '2014-06-26 11:52:30', '2014-11-06 05:58:42'),
(690, 'android', '003.005.000', '003.006.099', 'large', 1, '自然原木', '', '', 'weicall/thumbnails/628ca9fa704a6ae1e5a75a0213e43dc7.jpg', '', 'weicall/archive/d6f7a1298f5ab4af36f4ff4b6f1e43dc.zip', 891772, 'aecd0dea5c375b16b9f959ddb9d2922c', 0, 0, 0, 0, 1, 1026, '2014-06-26 11:52:54', '2014-11-06 05:58:42'),
(691, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '自然原木', '', '', 'weicall/thumbnails/5e75155379b5c86e94750848f018a8b0.jpg', '', 'weicall/archive/f8028c6fe90f3755a68d2369dfd53ccb.zip', 1554772, '76db799718eebdf97437e9a2dafda3bc', 0, 0, 0, 0, 1, 1026, '2014-06-26 11:53:18', '2014-11-06 05:58:42'),
(692, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '炫蓝水晶', '', '', 'weicall/thumbnails/759e679b895c6bf1e7a6440864bfcae3.jpg', '', 'weicall/archive/fb877aa27badad60035d443e0730a090.zip', 841272, '9a5e2cba39397554df2fd438d4163748', 0, 0, 1, 0, 1, 1016, '2014-06-26 11:54:40', '2014-11-06 05:58:42'),
(701, 'ios', '003.005.000', '003.006.099', 'small', 1, '夏日海滩', '', '', 'weicall/thumbnails/6cf0d6602b3536199d7f282099ed06cf.jpg', '', 'weicall/archive/e4c45fb0134d901bb9da68a9a4881c48.zip', 856070, '7ff082f39d704f6ba56f8a45f8741364', 0, 0, 1, 0, 1, 1013, '2014-07-11 14:12:18', '2014-11-06 05:58:42'),
(705, 'ios', '003.005.000', '003.006.099', 'small', 1, '世界杯', '', '', 'weicall/thumbnails/ca3994c7e9ca79607d3bef1615c79750.jpg', '', 'weicall/archive/9fd41fe3ebe87a797a09aca731b87294.zip', 1517417, '3e75039988f99c5ed6b280ea0f9a0c56', 0, 0, 1, 0, 1, 1014, '2014-07-14 15:38:53', '2014-11-06 05:58:42'),
(706, 'android', '003.005.000', '003.006.099', 'large', 1, '夏日测试', '', '', 'weicall/thumbnails/99bb4cdcc6c805bf9112cd1e1b5ad80c.jpg', '', 'weicall/archive/ccddad88913ae5d4bab90e7374382cef.zip', 702940, '327fd5925d99bf87b9f98091cc1bca4d', 0, 0, 1, 0, 1, 1013, '2014-07-17 19:36:29', '2014-11-06 05:58:42'),
(707, 'android', '003.005.000', '003.006.099', 'middle', 1, '夏日海滩', '', '', 'weicall/thumbnails/21d949b24a7c1c0774db0c037bbb0d53.jpg', '', 'weicall/archive/1ad8b6acf25af8791abc7a3391db9fc7.zip', 449614, '68b3073120799c176dd8281d15138268', 0, 0, 1, 0, 1, 1013, '2014-07-21 11:29:21', '2014-11-06 05:58:42'),
(708, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '夏日海滩', '', '', 'weicall/thumbnails/ec4a982df71241dc12dbe9d8be9e094f.jpg', '', 'weicall/archive/647bab24c08226c686ceeef7ab8f1ab1.zip', 1153109, 'fffcfa8684af4b6bd134be3e80978161', 0, 0, 1, 0, 1, 1013, '2014-07-21 11:30:05', '2014-11-06 05:58:42'),
(709, 'android', '003.005.000', '003.006.099', 'large', 1, '世界杯', '', '', 'weicall/thumbnails/40d7f2b9bb358e61e4b1ba8430d3aa14.png', '', 'weicall/archive/977323f966ff1661c56e412d3187911d.zip', 914103, '6b41f2acdeb90c11f766d9c2cfcabe45', 0, 0, 1, 0, 1, 1014, '2014-07-21 14:16:51', '2014-11-06 05:58:42'),
(710, 'android', '003.005.000', '003.006.099', 'middle', 1, '世界杯', '', '', 'weicall/thumbnails/a167e5514e32bd4ea288c199fa46ab69.png', '', 'weicall/archive/1db115454c92bb641e181cb1111f2530.zip', 542792, 'dcd14d40989fe127c7caf5f9e39f12f3', 0, 0, 1, 0, 1, 1014, '2014-07-21 20:37:16', '2014-11-06 05:58:42'),
(711, 'android', '003.005.000', '003.006.099', 'xlarge', 1, '世界杯', '', '', 'weicall/thumbnails/c47e73a57b5188d217b380c0492ed920.png', '', 'weicall/archive/16d3dc1bae7de9c784e9a15fe3b2d3c6.zip', 1719880, '2a5a4763e47b175851561222124eff89', 0, 0, 1, 0, 1, 1014, '2014-07-21 20:37:44', '2014-11-06 05:58:42'),
(719, 'all', '009.009.000', '099.099.099', '', 5, '测试2', '', '', '', '', 'weicall/archive/d0cede16c94ed9bb2eb536bb44b09858.zip', 221, '53f2ecc1d97a377cd6a72d5def93dd30', 0, 0, 1, 0, 1, 1, '2014-08-01 16:54:24', '2014-08-05 07:30:08'),
(722, 'android', '000.000.000', '003.006.099', 'large', 2, '471-插画-L', '', '', 'weicall/thumbnails/96dcd33e80477296ca77657d2e8eeb9b.jpg', '', 'weicall/archive/815da3f14461d2316532aa287523cf89.jpg', 45726, 'a82985c63830495ee95af657ed6ea190', 0, 0, 1, 0, 1, -1, '2014-08-12 18:03:17', '2014-11-06 05:58:42'),
(723, 'ios', '000.000.000', '003.006.099', 'small', 2, '472-汽车', '', '', 'weicall/thumbnails/cc36f78fb61ca1d5a791cee7c85357e6.jpg', '', 'weicall/archive/e96250ff5b52eb32d65b4036fd233f9a.jpg', 41723, '2a7564b4de45caf99b1a3fd3d35e5f60', 0, 0, 1, 0, 1, -2, '2014-08-12 18:05:10', '2014-11-06 05:58:42'),
(725, 'android', '000.000.000', '003.006.099', 'large', 2, '472-汽车-L', '', '', 'weicall/thumbnails/4d3f43e42bce14d4f37f521e58fa634a.jpg', '', 'weicall/archive/441a08af27f564a8fd4cac7058b4f4a1.jpg', 51660, '328dcf0a9275cb1a5a45fb9be2cfc43b', 0, 0, 1, 0, 1, -2, '2014-08-12 18:06:02', '2014-11-06 05:58:42'),
(727, 'android', '000.000.000', '003.006.099', 'middle', 2, '473-茶杯猫-M', '', '', 'weicall/thumbnails/f0c537c54aa48cf864862cddc382ea4c.jpg', '', 'weicall/archive/f8696713cfd07f67ca12236dc6e722c9.jpg', 27384, 'd40a954a742033bc621772be1f0e148a', 0, 0, 1, 0, 1, -3, '2014-08-12 18:07:26', '2014-11-06 05:58:42'),
(732, 'ios', '000.000.000', '003.006.099', 'small', 2, '476-三叶草', '', '', 'weicall/thumbnails/1c8371de463d3884b7de299ceab0f97d.jpg', '', 'weicall/archive/ba80ac8e88bdf687a2029e2d525c62f2.jpg', 34424, 'ebc7897ccc9719b20df09823e81095ff', 0, 0, 1, 0, 1, -5, '2014-08-12 18:47:26', '2014-11-06 05:58:42'),
(738, 'ios', '003.007.000', '099.099.099', 'small', 1, 'ios测试包', '', '', 'weicall/thumbnails/2a1e2f0e25de6fdb83c0e7f15655dbdb.jpg', 'weicall/thumbnails/3790d8ef6648a11e3efb08743733b8b4.jpg', 'weicall/archive/1a97b275cec6f6668f1da6120f341ca1.zip', 261123, '71d4d0ef5cd2bc966fdc70daa6fe358e', 0, 0, 1, 0, 1, 1, '2014-11-06 14:41:16', '2014-11-15 01:56:51'),
(739, 'android', '003.007.000', '099.099.099', 'middle', 1, '测试480', '', '', 'weicall/thumbnails/9bb4ac592a6d8ccc637bda8d7dcde070.jpg', 'weicall/thumbnails/8b2ac16e267a1d640fc9d85e72ceb227.jpg', 'weicall/archive/7a82a6e52038487a983b3e7f0b23b95a.zip', 147227, 'ee8319059ea6f9a18382dc14e79c019b', 0, 0, 1, 0, 1, 1, '2014-11-10 15:53:59', '2014-11-21 07:00:21'),
(741, 'android', '003.007.000', '099.099.099', 'xlarge', 1, '测试1080', '', '', 'weicall/thumbnails/b7166af54c221cd796dc567ec25878d6.jpg', 'weicall/thumbnails/91e07091ce4bb79383a24e31c033ec7c.jpg', 'weicall/archive/7e14243ad4e354c37dd40fd5febb4be0.zip', 225092, 'fb2b0da4853b745ea6dc83a7255fb542', 0, 0, 1, 0, 1, 1, '2014-11-10 15:55:20', '2014-11-21 07:00:12'),
(742, 'android', '003.007.000', '099.099.099', 'xxlarge', 1, '测试1440', '', '', 'weicall/thumbnails/45d64494b87a65dfa7a0b0179e21bbd2.jpg', 'weicall/thumbnails/f1dbd381ec4f3faf9ec0aa8313e9a28a.jpg', 'weicall/archive/0833237d5706ed68627d9cb0ca3db183.zip', 262456, '7182be3ecca76ced22cbdb94bc5d2e72', 0, 0, 1, 0, 1, 1, '2014-11-10 15:55:49', '2014-11-21 07:00:37'),
(745, 'ios', '003.007.000', '099.099.099', 'small', 2, '默认键盘2', '', '', 'weicall/thumbnails/c0f054d87728c229c1b3119e6cb9799c.jpg', 'weicall/thumbnails/223bd2bd59015479793bb40777e4270a.jpg', 'weicall/archive/7e95ba803d0d80f5cef52a605844b4fe.jpg', 23521, '690a452ad206e50f1e363b03ef5ff7e1', 0, 0, 1, 0, 1, 3, '2014-11-20 17:49:23', '2014-11-20 11:29:36'),
(746, 'ios', '003.007.000', '099.099.099', 'small', 2, '默认键盘1', '', '', 'weicall/thumbnails/cb93f8662991a50d86a334d6ee557e48.jpg', 'weicall/thumbnails/7f5e6e189b1f7aa7cccd5330808e8927.jpg', 'weicall/archive/67d6eb1546b81234fef47b7c31d3aeed.jpg', 62116, '21e938924ca6d7af0f427cc3a216a8b2', 0, 0, 1, 0, 1, 1, '2014-11-20 18:32:33', '2014-11-20 11:04:27'),
(747, 'android', '003.007.000', '099.099.099', 'middle', 2, '默认键盘背景1', '', '', 'weicall/thumbnails/cbc94d3cbe466732c657f91726a2e3b1.jpg', 'weicall/thumbnails/df8d33bdd0dcb258cf8dedf136b690fd.jpg', 'weicall/archive/4c9d7547ad49841f90ebd861cd57e92a.jpg', 28194, '374f88fe4b6f4facc816580afe9b111f', 0, 0, 1, 0, 1, 1, '2014-11-21 10:42:05', '2014-11-21 02:42:05'),
(748, 'android', '003.007.000', '099.099.099', 'large', 2, '默认键盘背景1', '', '', 'weicall/thumbnails/f54ecaefa0664284c2fb9553bc7cabdd.jpg', 'weicall/thumbnails/3b3e686540e533a80d5038e4831dae2a.jpg', 'weicall/archive/a9679921d94bd6e66430703f076200cf.jpg', 48965, '3540e096c62e990ff653a0b57a9a3013', 0, 0, 1, 0, 1, 1, '2014-11-21 10:42:57', '2014-11-21 02:42:57'),
(749, 'android', '003.007.000', '099.099.099', 'xlarge', 2, '默认键盘背景1', '', '', 'weicall/thumbnails/d0d7dcab4adb7a77894eb681bcf623fe.jpg', 'weicall/thumbnails/738e43d1a1b76c212a7f0aa273616aa9.jpg', 'weicall/archive/a8a7216030add155f42e45a8d88413cf.jpg', 89961, '9536a8077637cf66accdfb6c0d30176d', 0, 0, 1, 0, 1, 1, '2014-11-21 10:43:28', '2014-11-21 02:43:28'),
(750, 'android', '003.007.000', '099.099.099', 'xxlarge', 2, '默认键盘背景1', '', '', 'weicall/thumbnails/33c453a2b81bb5fd12247c00cf2fe028.jpg', 'weicall/thumbnails/6777c13d50ae8c9b9de032a859480539.jpg', 'weicall/archive/0c7f8d26aa7dd9d56e5d29bed2ab036c.jpg', 89961, '9536a8077637cf66accdfb6c0d30176d', 0, 0, 1, 0, 1, 1, '2014-11-21 10:43:55', '2014-11-21 02:43:55'),
(751, 'android', '003.007.000', '099.099.099', 'middle', 2, '默认键盘背景2', '', '', 'weicall/thumbnails/504f63fbf11d4474252e8699297ca7ea.jpg', 'weicall/thumbnails/d41e3fe35f86735cfeb986015c05f616.jpg', 'weicall/archive/27ad7e834f305ed01f6e96c96116882b.jpg', 14427, '5b670f848f0cf7b4a828d5a72bacce33', 0, 0, 1, 0, 1, 2, '2014-11-21 10:44:28', '2014-11-21 02:44:28'),
(752, 'android', '003.007.000', '099.099.099', 'large', 2, '默认键盘背景2', '', '', 'weicall/thumbnails/3fb87bb7250438dfd4da435b7a42a3c5.jpg', 'weicall/thumbnails/c1d5e5d078083a19ee31c32cf42dc04f.jpg', 'weicall/archive/70958fc5e0460c05480b33591878ca35.jpg', 24137, 'e8ba93b15b7b9a10722d599051db6f9a', 0, 0, 1, 0, 1, 2, '2014-11-21 10:44:56', '2014-11-21 02:44:56'),
(753, 'android', '003.007.000', '099.099.099', 'xlarge', 2, '默认键盘背景2', '', '', 'weicall/thumbnails/65ae628ac9e9c3f87e24b1333062831c.jpg', 'weicall/thumbnails/b10cc0b6f52f6d1800266e19811f59c6.jpg', 'weicall/archive/d6cca68037cd951ae5825e4a2ffe2ab3.jpg', 44414, '020958e0b677810294d7dbc917baa3a2', 0, 0, 1, 0, 1, 2, '2014-11-21 10:45:26', '2014-11-21 02:45:26'),
(754, 'android', '003.007.000', '099.099.099', 'xxlarge', 2, '默认键盘背景2', '', '', 'weicall/thumbnails/b3d2623c6da80099334d7b56fcfe195d.jpg', 'weicall/thumbnails/65d39a3b86bc3c2ac2488f2655f0fb63.jpg', 'weicall/archive/02c14374b6232348967e8c1fa36e44a5.jpg', 44414, '020958e0b677810294d7dbc917baa3a2', 0, 0, 1, 0, 1, 2, '2014-11-21 10:45:55', '2014-11-21 02:45:55');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rsa_key`
--

CREATE TABLE IF NOT EXISTS `tbl_rsa_key` (
`id` int(10) NOT NULL,
  `userid` bigint(20) NOT NULL COMMENT '用户ID号',
  `public` text NOT NULL COMMENT '公钥',
  `private` text NOT NULL COMMENT '私钥'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_theme_fit_list`
--

CREATE TABLE IF NOT EXISTS `tbl_theme_fit_list` (
`id` bigint(20) NOT NULL,
  `theme_id` int(11) NOT NULL,
  `type` set('black','white') NOT NULL,
  `to_catgory` set('bkgd') NOT NULL DEFAULT 'bkgd',
  `to_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1093 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_theme_fit_list`
--

INSERT INTO `tbl_theme_fit_list` (`id`, `theme_id`, `type`, `to_catgory`, `to_id`) VALUES
(62, 648, 'white', 'bkgd', 393),
(63, 648, 'white', 'bkgd', 389),
(64, 648, 'white', 'bkgd', 45),
(65, 648, 'white', 'bkgd', 457),
(66, 648, 'white', 'bkgd', 409),
(67, 648, 'white', 'bkgd', 413),
(68, 648, 'white', 'bkgd', 417),
(69, 648, 'white', 'bkgd', 421),
(70, 648, 'white', 'bkgd', 425),
(71, 648, 'white', 'bkgd', 429),
(72, 648, 'white', 'bkgd', 433),
(73, 648, 'white', 'bkgd', 437),
(74, 648, 'white', 'bkgd', 441),
(75, 648, 'white', 'bkgd', 449),
(76, 648, 'white', 'bkgd', 405),
(77, 648, 'white', 'bkgd', 445),
(78, 648, 'white', 'bkgd', 453),
(79, 648, 'white', 'bkgd', 461),
(80, 648, 'white', 'bkgd', 465),
(81, 648, 'white', 'bkgd', 469),
(82, 648, 'white', 'bkgd', 478),
(83, 648, 'white', 'bkgd', 474),
(84, 648, 'white', 'bkgd', 482),
(85, 648, 'white', 'bkgd', 2),
(86, 648, 'white', 'bkgd', 156),
(87, 648, 'white', 'bkgd', 499),
(88, 648, 'white', 'bkgd', 495),
(89, 648, 'white', 'bkgd', 491),
(90, 648, 'white', 'bkgd', 487),
(91, 648, 'white', 'bkgd', 53),
(92, 648, 'white', 'bkgd', 24),
(93, 648, 'white', 'bkgd', 155),
(94, 648, 'white', 'bkgd', 42),
(95, 648, 'white', 'bkgd', 26),
(96, 648, 'white', 'bkgd', 158),
(97, 648, 'white', 'bkgd', 25),
(98, 648, 'white', 'bkgd', 27),
(99, 648, 'white', 'bkgd', 38),
(100, 648, 'white', 'bkgd', 51),
(101, 648, 'white', 'bkgd', 39),
(102, 648, 'white', 'bkgd', 43),
(103, 648, 'white', 'bkgd', 41),
(104, 648, 'white', 'bkgd', 261),
(105, 648, 'white', 'bkgd', 251),
(106, 648, 'white', 'bkgd', 253),
(107, 636, 'white', 'bkgd', 389),
(108, 636, 'white', 'bkgd', 457),
(109, 636, 'white', 'bkgd', 409),
(110, 636, 'white', 'bkgd', 417),
(111, 636, 'white', 'bkgd', 421),
(112, 636, 'white', 'bkgd', 429),
(113, 636, 'white', 'bkgd', 433),
(114, 636, 'white', 'bkgd', 437),
(115, 636, 'white', 'bkgd', 441),
(116, 636, 'white', 'bkgd', 445),
(117, 636, 'white', 'bkgd', 405),
(118, 636, 'white', 'bkgd', 474),
(119, 636, 'white', 'bkgd', 156),
(120, 636, 'white', 'bkgd', 499),
(121, 636, 'white', 'bkgd', 495),
(122, 636, 'white', 'bkgd', 491),
(123, 636, 'white', 'bkgd', 487),
(124, 636, 'white', 'bkgd', 53),
(125, 636, 'white', 'bkgd', 24),
(126, 636, 'white', 'bkgd', 155),
(127, 636, 'white', 'bkgd', 42),
(128, 636, 'white', 'bkgd', 26),
(129, 636, 'white', 'bkgd', 158),
(130, 636, 'white', 'bkgd', 25),
(131, 636, 'white', 'bkgd', 27),
(132, 636, 'white', 'bkgd', 51),
(133, 636, 'white', 'bkgd', 39),
(134, 636, 'white', 'bkgd', 261),
(135, 636, 'white', 'bkgd', 251),
(136, 636, 'white', 'bkgd', 253),
(137, 646, 'white', 'bkgd', 389),
(138, 646, 'white', 'bkgd', 461),
(139, 646, 'white', 'bkgd', 499),
(140, 646, 'white', 'bkgd', 156),
(141, 646, 'white', 'bkgd', 155),
(142, 646, 'white', 'bkgd', 42),
(143, 637, 'white', 'bkgd', 389),
(144, 637, 'white', 'bkgd', 401),
(145, 637, 'white', 'bkgd', 45),
(146, 637, 'white', 'bkgd', 457),
(147, 637, 'white', 'bkgd', 413),
(148, 637, 'white', 'bkgd', 417),
(149, 637, 'white', 'bkgd', 441),
(150, 637, 'white', 'bkgd', 461),
(151, 637, 'white', 'bkgd', 465),
(152, 637, 'white', 'bkgd', 499),
(153, 637, 'white', 'bkgd', 495),
(154, 637, 'white', 'bkgd', 491),
(155, 637, 'white', 'bkgd', 487),
(156, 637, 'white', 'bkgd', 53),
(157, 637, 'white', 'bkgd', 42),
(158, 637, 'white', 'bkgd', 25),
(159, 637, 'white', 'bkgd', 38),
(160, 637, 'white', 'bkgd', 51),
(161, 637, 'white', 'bkgd', 261),
(162, 637, 'white', 'bkgd', 251),
(163, 637, 'white', 'bkgd', 253),
(172, 638, 'white', 'bkgd', 457),
(173, 638, 'white', 'bkgd', 469),
(174, 638, 'white', 'bkgd', 465),
(175, 638, 'white', 'bkgd', 499),
(176, 638, 'white', 'bkgd', 491),
(177, 638, 'white', 'bkgd', 51),
(178, 638, 'white', 'bkgd', 261),
(179, 644, 'white', 'bkgd', 393),
(180, 644, 'white', 'bkgd', 45),
(181, 644, 'white', 'bkgd', 457),
(182, 644, 'white', 'bkgd', 413),
(183, 644, 'white', 'bkgd', 437),
(184, 644, 'white', 'bkgd', 441),
(185, 644, 'white', 'bkgd', 453),
(186, 644, 'white', 'bkgd', 461),
(187, 644, 'white', 'bkgd', 474),
(188, 644, 'white', 'bkgd', 478),
(189, 644, 'white', 'bkgd', 2),
(190, 644, 'white', 'bkgd', 499),
(191, 644, 'white', 'bkgd', 495),
(192, 644, 'white', 'bkgd', 42),
(193, 644, 'white', 'bkgd', 25),
(194, 644, 'white', 'bkgd', 27),
(195, 641, 'white', 'bkgd', 389),
(196, 641, 'white', 'bkgd', 425),
(197, 641, 'white', 'bkgd', 441),
(198, 641, 'white', 'bkgd', 461),
(199, 641, 'white', 'bkgd', 499),
(200, 641, 'white', 'bkgd', 53),
(201, 641, 'white', 'bkgd', 155),
(202, 641, 'white', 'bkgd', 487),
(203, 641, 'white', 'bkgd', 42),
(204, 641, 'white', 'bkgd', 39),
(205, 641, 'white', 'bkgd', 51),
(206, 645, 'white', 'bkgd', 389),
(207, 645, 'white', 'bkgd', 45),
(208, 645, 'white', 'bkgd', 457),
(209, 645, 'white', 'bkgd', 413),
(210, 645, 'white', 'bkgd', 441),
(211, 645, 'white', 'bkgd', 405),
(212, 645, 'white', 'bkgd', 461),
(213, 645, 'white', 'bkgd', 499),
(214, 645, 'white', 'bkgd', 487),
(215, 645, 'white', 'bkgd', 53),
(216, 645, 'white', 'bkgd', 155),
(217, 645, 'white', 'bkgd', 42),
(218, 645, 'white', 'bkgd', 51),
(219, 645, 'white', 'bkgd', 39),
(220, 640, 'white', 'bkgd', 457),
(221, 640, 'white', 'bkgd', 461),
(222, 640, 'white', 'bkgd', 2),
(223, 640, 'white', 'bkgd', 499),
(224, 640, 'white', 'bkgd', 155),
(225, 640, 'white', 'bkgd', 42),
(226, 640, 'white', 'bkgd', 39),
(227, 647, 'white', 'bkgd', 389),
(228, 647, 'white', 'bkgd', 401),
(229, 647, 'white', 'bkgd', 45),
(230, 647, 'white', 'bkgd', 457),
(231, 647, 'white', 'bkgd', 413),
(232, 647, 'white', 'bkgd', 433),
(233, 647, 'white', 'bkgd', 441),
(234, 647, 'white', 'bkgd', 445),
(235, 647, 'white', 'bkgd', 405),
(236, 647, 'white', 'bkgd', 453),
(237, 647, 'white', 'bkgd', 461),
(238, 647, 'white', 'bkgd', 465),
(239, 647, 'white', 'bkgd', 482),
(240, 647, 'white', 'bkgd', 2),
(241, 647, 'white', 'bkgd', 156),
(242, 647, 'white', 'bkgd', 499),
(243, 647, 'white', 'bkgd', 495),
(244, 647, 'white', 'bkgd', 487),
(245, 647, 'white', 'bkgd', 53),
(246, 647, 'white', 'bkgd', 155),
(247, 647, 'white', 'bkgd', 42),
(248, 647, 'white', 'bkgd', 26),
(249, 647, 'white', 'bkgd', 25),
(250, 647, 'white', 'bkgd', 38),
(251, 647, 'white', 'bkgd', 51),
(252, 647, 'white', 'bkgd', 39),
(253, 639, 'white', 'bkgd', 389),
(254, 639, 'white', 'bkgd', 393),
(255, 639, 'white', 'bkgd', 401),
(256, 639, 'white', 'bkgd', 45),
(257, 639, 'white', 'bkgd', 457),
(258, 639, 'white', 'bkgd', 413),
(259, 639, 'white', 'bkgd', 433),
(260, 639, 'white', 'bkgd', 437),
(261, 639, 'white', 'bkgd', 441),
(262, 639, 'white', 'bkgd', 461),
(263, 639, 'white', 'bkgd', 2),
(264, 639, 'white', 'bkgd', 495),
(265, 639, 'white', 'bkgd', 487),
(266, 639, 'white', 'bkgd', 42),
(267, 639, 'white', 'bkgd', 26),
(268, 639, 'white', 'bkgd', 25),
(269, 643, 'white', 'bkgd', 401),
(270, 643, 'white', 'bkgd', 45),
(271, 643, 'white', 'bkgd', 457),
(272, 643, 'white', 'bkgd', 413),
(273, 643, 'white', 'bkgd', 417),
(274, 643, 'white', 'bkgd', 437),
(275, 643, 'white', 'bkgd', 441),
(276, 643, 'white', 'bkgd', 461),
(277, 643, 'white', 'bkgd', 465),
(278, 643, 'white', 'bkgd', 491),
(279, 643, 'white', 'bkgd', 487),
(280, 643, 'white', 'bkgd', 24),
(281, 643, 'white', 'bkgd', 155),
(282, 643, 'white', 'bkgd', 42),
(283, 643, 'white', 'bkgd', 25),
(284, 643, 'white', 'bkgd', 51),
(285, 643, 'white', 'bkgd', 261),
(286, 643, 'white', 'bkgd', 253),
(287, 642, 'white', 'bkgd', 457),
(288, 642, 'white', 'bkgd', 409),
(289, 642, 'white', 'bkgd', 421),
(290, 642, 'white', 'bkgd', 429),
(291, 642, 'white', 'bkgd', 441),
(292, 642, 'white', 'bkgd', 445),
(293, 642, 'white', 'bkgd', 449),
(294, 642, 'white', 'bkgd', 461),
(295, 642, 'white', 'bkgd', 469),
(296, 642, 'white', 'bkgd', 478),
(297, 642, 'white', 'bkgd', 499),
(298, 642, 'white', 'bkgd', 491),
(299, 642, 'white', 'bkgd', 487),
(300, 642, 'white', 'bkgd', 42),
(301, 642, 'white', 'bkgd', 27),
(302, 642, 'white', 'bkgd', 51),
(303, 642, 'white', 'bkgd', 43),
(304, 642, 'white', 'bkgd', 41),
(305, 642, 'white', 'bkgd', 261),
(306, 671, 'white', 'bkgd', 459),
(307, 671, 'white', 'bkgd', 411),
(308, 671, 'white', 'bkgd', 423),
(309, 671, 'white', 'bkgd', 431),
(310, 671, 'white', 'bkgd', 443),
(311, 671, 'white', 'bkgd', 447),
(312, 671, 'white', 'bkgd', 451),
(313, 671, 'white', 'bkgd', 463),
(314, 671, 'white', 'bkgd', 471),
(315, 671, 'white', 'bkgd', 480),
(316, 671, 'white', 'bkgd', 501),
(317, 671, 'white', 'bkgd', 493),
(318, 671, 'white', 'bkgd', 489),
(319, 671, 'white', 'bkgd', 84),
(320, 671, 'white', 'bkgd', 78),
(321, 671, 'white', 'bkgd', 93),
(322, 671, 'white', 'bkgd', 85),
(323, 671, 'white', 'bkgd', 83),
(324, 671, 'white', 'bkgd', 286),
(325, 653, 'white', 'bkgd', 391),
(326, 653, 'white', 'bkgd', 395),
(327, 653, 'white', 'bkgd', 87),
(328, 653, 'white', 'bkgd', 459),
(329, 653, 'white', 'bkgd', 411),
(330, 653, 'white', 'bkgd', 415),
(331, 653, 'white', 'bkgd', 419),
(332, 653, 'white', 'bkgd', 423),
(333, 653, 'white', 'bkgd', 431),
(334, 653, 'white', 'bkgd', 427),
(335, 653, 'white', 'bkgd', 435),
(336, 653, 'white', 'bkgd', 439),
(337, 653, 'white', 'bkgd', 443),
(338, 653, 'white', 'bkgd', 447),
(339, 653, 'white', 'bkgd', 407),
(340, 653, 'white', 'bkgd', 451),
(341, 653, 'white', 'bkgd', 455),
(342, 653, 'white', 'bkgd', 463),
(343, 653, 'white', 'bkgd', 467),
(344, 653, 'white', 'bkgd', 471),
(345, 653, 'white', 'bkgd', 476),
(346, 653, 'white', 'bkgd', 480),
(347, 653, 'white', 'bkgd', 486),
(348, 653, 'white', 'bkgd', 484),
(349, 653, 'white', 'bkgd', 140),
(350, 653, 'white', 'bkgd', 501),
(351, 653, 'white', 'bkgd', 497),
(352, 653, 'white', 'bkgd', 493),
(353, 653, 'white', 'bkgd', 489),
(354, 653, 'white', 'bkgd', 95),
(355, 653, 'white', 'bkgd', 75),
(356, 653, 'white', 'bkgd', 139),
(357, 653, 'white', 'bkgd', 84),
(358, 653, 'white', 'bkgd', 77),
(359, 653, 'white', 'bkgd', 142),
(360, 653, 'white', 'bkgd', 78),
(361, 653, 'white', 'bkgd', 80),
(362, 653, 'white', 'bkgd', 76),
(363, 653, 'white', 'bkgd', 93),
(364, 653, 'white', 'bkgd', 81),
(365, 653, 'white', 'bkgd', 85),
(366, 653, 'white', 'bkgd', 83),
(367, 653, 'white', 'bkgd', 286),
(368, 653, 'white', 'bkgd', 276),
(369, 653, 'white', 'bkgd', 278),
(370, 665, 'white', 'bkgd', 391),
(371, 665, 'white', 'bkgd', 459),
(372, 665, 'white', 'bkgd', 411),
(373, 665, 'white', 'bkgd', 419),
(374, 665, 'white', 'bkgd', 423),
(375, 665, 'white', 'bkgd', 431),
(376, 665, 'white', 'bkgd', 435),
(377, 665, 'white', 'bkgd', 439),
(378, 665, 'white', 'bkgd', 443),
(379, 665, 'white', 'bkgd', 447),
(380, 665, 'white', 'bkgd', 407),
(381, 665, 'white', 'bkgd', 476),
(382, 665, 'white', 'bkgd', 140),
(383, 665, 'white', 'bkgd', 501),
(384, 665, 'white', 'bkgd', 497),
(385, 665, 'white', 'bkgd', 493),
(386, 665, 'white', 'bkgd', 489),
(387, 665, 'white', 'bkgd', 95),
(388, 665, 'white', 'bkgd', 75),
(389, 665, 'white', 'bkgd', 84),
(390, 665, 'white', 'bkgd', 139),
(391, 665, 'white', 'bkgd', 77),
(392, 665, 'white', 'bkgd', 142),
(393, 665, 'white', 'bkgd', 76),
(394, 665, 'white', 'bkgd', 78),
(395, 665, 'white', 'bkgd', 93),
(396, 665, 'white', 'bkgd', 81),
(397, 665, 'white', 'bkgd', 286),
(398, 665, 'white', 'bkgd', 276),
(399, 665, 'white', 'bkgd', 278),
(400, 683, 'white', 'bkgd', 391),
(401, 683, 'white', 'bkgd', 463),
(402, 683, 'white', 'bkgd', 501),
(403, 683, 'white', 'bkgd', 140),
(404, 683, 'white', 'bkgd', 139),
(405, 683, 'white', 'bkgd', 84),
(406, 650, 'white', 'bkgd', 391),
(407, 650, 'white', 'bkgd', 403),
(408, 650, 'white', 'bkgd', 87),
(409, 650, 'white', 'bkgd', 459),
(410, 650, 'white', 'bkgd', 415),
(411, 650, 'white', 'bkgd', 419),
(412, 650, 'white', 'bkgd', 443),
(413, 650, 'white', 'bkgd', 463),
(414, 650, 'white', 'bkgd', 467),
(415, 650, 'white', 'bkgd', 501),
(416, 650, 'white', 'bkgd', 497),
(417, 650, 'white', 'bkgd', 493),
(418, 650, 'white', 'bkgd', 489),
(419, 650, 'white', 'bkgd', 95),
(420, 650, 'white', 'bkgd', 84),
(421, 650, 'white', 'bkgd', 76),
(422, 650, 'white', 'bkgd', 80),
(423, 650, 'white', 'bkgd', 93),
(424, 650, 'white', 'bkgd', 286),
(425, 650, 'white', 'bkgd', 276),
(426, 650, 'white', 'bkgd', 278),
(427, 656, 'white', 'bkgd', 459),
(428, 656, 'white', 'bkgd', 471),
(429, 656, 'white', 'bkgd', 467),
(430, 656, 'white', 'bkgd', 501),
(431, 656, 'white', 'bkgd', 493),
(432, 656, 'white', 'bkgd', 93),
(433, 656, 'white', 'bkgd', 286),
(434, 677, 'white', 'bkgd', 395),
(435, 677, 'white', 'bkgd', 87),
(436, 677, 'white', 'bkgd', 459),
(437, 677, 'white', 'bkgd', 415),
(438, 677, 'white', 'bkgd', 439),
(439, 677, 'white', 'bkgd', 443),
(440, 677, 'white', 'bkgd', 455),
(441, 677, 'white', 'bkgd', 463),
(442, 677, 'white', 'bkgd', 476),
(443, 677, 'white', 'bkgd', 480),
(444, 677, 'white', 'bkgd', 486),
(445, 677, 'white', 'bkgd', 501),
(446, 677, 'white', 'bkgd', 497),
(447, 677, 'white', 'bkgd', 84),
(448, 677, 'white', 'bkgd', 76),
(449, 677, 'white', 'bkgd', 78),
(450, 668, 'white', 'bkgd', 391),
(451, 668, 'white', 'bkgd', 427),
(452, 668, 'white', 'bkgd', 443),
(453, 668, 'white', 'bkgd', 463),
(454, 668, 'white', 'bkgd', 501),
(455, 668, 'white', 'bkgd', 95),
(456, 668, 'white', 'bkgd', 489),
(457, 668, 'white', 'bkgd', 139),
(458, 668, 'white', 'bkgd', 84),
(459, 668, 'white', 'bkgd', 93),
(460, 668, 'white', 'bkgd', 81),
(461, 680, 'white', 'bkgd', 391),
(462, 680, 'white', 'bkgd', 87),
(463, 680, 'white', 'bkgd', 459),
(464, 680, 'white', 'bkgd', 415),
(465, 680, 'white', 'bkgd', 443),
(466, 680, 'white', 'bkgd', 407),
(467, 680, 'white', 'bkgd', 463),
(468, 680, 'white', 'bkgd', 501),
(469, 680, 'white', 'bkgd', 489),
(470, 680, 'white', 'bkgd', 95),
(471, 680, 'white', 'bkgd', 139),
(472, 680, 'white', 'bkgd', 84),
(473, 680, 'white', 'bkgd', 93),
(474, 680, 'white', 'bkgd', 81),
(475, 662, 'white', 'bkgd', 459),
(476, 662, 'white', 'bkgd', 463),
(477, 662, 'white', 'bkgd', 486),
(478, 662, 'white', 'bkgd', 501),
(479, 662, 'white', 'bkgd', 139),
(480, 662, 'white', 'bkgd', 84),
(481, 662, 'white', 'bkgd', 93),
(482, 662, 'white', 'bkgd', 81),
(483, 689, 'white', 'bkgd', 391),
(484, 689, 'white', 'bkgd', 403),
(485, 689, 'white', 'bkgd', 87),
(486, 689, 'white', 'bkgd', 459),
(487, 689, 'white', 'bkgd', 415),
(488, 689, 'white', 'bkgd', 435),
(489, 689, 'white', 'bkgd', 443),
(490, 689, 'white', 'bkgd', 447),
(491, 689, 'white', 'bkgd', 407),
(492, 689, 'white', 'bkgd', 455),
(493, 689, 'white', 'bkgd', 463),
(494, 689, 'white', 'bkgd', 467),
(495, 689, 'white', 'bkgd', 484),
(496, 689, 'white', 'bkgd', 486),
(497, 689, 'white', 'bkgd', 140),
(498, 689, 'white', 'bkgd', 501),
(499, 689, 'white', 'bkgd', 497),
(500, 689, 'white', 'bkgd', 489),
(501, 689, 'white', 'bkgd', 95),
(502, 689, 'white', 'bkgd', 139),
(503, 689, 'white', 'bkgd', 84),
(504, 689, 'white', 'bkgd', 77),
(505, 689, 'white', 'bkgd', 76),
(506, 689, 'white', 'bkgd', 80),
(507, 689, 'white', 'bkgd', 93),
(508, 689, 'white', 'bkgd', 81),
(509, 659, 'white', 'bkgd', 391),
(510, 659, 'white', 'bkgd', 395),
(511, 659, 'white', 'bkgd', 403),
(512, 659, 'white', 'bkgd', 87),
(513, 659, 'white', 'bkgd', 459),
(514, 659, 'white', 'bkgd', 415),
(515, 659, 'white', 'bkgd', 435),
(516, 659, 'white', 'bkgd', 439),
(517, 659, 'white', 'bkgd', 443),
(518, 659, 'white', 'bkgd', 463),
(519, 659, 'white', 'bkgd', 486),
(520, 659, 'white', 'bkgd', 497),
(521, 659, 'white', 'bkgd', 489),
(522, 659, 'white', 'bkgd', 84),
(523, 659, 'white', 'bkgd', 77),
(524, 659, 'white', 'bkgd', 76),
(525, 674, 'white', 'bkgd', 403),
(526, 674, 'white', 'bkgd', 87),
(527, 674, 'white', 'bkgd', 459),
(528, 674, 'white', 'bkgd', 415),
(529, 674, 'white', 'bkgd', 419),
(530, 674, 'white', 'bkgd', 439),
(531, 674, 'white', 'bkgd', 443),
(532, 674, 'white', 'bkgd', 463),
(533, 674, 'white', 'bkgd', 467),
(534, 674, 'white', 'bkgd', 493),
(535, 674, 'white', 'bkgd', 489),
(536, 674, 'white', 'bkgd', 75),
(537, 674, 'white', 'bkgd', 84),
(538, 674, 'white', 'bkgd', 139),
(539, 674, 'white', 'bkgd', 76),
(540, 674, 'white', 'bkgd', 93),
(541, 674, 'white', 'bkgd', 286),
(542, 674, 'white', 'bkgd', 278),
(543, 654, 'white', 'bkgd', 392),
(544, 654, 'white', 'bkgd', 396),
(545, 654, 'white', 'bkgd', 108),
(546, 654, 'white', 'bkgd', 460),
(547, 654, 'white', 'bkgd', 412),
(548, 654, 'white', 'bkgd', 420),
(549, 654, 'white', 'bkgd', 424),
(550, 654, 'white', 'bkgd', 416),
(551, 654, 'white', 'bkgd', 428),
(552, 654, 'white', 'bkgd', 432),
(553, 654, 'white', 'bkgd', 436),
(554, 654, 'white', 'bkgd', 440),
(555, 654, 'white', 'bkgd', 444),
(556, 654, 'white', 'bkgd', 448),
(557, 654, 'white', 'bkgd', 408),
(558, 654, 'white', 'bkgd', 452),
(559, 654, 'white', 'bkgd', 456),
(560, 654, 'white', 'bkgd', 464),
(561, 654, 'white', 'bkgd', 468),
(562, 654, 'white', 'bkgd', 473),
(563, 654, 'white', 'bkgd', 477),
(564, 654, 'white', 'bkgd', 481),
(565, 654, 'white', 'bkgd', 11),
(566, 654, 'white', 'bkgd', 485),
(567, 654, 'white', 'bkgd', 148),
(568, 654, 'white', 'bkgd', 500),
(569, 654, 'white', 'bkgd', 496),
(570, 654, 'white', 'bkgd', 494),
(571, 654, 'white', 'bkgd', 490),
(572, 654, 'white', 'bkgd', 116),
(573, 654, 'white', 'bkgd', 96),
(574, 654, 'white', 'bkgd', 147),
(575, 654, 'white', 'bkgd', 105),
(576, 654, 'white', 'bkgd', 98),
(577, 654, 'white', 'bkgd', 150),
(578, 654, 'white', 'bkgd', 97),
(579, 654, 'white', 'bkgd', 99),
(580, 654, 'white', 'bkgd', 101),
(581, 654, 'white', 'bkgd', 114),
(582, 654, 'white', 'bkgd', 102),
(583, 654, 'white', 'bkgd', 106),
(584, 654, 'white', 'bkgd', 104),
(585, 654, 'white', 'bkgd', 298),
(586, 654, 'white', 'bkgd', 289),
(587, 654, 'white', 'bkgd', 291),
(588, 666, 'white', 'bkgd', 392),
(589, 666, 'white', 'bkgd', 460),
(590, 666, 'white', 'bkgd', 412),
(591, 666, 'white', 'bkgd', 420),
(592, 666, 'white', 'bkgd', 424),
(593, 666, 'white', 'bkgd', 432),
(594, 666, 'white', 'bkgd', 436),
(595, 666, 'white', 'bkgd', 440),
(596, 666, 'white', 'bkgd', 444),
(597, 666, 'white', 'bkgd', 448),
(598, 666, 'white', 'bkgd', 408),
(599, 666, 'white', 'bkgd', 477),
(600, 666, 'white', 'bkgd', 148),
(601, 666, 'white', 'bkgd', 500),
(602, 666, 'white', 'bkgd', 496),
(603, 666, 'white', 'bkgd', 494),
(604, 666, 'white', 'bkgd', 490),
(605, 666, 'white', 'bkgd', 116),
(606, 666, 'white', 'bkgd', 96),
(607, 666, 'white', 'bkgd', 147),
(608, 666, 'white', 'bkgd', 105),
(609, 666, 'white', 'bkgd', 98),
(610, 666, 'white', 'bkgd', 150),
(611, 666, 'white', 'bkgd', 97),
(612, 666, 'white', 'bkgd', 99),
(613, 666, 'white', 'bkgd', 114),
(614, 666, 'white', 'bkgd', 102),
(615, 666, 'white', 'bkgd', 298),
(616, 666, 'white', 'bkgd', 289),
(617, 666, 'white', 'bkgd', 291),
(618, 684, 'white', 'bkgd', 392),
(619, 684, 'white', 'bkgd', 464),
(620, 684, 'white', 'bkgd', 500),
(621, 684, 'white', 'bkgd', 147),
(622, 684, 'white', 'bkgd', 105),
(623, 651, 'white', 'bkgd', 392),
(624, 651, 'white', 'bkgd', 404),
(625, 651, 'white', 'bkgd', 108),
(626, 651, 'white', 'bkgd', 460),
(627, 651, 'white', 'bkgd', 416),
(628, 651, 'white', 'bkgd', 420),
(629, 651, 'white', 'bkgd', 444),
(630, 651, 'white', 'bkgd', 464),
(631, 651, 'white', 'bkgd', 468),
(632, 651, 'white', 'bkgd', 500),
(633, 651, 'white', 'bkgd', 496),
(634, 651, 'white', 'bkgd', 494),
(635, 651, 'white', 'bkgd', 490),
(636, 651, 'white', 'bkgd', 105),
(637, 651, 'white', 'bkgd', 97),
(638, 651, 'white', 'bkgd', 101),
(639, 651, 'white', 'bkgd', 114),
(640, 651, 'white', 'bkgd', 298),
(641, 651, 'white', 'bkgd', 289),
(642, 651, 'white', 'bkgd', 291),
(643, 657, 'white', 'bkgd', 460),
(644, 657, 'white', 'bkgd', 473),
(645, 657, 'white', 'bkgd', 468),
(646, 657, 'white', 'bkgd', 500),
(647, 657, 'white', 'bkgd', 494),
(648, 657, 'white', 'bkgd', 114),
(649, 657, 'white', 'bkgd', 298),
(650, 678, 'white', 'bkgd', 396),
(651, 678, 'white', 'bkgd', 108),
(652, 678, 'white', 'bkgd', 460),
(653, 678, 'white', 'bkgd', 416),
(654, 678, 'white', 'bkgd', 440),
(655, 678, 'white', 'bkgd', 444),
(656, 678, 'white', 'bkgd', 456),
(657, 678, 'white', 'bkgd', 464),
(658, 678, 'white', 'bkgd', 477),
(659, 678, 'white', 'bkgd', 481),
(660, 678, 'white', 'bkgd', 11),
(661, 678, 'white', 'bkgd', 500),
(662, 678, 'white', 'bkgd', 496),
(663, 678, 'white', 'bkgd', 105),
(664, 678, 'white', 'bkgd', 97),
(665, 678, 'white', 'bkgd', 99),
(666, 669, 'white', 'bkgd', 392),
(667, 669, 'white', 'bkgd', 428),
(668, 669, 'white', 'bkgd', 444),
(669, 669, 'white', 'bkgd', 464),
(670, 669, 'white', 'bkgd', 500),
(671, 669, 'white', 'bkgd', 116),
(672, 669, 'white', 'bkgd', 490),
(673, 669, 'white', 'bkgd', 147),
(674, 669, 'white', 'bkgd', 105),
(675, 669, 'white', 'bkgd', 102),
(676, 669, 'white', 'bkgd', 114),
(677, 681, 'white', 'bkgd', 392),
(678, 681, 'white', 'bkgd', 108),
(679, 681, 'white', 'bkgd', 460),
(680, 681, 'white', 'bkgd', 416),
(681, 681, 'white', 'bkgd', 444),
(682, 681, 'white', 'bkgd', 408),
(683, 681, 'white', 'bkgd', 464),
(684, 681, 'white', 'bkgd', 500),
(685, 681, 'white', 'bkgd', 490),
(686, 681, 'white', 'bkgd', 116),
(687, 681, 'white', 'bkgd', 147),
(688, 681, 'white', 'bkgd', 105),
(689, 681, 'white', 'bkgd', 114),
(690, 681, 'white', 'bkgd', 102),
(691, 663, 'white', 'bkgd', 460),
(692, 663, 'white', 'bkgd', 464),
(693, 663, 'white', 'bkgd', 11),
(694, 663, 'white', 'bkgd', 500),
(695, 663, 'white', 'bkgd', 496),
(696, 663, 'white', 'bkgd', 105),
(697, 663, 'white', 'bkgd', 114),
(698, 663, 'white', 'bkgd', 102),
(699, 690, 'white', 'bkgd', 392),
(700, 690, 'white', 'bkgd', 404),
(701, 690, 'white', 'bkgd', 108),
(702, 690, 'white', 'bkgd', 460),
(703, 690, 'white', 'bkgd', 416),
(704, 690, 'white', 'bkgd', 436),
(705, 690, 'white', 'bkgd', 444),
(706, 690, 'white', 'bkgd', 448),
(707, 690, 'white', 'bkgd', 408),
(708, 690, 'white', 'bkgd', 456),
(709, 690, 'white', 'bkgd', 464),
(710, 690, 'white', 'bkgd', 468),
(711, 690, 'white', 'bkgd', 485),
(712, 690, 'white', 'bkgd', 11),
(713, 690, 'white', 'bkgd', 148),
(714, 690, 'white', 'bkgd', 500),
(715, 690, 'white', 'bkgd', 496),
(716, 690, 'white', 'bkgd', 490),
(717, 690, 'white', 'bkgd', 116),
(718, 690, 'white', 'bkgd', 147),
(719, 690, 'white', 'bkgd', 105),
(720, 690, 'white', 'bkgd', 98),
(721, 690, 'white', 'bkgd', 97),
(722, 690, 'white', 'bkgd', 101),
(723, 690, 'white', 'bkgd', 114),
(724, 690, 'white', 'bkgd', 102),
(725, 660, 'white', 'bkgd', 392),
(726, 660, 'white', 'bkgd', 396),
(727, 660, 'white', 'bkgd', 404),
(728, 660, 'white', 'bkgd', 108),
(729, 660, 'white', 'bkgd', 460),
(730, 660, 'white', 'bkgd', 416),
(731, 660, 'white', 'bkgd', 436),
(732, 660, 'white', 'bkgd', 440),
(733, 660, 'white', 'bkgd', 444),
(734, 660, 'white', 'bkgd', 464),
(735, 660, 'white', 'bkgd', 11),
(736, 660, 'white', 'bkgd', 496),
(737, 660, 'white', 'bkgd', 490),
(738, 660, 'white', 'bkgd', 105),
(739, 660, 'white', 'bkgd', 98),
(740, 660, 'white', 'bkgd', 97),
(741, 675, 'white', 'bkgd', 404),
(742, 675, 'white', 'bkgd', 460),
(743, 675, 'white', 'bkgd', 108),
(744, 675, 'white', 'bkgd', 416),
(745, 675, 'white', 'bkgd', 420),
(746, 675, 'white', 'bkgd', 440),
(747, 675, 'white', 'bkgd', 444),
(748, 675, 'white', 'bkgd', 464),
(749, 675, 'white', 'bkgd', 468),
(750, 675, 'white', 'bkgd', 494),
(751, 675, 'white', 'bkgd', 490),
(752, 675, 'white', 'bkgd', 96),
(753, 675, 'white', 'bkgd', 147),
(754, 675, 'white', 'bkgd', 105),
(755, 675, 'white', 'bkgd', 97),
(756, 675, 'white', 'bkgd', 114),
(757, 675, 'white', 'bkgd', 298),
(758, 675, 'white', 'bkgd', 291),
(759, 672, 'white', 'bkgd', 460),
(760, 672, 'white', 'bkgd', 412),
(761, 672, 'white', 'bkgd', 424),
(762, 672, 'white', 'bkgd', 432),
(763, 672, 'white', 'bkgd', 444),
(764, 672, 'white', 'bkgd', 448),
(765, 672, 'white', 'bkgd', 452),
(766, 672, 'white', 'bkgd', 464),
(767, 672, 'white', 'bkgd', 473),
(768, 672, 'white', 'bkgd', 481),
(769, 672, 'white', 'bkgd', 500),
(770, 672, 'white', 'bkgd', 494),
(771, 672, 'white', 'bkgd', 490),
(772, 672, 'white', 'bkgd', 105),
(773, 672, 'white', 'bkgd', 99),
(774, 672, 'white', 'bkgd', 114),
(775, 672, 'white', 'bkgd', 106),
(776, 672, 'white', 'bkgd', 104),
(777, 672, 'white', 'bkgd', 298),
(778, 655, 'white', 'bkgd', 392),
(779, 655, 'white', 'bkgd', 396),
(780, 655, 'white', 'bkgd', 460),
(781, 655, 'white', 'bkgd', 108),
(782, 655, 'white', 'bkgd', 412),
(783, 655, 'white', 'bkgd', 416),
(784, 655, 'white', 'bkgd', 420),
(785, 655, 'white', 'bkgd', 424),
(786, 655, 'white', 'bkgd', 428),
(787, 655, 'white', 'bkgd', 432),
(788, 655, 'white', 'bkgd', 436),
(789, 655, 'white', 'bkgd', 440),
(790, 655, 'white', 'bkgd', 448),
(791, 655, 'white', 'bkgd', 444),
(792, 655, 'white', 'bkgd', 408),
(793, 655, 'white', 'bkgd', 452),
(794, 655, 'white', 'bkgd', 456),
(795, 655, 'white', 'bkgd', 464),
(796, 655, 'white', 'bkgd', 468),
(797, 655, 'white', 'bkgd', 473),
(798, 655, 'white', 'bkgd', 477),
(799, 655, 'white', 'bkgd', 481),
(800, 655, 'white', 'bkgd', 485),
(801, 655, 'white', 'bkgd', 11),
(802, 655, 'white', 'bkgd', 148),
(803, 655, 'white', 'bkgd', 500),
(804, 655, 'white', 'bkgd', 496),
(805, 655, 'white', 'bkgd', 494),
(806, 655, 'white', 'bkgd', 490),
(807, 655, 'white', 'bkgd', 116),
(808, 655, 'white', 'bkgd', 96),
(809, 655, 'white', 'bkgd', 105),
(810, 655, 'white', 'bkgd', 147),
(811, 655, 'white', 'bkgd', 98),
(812, 655, 'white', 'bkgd', 150),
(813, 655, 'white', 'bkgd', 97),
(814, 655, 'white', 'bkgd', 99),
(815, 655, 'white', 'bkgd', 101),
(816, 655, 'white', 'bkgd', 114),
(817, 655, 'white', 'bkgd', 102),
(818, 655, 'white', 'bkgd', 106),
(819, 655, 'white', 'bkgd', 104),
(820, 655, 'white', 'bkgd', 298),
(821, 655, 'white', 'bkgd', 289),
(822, 655, 'white', 'bkgd', 291),
(823, 667, 'white', 'bkgd', 392),
(824, 667, 'white', 'bkgd', 460),
(825, 667, 'white', 'bkgd', 412),
(826, 667, 'white', 'bkgd', 420),
(827, 667, 'white', 'bkgd', 424),
(828, 667, 'white', 'bkgd', 432),
(829, 667, 'white', 'bkgd', 436),
(830, 667, 'white', 'bkgd', 440),
(831, 667, 'white', 'bkgd', 444),
(832, 667, 'white', 'bkgd', 448),
(833, 667, 'white', 'bkgd', 408),
(834, 667, 'white', 'bkgd', 477),
(835, 667, 'white', 'bkgd', 148),
(836, 667, 'white', 'bkgd', 500),
(837, 667, 'white', 'bkgd', 496),
(838, 667, 'white', 'bkgd', 494),
(839, 667, 'white', 'bkgd', 490),
(840, 667, 'white', 'bkgd', 116),
(841, 667, 'white', 'bkgd', 96),
(842, 667, 'white', 'bkgd', 147),
(843, 667, 'white', 'bkgd', 105),
(844, 667, 'white', 'bkgd', 98),
(845, 667, 'white', 'bkgd', 150),
(846, 667, 'white', 'bkgd', 97),
(847, 667, 'white', 'bkgd', 99),
(848, 667, 'white', 'bkgd', 114),
(849, 667, 'white', 'bkgd', 102),
(850, 667, 'white', 'bkgd', 298),
(851, 667, 'white', 'bkgd', 289),
(852, 667, 'white', 'bkgd', 291),
(853, 685, 'white', 'bkgd', 392),
(854, 685, 'white', 'bkgd', 464),
(855, 685, 'white', 'bkgd', 500),
(856, 685, 'white', 'bkgd', 148),
(857, 685, 'white', 'bkgd', 147),
(858, 685, 'white', 'bkgd', 105),
(859, 652, 'white', 'bkgd', 392),
(860, 652, 'white', 'bkgd', 404),
(861, 652, 'white', 'bkgd', 108),
(862, 652, 'white', 'bkgd', 460),
(863, 652, 'white', 'bkgd', 416),
(864, 652, 'white', 'bkgd', 420),
(865, 652, 'white', 'bkgd', 444),
(866, 652, 'white', 'bkgd', 464),
(867, 652, 'white', 'bkgd', 468),
(868, 652, 'white', 'bkgd', 500),
(869, 652, 'white', 'bkgd', 496),
(870, 652, 'white', 'bkgd', 494),
(871, 652, 'white', 'bkgd', 490),
(872, 652, 'white', 'bkgd', 116),
(873, 652, 'white', 'bkgd', 105),
(874, 652, 'white', 'bkgd', 97),
(875, 652, 'white', 'bkgd', 101),
(876, 652, 'white', 'bkgd', 114),
(877, 652, 'white', 'bkgd', 298),
(878, 652, 'white', 'bkgd', 289),
(879, 652, 'white', 'bkgd', 291),
(880, 658, 'white', 'bkgd', 460),
(881, 658, 'white', 'bkgd', 473),
(882, 658, 'white', 'bkgd', 468),
(883, 658, 'white', 'bkgd', 500),
(884, 658, 'white', 'bkgd', 494),
(885, 658, 'white', 'bkgd', 114),
(886, 658, 'white', 'bkgd', 298),
(887, 679, 'white', 'bkgd', 396),
(888, 679, 'white', 'bkgd', 108),
(889, 679, 'white', 'bkgd', 460),
(890, 679, 'white', 'bkgd', 416),
(891, 679, 'white', 'bkgd', 440),
(892, 679, 'white', 'bkgd', 444),
(893, 679, 'white', 'bkgd', 456),
(894, 679, 'white', 'bkgd', 464),
(895, 679, 'white', 'bkgd', 477),
(896, 679, 'white', 'bkgd', 481),
(897, 679, 'white', 'bkgd', 11),
(898, 679, 'white', 'bkgd', 500),
(899, 679, 'white', 'bkgd', 496),
(900, 679, 'white', 'bkgd', 105),
(901, 679, 'white', 'bkgd', 97),
(902, 679, 'white', 'bkgd', 99),
(903, 670, 'white', 'bkgd', 392),
(904, 670, 'white', 'bkgd', 428),
(905, 670, 'white', 'bkgd', 444),
(906, 670, 'white', 'bkgd', 464),
(907, 670, 'white', 'bkgd', 500),
(908, 670, 'white', 'bkgd', 116),
(909, 670, 'white', 'bkgd', 490),
(910, 670, 'white', 'bkgd', 147),
(911, 670, 'white', 'bkgd', 105),
(912, 670, 'white', 'bkgd', 114),
(913, 670, 'white', 'bkgd', 102),
(914, 682, 'white', 'bkgd', 392),
(915, 682, 'white', 'bkgd', 108),
(916, 682, 'white', 'bkgd', 460),
(917, 682, 'white', 'bkgd', 416),
(918, 682, 'white', 'bkgd', 444),
(919, 682, 'white', 'bkgd', 408),
(920, 682, 'white', 'bkgd', 464),
(921, 682, 'white', 'bkgd', 500),
(922, 682, 'white', 'bkgd', 490),
(923, 682, 'white', 'bkgd', 116),
(924, 682, 'white', 'bkgd', 147),
(925, 682, 'white', 'bkgd', 105),
(926, 682, 'white', 'bkgd', 114),
(927, 682, 'white', 'bkgd', 102),
(928, 664, 'white', 'bkgd', 460),
(929, 664, 'white', 'bkgd', 464),
(930, 664, 'white', 'bkgd', 11),
(931, 664, 'white', 'bkgd', 500),
(932, 664, 'white', 'bkgd', 147),
(933, 664, 'white', 'bkgd', 105),
(934, 664, 'white', 'bkgd', 114),
(935, 664, 'white', 'bkgd', 102),
(936, 691, 'white', 'bkgd', 404),
(937, 691, 'white', 'bkgd', 108),
(938, 691, 'white', 'bkgd', 460),
(939, 691, 'white', 'bkgd', 416),
(940, 691, 'white', 'bkgd', 436),
(941, 691, 'white', 'bkgd', 444),
(942, 691, 'white', 'bkgd', 448),
(943, 691, 'white', 'bkgd', 408),
(944, 691, 'white', 'bkgd', 456),
(945, 691, 'white', 'bkgd', 464),
(946, 691, 'white', 'bkgd', 468),
(947, 691, 'white', 'bkgd', 485),
(948, 691, 'white', 'bkgd', 11),
(949, 691, 'white', 'bkgd', 148),
(950, 691, 'white', 'bkgd', 500),
(951, 691, 'white', 'bkgd', 496),
(952, 691, 'white', 'bkgd', 490),
(953, 691, 'white', 'bkgd', 116),
(954, 691, 'white', 'bkgd', 147),
(955, 691, 'white', 'bkgd', 105),
(956, 691, 'white', 'bkgd', 98),
(957, 691, 'white', 'bkgd', 97),
(958, 691, 'white', 'bkgd', 101),
(959, 691, 'white', 'bkgd', 114),
(960, 691, 'white', 'bkgd', 102),
(961, 661, 'white', 'bkgd', 392),
(962, 661, 'white', 'bkgd', 396),
(963, 661, 'white', 'bkgd', 404),
(964, 661, 'white', 'bkgd', 460),
(965, 661, 'white', 'bkgd', 108),
(966, 661, 'white', 'bkgd', 416),
(967, 661, 'white', 'bkgd', 436),
(968, 661, 'white', 'bkgd', 440),
(969, 661, 'white', 'bkgd', 444),
(970, 661, 'white', 'bkgd', 464),
(971, 661, 'white', 'bkgd', 11),
(972, 661, 'white', 'bkgd', 496),
(973, 661, 'white', 'bkgd', 490),
(974, 661, 'white', 'bkgd', 105),
(975, 661, 'white', 'bkgd', 98),
(976, 661, 'white', 'bkgd', 97),
(977, 676, 'white', 'bkgd', 404),
(978, 676, 'white', 'bkgd', 108),
(979, 676, 'white', 'bkgd', 460),
(980, 676, 'white', 'bkgd', 416),
(981, 676, 'white', 'bkgd', 420),
(982, 676, 'white', 'bkgd', 440),
(983, 676, 'white', 'bkgd', 444),
(984, 676, 'white', 'bkgd', 464),
(985, 676, 'white', 'bkgd', 468),
(986, 676, 'white', 'bkgd', 494),
(987, 676, 'white', 'bkgd', 490),
(988, 676, 'white', 'bkgd', 96),
(989, 676, 'white', 'bkgd', 105),
(990, 676, 'white', 'bkgd', 147),
(991, 676, 'white', 'bkgd', 97),
(992, 676, 'white', 'bkgd', 114),
(993, 676, 'white', 'bkgd', 298),
(994, 676, 'white', 'bkgd', 291),
(995, 673, 'white', 'bkgd', 460),
(996, 673, 'white', 'bkgd', 412),
(997, 673, 'white', 'bkgd', 424),
(998, 673, 'white', 'bkgd', 432),
(999, 673, 'white', 'bkgd', 444),
(1000, 673, 'white', 'bkgd', 448),
(1001, 673, 'white', 'bkgd', 452),
(1002, 673, 'white', 'bkgd', 464),
(1003, 673, 'white', 'bkgd', 473),
(1004, 673, 'white', 'bkgd', 481),
(1005, 673, 'white', 'bkgd', 500),
(1006, 673, 'white', 'bkgd', 494),
(1007, 673, 'white', 'bkgd', 490),
(1008, 673, 'white', 'bkgd', 105),
(1009, 673, 'white', 'bkgd', 99),
(1010, 673, 'white', 'bkgd', 114),
(1011, 673, 'white', 'bkgd', 106),
(1012, 673, 'white', 'bkgd', 104),
(1013, 673, 'white', 'bkgd', 298),
(1014, 654, 'white', 'bkgd', 737),
(1015, 678, 'white', 'bkgd', 737),
(1016, 660, 'white', 'bkgd', 737),
(1017, 648, 'white', 'bkgd', 735),
(1018, 644, 'white', 'bkgd', 735),
(1019, 639, 'white', 'bkgd', 735),
(1020, 653, 'white', 'bkgd', 736),
(1021, 677, 'white', 'bkgd', 736),
(1022, 659, 'white', 'bkgd', 736),
(1023, 654, 'white', 'bkgd', 734),
(1024, 651, 'white', 'bkgd', 734),
(1025, 666, 'white', 'bkgd', 734),
(1026, 681, 'white', 'bkgd', 734),
(1027, 675, 'white', 'bkgd', 734),
(1028, 653, 'white', 'bkgd', 733),
(1029, 665, 'white', 'bkgd', 733),
(1030, 650, 'white', 'bkgd', 733),
(1031, 680, 'white', 'bkgd', 733),
(1032, 674, 'white', 'bkgd', 733),
(1033, 648, 'white', 'bkgd', 732),
(1034, 636, 'white', 'bkgd', 732),
(1035, 637, 'white', 'bkgd', 732),
(1036, 643, 'white', 'bkgd', 732),
(1037, 645, 'white', 'bkgd', 732),
(1038, 654, 'white', 'bkgd', 731),
(1039, 666, 'white', 'bkgd', 731),
(1040, 678, 'white', 'bkgd', 731),
(1041, 660, 'white', 'bkgd', 731),
(1042, 653, 'white', 'bkgd', 730),
(1043, 665, 'white', 'bkgd', 730),
(1044, 677, 'white', 'bkgd', 730),
(1045, 659, 'white', 'bkgd', 730),
(1046, 648, 'white', 'bkgd', 729),
(1047, 636, 'white', 'bkgd', 729),
(1048, 644, 'white', 'bkgd', 729),
(1049, 639, 'white', 'bkgd', 729),
(1050, 654, 'white', 'bkgd', 728),
(1051, 666, 'white', 'bkgd', 728),
(1052, 657, 'white', 'bkgd', 728),
(1053, 678, 'white', 'bkgd', 728),
(1054, 672, 'white', 'bkgd', 728),
(1055, 653, 'white', 'bkgd', 727),
(1056, 665, 'white', 'bkgd', 727),
(1057, 656, 'white', 'bkgd', 727),
(1058, 677, 'white', 'bkgd', 727),
(1059, 671, 'white', 'bkgd', 727),
(1060, 648, 'white', 'bkgd', 726),
(1061, 636, 'white', 'bkgd', 726),
(1062, 638, 'white', 'bkgd', 726),
(1063, 644, 'white', 'bkgd', 726),
(1064, 642, 'white', 'bkgd', 726),
(1065, 654, 'white', 'bkgd', 725),
(1066, 666, 'white', 'bkgd', 725),
(1067, 672, 'white', 'bkgd', 725),
(1068, 653, 'white', 'bkgd', 724),
(1069, 665, 'white', 'bkgd', 724),
(1070, 671, 'white', 'bkgd', 724),
(1071, 648, 'white', 'bkgd', 723),
(1072, 636, 'white', 'bkgd', 723),
(1073, 642, 'white', 'bkgd', 723),
(1074, 653, 'white', 'bkgd', 721),
(1075, 665, 'white', 'bkgd', 721),
(1076, 650, 'white', 'bkgd', 721),
(1077, 674, 'white', 'bkgd', 721),
(1078, 671, 'white', 'bkgd', 721),
(1079, 654, 'white', 'bkgd', 722),
(1080, 666, 'white', 'bkgd', 722),
(1081, 651, 'white', 'bkgd', 722),
(1082, 675, 'white', 'bkgd', 722),
(1083, 672, 'white', 'bkgd', 722),
(1084, 648, 'white', 'bkgd', 720),
(1085, 636, 'white', 'bkgd', 720),
(1086, 637, 'white', 'bkgd', 720),
(1087, 643, 'white', 'bkgd', 720),
(1088, 642, 'white', 'bkgd', 720),
(1089, 738, 'white', 'bkgd', 743),
(1090, 738, 'white', 'bkgd', 744),
(1092, 738, 'white', 'bkgd', 746);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_00`
--

CREATE TABLE IF NOT EXISTS `tbl_user_00` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_01`
--

CREATE TABLE IF NOT EXISTS `tbl_user_01` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_02`
--

CREATE TABLE IF NOT EXISTS `tbl_user_02` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_03`
--

CREATE TABLE IF NOT EXISTS `tbl_user_03` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_04`
--

CREATE TABLE IF NOT EXISTS `tbl_user_04` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_05`
--

CREATE TABLE IF NOT EXISTS `tbl_user_05` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_06`
--

CREATE TABLE IF NOT EXISTS `tbl_user_06` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_07`
--

CREATE TABLE IF NOT EXISTS `tbl_user_07` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_08`
--

CREATE TABLE IF NOT EXISTS `tbl_user_08` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_09`
--

CREATE TABLE IF NOT EXISTS `tbl_user_09` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_10`
--

CREATE TABLE IF NOT EXISTS `tbl_user_10` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_11`
--

CREATE TABLE IF NOT EXISTS `tbl_user_11` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_12`
--

CREATE TABLE IF NOT EXISTS `tbl_user_12` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_13`
--

CREATE TABLE IF NOT EXISTS `tbl_user_13` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_14`
--

CREATE TABLE IF NOT EXISTS `tbl_user_14` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_15`
--

CREATE TABLE IF NOT EXISTS `tbl_user_15` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_16`
--

CREATE TABLE IF NOT EXISTS `tbl_user_16` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_17`
--

CREATE TABLE IF NOT EXISTS `tbl_user_17` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_18`
--

CREATE TABLE IF NOT EXISTS `tbl_user_18` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_19`
--

CREATE TABLE IF NOT EXISTS `tbl_user_19` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_20`
--

CREATE TABLE IF NOT EXISTS `tbl_user_20` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_21`
--

CREATE TABLE IF NOT EXISTS `tbl_user_21` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_22`
--

CREATE TABLE IF NOT EXISTS `tbl_user_22` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_23`
--

CREATE TABLE IF NOT EXISTS `tbl_user_23` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_24`
--

CREATE TABLE IF NOT EXISTS `tbl_user_24` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_25`
--

CREATE TABLE IF NOT EXISTS `tbl_user_25` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_26`
--

CREATE TABLE IF NOT EXISTS `tbl_user_26` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_27`
--

CREATE TABLE IF NOT EXISTS `tbl_user_27` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_28`
--

CREATE TABLE IF NOT EXISTS `tbl_user_28` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_29`
--

CREATE TABLE IF NOT EXISTS `tbl_user_29` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_30`
--

CREATE TABLE IF NOT EXISTS `tbl_user_30` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_31`
--

CREATE TABLE IF NOT EXISTS `tbl_user_31` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_32`
--

CREATE TABLE IF NOT EXISTS `tbl_user_32` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_33`
--

CREATE TABLE IF NOT EXISTS `tbl_user_33` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_34`
--

CREATE TABLE IF NOT EXISTS `tbl_user_34` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_35`
--

CREATE TABLE IF NOT EXISTS `tbl_user_35` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_36`
--

CREATE TABLE IF NOT EXISTS `tbl_user_36` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_37`
--

CREATE TABLE IF NOT EXISTS `tbl_user_37` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_38`
--

CREATE TABLE IF NOT EXISTS `tbl_user_38` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_39`
--

CREATE TABLE IF NOT EXISTS `tbl_user_39` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_40`
--

CREATE TABLE IF NOT EXISTS `tbl_user_40` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_41`
--

CREATE TABLE IF NOT EXISTS `tbl_user_41` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_42`
--

CREATE TABLE IF NOT EXISTS `tbl_user_42` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_43`
--

CREATE TABLE IF NOT EXISTS `tbl_user_43` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_44`
--

CREATE TABLE IF NOT EXISTS `tbl_user_44` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_45`
--

CREATE TABLE IF NOT EXISTS `tbl_user_45` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_46`
--

CREATE TABLE IF NOT EXISTS `tbl_user_46` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_47`
--

CREATE TABLE IF NOT EXISTS `tbl_user_47` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_48`
--

CREATE TABLE IF NOT EXISTS `tbl_user_48` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_49`
--

CREATE TABLE IF NOT EXISTS `tbl_user_49` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_50`
--

CREATE TABLE IF NOT EXISTS `tbl_user_50` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_51`
--

CREATE TABLE IF NOT EXISTS `tbl_user_51` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_52`
--

CREATE TABLE IF NOT EXISTS `tbl_user_52` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_53`
--

CREATE TABLE IF NOT EXISTS `tbl_user_53` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_54`
--

CREATE TABLE IF NOT EXISTS `tbl_user_54` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_55`
--

CREATE TABLE IF NOT EXISTS `tbl_user_55` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_56`
--

CREATE TABLE IF NOT EXISTS `tbl_user_56` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_57`
--

CREATE TABLE IF NOT EXISTS `tbl_user_57` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_58`
--

CREATE TABLE IF NOT EXISTS `tbl_user_58` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_59`
--

CREATE TABLE IF NOT EXISTS `tbl_user_59` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_60`
--

CREATE TABLE IF NOT EXISTS `tbl_user_60` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_61`
--

CREATE TABLE IF NOT EXISTS `tbl_user_61` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_62`
--

CREATE TABLE IF NOT EXISTS `tbl_user_62` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_63`
--

CREATE TABLE IF NOT EXISTS `tbl_user_63` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_64`
--

CREATE TABLE IF NOT EXISTS `tbl_user_64` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_65`
--

CREATE TABLE IF NOT EXISTS `tbl_user_65` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_66`
--

CREATE TABLE IF NOT EXISTS `tbl_user_66` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_67`
--

CREATE TABLE IF NOT EXISTS `tbl_user_67` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_68`
--

CREATE TABLE IF NOT EXISTS `tbl_user_68` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_69`
--

CREATE TABLE IF NOT EXISTS `tbl_user_69` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_70`
--

CREATE TABLE IF NOT EXISTS `tbl_user_70` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_71`
--

CREATE TABLE IF NOT EXISTS `tbl_user_71` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_72`
--

CREATE TABLE IF NOT EXISTS `tbl_user_72` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_73`
--

CREATE TABLE IF NOT EXISTS `tbl_user_73` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_74`
--

CREATE TABLE IF NOT EXISTS `tbl_user_74` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_75`
--

CREATE TABLE IF NOT EXISTS `tbl_user_75` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_76`
--

CREATE TABLE IF NOT EXISTS `tbl_user_76` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_77`
--

CREATE TABLE IF NOT EXISTS `tbl_user_77` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_78`
--

CREATE TABLE IF NOT EXISTS `tbl_user_78` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_79`
--

CREATE TABLE IF NOT EXISTS `tbl_user_79` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_80`
--

CREATE TABLE IF NOT EXISTS `tbl_user_80` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_81`
--

CREATE TABLE IF NOT EXISTS `tbl_user_81` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_82`
--

CREATE TABLE IF NOT EXISTS `tbl_user_82` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_83`
--

CREATE TABLE IF NOT EXISTS `tbl_user_83` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_84`
--

CREATE TABLE IF NOT EXISTS `tbl_user_84` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_85`
--

CREATE TABLE IF NOT EXISTS `tbl_user_85` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_86`
--

CREATE TABLE IF NOT EXISTS `tbl_user_86` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_87`
--

CREATE TABLE IF NOT EXISTS `tbl_user_87` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_88`
--

CREATE TABLE IF NOT EXISTS `tbl_user_88` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_89`
--

CREATE TABLE IF NOT EXISTS `tbl_user_89` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_90`
--

CREATE TABLE IF NOT EXISTS `tbl_user_90` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_91`
--

CREATE TABLE IF NOT EXISTS `tbl_user_91` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_92`
--

CREATE TABLE IF NOT EXISTS `tbl_user_92` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_93`
--

CREATE TABLE IF NOT EXISTS `tbl_user_93` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_94`
--

CREATE TABLE IF NOT EXISTS `tbl_user_94` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_95`
--

CREATE TABLE IF NOT EXISTS `tbl_user_95` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_96`
--

CREATE TABLE IF NOT EXISTS `tbl_user_96` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_97`
--

CREATE TABLE IF NOT EXISTS `tbl_user_97` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_98`
--

CREATE TABLE IF NOT EXISTS `tbl_user_98` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_99`
--

CREATE TABLE IF NOT EXISTS `tbl_user_99` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `passwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0正常1禁言',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '注册渠道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_attribute`
--

CREATE TABLE IF NOT EXISTS `tbl_user_attribute` (
`Id` int(11) NOT NULL,
  `userId` bigint(16) NOT NULL,
  `attrType` varchar(32) NOT NULL,
  `intValue` bigint(16) NOT NULL,
  `charValue` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_config`
--

CREATE TABLE IF NOT EXISTS `tbl_user_config` (
`id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `config` text NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户资源配置表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_count`
--

CREATE TABLE IF NOT EXISTS `tbl_user_count` (
`id` int(11) NOT NULL,
  `userid` bigint(14) unsigned NOT NULL,
  `savemoney` float NOT NULL DEFAULT '0',
  `diallogs` int(10) unsigned NOT NULL DEFAULT '0',
  `diallogclear_time` int(10) NOT NULL COMMENT '话单清除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_country`
--

CREATE TABLE IF NOT EXISTS `tbl_user_country` (
`id` int(11) NOT NULL,
  `AreaCode` varchar(15) DEFAULT NULL,
  `AreaEname` varchar(150) DEFAULT NULL,
  `AreaName` varchar(150) DEFAULT NULL,
  `UserCode` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_info`
--

CREATE TABLE IF NOT EXISTS `tbl_user_info` (
`id` int(11) unsigned NOT NULL,
  `userid` bigint(14) unsigned NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 NOT NULL,
  `country` varchar(32) CHARACTER SET utf8 NOT NULL,
  `mobile` varchar(32) CHARACTER SET utf8 NOT NULL,
  `name` varchar(32) NOT NULL,
  `sex` varchar(1) CHARACTER SET utf8 NOT NULL COMMENT '1男2女',
  `birthday` date NOT NULL,
  `province` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '所在省份',
  `city` varchar(32) CHARACTER SET utf8 NOT NULL,
  `imageurl` varchar(128) CHARACTER SET utf8 NOT NULL,
  `sign` varchar(255) NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 NOT NULL,
  `qq` varchar(16) CHARACTER SET utf8 NOT NULL,
  `passwd` varchar(32) CHARACTER SET utf8 NOT NULL,
  `up_uid` int(11) NOT NULL,
  `contacts_allowed` int(1) NOT NULL,
  `platform` varchar(32) CHARACTER SET utf8 NOT NULL,
  `branchs` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `version` varchar(32) CHARACTER SET utf8 NOT NULL,
  `udid` varchar(64) CHARACTER SET utf8 NOT NULL,
  `imei` varchar(32) CHARACTER SET utf8 NOT NULL,
  `mac` varchar(32) CHARACTER SET utf8 NOT NULL,
  `imsi` varchar(32) CHARACTER SET utf8 NOT NULL,
  `token` varchar(64) CHARACTER SET utf8 NOT NULL,
  `ispb` int(1) NOT NULL,
  `ca` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `share_userid` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '注册分享来源',
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_ip` varchar(15) CHARACTER SET utf8 NOT NULL,
  `login_time` datetime NOT NULL,
  `last_ip` varchar(15) CHARACTER SET utf8 NOT NULL,
  `last_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_00`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_00` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199254 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_01`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_01` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199316 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_02`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_02` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199301 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_03`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_03` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199286 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_04`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_04` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199316 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_05`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_05` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199280 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_06`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_06` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199298 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_07`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_07` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199285 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_08`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_08` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199285 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_09`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_09` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199303 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_10`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_10` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199242 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_11`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_11` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199296 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_12`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_12` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199272 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_13`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_13` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199255 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_14`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_14` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199287 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_15`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_15` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199261 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_16`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_16` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199275 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_17`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_17` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199283 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_18`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_18` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199286 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_19`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_19` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199322 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_20`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_20` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199305 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_21`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_21` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199283 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_22`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_22` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199262 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_23`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_23` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199282 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_24`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_24` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199318 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_25`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_25` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199234 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_26`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_26` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199287 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_27`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_27` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199277 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_28`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_28` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199279 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_29`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_29` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199258 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_30`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_30` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199262 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_31`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_31` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199302 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_32`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_32` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199298 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_33`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_33` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199285 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_34`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_34` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199256 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_35`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_35` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199263 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_36`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_36` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199260 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_37`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_37` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199251 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_38`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_38` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199278 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_39`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_39` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199249 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_40`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_40` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199269 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_41`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_41` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199295 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_42`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_42` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199321 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_43`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_43` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199299 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_44`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_44` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199297 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_45`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_45` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199268 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_46`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_46` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199276 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_47`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_47` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199300 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_48`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_48` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199237 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_49`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_49` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199282 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_50`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_50` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199312 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_51`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_51` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199274 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_52`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_52` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199292 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_53`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_53` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199284 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_54`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_54` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199265 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_55`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_55` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199275 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_56`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_56` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199270 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_57`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_57` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199259 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_58`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_58` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199248 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_59`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_59` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199279 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_60`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_60` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199290 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_61`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_61` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199278 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_62`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_62` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199293 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_63`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_63` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199284 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_64`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_64` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199286 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_65`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_65` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199269 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_66`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_66` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199276 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_67`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_67` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199251 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_68`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_68` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199239 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_69`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_69` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199265 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_70`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_70` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199286 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_71`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_71` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199289 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_72`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_72` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199255 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_73`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_73` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199283 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_74`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_74` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199298 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_75`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_75` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199300 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_76`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_76` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199331 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_77`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_77` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199259 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_78`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_78` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199239 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_79`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_79` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199246 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_80`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_80` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199250 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_81`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_81` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199262 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_82`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_82` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199262 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_83`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_83` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199270 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_84`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_84` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199286 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_85`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_85` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199252 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_86`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_86` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199242 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_87`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_87` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199273 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_88`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_88` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199312 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_89`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_89` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199308 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_90`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_90` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199277 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_91`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_91` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199300 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_92`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_92` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199255 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_93`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_93` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199314 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_94`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_94` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199281 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_95`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_95` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199293 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_96`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_96` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199287 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_97`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_97` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199310 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_98`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_98` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199292 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_loginfo_99`
--

CREATE TABLE IF NOT EXISTS `tbl_user_loginfo_99` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `branchs` varchar(128) NOT NULL DEFAULT '' COMMENT '手机型号',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `udid` varchar(64) NOT NULL DEFAULT '' COMMENT 'UDID',
  `imei` varchar(32) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `mac` varchar(32) NOT NULL DEFAULT '' COMMENT 'MAC',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `uninstalled` tinyint(1) unsigned NOT NULL COMMENT '卸载软件0未卸载1卸载',
  `ca` varchar(16) NOT NULL DEFAULT '' COMMENT '下载渠道号',
  `ispb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否越狱1是0否',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) NOT NULL COMMENT '登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `last_time` int(10) NOT NULL COMMENT '上次登录时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=MyISAM AUTO_INCREMENT=199306 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_00`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_00` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_01`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_01` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_02`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_02` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_03`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_03` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_04`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_04` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_05`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_05` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_06`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_06` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_07`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_07` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_08`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_08` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_09`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_09` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_10`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_10` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_11`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_11` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_12`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_12` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_13`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_13` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_14`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_14` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_15`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_15` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_16`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_16` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_17`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_17` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_18`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_18` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_19`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_19` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_20`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_20` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_21`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_21` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_22`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_22` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_23`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_23` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_24`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_24` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_25`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_25` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_26`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_26` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_27`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_27` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_28`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_28` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_29`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_29` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_30`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_30` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_31`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_31` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_32`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_32` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_33`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_33` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_34`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_34` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_35`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_35` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_36`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_36` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_37`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_37` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_38`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_38` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_39`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_39` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_40`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_40` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_41`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_41` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_42`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_42` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_43`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_43` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_44`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_44` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_45`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_45` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_46`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_46` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_47`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_47` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_48`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_48` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_49`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_49` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_50`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_50` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_51`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_51` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_52`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_52` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_53`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_53` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_54`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_54` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_55`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_55` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_56`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_56` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_57`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_57` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_58`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_58` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_59`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_59` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_60`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_60` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_61`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_61` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_62`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_62` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_63`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_63` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_64`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_64` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_65`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_65` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_66`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_66` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_67`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_67` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_68`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_68` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_69`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_69` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_70`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_70` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_71`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_71` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_72`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_72` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_73`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_73` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_74`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_74` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_75`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_75` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_76`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_76` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_77`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_77` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_78`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_78` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_79`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_79` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_80`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_80` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_81`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_81` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_82`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_82` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_83`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_83` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_84`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_84` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_85`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_85` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_86`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_86` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_87`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_87` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_88`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_88` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_89`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_89` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_90`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_90` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_91`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_91` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_92`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_92` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_93`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_93` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_94`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_94` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_95`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_95` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_96`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_96` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_97`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_97` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_98`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_98` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile_99`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profile_99` (
`id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别1男2女0保密',
  `islunar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0公历1农历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `areaid` int(10) unsigned NOT NULL COMMENT '地区ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '所在城市',
  `imageurl` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像地址',
  `sign` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '个性签名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `contacts_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许读取联系人1是0否',
  `contacts_matched` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传过联系人1是0否',
  `mod_time` int(10) NOT NULL COMMENT '修改时间',
  `field1` int(11) NOT NULL COMMENT '预留字段1',
  `field2` int(11) NOT NULL COMMENT '预留字段2',
  `field3` int(11) NOT NULL COMMENT '预留字段3',
  `field4` int(11) NOT NULL COMMENT '预留字段4',
  `field5` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段5',
  `field6` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段6',
  `field7` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段7',
  `field8` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_switch`
--

CREATE TABLE IF NOT EXISTS `tbl_user_switch` (
  `userid` varchar(20) NOT NULL COMMENT '用户ID',
  `switch` varchar(50) NOT NULL COMMENT '开关十进制值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户开关配置表';

--
-- Dumping data for table `tbl_user_switch`
--

INSERT INTO `tbl_user_switch` (`userid`, `switch`) VALUES
('123', '461'),
('456', '7');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_versions`
--

CREATE TABLE IF NOT EXISTS `tbl_versions` (
`id` int(11) NOT NULL,
  `platform` varchar(32) NOT NULL,
  `version` varchar(32) NOT NULL,
  `ispb` int(1) NOT NULL,
  `released` int(1) NOT NULL,
  `forces` int(11) NOT NULL,
  `release_log` text NOT NULL,
  `release_date` datetime NOT NULL,
  `download_url` varchar(255) NOT NULL,
  `filesize` int(11) NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_v_money`
--

CREATE TABLE IF NOT EXISTS `tbl_v_money` (
`id` int(11) unsigned NOT NULL,
  `userid` bigint(14) unsigned NOT NULL COMMENT '用户id',
  `v_money` int(11) NOT NULL DEFAULT '0' COMMENT 'v币'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户的v币数量表';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_v_money_count`
--

CREATE TABLE IF NOT EXISTS `tbl_v_money_count` (
`id` int(10) unsigned NOT NULL,
  `userid` bigint(14) unsigned DEFAULT NULL,
  `mobile` char(16) DEFAULT NULL,
  `count` char(16) DEFAULT NULL,
  `open_count` char(16) DEFAULT NULL,
  `unopen_count` char(16) DEFAULT NULL,
  `v_money` char(16) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=161724 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE IF NOT EXISTS `version` (
  `table_name` char(32) NOT NULL,
  `table_version` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sms_status`
--
ALTER TABLE `sms_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb1_channel_list`
--
ALTER TABLE `tb1_channel_list`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_device_info`
--
ALTER TABLE `tbl_device_info`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `udid` (`udid`), ADD KEY `token` (`token`(8)), ADD KEY `reg_time` (`reg_time`), ADD KEY `platform` (`platform`), ADD KEY `version` (`version`), ADD KEY `imei` (`imei`), ADD KEY `ispb` (`ispb`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
 ADD PRIMARY KEY (`id`), ADD KEY `branchs` (`branchs`), ADD KEY `platform` (`platform`), ADD KEY `version` (`version`), ADD KEY `contact` (`contact`), ADD KEY `create_time` (`create_time`), ADD KEY `last_modified` (`last_modified`);

--
-- Indexes for table `tbl_login_code`
--
ALTER TABLE `tbl_login_code`
 ADD PRIMARY KEY (`id`), ADD KEY `idx_userid` (`userid`), ADD KEY `idx_code` (`code`), ADD KEY `idx_datetime` (`datetime`), ADD KEY `idx_last_modified` (`last_modified`);

--
-- Indexes for table `tbl_lottery_rules`
--
ALTER TABLE `tbl_lottery_rules`
 ADD PRIMARY KEY (`id`), ADD KEY `red_id` (`red_id`), ADD KEY `start_num` (`start_num`), ADD KEY `end_num` (`end_num`);

--
-- Indexes for table `tbl_message_log`
--
ALTER TABLE `tbl_message_log`
 ADD PRIMARY KEY (`id`) COMMENT '消息日志ID', ADD UNIQUE KEY `callid` (`callid`);

--
-- Indexes for table `tbl_mobile_local`
--
ALTER TABLE `tbl_mobile_local`
 ADD PRIMARY KEY (`ID`), ADD KEY `MobileNumber` (`MobileNumber`), ADD KEY `AreaCode` (`AreaCode`), ADD KEY `UserCode` (`UserCode`);

--
-- Indexes for table `tbl_red_award`
--
ALTER TABLE `tbl_red_award`
 ADD PRIMARY KEY (`id`), ADD KEY `userid` (`userid`);

--
-- Indexes for table `tbl_red_envelope`
--
ALTER TABLE `tbl_red_envelope`
 ADD PRIMARY KEY (`id`), ADD KEY `type` (`type`);

--
-- Indexes for table `tbl_red_envelope_config`
--
ALTER TABLE `tbl_red_envelope_config`
 ADD PRIMARY KEY (`id`), ADD KEY `userid` (`userid`);

--
-- Indexes for table `tbl_red_envelope_list`
--
ALTER TABLE `tbl_red_envelope_list`
 ADD PRIMARY KEY (`id`), ADD KEY `userid` (`userid`), ADD KEY `red_id` (`red_id`), ADD KEY `from_userid` (`from_userid`), ADD KEY `created_time` (`created_time`);

--
-- Indexes for table `tbl_register_code`
--
ALTER TABLE `tbl_register_code`
 ADD PRIMARY KEY (`id`), ADD KEY `idx_device_id` (`device_id`), ADD KEY `idx_code` (`code`), ADD KEY `idx_datetime` (`datetime`), ADD KEY `idx_last_modified` (`last_modified`), ADD KEY `mobile` (`mobile`), ADD KEY `udid` (`udid`);

--
-- Indexes for table `tbl_register_code_bak`
--
ALTER TABLE `tbl_register_code_bak`
 ADD PRIMARY KEY (`id`), ADD KEY `idx_device_id` (`device_id`), ADD KEY `idx_code` (`code`), ADD KEY `idx_datetime` (`datetime`), ADD KEY `idx_last_modified` (`last_modified`), ADD KEY `mobile` (`mobile`), ADD KEY `udid` (`udid`);

--
-- Indexes for table `tbl_resource_category`
--
ALTER TABLE `tbl_resource_category`
 ADD PRIMARY KEY (`category_id`), ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `tbl_resource_list`
--
ALTER TABLE `tbl_resource_list`
 ADD PRIMARY KEY (`id`), ADD KEY `category_id` (`category_id`), ADD KEY `platform` (`platform`), ADD KEY `mapping` (`mapping`);

--
-- Indexes for table `tbl_rsa_key`
--
ALTER TABLE `tbl_rsa_key`
 ADD PRIMARY KEY (`id`), ADD KEY `userid` (`userid`);

--
-- Indexes for table `tbl_theme_fit_list`
--
ALTER TABLE `tbl_theme_fit_list`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQUE` (`theme_id`,`type`,`to_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_00`
--
ALTER TABLE `tbl_user_00`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_01`
--
ALTER TABLE `tbl_user_01`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_02`
--
ALTER TABLE `tbl_user_02`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_03`
--
ALTER TABLE `tbl_user_03`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_04`
--
ALTER TABLE `tbl_user_04`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_05`
--
ALTER TABLE `tbl_user_05`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_06`
--
ALTER TABLE `tbl_user_06`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_07`
--
ALTER TABLE `tbl_user_07`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_08`
--
ALTER TABLE `tbl_user_08`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_09`
--
ALTER TABLE `tbl_user_09`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_10`
--
ALTER TABLE `tbl_user_10`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_11`
--
ALTER TABLE `tbl_user_11`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_12`
--
ALTER TABLE `tbl_user_12`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_13`
--
ALTER TABLE `tbl_user_13`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_14`
--
ALTER TABLE `tbl_user_14`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_15`
--
ALTER TABLE `tbl_user_15`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_16`
--
ALTER TABLE `tbl_user_16`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_17`
--
ALTER TABLE `tbl_user_17`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_18`
--
ALTER TABLE `tbl_user_18`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_19`
--
ALTER TABLE `tbl_user_19`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_20`
--
ALTER TABLE `tbl_user_20`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_21`
--
ALTER TABLE `tbl_user_21`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_22`
--
ALTER TABLE `tbl_user_22`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_23`
--
ALTER TABLE `tbl_user_23`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_24`
--
ALTER TABLE `tbl_user_24`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_25`
--
ALTER TABLE `tbl_user_25`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_26`
--
ALTER TABLE `tbl_user_26`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_27`
--
ALTER TABLE `tbl_user_27`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_28`
--
ALTER TABLE `tbl_user_28`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_29`
--
ALTER TABLE `tbl_user_29`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_30`
--
ALTER TABLE `tbl_user_30`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_31`
--
ALTER TABLE `tbl_user_31`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_32`
--
ALTER TABLE `tbl_user_32`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_33`
--
ALTER TABLE `tbl_user_33`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_34`
--
ALTER TABLE `tbl_user_34`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_35`
--
ALTER TABLE `tbl_user_35`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_36`
--
ALTER TABLE `tbl_user_36`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_37`
--
ALTER TABLE `tbl_user_37`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_38`
--
ALTER TABLE `tbl_user_38`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_39`
--
ALTER TABLE `tbl_user_39`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_40`
--
ALTER TABLE `tbl_user_40`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_41`
--
ALTER TABLE `tbl_user_41`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_42`
--
ALTER TABLE `tbl_user_42`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_43`
--
ALTER TABLE `tbl_user_43`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_44`
--
ALTER TABLE `tbl_user_44`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_45`
--
ALTER TABLE `tbl_user_45`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_46`
--
ALTER TABLE `tbl_user_46`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_47`
--
ALTER TABLE `tbl_user_47`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_48`
--
ALTER TABLE `tbl_user_48`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_49`
--
ALTER TABLE `tbl_user_49`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_50`
--
ALTER TABLE `tbl_user_50`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_51`
--
ALTER TABLE `tbl_user_51`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_52`
--
ALTER TABLE `tbl_user_52`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_53`
--
ALTER TABLE `tbl_user_53`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_54`
--
ALTER TABLE `tbl_user_54`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_55`
--
ALTER TABLE `tbl_user_55`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_56`
--
ALTER TABLE `tbl_user_56`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_57`
--
ALTER TABLE `tbl_user_57`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_58`
--
ALTER TABLE `tbl_user_58`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_59`
--
ALTER TABLE `tbl_user_59`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_60`
--
ALTER TABLE `tbl_user_60`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_61`
--
ALTER TABLE `tbl_user_61`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_62`
--
ALTER TABLE `tbl_user_62`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_63`
--
ALTER TABLE `tbl_user_63`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_64`
--
ALTER TABLE `tbl_user_64`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_65`
--
ALTER TABLE `tbl_user_65`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_66`
--
ALTER TABLE `tbl_user_66`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_67`
--
ALTER TABLE `tbl_user_67`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_68`
--
ALTER TABLE `tbl_user_68`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_69`
--
ALTER TABLE `tbl_user_69`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_70`
--
ALTER TABLE `tbl_user_70`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_71`
--
ALTER TABLE `tbl_user_71`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_72`
--
ALTER TABLE `tbl_user_72`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_73`
--
ALTER TABLE `tbl_user_73`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_74`
--
ALTER TABLE `tbl_user_74`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_75`
--
ALTER TABLE `tbl_user_75`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_76`
--
ALTER TABLE `tbl_user_76`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_77`
--
ALTER TABLE `tbl_user_77`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_78`
--
ALTER TABLE `tbl_user_78`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_79`
--
ALTER TABLE `tbl_user_79`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_80`
--
ALTER TABLE `tbl_user_80`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_81`
--
ALTER TABLE `tbl_user_81`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_82`
--
ALTER TABLE `tbl_user_82`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_83`
--
ALTER TABLE `tbl_user_83`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_84`
--
ALTER TABLE `tbl_user_84`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_85`
--
ALTER TABLE `tbl_user_85`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_86`
--
ALTER TABLE `tbl_user_86`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_87`
--
ALTER TABLE `tbl_user_87`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_88`
--
ALTER TABLE `tbl_user_88`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_89`
--
ALTER TABLE `tbl_user_89`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_90`
--
ALTER TABLE `tbl_user_90`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_91`
--
ALTER TABLE `tbl_user_91`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_92`
--
ALTER TABLE `tbl_user_92`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_93`
--
ALTER TABLE `tbl_user_93`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_94`
--
ALTER TABLE `tbl_user_94`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_95`
--
ALTER TABLE `tbl_user_95`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_96`
--
ALTER TABLE `tbl_user_96`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_97`
--
ALTER TABLE `tbl_user_97`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_98`
--
ALTER TABLE `tbl_user_98`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_99`
--
ALTER TABLE `tbl_user_99`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `reg_time` (`reg_time`), ADD KEY `ca` (`ca`);

--
-- Indexes for table `tbl_user_attribute`
--
ALTER TABLE `tbl_user_attribute`
 ADD PRIMARY KEY (`Id`), ADD UNIQUE KEY `Userid_attr` (`userId`,`attrType`), ADD KEY `Username` (`userId`), ADD KEY `Attributetype` (`attrType`), ADD KEY `idx_value` (`intValue`);

--
-- Indexes for table `tbl_user_config`
--
ALTER TABLE `tbl_user_config`
 ADD PRIMARY KEY (`id`), ADD KEY `uaerid` (`userid`);

--
-- Indexes for table `tbl_user_count`
--
ALTER TABLE `tbl_user_count`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`);

--
-- Indexes for table `tbl_user_country`
--
ALTER TABLE `tbl_user_country`
 ADD PRIMARY KEY (`id`), ADD KEY `AreaCode` (`AreaCode`), ADD KEY `UserCode` (`UserCode`);

--
-- Indexes for table `tbl_user_info`
--
ALTER TABLE `tbl_user_info`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile_2` (`mobile`), ADD KEY `idx_udid` (`udid`), ADD KEY `idx_token` (`token`), ADD KEY `idx_ca` (`ca`), ADD KEY `idx_reg_time` (`reg_time`), ADD KEY `mobile` (`mobile`), ADD KEY `platform` (`platform`), ADD KEY `version` (`version`);

--
-- Indexes for table `tbl_user_loginfo`
--
ALTER TABLE `tbl_user_loginfo`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_00`
--
ALTER TABLE `tbl_user_loginfo_00`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_01`
--
ALTER TABLE `tbl_user_loginfo_01`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_02`
--
ALTER TABLE `tbl_user_loginfo_02`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_03`
--
ALTER TABLE `tbl_user_loginfo_03`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_04`
--
ALTER TABLE `tbl_user_loginfo_04`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_05`
--
ALTER TABLE `tbl_user_loginfo_05`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_06`
--
ALTER TABLE `tbl_user_loginfo_06`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_07`
--
ALTER TABLE `tbl_user_loginfo_07`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_08`
--
ALTER TABLE `tbl_user_loginfo_08`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_09`
--
ALTER TABLE `tbl_user_loginfo_09`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_10`
--
ALTER TABLE `tbl_user_loginfo_10`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_11`
--
ALTER TABLE `tbl_user_loginfo_11`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_12`
--
ALTER TABLE `tbl_user_loginfo_12`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_13`
--
ALTER TABLE `tbl_user_loginfo_13`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_14`
--
ALTER TABLE `tbl_user_loginfo_14`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_15`
--
ALTER TABLE `tbl_user_loginfo_15`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_16`
--
ALTER TABLE `tbl_user_loginfo_16`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_17`
--
ALTER TABLE `tbl_user_loginfo_17`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_18`
--
ALTER TABLE `tbl_user_loginfo_18`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_19`
--
ALTER TABLE `tbl_user_loginfo_19`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_20`
--
ALTER TABLE `tbl_user_loginfo_20`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_21`
--
ALTER TABLE `tbl_user_loginfo_21`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_22`
--
ALTER TABLE `tbl_user_loginfo_22`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_23`
--
ALTER TABLE `tbl_user_loginfo_23`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_24`
--
ALTER TABLE `tbl_user_loginfo_24`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_25`
--
ALTER TABLE `tbl_user_loginfo_25`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_26`
--
ALTER TABLE `tbl_user_loginfo_26`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_27`
--
ALTER TABLE `tbl_user_loginfo_27`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_28`
--
ALTER TABLE `tbl_user_loginfo_28`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_29`
--
ALTER TABLE `tbl_user_loginfo_29`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_30`
--
ALTER TABLE `tbl_user_loginfo_30`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_31`
--
ALTER TABLE `tbl_user_loginfo_31`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_32`
--
ALTER TABLE `tbl_user_loginfo_32`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_33`
--
ALTER TABLE `tbl_user_loginfo_33`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_34`
--
ALTER TABLE `tbl_user_loginfo_34`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_35`
--
ALTER TABLE `tbl_user_loginfo_35`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_36`
--
ALTER TABLE `tbl_user_loginfo_36`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_37`
--
ALTER TABLE `tbl_user_loginfo_37`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_38`
--
ALTER TABLE `tbl_user_loginfo_38`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_39`
--
ALTER TABLE `tbl_user_loginfo_39`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_40`
--
ALTER TABLE `tbl_user_loginfo_40`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_41`
--
ALTER TABLE `tbl_user_loginfo_41`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_42`
--
ALTER TABLE `tbl_user_loginfo_42`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_43`
--
ALTER TABLE `tbl_user_loginfo_43`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_44`
--
ALTER TABLE `tbl_user_loginfo_44`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_45`
--
ALTER TABLE `tbl_user_loginfo_45`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_46`
--
ALTER TABLE `tbl_user_loginfo_46`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_47`
--
ALTER TABLE `tbl_user_loginfo_47`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_48`
--
ALTER TABLE `tbl_user_loginfo_48`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_49`
--
ALTER TABLE `tbl_user_loginfo_49`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_50`
--
ALTER TABLE `tbl_user_loginfo_50`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_51`
--
ALTER TABLE `tbl_user_loginfo_51`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_52`
--
ALTER TABLE `tbl_user_loginfo_52`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_53`
--
ALTER TABLE `tbl_user_loginfo_53`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_54`
--
ALTER TABLE `tbl_user_loginfo_54`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_55`
--
ALTER TABLE `tbl_user_loginfo_55`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_56`
--
ALTER TABLE `tbl_user_loginfo_56`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_57`
--
ALTER TABLE `tbl_user_loginfo_57`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_58`
--
ALTER TABLE `tbl_user_loginfo_58`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_59`
--
ALTER TABLE `tbl_user_loginfo_59`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_60`
--
ALTER TABLE `tbl_user_loginfo_60`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_61`
--
ALTER TABLE `tbl_user_loginfo_61`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_62`
--
ALTER TABLE `tbl_user_loginfo_62`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_63`
--
ALTER TABLE `tbl_user_loginfo_63`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_64`
--
ALTER TABLE `tbl_user_loginfo_64`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_65`
--
ALTER TABLE `tbl_user_loginfo_65`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_66`
--
ALTER TABLE `tbl_user_loginfo_66`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_67`
--
ALTER TABLE `tbl_user_loginfo_67`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_68`
--
ALTER TABLE `tbl_user_loginfo_68`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_69`
--
ALTER TABLE `tbl_user_loginfo_69`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_70`
--
ALTER TABLE `tbl_user_loginfo_70`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_71`
--
ALTER TABLE `tbl_user_loginfo_71`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_72`
--
ALTER TABLE `tbl_user_loginfo_72`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_73`
--
ALTER TABLE `tbl_user_loginfo_73`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_74`
--
ALTER TABLE `tbl_user_loginfo_74`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_75`
--
ALTER TABLE `tbl_user_loginfo_75`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_76`
--
ALTER TABLE `tbl_user_loginfo_76`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_77`
--
ALTER TABLE `tbl_user_loginfo_77`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_78`
--
ALTER TABLE `tbl_user_loginfo_78`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_79`
--
ALTER TABLE `tbl_user_loginfo_79`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_80`
--
ALTER TABLE `tbl_user_loginfo_80`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_81`
--
ALTER TABLE `tbl_user_loginfo_81`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_82`
--
ALTER TABLE `tbl_user_loginfo_82`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_83`
--
ALTER TABLE `tbl_user_loginfo_83`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_84`
--
ALTER TABLE `tbl_user_loginfo_84`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_85`
--
ALTER TABLE `tbl_user_loginfo_85`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_86`
--
ALTER TABLE `tbl_user_loginfo_86`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_87`
--
ALTER TABLE `tbl_user_loginfo_87`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_88`
--
ALTER TABLE `tbl_user_loginfo_88`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_89`
--
ALTER TABLE `tbl_user_loginfo_89`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_90`
--
ALTER TABLE `tbl_user_loginfo_90`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_91`
--
ALTER TABLE `tbl_user_loginfo_91`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_92`
--
ALTER TABLE `tbl_user_loginfo_92`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_93`
--
ALTER TABLE `tbl_user_loginfo_93`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_94`
--
ALTER TABLE `tbl_user_loginfo_94`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_95`
--
ALTER TABLE `tbl_user_loginfo_95`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_96`
--
ALTER TABLE `tbl_user_loginfo_96`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_97`
--
ALTER TABLE `tbl_user_loginfo_97`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_98`
--
ALTER TABLE `tbl_user_loginfo_98`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_loginfo_99`
--
ALTER TABLE `tbl_user_loginfo_99`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD KEY `platform` (`platform`), ADD KEY `branchs` (`branchs`), ADD KEY `version` (`version`), ADD KEY `udid` (`udid`), ADD KEY `token` (`token`), ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `tbl_user_profile`
--
ALTER TABLE `tbl_user_profile`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_00`
--
ALTER TABLE `tbl_user_profile_00`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_01`
--
ALTER TABLE `tbl_user_profile_01`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_02`
--
ALTER TABLE `tbl_user_profile_02`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_03`
--
ALTER TABLE `tbl_user_profile_03`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_04`
--
ALTER TABLE `tbl_user_profile_04`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_05`
--
ALTER TABLE `tbl_user_profile_05`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_06`
--
ALTER TABLE `tbl_user_profile_06`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_07`
--
ALTER TABLE `tbl_user_profile_07`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_08`
--
ALTER TABLE `tbl_user_profile_08`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_09`
--
ALTER TABLE `tbl_user_profile_09`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_10`
--
ALTER TABLE `tbl_user_profile_10`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_11`
--
ALTER TABLE `tbl_user_profile_11`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_12`
--
ALTER TABLE `tbl_user_profile_12`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_13`
--
ALTER TABLE `tbl_user_profile_13`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_14`
--
ALTER TABLE `tbl_user_profile_14`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_15`
--
ALTER TABLE `tbl_user_profile_15`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_16`
--
ALTER TABLE `tbl_user_profile_16`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_17`
--
ALTER TABLE `tbl_user_profile_17`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_18`
--
ALTER TABLE `tbl_user_profile_18`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_19`
--
ALTER TABLE `tbl_user_profile_19`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_20`
--
ALTER TABLE `tbl_user_profile_20`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_21`
--
ALTER TABLE `tbl_user_profile_21`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_22`
--
ALTER TABLE `tbl_user_profile_22`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_23`
--
ALTER TABLE `tbl_user_profile_23`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_24`
--
ALTER TABLE `tbl_user_profile_24`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_25`
--
ALTER TABLE `tbl_user_profile_25`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_26`
--
ALTER TABLE `tbl_user_profile_26`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_27`
--
ALTER TABLE `tbl_user_profile_27`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_28`
--
ALTER TABLE `tbl_user_profile_28`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_29`
--
ALTER TABLE `tbl_user_profile_29`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_30`
--
ALTER TABLE `tbl_user_profile_30`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_31`
--
ALTER TABLE `tbl_user_profile_31`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_32`
--
ALTER TABLE `tbl_user_profile_32`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_33`
--
ALTER TABLE `tbl_user_profile_33`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_34`
--
ALTER TABLE `tbl_user_profile_34`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_35`
--
ALTER TABLE `tbl_user_profile_35`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_36`
--
ALTER TABLE `tbl_user_profile_36`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_37`
--
ALTER TABLE `tbl_user_profile_37`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_38`
--
ALTER TABLE `tbl_user_profile_38`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_39`
--
ALTER TABLE `tbl_user_profile_39`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_40`
--
ALTER TABLE `tbl_user_profile_40`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_41`
--
ALTER TABLE `tbl_user_profile_41`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_42`
--
ALTER TABLE `tbl_user_profile_42`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_43`
--
ALTER TABLE `tbl_user_profile_43`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_44`
--
ALTER TABLE `tbl_user_profile_44`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_45`
--
ALTER TABLE `tbl_user_profile_45`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_46`
--
ALTER TABLE `tbl_user_profile_46`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_47`
--
ALTER TABLE `tbl_user_profile_47`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_48`
--
ALTER TABLE `tbl_user_profile_48`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_49`
--
ALTER TABLE `tbl_user_profile_49`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_50`
--
ALTER TABLE `tbl_user_profile_50`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_51`
--
ALTER TABLE `tbl_user_profile_51`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_52`
--
ALTER TABLE `tbl_user_profile_52`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_53`
--
ALTER TABLE `tbl_user_profile_53`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_54`
--
ALTER TABLE `tbl_user_profile_54`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_55`
--
ALTER TABLE `tbl_user_profile_55`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_56`
--
ALTER TABLE `tbl_user_profile_56`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_57`
--
ALTER TABLE `tbl_user_profile_57`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_58`
--
ALTER TABLE `tbl_user_profile_58`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_59`
--
ALTER TABLE `tbl_user_profile_59`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_60`
--
ALTER TABLE `tbl_user_profile_60`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_61`
--
ALTER TABLE `tbl_user_profile_61`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_62`
--
ALTER TABLE `tbl_user_profile_62`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_63`
--
ALTER TABLE `tbl_user_profile_63`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_64`
--
ALTER TABLE `tbl_user_profile_64`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_65`
--
ALTER TABLE `tbl_user_profile_65`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_66`
--
ALTER TABLE `tbl_user_profile_66`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_67`
--
ALTER TABLE `tbl_user_profile_67`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_68`
--
ALTER TABLE `tbl_user_profile_68`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_69`
--
ALTER TABLE `tbl_user_profile_69`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_70`
--
ALTER TABLE `tbl_user_profile_70`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_71`
--
ALTER TABLE `tbl_user_profile_71`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_72`
--
ALTER TABLE `tbl_user_profile_72`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_73`
--
ALTER TABLE `tbl_user_profile_73`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_74`
--
ALTER TABLE `tbl_user_profile_74`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_75`
--
ALTER TABLE `tbl_user_profile_75`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_76`
--
ALTER TABLE `tbl_user_profile_76`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_77`
--
ALTER TABLE `tbl_user_profile_77`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_78`
--
ALTER TABLE `tbl_user_profile_78`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_79`
--
ALTER TABLE `tbl_user_profile_79`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_80`
--
ALTER TABLE `tbl_user_profile_80`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_81`
--
ALTER TABLE `tbl_user_profile_81`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_82`
--
ALTER TABLE `tbl_user_profile_82`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_83`
--
ALTER TABLE `tbl_user_profile_83`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_84`
--
ALTER TABLE `tbl_user_profile_84`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_85`
--
ALTER TABLE `tbl_user_profile_85`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_86`
--
ALTER TABLE `tbl_user_profile_86`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_87`
--
ALTER TABLE `tbl_user_profile_87`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_88`
--
ALTER TABLE `tbl_user_profile_88`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_89`
--
ALTER TABLE `tbl_user_profile_89`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_90`
--
ALTER TABLE `tbl_user_profile_90`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_91`
--
ALTER TABLE `tbl_user_profile_91`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_92`
--
ALTER TABLE `tbl_user_profile_92`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_93`
--
ALTER TABLE `tbl_user_profile_93`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_94`
--
ALTER TABLE `tbl_user_profile_94`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_95`
--
ALTER TABLE `tbl_user_profile_95`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_96`
--
ALTER TABLE `tbl_user_profile_96`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_97`
--
ALTER TABLE `tbl_user_profile_97`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_98`
--
ALTER TABLE `tbl_user_profile_98`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_profile_99`
--
ALTER TABLE `tbl_user_profile_99`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `userid` (`userid`), ADD UNIQUE KEY `mobile` (`mobile`), ADD KEY `username` (`username`), ADD KEY `email` (`email`(191)), ADD KEY `mod_time` (`mod_time`);

--
-- Indexes for table `tbl_user_switch`
--
ALTER TABLE `tbl_user_switch`
 ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `tbl_versions`
--
ALTER TABLE `tbl_versions`
 ADD PRIMARY KEY (`id`), ADD KEY `version` (`version`), ADD KEY `platform` (`platform`), ADD KEY `release_date` (`release_date`);

--
-- Indexes for table `tbl_v_money`
--
ALTER TABLE `tbl_v_money`
 ADD PRIMARY KEY (`id`), ADD KEY `userid` (`userid`), ADD KEY `v_money` (`v_money`);

--
-- Indexes for table `tbl_v_money_count`
--
ALTER TABLE `tbl_v_money_count`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `version`
--
ALTER TABLE `version`
 ADD UNIQUE KEY `t_name_idx` (`table_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sms_status`
--
ALTER TABLE `sms_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb1_channel_list`
--
ALTER TABLE `tb1_channel_list`
MODIFY `id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_device_info`
--
ALTER TABLE `tbl_device_info`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_login_code`
--
ALTER TABLE `tbl_login_code`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_lottery_rules`
--
ALTER TABLE `tbl_lottery_rules`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_message_log`
--
ALTER TABLE `tbl_message_log`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息ID主键';
--
-- AUTO_INCREMENT for table `tbl_mobile_local`
--
ALTER TABLE `tbl_mobile_local`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_red_award`
--
ALTER TABLE `tbl_red_award`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `tbl_red_envelope`
--
ALTER TABLE `tbl_red_envelope`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tbl_red_envelope_config`
--
ALTER TABLE `tbl_red_envelope_config`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_red_envelope_list`
--
ALTER TABLE `tbl_red_envelope_list`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_register_code`
--
ALTER TABLE `tbl_register_code`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_register_code_bak`
--
ALTER TABLE `tbl_register_code_bak`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_resource_category`
--
ALTER TABLE `tbl_resource_category`
MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_resource_list`
--
ALTER TABLE `tbl_resource_list`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=755;
--
-- AUTO_INCREMENT for table `tbl_rsa_key`
--
ALTER TABLE `tbl_rsa_key`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_theme_fit_list`
--
ALTER TABLE `tbl_theme_fit_list`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1093;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_00`
--
ALTER TABLE `tbl_user_00`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_01`
--
ALTER TABLE `tbl_user_01`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_02`
--
ALTER TABLE `tbl_user_02`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_03`
--
ALTER TABLE `tbl_user_03`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_04`
--
ALTER TABLE `tbl_user_04`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_05`
--
ALTER TABLE `tbl_user_05`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_06`
--
ALTER TABLE `tbl_user_06`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_07`
--
ALTER TABLE `tbl_user_07`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_08`
--
ALTER TABLE `tbl_user_08`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_09`
--
ALTER TABLE `tbl_user_09`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_10`
--
ALTER TABLE `tbl_user_10`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_11`
--
ALTER TABLE `tbl_user_11`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_12`
--
ALTER TABLE `tbl_user_12`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_13`
--
ALTER TABLE `tbl_user_13`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_14`
--
ALTER TABLE `tbl_user_14`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_15`
--
ALTER TABLE `tbl_user_15`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_16`
--
ALTER TABLE `tbl_user_16`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_17`
--
ALTER TABLE `tbl_user_17`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_18`
--
ALTER TABLE `tbl_user_18`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_19`
--
ALTER TABLE `tbl_user_19`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_20`
--
ALTER TABLE `tbl_user_20`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_21`
--
ALTER TABLE `tbl_user_21`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_22`
--
ALTER TABLE `tbl_user_22`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_23`
--
ALTER TABLE `tbl_user_23`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_24`
--
ALTER TABLE `tbl_user_24`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_25`
--
ALTER TABLE `tbl_user_25`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_26`
--
ALTER TABLE `tbl_user_26`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_27`
--
ALTER TABLE `tbl_user_27`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_28`
--
ALTER TABLE `tbl_user_28`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_29`
--
ALTER TABLE `tbl_user_29`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_30`
--
ALTER TABLE `tbl_user_30`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_31`
--
ALTER TABLE `tbl_user_31`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_32`
--
ALTER TABLE `tbl_user_32`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_33`
--
ALTER TABLE `tbl_user_33`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_34`
--
ALTER TABLE `tbl_user_34`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_35`
--
ALTER TABLE `tbl_user_35`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_36`
--
ALTER TABLE `tbl_user_36`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_37`
--
ALTER TABLE `tbl_user_37`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_38`
--
ALTER TABLE `tbl_user_38`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_39`
--
ALTER TABLE `tbl_user_39`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_40`
--
ALTER TABLE `tbl_user_40`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_41`
--
ALTER TABLE `tbl_user_41`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_42`
--
ALTER TABLE `tbl_user_42`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_43`
--
ALTER TABLE `tbl_user_43`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_44`
--
ALTER TABLE `tbl_user_44`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_45`
--
ALTER TABLE `tbl_user_45`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_46`
--
ALTER TABLE `tbl_user_46`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_47`
--
ALTER TABLE `tbl_user_47`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_48`
--
ALTER TABLE `tbl_user_48`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_49`
--
ALTER TABLE `tbl_user_49`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_50`
--
ALTER TABLE `tbl_user_50`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_51`
--
ALTER TABLE `tbl_user_51`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_52`
--
ALTER TABLE `tbl_user_52`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_53`
--
ALTER TABLE `tbl_user_53`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_54`
--
ALTER TABLE `tbl_user_54`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_55`
--
ALTER TABLE `tbl_user_55`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_56`
--
ALTER TABLE `tbl_user_56`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_57`
--
ALTER TABLE `tbl_user_57`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_58`
--
ALTER TABLE `tbl_user_58`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_59`
--
ALTER TABLE `tbl_user_59`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_60`
--
ALTER TABLE `tbl_user_60`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_61`
--
ALTER TABLE `tbl_user_61`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_62`
--
ALTER TABLE `tbl_user_62`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_63`
--
ALTER TABLE `tbl_user_63`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_64`
--
ALTER TABLE `tbl_user_64`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_65`
--
ALTER TABLE `tbl_user_65`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_66`
--
ALTER TABLE `tbl_user_66`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_67`
--
ALTER TABLE `tbl_user_67`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_68`
--
ALTER TABLE `tbl_user_68`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_69`
--
ALTER TABLE `tbl_user_69`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_70`
--
ALTER TABLE `tbl_user_70`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_71`
--
ALTER TABLE `tbl_user_71`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_72`
--
ALTER TABLE `tbl_user_72`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_73`
--
ALTER TABLE `tbl_user_73`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_74`
--
ALTER TABLE `tbl_user_74`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_75`
--
ALTER TABLE `tbl_user_75`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_76`
--
ALTER TABLE `tbl_user_76`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_77`
--
ALTER TABLE `tbl_user_77`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_78`
--
ALTER TABLE `tbl_user_78`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_79`
--
ALTER TABLE `tbl_user_79`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_80`
--
ALTER TABLE `tbl_user_80`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_81`
--
ALTER TABLE `tbl_user_81`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_82`
--
ALTER TABLE `tbl_user_82`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_83`
--
ALTER TABLE `tbl_user_83`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_84`
--
ALTER TABLE `tbl_user_84`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_85`
--
ALTER TABLE `tbl_user_85`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_86`
--
ALTER TABLE `tbl_user_86`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_87`
--
ALTER TABLE `tbl_user_87`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_88`
--
ALTER TABLE `tbl_user_88`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_89`
--
ALTER TABLE `tbl_user_89`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_90`
--
ALTER TABLE `tbl_user_90`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_91`
--
ALTER TABLE `tbl_user_91`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_92`
--
ALTER TABLE `tbl_user_92`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_93`
--
ALTER TABLE `tbl_user_93`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_94`
--
ALTER TABLE `tbl_user_94`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_95`
--
ALTER TABLE `tbl_user_95`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_96`
--
ALTER TABLE `tbl_user_96`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_97`
--
ALTER TABLE `tbl_user_97`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_98`
--
ALTER TABLE `tbl_user_98`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_99`
--
ALTER TABLE `tbl_user_99`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_attribute`
--
ALTER TABLE `tbl_user_attribute`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_config`
--
ALTER TABLE `tbl_user_config`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_count`
--
ALTER TABLE `tbl_user_count`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_country`
--
ALTER TABLE `tbl_user_country`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_info`
--
ALTER TABLE `tbl_user_info`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo`
--
ALTER TABLE `tbl_user_loginfo`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_00`
--
ALTER TABLE `tbl_user_loginfo_00`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199254;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_01`
--
ALTER TABLE `tbl_user_loginfo_01`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199316;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_02`
--
ALTER TABLE `tbl_user_loginfo_02`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199301;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_03`
--
ALTER TABLE `tbl_user_loginfo_03`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199286;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_04`
--
ALTER TABLE `tbl_user_loginfo_04`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199316;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_05`
--
ALTER TABLE `tbl_user_loginfo_05`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199280;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_06`
--
ALTER TABLE `tbl_user_loginfo_06`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199298;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_07`
--
ALTER TABLE `tbl_user_loginfo_07`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199285;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_08`
--
ALTER TABLE `tbl_user_loginfo_08`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199285;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_09`
--
ALTER TABLE `tbl_user_loginfo_09`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199303;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_10`
--
ALTER TABLE `tbl_user_loginfo_10`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199242;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_11`
--
ALTER TABLE `tbl_user_loginfo_11`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199296;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_12`
--
ALTER TABLE `tbl_user_loginfo_12`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199272;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_13`
--
ALTER TABLE `tbl_user_loginfo_13`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199255;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_14`
--
ALTER TABLE `tbl_user_loginfo_14`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199287;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_15`
--
ALTER TABLE `tbl_user_loginfo_15`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199261;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_16`
--
ALTER TABLE `tbl_user_loginfo_16`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199275;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_17`
--
ALTER TABLE `tbl_user_loginfo_17`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199283;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_18`
--
ALTER TABLE `tbl_user_loginfo_18`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199286;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_19`
--
ALTER TABLE `tbl_user_loginfo_19`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199322;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_20`
--
ALTER TABLE `tbl_user_loginfo_20`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199305;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_21`
--
ALTER TABLE `tbl_user_loginfo_21`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199283;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_22`
--
ALTER TABLE `tbl_user_loginfo_22`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199262;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_23`
--
ALTER TABLE `tbl_user_loginfo_23`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199282;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_24`
--
ALTER TABLE `tbl_user_loginfo_24`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199318;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_25`
--
ALTER TABLE `tbl_user_loginfo_25`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199234;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_26`
--
ALTER TABLE `tbl_user_loginfo_26`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199287;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_27`
--
ALTER TABLE `tbl_user_loginfo_27`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199277;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_28`
--
ALTER TABLE `tbl_user_loginfo_28`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199279;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_29`
--
ALTER TABLE `tbl_user_loginfo_29`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199258;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_30`
--
ALTER TABLE `tbl_user_loginfo_30`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199262;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_31`
--
ALTER TABLE `tbl_user_loginfo_31`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199302;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_32`
--
ALTER TABLE `tbl_user_loginfo_32`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199298;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_33`
--
ALTER TABLE `tbl_user_loginfo_33`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199285;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_34`
--
ALTER TABLE `tbl_user_loginfo_34`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199256;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_35`
--
ALTER TABLE `tbl_user_loginfo_35`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199263;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_36`
--
ALTER TABLE `tbl_user_loginfo_36`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199260;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_37`
--
ALTER TABLE `tbl_user_loginfo_37`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199251;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_38`
--
ALTER TABLE `tbl_user_loginfo_38`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199278;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_39`
--
ALTER TABLE `tbl_user_loginfo_39`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199249;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_40`
--
ALTER TABLE `tbl_user_loginfo_40`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199269;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_41`
--
ALTER TABLE `tbl_user_loginfo_41`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199295;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_42`
--
ALTER TABLE `tbl_user_loginfo_42`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199321;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_43`
--
ALTER TABLE `tbl_user_loginfo_43`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199299;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_44`
--
ALTER TABLE `tbl_user_loginfo_44`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199297;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_45`
--
ALTER TABLE `tbl_user_loginfo_45`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199268;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_46`
--
ALTER TABLE `tbl_user_loginfo_46`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199276;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_47`
--
ALTER TABLE `tbl_user_loginfo_47`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199300;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_48`
--
ALTER TABLE `tbl_user_loginfo_48`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199237;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_49`
--
ALTER TABLE `tbl_user_loginfo_49`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199282;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_50`
--
ALTER TABLE `tbl_user_loginfo_50`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199312;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_51`
--
ALTER TABLE `tbl_user_loginfo_51`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199274;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_52`
--
ALTER TABLE `tbl_user_loginfo_52`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199292;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_53`
--
ALTER TABLE `tbl_user_loginfo_53`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199284;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_54`
--
ALTER TABLE `tbl_user_loginfo_54`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199265;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_55`
--
ALTER TABLE `tbl_user_loginfo_55`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199275;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_56`
--
ALTER TABLE `tbl_user_loginfo_56`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199270;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_57`
--
ALTER TABLE `tbl_user_loginfo_57`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199259;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_58`
--
ALTER TABLE `tbl_user_loginfo_58`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199248;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_59`
--
ALTER TABLE `tbl_user_loginfo_59`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199279;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_60`
--
ALTER TABLE `tbl_user_loginfo_60`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199290;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_61`
--
ALTER TABLE `tbl_user_loginfo_61`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199278;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_62`
--
ALTER TABLE `tbl_user_loginfo_62`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199293;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_63`
--
ALTER TABLE `tbl_user_loginfo_63`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199284;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_64`
--
ALTER TABLE `tbl_user_loginfo_64`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199286;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_65`
--
ALTER TABLE `tbl_user_loginfo_65`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199269;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_66`
--
ALTER TABLE `tbl_user_loginfo_66`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199276;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_67`
--
ALTER TABLE `tbl_user_loginfo_67`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199251;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_68`
--
ALTER TABLE `tbl_user_loginfo_68`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199239;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_69`
--
ALTER TABLE `tbl_user_loginfo_69`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199265;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_70`
--
ALTER TABLE `tbl_user_loginfo_70`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199286;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_71`
--
ALTER TABLE `tbl_user_loginfo_71`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199289;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_72`
--
ALTER TABLE `tbl_user_loginfo_72`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199255;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_73`
--
ALTER TABLE `tbl_user_loginfo_73`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199283;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_74`
--
ALTER TABLE `tbl_user_loginfo_74`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199298;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_75`
--
ALTER TABLE `tbl_user_loginfo_75`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199300;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_76`
--
ALTER TABLE `tbl_user_loginfo_76`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199331;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_77`
--
ALTER TABLE `tbl_user_loginfo_77`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199259;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_78`
--
ALTER TABLE `tbl_user_loginfo_78`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199239;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_79`
--
ALTER TABLE `tbl_user_loginfo_79`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199246;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_80`
--
ALTER TABLE `tbl_user_loginfo_80`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199250;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_81`
--
ALTER TABLE `tbl_user_loginfo_81`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199262;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_82`
--
ALTER TABLE `tbl_user_loginfo_82`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199262;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_83`
--
ALTER TABLE `tbl_user_loginfo_83`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199270;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_84`
--
ALTER TABLE `tbl_user_loginfo_84`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199286;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_85`
--
ALTER TABLE `tbl_user_loginfo_85`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199252;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_86`
--
ALTER TABLE `tbl_user_loginfo_86`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199242;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_87`
--
ALTER TABLE `tbl_user_loginfo_87`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199273;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_88`
--
ALTER TABLE `tbl_user_loginfo_88`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199312;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_89`
--
ALTER TABLE `tbl_user_loginfo_89`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199308;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_90`
--
ALTER TABLE `tbl_user_loginfo_90`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199277;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_91`
--
ALTER TABLE `tbl_user_loginfo_91`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199300;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_92`
--
ALTER TABLE `tbl_user_loginfo_92`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199255;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_93`
--
ALTER TABLE `tbl_user_loginfo_93`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199314;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_94`
--
ALTER TABLE `tbl_user_loginfo_94`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199281;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_95`
--
ALTER TABLE `tbl_user_loginfo_95`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199293;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_96`
--
ALTER TABLE `tbl_user_loginfo_96`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199287;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_97`
--
ALTER TABLE `tbl_user_loginfo_97`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199310;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_98`
--
ALTER TABLE `tbl_user_loginfo_98`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199292;
--
-- AUTO_INCREMENT for table `tbl_user_loginfo_99`
--
ALTER TABLE `tbl_user_loginfo_99`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=199306;
--
-- AUTO_INCREMENT for table `tbl_user_profile`
--
ALTER TABLE `tbl_user_profile`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_00`
--
ALTER TABLE `tbl_user_profile_00`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_01`
--
ALTER TABLE `tbl_user_profile_01`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_02`
--
ALTER TABLE `tbl_user_profile_02`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_03`
--
ALTER TABLE `tbl_user_profile_03`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_04`
--
ALTER TABLE `tbl_user_profile_04`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_05`
--
ALTER TABLE `tbl_user_profile_05`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_06`
--
ALTER TABLE `tbl_user_profile_06`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_07`
--
ALTER TABLE `tbl_user_profile_07`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_08`
--
ALTER TABLE `tbl_user_profile_08`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_09`
--
ALTER TABLE `tbl_user_profile_09`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_10`
--
ALTER TABLE `tbl_user_profile_10`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_11`
--
ALTER TABLE `tbl_user_profile_11`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_12`
--
ALTER TABLE `tbl_user_profile_12`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_13`
--
ALTER TABLE `tbl_user_profile_13`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_14`
--
ALTER TABLE `tbl_user_profile_14`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_15`
--
ALTER TABLE `tbl_user_profile_15`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_16`
--
ALTER TABLE `tbl_user_profile_16`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_17`
--
ALTER TABLE `tbl_user_profile_17`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_18`
--
ALTER TABLE `tbl_user_profile_18`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_19`
--
ALTER TABLE `tbl_user_profile_19`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_20`
--
ALTER TABLE `tbl_user_profile_20`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_21`
--
ALTER TABLE `tbl_user_profile_21`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_22`
--
ALTER TABLE `tbl_user_profile_22`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_23`
--
ALTER TABLE `tbl_user_profile_23`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_24`
--
ALTER TABLE `tbl_user_profile_24`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_25`
--
ALTER TABLE `tbl_user_profile_25`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_26`
--
ALTER TABLE `tbl_user_profile_26`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_27`
--
ALTER TABLE `tbl_user_profile_27`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_28`
--
ALTER TABLE `tbl_user_profile_28`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_29`
--
ALTER TABLE `tbl_user_profile_29`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_30`
--
ALTER TABLE `tbl_user_profile_30`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_31`
--
ALTER TABLE `tbl_user_profile_31`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_32`
--
ALTER TABLE `tbl_user_profile_32`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_33`
--
ALTER TABLE `tbl_user_profile_33`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_34`
--
ALTER TABLE `tbl_user_profile_34`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_35`
--
ALTER TABLE `tbl_user_profile_35`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_36`
--
ALTER TABLE `tbl_user_profile_36`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_37`
--
ALTER TABLE `tbl_user_profile_37`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_38`
--
ALTER TABLE `tbl_user_profile_38`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_39`
--
ALTER TABLE `tbl_user_profile_39`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_40`
--
ALTER TABLE `tbl_user_profile_40`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_41`
--
ALTER TABLE `tbl_user_profile_41`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_42`
--
ALTER TABLE `tbl_user_profile_42`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_43`
--
ALTER TABLE `tbl_user_profile_43`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_44`
--
ALTER TABLE `tbl_user_profile_44`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_45`
--
ALTER TABLE `tbl_user_profile_45`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_46`
--
ALTER TABLE `tbl_user_profile_46`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_47`
--
ALTER TABLE `tbl_user_profile_47`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_48`
--
ALTER TABLE `tbl_user_profile_48`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_49`
--
ALTER TABLE `tbl_user_profile_49`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_50`
--
ALTER TABLE `tbl_user_profile_50`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_51`
--
ALTER TABLE `tbl_user_profile_51`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_52`
--
ALTER TABLE `tbl_user_profile_52`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_53`
--
ALTER TABLE `tbl_user_profile_53`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_54`
--
ALTER TABLE `tbl_user_profile_54`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_55`
--
ALTER TABLE `tbl_user_profile_55`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_56`
--
ALTER TABLE `tbl_user_profile_56`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_57`
--
ALTER TABLE `tbl_user_profile_57`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_58`
--
ALTER TABLE `tbl_user_profile_58`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_59`
--
ALTER TABLE `tbl_user_profile_59`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_60`
--
ALTER TABLE `tbl_user_profile_60`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_61`
--
ALTER TABLE `tbl_user_profile_61`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_62`
--
ALTER TABLE `tbl_user_profile_62`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_63`
--
ALTER TABLE `tbl_user_profile_63`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_64`
--
ALTER TABLE `tbl_user_profile_64`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_65`
--
ALTER TABLE `tbl_user_profile_65`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_66`
--
ALTER TABLE `tbl_user_profile_66`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_67`
--
ALTER TABLE `tbl_user_profile_67`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_68`
--
ALTER TABLE `tbl_user_profile_68`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_69`
--
ALTER TABLE `tbl_user_profile_69`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_70`
--
ALTER TABLE `tbl_user_profile_70`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_71`
--
ALTER TABLE `tbl_user_profile_71`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_72`
--
ALTER TABLE `tbl_user_profile_72`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_73`
--
ALTER TABLE `tbl_user_profile_73`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_74`
--
ALTER TABLE `tbl_user_profile_74`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_75`
--
ALTER TABLE `tbl_user_profile_75`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_76`
--
ALTER TABLE `tbl_user_profile_76`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_77`
--
ALTER TABLE `tbl_user_profile_77`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_78`
--
ALTER TABLE `tbl_user_profile_78`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_79`
--
ALTER TABLE `tbl_user_profile_79`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_80`
--
ALTER TABLE `tbl_user_profile_80`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_81`
--
ALTER TABLE `tbl_user_profile_81`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_82`
--
ALTER TABLE `tbl_user_profile_82`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_83`
--
ALTER TABLE `tbl_user_profile_83`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_84`
--
ALTER TABLE `tbl_user_profile_84`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_85`
--
ALTER TABLE `tbl_user_profile_85`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_86`
--
ALTER TABLE `tbl_user_profile_86`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_87`
--
ALTER TABLE `tbl_user_profile_87`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_88`
--
ALTER TABLE `tbl_user_profile_88`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_89`
--
ALTER TABLE `tbl_user_profile_89`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_90`
--
ALTER TABLE `tbl_user_profile_90`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_91`
--
ALTER TABLE `tbl_user_profile_91`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_92`
--
ALTER TABLE `tbl_user_profile_92`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_93`
--
ALTER TABLE `tbl_user_profile_93`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_94`
--
ALTER TABLE `tbl_user_profile_94`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_95`
--
ALTER TABLE `tbl_user_profile_95`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_96`
--
ALTER TABLE `tbl_user_profile_96`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_97`
--
ALTER TABLE `tbl_user_profile_97`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_98`
--
ALTER TABLE `tbl_user_profile_98`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_user_profile_99`
--
ALTER TABLE `tbl_user_profile_99`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `tbl_versions`
--
ALTER TABLE `tbl_versions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_v_money`
--
ALTER TABLE `tbl_v_money`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_v_money_count`
--
ALTER TABLE `tbl_v_money_count`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=161724;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
