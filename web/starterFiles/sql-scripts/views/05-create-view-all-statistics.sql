DROP VIEW IF EXISTS allStatistics;
CREATE VIEW allStatistics
  AS
    (SELECT
       stats.date AS DateOne,
       stats.numberofanswers,
       `candidates-stats`.numberOfNewCandidates
     FROM stats
       LEFT JOIN `candidates-stats` ON stats.date = `candidates-stats`.date)
    UNION
    (SELECT
       `candidates-stats`.date AS DateOne,
       stats.numberofanswers,
       `candidates-stats`.numberOfNewCandidates
     FROM stats
       RIGHT JOIN `candidates-stats` ON stats.date = `candidates-stats`.date)


