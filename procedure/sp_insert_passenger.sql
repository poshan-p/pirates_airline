CREATE PROCEDURE sp_insert_passenger @passenger_id INTEGER OUTPUT,
                                     @first_name VARCHAR(40),
                                     @last_name VARCHAR(40),
                                     @dob DATE,
                                     @address VARCHAR(40),
                                     @gender CHAR,
                                     @passport_number VARCHAR(15),
                                     @phone_number VARCHAR(15),
                                     @email VARCHAR(40)
AS
BEGIN
    DECLARE @max AS INTEGER;
    SELECT @max = MAX(passenger_id) FROM passenger GROUP BY passenger_id;
    IF @@ROWCOUNT = 0
        BEGIN
            INSERT INTO passenger
            VALUES (1, @first_name, @last_name, @dob, @address, @gender,
                    @passport_number, @phone_number, @email);
        END
    ELSE
        BEGIN
            INSERT INTO passenger
            VALUES (@max + 1, @first_name, @last_name, @dob, @address, @gender,
                    @passport_number, @phone_number, @email);
        END
    SET @passenger_id = @max + 1;
END