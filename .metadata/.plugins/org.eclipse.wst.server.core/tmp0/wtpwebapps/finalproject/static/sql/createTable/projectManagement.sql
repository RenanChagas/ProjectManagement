create table PROJECT (
   id BIGINT NOT NULL AUTO_INCREMENT,
   project_name VARCHAR(20) NOT NULL,
   project_desc text NOT NULL,
   due_date date,
   icon varchar(100) NOT NULL,
   PRIMARY KEY (id)
);
