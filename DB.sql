DROP DATABASE IF EXISTS `Project_sla_recipe`;
CREATE DATABASE `Project_sla_recipe`;
USE `Project_sla_recipe`;

CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL UNIQUE,
    loginPw CHAR(80) NOT NULL,
    `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)',
    `name` CHAR(20) NOT NULL,
    nickname  CHAR(20) NOT NULL UNIQUE,
    cellphoneNum  CHAR(20) NOT NULL UNIQUE,
    email  CHAR(50) NOT NULL UNIQUE,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴여부(0=탈퇴 전, 1=탈퇴 후)',
    delDate DATETIME COMMENT '탈퇴 날짜',
    mannerWeather INT(10) UNSIGNED NOT NULL DEFAULT 3 COMMENT '순서대로 1,2,3,4,5 1이 매너 제일 안좋음 5가 매너 제일 좋음'
);

CREATE TABLE recipe(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL,
    hitCount INT(10) UNSIGNED NOT NULL DEFAULT 0,
    goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0,
    badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0,
    categoryId INT(10) UNSIGNED NOT NULL
);

CREATE TABLE ingredient(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    recipeId INT(10) UNSIGNED NOT NULL,
    `name` CHAR(20) NOT NULL,
    nutrients  CHAR(20) NOT NULL,
    measure CHAR(30) NOT NULL
);

CREATE TABLE cookware(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    recipeId INT(10) UNSIGNED NOT NULL,
    `name` CHAR(20) NOT NULL,
    `count` INT(10) UNSIGNED NOT NULL
);

CREATE TABLE category(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` CHAR(20) NOT NULL
);

CREATE TABLE reactionPoint(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `point` INT(10) NOT NULL
);

CREATE TABLE reply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `body`TEXT NOT NULL,
    goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0,
    badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0
);

CREATE TABLE groupBuyingArticle (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    title CHAR(100) NOT NULL,
    `body`TEXT NOT NULL,
    hashTag VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL
);

#########################################################################
# SELECT
select * from `member`;

#########################################################################
# member table insert data
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user1',
loginPw = 'user1',
`authLevel` = 7,
`name` = '고수달',
nickname = '초고수달',
cellphoneNum = '01012341234',
email = 'sudal123@gmail.com';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user2',
loginPw = 'user2',
`name` = '고양이',
nickname = '고먐미',
cellphoneNum = '01011112222',
email = 'nyang22@gmail.com';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user3',
loginPw = 'user3',
`name` = '강아지',
nickname = '멈무이',
cellphoneNum = '01012345678',
email = 'mummu33@gmail.com';