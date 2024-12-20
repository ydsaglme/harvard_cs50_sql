SELECT "season", COUNT("episode_in_season") AS "number_of_episodes" FROM "episodes"
WHERE 10 <= "season" <= 14 AND "topic" IS NULL
GROUP BY "season";
