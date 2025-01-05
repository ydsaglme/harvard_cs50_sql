SELECT "birth_state", ROUND(AVG("height"), 2) AS "average_height", ROUND(AVG("weight"), 2) AS "average_weight" FROM "players"
WHERE "birth_country" = 'USA'
GROUP BY "birth_state"
ORDER BY "average_height" DESC, "average_weight" DESC;
