SELECT ROUND(AVG("height"), 2) AS "average_height", ROUND(AVG("weight"), 2) AS "average_weight" FROM "players"
WHERE '2000-01-01' < "debut";
