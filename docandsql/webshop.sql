/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : webshop

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2016-12-26 15:23:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order1
-- ----------------------------
DROP TABLE IF EXISTS `order1`;
CREATE TABLE `order1` (
  `id` varchar(32) NOT NULL,
  `totalmoney` double DEFAULT NULL,
  `receiverAddress` varchar(200) DEFAULT NULL,
  `receiverName` varchar(20) DEFAULT NULL,
  `receiverPhone` varchar(20) DEFAULT NULL,
  `paysate` int(10) DEFAULT NULL,
  `ordertime` date DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order1
-- ----------------------------
INSERT INTO `order1` VALUES ('06A46891859B4CEAAD57129F849551BD', '1494', '安阳师范学院后营宿舍', '耿帅佳', '17839166574', '0', '2016-12-23', '2C9E674ABA414E31A6C81ACE4F8BE5BC');
INSERT INTO `order1` VALUES ('39A02AFFF86F4D33B51E813302CC4496', '699', '俄式2', '测试', '17839166574', '0', '2016-12-26', '3035F361D9F647D19197A49079CC593E');
INSERT INTO `order1` VALUES ('3A19E94739EC44728717EB1EFC442BC5', '1298', '测试', '测试', '17839166574', '0', '2016-12-26', 'D96B367CFF7C465F805C60EF49DD8E7F');
INSERT INTO `order1` VALUES ('DC9A4500472849FBB4DA086AD6ECD997', '16798', '安阳师范学院后营宿舍', '耿帅佳', '17839166574', '0', '2016-12-21', '2C9E674ABA414E31A6C81ACE4F8BE5BC');
INSERT INTO `order1` VALUES ('F19BD40181A846559772B2139D0BA615', '19494', '安阳师范学院后营宿舍', '耿帅佳', '17839166574', '0', '2016-12-26', '2C9E674ABA414E31A6C81ACE4F8BE5BC');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` varchar(32) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  `product_id` varchar(32) NOT NULL,
  `buynum` int(10) NOT NULL,
  `subtotal` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('20E6F9381A38450EBB67739740049E65', '39A02AFFF86F4D33B51E813302CC4496', '3260B313441C4894B0C494B4E715DA22', '1', '699');
INSERT INTO `orderitem` VALUES ('817FB0C3625E474DBE708D1D1FCD2B6E', '3A19E94739EC44728717EB1EFC442BC5', '50038271840A496C9F74DF18C732283B', '1', '199');
INSERT INTO `orderitem` VALUES ('A0D2A56123994032801CA322AE81E812', 'DC9A4500472849FBB4DA086AD6ECD997', '33526F90B55F48B2922C7E42DDC1BA3D', '1', '15999');
INSERT INTO `orderitem` VALUES ('A89769DAC5A9494E9C9B048F9C91EDA9', 'F19BD40181A846559772B2139D0BA615', '33526F90B55F48B2922C7E42DDC1BA3D', '1', '15999');
INSERT INTO `orderitem` VALUES ('D0EB14A9198C42D9BB752732D1BCEB0A', '06A46891859B4CEAAD57129F849551BD', '20BCB6DE1AA0401592A8E50278B304E4', '6', '1494');
INSERT INTO `orderitem` VALUES ('D35895351F6B4B3B8DE3DF23EE76743E', 'F19BD40181A846559772B2139D0BA615', 'E751BD21F35B4E168C8D0E68F9ACA724', '5', '3495');
INSERT INTO `orderitem` VALUES ('E3FA10738D4040EB8BD4D4689B9D7D82', '3A19E94739EC44728717EB1EFC442BC5', '2E12FCE4D76244DB9AB2055FFD4FA9D8', '1', '1099');
INSERT INTO `orderitem` VALUES ('F579369D8E0649F095566084377EFC45', 'DC9A4500472849FBB4DA086AD6ECD997', '33815F4589FF48649383F5314D3096F3', '1', '799');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` char(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `pnum` int(10) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('20BCB6DE1AA0401592A8E50278B304E4', 'Razer/雷蛇 噬魂金蝎 薄膜键盘', '249', '2', '100', 'images/product/97940b1c-5af0-4e9e-93aa-f885f39b2d6a_1.png', '超薄键帽，键程更短，触发速度快，防按键冲突，薄膜控最爱！');
INSERT INTO `product` VALUES ('27593ADA0AD5441F81FED86262BE1C7B', 'Razer/雷蛇 利维坦巨兽迷你音响', '1499', '4', '100', 'images/product/93877f74-50da-4cdc-a04d-e886af2517a6_1.png', ' 蓝牙无线音箱');
INSERT INTO `product` VALUES ('2E12FCE4D76244DB9AB2055FFD4FA9D8', 'Razer/雷蛇 Ouroboros 奥罗波若蛇', '1099', '1', '100', 'images/product/3a807d8f-ddcb-46ba-9b82-ab400eb1c5fc_1.png', '完全可自定义人体工程学设计');
INSERT INTO `product` VALUES ('3260B313441C4894B0C494B4E715DA22', 'Razer/雷蛇 噬魂金蝎幻彩版 薄膜键盘', '699', '2', '100', 'images/product/1b644bed-669d-4d44-900c-d1d626b52790_1.png', '采用超薄键帽设计，键程更短');
INSERT INTO `product` VALUES ('33526F90B55F48B2922C7E42DDC1BA3D', 'Razer/雷蛇 灵刃GTX1060 256GB固态盘', '15999', '3', '100', 'images/product/a6953012-a3f4-4261-ad42-cec2064f30ae_1.png', '酷睿处理器，256G内存');
INSERT INTO `product` VALUES ('33815F4589FF48649383F5314D3096F3', 'Razer/雷蛇  响尾蛇幻彩灯光', '799', '1', '100', 'images/product/19fcbfed-67d6-4f41-85bf-9ec24120fd6a_1.png', '小巧轻便的外形有利于玩家快速移动，配备160000DPI激光传感器');
INSERT INTO `product` VALUES ('4BC51DE042684C5DB5B3B2EF3B3CF162', 'Razer/雷蛇 Mamba 曼巴眼镜蛇升级版', '1099', '1', '100', 'images/product/bc4ebe42-e2f3-4821-9db7-44af17e80ad8_1.png', '16000DPI传感器，移动一毫米也能感应');
INSERT INTO `product` VALUES ('4DC39A45F673427D9BA01FED27FCA5C3', 'Razer/雷蛇 灵刃GTX1060 1TGB固态盘 ', '17999', '3', '100', 'images/product/f23b7843-645f-4022-9b7f-056a52b54d23_1.png', '酷睿I7处理器，6G独显');
INSERT INTO `product` VALUES ('50038271840A496C9F74DF18C732283B', 'Razer/雷蛇 地狱狂蛇 白色版 游戏鼠标', '199', '1', '100', 'images/product/f4eb23d9-587a-4c02-ab6a-c482fa96db03_1.png', '头部加入跑车散气孔，更加炫酷');
INSERT INTO `product` VALUES ('51275809A8C9419B90FF1DC0296A24AA', 'Razer/雷蛇 黑寡妇蜘蛛终极版2016 机械键盘', '1499', '2', '100', 'images/product/4c74e61b-f0e3-4f20-aecb-8632832a3807_1.png', '绿轴，出色手感，按键无冲');
INSERT INTO `product` VALUES ('55FF3E032B3747C183B8AD17FFA45592', 'Razer/雷蛇 地狱狂蛇 2014', '169', '1', '100', 'images/product/b6035b05-5cde-4b58-a6c8-d1d77f9e622a_1.png', '简约而不简单，外观炫酷，简约');
INSERT INTO `product` VALUES ('57958F0EC143417B8660B2988C44DB13', 'Razer/雷蛇 那伽梵蛇幻彩版', '699', '1', '100', 'images/product/eb960755-9d09-4e54-b5df-72de80050d9f_1.png', '快如闪电，请确定位');
INSERT INTO `product` VALUES ('612F4AA1FCFD4D32A10725B1217DFBCB', 'Razer/雷蛇 灵刃潜行版', '7499', '3', '100', 'images/product/badfb513-7402-45f8-8376-fdc17250a1c8_1.png', 'i5-6200U 256GB固态盘 轻薄笔记本电脑');
INSERT INTO `product` VALUES ('75441A5A3D374B5194B9401BF40359A5', 'Razer/雷蛇 堡垒神蛛 客厅无线游戏键鼠套', '1299', '2', '100', 'images/product/8fde1c9d-520c-4c5f-9094-bea76a949824_1.png', '在沙发上畅玩游戏，双无线');
INSERT INTO `product` VALUES ('797E6EEEC54B45A29EABC7F56CC014D1', 'Razer/雷蛇 北海巨妖专业版2015', '399', '4', '100', 'images/product/23e2c1c6-aa66-4abf-b6b9-130743702e55_1.jpg', '绿色 游戏耳麦');
INSERT INTO `product` VALUES ('91FE3674E50A4DA7973203E78C2C88FE', 'Razer/雷蛇 Seiren', '1399', '4', '100', 'images/product/0a674a47-a11a-4f3f-b40a-f390110bba89_1.jpg', '魔音海妖 数字麦克风');
INSERT INTO `product` VALUES ('9BC66AA3C14A4B3A9BA03C1A756981AF', 'Razer/雷蛇 灵刃潜行版i7-7500U ', '16999', '3', '100', 'images/product/b864c807-f704-417e-8833-89a0aba4dac9_1.png', '1TB固态16GB内存 4K触摸');
INSERT INTO `product` VALUES ('AF21984837544BF2A963C338103C2551', 'Razer/雷蛇 太攀皇蛇 黑色', '399', '1', '100', 'images/product/76a10094-ccf5-4051-af81-5c6e3f621d43_1.png', '携带8200DPI激光传感器，支持按键宏设置');
INSERT INTO `product` VALUES ('B4E8A14691004BB98B2723B20FCF7430', 'Razer/雷蛇 灵刃GTX1060 1TGB固态盘 ', '20999', '3', '100', 'images/product/0ec695c8-5090-4572-b6a7-a3f95d2883ff_1.png', '酷睿I7处理器，独立显卡，1T硬盘');
INSERT INTO `product` VALUES ('C9BD12FAF0E14CDAA504D3C8571D83EA', 'Razer/雷蛇 灵刃潜行版', '11999', '3', '100', 'images/product/80750def-3fc1-45ef-8110-db48855682f1_1.png', 'i7-7500U 512GB固态16GB内存 2K触');
INSERT INTO `product` VALUES ('CDD4C165996D418D83195FE842112066', 'Razer/雷蛇 Leviathan 利维坦巨兽', '1599', '4', '100', 'images/product/b1bdebc4-0026-4175-a3cd-fbc3403e3ad9_1.jpg', '5.1声道 条形音箱');
INSERT INTO `product` VALUES ('D11993D656A444EDB142D165460485E8', 'Razer/雷蛇 灵刃潜行版', '89000', '3', '100', 'images/product/a9987ced-216a-4139-8e2d-9f3f9c71ad00_1.png', 'i7-7500U 128GB固态8GB内存 2K触摸屏');
INSERT INTO `product` VALUES ('D3A4708B35AC415FB98F2E3260766127', 'Razer/雷蛇 灵刃潜行版', '13999', '3', '100', 'images/product/ff508016-ec3e-4cb4-861e-48b6a5be1ebc_1.png', 'i7-7500U 512GB固态16GB内存 4K触');
INSERT INTO `product` VALUES ('D3EB6B5448014170B789826F570392AF', 'Razer/雷蛇  黑寡妇蜘蛛X竞技幻彩版', '899', '2', '100', 'images/product/3e5ebf27-7890-43fa-8d7c-11ce97402cc5_1.png', '绿轴按键，军用金属');
INSERT INTO `product` VALUES ('D72DE8B0A2474CDA9EA3F144DEA3B2BF', 'Razer/雷蛇 地狱狂蛇1800dpi+二角尘蛛 游戏键鼠套装', '299', '2', '100', 'images/product/44b95843-9bb1-413f-a573-fabbebe8f016_1.png', '超值入门级游戏神装，性价比之巅');
INSERT INTO `product` VALUES ('D83AF4C3BB86416C9832C44F1D72759E', 'Razer/雷蛇 塔洛斯魔蝎幻彩版 单手机械键盘', '649', '2', '100', 'images/product/d4e522a8-3891-47e8-a85e-4ecfc80e5b16_1.png', '经改进的人体工程学设计');
INSERT INTO `product` VALUES ('E078D616697E46C0899A6981497EA955', 'Razer/雷蛇', '799', '4', '100', 'images/product/bd9db076-0b63-4194-a2d5-c319ecf81ef8_1.jpg', '游侠背包 双肩背包');
INSERT INTO `product` VALUES ('E751BD21F35B4E168C8D0E68F9ACA724', 'Razer/雷蛇 北海巨妖专业版2015', '699', '4', '100', 'images/product/2a8aa86c-7612-45b0-a60e-c3c635e1b42f_1.jpg', '白色 游戏耳麦');
INSERT INTO `product` VALUES ('E8DA39B88385495FA7120F51237B0899', 'Razer/雷蛇 太攀皇蛇 白色 ', '399', '1', '100', 'images/product/22e818c8-8776-45f9-b92e-08da29c65d83_1.png', '携带8200DPI激光传感器，云驱动');
INSERT INTO `product` VALUES ('ED4463EB412E4F5FB6898F7305DF2B78', 'Razer/雷蛇 炼狱蝰蛇 升级版 ', '399', '1', '100', 'images/product/bbc4f874-7494-445a-9a4f-c4575694e23c_1.png', '3500DPI 人体工程学设计 5个可编程按键');
INSERT INTO `product` VALUES ('FA9029FE5A6142A4A43023A058C121F6', 'Razer/雷蛇  黑寡妇蜘蛛X竞技版', '599', '2', '100', 'images/product/bca096b3-b168-4ade-ab26-e916316246b5_1.png', '悬浮式按键，无边框设计');
INSERT INTO `product` VALUES ('FFC69F937D39477ABCDBB5BDF3A22054', 'Razer/雷蛇 战神7.1', '799', '4', '100', 'images/product/7621eba6-4b4d-4309-a3b8-b085c17e48c1_1.png', '绿色限量版 游戏耳麦');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` char(32) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2C9E674ABA414E31A6C81ACE4F8BE5BC', 'gengzi', '123456', '耿帅佳', '17839166574');
INSERT INTO `user` VALUES ('2F39807540B34A5B822C97FA95D35535', 'admin', '123456', '一号管理员', '17839166574');
