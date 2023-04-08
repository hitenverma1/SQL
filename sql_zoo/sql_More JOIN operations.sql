-- 1.
-- List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962


--  2.
-- Give year of 'Citizen Kane'.
select yr from movie
where title = 'Citizen Kane'


-- 3.
-- List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
select id, title, yr from movie
where title like '%Star Trek%'
order by yr


-- 4.
-- What id number does the actor 'Glenn Close' have?
select m.id from movie m
join actor a
on m.id = a.id
where a.name = 'Glenn Close'


-- 5.
-- What is the id of the film 'Casablanca'
select id from movie
where title = 'Casablanca'


-- 6.
-- Obtain the cast list for 'Casablanca'.
-- Use movieid=11768, (or whatever value you got from the previous question)
select a.name from actor a
join casting c
on a.id = c.actorid
where c.movieid = 27


-- 7.
-- Obtain the cast list for the film 'Alien'
select a.name from actor a
join casting c
on a.id = c.actorid
where c.movieid = (select id from movie
where title = 'Alien')


-- 8.
-- List the films in which 'Harrison Ford' has appeared
select m.title from movie m
join casting c
on m.id = c.movieid
join actor a
on c.actorid = a.id
where a.name = 'Harrison Ford'



-- 9.
-- List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
select m.title from movie m
join casting c
on m.id = c.movieid
join actor a
on c.actorid = a.id
where a.name = 'Harrison Ford' and c.ord <> 1



-- 10.
-- List the films together with the leading star for all 1962 films.
select m.title, a.name from movie m
join casting c
on m.id = c.movieid
join actor a
on c.actorid = a.id
where m.yr = 1962 and c.ord = 1



-- 11.
-- Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1



-- 12.
-- List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT title,name
FROM movie JOIN casting ON (movieid=movie.id AND ord=1)
JOIN actor ON (actorid=actor.id)
WHERE movie.id IN 
(SELECT movieid FROM casting
WHERE actorid IN (
                  SELECT id FROM actor
                  WHERE name = 'Julie Andrews'))



-- 13.
-- Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
select a.name from movie m
join casting c
on m.id = c.movieid
join actor a
on c.actorid = a.id
where c.ord = 1
group by a.name
having count(a.name) >= 15
order by a.name



-- 14.
-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
select m.title, count(a.name) from movie m
join casting c
on m.id = c.movieid
join actor a
on c.actorid = a.id
where m.yr = 1978
group by (m.title)
order by count(a.name) desc, m.title



-- 15.
-- List all the people who have worked with 'Art Garfunkel'.
select distinct(a.name) from actor a
join casting c
on c.actorid = a.id
where c.movieid in (
select c.movieid from casting c join actor a on c.actorid = a.id where a.name = 'Art Garfunkel')
and a.name <> 'Art Garfunkel'