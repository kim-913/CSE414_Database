SELECT DISTINCT C.name AS carrier
FROM Carriers AS C, Flights AS F1
WHERE C.cid = F1.carrier_id AND
F1.origin_city = 'Seattle WA' AND
F1.dest_city = 'San Francisco CA'
ORDER BY carrier;

/*
Affected rows: 4
time: 7s
carrier
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
/*