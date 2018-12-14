/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : wemall

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-10-24 20:08:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wemall_accessory
-- ----------------------------
DROP TABLE IF EXISTS `wemall_accessory`;
CREATE TABLE `wemall_accessory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `height` int(11) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `size` float NOT NULL,
  `width` int(11) NOT NULL,
  `album_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `config_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9BF2D721537B6C51` (`user_id`),
  KEY `FK9BF2D7218603E3C3` (`album_id`),
  KEY `FK9BF2D721707C8F90` (`config_id`),
  CONSTRAINT `FK9BF2D721537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK9BF2D721707C8F90` FOREIGN KEY (`config_id`) REFERENCES `wemall_sysconfig` (`id`),
  CONSTRAINT `FK9BF2D7218603E3C3` FOREIGN KEY (`album_id`) REFERENCES `wemall_album` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426502 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_activity
-- ----------------------------
DROP TABLE IF EXISTS `wemall_activity`;
CREATE TABLE `wemall_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ac_begin_time` date DEFAULT NULL,
  `ac_content` longtext,
  `ac_end_time` date DEFAULT NULL,
  `ac_sequence` int(11) NOT NULL,
  `ac_status` int(11) NOT NULL,
  `ac_title` varchar(255) DEFAULT NULL,
  `ac_acc_id` bigint(20) DEFAULT NULL,
  `ac_rebate` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK11BFAD20D8BBB351` (`ac_acc_id`),
  CONSTRAINT `FK11BFAD20D8BBB351` FOREIGN KEY (`ac_acc_id`) REFERENCES `wemall_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_activity_goods
-- ----------------------------
DROP TABLE IF EXISTS `wemall_activity_goods`;
CREATE TABLE `wemall_activity_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ag_status` int(11) NOT NULL,
  `act_id` bigint(20) DEFAULT NULL,
  `ag_admin_id` bigint(20) DEFAULT NULL,
  `ag_goods_id` bigint(20) DEFAULT NULL,
  `ag_price` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA9F9A5DDA6BB88F7` (`ag_admin_id`),
  KEY `FKA9F9A5DD60FB2C1F` (`act_id`),
  KEY `FKA9F9A5DDED2E89CB` (`ag_goods_id`),
  CONSTRAINT `FKA9F9A5DD60FB2C1F` FOREIGN KEY (`act_id`) REFERENCES `wemall_activity` (`id`),
  CONSTRAINT `FKA9F9A5DDA6BB88F7` FOREIGN KEY (`ag_admin_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKA9F9A5DDED2E89CB` FOREIGN KEY (`ag_goods_id`) REFERENCES `wemall_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_address
-- ----------------------------
DROP TABLE IF EXISTS `wemall_address`;
CREATE TABLE `wemall_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `area_info` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `trueName` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9ABDBC3537B6C51` (`user_id`),
  KEY `FK9ABDBC32FB91D11` (`area_id`) USING BTREE,
  CONSTRAINT `FK9ABDBC32FB91D11` FOREIGN KEY (`area_id`) REFERENCES `wemall_area` (`id`),
  CONSTRAINT `FK9ABDBC3537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32777 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_advert
-- ----------------------------
DROP TABLE IF EXISTS `wemall_advert`;
CREATE TABLE `wemall_advert` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ad_begin_time` date DEFAULT NULL,
  `ad_click_num` int(11) NOT NULL,
  `ad_end_time` date DEFAULT NULL,
  `ad_gold` int(11) NOT NULL,
  `ad_slide_sequence` int(11) NOT NULL,
  `ad_status` int(11) NOT NULL,
  `ad_text` varchar(255) DEFAULT NULL,
  `ad_title` varchar(255) DEFAULT NULL,
  `ad_url` varchar(255) DEFAULT NULL,
  `ad_acc_id` bigint(20) DEFAULT NULL,
  `ad_ap_id` bigint(20) DEFAULT NULL,
  `ad_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCECB7A255A9A4C35` (`ad_user_id`) USING BTREE,
  KEY `FKCECB7A25296B4EE3` (`ad_ap_id`) USING BTREE,
  KEY `FKCECB7A25409CE030` (`ad_acc_id`) USING BTREE,
  CONSTRAINT `FKCECB7A25296B4EE3` FOREIGN KEY (`ad_ap_id`) REFERENCES `wemall_adv_pos` (`id`),
  CONSTRAINT `FKCECB7A25409CE030` FOREIGN KEY (`ad_acc_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FKCECB7A255A9A4C35` FOREIGN KEY (`ad_user_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=262158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_adv_pos
-- ----------------------------
DROP TABLE IF EXISTS `wemall_adv_pos`;
CREATE TABLE `wemall_adv_pos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ap_acc_url` varchar(255) DEFAULT NULL,
  `ap_code` longtext,
  `ap_content` longtext,
  `ap_height` int(11) NOT NULL,
  `ap_price` int(11) NOT NULL,
  `ap_sale_type` int(11) NOT NULL,
  `ap_show_type` int(11) NOT NULL,
  `ap_status` int(11) NOT NULL,
  `ap_sys_type` int(11) NOT NULL,
  `ap_text` varchar(255) DEFAULT NULL,
  `ap_title` varchar(255) DEFAULT NULL,
  `ap_type` varchar(255) DEFAULT NULL,
  `ap_use_status` int(11) NOT NULL,
  `ap_width` int(11) NOT NULL,
  `ap_acc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAA108971F2AFAA4` (`ap_acc_id`) USING BTREE,
  CONSTRAINT `FKAA108971F2AFAA4` FOREIGN KEY (`ap_acc_id`) REFERENCES `wemall_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=262158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_album
-- ----------------------------
DROP TABLE IF EXISTS `wemall_album`;
CREATE TABLE `wemall_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `alblum_info` longtext,
  `album_default` bit(1) NOT NULL,
  `album_name` varchar(255) DEFAULT NULL,
  `album_sequence` int(11) NOT NULL,
  `album_cover_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2FF965FE537B6C51` (`user_id`),
  KEY `FK2FF965FE58AB9D6E` (`album_cover_id`),
  CONSTRAINT `FK2FF965FE537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK2FF965FE58AB9D6E` FOREIGN KEY (`album_cover_id`) REFERENCES `wemall_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_area
-- ----------------------------
DROP TABLE IF EXISTS `wemall_area`;
CREATE TABLE `wemall_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `areaName` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `common` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FK7D6B3B1ED79E13D4` (`parent_id`),
  CONSTRAINT `FK7D6B3B1ED79E13D4` FOREIGN KEY (`parent_id`) REFERENCES `wemall_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4525504 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_article
-- ----------------------------
DROP TABLE IF EXISTS `wemall_article`;
CREATE TABLE `wemall_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `display` bit(1) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `articleClass_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK226D0CC544EDEDD1` (`articleClass_id`) USING BTREE,
  CONSTRAINT `wemall_article_ibfk_1` FOREIGN KEY (`articleClass_id`) REFERENCES `wemall_articleclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196624 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_articleclass
-- ----------------------------
DROP TABLE IF EXISTS `wemall_articleclass`;
CREATE TABLE `wemall_articleclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `sysClass` bit(1) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK29AACFD3987F7269` (`parent_id`),
  CONSTRAINT `FK29AACFD3987F7269` FOREIGN KEY (`parent_id`) REFERENCES `wemall_articleclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163844 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_bargain
-- ----------------------------
DROP TABLE IF EXISTS `wemall_bargain`;
CREATE TABLE `wemall_bargain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `bargain_time` date DEFAULT NULL,
  `maximum` int(11) DEFAULT '0',
  `rebate` decimal(3,2) DEFAULT NULL,
  `state` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_bargain_goods
-- ----------------------------
DROP TABLE IF EXISTS `wemall_bargain_goods`;
CREATE TABLE `wemall_bargain_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `bg_price` decimal(12,2) DEFAULT NULL,
  `bg_status` int(11) NOT NULL,
  `bg_time` date DEFAULT NULL,
  `bg_admin_user_id` bigint(20) DEFAULT NULL,
  `bg_goods_id` bigint(20) DEFAULT NULL,
  `bg_count` int(11) DEFAULT '1',
  `bg_rebate` decimal(3,1) DEFAULT NULL,
  `audit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKECBE5852AB0DFB98` (`bg_admin_user_id`),
  KEY `FKECBE585282133C8C` (`bg_goods_id`),
  CONSTRAINT `FKECBE585282133C8C` FOREIGN KEY (`bg_goods_id`) REFERENCES `wemall_goods` (`id`),
  CONSTRAINT `FKECBE5852AB0DFB98` FOREIGN KEY (`bg_admin_user_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_brandcategory
-- ----------------------------
DROP TABLE IF EXISTS `wemall_brandcategory`;
CREATE TABLE `wemall_brandcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_cart_gsp
-- ----------------------------
DROP TABLE IF EXISTS `wemall_cart_gsp`;
CREATE TABLE `wemall_cart_gsp` (
  `cart_id` bigint(20) NOT NULL,
  `gsp_id` bigint(20) NOT NULL,
  KEY `FK718B005C6B9FD208` (`cart_id`),
  KEY `FK718B005C2F8BE734` (`gsp_id`),
  CONSTRAINT `FK718B005C2F8BE734` FOREIGN KEY (`gsp_id`) REFERENCES `wemall_goodsspecproperty` (`id`),
  CONSTRAINT `FK718B005C6B9FD208` FOREIGN KEY (`cart_id`) REFERENCES `wemall_goodscart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_chatting
-- ----------------------------
DROP TABLE IF EXISTS `wemall_chatting`;
CREATE TABLE `wemall_chatting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `type` int(11) DEFAULT '0',
  `user1_id` bigint(20) DEFAULT NULL,
  `user2_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKC6DDCF3D16F36727` (`user1_id`),
  KEY `FKC6DDCF3D16F3DB86` (`user2_id`),
  CONSTRAINT `FKC6DDCF3D16F36727` FOREIGN KEY (`user1_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKC6DDCF3D16F3DB86` FOREIGN KEY (`user2_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_chattingfriend
-- ----------------------------
DROP TABLE IF EXISTS `wemall_chattingfriend`;
CREATE TABLE `wemall_chattingfriend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `type` int(11) DEFAULT '1',
  `friend_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `friendUser_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK9DBC61B5537B6C51` (`user_id`),
  KEY `FK9DBC61B516CF789E` (`friend_id`),
  KEY `FK9DBC61B584EFD3F3` (`friendUser_id`),
  CONSTRAINT `FK9DBC61B516CF789E` FOREIGN KEY (`friend_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK9DBC61B5537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK9DBC61B584EFD3F3` FOREIGN KEY (`friendUser_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_chattinglog
-- ----------------------------
DROP TABLE IF EXISTS `wemall_chattinglog`;
CREATE TABLE `wemall_chattinglog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `User_id` bigint(20) DEFAULT NULL,
  `chatting_id` bigint(20) DEFAULT NULL,
  `mark` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK4E392EE73236E522` (`chatting_id`),
  KEY `FK4E392EE71E208F02` (`User_id`),
  CONSTRAINT `FK4E392EE71E208F02` FOREIGN KEY (`User_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK4E392EE73236E522` FOREIGN KEY (`chatting_id`) REFERENCES `wemall_chatting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_combin_log
-- ----------------------------
DROP TABLE IF EXISTS `wemall_combin_log`;
CREATE TABLE `wemall_combin_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `gold` int(11) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK1CEAE93C920D7683` (`store_id`),
  CONSTRAINT `FK1CEAE93C920D7683` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_complaint
-- ----------------------------
DROP TABLE IF EXISTS `wemall_complaint`;
CREATE TABLE `wemall_complaint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `appeal_time` datetime DEFAULT NULL,
  `from_user_content` longtext,
  `handle_content` longtext,
  `handle_time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `talk_content` longtext,
  `to_user_content` longtext,
  `type` varchar(255) DEFAULT NULL,
  `cs_id` bigint(20) DEFAULT NULL,
  `from_acc1_id` bigint(20) DEFAULT NULL,
  `from_acc2_id` bigint(20) DEFAULT NULL,
  `from_acc3_id` bigint(20) DEFAULT NULL,
  `from_user_id` bigint(20) DEFAULT NULL,
  `handle_user_id` bigint(20) DEFAULT NULL,
  `of_id` bigint(20) DEFAULT NULL,
  `to_acc1_id` bigint(20) DEFAULT NULL,
  `to_acc2_id` bigint(20) DEFAULT NULL,
  `to_acc3_id` bigint(20) DEFAULT NULL,
  `to_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5F874694BAA5A510` (`to_acc1_id`),
  KEY `FK5F874694D215FBEB` (`handle_user_id`),
  KEY `FK5F874694A5A3993E` (`to_user_id`),
  KEY `FK5F8746942B4D839E` (`from_acc2_id`),
  KEY `FK5F8746942B4D0F3F` (`from_acc1_id`),
  KEY `FK5F874694BAA68DCE` (`to_acc3_id`),
  KEY `FK5F8746942B4DF7FD` (`from_acc3_id`),
  KEY `FK5F874694CCC27273` (`cs_id`),
  KEY `FK5F874694BAA6196F` (`to_acc2_id`),
  KEY `FK5F874694164B036D` (`from_user_id`),
  KEY `FK5F874694E66AF58D` (`of_id`),
  CONSTRAINT `FK5F874694164B036D` FOREIGN KEY (`from_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK5F8746942B4D0F3F` FOREIGN KEY (`from_acc1_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK5F8746942B4D839E` FOREIGN KEY (`from_acc2_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK5F8746942B4DF7FD` FOREIGN KEY (`from_acc3_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK5F874694A5A3993E` FOREIGN KEY (`to_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK5F874694BAA5A510` FOREIGN KEY (`to_acc1_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK5F874694BAA6196F` FOREIGN KEY (`to_acc2_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK5F874694BAA68DCE` FOREIGN KEY (`to_acc3_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK5F874694CCC27273` FOREIGN KEY (`cs_id`) REFERENCES `wemall_complaint_subject` (`id`),
  CONSTRAINT `FK5F874694D215FBEB` FOREIGN KEY (`handle_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK5F874694E66AF58D` FOREIGN KEY (`of_id`) REFERENCES `wemall_orderform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_complaint_goods
-- ----------------------------
DROP TABLE IF EXISTS `wemall_complaint_goods`;
CREATE TABLE `wemall_complaint_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `complaint_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8F9101EB339519D2` (`goods_id`),
  KEY `FK8F9101EBA599F1B2` (`complaint_id`),
  CONSTRAINT `FK8F9101EB339519D2` FOREIGN KEY (`goods_id`) REFERENCES `wemall_goods` (`id`),
  CONSTRAINT `FK8F9101EBA599F1B2` FOREIGN KEY (`complaint_id`) REFERENCES `wemall_complaint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_complaint_subject
-- ----------------------------
DROP TABLE IF EXISTS `wemall_complaint_subject`;
CREATE TABLE `wemall_complaint_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_consult
-- ----------------------------
DROP TABLE IF EXISTS `wemall_consult`;
CREATE TABLE `wemall_consult` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `consult_content` longtext,
  `consult_email` varchar(255) DEFAULT NULL,
  `consult_reply` longtext,
  `reply` bit(1) NOT NULL,
  `reply_time` datetime DEFAULT NULL,
  `consult_user_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `reply_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK86CB3BBB66DC9BFC` (`reply_user_id`),
  KEY `FK86CB3BBBA995E663` (`goods_id`),
  KEY `FK86CB3BBBCAAD62FE` (`consult_user_id`),
  CONSTRAINT `FK86CB3BBB66DC9BFC` FOREIGN KEY (`reply_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK86CB3BBBA995E663` FOREIGN KEY (`goods_id`) REFERENCES `wemall_goods` (`id`),
  CONSTRAINT `FK86CB3BBBCAAD62FE` FOREIGN KEY (`consult_user_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_coupon
-- ----------------------------
DROP TABLE IF EXISTS `wemall_coupon`;
CREATE TABLE `wemall_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `coupon_amount` decimal(12,2) DEFAULT NULL,
  `coupon_begin_time` date DEFAULT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_end_time` date DEFAULT NULL,
  `coupon_name` varchar(255) DEFAULT NULL,
  `coupon_order_amount` decimal(12,2) DEFAULT NULL,
  `coupon_acc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK1013FEDD31C9FEBC` (`coupon_acc_id`),
  CONSTRAINT `FK1013FEDD31C9FEBC` FOREIGN KEY (`coupon_acc_id`) REFERENCES `wemall_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_coupon_info
-- ----------------------------
DROP TABLE IF EXISTS `wemall_coupon_info`;
CREATE TABLE `wemall_coupon_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `coupon_sn` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `coupon_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKE4A2D7682F288B1` (`coupon_id`),
  KEY `FKE4A2D76537B6C51` (`user_id`),
  CONSTRAINT `FKE4A2D76537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKE4A2D7682F288B1` FOREIGN KEY (`coupon_id`) REFERENCES `wemall_coupon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_delivery_goods
-- ----------------------------
DROP TABLE IF EXISTS `wemall_delivery_goods`;
CREATE TABLE `wemall_delivery_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `d_status` int(11) NOT NULL,
  `d_admin_user_id` bigint(20) DEFAULT NULL,
  `d_delivery_goods_id` bigint(20) DEFAULT NULL,
  `d_goods_id` bigint(20) DEFAULT NULL,
  `d_begin_time` date DEFAULT NULL,
  `d_end_time` date DEFAULT NULL,
  `d_audit_time` datetime DEFAULT NULL,
  `d_refuse_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK858B789CC3254733` (`d_delivery_goods_id`),
  KEY `FK858B789C1BAB47DE` (`d_goods_id`),
  KEY `FK858B789C78FFAAC6` (`d_admin_user_id`),
  CONSTRAINT `FK858B789C1BAB47DE` FOREIGN KEY (`d_goods_id`) REFERENCES `wemall_goods` (`id`),
  CONSTRAINT `FK858B789C78FFAAC6` FOREIGN KEY (`d_admin_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK858B789CC3254733` FOREIGN KEY (`d_delivery_goods_id`) REFERENCES `wemall_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_delivery_log
-- ----------------------------
DROP TABLE IF EXISTS `wemall_delivery_log`;
CREATE TABLE `wemall_delivery_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `gold` int(11) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK69A11E0A920D7683` (`store_id`),
  CONSTRAINT `FK69A11E0A920D7683` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_document
-- ----------------------------
DROP TABLE IF EXISTS `wemall_document`;
CREATE TABLE `wemall_document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `mark` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65538 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `wemall_dynamic`;
CREATE TABLE `wemall_dynamic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `discussNum` int(11) DEFAULT '0',
  `praiseNum` int(11) DEFAULT '0',
  `turnNum` int(11) DEFAULT '0',
  `dissParent_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `turnParent_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `locked` bit(1) DEFAULT b'0',
  `img_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `display` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKCCB9A00EA995E663` (`goods_id`),
  KEY `FKCCB9A00E6ABCD333` (`dissParent_id`),
  KEY `FKCCB9A00E537B6C51` (`user_id`),
  KEY `FKCCB9A00E54ED135B` (`turnParent_id`),
  KEY `FKCCB9A00EEB7ECE12` (`img_id`),
  KEY `FKCCB9A00E920D7683` (`store_id`),
  CONSTRAINT `FKCCB9A00E537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKCCB9A00E54ED135B` FOREIGN KEY (`turnParent_id`) REFERENCES `wemall_dynamic` (`id`),
  CONSTRAINT `FKCCB9A00E6ABCD333` FOREIGN KEY (`dissParent_id`) REFERENCES `wemall_dynamic` (`id`),
  CONSTRAINT `FKCCB9A00E920D7683` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`),
  CONSTRAINT `FKCCB9A00EA995E663` FOREIGN KEY (`goods_id`) REFERENCES `wemall_goods` (`id`),
  CONSTRAINT `FKCCB9A00EEB7ECE12` FOREIGN KEY (`img_id`) REFERENCES `wemall_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `wemall_evaluate`;
CREATE TABLE `wemall_evaluate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `evaluate_admin_info` longtext,
  `evaluate_buyer_val` int(11) NOT NULL,
  `evaluate_info` longtext,
  `evaluate_seller_info` longtext,
  `evaluate_seller_time` datetime DEFAULT NULL,
  `evaluate_seller_val` int(11) NOT NULL,
  `evaluate_status` int(11) NOT NULL,
  `evaluate_type` varchar(255) DEFAULT NULL,
  `goods_spec` longtext,
  `evaluate_goods_id` bigint(20) DEFAULT NULL,
  `evaluate_seller_user_id` bigint(20) DEFAULT NULL,
  `evaluate_user_id` bigint(20) DEFAULT NULL,
  `of_id` bigint(20) DEFAULT NULL,
  `description_evaluate` decimal(12,2) DEFAULT NULL,
  `service_evaluate` decimal(12,2) DEFAULT NULL,
  `ship_evaluate` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7AC70190D56B72A8` (`evaluate_seller_user_id`),
  KEY `FK7AC701901FBBBAB8` (`evaluate_goods_id`),
  KEY `FK7AC7019067CF395C` (`evaluate_user_id`),
  KEY `FK7AC70190E66AF58D` (`of_id`),
  CONSTRAINT `FK7AC701901FBBBAB8` FOREIGN KEY (`evaluate_goods_id`) REFERENCES `wemall_goods` (`id`),
  CONSTRAINT `FK7AC7019067CF395C` FOREIGN KEY (`evaluate_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK7AC70190D56B72A8` FOREIGN KEY (`evaluate_seller_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK7AC70190E66AF58D` FOREIGN KEY (`of_id`) REFERENCES `wemall_orderform` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_express_company
-- ----------------------------
DROP TABLE IF EXISTS `wemall_express_company`;
CREATE TABLE `wemall_express_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `company_mark` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_status` int(11) DEFAULT '0',
  `company_sequence` int(11) DEFAULT '0',
  `company_type` varchar(255) DEFAULT 'EXPRESS',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_favorite
-- ----------------------------
DROP TABLE IF EXISTS `wemall_favorite`;
CREATE TABLE `wemall_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `type` int(11) NOT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAFC41E93339519D2` (`goods_id`),
  KEY `FKAFC41E931E208F02` (`user_id`),
  KEY `FKAFC41E931C0CA9F2` (`store_id`),
  CONSTRAINT `FKAFC41E931C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`),
  CONSTRAINT `FKAFC41E931E208F02` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKAFC41E93339519D2` FOREIGN KEY (`goods_id`) REFERENCES `wemall_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131078 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_gold_log
-- ----------------------------
DROP TABLE IF EXISTS `wemall_gold_log`;
CREATE TABLE `wemall_gold_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gl_admin_content` longtext,
  `gl_admin_time` datetime DEFAULT NULL,
  `gl_content` longtext,
  `gl_count` int(11) NOT NULL,
  `gl_money` int(11) NOT NULL,
  `gl_payment` varchar(255) DEFAULT NULL,
  `gl_type` int(11) NOT NULL,
  `gl_admin_id` bigint(20) DEFAULT NULL,
  `gl_user_id` bigint(20) DEFAULT NULL,
  `gr_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEA8877DC9FBF00E8` (`gr_id`),
  KEY `FKEA8877DCE986EF18` (`gl_admin_id`),
  KEY `FKEA8877DC811B8DA8` (`gl_user_id`),
  CONSTRAINT `FKEA8877DC811B8DA8` FOREIGN KEY (`gl_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKEA8877DC9FBF00E8` FOREIGN KEY (`gr_id`) REFERENCES `wemall_gold_record` (`id`),
  CONSTRAINT `FKEA8877DCE986EF18` FOREIGN KEY (`gl_admin_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_gold_record
-- ----------------------------
DROP TABLE IF EXISTS `wemall_gold_record`;
CREATE TABLE `wemall_gold_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gold_admin_info` longtext,
  `gold_admin_time` datetime DEFAULT NULL,
  `gold_count` int(11) NOT NULL,
  `gold_exchange_info` longtext,
  `gold_money` int(11) NOT NULL,
  `gold_pay_status` int(11) NOT NULL,
  `gold_payment` varchar(255) DEFAULT NULL,
  `gold_sn` varchar(255) DEFAULT NULL,
  `gold_status` int(11) NOT NULL,
  `gold_admin_id` bigint(20) DEFAULT NULL,
  `gold_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE8A430B97C7135FD` (`gold_admin_id`),
  KEY `FKE8A430B94C0A5623` (`gold_user_id`),
  CONSTRAINT `FKE8A430B94C0A5623` FOREIGN KEY (`gold_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKE8A430B97C7135FD` FOREIGN KEY (`gold_admin_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goods
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goods`;
CREATE TABLE `wemall_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `goods_click` int(11) NOT NULL,
  `goods_details` longtext,
  `goods_fee` varchar(255) DEFAULT NULL,
  `goods_inventory` int(11) NOT NULL,
  `goods_inventory_detail` longtext,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_price` decimal(12,2) DEFAULT NULL,
  `goods_property` longtext,
  `goods_recommend` bit(1) NOT NULL,
  `goods_salenum` int(11) NOT NULL,
  `goods_seller_time` datetime DEFAULT NULL,
  `goods_serial` varchar(255) DEFAULT NULL,
  `goods_status` int(11) NOT NULL,
  `goods_transfee` int(11) NOT NULL,
  `goods_weight` decimal(12,2) DEFAULT NULL,
  `inventory_type` varchar(255) DEFAULT NULL,
  `seo_description` longtext,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `store_price` decimal(12,2) DEFAULT NULL,
  `store_recommend` bit(1) NOT NULL,
  `store_recommend_time` datetime DEFAULT NULL,
  `ztc_admin_content` longtext,
  `ztc_apply_time` datetime DEFAULT NULL,
  `ztc_begin_time` date DEFAULT NULL,
  `ztc_click_num` int(11) NOT NULL,
  `ztc_dredge_price` int(11) NOT NULL,
  `ztc_gold` int(11) NOT NULL,
  `ztc_pay_status` int(11) NOT NULL,
  `ztc_price` int(11) NOT NULL,
  `ztc_status` int(11) NOT NULL,
  `gc_id` bigint(20) DEFAULT NULL,
  `goods_brand_id` bigint(20) DEFAULT NULL,
  `goods_main_photo_id` bigint(20) DEFAULT NULL,
  `goods_store_id` bigint(20) DEFAULT NULL,
  `ztc_admin_id` bigint(20) DEFAULT NULL,
  `goods_collect` int(11) DEFAULT '0',
  `group_buy` int(11) DEFAULT '0',
  `goods_choice_type` int(11) DEFAULT '0',
  `group_id` bigint(20) DEFAULT NULL,
  `activity_status` int(11) DEFAULT '0',
  `bargain_status` int(11) DEFAULT '0',
  `delivery_status` int(11) DEFAULT '0',
  `goods_current_price` decimal(12,2) DEFAULT NULL,
  `goods_volume` decimal(12,2) DEFAULT NULL,
  `ems_trans_fee` decimal(12,2) DEFAULT NULL,
  `express_trans_fee` decimal(12,2) DEFAULT NULL,
  `mail_trans_fee` decimal(12,2) DEFAULT NULL,
  `transport_id` bigint(20) DEFAULT NULL,
  `combin_status` int(11) DEFAULT '0',
  `combin_begin_time` date DEFAULT NULL,
  `combin_end_time` date DEFAULT NULL,
  `combin_price` decimal(12,2) DEFAULT NULL,
  `description_evaluate` decimal(10,0) DEFAULT '5',
  `weixin_shop_hot` bit(1) DEFAULT b'0',
  `weixin_shop_hotTime` date DEFAULT NULL,
  `weixin_shop_recommend` bit(1) DEFAULT b'0',
  `weixin_shop_recommendTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK304F7EE5AD5743E0` (`goods_main_photo_id`),
  KEY `FK304F7EE56BDDCC57` (`gc_id`),
  KEY `FK304F7EE51ED8F14C` (`goods_store_id`),
  KEY `FK304F7EE5F140A6A4` (`goods_brand_id`),
  KEY `FK304F7EE5C292B563` (`ztc_admin_id`),
  KEY `FK304F7EE5493829C3` (`group_id`),
  KEY `FK304F7EE5914F1503` (`transport_id`),
  CONSTRAINT `FK304F7EE51ED8F14C` FOREIGN KEY (`goods_store_id`) REFERENCES `wemall_store` (`id`),
  CONSTRAINT `FK304F7EE5493829C3` FOREIGN KEY (`group_id`) REFERENCES `wemall_group` (`id`),
  CONSTRAINT `FK304F7EE56BDDCC57` FOREIGN KEY (`gc_id`) REFERENCES `wemall_goodsclass` (`id`),
  CONSTRAINT `FK304F7EE5914F1503` FOREIGN KEY (`transport_id`) REFERENCES `wemall_transport` (`id`),
  CONSTRAINT `FK304F7EE5AD5743E0` FOREIGN KEY (`goods_main_photo_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK304F7EE5C292B563` FOREIGN KEY (`ztc_admin_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK304F7EE5F140A6A4` FOREIGN KEY (`goods_brand_id`) REFERENCES `wemall_goodsbrand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98462 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goodsbrand
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goodsbrand`;
CREATE TABLE `wemall_goodsbrand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `audit` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `recommend` bit(1) NOT NULL,
  `sequence` int(11) NOT NULL,
  `brandLogo_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `remark` longtext,
  `userStatus` int(11) DEFAULT '0',
  `user_id` bigint(20) DEFAULT NULL,
  `weixin_shop_recommend` bit(1) DEFAULT b'0',
  `weixin_shop_recommendTime` date DEFAULT NULL,
  `first_word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK380F53C292ACC22` (`category_id`),
  KEY `FK380F53C25F95F5C3` (`brandLogo_id`),
  KEY `FK380F53C2537B6C51` (`user_id`),
  CONSTRAINT `FK380F53C2537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK380F53C25F95F5C3` FOREIGN KEY (`brandLogo_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK380F53C292ACC22` FOREIGN KEY (`category_id`) REFERENCES `wemall_brandcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goodscart
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goodscart`;
CREATE TABLE `wemall_goodscart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `spec_info` longtext,
  `goods_id` bigint(20) DEFAULT NULL,
  `of_id` bigint(20) DEFAULT NULL,
  `cart_type` varchar(255) DEFAULT NULL,
  `sc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6D29FF859F21119E` (`of_id`),
  KEY `FK64EC15F339519D2` (`goods_id`),
  KEY `FK64EC15F62D0D4E3` (`sc_id`),
  CONSTRAINT `FK64EC15F339519D2` FOREIGN KEY (`goods_id`) REFERENCES `wemall_goods` (`id`),
  CONSTRAINT `FK64EC15F62D0D4E3` FOREIGN KEY (`sc_id`) REFERENCES `wemall_storecart` (`id`),
  CONSTRAINT `FK6D29FF859F21119E` FOREIGN KEY (`of_id`) REFERENCES `wemall_orderform` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229702 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goodsclass
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goodsclass`;
CREATE TABLE `wemall_goodsclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `display` bit(1) NOT NULL,
  `level` int(11) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `sequence` int(11) NOT NULL,
  `goodsType_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seo_description` longtext,
  `seo_keywords` longtext,
  `icon_sys` varchar(255) DEFAULT NULL,
  `icon_type` int(11) DEFAULT '0',
  `icon_acc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC38E2B193CA4A709` (`icon_acc_id`),
  KEY `FKC38E2B194020BFB2` (`goodsType_id`),
  KEY `FKC38E2B19835D2FBA` (`parent_id`),
  CONSTRAINT `FKC38E2B193CA4A709` FOREIGN KEY (`icon_acc_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FKC38E2B194020BFB2` FOREIGN KEY (`goodsType_id`) REFERENCES `wemall_goodstype` (`id`),
  CONSTRAINT `FKC38E2B19835D2FBA` FOREIGN KEY (`parent_id`) REFERENCES `wemall_goodsclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65680 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goodsclassstaple
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goodsclassstaple`;
CREATE TABLE `wemall_goodsclassstaple` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gc_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK335B1F3C6BDDCC57` (`gc_id`),
  KEY `FK335B1F3C920D7683` (`store_id`),
  CONSTRAINT `FK335B1F3C6BDDCC57` FOREIGN KEY (`gc_id`) REFERENCES `wemall_goodsclass` (`id`),
  CONSTRAINT `FK335B1F3C920D7683` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65538 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goodsrecommend
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goodsrecommend`;
CREATE TABLE `wemall_goodsrecommend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `browseNum` int(11) NOT NULL,
  `code` longtext,
  `goodsNum` int(11) NOT NULL,
  `imageHeight` int(11) NOT NULL,
  `imageWidth` int(11) NOT NULL,
  `remarkInfo` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `showNum` int(11) NOT NULL,
  `styleName` varchar(255) DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goodsspecification
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goodsspecification`;
CREATE TABLE `wemall_goodsspecification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32769 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goodsspecproperty
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goodsspecproperty`;
CREATE TABLE `wemall_goodsspecproperty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `sequence` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `spec_id` bigint(20) DEFAULT NULL,
  `specImage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1F5139F54F314235` (`specImage_id`),
  KEY `FK1F5139F574A287A3` (`spec_id`),
  CONSTRAINT `FK1F5139F54F314235` FOREIGN KEY (`specImage_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK1F5139F574A287A3` FOREIGN KEY (`spec_id`) REFERENCES `wemall_goodsspecification` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32775 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goodstype`;
CREATE TABLE `wemall_goodstype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goodstypeproperty
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goodstypeproperty`;
CREATE TABLE `wemall_goodstypeproperty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `display` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `goodsType_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKABDE274F8D6DBC3` (`goodsType_id`),
  CONSTRAINT `FKABDE274F8D6DBC3` FOREIGN KEY (`goodsType_id`) REFERENCES `wemall_goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goodstype_brand
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goodstype_brand`;
CREATE TABLE `wemall_goodstype_brand` (
  `type_id` bigint(20) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  KEY `FKA5ABC541667C5CC` (`brand_id`),
  KEY `FKA5ABC54117C323C8` (`type_id`),
  CONSTRAINT `FKA5ABC54117C323C8` FOREIGN KEY (`type_id`) REFERENCES `wemall_goodstype` (`id`),
  CONSTRAINT `FKA5ABC541667C5CC` FOREIGN KEY (`brand_id`) REFERENCES `wemall_goodsbrand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goodstype_spec
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goodstype_spec`;
CREATE TABLE `wemall_goodstype_spec` (
  `type_id` bigint(20) NOT NULL,
  `spec_id` bigint(20) NOT NULL,
  KEY `FK82E5085B74A287A3` (`spec_id`),
  KEY `FK82E5085BD0793FD9` (`type_id`),
  CONSTRAINT `FK82E5085B74A287A3` FOREIGN KEY (`spec_id`) REFERENCES `wemall_goodsspecification` (`id`),
  CONSTRAINT `FK82E5085BD0793FD9` FOREIGN KEY (`type_id`) REFERENCES `wemall_goodstype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goods_combin
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goods_combin`;
CREATE TABLE `wemall_goods_combin` (
  `wemall_goods_id` bigint(20) NOT NULL,
  `combin_goods_id` bigint(20) NOT NULL,
  KEY `FK367D9A66A4B76EC9` (`wemall_goods_id`),
  KEY `FK367D9A667125CE0B` (`combin_goods_id`),
  CONSTRAINT `FK367D9A667125CE0B` FOREIGN KEY (`combin_goods_id`) REFERENCES `wemall_goods` (`id`),
  CONSTRAINT `FK367D9A66A4B76EC9` FOREIGN KEY (`wemall_goods_id`) REFERENCES `wemall_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goods_floor
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goods_floor`;
CREATE TABLE `wemall_goods_floor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gf_css` varchar(255) DEFAULT NULL,
  `gf_display` bit(1) NOT NULL,
  `gf_goods_count` int(11) NOT NULL,
  `gf_level` int(11) NOT NULL,
  `gf_name` varchar(255) DEFAULT NULL,
  `gf_sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `gf_gc_goods` longtext,
  `gf_gc_list` longtext,
  `gf_left_adv` longtext,
  `gf_list_goods` longtext,
  `gf_right_adv` longtext,
  `gf_brand_list` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA714398C8387AA4E` (`parent_id`),
  CONSTRAINT `FKA714398C8387AA4E` FOREIGN KEY (`parent_id`) REFERENCES `wemall_goods_floor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131082 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goods_photo
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goods_photo`;
CREATE TABLE `wemall_goods_photo` (
  `goods_id` bigint(20) NOT NULL,
  `photo_id` bigint(20) NOT NULL,
  KEY `FKA79F53B2339519D2` (`goods_id`),
  KEY `FKA79F53B22D77C132` (`photo_id`),
  CONSTRAINT `FKA79F53B22D77C132` FOREIGN KEY (`photo_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FKA79F53B2339519D2` FOREIGN KEY (`goods_id`) REFERENCES `wemall_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goods_return
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goods_return`;
CREATE TABLE `wemall_goods_return` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `return_id` varchar(255) DEFAULT NULL,
  `return_info` longtext,
  `of_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD3121FCA537B6C51` (`user_id`),
  KEY `FKD3121FCA9F21119E` (`of_id`),
  CONSTRAINT `FKD3121FCA537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKD3121FCA9F21119E` FOREIGN KEY (`of_id`) REFERENCES `wemall_orderform` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goods_returnitem
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goods_returnitem`;
CREATE TABLE `wemall_goods_returnitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `count` int(11) NOT NULL,
  `spec_info` longtext,
  `goods_id` bigint(20) DEFAULT NULL,
  `gr_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBA3AA5DD79982ABE` (`gr_id`),
  KEY `FKBA3AA5DDA995E663` (`goods_id`),
  CONSTRAINT `FKBA3AA5DD79982ABE` FOREIGN KEY (`gr_id`) REFERENCES `wemall_goods_return` (`id`),
  CONSTRAINT `FKBA3AA5DDA995E663` FOREIGN KEY (`goods_id`) REFERENCES `wemall_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goods_returnlog
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goods_returnlog`;
CREATE TABLE `wemall_goods_returnlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gr_id` bigint(20) DEFAULT NULL,
  `of_id` bigint(20) DEFAULT NULL,
  `return_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8A22F73A79982ABE` (`gr_id`),
  KEY `FK8A22F73A95A12042` (`return_user_id`),
  KEY `FK8A22F73A9F21119E` (`of_id`),
  CONSTRAINT `FK8A22F73A79982ABE` FOREIGN KEY (`gr_id`) REFERENCES `wemall_goods_return` (`id`),
  CONSTRAINT `FK8A22F73A95A12042` FOREIGN KEY (`return_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK8A22F73A9F21119E` FOREIGN KEY (`of_id`) REFERENCES `wemall_orderform` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goods_spec`;
CREATE TABLE `wemall_goods_spec` (
  `goods_id` bigint(20) NOT NULL,
  `spec_id` bigint(20) NOT NULL,
  KEY `FKC359323B339519D2` (`goods_id`),
  KEY `FKC359323B188F11D` (`spec_id`),
  CONSTRAINT `FKC359323B188F11D` FOREIGN KEY (`spec_id`) REFERENCES `wemall_goodsspecproperty` (`id`),
  CONSTRAINT `FKC359323B339519D2` FOREIGN KEY (`goods_id`) REFERENCES `wemall_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_goods_ugc
-- ----------------------------
DROP TABLE IF EXISTS `wemall_goods_ugc`;
CREATE TABLE `wemall_goods_ugc` (
  `goods_id` bigint(20) NOT NULL,
  `class_id` bigint(20) NOT NULL,
  KEY `FK64D399181752657` (`class_id`),
  KEY `FK64D3991339519D2` (`goods_id`),
  CONSTRAINT `FK64D3991339519D2` FOREIGN KEY (`goods_id`) REFERENCES `wemall_goods` (`id`),
  CONSTRAINT `FK64D399181752657` FOREIGN KEY (`class_id`) REFERENCES `wemall_usergoodsclass` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_group
-- ----------------------------
DROP TABLE IF EXISTS `wemall_group`;
CREATE TABLE `wemall_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `joinEndTime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_group_area
-- ----------------------------
DROP TABLE IF EXISTS `wemall_group_area`;
CREATE TABLE `wemall_group_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ga_level` int(11) NOT NULL,
  `ga_name` varchar(255) DEFAULT NULL,
  `ga_sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKFE49BD841A75D854` (`parent_id`),
  CONSTRAINT `FKFE49BD841A75D854` FOREIGN KEY (`parent_id`) REFERENCES `wemall_group_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_group_class
-- ----------------------------
DROP TABLE IF EXISTS `wemall_group_class`;
CREATE TABLE `wemall_group_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gc_level` int(11) NOT NULL,
  `gc_name` varchar(255) DEFAULT NULL,
  `gc_sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKE80BA8071C634840` (`parent_id`),
  CONSTRAINT `FKE80BA8071C634840` FOREIGN KEY (`parent_id`) REFERENCES `wemall_group_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_group_goods
-- ----------------------------
DROP TABLE IF EXISTS `wemall_group_goods`;
CREATE TABLE `wemall_group_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gg_audit_time` datetime DEFAULT NULL,
  `gg_content` longtext,
  `gg_count` int(11) NOT NULL,
  `gg_def_count` int(11) NOT NULL,
  `gg_group_count` int(11) NOT NULL,
  `gg_max_count` int(11) NOT NULL,
  `gg_min_count` int(11) NOT NULL,
  `gg_name` varchar(255) DEFAULT NULL,
  `gg_price` decimal(12,2) DEFAULT NULL,
  `gg_rebate` decimal(12,2) DEFAULT NULL,
  `gg_recommend` int(11) NOT NULL,
  `gg_recommend_time` datetime DEFAULT NULL,
  `gg_status` int(11) NOT NULL,
  `gg_vir_count` int(11) NOT NULL,
  `gg_ga_id` bigint(20) DEFAULT NULL,
  `gg_gc_id` bigint(20) DEFAULT NULL,
  `gg_goods_id` bigint(20) DEFAULT NULL,
  `gg_img_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `weixin_shop_recommend` bit(1) DEFAULT b'0',
  `weixin_shop_recommendTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKE84595E5108251` (`gg_img_id`),
  KEY `FKE84595E55D2DC6AF` (`gg_gc_id`),
  KEY `FKE84595E5493829C3` (`group_id`),
  KEY `FKE84595E5E08B86E2` (`gg_goods_id`),
  KEY `FKE84595E513F58A16` (`gg_ga_id`),
  CONSTRAINT `FKE84595E5108251` FOREIGN KEY (`gg_img_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FKE84595E513F58A16` FOREIGN KEY (`gg_ga_id`) REFERENCES `wemall_group_area` (`id`),
  CONSTRAINT `FKE84595E5493829C3` FOREIGN KEY (`group_id`) REFERENCES `wemall_group` (`id`),
  CONSTRAINT `FKE84595E55D2DC6AF` FOREIGN KEY (`gg_gc_id`) REFERENCES `wemall_group_class` (`id`),
  CONSTRAINT `FKE84595E5E08B86E2` FOREIGN KEY (`gg_goods_id`) REFERENCES `wemall_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32780 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_group_price_range
-- ----------------------------
DROP TABLE IF EXISTS `wemall_group_price_range`;
CREATE TABLE `wemall_group_price_range` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gpr_begin` int(11) NOT NULL,
  `gpr_end` int(11) NOT NULL,
  `gpr_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_homepage
-- ----------------------------
DROP TABLE IF EXISTS `wemall_homepage`;
CREATE TABLE `wemall_homepage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK578589FFBF621C69` (`owner_id`),
  CONSTRAINT `FK578589FFBF621C69` FOREIGN KEY (`owner_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_homepage_goodsclass
-- ----------------------------
DROP TABLE IF EXISTS `wemall_homepage_goodsclass`;
CREATE TABLE `wemall_homepage_goodsclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `gc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKF301D77CDD06648` (`gc_id`),
  KEY `FKF301D77C1E208F02` (`user_id`),
  CONSTRAINT `FKF301D77C1E208F02` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKF301D77CDD06648` FOREIGN KEY (`gc_id`) REFERENCES `wemall_goodsclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_homepage_goodsclass_log
-- ----------------------------
DROP TABLE IF EXISTS `wemall_homepage_goodsclass_log`;
CREATE TABLE `wemall_homepage_goodsclass_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `goodsClass_id` bigint(20) DEFAULT NULL,
  `homepageGoodsClass_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKAD270FA765403E11` (`homepageGoodsClass_id`),
  KEY `FKAD270FA7729F7B91` (`goodsClass_id`),
  CONSTRAINT `FKAD270FA765403E11` FOREIGN KEY (`homepageGoodsClass_id`) REFERENCES `wemall_homepage_goodsclass` (`id`),
  CONSTRAINT `FKAD270FA7729F7B91` FOREIGN KEY (`goodsClass_id`) REFERENCES `wemall_goodsclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_home_attention
-- ----------------------------
DROP TABLE IF EXISTS `wemall_home_attention`;
CREATE TABLE `wemall_home_attention` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `attention_homepage_id` bigint(20) DEFAULT NULL,
  `attentioned_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKD4036D0F78D5D162` (`attentioned_id`),
  KEY `FKD4036D0FF2DAF870` (`attention_homepage_id`),
  CONSTRAINT `FKD4036D0F78D5D162` FOREIGN KEY (`attentioned_id`) REFERENCES `wemall_homepage` (`id`),
  CONSTRAINT `FKD4036D0FF2DAF870` FOREIGN KEY (`attention_homepage_id`) REFERENCES `wemall_homepage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_integrallog
-- ----------------------------
DROP TABLE IF EXISTS `wemall_integrallog`;
CREATE TABLE `wemall_integrallog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `integral` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `integral_user_id` bigint(20) DEFAULT NULL,
  `operate_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEC2A9E67F65B7CBE` (`integral_user_id`),
  KEY `FKEC2A9E67C8F25896` (`operate_user_id`),
  CONSTRAINT `FKEC2A9E67C8F25896` FOREIGN KEY (`operate_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKEC2A9E67F65B7CBE` FOREIGN KEY (`integral_user_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1835295 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_integral_goods
-- ----------------------------
DROP TABLE IF EXISTS `wemall_integral_goods`;
CREATE TABLE `wemall_integral_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ig_begin_time` datetime DEFAULT NULL,
  `ig_click_count` int(11) NOT NULL,
  `ig_content` varchar(255) DEFAULT NULL,
  `ig_end_time` datetime DEFAULT NULL,
  `ig_exchange_count` int(11) NOT NULL,
  `ig_goods_count` int(11) NOT NULL,
  `ig_goods_integral` int(11) NOT NULL,
  `ig_goods_name` varchar(255) DEFAULT NULL,
  `ig_goods_price` decimal(12,2) DEFAULT NULL,
  `ig_goods_sn` varchar(255) DEFAULT NULL,
  `ig_goods_tag` varchar(255) DEFAULT NULL,
  `ig_limit_count` int(11) NOT NULL,
  `ig_limit_type` bit(1) NOT NULL,
  `ig_recommend` bit(1) NOT NULL,
  `ig_seo_description` varchar(255) DEFAULT NULL,
  `ig_seo_keywords` varchar(255) DEFAULT NULL,
  `ig_sequence` int(11) NOT NULL,
  `ig_show` bit(1) NOT NULL,
  `ig_time_type` bit(1) NOT NULL,
  `ig_transfee` decimal(12,2) DEFAULT NULL,
  `ig_transfee_type` int(11) NOT NULL,
  `ig_goods_img_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDCFD0854F326849C` (`ig_goods_img_id`),
  CONSTRAINT `FKDCFD0854F326849C` FOREIGN KEY (`ig_goods_img_id`) REFERENCES `wemall_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_integral_goodscart
-- ----------------------------
DROP TABLE IF EXISTS `wemall_integral_goodscart`;
CREATE TABLE `wemall_integral_goodscart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `count` int(11) NOT NULL,
  `integral` int(11) NOT NULL,
  `trans_fee` decimal(12,2) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6035ECDAC034A786` (`goods_id`),
  KEY `FK6035ECDA9F6D3F38` (`order_id`),
  CONSTRAINT `FK6035ECDA9F6D3F38` FOREIGN KEY (`order_id`) REFERENCES `wemall_integral_goodsorder` (`id`),
  CONSTRAINT `FK6035ECDAC034A786` FOREIGN KEY (`goods_id`) REFERENCES `wemall_integral_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_integral_goodsorder
-- ----------------------------
DROP TABLE IF EXISTS `wemall_integral_goodsorder`;
CREATE TABLE `wemall_integral_goodsorder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `igo_msg` longtext,
  `igo_order_sn` varchar(255) DEFAULT NULL,
  `igo_pay_msg` longtext,
  `igo_pay_time` datetime DEFAULT NULL,
  `igo_payment` varchar(255) DEFAULT NULL,
  `igo_ship_code` varchar(255) DEFAULT NULL,
  `igo_ship_content` longtext,
  `igo_ship_time` date DEFAULT NULL,
  `igo_status` int(11) NOT NULL,
  `igo_total_integral` int(11) NOT NULL,
  `igo_trans_fee` decimal(12,2) DEFAULT NULL,
  `igo_addr_id` bigint(20) DEFAULT NULL,
  `igo_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF590937A26B00318` (`igo_addr_id`),
  KEY `FKF590937A85110923` (`igo_user_id`),
  CONSTRAINT `FKF590937A26B00318` FOREIGN KEY (`igo_addr_id`) REFERENCES `wemall_address` (`id`),
  CONSTRAINT `FKF590937A85110923` FOREIGN KEY (`igo_user_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_message
-- ----------------------------
DROP TABLE IF EXISTS `wemall_message`;
CREATE TABLE `wemall_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `status` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `fromUser_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `toUser_id` bigint(20) DEFAULT NULL,
  `reply_status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK86FF3FD68D202D76` (`toUser_id`),
  KEY `FK86FF3FD6323CF700` (`parent_id`),
  KEY `FK86FF3FD6F3DB4167` (`fromUser_id`),
  CONSTRAINT `FK86FF3FD6323CF700` FOREIGN KEY (`parent_id`) REFERENCES `wemall_message` (`id`),
  CONSTRAINT `FK86FF3FD68D202D76` FOREIGN KEY (`toUser_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK86FF3FD6F3DB4167` FOREIGN KEY (`fromUser_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_mobileverifycode
-- ----------------------------
DROP TABLE IF EXISTS `wemall_mobileverifycode`;
CREATE TABLE `wemall_mobileverifycode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_navigation
-- ----------------------------
DROP TABLE IF EXISTS `wemall_navigation`;
CREATE TABLE `wemall_navigation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `display` bit(1) NOT NULL,
  `location` int(11) NOT NULL,
  `new_win` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `sysNav` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `original_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229384 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_orderform
-- ----------------------------
DROP TABLE IF EXISTS `wemall_orderform`;
CREATE TABLE `wemall_orderform` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `finishTime` datetime DEFAULT NULL,
  `goods_amount` decimal(12,2) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `invoiceType` int(11) NOT NULL,
  `msg` longtext,
  `order_id` varchar(255) DEFAULT NULL,
  `order_status` int(11) NOT NULL,
  `payTime` datetime DEFAULT NULL,
  `pay_msg` longtext,
  `refund` decimal(12,2) DEFAULT NULL,
  `refund_type` varchar(255) DEFAULT NULL,
  `shipCode` varchar(255) DEFAULT NULL,
  `shipTime` datetime DEFAULT NULL,
  `ship_price` decimal(12,2) DEFAULT NULL,
  `totalPrice` decimal(12,2) DEFAULT NULL,
  `addr_id` bigint(20) DEFAULT NULL,
  `payment_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `auto_confirm_email` bit(1) DEFAULT b'0',
  `auto_confirm_sms` bit(1) DEFAULT b'0',
  `transport` varchar(255) DEFAULT NULL,
  `out_order_id` varchar(255) DEFAULT NULL,
  `ec_id` bigint(20) DEFAULT NULL,
  `ci_id` bigint(20) DEFAULT NULL,
  `order_seller_intro` longtext,
  `return_shipCode` varchar(255) DEFAULT NULL,
  `return_ec_id` bigint(20) DEFAULT NULL,
  `return_content` longtext,
  `return_shipTime` datetime DEFAULT NULL,
  `order_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9BD986FBB62A45D2` (`payment_id`),
  KEY `FK9BD986FB2201A8B0` (`ci_id`),
  KEY `FK9BD986FBF8442271` (`ec_id`),
  KEY `FK9BD986FB1E208F02` (`user_id`),
  KEY `FK9BD986FB37781EA2` (`return_ec_id`),
  KEY `FK9BD986FBFC1A79F5` (`addr_id`),
  KEY `FK9BD986FB1C0CA9F2` (`store_id`),
  CONSTRAINT `FK9BD986FB1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`),
  CONSTRAINT `FK9BD986FB1E208F02` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK9BD986FB2201A8B0` FOREIGN KEY (`ci_id`) REFERENCES `wemall_coupon_info` (`id`),
  CONSTRAINT `FK9BD986FB37781EA2` FOREIGN KEY (`return_ec_id`) REFERENCES `wemall_express_company` (`id`),
  CONSTRAINT `FK9BD986FBB62A45D2` FOREIGN KEY (`payment_id`) REFERENCES `wemall_payment` (`id`),
  CONSTRAINT `FK9BD986FBF8442271` FOREIGN KEY (`ec_id`) REFERENCES `wemall_express_company` (`id`),
  CONSTRAINT `FK9BD986FBFC1A79F5` FOREIGN KEY (`addr_id`) REFERENCES `wemall_address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229463 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_order_log
-- ----------------------------
DROP TABLE IF EXISTS `wemall_order_log`;
CREATE TABLE `wemall_order_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `log_info` varchar(255) DEFAULT NULL,
  `state_info` longtext,
  `log_user_id` bigint(20) DEFAULT NULL,
  `of_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2B18AE29F21119E` (`of_id`),
  KEY `FK9BD64CBCE8C5507` (`log_user_id`),
  CONSTRAINT `FK2B18AE29F21119E` FOREIGN KEY (`of_id`) REFERENCES `wemall_orderform` (`id`),
  CONSTRAINT `FK9BD64CBCE8C5507` FOREIGN KEY (`log_user_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=295649 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_partner
-- ----------------------------
DROP TABLE IF EXISTS `wemall_partner`;
CREATE TABLE `wemall_partner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `sequence` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8A108CF1462F1969` (`image_id`),
  CONSTRAINT `FK8A108CF1462F1969` FOREIGN KEY (`image_id`) REFERENCES `wemall_accessory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_payment
-- ----------------------------
DROP TABLE IF EXISTS `wemall_payment`;
CREATE TABLE `wemall_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `chinabank_account` varchar(255) DEFAULT NULL,
  `chinabank_key` varchar(255) DEFAULT NULL,
  `content` longtext,
  `install` bit(1) NOT NULL,
  `interfaceType` int(11) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `merchantAcctId` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `partner` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `rmbKey` varchar(255) DEFAULT NULL,
  `safeKey` varchar(255) DEFAULT NULL,
  `seller_email` varchar(255) DEFAULT NULL,
  `spname` varchar(255) DEFAULT NULL,
  `tenpay_key` varchar(255) DEFAULT NULL,
  `tenpay_partner` varchar(255) DEFAULT NULL,
  `trade_mode` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `alipay_divide_rate` decimal(12,2) DEFAULT NULL,
  `alipay_rate` decimal(12,2) DEFAULT NULL,
  `balance_divide_rate` decimal(12,2) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `paypal_userId` varchar(255) DEFAULT NULL,
  `poundage` decimal(12,2) DEFAULT NULL,
  `lzbank_key` varchar(255) DEFAULT NULL,
  `lzbank_partner` varchar(255) DEFAULT NULL,
  `lzbank_trade_mode` varchar(255) DEFAULT NULL,
  `weixin_appId` longtext,
  `weixin_appSecret` longtext,
  `weixin_partnerId` longtext,
  `weixin_partnerKey` longtext,
  `weixin_paySignKey` longtext,
  PRIMARY KEY (`id`),
  KEY `FK8A6FE22F1C0CA9F2` (`store_id`),
  CONSTRAINT `FK8A6FE22F1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_predeposit
-- ----------------------------
DROP TABLE IF EXISTS `wemall_predeposit`;
CREATE TABLE `wemall_predeposit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `pd_admin_info` longtext,
  `pd_amount` decimal(12,2) DEFAULT NULL,
  `pd_pay_status` int(11) NOT NULL,
  `pd_payment` varchar(255) DEFAULT NULL,
  `pd_remittance_bank` varchar(255) DEFAULT NULL,
  `pd_remittance_info` longtext,
  `pd_remittance_time` date DEFAULT NULL,
  `pd_remittance_user` varchar(255) DEFAULT NULL,
  `pd_sn` varchar(255) DEFAULT NULL,
  `pd_status` int(11) NOT NULL,
  `pd_admin_id` bigint(20) DEFAULT NULL,
  `pd_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF0F9A9D28345AEE9` (`pd_admin_id`),
  KEY `FKF0F9A9D2758D0FB7` (`pd_user_id`),
  CONSTRAINT `FKF0F9A9D2758D0FB7` FOREIGN KEY (`pd_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKF0F9A9D28345AEE9` FOREIGN KEY (`pd_admin_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_predeposit_cash
-- ----------------------------
DROP TABLE IF EXISTS `wemall_predeposit_cash`;
CREATE TABLE `wemall_predeposit_cash` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `cash_account` varchar(255) DEFAULT NULL,
  `cash_admin_info` longtext,
  `cash_amount` decimal(12,2) DEFAULT NULL,
  `cash_bank` varchar(255) DEFAULT NULL,
  `cash_info` longtext,
  `cash_pay_status` int(11) NOT NULL,
  `cash_payment` varchar(255) DEFAULT NULL,
  `cash_sn` varchar(255) DEFAULT NULL,
  `cash_status` int(11) NOT NULL,
  `cash_userName` varchar(255) DEFAULT NULL,
  `cash_admin_id` bigint(20) DEFAULT NULL,
  `cash_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK916ADD807D5CDF6` (`cash_user_id`),
  KEY `FK916ADD803A14B88A` (`cash_admin_id`),
  CONSTRAINT `FK916ADD803A14B88A` FOREIGN KEY (`cash_admin_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK916ADD807D5CDF6` FOREIGN KEY (`cash_user_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_predeposit_log
-- ----------------------------
DROP TABLE IF EXISTS `wemall_predeposit_log`;
CREATE TABLE `wemall_predeposit_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `pd_log_amount` decimal(12,2) DEFAULT NULL,
  `pd_log_info` longtext,
  `pd_op_type` varchar(255) DEFAULT NULL,
  `pd_type` varchar(255) DEFAULT NULL,
  `pd_log_admin_id` bigint(20) DEFAULT NULL,
  `pd_log_user_id` bigint(20) DEFAULT NULL,
  `predeposit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDD0C74D11B0A508B` (`pd_log_user_id`),
  KEY `FKDD0C74D1321DC511` (`predeposit_id`),
  KEY `FKDD0C74D14CCA9953` (`pd_log_admin_id`),
  CONSTRAINT `FKDD0C74D11B0A508B` FOREIGN KEY (`pd_log_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKDD0C74D1321DC511` FOREIGN KEY (`predeposit_id`) REFERENCES `wemall_predeposit` (`id`),
  CONSTRAINT `FKDD0C74D14CCA9953` FOREIGN KEY (`pd_log_admin_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_refund_log
-- ----------------------------
DROP TABLE IF EXISTS `wemall_refund_log`;
CREATE TABLE `wemall_refund_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `refund` decimal(12,2) DEFAULT NULL,
  `refund_id` varchar(255) DEFAULT NULL,
  `refund_log` varchar(255) DEFAULT NULL,
  `refund_type` varchar(255) DEFAULT NULL,
  `of_id` bigint(20) DEFAULT NULL,
  `refund_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC075AFCE8E17FA8A` (`refund_user_id`),
  KEY `FKC075AFCE9F21119E` (`of_id`),
  CONSTRAINT `FKC075AFCE8E17FA8A` FOREIGN KEY (`refund_user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKC075AFCE9F21119E` FOREIGN KEY (`of_id`) REFERENCES `wemall_orderform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_report
-- ----------------------------
DROP TABLE IF EXISTS `wemall_report`;
CREATE TABLE `wemall_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `handle_Time` datetime DEFAULT NULL,
  `handle_info` longtext,
  `result` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `acc1_id` bigint(20) DEFAULT NULL,
  `acc2_id` bigint(20) DEFAULT NULL,
  `acc3_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEBD95F85A995E663` (`goods_id`),
  KEY `FKEBD95F85C84755CF` (`subject_id`),
  KEY `FKEBD95F85EBD92B44` (`acc2_id`),
  KEY `FKEBD95F85537B6C51` (`user_id`),
  KEY `FKEBD95F85EBD99FA3` (`acc3_id`),
  KEY `FKEBD95F85EBD8B6E5` (`acc1_id`),
  CONSTRAINT `FKEBD95F85537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKEBD95F85A995E663` FOREIGN KEY (`goods_id`) REFERENCES `wemall_goods` (`id`),
  CONSTRAINT `FKEBD95F85C84755CF` FOREIGN KEY (`subject_id`) REFERENCES `wemall_report_subject` (`id`),
  CONSTRAINT `FKEBD95F85EBD8B6E5` FOREIGN KEY (`acc1_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FKEBD95F85EBD92B44` FOREIGN KEY (`acc2_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FKEBD95F85EBD99FA3` FOREIGN KEY (`acc3_id`) REFERENCES `wemall_accessory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_report_subject
-- ----------------------------
DROP TABLE IF EXISTS `wemall_report_subject`;
CREATE TABLE `wemall_report_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8CD20672965F1C05` (`type_id`),
  CONSTRAINT `FK8CD20672965F1C05` FOREIGN KEY (`type_id`) REFERENCES `wemall_report_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_report_type
-- ----------------------------
DROP TABLE IF EXISTS `wemall_report_type`;
CREATE TABLE `wemall_report_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_res
-- ----------------------------
DROP TABLE IF EXISTS `wemall_res`;
CREATE TABLE `wemall_res` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  `resName` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=779 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_return_gsp
-- ----------------------------
DROP TABLE IF EXISTS `wemall_return_gsp`;
CREATE TABLE `wemall_return_gsp` (
  `item_id` bigint(20) NOT NULL,
  `gsp_id` bigint(20) NOT NULL,
  KEY `FK199D8ACF8468FF8` (`item_id`),
  KEY `FK199D8AC2F8BE734` (`gsp_id`),
  CONSTRAINT `FK199D8AC2F8BE734` FOREIGN KEY (`gsp_id`) REFERENCES `wemall_goodsspecproperty` (`id`),
  CONSTRAINT `FK199D8ACF8468FF8` FOREIGN KEY (`item_id`) REFERENCES `wemall_goods_returnitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_role
-- ----------------------------
DROP TABLE IF EXISTS `wemall_role`;
CREATE TABLE `wemall_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `display` bit(1) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  `roleCode` varchar(255) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `rg_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9DBEE8ED10A75EE6` (`rg_id`),
  CONSTRAINT `FK9DBEE8ED10A75EE6` FOREIGN KEY (`rg_id`) REFERENCES `wemall_rolegroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_rolegroup
-- ----------------------------
DROP TABLE IF EXISTS `wemall_rolegroup`;
CREATE TABLE `wemall_rolegroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_role_res
-- ----------------------------
DROP TABLE IF EXISTS `wemall_role_res`;
CREATE TABLE `wemall_role_res` (
  `role_id` bigint(20) NOT NULL,
  `res_id` bigint(20) NOT NULL,
  KEY `FK6494F768261DF063` (`res_id`),
  KEY `FK6494F768AE50A871` (`role_id`),
  CONSTRAINT `FK6494F768261DF063` FOREIGN KEY (`res_id`) REFERENCES `wemall_res` (`id`),
  CONSTRAINT `FK6494F768AE50A871` FOREIGN KEY (`role_id`) REFERENCES `wemall_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_shipping
-- ----------------------------
DROP TABLE IF EXISTS `wemall_shipping`;
CREATE TABLE `wemall_shipping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `sequence` int(11) NOT NULL,
  `shipping_add_fee` decimal(12,2) DEFAULT NULL,
  `shipping_add_weight` int(11) NOT NULL,
  `shipping_fee` decimal(12,2) DEFAULT NULL,
  `shipping_info` longtext,
  `shipping_name` varchar(255) DEFAULT NULL,
  `shipping_weight` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK55AE97BF920D7683` (`store_id`),
  CONSTRAINT `FK55AE97BF920D7683` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_spare_goods
-- ----------------------------
DROP TABLE IF EXISTS `wemall_spare_goods`;
CREATE TABLE `wemall_spare_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `content` longtext,
  `errorMessage` varchar(255) DEFAULT NULL,
  `goods_old_price` int(11) DEFAULT '0',
  `goods_price` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `oldAndnew` int(11) DEFAULT '0',
  `sellMethod` int(11) DEFAULT '0',
  `seodescribe` longtext,
  `seokeyword` longtext,
  `status` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `img_id` bigint(20) DEFAULT NULL,
  `spareGoodsClass_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `img1_id` bigint(20) DEFAULT NULL,
  `img2_id` bigint(20) DEFAULT NULL,
  `img3_id` bigint(20) DEFAULT NULL,
  `img4_id` bigint(20) DEFAULT NULL,
  `main_img_id` bigint(20) DEFAULT NULL,
  `img5_id` bigint(20) DEFAULT NULL,
  `viewInFloor` bit(1) DEFAULT b'0',
  `sgf_id` bigint(20) DEFAULT NULL,
  `QQ` varchar(255) DEFAULT NULL,
  `recommend` bit(1) DEFAULT b'0',
  `down` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK6124F03D2FB91D11` (`area_id`),
  KEY `FK6124F03DEB7ECE12` (`img_id`),
  KEY `FK6124F03D537B6C51` (`user_id`),
  KEY `FK6124F03D557BFC43` (`spareGoodsClass_id`),
  KEY `FK6124F03DF4F59358` (`main_img_id`),
  KEY `FK6124F03DA454C244` (`img4_id`),
  KEY `FK6124F03DA4544DE5` (`img3_id`),
  KEY `FK6124F03DA4536527` (`img1_id`),
  KEY `FK6124F03DA453D986` (`img2_id`),
  KEY `FK6124F03DA45536A3` (`img5_id`),
  KEY `FK6124F03DE2CED19E` (`sgf_id`),
  CONSTRAINT `FK6124F03D2FB91D11` FOREIGN KEY (`area_id`) REFERENCES `wemall_area` (`id`),
  CONSTRAINT `FK6124F03D537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK6124F03D557BFC43` FOREIGN KEY (`spareGoodsClass_id`) REFERENCES `wemall_spare_goodsclass` (`id`),
  CONSTRAINT `FK6124F03DA4536527` FOREIGN KEY (`img1_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK6124F03DA453D986` FOREIGN KEY (`img2_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK6124F03DA4544DE5` FOREIGN KEY (`img3_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK6124F03DA454C244` FOREIGN KEY (`img4_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK6124F03DA45536A3` FOREIGN KEY (`img5_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK6124F03DE2CED19E` FOREIGN KEY (`sgf_id`) REFERENCES `wemall_spare_goodsfloor` (`id`),
  CONSTRAINT `FK6124F03DEB7ECE12` FOREIGN KEY (`img_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK6124F03DF4F59358` FOREIGN KEY (`main_img_id`) REFERENCES `wemall_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_spare_goodsclass
-- ----------------------------
DROP TABLE IF EXISTS `wemall_spare_goodsclass`;
CREATE TABLE `wemall_spare_goodsclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `sequence` int(11) DEFAULT '0',
  `parent_id` bigint(20) DEFAULT NULL,
  `viewInFloor` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKAC6B673B93F273F2` (`parent_id`),
  CONSTRAINT `FKAC6B673B93F273F2` FOREIGN KEY (`parent_id`) REFERENCES `wemall_spare_goodsclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_spare_goodsfloor
-- ----------------------------
DROP TABLE IF EXISTS `wemall_spare_goodsfloor`;
CREATE TABLE `wemall_spare_goodsfloor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `adver_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `visable` int(11) DEFAULT '1',
  `sgc_id` bigint(20) DEFAULT NULL,
  `adver_type` int(11) DEFAULT '0',
  `advert_url` varchar(255) DEFAULT NULL,
  `advert_id` bigint(20) DEFAULT NULL,
  `advert_img_id` bigint(20) DEFAULT NULL,
  `display` bit(1) DEFAULT b'1',
  `adp_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKAC95E1CFE2A2F9ED` (`sgc_id`),
  KEY `FKAC95E1CF8DEA4DD` (`advert_img_id`),
  KEY `FKAC95E1CF20641F1` (`advert_id`),
  KEY `FKAC95E1CF26BE20C1` (`adp_id`),
  CONSTRAINT `FKAC95E1CF20641F1` FOREIGN KEY (`advert_id`) REFERENCES `wemall_advert` (`id`),
  CONSTRAINT `FKAC95E1CF26BE20C1` FOREIGN KEY (`adp_id`) REFERENCES `wemall_adv_pos` (`id`),
  CONSTRAINT `FKAC95E1CF8DEA4DD` FOREIGN KEY (`advert_img_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FKAC95E1CFE2A2F9ED` FOREIGN KEY (`sgc_id`) REFERENCES `wemall_spare_goodsclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_store
-- ----------------------------
DROP TABLE IF EXISTS `wemall_store`;
CREATE TABLE `wemall_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `card_approve` bit(1) NOT NULL,
  `realstore_approve` bit(1) NOT NULL,
  `store_address` varchar(255) DEFAULT NULL,
  `store_credit` int(11) NOT NULL,
  `store_info` longtext,
  `store_msn` varchar(255) DEFAULT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `store_ower` varchar(255) DEFAULT NULL,
  `store_ower_card` varchar(255) DEFAULT NULL,
  `store_qq` varchar(255) DEFAULT NULL,
  `store_recommend` bit(1) NOT NULL,
  `store_recommend_time` datetime DEFAULT NULL,
  `store_seo_description` longtext,
  `store_seo_keywords` longtext,
  `store_status` int(11) NOT NULL,
  `store_telephone` varchar(255) DEFAULT NULL,
  `store_zip` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `validity` datetime DEFAULT NULL,
  `violation_reseaon` longtext,
  `area_id` bigint(20) DEFAULT NULL,
  `card_id` bigint(20) DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `sc_id` bigint(20) DEFAULT NULL,
  `store_banner_id` bigint(20) DEFAULT NULL,
  `store_license_id` bigint(20) DEFAULT NULL,
  `store_logo_id` bigint(20) DEFAULT NULL,
  `update_grade_id` bigint(20) DEFAULT NULL,
  `domain_modify_count` int(11) DEFAULT '0',
  `store_second_domain` varchar(255) DEFAULT NULL,
  `favorite_count` int(11) DEFAULT '0',
  `store_lat` decimal(6,2) DEFAULT NULL,
  `store_lng` decimal(6,2) DEFAULT NULL,
  `store_ww` varchar(255) DEFAULT NULL,
  `map_type` varchar(255) DEFAULT 'baidu',
  `delivery_begin_time` datetime DEFAULT NULL,
  `delivery_end_time` datetime DEFAULT NULL,
  `combin_begin_time` datetime DEFAULT NULL,
  `combin_end_time` datetime DEFAULT NULL,
  `weixin_begin_time` date DEFAULT NULL,
  `weixin_end_time` date DEFAULT NULL,
  `weixin_status` int(11) DEFAULT '0',
  `weixin_appId` varchar(255) DEFAULT NULL,
  `weixin_appSecret` varchar(255) DEFAULT NULL,
  `weixin_token` varchar(255) DEFAULT NULL,
  `weixin_welecome_content` longtext,
  `weixin_qr_img_id` bigint(20) DEFAULT NULL,
  `weixin_account` varchar(255) DEFAULT NULL,
  `store_weixin_logo_id` bigint(20) DEFAULT NULL,
  `weixin_store_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1A2E9F4AFA5E3FC2` (`area_id`),
  KEY `FK1A2E9F4A8D04BD7` (`update_grade_id`),
  KEY `FK1A2E9F4A33028121` (`grade_id`),
  KEY `FK1A2E9F4A11D81442` (`weixin_qr_img_id`),
  KEY `FK1A2E9F4A929E09BB` (`store_logo_id`),
  KEY `FK1A2E9F4A7CE341A` (`store_banner_id`),
  KEY `FK1A2E9F4A9A6FEF94` (`card_id`),
  KEY `FK1A2E9F4AC98DF95A` (`store_weixin_logo_id`),
  KEY `FK1A2E9F4A33F45DA9` (`sc_id`),
  KEY `FK1A2E9F4AA10642E1` (`store_license_id`),
  CONSTRAINT `FK1A2E9F4A11D81442` FOREIGN KEY (`weixin_qr_img_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK1A2E9F4A33028121` FOREIGN KEY (`grade_id`) REFERENCES `wemall_storegrade` (`id`),
  CONSTRAINT `FK1A2E9F4A33F45DA9` FOREIGN KEY (`sc_id`) REFERENCES `wemall_storeclass` (`id`),
  CONSTRAINT `FK1A2E9F4A7CE341A` FOREIGN KEY (`store_banner_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK1A2E9F4A8D04BD7` FOREIGN KEY (`update_grade_id`) REFERENCES `wemall_storegrade` (`id`),
  CONSTRAINT `FK1A2E9F4A929E09BB` FOREIGN KEY (`store_logo_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK1A2E9F4A9A6FEF94` FOREIGN KEY (`card_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK1A2E9F4AA10642E1` FOREIGN KEY (`store_license_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK1A2E9F4AC98DF95A` FOREIGN KEY (`store_weixin_logo_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK1A2E9F4AFA5E3FC2` FOREIGN KEY (`area_id`) REFERENCES `wemall_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32776 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_storecart
-- ----------------------------
DROP TABLE IF EXISTS `wemall_storecart`;
CREATE TABLE `wemall_storecart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `cart_session_id` varchar(255) DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `sc_status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK7EE3A390537B6C51` (`user_id`),
  KEY `FK1808656A1C0CA9F2` (`store_id`),
  CONSTRAINT `FK1808656A1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`),
  CONSTRAINT `FK7EE3A390537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_storeclass
-- ----------------------------
DROP TABLE IF EXISTS `wemall_storeclass`;
CREATE TABLE `wemall_storeclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `description_evaluate` decimal(4,1) DEFAULT NULL,
  `service_evaluate` decimal(4,1) DEFAULT NULL,
  `ship_evaluate` decimal(4,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE909086EA8D80D0F` (`parent_id`),
  CONSTRAINT `FKE909086EA8D80D0F` FOREIGN KEY (`parent_id`) REFERENCES `wemall_storeclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_storegrade
-- ----------------------------
DROP TABLE IF EXISTS `wemall_storegrade`;
CREATE TABLE `wemall_storegrade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `add_funciton` varchar(255) DEFAULT NULL,
  `audit` bit(1) NOT NULL,
  `content` longtext,
  `goodsCount` int(11) NOT NULL,
  `gradeLevel` int(11) NOT NULL,
  `gradeName` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `spaceSize` float NOT NULL,
  `sysGrade` bit(1) NOT NULL,
  `templates` varchar(255) DEFAULT NULL,
  `acount_num` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_storegrade_log
-- ----------------------------
DROP TABLE IF EXISTS `wemall_storegrade_log`;
CREATE TABLE `wemall_storegrade_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `log_edit` bit(1) NOT NULL,
  `store_grade_info` varchar(255) DEFAULT NULL,
  `store_grade_status` int(11) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK10CE6C6C920D7683` (`store_id`),
  CONSTRAINT `FK10CE6C6C920D7683` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_store_nav
-- ----------------------------
DROP TABLE IF EXISTS `wemall_store_nav`;
CREATE TABLE `wemall_store_nav` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `display` bit(1) NOT NULL,
  `sequence` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `win_type` varchar(255) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1806C2AE1C0CA9F2` (`store_id`),
  CONSTRAINT `FK1806C2AE1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_store_partner
-- ----------------------------
DROP TABLE IF EXISTS `wemall_store_partner`;
CREATE TABLE `wemall_store_partner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `sequence` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC63438D31C0CA9F2` (`store_id`),
  CONSTRAINT `FKC63438D31C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_store_point
-- ----------------------------
DROP TABLE IF EXISTS `wemall_store_point`;
CREATE TABLE `wemall_store_point` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `description_evaluate` decimal(4,1) DEFAULT NULL,
  `description_evaluate_halfyear` decimal(4,1) DEFAULT NULL,
  `description_evaluate_halfyear_count1` int(11) NOT NULL,
  `description_evaluate_halfyear_count2` int(11) NOT NULL,
  `description_evaluate_halfyear_count3` int(11) NOT NULL,
  `description_evaluate_halfyear_count4` int(11) NOT NULL,
  `description_evaluate_halfyear_count5` int(11) NOT NULL,
  `service_evaluate` decimal(4,1) DEFAULT NULL,
  `service_evaluate_halfyear` decimal(4,1) DEFAULT NULL,
  `service_evaluate_halfyear_count1` int(11) NOT NULL,
  `service_evaluate_halfyear_count2` int(11) NOT NULL,
  `service_evaluate_halfyear_count3` int(11) NOT NULL,
  `service_evaluate_halfyear_count4` int(11) NOT NULL,
  `service_evaluate_halfyear_count5` int(11) NOT NULL,
  `ship_evaluate` decimal(4,1) DEFAULT NULL,
  `ship_evaluate_halfyear` decimal(4,1) DEFAULT NULL,
  `ship_evaluate_halfyear_count1` int(11) NOT NULL,
  `ship_evaluate_halfyear_count2` int(11) NOT NULL,
  `ship_evaluate_halfyear_count3` int(11) NOT NULL,
  `ship_evaluate_halfyear_count4` int(11) NOT NULL,
  `ship_evaluate_halfyear_count5` int(11) NOT NULL,
  `store_evaluate1` decimal(4,1) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `statTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK3183385B1C0CA9F2` (`store_id`),
  CONSTRAINT `FK3183385B1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32776 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_store_slide
-- ----------------------------
DROP TABLE IF EXISTS `wemall_store_slide`;
CREATE TABLE `wemall_store_slide` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `acc_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK31AC207C1C0CA9F2` (`store_id`),
  KEY `FK31AC207C24933083` (`acc_id`),
  CONSTRAINT `FK31AC207C1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`),
  CONSTRAINT `FK31AC207C24933083` FOREIGN KEY (`acc_id`) REFERENCES `wemall_accessory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_store_stat
-- ----------------------------
DROP TABLE IF EXISTS `wemall_store_stat`;
CREATE TABLE `wemall_store_stat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `all_goods` int(11) NOT NULL,
  `all_store` int(11) NOT NULL,
  `all_user` int(11) NOT NULL,
  `next_time` datetime DEFAULT NULL,
  `order_amount` decimal(12,2) DEFAULT NULL,
  `store_update` int(11) NOT NULL,
  `week_complaint` int(11) NOT NULL,
  `week_goods` int(11) NOT NULL,
  `week_order` int(11) NOT NULL,
  `week_report` int(11) NOT NULL,
  `week_store` int(11) NOT NULL,
  `week_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_sysconfig
-- ----------------------------
DROP TABLE IF EXISTS `wemall_sysconfig`;
CREATE TABLE `wemall_sysconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `bigHeight` int(11) NOT NULL,
  `bigWidth` int(11) NOT NULL,
  `closeReason` longtext,
  `codeStat` longtext,
  `complaint_time` int(11) NOT NULL,
  `consumptionRatio` int(11) NOT NULL,
  `copyRight` varchar(255) DEFAULT NULL,
  `creditrule` longtext,
  `deposit` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `emailEnable` bit(1) NOT NULL,
  `emailHost` varchar(255) DEFAULT NULL,
  `emailPort` int(11) NOT NULL,
  `emailPws` varchar(255) DEFAULT NULL,
  `emailTest` varchar(255) DEFAULT NULL,
  `emailUser` varchar(255) DEFAULT NULL,
  `emailUserName` varchar(255) DEFAULT NULL,
  `everyIndentLimit` int(11) NOT NULL,
  `gold` bit(1) NOT NULL,
  `goldMarketValue` int(11) NOT NULL,
  `groupBuy` bit(1) NOT NULL,
  `hotSearch` varchar(255) DEFAULT NULL,
  `imageFilesize` int(11) NOT NULL,
  `imageSaveType` varchar(255) DEFAULT NULL,
  `imageSuffix` varchar(255) DEFAULT NULL,
  `indentComment` int(11) NOT NULL,
  `integral` bit(1) NOT NULL,
  `integralRate` int(11) NOT NULL,
  `integralStore` bit(1) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `memberDayLogin` int(11) NOT NULL,
  `memberRegister` int(11) NOT NULL,
  `middleHeight` int(11) NOT NULL,
  `middleWidth` int(11) NOT NULL,
  `securityCodeConsult` bit(1) NOT NULL,
  `securityCodeLogin` bit(1) NOT NULL,
  `securityCodeRegister` bit(1) NOT NULL,
  `securityCodeType` varchar(255) DEFAULT NULL,
  `share_code` longtext,
  `smallHeight` int(11) NOT NULL,
  `smallWidth` int(11) NOT NULL,
  `smsEnbale` bit(1) NOT NULL,
  `smsPassword` varchar(255) DEFAULT NULL,
  `smsTest` varchar(255) DEFAULT NULL,
  `smsURL` varchar(255) DEFAULT NULL,
  `smsUserName` varchar(255) DEFAULT NULL,
  `store_allow` bit(1) NOT NULL,
  `store_payment` longtext,
  `sysLanguage` varchar(255) DEFAULT NULL,
  `templates` longtext,
  `title` varchar(255) DEFAULT NULL,
  `uploadFilePath` varchar(255) DEFAULT NULL,
  `user_creditrule` longtext,
  `visitorConsult` bit(1) NOT NULL,
  `voucher` bit(1) NOT NULL,
  `websiteName` varchar(255) DEFAULT NULL,
  `websiteState` bit(1) NOT NULL,
  `ztc_price` int(11) NOT NULL,
  `ztc_status` bit(1) NOT NULL,
  `goodsImage_id` bigint(20) DEFAULT NULL,
  `memberIcon_id` bigint(20) DEFAULT NULL,
  `storeImage_id` bigint(20) DEFAULT NULL,
  `websiteLogo_id` bigint(20) DEFAULT NULL,
  `domain_allow_count` int(11) DEFAULT '0',
  `second_domain_open` bit(1) DEFAULT b'0',
  `sys_domain` longtext,
  `qq_login` bit(1) DEFAULT b'0',
  `qq_login_id` varchar(255) DEFAULT NULL,
  `qq_login_key` varchar(255) DEFAULT NULL,
  `qq_domain_code` longtext,
  `sina_domain_code` longtext,
  `sina_login` bit(1) DEFAULT b'0',
  `sina_login_id` varchar(255) DEFAULT NULL,
  `sina_login_key` varchar(255) DEFAULT NULL,
  `imageWebServer` varchar(255) DEFAULT NULL,
  `lucene_update` datetime DEFAULT NULL,
  `alipay_fenrun` int(11) DEFAULT '0',
  `balance_fenrun` int(11) DEFAULT '0',
  `auto_order_confirm` int(11) DEFAULT '7',
  `auto_order_notice` int(11) DEFAULT '3',
  `bargain_maximum` int(11) DEFAULT '0',
  `bargain_rebate` decimal(3,2) DEFAULT NULL,
  `bargain_state` longtext,
  `bargain_status` int(11) DEFAULT '0',
  `bargain_title` varchar(255) DEFAULT NULL,
  `service_qq_list` longtext,
  `service_telphone_list` longtext,
  `sys_delivery_maximum` int(11) DEFAULT '0',
  `uc_bbs` bit(1) DEFAULT b'0',
  `kuaidi_id` longtext,
  `uc_api` varchar(255) DEFAULT NULL,
  `uc_appid` varchar(255) DEFAULT NULL,
  `uc_database` varchar(255) DEFAULT NULL,
  `uc_database_port` varchar(255) DEFAULT NULL,
  `uc_database_pws` varchar(255) DEFAULT NULL,
  `uc_database_url` varchar(255) DEFAULT NULL,
  `uc_database_username` varchar(255) DEFAULT NULL,
  `uc_ip` varchar(255) DEFAULT NULL,
  `uc_key` varchar(255) DEFAULT NULL,
  `uc_table_preffix` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT '￥',
  `bargain_validity` int(11) DEFAULT '3',
  `delivery_amount` int(11) DEFAULT '50',
  `delivery_status` int(11) DEFAULT '0',
  `delivery_title` varchar(255) DEFAULT NULL,
  `websiteCss` varchar(255) DEFAULT 'blue',
  `combin_amount` int(11) DEFAULT '50',
  `combin_count` int(11) DEFAULT '3',
  `ztc_goods_view` int(11) DEFAULT '0',
  `auto_order_evaluate` int(11) DEFAULT '7',
  `auto_order_return` int(11) DEFAULT '7',
  `weixin_store` bit(1) DEFAULT b'0',
  `weixin_amount` int(11) DEFAULT '50',
  `config_payment_type` int(11) DEFAULT '0',
  `weixin_account` varchar(255) DEFAULT NULL,
  `weixin_appId` varchar(255) DEFAULT NULL,
  `weixin_appSecret` varchar(255) DEFAULT NULL,
  `weixin_token` varchar(255) DEFAULT NULL,
  `weixin_welecome_content` longtext,
  `store_weixin_logo_id` bigint(20) DEFAULT NULL,
  `weixin_qr_img_id` bigint(20) DEFAULT NULL,
  `site_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDA007E38D756261E` (`websiteLogo_id`),
  KEY `FKDA007E38BE67A14A` (`storeImage_id`),
  KEY `FKDA007E3811D81442` (`weixin_qr_img_id`),
  KEY `FKDA007E381CBC7DB1` (`memberIcon_id`),
  KEY `FKDA007E38C98DF95A` (`store_weixin_logo_id`),
  KEY `FKDA007E382984FABF` (`goodsImage_id`),
  CONSTRAINT `FKDA007E3811D81442` FOREIGN KEY (`weixin_qr_img_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FKDA007E381CBC7DB1` FOREIGN KEY (`memberIcon_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FKDA007E382984FABF` FOREIGN KEY (`goodsImage_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FKDA007E38BE67A14A` FOREIGN KEY (`storeImage_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FKDA007E38C98DF95A` FOREIGN KEY (`store_weixin_logo_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FKDA007E38D756261E` FOREIGN KEY (`websiteLogo_id`) REFERENCES `wemall_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_syslog
-- ----------------------------
DROP TABLE IF EXISTS `wemall_syslog`;
CREATE TABLE `wemall_syslog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `ip` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEEA95FA8537B6C51` (`user_id`),
  CONSTRAINT `FKEEA95FA8537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_template
-- ----------------------------
DROP TABLE IF EXISTS `wemall_template`;
CREATE TABLE `wemall_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `info` varchar(255) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `open` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229416 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_transport
-- ----------------------------
DROP TABLE IF EXISTS `wemall_transport`;
CREATE TABLE `wemall_transport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `trans_ems` bit(1) NOT NULL,
  `trans_ems_info` longtext,
  `trans_express` bit(1) NOT NULL,
  `trans_express_info` longtext,
  `trans_mail` bit(1) NOT NULL,
  `trans_mail_info` longtext,
  `trans_name` varchar(255) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `trans_time` int(11) DEFAULT '0',
  `trans_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK58C67F38920D7683` (`store_id`),
  CONSTRAINT `FK58C67F38920D7683` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_trans_area
-- ----------------------------
DROP TABLE IF EXISTS `wemall_trans_area`;
CREATE TABLE `wemall_trans_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `areaName` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK4A86F2FBB19097FD` (`parent_id`),
  CONSTRAINT `FK4A86F2FBB19097FD` FOREIGN KEY (`parent_id`) REFERENCES `wemall_trans_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=900006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_user
-- ----------------------------
DROP TABLE IF EXISTS `wemall_user`;
CREATE TABLE `wemall_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `MSN` varchar(255) DEFAULT NULL,
  `QQ` varchar(255) DEFAULT NULL,
  `WW` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `availableBalance` decimal(12,2) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `freezeBlance` decimal(12,2) DEFAULT NULL,
  `gold` int(11) NOT NULL,
  `integral` int(11) NOT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginIp` varchar(255) DEFAULT NULL,
  `loginCount` int(11) NOT NULL,
  `loginDate` datetime DEFAULT NULL,
  `loginIp` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `report` int(11) NOT NULL,
  `sex` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `trueName` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userRole` varchar(255) DEFAULT NULL,
  `user_credit` int(11) NOT NULL,
  `photo_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `qq_openid` varchar(255) DEFAULT NULL,
  `sina_openid` varchar(255) DEFAULT NULL,
  `store_quick_menu` longtext,
  `parent_id` bigint(20) DEFAULT NULL,
  `years` int(11) DEFAULT '0',
  `area_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9DC05442FA5E3FC2` (`area_id`),
  KEY `FK9DC05442A24C51C3` (`parent_id`),
  KEY `FK9DC054421C0CA9F2` (`store_id`),
  KEY `FK9DC054422D77C132` (`photo_id`),
  CONSTRAINT `FK9DC054421C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`),
  CONSTRAINT `FK9DC054422D77C132` FOREIGN KEY (`photo_id`) REFERENCES `wemall_accessory` (`id`),
  CONSTRAINT `FK9DC05442A24C51C3` FOREIGN KEY (`parent_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK9DC05442FA5E3FC2` FOREIGN KEY (`area_id`) REFERENCES `wemall_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32793 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_userconfig
-- ----------------------------
DROP TABLE IF EXISTS `wemall_userconfig`;
CREATE TABLE `wemall_userconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA058A49E537B6C51` (`user_id`),
  CONSTRAINT `FKA058A49E537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_usergoodsclass
-- ----------------------------
DROP TABLE IF EXISTS `wemall_usergoodsclass`;
CREATE TABLE `wemall_usergoodsclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `display` bit(1) NOT NULL,
  `level` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA45E4B3E537B6C51` (`user_id`),
  KEY `FKA45E4B3E153E874` (`parent_id`),
  CONSTRAINT `FKA45E4B3E153E874` FOREIGN KEY (`parent_id`) REFERENCES `wemall_usergoodsclass` (`id`),
  CONSTRAINT `FKA45E4B3E537B6C51` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32777 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_user_attention
-- ----------------------------
DROP TABLE IF EXISTS `wemall_user_attention`;
CREATE TABLE `wemall_user_attention` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `fromUser_id` bigint(20) DEFAULT NULL,
  `toUser_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK6D85856157C55027` (`toUser_id`),
  KEY `FK6D858561BE806418` (`fromUser_id`),
  CONSTRAINT `FK6D85856157C55027` FOREIGN KEY (`toUser_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK6D858561BE806418` FOREIGN KEY (`fromUser_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_user_friend
-- ----------------------------
DROP TABLE IF EXISTS `wemall_user_friend`;
CREATE TABLE `wemall_user_friend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `fromUser_id` bigint(20) DEFAULT NULL,
  `toUser_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK880111E18D202D76` (`toUser_id`),
  KEY `FK880111E1F3DB4167` (`fromUser_id`),
  CONSTRAINT `FK880111E18D202D76` FOREIGN KEY (`toUser_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK880111E1F3DB4167` FOREIGN KEY (`fromUser_id`) REFERENCES `wemall_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_user_role
-- ----------------------------
DROP TABLE IF EXISTS `wemall_user_role`;
CREATE TABLE `wemall_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKC7643E5378F5CB22` (`role_id`),
  KEY `FKC7643E531E208F02` (`user_id`),
  CONSTRAINT `FKC7643E531E208F02` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FKC7643E5378F5CB22` FOREIGN KEY (`role_id`) REFERENCES `wemall_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_visit
-- ----------------------------
DROP TABLE IF EXISTS `wemall_visit`;
CREATE TABLE `wemall_visit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `visitTime` datetime DEFAULT NULL,
  `homepage_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK1891039451589842` (`homepage_id`),
  KEY `FK189103941E208F02` (`user_id`),
  CONSTRAINT `FK189103941E208F02` FOREIGN KEY (`user_id`) REFERENCES `wemall_user` (`id`),
  CONSTRAINT `FK1891039451589842` FOREIGN KEY (`homepage_id`) REFERENCES `wemall_homepage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_vlog
-- ----------------------------
DROP TABLE IF EXISTS `wemall_vlog`;
CREATE TABLE `wemall_vlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `gold` int(11) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK7D74B19F920D7683` (`store_id`),
  CONSTRAINT `FK7D74B19F920D7683` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_vmenu
-- ----------------------------
DROP TABLE IF EXISTS `wemall_vmenu`;
CREATE TABLE `wemall_vmenu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `menu_key` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_type` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `menu_sequence` int(11) DEFAULT '0',
  `menu_key_content` longtext,
  `menu_cat` varchar(255) DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK3121D264AA91F874` (`parent_id`),
  KEY `FK3121D264920D7683` (`store_id`),
  CONSTRAINT `FK3121D264920D7683` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`),
  CONSTRAINT `FK3121D264AA91F874` FOREIGN KEY (`parent_id`) REFERENCES `wemall_vmenu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_vmessage
-- ----------------------------
DROP TABLE IF EXISTS `wemall_vmessage`;
CREATE TABLE `wemall_vmessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `store_id` bigint(20) DEFAULT NULL,
  `FromUserName` varchar(255) DEFAULT NULL,
  `MsgType` varchar(255) DEFAULT NULL,
  `json_map` varchar(255) DEFAULT NULL,
  `reply` longtext,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK8F2968E2920D7683` (`store_id`),
  CONSTRAINT `FK8F2968E2920D7683` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_watermark
-- ----------------------------
DROP TABLE IF EXISTS `wemall_watermark`;
CREATE TABLE `wemall_watermark` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `wm_image_alpha` float NOT NULL,
  `wm_image_open` bit(1) NOT NULL,
  `wm_image_pos` int(11) NOT NULL,
  `wm_text` varchar(255) DEFAULT NULL,
  `wm_text_color` varchar(255) DEFAULT NULL,
  `wm_text_font` varchar(255) DEFAULT NULL,
  `wm_text_font_size` int(11) NOT NULL,
  `wm_text_open` bit(1) NOT NULL,
  `wm_text_pos` int(11) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `wm_image_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA66FB24D85288CB2` (`wm_image_id`),
  KEY `FKA66FB24D1C0CA9F2` (`store_id`),
  CONSTRAINT `FKA66FB24D1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `wemall_store` (`id`),
  CONSTRAINT `FKA66FB24D85288CB2` FOREIGN KEY (`wm_image_id`) REFERENCES `wemall_accessory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wemall_ztc_gold_log
-- ----------------------------
DROP TABLE IF EXISTS `wemall_ztc_gold_log`;
CREATE TABLE `wemall_ztc_gold_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `zgl_content` varchar(255) DEFAULT NULL,
  `zgl_gold` int(11) NOT NULL,
  `zgl_type` int(11) NOT NULL,
  `zgl_goods_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5A722B8C50A38BC3` (`zgl_goods_id`),
  CONSTRAINT `FK5A722B8C50A38BC3` FOREIGN KEY (`zgl_goods_id`) REFERENCES `wemall_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
