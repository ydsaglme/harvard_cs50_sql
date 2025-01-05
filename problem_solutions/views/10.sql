SELECT "artist", ROUND(AVG("brightness"), 2) FROM "views"
WHERE "english_title" LIKE '%fuji%'
GROUP BY "artist"
ORDER BY "brightness" DESC;
