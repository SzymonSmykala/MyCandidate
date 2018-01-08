CREATE TABLE parties
(
  party_shorcut VARCHAR(45) PRIMARY KEY NOT NULL,
  full_name VARCHAR(45) NOT NULL,
  description VARCHAR(2000),
  website VARCHAR(200)
);
CREATE UNIQUE INDEX parties_party_shorcut_uindex ON parties (party_shortcut);