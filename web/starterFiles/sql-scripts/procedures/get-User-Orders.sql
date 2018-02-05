DROP PROCEDURE IF EXISTS getUserOrders;
CREATE PROCEDURE getUserOrders(userID INT)
  BEGIN
    SELECT * FROM orders WHERE orders.user_id=userID;
  END;