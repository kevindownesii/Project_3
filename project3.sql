-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/3nf2f4
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Project 3

CREATE TABLE "county_id" (
    "county_id" INT   NOT NULL,
    "county" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_county_id" PRIMARY KEY (
        "county_id"
     )
);

CREATE TABLE "cleaned_census_data" (
    "STATE_CODE" INT   NOT NULL,
    "COUNTY_CODE" INT   NOT NULL,
    "COUNTY_ID" INT   NOT NULL,
    "COUNTY_NAME" VARCHAR(50)   NOT NULL,
    "POPULATION_25+" INT   NOT NULL,
    "MEDIAN_HOUSEHOLD_INCOME" INT   NOT NULL,
    "HIGH_SCHOOL" INT   NOT NULL,
    "BACHELOR" INT   NOT NULL,
    "MASTERS" INT   NOT NULL,
    "DOCTORATE" INT   NOT NULL,
    "PROFESSIONAL" INT   NOT NULL,
    "HIGH_SCHOOL_PERCENTAGE" Decimal   NOT NULL,
    "BACHELOR_PERCENTAGE" Decimal   NOT NULL,
    "MASTERS_PERCENTAGE" Decimal   NOT NULL,
    "DOCTORATE_PERCENTAGE" Decimal   NOT NULL,
    "PROFESSIONAL_PERCENTAGE" Decimal   NOT NULL,
    "TOTAL_BACHELOR+_PERCENTAGE" Decimal   NOT NULL,
    CONSTRAINT "pk_cleaned_census_data" PRIMARY KEY (
        "COUNTY_ID"
     )
);

CREATE TABLE "county_boundaries_of_nj" (
    "OBJECTID" INT   NOT NULL,
    "COUNTY" VARCHAR(50)   NOT NULL,
    "COUNTY_ID" INT   NOT NULL,
    "COUNTY_LABEL" VARCHAR(50)   NOT NULL,
    "CO" VARCHAR(5)   NOT NULL,
    "GNIS_NAME" VARCHAR(50)   NOT NULL,
    "GNIS" INT   NOT NULL,
    "FIPSSTCO" INT   NOT NULL,
    "FIPSCO" INT   NOT NULL,
    "ACRES" Float   NOT NULL,
    "SQ_MILES" Float   NOT NULL,
    "POP2020" INT   NOT NULL,
    "POP2010" INT   NOT NULL,
    "POP2000" INT   NOT NULL,
    "POP1990" INT   NOT NULL,
    "POP1980" INT   NOT NULL,
    "POPDEN2020" INT   NOT NULL,
    "POPDEN2010" INT   NOT NULL,
    "POPDEN2000" INT   NOT NULL,
    "POPDEN1990" INT   NOT NULL,
    "POPDEN1980" INT   NOT NULL,
    "REGION" VARCHAR(100)   NOT NULL,
    "Shape_Length" Float   NOT NULL,
    "Shape_Area" Float   NOT NULL,
    CONSTRAINT "pk_County_Boundaries_of_NJ" PRIMARY KEY (
        "COUNTY_ID"
     )
);

CREATE TABLE "crime_data" (
    "record_id" INT   NOT NULL,
    "county_id" INT   NOT NULL,
    "county" VARCHAR(50)   NOT NULL,
    "agency" VARCHAR(100)   NOT NULL,
    "murder_count" INT   NOT NULL,
    "rape_count" INT   NOT NULL,
    "robbery_count" INT   NOT NULL,
    "assualt_count" INT   NOT NULL,
    "burglary_count" INT   NOT NULL,
    "larceny_count" INT   NOT NULL,
    "auto_theft_count" INT   NOT NULL,
    "year" SMALLINT   NOT NULL,
    CONSTRAINT "pk_Crime_Data" PRIMARY KEY (
        "record_id","county_id","year"
     )
);

ALTER TABLE "cleaned_census_data" ADD CONSTRAINT "fk_cleaned_census_data_COUNTY_ID" FOREIGN KEY("COUNTY_ID")
REFERENCES "county_id" ("county_id");

ALTER TABLE "County_Boundaries_of_NJ" ADD CONSTRAINT "fk_County_Boundaries_of_NJ_COUNTY_ID" FOREIGN KEY("COUNTY_ID")
REFERENCES "county_id" ("county_id");

ALTER TABLE "Crime_Data" ADD CONSTRAINT "fk_Crime_Data_county_id" FOREIGN KEY("county_id")
REFERENCES "county_id" ("county_id");



SELECT * FROM county_boundaries_of_nj