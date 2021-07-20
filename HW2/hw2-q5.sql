SELECT C.name AS name, SUM(F.canceled) * 100.0 / COUNT(*) AS percentage
FROM Flights AS F, Carriers AS C
WHERE F.origin_city = "Seattle WA" AND F.carrier_id = C.cid
GROUP BY C.name
HAVING SUM(F.canceled) * 1000/ COUNT(*) > 5
ORDER BY percentage;

--number of rows = 6