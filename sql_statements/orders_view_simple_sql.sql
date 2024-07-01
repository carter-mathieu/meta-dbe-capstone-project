VIEW `simple_orders_view` AS
    SELECT 
        `orders`.`order_id` AS `OrderID`,
        `orders`.`quantity` AS `Quantity`,
        `orders`.`order_total` AS `Cost`
    FROM
        `orders`