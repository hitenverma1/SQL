with cte1 as(
SELECT artist_name,COUNT(artist_name) as cnt from(
SELECT artists.artist_name, global_song_rank.rank FROM artists
JOIN songs on artists.artist_id = songs.artist_id
JOIN global_song_rank on global_song_rank.song_id = songs.song_id
where global_song_rank.rank <= 10) as t1
GROUP BY artist_name
ORDER BY cnt DESC ,artist_name)

select * from (
select artist_name,
DENSE_RANK() OVER(ORDER BY cnt DESC) as artist_rank
from cte1) as a1
where a1.artist_rank <=5 ;