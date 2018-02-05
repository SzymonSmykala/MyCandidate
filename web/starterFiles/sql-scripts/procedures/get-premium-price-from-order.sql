

DROP PROCEDURE IF EXISTS get_premium_price_from_order;
CREATE PROCEDURE get_premium_price_from_order(IN orderID INT, OUT price INT)
  BEGIN

    SET @p = (SELECT products.price FROM orders
    INNER JOIN products ON products.product_id = orders.product_id WHERE orders.order_id = orderID);
    SET price = @p;
  END;