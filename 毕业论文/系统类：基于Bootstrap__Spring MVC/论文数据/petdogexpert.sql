/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : petdogexpert

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-05-12 12:01:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for es_article_push
-- ----------------------------
DROP TABLE IF EXISTS `es_article_push`;
CREATE TABLE `es_article_push` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `disease_id` int(255) unsigned DEFAULT NULL,
  `dog_id` int(255) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `solution` varchar(500) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `creation_by` int(11) unsigned DEFAULT NULL,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `disease_id` (`disease_id`),
  KEY `dog_id` (`dog_id`),
  KEY `creation_by` (`creation_by`),
  CONSTRAINT `es_article_push_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `es_disease` (`id`),
  CONSTRAINT `es_article_push_ibfk_2` FOREIGN KEY (`dog_id`) REFERENCES `es_dog` (`id`),
  CONSTRAINT `es_article_push_ibfk_3` FOREIGN KEY (`creation_by`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_article_push
-- ----------------------------
INSERT INTO `es_article_push` VALUES ('1', '5', '1', '疾病1', '疾病的发病几率比较大', '疾病的发病几率比较大', '疾病的发病几率比较大', '2016-04-14', null, null, null);
INSERT INTO `es_article_push` VALUES ('5', '1', '1', '疾病2', '经年匆匆，一别十年，旧人，旧事，旧时', '经年匆匆，一别十年，旧人，旧事，旧时', '经年匆匆，一别十年，旧人，旧事，旧时', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('6', '2', '1', '疾病3', '说无关，算不算是，一种薄情？总觉得，那场盛大的别离，不', '说无关，算不算是，一种薄情？总觉得，那场盛大的别离，不', '说无关，算不算是，一种薄情？总觉得，那场盛大的别离，不', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('7', '3', '2', '疾病4', '几经辗转，几许沧桑，我们在迷茫之中彷徨又彷徨，在不安之中', '几经辗转，几许沧桑，我们在迷茫之中彷徨又彷徨，在不安之中', '几经辗转，几许沧桑，我们在迷茫之中彷徨又彷徨，在不安之中', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('8', '4', '3', '疾病5', '；恋人还是那个恋人，约誓由始至终。可惜太美的梦，就像绽放夜空中绚烂无比', '；恋人还是那个恋人，约誓由始至终。可惜太美的梦，就像绽放夜空中绚烂无比', '；恋人还是那个恋人，约誓由始至终。可惜太美的梦，就像绽放夜空中绚烂无比', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('9', '5', '3', '疾病6', '；恋人还是那个恋人，约誓由始至终。可惜太美的梦，就', '；恋人还是那个恋人，约誓由始至终。可惜太美的梦，就', '；恋人还是那个恋人，约誓由始至终。可惜太美的梦，就', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('10', '1', '4', '疾病7', '好似有人说，如此这般思绪，是多愁善感之人', '好似有人说，如此这般思绪，是多愁善感之人', '好似有人说，如此这般思绪，是多愁善感之人', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('11', '2', '3', '疾病8', '，有人天性悲悯，天性悲悯之人，习惯性的多愁，也', '，有人天性悲悯，天性悲悯之人，习惯性的多愁，也', '，有人天性悲悯，天性悲悯之人，习惯性的多愁，也', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('12', '2', '4', '疾病9', '因而，他们总会时不时的，将折叠', '因而，他们总会时不时的，将折叠', '因而，他们总会时不时的，将折叠', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('13', '1', '1', '疾病10', '此美好的种种，会被心灵的潮湿滋生出苔藓。已经失去的不可', '此美好的种种，会被心灵的潮湿滋生出苔藓。已经失去的不可', '此美好的种种，会被心灵的潮湿滋生出苔藓。已经失去的不可', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('14', '2', '2', '疾病11', '。原来，他们所有的忧郁，只是不想让那些如初的美好，最后', '。原来，他们所有的忧郁，只是不想让那些如初的美好，最后', '。原来，他们所有的忧郁，只是不想让那些如初的美好，最后', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('15', '3', '3', '疾病12', '没有人看到，他们把自己放任到过往云烟里，似孤雁飘萍不定，', '没有人看到，他们把自己放任到过往云烟里，似孤雁飘萍不定，', '没有人看到，他们把自己放任到过往云烟里，似孤雁飘萍不定，', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('16', '4', '4', '疾病13', '我们不只是想安慰一颗旧念不忘之心，我们更想安暖自己，这一', '我们不只是想安慰一颗旧念不忘之心，我们更想安暖自己，这一', '我们不只是想安慰一颗旧念不忘之心，我们更想安暖自己，这一', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('17', '1', '1', '疾病14', ' 好久是多久，或许是几年岁月，或', ' 好久是多久，或许是几年岁月，或', ' 好久是多久，或许是几年岁月，或', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('18', '2', '1', '疾病15', '是哪个老地方，能再次重逢，互道一句温暖话语，如相识般真诚而纯粹；', '是哪个老地方，能再次重逢，互道一句温暖话语，如相识般真诚而纯粹；', '是哪个老地方，能再次重逢，互道一句温暖话语，如相识般真诚而纯粹；', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('19', '3', '3', '疾病16', '岁月流经里，比之温心暖意的熟眼相对，', '岁月流经里，比之温心暖意的熟眼相对，', '岁月流经里，比之温心暖意的熟眼相对，', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('20', '1', '1', '疾病17', '出责怨。还记得那时，老师总会挑选学生', '出责怨。还记得那时，老师总会挑选学生', '出责怨。还记得那时，老师总会挑选学生', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('21', '2', '2', '疾病18', '不得不坦诚，我是极其紧张的，现在再回忆，我想我应该谢谢讲台上面那一张小小讲桌，是它挡住了我颤抖地双腿，使我的', '不得不坦诚，我是极其紧张的，现在再回忆，我想我应该谢谢讲台上面那一张小小讲桌，是它挡住了我颤抖地双腿，使我的', '不得不坦诚，我是极其紧张的，现在再回忆，我想我应该谢谢讲台上面那一张小小讲桌，是它挡住了我颤抖地双腿，使我的', null, null, null, null);
INSERT INTO `es_article_push` VALUES ('22', '3', '3', '疾病192233', '我们的相识，只是仅此，当我再细细回想时，我未曾清晰记得，', '我们的相识，只是仅此，当我再细细回想时，我未曾清晰记得，', '我们的相识，只是仅此，当我再细细回想时，我未曾清晰记得，', null, null, null, null);

-- ----------------------------
-- Table structure for es_disease
-- ----------------------------
DROP TABLE IF EXISTS `es_disease`;
CREATE TABLE `es_disease` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '疾病名',
  `alias` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT '疾病描述',
  `crificality` tinyint(4) DEFAULT NULL COMMENT '危险程度',
  `solution` varchar(500) DEFAULT NULL COMMENT '解决方案',
  `frequency` int(10) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `createdBy` int(11) unsigned DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `lastUpdatedBy` int(11) DEFAULT NULL,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  `attribute3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`),
  CONSTRAINT `es_disease_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_disease
-- ----------------------------
INSERT INTO `es_disease` VALUES ('1', '肠炎', null, '主要是由于犬觅食了腐败或污染的食物，或者误食了毒饵、刺激性药物、异物等，还可能是由于继发于某些传染病、寄生虫病。', '1', '\"（1）食物疗法 应禁食24小时，只给少量饮水，之后可喂给糖盐水米汤（每100毫升米汤中加入食盐1克，多维葡萄糖10克），或给以肉汤、淀粉糊、牛奶、豆浆等，然后逐步变稠，直至完全恢复正常饮食为止。', null, '2016-03-03 15:28:34', '1', '2016-03-03 15:28:42', '1', null, null, null);
INSERT INTO `es_disease` VALUES ('2', '肺炎', null, '犬肺炎是细支气管和肺的急性或慢性炎症。通常老龄和幼年犬易发，多发生在晚秋、冬季和早春。', '2', '（2）清理胃肠 应使用缓泻剂如硫酸钠、人工盐适量内服。; s, |8 o! L  f3 m, @, @) |6 ]', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease` VALUES ('3', '食物中毒', null, '犬吃了腐败变质、发馊的食品、臭肉、臭鱼和酸奶等，容易发生食物中毒。在腐败变质发馊的食物中，常污染有多种细菌，如葡萄球菌、沙门氏杆菌、肉毒梭菌等，尤以前两种菌污染最多见。', '4', '（3）消炎止泻 用黄连素0.1-0.5克/千克体重，每日三次给病犬内服。磺胺脒0.1-0.3克/千克体重，分2-3次内服；酞酰磺胺噻唑0.1-0.3克/千克体重，分3-4次内服；磺胺甲基异恶唑等。 抗生素可选用金霉素、土霉素以及氯霉素。 对非细菌性肠炎，当积粪已基本排除，粪便无酸臭味，但仍腹泻不止的病犬，应给予收敛药物以止泻，如活性炭0.5-2克，鞣酸蛋白0.5-2克，次硝酸铋0.3-1克，每日内服3次。* L- X- K( `\' T& u', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease` VALUES ('4', '犬细小病毒病 ', null, '本病是犬的一种急性传染病。临床上多以出血性肠炎或非化脓性心肌炎为其主要特征。有时其感染率可高达100％，致死率为10一50％。', '1', '（4）强心补液 为了防止脱水与电解质失调，应给予病犬静脉滴注射林格尔氏液100-500毫升，维生素C100-500毫克，25%葡萄糖液20毫升，每日静脉滴注1-2次，也可静脉滴注乳酸复方氯化钠溶液。# A0 L5 P1 Z! w, Z) u7 M( U', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease` VALUES ('5', '湿疹', null, '第一，经常受到各种因素的刺激，如潮湿、昆虫的刺螫及污物的刺激。 .    第二，饲养管理条件与病的发生也有密切关系，尤其是鱼类的不饱和脂肪酸与湿疹的发生关系很大，过多地摄入碳水化合物更易发生湿疹．气温较高、湿度较大的季节发病也多。我国以夏、秋两季，尤以5～9月份发病最多。 C! ?6 _0 b: I  y+ M', '1', '（5）对症治疗 可补给维生素B、维生素C和维生素K，特别是排血便的病犬，应补给维生素K。', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease` VALUES ('6', '营养性皮肤病 ', null, '', '2', '\"', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease` VALUES ('7', '风湿症', null, '风湿症是常呈反复发作的一种急性或慢性非化脓性炎症；以肌肉、关节、心脏为其多发的部位。犬较多发', '3', '\"首先要诊断病因，针对病因治疗是最根本的治疗方法。如细菌性肺炎用抗生素或磺胺类药物治疗，真菌性肺炎用两性霉素B治疗，每公斤体重1.8毫克，加入5%葡萄糖溶液中，静脉注射，7天为一个疗程，间7天后再进行下一个疗程。寄生虫性肺炎选用驱虫药物治疗。', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease` VALUES ('8', '角膜炎', null, ' 犬的角膜炎通常系由外伤或异物所致．在某些传染病和寄生虫病时也可发生', '2', '呼吸困难和心脏衰弱时，选用麻黄碱口服。每次5-15毫克。氨茶碱，每公斤体重10毫克，克服或静脉注射，每8小时一次。对于呼吸困难引起缺氧的，应给予氧气吸入。厌食者，给予静脉注射补充体液和营养。* R2 [( B) @7 G) x  A', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease` VALUES ('9', '结膜炎', null, '单纯结膜炎是由各种刺激所引起，如异物、鼻泪管闭塞、药物、外伤等因素。也可继发于各种传染病的经过中。', '1', '预防可打疫苗，如犬瘟热、犬腺病毒II型、犬副流感，以及支原体和支气管败血博氏杆菌疫苗等。', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for es_disease_symptom
-- ----------------------------
DROP TABLE IF EXISTS `es_disease_symptom`;
CREATE TABLE `es_disease_symptom` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `disease_id` int(11) unsigned NOT NULL,
  `symptom_id` int(11) unsigned NOT NULL,
  `cf` varchar(255) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `createdBy` int(11) unsigned DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `lastUpdatedBy` int(11) unsigned DEFAULT NULL,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  `attribute3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `symptom_id` (`symptom_id`),
  KEY `createdBy` (`createdBy`),
  KEY `lastUpdatedBy` (`lastUpdatedBy`),
  KEY `es_disease_symptom_ibfk_4` (`disease_id`),
  CONSTRAINT `es_disease_symptom_ibfk_1` FOREIGN KEY (`symptom_id`) REFERENCES `es_symptom` (`id`),
  CONSTRAINT `es_disease_symptom_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `user_user` (`id`),
  CONSTRAINT `es_disease_symptom_ibfk_3` FOREIGN KEY (`lastUpdatedBy`) REFERENCES `user_user` (`id`),
  CONSTRAINT `es_disease_symptom_ibfk_4` FOREIGN KEY (`disease_id`) REFERENCES `es_disease` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_disease_symptom
-- ----------------------------
INSERT INTO `es_disease_symptom` VALUES ('1', '1', '11', '15.0', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('2', '1', '12', '23.0', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('3', '1', '14', '20', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('4', '1', '15', '10', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('5', '1', '16', '10', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('6', '1', '17', '20', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('7', '2', '20', '30', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('8', '2', '21', '10', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('9', '2', '19', '20', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('10', '2', '17', '10', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('11', '2', '18', '30', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('12', '3', '13', '30', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('13', '3', '17', '15', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('14', '3', '22', '25', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('15', '3', '21', '20', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('16', '3', '23', '10', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('17', '4', '21', '25', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('18', '4', '13', '20', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('19', '4', '14', '15', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('20', '4', '25', '10', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('21', '4', '24', '30', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('22', '5', '27', '12', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('23', '5', '29', '32', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('24', '5', '28', '23', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('25', '5', '30', '23', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('26', '5', '26', '11', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('27', '5', '19', '24', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('28', '6', '30', '13', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('29', '6', '31', '11', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('30', '6', '32', '11', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('31', '6', '33', '44', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('32', '7', '26', '11', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('33', '7', '34', '23', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('34', '7', '35', '23', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('35', '7', '36', '23', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('36', '8', '37', '11', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('37', '8', '38', '44', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('38', '8', '41', '34', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('39', '8', '39', '12', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('40', '9', '37', '12', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('41', '9', '40', '23', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('42', '9', '41', '22', null, null, null, null, null, null, null, null);
INSERT INTO `es_disease_symptom` VALUES ('43', '1', '13', '2.0', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for es_dog
-- ----------------------------
DROP TABLE IF EXISTS `es_dog`;
CREATE TABLE `es_dog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  `attribute3` varchar(255) DEFAULT NULL,
  `attribute4` varchar(255) DEFAULT NULL,
  `attribute5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_dog
-- ----------------------------
INSERT INTO `es_dog` VALUES ('1', '哈士奇', null, '小型狗', null, null, null, null, null);
INSERT INTO `es_dog` VALUES ('2', '贵宾犬', null, '小型狗', null, null, null, null, null);
INSERT INTO `es_dog` VALUES ('3', '松狮', null, '小型狗', null, null, null, null, null);
INSERT INTO `es_dog` VALUES ('4', '吉娃娃', null, '小型狗', null, null, null, null, null);
INSERT INTO `es_dog` VALUES ('5', '藏獒', null, '大型狗', null, null, null, null, null);
INSERT INTO `es_dog` VALUES ('6', '北京犬', null, '小型狗', null, null, null, null, null);
INSERT INTO `es_dog` VALUES ('7', '迷你杜宾', null, '小型狗', null, null, null, null, null);

-- ----------------------------
-- Table structure for es_dog_pic
-- ----------------------------
DROP TABLE IF EXISTS `es_dog_pic`;
CREATE TABLE `es_dog_pic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_dog_pic
-- ----------------------------
INSERT INTO `es_dog_pic` VALUES ('5', '1', '11462376633468');
INSERT INTO `es_dog_pic` VALUES ('6', '1', '11462376756891');
INSERT INTO `es_dog_pic` VALUES ('7', '8', '81462409532947');
INSERT INTO `es_dog_pic` VALUES ('8', '8', '81462411777255');

-- ----------------------------
-- Table structure for es_judge_disease_log
-- ----------------------------
DROP TABLE IF EXISTS `es_judge_disease_log`;
CREATE TABLE `es_judge_disease_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `judge_id` int(11) unsigned DEFAULT NULL,
  `desease_id` int(11) unsigned DEFAULT NULL,
  `sumcf` double(255,0) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  `attribute3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `judge_id` (`judge_id`),
  KEY `desease_id` (`desease_id`),
  CONSTRAINT `es_judge_disease_log_ibfk_1` FOREIGN KEY (`judge_id`) REFERENCES `es_judge_log` (`id`),
  CONSTRAINT `es_judge_disease_log_ibfk_2` FOREIGN KEY (`desease_id`) REFERENCES `es_disease` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_judge_disease_log
-- ----------------------------
INSERT INTO `es_judge_disease_log` VALUES ('1', '6', '1', '50', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_disease_log` VALUES ('2', '6', '7', '46', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_disease_log` VALUES ('3', '6', '3', '45', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_disease_log` VALUES ('4', '6', '4', '45', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_disease_log` VALUES ('5', '6', '2', '10', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_disease_log` VALUES ('6', '7', '7', '46', null, '2016-04-11 16:16:44', null, null, null);
INSERT INTO `es_judge_disease_log` VALUES ('7', '7', '4', '35', null, '2016-04-11 16:16:44', null, null, null);
INSERT INTO `es_judge_disease_log` VALUES ('8', '7', '3', '20', null, '2016-04-11 16:16:44', null, null, null);
INSERT INTO `es_judge_disease_log` VALUES ('9', '7', '2', '10', null, '2016-04-11 16:16:44', null, null, null);

-- ----------------------------
-- Table structure for es_judge_log
-- ----------------------------
DROP TABLE IF EXISTS `es_judge_log`;
CREATE TABLE `es_judge_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `dog_id` int(11) unsigned DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `score` double(11,2) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `select_disease_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `dog_id` (`dog_id`),
  KEY `select_disease_id` (`select_disease_id`),
  CONSTRAINT `es_judge_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`),
  CONSTRAINT `es_judge_log_ibfk_2` FOREIGN KEY (`dog_id`) REFERENCES `es_dog` (`id`),
  CONSTRAINT `es_judge_log_ibfk_3` FOREIGN KEY (`select_disease_id`) REFERENCES `es_disease` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_judge_log
-- ----------------------------
INSERT INTO `es_judge_log` VALUES ('6', '1', '1', '2016-04-11 16:16:09', null, '姐姐', null);
INSERT INTO `es_judge_log` VALUES ('7', '1', '1', '2016-04-11 16:16:44', null, 'fff', null);

-- ----------------------------
-- Table structure for es_judge_symptom_log
-- ----------------------------
DROP TABLE IF EXISTS `es_judge_symptom_log`;
CREATE TABLE `es_judge_symptom_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `judge_id` int(11) unsigned DEFAULT NULL,
  `symptom_id` int(11) unsigned DEFAULT NULL,
  `score` double(11,0) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  `attribute3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `judge_id` (`judge_id`),
  KEY `symptom_id` (`symptom_id`),
  CONSTRAINT `es_judge_symptom_log_ibfk_1` FOREIGN KEY (`judge_id`) REFERENCES `es_judge_log` (`id`),
  CONSTRAINT `es_judge_symptom_log_ibfk_2` FOREIGN KEY (`symptom_id`) REFERENCES `es_symptom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_judge_symptom_log
-- ----------------------------
INSERT INTO `es_judge_symptom_log` VALUES ('36', '6', '12', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('37', '6', '14', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('38', '6', '25', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('39', '6', '35', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('40', '6', '36', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('41', '6', '17', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('42', '6', '13', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('43', '6', '24', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('44', '6', '21', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('45', '6', '34', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('46', '6', '11', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('47', '6', '26', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('48', '6', '15', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('49', '6', '16', null, '2016-04-11 16:16:09', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('50', '7', '25', null, '2016-04-11 16:16:44', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('51', '7', '35', null, '2016-04-11 16:16:44', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('52', '7', '21', null, '2016-04-11 16:16:44', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('53', '7', '34', null, '2016-04-11 16:16:44', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('54', '7', '24', null, '2016-04-11 16:16:44', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('55', '7', '36', null, '2016-04-11 16:16:44', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('56', '7', '13', null, '2016-04-11 16:16:44', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('57', '7', '14', null, '2016-04-11 16:16:44', null, null, null);
INSERT INTO `es_judge_symptom_log` VALUES ('58', '7', '26', null, '2016-04-11 16:16:44', null, null, null);

-- ----------------------------
-- Table structure for es_symptom
-- ----------------------------
DROP TABLE IF EXISTS `es_symptom`;
CREATE TABLE `es_symptom` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '症状名',
  `alias` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT '症状描述',
  `level` tinyint(4) DEFAULT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `createdBy` int(11) unsigned DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `lastUpdatedBy` int(11) unsigned DEFAULT NULL,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  `attribute3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `createdBy` (`createdBy`),
  KEY `lastUpdatedBy` (`lastUpdatedBy`),
  CONSTRAINT `es_symptom_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `es_symptom` (`id`),
  CONSTRAINT `es_symptom_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `user_user` (`id`),
  CONSTRAINT `es_symptom_ibfk_3` FOREIGN KEY (`lastUpdatedBy`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_symptom
-- ----------------------------
INSERT INTO `es_symptom` VALUES ('1', '排粪异常', null, '排粪异常描述', '1', '0', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('2', '体温异常', null, '体温异常描述', '2', '0', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('3', '运动异常', null, '运动异常描述', '1', '0', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('4', '皮被异常', null, '皮被异常描述', '3', '0', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('5', '排尿异常', null, '排尿异常描述', '1', '0', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('6', '食欲异常', null, '食欲异常描述', '1', '0', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('7', '呼吸异常', null, '呼吸异常描述', '1', '0', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('8', '精神异常', null, '精神异常描述', '1', '0', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('9', '骨骼异常', null, '骨骼异常描述', '1', '0', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('10', '眼睛异常', null, '眼睛异常描述', '1', '0', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('11', '中等发热', null, '体温可高达38度-38.5度', '2', '2', '41', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('12', '粪便有粘液、血液和泡沫', null, null, '3', '1', '54', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('13', '呕吐', null, null, '4', '6', '39', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('14', '腹泻', null, null, '2', '1', '38', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('15', '眼球下陷', null, null, '3', '10', '17', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('16', '尿量减少', null, null, '5', '5', '30', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('17', '精神沉郁、嗜睡', null, null, '1', '8', '26', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('18', '高度发热', null, '病处体温升高40度以上，呈弛张热', '6', '2', '9', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('19', '厌食', null, null, '4', '6', '29', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('20', '咳嗽', null, null, '2', '7', '10', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('21', '呼吸困难', null, null, '3', '7', '29', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('22', '抽搐', null, null, '1', '3', '18', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('23', '严重的惊厥', null, null, '3', '8', '17', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('24', '可视粘膜苍白', null, null, '4', '10', '14', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('25', '心悸亢进', null, null, '3', '3', '17', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('26', '红肿变硬', null, null, '5', '4', '23', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('27', '皮肤表层发炎', null, null, '6', '4', '10', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('28', '丘疹', null, null, '7', '4', '16', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('29', '焦躁不安', null, null, '2', '8', '7', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('30', '脱毛', null, null, '4', '4', '10', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('31', '水肿', null, null, '5', '4', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('32', '皮屑增多', null, null, '3', '4', '6', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('33', '皮肤粗糙', null, null, '1', '4', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('34', '肌肉僵硬', null, null, '2', '4', '11', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('35', '行动不灵活', null, null, '3', '3', '17', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('36', '关节肿大', null, null, '3', '9', '26', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('37', '流泪', null, null, '2', '10', '6', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('38', '结膜潮红', null, null, '1', '10', '6', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('39', '角膜混浊', null, null, '2', '10', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('40', '结膜充血', null, null, '3', '10', '5', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('41', '羞明', null, null, '4', '10', '6', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('42', '1', null, '1', '1', '1', '1', null, null, null, null, null, null, null);
INSERT INTO `es_symptom` VALUES ('43', '1', null, '1', '1', '1', '1', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for es_user_dog
-- ----------------------------
DROP TABLE IF EXISTS `es_user_dog`;
CREATE TABLE `es_user_dog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dog_name` varchar(255) DEFAULT NULL,
  `dog_age` int(11) DEFAULT NULL,
  `dog_description` varchar(255) DEFAULT NULL,
  `dog_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `attrubute1` varchar(255) DEFAULT NULL,
  `attrubute2` varchar(255) DEFAULT NULL,
  `attrubute3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dog_id` (`dog_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `es_user_dog_ibfk_1` FOREIGN KEY (`dog_id`) REFERENCES `es_dog` (`id`),
  CONSTRAINT `es_user_dog_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_user_dog
-- ----------------------------
INSERT INTO `es_user_dog` VALUES ('1', '小一', '23', '这是我第一条狗', '1', '1', null, null, null);
INSERT INTO `es_user_dog` VALUES ('2', '小二', '11', '这是我第二条狗', '2', '1', null, null, null);
INSERT INTO `es_user_dog` VALUES ('3', '小三', '10', '狗2', '3', '1', null, null, null);
INSERT INTO `es_user_dog` VALUES ('4', '小四', '1', '这是第三条狗', '4', '1', null, null, null);
INSERT INTO `es_user_dog` VALUES ('5', '小五', '3', '哈哈狗', '5', '1', null, null, null);

-- ----------------------------
-- Table structure for sys_lov
-- ----------------------------
DROP TABLE IF EXISTS `sys_lov`;
CREATE TABLE `sys_lov` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lov_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sqlid` varchar(255) DEFAULT NULL,
  `text_field` varchar(255) DEFAULT NULL,
  `value_field` varchar(255) DEFAULT NULL,
  `attribution1` varchar(255) DEFAULT NULL,
  `attribution2` varchar(255) DEFAULT NULL,
  `attribution3` varchar(255) DEFAULT NULL,
  `attribution4` varchar(255) DEFAULT NULL,
  `attribution5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lov_name` (`lov_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_lov
-- ----------------------------
INSERT INTO `sys_lov` VALUES ('1', 'lov_role_name', '', 'com.xh.petdogexpert.sys.mapper.RoleMapper.queryRoles', 'roleName', 'id', null, null, null, null, null);
INSERT INTO `sys_lov` VALUES ('5', 'lov_user_status', '', '', '', '', null, null, null, null, null);
INSERT INTO `sys_lov` VALUES ('6', '44', '44', '234', '23', '23', null, null, null, null, null);
INSERT INTO `sys_lov` VALUES ('7', '22', '12', '12', '12', '12', null, null, null, null, null);
INSERT INTO `sys_lov` VALUES ('8', '12', '12', '1212', '2', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_lov_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_lov_item`;
CREATE TABLE `sys_lov_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lov_id` int(11) unsigned DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `attribution1` varchar(255) DEFAULT NULL,
  `attribution2` varchar(255) DEFAULT NULL,
  `attribution3` varchar(255) DEFAULT NULL,
  `attribution4` varchar(255) DEFAULT NULL,
  `attribution5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_lov_item
-- ----------------------------
INSERT INTO `sys_lov_item` VALUES ('1', null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('7', '5', '禁用', '-1', null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('8', '5', '未审核', '0', null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('9', '5', '正常', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `lastUpdatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `sys_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sys_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '用户模块', '', '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('2', '会员管理', 'user/member_manager', '1', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('3', '兽医管理', 'user/doctor_manager', '1', '3', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('4', '兽医审核', 'user/check_doctor', '1', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('5', '系统管理', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('6', '菜单管理', 'sys/menu_manager.html', '5', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('7', '用户管理', 'user/user_manager.html', '1', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('8', 'Lov设置', 'sys/lov_manager.html', '1', '5', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('9', '权限功能', 'sys/resource_manager.html', '5', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('10', '权限授予', 'user/role_resource.html', '5', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('11', '功能模块', 'expert/function.html', '0', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('12', '专家系统功能', 'expert/function.html', '11', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('13', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('14', '症状管理', 'expert/test.html', '11', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('15', '疾病管理', 'expert/result.html', '11', '1', null, null, null, null);

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT '0',
  `resource` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  `attribute3` varchar(255) DEFAULT NULL,
  `attribute4` varchar(255) DEFAULT NULL,
  `attribute5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  CONSTRAINT `sys_resource_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `sys_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', '0', '', '1', '权限控制', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('2', '1', '', '1', '用户模块', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('22', '2', 'user/user_manager.html', '1', '用户管理界面', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('23', '22', 'user/queryUsers', '', '用户查询', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('25', '22', 'user/addUpdateUser', '1', '用户新增编辑', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('26', '22', 'user/deleteUser', '', '用户删除', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('27', '23', 'user/getUser', '', '获取用户', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('28', '25', 'user/member_edit', '', '用户详细资料编辑', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('29', '1', '', '', '系统模块', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('30', '29', '', '', '权限资源', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('31', '30', 'resource/updateResource', '', '更新资源', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('32', '30', 'resource/queryResourcesTree', '', '获取资源', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('33', '0', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for user_member
-- ----------------------------
DROP TABLE IF EXISTS `user_member`;
CREATE TABLE `user_member` (
  `uid` int(11) unsigned NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dog_id` int(11) DEFAULT NULL,
  `dog_age` varchar(255) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  `attrubute1` varchar(255) DEFAULT NULL,
  `attrubute2` varchar(255) DEFAULT NULL,
  `attrubute3` varchar(255) DEFAULT NULL,
  `attrubute4` varchar(255) DEFAULT NULL,
  `attrubute5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  CONSTRAINT `user_member_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_member
-- ----------------------------
INSERT INTO `user_member` VALUES ('1', '12', '3', '123', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '系统管理员');
INSERT INTO `user_role` VALUES ('2', '系统用户');
INSERT INTO `user_role` VALUES ('3', '普通会员');
INSERT INTO `user_role` VALUES ('4', '兽医');

-- ----------------------------
-- Table structure for user_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `user_role_resource`;
CREATE TABLE `user_role_resource` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned DEFAULT NULL,
  `resource_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `user_role_resource_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`),
  CONSTRAINT `user_role_resource_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `sys_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role_resource
-- ----------------------------
INSERT INTO `user_role_resource` VALUES ('9', '3', '1');
INSERT INTO `user_role_resource` VALUES ('10', '3', '2');
INSERT INTO `user_role_resource` VALUES ('11', '3', '22');
INSERT INTO `user_role_resource` VALUES ('12', '3', '23');
INSERT INTO `user_role_resource` VALUES ('13', '3', '25');
INSERT INTO `user_role_resource` VALUES ('27', '1', '1');
INSERT INTO `user_role_resource` VALUES ('28', '1', '2');
INSERT INTO `user_role_resource` VALUES ('29', '1', '22');
INSERT INTO `user_role_resource` VALUES ('30', '1', '23');
INSERT INTO `user_role_resource` VALUES ('31', '1', '25');
INSERT INTO `user_role_resource` VALUES ('39', '4', '23');

-- ----------------------------
-- Table structure for user_user
-- ----------------------------
DROP TABLE IF EXISTS `user_user`;
CREATE TABLE `user_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `age` int(11) unsigned DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `headurl` varchar(255) DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL COMMENT '权限',
  `status` tinyint(4) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_user
-- ----------------------------
INSERT INTO `user_user` VALUES ('1', 'admin', '88888888', '13', '一般一半11把', '497668869@qq.com', '1461205782043.jpg', '3', '1', '2016-05-03 22:06:35');
INSERT INTO `user_user` VALUES ('2', 'kid55', 'www', '12', '广州', 'qqq@xin.com', null, '4', '1', '2016-02-27 00:17:05');
INSERT INTO `user_user` VALUES ('3', 'per', '12345622222', '11', '线', '121@qq.com', null, '1', '1', '2016-02-12 01:00:33');
INSERT INTO `user_user` VALUES ('8', 'kid', '12345678', '13', '广州', '1231@qq.com', null, '1', '1', '2016-05-04 22:09:28');
INSERT INTO `user_user` VALUES ('15', 'qqqq', '12345678', null, null, null, null, null, '1', '2016-05-01 15:16:47');
INSERT INTO `user_user` VALUES ('16', 'fasq', '12345678', null, null, null, null, '1', '1', '2016-05-01 15:22:37');
INSERT INTO `user_user` VALUES ('19', 'q', '12345678', null, null, null, null, '1', '1', '2016-05-01 15:33:15');
INSERT INTO `user_user` VALUES ('20', 'w', '12345678', null, null, null, null, '1', '1', '2016-05-01 15:41:34');
INSERT INTO `user_user` VALUES ('23', '凌鸿', '12345678', '22', '华农', 'ds@163.com', null, null, '1', '2016-05-04 22:46:33');
INSERT INTO `user_user` VALUES ('24', 'kid123', 'wwwwwwww', null, null, null, null, '3', '1', '2016-05-04 23:07:19');
