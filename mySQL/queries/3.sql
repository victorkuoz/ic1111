-- 3. Show the characters names and the total time they spent in each planet among the movies.

SELECT
	T.Character_Name, T.Planet_Name, SUM(T.Time_of_Departure - T.Time_of_Arrival) AS TotalTime 
FROM 
	TimeTable T
GROUP BY
	T.Character_Name, T.Planet_Name;