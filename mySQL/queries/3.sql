-- 3. Show the characters names and the total time they spent in each planet among the movies.

SELECT
	Tmp.Character_Name, Tmp.Planet_Name, SUM(Tmp.Time) AS TotalTime 
FROM (
	SELECT
		Character_Name, Planet_Name, (Time_of_Arrival + Time_of_Departure) AS Time
	FROM
		TimeTable) AS Tmp
GROUP BY
	Character_Name ,Planet_Name
ORDER BY
	Character_Name, Planet_Name;