/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : coushare

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-04-10 23:30:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `commentdate` date DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courseid` (`courseid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('3', '1', null, '陈楚平', '很有用', '2016-03-01', '201230560402');
INSERT INTO `comments` VALUES ('4', '2', null, '陈楚平', '学到了很多东西', '2016-02-25', '201230560402');
INSERT INTO `comments` VALUES ('5', '1', null, '岑思艺', '好有趣', '2016-03-01', '201230560401');
INSERT INTO `comments` VALUES ('37', '1', null, '郭志文', '资料非常不错', '2016-03-11', '201230560407');
INSERT INTO `comments` VALUES ('39', '3', null, '郭志文', '课程很实用', '2016-03-11', '201230560407');
INSERT INTO `comments` VALUES ('41', '2', null, '岑思艺', '老师很幽默', '2016-03-12', '201230560401');
INSERT INTO `comments` VALUES ('49', '2', null, '郭志文', '课程很好听', '2016-03-07', '201230560407');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccode` varchar(255) NOT NULL,
  `cname` varchar(80) NOT NULL,
  `definition` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `good` int(11) DEFAULT NULL,
  `cstate` varchar(30) DEFAULT NULL,
  `typeid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccode` (`ccode`) USING BTREE,
  KEY `typeid` (`typeid`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`typeid`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '11001', 'UML和模式应用', '统一建模语言是面向对象软件的标准化建模语言.', 'UML从考虑系统的不同角度出发，定义了用例图、类图、对象图、状态图、活动图、序列图、协作图、构件图、部署图等9种图。这些图从不同的侧面对系统进行描述。系统模型将这些不同的侧面综合成一致的整体，便于系统的分析和构造。', '', '16', '开课', '1');
INSERT INTO `course` VALUES ('2', '11002', '商务智能', '商业智能描述了一系列的概念和方法，通过应用基于事实的支持系统来辅助商业决策的制定。', '《商务智能》介绍了商务智能的基本概念、商务智能系统的架构以及数据仓库、OLAP，数据挖掘等核心技术，论述了商务智能在电子商务、移动商务、知识管理、Web挖掘、企业绩效管理和流程管理等领域的应用。为增强感性认识，配有许多实际案例，便于学生全面了解21世纪商务智能的实际应用情况。', '', '13', '开课', '1');
INSERT INTO `course` VALUES ('3', '11003', '管理信息系统', '管理信息系统是一个以人为主导，利用计算机硬件、软件、网络通信设备以及其他办公设备，进行信息的收集、传输、加工、储存、更新、拓展和维护的系统。', '管理信息由信息的采集、信息的传递、信息的储存、信息的加工、信息的维护和信息的使用六个方面组成。完善的管理信息系统MIS具有以下四个标准：确定的信息需求、信息的可采集与可加工、可以通过程序为管理人员提供信息、可以对信息进行管理', null, '10', '开课', '1');
INSERT INTO `course` VALUES ('4', '11004', '运筹学', '运筹学主要研究经济活动和军事活动中能用数量来表达的有关策划、管理方面的问题。', '运筹学的具体内容包括：规划论（包括线性规划、非线性规划、整数规划和动态规划）、库存论、图论、决策论、对策论、排队论、可靠性理论等。', null, '7', '开课', '1');
INSERT INTO `course` VALUES ('5', '11005', 'UNIX', 'UNIX操作系统(尤尼斯)，是一个强大的多用户、多任务操作系统，支持多种处理器架构，按照操作系统的分类，属于分时操作系统。', 'UNIX的系统结构可分为三部分：操作系统内核（是UNIX系统核心管理和控制中心，在系统启动或常驻内存），系统调用（供程序开发者开发应用程序时调用系统组件，包括进程管理，文件管理，设备状态等），应用程序（包括各种开发工具，编译器，网络通讯处理程序等，所有应用程序都在Shell的管理和控制下为用户服务）。', null, '10', '开课', '1');
INSERT INTO `course` VALUES ('6', '11006', '项目管理学', ' 项目管理是通过项目各方干系人的合作，把各种资源应用于项目，以实现项目的目标，满足项目干系人的需求。', '以项目生命周期结合项目管理职能为主线，全面系统地介绍现代项目管理的基本理论、原则、方法和技术，重点阐述项目从启动、开发、实施至结束整个过程所涉及的项目论证与评估、项目组织与项目团队、项目范围管理、项目进度管理、项目费用管理、项目质量管理、项目风险与冲突管理及项目的首尾与后评价等主要内容。', null, '0', '结课', '1');
INSERT INTO `course` VALUES ('7', '12001', '农业生产机械化', '指由劳动者操纵机器逐步代替人、\r\n\r\n畜力进行农业生产的农村经济发展过\r\n\r\n本书包括农业机械动力部分、田间作业冀管理机械部分、收获及其产后加工部分和现代农业先进技术、精细农业简介等。', '本书包括农业机械动力部分、田间作业冀管理机械部分、收获及其产后加工部分和现代农业先进技术、精细农业简介等。 本书包括农业机械动力部分、田间作业冀管理机械部分、收获及其产后加工部分和现代农业先进技术、精细农业简介等。', null, '8', '结课', '2');
INSERT INTO `course` VALUES ('8', '12002', '大学生心理健康教育', '本书在2004年版教材（获2008年山东省高等学校优秀教材二等奖）的基础上修订而成。', '本书以大学生心理素质的培养为主线，以提高大学生的心理素质为目的，以学生存在的主要心理问题为内容组织依据，力求通过通俗易懂的理论阐述，以促进学生的心理健康发展。全书重视实用性而非系统知识的传授，将重点放在心理健康知识的理解与运用上，目的在于提高大学生的自我调节和自我成长能力，并有助于他们社会能力、方法能力的形成。', null, '2', '结课', '2');
INSERT INTO `course` VALUES ('9', '12003', '创意与传播', '创意传播不仅是一种营销的策略，也不仅是一个做品牌传播的方法，它更是一个思想的改变。', '在一个信息泛滥、竞争白热化的时代，把握创意传播、运用创意传播就是营销致胜的关键所在。本书介绍了中国市场营销传播环境的最新变化，并根据当前的市场环境，提出了一套切实可行的营销传播策略，尤其着重阐释了创意营销传播的具体实践与应用。', null, '1', '结课', '2');
INSERT INTO `course` VALUES ('10', '12004', '佛学', '佛学：对释迦牟尼与佛陀学说的研究，主要集中在对于佛教经典的整理与注疏上。', '它有时被等同于现代的佛教研究，但通常使用在较传统的研究方法上。在不同佛教传统中，产生许多不同的学派。通常有两种研究方式，一种是考证，梳理式研究。一种是实证佛学所蕴含的深刻义理的领悟式研究。', null, '1', '开课', '2');
INSERT INTO `course` VALUES ('11', '12005', '土壤生物学', '主要研究土壤中各类生物的生命现象、相互关系、以及它们和土壤之间的相互关系的科学，是土壤学和生物学之间的一门交叉学科。', '土壤是地球外表的疏松部分，其组成常因各种因素（自然的和人为的）的影响而变化，主要由矿物质、 水、空气、有机质和生物等5部分组成。一般说来，矿物质所占的体积不到土壤体积的1/2，空气和水的体积约占土壤体积的1/2，孔隙和有机质一般占3～6%。生物所占的体积不到1%，但却是土壤的重要组成成分，是土壤肥力和作物生长必不可少的。', null, '2', '开课', '2');
INSERT INTO `course` VALUES ('12', '12006', '压花艺术', '压花艺术就是运用压制好的花材为创作艺术的基本材料。', '压花艺术（Pressed Flower Art）就是利用物理和化学方法，将植物材料包括根、茎、叶、花、果、树皮等经脱水、保色、压制和干燥处理而成平面花材，经过巧妙构思，制作成一幅幅精美的装饰画、卡片和生活日用品等植物制品的一门艺术。', null, '2', '开课', '2');
INSERT INTO `course` VALUES ('13', '13001', '软件工程', '软件工程是一门研究用工程化方法构建和维护有效的、实用的和高质量的软件的学科。', '在现代社会中，软件应用于多个方面。典型的软件有电子邮件、嵌入式系统、人机界面、办公套件、操作系统、编译器、数据库、游戏等。同时，各个行业几乎都有计算机软件的应用，如工业、农业、银行、航空、政府部门等。这些应用促进了经济和社会的发展，也提高了工作效率和生活效率 。', null, '1', '开课', '3');
INSERT INTO `course` VALUES ('14', '13002', 'JavaEE', 'JavaEE是一个开发分布式企业级应用的规范和标准。', 'Java语言的平台有3个版本：适用于小型设备和智能卡的JavaME（Java Platform Micro Edition，Java微型版）、适用于桌面系统的JavaSE（Java Platform Micro Edition，Java标准版）、适用于企业应用的JavaEE（Java Platform Enterprise Edition，Java企业版）。', null, '3', '结课', '3');
INSERT INTO `course` VALUES ('15', '13003', '企业组网', '从基础网络构建到企业常见服务应用，从局域网通信到Internet的访问', '采用“任务驱动”教学模式设计内容，以校园网的规划和建设过程为主线，按照工程需求设计系统，按照系统需要划分工程任务，按照任务需要介绍必备的知识并完成工程任务。', null, '5', '开课', '3');
INSERT INTO `course` VALUES ('16', '13004', '多媒体应用基础', '多媒体技术一般是指把动画、声音等。它的主要特点有实时性和交互性等。', '多媒体技术是一种把文本、图形、影像、动画和声音等形式的信息结合在一起，并通过计算机进行综合处理和控制，能支持、完成一系列交互式操作的信息技术。', null, '2', '开课', '3');
INSERT INTO `course` VALUES ('17', '13005', '建模与仿真', '在分析、研究、和预测系统中，必须要对系统抽象，建立仿真模型，通过相关软件，研究和改善系统', '本书特点是注重理论联系实际、突出工程实践内容和实用有效的建模方法。全书从定量和定性两个方面阐述了系统建模与仿真的基本原理、计算方法和本领域当前的先进技术。主要内容包括过程系统仿真的应用领域和进展，定量仿真建模常用方法及工业应用案例，数值积分原理、实用算法与计算程序等。', null, '2', '开课', '3');
INSERT INTO `course` VALUES ('18', '13006', '技术经济学', '技术经济学是一门，研究技术领域经济问题和经济规律，研究技术进步与经济增长之间的相互关系的科学。', '它是从经济角度研究在一定社会条件下的再生产过程中即将采用的各种技术措施和技术方案的经济效果的科学。技术经济学研究的主要目的是将技术更好地应用于经济建设，包括新技术和新产品的开发研制、各种资源的综合利用、发展生产力的综合论证。', null, '1', '开课', '3');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` varchar(37) NOT NULL,
  `pid` varchar(37) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('0', null, '首页', null, null);
INSERT INTO `menu` VALUES ('glzx', '0', '管理中心', null, null);
INSERT INTO `menu` VALUES ('jcxx', '0', '基础信息', null, null);
INSERT INTO `menu` VALUES ('kcgl', 'jcxx', '课程管理', null, '/background/baseMessage/courseList.jsp');
INSERT INTO `menu` VALUES ('kcrz', 'zytj', '课程认证', null, '/background/charts/courseAuth.jsp');
INSERT INTO `menu` VALUES ('lsgl', 'jcxx', '老师管理', null, '/background/baseMessage/teacherList.jsp');
INSERT INTO `menu` VALUES ('tjph', 'zytj', '统计排行', null, '/background/charts/charts.jsp');
INSERT INTO `menu` VALUES ('xsgl', 'jcxx', '学生管理', null, '/background/baseMessage/studentList.jsp');
INSERT INTO `menu` VALUES ('zhgl', 'glzx', '账号管理', null, '/background/admin/admin.jsp');
INSERT INTO `menu` VALUES ('zytj', '0', '资源统计', null, null);

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scode` varchar(255) NOT NULL,
  `sname` varchar(80) NOT NULL,
  `spassword` varchar(80) NOT NULL,
  `birth` date DEFAULT NULL,
  `sex` varchar(30) DEFAULT NULL,
  `enrolltime` date DEFAULT NULL,
  `college` varchar(80) DEFAULT NULL,
  `professional` varchar(80) DEFAULT NULL,
  `grade` varchar(30) DEFAULT NULL,
  `year` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `sstate` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scode` (`scode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '201230560401', '岑思艺', 'e10adc3949ba59abbe56e057f20f883e', '1993-07-15', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('2', '201230560402', '陈楚平', 'e10adc3949ba59abbe56e057f20f883e', '1993-03-02', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '12345874594', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('3', '201230560403', '陈显韬', 'e10adc3949ba59abbe56e057f20f883e', '1994-06-08', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('4', '201230560404', '陈学朋', 'e10adc3949ba59abbe56e057f20f883e', '1994-02-24', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('5', '201230560405', '方伟财', 'e10adc3949ba59abbe56e057f20f883e', '1993-07-16', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15918413192', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('6', '201230560406', '龚颖', 'e10adc3949ba59abbe56e057f20f883e', '1993-02-23', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15918532192', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('7', '201230560407', '郭志文', 'e10adc3949ba59abbe56e057f20f883e', '1993-10-07', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15918532192', '515505754@qq.com', '在校');
INSERT INTO `student` VALUES ('8', '201230560408', '胡姗', 'e10adc3949ba59abbe56e057f20f883e', '1993-02-19', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('9', '201230560409', '黄富', 'e10adc3949ba59abbe56e057f20f883e', '1993-02-10', '男', '2012-09-17', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('10', '201230560410', '黄庆光', 'e10adc3949ba59abbe56e057f20f883e', '1994-02-16', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('11', '201230560411', '黄泳珊', 'e10adc3949ba59abbe56e057f20f883e', '1993-02-17', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15624854126', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('12', '201230560412', '简舒蕾', 'e10adc3949ba59abbe56e057f20f883e', '1993-02-23', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587457', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('13', '201230560413', '李苑婷', 'e10adc3949ba59abbe56e057f20f883e', '1993-07-08', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587457', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('14', '201230560414', '梁国栋', 'e10adc3949ba59abbe56e057f20f883e', '1993-02-16', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('15', '201230560415', '梁悉如', 'e10adc3949ba59abbe56e057f20f883e', '1994-02-09', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('16', '201230560416', '廖文波', 'e10adc3949ba59abbe56e057f20f883e', '1994-02-11', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('17', '201230560417', '刘宝童', 'e10adc3949ba59abbe56e057f20f883e', '1993-06-16', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('18', '201230560418', '吕颖欣', 'e10adc3949ba59abbe56e057f20f883e', '1993-02-06', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('19', '201230560419', '欧煌益', 'e10adc3949ba59abbe56e057f20f883e', '1994-02-10', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('20', '201230560420', '苏俊朗', 'e10adc3949ba59abbe56e057f20f883e', '1993-02-09', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('23', '201230560421', '田家升', 'e10adc3949ba59abbe56e057f20f883e', '1993-03-09', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '14596587452', '15841584@qq.com', '在校');
INSERT INTO `student` VALUES ('35', '201230560422', '涂宝妮', 'e10adc3949ba59abbe56e057f20f883e', '1993-09-08', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15915448965', '511659886@qq.com', '在校');
INSERT INTO `student` VALUES ('36', '201230560423', '温燕娜', 'e10adc3949ba59abbe56e057f20f883e', '1993-09-08', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15915448965', '511659887@qq.com', '在校');
INSERT INTO `student` VALUES ('37', '201230560424', '吴晓艳', 'e10adc3949ba59abbe56e057f20f883e', '1993-09-08', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15915448965', '511659888@qq.com', '在校');
INSERT INTO `student` VALUES ('38', '201230560425', '余尚发', 'e10adc3949ba59abbe56e057f20f883e', '1993-09-08', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15915448965', '511659889@qq.com', '在校');
INSERT INTO `student` VALUES ('39', '201230560426', '曾智辉', 'e10adc3949ba59abbe56e057f20f883e', '1993-09-08', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15915448965', '511659890@qq.com', '在校');
INSERT INTO `student` VALUES ('40', '201230560427', '詹武槟', 'e10adc3949ba59abbe56e057f20f883e', '1993-09-08', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15915448965', '511659891@qq.com', '在校');
INSERT INTO `student` VALUES ('41', '201230560428', '张普旭', 'e10adc3949ba59abbe56e057f20f883e', '1993-09-08', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15915448965', '511659892@qq.com', '在校');
INSERT INTO `student` VALUES ('42', '201230560429', '郑垂柳', 'e10adc3949ba59abbe56e057f20f883e', '1993-09-08', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15915448965', '511659893@qq.com', '在校');
INSERT INTO `student` VALUES ('43', '201230560430', '周宏坚', 'e10adc3949ba59abbe56e057f20f883e', '1993-09-08', '男', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15915448965', '511659894@qq.com', '在校');
INSERT INTO `student` VALUES ('44', '201230560431', '周慧琪', 'e10adc3949ba59abbe56e057f20f883e', '1993-09-08', '女', '2012-09-01', '数学与信息学院', '信息管理与信息系统', '4', '4', '15915448965', '511659895@qq.com', '在校');

-- ----------------------------
-- Table structure for `tcrelation`
-- ----------------------------
DROP TABLE IF EXISTS `tcrelation`;
CREATE TABLE `tcrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `cid` (`cid`),
  CONSTRAINT `tcrelation_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`id`),
  CONSTRAINT `tcrelation_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tcrelation
-- ----------------------------
INSERT INTO `tcrelation` VALUES ('1', '1', '1');
INSERT INTO `tcrelation` VALUES ('2', '1', '2');
INSERT INTO `tcrelation` VALUES ('3', '1', '3');
INSERT INTO `tcrelation` VALUES ('4', '1', '4');
INSERT INTO `tcrelation` VALUES ('5', '1', '5');
INSERT INTO `tcrelation` VALUES ('6', '2', '9');
INSERT INTO `tcrelation` VALUES ('7', '2', '6');
INSERT INTO `tcrelation` VALUES ('8', '2', '7');
INSERT INTO `tcrelation` VALUES ('9', '3', '14');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tcode` varchar(255) NOT NULL,
  `tname` varchar(80) NOT NULL,
  `tpassword` varchar(80) NOT NULL,
  `birth` date DEFAULT NULL,
  `sex` varchar(30) DEFAULT NULL,
  `employmentdate` date DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `college` varchar(80) DEFAULT NULL,
  `tstate` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tcode` (`tcode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '101001', '老师11', 'e10adc3949ba59abbe56e057f20f883e', '1976-02-09', '男', '2000-02-09', '13554128467', '15841565@qq.com', '数学与信息学院', '在职');
INSERT INTO `teacher` VALUES ('2', '101002', '老师12', 'e10adc3949ba59abbe56e057f20f883e', '1984-11-28', '男', '2000-03-23', '13554128467', '15841565@qq.com', '数学与信息学院', '在职');
INSERT INTO `teacher` VALUES ('3', '101003', '老师13', 'e10adc3949ba59abbe56e057f20f883e', '1989-11-23', '男', '2000-04-28', '13554128467', '15841565@qq.com', '数学与信息学院', '在职');
INSERT INTO `teacher` VALUES ('4', '101004', '老师14', 'e10adc3949ba59abbe56e057f20f883e', '1983-06-15', '男', '2000-05-18', '13554128467', '15841565@qq.com', '数学与信息学院', '在职');
INSERT INTO `teacher` VALUES ('5', '101005', '老师15', 'e10adc3949ba59abbe56e057f20f883e', '1987-11-26', '女', '2000-06-28', '13554128467', '15841565@qq.com', '数学与信息学院', '离职');
INSERT INTO `teacher` VALUES ('6', '101006', '老师16', 'e10adc3949ba59abbe56e057f20f883e', '1988-10-25', '男', '2000-06-29', '13554128467', '15841565@qq.com', '数学与信息学院', '在职');
INSERT INTO `teacher` VALUES ('7', '101007', '老师17', 'e10adc3949ba59abbe56e057f20f883e', '1983-05-09', '女', '2000-11-23', '13554128467', '15841565@qq.com', '数学与信息学院', '在职');
INSERT INTO `teacher` VALUES ('8', '101008', '老师18', 'e10adc3949ba59abbe56e057f20f883e', '1984-11-23', '女', '2001-02-28', '13554128467', '15841565@qq.com', '数学与信息学院', '离职');
INSERT INTO `teacher` VALUES ('9', '102001', '老师21', 'e10adc3949ba59abbe56e057f20f883e', '1978-11-22', '男', '2000-03-12', '13554128467', '15841565@qq.com', '工程学院', '在职');
INSERT INTO `teacher` VALUES ('10', '102002', '老师22', 'e10adc3949ba59abbe56e057f20f883e', '1988-02-18', '女', '2000-05-27', '13554128467', '15841565@qq.com', '工程学院', '在职');
INSERT INTO `teacher` VALUES ('11', '102003', '老师23', 'e10adc3949ba59abbe56e057f20f883e', '1986-07-23', '男', '2000-06-28', '13554128467', '15841565@qq.com', '工程学院', '在职');
INSERT INTO `teacher` VALUES ('12', '102004', '老师24', 'e10adc3949ba59abbe56e057f20f883e', '1983-06-15', '男', '2000-07-08', '13554128467', '15841565@qq.com', '工程学院', '在职');
INSERT INTO `teacher` VALUES ('13', '102005', '老师25', 'e10adc3949ba59abbe56e057f20f883e', '1981-03-12', '男', '2000-12-28', '13554128467', '15841565@qq.com', '工程学院', '在职');
INSERT INTO `teacher` VALUES ('14', '102006', '老师26', 'e10adc3949ba59abbe56e057f20f883e', '1977-10-26', '男', '2001-04-28', '13554128467', '15841565@qq.com', '工程学院', '离职');
INSERT INTO `teacher` VALUES ('15', '102007', '老师27', 'e10adc3949ba59abbe56e057f20f883e', '1978-11-17', '女', '2001-05-26', '13554128467', '15841565@qq.com', '工程学院', '在职');
INSERT INTO `teacher` VALUES ('16', '102008', '老师28', 'e10adc3949ba59abbe56e057f20f883e', '1975-07-17', '男', '2001-07-15', '13554128467', '15841565@qq.com', '工程学院', '在职');
INSERT INTO `teacher` VALUES ('17', '101009', '老师19', 'e10adc3949ba59abbe56e057f20f883e', '2016-02-15', '男', '2003-02-01', '13554128467', '15841565@qq.com', '工程学院', '离职');
INSERT INTO `teacher` VALUES ('18', '101010', '老师110', 'e10adc3949ba59abbe56e057f20f883e', '1982-09-06', '男', '2002-06-07', '13554128467', '15841565@qq.com', '数学与信息学院', '在职');
INSERT INTO `teacher` VALUES ('19', '101011', '老师111', 'e10adc3949ba59abbe56e057f20f883e', '1982-09-06', '男', '2003-06-08', '13554128467', '15841565@qq.com', '数学与信息学院', '在职');
INSERT INTO `teacher` VALUES ('20', '101012', '老师112', 'e10adc3949ba59abbe56e057f20f883e', '1982-09-06', '男', '2003-06-08', '13554128467', '15841565@qq.com', '数学与信息学院', '在职');
INSERT INTO `teacher` VALUES ('21', '101013', '老师113', 'e10adc3949ba59abbe56e057f20f883e', '1982-09-06', '男', '2003-06-15', '13554128467', '15841565@qq.com', '数学与信息学院', '在职');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(80) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '必修课', null);
INSERT INTO `type` VALUES ('2', '公共选修课', null);
INSERT INTO `type` VALUES ('3', '专业选修课', null);

-- ----------------------------
-- Table structure for `uploadfileinfo`
-- ----------------------------
DROP TABLE IF EXISTS `uploadfileinfo`;
CREATE TABLE `uploadfileinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FILENAME` varchar(255) DEFAULT NULL,
  `FILETYPE` varchar(255) DEFAULT NULL,
  `FILESIZE` varchar(255) DEFAULT NULL,
  `FILENEWNAME` varchar(255) DEFAULT NULL,
  `RECORDID` varchar(255) DEFAULT NULL,
  `RECORDCODE` varchar(255) DEFAULT NULL,
  `CREATETIME` date DEFAULT NULL,
  `LASTUPDATETIME` date DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `OPERATOR` varchar(255) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uploadfileinfo
-- ----------------------------
INSERT INTO `uploadfileinfo` VALUES ('34', 'ATM取款用例.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '13487', '1460039177749_101001_64169.docx', '11001', '101001', '2016-04-07', '2016-04-07', '101001', '101001', '13');
INSERT INTO `uploadfileinfo` VALUES ('35', 'UML综合性实验报告.doc', 'application/msword', '96256', '1460039183887_101001_39019.doc', '11001', '101001', '2016-04-07', '2016-04-07', '101001', '101001', '1');
INSERT INTO `uploadfileinfo` VALUES ('36', 'MIS课程设计教学大纲.doc', 'application/msword', '125440', '1460039194470_101001_98613.doc', '11001', '101001', '2016-04-07', '2016-04-07', '101001', '101001', '2');
INSERT INTO `uploadfileinfo` VALUES ('38', 'MIS课程设计模板.doc', 'application/msword', '159232', '1460039210753_101001_86294.doc', '11001', '101001', '2016-04-07', '2016-04-07', '101001', '101001', '3');
INSERT INTO `uploadfileinfo` VALUES ('39', 'ATM系统顺序图.jpg', 'image/jpeg', '46884', '1460039221833_101001_46516.jpg', '11001', '101001', '2016-04-07', '2016-04-07', '101001', '101001', '10');
INSERT INTO `uploadfileinfo` VALUES ('40', 'exp3领域模型.jpg', 'image/jpeg', '54288', '1460039273392_101001_78028.jpg', '11001', '101001', '2016-04-07', '2016-04-07', '101001', '101001', '7');
INSERT INTO `uploadfileinfo` VALUES ('41', '电信客户分类.doc', 'application/msword', '2924544', '1460039329802_101001_65145.doc', '11002', '101001', '2016-04-07', '2016-04-07', '101001', '101001', '5');
INSERT INTO `uploadfileinfo` VALUES ('42', '商务智能实验.zip', 'application/octet-stream', '2778748', '1460039330069_101001_85703.zip', '11002', '101001', '2016-04-07', '2016-04-07', '101001', '101001', '4');
INSERT INTO `uploadfileinfo` VALUES ('43', 'IT does not matter.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '14225', '1460039361177_101001_64029.docx', '11003', '101001', '2016-04-07', '2016-04-07', '101001', '101001', '1');
INSERT INTO `uploadfileinfo` VALUES ('44', 'MIS-联想.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '13872', '1460039361203_101001_77427.docx', '11003', '101001', '2016-04-07', '2016-04-07', '101001', '101001', '1');
INSERT INTO `uploadfileinfo` VALUES ('45', 'MIS信息化建设.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '15762', '1460039361274_101001_26066.docx', '11003', '101001', '2016-04-07', '2016-04-07', '101001', '101001', '2');
INSERT INTO `uploadfileinfo` VALUES ('46', '和光集团的管理变革.pdf', 'application/pdf', '334189', '1460039409951_101001_99748.pdf', '11003', '101001', '2016-04-07', '2016-04-07', '101001', '101001', '4');
INSERT INTO `uploadfileinfo` VALUES ('52', '毕业旅游项目WBS和WBSD.doc', 'application/msword', '54784', '1460039531675_101002_64676.doc', '11006', '101002', '2016-04-07', '2016-04-07', '101002', '101002', '6');
INSERT INTO `uploadfileinfo` VALUES ('53', '五_项目范围管理.ppt', 'application/vnd.ms-powerpoint', '594432', '1460039531696_101002_87927.ppt', '11006', '101002', '2016-04-07', '2016-04-07', '101002', '101002', '8');
INSERT INTO `uploadfileinfo` VALUES ('54', '七_项目成本管理IT.ppt', 'application/vnd.ms-powerpoint', '316928', '1460039541492_101002_64179.ppt', '11006', '101002', '2016-04-07', '2016-04-07', '101002', '101002', '12');
INSERT INTO `uploadfileinfo` VALUES ('55', '三_项目组织管理与项目经理.ppt', 'application/vnd.ms-powerpoint', '496128', '1460039541508_101002_73681.ppt', '11006', '101002', '2016-04-07', '2016-04-07', '101002', '101002', '1');
INSERT INTO `uploadfileinfo` VALUES ('56', '五_项目范围管理.ppt', 'application/vnd.ms-powerpoint', '594432', '1460039541564_101002_69578.ppt', '11006', '101002', '2016-04-07', '2016-04-07', '101002', '101002', '2');
INSERT INTO `uploadfileinfo` VALUES ('57', '旋耕机行业现状与发展趋势_杨正梅.caj', 'application/caj', '78109', '1460039667458_101002_58372.caj', '12001', '101002', '2016-04-07', '2016-04-07', '101002', '101002', '1');
INSERT INTO `uploadfileinfo` VALUES ('58', '旋耕机研究综述.caj', 'application/caj', '58703', '1460039667555_101002_74902.caj', '12001', '101002', '2016-04-07', '2016-04-07', '101002', '101002', '4');
INSERT INTO `uploadfileinfo` VALUES ('59', '旋耕机适用性评价方法研究_李宁.caj', 'application/caj', '1048058', '1460039667555_101002_62812.caj', '12001', '101002', '2016-04-07', '2016-04-07', '101002', '101002', '3');
INSERT INTO `uploadfileinfo` VALUES ('60', 'dwr.jar', 'application/octet-stream', '862426', '1460039853734_101003_55926.jar', '13002', '101003', '2016-04-07', '2016-04-07', '101003', '101003', '1');
INSERT INTO `uploadfileinfo` VALUES ('61', '实验报告模板.doc', 'application/msword', '32768', '1460039853738_101003_46688.doc', '13002', '101003', '2016-04-07', '2016-04-07', '101003', '101003', '1');
INSERT INTO `uploadfileinfo` VALUES ('62', '实验时间安排.doc', 'application/msword', '32768', '1460039853829_101003_22372.doc', '13002', '101003', '2016-04-07', '2016-04-07', '101003', '101003', '1');
