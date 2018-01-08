CREATE TABLE products
(
  product_id   INT AUTO_INCREMENT
    PRIMARY KEY,
  product_name VARCHAR(45)   NOT NULL,
  price        INT           NOT NULL,
  period       INT           NULL,
  description  VARCHAR(2000) NULL
);
