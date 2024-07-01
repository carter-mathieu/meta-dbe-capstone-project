CREATE VIEW `menu_items_view` AS
SELECT
menu.cuisine AS MenuName
FROM menu
WHERE menu.menu_id = ANY
(SELECT orders.menu_id FROM orders GROUP BY orders.menu_id HAVING COUNT(orders.menu_id) > 2);
