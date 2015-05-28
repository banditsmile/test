-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- 主机: 10.1.3.228
-- 生成日期: 2015 年 01 月 21 日 16:11
-- 服务器版本: 5.5.28-log
-- PHP 版本: 5.4.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `wei_cdr`
--

-- --------------------------------------------------------

--
-- 表的结构 `tbl_cdr_log`
--

CREATE TABLE IF NOT EXISTS `tbl_cdr_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_uuid` varchar(64) NOT NULL COMMENT '话单唯一键值',
  `from_userid` bigint(14) unsigned NOT NULL COMMENT '主叫用户ID',
  `to_userid` bigint(14) unsigned NOT NULL COMMENT '被叫用户ID',
  `from_mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '主叫用户手机号码',
  `to_mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '被叫用户手机号码',
  `from_device_useragent` varchar(255) NOT NULL DEFAULT '' COMMENT '主叫用户设备ua',
  `to_device_useragent` varchar(255) NOT NULL DEFAULT '' COMMENT '被叫用户设备ua',
  `from_platform` varchar(64) NOT NULL DEFAULT '',
  `from_version` varchar(64) NOT NULL DEFAULT '',
  `to_platform` varchar(64) NOT NULL DEFAULT '',
  `to_version` varchar(64) NOT NULL DEFAULT '',
  `from_nets` int(1) NOT NULL DEFAULT '0' COMMENT '主叫网络1=wifi,2=3G,3=2G',
  `to_nets` int(1) NOT NULL DEFAULT '0' COMMENT '被叫网络1=wifi,2=3G,3=2G',
  `from_ua` varchar(32) NOT NULL DEFAULT '' COMMENT '主叫ua',
  `to_ua` varchar(32) NOT NULL DEFAULT '' COMMENT '被叫ua',
  `start_time` datetime NOT NULL COMMENT '开始拨打的时间',
  `link_msec` int(11) NOT NULL DEFAULT '0' COMMENT '连接/寻址时长',
  `ring_msec` int(11) NOT NULL DEFAULT '0' COMMENT '响铃用时毫秒数',
  `hold_msec` int(11) NOT NULL DEFAULT '0' COMMENT '通话时长毫秒数',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `caller_host` varchar(32) NOT NULL DEFAULT '' COMMENT '主叫服务器',
  `called_host` varchar(32) NOT NULL DEFAULT '' COMMENT '被叫服务器',
  `vos_ip` varchar(32) NOT NULL DEFAULT '' COMMENT 'voip服务器',
  `media_host` varchar(32) NOT NULL DEFAULT '' COMMENT '媒体服务器',
  `hangup_cause` varchar(32) NOT NULL DEFAULT '' COMMENT '挂断原因',
  `answer_status` varchar(32) NOT NULL DEFAULT '' COMMENT '接听状态：未接通，拒接，未接，接通',
  `turn_vos_status` varchar(32) NOT NULL DEFAULT '' COMMENT '转voip时的状态(为什么要转voip)',
  `call_type` varchar(10) NOT NULL DEFAULT '' COMMENT '话单类型空为普通点对点话单,voip为voip话单',
  `cdr_string` varchar(2000) NOT NULL DEFAULT '' COMMENT 'cdr原生字符串',
  `from_media_info` varchar(600) NOT NULL DEFAULT '',
  `to_media_info` varchar(600) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL COMMENT '话单生成时间',
  PRIMARY KEY (`id`),
  KEY `from_userid` (`from_userid`),
  KEY `to_userid` (`to_userid`),
  KEY `from_device_useragent` (`from_device_useragent`),
  KEY `to_device_useragent` (`to_device_useragent`),
  KEY `start_time` (`start_time`),
  KEY `ring_msec` (`ring_msec`),
  KEY `hold_msec` (`hold_msec`),
  KEY `answer_status` (`answer_status`),
  KEY `hangup_cause` (`hangup_cause`),
  KEY `call_uuid` (`call_uuid`),
  KEY `created_at` (`created_at`),
  KEY `to_mobile` (`to_mobile`),
  KEY `to_nets` (`to_nets`),
  KEY `called_host` (`called_host`),
  KEY `from_mobile` (`from_mobile`),
  KEY `from_nets` (`from_nets`),
  KEY `call_type` (`call_type`),
  KEY `vos_ip` (`vos_ip`),
  KEY `turn_vos_status` (`turn_vos_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='话单表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
