# 2022_ItC_MySQL
SQL Assignment for Introduction to Computer (計算機概論), Fall 2022

## Introduction
MySQL is a relational database management system that is based on structured query language (SQL). MySQL has following advantages
- widely compatible
- databases are relational
- open source 
- easy to use

## Environment Setup

### MySQL 5.7

See https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/

If you are using Linux, the following commands might work:
```
sudo apt-get update
sudo apt-get install mysql-server
# Check if mysql is up
sudo service mysql status
# See https://tableplus.io/blog/2018/10/how-to-start-stop-restart-mysql-server.html to start the MySQL server if the server is not started
```

You may need to [create an account](https://dev.mysql.com/doc/refman/5.5/en/adding-users.html) or use root for MySQL (`sudo mysql`).
After installation, you should be able to load the database from `create_starwar.sql` and `load_starwar.sql` in this repository:

In the terminal
```
git clone https://github.com/ArTongg/2022_ItC_MySQL.git
cd 2022_ItC_MySQL
mysql -u username -p < data/create_starwar.sql
mysql --local-infile=1 -u username -p starwar < data/load_starwar.sql
```

### Playaround
After instruction above, you should now run up docker container and enter MySQL. Then you could play with the SQL commands with MySQL like
```
mysql> show tables;
+-------------------+
| Tables_in_starwar |
+-------------------+
| characters        |
| planets           |
| time_table        |
+-------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM characters;
+------------------+---------+-----------+-------------+
| name             | race    | homeworld | affiliation |
+------------------+---------+-----------+-------------+
| Han Solo         | Human   | Corellia  | rebels      |
| Princess Leia    | Human   | Alderaan  | rebels      |
| Luke Skywalker   | Human   | Tatooine  | rebels      |
| Darth Vader      | Human   | Unknown   | empire      |
| Chewbacca        | Wookie  | Kashyyyk  | rebels      |
| C-3 PO           | Droid   | Unknown   | rebels      |
| R2-D2            | Droid   | Unknown   | rebels      |
| Obi-Wan Kanobi   | Human   | Tatooine  | rebels      |
| Lando Calrissian | Human   | Unknown   | rebels      |
| Yoda             | Unknown | Unknown   | neutral     |
| Jabba the Hutt   | Hutt    | Unknown   | neutral     |
| Owen Lars        | Human   | Tatooine  | neutral     |
| Rancor           | Rancor  | Unknown   | neutral     |
+------------------+---------+-----------+-------------+
13 rows in set (0.00 sec)

mysql> SELECT * FROM Planets;
+----------------+------------+-------------+
| Name           | Type       | Affiliation |
+----------------+------------+-------------+
| Tatooine       | desert     | neutral     |
| Hoth           | ice        | rebels      |
| Dagobah        | swamp      | neutral     |
| Death Star     | artificial | empire      |
| Endor          | forest     | neutral     |
| Bespin         | gas        | neutral     |
| Star Destroyer | artificial | empire      |
| Kashyyyk       | forest     | rebels      |
| Corellia       | temperate  | rebels      |
| Alderaan       | temperate  | rebels      |
+----------------+------------+-------------+
10 rows in set (0.01 sec)

mysql> SELECT * FROM TimeTable;
+------------------+----------------+-------+-----------------+-------------------+
| Character_Name   | Planet_Name    | Movie | Time_of_Arrival | Time_of_Departure |
+------------------+----------------+-------+-----------------+-------------------+
| Yoda             | Dagobah        |     1 |               0 |                10 |
| Yoda             | Dagobah        |     2 |               0 |                10 |
| Yoda             | Dagobah        |     3 |               0 |                 5 |
| Rancor           | Tatooine       |     1 |               0 |                10 |
| Rancor           | Tatooine       |     2 |               0 |                10 |
| Rancor           | Tatooine       |     3 |               0 |                 3 |
| Owen Lars        | Tatooine       |     1 |               0 |                 1 |
| Obi-Wan Kanobi   | Tatooine       |     1 |               0 |                 2 |
| Obi-Wan Kanobi   | Star Destroyer |     1 |               3 |                 5 |
| Darth Vader      | Star Destroyer |     1 |               0 |                 9 |
| Darth Vader      | Death Star     |     1 |               9 |                10 |
| Darth Vader      | Hoth           |     2 |               3 |                 4 |
| Darth Vader      | Bespin         |     2 |               5 |                10 |
| Darth Vader      | Death Star     |     3 |               1 |                 9 |
| Han Solo         | Tatooine       |     1 |               0 |                 2 |
| Han Solo         | Star Destroyer |     1 |               3 |                 5 |
| Han Solo         | Bespin         |     2 |               5 |                 9 |
| Han Solo         | Tatooine       |     3 |               0 |                 2 |
| Han Solo         | Endor          |     3 |               5 |                10 |
| Jabba the Hutt   | Tatooine       |     1 |               0 |                10 |
| Jabba the Hutt   | Tatooine       |     2 |               0 |                10 |
| Jabba the Hutt   | Tatooine       |     3 |               0 |                 2 |
| Lando Calrissian | Bespin         |     2 |               0 |                 9 |
| Lando Calrissian | Endor          |     3 |               9 |                10 |
| Lando Calrissian | Tatooine       |     3 |               0 |                 2 |
| Princess Leia    | Star Destroyer |     1 |               1 |                 5 |
| Princess Leia    | Hoth           |     2 |               0 |                 4 |
| Han Solo         | Hoth           |     2 |               0 |                 4 |
| Princess Leia    | Bespin         |     2 |               5 |                 9 |
| Princess Leia    | Tatooine       |     3 |               0 |                 2 |
| Princess Leia    | Endor          |     3 |               5 |                10 |
| Luke Skywalker   | Tatooine       |     1 |               0 |                 2 |
| Luke Skywalker   | Star Destroyer |     1 |               3 |                 5 |
| Luke Skywalker   | Death Star     |     1 |               9 |                10 |
| Luke Skywalker   | Hoth           |     2 |               0 |                 2 |
| Luke Skywalker   | Dagobah        |     2 |               4 |                 8 |
| Luke Skywalker   | Bespin         |     2 |               8 |                10 |
| Luke Skywalker   | Tatooine       |     3 |               1 |                 2 |
| Luke Skywalker   | Endor          |     3 |               5 |                 8 |
| Luke Skywalker   | Death Star     |     3 |               8 |                10 |
| Luke Skywalker   | Dagobah        |     3 |               4 |                 5 |
| R2-D2            | Dagobah        |     3 |               4 |                 5 |
| R2-D2            | Dagobah        |     2 |               4 |                 8 |
| R2-D2            | Bespin         |     2 |               8 |                10 |
| R2-D2            | Endor          |     3 |               5 |                 8 |
| R2-D2            | Hoth           |     2 |               0 |                 2 |
| C-3 PO           | Tatooine       |     1 |               0 |                 2 |
| C-3 PO           | Tatooine       |     3 |               0 |                 2 |
| C-3 PO           | Hoth           |     2 |               0 |                 2 |
| Chewbacca        | Tatooine       |     1 |               0 |                 2 |
+------------------+----------------+-------+-----------------+-------------------+
50 rows in set (0.01 sec)

mysql> source exercise/1.sql
+------------------+
| Character_Name   |
+------------------+
| Han Solo         |
| Lando Calrissian |
| Princess Leia    |
| Luke Skywalker   |
| R2-D2            |
+------------------+
5 rows in set (0.00 sec)
```
you can also check more sample queries in [sample/](sample/)(it's helpful). For more detailed query command, here's [some useful SQL tutorial](https://www.w3schools.com/sql/).

## Database
We use the [star war](https://www.starwars.com/databank) database containing three files: ``TimeTable.csv``, ``Characters.csv`` and ``Planets.csv``
- ``TimeTable.csv`` records for each character and movie, what planet and when did the character go to.
- ``Characters.csv`` contains for each character, what is his/her homeworld and affiliation.
- ``Planets.csv`` records the information about each planet.

## Requirement
In this assignment you are ask to write SQL queries that answer question below (one query per question) and run them with MySQL. Some hints for columns to be selected are shown in the parentheses ()
1. How many planets did Luke Skywalker visit in movie 2?
2. Find all characters that never visited any empire planets.
3. Show the characters names and the total time they spent in each planet among the movies.
4. Find distinct names of the planets visited by rebels-affiliated human.
5. Which planet(s) have not been visited by any characters in all movies?
6. For each movie, which character(s) visited the highest number of planets?
7. How many times for each character to visit his/her homeworld? show character names and times appeared in TimeTable.
8. For Luke Skywalker, for each movie that Luke appears in, what is the planet that has the different affiliation with him and that he travels to for the longest length of time? (movie, planet)
9. For each race, find the character that travels the most (number of time slots) in each movie. (movie, race, character_name
10. Which planet(s) has been visited by more than three different characters?

## Submission
You have to hand in your .zip file on ***NTU cool*** before **12/12 12:00 p.m.** with required format **(student ID in lowercase)**:
```
└── <your_student_ID>.zip
    └── <your_student_ID>/
        ├── 1.sql           -> SQL statement for problem 1
        ├── 2.sql           -> SQL statement for problem 1
        ├── ..
        └── 10.sql          -> SQL statement for problem 10
```
**any invalid format of submission would result in 0 points (e.g. .rar/.7z, ID with uppercase)**

## Grading 
* 10 points for each query 

## Note
- Welcome for questioning via email: r11922109@ntu.edu.tw
- **The query answers must not contain duplicates**
- For this assignment, **creation of temporary tables is not allowed**, i.e., for each question, you have to write exactly one SQL statement
- **Any invalid format (e.g., .rar/.7z ..., missing report, missing screenshots) of the submission will result in 0 points.**

## Disclaimer
The database and questions are based on the previous TA's work.

## Author
Chun-Tong Chao (Anderson)