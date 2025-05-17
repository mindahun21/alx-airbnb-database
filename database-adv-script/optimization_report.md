# Optimization Report

## Initial Query

The query joined four tables: Booking, User, Property, and Payment using INNER and LEFT JOINs.

## Performance Analysis (using EXPLAIN ANALYZE)

- The Booking table was using an Index Scan due to `idx_booking_user` and `idx_booking_property`.
- The JOINs to User and Property also used indexes efficiently.
- However, the LEFT JOIN to Payment occasionally triggered a Seq Scan depending on data volume.

## Refactor Suggestions

- Ensure `idx_payment_booking` exists to optimize the join with Payment.
- If most bookings always have payments, consider converting LEFT JOIN to INNER JOIN.
- Limit columns to only required fields to reduce I/O.

## Optimized Query

```sql
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
```
