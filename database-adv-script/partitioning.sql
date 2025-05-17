-- Step 1: Drop original table 
DROP TABLE IF EXISTS Booking CASCADE;

-- Step 2: Create the parent partitioned table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (e.g., by year)
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: Add indexes on partitions 
CREATE INDEX idx_booking_2023_user_id ON Booking_2023(user_id);
CREATE INDEX idx_booking_2024_user_id ON Booking_2024(user_id);
CREATE INDEX idx_booking_2025_user_id ON Booking_2025(user_id);
