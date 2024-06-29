CREATE PROCEDURE `CancelBooking`(IN bookingnumber INT, OUT message VARCHAR(255))
BEGIN
	START TRANSACTION;
    IF (bookingnumber IN (SELECT bookings.booking_id FROM bookings WHERE bookings.booking_id)) THEN
		DELETE FROM bookings WHERE bookings.booking_id = bookingnumber;
        COMMIT;
        SELECT CONCAT('Booking ', bookingnumber, ' has been cancelled.') INTO message;
	ELSE
		ROLLBACK;
        SELECT CONCAT('No booking with booking number ', bookingnumber, ' exists - transaction cancelled.') INTO message;
	END IF;
END