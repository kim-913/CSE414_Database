SELECT DISTINCT F.dest_city AS city
FROM Flights AS F 
WHERE F.origin_city != 'Seattle WA' AND
F.dest_city NOT IN
(SELECT F2.dest_city
	FROM Flights AS F1, Flights AS F2
	WHERE F1.origin_city = 'Seattle WA' AND
		  F1.dest_city = F2.origin_city)
ORDER BY city ASC;

/*
Affected rows: 3
time: 30s
city
Devils Lake ND
Hattiesburg/Laurel MS
St. Augustine FL
*/