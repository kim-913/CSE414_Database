SELECT DISTINCT C.name AS name
FROM Carriers AS C, Flights as F
WHERE C.cid = F.carrier_id
GROUP BY C.name, F.day_of_month
HAVING COUNT(C.name) > 1000;

--number of rows = 12