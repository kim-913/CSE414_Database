SELECT SUM(F.capacity) AS capacity
FROM Flights AS F
WHERE F.month_id = 7 AND
    F.day_of_month = 10 AND
    ((F.dest_city = "San Francisco CA" AND F.origin_city = "Seattle WA") OR
    (F.dest_city = "Seattle WA" AND F.origin_city = "San Francisco CA"));

    --number of rows = 1