-- Insert sample users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('u-45a8b321', 'Eden', 'Tekle', 'eden.t@example.com', 'secure_pw1', '251911111111', 'guest'),
('u-13f9c9dd', 'Daniel', 'Mekonnen', 'daniel.m@example.com', 'secure_pw2', '251922222222', 'host'),
('u-5ff1a29e', 'Lily', 'Thomas', 'lily.t@example.com', 'secure_pw3', '251933333333', 'admin');

-- Insert sample properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES 
('p-91f4e3c1', 'u-13f9c9dd', 'Modern Loft', 'Stylish loft with a rooftop view in downtown.', 'Addis Ababa', 90.00),
('p-04db2af0', 'u-13f9c9dd', 'Lake House', 'Peaceful lakefront property with beautiful scenery.', 'Hawassa', 120.00);

-- Insert sample bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
('b-7e02d311', 'p-91f4e3c1', 'u-45a8b321', '2025-08-15', '2025-08-18', 270.00, 'confirmed'),
('b-3bc4e872', 'p-04db2af0', 'u-45a8b321', '2025-09-01', '2025-09-03', 240.00, 'pending');

-- Insert sample payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES 
('pay-a1c39812', 'b-7e02d311', 270.00, 'stripe'),
('pay-b7f901ae', 'b-3bc4e872', 240.00, 'credit_card');

-- Insert sample reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES 
('r-e2f93a75', 'p-91f4e3c1', 'u-45a8b321', 5, 'Fantastic loft, loved the rooftop view!'),
('r-cb1d2a47', 'p-04db2af0', 'u-45a8b321', 4, 'Great location by the lake, very relaxing stay.');

-- Insert sample messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES 
('m-8921ecad', 'u-45a8b321', 'u-13f9c9dd', 'Hi, is the Lake House pet-friendly?'),
('m-ae5f79bc', 'u-13f9c9dd', 'u-45a8b321', 'Yes, pets are welcome! Just let me know in advance.');
