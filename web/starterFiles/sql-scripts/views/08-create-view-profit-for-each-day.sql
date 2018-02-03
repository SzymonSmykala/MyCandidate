DROP VIEW IF EXISTS profit_for_each_day;
CREATE VIEW profit_for_each_day AS (


  SELECT O.order_date as Day , sum(P.price) as ProfitPerDay FROM orders as O
  INNER JOIN products AS P ON O.product_id = P.product_id
  GROUP BY order_date

)