/*
 Navicat Premium Data Transfer

 Source Server         : a
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : petshop

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 10/06/2023 00:45:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `brand_id` int(0) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`brand_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, '981-2729 Lorem Avenue', 'At Ltd', NULL, 'aliquet.libero@gmail.com', '015432163', NULL, b'0');
INSERT INTO `brands` VALUES (2, '314-3297 Quis Rd.', 'Dui Cum Corporation', NULL, 'elit.erat.vitae@gmail.com', '0123456788', '2023-05-31 00:00:00', b'0');
INSERT INTO `brands` VALUES (3, 'Ap #127-2999 Ligula. Road', 'Vehicula Pellentesque Tincidunt Foundation', NULL, 'ac.risus@gmail.com', '084475914', NULL, b'0');
INSERT INTO `brands` VALUES (4, '662 Magnis Street', 'Quisque Varius Consulting', NULL, 'hymenaeos@gmail.com', '038835666', NULL, b'0');
INSERT INTO `brands` VALUES (5, '320-1695 Praesent Rd.', 'Hymenaeos Mauris Institute', NULL, 'sem.consequat@gmail.com', '052941517', NULL, b'0');
INSERT INTO `brands` VALUES (6, 'P.O. Box 979, 8613 Donec St.', 'Egestas A Scelerisque Limited', NULL, 'feugiat.lorem@gmail.com', '037213858', NULL, b'0');
INSERT INTO `brands` VALUES (7, '362-2705 Risus. St.', 'Aenean Gravida Corporation', NULL, 'blandit.enim.consequat@gmail.com', '081223816', NULL, b'0');
INSERT INTO `brands` VALUES (8, 'P.O. Box 807, 5076 Aliquet. Rd.', 'Aliquam Auctor Industries', NULL, 'sagittis.semper@gmail.com', '047256537', NULL, b'0');
INSERT INTO `brands` VALUES (9, 'Ap #152-8843 Magnis Ave', 'Sem Consequat Corp.', NULL, 'nascetur.ridiculus.mus@gmail.com', '021217163', NULL, b'0');
INSERT INTO `brands` VALUES (10, 'Ap #243-1063 Eu Street', 'Id Ante Institute', NULL, 'cursus.nunc@gmail.com', '036258056', NULL, b'0');
INSERT INTO `brands` VALUES (12, 'adsfasdfadsf ', 'abcadfadsf', '2023-05-31 00:00:00', 'adf@adfva.com', '0974484610', '2023-05-31 00:00:00', b'0');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cart_id` int(0) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `customer_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `FKthomi9k8igwd9gl6bemi5nyw0`(`customer_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, '2023-05-27 00:00:00', '2023-05-27 00:00:00', 1);

-- ----------------------------
-- Table structure for cart_detail
-- ----------------------------
DROP TABLE IF EXISTS `cart_detail`;
CREATE TABLE `cart_detail`  (
  `created_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `quantity` int(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `cart_id` int(0) NOT NULL,
  `product_id` int(0) NOT NULL,
  PRIMARY KEY (`cart_id`, `product_id`) USING BTREE,
  INDEX `cart_id`(`cart_id`, `product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_detail
-- ----------------------------
INSERT INTO `cart_detail` VALUES ('2023-05-28 20:55:12', 1, '2023-05-28 20:55:12', 1, 2);
INSERT INTO `cart_detail` VALUES ('2023-05-28 20:54:35', 1, '2023-05-28 20:54:35', 1, 3);
INSERT INTO `cart_detail` VALUES ('2023-06-01 02:04:13', 1, '2023-06-01 02:04:13', 1, 54);
INSERT INTO `cart_detail` VALUES ('2023-05-28 23:39:35', 1, '2023-05-28 23:39:35', 1, 67);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `category_id` int(0) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Food', '2023-05-04 00:00:00', '2023-05-04 00:00:00', b'0');
INSERT INTO `categories` VALUES (2, 'Tool', '2023-05-04 00:00:00', '2023-05-04 00:00:00', b'0');
INSERT INTO `categories` VALUES (3, 'Clothes', '2023-05-04 00:00:00', '2023-06-06 22:59:58', b'0');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `customer_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `date_of_birth` date NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role_id` bigint(0) NULL DEFAULT NULL,
  `is_deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`customer_id`) USING BTREE,
  INDEX `FK89jfsosdyhk1mq30vbpau1mtd`(`role_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (1, 'adfaddd', '2023-05-04 00:00:00', NULL, 'adf@gmail.vn', 'MALE', 'sad', '$2a$10$8onXqDHN.4CvWXXXvWP5bumM8RZfCqZ.GjyJyN5uNLwPINcFrbq0m', '41245', '2023-05-31 01:14:42', 'abcdef@gmail.com', 1, b'0');
INSERT INTO `customers` VALUES (2, 'Ap #578-2740 At Road', NULL, '1999-12-14', 'commodo.hendrerit@gmail.com', 'MALE', 'Zeph Miranda', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '021430712', '2023-05-29 09:16:21', 'ultricies', 3, b'0');
INSERT INTO `customers` VALUES (3, 'Ap #298-1148 Lorem Ave', NULL, '1999-04-29', 'praesent@gmail.com', 'MALE', 'Renee Figueroa', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '038697021', '2023-05-29 09:16:21', 'metus.', 3, b'0');
INSERT INTO `customers` VALUES (4, '2969 Parturient St.', NULL, '2005-02-09', 'consectetuer.cursus@gmail.com', 'FEMALE', 'Myles Roberson', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '007854541', '2023-05-29 09:16:21', 'natoque', 3, b'0');
INSERT INTO `customers` VALUES (5, '927-6545 Sem Av.', NULL, '1995-01-31', 'tortor.at@gmail.com', 'FEMALE', 'Branden Spears', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '084486103', '2023-05-29 09:16:21', 'Nam', 3, b'0');
INSERT INTO `customers` VALUES (6, '893-7149 Eu Rd.', NULL, '1994-06-04', 'mollis.lectus@gmail.com', 'MALE', 'Callum Townsend', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '001242273', '2023-05-29 09:16:21', 'nisi', 3, b'0');
INSERT INTO `customers` VALUES (7, '637-5187 Dapibus St.', NULL, '1998-01-22', 'nunc@gmail.com', 'MALE', 'Owen Sawyer', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '032971377', '2023-05-29 09:16:21', 'pede', 3, b'0');
INSERT INTO `customers` VALUES (8, 'Ap #853-6492 Magna St.', NULL, '2002-07-01', 'augue.eu@gmail.com', 'FEMALE', 'Willow Carr', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '085630961', '2023-05-29 09:16:21', 'tempus', 3, b'0');
INSERT INTO `customers` VALUES (9, 'P.O. Box 496, 9444 Orci. St.', NULL, '1994-06-22', 'libero@gmail.com', 'FEMALE', 'Lyle Fitzgerald', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '014245238', '2023-05-29 09:16:21', 'tempor', 3, b'0');
INSERT INTO `customers` VALUES (10, 'P.O. Box 793, 3613 Duis Rd.', NULL, '1999-08-12', 'arcu.curabitur@gmail.com', 'MALE', 'Malachi Ruiz', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '010444140', '2023-05-29 09:16:21', 'nunc', 3, b'0');
INSERT INTO `customers` VALUES (11, 'P.O. Box 123, 9771 Mollis Avenue', NULL, '1993-05-15', 'quisque.tincidunt@gmail.com', 'MALE', 'Lester Raymond', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '035364148', '2023-05-29 09:16:21', 'suscipit', 3, b'0');
INSERT INTO `customers` VALUES (12, 'Ap #671-1884 Nullam St.', NULL, '1992-05-18', 'elementum.sem@gmail.com', 'FEMALE', 'Neil Summers', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '002668654', '2023-05-29 09:16:21', 'vel', 3, b'0');
INSERT INTO `customers` VALUES (13, 'Ap #637-3194 Interdum Avenue', NULL, '2005-03-23', 'nulla.facilisi@gmail.com', 'FEMALE', 'Len Coleman', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '078854732', '2023-05-29 09:16:21', 'porttitor', 3, b'0');
INSERT INTO `customers` VALUES (14, 'Ap #107-1287 Nunc Av.', NULL, '2000-01-03', 'id.nunc.interdum@gmail.com', 'MALE', 'Mara Burns', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '008254774', '2023-05-29 09:16:21', 'elit,', 3, b'0');
INSERT INTO `customers` VALUES (15, '496-2132 Adipiscing Street', NULL, '1997-02-03', 'est@gmail.com', 'MALE', 'Damian Gay', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '067508725', '2023-05-29 09:16:21', 'nisl', 3, b'0');
INSERT INTO `customers` VALUES (16, 'Ap #951-2266 Mauris St.', NULL, '2003-07-12', 'feugiat.nec@gmail.com', 'FEMALE', 'Constance Calderon', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '032639149', '2023-05-29 09:16:21', 'velit', 3, b'0');
INSERT INTO `customers` VALUES (17, '413-7342 Eleifend Road', NULL, '1999-05-31', 'rutrum.lorem@gmail.com', 'FEMALE', 'Harlan Morse', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '077937712', '2023-05-29 09:16:21', 'Vestibulum', 3, b'0');
INSERT INTO `customers` VALUES (18, '297-4834 Sagittis Street', NULL, '1996-12-13', 'dignissim.lacus.aliquam@gmail.com', 'MALE', 'Troy Whitney', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '084533813', '2023-05-29 09:16:21', 'gravida', 3, b'0');
INSERT INTO `customers` VALUES (19, 'P.O. Box 168, 7990 Nunc Avenue', NULL, '2002-11-18', 'amet.metus@gmail.com', 'MALE', 'Keane Rojas', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '071584437', '2023-05-29 09:16:21', 'tempus', 3, b'0');
INSERT INTO `customers` VALUES (20, '618-6659 Vestibulum Rd.', NULL, '1999-01-09', 'adipiscing@gmail.com', 'FEMALE', 'Anastasia Love', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '077351937', '2023-05-29 09:16:21', 'rutrum,', 3, b'0');
INSERT INTO `customers` VALUES (21, 'Ap #638-9415 Dolor Street', NULL, '2004-10-04', 'cursus.et@gmail.com', 'FEMALE', 'Mara Mercado', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '036820991', '2023-05-29 09:16:21', 'consequat', 3, b'0');
INSERT INTO `customers` VALUES (22, 'P.O. Box 137, 7646 Dolor. Rd.', NULL, '1993-11-04', 'vestibulum.lorem@gmail.com', 'MALE', 'Sasha Beck', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '056833554', '2023-05-29 09:16:21', 'a,', 3, b'0');
INSERT INTO `customers` VALUES (23, '342-1994 Lobortis, Road', NULL, '1997-11-04', 'dictum.eleifend@gmail.com', 'MALE', 'Mara Macias', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '065423557', '2023-05-29 09:16:21', 'non', 3, b'0');
INSERT INTO `customers` VALUES (24, '970-2128 Metus. Ave', NULL, '2003-09-10', 'volutpat.nunc@gmail.com', 'FEMALE', 'Kevin Olson', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '016325758', '2023-05-29 09:16:21', 'quis', 3, b'0');
INSERT INTO `customers` VALUES (25, 'Ap #171-6963 Consequat St.', NULL, '1996-09-20', 'montes.nascetur.ridiculus@gmail.com', 'FEMALE', 'Graham Crawford', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '093144182', '2023-05-29 09:16:21', 'augue', 3, b'0');
INSERT INTO `customers` VALUES (26, '8215 Blandit Avenue', NULL, '1998-09-10', 'pede.nec.ante@gmail.com', 'MALE', 'Aidan Whitley', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '014191127', '2023-05-29 09:16:21', 'Sed', 3, b'0');
INSERT INTO `customers` VALUES (27, 'P.O. Box 296, 113 Vitae Av.', NULL, '1995-07-31', 'sapien.aenean@gmail.com', 'MALE', 'Breanna Chavez', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '088556177', '2023-05-29 09:16:21', 'ornare', 3, b'0');
INSERT INTO `customers` VALUES (28, '3888 Faucibus Avenue', NULL, '2000-01-24', 'eu@gmail.com', 'FEMALE', 'Uriah Green', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '061728125', '2023-05-29 09:16:21', 'rhoncus.', 3, b'0');
INSERT INTO `customers` VALUES (29, '208-6287 Turpis. Ave', NULL, '2002-08-27', 'nibh@gmail.com', 'FEMALE', 'Lesley Kline', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '037869045', '2023-05-29 09:16:21', 'sit', 3, b'0');
INSERT INTO `customers` VALUES (30, '539-7402 Consectetuer Street', NULL, '1996-02-25', 'lacus.nulla@gmail.com', 'MALE', 'Rafael Jefferson', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '053115168', '2023-05-29 09:16:21', 'parturient', 3, b'0');
INSERT INTO `customers` VALUES (31, 'P.O. Box 532, 6694 Non, Road', NULL, '1994-11-10', 'ullamcorper.duis.cursus@gmail.com', 'MALE', 'Jasmine Monroe', '$2a$12$gpkUsgCi9QrJcMsJGoYM.uFg12Jul4VKScN3JIWGLS4j3Ixv6RaAC', '046155721', '2023-05-29 09:16:21', 'vitae', 3, b'0');
INSERT INTO `customers` VALUES (32, NULL, '2023-05-29 00:00:00', '2023-05-17', 'dafavadf  frqef q', NULL, 'abc', '$2a$10$.bgJUn3UG32VmmFcJDG9tOM3w.2QDUK5VBEiboNijSYPhXMCciU.O', '0974484610', '2023-05-29 00:00:00', 'adsfadff', 3, b'0');
INSERT INTO `customers` VALUES (33, NULL, '2023-05-29 00:00:00', '2023-05-05', 'adfadf', NULL, 'adfa', '$2a$10$XpG4DSUtFgm9P.Gqct2EBeEXgtm9D1ZhPrvhzFypbc/WRER7Qk7Ui', '0974484610', '2023-05-29 00:00:00', 'adfadf', 1, b'0');
INSERT INTO `customers` VALUES (34, NULL, '2023-05-29 00:00:00', NULL, '', NULL, '', '$2a$10$3llNijepQDyF294sVQq.lexBGBJ39lV/aM94KipZt8hUz86Pu1l4K', '', '2023-05-29 00:00:00', 'adsfadff', 1, b'0');
INSERT INTO `customers` VALUES (35, NULL, '2023-05-29 00:00:00', NULL, '', NULL, '', '$2a$10$Z5gAaegOdZMbWbpWM1L6UuqJC4gUAoCSoOqcqXdeBV3qeWnVn2mn.', '', '2023-05-29 00:00:00', '', 1, b'0');
INSERT INTO `customers` VALUES (36, NULL, '2023-05-29 00:00:00', NULL, '', NULL, '', '$2a$10$8f.o7RAGWqVDNZABfrOIx.xWXGCgT9EiQLDLRIPtxq6s2G7V5IzJe', '', '2023-05-29 00:00:00', '', 1, b'0');
INSERT INTO `customers` VALUES (37, NULL, '2023-05-29 00:00:00', NULL, '', NULL, '', '$2a$10$Z0vo0vEptwU.JvaUQZK.JehQ7wx38LlnVYngU6FjsnVOEwvXA12uC', '', '2023-05-29 00:00:00', '', 1, b'0');
INSERT INTO `customers` VALUES (38, NULL, '2023-05-29 00:00:00', NULL, '', NULL, '', '$2a$10$4gvQ5WIDBZENxhMfuZtUVu84.EbusX2TqvbIaf4o6UjLYfY.GWLaG', '', '2023-05-29 00:00:00', '', 1, b'0');
INSERT INTO `customers` VALUES (39, NULL, '2023-05-29 00:00:00', NULL, '', NULL, '', '$2a$10$YsYOtvdr/BmiyeTd7Ut5p.fBD4JUpow6V8lAzafJDtCWKEu8WkO7i', '', '2023-05-29 00:00:00', '', 1, b'0');
INSERT INTO `customers` VALUES (51, NULL, '2023-06-08 00:00:00', NULL, 'abcdefg@gmail.com', 'FEMALE', NULL, '$2a$10$Dpo9J.9LbLHzpqsf0H0p5eyELrMuVSsRn7LgKePulGSV8/kQ4QfQG', NULL, '2023-06-08 00:00:00', 'abcdefg@gmail.com', 3, b'0');

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `created_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `quantity` int(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `order_id` int(0) NOT NULL,
  `product_id` int(0) NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES ('2023-05-28 19:58:08', 2, '2023-05-28 19:58:08', 1, 2);
INSERT INTO `order_details` VALUES ('2023-05-28 19:58:08', 1, '2023-05-28 19:58:08', 1, 3);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 7, '2023-06-09 20:25:34', 4, 42);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 1, '2023-06-09 20:25:34', 5, 37);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 4, '2023-06-09 20:25:34', 6, 19);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 1, '2023-06-09 20:25:34', 6, 99);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 8, '2023-06-09 20:25:34', 7, 25);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 8, '2023-06-09 20:25:34', 7, 96);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 8, '2023-06-09 20:25:34', 9, 78);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 4, '2023-06-09 20:25:34', 10, 35);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 2, '2023-06-09 20:25:34', 10, 44);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 5, '2023-06-09 20:25:34', 10, 92);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 1, '2023-06-09 20:25:34', 11, 65);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 2, '2023-06-09 20:25:34', 11, 80);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 8, '2023-06-09 20:25:34', 12, 67);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 9, '2023-06-09 20:25:34', 12, 86);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 8, '2023-06-09 20:25:34', 13, 82);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 1, '2023-06-09 20:25:34', 14, 44);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 9, '2023-06-09 20:25:34', 15, 62);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 8, '2023-06-09 20:25:34', 16, 52);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 7, '2023-06-09 20:25:34', 17, 16);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 8, '2023-06-09 20:25:34', 18, 72);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 3, '2023-06-09 20:25:34', 20, 20);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 9, '2023-06-09 20:25:34', 22, 42);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 3, '2023-06-09 20:25:34', 22, 87);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 7, '2023-06-09 20:25:34', 23, 86);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 2, '2023-06-09 20:25:34', 23, 97);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 5, '2023-06-09 20:25:34', 24, 26);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 2, '2023-06-09 20:25:34', 25, 33);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 2, '2023-06-09 20:25:34', 28, 32);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 8, '2023-06-09 20:25:34', 28, 40);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 5, '2023-06-09 20:25:34', 30, 79);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 6, '2023-06-09 20:25:34', 34, 5);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 6, '2023-06-09 20:25:34', 34, 25);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 4, '2023-06-09 20:25:34', 34, 51);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 4, '2023-06-09 20:25:34', 34, 58);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 10, '2023-06-09 20:25:34', 35, 66);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 8, '2023-06-09 20:25:34', 36, 56);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 7, '2023-06-09 20:25:34', 36, 99);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 1, '2023-06-09 20:25:34', 39, 5);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 6, '2023-06-09 20:25:34', 39, 30);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 2, '2023-06-09 20:25:34', 39, 98);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 4, '2023-06-09 20:25:34', 39, 100);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 7, '2023-06-09 20:25:34', 42, 71);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 10, '2023-06-09 20:25:34', 45, 51);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 8, '2023-06-09 20:25:34', 46, 67);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 2, '2023-06-09 20:25:34', 47, 89);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 1, '2023-06-09 20:25:34', 47, 92);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 6, '2023-06-09 20:25:34', 47, 96);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 5, '2023-06-09 20:25:34', 48, 3);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 2, '2023-06-09 20:25:34', 48, 12);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 4, '2023-06-09 20:25:34', 49, 55);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 10, '2023-06-09 20:25:34', 52, 21);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 10, '2023-06-09 20:25:34', 52, 73);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 7, '2023-06-09 20:25:34', 52, 83);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 2, '2023-06-09 20:25:34', 52, 94);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 1, '2023-06-09 20:25:34', 54, 63);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 5, '2023-06-09 20:25:34', 63, 50);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 7, '2023-06-09 20:25:34', 63, 87);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 8, '2023-06-09 20:25:34', 64, 28);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 1, '2023-06-09 20:25:34', 70, 18);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 3, '2023-06-09 20:25:34', 71, 84);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 7, '2023-06-09 20:25:34', 75, 32);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 2, '2023-06-09 20:25:34', 76, 95);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 9, '2023-06-09 20:25:34', 77, 43);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 3, '2023-06-09 20:25:34', 78, 24);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 3, '2023-06-09 20:25:34', 83, 50);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 5, '2023-06-09 20:25:34', 83, 74);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 7, '2023-06-09 20:25:34', 83, 84);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 5, '2023-06-09 20:25:34', 85, 65);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 5, '2023-06-09 20:25:34', 85, 67);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 5, '2023-06-09 20:25:34', 85, 80);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 9, '2023-06-09 20:25:34', 86, 60);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 3, '2023-06-09 20:25:34', 86, 68);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 3, '2023-06-09 20:25:34', 86, 97);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 5, '2023-06-09 20:25:34', 87, 36);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 6, '2023-06-09 20:25:34', 88, 25);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 2, '2023-06-09 20:25:34', 92, 97);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 5, '2023-06-09 20:25:34', 93, 48);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 10, '2023-06-09 20:25:34', 95, 47);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 2, '2023-06-09 20:25:34', 100, 9);
INSERT INTO `order_details` VALUES ('2023-06-09 20:25:34', 6, '2023-06-09 20:25:34', 100, 75);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int(0) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `customer_id` bigint(0) NULL DEFAULT NULL,
  `is_deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `FKn0nawuptqdsb5vtjilh4bug43`(`customer_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '2023-05-28 00:00:00', '2023-05-28 00:00:00', 1, b'0');
INSERT INTO `orders` VALUES (2, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 32, b'1');
INSERT INTO `orders` VALUES (3, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 31, b'1');
INSERT INTO `orders` VALUES (4, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 28, b'1');
INSERT INTO `orders` VALUES (5, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 9, b'1');
INSERT INTO `orders` VALUES (6, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 13, b'1');
INSERT INTO `orders` VALUES (7, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 21, b'1');
INSERT INTO `orders` VALUES (8, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 8, b'1');
INSERT INTO `orders` VALUES (9, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 2, b'1');
INSERT INTO `orders` VALUES (10, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 13, b'1');
INSERT INTO `orders` VALUES (11, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 4, b'1');
INSERT INTO `orders` VALUES (12, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 11, b'1');
INSERT INTO `orders` VALUES (13, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 11, b'1');
INSERT INTO `orders` VALUES (14, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 15, b'1');
INSERT INTO `orders` VALUES (15, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 27, b'1');
INSERT INTO `orders` VALUES (16, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 5, b'1');
INSERT INTO `orders` VALUES (17, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 5, b'1');
INSERT INTO `orders` VALUES (18, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 14, b'1');
INSERT INTO `orders` VALUES (19, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 27, b'1');
INSERT INTO `orders` VALUES (20, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 32, b'1');
INSERT INTO `orders` VALUES (21, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 21, b'1');
INSERT INTO `orders` VALUES (22, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 32, b'1');
INSERT INTO `orders` VALUES (23, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 4, b'1');
INSERT INTO `orders` VALUES (24, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 3, b'1');
INSERT INTO `orders` VALUES (25, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 35, b'1');
INSERT INTO `orders` VALUES (26, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 3, b'1');
INSERT INTO `orders` VALUES (27, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 37, b'1');
INSERT INTO `orders` VALUES (28, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 12, b'1');
INSERT INTO `orders` VALUES (29, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 32, b'1');
INSERT INTO `orders` VALUES (30, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 17, b'1');
INSERT INTO `orders` VALUES (31, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 38, b'1');
INSERT INTO `orders` VALUES (32, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 37, b'1');
INSERT INTO `orders` VALUES (33, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 19, b'1');
INSERT INTO `orders` VALUES (34, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 20, b'1');
INSERT INTO `orders` VALUES (35, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 6, b'1');
INSERT INTO `orders` VALUES (36, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 13, b'1');
INSERT INTO `orders` VALUES (37, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 4, b'1');
INSERT INTO `orders` VALUES (38, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 18, b'1');
INSERT INTO `orders` VALUES (39, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 12, b'1');
INSERT INTO `orders` VALUES (40, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 10, b'1');
INSERT INTO `orders` VALUES (41, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 19, b'1');
INSERT INTO `orders` VALUES (42, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 39, b'1');
INSERT INTO `orders` VALUES (43, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 2, b'1');
INSERT INTO `orders` VALUES (44, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 12, b'1');
INSERT INTO `orders` VALUES (45, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 7, b'1');
INSERT INTO `orders` VALUES (46, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 2, b'1');
INSERT INTO `orders` VALUES (47, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 15, b'1');
INSERT INTO `orders` VALUES (48, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 30, b'1');
INSERT INTO `orders` VALUES (49, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 30, b'1');
INSERT INTO `orders` VALUES (50, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 28, b'1');
INSERT INTO `orders` VALUES (51, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 32, b'1');
INSERT INTO `orders` VALUES (52, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 30, b'1');
INSERT INTO `orders` VALUES (53, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 6, b'1');
INSERT INTO `orders` VALUES (54, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 36, b'1');
INSERT INTO `orders` VALUES (55, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 10, b'1');
INSERT INTO `orders` VALUES (56, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 22, b'1');
INSERT INTO `orders` VALUES (57, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 22, b'1');
INSERT INTO `orders` VALUES (58, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 29, b'1');
INSERT INTO `orders` VALUES (59, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 22, b'1');
INSERT INTO `orders` VALUES (60, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 22, b'1');
INSERT INTO `orders` VALUES (61, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 18, b'1');
INSERT INTO `orders` VALUES (62, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 4, b'1');
INSERT INTO `orders` VALUES (63, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 7, b'1');
INSERT INTO `orders` VALUES (64, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 18, b'1');
INSERT INTO `orders` VALUES (65, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 19, b'1');
INSERT INTO `orders` VALUES (66, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 16, b'1');
INSERT INTO `orders` VALUES (67, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 7, b'1');
INSERT INTO `orders` VALUES (68, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 13, b'1');
INSERT INTO `orders` VALUES (69, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 16, b'1');
INSERT INTO `orders` VALUES (70, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 4, b'1');
INSERT INTO `orders` VALUES (71, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 4, b'1');
INSERT INTO `orders` VALUES (72, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 33, b'1');
INSERT INTO `orders` VALUES (73, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 4, b'1');
INSERT INTO `orders` VALUES (74, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 15, b'1');
INSERT INTO `orders` VALUES (75, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 11, b'1');
INSERT INTO `orders` VALUES (76, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 5, b'1');
INSERT INTO `orders` VALUES (77, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 21, b'1');
INSERT INTO `orders` VALUES (78, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 22, b'1');
INSERT INTO `orders` VALUES (79, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 7, b'1');
INSERT INTO `orders` VALUES (80, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 26, b'1');
INSERT INTO `orders` VALUES (81, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 24, b'1');
INSERT INTO `orders` VALUES (82, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 11, b'1');
INSERT INTO `orders` VALUES (83, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 8, b'1');
INSERT INTO `orders` VALUES (84, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 9, b'1');
INSERT INTO `orders` VALUES (85, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 5, b'1');
INSERT INTO `orders` VALUES (86, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 4, b'1');
INSERT INTO `orders` VALUES (87, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 11, b'1');
INSERT INTO `orders` VALUES (88, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 34, b'1');
INSERT INTO `orders` VALUES (89, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 28, b'1');
INSERT INTO `orders` VALUES (90, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 14, b'1');
INSERT INTO `orders` VALUES (91, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 28, b'1');
INSERT INTO `orders` VALUES (92, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 6, b'1');
INSERT INTO `orders` VALUES (93, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 24, b'1');
INSERT INTO `orders` VALUES (94, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 17, b'1');
INSERT INTO `orders` VALUES (95, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 22, b'1');
INSERT INTO `orders` VALUES (96, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 12, b'1');
INSERT INTO `orders` VALUES (97, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 35, b'1');
INSERT INTO `orders` VALUES (98, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 10, b'1');
INSERT INTO `orders` VALUES (99, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 4, b'1');
INSERT INTO `orders` VALUES (100, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 1, b'1');
INSERT INTO `orders` VALUES (101, '2023-06-09 20:22:46', '2023-06-09 20:22:46', 34, b'1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(0) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `product_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `unit_in_stock` int(0) NULL DEFAULT NULL,
  `thumbnail_url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `brand_id` int(0) NULL DEFAULT NULL,
  `category_id` int(0) NULL DEFAULT NULL,
  `is_deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `FK108t60ni9yo75kmymqpxew8cy`(`brand_id`) USING BTREE,
  INDEX `FKhni6wbnrv2eeq69kme5u6p9i7`(`category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, NULL, 'tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus', 'Lobortis Augue Foundation', 100000, 1, '1.png', '2023-06-09 20:38:21', 1, 1, b'0');
INSERT INTO `product` VALUES (2, NULL, 'ligula. Nullam feugiat placerat velit. Quisque varius. Nam', 'Mollis Lectus Ltd', 80000, 12, '1.png', '2023-06-09 20:38:21', 1, 1, b'0');
INSERT INTO `product` VALUES (3, NULL, 'Sed congue, elit sed', 'Est Ac Mattis Inc.', 30000, 3, '1.png', '2023-06-09 20:38:21', 1, 2, b'0');
INSERT INTO `product` VALUES (4, NULL, 'parturient montes,', 'Arcu Vestibulum Ante Ltd', 10000, 7, '1.png', '2023-06-09 20:38:21', 1, 2, b'0');
INSERT INTO `product` VALUES (5, NULL, 'ipsum. Curabitur', 'Consectetuer Mauris Institute', 60000, 14, '1.png', '2023-06-09 20:38:21', 1, 3, b'0');
INSERT INTO `product` VALUES (6, NULL, 'In condimentum. Donec at arcu.', 'Nec Mollis Vitae Corp.', 80000, 2, '1.png', '2023-06-09 20:38:21', 1, 3, b'0');
INSERT INTO `product` VALUES (7, NULL, 'commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque', 'Fringilla Purus Mauris Incorporated', 50000, 16, '1.png', '2023-06-09 20:38:21', 1, 1, b'0');
INSERT INTO `product` VALUES (8, NULL, 'non, cursus non, egestas a, dui.', 'Orci Quis Lectus Inc.', 30000, 4, '1.png', '2023-06-09 20:38:21', 1, 1, b'0');
INSERT INTO `product` VALUES (9, NULL, 'eu nulla at sem molestie sodales. Mauris blandit enim', 'Cras Sed Limited', 30000, 15, '1.png', '2023-06-09 20:38:21', 1, 2, b'0');
INSERT INTO `product` VALUES (10, NULL, 'cursus', 'Molestie LLC', 90000, 11, '1.png', '2023-06-09 20:38:21', 1, 2, b'0');
INSERT INTO `product` VALUES (11, NULL, 'In lorem. Donec elementum, lorem', 'Dignissim Maecenas Associates', 20000, 14, '1.png', '2023-06-09 20:38:21', 2, 3, b'0');
INSERT INTO `product` VALUES (12, NULL, 'augue', 'Laoreet Libero Et LLC', 60000, 17, '1.png', '2023-06-09 20:38:21', 2, 3, b'0');
INSERT INTO `product` VALUES (13, NULL, 'ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam', 'Dapibus LLP', 60000, 3, '1.png', '2023-06-09 20:38:21', 2, 1, b'0');
INSERT INTO `product` VALUES (14, NULL, 'lacinia mattis.', 'Dictum Incorporated', 20000, 18, '1.png', '2023-06-09 20:38:21', 2, 1, b'0');
INSERT INTO `product` VALUES (15, NULL, 'diam lorem,', 'Libero Industries', 40000, 2, '1.png', '2023-06-09 20:38:21', 2, 2, b'0');
INSERT INTO `product` VALUES (16, NULL, 'eget odio. Aliquam vulputate', 'Libero Est Industries', 40000, 18, '1.png', '2023-06-09 20:38:21', 2, 2, b'0');
INSERT INTO `product` VALUES (17, NULL, 'bibendum. Donec felis orci,', 'Fusce Limited', 60000, 6, '1.png', '2023-06-09 20:38:21', 2, 3, b'0');
INSERT INTO `product` VALUES (18, NULL, 'sit amet orci. Ut sagittis lobortis mauris. Suspendisse', 'Diam Dictum Company', 30000, 1, '1.png', '2023-06-09 20:38:21', 2, 3, b'0');
INSERT INTO `product` VALUES (19, NULL, 'non enim. Mauris quis turpis', 'Sed Neque Sed Corporation', 40000, 13, '1.png', '2023-06-09 20:38:21', 2, 1, b'0');
INSERT INTO `product` VALUES (20, NULL, 'consequat auctor, nunc nulla vulputate', 'Nulla At Limited', 10000, 8, '1.png', '2023-06-09 20:38:21', 2, 1, b'0');
INSERT INTO `product` VALUES (21, NULL, 'ipsum primis in faucibus orci luctus et ultrices', 'Nullam PC', 60000, 13, '1.png', '2023-06-09 20:38:21', 3, 2, b'0');
INSERT INTO `product` VALUES (22, NULL, 'et, eros. Proin ultrices.', 'Quis Pede Institute', 20000, 17, '1.png', '2023-06-09 20:38:21', 3, 2, b'0');
INSERT INTO `product` VALUES (23, NULL, 'posuere vulputate,', 'Aenean Eget Ltd', 60000, 9, '1.png', '2023-06-09 20:38:21', 3, 3, b'0');
INSERT INTO `product` VALUES (24, NULL, 'turpis egestas.', 'Mauris Inc.', 90000, 12, '1.png', '2023-06-09 20:38:21', 3, 3, b'0');
INSERT INTO `product` VALUES (25, NULL, 'dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis', 'Orci Ut LLP', 40000, 19, '1.png', '2023-06-09 20:38:21', 3, 1, b'0');
INSERT INTO `product` VALUES (26, NULL, 'ipsum. Phasellus vitae mauris sit amet lorem semper', 'Consequat Dolor LLC', 30000, 10, '1.png', '2023-06-09 20:38:21', 3, 1, b'0');
INSERT INTO `product` VALUES (27, NULL, 'Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean', 'A Institute', 20000, 19, '1.png', '2023-06-09 20:38:21', 3, 2, b'0');
INSERT INTO `product` VALUES (28, NULL, 'magnis dis parturient montes, nascetur ridiculus', 'Velit Aliquam Incorporated', 90000, 5, '1.png', '2023-06-09 20:38:21', 3, 2, b'0');
INSERT INTO `product` VALUES (29, NULL, 'nisl sem, consequat nec, mollis vitae, posuere at,', 'Rhoncus Id LLC', 90000, 14, '1.png', '2023-06-09 20:38:21', 3, 3, b'0');
INSERT INTO `product` VALUES (30, NULL, 'Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis', 'Rhoncus Nullam Velit LLC', 30000, 19, '1.png', '2023-06-09 20:38:21', 3, 3, b'0');
INSERT INTO `product` VALUES (31, NULL, 'enim. Suspendisse aliquet, sem ut cursus', 'Imperdiet Ornare In Inc.', 80000, 3, '1.png', '2023-06-09 20:38:21', 4, 1, b'0');
INSERT INTO `product` VALUES (32, NULL, 'velit. Aliquam nisl. Nulla', 'Est Ac Facilisis Inc.', 70000, 9, '1.png', '2023-06-09 20:38:21', 4, 1, b'0');
INSERT INTO `product` VALUES (33, NULL, 'egestas nunc sed libero. Proin', 'Arcu Associates', 10000, 3, '1.png', '2023-06-09 20:38:21', 4, 2, b'0');
INSERT INTO `product` VALUES (34, NULL, 'et ultrices posuere cubilia', 'Diam Incorporated', 40000, 15, '1.png', '2023-06-09 20:38:21', 4, 2, b'0');
INSERT INTO `product` VALUES (35, NULL, 'pede.', 'Pede Ultrices Consulting', 60000, 5, '1.png', '2023-06-09 20:38:21', 4, 3, b'0');
INSERT INTO `product` VALUES (36, NULL, 'ridiculus mus. Proin vel nisl.', 'Curabitur Ut Odio LLC', 50000, 6, '1.png', '2023-06-09 20:38:21', 4, 3, b'0');
INSERT INTO `product` VALUES (37, NULL, 'hendrerit neque. In ornare sagittis felis. Donec tempor, est ac', 'Magna Corp.', 10000, 6, '1.png', '2023-06-09 20:38:21', 4, 1, b'0');
INSERT INTO `product` VALUES (38, NULL, 'magna nec quam. Curabitur vel lectus. Cum sociis natoque', 'Turpis Aliquam Adipiscing Associates', 100000, 14, '1.png', '2023-06-09 20:38:21', 4, 1, b'0');
INSERT INTO `product` VALUES (39, NULL, 'ullamcorper. Duis at', 'Ullamcorper Nisl Arcu Associates', 70000, 12, '1.png', '2023-06-09 20:38:21', 4, 2, b'0');
INSERT INTO `product` VALUES (40, NULL, 'ac, feugiat non, lobortis', 'Eu Enim Institute', 80000, 19, '1.png', '2023-06-09 20:38:21', 4, 2, b'0');
INSERT INTO `product` VALUES (41, NULL, 'natoque penatibus et', 'Tincidunt Donec Associates', 20000, 1, '1.png', '2023-06-09 20:38:21', 5, 3, b'0');
INSERT INTO `product` VALUES (42, NULL, 'turpis egestas.', 'Duis Associates', 10000, 16, '1.png', '2023-06-09 20:38:21', 5, 3, b'0');
INSERT INTO `product` VALUES (43, NULL, 'gravida. Aliquam tincidunt, nunc ac mattis ornare,', 'Sagittis Placerat Cras Corporation', 30000, 11, '1.png', '2023-06-09 20:38:21', 5, 1, b'0');
INSERT INTO `product` VALUES (44, NULL, 'est ac mattis', 'Ut Nisi A Foundation', 70000, 15, '1.png', '2023-06-09 20:38:21', 5, 1, b'0');
INSERT INTO `product` VALUES (45, NULL, 'molestie arcu. Sed eu nibh vulputate mauris sagittis placerat.', 'Molestie Sed LLC', 80000, 7, '1.png', '2023-06-09 20:38:21', 5, 2, b'0');
INSERT INTO `product` VALUES (46, NULL, 'Nulla facilisis. Suspendisse', 'Euismod Ltd', 90000, 17, '1.png', '2023-06-09 20:38:21', 5, 2, b'0');
INSERT INTO `product` VALUES (47, NULL, 'ut eros', 'Elit Industries', 10000, 14, '1.png', '2023-06-09 20:38:21', 5, 3, b'0');
INSERT INTO `product` VALUES (48, NULL, 'Proin velit. Sed malesuada augue ut', 'In Mi Ltd', 30000, 18, '1.png', '2023-06-09 20:38:21', 5, 3, b'0');
INSERT INTO `product` VALUES (49, NULL, 'lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet', 'Tellus Associates', 20000, 8, '1.png', '2023-06-09 20:38:21', 5, 1, b'0');
INSERT INTO `product` VALUES (50, NULL, 'at', 'Interdum Enim LLC', 20000, 10, '1.png', '2023-06-09 20:38:21', 5, 1, b'0');
INSERT INTO `product` VALUES (51, NULL, 'venenatis a, magna. Lorem ipsum dolor sit amet,', 'Mattis Cras Eget Ltd', 50000, 14, '1.png', '2023-06-09 20:38:21', 6, 2, b'0');
INSERT INTO `product` VALUES (52, NULL, 'arcu. Vestibulum', 'Lacinia Sed Congue Corp.', 70000, 7, '1.png', '2023-06-09 20:38:21', 6, 2, b'0');
INSERT INTO `product` VALUES (53, NULL, 'iaculis aliquet', 'Hendrerit Associates', 10000, 13, '1.png', '2023-06-09 20:38:21', 6, 3, b'0');
INSERT INTO `product` VALUES (54, NULL, 'mauris eu elit.', 'Tortor Integer Incorporated', 10000, 3, '1.png', '2023-06-09 20:38:21', 6, 3, b'0');
INSERT INTO `product` VALUES (55, NULL, 'litora torquent per conubia nostra, per inceptos hymenaeos.', 'Urna Ut Tincidunt Corporation', 60000, 10, '1.png', '2023-06-09 20:38:21', 6, 1, b'0');
INSERT INTO `product` VALUES (56, NULL, 'auctor, velit eget laoreet posuere, enim nisl', 'Velit Industries', 40000, 4, '1.png', '2023-06-09 20:38:21', 6, 1, b'0');
INSERT INTO `product` VALUES (57, NULL, 'Nunc sed', 'Nec LLC', 20000, 15, '1.png', '2023-06-09 20:38:21', 6, 2, b'0');
INSERT INTO `product` VALUES (58, NULL, 'mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada.', 'Eget Nisi Institute', 10000, 4, '1.png', '2023-06-09 20:38:21', 6, 2, b'0');
INSERT INTO `product` VALUES (59, NULL, 'odio semper cursus.', 'Ac PC', 50000, 2, '1.png', '2023-06-09 20:38:21', 6, 3, b'0');
INSERT INTO `product` VALUES (60, NULL, 'sem, vitae aliquam eros turpis non', 'Integer Mollis Integer Consulting', 70000, 9, '1.png', '2023-06-09 20:38:21', 6, 3, b'0');
INSERT INTO `product` VALUES (61, NULL, 'rutrum magna. Cras convallis', 'Integer Eu Associates', 90000, 3, '1.png', '2023-06-09 20:38:21', 7, 1, b'0');
INSERT INTO `product` VALUES (62, NULL, 'sed, est. Nunc', 'Vitae Odio LLC', 80000, 16, '1.png', '2023-06-09 20:38:21', 7, 1, b'0');
INSERT INTO `product` VALUES (63, NULL, 'vulputate, nisi sem semper erat,', 'Aenean Gravida Nunc Corporation', 50000, 11, '1.png', '2023-06-09 20:38:21', 7, 2, b'0');
INSERT INTO `product` VALUES (64, NULL, 'velit dui, semper', 'Nisi Cum PC', 80000, 2, '1.png', '2023-06-09 20:38:21', 7, 2, b'0');
INSERT INTO `product` VALUES (65, NULL, 'sed dictum eleifend, nunc risus', 'Ut Institute', 40000, 19, '1.png', '2023-06-09 20:38:21', 7, 3, b'0');
INSERT INTO `product` VALUES (66, NULL, 'nec, leo. Morbi neque tellus, imperdiet non,', 'Conubia Nostra Foundation', 50000, 15, '1.png', '2023-06-09 20:38:21', 7, 3, b'0');
INSERT INTO `product` VALUES (67, NULL, 'lacus. Nulla tincidunt, neque', 'A Ltd', 70000, 17, '1.png', '2023-06-09 20:38:21', 7, 1, b'0');
INSERT INTO `product` VALUES (68, NULL, 'odio vel est tempor', 'Semper Institute', 50000, 7, '1.png', '2023-06-09 20:38:21', 7, 1, b'0');
INSERT INTO `product` VALUES (69, NULL, 'eleifend non, dapibus', 'Lacus Aliquam Foundation', 30000, 20, '1.png', '2023-06-09 20:38:21', 7, 2, b'0');
INSERT INTO `product` VALUES (70, NULL, 'Duis cursus, diam at pretium aliquet,', 'Mauris Institute', 80000, 20, '1.png', '2023-06-09 20:38:21', 7, 2, b'0');
INSERT INTO `product` VALUES (71, NULL, 'malesuada fringilla est. Mauris eu', 'Nisi Cum Limited', 30000, 9, '1.png', '2023-06-09 20:38:21', 8, 3, b'0');
INSERT INTO `product` VALUES (72, NULL, 'augue id ante dictum cursus. Nunc mauris elit,', 'Sollicitudin Corp.', 100000, 14, '1.png', '2023-06-09 20:38:21', 8, 3, b'0');
INSERT INTO `product` VALUES (73, NULL, 'et netus et malesuada fames ac turpis egestas.', 'Aliquet Proin Inc.', 80000, 10, '1.png', '2023-06-09 20:38:21', 8, 1, b'0');
INSERT INTO `product` VALUES (74, NULL, 'Maecenas iaculis aliquet diam. Sed diam', 'Enim PC', 40000, 16, '1.png', '2023-06-09 20:38:21', 8, 1, b'0');
INSERT INTO `product` VALUES (75, NULL, 'Vivamus sit amet risus.', 'Vulputate Dui Associates', 50000, 9, '1.png', '2023-06-09 20:38:21', 8, 2, b'0');
INSERT INTO `product` VALUES (76, NULL, 'pede nec ante blandit viverra.', 'Consequat Purus PC', 100000, 4, '1.png', '2023-06-09 20:38:21', 8, 2, b'0');
INSERT INTO `product` VALUES (77, NULL, 'scelerisque dui.', 'Habitant Morbi Tristique PC', 40000, 10, '1.png', '2023-06-09 20:38:21', 8, 3, b'0');
INSERT INTO `product` VALUES (78, NULL, 'vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum.', 'Augue Ut Lacus Ltd', 70000, 4, '1.png', '2023-06-09 20:38:21', 8, 3, b'0');
INSERT INTO `product` VALUES (79, NULL, 'ipsum. Curabitur consequat, lectus sit amet', 'A Institute', 20000, 12, '1.png', '2023-06-09 20:38:21', 8, 1, b'0');
INSERT INTO `product` VALUES (80, NULL, 'auctor. Mauris vel turpis.', 'Sem Pellentesque Industries', 90000, 14, '1.png', '2023-06-09 20:38:21', 8, 1, b'0');
INSERT INTO `product` VALUES (81, NULL, 'feugiat nec, diam. Duis mi enim, condimentum', 'Dictum Foundation', 80000, 12, '1.png', '2023-06-09 20:38:21', 9, 2, b'0');
INSERT INTO `product` VALUES (82, NULL, 'rutrum,', 'Proin Corporation', 30000, 10, '1.png', '2023-06-09 20:38:21', 9, 2, b'0');
INSERT INTO `product` VALUES (83, NULL, 'Aliquam tincidunt,', 'Quis Ltd', 100000, 20, '1.png', '2023-06-09 20:38:21', 9, 3, b'0');
INSERT INTO `product` VALUES (84, NULL, 'neque et nunc. Quisque ornare', 'Molestie Associates', 30000, 17, '1.png', '2023-06-09 20:38:21', 9, 3, b'0');
INSERT INTO `product` VALUES (85, NULL, 'dictum. Proin eget', 'Nec Company', 30000, 18, '1.png', '2023-06-09 20:38:21', 9, 1, b'0');
INSERT INTO `product` VALUES (86, NULL, 'at pretium aliquet, metus urna convallis erat, eget tincidunt dui', 'Lectus Incorporated', 80000, 1, '1.png', '2023-06-09 20:38:21', 9, 1, b'0');
INSERT INTO `product` VALUES (87, NULL, 'Mauris blandit enim consequat purus. Maecenas libero est,', 'Velit Dui Foundation', 30000, 6, '1.png', '2023-06-09 20:38:21', 9, 2, b'0');
INSERT INTO `product` VALUES (88, NULL, 'scelerisque dui. Suspendisse ac', 'Sed Dictum Ltd', 50000, 6, '1.png', '2023-06-09 20:38:21', 9, 2, b'0');
INSERT INTO `product` VALUES (89, NULL, 'Duis risus odio, auctor', 'Aliquam Rutrum Lorem LLP', 90000, 19, '1.png', '2023-06-09 20:38:21', 9, 3, b'0');
INSERT INTO `product` VALUES (90, NULL, 'sem', 'Sem Foundation', 90000, 14, '1.png', '2023-06-09 20:38:21', 9, 3, b'0');
INSERT INTO `product` VALUES (91, NULL, 'Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt,', 'Aenean LLP', 70000, 7, '1.png', '2023-06-09 20:38:21', 10, 1, b'0');
INSERT INTO `product` VALUES (92, NULL, 'nec, mollis vitae, posuere at, velit. Cras', 'Cras Vehicula Ltd', 30000, 2, '1.png', '2023-06-09 20:38:21', 10, 1, b'0');
INSERT INTO `product` VALUES (93, NULL, 'et malesuada fames', 'Consectetuer Ipsum Foundation', 50000, 2, '1.png', '2023-06-09 20:38:21', 10, 2, b'0');
INSERT INTO `product` VALUES (94, NULL, 'et risus.', 'Orci Incorporated', 70000, 5, '1.png', '2023-06-09 20:38:21', 10, 2, b'0');
INSERT INTO `product` VALUES (95, NULL, 'diam. Proin dolor. Nulla semper tellus', 'Enim Suspendisse Aliquet PC', 90000, 7, '1.png', '2023-06-09 20:38:21', 10, 3, b'0');
INSERT INTO `product` VALUES (96, NULL, 'ipsum. Suspendisse sagittis. Nullam vitae', 'Velit Dui Semper Incorporated', 30000, 15, '1.png', '2023-06-09 20:38:21', 10, 3, b'0');
INSERT INTO `product` VALUES (97, NULL, 'tincidunt dui augue eu', 'Cras Ltd', 60000, 3, '1.png', '2023-06-09 20:38:21', 10, 1, b'0');
INSERT INTO `product` VALUES (98, NULL, 'ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate,', 'Cubilia Curae Inc.', 50000, 6, '1.png', '2023-06-09 20:38:21', 10, 1, b'0');
INSERT INTO `product` VALUES (99, NULL, 'augue. Sed molestie.', 'Ligula Aliquam Erat Incorporated', 20000, 7, '1.png', '2023-06-09 20:38:21', 10, 2, b'0');
INSERT INTO `product` VALUES (100, NULL, 'at pede. Cras vulputate velit eu sem. Pellentesque ut', 'Cursus In Corp.', 80000, 16, '1.png', '2023-06-09 20:38:21', 10, 2, b'0');
INSERT INTO `product` VALUES (101, '2023-05-05 00:00:00', 'lacinia mattis.', 'Dictum Incorporated', 20000, 18, '1.png', '2023-06-09 20:38:21', 1, 1, b'0');
INSERT INTO `product` VALUES (104, '2023-06-08 00:00:00', 'aaaa', 'avbc', 120000, 0, NULL, '2023-06-09 20:38:21', 2, 3, b'0');
INSERT INTO `product` VALUES (105, '2023-06-08 00:00:00', 'dfsdfsd', 'test3', 120000, 0, NULL, '2023-06-09 20:38:21', 3, 3, b'0');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `product_id` int(0) NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 504 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES (1, 1, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (2, 1, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (6, 2, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (7, 2, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (8, 2, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (9, 2, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (10, 2, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (11, 3, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (12, 3, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (13, 3, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (14, 3, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (15, 3, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (16, 4, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (17, 4, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (18, 4, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (19, 4, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (20, 4, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (21, 5, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (22, 5, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (23, 5, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (24, 5, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (25, 5, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (26, 6, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (27, 6, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (28, 6, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (29, 6, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (30, 6, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (31, 7, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (32, 7, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (33, 7, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (34, 7, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (35, 7, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (36, 8, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (37, 8, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (38, 8, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (39, 8, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (40, 8, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (41, 9, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (42, 9, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (43, 9, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (44, 9, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (45, 9, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (46, 10, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (47, 10, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (48, 10, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (49, 10, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (50, 10, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (51, 11, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (52, 11, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (53, 11, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (54, 11, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (55, 11, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (56, 12, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (57, 12, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (58, 12, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (59, 12, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (60, 12, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (61, 13, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (62, 13, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (63, 13, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (64, 13, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (65, 13, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (66, 14, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (67, 14, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (68, 14, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (69, 14, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (70, 14, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (71, 15, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (72, 15, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (73, 15, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (74, 15, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (75, 15, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (76, 16, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (77, 16, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (78, 16, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (79, 16, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (80, 16, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (81, 17, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (82, 17, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (83, 17, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (84, 17, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (85, 17, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (86, 18, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (87, 18, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (88, 18, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (89, 18, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (90, 18, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (91, 19, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (92, 19, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (93, 19, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (94, 19, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (95, 19, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (96, 20, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (97, 20, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (98, 20, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (99, 20, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (100, 20, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (101, 21, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (102, 21, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (103, 21, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (104, 21, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (105, 21, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (106, 22, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (107, 22, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (108, 22, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (109, 22, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (110, 22, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (111, 23, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (112, 23, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (113, 23, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (114, 23, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (115, 23, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (116, 24, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (117, 24, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (118, 24, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (119, 24, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (120, 24, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (121, 25, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (122, 25, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (123, 25, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (124, 25, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (125, 25, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (126, 26, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (127, 26, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (128, 26, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (129, 26, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (130, 26, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (131, 27, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (132, 27, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (133, 27, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (134, 27, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (135, 27, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (136, 28, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (137, 28, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (138, 28, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (139, 28, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (140, 28, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (141, 29, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (142, 29, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (143, 29, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (144, 29, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (145, 29, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (146, 30, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (147, 30, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (148, 30, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (149, 30, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (150, 30, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (151, 31, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (152, 31, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (153, 31, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (154, 31, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (155, 31, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (156, 32, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (157, 32, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (158, 32, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (159, 32, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (160, 32, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (161, 33, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (162, 33, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (163, 33, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (164, 33, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (165, 33, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (166, 34, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (167, 34, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (168, 34, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (169, 34, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (170, 34, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (171, 35, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (172, 35, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (173, 35, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (174, 35, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (175, 35, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (176, 36, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (177, 36, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (178, 36, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (179, 36, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (180, 36, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (181, 37, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (182, 37, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (183, 37, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (184, 37, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (185, 37, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (186, 38, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (187, 38, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (188, 38, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (189, 38, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (190, 38, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (191, 39, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (192, 39, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (193, 39, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (194, 39, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (195, 39, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (196, 40, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (197, 40, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (198, 40, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (199, 40, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (200, 40, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (201, 41, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (202, 41, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (203, 41, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (204, 41, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (205, 41, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (206, 42, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (207, 42, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (208, 42, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (209, 42, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (210, 42, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (211, 43, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (212, 43, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (213, 43, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (214, 43, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (215, 43, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (216, 44, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (217, 44, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (218, 44, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (219, 44, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (220, 44, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (221, 45, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (222, 45, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (223, 45, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (224, 45, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (225, 45, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (226, 46, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (227, 46, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (228, 46, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (229, 46, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (230, 46, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (231, 47, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (232, 47, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (233, 47, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (234, 47, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (235, 47, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (236, 48, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (237, 48, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (238, 48, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (239, 48, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (240, 48, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (241, 49, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (242, 49, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (243, 49, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (244, 49, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (245, 49, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (246, 50, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (247, 50, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (248, 50, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (249, 50, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (250, 50, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (251, 51, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (252, 51, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (253, 51, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (254, 51, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (255, 51, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (256, 52, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (257, 52, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (258, 52, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (259, 52, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (260, 52, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (261, 53, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (262, 53, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (263, 53, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (264, 53, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (265, 53, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (266, 54, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (267, 54, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (268, 54, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (269, 54, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (270, 54, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (271, 55, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (272, 55, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (273, 55, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (274, 55, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (275, 55, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (276, 56, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (277, 56, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (278, 56, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (279, 56, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (280, 56, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (281, 57, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (282, 57, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (283, 57, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (284, 57, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (285, 57, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (286, 58, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (287, 58, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (288, 58, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (289, 58, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (290, 58, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (291, 59, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (292, 59, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (293, 59, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (294, 59, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (295, 59, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (296, 60, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (297, 60, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (298, 60, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (299, 60, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (300, 60, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (301, 61, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (302, 61, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (303, 61, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (304, 61, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (305, 61, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (306, 62, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (307, 62, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (308, 62, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (309, 62, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (310, 62, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (311, 63, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (312, 63, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (313, 63, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (314, 63, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (315, 63, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (316, 64, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (317, 64, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (318, 64, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (319, 64, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (320, 64, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (321, 65, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (322, 65, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (323, 65, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (324, 65, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (325, 65, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (326, 66, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (327, 66, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (328, 66, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (329, 66, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (330, 66, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (331, 67, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (332, 67, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (333, 67, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (334, 67, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (335, 67, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (336, 68, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (337, 68, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (338, 68, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (339, 68, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (340, 68, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (341, 69, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (342, 69, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (343, 69, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (344, 69, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (345, 69, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (346, 70, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (347, 70, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (348, 70, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (349, 70, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (350, 70, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (351, 71, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (352, 71, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (353, 71, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (354, 71, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (355, 71, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (356, 72, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (357, 72, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (358, 72, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (359, 72, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (360, 72, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (361, 73, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (362, 73, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (363, 73, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (364, 73, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (365, 73, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (366, 74, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (367, 74, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (368, 74, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (369, 74, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (370, 74, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (371, 75, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (372, 75, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (373, 75, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (374, 75, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (375, 75, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (376, 76, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (377, 76, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (378, 76, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (379, 76, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (380, 76, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (381, 77, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (382, 77, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (383, 77, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (384, 77, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (385, 77, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (386, 78, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (387, 78, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (388, 78, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (389, 78, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (390, 78, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (391, 79, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (392, 79, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (393, 79, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (394, 79, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (395, 79, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (396, 80, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (397, 80, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (398, 80, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (399, 80, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (400, 80, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (401, 81, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (402, 81, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (403, 81, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (404, 81, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (405, 81, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (406, 82, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (407, 82, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (408, 82, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (409, 82, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (410, 82, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (411, 83, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (412, 83, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (413, 83, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (414, 83, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (415, 83, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (416, 84, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (417, 84, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (418, 84, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (419, 84, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (420, 84, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (421, 85, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (422, 85, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (423, 85, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (424, 85, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (425, 85, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (426, 86, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (427, 86, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (428, 86, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (429, 86, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (430, 86, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (431, 87, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (432, 87, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (433, 87, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (434, 87, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (435, 87, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (436, 88, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (437, 88, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (438, 88, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (439, 88, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (440, 88, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (441, 89, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (442, 89, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (443, 89, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (444, 89, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (445, 89, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (446, 90, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (447, 90, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (448, 90, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (449, 90, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (450, 90, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (451, 91, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (452, 91, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (453, 91, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (454, 91, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (455, 91, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (456, 92, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (457, 92, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (458, 92, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (459, 92, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (460, 92, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (461, 93, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (462, 93, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (463, 93, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (464, 93, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (465, 93, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (466, 94, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (467, 94, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (468, 94, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (469, 94, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (470, 94, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (471, 95, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (472, 95, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (473, 95, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (474, 95, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (475, 95, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (476, 96, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (477, 96, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (478, 96, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (479, 96, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (480, 96, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (481, 97, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (482, 97, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (483, 97, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (484, 97, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (485, 97, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (486, 98, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (487, 98, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (488, 98, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (489, 98, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (490, 98, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (491, 99, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (492, 99, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (493, 99, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (494, 99, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (495, 99, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (496, 100, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (497, 100, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (498, 100, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (499, 100, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (500, 100, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (501, 104, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (502, 105, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);
INSERT INTO `product_image` VALUES (503, 1, 'https://drive.google.com/uc?export=view&id=1CdNmuQENVybjhMAB_jP9sVA9bfRrl3Ss', NULL);

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `review_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `customer_id` int(0) NULL DEFAULT NULL,
  `product_id` int(0) NULL DEFAULT NULL,
  `rate` int(0) NULL DEFAULT NULL,
  `comment` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date_created` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `date_modified` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`review_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES (1, 1, 1, 5, 'Great!', '2023-05-25 23:03:29', NULL, b'0');
INSERT INTO `reviews` VALUES (2, 2, 1, 4, 'Tuyệt vời', '2023-05-25 23:03:31', '2023-05-25 23:03:50', b'0');
INSERT INTO `reviews` VALUES (3, 3, 1, 1, 'Dở', '2023-05-25 23:04:00', NULL, b'1');
INSERT INTO `reviews` VALUES (4, 1, 54, 4, 'Hữu ích', '2023-06-10 00:41:55', '2023-06-10 00:41:55', b'0');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '2023-05-04 00:00:00', 'Admin', '2023-05-04 00:00:00', b'0');
INSERT INTO `roles` VALUES (2, '2023-05-04 00:00:00', 'Staff', '2023-05-04 00:00:00', b'0');
INSERT INTO `roles` VALUES (3, '2023-05-04 00:00:00', 'Customer', '2023-05-04 00:00:00', b'0');

-- ----------------------------
-- Procedure structure for doWhile
-- ----------------------------
DROP PROCEDURE IF EXISTS `doWhile`;
delimiter ;;
CREATE PROCEDURE `doWhile`()
BEGIN
DECLARE i INT DEFAULT 1; 
WHILE (i <= 100) DO
    insert into product_image(product_id,url) values (i,'1.png'),(i,'2.png'),(i,'3.png'),(i,'4.png'),(i,'5.png');
    SET i = i+1;
END WHILE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for merchant_shop_insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `merchant_shop_insert`;
delimiter ;;
CREATE PROCEDURE `merchant_shop_insert`()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i < 100 DO
  insert into product_image (product_id,url) values (i,'1.png'),(i,'2.png'),(i,'3.png'),(i,'4.png'),(i,'5.png');
  SET i = i + 1;
  END WHILE;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
