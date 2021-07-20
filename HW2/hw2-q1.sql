SELECT DISTINCT F.flight_num as flight_num
FROM Flights AS F, Carriers AS C, Weekdays AS W
WHERE F.carrier_id = C.cid AND F.day_of_week_id = W.did AND
    F.origin_city = 'Seattle WA' AND
    F.dest_city = 'Boston MA' AND
    W.day_of_week = 'Monday' AND
    C.name = 'Alaska Airlines Inc.';

--number of rows = 3