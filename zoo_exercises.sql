-- Select Basics
SELECT population FROM world WHERE name = 'France';
SELECT name, population FROM world WHERE name IN ('Brazil', 'Russia', 'India', 'China');
SELECT name, area FROM world WHERE area BETWEEN 250000 AND 300000;

-- Select Quiz
SELECT name, population FROM world WHERE population BETWEEN 1000000 AND 1250000;
-- Question 2 Table-E Albania	3200000 Algeria	32900000
SELECT name FROM world WHERE name LIKE '%a' OR name LIKE '%l';
-- Question 4
-- name	length(name)
-- Italy	5
-- Malta	5
-- Spain	5
-- Question 5 Andorra	936
SELECT name, area, population FROM world WHERE area > 50000 AND population < 10000000;
SELECT name, population/area FROM world WHERE name IN ('China', 'Nigeria', 'France', 'Australia');


-- SELECT from world
SELECT name, continent, population FROM world;
SELECT name FROM world WHERE population >= 2000000000;
Select name, gdp/population From world Where population > 200000000;
Select name, population/1000000 From world Where continent = 'South America';
Select name, population From world Where name In ('France','Germany','Italy');
Select name From world Where name Like '%United%';
Select name, population, area From world Where population > 250000000 Or area > 3000000;
Select name, population, area From world Where population > 250000000 XOR area > 3000000;
Select name, Round(population/1000000,2), Round(gdp/1000000000,2) From world Where continent = 'South America';
Select  name, Round(gdp/population,-3) From world Where gdp >= 1000000000000;
SELECT name, capital FROM world Where Length(name) = Length(capital);
SELECT name, capital FROM world Where Left(name,1) = Left(capital,1) And name != capital;
SELECT name FROM world WHERE name LIKE '%a%' And name Like'%e%' And name Like '%i%' And name Like '%o%' And name Like '%u%' AND name NOT LIKE '% %';


--BBC QUIZ
SELECT name FROM world WHERE name LIKE 'U%';
SELECT population FROM world WHERE name = 'United Kingdom';
-- 'name' should be name
-- Nauru	990
SELECT name, population FROM world WHERE continent IN ('Europe', 'Asia');
SELECT name FROM world WHERE name IN ('Cuba', 'Togo');
-- Brazil Colombia


--SELECT from Nobel
SELECT yr, subject, winner FROM nobel WHERE yr = 1950;
SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'Literature';
Select yr, subject From nobel Where winner = 'Albert Einstein';
Select winner From nobel Where yr > 1999 And subject = 'Peace';
Select yr, subject, winner From nobel Where yr > 1979 And yr < 1990 And subject = 'Literature';
SELECT * FROM nobel WHERE winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter', 'Barack Obama');
Select winner From nobel Where winner Like 'John%';
Select yr, subject, winner From nobel Where subject = 'Physics' And yr = 1980 Or subject = 'Chemistry' And yr = 1984;
Select yr, subject, winner From nobel Where yr = 1980 And subject Not In ('Chemistry','Medicine');
Select yr, subject, winner From nobel Where subject = 'Medicine' and yr < 1910 Or subject = 'Literature' and yr > 2003;
Select * From nobel Where winner = 'PETER GRÜNBERG';
Select * From nobel Where winner = 'EUGENE O\'NEILL';' --remove last '
Select winner, yr, subject From nobel Where winner Like 'Sir%' Order By yr Desc, winner;
SELECT winner, subject FROM nobel WHERE yr=1984 ORDER BY subject IN ('Physics','Chemistry'), subject,winner


--Nobel Quiz
SELECT winner FROM nobel WHERE winner LIKE 'C%' AND winner LIKE '%n';
SELECT COUNT(subject) FROM nobel WHERE subject = 'Chemistry' AND yr BETWEEN 1950 and 1960;
SELECT COUNT(DISTINCT yr) FROM nobel WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine');
-- Medicine	Sir John Eccles Medicine	Sir Frank Macfarlane Burnet;
SELECT yr FROM nobel WHERE yr NOT IN(SELECT yr FROM nobel WHERE subject IN ('Chemistry','Physics'));
SELECT DISTINCT yr FROM nobel WHERE subject='Medicine' AND yr NOT IN(SELECT yr FROM nobel WHERE subject='Literature')   AND yr NOT IN (SELECT yr FROM nobel WHERE subject='Peace');
-- Chemistry	1 Literature	1 Medicine	2 Peace	1 Physics	1



--SELECT within SELECT
SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name='Russia');
Select name From world Where continent = 'Europe' And (gdp/population) >  (Select gdp/population From world Where name = 'United Kingdom');
Select name, continent From world Where continent = (Select continent From world Where name = 'Argentina') Or continent = (Select continent From world Where name = 'Australia')Order By name;
Select name, population from world Where population > (Select population From world Where name = 'Canada') And population < (Select population From world Where name = 'Poland');
Select name, CONCAT(Round(population/(Select population From world Where name = 'Germany')*100,0),'%') From world Where continent = 'Europe';
Select name From world Where gdp > (Select gdp From world Where name = 'Germany');
SELECT continent, name, area FROM world x WHERE area >= ALL (SELECT area FROM world y WHERE y.continent=x.continent AND area>0);
Select name, continent, population From world x Where 25000000 >= All (Select population From world y Where x.continent = y.continent);
Select name, continent From world x Where population >  All (Select population * 3 From world y Where x.continent = y.continent And x.name <> y.name);

--Nested SELECT Quiz
SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0);
SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0);
SELECT name, region FROM bbc x WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name);
-- Table-D France Germany Russia Turkey
SELECT name FROM bbc WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa');
SELECT name FROM bbc WHERE population < (SELECT population FROM bbc WHERE name='Russia') AND population > (SELECT population FROM bbc WHERE name='Denmark')
-- Table-B Bangladesh India Pakistan 


--SUM and COUNT
SELECT SUM(population) FROM world;
Select Distinct continent From world;
Select Sum(gdp) From world Where continent = 'Africa';
Select Count(name) From world Where area >= 1000000;
Select Sum(population) From world Where name In ('Estonia', 'Latvia', 'Lithuania');
Select continent, Count(name) From world Group By continent;
Select continent, Count(name) From world Where population > 10000000 Group By continent;
Select continent From world Group By continent Having Sum(population > 100000000);

--SUM and COUNT Quiz
 SELECT SUM(population) FROM bbc WHERE region = 'Europe';
  SELECT COUNT(name) FROM bbc WHERE population < 150000;
  AVG(), COUNT(), MAX(), MIN(), SUM();
--   No result due to invalid use of the WHERE function
 SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark');
  SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region;
  SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc);
  Table-D Americas	732240 Middle East	13403102 South America	17740392 South Asia	9437710;


  --The JOIN operation
  SELECT matchid, player FROM goal WHERE teamid = 'GER';
  SELECT id,stadium,team1,team2 FROM game Where id = 1012;
  SELECT player,teamid, stadium, mdate FROM game JOIN goal ON (id=matchid) Where goal.teamid = 'GER';
  Select team1, team2, player From game Join goal On id=matchid Where player Like 'Mario%';
  SELECT player, teamid, coach, gtime FROM goal Join eteam On teamid = id WHERE gtime<=10;
  Select mdate, teamname From game Join eteam On team1 = eteam.id Where coach = 'Fernando Santos';
  Select player From goal Join game On matchid = id Where stadium = 'National Stadium, Warsaw';
FROM goal JOIN game ON matchid = id WHERE teamid != 'GER' And (team1 = 'GER' Or team2 = 'GER');
SELECT teamname, Count(matchid) FROM eteam JOIN goal ON id=teamid Group By teamname ORDER BY teamname;
Select stadium, Count(matchid) From game Join goal On id = matchid Group By stadium;
SELECT matchid, mdate, Count(teamid) As number_of_goals_scored FROM game JOIN goal ON matchid = id WHERE (team1 = 'POL' OR team2 = 'POL') Group By matchid, mdate;
Select matchid, mdate, Count(teamid) From game Join goal On id = matchid Where teamid = 'GER' Group By matchid, mdate;
SELECT mdate, team1, Sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) As score1 , team2, Sum(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) As score2 FROM game Left JOIN goal ON matchid = id Group By  mdate, team1, team2 ORDER BY mdate, matchid, team1, team2


--JOIN Quiz
--  game  JOIN goal ON (id=matchid);
--  matchid, teamid, player, gtime, id, teamname, coach
SELECT player, teamid, COUNT(*) FROM game JOIN goal ON matchid = id WHERE (team1 = "GRE" OR team2 = "GRE") AND teamid != 'GRE' GROUP BY player, teamid;
-- DEN	9 June 2012 GER	9 June 2012
  SELECT DISTINCT player, teamid FROM game JOIN goal ON matchid = id WHERE stadium = 'National Stadium, Warsaw' AND (team1 = 'POL' OR team2 = 'POL') AND teamid != 'POL';
  SELECT DISTINCT player, teamid, gtime FROM game JOIN goal ON matchid = id WHERE stadium = 'Stadion Miejski (Wroclaw)' AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'));
--   Netherlands	2 Poland	2 Republic of Ireland	1 Ukraine	2


--More JOIN operations
SELECT id, title FROM movie WHERE yr=1962;
Select yr From movie Where title = 'Citizen Kane';
Select id, title, yr From movie Where title Like '%Star Trek%' Order By yr;
Select id From actor Where name = 'Glenn Close';
Select id From movie Where title = 'Casablanca';
Select name From actor, casting Where id=actorid And movieid = (Select id From movie Where title = 'Casablanca');
Select name From actor, casting Where id = actorid And movieid = (Select id From movie Where title = 'Alien');
Select title From movie, casting Where id = movieid And actorid = (Select id From actor Where name = 'Harrison Ford');
Select title From movie, casting Where id = movieid And actorid = (Select id From actor Where name = 'Harrison Ford') And ord != 1;
Select title, name From movie, actor, casting Where yr = 1962 And ord = 1 And movie.id = movieid And actorid = actor.id;
SELECT yr,COUNT(title) FROM movie JOIN casting ON movie.id=movieid JOIN actor   ON actorid=actor.id WHERE name='Rock Hudson' GROUP BY yr HAVING COUNT(title) > 2;
SELECT title, name FROM movie, actor, casting Where movie.id = movieid And actor.id = actorid And ord = 1 And movieid IN (SELECT movieid FROM casting JOIN actor ON actor.id=actorid WHERE name='Julie Andrews');
SELECT name FROM actor JOIN casting ON (id = actorid AND (SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1 ) > =15) GROUP BY name Order By name;
SELECT title, COUNT(actorid) as cast FROM movie JOIN casting on id=movieid WHERE yr = 1978 GROUP BY title ORDER BY cast DESC, title;
SELECT distinct actor.name FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON actor.id = casting.actorid where movie.id in (select movieid from casting join actor on id =actorid where actor.name = 'Art GarfunkelAdd ') and actor.name != 'Art Garfunkel';
SELECT name FROM actor INNER JOIN movie ON actor.id = director WHERE gross < budget;
SELECT * FROM actor JOIN casting ON actor.id = actorid JOIN movie ON movie.id = movieid;
SELECT name, COUNT(movieid) FROM casting JOIN actor ON actorid=actor.id WHERE name LIKE 'John %' GROUP BY name ORDER BY 2 DESC;
-- Table-B "Crocodile" Dundee Crocodile Dundee in Los Angeles Flipper Lightning Jack
SELECT name FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid WHERE ord = 1 AND director = 351;
-- link the director column in movies with the primary key in actor connect the primary keys of movie and actor via the casting table
-- Table-B A Bronx Tale	1993 Bang the Drum Slowly	1973 Limitless	2011



--Using Null
Select name From teacher Where dept Is Null;
SELECT teacher.name, dept.name FROM teacher INNER JOIN dept   ON (teacher.dept=dept.id);
SELECT teacher.name, dept.name FROM teacher Left JOIN dept   ON (teacher.dept=dept.id);
SELECT teacher.name, dept.name FROM teacher Right JOIN dept   ON (teacher.dept=dept.id);
Select name, Coalesce(mobile, '07986 444 2266') From teacher ;
Select teacher.name, Coalesce(dept.name, 'None') From teacher Left Join dept On teacher.dept = dept.id;
Select Count(name), Count(mobile) From teacher;
Select dept.name, Count(teacher.id) From dept Left Join teacher On dept.id = teacher.dept Group By dept.name;
SELECT teacher.name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' ELSE 'Art' END FROM teacher;
Select name, Case When dept= 1 Or dept=2 Then 'Sci' When dept = 3 Then 'Art' Else 'None' End department_name From teacher;

--Using Null Quiz
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id);
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower';
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name;
-- display 0 in result column for all teachers without department
-- 'four' for Throd
-- Table-A Shrivell	Computing Throd	Computing Splint	Computing Spiregrain	Other Cutflower	Other Deadyawn	Other 