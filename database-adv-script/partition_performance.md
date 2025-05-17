# Partition Performance Report

## Objective

Improve performance of queries on the large Booking table by partitioning based on `start_date`.

## Approach

We partitioned the `Booking` table by year using the `start_date` column and created individual partitions for 2023, 2024, and 2025.

## Query Tested

```sql
SELECT * FROM Booking WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
```
