CREATE TABLE parties
(
  party_shorcut VARCHAR(45)   NOT NULL
    PRIMARY KEY,
  full_name     VARCHAR(45)   NOT NULL,
  description   VARCHAR(2000) NULL,
  website       VARCHAR(200)  NULL
);
