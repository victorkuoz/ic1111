-- 10. Which planet(s) has been visited by more than three different characters?

SELECT
	Planet
FROM
	(SELECT
		COUNT(DISTINCT Character_Name) AS Cnt, Planet_Name AS Planet
	FROM
		TimeTable
	GROUP BY
		Planet_Name) AS Tmp
Where
	Cnt>3
ORDER BY
	Cnt;
