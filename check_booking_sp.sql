CREATE PROCEDURE `CheckBooking`(IN bookingdate DATE, IN tablenumber INT, OUT booking_status VARCHAR(255))
BEGIN
	IF (SELECT bookings.table_id FROM bookings WHERE bookings.table_id = tablenumber AND CAST(bookings.date AS DATE) = bookingdate) THEN
		SELECT CONCAT('Table', ' ', tablenumber, ' ', 'is already booked.') INTO booking_status;
    ELSE
		SELECT CONCAT('Table', ' ', tablenumber, ' ', 'is available.') INTO booking_status;
    END IF;
END