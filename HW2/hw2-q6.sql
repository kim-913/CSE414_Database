SELECT MAX(F.price) AS max_price, C.name AS carriers
FROM Flights AS F, Carriers AS C
WHERE F.carrier_id = C.cid AND
    (F.origin_city = 'Seattle WA'
    OR F.origin_city = 'New York NY') AND
    (F.dest_city = 'Seattle WA' OR
    F.dest_city = 'New York NY')
GROUP BY C.cid;

--number of rows = 3