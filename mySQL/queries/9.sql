-- 9. For each race, find the character that travels the most (number of time slots) in each movie. (movie, race, character_name)

-- SELECT T.Character_name, T.Movie, T.Time_of_Departure - T.Time_of_Arrival AS `Time` FROM TimeTable T;

SELECT * FROM Characters;

SELECT
	T.Character_name, T.Movie, SUM(T.Time) AS `Time`
FROM
	(SELECT T.Character_name, T.Movie, (T.Time_of_Departure - T.Time_of_Arrival) AS `Time` FROM TimeTable T) AS T
GROUP BY
	T.Character_name, T.Movie;

SELECT
	T_.Movie, MAX(T_.Time)
FROM
	(SELECT
		T.Character_name, T.Movie, SUM(T.Time) AS `Time`
	FROM
		(SELECT T.Character_name, T.Movie, (T.Time_of_Departure - T.Time_of_Arrival) AS `Time` FROM TimeTable T) AS T
	GROUP BY
		T.Character_name, T.Movie) T_
WHERE
	T_.Character_name IN (SELECT C_.Name FROM Characters C_ WHERE C_.Race = 'Human')
GROUP BY
	T_.Movie;


SELECT
	T.Movie, C.Race, C.Name
FROM
	Characters C, 
	(SELECT
		T.Character_name, T.Movie, SUM(T.Time) AS `Time`
	FROM
		(SELECT T.Character_name, T.Movie, (T.Time_of_Departure - T.Time_of_Arrival) AS `Time` FROM TimeTable T) AS T
	GROUP BY
		T.Character_name, T.Movie) T
WHERE
	T.Character_name = C.Name AND
	(T.Movie, T.Time) IN (
		SELECT
			T_.Movie, MAX(T_.Time)
		FROM
			(SELECT
				T.Character_name, T.Movie, SUM(T.Time) AS `Time`
			FROM
				(SELECT T.Character_name, T.Movie, (T.Time_of_Departure - T.Time_of_Arrival) AS `Time` FROM TimeTable T) AS T
			GROUP BY
				T.Character_name, T.Movie) T_
		WHERE
			T_.Character_name IN (SELECT C_.Name FROM Characters C_ WHERE C_.Race = C.Race)
		GROUP BY
			T_.Movie
	)
ORDER BY
	T.Movie, C.Race, C.Name