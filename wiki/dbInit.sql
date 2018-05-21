
--
-- DB
--
CREATE DATABASE wxapp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


--
-- TABLE
--
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `token` varchar(1024) NOT NULL DEFAULT '' COMMENT 'access_token',
  `expires` int(11) NOT NULL COMMENT '过期时间，单位(s)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT='token记录表';

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bkid` int(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '书籍id',
  `bkclass` int(11) DEFAULT NULL COMMENT '书籍类别',
  `bkname` varchar(48) NOT NULL DEFAULT '' COMMENT '书籍名称',
  `bkauthor` varchar(32) NOT NULL DEFAULT '' COMMENT '书籍作者',
  `bkpublisher` varchar(16) DEFAULT NULL COMMENT '书籍出版社',
  `bkfile` varchar(256) NOT NULL DEFAULT '' COMMENT '书籍文件地址',
  `bkcover` varchar(120) DEFAULT '' COMMENT '书籍封面',
  `bkprice` int(11) DEFAULT '1' COMMENT '书籍积分',
  PRIMARY KEY (`bkid`)
) ENGINE=InnoDB COMMENT='图书表';

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cmid` int(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `uid` varchar(128) NOT NULL DEFAULT '' COMMENT '用户openid',
  `uname` varchar(48) NOT NULL DEFAULT '' COMMENT '用户名称',
  `ccontent` varchar(128) DEFAULT NULL COMMENT '评论内容',
  `bkname` varchar(16) NOT NULL DEFAULT '' COMMENT '书籍名称',
  `bkid` int(16) NOT NULL COMMENT '书籍ID',
  `uavatar` varchar(128) NOT NULL DEFAULT '' COMMENT '用户头像',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`cmid`)
) ENGINE=InnoDB COMMENT='评论表';

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `uid` varchar(128) NOT NULL DEFAULT '' COMMENT '用户openid',
  `oprice` int(11) DEFAULT '0' COMMENT '书籍价格',
  `otime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `bkid` int(16) NOT NULL COMMENT '书籍ID',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB COMMENT='订单表';

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(128) NOT NULL DEFAULT '' COMMENT '用户openid',
  `uname` varchar(40) DEFAULT '' COMMENT '用户微信名',
  `ugender` int(1) DEFAULT NULL COMMENT '用户性别',
  `uaddress` varchar(128) DEFAULT NULL COMMENT '用户地址',
  `ubalance` int(11) DEFAULT NULL COMMENT '用户积分余额',
  `uavatar` varchar(128) DEFAULT NULL COMMENT '用户头像',
  `skey` varchar(128) NOT NULL DEFAULT '' COMMENT '用户登录态标识',
  `sessionkey` varchar(128) NOT NULL DEFAULT '' COMMENT '微信登录态标识',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '账号注册时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户最近登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT='用户表';


--
-- INIT DATA
--
INSERT INTO `access` (`id`, `token`, `expires`)
VALUES
(1, 'xiao雨💦', 100),
(2,'8_cuEOR6I9zyYSMRje-tji4g6JFKFwKdOWHv3mF9ZjDvRaIJLU_0Nda_2abRNM9lo86IITgt8L1Sg5Wy7rsyZ15HFVeuKvYOXlO7NddeE5FzV1hQuR-r1KQil4sitpjJs_rezA3-US6rEovpB2VGOcAGAMXF',7200);

INSERT INTO `books` (`bkid`, `bkclass`, `bkname`, `bkauthor`, `bkpublisher`, `bkfile`, `bkcover`, `bkprice`)
VALUES
(1000000001,3,'深入浅出Node.js','朴灵','人民邮电出版社','******** book file ********','https://img3.doubanio.com/lpic/s27269296.jpg',1),
(1000000002,3,'javascript从入门到放弃','Nicholas C.Zakas','人民邮电出版社','******** book file ********','https://img3.doubanio.com/lpic/s8958650.jpg',5),
(1000000003,1,'解忧杂货店','东野奎吾','南海出版公司','******** book file ********','https://img3.doubanio.com/lpic/s27264181.jpg',1),
(1000000004,2,'红楼梦','曹雪芹','人民文学出版社','******** book file ********','https://img1.doubanio.com/lpic/s1070959.jpg',8),
(1000000005,1,'安徒生童话故事集','汉斯·克里斯蒂安·安徒生 ','人民文学出版社','******** book file ********','https://img3.doubanio.com/lpic/s1034062.jpg',2);
