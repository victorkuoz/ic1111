-- 2. Find all characters that never visited any empire planets.

SELECT
	Name
FROM
	Characters
WHERE
	Name NOT IN (
		SELECT DISTINCT
			Character_Name
		FROM
			TimeTable
		WHERE
			Planet_Name IN (
			SELECT
				Name
			FROM
				Planets
			WHERE
				Affiliation='empire'
		)
	);
