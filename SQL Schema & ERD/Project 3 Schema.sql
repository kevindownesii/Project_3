-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/3nf2f4
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Project 3

CREATE TABLE "cleaned_census" (
    "STATE_CODE" INT(2)   NOT NULL,
    "COUNTY_CODE" INT(2)   NOT NULL,
    "COUNTY_NAME" VARCHAR(50)   NOT NULL,
    "POPULATION_25+" INT(10)   NOT NULL,
    "MEDIAN_HOUSEHOLD_INCOME" INT(10)   NOT NULL,
    "HIGH_SCHOOL" INT(10)   NOT NULL,
    "BACHELOR" INT(10)   NOT NULL,
    "MASTERS" INT(10)   NOT NULL,
    "DOCTORATE" INT(10)   NOT NULL,
    "PROFESSIONAL" INT(10)   NOT NULL,
    "HIGH_SCHOOL_PERCENTAGE" Float   NOT NULL,
    "BACHELOR_PERCENTAGE" Float   NOT NULL,
    "MASTERS_PERCENTAGE" Float   NOT NULL,
    "DOCTORATE_PERCENTAGE" Float   NOT NULL,
    "PROFESSIONAL_PERCENTAGE" Float   NOT NULL,
    "TOTAL_BACHELOR+_PERCENTAGE" Float   NOT NULL
);

CREATE TABLE "County_Boundaries_of_NJ" (
    "OBJECTID" INT(2)   NOT NULL,
    "COUNTY" VARCHAR(50)   NOT NULL,
    "COUNTY_LABEL" VARCHAR(50)   NOT NULL,
    "CO" VARCHAR(5)   NOT NULL,
    "GNIS_NAME" VARCHAR(50)   NOT NULL,
    "GNIS" INT(10)   NOT NULL,
    "FIPSSTCO" INT(10)   NOT NULL,
    "FIPSCO" INT(2)   NOT NULL,
    "ACRES" Float   NOT NULL,
    "SQ_MILES" Float   NOT NULL,
    "POP2020" INT(10)   NOT NULL,
    "POP2010" INT(10)   NOT NULL,
    "POP2000" INT(10)   NOT NULL,
    "POP1990" INT(10)   NOT NULL,
    "POP1980" INT(10)   NOT NULL,
    "POPDEN2020" INT(10)   NOT NULL,
    "POPDEN2010" INT(10)   NOT NULL,
    "POPDEN2000" INT(10)   NOT NULL,
    "POPDEN1990" INT(10)   NOT NULL,
    "POPDEN1980" INT(10)   NOT NULL,
    "REGION" VARCHAR(10)   NOT NULL,
    "Shape_Length" Float   NOT NULL,
    "Shape_Area" Float   NOT NULL
);

