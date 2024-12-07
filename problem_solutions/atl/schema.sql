CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "flight_id" INTEGER,
    "passenger_id" INTEGER,
    "date" NUMERIC NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id"),
    FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "section" TEXT NOT NULL CHECK ("section" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY ("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "check_in_id" INTEGER,
    "from_airport" TEXT NOT NULL,
    "to_airport" TEXT NOT NULL,
    "departure_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrival_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("check_in_id") REFERENCES "check_ins"("id")
);
