SELECT "artist" AS "Artist", ROUND(AVG("brightness"), 2) AS "Average Brightness Choice by the Artist" FROM "views" WHERE "english_title" LIKE '%fuji%' GROUP BY "artist" ORDER BY "brightness" DESC;