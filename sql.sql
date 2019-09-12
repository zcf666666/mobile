/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.10.15
 Source Server Type    : MySQL
 Source Server Version : 50645
 Source Host           : 192.168.10.15:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50645
 File Encoding         : 65001

 Date: 12/09/2019 16:15:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_chart
-- ----------------------------
DROP TABLE IF EXISTS `t_chart`;
CREATE TABLE `t_chart`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `lottery_num` int(8) NULL DEFAULT NULL COMMENT '开奖期数',
  `lottery_type` int(2) NULL DEFAULT NULL COMMENT '彩种类型 （0 七乐彩 1大乐透 2排列三 3双色球 4福彩3D)',
  `lottery_f_no` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '前N位,使用‘-’隔开',
  `lottery_m_no` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '中间N位,使用‘-’隔开',
  `lottery_b_no` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '后N位,使用‘-’隔开',
  `lottery_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '完整数据源',
  `create_date` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_lottery_num`(`lottery_num`) USING BTREE,
  INDEX `idx_type`(`lottery_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '此表用于爬虫获取走势镂空记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_chart
-- ----------------------------
INSERT INTO `t_chart` VALUES ('1', 2019829, 3, '01-02-03-25-05-06-07-33-10-31-28-31-33-26-14-28-25-08-11-06-26-22-10-29-03-22-27-16-21-22-04-07-16', NULL, '07-09-14-11-12-10-08-02-09-01-11-15-01-13-13-12', NULL, '2019-09-09 11:02:45');
INSERT INTO `t_chart` VALUES ('10', 2019936, 4, '3-1-2-8-5-4-1-1-7-6', '5-7-1-3-4-5-6-2-6-6', '6-5-8-8-7-5-6-7-3-9', NULL, '2019-09-09 11:09:21');
INSERT INTO `t_chart` VALUES ('11', 2019831, 0, '01-02-03-25-05-06-07-08-10-31-28-31-33-26-15-28-25-08-11-06-26-22-10-29-03-22-27-16-21-08', NULL, '', NULL, '2019-09-09 11:02:45');
INSERT INTO `t_chart` VALUES ('12', 2019832, 0, '01-02-03-25-05-06-07-33-09-31-28-31-33-26-14-28-25-18-11-06-26-22-10-29-25-22-27-16-21-02', NULL, '', NULL, '2019-09-09 11:02:45');
INSERT INTO `t_chart` VALUES ('2', 2019931, 1, '28-35-22-34-05-12-22-08-29-10-28-07-30-10-11-22-13-26-29-10-14-05-23-21-25-20-06-18-04-07-20-02-16-02-18', NULL, '08-02-02-09-10-06-09-10-09-10-09-06', NULL, '2019-09-09 11:06:50');
INSERT INTO `t_chart` VALUES ('3', 2019931, 2, '4-1-5-8-4-3-4-4-4-6', '2-8-7-1-4-4-4-8-5-6', '1-8-4-5-7-7-4-7-5-9', NULL, '2019-09-09 11:09:17');
INSERT INTO `t_chart` VALUES ('4', 2019932, 2, '3-8-2-8-5-4-1-1-7-6', '5-7-1-3-5-1-6-2-6-6', '6-5-8-8-7-5-1-7-3-6', NULL, '2019-09-09 11:09:21');
INSERT INTO `t_chart` VALUES ('5', 2019933, 2, '7-1-2-5-2-6-3-3-8-6', '4-6-3-7-4-4-1-1-7-6', '2-3-5-1-2-7-5-6-8-9', NULL, '2019-09-09 11:12:43');
INSERT INTO `t_chart` VALUES ('6', 2019934, 2, '2-1-7-6-4-2-4-6-2-6', '3-1-2-8-4-4-1-2-3-6', '6-5-3-5-2-3-7-3-1-9', NULL, '2019-09-09 11:12:47');
INSERT INTO `t_chart` VALUES ('7', 2019830, 3, '01-23-31-25-01-06-02-08-09-12-28-12-33-26-14-28-25-08-11-06-26-22-10-29-25-22-27-16-21-22-04-07-16', NULL, '07-09-14-11-05-10-08-02-09-01-05-15-01-13-13-12', NULL, '2019-09-09 11:02:45');
INSERT INTO `t_chart` VALUES ('8', 2019930, 1, '01-02-03-25-05-06-07-33-10-31-28-12-33-26-14-28-25-08-11-06-26-22-10-29-03-22-27-16-21-22-04-07-16-02-18', NULL, '01-02-02-09-10-04-09-10-09-07-09-12', NULL, '2019-09-09 11:02:45');
INSERT INTO `t_chart` VALUES ('9', 2019935, 4, '4-1-5-8-4-3-4-4-4-6', '2-8-7-1-5-5-4-8-5-6', '1-8-4-5-7-7-6-7-5-9', NULL, '2019-09-09 11:09:17');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键Id',
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的id',
  `post_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被评论的文章资讯或者方案的Id',
  `comment` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论的内容',
  `is_enable` int(2) NULL DEFAULT NULL COMMENT '0可用 1 禁用',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '添加时间',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_post_id`(`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '此表用于记录用户评论的文章帖子方案记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('0bcedd07fb8d44b2b6a5266fb50d8dbe', 'f9f4137792484fd282878e2f1e1368b6', '1', '这个方案好腻害', 0, '2019-09-04 09:06:10', NULL);
INSERT INTO `t_comment` VALUES ('0ce677ddfe1c45ddb4d118af44fe6f6c', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '111', 0, '2019-09-09 16:08:31', NULL);
INSERT INTO `t_comment` VALUES ('1', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '这个方案很赞', 0, '2019-09-04 14:57:22', NULL);
INSERT INTO `t_comment` VALUES ('2', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '哎呦，搓得很', 0, '2019-09-04 14:57:22', NULL);
INSERT INTO `t_comment` VALUES ('298bea5f35ba4e2ea6d929e42d006029', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '这个', 0, '2019-09-09 16:27:53', NULL);
INSERT INTO `t_comment` VALUES ('376a126e1d9346d7a707d750db288413', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '呢哇', 0, '2019-09-09 16:30:24', NULL);
INSERT INTO `t_comment` VALUES ('5a27847765b340159c88c0be37ab73a8', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '测试', 0, '2019-09-09 16:24:56', NULL);
INSERT INTO `t_comment` VALUES ('5efc4770d847483cbe50131db5cda55c', '54c1f4bbe0d744ffa328cadb87cbc6c8', '99999521b1e441dc9c7a867f27684032', '1111', 0, '2019-09-12 13:48:18', NULL);
INSERT INTO `t_comment` VALUES ('7b46ca11713848d8b62f77f135a63d47', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '444', 0, '2019-09-09 16:05:31', NULL);
INSERT INTO `t_comment` VALUES ('8197c8929b114c6687a5df3e372846b8', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '3333', 0, '2019-09-09 16:10:17', NULL);
INSERT INTO `t_comment` VALUES ('862179d896b64de0b15026042de8e2b3', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '333', 0, '2019-09-09 16:00:27', NULL);
INSERT INTO `t_comment` VALUES ('938e545f6274420c97b25b6c2d6939cf', '54c1f4bbe0d744ffa328cadb87cbc6c8', '910', '测试评论', 0, '2019-09-09 16:14:22', NULL);
INSERT INTO `t_comment` VALUES ('954c33ea05c54e6e97c7d4ac280f4d30', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '新城', 0, '2019-09-09 16:26:05', NULL);
INSERT INTO `t_comment` VALUES ('a55944182a464fdbacd7d72657215352', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '111', 0, '2019-09-09 16:08:49', NULL);
INSERT INTO `t_comment` VALUES ('ad12189bb548421299294be5ad4c6f5e', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '1111', 0, '2019-09-09 16:24:51', NULL);
INSERT INTO `t_comment` VALUES ('c14cc895bbc8453f9832c5daec3c5967', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '111', 0, '2019-09-09 16:24:01', NULL);
INSERT INTO `t_comment` VALUES ('d6a745b029c844a6b10a39458141d03f', '54c1f4bbe0d744ffa328cadb87cbc6c8', '1', '测试', 0, '2019-09-09 16:22:19', NULL);

-- ----------------------------
-- Table structure for t_concern
-- ----------------------------
DROP TABLE IF EXISTS `t_concern`;
CREATE TABLE `t_concern`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户uid',
  `lottery_type` int(2) NULL DEFAULT NULL COMMENT '彩种类型 （0 七乐彩 1大乐透 2排列三 3双色球 4福彩3D)',
  `is_concern` int(1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '0关注 1取关',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '此表用于用户的关注彩种类型' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_concern
-- ----------------------------
INSERT INTO `t_concern` VALUES ('0a29cc6a25a64185954c0b80f6a2f556', '54c1f4bbe0d744ffa328cadb87cbc6c8', 1, 0, '2019-09-12 13:40:15', NULL, NULL);
INSERT INTO `t_concern` VALUES ('3047d0b2728642d489d1b0d56209730f', '54c1f4bbe0d744ffa328cadb87cbc6c8', 2, 0, '2019-09-12 13:40:13', NULL, NULL);
INSERT INTO `t_concern` VALUES ('9806f5ce1127401d96774c3ef8679f33', '54c1f4bbe0d744ffa328cadb87cbc6c8', 4, 1, '2019-09-12 13:40:18', NULL, NULL);
INSERT INTO `t_concern` VALUES ('e7d535e453cd4c70bd33abe1bd64673c', '54c1f4bbe0d744ffa328cadb87cbc6c8', 3, 0, '2019-09-12 13:35:41', NULL, NULL);

-- ----------------------------
-- Table structure for t_fans
-- ----------------------------
DROP TABLE IF EXISTS `t_fans`;
CREATE TABLE `t_fans`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关注uid',
  `status` int(1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '0未互粉1互粉',
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_cuid`(`cuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '此表是粉丝表，记录关注与被关注的关联关系，1 关注数是指我关注多少人  2粉丝是指多少人关注我  3 相互关注就要更新两人的状态为互粉' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_fans
-- ----------------------------
INSERT INTO `t_fans` VALUES ('4347605730a24a96872299a980d340bc', '54c1f4bbe0d744ffa328cadb87cbc6c8', 0);

-- ----------------------------
-- Table structure for t_favorite
-- ----------------------------
DROP TABLE IF EXISTS `t_favorite`;
CREATE TABLE `t_favorite`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户Id',
  `post_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收藏的文案帖子方案的id',
  `file_type` int(2) NULL DEFAULT NULL COMMENT '0资讯1帖子 2方案与文件表文件对应',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_post_id`(`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '此表用于客户收藏的帖子方案记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_favorite
-- ----------------------------
INSERT INTO `t_favorite` VALUES ('ab2ac3f00d58456896b134fa953d1424', '54c1f4bbe0d744ffa328cadb87cbc6c8', '6', 2);

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户uid',
  `comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈内容',
  `contact` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈的联系方式',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '反馈时间',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_contact`(`contact`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户反馈记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户uid',
  `pi_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帖子资讯id',
  `scheme_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方案id',
  `file_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件fastdfs全路径',
  `linking_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接地址',
  `file_ext` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后缀',
  `file_type` int(20) NULL DEFAULT NULL COMMENT '0资讯1帖子 2方案 3彩种4头像5banner6专题封面',
  `pic_no` int(20) NULL DEFAULT NULL COMMENT '上传预留字段，顺序标号',
  `is_enable` int(2) NULL DEFAULT NULL COMMENT '0 可用 1禁用2 删除',
  `create_date` timestamp(0) NULL DEFAULT NULL,
  `update_date` timestamp(0) NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_pi_id`(`pi_id`) USING BTREE,
  INDEX `idx_scheme_id`(`scheme_id`) USING BTREE,
  INDEX `idx_file_name`(`file_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件表用于记录系统所有图片文件，按类型添加扩充' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_file
-- ----------------------------
INSERT INTO `t_file` VALUES ('00309b2b84b741ac861d4cee12e7f315', 'f9f4137792484fd282878e2f1e1368b6', NULL, 'f21b92cab4814c54860316171878da44', 'ct-1.png', 'group1/M00/00/00/wKgKD113MLSAK7JpAAEJ_ia1JeU202.png', NULL, 'png', 2, 1, 0, '2019-09-10 13:12:22', '2019-09-10 13:16:37', NULL);
INSERT INTO `t_file` VALUES ('0fde0ee25e434ad98c7185764f7182bd', 'f9f4137792484fd282878e2f1e1368b6', '100', NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112-iuANlIDAAEGL5MwJzg151.png', NULL, 'png', 0, 1, 0, '2019-09-10 11:50:19', NULL, NULL);
INSERT INTO `t_file` VALUES ('1', NULL, NULL, NULL, '首页banner', 'group1/M00/00/00/wKgKD112-iuANlIDAAEGL5MwJzg151.png', 'https://www.baidu.com', 'jpg', 5, 1, 0, '2019-09-09 15:59:23', NULL, NULL);
INSERT INTO `t_file` VALUES ('1e61b8615f584d73b46e00bbec98ce26', 'f9f4137792484fd282878e2f1e1368b6', '200', NULL, 'ex1.png', 'group1/M00/00/00/wKgKD112-iuANlIDAAEGL5MwJzg151.png', NULL, 'png', 0, 1, 0, '2019-09-10 13:58:54', NULL, NULL);
INSERT INTO `t_file` VALUES ('2', NULL, NULL, NULL, '首页banner', 'group1/M00/00/00/wKgKD113UnKAPZhFAAGgfPB4b2U993.png', 'https://weibo.com', 'jpg', 5, 2, 0, '2019-09-09 15:59:23', NULL, NULL);
INSERT INTO `t_file` VALUES ('240cdb79fcff446e9a2e0acb2affd719', 'f9f4137792484fd282878e2f1e1368b6', '300', NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112-iuANlIDAAEGL5MwJzg151.png', NULL, 'png', 0, 1, 0, '2019-09-10 11:24:13', NULL, NULL);
INSERT INTO `t_file` VALUES ('3', NULL, NULL, NULL, '首页banne', 'group1/M00/00/00/wKgKD112-iuANlIDAAEGL5MwJzg151.png', 'https://github.com', 'jpg', 5, 3, 0, '2019-09-09 16:40:31', '2019-09-09 16:41:15', NULL);
INSERT INTO `t_file` VALUES ('346b2def42614392ba6b28cbbc9826c0', 'f9f4137792484fd282878e2f1e1368b6', '400', NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112-XmAHYM6AAEGL5MwJzg891.png', NULL, 'png', 0, 1, 0, '2019-09-10 09:16:43', NULL, NULL);
INSERT INTO `t_file` VALUES ('3c85e4049687485a9e6067cea000c9d6', 'f9f4137792484fd282878e2f1e1368b6', '500', NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD113ADyAStLhAAEGL5MwJzg891.png', NULL, 'png', 0, 1, 0, '2019-09-10 09:45:33', NULL, NULL);
INSERT INTO `t_file` VALUES ('3eeb7655274b421f8fb0da7f088046e9', 'f9f4137792484fd282878e2f1e1368b6', '600', NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112-ZmAWqtaAAEGL5MwJzg734.png', NULL, 'png', 0, 1, 0, '2019-09-10 09:17:14', NULL, NULL);
INSERT INTO `t_file` VALUES ('4', '4347605730a24a96872299a980d340bc', '', '', '头像', 'group1/M00/00/00/wKgKD112D-GAFt-yAADFJVKpPkk458.jpg', NULL, 'jpg', 4, 1, 0, '2019-09-09 17:20:27', NULL, NULL);
INSERT INTO `t_file` VALUES ('5484642dbf354b689d6de95b7bfd1d03', 'f9f4137792484fd282878e2f1e1368b6', '700', NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112-cyAX1FqAAEGL5MwJzg444.png', NULL, 'png', 0, 1, 0, '2019-09-10 09:18:05', NULL, NULL);
INSERT INTO `t_file` VALUES ('5ab0022bb82d4147b061d19a477d5cc0', 'f9f4137792484fd282878e2f1e1368b6', '800', NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD113AGmAFG1HAAEGL5MwJzg367.png', NULL, 'png', 0, 1, 0, '2019-09-10 09:46:19', NULL, NULL);
INSERT INTO `t_file` VALUES ('6e03f6f0d18c4c4d874c4c338130dc56', 'f9f4137792484fd282878e2f1e1368b6', '900', NULL, 'bg-wode.png', 'group1/M00/00/00/wKgKD113UnKAPZhFAAGgfPB4b2U993.png', NULL, 'png', 0, 1, 0, '2019-09-10 15:36:20', NULL, NULL);
INSERT INTO `t_file` VALUES ('7fd4e22f8ff94f3f8563b33d202dff06', 'f9f4137792484fd282878e2f1e1368b6', '910', NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112_ZiAbyInAAEGL5MwJzg559.png', NULL, 'png', 0, 1, 0, '2019-09-10 09:34:06', '2019-09-10 09:34:18', NULL);
INSERT INTO `t_file` VALUES ('8228fd33cedf48d69128f1490c19a574', 'f9f4137792484fd282878e2f1e1368b6', '911', NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112-9CAJJ-lAAEGL5MwJzg781.png', NULL, 'png', 0, 1, 0, '2019-09-10 09:26:41', NULL, NULL);
INSERT INTO `t_file` VALUES ('87be6953f9654d838664d3b6d694284d', 'f9f4137792484fd282878e2f1e1368b6', '912', NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112-iuANlIDAAEGL5MwJzg151.png', NULL, 'png', 0, 1, 0, '2019-09-10 09:19:41', NULL, NULL);
INSERT INTO `t_file` VALUES ('a46d410a64b7427980476d93f19f9ad6', 'f9f4137792484fd282878e2f1e1368b6', '100', NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112D-GAFt-yAADFJVKpPkk458.jpg', NULL, 'png', 0, 2, 0, '2019-09-10 09:23:55', NULL, NULL);
INSERT INTO `t_file` VALUES ('abc2ac762c0d41ba9d5211c4f62727aa', 'f9f4137792484fd282878e2f1e1368b6', '200', NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112_TqAOQxrAAD-DkzOAK8154.png', NULL, 'png', 0, 2, 0, '2019-09-10 09:32:43', NULL, NULL);
INSERT INTO `t_file` VALUES ('b1d1f82afc3b443b90aef61c1f3c61d9', 'f9f4137792484fd282878e2f1e1368b6', '300', NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD113F4CAfWGpAAEGL5MwJzg312.png', NULL, 'png', 0, 2, 0, '2019-09-10 11:24:50', NULL, NULL);
INSERT INTO `t_file` VALUES ('b99f8baacb31440baa529d949fa86b41', 'f9f4137792484fd282878e2f1e1368b6', NULL, NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112-qOAc_GHAAEGL5MwJzg490.png', NULL, 'png', 0, 1, 0, '2019-09-10 09:21:40', NULL, NULL);
INSERT INTO `t_file` VALUES ('bbcbe2aa7d0f4d478fe286d65203dab6', 'f9f4137792484fd282878e2f1e1368b6', NULL, NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD113AzuAD9otAAEGL5MwJzg044.png', NULL, 'png', 0, 1, 0, '2019-09-10 09:58:20', NULL, NULL);
INSERT INTO `t_file` VALUES ('be033ba9161b402fab61a6cbac52675d', 'f9f4137792484fd282878e2f1e1368b6', NULL, NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112-CmAX6kVAAEGL5MwJzg340.png', NULL, 'png', 0, 1, 0, '2019-09-10 09:11:06', NULL, NULL);
INSERT INTO `t_file` VALUES ('c3d9afd87d99448d9112263ae4c837d5', 'f9f4137792484fd282878e2f1e1368b6', NULL, NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112_JeAZr_VAAEGL5MwJzg819.png', NULL, 'png', 0, 1, 0, '2019-09-10 09:30:00', NULL, NULL);
INSERT INTO `t_file` VALUES ('d522527ae7a84e0cb1d23cedbf8c9bc6', 'f9f4137792484fd282878e2f1e1368b6', NULL, 'f8412c34a2ed4319a0f7c8e22b7ee0bb', 'ex1.png', 'group1/M00/00/00/wKgKD113SNKAdF_ZAAAehRC_m6M008.png', NULL, 'png', 2, 1, 0, '2019-09-10 14:55:15', '2019-09-10 15:01:00', NULL);
INSERT INTO `t_file` VALUES ('d8ec0a7c8e2f4e85ad3f6bc34d086887', 'f9f4137792484fd282878e2f1e1368b6', NULL, '99999521b1e441dc9c7a867f27684032', 'bg-wode.png', 'group1/M00/00/00/wKgKD113VjqAUcYJAAGgfPB4b2U970.png', NULL, 'png', 2, 1, 0, '2019-09-10 15:52:28', '2019-09-10 16:03:07', NULL);
INSERT INTO `t_file` VALUES ('d9c811d937f74b8e8e8b88f55894f695', 'f9f4137792484fd282878e2f1e1368b6', NULL, NULL, 'bg-wode.png', 'group1/M00/00/00/wKgKD113UnKAd3DiAAGgfPB4b2U973.png', NULL, 'png', 0, 1, 0, '2019-09-10 15:36:20', NULL, NULL);
INSERT INTO `t_file` VALUES ('dfb39d861aba46169b293751857bfe0b', 'f9f4137792484fd282878e2f1e1368b6', NULL, NULL, 'ct-1.png', 'group1/M00/00/00/wKgKD112_FSAKy0HAAEGL5MwJzg034.png', NULL, 'png', 0, 1, 0, '2019-09-10 09:28:54', NULL, NULL);
INSERT INTO `t_file` VALUES ('fee68c44763c49fc8819aaf7eab46c8e', 'f9f4137792484fd282878e2f1e1368b6', NULL, NULL, 'ex1.png', 'group1/M00/00/00/wKgKD113QY-AGPgFAAAeiah0d6A107.png', NULL, 'png', 0, 1, 0, '2019-09-10 14:24:16', NULL, NULL);

-- ----------------------------
-- Table structure for t_lottery
-- ----------------------------
DROP TABLE IF EXISTS `t_lottery`;
CREATE TABLE `t_lottery`  (
  `id` int(3) NOT NULL COMMENT '彩种ID，与其它表id或者类型相对应',
  `lottery_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '彩种名称',
  `lottery_referral` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '彩种介绍',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_lottery_name`(`lottery_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '此表是彩种信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_lottery
-- ----------------------------
INSERT INTO `t_lottery` VALUES (0, '七乐彩', '七乐彩是一种彩票', '2019-08-27 09:57:17', '2019-08-27 09:57:20', NULL);
INSERT INTO `t_lottery` VALUES (1, '大乐透', '大乐透是一种彩票', '2019-08-27 09:58:46', '2019-08-27 09:58:57', NULL);
INSERT INTO `t_lottery` VALUES (2, '排列3', '排列3是一种彩票', '2019-08-27 09:58:49', '2019-08-27 09:58:59', NULL);
INSERT INTO `t_lottery` VALUES (3, '双色球', '双色球是一种彩票', '2019-08-27 09:58:51', '2019-08-27 09:59:01', NULL);
INSERT INTO `t_lottery` VALUES (4, '福彩3D', '福彩3D是一种彩票', '2019-08-27 09:58:53', '2019-08-27 09:59:04', NULL);

-- ----------------------------
-- Table structure for t_lottery_info
-- ----------------------------
DROP TABLE IF EXISTS `t_lottery_info`;
CREATE TABLE `t_lottery_info`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lottery_id` int(3) NULL DEFAULT NULL COMMENT '彩种类型',
  `lottery_full_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用‘-’隔开',
  `lottery_num` int(8) NULL DEFAULT NULL COMMENT '开奖期数',
  `lottery_f_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用‘-’隔开',
  `lottery_m_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用‘-’隔开',
  `lottery_b_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用‘-’隔开',
  `lottery_status` int(1) NULL DEFAULT NULL COMMENT '0待跑批 1已跑批2跑批失败',
  `lottery_date` timestamp(0) NULL DEFAULT NULL,
  `create_date` timestamp(0) NULL DEFAULT NULL,
  `update_date` timestamp(0) NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_lottery_id`(`lottery_id`) USING BTREE,
  INDEX `idx_lottery_num`(`lottery_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '此表用于爬取每期中奖信息记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_lottery_info
-- ----------------------------
INSERT INTO `t_lottery_info` VALUES ('1', 3, '07-06-05-03-02-01-11', 2019829, '07-06-05-03-02-01', NULL, '11', 1, '2019-09-09 14:53:07', '2019-09-09 14:53:22', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_lottery_info` VALUES ('10', 0, '08-06-05-02-03-01-22-15', 2019831, '07-06-05-03-02-01-22', NULL, '18', 1, '2019-09-10 17:58:59', '2019-09-11 17:59:14', '2019-09-12 10:10:00', NULL);
INSERT INTO `t_lottery_info` VALUES ('11', 0, '07-25-09-03-02-01-22-18', 2019832, '07-06-05-03-02-01-22', NULL, '18', 1, '2019-09-10 17:58:59', '2019-09-11 17:59:14', '2019-09-12 10:10:00', NULL);
INSERT INTO `t_lottery_info` VALUES ('12', 4, '1-4-9', 2019936, '1', '4', '9', 1, '2019-09-10 13:35:50', '2019-09-10 13:35:55', '2019-09-12 10:01:12', NULL);
INSERT INTO `t_lottery_info` VALUES ('2', 1, '07-06-05-03-02-01-12', 2019930, '07-06-05-03-02', NULL, '01-12', 1, '2019-09-03 09:48:18', '2019-09-03 09:48:21', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_lottery_info` VALUES ('3', 2, '1-4-9', 2019931, '1', '4', '9', 1, '2019-09-03 10:03:58', '2019-09-03 10:04:01', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_lottery_info` VALUES ('4', 2, '2-3-5', 2019932, '2', '3', '5', 1, '2019-09-03 10:03:58', '2019-09-09 10:04:01', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_lottery_info` VALUES ('5', 2, '1-4-9', 2019933, '1', '4', '9', 1, '2019-09-03 10:03:58', '2019-09-03 10:04:01', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_lottery_info` VALUES ('6', 2, '1-4-9', 2019934, '1', '4', '9', 1, '2019-09-03 10:03:58', '2019-09-03 10:04:01', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_lottery_info` VALUES ('7', 4, '1-5-6', 2019935, '1', '5', '6', 1, '2019-09-10 13:35:50', '2019-09-10 13:35:55', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_lottery_info` VALUES ('8', 1, '05-08-25-23-10-06-10', 2019931, '05-08-25-23-10', NULL, '06-10', 1, '2019-09-10 15:11:37', '2019-09-10 15:11:40', '2019-09-12 09:56:39', NULL);
INSERT INTO `t_lottery_info` VALUES ('9', 3, '08-06-12-01-09-25-05', 2019830, '08-06-12-25-09-25', NULL, '05', 1, '2019-09-10 16:06:10', '2019-09-10 16:06:19', '2019-09-12 09:56:39', NULL);

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户id',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `type` int(2) NULL DEFAULT NULL COMMENT '0通知 1公告',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `is_enable` int(2) NULL DEFAULT NULL COMMENT '0启用 禁用',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '此表用于记录平台通知以及系统公告' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', NULL, '排列三介绍', 1, '排列三是一种彩票', 0, '2019-09-10 14:18:38', NULL);
INSERT INTO `t_notice` VALUES ('2', NULL, '排列三介绍,央视财经栏目组特邀著名彩票分析专家xxx,讲解关于当前热门彩票的相关套路', 1, '排列三是一种彩票1', 0, '2019-09-24 14:18:38', NULL);
INSERT INTO `t_notice` VALUES ('3', NULL, '排列三介绍', 1, '排列三是一种彩票2', 0, '2019-09-05 14:18:38', NULL);

-- ----------------------------
-- Table structure for t_post_info
-- ----------------------------
DROP TABLE IF EXISTS `t_post_info`;
CREATE TABLE `t_post_info`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键Id',
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `comment` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `type` int(2) NULL DEFAULT NULL COMMENT '0 帖子 1置顶资讯  2最新资讯 3热门资讯 4专题',
  `lottery_type` int(2) NULL DEFAULT NULL COMMENT '彩种类型',
  `is_enable` int(2) NULL DEFAULT NULL COMMENT '0可用 1禁用',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '此表用于记录客户发帖以及咨询内容记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_post_info
-- ----------------------------
INSERT INTO `t_post_info` VALUES ('100', NULL, '专题', '关于大乐透的信息', '大乐透是一种彩种', 4, 1, 0, '2019-09-10 09:36:33', NULL, NULL);
INSERT INTO `t_post_info` VALUES ('200', NULL, '专题', '关于双色球的信息', '双色球是一种彩种', 4, 3, 0, '2019-09-11 10:36:33', NULL, NULL);
INSERT INTO `t_post_info` VALUES ('300', NULL, '专题', '关于排列三的信息', '排列三是一种彩种', 4, 2, 0, '2019-09-08 09:36:33', NULL, NULL);
INSERT INTO `t_post_info` VALUES ('400', NULL, '置顶资讯', '沪男子买彩票中1000万', '据相关报道有位在沪工作的普通人在国庆期间中奖1000万，但是是日元，从大喜瞬间转成大悲，这一切是那么的快', 1, NULL, 0, '2019-09-11 09:44:34', NULL, NULL);
INSERT INTO `t_post_info` VALUES ('500', NULL, '置顶资讯', '沪女子韩国整容失败，幸运的是中彩票500万', '据悉沪女子去韩国整形，遇黑诊所，期间诊所在送彩票，该女子整形费18.8万，但是整形失败致毁容，但是幸运的是彩票中了500万韩元，目前该女子在纠结是用500万韩元继续换家医院整形，还是对黑诊所提起诉讼', 1, NULL, 0, '2019-09-10 09:44:42', NULL, NULL);
INSERT INTO `t_post_info` VALUES ('600', NULL, '置顶资讯', '沪政要人员中彩票疑似暗箱操作', '近日沪某区内政府要员家人买彩票中大奖，但是开奖前几天被媒体拍到遇彩票高管把酒言欢，甚是神秘，不知此次事件是一次幸运女神的天降横财，还是里外勾结的权色交易', 1, NULL, 0, '2019-09-04 09:44:38', NULL, NULL);
INSERT INTO `t_post_info` VALUES ('700', NULL, '最新资讯', '测试数据1', '测试数据123', 2, NULL, 0, '2019-09-11 10:08:04', NULL, NULL);
INSERT INTO `t_post_info` VALUES ('800', NULL, '最新资讯', '测试数据2', '测试数据456', 2, NULL, 0, '2019-09-10 10:08:08', NULL, NULL);
INSERT INTO `t_post_info` VALUES ('900', NULL, '最新资讯', '测试数据3', '测试数据789', 2, NULL, 0, '2019-09-09 10:09:27', NULL, NULL);
INSERT INTO `t_post_info` VALUES ('910', NULL, '热门资讯', '测试数据1', '测试数据123aaa', 3, NULL, 0, '2019-09-11 10:08:04', NULL, NULL);
INSERT INTO `t_post_info` VALUES ('911', NULL, '热门资讯', '测试数据2', '测试数据456bbb', 3, NULL, 0, '2019-09-10 10:08:08', NULL, NULL);
INSERT INTO `t_post_info` VALUES ('912', NULL, '热门资讯', '测试数据3', '测试数据789ccc', 3, NULL, 0, '2019-09-09 10:09:27', NULL, NULL);

-- ----------------------------
-- Table structure for t_professor
-- ----------------------------
DROP TABLE IF EXISTS `t_professor`;
CREATE TABLE `t_professor`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专家uid',
  `lottery_genre` int(2) NULL DEFAULT NULL COMMENT '0 七乐彩 1大乐透 2排列3  3 双色球 4 福彩3D',
  `pfr_referral` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '专家介绍',
  `prf_tip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专家标签',
  `prf_rate` decimal(10, 4) NULL DEFAULT NULL COMMENT '专家胜率',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专家个人信息记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_professor
-- ----------------------------
INSERT INTO `t_professor` VALUES ('1', '4347605730a24a96872299a980d340bc', 2, '测试1', '测试11', 0.0000, '2019-08-29 14:40:36', NULL);
INSERT INTO `t_professor` VALUES ('2', 'bede2805dffc420bbba458b75a948fbe', 1, '测试11', '测试111', 50.0000, '2019-09-06 14:42:04', NULL);
INSERT INTO `t_professor` VALUES ('3', 'f9f4137792484fd282878e2f1e1368b6', 3, '测试333', '测试3333', 50.0000, '2019-08-22 14:43:18', NULL);
INSERT INTO `t_professor` VALUES ('4', 'bede2805dffc420bbba458b75a948abc', 4, '测试444', '测试444', 0.0000, '2019-09-11 18:04:43', NULL);

-- ----------------------------
-- Table structure for t_scheme
-- ----------------------------
DROP TABLE IF EXISTS `t_scheme`;
CREATE TABLE `t_scheme`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `scheme_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方案名称',
  `scheme_lottery_type` int(2) NULL DEFAULT NULL COMMENT '彩种',
  `scheme_periods` int(10) NULL DEFAULT NULL COMMENT '期数',
  `scheme_lottery_results` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前开奖结果',
  `scheme_full` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全号预测',
  `scheme_full_rs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全号结果',
  `scheme_genre_pd` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '专家类型预测',
  `scheme_genre_rs` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '专家预测结果',
  `scheme_status` int(1) NULL DEFAULT NULL COMMENT '0待预测 1预测成功 2预测失败',
  `scheme_dec` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方案描述',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_date` timestamp(0) NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_scheme_name`(`scheme_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_scheme
-- ----------------------------
INSERT INTO `t_scheme` VALUES ('1', 'f9f4137792484fd282878e2f1e1368b6', '双色球', 3, 2019829, '07-06-05-03-02-01-11', '08-06-04-03-02-01-22', '[{\"redBall\":[\"06\",\"03\",\"02\",\"01\"],\"schemeStatus\":1}]', '[{\"redTwoGallbladder\":\"03-06\",\"blueThreeGallbladder\":\"09-05-03\",\"schemeREty\":\"01-02-03-04-05-06-07-08-09-10-11-12-13-14-15-16-17-18\",\"blueKtGallbladder\":\"01-02-03\",\"blueGallbladder\":\"09\",\"schemePnix\":\"02\",\"schemeBibcock\":\"01\",\"redKtGallbladder\":\"12-23-18\",\"schemeRTy\":\"01-02-03-04-05-06-07-08-09-10-11-12\",\"blueKsGallbladder\":\"01-02-03-05-08-07\",\"redGallbladder\":\"26\",\"redKsGallbladder\":\"14-25-31\",\"redThreeGallbladder\":\"03-06-01\",\"blueTwoGallbladder\":\"09-05\",\"schemeRTf\":\"01-02-03-04-05-06-07-08-09-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24\",\"blueSixGallbladder\":\"09-05-03-01-12-15\",\"schemeREt\":\"01-02-03-04-05-06-07-08\"}]', '[{\"schemeRTyRs\":\"07-06-05-03-02-01\",\"twoGallbladderRsSucc\":false,\"rTfRsSucc\":true,\"blueThreeGallbladderRsSucc\":false,\"schemeREtyRs\":\"07-06-05-03-02-01\",\"pnixRsSucc\":false,\"blueGallbladderRsSucc\":false,\"rTyRsSucc\":true,\"bibcockRsSucc\":false,\"ksGallbladderRsSucc\":false,\"schemeRTfRs\":\"07-06-05-03-02-01\",\"blueSixGallbladderRsSucc\":false,\"schemeBibcockRs\":\"\",\"gallbladderRsSucc\":false,\"schemePnixRs\":\"\",\"ktGallbladdeRsrSucc\":true,\"threeGallbladderRsSucc\":true,\"blueSixGallbladderRs\":\"\",\"blueGallbladderRs\":\"\",\"retRsSucc\":true,\"blueKtGallbladderRsSucc\":true,\"rEtyRsSucc\":true,\"schemeREtRs\":\"07-06-05-03-02-01\",\"redKsGallbladderRs\":\"14-25-31\",\"redKtGallbladdeRsr\":\"12-23-18\",\"redThreeGallbladderRs\":\"06-03-01\",\"redGallbladderRs\":\"\",\"blueKtGallbladderRs\":\"01-02-03\",\"blueTwoGallbladderRs\":\"\",\"blueKsGallbladderRs\":\"01-02-03-05-08-07\",\"blueThreeGallbladderRs\":\"\",\"blueKsGallbladderRsSucc\":true,\"blueTwoGallbladderRsSucc\":false,\"redTwoGallbladderRs\":\"06-03-\"}]', 1, NULL, '2019-09-03 09:43:47', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_scheme` VALUES ('2', 'bede2805dffc420bbba458b75a948fbe', '大乐透', 1, 2019930, '07-06-05-03-02-01-12', '08-06-04-03-02-01-22', '[{\"redBall\":[\"06\",\"03\",\"02\"],\"blueBall\":[\"01\"],\"schemeStatus\":1}]', '[{\"schemeBtwogallbladder\":\"01-02\",\"schemeTy\":\"01-02-03-04-05-06-07-08-09-10-11-12\",\"schemeEty\":\"01-02-03-04-05-06-07-08-09-10-11-12-13-14-15-16-17-18\",\"schemeKtgallbladder\":\"18-15-11\",\"schemeTwogallbladder\":\"06-08\",\"schemeBfourgallbladder\":\"01-03-05-07\",\"schemeKbthreegallbladder\":\"15-16-17\",\"schemePnix\":\"26\",\"schemeBibcock\":\"01\",\"schemeBtgallbladder\":\"06\",\"schemeBsixgallbladder\":\"02-04-06-08-10-12\",\"schemeKsgallbladder\":\"18-15-11-21-25-28\",\"schemeKbsixgallbladder\":\"15-16-17-18-19-20\",\"schemeThreegallbladder\":\"06-12-33\",\"schemeTf\":\"01-02-03-04-05-06-07-08-09-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24\",\"schemeEt\":\"01-02-03-04-05-06-07-08\"}]', '[{\"threegallbladderRsSucc\":true,\"btwogallbladderRsSucc\":true,\"schemeEtyRs\":\"07-06-05-03-02\",\"kbthreegallbladderRsSucc\":true,\"schemeBfourgallbladderRs\":\"01-\",\"bibcockRsSucc\":false,\"schemeBtgallbladderRs\":\"06-\",\"schemeTyRs\":\"07-06-05-03-02\",\"etrRsSucc\":true,\"tfrsRsSucc\":true,\"bsixgallbladderRsSucc\":false,\"schemeBibcockRs\":\"\",\"etyrsRsSucc\":true,\"schemeBtwogallbladderRs\":\"01-\",\"schemeKbthreegallbladderRs\":\"15-16-17\",\"btgallbladderRsSucc\":true,\"twogallbladderRsSucc\":true,\"schemeTwogallbladderRs\":\"06-\",\"ktgallbladderRsSucc\":true,\"schemeEtRs\":\"07-06-05-03-02\",\"schemeKsgallbladderRs\":\"18-15-11-21-25-28\",\"schemeTfRs\":\"07-06-05-03-02\",\"schemeThreegallbladderRs\":\"06-\",\"schemeKtgallbladderRs\":\"18-15-11\",\"bfourgallbladderRsSucc\":true,\"tyrsRsSucc\":true,\"phixRsSucc\":false,\"schemeKbsixgallbladderRs\":\"15-16-17-18-19-20\",\"schemePhixRs\":\"\",\"ksgallbladderRsSucc\":true,\"schemeBsixgallbladderRs\":\"12\",\"kbsixgallbladderRsSucc\":true}]', 1, NULL, '2019-09-03 09:43:54', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_scheme` VALUES ('3', '4347605730a24a96872299a980d340bc', '排列三', 2, 2019931, '1-4-9', '4-1-9', '[{\"resultBalls\":\"1-4-9\"}]', '[{\"gallbladder\":\"9\",\"sumGallbladder\":\"8-16\",\"spanGallbladder\":\"2-7\",\"fiveGallbladder\":\"2-4-5-8-9\",\"bxPositionGb\":\"-4-\",\"groupHuntingGb\":\"8-6-3&9-6-4&6-8-4&1-4-9&6-6-6\",\"dbGallbladder\":\"3-6\",\"killThreeGallbladder\":\"1-6-3\",\"killGallbladder\":\"1\",\"killTwoGallbladder\":\"1-6\",\"threeGallbladder\":\"1-2-3\",\"sixGallbladder\":\"2-4-5-8--9-7\"}]', '[{\"sumGallbladderRsSucc\":false,\"sixGallbladderRsSucc\":false,\"bxPositionGbRsSucc\":true,\"killTwoGallbladderRsSucc\":false,\"gallbladderRs\":\"9\",\"threeGallbladderRs\":\"1-\",\"dbGallbladderRs\":\"\",\"dbGallbladderRsSucc\":false,\"spanGallbladderRs\":\"\",\"sixGallbladderRs\":\"4-9\",\"groupHuntingGbRsSucc\":true,\"killGallbladderRs\":\"\",\"killThreeGallbladderRs\":\"6-3\",\"killGallbladderRsSucc\":false,\"sumGallbladderRs\":\"\",\"gallbladderRsSucc\":true,\"groupHuntingGbRs\":\"1-4-9\",\"killThreeGallbladderRsSucc\":false,\"threeGallbladderRsSucc\":true,\"bxPositionGbRs\":\"-4-\",\"fiveGallbladderRsSucc\":true,\"spanGallbladderRsSucc\":false,\"fiveGallbladderRs\":\"4-9\",\"killTwoGallbladderRs\":\"6\"}]', 2, NULL, '2019-09-03 09:43:51', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_scheme` VALUES ('4', '4347605730a24a96872299a980d340bc', '排列三', 2, 2019932, '2-3-5', '4-1-9', '[{\"resultBalls\":\"\"}]', '[{\"gallbladder\":\"9\",\"sumGallbladder\":\"8-16\",\"spanGallbladder\":\"2-7\",\"fiveGallbladder\":\"2-4-5-8-9\",\"bxPositionGb\":\"-4-\",\"groupHuntingGb\":\"8-6-3&9-6-4&6-8-4&1-4-9&6-6-6\",\"dbGallbladder\":\"3-6\",\"killThreeGallbladder\":\"1-6-3\",\"killGallbladder\":\"1\",\"killTwoGallbladder\":\"1-6\",\"threeGallbladder\":\"1-2-3\",\"sixGallbladder\":\"2-4-5-8--9-7\"}]', '[{\"sumGallbladderRsSucc\":false,\"sixGallbladderRsSucc\":false,\"bxPositionGbRsSucc\":false,\"killTwoGallbladderRsSucc\":true,\"gallbladderRs\":\"\",\"threeGallbladderRs\":\"2-3-\",\"dbGallbladderRs\":\"3-\",\"dbGallbladderRsSucc\":true,\"spanGallbladderRs\":\"\",\"sixGallbladderRs\":\"2-5\",\"groupHuntingGbRsSucc\":false,\"killGallbladderRs\":\"1\",\"killThreeGallbladderRs\":\"1-6-\",\"killGallbladderRsSucc\":true,\"sumGallbladderRs\":\"\",\"gallbladderRsSucc\":false,\"groupHuntingGbRs\":\"\",\"killThreeGallbladderRsSucc\":false,\"threeGallbladderRsSucc\":true,\"bxPositionGbRs\":\"\",\"fiveGallbladderRsSucc\":true,\"spanGallbladderRsSucc\":false,\"fiveGallbladderRs\":\"2-5\",\"killTwoGallbladderRs\":\"1-6\"}]', 2, NULL, '2019-09-03 09:43:51', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_scheme` VALUES ('5', '4347605730a24a96872299a980d340bc', '排列三', 2, 2019933, '1-4-9', '4-1-9', '[{\"resultBalls\":\"1-4-9\"}]', '[{\"gallbladder\":\"9\",\"sumGallbladder\":\"8-16\",\"spanGallbladder\":\"2-7\",\"fiveGallbladder\":\"2-4-5-8-9\",\"bxPositionGb\":\"-4-\",\"groupHuntingGb\":\"8-6-3&9-6-4&6-8-4&1-4-9&6-6-6\",\"dbGallbladder\":\"3-6\",\"killThreeGallbladder\":\"1-6-3\",\"killGallbladder\":\"1\",\"killTwoGallbladder\":\"1-6\",\"threeGallbladder\":\"1-2-3\",\"sixGallbladder\":\"2-4-5-8--9-7\"}]', '[{\"sumGallbladderRsSucc\":false,\"sixGallbladderRsSucc\":false,\"bxPositionGbRsSucc\":true,\"killTwoGallbladderRsSucc\":false,\"gallbladderRs\":\"9\",\"threeGallbladderRs\":\"1-\",\"dbGallbladderRs\":\"\",\"dbGallbladderRsSucc\":false,\"spanGallbladderRs\":\"\",\"sixGallbladderRs\":\"4-9\",\"groupHuntingGbRsSucc\":true,\"killGallbladderRs\":\"\",\"killThreeGallbladderRs\":\"6-3\",\"killGallbladderRsSucc\":false,\"sumGallbladderRs\":\"\",\"gallbladderRsSucc\":true,\"groupHuntingGbRs\":\"1-4-9\",\"killThreeGallbladderRsSucc\":false,\"threeGallbladderRsSucc\":true,\"bxPositionGbRs\":\"-4-\",\"fiveGallbladderRsSucc\":true,\"spanGallbladderRsSucc\":false,\"fiveGallbladderRs\":\"4-9\",\"killTwoGallbladderRs\":\"6\"}]', 2, NULL, '2019-09-03 09:43:51', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_scheme` VALUES ('6', '4347605730a24a96872299a980d340bc', '排列三', 2, 2019934, '1-4-9', '4-1-9', '[{\"resultBalls\":\"1-4-9\"}]', '[{\"gallbladder\":\"9\",\"sumGallbladder\":\"8-16\",\"spanGallbladder\":\"2-7\",\"fiveGallbladder\":\"2-4-5-8-9\",\"bxPositionGb\":\"-4-\",\"groupHuntingGb\":\"8-6-3&9-6-4&6-8-4&1-4-9&6-6-6\",\"dbGallbladder\":\"3-6\",\"killThreeGallbladder\":\"1-6-3\",\"killGallbladder\":\"1\",\"killTwoGallbladder\":\"1-6\",\"threeGallbladder\":\"1-2-3\",\"sixGallbladder\":\"2-4-5-8--9-7\"}]', '[{\"sumGallbladderRsSucc\":false,\"sixGallbladderRsSucc\":false,\"bxPositionGbRsSucc\":true,\"killTwoGallbladderRsSucc\":false,\"gallbladderRs\":\"9\",\"threeGallbladderRs\":\"1-\",\"dbGallbladderRs\":\"\",\"dbGallbladderRsSucc\":false,\"spanGallbladderRs\":\"\",\"sixGallbladderRs\":\"4-9\",\"groupHuntingGbRsSucc\":true,\"killGallbladderRs\":\"\",\"killThreeGallbladderRs\":\"6-3\",\"killGallbladderRsSucc\":false,\"sumGallbladderRs\":\"\",\"gallbladderRsSucc\":true,\"groupHuntingGbRs\":\"1-4-9\",\"killThreeGallbladderRsSucc\":false,\"threeGallbladderRsSucc\":true,\"bxPositionGbRs\":\"-4-\",\"fiveGallbladderRsSucc\":true,\"spanGallbladderRsSucc\":false,\"fiveGallbladderRs\":\"4-9\",\"killTwoGallbladderRs\":\"6\"}]', 2, NULL, '2019-09-03 09:43:51', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_scheme` VALUES ('99999521b1e441dc9c7a867f27684032', 'f9f4137792484fd282878e2f1e1368b6', '双色球测试', 3, 2019830, '08-06-12-01-09-25-05', '13-14-15-16-17-08-06', '[{\"redBall\":[\"08\"]}]', '[{\"schemeRTf\":\"01-02-03-04-05-06-07-08-09-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24\",\"schemeREty\":\"01-02-03-04-05-06-07-08-09-10-11-12-13-14-15-11-16-17\",\"schemeRTy\":\"01-28-27-01-02-03-04-05-06-07-08-10\",\"schemeREt\":\"10-11-12-13-14-15-16-17\",\"schemeBibcock\":\"10-22\",\"schemePnix\":\"03-04\",\"redGallbladder\":\"11\",\"redTwoGallbladder\":\"11-23\",\"redThreeGallbladder\":\"19-18-15\",\"redKtGallbladder\":\"03-04-05\",\"redKsGallbladder\":\"10-09-08-14-16-17\",\"blueGallbladder\":\"12\",\"blueTwoGallbladder\":\"12-13\",\"blueThreeGallbladder\":\"12-13-14\",\"blueSixGallbladder\":\"03-04-05-06-07-08\",\"blueKtGallbladder\":\"12-13-14\",\"blueKsGallbladder\":\"10-09-06-04-03-02\"}]', '[{\"schemeRTyRs\":\"08-06-01-\",\"twoGallbladderRsSucc\":false,\"rTfRsSucc\":false,\"blueThreeGallbladderRsSucc\":false,\"schemeREtyRs\":\"08-06-12-01-09-\",\"pnixRsSucc\":false,\"blueGallbladderRsSucc\":false,\"rTyRsSucc\":false,\"bibcockRsSucc\":false,\"ksGallbladderRsSucc\":false,\"schemeRTfRs\":\"08-06-12-01-09-\",\"blueSixGallbladderRsSucc\":true,\"schemeBibcockRs\":\"\",\"gallbladderRsSucc\":false,\"schemePnixRs\":\"\",\"ktGallbladdeRsrSucc\":true,\"threeGallbladderRsSucc\":false,\"blueSixGallbladderRs\":\"05\",\"blueGallbladderRs\":\"\",\"retRsSucc\":false,\"blueKtGallbladderRsSucc\":true,\"rEtyRsSucc\":true,\"schemeREtRs\":\"12-\",\"redKsGallbladderRs\":\"10-14-16-17\",\"redKtGallbladdeRsr\":\"03-04-05\",\"redThreeGallbladderRs\":\"\",\"redGallbladderRs\":\"\",\"blueKtGallbladderRs\":\"12-13-14\",\"blueTwoGallbladderRs\":\"\",\"blueKsGallbladderRs\":\"10-09-06-04-03-02\",\"blueThreeGallbladderRs\":\"\",\"blueKsGallbladderRsSucc\":true,\"blueTwoGallbladderRsSucc\":false,\"redTwoGallbladderRs\":\"\"}]', 2, '双色球测试', '2019-09-10 16:03:09', '2019-09-12 09:56:39', NULL);
INSERT INTO `t_scheme` VALUES ('f21b92cab4814c54860316171878da44', 'bede2805dffc420bbba458b75a948abc', '新的方案', 4, 2019935, '1-5-6', '1-3-4', '[{\"resultBalls\":\"1-\"}]', '[{\"threeGallbladder\":\"1-3-4\",\"dbGallbladder\":\"1-4\",\"gallbladder\":\"8\",\"killGallbladder\":\"3\",\"killTwoGallbladder\":\"4-6\",\"killThreeGallbladder\":\"2-7-8\",\"fiveGallbladder\":\"2-7-3-7-2\",\"sixGallbladder\":\"7-8-7-5-7-5\",\"bxPositionGb\":\"-3-\",\"sumGallbladder\":\"12-13\",\"spanGallbladder\":\"3-2\",\"groupHuntingGb\":\"1-2-3&3-4-5&5-6-3&6-3-5&5-6-3&3-7-1&3-3-5&6-1-6&3-7-3&1-8-8&7-6-4&6-7-4&1-7-6&6-4-8&5-5-2&7-5-6&4-8-2&7-3-3&6-6-8&4-2-4\"}]', '[{\"sumGallbladderRsSucc\":true,\"sixGallbladderRsSucc\":false,\"bxPositionGbRsSucc\":false,\"killTwoGallbladderRsSucc\":false,\"gallbladderRs\":\"\",\"threeGallbladderRs\":\"1-\",\"dbGallbladderRs\":\"1-\",\"dbGallbladderRsSucc\":true,\"spanGallbladderRs\":\"\",\"sixGallbladderRs\":\"5-\",\"groupHuntingGbRsSucc\":false,\"killGallbladderRs\":\"3\",\"killThreeGallbladderRs\":\"2-7-8\",\"killGallbladderRsSucc\":true,\"sumGallbladderRs\":\"12\",\"gallbladderRsSucc\":false,\"groupHuntingGbRs\":\"\",\"killThreeGallbladderRsSucc\":true,\"threeGallbladderRsSucc\":true,\"bxPositionGbRs\":\"\",\"fiveGallbladderRsSucc\":false,\"spanGallbladderRsSucc\":false,\"fiveGallbladderRs\":\"\",\"killTwoGallbladderRs\":\"4-\"}]', 2, '测试方案', '2019-09-10 13:16:38', '2019-09-12 09:56:38', NULL);
INSERT INTO `t_scheme` VALUES ('f21b92cab4814c54860316171878da45', 'bede2805dffc420bbba458b75a948abc', '新的方案', 4, 2019936, '1-4-9', '1-3-4', '[{\"resultBalls\":\"1-4-\"}]', '[{\"threeGallbladder\":\"1-3-4\",\"dbGallbladder\":\"1-4\",\"gallbladder\":\"8\",\"killGallbladder\":\"3\",\"killTwoGallbladder\":\"4-6\",\"killThreeGallbladder\":\"2-7-8\",\"fiveGallbladder\":\"2-7-3-7-2\",\"sixGallbladder\":\"7-8-7-5-7-5\",\"bxPositionGb\":\"-3-\",\"sumGallbladder\":\"12-13\",\"spanGallbladder\":\"3-2\",\"groupHuntingGb\":\"1-2-3&3-4-5&5-6-3&6-3-5&5-6-3&3-7-1&3-3-5&6-1-6&3-7-3&1-8-8&7-6-4&6-7-4&1-7-6&6-4-8&5-5-2&7-5-6&4-8-2&7-3-3&6-6-8&4-2-4\"}]', '[{\"sumGallbladderRsSucc\":false,\"sixGallbladderRsSucc\":false,\"bxPositionGbRsSucc\":false,\"killTwoGallbladderRsSucc\":false,\"gallbladderRs\":\"\",\"threeGallbladderRs\":\"1-4-\",\"dbGallbladderRs\":\"1-4-\",\"dbGallbladderRsSucc\":true,\"spanGallbladderRs\":\"\",\"sixGallbladderRs\":\"\",\"groupHuntingGbRsSucc\":false,\"killGallbladderRs\":\"3\",\"killThreeGallbladderRs\":\"2-7-8\",\"killGallbladderRsSucc\":true,\"sumGallbladderRs\":\"\",\"gallbladderRsSucc\":false,\"groupHuntingGbRs\":\"\",\"killThreeGallbladderRsSucc\":true,\"threeGallbladderRsSucc\":true,\"bxPositionGbRs\":\"\",\"fiveGallbladderRsSucc\":false,\"spanGallbladderRsSucc\":false,\"fiveGallbladderRs\":\"\",\"killTwoGallbladderRs\":\"6\"}]', 2, '测试方案', '2019-09-10 13:16:38', '2019-09-12 10:01:12', NULL);
INSERT INTO `t_scheme` VALUES ('f8412c34a2ed4319a0f7c8e22b7ee0bb', 'bede2805dffc420bbba458b75a948fbe', '大乐透测试方案', 1, 2019931, '05-08-25-23-10-06-10', '12-13-14-23-22-12-10', '[{\"redBall\":[\"23\"],\"blueBall\":[\"10\"]}]', '[{\"schemeTf\":\"10-09-08-07-06-05-04-03-02-01-12-13-14-15-16-17-18-19-20-21-23-25-26-27\",\"schemeEty\":\"08-07-06-05-04-03-02-01-19-18-17-16-15-14-13-12-11-10\",\"schemeTy\":\"22-15-17-18-19-04-06-07-32-31-30-02\",\"schemeEt\":\"23-23-25-26-28-29-30-04\",\"schemeBibcock\":\"01-03\",\"schemePnix\":\"04-05\",\"schemeBtgallbladder\":\"04\",\"schemeTwogallbladder\":\"05-06\",\"schemeThreegallbladder\":\"06-07-08\",\"schemeKtgallbladder\":\"13-24-32\",\"schemeKsgallbladder\":\"12-13-15-16-17-18\",\"schemeBtwogallbladder\":\"04-05\",\"schemeBfourgallbladder\":\"05-06-07-08\",\"schemeBsixgallbladder\":\"12-11-08-06-05-03\",\"schemeKbthreegallbladder\":\"11-03-04\",\"schemeKbsixgallbladder\":\"04-05-07-08-09-12\"}]', '[{\"threegallbladderRsSucc\":true,\"btwogallbladderRsSucc\":false,\"schemeEtyRs\":\"05-08-10\",\"kbthreegallbladderRsSucc\":true,\"schemeBfourgallbladderRs\":\"06-\",\"bibcockRsSucc\":false,\"schemeBtgallbladderRs\":\"\",\"schemeTyRs\":\"\",\"etrRsSucc\":false,\"tfrsRsSucc\":true,\"bsixgallbladderRsSucc\":false,\"schemeBibcockRs\":\"\",\"etyrsRsSucc\":false,\"schemeBtwogallbladderRs\":\"\",\"schemeKbthreegallbladderRs\":\"11-03-04\",\"btgallbladderRsSucc\":false,\"twogallbladderRsSucc\":true,\"schemeTwogallbladderRs\":\"05-\",\"ktgallbladderRsSucc\":true,\"schemeEtRs\":\"25-23-\",\"schemeKsgallbladderRs\":\"12-13-15-16-17-18\",\"schemeTfRs\":\"05-08-25-23-10\",\"schemeThreegallbladderRs\":\"08-\",\"schemeKtgallbladderRs\":\"13-24-32\",\"bfourgallbladderRsSucc\":true,\"tyrsRsSucc\":false,\"phixRsSucc\":false,\"schemeKbsixgallbladderRs\":\"04-05-07-08-09-12\",\"schemePhixRs\":\"\",\"ksgallbladderRsSucc\":true,\"schemeBsixgallbladderRs\":\"06-\",\"kbsixgallbladderRsSucc\":true}]', 2, '这是一个大乐透的测试方案', '2019-09-10 15:01:03', '2019-09-12 09:56:38', NULL);

-- ----------------------------
-- Table structure for t_sms
-- ----------------------------
DROP TABLE IF EXISTS `t_sms`;
CREATE TABLE `t_sms`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户id',
  `sms_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送手机号',
  `sms_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送的标题',
  `sms_type` int(2) NULL DEFAULT NULL COMMENT '短信类型 0验证码',
  `comment` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '短信内容',
  `status` int(2) NULL DEFAULT NULL COMMENT '0待发 1已发 2发送失败',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_sms_phone`(`sms_phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信发送记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键Id\r\n',
  `open_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信唯一标识',
  `ctm_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `ctm_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `nick_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `ctm_pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `ctm_sex` int(1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '0男1女',
  `head_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `ctm_source` int(1) NULL DEFAULT NULL COMMENT '0 平台注册 1微信注册',
  `province_code` int(8) NULL DEFAULT NULL COMMENT '省份编码',
  `city_code` int(8) NULL DEFAULT NULL COMMENT '城市编码',
  `ctm_genre` int(1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '0 客户 1专家 ',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `idx_uid`(`uid`) USING BTREE,
  UNIQUE INDEX `idx_phone`(`ctm_phone`) USING BTREE,
  INDEX `idx_name`(`ctm_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('4347605730a24a96872299a980d340bc', NULL, '18217117888', '上帝', 'god', 'w888888', 0, NULL, 0, NULL, NULL, 1, '2019-08-29 13:35:31', NULL, NULL);
INSERT INTO `t_user` VALUES ('54c1f4bbe0d744ffa328cadb87cbc6c6', '', '18216132156', '李四', 'ls', 'www123', 0, NULL, 0, NULL, NULL, 0, '2019-09-03 11:50:07', NULL, NULL);
INSERT INTO `t_user` VALUES ('54c1f4bbe0d744ffa328cadb87cbc6c8', '', '18216132155', '张三', 'zs', 'www123', 0, NULL, 0, NULL, NULL, 0, '2019-09-03 11:50:07', NULL, NULL);
INSERT INTO `t_user` VALUES ('bede2805dffc420bbba458b75a948abc', NULL, '18217117222', '王五', 'ww', 'w132546', 0, NULL, 0, NULL, NULL, 1, '2019-09-11 18:05:47', NULL, NULL);
INSERT INTO `t_user` VALUES ('bede2805dffc420bbba458b75a948fbe', NULL, '18217117886', '李一桐', 'yt', 'w666888', 1, NULL, 0, NULL, NULL, 1, '2019-08-29 13:31:34', NULL, NULL);
INSERT INTO `t_user` VALUES ('f9f4137792484fd282878e2f1e1368b6', NULL, '18217117889', '张超锋', 'zcf', 'w123456', 0, NULL, 0, NULL, NULL, 1, '2019-08-29 13:31:31', NULL, NULL);

-- ----------------------------
-- Table structure for t_view
-- ----------------------------
DROP TABLE IF EXISTS `t_view`;
CREATE TABLE `t_view`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户id',
  `post_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章帖子方案id',
  `type` int(2) NULL DEFAULT NULL COMMENT '浏览的类型 0资讯1帖子 2方案与文件表文件对应',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '浏览时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_post_id`(`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '此表用于记录用户最近浏览的信息' ROW_FORMAT = Compact;

-- ----------------------------
-- View structure for t_attention_num
-- ----------------------------
DROP VIEW IF EXISTS `t_attention_num`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `t_attention_num` AS select count(`f`.`cuid`) AS `attention_num`,`f`.`uid` AS `uid` from `t_fans` `f` group by `f`.`uid`;

-- ----------------------------
-- View structure for t_fans_num
-- ----------------------------
DROP VIEW IF EXISTS `t_fans_num`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `t_fans_num` AS select count(`f`.`uid`) AS `fans_num`,`f`.`cuid` AS `uid` from `t_fans` `f` group by `f`.`cuid`;

SET FOREIGN_KEY_CHECKS = 1;
