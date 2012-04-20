/*
Navicat MySQL Data Transfer

Source Server         : MYSQL
Source Server Version : 50149
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50149
File Encoding         : 65001

Date: 2012-04-20 19:20:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bbs_forum`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forum`;
CREATE TABLE `bbs_forum` (
  `ForumID` int(11) NOT NULL AUTO_INCREMENT,
  `ForumGroupID` int(11) DEFAULT NULL,
  `ForumName` varchar(50) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  `TotalTopics` int(11) DEFAULT NULL,
  `TopicId` varchar(50) DEFAULT NULL,
  `TopicTitle` varchar(255) DEFAULT NULL,
  `TopicDate` datetime DEFAULT NULL,
  `UserID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ForumID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_forum
-- ----------------------------
INSERT INTO `bbs_forum` VALUES ('1', '4', '听力区', 'ddf', '1', '0', '0', null, null, null);
INSERT INTO `bbs_forum` VALUES ('2', '4', '口语区', 'aab', '2', '0', '0', null, null, null);
INSERT INTO `bbs_forum` VALUES ('3', '5', '听力区', '听力突破', '1', '0', '0', null, null, null);
INSERT INTO `bbs_forum` VALUES ('4', '5', '口语区', '口语资料大全', '2', '0', '0', null, null, null);

-- ----------------------------
-- Table structure for `bbs_forumgroup`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forumgroup`;
CREATE TABLE `bbs_forumgroup` (
  `ForumGroupID` int(11) NOT NULL,
  `ForumGroupName` varchar(255) DEFAULT NULL,
  `ForumGroupOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`ForumGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_forumgroup
-- ----------------------------
INSERT INTO `bbs_forumgroup` VALUES ('4', '英语四级区', '1');
INSERT INTO `bbs_forumgroup` VALUES ('5', '英语六级区', '2');

-- ----------------------------
-- Table structure for `bbs_forummaster`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forummaster`;
CREATE TABLE `bbs_forummaster` (
  `masterID` varchar(70) NOT NULL DEFAULT '',
  `ForumID` int(11) NOT NULL,
  `UserID` varchar(50) NOT NULL,
  PRIMARY KEY (`masterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_forummaster
-- ----------------------------
INSERT INTO `bbs_forummaster` VALUES ('1uhanppern', '1', 'hanppern');
INSERT INTO `bbs_forummaster` VALUES ('1uhanpperna', '1', 'hanpperna');

-- ----------------------------
-- Table structure for `bbs_forumpermission`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forumpermission`;
CREATE TABLE `bbs_forumpermission` (
  `RoleID` int(11) NOT NULL,
  `ForumID` int(11) NOT NULL,
  `ViewList` tinyint(1) DEFAULT NULL,
  `ViewDetail` tinyint(1) DEFAULT NULL,
  `AddTopic` tinyint(1) DEFAULT NULL,
  `ReplyTopic` tinyint(1) DEFAULT NULL,
  `ModifyTopic` tinyint(1) DEFAULT NULL,
  `DeleteTopic` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`RoleID`,`ForumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_forumpermission
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_generator`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_generator`;
CREATE TABLE `bbs_generator` (
  `gen_name` varchar(255) NOT NULL,
  `gen_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`gen_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_generator
-- ----------------------------
INSERT INTO `bbs_generator` VALUES ('forumgroup_pk', '6');
INSERT INTO `bbs_generator` VALUES ('forum_pk', '6');

-- ----------------------------
-- Table structure for `bbs_reply`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_reply`;
CREATE TABLE `bbs_reply` (
  `ReplyID` int(11) NOT NULL AUTO_INCREMENT,
  `ReplyTitle` varchar(100) DEFAULT NULL,
  `UserID` varchar(50) DEFAULT NULL,
  `TopicID` int(11) DEFAULT NULL,
  `Content` text,
  `Building` int(11) DEFAULT NULL,
  `ReplyDate` datetime DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`ReplyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_role`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_role`;
CREATE TABLE `bbs_role` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `RoleDesc` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_role
-- ----------------------------
INSERT INTO `bbs_role` VALUES ('-1', '系统管理员', '系统管理员');
INSERT INTO `bbs_role` VALUES ('0', '游客', '游客');
INSERT INTO `bbs_role` VALUES ('1', '普通会员', '正常网页注册的用户');

-- ----------------------------
-- Table structure for `bbs_topic`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_topic`;
CREATE TABLE `bbs_topic` (
  `TopicID` int(11) NOT NULL AUTO_INCREMENT,
  `PostTime` datetime DEFAULT NULL,
  `TotalReply` int(11) DEFAULT NULL,
  `UserID` varchar(50) DEFAULT NULL,
  `ForumID` int(11) DEFAULT NULL,
  `LastReplyUserID` varchar(50) DEFAULT NULL,
  `LastReplyDate` datetime DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `SetTop` tinyint(1) DEFAULT NULL,
  `Content` text,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`TopicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_topic
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_user`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_user`;
CREATE TABLE `bbs_user` (
  `UserID` varchar(50) NOT NULL,
  `RoleID` int(11) DEFAULT NULL,
  `PassWord` varchar(500) NOT NULL,
  `Sex` tinyint(1) DEFAULT NULL,
  `Face` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Forbidden` tinyint(1) DEFAULT NULL,
  `RegDate` datetime DEFAULT NULL,
  `TotalTopics` int(11) DEFAULT NULL,
  `TotalReplys` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `FK_RLUserBelong` (`RoleID`),
  CONSTRAINT `FK_RLUserBelong` FOREIGN KEY (`RoleID`) REFERENCES `bbs_role` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_user
-- ----------------------------
INSERT INTO `bbs_user` VALUES ('hanppern', '1', 'a', '1', 'g.jpeg', 'xu_jingchaoa@yahoo.com.cn', '0', '2011-11-21 15:54:24', '13', '18');
INSERT INTO `bbs_user` VALUES ('hanpperna', '1', 'a', '1', 'm.jpeg', 'jingk@163.com', '1', '2011-11-21 16:37:09', '0', '4');
INSERT INTO `bbs_user` VALUES ('joven', '1', 'a', '1', 'n.jpeg', 'xu_jingchao@yahoo.com.cna', '0', '2011-11-21 16:35:37', '2', '0');
INSERT INTO `bbs_user` VALUES ('sysadmin', '-1', 'a', '0', 'a.jpeg', 'xx@xx.com', '0', '2011-11-21 15:58:31', '0', '0');
INSERT INTO `bbs_user` VALUES ('xxx', '1', 'xxx', '1', 'c.jpeg', '', '0', '2011-12-05 19:40:33', '0', '0');
INSERT INTO `bbs_user` VALUES ('xxxa', '1', 'a', '1', 'a.jpeg', 'xu_jingchao@yahoo.com.cn', '0', '2011-12-05 19:41:26', '0', '0');
INSERT INTO `bbs_user` VALUES ('xxxx', '1', 'xxxx', '0', 'k.jpeg', '', '0', '2011-12-05 19:41:00', '0', '0');
INSERT INTO `bbs_user` VALUES ('中文名', '1', 'a', '1', 'b.jpeg', '', '0', '2011-12-08 11:37:30', '0', '0');
INSERT INTO `bbs_user` VALUES ('老徐', '1', 'c', '1', 'h.jpeg', 'jingkb@163.com', '0', '2011-11-24 14:00:16', '1', '1');
