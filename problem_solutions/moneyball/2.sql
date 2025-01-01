SELECT "year", "salary" FROM "salaries"
WHERE "player_id" = (
    SELECT "id" FROM "players"
    WHERE "first_name" LIKE '%cal%' AND "last_name" LIKE '%ripken%'
) GROUP BY "year"
ORDER BY "year" DESC;
