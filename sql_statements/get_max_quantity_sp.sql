CREATE PROCEDURE `GetMaxQuantity` ()
BEGIN
SELECT MAX(orders.quantity) AS "Max Quantity in Order" FROM orders;
END
