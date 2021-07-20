SELECT DISTINCT C.name AS carrier
FROM Carriers AS C, Flights AS F
WHERE F.carrier_id = C.cid 
AND F.carrier_id IN 
(SELECT F1.carrier_id
	FROM Flights AS F1
	WHERE F1.origin_city = 'Seattle WA' AND
	F1.dest_city = 'San Francisco CA')
ORDER BY carrier;

/*
Affected rows: 4
time: 12s
carrier
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/