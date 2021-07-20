SELECT W.day_of_week AS day_of_week,
    AVG(F.arrival_delay) AS delay
FROM Flights AS F, Weekdays AS W
WHERE F.day_of_week_id = W.did
GROUP BY W.day_of_week
ORDER BY AVG(F.arrival_delay) DESC
LIMIT 1;

--number of rows = 1