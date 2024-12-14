CREATE TABLE "account" (
  "account_id" INTEGER,
  "email" TEXT NOT NULL,
  "password" TEXT NOT NULL,
  "registered_phone_number" TEXT,
  "registration_date"  NOT NULL,
  "account_type" CHECK ("account_type" IN ('yes', 'no'),
  PRIMARY KEY ("account_id")
);

CREATE TABLE "user" (
  "user_id" INTEGER,
  "account_id" INTEGER,
  "user_name" TEXT NOT NULL,
  "phone_number" TEXT,
  "date_of_birth"  NOT NULL,
  "gender" NUMERIC NOT NULL,
  "user_address" TEXT,
  "education" TEXT,
  PRIMARY KEY ("user_id"),
  FOREIGN KEY ("account_id") REFERENCES "account"("account_id")
);

CREATE TABLE "admin" (
  "admin_id" INTEGER,
  "account_id" INTEGER,
  "admin_name" TEXT NOT NULL,
  "admin_category_id" NUMERIC NOT NULL
  PRIMARY KEY ("admin_id")
  FOREIGN KEY ("account_id") REFERENCES "account"("account_id")
);
