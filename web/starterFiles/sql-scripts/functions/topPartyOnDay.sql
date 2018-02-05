CREATE FUNCTION topPartyOnDay(dateIN DATE)
  RETURNS VARCHAR(10) DETERMINISTIC
  RETURN (SELECT party_shortcut
          FROM party_stats
          WHERE date = DATE(dateIN)
          ORDER BY party_stats.percent DESC
          LIMIT 1);


