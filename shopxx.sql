/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : shopxx

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-10-13 16:09:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xx_ad
-- ----------------------------
DROP TABLE IF EXISTS `xx_ad`;
CREATE TABLE `xx_ad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `content` longtext,
  `end_date` datetime DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ad_position` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6D301C2E947C2F5` (`ad_position`),
  CONSTRAINT `FK6D301C2E947C2F5` FOREIGN KEY (`ad_position`) REFERENCES `xx_ad_position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_admin
-- ----------------------------
DROP TABLE IF EXISTS `xx_admin`;
CREATE TABLE `xx_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `is_enabled` bit(1) NOT NULL,
  `is_locked` bit(1) NOT NULL,
  `locked_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `xx_admin_role`;
CREATE TABLE `xx_admin_role` (
  `admins` bigint(20) NOT NULL,
  `roles` bigint(20) NOT NULL,
  PRIMARY KEY (`admins`,`roles`),
  KEY `FKD291D6053FF548F7` (`roles`),
  KEY `FKD291D605A022690F` (`admins`),
  CONSTRAINT `FKD291D6053FF548F7` FOREIGN KEY (`roles`) REFERENCES `xx_role` (`id`),
  CONSTRAINT `FKD291D605A022690F` FOREIGN KEY (`admins`) REFERENCES `xx_admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `xx_ad_position`;
CREATE TABLE `xx_ad_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `height` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `template` longtext NOT NULL,
  `width` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_area
-- ----------------------------
DROP TABLE IF EXISTS `xx_area`;
CREATE TABLE `xx_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `full_name` longtext NOT NULL,
  `name` varchar(100) NOT NULL,
  `tree_path` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9E19DA6CFE1E12FB` (`parent`),
  CONSTRAINT `FK9E19DA6CFE1E12FB` FOREIGN KEY (`parent`) REFERENCES `xx_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3317 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_article
-- ----------------------------
DROP TABLE IF EXISTS `xx_article`;
CREATE TABLE `xx_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` longtext,
  `hits` bigint(20) NOT NULL,
  `is_publication` bit(1) NOT NULL,
  `is_top` bit(1) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `article_category` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK636982B7CA3B1F7` (`article_category`),
  CONSTRAINT `FK636982B7CA3B1F7` FOREIGN KEY (`article_category`) REFERENCES `xx_article_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_article_category
-- ----------------------------
DROP TABLE IF EXISTS `xx_article_category`;
CREATE TABLE `xx_article_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `tree_path` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK57108986F587647A` (`parent`),
  CONSTRAINT `FK57108986F587647A` FOREIGN KEY (`parent`) REFERENCES `xx_article_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `xx_article_tag`;
CREATE TABLE `xx_article_tag` (
  `articles` bigint(20) NOT NULL,
  `tags` bigint(20) NOT NULL,
  PRIMARY KEY (`articles`,`tags`),
  KEY `FKB9183E12C842716F` (`tags`),
  KEY `FKB9183E1229F6DEEF` (`articles`),
  CONSTRAINT `FKB9183E1229F6DEEF` FOREIGN KEY (`articles`) REFERENCES `xx_article` (`id`),
  CONSTRAINT `FKB9183E12C842716F` FOREIGN KEY (`tags`) REFERENCES `xx_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_attribute
-- ----------------------------
DROP TABLE IF EXISTS `xx_attribute`;
CREATE TABLE `xx_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `property_index` int(11) NOT NULL,
  `product_category` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE81F41DD7629117` (`product_category`),
  CONSTRAINT `FKE81F41DD7629117` FOREIGN KEY (`product_category`) REFERENCES `xx_product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_attribute_option
-- ----------------------------
DROP TABLE IF EXISTS `xx_attribute_option`;
CREATE TABLE `xx_attribute_option` (
  `attribute` bigint(20) NOT NULL,
  `options` varchar(255) DEFAULT NULL,
  KEY `FK96E026D75E1B95F4` (`attribute`),
  CONSTRAINT `FK96E026D75E1B95F4` FOREIGN KEY (`attribute`) REFERENCES `xx_attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_brand
-- ----------------------------
DROP TABLE IF EXISTS `xx_brand`;
CREATE TABLE `xx_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `introduction` longtext,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_cart
-- ----------------------------
DROP TABLE IF EXISTS `xx_cart`;
CREATE TABLE `xx_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `cart_key` varchar(255) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9E1A84FF7C62EDF8` (`member`),
  CONSTRAINT `FK9E1A84FF7C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `xx_cart_item`;
CREATE TABLE `xx_cart_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `cart` bigint(20) NOT NULL,
  `product` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1A67F65339A23004` (`cart`),
  KEY `FK1A67F65379F8D99A` (`product`),
  CONSTRAINT `FK1A67F65339A23004` FOREIGN KEY (`cart`) REFERENCES `xx_cart` (`id`),
  CONSTRAINT `FK1A67F65379F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_consultation
-- ----------------------------
DROP TABLE IF EXISTS `xx_consultation`;
CREATE TABLE `xx_consultation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `is_show` bit(1) NOT NULL,
  `for_consultation` bigint(20) DEFAULT NULL,
  `member` bigint(20) DEFAULT NULL,
  `product` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK33228D687C62EDF8` (`member`),
  KEY `FK33228D68366B868C` (`for_consultation`),
  KEY `FK33228D6879F8D99A` (`product`),
  CONSTRAINT `FK33228D68366B868C` FOREIGN KEY (`for_consultation`) REFERENCES `xx_consultation` (`id`),
  CONSTRAINT `FK33228D6879F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK33228D687C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_coupon
-- ----------------------------
DROP TABLE IF EXISTS `xx_coupon`;
CREATE TABLE `xx_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `introduction` longtext,
  `is_enabled` bit(1) NOT NULL,
  `is_exchange` bit(1) NOT NULL,
  `maximum_price` decimal(21,6) DEFAULT NULL,
  `maximum_quantity` int(11) DEFAULT NULL,
  `minimum_price` decimal(21,6) DEFAULT NULL,
  `minimum_quantity` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `point` bigint(20) DEFAULT NULL,
  `prefix` varchar(255) NOT NULL,
  `price_expression` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_coupon_code
-- ----------------------------
DROP TABLE IF EXISTS `xx_coupon_code`;
CREATE TABLE `xx_coupon_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `code` varchar(100) NOT NULL,
  `is_used` bit(1) NOT NULL,
  `used_date` datetime DEFAULT NULL,
  `coupon` bigint(20) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FKEF53A3A77C62EDF8` (`member`),
  KEY `FKEF53A3A75B638910` (`coupon`),
  CONSTRAINT `FKEF53A3A75B638910` FOREIGN KEY (`coupon`) REFERENCES `xx_coupon` (`id`),
  CONSTRAINT `FKEF53A3A77C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_delivery_center
-- ----------------------------
DROP TABLE IF EXISTS `xx_delivery_center`;
CREATE TABLE `xx_delivery_center` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `area` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK18EB77C139A0DADE` (`area`),
  CONSTRAINT `FK18EB77C139A0DADE` FOREIGN KEY (`area`) REFERENCES `xx_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_delivery_corp
-- ----------------------------
DROP TABLE IF EXISTS `xx_delivery_corp`;
CREATE TABLE `xx_delivery_corp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_delivery_template
-- ----------------------------
DROP TABLE IF EXISTS `xx_delivery_template`;
CREATE TABLE `xx_delivery_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `background` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `height` int(11) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `offsetx` int(11) NOT NULL,
  `offsety` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_deposit
-- ----------------------------
DROP TABLE IF EXISTS `xx_deposit`;
CREATE TABLE `xx_deposit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `balance` decimal(21,6) NOT NULL,
  `credit` decimal(21,6) NOT NULL,
  `debit` decimal(21,6) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `member` bigint(20) NOT NULL,
  `orders` bigint(20) DEFAULT NULL,
  `payment` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEBB7CC5F7C62EDF8` (`member`),
  KEY `FKEBB7CC5F4115A3C8` (`payment`),
  KEY `FKEBB7CC5FB992E8EF` (`orders`),
  CONSTRAINT `FKEBB7CC5F4115A3C8` FOREIGN KEY (`payment`) REFERENCES `xx_payment` (`id`),
  CONSTRAINT `FKEBB7CC5F7C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `FKEBB7CC5FB992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `xx_friend_link`;
CREATE TABLE `xx_friend_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_gift_item
-- ----------------------------
DROP TABLE IF EXISTS `xx_gift_item`;
CREATE TABLE `xx_gift_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `gift` bigint(20) NOT NULL,
  `promotion` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gift` (`gift`,`promotion`),
  KEY `FK2FB85243FD463A02` (`promotion`),
  KEY `FK2FB852438C9B75DB` (`gift`),
  CONSTRAINT `FK2FB852438C9B75DB` FOREIGN KEY (`gift`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK2FB85243FD463A02` FOREIGN KEY (`promotion`) REFERENCES `xx_promotion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_goods
-- ----------------------------
DROP TABLE IF EXISTS `xx_goods`;
CREATE TABLE `xx_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_log
-- ----------------------------
DROP TABLE IF EXISTS `xx_log`;
CREATE TABLE `xx_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` longtext,
  `ip` varchar(255) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `parameter` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_member
-- ----------------------------
DROP TABLE IF EXISTS `xx_member`;
CREATE TABLE `xx_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `amount` decimal(27,12) NOT NULL,
  `attribute_value0` varchar(255) DEFAULT NULL,
  `attribute_value1` varchar(255) DEFAULT NULL,
  `attribute_value2` varchar(255) DEFAULT NULL,
  `attribute_value3` varchar(255) DEFAULT NULL,
  `attribute_value4` varchar(255) DEFAULT NULL,
  `attribute_value5` varchar(255) DEFAULT NULL,
  `attribute_value6` varchar(255) DEFAULT NULL,
  `attribute_value7` varchar(255) DEFAULT NULL,
  `attribute_value8` varchar(255) DEFAULT NULL,
  `attribute_value9` varchar(255) DEFAULT NULL,
  `balance` decimal(27,12) NOT NULL,
  `birth` datetime DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `is_enabled` bit(1) NOT NULL,
  `is_locked` bit(1) NOT NULL,
  `locked_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `point` bigint(20) NOT NULL,
  `register_ip` varchar(255) NOT NULL,
  `safe_key_expire` datetime DEFAULT NULL,
  `safe_key_value` varchar(255) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `area` bigint(20) DEFAULT NULL,
  `member_rank` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK92D398B939A0DADE` (`area`),
  KEY `FK92D398B937884F5B` (`member_rank`),
  CONSTRAINT `FK92D398B937884F5B` FOREIGN KEY (`member_rank`) REFERENCES `xx_member_rank` (`id`),
  CONSTRAINT `FK92D398B939A0DADE` FOREIGN KEY (`area`) REFERENCES `xx_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_member_attribute
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_attribute`;
CREATE TABLE `xx_member_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `is_enabled` bit(1) NOT NULL,
  `is_required` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `property_index` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_member_attribute_option
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_attribute_option`;
CREATE TABLE `xx_member_attribute_option` (
  `member_attribute` bigint(20) NOT NULL,
  `options` varchar(255) DEFAULT NULL,
  KEY `FKC3DC263E8A8815` (`member_attribute`),
  CONSTRAINT `FKC3DC263E8A8815` FOREIGN KEY (`member_attribute`) REFERENCES `xx_member_attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_member_favorite_product
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_favorite_product`;
CREATE TABLE `xx_member_favorite_product` (
  `favorite_members` bigint(20) NOT NULL,
  `favorite_products` bigint(20) NOT NULL,
  PRIMARY KEY (`favorite_members`,`favorite_products`),
  KEY `FK44DF1412A43B40D4` (`favorite_members`),
  KEY `FK44DF1412830D5552` (`favorite_products`),
  CONSTRAINT `FK44DF1412830D5552` FOREIGN KEY (`favorite_products`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK44DF1412A43B40D4` FOREIGN KEY (`favorite_members`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_member_rank
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_rank`;
CREATE TABLE `xx_member_rank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `amount` decimal(21,6) DEFAULT NULL,
  `is_default` bit(1) NOT NULL,
  `is_special` bit(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `scale` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `amount` (`amount`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_message
-- ----------------------------
DROP TABLE IF EXISTS `xx_message`;
CREATE TABLE `xx_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` longtext NOT NULL,
  `ip` varchar(255) NOT NULL,
  `is_draft` bit(1) NOT NULL,
  `receiver_delete` bit(1) NOT NULL,
  `receiver_read` bit(1) NOT NULL,
  `sender_delete` bit(1) NOT NULL,
  `sender_read` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `for_message` bigint(20) DEFAULT NULL,
  `receiver` bigint(20) DEFAULT NULL,
  `sender` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC7FBB5C886A07D93` (`sender`),
  KEY `FKC7FBB5C8E2B39A54` (`for_message`),
  KEY `FKC7FBB5C88C6C4D4D` (`receiver`),
  CONSTRAINT `FKC7FBB5C886A07D93` FOREIGN KEY (`sender`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `FKC7FBB5C88C6C4D4D` FOREIGN KEY (`receiver`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `FKC7FBB5C8E2B39A54` FOREIGN KEY (`for_message`) REFERENCES `xx_message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_navigation
-- ----------------------------
DROP TABLE IF EXISTS `xx_navigation`;
CREATE TABLE `xx_navigation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `is_blank_target` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_order
-- ----------------------------
DROP TABLE IF EXISTS `xx_order`;
CREATE TABLE `xx_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `amount_paid` decimal(21,6) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `consignee` varchar(255) NOT NULL,
  `coupon_discount` decimal(21,6) NOT NULL,
  `expire` datetime DEFAULT NULL,
  `fee` decimal(21,6) NOT NULL,
  `freight` decimal(21,6) NOT NULL,
  `invoice_title` varchar(255) DEFAULT NULL,
  `is_allocated_stock` bit(1) NOT NULL,
  `is_invoice` bit(1) NOT NULL,
  `lock_expire` datetime DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `offset_amount` decimal(21,6) NOT NULL,
  `order_status` int(11) NOT NULL,
  `payment_method_name` varchar(255) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `point` bigint(20) NOT NULL,
  `promotion` varchar(255) DEFAULT NULL,
  `promotion_discount` decimal(21,6) NOT NULL,
  `shipping_method_name` varchar(255) NOT NULL,
  `shipping_status` int(11) NOT NULL,
  `sn` varchar(100) NOT NULL,
  `tax` decimal(21,6) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `area` bigint(20) DEFAULT NULL,
  `coupon_code` bigint(20) DEFAULT NULL,
  `member` bigint(20) NOT NULL,
  `operator` bigint(20) DEFAULT NULL,
  `payment_method` bigint(20) DEFAULT NULL,
  `shipping_method` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FK25E6B94F67F7C585` (`shipping_method`),
  KEY `FK25E6B94F39A0DADE` (`area`),
  KEY `FK25E6B94F7C62EDF8` (`member`),
  KEY `FK25E6B94FC050045D` (`coupon_code`),
  KEY `FK25E6B94FD7122AAF` (`operator`),
  KEY `FK25E6B94FD3A8BE7D` (`payment_method`),
  CONSTRAINT `FK25E6B94F39A0DADE` FOREIGN KEY (`area`) REFERENCES `xx_area` (`id`),
  CONSTRAINT `FK25E6B94F67F7C585` FOREIGN KEY (`shipping_method`) REFERENCES `xx_shipping_method` (`id`),
  CONSTRAINT `FK25E6B94F7C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `FK25E6B94FC050045D` FOREIGN KEY (`coupon_code`) REFERENCES `xx_coupon_code` (`id`),
  CONSTRAINT `FK25E6B94FD3A8BE7D` FOREIGN KEY (`payment_method`) REFERENCES `xx_payment_method` (`id`),
  CONSTRAINT `FK25E6B94FD7122AAF` FOREIGN KEY (`operator`) REFERENCES `xx_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_order_coupon
-- ----------------------------
DROP TABLE IF EXISTS `xx_order_coupon`;
CREATE TABLE `xx_order_coupon` (
  `orders` bigint(20) NOT NULL,
  `coupons` bigint(20) NOT NULL,
  KEY `FKA3F6D516E538DDF7` (`coupons`),
  KEY `FKA3F6D516B992E8EF` (`orders`),
  CONSTRAINT `FKA3F6D516B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`),
  CONSTRAINT `FKA3F6D516E538DDF7` FOREIGN KEY (`coupons`) REFERENCES `xx_coupon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_order_item
-- ----------------------------
DROP TABLE IF EXISTS `xx_order_item`;
CREATE TABLE `xx_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `is_gift` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(21,6) NOT NULL,
  `quantity` int(11) NOT NULL,
  `return_quantity` int(11) NOT NULL,
  `shipped_quantity` int(11) NOT NULL,
  `sn` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `orders` bigint(20) NOT NULL,
  `product` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD69FF403B992E8EF` (`orders`),
  KEY `FKD69FF40379F8D99A` (`product`),
  CONSTRAINT `FKD69FF40379F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FKD69FF403B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_order_log
-- ----------------------------
DROP TABLE IF EXISTS `xx_order_log`;
CREATE TABLE `xx_order_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `orders` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF6684C54B992E8EF` (`orders`),
  CONSTRAINT `FKF6684C54B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_parameter
-- ----------------------------
DROP TABLE IF EXISTS `xx_parameter`;
CREATE TABLE `xx_parameter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `parameter_group` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8238FD2A818BF383` (`parameter_group`),
  CONSTRAINT `FK8238FD2A818BF383` FOREIGN KEY (`parameter_group`) REFERENCES `xx_parameter_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_parameter_group
-- ----------------------------
DROP TABLE IF EXISTS `xx_parameter_group`;
CREATE TABLE `xx_parameter_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `product_category` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD68A4F2AD7629117` (`product_category`),
  CONSTRAINT `FKD68A4F2AD7629117` FOREIGN KEY (`product_category`) REFERENCES `xx_product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_payment
-- ----------------------------
DROP TABLE IF EXISTS `xx_payment`;
CREATE TABLE `xx_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `amount` decimal(21,6) NOT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `expire` datetime DEFAULT NULL,
  `fee` decimal(21,6) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `method` int(11) NOT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `payer` varchar(255) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_plugin_id` varchar(255) DEFAULT NULL,
  `sn` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  `orders` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FK602CE7C77C62EDF8` (`member`),
  KEY `FK602CE7C7B992E8EF` (`orders`),
  CONSTRAINT `FK602CE7C77C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `FK602CE7C7B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_payment_method
-- ----------------------------
DROP TABLE IF EXISTS `xx_payment_method`;
CREATE TABLE `xx_payment_method` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `content` longtext,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `method` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_payment_shipping_method
-- ----------------------------
DROP TABLE IF EXISTS `xx_payment_shipping_method`;
CREATE TABLE `xx_payment_shipping_method` (
  `payment_methods` bigint(20) NOT NULL,
  `shipping_methods` bigint(20) NOT NULL,
  PRIMARY KEY (`payment_methods`,`shipping_methods`),
  KEY `FKC230A01A85883714` (`shipping_methods`),
  KEY `FKC230A01AA2ED13BC` (`payment_methods`),
  CONSTRAINT `FKC230A01A85883714` FOREIGN KEY (`shipping_methods`) REFERENCES `xx_shipping_method` (`id`),
  CONSTRAINT `FKC230A01AA2ED13BC` FOREIGN KEY (`payment_methods`) REFERENCES `xx_payment_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_plugin_config
-- ----------------------------
DROP TABLE IF EXISTS `xx_plugin_config`;
CREATE TABLE `xx_plugin_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `is_enabled` bit(1) NOT NULL,
  `plugin_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugin_id` (`plugin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_plugin_config_attribute
-- ----------------------------
DROP TABLE IF EXISTS `xx_plugin_config_attribute`;
CREATE TABLE `xx_plugin_config_attribute` (
  `plugin_config` bigint(20) NOT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`plugin_config`,`name`),
  KEY `FK42CB712CE174C3E7` (`plugin_config`),
  CONSTRAINT `FK42CB712CE174C3E7` FOREIGN KEY (`plugin_config`) REFERENCES `xx_plugin_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_product
-- ----------------------------
DROP TABLE IF EXISTS `xx_product`;
CREATE TABLE `xx_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `allocated_stock` int(11) NOT NULL,
  `attribute_value0` varchar(255) DEFAULT NULL,
  `attribute_value1` varchar(255) DEFAULT NULL,
  `attribute_value10` varchar(255) DEFAULT NULL,
  `attribute_value11` varchar(255) DEFAULT NULL,
  `attribute_value12` varchar(255) DEFAULT NULL,
  `attribute_value13` varchar(255) DEFAULT NULL,
  `attribute_value14` varchar(255) DEFAULT NULL,
  `attribute_value15` varchar(255) DEFAULT NULL,
  `attribute_value16` varchar(255) DEFAULT NULL,
  `attribute_value17` varchar(255) DEFAULT NULL,
  `attribute_value18` varchar(255) DEFAULT NULL,
  `attribute_value19` varchar(255) DEFAULT NULL,
  `attribute_value2` varchar(255) DEFAULT NULL,
  `attribute_value3` varchar(255) DEFAULT NULL,
  `attribute_value4` varchar(255) DEFAULT NULL,
  `attribute_value5` varchar(255) DEFAULT NULL,
  `attribute_value6` varchar(255) DEFAULT NULL,
  `attribute_value7` varchar(255) DEFAULT NULL,
  `attribute_value8` varchar(255) DEFAULT NULL,
  `attribute_value9` varchar(255) DEFAULT NULL,
  `cost` decimal(21,6) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `hits` bigint(20) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `introduction` longtext,
  `is_gift` bit(1) NOT NULL,
  `is_list` bit(1) NOT NULL,
  `is_marketable` bit(1) NOT NULL,
  `is_top` bit(1) NOT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `market_price` decimal(21,6) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `month_hits` bigint(20) NOT NULL,
  `month_hits_date` datetime NOT NULL,
  `month_sales` bigint(20) NOT NULL,
  `month_sales_date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `point` bigint(20) NOT NULL,
  `price` decimal(21,6) NOT NULL,
  `sales` bigint(20) NOT NULL,
  `score` float NOT NULL,
  `score_count` bigint(20) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `sn` varchar(100) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_memo` varchar(255) DEFAULT NULL,
  `total_score` bigint(20) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `week_hits` bigint(20) NOT NULL,
  `week_hits_date` datetime NOT NULL,
  `week_sales` bigint(20) NOT NULL,
  `week_sales_date` datetime NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `brand` bigint(20) DEFAULT NULL,
  `goods` bigint(20) NOT NULL,
  `product_category` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FK7C9E82B0D7629117` (`product_category`),
  KEY `FK7C9E82B0FB212D68` (`goods`),
  KEY `FK7C9E82B0FA9695CA` (`brand`),
  CONSTRAINT `FK7C9E82B0D7629117` FOREIGN KEY (`product_category`) REFERENCES `xx_product_category` (`id`),
  CONSTRAINT `FK7C9E82B0FA9695CA` FOREIGN KEY (`brand`) REFERENCES `xx_brand` (`id`),
  CONSTRAINT `FK7C9E82B0FB212D68` FOREIGN KEY (`goods`) REFERENCES `xx_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_product_category
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_category`;
CREATE TABLE `xx_product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `tree_path` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1B7971ADFBDD5B73` (`parent`),
  CONSTRAINT `FK1B7971ADFBDD5B73` FOREIGN KEY (`parent`) REFERENCES `xx_product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_product_category_brand
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_category_brand`;
CREATE TABLE `xx_product_category_brand` (
  `product_categories` bigint(20) NOT NULL,
  `brands` bigint(20) NOT NULL,
  PRIMARY KEY (`product_categories`,`brands`),
  KEY `FKE42D6A75A2AB700F` (`brands`),
  KEY `FKE42D6A758C4C0635` (`product_categories`),
  CONSTRAINT `FKE42D6A758C4C0635` FOREIGN KEY (`product_categories`) REFERENCES `xx_product_category` (`id`),
  CONSTRAINT `FKE42D6A75A2AB700F` FOREIGN KEY (`brands`) REFERENCES `xx_brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_product_member_price
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_member_price`;
CREATE TABLE `xx_product_member_price` (
  `product` bigint(20) NOT NULL,
  `member_price` decimal(19,2) DEFAULT NULL,
  `member_price_key` bigint(20) NOT NULL,
  PRIMARY KEY (`product`,`member_price_key`),
  KEY `FKDCCD88935CCD83AE` (`member_price_key`),
  KEY `FKDCCD889379F8D99A` (`product`),
  CONSTRAINT `FKDCCD88935CCD83AE` FOREIGN KEY (`member_price_key`) REFERENCES `xx_member_rank` (`id`),
  CONSTRAINT `FKDCCD889379F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_product_notify
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_notify`;
CREATE TABLE `xx_product_notify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `has_sent` bit(1) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  `product` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDCB1ABB87C62EDF8` (`member`),
  KEY `FKDCB1ABB879F8D99A` (`product`),
  CONSTRAINT `FKDCB1ABB879F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FKDCB1ABB87C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_product_parameter_value
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_parameter_value`;
CREATE TABLE `xx_product_parameter_value` (
  `product` bigint(20) NOT NULL,
  `parameter_value` varchar(255) DEFAULT NULL,
  `parameter_value_key` bigint(20) NOT NULL,
  PRIMARY KEY (`product`,`parameter_value_key`),
  KEY `FK1B76FDCCEDA221E0` (`parameter_value_key`),
  KEY `FK1B76FDCC79F8D99A` (`product`),
  CONSTRAINT `FK1B76FDCC79F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK1B76FDCCEDA221E0` FOREIGN KEY (`parameter_value_key`) REFERENCES `xx_parameter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_product_product_image
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_product_image`;
CREATE TABLE `xx_product_product_image` (
  `product` bigint(20) NOT NULL,
  `large` varchar(255) DEFAULT NULL,
  `medium` varchar(255) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  KEY `FK66470ABC79F8D99A` (`product`),
  CONSTRAINT `FK66470ABC79F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_product_specification
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_specification`;
CREATE TABLE `xx_product_specification` (
  `products` bigint(20) NOT NULL,
  `specifications` bigint(20) NOT NULL,
  PRIMARY KEY (`products`,`specifications`),
  KEY `FK622421B45096DE0F` (`products`),
  KEY `FK622421B4840DA38F` (`specifications`),
  CONSTRAINT `FK622421B45096DE0F` FOREIGN KEY (`products`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK622421B4840DA38F` FOREIGN KEY (`specifications`) REFERENCES `xx_specification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_product_specification_value
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_specification_value`;
CREATE TABLE `xx_product_specification_value` (
  `products` bigint(20) NOT NULL,
  `specification_values` bigint(20) NOT NULL,
  PRIMARY KEY (`products`,`specification_values`),
  KEY `FKBF71FF265096DE0F` (`products`),
  KEY `FKBF71FF2677BD1CD0` (`specification_values`),
  CONSTRAINT `FKBF71FF265096DE0F` FOREIGN KEY (`products`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FKBF71FF2677BD1CD0` FOREIGN KEY (`specification_values`) REFERENCES `xx_specification_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_product_tag
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_tag`;
CREATE TABLE `xx_product_tag` (
  `products` bigint(20) NOT NULL,
  `tags` bigint(20) NOT NULL,
  PRIMARY KEY (`products`,`tags`),
  KEY `FK2F6A998B5096DE0F` (`products`),
  KEY `FK2F6A998BC842716F` (`tags`),
  CONSTRAINT `FK2F6A998B5096DE0F` FOREIGN KEY (`products`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK2F6A998BC842716F` FOREIGN KEY (`tags`) REFERENCES `xx_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_promotion
-- ----------------------------
DROP TABLE IF EXISTS `xx_promotion`;
CREATE TABLE `xx_promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `introduction` longtext,
  `is_coupon_allowed` bit(1) NOT NULL,
  `is_free_shipping` bit(1) NOT NULL,
  `maximum_price` decimal(21,6) DEFAULT NULL,
  `maximum_quantity` int(11) DEFAULT NULL,
  `minimum_price` decimal(21,6) DEFAULT NULL,
  `minimum_quantity` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `point_expression` varchar(255) DEFAULT NULL,
  `price_expression` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_promotion_brand
-- ----------------------------
DROP TABLE IF EXISTS `xx_promotion_brand`;
CREATE TABLE `xx_promotion_brand` (
  `promotions` bigint(20) NOT NULL,
  `brands` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`brands`),
  KEY `FKBD21C9ACA2AB700F` (`brands`),
  KEY `FKBD21C9AC682BD58F` (`promotions`),
  CONSTRAINT `FKBD21C9AC682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`),
  CONSTRAINT `FKBD21C9ACA2AB700F` FOREIGN KEY (`brands`) REFERENCES `xx_brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_promotion_coupon
-- ----------------------------
DROP TABLE IF EXISTS `xx_promotion_coupon`;
CREATE TABLE `xx_promotion_coupon` (
  `promotions` bigint(20) NOT NULL,
  `coupons` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`coupons`),
  KEY `FKE8AB1EA1E538DDF7` (`coupons`),
  KEY `FKE8AB1EA1682BD58F` (`promotions`),
  CONSTRAINT `FKE8AB1EA1682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`),
  CONSTRAINT `FKE8AB1EA1E538DDF7` FOREIGN KEY (`coupons`) REFERENCES `xx_coupon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_promotion_member_rank
-- ----------------------------
DROP TABLE IF EXISTS `xx_promotion_member_rank`;
CREATE TABLE `xx_promotion_member_rank` (
  `promotions` bigint(20) NOT NULL,
  `member_ranks` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`member_ranks`),
  KEY `FKFF359916E24D908C` (`member_ranks`),
  KEY `FKFF359916682BD58F` (`promotions`),
  CONSTRAINT `FKFF359916682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`),
  CONSTRAINT `FKFF359916E24D908C` FOREIGN KEY (`member_ranks`) REFERENCES `xx_member_rank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_promotion_product
-- ----------------------------
DROP TABLE IF EXISTS `xx_promotion_product`;
CREATE TABLE `xx_promotion_product` (
  `promotions` bigint(20) NOT NULL,
  `products` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`products`),
  KEY `FKE12E55D45096DE0F` (`products`),
  KEY `FKE12E55D4682BD58F` (`promotions`),
  CONSTRAINT `FKE12E55D45096DE0F` FOREIGN KEY (`products`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FKE12E55D4682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_promotion_product_category
-- ----------------------------
DROP TABLE IF EXISTS `xx_promotion_product_category`;
CREATE TABLE `xx_promotion_product_category` (
  `promotions` bigint(20) NOT NULL,
  `product_categories` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`product_categories`),
  KEY `FK4A5AE7098C4C0635` (`product_categories`),
  KEY `FK4A5AE709682BD58F` (`promotions`),
  CONSTRAINT `FK4A5AE709682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`),
  CONSTRAINT `FK4A5AE7098C4C0635` FOREIGN KEY (`product_categories`) REFERENCES `xx_product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_receiver
-- ----------------------------
DROP TABLE IF EXISTS `xx_receiver`;
CREATE TABLE `xx_receiver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `consignee` varchar(255) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `area` bigint(20) DEFAULT NULL,
  `member` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK22D1EC4E39A0DADE` (`area`),
  KEY `FK22D1EC4E7C62EDF8` (`member`),
  CONSTRAINT `FK22D1EC4E39A0DADE` FOREIGN KEY (`area`) REFERENCES `xx_area` (`id`),
  CONSTRAINT `FK22D1EC4E7C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_refunds
-- ----------------------------
DROP TABLE IF EXISTS `xx_refunds`;
CREATE TABLE `xx_refunds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `amount` decimal(21,6) NOT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `method` int(11) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `payee` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `sn` varchar(100) NOT NULL,
  `orders` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FKCFC4C5BCB992E8EF` (`orders`),
  CONSTRAINT `FKCFC4C5BCB992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_returns
-- ----------------------------
DROP TABLE IF EXISTS `xx_returns`;
CREATE TABLE `xx_returns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `delivery_corp` varchar(255) DEFAULT NULL,
  `freight` decimal(21,6) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `operator` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `shipper` varchar(255) NOT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `sn` varchar(100) NOT NULL,
  `tracking_no` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) NOT NULL,
  `orders` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FKD08A1F04B992E8EF` (`orders`),
  CONSTRAINT `FKD08A1F04B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_returns_item
-- ----------------------------
DROP TABLE IF EXISTS `xx_returns_item`;
CREATE TABLE `xx_returns_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sn` varchar(255) NOT NULL,
  `returns` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE830D76E21D01242` (`returns`),
  CONSTRAINT `FKE830D76E21D01242` FOREIGN KEY (`returns`) REFERENCES `xx_returns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_review
-- ----------------------------
DROP TABLE IF EXISTS `xx_review`;
CREATE TABLE `xx_review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `is_show` bit(1) NOT NULL,
  `score` int(11) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  `product` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9B6005777C62EDF8` (`member`),
  KEY `FK9B60057779F8D99A` (`product`),
  CONSTRAINT `FK9B60057779F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK9B6005777C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_role
-- ----------------------------
DROP TABLE IF EXISTS `xx_role`;
CREATE TABLE `xx_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_system` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `xx_role_authority`;
CREATE TABLE `xx_role_authority` (
  `role` bigint(20) NOT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  KEY `FKE06165D939B03AB0` (`role`),
  CONSTRAINT `FKE06165D939B03AB0` FOREIGN KEY (`role`) REFERENCES `xx_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_seo
-- ----------------------------
DROP TABLE IF EXISTS `xx_seo`;
CREATE TABLE `xx_seo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_shipping
-- ----------------------------
DROP TABLE IF EXISTS `xx_shipping`;
CREATE TABLE `xx_shipping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `consignee` varchar(255) NOT NULL,
  `delivery_corp` varchar(255) NOT NULL,
  `delivery_corp_code` varchar(255) DEFAULT NULL,
  `delivery_corp_url` varchar(255) DEFAULT NULL,
  `freight` decimal(21,6) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `operator` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `sn` varchar(100) NOT NULL,
  `tracking_no` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) NOT NULL,
  `orders` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FK3440E00DB992E8EF` (`orders`),
  CONSTRAINT `FK3440E00DB992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_shipping_item
-- ----------------------------
DROP TABLE IF EXISTS `xx_shipping_item`;
CREATE TABLE `xx_shipping_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sn` varchar(255) NOT NULL,
  `shipping` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCCE65405FF407320` (`shipping`),
  CONSTRAINT `FKCCE65405FF407320` FOREIGN KEY (`shipping`) REFERENCES `xx_shipping` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_shipping_method
-- ----------------------------
DROP TABLE IF EXISTS `xx_shipping_method`;
CREATE TABLE `xx_shipping_method` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `continue_price` decimal(21,6) NOT NULL,
  `continue_weight` int(11) NOT NULL,
  `description` longtext,
  `first_price` decimal(21,6) NOT NULL,
  `first_weight` int(11) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `default_delivery_corp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32A8355346542319` (`default_delivery_corp`),
  CONSTRAINT `FK32A8355346542319` FOREIGN KEY (`default_delivery_corp`) REFERENCES `xx_delivery_corp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_sn
-- ----------------------------
DROP TABLE IF EXISTS `xx_sn`;
CREATE TABLE `xx_sn` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `last_value` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_specification
-- ----------------------------
DROP TABLE IF EXISTS `xx_specification`;
CREATE TABLE `xx_specification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_specification_value
-- ----------------------------
DROP TABLE IF EXISTS `xx_specification_value`;
CREATE TABLE `xx_specification_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `specification` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5E624376629A04C2` (`specification`),
  CONSTRAINT `FK5E624376629A04C2` FOREIGN KEY (`specification`) REFERENCES `xx_specification` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_tag
-- ----------------------------
DROP TABLE IF EXISTS `xx_tag`;
CREATE TABLE `xx_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
