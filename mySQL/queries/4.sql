-- 4. Find distinct names of the planets visited by rebels-affiliated human.

SELECT DISTINCT Planet_Name FROM TimeTable Where Character_Name IN (
	SELECT Name FROM Characters WHERE Race='Human' AND Affiliation='rebels');
