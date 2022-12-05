-- 1. How many planets did Luke Skywalker visit in movie 2?

SELECT DISTINCT 
	COUNT(T.Planet_Name) AS Planet_Number
FROM
	TimeTable T
WHERE
	T.Movie=2 AND T.Character_Name='Luke Skywalker';