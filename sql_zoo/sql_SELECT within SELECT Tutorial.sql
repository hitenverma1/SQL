-- 1.
-- List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2.
-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
select name from world
where continent = 'Europe'
AND gdp/population > (
  SELECT gdp/population
  FROM world
  WHERE name = 'United Kingdom');

-- 3.
-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
select name, continent from world
where continent in 
(select continent from world
where name in ('Argentina' , 'Australia'))
order by name


-- 4.
-- Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
select name, population from world
where population > (select population from world where name = 'United Kingdom')
and population < (select population from world where name = 'Germany')


-- 5.
-- Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
select name, concat(cast(round((population*100)/(select population from world where name = 'Germany'),0) as int),'%') as percentage
from world
where continent = 'Europe'


-- 6.
-- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
select name from world
where gdp > (select max(gdp) from world where continent = 'Europe')


-- 7.
-- Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area FROM world
where area in (select max(area) from world group by continent)


-- 8.
-- First country of each continent (alphabetically)
-- List each continent and the name of the country that comes first alphabetically.
with table1 as (
    select continent, name , row_number() over (partition by continent order by name) as row from world)
select continent,name
from table1
where row = 1
--------------
SELECT continent, MIN(name)
FROM world
GROUP BY continent


-- 9.
-- Find the continents where all countries have a population <= 25000000. 
-- Then find the names of the countries associated with these continents. Show name, continent and population.
select name,continent,population from world
where not continent in
(select distinct continent from world where population >25000000)


-- 10.
-- Some countries have populations more than three times that of all of their neighbours (in the same continent). 
-- Give the countries and continents.
SELECT x.name, x.continent
FROM world AS x
WHERE x.population > (select 3 * max(population) FROM world AS y
WHERE x.continent = y.continent AND x.name != y.name);