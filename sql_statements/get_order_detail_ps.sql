PREPARE GetOrderDetail FROM 'SELECT orders.order_id AS OrderID, orders.quantity AS Quantity, orders.order_total AS Cost FROM orders WHERE orders.customer_id = ?';

-- SET @id = 1;
-- EXECUTE GetOrderDetail USING @id;