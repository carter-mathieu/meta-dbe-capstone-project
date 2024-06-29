INSERT INTO little_lemon_db.customers VALUES
(1, 'Shinji', 'Ikari', 'shinji.ikari@example.com', 123456789),
(2, 'Rei', 'Ayanami', 'rei.ayanami@example.com', 234567890),
(3,'Asuka', 'Langley', 'asuka.langley@example.com', 345678901),
(4, 'Misato', 'Katsuragi', 'misato.katsuragi@example.com', 456789012),
(5, 'Ritsuko', 'Akagi', 'ritsuko.akagi@example.com', 567890123),
(6, 'Gendo', 'Ikari', 'gendo.ikari@example.com', 678901234),
(7, 'Kaworu', 'Nagisa', 'kaworu.nagisa@example.com', 789012345),
(8, 'Toji', 'Suzuhara', 'toji.suzuhara@example.com', 890123456),
(9, 'Kensuke', 'Aida', 'kensuke.aida@example.com', 901234567),
(10, 'Hikari', 'Horaki', 'hikari.horaki@example.com', 123456780);

INSERT INTO little_lemon_db.salary VALUES
(1, 60000),
(2, 80000),
(3, 85000),
(4, 50000),
(5, 87000),
(6, 90000);

INSERT INTO little_lemon_db.staff VALUES
(1, 'Edward', 'Elric', 'Alchemist', 1),
(2, 'Alphonse', 'Elric', 'Alchemist', 1),
(3, 'Roy', 'Mustang', 'Colonel', 2),
(4, 'Riza', 'Hawkeye', 'Lieutenant', 3),
(5, 'Winry', 'Rockbell', 'Mechanic', 4),
(6, 'Maes', 'Hughes', 'Lieutenant Colonel', 5),
(7, 'Alex', 'Armstrong', 'Major', 6);

INSERT INTO little_lemon_db.booking_tables VALUES 
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 3),
(6, 4),
(7, 5),
(8, 6),
(9, 6),
(10, 7);

INSERT INTO little_lemon_db.bookings VALUES
(1, '2024-07-01 18:30:00', 1, 1),
(2, '2024-07-01 19:00:00', 2, 2),
(3,'2024-07-02 12:00:00', 3, 3),
(4, '2024-07-02 12:30:00', 4, 4),
(5, '2024-07-03 18:00:00', 5, 5),
(6, '2024-07-03 18:30:00', 6, 6),
(7, '2024-07-04 19:00:00', 7, 7),
(8, '2024-07-04 19:30:00', 8, 8),
(9, '2024-07-05 20:00:00', 9, 9),
(10, '2024-07-05 20:30:00', 10, 10);

INSERT INTO little_lemon_db.order_status VALUES
(1, 'Recieved'),
(2, 'In Progress'),
(3, 'Completed');

INSERT INTO little_lemon_db.menu VALUES
(1, 'Italian', 'Starter'),
(2, 'French', 'Course'),
(3, 'Japanese', 'Dessert'),
(4, 'Mexican', 'Drink'),
(5, 'Greek', 'Starter'),
(6, 'Indian', 'Course'),
(7, 'Chinese', 'Dessert'),
(8, 'Spanish', 'Drink'),
(9, 'Thai', 'Starter'),
(10, 'American', 'Course'),
(11, 'Korean', 'Dessert'),
(12, 'Vietnamese', 'Drink'),
(13, 'Turkish', 'Starter'),
(14, 'Lebanese', 'Course'),
(15, 'Brazilian', 'Dessert');

INSERT INTO little_lemon_db.menu_items  VALUES
-- Italian Starters
(1, 'Bruschetta', 6.99),
(2, 'Caprese Salad', 7.99),

-- French Courses
(3, 'Coq au Vin', 18.99),
(4, 'Bouillabaisse', 19.99),

-- Japanese Desserts
(5, 'Mochi', 4.99),
(6, 'Dorayaki', 5.99),

-- Mexican Drinks
(7, 'Margarita', 8.99),
(8, 'Horchata', 3.99),

-- Greek Starters
(9, 'Tzatziki with Pita', 5.99),
(10, 'Spanakopita', 6.99),

-- Indian Courses
(11, 'Butter Chicken', 14.99),
(12, 'Paneer Tikka', 12.99),

-- Chinese Desserts
(13, 'Mango Pudding', 4.99),
(14, 'Egg Tart', 3.99),

-- Spanish Drinks
(15, 'Sangria', 7.99),
(16, 'Horchata de Chufa', 4.99),

-- Thai Starters
(17, 'Spring Rolls', 5.99),
(18, 'Tom Yum Soup', 6.99),

-- American Courses
(19, 'BBQ Ribs', 16.99),
(20, 'Mac and Cheese', 10.99),

-- Korean Desserts
(21, 'Hotteok', 4.99),
(22, 'Bingsu', 6.99),

-- Vietnamese Drinks
(23, 'Vietnamese Iced Coffee', 3.99),
(24, 'Sugarcane Juice', 4.99),

-- Turkish Starters
(25, 'Hummus with Pita', 5.99),
(26, 'Sigara Borek', 6.99),

-- Lebanese Courses
(27, 'Shawarma', 12.99),
(28, 'Kibbeh', 13.99),

-- Brazilian Desserts
(29, 'Brigadeiro', 3.99),
(30, 'Quindim', 4.99);

INSERT INTO little_lemon_db.menu_has_menu_items VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16),
(9, 17),
(9, 18),
(10, 19),
(10, 20),
(11, 21),
(11, 22),
(12, 23),
(12, 24),
(13, 25),
(13, 26),
(14, 27),
(14, 28),
(15, 29),
(15, 30);

INSERT INTO little_lemon_db.orders VALUES
(1, '2024-07-01 12:00:00', 2, 13.98, 1, 1, 1),
(2, '2024-07-01 12:30:00', 1, 7.99, 2, 2, 2),
(3, '2024-07-01 13:00:00', 3, 56.97, 1, 3, 3),
(4, '2024-07-01 13:30:00', 2, 39.98, 3, 4, 4),
(5, '2024-07-01 14:00:00', 1, 4.99, 1, 5, 5),
(6, '2024-07-01 14:30:00', 2, 11.98, 2, 6, 6),
(7, '2024-07-01 15:00:00', 1, 8.99, 3, 7, 7),
(8, '2024-07-01 15:30:00', 3, 11.97, 1, 8, 8),
(9, '2024-07-01 16:00:00', 2, 11.98, 2, 9, 9),
(10, '2024-07-01 16:30:00', 1, 6.99, 3, 10, 10),
(11, '2024-07-01 17:00:00', 2, 29.98, 1, 11, 1),
(12, '2024-07-01 17:30:00', 1, 12.99, 2, 12, 2),
(13, '2024-07-01 18:00:00', 3, 14.97, 3, 13, 3),
(14, '2024-07-01 18:30:00', 2, 7.98, 1, 14, 4),
(15, '2024-07-01 19:00:00', 1, 7.99, 2, 15, 5),
(16, '2024-07-01 19:30:00', 2, 13.98, 3, 6, 6),
(17, '2024-07-01 20:00:00', 1, 5.99, 1, 7, 7),
(18, '2024-07-01 20:30:00', 3, 20.97, 2, 8, 8),
(19, '2024-07-01 21:00:00', 2, 33.98, 3, 9, 9),
(20, '2024-07-01 21:30:00', 1, 10.99, 1, 2, 10);




