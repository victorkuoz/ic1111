-- 8. For Luke Skywalker, for each movie that Luke appears in, 
    -- what is the planet that has the different affiliation with him and that he travels to for the longest length of time? (movie, planet)

SELECT
    Cur.Movie, GROUP_CONCAT(Cur.Planet_Name SEPARATOR ', ') AS Planet_Names
FROM
    (
        SELECT
            T.Planet_Name, T.Movie, (T.Time_of_Departure - T.Time_of_Arrival) AS `Time`
        FROM
            TimeTable T
        WHERE
            T.Character_Name = 'Luke Skywalker' AND T.Planet_Name NOT IN (
                SELECT 
                    P.Name
                FROM
                    Planets P
                WHERE
                    P.Affiliation = (SELECT C.Affiliation FROM Characters C WHERE C.Name = 'Luke Skywalker')
            )
    ) AS Cur
WHERE
    Cur.Time = 
    (
        SELECT
            MAX(Prev.Time)
        FROM
            (
                SELECT
                    T.Planet_Name, T.Movie, (T.Time_of_Departure - T.Time_of_Arrival) AS `Time`
                FROM
                    TimeTable T
                WHERE
                    T.Character_Name = 'Luke Skywalker' AND T.Planet_Name NOT IN (
                        SELECT 
                            P.Name
                        FROM
                            Planets P
                        WHERE
                            P.Affiliation = (SELECT C.Affiliation FROM Characters C WHERE C.Name = 'Luke Skywalker')
                    )
            ) AS Prev
        WHERE
            Cur.Movie = Prev.Movie
    )
GROUP BY
    Cur.Movie;