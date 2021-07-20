SELECT SUM(F.departure_delay) as delay, C.name AS name
FROM Flights AS F, Carriers AS C
WHERE F.carrier_id = C.cid
GROUP BY C.name;

--number of rows = 22