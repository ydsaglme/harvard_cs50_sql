# CS50’s Introduction to Databases with SQL
![Mountain   Stars](https://github.com/user-attachments/assets/ecce4111-4fc6-4707-99c8-9a9eaabc9f8f)

## Scope
**_1) What is the purpose of your database?_**

_The purpose is to examine the background structure of Facebook. Gaining knowledge about the relationships, data types, and operations necessary to efficiently support Facebook's features will be simpler as a result of the inspections that have been conducted. It will also make it easier to comprehend how Facebook handles user information, interactions, marketplace advertisements, games, streams, and administrative controls._

**_2) Which people, places, things, etc., are included in the scope of your database?_**

_User accounts and profiles._

_Users, admins, and streamers._

_Messages sent between users._

_Posts, comments, and their metadata (likes, visibility, etc.)._

_User addresses, rental house addresses, and vehicle locations._

_Marketplace items (houses, vehicles, other products, related ads, etc.)._

_Games, streams, and streaming details (titles, duration, earnings, viewership, etc.)._

**_3) Which people, places, things, etc. are outside the scope of your database?_**

_Detailed geographical data beyond the address level._

_Detailed financial records of Facebook itself (ad revenue, company expenses, etc.)._

_Third-party advertisers or companies analyzing aggregated data from Facebook for marketing purposes._

## Functional Requirements
In this section you should answer the following questions:

* What should a user be able to do with your database?
* What's beyond the scope of what a user should be able to do with your database?

## Representation
### Entities & Attributes
**_Account:_** _account_id (PK), email, password, registered_phone_number, registration_date, account_type_

**_User:_** _user_id (PK), account_id (FK), user_name, phone_number, date_of_birth, gender, user_address, education_

**_Admin:_** _admin_id (PK), account_id (FK), admin_name, admin_category_id_

**_Play:_** _play_id (PK), game_id (FK), user_id (FK), time_stamp_

**_Games:_** _game_id (PK), game_type_id, game_name, number_of_favs, number_of_players, game_description_

**_Streamer:_** _streamer_id (PK), user_id (FK), streamer_mail, streamer_description, number_of_followers_

**_Stream:_** _stream_id (PK), streamer_id (FK), stream_title, date_of_the_stream, duration, number_of_viewers, total_earning_

**_Message:_** _message_id (PK), user_id (FK), contact_id, message_content, read_receipts, message_type, post_date_

**_Ads:_** _ad_id (PK), user_id (FK), ad_type, date_of_ad, likes_

**_Vehicle_Ads:_** _vehicle_ad_id (PK), ad_id (FK), vehicle_type, brand, model, vehicle_location, model_year, vehicle_price, vehicle_description_

**_House_Ads:_** _house_ad_id (PK), ad_id (FK), number_of_bedroom, number_of_bathroom, type_of_sale, area_of_house_

**_House_Rental_Ads:_** _house_rental_ad_id (PK), house_ad_id (FK), rental_fee, rental_house_address, rental_type, description_about_tenement, dog_acceptance_status, cat_acceptance_status_

**_For_Sale_House_Ads:_** _for_sale_house_ad_id (PK), house_ad_id (FK), for_sale_house_address, purchase_fee_

**_Other_Products_Ads:_** _other_products_ad_id (PK), ad_id (FK), ad_title, product_price, condition, product_description, stock_status, product_seller_address_

**_Saved_Ads:_** _saved_ad_id (PK), ad_id (FK), user_id (FK), saved_time_

**_Posts:_** _post_id (PK), user_id (FK), content_reference, post_type, visibility, number_of_likes, published_at_

**_Comments:_** _comment_id (PK), post_id (FK), user_id (FK), content, number_of_likes, published_at, location_

### Constraints
**_XXX_**

### Relationships
**_Entity Relationship Diagram Link:_** _https://drive.google.com/file/d/1ulto4AndTlaULL7J6oJAUWirrnrF50li/view?usp=sharing_

**_Account-User Relationship (1:1):_** _The relationship between account and user is one-to-one relationship. An account can have at most one user. A user can be given by a particular account._

**_Account-Admin Relationship (1:1):_** _The relationship between account and admin is one-to-one relationship. An account can have at most one admin. An admin can be given by a particular account._

**_Streamer-User Relationship (1:1):_** _The relationship between streamer and user is one-to-one relationship. A user can be at most one streamer. A streamer can be at most one user._

**_User-Games Relationship (M:M):_** _The relationship between user and games is many-to-many relationship. A specific user can play various games, while specific games can be played by various users._

**_User-Ads Relationship (1:M):_** _The relationship between user and ads is one-to-many relationship. A specific user can create various ads, while specific ads belong to one user._

**_User-Message Relationship (1:M):_** _The relationship between user and message is one-to-many relationship. A specific user can message various people, while the messages sent belong to one user._

**_Streamer-Stream Relationship (1:M):_** _The relationship between streamer and stream is one-to-many relationship. A specific streamer can stream at most various stream, while a specific stream can be streamed at most simultaneous by one streamer._

**_Posts-Comments Relationship (1:M):_** _The relationship between posts and comments is one-to-many relationship. A specific comment can be in one post. However, one post can involve various comments._

**_User-Comments Relationship (1:M):_** _The relationship between user and comments is one-to-many relationship. A specific user can make various comments on a post. However, user who makes it is just a single user._

**_User-Posts Relationship (1:M):_** _The relationship between user and posts is one-to-many relationship. A specific user can create various posts, while specific post belong to one user._

**_Ads–Vehicle_Ads Relationship (1:1):_** _The relationship between ads and vehicle ads is one-to-one relationship. A vehicle ad must be an ad, however, an ad can be a vehicle ad or not._

**_Ads–House_Ads Relationship (1:1):_** _The relationship between ads and house ads is one-to-one relationship. A house ad must be an ad, however, an ad can be a house or not._

**_Ads–Other_Products_Ads Relationship (1:1):_** _The relationship between ads and other products ads is one-to-one relationship. An other products ad must be an ad, however, an ad can be another product or not._

**_House_Ads–House_Rental_Ads Relationship (1:1):_** _The relationship between house ads and house rental ads is one-to-one relationship. A house rental ad must be a house ad, however, a house ad can be rental or not._

**_House_Ads–For_Sale_House_Ads Relationship (1:1):_** _The relationship between house ads and for sale rental ads is one-to-one relationship. A for sale house ad must be a house ad, however, a house ad can be for sale or not._

**_Ads–Saved_Ads Relationship (1:M):_** _The relationship between ads and saved ads is one-to-many relationship. If we pick a saved ad, it must be an add but if we pick an add, there can be multiple saved ad related to that ad._

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?

## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
* What might your database not be able to represent very well?
