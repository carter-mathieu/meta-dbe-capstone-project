CREATE PROCEDURE `CancelOrder`(IN orderid INT, OUT return_value VARCHAR(255))
BEGIN
	IF (orderid IN (SELECT orders.order_id FROM orders)) THEN
		DELETE FROM orders WHERE orders.order_id = orderid;
        SELECT CONCAT('Order', ' ', orderid, ' ', 'is cancelled') INTO return_value;
	ELSE
		SELECT CONCAT('Order', ' ', orderid, ' ', 'does not exist') INTO return_value ;
    END IF;
END