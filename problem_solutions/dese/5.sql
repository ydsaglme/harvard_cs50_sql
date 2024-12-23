SELECT "city" AS "City", COUNT("name") AS "Number of Schools" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "City" HAVING "Number of Schools" <= 3 ORDER BY "Number of Schools" DESC, "City";