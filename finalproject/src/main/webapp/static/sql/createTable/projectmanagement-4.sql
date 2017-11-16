-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 15/11/2017 às 12:02
-- Versão do servidor: 5.6.37
-- Versão do PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projectmanagement`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `app_user`
--

CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `job_desc` varchar(50) NOT NULL,
  `state` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `app_user`
--

INSERT INTO `app_user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `job_desc`, `state`) VALUES
(1, 'renanchagasw', '$2a$10$Rw3lscqKm0xWdN2bQOHZ.uE87G6DvYBwDeThp3LmmqvyQIUmnpVyy', 'Renan', 'Chagas Wanderley', 'renan@teste.com.br', 'Student', 'Active');

-- --------------------------------------------------------

--
-- Estrutura para tabela `app_user_user_profile`
--

CREATE TABLE `app_user_user_profile` (
  `user_id` bigint(20) NOT NULL,
  `user_profile_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `app_user_user_profile`
--

INSERT INTO `app_user_user_profile` (`user_id`, `user_profile_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notification`
--

CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL,
  `FL_READ` tinyint(1) DEFAULT NULL,
  `TYPE` bigint(20) DEFAULT NULL,
  `TASK_ID` bigint(20) DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL,
  `CREATE_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `notification`
--

INSERT INTO `notification` (`id`, `FL_READ`, `TYPE`, `TASK_ID`, `USER_ID`, `CREATE_DATE`) VALUES
(1, 0, 1, 54, 1, '2017-11-15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notification_type`
--

CREATE TABLE `notification_type` (
  `ID` bigint(20) NOT NULL,
  `TYPE` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `notification_type`
--

INSERT INTO `notification_type` (`ID`, `TYPE`) VALUES
(1, 'CREATED'),
(2, 'UPDATED');

-- --------------------------------------------------------

--
-- Estrutura para tabela `project`
--

CREATE TABLE `project` (
  `id` bigint(20) NOT NULL,
  `project_name` varchar(20) NOT NULL,
  `project_desc` text,
  `due_date` date DEFAULT NULL,
  `icon` varchar(100) NOT NULL,
  `create_date` date DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `finish_desc` text,
  `finish_user` varchar(30) DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  `finish_state` bigint(20) DEFAULT NULL,
  `state_icon` varchar(100) DEFAULT NULL,
  `stateIconColor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `project`
--

INSERT INTO `project` (`id`, `project_name`, `project_desc`, `due_date`, `icon`, `create_date`, `create_user`, `finish_desc`, `finish_user`, `finish_date`, `finish_state`, `state_icon`, `stateIconColor`) VALUES
(14, 'Project Sample', 'Duis non varius lacus. Integer turpis odio, lacinia non maximus nec, blandit vel quam. Sed tempor quam enim, sodales tempor lectus efficitur eget. Proin eleifend risus eu vestibulum consequat. Fusce ultrices egestas sem, vel semper metus. Nunc imperdiet dignissim ex, sit amet venenatis ante pharetra aliquam. Integer at ipsum ultricies, sagittis dolor non, accumsan massa. Proin euismod, felis id interdum lobortis, nunc massa efficitur metus, eget imperdiet neque dolor ac ante. Proin tempor lacus vitae mauris ullamcorper mattis. Sed tellus leo, eleifend accumsan placerat ac, lacinia in ligula. Pellentesque hendrerit in turpis vitae ullamcorper. Sed luctus, orci vitae sagittis lobortis, lacus eros sodales lorem, vel interdum tellus magna vel lacus. Nunc eget quam metus. Vivamus dictum lacus sed ex condimentum sagittis. Proin sit amet massa massa. Nunc luctus quis metus eget dignissim', '2017-10-03', 'browser', '2017-10-21', 'renanchagasw', '', 'renanchagasw', '2017-10-21', 3, 'clear', NULL),
(15, 'Project Sample2', 'Maecenas sollicitudin tellus et pellentesque semper. Quisque tortor neque, tempus et posuere sit amet, molestie blandit nisl. Cras vel mauris sed est finibus elementum ut eu est. Praesent egestas convallis velit, in aliquam ipsum imperdiet at. Nunc pellentesque erat sed tristique consequat. Pellentesque at ex varius, pellentesque ex quis, consequat quam. Fusce tempor aliquam lorem eu commodo. Nullam scelerisque sodales pretium. Proin nec lacinia enim. Integer malesuada risus vitae nibh congue, fringilla sodales lectus ultrices.', '2017-10-09', 'web', '2017-10-21', 'renanchagasw', 'teste', 'renanchagasw', '2017-10-22', 2, 'done_all', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `task`
--

CREATE TABLE `task` (
  `id` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `due_date` date DEFAULT NULL,
  `icon` varchar(100) NOT NULL,
  `state` bigint(20) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `finish_desc` text,
  `finish_user` varchar(30) DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  `hours` float DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `description` text,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  `hours_used` float DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `task`
--

INSERT INTO `task` (`id`, `type`, `due_date`, `icon`, `state`, `create_date`, `create_user`, `finish_desc`, `finish_user`, `finish_date`, `hours`, `name`, `description`, `PROJECT_ID`, `hours_used`, `USER_ID`) VALUES
(1, 1, '2017-10-23', 'test', 1, '2017-10-23', 'renanchagasw', NULL, NULL, NULL, 0, 'Interface', 'kalsdjalkjda', NULL, 0, NULL),
(2, 1, '2017-10-16', 'test', 1, '2017-10-23', 'renanchagasw', NULL, NULL, NULL, 0, 'Interface', 'askdjasklfjas', NULL, 0, NULL),
(22, 2, '2017-10-06', 'error', 2, '2017-10-25', 'renanchagasw', 'teste', 'renanchagasw', '2017-11-15', 0, 'adasdadsa', 'asdasd', 15, 10, NULL),
(23, 1, '2017-10-10', 'test', 1, '2017-10-25', 'renanchagasw', NULL, NULL, NULL, 7, 'ksjdakldjad', 'asdlkjadkljasdlkajdlkajd', 15, 0, NULL),
(24, 2, '2017-10-22', 'error', 1, '2017-10-25', 'renanchagasw', NULL, NULL, NULL, 8, 'dkasjdlkasjd', 'aslkdjasldjasld', 15, 0, NULL),
(26, 1, '2017-10-17', 'test', 4, '2017-10-25', 'renanchagasw', 'asdadadasdklajdaskldfj', 'renanchagasw', '2017-10-25', 1.7, 'alkdjakldja', 'alskdjalkdjasd', 15, 1.6, NULL),
(27, 1, '2017-11-22', 'test', 1, '2017-11-05', 'renanchagasw', NULL, NULL, NULL, 10, 'Testando titulo', 'akjdhaskjdhasjkdhaskjdhaskjdhasjkhd', 15, 0, NULL),
(28, 1, '2017-11-14', 'test', 1, '2017-11-05', 'renanchagasw', NULL, NULL, NULL, 11.5, 'Testando User', 'ksjhdaskjhsdaskjhdaksdhakhd', 15, 0, NULL),
(29, 1, '2017-11-27', 'test', 1, '2017-11-05', 'renanchagasw', NULL, NULL, NULL, 10, 'Teste', 'adasdasdas', 15, 0, NULL),
(30, 1, '2017-11-28', 'test', 1, '2017-11-05', 'renanchagasw', NULL, NULL, NULL, 10, 'Teste2', 'asdasdasd', 15, 0, NULL),
(31, 1, '2017-11-06', 'test', 1, '2017-11-05', 'renanchagasw', NULL, NULL, NULL, 10, 'adasdasd', 'asdasdasd', 15, 0, NULL),
(32, 1, '2017-11-22', 'test', 1, '2017-11-05', 'renanchagasw', NULL, NULL, NULL, 10, 'adasdasd', 'asdasdas', 15, 0, NULL),
(34, 1, '2017-11-22', 'test', 1, '2017-11-06', 'renanchagasw', NULL, NULL, NULL, 10, 'asdasdASD', 'asdasd', 15, 0, NULL),
(35, 1, '2017-11-21', 'test', 1, '2017-11-06', 'renanchagasw', NULL, NULL, NULL, 10, 'RERERERE', 'ERERERER', 15, 0, NULL),
(36, 1, '2017-11-20', 'test', 1, '2017-11-06', 'renanchagasw', NULL, NULL, NULL, 10, 'TEASDASDASD', 'ASDASDASD', 15, 0, 1),
(38, 1, '2017-11-06', 'test', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 10, 'tasdadasdasd', 'asdasdasdasd', 14, 0, 1),
(39, 1, '2017-11-02', 'test', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 10, 'asdasdasdas', 'asdasdasd', 14, 0, 1),
(40, 1, '2017-11-26', 'test', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 20, 'aksdashdakjhd', 'sakjdaskjdhaskjdha', 14, 0, 1),
(41, 1, '2017-11-06', 'test', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 25, 'lkasjdklasjdakls', 'asdasdasdasd', 14, 0, 1),
(42, 1, '2017-11-06', 'test', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 25, 'lkasjdklasjdakls', 'asdasdasdasd', 14, 0, 1),
(43, 1, '2017-11-13', 'test', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 2, 'eqewqewq', 'wqewqeqwe', 14, 0, 1),
(44, 2, '2017-11-06', 'error', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 15, 'kjashdaksjhda', 'asdkjasdh', 14, 0, 1),
(45, 2, '2017-11-06', 'error', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 15, 'kjashdaksjhda', 'asdkjasdh', 14, 0, 1),
(46, 2, '2017-11-23', 'error', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 20, 'aslkdjaskldj', 'lkasjdalkjdas', 14, 0, 1),
(47, 2, NULL, 'error', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 20, 'lkasjdlaskjd', 'askdjaskdjaslkd', 14, 0, 1),
(48, 2, '2017-11-06', 'error', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 1.1, 'assadas', 'kjashdajksdhasjkdhajkshda', 14, 0, 1),
(49, 2, '2017-11-14', 'error', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 19.7, 'klajskldjal', 'alsdjaldjaljdldjalasdasd', 14, 0, 1),
(50, 1, '2017-11-06', 'test', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 20, 'adasdasd', 'asdasd', 14, 0, 1),
(51, 1, '2017-11-06', 'test', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 20, 'adasdasd', 'asdasd', 14, 0, 1),
(52, 2, '2017-11-06', 'error', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 20, 'asdasdads', 'adasdasd', 14, 0, 1),
(53, 2, '2017-11-06', 'error', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 20, 'asdasdads', 'adasdasd', 14, 0, 1),
(54, 2, '2017-11-06', 'error', 1, '2017-11-15', 'renanchagasw', NULL, NULL, NULL, 20, 'asdasdads', 'adasdasd', 14, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `task_state`
--

CREATE TABLE `task_state` (
  `id` bigint(20) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `task_state`
--

INSERT INTO `task_state` (`id`, `type`) VALUES
(3, 'CANCELLED'),
(2, 'COMPLETED'),
(4, 'FAILED'),
(1, 'PENDING');

-- --------------------------------------------------------

--
-- Estrutura para tabela `task_type`
--

CREATE TABLE `task_type` (
  `id` bigint(20) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `task_type`
--

INSERT INTO `task_type` (`id`, `type`) VALUES
(2, 'BUG'),
(1, 'TEST');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_profile`
--

CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `user_profile`
--

INSERT INTO `user_profile` (`id`, `type`) VALUES
(2, 'Admin'),
(3, 'Manager'),
(1, 'User');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices de tabela `app_user_user_profile`
--
ALTER TABLE `app_user_user_profile`
  ADD PRIMARY KEY (`user_id`,`user_profile_id`),
  ADD KEY `FK_USER_PROFILE` (`user_profile_id`);

--
-- Índices de tabela `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_NOTIFICATION_TYPE_NOTIFICATION` (`TYPE`),
  ADD KEY `FK_TASK_NOTIFICATION` (`TASK_ID`),
  ADD KEY `FK_USER_NOTIFICATION` (`USER_ID`);

--
-- Índices de tabela `notification_type`
--
ALTER TABLE `notification_type`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `TYPE` (`TYPE`);

--
-- Índices de tabela `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_TASK_TYPE_TASK` (`type`),
  ADD KEY `FK_PROJECT_TASK` (`PROJECT_ID`),
  ADD KEY `FK_USER_TASK` (`USER_ID`);

--
-- Índices de tabela `task_state`
--
ALTER TABLE `task_state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Índices de tabela `task_type`
--
ALTER TABLE `task_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Índices de tabela `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `project`
--
ALTER TABLE `project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de tabela `task`
--
ALTER TABLE `task`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT de tabela `task_state`
--
ALTER TABLE `task_state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de tabela `task_type`
--
ALTER TABLE `task_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `app_user_user_profile`
--
ALTER TABLE `app_user_user_profile`
  ADD CONSTRAINT `FK_APP_USER` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  ADD CONSTRAINT `FK_USER_PROFILE` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`id`);

--
-- Restrições para tabelas `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FK_NOTIFICATION_TYPE_NOTIFICATION` FOREIGN KEY (`TYPE`) REFERENCES `notification_type` (`ID`),
  ADD CONSTRAINT `FK_TASK_NOTIFICATION` FOREIGN KEY (`TASK_ID`) REFERENCES `task` (`id`),
  ADD CONSTRAINT `FK_USER_NOTIFICATION` FOREIGN KEY (`USER_ID`) REFERENCES `app_user` (`id`);

--
-- Restrições para tabelas `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FK_PROJECT_TASK` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `FK_TASK_TYPE_TASK` FOREIGN KEY (`type`) REFERENCES `task_type` (`id`),
  ADD CONSTRAINT `FK_USER_TASK` FOREIGN KEY (`USER_ID`) REFERENCES `app_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
