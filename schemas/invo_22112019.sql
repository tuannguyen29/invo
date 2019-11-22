/*
 Navicat Premium Data Transfer

 Source Server         : wamp
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : invo

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 22/11/2019 10:51:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for companies
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES (1, 'Acme', '31566564', 'Address', 'Hello');
INSERT INTO `companies` VALUES (2, 'Acme Inc', '+44 564612345', 'Guildhall, PO Box 270, London', 'London');
INSERT INTO `companies` VALUES (3, 'tuannguyen29', '123456789', '153 ', 'hcm');
INSERT INTO `companies` VALUES (4, 'zxc', '12345656456', '153 ', 'new you');
INSERT INTO `companies` VALUES (5, 'tuannguyen29', '12345656456', '153 ', 'new you 2');
INSERT INTO `companies` VALUES (6, 'tuannguyen29', '12345656456', '153 ', 'new you');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES (1, 'tuannguyen29', 'tuannguyen@gmail.com', '123', '2019-11-20 10:36:16');

-- ----------------------------
-- Table structure for product_types
-- ----------------------------
DROP TABLE IF EXISTS `product_types`;
CREATE TABLE `product_types`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_types
-- ----------------------------
INSERT INTO `product_types` VALUES (5, 'Vegetables');
INSERT INTO `product_types` VALUES (6, 'Fruits');
INSERT INTO `product_types` VALUES (7, 'jean');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_types_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(16, 2) NOT NULL,
  `active` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 5, 'Artichoke', 10.50, 'Y');
INSERT INTO `products` VALUES (2, 5, 'Bell pepper', 10.40, 'Y');
INSERT INTO `products` VALUES (3, 5, 'Cauliflower', 20.10, 'Y');
INSERT INTO `products` VALUES (4, 5, 'Chinese cabbage', 15.50, 'Y');
INSERT INTO `products` VALUES (5, 5, 'Malabar spinach', 7.50, 'Y');
INSERT INTO `products` VALUES (6, 5, 'Onion', 3.50, 'Y');
INSERT INTO `products` VALUES (7, 5, 'Peanut', 4.50, 'Y');
INSERT INTO `products` VALUES (8, 6, '123', 123.00, NULL);

-- ----------------------------
-- Table structure for session_data
-- ----------------------------
DROP TABLE IF EXISTS `session_data`;
CREATE TABLE `session_data`  (
  `session_id` varchar(35) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  `modified_at` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`session_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of session_data
-- ----------------------------
INSERT INTO `session_data` VALUES ('uesac8v28vegjo3rlu34v5m9ko', 'SecurityPlugin|a:1:{s:3:\"acl\";O:26:\"Phalcon\\Acl\\Adapter\\Memory\":15:{s:17:\"\0*\0_eventsManager\";N;s:17:\"\0*\0_defaultAccess\";i:0;s:17:\"\0*\0_accessGranted\";i:1;s:14:\"\0*\0_activeRole\";s:5:\"Users\";s:18:\"\0*\0_activeResource\";s:5:\"users\";s:16:\"\0*\0_activeAccess\";s:5:\"index\";s:14:\"\0*\0_rolesNames\";a:2:{s:5:\"Users\";b:1;s:6:\"Guests\";b:1;}s:9:\"\0*\0_roles\";a:2:{i:0;O:16:\"Phalcon\\Acl\\Role\":2:{s:8:\"\0*\0_name\";s:5:\"Users\";s:15:\"\0*\0_description\";s:41:\"Member privileges, granted after sign in.\";}i:1;O:16:\"Phalcon\\Acl\\Role\":2:{s:8:\"\0*\0_name\";s:6:\"Guests\";s:15:\"\0*\0_description\";s:76:\"Anyone browsing the site who is not signed in is considered to be a \"Guest\".\";}}s:18:\"\0*\0_resourcesNames\";a:12:{s:1:\"*\";b:1;s:9:\"companies\";b:1;s:8:\"products\";b:1;s:12:\"producttypes\";b:1;s:8:\"invoices\";b:1;s:5:\"users\";b:1;s:5:\"index\";b:1;s:5:\"about\";b:1;s:8:\"register\";b:1;s:6:\"errors\";b:1;s:7:\"session\";b:1;s:7:\"contact\";b:1;}s:13:\"\0*\0_resources\";a:11:{i:0;O:20:\"Phalcon\\Acl\\Resource\":2:{s:8:\"\0*\0_name\";s:9:\"companies\";s:15:\"\0*\0_description\";N;}i:1;O:20:\"Phalcon\\Acl\\Resource\":2:{s:8:\"\0*\0_name\";s:8:\"products\";s:15:\"\0*\0_description\";N;}i:2;O:20:\"Phalcon\\Acl\\Resource\":2:{s:8:\"\0*\0_name\";s:12:\"producttypes\";s:15:\"\0*\0_description\";N;}i:3;O:20:\"Phalcon\\Acl\\Resource\":2:{s:8:\"\0*\0_name\";s:8:\"invoices\";s:15:\"\0*\0_description\";N;}i:4;O:20:\"Phalcon\\Acl\\Resource\":2:{s:8:\"\0*\0_name\";s:5:\"users\";s:15:\"\0*\0_description\";N;}i:5;O:20:\"Phalcon\\Acl\\Resource\":2:{s:8:\"\0*\0_name\";s:5:\"index\";s:15:\"\0*\0_description\";N;}i:6;O:20:\"Phalcon\\Acl\\Resource\":2:{s:8:\"\0*\0_name\";s:5:\"about\";s:15:\"\0*\0_description\";N;}i:7;O:20:\"Phalcon\\Acl\\Resource\":2:{s:8:\"\0*\0_name\";s:8:\"register\";s:15:\"\0*\0_description\";N;}i:8;O:20:\"Phalcon\\Acl\\Resource\":2:{s:8:\"\0*\0_name\";s:6:\"errors\";s:15:\"\0*\0_description\";N;}i:9;O:20:\"Phalcon\\Acl\\Resource\":2:{s:8:\"\0*\0_name\";s:7:\"session\";s:15:\"\0*\0_description\";N;}i:10;O:20:\"Phalcon\\Acl\\Resource\":2:{s:8:\"\0*\0_name\";s:7:\"contact\";s:15:\"\0*\0_description\";N;}}s:10:\"\0*\0_access\";a:54:{s:17:\"Users!index!index\";i:1;s:17:\"Users!about!index\";i:1;s:18:\"Users!about!create\";i:1;s:20:\"Users!register!index\";i:1;s:20:\"Users!errors!show401\";i:1;s:20:\"Users!errors!show404\";i:1;s:20:\"Users!errors!show500\";i:1;s:19:\"Users!session!index\";i:1;s:22:\"Users!session!register\";i:1;s:19:\"Users!session!start\";i:1;s:17:\"Users!session!end\";i:1;s:19:\"Users!contact!index\";i:1;s:18:\"Users!contact!send\";i:1;s:18:\"Guests!index!index\";i:1;s:18:\"Guests!about!index\";i:1;s:19:\"Guests!about!create\";i:1;s:21:\"Guests!register!index\";i:1;s:21:\"Guests!errors!show401\";i:1;s:21:\"Guests!errors!show404\";i:1;s:21:\"Guests!errors!show500\";i:1;s:20:\"Guests!session!index\";i:1;s:23:\"Guests!session!register\";i:1;s:20:\"Guests!session!start\";i:1;s:18:\"Guests!session!end\";i:1;s:20:\"Guests!contact!index\";i:1;s:19:\"Guests!contact!send\";i:1;s:21:\"Users!companies!index\";i:1;s:22:\"Users!companies!search\";i:1;s:19:\"Users!companies!new\";i:1;s:20:\"Users!companies!edit\";i:1;s:20:\"Users!companies!save\";i:1;s:22:\"Users!companies!create\";i:1;s:22:\"Users!companies!delete\";i:1;s:20:\"Users!products!index\";i:1;s:21:\"Users!products!search\";i:1;s:18:\"Users!products!new\";i:1;s:19:\"Users!products!edit\";i:1;s:19:\"Users!products!save\";i:1;s:21:\"Users!products!create\";i:1;s:21:\"Users!products!delete\";i:1;s:24:\"Users!producttypes!index\";i:1;s:25:\"Users!producttypes!search\";i:1;s:22:\"Users!producttypes!new\";i:1;s:23:\"Users!producttypes!edit\";i:1;s:23:\"Users!producttypes!save\";i:1;s:25:\"Users!producttypes!create\";i:1;s:25:\"Users!producttypes!delete\";i:1;s:20:\"Users!invoices!index\";i:1;s:22:\"Users!invoices!profile\";i:1;s:17:\"Users!users!index\";i:1;s:16:\"Users!users!edit\";i:1;s:15:\"Users!users!new\";i:1;s:17:\"Users!users!store\";i:1;s:18:\"Users!users!update\";i:1;}s:16:\"\0*\0_roleInherits\";N;s:14:\"\0*\0_accessList\";a:42:{s:3:\"*!*\";b:1;s:15:\"companies!index\";b:1;s:16:\"companies!search\";b:1;s:13:\"companies!new\";b:1;s:14:\"companies!edit\";b:1;s:14:\"companies!save\";b:1;s:16:\"companies!create\";b:1;s:16:\"companies!delete\";b:1;s:14:\"products!index\";b:1;s:15:\"products!search\";b:1;s:12:\"products!new\";b:1;s:13:\"products!edit\";b:1;s:13:\"products!save\";b:1;s:15:\"products!create\";b:1;s:15:\"products!delete\";b:1;s:18:\"producttypes!index\";b:1;s:19:\"producttypes!search\";b:1;s:16:\"producttypes!new\";b:1;s:17:\"producttypes!edit\";b:1;s:17:\"producttypes!save\";b:1;s:19:\"producttypes!create\";b:1;s:19:\"producttypes!delete\";b:1;s:14:\"invoices!index\";b:1;s:16:\"invoices!profile\";b:1;s:11:\"users!index\";b:1;s:10:\"users!edit\";b:1;s:9:\"users!new\";b:1;s:11:\"users!store\";b:1;s:12:\"users!update\";b:1;s:11:\"index!index\";b:1;s:11:\"about!index\";b:1;s:12:\"about!create\";b:1;s:14:\"register!index\";b:1;s:14:\"errors!show401\";b:1;s:14:\"errors!show404\";b:1;s:14:\"errors!show500\";b:1;s:13:\"session!index\";b:1;s:16:\"session!register\";b:1;s:13:\"session!start\";b:1;s:11:\"session!end\";b:1;s:13:\"contact!index\";b:1;s:12:\"contact!send\";b:1;}s:8:\"\0*\0_func\";N;s:28:\"\0*\0_noArgumentsDefaultAction\";i:1;}}auth|a:2:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:14:\"Phalcon Demo 2\";}', 1574393504, 1574394692);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` char(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `active` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'demo', 'c0bd96dc7ea4ec56741a4e07f6ce98012814d853', 'Phalcon Demo 2', 'demo@phalconphp.com', '2012-04-11 03:53:03', 'Y');
INSERT INTO `users` VALUES (2, 'tuannguyen29', '7c222fb2927d828af22f592134e8932480637c0d', 'tuannguyen29', 'tuannguyen@gmail.com', '2019-11-20 10:44:26', 'Y');
INSERT INTO `users` VALUES (3, 'tuannguyen', '7c222fb2927d828af22f592134e8932480637c0d', 'tuannguyen', 'tuannguyen29@gmail.com', '2019-11-21 11:14:12', 'Y');
INSERT INTO `users` VALUES (4, 'tuannguyen299', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'tuannguyen29', 'tieucaca102@gmail.com', '2019-11-22 09:32:43', 'Y');
INSERT INTO `users` VALUES (5, 'tuannguyen29s', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'tuannguyen292', 'tuannguyen22@gmail.com', '2019-11-22 09:39:58', 'Y');

SET FOREIGN_KEY_CHECKS = 1;
