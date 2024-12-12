--1st query
SELECT user.user_name, posts.post_id, posts.published_at FROM user
INNER JOIN posts ON posts.user_id = user.user_id
WHERE user.user_id = 4 AND posts.post_type = 3
ORDER BY posts.published_at DESC;

--2nd query
SELECT posts.post_id, user.user_name, comments.content FROM (comments INNER JOIN user ON user.user_id = comments.user_id)
INNER JOIN posts ON posts.post_id = comments.post_id
WHERE posts.post_id = 5;

--3rd query
SELECT user.user_name AS streamer_name, SUM(stream.total_earning) AS amount_to_be_paid FROM (streamer INNER JOIN user ON streamer.user_id = user.user_id)
INNER JOIN stream ON streamer.streamer_id = stream.streamer_id
GROUP BY user.user_name HAVING SUM(stream.total_earning) > 100;

--4th query
SELECT user.user_name, posts.post_id, posts.published_at FROM user
INNER JOIN posts ON posts.user_id = user.user_id
WHERE user.user_id = 4 AND posts.post_type = 3
ORDER BY posts.published_at DESC;

--5th query
SELECT TOP 2 user.user_name AS winners, account.email FROM (account INNER JOIN user ON account.account_id = user.account_id)
INNER JOIN play ON play.user_id = user.user_id
WHERE play.game_id = 1
GROUP BY user.user_name, account.email
ORDER BY COUNT(play.user_id) DESC;
