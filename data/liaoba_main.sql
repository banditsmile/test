-- MySQL dump 10.13  Distrib 5.1.69, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: liaoba_main
-- ------------------------------------------------------
-- Server version	5.5.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `liaoba_adven_records`
--

DROP TABLE IF EXISTS `liaoba_adven_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_adven_records` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '匹配ID',
  `fromuid` bigint(14) NOT NULL DEFAULT '0' COMMENT '发起者ID',
  `touid` bigint(14) NOT NULL DEFAULT '0' COMMENT '接受者ID',
  `cmd` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邀请状态0邀请1接受2拒绝',
  `times` smallint(4) unsigned NOT NULL DEFAULT '0',
  `chatid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '通话ID',
  `invitetime` int(11) NOT NULL DEFAULT '0' COMMENT '发起时间',
  `accepttime` int(11) NOT NULL DEFAULT '0' COMMENT '接受时间',
  PRIMARY KEY (`aid`),
  KEY `chatid` (`chatid`)
) ENGINE=InnoDB AUTO_INCREMENT=33912 DEFAULT CHARSET=utf8mb4 COMMENT='大冒险玩家列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_album`
--

DROP TABLE IF EXISTS `liaoba_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` bigint(14) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_album_complain`
--

DROP TABLE IF EXISTS `liaoba_album_complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_album_complain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  `photo_src` varchar(255) NOT NULL,
  `photo_userid` int(11) NOT NULL,
  `times` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '处理状态：0未处理，1投诉无效，忽略，2投诉有效，照片已删除',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `photo_id` (`photo_id`),
  KEY `times` (`times`),
  KEY `updated_at` (`updated_at`),
  KEY `status` (`status`),
  KEY `photo_userid` (`photo_userid`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_album_complain_detail`
--

DROP TABLE IF EXISTS `liaoba_album_complain_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_album_complain_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complain_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `from_userid` bigint(14) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `complain_id` (`complain_id`),
  KEY `type` (`type`),
  KEY `from_userid` (`from_userid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=500 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_album_photo`
--

DROP TABLE IF EXISTS `liaoba_album_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_album_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `userid` bigint(14) NOT NULL,
  `album_id` int(11) NOT NULL DEFAULT '0' COMMENT '相册id',
  `description` varchar(255) NOT NULL DEFAULT '',
  `src` varchar(128) NOT NULL DEFAULT '' COMMENT '图片地址',
  `praise` int(11) NOT NULL DEFAULT '0' COMMENT '赞',
  `egg` int(11) NOT NULL DEFAULT '0' COMMENT '扁',
  `weight` int(11) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态1正常2删除',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `userid` (`userid`),
  KEY `weight` (`weight`),
  KEY `status` (`status`),
  KEY `create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=37848 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_album_praise`
--

DROP TABLE IF EXISTS `liaoba_album_praise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_album_praise` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(14) NOT NULL,
  `photoid` int(11) NOT NULL,
  `counts` smallint(4) NOT NULL,
  `period` datetime NOT NULL,
  `lastmodify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `photoid` (`photoid`),
  KEY `counts` (`counts`),
  KEY `period` (`period`),
  KEY `lastmodify` (`lastmodify`)
) ENGINE=InnoDB AUTO_INCREMENT=9077 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_areacode`
--

DROP TABLE IF EXISTS `liaoba_areacode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_areacode` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `areacode` char(10) NOT NULL DEFAULT '' COMMENT '国家代码',
  `country` char(64) NOT NULL DEFAULT '' COMMENT '国家名称',
  `mobilelen` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '手机位数',
  PRIMARY KEY (`aid`),
  KEY `areacode` (`areacode`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='国家代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_assess`
--

DROP TABLE IF EXISTS `liaoba_assess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_assess` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `commentid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '评价类别ID',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '评价内容',
  `opuserid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `opdateline` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`cid`),
  KEY `userid` (`userid`),
  KEY `opdateline` (`opdateline`),
  KEY `commentid` (`commentid`)
) ENGINE=InnoDB AUTO_INCREMENT=11707 DEFAULT CHARSET=utf8mb4 COMMENT='用户评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_auto_userid`
--

DROP TABLE IF EXISTS `liaoba_auto_userid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_auto_userid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=1081204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_avatar_praise`
--

DROP TABLE IF EXISTS `liaoba_avatar_praise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_avatar_praise` (
  `rid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '操作类型',
  `opuserid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `opdateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`rid`),
  KEY `userid` (`userid`),
  KEY `opuserid` (`opuserid`),
  KEY `opdateline` (`opdateline`)
) ENGINE=InnoDB AUTO_INCREMENT=7960 DEFAULT CHARSET=utf8mb4 COMMENT='用户头像赞表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_avatar_report`
--

DROP TABLE IF EXISTS `liaoba_avatar_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_avatar_report` (
  `rid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '举报类型',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义内容',
  `opuserid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `opdateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`rid`),
  KEY `userid` (`userid`),
  KEY `opuserid` (`opuserid`),
  KEY `opdateline` (`opdateline`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=773 DEFAULT CHARSET=utf8mb4 COMMENT='用户头像举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_blacklist`
--

DROP TABLE IF EXISTS `liaoba_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_blacklist` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '黑名用户ID',
  `opuserid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `opdateline` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`bid`),
  KEY `opuserid` (`opuserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='黑名单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_censor`
--

DROP TABLE IF EXISTS `liaoba_censor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_censor` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '词汇id',
  `type` smallint(6) NOT NULL DEFAULT '0' COMMENT '关键词分类',
  `find` varchar(255) NOT NULL DEFAULT '' COMMENT '不良词语',
  `replacement` varchar(255) NOT NULL DEFAULT '' COMMENT '替换内容',
  `extra` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1067 DEFAULT CHARSET=utf8mb4 COMMENT='词语过滤表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_chat`
--

DROP TABLE IF EXISTS `liaoba_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_chat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '请求队列ID',
  `f_userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '主叫用户ID',
  `f_gender` char(10) NOT NULL DEFAULT '' COMMENT '主叫匹配性别1男2女',
  `f_network` char(16) NOT NULL DEFAULT '' COMMENT '主叫网络类型',
  `f_mobile` char(16) NOT NULL DEFAULT '' COMMENT '手机号',
  `f_platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `f_version` varchar(10) NOT NULL DEFAULT '' COMMENT '版本',
  `f_dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主叫请求时间',
  `t_userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '被叫用户ID',
  `t_gender` char(10) NOT NULL DEFAULT '' COMMENT '被叫匹配性别1男2女',
  `t_network` char(16) NOT NULL DEFAULT '' COMMENT '被叫网络类型',
  `t_mobile` char(16) NOT NULL DEFAULT '' COMMENT '手机号',
  `t_platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `t_version` varchar(10) NOT NULL DEFAULT '' COMMENT '版本',
  `t_dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被叫请求时间',
  `calltype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '通话类型1速配0指定呼叫',
  `isend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否结束通话',
  `isassessed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否评价过',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '通话开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '通话结束时间',
  `calltime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '通话时长',
  `consum` int(11) NOT NULL DEFAULT '0' COMMENT '消耗金币数',
  PRIMARY KEY (`cid`),
  KEY `f_userid` (`f_userid`),
  KEY `t_userid` (`t_userid`),
  KEY `calltype` (`calltype`),
  KEY `isend` (`isend`),
  KEY `calltime` (`calltime`),
  KEY `starttime` (`starttime`),
  KEY `f_network` (`f_network`),
  KEY `t_network` (`t_network`)
) ENGINE=InnoDB AUTO_INCREMENT=297588 DEFAULT CHARSET=utf8mb4 COMMENT='速配聊天列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_chat_queue`
--

DROP TABLE IF EXISTS `liaoba_chat_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_chat_queue` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '请求队列ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `nickname` varchar(40) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '匹配模式1普通2插队',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户性别',
  `findgender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '匹配性别',
  `network` char(16) NOT NULL DEFAULT '' COMMENT '网络类型',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `assess` tinyint(4) NOT NULL DEFAULT '0' COMMENT '好评率',
  `mobile` char(16) NOT NULL DEFAULT '' COMMENT '手机号',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `version` varchar(10) NOT NULL DEFAULT '' COMMENT '版本',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '请求时间',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `userid` (`userid`),
  KEY `type` (`type`),
  KEY `gender` (`gender`),
  KEY `network` (`network`),
  KEY `dateline` (`dateline`)
) ENGINE=InnoDB AUTO_INCREMENT=758990 DEFAULT CHARSET=utf8mb4 COMMENT='速配队列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_chat_queue_t`
--

DROP TABLE IF EXISTS `liaoba_chat_queue_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_chat_queue_t` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '请求队列ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '匹配模式',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户性别',
  `findgender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '匹配性别',
  `network` char(16) NOT NULL DEFAULT '' COMMENT '网络类型',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `assess` tinyint(4) NOT NULL DEFAULT '0' COMMENT '好评率',
  `mobile` char(16) NOT NULL DEFAULT '' COMMENT '手机号',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `version` varchar(10) NOT NULL DEFAULT '' COMMENT '版本',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '请求时间',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `userid` (`userid`),
  KEY `type` (`type`),
  KEY `gender` (`gender`),
  KEY `network` (`network`),
  KEY `dateline` (`dateline`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COMMENT='速配队列表测试';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_credit_log`
--

DROP TABLE IF EXISTS `liaoba_credit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_credit_log` (
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户uid',
  `operation` char(3) NOT NULL COMMENT '操作类型',
  `relatedid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作相关ID',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录时间',
  `extcredits1` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `extcredits2` int(11) NOT NULL DEFAULT '0' COMMENT '银币',
  `extcredits3` int(11) NOT NULL DEFAULT '0' COMMENT '魅力值',
  `extcredits4` int(11) NOT NULL DEFAULT '0' COMMENT '经验值',
  KEY `uid` (`uid`),
  KEY `operation` (`operation`),
  KEY `relatedid` (`relatedid`),
  KEY `dateline` (`dateline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='积分日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_credit_rule`
--

DROP TABLE IF EXISTS `liaoba_credit_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_credit_rule` (
  `rid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `rulename` varchar(20) NOT NULL COMMENT '规则名称',
  `action` varchar(20) NOT NULL COMMENT '规则action唯一KEY',
  `cycletype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '奖励周期0:一次;1:每天;2:不限;',
  `rewardnum` tinyint(2) NOT NULL DEFAULT '1' COMMENT '奖励次数',
  `norepeat` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否去重1：去重;0：不去重',
  `extcredits1` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `extcredits2` int(11) NOT NULL DEFAULT '0' COMMENT '银币',
  `extcredits3` int(11) NOT NULL DEFAULT '0' COMMENT '魅力值',
  `extcredits4` int(11) NOT NULL DEFAULT '0' COMMENT '经验值',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `action` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='积分规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_credit_rule_log`
--

DROP TABLE IF EXISTS `liaoba_credit_rule_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_credit_rule_log` (
  `clid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '策略日志ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '策略日志所有者uid',
  `rid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '策略ID',
  `total` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '策略被执行总次数',
  `cyclenum` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '周期被执行次数',
  `extcredits1` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `extcredits2` int(11) NOT NULL DEFAULT '0' COMMENT '银币',
  `extcredits3` int(11) NOT NULL DEFAULT '0' COMMENT '魅力值',
  `extcredits4` int(11) NOT NULL DEFAULT '0' COMMENT '经验值',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期开始时间',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '策略最后执行时间',
  PRIMARY KEY (`clid`),
  KEY `uid` (`userid`,`rid`),
  KEY `dateline` (`dateline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='积分规则日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_ctop`
--

DROP TABLE IF EXISTS `liaoba_ctop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_ctop` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ctop` (`cid`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4019 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_feedback`
--

DROP TABLE IF EXISTS `liaoba_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_feedback` (
  `fid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '反馈ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '软件平台',
  `version` char(10) NOT NULL DEFAULT '' COMMENT '软件版本',
  `contact` varchar(128) NOT NULL COMMENT '联系方式',
  `content` varchar(255) NOT NULL COMMENT '反馈内容',
  `dateline` int(11) unsigned NOT NULL COMMENT '反馈时间',
  PRIMARY KEY (`fid`),
  KEY `dateline` (`dateline`),
  KEY `userid` (`userid`),
  KEY `platform` (`platform`),
  KEY `version` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8mb4 COMMENT='用户反馈表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_following`
--

DROP TABLE IF EXISTS `liaoba_following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_following` (
  `fid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `fromuid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '关注者ID',
  `touid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '被关注者ID',
  `remark` varchar(64) NOT NULL DEFAULT '' COMMENT '备注名',
  `isfollowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否互相关注',
  `dateline` int(11) NOT NULL DEFAULT '0' COMMENT '关注事件',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='关注表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_level`
--

DROP TABLE IF EXISTS `liaoba_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_level` (
  `lid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '级别ID',
  `level` tinyint(3) NOT NULL DEFAULT '0' COMMENT '级别',
  `credithigher` int(11) NOT NULL DEFAULT '0' COMMENT '最低积分',
  `creditlower` int(11) NOT NULL DEFAULT '0' COMMENT '最高积分',
  PRIMARY KEY (`lid`),
  KEY `level` (`level`),
  KEY `credithigher` (`credithigher`),
  KEY `creditlower` (`creditlower`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='用户级别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_message_media`
--

DROP TABLE IF EXISTS `liaoba_message_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_message_media` (
  `mid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `shorturl` varchar(255) NOT NULL DEFAULT '' COMMENT '短地址',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '原地址',
  `mediatype` char(10) NOT NULL DEFAULT '' COMMENT '文件类型',
  `dateline` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '生成时间',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8mb4 COMMENT='消息文件存储表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_mobile_country`
--

DROP TABLE IF EXISTS `liaoba_mobile_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_mobile_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AreaCode` varchar(15) DEFAULT NULL,
  `AreaEname` varchar(150) DEFAULT NULL,
  `AreaName` varchar(150) DEFAULT NULL,
  `UserCode` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AreaCode` (`AreaCode`),
  KEY `UserCode` (`UserCode`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_mobile_local`
--

DROP TABLE IF EXISTS `liaoba_mobile_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_mobile_local` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MobileNumber` varchar(20) DEFAULT NULL,
  `MobileArea` varchar(50) DEFAULT NULL,
  `MobileType` varchar(50) DEFAULT NULL,
  `AreaCode` varchar(10) DEFAULT NULL,
  `PostCode` varchar(50) DEFAULT NULL,
  `UserCode` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `MobileNumber` (`MobileNumber`),
  KEY `AreaCode` (`AreaCode`),
  KEY `UserCode` (`UserCode`)
) ENGINE=InnoDB AUTO_INCREMENT=488155 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_notice`
--

DROP TABLE IF EXISTS `liaoba_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_notice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `platform` varchar(32) NOT NULL DEFAULT '' COMMENT '平台',
  `startTime` datetime NOT NULL COMMENT '开始时间',
  `endTime` datetime NOT NULL COMMENT '结束时间',
  `content` text NOT NULL COMMENT '内容',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `opver` varchar(32) NOT NULL DEFAULT 'all' COMMENT '版本控制all所有ge大于等于lt小于eq等于',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `startTime` (`startTime`),
  KEY `endTime` (`endTime`),
  KEY `fromVersion` (`version`),
  KEY `toVersion` (`opver`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_payment_order`
--

DROP TABLE IF EXISTS `liaoba_payment_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_payment_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `userid` bigint(14) NOT NULL COMMENT '用户id',
  `pay_mode` enum('alipay','unionpay','szx-card','unicom-card','appstore') DEFAULT NULL COMMENT '支付方式',
  `epay_trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '支付订单号',
  `total_price` decimal(10,2) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` varchar(512) NOT NULL,
  `status` enum('non-payment','paid','success') NOT NULL DEFAULT 'non-payment',
  `created_at` datetime NOT NULL,
  `system_log` varchar(2000) NOT NULL DEFAULT '',
  `product_quantity` int(11) NOT NULL DEFAULT '1',
  `product_id` int(11) NOT NULL,
  `product_appstore_buyid` varchar(50) NOT NULL,
  `product_add_goldcoin` int(11) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_currency` char(20) NOT NULL DEFAULT 'CNY',
  `platform` char(32) NOT NULL DEFAULT '' COMMENT '软件平台',
  `version` char(10) NOT NULL DEFAULT '' COMMENT '软件版本',
  `ispb` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否越狱',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`),
  KEY `userid` (`userid`),
  KEY `pay_mode` (`pay_mode`),
  KEY `epay_trade_no` (`epay_trade_no`(191)),
  KEY `product_appstore_buyid` (`product_appstore_buyid`)
) ENGINE=InnoDB AUTO_INCREMENT=682 DEFAULT CHARSET=utf8mb4 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_payment_product`
--

DROP TABLE IF EXISTS `liaoba_payment_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_payment_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appstore_buyid` varchar(32) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL,
  `title` varchar(127) NOT NULL,
  `subtitle` varchar(255) NOT NULL DEFAULT '',
  `title_color` varchar(20) NOT NULL DEFAULT '#000000',
  `subtitle_color` varchar(20) NOT NULL DEFAULT '#fe6718',
  `description` varchar(2000) NOT NULL DEFAULT '',
  `pay_modes` set('alipay','unionpay','szx-card','unicom-card','appstore') NOT NULL COMMENT '支付类型为appstore时，appstore_buyid必需',
  `stock` int(11) NOT NULL DEFAULT '999999999',
  `add_goldcoin` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `market_price` decimal(10,2) NOT NULL,
  `currency` char(20) NOT NULL DEFAULT 'CNY',
  `start_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `end_time` datetime NOT NULL DEFAULT '2999-12-31 00:00:00',
  `weight` int(11) NOT NULL DEFAULT '0',
  `app_version_min` char(20) NOT NULL DEFAULT '0.0.0',
  `app_version_max` char(20) NOT NULL DEFAULT 'z.z.z',
  `created_at` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `online` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `appstore_buyid` (`appstore_buyid`),
  KEY `pay_modes` (`pay_modes`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `weight` (`weight`),
  KEY `app_version_min` (`app_version_min`),
  KEY `app_version_max` (`app_version_max`),
  KEY `created_at` (`created_at`),
  KEY `last_modified` (`last_modified`),
  KEY `online` (`online`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_problem`
--

DROP TABLE IF EXISTS `liaoba_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_problem` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `level` smallint(2) NOT NULL COMMENT '级别',
  `sex` smallint(1) DEFAULT NULL COMMENT '性别',
  `free` smallint(4) DEFAULT NULL,
  `a_free` smallint(4) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `answer` varchar(150) DEFAULT NULL,
  `resources` varchar(150) DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`),
  KEY `idx_answer` (`answer`),
  KEY `idx_last_modified` (`last_modified`)
) ENGINE=InnoDB AUTO_INCREMENT=2166 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_problem_category`
--

DROP TABLE IF EXISTS `liaoba_problem_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_problem_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `type` varchar(4) NOT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`),
  KEY `idx_last_modified` (`last_modified`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_question_records`
--

DROP TABLE IF EXISTS `liaoba_question_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_question_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `buddy` varchar(32) NOT NULL,
  `times` int(11) NOT NULL COMMENT '提问次数',
  `question_id` int(11) NOT NULL,
  `pay_moeny` float NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `matched_id` varchar(32) NOT NULL,
  `statisfied` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `matched_id` (`matched_id`),
  KEY `buddy` (`buddy`)
) ENGINE=InnoDB AUTO_INCREMENT=56726 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_report`
--

DROP TABLE IF EXISTS `liaoba_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_report` (
  `rid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '举报类型0自定义原因1骚扰信息2色情信息3性别不符',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义内容',
  `opuserid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `opdateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`rid`),
  KEY `userid` (`userid`),
  KEY `opuserid` (`opuserid`),
  KEY `opdateline` (`opdateline`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4237 DEFAULT CHARSET=utf8mb4 COMMENT='用户举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_serviceidentify`
--

DROP TABLE IF EXISTS `liaoba_serviceidentify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_serviceidentify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` bigint(14) NOT NULL,
  `servicetype` varchar(16) NOT NULL,
  `flag` int(2) NOT NULL,
  `opentime` datetime NOT NULL,
  `closetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `servertype` (`servicetype`)
) ENGINE=InnoDB AUTO_INCREMENT=10202 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_session`
--

DROP TABLE IF EXISTS `liaoba_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_session` (
  `userid` bigint(14) unsigned NOT NULL COMMENT '用户id',
  `token` char(32) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `cretetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '生成时间',
  `expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Session记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_setting`
--

DROP TABLE IF EXISTS `liaoba_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_setting` (
  `module` char(32) NOT NULL,
  `skey` varchar(255) NOT NULL DEFAULT '' COMMENT '键',
  `svalue` text NOT NULL COMMENT '值',
  KEY `skey` (`skey`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_stat_call`
--

DROP TABLE IF EXISTS `liaoba_stat_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_stat_call` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `daytime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '日期',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '点对点和voip两类:not_voip,voip',
  `request` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发起总数',
  `response` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '应答总数',
  `ios_request` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ios发起总量',
  `ios_response` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ios应答总量',
  `an_request` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安卓发起总数',
  `an_response` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安卓应答总数',
  `calltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '通话总时长',
  `avg_calltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '平均通话时长',
  `avg_callrate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '平均接通率',
  `ios_calltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ios通话总时长',
  `ios_avg_calltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ios平均通话时长',
  `ios_avg_callrate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ios平均接通率',
  `an_calltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安卓通话总时长',
  `an_avg_calltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安卓平均通话时长',
  `an_avg_callrate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安卓平均接通率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=518 DEFAULT CHARSET=utf8mb4 COMMENT='统计通话';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_stat_channel`
--

DROP TABLE IF EXISTS `liaoba_stat_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_stat_channel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `daytime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '日期',
  `platform` varchar(10) NOT NULL COMMENT '平台',
  `channel` varchar(11) NOT NULL COMMENT '渠道',
  `downs` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4532 DEFAULT CHARSET=utf8mb4 COMMENT='统计渠道';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_stat_chat`
--

DROP TABLE IF EXISTS `liaoba_stat_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_stat_chat` (
  `daytime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '日期',
  `chat_total` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '语音速配总使用人次',
  `wifi` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'WIFI用户使用人次',
  `no_wifi` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '非WIFI用户使用人次',
  `chat_user` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '语音速配使用人数(独立用户数)',
  `success` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '匹配成功灵敏',
  `female` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '使用语音速配的女性',
  `male` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '使用语音速配的男性',
  `female_request` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '女性的请求量',
  `male_request` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '男性的请求量',
  `calltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '通话总时长',
  `avg_calltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '平均通话时长(ACD)',
  `avg_callrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '平均接通率(ASR)',
  `ios_calltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'IOS通话总时长',
  `ios_avg_calltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'IOS平均通话时长',
  `ios_avg_callrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT 'IOS平均接通率',
  `an_calltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安卓通话总时长',
  `an_avg_calltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安卓平均通话时长',
  `an_avg_callrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '安卓平均接通率',
  PRIMARY KEY (`daytime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='统计速配';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_stat_paycost`
--

DROP TABLE IF EXISTS `liaoba_stat_paycost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_stat_paycost` (
  `daytime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '日期',
  `pay` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '总充值金额',
  `ios_pay` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ios充值金额',
  `an_pay` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安卓充值金额',
  `ios_pb_pay` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ios越狱充值',
  `cost` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '总消费金额',
  `ios_cost` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ios消费金额',
  `an_cost` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安卓消费金额',
  `ios_pb_cost` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ios越狱消费',
  PRIMARY KEY (`daytime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='充值与消费表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_stat_realtime`
--

DROP TABLE IF EXISTS `liaoba_stat_realtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_stat_realtime` (
  `id` int(11) unsigned NOT NULL COMMENT '序号',
  `daytime` int(8) unsigned NOT NULL COMMENT '日期',
  `time` char(5) NOT NULL COMMENT '时间',
  `online` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '在线人数',
  `chat` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '速配人数',
  `adven` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '大冒险人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='实时统计表(暂没用到，已经用redis取代)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_stat_user`
--

DROP TABLE IF EXISTS `liaoba_stat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_stat_user` (
  `daytime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '日期',
  `register` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册数',
  `login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登录数',
  `follow` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关注数',
  `album` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '相册数',
  `comment` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `complaint` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '举报数',
  `recharge` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '充值数',
  `adven` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '玩大冒险人数',
  `chat` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '速配数',
  `male_register` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '男性注册数',
  `male_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '男性登陆数',
  `female_register` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '女性注册数',
  `female_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '女性登陆数',
  `ios_register` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ios 注册数',
  `ios_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ios登陆数',
  `android_register` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'android注册数',
  `android_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'android登陆数',
  PRIMARY KEY (`daytime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_user`
--

DROP TABLE IF EXISTS `liaoba_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_user` (
  `uid` bigint(14) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userid` bigint(14) unsigned NOT NULL COMMENT '用户ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态1正常2禁用',
  `username` char(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` char(32) NOT NULL DEFAULT '' COMMENT '手机号码',
  `regip` char(15) NOT NULL DEFAULT '' COMMENT '注册IP',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `salt` char(6) NOT NULL DEFAULT '' COMMENT '随机数',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `mobile` (`mobile`),
  KEY `regdate` (`regdate`),
  KEY `uid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=1081205 DEFAULT CHARSET=utf8mb4 COMMENT='用户主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_user_connect`
--

DROP TABLE IF EXISTS `liaoba_user_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_user_connect` (
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方登录类型',
  `value` varchar(256) NOT NULL DEFAULT '' COMMENT '第三方登录标识',
  `token` text NOT NULL COMMENT 'TOKEN信息',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_user_count`
--

DROP TABLE IF EXISTS `liaoba_user_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_user_count` (
  `userid` bigint(14) unsigned NOT NULL COMMENT '会员id',
  `extcredits1` int(11) NOT NULL DEFAULT '0' COMMENT '预留字段',
  `extcredits2` int(11) NOT NULL DEFAULT '0' COMMENT '预留字段',
  `extcredits3` int(11) NOT NULL DEFAULT '0' COMMENT '魅力值',
  `extcredits4` int(11) NOT NULL DEFAULT '0' COMMENT '经验值',
  `albums` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '相册数',
  `follower` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝数量',
  `following` int(11) NOT NULL DEFAULT '0' COMMENT '关注数量',
  `newfollower` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增粉丝数量',
  `assess` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '评价数',
  `reports` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '举报数',
  `praise` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '相册赞数',
  `oltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户在线时间',
  `voipcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'VOIP接听次数',
  `avatarpraise` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '头像赞数',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_user_profile`
--

DROP TABLE IF EXISTS `liaoba_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_user_profile` (
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `username` char(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `areacode` char(10) NOT NULL DEFAULT '' COMMENT '国家编码',
  `mobile` char(16) NOT NULL DEFAULT '' COMMENT '手机号',
  `issetpwd` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否设置密码',
  `birthday` char(10) NOT NULL DEFAULT '' COMMENT '出生日期',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `avatar` varchar(256) NOT NULL DEFAULT '' COMMENT '头像',
  `lastloginip` char(64) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `udid` char(32) NOT NULL DEFAULT '' COMMENT '设备编号',
  `token` char(64) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `imei` char(32) NOT NULL DEFAULT '' COMMENT 'IMEI号',
  `mac` char(32) NOT NULL DEFAULT '' COMMENT 'MAC地址',
  `imsi` char(32) NOT NULL DEFAULT '' COMMENT 'IMSI号',
  `platform` char(32) NOT NULL DEFAULT '' COMMENT '安装平台',
  `version` char(10) NOT NULL DEFAULT '' COMMENT '软件版本',
  `registerip` char(64) NOT NULL DEFAULT '' COMMENT '注册ip',
  `registertime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `signtext` varchar(50) NOT NULL DEFAULT '' COMMENT '文本签名',
  `signsound` varchar(255) NOT NULL DEFAULT '' COMMENT '语音签名',
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT '所在省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '所在市',
  `channel` varchar(32) NOT NULL DEFAULT '' COMMENT '注册渠道',
  `comefrom` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '用户来源',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态1正常2禁用',
  PRIMARY KEY (`userid`),
  KEY `username` (`username`),
  KEY `mobile` (`mobile`),
  KEY `nickname` (`nickname`),
  KEY `lastlogintime` (`lastlogintime`),
  KEY `registertime` (`registertime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户资料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_user_setting`
--

DROP TABLE IF EXISTS `liaoba_user_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_user_setting` (
  `userid` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `msgaccept` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否接收新消息通知1接受0不接受1显示0不显示',
  `msgdetail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '消息通知是否显示详情1显示0不显示',
  `dndenable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启免打扰1开启0不开启',
  `dndtype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '免打扰类型0只对陌生人1对所有人',
  `dndtoday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否当天',
  `dndstarttime` char(6) NOT NULL DEFAULT '' COMMENT '免打扰开始时间22:00',
  `dndendtime` char(6) NOT NULL DEFAULT '' COMMENT '免打扰结束时间08:00',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_verifycode`
--

DROP TABLE IF EXISTS `liaoba_verifycode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_verifycode` (
  `vid` int(11) NOT NULL AUTO_INCREMENT COMMENT '验证码ID',
  `udid` char(32) NOT NULL DEFAULT '' COMMENT '设备编码',
  `areacode` char(10) NOT NULL DEFAULT '' COMMENT '国家编码',
  `mobile` char(16) NOT NULL DEFAULT '' COMMENT '手机号码',
  `verifycode` char(6) NOT NULL DEFAULT '' COMMENT '验证码',
  `smstype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '业务类型：1注册2找回密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '验证码状态',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '生成时间',
  PRIMARY KEY (`vid`),
  KEY `udid` (`udid`),
  KEY `mobile` (`mobile`),
  KEY `smstype` (`smstype`),
  KEY `dateline` (`dateline`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=113427 DEFAULT CHARSET=utf8mb4 COMMENT='手机验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liaoba_versions`
--

DROP TABLE IF EXISTS `liaoba_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaoba_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(32) NOT NULL DEFAULT '',
  `ispb` int(1) NOT NULL DEFAULT '0' COMMENT '是否越狱0非越狱1越狱',
  `released` int(1) NOT NULL DEFAULT '0',
  `forces` int(11) NOT NULL DEFAULT '0',
  `release_log` text NOT NULL,
  `release_date` datetime NOT NULL,
  `download_url` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `version` (`version`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='软件版本升级列表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-20 17:58:49
