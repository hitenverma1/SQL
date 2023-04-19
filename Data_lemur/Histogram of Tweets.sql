select tweet_bucket, COUNT(tweet_bucket) as users_num 
from( 
    SELECT COUNT(tweet_id) as tweet_bucket FROM tweets
    where EXTRACT(year from tweet_date) = 2022
    GROUP BY (user_id)) as table1
GROUP BY tweet_bucket;