CREATE TABLE "meteorites_temp" (
  "name" TEXT,
  "id" INTEGER,
  "nametype" TEXT,
  "class" TEXT,
  "mass" FLOAT,
  "discovery" TEXT NOT NULL CHECK ("discovery" IN ('Fell', 'Found')),
  "year" INTEGER,
  "lat" FLOAT,
  "long" FLOAT,
  PRIMARY KEY ("id")
);

.import --csv meteorites.csv meteorites_temp

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = '';

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = '';

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = '';

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = '';

UPDATE "meteorites_temp"
SET "mass" = ROUND("mass", 2);

UPDATE "meteorites_temp"
SET "lat" = ROUND("lat", 2);

UPDATE "meteorites_temp"
SET "long" = ROUND("long", 2);

DELETE FROM "meteorites_temp"
WHERE "nametype" = "Relict";

ALTER TABLE "meteorites_temp"
DROP COLUMN "nametype";

CREATE TABLE "meteorites" (
  "id" INTEGER,
  "name" TEXT,
  "class" TEXT,
  "mass" FLOAT,
  "discovery" TEXT NOT NULL CHECK ("discovery" IN ('Fell', 'Found')),
  "year" INTEGER,
  "lat" FLOAT,
  "long" FLOAT,
  PRIMARY KEY ("id")
);

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites_temp"
ORDER BY "year", "name";

DROP TABLE "meteorites_temp";