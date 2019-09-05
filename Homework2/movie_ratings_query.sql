select
concat(f.first_name, ' ', f.last_name) as "friend_name", 
m.movie_name,
r.rating
from friends f
join ratings r on r.friend_id = f.friend_id
join movies m on r.movie_id = m.movie_id;
