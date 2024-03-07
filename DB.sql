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
    categoryId INT(10) UNSIGNED NOT NULL,
    personnel INT(5) UNSIGNED NOT NULL COMMENT '1인분,2인분,3인분,4인분,5인분',
    cookingTime INT(10) UNSIGNED NOT NULL COMMENT '10분이내,15분이내,20분이내,30분이내,60분이내,90분이내',
    cookLevel INT(10) UNSIGNED NOT NULL COMMENT '1초하수달,2하수달,3중수달,4고수달,5초고수달'
);

CREATE TABLE ingredient(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    recipeId INT(10) UNSIGNED NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    `name` CHAR(20) NOT NULL,
    nutrients  CHAR(20) NOT NULL,
    measure CHAR(30) NOT NULL
);

CREATE TABLE cookWare(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    recipeId INT(10) UNSIGNED NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
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
SELECT * FROM `member`;

SELECT * FROM recipe;

SELECT * FROM reply;

SELECT * FROM ingredient;

SELECT * FROM cookWare;

#########################################################################
# recipe table insert data
INSERT INTO recipe
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
title = '나만의 김치찜 만들기',
`body` = '일단 옆집 꼬꼬를 죽이고 털 뽑아서 내장 버리고 머리 버리고 정육해서 김치넣고 끓이면 완성!',
categoryId = 1,
personnel = 1,
cookingTime = 1,
cookLevel = 1;

INSERT INTO recipe
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
title = '오리훈제 샐러드',
`body` = '옆집 꽥꽥이 죽이고 털뽑아서 내장 버리고 머리 버리고 정육해서 훈연하고 샐러드 만들면 완성!',
categoryId = 2,
personnel = 1,
cookingTime = 1,
cookLevel = 1;

INSERT INTO recipe
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
title = '수달식 회치기',
`body` = '살아있는거 뜯어먹으면 끝!',
categoryId = 4,
personnel = 1,
cookingTime = 1,
cookLevel = 1;

#########################################################################
# ingredient table insert data
INSERT INTO ingredient
SET recipeId = 1,
memberId = 3,
`name` = '김치',
nutrients = '식이섬유',
measure = '반포기';

INSERT INTO ingredient
SET recipeId = 1,
memberId = 3,
`name` = '생닭',
nutrients = '단백질',
measure = '1마리';

INSERT INTO ingredient
SET recipeId = 1,
memberId = 3,
`name` = '우유',
nutrients = '단백질,지질,유당',
measure = '500ml';

INSERT INTO ingredient
SET recipeId = 1,
memberId = 3,
`name` = '고추가루',
nutrients = '',
measure = '1T';

INSERT INTO ingredient
SET recipeId = 1,
memberId = 3,
`name` = '양파',
nutrients = '케르세틴',
measure = '1개';

INSERT INTO ingredient
SET recipeId = 1,
memberId = 3,
`name` = '다진마늘',
nutrients = '아미노산',
measure = '1T';

INSERT INTO ingredient
SET recipeId = 1,
memberId = 3,
`name` = '대파',
nutrients = '무기질',
measure = '반단';

INSERT INTO ingredient
SET recipeId = 1,
memberId = 3,
`name` = '물',
nutrients = '수분',
measure = '300ml';

INSERT INTO ingredient
SET recipeId = 3,
memberId = 3,
`name` = '가물치',
nutrients = '단백질',
measure = '1마리';


#########################################################################
# cookWare table insert data
INSERT INTO cookWare
SET recipeId = 1,
memberId = 3,
`name` = '냄비',
`count` = 1;

INSERT INTO cookWare
SET recipeId = 1,
memberId = 3,
`name` = '국자',
`count` = 1;

INSERT INTO cookWare
SET recipeId = 1,
memberId = 3,
`name` = '보울',
`count` = 2;

INSERT INTO cookWare
SET recipeId = 1,
memberId = 3,
`name` = '도마',
`count` = 1;

INSERT INTO cookWare
SET recipeId = 1,
memberId = 3,
`name` = '칼',
`count` = 1;

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

#########################################################################
# category table insert data

insert into category
set `name` = '집밥';

INSERT INTO category
SET `name` = '다이어트';

INSERT INTO category
SET `name` = '탄단지';

INSERT INTO category
SET `name` = '초간단';

INSERT INTO category
SET `name` = '대접';

