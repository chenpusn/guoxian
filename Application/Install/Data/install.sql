SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wp_action`
-- ----------------------------
DROP TABLE IF EXISTS `wp_action`;
CREATE TABLE `wp_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统行为表';

-- ----------------------------
-- Records of wp_action
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `wp_action_log`;
CREATE TABLE `wp_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`) ,
  KEY `action_id_ix` (`action_id`) ,
  KEY `user_id_ix` (`user_id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行为日志表';

-- ----------------------------
-- Records of wp_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_addon_category`
-- ----------------------------
DROP TABLE IF EXISTS `wp_addon_category`;
CREATE TABLE `wp_addon_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `icon` int(10) unsigned DEFAULT NULL COMMENT '分类图标',
  `title` varchar(255) DEFAULT NULL COMMENT '分类名',
  `sort` int(10) DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='插件分类表';

-- ----------------------------
-- Records of wp_addon_category
-- ----------------------------
INSERT INTO `wp_addon_category` VALUES ('1', null, '基础功能', '1');
INSERT INTO `wp_addon_category` VALUES ('2', null, '通用功能', '2');
INSERT INTO `wp_addon_category` VALUES ('3', null, '高级功能', '3');
INSERT INTO `wp_addon_category` VALUES ('4', null, '扩展功能', '4');

-- ----------------------------
-- Table structure for `wp_addons`
-- ----------------------------
DROP TABLE IF EXISTS `wp_addons`;
CREATE TABLE `wp_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  `type` tinyint(1) DEFAULT '0' COMMENT '插件类型 0 普通插件 1 微信插件 2 易信插件',
  `cate_id` int(11) DEFAULT NULL,
  `is_show` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) ,
  KEY `sti` (`status`,`is_show`) 
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='微信插件表';

-- ----------------------------
-- Records of wp_addons
-- ----------------------------
INSERT INTO `wp_addons` VALUES ('1', 'Wecome', '欢迎语', '用户关注公众号时发送的欢迎信息，支持文本，图片，图文的信息', '1', '{\"type\":\"1\",\"title\":\"\",\"description\":\"欢迎关注，请<a href=\"[follow]\">绑定帐号</a>后体验更多功能\",\"pic_url\":\"\",\"url\":\"\"}', '地下凡星', '0.1', '1389620372', '0', '0', '1', '1');
INSERT INTO `wp_addons` VALUES ('2', 'AutoReply', '自动回复', 'WeiPHP基础功能，能实现配置关键词，用户回复此关键词后自动回复对应的文件，图文，图片信息', '1', 'null', '凡星', '0.1', '1439194276', '1', '0', '1', '1');
INSERT INTO `wp_addons` VALUES ('3', 'CustomMenu', '自定义菜单', '自定义菜单能够帮助公众号丰富界面，让用户更好更快地理解公众号的功能', '1', 'null', '凡星', '0.1', '1398264735', '1', '0', '1', '1');
INSERT INTO `wp_addons` VALUES ('4', 'WeiSite', '微官网', '微官网', '1', 'null', '凡星', '0.1', '1395326578', '0', '0', '3', '1');

-- ----------------------------
-- Table structure for `wp_analysis`
-- ----------------------------
DROP TABLE IF EXISTS `wp_analysis`;
CREATE TABLE `wp_analysis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sports_id` int(10) DEFAULT NULL COMMENT 'sports_id',
  `type` varchar(30) DEFAULT NULL COMMENT 'type',
  `time` varchar(50) DEFAULT NULL COMMENT 'time',
  `total_count` int(10) DEFAULT '0' COMMENT 'total_count',
  `follow_count` int(10) DEFAULT '0' COMMENT 'follow_count',
  `aver_count` int(10) DEFAULT '0' COMMENT 'aver_count',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_analysis
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_article_style`
-- ----------------------------
DROP TABLE IF EXISTS `wp_article_style`;
CREATE TABLE `wp_article_style` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` int(10) DEFAULT '0' COMMENT '分组样式',
  `style` text COMMENT '样式内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_article_style
-- ----------------------------
INSERT INTO `wp_article_style` VALUES ('1', '1', '<section style=\"border: 0px none; padding: 0px; box-sizing: border-box; margin: 0px; font-family: 微软雅黑;\"><section class=\"main\" style=\"border: none rgb(0,187,236); margin: 0.8em 5% 0.3em; box-sizing: border-box; padding: 0px;\"><section class=\"main2 wxqq-color wxqq-bordertopcolor wxqq-borderleftcolor wxqq-borderrightcolor wxqq-borderbottomcolor\" data-brushtype=\"text\" style=\"color: rgb(0,187,236); font-size: 20px; letter-spacing: 3px; padding: 9px 4px 14px; text-align: center; margin: 0px auto; border: 4px solid rgb(0,187,236); border-top-left-radius: 8px; border-top-right-radius: 8px; border-bottom-right-radius: 8px; border-bottom-left-radius: 8px; box-sizing: border-box;\">理念<span class=\"main3 wxqq-color\" data-brushtype=\"text\" style=\"display: block; font-size: 10px; line-height: 12px; border-color: rgb(0,187,236); color: inherit; box-sizing: border-box; padding: 0px; margin: 0px;\">PHILOSOPHY</span></section><section class=\"main4 wxqq-bordertopcolor wxqq-borderbottomcolor\" style=\"width: 0px; margin-right: auto; margin-left: auto; border-top-width: 0.6em; border-top-style: solid; border-bottom-color: rgb(0,187,236); border-top-color: rgb(0,187,236); height: 10px; color: inherit; border-left-width: 0.7em !important; border-left-style: solid !important; border-left-color: transparent !important; border-right-width: 0.7em !important; border-right-style: solid !important; border-right-color: transparent !important; box-sizing: border-box; padding: 0px;\" data-width=\"0px\"></section></section></section>');
INSERT INTO `wp_article_style` VALUES ('2', '3', '<section label=\"Copyright © 2015 playhudong All Rights Reserved.\" style=\"\r\nmargin:1em auto;\r\npadding: 1em 2em;\r\nborder-style: none;\" id=\"shifu_c_001\"><span style=\"\r\nfloat: left;\r\nmargin-left: 19px;\r\nmargin-top: -9px;\r\noverflow: hidden;\r\ndisplay:block;\"><img style=\"\r\nvertical-align: top;\r\ndisplay:inline-block;\" src=\"http://1251001145.cdn.myqcloud.com/1251001145/style/images/card-3.gif\"><section class=\"color\" style=\"\r\nmin-height: 30px;\r\ncolor: #fff;\r\ndisplay: inline-block;\r\ntext-align: center;\r\nbackground: #999999;\r\nfont-size: 15px;\r\npadding: 7px 5px;\r\nmin-width: 30px;\"><span style=\"font-size:15px;\"> 01 </span></section></span><section style=\"\r\npadding: 16px;\r\npadding-top: 28px;\r\nborder: 2px solid #999999;\r\nwidth: 100%;\r\nfont-size: 14px;\r\nline-height: 1.4;\"><span>星期一天气晴我离开你／不带任何行李／除了一本陪我放逐的日记／今天天晴／心情很低／突然决定离开你</span></section></section>');
INSERT INTO `wp_article_style` VALUES ('3', '1', '<section><section class=\"wxqq-borderleftcolor wxqq-borderRightcolor wxqq-bordertopcolor wxqq-borderbottomcolor\" style=\"border:5px solid #A50003;padding:5px;width:100%;\"><section class=\"wxqq-borderleftcolor wxqq-borderRightcolor wxqq-bordertopcolor wxqq-borderbottomcolor\" style=\"border:1px solid #A50003;padding:15px 20px;\"><p style=\"color:#A50003;text-align:center;border-bottom:1px solid #A50003\"><span class=\"wxqq-color\" data-brushtype=\"text\" style=\"font-size:48px\">情人节快乐</span></p><section data-style=\"color:#A50003;text-align:center;font-size:18px\" style=\"color:#A50003;text-align:center;width:96%;margin-left:5px;\"><p class=\"wxqq-color\" style=\"color:#A50003;text-align:center;font-size:18px\">happy valentine\'s day<span style=\"color:inherit; font-size:24px; line-height:1.6em; text-align:right; text-indent:2em\"></span><span style=\"color:rgb(227, 108, 9); font-size:24px; line-height:1.6em; text-align:right; text-indent:2em\"></span></p><section style=\"width:100%;\"><section><section><p style=\"color:#000;text-align:left;\">我们没有秘密，整天花前月下，别人以为我们不懂爱情，我们乐呵呵地笑大人们都太傻。</p></section></section></section></section></section></section></section>');
INSERT INTO `wp_article_style` VALUES ('4', '4', '<p><img src=\"http://www.wxbj.cn//ys/gz/gx2.gif\"></p>');
INSERT INTO `wp_article_style` VALUES ('5', '5', '<section class=\"tn-Powered-by-XIUMI\" style=\"margin-top: 0.5em; margin-bottom: 0.5em; border: none rgb(142, 201, 101); font-size: 14px; font-family: inherit; font-weight: inherit; text-decoration: inherit; color: rgb(142, 201, 101);\"><img data-src=\"http://mmbiz.qpic.cn/mmbiz/4HiaqFGEibVwaxcmNMU5abRHm7bkZ9icUxC3DrlItWpOnXSjEpZXIeIr2K0923xw43aKw8oibucqm8wkMYZvmibqDkg/0?wx_fmt=png\" class=\"tn-Powered-by-XIUMI\" data-type=\"png\" data-ratio=\"0.8055555555555556\" data-w=\"36\" _width=\"2.6em\" src=\"https://mmbiz.qlogo.cn/mmbiz/4HiaqFGEibVwaxcmNMU5abRHm7bkZ9icUxC3DrlItWpOnXSjEpZXIeIr2K0923xw43aKw8oibucqm8wkMYZvmibqDkg/640?wx_fmt=png\" style=\"float: right; width: 2.6em !important; visibility: visible !important; background-color: rgb(142, 201, 101);\"><section class=\"tn-Powered-by-XIUMI\" style=\"clear: both;\"></section><section class=\"tn-Powered-by-XIUMI\" style=\"padding-right: 10px; padding-left: 10px; text-align: center;\"><section class=\"tn-Powered-by-XIUMI\" style=\"text-align: left;\">炎热的夏季，应该吃点什么好呢！我们为您打造7月盛夏美食狂欢季，清暑解渴的热带水果之王【芒果下午茶】，海鲜盛宴上的【生蚝狂欢】，肉食者的天堂【澳洲之夜】，呼朋唤友，户外聚餐的最佳攻略【夏季BBQ】，消暑瘦身利器【迷你冬瓜盅】，清淡亦或重口味，总有一款是你所爱！</section></section><img data-src=\"http://mmbiz.qpic.cn/mmbiz/4HiaqFGEibVwaxcmNMU5abRHm7bkZ9icUxCkEmrfLmAXYYOXO0q4RGYsQqfzhO6SOdoFCTqYqwlS87ovGrQjCYmWw/0?wx_fmt=png\" class=\"tn-Powered-by-XIUMI\" data-type=\"png\" data-ratio=\"0.8055555555555556\" data-w=\"36\" _width=\"2.6em\" src=\"https://mmbiz.qlogo.cn/mmbiz/4HiaqFGEibVwaxcmNMU5abRHm7bkZ9icUxCkEmrfLmAXYYOXO0q4RGYsQqfzhO6SOdoFCTqYqwlS87ovGrQjCYmWw/640?wx_fmt=png\" style=\"width: 2.6em !important; visibility: visible !important; background-color: rgb(142, 201, 101);\"><p><br></p></section>');
INSERT INTO `wp_article_style` VALUES ('8', '6', '<blockquote class=\"wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor\" style=\"border: 3px dotted rgb(230, 37, 191); padding: 10px; margin: 10px 0px; font-weight: normal; border-top-left-radius: 5px !important; border-top-right-radius: 5px !important; border-bottom-right-radius: 5px !important; border-bottom-left-radius: 5px !important;\"><h3 style=\"color:rgb(89,89,89);font-size:14px;margin:0;\"><span class=\"wxqq-bg\" style=\"background-color: rgb(230, 37, 191); color: rgb(255, 255, 255); padding: 2px 5px; font-size: 14px; margin-right: 15px; border-top-left-radius: 5px !important; border-top-right-radius: 5px !important; border-bottom-right-radius: 5px !important; border-bottom-left-radius: 5px !important;\">微信编辑器</span>微信号：<span class=\"wxqq-bg\" style=\"background-color: rgb(230, 37, 191); color: rgb(255, 255, 255); padding: 2px 5px; font-size: 14px; border-top-left-radius: 5px !important; border-top-right-radius: 5px !important; border-bottom-right-radius: 5px !important; border-bottom-left-radius: 5px !important;\">wxbj.cn</span></h3><p style=\"margin:10px 0 5px 0;\">微信公众号简介，欢迎使用微信在线图文排版编辑器助手！</p></blockquote>');
INSERT INTO `wp_article_style` VALUES ('9', '8', '<p><img src=\"http://www.wxbj.cn/ys/gz/yw1.gif\"></p>');
INSERT INTO `wp_article_style` VALUES ('7', '7', '<p><img src=\"https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhuxibIOsThcH7HF1lpQ0Yvkvh88U3ia9AbTPJSmriawnJ7W7S5iblSlSianbHLGO6IvD0N4g2y2JEFRoA/0/mmbizgif\"></p>');

-- ----------------------------
-- Table structure for `wp_article_style_group`
-- ----------------------------
DROP TABLE IF EXISTS `wp_article_style_group`;
CREATE TABLE `wp_article_style_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_name` varchar(255) DEFAULT NULL COMMENT '分组名称',
  `desc` text COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_article_style_group
-- ----------------------------
INSERT INTO `wp_article_style_group` VALUES ('1', '标题', '标题样式');
INSERT INTO `wp_article_style_group` VALUES ('3', '卡片', '类卡片样式');
INSERT INTO `wp_article_style_group` VALUES ('4', '关注', '引导关注公众号的样式');
INSERT INTO `wp_article_style_group` VALUES ('5', '内容', '内容样式');
INSERT INTO `wp_article_style_group` VALUES ('6', '互推', '互推公众号的样式');
INSERT INTO `wp_article_style_group` VALUES ('7', '分割', '分割样式');
INSERT INTO `wp_article_style_group` VALUES ('8', '原文引导', '原文引导样式');

-- ----------------------------
-- Table structure for `wp_ask`
-- ----------------------------
DROP TABLE IF EXISTS `wp_ask`;
CREATE TABLE `wp_ask` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '封面简介',
  `mTime` int(10) DEFAULT NULL COMMENT '修改时间',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `finish_tip` text COMMENT '结束语',
  `content` text COMMENT '活动介绍',
  `shop_address` text COMMENT '商家地址',
  `appids` text COMMENT '提示关注的公众号',
  `finish_button` text COMMENT '成功抢答完后显示的按钮',
  `card_id` varchar(255) DEFAULT NULL COMMENT '卡券ID',
  `appsecre` varchar(255) DEFAULT NULL COMMENT '卡券对应的appsecre',
  `template` varchar(255) DEFAULT 'default' COMMENT '素材模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_ask
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_ask_answer`
-- ----------------------------
DROP TABLE IF EXISTS `wp_ask_answer`;
CREATE TABLE `wp_ask_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `answer` text COMMENT '回答内容',
  `openid` varchar(255) DEFAULT NULL COMMENT 'OpenId',
  `uid` int(10) DEFAULT NULL COMMENT '用户UID',
  `question_id` int(10) unsigned NOT NULL COMMENT 'question_id',
  `cTime` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `ask_id` int(10) unsigned NOT NULL COMMENT 'ask_id',
  `is_correct` tinyint(2) DEFAULT '1' COMMENT '是否回答正确',
  `times` int(4) DEFAULT '0' COMMENT '次数',
  PRIMARY KEY (`id`),
  KEY `ask_id_uid` (`ask_id`,`uid`) ,
  KEY `question_uid` (`uid`,`question_id`,`times`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_ask_answer
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_ask_question`
-- ----------------------------
DROP TABLE IF EXISTS `wp_ask_question`;
CREATE TABLE `wp_ask_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '问题描述',
  `cTime` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `is_must` tinyint(2) DEFAULT '1' COMMENT '是否必填',
  `extra` text NOT NULL COMMENT '参数',
  `type` char(50) NOT NULL DEFAULT 'radio' COMMENT '问题类型',
  `ask_id` int(10) unsigned NOT NULL COMMENT 'ask_id',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序号',
  `answer` varchar(255) NOT NULL COMMENT '正确答案',
  `is_last` tinyint(2) DEFAULT '0' COMMENT '是否最后一题',
  `wait_time` int(10) DEFAULT '0' COMMENT '等待时间',
  `percent` int(10) DEFAULT '100' COMMENT '抢中概率',
  `answer_time` int(10) DEFAULT NULL COMMENT '答题时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_ask_question
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `wp_attachment`;
CREATE TABLE `wp_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of wp_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `wp_attribute`;
CREATE TABLE `wp_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` text NOT NULL COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`) 
) ENGINE=MyISAM AUTO_INCREMENT=1071 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of wp_attribute
-- ----------------------------
INSERT INTO `wp_attribute` VALUES ('1', 'subscribe_time', '用户关注公众号时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1', '0', '1', '1437720655', '1437720655', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('2', 'remark', '微信用户备注', 'varchar(100) NULL', 'string', '', '', '0', '', '1', '0', '1', '1437720686', '1437720686', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('3', 'groupid', '微信端的分组ID', 'int(10) NULL', 'num', '', '', '0', '', '1', '0', '1', '1437720714', '1437720714', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('4', 'come_from', '来源', 'tinyint(1) NULL', 'select', '0', '', '1', '0:PC注册用户\r\n1:微信同步用户\r\n2:手机注册用户', '1', '0', '1', '1438331477', '1438331357', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('5', 'nickname', '用户名', 'text NULL', 'string', '', '', '1', '', '1', '1', '1', '1440498987', '1436929161', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('6', 'password', '登录密码', 'varchar(100) NULL', 'string', '', '', '1', '', '1', '0', '1', '1436929210', '1436929210', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('7', 'truename', '真实姓名', 'varchar(30) NULL', 'string', '', '', '1', '', '1', '0', '1', '1436929252', '1436929252', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('8', 'mobile', '联系电话', 'varchar(30) NULL', 'string', '', '', '1', '', '1', '0', '1', '1436929280', '1436929280', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('9', 'email', '邮箱地址', 'varchar(100) NULL', 'string', '', '', '1', '', '1', '0', '1', '1436929305', '1436929305', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('10', 'sex', '性别', 'tinyint(2) NULL', 'radio', '', '', '1', '0:保密\r\n1:男\r\n2:女', '1', '0', '1', '1436929397', '1436929397', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('11', 'headimgurl', '头像地址', 'varchar(255) NULL', 'string', '', '', '1', '', '1', '0', '1', '1436929482', '1436929482', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('12', 'city', '城市', 'varchar(30) NULL', 'string', '', '', '1', '', '1', '0', '1', '1436929506', '1436929506', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('13', 'province', '省份', 'varchar(30) NULL', 'string', '', '', '1', '', '1', '0', '1', '1436929524', '1436929524', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('14', 'country', '国家', 'varchar(30) NULL', 'string', '', '', '1', '', '1', '0', '1', '1436929541', '1436929541', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('15', 'language', '语言', 'varchar(20) NULL', 'string', 'zh-cn', '', '1', '', '1', '0', '1', '1436929571', '1436929571', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('16', 'score', '金币值', 'int(10) NULL', 'num', '0', '', '1', '', '1', '0', '1', '1436929631', '1436929597', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('17', 'experience', '经验值', 'int(10) NULL', 'num', '0', '', '1', '', '1', '0', '1', '1436929619', '1436929619', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('18', 'unionid', '微信第三方ID', 'varchar(50) NULL', 'string', '', '', '1', '', '1', '0', '1', '1436929681', '1436929681', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('19', 'login_count', '登录次数', 'int(10) NULL', 'num', '0', '', '1', '', '1', '0', '1', '1436930011', '1436930011', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('20', 'reg_ip', '注册IP', 'varchar(30) NULL', 'string', '', '', '1', '', '1', '0', '1', '1436930035', '1436930035', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('21', 'reg_time', '注册时间', 'int(10) NULL', 'datetime', '', '', '1', '', '1', '0', '1', '1436930051', '1436930051', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('22', 'last_login_ip', '最近登录IP', 'varchar(30) NULL', 'string', '', '', '1', '', '1', '0', '1', '1436930072', '1436930072', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('23', 'last_login_time', '最近登录时间', 'int(10) NULL', 'datetime', '', '', '1', '', '1', '0', '1', '1436930087', '1436930087', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('24', 'status', '状态', 'tinyint(2) NULL', 'bool', '1', '', '1', '0:禁用\r\n1:启用', '1', '0', '1', '1436930138', '1436930138', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('25', 'is_init', '初始化状态', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:未初始化\r\n1:已初始化', '1', '0', '1', '1436930184', '1436930184', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('26', 'is_audit', '审核状态', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:未审核\r\n1:已审核', '1', '0', '1', '1436930216', '1436930216', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('27', 'subscribe_time', '用户关注公众号时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1', '0', '1', '1437720655', '1437720655', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('28', 'remark', '微信用户备注', 'varchar(100) NULL', 'string', '', '', '0', '', '1', '0', '1', '1437720686', '1437720686', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('29', 'groupid', '微信端的分组ID', 'int(10) NULL', 'num', '', '', '0', '', '1', '0', '1', '1437720714', '1437720714', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('30', 'come_from', '来源', 'tinyint(1) NULL', 'select', '0', '', '1', '0:PC注册用户\r\n1:微信同步用户\r\n2:手机注册用户', '1', '0', '1', '1438331477', '1438331357', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('31', 'uid', '用户ID', 'int(10) NULL', 'num', '', '', '1', '', '2', '1', '1', '1436932588', '1436932588', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('32', 'has_public', '是否配置公众号', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:否\r\n1:是', '2', '0', '1', '1436933464', '1436933464', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('33', 'headface_url', '管理员头像', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '2', '0', '1', '1436933503', '1436933503', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('34', 'GammaAppId', '摇电视的AppId', 'varchar(30) NULL', 'string', '', '', '1', '', '2', '0', '1', '1436933562', '1436933562', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('35', 'GammaSecret', '摇电视的Secret', 'varchar(100) NULL', 'string', '', '', '1', '', '2', '0', '1', '1436933602', '1436933602', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('36', 'copy_right', '授权信息', 'varchar(255) NULL', 'string', '', '', '1', '', '2', '0', '1', '1436933690', '1436933690', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('37', 'tongji_code', '统计代码', 'text NULL', 'textarea', '', '', '1', '', '2', '0', '1', '1436933778', '1436933778', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('38', 'website_logo', '网站LOGO', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '2', '0', '1', '1436934006', '1436934006', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('39', 'menu_type', '菜单类型', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:顶级菜单|pid@hide\r\n1:侧栏菜单|pid@show', '3', '0', '1', '1435218508', '1435216049', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('40', 'pid', '上级菜单', 'varchar(50) NULL', 'cascade', '0', '', '1', 'type=db&table=manager_menu&menu_type=0&uid=[manager_id]', '3', '0', '1', '1438858450', '1435216147', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('41', 'title', '菜单名', 'varchar(50) NULL', 'string', '', '', '1', '', '3', '1', '1', '1435216185', '1435216185', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('42', 'url_type', '链接类型', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:插件|addon_name@show,url@hide\r\n1:外链|addon_name@hide,url@show', '3', '0', '1', '1435218596', '1435216291', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('43', 'addon_name', '插件名', 'varchar(30) NULL', 'dynamic_select', '', '', '1', 'table=addons&type=0&value_field=name&title_field=title&order=id asc', '3', '0', '1', '1439433250', '1435216373', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('44', 'url', '外链', 'varchar(255) NULL', 'string', '', '', '1', '', '3', '0', '1', '1435216436', '1435216436', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('45', 'target', '打开方式', 'char(50) NULL', 'select', '_self', '', '1', '_self:当前窗口打开\r\n_blank:在新窗口打开', '3', '0', '1', '1435216626', '1435216626', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('46', 'is_hide', '是否隐藏', 'tinyint(2) NULL', 'radio', '0', '', '1', '0:否\r\n1:是', '3', '0', '1', '1435216697', '1435216697', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('47', 'sort', '排序号', 'int(10) NULL', 'num', '0', '值越小越靠前', '1', '', '3', '0', '1', '1435217270', '1435217270', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('48', 'uid', '管理员ID', 'int(10) NULL', 'num', '', '', '4', '', '3', '0', '1', '1435224916', '1435223957', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('49', 'keyword', '关键词', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '4', '1', '1', '1388815953', '1388815953', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('50', 'addon', '关键词所属插件', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '4', '1', '1', '1388816207', '1388816207', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('51', 'aim_id', '插件表里的ID值', 'int(10) unsigned NOT NULL ', 'num', '', '', '1', '', '4', '1', '1', '1388816287', '1388816287', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('52', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '4', '0', '1', '1407251221', '1388816392', '', '1', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('53', 'token', 'Token', 'varchar(100) NULL ', 'string', '', '', '0', '', '4', '0', '1', '1408945788', '1391399528', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('54', 'keyword_length', '关键词长度', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '4', '0', '1', '1407251147', '1393918566', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('55', 'keyword_type', '匹配类型', 'tinyint(2) NULL ', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '4', '0', '1', '1417745067', '1393919686', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('56', 'extra_text', '文本扩展', 'text NULL ', 'textarea', '', '', '0', '', '4', '0', '1', '1407251248', '1393919736', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('57', 'extra_int', '数字扩展', 'int(10) NULL ', 'num', '', '', '0', '', '4', '0', '1', '1407251240', '1393919798', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('58', 'request_count', '请求数', 'int(10) NULL', 'num', '0', '用户回复的次数', '0', '', '4', '0', '1', '1401938983', '1401938983', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('59', 'qr_code', '二维码', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '5', '1', '1', '1406127577', '1388815953', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('60', 'addon', '二维码所属插件', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '5', '1', '1', '1406127594', '1388816207', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('61', 'aim_id', '插件表里的ID值', 'int(10) unsigned NOT NULL ', 'num', '', '', '1', '', '5', '1', '1', '1388816287', '1388816287', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('62', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '1', '', '5', '0', '1', '1388816392', '1388816392', '', '1', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('63', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '5', '0', '1', '1391399528', '1391399528', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('64', 'action_name', '二维码类型', 'char(30) NULL', 'select', 'QR_SCENE', 'QR_SCENE为临时,QR_LIMIT_SCENE为永久 ', '1', 'QR_SCENE:临时二维码\r\nQR_LIMIT_SCENE:永久二维码', '5', '0', '1', '1406130162', '1393919686', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('65', 'extra_text', '文本扩展', 'text NULL ', 'textarea', '', '', '1', '', '5', '0', '1', '1393919736', '1393919736', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('66', 'extra_int', '数字扩展', 'int(10) NULL ', 'num', '', '', '1', '', '5', '0', '1', '1393919798', '1393919798', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('67', 'request_count', '请求数', 'int(10) NULL', 'num', '0', '用户回复的次数', '0', '', '5', '0', '1', '1402547625', '1401938983', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('68', 'scene_id', '场景ID', 'int(10) NULL', 'num', '0', '', '1', '', '5', '0', '1', '1406127542', '1406127542', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('69', 'is_use', '是否为当前公众号', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:否\r\n1:是', '6', '0', '1', '1391682184', '1391682184', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('70', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '6', '0', '1', '1402453598', '1391597344', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('71', 'uid', '用户ID', 'int(10) NULL ', 'num', '', '', '0', '', '6', '1', '1', '1391575873', '1391575210', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('72', 'public_name', '公众号名称', 'varchar(50) NOT NULL', 'string', '', '', '1', '', '6', '1', '1', '1391576452', '1391575955', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('73', 'public_id', '公众号原始id', 'varchar(100) NOT NULL', 'string', '', '请正确填写，保存后不能再修改，且无法接收到微信的信息', '1', '', '6', '1', '1', '1402453976', '1391576015', '', '1', '公众号原始ID已经存在，请不要重复增加', 'unique', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('74', 'wechat', '微信号', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '6', '1', '1', '1391576484', '1391576144', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('75', 'interface_url', '接口地址', 'varchar(255) NULL', 'string', '', '', '0', '', '6', '0', '1', '1392946881', '1391576234', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('76', 'headface_url', '公众号头像', 'varchar(255) NULL', 'picture', '', '', '1', '', '6', '0', '1', '1429847363', '1391576300', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('77', 'area', '地区', 'varchar(50) NULL', 'string', '', '', '0', '', '6', '0', '1', '1392946934', '1391576435', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('78', 'addon_config', '插件配置', 'text NULL', 'textarea', '', '', '0', '', '6', '0', '1', '1391576537', '1391576537', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('79', 'addon_status', '插件状态', 'text NULL', 'textarea', '', '', '0', '', '6', '0', '1', '1391576571', '1391576571', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('80', 'type', '公众号类型', 'char(10) NULL', 'radio', '0', '', '1', '0:普通订阅号\r\n1:认证订阅号/普通服务号\r\n2:认证服务号', '6', '0', '1', '1416904702', '1393718575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('81', 'appid', 'AppID', 'varchar(255) NULL', 'string', '', '应用ID', '1', '', '6', '0', '1', '1416904750', '1393718735', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('82', 'secret', 'AppSecret', 'varchar(255) NULL', 'string', '', '应用密钥', '1', '', '6', '0', '1', '1416904771', '1393718806', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('83', 'group_id', '等级', 'int(10) unsigned NULL ', 'select', '0', '', '0', '', '6', '0', '1', '1393753499', '1393724468', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('84', 'is_audit', '是否审核', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:否\r\n1:是', '6', '1', '1', '1430879018', '1430879007', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('85', 'is_init', '是否初始化', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:否\r\n1:是', '6', '1', '1', '1430888244', '1430878899', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('86', 'encodingaeskey', 'EncodingAESKey', 'varchar(255) NULL', 'string', '', '安全模式下必填', '1', '', '6', '0', '1', '1419775850', '1419775850', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('87', 'tips_url', '提示关注公众号的文章地址', 'varchar(255) NULL', 'string', '', '', '1', '', '6', '0', '1', '1420789769', '1420789769', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('88', 'GammaAppId', 'GammaAppId', 'varchar(255) NULL', 'string', '', '', '1', '', '6', '0', '1', '1424529968', '1424529968', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('89', 'GammaSecret', 'GammaSecret', 'varchar(255) NULL', 'string', '', '', '1', '', '6', '0', '1', '1424529990', '1424529990', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('90', 'public_copy_right', '版权信息', 'varchar(255) NULL', 'string', '', '', '1', '', '6', '0', '1', '1431141576', '1431141576', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('91', 'domain', '自定义域名', 'varchar(30) NULL', 'string', '', '', '0', '', '6', '0', '1', '1439698931', '1439698931', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('92', 'title', '等级名', 'varchar(50) NULL', 'string', '', '', '1', '', '7', '0', '1', '1393724854', '1393724854', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('93', 'addon_status', '插件权限', 'text NULL', 'checkbox', '', '', '1', '1:好人\r\n2:环境', '7', '0', '1', '1393731903', '1393725072', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('94', 'uid', '管理员UID', 'int(10) NULL ', 'num', '', '可以在用户>用户信息页面的列表第一找到管理员的UID', '1', '', '8', '1', '1', '1398944756', '1398933236', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('95', 'mp_id', '公众号ID', 'int(10) unsigned NOT NULL ', 'num', '', '', '4', '', '8', '1', '1', '1398933300', '1398933300', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('96', 'is_creator', '是否为创建者', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:不是\r\n1:是', '8', '0', '1', '1398933380', '1398933380', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('97', 'addon_status', '插件权限', 'text NULL', 'checkbox', '', '', '1', '', '8', '0', '1', '1398933475', '1398933475', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('98', 'is_use', '是否为当前管理的公众号', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:不是\r\n1:是', '8', '0', '1', '1398996982', '1398996975', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('99', 'attach', '上传文件', 'int(10) unsigned NOT NULL ', 'file', '', '支持xls,xlsx两种格式', '1', '', '9', '1', '1', '1407554177', '1407554177', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('100', 'icon', '分类图标', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '10', '0', '1', '1400047745', '1400047745', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('101', 'title', '分类名', 'varchar(255) NULL', 'string', '', '', '1', '', '10', '0', '1', '1400047764', '1400047764', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('102', 'sort', '排序号', 'int(10) NULL', 'num', '0', '值越小越靠前', '1', '', '10', '0', '1', '1400050453', '1400047786', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('103', 'keyword', '关键词', 'varchar(255) NULL', 'string', '', '多个关键词可以用空格分开，如“高富帅 白富美”', '1', '', '11', '1', '1', '1439194858', '1439194849', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('104', 'msg_type', '消息类型', 'char(50) NULL', 'select', 'text', '', '0', 'text:文本|content@show,group_id@hide,image_id@hide\r\nnews:图文|content@hide,group_id@show,image_id@hide\r\nimage:图片|content@hide,group_id@hide,image_id@show', '11', '1', '1', '1439204529', '1439194979', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('105', 'content', '文本内容', 'text NULL', 'textarea', '', '', '1', '', '11', '0', '1', '1439195826', '1439195091', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('106', 'group_id', '图文', 'int(10) NULL', 'news', '', '', '1', '', '11', '0', '1', '1439204192', '1439195901', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('107', 'image_id', '上传图片', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '11', '0', '1', '1439195945', '1439195945', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('108', 'manager_id', '管理员ID', 'int(10) NULL', 'num', '', '', '0', '', '11', '0', '1', '1439203621', '1439203575', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('109', 'token', 'Token', 'varchar(50) NULL', 'string', '', '', '0', '', '11', '0', '1', '1439203612', '1439203612', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('110', 'name', '分类标识', 'varchar(255) NULL', 'string', '', '只能使用英文', '0', '', '12', '0', '1', '1403711345', '1397529355', '', '3', '只能输入由数字、26个英文字母或者下划线组成的标识名', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('111', 'title', '分类标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '12', '1', '1', '1397529407', '1397529407', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('112', 'icon', '分类图标', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '12', '0', '1', '1397529461', '1397529461', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('113', 'pid', '上一级分类', 'int(10) unsigned NULL ', 'select', '0', '如果你要增加一级分类，这里选择“无”即可', '1', '0:无', '12', '0', '1', '1398266132', '1397529555', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('114', 'path', '分类路径', 'varchar(255) NULL', 'string', '', '', '0', '', '12', '0', '1', '1397529604', '1397529604', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('115', 'module', '分类所属功能', 'varchar(255) NULL', 'string', '', '', '0', '', '12', '0', '1', '1397529671', '1397529671', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('116', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '数值越小越靠前', '1', '', '12', '0', '1', '1397529705', '1397529705', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('117', 'is_show', '是否显示', 'tinyint(2) NULL', 'bool', '1', '', '1', '0:不显示\r\n1:显示', '12', '0', '1', '1397532496', '1397529809', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('118', 'intro', '分类描述', 'varchar(255) NULL', 'string', '', '', '1', '', '12', '0', '1', '1398414247', '1398414247', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('119', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '12', '0', '1', '1398593086', '1398523502', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('120', 'code', '分类扩展编号', 'varchar(255) NULL', 'string', '', '原分类或者导入分类的扩展编号', '0', '', '12', '0', '1', '1404182741', '1404182630', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('121', 'cTime', '发布时间', 'int(10) UNSIGNED NULL', 'datetime', '', '', '0', '', '13', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('122', 'name', '分组标识', 'varchar(100) NOT NULL', 'string', '', '英文字母或者下划线，长度不超过30', '1', '', '13', '1', '1', '1403624543', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('123', 'title', '分组标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '13', '1', '1', '1403624556', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('124', 'level', '最多级数', 'tinyint(1) unsigned NULL', 'select', '3', '', '1', '1:1级\r\n2:2级\r\n3:3级\r\n4:4级\r\n5:5级\r\n6:6级\r\n7:7级', '13', '0', '1', '1404193097', '1404192897', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('125', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '13', '1', '1', '1408947244', '1396602859', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('126', 'title', '积分描述', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '14', '1', '1', '1438589622', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('127', 'name', '积分标识', 'varchar(50) NULL', 'string', '', '', '1', '', '14', '0', '1', '1438589601', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('128', 'mTime', '修改时间', 'int(10) NULL', 'datetime', '', '', '0', '', '14', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('129', 'experience', '经验值', 'int(10) NULL', 'num', '0', '可以是正数，也可以是负数，如 -10 表示减10个经验值', '1', '', '14', '0', '1', '1398564024', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('130', 'score', '金币值', 'int(10) NULL', 'num', '0', '可以是正数，也可以是负数，如 -10 表示减10个金币值', '1', '', '14', '0', '1', '1398564097', '1396062146', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('131', 'token', 'Token', 'varchar(255) NULL', 'string', '0', '', '0', '', '14', '0', '1', '1398564146', '1396602859', '', '3', '', 'regex', '', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('132', 'credit_name', '积分标识', 'varchar(50) NULL', 'string', '', '', '1', '', '15', '0', '1', '1398564405', '1398564405', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('133', 'uid', '用户ID', 'int(10) NULL', 'num', '0', '', '1', '', '15', '0', '1', '1398564351', '1398564351', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('134', 'experience', '经验值', 'int(10) NULL', 'num', '0', '', '1', '', '15', '0', '1', '1398564448', '1398564448', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('135', 'score', '金币值', 'int(10) NULL', 'num', '0', '', '1', '', '15', '0', '1', '1398564486', '1398564486', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('136', 'cTime', '记录时间', 'int(10) NULL', 'datetime', '', '', '0', '', '15', '0', '1', '1398564567', '1398564567', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('137', 'admin_uid', '操作者UID', 'int(10) NULL', 'num', '0', '', '0', '', '15', '0', '1', '1398564629', '1398564629', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('138', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '15', '0', '1', '1400603451', '1400603451', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('139', 'cover_id', '图片在本地的ID', 'int(10) NULL', 'num', '', '', '0', '', '16', '0', '1', '1438684652', '1438684652', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('140', 'cover_url', '本地URL', 'varchar(255) NULL', 'string', '', '', '0', '', '16', '0', '1', '1438684692', '1438684692', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('141', 'media_id', '微信端图文消息素材的media_id', 'varchar(100) NULL', 'string', '0', '', '0', '', '16', '0', '1', '1438744962', '1438684776', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('142', 'wechat_url', '微信端的图片地址', 'varchar(255) NULL', 'string', '', '', '0', '', '16', '0', '1', '1439973558', '1438684807', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('143', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '16', '0', '1', '1438684829', '1438684829', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('144', 'manager_id', '管理员ID', 'int(10) NULL', 'num', '', '', '0', '', '16', '0', '1', '1438684847', '1438684847', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('145', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '16', '0', '1', '1438684865', '1438684865', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('146', 'title', '标题', 'varchar(100) NULL', 'string', '', '', '1', '', '17', '1', '1', '1438670933', '1438670933', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('147', 'author', '作者', 'varchar(30) NULL', 'string', '', '', '1', '', '17', '0', '1', '1438670961', '1438670961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('148', 'cover_id', '封面', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '17', '0', '1', '1438674438', '1438670980', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('149', 'intro', '摘要', 'varchar(255) NULL', 'textarea', '', '', '1', '', '17', '0', '1', '1438671024', '1438671024', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('150', 'content', '内容', 'longtext  NULL', 'editor', '', '', '1', '', '17', '0', '1', '1440473839', '1438671049', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('151', 'link', '外链', 'varchar(255) NULL', 'string', '', '', '1', '', '17', '0', '1', '1438671066', '1438671066', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('152', 'group_id', '多图文组的ID', 'int(10) NULL', 'num', '0', '0 表示单图文，多于0 表示多图文中的第一个图文的ID值', '0', '', '17', '0', '1', '1438671163', '1438671163', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('153', 'thumb_media_id', '图文消息的封面图片素材id（必须是永久mediaID）', 'varchar(100) NULL', 'string', '', '', '0', '', '17', '0', '1', '1438671302', '1438671285', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('154', 'media_id', '微信端图文消息素材的media_id', 'varchar(100) NULL', 'string', '0', '', '1', '', '17', '0', '1', '1438744941', '1438671373', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('155', 'manager_id', '管理员ID', 'int(10) NULL', 'num', '', '', '0', '', '17', '0', '1', '1438683172', '1438683172', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('156', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '17', '0', '1', '1438683194', '1438683194', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('157', 'cTime', '发布时间', 'int(10) NULL', 'datetime', '', '', '0', '', '17', '0', '1', '1438683499', '1438683499', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('158', 'bind_keyword', '关联关键词', 'varchar(50) NULL', 'string', '', '先在自定义回复里增加图文，多图文或者文本内容，再把它的关键词填写到这里', '1', '', '18', '0', '1', '1437984209', '1437984184', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('159', 'preview_openids', '预览人OPENID', 'text NULL', 'textarea', '', '选填，多个可用逗号或者换行分开，OpenID值可在微信用户的列表中找到', '1', '', '18', '0', '1', '1438049470', '1437985038', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('160', 'group_id', '群发对象', 'int(10) NULL', 'dynamic_select', '0', '全部用户或者某分组用户', '1', 'table=auth_group&manager_id=[manager_id]&token=[token]&value_field=id&title_field=title&first_option=全部用户', '18', '0', '1', '1438049058', '1437985498', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('161', 'type', '素材来源', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:站内关键词|bind_keyword@show,media_id@hide\r\n1:微信永久素材ID|bind_keyword@hide,media_id@show', '18', '0', '1', '1437988869', '1437988869', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('162', 'media_id', '微信素材ID', 'varchar(100) NULL', 'string', '', '微信后台的素材管理里永久素材的media_id值', '1', '', '18', '0', '1', '1437988973', '1437988973', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('163', 'send_type', '发送方式', 'tinyint(1) NULL', 'bool', '0', '', '1', '0:按用户组发送|group_id@show,send_openids@hide\r\n1:指定OpenID发送|group_id@hide,send_openids@show', '18', '0', '1', '1438049241', '1438049241', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('164', 'send_openids', '要发送的OpenID', 'text NULL', 'textarea', '', '多个可用逗号或者换行分开，OpenID值可在微信用户的列表中找到', '1', '', '18', '0', '1', '1438049362', '1438049362', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('165', 'msg_id', 'msg_id', 'varchar(255) NULL', 'string', '', '', '0', '', '18', '0', '1', '1439980539', '1438054616', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('166', 'publicid', '公众号ID', 'int(10) NULL', 'num', '0', '', '0', '', '19', '0', '1', '1439448400', '1439448400', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('167', 'module_name', '类型名', 'varchar(30) NULL', 'string', '', '', '0', '', '19', '0', '1', '1439448516', '1439448516', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('168', 'controller_name', '控制器名', 'varchar(30) NULL', 'string', '', '', '0', '', '19', '0', '1', '1439448567', '1439448567', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('169', 'action_name', '方法名', 'varchar(30) NULL', 'string', '', '', '0', '', '19', '0', '1', '1439448616', '1439448616', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('170', 'uid', '访问者ID', 'varchar(255) NULL', 'string', '0', '', '0', '', '19', '0', '1', '1439448654', '1439448654', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('171', 'ip', 'ip地址', 'varchar(30) NULL', 'string', '', '', '0', '', '19', '0', '1', '1439448742', '1439448742', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('172', 'brower', '浏览器', 'varchar(30) NULL', 'string', '', '', '0', '', '19', '0', '1', '1439448792', '1439448792', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('173', 'param', '其它GET参数', 'text NULL', 'textarea', '', '', '0', '', '19', '0', '1', '1439448834', '1439448834', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('174', 'referer', '访问的URL', 'varchar(255) NULL', 'string', '', '', '0', '', '19', '0', '1', '1439448886', '1439448874', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('175', 'cTime', '时间', 'int(10) NULL', 'datetime', '', '', '0', '', '19', '0', '1', '1439450668', '1439450668', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('176', 'wechat_group_name', '微信端的分组名', 'varchar(100) NULL', 'string', '', '', '0', '', '20', '0', '1', '1437635205', '1437635205', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('177', 'wechat_group_id', '微信端的分组ID', 'int(10) NULL', 'num', '', '', '0', '', '20', '0', '1', '1437635149', '1437635149', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('178', 'qr_code', '微信二维码', 'varchar(255) NULL', 'string', '', '', '0', '', '20', '0', '1', '1437635117', '1437635117', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('179', 'is_default', '是否默认自动加入', 'tinyint(1) NULL', 'radio', '0', '只有设置一个默认组，设置当前为默认组后之前的默认组将取消', '0', '0:否\r\n1:是', '20', '0', '1', '1437642358', '1437635042', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('180', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '20', '0', '1', '1437634089', '1437634089', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('181', 'manager_id', '管理员ID', 'int(10) NULL', 'num', '0', '为0时表示系统用户组', '0', '', '20', '0', '1', '1437634309', '1437634062', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('182', 'rules', '权限', 'text NULL', 'textarea', '', '', '0', '', '20', '0', '1', '1437634022', '1437634022', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('183', 'type', '类型', 'tinyint(2) NULL', 'bool', '1', '', '0', '0:普通用户组\r\n1:微信用户组\r\n2:等级用户组\r\n3:认证用户组', '20', '0', '1', '1437633981', '1437633981', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('184', 'status', '状态', 'tinyint(2) NULL', 'bool', '1', '', '0', '1:正常\r\n0:禁用\r\n-1:删除', '20', '0', '1', '1437633826', '1437633826', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('185', 'description', '描述信息', 'text NULL', 'textarea', '', '', '1', '', '20', '0', '1', '1437633751', '1437633751', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('186', 'icon', '图标', 'int(10) UNSIGNED NULL', 'picture', '', '', '0', '', '20', '0', '1', '1437633711', '1437633711', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('187', 'title', '分组名称', 'varchar(30) NULL', 'string', '', '', '1', '', '20', '1', '1', '1437641907', '1437633598', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('188', 'wechat_group_count', '微信端用户数', 'int(10) NULL', 'num', '', '', '0', '', '20', '0', '1', '1437644061', '1437644061', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('189', 'is_del', '是否已删除', 'tinyint(1) NULL', 'bool', '0', '', '0', '0:否\r\n1:是', '20', '0', '1', '1437650054', '1437650044', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('190', 'sports_id', 'sports_id', 'int(10) NULL', 'num', '', '', '0', '', '21', '0', '1', '1432806979', '1432806979', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('191', 'type', 'type', 'varchar(30) NULL', 'string', '', '', '0', '', '21', '0', '1', '1432807001', '1432807001', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('192', 'time', 'time', 'varchar(50) NULL', 'string', '', '', '0', '', '21', '0', '1', '1432807028', '1432807028', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('193', 'total_count', 'total_count', 'int(10) NULL', 'num', '0', '', '0', '', '21', '0', '1', '1432807049', '1432807049', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('194', 'follow_count', 'follow_count', 'int(10) NULL', 'num', '0', '', '0', '', '21', '0', '1', '1432807063', '1432807063', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('195', 'aver_count', 'aver_count', 'int(10) NULL', 'num', '0', '', '0', '', '21', '0', '1', '1432807079', '1432807079', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('196', 'group_id', '分组样式', 'int(10) NULL', 'num', '0', '', '1', '', '22', '0', '1', '1436845570', '1436845570', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('197', 'style', '样式内容', 'text NULL', 'textarea', '', '请填写html', '1', '', '22', '1', '1', '1436846111', '1436846111', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('198', 'group_name', '分组名称', 'varchar(255) NULL', 'string', '', '', '1', '', '23', '1', '1', '1436845332', '1436845332', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('199', 'desc', '说明', 'text NULL', 'textarea', '', '', '1', '', '23', '0', '1', '1436845361', '1436845361', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('200', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '24', '1', '1', '1396624337', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('201', 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '24', '1', '1', '1396624426', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('202', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '24', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('203', 'intro', '封面简介', 'text NULL', 'textarea', '', '', '1', '', '24', '1', '1', '1439367292', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('204', 'mTime', '修改时间', 'int(10) NULL', 'datetime', '', '', '0', '', '24', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('205', 'cover', '封面图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '24', '0', '1', '1396624534', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('206', 'cTime', '发布时间', 'int(10) unsigned NULL ', 'datetime', '', '', '0', '', '24', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('207', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '24', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('208', 'finish_tip', '结束语', 'text NULL', 'textarea', '', '为空默认为：抢答完成，谢谢参与', '1', '', '24', '1', '1', '1439367319', '1396953940', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('209', 'content', '活动介绍', 'text NULL', 'editor', '', '显示在用户进入的开始界面', '1', '', '24', '0', '1', '1420791982', '1420791908', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('210', 'shop_address', '商家地址', 'text NULL', 'textarea', '', '显示在马上开始的下面，多个地址用英文逗号或者换行分割', '1', '', '24', '0', '1', '1420798853', '1420794534', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('211', 'appids', '提示关注的公众号', 'text NULL', 'textarea', '', '格式：广东南方卫视|wx2d7ce60bbfc928ef 多个公众号用换行分割', '1', '', '24', '0', '1', '1420798902', '1420796356', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('212', 'finish_button', '成功抢答完后显示的按钮', 'text NULL', 'textarea', '', '格式：按钮名|跳转链接，如：百度|www.baidu.com 多个时换行分割', '1', '', '24', '0', '1', '1420857847', '1420857847', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('213', 'card_id', '卡券ID', 'varchar(255) NULL', 'string', '', '可为空', '1', '', '24', '0', '1', '1421406387', '1421406387', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('214', 'appsecre', '卡券对应的appsecre', 'varchar(255) NULL', 'string', '', '', '1', '', '24', '0', '1', '1421406470', '1421406470', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('215', 'template', '素材模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '24', '0', '1', '1430210161', '1430210161', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('216', 'answer', '回答内容', 'text NULL', 'textarea', '', '', '0', '', '25', '0', '1', '1396955766', '1396955766', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('217', 'openid', 'OpenId', 'varchar(255) NULL', 'string', '', '', '0', '', '25', '0', '1', '1430286439', '1396955581', '', '3', '', 'regex', 'get_openid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('218', 'uid', '用户UID', 'int(10) NULL ', 'num', '', '', '0', '', '25', '0', '1', '1396955530', '1396955530', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('219', 'question_id', 'question_id', 'int(10) unsigned NOT NULL ', 'num', '', '', '4', '', '25', '1', '1', '1396955412', '1396955392', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('220', 'cTime', '发布时间', 'int(10) unsigned NULL ', 'datetime', '', '', '0', '', '25', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('221', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '25', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('222', 'ask_id', 'ask_id', 'int(10) unsigned NOT NULL ', 'num', '', '', '4', '', '25', '1', '1', '1396955403', '1396955369', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('223', 'is_correct', '是否回答正确', 'tinyint(2) NULL', 'bool', '1', '', '0', '0:不正确\r\n1:正确', '25', '0', '1', '1420685956', '1420685956', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('224', 'times', '次数', 'int(4) NULL', 'num', '0', '', '0', '', '25', '0', '1', '1420965038', '1420965038', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('225', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '26', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('226', 'intro', '问题描述', 'text NULL', 'textarea', '', '', '1', '', '26', '0', '1', '1396954176', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('227', 'cTime', '发布时间', 'int(10) unsigned NULL ', 'datetime', '', '', '0', '', '26', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('228', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '26', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('229', 'is_must', '是否必填', 'tinyint(2) NULL', 'bool', '1', '', '0', '0:否\r\n1:是', '26', '0', '1', '1420686586', '1396954649', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('230', 'extra', '参数', 'text NOT NULL', 'textarea', '', '类型为单选、多选时的定义数据，格式见上面的提示', '1', '', '26', '1', '1', '1421749164', '1396954558', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('231', 'type', '问题类型', 'char(50) NOT NULL', 'radio', 'radio', '', '1', 'radio:单选题\r\ncheckbox:多选题', '26', '1', '1', '1420689062', '1396954463', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('232', 'ask_id', 'ask_id', 'int(10) unsigned NOT NULL ', 'num', '', '', '4', '', '26', '1', '1', '1396954240', '1396954240', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('233', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '值越小越靠前', '1', '', '26', '0', '1', '1420689390', '1396955010', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('234', 'answer', '正确答案', 'varchar(255) NOT NULL', 'string', '', '多个答案用空格分开，如： A B C', '1', '', '26', '1', '1', '1421749143', '1420685041', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('235', 'is_last', '是否最后一题', 'tinyint(2) NULL', 'bool', '0', '如设置为最后一题，用户回答后进入完成页面，否则进入等待下一题提示页面', '0', '0:否\r\n1:是', '26', '0', '1', '1421749096', '1420686448', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('236', 'wait_time', '等待时间', 'int(10) NULL', 'num', '0', '单位为秒，表示答题后进入下一题的间隔时间', '1', '', '26', '0', '1', '1420688805', '1420688703', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('237', 'percent', '抢中概率', 'int(10) NULL', 'num', '100', '抢到题目的百分比，请填写0~100之间的整数，如填写50表示概率为50%', '1', '', '26', '0', '1', '1420855970', '1420855970', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('238', 'answer_time', '答题时间', 'int(10) NULL', 'num', '', '不填则为无答题时间限制', '1', '', '26', '0', '1', '1427541360', '1427541360', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('239', 'permission', '权限设置', 'char(50) NULL', 'select', '1', '', '1', '1:完全公开(公众人物)\r\n2:群友可见(商务交往)\r\n3:交换名片可见(私人来往)\r\n4:仅自己可见(绝密保存)', '27', '0', '1', '1438945015', '1438945015', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('240', 'intro', '个人介绍', 'text NULL', 'textarea', '', '', '1', '', '27', '0', '1', '1438944828', '1438944828', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('241', 'wishing', '希望结交', 'varchar(100) NULL', 'string', '', '', '1', '', '27', '0', '1', '1438942908', '1438942908', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('242', 'wechat', '微信号', 'varchar(50) NULL', 'string', '', '', '1', '', '27', '0', '1', '1438942392', '1438942392', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('243', 'Email', '邮箱', 'varchar(100) NULL', 'string', '', '', '1', '', '27', '0', '1', '1438942359', '1438942359', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('244', 'telephone', '座机', 'varchar(30) NULL', 'string', '', '', '1', '', '27', '0', '1', '1438942330', '1438942330', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('245', 'address', '地址', 'varchar(255) NULL', 'string', '', '', '1', '', '27', '0', '1', '1438933681', '1438933681', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('246', 'company_url', '公司网址', 'varchar(255) NULL', 'string', '', '', '1', '', '27', '0', '1', '1438933650', '1438933650', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('247', 'department', '所属部门', 'varchar(50) NULL', 'string', '', '', '1', '', '27', '0', '1', '1438933471', '1438933471', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('248', 'company', '公司名称', 'varchar(100) NULL', 'string', '', '', '1', '', '27', '1', '1', '1438933418', '1438933418', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('249', 'mobile', '手机', 'varchar(30) NULL', 'string', '', '', '1', '', '27', '1', '1', '1438933381', '1438933381', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('250', 'position', '职位头衔', 'varchar(50) NULL', 'string', '', '', '1', '如：XX创始人、xx级教师、xx投资顾问、XX爸爸、XX达人', '27', '0', '1', '1438933330', '1438933330', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('251', 'headface', '头像', 'int(10) UNSIGNED NULL', 'picture', '', '', '0', '', '27', '0', '1', '1439175454', '1438944864', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('252', 'personal_url', '个人主页', 'varchar(255) NULL', 'string', '', '', '1', '', '27', '0', '1', '1438944804', '1438944804', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('253', 'interest', '兴趣', 'varchar(255) NULL', 'string', '', '', '1', '', '27', '0', '1', '1438942945', '1438942945', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('254', 'tag', '人物标签', 'varchar(255) NULL', 'string', '', '多个用逗号分开', '1', '', '27', '0', '1', '1438942491', '1438942491', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('255', 'weibo', '微博', 'varchar(255) NULL', 'string', '', '', '1', '', '27', '0', '1', '1438942443', '1438942443', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('256', 'qq', 'QQ号', 'varchar(30) NULL', 'string', '', '', '1', '', '27', '0', '1', '1438942418', '1438942418', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('257', 'service', '产品服务', 'text NULL', 'textarea', '', '', '1', '', '27', '1', '1', '1438933623', '1438933623', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('258', 'truename', '真实姓名', 'varchar(50) NULL', 'string', '', '', '1', '', '27', '1', '1', '1438931443', '1438931443', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('259', 'uid', '用户ID', 'int(10) NULL', 'num', '', '', '0', '', '27', '0', '1', '1438931293', '1438931293', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('260', 'template', '选择的模板', 'varchar(50) NULL', 'string', '', '', '0', '', '27', '0', '1', '1438947089', '1438947089', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('261', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '27', '0', '1', '1439869080', '1439290478', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('262', 'from_uid', '收藏人ID', 'int(10) NULL', 'num', '', '', '0', '', '28', '0', '1', '1439188549', '1439188462', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('263', 'to_uid', '被收藏人的ID', 'int(10) NULL', 'num', '', '', '0', '', '28', '0', '1', '1439188512', '1439188512', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('264', 'cTime', '收藏时间', 'int(10) NULL', 'datetime', '', '', '0', '', '28', '0', '1', '1439188537', '1439188537', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('265', 'uid', 'uid', 'int(10) NULL', 'num', '', '', '1', '', '29', '0', '1', '1430998977', '1430998977', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('266', 'cover', '素材封面', 'int(10) UNSIGNED NULL', 'picture', '', '', '0', '', '29', '0', '1', '1427435373', '1422000629', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('267', 'balance', '红包余额', 'varchar(30) NULL', 'string', '', '红包余额，以分为单位。红包类型必填 （LUCKY_MONEY），其他卡券类型不填', '0', '', '29', '0', '1', '1427435295', '1421982394', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('268', 'card_id', '卡券ID', 'varchar(100) NOT NULL', 'string', '', '', '0', '', '29', '1', '1', '1427435272', '1421980436', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('269', 'openid', 'OpenID', 'text NULL', 'textarea', '', '指定领取者的openid，只有该用户能领取。bind_openid字段为true的卡券必须填写，非自定义openid 不必填写', '0', '', '29', '0', '1', '1427435344', '1421980851', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('270', 'appsecre', '开通卡券的商家公众号密钥', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '29', '1', '1', '1421980516', '1421980516', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('271', 'code', '卡券code码', 'text NULL', 'textarea', '', '指定的卡券code 码，只能被领一次。use_custom_code 字段为true 的卡券必须填写，非自定义code 不必填写', '1', '', '29', '0', '1', '1421980773', '1421980773', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('272', 'content', '活动介绍', 'text NULL', 'editor', '', '', '1', '', '29', '0', '1', '1421981078', '1421981078', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('273', 'background', '背景图', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '29', '0', '1', '1422000931', '1422000931', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('274', 'token', 'token', 'varchar(50) NULL', 'string', '', '', '1', '', '29', '0', '1', '1430999013', '1430999013', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('275', 'title', '卡券标题', 'varchar(255) NULL', 'string', '卡券', '', '1', '', '29', '0', '1', '1427435445', '1427435445', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('276', 'button_color', '领取按钮颜色', 'varchar(255) NULL', 'string', '#0dbd02', '', '1', '', '29', '0', '1', '1427435492', '1427435492', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('277', 'head_bg_color', '头部背景颜色', 'varchar(255) NULL', 'string', '#35a2dd', '', '1', '', '29', '0', '1', '1427435535', '1427435535', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('278', 'shop_name', '商家名称', 'varchar(255) NULL', 'string', '', '', '1', '', '29', '0', '1', '1427438002', '1427438002', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('279', 'shop_logo', '商家LOGO', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '29', '0', '1', '1427437781', '1427437781', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('280', 'more_button', '添加更多按钮', 'text NULL', 'textarea', '', '', '1', '', '29', '0', '1', '1427512791', '1427512791', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('281', 'template', '素材模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '29', '0', '1', '1430129779', '1430129779', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('282', 'aim_table', '评论关联数据表', 'varchar(30) NULL', 'string', '', '', '0', '', '30', '0', '1', '1432602501', '1432602501', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('283', 'aim_id', '评论关联ID', 'int(10) NULL', 'num', '', '', '0', '', '30', '0', '1', '1432602466', '1432602466', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('284', 'cTime', '评论时间', 'int(10) NULL', 'datetime', '', '', '0', '', '30', '0', '1', '1432602404', '1432602404', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('285', 'follow_id', 'follow_id', 'int(10) NULL', 'num', '', '', '0', '', '30', '1', '1', '1432602345', '1432602345', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('286', 'content', '评论内容', 'text NULL', 'textarea', '', '', '0', '', '30', '1', '1', '1432602376', '1432602376', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('287', 'is_audit', '是否审核', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:未审核\r\n1:已审核', '30', '0', '1', '1435031747', '1435029949', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('288', 'uid', 'uid', 'int(10) NULL', 'num', '', '', '0', '', '30', '0', '1', '1435561416', '1435561392', '', '3', '', 'regex', 'get_mid', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('289', 'background', '素材背景图', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '31', '0', '1', '1422000992', '1422000992', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('290', 'keyword', '关键词', 'varchar(100) NULL', 'string', '', '', '0', '', '31', '0', '1', '1422330526', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('291', 'use_tips', '使用说明', 'text NULL', 'editor', '', '用户获取优惠券后显示的提示信息', '1', '', '31', '1', '1', '1420868972', '1399259489', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('292', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '31', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('293', 'intro', '封面简介', 'text NULL', 'textarea', '', '', '0', '', '31', '0', '1', '1418885972', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('294', 'end_time', '领取结束时间', 'int(10) NULL', 'datetime', '', '', '1', '', '31', '0', '1', '1427161023', '1399259433', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('295', 'cover', '优惠券图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '31', '0', '1', '1418886050', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('296', 'cTime', '发布时间', 'int(10) unsigned NULL ', 'datetime', '', '', '0', '', '31', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('297', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '31', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('298', 'start_time', '开始时间', 'int(10) NULL', 'datetime', '', '', '1', '', '31', '0', '1', '1422330558', '1399259416', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('299', 'end_tips', '领取结束说明', 'text NULL', 'textarea', '', '活动过期或者结束说明', '1', '', '31', '0', '1', '1427161168', '1399259570', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('300', 'end_img', '领取结束提示图片', 'int(10) unsigned NULL ', 'picture', '', '可为空', '1', '', '31', '0', '1', '1427161296', '1400989793', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('301', 'num', '优惠券数量', 'int(10) unsigned NULL ', 'num', '0', '0表示不限制数量', '1', '', '31', '0', '1', '1399259838', '1399259808', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('302', 'max_num', '每人最多允许获取次数', 'int(10) unsigned NULL ', 'num', '1', '0表示不限制数量', '1', '', '31', '0', '1', '1421750268', '1399260079', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('303', 'follower_condtion', '粉丝状态', 'char(50) NULL', 'select', '1', '粉丝达到设置的状态才能获取', '0', '0:不限制\r\n1:已关注\r\n2:已绑定信息\r\n3:会员卡成员', '31', '0', '1', '1418885814', '1399260479', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('304', 'credit_conditon', '积分限制', 'int(10) unsigned NULL ', 'num', '0', '粉丝达到多少积分后才能领取，领取后不扣积分', '0', '', '31', '0', '1', '1418885804', '1399260618', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('305', 'credit_bug', '积分消费', 'int(10) unsigned NULL ', 'num', '0', '用积分中的财富兑换、兑换后扣除相应的积分财富', '0', '', '31', '0', '1', '1418885794', '1399260764', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('306', 'addon_condition', '插件场景限制', 'varchar(255) NULL', 'string', '', '格式：[插件名:id值]，如[投票:10]表示对ID为10的投票投完才能领取，更多的说明见表单上的提示', '0', '', '31', '0', '1', '1418885827', '1399261026', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('307', 'collect_count', '已领取数', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '31', '0', '1', '1400992246', '1399270900', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('308', 'view_count', '浏览人数', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '31', '0', '1', '1399270926', '1399270926', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('309', 'addon', '插件', 'char(50) NULL', 'select', 'public', '', '0', 'public:通用\r\ninvite:微邀约', '31', '0', '1', '1418885638', '1418885638', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('310', 'shop_uid', '商家管理员ID', 'varchar(255) NULL', 'string', '', '', '0', '', '31', '0', '1', '1421750246', '1418900122', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('311', 'use_count', '已使用数', 'int(10) NULL', 'num', '0', '', '0', '', '31', '0', '1', '1418910237', '1418910237', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('312', 'pay_password', '核销密码', 'varchar(255) NULL', 'string', '', '', '1', '', '31', '0', '1', '1420875229', '1420875229', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('313', 'empty_prize_tips', '奖品抽完后的提示', 'varchar(255) NULL', 'string', '', '不填写时默认显示：您来晚了，优惠券已经领取完', '1', '', '31', '0', '1', '1421394437', '1421394267', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('314', 'start_tips', '活动还没开始时的提示语', 'varchar(255) NULL', 'string', '', '', '1', '', '31', '0', '1', '1423134546', '1423134546', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('315', 'more_button', '其它按钮', 'text NULL', 'textarea', '', '格式：按钮名称|按钮跳转地址，每行一个。如：查看官网|http://weiphp.cn', '1', '', '31', '0', '1', '1423193853', '1423193853', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('316', 'over_time', '使用的截止时间', 'int(10) NULL', 'datetime', '', '券的使用截止时间，为空时表示不限制', '1', '', '31', '0', '1', '1427161334', '1427161118', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('317', 'use_start_time', '使用开始时间', 'int(10) NULL', 'datetime', '', '', '1', '', '31', '1', '1', '1427280116', '1427280008', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('318', 'shop_name', '商家名称', 'varchar(255) NULL', 'string', '优惠商家', '', '1', '', '31', '0', '1', '1427280255', '1427280255', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('319', 'shop_logo', '商家LOGO', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '31', '0', '1', '1427280293', '1427280293', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('320', 'head_bg_color', '头部背景颜色', 'varchar(255) NULL', 'string', '#35a2dd', '', '1', '', '31', '0', '1', '1427282839', '1427282785', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('321', 'button_color', '按钮颜色', 'varchar(255) NULL', 'string', '#0dbd02', '', '1', '', '31', '0', '1', '1427282886', '1427282886', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('322', 'template', '素材模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '31', '0', '1', '1430127336', '1430127336', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('323', 'name', '店名', 'varchar(100) NULL', 'string', '', '', '1', '', '32', '1', '1', '1427164635', '1427164635', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('324', 'address', '详细地址', 'varchar(255) NULL', 'string', '', '', '1', '', '32', '1', '1', '1427164668', '1427164668', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('325', 'phone', '联系电话', 'varchar(30) NULL', 'string', '', '', '1', '', '32', '0', '1', '1427166529', '1427164707', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('326', 'gps', 'GPS经纬度', 'varchar(50) NULL', 'string', '', '格式：经度,纬度', '1', '', '32', '0', '1', '1427371523', '1427164833', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('327', 'coupon_id', '所属优惠券编号', 'int(10) NULL', 'num', '', '', '4', '', '32', '0', '1', '1427165806', '1427165806', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('328', 'coupon_id', 'coupon_id', 'int(10) NULL', 'num', '', '', '1', '', '33', '0', '1', '1427356371', '1427356371', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('329', 'shop_id', 'shop_id', 'int(10) NULL', 'num', '', '', '1', '', '33', '0', '1', '1427356387', '1427356387', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('330', 'sort', '排序号', 'tinyint(4) NULL ', 'num', '0', '数值越小越靠前', '1', '', '34', '0', '1', '1394523288', '1394519175', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('331', 'pid', '一级菜单', 'int(10) NULL', 'select', '0', '如果是一级菜单，选择“无”即可', '1', '0:无', '34', '0', '1', '1416810279', '1394518930', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('332', 'title', '菜单名', 'varchar(50) NOT NULL', 'string', '', '可创建最多 3 个一级菜单，每个一级菜单下可创建最多 5 个二级菜单。编辑中的菜单不会马上被用户看到，请放心调试。', '1', '', '34', '1', '1', '1408951570', '1394518988', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('333', 'keyword', '关联关键词', 'varchar(100) NULL', 'string', '', '', '1', '', '34', '0', '1', '1416812109', '1394519054', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('334', 'url', '关联URL', 'varchar(255) NULL ', 'string', '', '', '1', '', '34', '0', '1', '1394519090', '1394519090', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('335', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '34', '0', '1', '1394526820', '1394526820', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('336', 'type', '类型', 'varchar(30) NULL', 'bool', 'click', '', '1', 'click:点击推事件|keyword@show,url@hide\r\nview:跳转URL|keyword@hide,url@show\r\nscancode_push:扫码推事件|keyword@show,url@hide\r\nscancode_waitmsg:扫码带提示|keyword@show,url@hide\r\npic_sysphoto:弹出系统拍照发图|keyword@show,url@hide\r\npic_photo_or_album:弹出拍照或者相册发图|keyword@show,url@hide\r\npic_weixin:弹出微信相册发图器|keyword@show,url@hide\r\nlocation_select:弹出地理位置选择器|keyword@show,url@hide\r\nnone:无事件的一级菜单|keyword@hide,url@hide', '34', '0', '1', '1416812039', '1416810588', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('337', 'keyword', '关键词', 'varchar(255) NULL', 'string', '', '', '1', '', '35', '0', '1', '1396602514', '1396602514', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('338', 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '35', '0', '1', '1396602706', '1396602548', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('339', 'mult_ids', '多图文ID', 'varchar(255) NULL', 'string', '', '', '0', '', '35', '0', '1', '1396602601', '1396602578', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('340', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '35', '0', '1', '1396602821', '1396602821', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('341', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '36', '1', '1', '1396061575', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('342', 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '36', '0', '1', '1396061814', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('343', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '36', '1', '1', '1396061877', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('344', 'intro', '简介', 'text NULL', 'textarea', '', '', '1', '', '36', '0', '1', '1396061947', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('345', 'cate_id', '所属类别', 'int(10) unsigned NULL ', 'select', '0', '要先在微官网分类里配置好分类才可选择', '1', '0:请选择分类', '36', '0', '1', '1396078914', '1396062003', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('346', 'cover', '封面图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '36', '0', '1', '1396062093', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('347', 'content', '内容', 'text NULL', 'editor', '', '', '1', '', '36', '0', '1', '1396062146', '1396062146', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('348', 'cTime', '发布时间', 'int(10) NULL', 'datetime', '', '', '0', '', '36', '0', '1', '1396075102', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('349', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '数值越小越靠前', '1', '', '36', '0', '1', '1396510508', '1396510508', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('350', 'view_count', '浏览数', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '36', '0', '1', '1396510630', '1396510630', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('351', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '36', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('352', 'jump_url', '外链', 'varchar(255) NULL', 'string', '', '如需跳转填写网址(记住必须有http://)如果填写了图文详细内容，这里请留空，不要设置！', '1', '', '36', '0', '1', '1402482073', '1402482073', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('353', 'author', '作者', 'varchar(50) NULL', 'string', '', '为空时取当前用户名', '1', '', '36', '0', '1', '1437988055', '1437988055', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('354', 'keyword', '关键词', 'varchar(255) NULL', 'string', '', '多个关键词请用空格分开：例如: 高 富 帅', '1', '', '37', '0', '1', '1396578460', '1396578212', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('355', 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '37', '0', '1', '1396623302', '1396578249', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('356', 'content', '回复内容', 'text NULL', 'textarea', '', '请不要多于1000字否则无法发送。支持加超链接，但URL必须带http://', '1', '', '37', '0', '1', '1396607362', '1396578597', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('357', 'view_count', '浏览数', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '37', '0', '1', '1396580643', '1396580643', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('358', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '37', '0', '1', '1396580674', '1396580674', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('359', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '37', '0', '1', '1396603007', '1396603007', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('360', 'follow_id', '粉丝id', 'int(10) NULL', 'num', '', '', '1', '', '38', '0', '1', '1432619233', '1432619233', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('361', 'sports_id', '场次id', 'int(10) NULL', 'num', '', '', '1', '', '38', '0', '1', '1432690316', '1432619261', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('362', 'count', '抽奖次数', 'int(10) NULL', 'num', '0', '', '1', '', '38', '0', '1', '1432619288', '1432619288', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('363', 'uid', 'uid', 'int(10) NULL', 'num', '', '', '0', '', '38', '0', '1', '1435313298', '1435313298', '', '3', '', 'regex', 'get_mid', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('364', 'cTime', '支持时间', 'int(10) NULL', 'datetime', '', '', '1', '', '38', '0', '1', '1432690461', '1432690461', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('365', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '39', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('366', 'cTime', '发布时间', 'int(10) UNSIGNED NULL', 'datetime', '', '', '0', '', '39', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('367', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '39', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('368', 'password', '表单密码', 'varchar(255) NULL', 'string', '', '如要用户输入密码才能进入表单，则填写此项。否则留空，用户可直接进入表单', '0', '', '39', '0', '1', '1396871497', '1396672643', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('369', 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '39', '1', '1', '1396624426', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('370', 'jump_url', '提交后跳转的地址', 'varchar(255) NULL', 'string', '', '要以http://开头的完整地址，为空时不跳转', '1', '', '39', '0', '1', '1402458121', '1399800276', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('371', 'content', '详细介绍', 'text NULL', 'editor', '', '可不填', '1', '', '39', '0', '1', '1396865295', '1396865295', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('372', 'finish_tip', '用户提交后提示内容', 'text NULL', 'textarea', '', '为空默认为：提交成功，谢谢参与', '1', '', '39', '0', '1', '1396676366', '1396673689', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('373', 'can_edit', '是否允许编辑', 'tinyint(2) NULL', 'bool', '0', '用户提交表单是否可以再编辑', '1', '0:不允许\r\n1:允许', '39', '0', '1', '1396688624', '1396688624', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('374', 'intro', '封面简介', 'text NULL', 'textarea', '', '', '1', '', '39', '1', '1', '1439371986', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('375', 'mTime', '修改时间', 'int(10) NULL', 'datetime', '', '', '0', '', '39', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('376', 'cover', '封面图片', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '39', '1', '1', '1439372018', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('377', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '39', '1', '1', '1396866048', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('378', 'template', '模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '39', '0', '1', '1431661124', '1431661124', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('379', 'is_show', '是否显示', 'tinyint(2) NULL', 'select', '1', '是否显示在表单中', '1', '1:显示\r\n0:不显示', '40', '0', '1', '1396848437', '1396848437', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('380', 'forms_id', '表单ID', 'int(10) UNSIGNED NULL', 'num', '', '', '4', '', '40', '0', '1', '1396710040', '1396690613', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('381', 'error_info', '出错提示', 'varchar(255) NULL', 'string', '', '验证不通过时的提示语', '1', '', '40', '0', '1', '1396685920', '1396685920', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('382', 'sort', '排序号', 'int(10) UNSIGNED NULL', 'num', '0', '值越小越靠前', '1', '', '40', '0', '1', '1396685825', '1396685825', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('383', 'validate_rule', '正则验证', 'varchar(255) NULL', 'string', '', '为空表示不作验证', '1', '', '40', '0', '1', '1396685776', '1396685776', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('384', 'is_must', '是否必填', 'tinyint(2) NULL', 'bool', '', '用于自动验证', '1', '0:否\r\n1:是', '40', '0', '1', '1396685579', '1396685579', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('385', 'remark', '字段备注', 'varchar(255) NULL', 'string', '', '用于表单中的提示', '1', '', '40', '0', '1', '1396685482', '1396685482', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('386', 'name', '字段名', 'varchar(100) NOT NULL', 'string', '', '请输入字段名 英文字母开头，长度不超过30', '1', '', '40', '1', '1', '1439372205', '1396676792', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('387', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '40', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('388', 'value', '默认值', 'varchar(255) NULL', 'string', '', '字段的默认值', '1', '', '40', '0', '1', '1396685291', '1396685291', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('389', 'title', '字段标题', 'varchar(255) NOT NULL', 'string', '', '请输入字段标题，用于表单显示', '1', '', '40', '1', '1', '1396676830', '1396676830', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('390', 'mTime', '修改时间', 'int(10) NULL', 'datetime', '', '', '0', '', '40', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('391', 'extra', '参数', 'text NULL', 'textarea', '', '字段类型为单选、多选、下拉选择和级联选择时的定义数据，其它字段类型为空', '1', '', '40', '0', '1', '1396835020', '1396685105', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('392', 'type', '字段类型', 'char(50) NOT NULL', 'select', 'string', '用于表单中的展示方式', '1', 'string:单行输入\r\ntextarea:多行输入\r\nradio:单选\r\ncheckbox:多选\r\nselect:下拉选择\r\ndatetime:时间\r\npicture:上传图片', '40', '1', '1', '1396871262', '1396683600', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('393', 'forms_id', '表单ID', 'int(10) UNSIGNED NULL', 'num', '', '', '4', '', '41', '0', '1', '1396710064', '1396688308', '', '3', '', 'regex', '', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('394', 'value', '表单值', 'text NULL', 'textarea', '', '', '0', '', '41', '0', '1', '1396688355', '1396688355', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('395', 'cTime', '增加时间', 'int(10) NULL', 'datetime', '', '', '0', '', '41', '0', '1', '1396688434', '1396688434', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('396', 'openid', 'OpenId', 'varchar(255) NULL', 'string', '', '', '0', '', '41', '0', '1', '1396688187', '1396688187', '', '3', '', 'regex', 'get_openid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('397', 'uid', '用户ID', 'int(10) NULL', 'num', '', '', '0', '', '41', '0', '1', '1396688042', '1396688042', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('398', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '41', '0', '1', '1396690911', '1396690911', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('399', 'title', '竞猜标题', 'varchar(255) NULL', 'string', '', '', '1', '', '42', '1', '1', '1428655010', '1428655010', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('400', 'desc', '活动说明', 'text NULL', 'textarea', '', '', '1', '', '42', '0', '1', '1428657017', '1428657017', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('401', 'start_time', '开始时间', 'int(10) NULL', 'datetime', '', '', '1', '', '42', '1', '1', '1428657086', '1428657086', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('402', 'end_time', '结束时间', 'int(10) NULL', 'datetime', '', '', '1', '', '42', '1', '1', '1428657122', '1428657122', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('403', 'create_time', '创建时间', 'int(10) NULL', 'datetime', '', '', '4', '', '42', '0', '1', '1428664508', '1428664122', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('404', 'guess_count', '', 'int(10) unsigned NULL ', 'num', '0', '', '4', '', '42', '0', '1', '1428718033', '1428717991', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('405', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '42', '0', '1', '1429521291', '1429512366', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('406', 'template', '素材模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '42', '0', '1', '1430115411', '1430103969', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('407', 'cover', '主题图片', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '42', '0', '1', '1430384839', '1430384839', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('408', 'user_id', '用户ID', 'int(10) unsigned NULL', 'num', '0', '', '0', '', '43', '0', '1', '1428738317', '1428738317', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('409', 'guess_id', '竞猜Id', 'int(10) unsigned NULL', 'num', '0', '', '0', '', '43', '0', '1', '1428738379', '1428738379', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('410', 'token', '用户token', 'varchar(255) NULL', 'string', '', '', '1', '', '43', '0', '1', '1428738405', '1428738405', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('411', 'optionIds', '用户猜的选项IDs', 'varchar(255) NULL', 'string', '', '', '0', '', '43', '0', '1', '1428738522', '1428738522', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('412', 'cTime', '创时间', 'int(10) NULL', 'date', '', '', '0', '', '43', '0', '1', '1428738552', '1428738552', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('413', 'guess_id', '竞猜活动的Id', 'int(10) NULL', 'num', '0', '', '4', '', '44', '0', '1', '1428659228', '1428659228', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('414', 'name', '选项名称', 'varchar(255) NULL', 'string', '', '', '1', '', '44', '1', '1', '1428659270', '1428659270', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('415', 'image', '选项图片', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '44', '0', '1', '1428659313', '1428659313', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('416', 'order', '选项顺序', 'int(10) NULL', 'num', '0', '', '1', '', '44', '0', '1', '1428659354', '1428659354', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('417', 'guess_count', '竞猜人数', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '44', '0', '1', '1430302786', '1428659432', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('418', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '45', '1', '1', '1396624337', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('419', 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '45', '1', '1', '1396624426', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('420', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '45', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('421', 'intro', '封面简介', 'text NULL', 'textarea', '', '', '1', '', '45', '0', '1', '1396624505', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('422', 'mTime', '修改时间', 'int(10) NULL', 'datetime', '', '', '0', '', '45', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('423', 'cover', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '45', '1', '1', '1418266006', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('424', 'experience', '消耗经验值', 'int(10) NULL', 'num', '0', '', '1', '', '45', '0', '1', '1418180506', '1418180506', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('425', 'cTime', '发布时间', 'int(10) UNSIGNED NULL', 'datetime', '', '', '0', '', '45', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('426', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '45', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('427', 'num', '邀请人数', 'int(10) NULL', 'num', '0', '邀请多少人后才能用优惠券', '1', '', '45', '0', '1', '1418180590', '1418180590', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('428', 'coupon_id', '优惠券编号', 'int(10) NULL', 'num', '', '可以在优惠券列表中找到对应的编号', '1', '', '45', '0', '1', '1418183454', '1418180739', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('429', 'coupon_num', '优惠券数', 'int(10) NULL', 'num', '0', '赠送多少张优惠券', '0', '', '45', '0', '1', '1418959022', '1418180812', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('430', 'receive_num', '已领取优惠券数', 'int(10) NULL', 'num', '0', '', '0', '', '45', '0', '1', '1418181528', '1418181528', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('431', 'content', '邀约介绍', 'text NULL', 'editor', '', '', '1', '', '45', '0', '1', '1418889321', '1418265599', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('432', 'template', '模板名称', 'varchar(255) NULL', 'string', 'default', '', '1', '', '45', '0', '1', '1430122784', '1430122766', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('433', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '46', '0', '1', '1418192408', '1418192408', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('434', 'uid', '用户ID', 'int(10) NULL', 'num', '', '', '0', '', '46', '0', '1', '1418192629', '1418192629', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('435', 'invite_id', '邀约ID', 'int(10) NULL', 'num', '', '', '1', '', '46', '0', '1', '1418192878', '1418192878', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('436', 'invite_num', '已邀请人数', 'int(10) NULL', 'num', '', '', '0', '', '46', '0', '1', '1418192971', '1418192971', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('437', 'sports_id', '活动编号', 'int(10) NULL', 'num', '', '', '1', '', '47', '0', '1', '1432690590', '1432613794', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('438', 'award_id', '奖品编号', 'varchar(255) NULL', 'cascade', '', '', '1', '', '47', '0', '1', '1432710935', '1432613820', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('439', 'award_num', '奖品数量', 'int(10) NULL', 'num', '', '', '1', '', '47', '0', '1', '1432624743', '1432624743', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('440', 'uid', 'uid', 'int(10) NULL', 'num', '', '', '0', '', '47', '0', '1', '1435313078', '1435313078', '', '3', '', 'regex', 'get_mid', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('441', 'uid', 'uid', 'int(10) NULL', 'num', '', '', '0', '', '48', '0', '1', '1435313219', '1435313219', '', '3', '', 'regex', 'get_mid', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('442', 'draw_id', '活动编号', 'int(10) NULL', 'num', '', '', '1', '', '48', '0', '1', '1432619092', '1432618270', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('443', 'sport_id', '场次编号', 'int(10) NULL', 'num', '', '', '1', '', '48', '0', '1', '1432618305', '1432618305', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('444', 'award_id', '奖品编号', 'int(10) NULL', 'num', '', '', '1', '', '48', '0', '1', '1432618336', '1432618336', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('445', 'follow_id', '粉丝id', 'int(10) NULL', 'num', '', '', '1', '', '48', '0', '1', '1432618392', '1432618392', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('446', 'address', '地址', 'varchar(255) NULL', 'string', '', '', '1', '', '48', '0', '1', '1432618543', '1432618543', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('447', 'num', '获奖数', 'int(10) NULL', 'num', '0', '', '1', '', '48', '0', '1', '1432618584', '1432618584', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('448', 'state', '兑奖状态', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:未兑奖\r\n1:已兑奖', '48', '0', '1', '1432644421', '1432618716', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('449', 'zjtime', '中奖时间', 'int(10) NULL', 'datetime', '', '', '1', '', '48', '0', '1', '1432716949', '1432618837', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('450', 'djtime', '兑奖时间', 'int(10) NULL', 'datetime', '', '', '1', '', '48', '0', '1', '1432618922', '1432618922', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('518', 'from', '回调地址', 'varchar(50) NOT NULL', 'string', '', '', '1', '', '60', '0', '1', '1420596347', '1420596347', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('519', 'orderName', '订单名称', 'varchar(255) NULL', 'string', '', '', '1', '', '60', '0', '1', '1439976366', '1420596373', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('520', 'single_orderid', '订单号', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '60', '0', '1', '1420596415', '1420596415', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('521', 'price', '价格', 'decimal(10,2) NULL', 'num', '', '', '1', '', '60', '0', '1', '1439812508', '1420596472', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('522', 'token', 'Token', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '60', '0', '1', '1420596492', '1420596492', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('523', 'wecha_id', 'OpenID', 'varchar(200) NOT NULL', 'string', '', '', '1', '', '60', '0', '1', '1420596530', '1420596530', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('524', 'paytype', '支付方式', 'varchar(30) NOT NULL', 'string', '', '', '1', '', '60', '0', '1', '1420596929', '1420596929', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('525', 'showwxpaytitle', '是否显示标题', 'tinyint(2) NOT NULL', 'bool', '0', '', '1', '0:不显示\r\n1:显示', '60', '0', '1', '1420596980', '1420596980', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('526', 'status', '支付状态', 'tinyint(2) NOT NULL', 'bool', '0', '', '1', '0:未支付\r\n1:已支付\r\n2:支付失败', '60', '0', '1', '1420597026', '1420597026', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('527', 'wxmchid', '微信支付商户号', 'varchar(255) NULL', 'string', '', '', '1', '', '61', '1', '1', '1439364696', '1436437067', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('528', 'shop_id', '商店ID', 'int(10) NULL', 'num', '0', '', '0', '', '61', '0', '1', '1436437020', '1436437003', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('529', 'quick_merid', '银联在线merid', 'varchar(255) NULL', 'string', '', '', '1', '', '61', '0', '1', '1436436949', '1436436949', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('530', 'quick_merabbr', '商户名称', 'varchar(255) NULL', 'string', '', '', '1', '', '61', '0', '1', '1436436970', '1436436970', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('531', 'wxpartnerid', '微信partnerid', 'varchar(255) NULL', 'string', '', '', '0', '', '61', '0', '1', '1436437196', '1436436910', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('532', 'wxpartnerkey', '微信partnerkey', 'varchar(255) NULL', 'string', '', '', '0', '', '61', '0', '1', '1436437236', '1436436888', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('533', 'partnerid', '财付通标识', 'varchar(255) NULL', 'string', '', '', '1', '', '61', '0', '1', '1436436798', '1436436798', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('534', 'key', 'KEY', 'varchar(255) NULL', 'string', '', '', '1', '', '61', '0', '1', '1436436771', '1436436771', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('535', 'ctime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '61', '0', '1', '1436436498', '1436436498', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('536', 'quick_security_key', '银联在线Key', 'varchar(255) NULL', 'string', '', '', '1', '', '61', '0', '1', '1436436931', '1436436931', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('537', 'wappartnerkey', 'WAP财付通Key', 'varchar(255) NULL', 'string', '', '', '1', '', '61', '0', '1', '1436436863', '1436436863', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('538', 'wappartnerid', '财付通标识WAP', 'varchar(255) NULL', 'string', '', '', '1', '', '61', '0', '1', '1436436834', '1436436834', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('539', 'partnerkey', '财付通Key', 'varchar(255) NULL', 'string', '', '', '1', '', '61', '0', '1', '1436436816', '1436436816', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('540', 'pid', 'PID', 'varchar(255) NULL', 'string', '', '', '1', '', '61', '0', '1', '1436436707', '1436436707', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('541', 'zfbname', '帐号', 'varchar(255) NULL', 'string', '', '', '1', '', '61', '0', '1', '1436436653', '1436436653', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('542', 'wxappsecret', 'AppSecret', 'varchar(255) NULL', 'string', '', '微信支付中的公众号应用密钥', '1', '', '61', '1', '1', '1439364612', '1436436618', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('543', 'wxpaysignkey', '支付密钥', 'varchar(255) NULL', 'string', '', 'PartnerKey', '1', '', '61', '1', '1', '1439364810', '1436436569', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('544', 'wxappid', 'AppID', 'varchar(255) NULL', 'string', '', '微信支付中的公众号应用ID', '1', '', '61', '1', '1', '1439364573', '1436436534', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('545', 'token', 'token', 'varchar(255) NULL', 'string', '', '', '0', '', '61', '0', '1', '1436436415', '1436436415', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('546', 'wx_cert_pem', '上传证书', 'int(10) UNSIGNED NULL', 'file', '', 'apiclient_cert.pem', '1', '', '61', '0', '1', '1439804529', '1439550487', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('547', 'addon', '来源插件', 'varchar(255) NULL', 'string', 'Scratch', '', '0', '', '62', '0', '1', '1399348676', '1399348676', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('548', 'target_id', '来源ID', 'int(10) unsigned NULL ', '', '', '', '1', '', '62', '0', '1', '1420980352', '1399348699', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('549', 'title', '奖项标题', 'varchar(255) NULL', 'string', '', '如特等奖、一等奖。。。', '1', '', '62', '1', '1', '1439370111', '1399348734', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('550', 'name', '奖项', 'varchar(255) NULL', 'string', '', '如iphone、吹风机等', '1', '', '62', '1', '1', '1439370125', '1399348785', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('551', 'num', '名额数量', 'int(10) unsigned NULL ', 'num', '', '', '1', '', '62', '1', '1', '1439370137', '1399348843', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('552', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '值越小越靠前', '1', '', '62', '0', '1', '1399557716', '1399557716', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('553', 'img', '奖品图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '62', '0', '1', '1399557997', '1399557997', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('554', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '62', '0', '1', '1404525428', '1404525428', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('555', 'address', '奖品收货地址', 'varchar(255) NULL', 'textarea', '', '', '1', '', '63', '1', '1', '1429857152', '1429521685', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('556', 'mobile', '手机', 'varchar(50) NULL', 'string', '', '', '1', '', '63', '1', '1', '1429521877', '1429521877', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('557', 'turename', '收货人姓名', 'varchar(255) NULL', 'string', '', '', '1', '', '63', '1', '1', '1429672245', '1429521930', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('558', 'uid', '用户id', 'int(10) NULL', 'num', '', '', '0', '', '63', '0', '1', '1429673948', '1429522086', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('559', 'remark', '备注', 'varchar(255) NULL', 'string', '', '', '1', '', '63', '0', '1', '1429598446', '1429598446', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('560', 'prizeid', '奖品编号', 'int(10) NULL', 'num', '', '', '1', '', '63', '1', '1', '1429607543', '1429607543', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('561', 'prize_name', '奖品名称', 'varchar(255) NULL', 'string', '', '', '1', '', '64', '1', '1', '1429515512', '1429515512', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('562', 'prize_conditions', '活动说明', 'text NULL', 'textarea', '', '奖品说明', '1', '', '64', '1', '1', '1429756762', '1429516052', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('563', 'prize_count', '奖品个数', 'int(10) NULL', 'num', '', '', '1', '', '64', '1', '1', '1429779465', '1429516109', '/^[0-9]*$/', '3', '奖品个数不能小于0', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('564', 'prize_image', '奖品图片', 'varchar(255) NULL', 'picture', '上传奖品图片', '', '1', '', '64', '1', '1', '1429756675', '1429516329', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('565', 'token', 'token', 'varchar(255) NULL', 'string', '', '', '0', '', '64', '0', '1', '1429521039', '1429521039', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('566', 'fail_content', '领取失败提示', 'text NULL', 'textarea', '', '用户领取失败，或者没有领取到时看到的提示', '1', '', '64', '1', '1', '1429860149', '1429860149', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('567', 'prize_type', '奖品类型', 'tinyint(2) NULL', 'radio', '1', '选择奖品类型', '1', '1:实物\r\n0:虚拟', '64', '1', '1', '1429756998', '1429756539', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('568', 'use_content', '使用说明', 'text NULL', 'textarea', '', '用户领取成功后才会看到', '1', '', '64', '1', '1', '1429757185', '1429757185', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('569', 'prize_title', '活动标题', 'varchar(255) NULL', 'string', '', '', '1', '', '64', '1', '1', '1429855569', '1429855569', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('570', 'template', '素材模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '64', '0', '1', '1430132994', '1430132994', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('571', 'token', 'token', 'varchar(50) NULL', 'string', '', '', '1', '', '65', '0', '1', '1430999098', '1430999079', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('572', 'uid', 'uid', 'int(10) NULL', 'num', '', '', '1', '', '65', '0', '1', '1430999121', '1430999121', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('573', 'mch_id', '商户号', 'varchar(32) NULL', 'string', '', '微信支付分配的商户号', '1', '', '65', '1', '1', '1427702346', '1427702346', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('574', 'sub_mch_id', '子商户号', 'varchar(32) NULL', 'string', '', '可为空，微信支付分配的子商户号，受理模式下必填', '0', '', '65', '0', '1', '1427785321', '1427702397', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('575', 'wxappid', '公众账号appid', 'varchar(32) NULL', 'string', '', '商户appid', '1', '', '65', '1', '1', '1427702433', '1427702433', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('576', 'nick_name', '提供方名称', 'varchar(32) NULL', 'string', '', '', '1', '', '65', '1', '1', '1427702473', '1427702473', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('577', 'send_name', '商户名称', 'varchar(32) NULL', 'string', '', '红包发送者名称', '1', '', '65', '1', '1', '1427702505', '1427702505', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('578', 'total_amount', '付款金额', 'int(10) NULL', 'num', '1000', '付款金额，单位分', '1', '', '65', '1', '1', '1427702603', '1427702603', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('579', 'min_value', '最小红包金额', 'int(10) NULL', 'num', '1000', '最小红包金额，单位分', '1', '', '65', '1', '1', '1427702653', '1427702653', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('580', 'max_value', '最大红包金额', 'int(10) NULL', 'num', '1000', '最大红包金额，单位分', '1', '', '65', '1', '1', '1427702703', '1427702703', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('581', 'total_num', '红包发放总人数', 'int(10) NULL', 'num', '1', '', '1', '', '65', '1', '1', '1427702757', '1427702757', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('582', 'wishing', '红包祝福语', 'varchar(255) NULL', 'string', '', '如：感谢您参加猜灯谜活动，祝您元宵节快乐！', '1', '', '65', '1', '1', '1427702843', '1427702843', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('583', 'act_name', '活动名称', 'varchar(255) NULL', 'string', '', '如：猜灯谜抢红包活动', '1', '', '65', '1', '1', '1427702920', '1427702920', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('584', 'remark', '备注', 'varchar(255) NULL', 'string', '', '如：猜越多得越多，快来抢！', '1', '', '65', '1', '1', '1427703037', '1427703011', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('585', 'logo_imgurl', '商户logo的url', 'int(10) UNSIGNED NULL', 'picture', '', '', '0', '', '65', '0', '1', '1427785307', '1427703083', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('586', 'share_content', '分享文案', 'varchar(255) NULL', 'string', '', '如：快来参加猜灯谜活动', '0', '', '65', '0', '1', '1427785298', '1427703125', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('587', 'share_url', '分享链接', 'varchar(255) NULL', 'string', '', '', '0', '', '65', '0', '1', '1427785292', '1427703167', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('588', 'share_imgurl', '分享的图片', 'int(10) UNSIGNED NULL', 'picture', '', '', '0', '', '65', '0', '1', '1427785285', '1427703301', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('589', 'collect_count', '领取人数', 'int(10) NULL', 'num', '0', '', '0', '', '65', '0', '1', '1427785218', '1427785211', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('590', 'collect_amount', '已领取金额', 'int(10) NULL', 'num', '0', '单位为分', '0', '', '65', '0', '1', '1427785274', '1427785262', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('591', 'collect_limit', '每人最多领取次数', 'tinyint(2) NULL', 'num', '0', '0 表示不限制', '1', '', '65', '0', '1', '1427786937', '1427786937', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('592', 'partner_key', '商户API密钥', 'varchar(50) NULL', 'string', '', '用户生成支付签名', '1', '', '65', '0', '1', '1427850414', '1427850414', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('593', 'template', '素材模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '65', '0', '1', '1430132068', '1430132068', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('594', 'redbag_id', '红包ID', 'int(10) NULL', 'num', '', '', '1', '', '66', '0', '1', '1427703408', '1427703408', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('595', 'follow_id', '粉丝ID', 'int(10) NULL', 'num', '', '', '1', '', '66', '0', '1', '1427703457', '1427703457', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('596', 'amount', '领取金额', 'int(10) NULL', 'num', '0', '单位为分', '1', '', '66', '0', '1', '1427703546', '1427703546', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('597', 'cTime', '领取时间', 'int(10) NULL', 'num', '', '', '1', '', '66', '0', '1', '1427703593', '1427703593', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('598', 'reservation_date', '日期', 'int(10) NULL', 'date', '', '', '1', '', '67', '1', '1', '1436236546', '1436236546', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('599', 'morning_count', '上午放号数', 'char(50) NULL', 'select', '30', '', '1', '30:30\r\n31:31\r\n32:32\r\n33:33\r\n34:34\r\n35:35\r\n36:36\r\n37:37\r\n38:38\r\n39:39\r\n40:40\r\n41:41\r\n42:42\r\n43:43\r\n44:44\r\n45:45\r\n46:46\r\n47:47\r\n48:48\r\n49:49\r\n50:50\r\n51:51\r\n52:52\r\n53:53\r\n54:54\r\n55:55\r\n56:56\r\n57:57\r\n58:58\r\n59:59\r\n60:60', '67', '0', '1', '1436249878', '1436236781', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('600', 'afternoon_count', '下午放号数', 'char(50) NULL', 'select', '30', '', '1', '30:30\r\n31:31\r\n32:32\r\n33:33\r\n34:34\r\n35:35\r\n36:36\r\n37:37\r\n38:38\r\n39:39\r\n40:40\r\n41:41\r\n42:42\r\n43:43\r\n44:44\r\n45:45\r\n46:46\r\n47:47\r\n48:48\r\n49:49\r\n50:50\r\n51:51\r\n52:52\r\n53:53\r\n54:54\r\n55:55\r\n56:56\r\n57:57\r\n58:58\r\n59:59\r\n60:60', '67', '0', '1', '1436249892', '1436236849', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('601', 'c_time', '创建日期', 'int(10) NULL', 'date', '', '', '0', '', '67', '0', '1', '1436236906', '1436236906', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('602', 'manager_id', '管理员ID', 'int(10) NULL', 'num', '0', '', '0', '', '67', '0', '1', '1436251279', '1436251263', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('603', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '67', '0', '1', '1436251320', '1436251320', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('604', 'reservation_id', '日期ID', 'int(10) NULL', 'num', '', '', '0', '', '68', '0', '1', '1436251378', '1436251378', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('605', 'use_time', '提交预约的时间', 'int(10) NULL', 'datetime', '', '', '0', '', '68', '0', '1', '1436256904', '1436238953', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('606', 'desc', '病症描述', 'text NULL', 'textarea', '', '', '1', '', '68', '0', '1', '1436238865', '1436238865', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('607', 'name', '姓名', 'varchar(255) NULL', 'string', '', '', '1', '', '68', '0', '1', '1436238841', '1436238841', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('608', 'phone', '手机号', 'varchar(255) NULL', 'string', '', '', '1', '', '68', '0', '1', '1436254005', '1436238816', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('609', 'is_use', '是否预约', 'int(10) NULL', 'radio', '0', '', '1', '0:未预约\r\n1:已预约', '68', '0', '1', '1436256933', '1436238780', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('610', 'type', '上午/下午', 'int(10) NULL', 'radio', '', '', '1', '0:上午\r\n1:下午', '68', '0', '1', '1436256997', '1436238743', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('611', 'reservation_date', '预约日期', 'int(10) NULL', 'date', '', '', '0', '', '68', '0', '1', '1436258926', '1436238697', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('612', 'reservation_num', '预约号', 'varchar(255) NULL', 'string', '', '', '0', '', '68', '0', '1', '1436256148', '1436253089', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('613', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '69', '1', '1', '1396624337', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('614', 'use_tips', '使用说明', 'varchar(255) NOT NULL', 'textarea', '', '用户获取刮刮卡后显示的提示信息', '1', '', '69', '1', '1', '1420989679', '1399259489', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('615', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '69', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('616', 'intro', '封面简介', 'text NULL', 'editor', '', '', '1', '', '69', '0', '1', '1420983308', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('617', 'end_time', '结束时间', 'int(10) NULL', 'datetime', '', '', '1', '', '69', '0', '1', '1399259433', '1399259433', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('618', 'cover', '封面图片', 'int(10) unsigned NULL ', 'picture', '', '可为空', '1', '', '69', '0', '1', '1399710705', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('619', 'cTime', '发布时间', 'int(10) unsigned NULL ', 'datetime', '', '', '0', '', '69', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('620', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '69', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('621', 'start_time', '开始时间', 'int(10) NULL', 'datetime', '', '', '1', '', '69', '0', '1', '1399259416', '1399259416', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('622', 'end_tips', '过期说明', 'text NULL', 'textarea', '', '活动过期或者结束说明', '1', '', '69', '0', '1', '1399259570', '1399259570', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('623', 'end_img', '过期提示图片', 'int(10) unsigned NULL ', 'picture', '', '可为空', '1', '', '69', '0', '1', '1399712676', '1399711987', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('624', 'predict_num', '预计参与人数', 'int(10) unsigned NOT NULL ', 'num', '', '预计人数直接影响抽奖概率：中奖概率 = 奖品总数/(预估活动人数*每人抽奖次数) 要确保100%中奖可设置为1', '1', '', '69', '1', '1', '1399710446', '1399259992', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('625', 'max_num', '每人最多允许抽奖次数', 'int(10) unsigned NULL ', 'num', '1', '0表示不限制数量', '1', '', '69', '0', '1', '1399260079', '1399260079', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('626', 'follower_condtion', '粉丝状态', 'char(50) NULL', 'select', '1', '粉丝达到设置的状态才能获取', '1', '0:不限制\r\n1:已关注\r\n2:已绑定信息\r\n3:会员卡成员', '69', '0', '1', '1399260479', '1399260479', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('627', 'credit_conditon', '积分限制', 'int(10) unsigned NULL ', 'num', '0', '粉丝达到多少积分后才能领取，领取后不扣积分', '1', '', '69', '0', '1', '1399260618', '1399260618', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('628', 'credit_bug', '积分消费', 'int(10) unsigned NULL ', 'num', '0', '用积分中的财富兑换、兑换后扣除相应的积分财富', '1', '', '69', '0', '1', '1399260764', '1399260764', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('629', 'addon_condition', '插件场景限制', 'varchar(255) NULL', 'string', '', '格式：[插件名:id值]，如[投票:10]表示对ID为10的投票投完才能领取，更多的说明见表单上的提示', '1', '', '69', '0', '1', '1399274022', '1399261026', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('630', 'collect_count', '已领取人数', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '69', '0', '1', '1420980201', '1399270900', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('631', 'view_count', '浏览人数', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '69', '0', '1', '1420980183', '1399270926', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('632', 'update_time', '更新时间', 'int(10) NULL', 'datetime', '', '', '0', '', '69', '0', '1', '1399562468', '1399359204', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('633', 'template', '素材模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '69', '0', '1', '1430201266', '1430201266', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('634', 'title', '商店名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '70', '1', '1', '1422671603', '1422671261', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('635', 'logo', '商店LOGO', 'int(10) NULL', 'picture', '', '', '1', '', '70', '0', '1', '1422950521', '1422671295', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('636', 'intro', '店铺简介', 'text NULL', 'textarea', '', '', '1', '', '70', '0', '1', '1422671570', '1422671345', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('637', 'mobile', '联系电话', 'varchar(30) NULL', 'string', '', '', '1', '', '70', '0', '1', '1422671410', '1422671410', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('638', 'qq', 'QQ', 'int(10) NULL', 'num', '', '', '1', '', '70', '0', '1', '1422671498', '1422671498', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('639', 'wechat', '微信', 'varchar(50) NULL', 'string', '', '', '1', '', '70', '0', '1', '1422671544', '1422671544', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('640', 'template', '模板', 'varchar(30) NULL', 'string', '', '', '0', '', '70', '0', '1', '1422950165', '1422950165', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('641', 'content', '店铺介绍', 'text  NULL', 'editor', '', '', '1', '', '70', '0', '1', '1423108654', '1423108654', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('642', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '70', '0', '1', '1439456512', '1439455806', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('643', 'manager_id', '管理员ID', 'int(10) NULL', 'num', '', '', '0', '', '70', '0', '1', '1439456496', '1439455828', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('644', 'uid', '用户ID', 'int(10) NULL', 'num', '', '', '0', '', '71', '1', '1', '1429522999', '1423477509', '', '3', '', 'regex', 'get_mid', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('645', 'truename', '收货人姓名', 'varchar(100) NULL', 'string', '', '', '1', '', '71', '1', '1', '1423477690', '1423477548', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('646', 'mobile', '手机号码', 'varchar(50) NULL', 'string', '', '', '1', '', '71', '1', '1', '1423477580', '1423477580', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('647', 'city', '城市', 'varchar(255) NULL', 'cascade', '', '', '1', 'module=city', '71', '1', '1', '1423477660', '1423477660', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('648', 'address', '具体地址', 'varchar(255) NULL', 'string', '', '', '1', '', '71', '1', '1', '1423477681', '1423477681', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('649', 'is_use', '是否设置为默认', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:否\r\n1:是', '71', '0', '1', '1423536697', '1423477729', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('650', 'uid', '用户ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '0', '', '72', '0', '1', '1419577913', '1419577913', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('651', 'shop_id', '商店id', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '72', '0', '1', '1419578098', '1419577949', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('652', 'goods_id', '商品id', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '72', '0', '1', '1419578025', '1419578025', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('653', 'num', '数量', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '72', '0', '1', '1419578075', '1419578075', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('654', 'price', '单价', 'varchar(30) NOT NULL', 'num', '', '', '0', '', '72', '0', '1', '1419578162', '1419578154', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('655', 'goods_type', '商品类型', 'tinyint(2) NOT NULL', 'bool', '0', '', '1', '', '72', '0', '1', '1420551825', '1420551825', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('656', 'openid', 'openid', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '72', '0', '1', '1420195356', '1420195356', '', '3', '', 'regex', 'get_openid', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('657', 'uid', '使用UID', 'int(10) NULL', 'num', '', '', '0', '', '73', '0', '1', '1423471296', '1423471296', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('658', 'goods_id', '商品ID', 'int(10) NULL', 'num', '', '', '0', '', '73', '0', '1', '1423471321', '1423471321', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('659', 'cTime', '收藏时间', 'int(10) NULL', 'datetime', '', '', '0', '', '73', '0', '1', '1423471348', '1423471348', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('660', 'cover', '商品封面图', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '74', '0', '1', '1431071756', '1422672306', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('661', 'content', '商品介绍', 'text NOT NULL', 'editor', '', '', '1', '', '74', '0', '1', '1422672255', '1422672255', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('662', 'title', '商品名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '74', '1', '1', '1422672113', '1422672113', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('663', 'price', '价格', 'decimal(10,2) NULL', 'num', '0', '', '1', '', '74', '0', '1', '1439468076', '1422672186', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('664', 'imgs', '商品图片', 'varchar(255) NOT NULL', 'mult_picture', '', '可以上传多个图片', '1', '', '74', '0', '1', '1438331467', '1422672449', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('665', 'inventory', '库存数量', 'int(10) NULL', 'num', '0', '', '1', '', '74', '0', '1', '1422935578', '1422672560', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('666', 'shop_id', '商店ID', 'int(10) NULL', 'num', '0', '', '4', '', '74', '0', '1', '1422934861', '1422931951', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('667', 'is_show', '是否上架', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:否\r\n1:是', '74', '0', '1', '1422935533', '1422935533', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('668', 'sale_count', '销售量', 'int(10) NULL', 'num', '0', '', '0', '', '74', '0', '1', '1422935712', '1422935600', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('669', 'is_recommend', '是否推荐', 'tinyint(2) NULL', 'bool', '', '推荐后首页的推荐商品里显示', '1', '0:否\r\n1:是', '74', '0', '1', '1423107236', '1423107213', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('670', 'rank', '热销度', 'int(10) NULL', 'num', '0', '热销度由发布时间、推荐状态、销量三个维度进行计算得到', '0', '', '74', '0', '1', '1423474955', '1423126715', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('671', 'show_time', '上架时间', 'int(10) NULL', 'datetime', '0', '', '0', '', '74', '0', '1', '1423127849', '1423127833', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('672', 'old_price', '原价', 'int(10) NULL', 'num', '', '', '1', '', '74', '0', '1', '1423132272', '1423132272', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('673', 'type', '商品类型', 'tinyint(2) NULL', 'bool', '0', '注：虚拟商品不支持货到付款', '0', '0:实物商品（需要快递）\r\n1:虚拟商品（不需要快递）', '74', '0', '1', '1439549244', '1439458735', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('674', 'title', '分类标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '75', '1', '1', '1397529407', '1397529407', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('675', 'icon', '分类图标', 'int(10) unsigned NULL ', 'picture', '', '建议上传100X100的正方形图片', '1', '', '75', '0', '1', '1431072029', '1397529461', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('676', 'pid', '上一级分类', 'int(10) unsigned NULL ', 'select', '0', '如果你要增加一级分类，这里选择“无”即可', '0', '0:无', '75', '0', '1', '1422934148', '1397529555', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('677', 'path', '分类路径', 'varchar(255) NULL', 'string', '', '', '0', '', '75', '0', '1', '1397529604', '1397529604', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('678', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '数值越小越靠前', '1', '', '75', '0', '1', '1397529705', '1397529705', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('679', 'is_show', '是否显示', 'tinyint(2) NULL', 'bool', '1', '', '1', '0:不显示\r\n1:显示', '75', '0', '1', '1397532496', '1397529809', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('680', 'shop_id', '商店ID', 'int(10) NOT NULL', 'num', '0', '', '4', '', '75', '0', '1', '1422934193', '1422672025', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('681', 'is_recommend', '是否推荐', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:否\r\n1:是', '75', '0', '1', '1423106432', '1423106432', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('682', 'uid', '用户ID', 'int(10) NULL', 'num', '', '', '0', '', '76', '0', '1', '1422931055', '1422930936', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('683', 'goods_id', '商品ID', 'int(10) NULL', 'num', '', '', '0', '', '76', '0', '1', '1422930970', '1422930970', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('684', 'score', '得分', 'int(10) NULL', 'num', '0', '', '0', '', '76', '0', '1', '1422931004', '1422931004', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('685', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '76', '0', '1', '1422931044', '1422931044', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('686', 'goods_datas', '商品序列化数据', 'text NOT NULL', 'textarea', '', '', '1', '', '77', '0', '1', '1423534050', '1420269321', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('687', 'uid', '用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '77', '0', '1', '1420269348', '1420269348', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('688', 'remark', '备注', 'text NOT NULL', 'textarea', '', '', '1', '', '77', '0', '1', '1423534071', '1420269399', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('689', 'order_number', '订单编号', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '77', '0', '1', '1423534179', '1420269451', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('690', 'cTime', '订单时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '77', '0', '1', '1423534102', '1420269666', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('691', 'total_price', '总价', 'decimal(10,2) NULL', 'num', '', '', '1', '', '77', '0', '1', '1439812371', '1420272711', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('692', 'openid', 'OpenID', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '77', '0', '1', '1420526437', '1420526437', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('693', 'pay_status', '支付状态', 'int(10)  NULL', 'num', '', '', '0', '', '77', '0', '1', '1423537847', '1420596969', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('694', 'pay_type', '支付类型', 'int(10) NULL', 'num', '', '', '0', '', '77', '0', '1', '1423537868', '1420596998', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('695', 'address_id', '配送信息', 'int(10) NULL', 'num', '', '', '1', '', '77', '0', '1', '1423534264', '1423534264', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('696', 'is_send', '是否发货', 'int(10) NULL', 'num', '0', '', '1', '', '77', '0', '1', '1438336095', '1438336095', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('697', 'send_code', '快递公司编号', 'varchar(255) NULL', 'string', '', '', '1', '', '77', '0', '1', '1438336511', '1438336511', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('698', 'send_number', '快递单号', 'varchar(255) NULL', 'string', '', '', '1', '', '77', '0', '1', '1438336556', '1438336556', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('699', 'send_type', '发货类型', 'char(10) NULL', 'radio', '', '', '1', '0|线上发货\r\n1|物流公司发货', '77', '0', '1', '1438336756', '1438336756', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('700', 'is_new', '是否为新订单', 'tinyint(2) NULL', 'bool', '1', '', '0', '0:否\r\n1:是', '77', '0', '1', '1439435979', '1439435969', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('701', 'shop_id', '商店编号', 'int(10) NULL', 'num', '0', '', '1', '', '77', '0', '1', '1439455026', '1439455026', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('702', 'status_code', '订单跟踪状态码', 'char(50) NULL', 'select', '0', '', '0', '0:待支付\r\n1:待商家确认\r\n2:待发货\r\n3:配送中\r\n4:确认已收货\r\n5:确认已收款\r\n6:待评价\r\n7:已评价', '77', '0', '1', '1439536746', '1439526095', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('703', 'order_id', '订单ID', 'int(10) NULL', 'num', '', '', '0', '', '78', '0', '1', '1439525588', '1439525588', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('704', 'status_code', '状态码', 'char(50) NULL', 'select', '0', '', '0', '0:待支付\r\n1:待商家确认\r\n2:待发货\r\n3:配送中\r\n4:确认已收货\r\n5:确认已收款\r\n6:待评价\r\n7:已评价', '78', '0', '1', '1439536678', '1439525934', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('705', 'remark', '备注内容', 'varchar(255) NULL', 'string', '', '', '0', '', '78', '0', '1', '1439525979', '1439525979', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('706', 'cTime', '时间', 'int(10) NULL', 'datetime', '', '', '0', '', '78', '0', '1', '1439526002', '1439526002', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('707', 'extend', '扩展信息', 'varchar(255) NULL', 'string', '', '', '0', '', '78', '0', '1', '1439526038', '1439526038', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('708', 'title', '标题', 'varchar(255) NULL', 'string', '', '可为空', '1', '', '79', '0', '1', '1396098316', '1396098316', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('709', 'img', '图片', 'int(10) unsigned NOT NULL ', 'picture', '', '', '1', '', '79', '1', '1', '1396098349', '1396098349', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('710', 'url', '链接地址', 'varchar(255) NULL', 'string', '', '', '1', '', '79', '0', '1', '1396098380', '1396098380', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('711', 'is_show', '是否显示', 'tinyint(2) NULL', 'bool', '1', '', '1', '0:不显示\r\n1:显示', '79', '0', '1', '1396098464', '1396098464', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('712', 'sort', '排序', 'int(10) unsigned NULL ', 'num', '0', '值越小越靠前', '1', '', '79', '0', '1', '1396098682', '1396098682', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('713', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '79', '0', '1', '1396098747', '1396098747', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('714', 'shop_id', '商店ID', 'int(10) NULL', 'num', '0', '', '4', '', '79', '0', '1', '1422934490', '1422932093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1070', 'api_key', '快递接口的APPKEY', 'varchar(100) NULL', 'string', '', '申请地址：http://www.juhe.cn/docs/api/id/43', '1', '', '70', '1', '1', '1440559012', '1440559012', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('723', 'sn', 'SN码', 'varchar(255) NULL', 'string', '', '', '0', '', '81', '0', '1', '1399272236', '1399272228', '', '3', '', 'regex', 'uniqid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('724', 'uid', '粉丝UID', 'int(10) NULL', 'num', '', '', '0', '', '81', '0', '1', '1399772738', '1399272401', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('725', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '81', '0', '1', '1399272456', '1399272456', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('726', 'is_use', '是否已使用', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:未使用\r\n1:已使用', '81', '0', '1', '1400601159', '1399272514', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('727', 'use_time', '使用时间', 'int(10) NULL', 'datetime', '', '', '0', '', '81', '0', '1', '1399272560', '1399272537', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('728', 'addon', '来自的插件', 'varchar(255) NULL', 'string', 'Coupon', '', '4', '', '81', '0', '1', '1399272651', '1399272651', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('729', 'target_id', '来源ID', 'int(10) unsigned NULL ', 'num', '', '', '4', '', '81', '0', '1', '1399272705', '1399272705', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('730', 'prize_id', '奖项ID', 'int(10) unsigned NULL ', 'num', '', '', '0', '', '81', '0', '1', '1399686317', '1399686317', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('731', 'prize_title', '奖项', 'varchar(255) NULL', 'string', '', '', '1', '', '81', '0', '1', '1399790367', '1399790367', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('732', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '81', '0', '1', '1404525481', '1404525481', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('733', 'can_use', '是否可用', 'tinyint(2) NULL', 'bool', '1', '', '0', '0:不可用\r\n1:可用', '81', '0', '1', '1418890020', '1418890020', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('734', 'server_addr', '服务器IP', 'varchar(50) NULL', 'string', '', '', '1', '', '81', '0', '1', '1425807865', '1425807865', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('776', 'title', '应用标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '87', '1', '1', '1402758132', '1394033402', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('777', 'uid', '用户ID', 'int(10) NULL ', 'num', '0', '', '0', '', '87', '0', '1', '1394087733', '1394033447', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('778', 'content', '应用详细介绍', 'text NULL ', 'editor', '', '', '1', '', '87', '1', '1', '1402758118', '1394033484', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('779', 'cTime', '发布时间', 'int(10) NULL ', 'datetime', '', '', '0', '', '87', '0', '1', '1394033571', '1394033571', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('780', 'attach', '应用压缩包', 'varchar(255) NULL ', 'file', '', '需要上传zip文件', '1', '', '87', '0', '1', '1402758100', '1394033674', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('781', 'is_top', '置顶', 'int(10) NULL ', 'bool', '0', '0表示不置顶，否则其它值表示置顶且值是置顶的时间', '1', '0:不置顶\r\n1:置顶', '87', '0', '1', '1402800009', '1394068787', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('782', 'cid', '分类', 'tinyint(4) NULL ', 'select', '', '', '0', '1:基础模块\r\n2:行业模块\r\n3:会议活动\r\n4:娱乐模块\r\n5:其它模块', '87', '0', '1', '1402758069', '1394069964', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('783', 'view_count', '浏览数', 'int(11) unsigned NULL ', 'num', '0', '', '0', '', '87', '0', '1', '1394072168', '1394072168', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('784', 'download_count', '下载数', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '87', '0', '1', '1394085763', '1394085763', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('785', 'img_2', '应用截图2', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '87', '0', '1', '1402758035', '1394084714', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('786', 'img_1', '应用截图1', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '87', '0', '1', '1402758046', '1394084635', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('787', 'img_3', '应用截图3', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '87', '0', '1', '1402758021', '1394084757', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('788', 'img_4', '应用截图4', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '87', '0', '1', '1402758011', '1394084797', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('806', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '90', '1', '1', '1396624337', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('807', 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '90', '1', '1', '1396624426', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('808', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '90', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('809', 'intro', '封面简介', 'text NULL', 'textarea', '', '', '1', '', '90', '0', '1', '1396624505', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('810', 'mTime', '修改时间', 'int(10) NULL', 'datetime', '', '', '0', '', '90', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('811', 'cover', '封面图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '90', '1', '1', '1439368240', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('812', 'cTime', '发布时间', 'int(10) unsigned NULL ', 'datetime', '', '', '0', '', '90', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('813', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '90', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('814', 'finish_tip', '结束语', 'text NULL', 'textarea', '', '为空默认为：调研完成，谢谢参与', '1', '', '90', '0', '1', '1440403647', '1396953940', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('815', 'template', '素材模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '90', '0', '1', '1430193696', '1430193696', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('816', 'answer', '回答内容', 'text NULL', 'textarea', '', '', '0', '', '91', '0', '1', '1396955766', '1396955766', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('817', 'openid', 'OpenId', 'varchar(255) NULL', 'string', '', '', '0', '', '91', '0', '1', '1396955581', '1396955581', '', '3', '', 'regex', 'get_openid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('818', 'uid', '用户UID', 'int(10) NULL ', 'num', '', '', '0', '', '91', '0', '1', '1396955530', '1396955530', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('819', 'question_id', 'question_id', 'int(10) unsigned NOT NULL ', 'num', '', '', '4', '', '91', '1', '1', '1396955412', '1396955392', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('820', 'cTime', '发布时间', 'int(10) unsigned NULL ', 'datetime', '', '', '0', '', '91', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('821', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '91', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('822', 'survey_id', 'survey_id', 'int(10) unsigned NOT NULL ', 'num', '', '', '4', '', '91', '1', '1', '1396955403', '1396955369', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('823', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '92', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('824', 'intro', '问题描述', 'text NULL', 'textarea', '', '', '1', '', '92', '0', '1', '1396954176', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('825', 'cTime', '发布时间', 'int(10) unsigned NULL ', 'datetime', '', '', '0', '', '92', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('826', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '92', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('827', 'is_must', '是否必填', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:否\r\n1:是', '92', '0', '1', '1396954649', '1396954649', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('828', 'extra', '参数', 'text NULL', 'textarea', '', '类型为单选、多选时的定义数据，格式见上面的提示', '1', '', '92', '0', '1', '1396954558', '1396954558', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('829', 'type', '问题类型', 'char(50) NOT NULL', 'radio', 'radio', '', '1', 'radio:单选题\r\ncheckbox:多选题\r\ntextarea:简答题', '92', '1', '1', '1396962517', '1396954463', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('830', 'survey_id', 'survey_id', 'int(10) unsigned NOT NULL ', 'num', '', '', '4', '', '92', '1', '1', '1396954240', '1396954240', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('831', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '值越小越靠前', '1', '', '92', '0', '1', '1396955010', '1396955010', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('832', 'title', '公告标题', 'varchar(255) NULL', 'string', '', '', '1', '', '93', '1', '1', '1431143985', '1431143985', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('833', 'content', '公告内容', 'text  NULL', 'editor', '', '', '1', '', '93', '1', '1', '1431144020', '1431144020', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('834', 'create_time', '发布时间', 'int(10) NULL', 'datetime', '', '', '4', '', '93', '0', '1', '1431146373', '1431144069', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('835', 'version', '版本号', 'int(10) unsigned NOT NULL ', 'num', '', '', '1', '', '94', '1', '1', '1393770457', '1393770457', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('836', 'title', '升级包名', 'varchar(50) NOT NULL', 'string', '', '', '1', '', '94', '1', '1', '1393770499', '1393770499', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('837', 'description', '描述', 'text NULL', 'textarea', '', '', '1', '', '94', '0', '1', '1393770546', '1393770546', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('838', 'create_date', '创建时间', 'int(10) NULL', 'datetime', '', '', '1', '', '94', '0', '1', '1393770591', '1393770591', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('839', 'download_count', '下载统计', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '94', '0', '1', '1393770659', '1393770659', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('840', 'package', '升级包地址', 'varchar(255) NOT NULL', 'textarea', '', '', '1', '', '94', '1', '1', '1393812247', '1393770727', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('841', 'keyword', '关键词', 'varchar(50) NOT NULL', 'string', '', '用户在微信里回复此关键词将会触发此投票。', '1', '', '95', '1', '1', '1392969972', '1388930888', 'keyword_unique', '1', '此关键词已经存在，请换成别的关键词再试试', 'function', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('842', 'title', '投票标题', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '95', '1', '1', '1388931041', '1388931041', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('843', 'description', '投票描述', 'text NULL', 'textarea', '', '', '1', '', '95', '0', '1', '1400633517', '1388931173', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('844', 'picurl', '封面图片', 'int(10) unsigned NULL ', 'picture', '', '支持JPG、PNG格式，较好的效果为大图360*200，小图200*200', '1', '', '95', '0', '1', '1388931285', '1388931285', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('845', 'type', '选择类型', 'char(10) NOT NULL', 'radio', '0', '', '0', '0:单选\r\n1:多选', '95', '1', '1', '1430376146', '1388931487', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('846', 'start_date', '开始日期', 'int(10) NULL', 'datetime', '', '', '1', '', '95', '0', '1', '1388931734', '1388931734', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('847', 'end_date', '结束日期', 'int(10) NULL', 'datetime', '', '', '1', '', '95', '0', '1', '1388931769', '1388931769', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('848', 'is_img', '文字/图片投票', 'tinyint(2) NULL', 'radio', '0', '', '0', '0:文字投票\r\n1:图片投票', '95', '1', '1', '1389081985', '1388931941', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('849', 'vote_count', '投票数', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '95', '0', '1', '1388932035', '1388932035', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('850', 'cTime', '投票创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '95', '1', '1', '1388932128', '1388932128', '', '1', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('851', 'mTime', '更新时间', 'int(10) NULL', 'datetime', '', '', '0', '', '95', '0', '1', '1430379170', '1390634006', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('852', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '95', '0', '1', '1391397388', '1391397388', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('853', 'template', '素材模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '95', '0', '1', '1430188739', '1430188739', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('854', 'vote_id', '投票ID', 'int(10) unsigned NULL ', 'num', '', '', '1', '', '96', '1', '1', '1429846753', '1388934189', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('855', 'user_id', '用户ID', 'int(10) NULL ', 'num', '', '', '1', '', '96', '1', '1', '1429855665', '1388934265', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('856', 'token', '用户TOKEN', 'varchar(255) NULL', 'string', '', '', '0', '', '96', '1', '1', '1429855713', '1388934296', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('857', 'options', '选择选项', 'varchar(255) NULL', 'string', '', '', '1', '', '96', '1', '1', '1429855086', '1388934351', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('858', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '96', '0', '1', '1429874378', '1388934392', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1059', 'order', '选项排序', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '123', '0', '1', '1388933951', '1388933951', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1058', 'opt_count', '当前选项投票数', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '123', '0', '1', '1429861248', '1388933860', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1057', 'image', '图片选项', 'int(10) unsigned NULL ', 'picture', '', '', '5', '', '123', '0', '1', '1388984467', '1388933679', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1056', 'name', '选项标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '123', '1', '1', '1388933552', '1388933552', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1055', 'vote_id', '投票ID', 'int(10) unsigned NOT NULL ', 'num', '', '', '4', '', '123', '1', '1', '1388982678', '1388933478', '', '3', '', 'regex', '$_REQUEST[\'vote_id\']', '3', 'string');
INSERT INTO `wp_attribute` VALUES ('867', 'title', '分类标题', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '99', '1', '1', '1408950771', '1395988016', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('868', 'icon', '分类图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '99', '0', '1', '1395988966', '1395988966', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('869', 'url', '外链', 'varchar(255) NULL', 'string', '', '为空时默认跳转到该分类的文章列表页面', '1', '', '99', '0', '1', '1401408363', '1395989660', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('870', 'is_show', '显示', 'tinyint(2) NULL', 'bool', '1', '', '1', '0: 不显示\r\n1: 显示', '99', '0', '1', '1395989709', '1395989709', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('871', 'token', 'Token', 'varchar(100) NULL ', 'string', '', '', '0', '', '99', '0', '1', '1395989760', '1395989760', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('872', 'sort', '排序号', 'int(10) NULL ', 'num', '0', '数值越小越靠前', '1', '', '99', '0', '1', '1396340334', '1396340334', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('873', 'pid', '一级目录', 'int(10) NULL', 'cascade', '0', '', '1', 'type=db&table=weisite_category&pid=id', '99', '0', '1', '1439522271', '1439469294', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('874', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '100', '1', '1', '1396061575', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('875', 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '100', '0', '1', '1396061814', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('876', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '100', '1', '1', '1396061877', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('877', 'intro', '简介', 'text NULL', 'textarea', '', '', '1', '', '100', '0', '1', '1396061947', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('878', 'cate_id', '所属类别', 'int(10) unsigned NULL ', 'select', '0', '要先在微官网分类里配置好分类才可选择', '1', '0:请选择分类', '100', '0', '1', '1396078914', '1396062003', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('879', 'cover', '封面图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '100', '0', '1', '1396062093', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('880', 'content', '内容', 'text NULL', 'editor', '', '', '1', '', '100', '0', '1', '1396062146', '1396062146', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('881', 'cTime', '发布时间', 'int(10) NULL', 'datetime', '', '', '0', '', '100', '0', '1', '1396075102', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('882', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '数值越小越靠前', '1', '', '100', '0', '1', '1396510508', '1396510508', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('883', 'view_count', '浏览数', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '100', '0', '1', '1396510630', '1396510630', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('884', 'url', '关联URL', 'varchar(255) NULL ', 'string', '', '', '1', '', '101', '0', '1', '1394519090', '1394519090', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('885', 'title', '菜单名', 'varchar(50) NOT NULL', 'string', '', '可创建最多 3 个一级菜单，每个一级菜单下可创建最多 5 个二级菜单。编辑中的菜单不会马上被用户看到，请放心调试。', '1', '', '101', '1', '1', '1408950832', '1394518988', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('886', 'pid', '一级菜单', 'tinyint(2) NULL', 'select', '0', '如果是一级菜单，选择“无”即可', '1', '0:无', '101', '0', '1', '1409045931', '1394518930', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('887', 'sort', '排序号', 'tinyint(4) NULL ', 'num', '0', '数值越小越靠前', '1', '', '101', '0', '1', '1394523288', '1394519175', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('888', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '101', '0', '1', '1394526820', '1394526820', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('889', 'icon', '图标', 'int(10) unsigned NULL ', 'picture', '', '根据选择的底部模板决定是否需要上传图标', '1', '', '101', '0', '1', '1396506297', '1396506297', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('890', 'title', '标题', 'varchar(255) NULL', 'string', '', '可为空', '1', '', '102', '0', '1', '1396098316', '1396098316', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('891', 'img', '图片', 'int(10) unsigned NOT NULL ', 'picture', '', '', '1', '', '102', '1', '1', '1396098349', '1396098349', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('892', 'url', '链接地址', 'varchar(255) NULL', 'string', '', '', '1', '', '102', '0', '1', '1396098380', '1396098380', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('893', 'is_show', '是否显示', 'tinyint(2) NULL', 'bool', '1', '', '1', '0:不显示\r\n1:显示', '102', '0', '1', '1396098464', '1396098464', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('894', 'sort', '排序', 'int(10) unsigned NULL ', 'num', '0', '值越小越靠前', '1', '', '102', '0', '1', '1396098682', '1396098682', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('895', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '102', '0', '1', '1396098747', '1396098747', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('896', 'ToUserName', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '103', '0', '1', '1438143065', '1438143065', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('897', 'FromUserName', 'OpenID', 'varchar(100) NULL', 'string', '', '', '0', '', '103', '0', '1', '1438143098', '1438143098', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('898', 'CreateTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '103', '0', '1', '1438143120', '1438143120', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('899', 'MsgType', '消息类型', 'varchar(30) NULL', 'string', '', '', '0', '', '103', '0', '1', '1438143139', '1438143139', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('900', 'MsgId', '消息ID', 'varchar(100) NULL', 'string', '', '', '0', '', '103', '0', '1', '1438143182', '1438143182', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('901', 'Content', '文本消息内容', 'text NULL', 'textarea', '', '', '0', '', '103', '0', '1', '1438143218', '1438143218', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('902', 'PicUrl', '图片链接', 'varchar(255) NULL', 'string', '', '', '0', '', '103', '0', '1', '1438143273', '1438143273', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('903', 'MediaId', '多媒体文件ID', 'varchar(100) NULL', 'string', '', '', '0', '', '103', '0', '1', '1438143357', '1438143357', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('904', 'Format', '语音格式', 'varchar(30) NULL', 'string', '', '', '0', '', '103', '0', '1', '1438143397', '1438143397', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('905', 'ThumbMediaId', '缩略图的媒体id', 'varchar(30) NULL', 'string', '', '', '0', '', '103', '0', '1', '1438143445', '1438143426', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('906', 'Title', '消息标题', 'varchar(100) NULL', 'string', '', '', '0', '', '103', '0', '1', '1438143471', '1438143471', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('907', 'Description', '消息描述', 'text NULL', 'textarea', '', '', '0', '', '103', '0', '1', '1438143535', '1438143535', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('908', 'Url', 'Url', 'varchar(255) NULL', 'string', '', '', '0', '', '103', '0', '1', '1438143558', '1438143558', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('909', 'collect', '收藏状态', 'tinyint(1) NULL', 'bool', '0', '', '0', '0:未收藏\r\n1:已收藏', '103', '0', '1', '1438153936', '1438153936', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('910', 'deal', '处理状态', 'tinyint(1) NULL', 'bool', '0', '', '0', '0:未处理\r\n1:已处理', '103', '0', '1', '1438165005', '1438153991', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('911', 'is_read', '是否已读', 'tinyint(1) NULL', 'bool', '0', '', '1', '0:未读\r\n1:已读', '103', '0', '1', '1438165062', '1438165062', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('912', 'type', '消息分类', 'tinyint(1) NULL', 'bool', '0', '', '1', '0:用户消息\r\n1:管理员回复消息', '103', '0', '1', '1438168301', '1438168301', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('913', 'send_name', '发送人', 'varchar(255) NULL', 'string', '', '', '1', '', '104', '1', '1', '1429346507', '1429346507', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('914', 'receive_name', '接收人', 'varchar(255) NULL', 'string', '', '', '1', '', '104', '1', '1', '1429346556', '1429346556', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('915', 'content', '祝福语', 'text NULL', 'textarea', '', '', '1', '', '104', '1', '1', '1429346679', '1429346679', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('916', 'create_time', ' 创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '104', '0', '1', '1429604045', '1429346729', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('917', 'template', '模板', 'char(50) NULL', 'string', '', '模板的文件夹名称，不能为中文', '1', '', '104', '1', '1', '1429348371', '1429346979', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('918', 'template_cate', '模板分类', 'varchar(255) NULL', 'string', '', '', '4', '', '104', '1', '1', '1429348355', '1429347540', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('919', 'read_count', '浏览次数', 'int(10) NULL', 'num', '0', '', '0', '', '104', '0', '1', '1429348951', '1429348951', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('920', 'mid', '用户Id', 'varchar(255) NULL', 'num', '', '', '0', '', '104', '0', '1', '1429673299', '1429512603', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('921', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '104', '0', '1', '1429764969', '1429764969', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('922', 'content_cate_id', '祝福语类别Id', 'int(10) NULL', 'num', '0', '', '4', '', '105', '1', '1', '1429349347', '1429349074', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('923', 'content', '祝福语', 'text NULL', 'textarea', '', '', '1', '', '105', '1', '1', '1429349162', '1429349162', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('924', 'content_cate', '类别', 'varchar(255) NULL', 'select', '', '', '1', '', '105', '0', '1', '1429522282', '1429350568', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('925', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '105', '0', '1', '1429523422', '1429512730', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('926', 'content_cate_name', '祝福语类别', 'varchar(255) NULL', 'string', '', '', '1', '', '106', '1', '1', '1429349396', '1429349396', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('927', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '106', '0', '1', '1429520955', '1429512697', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `wp_attribute` VALUES ('928', 'content_cate_icon', '类别图标', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '106', '0', '1', '1429597855', '1429597855', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('929', 'end_date', '结束日期', 'int(10) NULL ', 'datetime', '', '', '1', '', '107', '0', '1', '1395395670', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('930', 'cTime', '活动创建时间', 'int(10) NULL ', 'datetime', '', '', '0', '', '107', '0', '1', '1395395963', '1395395179', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('931', 'states', '活动状态', 'char(10) NULL ', 'radio', '0', '', '0', '0:未开始\r\n1:已结束', '107', '0', '1', '1395395602', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('932', 'picurl', '封面图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '107', '1', '1', '1439370422', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('933', 'title', '活动标题', 'varchar(255) NULL ', 'string', '', '', '1', '', '107', '0', '1', '1395395535', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('934', 'guiz', '活动规则', 'text NULL ', 'textarea', '', '', '1', '', '107', '0', '1', '1418369751', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('935', 'choujnum', '每日抽奖次数', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '107', '0', '1', '1395395485', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('936', 'des', '活动介绍', 'text NULL ', 'textarea', '', '', '0', '', '107', '0', '1', '1431068356', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('937', 'des_jj', '活动介绍', 'text NULL ', 'textarea', '', '活动介绍简介 用于给用户发送消息时候的图文描述', '1', '', '107', '0', '1', '1431068323', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('938', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '107', '0', '1', '1395396571', '1395396571', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('939', 'keyword', '关键词', 'varchar(255) NULL ', 'string', '', '用户发送 “关键词” 触发', '1', '', '107', '0', '1', '1395395713', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('940', 'start_date', '开始时间', 'int(10) NULL ', 'datetime', '', '', '1', '', '107', '0', '1', '1395395676', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('941', 'experience', '消耗经验值', 'int(10) NULL', 'num', '0', '', '1', '', '107', '0', '1', '1419299966', '1419299966', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('942', 'background', '背景图', 'int(10) UNSIGNED NULL', 'picture', '', '图片尺寸建议是760X421 并且主要内容要居中并留出大转盘位置', '1', '', '107', '0', '1', '1419997464', '1419997464', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('943', 'template', '素材模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '107', '0', '1', '1431659474', '1431659474', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('944', 'gailv', '中奖概率', 'int(10) UNSIGNED NULL', 'num', '0', '请输入0-100之间的整数', '1', '', '108', '0', '1', '1419303857', '1395559151', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('945', 'gailv_str', '参数', 'varchar(255) NULL', 'string', '', '请输入对应中奖方式的相应值 多个以英文状态下的 逗号(,)分隔', '0', '', '108', '0', '1', '1419303819', '1395559219', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('946', 'xydzp_id', '幸运大转盘关联的活动id', 'int(10) UNSIGNED NULL', 'num', '0', '幸运大转盘关联的活动id', '0', '', '108', '0', '1', '1395555019', '1395555019', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('947', 'jlnum', '奖励数量', 'int(10) UNSIGNED NULL', 'num', '1', '中奖后，获得该奖品的数量', '0', '', '108', '0', '1', '1419303776', '1395559386', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('948', 'type', '奖品中奖方式', 'char(50) NULL', 'select', '0', '选择奖品中奖的方式', '0', '0:按概率中奖\r\n1:按时间中奖(未启用)\r\n2:按顺序中奖(未启用)\r\n3:按指定用户id中奖(未启用)', '108', '0', '1', '1419303723', '1395559102', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('949', 'gailv_maxnum', '单日发放上限', 'int(10) UNSIGNED NULL', 'num', '0', '每天最多发放奖品的数量', '1', '', '108', '0', '1', '1395559281', '1395559281', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('950', 'xydzp_option_id', '幸运大转盘关联的全局奖品id', 'int(10) UNSIGNED NULL', 'num', '', '幸运大转盘关联的全局奖品id', '0', '', '108', '0', '1', '1395555085', '1395555085', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('951', 'uid', '用户openid', 'varchar(255) NULL', 'string', '', '', '0', '', '109', '0', '1', '1396686415', '1396686415', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('952', 'message', '留言', 'text NULL ', 'string', '', '', '1', '', '109', '0', '1', '1395395200', '1395395200', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('953', 'address', '收件地址', 'text NULL ', 'string', '', '', '1', '', '109', '0', '1', '1395395200', '1395395200', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('954', 'iphone', '电话', 'varchar(255) NULL ', 'string', '', '', '1', '', '109', '0', '1', '1395395200', '1395395200', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('955', 'zip', '邮编', 'int(10) unsigned NULL ', 'string', '', '', '1', '', '109', '0', '1', '1395395200', '1395395200', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('956', 'state', '领奖状态', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:未领取\r\n1:已领取', '109', '0', '1', '1396705093', '1395395200', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('957', 'xydzp_option_id', '奖品id', 'int(10) unsigned NULL ', 'string', '0', '', '1', '', '109', '0', '1', '1395395200', '1395395200', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('958', 'xydzp_id', '活动id', 'int(10) unsigned NULL ', 'string', '0', '', '1', '', '109', '0', '1', '1395395200', '1395395200', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('959', 'zjdate', '中奖时间', 'int(10) UNSIGNED NULL', 'num', '', '', '0', '', '109', '0', '1', '1396191999', '1396191999', '', '3', '', 'regex', 'time()', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('960', 'jptype', '奖品类型', 'char(10) NULL ', 'select', '0', '奖品的类型', '1', '0:经验值|coupon_id@hide,experience@show,num@show,card_url@hide\r\n1:优惠券|coupon_id@show,experience@hide,num@show,card_url@hide\r\n2:谢谢参与|coupon_id@hide,experience@hide,num@hide,card_url@hide\r\n3:微信卡券|coupon_id@hide,experience@hide,num@show,card_url@show', '110', '0', '1', '1420207419', '1395395190', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('961', 'duijma', '兑奖码', 'text NULL', 'textarea', '', '请输入兑奖码，一行一个', '0', '', '110', '0', '1', '1419300292', '1396253842', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('962', 'title', '奖品名称', 'varchar(255) NULL ', 'string', '', '', '1', '', '110', '0', '1', '1395495283', '1395395190', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('963', 'pic', '奖品图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '110', '0', '1', '1395495279', '1395395190', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('964', 'miaoshu', '奖品描述', 'text NULL ', 'textarea', '', '', '1', '', '110', '0', '1', '1418628021', '1395395190', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('965', 'num', '库存数量', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '110', '0', '1', '1396667941', '1395395190', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('966', 'isdf', '是否为谢谢惠顾类', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:中奖品\r\n1:该奖为谢谢惠顾类', '110', '0', '1', '1419392345', '1396191564', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('967', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '110', '0', '1', '1395554191', '1395554191', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('968', 'coupon_id', '优惠券编号', 'int(10) NULL', 'num', '', '', '1', '', '110', '0', '1', '1419300336', '1419300336', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('969', 'experience', '奖励经验值', 'int(10) NULL', 'num', '0', '', '1', '', '110', '0', '1', '1419300396', '1419300396', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('970', 'card_url', '领取卡券的地址', 'varchar(255) NULL', 'string', '', '', '1', '', '110', '0', '1', '1420207297', '1420207297', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('971', 'uid', '用户id', 'varchar(255) NULL', 'string', '', '用户id', '0', '', '111', '0', '1', '1395567404', '1395567404', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('972', 'xydzp_id', '幸运大转盘关联的活动id', 'int(10) UNSIGNED NULL', 'num', '', '幸运大转盘关联的活动id', '0', '', '111', '0', '1', '1395567452', '1395567452', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('973', 'num', '已经抽奖的次数', 'int(10) UNSIGNED NULL', 'num', '0', '', '1', '', '111', '0', '1', '1395567486', '1395567486', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('974', 'cjdate', '抽奖日期', 'int(10) NULL', 'datetime', '', '', '1', '', '111', '0', '1', '1395567537', '1395567537', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('994', 'fid', '', 'int(11) NULL ', 'string', '', '', '1', '', '114', '0', '1', '1404033503', '1404033503', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('995', 'token', '', 'varchar(60) NULL ', 'string', '', '', '1', '', '114', '0', '1', '1404033503', '1404033503', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('996', 'openid', '', 'varchar(60) NULL ', 'string', '', '', '1', '', '114', '0', '1', '1404033503', '1404033503', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('997', 'date', '', 'varchar(11) NULL ', 'string', '', '', '1', '', '114', '0', '1', '1404033504', '1404033504', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('998', 'enddate', '', 'int(11) NULL ', 'string', '', '', '1', '', '114', '0', '1', '1404033504', '1404033504', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('999', 'model', '', 'varchar(60) NULL ', 'string', '', '', '1', '', '114', '0', '1', '1404033504', '1404033504', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1000', 'num', '', 'int(11) NULL ', 'string', '', '', '1', '', '114', '0', '1', '1404033505', '1404033505', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1001', 'keyword', '', 'varchar(60) NULL ', 'string', '', '', '1', '', '114', '0', '1', '1404033505', '1404033505', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1002', 'type', '', 'tinyint(1) NULL ', 'string', '', '', '1', '', '114', '0', '1', '1404033505', '1404033505', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1003', 'token', 'token', 'varchar(255) NULL', 'string', '', '', '0', '', '115', '0', '1', '1404485505', '1404475530', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1004', 'groupname', '分组名称', 'varchar(255) NULL', 'string', '', '', '1', '', '115', '0', '1', '1404475556', '1404475556', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1005', 'groupdata', '分组数据源', 'text NULL', 'textarea', '', '', '0', '', '115', '0', '1', '1404476127', '1404476127', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1006', 'msgkeyword', '消息关键字', 'varchar(555) NULL', 'string', '', '当用户发送的消息中含有关键字时,将自动转到分配的客服人员', '1', '', '116', '0', '1', '1404399336', '1404399336', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1007', 'msgkeyword_type', '关键字类型', 'char(50) NULL', 'select', '3', '选择关键字匹配的类型', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '116', '0', '1', '1404399466', '1404399466', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1008', 'msgkfaccount', '接待的客服人员', 'varchar(255) NULL', 'string', '', '', '0', '', '116', '0', '1', '1404403340', '1404399587', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1009', 'cTime', '创建时间', 'int(10) NULL', 'date', '', '', '0', '', '116', '0', '1', '1404399629', '1404399629', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1010', 'token', 'token', 'varchar(255) NULL', 'string', '', '', '0', '', '116', '0', '1', '1404399656', '1404399656', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1011', 'msgstate', '关键字状态', 'tinyint(2) NULL', 'bool', '1', '停用后用户将不会触发此关键词', '1', '0:停用\r\n1:启用', '116', '0', '1', '1404399749', '1404399749', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1012', 'zjnum', '转接次数', 'int(10) NULL', 'num', '', '', '0', '', '116', '0', '1', '1404399784', '1404399784', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1013', 'zdtype', '指定类型', 'char(10) NULL', 'radio', '0', '选择关键字匹配时是按指定人员或者指定客服组', '1', '0:指定客服人员\r\n1:指定客服组', '116', '0', '1', '1404474672', '1404474672', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1014', 'kfgroupid', '客服分组id', 'int(10) NULL', 'num', '0', '', '0', '', '116', '0', '1', '1404474777', '1404474777', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1015', 'pid', '', 'int(11) NULL ', 'string', '', '', '1', '', '117', '0', '1', '1403947272', '1403947272', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1016', 'openid', '', 'varchar(60) NULL ', 'string', '', '', '1', '', '117', '0', '1', '1403947273', '1403947273', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1017', 'enddate', '', 'int(11) NULL ', 'string', '', '', '1', '', '117', '0', '1', '1403947273', '1403947273', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1018', 'keyword', '', 'varchar(200) NULL ', 'string', '', '', '1', '', '117', '0', '1', '1403947274', '1403947274', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1019', 'status', '', 'tinyint(1) NULL ', 'string', '2', '', '1', '', '117', '0', '1', '1403947274', '1403947274', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1020', 'name', '客服昵称', 'varchar(60) NULL ', 'string', '', '', '1', '', '118', '0', '1', '1403959775', '1403947255', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('1021', 'token', 'token', 'varchar(60) NULL ', 'string', '', '', '0', '', '118', '0', '1', '1403959638', '1403947256', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1022', 'userName', '客服帐号', 'varchar(60) NULL ', 'string', '', '', '1', '', '118', '0', '1', '1403959752', '1403947256', '', '3', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('1023', 'userPwd', '客服密码', 'varchar(32) NULL ', 'string', '', '', '1', '', '118', '0', '1', '1403959722', '1403947257', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('1024', 'endJoinDate', '客服加入时间', 'int(11) NULL ', 'string', '', '', '0', '', '118', '0', '1', '1403959825', '1403947257', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1025', 'status', '客服在线状态', 'tinyint(1) NULL ', 'bool', '0', '', '0', '0:离线\r\n1:在线', '118', '0', '1', '1404016782', '1403947258', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `wp_attribute` VALUES ('1026', 'state', '客服状态', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:停用\r\n1:启用', '118', '0', '1', '1404016877', '1404016877', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1027', 'isdelete', '是否删除', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:正常\r\n1:已被删除', '118', '0', '1', '1404016931', '1404016931', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1028', 'kfid', '客服编号', 'varchar(255) NULL', 'string', '', '', '1', '', '118', '0', '1', '1404398387', '1404398387', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1029', 'openid', '', 'varchar(60) NULL ', 'string', '', '', '1', '', '119', '0', '1', '1404026716', '1404026716', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1030', 'enddate', '', 'int(11) NULL ', 'string', '', '', '1', '', '119', '0', '1', '1404026716', '1404026716', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1031', 'joinUpDate', '', 'int(11) NULL ', 'string', '0', '', '1', '', '119', '0', '1', '1404026716', '1404026716', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1032', 'uid', '', 'int(11) NULL ', 'string', '0', '', '1', '', '119', '0', '1', '1404026717', '1404026717', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1033', 'token', '', 'varchar(40) NULL ', 'string', '', '', '1', '', '119', '0', '1', '1404026717', '1404026717', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1034', 'g_id', '', 'varchar(20) NULL ', 'string', '', '', '1', '', '120', '0', '1', '1404027302', '1404027302', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1035', 'nickname', '', 'varchar(60) NULL ', 'string', '', '', '1', '', '120', '0', '1', '1404027302', '1404027302', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1036', 'sex', '', 'tinyint(1) NULL ', 'string', '', '', '1', '', '120', '0', '1', '1404027303', '1404027303', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1037', 'province', '', 'varchar(20) NULL ', 'string', '', '', '1', '', '120', '0', '1', '1404027303', '1404027303', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1038', 'city', '', 'varchar(30) NULL ', 'string', '', '', '1', '', '120', '0', '1', '1404027303', '1404027303', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1039', 'headimgurl', '', 'varchar(200) NULL ', 'string', '', '', '1', '', '120', '0', '1', '1404027304', '1404027304', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1040', 'subscribe_time', '', 'int(11) NULL ', 'string', '', '', '1', '', '120', '0', '1', '1404027304', '1404027304', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1041', 'token', '', 'varchar(30) NULL ', 'string', '', '', '1', '', '120', '0', '1', '1404027305', '1404027305', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1042', 'openid', '', 'varchar(60) NULL ', 'string', '', '', '1', '', '120', '0', '1', '1404027305', '1404027305', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1043', 'status', '', 'tinyint(1) NULL ', 'string', '', '', '1', '', '120', '0', '1', '1404027305', '1404027305', '', '0', '', '', '', '0', '');
INSERT INTO `wp_attribute` VALUES ('1044', 'opercode', '会话状态', 'int(10) NULL', 'num', '', '', '1', '', '121', '0', '1', '1406094322', '1406094322', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1045', 'text', '消息', 'text NULL', 'textarea', '', '', '1', '', '121', '0', '1', '1406094387', '1406094387', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1046', 'time', '时间', 'int(10) NULL', 'datetime', '', '', '1', '', '121', '0', '1', '1406094341', '1406094341', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1047', 'openid', 'openid', 'varchar(255) NULL', 'string', '', '', '1', '', '121', '0', '1', '1406094276', '1406094276', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1048', 'token', 'token', 'varchar(255) NULL', 'string', '', '', '0', '', '121', '0', '1', '1406094177', '1406094177', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1049', 'worker', '客服名称', 'varchar(255) NULL', 'string', '', '', '1', '', '121', '0', '1', '1406094257', '1406094257', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1060', 'wx_key_pem', '上传密匙', 'int(10) UNSIGNED NULL', 'file', '', 'apiclient_key.pem', '1', '', '61', '0', '1', '1439804544', '1439804014', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1062', 'login_name', 'login_name', 'varchar(100) NULL', 'string', '', '', '0', '', '1', '0', '1', '1439978705', '1439978705', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1063', 'content', '文本消息内容', 'text NULL', 'textarea', '', '', '0', '', '18', '0', '1', '1439980070', '1439980070', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1064', 'category_id', '商品分类', 'char(50) NULL', 'select', '', '', '1', '', '74', '0', '1', '1440126604', '1440066901', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1065', 'token', 'token', 'varchar(255) NULL', 'string', '', '', '0', '', '32', '0', '1', '1440071867', '1440071805', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1066', 'manager_id', '管理员id', 'int(10) NULL', 'num', '', '', '0', '', '32', '0', '1', '1440071927', '1440071917', '', '3', '', 'regex', 'get_mid', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1067', 'start_time', '开始时间', 'int(10) NULL', 'datetime', '', '', '1', '', '90', '1', '1', '1440408604', '1440407931', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1068', 'end_time', '结束时间', 'int(10) NULL', 'datetime', '', '', '1', '', '90', '1', '1', '1440408598', '1440407951', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1069', 'act_remark', '活动备注', 'varchar(255) NULL', 'string', '', '', '1', '', '65', '0', '1', '1440488802', '1440488802', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `wp_attribute` VALUES ('1088', 'interface_token', '接口配置token', 'varchar(255) NULL', 'string', '', '', '0', '', '6', '1', '1', '1392946881', '1391576234', '', '3', '', 'regex', '', '3', 'function');

-- ----------------------------
-- Table structure for `wp_auth_extend`
-- ----------------------------
DROP TABLE IF EXISTS `wp_auth_extend`;
CREATE TABLE `wp_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`) ,
  KEY `uid` (`group_id`) ,
  KEY `group_id` (`extend_id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of wp_auth_extend
-- ----------------------------
INSERT INTO `wp_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `wp_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `wp_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `wp_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `wp_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `wp_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `wp_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `wp_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for `wp_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `wp_auth_group`;
CREATE TABLE `wp_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(30) DEFAULT NULL COMMENT '分组名称',
  `icon` int(10) unsigned DEFAULT NULL COMMENT '图标',
  `description` text COMMENT '描述信息',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `type` tinyint(2) DEFAULT '1' COMMENT '类型',
  `rules` text COMMENT '权限',
  `manager_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认自动加入',
  `qr_code` varchar(255) DEFAULT NULL COMMENT '微信二维码',
  `wechat_group_id` int(10) DEFAULT NULL COMMENT '微信端的分组ID',
  `wechat_group_name` varchar(100) DEFAULT NULL COMMENT '微信端的分组名',
  `wechat_group_count` int(10) DEFAULT NULL COMMENT '微信端用户数',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_auth_group
-- ----------------------------
INSERT INTO `wp_auth_group` VALUES ('1', '默认用户组', null, '通用的用户组', '1', '0', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106', '0', '', '0', '', null, '', null, '0');
INSERT INTO `wp_auth_group` VALUES ('2', '公众号粉丝组', null, '所有从公众号自动注册的粉丝用户都会自动加入这个用户组', '1', '0', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195', '0', '', '0', '', null, '', null, '0');
INSERT INTO `wp_auth_group` VALUES ('3', '公众号管理组', null, '公众号管理员注册时会自动加入这个用户组', '1', '0', '', '0', '', '0', '', null, '', null, '0');

-- ----------------------------
-- Table structure for `wp_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `wp_auth_group_access`;
CREATE TABLE `wp_auth_group_access` (
  `uid` int(10) DEFAULT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) ,
  KEY `uid` (`uid`) ,
  KEY `group_id` (`group_id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_auth_group_access
-- ----------------------------
INSERT INTO `wp_auth_group_access` VALUES ('1', '3');

-- ----------------------------
-- Table structure for `wp_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `wp_auth_rule`;
CREATE TABLE `wp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  `group` char(30) DEFAULT '默认分组',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) 
) ENGINE=MyISAM AUTO_INCREMENT=280 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_auth_rule
-- ----------------------------
INSERT INTO `wp_auth_rule` VALUES ('241', 'Admin/Rule/createRule', '权限节点管理', '1', '', '默认分组');
INSERT INTO `wp_auth_rule` VALUES ('242', 'Admin/AuthManager/index', '用户组管理', '1', '', '默认分组');
INSERT INTO `wp_auth_rule` VALUES ('243', 'Admin/User/index', '用户信息', '1', '', '用户管理');

-- ----------------------------
-- Table structure for `wp_auto_reply`
-- ----------------------------
DROP TABLE IF EXISTS `wp_auto_reply`;
CREATE TABLE `wp_auto_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
  `msg_type` char(50) DEFAULT 'text' COMMENT '消息类型',
  `content` text COMMENT '文本内容',
  `group_id` int(10) DEFAULT NULL COMMENT '图文',
  `image_id` int(10) unsigned DEFAULT NULL COMMENT '上传图片',
  `manager_id` int(10) DEFAULT NULL COMMENT '管理员ID',
  `token` varchar(50) DEFAULT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_auto_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_business_card`
-- ----------------------------
DROP TABLE IF EXISTS `wp_business_card`;
CREATE TABLE `wp_business_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `truename` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `position` varchar(50) DEFAULT NULL COMMENT '职位头衔',
  `mobile` varchar(30) DEFAULT NULL COMMENT '手机',
  `company` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `department` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `service` text COMMENT '产品服务',
  `company_url` varchar(255) DEFAULT NULL COMMENT '公司网址',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `telephone` varchar(30) DEFAULT NULL COMMENT '座机',
  `Email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信号',
  `qq` varchar(30) DEFAULT NULL COMMENT 'QQ号',
  `weibo` varchar(255) DEFAULT NULL COMMENT '微博',
  `tag` varchar(255) DEFAULT NULL COMMENT '人物标签',
  `wishing` varchar(100) DEFAULT NULL COMMENT '希望结交',
  `interest` varchar(255) DEFAULT NULL COMMENT '兴趣',
  `personal_url` varchar(255) DEFAULT NULL COMMENT '个人主页',
  `intro` text COMMENT '个人介绍',
  `headface` int(10) unsigned DEFAULT NULL COMMENT '头像',
  `permission` char(50) DEFAULT '1' COMMENT '权限设置',
  `template` varchar(50) DEFAULT NULL COMMENT '选择的模板',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_business_card
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_business_card_collect`
-- ----------------------------
DROP TABLE IF EXISTS `wp_business_card_collect`;
CREATE TABLE `wp_business_card_collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `from_uid` int(10) DEFAULT NULL COMMENT '收藏人ID',
  `to_uid` int(10) DEFAULT NULL COMMENT '被收藏人的ID',
  `cTime` int(10) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_business_card_collect
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_card_vouchers`
-- ----------------------------
DROP TABLE IF EXISTS `wp_card_vouchers`;
CREATE TABLE `wp_card_vouchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text COMMENT '活动介绍',
  `code` text COMMENT '卡券code码',
  `appsecre` varchar(255) NOT NULL COMMENT '开通卡券的商家公众号密钥',
  `openid` text COMMENT 'OpenID',
  `card_id` varchar(100) NOT NULL COMMENT '卡券ID',
  `balance` varchar(30) DEFAULT NULL COMMENT '红包余额',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '素材封面',
  `background` int(10) unsigned DEFAULT NULL COMMENT '背景图',
  `title` varchar(255) DEFAULT '卡券' COMMENT '卡券标题',
  `button_color` varchar(255) DEFAULT '#0dbd02' COMMENT '领取按钮颜色',
  `head_bg_color` varchar(255) DEFAULT '#35a2dd' COMMENT '头部背景颜色',
  `shop_logo` int(10) unsigned DEFAULT NULL COMMENT '商家LOGO',
  `shop_name` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `more_button` text COMMENT '添加更多按钮',
  `template` varchar(255) DEFAULT 'default' COMMENT '素材模板',
  `uid` int(10) DEFAULT NULL COMMENT 'uid',
  `token` varchar(50) DEFAULT NULL COMMENT 'token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_card_vouchers
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_channel`
-- ----------------------------
DROP TABLE IF EXISTS `wp_channel`;
CREATE TABLE `wp_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_channel
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_comment`
-- ----------------------------
DROP TABLE IF EXISTS `wp_comment`;
CREATE TABLE `wp_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `follow_id` int(10) DEFAULT NULL COMMENT 'follow_id',
  `content` text COMMENT '评论内容',
  `cTime` int(10) DEFAULT NULL COMMENT '评论时间',
  `aim_id` int(10) DEFAULT NULL COMMENT '评论关联ID',
  `aim_table` varchar(30) DEFAULT NULL COMMENT '评论关联数据表',
  `is_audit` tinyint(2) DEFAULT '0' COMMENT '是否审核',
  `uid` int(10) DEFAULT NULL COMMENT 'uid',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_common_category`
-- ----------------------------
DROP TABLE IF EXISTS `wp_common_category`;
CREATE TABLE `wp_common_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '分类标识',
  `title` varchar(255) NOT NULL COMMENT '分类标题',
  `icon` int(10) unsigned DEFAULT NULL COMMENT '分类图标',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '上一级分类',
  `path` varchar(255) DEFAULT NULL COMMENT '分类路径',
  `module` varchar(255) DEFAULT NULL COMMENT '分类所属功能',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序号',
  `is_show` tinyint(2) DEFAULT '1' COMMENT '是否显示',
  `intro` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `code` varchar(255) DEFAULT NULL COMMENT '分类扩展编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_common_category
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_common_category_group`
-- ----------------------------
DROP TABLE IF EXISTS `wp_common_category_group`;
CREATE TABLE `wp_common_category_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '分组标识',
  `title` varchar(255) NOT NULL COMMENT '分组标题',
  `cTime` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  `level` tinyint(1) unsigned DEFAULT '3' COMMENT '最多级数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_common_category_group
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_config`
-- ----------------------------
DROP TABLE IF EXISTS `wp_config`;
CREATE TABLE `wp_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`) 
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of wp_config
-- ----------------------------
INSERT INTO `wp_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1430825115', '1', 'weiphp3.0', '0');
INSERT INTO `wp_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'weiphp是互联网+的IT综合解决方案', '1');
INSERT INTO `wp_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'weiphp,互联网+,微信开源开发框架', '8');
INSERT INTO `wp_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭\r\n1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1406859591', '1', '1', '1');
INSERT INTO `wp_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `wp_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `wp_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `wp_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `wp_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `wp_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n3:用户\r\n4:系统\r\n5:站点', '4');
INSERT INTO `wp_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `wp_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `wp_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `wp_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `wp_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '4', '', '后台数据每页显示记录数', '1379503896', '1391938052', '1', '20', '10');
INSERT INTO `wp_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '0');
INSERT INTO `wp_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `wp_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `wp_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `wp_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `wp_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `wp_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1440555973', '1', '0', '0');
INSERT INTO `wp_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname', '0');
INSERT INTO `wp_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `wp_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '20', '0');
INSERT INTO `wp_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `wp_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');
INSERT INTO `wp_config` VALUES ('38', 'WEB_SITE_VERIFY', '4', '登录验证码', '1', '0:关闭\r\n1:开启', '登录时是否需要验证码', '1378898976', '1406859544', '1', '1', '2');
INSERT INTO `wp_config` VALUES ('42', 'ACCESS', '2', '未登录时可访问的页面', '4', '', '不区分大小写', '1390656601', '1390664079', '1', 'Home/User/*\r\nHome/Index/*\r\nhome/weixin/*\r\nadmin/File/*\r\nhome/File/*\r\nhome/Forum/*\r\nHome/Material/detail', '0');
INSERT INTO `wp_config` VALUES ('44', 'DEFAULT_PUBLIC_GROUP_ID', '0', '公众号默认等级ID', '3', '', '前台新增加的公众号的默认等级，值为0表示不做权限控制，公众号拥有全部插件的权限', '1393759885', '1393759981', '1', '0', '2');
INSERT INTO `wp_config` VALUES ('45', 'SYSTEM_UPDATE_REMIND', '4', '系统升级提醒', '4', '0:关闭\r\n1:开启', '开启后官方有新升级信息会及时在后台的网站设置页面头部显示升级提醒', '1393764263', '1393764263', '1', '0', '5');
INSERT INTO `wp_config` VALUES ('46', 'SYSTEM_UPDATRE_VERSION', '0', '系统升级最新版本号', '4', '', '记录当前系统的版本号，这是与官方比较是否有升级包的唯一标识，不熟悉者只勿改变其数值', '1393764702', '1394337646', '1', '20150826', '0');
INSERT INTO `wp_config` VALUES ('47', 'FOLLOW_YOUKE_UID', '0', '粉丝游客ID', '0', '', '', '1398927704', '1398927704', '1', '-11874', '0');
INSERT INTO `wp_config` VALUES ('48', 'DEFAULT_PUBLIC', '0', '注册后默认可管理的公众号ID', '3', '', '可为空。配置用户注册后即可管理的公众号ID，多个时用英文逗号分割', '1398928794', '1398929088', '1', '', '3');
INSERT INTO `wp_config` VALUES ('49', 'DEFAULT_PUBLIC_CREATE_MAX_NUMB', '0', '默认用户最多可创建的公众号数', '3', '', '注册用户最多的创建数，也可以在用户管理里对每个用户设置不同的值', '1398949652', '1398950115', '1', '5', '4');
INSERT INTO `wp_config` VALUES ('50', 'COPYRIGHT', '1', '版权信息', '1', '', '', '1401018910', '1401018910', '1', '版权由WeiPHP团队所有', '3');
INSERT INTO `wp_config` VALUES ('51', 'WEIPHP_STORE_LICENSE', '1', '应用商店授权许可证', '1', '', '要与 应用商店》网站信息 里的授权许可证保持一致', '1402972720', '1402977473', '1', '', '0');
INSERT INTO `wp_config` VALUES ('52', 'SYSTEM_LOGO', '1', '网站LOGO', '5', '', '填写LOGO的网址，为空时默认显示weiphp的logo', '1403566699', '1403566746', '1', '', '0');
INSERT INTO `wp_config` VALUES ('53', 'SYSTEM_CLOSE_REGISTER', '4', '前台注册开关', '5', '0:不关闭\r\n1:关闭', '关闭后在登录页面不再显示注册链接', '1403568006', '1403568006', '1', '0', '0');
INSERT INTO `wp_config` VALUES ('54', 'SYSTEM_CLOSE_ADMIN', '4', '后台管理开关', '5', '0:不关闭\r\n1:关闭', '关闭后在登录页面不再显示后台登录链接', '1403568006', '1403568006', '1', '0', '0');
INSERT INTO `wp_config` VALUES ('55', 'SYSTEM_CLOSE_WIKI', '4', '二次开发开关', '5', '0:不关闭\r\n1:关闭', '关闭后在登录页面不再显示二次开发链接', '1403568006', '1403568006', '1', '0', '0');
INSERT INTO `wp_config` VALUES ('56', 'SYSTEM_CLOSE_BBS', '4', '官方论坛开关', '5', '0:不关闭\r\n1:关闭', '关闭后在登录页面不再显示官方论坛链接', '1403568006', '1403568006', '1', '0', '0');
INSERT INTO `wp_config` VALUES ('57', 'LOGIN_BACKGROUP', '1', '登录界面背景图', '5', '', '请输入图片网址，为空时默认使用自带的背景图', '1403568006', '1403570059', '1', '', '0');
INSERT INTO `wp_config` VALUES ('60', 'TONGJI_CODE', '2', '第三方统计JS代码', '5', '', '', '1428634717', '1428634717', '1', '', '0');
INSERT INTO `wp_config` VALUES ('61', 'SENSITIVE_WORDS', '1', '敏感词', '0', '', '当出现有敏感词的地方，会用*号代替, (多个敏感词用 , 隔开 )', '1433125977', '1435062628', '1', 'bitch,shit', '0');
INSERT INTO `wp_config` VALUES ('62', 'REG_AUDIT', '4', '注册审核', '3', '0:需要审核\r\n1:不需要审核', '', '1439811099', '1439811099', '1', '1', '1');

-- ----------------------------
-- Table structure for `wp_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `wp_coupon`;
CREATE TABLE `wp_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键词',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '封面简介',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '优惠券图片',
  `cTime` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `start_time` int(10) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(10) DEFAULT NULL COMMENT '领取结束时间',
  `use_tips` text COMMENT '使用说明',
  `end_tips` text COMMENT '领取结束说明',
  `num` int(10) unsigned DEFAULT '0' COMMENT '优惠券数量',
  `max_num` int(10) unsigned DEFAULT '1' COMMENT '每人最多允许获取次数',
  `follower_condtion` char(50) DEFAULT '1' COMMENT '粉丝状态',
  `credit_conditon` int(10) unsigned DEFAULT '0' COMMENT '积分限制',
  `credit_bug` int(10) unsigned DEFAULT '0' COMMENT '积分消费',
  `addon_condition` varchar(255) DEFAULT NULL COMMENT '插件场景限制',
  `collect_count` int(10) unsigned DEFAULT '0' COMMENT '已领取数',
  `view_count` int(10) unsigned DEFAULT '0' COMMENT '浏览人数',
  `end_img` int(10) unsigned DEFAULT NULL COMMENT '领取结束提示图片',
  `addon` char(50) DEFAULT 'public' COMMENT '插件',
  `shop_uid` varchar(255) DEFAULT NULL COMMENT '商家管理员ID',
  `use_count` int(10) DEFAULT '0' COMMENT '已使用数',
  `pay_password` varchar(255) DEFAULT NULL COMMENT '核销密码',
  `empty_prize_tips` varchar(255) DEFAULT NULL COMMENT '奖品抽完后的提示',
  `background` int(10) unsigned DEFAULT NULL COMMENT '素材背景图',
  `start_tips` varchar(255) DEFAULT NULL COMMENT '活动还没开始时的提示语',
  `more_button` text COMMENT '其它按钮',
  `over_time` int(10) DEFAULT NULL COMMENT '使用的截止时间',
  `use_start_time` int(10) DEFAULT NULL COMMENT '使用开始时间',
  `shop_name` varchar(255) DEFAULT '优惠商家' COMMENT '商家名称',
  `shop_logo` int(10) unsigned DEFAULT NULL COMMENT '商家LOGO',
  `head_bg_color` varchar(255) DEFAULT '#35a2dd' COMMENT '头部背景颜色',
  `button_color` varchar(255) DEFAULT '#0dbd02' COMMENT '按钮颜色',
  `template` varchar(255) DEFAULT 'default' COMMENT '素材模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_coupon_shop`
-- ----------------------------
DROP TABLE IF EXISTS `wp_coupon_shop`;
CREATE TABLE `wp_coupon_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '店名',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `phone` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `gps` varchar(50) DEFAULT NULL COMMENT 'GPS经纬度',
  `coupon_id` int(10) DEFAULT NULL COMMENT '所属优惠券编号',
  `token` varchar(255) DEFAULT NULL COMMENT 'token',
  `manager_id` int(10) DEFAULT NULL COMMENT '管理员id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_coupon_shop
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_coupon_shop_link`
-- ----------------------------
DROP TABLE IF EXISTS `wp_coupon_shop_link`;
CREATE TABLE `wp_coupon_shop_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `coupon_id` int(10) DEFAULT NULL COMMENT 'coupon_id',
  `shop_id` int(10) DEFAULT NULL COMMENT 'shop_id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_coupon_shop_link
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_credit_config`
-- ----------------------------
DROP TABLE IF EXISTS `wp_credit_config`;
CREATE TABLE `wp_credit_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '积分描述',
  `name` varchar(50) DEFAULT NULL COMMENT '积分标识',
  `mTime` int(10) DEFAULT NULL COMMENT '修改时间',
  `experience` int(10) DEFAULT '0' COMMENT '体力值',
  `score` int(10) DEFAULT '0' COMMENT '积分值',
  `token` varchar(255) DEFAULT '0' COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_credit_config
-- ----------------------------
INSERT INTO `wp_credit_config` VALUES ('1', '关注公众号', 'subscribe', '1438587911', '100', '100', '0');
INSERT INTO `wp_credit_config` VALUES ('2', '取消关注公众号', 'unsubscribe', '1438596459', '-100', '-100', '0');
INSERT INTO `wp_credit_config` VALUES ('3', '参与投票', 'vote', '1398565597', '0', '0', '0');
INSERT INTO `wp_credit_config` VALUES ('4', '参与调研', 'survey', '1398565640', '0', '0', '0');
INSERT INTO `wp_credit_config` VALUES ('5', '参与考试', 'exam', '1398565659', '0', '0', '0');
INSERT INTO `wp_credit_config` VALUES ('6', '参与测试', 'test', '1398565681', '0', '0', '0');
INSERT INTO `wp_credit_config` VALUES ('7', '微信聊天', 'chat', '1398565740', '0', '0', '0');
INSERT INTO `wp_credit_config` VALUES ('8', '建议意见反馈', 'suggestions', '1398565798', '0', '0', '0');
INSERT INTO `wp_credit_config` VALUES ('9', '会员卡绑定', 'card_bind', '1438596438', '0', '0', '0');
INSERT INTO `wp_credit_config` VALUES ('10', '获取优惠卷', 'coupons', '1398565926', '0', '0', '0');
INSERT INTO `wp_credit_config` VALUES ('11', '访问微网站', 'weisite', '1398565973', '0', '0', '0');
INSERT INTO `wp_credit_config` VALUES ('12', '查看自定义回复内容', 'custom_reply', '1398566068', '0', '0', '0');
INSERT INTO `wp_credit_config` VALUES ('13', '填写通用表单', 'forms', '1398566118', '0', '0', '0');
INSERT INTO `wp_credit_config` VALUES ('14', '访问微商店', 'shop', '1398566206', '0', '0', '0');

-- ----------------------------
-- Table structure for `wp_credit_data`
-- ----------------------------
DROP TABLE IF EXISTS `wp_credit_data`;
CREATE TABLE `wp_credit_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT '0' COMMENT '用户ID',
  `credit_name` varchar(50) DEFAULT NULL COMMENT '积分标识',
  `experience` int(10) DEFAULT '0' COMMENT '体力值',
  `score` int(10) DEFAULT '0' COMMENT '积分值',
  `cTime` int(10) DEFAULT NULL COMMENT '记录时间',
  `admin_uid` int(10) DEFAULT '0' COMMENT '操作者UID',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_credit_data
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_custom_menu`
-- ----------------------------
DROP TABLE IF EXISTS `wp_custom_menu`;
CREATE TABLE `wp_custom_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(255) DEFAULT NULL COMMENT '关联URL',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关联关键词',
  `title` varchar(50) NOT NULL COMMENT '菜单名',
  `pid` int(10) DEFAULT '0' COMMENT '一级菜单',
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序号',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `type` varchar(30) DEFAULT 'click' COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_custom_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_custom_reply_mult`
-- ----------------------------
DROP TABLE IF EXISTS `wp_custom_reply_mult`;
CREATE TABLE `wp_custom_reply_mult` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) DEFAULT '0' COMMENT '关键词类型',
  `mult_ids` varchar(255) DEFAULT NULL COMMENT '多图文ID',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_custom_reply_mult
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_custom_reply_news`
-- ----------------------------
DROP TABLE IF EXISTS `wp_custom_reply_news`;
CREATE TABLE `wp_custom_reply_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) DEFAULT NULL COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '简介',
  `cate_id` int(10) unsigned DEFAULT '0' COMMENT '所属类别',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '封面图片',
  `content` text COMMENT '内容',
  `cTime` int(10) DEFAULT NULL COMMENT '发布时间',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序号',
  `view_count` int(10) unsigned DEFAULT '0' COMMENT '浏览数',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `jump_url` varchar(255) DEFAULT NULL COMMENT '外链',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_custom_reply_news
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_custom_reply_text`
-- ----------------------------
DROP TABLE IF EXISTS `wp_custom_reply_text`;
CREATE TABLE `wp_custom_reply_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) DEFAULT '0' COMMENT '关键词类型',
  `content` text COMMENT '回复内容',
  `view_count` int(10) unsigned DEFAULT '0' COMMENT '浏览数',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序号',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_custom_reply_text
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_draw_follow_log`
-- ----------------------------
DROP TABLE IF EXISTS `wp_draw_follow_log`;
CREATE TABLE `wp_draw_follow_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `follow_id` int(10) DEFAULT NULL COMMENT '粉丝id',
  `sports_id` int(10) DEFAULT NULL COMMENT '场次id',
  `count` int(10) DEFAULT '0' COMMENT '抽奖次数',
  `cTime` int(10) DEFAULT NULL COMMENT '支持时间',
  `uid` int(10) DEFAULT NULL COMMENT 'uid',
  PRIMARY KEY (`id`),
  KEY `sports_id` (`sports_id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_draw_follow_log
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_file`
-- ----------------------------
DROP TABLE IF EXISTS `wp_file`;
CREATE TABLE `wp_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of wp_file
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_forms`
-- ----------------------------
DROP TABLE IF EXISTS `wp_forms`;
CREATE TABLE `wp_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `finish_tip` text COMMENT '用户提交后提示内容',
  `cTime` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `password` varchar(255) DEFAULT NULL COMMENT '表单密码',
  `keyword_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '封面简介',
  `mTime` int(10) DEFAULT NULL COMMENT '修改时间',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '封面图片',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `can_edit` tinyint(2) DEFAULT '0' COMMENT '是否允许编辑',
  `content` text COMMENT '详细介绍',
  `jump_url` varchar(255) DEFAULT NULL COMMENT '提交后跳转的地址',
  `template` varchar(255) DEFAULT 'default' COMMENT '模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_forms
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_forms_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `wp_forms_attribute`;
CREATE TABLE `wp_forms_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` char(50) NOT NULL DEFAULT 'string' COMMENT '字段类型',
  `title` varchar(255) NOT NULL COMMENT '字段标题',
  `mTime` int(10) DEFAULT NULL COMMENT '修改时间',
  `extra` text COMMENT '参数',
  `value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `name` varchar(100) NOT NULL COMMENT '字段名',
  `remark` varchar(255) DEFAULT NULL COMMENT '字段备注',
  `is_must` tinyint(2) DEFAULT NULL COMMENT '是否必填',
  `validate_rule` varchar(255) DEFAULT NULL COMMENT '正则验证',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序号',
  `error_info` varchar(255) DEFAULT NULL COMMENT '出错提示',
  `forms_id` int(10) unsigned DEFAULT NULL COMMENT '表单ID',
  `is_show` tinyint(2) DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_forms_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_forms_value`
-- ----------------------------
DROP TABLE IF EXISTS `wp_forms_value`;
CREATE TABLE `wp_forms_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `openid` varchar(255) DEFAULT NULL COMMENT 'OpenId',
  `forms_id` int(10) unsigned DEFAULT NULL COMMENT '表单ID',
  `value` text COMMENT '表单值',
  `cTime` int(10) DEFAULT NULL COMMENT '增加时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_forms_value
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_forum`
-- ----------------------------
DROP TABLE IF EXISTS `wp_forum`;
CREATE TABLE `wp_forum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `uid` int(10) DEFAULT '0' COMMENT '用户ID',
  `content` text COMMENT '内容',
  `cTime` int(10) DEFAULT NULL COMMENT '发布时间',
  `attach` varchar(255) DEFAULT NULL COMMENT '附件',
  `is_top` int(10) DEFAULT '0' COMMENT '置顶',
  `cid` tinyint(4) DEFAULT NULL COMMENT '分类',
  `view_count` int(11) unsigned DEFAULT '0' COMMENT '浏览数',
  `reply_count` int(11) unsigned DEFAULT '0' COMMENT '回复数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_forum
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_guess`
-- ----------------------------
DROP TABLE IF EXISTS `wp_guess`;
CREATE TABLE `wp_guess` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '竞猜标题',
  `desc` text COMMENT '活动说明',
  `start_time` int(10) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(10) DEFAULT NULL COMMENT '结束时间',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `guess_count` int(10) unsigned DEFAULT '0',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `template` varchar(255) DEFAULT 'default' COMMENT '素材模板',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '主题图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_guess
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_guess_log`
-- ----------------------------
DROP TABLE IF EXISTS `wp_guess_log`;
CREATE TABLE `wp_guess_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(10) unsigned DEFAULT '0' COMMENT '用户ID',
  `guess_id` int(10) unsigned DEFAULT '0' COMMENT '竞猜Id',
  `token` varchar(255) DEFAULT NULL COMMENT '用户token',
  `optionIds` varchar(255) DEFAULT NULL COMMENT '用户猜的选项IDs',
  `cTime` int(10) DEFAULT NULL COMMENT '创时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_guess_log
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_guess_option`
-- ----------------------------
DROP TABLE IF EXISTS `wp_guess_option`;
CREATE TABLE `wp_guess_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `guess_id` int(10) DEFAULT '0' COMMENT '竞猜活动的Id',
  `name` varchar(255) DEFAULT NULL COMMENT '选项名称',
  `image` int(10) unsigned DEFAULT NULL COMMENT '选项图片',
  `order` int(10) DEFAULT '0' COMMENT '选项顺序',
  `guess_count` int(10) unsigned DEFAULT '0' COMMENT '竞猜人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_guess_option
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `wp_hooks`;
CREATE TABLE `wp_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `搜索索引` (`name`) 
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='插件钩子表';

-- ----------------------------
-- Records of wp_hooks
-- ----------------------------
INSERT INTO `wp_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `wp_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `wp_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', '');
INSERT INTO `wp_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'SocialComment');
INSERT INTO `wp_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `wp_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', '');
INSERT INTO `wp_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `wp_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `wp_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `wp_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `wp_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');
INSERT INTO `wp_hooks` VALUES ('17', 'weixin', '微信插件必须加载的钩子', '1', '1388810858', 'Vote,Wecome,UserCenter,WeiSite,Hitegg,Leaflets,Xydzp,CustomReply,Survey,Diy,CustomMenu,Coupon,Scratch,Invite,Game,Ask,Forms,CardVouchers,RedBag,Guess,WishCard,RealPrize,ConfigureAccount,PublicBind,BusinessCard,AutoReply,Payment');
INSERT INTO `wp_hooks` VALUES ('18', 'cascade', '级联菜单', '1', '1398694587', 'Cascade');
INSERT INTO `wp_hooks` VALUES ('19', 'page_diy', '万能页面的钩子', '1', '1399040364', 'Diy');
INSERT INTO `wp_hooks` VALUES ('20', 'dynamic_select', '动态下拉菜单', '1', '1435223189', 'DynamicSelect');
INSERT INTO `wp_hooks` VALUES ('21', 'news', '图文素材选择', '1', '1439196828', 'News');

-- ----------------------------
-- Table structure for `wp_import`
-- ----------------------------
DROP TABLE IF EXISTS `wp_import`;
CREATE TABLE `wp_import` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `attach` int(10) unsigned NOT NULL COMMENT '上传文件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_import
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_invite`
-- ----------------------------
DROP TABLE IF EXISTS `wp_invite`;
CREATE TABLE `wp_invite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '封面简介',
  `mTime` int(10) DEFAULT NULL COMMENT '修改时间',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `experience` int(10) DEFAULT '0' COMMENT '消耗体力值',
  `num` int(10) DEFAULT '0' COMMENT '邀请人数',
  `coupon_id` int(10) DEFAULT NULL COMMENT '优惠券编号',
  `coupon_num` int(10) DEFAULT '0' COMMENT '优惠券数',
  `receive_num` int(10) DEFAULT '0' COMMENT '已领取优惠券数',
  `content` text COMMENT '邀约介绍',
  `template` varchar(255) DEFAULT 'default' COMMENT '模板名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_invite
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_invite_code`
-- ----------------------------
DROP TABLE IF EXISTS `wp_invite_code`;
CREATE TABLE `wp_invite_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=440 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_invite_code
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_invite_user`
-- ----------------------------
DROP TABLE IF EXISTS `wp_invite_user`;
CREATE TABLE `wp_invite_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `invite_id` int(10) DEFAULT NULL COMMENT '邀约ID',
  `invite_num` int(10) DEFAULT '0' COMMENT '已邀请人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_invite_user
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_join_count`
-- ----------------------------
DROP TABLE IF EXISTS `wp_join_count`;
CREATE TABLE `wp_join_count` (
  `follow_id` int(10) DEFAULT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aim_id` int(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fid_aim` (`follow_id`,`aim_id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_join_count
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `wp_keyword`;
CREATE TABLE `wp_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  `addon` varchar(255) NOT NULL COMMENT '关键词所属插件',
  `aim_id` int(10) unsigned NOT NULL COMMENT '插件表里的ID值',
  `cTime` int(10) DEFAULT NULL COMMENT '创建时间',
  `keyword_length` int(10) unsigned DEFAULT '0' COMMENT '关键词长度',
  `keyword_type` tinyint(2) DEFAULT '0' COMMENT '匹配类型',
  `extra_text` text COMMENT '文本扩展',
  `extra_int` int(10) DEFAULT NULL COMMENT '数字扩展',
  `request_count` int(10) DEFAULT '0' COMMENT '请求数',
  PRIMARY KEY (`id`),
  KEY `keyword_token` (`keyword`,`token`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_lottery_prize_list`
-- ----------------------------
DROP TABLE IF EXISTS `wp_lottery_prize_list`;
CREATE TABLE `wp_lottery_prize_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sports_id` int(10) DEFAULT NULL COMMENT '活动编号',
  `award_id` varchar(255) DEFAULT NULL COMMENT '奖品编号',
  `award_num` int(10) DEFAULT NULL COMMENT '奖品数量',
  `uid` int(10) DEFAULT NULL COMMENT 'uid',
  PRIMARY KEY (`id`),
  KEY `sports_id` (`sports_id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_lottery_prize_list
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_lucky_follow`
-- ----------------------------
DROP TABLE IF EXISTS `wp_lucky_follow`;
CREATE TABLE `wp_lucky_follow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `draw_id` int(10) DEFAULT NULL COMMENT '活动编号',
  `sport_id` int(10) DEFAULT NULL COMMENT '场次编号',
  `award_id` int(10) DEFAULT NULL COMMENT '奖品编号',
  `follow_id` int(10) DEFAULT NULL COMMENT '粉丝id',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `num` int(10) DEFAULT '0' COMMENT '获奖数',
  `state` tinyint(2) DEFAULT '0' COMMENT '兑奖状态',
  `zjtime` int(10) DEFAULT NULL COMMENT '中奖时间',
  `djtime` int(10) DEFAULT NULL COMMENT '兑奖时间',
  `uid` int(10) DEFAULT NULL COMMENT 'uid',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_lucky_follow
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_manager`
-- ----------------------------
DROP TABLE IF EXISTS `wp_manager`;
CREATE TABLE `wp_manager` (
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `has_public` tinyint(2) DEFAULT '0' COMMENT '是否配置公众号',
  `headface_url` int(10) unsigned DEFAULT NULL COMMENT '管理员头像',
  `GammaAppId` varchar(30) DEFAULT NULL COMMENT '摇电视的AppId',
  `GammaSecret` varchar(100) DEFAULT NULL COMMENT '摇电视的Secret',
  `copy_right` varchar(255) DEFAULT NULL COMMENT '授权信息',
  `tongji_code` text COMMENT '统计代码',
  `website_logo` int(10) unsigned DEFAULT NULL COMMENT '网站LOGO',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_manager
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_manager_menu`
-- ----------------------------
DROP TABLE IF EXISTS `wp_manager_menu`;
CREATE TABLE `wp_manager_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_type` tinyint(2) DEFAULT '0' COMMENT '菜单类型',
  `pid` varchar(50) DEFAULT '0' COMMENT '上级菜单',
  `title` varchar(50) DEFAULT NULL COMMENT '菜单名',
  `url_type` tinyint(2) DEFAULT '0' COMMENT '链接类型',
  `addon_name` varchar(30) DEFAULT NULL COMMENT '插件名',
  `url` varchar(255) DEFAULT NULL COMMENT '外链',
  `target` char(50) DEFAULT '_self' COMMENT '打开方式',
  `is_hide` tinyint(2) DEFAULT '0' COMMENT '是否隐藏',
  `sort` int(10) DEFAULT '0' COMMENT '排序号',
  `uid` int(10) DEFAULT NULL COMMENT '管理员ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_manager_menu
-- ----------------------------
INSERT INTO `wp_manager_menu` VALUES ('1', '0', '', '首页', '1', '', 'home/index/main', '_self', '0', '0', '1');
INSERT INTO `wp_manager_menu` VALUES ('2', '0', '', '应用商城', '1', '', 'http://idouly.com/?cat=2', '_blank', '0', '0', '1');
INSERT INTO `wp_manager_menu` VALUES ('3', '0', '', '开发交流', '1', '', 'http://idouly.com/?cat=3', '_blank', '0', '0', '1');
INSERT INTO `wp_manager_menu` VALUES ('4', '0', '', '问答社区', '1', '', 'http://idouly.com/wenda/?', '_blank', '0', '0', '1');

-- ----------------------------
-- Table structure for `wp_material_image`
-- ----------------------------
DROP TABLE IF EXISTS `wp_material_image`;
CREATE TABLE `wp_material_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cover_id` int(10) DEFAULT NULL COMMENT '图片在本地的ID',
  `cover_url` varchar(255) DEFAULT NULL COMMENT '本地URL',
  `media_id` varchar(100) DEFAULT '0' COMMENT '微信端图文消息素材的media_id',
  `wechat_url` varchar(255) DEFAULT NULL COMMENT '微信端的图片地址',
  `cTime` int(10) DEFAULT NULL COMMENT '创建时间',
  `manager_id` int(10) DEFAULT NULL COMMENT '管理员ID',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_material_image
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_material_news`
-- ----------------------------
DROP TABLE IF EXISTS `wp_material_news`;
CREATE TABLE `wp_material_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `author` varchar(30) DEFAULT NULL COMMENT '作者',
  `cover_id` int(10) unsigned DEFAULT NULL COMMENT '封面',
  `intro` varchar(255) DEFAULT NULL COMMENT '摘要',
  `content` longtext COMMENT '内容',
  `link` varchar(255) DEFAULT NULL COMMENT '外链',
  `group_id` int(10) DEFAULT '0' COMMENT '多图文组的ID',
  `thumb_media_id` varchar(100) DEFAULT NULL COMMENT '图文消息的封面图片素材id（必须是永久mediaID）',
  `media_id` varchar(100) DEFAULT '0' COMMENT '微信端图文消息素材的media_id',
  `manager_id` int(10) DEFAULT NULL COMMENT '管理员ID',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  `cTime` int(10) DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_material_news
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_menu`
-- ----------------------------
DROP TABLE IF EXISTS `wp_menu`;
CREATE TABLE `wp_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COMMENT='后台导航数据表';

-- ----------------------------
-- Records of wp_menu
-- ----------------------------
INSERT INTO `wp_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('16', '用户', '0', '2', 'User/index', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `wp_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `wp_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0');
INSERT INTO `wp_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `wp_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `wp_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `wp_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `wp_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `wp_menu` VALUES ('27', '用户组管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0');
INSERT INTO `wp_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `wp_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `wp_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `wp_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `wp_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `wp_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `wp_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `wp_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `wp_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `wp_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `wp_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `wp_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `wp_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `wp_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `wp_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `wp_menu` VALUES ('43', '插件管理', '0', '7', 'Addons/index', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('44', '插件管理', '43', '1', 'Admin/Plugin/index', '0', '', '扩展', '0');
INSERT INTO `wp_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `wp_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `wp_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `wp_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `wp_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `wp_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `wp_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `wp_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `wp_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `wp_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `wp_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `wp_menu` VALUES ('57', '钩子管理', '43', '3', 'Addons/hooks', '0', '', '扩展', '1');
INSERT INTO `wp_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0');
INSERT INTO `wp_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('68', '系统', '0', '1', 'Config/group', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `wp_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '1');
INSERT INTO `wp_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `wp_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `wp_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `wp_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `wp_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '1');
INSERT INTO `wp_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '1', '', '系统设置', '0');
INSERT INTO `wp_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('146', '权限节点', '16', '0', 'Admin/Rule/index', '0', '', '用户管理', '1');
INSERT INTO `wp_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `wp_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `wp_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `wp_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `wp_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `wp_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0');
INSERT INTO `wp_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `wp_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `wp_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `wp_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0');
INSERT INTO `wp_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `wp_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `wp_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `wp_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO `wp_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('124', '微信插件', '43', '0', 'Admin/Addons/index', '0', '', '扩展', '0');
INSERT INTO `wp_menu` VALUES ('126', '公众号等级', '16', '0', 'admin/PublicGroup/PublicGroup', '0', '', '公众号管理', '0');
INSERT INTO `wp_menu` VALUES ('127', '公众号管理', '16', '1', 'admin/PublicGroup/PublicAdmin', '0', '', '公众号管理', '0');
INSERT INTO `wp_menu` VALUES ('128', '在线升级', '68', '5', 'Admin/Update/index', '0', '', '系统设置', '0');
INSERT INTO `wp_menu` VALUES ('129', '清除缓存', '68', '10', 'Admin/Update/delcache', '0', '', '系统设置', '0');
INSERT INTO `wp_menu` VALUES ('130', '应用商店', '0', '8', 'admin/store/index', '0', '', '', '1');
INSERT INTO `wp_menu` VALUES ('131', '素材图标', '130', '2', 'admin/store/index?type=material', '0', '', '应用类型', '0');
INSERT INTO `wp_menu` VALUES ('132', '微站模板', '130', '1', 'admin/store/index?type=template', '0', '', '应用类型', '0');
INSERT INTO `wp_menu` VALUES ('133', '我是开发者', '130', '1', '/index.php?s=/home/developer/myApps', '0', '', '开发者', '0');
INSERT INTO `wp_menu` VALUES ('134', '新手安装指南', '130', '0', 'admin/store/index?type=help', '0', '', '我是站长', '0');
INSERT INTO `wp_menu` VALUES ('135', '万能页面', '130', '3', 'admin/store/index?type=diy', '0', '', '应用类型', '0');
INSERT INTO `wp_menu` VALUES ('136', '上传新应用', '130', '2', '/index.php?s=/home/developer/submitApp', '0', '', '开发者', '0');
INSERT INTO `wp_menu` VALUES ('137', '二次开发教程', '130', '3', '/wiki', '0', '', '开发者', '0');
INSERT INTO `wp_menu` VALUES ('138', '网站信息', '130', '0', 'admin/store/index?type=home', '0', '', '我是站长', '0');
INSERT INTO `wp_menu` VALUES ('139', '充值记录', '130', '0', 'admin/store/index?type=recharge', '0', '', '我是站长', '0');
INSERT INTO `wp_menu` VALUES ('140', '消费记录', '130', '0', 'admin/store/index?type=bug', '0', '', '我是站长', '0');
INSERT INTO `wp_menu` VALUES ('141', '官方交流论坛', '130', '4', '/bbs', '0', '', '开发者', '0');
INSERT INTO `wp_menu` VALUES ('142', '在线充值', '130', '0', 'admin/store/index?type=online_recharge', '0', '', '我是站长', '0');
INSERT INTO `wp_menu` VALUES ('143', '微信插件', '130', '0', 'admin/store/index?type=addon', '0', '', '应用类型', '0');
INSERT INTO `wp_menu` VALUES ('144', '公告管理', '68', '4', 'Notice/lists', '0', '', '系统设置', '0');
INSERT INTO `wp_menu` VALUES ('147', '图文样式编辑', '68', '4', 'ArticleStyle/lists', '0', '', '系统设置', '0');
INSERT INTO `wp_menu` VALUES ('148', '增加', '147', '0', 'ArticleStyle/add', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('149', '分组管理', '147', '0', 'ArticleStyle/group', '0', '', '', '0');
INSERT INTO `wp_menu` VALUES ('150', '微信接口节点', '16', '0', 'Admin/Rule/wechat', '0', '', '用户管理', '1');
INSERT INTO `wp_menu` VALUES ('151', '公众号组管理', '16', '0', 'Admin/AuthManager/wechat', '0', '', '用户管理', '1');
INSERT INTO `wp_menu` VALUES ('152', '积分选项管理', '16', '6', 'Admin/Credit/lists', '0', '', '用户管理', '1');

-- ----------------------------
-- Table structure for `wp_message`
-- ----------------------------
DROP TABLE IF EXISTS `wp_message`;
CREATE TABLE `wp_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bind_keyword` varchar(50) DEFAULT NULL COMMENT '关联关键词',
  `preview_openids` text COMMENT '预览人OPENID',
  `group_id` int(10) DEFAULT '0' COMMENT '群发对象',
  `type` tinyint(2) DEFAULT '0' COMMENT '素材来源',
  `media_id` varchar(100) DEFAULT NULL COMMENT '微信素材ID',
  `send_type` tinyint(1) DEFAULT '0' COMMENT '发送方式',
  `send_openids` text COMMENT '要发送的OpenID',
  `msg_id` varchar(255) DEFAULT NULL COMMENT 'msg_id',
  `content` text COMMENT '文本消息内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_message
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_model`
-- ----------------------------
DROP TABLE IF EXISTS `wp_model`;
CREATE TABLE `wp_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) 
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='系统模型表';

-- ----------------------------
-- Records of wp_model
-- ----------------------------
INSERT INTO `wp_model` VALUES ('1', 'user', '用户信息表', '0', '', '0', '', '1:基础', '', '', '', '', 'headimgurl|url_img_html:头像\r\nnickname|deal_emoji:用户昵称\r\nsex|get_name_by_status:性别\r\ngroup:分组\r\nscore:金币值\r\nexperience:经历值\r\nids:操作:detail?uid=[uid]|详细资料,[EDIT]|编辑', '20', '', '', '1436929111', '1437469778', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('2', 'manager', '公众号管理员配置', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1436932532', '1436942362', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('3', 'manager_menu', '公众号管理员菜单', '0', '', '1', '[\"menu_type\",\"pid\",\"title\",\"url_type\",\"addon_name\",\"url\",\"target\",\"is_hide\",\"sort\"]', '1:基础', '', '', '', '', 'title:菜单名\r\nmenu_type|get_name_by_status:菜单类型\r\naddon_name:插件名\r\nurl:外链\r\ntarget|get_name_by_status:打开方式\r\nis_hide|get_name_by_status:隐藏\r\nsort:排序号\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', '', '', '1435215960', '1437623073', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('4', 'keyword', '关键词表', '0', '', '1', '[\"keyword\",\"keyword_type\",\"addon\",\"aim_id\",\"keyword_length\",\"cTime\",\"extra_text\",\"extra_int\"]', '1:基础', '', '', '', '', 'id:编号\r\nkeyword:关键词\r\naddon:所属插件\r\naim_id:插件数据ID\r\ncTime|time_format:增加时间\r\nrequest_count|intval:请求数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'keyword', '', '1388815871', '1407251192', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('5', 'qr_code', '二维码表', '0', '', '1', '[\"qr_code\",\"addon\",\"aim_id\",\"cTime\",\"extra_text\",\"extra_int\",\"scene_id\",\"action_name\"]', '1:基础', '', '', '', '', 'scene_id:事件KEY值\r\nqr_code|get_code_img:二维码\r\naction_name|get_name_by_status: 	二维码类型\r\naddon:所属插件\r\naim_id:插件数据ID\r\ncTime|time_format:增加时间\r\nrequest_count|intval:请求数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'qr_code', '', '1388815871', '1406130247', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('6', 'public', '公众号管理', '0', '', '1', '[\"public_name\",\"public_id\",\"wechat\",\"headface_url\",\"type\",\"appid\",\"secret\"]', '1:基础', '', '', '', '', 'id:公众号ID\r\npublic_name:公众号名称\r\ngroup_id|get_public_group_name:等级\r\nheadface_url:公众号头像\r\ntoken:Token\r\nuid:管理员\r\nis_use|get_name_by_status:当前公众号\r\nids:操作:step_0&id=[id]|编辑,[DELETE]|删除,changPublic&id=[id]|切换为当前公众号,help&public_id=[id]|接口配置', '20', 'public_name', '', '1391575109', '1418960233', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('7', 'public_group', '公众号等级', '0', '', '1', '[\"title\",\"addon_status\"]', '1:基础', '', '', '', '', 'id:等级ID\r\ntitle:等级名\r\naddon_status:授权的插件\r\npublic_count:公众号数\r\nids:操作:editPublicGroup&id=[id]|编辑,delPublicGroup&id=[id]|删除', '20', 'title', '', '1393724788', '1393730663', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('8', 'public_link', '公众号与管理员的关联关系', '0', '', '1', '[\"uid\",\"addon_status\"]', '1:基础', '', '', '', '', 'uid|get_nickname|deal_emoji:管理员\r\naddon_status:授权的插件\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', '', '', '1398933192', '1398947067', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('9', 'import', '导入数据', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1407554076', '1407554076', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('10', 'addon_category', '插件分类', '0', '', '1', '[\"icon\",\"title\",\"sort\"]', '1:基础', '', '', '', '', 'icon|get_img_html:分类图标\r\ntitle:分类名\r\nsort:排序号\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1400047655', '1437451028', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('11', 'auto_reply', '自动回复', '0', '', '1', '[\"keyword\",\"content\",\"group_id\",\"image_id\"]', '1:基础', '', '', '', '', 'keyword:关键词\r\ncontent:文件内容\r\ngroup_id:图文\r\nimage_id:图片\r\nids:操作:[EDIT]&type=[msg_type]|编辑,[DELETE]|删除', '10', 'keyword:请输入关键词', '', '1439194522', '1439258843', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('12', 'common_category', '通用分类', '0', '', '1', '[\"pid\",\"title\",\"icon\",\"intro\",\"sort\",\"is_show\"]', '1:基础', '', '', '', '', 'code:编号\r\ntitle:标题\r\nicon|get_img_html:图标\r\nsort:排序号\r\nis_show|get_name_by_status:显示\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1397529095', '1404182789', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('13', 'common_category_group', '通用分类分组', '0', '', '1', '[\"name\",\"title\"]', '1:基础', '', '', '', '', 'name:分组标识\r\ntitle:分组标题\r\nids:操作:cascade?target=_blank&module=[name]|数据管理,[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1396061373', '1403664378', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('14', 'credit_config', '积分配置', '0', '', '1', '[\"name\",\"title\",\"score\",\"experience\"]', '1:基础', '', '', '', '', 'title:积分描述\r\nname:积分标识\r\nexperience:经验值\r\nscore:金币值\r\nids:操作:[EDIT]|配置', '20', 'title', '', '1396061373', '1438591151', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('15', 'credit_data', '用户积分记录', '0', '', '1', '[\"credit_name\",\"uid\",\"experience\",\"score\"]', '1:基础', '', '', '', '', 'uid:用户\r\ncredit_name:积分标识\r\nexperience:经验值\r\nscore:金币值\r\ncTime|time_format:记录时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'uid', '', '1398564291', '1400117739', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('16', 'material_image', '图片素材', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1438684613', '1438684613', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('17', 'material_news', '图文素材', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1438670890', '1438670890', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('18', 'message', '群发消息', '0', '', '1', '[\"type\",\"bind_keyword\",\"media_id\",\"openid\",\"send_type\",\"group_id\",\"send_openids\"]', '1:基础', '', '', '', '', '', '20', '', '', '1437984111', '1438049406', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('19', 'visit_log', '网站访问日志', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1439448351', '1439448351', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('20', 'auth_group', '用户组', '0', '', '1', '[\"title\",\"description\"]', '1:基础', '', '', '', '', 'title:分组名称\r\ndescription:描述\r\nqr_code:二维码\r\nids:操作:export?id=[id]|导出用户,[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1437633503', '1438585502', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('21', 'analysis', '统计分析', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1432806941', '1432806941', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('22', 'article_style', '图文样式', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1436845488', '1436845488', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('23', 'article_style_group', '图文样式分组', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1436845186', '1436845186', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('34', 'custom_menu', '自定义菜单', '0', '', '1', '[\"sort\",\"pid\",\"title\",\"type\",\"keyword\",\"url\"]', '1:基础', '', '', '', '', 'title:10%菜单名\r\nkeyword:10%关联关键词\r\nurl:50%关联URL\r\nsort:5%排序号\r\nid:10%操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1394518309', '1420508982', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('35', 'custom_reply_mult', '多图文配置', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1396602475', '1396602475', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('36', 'custom_reply_news', '图文回复', '0', '', '1', '[\"keyword\",\"keyword_type\",\"title\",\"intro\",\"cate_id\",\"cover\",\"content\",\"sort\"]', '1:基础', '', '', '', '', 'id:5%ID\r\nkeyword:10%关键词\r\nkeyword_type|get_name_by_status:20%关键词类型\r\ntitle:30%标题\r\ncate_id:10%所属分类\r\nsort:7%排序号\r\nview_count:8%浏览数\r\nid:10%操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1396061373', '1401368247', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('37', 'custom_reply_text', '文本回复', '0', '', '1', '[\"keyword\",\"keyword_type\",\"content\",\"sort\"]', '1:基础', '', '', '', '', 'id:ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\nsort:排序号\r\nview_count:浏览数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'keyword', '', '1396578172', '1401017369', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('99', 'weisite_category', '微官网分类', '0', '', '1', '[\"title\",\"icon\",\"url\",\"is_show\",\"sort\",\"pid\"]', '1:基础', '', '', '', '', 'title:15%分类标题\r\nicon|get_img_html:分类图片\r\nurl:30%外链\r\nsort:10%排序号\r\npid:10%一级目录\r\nis_show|get_name_by_status:10%显示\r\nid:10%操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1395987942', '1439522869', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('100', 'weisite_cms', '文章管理', '0', '', '1', '[\"keyword\",\"keyword_type\",\"title\",\"intro\",\"cate_id\",\"cover\",\"content\",\"sort\"]', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncate_id:所属分类\r\nsort:排序号\r\nview_count:浏览数\r\nids:操作:[EDIT]&module_id=[pid]|编辑,[DELETE]|删除', '20', 'title', '', '1396061373', '1408326292', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('101', 'weisite_footer', '底部导航', '0', '', '1', '[\"pid\",\"title\",\"url\",\"sort\"]', '1:基础', '', '', '', '', 'title:菜单名\r\nicon:图标\r\nurl:关联URL\r\nsort:排序号\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1394518309', '1396507698', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('102', 'weisite_slideshow', '幻灯片', '0', '', '1', '[\"title\",\"img\",\"url\",\"is_show\",\"sort\"]', '1:基础', '', '', '', '', 'title:标题\r\nimg:图片\r\nurl:链接地址\r\nis_show|get_name_by_status:显示\r\nsort:排序\r\nids:操作:[EDIT]&module_id=[pid]|编辑,[DELETE]|删除', '20', 'title', '', '1396098264', '1408323347', '1', 'MyISAM');
INSERT INTO `wp_model` VALUES ('103', 'weixin_message', '微信消息管理', '0', '', '1', '', '1:基础', '', '', '', '', 'FromUserName:用户\r\ncontent:内容\r\nCreateTime:时间', '20', '', '', '1438142999', '1438151555', '1', 'MyISAM');

-- ----------------------------
-- Table structure for `wp_online_count`
-- ----------------------------
DROP TABLE IF EXISTS `wp_online_count`;
CREATE TABLE `wp_online_count` (
  `publicid` int(11) DEFAULT NULL,
  `addon` varchar(30) DEFAULT NULL,
  `aim_id` int(11) DEFAULT NULL,
  `time` bigint(12) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  KEY `tc` (`time`,`count`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_online_count
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_payment_order`
-- ----------------------------
DROP TABLE IF EXISTS `wp_payment_order`;
CREATE TABLE `wp_payment_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `from` varchar(50) NOT NULL COMMENT '回调地址',
  `orderName` varchar(255) DEFAULT NULL COMMENT '订单名称',
  `single_orderid` varchar(100) NOT NULL COMMENT '订单号',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `token` varchar(100) NOT NULL COMMENT 'Token',
  `wecha_id` varchar(200) NOT NULL COMMENT 'OpenID',
  `paytype` varchar(30) NOT NULL COMMENT '支付方式',
  `showwxpaytitle` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否显示标题',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '支付状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_payment_order
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_payment_set`
-- ----------------------------
DROP TABLE IF EXISTS `wp_payment_set`;
CREATE TABLE `wp_payment_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token` varchar(255) DEFAULT NULL COMMENT 'token',
  `ctime` int(10) DEFAULT NULL COMMENT '创建时间',
  `wxappid` varchar(255) DEFAULT NULL COMMENT 'AppID',
  `wxpaysignkey` varchar(255) DEFAULT NULL COMMENT '支付密钥',
  `wxappsecret` varchar(255) DEFAULT NULL COMMENT 'AppSecret',
  `zfbname` varchar(255) DEFAULT NULL COMMENT '帐号',
  `pid` varchar(255) DEFAULT NULL COMMENT 'PID',
  `key` varchar(255) DEFAULT NULL COMMENT 'KEY',
  `partnerid` varchar(255) DEFAULT NULL COMMENT '财付通标识',
  `partnerkey` varchar(255) DEFAULT NULL COMMENT '财付通Key',
  `wappartnerid` varchar(255) DEFAULT NULL COMMENT '财付通标识WAP',
  `wappartnerkey` varchar(255) DEFAULT NULL COMMENT 'WAP财付通Key',
  `wxpartnerkey` varchar(255) DEFAULT NULL COMMENT '微信partnerkey',
  `wxpartnerid` varchar(255) DEFAULT NULL COMMENT '微信partnerid',
  `quick_security_key` varchar(255) DEFAULT NULL COMMENT '银联在线Key',
  `quick_merid` varchar(255) DEFAULT NULL COMMENT '银联在线merid',
  `quick_merabbr` varchar(255) DEFAULT NULL COMMENT '商户名称',
  `shop_id` int(10) DEFAULT '0' COMMENT '商店ID',
  `wxmchid` varchar(255) DEFAULT NULL COMMENT '微信支付商户号',
  `wx_cert_pem` int(10) unsigned DEFAULT NULL COMMENT '上传证书',
  `wx_key_pem` int(10) unsigned DEFAULT NULL COMMENT '上传密匙',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_payment_set
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_picture`
-- ----------------------------
DROP TABLE IF EXISTS `wp_picture`;
CREATE TABLE `wp_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `status` (`id`,`status`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_picture
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `wp_plugin`;
CREATE TABLE `wp_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  `cate_id` int(11) DEFAULT NULL,
  `is_show` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) ,
  KEY `sti` (`status`,`is_show`) 
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COMMENT='系统插件表';

-- ----------------------------
-- Records of wp_plugin
-- ----------------------------
INSERT INTO `wp_plugin` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"2\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0', null, '1');
INSERT INTO `wp_plugin` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '0', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512015', '0', null, '1');
INSERT INTO `wp_plugin` VALUES ('22', 'DevTeam', '开发团队信息', '开发团队成员信息', '0', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1391687096', '0', null, '1');
INSERT INTO `wp_plugin` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0', null, '1');
INSERT INTO `wp_plugin` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0', null, '1');
INSERT INTO `wp_plugin` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"1669260\",\"comment_short_name_duoshuo\":\"\",\"comment_form_pos_duoshuo\":\"buttom\",\"comment_data_list_duoshuo\":\"10\",\"comment_data_order_duoshuo\":\"asc\"}', 'thinkphp', '0.1', '1380273962', '0', null, '1');
INSERT INTO `wp_plugin` VALUES ('58', 'Cascade', '级联菜单', '支持无级级联菜单，用于地区选择、多层分类选择等场景。菜单的数据来源支持查询数据库和直接用户按格式输入两种方式', '1', 'null', '凡星', '0.1', '1398694996', '0', null, '1');
INSERT INTO `wp_plugin` VALUES ('120', 'DynamicSelect', '动态下拉菜单', '支持动态从数据库里取值显示', '1', 'null', '凡星', '0.1', '1435223177', '0', null, '1');
INSERT INTO `wp_plugin` VALUES ('125', 'News', '图文素材选择器', '', '1', 'null', '凡星', '0.1', '1439198046', '0', null, '1');

-- ----------------------------
-- Table structure for `wp_prize`
-- ----------------------------
DROP TABLE IF EXISTS `wp_prize`;
CREATE TABLE `wp_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addon` varchar(255) DEFAULT 'Scratch' COMMENT '来源插件',
  `target_id` int(10) unsigned DEFAULT NULL COMMENT '来源ID',
  `title` varchar(255) DEFAULT NULL COMMENT '奖项标题',
  `name` varchar(255) DEFAULT NULL COMMENT '奖项',
  `num` int(10) unsigned DEFAULT NULL COMMENT '名额数量',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序号',
  `img` int(10) unsigned DEFAULT NULL COMMENT '奖品图片',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_prize
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_prize_address`
-- ----------------------------
DROP TABLE IF EXISTS `wp_prize_address`;
CREATE TABLE `wp_prize_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `address` varchar(255) DEFAULT NULL COMMENT '奖品收货地址',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `turename` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `uid` int(10) DEFAULT NULL COMMENT '用户id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `prizeid` int(10) DEFAULT NULL COMMENT '奖品编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_prize_address
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_public`
-- ----------------------------
DROP TABLE IF EXISTS `wp_public`;
CREATE TABLE `wp_public` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `public_name` varchar(50) NOT NULL COMMENT '公众号名称',
  `public_id` varchar(100) NOT NULL COMMENT '公众号原始id',
  `wechat` varchar(100) NOT NULL COMMENT '微信号',
  `interface_url` varchar(255) DEFAULT NULL COMMENT '接口地址',
  `interface_token` varchar(255) DEFAULT NULL COMMENT '接口配置token',
  `headface_url` varchar(255) DEFAULT NULL COMMENT '公众号头像',
  `area` varchar(50) DEFAULT NULL COMMENT '地区',
  `addon_config` text COMMENT '插件配置',
  `addon_status` text COMMENT '插件状态',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  `is_use` tinyint(2) DEFAULT '0' COMMENT '是否为当前公众号',
  `type` char(10) DEFAULT '0' COMMENT '公众号类型',
  `appid` varchar(255) DEFAULT NULL COMMENT 'AppID',
  `secret` varchar(255) DEFAULT NULL COMMENT 'AppSecret',
  `group_id` int(10) unsigned DEFAULT '0' COMMENT '等级',
  `encodingaeskey` varchar(255) DEFAULT NULL COMMENT 'EncodingAESKey',
  `tips_url` varchar(255) DEFAULT NULL COMMENT '提示关注公众号的文章地址',
  `domain` varchar(30) DEFAULT NULL COMMENT '自定义域名',
  PRIMARY KEY (`id`),
  KEY `token` (`token`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_public
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_public_auth`
-- ----------------------------
DROP TABLE IF EXISTS `wp_public_auth`;
CREATE TABLE `wp_public_auth` (
  `name` char(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type_0` tinyint(1) DEFAULT '0' COMMENT '普通订阅号的开关',
  `type_1` tinyint(1) DEFAULT '0' COMMENT '微信认证订阅号的开关',
  `type_2` tinyint(1) DEFAULT '0' COMMENT '普通服务号的开关',
  `type_3` tinyint(1) DEFAULT '0' COMMENT '微信认证服务号的开关',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_public_auth
-- ----------------------------
INSERT INTO `wp_public_auth` VALUES ('GET_ACCESS_TOKEN', '基础支持-获取access_token', '1', '1', '1', '1');
INSERT INTO `wp_public_auth` VALUES ('GET_WECHAT_IP', '基础支持-获取微信服务器IP地址', '1', '1', '1', '1');
INSERT INTO `wp_public_auth` VALUES ('GET_MSG', '接收消息-验证消息真实性、接收普通消息、接收事件推送、接收语音识别结果', '1', '1', '1', '1');
INSERT INTO `wp_public_auth` VALUES ('SEND_REPLY_MSG', '发送消息-被动回复消息', '1', '1', '1', '1');
INSERT INTO `wp_public_auth` VALUES ('SEND_CUSTOM_MSG', '发送消息-客服接口', '0', '1', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('SEND_GROUP_MSG', '发送消息-群发接口', '0', '1', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('SEND_NOTICE', '发送消息-模板消息接口（发送业务通知）', '0', '0', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('USER_GROUP', '用户管理-用户分组管理', '0', '1', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('USER_REMARK', '用户管理-设置用户备注名', '0', '1', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('USER_BASE_INFO', '用户管理-获取用户基本信息', '0', '1', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('USER_LIST', '用户管理-获取用户列表', '0', '1', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('USER_LOCATION', '用户管理-获取用户地理位置', '0', '0', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('USER_OAUTH', '用户管理-网页授权获取用户openid/用户基本信息', '0', '0', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('QRCODE', '推广支持-生成带参数二维码', '0', '0', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('LONG_URL', '推广支持-长链接转短链接口', '0', '0', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('MENU', '界面丰富-自定义菜单', '0', '1', '1', '1');
INSERT INTO `wp_public_auth` VALUES ('MATERIAL', '素材管理-素材管理接口', '0', '1', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('SEMANTIC', '智能接口-语义理解接口', '0', '0', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('CUSTOM_SERVICE', '多客服-获取多客服消息记录、客服管理', '0', '0', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('PAYMENT', '微信支付接口', '0', '0', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('SHOP', '微信小店接口', '0', '0', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('CARD', '微信卡券接口', '0', '1', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('DEVICE', '微信设备功能接口', '0', '0', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('JSSKD_BASE', '微信JS-SDK-基础接口', '1', '1', '1', '1');
INSERT INTO `wp_public_auth` VALUES ('JSSKD_SHARE', '微信JS-SDK-分享接口', '0', '1', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('JSSKD_IMG', '微信JS-SDK-图像接口', '1', '1', '1', '1');
INSERT INTO `wp_public_auth` VALUES ('JSSKD_AUDIO', '微信JS-SDK-音频接口', '1', '1', '1', '1');
INSERT INTO `wp_public_auth` VALUES ('JSSKD_SEMANTIC', '微信JS-SDK-智能接口（网页语音识别）', '1', '1', '1', '1');
INSERT INTO `wp_public_auth` VALUES ('JSSKD_DEVICE', '微信JS-SDK-设备信息', '1', '1', '1', '1');
INSERT INTO `wp_public_auth` VALUES ('JSSKD_LOCATION', '微信JS-SDK-地理位置', '1', '1', '1', '1');
INSERT INTO `wp_public_auth` VALUES ('JSSKD_MENU', '微信JS-SDK-界面操作', '1', '1', '1', '1');
INSERT INTO `wp_public_auth` VALUES ('JSSKD_SCAN', '微信JS-SDK-微信扫一扫', '1', '1', '1', '1');
INSERT INTO `wp_public_auth` VALUES ('JSSKD_SHOP', '微信JS-SDK-微信小店', '0', '0', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('JSSKD_CARD', '微信JS-SDK-微信卡券', '0', '1', '0', '1');
INSERT INTO `wp_public_auth` VALUES ('JSSKD_PAYMENT', '微信JS-SDK-微信支付', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `wp_public_follow`
-- ----------------------------
DROP TABLE IF EXISTS `wp_public_follow`;
CREATE TABLE `wp_public_follow` (
  `openid` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `has_subscribe` tinyint(1) DEFAULT '1',
  `syc_status` tinyint(1) DEFAULT '2' COMMENT '0 开始同步中 1 更新用户信息中 2 完成同步',
  UNIQUE KEY `openid` (`openid`,`token`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_public_follow
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_public_group`
-- ----------------------------
DROP TABLE IF EXISTS `wp_public_group`;
CREATE TABLE `wp_public_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) DEFAULT NULL COMMENT '等级名',
  `addon_status` text COMMENT '插件权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_public_group
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_public_link`
-- ----------------------------
DROP TABLE IF EXISTS `wp_public_link`;
CREATE TABLE `wp_public_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT NULL COMMENT '管理员UID',
  `mp_id` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `is_creator` tinyint(2) DEFAULT '0' COMMENT '是否为创建者',
  `addon_status` text COMMENT '插件权限',
  `is_use` tinyint(2) DEFAULT '0' COMMENT '是否为当前管理的公众号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `um` (`uid`,`mp_id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_public_link
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_qr_code`
-- ----------------------------
DROP TABLE IF EXISTS `wp_qr_code`;
CREATE TABLE `wp_qr_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `qr_code` varchar(255) NOT NULL COMMENT '二维码',
  `addon` varchar(255) NOT NULL COMMENT '二维码所属插件',
  `aim_id` int(10) unsigned NOT NULL COMMENT '插件表里的ID值',
  `cTime` int(10) DEFAULT NULL COMMENT '创建时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `action_name` char(30) DEFAULT 'QR_SCENE' COMMENT '二维码类型',
  `extra_text` text COMMENT '文本扩展',
  `extra_int` int(10) DEFAULT NULL COMMENT '数字扩展',
  `request_count` int(10) DEFAULT '0' COMMENT '请求数',
  `scene_id` int(10) DEFAULT '0' COMMENT '场景ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_qr_code
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_real_prize`
-- ----------------------------
DROP TABLE IF EXISTS `wp_real_prize`;
CREATE TABLE `wp_real_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `prize_name` varchar(255) DEFAULT NULL COMMENT '奖品名称',
  `prize_conditions` text COMMENT '活动说明',
  `prize_count` int(10) DEFAULT NULL COMMENT '奖品个数',
  `prize_image` varchar(255) DEFAULT '上传奖品图片' COMMENT '奖品图片',
  `token` varchar(255) DEFAULT NULL COMMENT 'token',
  `prize_type` tinyint(2) DEFAULT '1' COMMENT '奖品类型',
  `use_content` text COMMENT '使用说明',
  `prize_title` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `fail_content` text COMMENT '领取失败提示',
  `template` varchar(255) DEFAULT 'default' COMMENT '素材模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_real_prize
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_redbag`
-- ----------------------------
DROP TABLE IF EXISTS `wp_redbag`;
CREATE TABLE `wp_redbag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mch_id` varchar(32) DEFAULT NULL COMMENT '商户号',
  `sub_mch_id` varchar(32) DEFAULT NULL COMMENT '子商户号',
  `wxappid` varchar(32) DEFAULT NULL COMMENT '公众账号appid',
  `nick_name` varchar(32) DEFAULT NULL COMMENT '提供方名称',
  `send_name` varchar(32) DEFAULT NULL COMMENT '商户名称',
  `total_amount` int(10) DEFAULT '1000' COMMENT '付款金额',
  `min_value` int(10) DEFAULT '1000' COMMENT '最小红包金额',
  `max_value` int(10) DEFAULT '1000' COMMENT '最大红包金额',
  `total_num` int(10) DEFAULT '1' COMMENT '红包发放总人数',
  `wishing` varchar(255) DEFAULT NULL COMMENT '红包祝福语',
  `act_name` varchar(255) DEFAULT NULL COMMENT '活动名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `logo_imgurl` int(10) unsigned DEFAULT NULL COMMENT '商户logo的url',
  `share_content` varchar(255) DEFAULT NULL COMMENT '分享文案',
  `share_url` varchar(255) DEFAULT NULL COMMENT '分享链接',
  `share_imgurl` int(10) unsigned DEFAULT NULL COMMENT '分享的图片',
  `collect_count` int(10) DEFAULT '0' COMMENT '领取人数',
  `collect_amount` int(10) DEFAULT '0' COMMENT '已领取金额',
  `collect_limit` tinyint(2) DEFAULT '0' COMMENT '每人最多领取次数',
  `partner_key` varchar(50) DEFAULT NULL COMMENT '商户API密钥',
  `template` varchar(255) DEFAULT 'default' COMMENT '素材模板',
  `token` varchar(50) DEFAULT NULL COMMENT 'token',
  `uid` int(10) DEFAULT NULL COMMENT 'uid',
  `act_remark` varchar(255) DEFAULT NULL COMMENT '活动备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_redbag
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_redbag_follow`
-- ----------------------------
DROP TABLE IF EXISTS `wp_redbag_follow`;
CREATE TABLE `wp_redbag_follow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `redbag_id` int(10) DEFAULT NULL COMMENT '红包ID',
  `follow_id` int(10) DEFAULT NULL COMMENT '粉丝ID',
  `amount` int(10) DEFAULT '0' COMMENT '领取金额',
  `cTime` int(10) DEFAULT NULL COMMENT '领取时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_redbag_follow
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_reservation`
-- ----------------------------
DROP TABLE IF EXISTS `wp_reservation`;
CREATE TABLE `wp_reservation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `reservation_date` int(10) DEFAULT NULL COMMENT '日期',
  `morning_count` char(50) DEFAULT '30' COMMENT '上午放号数',
  `afternoon_count` char(50) DEFAULT '30' COMMENT '下午放号数',
  `c_time` int(10) DEFAULT NULL COMMENT '创建日期',
  `manager_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_reservation
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_reservation_number`
-- ----------------------------
DROP TABLE IF EXISTS `wp_reservation_number`;
CREATE TABLE `wp_reservation_number` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `reservation_date` int(10) DEFAULT NULL COMMENT '预约日期',
  `type` int(10) DEFAULT NULL COMMENT '上午/下午',
  `is_use` int(10) DEFAULT '0' COMMENT '是否预约',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `desc` text COMMENT '病症描述',
  `use_time` int(10) DEFAULT NULL COMMENT '提交预约的时间',
  `reservation_id` int(10) DEFAULT NULL COMMENT '日期ID',
  `reservation_num` varchar(255) DEFAULT NULL COMMENT '预约号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_reservation_number
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_scratch`
-- ----------------------------
DROP TABLE IF EXISTS `wp_scratch`;
CREATE TABLE `wp_scratch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `use_tips` varchar(255) NOT NULL COMMENT '使用说明',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '封面简介',
  `end_time` int(10) DEFAULT NULL COMMENT '结束时间',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `start_time` int(10) DEFAULT NULL COMMENT '开始时间',
  `end_tips` text COMMENT '过期说明',
  `predict_num` int(10) unsigned NOT NULL COMMENT '预计参与人数',
  `max_num` int(10) unsigned DEFAULT '1' COMMENT '每人最多允许抽奖次数',
  `follower_condtion` char(50) DEFAULT '1' COMMENT '粉丝状态',
  `credit_conditon` int(10) unsigned DEFAULT '0' COMMENT '积分限制',
  `credit_bug` int(10) unsigned DEFAULT '0' COMMENT '积分消费',
  `addon_condition` varchar(255) DEFAULT NULL COMMENT '插件场景限制',
  `collect_count` int(10) unsigned DEFAULT '0' COMMENT '已领取人数',
  `view_count` int(10) unsigned DEFAULT '0' COMMENT '浏览人数',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `end_img` int(10) unsigned DEFAULT NULL COMMENT '过期提示图片',
  `template` varchar(255) DEFAULT 'default' COMMENT '素材模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_scratch
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_shop`
-- ----------------------------
DROP TABLE IF EXISTS `wp_shop`;
CREATE TABLE `wp_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '商店名称',
  `logo` int(10) DEFAULT NULL COMMENT '商店LOGO',
  `intro` text COMMENT '店铺简介',
  `mobile` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `qq` int(10) DEFAULT NULL COMMENT 'QQ',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信',
  `template` varchar(30) DEFAULT NULL COMMENT '模板',
  `content` text COMMENT '店铺介绍',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  `manager_id` int(10) DEFAULT NULL COMMENT '管理员ID',
  `api_key` varchar(100) DEFAULT NULL COMMENT '快递接口的APPKEY',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_shop
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_shop_address`
-- ----------------------------
DROP TABLE IF EXISTS `wp_shop_address`;
CREATE TABLE `wp_shop_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `truename` varchar(100) DEFAULT NULL COMMENT '收货人姓名',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `address` varchar(255) DEFAULT NULL COMMENT '具体地址',
  `is_use` tinyint(2) DEFAULT '0' COMMENT '是否设置为默认',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_shop_address
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_shop_cart`
-- ----------------------------
DROP TABLE IF EXISTS `wp_shop_cart`;
CREATE TABLE `wp_shop_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `shop_id` varchar(255) NOT NULL COMMENT '商店id',
  `goods_id` varchar(255) NOT NULL COMMENT '商品id',
  `num` int(10) unsigned NOT NULL COMMENT '数量',
  `price` varchar(30) NOT NULL COMMENT '单价',
  `goods_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '商品类型',
  `openid` varchar(255) NOT NULL COMMENT 'openid',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_shop_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_shop_collect`
-- ----------------------------
DROP TABLE IF EXISTS `wp_shop_collect`;
CREATE TABLE `wp_shop_collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT NULL COMMENT '使用UID',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品ID',
  `cTime` int(10) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_shop_collect
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_shop_goods`
-- ----------------------------
DROP TABLE IF EXISTS `wp_shop_goods`;
CREATE TABLE `wp_shop_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `content` text NOT NULL COMMENT '商品介绍',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '商品封面图',
  `imgs` varchar(255) NOT NULL COMMENT '商品图片',
  `inventory` int(10) DEFAULT '0' COMMENT '库存数量',
  `shop_id` int(10) DEFAULT '0' COMMENT '商店ID',
  `is_show` tinyint(2) DEFAULT '0' COMMENT '是否上架',
  `sale_count` int(10) DEFAULT '0' COMMENT '销售量',
  `is_recommend` tinyint(2) DEFAULT NULL COMMENT '是否推荐',
  `rank` int(10) DEFAULT '0' COMMENT '热销度',
  `show_time` int(10) DEFAULT '0' COMMENT '上架时间',
  `old_price` int(10) DEFAULT NULL COMMENT '原价',
  `type` tinyint(2) DEFAULT '0' COMMENT '商品类型',
  `category_id` char(50) DEFAULT NULL COMMENT '商品分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_shop_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_shop_goods_category`
-- ----------------------------
DROP TABLE IF EXISTS `wp_shop_goods_category`;
CREATE TABLE `wp_shop_goods_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '分类标题',
  `icon` int(10) unsigned DEFAULT NULL COMMENT '分类图标',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '上一级分类',
  `path` varchar(255) DEFAULT NULL COMMENT '分类路径',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序号',
  `is_show` tinyint(2) DEFAULT '1' COMMENT '是否显示',
  `shop_id` int(10) NOT NULL DEFAULT '0' COMMENT '商店ID',
  `is_recommend` tinyint(2) DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_shop_goods_category
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_shop_goods_score`
-- ----------------------------
DROP TABLE IF EXISTS `wp_shop_goods_score`;
CREATE TABLE `wp_shop_goods_score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品ID',
  `score` int(10) DEFAULT '0' COMMENT '得分',
  `cTime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_shop_goods_score
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_shop_order`
-- ----------------------------
DROP TABLE IF EXISTS `wp_shop_order`;
CREATE TABLE `wp_shop_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_datas` text NOT NULL COMMENT '商品序列化数据',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `remark` text NOT NULL COMMENT '备注',
  `order_number` varchar(255) NOT NULL COMMENT '订单编号',
  `cTime` int(10) NOT NULL COMMENT '订单时间',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '总价',
  `openid` varchar(255) NOT NULL COMMENT 'OpenID',
  `pay_status` int(10) DEFAULT NULL COMMENT '支付状态',
  `pay_type` int(10) DEFAULT NULL COMMENT '支付类型',
  `address_id` int(10) DEFAULT NULL COMMENT '配送信息',
  `is_send` int(10) DEFAULT '0' COMMENT '是否发货',
  `send_code` varchar(255) DEFAULT NULL COMMENT '快递公司编号',
  `send_number` varchar(255) DEFAULT NULL COMMENT '快递单号',
  `send_type` char(10) DEFAULT NULL COMMENT '发货类型',
  `is_new` tinyint(2) DEFAULT '1' COMMENT '是否为新订单',
  `shop_id` int(10) DEFAULT '0' COMMENT '商店编号',
  `status_code` char(50) DEFAULT '0' COMMENT '订单跟踪状态码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_shop_order
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_shop_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `wp_shop_order_log`;
CREATE TABLE `wp_shop_order_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(10) DEFAULT NULL COMMENT '订单ID',
  `status_code` char(50) DEFAULT '0' COMMENT '状态码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注内容',
  `cTime` int(10) DEFAULT NULL COMMENT '时间',
  `extend` varchar(255) DEFAULT NULL COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_shop_order_log
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_shop_slideshow`
-- ----------------------------
DROP TABLE IF EXISTS `wp_shop_slideshow`;
CREATE TABLE `wp_shop_slideshow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `img` int(10) unsigned NOT NULL COMMENT '图片',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `is_show` tinyint(2) DEFAULT '1' COMMENT '是否显示',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  `shop_id` int(10) DEFAULT '0' COMMENT '商店ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_shop_slideshow
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_sn_code`
-- ----------------------------
DROP TABLE IF EXISTS `wp_sn_code`;
CREATE TABLE `wp_sn_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sn` varchar(255) DEFAULT NULL COMMENT 'SN码',
  `uid` int(10) DEFAULT NULL COMMENT '粉丝UID',
  `cTime` int(10) DEFAULT NULL COMMENT '创建时间',
  `is_use` tinyint(2) DEFAULT '0' COMMENT '是否已使用',
  `use_time` int(10) DEFAULT NULL COMMENT '使用时间',
  `addon` varchar(255) DEFAULT 'Coupon' COMMENT '来自的插件',
  `target_id` int(10) unsigned DEFAULT NULL COMMENT '来源ID',
  `prize_id` int(10) unsigned DEFAULT NULL COMMENT '奖项ID',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否可用',
  `prize_title` varchar(255) DEFAULT NULL COMMENT '奖项',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `can_use` tinyint(2) DEFAULT '1' COMMENT '是否可用',
  `server_addr` varchar(50) DEFAULT NULL COMMENT '服务器IP',
  PRIMARY KEY (`id`),
  KEY `id` (`uid`,`target_id`,`addon`) ,
  KEY `addon` (`target_id`,`addon`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_sn_code
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_sports_join`
-- ----------------------------
DROP TABLE IF EXISTS `wp_sports_join`;
CREATE TABLE `wp_sports_join` (
  `follow_id` int(11) DEFAULT NULL,
  `sports_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  KEY `time` (`time`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_sports_join
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_store`
-- ----------------------------
DROP TABLE IF EXISTS `wp_store`;
CREATE TABLE `wp_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `uid` int(10) DEFAULT '0' COMMENT '用户ID',
  `content` text COMMENT '内容',
  `cTime` int(10) DEFAULT NULL COMMENT '发布时间',
  `attach` varchar(255) DEFAULT NULL COMMENT '插件安装包',
  `is_top` int(10) DEFAULT '0' COMMENT '置顶',
  `cid` tinyint(4) DEFAULT NULL COMMENT '分类',
  `view_count` int(11) unsigned DEFAULT '0' COMMENT '浏览数',
  `img_1` int(10) unsigned DEFAULT NULL COMMENT '插件截图1',
  `img_2` int(10) unsigned DEFAULT NULL COMMENT '插件截图2',
  `img_3` int(10) unsigned DEFAULT NULL COMMENT '插件截图3',
  `img_4` int(10) unsigned DEFAULT NULL COMMENT '插件截图4',
  `download_count` int(10) unsigned DEFAULT '0' COMMENT '下载数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_store
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_survey`
-- ----------------------------
DROP TABLE IF EXISTS `wp_survey`;
CREATE TABLE `wp_survey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '封面简介',
  `mTime` int(10) DEFAULT NULL COMMENT '修改时间',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `finish_tip` text COMMENT '结束语',
  `template` varchar(255) DEFAULT 'default' COMMENT '素材模板',
  `start_time` int(10) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(10) DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_survey
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_survey_answer`
-- ----------------------------
DROP TABLE IF EXISTS `wp_survey_answer`;
CREATE TABLE `wp_survey_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cTime` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `survey_id` int(10) unsigned NOT NULL COMMENT 'survey_id',
  `question_id` int(10) unsigned NOT NULL COMMENT 'question_id',
  `uid` int(10) DEFAULT NULL COMMENT '用户UID',
  `openid` varchar(255) DEFAULT NULL COMMENT 'OpenId',
  `answer` text COMMENT '回答内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_survey_answer
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_survey_question`
-- ----------------------------
DROP TABLE IF EXISTS `wp_survey_question`;
CREATE TABLE `wp_survey_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '问题描述',
  `cTime` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `survey_id` int(10) unsigned NOT NULL COMMENT 'survey_id',
  `type` char(50) NOT NULL DEFAULT 'radio' COMMENT '问题类型',
  `extra` text COMMENT '参数',
  `is_must` tinyint(2) DEFAULT '0' COMMENT '是否必填',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_survey_question
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_system_notice`
-- ----------------------------
DROP TABLE IF EXISTS `wp_system_notice`;
CREATE TABLE `wp_system_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '公告标题',
  `content` text COMMENT '公告内容',
  `create_time` int(10) DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_system_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_update_version`
-- ----------------------------
DROP TABLE IF EXISTS `wp_update_version`;
CREATE TABLE `wp_update_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` int(10) unsigned NOT NULL COMMENT '版本号',
  `title` varchar(50) NOT NULL COMMENT '升级包名',
  `description` text COMMENT '描述',
  `create_date` int(10) DEFAULT NULL COMMENT '创建时间',
  `download_count` int(10) unsigned DEFAULT '0' COMMENT '下载统计',
  `package` varchar(255) NOT NULL COMMENT '升级包地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_update_version
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_user`
-- ----------------------------
DROP TABLE IF EXISTS `wp_user`;
CREATE TABLE `wp_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` text COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录密码',
  `truename` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱地址',
  `sex` tinyint(2) DEFAULT NULL COMMENT '性别',
  `headimgurl` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像地址',
  `city` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '城市',
  `province` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '省份',
  `country` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '国家',
  `language` varchar(20) CHARACTER SET utf8 DEFAULT 'zh-cn' COMMENT '语言',
  `score` int(10) DEFAULT '0' COMMENT '金币值',
  `experience` int(10) DEFAULT '0' COMMENT '经验值',
  `unionid` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信第三方ID',
  `login_count` int(10) DEFAULT '0' COMMENT '登录次数',
  `reg_ip` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '注册IP',
  `reg_time` int(10) DEFAULT NULL COMMENT '注册时间',
  `last_login_ip` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近登录IP',
  `last_login_time` int(10) DEFAULT NULL COMMENT '最近登录时间',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `is_init` tinyint(2) DEFAULT '0' COMMENT '初始化状态',
  `is_audit` tinyint(2) DEFAULT '0' COMMENT '审核状态',
  `subscribe_time` int(10) DEFAULT NULL COMMENT '用户关注公众号时间',
  `remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信用户备注',
  `groupid` int(10) DEFAULT NULL COMMENT '微信端的分组ID',
  `come_from` tinyint(1) DEFAULT '0' COMMENT '来源',
  `login_name` varchar(100) DEFAULT NULL COMMENT 'login_name',
  `public_count` int(10) DEFAULT NULL COMMENT '可创建公众号数',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_user
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_user_follow`
-- ----------------------------
DROP TABLE IF EXISTS `wp_user_follow`;
CREATE TABLE `wp_user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `publicid` int(11) DEFAULT NULL,
  `follow_id` int(11) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_user_follow
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_visit_log`
-- ----------------------------
DROP TABLE IF EXISTS `wp_visit_log`;
CREATE TABLE `wp_visit_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `publicid` int(10) DEFAULT '0' COMMENT 'publicid',
  `module_name` varchar(30) DEFAULT NULL COMMENT 'module_name',
  `controller_name` varchar(30) DEFAULT NULL COMMENT 'controller_name',
  `action_name` varchar(30) DEFAULT NULL COMMENT 'action_name',
  `uid` varchar(255) DEFAULT '0' COMMENT 'uid',
  `ip` varchar(30) DEFAULT NULL COMMENT 'ip',
  `brower` varchar(30) DEFAULT NULL COMMENT 'brower',
  `param` text COMMENT 'param',
  `referer` varchar(255) DEFAULT NULL COMMENT 'referer',
  `cTime` int(10) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_visit_log
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_vote`
-- ----------------------------
DROP TABLE IF EXISTS `wp_vote`;
CREATE TABLE `wp_vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(50) NOT NULL COMMENT '关键词',
  `title` varchar(100) NOT NULL COMMENT '投票标题',
  `description` text COMMENT '投票描述',
  `picurl` int(10) unsigned DEFAULT NULL COMMENT '封面图片',
  `type` char(10) NOT NULL DEFAULT '0' COMMENT '选择类型',
  `start_date` int(10) DEFAULT NULL COMMENT '开始日期',
  `end_date` int(10) DEFAULT NULL COMMENT '结束日期',
  `is_img` tinyint(2) DEFAULT '0' COMMENT '文字/图片投票',
  `vote_count` int(10) unsigned DEFAULT '0' COMMENT '投票数',
  `cTime` int(10) DEFAULT NULL COMMENT '投票创建时间',
  `mTime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `template` varchar(255) DEFAULT 'default' COMMENT '素材模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_vote
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_vote_log`
-- ----------------------------
DROP TABLE IF EXISTS `wp_vote_log`;
CREATE TABLE `wp_vote_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vote_id` int(10) unsigned DEFAULT NULL COMMENT '投票ID',
  `user_id` int(10) DEFAULT NULL COMMENT '用户ID',
  `token` varchar(255) DEFAULT NULL COMMENT '用户TOKEN',
  `options` varchar(255) DEFAULT NULL COMMENT '选择选项',
  `cTime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_vote_log
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_vote_option`
-- ----------------------------
DROP TABLE IF EXISTS `wp_vote_option`;
CREATE TABLE `wp_vote_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vote_id` int(10) unsigned NOT NULL COMMENT '投票ID',
  `name` varchar(255) NOT NULL COMMENT '选项标题',
  `image` int(10) unsigned DEFAULT NULL COMMENT '图片选项',
  `opt_count` int(10) unsigned DEFAULT '0' COMMENT '当前选项投票数',
  `order` int(10) unsigned DEFAULT '0' COMMENT '选项排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_vote_option
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_weisite_category`
-- ----------------------------
DROP TABLE IF EXISTS `wp_weisite_category`;
CREATE TABLE `wp_weisite_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(100) NOT NULL COMMENT '分类标题',
  `icon` int(10) unsigned DEFAULT NULL COMMENT '分类图片',
  `url` varchar(255) DEFAULT NULL COMMENT '外链',
  `is_show` tinyint(2) DEFAULT '1' COMMENT '显示',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  `sort` int(10) DEFAULT '0' COMMENT '排序号',
  `pid` int(10) DEFAULT '0' COMMENT '一级目录',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_weisite_category
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_weisite_cms`
-- ----------------------------
DROP TABLE IF EXISTS `wp_weisite_cms`;
CREATE TABLE `wp_weisite_cms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) DEFAULT NULL COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '简介',
  `cate_id` int(10) unsigned DEFAULT '0' COMMENT '所属类别',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '封面图片',
  `content` text COMMENT '内容',
  `cTime` int(10) DEFAULT NULL COMMENT '发布时间',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序号',
  `view_count` int(10) unsigned DEFAULT '0' COMMENT '浏览数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_weisite_cms
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_weisite_footer`
-- ----------------------------
DROP TABLE IF EXISTS `wp_weisite_footer`;
CREATE TABLE `wp_weisite_footer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(255) DEFAULT NULL COMMENT '关联URL',
  `title` varchar(50) NOT NULL COMMENT '菜单名',
  `pid` tinyint(2) DEFAULT '0' COMMENT '一级菜单',
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序号',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `icon` int(10) unsigned DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`),
  KEY `token` (`token`,`pid`,`sort`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_weisite_footer
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_weisite_slideshow`
-- ----------------------------
DROP TABLE IF EXISTS `wp_weisite_slideshow`;
CREATE TABLE `wp_weisite_slideshow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `img` int(10) unsigned NOT NULL COMMENT '图片',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `is_show` tinyint(2) DEFAULT '1' COMMENT '是否显示',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_weisite_slideshow
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_weixin_log`
-- ----------------------------
DROP TABLE IF EXISTS `wp_weixin_log`;
CREATE TABLE `wp_weixin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cTime` int(11) DEFAULT NULL,
  `cTime_format` varchar(30) DEFAULT NULL,
  `data` text,
  `data_post` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_weixin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_weixin_message`
-- ----------------------------
DROP TABLE IF EXISTS `wp_weixin_message`;
CREATE TABLE `wp_weixin_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ToUserName` varchar(100) DEFAULT NULL COMMENT 'Token',
  `FromUserName` varchar(100) DEFAULT NULL COMMENT 'OpenID',
  `CreateTime` int(10) DEFAULT NULL COMMENT '创建时间',
  `MsgType` varchar(30) DEFAULT NULL COMMENT '消息类型',
  `MsgId` varchar(100) DEFAULT NULL COMMENT '消息ID',
  `Content` text COMMENT '文本消息内容',
  `PicUrl` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `MediaId` varchar(100) DEFAULT NULL COMMENT '多媒体文件ID',
  `Format` varchar(30) DEFAULT NULL COMMENT '语音格式',
  `ThumbMediaId` varchar(30) DEFAULT NULL COMMENT '缩略图的媒体id',
  `Title` varchar(100) DEFAULT NULL COMMENT '消息标题',
  `Description` text COMMENT '消息描述',
  `Url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `collect` tinyint(1) DEFAULT '0' COMMENT '收藏状态',
  `deal` tinyint(1) DEFAULT '0' COMMENT '处理状态',
  `is_read` tinyint(1) DEFAULT '0' COMMENT '是否已读',
  `type` tinyint(1) DEFAULT '0' COMMENT '消息分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_weixin_message
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_wish_card`
-- ----------------------------
DROP TABLE IF EXISTS `wp_wish_card`;
CREATE TABLE `wp_wish_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `send_name` varchar(255) DEFAULT NULL COMMENT '发送人',
  `receive_name` varchar(255) DEFAULT NULL COMMENT '接收人',
  `content` text COMMENT '祝福语',
  `create_time` int(10) DEFAULT NULL COMMENT ' 创建时间',
  `template` char(50) DEFAULT NULL COMMENT '模板',
  `template_cate` varchar(255) DEFAULT NULL COMMENT '模板分类',
  `read_count` int(10) DEFAULT '0' COMMENT '浏览次数',
  `mid` varchar(255) DEFAULT NULL COMMENT '用户Id',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wish_card
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_wish_card_content`
-- ----------------------------
DROP TABLE IF EXISTS `wp_wish_card_content`;
CREATE TABLE `wp_wish_card_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content_cate_id` int(10) DEFAULT '0' COMMENT '祝福语类别Id',
  `content` text COMMENT '祝福语',
  `content_cate` varchar(255) DEFAULT NULL COMMENT '类别',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wish_card_content
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_wish_card_content_cate`
-- ----------------------------
DROP TABLE IF EXISTS `wp_wish_card_content_cate`;
CREATE TABLE `wp_wish_card_content_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content_cate_name` varchar(255) DEFAULT NULL COMMENT '祝福语类别',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `content_cate_icon` int(10) unsigned DEFAULT NULL COMMENT '类别图标',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wish_card_content_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_xydzp`
-- ----------------------------
DROP TABLE IF EXISTS `wp_xydzp`;
CREATE TABLE `wp_xydzp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `end_date` int(10) DEFAULT NULL COMMENT '结束日期',
  `cTime` int(10) DEFAULT NULL COMMENT '活动创建时间',
  `states` char(10) DEFAULT '0' COMMENT '活动状态',
  `picurl` int(10) unsigned DEFAULT NULL COMMENT '封面图片',
  `title` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `guiz` text COMMENT '活动规则',
  `choujnum` int(10) unsigned DEFAULT '0' COMMENT '每日抽奖次数',
  `des` text COMMENT '活动介绍',
  `des_jj` text COMMENT '活动介绍',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
  `start_date` int(10) DEFAULT NULL COMMENT '开始时间',
  `experience` int(10) DEFAULT '0' COMMENT '消耗经验值',
  `background` int(10) unsigned DEFAULT NULL COMMENT '背景图',
  `template` varchar(255) DEFAULT 'default' COMMENT '素材模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_xydzp
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_xydzp_jplist`
-- ----------------------------
DROP TABLE IF EXISTS `wp_xydzp_jplist`;
CREATE TABLE `wp_xydzp_jplist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gailv` int(10) unsigned DEFAULT '0' COMMENT '中奖概率',
  `gailv_str` varchar(255) DEFAULT NULL COMMENT '参数',
  `xydzp_id` int(10) unsigned DEFAULT '0' COMMENT '幸运大转盘关联的活动id',
  `jlnum` int(10) unsigned DEFAULT '1' COMMENT '奖励数量',
  `type` char(50) DEFAULT '0' COMMENT '奖品中奖方式',
  `gailv_maxnum` int(10) unsigned DEFAULT '0' COMMENT '单日发放上限',
  `xydzp_option_id` int(10) unsigned DEFAULT NULL COMMENT '幸运大转盘关联的全局奖品id',
  PRIMARY KEY (`id`),
  KEY `xydzp_id` (`xydzp_id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_xydzp_jplist
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_xydzp_log`
-- ----------------------------
DROP TABLE IF EXISTS `wp_xydzp_log`;
CREATE TABLE `wp_xydzp_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` varchar(255) DEFAULT NULL COMMENT '用户openid',
  `message` text COMMENT '留言',
  `address` text COMMENT '收件地址',
  `iphone` varchar(255) DEFAULT NULL COMMENT '电话',
  `zip` int(10) unsigned DEFAULT NULL COMMENT '邮编',
  `state` tinyint(2) DEFAULT '0' COMMENT '领奖状态',
  `xydzp_option_id` int(10) unsigned DEFAULT '0' COMMENT '奖品id',
  `xydzp_id` int(10) unsigned DEFAULT '0' COMMENT '活动id',
  `zjdate` int(10) unsigned DEFAULT NULL COMMENT '中奖时间',
  PRIMARY KEY (`id`),
  KEY `xydzp_id` (`uid`,`xydzp_id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_xydzp_log
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_xydzp_option`
-- ----------------------------
DROP TABLE IF EXISTS `wp_xydzp_option`;
CREATE TABLE `wp_xydzp_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jptype` char(10) DEFAULT '0' COMMENT '奖品类型',
  `duijma` text COMMENT '兑奖码',
  `title` varchar(255) DEFAULT NULL COMMENT '奖品名称',
  `pic` int(10) unsigned DEFAULT NULL COMMENT '奖品图片',
  `miaoshu` text COMMENT '奖品描述',
  `num` int(10) unsigned DEFAULT '0' COMMENT '库存数量',
  `isdf` tinyint(2) DEFAULT '0' COMMENT '是否为谢谢惠顾类',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token',
  `coupon_id` int(10) DEFAULT NULL COMMENT '优惠券编号',
  `experience` int(10) DEFAULT '0' COMMENT '奖励经验值',
  `card_url` varchar(255) DEFAULT NULL COMMENT '领取卡券的地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_xydzp_option
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_xydzp_userlog`
-- ----------------------------
DROP TABLE IF EXISTS `wp_xydzp_userlog`;
CREATE TABLE `wp_xydzp_userlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` varchar(255) DEFAULT NULL COMMENT '用户id',
  `xydzp_id` int(10) unsigned DEFAULT NULL COMMENT '幸运大转盘关联的活动id',
  `num` int(10) unsigned DEFAULT '0' COMMENT '已经抽奖的次数',
  `cjdate` int(10) DEFAULT NULL COMMENT '抽奖日期',
  PRIMARY KEY (`id`),
  KEY `xydzp_id` (`uid`,`xydzp_id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_xydzp_userlog
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_youaskservice_behavior`
-- ----------------------------
DROP TABLE IF EXISTS `wp_youaskservice_behavior`;
CREATE TABLE `wp_youaskservice_behavior` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  `token` varchar(60) DEFAULT NULL,
  `openid` varchar(60) DEFAULT NULL,
  `date` varchar(11) DEFAULT NULL,
  `enddate` int(11) DEFAULT NULL,
  `model` varchar(60) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `keyword` varchar(60) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_youaskservice_behavior
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_youaskservice_group`
-- ----------------------------
DROP TABLE IF EXISTS `wp_youaskservice_group`;
CREATE TABLE `wp_youaskservice_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token` varchar(255) DEFAULT NULL COMMENT 'token',
  `groupname` varchar(255) DEFAULT NULL COMMENT '分组名称',
  `groupdata` text COMMENT '分组数据源',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_youaskservice_group
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_youaskservice_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `wp_youaskservice_keyword`;
CREATE TABLE `wp_youaskservice_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msgkeyword` varchar(555) DEFAULT NULL COMMENT '消息关键字',
  `msgkeyword_type` char(50) DEFAULT '3' COMMENT '关键字类型',
  `msgkfaccount` varchar(255) DEFAULT NULL COMMENT '接待的客服人员',
  `cTime` int(10) DEFAULT NULL COMMENT '创建时间',
  `token` varchar(255) DEFAULT NULL COMMENT 'token',
  `msgstate` tinyint(2) DEFAULT '1' COMMENT '关键字状态',
  `zjnum` int(10) DEFAULT NULL COMMENT '转接次数',
  `zdtype` char(10) DEFAULT '0' COMMENT '指定类型',
  `kfgroupid` int(10) DEFAULT '0' COMMENT '客服分组id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_youaskservice_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_youaskservice_logs`
-- ----------------------------
DROP TABLE IF EXISTS `wp_youaskservice_logs`;
CREATE TABLE `wp_youaskservice_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `openid` varchar(60) DEFAULT NULL,
  `enddate` int(11) DEFAULT NULL,
  `keyword` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_youaskservice_logs
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_youaskservice_user`
-- ----------------------------
DROP TABLE IF EXISTS `wp_youaskservice_user`;
CREATE TABLE `wp_youaskservice_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL COMMENT '客服昵称',
  `token` varchar(60) DEFAULT NULL COMMENT 'token',
  `userName` varchar(60) DEFAULT NULL COMMENT '客服帐号',
  `userPwd` varchar(32) DEFAULT NULL COMMENT '客服密码',
  `endJoinDate` int(11) DEFAULT NULL COMMENT '客服加入时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '客服在线状态',
  `state` tinyint(2) DEFAULT '0' COMMENT '客服状态',
  `isdelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `kfid` varchar(255) DEFAULT NULL COMMENT '客服编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_youaskservice_user
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_youaskservice_wechat_enddate`
-- ----------------------------
DROP TABLE IF EXISTS `wp_youaskservice_wechat_enddate`;
CREATE TABLE `wp_youaskservice_wechat_enddate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(60) DEFAULT NULL,
  `enddate` int(11) DEFAULT NULL,
  `joinUpDate` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `token` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_youaskservice_wechat_enddate
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_youaskservice_wechat_grouplist`
-- ----------------------------
DROP TABLE IF EXISTS `wp_youaskservice_wechat_grouplist`;
CREATE TABLE `wp_youaskservice_wechat_grouplist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` varchar(20) DEFAULT NULL,
  `nickname` varchar(60) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `headimgurl` varchar(200) DEFAULT NULL,
  `subscribe_time` int(11) DEFAULT NULL,
  `token` varchar(30) DEFAULT NULL,
  `openid` varchar(60) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_youaskservice_wechat_grouplist
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_youaskservice_wxlogs`
-- ----------------------------
DROP TABLE IF EXISTS `wp_youaskservice_wxlogs`;
CREATE TABLE `wp_youaskservice_wxlogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token` varchar(255) DEFAULT NULL COMMENT 'token',
  `worker` varchar(255) DEFAULT NULL COMMENT '客服名称',
  `openid` varchar(255) DEFAULT NULL COMMENT 'openid',
  `opercode` int(10) DEFAULT NULL COMMENT '会话状态',
  `time` int(10) DEFAULT NULL COMMENT '时间',
  `text` text COMMENT '消息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_youaskservice_wxlogs
-- ----------------------------
