-- 10. Which planet(s) has been visited by more than three different characters?

-- SELECT
-- 	T.Planet_Name, COUNT(DISTINCT T.Character_Name) AS `Count`
-- FROM
-- 	TimeTable T
-- GROUP BY
-- 	T.Planet_Name

SELECT
	P.Planet_Name
FROM
	(SELECT
		T.Planet_Name, COUNT(DISTINCT T.Character_Name) AS `Count`
	FROM
		TimeTable T
	GROUP BY
		T.Planet_Name ) AS P
Where
	P.Count>3
ORDER BY
	P.Planet_Name;