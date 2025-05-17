-- Initial query to get all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' AND b.start_date >= CURRENT_DATE;




EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;


-- Sample Query to Analyze
SELECT 
    b.booking_id, b.start_date, b.end_date,
    u.first_name, u.last_name,
    p.name AS property_name, p.location
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2025-01-01' AND '2025-12-31'
AND p.location = 'Addis Ababa';


EXPLAIN ANALYZE
SELECT 
    b.booking_id, b.start_date, b.end_date,
    u.first_name, u.last_name,
    p.name AS property_name, p.location
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2025-01-01' AND '2025-12-31'
AND p.location = 'Addis Ababa';


-- Index to improve filter on location
CREATE INDEX idx_property_location ON Property(location);

-- Index to improve date filtering in Booking
CREATE INDEX idx_booking_start_date ON Booking(start_date);
