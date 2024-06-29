CREATE PROCEDURE `UpdateBooking`(IN bookingnumber INT, IN bookingdate DATE, OUT message VARCHAR(255))
BEGIN
	START TRANSACTION;
    IF (bookingnumber IN (SELECT bookings.booking_id FROM bookings)) THEN
		UPDATE bookings SET bookings.date = bookingdate WHERE bookings.booking_id = bookingnumber;
        COMMIT;
        SELECT CONCAT('Booking with number ', bookingnumber, ' has been updated to ', bookingdate) INTO message;
	ELSE
		ROLLBACK;
        SELECT CONCAT('No booking with number ', bookingnumber, ' exists - update cancelled.') INTO message;
	END IF;
END