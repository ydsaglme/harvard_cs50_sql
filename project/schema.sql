--Account
CREATE TABLE "account" (
  "account_id" INTEGER,
  "email" TEXT NOT NULL,
  "password" TEXT NOT NULL,
  "registered_phone_number" TEXT,
  "registration_date" NOT NULL,
  "account_type" CHECK ("account_type" IN ('yes', 'no')) NOT NULL,
  PRIMARY KEY ("account_id")
);

--User
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

--Admin
CREATE TABLE "admin" (
  "admin_id" INTEGER,
  "account_id" INTEGER,
  "admin_name" TEXT NOT NULL,
  "admin_category_id" NUMERIC NOT NULL,
  PRIMARY KEY ("admin_id"),
  FOREIGN KEY ("account_id") REFERENCES "account"("account_id")
);

--Play
CREATE TABLE "play" (
  "play_id" INTEGER,
  "game_id" INTEGER,
  "user_id" INTEGER,
  "time_stamp" ? ,
  PRIMARY KEY ("play_id"),
  FOREIGN KEY ("game_id") REFERENCES "game"("game_id"),
  FOREIGN KEY ("user_id") REFERENCES "user"("user_id")
);

--Games
CREATE TABLE "games" (
  "game_id" INTEGER,
  "game_type_id" NUMERIC NOT NULL,
  "game_name" TEXT NOT NULL,
  "number_of_favs" NUMERIC NOT NULL,
  "number_of_players" NUMERIC NOT NULL,
  "game_description" TEXT NOT NULL,
  PRIMARY KEY ("game_id")
);

--Streamer
CREATE TABLE "streamer" (
  "streamer_id" INTEGER,
  "user_id" INTEGER,
  "streamer_mail" TEXT NOT NULL,
  "streamer_description" TEXT,
  "number_of_followers" NUMERIC NOT NULL,
  PRIMARY KEY ("streamer_id"),
  FOREIGN KEY ("user_id") REFERENCES "user"("user_id")
);

--Stream
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

--Message
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

--Ads
CREATE TABLE "ads" (
  "ad_id" INTEGER,
  "user_id" INTEGER,
  "ad_type" NUMERIC NOT NULL,
  "date_of_ad" ? NOT NULL,
  "likes" NUMERIC NOT NULL,
  PRIMARY KEY ("ad_id"),
  FOREIGN KEY ("user_id") REFERENCES "user"("user_id")
);

--Vehicle Ads
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

--House Ads
CREATE TABLE "house_ads" (
  "house_ad_id" INTEGER,
  "ad_id" INTEGER,
  "number_of_bedroom" NUMERIC NOT NULL,
  "number_of_bathroom" NUMERIC NOT NULL,
  "type_of_sale" CHECK ("type_of_sale" IN ('yes', 'no')) NOT NULL,
  "area_of_house" NUMERIC NOT NULL,
  PRIMARY KEY ("house_ad_id"),
  FOREIGN KEY ("ad_id") REFERENCES "ads"("ad_id")
);

--House Rental Ads
CREATE TABLE "house_rental_ads" (
  "house_rental_ad_id" INTEGER,
  "house_ad_id" INTEGER,
  "rental_fee" NUMERIC NOT NULL,
  "rental_house_address" TEXT NOT NULL,
  "rental_type" NUMERIC NOT NULL,
  "description_about_tenement" TEXT NOT NULL,
  "dog_acceptance_status" CHECK ("dog_acceptance_status" IN ('yes', 'no')) NOT NULL,
  "cat_acceptance_status" CHECK ("cat_acceptance_status" IN ('yes', 'no')) NOT NULL,
  PRIMARY KEY ("house_rental_ad_id"),
  FOREIGN KEY ("house_ad_id") REFERENCES "house_ads"("house_ad_id")
);

--For Sale House Ads
CREATE TABLE "for_sale_house_ads" (
  "for_sale_house_ad_id" INTEGER,
  "house_ad_id" INTEGER,
  "for_sale_house_address" TEXT NOT NULL,
  "purchase_fee" NUMERIC NOT NULL,
  PRIMARY KEY ("for_sale_house_ad_id"),
  FOREIGN KEY ("house_ad_id") REFERENCES "house_ads"("house_ad_id")
);

--Other Products Ads
CREATE TABLE "other_products_ads" (
  "other_products_ad_id" INTEGER,
  "ad_id" INTEGER,
  "ad_title" TEXT NOT NULL,
  "product_price" NUMERIC NOT NULL,
  "condition" NUMERIC,
  "product_description" TEXT,
  "stock_status" CHECK ("stock_status" IN ('yes', 'no')) NOT NULL,
  "product_seller_address" TEXT,
  PRIMARY KEY ("other_products_ad_id"),
  FOREIGN KEY ("ad_id") REFERENCES "ads"("ad_id")
);

--Saved Ads
CREATE TABLE "saved_ads" (
  "saved_ad_id" INTEGER,
  "ad_id" INTEGER,
  "user_id" INTEGER,
  "saved_time" ? NOT NULL,
  PRIMARY KEY ("saved_ad_id"),
  FOREIGN KEY ("ad_id") REFERENCES "ads"("ad_id"),
  FOREIGN KEY ("user_id") REFERENCES "user"("user_id")
);

--Posts
CREATE TABLE "posts" (
  "post_id" INTEGER,
  "user_id" INTEGER,
  "content_reference" ?? NOT NULL,
  "post_type" NUMERIC NOT NULL,
  "visibility" NUMERIC NOT NULL,
  "number_of_likes" NUMERIC NOT NULL,
  "published_at" ? NOT NULL,
  PRIMARY KEY ("post_id"),
  FOREIGN KEY ("user_id") REFERENCES "user"("user_id")
);

--Comments
CREATE TABLE "comments" (
  "comment_id" INTEGER,
  "post_id" INTEGER,
  "user_id" INTEGER,
  "content" TEXT NOT NULL,
  "number_of_likes" NUMERIC NOT NULL,
  "published_at" ? NOT NULL,
  "location" NUMERIC NOT NULL,
  PRIMARY KEY ("comment_id"),
  FOREIGN KEY ("post_id") REFERENCES "posts"("post_id"),
  FOREIGN KEY ("user_id") REFERENCES "user"("user_id")
);
