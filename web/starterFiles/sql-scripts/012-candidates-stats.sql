CREATE TABLE `candidates-stats`
(
  date                  DATE            NOT NULL
    PRIMARY KEY,
  numberOfNewCandidates INT DEFAULT '0' NOT NULL
);
