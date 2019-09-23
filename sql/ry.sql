/*
 Navicat Premium Data Transfer

 Source Server         : mycon
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 23/09/2019 08:44:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 't_knowledge', '', 'TKnowledge', 'crud', 'com.ruoyi.project.system', 'system', 'knowledge', NULL, 'ruoyi', NULL, 'admin', '2019-09-22 08:26:59', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', NULL, 'varchar(255)', 'String', 'id', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-09-22 08:26:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, '1', 'ask', NULL, 'varchar(255)', 'String', 'ask', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2019-09-22 08:26:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, '1', 'answer', NULL, 'text', 'String', 'answer', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2019-09-22 08:26:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, '1', 'data_org', NULL, 'varchar(255)', 'String', 'dataOrg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2019-09-22 08:26:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, '1', 'image_path', NULL, 'varchar(255)', 'String', 'imagePath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2019-09-22 08:26:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, '1', 'shop_num', NULL, 'varchar(20)', 'String', 'shopNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2019-09-22 08:26:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, '1', 'product_name', NULL, 'varchar(100)', 'String', 'productName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2019-09-22 08:26:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, '1', 'video_path', NULL, 'varchar(255)', 'String', 'videoPath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2019-09-22 08:26:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, '1', 'doc_path', NULL, 'varchar(255)', 'String', 'docPath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2019-09-22 08:26:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, '1', 'build_time', NULL, 'datetime', 'Date', 'buildTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2019-09-22 08:26:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '1', 'product_factory', NULL, 'varchar(255)', 'String', 'productFactory', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2019-09-22 08:26:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, '1', 'sort', NULL, 'int(10)', 'Integer', 'sort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2019-09-22 08:26:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '1', 'group_id', NULL, 'int(11)', 'Long', 'groupId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2019-09-22 08:26:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '1', 'created', NULL, 'datetime', 'Date', 'created', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2019-09-22 08:26:59', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'LAPTOP-573MF9TA1569196385113', 1569196389288, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1569196390000, -1, 5, 'PAUSED', 'CRON', 1569196385000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1569196395000, -1, 5, 'PAUSED', 'CRON', 1569196385000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1569196400000, -1, 5, 'PAUSED', 'CRON', 1569196385000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '登录成功', '2019-09-22 08:19:40');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '登录成功', '2019-09-22 08:21:35');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '退出成功', '2019-09-22 17:11:44');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '登录成功', '2019-09-22 17:12:28');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '退出成功', '2019-09-22 17:19:12');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '1', '验证码错误', '2019-09-22 17:19:49');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '登录成功', '2019-09-22 17:19:54');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-22 21:34:20');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2005 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成修改', 114, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '生成删除', 114, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 114, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 114, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2000, '知识库', 3, 1, '/system/knowledge', '', 'C', '0', 'system:knowledge:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '知识库菜单');
INSERT INTO `sys_menu` VALUES (2001, '知识库查询', 2000, 1, '#', '', 'F', '0', 'system:knowledge:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2002, '知识库新增', 2000, 2, '#', '', 'F', '0', 'system:knowledge:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2003, '知识库修改', 2000, 3, '#', '', 'F', '0', 'system:knowledge:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2004, '知识库删除', 2000, 4, '#', '', 'F', '0', 'system:knowledge:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_knowledge\"]}', 0, NULL, '2019-09-22 08:26:59');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/t_knowledge', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-09-22 08:27:02');
INSERT INTO `sys_oper_log` VALUES (102, '知识库', 3, 'com.ruoyi.project.system.kbm.controller.TKnowledgeController.remove()', 'POST', 1, 'admin', '研发部门', '/system/knowledge/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"07E121D4-C392-11E8-97BF-00163E0CF556,B4DA5066-C394-11E8-97BF-00163E0CF556,7703E577-C3CF-11E8-97BF-00163E0CF556,B1026CD0-C3CF-11E8-97BF-00163E0CF556\"]}', 0, NULL, '2019-09-22 17:21:54');
INSERT INTO `sys_oper_log` VALUES (103, '知识库', 3, 'com.ruoyi.project.system.kbm.controller.TKnowledgeController.remove()', 'POST', 1, 'admin', '研发部门', '/system/knowledge/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9A204819-C447-11E8-97BF-00163E0CF556\"]}', 0, NULL, '2019-09-22 17:22:30');
INSERT INTO `sys_oper_log` VALUES (104, '知识库', 2, 'com.ruoyi.project.system.kbm.controller.TKnowledgeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/knowledge/edit', '127.0.0.1', '内网IP', '{\"id\":[\"D60C21B9-C447-11E8-97BF-00163E0CF556\"],\"dataOrg\":[\"01\"],\"productName\":[\"活性炭吸附箱/环保设备\"],\"shopNum\":[\"HXTQWCLX-13\"],\"sort\":[\"\"],\"productFactory\":[\"\"],\"ask\":[\"环保箱的进出口是哪边？\"],\"answer\":[\"左右进出口自己定，只要是棉，砖，颗粒的顺序出来就好了。\"]}', 0, NULL, '2019-09-22 17:23:08');
INSERT INTO `sys_oper_log` VALUES (105, '知识库', 2, 'com.ruoyi.project.system.kbm.controller.TKnowledgeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/knowledge/edit', '127.0.0.1', '内网IP', '{\"id\":[\"D60C21B9-C447-11E8-97BF-00163E0CF556\"],\"dataOrg\":[\"01\"],\"productName\":[\"活性炭吸附箱/环保设备\"],\"shopNum\":[\"HXTQWCLX-13\"],\"sort\":[\"\"],\"productFactory\":[\"\"],\"ask\":[\"环保箱的进出口是哪边？\"],\"answer\":[\"左右进出口自己定，只要是棉，砖，颗粒的顺序出来就好了。\"]}', 0, NULL, '2019-09-22 17:24:06');
INSERT INTO `sys_oper_log` VALUES (106, '知识库', 2, 'com.ruoyi.project.system.kbm.controller.TKnowledgeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/knowledge/edit', '127.0.0.1', '内网IP', '{\"id\":[\"D60C21B9-C447-11E8-97BF-00163E0CF556\"],\"dataOrg\":[\"01\"],\"productName\":[\"活性炭吸附箱/环保设备\"],\"shopNum\":[\"HXTQWCLX-13\"],\"sort\":[\"\"],\"productFactory\":[\"\"],\"ask\":[\"环保箱的进出口是哪边？\"],\"answer\":[\"左右进出口自己定，只要是棉，砖，颗粒的顺序出来就好了。\"]}', 0, NULL, '2019-09-22 17:25:17');
INSERT INTO `sys_oper_log` VALUES (107, '知识库', 2, 'com.ruoyi.project.system.kbm.controller.TKnowledgeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/knowledge/edit', '127.0.0.1', '内网IP', '{\"id\":[\"D60C21B9-C447-11E8-97BF-00163E0CF556\"],\"dataOrg\":[\"01\"],\"productName\":[\"活性炭吸附箱/环保设备\"],\"shopNum\":[\"HXTQWCLX-13\"],\"sort\":[\"\"],\"productFactory\":[\"\"],\"ask\":[\"环保箱的进出口是哪边？\"],\"answer\":[\"左右进出口自己定，只要是棉，砖，颗粒的顺序出来就好了。\"]}', 0, NULL, '2019-09-22 17:28:30');
INSERT INTO `sys_oper_log` VALUES (108, '知识库', 2, 'com.ruoyi.project.system.kbm.controller.TKnowledgeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/knowledge/edit', '127.0.0.1', '内网IP', '{\"id\":[\"D60C21B9-C447-11E8-97BF-00163E0CF556\"],\"dataOrg\":[\"01\"],\"productName\":[\"活性炭吸附箱/环保设备\"],\"shopNum\":[\"HXTQWCLX-13\"],\"sort\":[\"\"],\"productFactory\":[\"\"],\"ask\":[\"环保箱的进出口是哪边？\"],\"answer\":[\"左右进出口自己定，只要是棉，砖，颗粒的顺序出来就好了。\"]}', 0, NULL, '2019-09-22 17:29:17');
INSERT INTO `sys_oper_log` VALUES (109, '知识库', 2, 'com.ruoyi.project.system.kbm.controller.TKnowledgeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/knowledge/edit', '127.0.0.1', '内网IP', '{\"id\":[\"D60C21B9-C447-11E8-97BF-00163E0CF556\"],\"dataOrg\":[\"01\"],\"productName\":[\"活性炭吸附箱/环保设备\"],\"shopNum\":[\"HXTQWCLX-13\"],\"sort\":[\"\"],\"productFactory\":[\"\"],\"ask\":[\"环保箱的进出口是哪边？\"],\"answer\":[\"左右进出口自己定，只要是棉，砖，颗粒的顺序出来就好了。\"]}', 0, NULL, '2019-09-22 17:30:11');
INSERT INTO `sys_oper_log` VALUES (110, '知识库', 2, 'com.ruoyi.project.system.kbm.controller.TKnowledgeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/knowledge/edit', '127.0.0.1', '内网IP', '{\"id\":[\"D60C21B9-C447-11E8-97BF-00163E0CF556\"],\"dataOrg\":[\"01\"],\"productName\":[\"活性炭吸附箱/环保设备\"],\"shopNum\":[\"HXTQWCLX-13\"],\"sort\":[\"\"],\"productFactory\":[\"\"],\"ask\":[\"环保箱的进出口是哪边？\"],\"answer\":[\"左右进出口自己定，只要是棉，砖，颗粒的顺序出来就好了。\"]}', 0, NULL, '2019-09-22 17:31:34');
INSERT INTO `sys_oper_log` VALUES (111, '知识库', 2, 'com.ruoyi.project.system.kbm.controller.TKnowledgeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/knowledge/edit', '127.0.0.1', '内网IP', '{\"id\":[\"D60C21B9-C447-11E8-97BF-00163E0CF556\"],\"dataOrg\":[\"01\"],\"productName\":[\"活性炭吸附箱/环保设备\"],\"shopNum\":[\"HXTQWCLX-13\"],\"sort\":[\"\"],\"productFactory\":[\"\"],\"ask\":[\"环保箱的进出口是哪边？\"],\"answer\":[\"左右进出口自己定，只要是棉，砖，颗粒的顺序出来就好了。\"]}', 0, NULL, '2019-09-22 21:35:23');
INSERT INTO `sys_oper_log` VALUES (112, '知识库', 2, 'com.ruoyi.project.system.kbm.controller.TKnowledgeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/knowledge/edit', '127.0.0.1', '内网IP', '{\"id\":[\"D60C21B9-C447-11E8-97BF-00163E0CF556\"],\"dataOrg\":[\"01\"],\"productName\":[\"活性炭吸附箱/环保设备\"],\"shopNum\":[\"HXTQWCLX-13\"],\"sort\":[\"\"],\"productFactory\":[\"\"],\"ask\":[\"环保箱的进出口是哪边？\"],\"answer\":[\"左右进出口自己定，只要是棉，砖，颗粒的顺序出来就好了。\"]}', 0, NULL, '2019-09-22 21:37:32');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-09-22 21:34:21', 'admin', '2018-03-16 11:33:00', 'ry', '2019-09-22 21:34:20', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('cbe0bab4-afbd-4cb6-94aa-9476c606e33f', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', 'on_line', '2019-09-23 07:53:12', '2019-09-23 07:53:12', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for t_file_type
-- ----------------------------
DROP TABLE IF EXISTS `t_file_type`;
CREATE TABLE `t_file_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_file_type
-- ----------------------------
INSERT INTO `t_file_type` VALUES (1, '图片', 'image');
INSERT INTO `t_file_type` VALUES (2, '视频', 'voide');
INSERT INTO `t_file_type` VALUES (3, '文档', 'doc');

-- ----------------------------
-- Table structure for t_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `t_knowledge`;
CREATE TABLE `t_knowledge`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ask` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `data_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doc_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `build_time` datetime(0) NULL DEFAULT NULL,
  `product_factory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(10) NULL DEFAULT NULL,
  `group_id` int(11) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_knowledge
-- ----------------------------
INSERT INTO `t_knowledge` VALUES ('705D8862-BE11-11E8-97BF-00163E0CF556', '自助洗车机', '机器外壳是镀锌板的；\r\n基础款功能：清水、泡沫、语音、投币、刷卡、电表、时钟、温度显示、温度低于0度不启动、夜间模式、防占机、断电记忆；机器是需要联网的 放了流量卡 本身就是联网的，定制带显示屏加700元，定制关枪停机加200元\r\n实用款：一个高压枪，管子9米，吸尘管9表，有高压力表，电表默认，水表加150，没有活动关节，有手持充卡器也有USB充卡器，价格相差50，卡2元一张，质保1年；\r\n查询收费记录通过微信公众号可以查询； 加一次泡沫可以洗200辆左右车；\r\n是水泵加热 还是 水箱的水加热：机箱内部加热热量在机箱里面循环；\r\n机器的寿命大概是在20年左右， \r\n洗车机对场地有要求吗？ 2个停车位左右即可', '010201', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('9BC1BBB5-BE11-11E8-97BF-00163E0CF556', '茶叶分装机', '从价格低的开始 分装范围是2-35克 分装速度是10-20次/分钟 适应范围是 铁观音 枸杞 种子等颗粒状的非粘性固体物料\r\n第二个的分装范围是1-99克 分装速度是10-30包/分装 适应范围是面粉 调料粉 等非粘性粉末以及小颗粒的分装如：小五金 胶囊 狗粮等\r\n第三个的分装范围是2-50克 分装速度是1200包/小时 适应范围是茶叶 粉末 颗粒 小五金 谷物等', '010201', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('E38A7502-BE11-11E8-97BF-00163E0CF556', '豆芽机', '1、豆芽机页面上有写日产量60斤，200斤的，生产周期是3-4天左右的，生产周期是3-4天为什么日产量会是这么多。 原因是：60斤的总容量是240斤，可以分批放进去，第一天放生产60斤的容量进去，第二天放生产60斤的容量，以此类推，到了第4天的时候可以拿出第一批生产出来的去卖，又重新放豆子生产豆芽，这样每天的日生产量就是60斤，200斤的也是同样的道理，总容量是800斤豆芽的\r\n2、100斤的耗电量，可以这样子回复：机器的功率是1.5KW ，但并不是24小不停的工作，机器大部分是处于待机状态 和空调一样，每天耗电很小的，因为是每天投料，每天收获的，只消耗1天的水电，就可以出100斤的豆芽 并不说4天 是指1天出100斤菜\r\n3、彩钢材质的', '010201', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('977F7732-BE14-11E8-97BF-00163E0CF556', '电动水泥搅拌机', '能一边加料一边搅拌 ？ 不可以，这个是有自动断电功能的；', '010201', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('2902B8A2-BE15-11E8-97BF-00163E0CF556', '举升机，烤漆房', '双柱液压3900，双柱龙门4300，标准版的成本14500，豪华型的22000，环保配置可自主选择\r\n1.5T轿车SUV都可以吧 答：可以的', '010201', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('36B5D066-BE15-11E8-97BF-00163E0CF556', '电锅炉', '电锅炉：\r\n需要核实客户的信息：1.多大面积 2.单间还是多间，一层楼还是多层楼 3.客户需要的温度是多少，是哪里的人，室内外温差大不大？ 4.带不带地暖，暖气片？\r\n问：如果客户的面积是300平，单间取暖，室内保温效果好，问用多大功率的采暖炉？\r\n答：通常来说咱们家的电锅炉是1kw可以带动10平的，所以可以推荐客户用30kw或35kw的。因为诸多的条件因素的影响，一般推荐比30kw大一点的就很好了。建议推荐35kw的，功率越大，取暖的效果越好，但是得强调客户按照页面型号标注的电源线接线。\r\n用电量怎么算：一般来说30kw的一天的用电量是 30*24/3=240（都是按照平常电量节约3配来算的，如果算出来有小数点，那么近1位取个整数就好），，客户前期收到货，可能会认为有些耗电，但是因为客户那边室内的取暖情况，前期接上去的一会会比较耗电，但是之后取暖顺畅了之后就不会那么耗电了\r\n接暖气片的情况怎么算：一般来说咱们这边的电锅炉是1kw可以带动1组10注的暖气片，用多大的电锅炉，只要根据客户的条件推算就行了\r\n切记：电锅炉是取暖用的，接热水器烧水，是不建议的，因为耗电量非常大，也很难带动，如果是接水暖空调的情况，请问供应商', '010201', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('5F54D1E0-BE15-11E8-97BF-00163E0CF556', '模温机', '模温机的压力标准。是根据水温来讲的，普通的在3到5L左右。\r\n水式，油式区别：水式就是水的，油式就是油的，油式内部有油箱，水式没有，水式直接冷却，油式间接冷却；\r\n模温机又叫模具温度控制机 包含加温和冷冻两个方面的温度控制。\r\n直接冷却和间接冷却：就是水与水直接冷却，水与水有间接 ；\r\n温控版和电脑版：温控板式是有按钮的，电脑版是触屏的 （温控版就相当于别家的经济款，电脑版就相当于高配版）；\r\n像这样的模温机 有没有对水压没有要求的款 2公斤的水压以上，油式的导热油自己配的话是在5L左右', '010201', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('A2392222-BE15-11E8-97BF-00163E0CF556', '360改进型秸秆粉碎机', '养鸡 选择什么型号的筛网比较合适 那就选面子 #1.5 #3 要是干草 #4 用干玉米桔的话 不知道客户想要什么样的效果 \r\n干秸秆 多大眼的 都可以粉碎 \r\n就是细眼筛片 粉碎慢\r\n\r\n自带筛网是多大？ 外带1.5 30*60 装机3\r\n\r\n产品尺寸 360型的158*525 360改进型的198*525', '010201', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('B3867845-BE15-11E8-97BF-00163E0CF556', '活性炭吸附环保箱', '集装箱门和普通门有什么区别 集装箱的 有密封条 把手也不一样\r\n1.6过滤3000-6000风量 \r\n2米7000- 15000\r\n2.5 米 15000-20000\r\n1、油墨味道处理 需要Uv光解 加活性炭环保箱\r\n2、环评，是根据地区来的 一般是需要光痒加环保箱\r\n3、活性炭一个箱子带一袋50斤， 50斤可以更换3-4次 单独购买一袋70成本元不含运费\r\n管道的材质为镀锌板。', '010201', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('C27B1D52-BE15-11E8-97BF-00163E0CF556', '喷淋塔', '直径1.5高4.7米 成本7000，两层喷淋 空心球的直径是4cm', '010201', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('D53E471E-BE15-11E8-97BF-00163E0CF556', '立式液压打包机', '主要用于回收棉、羊毛、废纸、废纸箱、废纸板、纱线、烟叶、塑料、布匹、编织袋、针织绒、麻、麻袋、毛条、毛球、茧、蚕丝、啤酒花、麦柴、草、废塑料袋等一切轻泡、松散物料。立式液压打包机主要由液压缸、电机与油箱、压盘、箱体及底座、上门、下门、门闩、打包带支架、铁支等构成。\r\n一般打80-150公斤棉花包 30T双缸\r\n备压废线成捆装的行吗：答：可以的', '010201', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('F6554B34-BE15-11E8-97BF-00163E0CF556', '小型家用碾米机', '用糙米档位碾比较好，如果打不干净的话就在重新打2次就可以了。机器不能连续工作，工作20分钟，休息10分钟的。\r\n南方的丝苗米呢？ 可以打吗 不可以 ,东北稻子效果最好\r\n一个小时出多少米，3分钟左右一斤，一次不超过20分钟', '010201', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('D60C21B9-C447-11E8-97BF-00163E0CF556', '环保箱的进出口是哪边？', '左右进出口自己定，只要是棉，砖，颗粒的顺序出来就好了。', '01', '', 'HXTQWCLX-13', '活性炭吸附箱/环保设备', '', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('EC01320A-C447-11E8-97BF-00163E0CF556', '额外需要第三方资质检测文件需要多少钱', '500元', '01', '', 'HXTQWCLX-13', '活性炭吸附箱/环保设备', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('10D4160E-C448-11E8-97BF-00163E0CF556', '能不能带管道？/管道怎么卖', '管道建议客户找当地的通风管道的做，因为是抛货，管道弯头什么的用物流运，运费太高了。', '01', '', 'HXTQWCLX-13', '活性炭吸附箱/环保设备', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('44E82D7E-C448-11E8-97BF-00163E0CF556', '我们页面有活性炭环保箱两个链接，有什么差别？', '一个是原来的老款，刚刚出来的，是立式的，后来的都是常卖的是横式的。', '01', '', '	 HXTQWCLX-13', '活性炭吸附箱/环保设备', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('7F8BFB0C-C449-11E8-97BF-00163E0CF556', '环保箱里面有电机吗', '没有', '01', '', ' HXTQWCLX-13', '活性炭吸附箱/环保设备', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('94162566-C449-11E8-97BF-00163E0CF556', '环保箱里面的气怎么出来？', '加引风机', '01', '', 'HXTQWCLX-13', '活性炭吸附箱/环保设备', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('B1445C0D-C44A-11E8-97BF-00163E0CF556', '集装箱门（活性炭箱）的内部结构？', '1.6m（米）尺寸1600*1100*1300；2米尺寸2000*1100*1300；2.5米尺寸2500*1100*1300。\r\n4层过滤，第一层漆雾毡地棉，第二层活性炭棉，中间一道阻隔板上下通风，通过两层活性炭颗粒网往外排风（注：2.5米尺寸增加一道漆雾毡）', '01', '', 'HXTQWCLX-13', '活性炭吸附箱/环保设备', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('5FBE0326-C44B-11E8-97BF-00163E0CF556', '环保箱（普通门）内部结构？', '1米尺寸1000*1100*1300，3层；1.6m（米）尺寸1600*1100*1300，3-4层；2米尺寸2000*1100*1300，4层；2.5米尺寸2500*1100*1300，4-5层；\r\n普通门内部都是一层玻纤维地棉，其他层是活性炭棉（注：可以将过滤棉棉换活性炭砖，一层加450元）（砖块大小 10*10*5 厘米））\r\n（活性炭砖成本320）', '01', '', 'HXTQWCLX-13  ', '活性炭吸附箱/环保设备', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('C798D59F-C451-11E8-97BF-00163E0CF556', '运费—自提运费，送货一般一次都加100-150至少', '【1米】：河南新乡凤泉区  190元；湖北孝感汉川市 260元；安徽马鞍山花山区  200元；江苏徐州邳州市 200元；浙江温州平阳县 230元；福建福州 240元（普通门）\r\n【1.6米】：新疆 乌鲁木齐市 头屯河区 480元  ；山西省运城新绛县 350元；安徽马鞍山花山区  300元；河南省 郑州市 其它区 300元；江苏省 南京市 浦口区 320元；江苏泰州姜堰区 300元；山东青岛 260元；广东省 深圳市 南山区 400元；广州白云区390元；安徽省 合肥市 瑶海区  300元；江苏常州武进区  300元\r\n【2米】：山东菏泽单县 280元；四川绵阳涪城区 610元；河南省 南阳市 淅川县 460元；江西省 南昌市 青山湖区 450元；\r\n【2.5米】：广西壮族自治区 防城港市  1060元；湖北省 荆州市 沙市区  465元；江苏省 苏州市 太仓市 430元；江苏徐州370元自提；江苏无锡惠山区 460元（集装）', '01', '', 'HXTQWCLX-13', '活性炭吸附箱/环保设备', '', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('2A6B879C-C455-11E8-97BF-00163E0CF556', '运费，自提货的，送货一般一次加100-150元', '【3000风量】：厦门 340元\r\n【5000风量】：河南洛阳 300元；湖南 邵阳武冈450元；新疆乌鲁木齐 460元；广东番禺 370元\r\n【1万风量】：广东省 阳江市 江城区 610元；福建省 漳州市 芗城区600元；江苏省 苏州市 吴中区 460元；河南驻马店上蔡 450元\r\n【1.5万风量】：\r\n【2万风量】：山西晋城 760元\r\n【3万风量】：\r\n【3.5万风量】：', '01', '', 'HBSB-11', 'UV光氧', '', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('0900D909-C466-11E8-97BF-00163E0CF556', '运费', '（老供应商）广西贵州四川重庆这些地方运费都一样贵的 云南运费更贵\r\n西北货运查货电话：0576-82329668\r\n浙江台州发货\r\n【FA-2型不带电机款】安徽省 黄山市80元；江西省 抚州市90元；贵州省 遵义市 赤水市 140元；河南省 信阳市 商城县 100元；新疆乌鲁木齐160元；\r\n【FA-2型 220V 带电机款，1.5/2.2KW运费相差不大】山东省 聊城市90元；北京市 100元；山东省 菏泽市 110元；湖北省 黄冈市 110元；安徽省 阜阳市 90元；安徽省 亳州市 100元；四川省 达州市135元；四川省 乐山市 140元；江西省 九江市 110元；重庆 重庆市  150元；江苏省 南通市 海门市 90元；河南省 信阳市 固始县 100元；青海省 海西蒙古族 天峻县 160元；河南省 周口市 项城市 100元；江苏省 淮安市80元；湖北省 随州市 105元；江西省 吉安市 万安县110元；广西桂林市 灵川县 150元；安徽省 亳州市 利辛县110元；\r\n【FC-1 1.5KW 双辊双刀】安徽省 宣城市100元；江苏省 泰州市 靖江市 90元；江西省 赣州市 120元；四川省 广安市 岳池县 180元；\r\n【 FC-2 2.2kw双辊双刀】浙江省 丽水市90元；安徽省 马鞍山市 含山县120元；四川省 泸州市 泸县 200元；山东省 威海市 荣成市140元；湖南省 娄底市135元；江西省 赣州市135元；湖北省 宜昌市 当阳市 135元；湖北省 随州市 140元；广东省 东莞市 塘厦镇 140元；福建省 漳州市 漳浦县140元；\r\n【FC-3双辊双刀3KW】浙江省 金华市 义乌市 115元\r\n【FD-2 多功能机 2.2KW电】安徽省 亳州市 涡阳县 120元', '01', '', 'DDBXJ-11/BXJY11', '剥线机', '', '', '2018-09-30 12:05:15', NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('2BD0CECB-C476-11E8-97BF-00163E0CF556', '基础知识', '【厂家含运费包邮，江浙沪是快递,其他省份发物流 发德邦物流】、\r\n【开专票厂家加13个点】、\r\n【机器标配 8*22 0度 30度 37.5度 3个刀片 如果要单独购买刀片20元不含运 不锈钢刀片35不含运】、\r\n【每月1号固定休息，因为车间休息的 周日有值班的 基本有货没休息就能发】、\r\n【厂家一般旺旺微信不回复，有问题直接打电话13587635599/13868882399/0577 86918000】', '01', '', 'PGJ-14', '坡口机', '', '', '2018-09-30 02:00:45', NULL, NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('6C20C34D-C49A-11E8-97BF-00163E0CF556', '基本知识', '【不含运费，一般发货物流，河南郑州发货 德邦物流 宇鑫物流 飞腾物流 天地华宇 】、\r\n【厂家比较配合，重点产品，同行竞争比较大，有单就卖】、\r\n【大型号的厂家特殊情况可以想办法测下价格】、\r\n【专票12个点】、\r\n【·河南郑州发货，厂家电话15003837520】', '010203', '', 'JG001Y13', '腰鼓搅拌机', '', '', '2018-09-30 06:20:15', '', 1, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('FD1EB893-D111-11E8-97BF-00163E0CF556', '5000的风量的UV配多大的风机？', '正常配5.5KW4A的', '01', '', '	 HBSB-11', 'UV光氧', '', '', '2018-10-16 03:06:22', '', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('64A6A458-D112-11E8-97BF-00163E0CF556', '特殊UV光氧价格？', '【3.5万风量】 4800元\r\n【3000风量 】 2250元 定做3-4天出', '01', '', '	 HBSB-11', 'UV光氧', '', '', '2018-10-16 03:09:16', '', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('337874C6-D121-11E8-97BF-00163E0CF556', '环保箱客户自己的活性炭是10*10*10的砖的，可以定做吗', '可以，1米三层的，要固定网子的话，比普通的成本加200', '01', '', 'HXTQWCLX-13', '活性炭吸附箱/环保设备', '', '', '2018-10-16 04:55:16', '', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('DA445EF5-D124-11E8-97BF-00163E0CF556', '喷淋塔PP材质能承受多少度温度？', '50度', '01', '', 'PL13', '喷淋塔/环保设备', '', '', '2018-10-16 05:21:24', '博誉', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('970067BB-D1A3-11E8-97BF-00163E0CF556', '烤漆房环保配置？', '12米长 宽5米 高3.2米的喷漆房： 2万的光氧\r\n长7.32米 宽4米 高2.62米 的烤漆房 ：2米环保箱，1万风量的光氧 自己有风机（可以另配 7.5KW的风机成本600，加层砖350）', '01', '', 'PL13/HBSB-11', '活性炭吸附箱/UV光氧/环保设备', '', '', '2018-10-17 08:28:37', '博誉', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('AF8D30A3-D1A3-11E8-97BF-00163E0CF556', 'UV光氧材质  镀锌板+钢塑有多厚？', '默认是1.2厚，可以做1.5厚的', '01', '', 'HBSB-11', 'UV光氧/环保设备', '', '', '2018-10-17 08:29:18', '博誉', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('CB591789-0BFC-11E9-9876-00163E0CF556', '传送带尺寸', '传送带周长1200毫米，刀片的后边放置空间传送带长度50公分，传送带宽度21.7公分。', '010201', '', ' 660型', '全自动切菜机', '', '', '2018-12-30 02:33:18', '沧泊切菜机', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('178EEAC5-0BFD-11E9-9876-00163E0CF556', '无机头款式可以切哪些？', '无机头款可切韭菜、茴香、葱、辣椒、酸菜、黄瓜、木耳、香菇、青菜、干豆腐、包菜、豆角、小米椒等；', '010201', '/images/2018-12-30/5c28672e21aa0.png', ' 660型', '全自动切菜机', '', '', '2018-12-30 02:35:26', '沧泊切菜机', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('569BF480-0BFD-11E9-9876-00163E0CF556', '机头款可以切什么', '带机头款除可切以上菜外，也适合切土豆、萝卜、芥菜、红薯、芋头、茄子、苹果等硬脆蔬菜。', '010201', '/images/2018-12-30/5c286797e098a.png', ' 660型', '全自动切菜机', '', '', '2018-12-30 02:37:11', '	 沧泊切菜机', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('7120D33A-0BFD-11E9-9876-00163E0CF556', '带机头跟不带机头的区别：', '萝卜、土豆等大点的东西 ，放到机头里面切成大片  然后在传送带上面切小。 因为传送带上刀片只能切五公分高度的菜  所以要用到机头。（具体操作可看视频）', '010201', '', ' 660型', '全自动切菜机', '', '', '2018-12-30 02:37:56', '沧泊切菜机', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('82D44E68-0BFD-11E9-9876-00163E0CF556', '切菜机电机是怎么样的', '默认是铝线电机，铜芯电机+150元。', '010201', '', ' 660型', '全自动切菜机', '', '', '2018-12-30 02:38:26', '	 沧泊切菜机', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('AE83807C-0BFD-11E9-9876-00163E0CF556', '切菜机刀片价格', '所有常规的刀片 都是40元。 丁刀默认是2公分的，尺寸越小越贵', '010201', '', ' 660型', '全自动切菜机', '', '', '2018-12-30 02:39:39', '沧泊切菜机', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('C4F58A4F-0BFD-11E9-9876-00163E0CF556', '切菜长度与厚度可以调节吗', '无机头的只能调节切菜长度，2-25毫米可调节。\r\n带机头款的长度、厚度都可调节，长度2-25毫米可调节，厚度2-8毫米可调节。', '010201', '', ' 660型', '全自动切菜机', '', '', '2018-12-30 02:40:17', '	 沧泊切菜机', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('D71817B1-0BFD-11E9-9876-00163E0CF556', '会不会有连刀的出现？', '刀安装好不会连刀', '010201', '', ' 660型', '全自动切菜机', '', '', '2018-12-30 02:40:47', '沧泊切菜机', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('61144C5A-0BFE-11E9-9876-00163E0CF556', '压菜部分的轴承辊  那是什么材质', '是角铁的', '010201', '', ' 660型', '全自动切菜机', '', '', '2018-12-30 02:44:38', '	 沧泊切菜机', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('CD004B61-1E0F-11E9-B14D-00163E0CF556', '安装步骤？', '1、将设备放置在需要处理的污水的位置，设备低于需要处理污水的进水管，保持地面平整，冬季注意防冻。\r\n2、加水口先用胶在管口位置粘接活接，活接后边连接阀门，然后衔接需要处理的污水的排污管，例如洗手盆的下水管。\r\n3、液位计显示水位位置。\r\n4、出药口连接方法同加水口，连接到市政排水管，排出经过处理后的污水。\r\n5、投加药剂到加药口，取下加药口盖，加入1片药剂，覆盖密封，定期检查药剂使用情况，及时更换新药剂。\r\n6、如果经过一段时间，缓释消毒器内污染需要冲洗，则关闭出药口，从加水口输入清水冲洗，从排污口（排污口接管到污水管道）排出，以便达到清洗设备的目的', '010201', '', 'HY', '缓释消毒器', '', '', '2019-01-22 02:34:42', '泰洁环保', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('F046338F-1E0F-11E9-B14D-00163E0CF556', '配置明细都有哪些？', '1、缓释消毒器设备 1台。\r\n2、液位计 1套、Ф20（DN15）PVC管30cm 5段、Ф20弯头6个、Ф20阀门3个、    Ф20活接3个、Ф20直接2个、胶1盒。\r\n3、安装使用说明书1份、合格证1份、营业执照复印件1份、9001产品质量体系认证证书复印件1份、卫生许可证复印件1份。', '010201', '', 'HY', '缓释消毒器', '', '', '2019-01-22 02:35:41', '泰洁环保', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('CD24822E-1E10-11E9-B14D-00163E0CF556', '可以连政府平台吗', '1.这个数据是通过SIM流量卡 上传到我们云平台的，可以通过电脑访问云平台 或者手机APP 查看数据 ,可以在电脑端访问 ，可以查看实时数据，历史数据，曲线图，地图坐标等,但是数据导不出来.\r\n可以链接政府的系统需要提供当地政府的协议端口', '010201', '', 'RYAF-YCJC', '扬尘检测仪', '', '', '2019-01-22 02:41:52', '山东仁科测控技术有限公司', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('015C0F4D-1E11-11E9-B14D-00163E0CF556', '手摇与手动的具体区别是什么？', '机器手摇与手动的结构是不一样的，用料手摇更扎实 相对成本也更高 ，手摇的焊接的时候可以保持压力，不需要工人手一直按着给压力，手动/手推的就是全程都要工人按着把手给压力的 ，手摇的把手在下面 ，手推的杆子在上面 ，但是手推不需要弯腰下去。 ', '010201', '/images/2019-01-22/5c46bb87b93dd.png', 'WT200-2RF02', '对焊机', '', '', '2019-01-22 02:43:19', '威沃管道焊接科技', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('C435DDC1-1E11-11E9-B14D-00163E0CF556', '操作步骤', '1~操作步骤：机器不转，打开火，小火（火苗从出糖器底下冒出来一点，但是不要烧到那3个叶片），加上半勺糖，等看着出糖器的白糖有一半化成水的时候 ，这个时候直接打开开关，最高速。 接着就糖丝就出来了\r\n做出第一个棉花糖之后，不要关火不要关电动，旋转预热，等1分钟后重新加上半勺糖\r\n如果马上出丝了，说明温度差不多了，接着加糖做就行\r\n如果没有马上出丝，火苗调大一点点，等着，一会温度上来了，糖就融化甩出来后，继续等20秒钟后，从新加糖\r\n等做1-2个棉花糖后，观察盆边上甩出的糖的样子，如果甩出的是白色颗粒状的，说明温度低了一点点，调大一点火苗；如果甩出的是发黄的糖，凝固在盆上的，说明温度高了，糖已经焦了，调小一点火苗（刚开始学习，不要用彩糖做实验，要用颗粒的白砂糖做实验。）', '010201', '', 'SH-03P', '小型棉花糖机', '', '', '2019-01-22 02:48:46', '', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('CD1D57D7-1E11-11E9-B14D-00163E0CF556', '一个水箱可以装多个加湿器吗？温度和湿度的控制范围是多少？', '可以，如果需要装2个加湿器，那么需要水箱上装个三通，一个控制器一般只能控制2到3个加湿器；\r\n控制范围：温度20度正负2度 湿度大于92或95；', '010201', '/images/2019-01-22/5c46bcdd935a6.png', 'BYS-3', '养护室三件套', '', '', '2019-01-22 02:49:01', '绍兴市上虞区道墟镇景诺仪器设备厂', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('D0077F13-1E12-11E9-B14D-00163E0CF556', '教学视屏', '豪华组装视频： http://v.youku.com/v_show/id_XMzM4MDI3OTEyOA==.html?spm=a2h3j.8428770.3416059.1 （特别提醒，煤气罐上减压阀必须用低压阀，严禁使用中高压阀） \r\n教学视频： http://v.youku.com/v_show/id_XMTUxMDcxNTM0NA==.html \r\n预热视频（带讲解） http://v.youku.com/v_show/id_XMTMyNTU4MDQwOA==.html \r\n预热视频： http://v.youku.com/v_show/id_XMTMyNTU5OTgyOA==.html \r\n拉丝视频： http://v.youku.com/v_show/id_XMjk4NTMwODA3Ng==.html?spm=a2h3j.8428770.3416059.1 \r\n花式棉花糖机制作视频： http://v.youku.com/v_show/id_XMzYxMjg2OTkyNA==.html?spm=a2h3j.8428770.3416059.1 \r\nhttp://v.youku.com/v_show/id_XMzE1MDQyODAw.html 中国花式棉花糖权威起步教材 \r\nhttp://v.youku.com/v_show/id_XMzE1MDQzMzA0.html 中国花式棉花糖权威起步教材\r\n出糖器清洗视频： http://v.youku.com/v_show/id_XMTc2MzY1ODk4NA==.html\r\n3~1 转速调到最快，固定不动，开始只练习调火就行\r\n2除了第一勺，第二勺开始必须是旋转加糖，不要停下加糖\r\n3 温度达到，旋转加糖立即出丝，而且不能冒烟\r\n4 关机时，必须先关火，等一分钟后才可以停转', '010201', '', 'SH-03P', '小型棉花糖机', '', '', '2019-01-22 02:56:15', '', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('2288A0AA-1E16-11E9-B14D-00163E0CF556', '功率是多大？是铜芯电机吗？', '煮水5kw 脱毛机1.5kw；\r\n默认铝芯电机，铜芯需要成本+150元；\r\n脱毛棒是需要另外买的，1.5元一根 ；', '010201', '/images/2019-01-22/5c46c422dba48.png', 'CY-50X-08', '煮水脱毛机', '', '', '2019-01-22 03:20:02', '瑞安市创意食品机械厂', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('2C3D8FA8-1E17-11E9-B14D-00163E0CF556', '炸鸭油要什么油？以及所用时长', '有条件的可以用色拉油，或者普通的食用油就可以。炸鸡炸鸭等，时间并不是非得统一或者是有标准\r\n基本上都是在16-22分钟之间 还要看用户的那些食物的大小，以及他们调节的温度高低有关\r\n电和燃气一起使用 电的功率4000W', '010201', '', 'HW-YXD30AD', '炸鸭炉', '', '', '2019-01-22 03:27:28', '宏威1', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('FB0EE051-1E17-11E9-B14D-00163E0CF556', '页面款式有什么区别？', '透明罩和铝合金罩区别：铝合金主要优势耐高温，适合锡焊等工业上使用，透明罩，优点美观，便于清洗，方便安装。\r\n吸烟管的口径有75mm,90mm，通常是PVC材质。', '010201', '/images/2019-01-22/5c46c73ba234d.png', 'BW-BV001E', '艾灸烟雾净化器', '', '', '2019-01-22 03:33:15', '柏维环保科技有限公司', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('BE4F6FFF-1E18-11E9-B14D-00163E0CF556', '机器的配置有哪些？里面自带的过滤能用多久', '配置：箱体+高效过滤器 。调速器：高中低三挡调速。\r\n机子自带的过滤器大概可以使用8个月左右。', '010201', '/images/2019-01-22/5c46c8833b5f5.png', 'ST-FFU', 'FFU空气净化器', '', '', '2019-01-22 03:38:43', '深圳市丰富金属制品有限公司', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('B1CD383E-1E21-11E9-B14D-00163E0CF556', '怎么安装', '厕所简易安装步骤：\r\n1）把底座平放 2）把前后板卡进底座上\r\n3）把左右侧板插入前后板的柱子中 4）打铆钉固定前后左右侧板\r\n5）安装厕所顶 6）安装水管，水管连接和家用是一样的。 \r\n7）打玻璃胶做防水 安装过程需要手电钻，铆钉枪和玻璃胶枪三个必备工具。厕所主体安装是有安装图纸的。主要的部件我们这边都已经给您做好了，您回去只需要拼装起来就可以了。安装方法倒不是很复杂，我们很多客户都是自己回去安装的。另外，如果您在安装过程中有什么不懂的，可以给我们打电话，我们这边有技术人员教您怎么安装的。\r\n或者我们这边可以提供安装视频给您。安装视频要等您下单后，收到货时我们经理会发给您。', '010201', '/images/2019-01-22/5c46d787b1a72.jpg', 'YK-CS01P', '移动厕所', '', '', '2019-01-22 04:42:47', '广州耀凯玻璃钢厂', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('E70507D3-1E21-11E9-B14D-00163E0CF556', '厕所的内饰配置有哪些？', '厕所内饰有：排气扇，灯泡，电源开关，冲水箱，不锈钢洗手盆，蹲便器，球形门锁\r\n不要相应内饰减的费用：\r\n冲水箱 22　洗手盆 15　不要排气扇和灯少20元　便池少　25\r\n厕所通用内容：移动厕所可以免费加固定片，粪桶100r一个，单门厕所排污口110mmPVC管 化粪池是1100元/立方淋浴80元 加陶瓷洗手盆：60元\r\n加小尿斗：200元 加淋浴间成本加50元一间。', '010201', '', 'YK-CS01P', '移动厕所', '', '', '2019-01-22 04:44:17', '广州耀凯玻璃钢厂', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('1B82B58B-1E23-11E9-B14D-00163E0CF556', '保安亭的基本结构', '彩钢保安亭：岗亭支撑柱采用直径1601/4优质铝合金型材；顶、墙面采用双面彩钢聚苯烯夹芯板，不用呆天花，不用二次装修，足够强度。窗户采用塑钢型材，配4mm透明玻璃；底架角铁架中间夹板上铺盖铝板；岗亭内配20w照明光管、工作台、电源开关插座、顶置旋转式警灯；门锁为普通球形锁。', '010201', '/images/2019-01-22/5c46d9e68c47e.jpg', 'YK-CS01P', '彩钢板保安亭', '', '', '2019-01-22 04:52:54', '广州耀凯玻璃钢厂', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('6A45F9DD-1E25-11E9-B14D-00163E0CF556', '推荐打印机', '厨房打印机一般推荐用80mm纸宽的切纸打印机，一般字体可以为18-22号字。机子本身是不带钱箱的。需要另外加150元成本购买。', '010201', '', 'BR-7CUN3E/BR-09', '点菜宝', '', '', '2019-01-22 05:09:25', '', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('DD63D71F-1E25-11E9-B14D-00163E0CF556', '可以使用自己的平板吗？', '是可以的，我们的平板是索立信的； 9.6寸的 16G 4核 1G运行内存 \r\n如果用自己的平板需要满足条件 安卓平板的分辨率达到1024*768\r\n苹果平板的系统要ios6.1以上，不能低于这个，高于这个可以', '010201', '', 'BR-7CUN3E/BR-09', '点菜宝', '', '', '2019-01-22 05:12:38', '', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('3750B1B1-1E26-11E9-B14D-00163E0CF556', '可以微信或者支付宝吗？', '是可以的，\r\n用美食专家软件 、支持平板点菜，点菜宝点菜，微信扫描二维码点菜，老板助手，对接美团外卖。\r\n\r\n微信支付宝 收款需要配一个扫描枪就可以 成本是90', '010201', '', 'BR-7CUN3E/BR-09', '点菜宝', '', '', '2019-01-22 05:15:09', '', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('9765C237-1E26-11E9-B14D-00163E0CF556', '文字可以修改为别的吗？韩语英语之类的。', '软件总的界面都是中文的， 菜品可以是别的语言。', '010201', '', 'BR-7CUN3E/BR-09', '点菜宝', '', '', '2019-01-22 05:17:50', '', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('1DB340AE-1E27-11E9-B14D-00163E0CF556', '电机是哪个牌子，是进口的吗。', '电机是泰格的。 可以跟客户说合资的。 是国产的', '010201', '/images/2019-01-22/5c46e0a03966e.jpg', 'EWT-16A-02', '攻丝机', '', '', '2019-01-22 05:21:36', '广州睿宸机械设备', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('79415F81-1E27-11E9-B14D-00163E0CF556', '关于丝锥', '页面是国标的丝锥。用国标丝锥还是日标丝锥 购买机器大部分是采购，一般采购不了解夹头分别有不同规格尺寸。\r\n夹头使用多久：看使用情况的。正常使用可以用一年 。夹头质保一个月\r\n国标400元。日标450元 单独一套的价格 单独一个夹头是50元成本', '010201', '/images/2019-01-22/5c46e139ccd5b.jpg', 'EWT-16A-02', '攻丝机', '', '', '2019-01-22 05:24:09', '广州睿宸机械设备', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('37B2B1AA-1EDC-11E9-B14D-00163E0CF556', '单晶硅跟多晶硅的区别/差别在哪？不同点？', '单晶硅的发电效率要比多晶硅多1%左右。单晶硅强光性好，在光照条件充足情况下效能更高。多晶硅弱光性较好，在光照条件不足情况下发电效能较好。单晶硅价格会比多晶硅贵。', '0103', '', '太阳能板', '太阳能板', '', '', '2019-01-23 02:57:58', '', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('86EE1BDA-1EDE-11E9-B14D-00163E0CF556', '怎么样算太阳能板发电量？', '按照全国平均有效光照时间4个小时左右。功率*4（小时）=日发电量。例:100W太阳能板光照条件好的情况下日发电量是多少？100*4=400W。得出100W太阳能板日发电量0.4度电。', '0103', '', '太阳能板', '太阳能板', '', '', '2019-01-23 03:14:30', '昇阳/金晟', NULL, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('346B47F7-31B8-11E9-B14D-00163E0CF556', '\\', '基本知识 了解：\r\n1）只要是用于干粉搅拌的 都可以用 优点就在于混合均匀 \r\n2）材质问题 只要是搅拌食品类的干粉 或者带有腐蚀性的干粉推荐客户用304材质的 \r\n3）201的标准版的话，盖子和支架都是铁的，304的话，盖子是304不锈钢的，全部滚筒的都是不锈钢的，支架还是铁的。\r\n4） 注意普通款和升级款的区别 标准版和升级版区别就是带个蝶阀 ,区别就是进料口跟出料口变成了人孔，卡箍阀，普通的进料口跟出料口是一个口,看下面的图片。\r\n5）机器360度旋转 内部有搅拌叶片 滚筒正转 叶片反转 相互作用力 搅拌过程中 没有死角\r\n6）15KG的搅拌机尺寸 跟30型尺寸一样，就是筒体缩小了 外形尺寸：长102宽70高100左右\r\n7）锂基润滑油和齿轮油出厂加过了 变速箱齿轮油如何加注？ 把护罩打开，减速机上面有个盖，打开，加在里面\r\n8）罐体内的叶片转速 100型 200型主轴40转左右/分钟 15型 30型 50型80转左右/分钟', '010203', '', 'JG001Y13', '腰鼓搅拌机', '', '', '2019-02-16 02:58:03', '', 5, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('7CD5EA03-370E-11E9-B14D-00163E0CF556', '/', '/', '010203', '/images/2019-02-23/5c70a8b97953e.jpg', 'JG001Y13', '腰鼓搅拌机', '', '', '2019-02-23 09:58:17', '', 7, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('D6EC9DDF-370E-11E9-B14D-00163E0CF556', '15型物流运费', '河南郑州发货 德邦物流 宇鑫物流 飞腾物流 天地华宇\r\n上海 上海市 180元（220V 15型标准版）送货+50元\r\n河北省沧州市 140元（220V 15型标准版）\r\n吉林省长春市 200元（220V 15型标准版 304材质）\r\n福建省泉州市 200元（220V 15型标准版）送货+50元\r\n福建省福州市 永泰县 205元（220V 15型标准版）送货+50元\r\n福建省漳州市 漳浦县 180元（220V 15型标准版）送货+55元\r\n福建省宁德市 福鼎市 180元（220V 15型标准版）\r\n浙江省宁波市/金华市 200元（220V 15型标准版）送货+50元\r\n浙江省丽水市 200元（220V 15型标准版）\r\n浙江省丽水市 缙云县 260元（220V 15型升级版）\r\n江苏省苏州市 太仓市 180元（220V 15型标准版）送货+50元\r\n江苏省无锡市 200元（220V 15型标准版）送货+50元\r\n江西省南昌市 200元（220V 15型标准版）送货+50元\r\n河南省焦作市 修武县 60元（220V 15型标准版）\r\n四川省成都市 180元（220V 15型标准版）送货+50元\r\n广东省阳春市/湛江市/广州市 180元（220V 15型标准版）送货+50元\r\n山西省朔州市 怀仁县 160元（220V 15型标准版）\r\n重庆 重庆市 180元（220V 15型标准版）送货+50元\r\n山东省日照市 160元（220V 15型标准版 304材质）送货+50元\r\n山东省烟台市 /临沂市/滨州市 180元（220V 15型标准版 ）\r\n湖南省益阳市 180元（220V 15型标准版 304材质）\r\n广西壮族自治区 南宁市 220元（220V 15型升级版 304材质）送货+50元\r\n湖北省 黄冈市 黄梅县 200元（220V 15型升级版）\r\n新疆维吾尔自治区 昌吉回族自治州 昌吉市 380元（220V 15型标准版）送货+50元', '010203', '', 'JG001Y13', '腰鼓搅拌机', '', '', '2019-02-23 10:00:48', '', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('C3EA14D3-37CE-11E9-B14D-00163E0CF556', '30型物流运费', '河南省信阳市 80元（220V 30型标准版） \r\n河北省廊坊市/唐山市 220-230元（（220V 30型升级版）） \r\n浙江省杭州市 230元（220V 30型标准版） \r\n江苏省苏州市 220元（220V 30型标准版）送货+50元 徐州市/镇江市 \r\n江苏省南通市 240元（220V 30型升级版）送货+50元 \r\n辽宁省大连市 220元（220V 30型标准版）送货+50元 \r\n辽宁省沈阳市 230元（220V 30型标准版）送货+50元 \r\n广东省深圳市 230元（220V 30型标准版） \r\n山东省青岛市/临沂市 200元（220V 30型升级版）送货+50元 \r\n山东省济宁市 220元（220V 30型升级版）送货+50元 \r\n山东省聊城市 冠县 230元（220V 30型升级版） \r\n广东省广州市/东莞市/佛山市/清远市 200元（220V 30型标准版）送货+50元 \r\n山西省 晋中市 祁县 240元（220V 30型标准版 ） \r\n重庆 重庆市 240元（220V 30型标准版）送货+50元 \r\n上海 上海市 220元（220V 30型升级版）送货+50元 \r\n四川省成都市/德阳市/绵阳市 230元（220V 30型升级版）送货+50元 \r\n四川省眉山市 仁寿县 280元（220V 30型标准版） \r\n湖南省株洲市 株洲县 200元（220V 30型标准版）送货+50元 \r\n湖南省郴州市 220元（220V 30型升级版 304材质）送货+50元 \r\n湖南省娄底市 新化县 230元（220V 30型蜗轮款） \r\n吉林省白城市 280元（220V 30型升级版 304材质） \r\n湖北省武汉市 220元（220V 30型标准版）德邦送货 \r\n福建省 三明市 永安市 240元（220V 30型标准版） \r\n广东省汕头市 230元（220V 30型升级版 304材质）送货+50 深圳市 \r\n安徽省合肥市/巢湖市/淮南市 220元（220V 30型升级版 304材质）送货+50 \r\n安徽省马鞍山市 240元（220V 30型升级版 304材质）送货+55 \r\n安徽省亳州市 230元（220V 30型升级版）送货+50 \r\n江西省萍乡市/宜春市 220-230元（220V 30型升级版） \r\n吉林省 延边朝鲜族自治州 敦化市 270元（220V 30型升级版） \r\n黑龙江省 哈尔滨市 240元（220V 30型标准版）送货+50 \r\n黑龙江省 齐齐哈尔市 龙江县 330元（220V 30型升级版 304材质）', '010203', '', 'JG001Y13', '腰鼓搅拌机', '', '', '2019-02-24 08:54:40', '', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('37AF2939-37CF-11E9-B14D-00163E0CF556', '50型物流运费', '江苏省扬州市 280元（220V 50型标准版）\r\n江苏省南京市 240元（220V 50型标准版）送货+50\r\n河北省邢台市 200元（220V 50型标准版）\r\n重庆市 北碚区 220元（220V 50型标准版）送货+50\r\n山东省 聊城市 莘县 200元（220V 50型标准版）\r\n山东省 青岛市 胶州市 220元（220V 50型标准版）\r\n湖北省 武汉市 200元（220V 50型标准版）送货+50\r\n福建省 泉州市 300元（220V 50型升级版）\r\n辽宁省 鞍山市 260元（220V 50型升级版）\r\n辽宁省 盘锦市 260元（220V 50型标准版）\r\n辽宁省 大连市 270元（220V 50型升级版）\r\n山东省 枣庄市/济南市 220元（220V 50型升级版 304材质）送货+50元\r\n广东省 东莞市 280元（220V 50型升级版）送货+50\r\n广东省 珠海市/汕头市 240元（220V 50型升级版 304材质）送货+50\r\n吉林省 延边朝鲜族自治州 珲春市 300元（220V 50型升级版）送货+50\r\n云南省 昆明市 350元（220V 50型升级版）\r\n北京 北京市 240元（220V 50型升级版）', '010203', '', 'JG001Y13', '腰鼓搅拌机', '', '', '2019-02-24 08:57:54', '', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('4F19EC41-37CF-11E9-B14D-00163E0CF556', '100型/200型物流运费', '湖北省 咸宁市 280元（380V 100型升级版）\r\n山东省 日照市 320元（220V 100型升级版）\r\n山东省 淄博市 桓台县 380元（220V 100型升级版）\r\n广东省 汕头市 390元（220V 100型升级版 304材质）送货+50元\r\n江西省 抚州市 金溪县 430元（380V 100型升级版）送货+50元 \r\n湖北省 襄阳市 宜城市 320元（380V 100型标准版）\r\n\r\n河北省 衡水市 深州市 370元（380V 200型标准版）送货+100\r\n上海 上海市 400元（380V 200型标准版）\r\n上海 上海市 500元（380V 200型升级版）\r\n广东省 广州市 450元（380V 200型标准版）\r\n浙江省 湖州市 长兴县 650元（380V 200型升级版）\r\n广东省 东莞市 550元（380V 200型升级版 ）\r\n广东省 茂名市 化州市 500元（380V 200型升级版 304材质）\r\n江苏省 扬州市 仪征市 560元（380V 200型升级版）', '010203', '', 'JG001Y13', '腰鼓搅拌机', '', '', '2019-02-24 08:58:33', '', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('4BC85148-37DE-11E9-B14D-00163E0CF556', '基本知识', '【不含运费，外400江浙沪一般发快递，其他规格发物流：安能物流、上海乾玉来物流15195672009、苏州畅驰物流15301557333】\r\n【厂家问题回复及时，产品价格透明化，同行竞争较大，有单就卖】\r\n【报完价格之后一般不能策价】\r\n【普票3个点，增票10个点】\r\n【江苏吴江发货，厂家电话15262385894】\r\n【问题咨询微信群群名：传递窗风淋室咨询15262385894】', '010201', '/images/2019-02-24/5c72055e7ebe6.jpg', 'QH-JX400E', '传递窗', '', '', '2019-02-24 10:45:50', '吴江市汾湖镇胜天净化设备厂', 1, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('E0F6FE42-37DF-11E9-B14D-00163E0CF556', '常见问题', '1、机械互锁与电子互锁的区别：\r\n1）机械连锁工作原理：内部采用连杆原理实现机械连锁，当其中一扇门打开时，另一扇门内部弹出连杆，使门不能打开，当打开的门关闭时，另一扇门连杆通过弹簧自动收回，此时另一扇门可以打开\r\n2）电子连锁工作原理：内部采用集成电路、电磁锁、控制面板、指示灯等实现连锁，当其中一扇门打开时，另一扇的开门指示灯不亮，告知这门不能打开，同时电磁锁动作实现连锁。当该门关闭时，另一扇的电磁锁开始工作，同时指示灯会发亮，表示另一扇门可以打开\r\n2、常规传递窗板厚0.7mm，可定制1.0mm\r\n3、紫外杀菌灯功率：\r\n1）外400外500内400     6w\r\n2）内500外600内600外700     8w\r\n3）内700和外800，及外800以上    14W\r\n4、传递窗货到必须先验货再签收，签收后发现破损，厂家和物流都不予任何赔偿\r\n5、QS/SC即食品生产许可认证，证书需要客户自己去办理，我们只提供仪器\r\n6、客户提供的尺寸必须按照深、宽、高对应好', '010201', '/images/2019-02-24/5c72080649dee.jpg', 'QH-JX400E', '传递窗', '', '', '2019-02-24 10:57:10', '', 5, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('2462A9AE-37E0-11E9-B14D-00163E0CF556', '退货地址', '货到必须先验货，再签收，否则一旦存在破损，供应商和物流将不承担任何费用，\r\n\r\n退货地址：江苏省苏州市吴江市金家坝镇金周路2389号对面，蔡燕燕，15240428821', '010201', '', 'QH-JX400E', '传递窗', '', '', '2019-02-24 10:59:03', '', 2, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('937BCD7A-37E0-11E9-B14D-00163E0CF556', '营业执照', '厂家只有营业执照，营业期限：2008年07月15日至2028年07月14日，具备生产资质', '010201', '/images/2019-02-24/5c720b873a014.png', 'QH-JX400E', '传递窗', '', '', '2019-02-24 11:02:09', '吴江市汾湖镇胜天净化设备厂', 7, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('F7992BC5-37F5-11E9-B14D-00163E0CF556', '外400运费： 木箱35元', '上海金山区             运费走中通快递35元\r\n河南省 三门峡市      运费走中通快递120\r\n浙江省 杭州市 萧山区   运费走中通快递35元 \r\n山西省 晋中市 太谷县     走安能或者中通都是120\r\n四川广元青川木箱35元。  运费走安能物流到青川县自提100元。\r\n山东省 济宁市 泗水县        运费走中通快递120元 \r\n重庆 重庆市 酉阳土家族苗族自治县    走安能运费120 \r\n吉林省 通化市 梅河口市        德邦运费自提85\r\n甘肃省 白银市              走德邦物流到白银市自提80元。\r\n新疆昌吉市长宁南路      走安能物流到昌吉市自提120元。\r\n广东省 佛山顺德             中通快递120\r\n福建省 漳州市 平和县     中通快递120', '010201', '', 'QH-JX400E', '传递窗', '', '', '2019-02-24 01:35:17', '', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('07A290DE-37FA-11E9-B14D-00163E0CF556', '适用范围，参数', '传递窗是洁净室的一种辅助设备，主要用于洁净区与洁净区、非洁净区与洁净区之间的小件物品的传递，以减少洁净室的开门次数，降低洁净区的污染。适用于微细科技，生物实验室、制药厂、医药、食品加工业、LED、电子厂等需要空气净化的场所\r\n机械连锁尺寸：\r\n\r\n宽*深*高               机械内尺寸            机械外尺寸                                电子互锁内尺寸         电子互锁外尺寸      \r\n400*400*400      280*320*320            520*460*480                              260*320*320              540*460*480\r\n500*500*500      380*420*420            620*560*580                              360*420*420              640*560*580\r\n600*600*600      480*520*520            720*660*680                              460*520*520              740*660*680\r\n700*700*700     580*620*620             820*760*780                              560*620*620              840*760*780  \r\n800*800*800     680*720*720             920*860*880                              660*720*720              940*860*880\r\n900*900*900     780*820*820            1020*960*980                             760*820*820             1040*960*980', '010201', '', 'QH-JX400E', '传递窗', '', '', '2019-02-24 02:04:22', '吴江市汾湖镇胜天净化设备厂', 6, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('6DB16B10-37FB-11E9-B14D-00163E0CF556', '外500运费 ，木箱50元', '湖北省 恩施土家族苗族自治州 来凤县    运费走安能物流120元\r\n河北省 廊坊市 广阳区    安能物流运费120\r\n广东省 江门市 开平市，    运费走德邦物流到开平市自提100元', '010201', '', 'QH-JX400E', '传递窗', '', '', '2019-02-24 02:14:22', '吴江市汾湖镇胜天净化设备厂', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('89D1A66A-37FB-11E9-B14D-00163E0CF556', '外600运费，木箱60', '上海 上海市 崇明县     运费走中通快递60元\r\n广东省 广州市 荔湾区   运费走安能物流140\r\n河南洛阳      运费走安能物流140元，村不送\r\n浙江省 温州市 平阳县     运费走中通60\r\n广西河池市凤山县凤城镇广西凤山中荣野生金花茶投资有限公司     运费走安能150可以送货', '010201', '', 'QH-JX400E', '传递窗', '', '', '2019-02-24 02:15:10', '吴江市汾湖镇胜天净化设备厂', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('BBC09F7D-37FB-11E9-B14D-00163E0CF556', '外700 运费，  木箱75', '山东省 青岛市 城阳区      运费走安能物流送货140元\r\n山东省 潍坊市 寒亭区      150运费送货', '010201', '', 'QH-JX400E', '传递窗', '', '', '2019-02-24 02:16:33', '吴江市汾湖镇胜天净化设备厂', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('D17F3191-37FB-11E9-B14D-00163E0CF556', '外800运费，木箱100', '新疆维吾尔自治区 克孜勒苏柯尔克孜自治州 阿图什市     运费300\r\n山东省 青岛市 城阳区    运费走安能物流150', '010201', '', 'QH-JX400E', '传递窗', '', '', '2019-02-24 02:17:10', '吴江市汾湖镇胜天净化设备厂', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('07CBE6F8-37FF-11E9-B14D-00163E0CF556', '基本知识', '【不含运费，一般发物流，百世快运，安能物流】\r\n【厂家比较配合，主推产品，市场价格较低，有单就卖】\r\n【金额较大或者利润低的单，可以策价】\r\n【普票3个点，专票12个点】\r\n【浙江上虞发货，厂家电话13858582831】', '010201', '/images/2019-02-24/5c723c49cf7cc.jpg', 'YG-2.5-10D', '马弗炉', '', '', '2019-02-24 02:40:09', '上虞市道墟镇景诺仪器设备厂', 1, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('3795B840-3802-11E9-B14D-00163E0CF556', '常见知识', '1、马弗炉分为分体式和一体式两种规格\r\n一体和分体的区别：一体机是不是不需要安装 ，分体需要自己安装线路，一体的可以定时，分体的定时需要另外收费\r\n2、炉壳材质：薄钢板，炉膛材质：高铝，内胆尺寸不含炉门尺寸\r\n3、分体式马弗炉不配电源线 ，如购买需另外加钱，35元2米，70元4米，以此类推；也可自行购买，\r\n2.5  -10  2.5-12   用2.5平方  2心线 \r\n4-10  5-12  4-13  用4平方  2心线 \r\n8-13 10-12  12-12  12-10  用6平方 4心线 \r\n4、所有马弗炉升温速率都是一样的，不能控制升温速率，炉膛的大小不一样，所以功率不一样\r\n5、1000℃加热元件：电热丝，测温元件：镍硅热电偶\r\n      1200℃加热元件：电热丝，测温元件：铂铑热电偶\r\n      1300℃加热元件：电热丝，测温元件：铂铑热电偶\r\n6、分辨率1度 上下波动 按实际温度来的，恒温350度，误差 50-60度 ，温度越高波动度越低\r\n7、要坩埚2.5元  坩埚钳15元   石棉网5元', '010201', '/images/2019-02-24/5c72555fb8b5c.jpg', 'YG-2.5-10D', '马弗炉', '', '', '2019-02-24 03:02:58', '绍兴市上虞区道墟景诺仪器设备厂', 5, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('78EA0290-380E-11E9-B14D-00163E0CF556', '分体2.5-10运费', '北京  运费120\r\n河南南阳内乡县120\r\n内蒙古  运费200\r\n西安市高陵区融豪工业城西安华荣佳铭食品有限公司  送货运费是140\r\n安微安庆运费70\r\n湖北省 黄石市 大冶市 牯羊村上谢湾19号运费120\r\n南通 运费60\r\n湖南邵阳市区运费120\r\n辽宁省 鞍山市岫岩满族自治县  运费200', '010201', '/images/2019-02-24/5c72563213b86.jpg', 'YG-2.5-10D', '马弗炉', '', '', '2019-02-24 04:30:42', '绍兴市上虞区道墟景诺仪器设备厂', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('2817B952-380F-11E9-B14D-00163E0CF556', '分体4-10，5-12运费', '江苏省江阴市峭岐镇  运费80							\r\n大连普兰店  运费230												\r\n 临沂经济开发区联邦路与合肥路交汇处		安能140和德邦220', '010201', '/images/2019-02-24/5c725757efa8d.jpg', 'YG-2.5-10D', '马弗炉', '', '', '2019-02-24 04:35:35', '绍兴市上虞区道墟景诺仪器设备厂', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('93050E26-3899-11E9-B14D-00163E0CF556', '安装方式', '安装方式：\r\n1.在墙体选择方便的位置，然后开孔，孔一般比传递窗外径大10mm左右\r\n2.把传递窗放入墙体，一般安装在墙体中间，保持平衡固定\r\n3.用圆角或其他装饰条来装饰传递窗与墙体的缝隙，打胶密封修饰即可', '010201', '', 'QH-JX400E', '传递窗', '', '', '2019-02-25 09:06:25', '', 2, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('066FAE73-389D-11E9-B14D-00163E0CF556', '基本问题', '一、液压移车器功能用途：\r\n液压移车器能安全快捷地抬升和移动汽车，可使汽车任意方向移动。使用该移车器，可在1-2分钟内把汽车移开，及时疏通道路，紧急清除公路障碍车辆，处理司机乱停乱放、违章停车、阻碍交通、侵占他人车位等行为。 \r\n二、液压移车器适用范围：\r\n停车场，拖车公司，汽车展厅，汽车修理厂，汽车收藏家及博物馆，市政城管执法机构，交通管理部门等。 \r\n三、液压移车器成部件：\r\n万向脚轮，止轮臂，滚筒，液压收缩器，踏板，安全插销。 \r\n四、液压移车器技术参数：\r\n单个移车器最大抬升重量680公斤；移个器每套四支；单个净重18公斤；单个尺寸长50cm*宽60cm*高15cm；可适用直径75cm以下车轮。 \r\n五、液压移车器操作方法：\r\n使用时，拔出安全插销，逆时针旋转液压阀门1圈使液压收缩器卸压，用力展开移车器，将移车器从车轮胎外侧推进，顺时针拧紧液压阀门，踏动踏板逐步“挤压”滚筒之间的车辆轮胎，使滚筒之间距离缩短，从而挤抬车轮离开地面，四个车轮抬离地面插好安全插销后，即可推移车辆；汽车移到指定地点后，拔出安全插销逆时针旋转液压阀门1圈使液压收缩器卸压车轮自动放下，取走移车器。\r\n六：移车器材质：优质型钢（碳钢）。决定移车器的使用的是看客户车子的承载量，然后在选择型号，各型号的价值差别在于承载量，滚筒和液压缸不同，决定了价格不同。', '010201', '/images/2019-02-25/5c73455c0c735.png', 'TQ-YC1001A', '移车器', '', '', '2019-02-25 09:31:08', '上海台庆交通设施有限公司电话15821006683', 1, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('E1C03D75-389E-11E9-B14D-00163E0CF556', '厂家信息', '1、厂家信息--联系人：李婷 手 机：15000067156 电 话：021-51872373 传 真：021-34970510 Q Q: 2108539380 邮 箱：2108539380@qq.com 地 址：上海奉贤区同迎路235号\r\n2、江苏/山东发货，发佳吉物流\r\n3、可以开增票+10个点\r\n4、有三证无质检\r\n5、成本：YC-Y-1001价格345元，YC-Y-2001价格365元，YC-Y-3001价格415元，YC-Y-4001价格465元，机械式YC-X-2001价格320元，摆放架110元，锁车器35元一个\r\n6、移车器教学使用视频：http://v.youku.com/v_show/id_XMzMwMDA2MTczNg==.html / 移车器工作视频：https://tbm.alicdn.com/ZDsVgmWjjXb4BM9mABE/hZ1KHLbMFJI7TdWeH9Z%40%40ld.mp4 /\r\n7、移车器的区别：1001承重在2.8吨以内   2001.3001.4001承重在4吨以内；\r\n2001和3001的区别是滚筒，2001是PE滚筒， 3001的滚筒是铝合金的滚筒，4001滚筒也是铝合金的；\r\n其中 2001  、3001  、1001 适合19寸一下的轮胎  4001适合22寸以下的轮胎\r\n您您可以根据您的要求来选择的哦！\r\n8、组合移车器区别：亲 叉车移车器是要叉车+移车器一套才可以正常移车的哦，3吨叉车就是在3吨以内的车就可以的，4吨的就是4吨以内的车就可以移动的，1.6米是指叉车长度1.6米（不连架子），展开宽度可达2米左右，1.8米是指的叉车长度1.8米（不连架子），展开宽度可达2.2米左右，1001  2001   3001 的移车器均适合适合19寸以内的轮胎，一般物业用的最多的就是3001的哦 ！ 另外移车器已经通过《公安部与警用电子产品检测中心》质检哦，请亲们放心购买！！！\r\n9、页面都是单个的价格，4个是一套，必须是一套才可以正常使用，叉车款式需要叉车加移车器一套才可以正常使用。', '010201', '', 'TQ-YC1001A', '移车器', '', '', '2019-02-25 09:44:25', '', 1, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('195D59A2-389F-11E9-B14D-00163E0CF556', '各地运费，非偏远地区可以直接包邮给', '湖北武汉 1个佳吉60； 湖北武汉 4个普通物流120； 4个 湖州 80元自提货\r\n浙江嘉兴 4个佳吉70； \r\n江苏苏州 3个佳吉80；江苏苏州 1个佳吉55；江苏徐州 4个佳吉80\r\n山东菏泽 1个佳吉60；\r\n河北邢台 4个普通物流200；\r\n四川德阳 1个百世80\r\n天津 4个+摆放架普通物流170；\r\n广东深圳 1个佳吉70；广东深圳 4个顺丰150； 4个运费170 正常可以送货 \r\n吉林榆树4个 200自提\r\n福建莆田 4个 140元提货', '010201', '', 'TQ-YC1001A', '移车器', '', '', '2019-02-25 09:45:58', '上海台庆交通设施有限公司电话15821006683', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('B5C1BC67-389F-11E9-B14D-00163E0CF556', '分体8-10、10-12运费', '广东省 东莞市 横沥镇水边四马村外环路3号(金庆新材料)          运费200							\r\n湖北省十堰市白浪经济技术开发区神鹰工业园      运费220', '010201', '', 'YG-2.5-10D', '马弗炉', '', '', '2019-02-25 09:50:21', '吴江市汾湖镇胜天净化设备厂', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('ED5B353B-389F-11E9-B14D-00163E0CF556', '退货地址', '中国上海金山区亭林镇林宝路39号10幢H9室', '010201', '', 'TQ-YC1001A', '移车器', '', '', '2019-02-25 09:51:54', '', 2, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('1237F291-38A0-11E9-B14D-00163E0CF556', '一体式4-10、5-12', '到云南德宏               运费260\r\n江苏南京                       运费 100\r\n云南省 红河哈尼族彝族自治州 河口瑶族自治县      运费250\r\n浙江杭州市临安区昌化镇  80', '010201', '', 'YG-2.5-10D', '马弗炉', '', '', '2019-02-25 09:52:56', '绍兴市上虞区道墟景诺仪器设备厂', 4, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('5B93D9DB-38A1-11E9-B14D-00163E0CF556', '产品成本', '产品名称		                     规格		               内构	 	价格									\r\n环保箱（集装箱门）\r\n4层过滤，第一层漆雾毡地棉，第二层活性炭棉，中间一道阻隔板上下通风，通过两层活性炭颗粒网往外排风（注：2.5米尺寸增加一道漆雾毡）								\r\n1.6m（米）5000风量       1600*1100*1300				 1600										\r\n2m10000风量	          	2000*1100*1300			 	1950										\r\n2.5m1.5w-2w风量		2500*1100*1300		                2500									\r\n环保箱（普通门）															\r\n1m		                1000*1100*1300		                3层		1250									\r\n1.6m（米）		1600*1100*1300		              3-4层		1400-1450								\r\n2m		               2000*1100*1300		              4层		1850									\r\n2.5m	         	2500*1100*1300	                	4-5层		2350		\r\n								\r\n注：将过滤棉棉换活性炭砖，一层加320元（砖块大小 10*10*5 厘米）																\r\nUV光氧催化		规格尺寸		价格/市场好管与次管		废气处理搭配										\r\n5000风量		      1600*1100*1300		2350/2450												\r\n10000风量	     2500*1100*1300		3200/3600											\r\n15000风量		2500*1100*1300		4000/4400												\r\n20000风量		2500*1100*1700		5300/5600												\r\n3万风量		    3300*1100*1700		       8400/8800				\r\n								\r\n环保水帘柜		规格尺寸		      价格	                    	配件										\r\n1米		      1000*1200*2000		2400		1台2.2KW铜芯风机									\r\n1.5米		1500*1200*2000		2650		1台2.2KW铜芯风机									\r\n2米		     2000*1200*2000		2900		1台2.2KW铜芯风机		\r\n2.5米		2500*1200*2000		3150-3900		1-2台2.2kw									\r\n3米		3000*1200*2000		   3900-4600		    1-2台2.2kw										\r\n4米		4000*1200*2000	         	5000		          2台2.2kw									\r\n注：带防爆灯（外轴流风机）3KW是铝芯 ，一台风机配送一米风筒一个弯头 								\r\n								\r\n立式吸尘柜		规格尺寸		风机		价格									\r\n1米		1000*1000*2400		1轴流		2300										\r\n2米		2000*1000*2400		2轴流		4700		\r\n3米		3000*1000*2400		3轴流		5700										\r\n4米		4000*1000*2400		4轴流		6800									\r\n注：可换离心风机3/4KW风机价格另询（我们都带油水分离器，其他所有卖家都没有）								\r\n								\r\npp喷淋塔风量		规格尺寸		料厚		价格										\r\n10000		1200*1200*3000		0.8		3100										\r\n12000		1200*1200*3500		0.8		3300										\r\n15000		1.5*1.5*3.5		      0.8		3600										\r\n20000		1800*1800*4500		1		7000										\r\n25000-30000		2000*2000*4500		1		7400		\r\n								\r\n旱烟净化器		规格		     材料		                       价格		\r\n单臂		      1.1kw风机		镀锌板高温喷塑3个厚		1150										\r\n双臂		        2.2kw		镀锌板高温喷塑3个厚		1650		\r\n								\r\n标配 带臂2米长 															\r\n4-72风机		规格		材料		价格										\r\n3kw		       3.6A		铁板喷塑/喷漆		900										\r\n5.5kw		4A		铁板喷塑/喷漆		1300										\r\n7.5kw		6A		铁板喷塑/喷漆		2200										\r\n11kw		7A		铁板喷塑/喷漆		2850										\r\n15kw		7A		铁板喷塑/喷漆		3000										\r\n18.5kw	  皮带6500       直联4200		\r\n等离子一体机														\r\n价格		             规格	                     	内部包含	                         	价格								\r\n1万风量		2×1.3×1.3		20跟灯管		                             4500								\r\n 15000风量等离子光氧一体机 		2.5*1.3*1.3				4900', '010201', '', 'BY-JZX', '环保设备', '', '', '2019-02-25 10:02:08', '', 1, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('937C6D65-38A1-11E9-B14D-00163E0CF556', '炉口、炉膛损坏', '如收到货发现炉膛或者炉口损坏，可以直接补发一个给客户，如果是使用过程中出现这种情况不予免费补发', '010201', '', 'YG-2.5-10D', '马弗炉', '', '', '2019-02-25 10:03:42', '绍兴市上虞区道墟景诺仪器设备厂', 2, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('E5243AAD-38A1-11E9-B14D-00163E0CF556', '分体式线路安装', '电源线就是用来连接仪表和箱体的，附：线路安装图', '010201', '/images/2019-02-25/5c734d87a4e8e.png', 'YG-2.5-10D', '马弗炉', '', '', '2019-02-25 10:05:59', '绍兴市上虞区道墟景诺仪器设备厂', 2, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('924E0548-38A3-11E9-B14D-00163E0CF556', '烧制银饰、粉煤灰 、陶瓷、煤质化验、加热塑料、烧灰份', '可以用，需要问客户的温度需求，是不是在机器的温度范围内，还有例如：加热塑料有烟，烟会让电热丝的使用寿命变短，建议使用硅碳棒作为加热元件，顶上开孔，', '010201', '', 'YG-2.5-10D', '马弗炉', '', '', '2019-02-25 10:17:59', '绍兴市上虞区道墟景诺仪器设备厂', 3, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('139E2D47-38A4-11E9-B14D-00163E0CF556', '适用范围', '马弗炉适用于实验室、工矿企业、科研单位做元素分析测定和一般小型钢件淬火、退火、回火等热处理时加热用，高温马弗炉还可以做金属、陶瓷的烧结、溶解、分析等高温加热用', '010201', '/images/2019-02-25/5c73599169f46.jpg', 'YG-2.5-10D', '马弗炉', '', '', '2019-02-25 10:21:36', '绍兴市上虞区道墟景诺仪器设备厂', 6, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('9DBE2D9A-38AA-11E9-B14D-00163E0CF556', '厂家资质', '厂家只有营业执照，营业期限：2018年03月27日，没有生产资质，属于代理经销', '010201', '/images/2019-02-25/5c735c2957a4e.jpg', 'YG-2.5-10D', '马弗炉', '', '', '2019-02-25 11:08:25', '绍兴市上虞区道墟景诺仪器设备厂', 7, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('84A88E2B-38AB-11E9-B14D-00163E0CF556', '电压的区别', '炉膛大的功率太大只能380V，220V 电压带不了，易烧坏，加热速度都差不多', '010201', '', 'YG-2.5-10D', '马弗炉', '', '', '2019-02-25 11:14:52', '', 3, NULL, NULL);
INSERT INTO `t_knowledge` VALUES ('274A98EE-38AC-11E9-B14D-00163E0CF556', '升温速度可调、升温时间', '升温速度不可调的', '010201', '', 'YG-2.5-10D', '马弗炉', '', '', '2019-02-25 11:19:25', '', 3, NULL, NULL);

-- ----------------------------
-- Table structure for t_knowledge_map
-- ----------------------------
DROP TABLE IF EXISTS `t_knowledge_map`;
CREATE TABLE `t_knowledge_map`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowledge_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num_iid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_knowledge_map
-- ----------------------------
INSERT INTO `t_knowledge_map` VALUES (4, 'B7134EE3-193C-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (5, 'CD004B61-1E0F-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (6, 'F046338F-1E0F-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (9, '015C0F4D-1E11-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (10, 'CD24822E-1E10-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (12, 'CD1D57D7-1E11-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (14, 'C435DDC1-1E11-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (16, 'D0077F13-1E12-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (17, '2288A0AA-1E16-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (18, '2C3D8FA8-1E17-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (19, 'FB0EE051-1E17-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (20, 'BE4F6FFF-1E18-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (21, 'B1CD383E-1E21-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (22, 'E70507D3-1E21-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (23, '1B82B58B-1E23-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (24, '6A45F9DD-1E25-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (25, 'DD63D71F-1E25-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (26, '3750B1B1-1E26-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (27, '9765C237-1E26-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (28, '1DB340AE-1E27-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (29, '79415F81-1E27-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (31, '37B2B1AA-1EDC-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (32, '86EE1BDA-1EDE-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (33, '8D621DA2-2DD0-11E9-B14D-00163E0CF556', '');
INSERT INTO `t_knowledge_map` VALUES (35, '346B47F7-31B8-11E9-B14D-00163E0CF556', '');

-- ----------------------------
-- Table structure for t_knowledge_sort
-- ----------------------------
DROP TABLE IF EXISTS `t_knowledge_sort`;
CREATE TABLE `t_knowledge_sort`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_knowledge_sort
-- ----------------------------
INSERT INTO `t_knowledge_sort` VALUES (1, '基本知识');
INSERT INTO `t_knowledge_sort` VALUES (2, '售后问题');
INSERT INTO `t_knowledge_sort` VALUES (3, '技术问题');
INSERT INTO `t_knowledge_sort` VALUES (4, '物流运费');
INSERT INTO `t_knowledge_sort` VALUES (5, '常见知识');
INSERT INTO `t_knowledge_sort` VALUES (6, '参数适用范围');
INSERT INTO `t_knowledge_sort` VALUES (7, '知识证书');

-- ----------------------------
-- Table structure for t_knownledge_file
-- ----------------------------
DROP TABLE IF EXISTS `t_knownledge_file`;
CREATE TABLE `t_knownledge_file`  (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_type` int(11) NULL DEFAULT NULL,
  `knowledge_id` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_knownledge_file
-- ----------------------------
INSERT INTO `t_knownledge_file` VALUES (10, '微信图片.jpg', '/profile/uploadPath/2019/09/21/c82f8ab2012e78b31775cfb196d92578.jpg', 1, '1569034753530');
INSERT INTO `t_knownledge_file` VALUES (11, '微信图片.jpg', '/profile/uploadPath/2019/09/21/c82f8ab2012e78b31775cfb196d92578.jpg', 1, '1569034753530');
INSERT INTO `t_knownledge_file` VALUES (14, 'd71b09eedfc694b8ab09ec968f59e3de.mp4', '/profile/uploadPath/2019/09/21/619b67a74eddf282c4c112b34c1df590.mp4', 2, '1569034753530');
INSERT INTO `t_knownledge_file` VALUES (15, '王耀辉.docx', '/profile/uploadPath/2019/09/21/57ae28258ccf23308fd7112a092a7f7a.docx', 3, '1569034753530');
INSERT INTO `t_knownledge_file` VALUES (16, '微信图片_20190624102944.jpg', '/profile/uploadPath/2019/09/21/de8d529b37d1743cb7084b251bc537af.jpg', 1, '1569066913593');
INSERT INTO `t_knownledge_file` VALUES (17, '微信图片_20190702114449.jpg', '/profile/uploadPath/2019/09/21/1a26cb65159e7ac90debb59c60e6d6eb.jpg', 1, '1569066913593');
INSERT INTO `t_knownledge_file` VALUES (18, '微信图片_20190723114112.jpg', '/profile/uploadPath/2019/09/21/59577365d928100c92f5b43fcdcff76c.jpg', 1, '1569066913593');
INSERT INTO `t_knownledge_file` VALUES (29, '微信图片_20190624102944.jpg', '/profile/uploadPath/2019/09/21/53a74719d8eee7e0cbe102838ff66393.jpg', 1, '07CBE6F8-37FF-11E9-B14D-00163E0CF556');
INSERT INTO `t_knownledge_file` VALUES (30, '微信图片_20190702114449.jpg', '/profile/uploadPath/2019/09/21/abf55357b427b2a750cd0aa180b424d7.jpg', 1, '07CBE6F8-37FF-11E9-B14D-00163E0CF556');
INSERT INTO `t_knownledge_file` VALUES (31, '微信图片_20190723114112.jpg', '/profile/uploadPath/2019/09/21/0b8ffae03857c9509ce465349ae0a887.jpg', 1, '07CBE6F8-37FF-11E9-B14D-00163E0CF556');
INSERT INTO `t_knownledge_file` VALUES (35, '微信图片_20190624102944.jpg', '/profile/uploadPath/2019/09/22/b938089f395ad3b04a330aaec0b4ec37.jpg', 1, '07E121D4-C392-11E8-97BF-00163E0CF556');
INSERT INTO `t_knownledge_file` VALUES (36, '微信图片_20190723114112.jpg', '/profile/uploadPath/2019/09/22/e1a38938cfcdad8580927ce62165ad38.jpg', 1, 'B4DA5066-C394-11E8-97BF-00163E0CF556');
INSERT INTO `t_knownledge_file` VALUES (37, '微信图片_20190702114449.jpg', '/profile/uploadPath/2019/09/22/de0c217eb9086c69a5d34070af9e7bb4.jpg', 1, '9A204819-C447-11E8-97BF-00163E0CF556');
INSERT INTO `t_knownledge_file` VALUES (42, '[{H1]WI7U}I$O5)3TU46`7O.jpg', '/profile/uploadPath/2019/09/22/7158e824fc64c8e6d8089392926b0293.jpg', 1, 'D60C21B9-C447-11E8-97BF-00163E0CF556');
INSERT INTO `t_knownledge_file` VALUES (43, '微信图片_20190624102944 - 副本.jpg', '/profile/uploadPath/2019/09/22/d71a33dc416bf2613e0c10837b1a00da.jpg', 1, 'D60C21B9-C447-11E8-97BF-00163E0CF556');
INSERT INTO `t_knownledge_file` VALUES (44, '微信图片_20190624102944.jpg', '/profile/uploadPath/2019/09/22/09a312786974d63539a9715854ea1979.jpg', 1, 'D60C21B9-C447-11E8-97BF-00163E0CF556');
INSERT INTO `t_knownledge_file` VALUES (45, '微信图片_20190702114449.jpg', '/profile/uploadPath/2019/09/22/109c67ede1d51a839252ca731965fe8b.jpg', 1, 'D60C21B9-C447-11E8-97BF-00163E0CF556');
INSERT INTO `t_knownledge_file` VALUES (46, '微信图片_20190723114112.jpg', '/profile/uploadPath/2019/09/22/4a61691821183afbebb4cb68932ecece.jpg', 1, 'D60C21B9-C447-11E8-97BF-00163E0CF556');

-- ----------------------------
-- Table structure for t_org
-- ----------------------------
DROP TABLE IF EXISTS `t_org`;
CREATE TABLE `t_org`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `full_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `org_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_org
-- ----------------------------
INSERT INTO `t_org` VALUES ('17C2B038-545C-11E9-B14D-00163E0CF556', '异地仓库', '异地仓库', '11', NULL, '11');
INSERT INTO `t_org` VALUES ('1CFCF81B-545B-11E9-B14D-00163E0CF556', '异地仓库\\森特工频逆变器仓库', '森特工频逆变器仓库', '1106', '17C2B038-545C-11E9-B14D-00163E0CF556', '1108');
INSERT INTO `t_org` VALUES ('2369FCF6-9DDE-11E8-B710-00163E0CF556', '异地仓库\\雨花区工厂仓库', '雨花区工厂仓库', '1102', '17C2B038-545C-11E9-B14D-00163E0CF556', '1101');
INSERT INTO `t_org` VALUES ('26D8DBC6-545B-11E9-B14D-00163E0CF556', '异地仓库\\金晟太阳能板仓库', '金晟太阳能板仓库', '1107', '17C2B038-545C-11E9-B14D-00163E0CF556', '1109');
INSERT INTO `t_org` VALUES ('297C6614-9DDE-11E8-B710-00163E0CF556', '异地仓库\\佛山工厂仓库', '佛山工厂仓库', '1101', '17C2B038-545C-11E9-B14D-00163E0CF556', '1102');
INSERT INTO `t_org` VALUES ('31EAC132-545B-11E9-B14D-00163E0CF556', '异地仓库\\昇阳（汉非）板子控制器仓库', '昇阳（汉非）板子控制器仓库', '1108', '17C2B038-545C-11E9-B14D-00163E0CF556', '1107');
INSERT INTO `t_org` VALUES ('4D175BBC-9DDE-11E8-B710-00163E0CF556', '岳麓区天马\\销售部', '销售部', '0102', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B', '0102');
INSERT INTO `t_org` VALUES ('4D74E1E4-A129-11E4-9B6A-782BCBD7746B', '岳麓区天马', '岳麓区天马', '01', NULL, '01');
INSERT INTO `t_org` VALUES ('50F77124-545B-11E9-B14D-00163E0CF556', '异地仓库\\耐普电池仓库', '耐普电池仓库', '1109', '17C2B038-545C-11E9-B14D-00163E0CF556', '1106');
INSERT INTO `t_org` VALUES ('5B160EBF-9DF8-11E8-B710-00163E0CF556', '岳麓区天马\\销售部\\光合', '光合', '010201', '4D175BBC-9DDE-11E8-B710-00163E0CF556', '010201');
INSERT INTO `t_org` VALUES ('5C667223-59CF-11E9-B14D-00163E0CF556', '代发仓库', '代发仓库', '21', NULL, '12');
INSERT INTO `t_org` VALUES ('5EBDBE11-A129-11E4-9B6A-782BCBD7746B', '岳麓区天马\\财务部', '财务部', '0101', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B', '0101');
INSERT INTO `t_org` VALUES ('638D242F-1BC3-11E9-B14D-00163E0CF556', '岳麓区天马\\销售部\\光合菲泰', '光合菲泰', '010205', '4D175BBC-9DDE-11E8-B710-00163E0CF556', '010205');
INSERT INTO `t_org` VALUES ('6EE85527-2E79-11E9-B14D-00163E0CF556', '岳麓区天马\\销售部\\光合重用', '光合重用', '010211', '4D175BBC-9DDE-11E8-B710-00163E0CF556', '010211');
INSERT INTO `t_org` VALUES ('73E6A304-1BC3-11E9-B14D-00163E0CF556', '岳麓区天马\\销售部\\豁然开朗', '豁然开朗', '010206', '4D175BBC-9DDE-11E8-B710-00163E0CF556', '010206');
INSERT INTO `t_org` VALUES ('774C0F32-545A-11E9-B14D-00163E0CF556', '异地仓库\\文敬电池仓库', '文敬电池仓库', '1104', '17C2B038-545C-11E9-B14D-00163E0CF556', '1103');
INSERT INTO `t_org` VALUES ('7B5BD9C0-9DF8-11E8-B710-00163E0CF556', '岳麓区天马\\销售部\\光合硅能', '光合硅能', '010202', '4D175BBC-9DDE-11E8-B710-00163E0CF556', '010202');
INSERT INTO `t_org` VALUES ('7C6AC9A4-2E78-11E9-B14D-00163E0CF556', '岳麓区天马\\销售部\\战车', '战车', '010208', '4D175BBC-9DDE-11E8-B710-00163E0CF556', '010208');
INSERT INTO `t_org` VALUES ('7E3EB105-1BC3-11E9-B14D-00163E0CF556', '岳麓区天马\\销售部\\古灵', '古灵', '010207', '4D175BBC-9DDE-11E8-B710-00163E0CF556', '010207');
INSERT INTO `t_org` VALUES ('8255B751-545A-11E9-B14D-00163E0CF556', '异地仓库\\地埋箱卜兆林仓库', '地埋箱卜兆林仓库', '1105', '17C2B038-545C-11E9-B14D-00163E0CF556', '1104');
INSERT INTO `t_org` VALUES ('847155B6-9DF8-11E8-B710-00163E0CF556', '岳麓区天马\\销售部\\动力足', '动力足', '010203', '4D175BBC-9DDE-11E8-B710-00163E0CF556', '010203');
INSERT INTO `t_org` VALUES ('914E6163-2E78-11E9-B14D-00163E0CF556', '岳麓区天马\\销售部\\战车菲泰', '战车菲泰', '010209', '4D175BBC-9DDE-11E8-B710-00163E0CF556', '010209');
INSERT INTO `t_org` VALUES ('AA023802-2E78-11E9-B14D-00163E0CF556', '岳麓区天马\\销售部\\青春泉', '青春泉', '010210', '4D175BBC-9DDE-11E8-B710-00163E0CF556', '010210');
INSERT INTO `t_org` VALUES ('B507BB20-545B-11E9-B14D-00163E0CF556', '异地仓库\\蒲大海电池仓库', '蒲大海电池仓库', '1110', '17C2B038-545C-11E9-B14D-00163E0CF556', '1105');
INSERT INTO `t_org` VALUES ('E14EDD6B-5A8A-11E9-B14D-00163E0CF556', '异地仓库\\天马仓库', '天马仓库', '1111', '17C2B038-545C-11E9-B14D-00163E0CF556', '1110');
INSERT INTO `t_org` VALUES ('E5A9ADDD-9DFA-11E8-B710-00163E0CF556', '岳麓区天马\\销售部\\张艳', '张艳', '010204', '4D175BBC-9DDE-11E8-B710-00163E0CF556', '010204');
INSERT INTO `t_org` VALUES ('E6F7F991-ACE5-11E8-B710-00163E0CF556', '岳麓区天马\\采购部', '采购部', '0104', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B', '0104');

SET FOREIGN_KEY_CHECKS = 1;
