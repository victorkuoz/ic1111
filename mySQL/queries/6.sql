-- 6. For each movie, which character(s) visited the highest number of planets?

-- SELECT
-- 	T.Character_Name, COUNT(DISTINCT T.Planet_Name) AS Planet_Num, T.Movie
-- FROM
-- 	TimeTable T
-- GROUP BY
-- 	T.Character_Name, T.Movie
-- ORDER BY
-- 	T.Movie, T.Character_Name;

-- SELECT
-- 	MAX(Tmp.Planet_Num), Tmp.Movie
-- FROM
-- 	(SELECT
-- 		T.Character_Name, COUNT(DISTINCT T.Planet_Name) AS Planet_Num, T.Movie
-- 	FROM
-- 		TimeTable T
-- 	GROUP BY
-- 		T.Character_Name, T.Movie
-- 	ORDER BY
-- 		T.Movie, T.Character_Name) AS Tmp
-- GROUP BY
-- 	Tmp.Movie;

SELECT
	GROUP_CONCAT(K.Character_Name SEPARATOR ', ') AS Character_Names, K.Movie
FROM
	(SELECT
		T.Character_Name, COUNT(DISTINCT T.Planet_Name) AS Planet_Num, T.Movie
	FROM
		TimeTable T
	GROUP BY
		T.Character_Name, T.Movie
	ORDER BY
		T.Movie, T.Character_Name) AS K
WHERE
	K.Planet_Num = (
	SELECT
		MAX(Tmp.Planet_Num)
	FROM
		(SELECT
			T.Character_Name, COUNT(DISTINCT T.Planet_Name) AS Planet_Num, T.Movie
		FROM
			TimeTable T
		GROUP BY
			T.Character_Name, T.Movie
		ORDER BY
			T.Movie, T.Character_Name) AS Tmp
	WHERE
		Tmp.Movie = K.Movie
	)
GROUP BY
	K.Movie;