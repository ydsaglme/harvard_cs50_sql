SELECT "teams"."name", SUM("performances"."H") AS "total_hits" FROM "teams"
JOIN "performances" ON "teams"."id" = "performances"."team_id"
WHERE "performances"."year" = 2001
GROUP BY "teams"."name"
ORDER BY "total_hits" DESC LIMIT 5;
