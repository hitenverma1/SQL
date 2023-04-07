-- 1.
-- The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime
-- Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player FROM goal 
WHERE teamid = 'GER'


-- 2.
-- Show id, stadium, team1, team2 for just game 1012
select id, stadium, team1, team2 from game
where id = 1012


-- 3.
-- show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
FROM game
JOIN goal ON (game.id = goal.matchid)
WHERE teamid = 'GER'



-- 4.
-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
select game.team1, game.team2, goal.player from game
join goal
on game.id = goal.matchid
where player LIKE 'Mario%'


-- 5.
-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT g.player, g.teamid, e.coach, g.gtime
  FROM goal g
join eteam e
on g.teamid = e.id
 WHERE gtime<=10



--  6.
-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT g.mdate, e.teamname
  FROM game g
join eteam e
on g.team1 = e.id
 WHERE e.coach = 'Fernando Santos'


--  7.
-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
select player from goal
join game
on game.id = goal.matchid
where stadium = 'National Stadium, Warsaw'



-- 8.
-- The example query shows all goals scored in the Germany-Greece quarterfinal.
-- Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT player FROM 
	game JOIN goal ON (id = matchid)
	WHERE (team1 = 'GER' OR team2 = 'GER') 
		AND teamid <> 'GER' 


-- 9.
-- Show teamname and the total number of goals scored.
SELECT teamname, count(*)
  FROM eteam JOIN goal ON id=teamid
group by teamname


-- 10.
-- Show the stadium and the number of goals scored in each stadium.
select stadium, count(stadium) from game
join goal 
on game.id = goal.matchid
group by stadium


-- 11.
-- For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid, mdate, count(*)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
 GROUP BY matchid, mdate 


-- 12.
-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
select g2.matchid, g1.mdate, count(g2.teamid) from game g1
join goal g2
on g1.id = g2.matchid
where g2.teamid = 'GER'
group by g2.matchid, g1.mdate


-- 13.
-- List every match with the goals scored by each team as shown.
-- Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2.
SELECT g1.mdate, g1.team1, 
SUM(CASE WHEN g2.teamid=g1.team1 THEN 1 ELSE 0 END) score1,
g1.team2,
SUM(CASE WHEN g2.teamid=g1.team2 THEN 1 ELSE 0 END) score2
FROM game g1 LEFT JOIN goal g2 
ON g2.matchid = g1.id
GROUP BY g1.mdate,g2.matchid,g1.team1,g1.team2
  