SELECT DISTINCT F1.origin_city AS origin_city, F1.dest_city AS dest_city, MAX(F2.actual_time) AS time
FROM Flights AS F1, Flights AS F2
WHERE F1.origin_city = F2.origin_city
GROUP BY F1.origin_city, F1.dest_city, F1.actual_time
HAVING F1.actual_time = MAX(F2.actual_time)
ORDER BY F1.origin_city, F1.dest_city ASC;

/*rows returned: 334
time: 37s
origin_city	dest_city	time
Aberdeen SD	Minneapolis MN	106
Abilene TX	Dallas/Fort Worth TX	111
Adak Island AK	Anchorage AK	471
Aguadilla PR	New York NY	368
Akron OH	Atlanta GA	408
Albany GA	Atlanta GA	243
Albany NY	Atlanta GA	390
Albuquerque NM	Houston TX	492
Alexandria LA	Atlanta GA	391
Allentown/Bethlehem/Easton PA	Atlanta GA	456
Alpena MI	Detroit MI	80
Amarillo TX	Houston TX	390
Anchorage AK	Barrow AK	490
Appleton WI	Atlanta GA	405
Arcata/Eureka CA	San Francisco CA	476
Asheville NC	Chicago IL	279
Ashland WV	Cincinnati OH	84
Aspen CO	Los Angeles CA	304
Atlanta GA	Honolulu HI	649
Atlantic City NJ	Fort Lauderdale FL	212 */