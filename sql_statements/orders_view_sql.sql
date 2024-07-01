CREATE VIEW `orders_view` AS
SELECT
customers.customer_id AS CustomerID,
CONCAT(customers.first_name, ' ', customers.last_name) AS FullName,
orders.order_id AS OrderID,
orders.order_total AS Cost,
menu_items.item_name AS CourseName,
menu.cuisine AS MenuName
FROM 
((((customers
INNER JOIN orders ON customers.customer_id = orders.customer_id)
INNER JOIN menu ON orders.menu_id = menu.menu_id)
INNER JOIN menu_has_menu_items ON menu.menu_id = menu_has_menu_items.menu_menu_id)
INNER JOIN menu_items ON menu_has_menu_items.menu_items_menu_item_id = menu_items.menu_item_id)
WHERE orders.order_total > 50;