SELECT "username" FROM "users"
WHERE "id" = (
    SELECT "to_user_id" FROM "messages"
    GROUP BY "to_user_id"
    ORDER BY COUNT("from_user_id") DESC LIMIT 1
);
