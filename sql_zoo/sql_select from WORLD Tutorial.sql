-- 1.
-- Read the notes about this table.
-- Observe the result of running this SQL command to show the name, continent and population of all countries.
SELECT name, continent, population FROM world


-- 2.
-- How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million.
-- 200 million is 200000000, there are eight zeros.
SELECT name FROM world
WHERE population >= 200000000;

-- 3.
-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
-- HELP:How to calculate per capita GDP
select name , gdp/population from world
WHERE population >= 200000000;

-- 4.
-- Show the name and population in millions for the countries of the continent 'South America'.
-- Divide the population by 1000000 to get population in millions.
select name, population/1000000 from world
where continent = 'South America'


-- 5.
-- Show the name and population for France, Germany, Italy
select name, population from world
where name in ('France', 'Germany', 'Italy')

-- 6.
-- Show the countries which have a name that includes the word 'United'
select name from world
where name like '%United%'

-- 7.
-- Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
-- Show the countries that are big by area or big by population. Show name, population and area.
select name, population, area from world
where area >= 3000000 or population >= 250000000

-- 8.
-- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

SELECT name, population,area
FROM world
WHERE(population>250000000 OR area>3000000)
AND NOT(population>250000000 AND area>3000000)



-- 9.
-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'.
-- Use the ROUND function to show the values to two decimal places.
-- For South America show population in millions and GDP in billions both to 2 decimal places.
select name, round(population/1000000,2), round(gdp/1000000000,2) from world
where continent = 'South America'


-- 10.
-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros).
-- Round this value to the nearest 1000.
-- Show per-capita GDP for the trillion dollar countries to the nearest $1000.
select name, round(gdp/population,-3) from world
where gdp >= 1000000000000

-- 11.
-- Greece has capital Athens.
-- Each of the strings 'Greece', and 'Athens' has 6 characters.
SELECT name, capital FROM world
WHERE LEN(name) = LEN(capital);


-- 12.
-- The capital of Sweden is Stockholm. Both words start with the letter 'S'.
-- Show the name and the capital where the first letters of each match.
-- Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
where LEFT(name,1) = LEFT(capital,1)
and name <> capital


-- 13.
-- Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name.
-- They don't count because they have more than one word in the name.
-- Find the country that has all the vowels and no spaces in its name.
SELECT name
   FROM world
WHERE name LIKE '%a%' and
name LIKE '%e%' and
name LIKE '%i%' and
name LIKE '%o%' and
name LIKE '%u%' and
name NOT LIKE '% %'