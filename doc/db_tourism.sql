/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : localhost:3306
 Source Schema         : db_tourism

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 11/08/2024 19:03:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_attraction_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_attraction_order`;
CREATE TABLE `sys_attraction_order` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `attractions_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '景点id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `introduce` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '简介',
  `images` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '图片',
  `num` int DEFAULT NULL COMMENT '人数',
  `time` datetime DEFAULT NULL COMMENT '预约时间',
  `people` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '信息',
  `state` int DEFAULT '0' COMMENT '状态',
  `user_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='景点预约';

-- ----------------------------
-- Records of sys_attraction_order
-- ----------------------------
BEGIN;
INSERT INTO `sys_attraction_order` (`id`, `attractions_id`, `name`, `introduce`, `images`, `num`, `time`, `people`, `state`, `user_id`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777693570686365698', '1777682811382247426', '松峰山景区', '松峰山位于阿城区松峰山镇东南3公里，南距平山镇约15公里。松峰山是张广才岭余脉中一个独立山峰，海拔约627米，面积约80平方公里，在地貌上属于假喀斯特地形。因其峰形似双乳，又临阿什河上游的支流，金代称为金源乳峰。', 'http://localhost:8080/img/1712667548889aed8e60110a0af8d41c1c87129e7a556.jpeg,http://localhost:8080/img/17126675518427015587d4d51e9dc36a7761cc137de86.jpg,http://localhost:8080/img/17126675547546c9ccd113798c044b827d29dcfcbf8ef.jpeg', 1, '2024-04-10 08:00:00', '[{\"name\":\"张三\",\"tel\":\"156165\",\"idCard\":\"15616\"}]', 5, '0de96461b6ef0328cef416dea9366c9c', '张三', '2024-04-09 21:42:30', '超级管理员', '2024-06-13 15:10:24');
INSERT INTO `sys_attraction_order` (`id`, `attractions_id`, `name`, `introduce`, `images`, `num`, `time`, `people`, `state`, `user_id`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801138801459675137', '1777682811382247420', '喀纳斯', '喀纳斯风景区，位于新疆阿尔泰山中段，地处中国与哈萨克斯坦、俄罗斯、蒙古国接壤地带，景区面积10030平方公里。喀纳斯国家级风景区的核心精华系冰川强烈刨蚀，冰石表物阴塞山谷，形成终表垄而成湖泊。湖面海拔1375米。', 'http://localhost:8080/img/17182482910148dd708bdc56328da50049d62f273ec6c.jpg,http://localhost:8080/img/17182482938511cafc32a4942a298b0abb5d1fbf36a05.jpg,http://localhost:8080/img/17182482968236ef601f8e2d1b2fbd4af398e692bd8d6.jpg,http://localhost:8080/img/171824830060463ac3db55ac981e30b8cf5bcfbc78f7f.jpeg', 1, '2024-06-13 08:00:00', '[{\"name\":\"张三\",\"tel\":\"3123456\",\"idCard\":\"3123456\"}]', 5, '1697436716646531073', '超级管理员', '2024-06-13 14:25:28', '超级管理员', '2024-06-13 15:10:25');
INSERT INTO `sys_attraction_order` (`id`, `attractions_id`, `name`, `introduce`, `images`, `num`, `time`, `people`, `state`, `user_id`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801149357440712706', '1777682811382247421', '九寨沟', '九寨沟一般指九寨沟国家级自然保护区。 九寨沟国家级自然保护区，位于四川省西北部岷山山脉南段的阿坝藏族羌族自治州九寨沟县漳扎镇境内，地处岷山南段弓杆岭的东北侧，地理坐标为东经103°46′14″—104°5′3″、北纬32°54′13″—33°19′57″。', 'http://localhost:8080/img/1718248549609fcd4c968d893ad44ed8c59bbfb5e4bc7.jpg,http://localhost:8080/img/171824855271091313dec5bb6bb30bfb544ea3622569e.jpeg,http://localhost:8080/img/1718248555800e18cd13c7cb614f7348cd42d632b5557.jpeg,http://localhost:8080/img/1718248558988454bfdbb42edc8429e0b8d051c236059.jpeg', 1, '2024-06-13 08:00:00', '[{\"name\":\"张三\",\"tel\":\"123456465\",\"idCard\":\"123456465\"}]', 5, '0de96461b6ef0328cef416dea9366c9c', '张三', '2024-06-13 15:07:25', '超级管理员', '2024-06-13 15:10:26');
COMMIT;

-- ----------------------------
-- Table structure for sys_attractions
-- ----------------------------
DROP TABLE IF EXISTS `sys_attractions`;
CREATE TABLE `sys_attractions` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `price` float(10,2) DEFAULT NULL COMMENT '价格',
  `introduce` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '简介',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '介绍',
  `num` int DEFAULT NULL COMMENT '库存',
  `real_name` int DEFAULT '0' COMMENT '实名',
  `images` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '图片',
  `open` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预约须知',
  `time` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '入园时间',
  `state` int DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='景点';

-- ----------------------------
-- Records of sys_attractions
-- ----------------------------
BEGIN;
INSERT INTO `sys_attractions` (`id`, `name`, `price`, `introduce`, `content`, `num`, `real_name`, `images`, `open`, `time`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777682811382247420', '喀纳斯', 100.00, '喀纳斯风景区，位于新疆阿尔泰山中段，地处中国与哈萨克斯坦、俄罗斯、蒙古国接壤地带，景区面积10030平方公里。喀纳斯国家级风景区的核心精华系冰川强烈刨蚀，冰石表物阴塞山谷，形成终表垄而成湖泊。湖面海拔1375米。', '喀纳斯风景区，位于新疆阿尔泰山中段，地处中国与哈萨克斯坦、俄罗斯、蒙古国接壤地带，景区面积10030平方公里。喀纳斯国家级风景区的核心精华系冰川强烈刨蚀，冰石表物阴塞山谷，形成终表垄而成湖泊。湖面海拔1375米。', 99, 1, 'http://localhost:8080/img/17232966910931.png', '景区提倡文明出行,请游客朋友们自觉爱护景区花草树木,不攀爬折枝、不采挖植物、不破坏设施标牌,不随地吐痰、不乱扔垃圾。', '全天', 1, '超级管理员', '2024-04-09 20:59:45', '超级管理员', '2024-08-11 09:21:49');
INSERT INTO `sys_attractions` (`id`, `name`, `price`, `introduce`, `content`, `num`, `real_name`, `images`, `open`, `time`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777682811382247421', '九寨沟', 100.00, '九寨沟一般指九寨沟国家级自然保护区。 九寨沟国家级自然保护区，位于四川省西北部岷山山脉南段的阿坝藏族羌族自治州九寨沟县漳扎镇境内，地处岷山南段弓杆岭的东北侧，地理坐标为东经103°46′14″—104°5′3″、北纬32°54′13″—33°19′57″。', '九寨沟一般指九寨沟国家级自然保护区。 九寨沟国家级自然保护区，位于四川省西北部岷山山脉南段的阿坝藏族羌族自治州九寨沟县漳扎镇境内，地处岷山南段弓杆岭的东北侧，地理坐标为东经103°46′14″—104°5′3″、北纬32°54′13″—33°19′57″。', 99, 1, 'http://localhost:8080/img/1718248549609fcd4c968d893ad44ed8c59bbfb5e4bc7.jpg,http://localhost:8080/img/171824855271091313dec5bb6bb30bfb544ea3622569e.jpeg,http://localhost:8080/img/1718248555800e18cd13c7cb614f7348cd42d632b5557.jpeg,http://localhost:8080/img/1718248558988454bfdbb42edc8429e0b8d051c236059.jpeg', '景区提倡文明出行,请游客朋友们自觉爱护景区花草树木,不攀爬折枝、不采挖植物、不破坏设施标牌,不随地吐痰、不乱扔垃圾。', '全天', 1, '超级管理员', '2024-04-09 20:59:45', '张三', '2024-06-13 15:07:25');
INSERT INTO `sys_attractions` (`id`, `name`, `price`, `introduce`, `content`, `num`, `real_name`, `images`, `open`, `time`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777682811382247422', '鸣沙山', 100.00, '鸣沙山以沙动成响而得名。东汉称沙角山，俗名神沙山，晋代始称鸣沙山，其山东西长40余公里，南北宽约20公里，主峰海拔1715米。峰峦危峭，山脊如刃，经缩复初；人乘沙流，有鼓角之声，轻若丝竹，重若雷鸣，此即“沙岭晴鸣”。', '鸣沙山以沙动成响而得名。东汉称沙角山，俗名神沙山，晋代始称鸣沙山，其山东西长40余公里，南北宽约20公里，主峰海拔1715米。峰峦危峭，山脊如刃，经缩复初；人乘沙流，有鼓角之声，轻若丝竹，重若雷鸣，此即“沙岭晴鸣”。', 100, 1, 'http://localhost:8080/img/1718248611854dc1ac987a85ab49900ef94b584261ecd.jpeg,http://localhost:8080/img/17182486146997a6e7831cdac11b328009c1b109be64d.jpg', '景区提倡文明出行,请游客朋友们自觉爱护景区花草树木,不攀爬折枝、不采挖植物、不破坏设施标牌,不随地吐痰、不乱扔垃圾。', '全天', 1, '超级管理员', '2024-04-09 20:59:45', '超级管理员', '2024-06-13 11:16:57');
INSERT INTO `sys_attractions` (`id`, `name`, `price`, `introduce`, `content`, `num`, `real_name`, `images`, `open`, `time`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777682811382247423', '故宫', 100.00, '北京故宫（The Imperial Palace）是中国明清两代的皇家宫殿，旧称紫禁城，位于北京中轴线的中心。故宫以三大殿为中心，占地面积约72万平方米，建筑面积约15万平方米，有大小宫殿七十多座，相传故宫一共有9999.5间，实际据1973年专家现场测量故宫有房间8707间', '北京故宫（The Imperial Palace）是中国明清两代的皇家宫殿，旧称紫禁城，位于北京中轴线的中心。故宫以三大殿为中心，占地面积约72万平方米，建筑面积约15万平方米，有大小宫殿七十多座，相传故宫一共有9999.5间，实际据1973年专家现场测量故宫有房间8707间', 100, 1, 'http://localhost:8080/img/1718248658534dd88a8657aa9548d402020ad04df0b01.jpeg', '景区提倡文明出行,请游客朋友们自觉爱护景区花草树木,不攀爬折枝、不采挖植物、不破坏设施标牌,不随地吐痰、不乱扔垃圾。', '全天', 1, '超级管理员', '2024-04-09 20:59:45', '超级管理员', '2024-06-13 11:17:40');
INSERT INTO `sys_attractions` (`id`, `name`, `price`, `introduce`, `content`, `num`, `real_name`, `images`, `open`, `time`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777682811382247424', '莫高窟', 100.00, '莫高窟，坐落于河西走廊的西部尽头的敦煌。它的开凿从十六国时期至元代，前后延续约1000年，这在中国石窟中绝无仅有。它既是中国古代文明的一个璀璨的艺术宝库，也是古代丝绸之路上曾经发生过的不同文明之间对话和交流的重要见证。', '莫高窟，坐落于河西走廊的西部尽头的敦煌。它的开凿从十六国时期至元代，前后延续约1000年，这在中国石窟中绝无仅有。它既是中国古代文明的一个璀璨的艺术宝库，也是古代丝绸之路上曾经发生过的不同文明之间对话和交流的重要见证。', 100, 1, 'http://localhost:8080/img/1718248698906ce95bd25319f3f9d3d457dc569738744.jpeg,http://localhost:8080/img/1718248702004c7127ce2cd6dc4ccc326d71e43af3628.jpg', '景区提倡文明出行,请游客朋友们自觉爱护景区花草树木,不攀爬折枝、不采挖植物、不破坏设施标牌,不随地吐痰、不乱扔垃圾。', '全天', 1, '超级管理员', '2024-04-09 20:59:45', '超级管理员', '2024-06-13 11:18:24');
INSERT INTO `sys_attractions` (`id`, `name`, `price`, `introduce`, `content`, `num`, `real_name`, `images`, `open`, `time`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777682811382247425', '泰山', 100.00, '泰山，又名岱山、岱宗、岱岳、东岳、泰岳，为五岳之一，有“五岳之首”“天下第一山”之称。位于山东省中部', '泰山，又名岱山、岱宗、岱岳、东岳、泰岳，为五岳之一，有“五岳之首”“天下第一山”之称。位于山东省中部', 100, 1, 'http://localhost:8080/img/1718248742044d6fa250ad92b64df1b0eb9fc5342dca6.jpg', '景区提倡文明出行,请游客朋友们自觉爱护景区花草树木,不攀爬折枝、不采挖植物、不破坏设施标牌,不随地吐痰、不乱扔垃圾。', '全天', 1, '超级管理员', '2024-04-09 20:59:45', '超级管理员', '2024-06-13 11:19:04');
INSERT INTO `sys_attractions` (`id`, `name`, `price`, `introduce`, `content`, `num`, `real_name`, `images`, `open`, `time`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777682811382247426', '丽江古城', 100.00, '丽江古城位于云南省丽江市古城区，又名大研镇，坐落在丽江坝中部，始建于宋末元初（公元13世纪后期），地处云贵高原，面积为7.279平方公里。丽江古城内的街道依山傍水修建，以红色角砾岩铺就，有四方街、木府、五凤楼、黑龙潭、文昌宫、王丕震纪念馆、雪山书', '丽江古城位于云南省丽江市古城区，又名大研镇，坐落在丽江坝中部，始建于宋末元初（公元13世纪后期），地处云贵高原，面积为7.279平方公里。丽江古城内的街道依山傍水修建，以红色角砾岩铺就，有四方街、木府、五凤楼、黑龙潭、文昌宫、王丕震纪念馆、雪山书', 100, 1, 'http://localhost:8080/img/17182487880344965c09fb0d7498783f8ff2efc199ed3.jpeg,http://localhost:8080/img/1718248793714bfe75c0bdb2478e433495d35d2115b3f.jpg', '景区提倡文明出行,请游客朋友们自觉爱护景区花草树木,不攀爬折枝、不采挖植物、不破坏设施标牌,不随地吐痰、不乱扔垃圾。', '全天', 1, '超级管理员', '2024-04-09 20:59:45', '超级管理员', '2024-06-13 11:19:56');
INSERT INTO `sys_attractions` (`id`, `name`, `price`, `introduce`, `content`, `num`, `real_name`, `images`, `open`, `time`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777682811382247427', '乌镇', 100.00, '乌镇镇，原名乌墩，隶属于浙江省嘉兴市桐乡市，地处江浙沪“金三角”之地、杭嘉湖平原腹地。乌镇境内水系属太湖流', '乌镇镇，原名乌墩，隶属于浙江省嘉兴市桐乡市，地处江浙沪“金三角”之地、杭嘉湖平原腹地。乌镇境内水系属太湖流', 100, 1, 'http://localhost:8080/img/1718248840599e306cc1221042406507cbc68358f3311.png,http://localhost:8080/img/171824884345575e3269f1179eba12d5af9ac32a71e84.jpg', '景区提倡文明出行,请游客朋友们自觉爱护景区花草树木,不攀爬折枝、不采挖植物、不破坏设施标牌,不随地吐痰、不乱扔垃圾。', '全天', 1, '超级管理员', '2024-04-09 20:59:45', '超级管理员', '2024-06-13 11:20:46');
INSERT INTO `sys_attractions` (`id`, `name`, `price`, `introduce`, `content`, `num`, `real_name`, `images`, `open`, `time`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777682811382247428', '黄山', 100.00, '黄山，古称黟山，位于安徽省黄山市境内，地处安徽省南部、黄山市北部，地跨歙县、休宁县、黟县和黄山区、徽州区，东起黄狮岭，西至小岭脚，北始二龙桥，南达汤口镇，地跨东经118°01′至118°17′、北纬30°01′至30°18′，山境南北长约40千米', '黄山，古称黟山，位于安徽省黄山市境内，地处安徽省南部、黄山市北部，地跨歙县、休宁县、黟县和黄山区、徽州区，东起黄狮岭，西至小岭脚，北始二龙桥，南达汤口镇，地跨东经118°01′至118°17′、北纬30°01′至30°18′，山境南北长约40千米', 100, 1, 'http://localhost:8080/img/171824889804268443cad7c3ee3803bcd52d86e5a7d83.jpg', '景区提倡文明出行,请游客朋友们自觉爱护景区花草树木,不攀爬折枝、不采挖植物、不破坏设施标牌,不随地吐痰、不乱扔垃圾。', '全天', 1, '超级管理员', '2024-04-09 20:59:45', '超级管理员', '2024-06-13 11:21:40');
INSERT INTO `sys_attractions` (`id`, `name`, `price`, `introduce`, `content`, `num`, `real_name`, `images`, `open`, `time`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777682811382247429', '兵马俑', 100.00, '兵马俑，即秦始皇陵兵马俑，亦简称秦兵马俑或秦俑，是第一批全国重点文物保护单位、第一批中国世界遗产，位于今陕西省西安市临潼区秦始皇陵以东1.5千米处的兵马俑坑内', '兵马俑，即秦始皇陵兵马俑，亦简称秦兵马俑或秦俑，是第一批全国重点文物保护单位、第一批中国世界遗产，位于今陕西省西安市临潼区秦始皇陵以东1.5千米处的兵马俑坑内', 100, 1, 'http://localhost:8080/img/171824895983703c377af81566bc0d905e181af34a698.jpeg', '景区提倡文明出行,请游客朋友们自觉爱护景区花草树木,不攀爬折枝、不采挖植物、不破坏设施标牌,不随地吐痰、不乱扔垃圾。', '全天', 1, '超级管理员', '2024-04-09 20:59:45', '超级管理员', '2024-06-13 11:22:41');
COMMIT;

-- ----------------------------
-- Table structure for sys_comments
-- ----------------------------
DROP TABLE IF EXISTS `sys_comments`;
CREATE TABLE `sys_comments` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '内容',
  `attractions_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '景点id',
  `user_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `avatar` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '头像',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `score` int DEFAULT '0' COMMENT '评分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='景点评论';

-- ----------------------------
-- Records of sys_comments
-- ----------------------------
BEGIN;
INSERT INTO `sys_comments` (`id`, `content`, `attractions_id`, `user_id`, `avatar`, `create_by`, `create_time`, `update_by`, `update_time`, `score`) VALUES ('1822463226352353281', '好地方', '1777682811382247420', '0de96461b6ef0328cef416dea9366c9c', '/img/1723297404622.jpg', '杭州水果捞', '2024-08-11 10:41:08', '杭州水果捞', '2024-08-11 10:41:08', 2);
INSERT INTO `sys_comments` (`id`, `content`, `attractions_id`, `user_id`, `avatar`, `create_by`, `create_time`, `update_by`, `update_time`, `score`) VALUES ('1822463262167515138', '大家可以去玩玩', '1777682811382247421', '0de96461b6ef0328cef416dea9366c9c', '/img/1723297404622.jpg', '杭州水果捞', '2024-08-11 10:41:16', '杭州水果捞', '2024-08-11 10:41:16', 2);
INSERT INTO `sys_comments` (`id`, `content`, `attractions_id`, `user_id`, `avatar`, `create_by`, `create_time`, `update_by`, `update_time`, `score`) VALUES ('1822463304639037441', '很好', '1777682811382247427', '0de96461b6ef0328cef416dea9366c9c', '/img/1723297404622.jpg', '杭州水果捞', '2024-08-11 10:41:26', '杭州水果捞', '2024-08-11 10:41:26', 0);
INSERT INTO `sys_comments` (`id`, `content`, `attractions_id`, `user_id`, `avatar`, `create_by`, `create_time`, `update_by`, `update_time`, `score`) VALUES ('1822463374205763585', '可以的', '1777682811382247420', 'd97f5bcc9b06e080d743554ef38b2b2d', '/img/1697436716646531073.jpeg', 'user2', '2024-08-11 10:41:43', 'user2', '2024-08-11 10:41:43', 2);
INSERT INTO `sys_comments` (`id`, `content`, `attractions_id`, `user_id`, `avatar`, `create_by`, `create_time`, `update_by`, `update_time`, `score`) VALUES ('1822463413225373698', '不错', '1777682811382247424', 'd97f5bcc9b06e080d743554ef38b2b2d', '/img/1697436716646531073.jpeg', 'user2', '2024-08-11 10:41:52', 'user2', '2024-08-11 10:41:52', 0);
INSERT INTO `sys_comments` (`id`, `content`, `attractions_id`, `user_id`, `avatar`, `create_by`, `create_time`, `update_by`, `update_time`, `score`) VALUES ('1822463442761662466', '很好', '1777682811382247429', 'd97f5bcc9b06e080d743554ef38b2b2d', '/img/1697436716646531073.jpeg', 'user2', '2024-08-11 10:41:59', 'user2', '2024-08-11 10:41:59', 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_favor
-- ----------------------------
DROP TABLE IF EXISTS `sys_favor`;
CREATE TABLE `sys_favor` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `line_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '路线id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `introduce` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '介绍',
  `images` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '图片',
  `user_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='收藏';

-- ----------------------------
-- Records of sys_favor
-- ----------------------------
BEGIN;
INSERT INTO `sys_favor` (`id`, `line_id`, `name`, `introduce`, `images`, `user_id`) VALUES ('1777692428418002945', '1777685922071031810', '千余人打卡松峰山，冰凌花成一景', '清明假期，位于阿城区的松峰山小火了一把，假期前两天每天接待1300余人，比去年同期翻了一番。游客在登山远眺的同时，还欣赏到了美丽的冰凌花。', 'http://localhost:8080/img/17126682513336e3de1e3cf2076572d30172af7b591b3.jpg', '0de96461b6ef0328cef416dea9366c9c');
INSERT INTO `sys_favor` (`id`, `line_id`, `name`, `introduce`, `images`, `user_id`) VALUES ('1801138004348977154', '1801096132717002755', '【2024新疆全新攻略】3分钟耐心看完，一定让你新疆之旅少走弯路！', '出游时间：每年的6-8月份是最合适不过了；新疆旅游线路选择（请往下看）；关于新疆旅游费用。关键看怎么玩：以10天为例：如果自己不做攻略任性玩大约8千-1万/人；做好攻略再去大约7千-8千/人；如果找小宇 接待只需要3千多元到四千元左右', 'http://localhost:8080/img/1718249460177a80f0bf5c74865d064c9682727497922.jpg', '1697436716646531073');
INSERT INTO `sys_favor` (`id`, `line_id`, `name`, `introduce`, `images`, `user_id`) VALUES ('1801149458603130881', '1801096132717002755', '【2024新疆全新攻略】3分钟耐心看完，一定让你新疆之旅少走弯路！', '出游时间：每年的6-8月份是最合适不过了；新疆旅游线路选择（请往下看）；关于新疆旅游费用。关键看怎么玩：以10天为例：如果自己不做攻略任性玩大约8千-1万/人；做好攻略再去大约7千-8千/人；如果找小宇 接待只需要3千多元到四千元左右', 'http://localhost:8080/img/1718249460177a80f0bf5c74865d064c9682727497922.jpg', '0de96461b6ef0328cef416dea9366c9c');
COMMIT;

-- ----------------------------
-- Table structure for sys_forum
-- ----------------------------
DROP TABLE IF EXISTS `sys_forum`;
CREATE TABLE `sys_forum` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '内容',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='资讯';

-- ----------------------------
-- Records of sys_forum
-- ----------------------------
BEGIN;
INSERT INTO `sys_forum` (`id`, `title`, `content`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777689383319744513', '松峰山一日游攻略', '<p>一、景点概况</p><p>松峰山，古称金源乳峰，位于哈尔滨市东南85公里的阿城区，是张广才岭生物群余脉的一部分。这座山海拔627米，不仅是东北地区八大名山之一，还被誉为龙江第一秀，足见其景色之秀美。</p><p>二、景区交通攻略</p><p>从哈尔滨市出发，可以选择自驾或者乘坐公共交通工具前往。自驾的朋友们可以选择沿哈牡高速公路前行，然后转入阿横公路，再转入峰铁公路，最后到达目的地。公共交通则可以选择先乘坐地铁或公交到达阿城区，然后再转乘当地的旅游巴士直达景区。</p><p>三、游玩行程</p><p>建议游客们早上7点左右出发，大约9点左右到达景区。首先可以参观山上的古建筑群，如玉皇阁、万佛楼等，感受古人的智慧和艺术。然后可以沿着山路行进，欣赏沿途的风景，体验爬山的乐趣。到达山顶后，可以俯瞰四周的美景，让人心旷神怡。下山后，可以在山脚下的餐厅享用当地的美食。</p><p>四、美食推荐</p><p>在松峰山游玩的过程中，游客们可以尝试当地的美食。推荐品尝阿城区的传统菜肴，如红烧肉、炖排骨等，还有当地的特色小吃如煎饼果子、豆腐脑等。</p><p>五、开放时间</p><p>景区的开放时间通常为每天早上7点到下午5点。需要注意的是，景区可能会根据季节和天气情况调整开放时间，所以游客们最好提前查询相关信息。</p><p>六、注意事项</p><p>在游玩过程中，游客们需要注意安全，特别是在爬山的过程中要小心谨慎。同时也要注意保护环境，不乱扔垃圾。在景区内不要随意采摘和破坏植物。如果需要帮助，可以联系景区工作人员。</p>', '超级管理员', '2024-04-09 21:25:52', '超级管理员', '2024-04-09 21:25:52');
INSERT INTO `sys_forum` (`id`, `title`, `content`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801138261086519297', '东南亚国家旅游业加快复苏（国际视点）', '<p class=\"ql-align-justify\">	今年以来，东南亚国家旅游业加快复苏。据东盟旅游协会最新报告，2024年第一季度，前往该地区的国际游客人数大幅增长，泰国、马来西亚和新加坡等热门旅游目的地的酒店入住率和航班客流量显著增加，旅游业预计成为该地区全年经济增长的重要推动力。当前，东南亚国家正加快完善旅游基础设施，提升旅游服务质量，提高地区旅游业竞争力，打造多样化的旅游目的地。</p><p class=\"ql-align-justify\">	<strong>旅游业复苏带动多行业增长</strong></p><p class=\"ql-align-justify\">	优美的自然风光、古老的寺庙遗迹、多彩的民族文化……东南亚地区独具特色的旅游资源，吸引着世界各地的旅行者。</p><p class=\"ql-align-justify\">	泰国总理府发言人猜·瓦差隆日前介绍，今年前5个月泰国共接待外国游客1476万人次，比去年同期增长38%，带来超过7000亿泰铢（1元人民币约合5.11泰铢）的收入。</p><p class=\"ql-align-justify\">	截至今年5月中旬，泰国已接待外国游客超过1300万人次，同比增长40%，旅游业收入超过6300亿泰铢。仅4月份宋干节活动期间，泰国就吸引近30万游客，收入超2.9亿泰铢。泰国国家旅游局局长塔佩妮告诉记者，泰国旅游业增长势头强劲，带动住宿、餐饮、交通、购物等多个行业增长，成为拉动泰国经济发展的重要动力。预计今年第二季度泰国将吸引约827万人次的外国旅客，带来约3700亿泰铢的收入。</p><p class=\"ql-align-justify\">	今年第一季度，多个东南亚国家旅游业迎来快速增长。其中，越南接待外国游客超过460万人次，同比增长72%。马来西亚吸引外国游客580万人次，同比增长32.5%；印度尼西亚接待外国游客超过300万人次，创下近4年来最高水平；柬埔寨接待近160万人次外国游客，同比增长超20%；老挝接待外国游客超过110万人次，同比增长36%。</p><p class=\"ql-align-justify\">	亚洲开发银行发布的《2024年亚洲发展展望（4月版）》指出，在旅游业复苏、内需强劲等因素带动下，亚太地区发展中经济体继续保持韧性增长。国际货币基金组织预测，得益于旅游业的良好发展，2024年柬埔寨经济增长率将超过6%。越南预计全年将接待外国游客1700万—1800万人次、国内游客1.1亿人次，旅游业总收入约840万亿越南盾（1元人民币约合3513越南盾）。</p><p class=\"ql-align-justify\">	马来西亚旅游、艺术及文化部部长张庆信表示，东南亚国家旅游业强劲复苏将为地区国家带来更多就业机会。东盟秘书长高金洪表示，东盟致力于促进本地区旅游业发展，旅游业对于推动地区经济增长发挥着重要作用。</p><p class=\"ql-align-justify\">	<strong>打造行业可持续发展新亮点</strong></p><p class=\"ql-align-justify\">	今年以来，东南亚国家出台多项举措，促进旅游业持续增长，提高旅游业整体竞争力。新加坡旅游局正在制定“旅游业2040”长期战略，发展健康养生旅游是重点项目之一。新加坡永续发展与环境部部长傅海燕表示，新加坡计划在该国南部的滨海堤坝附近，建造一个崭新的、以健康养生为主题的景点，利用周边丰富的旅游资源为游客提供全新体验。该项目预计在2030年底前落成。</p><p class=\"ql-align-justify\">	柬埔寨旅行社协会主席蔡秀玲表示，柬埔寨正在采取多项措施提升旅游业整体质量和吸引力，发展原生态旅游是重点方向之一。她说，白马、贡布、戈公和西哈努克4个沿海省份拥有多样的自然美景和生态旅游资源，是柬埔寨旅游业的核心亮点。当地政府将在传统的海滩度假基础上，推出森林探险、山地徒步和运河游览等一系列旅游项目，让游客沉浸式体验柬埔寨丰富多彩的自然景观和文化遗产。</p><p class=\"ql-align-justify\">	泰国国家旅游局近日启动了一项名为“365天，畅游二线城市”的试点项目，旨在深入挖掘曼谷以外城市的旅游资源，如进一步开发北碧府、大城府等地资源，打造更多热门旅游目的地。泰国政府希望通过该项目，帮助本国旅游业实现多元发展，缓解曼谷旅游过度集中的压力，并将旅游经济效益辐射至更多地区。</p><p class=\"ql-align-justify\">	2024年是老挝国家旅游年，老挝政府制定了一系列短期和中长期发展战略，以提升旅游业发展水平。老挝旅游部门正大力推动老挝语、英语和中文等多语种宣传计划，制作旅游信息手册分发给游客，并在社交媒体平台上广泛宣介旅游景点。此外，老挝政府全年将举办近80项重要人文交流促进活动，例如在华潘省等多个省开展民族食品制作、“一区一品”商品展示及市场博览会等活动，在琅南塔等省举办划船比赛、马拉松赛和自行车赛等多项赛事。老挝新闻文化和旅游部表示，将继续开发更多旅游产品，完善旅游业配套服务，以吸引更多国际游客。</p><p class=\"ql-align-justify\">	越南旅游总局加大了在全球的推介力度，并与农业、工业、贸易等其他部门对接，以开发更多旅游产品、拉动游客消费。</p><p class=\"ql-align-justify\">	<strong>中国游客助力地区旅游业发展</strong></p><p class=\"ql-align-justify\">	中国游客市场是东南亚国家吸引外国游客的重点之一。中方自2023年12月1日起对马来西亚实施单方面免签入境政策，马方也宣布同日起对中国公民实施免签证便利措施。今年以来，中国又同新加坡、泰国签署互免签证协定。</p><p class=\"ql-align-justify\">	自3月1日中泰互免签证协定生效以来，中国游客访泰热度持续攀升。泰方数据显示，今年一季度泰国累计接待中国游客超过175万人次，在各国游客中位居第一。泰国国家旅游局日前与银联国际签署国际旅游战略合作意向书，商定在品牌宣传、营销推广、数据共享等领域深化合作。塔佩妮表示，中国市场潜力巨大，是泰国重要的国际旅游客源地。“泰国政府高度重视中国游客在泰旅行体验。我们与银联国际的合作，将为中国游客提供更多便利，增强他们赴泰旅游的信心，推进泰中两国人文交流不断发展。”塔佩妮说。</p><p class=\"ql-align-justify\">	马来西亚旅游促进局总监马诺哈兰表示，马中双方免签政策施行第一个月就看到明显效果。当月，来自中国的游客数量达16.8万人次，比2023年11月增加35.1%。马来西亚移民局日前宣布，将进一步优化中国游客入境程序，包括免除出示经济能力证明和在马期间住宿证明等文件。马来西亚中国公共关系协会副会长颜天禄表示，吸引更多中国游客到访，将促进马来西亚旅游业持续增长，同时带动酒店、餐饮、交通和零售等相关行业发展。</p><p class=\"ql-align-justify\">	2024年是中柬人文交流年。蔡秀玲表示，中国游客一直是柬埔寨旅游市场的主力军。柬埔寨正推出多项新举措，包括增加直飞航线、简化签证手续以及联合开展市场推广活动等，提升中国游客在柬埔寨的旅行体验。“‘柬中人文交流年’不仅可以增强旅游合作，也有助于进一步增进两国人民的友好情感。”蔡秀玲说。（记者白元琪）</p><p><br></p>', '超级管理员', '2024-06-13 14:23:20', '超级管理员', '2024-06-13 14:23:20');
INSERT INTO `sys_forum` (`id`, `title`, `content`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801138327436214274', '端午假期兰州市接待游客290.266万人次 旅游总花费214688.491万元', '<p>	兰州市文旅局最近发布消息，全市在端午假期期间接待游客人次达到了290.266万人次，同比增长了28.14%。旅游总花费也达到了214688.491万元，同比增长了35.62%。同时，兰州市32家星级饭店的入住率达到了37.45%。根据兰州市文旅局的统计数据，这个假期期间全市旅游市场呈现出了持续增长的趋势。旅游人次的增长主要得益于端午节假日长、天气适宜以及各大旅游景点的促销活动等因素。未来将继续加强旅游市场的监管和规划，提升旅游服务质量和水平，推动全市旅游市场的持续健康发展。</p><p>	据报道，作为今年夏季旅游高峰的开端，兰州市的端午假期文旅消费市场在去年高位运行的基础上保持了增长态势。值得注意的是，本地游和周边游的需求显著增长，导致租车自驾在端午节期间持续火热，相关订单数量大幅增加。此外，吃粽子、挂香包等各种传统民俗活动也备受青睐，尤其是在“新中式”旅游方面，逐渐成为了新的潮流。兰州市的文旅市场在端午假期出现了明显的变化，人们更加注重旅游体验和个性化需求，对传统民俗活动和新型旅游方式的需求也逐渐增加。租车自驾和“新中式”旅游方式的兴起，更是成为了今年端午假期的一大亮点。在兰州市的文化和旅游市场，本地游和周边游的市场份额不断增加，特别是针对年轻人的“新中式”旅游方式越来越受到欢迎。</p><p>	另外，随着暑假旅游高峰即将到来，跨境旅游市场正在迎来加速复苏。</p>', '超级管理员', '2024-06-13 14:23:35', '超级管理员', '2024-06-13 14:23:35');
INSERT INTO `sys_forum` (`id`, `title`, `content`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801138410303078402', '乡村旅游数字提升行动启动', '<p>乡村旅游数字提升行动是文化和旅游部促进数字经济与旅游业深度融合发展的一项重要举措，旨在将新兴技术与在地资源相结合，推动产业转型升级、培育壮大新型消费，同时吸引更多有志于乡村全面振兴的平台机构、社会力量和达人创客投身乡村旅游发展，促进文旅深度融合、推动城乡共同富裕。</p><p>2023年以来，乡村旅游数字提升行动通过开展立体展示、专题推广、培训扶持等系列活动，惠及全国31个省份1138个县域超2万个乡村旅游经营主体，直接带来乡村游客近2000万人次，探索出“乡村旅游+数字经济”发展路径，成为各地推动乡村旅游提质升级、放大乡村旅游带动效益的重要抓手，为消费增长和创新发展注入动能。</p><p>2024年乡村旅游数字提升行动进一步拓展行动范围、集合优质资源，指导更多互联网平台助力乡村文旅拥抱数字时代。乡村旅游数字提升行动将持续吸纳更多平台、企业参与行动，支持各地结合实际情况和发展需求，因地制宜、量力而行，实施一批辐射面广、带动性强的乡村旅游数字提升项目，培育乡村旅游新业态、新场景、新体验，促进数字技术与实体经济深度融合，激发乡村旅游内生动力和县域旅游发展潜力。</p>', '超级管理员', '2024-06-13 14:23:55', '超级管理员', '2024-06-13 14:23:55');
INSERT INTO `sys_forum` (`id`, `title`, `content`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801138479702032385', '五一出行数据 悠家民宿告诉你旅游现在有多火', '<p>五一假期已然过去</p><p>文化和旅游部6日发布的数据显示</p><p>全国国内旅游出游人次达到惊人的2.95亿</p><p>较去年同期增长7.6%，</p><p>与2019年同期相比，更是增长了28.2%!</p><p>国内游客出游总花费高达1668.9亿元，</p><p>同比增长12.7%，较2019年同期增长13.5%</p><p>文旅活动丰富多彩，满足游客多元需求</p><p>这个五一，从城市到乡村，从传统文化到现代艺术，各级文化和旅游部门精心策划了各类特色旅游产品和文化活动。</p><p>全国各级公共图书馆、文化馆(站)免费开放，为公众提供了丰富的公共文化产品。</p><p>村晚、广场舞、群众歌咏等群众文化活动，让游客在旅途中也能感受到浓厚的文化氛围。</p><p>文旅消费持续升温，惠民措施频出</p>', '超级管理员', '2024-06-13 14:24:12', '超级管理员', '2024-06-13 14:24:12');
INSERT INTO `sys_forum` (`id`, `title`, `content`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801138561998471169', '中国现代化设施、文化体验等吸引越来越多新西兰游客', '<p class=\"ql-align-justify\">	<strong>中新网6月12日电</strong>&nbsp;随着全球旅游业的复苏，“跨境深度体验游”日益流行，新西兰旅游从业者正想办法打造符合中国游客口味的旅游产品。而中国多样化的文化体验及便利的支付等措施，也让新西兰游客对赴中国旅游越来越感兴趣。</p><p class=\"ql-align-justify\">	据新西兰“乡音”网报道，新西兰旅游局亚洲区总经理华夫贝克(Gregg Wafelbakker)称，如今中国游客的偏好已经转变，他们对“沉浸式体验、独特目的地”的需求日益增长。他预计中国游客的旅游需求会持续增长。</p><p class=\"ql-align-justify\">	新西兰旅游供应商黄思辉(Huang Sihui，音译)也证实了这种转变。他称，受中国游客欢迎的新西兰目的地包括霍比屯(《指环王》《霍比特人》电影拍摄地)，以及皇后镇骑马、库克山冰川徒步旅行、达尼丁城堡之旅，甚至狩猎探险等活动。</p><p class=\"ql-align-justify\">	随着中国游客越来越依赖社交媒体进行旅行规划，个人用户生成的内容和“网红”推荐发挥着至关重要的作用。新西兰旅游局正积极与一些社交媒体平台合作，推出“避暑游”“慢游”等活动来吸引游客。</p><p class=\"ql-align-justify\">	在新西兰吸引中国游客的同时，不少新西兰人对中国的深度游也越来越感兴趣，中新两国间航班的增加便利了他们的行程。李女士(Lisa Li)就职于新西兰的一家旅行社，她最近带领一个旅游团前来中国旅行。</p><p class=\"ql-align-justify\">	李女士称，现代化的设施、多样化的文化体验和合理的机票价格等因素是吸引新西兰游客的主要因素。值得注意的是，中国数字支付平台的简化和便利给她的团队带来了更多惊喜，解决了新西兰游客无现金旅行的潜在担忧。</p><p><br></p>', '超级管理员', '2024-06-13 14:24:31', '超级管理员', '2024-06-13 14:24:31');
INSERT INTO `sys_forum` (`id`, `title`, `content`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801138629505794049', '黔东南2024年“端午”假日文化旅游市场平稳有序', '<p>2024年“端午”假日期间，按照省委省政府及州委州政府工作安排，全州上下盯紧旅游市场安全，切实做好文旅市场监管、安全生产、值班值守、运行监测等各项服务保障工作。假日期间，全州文旅活动亮点纷呈，旅游产品优惠丰富，文化旅游市场平稳有序。</p><p>用心加强宣传“引客”。节前全网推出《【6月旅游月历】初夏已至，来黔东南开启对美好生活的向往》《 “粽”情黔东南 端午好好玩！》《精品旅游线路 | 这个夏天来贵州开启“四宝”之旅，一次旅行，多元体验》等内容，及时发布黔东南州“端午”假日重大活动信息及精品线路、旅游攻略。节假日期间，央视《晚间新闻》播出新闻《家国端午 文脉流长·粽叶飘香》，报道了台江县的五彩姊妹粽习俗；央视新闻频道《新闻直播间》报道《贵州榕江 ：“村超”四强争夺赛 以球会友过端午》《端午·贵州镇远：龙舟有个性，拼搏赢好运》；央视《道德观察》（日播版）播出《端午好时节——粽米香 同欢乐》，关注施秉县双井镇龙塘村苗家端午包粽子比赛活动。同时，村BA、村超、姑妈篮球赛、村歌大赛、侗族大歌唱响施秉云台山等多项活动广受中央和省各级媒体和平台关注。</p><p>精心研究谋划“留客”。精心组织人员摸清文体旅活动底数，对活动时间、活动地点、活动规模、活动内容、活动预案、举办单位等核心内容掌握清楚。划龙舟活动，做到定人、定时、定点，全面掌握下水划龙舟数量、活动时间、下水码头等信息。同时，结合固定的节庆活动和临时节庆活动实际，提前谋划、提前做预案和提前向全网发布活动时间和内容，给予省内外旅行社足够的线路安排、宣传和组团时间，推出黔东南特色精品旅游线路，吸引各地游客前来沉浸式体验消费。</p><p>全心筹备活动“欢客”。“端午”期间，镇远县举办了2024年民体杯龙舟、独竹漂比赛暨国家历史文化名城镇远第四十届赛龙舟文化节活动，游客不仅能观看到精彩的比赛，还可以观看文艺表演，让广大游客能享受到丰富多彩的文化大餐</p>', '超级管理员', '2024-06-13 14:24:47', '超级管理员', '2024-06-13 14:24:47');
INSERT INTO `sys_forum` (`id`, `title`, `content`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801138708337737730', '整治鼓浪屿“宰客链”，守护厦门旅游“金字招牌”', '<p>鼓浪屿是世界文化遗产，是人们耳熟能详的风景名胜。然而，近期不断有游客反映，鼓浪屿旅游套路多、花费高、体验差。据总台记者蹲点暗访，当地形成了一条隐蔽交错、根深蒂固的“灰色产业链”。从出租车司机忽悠游客到旅行社买高价船票，到商家以次充好、销售假冒伪劣产品，游客稍不留神，就会在套路中越陷越深。</p><p><br></p><p>6月8日，央视新闻曝光鼓浪屿旅游市场相关问题后，厦门市表示诚恳接受媒体监督，认真对照排查，立即采取行动，坚决整治整改。相关部门依法从严处置有关违法行为。当天中午，厦门市成立鼓浪屿旅游市场秩序专项整治联合工作组，对鼓浪屿五家涉事单位及两家涉事旅行社门市部责令停业整顿，对涉事导游暂扣导游证，并注销相关违法违规驾驶员岗位服务证。</p><p>“不到鼓浪屿，就等于没到厦门”，鼓浪屿是很多游客来到厦门的首选景区，每逢假期更是游客如潮，今年五一假期就累计接待游客21.8万人次。庞大的市场规模、良莠不齐的服务供给，给当地实施监管带来一些难题。不过，越是游客数量众多，就越要严格监管红线、创新监管手段，回应群众对文旅高质量发展的期待。</p><p>整治旅游乱象，维护良好的旅游市场秩序，强化联查联管联治，形成高效协同的监管模式是首要保障。对于不法旅游从业者形成“灰色产业链”的问题，厦门市场监管、文旅、交通等部门理应加大配合力度，打破部门壁垒、完善信息互通，打好监管“组合拳”。比如，扎实做好12345热线办理工作，让游客感受到“一键举报”的高效和实效。只有多措并举做好事前监管、事中监控、事后处罚，才能发挥治理乱象的“釜底抽薪”之效。</p>', '超级管理员', '2024-06-13 14:25:06', '超级管理员', '2024-06-13 14:25:06');
COMMIT;

-- ----------------------------
-- Table structure for sys_hotel
-- ----------------------------
DROP TABLE IF EXISTS `sys_hotel`;
CREATE TABLE `sys_hotel` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `attractions_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '景区id',
  `attractions` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '景区',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `introduce` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '介绍',
  `images` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '图片',
  `state` int DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='酒店';

-- ----------------------------
-- Records of sys_hotel
-- ----------------------------
BEGIN;
INSERT INTO `sys_hotel` (`id`, `attractions_id`, `attractions`, `name`, `address`, `introduce`, `images`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777686297926807550', '1777682811382247426', '丽江古城', '金悦源酒店(丽江古城大水车店)', '大研古镇 | 距丽江古城步行910米', '酒店位于世界文化遗产——大研古城玉河走廊兰花街，毗邻大水车、红太阳广场，东接龙潭公园，地理位置得天独厚。\n酒店巧妙融合了纳西文化特色和现代时尚元素。酒店在保留纳西民居精髓的同时，也被赋予了新的时代气息。酒店拥有多种房型客房供您选择，可满足顾客朋友不同的入住需求。\n酒店地处古城区玉河走廊兰花街大水车旁，并配备专线前往香格里拉、拉市海茶马古道、玉龙雪山、虎跳峡、束河古镇、黑龙潭等著名景点。酒店环境优雅，低调中不失奢华之美，这里是为懂生活的您精心打造的宜人雅居。', 'http://localhost:8080/img/17182502292711mc4i12000d23y98959AE_W_1080_808_R5_D.jpg,http://localhost:8080/img/17182502321471mc6v12000d23xa7y9857_W_1080_808_R5_D.jpg', 1, '超级管理员', '2024-04-09 21:13:36', '超级管理员', '2024-06-13 11:43:54');
INSERT INTO `sys_hotel` (`id`, `attractions_id`, `attractions`, `name`, `address`, `introduce`, `images`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777686297926807551', '1777682811382247426', '丽江古城', '榕逸美宿客栈(丽江古城店)', '大研古镇 | 距丽江古城步行1.2公里', '客栈轻奢简约风格，给人一种非常轻松愉快的感觉，给住进来的你们营造了一个明亮宁静的环境和氛围！房间的面积都比较大，全智能客房、恒洁智能马桶、恒洁花洒、舒达床垫、坚果投影、中央空调等，有大大的落地窗可观景、喝茶、看书、拍照了，房间有大床，双床家庭房及 loft 等景观房间供大家选择；大厅有超大的茶桌，提供免费的普洱茶供你品尝，客栈的每一个角落都可以成为摄影布景，喜欢拍照的你们赶紧行动起来吧！', 'http://localhost:8080/img/17182591920491mc1o12000cyfronxCF0E_W_1080_808_R5_D.jpg', 1, '超级管理员', '2024-04-09 21:13:36', '超级管理员', '2024-06-13 14:13:14');
INSERT INTO `sys_hotel` (`id`, `attractions_id`, `attractions`, `name`, `address`, `introduce`, `images`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777686297926807552', '1777682811382247426', '丽江古城', '致家民宿(丽江古城店)', '丽江市区 | 距丽江古城步行1.2公里', '本店位于丽江古城网红夜市忠义市场，5596旁边，步行几分钟到古城，民宿对面就是丽江水果批发市场。房间24小时热水，独立网络，本店期待您的到来，祝您旅途愉快！', 'http://localhost:8080/img/17182592430771mc0n12000e6e0zrj4068_W_1080_808_R5_D.jpg', 1, '超级管理员', '2024-04-09 21:13:36', '超级管理员', '2024-06-13 14:14:05');
INSERT INTO `sys_hotel` (`id`, `attractions_id`, `attractions`, `name`, `address`, `introduce`, `images`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777686297926807553', '1777682811382247426', '丽江古城', '谷子里度假庭院', '大研古镇 | 距丽江古城步行590米', '客栈设施设备先进完善，功能齐全，客房24小时热水、全部房间无线网络覆盖、全部房间电热毯、电吹风、电水壶、洗衣服务、行李寄存；老板都是退伍军人，热情好客，欢迎来自五湖四海的朋友光临，并愿意为旅客提供量身订做的旅行建议，这里适合情侣的甜蜜度假、好朋友的结伴出游、亦或者一个人的单独出行、院子绿意临窗，宁静而雅致，闲暇时坐在小院子里泡一壶普洱茶，跟来自五湖四海的朋友聊天品茶；享受丽江的柔软阳光，慵懒地看书喝茶享受生活！', 'http://localhost:8080/img/17182592826421mc0n12000e6e0zrj4068_W_1080_808_R5_D.jpg', 1, '超级管理员', '2024-04-09 21:13:36', '超级管理员', '2024-06-13 14:14:44');
INSERT INTO `sys_hotel` (`id`, `attractions_id`, `attractions`, `name`, `address`, `introduce`, `images`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777686297926807554', '1777682811382247426', '丽江古城', '唯我所有.静谧花园Quiet Garden客栈(丽江古城店)', '大研古镇 | 距丽江古城步行920米', '客栈坐落于大研古镇的丽江，会让您在丽江拥有别样的体验，开展一段难忘的旅行。从酒店到丽江三义机场，到丽江火车站均很便捷。包括四方街和丽江古城都在酒店周边，对于入住旅客想在该地区畅游会很方便。优美的环境，再搭配上细致周到的服务，酒店的休闲区定能满足您的品质需求。漫步在民宿的庭院，感受生活的宁静与美好,在这里,你可以静听风雨.也可以观赏星辰,你可以忘却烦恼,停下脚步,给心灵放个假,享受生活。', 'http://localhost:8080/img/17182593557670203412000d0c80enB572_W_1080_808_R5_D.jpg', 1, '超级管理员', '2024-04-09 21:13:36', '超级管理员', '2024-06-13 14:15:57');
INSERT INTO `sys_hotel` (`id`, `attractions_id`, `attractions`, `name`, `address`, `introduce`, `images`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777686297926807555', '1777682811382247426', '丽江古城', '丽江宝祥居·空中花园观景酒店', '大研古镇 | 距丽江古城步行910米', '宝祥居是八河区域较高的建筑之一，天台早可远眺玉龙雪山，晚可观古城夜景；同时客栈天台设有餐厅，提供早餐，也自助烧烤等。客栈工作人员热情好客，为您提供专业的旅游咨询和票务预定服务，让您在丽江的旅途玩得放心。', 'http://localhost:8080/img/17182593932580AD47120008x509hr7D11_W_1080_808_R5_D.jpg', 1, '超级管理员', '2024-04-09 21:13:36', '超级管理员', '2024-06-13 14:16:35');
INSERT INTO `sys_hotel` (`id`, `attractions_id`, `attractions`, `name`, `address`, `introduce`, `images`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777686297926807556', '1777682811382247426', '丽江古城', ' 后樂LIFE·设计观景酒店', '大研古镇 | 距丽江古城步行910米', '丽江后乐设计师精品民宿位于大研古镇，距离古镇市一中入口步行约几分钟路程。\n民宿配有水循环地暖、中央空调、乳胶床垫、鹅绒被、多类型睡枕、TOTO卫浴、英国洗护品，儿童用品，防晒用品，另提供欢迎水果、茶点、炖品、免费早餐等。\n民宿还可提供至少30多人以上的会议场地、设施和配套用品。', 'http://localhost:8080/img/17182594465741mc4u12000b5nu95c2DE0_W_1080_808_R5_D.jpg', 1, '超级管理员', '2024-04-09 21:13:36', '超级管理员', '2024-06-13 14:17:29');
INSERT INTO `sys_hotel` (`id`, `attractions_id`, `attractions`, `name`, `address`, `introduce`, `images`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777686297926807557', '1777682811382247426', '丽江古城', '树洞里·star设计师民宿(丽江古城大水车店)', '大研古镇 | 距丽江古城步行910米', '院内四季花香，环境优美。装修轻奢，既具纳西庭院风格更具现代时尚风格，和谐自然。你可以在鲜花包围的院内品茶；柔软的摇椅上荡秋千；舒适的睡椅上享受柔软的阳光。\n每个房间均配备冷暖空调、42英寸超薄液晶电视，24小时高温热水，原装品牌洗发水及沐浴露，电吹风，无线网络等设备。\n自助洗衣机，自助烘干机。', 'http://localhost:8080/img/17182595003760203c12000b43gl75E013_W_1080_808_R5_D.jpg', 1, '超级管理员', '2024-04-09 21:13:36', '超级管理员', '2024-06-13 14:18:22');
INSERT INTO `sys_hotel` (`id`, `attractions_id`, `attractions`, `name`, `address`, `introduce`, `images`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777686297926807558', '1777682811382247426', '丽江古城', '雅客居.静谧花园Quiet Garden客栈(丽江古城店)', '大研古镇 | 距丽江古城步行910米', '客栈是一家丽江古城中心位置的新中式中高端客栈，距离四方街几分钟，渣渣米线，网红酒吧街，木府五分钟，一进三院,两个花园，有厨房，餐厅，茶室，两个花园休闲公区，配有几套户外赏景桌椅，房间设施配置齐全，典雅大气，顾家乳胶床垫，慕思乳胶枕头，全系九牧智能洁具，全屋欧瑞博智能唤醒，高端布草，实木榻榻米沙发可拉开变床，整体典雅大气上档次，地理位置优越，值得入住。', 'http://localhost:8080/img/17182595419651mc6k12000ccot7dd01BD_W_1080_808_R5_D.jpg', 1, '超级管理员', '2024-04-09 21:13:36', '超级管理员', '2024-06-13 14:19:04');
INSERT INTO `sys_hotel` (`id`, `attractions_id`, `attractions`, `name`, `address`, `introduce`, `images`, `state`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777686297926807559', '1777682811382247426', '丽江古城', '花神·云墅设计师酒店(丽江古城大水车店)', '大研古镇 | 距丽江古城步行910米', '美宿比邻丽江古城大水车，位于国家5A级风景区丽江古城北门。背靠象山面朝古城，独栋别墅通透无遮挡房型设计让您可以尽情领略纳西人文风光意境。客栈由国内一流设计师倾心打造。古城北门外闹中取静的巷子内，步行五分钟就可以到古城，周边餐饮超市云集，出行便利，交通发达。一对一管家24小时为您服务！', 'http://localhost:8080/img/17182595888420205f1200098w85ceE354_W_1080_808_R5_D.jpg', 1, '超级管理员', '2024-04-09 21:13:36', '超级管理员', '2024-06-13 14:19:50');
COMMIT;

-- ----------------------------
-- Table structure for sys_hotel_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_hotel_item`;
CREATE TABLE `sys_hotel_item` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `hotel_id` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '酒店id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `price` float(10,2) DEFAULT NULL COMMENT '价格',
  `num` int DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='房型';

-- ----------------------------
-- Records of sys_hotel_item
-- ----------------------------
BEGIN;
INSERT INTO `sys_hotel_item` (`id`, `hotel_id`, `name`, `price`, `num`) VALUES ('1777686363106291713', '1777686297926807550', '标准间', 100.00, 8);
INSERT INTO `sys_hotel_item` (`id`, `hotel_id`, `name`, `price`, `num`) VALUES ('1777686400964079617', '1777686297926807550', '大床房', 200.00, 9);
INSERT INTO `sys_hotel_item` (`id`, `hotel_id`, `name`, `price`, `num`) VALUES ('1777686449932578817', '1777686297926807550', '家庭房', 300.00, 10);
COMMIT;

-- ----------------------------
-- Table structure for sys_hotel_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_hotel_order`;
CREATE TABLE `sys_hotel_order` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `hotel_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '酒店id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `introduce` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '简介',
  `images` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '图片',
  `num` int DEFAULT NULL COMMENT '人数',
  `time` datetime DEFAULT NULL COMMENT '预约时间',
  `people` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '信息',
  `state` int DEFAULT '0' COMMENT '状态',
  `user_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `item_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '房型id',
  `item_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '房型',
  `price` float(10,2) DEFAULT NULL COMMENT '价格',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='酒店预约';

-- ----------------------------
-- Records of sys_hotel_order
-- ----------------------------
BEGIN;
INSERT INTO `sys_hotel_order` (`id`, `hotel_id`, `name`, `introduce`, `images`, `num`, `time`, `people`, `state`, `user_id`, `item_id`, `item_name`, `price`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801138914433253378', '1777686297926807550', '金悦源酒店(丽江古城大水车店)', '酒店位于世界文化遗产——大研古城玉河走廊兰花街，毗邻大水车、红太阳广场，东接龙潭公园，地理位置得天独厚。\n酒店巧妙融合了纳西文化特色和现代时尚元素。酒店在保留纳西民居精髓的同时，也被赋予了新的时代气息。酒店拥有多种房型客房供您选择，可满足顾客朋友不同的入住需求。\n酒店地处古城区玉河走廊兰花街大水车旁，并配备专线前往香格里拉、拉市海茶马古道、玉龙雪山、虎跳峡、束河古镇、黑龙潭等著名景点。酒店环境优雅，低调中不失奢华之美，这里是为懂生活的您精心打造的宜人雅居。', 'http://localhost:8080/img/17182502292711mc4i12000d23y98959AE_W_1080_808_R5_D.jpg,http://localhost:8080/img/17182502321471mc6v12000d23xa7y9857_W_1080_808_R5_D.jpg', 1, '2024-06-13 08:00:00', '{\"name\":\"张三\",\"tel\":\"4161651\",\"idCard\":\"3123456\"}', 5, '1697436716646531073', '1777686363106291713', '标准间', 100.00, '超级管理员', '2024-06-13 14:25:55', '超级管理员', '2024-06-13 15:10:38');
INSERT INTO `sys_hotel_order` (`id`, `hotel_id`, `name`, `introduce`, `images`, `num`, `time`, `people`, `state`, `user_id`, `item_id`, `item_name`, `price`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801149620947861506', '1777686297926807550', '金悦源酒店(丽江古城大水车店)', '酒店位于世界文化遗产——大研古城玉河走廊兰花街，毗邻大水车、红太阳广场，东接龙潭公园，地理位置得天独厚。\n酒店巧妙融合了纳西文化特色和现代时尚元素。酒店在保留纳西民居精髓的同时，也被赋予了新的时代气息。酒店拥有多种房型客房供您选择，可满足顾客朋友不同的入住需求。\n酒店地处古城区玉河走廊兰花街大水车旁，并配备专线前往香格里拉、拉市海茶马古道、玉龙雪山、虎跳峡、束河古镇、黑龙潭等著名景点。酒店环境优雅，低调中不失奢华之美，这里是为懂生活的您精心打造的宜人雅居。', 'http://localhost:8080/img/17182502292711mc4i12000d23y98959AE_W_1080_808_R5_D.jpg,http://localhost:8080/img/17182502321471mc6v12000d23xa7y9857_W_1080_808_R5_D.jpg', 1, '2024-06-13 08:00:00', '{\"name\":\"张三\",\"tel\":\"45615616\",\"idCard\":\"45615616\"}', 5, '0de96461b6ef0328cef416dea9366c9c', '1777686400964079617', '大床房', 200.00, '张三', '2024-06-13 15:08:28', '超级管理员', '2024-06-13 15:10:39');
INSERT INTO `sys_hotel_order` (`id`, `hotel_id`, `name`, `introduce`, `images`, `num`, `time`, `people`, `state`, `user_id`, `item_id`, `item_name`, `price`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1822443506546884609', '1777686297926807550', '金悦源酒店(丽江古城大水车店)', '酒店位于世界文化遗产——大研古城玉河走廊兰花街，毗邻大水车、红太阳广场，东接龙潭公园，地理位置得天独厚。\n酒店巧妙融合了纳西文化特色和现代时尚元素。酒店在保留纳西民居精髓的同时，也被赋予了新的时代气息。酒店拥有多种房型客房供您选择，可满足顾客朋友不同的入住需求。\n酒店地处古城区玉河走廊兰花街大水车旁，并配备专线前往香格里拉、拉市海茶马古道、玉龙雪山、虎跳峡、束河古镇、黑龙潭等著名景点。酒店环境优雅，低调中不失奢华之美，这里是为懂生活的您精心打造的宜人雅居。', 'http://localhost:8080/img/17182502292711mc4i12000d23y98959AE_W_1080_808_R5_D.jpg,http://localhost:8080/img/17182502321471mc6v12000d23xa7y9857_W_1080_808_R5_D.jpg', 1, '2024-08-01 08:00:00', '{\"name\":\"陈\",\"tel\":\"1\",\"idCard\":\"1\"}', 0, '0de96461b6ef0328cef416dea9366c9c', '1777686363106291713', '标准间', 100.00, '杭州水果捞', '2024-08-11 09:22:46', '杭州水果捞', '2024-08-11 09:22:46');
COMMIT;

-- ----------------------------
-- Table structure for sys_line
-- ----------------------------
DROP TABLE IF EXISTS `sys_line`;
CREATE TABLE `sys_line` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `temperature` int DEFAULT NULL COMMENT '温度',
  `geography` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地理情况',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '内容',
  `introduce` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '介绍',
  `images` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '图片',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='旅游线路';

-- ----------------------------
-- Records of sys_line
-- ----------------------------
BEGIN;
INSERT INTO `sys_line` (`id`, `temperature`, `geography`, `name`, `content`, `introduce`, `images`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1777685922071031810', 20, '高原', '近期计划去大西北（青海+甘肃）玩，八天七晚行程路线要怎样安排？', '<p><span style=\"color: rgb(51, 51, 51);\"> 青甘大环线景区比较分散，一个青甘大环线下来将近3000公里，尤其是现在比较火的</span><span style=\"color: rgb(255, 0, 0);\">大地之子、塔尔寺、青海湖、茶卡盐湖、翡翠湖、东台吉乃尔湖、青海雅丹魔鬼城、莫高窟、鸣沙山（月牙泉）、嘉峪关、张掖七彩丹霞、祁连大草原</span><span style=\"color: rgb(51, 51, 51);\">.....等景点，都位于荒芜广袤的无人区之中，在这边地图导航经常不准，第一次去很容易跑岔路还看不到风景。</span></p><p>我是选的结伴自由行，联系的是朋友们推荐的西北定制旅游管家<span style=\"color: rgb(204, 0, 0);\">阿曼</span>，他们家在当地实力很强大，可以提供吃、住、行、导游等一条龙服务，而且在我们抵达青海之前就帮我们把住宿、导游、门票、交通、司机师傅等都安排好了，还到机场接我们，超级棒，必须点赞！</p><p>&nbsp;&nbsp;&nbsp;想定制游去西北的朋友，强烈推荐你找<span style=\"color: rgb(204, 0, 0);\">阿曼</span>，能帮你提前把各方面都安排好，而且比自己去玩起码省出40%以上费用，我们8天7晚玩下来每人才1000左右。建议想去的小伙伴出发前找<span style=\"color: rgb(204, 0, 0);\">阿曼</span>帮忙安排一下。</p><p><img src=\"http://localhost:8080/img/1718249336196a4fcb3bd9492aec6ffd58c206f9ca8f5.jpg\"></p><p><strong style=\"color: rgb(51, 102, 255);\">PS：</strong><span style=\"color: rgb(51, 51, 51);\">特别满意的是我们提前预定</span><span style=\"color: rgb(204, 0, 0);\">阿曼</span><span style=\"color: rgb(51, 51, 51);\">还特别给我们赠送了游玩大礼包：</span></p><p><span style=\"color: rgb(51, 51, 51);\">1、特色餐沙漠BBQ和自助火锅</span></p><p><span style=\"color: rgb(51, 51, 51);\">2、体验非物质遗产打铁花</span></p><p><span style=\"color: rgb(51, 51, 51);\">3、体验越野沙滩车/沙漠骑骆驼</span></p><p><span style=\"color: rgb(51, 51, 51);\">4、无人机360°旅拍</span></p><p><span style=\"color: rgb(51, 51, 51);\">5、汉服体验cosplay</span></p><p><span style=\"color: rgb(51, 51, 51);\">6、畅玩滑沙·索道·跷跷板</span></p><p><span style=\"color: rgb(51, 51, 51);\">7、篝火晚会/DJ灯光秀</span></p><p><span style=\"color: rgb(51, 51, 51);\">8、沙漠露营邂逅星空</span></p><p><span style=\"color: rgb(51, 51, 51);\">9、回道张掖大型实景沙秀演出</span></p><p><img src=\"http://localhost:8080/img/171824936311162c4754406f589595a2937b7c1352427.jpg\"></p><p><strong style=\"color: rgb(243, 156, 18);\">游玩注意事项</strong></p><p><span style=\"color: rgb(255, 0, 0);\">◆</span>甘肃比青海要干燥一些，注意保湿</p><p><span style=\"color: rgb(255, 0, 0);\">◆</span>早晚温差大，要带厚衣服</p><p><span style=\"color: rgb(255, 0, 0);\">◆</span>白天紫外线强，注意防晒，帽子、太阳镜、防晒服都可以备着</p><p><span style=\"color: rgb(255, 0, 0);\">◆</span>多带点裙子，拍照很重要，不要太美哟</p><p><span style=\"color: rgb(255, 0, 0);\">◆</span>很多人都问我有没有高反，我是没有的，一般情况下都不会有</p>', '近期计划去大西北（青海+甘肃）玩，八天七晚行程路线要怎样安排？最好能深度游玩，大概多少钱？有哪些好吃好玩的地方？一篇好玩省钱的西北游玩攻略', 'http://localhost:8080/img/171824928268557537b6a31aaa4dfc77ffc849583e182.jpg', '超级管理员', '2024-06-13 11:36:42', '超级管理员', '2024-06-20 14:17:35');
INSERT INTO `sys_line` (`id`, `temperature`, `geography`, `name`, `content`, `introduce`, `images`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801096132717002754', 20, '平原', '漫步北京—“京畿长城”十大精品旅游线路（自然生态游、历史文化游、红色文化游篇）', '<p><strong>线路途经</strong></p><p>第一天：四季花海—九眼楼长城景区（九眼楼生态长城展示区）—北京雁栖酒店(凯宾斯基店)；</p><p>第二天：雁栖湖—雁栖湖科技展示馆（湖滨公园）</p><p>一湖，两天，四季，九眼楼，让呼吸随着森林吐纳，让身心沉醉在花海，这里的长城，好绿好美好清新。</p><p><strong style=\"color: rgb(25, 25, 25);\">四季花海</strong></p><p><span style=\"color: rgb(25, 25, 25);\">四季花海位于延庆区四海镇，这里海拔高、林木覆盖率高、日照充足，是一个天然大花圃，作为北京市重点打造的沟域经济，共拥有六大园区，是北京市面积最大、观赏效果最佳、独具特色的“大地花海”景观。延绵40多公里的花海，一步一景，数千亩鲜花在青山绿水间铺展开来，生活与艺术在这里相融，这里是观光、摄影、休闲、度假的理想之地。</span></p><p><strong style=\"color: rgb(25, 25, 25);\">九眼楼长城景区</strong></p><p><span style=\"color: rgb(25, 25, 25);\">九眼楼长城景区（九眼楼生态长城展示区）地处延庆区四海镇火焰山主峰，因敌楼四面各有9个箭窗，故名九眼楼。九眼楼是长城重要关口之一，也是万里长城中建筑规模最大、规格最高、瞭望孔最多的敌楼，被誉为“万里长城第一楼”。这里山高谷深，林间木栈道、草甸尽显生态风光，生态长城的美誉实至名归，还有生态长城露营区“松鼠营地”。天气晴好时在九眼楼可遥望京师，正所谓“神京在前，宫阙在目”。</span></p><p><strong style=\"color: rgb(25, 25, 25);\">北京雁栖酒店</strong></p><p><span style=\"color: rgb(25, 25, 25);\">北京雁栖酒店(凯宾斯基店)位于怀柔雁栖岛，相连风光旖旎的雁栖湖，比邻燕山山脉，是宾客休闲度假、滋养身心、享受大自然的优选之地。作为国宾级别的酒店，外观设计气势磅礴，拥有中国皇家园林布局，酒店正对雁栖湖，一侧的落地窗和户外平台可远望东方日出。酒店拥有110间客房及套房，娱乐休闲设施包含林间足球场，健身房等，亲子乐园设施丰富，颇受家庭宾客们的欢迎。</span></p><p><strong style=\"color: rgb(25, 25, 25);\">雁栖湖</strong></p><p><span style=\"color: rgb(25, 25, 25);\">﻿雁栖湖位于燕山脚下长城之边，水面宽阔，湖水清澈，每年春秋两季常有成群的大雁来湖中栖息，故而得名。北面群山环亘，著名的万里长城宛如一条巨龙在群山中蜿蜒穿行；西面是巍峨的红螺山主峰，千年古刹的晨钟暮鼓与雁栖湖自然美景遥相呼应，相得益彰。雁栖湖水由上游莲花泉水汇集而成，湖水清纯碧蓝，湖区气候宜人。良好的生态环境引来白天鹅、仙鹤等珍禽在湖中戏水，为雁栖湖增添了勃勃生机。景区由东、西两个湖区组成，水面宽阔，还可以来此体验景区里的各种水上与陆地项目。</span></p>', '漫步北京—“京畿长城”十大精品旅游线路（自然生态游、历史文化游、红色文化游篇）', 'http://localhost:8080/img/17182497016842af2aa7f325446c7af540c72651a8720.jpeg', '超级管理员', '2024-06-13 11:35:55', '超级管理员', '2024-06-20 14:17:44');
INSERT INTO `sys_line` (`id`, `temperature`, `geography`, `name`, `content`, `introduce`, `images`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801096132717002755', 10, '高原', '【2024新疆全新攻略】3分钟耐心看完，一定让你新疆之旅少走弯路！', '<p>我们这次去新疆玩了10天，全程都交给了<span style=\"color: rgb(216, 27, 67);\">小宇</span>安排，24小时接站、景点门票、线路规划、用车、住宿、饮食、导游等都在安排之内，价格还不到4000元，很划算，所有的钱都花在实处，还会签订正规旅行社合同，很有保障。其中包含了：</p><p>&nbsp;&nbsp;<span style=\"color: rgb(51, 102, 255);\">&nbsp;</span><span style=\"color: rgb(26, 188, 156);\">1：晚上的住宿费用（星级豪华酒店）；</span></p><p><span style=\"color: rgb(26, 188, 156);\"> 2：所有景区的门票和景区区间车；升级2+1陆地头等舱豪华旅游车</span></p><p><span style=\"color: rgb(26, 188, 156);\"> 3：禾木坐热气球、星空木屋、歌舞宴；</span></p><p><span style=\"color: rgb(26, 188, 156);\"> 4：10天的新疆特色民族美食（额尔齐斯河冷水鱼宴、九碗三行子、水果全羊宴等）不好吃现场可退餐费；</span></p><p><span style=\"color: rgb(26, 188, 156);\"> 5：新疆专业领队，安排合理不把时间浪费在路上（讲解幽默风趣，旅途中增添了很多乐趣）；</span></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"background-color: rgb(241, 196, 15);\">后面玩熟了才知道为什么会这么划算，一是因为当地政府复苏旅游业有让利，二是他们做品质自由行很长时间了，公司有实力口碑，跟景点、酒店、交通那些都是长时间合作，拿到的价格比自己去会低很多。</span></p><p>新疆一是个美丽的好地方，非常辽阔。天山将新疆分为南、北两部分，天山以北称为北疆，以南则为南疆。北疆有森林草原湖泊，藏着许多童话村庄，南疆是大面积的沙漠、神秘的异域十二古国！现在网上很多新疆的攻略都已经过时，感觉98%的人听了都会踩雷，如何少花冤枉钱还能玩的好，看这一篇攻略就够了。</p><p>我刚从新疆旅游回来，玩了10天非常开心，全程不赶也不累，这次旅行最正确的决定就是去之前联系了当地导游<span style=\"color: rgb(216, 27, 67);\">小宇</span>，帮我们规划了行程旅游方案，为我们省了不少钱、少走不少弯路…↓<img src=\"http://localhost:8080/img/1718249492972bb0f18946a3b351c79b20643bf8b1b64.jpg\"></p><p class=\"ql-align-center\"><strong style=\"background-color: rgb(26, 188, 156);\">S21沙漠公路+五彩滩+喀纳斯+禾木+魔鬼城+巅峰越野+赛里.木湖+薰衣草+赛里木湖+那拉提+篝火+独库公路+天池-吐鲁番10日游</strong></p><p>想去新疆玩的小伙伴可以先加一下她，比大部分的导游更专业。&nbsp;<span style=\"color: rgb(255, 0, 0);\">大到景点门票路程，怎么游玩省钱 ，怎么样安排不绕路等...新疆之大走错一下2天时间没有了费时费力，小到各种注意事项等等这些都提前告诉我们了，非常贴心~</span></p><p><img src=\"http://localhost:8080/img/17182495110344a149c4bf4af33e40fc6ca728eb39017.jpg\"></p><p><strong style=\"color: rgb(51, 51, 51); background-color: rgb(255, 0, 0);\">【专属奢享】</strong></p><p><strong style=\"color: rgb(51, 51, 51);\">【独家安排】禾木热气球观禾木全景</strong><span style=\"color: rgb(51, 51, 51);\">；那拉提篝火晚会，享受惬意悠闲的慢时光。</span></p><p><strong style=\"color: rgb(51, 51, 51);\">【团型升级】</strong><span style=\"color: rgb(51, 51, 51);\">升级2+1豪华陆地头等舱，旅途更加舒适轻松；</span></p><p><strong style=\"color: rgb(51, 51, 51);\">【贴心服务】</strong><span style=\"color: rgb(51, 51, 51);\">全疆独家VIP百宝箱，为您保驾护航；</span></p><p><strong style=\"color: rgb(51, 51, 51);\">【打破传统】</strong><span style=\"color: rgb(51, 51, 51);\">常规团不走独库公路，无其他大交通衔接，独库公路我们选择商务车倒短，来新疆一定让您看到绝美独库风光；为了行程更加轻松舒适，我们选择了一程动车衔接；</span></p><p><strong style=\"color: rgb(51, 51, 51);\">【品质乐享】</strong><span style=\"color: rgb(51, 51, 51);\">升级2晚当地五星酒店，一晚亚洲十佳主题酒店，一晚禾木小木屋，一晚乌尔禾携程四钻超级民宿，一晚那拉提民宿，当地3晚高档型酒店，住宿贴心舒适；</span></p><p><strong style=\"color: rgb(51, 51, 51);\">【西域盛宴】</strong><span style=\"color: rgb(51, 51, 51);\">新疆特色“抓饭”，新疆地道美食“大盘鸡”，天池特色美食“汉王盛宴”，吐鲁番“水果宴”、让您的味蕾享受空前的满足；</span></p><p><strong style=\"color: rgb(51, 51, 51);\">【无忧旅途】</strong><span style=\"color: rgb(51, 51, 51);\">全程零自费，不加点；</span></p><p><img src=\"http://localhost:8080/img/1718249531448f79409a5124f145cb933e9bac94a5278.jpg\"></p><p><span style=\"color: rgb(51, 51, 51);\">新疆游玩的地方实在太多太广，自己去没有主心骨是没法玩的省心的，包括很多细节上的东西，住的、吃的，路线的合理安排都是很重要的，来这一趟不玩个十几天的还真玩不全，所以我们找的&nbsp;</span><span style=\"color: rgb(216, 27, 67);\">小宇</span><span style=\"color: rgb(51, 51, 51);\">&nbsp;接待，什么都不用操心，出发前有专门的司机师傅联系接机（免费的），行程酒店交通也是提前确定好的，每天只需要按照行程单玩就行。</span></p><p><img src=\"http://localhost:8080/img/17182495532486d9c9a5ed0d097dbbb28ea0fbcf5fb1b.jpg\"></p><p><strong style=\"color: rgb(255, 0, 0);\">新疆必玩景点介绍</strong></p><p>新疆的景点分布以乌鲁木齐为中心，东、南、西、北四个方向，<span style=\"color: rgb(216, 27, 67);\">小宇</span>带我们去了<span style=\"color: rgb(255, 0, 0);\">喀纳斯、禾木、五彩滩、赛里木湖、那拉提、巴音布鲁克、天山天池、火焰山门票、坎儿井、薰衣草博物馆、吐鲁番、国际大巴扎</span>等地方。</p><p><strong style=\"color: rgb(142, 68, 173);\">喀纳斯景区</strong></p><p><span style=\"color: rgb(230, 126, 34);\">推荐指数：★★★★★</span></p><p>沿喀纳斯河一路漫步，欣赏西伯利亚落叶松原始森林、白桦林风景，神仙塆，卧龙湾，月亮湾，鸭泽湖，游览喀纳斯湖。<img src=\"http://localhost:8080/img/1718249580395db1c50db53ee9c582283133a073b5998.jpg\"></p><p><strong style=\"color: rgb(142, 68, 173);\">独山子大峡谷</strong></p><p><span style=\"color: rgb(230, 126, 34);\">推荐指数：★★★★★</span></p><p>我们乘车抵达参观【独山子大峡谷】（游览约1小时），波澜壮阔的大峡谷经过河水亿万年的怒吼崩腾和雨水的冲刷、风雨雕饰，两岸山崖呈现出惊心动魄、气势磅礴的自然画卷，成就了一处让人惊叹的流水侵蚀奇观，留下的只有震撼之美；单就这河道的水，养育了周围奎屯、乌苏、独山子三区的人们。沿着河道往天山脚下走，看着河道和清凉的河水，观赏着左边陡峭的土山，这些土山其实就是丹霞地貌的特征，颜色主要有灰、黑、黄、少许的红色。在山地看背景是蓝天白云，分外好看。独山子大峡谷与另外一边专门通往天山的另一景区佛山构成鲜明的旅游景点结合。</p><p><strong style=\"color: rgb(155, 89, 182);\">那拉提空中草原</strong></p><p><span style=\"color: rgb(230, 126, 34);\">推荐指数：★★★★★</span></p><p>【那拉提空中草原】（游览时间约 3.5小时），它是世界四大草原之一的亚高山草甸植物区，自古以来就是著名的牧场；独特的自然景观、悠久的历史文化和浓郁的民族风情构成了独具特色的边塞风光。在这里沐浴草原温柔和煦的阳光，呼吸微风中弥漫的花朵的芬芳，让您领略浓郁纯正的草原自然景观，自费骑马驰骋在辽远的草原上，领略哈萨克族的自由奔放。</p><p><strong style=\"color: rgb(155, 89, 182);\">薰衣草基地</strong></p><p><span style=\"color: rgb(230, 126, 34);\">推荐指数：★★★★★</span></p><p><span style=\"color: rgb(216, 27, 67);\">小宇</span>&nbsp;【薰衣草基地】（游览约50分钟）这里地处天山北麓伊犁河谷，与世界著名薰衣草原产地法国普罗旺斯的地理位置、气候条件和土壤环境非常相似，因而这里汇集了包括薰衣草引种育苗、标准化种植、GMP 生产加工、产品展示、大地景观、香草品种园以及薰衣草文化传播等薰衣草全产业展示的主题观光产业园区。</p><p><strong style=\"color: rgb(142, 68, 173);\">赛里木湖</strong></p><p><span style=\"color: rgb(211, 84, 0);\">推荐指数：★★★★★</span></p><p>进入景区参观【赛里木湖】（游览约3.5小时）她是大西洋最后一滴眼泪，却是东西连绵三万米，纵横二万五千米的高山湖泊。她的湖水湛蓝如碧，波光粼粼，天空云卷云舒，岸边骏马奔驰，到处洋溢着诗情画意。</p>', '出游时间：每年的6-8月份是最合适不过了；新疆旅游线路选择（请往下看）；关于新疆旅游费用。关键看怎么玩：以10天为例：如果自己不做攻略任性玩大约8千-1万/人；做好攻略再去大约7千-8千/人；如果找小宇 接待只需要3千多元到四千元左右', 'http://localhost:8080/img/17232967287721.png', '超级管理员', '2024-06-13 11:40:39', '超级管理员', '2024-08-10 21:32:13');
INSERT INTO `sys_line` (`id`, `temperature`, `geography`, `name`, `content`, `introduce`, `images`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1801096646405996546', 20, '热带喀斯特地貌', '近期计划去广西桂林旅游，想问一下怎么玩轻松？有啥省钱玩法？有哪些精华必去景点，介绍详细的玩法', '<p><strong style=\"background-color: rgb(243, 156, 18); color: rgb(0, 0, 0);\">一、省钱省心攻略&nbsp;</strong></p><p>上次我们到广西桂林玩了7天，我们是不想找旅行社的。想找个口碑好的专业地导安排，省心也省钱！在桂林旅游局工作的朋友介绍一位桂林本地导游小欣，她在桂林地区很有名，桂林市优秀导游和广西省文明导游员，小欣给我们安排5天4晚的行程：1000多点/人。</p><p>包含：<strong>4晚星级酒店住宿，5天全程商务车接送，所有景点门票，5天正餐美食、5A导游管家式服务、保险等</strong>！</p><p>想去桂林旅游的朋友建议先加小欣咨询一下，2024年最新景区的免费购票政策，酒店预订也可以咨询小欣，她拿到价格比在某团更便宜！多对比问问不会吃亏！不合适就当交个朋友咯。</p><p><strong style=\"background-color: rgb(243, 156, 18); color: rgb(44, 62, 80);\">二、关于行程安排：</strong></p><p>“<span style=\"color: rgb(230, 126, 34);\">桂林山水甲天下，阳朔山水甲桂林</span>”，去桂林以看山看水为主，阳朔建议是必去的，小欣给我安排的路线行程给大家参考：</p><p><strong style=\"color: rgb(51, 102, 255);\">Day1：到桂林，小欣接站送酒店签订正规旅游合同，晚上自行去了两江四湖、日月双塔夜景</strong></p><p>我们是下午到达的桂林，晚了一些时间，但是到的时候，&nbsp;小欣安排接站的车还在等着，这点让我感觉很体贴，当天安排好住宿后，自由活动，美美的休息了一晚上，第二天好有精力游览桂林的美景。下图是为我们安排的酒店照片，是不是很温馨舒适。</p><p><strong style=\"color: rgb(51, 102, 255);\">Day2：龙脊梯田，住桂林</strong></p><p>早餐后游览世界梯田之冠--【龙脊梯田】（已含景区换车费用，游览时间很自由）龙脊梯田，雄浑壮阔的阶梯状田埂于天际边蔓延，是深度旅游的不二选择，其景色随四季变化而呈现异样风情，春如根根银带；夏如道道绿浪；秋如座座金塔；冬如级级冰阶。</p><p><strong style=\"color: rgb(51, 102, 255);\">Day3：兴坪漓江（20元人民币背景&nbsp;漓江最精华路段）-漓江竹筏（朝板山-马山），逍遥湖瀑布，特别安排高山流水长龙宴，赠送篝火晚会。</strong></p><p>早餐后，游览【漓江风光】-【兴坪佳境】（游览约1.5小时），兴坪漓江段是漓江最精华，风景最美的一段。</p><p>两岸群峰竞秀，碧水萦回，欣赏风景如画的兴坪佳境、20元人民币背景图案、黄布倒影等漓江绝色景观，亲身感受\"人在天上走，船在画中游\"的神奇仙境。</p><p>还有十里画廊沿路奇峰美景，田园秀色，如诗如画，阳朔自助旅游必去之地。</p><p><span style=\"color: rgb(51, 51, 51);\">然后游览漓江边最美、最清澈、最大的支流【遇龙河】开始乘竹筏漂流（</span><strong style=\"color: rgb(51, 51, 51);\">注：1米以下儿童、70岁以上老年人不能上筏、约40分钟</strong><span style=\"color: rgb(51, 51, 51);\">）环保、原生态游玩、由人工撑竹筏游览遇龙河。在竹筏上或欣赏两岸美景、或和旁边的竹筏打水仗、不管哪一种方式、都会让你觉得快乐、舒心。</span></p><p><strong style=\"color: rgb(51, 102, 255);\">Day4：少数民族古村寨---银子岩----住桂林</strong></p><p>【少数民族古寨】古老不宽的街道上铺着青石板，石板路两边是保存完好的老房子。石板路旁的房子多为青砖、青瓦的两层明清建筑，历史沧桑随处可见。古镇现在还保留着许多一批古老的手工作坊。感受侗族人的风土人情，探寻民族银匠精湛的工艺。</p><p><br></p><p><strong style=\"color: rgb(51, 102, 255);\">Day5：桂林城徽——象鼻山</strong></p><p>桂林城徽象鼻山（春晚分会场）—【象鼻山】，因酷似一只站在江边伸鼻豪饮漓江甘泉的巨象而得名，被人们称为桂林山水的象征。</p><p>“象鼻入水中，江上雾朦胧。”</p><p>象山以神奇著称，其神奇，首先是形神毕似，其次是在鼻腿之间造就一轮临水明月，构成了“象山水月”。</p><p>2017&nbsp;中央电视台春节晚会的场地选择在这里，就是看中了“象山水月”这水天一色的美丽景观。</p>', '现在桂林旅游景区优惠力度很大是真的吗？ \n\n是真的！！！我们这次去桂林旅游就享受了很大的优惠。2024年桂林旅游联合景区地接社推出免门票政策（象鼻山、两江四湖、漓江、遇龙河、十里画廊、阳朔西街，龙脊梯田）游客需提前向组团社提前预约免费套票！一定要提前预约哦！所以现在去桂林旅游特别划算！总结几点经验分享，耐心看完这篇足够了，省钱50%! ', 'http://localhost:8080/img/17182498247137638-21030216212a.jpg', '超级管理员', '2024-06-13 11:37:58', '超级管理员', '2024-06-20 14:17:22');
COMMIT;

-- ----------------------------
-- Table structure for sys_rotations
-- ----------------------------
DROP TABLE IF EXISTS `sys_rotations`;
CREATE TABLE `sys_rotations` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `image` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='轮播图';

-- ----------------------------
-- Records of sys_rotations
-- ----------------------------
BEGIN;
INSERT INTO `sys_rotations` (`id`, `image`) VALUES ('1822262986038951937', '/img/17232965786213883095699.png');
INSERT INTO `sys_rotations` (`id`, `image`) VALUES ('1822264267759534082', '/img/17232966314833683782144.png');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `login_account` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登陆账号',
  `user_type` int DEFAULT NULL COMMENT '用户类型（0：系统 1：用户 2：律师）',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `tel` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `sex` int DEFAULT '0' COMMENT '性别（0：男 1：女）',
  `avatar` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '头像',
  `password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '盐值',
  `status` int DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `user_name`, `login_account`, `user_type`, `email`, `tel`, `sex`, `avatar`, `password`, `salt`, `status`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES ('0de96461b6ef0328cef416dea9366c9c', '杭州水果捞', 'user', 1, '123@qq.com', '18677777777', 0, '/img/1723297404622.jpg', '776998b8c72d46458f1a2b3f7e37f83b', 'a90fcb42324744318c6822abd2b1801c', 0, NULL, '2024-04-09 21:34:26', NULL, '2024-04-09 21:34:26', '杭州水果捞', '2024-08-10 21:43:25', NULL);
INSERT INTO `user` (`id`, `user_name`, `login_account`, `user_type`, `email`, `tel`, `sex`, `avatar`, `password`, `salt`, `status`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES ('1697436716646531073', '超级管理员', 'admin', 0, '1234@qq.com', '18677777778', 0, '/img/1723339622215.png', 'da62f5c8b8f341fea4bdb777b6af63ce', 'e67b3f5f178f15cc76a5dc1867a16653', 0, '2024-03-26 15:17:29', '2024-08-11 09:26:43', '超级管理员', '2024-03-26 15:17:34', '超级管理员', '2024-08-11 09:27:02', NULL);
INSERT INTO `user` (`id`, `user_name`, `login_account`, `user_type`, `email`, `tel`, `sex`, `avatar`, `password`, `salt`, `status`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES ('d97f5bcc9b06e080d743554ef38b2b2d', 'user2', 'user2', 1, '1@qq.com', '123455678', 0, '/img/1697436716646531073.jpeg', '4c90a82143c545ad976a87d5b27078ad', '2202ed25c79d5c982ac9f263a9a5c22a', 0, NULL, '2024-08-11 10:32:04', NULL, '2024-08-11 10:32:04', NULL, '2024-08-11 10:32:04', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
