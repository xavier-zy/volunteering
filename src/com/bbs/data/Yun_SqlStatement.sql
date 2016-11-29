-- 我的活动
CONSTRAINT `MYACTIVITYREFACTIVITY` FOREIGN KEY (`activityId`) REFERENCES `activityr` (`activityId`)
FOREIGN KEY (`userId`) REFERENCES `tuser` (`id`)
FOREIGN KEY (`userId`) REFERENCES `tuser` (`id`)
FOREIGN KEY (`userId`) REFERENCES `tuser` (`id`)
DROP TABLE IF EXISTS `myactivity`;
CREATE TABLE `myactivity`(
	`id` int unsigned auto_increment key,
	`activityStatus` varchar(1) not null,
	`activityId` int(11)
);
DROP TABLE IF EXISTS `thoughts`;
CREATE TABLE `thoughts`(
	`id` int unsigned auto_increment key,
	`thoughtsTitle` varchar(1000) not null,
	`thoughtsContent` text,
	`publishTime` varchar(20),
	`userId` int(20)
);
DROP TABLE IF EXISTS `postedMsg`;
CREATE TABLE `postedMsg`(
	`id` int unsigned auto_increment key,
	`postTitle` varchar(1000) not null,
	`postContent` text,
	`publishTime` varchar(20),
	`userId` int(20)
);
DROP TABLE IF EXISTS `tuserinfo`;
CREATE TABLE `tuserinfo`(
	`id` int unsigned auto_increment key,
	`username` varchar(30) not null,
	`phone` varchar(11),
	`email` varchar(30),
	`gender` varchar(5) not null,
	`age` int(5),
	`address` varchar(30),
	`signature` varchar(100),
	`time` varchar(20),
	`userId` int(20)
);
