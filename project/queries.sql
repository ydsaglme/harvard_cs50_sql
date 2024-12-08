--1st Query
SELECT user.user_name, posts.post_id, posts.published_at FROM user
INNER JOIN posts ON posts.user_id = user.user_id
WHERE user.user_id = 4 AND posts.post_type = 3
ORDER BY posts.published_at DESC;
