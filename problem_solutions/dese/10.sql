SELECT "districts"."name", "expenditures"."per_pupil_expenditure" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
WHERE "districts"."type" = 'Public School District'
GROUP BY "name" ORDER BY "per_pupil_expenditure" DESC LIMIT 10;