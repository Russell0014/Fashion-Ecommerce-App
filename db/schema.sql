-- Schema for COSC3046_2302_G2

CREATE TABLE `Comment` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `commentBody` varchar(500) CHARACTER SET utf8 NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `threadID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `isArchive` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`commentID`),
  KEY `threadID` (`threadID`),
  KEY `userID` (`userID`),
  CONSTRAINT `Comment_ibfk_1` FOREIGN KEY (`threadID`) REFERENCES `Thread` (`threadID`),
  CONSTRAINT `Comment_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Feedback` (
  `feedbackID` int(11) NOT NULL AUTO_INCREMENT,
  `feedbackName` varchar(500) CHARACTER SET utf8 NOT NULL,
  `feedbackEmail` varchar(500) CHARACTER SET utf8 NOT NULL,
  `feedbackQues` varchar(500) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`feedbackID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `LikedThreads` (
  `LikeID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `threadID` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LikeID`),
  UNIQUE KEY `uniqueLike` (`userID`,`threadID`),
  KEY `threadID` (`threadID`),
  CONSTRAINT `LikedThreads_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`),
  CONSTRAINT `LikedThreads_ibfk_2` FOREIGN KEY (`threadID`) REFERENCES `Thread` (`threadID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `MyGuests` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productImage` longblob NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productDesc` varchar(1000) DEFAULT NULL,
  `productPrice` int(11) NOT NULL,
  `productStock` int(11) NOT NULL,
  `size` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Team` (
  `studentID` int(11) NOT NULL,
  `studentName` varchar(100) NOT NULL,
  `studentRole` varchar(100) NOT NULL,
  `studentEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Thread` (
  `threadID` int(100) NOT NULL AUTO_INCREMENT,
  `threadTitle` varchar(100) NOT NULL,
  `threadDesc` varchar(500) NOT NULL,
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `isArchive` tinyint(1) NOT NULL,
  `userID` int(11) NOT NULL,
  `threadIMG` longblob,
  `likeCount` int(11) DEFAULT '0',
  PRIMARY KEY (`threadID`),
  KEY `userID` (`userID`),
  CONSTRAINT `Thread_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `User` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `userPassword` varchar(100) NOT NULL,
  `userEmail` varchar(100) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `userIMG` longblob,
  `lastname` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `userAddress` varchar(500) DEFAULT NULL,
  `phoneNumber` int(11) DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `userState` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `userCountry` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `isUserArchive` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `UQ_user_name` (`userName`),
  UNIQUE KEY `UQ_user_email` (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `password_reset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `token` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `expiration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
