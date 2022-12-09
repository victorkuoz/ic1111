-- 2. Find all characters that never visited any empire planets.

SELECT
	C.Name
FROM
	Characters C
WHERE
	C.Name NOT IN (
		SELECT DISTINCT
			T.Character_Name
		FROM
			TimeTable T
		WHERE
			T.Planet_Name IN (
			SELECT
				P.Name
			FROM
				Planets P
			WHERE
				P.Affiliation='empire'
		)
	);
