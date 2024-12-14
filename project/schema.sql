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
  "date_of_birth" NOT NULL,
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
  time_stamp ? ,
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

CREATE TABLE "stream" (
  "stream_id" INTEGER,
  "streamer_id" INTEGER,
  "stream_title" TEXT NOT NULL,
  "date_of_the_stream" ? ,
  "duration" NUMERIC NOT NULL,
  "number_of_viewers" NUMERIC NOT NULL,
  "total_earning" NUMERIC,
  PRIMARY KEY ("stream_id"),
  FOREIGN KEY ("streamer_id") REFERENCES "streamer"("streamer_id")
);

CREATE TABLE "message" (
  "message_id" INTEGER,
  "user_id" INTEGER,
  "contact_id" INTEGER,
  "message_content" TEXT,
  "read_receipts" NUMERIC NOT NULL,
  "message_type" NUMERIC NOT NULL,
  "post_date" ? NOT NULL,
  PRIMARY KEY ("message_id"),
  FOREIGN KEY ("user_id") REFERENCES "user"("user_id"),
  FOREIGN KEY ("contact_id") REFERENCES "user"("user_id")
);

CREATE TABLE "ads" (
  "ad_id" INTEGER,
  "user_id" INTEGER,
  "ad_type" NUMERIC NOT NULL,
  "date_of_ad" ? NOT NULL,
  "likes" NUMERIC NOT NULL,
  PRIMARY KEY ("ad_id"),
  FOREIGN KEY ("user_id") REFERENCES "user"("user_id"),
);

CREATE TABLE "vehicle_ads" (
  "vehicle_ad_id" INTEGER,
  "ad_id" INTEGER,
  "vehicle_type" NUMERIC NOT NULL,
  "brand" TEXT NOT NULL,
  "model" TEXT NOT NULL,
  "vehicle_location" NOT NULL,
  "model_year" NUMERIC NOT NULL,
  "vehicle_price" NUMERIC NOT NULL,
  "vehicle_description" TEXT NOT NULL,
  PRIMARY KEY ("vehicle_ad_id"),
  FOREIGN KEY ("ad_id") REFERENCES "ads"("ad_id")
);
