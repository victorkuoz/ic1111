-- 1. How many planets did Luke Skywalker visit in movie 2?

SELECT DISTINCT 
	Planet_Name
FROM
	TimeTable
WHERE
	Movie=2 AND Character_Name='Luke Skywalker';
