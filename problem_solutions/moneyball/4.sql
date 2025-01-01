SELECT "players"."first_name", "players"."last_name", "salaries"."salary" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
WHERE "salaries"."year" = 2001
ORDER BY "salaries"."salary", "players"."first_name", "players"."last_name", "players"."id" LIMIT 50;
