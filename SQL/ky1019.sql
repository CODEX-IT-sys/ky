/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.64-MariaDB : Database - ky
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ky` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ky`;

/*Table structure for table `ky_admin` */

DROP TABLE IF EXISTS `ky_admin`;

CREATE TABLE `ky_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `username` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '电话',
  `First_language` varchar(255) DEFAULT NULL COMMENT '本职语种',
  `ip` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'IP',
  `sign` varchar(255) DEFAULT NULL COMMENT '签名图片',
  `department_id` int(11) DEFAULT NULL COMMENT '所属部门',
  `job_id` int(11) DEFAULT NULL COMMENT '所属职位',
  `group_id` text COMMENT '所属项目',
  `action_arr` varchar(255) DEFAULT NULL COMMENT '读写权限',
  `menu_arr` tinytext COMMENT '菜单栏目',
  `report_arr` varchar(255) DEFAULT NULL COMMENT '报表栏目',
  `status` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '工作状态：0在职 1离职',
  `trainee` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '是否是实习生：0不是 1是',
  `entry_time` varchar(30) DEFAULT NULL COMMENT '入职时间',
  `dimission_time` varchar(30) DEFAULT NULL COMMENT '离职时间',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_admin` */

insert  into `ky_admin`(`id`,`name`,`username`,`password`,`email`,`phone`,`First_language`,`ip`,`sign`,`department_id`,`job_id`,`group_id`,`action_arr`,`menu_arr`,`report_arr`,`status`,`trainee`,`entry_time`,`dimission_time`,`create_time`,`update_time`,`delete_time`) values (1,'admin','超管','e10adc3949ba59abbe56e057f20f883e','admin@admin.com','13245678910',NULL,NULL,'/uploads/20200509/admin.png',4,1,NULL,NULL,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34','1,2,3,4,5,6,7,8,10,11,12,13',0,0,'2020-01-01',NULL,1578303092,1593325534,0),(2,'系统管理员','系统管理员','e10adc3949ba59abbe56e057f20f883e','root@ky.com','13245678910',NULL,NULL,'/uploads/20200509/系统管理员.png',4,1,NULL,NULL,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34','1,2,3,4,5,6,7,8,10,11,12,13',0,0,'2020-01-01',NULL,1578303092,1593741366,0),(3,'预排张三','预排人员','e10adc3949ba59abbe56e057f20f883e','ypzs@ky.com','13245678910','',NULL,'/uploads/20200509/ypzs.png',5,12,NULL,NULL,'2,3,33,14,16,20,23,24,34','',0,0,'2020-05-01','2020-07-27',1578303092,1598082910,0),(4,'翻译张三','翻译人员','e10adc3949ba59abbe56e057f20f883e','fyzs@ky.com','13245678910','CN-EN,EN-CN',NULL,'/uploads/20200509/fyzs.png',5,10,NULL,NULL,'2,3,33,14,15,17,18,19,20,21,23,24,34','',0,0,'2020-05-01','',1578303092,1598082919,0),(5,'后排张三','后排人员','e10adc3949ba59abbe56e057f20f883e','hy@ky.com','13245678910','',NULL,'/uploads/20200509/hpzs.png',5,13,NULL,NULL,'2,3,33,14,16,20,23,24,34','',0,0,'2020-05-01','',1578303092,1598082931,0),(6,'校对张三','校对人员','e10adc3949ba59abbe56e057f20f883e','jd@ky.com','13245678910','CN-EN,EN-CN',NULL,'/uploads/20200509/jdzs.png',5,11,NULL,NULL,'2,3,33,14,15,17,18,19,20,21,23,24,34','',0,0,'2020-05-01','',1578303092,1598082943,0),(7,'项目助理','项目助理','e10adc3949ba59abbe56e057f20f883e','xmzl@ky.com','13245678910',NULL,NULL,'/uploads/20200509/xmzl.png',2,7,NULL,NULL,'2,3,12,13,14,15,16,17,18,19,23,24,25','',0,0,'2020-05-01',NULL,1578303092,1597457907,1597457907),(8,'项目经理LG','项目经理','e10adc3949ba59abbe56e057f20f883e','xmjl@ky.com','13245678910','',NULL,'/uploads/20200509/xmjl.png',4,8,NULL,NULL,'2,3,5,33,12,13,14,15,16,17,18,19,20,21,22,23,24,25,32,34','6,7,8,10,11,12,13',0,0,'2020-05-01','',1578303092,1598082562,0),(9,'总经理','总经理','e10adc3949ba59abbe56e057f20f883e','zjl@ky.com','13245678910',NULL,NULL,'/uploads/20200509/zjl.png',4,9,NULL,NULL,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34','1,2,3,4,5,6,7,8,10,11,12,13',0,0,'2020-05-01',NULL,1578303092,1595410251,0),(10,'翻译李四','翻译人员','e10adc3949ba59abbe56e057f20f883e','fyls@ky.com','13245678910','CN-EN,EN-CN',NULL,'/uploads/20200509/fyls.png',5,10,NULL,NULL,'2,3,33,14,15,17,18,19,20,21,23,24,34','',0,0,'2020-05-01','',1578303092,1598082954,0),(11,'校对李四','校对人员','e10adc3949ba59abbe56e057f20f883e','jdls@ky.com','13245678910','CN-EN,EN-CN',NULL,'/uploads/20200509/jdls.png',5,11,NULL,NULL,'2,3,33,14,15,17,18,19,20,21,23,24,34','',0,0,'2020-05-01','',1578303092,1598082805,0),(12,'后排李四','后排人员','e10adc3949ba59abbe56e057f20f883e','hy@hy.com','13245678910','',NULL,'/uploads/20200509/hpls.png',5,13,NULL,NULL,'2,3,33,14,16,20,23,24,34','',0,0,'2020-05-01','',1578303092,1598082764,0),(13,'预排李四','预排人员','e10adc3949ba59abbe56e057f20f883e','ypls@ky.com','13245678910','',NULL,'/uploads/20200509/ypls.png',5,12,NULL,NULL,'2,3,33,14,16,20,23,24,34','',0,0,'2020-05-01','',1578303092,1598082743,0),(14,'翻译助理','翻译助理','e10adc3949ba59abbe56e057f20f883e','fyzl@ky.com','13245678910',NULL,NULL,'/uploads/20200509/fyzl.png',2,19,NULL,NULL,'2,3,14,16,23,24','',0,0,'2020-05-01',NULL,1578303092,1595818243,0),(15,'销售张三','销售经理','e10adc3949ba59abbe56e057f20f883e','sales@ky.com','13245678910',NULL,NULL,'/uploads/20200509/xszs.png',4,3,NULL,NULL,NULL,NULL,0,0,'2020-05-01',NULL,1578303092,1578375819,0),(16,'MichaelJackson',NULL,'e10adc3949ba59abbe56e057f20f883e','y@x.cn','13245678910','CN-DE,DE-CN',NULL,'/uploads/20200509/mk.png',5,10,NULL,NULL,'1,7,8,9,10,11','1',1,1,'2020-05-01','2020-06-29',1589441561,1597477414,0),(17,'scxzjl','市场行政经理','e10adc3949ba59abbe56e057f20f883e','y@x.cn','13245678910','',NULL,'',1,20,NULL,NULL,'1,2,4,5,6,7,8,9,10,11,12,26,27,28,29,31,32,30','1,2,3,4',0,0,'2020-06-01','',1591852132,1598262737,0),(18,'项目经理TJ','项目经理','e10adc3949ba59abbe56e057f20f883e','xmjl@ky.com','13245678910','',NULL,'/uploads/20200509/xmjl.png',4,8,NULL,NULL,'2,3,5,33,12,13,14,15,16,17,18,19,20,21,22,23,24,25,32,34','5,6,7,8,10,11,12,13',0,0,'2020-05-01','',1578303092,1598082540,0),(19,'市场助理ZM',NULL,'e10adc3949ba59abbe56e057f20f883e','SCZLZM@ky.com','12345678910','',NULL,'',1,2,NULL,NULL,'1,7,8,9,10,11','1,2,3,4',0,0,'2020-02-01','',1595902826,1595903720,0),(20,'市场助理LYX',NULL,'e10adc3949ba59abbe56e057f20f883e','SCZLLYX@ky.com','12345678910','',NULL,'',1,2,NULL,NULL,'1,7,8,9,10,11','1,2,3,4',0,0,'2020-02-01','',1595902892,1595903715,0),(21,'市场助理CR',NULL,'e10adc3949ba59abbe56e057f20f883e','SCZLCR@ky.com','12345678910','',NULL,'',1,2,NULL,NULL,'1,7,8,9,10,11','1,2,3,4',0,0,'2019-05-01','',1595902981,1595903709,0),(22,'项目助理SM',NULL,'e10adc3949ba59abbe56e057f20f883e','','','CN-EN,EN-CN',NULL,'',2,7,NULL,NULL,'2,3,33,12,13,14,15,16,17,18,19,23,24,25,34','',0,0,'2017-06-09','',1595906309,1598238025,0),(23,'项目助理ZYX',NULL,'e10adc3949ba59abbe56e057f20f883e','','','EN-CN,CN-EN',NULL,'',2,7,NULL,NULL,'2,3,33,12,13,14,15,16,23,24,25,34','',0,0,'2019-07-09','',1595906355,1599282651,0),(24,'项目助理ZJ',NULL,'e10adc3949ba59abbe56e057f20f883e','','','CN-EN,EN-CN',NULL,'',2,7,NULL,NULL,'2,3,33,12,13,14,15,16,17,18,19,23,24,25,34','',0,0,'2019-07-09','',1595906384,1598082641,0),(25,'项目助理XJY',NULL,'e10adc3949ba59abbe56e057f20f883e','','','CN-EN,EN-CN',NULL,'',2,7,NULL,NULL,'2,3,33,12,13,14,15,16,23,24,25,34','',0,0,'2019-09-12','',1595906435,1599277373,0),(26,'市场助理AL',NULL,'e10adc3949ba59abbe56e057f20f883e','al@ky.com','12345679890','',NULL,'',1,2,NULL,NULL,'1,7,8,9,10,11','1,2,3,4',0,0,'2019-07-01','',1596077953,1597218401,0),(27,'项目助理YYY',NULL,'e10adc3949ba59abbe56e057f20f883e','fdhasuidhfasi@dsa.com','12345678978','',NULL,'',2,7,NULL,NULL,NULL,NULL,0,0,'2020-08-22','',1598081652,1598082220,1598082220),(28,'HY',NULL,'e10adc3949ba59abbe56e057f20f883e','dasda@dasd.com','12345789789','CN-EN,EN-CN',NULL,'',6,4,NULL,NULL,NULL,NULL,0,0,'2018-09-22','',1598086373,1598086373,0),(29,'CJ',NULL,'e10adc3949ba59abbe56e057f20f883e','dsafa@dasda.com','12345678978','CN-EN,EN-CN',NULL,'',6,15,NULL,NULL,NULL,NULL,0,0,'2019-08-22','',1598086687,1598086687,0),(30,'CLL',NULL,'e10adc3949ba59abbe56e057f20f883e','dasfaf@dasd.com','12345678978','CN-EN,EN-CN',NULL,'',6,5,NULL,NULL,NULL,NULL,0,0,'2018-08-22','',1598086741,1598086741,0);

/*Table structure for table `ky_mk_contract` */

DROP TABLE IF EXISTS `ky_mk_contract`;

CREATE TABLE `ky_mk_contract` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Register_Date` int(11) DEFAULT NULL COMMENT '登记日期',
  `Update_Date` int(11) DEFAULT NULL COMMENT '更新时间',
  `Sales` varchar(255) DEFAULT NULL COMMENT '销售',
  `Attention` varchar(255) DEFAULT NULL COMMENT '客户联系人',
  `Department` varchar(255) DEFAULT NULL COMMENT '所在部门',
  `Company_Full_Name` varchar(255) DEFAULT NULL COMMENT '公司全称',
  `Company_Name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `Contract_Signer` varchar(255) DEFAULT NULL COMMENT '合同签订人（若不同于联系人）',
  `Signer_is_Department` varchar(255) DEFAULT NULL COMMENT '所在部门（若不同于联系人）',
  `Company_Address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `Country` varchar(255) DEFAULT NULL COMMENT '国家',
  `Mobile` varchar(255) DEFAULT NULL COMMENT '移动电话号码',
  `Telephone_Number` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `Email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `Company_Code` varchar(255) DEFAULT NULL COMMENT '公司编码',
  `Contract_Number` varchar(255) DEFAULT NULL COMMENT '合同编码',
  `Service` varchar(255) DEFAULT NULL COMMENT '服务',
  `Language` varchar(255) DEFAULT NULL COMMENT '语种',
  `Currency` varchar(255) DEFAULT NULL COMMENT '币种',
  `Unit_Price` varchar(255) DEFAULT NULL COMMENT '单价',
  `Units` varchar(255) DEFAULT NULL COMMENT '单位',
  `Sales_Forecasted` decimal(15,2) DEFAULT NULL COMMENT '预计销售额',
  `VAT_Rate` tinyint(4) DEFAULT NULL COMMENT '税率(%)',
  `Customer_VAT_No` varchar(255) DEFAULT NULL COMMENT '客户税号',
  `Customer_Address` varchar(255) DEFAULT NULL COMMENT '单位地址',
  `Customer_Phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `Customer_Bank` varchar(255) DEFAULT NULL COMMENT '开户银行',
  `Customer_Bank_Account` varchar(255) DEFAULT NULL COMMENT '银行账号',
  `Invoicing_Policy` varchar(255) DEFAULT NULL COMMENT '开票规则',
  `Account_Period` varchar(255) DEFAULT NULL COMMENT '账期（结算方式）',
  `NDA` varchar(255) DEFAULT NULL COMMENT '有无保密协议',
  `Effective_Date` int(11) DEFAULT NULL COMMENT '生效日期',
  `Expired_Date` int(11) DEFAULT NULL COMMENT '失效日期',
  `Remaining_Validity` varchar(20) DEFAULT NULL COMMENT '剩余有效期',
  `Contract_Status` varchar(20) DEFAULT NULL COMMENT '合同状态',
  `Contract_Recipient` varchar(255) DEFAULT NULL COMMENT '合同收件人',
  `Contract_Recipient_Address` varchar(255) DEFAULT NULL COMMENT '合同收件地址',
  `Remarks` text COMMENT '备注',
  `Subject_Company` varchar(255) DEFAULT NULL COMMENT '主体公司',
  `Subject_Company_VAT_ID` varchar(255) DEFAULT NULL COMMENT '主体公司税号',
  `Subject_Company_Address` varchar(255) DEFAULT NULL COMMENT '主体公司地址',
  `Subject_Company_Bank_Info` text COMMENT '主体银行信息',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_contract` */

insert  into `ky_mk_contract`(`id`,`Register_Date`,`Update_Date`,`Sales`,`Attention`,`Department`,`Company_Full_Name`,`Company_Name`,`Contract_Signer`,`Signer_is_Department`,`Company_Address`,`Country`,`Mobile`,`Telephone_Number`,`Email`,`Company_Code`,`Contract_Number`,`Service`,`Language`,`Currency`,`Unit_Price`,`Units`,`Sales_Forecasted`,`VAT_Rate`,`Customer_VAT_No`,`Customer_Address`,`Customer_Phone`,`Customer_Bank`,`Customer_Bank_Account`,`Invoicing_Policy`,`Account_Period`,`NDA`,`Effective_Date`,`Expired_Date`,`Remaining_Validity`,`Contract_Status`,`Contract_Recipient`,`Contract_Recipient_Address`,`Remarks`,`Subject_Company`,`Subject_Company_VAT_ID`,`Subject_Company_Address`,`Subject_Company_Bank_Info`,`Filled_by`,`delete_time`) values (1,20200821,20200821,'王青','Anna','市场部','上海光电医疗','上海光电','Anna','市场部','上海','中国','13971250771','181101228956','2243073108@qq.com','SHGD','C-SHGD20200821','翻译、排版','英译中','CNY','0.16','中文不计空',50000.00,0,'123456','上海','13197542111','','','专票','30天','Yes',20200615,20210614,'+242天','有效','Anna','上海','','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','市场助理LYX',0),(2,20200821,20200821,'陆','晓晓','销售部','九州医药有限公司','九州医药','','','湖北省武汉市武昌区','中国','12345678910','0274561234','xiaoxiao@jiuzhou.com','JZ','C-JZ20200821','翻译、排版','英译中、中译英','CNY','0.2、0.3','单词、页',0.00,6,'123456789541263','湖北省武汉市武昌区','12345678910','中国银行武汉分行','422544133655814233','专票','30','Yes',20200821,20210821,'+309天','有效','陆','湖北省武汉市武昌区','','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','市场助理ZM',0),(3,20200821,20200821,'王青','Kelly','注册部','华大智造基因','华大智造','Kelly','注册部','北京','中国','13971250771','','2243713108@qq.com','HDZZ','C-HDZZ20200821','翻译','英译中','人民币','0.22','',50000.00,6,'123','','','','','专票','30天内','Yes',20200615,20210614,'+242天','有效','Kelly','北京','','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','市场助理LYX',0),(4,20200824,20200824,'弓长','金磊','注册部','上海西禾医药有限公司','西禾','','','上海市静安区北京西路500号3层3003 室','中国','12345678910','','jinlei@xh.com','XH','C-XH20200824','翻译','英译中、中译英','人民币','0.15、0.20','中文字符数（不计空格）',0.00,6,'65845136845697','上海市静安区北京西路500号3层3003 室','021-36589425','中国银行上海分行','8863464564','专票','月结','Yes',20190702,20220701,'+624天','有效','金磊','上海市静安区北京西路500号3层3003 室','','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','市场助理AL',0),(5,20200827,20200827,'王青','Cherry','注册部','艾普强科技技术','艾普强','Cherry','注册部','上海','中国','13971250771','13971250771','224307108@qq.com','APQ','C-APQ20200827','翻译、排版','中译英，英译中','人民币','0.2','中文不计空',30000.00,6,'123456','上海','13971250771','','','专票','','',20200615,20210614,'+242天','有效','Cherry','上海','','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','scxzjl',0),(6,20200828,20200828,'刘新','张三','财务部','拜耳医药有限公司','拜耳','','','上海市','中国','12345678910','13722213456','zhangsan@baier.com','bayer','C-bayer20200828','翻译、排版','中译英、英译中、西班牙译中','EUR','0.08、0.1、0.18','单词、中文（不计空）',0.00,6,'12345678910','上海市','12345678910','中国银行','42547896332485656','专票','30','Yes',20190727,20210828,'+316天','有效','张三','上海市','','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','市场助理ZM',0),(7,20200901,20200901,'朱悦','Ally','RA','BEILANG医药有限公司','BEILANG','','','北京市朝阳区','中国','12345678910','123456789','Ally@BEILANG.com','BL','C-BL20200901','翻译、排版','中译英、英译中','欧元','0.38、0.26、20','中文（不计空格）、页',0.00,6,'4561230789456','北京市朝阳区','12345678910','中国银行','6451235578899663332','专票','7','Yes',20200830,20210901,'+320天','有效','Ally','北京市朝阳区','','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','市场助理ZM',0),(8,20200903,20200903,'王青','Bob','市场部','微创斯柯达','微创','Bob','市场部','上海市','中国','13971250771','18101228956','44301@qq.com','WC','C-WC20200903','翻译，排版','英译中','人民币','0.2，0.3','不计空，页',50000.00,6,'4654568417XU','上海','13971250771','','','专票','30天','Yes',20191211,20201210,'+56天','有效','Bob','上海','','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','scxzjl',0),(9,20200903,20200903,'朱悦','liyanchao','市场部','世尔科技医药有限公司','SHIER','','','上海市静安区','中国','12345678910','','liyanchao@shier.com','SE','C-SE20200903','翻译、排版','中译英、英译中','人民币','0.38、0.26','中文不计空、页',0.00,6,'45612378910','上海市静安区','12345678910','中国建设银行上海分行','645123789120','专票','30','Yes',20200807,20210903,'+323天','有效','liyanchao','','','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','admin',0),(10,20200904,20200904,'Amber','Sally','RA','RapiGEN INC','RapiGEN','','','Dongan-gu,Anyang-si, Gyeonggi-do, Republic of Korea','Korea','','','Sally@rapi.com','RPGI','C-RPGI20200904','Translate','EN-CN','USD','0.2','Word',0.00,0,'','','','','','PI','','Yes',20190909,20210908,'+328天','有效','','','','Codex Scientific (Shanghai) Co., Ltd.','567811238971244682',' Room 418, Da \'an Business Building, No.1 Anyuan Road, Jing \'an District, Shanghai','Name of Beneficiary: Codex Scientific (Shanghai) Co., Ltd.\r\nAccount No.: 31050174363600000395\r\n','市场助理AL',0),(11,20200904,20200904,'Zhu yue','Liu yi','registration department ','Jiuzhou Medical Equipment Co. LTD','Jiuzhou Medical','','','Chaoyang District of Beijing','China','1234567890','186456123','liuyi@jiuzhou.com','JZ','C-JZ20200904','Translation、Typesetting','China-English、English-China','CNY','0.36、0.28','Chinese without space、page',0.00,3,'4561237890','Chaoyang District of Beijing','12345467890','bank of china','645123789',' special invoice','30','Yes',20200907,20200907,'-39天','无效','liuyi','Chaoyang District of Beijing','','Beijing Codex Translation Co., Ltd.','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','市场助理ZM',0),(12,20200907,20200907,'王强','Sunny','注册部','高德美可没','高德美','Tiff','注册部','上海','中国','13971250771','','','GDM','C-GDM20200907','','','','','',0.00,0,'','','','','','','','Yes',20200422,20210421,'+188天','有效','','','','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','市场助理LYX',0),(13,20200910,20200910,'朱悦','王亮','市场部','九州医疗科技有限公司','九州医疗','','','湖北省武汉市武昌区','中国','12345678910','12345678910','wangliang@qq.com','JZ','C-JZ20200910','翻译、排版','CN-EN、EN-CN','人民币','0.38、0.28','中文字符数不计空格、页',0.00,6,'4561230789','湖北省武汉市武昌区','12345678910','中国银行武汉分行','654321987','专票','30','Yes',20200830,20210830,'+318天','有效','王亮','湖北省武汉市武昌区','','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','市场助理ZM',0),(14,20200911,20200911,'王青','Kino','注册部','武田药品','武田','Kino','注册部','上海','中国','123654','123654','2243@qq.com','WTYP','C-WTYP20200911','翻译','','人民币','','',50000.00,6,'','','','','','','','Yes',20200331,20210330,'+166天','有效','','','','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','市场助理LYX',0),(15,20200921,20200921,'朱悦','丽莎','研发部','新型药品研究所','药研所','','','北京市朝阳区','中国','12345678910','','lisa@yaoyansuo.com','YYS','C-YYS20200921','翻译、排版','英译中、中译英、日译中','人民币','0.28、0.36、0.48','中文字符不计空格、页',0.00,6,'45612378910','北京市朝阳区','12345678910','中国银行','654123789','专票','30','Yes',20200807,20210807,'+295天','有效','丽莎','北京市朝阳区','','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','市场助理ZM',0),(16,20200924,20200924,'朱悦','王佳','注册部','AABB医疗科技有限公司','AB医疗','','','上海市浦东新区','中国','12345610','','wangjia@aabb.com','AB','C-AB20200924','翻译、排版','中译英、英译中、日译中、德译中','欧元','0.238、0.168、0.188、0.188、10','中文字符不计控、页',0.00,6,'123456789123456789','上海市浦东新区','12345678910','中国银行','654321987','专票','30','Yes',20200807,20210807,'+295天','有效','王佳','','','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','市场助理ZM',0),(17,20200930,20200930,'王青','刘二','财务部','上海光电医疗器械有限公司','上海光电','','','上海市','中国','12345678910','','liuer@shanghaiguangdian.com','SHGD','C-SHGD20200930','翻译、排版','中译英、英译中','CNY','0.28、0.36','中文字符（不计空格）',0.00,6,'45612378910','上海市','12345678910','中国银行','654321987','专票','30','Yes',20200807,20210807,'+295天','有效','刘二','上海市','','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','市场助理ZM',0);

/*Table structure for table `ky_mk_customer` */

DROP TABLE IF EXISTS `ky_mk_customer`;

CREATE TABLE `ky_mk_customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Register_Date` int(11) DEFAULT NULL COMMENT '登记日期',
  `Update_Date` int(11) DEFAULT NULL COMMENT '更新时间',
  `Sales` varchar(255) DEFAULT NULL COMMENT '销售',
  `Attention` varchar(255) DEFAULT NULL COMMENT '客户联系人',
  `Department` varchar(255) DEFAULT NULL COMMENT '所在部门',
  `Company_Full_Name` varchar(255) DEFAULT NULL COMMENT '公司全称',
  `Company_Name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `Company_Address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `Country` varchar(255) DEFAULT NULL COMMENT '国家',
  `Position` varchar(255) DEFAULT NULL COMMENT '职位',
  `Mobile1` varchar(255) DEFAULT NULL COMMENT '移动电话号码1',
  `Mobile2` varchar(255) DEFAULT NULL COMMENT '移动电话号码2',
  `Office_Number1` varchar(255) DEFAULT NULL COMMENT '固定电话号码1',
  `Office_Number2` varchar(255) DEFAULT NULL COMMENT '固定电话号码2',
  `Email1` varchar(255) DEFAULT NULL COMMENT '邮箱1',
  `Email2` varchar(255) DEFAULT NULL COMMENT '邮箱2',
  `Status` varchar(255) DEFAULT NULL COMMENT '状态',
  `Link` varchar(255) DEFAULT NULL COMMENT '关联',
  `Company_Code` varchar(255) DEFAULT NULL COMMENT '公司编码',
  `Contract_Number` varchar(255) DEFAULT NULL COMMENT '合同编码',
  `Subject_Company` varchar(255) DEFAULT NULL COMMENT '主体公司',
  `Subject_Company_VAT_ID` varchar(255) DEFAULT NULL COMMENT '主体公司税号',
  `Subject_Company_Address` varchar(255) DEFAULT NULL COMMENT '主体公司地址',
  `Subject_Company_Bank_Info` text COMMENT '主体银行信息',
  `Remarks` text COMMENT '备注',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_customer` */

insert  into `ky_mk_customer`(`id`,`Register_Date`,`Update_Date`,`Sales`,`Attention`,`Department`,`Company_Full_Name`,`Company_Name`,`Company_Address`,`Country`,`Position`,`Mobile1`,`Mobile2`,`Office_Number1`,`Office_Number2`,`Email1`,`Email2`,`Status`,`Link`,`Company_Code`,`Contract_Number`,`Subject_Company`,`Subject_Company_VAT_ID`,`Subject_Company_Address`,`Subject_Company_Bank_Info`,`Remarks`,`Filled_by`,`delete_time`) values (1,20200821,20200821,'王青','Anna','市场部','上海光电医疗','上海光电','上海','中国','市场经理','13971250771','','02785412654','','2243073108@qq.com','','在职','','SHGD','C-SHGD20200821','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理LYX',0),(2,20200821,20200821,'王青','Bella','市场部','上海光电医疗','上海光电','上海','中国','市场助理','18101228956','','','','459874532@qq.com','','在职','','SHGD','C-SHGD20200821','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理LYX',0),(3,20200821,20200821,'陆','晓晓','销售部','九州医药有限公司','九州医药','湖北省武汉市武昌区','中国','销售','1235678910','','','','xiaoxiao@jiuzhou.com','','在职','','JZ','C-JZ20200821','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',0),(4,20200821,20200821,'陆','吴青','销售部','九州医药有限公司','九州医药','湖北省武汉市武昌区','中国','销售总监','1864561234','','','','wuqing@jiuzhou.com','','在职','','JZ','C-JZ20200821','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',0),(5,20200821,20200821,'陆','刘云','财务部','九州医药有限公司','九州医药','湖北省武汉市武昌区','中国','财务','13712345678','','','','liuyun@jiuzhou.com','','在职','','JZ','C-JZ20200821','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',0),(6,20200821,20200821,'王青','Kelly','注册部','华大智造基因','华大智造','北京','中国','注册经理','13971250771','','','','123@qq.com','','在职','','HDZZ','C-HDZZ20200821','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理LYX',0),(7,20200824,20200824,'弓长','金磊','注册部','上海西禾医药有限公司','西禾','上海市静安区北京西路500号3层3003 室','中国','RA','12345678910','','','','jinlei@xh.com','','在职','','XH','C-XH20200824','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理AL',0),(8,20200824,20200824,'弓长','唐爽','注册部','上海西禾医药有限公司','西禾','上海市静安区北京西路500号3层3003 室','中国','RA','13545678910','','','','tangshuang@xh.com','','在职','','XH','C-XH20200824','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理AL',0),(9,20200825,20200825,'弓长','侯晓','市场部','上海西禾医药有限公司','西禾','上海市静安区北京西路500号3层3003 室','中国','市场专员','15034678910','','','','houxiao@xh.com','','在职','','XH','C-XH20200824','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理AL',0),(10,20200825,20200825,'弓长','王科','财务部','上海西禾医药有限公司','西禾','上海市静安区北京西路500号3层3003 室','中国','财务经理','18912345678','','','','wangke@xh.com','','在职','','XH','C-XH20200824','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理AL',0),(11,20200827,20200827,'王青','Cherry','注册部','艾普强科技技术','艾普强','上海','中国','注册经理','13971250771','13085170805','13067107010','45977435','2243073108@qq.com','2584687123@qq.com','在职','','APQ','C-APQ20200827','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','scxzjl',0),(12,20200828,20200828,'弓长','金磊','注册部','上海西禾医药有限公司','西禾','上海市静安大V','','','','','','','','','在职','','XH','C-XH20200824','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理AL',0),(13,20200828,20200828,'刘新','张三','财务部','拜耳医药有限公司','拜耳','上海市','中国','销售','12345678910','','','','zhangsan@baier.com','','在职','','bayer','C-bayer20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',0),(14,20200828,20200828,'刘新','李四','注册部','拜耳医药有限公司','拜耳','上海市','中国','主管','1457896321','','','','lisi@baier.com','','在职','','bayer','C-bayer20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',0),(15,20200901,20200901,'朱悦','Ally','RA','BEILANG医药有限公司','BEILANG','北京市朝阳区','中国','部员','12345678910','','','','Ally@BEILANG.com','','在职','','BL','C-BL20200901','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',0),(16,20200901,20200901,'朱悦','cheng xue yi','RA','BEILANG医药有限公司','BEILANG','北京市朝阳区','中国','总监','13712345678','','','','chengxueyi@BEILANAG.com','','在职','','BL','C-BL20200901','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',0),(17,20200903,20200903,'王青','Bob','市场部','微创斯柯达','微创','上海市','中国','市场经理','13971250771','18101228956','423511','48545666','2243@qq.com','','在职','','WC','C-WC20200903','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','scxzjl',0),(18,20200903,20200903,'王青','Alan','市场部','微创斯柯达','微创','上海市','中国','市场助理','1236558475','12365478965','02147854441','02744456321','512444@qq.com','','在职','','WC','C-WC20200903','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','scxzjl',0),(19,20200903,20200903,'朱悦','liyanchao','市场部','世尔科技医药有限公司','SHIER','上海市静安区','中国','销售','12345678910','','','','liyanchao@shier.com','','在职','','SE','C-SE20200903','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','admin',0),(20,20200903,20200903,'朱悦','lili','市场部','世尔科技医药有限公司','SHIER','上海市静安区','中国','销售总监','18612345678','','','','lili@shier.com','','在职','','SE','C-SE20200903','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','admin',0),(21,20200904,20200904,'Amber','Sally','RA','RapiGEN INC','RapiGEN','Dongan-gu,Anyang-si, Gyeonggi-do, Republic of Korea','Korea','RA','','','','','Sally@rapi.com','','在职','','RPGI','C-RPGI20200904','Codex Scientific (Shanghai) Co., Ltd.','567811238971244682',' Room 418, Da \'an Business Building, No.1 Anyuan Road, Jing \'an District, Shanghai','Name of Beneficiary: Codex Scientific (Shanghai) Co., Ltd.\r\nAccount No.: 31050174363600000395\r\n','','市场助理AL',0),(22,20200904,20200904,'Zhu yue','Liu yi','registration department ','Jiuzhou Medical Equipment Co. LTD','Jiuzhou Medical','Chaoyang District of Beijing','China','Director','1234567890','186456123','','','liuyi@jiuzhou.com','','在职','','JZ','C-JZ20200904','Beijing Codex Translation Co., Ltd.','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','','市场助理ZM',0),(23,20200904,20200904,'Zhu yue','zhangsan','Marketing department ','Jiuzhou Medical Equipment Co. LTD','Jiuzhou Medical','Chaoyang District of Beijing','China','sale','137456123','','','','zhangsan@jiuzhou.com','','在职','','JZ','C-JZ20200904','Beijing Codex Translation Co., Ltd.','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','','市场助理ZM',0),(24,20200907,20200907,'王强','Sunny','注册部','高德美可没','高德美','上海','','','','','','','','','在职','','GDM','C-GDM20200907','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理LYX',0),(25,20200910,20200910,'朱悦','王亮','市场部','九州医疗科技有限公司','九州医疗','湖北省武汉市武昌区','中国','销售','12345678910','12345678910','027-12345678','','wangliang@qq.com','','在职','','JZ','C-JZ20200910','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',0),(26,20200910,20200910,'朱悦','吴秋','财务部','九州医疗科技有限公司','九州医疗','湖北省武汉市武昌区','中国','财务','12345678910','12345678910','027-78945612','','wuqiu@qq.com','','在职','','JZ','C-JZ20200910','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',0),(27,20200910,20200910,'朱悦','李四','市场部','九州医疗科技有限公司','九州医疗','湖北省武汉市武昌区','中国','总监','147852369','','','','lisi@qq.com','','在职','','JZ','C-JZ20200910','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',0),(28,20200911,20200911,'王青','Kino','注册部','武田药品','武田','上海','中国','经理','','','','','','','在职','','WTYP','C-WTYP20200911','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理LYX',0),(29,20200911,20200911,'王青','郑燕','注册部','武田药品','武田','上海','中国','经理','123654','123654','123654','123654','213@qq.com','123@qq.com','在职','','WTYP','C-WTYP20200911','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理LYX',0),(30,20200911,20200911,'王青','高妍','注册部','武田药品','武田','上海','中国','经理','456321','123654','1111','2222','789@qq.com','987@qq.com','在职','','WTYP','C-WTYP20200911','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理LYX',0),(31,20200921,20200921,'朱悦','丽莎','研发部','新型药品研究所','药研所','北京市朝阳区','中国','研究员','12345678910','','','','lisa@yaoyansuo.com','','在职','','YYS','C-YYS20200921','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','市场助理ZM',0),(32,20200921,20200921,'朱悦','吴一','销售部','新型药品研究所','药研所','北京市朝阳区','中国','销售经理','1456789230','','','','wuyi@yaoyansuo.com','','在职','','YYS','C-YYS20200921','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','市场助理ZM',0),(33,20200924,20200924,'朱悦','王佳','注册部','AABB医疗科技有限公司','AB医疗','上海市浦东新区','中国','职员','12345678910','','','','wnagjia@aabb.com','','在职','','AB','C-AB20200924','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',0),(34,20200924,20200924,'朱悦','陈一','注册部','AABB医疗科技有限公司','AB医疗','上海市浦东新区','这个','经理','12345678910','','','','chenyi@aabb.com','','在职','','AB','C-AB20200924','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',0),(35,20200930,20200930,'王青','刘二','财务部','上海光电医疗器械有限公司','上海光电','上海市','中国','总监','12345678910','','','','liuer@shanghaiguangdian.com','','在职','','SHGD','C-SHGD20200930','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',0);

/*Table structure for table `ky_mk_fapiao` */

DROP TABLE IF EXISTS `ky_mk_fapiao`;

CREATE TABLE `ky_mk_fapiao` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `Invoice_Number` varchar(255) DEFAULT NULL COMMENT '发票编号',
  `Company_Name` varchar(255) DEFAULT NULL COMMENT '客户公司',
  `Company` varchar(255) DEFAULT NULL COMMENT '主体公司',
  `Fapiao_Date` int(11) DEFAULT NULL COMMENT '开票日期',
  `Name` varchar(255) DEFAULT NULL COMMENT '名称',
  `VAT_ID` varchar(255) DEFAULT NULL COMMENT '税号',
  `Address` varchar(255) DEFAULT NULL COMMENT '单位地址',
  `Phone` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `Bank` varchar(255) DEFAULT NULL COMMENT '开户银行',
  `Bank_Account` varchar(255) DEFAULT NULL COMMENT '银行账户',
  `Fapiao_Amount` decimal(15,2) DEFAULT NULL COMMENT '开票金额',
  `Fapiao_Type` varchar(255) DEFAULT NULL COMMENT '开票类型',
  `PO_Number` varchar(255) DEFAULT NULL COMMENT 'PO号',
  `VAT` decimal(15,2) DEFAULT NULL COMMENT '增值税',
  `Remarks` text COMMENT '开票要求备注',
  `Invoice_Information` varchar(255) DEFAULT NULL COMMENT '开票信息',
  `Subject_Company_VAT_ID` varchar(255) DEFAULT NULL COMMENT '主体公司税号',
  `Subject_Company_Address` varchar(255) DEFAULT NULL COMMENT '主体公司地址',
  `Subject_Company_Bank_Info` varchar(255) DEFAULT NULL COMMENT '主体银行信息',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_fapiao` */

insert  into `ky_mk_fapiao`(`id`,`Invoice_Number`,`Company_Name`,`Company`,`Fapiao_Date`,`Name`,`VAT_ID`,`Address`,`Phone`,`Bank`,`Bank_Account`,`Fapiao_Amount`,`Fapiao_Type`,`PO_Number`,`VAT`,`Remarks`,`Invoice_Information`,`Subject_Company_VAT_ID`,`Subject_Company_Address`,`Subject_Company_Bank_Info`,`Filled_by`,`create_time`,`update_time`,`delete_time`) values (1,'I-AAAAA202007221','公司全称','北京科译翻译有限公司',NULL,NULL,'税号','中文地址',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1595399156,1595399156,0);

/*Table structure for table `ky_mk_feseability` */

DROP TABLE IF EXISTS `ky_mk_feseability`;

CREATE TABLE `ky_mk_feseability` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Assigned_Date` int(11) DEFAULT NULL COMMENT '委托日期',
  `Filing_Code` varchar(255) DEFAULT NULL COMMENT '文件编号',
  `Subject_Company` varchar(255) DEFAULT NULL COMMENT '主体公司',
  `Sales` varchar(255) DEFAULT NULL COMMENT '销售',
  `Attention` varchar(255) DEFAULT NULL COMMENT '客户联系人',
  `Department` varchar(255) DEFAULT NULL COMMENT '所在部门',
  `Company_Name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `Job_Name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `Pages` int(9) DEFAULT NULL COMMENT '页数',
  `Source_Text_Word_Count` int(9) DEFAULT NULL COMMENT '源语字数',
  `File_Type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `Service` varchar(255) DEFAULT NULL COMMENT '服务类型',
  `Language` varchar(255) DEFAULT NULL COMMENT '语种',
  `Currency` varchar(255) DEFAULT NULL COMMENT '币种',
  `Unit_Price` decimal(15,2) DEFAULT NULL COMMENT '单价',
  `Units` varchar(255) DEFAULT NULL COMMENT '单位',
  `Quote_Number` varchar(255) DEFAULT NULL COMMENT '报价单编码',
  `Quote_Quantity` decimal(15,2) DEFAULT NULL COMMENT '报价数量',
  `VAT_Rate` tinyint(4) DEFAULT NULL COMMENT '税率(%)',
  `VAT_Amount` decimal(15,2) DEFAULT NULL COMMENT '增值税额',
  `Quote_Amount` decimal(15,2) DEFAULT NULL COMMENT '报价金额',
  `Delivery_Date_Expected` varchar(255) DEFAULT NULL COMMENT '客户期望提交日期',
  `PM` varchar(50) DEFAULT NULL COMMENT '项目经理',
  `Completed` int(10) DEFAULT NULL COMMENT '交付日期',
  `Contract_Number` varchar(255) DEFAULT NULL COMMENT '合同编码',
  `First_Cooperation` varchar(10) DEFAULT NULL COMMENT '是否首次合作',
  `Customer_Requirements` text COMMENT '客户要求',
  `External_Reference_File` text COMMENT '客户参考文件',
  `Project_Requirements` varchar(10) DEFAULT NULL COMMENT '生成项目需求',
  `Request_a_Quote` varchar(10) DEFAULT NULL COMMENT '生成报价(是/否)',
  `Repeated_Document` varchar(10) DEFAULT NULL COMMENT '重复文件(是/否)',
  `Subject_Company_VAT_ID` varchar(255) DEFAULT NULL COMMENT '主体公司税号',
  `Subject_Company_Address` varchar(255) DEFAULT NULL COMMENT '主体公司地址',
  `Subject_Company_Bank_Info` text COMMENT '主体银行信息',
  `Remarks` text COMMENT '备注',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `Approval_Sales_Admin_Manager` varchar(255) DEFAULT NULL COMMENT '市场行政经理批准',
  `Approval_General_Manager` varchar(10) DEFAULT NULL COMMENT '总经理批准',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_feseability` */

insert  into `ky_mk_feseability`(`id`,`Assigned_Date`,`Filing_Code`,`Subject_Company`,`Sales`,`Attention`,`Department`,`Company_Name`,`Job_Name`,`Pages`,`Source_Text_Word_Count`,`File_Type`,`Service`,`Language`,`Currency`,`Unit_Price`,`Units`,`Quote_Number`,`Quote_Quantity`,`VAT_Rate`,`VAT_Amount`,`Quote_Amount`,`Delivery_Date_Expected`,`PM`,`Completed`,`Contract_Number`,`First_Cooperation`,`Customer_Requirements`,`External_Reference_File`,`Project_Requirements`,`Request_a_Quote`,`Repeated_Document`,`Subject_Company_VAT_ID`,`Subject_Company_Address`,`Subject_Company_Bank_Info`,`Remarks`,`Filled_by`,`Approval_Sales_Admin_Manager`,`Approval_General_Manager`,`delete_time`) values (1,20200827,'F-20200827APQ01','北京科译翻译有限公司','王青','Cherry','注册部','艾普强','[01-01]HATT-BYT(RC135-33) Specifications_ENG',18,1616,'PDF','翻译','EN-CN','CNY',0.24,'中文字符数（不计空格）','',5793.00,6,0.00,1473.74,'2020-08-27 18:00','项目经理TJ',20200827,'C-APQ20200827','No','','','是','Yes','No','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','scxzjl','Yes','Yes',0),(2,20200828,'F-20200828XH01','北京科译翻译有限公司','弓长','王科','财务部','西禾','说明书翻译',6,1685,'PDF','翻译','CN-EN','CNY',0.20,'中文字符数（不计空格）','Q-XH202008281',2000.00,6,0.00,400.00,'2020-08-31 23:00','项目经理TJ',NULL,'C-XH20200824','No','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理AL','Yes',NULL,0),(3,20200828,'F-20200828XH02','北京科译翻译有限公司','弓长','王科','财务部','西禾','文献部分内容翻译202007',3,810,'PDF','翻译','EN-CN','CNY',0.15,'中文字符数（不计空格）','Q-XH202008281',2500.00,6,0.00,375.00,'2020-08-31 23:00','项目经理TJ',NULL,'C-XH20200824','No','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理AL','Yes',NULL,0),(4,20200828,'F-20200828XH03','北京科译翻译有限公司','弓长','金磊','注册部','西禾','产品技术要求',10,5000,'PDF','翻译','EN-CN','CNY',0.15,'中文字符数（不计空格）','Q-XH202008282',15000.00,6,0.00,0.00,'','项目经理TJ',NULL,'C-XH20200824','No','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理AL','Yes',NULL,0),(5,20200831,'F-20200831bayer01','北京科译翻译有限公司','刘新','李四','注册部','拜耳','Word',10,1256,'PDF','翻译','EN-CN','EUR',0.10,'单词','Q-bayer202008282',1356.00,6,0.00,0.00,'20200830','项目经理TJ',NULL,'C-bayer20200828','Yes','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'admin','Yes',NULL,0),(6,20200831,'F-20200831bayer02','北京科译翻译有限公司','刘新','李四','注册部','拜耳','注册资料',20,4567,'PDF','翻译','CN-EN','EUR',0.08,'中文字符数（不计空格）','Q-bayer202008282',6789.00,6,0.00,0.00,'20200830','项目经理TJ',NULL,'C-bayer20200828','Yes','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'admin','Yes',NULL,0),(7,20200901,'F-20200901BL01','北京科译翻译有限公司','朱悦','cheng xue yi','RA','BEILANG','血液透析',46,12347,'PDF','排版','CN-EN','EUR',20.00,'页','Q-BL202009012',46.00,6,0.00,0.00,'2020-09-15 23:00','项目经理LG',NULL,'C-BL20200901','Yes','电子提交格式','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理ZM','Yes',NULL,0),(8,20200901,'F-20200901BL02','北京科译翻译有限公司','朱悦','cheng xue yi','RA','BEILANG','血液透析',46,12347,'PDF','翻译','CN-EN','EUR',0.38,'中文字符数（不计空格）','Q-BL202009012',13547.00,6,0.00,0.00,'2020-09-15 23:00','项目经理LG',NULL,'C-BL20200901','Yes','电子提交格式','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理ZM','Yes',NULL,0),(9,20200901,'F-20200901BL03','北京科译翻译有限公司','朱悦','Ally','RA','BEILANG','CHVI-356710_VP-48455-F1E-20200_MB-012',29,4568,'PDF','翻译','EN-CN','EUR',0.26,'中文字符数（不计空格）','Q-BL202009011',5696.00,6,0.00,0.00,'2020-09-05 23:00','项目经理LG',NULL,'C-BL20200901','Yes','电子提交格式','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理ZM','Yes',NULL,0),(10,20200903,'F-20200903HDZZ01','北京科译翻译有限公司','王青','Kelly','注册部','华大智造','1398-2-0007-00 MGISP-NE32 产品风险管',55,14656,'PDF','翻译','CN-EN','CNY',0.22,'中文字符数（不计空格）','',16399.00,6,0.00,3824.25,'2020-09-03 09:30','项目经理TJ',20200903,'C-HDZZ20200821','No','','','Yes','Yes','No','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理LYX','Yes',NULL,0),(11,20200903,'F-20200903HDZZ02','北京科译翻译有限公司','王青','Kelly','注册部','华大智造','错误场景V1.0_20200714',1,23094,'Excel','翻译','CN-EN','CNY',0.22,'中文字符数（不计空格）','Q-HDZZ202009032',26683.00,6,352.22,6222.48,'2020-09-03 10:00','项目经理TJ',20200903,'C-HDZZ20200821','No','','','No','Yes','No','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理LYX','Yes',NULL,0),(12,20200903,'F-20200903XH03','北京科译翻译有限公司','弓长','侯晓','市场部','西禾','宣传册翻译',10,5000,'PDF','翻译','EN-CN','CNY',0.15,'中文字符数（不计空格）','Q-XH202009034',15000.00,6,0.00,0.00,'2020-09-08 23:00','项目经理TJ',NULL,'C-XH20200824','No','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理AL','Yes',NULL,0),(13,20200903,'F-20200903XH04','北京科译翻译有限公司','弓长','唐爽','注册部','西禾','产品技术要求0903',5,1000,'PDF','翻译','EN-CN','CNY',0.15,'中文字符数（不计空格）','Q-XH202009035',3000.00,6,0.00,2385.00,'2020-09-07 23:00','项目经理TJ',NULL,'C-XH20200824','No','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理AL',NULL,NULL,0),(14,20200903,'F-20200903SE05','科医达商务咨询(上海)有限公司','朱悦','liyanchao','市场部','SHIER','Stopper_D000089723_Invoice',1,177,'PDF','翻译','EN-CN','CNY',0.26,'中文字符数（不计空格）','Q-SE202009032',245.00,6,0.00,0.00,'2020-09-07 23:00','项目经理LG',NULL,'C-SE20200903','No','','',NULL,'Yes',NULL,'567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										',NULL,'admin','Yes',NULL,0),(15,20200903,'F-20200903SE06','科医达商务咨询(上海)有限公司','朱悦','liyanchao','市场部','SHIER','NaOH_B1387282_Invoice',2,411,'PDF','翻译','EN-CN','CNY',0.26,'中文字符数（不计空格）','Q-SE202009032',563.00,6,0.00,0.00,'2020-09-07 23:00','项目经理LG',NULL,'C-SE20200903','No','','',NULL,'Yes',NULL,'567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										',NULL,'admin','Yes',NULL,0),(16,20200903,'F-20200903SE07','科医达商务咨询(上海)有限公司','朱悦','lili','市场部','SHIER','《化学药品非处方药上市注册技术指导原则（征求意见稿）》',9,3316,'PDF','翻译','CN-EN','CNY',0.38,'中文字符数（不计空格）','Q-SE202009033',3516.00,6,80.16,1416.24,'2020-09-10 23:00','项目经理LG',0,'C-SE20200903','No','','','','Yes','No','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','admin','Yes','',0),(17,20200904,'F-20200904SE01','科医达商务咨询(上海)有限公司','朱悦','liyanchao','市场部','SHIER','外包装翻译',4,300,'PDF','翻译','EN-CN','CNY',0.26,'中文字符数（不计空格）','Q-SE202009044',345.00,6,5.38,0.00,'2020-09-04 12:00','项目经理LG',20200904,'C-SE20200903','No','','','','Yes','No','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','市场助理ZM','Yes',NULL,0),(18,20200904,'F-20200904RPGI02','Codex Scientific (Shanghai) Co., Ltd.','Amber','Sally','RA','RapiGEN','labelling',1,67,'PDF','Translation','EN-CN','USD',0.20,'Words','Q-RPGI202009042',67.00,0,0.00,13.40,'','项目经理TJ',0,'C-RPGI20200904','Yes','','','Yes','Yes','No','567811238971244682',' Room 418, Da \'an Business Building, No.1 Anyuan Road, Jing \'an District, Shanghai','Name of Beneficiary: Codex Scientific (Shanghai) Co., Ltd.\r\nAccount No.: 31050174363600000395\r\n','','市场助理AL','Yes',NULL,0),(19,20200904,'F-20200904RPGI03','Codex Scientific (Shanghai) Co., Ltd.','Amber','Sally','RA','RapiGEN','Bank Charge',1,0,'','','','USD',50.00,'Project','Q-RPGI202009042',1.00,0,0.00,50.00,'','项目经理TJ',0,'C-RPGI20200904','Yes','','','No','Yes','No','567811238971244682',' Room 418, Da \'an Business Building, No.1 Anyuan Road, Jing \'an District, Shanghai','Name of Beneficiary: Codex Scientific (Shanghai) Co., Ltd.\r\nAccount No.: 31050174363600000395\r\n','','市场助理AL',NULL,NULL,0),(20,20200904,'F-20200904JZ04','Beijing Codex Translation Co., Ltd.','Zhu yue','Liu yi','registration department ','Jiuzhou Medical','Vayego bee semi-field study',5,682,'Word','Translation','CN-EN','CNY',0.36,'Chinese Characters (No space)','Q-JZ202009041',943.00,6,121.04,0.00,'2020-09-07 18:00','项目经理LG',NULL,'C-JZ20200904','No','','',NULL,'Yes',NULL,'681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ',NULL,'市场助理ZM',NULL,NULL,1599187051),(21,20200904,'F-20200904JZ05','Beijing Codex Translation Co., Ltd.','Zhu yue','Liu yi','registration department ','Jiuzhou Medical','DF-134419-RV04-Stellant PSUR',17,5642,'PDF','Translation','EN-CN','CNY',0.26,'Chinese Characters (No space)','Q-JZ202009041',6453.00,6,121.04,0.00,'2020-09-07 18:00','项目经理LG',NULL,'C-JZ20200904','No','','',NULL,'Yes',NULL,'681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ',NULL,'市场助理ZM',NULL,NULL,1599187049),(22,20200904,'F-20200904JZ06','Beijing Codex Translation Co., Ltd.','Zhu yue','Liu yi','registration department ','Jiuzhou Medical','Vayego bee semi-field study',5,682,'Word','Translation','CN-EN','CNY',0.36,'Chinese Characters (No space)','Q-JZ202009041',943.00,6,20.37,359.85,'2020-09-07 18:00','项目经理LG',20200907,'C-JZ20200904','No','','','','Yes','No','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','','市场助理ZM',NULL,NULL,1599207876),(23,20200904,'F-20200904JZ07','Beijing Codex Translation Co., Ltd.','Zhu yue','Liu yi','registration department ','Jiuzhou Medical','DF-134419-RV04-Stellant PSUR',17,5642,'PDF','Translation','EN-CN','CNY',0.26,'Chinese Characters (No space)','Q-JZ202009041',6453.00,6,100.67,1178.45,'2020-09-07 18:00','项目经理LG',20200907,'C-JZ20200904','No','','','','Yes','No','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','','市场助理ZM',NULL,NULL,1599207872),(24,20200904,'F-20200904JZ08','北京科译翻译有限公司','Zhu yue','Liu yi','registration department ','Jiuzhou Medical','Vayego bee semi-field study',5,682,'Word','翻译','CN-EN','CNY',0.36,'中文字符数（不计空格）','Q-JZ202009041',943.00,6,20.37,359.85,'2020-09-07 18:00','项目经理LG',20200907,'C-JZ20200904','No','','','','Yes','No','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','','市场助理ZM','Yes',NULL,0),(25,20200904,'F-20200904JZ09','北京科译翻译有限公司','Zhu yue','Liu yi','registration department ','Jiuzhou Medical','DF-134419-RV04-Stellant PSUR',17,5642,'PDF','翻译','EN-CN','CNY',0.26,'中文字符数（不计空格）','Q-JZ202009041',6453.00,6,100.67,1178.45,'2020-09-07 18:00','项目经理LG',20200907,'C-JZ20200904','No','','','','Yes','No','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','','市场助理ZM','Yes',NULL,0),(26,20200907,'F-20200907GDM01','北京科译翻译有限公司','王强','Sunny','注册部','高德美','Alfasigma International',4,997,'PDF','翻译','EN-CN','CNY',169.81,'千中文字符数（不计空格）','Q-GDM202009074',2.34,6,0.00,0.00,'2020-09-07 17:57','项目经理LG',NULL,'C-GDM20200907','Yes','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'scxzjl',NULL,NULL,0),(27,20200910,'F-20200910JZ01','北京科译翻译有限公司','朱悦','王亮','市场部','九州医疗','1. A11_VR_147478_EN_02_&Att',29,3722,'PDF','翻译','CN-EN','CNY',0.38,'中文字符数（不计空格）','Q-JZ202009101',4222.00,6,0.00,1700.62,'2020-09-14 23:00','项目经理LG',NULL,'C-JZ20200910','Yes','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理ZM','Yes',NULL,0),(28,20200910,'F-20200910JZ02','北京科译翻译有限公司','朱悦','王亮','市场部','九州医疗','1. A11_CO_VR_150559_EN_01',6,1010,'PDF','翻译','EN-CN','CNY',0.28,'中文字符数（不计空格）','Q-JZ202009101',1510.00,6,0.00,448.17,'2020-09-14 23:00','项目经理LG',NULL,'C-JZ20200910','Yes','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理ZM','Yes',NULL,0),(29,20200911,'F-20200911WTYP01','北京科译翻译有限公司','王青','郑燕','注册部','武田','Complete version registration history EN',3,840,'Word','翻译','EN-CN','CNY',0.00,'',NULL,0.00,6,0.00,0.00,'20200914','项目经理LG',NULL,'C-WTYP20200911','No','','',NULL,'No',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理LYX','Yes',NULL,0),(30,20200911,'F-20200911WTYP02','北京科译翻译有限公司','王青','郑燕','注册部','武田','Appendix 1-1 CP reviewed',2,396,'Word','翻译','EN-CN','CNY',0.00,'中文字符数（不计空格）',NULL,0.00,6,0.00,0.00,'','项目经理LG',NULL,'C-WTYP20200911','No','','',NULL,'No',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理LYX','Yes',NULL,0),(31,20200911,'F-20200911WTYP03','北京科译翻译有限公司','王青','高妍','注册部','武田','2018 FDA EIR',56,12222,'PDF','翻译','EN-CN','CNY',0.13,'中文字符数（不计空格）',NULL,0.00,6,0.00,0.00,'2020-09-11 23:00','',NULL,'C-WTYP20200911','No','','',NULL,'No',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理LYX','Yes',NULL,0),(32,20200911,'F-20200911WTYP04','北京科译翻译有限公司','王青','郑燕','注册部','武田','VV-00818464 myPKFiT v2.0 Verification Defect Log Report',47,30751,'Word','翻译','EN-CN','CNY',0.13,'中文字符数（不计空格）',NULL,0.00,6,0.00,0.00,'2020-09-11 23:00','项目经理LG',NULL,'C-WTYP20200911','No','','',NULL,'No',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理LYX',NULL,NULL,1599816109),(33,20200911,'F-20200911JZ05','北京科译翻译有限公司','朱悦','王亮','市场部','九州医疗','1. A11_VR_147478_EN_02_&Att',29,3722,'PDF','翻译','CN-EN','CNY',0.38,'中文字符数（不计空格）','Q-JZ202009101',4222.00,6,200.00,1700.62,'2020-09-14 23:00','项目经理LG',NULL,'C-JZ20200910','Yes','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理ZM',NULL,NULL,0),(34,20200911,'F-20200911JZ06','北京科译翻译有限公司','朱悦','王亮','市场部','九州医疗','1. A11_CO_VR_150559_EN_01',6,1010,'PDF','翻译','EN-CN','CNY',0.28,'中文字符数（不计空格）','Q-JZ202009101',1510.00,6,200.00,448.17,'2020-09-14 23:00','项目经理LG',NULL,'C-JZ20200910','Yes','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理ZM',NULL,NULL,0),(35,20200921,'F-20200921XH01','科医达商务咨询(上海)有限公司','弓长','侯晓','市场部','西禾','研究项目',10,1400,'Word','翻译','CN-EN','CNY',0.20,'中文字符数（不计空格）','Q-XH202009217',3000.00,6,81.00,636.00,'','项目经理TJ',NULL,'C-XH20200824','No','','',NULL,'Yes',NULL,'567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										',NULL,'市场助理AL',NULL,NULL,0),(36,20200921,'F-20200921XH02','科医达商务咨询(上海)有限公司','弓长','侯晓','市场部','西禾','MRI Description',9,1679,'PDF','翻译','EN-CN','CNY',0.15,'中文字符数（不计空格）','Q-XH202009217',5000.00,6,81.00,795.00,'','项目经理TJ',NULL,'C-XH20200824','No','','',NULL,'Yes',NULL,'567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										',NULL,'市场助理AL',NULL,NULL,0),(37,20200921,'F-20200921YYS03','科医达商务咨询(上海)有限公司','朱悦','丽莎','研发部','药研所','20289_CN_54002-018_Pathology report',4,1862,'PDF','翻译','CN-EN','CNY',0.28,'中文字符数（不计空格）','Q-YYS202009211',1952.00,6,32.79,579.35,'2020-09-28 23:00','项目经理LG',20200928,'C-YYS20200921','No','','','No','Yes','No','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','市场助理ZM',NULL,NULL,0),(38,20200921,'F-20200921YYS04','科医达商务咨询(上海)有限公司','朱悦','丽莎','研发部','药研所','20289_CN_54002-019_NGS report',63,34541,'PDF','翻译','EN-CN','CNY',0.28,'中文字符数（不计空格）','Q-YYS202009211',35611.00,6,598.26,10569.34,'2020-09-28 23:00','项目经理LG',20200928,'C-YYS20200921','No','','','No','Yes','No','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','市场助理ZM',NULL,NULL,0),(39,20200921,'F-20200921YYS05','科医达商务咨询(上海)有限公司','朱悦','吴一','销售部','药研所','Thomas Steuber - Martini-Klinik Hamburg',2,272,'PDF','翻译','EN-CN','CNY',0.28,'中文字符数（不计空格）','Q-YYS202009212',1000.00,6,16.80,296.80,'2020-09-28 23:00','项目经理TJ',20200928,'C-YYS20200921','No','','','No','Yes','No','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','市场助理ZM',NULL,NULL,0),(40,20200921,'F-20200921YYS06','科医达商务咨询(上海)有限公司','朱悦','吴一','销售部','药研所','Tobias Maurer - Martini-Klinik Hamburg',3,345,'PDF','翻译','EN-CN','CNY',0.28,'中文字符数（不计空格）','Q-YYS202009212',1000.00,6,16.80,296.80,'2020-09-24 23:00','项目经理TJ',20200928,'C-YYS20200921','No','','','No','Yes','No','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','市场助理ZM',NULL,NULL,0),(41,20200924,'F-20200924AB01','北京科译翻译有限公司','朱悦','陈一','注册部','AB医疗','20290_54001_54001007_NGS Report-1',14,4384,'PDF','翻译','EN-CN','EUR',168.00,'千中文字符数（不计空格）','Q-AB202009241',5.64,6,0.00,1004.37,'2020-09-28 00:00','项目经理LG',NULL,'C-AB20200924','Yes','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理ZM',NULL,NULL,1600912475),(42,20200924,'F-20200924AB02','北京科译翻译有限公司','朱悦','王佳','注册部','AB医疗','食品安全国家标准 植物源性食品中甜菜安残留量的测定 液相色谱-质谱联用法（征求意见稿）.docx (002)',10,3512,'PDF','翻译','CN-EN','EUR',238.00,'千中文字符数（不计空格）','Q-AB202009243',4.55,6,64.97,1147.87,'2020-09-28 23:00','项目经理LG',20200928,'C-AB20200924','No','','','No','Yes','No','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM','Yes',NULL,0),(43,20200924,'F-20200924AB03','北京科译翻译有限公司','朱悦','陈一','注册部','AB医疗','20290_54001_54001007_NGS Report-1',14,4384,'PDF','翻译','EN-CN','EUR',168.00,'千中文字符数（不计空格）','Q-AB202009241',5.64,6,56.85,1004.37,'2020-09-28 00:00','项目经理LG',20200928,'C-AB20200924','Yes','','','No','Yes','No','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM','Yes',NULL,0),(44,20200924,'F-20200924XH04','北京科译翻译有限公司','弓长','唐爽','注册部','西禾','产品补单',3,200,'PDF','翻译','CN-EN','CNY',0.20,'中文字符数（不计空格）','Q-XH202009249',1000.00,6,0.00,212.00,'2020-09-30 23:00','项目经理TJ',NULL,'C-XH20200824','No','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理AL',NULL,NULL,0),(45,20200924,'F-20200924XH05','北京科译翻译有限公司','弓长','唐爽','注册部','西禾','产品对比表',5,500,'PDF','翻译','EN-CN','CNY',0.15,'中文字符数（不计空格）','Q-XH202009249',1500.00,6,0.00,238.50,'2020-09-30 23:00','项目经理TJ',NULL,'C-XH20200824','No','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理AL',NULL,NULL,0),(46,20200924,'F-20200924AB06','北京科译翻译有限公司','朱悦','王佳','注册部','AB医疗','流程图原文',1,200,'PDF','翻译','EN-CN','CNY',100.00,'页','',0.00,6,0.00,0.00,'2020-09-30 23:00',NULL,0,'C-AB20200924','No','','','Yes','No','No','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','scxzjl',NULL,NULL,0),(47,20200924,'F-20200924XH07','北京科译翻译有限公司','弓长','唐爽','注册部','西禾','技术要求补单',2,1500,'PDF','翻译','EN-CN','CNY',200.00,'千中文字符数（不计空格）','Q-XH2020092410',2.50,6,0.00,530.00,'','项目经理TJ',NULL,'C-XH20200824','No','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理AL',NULL,NULL,0),(48,20200927,'F-20200927YYS01','科医达商务咨询(上海)有限公司','朱悦','丽莎','研发部','药研所','食品安全国家标准 植物源性食品中甜菜安残留量的测定 液相色谱-质谱联用法（征求意见稿）.docx (002)',10,3512,'PDF','翻译','CN-EN','CNY',238.00,'千中文字符数（不计空格）','Q-YYS202009243',5.00,6,0.00,1261.40,'','项目经理TJ',NULL,'C-YYS20200921','No','','',NULL,'Yes',NULL,'567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										',NULL,'scxzjl',NULL,NULL,0),(49,20200930,'F-20200930AB01','北京科译翻译有限公司','朱悦','王佳','注册部','AB医疗','附件2 药品不良反应报告和监测检查资料清单',4,1510,'PDF','翻译','CN-EN','EUR',0.36,'中文字符数（不计空格）','Q-AB202009309',1600.00,6,34.56,610.56,'2020-09-30 23:00','项目经理LG',0,'C-AB20200924','No','','','No','Yes','No','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理ZM',NULL,NULL,0),(50,20200930,'F-20200930XH02','北京科译翻译有限公司','弓长','侯晓','市场部','西禾','注册法规对比翻译',10,3000,'Word','翻译','CN-EN','CNY',0.20,'中文字符数（不计空格）','Q-XH2020093011',3500.00,6,0.00,742.00,'2020-10-12 23:00','',NULL,'C-XH20200824','No','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理AL',NULL,NULL,0),(51,20200930,'F-20200930AB03','北京科译翻译有限公司','朱悦','王佳','注册部','AB医疗','1',1,1,'PDF','翻译','CN-EN','CNY',1.00,'单词',NULL,1.00,6,60.00,8.00,'2020-09-30 16:09','项目经理LG',NULL,'C-AB20200924','Yes','1','1',NULL,'No',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'系统管理员',NULL,NULL,0),(52,20200930,'F-20200930AB04','北京科译翻译有限公司','朱悦','王佳','注册部','AB医疗','2',2,2,'PDF','翻译','CN-EN','CNY',2.00,'单词',NULL,2.00,6,60.00,2.00,'2020-09-30 16:09','项目经理LG',NULL,'C-AB20200924','Yes','1','1',NULL,'No',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'系统管理员',NULL,NULL,0),(53,20200930,'F-20200930AB05','北京科译翻译有限公司','朱悦','王佳','注册部','AB医疗','3',3,3,'PDF','翻译','CN-EN','CNY',3.00,'单词',NULL,3.00,6,0.54,4.00,'2020-09-30 23:00','项目经理LG',NULL,'C-AB20200924','Yes','3','3',NULL,'No',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'系统管理员',NULL,NULL,0),(54,20200930,'F-20200930AB06','北京科译翻译有限公司','朱悦','王佳','注册部','AB医疗','5',2,200,'PDF','翻译','CN-EN','CNY',0.20,'中文字符数（不计空格）',NULL,1000.00,6,12.00,212.00,'','项目经理LG',NULL,'C-AB20200924','Yes','','',NULL,'No',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'admin','Yes',NULL,0),(55,20200930,'F-20200930AB07','北京科译翻译有限公司','朱悦','王佳','注册部','AB医疗','Redoxon_Avoiding infections',6,1224,'PDF','翻译','EN-CN','EUR',0.36,'中文字符数（不计空格）','Q-AB2020093010',1345.00,6,29.05,513.25,'2020-09-30 23:00','项目经理LG',NULL,'C-AB20200924','No','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理ZM','Yes',NULL,0),(56,20200930,'F-20200930AB08','北京科译翻译有限公司','朱悦','王佳','注册部','AB医疗','上海市浦东新区市场监督管理局关于开展药品上市许可持有人药物警戒检查工作的通知',8,2614,'PDF','翻译','CN-EN','EUR',0.36,'中文字符数（不计空格）','Q-AB2020093011',2700.00,6,58.32,1030.32,'2020-09-30 23:00','项目经理LG',NULL,'C-AB20200924','No','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理ZM','Yes',NULL,0),(57,20200930,'F-20200930SHGD09','北京科译翻译有限公司','王青','刘二','财务部','上海光电','BHC159020 PCT-CN Claims in CN',4,2816,'PDF','翻译','CN-EN','CNY',360.00,'千中文字符数（不计空格）','Q-SHGD202009303',2.92,6,63.07,1114.27,'2020-10-12 23:00','项目经理LG',NULL,'C-SHGD20200930','Yes','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理ZM','Yes',NULL,0),(58,20200930,'F-20200930SHGD10','北京科译翻译有限公司','王青','刘二','财务部','上海光电','T 2.20-09',2,221,'PDF','翻译','EN-CN','CNY',0.28,'中文字符数（不计空格）','Q-SHGD202009303',1000.00,6,16.80,296.80,'2020-09-30 23:00','项目经理LG',NULL,'C-SHGD20200930','Yes','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理ZM','Yes',NULL,0),(59,20200930,'F-20200930SHGD11','北京科译翻译有限公司','王青','刘二','财务部','上海光电','T 2.02-16',44,7628,'PDF','翻译','EN-CN','CNY',0.28,'中文字符数（不计空格）','Q-SHGD202009303',7828.00,6,131.51,2323.35,'2020-10-12 23:00','项目经理LG',NULL,'C-SHGD20200930','Yes','','',NULL,'Yes',NULL,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121',NULL,'市场助理ZM','Yes',NULL,0);

/*Table structure for table `ky_mk_inquiry` */

DROP TABLE IF EXISTS `ky_mk_inquiry`;

CREATE TABLE `ky_mk_inquiry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Inquiry_Date` int(11) DEFAULT NULL COMMENT '来稿日期',
  `Subject_Company` varchar(255) DEFAULT NULL COMMENT '主体公司',
  `Sales` varchar(255) DEFAULT NULL COMMENT '销售',
  `Attention` varchar(255) DEFAULT NULL COMMENT '客户联系人',
  `Department` varchar(255) DEFAULT NULL COMMENT '所在部门',
  `Company_Full_Name` varchar(255) DEFAULT NULL COMMENT '公司全称',
  `Company_Name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `Quote_Number` varchar(255) DEFAULT NULL COMMENT '报价单编码',
  `Contract_Number` varchar(255) DEFAULT NULL COMMENT '合同编码',
  `First_Cooperation` varchar(255) DEFAULT NULL COMMENT '是否首次合作',
  `Request_a_Quote` varchar(10) DEFAULT 'No' COMMENT '生成报价',
  `Currency` varchar(255) DEFAULT NULL COMMENT '币种',
  `VAT_Rate` tinyint(4) DEFAULT NULL COMMENT '税率(%)',
  `VAT_Amount` decimal(15,2) DEFAULT NULL COMMENT '增值税额',
  `Quote_Amount` decimal(15,2) DEFAULT NULL COMMENT '报价金额',
  `Subject_Company_VAT_ID` varchar(255) DEFAULT NULL COMMENT '主体公司税号',
  `Subject_Company_Address` varchar(255) DEFAULT NULL COMMENT '主体公司地址',
  `Subject_Company_Bank_Info` text COMMENT '主体银行信息',
  `PM` varchar(50) DEFAULT NULL COMMENT '项目经理',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `Update_Date` int(11) DEFAULT NULL COMMENT '更新日期',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_inquiry` */

insert  into `ky_mk_inquiry`(`id`,`Inquiry_Date`,`Subject_Company`,`Sales`,`Attention`,`Department`,`Company_Full_Name`,`Company_Name`,`Quote_Number`,`Contract_Number`,`First_Cooperation`,`Request_a_Quote`,`Currency`,`VAT_Rate`,`VAT_Amount`,`Quote_Amount`,`Subject_Company_VAT_ID`,`Subject_Company_Address`,`Subject_Company_Bank_Info`,`PM`,`Filled_by`,`Update_Date`,`delete_time`) values (1,20200827,'北京科译翻译有限公司','王青','Cherry','注册部','艾普强科技技术','艾普强','Q-APQ202009018','C-APQ20200827','No','Yes','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理TJ','scxzjl',20200827,0),(2,20200828,'北京科译翻译有限公司','王青','Cherry','注册部','艾普强科技技术','艾普强',NULL,'C-APQ20200827','','No','',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','系统管理员',20200828,1598954432),(3,20200828,'北京科译翻译有限公司','王青','Cherry','注册部','艾普强科技技术','艾普强','Q-APQ2020090112','C-APQ20200827','','Yes','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','系统管理员',20200901,0),(4,20200828,'北京科译翻译有限公司','弓长','王科','财务部','上海西禾医药有限公司','西禾','Q-XH202008281','C-XH20200824','No','Yes','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理TJ','市场助理AL',20200828,0),(5,20200828,'北京科译翻译有限公司','弓长','金磊','注册部','上海西禾医药有限公司','西禾','Q-XH202008283','C-XH20200824','No','Yes','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理TJ','市场助理AL',20200828,0),(6,20200828,'北京科译翻译有限公司','刘新','张三','财务部','拜耳医药有限公司','拜耳',NULL,'C-bayer20200828','Yes','No','EUR',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理LG','市场助理ZM',20200828,0),(7,20200828,'北京科译翻译有限公司','刘新','李四','注册部','拜耳医药有限公司','拜耳','Q-bayer202008282','C-bayer20200828','Yes','Yes','EUR',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理TJ','市场助理ZM',20200828,0),(8,20200901,'北京科译翻译有限公司','朱悦','Ally','RA','BEILANG医药有限公司','BEILANG','Q-BL202009011','C-BL20200901','Yes','Yes','EUR',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理LG','市场助理ZM',20200901,0),(9,20200901,'北京科译翻译有限公司','朱悦','cheng xue yi','RA','BEILANG医药有限公司','BEILANG','Q-BL202009012','C-BL20200901','Yes','Yes','EUR',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理LG','市场助理ZM',20200901,0),(10,20200903,'北京科译翻译有限公司','王青','Kelly','注册部','华大智造基因','华大智造','Q-HDZZ202009031','C-HDZZ20200821','No','Yes','CNY',6,216.47,3824.25,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理TJ','市场助理LYX',20200903,0),(11,20200903,'北京科译翻译有限公司','王青','Kelly','注册部','华大智造基因','华大智造','Q-HDZZ202009032','C-HDZZ20200821','No','Yes','CNY',6,352.22,6222.48,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理TJ','市场助理LYX',20200903,1599816153),(12,20200903,'北京科译翻译有限公司','王青','Anna','市场部','上海光电医疗','上海光电','Q-SHGD202009032','C-SHGD20200821','No','Yes','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理LYX',20200903,0),(13,20200903,'北京科译翻译有限公司','弓长','侯晓','市场部','上海西禾医药有限公司','西禾','Q-XH202009034','C-XH20200824','No','Yes','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理TJ','市场助理AL',20200903,0),(14,20200903,'北京科译翻译有限公司','王青','Alan','市场部','微创斯柯达','微创',NULL,'C-WC20200903','Yes','No','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','scxzjl',20200903,0),(15,20200903,'北京科译翻译有限公司','弓长','唐爽','注册部','上海西禾医药有限公司','西禾','Q-XH202009036','C-XH20200824','No','Yes','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理TJ','市场助理AL',20200903,0),(16,20200903,'科医达商务咨询(上海)有限公司','朱悦','lili','市场部','世尔科技医药有限公司','SHIER','Q-SE202009033','C-SE20200903','No','Yes','CNY',6,0.00,0.00,'567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','项目经理LG','admin',20200903,0),(17,20200903,'科医达商务咨询(上海)有限公司','朱悦','liyanchao','市场部','世尔科技医药有限公司','SHIER','Q-SE202009032','C-SE20200903','No','Yes','CNY',6,0.00,0.00,'567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','项目经理LG','admin',20200903,0),(18,20200904,'科医达商务咨询(上海)有限公司','朱悦','liyanchao','市场部','世尔科技医药有限公司','SHIER','Q-SE202009044','C-SE20200903','No','Yes','CNY',6,5.38,95.08,'567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','项目经理LG','市场助理ZM',20200904,0),(19,20200904,'Codex Scientific (Shanghai) Co., Ltd.','Amber','Sally','RA','RapiGEN INC','RapiGEN','Q-RPGI202009042','C-RPGI20200904','Yes','Yes','USD',0,0.00,0.00,'567811238971244682',' Room 418, Da \'an Business Building, No.1 Anyuan Road, Jing \'an District, Shanghai','Name of Beneficiary: Codex Scientific (Shanghai) Co., Ltd.\r\nAccount No.: 31050174363600000395\r\n','项目经理TJ','市场助理AL',20200904,0),(20,20200904,'北京科译翻译有限公司','Zhu yue','Liu yi','registration department ','Jiuzhou Medical Equipment Co. LTD','Jiuzhou Medical','Q-JZ202009041','C-JZ20200904','No','Yes','CNY',6,121.04,2138.30,'681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','项目经理LG','市场助理ZM',20200904,0),(21,20200904,'Beijing Codex Translation Co., Ltd.','王青','Anna','市场部','上海光电医疗','上海光电','Q-SHGD202009044','C-SHGD20200821','No','Yes','CNY',6,0.00,0.00,'681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','','scxzjl',20200904,0),(22,20200907,'北京科译翻译有限公司','王强','Sunny','注册部','高德美可没','高德美','Q-GDM202009074','C-GDM20200907','Yes','Yes','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理LG','市场助理LYX',20200907,0),(23,20200910,'北京科译翻译有限公司','朱悦','王亮','市场部','九州医疗科技有限公司','九州医疗','Q-JZ202009101','C-JZ20200910','Yes','Yes','CNY',6,200.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理LG','市场助理ZM',20200911,0),(24,20200910,'北京科译翻译有限公司','朱悦','吴秋','财务部','九州医疗科技有限公司','九州医疗','Q-JZ202009102','C-JZ20200910','No','Yes','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理LG','市场助理ZM',20200910,0),(25,20200910,'北京科译翻译有限公司','朱悦','李四','市场部','九州医疗科技有限公司','九州医疗',NULL,'C-JZ20200910','No','No','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理LG','市场助理ZM',20200910,0),(26,20200911,'北京科译翻译有限公司','王青','郑燕','注册部','武田药品','武田',NULL,'C-WTYP20200911','No','No','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理LG','市场助理LYX',20200911,0),(27,20200911,'北京科译翻译有限公司','王青','高妍','注册部','武田药品','武田',NULL,'C-WTYP20200911','No','No','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理LYX',20200911,0),(28,20200921,'科医达商务咨询(上海)有限公司','弓长','侯晓','市场部','上海西禾医药有限公司','西禾','Q-XH202009217','C-XH20200824','No','Yes','CNY',6,81.00,1431.00,'567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','项目经理TJ','市场助理AL',20200921,0),(29,20200921,'科医达商务咨询(上海)有限公司','朱悦','丽莎','研发部','新型药品研究所','药研所','Q-YYS202009211','C-YYS20200921','No','Yes','CNY',6,0.00,0.00,'567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','项目经理LG','市场助理ZM',20200921,0),(30,20200921,'科医达商务咨询(上海)有限公司','朱悦','吴一','销售部','新型药品研究所','药研所','Q-YYS202009212','C-YYS20200921','No','Yes','CNY',6,0.00,0.00,'567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','项目经理TJ','市场助理ZM',20200921,0),(31,20200923,'北京科译翻译有限公司','弓长','侯晓','市场部','上海西禾医药有限公司','西禾',NULL,'C-XH20200824','No','No','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理TJ','admin',20200923,0),(32,20200924,'北京科译翻译有限公司','朱悦','王佳','注册部','AABB医疗科技有限公司','AB医疗','Q-AB202009243','C-AB20200924','No','Yes','EUR',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理LG','市场助理ZM',20200924,0),(33,20200924,'北京科译翻译有限公司','朱悦','陈一','注册部','AABB医疗科技有限公司','AB医疗','Q-AB202009278','C-AB20200924','Yes','Yes','EUR',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理LG','市场助理ZM',20200924,0),(34,20200924,'北京科译翻译有限公司','弓长','唐爽','注册部','上海西禾医药有限公司','西禾','Q-XH2020092410','C-XH20200824','No','Yes','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理TJ','市场助理AL',20200924,0),(35,20200924,'科医达商务咨询(上海)有限公司','朱悦','丽莎','研发部','新型药品研究所','药研所','Q-YYS202009243','C-YYS20200921','No','Yes','CNY',6,0.00,0.00,'567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','项目经理TJ','市场助理AL',20200927,0),(36,20200930,'北京科译翻译有限公司','朱悦','王佳','注册部','AABB医疗科技有限公司','AB医疗','Q-AB2020093011','C-AB20200924','No','Yes','EUR',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理LG','市场助理ZM',20200930,0),(37,20200930,'北京科译翻译有限公司','弓长','侯晓','市场部','上海西禾医药有限公司','西禾','Q-XH2020093011','C-XH20200824','No','Yes','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','市场助理AL',20200930,0),(38,20200930,'北京科译翻译有限公司','朱悦','王佳','注册部','AABB医疗科技有限公司','AB医疗',NULL,'C-AB20200924','Yes','No','CNY',6,60.00,100.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理LG','系统管理员',20200930,0),(39,20200930,'北京科译翻译有限公司','王青','刘二','财务部','上海光电医疗器械有限公司','上海光电','Q-SHGD202009303','C-SHGD20200930','Yes','Yes','CNY',6,0.00,0.00,'681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','项目经理LG','市场助理ZM',20200930,0);

/*Table structure for table `ky_mk_inquiry_file` */

DROP TABLE IF EXISTS `ky_mk_inquiry_file`;

CREATE TABLE `ky_mk_inquiry_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `i_id` int(11) DEFAULT NULL COMMENT '主表ID',
  `Inquiry_Date` int(11) DEFAULT NULL COMMENT '来稿日期',
  `Contract_Number` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '合同编码',
  `Job_Name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '文件名称',
  `Pages` int(9) DEFAULT NULL COMMENT '页数',
  `Source_Text_Word_Count` int(9) DEFAULT NULL COMMENT '源语字数',
  `File_Type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '文件类型',
  `Service` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '服务类型',
  `Language` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '语种',
  `Unit_Price` decimal(15,2) DEFAULT NULL COMMENT '单价',
  `Units` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '单位',
  `VAT_Rate` tinyint(4) DEFAULT NULL COMMENT '税率(%)',
  `Quote_Quantity` decimal(15,2) DEFAULT NULL COMMENT '报价数量',
  `Quote_Amount` decimal(15,2) DEFAULT NULL COMMENT '报价金额',
  `VAT_Amount` decimal(15,2) DEFAULT NULL COMMENT '增值税额',
  `Delivery_Date_Expected` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL COMMENT '客户期望提交日期',
  `Customer_Requirements` text CHARACTER SET utf8mb4 COMMENT '客户要求',
  `External_Reference_File` text CHARACTER SET utf8mb4 COMMENT '客户参考文件',
  `Order_Status` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '订单状态',
  `Request_a_Quote` varchar(10) CHARACTER SET utf8mb4 DEFAULT 'No' COMMENT '生成报价(是/否)',
  `Remarks` text CHARACTER SET utf8mb4 COMMENT '备注',
  `Filled_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '填表人',
  `Update_Date` int(11) DEFAULT NULL COMMENT '更新日期',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

/*Data for the table `ky_mk_inquiry_file` */

insert  into `ky_mk_inquiry_file`(`id`,`i_id`,`Inquiry_Date`,`Contract_Number`,`Job_Name`,`Pages`,`Source_Text_Word_Count`,`File_Type`,`Service`,`Language`,`Unit_Price`,`Units`,`VAT_Rate`,`Quote_Quantity`,`Quote_Amount`,`VAT_Amount`,`Delivery_Date_Expected`,`Customer_Requirements`,`External_Reference_File`,`Order_Status`,`Request_a_Quote`,`Remarks`,`Filled_by`,`Update_Date`,`delete_time`) values (1,1,20200827,'C-APQ20200827','[01-01]HATT-BYT(RC135-33) Specifications_ENG',18,1616,'PDF','翻译','EN-CN',0.24,'中文字符数（不计空格）',NULL,5793.00,0.00,NULL,'2020-08-27 18:00','','','Accepted','Yes','','scxzjl',20200901,0),(2,3,20200828,'C-APQ20200827','6.4.2.1.1 6002-UE-VP ARIS HiQ Usability Validation Plan Rev 4',61,18197,'PDF','翻译','EN-CN',280.12,'单词',NULL,20.66,0.00,NULL,'','','','','Yes','','系统管理员',20200901,0),(3,4,20200828,'C-XH20200824','文献部分内容翻译202007',3,810,'PDF','翻译','EN-CN',0.15,'中文字符数（不计空格）',NULL,2500.00,375.00,NULL,'2020-08-31 23:00','','','Accepted','Yes','','市场助理AL',20200828,0),(4,4,20200828,'C-XH20200824','说明书翻译',6,1685,'PDF','翻译','CN-EN',0.20,'中文字符数（不计空格）',NULL,2000.00,400.00,NULL,'2020-08-31 23:00','','','Accepted','Yes','','市场助理AL',20200828,0),(5,5,20200828,'C-XH20200824','产品技术要求',10,5000,'PDF','翻译','EN-CN',0.15,'中文字符数（不计空格）',NULL,15000.00,0.00,NULL,'','','','Accepted','Yes','','市场助理AL',20200828,0),(6,5,20200828,'C-XH20200824','临床研究报告',3,500,'PDF','翻译','EN-CN',150.00,'千中文字符数（不计空格）',NULL,1.50,0.00,NULL,'','','','','Yes','','市场助理AL',20200828,0),(7,7,20200828,'C-bayer20200828','注册资料',20,4567,'PDF','翻译','CN-EN',0.08,'中文字符数（不计空格）',NULL,6789.00,0.00,NULL,'20200830','','','Accepted','Yes','','市场助理ZM',20200831,0),(8,7,20200828,'C-bayer20200828','Word',10,1256,'PDF','翻译','EN-CN',0.10,'单词',NULL,1356.00,0.00,NULL,'20200830','','','Accepted','Yes','','市场助理ZM',20200831,0),(9,8,20200901,'C-BL20200901','CHVI-356710_VP-48455-F1E-20200_MB-012',29,4568,'PDF','翻译','EN-CN',0.26,'中文字符数（不计空格）',NULL,5696.00,0.00,NULL,'2020-09-05 23:00','电子提交格式','','Accepted','Yes','','市场助理ZM',20200901,0),(10,9,20200901,'C-BL20200901','血液透析',46,12347,'PDF','翻译','CN-EN',0.38,'中文字符数（不计空格）',NULL,13547.00,0.00,NULL,'2020-09-15 23:00','电子提交格式','','Accepted','Yes','','市场助理ZM',20200901,0),(11,9,20200901,'C-BL20200901','血液透析',46,12347,'PDF','排版','CN-EN',20.00,'页',NULL,46.00,0.00,NULL,'2020-09-15 23:00','电子提交格式','','Accepted','Yes','','市场助理ZM',20200901,0),(12,3,20200901,'C-APQ20200827','6.4.2.3.1 ARIS HiQ Usability Report Issue 1 - Fully Signed',28,4909,'PDF','翻译','EN-CN',280.12,'单词',NULL,6.18,0.00,NULL,'','','','','Yes','','系统管理员',20200901,0),(13,3,20200901,'C-APQ20200827','6.4.3.1.1 6002-UE-VP2 ARIS HiQ Follow-Up Usability Validation Plan Issue 1 25-04-2019 - Fully Signed',35,8455,'PDF','翻译','EN-CN',280.12,'单词',NULL,10.19,0.00,NULL,'','','','','Yes','','系统管理员',20200901,0),(14,10,20200903,'C-HDZZ20200821','1398-2-0007-00 MGISP-NE32 产品风险管',55,14656,'PDF','翻译','CN-EN',0.22,'中文字符数（不计空格）',NULL,16399.00,3824.25,NULL,'2020-09-03 09:30','','','Accepted','Yes','','市场助理LYX',20200903,0),(15,11,20200903,'C-HDZZ20200821','错误场景V1.0_20200714',1,23094,'Excel','翻译','CN-EN',0.22,'中文字符数（不计空格）',NULL,26683.00,6222.48,NULL,'2020-09-03 10:00','','','Accepted','Yes','','市场助理LYX',20200903,0),(16,12,20200903,'C-SHGD20200821','附件1_産科危機的出血への対',5,5381,'PDF','翻译','JP-CN',0.17,'中文字符数（不计空格）',NULL,6453.00,1161.54,NULL,'2020-09-03 20:00','','','Unsure','Yes','','市场助理LYX',20200903,0),(17,12,20200903,'C-SHGD20200821','2.附件4_《Validation of inflationary non-invasive blood pressure monitoring in emergency room patients》',1,377,'PDF','翻译','EN-CN',0.15,'中文字符数（不计空格）',NULL,826.00,132.16,NULL,'2020-09-03 20:00','','','Unsure','Yes','','市场助理LYX',20200903,0),(18,12,20200903,'C-SHGD20200821','3.附件5_《Validation of inflationary noninvasive blood pressure monitoring in emergency room》',5,2977,'PDF','翻译','EN-CN',0.15,'中文字符数（不计空格）',NULL,9238.00,1478.08,NULL,'2020-09-03 20:00','','','Unsure','Yes','','市场助理LYX',20200903,0),(19,13,20200903,'C-XH20200824','宣传册翻译',10,5000,'PDF','翻译','EN-CN',0.15,'中文字符数（不计空格）',NULL,15000.00,0.00,NULL,'2020-09-08 23:00','','','Accepted','Yes','','市场助理AL',20200903,0),(20,15,20200903,'C-XH20200824','产品技术要求0903',5,1000,'PDF','翻译','EN-CN',150.00,'中文字符数（不计空格）',NULL,1.50,0.00,NULL,'2020-09-07 23:00','','','Unsure','Yes','','市场助理AL',20200903,0),(21,17,20200903,'C-SE20200903','NaOH_B1387282_Invoice',2,411,'PDF','翻译','EN-CN',0.26,'中文字符数（不计空格）',NULL,563.00,0.00,NULL,'2020-09-07 23:00','','','Accepted','Yes','','admin',20200903,0),(22,17,20200903,'C-SE20200903','Stopper_D000089723_Invoice',1,177,'PDF','翻译','EN-CN',0.26,'中文字符数（不计空格）',NULL,245.00,0.00,NULL,'2020-09-07 23:00','','','Accepted','Yes','','admin',20200903,0),(23,16,20200903,'C-SE20200903','《化学药品非处方药上市注册技术指导原则（征求意见稿）》',9,3316,'PDF','翻译','CN-EN',0.38,'中文字符数（不计空格）',NULL,3516.00,1416.24,NULL,'2020-09-10 23:00','','','Accepted','Yes','','admin',20200903,0),(24,18,20200904,'C-SE20200903','外包装翻译',4,300,'PDF','翻译','EN-CN',0.26,'中文字符数（不计空格）',NULL,345.00,0.00,NULL,'2020-09-04 12:00','','','Accepted','Yes','','市场助理ZM',20200904,0),(25,19,20200904,'C-RPGI20200904','labelling',1,67,'PDF','Translation','EN-CN',0.20,'Words',NULL,67.00,13.40,NULL,'','','','Accepted','Yes','','市场助理AL',20200904,0),(26,19,20200904,'C-RPGI20200904','Bank Charge',1,0,'','','',50.00,'Project',NULL,1.00,50.00,NULL,'','','','Accepted','Yes','','市场助理AL',20200904,0),(27,20,20200904,'C-JZ20200904','DF-134419-RV04-Stellant PSUR',17,5642,'PDF','翻译','EN-CN',0.26,'中文字符数（不计空格）',NULL,6453.00,1178.45,NULL,'2020-09-07 18:00','','','Accepted','Yes','','市场助理ZM',20200904,0),(28,20,20200904,'C-JZ20200904','Vayego bee semi-field study',5,682,'Word','翻译','CN-EN',0.36,'中文字符数（不计空格）',NULL,943.00,359.85,NULL,'2020-09-07 18:00','','','Accepted','Yes','','市场助理ZM',20200904,0),(29,21,20200904,'C-SHGD20200821','风险管理表_中文版_検証欄20190309',11,21218,'PDF','Translation','CN-EN',169.81,'Thousand Chinese Characters (No space)',NULL,30.56,0.00,NULL,'2020-09-04 14:12','','','Unsure','Yes','','scxzjl',20200904,0),(30,22,20200907,'C-GDM20200907','Alfasigma International',4,997,'PDF','翻译','EN-CN',169.81,'千中文字符数（不计空格）',NULL,2.34,0.00,NULL,'2020-09-07 17:57','','','Accepted','Yes','','市场助理LYX',20200907,0),(31,23,20200910,'C-JZ20200910','1. A11_CO_VR_150559_EN_01',6,1010,'PDF','翻译','EN-CN',0.28,'中文字符数（不计空格）',NULL,1510.00,448.17,NULL,'2020-09-14 23:00','','','Accepted','Yes','','市场助理ZM',20200911,0),(32,23,20200910,'C-JZ20200910','1. A11_VR_147478_EN_02_&Att',29,3722,'PDF','翻译','CN-EN',0.38,'中文字符数（不计空格）',NULL,4222.00,1700.62,NULL,'2020-09-14 23:00','','','Accepted','Yes','','市场助理ZM',20200911,0),(33,24,20200910,'C-JZ20200910','4. A11_VR_149730_EN_01',17,4611,'Word','翻译','EN-CN',0.28,'中文字符数（不计空格）',NULL,5111.00,0.00,NULL,'2020-09-14 23:00','','','','Yes','','市场助理ZM',20200910,0),(34,24,20200910,'C-JZ20200910','5. A11_CO_VR_150631_EN_01',7,1412,'PDF','翻译','CN-EN',0.38,'中文字符数（不计空格）',NULL,1912.00,0.00,NULL,'2020-09-14 23:00','','','','Yes','','市场助理ZM',20200910,0),(35,26,20200911,'C-WTYP20200911','Complete version registration history EN',3,840,'Word','翻译','EN-CN',0.13,'中文字符数（不计空格）',NULL,0.00,0.00,NULL,'20200914','','','Accepted','No','','市场助理LYX',20200911,0),(36,26,20200911,'C-WTYP20200911','Appendix 1-1 CP reviewed',2,396,'Word','翻译','EN-CN',0.13,'中文字符数（不计空格）',NULL,0.00,0.00,NULL,'','','','Accepted','No','','市场助理LYX',20200911,0),(37,26,20200911,'C-WTYP20200911','VV-00818464 myPKFiT v2.0 Verification Defect Log Report',47,30751,'Word','翻译','EN-CN',0.13,'中文字符数（不计空格）',NULL,0.00,0.00,NULL,'2020-09-11 23:00','','','Denied','No','','市场助理LYX',20200911,0),(38,27,20200911,'C-WTYP20200911','2018 FDA EIR',56,12222,'PDF','翻译','EN-CN',0.13,'中文字符数（不计空格）',NULL,0.00,0.00,NULL,'2020-09-11 23:00','','','Accepted','No','','市场助理LYX',20200911,0),(39,28,20200921,'C-XH20200824','MRI Description',9,1679,'PDF','翻译','EN-CN',0.15,'中文字符数（不计空格）',NULL,5000.00,795.00,NULL,'','','','Accepted','Yes','','市场助理AL',20200921,0),(40,28,20200921,'C-XH20200824','研究项目',10,1400,'Word','翻译','CN-EN',0.20,'中文字符数（不计空格）',NULL,3000.00,636.00,NULL,'','','','Accepted','Yes','','市场助理AL',20200921,0),(41,29,20200921,'C-YYS20200921','20289_CN_54002-019_NGS report',63,34541,'PDF','翻译','EN-CN',0.28,'中文字符数（不计空格）',NULL,35611.00,10569.34,NULL,'2020-09-28 23:00','','','Accepted','Yes','','市场助理ZM',20200921,0),(42,29,20200921,'C-YYS20200921','20289_CN_54002-018_Pathology report',4,1862,'PDF','翻译','CN-EN',0.28,'中文字符数（不计空格）',NULL,1952.00,579.35,NULL,'2020-09-28 23:00','','','Accepted','Yes','','市场助理ZM',20200921,0),(43,30,20200921,'C-YYS20200921','Tobias Maurer - Martini-Klinik Hamburg',3,345,'PDF','翻译','EN-CN',0.28,'中文字符数（不计空格）',NULL,1000.00,296.80,NULL,'2020-09-24 23:00','','','Accepted','Yes','','市场助理ZM',20200921,0),(44,30,20200921,'C-YYS20200921','Thomas Steuber - Martini-Klinik Hamburg',2,272,'PDF','翻译','EN-CN',0.28,'中文字符数（不计空格）',NULL,1000.00,296.80,NULL,'2020-09-28 23:00','','','Accepted','Yes','','市场助理ZM',20200921,0),(45,33,20200924,'C-AB20200924','20290_54001_54001007_NGS Report-1',14,4384,'PDF','翻译','EN-CN',168.00,'千中文字符数（不计空格）',6,5.64,1004.37,56.85,'2020-09-28 00:00','','','Accepted','Yes','','市场助理ZM',20200924,0),(46,32,20200924,'C-AB20200924','食品安全国家标准 植物源性食品中甜菜安残留量的测定 液相色谱-质谱联用法（征求意见稿）.docx (002)',10,3512,'PDF','翻译','CN-EN',238.00,'千中文字符数（不计空格）',6,4.55,1147.87,64.97,'2020-09-28 23:00','','','Accepted','Yes','','市场助理ZM',20200924,0),(47,34,20200924,'C-XH20200824','产品对比表',5,500,'PDF','翻译','EN-CN',0.15,'中文字符数（不计空格）',6,1500.00,238.50,13.50,'2020-09-30 23:00','','','Accepted','Yes','','市场助理AL',20200924,0),(48,34,20200924,'C-XH20200824','产品补单',3,200,'PDF','翻译','CN-EN',0.20,'中文字符数（不计空格）',6,1000.00,212.00,12.00,'2020-09-30 23:00','','','Accepted','Yes','','市场助理AL',20200924,0),(49,34,20200924,'C-XH20200824','技术要求补单',2,1500,'PDF','翻译','EN-CN',200.00,'千中文字符数（不计空格）',6,2.50,530.00,30.00,'','','','Accepted','Yes','','市场助理AL',20200924,0),(50,35,20200924,'C-YYS20200921','食品安全国家标准 植物源性食品中甜菜安残留量的测定 液相色谱-质谱联用法（征求意见稿）.docx (002)',10,3512,'PDF','翻译','CN-EN',238.00,'千中文字符数（不计空格）',6,5.00,1261.40,71.40,'','','','Accepted','Yes','','市场助理AL',20200927,0),(51,33,20200927,'C-AB20200924','总结报告-拜耳-20170825',8,2313,'PDF','翻译','CN-EN',0.36,'中文字符数（不计空格）',6,2316.00,0.00,50.03,'2020-09-28 23:00','','','','Yes','','市场助理ZM',20200927,0),(52,33,20200927,'C-AB20200924','P.5.1.01 Release Specification Elevit Pronatal (1610473) of sample test-022754065_2',2,151,'PDF','翻译','EN-CN',0.36,'中文字符数（不计空格）',6,234.00,0.00,5.05,'2020-09-28 23:00','','','','Yes','','市场助理ZM',20200927,0),(53,33,20200927,'C-AB20200924','Aug 2020 Larotrectinib SUSAR Monthly submission',2,332,'PDF','翻译','EN-CN',0.36,'中文字符数（不计空格）',6,400.00,0.00,8.64,'2020-09-28 23:00','','','','Yes','','市场助理ZM',20200927,0),(54,33,20200927,'C-AB20200924','Aug 2020 ATR inhibitor SUSAR Monthly submission',5,1200,'PDF','翻译','',0.28,'单词',6,1200.00,0.00,20.16,'','','','','Yes','','市场助理ZM',20200927,0),(55,36,20200930,'C-AB20200924','附件2 药品不良反应报告和监测检查资料清单',4,1510,'PDF','翻译','CN-EN',0.36,'中文字符数（不计空格）',6,1600.00,610.56,34.56,'2020-09-30 23:00','','','Accepted','Yes','','市场助理ZM',20200930,0),(56,37,20200930,'C-XH20200824','注册法规对比翻译',10,3000,'Word','翻译','CN-EN',0.20,'中文字符数（不计空格）',6,3500.00,742.00,42.00,'2020-10-12 23:00','','','Accepted','Yes','','市场助理AL',20200930,0),(57,38,20200930,'C-AB20200924','1',1,1,'PDF','翻译','CN-EN',1.00,'单词',6,1.00,8.00,0.06,'2020-09-30 16:09','1','1','Accepted','No','1','系统管理员',20200930,0),(58,38,20200930,'C-AB20200924','2',2,2,'PDF','翻译','CN-EN',2.00,'单词',6,2.00,2.00,0.24,'2020-09-30 16:09','1','1','Accepted','No','1','系统管理员',20200930,0),(59,38,20200930,'C-AB20200924','3',3,3,'PDF','翻译','CN-EN',3.00,'单词',6,3.00,4.00,0.54,'2020-09-30 23:00','3','3','Accepted','No','3','系统管理员',20200930,0),(60,36,20200930,'C-AB20200924','Redoxon_Avoiding infections',6,1224,'PDF','翻译','EN-CN',0.36,'中文字符数（不计空格）',6,1345.00,513.25,29.05,'2020-09-30 23:00','','','Accepted','Yes','','市场助理ZM',20200930,0),(61,38,20200930,'C-AB20200924','5',2,200,'PDF','翻译','CN-EN',0.20,'中文字符数（不计空格）',6,1000.00,212.00,12.00,'','','','Accepted','No','','admin',20200930,0),(62,36,20200930,'C-AB20200924','上海市浦东新区市场监督管理局关于开展药品上市许可持有人药物警戒检查工作的通知',8,2614,'PDF','翻译','CN-EN',0.36,'中文字符数（不计空格）',6,2700.00,1030.32,58.32,'2020-09-30 23:00','','','Accepted','Yes','','市场助理ZM',20200930,0),(63,39,20200930,'C-SHGD20200930','T 2.02-16',44,7628,'PDF','翻译','EN-CN',0.28,'中文字符数（不计空格）',6,7828.00,2323.35,131.51,'2020-10-12 23:00','','','Accepted','Yes','','市场助理ZM',20200930,0),(64,39,20200930,'C-SHGD20200930','T 2.20-09',2,221,'PDF','翻译','EN-CN',0.28,'中文字符数（不计空格）',6,1000.00,296.80,16.80,'2020-09-30 23:00','','','Accepted','Yes','','市场助理ZM',20200930,0),(65,39,20200930,'C-SHGD20200930','BHC159020 PCT-CN Claims in CN',4,2816,'PDF','翻译','CN-EN',360.00,'千中文字符数（不计空格）',6,2.92,1114.27,63.07,'2020-10-12 23:00','','','Accepted','Yes','','市场助理ZM',20200930,0);

/*Table structure for table `ky_mk_invoice` */

DROP TABLE IF EXISTS `ky_mk_invoice`;

CREATE TABLE `ky_mk_invoice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `Invoice_Number` varchar(255) DEFAULT NULL COMMENT '请款单编码',
  `To` varchar(255) DEFAULT NULL COMMENT '公司全称',
  `Attention` varchar(255) DEFAULT NULL COMMENT '客户联系人',
  `Company_Address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `Email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `Invoicing_Date` varchar(255) DEFAULT NULL COMMENT '日期',
  `Issued_by` varchar(255) DEFAULT NULL COMMENT '主体公司名称',
  `VAT_ID` varchar(255) DEFAULT NULL COMMENT '主体公司税号',
  `Address` varchar(255) DEFAULT NULL COMMENT '主体公司地址',
  `Currency` varchar(255) DEFAULT NULL COMMENT '币种',
  `Total_Amount_without_VAT` decimal(15,2) DEFAULT NULL COMMENT '不含税金额合计',
  `Total_VAT_Amount` decimal(15,2) DEFAULT NULL COMMENT '税额合计',
  `Total_Invoicing_Amount` decimal(15,2) DEFAULT NULL COMMENT '请款金额合计',
  `Bank_Info` text COMMENT '主体银行信息',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_invoice` */

insert  into `ky_mk_invoice`(`id`,`Invoice_Number`,`To`,`Attention`,`Company_Address`,`Email`,`Invoicing_Date`,`Issued_by`,`VAT_ID`,`Address`,`Currency`,`Total_Amount_without_VAT`,`Total_VAT_Amount`,`Total_Invoicing_Amount`,`Bank_Info`,`Filled_by`,`create_time`,`update_time`,`delete_time`) values (1,'I-APQ202008271','艾普强科技技术','Cherry','','224307108@qq.com','20200827','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',1390.32,83.42,1473.74,NULL,'scxzjl',1598526150,1601173288,0),(2,'I-APQ202008272','艾普强科技技术','Cherry','','224307108@qq.com','20200827','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',1390.32,83.42,1473.74,NULL,'scxzjl',1598526280,1598526320,0),(3,'I-XH202008281','上海西禾医药有限公司','金磊','','jinlei@xh.com','20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',2200.00,132.00,2332.00,NULL,'市场助理AL',1598613549,1601173298,0),(4,'I-XH202008282','上海西禾医药有限公司','王科','','jinlei@xh.com','0','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',600.00,36.00,636.00,NULL,'市场助理AL',1598616569,1601173302,0),(5,'I-BL202009011','BEILANG医药有限公司','Ally','北京市朝阳区','Ally@BEILANG.com','20200915','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',1480.96,88.86,1569.82,NULL,'市场助理ZM',1598953031,1601173307,0),(6,'I-BL202009012','BEILANG医药有限公司','cheng xue yi','北京市朝阳区','chengxueyi@BEILANG.com','20200901','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',6067.86,364.07,6431.93,NULL,'市场助理ZM',1598953256,1601173312,0),(7,'I-HDZZ202009031','华大智造基因','Kelly','北京','123@qq.com','20200903','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',5870.26,352.22,6222.48,NULL,'市场助理LYX',1599097614,1601173319,0),(8,'I-XH202009033','上海西禾医药有限公司','金磊','上海市静安区北京西路500号3层3003 室','jinlei@xh.com','20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',2100.00,126.00,2226.00,NULL,'市场助理AL',1599125745,1601173326,0),(9,'I-XH202009034','上海西禾医药有限公司','王科','上海市静安区北京西路500号3层3003 室','jinlei@xh.com','0','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',600.00,36.00,636.00,NULL,'市场助理AL',1599125761,1601173330,0),(10,'I-SE202009031','世尔科技医药有限公司','lili','上海市静安区','liyanchao@shier.com','20200903','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','CNY',1336.08,80.16,1416.24,NULL,'admin',1599129448,1601173335,0),(11,'I-RPGI202009041','RapiGEN INC','Sally','Dongan-gu,Anyang-si, Gyeonggi-do, Republic of Korea','Sally@rapi.com','20200904','Codex Scientific (Shanghai) Co., Ltd.','567811238971244682',' Room 418, Da \'an Business Building, No.1 Anyuan Road, Jing \'an District, Shanghai','USD',63.40,0.00,63.40,NULL,'市场助理AL',1599186189,1601173343,0),(12,'I-JZ202009111','九州医疗科技有限公司','王亮','湖北省武汉市武昌区','wangliang@qq.com','20200914','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',2028.30,121.70,2150.00,NULL,'市场助理ZM',1599823194,1601173364,0),(13,'I-WTYP202009211','武田药品','郑燕','上海','213@qq.com',NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',0.00,0.00,0.00,NULL,'市场助理LYX',1600665321,1601173394,0),(14,'I-XH202009215','上海西禾医药有限公司','唐爽','上海市静安区北京西路500号3层3003 室','tangshuang@xh.com','20200820','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',0.00,0.00,0.00,NULL,'市场助理AL',1600665345,1601173400,0),(15,'I-YYS202009211','新型药品研究所','吴一','北京市朝阳区','wuyi@yaoyansuo.com','20200921','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','CNY',560.00,33.60,593.60,NULL,'市场助理ZM',1600681645,1601172904,0),(16,'I-YYS202009212','新型药品研究所','丽莎','北京市朝阳区','lisa@yaoyansuo.com','20200928','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','CNY',11091.08,665.46,11756.54,NULL,'市场助理ZM',1600682087,1600762995,0),(17,'I-YYS202009213','新型药品研究所','丽莎','北京市朝阳区','lisa@yaoyansuo.com','20200928','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','CNY',1400.00,84.00,1484.00,NULL,'市场助理ZM',1600682138,1601172900,0),(18,'I-YYS202009214','新型药品研究所','丽莎','北京市朝阳区','lisa@yaoyansuo.com','0','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','CNY',12491.08,749.46,13240.54,NULL,'市场助理ZM',1600682204,1601173263,0),(19,'I-AB202009241','AABB医疗科技有限公司','陈一','上海市浦东新区','chenyi@aabb.com','20200928','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',947520.00,56851.20,1004371.20,NULL,'市场助理ZM',1600912824,1600929272,0),(20,'I-AB202009242','AABB医疗科技有限公司','陈一','上海市浦东新区','chenyi@aabb.com','20200928','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',1008.00,60.48,1068.48,NULL,'市场助理ZM',1600912990,1600929818,0),(21,'I-AB202009243','AABB医疗科技有限公司','陈一','上海市浦东新区','chenyi@aabb.com','20200928','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',1008.00,60.48,1068.48,NULL,'市场助理ZM',1600913264,1601173791,0),(22,'I-AB202009244','AABB医疗科技有限公司','王佳','上海市浦东新区','wnagjia@aabb.com','20200924','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',1190.00,71.40,1261.40,NULL,'市场助理ZM',1600913506,1601172874,0),(23,'I-XH202009246','上海西禾医药有限公司','唐爽','上海市静安区北京西路500号3层3003 室','tangshuang@xh.com','20200924','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',300.00,18.00,318.00,NULL,'scxzjl',1600933547,1601171197,0),(24,'I-XH202009247','上海西禾医药有限公司','唐爽','上海市静安区北京西路500号3层3003 室','tangshuang@xh.com','0','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',600.00,36.00,636.00,NULL,'市场助理AL',1600933945,1601173244,0),(25,'I-JZ202009272','九州医疗科技有限公司','王亮','湖北省武汉市武昌区','wangliang@qq.com','20200928','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',0.00,0.00,0.00,NULL,'市场助理ZM',1601175122,1601175155,0),(26,'I-JZ202009273','九州医疗科技有限公司','王亮','湖北省武汉市武昌区','wangliang@qq.com','0','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',420.00,25.20,445.20,NULL,'市场助理ZM',1601175211,1601175216,0),(27,'I-JZ202009274','九州医疗科技有限公司','王亮','湖北省武汉市武昌区','wangliang@qq.com','0','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',1520.00,91.20,1611.20,NULL,'市场助理ZM',1601175262,1601175268,0),(28,'I-XH202009278','上海西禾医药有限公司','唐爽','上海市静安区北京西路500号3层3003 室','tangshuang@xh.com','0','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',500.00,30.00,530.00,NULL,'scxzjl',1601201054,1601449178,0),(29,'I-AB202009305','AABB医疗科技有限公司','王佳','上海市浦东新区','wnagjia@aabb.com','0','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',576.48,34.59,611.07,NULL,'市场助理ZM',1601454377,1601454384,0),(30,'I-AB202009306','AABB医疗科技有限公司','王佳','上海市浦东新区','wnagjia@aabb.com','20200930','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',576.12,34.57,610.69,NULL,'市场助理ZM',1601454428,1601454547,0),(31,'I-SHGD202009301','上海光电医疗器械有限公司','刘二','上海市','liuer@shanghaiguangdian.com','20200930','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',3523.04,211.38,3734.42,NULL,'市场助理ZM',1601457465,1601457510,0);

/*Table structure for table `ky_mk_invoice_table` */

DROP TABLE IF EXISTS `ky_mk_invoice_table`;

CREATE TABLE `ky_mk_invoice_table` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `Invoice_Number` varchar(255) DEFAULT NULL COMMENT '请款单编码',
  `Filing_Code` varchar(255) DEFAULT NULL COMMENT '文件编号',
  `Pages` int(9) DEFAULT NULL COMMENT '页数',
  `File_Type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `Assigned` varchar(255) DEFAULT NULL COMMENT '委托日期',
  `Completed` varchar(255) DEFAULT NULL COMMENT '提交日期',
  `Job_Name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `Service` varchar(255) DEFAULT NULL COMMENT '服务',
  `Language` varchar(255) DEFAULT NULL COMMENT '语种',
  `Units` varchar(255) DEFAULT NULL COMMENT '单位',
  `Unit_Quantity` decimal(15,2) DEFAULT NULL COMMENT '交付数量',
  `Unit_Price` decimal(15,2) DEFAULT NULL COMMENT '单价',
  `Net_Amount` decimal(15,2) DEFAULT NULL COMMENT '未税金额',
  `VAT_Amount` decimal(15,2) DEFAULT NULL COMMENT '增值税额',
  `Invoicing_Amount` decimal(15,2) DEFAULT NULL COMMENT '请款金额',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_invoice_table` */

insert  into `ky_mk_invoice_table`(`id`,`Invoice_Number`,`Filing_Code`,`Pages`,`File_Type`,`Assigned`,`Completed`,`Job_Name`,`Service`,`Language`,`Units`,`Unit_Quantity`,`Unit_Price`,`Net_Amount`,`VAT_Amount`,`Invoicing_Amount`,`Filled_by`,`create_time`,`update_time`,`delete_time`) values (1,'I-APQ202008271','F-20200827APQ01',18,'PDF','20200827','20200827','[01-01]HATT-BYT(RC135-33) Specifications_ENG','翻译','EN-CN','中文字符数（不计空格）',5793.00,0.24,1390.32,83.42,1473.74,NULL,1598526150,1598526150,0),(2,'I-APQ202008272','F-20200827APQ01',18,'PDF','20200827','20200827','[01-01]HATT-BYT(RC135-33) Specifications_ENG','翻译','EN-CN','中文字符数（不计空格）',5793.00,0.24,1390.32,83.42,1473.74,NULL,1598526280,1598526280,0),(3,'I-XH202008281','F-20200828XH01',6,'PDF','20200828','20200828','说明书翻译','翻译','CN-EN','中文字符数（不计空格）',2000.00,0.20,400.00,24.00,424.00,NULL,1598613549,1598613549,0),(4,'I-XH202008281','F-20200828XH02',3,'PDF','20200828','20200828','文献部分内容翻译202007','翻译','EN-CN','中文字符数（不计空格）',2000.00,0.15,300.00,18.00,318.00,NULL,1598613549,1598613549,0),(5,'I-XH202008281','F-20200828XH03',10,'PDF','20200828','20200828','产品技术要求','翻译','EN-CN','中文字符数（不计空格）',10000.00,0.15,1500.00,90.00,1590.00,NULL,1598613549,1598613549,0),(6,'I-XH202008282','F-20200828XH01',6,'PDF','20200828','20200828','说明书翻译','翻译','CN-EN','千中文字符数（不计空格）',3.00,200.00,600.00,36.00,636.00,NULL,1598616569,1598616569,0),(7,'I-BL202009011','F-20200901BL03',29,'PDF','20200901','20200907','CHVI-356710_VP-48455-F1E-20200_MB-012','翻译','EN-CN','中文字符数（不计空格）',5696.00,0.26,1480.96,88.86,1569.82,NULL,1598953031,1598953031,0),(8,'I-BL202009012','F-20200901BL01',46,'PDF','20200901','20200915','血液透析','排版','CN-EN','页',46.00,20.00,920.00,55.20,975.20,NULL,1598953256,1598953256,0),(9,'I-BL202009012','F-20200901BL02',46,'PDF','20200901','20200915','血液透析','翻译','CN-EN','中文字符数（不计空格）',13547.00,0.38,5147.86,308.87,5456.73,NULL,1598953256,1598953256,0),(10,'I-HDZZ202009031','F-20200903HDZZ02',1,'Excel','20200903','20200903','错误场景V1.0_20200714','翻译','CN-EN','中文字符数（不计空格）',26683.00,0.22,5870.26,352.22,6222.48,NULL,1599097614,1599097614,0),(11,'I-XH202009033','F-20200828XH01',6,'PDF','20200828','20200828','说明书翻译','翻译','CN-EN','千中文字符数（不计空格）',3.00,200.00,600.00,36.00,636.00,NULL,1599125745,1599125745,0),(12,'I-XH202009033','F-20200828XH03',10,'PDF','20200828','20200828','产品技术要求','翻译','EN-CN','中文字符数（不计空格）',10000.00,0.15,1500.00,90.00,1590.00,NULL,1599125745,1599125745,0),(13,'I-XH202009034','F-20200828XH01',6,'PDF','20200828','20200828','说明书翻译','翻译','CN-EN','千中文字符数（不计空格）',3.00,200.00,600.00,36.00,636.00,NULL,1599125762,1599125762,0),(14,'I-SE202009031','F-20200903SE07',9,'PDF','20200903','20200907','《化学药品非处方药上市注册技术指导原则（征求意见稿）》','翻译','CN-EN','中文字符数（不计空格）',3516.00,0.38,1336.08,80.16,1416.24,NULL,1599129448,1599129448,0),(15,'I-RPGI202009041','F-20200904RPGI02',1,'PDF','20200904','20200904','labelling','Translation','EN-CN','Words',67.00,0.20,13.40,0.00,13.40,NULL,1599186189,1599186189,0),(16,'I-RPGI202009041','F-20200904RPGI03',1,'','20200904','20200904','Bank Charge','','','Project',1.00,50.00,50.00,0.00,50.00,NULL,1599186189,1599186189,0),(17,'I-JZ202009111','F-20200910JZ01',29,'PDF','20200910','20200914','1. A11_VR_147478_EN_02_&Att','翻译','CN-EN','中文字符数（不计空格）',4225.00,0.38,1605.50,96.33,1701.83,NULL,1599823194,1599823194,0),(18,'I-JZ202009111','F-20200910JZ02',6,'PDF','20200910','20200914','1. A11_CO_VR_150559_EN_01','翻译','EN-CN','中文字符数（不计空格）',1510.00,0.28,422.80,25.37,448.17,NULL,1599823194,1599823194,0),(19,'I-WTYP202009211','F-20200911WTYP03',56,'PDF','20200911',NULL,'2018 FDA EIR','翻译','EN-CN','中文字符数（不计空格）',NULL,0.13,0.00,0.00,0.00,NULL,1600665321,1600665321,0),(20,'I-WTYP202009211','F-20200911WTYP04',47,'Word','20200911',NULL,'VV-00818464 myPKFiT v2.0 Verification Defect Log Report','翻译','EN-CN','中文字符数（不计空格）',NULL,0.13,0.00,0.00,0.00,NULL,1600665321,1600665321,0),(21,'I-XH202009215','F-20200903XH03',10,'PDF','20200903',NULL,'宣传册翻译','翻译','EN-CN','中文字符数（不计空格）',NULL,0.15,0.00,0.00,0.00,NULL,1600665345,1600665345,0),(22,'I-XH202009215','F-20200903XH04',5,'PDF','20200903',NULL,'产品技术要求0903','翻译','EN-CN','中文字符数（不计空格）',NULL,0.15,0.00,0.00,0.00,NULL,1600665345,1600665345,0),(23,'I-YYS202009211','F-20200921YYS05',2,'PDF','20200921','20200928','Thomas Steuber - Martini-Klinik Hamburg','翻译','EN-CN','中文字符数（不计空格）',1000.00,0.28,280.00,16.80,296.80,NULL,1600681645,1600681645,0),(24,'I-YYS202009211','F-20200921YYS06',3,'PDF','20200921','20200928','Tobias Maurer - Martini-Klinik Hamburg','翻译','EN-CN','中文字符数（不计空格）',1000.00,0.28,280.00,16.80,296.80,NULL,1600681645,1600681645,0),(25,'I-YYS202009212','F-20200921YYS04',63,'PDF','20200921','20200928','20289_CN_54002-019_NGS report','翻译','EN-CN','中文字符数（不计空格）',39611.00,0.28,11091.08,665.46,11756.54,NULL,1600682087,1600682087,0),(26,'I-YYS202009213','F-20200921YYS03',4,'PDF','20200921','','20289_CN','翻译','CN-EN','中文字符数（不计空格）',5000.00,0.28,1400.00,84.00,1484.00,NULL,1600682138,1600682138,0),(27,'I-YYS202009214','F-20200921YYS03',4,'PDF','20200921','','20289_CN','翻译','CN-EN','中文字符数（不计空格）',5000.00,0.28,1400.00,84.00,1484.00,NULL,1600682204,1600682204,0),(28,'I-YYS202009214','F-20200921YYS04',63,'PDF','20200921','20200928','20289_CN_54002-019_NGS report','翻译','EN-CN','中文字符数（不计空格）',39611.00,0.28,11091.08,665.46,11756.54,NULL,1600682204,1600682204,0),(29,'I-AB202009241','F-20200924AB03',14,'PDF','20200924','20200928','20290_54001_54001007_NGS Report-1','翻译','EN-CN','千中文字符数（不计空格）',5640.00,168.00,947520.00,56851.20,1004371.20,NULL,1600912824,1600912824,0),(30,'I-AB202009242','F-20200924AB03',14,'PDF','20200924','20200928','20290_54001_54001007_NGS Report-1','翻译','EN-CN','千中文字符数（不计空格）',6.00,168.00,1008.00,60.48,1068.48,NULL,1600912990,1600912990,0),(31,'I-AB202009243','F-20200924AB03',14,'PDF','20200924','20200928','20290_54001_54001007_NGS Report-1','翻译','EN-CN','千中文字符数（不计空格）',6.00,168.00,1008.00,60.48,1068.48,NULL,1600913264,1600913264,0),(32,'I-AB202009244','F-20200924AB02',10,'PDF','20200924','20200928','食品安全国家标准 植物源性食品中甜菜安残留量的测定 液相色谱-质谱联用法（征求意见稿）.docx (002)','翻译','CN-EN','千中文字符数（不计空格）',5.00,238.00,1190.00,71.40,1261.40,NULL,1600913506,1600913506,0),(33,'I-XH202009246','F-20200924XH05',5,'PDF','20200924','20200924','产品对比表','翻译','EN-CN','千中文字符数（不计空格）',2.00,150.00,300.00,18.00,318.00,NULL,1600933547,1600933547,0),(34,'I-XH202009247','F-20200924XH07',2,'PDF','20200924','','技术要求补单','翻译','EN-CN','千中文字符数（不计空格）',3.00,200.00,600.00,36.00,636.00,NULL,1600933945,1600933945,0),(35,'I-JZ202009272','F-20200911JZ06',6,'PDF','20200911',NULL,'1. A11_CO_VR_150559_EN_01','翻译','EN-CN','中文字符数（不计空格）',NULL,0.28,0.00,0.00,0.00,NULL,1601175122,1601175122,0),(36,'I-JZ202009273','F-20200911JZ06',6,'PDF','20200911','20200928','1. A11_CO_VR_150559_EN_01','翻译','EN-CN','中文字符数（不计空格）',1500.00,0.28,420.00,25.20,445.20,NULL,1601175211,1601175211,0),(37,'I-JZ202009274','F-20200911JZ05',29,'PDF','20200911','20200928','P.5.1.01 Release Specification Elevit Pronatal (1610473) of sample test-022754065_2','翻译','CN-EN','中文字符数（不计空格）',4000.00,0.38,1520.00,91.20,1611.20,NULL,1601175262,1601175262,0),(38,'I-XH202009278','F-20200924XH07',2,'PDF','20200924','','技术要求补单','翻译','EN-CN','千中文字符数（不计空格）',2.50,200.00,500.00,30.00,530.00,NULL,1601201054,1601201054,0),(39,'I-AB202009305','F-20200930AB01',4,'PDF','20200930','20200930','附件2 药品不良反应报告和监测检查资料清单','翻译','CN-EN','中文字符数（不计空格）',1601.33,0.36,576.48,34.59,611.07,NULL,1601454377,1601454377,0),(40,'I-AB202009306','F-20200930AB01',4,'PDF','20200930','20200930','附件2 药品不良反应报告和监测检查资料清单','翻译','CN-EN','中文字符数（不计空格）',1600.33,0.36,576.12,34.57,610.69,NULL,1601454428,1601454428,0),(41,'I-SHGD202009301','F-20200930SHGD09',4,'PDF','20200930','20201012','BHC159020 PCT-CN Claims in CN','翻译','CN-EN','千中文字符数（不计空格）',2.92,360.00,1051.20,63.07,1114.27,NULL,1601457465,1601457465,0),(42,'I-SHGD202009301','F-20200930SHGD10',2,'PDF','20200930','20201012','T 2.20-09','翻译','EN-CN','中文字符数（不计空格）',1000.00,0.28,280.00,16.80,296.80,NULL,1601457465,1601457465,0),(43,'I-SHGD202009301','F-20200930SHGD11',44,'PDF','20200930','20201012','T 2.02-16','翻译','EN-CN','中文字符数（不计空格）',7828.00,0.28,2191.84,131.51,2323.35,NULL,1601457465,1601457465,0);

/*Table structure for table `ky_mk_invoicing` */

DROP TABLE IF EXISTS `ky_mk_invoicing`;

CREATE TABLE `ky_mk_invoicing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Assigned_Date` int(11) DEFAULT NULL COMMENT '委托日期',
  `Filing_Code` varchar(255) DEFAULT NULL COMMENT '文件编号',
  `Sales` varchar(255) DEFAULT NULL COMMENT '销售',
  `Attention` varchar(255) DEFAULT NULL COMMENT '客户联系人',
  `Company_Full_Name` varchar(255) DEFAULT NULL COMMENT '公司全称',
  `Invoice_Number` varchar(255) DEFAULT NULL COMMENT '请款单编号',
  `Job_Name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `Pages` int(9) DEFAULT NULL COMMENT '页数',
  `Source_Text_Word_Count` int(9) DEFAULT NULL COMMENT '源语字数',
  `File_Type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `Service` varchar(255) DEFAULT NULL COMMENT '服务类型',
  `Language` varchar(255) DEFAULT NULL COMMENT '语种',
  `Completed` varchar(255) DEFAULT NULL COMMENT '交付日期',
  `Currency` varchar(255) DEFAULT NULL COMMENT '币种',
  `Unit_Price` decimal(15,2) DEFAULT NULL COMMENT '单价',
  `Units` varchar(255) DEFAULT NULL COMMENT '单位',
  `VAT_Rate` tinyint(4) DEFAULT NULL COMMENT '税率(%)',
  `Unit_Quantity` decimal(15,2) DEFAULT NULL COMMENT '交付数量',
  `Net_Amount` decimal(15,2) DEFAULT NULL COMMENT '未税金额',
  `VAT_Amount` decimal(15,2) DEFAULT NULL COMMENT '增值税额',
  `Discount` varchar(255) DEFAULT NULL COMMENT '折扣',
  `Invoicing_Amount` decimal(15,2) DEFAULT NULL COMMENT '请款金额',
  `Invoicing_Date` int(11) DEFAULT NULL COMMENT '请款日期',
  `PO_Number` varchar(255) DEFAULT NULL COMMENT 'PO号',
  `PO_Amount` decimal(15,2) DEFAULT NULL COMMENT 'PO金额',
  `PO_Balance` decimal(15,2) DEFAULT NULL COMMENT 'PO剩余金额',
  `Apply_to_Pay` varchar(10) DEFAULT 'No' COMMENT '生成请款单',
  `Quote_Number` varchar(255) DEFAULT NULL COMMENT '报价单编码',
  `Quote_Quantity` decimal(15,2) DEFAULT NULL COMMENT '报价数量',
  `Quote_Amount` decimal(15,2) DEFAULT NULL COMMENT '报价金额',
  `Status` varchar(255) DEFAULT NULL COMMENT '状态',
  `Fapiao_Type` varchar(255) DEFAULT NULL COMMENT '发票类型',
  `Fapiao_Amount` decimal(15,2) DEFAULT NULL COMMENT '开票金额',
  `Fapiao_Date` int(11) DEFAULT NULL COMMENT '开票日期',
  `Fapiao_Code` varchar(255) DEFAULT NULL COMMENT '发票编码',
  `Customer_VAT_No` varchar(255) DEFAULT NULL COMMENT '客户税号',
  `Customer_Address` varchar(255) DEFAULT NULL COMMENT '单位地址',
  `Customer_Phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `Customer_Bank` varchar(255) DEFAULT NULL COMMENT '开户银行',
  `Customer_Bank_Account` varchar(255) DEFAULT NULL COMMENT '银行账号',
  `Pre_Payment` varchar(10) DEFAULT NULL COMMENT '预付款(Yes/No)',
  `Pre_Payment_Date` int(11) DEFAULT NULL COMMENT '预付款日期',
  `Pre_Payment_Amount` decimal(15,2) DEFAULT NULL COMMENT '预付款金额',
  `The_Balance` decimal(15,2) DEFAULT NULL COMMENT '余款',
  `Date_of_Balance` int(11) DEFAULT NULL COMMENT '余款支付日期',
  `Balance_Done` varchar(10) DEFAULT NULL COMMENT '余款付清(Y/N)',
  `Subject_Company` varchar(255) DEFAULT NULL COMMENT '主体公司',
  `Subject_Company_VAT_ID` varchar(255) DEFAULT NULL COMMENT '主体公司税号',
  `Subject_Company_Address` varchar(255) DEFAULT NULL COMMENT '主体公司地址',
  `Subject_Company_Bank_Info` text COMMENT '主体银行信息',
  `Customer_Requirements` text COMMENT '客户要求',
  `External_Reference_File` text COMMENT '客户参考文件',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `Remarks` text COMMENT '备注',
  `payment_time` varchar(20) DEFAULT NULL COMMENT '付款完成时间',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_invoicing` */

insert  into `ky_mk_invoicing`(`id`,`Assigned_Date`,`Filing_Code`,`Sales`,`Attention`,`Company_Full_Name`,`Invoice_Number`,`Job_Name`,`Pages`,`Source_Text_Word_Count`,`File_Type`,`Service`,`Language`,`Completed`,`Currency`,`Unit_Price`,`Units`,`VAT_Rate`,`Unit_Quantity`,`Net_Amount`,`VAT_Amount`,`Discount`,`Invoicing_Amount`,`Invoicing_Date`,`PO_Number`,`PO_Amount`,`PO_Balance`,`Apply_to_Pay`,`Quote_Number`,`Quote_Quantity`,`Quote_Amount`,`Status`,`Fapiao_Type`,`Fapiao_Amount`,`Fapiao_Date`,`Fapiao_Code`,`Customer_VAT_No`,`Customer_Address`,`Customer_Phone`,`Customer_Bank`,`Customer_Bank_Account`,`Pre_Payment`,`Pre_Payment_Date`,`Pre_Payment_Amount`,`The_Balance`,`Date_of_Balance`,`Balance_Done`,`Subject_Company`,`Subject_Company_VAT_ID`,`Subject_Company_Address`,`Subject_Company_Bank_Info`,`Customer_Requirements`,`External_Reference_File`,`Filled_by`,`Remarks`,`payment_time`,`delete_time`) values (1,20200827,'F-20200827APQ01','王青','Cherry','艾普强科技技术',NULL,'[01-01]HATT-BYT(RC135-33) Specifications_ENG',18,1616,'PDF','翻译','EN-CN',NULL,'CNY',0.24,'中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,5793.00,1473.74,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','scxzjl',NULL,NULL,1598525894),(2,20200827,'F-20200827APQ01','王青','Cherry','艾普强科技技术','I-APQ202008272','[01-01]HATT-BYT(RC135-33) Specifications_ENG',18,1616,'PDF','翻译','EN-CN','20200827','CNY',0.24,'中文字符数（不计空格）',6,5793.00,1390.32,83.42,'0.5',1473.74,20200827,'',0.00,0.00,'Yes','',5793.00,1473.74,'付款完成','专票',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','scxzjl','','20200827',0),(3,20200828,'F-20200828XH01','弓长','王科','上海西禾医药有限公司','I-XH202008281','说明书翻译',6,1685,'PDF','翻译','CN-EN','20200828','CNY',0.20,'中文字符数（不计空格）',6,2000.00,400.00,24.00,'',424.00,20200828,'',0.00,0.00,'Yes','Q-XH202008281',2000.00,400.00,'付款完成','',424.00,20200828,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','admin','','20200831',0),(4,20200828,'F-20200828XH02','弓长','王科','上海西禾医药有限公司','I-XH202008281','文献部分内容翻译202007',3,810,'PDF','翻译','EN-CN','20200828','CNY',0.15,'中文字符数（不计空格）',6,2000.00,300.00,18.00,'',318.00,20200828,'',0.00,0.00,'Yes','Q-XH202008281',2500.00,375.00,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理AL','',NULL,0),(5,20200828,'F-20200828XH02','弓长','王科','上海西禾医药有限公司',NULL,'文献部分内容翻译202007',3,810,'PDF','翻译','EN-CN',NULL,'CNY',0.15,'中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-XH202008281',2500.00,375.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理AL',NULL,NULL,0),(6,20200828,'F-20200828XH01','弓长','王科','上海西禾医药有限公司','I-XH202009034','说明书翻译',6,1685,'PDF','翻译','CN-EN','20200828','CNY',200.00,'千中文字符数（不计空格）',6,3.00,500.00,30.00,'',530.00,0,'',0.00,0.00,'Yes','Q-XH202008281',2000.00,400.00,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理AL','',NULL,0),(7,20200828,'F-20200828XH03','弓长','金磊','上海西禾医药有限公司','I-XH202009033','产品技术要求',10,5000,'PDF','翻译','EN-CN','20200828','CNY',0.15,'中文字符数（不计空格）',6,10000.00,1500.00,90.00,'',1590.00,20200828,'',0.00,0.00,'Yes','Q-XH202008282',15000.00,0.00,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理AL','',NULL,0),(8,20200831,'F-20200831bayer01','刘新','李四','拜耳医药有限公司',NULL,'Word',10,1256,'PDF','翻译','EN-CN',NULL,'EUR',0.10,'单词',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-bayer202008282',1356.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','admin',NULL,NULL,0),(9,20200831,'F-20200831bayer02','刘新','李四','拜耳医药有限公司',NULL,'注册资料',20,4567,'PDF','翻译','CN-EN',NULL,'EUR',0.08,'中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-bayer202008282',6789.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','admin',NULL,NULL,0),(10,20200831,'F-20200831bayer02','刘新','李四','拜耳医药有限公司',NULL,'注册资料',20,4567,'PDF','翻译','CN-EN',NULL,'EUR',0.08,'中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-bayer202008282',6789.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','admin',NULL,NULL,0),(11,20200831,'F-20200831bayer01','刘新','李四','拜耳医药有限公司',NULL,'Word',10,1256,'PDF','翻译','EN-CN',NULL,'EUR',0.10,'单词',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-bayer202008282',1356.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','admin',NULL,NULL,0),(12,20200901,'F-20200901BL01','朱悦','cheng xue yi','BEILANG医药有限公司','I-BL202009012','血液透析',46,12347,'PDF','排版','CN-EN','20200915','EUR',20.00,'页',6,46.00,0.00,0.00,'',0.00,20200915,'',0.00,0.00,'Yes','Q-BL202009012',46.00,0.00,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','电子提交格式','','市场助理ZM','',NULL,0),(13,20200901,'F-20200901BL02','朱悦','cheng xue yi','BEILANG医药有限公司','I-BL202009012','血液透析',46,12347,'PDF','翻译','CN-EN','20200915','EUR',0.38,'中文字符数（不计空格）',6,13547.00,0.00,0.00,'',0.00,20200915,'',0.00,0.00,'Yes','Q-BL202009012',13547.00,0.00,'项目进行中','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','电子提交格式','','市场助理ZM','',NULL,0),(14,20200901,'F-20200901BL03','朱悦','Ally','BEILANG医药有限公司','I-BL202009011','CHVI-356710_VP-48455-F1E-20200_MB-012',29,4568,'PDF','翻译','EN-CN','20200907','EUR',0.26,'中文字符数（不计空格）',6,5696.00,1480.96,88.86,'0',1569.82,20200915,'',0.00,0.00,'Yes','Q-BL202009011',5696.00,0.00,'项目进行中','专票',0.00,0,'','4567891230789','北京市朝阳区','12345678910','中国银行','64521325784512399','No',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','电子提交格式','','市场助理ZM','',NULL,0),(15,20200903,'F-20200903HDZZ01','王青','Kelly','华大智造基因','','1398-2-0007-00 MGISP-NE32 产品风险管',55,14656,'PDF','翻译','CN-EN','20200903','CNY',0.22,'中文字符数（不计空格）',6,16399.00,0.00,0.00,'',0.00,0,'',0.00,0.00,'No','',16399.00,3824.25,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理LYX','',NULL,0),(16,20200903,'F-20200903HDZZ02','王青','Kelly','华大智造基因','I-HDZZ202009031','错误场景V1.0_20200714',1,23094,'Excel','翻译','CN-EN','20200903','CNY',0.22,'中文字符数（不计空格）',6,26683.00,352.22,352.22,'',6222.48,20200903,'',0.00,0.00,'Yes','Q-HDZZ202009032',26683.00,6222.48,'等待结算','专票',6222.48,20200903,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','scxzjl','',NULL,0),(17,20200903,'F-20200903XH03','弓长','侯晓','上海西禾医药有限公司','I-XH202009215','宣传册翻译',10,5000,'PDF','翻译','EN-CN',NULL,'CNY',0.15,'中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','Q-XH202009034',15000.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理AL',NULL,NULL,0),(18,20200903,'F-20200903XH04','弓长','唐爽','上海西禾医药有限公司','I-XH202009215','产品技术要求0903',5,1000,'PDF','翻译','EN-CN',NULL,'CNY',0.15,'中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','Q-XH202009035',3000.00,2385.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理AL',NULL,NULL,0),(19,20200903,'F-20200903SE05','朱悦','liyanchao','世尔科技医药有限公司',NULL,'Stopper_D000089723_Invoice',1,177,'PDF','翻译','EN-CN',NULL,'CNY',0.26,'中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-SE202009032',245.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','','admin',NULL,NULL,0),(20,20200903,'F-20200903SE06','朱悦','liyanchao','世尔科技医药有限公司',NULL,'NaOH_B1387282_Invoice',2,411,'PDF','翻译','EN-CN',NULL,'CNY',0.26,'中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-SE202009032',563.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','','admin',NULL,NULL,0),(21,20200903,'F-20200903SE07','朱悦','lili','世尔科技医药有限公司','I-SE202009031','《化学药品非处方药上市注册技术指导原则（征求意见稿）》',9,3316,'PDF','翻译','CN-EN','20200907','CNY',0.38,'中文字符数（不计空格）',6,3516.00,1336.08,0.00,'0',1416.24,20200907,'',0.00,0.00,'Yes','Q-SE202009033',3516.00,1416.24,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','','admin','',NULL,0),(22,20200904,'F-20200904SE01','朱悦','liyanchao','世尔科技医药有限公司',NULL,'外包装翻译',4,300,'PDF','翻译','EN-CN',NULL,'CNY',0.26,'中文字符数（不计空格）',6,NULL,NULL,5.38,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-SE202009044',345.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','','市场助理ZM',NULL,NULL,0),(23,20200904,'F-20200904RPGI02','Amber','Sally','RapiGEN INC','I-RPGI202009041','labelling',1,67,'PDF','Translation','EN-CN','20200904','USD',0.20,'Words',0,67.00,13.40,0.00,'',13.40,20200904,'',0.00,0.00,'Yes','Q-RPGI202009042',67.00,13.40,'付款完成','PI',13.40,20200904,'','','','','','','Yes',20200904,13.40,0.00,0,'Yes','Codex Scientific (Shanghai) Co., Ltd.','567811238971244682',' Room 418, Da \'an Business Building, No.1 Anyuan Road, Jing \'an District, Shanghai','Name of Beneficiary: Codex Scientific (Shanghai) Co., Ltd.\r\nAccount No.: 31050174363600000395\r\n','','','市场助理AL','','20200904',0),(24,20200904,'F-20200904RPGI03','Amber','Sally','RapiGEN INC','I-RPGI202009041','Bank Charge',1,0,'','','','20200904','USD',50.00,'Project',0,1.00,50.00,0.00,'',50.00,20200904,'',0.00,0.00,'Yes','Q-RPGI202009042',1.00,50.00,'付款完成','PI',50.00,20200904,'','','','','','','Yes',20200904,50.00,0.00,0,'Yes','Codex Scientific (Shanghai) Co., Ltd.','567811238971244682',' Room 418, Da \'an Business Building, No.1 Anyuan Road, Jing \'an District, Shanghai','Name of Beneficiary: Codex Scientific (Shanghai) Co., Ltd.\r\nAccount No.: 31050174363600000395\r\n','','','市场助理AL','','20200904',0),(25,20200904,'F-20200904JZ04','Zhu yue','Liu yi','Jiuzhou Medical Equipment Co. LTD',NULL,'Vayego bee semi-field study',5,682,'Word','Translation','CN-EN',NULL,'CNY',0.36,'Chinese Characters (No space)',6,NULL,NULL,121.04,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-JZ202009041',943.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Beijing Codex Translation Co., Ltd.','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','','','市场助理ZM',NULL,NULL,1599187211),(26,20200904,'F-20200904JZ05','Zhu yue','Liu yi','Jiuzhou Medical Equipment Co. LTD',NULL,'DF-134419-RV04-Stellant PSUR',17,5642,'PDF','Translation','EN-CN',NULL,'CNY',0.26,'Chinese Characters (No space)',6,NULL,NULL,121.04,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-JZ202009041',6453.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Beijing Codex Translation Co., Ltd.','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','','','市场助理ZM',NULL,NULL,1599187193),(27,20200904,'F-20200904JZ06','Zhu yue','Liu yi','Jiuzhou Medical Equipment Co. LTD',NULL,'Vayego bee semi-field study',5,682,'Word','Translation','CN-EN',NULL,'CNY',0.36,'Chinese Characters (No space)',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-JZ202009041',943.00,359.85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Beijing Codex Translation Co., Ltd.','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','','','市场助理ZM',NULL,NULL,0),(28,20200904,'F-20200904JZ07','Zhu yue','Liu yi','Jiuzhou Medical Equipment Co. LTD','','DF-134419-RV04-Stellant PSUR',17,5642,'PDF','Translation','EN-CN','','CNY',0.26,'Chinese Characters (No space)',6,0.00,0.00,0.00,'',0.00,0,'',0.00,0.00,'No','Q-JZ202009041',6453.00,1178.45,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','Beijing Codex Translation Co., Ltd.','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','','','市场助理ZM','',NULL,0),(29,20200904,'F-20200904JZ08','Zhu yue','Liu yi','Jiuzhou Medical Equipment Co. LTD',NULL,'Vayego bee semi-field study',5,682,'Word','翻译','CN-EN',NULL,'CNY',0.36,'中文字符数（不计空格）',6,NULL,NULL,121.04,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-JZ202009041',943.00,359.85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','','','市场助理ZM',NULL,NULL,0),(30,20200904,'F-20200904JZ09','Zhu yue','Liu yi','Jiuzhou Medical Equipment Co. LTD',NULL,'DF-134419-RV04-Stellant PSUR',17,5642,'PDF','翻译','EN-CN',NULL,'CNY',0.26,'中文字符数（不计空格）',6,NULL,NULL,121.04,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-JZ202009041',6453.00,1178.45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','','','市场助理ZM',NULL,NULL,0),(31,20200907,'F-20200907GDM01','王强','Sunny','高德美可没',NULL,'Alfasigma International',4,997,'PDF','翻译','EN-CN',NULL,'CNY',169.81,'千中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-GDM202009074',2.34,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','scxzjl',NULL,NULL,0),(32,20200910,'F-20200910JZ01','朱悦','王亮','九州医疗科技有限公司','I-JZ202009111','1. A11_VR_147478_EN_02_&Att',29,3722,'PDF','翻译','CN-EN','20200914','CNY',0.38,'中文字符数（不计空格）',6,4225.00,0.00,0.00,'',0.00,0,'',0.00,0.00,'Yes','Q-JZ202009101',4222.00,1700.62,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理ZM','',NULL,0),(33,20200910,'F-20200910JZ02','朱悦','王亮','九州医疗科技有限公司','I-JZ202009111','1. A11_CO_VR_150559_EN_01',6,1010,'PDF','翻译','EN-CN','20200914','CNY',0.28,'中文字符数（不计空格）',6,1510.00,0.00,0.00,'',0.00,0,'',0.00,0.00,'Yes','Q-JZ202009101',1510.00,448.17,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理ZM','',NULL,0),(34,20200911,'F-20200911WTYP01','王青','郑燕','武田药品',NULL,'Complete version registration history EN',3,840,'Word','翻译','EN-CN',NULL,'CNY',0.00,'',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理LYX',NULL,NULL,0),(35,20200911,'F-20200911WTYP02','王青','郑燕','武田药品',NULL,'Appendix 1-1 CP reviewed',2,396,'Word','翻译','EN-CN',NULL,'CNY',0.00,'中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理LYX',NULL,NULL,0),(36,20200911,'F-20200911WTYP03','王青','高妍','武田药品','I-WTYP202009211','2018 FDA EIR',56,12222,'PDF','翻译','EN-CN',NULL,'CNY',0.13,'中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理LYX',NULL,NULL,0),(37,20200911,'F-20200911WTYP04','王青','郑燕','武田药品','I-WTYP202009211','VV-00818464 myPKFiT v2.0 Verification Defect Log Report',47,30751,'Word','翻译','EN-CN',NULL,'CNY',0.13,'中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理LYX',NULL,NULL,0),(38,20200911,'F-20200911JZ05','朱悦','王亮','九州医疗科技有限公司','I-JZ202009274','P.5.1.01 Release Specification Elevit Pronatal (1610473) of sample test-022754065_2',29,3722,'PDF','翻译','CN-EN','20200928','CNY',0.38,'中文字符数（不计空格）',6,4000.00,0.00,200.00,'',0.00,0,'',0.00,0.00,'Yes','Q-JZ202009101',4222.00,1700.62,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理ZM','',NULL,0),(39,20200911,'F-20200911JZ06','朱悦','王亮','九州医疗科技有限公司','I-JZ202009273','1. A11_CO_VR_150559_EN_01',6,1010,'PDF','翻译','EN-CN','20200928','CNY',0.28,'中文字符数（不计空格）',6,1500.00,0.00,200.00,'',0.00,0,'',0.00,0.00,'Yes','Q-JZ202009101',1510.00,448.17,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理ZM','',NULL,0),(40,20200921,'F-20200921XH01','弓长','侯晓','上海西禾医药有限公司',NULL,'研究项目',10,1400,'Word','翻译','CN-EN',NULL,'CNY',0.20,'中文字符数（不计空格）',6,NULL,NULL,81.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-XH202009217',3000.00,636.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','','市场助理AL',NULL,NULL,0),(41,20200921,'F-20200921XH02','弓长','侯晓','上海西禾医药有限公司',NULL,'MRI Description',9,1679,'PDF','翻译','EN-CN',NULL,'CNY',0.15,'中文字符数（不计空格）',6,NULL,NULL,81.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-XH202009217',5000.00,795.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','','市场助理AL',NULL,NULL,0),(42,20200921,'F-20200921YYS03','朱悦','丽莎','新型药品研究所','I-YYS202009214','20289_CN',4,1862,'PDF','翻译','CN-EN','','CNY',0.28,'中文字符数（不计空格）',6,5000.00,0.00,0.00,'',0.00,0,'',0.00,0.00,'Yes','Q-YYS202009211',1952.00,579.35,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','','市场助理ZM','',NULL,0),(43,20200921,'F-20200921YYS04','朱悦','丽莎','新型药品研究所','I-YYS202009214','20289_CN_54002-019_NGS report',63,34541,'PDF','翻译','EN-CN','20200928','CNY',0.28,'中文字符数（不计空格）',6,39611.00,0.00,0.00,'',0.00,0,'',0.00,0.00,'Yes','Q-YYS202009211',35611.00,10569.34,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','','市场助理ZM','',NULL,0),(44,20200921,'F-20200921YYS05','朱悦','吴一','新型药品研究所','I-YYS202009211','Thomas Steuber - Martini-Klinik Hamburg',2,272,'PDF','翻译','EN-CN','20200928','CNY',0.28,'中文字符数（不计空格）',6,1000.00,280.00,16.80,'0',298.00,20200928,'',0.00,0.00,'Yes','Q-YYS202009212',1000.00,296.80,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','','市场助理ZM','',NULL,0),(45,20200921,'F-20200921YYS06','朱悦','吴一','新型药品研究所','I-YYS202009211','Tobias Maurer - Martini-Klinik Hamburg',3,345,'PDF','翻译','EN-CN','20200928','CNY',0.28,'中文字符数（不计空格）',6,1100.56,280.00,16.80,'0',296.80,20200922,'',5.00,0.00,'Yes','Q-YYS202009212',1000.00,296.80,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','','市场助理ZM','',NULL,0),(46,20200924,'F-20200924AB01','朱悦','陈一','AABB医疗科技有限公司',NULL,'20290_54001_54001007_NGS Report-1',14,4384,'PDF','翻译','EN-CN',NULL,'EUR',168.00,'千中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-AB202009241',5.64,1004.37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理ZM',NULL,NULL,1600912548),(47,20200924,'F-20200924AB02','朱悦','王佳','AABB医疗科技有限公司','I-AB202009244','食品安全国家标准 植物源性食品中甜菜安残留量的测定 液相色谱-质谱联用法（征求意见稿）.docx (002)',10,3512,'PDF','翻译','CN-EN','20200928','EUR',238.00,'千中文字符数（不计空格）',6,5.00,0.00,0.00,'0',0.00,0,'',0.00,0.00,'Yes','Q-AB202009243',4.55,1147.87,'项目进行中','',0.00,20200928,'','','上海市浦东新区','12345678910','中国银行','4567891230','No',0,14.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理ZM','',NULL,0),(48,20200924,'F-20200924AB03','朱悦','陈一','AABB医疗科技有限公司','I-AB202009243','20290_54001_54001007_NGS Report-1',14,4384,'PDF','翻译','EN-CN','20200928','EUR',168.00,'千中文字符数（不计空格）',6,6.00,947.52,56.85,'0',1004.37,20200928,'',0.00,0.00,'Yes','Q-AB202009241',5.64,1004.37,'项目进行中','专票',1004.37,20200928,'','45612378910','上海市浦东新区','12345678910','中国银行','654321987','No',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','scxzjl','',NULL,0),(49,20200924,'F-20200924XH04','弓长','唐爽','上海西禾医药有限公司',NULL,'产品补单',3,200,'PDF','翻译','CN-EN',NULL,'CNY',0.20,'中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-XH202009249',1000.00,212.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理AL',NULL,NULL,0),(50,20200924,'F-20200924XH05','弓长','唐爽','上海西禾医药有限公司','I-XH202009246','产品对比表',5,500,'PDF','翻译','EN-CN','20200924','CNY',150.00,'千中文字符数（不计空格）',6,2.00,225.00,13.50,'',238.50,20200924,'',0.00,0.00,'Yes','Q-XH202009249',1500.00,238.50,'等待结算','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','scxzjl','',NULL,0),(51,20200924,'F-20200924XH07','弓长','唐爽','上海西禾医药有限公司','I-XH202009278','技术要求补单',2,1500,'PDF','翻译','EN-CN','','CNY',200.00,'千中文字符数（不计空格）',6,2.50,500.00,30.00,'',530.00,0,'',0.00,0.00,'Yes','Q-XH2020092410',2.50,530.00,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','scxzjl','',NULL,0),(52,20200927,'F-20200927YYS01','朱悦','丽莎','新型药品研究所',NULL,'食品安全国家标准 植物源性食品中甜菜安残留量的测定 液相色谱-质谱联用法（征求意见稿）.docx (002)',10,3512,'PDF','翻译','CN-EN',NULL,'CNY',238.00,'千中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-YYS202009243',5.00,1261.40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','','','scxzjl',NULL,NULL,0),(53,20200930,'F-20200930AB01','朱悦','王佳','AABB医疗科技有限公司','I-AB202009306','附件2 药品不良反应报告和监测检查资料清单',4,1510,'PDF','翻译','CN-EN','20200930','EUR',0.36,'中文字符数（不计空格）',6,1600.33,0.00,0.00,'',0.00,0,'',0.00,0.00,'Yes','Q-AB202009309',1600.00,610.56,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理ZM','',NULL,0),(54,20200930,'F-20200930XH02','弓长','侯晓','上海西禾医药有限公司',NULL,'注册法规对比翻译',10,3000,'Word','翻译','CN-EN',NULL,'CNY',0.20,'中文字符数（不计空格）',6,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-XH2020093011',3500.00,742.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理AL',NULL,NULL,0),(55,20200930,'F-20200930AB03','朱悦','王佳','AABB医疗科技有限公司',NULL,'1',1,1,'PDF','翻译','CN-EN',NULL,'CNY',1.00,'单词',6,NULL,NULL,60.00,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,1.00,8.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','1','1','系统管理员',NULL,NULL,0),(56,20200930,'F-20200930AB04','朱悦','王佳','AABB医疗科技有限公司',NULL,'2',2,2,'PDF','翻译','CN-EN',NULL,'CNY',2.00,'单词',6,NULL,NULL,60.00,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,2.00,2.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','1','1','系统管理员',NULL,NULL,0),(57,20200930,'F-20200930AB05','朱悦','王佳','AABB医疗科技有限公司',NULL,'3',3,3,'PDF','翻译','CN-EN',NULL,'CNY',3.00,'单词',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,3.00,4.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','3','3','系统管理员',NULL,NULL,0),(58,20200930,'F-20200930AB06','朱悦','王佳','AABB医疗科技有限公司',NULL,'5',2,200,'PDF','翻译','CN-EN',NULL,'CNY',0.20,'中文字符数（不计空格）',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,1000.00,212.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','admin',NULL,NULL,0),(59,20200930,'F-20200930AB07','朱悦','王佳','AABB医疗科技有限公司',NULL,'Redoxon_Avoiding infections',6,1224,'PDF','翻译','EN-CN',NULL,'EUR',0.36,'中文字符数（不计空格）',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-AB2020093010',1345.00,513.25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理ZM',NULL,NULL,0),(60,20200930,'F-20200930AB08','朱悦','王佳','AABB医疗科技有限公司',NULL,'上海市浦东新区市场监督管理局关于开展药品上市许可持有人药物警戒检查工作的通知',8,2614,'PDF','翻译','CN-EN',NULL,'EUR',0.36,'中文字符数（不计空格）',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No','Q-AB2020093011',2700.00,1030.32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理ZM',NULL,NULL,0),(61,20200930,'F-20200930SHGD09','王青','刘二','上海光电医疗器械有限公司','I-SHGD202009301','BHC159020 PCT-CN Claims in CN',4,2816,'PDF','翻译','CN-EN','20201012','CNY',360.00,'千中文字符数（不计空格）',6,2.92,1051.20,0.00,'',0.00,20201012,'',0.00,0.00,'Yes','Q-SHGD202009303',2.92,1114.27,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理ZM','',NULL,0),(62,20200930,'F-20200930SHGD10','王青','刘二','上海光电医疗器械有限公司','I-SHGD202009301','T 2.20-09',2,221,'PDF','翻译','EN-CN','20201012','CNY',0.28,'中文字符数（不计空格）',6,1000.00,280.00,0.00,'',0.00,20201012,'',0.00,0.00,'Yes','Q-SHGD202009303',1000.00,296.80,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理ZM','',NULL,0),(63,20200930,'F-20200930SHGD11','王青','刘二','上海光电医疗器械有限公司','I-SHGD202009301','T 2.02-16',44,7628,'PDF','翻译','EN-CN','20201012','CNY',0.28,'中文字符数（不计空格）',6,7828.00,2191.84,0.00,'',0.00,20201012,'',0.00,0.00,'Yes','Q-SHGD202009303',7828.00,2323.35,'','',0.00,0,'','','','','','','',0,0.00,0.00,0,'','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','','','市场助理ZM','',NULL,0);

/*Table structure for table `ky_mk_quote` */

DROP TABLE IF EXISTS `ky_mk_quote`;

CREATE TABLE `ky_mk_quote` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Quote_Number` varchar(255) DEFAULT NULL COMMENT '报价单编码',
  `To` varchar(255) DEFAULT NULL COMMENT '公司全称',
  `Attention` varchar(255) DEFAULT NULL COMMENT '客户联系人',
  `Company_Address` varchar(255) DEFAULT NULL COMMENT '客户公司地址',
  `Email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `Date` varchar(255) DEFAULT NULL COMMENT '日期',
  `Issued_by` varchar(255) DEFAULT NULL COMMENT '主体公司名称',
  `VAT_ID` varchar(255) DEFAULT NULL COMMENT '税号',
  `Address` varchar(255) DEFAULT NULL COMMENT '主体公司地址',
  `Currency` varchar(255) DEFAULT NULL COMMENT '币种',
  `Total_Amount_without_VAT` decimal(15,2) DEFAULT NULL COMMENT '不含税金额合计',
  `Total_VAT_Amount` decimal(15,2) DEFAULT NULL COMMENT '税额合计',
  `Total_Quote_Amount` decimal(15,2) DEFAULT NULL COMMENT '报价金额合计',
  `Bank_Info` text COMMENT '主体银行信息',
  `Archive` varchar(10) DEFAULT 'No' COMMENT '是否存档',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_quote` */

insert  into `ky_mk_quote`(`id`,`Quote_Number`,`To`,`Attention`,`Company_Address`,`Email`,`Date`,`Issued_by`,`VAT_ID`,`Address`,`Currency`,`Total_Amount_without_VAT`,`Total_VAT_Amount`,`Total_Quote_Amount`,`Bank_Info`,`Archive`,`Filled_by`,`create_time`,`update_time`,`delete_time`) values (1,'Q-APQ202008271','艾普强科技技术','Cherry','上海','224307108@qq.com','20200827','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',1390.32,83.42,1473.74,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','scxzjl',1598525356,1598953548,1598953548),(2,'Q-APQ202008282','艾普强科技技术','Cherry','上海','224307108@qq.com','20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','',0.00,0.00,0.00,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','系统管理员',1598610519,1598610542,1598610542),(3,'Q-APQ202008283','艾普强科技技术','Cherry','上海','224307108@qq.com','20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','',5787279.20,347236.75,6134515.95,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','系统管理员',1598610579,1598610603,1598610603),(4,'Q-APQ202008284','艾普强科技技术','Cherry','上海','224307108@qq.com','20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','',5602.40,336.14,5938.54,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','系统管理员',1598610640,1598610708,1598610708),(5,'Q-APQ202008285','艾普强科技技术','Cherry','上海','224307108@qq.com','20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','',5602.40,336.14,5938.54,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','系统管理员',1598610746,1598610771,1598610771),(6,'Q-APQ202008286','艾普强科技技术','Cherry','上海','224307108@qq.com','20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','',5602.40,336.14,5938.54,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','系统管理员',1598610826,1598611257,1598611257),(7,'Q-APQ202008287','艾普强科技技术','Cherry','上海','224307108@qq.com','20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','',5602.40,336.14,5938.54,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','系统管理员',1598611000,1598611253,1598611253),(8,'Q-XH202008281','上海西禾医药有限公司','王科','上海市静安区北京西路500号3层3003 室','jinlei@xh.com','20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',775.00,46.50,821.50,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理AL',1598611264,1601172625,0),(9,'Q-XH202008282','上海西禾医药有限公司','金磊','上海市静安区北京西路500号3层3003 室','jinlei@xh.com','20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',2250.00,135.00,2385.00,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理AL',1598613173,1601172620,0),(10,'Q-XH202008283','上海西禾医药有限公司','金磊','上海市静安区北京西路500号3层3003 室','jinlei@xh.com','20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',150.00,9.00,159.00,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理AL',1598615970,1598616004,0),(11,'Q-bayer202008281','拜耳医药有限公司','李四','上海市','zhangsan@baier.com','20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',678.72,40.73,719.45,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1598617415,1598617418,0),(12,'Q-bayer202008282','拜耳医药有限公司','李四','上海市','zhangsan@baier.com','20200828','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',678.72,40.73,719.45,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1598617458,1598617462,0),(13,'Q-BL202009011','BEILANG医药有限公司','Ally','北京市朝阳区','Ally@BEILANG.com','20200901','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',1480.96,88.86,1569.82,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1598952164,1601172616,0),(14,'Q-BL202009012','BEILANG医药有限公司','cheng xue yi','北京市朝阳区','Ally@BEILANG.com','20200901','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',6067.86,364.07,6431.93,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1598952447,1601172611,0),(15,'Q-APQ202009018','艾普强科技技术','Cherry','上海','2243073108@qq.com','20200901','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',NULL,NULL,NULL,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','系统管理员',1598953516,1598953516,0),(16,'Q-APQ202009019','艾普强科技技术','Cherry','上海','2243073108@qq.com','20200901','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','',NULL,NULL,NULL,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','系统管理员',1598953572,1598953765,1598953765),(17,'Q-APQ2020090110','艾普强科技技术','Cherry','上海','2243073108@qq.com','20200901','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','',NULL,NULL,NULL,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','系统管理员',1598953596,1598953760,1598953760),(18,'Q-APQ2020090111','艾普强科技技术','Cherry','上海','2243073108@qq.com','20200901','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','',10372.84,622.38,10995.22,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','系统管理员',1598953753,1598953768,0),(19,'Q-APQ2020090112','艾普强科技技术','Cherry','上海','2243073108@qq.com','20200901','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',4585.56,275.14,4860.70,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','系统管理员',1598954278,1601172600,0),(20,'Q-HDZZ202009031','华大智造基因','Kelly','北京','123@qq.com','20200903','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',3607.78,216.47,3824.25,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理LYX',1599096429,1599196133,0),(21,'Q-HDZZ202009032','华大智造基因','Kelly','北京','123@qq.com','20200903','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','',5870.26,352.22,6222.48,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理LYX',1599097175,1601172592,0),(22,'Q-SHGD202009031','上海光电医疗','Anna','上海','2243073108@qq.com','20200903','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',2771.78,166.30,2938.08,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理LYX',1599098195,1599098202,0),(23,'Q-SHGD202009032','上海光电医疗','Anna','上海','2243073108@qq.com','20200903','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',2606.61,156.39,2763.00,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理LYX',1599098372,1599098375,0),(24,'Q-XH202009034','上海西禾医药有限公司','侯晓','上海市静安区北京西路500号3层3003 室','jinlei@xh.com','20200903','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',2250.00,135.00,2385.00,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理AL',1599122670,1601172582,0),(25,'Q-XH202009035','上海西禾医药有限公司','唐爽','上海市静安区北京西路500号3层3003 室','jinlei@xh.com','20200903','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',450.00,27.00,477.00,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理AL',1599125176,1599196142,0),(26,'Q-XH202009036','上海西禾医药有限公司','唐爽','上海市静安区北京西路500号3层3003 室','jinlei@xh.com','20200903','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',225.00,13.50,238.50,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理AL',1599127246,1601172577,0),(27,'Q-SE202009031','世尔科技医药有限公司','liyanchao','上海市静安区','liyanchao@shier.com','20200903','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','CNY',206.96,12.41,219.37,'公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','No','admin',1599128285,1599195975,0),(28,'Q-SE202009032','世尔科技医药有限公司','liyanchao','上海市静安区','liyanchao@shier.com','20200903','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','CNY',210.08,12.60,222.68,'公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','No','admin',1599128416,1601172572,0),(29,'Q-SE202009033','世尔科技医药有限公司','lili','上海市静安区','liyanchao@shier.com','20200903','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','CNY',1336.08,80.16,1416.24,'公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','Yes','admin',1599128950,1601172559,0),(30,'Q-SE202009044','世尔科技医药有限公司','liyanchao','上海市静安区','liyanchao@shier.com','20200904','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','CNY',89.70,5.38,95.08,'公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','No','市场助理ZM',1599184336,1601172554,0),(31,'Q-RPGI202009041','RapiGEN INC','Sally','Dongan-gu,Anyang-si, Gyeonggi-do, Republic of Korea','Sally@rapi.com','20200904','Codex Scientific (Shanghai) Co., Ltd.','567811238971244682',' Room 418, Da \'an Business Building, No.1 Anyuan Road, Jing \'an District, Shanghai','USD',63.40,0.00,63.40,'Name of Beneficiary: Codex Scientific (Shanghai) Co., Ltd.\r\nAccount No.: 31050174363600000395\r\n','No','市场助理AL',1599185199,1601172550,0),(32,'Q-RPGI202009042','RapiGEN INC','Sally','Dongan-gu,Anyang-si, Gyeonggi-do, Republic of Korea','Sally@rapi.com','20200904','Codex Scientific (Shanghai) Co., Ltd.','567811238971244682',' Room 418, Da \'an Business Building, No.1 Anyuan Road, Jing \'an District, Shanghai','USD',63.40,0.00,63.40,'Name of Beneficiary: Codex Scientific (Shanghai) Co., Ltd.\r\nAccount No.: 31050174363600000395\r\n','No','市场助理AL',1599185317,1601172539,0),(33,'Q-JZ202009041','Jiuzhou Medical Equipment Co. LTD','Liu yi','Chaoyang District of Beijing','liuyi@jiuzhou.com','20200904','Beijing Codex Translation Co., Ltd.','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','CNY',2017.26,121.04,2138.30,'Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','No','市场助理ZM',1599186530,1601172532,0),(34,'Q-SHGD202009043','上海光电医疗','Anna','上海','2243073108@qq.com','20200904','Beijing Codex Translation Co., Ltd.','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','CNY',5188544.55,311312.67,5499857.22,'Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','No','scxzjl',1599199994,1601172525,0),(35,'Q-SHGD202009044','上海光电医疗','Anna','上海','2243073108@qq.com','20200904','Beijing Codex Translation Co., Ltd.','681579423541445867','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','CNY',5189.39,311.36,5500.76,'Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ','No','scxzjl',1599200082,1601172519,0),(36,'Q-GDM202009071','高德美可没','Sunny','上海','','20200907','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',420.48,25.23,445.71,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理LYX',1599472702,1601172514,0),(37,'Q-GDM202009072','高德美可没','Sunny','上海','','20200907','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',403.20,24.19,427.39,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理LYX',1599472763,1599472766,0),(38,'Q-GDM202009073','高德美可没','Sunny','上海','','20200907','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',380.37,22.82,403.20,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理LYX',1599472825,1599472828,0),(39,'Q-GDM202009074','高德美可没','Sunny','上海','','20200907','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',397.36,23.84,421.20,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理LYX',1599472913,1601172509,0),(40,'Q-JZ202009101','九州医疗科技有限公司','王亮','湖北省武汉市武昌区','wangliang@qq.com','20200910','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',2027.16,121.63,2148.79,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','Yes','市场助理ZM',1599718078,1601172505,0),(41,'Q-JZ202009102','九州医疗科技有限公司','吴秋','湖北省武汉市武昌区','wuqiu@qq.com','20200910','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',2157.64,129.45,2287.09,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1599718407,1601172501,0),(42,'Q-XH202009217','上海西禾医药有限公司','侯晓','上海市静安区北京西路500号3层3003 室','houxiao@xh.com','20200921','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','CNY',1350.00,81.00,1431.00,'公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','No','市场助理AL',1600678163,1601172497,0),(43,'Q-YYS202009211','新型药品研究所','丽莎','北京市朝阳区','lisa@yaoyansuo.com','20200921','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','CNY',10517.64,631.05,11148.69,'公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','No','市场助理ZM',1600680033,1601172492,0),(44,'Q-YYS202009212','新型药品研究所','吴一','北京市朝阳区','wuyi@yaoyansuo.com','20200921','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','CNY',560.00,33.60,593.60,'公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','No','市场助理ZM',1600680913,1601172482,0),(45,'Q-AB202009241','AABB医疗科技有限公司','陈一','上海市浦东新区','chenyi@aabb.com','20200924','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',947.52,56.85,1004.37,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1600911381,1601172488,0),(46,'Q-AB202009242','AABB医疗科技有限公司','王佳','上海市浦东新区','wnagjia@aabb.com','20200924','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',1082.90,64.97,1147.87,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1600911548,1601172457,0),(47,'Q-AB202009243','AABB医疗科技有限公司','王佳','上海市浦东新区','wnagjia@aabb.com','20200924','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',1082.90,64.97,1147.87,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1600911600,1601174356,0),(48,'Q-XH202009248','上海西禾医药有限公司','唐爽','上海市静安区北京西路500号3层3003 室','tangshuang@xh.com','20200924','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',225.00,13.50,238.50,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理AL',1600931486,1601173764,0),(49,'Q-XH202009249','上海西禾医药有限公司','唐爽','上海市静安区北京西路500号3层3003 室','tangshuang@xh.com','20200924','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',425.00,25.50,450.50,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理AL',1600931610,1601173761,0),(50,'Q-XH2020092410','上海西禾医药有限公司','唐爽','上海市静安区北京西路500号3层3003 室','tangshuang@xh.com','20200924','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',500.00,30.00,530.00,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理AL',1600933792,1601173758,0),(51,'Q-YYS202009243','新型药品研究所','丽莎','北京市朝阳区','lisa@yaoyansuo.com','20200924','科医达商务咨询(上海)有限公司','567811238971244682','上海市静安区安远路1号达安商务楼418室','CNY',1190.00,71.40,1261.40,'公司名称:科医达商务咨询(上海)有限公司\r\n银行账号: 31050174363600000395\r\n\r\n										','No','市场助理AL',1600935109,1601173750,0),(52,'Q-AB202009274','AABB医疗科技有限公司','陈一','上海市浦东新区','chenyi@aabb.com','20200927','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',833.76,50.03,883.79,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1601174550,1601174554,0),(53,'Q-AB202009275','AABB医疗科技有限公司','陈一','上海市浦东新区','chenyi@aabb.com','20200927','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',84.24,5.05,89.29,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1601174649,1601174652,0),(54,'Q-AB202009276','AABB医疗科技有限公司','陈一','上海市浦东新区','chenyi@aabb.com','20200927','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',84.24,5.05,89.29,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1601174708,1601175481,0),(55,'Q-AB202009277','AABB医疗科技有限公司','陈一','上海市浦东新区','chenyi@aabb.com','20200927','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',144.00,8.64,152.64,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1601174818,1601174821,0),(56,'Q-AB202009278','AABB医疗科技有限公司','陈一','上海市浦东新区','chenyi@aabb.com','20200927','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',336.00,20.16,356.16,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1601174956,1601174959,0),(57,'Q-AB202009309','AABB医疗科技有限公司','王佳','上海市浦东新区','wnagjia@aabb.com','20200930','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',576.00,34.56,610.56,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1601450796,1601450824,0),(58,'Q-XH2020093011','上海西禾医药有限公司','侯晓','上海市静安区北京西路500号3层3003 室','houxiao@xh.com','20200930','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',700.00,42.00,742.00,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理AL',1601451234,1601451236,0),(59,'Q-AB2020093010','AABB医疗科技有限公司','王佳','上海市浦东新区','wnagjia@aabb.com','20200930','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',484.20,29.05,513.25,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1601454850,1601454852,0),(60,'Q-AB2020093011','AABB医疗科技有限公司','王佳','上海市浦东新区','wnagjia@aabb.com','20200930','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','EUR',972.00,58.32,1030.32,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1601455078,1601455081,0),(61,'Q-SHGD202009301','上海光电医疗器械有限公司','刘二','上海市','liuer@shanghaiguangdian.com','20200930','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',12969.44,778.17,13747.61,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1601457002,1601457005,0),(62,'Q-SHGD202009302','上海光电医疗器械有限公司','刘二','上海市','liuer@shanghaiguangdian.com','20200930','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',12969.44,778.17,13747.61,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1601457028,1601457031,0),(63,'Q-SHGD202009303','上海光电医疗器械有限公司','刘二','上海市','liuer@shanghaiguangdian.com','20200930','北京科译翻译有限公司','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','CNY',3523.04,211.38,3734.42,'公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','No','市场助理ZM',1601457092,1601457097,0);

/*Table structure for table `ky_mk_quote_table` */

DROP TABLE IF EXISTS `ky_mk_quote_table`;

CREATE TABLE `ky_mk_quote_table` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Quote_Number` varchar(255) DEFAULT NULL COMMENT '报价单编码',
  `Pages` int(9) DEFAULT NULL COMMENT '页数',
  `File_Type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `Job_Name` varchar(255) DEFAULT NULL COMMENT '文件名/内容',
  `Service` varchar(255) DEFAULT NULL COMMENT '服务',
  `Language` varchar(255) DEFAULT NULL COMMENT '语种',
  `Units` varchar(255) DEFAULT NULL COMMENT '单位',
  `Quote_Quantity` decimal(15,2) DEFAULT NULL COMMENT '报价数量',
  `Unit_Price` decimal(15,2) DEFAULT NULL COMMENT '单价/千中文字符',
  `Net_Amount` decimal(15,2) DEFAULT NULL COMMENT '未税金额',
  `VAT_Amount` decimal(15,2) DEFAULT NULL COMMENT '增值税额',
  `Quote_Amount` decimal(15,2) DEFAULT NULL COMMENT '报价金额',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_quote_table` */

insert  into `ky_mk_quote_table`(`id`,`Quote_Number`,`Pages`,`File_Type`,`Job_Name`,`Service`,`Language`,`Units`,`Quote_Quantity`,`Unit_Price`,`Net_Amount`,`VAT_Amount`,`Quote_Amount`,`Filled_by`,`create_time`,`update_time`,`delete_time`) values (1,'Q-APQ202008271',18,'PDF','[01-01]HATT-BYT(RC135-33) Specifications_ENG','翻译','EN-CN','中文字符数（不计空格）',5793.00,0.24,1390.32,83.42,1473.74,NULL,1598525356,1598525356,0),(2,'Q-APQ202008282',61,'PDF','6.4.2.1.1 6002-UE-VP ARIS HiQ Usability Validation Plan Rev 4','翻译','EN-CN','单词',0.00,280.12,0.00,0.00,0.00,NULL,1598610519,1598610519,0),(3,'Q-APQ202008283',61,'PDF','6.4.2.1.1 6002-UE-VP ARIS HiQ Usability Validation Plan Rev 4','翻译','EN-CN','单词',20660.00,280.12,5787279.20,347236.75,6134515.95,NULL,1598610579,1598610579,0),(4,'Q-APQ202008284',61,'PDF','6.4.2.1.1 6002-UE-VP ARIS HiQ Usability Validation Plan Rev 4','翻译','EN-CN','单词',20.66,280.12,5602.40,336.14,5938.54,NULL,1598610640,1598610640,0),(5,'Q-APQ202008285',61,'PDF','6.4.2.1.1 6002-UE-VP ARIS HiQ Usability Validation Plan Rev 4','翻译','EN-CN','单词',20.66,280.12,5602.40,336.14,5938.54,NULL,1598610746,1598610746,0),(6,'Q-APQ202008286',61,'PDF','6.4.2.1.1 6002-UE-VP ARIS HiQ Usability Validation Plan Rev 4','翻译','EN-CN','单词',20.66,280.12,5602.40,336.14,5938.54,NULL,1598610826,1598610826,0),(7,'Q-APQ202008287',61,'PDF','6.4.2.1.1 6002-UE-VP ARIS HiQ Usability Validation Plan Rev 4','翻译','EN-CN','单词',20.66,280.12,5602.40,336.14,5938.54,NULL,1598611000,1598611000,0),(8,'Q-XH202008281',3,'PDF','文献部分内容翻译202007','翻译','EN-CN','中文字符数（不计空格）',2500.00,0.15,375.00,22.50,397.50,NULL,1598611264,1598611264,0),(9,'Q-XH202008281',6,'PDF','说明书翻译','翻译','CN-EN','中文字符数（不计空格）',2000.00,0.20,400.00,24.00,424.00,NULL,1598611264,1598611264,0),(10,'Q-XH202008282',10,'PDF','产品技术要求','翻译','EN-CN','中文字符数（不计空格）',15000.00,0.15,2250.00,135.00,2385.00,NULL,1598613173,1598613173,0),(11,'Q-XH202008283',3,'PDF','临床研究报告','翻译','EN-CN','千中文字符数（不计空格）',1.50,150.00,150.00,9.00,159.00,NULL,1598615970,1598615970,0),(12,'Q-bayer202008281',20,'PDF','注册资料','翻译','CN-EN','中文字符数（不计空格）',6789.00,0.08,543.12,32.59,575.71,NULL,1598617415,1598617415,0),(13,'Q-bayer202008281',10,'PDF','Word','翻译','EN-CN','',1356.00,0.10,135.60,8.14,143.74,NULL,1598617415,1598617415,0),(14,'Q-bayer202008282',20,'PDF','注册资料','翻译','CN-EN','中文字符数（不计空格）',6789.00,0.08,543.12,32.59,575.71,NULL,1598617458,1598617458,0),(15,'Q-bayer202008282',10,'PDF','Word','翻译','EN-CN','单词',1356.00,0.10,135.60,8.14,143.74,NULL,1598617458,1598617458,0),(16,'Q-BL202009011',29,'PDF','CHVI-356710_VP-48455-F1E-20200_MB-012','翻译','EN-CN','中文字符数（不计空格）',5696.00,0.26,1480.96,88.86,1569.82,NULL,1598952164,1598952164,0),(17,'Q-BL202009012',46,'PDF','血液透析','翻译','CN-EN','中文字符数（不计空格）',13547.00,0.38,5147.86,308.87,5456.73,NULL,1598952447,1598952447,0),(18,'Q-BL202009012',46,'PDF','血液透析','排版','CN-EN','页',46.00,20.00,920.00,55.20,975.20,NULL,1598952447,1598952447,0),(19,'Q-APQ202009018',18,'PDF','[01-01]HATT-BYT(RC135-33) Specifications_ENG','翻译','EN-CN','中文字符数（不计空格）',5793.00,0.24,1390.32,83.42,1473.74,NULL,1598953516,1598953516,0),(20,'Q-APQ202009019',61,'PDF','6.4.2.1.1 6002-UE-VP ARIS HiQ Usability Validation Plan Rev 4','翻译','EN-CN','单词',20.66,280.12,5787.28,347.24,6134.52,NULL,1598953572,1598953572,0),(21,'Q-APQ2020090110',61,'PDF','6.4.2.1.1 6002-UE-VP ARIS HiQ Usability Validation Plan Rev 4','翻译','EN-CN','单词',20.66,280.12,5787.28,347.24,6134.52,NULL,1598953596,1598953596,0),(22,'Q-APQ2020090111',61,'PDF','6.4.2.1.1 6002-UE-VP ARIS HiQ Usability Validation Plan Rev 4','翻译','EN-CN','单词',20.66,280.12,5787.28,347.24,6134.52,NULL,1598953753,1598953753,0),(23,'Q-APQ2020090111',28,'PDF','6.4.2.3.1 ARIS HiQ Usability Report Issue 1 - Fully Signed','翻译','EN-CN','单词',6.18,280.12,1731.14,103.87,1835.01,NULL,1598953753,1598953753,0),(24,'Q-APQ2020090111',35,'PDF','6.4.3.1.1 6002-UE-VP2 ARIS HiQ Follow-Up Usability Validation Plan Issue 1 25-04-2019 - Fully Signed','翻译','EN-CN','单词',10.19,280.12,2854.42,171.27,3025.69,NULL,1598953753,1598953753,0),(25,'Q-APQ2020090112',28,'PDF','6.4.2.3.1 ARIS HiQ Usability Report Issue 1 - Fully Signed','翻译','EN-CN','单词',6.18,280.12,1731.14,103.87,1835.01,NULL,1598954278,1598954278,0),(26,'Q-APQ2020090112',35,'PDF','6.4.3.1.1 6002-UE-VP2 ARIS HiQ Follow-Up Usability Validation Plan Issue 1 25-04-2019 - Fully Signed','翻译','EN-CN','单词',10.19,280.12,2854.42,171.27,3025.69,NULL,1598954278,1598954278,0),(27,'Q-HDZZ202009031',55,'PDF','1398-2-0007-00 MGISP-NE32 产品风险管','翻译','CN-EN','中文字符数（不计空格）',16399.00,0.22,3607.78,216.47,3824.25,NULL,1599096429,1599096429,0),(28,'Q-HDZZ202009032',1,'Excel','错误场景V1.0_20200714','翻译','CN-EN','中文字符数（不计空格）',26683.00,0.22,5870.26,352.22,6222.48,NULL,1599097175,1599097175,0),(29,'Q-SHGD202009031',5,'PDF','附件1_産科危機的出血への対','翻译','JP-CN','中文字符数（不计空格）',6453.00,0.18,1161.54,69.69,1231.23,NULL,1599098195,1599098195,0),(30,'Q-SHGD202009031',1,'PDF','2.附件4_《Validation of inflationary non-invasive blood pressure monitoring in emergency room patients》','翻译','EN-CN','中文字符数（不计空格）',826.00,0.16,132.16,7.93,140.09,NULL,1599098195,1599098195,0),(31,'Q-SHGD202009031',5,'PDF','3.附件5_《Validation of inflationary noninvasive blood pressure monitoring in emergency room》','翻译','EN-CN','中文字符数（不计空格）',9238.00,0.16,1478.08,88.68,1566.76,NULL,1599098195,1599098195,0),(32,'Q-SHGD202009032',5,'PDF','附件1_産科危機的出血への対','翻译','JP-CN','中文字符数（不计空格）',6453.00,0.17,1097.01,65.82,1162.83,NULL,1599098372,1599098372,0),(33,'Q-SHGD202009032',1,'PDF','2.附件4_《Validation of inflationary non-invasive blood pressure monitoring in emergency room patients》','翻译','EN-CN','中文字符数（不计空格）',826.00,0.15,123.90,7.43,131.33,NULL,1599098372,1599098372,0),(34,'Q-SHGD202009032',5,'PDF','3.附件5_《Validation of inflationary noninvasive blood pressure monitoring in emergency room》','翻译','EN-CN','中文字符数（不计空格）',9238.00,0.15,1385.70,83.14,1468.84,NULL,1599098372,1599098372,0),(35,'Q-XH202009034',10,'PDF','宣传册翻译','翻译','EN-CN','中文字符数（不计空格）',15000.00,0.15,2250.00,135.00,2385.00,NULL,1599122670,1599122670,0),(36,'Q-XH202009035',5,'PDF','产品技术要求0903','翻译','EN-CN','中文字符数（不计空格）',3000.00,0.15,450.00,27.00,477.00,NULL,1599125176,1599125176,0),(37,'Q-XH202009036',5,'PDF','产品技术要求0903','翻译','EN-CN','中文字符数（不计空格）',1.50,150.00,225.00,13.50,238.50,NULL,1599127246,1599127246,0),(38,'Q-SE202009031',2,'PDF','NaOH_B1387282_Invoice','翻译','EN-CN','中文字符数（不计空格）',563.00,0.26,146.38,8.78,155.16,NULL,1599128285,1599128285,0),(39,'Q-SE202009031',1,'PDF','Stopper_D000089723_Invoice','翻译','EN-CN','中文字符数（不计空格）',233.00,0.26,60.58,3.63,64.21,NULL,1599128285,1599128285,0),(40,'Q-SE202009032',2,'PDF','NaOH_B1387282_Invoice','翻译','EN-CN','中文字符数（不计空格）',563.00,0.26,146.38,8.78,155.16,NULL,1599128416,1599128416,0),(41,'Q-SE202009032',1,'PDF','Stopper_D000089723_Invoice','翻译','EN-CN','中文字符数（不计空格）',245.00,0.26,63.70,3.82,67.52,NULL,1599128416,1599128416,0),(42,'Q-SE202009033',9,'PDF','《化学药品非处方药上市注册技术指导原则（征求意见稿）》','翻译','CN-EN','中文字符数（不计空格）',3516.00,0.38,1336.08,80.16,1416.24,NULL,1599128950,1599128950,0),(43,'Q-SE202009044',4,'PDF','外包装翻译','翻译','EN-CN','中文字符数（不计空格）',345.00,0.26,89.70,5.38,95.08,NULL,1599184336,1599184336,0),(44,'Q-RPGI202009041',1,'PDF','labelling','Translation','EN-CN','Words',67.00,0.20,13.40,0.00,13.40,NULL,1599185199,1599185199,0),(45,'Q-RPGI202009041',0,'','Bank Charge','','','Project',1.00,50.00,50.00,0.00,50.00,NULL,1599185199,1599185199,0),(46,'Q-RPGI202009042',1,'PDF','labelling','Translation','EN-CN','Words',67.00,0.20,13.40,0.00,13.40,NULL,1599185317,1599185317,0),(47,'Q-RPGI202009042',1,'','Bank Charge','','','Project',1.00,50.00,50.00,0.00,50.00,NULL,1599185317,1599185317,0),(48,'Q-JZ202009041',17,'PDF','DF-134419-RV04-Stellant PSUR','Translation','EN-CN','Chinese Characters (No space)',6453.00,0.26,1677.78,100.67,1778.45,NULL,1599186530,1599186530,0),(49,'Q-JZ202009041',5,'Word','Vayego bee semi-field study','Translation','CN-EN','Chinese Characters (No space)',943.00,0.36,339.48,20.37,359.85,NULL,1599186530,1599186530,0),(50,'Q-SHGD202009043',11,'PDF','风险管理表_中文版_検証欄20190309','Translation','CN-EN','Thousand Chinese Characters (No space)',30555.00,169.81,5188544.55,311312.67,5499857.22,NULL,1599199994,1599199994,0),(51,'Q-SHGD202009044',11,'PDF','风险管理表_中文版_検証欄20190309','Translation','CN-EN','Thousand Chinese Characters (No space)',30.56,169.81,5189.39,311.36,5500.76,NULL,1599200082,1599200082,0),(52,'Q-GDM202009071',4,'PDF','Alfasigma International','翻译','EN-CN','千中文字符数（不计空格）',2336.00,0.18,420.48,25.23,445.71,NULL,1599472702,1599472702,0),(53,'Q-GDM202009072',4,'PDF','Alfasigma International','翻译','EN-CN','千中文字符数（不计空格）',2.24,180.00,403.20,24.19,427.39,NULL,1599472763,1599472763,0),(54,'Q-GDM202009073',4,'PDF','Alfasigma International','翻译','EN-CN','千中文字符数（不计空格）',2.24,169.81,380.37,22.82,403.20,NULL,1599472825,1599472825,0),(55,'Q-GDM202009074',4,'PDF','Alfasigma International','翻译','EN-CN','千中文字符数（不计空格）',2.34,169.81,397.36,23.84,421.20,NULL,1599472913,1599472913,0),(56,'Q-JZ202009101',6,'PDF','1. A11_CO_VR_150559_EN_01','翻译','EN-CN','中文字符数（不计空格）',1510.00,0.28,422.80,25.37,448.17,NULL,1599718078,1599718078,0),(57,'Q-JZ202009101',29,'PDF','1. A11_VR_147478_EN_02_&Att','翻译','CN-EN','中文字符数（不计空格）',4222.00,0.38,1604.36,96.26,1700.62,NULL,1599718078,1599718078,0),(58,'Q-JZ202009102',17,'Word','4. A11_VR_149730_EN_01','翻译','EN-CN','中文字符数（不计空格）',5111.00,0.28,1431.08,85.86,1516.94,NULL,1599718407,1599718407,0),(59,'Q-JZ202009102',7,'PDF','5. A11_CO_VR_150631_EN_01','翻译','CN-EN','中文字符数（不计空格）',1912.00,0.38,726.56,43.59,770.15,NULL,1599718407,1599718407,0),(60,'Q-XH202009217',9,'PDF','MRI Description','翻译','EN-CN','中文字符数（不计空格）',5000.00,0.15,750.00,45.00,795.00,NULL,1600678163,1600678163,0),(61,'Q-XH202009217',10,'Word','研究项目','翻译','CN-EN','中文字符数（不计空格）',3000.00,0.20,600.00,36.00,636.00,NULL,1600678163,1600678163,0),(62,'Q-YYS202009211',63,'PDF','20289_CN_54002-019_NGS report','翻译','EN-CN','中文字符数（不计空格）',35611.00,0.28,9971.08,598.26,10569.34,NULL,1600680033,1600680033,0),(63,'Q-YYS202009211',4,'PDF','20289_CN_54002-018_Pathology report','翻译','CN-EN','中文字符数（不计空格）',1952.00,0.28,546.56,32.79,579.35,NULL,1600680033,1600680033,0),(64,'Q-YYS202009212',3,'PDF','Tobias Maurer - Martini-Klinik Hamburg','翻译','EN-CN','中文字符数（不计空格）',1000.00,0.28,280.00,16.80,296.80,NULL,1600680913,1600680913,0),(65,'Q-YYS202009212',2,'PDF','Thomas Steuber - Martini-Klinik Hamburg','翻译','EN-CN','中文字符数（不计空格）',1000.00,0.28,280.00,16.80,296.80,NULL,1600680913,1600680913,0),(66,'Q-AB202009241',14,'PDF','20290_54001_54001007_NGS Report-1','翻译','EN-CN','千中文字符数（不计空格）',5.64,168.00,947.52,56.85,1004.37,NULL,1600911381,1600911381,0),(67,'Q-AB202009242',10,'','食品安全国家标准 植物源性食品中甜菜安残留量的测定 液相色谱-质谱联用法（征求意见稿）.docx (002)','','CN-EN','千中文字符数（不计空格）',4.55,238.00,1082.90,64.97,1147.87,NULL,1600911548,1600911548,0),(68,'Q-AB202009243',10,'PDF','食品安全国家标准 植物源性食品中甜菜安残留量的测定 液相色谱-质谱联用法（征求意见稿）.docx (002)','翻译','CN-EN','千中文字符数（不计空格）',4.55,238.00,1082.90,64.97,1147.87,NULL,1600911600,1600911600,0),(69,'Q-XH202009248',5,'PDF','产品对比表','翻译','EN-CN','中文字符数（不计空格）',1500.00,0.15,225.00,13.50,238.50,NULL,1600931486,1600931486,0),(70,'Q-XH202009249',5,'PDF','产品对比表','翻译','EN-CN','中文字符数（不计空格）',1500.00,0.15,225.00,13.50,238.50,NULL,1600931610,1600931610,0),(71,'Q-XH202009249',3,'PDF','产品补单','翻译','CN-EN','中文字符数（不计空格）',1000.00,0.20,200.00,12.00,212.00,NULL,1600931610,1600931610,0),(72,'Q-XH2020092410',2,'PDF','技术要求补单','翻译','EN-CN','千中文字符数（不计空格）',2.50,200.00,500.00,30.00,530.00,NULL,1600933792,1600933792,0),(73,'Q-YYS202009243',10,'PDF','食品安全国家标准 植物源性食品中甜菜安残留量的测定 液相色谱-质谱联用法（征求意见稿）.docx (002)','翻译','CN-EN','千中文字符数（不计空格）',5.00,238.00,1190.00,71.40,1261.40,NULL,1600935109,1600935109,0),(74,'Q-AB202009274',8,'PDF','总结报告-拜耳-20170825','翻译','CN-EN','中文字符数（不计空格）',2316.00,0.36,833.76,50.03,883.79,NULL,1601174550,1601174550,0),(75,'Q-AB202009275',2,'','P.5.1.01 Release Specification Elevit Pronatal (1610473) of sample test-022754065_2','翻译','','中文字符数（不计空格）',234.00,0.36,84.24,5.05,89.29,NULL,1601174649,1601174649,0),(76,'Q-AB202009276',2,'PDF','P.5.1.01 Release Specification Elevit Pronatal (1610473) of sample test-022754065_2','翻译','EN-CN','中文字符数（不计空格）',234.00,0.36,84.24,5.05,89.29,NULL,1601174708,1601174708,0),(77,'Q-AB202009277',2,'PDF','Aug 2020 Larotrectinib SUSAR Monthly submission','翻译','EN-CN','中文字符数（不计空格）',400.00,0.36,144.00,8.64,152.64,NULL,1601174818,1601174818,0),(78,'Q-AB202009278',5,'PDF','Aug 2020 ATR inhibitor SUSAR Monthly submission','翻译','','单词',1200.00,0.28,336.00,20.16,356.16,NULL,1601174956,1601174956,0),(79,'Q-AB202009309',4,'PDF','附件2 药品不良反应报告和监测检查资料清单','翻译','CN-EN','中文字符数（不计空格）',1600.00,0.36,576.00,34.56,610.56,NULL,1601450796,1601450796,0),(80,'Q-XH2020093011',10,'Word','注册法规对比翻译','翻译','CN-EN','中文字符数（不计空格）',3500.00,0.20,700.00,42.00,742.00,NULL,1601451234,1601451234,0),(81,'Q-AB2020093010',6,'PDF','Redoxon_Avoiding infections','翻译','EN-CN','中文字符数（不计空格）',1345.00,0.36,484.20,29.05,513.25,NULL,1601454850,1601454850,0),(82,'Q-AB2020093011',8,'PDF','上海市浦东新区市场监督管理局关于开展药品上市许可持有人药物警戒检查工作的通知','翻译','CN-EN','中文字符数（不计空格）',2700.00,0.36,972.00,58.32,1030.32,NULL,1601455078,1601455078,0),(83,'Q-SHGD202009301',44,'PDF','T 2.02-16','翻译','EN-CN','中文字符数（不计空格）',7828.00,0.28,2191.84,131.51,2323.35,NULL,1601457002,1601457002,0),(84,'Q-SHGD202009301',2,'PDF','T 2.20-09','翻译','EN-CN','中文字符数（不计空格）',1000.00,0.28,280.00,16.80,296.80,NULL,1601457002,1601457002,0),(85,'Q-SHGD202009301',4,'','BHC159020 PCT-CN Claims in CN','','','千中文字符数（不计空格）',29.16,360.00,10497.60,629.86,11127.46,NULL,1601457002,1601457002,0),(86,'Q-SHGD202009302',44,'PDF','T 2.02-16','翻译','EN-CN','中文字符数（不计空格）',7828.00,0.28,2191.84,131.51,2323.35,NULL,1601457028,1601457028,0),(87,'Q-SHGD202009302',2,'PDF','T 2.20-09','翻译','EN-CN','中文字符数（不计空格）',1000.00,0.28,280.00,16.80,296.80,NULL,1601457028,1601457028,0),(88,'Q-SHGD202009302',4,'PDF','BHC159020 PCT-CN Claims in CN','翻译','CN-EN','千中文字符数（不计空格）',29.16,360.00,10497.60,629.86,11127.46,NULL,1601457028,1601457028,0),(89,'Q-SHGD202009303',44,'PDF','T 2.02-16','翻译','EN-CN','中文字符数（不计空格）',7828.00,0.28,2191.84,131.51,2323.35,NULL,1601457092,1601457092,0),(90,'Q-SHGD202009303',2,'PDF','T 2.20-09','翻译','EN-CN','中文字符数（不计空格）',1000.00,0.28,280.00,16.80,296.80,NULL,1601457092,1601457092,0),(91,'Q-SHGD202009303',4,'PDF','BHC159020 PCT-CN Claims in CN','翻译','CN-EN','千中文字符数（不计空格）',2.92,360.00,1051.20,63.07,1114.27,NULL,1601457092,1601457092,0);

/*Table structure for table `ky_my_schedule` */

DROP TABLE IF EXISTS `ky_my_schedule`;

CREATE TABLE `ky_my_schedule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `date_time` varchar(255) DEFAULT NULL COMMENT '日期时间',
  `type` varchar(10) DEFAULT NULL COMMENT '时间类型',
  `work_info` varchar(255) DEFAULT NULL COMMENT '工作内容',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_my_schedule` */

/*Table structure for table `ky_pj_client_feedback` */

DROP TABLE IF EXISTS `ky_pj_client_feedback`;

CREATE TABLE `ky_pj_client_feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Filing_Code` varchar(255) DEFAULT NULL COMMENT '文件编号',
  `Job_Name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `Company_Name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `Attention` varchar(255) DEFAULT NULL COMMENT '客户联系人',
  `Completed` int(11) DEFAULT NULL COMMENT '交付日期',
  `Translator` varchar(255) DEFAULT NULL COMMENT '翻译人员',
  `Direct_Supervisor1` varchar(255) DEFAULT NULL COMMENT '直属管理',
  `Reviser` varchar(255) DEFAULT NULL COMMENT '校对人员',
  `Direct_Supervisor2` varchar(255) DEFAULT NULL COMMENT '直属管理',
  `Pre_Formatter` varchar(255) DEFAULT NULL COMMENT '预排版人员',
  `Direct_Supervisor3` varchar(255) DEFAULT NULL COMMENT '直属管理',
  `Post_Formatter` varchar(255) DEFAULT NULL COMMENT '后排版人员',
  `Direct_Supervisor4` varchar(255) DEFAULT NULL COMMENT '直属管理',
  `PA` varchar(255) DEFAULT NULL COMMENT '项目助理',
  `Customer_Feedback` varchar(255) DEFAULT NULL COMMENT '客户反馈',
  `Feedback_Contents` text COMMENT '反馈内容',
  `Bad_Feedback_Date` varchar(255) DEFAULT NULL COMMENT '不良反馈时间',
  `Fault_Rate` decimal(6,2) DEFAULT NULL COMMENT '不良比率',
  `Fault_Description` text COMMENT '事项及不良现象描述',
  `Cause_Analysis` text COMMENT '原因分析',
  `Corrective_Actions` text COMMENT '纠正措施',
  `Customer_Comments` text COMMENT '客户评价',
  `Follow_Up` text COMMENT '后续跟进',
  `Quality_Manager` varchar(255) DEFAULT NULL COMMENT '质量经理',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_client_feedback` */

insert  into `ky_pj_client_feedback`(`id`,`Filing_Code`,`Job_Name`,`Company_Name`,`Attention`,`Completed`,`Translator`,`Direct_Supervisor1`,`Reviser`,`Direct_Supervisor2`,`Pre_Formatter`,`Direct_Supervisor3`,`Post_Formatter`,`Direct_Supervisor4`,`PA`,`Customer_Feedback`,`Feedback_Contents`,`Bad_Feedback_Date`,`Fault_Rate`,`Fault_Description`,`Cause_Analysis`,`Corrective_Actions`,`Customer_Comments`,`Follow_Up`,`Quality_Manager`,`Filled_by`,`delete_time`) values (1,'F-20200827APQ01','[01-01]HATT-BYT(RC135-33) Specifications_ENG','艾普强','Cherry',20200831,'翻译张三',NULL,'校对张三',NULL,'预排张三',NULL,'后排李四',NULL,'项目助理ZYX','Good','','2020-09-03 15:41',20.00,'fafdsf','dasfadfds','dasfdsg','Good','Good',NULL,'项目经理LG',0),(2,'F-20200828XH02','文献部分内容翻译202007','西禾','王科',20200828,'翻译张三',NULL,'校对张三',NULL,'预排张三',NULL,'后排张三',NULL,'项目助理XJY','Non','','',0.00,'','','','','',NULL,'项目经理LG',0),(3,'F-20200827APQ01','[01-01]HATT-BYT(RC135-33) Specifications_ENG','艾普强','Cherry',20200831,'翻译张三',NULL,'校对张三',NULL,'预排张三',NULL,'后排李四',NULL,'项目助理ZYX','Non','','',0.00,'','','','','',NULL,'项目经理LG',0);

/*Table structure for table `ky_pj_contract_review` */

DROP TABLE IF EXISTS `ky_pj_contract_review`;

CREATE TABLE `ky_pj_contract_review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Filing_Code` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '文件编号',
  `Job_Name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '文件名称',
  `Company_Name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '公司名称',
  `Pages` int(10) DEFAULT NULL COMMENT '页数',
  `Source_Text_Word_Count` int(10) DEFAULT NULL COMMENT '源语数量',
  `File_Type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '文件类型',
  `Service` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '服务',
  `File_Category` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '文件分类',
  `Language` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '语种',
  `Format_Difficulty` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '排版难易程度',
  `Translation_Difficulty` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '翻译难易程度',
  `Translator` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '翻译人员',
  `Translation_Start_Time` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '翻译开始时间',
  `Translation_Delivery_Time` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '翻译交付时间',
  `Reviser` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '校对人员',
  `Revision_Start_Time` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '校对开始时间',
  `Revision_Delivery_Time` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '校对交付时间',
  `Pre_Formatter` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预排版人员',
  `Pre_Format_Delivery_Time` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预排版交付时间',
  `Post_Formatter` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '后排版人员',
  `Post_Format_Delivery_Time` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '后排版交付时间',
  `Delivery_Date_Expected` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '客户期望提交日期',
  `Completed` int(10) DEFAULT NULL COMMENT '交付日期',
  `Delivered_or_Not` varchar(10) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'No' COMMENT '是否交稿',
  `Attention` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '客户联系人',
  `Customer_Requirements` text CHARACTER SET utf8mb4 COMMENT '客户要求',
  `External_Reference_File` text CHARACTER SET utf8mb4 COMMENT '客户参考文件',
  `Quote_Number` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '报价单编号',
  `First_Cooperation` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '是否首次合作',
  `Quality_Requirements` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '质量要求',
  `PA` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '项目助理',
  `PM` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '项目经理',
  `Sales` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '销售',
  `Approval_Project_Manager` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '项目经理批准',
  `Approval_General_Manager` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '总经理批准',
  `Filled_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '填表人',
  `Date` int(10) DEFAULT NULL COMMENT '创建时间',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_esperanto_ci;

/*Data for the table `ky_pj_contract_review` */

insert  into `ky_pj_contract_review`(`id`,`Filing_Code`,`Job_Name`,`Company_Name`,`Pages`,`Source_Text_Word_Count`,`File_Type`,`Service`,`File_Category`,`Language`,`Format_Difficulty`,`Translation_Difficulty`,`Translator`,`Translation_Start_Time`,`Translation_Delivery_Time`,`Reviser`,`Revision_Start_Time`,`Revision_Delivery_Time`,`Pre_Formatter`,`Pre_Format_Delivery_Time`,`Post_Formatter`,`Post_Format_Delivery_Time`,`Delivery_Date_Expected`,`Completed`,`Delivered_or_Not`,`Attention`,`Customer_Requirements`,`External_Reference_File`,`Quote_Number`,`First_Cooperation`,`Quality_Requirements`,`PA`,`PM`,`Sales`,`Approval_Project_Manager`,`Approval_General_Manager`,`Filled_by`,`Date`,`delete_time`) values (1,'F-20200827APQ01','[01-01]HATT-BYT(RC135-33) Specifications_ENG','艾普强',18,1616,'PDF','翻译','医疗器械-研究者手册','EN-CN','Normal','Normal','翻译张三','2020-08-29 15:00','2020-08-29 17:00','校对张三','2020-08-29 17:00','2020-08-29 19:00','预排张三','2020-08-28 12:00','后排李四','2020-08-29 23:00','2020-08-31 23:00',20200831,'Yes','Cherry','','','','No','Normal','项目助理ZYX','项目经理TJ','','Yes',NULL,'admin',20200827,0),(2,'F-20200828XH02','文献部分内容翻译202007','西禾',3,810,'PDF','翻译','医疗器械-研究者手册','EN-CN','Normal','Normal','翻译张三','2020-08-28 11:00','2020-08-28 12:00','校对张三','2020-08-28 13:00','2020-08-28 14:00','预排张三','2020-08-28 10:00','后排张三','2020-08-28 16:00','2020-08-31 23:00',20200828,'No','王科','','','Q-XH202008281','No','High','项目助理XJY','项目经理TJ','','Yes',NULL,'项目经理TJ',20200828,0),(3,'F-20200828XH01','说明书翻译','西禾',6,1685,'PDF','翻译','医疗器械-研究者手册','CN-EN','Easy','Normal','翻译张三','2020-08-28 08:30','2020-08-28 11:00','校对张三','2020-08-28 11:00','2020-08-28 12:00','N/A','','后排张三','2020-08-28 14:00','2020-08-31 23:00',20200829,'No','王科','','','Q-XH202008281','No','Normal','项目助理XJY','项目经理TJ','销售张三','Yes',NULL,'项目经理TJ',20200828,0),(4,'F-20200828XH03','产品技术要求','西禾',10,5000,'PDF','翻译','医疗器械-研究者手册','EN-CN','Normal','Normal','翻译李四','2020-08-28 09:00','2020-08-28 12:00','N/A','','','N/A','','后排李四','2020-08-28 23:00','2020-08-29 23:00',20200829,'No','金磊','','',NULL,'No','','项目助理XJY','项目经理TJ','','Yes',NULL,'项目经理TJ',20200828,0),(5,'F-20200831bayer02','注册资料','拜耳',20,4567,'PDF','翻译','','CN-EN','','','','','','','','','','','','','20200830',0,'No','李四','','','Q-bayer202008282','Yes','','','','','Yes',NULL,'admin',20200831,0),(6,'F-20200831bayer01','Word','拜耳',10,1256,'PDF','翻译','医疗器械-研究者手册','EN-CN','Easy','Easy','翻译张三','2020-08-31 16:07','2020-08-28 11:00','校对张三','','','预排张三','2020-08-31 10:00','','','2020-08-31 23:00',0,'No','李四','','','Q-bayer202008282','Yes','High','项目助理SM','项目经理TJ','销售张三','Yes',NULL,'admin',20200831,0),(7,'F-20200901BL02','血液透析','BEILANG',46,12347,'PDF','翻译','','CN-EN','','','','','','','','','','','','','2020-09-15 23:00',20200903,'No','cheng xue yi','电子提交格式','','Q-BL202009012','Yes','','','','','Yes',NULL,'admin',20200901,0),(8,'F-20200901BL03','CHVI-356710_VP-48455-F1E-20200_MB-012','BEILANG',29,4568,'PDF','翻译',NULL,'EN-CN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-05 23:00',NULL,'No','Ally','电子提交格式','','Q-BL202009011','Yes',NULL,NULL,NULL,'朱悦','Yes',NULL,NULL,20200901,0),(9,'F-20200903HDZZ01','1398-2-0007-00 MGISP-NE32 产品风险管','华大智造',55,14656,'PDF','翻译',NULL,'CN-EN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-03 09:30',0,'No','Kelly','','','','No',NULL,NULL,NULL,'王青','Yes',NULL,NULL,20200903,0),(10,'F-20200903XH03','宣传册翻译','西禾',10,5000,'PDF','翻译','','EN-CN','','','','','','','','','','','','','2020-09-08 23:00',20200903,'No','侯晓','','','Q-XH202009034','No','','','','','Yes',NULL,'admin',20200903,0),(11,'F-20200903HDZZ02','错误场景V1.0_20200714','华大智造',1,23094,'Excel','翻译',NULL,'CN-EN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-03 10:00',20200903,'No','Kelly','','','Q-HDZZ202009032','No',NULL,NULL,NULL,'王青','Yes',NULL,NULL,20200903,0),(12,'F-20200901BL01','血液透析','BEILANG',46,12347,'PDF','排版',NULL,'CN-EN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-15 23:00',NULL,'No','cheng xue yi','电子提交格式','','Q-BL202009012','Yes',NULL,NULL,NULL,'朱悦','Yes',NULL,NULL,20200901,0),(13,'F-20200828XH03','产品技术要求','西禾',10,5000,'PDF','翻译',NULL,'EN-CN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'No','金磊','','','Q-XH202008282','No',NULL,NULL,NULL,'弓长',NULL,NULL,NULL,20200828,1600740512),(14,'F-20200903SE06','NaOH_B1387282_Invoice','SHIER',2,411,'PDF','翻译',NULL,'EN-CN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-07 23:00',NULL,'No','liyanchao','','','Q-SE202009032','No',NULL,NULL,NULL,'朱悦','Yes',NULL,NULL,20200903,0),(15,'F-20200903SE05','Stopper_D000089723_Invoice','SHIER',1,177,'PDF','翻译',NULL,'EN-CN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-07 23:00',NULL,'No','liyanchao','','','Q-SE202009032','No',NULL,NULL,NULL,'朱悦','Yes',NULL,NULL,20200903,0),(16,'F-20200903SE07','《化学药品非处方药上市注册技术指导原则（征求意见稿）》','SHIER',9,3316,'PDF','翻译',NULL,'CN-EN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-10 23:00',0,'No','lili','','','Q-SE202009033','No',NULL,NULL,NULL,'朱悦','Yes',NULL,NULL,20200903,0),(17,'F-20200904SE01','外包装翻译','SHIER',4,300,'PDF','翻译','N/A','EN-CN','Normal','Normal','','','','','','','','','','','2020-09-04 12:00',20200904,'No','liyanchao','','','Q-SE202009044','No','','项目助理ZJ','项目经理LG','','Yes',NULL,'项目经理LG',20200904,0),(18,'F-20200904RPGI02','labelling','RapiGEN',1,67,'PDF','翻译','N/A','EN-CN','Normal','Difficult','','','','','','','','','','','',20200904,'No','Sally','','','Q-RPGI202009042','Yes','','项目助理ZJ','项目经理LG','','Yes',NULL,'项目经理LG',20200904,0),(19,'F-20200904JZ09','DF-134419-RV04-Stellant PSUR','Jiuzhou Medical',17,5642,'PDF','翻译','N/A','EN-CN','Normal','Normal','','','','','','','','','','','2020-09-07 18:00',20200907,'No','Liu yi','','','Q-JZ202009041','No','','项目助理SM','项目经理LG','','Yes',NULL,'项目经理LG',20200904,0),(20,'F-20200904JZ08','Vayego bee semi-field study','Jiuzhou Medical',5,682,'Word','翻译','医疗器械-临床评价','CN-EN','Normal','Normal','','','','','','','','','','','2020-09-07 18:00',20200907,'No','Liu yi','','','Q-JZ202009041','No','','项目助理SM','项目经理LG','','Yes',NULL,'项目经理LG',20200904,0),(21,'F-20200911WTYP03','2018 FDA EIR','武田',56,12222,'PDF','翻译',NULL,'EN-CN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-11 23:00',NULL,'No','高妍','','',NULL,'No',NULL,NULL,NULL,'王青','Yes',NULL,NULL,20200911,0),(22,'F-20200911WTYP02','Appendix 1-1 CP reviewed','武田',2,396,'Word','翻译',NULL,'EN-CN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'No','郑燕','','',NULL,'No',NULL,NULL,NULL,'王青','Yes',NULL,NULL,20200911,0),(23,'F-20200911WTYP01','Complete version registration history EN','武田',3,840,'Word','翻译',NULL,'EN-CN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'20200914',NULL,'No','郑燕','','',NULL,'No',NULL,NULL,NULL,'王青','Yes',NULL,NULL,20200911,0),(24,'F-20200910JZ02','1. A11_CO_VR_150559_EN_01','九州医疗',6,1010,'PDF','翻译',NULL,'EN-CN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-14 23:00',NULL,'No','王亮','','','Q-JZ202009101','Yes',NULL,NULL,NULL,'朱悦','Yes',NULL,NULL,20200910,0),(25,'F-20200910JZ01','1. A11_VR_147478_EN_02_&Att','九州医疗',29,3722,'PDF','翻译',NULL,'CN-EN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-14 23:00',NULL,'No','王亮','','','Q-JZ202009101','Yes',NULL,NULL,NULL,'朱悦','Yes',NULL,NULL,20200910,0),(26,'F-20200903XH04','产品技术要求0903','西禾',5,1000,'PDF','翻译','','EN-CN','','','','','','','','','','','','','2020-09-07 23:00',20200924,'No','唐爽','','',NULL,'No','','','项目经理TJ','','Yes',NULL,'admin',20200903,0),(27,'F-20200904RPGI03','Bank Charge','RapiGEN',1,0,'','','','','','','','','','','','','','','','','',0,'','Sally','','',NULL,'Yes','','','项目经理TJ','','Yes',NULL,'项目经理TJ',20200904,0),(28,'F-20200904JZ04','Vayego bee semi-field study','Jiuzhou Medical',5,682,'Word','翻译','','CN-EN','','','','','','','','','','','','','2020-09-07 18:00',0,'','Liu yi','','',NULL,'No','','','项目经理LG','','Yes',NULL,'项目经理TJ',20200904,0),(29,'F-20200904JZ05','DF-134419-RV04-Stellant PSUR','Jiuzhou Medical',17,5642,'PDF','翻译','','EN-CN','','','','','','','','','','','','','2020-09-07 18:00',20200924,'No','Liu yi','','',NULL,'No','','','项目经理LG','','Yes',NULL,'admin',20200904,0),(30,'F-20200904JZ06','Vayego bee semi-field study','Jiuzhou Medical',5,682,'Word','翻译','','CN-EN','','','','','','','','','','','','','2020-09-07 18:00',20200907,'','Liu yi','','',NULL,'No','','','项目经理LG','','Yes',NULL,'项目经理TJ',20200904,0),(31,'F-20200904JZ07','DF-134419-RV04-Stellant PSUR','Jiuzhou Medical',17,5642,'PDF','翻译','','EN-CN','','','','','','','','','','','','','2020-09-07 18:00',20200907,'No','Liu yi','','',NULL,'No','','','项目经理LG','','Yes',NULL,'系统管理员',20200904,0),(32,'F-20200921YYS06','Tobias Maurer - Martini-Klinik Hamburg','药研所',3,345,'PDF','翻译','N/A','EN-CN','Easy','Difficult','翻译张三','2020-09-24 09:30','2020-09-24 15:30','校对张三','2020-09-25 10:00','2020-09-25 17:00','预排张三','2020-09-23 17:00','后排张三','2020-09-26 10:00','2020-09-24 23:00',20200926,'No','吴一','','',NULL,'No','High','项目助理SM','项目经理TJ','',NULL,NULL,'admin',20200921,0),(33,'F-20200924AB03','20290_54001_54001007_NGS Report-1','AB医疗',14,4384,'PDF','翻译',NULL,'EN-CN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-28 00:00',20200928,'No','陈一','','','Q-AB202009241','Yes',NULL,NULL,NULL,'朱悦',NULL,NULL,NULL,20200924,0),(34,'F-20200924AB02','食品安全国家标准 植物源性食品中甜菜安残留量的测定 液相色谱-质谱联用法（征求意见稿）.docx (002)','AB医疗',10,3512,'PDF','翻译',NULL,'CN-EN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-28 23:00',20200928,'No','王佳','','','Q-AB202009243','No',NULL,NULL,NULL,'朱悦',NULL,NULL,NULL,20200924,0),(35,'F-20200924XH07','技术要求补单','西禾',2,1500,'PDF','翻译','医疗器械-研究者手册','EN-CN','Normal','Normal','翻译张三','2020-09-28 08:00','2020-09-28 10:00','校对张三','2020-09-28 11:00','2020-09-28 12:00','预排张三','2020-09-27 23:00','后排张三','2020-09-28 23:00','2020-09-29 23:00',20200929,'No','唐爽','','',NULL,'No','','项目助理ZYX','项目经理TJ','',NULL,NULL,'项目经理TJ',20200924,0),(36,'F-20200930SHGD11','T 2.02-16','上海光电',44,7628,'PDF','翻译',NULL,'EN-CN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-12 23:00',NULL,'No','刘二','','','Q-SHGD202009303','Yes',NULL,NULL,NULL,'王青',NULL,NULL,NULL,20200930,0),(37,'F-20200930SHGD10','T 2.20-09','上海光电',2,221,'PDF','翻译',NULL,'EN-CN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-30 23:00',NULL,'No','刘二','','','Q-SHGD202009303','Yes',NULL,NULL,NULL,'王青',NULL,NULL,NULL,20200930,0),(38,'F-20200930SHGD09','BHC159020 PCT-CN Claims in CN','上海光电',4,2816,'PDF','翻译',NULL,'CN-EN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-12 23:00',NULL,'No','刘二','','','Q-SHGD202009303','Yes',NULL,NULL,NULL,'王青',NULL,NULL,NULL,20200930,0),(39,'F-20200930AB08','上海市浦东新区市场监督管理局关于开展药品上市许可持有人药物警戒检查工作的通知','AB医疗',8,2614,'PDF','翻译',NULL,'CN-EN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-30 23:00',NULL,'No','王佳','','','Q-AB2020093011','No',NULL,NULL,NULL,'朱悦',NULL,NULL,NULL,20200930,0),(40,'F-20200930AB07','Redoxon_Avoiding infections','AB医疗',6,1224,'PDF','翻译','','EN-CN','','','','','','','','','','','','','2020-09-30 23:00',20200930,'No','王佳','','','Q-AB2020093010','No','','','','',NULL,NULL,'scxzjl',20200930,0),(41,'F-20200930AB06','5','AB医疗',2,200,'PDF','翻译','','CN-EN','','','','','','','','','','','','','',20200930,'No','王佳','','',NULL,'Yes','','','','',NULL,NULL,'scxzjl',20200930,0);

/*Table structure for table `ky_pj_daily_progress_dtp` */

DROP TABLE IF EXISTS `ky_pj_daily_progress_dtp`;

CREATE TABLE `ky_pj_daily_progress_dtp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Name_of_Formatter` varchar(255) DEFAULT NULL COMMENT '排版人员姓名',
  `Work_Date` int(11) DEFAULT NULL COMMENT '工作日期',
  `Job_Name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `Filing_Code` varchar(255) DEFAULT NULL COMMENT '文件编号',
  `Company_Name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `Delivery_Delay` varchar(10) DEFAULT NULL COMMENT '是否延迟提交',
  `Number_of_Pages_Completed` int(9) DEFAULT NULL COMMENT '完成页码',
  `Language` varchar(255) DEFAULT NULL COMMENT '语种',
  `Format_Difficulty` varchar(255) DEFAULT NULL COMMENT '排版难易程度',
  `Self_Inspection_Status` varchar(10) DEFAULT NULL COMMENT '自检(是/否)',
  `Percentage_Completed` decimal(10,2) DEFAULT NULL COMMENT '已完成百分比',
  `File_Type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `Work_Content` text COMMENT '工作内容',
  `Start_Time` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `End_Time` varchar(255) DEFAULT NULL COMMENT '结束时间',
  `Actual_Work_Time` float DEFAULT NULL COMMENT '实际用时(h)',
  `Productivity` varchar(255) DEFAULT NULL COMMENT '效率',
  `Remarks` text COMMENT '备注',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_daily_progress_dtp` */

insert  into `ky_pj_daily_progress_dtp`(`id`,`Name_of_Formatter`,`Work_Date`,`Job_Name`,`Filing_Code`,`Company_Name`,`Delivery_Delay`,`Number_of_Pages_Completed`,`Language`,`Format_Difficulty`,`Self_Inspection_Status`,`Percentage_Completed`,`File_Type`,`Work_Content`,`Start_Time`,`End_Time`,`Actual_Work_Time`,`Productivity`,`Remarks`,`Filled_by`,`delete_time`) values (1,'预排张三',20200828,'文献部分内容翻译202007','F-20200828XH02','西禾','No',3,'EN-CN','Normal','Yes',100.00,'PDF','预排版','2020-08-28 09:00','2020-08-28 10:00',1,'3','','预排张三',0),(2,'预排张三',20200828,'[01-01]HATT-BYT(RC135-33) Specifications_ENG','F-20200827APQ01','艾普强','No',18,'EN-CN','Normal','Yes',100.00,'PDF','预排版','2020-08-28 10:00','2020-08-28 12:00',2,'9','','预排张三',0);

/*Table structure for table `ky_pj_daily_progress_dtp_record` */

DROP TABLE IF EXISTS `ky_pj_daily_progress_dtp_record`;

CREATE TABLE `ky_pj_daily_progress_dtp_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Work_Date` int(11) DEFAULT NULL COMMENT '工作日期',
  `Number_of_Pages_Completed` int(9) DEFAULT NULL COMMENT '完成页码',
  `Percentage_Completed` decimal(10,2) DEFAULT NULL COMMENT '已完成百分比',
  `Start_Time` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `End_Time` varchar(255) DEFAULT NULL COMMENT '结束时间',
  `Actual_Work_Time` float DEFAULT NULL COMMENT '实际用时(h)',
  `Productivity` varchar(255) DEFAULT NULL COMMENT '效率',
  `Remarks` text COMMENT '备注',
  `Filled_by` varchar(30) DEFAULT NULL COMMENT '填表人',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_daily_progress_dtp_record` */

/*Table structure for table `ky_pj_daily_progress_tr_re` */

DROP TABLE IF EXISTS `ky_pj_daily_progress_tr_re`;

CREATE TABLE `ky_pj_daily_progress_tr_re` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Name_of_Translator_or_Reviser` varchar(255) DEFAULT NULL COMMENT '翻译/校对人员姓名',
  `Category` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL COMMENT '人员类别',
  `Work_Date` int(11) DEFAULT NULL COMMENT '工作日期',
  `Job_Name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `Filing_Code` varchar(255) DEFAULT NULL COMMENT '文件编号',
  `Company_Name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `Number_of_Pages_Completed` int(9) DEFAULT NULL COMMENT '完成页码',
  `Language` varchar(255) DEFAULT NULL COMMENT '语种',
  `Translation_Difficulty` varchar(255) DEFAULT NULL COMMENT '翻译难易程度',
  `Self_Inspection_Status` varchar(10) DEFAULT NULL COMMENT '自检(是/否)',
  `Percentage_Completed` decimal(10,2) DEFAULT NULL COMMENT '已完成百分比',
  `Total_Chinese_Characters` decimal(15,2) DEFAULT NULL COMMENT '中文字数统计',
  `Original_Chinese_Characters` decimal(15,2) DEFAULT NULL COMMENT '原总字数',
  `Work_Content` text COMMENT '工作内容',
  `Start_Time` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `End_Time` varchar(255) DEFAULT NULL COMMENT '结束时间',
  `Actual_Work_Time` float DEFAULT NULL COMMENT '实际用时(h)',
  `Update_TM` varchar(10) DEFAULT NULL COMMENT '是否更新主库',
  `Update_TB` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL COMMENT '是否提交术语表',
  `Go_to_Finalize_in_Trados` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL COMMENT '文件阶段是否转至定稿',
  `Reasons` text COMMENT '未转至定稿原因',
  `Total_Repetition_Rate` decimal(10,2) DEFAULT NULL COMMENT '总重复率',
  `Excluding_Words` int(9) DEFAULT NULL COMMENT '扣除字数',
  `Productivity` varchar(255) DEFAULT NULL COMMENT '效率',
  `Filled_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL COMMENT '填表人',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_daily_progress_tr_re` */

insert  into `ky_pj_daily_progress_tr_re`(`id`,`Name_of_Translator_or_Reviser`,`Category`,`Work_Date`,`Job_Name`,`Filing_Code`,`Company_Name`,`Number_of_Pages_Completed`,`Language`,`Translation_Difficulty`,`Self_Inspection_Status`,`Percentage_Completed`,`Total_Chinese_Characters`,`Original_Chinese_Characters`,`Work_Content`,`Start_Time`,`End_Time`,`Actual_Work_Time`,`Update_TM`,`Update_TB`,`Go_to_Finalize_in_Trados`,`Reasons`,`Total_Repetition_Rate`,`Excluding_Words`,`Productivity`,`Filled_by`,`delete_time`) values (2,'翻译张三','TR',20200828,'文献部分内容翻译202007','F-20200828XH02','西禾',3,'EN-CN','Normal','Yes',100.00,500.00,1000.00,'翻译','2020-08-28 11:00','2020-08-28 12:00',1,'No','Yes','No','',50.00,0,'500','翻译张三',0),(3,'翻译张三','TR',20200828,'[01-01]HATT-BYT(RC135-33) Specifications_ENG','F-20200827APQ01','艾普强',18,'EN-CN','Normal','Yes',100.00,750.00,1500.00,'翻译','2020-08-28 14:00','2020-08-28 17:00',3,'No','Yes','No','',50.00,0,'250','翻译张三',0),(4,'校对张三','RE',20200828,'文献部分内容翻译202007','F-20200828XH02','西禾',3,'EN-CN','Normal','Yes',100.00,500.00,1000.00,'校对','2020-08-28 13:00','2020-08-28 14:00',1,'No','Yes','Yes','',50.00,0,'500','校对张三',0),(5,'校对张三','RE',20200829,'[01-01]HATT-BYT(RC135-33) Specifications_ENG','F-20200827APQ01','艾普强',18,'EN-CN','Normal','Yes',100.00,750.00,1500.00,'校对','2020-08-29 17:00','2020-08-29 18:00',1,'No','Yes','Yes','',50.00,0,'750','校对张三',0),(6,'翻译李四','TR',20200828,'产品技术要求','F-20200828XH03','西禾',10,'EN-CN','Normal','Yes',100.00,4000.00,8000.00,'翻译','2020-08-28 09:00','2020-08-28 12:00',3,'No','Yes','Yes','',50.00,0,'1333.33','翻译李四',0);

/*Table structure for table `ky_pj_daily_progress_tr_re_record` */

DROP TABLE IF EXISTS `ky_pj_daily_progress_tr_re_record`;

CREATE TABLE `ky_pj_daily_progress_tr_re_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Work_Date` int(11) DEFAULT NULL COMMENT '工作日期',
  `Number_of_Pages_Completed` int(9) DEFAULT NULL COMMENT '完成页码',
  `Percentage_Completed` decimal(10,2) DEFAULT NULL COMMENT '已完成百分比',
  `Start_Time` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `End_Time` varchar(255) DEFAULT NULL COMMENT '结束时间',
  `Actual_Work_Time` float DEFAULT NULL COMMENT '实际用时(h)',
  `Update_TM` varchar(10) DEFAULT NULL COMMENT '是否更新主库',
  `Update_TB` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL COMMENT '是否提交术语表',
  `Productivity` varchar(255) DEFAULT NULL COMMENT '效率',
  `Filled_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL COMMENT '填表人',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_daily_progress_tr_re_record` */

/*Table structure for table `ky_pj_h_p_evaluation` */

DROP TABLE IF EXISTS `ky_pj_h_p_evaluation`;

CREATE TABLE `ky_pj_h_p_evaluation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Post_Formatter` varchar(50) DEFAULT NULL COMMENT '后排版人员',
  `Job_Name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `Filing_Code` varchar(255) DEFAULT NULL COMMENT '文件编号',
  `Company_Name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `Language` varchar(255) DEFAULT NULL COMMENT '语种',
  `Format_Difficulty` varchar(255) DEFAULT NULL COMMENT '排版难易程度',
  `Layout_and_Format` varchar(10) DEFAULT NULL COMMENT '整体布局',
  `Content_Check` varchar(10) DEFAULT NULL COMMENT '内容检查',
  `Customer_Requirements` varchar(10) DEFAULT NULL COMMENT '客户要求',
  `Overall_Evaluation` varchar(10) DEFAULT NULL COMMENT '整体评价',
  `Remarks` text COMMENT '备注',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `sign` varchar(255) DEFAULT NULL COMMENT '签名',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_h_p_evaluation` */

insert  into `ky_pj_h_p_evaluation`(`id`,`Post_Formatter`,`Job_Name`,`Filing_Code`,`Company_Name`,`Language`,`Format_Difficulty`,`Layout_and_Format`,`Content_Check`,`Customer_Requirements`,`Overall_Evaluation`,`Remarks`,`Filled_by`,`sign`,`create_time`,`delete_time`) values (1,'后排张三','文献部分内容翻译202007','F-20200828XH02','西禾','EN-CN','Normal','C','C','C','D','','校对张三',NULL,1598670930,0);

/*Table structure for table `ky_pj_project_database` */

DROP TABLE IF EXISTS `ky_pj_project_database`;

CREATE TABLE `ky_pj_project_database` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Filing_Code` varchar(255) DEFAULT NULL COMMENT '文件编号',
  `Job_Name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `Company_Name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `Pages` int(9) DEFAULT NULL COMMENT '页数',
  `Source_Text_Word_Count` int(9) DEFAULT NULL COMMENT '源语数量',
  `File_Type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `Language` varchar(255) DEFAULT NULL COMMENT '语种',
  `Translator` varchar(255) DEFAULT NULL COMMENT '翻译人员',
  `Reviser` varchar(255) DEFAULT NULL COMMENT '校对人员',
  `Pre_Formatter` varchar(255) DEFAULT NULL COMMENT '预排版人员',
  `Post_Formatter` varchar(255) DEFAULT NULL COMMENT '后排版人员',
  `Completed` int(11) DEFAULT NULL COMMENT '交付日期',
  `Delivered_or_Not` varchar(10) DEFAULT 'No' COMMENT '是否交稿',
  `File_Category` varchar(255) DEFAULT NULL COMMENT '文件分类',
  `Update_Company_TM` varchar(10) DEFAULT 'No' COMMENT '是否更新公司主库',
  `Update_File_TM` varchar(10) DEFAULT 'No' COMMENT '是否更新文件主库',
  `PA` varchar(50) DEFAULT NULL COMMENT '项目助理',
  `Updating_Means` varchar(255) DEFAULT NULL COMMENT '更新方式',
  `Update_Time` varchar(255) DEFAULT NULL COMMENT '更新时间',
  `Attention` varchar(255) DEFAULT NULL COMMENT '客户联系人',
  `Product_Involved` varchar(255) DEFAULT NULL COMMENT '涉及产品',
  `Product_Parts` varchar(255) DEFAULT NULL COMMENT '产品部件',
  `Brand_and_Model` varchar(255) DEFAULT NULL COMMENT '品牌型号',
  `Industry_Field` varchar(255) DEFAULT NULL COMMENT '应用领域',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_project_database` */

insert  into `ky_pj_project_database`(`id`,`Filing_Code`,`Job_Name`,`Company_Name`,`Pages`,`Source_Text_Word_Count`,`File_Type`,`Language`,`Translator`,`Reviser`,`Pre_Formatter`,`Post_Formatter`,`Completed`,`Delivered_or_Not`,`File_Category`,`Update_Company_TM`,`Update_File_TM`,`PA`,`Updating_Means`,`Update_Time`,`Attention`,`Product_Involved`,`Product_Parts`,`Brand_and_Model`,`Industry_Field`,`Filled_by`,`delete_time`) values (1,'F-20200827APQ01','[01-01]HATT-BYT(RC135-33) Specifications_ENG','艾普强',18,1616,'PDF','EN-CN','翻译张三','校对张三','预排张三','后排李四',20200923,'Yes','医疗器械-研究者手册','No','No','项目助理ZYX','','20200922','Cherry','','','','','项目经理TJ',0),(2,'F-20200828XH02','文献部分内容翻译202007','西禾',3,810,'PDF','EN-CN','翻译张三','校对张三','预排张三','后排张三',20200828,'No','医疗器械-研究者手册','No','No','项目助理XJY',NULL,NULL,'王科',NULL,NULL,NULL,NULL,NULL,0),(3,'F-20200828XH01','说明书翻译','西禾',6,1685,'PDF','CN-EN','翻译张三','校对张三','N/A','后排张三',20200829,'No','医疗器械-研究者手册','No','No','项目助理XJY',NULL,NULL,'王科',NULL,NULL,NULL,NULL,NULL,0),(4,'F-20200831bayer02','注册资料','拜耳',20,4567,'PDF','CN-EN','','','','',0,'No','','No','No','',NULL,NULL,'李四',NULL,NULL,NULL,NULL,NULL,0),(5,'F-20200831bayer01','Word','拜耳',10,1256,'PDF','EN-CN','翻译张三','校对张三','预排张三','',0,'No','医疗器械-研究者手册','No','No','项目助理SM',NULL,NULL,'李四',NULL,NULL,NULL,NULL,NULL,0),(6,'F-20200901BL02','血液透析','BEILANG',46,12347,'PDF','CN-EN','','','','',20200903,'No','','No','No','',NULL,NULL,'cheng xue yi',NULL,NULL,NULL,NULL,NULL,0),(7,'F-20200901BL03','CHVI-356710_VP-48455-F1E-20200_MB-012','BEILANG',29,4568,'PDF','EN-CN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'Ally',NULL,NULL,NULL,NULL,NULL,0),(8,'F-20200903HDZZ01','1398-2-0007-00 MGISP-NE32 产品风险管','华大智造',55,14656,'PDF','CN-EN',NULL,NULL,NULL,NULL,0,'No',NULL,'No','No',NULL,NULL,NULL,'Kelly',NULL,NULL,NULL,NULL,NULL,0),(9,'F-20200903XH03','宣传册翻译','西禾',10,5000,'PDF','EN-CN','','','','',20200903,'No','','No','No','',NULL,NULL,'侯晓',NULL,NULL,NULL,NULL,NULL,0),(10,'F-20200903HDZZ02','错误场景V1.0_20200714','华大智造',1,23094,'Excel','CN-EN',NULL,NULL,NULL,NULL,20200903,'No',NULL,'No','No',NULL,NULL,NULL,'Kelly',NULL,NULL,NULL,NULL,NULL,0),(11,'F-20200901BL01','血液透析','BEILANG',46,12347,'PDF','CN-EN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'cheng xue yi',NULL,NULL,NULL,NULL,NULL,0),(12,'F-20200828XH03','产品技术要求','西禾',10,5000,'PDF','EN-CN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'金磊',NULL,NULL,NULL,NULL,NULL,0),(13,'F-20200903SE06','NaOH_B1387282_Invoice','SHIER',2,411,'PDF','EN-CN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'liyanchao',NULL,NULL,NULL,NULL,NULL,0),(14,'F-20200903SE05','Stopper_D000089723_Invoice','SHIER',1,177,'PDF','EN-CN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'liyanchao',NULL,NULL,NULL,NULL,NULL,0),(15,'F-20200903SE07','《化学药品非处方药上市注册技术指导原则（征求意见稿）》','SHIER',9,3316,'PDF','CN-EN',NULL,NULL,NULL,NULL,0,'No',NULL,'No','No',NULL,NULL,NULL,'lili',NULL,NULL,NULL,NULL,NULL,0),(16,'F-20200904SE01','外包装翻译','SHIER',4,300,'PDF','EN-CN','','','','',20200904,'No','N/A','No','No','项目助理ZJ',NULL,NULL,'liyanchao',NULL,NULL,NULL,NULL,NULL,0),(17,'F-20200904RPGI02','labelling','RapiGEN',1,67,'PDF','EN-CN','','','','',0,'No','N/A','No','No','项目助理ZJ','','20200922','Sally','','','','','项目经理TJ',0),(18,'F-20200904JZ09','DF-134419-RV04-Stellant PSUR','Jiuzhou Medical',17,5642,'PDF','EN-CN','','','','',20200907,'No','N/A','No','No','项目助理SM',NULL,NULL,'Liu yi',NULL,NULL,NULL,NULL,NULL,0),(19,'F-20200904JZ08','Vayego bee semi-field study','Jiuzhou Medical',5,682,'Word','CN-EN','','','','',20200907,'No','医疗器械-临床评价','No','No','项目助理SM',NULL,NULL,'Liu yi',NULL,NULL,NULL,NULL,NULL,0),(20,'F-20200911WTYP03','2018 FDA EIR','武田',56,12222,'PDF','EN-CN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'高妍',NULL,NULL,NULL,NULL,NULL,0),(21,'F-20200911WTYP02','Appendix 1-1 CP reviewed','武田',2,396,'Word','EN-CN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'郑燕',NULL,NULL,NULL,NULL,NULL,0),(22,'F-20200911WTYP01','Complete version registration history EN','武田',3,840,'Word','EN-CN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'郑燕',NULL,NULL,NULL,NULL,NULL,0),(23,'F-20200910JZ02','1. A11_CO_VR_150559_EN_01','九州医疗',6,1010,'PDF','EN-CN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'王亮',NULL,NULL,NULL,NULL,NULL,0),(24,'F-20200910JZ01','1. A11_VR_147478_EN_02_&Att','九州医疗',29,3722,'PDF','CN-EN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'王亮',NULL,NULL,NULL,NULL,NULL,0),(25,'F-20200924AB03','20290_54001_54001007_NGS Report-1','AB医疗',14,4384,'PDF','EN-CN',NULL,NULL,NULL,NULL,20200928,'No',NULL,'No','No',NULL,NULL,NULL,'陈一',NULL,NULL,NULL,NULL,NULL,0),(26,'F-20200924AB02','食品安全国家标准 植物源性食品中甜菜安残留量的测定 液相色谱-质谱联用法（征求意见稿）.docx (002)','AB医疗',10,3512,'PDF','CN-EN',NULL,NULL,NULL,NULL,20200928,'No',NULL,'No','No',NULL,NULL,NULL,'王佳',NULL,NULL,NULL,NULL,NULL,0),(27,'F-20200924XH07','技术要求补单','西禾',2,1500,'PDF','EN-CN','翻译张三','校对张三','预排张三','后排张三',20200929,'No','医疗器械-研究者手册','No','No','项目助理ZYX','','20200927','唐爽','','','','','项目经理TJ',0),(28,'F-20200930SHGD11','T 2.02-16','上海光电',44,7628,'PDF','EN-CN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'刘二',NULL,NULL,NULL,NULL,NULL,0),(29,'F-20200930SHGD10','T 2.20-09','上海光电',2,221,'PDF','EN-CN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'刘二',NULL,NULL,NULL,NULL,NULL,0),(30,'F-20200930SHGD09','BHC159020 PCT-CN Claims in CN','上海光电',4,2816,'PDF','CN-EN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'刘二',NULL,NULL,NULL,NULL,NULL,0),(31,'F-20200930AB08','上海市浦东新区市场监督管理局关于开展药品上市许可持有人药物警戒检查工作的通知','AB医疗',8,2614,'PDF','CN-EN',NULL,NULL,NULL,NULL,NULL,'No',NULL,'No','No',NULL,NULL,NULL,'王佳',NULL,NULL,NULL,NULL,NULL,0),(32,'F-20200930AB07','Redoxon_Avoiding infections','AB医疗',6,1224,'PDF','EN-CN','','','','',20200930,'No','','No','No','',NULL,NULL,'王佳',NULL,NULL,NULL,NULL,NULL,0),(33,'F-20200930AB06','5','AB医疗',2,200,'PDF','CN-EN','','','','',20200930,'No','','No','No','',NULL,NULL,'王佳',NULL,NULL,NULL,NULL,NULL,0);

/*Table structure for table `ky_pj_project_profile` */

DROP TABLE IF EXISTS `ky_pj_project_profile`;

CREATE TABLE `ky_pj_project_profile` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Company_Name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `Project_Name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `Filing_Code` varchar(255) DEFAULT NULL COMMENT '文件编号',
  `Job_Name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `Pages` int(9) DEFAULT NULL COMMENT '页数',
  `Source_Text_Word_Count` int(9) DEFAULT NULL COMMENT '源语数量',
  `Language` varchar(255) DEFAULT NULL COMMENT '语种',
  `Product_Involved` text COMMENT '涉及产品',
  `File_Usage_and_Linguistic_Specification` text COMMENT '文件用途和语言规范',
  `File_Type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `File_Category` varchar(255) DEFAULT NULL COMMENT '文件分类',
  `Format_Difficulty` varchar(255) DEFAULT NULL COMMENT '排版难易程度',
  `Translation_Difficulty` varchar(255) DEFAULT NULL COMMENT '翻译难易程度',
  `One_Hundred_Percent_Repeated` decimal(10,2) DEFAULT NULL COMMENT '100%重复率',
  `Ninety_Five_to_Ninety_Nine_Percent_Repeated` decimal(10,2) DEFAULT NULL COMMENT '95-99%重复率',
  `Total_Repetition_Rate` decimal(10,2) DEFAULT NULL COMMENT '总重复率',
  `Excluding_Words` int(9) DEFAULT NULL COMMENT '扣除字数',
  `Actual_Source_Text_Count` int(9) DEFAULT NULL COMMENT '实际源语数量',
  `Pre_Formatter` varchar(255) DEFAULT NULL COMMENT '预排版人员',
  `Pre_Format_Delivery_Time` varchar(255) DEFAULT NULL COMMENT '预排版交付时间',
  `Translator` varchar(255) DEFAULT NULL COMMENT '翻译人员',
  `Translation_Delivery_Time` varchar(255) DEFAULT NULL COMMENT '翻译交付时间',
  `Reviser` varchar(255) DEFAULT NULL COMMENT '校对人员',
  `Revision_Delivery_Time` varchar(255) DEFAULT NULL COMMENT '校对交付时间',
  `Post_Formatter` varchar(255) DEFAULT NULL COMMENT '后排版人员',
  `Post_Format_Delivery_Time` varchar(255) DEFAULT NULL COMMENT '后排版交付时间',
  `CODEX_Team` varchar(10) DEFAULT NULL COMMENT 'CODEX小组',
  `Sub_Contracted` varchar(10) DEFAULT NULL COMMENT '分包商',
  `Final_Delivery_Time` varchar(255) DEFAULT NULL COMMENT '最终交付时间',
  `PA` varchar(255) DEFAULT NULL COMMENT '项目助理',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_project_profile` */

insert  into `ky_pj_project_profile`(`id`,`Company_Name`,`Project_Name`,`Filing_Code`,`Job_Name`,`Pages`,`Source_Text_Word_Count`,`Language`,`Product_Involved`,`File_Usage_and_Linguistic_Specification`,`File_Type`,`File_Category`,`Format_Difficulty`,`Translation_Difficulty`,`One_Hundred_Percent_Repeated`,`Ninety_Five_to_Ninety_Nine_Percent_Repeated`,`Total_Repetition_Rate`,`Excluding_Words`,`Actual_Source_Text_Count`,`Pre_Formatter`,`Pre_Format_Delivery_Time`,`Translator`,`Translation_Delivery_Time`,`Reviser`,`Revision_Delivery_Time`,`Post_Formatter`,`Post_Format_Delivery_Time`,`CODEX_Team`,`Sub_Contracted`,`Final_Delivery_Time`,`PA`,`Filled_by`,`delete_time`) values (1,'西禾','20200828西禾-英译中','F-20200828XH02','文献部分内容翻译202007',3,810,'EN-CN','AAA','BBB','PDF','医疗器械-研究者手册','Normal','Normal',20.00,30.00,50.00,0,405,'预排张三','2020-08-28 10:00','翻译张三','2020-08-28 12:00','校对张三','2020-08-28 14:00','后排张三','2020-08-28 16:00','Yes','No','2020-08-28 23:00','项目助理XJY','项目助理XJY',0),(2,'西禾','20200828西禾-中译英','F-20200828XH01','说明书翻译',6,1685,'CN-EN','AAA','BBB','PDF','医疗器械-研究者手册','Easy','Normal',20.00,30.00,50.00,200,643,'N/A','','翻译张三','2020-08-28 11:00','校对张三','2020-08-28 12:00','后排张三','2020-08-28 14:00','Yes','No','2020-08-28 23:00','项目助理XJY','项目助理XJY',0),(3,'艾普强','20200828艾普强-英译中','F-20200827APQ01','[01-01]HATT-BYT(RC135-33) Specifications_ENG',18,1616,'EN-CN','AAA','BBB','PDF','医疗器械-研究者手册','Normal','Normal',20.00,30.00,50.00,0,808,'预排张三','2020-08-28 12:00','翻译张三','2020-08-29 17:00','校对张三','2020-08-29 18:00','后排李四','2020-08-29 23:00','Yes','No','2020-08-28 23:00','项目助理ZYX','项目助理ZYX',0),(4,'西禾','20200828西禾-英译中','F-20200828XH03','产品技术要求',10,5000,'EN-CN','bbb','bbb','PDF','医疗器械-研究者手册','Normal','Normal',20.00,30.00,50.00,0,2500,'N/A','','翻译李四','2020-08-28 12:00','N/A','','后排李四','2020-08-28 23:00','Yes','No','2020-08-28 23:00','项目助理XJY','项目助理XJY',0),(5,'西禾','20200924西禾-英译中','F-20200924XH07','技术要求补单',2,1500,'EN-CN','GGG','HHH','PDF','医疗器械-研究者手册','Normal','Normal',10.00,10.00,20.00,0,1200,'预排张三','2020-09-27 23:00','翻译张三','2020-09-28 10:00','校对张三','2020-09-28 12:00','后排张三','2020-09-28 23:00','Yes','No','2020-09-28 23:00','项目助理ZYX','项目助理ZYX',0);

/*Table structure for table `ky_pj_project_profile_text` */

DROP TABLE IF EXISTS `ky_pj_project_profile_text`;

CREATE TABLE `ky_pj_project_profile_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Project_Name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `Project_Responsible` varchar(50) DEFAULT NULL COMMENT '项目负责人',
  `Customer_Requirements` text COMMENT '客户要求',
  `External_Reference_File` text COMMENT '客户参考文件',
  `Internal_Reference_File` text COMMENT '内部参考文件',
  `Update_TM` text COMMENT '更新记忆库',
  `Reference_TM` text COMMENT '参考记忆库',
  `Reference_TB` text COMMENT '参考术语库',
  `Remarks` text COMMENT '备注',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_project_profile_text` */

insert  into `ky_pj_project_profile_text`(`id`,`Project_Name`,`Project_Responsible`,`Customer_Requirements`,`External_Reference_File`,`Internal_Reference_File`,`Update_TM`,`Reference_TM`,`Reference_TB`,`Remarks`,`Filled_by`,`create_time`,`update_time`,`delete_time`) values (1,'20200828西禾-英译中','校对张三','','','','','','','','项目助理XJY',1598665376,1598665376,0),(2,'20200828西禾-中译英','校对张三','','','','','','','','项目助理XJY',1598665583,1598665583,0),(3,'20200828艾普强-英译中','校对张三','','','','','','','','项目助理ZYX',1598665930,1598665930,0),(4,'20200924西禾-英译中','校对张三','AAA','BBB','CCC','DDD','EEE','FFF','','项目助理ZYX',1601176640,1601176640,0);

/*Table structure for table `ky_pj_project_release` */

DROP TABLE IF EXISTS `ky_pj_project_release`;

CREATE TABLE `ky_pj_project_release` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Filing_Code` varchar(255) DEFAULT NULL COMMENT '文件编号',
  `Job_Name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `Inspected_by` varchar(255) DEFAULT NULL COMMENT '检查人',
  `Translation` varchar(10) DEFAULT 'C' COMMENT '翻译',
  `Terminology` varchar(10) DEFAULT NULL COMMENT '术语',
  `Language_Quality` varchar(10) DEFAULT NULL COMMENT '语言品质',
  `Special_Noun` varchar(10) DEFAULT NULL COMMENT '专有名词',
  `Measurement` varchar(10) DEFAULT NULL COMMENT '测量单位',
  `Symbol` varchar(10) DEFAULT NULL COMMENT '符号',
  `Drawing` varchar(10) DEFAULT NULL COMMENT '图表',
  `Abbreviation` varchar(10) DEFAULT NULL COMMENT '缩写',
  `Layout_and_Format` varchar(10) DEFAULT NULL COMMENT '布局格式',
  `Others` varchar(10) DEFAULT NULL COMMENT '其他',
  `Existing_Issue` varchar(10) DEFAULT NULL COMMENT '现有问题',
  `Correction_Result` varchar(10) DEFAULT NULL COMMENT '纠正情况',
  `Reviser` varchar(50) DEFAULT NULL COMMENT '校对人员',
  `Project_Manager` varchar(50) DEFAULT NULL COMMENT '项目经理',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_project_release` */

insert  into `ky_pj_project_release`(`id`,`Filing_Code`,`Job_Name`,`Inspected_by`,`Translation`,`Terminology`,`Language_Quality`,`Special_Noun`,`Measurement`,`Symbol`,`Drawing`,`Abbreviation`,`Layout_and_Format`,`Others`,`Existing_Issue`,`Correction_Result`,`Reviser`,`Project_Manager`,`Filled_by`,`delete_time`) values (1,'F-20200827APQ01','[01-01]HATT-BYT(RC135-33) Specifications_ENG','校对张三','C','C','C','C','C','C','C','C','C','C','C','C','Yes','Yes','校对张三',0),(2,'F-20200828XH02','文献部分内容翻译202007','校对张三','C','C','C','C','C','C','C','C','C','C','C','C','Yes','Yes','校对张三',0);

/*Table structure for table `ky_pj_project_summary` */

DROP TABLE IF EXISTS `ky_pj_project_summary`;

CREATE TABLE `ky_pj_project_summary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Project_Name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `Language` varchar(255) DEFAULT NULL COMMENT '语种',
  `File_Info` varchar(255) DEFAULT NULL COMMENT '文件概况',
  `Product_Involved` varchar(255) DEFAULT NULL COMMENT '涉及产品',
  `Revision_Summary` text COMMENT '校对反馈',
  `Useful_Expression` text COMMENT '表达积累',
  `Project_Summary` text COMMENT '项目总结',
  `sign` varchar(255) DEFAULT NULL COMMENT '签名',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_project_summary` */

insert  into `ky_pj_project_summary`(`id`,`Project_Name`,`Language`,`File_Info`,`Product_Involved`,`Revision_Summary`,`Useful_Expression`,`Project_Summary`,`sign`,`Filled_by`,`delete_time`) values (1,'20200828西禾-中译英','中文-英文','','AAA','CCC','CCC','CCC',NULL,'翻译张三',0),(2,'20200828艾普强-英译中','英文-中文','aaa','cccc','','','',NULL,'翻译张三',0),(3,'20200828艾普强-英译中','英文-中文','','555','ddddd','fffff','ddddd',NULL,'校对张三',0);

/*Table structure for table `ky_pj_translation_evaluation` */

DROP TABLE IF EXISTS `ky_pj_translation_evaluation`;

CREATE TABLE `ky_pj_translation_evaluation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Translator` varchar(255) DEFAULT NULL COMMENT '翻译人员',
  `Job_Name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `Filing_Code` varchar(255) DEFAULT NULL COMMENT '文件编号',
  `Company_Name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `Language` varchar(255) DEFAULT NULL COMMENT '语种',
  `Translation_Difficulty` varchar(255) DEFAULT NULL COMMENT '翻译难易程度',
  `Omission` varchar(255) DEFAULT NULL COMMENT '漏译',
  `Extra_Translation` varchar(255) DEFAULT NULL COMMENT '多译',
  `Understanding` varchar(255) DEFAULT NULL COMMENT '理解程度',
  `Typo_or_Data_Error` varchar(255) DEFAULT NULL COMMENT '打字、数据错误',
  `Inconsistent_within_the_File` varchar(255) DEFAULT NULL COMMENT '自身术语不统一',
  `Inconsistent_with_Other_Translators` varchar(255) DEFAULT NULL COMMENT '未和其他译者统一术语',
  `Mistranslation` varchar(255) DEFAULT NULL COMMENT '术语翻译不恰当',
  `Incorrect_Punctuation` varchar(255) DEFAULT NULL COMMENT '标点符号不恰当',
  `Inconsistent_with_Target_Language_Features` varchar(255) DEFAULT NULL COMMENT '不符合习惯用语',
  `Grammar_Mistakes` varchar(255) DEFAULT NULL COMMENT '语法错误',
  `Sentence_Quality` varchar(255) DEFAULT NULL COMMENT '表达流畅度',
  `Refer_to_the_References` varchar(255) DEFAULT NULL COMMENT '是否认真参考了参考文件',
  `Corrected_Problems_Reoccur` varchar(255) DEFAULT NULL COMMENT '既往纠正问题是否仍反复出现',
  `Overall_Evaluation` varchar(255) DEFAULT NULL COMMENT '整体评价',
  `sign` varchar(255) DEFAULT NULL COMMENT '签名',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_translation_evaluation` */

insert  into `ky_pj_translation_evaluation`(`id`,`Translator`,`Job_Name`,`Filing_Code`,`Company_Name`,`Language`,`Translation_Difficulty`,`Omission`,`Extra_Translation`,`Understanding`,`Typo_or_Data_Error`,`Inconsistent_within_the_File`,`Inconsistent_with_Other_Translators`,`Mistranslation`,`Incorrect_Punctuation`,`Inconsistent_with_Target_Language_Features`,`Grammar_Mistakes`,`Sentence_Quality`,`Refer_to_the_References`,`Corrected_Problems_Reoccur`,`Overall_Evaluation`,`sign`,`Filled_by`,`create_time`,`delete_time`) values (1,'翻译张三','说明书翻译','F-20200828XH01','西禾','CN-EN','Normal','A','C','B','B','B','C','B','D','C','C','C','C','A','C',NULL,'校对张三',1598670915,0);

/*Table structure for table `ky_pj_y_p_evaluation` */

DROP TABLE IF EXISTS `ky_pj_y_p_evaluation`;

CREATE TABLE `ky_pj_y_p_evaluation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Pre_Formatter` varchar(255) DEFAULT NULL COMMENT '预排版人员',
  `Job_Name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `Filing_Code` varchar(255) DEFAULT NULL COMMENT '文件编号',
  `Company_Name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `Language` varchar(255) DEFAULT NULL COMMENT '语种',
  `Format_Difficulty` varchar(10) DEFAULT NULL COMMENT '排版难易程度',
  `Layout_and_Format` varchar(10) DEFAULT NULL COMMENT '布局格式',
  `Content_Check` varchar(10) DEFAULT NULL COMMENT '内容检查',
  `Customer_Requirements` varchar(10) DEFAULT NULL COMMENT '客户要求',
  `Overall_Evaluation` varchar(10) DEFAULT NULL COMMENT '整体评价',
  `Remarks` text COMMENT '备注',
  `sign` varchar(255) DEFAULT NULL COMMENT '签名',
  `Filled_by` varchar(50) DEFAULT NULL COMMENT '填表人',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_y_p_evaluation` */

insert  into `ky_pj_y_p_evaluation`(`id`,`Pre_Formatter`,`Job_Name`,`Filing_Code`,`Company_Name`,`Language`,`Format_Difficulty`,`Layout_and_Format`,`Content_Check`,`Customer_Requirements`,`Overall_Evaluation`,`Remarks`,`sign`,`Filled_by`,`create_time`,`delete_time`) values (1,'预排张三','说明书翻译','F-20200828XH01','西禾','CN-EN','Easy','B','C','C','C','',NULL,'翻译张三',1598668978,1598669835),(2,'预排张三','[01-01]HATT-BYT(RC135-33) Specifications_ENG','F-20200827APQ01','艾普强','EN-CN','Normal','A','B','C','B','','翻译张三','翻译张三',1598669808,0),(3,'预排张三','文献部分内容翻译202007','F-20200828XH02','西禾','EN-CN','Normal','C','D','C','D','','翻译张三','翻译张三',1598669823,0);

/*Table structure for table `ky_tj_diy_num` */

DROP TABLE IF EXISTS `ky_tj_diy_num`;

CREATE TABLE `ky_tj_diy_num` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(255) DEFAULT NULL COMMENT '人员',
  `score` float DEFAULT '1' COMMENT '数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_tj_diy_num` */

insert  into `ky_tj_diy_num`(`id`,`name`,`score`) values (1,'翻译',705),(2,'校对',1122),(3,'排版',3200),(4,'实习生',622);

/*Table structure for table `ky_tj_opa_formatter` */

DROP TABLE IF EXISTS `ky_tj_opa_formatter`;

CREATE TABLE `ky_tj_opa_formatter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Time` datetime DEFAULT NULL COMMENT '时间',
  `Name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `Average_Monthly_Workload` varchar(255) DEFAULT NULL COMMENT '月平均工作量',
  `Quality_Assessment` varchar(255) DEFAULT NULL COMMENT '质量评估',
  `Work_Efficiency` varchar(255) DEFAULT NULL COMMENT '工作效率',
  `Translation_Difficulty` varchar(255) DEFAULT NULL COMMENT '难度挑战',
  `On_Time_Delivery` varchar(255) DEFAULT NULL COMMENT '按时提交',
  `Training_Assessment` varchar(255) DEFAULT NULL COMMENT '培训考核',
  `Assessment_by_the_Management` varchar(255) DEFAULT NULL COMMENT '管理层评分',
  `CODEX_CUP_Exam_Score` varchar(255) DEFAULT NULL COMMENT '科译杯综合测评',
  `Positive_Customer_Feedback` varchar(255) DEFAULT NULL COMMENT '客户优秀反馈',
  `Negative_Customer_Feedback` varchar(255) DEFAULT NULL COMMENT '客户不良反馈',
  `Total_score` varchar(255) DEFAULT NULL COMMENT '总分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_tj_opa_formatter` */

/*Table structure for table `ky_tj_opa_pa` */

DROP TABLE IF EXISTS `ky_tj_opa_pa`;

CREATE TABLE `ky_tj_opa_pa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Time` datetime DEFAULT NULL COMMENT '时间',
  `Name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `Average_Monthly_Workload` varchar(255) DEFAULT NULL COMMENT '月平均工作量',
  `Quality_Assessment` varchar(255) DEFAULT NULL COMMENT '质量评估',
  `Work_Efficiency` varchar(255) DEFAULT NULL COMMENT '工作效率',
  `Translation_Difficulty` varchar(255) DEFAULT NULL COMMENT '难度挑战',
  `On_Time_Delivery` varchar(255) DEFAULT NULL COMMENT '按时提交',
  `Training_Assessment` varchar(255) DEFAULT NULL COMMENT '培训考核',
  `Assessment_by_the_Management` varchar(255) DEFAULT NULL COMMENT '管理层评分',
  `CODEX_CUP_Exam_Score` varchar(255) DEFAULT NULL COMMENT '科译杯综合测评',
  `Positive_Customer_Feedback` varchar(255) DEFAULT NULL COMMENT '客户优秀反馈',
  `Negative_Customer_Feedback` varchar(255) DEFAULT NULL COMMENT '客户不良反馈',
  `Total_score` varchar(255) DEFAULT NULL COMMENT '总分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_tj_opa_pa` */

/*Table structure for table `ky_tj_opa_tr_re` */

DROP TABLE IF EXISTS `ky_tj_opa_tr_re`;

CREATE TABLE `ky_tj_opa_tr_re` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Time` datetime DEFAULT NULL COMMENT '时间',
  `Name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `Average_Monthly_Workload` varchar(255) DEFAULT NULL COMMENT '月平均工作量',
  `Quality_Assessment` varchar(255) DEFAULT NULL COMMENT '质量评估',
  `Work_Efficiency` varchar(255) DEFAULT NULL COMMENT '工作效率',
  `Translation_Difficulty` varchar(255) DEFAULT NULL COMMENT '难度挑战',
  `On_Time_Delivery` varchar(255) DEFAULT NULL COMMENT '按时提交',
  `Training_Assessment` varchar(255) DEFAULT NULL COMMENT '培训考核',
  `Assessment_by_the_Management` varchar(255) DEFAULT NULL COMMENT '管理层评分',
  `CODEX_CUP_Exam_Score` varchar(255) DEFAULT NULL COMMENT '科译杯综合测评',
  `Positive_Customer_Feedback` varchar(255) DEFAULT NULL COMMENT '客户优秀反馈',
  `Negative_Customer_Feedback` varchar(255) DEFAULT NULL COMMENT '客户不良反馈',
  `Total_score` varchar(255) DEFAULT NULL COMMENT '总分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_tj_opa_tr_re` */

/*Table structure for table `ky_tj_performance_table` */

DROP TABLE IF EXISTS `ky_tj_performance_table`;

CREATE TABLE `ky_tj_performance_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `time` int(11) DEFAULT NULL COMMENT '时间',
  `No` varchar(255) DEFAULT NULL COMMENT '序号',
  `Department` varchar(255) DEFAULT NULL COMMENT '部门',
  `Name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `Pages` int(11) DEFAULT NULL COMMENT '页数',
  `Actual total number of words` int(11) DEFAULT NULL COMMENT '实际总字数',
  `Original total number of words` int(11) DEFAULT NULL COMMENT '原总字数',
  `Proofread First language` varchar(255) DEFAULT NULL COMMENT '本职语种',
  `Proofread Other language` varchar(255) DEFAULT NULL COMMENT '非本职语种X',
  `Proofread Total` varchar(255) DEFAULT NULL COMMENT '合计',
  `Proofread Work hours` varchar(50) DEFAULT NULL COMMENT '工作时间',
  `Proofread Productivity` varchar(50) DEFAULT NULL COMMENT '校对效率',
  `Translate First language` varchar(255) DEFAULT NULL COMMENT '本职语种',
  `Translate Other language` varchar(255) DEFAULT NULL COMMENT '非本职语种X',
  `Translate Total` varchar(50) DEFAULT NULL COMMENT '合计',
  `Translate Work hours` varchar(50) DEFAULT NULL COMMENT '工作时间',
  `Translate Productivity` varchar(50) DEFAULT NULL COMMENT '翻译效率',
  `Weighted` varchar(50) DEFAULT NULL COMMENT '加权',
  `Weighted total` int(11) DEFAULT NULL COMMENT '最终总数',
  `Proofreading proportion` float DEFAULT NULL COMMENT '校对比例',
  `Total actual attending time  in this month(hours)` float DEFAULT NULL COMMENT '本月实际出勤时间汇总（小时）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_tj_performance_table` */

/*Table structure for table `ky_tj_project_funnel` */

DROP TABLE IF EXISTS `ky_tj_project_funnel`;

CREATE TABLE `ky_tj_project_funnel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Time` int(11) DEFAULT NULL COMMENT '时间',
  `en-cn Nb of Page Translated` int(11) DEFAULT NULL COMMENT '翻译页数',
  `en-cn Nb of Word translated` int(11) DEFAULT NULL COMMENT '翻译词数',
  `cn-en Nb of Page Translated` int(11) DEFAULT NULL COMMENT '翻译页数',
  `cn-en Nb of Word translated` int(11) DEFAULT NULL COMMENT '翻译词数',
  `Other-cn Nb of Page Translated` int(11) DEFAULT NULL COMMENT '翻译页数',
  `Other-cn Nb of Word translated` int(11) DEFAULT NULL COMMENT '翻译词数',
  `cn-Other Nb of Page Translated` int(11) DEFAULT NULL COMMENT '翻译页数',
  `cn-Other Nb of Word translated` int(11) DEFAULT NULL COMMENT '翻译词数',
  `Total Pages Translated` int(11) DEFAULT NULL COMMENT '翻译总页数',
  `(C) Total Pages in Process above 50% done` int(11) DEFAULT NULL COMMENT '已完成50%以上总页数',
  `(C) Estimated nb of days to finish` int(11) DEFAULT NULL COMMENT '预计完成天数',
  `(B) Total Pages in Process 10% - 50% done` int(11) DEFAULT NULL COMMENT '已完成10%-50%总页数',
  `(B) Estimated nb of days to finish` int(11) DEFAULT NULL COMMENT '预计完成天数',
  `Total Pages to be submitted` int(11) DEFAULT NULL COMMENT '待提交总页数',
  `(C) Total Pages to be Translated not process started` int(11) DEFAULT NULL COMMENT '未开始总页数',
  `Estimated nb of days to finish` int(11) DEFAULT NULL COMMENT '预计完成天数',
  `Toatl days of works FOR (A) + (B) + (C)` int(11) DEFAULT NULL COMMENT '预计完成总天数（(A) + (B) + (C)）',
  `Nb of Translator from Codex` int(11) DEFAULT NULL COMMENT '科译翻译人数',
  `Nb of Reviser from Codex` int(11) DEFAULT NULL COMMENT '科译校对人数',
  `Nb of Formatter from Codex` int(11) DEFAULT NULL COMMENT '科译排版人数',
  `Sub-total` int(11) DEFAULT NULL COMMENT '小计',
  `Nb of Formatter from Trainees` int(11) DEFAULT NULL COMMENT '科译实习生人数',
  `Grand Total` int(11) DEFAULT NULL COMMENT '总计',
  `Weekly Capacity per Pages of Translator` int(11) DEFAULT NULL COMMENT '翻译人员',
  `Weekly Capacity per Pages of Reviser` int(11) DEFAULT NULL COMMENT '校对人员',
  `Weekly Capacity per Pages of Formatter` int(11) DEFAULT NULL COMMENT '排版人员',
  `Average Capacity per Pages` int(11) DEFAULT NULL COMMENT '平均产能（页数）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_tj_project_funnel` */

/*Table structure for table `ky_tj_quality_analysis` */

DROP TABLE IF EXISTS `ky_tj_quality_analysis`;

CREATE TABLE `ky_tj_quality_analysis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `comments type` varchar(255) DEFAULT NULL COMMENT '评价类型',
  `Omission` varchar(10) DEFAULT NULL COMMENT '漏译',
  `Extra translation` varchar(10) DEFAULT NULL COMMENT '多译',
  `Understanding` varchar(10) DEFAULT NULL COMMENT '理解程度',
  `Typo_or_data_error` varchar(10) DEFAULT NULL COMMENT '打字、数据错误',
  `Inconsistent within the file` varchar(10) DEFAULT NULL COMMENT '自身术语不统一',
  `Inconsistent with other translators` varchar(10) DEFAULT NULL COMMENT '未和其他译者统一术语',
  `Mistranslation` varchar(10) DEFAULT NULL COMMENT '术语翻译不恰当',
  `Incorrect punctuation` varchar(10) DEFAULT NULL COMMENT '标点符号不恰当',
  `Inconsistent with target language features` varchar(10) DEFAULT NULL COMMENT '不符合习惯用语',
  `Grammar mistakes` varchar(10) DEFAULT NULL COMMENT '语法错误',
  `Sentence quality` varchar(10) DEFAULT NULL COMMENT '表达流畅度',
  `Whether refer to the references` varchar(10) DEFAULT NULL COMMENT '是否认真参考了参考文件',
  `Whether corrected problems reoccur` varchar(10) DEFAULT NULL COMMENT '既往纠正问题是否仍反复出现',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_tj_quality_analysis` */

/*Table structure for table `ky_tj_quality_appraisal_reviser` */

DROP TABLE IF EXISTS `ky_tj_quality_appraisal_reviser`;

CREATE TABLE `ky_tj_quality_appraisal_reviser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Time` int(11) DEFAULT NULL COMMENT '时间',
  `Name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `Sampled_Project` varchar(255) DEFAULT NULL COMMENT '抽取项目',
  `Sampled_Document` varchar(255) DEFAULT NULL COMMENT '抽取文件',
  `Filing_Code` varchar(255) DEFAULT NULL COMMENT '文件编号',
  `Sampled_Pages` varchar(255) DEFAULT NULL COMMENT '抽取页码',
  `Serious_Mistranslation` varchar(255) DEFAULT NULL COMMENT '严重误译',
  `Inapproriate_Expression` varchar(255) DEFAULT NULL COMMENT '表述不恰当',
  `Incorrect_Term_Translation` varchar(255) DEFAULT NULL COMMENT '术语错误',
  `Result` varchar(255) DEFAULT NULL COMMENT '评估结果',
  `Remarks` text COMMENT '备注',
  `Filled_by` varchar(30) DEFAULT NULL COMMENT '填写人',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_tj_quality_appraisal_reviser` */

insert  into `ky_tj_quality_appraisal_reviser`(`id`,`Time`,`Name`,`Sampled_Project`,`Sampled_Document`,`Filing_Code`,`Sampled_Pages`,`Serious_Mistranslation`,`Inapproriate_Expression`,`Incorrect_Term_Translation`,`Result`,`Remarks`,`Filled_by`,`delete_time`) values (1,20200901,'AAA','dasdfa','dasda','F-20200828XH01','P1-10','1','2','1','质量可接受','',NULL,0);

/*Table structure for table `ky_tj_quality_appraisal_translator` */

DROP TABLE IF EXISTS `ky_tj_quality_appraisal_translator`;

CREATE TABLE `ky_tj_quality_appraisal_translator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `Time` int(11) DEFAULT NULL COMMENT '时间',
  `Name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `Total_Comments` int(10) DEFAULT NULL COMMENT '总评价数',
  `A` varchar(10) DEFAULT NULL COMMENT 'A',
  `B` varchar(10) DEFAULT NULL COMMENT 'B',
  `C` varchar(10) DEFAULT NULL COMMENT 'C',
  `D` varchar(10) DEFAULT NULL COMMENT 'D',
  `Result` varchar(255) DEFAULT NULL COMMENT '评估结果',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_tj_quality_appraisal_translator` */

/*Table structure for table `ky_tj_score` */

DROP TABLE IF EXISTS `ky_tj_score`;

CREATE TABLE `ky_tj_score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `score_field` varchar(255) DEFAULT NULL COMMENT '评分字段',
  `score` float DEFAULT NULL COMMENT '评分权重',
  `table_name` varchar(255) DEFAULT NULL COMMENT '表格名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_tj_score` */

/*Table structure for table `ky_xt_action_log` */

DROP TABLE IF EXISTS `ky_xt_action_log`;

CREATE TABLE `ky_xt_action_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `M` varchar(255) DEFAULT NULL COMMENT '模块名',
  `C` varchar(255) DEFAULT NULL COMMENT '栏目名',
  `A` varchar(255) DEFAULT NULL COMMENT '操作名',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_action_log` */

/*Table structure for table `ky_xt_company` */

DROP TABLE IF EXISTS `ky_xt_company`;

CREATE TABLE `ky_xt_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `cn_name` varchar(255) DEFAULT NULL COMMENT '公司中文名称',
  `en_name` varchar(255) DEFAULT NULL COMMENT '公司英文名称',
  `VAT_ID` varchar(255) DEFAULT NULL COMMENT '主体公司税号',
  `CN_Address` varchar(255) DEFAULT NULL COMMENT '中文公司地址',
  `EN_Address` varchar(255) DEFAULT NULL COMMENT '英文公司地址',
  `CN_Bank_Info` text COMMENT '中文银行信息',
  `EN_Bank_Info` text COMMENT '英文银行信息',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_company` */

insert  into `ky_xt_company`(`id`,`cn_name`,`en_name`,`VAT_ID`,`CN_Address`,`EN_Address`,`CN_Bank_Info`,`EN_Bank_Info`,`create_time`,`update_time`,`delete_time`) values (1,'北京科译翻译有限公司','Beijing Codex Translation Co., Ltd.','681579423541445867','北京市西城区广安门外大街168号朗琴国际大厦A座1009室','Room 1009, LQ Center, No.168 Guanganmen Wai Street, Xicheng District Beijing, 100054, P.R.China ','公司名称: 北京科译翻译有限公司\r\n开户行: 中国建设银行北京菜市口南街支行\r\n账号: 1100 1176 4000 5300 2121','Name of Beneficiary: Beijing Codex Translation Co., Ltd.\r\nAccount No.: 318163069252 \r\nBeneficiary Bank: Bank of China Beijing Xicheng District Tianyuan Flats Sub-Branch\r\nSwift Code: BKCHCNBJ 110 ',1593747444,1595903566,0),(2,'科医达商务咨询(上海)有限公司','Codex Scientific (Shanghai) Co., Ltd.','567811238971244682','上海市静安区安远路1号达安商务楼418室',' Room 418, Da \'an Business Building, No.1 Anyuan Road, Jing \'an District, Shanghai','公司名称:科医达商务咨询(上海)有限公司\r\n中国建设银行北京菜市口支行\r\n银行账号: 31050174363600000395\r\n\r\n										','Name of Beneficiary: Codex Scientific (Shanghai) Co., Ltd.\r\nChina Construction Bank, Beijing Caishikou Branch\r\nAccount No.: 31050174363600000395\r\n',1595498471,1600680243,0);

/*Table structure for table `ky_xt_department` */

DROP TABLE IF EXISTS `ky_xt_department`;

CREATE TABLE `ky_xt_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `cn_name` varchar(255) DEFAULT NULL COMMENT '中文名称',
  `en_name` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_department` */

insert  into `ky_xt_department`(`id`,`cn_name`,`en_name`,`delete_time`) values (1,'市场部','Marketing Department',0),(2,'项目部','Project Department ',0),(3,'财务部','Accounting Department',0),(4,'管理层','Management',0),(5,'翻译部','Translation Department',0),(6,'CODEX大学','CODEX University',0);

/*Table structure for table `ky_xt_dict` */

DROP TABLE IF EXISTS `ky_xt_dict`;

CREATE TABLE `ky_xt_dict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `c_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `cn_name` varchar(255) DEFAULT NULL COMMENT '词汇中文名',
  `en_name` varchar(255) DEFAULT NULL COMMENT '词汇英文名',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_dict` */

insert  into `ky_xt_dict`(`id`,`c_id`,`cn_name`,`en_name`,`sort`,`create_time`,`update_time`,`delete_time`) values (1,1,'中文-英文','CN-EN',NULL,NULL,NULL,NULL),(2,1,'英文-中文','EN-CN',NULL,NULL,NULL,NULL),(3,2,'人民币','CNY',NULL,NULL,NULL,NULL),(5,4,'PDF','PDF',NULL,NULL,NULL,NULL),(6,4,'Word','Word',NULL,NULL,NULL,NULL),(7,4,'Excel','Excel',NULL,NULL,NULL,NULL),(8,4,'JDP','JDP',NULL,NULL,NULL,NULL),(9,7,'Easy','Easy',NULL,NULL,NULL,NULL),(10,7,'Normal','Normal',NULL,NULL,NULL,NULL),(11,7,'Difficult','Difficult',NULL,NULL,NULL,NULL),(12,7,'Very difficult','Very difficult',NULL,NULL,NULL,NULL),(13,7,'N/A','N/A',NULL,NULL,NULL,NULL),(14,8,'Easy','Easy',NULL,NULL,NULL,NULL),(15,8,'Normal','Normal',NULL,NULL,NULL,NULL),(16,8,'Difficult','Difficult',NULL,NULL,NULL,NULL),(17,8,'Very difficult','Very difficult',NULL,NULL,NULL,NULL),(18,8,'N/A','N/A',NULL,NULL,NULL,NULL),(19,9,'Yes','Yes',NULL,NULL,NULL,NULL),(20,9,'No','No',NULL,NULL,NULL,NULL),(21,9,'N/A','N/A',NULL,NULL,NULL,NULL),(22,10,'High','High',NULL,NULL,NULL,NULL),(23,10,'Normal','Normal',NULL,NULL,NULL,NULL),(24,10,'N/A','N/A',NULL,NULL,NULL,NULL),(25,11,'SDL更库','SDL更库',NULL,NULL,NULL,NULL),(26,11,'录入更库','录入更库',NULL,NULL,NULL,NULL),(27,11,'修订更库','修订更库',NULL,NULL,NULL,NULL),(28,11,'N/A','N/A',NULL,NULL,NULL,NULL),(29,12,'翻译','翻译',NULL,NULL,NULL,NULL),(30,12,'校对','校对',NULL,NULL,NULL,NULL),(31,13,'预排版','预排版',NULL,NULL,NULL,NULL),(32,13,'后排版','后排版',NULL,NULL,NULL,NULL),(33,13,'检查','检查',NULL,NULL,NULL,NULL),(34,13,'对比','对比',NULL,NULL,NULL,NULL),(35,6,'医疗器械-研究者手册','医疗器械-研究者手册',NULL,NULL,NULL,NULL),(36,6,'医疗器械-临床评价','医疗器械-临床评价',NULL,NULL,NULL,NULL),(37,5,'翻译','Translation',NULL,NULL,NULL,NULL),(38,16,'0','0',NULL,NULL,NULL,NULL),(39,16,'3','3',NULL,NULL,NULL,NULL),(40,16,'6','6',NULL,NULL,NULL,NULL),(43,3,'单词','Words',NULL,NULL,NULL,NULL),(44,3,'中文字符数（不计空格）','Chinese Characters (No space)',NULL,NULL,NULL,NULL),(45,5,'排版','DTP',NULL,NULL,NULL,NULL),(46,5,'校对','Review',NULL,NULL,NULL,NULL),(47,3,'千中文字符数（不计空格）','Thousand Chinese Characters (No space)',NULL,NULL,NULL,NULL),(48,3,'页','Page',NULL,NULL,NULL,NULL),(49,2,'欧元','EUR',NULL,NULL,NULL,NULL),(50,1,'中文-德文','CN-DE',NULL,NULL,NULL,NULL),(51,5,'视频字幕嵌入','Video',NULL,NULL,NULL,NULL),(52,3,'小时','Hour',NULL,NULL,NULL,NULL),(53,2,'美元','USD',NULL,NULL,NULL,NULL),(54,2,'澳元','AUD',NULL,NULL,NULL,NULL),(55,1,'德文-中文','DE-CN',NULL,NULL,NULL,NULL),(56,1,'中文-日文','CN-JP',NULL,NULL,NULL,NULL),(57,1,'日文-中文','JP-CN',NULL,NULL,NULL,NULL),(58,3,'项目','Project',NULL,NULL,NULL,NULL);

/*Table structure for table `ky_xt_dict_cate` */

DROP TABLE IF EXISTS `ky_xt_dict_cate`;

CREATE TABLE `ky_xt_dict_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `pid` int(11) DEFAULT NULL COMMENT '父级ID',
  `cn_name` varchar(255) DEFAULT NULL COMMENT '字段中文名',
  `en_name` varchar(255) DEFAULT NULL COMMENT '字段英文名',
  `level` tinyint(2) DEFAULT NULL COMMENT '等级',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_dict_cate` */

insert  into `ky_xt_dict_cate`(`id`,`pid`,`cn_name`,`en_name`,`level`,`sort`,`create_time`,`update_time`,`delete_time`) values (1,0,'语种','Language',NULL,NULL,NULL,NULL,NULL),(2,0,'币种','Currency',NULL,NULL,NULL,NULL,NULL),(3,0,'单位','Units',NULL,NULL,NULL,NULL,NULL),(4,0,'文件类型','File Type',NULL,NULL,NULL,NULL,NULL),(5,0,'服务类型','Service',NULL,NULL,NULL,NULL,NULL),(6,0,'文件分类','File Category',NULL,NULL,NULL,NULL,NULL),(7,0,'排版难易程度','Format Difficulty',NULL,NULL,NULL,NULL,NULL),(8,0,'翻译难易程度','Translation Difficulty',NULL,NULL,NULL,NULL,NULL),(9,0,'是否首次合作','First Cooperation',NULL,NULL,NULL,NULL,NULL),(10,0,'质量要求','Quality Requirements',NULL,NULL,NULL,NULL,NULL),(11,0,'更新方式','Updating Means',NULL,NULL,NULL,NULL,NULL),(12,0,'翻译校对工作内容','TR or RE Work content',NULL,NULL,NULL,NULL,NULL),(13,0,'排版工作内容','Formatter Work content',NULL,NULL,NULL,NULL,NULL),(16,0,'税率','VAT Rate',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `ky_xt_file` */

DROP TABLE IF EXISTS `ky_xt_file`;

CREATE TABLE `ky_xt_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `Project_Name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_file` */

insert  into `ky_xt_file`(`id`,`file_name`,`file_dir`,`path`,`type`,`Project_Name`,`creator`,`create_time`,`update_time`,`delete_time`) values (1,'LC-MSMS法测定人血浆中氨氯地平浓度改善色谱条件消除基质效应.pdf','翻译文件','/uploads/项目经理LG/翻译文件/1599277581_LC-MSMS法测定人血浆中氨氯地平浓度改善色谱条件消除基质效应.pdf','Source_file','20200828西禾-中译英','项目经理LG',1599277587,1599277587,0),(2,'2018May.txt','参考文件','/uploads/项目经理LG/参考文件/1599277632_2018May.txt','Source_file','20200828西禾-中译英','项目经理LG',1599277637,1599277637,0),(3,'attachmentout.do','参考文件','/uploads/项目经理LG/参考文件/1599277711_attachmentout.do','Source_file','20200828西禾-中译英','项目经理LG',1599277716,1599277716,0);

/*Table structure for table `ky_xt_job` */

DROP TABLE IF EXISTS `ky_xt_job`;

CREATE TABLE `ky_xt_job` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `cn_name` varchar(255) DEFAULT NULL COMMENT '中文职位',
  `en_name` varchar(255) DEFAULT NULL COMMENT '英文职位',
  `group_id` int(10) DEFAULT NULL COMMENT '所属部门',
  `menu_arr` text COMMENT '菜单权限',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_job` */

insert  into `ky_xt_job`(`id`,`cn_name`,`en_name`,`group_id`,`menu_arr`,`delete_time`) values (1,'系统管理员','Admin',NULL,NULL,0),(2,'市场行政','Sales Admin',NULL,NULL,0),(3,'销售经理','Sales Manager',NULL,NULL,0),(4,'CODEX校长','Head of Training',NULL,NULL,0),(5,'培训专员','Training Specialist',NULL,NULL,0),(6,'质控主管','Quality Manager',NULL,NULL,0),(7,'项目助理','Project Assistant',NULL,NULL,0),(8,'项目经理','Project Manager',NULL,NULL,0),(9,'总经理','General Manager',NULL,NULL,0),(10,'翻译人员','Translator',NULL,NULL,0),(11,'校对人员','Reviser',NULL,NULL,0),(12,'预排版人员','Pre-formatter',NULL,NULL,0),(13,'后排版人员','Post-Formatter',NULL,NULL,0),(14,'财务','Finance Officer',NULL,NULL,0),(15,'CODEX副校长','Deputy Head of Training',NULL,NULL,0),(16,'人力资源经理','Head of HR',NULL,NULL,0),(17,'人力资源专员','HR Specialist',NULL,NULL,0),(18,'外事专员','External Affair Specialist',NULL,NULL,0),(19,'翻译助理','Translation Assistant',NULL,NULL,0),(20,'市场行政经理','Head of Sales Admin',NULL,NULL,0);

/*Table structure for table `ky_xt_menu` */

DROP TABLE IF EXISTS `ky_xt_menu`;

CREATE TABLE `ky_xt_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `pid` int(11) DEFAULT NULL COMMENT '父级菜单ID',
  `url` varchar(255) DEFAULT NULL COMMENT '菜单地址',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `C` varchar(255) DEFAULT NULL COMMENT '控制器名',
  `cn_name` varchar(255) DEFAULT NULL COMMENT '中文栏目名',
  `en_name` varchar(255) DEFAULT NULL COMMENT '英文栏目名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_menu` */

insert  into `ky_xt_menu`(`id`,`pid`,`url`,`icon`,`C`,`cn_name`,`en_name`) values (1,0,'#','icon-project-soild',NULL,'客户管理','Customer Management'),(2,0,'#','icon-jindu',NULL,'项目管理','Project Management'),(3,0,'#','icon-richeng',NULL,'项目日程','Project Schedule'),(4,0,'#','icon-xitongshezhi',NULL,'系统管理','System Management'),(5,0,'#','icon-shujutongji',NULL,'数据统计','Statistics Management'),(6,0,'#','icon-gonggongxinxi',NULL,'公共信息','Public Information'),(7,1,'mk_contract/index',NULL,'MKContract','合同管理','Contract&Administrative Activities'),(8,1,'mk_customer/index',NULL,'MkCustomer','客户信息','Customer'),(9,1,'mk_inquiry/index',NULL,'MkInquiry','来稿需求','Inquiry'),(10,1,'mk_feseability/index',NULL,'MkFeseability','来稿确认','Feasibility'),(11,1,'mk_invoicing/index',NULL,'MkInvoicing','结算管理','Invoicing'),(12,2,'pj_contract_review/index',NULL,'PjContractReview','项目汇总','Contract Review'),(13,2,'pj_project_database/index',NULL,'PjProjectDatabase','项目数据库','Project Database'),(14,2,'pj_project_profile/index',NULL,'PjProjectProfile','项目描述','Project Profile'),(15,2,'pj_daily_progress_tr_re/index',NULL,'PjDailyProgressTrRe','每日进度（翻译校对）','Daily Progress(TR&RE)'),(16,2,'pj_daily_progress_dtp/index',NULL,'PjDailyProgressDtp','每日进度（排版）','Daily Progress(DTP)'),(17,2,'pj_y_p_evaluation/index',NULL,'PjYPEvaluation','预排评估','Pre-Fromat Evalaution'),(18,2,'pj_translation_evaluation/index',NULL,'PjTranslationEvaluation','翻译评估','Translation Evaluation'),(19,2,'pj_h_p_evaluation/index',NULL,'PjHPEvaluation','后排评估','Post-format Evaluation'),(20,2,'pj_project_summary/index',NULL,'PjProjectSummary','项目总结','Project Summary'),(21,2,'pj_project_release/index',NULL,'PjProjectRelease','项目放行','Project Release'),(22,2,'pj_client_feedback/index',NULL,'PjClientFeedback','客户反馈','Customer Feedback'),(23,3,'my_schedule/index',NULL,NULL,'我的日程','My Schedule'),(24,3,'project_schedule/index',NULL,NULL,'项目日程','Project Schedule'),(25,3,'personnel_schedule/index',NULL,NULL,'人员日程','Personnel Schedule'),(26,4,'system_configuration/index',NULL,NULL,'系统设置','System Configuration'),(27,4,'admin/index',NULL,NULL,'用户管理','User Management'),(28,4,'authority_management/index',NULL,NULL,'权限管理','Authority Management'),(29,4,'http://localhost/phpMyAdmin4.8.5/',NULL,NULL,'表格管理','Table Management'),(30,6,'xt_dict/index',NULL,'XtDict','词库管理','Dict Management'),(31,4,'xt_company/index',NULL,'XtCompany','主体公司','Subject Company'),(32,5,'statistics/index',NULL,NULL,'统计报表','Statistics'),(33,0,'#','icon-project-soild',NULL,'文件管理','File Management'),(34,33,'xt_file/index',NULL,NULL,'项目文件','Project File');

/*Table structure for table `ky_xt_messages` */

DROP TABLE IF EXISTS `ky_xt_messages`;

CREATE TABLE `ky_xt_messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `cn_title` varchar(255) DEFAULT NULL COMMENT '中文标题',
  `en_title` varchar(255) DEFAULT NULL COMMENT '英文标题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态:0未读 1已读',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_messages` */

insert  into `ky_xt_messages`(`id`,`name`,`cn_title`,`en_title`,`content`,`status`,`create_time`,`update_time`,`delete_time`) values (2,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200827APQ01',0,1598525345,1598525345,0),(3,'项目经理TJ','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200827APQ01',0,1598525517,1598525517,0),(5,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200828XH01',0,1598611421,1598611421,0),(7,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200828XH02',0,1598611426,1598611426,0),(8,'项目经理TJ','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200828XH02',0,1598612327,1598612327,0),(9,'项目经理TJ','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200828XH01',0,1598612599,1598612599,0),(11,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200828XH03',0,1598613222,1598613222,0),(12,'翻译张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH02',0,1598665563,1598665563,0),(13,'校对张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH02',0,1598665563,1598665563,0),(14,'预排张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH02',0,1598665563,1598665563,0),(15,'后排张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH02',0,1598665563,1598665563,0),(16,'项目助理XJY','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH02',0,1598665563,1598665563,0),(17,'翻译张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH01',0,1598665696,1598665696,0),(18,'校对张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH01',0,1598665696,1598665696,0),(19,'N/A','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH01',0,1598665696,1598665696,0),(20,'后排张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH01',0,1598665697,1598665697,0),(21,'项目助理XJY','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH01',0,1598665697,1598665697,0),(22,'翻译张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200827APQ01',0,1598666037,1598666037,0),(23,'校对张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200827APQ01',0,1598666037,1598666037,0),(24,'预排张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200827APQ01',0,1598666037,1598666037,0),(25,'后排李四','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200827APQ01',0,1598666037,1598666037,0),(26,'项目助理ZYX','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200827APQ01',0,1598666037,1598666037,0),(27,'翻译李四','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH03',0,1598692542,1598692542,0),(28,'N/A','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH03',0,1598692542,1598692542,0),(29,'N/A','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH03',0,1598692542,1598692542,0),(30,'后排李四','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH03',0,1598692542,1598692542,0),(31,'项目助理XJY','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200828XH03',0,1598692542,1598692542,0),(33,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200831bayer01',0,1598840657,1598840657,0),(35,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200831bayer02',0,1598840691,1598840691,0),(36,'项目经理TJ','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200831bayer02',0,1598840756,1598840756,0),(37,'项目经理TJ','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200831bayer01',0,1598840756,1598840756,0),(39,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200901BL01',0,1598952639,1598952639,0),(41,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200901BL02',0,1598952644,1598952644,0),(43,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200901BL03',0,1598952749,1598952749,0),(44,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200901BL02',0,1598954699,1598954699,0),(45,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200901BL03',0,1598954699,1598954699,0),(47,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200903HDZZ01',0,1599096421,1599096421,0),(48,'项目经理TJ','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200903HDZZ01',0,1599096681,1599096681,0),(50,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200903HDZZ02',0,1599097334,1599097334,0),(52,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200903XH03',0,1599124563,1599124563,0),(53,'项目经理TJ','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200903XH03',0,1599124644,1599124644,0),(54,'项目经理TJ','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200903HDZZ02',0,1599124653,1599124653,0),(55,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200901BL01',0,1599124666,1599124666,0),(56,'项目经理TJ','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200828XH03',0,1599124666,1599124666,0),(57,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200903XH04',0,1599125251,1599125251,0),(58,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200903XH04',0,1599125251,1599125251,0),(59,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200903SE05',0,1599128476,1599128476,0),(60,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200903SE05',0,1599128476,1599128476,0),(61,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200903SE06',0,1599128481,1599128481,0),(62,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200903SE06',0,1599128481,1599128481,0),(63,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200903SE06',0,1599128679,1599128679,0),(64,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200903SE05',0,1599128679,1599128679,0),(65,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200903SE07',0,1599129092,1599129092,0),(66,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200903SE07',0,1599129092,1599129092,0),(67,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200903SE07',0,1599129316,1599129316,0),(68,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904SE01',1,1599184467,1599184543,0),(69,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904SE01',0,1599184467,1599184467,0),(70,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200904SE01',0,1599184576,1599184576,0),(71,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904RPGI02',0,1599185370,1599185370,0),(72,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904RPGI02',0,1599185370,1599185370,0),(73,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904RPGI03',0,1599185377,1599185377,0),(74,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904RPGI03',0,1599185377,1599185377,0),(75,'项目经理TJ','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200904RPGI02',0,1599185549,1599185549,0),(76,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904JZ04',0,1599186935,1599186935,0),(77,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904JZ04',0,1599186935,1599186935,0),(78,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904JZ05',0,1599186940,1599186940,0),(79,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904JZ05',0,1599186940,1599186940,0),(80,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904JZ06',0,1599187090,1599187090,0),(81,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904JZ06',0,1599187090,1599187090,0),(82,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904JZ07',0,1599187095,1599187095,0),(83,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904JZ07',0,1599187095,1599187095,0),(84,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904JZ08',0,1599208124,1599208124,0),(85,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904JZ08',0,1599208124,1599208124,0),(86,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904JZ09',0,1599208129,1599208129,0),(87,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200904JZ09',0,1599208129,1599208129,0),(88,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200904JZ09',0,1599213657,1599213657,0),(89,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200904JZ08',0,1599213657,1599213657,0),(90,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200907GDM01',0,1599473124,1599473124,0),(91,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200907GDM01',0,1599473124,1599473124,0),(92,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200910JZ01',0,1599718231,1599718231,0),(93,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200910JZ01',0,1599718231,1599718231,0),(94,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200910JZ02',0,1599718247,1599718247,0),(95,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200910JZ02',0,1599718247,1599718247,0),(96,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200911WTYP01',0,1599812904,1599812904,0),(97,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200911WTYP01',0,1599812904,1599812904,0),(98,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200911WTYP02',0,1599812952,1599812952,0),(99,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200911WTYP02',0,1599812952,1599812952,0),(100,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200911WTYP03',0,1599814853,1599814853,0),(101,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200911WTYP03',0,1599814853,1599814853,0),(102,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200911WTYP04',0,1599814914,1599814914,0),(103,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200911WTYP04',0,1599814914,1599814914,0),(104,'','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200911WTYP03',0,1599816535,1599816535,0),(105,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200911WTYP02',0,1599816535,1599816535,0),(106,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200911WTYP01',0,1599816535,1599816535,0),(107,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200910JZ02',0,1599822999,1599822999,0),(108,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200910JZ01',0,1599822999,1599822999,0),(109,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200911JZ05',0,1599823707,1599823707,0),(110,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200911JZ05',0,1599823707,1599823707,0),(111,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200911JZ06',0,1599823711,1599823711,0),(112,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200911JZ06',0,1599823711,1599823711,0),(113,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200921XH01',0,1600678401,1600678401,0),(114,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200921XH01',0,1600678401,1600678401,0),(115,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200921XH02',0,1600678406,1600678406,0),(116,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200921XH02',0,1600678406,1600678406,0),(117,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200921YYS03',0,1600680430,1600680430,0),(118,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200921YYS03',0,1600680430,1600680430,0),(119,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200921YYS04',0,1600680448,1600680448,0),(120,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200921YYS04',0,1600680448,1600680448,0),(121,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200921YYS05',0,1600680955,1600680955,0),(122,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200921YYS05',0,1600680955,1600680955,0),(123,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200921YYS06',0,1600680965,1600680965,0),(124,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200921YYS06',0,1600680965,1600680965,0),(125,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200924AB01',0,1600912016,1600912016,0),(126,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200924AB01',0,1600912016,1600912016,0),(127,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200924AB02',0,1600912046,1600912046,0),(128,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200924AB02',0,1600912046,1600912046,0),(129,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200924AB03',1,1600912154,1600912494,0),(130,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200924AB03',0,1600912154,1600912154,0),(131,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200924AB03',0,1600912517,1600912517,0),(132,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200924AB02',0,1600912517,1600912517,0),(133,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200924XH04',0,1600931704,1600931704,0),(134,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200924XH04',0,1600931704,1600931704,0),(135,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200924XH05',0,1600931708,1600931708,0),(136,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200924XH05',0,1600931708,1600931708,0),(137,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200924XH07',0,1600933835,1600933835,0),(138,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200924XH07',0,1600933835,1600933835,0),(139,'翻译张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200924XH07',0,1601176793,1601176793,0),(140,'校对张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200924XH07',0,1601176793,1601176793,0),(141,'预排张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200924XH07',0,1601176793,1601176793,0),(142,'后排张三','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200924XH07',0,1601176793,1601176793,0),(143,'项目助理ZYX','您有新项目信息待处理！','You have new Project to pending','Filing_Code: F-20200924XH07',0,1601176793,1601176793,0),(144,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200927YYS01',0,1601201132,1601201132,0),(145,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200927YYS01',0,1601201132,1601201132,0),(146,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB01',0,1601450860,1601450860,0),(147,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB01',0,1601450860,1601450860,0),(148,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930XH02',0,1601451260,1601451260,0),(149,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930XH02',0,1601451260,1601451260,0),(150,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB03',0,1601453372,1601453372,0),(151,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB03',0,1601453372,1601453372,0),(152,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB04',0,1601453794,1601453794,0),(153,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB04',0,1601453794,1601453794,0),(154,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB05',0,1601454651,1601454651,0),(155,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB05',0,1601454651,1601454651,0),(156,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB06',0,1601454859,1601454859,0),(157,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB06',0,1601454859,1601454859,0),(158,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB07',0,1601454902,1601454902,0),(159,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB07',0,1601454902,1601454902,0),(160,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB08',0,1601455102,1601455102,0),(161,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930AB08',0,1601455102,1601455102,0),(162,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930SHGD09',0,1601457191,1601457191,0),(163,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930SHGD09',0,1601457191,1601457191,0),(164,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930SHGD10',0,1601457206,1601457206,0),(165,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930SHGD10',0,1601457206,1601457206,0),(166,'scxzjl','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930SHGD11',0,1601457254,1601457254,0),(167,'总经理','您有新来稿待批准，请尽快确认！','You have new file to confirm','Filing_Code: F-20200930SHGD11',0,1601457254,1601457254,0),(168,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200930SHGD11',0,1601457642,1601457642,0),(169,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200930SHGD10',0,1601457642,1601457642,0),(170,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200930SHGD09',0,1601457642,1601457642,0),(171,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200930AB08',0,1601457668,1601457668,0),(172,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200930AB07',0,1601457668,1601457668,0),(173,'项目经理LG','您有新项目汇总信息待处理！','You have new Contract Review to pending','Filing_Code: F-20200930AB06',0,1601457668,1601457668,0);

/*Table structure for table `ky_xt_pj_group` */

DROP TABLE IF EXISTS `ky_xt_pj_group`;

CREATE TABLE `ky_xt_pj_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `name` varchar(255) DEFAULT NULL COMMENT '部门',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_pj_group` */

/*Table structure for table `ky_xt_report` */

DROP TABLE IF EXISTS `ky_xt_report`;

CREATE TABLE `ky_xt_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `cn_name` varchar(255) DEFAULT NULL COMMENT '报表中文名',
  `en_name` varchar(255) DEFAULT NULL COMMENT '报表英文名',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标样式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_report` */

insert  into `ky_xt_report`(`id`,`cn_name`,`en_name`,`url`,`icon`) values (1,'翻译量对比统计','Analysis of Production Volume','statistics/translation',NULL),(2,'翻译金额对比统计','Analysis of Invoice Volume','statistics/translation_amount',NULL),(3,'年度翻译量汇总','Annual Production Volume','translation/index',NULL),(4,'销售人员销售额汇总','Annual Sales Performance','statistics/sales_statistics',NULL),(5,'工作绩效统计','Performance Table','performance_table/index',NULL),(6,'翻译人员质量评估','Quality Appraisal of Translator','statistics/qa_translator',NULL),(7,'校对人员质量评估','Quality Appraisal of Reviser','qa_reviser/index',NULL),(8,'排版人员质量评估','Quality Appraisal of Formatter','statistics/qa_formatter',NULL),(10,'翻译校对人员综合考核','Overall Performance Appraisal of TR&RE','opa_tr_re/index',NULL),(11,'排版人员综合考核','Overall Performance Appraisal of Formatter','opa_formatter/index',NULL),(12,'项目助理综合考核','Overall Performance Appraisal of Project Assisstant','opa_pa/index',NULL),(13,'项目通道','Project Funnel','project_funnel/index',NULL);

/*Table structure for table `ky_xt_rw_auth` */

DROP TABLE IF EXISTS `ky_xt_rw_auth`;

CREATE TABLE `ky_xt_rw_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `name` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `C` varchar(255) DEFAULT NULL COMMENT '菜单栏目',
  `read` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '查看数据',
  `create` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '新增数据',
  `edit` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '修改数据',
  `delete` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '删除数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_rw_auth` */

insert  into `ky_xt_rw_auth`(`id`,`name`,`C`,`read`,`create`,`edit`,`delete`) values (1,'系统管理员','MKContract',1,1,1,1),(2,'系统管理员','MkCustomer',1,1,1,1),(3,'系统管理员','MkInquiry',1,1,1,1),(4,'系统管理员','MkFeseability',1,1,1,1),(5,'系统管理员','MkInvoicing',1,1,1,1),(6,'系统管理员','PjContractReview',1,1,1,1),(7,'系统管理员','PjProjectDatabase',1,1,1,1),(8,'系统管理员','PjProjectProfile',1,1,1,1),(9,'系统管理员','PjDailyProgressTrRe',1,1,1,1),(10,'系统管理员','PjDailyProgressDtp',1,1,1,1),(11,'系统管理员','PjYPEvaluation',1,1,1,1),(12,'系统管理员','PjTranslationEvaluation',1,1,1,1),(13,'系统管理员','PjHPEvaluation',1,1,1,1),(14,'系统管理员','PjProjectSummary',1,1,1,1),(15,'系统管理员','PjProjectRelease',1,1,1,1),(16,'系统管理员','PjClientFeedback',1,1,1,1),(17,'系统管理员','XtDict',1,1,1,1),(18,'admin','MKContract',1,1,1,1),(19,'admin','MkCustomer',1,1,1,1),(20,'admin','MkInquiry',1,1,1,1),(21,'admin','MkFeseability',1,1,1,1),(22,'admin','MkInvoicing',1,1,1,1),(23,'admin','PjContractReview',1,1,1,1),(24,'admin','PjProjectDatabase',1,1,1,1),(25,'admin','PjProjectProfile',1,1,1,1),(26,'admin','PjDailyProgressTrRe',1,1,1,1),(27,'admin','PjDailyProgressDtp',1,1,1,1),(28,'admin','PjYPEvaluation',1,1,1,1),(29,'admin','PjTranslationEvaluation',1,1,1,1),(30,'admin','PjHPEvaluation',1,1,1,1),(31,'admin','PjProjectSummary',1,1,1,1),(32,'admin','PjProjectRelease',1,1,1,1),(33,'admin','PjClientFeedback',1,1,1,1),(34,'admin','XtDict',1,1,1,1),(37,'系统管理员','XtCompany',1,1,1,1),(38,'admin','XtCompany',1,1,1,1),(39,'项目经理2','MKContract',1,1,1,1),(40,'项目经理2','MkCustomer',1,1,1,1),(41,'项目经理2','MkInquiry',1,1,1,1),(42,'项目经理2','MkFeseability',1,1,1,1),(43,'项目经理2','MkInvoicing',1,1,1,1),(44,'项目经理2','PjContractReview',1,1,1,1),(45,'项目经理2','PjProjectDatabase',1,1,1,1),(46,'项目经理2','PjProjectProfile',1,1,1,1),(47,'项目经理2','PjDailyProgressTrRe',1,0,0,0),(48,'项目经理2','PjDailyProgressDtp',1,0,0,0),(49,'项目经理2','PjYPEvaluation',1,0,0,0),(50,'项目经理2','PjTranslationEvaluation',1,0,0,0),(51,'项目经理2','PjHPEvaluation',1,0,0,0),(52,'项目经理2','PjProjectSummary',1,0,0,0),(53,'项目经理2','PjProjectRelease',1,1,1,1),(54,'项目经理2','PjClientFeedback',1,1,1,1),(55,'项目经理2','XtDict',1,1,1,1),(56,'项目经理2','XtCompany',1,1,1,1),(57,'总经理','MKContract',1,1,1,1),(58,'总经理','MkCustomer',1,1,1,1),(59,'总经理','MkInquiry',1,1,1,1),(60,'总经理','MkFeseability',1,1,1,1),(61,'总经理','MkInvoicing',1,1,1,1),(62,'总经理','PjContractReview',1,1,1,1),(63,'总经理','PjProjectDatabase',1,1,1,1),(64,'总经理','PjProjectProfile',1,1,1,1),(65,'总经理','PjDailyProgressTrRe',1,1,1,1),(66,'总经理','PjDailyProgressDtp',1,1,1,1),(67,'总经理','PjYPEvaluation',1,1,1,1),(68,'总经理','PjTranslationEvaluation',1,1,1,1),(69,'总经理','PjHPEvaluation',1,1,1,1),(70,'总经理','PjProjectSummary',1,1,1,1),(71,'总经理','PjProjectRelease',1,1,1,1),(72,'总经理','PjClientFeedback',1,1,1,1),(73,'总经理','XtDict',1,1,1,1),(74,'总经理','XtCompany',1,1,1,1),(75,'scxzjl','MKContract',1,1,1,1),(76,'scxzjl','MkCustomer',1,1,1,1),(77,'scxzjl','MkInquiry',1,1,1,1),(78,'scxzjl','MkFeseability',1,1,1,1),(79,'scxzjl','MkInvoicing',1,1,1,1),(80,'scxzjl','PjContractReview',1,0,1,0),(81,'scxzjl','XtCompany',1,1,1,1),(82,'翻译助理','PjProjectProfile',1,0,0,0),(83,'翻译助理','PjDailyProgressDtp',1,1,1,1),(84,'预排张三','PjProjectProfile',1,0,0,0),(85,'预排张三','PjDailyProgressDtp',1,1,1,1),(86,'预排李四','PjProjectProfile',1,0,0,0),(87,'预排李四','PjDailyProgressDtp',1,1,1,1),(88,'翻译张三','PjProjectProfile',1,0,0,0),(89,'翻译张三','PjDailyProgressTrRe',1,1,1,1),(90,'翻译张三','PjYPEvaluation',1,1,1,1),(91,'翻译张三','PjProjectSummary',1,1,1,1),(92,'翻译李四','PjProjectProfile',1,0,0,0),(93,'翻译李四','PjDailyProgressTrRe',1,1,1,1),(94,'翻译李四','PjYPEvaluation',1,1,1,1),(95,'翻译李四','PjProjectSummary',1,1,1,1),(96,'校对张三','PjProjectProfile',1,0,0,0),(97,'校对张三','PjDailyProgressTrRe',1,1,1,1),(98,'校对张三','PjTranslationEvaluation',1,1,1,1),(99,'校对张三','PjHPEvaluation',1,1,1,1),(100,'校对张三','PjProjectRelease',1,1,1,1),(101,'校对李四','PjProjectProfile',1,0,0,0),(102,'校对李四','PjDailyProgressTrRe',1,1,1,1),(103,'校对李四','PjTranslationEvaluation',1,1,1,1),(104,'校对李四','PjHPEvaluation',1,1,1,1),(105,'校对李四','PjProjectRelease',1,1,1,1),(106,'后排张三','PjProjectProfile',1,0,0,0),(107,'后排张三','PjDailyProgressDtp',1,1,1,1),(108,'后排李四','PjProjectProfile',1,0,0,0),(109,'后排李四','PjDailyProgressDtp',1,1,1,1),(110,'项目助理','PjContractReview',1,0,1,1),(111,'项目助理','PjProjectDatabase',1,0,1,1),(112,'项目助理','PjProjectProfile',1,1,1,1),(113,'项目助理','PjDailyProgressTrRe',1,0,0,0),(114,'项目助理','PjDailyProgressDtp',1,0,0,0),(115,'项目助理','PjYPEvaluation',1,0,0,0),(116,'项目助理','PjTranslationEvaluation',1,1,1,1),(117,'项目助理','PjHPEvaluation',1,0,0,0),(118,'项目助理','PjProjectSummary',1,1,1,1),(119,'项目助理','PjProjectRelease',1,1,1,1),(120,'项目助理','PjClientFeedback',1,1,1,1),(121,'市场助理ZM','MKContract',1,1,1,1),(122,'市场助理ZM','MkCustomer',1,1,1,1),(123,'市场助理ZM','MkInquiry',1,1,1,1),(124,'市场助理ZM','MkFeseability',1,1,1,1),(125,'市场助理ZM','MkInvoicing',1,1,1,1),(126,'市场助理ZM','PjClientFeedback',1,1,1,1),(127,'市场助理LYX','MKContract',1,1,1,1),(128,'市场助理LYX','MkCustomer',1,1,1,1),(129,'市场助理LYX','MkInquiry',1,1,1,1),(130,'市场助理LYX','MkFeseability',1,1,1,1),(131,'市场助理LYX','MkInvoicing',1,1,1,1),(132,'市场助理LYX','PjClientFeedback',1,1,1,1),(133,'市场助理CR','MKContract',1,1,1,1),(134,'市场助理CR','MkCustomer',1,1,1,1),(135,'市场助理CR','MkInquiry',1,1,1,1),(136,'市场助理CR','MkFeseability',1,1,1,1),(137,'市场助理CR','MkInvoicing',1,1,1,1),(138,'市场助理CR','PjClientFeedback',1,1,1,1),(139,'项目助理XJY','PjContractReview',1,0,1,0),(140,'项目助理XJY','PjProjectDatabase',1,0,1,0),(141,'项目助理XJY','PjProjectProfile',1,1,1,1),(142,'项目助理XJY','PjDailyProgressDtp',1,0,0,0),(143,'项目助理ZJ','PjContractReview',1,0,1,0),(144,'项目助理ZJ','PjProjectDatabase',1,0,1,0),(145,'项目助理ZJ','PjProjectProfile',1,1,1,1),(146,'项目助理ZYX','PjContractReview',1,0,1,0),(147,'项目助理ZYX','PjProjectDatabase',1,0,1,0),(148,'项目助理ZYX','PjProjectProfile',1,1,1,1),(149,'项目助理SM','PjContractReview',1,0,1,0),(150,'项目助理SM','PjProjectDatabase',1,0,1,0),(151,'项目助理SM','PjProjectProfile',1,1,1,1),(152,'项目助理SM','PjDailyProgressDtp',1,0,0,0),(153,'项目助理SM','PjYPEvaluation',1,0,0,0),(154,'项目助理SM','PjHPEvaluation',1,0,0,0),(155,'项目助理ZYX','PjDailyProgressDtp',1,0,0,0),(156,'项目助理ZJ','PjDailyProgressDtp',1,0,0,0),(157,'项目经理','PjContractReview',1,1,1,1),(158,'项目经理','PjProjectDatabase',1,1,1,1),(159,'项目经理','PjProjectProfile',1,1,1,1),(160,'项目经理','PjDailyProgressTrRe',1,0,0,0),(161,'项目经理','PjDailyProgressDtp',1,0,0,0),(162,'项目经理','PjYPEvaluation',1,0,0,0),(163,'项目经理','PjTranslationEvaluation',1,0,0,0),(164,'项目经理','PjHPEvaluation',1,0,0,0),(165,'项目经理','PjProjectSummary',1,0,0,0),(166,'项目经理','PjProjectRelease',1,0,0,0),(167,'项目经理','PjClientFeedback',1,0,0,0),(168,'市场助理AL','MKContract',1,1,1,1),(169,'市场助理AL','MkCustomer',1,1,1,1),(170,'市场助理AL','MkInquiry',1,1,1,1),(171,'市场助理AL','MkFeseability',1,1,1,1),(172,'市场助理AL','MkInvoicing',1,1,1,1),(173,'项目助理ZYX','PjDailyProgressTrRe',1,0,0,0),(174,'项目助理ZYX','PjYPEvaluation',1,0,0,0),(175,'项目助理ZYX','PjTranslationEvaluation',1,0,0,0),(176,'项目助理ZYX','PjHPEvaluation',1,0,0,0),(177,'项目助理ZJ','PjDailyProgressTrRe',1,0,0,0),(178,'项目助理ZJ','PjYPEvaluation',1,0,0,0),(179,'项目助理ZJ','PjTranslationEvaluation',1,0,0,0),(180,'项目助理ZJ','PjHPEvaluation',1,0,0,0),(181,'项目助理XJY','PjDailyProgressTrRe',1,0,0,0),(182,'项目助理XJY','PjYPEvaluation',1,0,0,0),(183,'项目助理XJY','PjTranslationEvaluation',1,0,0,0),(184,'项目助理XJY','PjHPEvaluation',1,0,0,0),(185,'项目助理SM','PjDailyProgressTrRe',1,0,0,0),(186,'项目助理SM','PjTranslationEvaluation',1,0,0,0),(187,'项目经理TJ','PjContractReview',1,1,1,1),(188,'项目经理TJ','PjProjectDatabase',1,1,1,1),(189,'项目经理TJ','PjProjectProfile',1,1,1,1),(190,'项目经理TJ','PjDailyProgressTrRe',1,0,0,0),(191,'项目经理TJ','PjDailyProgressDtp',1,0,0,0),(192,'项目经理TJ','PjYPEvaluation',1,0,0,0),(193,'项目经理TJ','PjTranslationEvaluation',1,0,0,0),(194,'项目经理TJ','PjHPEvaluation',1,0,0,0),(195,'项目经理TJ','PjProjectSummary',1,0,0,0),(196,'项目经理TJ','PjProjectRelease',1,1,1,1),(197,'项目经理TJ','PjClientFeedback',1,1,1,1),(198,'项目经理LG','PjContractReview',1,1,1,1),(199,'项目经理LG','PjProjectDatabase',1,1,1,1),(200,'项目经理LG','PjProjectProfile',1,1,1,1),(201,'项目经理LG','PjDailyProgressTrRe',1,0,0,0),(202,'项目经理LG','PjDailyProgressDtp',1,0,0,0),(203,'项目经理LG','PjYPEvaluation',1,0,0,0),(204,'项目经理LG','PjTranslationEvaluation',1,0,0,0),(205,'项目经理LG','PjHPEvaluation',1,0,0,0),(206,'项目经理LG','PjProjectSummary',1,0,0,0),(207,'项目经理LG','PjProjectRelease',1,1,1,1),(208,'项目经理LG','PjClientFeedback',1,1,1,1),(209,'校对李四','PjYPEvaluation',1,1,1,1),(210,'校对李四','PjProjectSummary',1,1,1,1),(211,'后排李四','PjProjectSummary',1,1,1,1),(212,'预排李四','PjProjectSummary',1,1,1,1),(213,'校对张三','PjYPEvaluation',1,1,1,1),(214,'校对张三','PjProjectSummary',1,1,1,1),(215,'后排张三','PjProjectSummary',1,1,1,1),(216,'翻译张三','PjTranslationEvaluation',1,1,1,1),(217,'翻译张三','PjHPEvaluation',1,1,1,1),(218,'翻译张三','PjProjectRelease',1,1,1,1),(219,'预排张三','PjProjectSummary',1,1,1,1),(220,'翻译李四','PjTranslationEvaluation',1,1,1,1),(221,'翻译李四','PjHPEvaluation',1,1,1,1),(222,'翻译李四','PjProjectRelease',1,1,1,1);

/*Table structure for table `ky_xt_system_configation` */

DROP TABLE IF EXISTS `ky_xt_system_configation`;

CREATE TABLE `ky_xt_system_configation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `copyright` varchar(255) DEFAULT NULL COMMENT '版权信息',
  `company` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `General_layout` text COMMENT '整体布局',
  `Format_text` text COMMENT '文本格式',
  `Check_feedback` text COMMENT '校对反馈',
  `Expression_accumulation` text COMMENT '表达积累',
  `Project_summary` text COMMENT '项目总结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_system_configation` */

insert  into `ky_xt_system_configation`(`id`,`copyright`,`company`,`General_layout`,`Format_text`,`Check_feedback`,`Expression_accumulation`,`Project_summary`) values (1,'北京科译翻译有限公司','北京科译翻译有限公司','文件整体布局是否与原文件相符，例如纸张大小、方向、页边距、页眉页脚等。A：优秀；B：良好；C：及格；D：较差。如果评为D时，备注栏里须补充说明具体问题。','文本格式是否与原文件相符，例如字体字号、行距、缩进与对齐、标点符号、数字等。A：优秀；B：良好；C：及格；D：较差。D：较差如果评为D时，备注栏里须补充说明具体问题。','总结校对人员提供的修订反馈','汇总校对稿中有用的表达和术语翻译','总结翻译该项目的心得体会，以及有待提高的方面');

/*Table structure for table `ky_xt_table_text` */

DROP TABLE IF EXISTS `ky_xt_table_text`;

CREATE TABLE `ky_xt_table_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `cn_name` varchar(255) DEFAULT NULL COMMENT '中文名称',
  `en_name` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `intro` text COMMENT '说明文本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_table_text` */

insert  into `ky_xt_table_text`(`id`,`cn_name`,`en_name`,`intro`) values (1,'合同管理','Contract&Administrative Activities',''),(2,'客户管理','Customer',NULL),(3,'来稿需求','Inquiry',NULL),(4,'来稿确认','Feasibility',NULL),(5,'结算管理','Invoicing',NULL),(6,'项目汇总','Contract Review',NULL),(7,'项目数据库','Project Database',NULL),(8,'项目描述','Project Profile',NULL),(9,'每日进度(翻译校对)','Daily Progress(TR&RE)',NULL),(10,'每日进度(排版)','Daily Progress(DTP)',NULL),(11,'预排评估','Pre-Fromat Evalaution','<p>整体布局：</p><p>文件整体布局是否与原文件相符，例如纸张大小、方向、页边距、页眉页脚等。A：优秀；B：良好；C：及格；D：较差。如果评为D时，备注栏里须补充说明具体问题。</p><p>文本格式：</p><p>文本格式是否与原文件相符，例如字体字号、行距、缩进与对齐、标点符号、数字等。A：优秀；B：良好；C：及格；D：较差。D：较差如果评为D时，备注栏里须补充说明具体问题。</p>'),(12,'翻译评估','Translation Evaluation',NULL),(13,'后排评估','Post-Format Evaluation',NULL),(14,'项目总结','Project Summary','总结校对人员提供的修订反馈</br>\n\n表达积累：汇总校对稿中有用的表达和术语翻译</br>\n\n项目总结：总结翻译该项目的心得体会，以及有待提高的方面'),(15,'项目放行','Project Release',NULL),(16,'客户反馈','Customer Feedback',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
