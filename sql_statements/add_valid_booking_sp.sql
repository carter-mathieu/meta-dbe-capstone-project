CREATE PROCEDURE `AddValidBooking` (IN customernumber INT, IN tablenumber INT, IN bookingdate DATE, OUT message VARCHAR(255))
BEGIN
	START TRANSACTION;
    IF (SELECT bookings.table_id FROM bookings WHERE bookings.table_id = tablenumber AND CAST(bookings.date AS DATE) = bookingdate) THEN
		ROLLBACK;
        SELECT CONCAT('Table', ' ', tablenumber, ' ', 'is already booked - booking cancelled.') INTO message;
	ELSE
		INSERT INTO bookings (date, table_id, customer_id) VALUES (CAST(bookingdate AS DATE), tablenumber, customernumber);
		COMMIT;
        SELECT CONCAT('Table', ' ', tablenumber, ' ', 'is now booked at: ', ' ', bookingdate) INTO message;
	END IF;
END