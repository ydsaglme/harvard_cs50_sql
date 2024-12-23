SELECT "city" AS "City", COUNT("name") AS "Number of Schools" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "City" ORDER BY "Number of Schools" DESC, "City" LIMIT 10;