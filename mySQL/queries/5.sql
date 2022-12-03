-- 5. Which planet(s) have not been visited by any characters in all movies?

SELECT
	Name
FROM
	Planets
WHERE	
	Name NOT IN (
		SELECT
			DISTINCT Planet_Name
		FROM
			TimeTable
	);

