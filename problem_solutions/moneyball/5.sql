SELECT "name" FROM "teams"
WHERE "id" IN (
    SELECT "team_id" FROM "performances"
    WHERE "player_id" = (
        SELECT "id" FROM "players"
        WHERE "first_name" LIKE '%satchel%' AND "last_name" LIKE '%paige%'
    )
) GROUP BY "name";
