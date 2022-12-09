-- 4. Find distinct names of the planets visited by rebels-affiliated human.

SELECT DISTINCT T.Planet_Name FROM TimeTable T Where T.Character_Name IN (
	SELECT C.Name FROM Characters C WHERE C.Race='Human' AND C.Affiliation='rebels');