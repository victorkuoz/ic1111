-- 5. Which planet(s) have not been visited by any characters in all movies?

SELECT
	P.Name
FROM
	Planets P
WHERE	
	P.Name NOT IN (
		SELECT
			DISTINCT T.Planet_Name
		FROM
			TimeTable T
	);