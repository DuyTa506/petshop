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

 Date: 05/05/2023 03:22:35
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
  `created_date` date NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_date` date NULL DEFAULT NULL,
  `is_deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`brand_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, '981-2729 Lorem Avenue', 'At Ltd', NULL, 'aliquet.libero@gmail.com', '015432163', NULL, b'0');
INSERT INTO `brands` VALUES (2, '314-3297 Quis Rd.', 'Dui Cum Corporation', NULL, 'elit.erat.vitae@gmail.com', '056394207', NULL, b'0');
INSERT INTO `brands` VALUES (3, 'Ap #127-2999 Ligula. Road', 'Vehicula Pellentesque Tincidunt Foundation', NULL, 'ac.risus@gmail.com', '084475914', NULL, b'0');
INSERT INTO `brands` VALUES (4, '662 Magnis Street', 'Quisque Varius Consulting', NULL, 'hymenaeos@gmail.com', '038835666', NULL, b'0');
INSERT INTO `brands` VALUES (5, '320-1695 Praesent Rd.', 'Hymenaeos Mauris Institute', NULL, 'sem.consequat@gmail.com', '052941517', NULL, b'0');
INSERT INTO `brands` VALUES (6, 'P.O. Box 979, 8613 Donec St.', 'Egestas A Scelerisque Limited', NULL, 'feugiat.lorem@gmail.com', '037213858', NULL, b'0');
INSERT INTO `brands` VALUES (7, '362-2705 Risus. St.', 'Aenean Gravida Corporation', NULL, 'blandit.enim.consequat@gmail.com', '081223816', NULL, b'0');
INSERT INTO `brands` VALUES (8, 'P.O. Box 807, 5076 Aliquet. Rd.', 'Aliquam Auctor Industries', NULL, 'sagittis.semper@gmail.com', '047256537', NULL, b'0');
INSERT INTO `brands` VALUES (9, 'Ap #152-8843 Magnis Ave', 'Sem Consequat Corp.', NULL, 'nascetur.ridiculus.mus@gmail.com', '021217163', NULL, b'0');
INSERT INTO `brands` VALUES (10, 'Ap #243-1063 Eu Street', 'Id Ante Institute', NULL, 'cursus.nunc@gmail.com', '036258056', NULL, b'0');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cart_id` int(0) NOT NULL AUTO_INCREMENT,
  `created_date` date NULL DEFAULT NULL,
  `updated_date` date NULL DEFAULT NULL,
  `customer_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `FKthomi9k8igwd9gl6bemi5nyw0`(`customer_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for cart_detail
-- ----------------------------
DROP TABLE IF EXISTS `cart_detail`;
CREATE TABLE `cart_detail`  (
  `created_date` date NULL DEFAULT NULL,
  `quantity` int(0) NULL DEFAULT NULL,
  `updated_date` date NULL DEFAULT NULL,
  `cart_id` int(0) NOT NULL,
  `product_id` int(0) NOT NULL,
  PRIMARY KEY (`cart_id`, `product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `category_id` int(0) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `updated_date` date NULL DEFAULT NULL,
  `is_deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Food', '2023-05-04', '2023-05-04', b'0');
INSERT INTO `categories` VALUES (2, 'Tool', '2023-05-04', '2023-05-04', b'0');
INSERT INTO `categories` VALUES (3, 'Clothes', '2023-05-04', '2023-05-04', b'0');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `customer_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_date` date NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role_id` bigint(0) NULL DEFAULT NULL,
  `is_deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE,
  INDEX `FK89jfsosdyhk1mq30vbpau1mtd`(`role_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (1, 'adfad', '2023-05-04', '2023-05-04', 'adf', 'MALE', 'sad', '$2a$12$OaIzzPzMIoiXKElIraSfzOPZMIhGtRceZEoJP59H4KVeXH15KxTG.', '123', '2023-05-04', 'abv', 1, b'0');
INSERT INTO `customers` VALUES (2, 'Ap #578-2740 At Road', NULL, '1999-12-14', 'commodo.hendrerit@gmail.com', 'MALE', 'Zeph Miranda', 'Pyeongtaek', '021430712', NULL, 'ultricies', NULL, b'0');
INSERT INTO `customers` VALUES (3, 'Ap #298-1148 Lorem Ave', NULL, '1999-04-29', 'praesent@gmail.com', 'MALE', 'Renee Figueroa', 'Meridian', '038697021', NULL, 'metus.', NULL, b'0');
INSERT INTO `customers` VALUES (4, '2969 Parturient St.', NULL, '2005-02-09', 'consectetuer.cursus@gmail.com', 'FEMALE', 'Myles Roberson', 'Ferness', '007854541', NULL, 'natoque', NULL, b'0');
INSERT INTO `customers` VALUES (5, '927-6545 Sem Av.', NULL, '1995-01-31', 'tortor.at@gmail.com', 'FEMALE', 'Branden Spears', 'Falun', '084486103', NULL, 'Nam', NULL, b'0');
INSERT INTO `customers` VALUES (6, '893-7149 Eu Rd.', NULL, '1994-06-04', 'mollis.lectus@gmail.com', 'MALE', 'Callum Townsend', 'Cauayan', '001242273', NULL, 'nisi', NULL, b'0');
INSERT INTO `customers` VALUES (7, '637-5187 Dapibus St.', NULL, '1998-01-22', 'nunc@gmail.com', 'MALE', 'Owen Sawyer', 'Wals-Siezenheim', '032971377', NULL, 'pede', NULL, b'0');
INSERT INTO `customers` VALUES (8, 'Ap #853-6492 Magna St.', NULL, '2002-07-01', 'augue.eu@gmail.com', 'FEMALE', 'Willow Carr', 'Jayapura', '085630961', NULL, 'tempus', NULL, b'0');
INSERT INTO `customers` VALUES (9, 'P.O. Box 496, 9444 Orci. St.', NULL, '1994-06-22', 'libero@gmail.com', 'FEMALE', 'Lyle Fitzgerald', 'Darıca', '014245238', NULL, 'tempor', NULL, b'0');
INSERT INTO `customers` VALUES (10, 'P.O. Box 793, 3613 Duis Rd.', NULL, '1999-08-12', 'arcu.curabitur@gmail.com', 'MALE', 'Malachi Ruiz', 'Kupang', '010444140', NULL, 'nunc', NULL, b'0');
INSERT INTO `customers` VALUES (11, 'P.O. Box 123, 9771 Mollis Avenue', NULL, '1993-05-15', 'quisque.tincidunt@gmail.com', 'MALE', 'Lester Raymond', 'Galway', '035364148', NULL, 'suscipit', NULL, b'0');
INSERT INTO `customers` VALUES (12, 'Ap #671-1884 Nullam St.', NULL, '1992-05-18', 'elementum.sem@gmail.com', 'FEMALE', 'Neil Summers', 'Ciudad Real', '002668654', NULL, 'vel', NULL, b'0');
INSERT INTO `customers` VALUES (13, 'Ap #637-3194 Interdum Avenue', NULL, '2005-03-23', 'nulla.facilisi@gmail.com', 'FEMALE', 'Len Coleman', 'Bạc Liêu', '078854732', NULL, 'porttitor', NULL, b'0');
INSERT INTO `customers` VALUES (14, 'Ap #107-1287 Nunc Av.', NULL, '2000-01-03', 'id.nunc.interdum@gmail.com', 'MALE', 'Mara Burns', 'Finkenstein am Faaker See', '008254774', NULL, 'elit,', NULL, b'0');
INSERT INTO `customers` VALUES (15, '496-2132 Adipiscing Street', NULL, '1997-02-03', 'est@gmail.com', 'MALE', 'Damian Gay', 'Brevik', '067508725', NULL, 'nisl', NULL, b'0');
INSERT INTO `customers` VALUES (16, 'Ap #951-2266 Mauris St.', NULL, '2003-07-12', 'feugiat.nec@gmail.com', 'FEMALE', 'Constance Calderon', 'Lozova', '032639149', NULL, 'velit', NULL, b'0');
INSERT INTO `customers` VALUES (17, '413-7342 Eleifend Road', NULL, '1999-05-31', 'rutrum.lorem@gmail.com', 'FEMALE', 'Harlan Morse', 'Hudson Bay', '077937712', NULL, 'Vestibulum', NULL, b'0');
INSERT INTO `customers` VALUES (18, '297-4834 Sagittis Street', NULL, '1996-12-13', 'dignissim.lacus.aliquam@gmail.com', 'MALE', 'Troy Whitney', 'Serik', '084533813', NULL, 'gravida', NULL, b'0');
INSERT INTO `customers` VALUES (19, 'P.O. Box 168, 7990 Nunc Avenue', NULL, '2002-11-18', 'amet.metus@gmail.com', 'MALE', 'Keane Rojas', 'Irkutsk', '071584437', NULL, 'tempus', NULL, b'0');
INSERT INTO `customers` VALUES (20, '618-6659 Vestibulum Rd.', NULL, '1999-01-09', 'adipiscing@gmail.com', 'FEMALE', 'Anastasia Love', 'Bolsward', '077351937', NULL, 'rutrum,', NULL, b'0');
INSERT INTO `customers` VALUES (21, 'Ap #638-9415 Dolor Street', NULL, '2004-10-04', 'cursus.et@gmail.com', 'FEMALE', 'Mara Mercado', 'Bến Tre', '036820991', NULL, 'consequat', NULL, b'0');
INSERT INTO `customers` VALUES (22, 'P.O. Box 137, 7646 Dolor. Rd.', NULL, '1993-11-04', 'vestibulum.lorem@gmail.com', 'MALE', 'Sasha Beck', 'Masbate City', '056833554', NULL, 'a,', NULL, b'0');
INSERT INTO `customers` VALUES (23, '342-1994 Lobortis, Road', NULL, '1997-11-04', 'dictum.eleifend@gmail.com', 'MALE', 'Mara Macias', 'Minna', '065423557', NULL, 'non', NULL, b'0');
INSERT INTO `customers` VALUES (24, '970-2128 Metus. Ave', NULL, '2003-09-10', 'volutpat.nunc@gmail.com', 'FEMALE', 'Kevin Olson', 'Duitama', '016325758', NULL, 'quis', NULL, b'0');
INSERT INTO `customers` VALUES (25, 'Ap #171-6963 Consequat St.', NULL, '1996-09-20', 'montes.nascetur.ridiculus@gmail.com', 'FEMALE', 'Graham Crawford', 'Kuruman', '093144182', NULL, 'augue', NULL, b'0');
INSERT INTO `customers` VALUES (26, '8215 Blandit Avenue', NULL, '1998-09-10', 'pede.nec.ante@gmail.com', 'MALE', 'Aidan Whitley', 'Fürstenwalde', '014191127', NULL, 'Sed', NULL, b'0');
INSERT INTO `customers` VALUES (27, 'P.O. Box 296, 113 Vitae Av.', NULL, '1995-07-31', 'sapien.aenean@gmail.com', 'MALE', 'Breanna Chavez', 'Racine', '088556177', NULL, 'ornare', NULL, b'0');
INSERT INTO `customers` VALUES (28, '3888 Faucibus Avenue', NULL, '2000-01-24', 'eu@gmail.com', 'FEMALE', 'Uriah Green', 'Khammam', '061728125', NULL, 'rhoncus.', NULL, b'0');
INSERT INTO `customers` VALUES (29, '208-6287 Turpis. Ave', NULL, '2002-08-27', 'nibh@gmail.com', 'FEMALE', 'Lesley Kline', 'Cametá', '037869045', NULL, 'sit', NULL, b'0');
INSERT INTO `customers` VALUES (30, '539-7402 Consectetuer Street', NULL, '1996-02-25', 'lacus.nulla@gmail.com', 'MALE', 'Rafael Jefferson', 'Drammen', '053115168', NULL, 'parturient', NULL, b'0');
INSERT INTO `customers` VALUES (31, 'P.O. Box 532, 6694 Non, Road', NULL, '1994-11-10', 'ullamcorper.duis.cursus@gmail.com', 'MALE', 'Jasmine Monroe', 'Ulloa (Barrial]', '046155721', NULL, 'vitae', NULL, b'0');

-- ----------------------------
-- Table structure for orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails`  (
  `created_date` date NULL DEFAULT NULL,
  `quantity` int(0) NULL DEFAULT NULL,
  `updated_date` date NULL DEFAULT NULL,
  `order_id` int(0) NOT NULL,
  `product_id` int(0) NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int(0) NOT NULL AUTO_INCREMENT,
  `created_date` date NULL DEFAULT NULL,
  `updated_date` date NULL DEFAULT NULL,
  `customer_id` bigint(0) NULL DEFAULT NULL,
  `is_deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `FKn0nawuptqdsb5vtjilh4bug43`(`customer_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(0) NOT NULL AUTO_INCREMENT,
  `created_date` date NULL DEFAULT NULL,
  `product_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `unit_in_stock` int(0) NULL DEFAULT NULL,
  `thumbnail_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_date` date NULL DEFAULT NULL,
  `brand_id` int(0) NULL DEFAULT NULL,
  `category_id` int(0) NULL DEFAULT NULL,
  `is_deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `FK108t60ni9yo75kmymqpxew8cy`(`brand_id`) USING BTREE,
  INDEX `FKhni6wbnrv2eeq69kme5u6p9i7`(`category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, NULL, 'tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus', 'Lobortis Augue Foundation', 10, 1, 'https://pinterest.com', NULL, 1, 1, b'0');
INSERT INTO `product` VALUES (2, NULL, 'ligula. Nullam feugiat placerat velit. Quisque varius. Nam', 'Mollis Lectus Ltd', 8, 14, 'https://google.com', NULL, 1, 1, b'0');
INSERT INTO `product` VALUES (3, NULL, 'Sed congue, elit sed', 'Est Ac Mattis Inc.', 3, 4, 'http://guardian.co.uk', NULL, 1, 2, b'0');
INSERT INTO `product` VALUES (4, NULL, 'parturient montes,', 'Arcu Vestibulum Ante Ltd', 1, 7, 'https://cnn.com', NULL, 1, 2, b'0');
INSERT INTO `product` VALUES (5, NULL, 'ipsum. Curabitur', 'Consectetuer Mauris Institute', 6, 14, 'http://twitter.com', NULL, 1, 3, b'0');
INSERT INTO `product` VALUES (6, NULL, 'In condimentum. Donec at arcu.', 'Nec Mollis Vitae Corp.', 8, 2, 'https://wikipedia.org', NULL, 1, 3, b'0');
INSERT INTO `product` VALUES (7, NULL, 'commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque', 'Fringilla Purus Mauris Incorporated', 5, 16, 'http://walmart.com', NULL, 1, 1, b'0');
INSERT INTO `product` VALUES (8, NULL, 'non, cursus non, egestas a, dui.', 'Orci Quis Lectus Inc.', 3, 4, 'https://guardian.co.uk', NULL, 1, 1, b'0');
INSERT INTO `product` VALUES (9, NULL, 'eu nulla at sem molestie sodales. Mauris blandit enim', 'Cras Sed Limited', 3, 15, 'http://yahoo.com', NULL, 1, 2, b'0');
INSERT INTO `product` VALUES (10, NULL, 'cursus', 'Molestie LLC', 9, 11, 'https://google.com', NULL, 1, 2, b'0');
INSERT INTO `product` VALUES (11, NULL, 'In lorem. Donec elementum, lorem', 'Dignissim Maecenas Associates', 2, 14, 'https://google.com', NULL, 2, 3, b'0');
INSERT INTO `product` VALUES (12, NULL, 'augue', 'Laoreet Libero Et LLC', 6, 17, 'https://wikipedia.org', NULL, 2, 3, b'0');
INSERT INTO `product` VALUES (13, NULL, 'ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam', 'Dapibus LLP', 6, 3, 'http://facebook.com', NULL, 2, 1, b'0');
INSERT INTO `product` VALUES (14, NULL, 'lacinia mattis.', 'Dictum Incorporated', 2, 18, 'http://yahoo.com', NULL, 2, 1, b'0');
INSERT INTO `product` VALUES (15, NULL, 'diam lorem,', 'Libero Industries', 4, 2, 'https://cnn.com', NULL, 2, 2, b'0');
INSERT INTO `product` VALUES (16, NULL, 'eget odio. Aliquam vulputate', 'Libero Est Industries', 4, 18, 'http://twitter.com', NULL, 2, 2, b'0');
INSERT INTO `product` VALUES (17, NULL, 'bibendum. Donec felis orci,', 'Fusce Limited', 6, 6, 'http://zoom.us', NULL, 2, 3, b'0');
INSERT INTO `product` VALUES (18, NULL, 'sit amet orci. Ut sagittis lobortis mauris. Suspendisse', 'Diam Dictum Company', 3, 1, 'https://nytimes.com', NULL, 2, 3, b'0');
INSERT INTO `product` VALUES (19, NULL, 'non enim. Mauris quis turpis', 'Sed Neque Sed Corporation', 4, 13, 'https://cnn.com', NULL, 2, 1, b'0');
INSERT INTO `product` VALUES (20, NULL, 'consequat auctor, nunc nulla vulputate', 'Nulla At Limited', 1, 8, 'https://whatsapp.com', NULL, 2, 1, b'0');
INSERT INTO `product` VALUES (21, NULL, 'ipsum primis in faucibus orci luctus et ultrices', 'Nullam PC', 6, 13, 'http://pinterest.com', NULL, 3, 2, b'0');
INSERT INTO `product` VALUES (22, NULL, 'et, eros. Proin ultrices.', 'Quis Pede Institute', 2, 17, 'http://walmart.com', NULL, 3, 2, b'0');
INSERT INTO `product` VALUES (23, NULL, 'posuere vulputate,', 'Aenean Eget Ltd', 6, 9, 'https://guardian.co.uk', NULL, 3, 3, b'0');
INSERT INTO `product` VALUES (24, NULL, 'turpis egestas.', 'Mauris Inc.', 9, 12, 'https://whatsapp.com', NULL, 3, 3, b'0');
INSERT INTO `product` VALUES (25, NULL, 'dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis', 'Orci Ut LLP', 4, 19, 'https://nytimes.com', NULL, 3, 1, b'0');
INSERT INTO `product` VALUES (26, NULL, 'ipsum. Phasellus vitae mauris sit amet lorem semper', 'Consequat Dolor LLC', 3, 10, 'https://twitter.com', NULL, 3, 1, b'0');
INSERT INTO `product` VALUES (27, NULL, 'Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean', 'A Institute', 2, 19, 'http://whatsapp.com', NULL, 3, 2, b'0');
INSERT INTO `product` VALUES (28, NULL, 'magnis dis parturient montes, nascetur ridiculus', 'Velit Aliquam Incorporated', 9, 5, 'https://zoom.us', NULL, 3, 2, b'0');
INSERT INTO `product` VALUES (29, NULL, 'nisl sem, consequat nec, mollis vitae, posuere at,', 'Rhoncus Id LLC', 9, 14, 'http://twitter.com', NULL, 3, 3, b'0');
INSERT INTO `product` VALUES (30, NULL, 'Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis', 'Rhoncus Nullam Velit LLC', 3, 19, 'https://reddit.com', NULL, 3, 3, b'0');
INSERT INTO `product` VALUES (31, NULL, 'enim. Suspendisse aliquet, sem ut cursus', 'Imperdiet Ornare In Inc.', 8, 3, 'http://twitter.com', NULL, 4, 1, b'0');
INSERT INTO `product` VALUES (32, NULL, 'velit. Aliquam nisl. Nulla', 'Est Ac Facilisis Inc.', 7, 9, 'http://youtube.com', NULL, 4, 1, b'0');
INSERT INTO `product` VALUES (33, NULL, 'egestas nunc sed libero. Proin', 'Arcu Associates', 1, 3, 'https://baidu.com', NULL, 4, 2, b'0');
INSERT INTO `product` VALUES (34, NULL, 'et ultrices posuere cubilia', 'Diam Incorporated', 4, 15, 'https://instagram.com', NULL, 4, 2, b'0');
INSERT INTO `product` VALUES (35, NULL, 'pede.', 'Pede Ultrices Consulting', 6, 5, 'http://baidu.com', NULL, 4, 3, b'0');
INSERT INTO `product` VALUES (36, NULL, 'ridiculus mus. Proin vel nisl.', 'Curabitur Ut Odio LLC', 5, 6, 'http://youtube.com', NULL, 4, 3, b'0');
INSERT INTO `product` VALUES (37, NULL, 'hendrerit neque. In ornare sagittis felis. Donec tempor, est ac', 'Magna Corp.', 1, 6, 'https://instagram.com', NULL, 4, 1, b'0');
INSERT INTO `product` VALUES (38, NULL, 'magna nec quam. Curabitur vel lectus. Cum sociis natoque', 'Turpis Aliquam Adipiscing Associates', 10, 14, 'http://wikipedia.org', NULL, 4, 1, b'0');
INSERT INTO `product` VALUES (39, NULL, 'ullamcorper. Duis at', 'Ullamcorper Nisl Arcu Associates', 7, 12, 'https://nytimes.com', NULL, 4, 2, b'0');
INSERT INTO `product` VALUES (40, NULL, 'ac, feugiat non, lobortis', 'Eu Enim Institute', 8, 19, 'http://zoom.us', NULL, 4, 2, b'0');
INSERT INTO `product` VALUES (41, NULL, 'natoque penatibus et', 'Tincidunt Donec Associates', 2, 1, 'https://naver.com', NULL, 5, 3, b'0');
INSERT INTO `product` VALUES (42, NULL, 'turpis egestas.', 'Duis Associates', 1, 16, 'https://walmart.com', NULL, 5, 3, b'0');
INSERT INTO `product` VALUES (43, NULL, 'gravida. Aliquam tincidunt, nunc ac mattis ornare,', 'Sagittis Placerat Cras Corporation', 3, 11, 'http://cnn.com', NULL, 5, 1, b'0');
INSERT INTO `product` VALUES (44, NULL, 'est ac mattis', 'Ut Nisi A Foundation', 7, 15, 'http://zoom.us', NULL, 5, 1, b'0');
INSERT INTO `product` VALUES (45, NULL, 'molestie arcu. Sed eu nibh vulputate mauris sagittis placerat.', 'Molestie Sed LLC', 8, 7, 'https://walmart.com', NULL, 5, 2, b'0');
INSERT INTO `product` VALUES (46, NULL, 'Nulla facilisis. Suspendisse', 'Euismod Ltd', 9, 17, 'http://walmart.com', NULL, 5, 2, b'0');
INSERT INTO `product` VALUES (47, NULL, 'ut eros', 'Elit Industries', 1, 14, 'http://ebay.com', NULL, 5, 3, b'0');
INSERT INTO `product` VALUES (48, NULL, 'Proin velit. Sed malesuada augue ut', 'In Mi Ltd', 3, 18, 'https://baidu.com', NULL, 5, 3, b'0');
INSERT INTO `product` VALUES (49, NULL, 'lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet', 'Tellus Associates', 2, 8, 'https://twitter.com', NULL, 5, 1, b'0');
INSERT INTO `product` VALUES (50, NULL, 'at', 'Interdum Enim LLC', 2, 10, 'http://baidu.com', NULL, 5, 1, b'0');
INSERT INTO `product` VALUES (51, NULL, 'venenatis a, magna. Lorem ipsum dolor sit amet,', 'Mattis Cras Eget Ltd', 5, 14, 'https://instagram.com', NULL, 6, 2, b'0');
INSERT INTO `product` VALUES (52, NULL, 'arcu. Vestibulum', 'Lacinia Sed Congue Corp.', 7, 7, 'https://cnn.com', NULL, 6, 2, b'0');
INSERT INTO `product` VALUES (53, NULL, 'iaculis aliquet', 'Hendrerit Associates', 1, 13, 'https://bbc.co.uk', NULL, 6, 3, b'0');
INSERT INTO `product` VALUES (54, NULL, 'mauris eu elit.', 'Tortor Integer Incorporated', 1, 3, 'http://guardian.co.uk', NULL, 6, 3, b'0');
INSERT INTO `product` VALUES (55, NULL, 'litora torquent per conubia nostra, per inceptos hymenaeos.', 'Urna Ut Tincidunt Corporation', 6, 10, 'http://baidu.com', NULL, 6, 1, b'0');
INSERT INTO `product` VALUES (56, NULL, 'auctor, velit eget laoreet posuere, enim nisl', 'Velit Industries', 4, 4, 'http://baidu.com', NULL, 6, 1, b'0');
INSERT INTO `product` VALUES (57, NULL, 'Nunc sed', 'Nec LLC', 2, 15, 'http://baidu.com', NULL, 6, 2, b'0');
INSERT INTO `product` VALUES (58, NULL, 'mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada.', 'Eget Nisi Institute', 1, 4, 'http://reddit.com', NULL, 6, 2, b'0');
INSERT INTO `product` VALUES (59, NULL, 'odio semper cursus.', 'Ac PC', 5, 2, 'http://ebay.com', NULL, 6, 3, b'0');
INSERT INTO `product` VALUES (60, NULL, 'sem, vitae aliquam eros turpis non', 'Integer Mollis Integer Consulting', 7, 9, 'https://ebay.com', NULL, 6, 3, b'0');
INSERT INTO `product` VALUES (61, NULL, 'rutrum magna. Cras convallis', 'Integer Eu Associates', 9, 3, 'http://youtube.com', NULL, 7, 1, b'0');
INSERT INTO `product` VALUES (62, NULL, 'sed, est. Nunc', 'Vitae Odio LLC', 8, 16, 'https://ebay.com', NULL, 7, 1, b'0');
INSERT INTO `product` VALUES (63, NULL, 'vulputate, nisi sem semper erat,', 'Aenean Gravida Nunc Corporation', 5, 11, 'http://google.com', NULL, 7, 2, b'0');
INSERT INTO `product` VALUES (64, NULL, 'velit dui, semper', 'Nisi Cum PC', 8, 2, 'https://ebay.com', NULL, 7, 2, b'0');
INSERT INTO `product` VALUES (65, NULL, 'sed dictum eleifend, nunc risus', 'Ut Institute', 4, 19, 'https://yahoo.com', NULL, 7, 3, b'0');
INSERT INTO `product` VALUES (66, NULL, 'nec, leo. Morbi neque tellus, imperdiet non,', 'Conubia Nostra Foundation', 5, 15, 'http://google.com', NULL, 7, 3, b'0');
INSERT INTO `product` VALUES (67, NULL, 'lacus. Nulla tincidunt, neque', 'A Ltd', 7, 17, 'http://walmart.com', NULL, 7, 1, b'0');
INSERT INTO `product` VALUES (68, NULL, 'odio vel est tempor', 'Semper Institute', 5, 7, 'http://naver.com', NULL, 7, 1, b'0');
INSERT INTO `product` VALUES (69, NULL, 'eleifend non, dapibus', 'Lacus Aliquam Foundation', 3, 20, 'https://twitter.com', NULL, 7, 2, b'0');
INSERT INTO `product` VALUES (70, NULL, 'Duis cursus, diam at pretium aliquet,', 'Mauris Institute', 8, 20, 'https://instagram.com', NULL, 7, 2, b'0');
INSERT INTO `product` VALUES (71, NULL, 'malesuada fringilla est. Mauris eu', 'Nisi Cum Limited', 3, 9, 'https://youtube.com', NULL, 8, 3, b'0');
INSERT INTO `product` VALUES (72, NULL, 'augue id ante dictum cursus. Nunc mauris elit,', 'Sollicitudin Corp.', 10, 14, 'https://bbc.co.uk', NULL, 8, 3, b'0');
INSERT INTO `product` VALUES (73, NULL, 'et netus et malesuada fames ac turpis egestas.', 'Aliquet Proin Inc.', 8, 10, 'http://bbc.co.uk', NULL, 8, 1, b'0');
INSERT INTO `product` VALUES (74, NULL, 'Maecenas iaculis aliquet diam. Sed diam', 'Enim PC', 4, 16, 'http://reddit.com', NULL, 8, 1, b'0');
INSERT INTO `product` VALUES (75, NULL, 'Vivamus sit amet risus.', 'Vulputate Dui Associates', 5, 9, 'https://whatsapp.com', NULL, 8, 2, b'0');
INSERT INTO `product` VALUES (76, NULL, 'pede nec ante blandit viverra.', 'Consequat Purus PC', 10, 4, 'http://naver.com', NULL, 8, 2, b'0');
INSERT INTO `product` VALUES (77, NULL, 'scelerisque dui.', 'Habitant Morbi Tristique PC', 4, 10, 'https://google.com', NULL, 8, 3, b'0');
INSERT INTO `product` VALUES (78, NULL, 'vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum.', 'Augue Ut Lacus Ltd', 7, 4, 'http://netflix.com', NULL, 8, 3, b'0');
INSERT INTO `product` VALUES (79, NULL, 'ipsum. Curabitur consequat, lectus sit amet', 'A Institute', 2, 12, 'https://netflix.com', NULL, 8, 1, b'0');
INSERT INTO `product` VALUES (80, NULL, 'auctor. Mauris vel turpis.', 'Sem Pellentesque Industries', 9, 14, 'http://yahoo.com', NULL, 8, 1, b'0');
INSERT INTO `product` VALUES (81, NULL, 'feugiat nec, diam. Duis mi enim, condimentum', 'Dictum Foundation', 8, 12, 'http://guardian.co.uk', NULL, 9, 2, b'0');
INSERT INTO `product` VALUES (82, NULL, 'rutrum,', 'Proin Corporation', 3, 10, 'http://youtube.com', NULL, 9, 2, b'0');
INSERT INTO `product` VALUES (83, NULL, 'Aliquam tincidunt,', 'Quis Ltd', 10, 20, 'https://yahoo.com', NULL, 9, 3, b'0');
INSERT INTO `product` VALUES (84, NULL, 'neque et nunc. Quisque ornare', 'Molestie Associates', 3, 17, 'http://zoom.us', NULL, 9, 3, b'0');
INSERT INTO `product` VALUES (85, NULL, 'dictum. Proin eget', 'Nec Company', 3, 18, 'http://guardian.co.uk', NULL, 9, 1, b'0');
INSERT INTO `product` VALUES (86, NULL, 'at pretium aliquet, metus urna convallis erat, eget tincidunt dui', 'Lectus Incorporated', 8, 1, 'https://whatsapp.com', NULL, 9, 1, b'0');
INSERT INTO `product` VALUES (87, NULL, 'Mauris blandit enim consequat purus. Maecenas libero est,', 'Velit Dui Foundation', 3, 6, 'http://instagram.com', NULL, 9, 2, b'0');
INSERT INTO `product` VALUES (88, NULL, 'scelerisque dui. Suspendisse ac', 'Sed Dictum Ltd', 5, 6, 'http://reddit.com', NULL, 9, 2, b'0');
INSERT INTO `product` VALUES (89, NULL, 'Duis risus odio, auctor', 'Aliquam Rutrum Lorem LLP', 9, 19, 'https://walmart.com', NULL, 9, 3, b'0');
INSERT INTO `product` VALUES (90, NULL, 'sem', 'Sem Foundation', 9, 14, 'http://wikipedia.org', NULL, 9, 3, b'0');
INSERT INTO `product` VALUES (91, NULL, 'Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt,', 'Aenean LLP', 7, 7, 'https://naver.com', NULL, 10, 1, b'0');
INSERT INTO `product` VALUES (92, NULL, 'nec, mollis vitae, posuere at, velit. Cras', 'Cras Vehicula Ltd', 3, 2, 'http://bbc.co.uk', NULL, 10, 1, b'0');
INSERT INTO `product` VALUES (93, NULL, 'et malesuada fames', 'Consectetuer Ipsum Foundation', 5, 2, 'http://naver.com', NULL, 10, 2, b'0');
INSERT INTO `product` VALUES (94, NULL, 'et risus.', 'Orci Incorporated', 7, 5, 'http://instagram.com', NULL, 10, 2, b'0');
INSERT INTO `product` VALUES (95, NULL, 'diam. Proin dolor. Nulla semper tellus', 'Enim Suspendisse Aliquet PC', 9, 7, 'https://guardian.co.uk', NULL, 10, 3, b'0');
INSERT INTO `product` VALUES (96, NULL, 'ipsum. Suspendisse sagittis. Nullam vitae', 'Velit Dui Semper Incorporated', 3, 15, 'https://cnn.com', NULL, 10, 3, b'0');
INSERT INTO `product` VALUES (97, NULL, 'tincidunt dui augue eu', 'Cras Ltd', 6, 3, 'https://youtube.com', NULL, 10, 1, b'0');
INSERT INTO `product` VALUES (98, NULL, 'ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate,', 'Cubilia Curae Inc.', 5, 6, 'https://baidu.com', NULL, 10, 1, b'0');
INSERT INTO `product` VALUES (99, NULL, 'augue. Sed molestie.', 'Ligula Aliquam Erat Incorporated', 2, 7, 'http://nytimes.com', NULL, 10, 2, b'0');
INSERT INTO `product` VALUES (100, NULL, 'at pede. Cras vulputate velit eu sem. Pellentesque ut', 'Cursus In Corp.', 8, 16, 'https://cnn.com', NULL, 10, 2, b'0');
INSERT INTO `product` VALUES (101, '2023-05-05', 'lacinia mattis.', 'Dictum Incorporated', 2, 18, 'http://yahoo.com', '2023-05-05', 1, 1, b'0');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `created_date` date NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_date` date NULL DEFAULT NULL,
  `is_deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '2023-05-04', 'admin', '2023-05-04', b'0');
INSERT INTO `roles` VALUES (2, '2023-05-04', 'staff', '2023-05-04', b'0');
INSERT INTO `roles` VALUES (3, '2023-05-04', 'customer', '2023-05-04', b'0');

SET FOREIGN_KEY_CHECKS = 1;
