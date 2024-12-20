CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "user_to_user" (
    "follower_id" INTEGER,
    "followed_id" INTEGER,
    FOREIGN KEY ("follower_id") REFERENCES "users"("id"),
    FOREIGN KEY ("followed_id") REFERENCES "users"("id")
);

CREATE TABLE "user_to_school" (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "type" TEXT CHECK ("type" IN ('BA', 'MA', 'PhD')),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "user_to_company" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "title" TEXT,
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies"("id")
);