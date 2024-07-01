CREATE PROCEDURE `AddBooking`(IN bookingnumber INT, IN bookingdate DATE, IN tablenumber INT, IN customernumber INT, OUT message VARCHAR(255))
BEGIN
	START TRANSACTION;
    IF (bookingnumber IN (SELECT bookings.booking_id FROM bookings) OR (SELECT bookings.table_id FROM bookings WHERE bookings.table_id = tablenumber AND CAST(bookings.date AS DATE) = bookingdate)) THEN
		ROLLBACK;
        SELECT CONCAT('Table', ' ', tablenumber, ' ', 'table is already booked - booking cancelled.') INTO message;
	ELSE
		INSERT INTO bookings (date, table_id, customer_id) VALUES (CAST(bookingdate AS DATE), tablenumber, customernumber);
		COMMIT;
        SELECT CONCAT('Table', ' ', tablenumber, ' ', 'is now booked at: ', ' ', bookingdate) INTO message;
	END IF;
END