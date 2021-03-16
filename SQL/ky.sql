/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.26 : Database - ky
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_contract` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_customer` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_fapiao` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_feseability` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_inquiry` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

/*Data for the table `ky_mk_inquiry_file` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_invoice` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_invoice_table` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_invoicing` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_quote` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_mk_quote_table` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_client_feedback` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_esperanto_ci;

/*Data for the table `ky_pj_contract_review` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_daily_progress_dtp` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_daily_progress_tr_re` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_h_p_evaluation` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_project_database` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_project_profile` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_project_profile_text` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_project_release` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_project_summary` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_translation_evaluation` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_pj_y_p_evaluation` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_tj_quality_appraisal_reviser` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_file` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ky_xt_messages` */

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
