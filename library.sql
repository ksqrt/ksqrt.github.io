-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- 생성 시간: 21-12-15 05:33
-- 서버 버전: 10.4.22-MariaDB
-- PHP 버전: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `library`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `book`
--

CREATE TABLE `book` (
  `b_num` int(15) NOT NULL,
  `b_author` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_pub` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_date` date NOT NULL,
  `b_isbn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_out` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `book`
--

INSERT INTO `book` (`b_num`, `b_author`, `b_name`, `b_pub`, `b_date`, `b_isbn`, `b_out`) VALUES
(1, '삼국지', '나관중', '실행', '2021-10-07', '2', 0),
(2, '홍길동', '홍길동전', '한비', '2021-09-29', '0000000001', 0),
(13, '바', '바람', '소리', '2021-10-20', '0000000002', 0),
(14, '김등', '사람', '소리', '2021-10-06', '0000000003', 0);

-- --------------------------------------------------------

--
-- 테이블 구조 `borrow_out`
--

CREATE TABLE `borrow_out` (
  `o_num` int(20) NOT NULL,
  `b_num` int(11) NOT NULL,
  `mem_num` int(11) NOT NULL,
  `o_out` date NOT NULL,
  `o_return` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='대여 o_';

-- --------------------------------------------------------

--
-- 테이블 구조 `call_num`
--

CREATE TABLE `call_num` (
  `c_num` int(11) NOT NULL,
  `b_num` int(11) NOT NULL,
  `c_topic` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_loc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `call_num`
--

INSERT INTO `call_num` (`c_num`, `b_num`, `c_topic`, `c_loc`) VALUES
(1, 1, '소설', 2),
(2, 1, '소설', 2),
(3, 13, '소설', 1),
(4, 14, '소설', 2);

-- --------------------------------------------------------

--
-- 테이블 구조 `member`
--

CREATE TABLE `member` (
  `mem_num` int(11) NOT NULL,
  `mem_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mem_idnum` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mem_addre` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mem_ph` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mem_mail` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `member`
--

INSERT INTO `member` (`mem_num`, `mem_name`, `mem_idnum`, `mem_addre`, `mem_ph`, `mem_mail`) VALUES
(1, '가나다', '123456789012', '수원시', '01012345678', 'abc@adsbc.com'),
(2, '홍길동', '1111223333444', '서울', '01022224444', 'mak@dmfasl.net'),
(4, '사라다', '0101991112223', '오산', '01089561245', 'dkdkfk@dman.com'),
(7, '나나', '56465', '거제', '165456', 'ansdfn@dmfam'),
(8, '홍길동', '홍길동전', '한비', '2021-09-29', '0000000001');

-- --------------------------------------------------------

--
-- 테이블 구조 `overdue`
--

CREATE TABLE `overdue` (
  `d_id` int(11) NOT NULL,
  `d_mem_id` int(11) NOT NULL,
  `d_b_id` int(11) NOT NULL,
  `d_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_days` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`b_num`);

--
-- 테이블의 인덱스 `borrow_out`
--
ALTER TABLE `borrow_out`
  ADD PRIMARY KEY (`o_num`),
  ADD KEY `fk_b_num` (`b_num`),
  ADD KEY `fk_mem_num` (`mem_num`);

--
-- 테이블의 인덱스 `call_num`
--
ALTER TABLE `call_num`
  ADD PRIMARY KEY (`c_num`),
  ADD KEY `fk_call_b_num` (`b_num`);

--
-- 테이블의 인덱스 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`mem_num`),
  ADD UNIQUE KEY `mem_idnum` (`mem_idnum`);

--
-- 테이블의 인덱스 `overdue`
--
ALTER TABLE `overdue`
  ADD PRIMARY KEY (`d_id`),
  ADD KEY `d_fk_mem_id` (`d_mem_id`),
  ADD KEY `d_fk_b_id` (`d_b_id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `book`
--
ALTER TABLE `book`
  MODIFY `b_num` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 테이블의 AUTO_INCREMENT `borrow_out`
--
ALTER TABLE `borrow_out`
  MODIFY `o_num` int(20) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `call_num`
--
ALTER TABLE `call_num`
  MODIFY `c_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 테이블의 AUTO_INCREMENT `member`
--
ALTER TABLE `member`
  MODIFY `mem_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 테이블의 AUTO_INCREMENT `overdue`
--
ALTER TABLE `overdue`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `borrow_out`
--
ALTER TABLE `borrow_out`
  ADD CONSTRAINT `fk_b_num` FOREIGN KEY (`b_num`) REFERENCES `book` (`b_num`),
  ADD CONSTRAINT `fk_mem_num` FOREIGN KEY (`mem_num`) REFERENCES `member` (`mem_num`);

--
-- 테이블의 제약사항 `call_num`
--
ALTER TABLE `call_num`
  ADD CONSTRAINT `fk_call_b_num` FOREIGN KEY (`b_num`) REFERENCES `book` (`b_num`);

--
-- 테이블의 제약사항 `overdue`
--
ALTER TABLE `overdue`
  ADD CONSTRAINT `d_fk_b_id` FOREIGN KEY (`d_b_id`) REFERENCES `book` (`b_num`),
  ADD CONSTRAINT `d_fk_mem_id` FOREIGN KEY (`d_mem_id`) REFERENCES `member` (`mem_num`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
