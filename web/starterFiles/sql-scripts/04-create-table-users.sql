CREATE TABLE users
(
	user_id    INT AUTO_INCREMENT
		PRIMARY KEY,
	email      VARCHAR(45)                NULL,
	password   VARCHAR(45)                NULL,
	first_name VARCHAR(45)                NULL,
	last_name  VARCHAR(45)                NULL,
	role       VARCHAR(45) DEFAULT 'USER' NOT NULL
);
