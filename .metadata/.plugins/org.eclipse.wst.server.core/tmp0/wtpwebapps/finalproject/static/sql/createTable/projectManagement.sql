create table PROJECT (
   id BIGINT NOT NULL AUTO_INCREMENT,
   project_name VARCHAR(20) NOT NULL,
   project_desc text NOT NULL,
   due_date date,
   icon varchar(100) NOT NULL,
   PRIMARY KEY (id)
);

alter table PROJECT
add column create_date date,
add column create_user VARCHAR(30)

alter table PROJECT
add column finish_desc text,
add column finish_user VARCHAR(30),
add column finish_date date,
add column finish_state BIGINT

alter table PROJECT
add column state_icon varchar(100)


create table TASK_STATE(
   id BIGINT NOT NULL AUTO_INCREMENT,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);


create table TASK_TYPE(
	id BIGINT NOT NULL AUTO_INCREMENT,
	type VARCHAR(30) NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (type) 
);

create table TASK(
	id BIGINT NOT NULL AUTO_INCREMENT,
	type BIGINT NOT NULL,
	due_date date,
	icon varchar(100) NOT NULL,
	state BIGINT,
	create_date date,
	create_user VARCHAR(30),
	finish_desc text,
	finish_user VARCHAR(30),
	finish_date date,
	hours float,
	CONSTRAINT `FK_TASK_TYPE_TASK` FOREIGN KEY (`type`) REFERENCES `TASK_TYPE` (`id`),
	PRIMARY KEY (id)
);

alter table TASK
add column hours float

/* JOIN TABLE for MANY-TO-MANY relationship*/
CREATE TABLE PROJECT_TASK (
    project_id BIGINT NOT NULL,
    task_id BIGINT NOT NULL,
    PRIMARY KEY (project_id, task_id),
    CONSTRAINT FK_PROJECT FOREIGN KEY (project_id) REFERENCES PROJECT (id),
    CONSTRAINT FK_TASK FOREIGN KEY (task_id) REFERENCES TASK (id)
);

alter table TASK
add column name VARCHAR(20) NOT NULL

alter table TASK
add column desc text

alter table TASK
add column hours_used float


CREATE TABLE `NOTIFICATION` (
  `ID` BIGINT(20) NOT NULL,
  `DESC` TEXT,
  `FL_READ` BOOLEAN,
  `TYPE` BIGINT(20) DEFAULT NULL,
  `TASK_ID` BIGINT(20) DEFAULT NULL
)


CREATE TABLE `NOTIFICATION` (
  `ID` BIGINT(20) NOT NULL,
  `DESC` TEXT,
  `FL_READ` BOOLEAN,
  `TYPE` BIGINT(20) DEFAULT NULL,
  `TASK_ID` BIGINT(20) DEFAULT NULL, 
  CONSTRAINT `FK_NOTIFICATION_TYPE_NOTIFICATION` FOREIGN KEY (`type`) REFERENCES `NOTIFICATION_TYPE` (`id`),
  CONSTRAINT `FK_TASK_NOTIFICATION` FOREIGN KEY (`TASK_ID`) REFERENCES `TASK` (`id`),
  PRIMARY KEY (id)
)

CREATE TABLE NOTIFICATION_TYPE (
  ID BIGINT NOT NULL AUTO_INCREMENT,
  TYPE VARCHAR(30) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (TYPE) 
);

Alter table TASK
add column USER_ID BIGINT

ALTER TABLE `task`
ADD KEY `FK_USER_TASK` (`USER_ID`);

ALTER TABLE `task`
  ADD CONSTRAINT `FK_USER_TASK` FOREIGN KEY (`USER_ID`) REFERENCES `APP_USER` (`id`)

