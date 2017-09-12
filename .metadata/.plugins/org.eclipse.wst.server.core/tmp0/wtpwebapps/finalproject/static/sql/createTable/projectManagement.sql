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


create table TASK_STATE(
   id BIGINT NOT NULL AUTO_INCREMENT,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);