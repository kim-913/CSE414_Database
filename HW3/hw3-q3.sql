SELECT DISTINCT F1.origin_city AS origin_city, 
(SELECT COUNT(F2.origin_city)*100.0 / COUNT(F1.origin_city)
	FROM Flights AS F2
    WHERE F2.actual_time < 180 AND
          F2.origin_city = F1.origin_city AND
          F2.canceled = 0) AS percentage
FROM Flights AS F1
GROUP BY F1.origin_city
ORDER BY percentage, origin_city ASC;

/*
Affected rows: 327
time: 12s
origin_city		percentage
Guam TT			0.000000000000
Pago Pago TT	0.000000000000
Aguadilla PR	28.679245283018
Anchorage AK	31.656277827248
San Juan PR		33.543916853474
Charlotte Amalie VI	39.270072992700
Ponce PR		40.322580645161
Fairbanks AK	49.539170506912
Kahului HI		53.341183397115
Honolulu HI		54.533695511576
San Francisco CA	55.223708487084
Los Angeles CA	55.412788344799
Seattle WA		57.410932825673
New York NY		60.532437322305
Long Beach CA	61.719979024646
Kona HI			62.952799121844
Newark NJ		63.367565254599
Plattsburgh NY	64.000000000000
Las Vegas NV	64.471006179920
Christiansted VI	64.666666666666
*/