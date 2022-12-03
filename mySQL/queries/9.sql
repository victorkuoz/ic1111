-- 9. For each race, find the character that travels the most (number of time slots) in each movie. (movie, race, character_name)

DROP TABLE IF EXISTS MovieOne;
CREATE TABLE
	MovieOne
SELECT
	*
FROM
	TimeTable
WHERE
	Movie=1;

SELECT * FROM MovieOne;

