-- 6. For each movie, which character(s) visited the highest number of planets?

-- SELECT
-- 	T.Character_Name, T.Movie
-- FROM
-- 		TimeTable T
-- GROUP BY 
-- 	T.Character_Name, T.Planet_Name, T.Movie
-- ORDER BY
-- 	T.Movie, T.Character_Name

-- SELECT
-- 	Tmp.Character_Name, COUNT(*) AS Planet_Num, Tmp.Movie
-- FROM
-- 	(
-- 		SELECT
-- 			T.Character_Name, T.Movie
-- 		FROM
-- 				TimeTable T
-- 		GROUP BY 
-- 			T.Character_Name, T.Planet_Name, T.Movie
-- 		ORDER BY
-- 			T.Movie, T.Character_Name
-- 	) AS Tmp
-- GROUP BY
-- 	Tmp.Character_Name, Tmp.Movie
-- ORDER BY
-- 	Tmp.Movie, Planet_Num

SELECT 
	Cur.Character_Name, Cur.Planet_Num, Cur.Movie
FROM
	(
		SELECT
			Tmp.Character_Name, COUNT(*) AS Planet_Num, Tmp.Movie
		FROM
			(
				SELECT
					T.Character_Name, T.Movie
				FROM
						TimeTable T
				GROUP BY 
					T.Character_Name, T.Planet_Name, T.Movie
				ORDER BY
					T.Movie, T.Character_Name
			) AS Tmp
		GROUP BY
			Tmp.Character_Name, Tmp.Movie
		ORDER BY
			Tmp.Movie, Planet_Num
	) AS Cur
WHERE
	Cur.Planet_Num = (
		SELECT
			MAX(Prev.Planet_Num)
		FROM
			(
				SELECT
					Tmp.Character_Name, COUNT(*) AS Planet_Num, Tmp.Movie
				FROM
					(
						SELECT
							T.Character_Name, T.Movie
						FROM
								TimeTable T
						GROUP BY 
							T.Character_Name, T.Planet_Name, T.Movie
						ORDER BY
							T.Movie, T.Character_Name
					) AS Tmp
				GROUP BY
					Tmp.Character_Name, Tmp.Movie
				ORDER BY
					Tmp.Movie, Planet_Num
			) AS Prev
		WHERE
			Prev.Movie = Cur.Movie
	)
ORDER BY
	Cur.Movie