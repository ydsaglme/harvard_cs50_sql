SELECT "schools"."name", "graduation_rates"."graduated", "expenditures"."per_pupil_expenditure" FROM "schools"
JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
JOIN "expenditures" ON "schools"."district_id" = "expenditures"."district_id"
GROUP BY "schools"."name" ORDER BY "expenditures"."per_pupil_expenditure" DESC, "schools"."name";