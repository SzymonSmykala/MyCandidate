create table users
(
	user_id int not null auto_increment
		primary key,
	email varchar(45) not null,
	password varchar(45) not null,
	first_name varchar(45) null,
	last_name varchar(45) null,
	role varchar(45) default 'user' not null
)
;

