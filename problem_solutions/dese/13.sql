SELECT "schools"."name", "staff_evaluations"."evaluated" FROM "schools"
JOIN "staff_evaluations" ON "schools"."district_id" = "staff_evaluations"."district_id"
WHERE "staff_evaluations"."evaluated" > (
    SELECT AVG("evaluated") FROM "staff_evaluations"
) ORDER BY "staff_evaluations"."evaluated" DESC LIMIT 500;
