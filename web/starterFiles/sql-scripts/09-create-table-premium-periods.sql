CREATE TABLE premium_periods
(
  user_id    INT  NOT NULL,
  begin_date DATE NOT NULL,
  end_date   DATE NOT NULL,
  price      INT  NULL,
  CONSTRAINT premium_periods_users_user_id_fk
  FOREIGN KEY (user_id) REFERENCES users (user_id)
);
CREATE INDEX premium_periods_users_user_id_fk
  ON premium_periods (user_id);
