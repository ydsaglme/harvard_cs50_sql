CREATE TABLE "account" (
  "account_id" INTEGER,
  "email" TEXT NOT NULL,
  "password" TEXT NOT NULL,
  "registered_phone_number" TEXT,
  "registration_date" NOT NULL,
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
  "admin_category_id" NUMERIC NOT NULL,
  PRIMARY KEY ("admin_id"),
  FOREIGN KEY ("account_id") REFERENCES "account"("account_id")
);

CREATE TABLE "play" (
  "play_id" INTEGER,
  "game_id" INTEGER,
  "user_id" INTEGER,
  time_stamp ,
  PRIMARY KEY ("play_id"),
  FOREIGN KEY ("game_id") REFERENCES "game"("game_id"),
  FOREIGN KEY ("user_id") REFERENCES "user"("user_id")
);

CREATE TABLE "games" (
  "game_id" INTEGER,
  "game_type_id" NUMERIC NOT NULL,
  "game_name" TEXT NOT NULL,
  "number_of_favs" NUMERIC NOT NULL,
  "number_of_players" NUMERIC NOT NULL,
  "game_description" TEXT NOT NULL
);

CREATE TABLE "streamer" (
  "streamer_id" INTEGER,
  "user_id" INTEGER,
  "streamer_mail" TEXT NOT NULL,
  "streamer_description" TEXT,
  "number_of_followers" NUMERIC NOT NULL,
  PRIMARY KEY ("streamer_id"),
  FOREIGN KEY ("user_id") REFERENCES "user"("user_id")
);

