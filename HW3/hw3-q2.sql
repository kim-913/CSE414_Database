SELECT DISTINCT F1.origin_city AS city 
FROM Flights AS F1, Flights AS F2
WHERE F1.origin_city = F2.origin_city AND
F1.actual_time < 180
GROUP BY F1.origin_city, F1.actual_time
HAVING F1.actual_time = MAX(F2.actual_time)
ORDER BY city ASC;

/*
Affected rows:109
time: 15s
city
Aberdeen SD
Abilene TX
Alpena MI
Ashland WV
Augusta GA
Barrow AK
Beaumont/Port Arthur TX
Bemidji MN
Bethel AK
Binghamton NY
Brainerd MN
Bristol/Johnson City/Kingsport TN
Butte MT
Carlsbad CA
Casper WY
Cedar City UT
Chico CA
College Station/Bryan TX
Columbia MO
Columbus GA
*/