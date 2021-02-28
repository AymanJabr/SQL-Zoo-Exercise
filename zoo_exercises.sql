-- Select Basics
Select population From world Where name = 'France';
Select name, population From world Where name IN ('Brazil', 'Russia', 'India', 'China');
Select name, area From world Where area Between 250000 And 300000;

-- Select Quiz
Select name, population From world Where population Between 1000000 And 1250000;
-- Question 2 Table-E Albania	3200000 Algeria	32900000
Select name From world Where name LIKE '%a' OR name LIKE '%l';
-- Question 4
-- name	length(name)
-- Italy	5
-- Malta	5
-- Spain	5
-- Question 5 Andorra	936
Select name, area, population From world Where area > 50000 And population < 10000000;
Select name, population/area From world Where name IN ('China', 'Nigeria', 'France', 'Australia');


-- Select From world
Select name, continent, population From world;
Select name From world Where population >= 2000000000;
Select name, gdp/population From world Where population > 200000000;
Select name, population/1000000 From world Where continent = 'South America';
Select name, population From world Where name In ('France','Germany','Italy');
Select name From world Where name Like '%United%';
Select name, population, area From world Where population > 250000000 Or area > 3000000;
Select name, population, area From world Where population > 250000000 XOR area > 3000000;
Select name, Round(population/1000000,2), Round(gdp/1000000000,2) From world Where continent = 'South America';
Select  name, Round(gdp/population,-3) From world Where gdp >= 1000000000000;
Select name, capital From world Where Length(name) = Length(capital);
Select name, capital From world Where Left(name,1) = Left(capital,1) And name != capital;
Select name From world Where name LIKE '%a%' And name Like'%e%' And name Like '%i%' And name Like '%o%' And name Like '%u%' And name NOT LIKE '% %';


--BBC QUIZ
Select name From world Where name LIKE 'U%';
Select population From world Where name = 'United Kingdom';
-- 'name' should be name
-- Nauru	990
Select name, population From world Where continent IN ('Europe', 'Asia');
Select name From world Where name IN ('Cuba', 'Togo');
-- Brazil Colombia


--Select From Nobel
Select yr, subject, winner From nobel Where yr = 1950;
Select winner From nobel Where yr = 1962 And subject = 'Literature';
Select yr, subject From nobel Where winner = 'Albert Einstein';
Select winner From nobel Where yr > 1999 And subject = 'Peace';
Select yr, subject, winner From nobel Where yr > 1979 And yr < 1990 And subject = 'Literature';
Select * From nobel Where winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter', 'Barack Obama');
Select winner From nobel Where winner Like 'John%';
Select yr, subject, winner From nobel Where subject = 'Physics' And yr = 1980 Or subject = 'Chemistry' And yr = 1984;
Select yr, subject, winner From nobel Where yr = 1980 And subject Not In ('Chemistry','Medicine');
Select yr, subject, winner From nobel Where subject = 'Medicine' and yr < 1910 Or subject = 'Literature' and yr > 2003;
Select * From nobel Where winner = 'PETER GRÜNBERG';
Select * From nobel Where winner = 'EUGENE O\'NEILL';' --remove last '
Select winner, yr, subject From nobel Where winner Like 'Sir%' Order By yr Desc, winner;
Select winner, subject From nobel Where yr=1984 ORDER BY subject IN ('Physics','Chemistry'), subject,winner


--Nobel Quiz
Select winner From nobel Where winner LIKE 'C%' And winner LIKE '%n';
Select COUNT(subject) From nobel Where subject = 'Chemistry' And yr Between 1950 and 1960;
Select COUNT(Distinct yr) From nobel Where yr NOT IN (Select Distinct yr From nobel Where subject = 'Medicine');
-- Medicine	Sir John Eccles Medicine	Sir Frank Macfarlane Burnet;
Select yr From nobel Where yr NOT IN(Select yr From nobel Where subject IN ('Chemistry','Physics'));
Select Distinct yr From nobel Where subject='Medicine' And yr NOT IN(Select yr From nobel Where subject='Literature')   And yr NOT IN (Select yr From nobel Where subject='Peace');
-- Chemistry	1 Literature	1 Medicine	2 Peace	1 Physics	1



--Select within Select
Select name From world Where population > (Select population From world Where name='Russia');
Select name From world Where continent = 'Europe' And (gdp/population) >  (Select gdp/population From world Where name = 'United Kingdom');
Select name, continent From world Where continent = (Select continent From world Where name = 'Argentina') Or continent = (Select continent From world Where name = 'Australia')Order By name;
Select name, population From world Where population > (Select population From world Where name = 'Canada') And population < (Select population From world Where name = 'Poland');
Select name, CONCAT(Round(population/(Select population From world Where name = 'Germany')*100,0),'%') From world Where continent = 'Europe';
Select name From world Where gdp > (Select gdp From world Where name = 'Germany');
Select continent, name, area From world x Where area >= ALL (Select area From world y Where y.continent=x.continent And area>0);
Select name, continent, population From world x Where 25000000 >= All (Select population From world y Where x.continent = y.continent);
Select name, continent From world x Where population >  All (Select population * 3 From world y Where x.continent = y.continent And x.name <> y.name);

--Nested Select Quiz
Select region, name, population From bbc x Where population <= ALL (Select population From bbc y Where y.region=x.region And population>0);
Select name,region,population From bbc x Where 50000 < ALL (Select population From bbc y Where x.region=y.region And y.population>0);
Select name, region From bbc x Where population < ALL (Select population/3 From bbc y Where y.region = x.region And y.name != x.name);
-- Table-D France Germany Russia Turkey
Select name From bbc Where gdp > (Select MAX(gdp) From bbc Where region = 'Africa');
Select name From bbc Where population < (Select population From bbc Where name='Russia') And population > (Select population From bbc Where name='Denmark')
-- Table-B Bangladesh India Pakistan 


--SUM and COUNT
Select SUM(population) From world;
Select Distinct continent From world;
Select Sum(gdp) From world Where continent = 'Africa';
Select Count(name) From world Where area >= 1000000;
Select Sum(population) From world Where name In ('Estonia', 'Latvia', 'Lithuania');
Select continent, Count(name) From world Group By continent;
Select continent, Count(name) From world Where population > 10000000 Group By continent;
Select continent From world Group By continent Having Sum(population > 100000000);

--SUM and COUNT Quiz
 Select SUM(population) From bbc Where region = 'Europe';
  Select COUNT(name) From bbc Where population < 150000;
  AVG(), COUNT(), MAX(), MIN(), SUM();
--   No result due to invalid use of the Where function
 Select AVG(population) From bbc Where name IN ('Poland', 'Germany', 'Denmark');
  Select region, SUM(population)/SUM(area) AS density From bbc GROUP BY region;
  Select name, population/area AS density From bbc Where population = (Select MAX(population) From bbc);
  Table-D Americas	732240 Middle East	13403102 South America	17740392 South Asia	9437710;


  --The JOIN operation
  Select matchid, player From goal Where teamid = 'GER';
  Select id,stadium,team1,team2 From game Where id = 1012;
  Select player,teamid, stadium, mdate From game JOIN goal ON (id=matchid) Where goal.teamid = 'GER';
  Select team1, team2, player From game Join goal On id=matchid Where player Like 'Mario%';
  Select player, teamid, coach, gtime From goal Join eteam On teamid = id Where gtime<=10;
  Select mdate, teamname From game Join eteam On team1 = eteam.id Where coach = 'Fernando Santos';
  Select player From goal Join game On matchid = id Where stadium = 'National Stadium, Warsaw';
From goal JOIN game ON matchid = id Where teamid != 'GER' And (team1 = 'GER' Or team2 = 'GER');
Select teamname, Count(matchid) From eteam JOIN goal ON id=teamid Group By teamname ORDER BY teamname;
Select stadium, Count(matchid) From game Join goal On id = matchid Group By stadium;
Select matchid, mdate, Count(teamid) As number_of_goals_scored From game JOIN goal ON matchid = id Where (team1 = 'POL' OR team2 = 'POL') Group By matchid, mdate;
Select matchid, mdate, Count(teamid) From game Join goal On id = matchid Where teamid = 'GER' Group By matchid, mdate;
Select mdate, team1, Sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) As score1 , team2, Sum(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) As score2 From game Left JOIN goal ON matchid = id Group By  mdate, team1, team2 ORDER BY mdate, matchid, team1, team2


--JOIN Quiz
--  game  JOIN goal ON (id=matchid);
--  matchid, teamid, player, gtime, id, teamname, coach
Select player, teamid, COUNT(*) From game JOIN goal ON matchid = id Where (team1 = "GRE" OR team2 = "GRE") And teamid != 'GRE' GROUP BY player, teamid;
-- DEN	9 June 2012 GER	9 June 2012
  Select Distinct player, teamid From game JOIN goal ON matchid = id Where stadium = 'National Stadium, Warsaw' And (team1 = 'POL' OR team2 = 'POL') And teamid != 'POL';
  Select Distinct player, teamid, gtime From game JOIN goal ON matchid = id Where stadium = 'Stadion Miejski (Wroclaw)' And (( teamid = team2 And team1 != 'ITA') OR ( teamid = team1 And team2 != 'ITA'));
--   Netherlands	2 Poland	2 Republic of Ireland	1 Ukraine	2


--More JOIN operations
Select id, title From movie Where yr=1962;
Select yr From movie Where title = 'Citizen Kane';
Select id, title, yr From movie Where title Like '%Star Trek%' Order By yr;
Select id From actor Where name = 'Glenn Close';
Select id From movie Where title = 'Casablanca';
Select name From actor, casting Where id=actorid And movieid = (Select id From movie Where title = 'Casablanca');
Select name From actor, casting Where id = actorid And movieid = (Select id From movie Where title = 'Alien');
Select title From movie, casting Where id = movieid And actorid = (Select id From actor Where name = 'Harrison Ford');
Select title From movie, casting Where id = movieid And actorid = (Select id From actor Where name = 'Harrison Ford') And ord != 1;
Select title, name From movie, actor, casting Where yr = 1962 And ord = 1 And movie.id = movieid And actorid = actor.id;
Select yr,COUNT(title) From movie JOIN casting ON movie.id=movieid JOIN actor   ON actorid=actor.id Where name='Rock Hudson' GROUP BY yr HAVING COUNT(title) > 2;
Select title, name From movie, actor, casting Where movie.id = movieid And actor.id = actorid And ord = 1 And movieid IN (Select movieid From casting JOIN actor ON actor.id=actorid Where name='Julie Andrews');
Select name From actor JOIN casting ON (id = actorid And (Select COUNT(ord) From casting Where actorid = actor.id And ord=1 ) > =15) GROUP BY name Order By name;
Select title, COUNT(actorid) as cast From movie JOIN casting on id=movieid Where yr = 1978 GROUP BY title ORDER BY cast DESC, title;
Select distinct actor.name From movie JOIN casting ON casting.movieid = movie.id JOIN actor ON actor.id = casting.actorid where movie.id in (select movieid From casting join actor on id =actorid where actor.name = 'Art GarfunkelAdd ') and actor.name != 'Art Garfunkel';
Select name From actor INNER JOIN movie ON actor.id = director Where gross < budget;
Select * From actor JOIN casting ON actor.id = actorid JOIN movie ON movie.id = movieid;
Select name, COUNT(movieid) From casting JOIN actor ON actorid=actor.id Where name LIKE 'John %' GROUP BY name ORDER BY 2 DESC;
-- Table-B "Crocodile" Dundee Crocodile Dundee in Los Angeles Flipper Lightning Jack
Select name From movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid Where ord = 1 And director = 351;
-- link the director column in movies with the primary key in actor connect the primary keys of movie and actor via the casting table
-- Table-B A Bronx Tale	1993 Bang the Drum Slowly	1973 Limitless	2011



--Using Null
Select name From teacher Where dept Is Null;
Select teacher.name, dept.name From teacher INNER JOIN dept   ON (teacher.dept=dept.id);
Select teacher.name, dept.name From teacher Left JOIN dept   ON (teacher.dept=dept.id);
Select teacher.name, dept.name From teacher Right JOIN dept   ON (teacher.dept=dept.id);
Select name, Coalesce(mobile, '07986 444 2266') From teacher ;
Select teacher.name, Coalesce(dept.name, 'None') From teacher Left Join dept On teacher.dept = dept.id;
Select Count(name), Count(mobile) From teacher;
Select dept.name, Count(teacher.id) From dept Left Join teacher On dept.id = teacher.dept Group By dept.name;
Select teacher.name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' ELSE 'Art' END From teacher;
Select name, Case When dept= 1 Or dept=2 Then 'Sci' When dept = 3 Then 'Art' Else 'None' End department_name From teacher;

--Using Null Quiz
Select teacher.name, dept.name From teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id);
Select dept.name From teacher JOIN dept ON (dept.id = teacher.dept) Where teacher.name = 'Cutflower';
Select dept.name, COUNT(teacher.name) From teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name;
-- display 0 in result column for all teachers without department
-- 'four' for Throd
-- Table-A Shrivell	Computing Throd	Computing Splint	Computing Spiregrain	Other Cutflower	Other Deadyawn	Other 


--Self join
Select Count(id) From stops;
Select id From stops Where name = 'Craiglockhart';
Select id, name From stops Join route On id = stop Where num = '4' And company = 'LRT';
Select company, num, COUNT(*) From route Where stop=149 OR stop=53 GROUP BY company, num Having Count(*) = 2;
Select a.company, a.num, a.stop, b.stop From route a JOIN route b ON (a.company=b.company And a.num=b.num) Where a.stop=53 And b.stop = 149;
Select a.company, a.num, stopa.name, stopb.name From route a JOIN route b ON (a.company=b.company And a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) Where stopa.name='Craiglockhart' And stopb.name = 'London Road';
Select Distinct a.company, a.num From route AS a JOIN route AS b ON (a.company = b.company And a.num = b.num)	Where a.stop = 115 And b.stop = 137;
Select a.company, a.num From route As a Join route As b On (a.company = b.company And a.num = b.num) JOIN stops AS astop ON (a.stop = astop.id) JOIN stops AS bstop ON (b.stop = bstop.id) Where astop.name = 'Craiglockhart' And bstop.name = 'Tollcross';
Select Distinct bstop.name, a.company, a.num From	route AS a JOIN route AS b ON (a.company = b.company And a.num = b.num) JOIN stops AS astop ON (a.stop = astop.id) JOIN stops AS bstop ON (b.stop = bstop.id)	Where astop.name = 'Craiglockhart';
Select Distinct r1.num as NoFrom, r1.company CoFrom, name, r2.num as NoTo, r2.company CoTo From stops INNER JOIN route r1 ON r1.stop = id INNER JOIN route r2 ON r2.stop = id Where exists(Select 1 From route r3 INNER JOIN stops s1 ON r3.stop = s1.id Where s1.name='Craiglockhart' And r3.num = r1.num And r3.company = r1.company) And exists( Select 1 From route r4 INNER JOIN stops s2 ON r4.stop = s2.id Where s2.name='Sighthill' And r4.num = r2.num And r4.company = r2.company);

--Self join Quiz
Select Distinct a.name, b.name From stops a JOIN route z ON a.id=z.stop JOIN route y ON y.num = z.num JOIN stops b ON y.stop=b.id Where a.name='Craiglockhart' And b.name ='Haymarket';
Select S2.id, S2.name, R2.company, R2.num From stops S1, stops S2, route R1, route R2 Where S1.name='Haymarket' And S1.id=R1.stop And R1.company=R2.company And R1.num=R2.num And R2.stop=S2.id And R2.num='2A';
Select a.company, a.num, stopa.name, stopb.name From route a JOIN route b ON (a.company=b.company And a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) Where stopa.name='Tollcross';