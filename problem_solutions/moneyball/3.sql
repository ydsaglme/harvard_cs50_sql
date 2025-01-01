SELECT "year", "HR" FROM "performances"
WHERE "player_id" = (
    SELECT "id" FROM "players"
    WHERE "first_name" LIKE '%ken%' AND "last_name" LIKE '%griffey%' AND "birth_year" = 1969
) GROUP BY "year"
ORDER BY "year" DESC;
