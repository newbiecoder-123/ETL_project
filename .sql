-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "ca_covid_county" (
    "fips" int   NOT NULL,
    "county" varchar(50)   NOT NULL,
    "state" varchar(50)   NOT NULL,
    "state_code" varchar(10)   NOT NULL,
    "cases" int   NOT NULL,
    "deaths" int   NOT NULL,
    CONSTRAINT "pk_ca_covid_county" PRIMARY KEY (
        "county"
     )
);

CREATE TABLE "PPP_loan_CA" (
    "BusinessName" varchar(50)   NOT NULL,
    "Address" varchar(100)   NOT NULL,
    "City" varchar(100)   NOT NULL,
    "State" varchar(50)   NOT NULL,
    "Zip" int   NOT NULL,
    "NAICSCode" int   NOT NULL,
    "BusinessType" varchar(100)   NOT NULL,
    "JobsRetained" int   NOT NULL,
    "DateApproved" date   NOT NULL,
    "Lender" varchar(100)   NOT NULL,
    CONSTRAINT "pk_PPP_loan_CA" PRIMARY KEY (
        "Zip"
     )
);

CREATE TABLE "ca_county" (
    "fips" int   NOT NULL,
    "county" varchar(50)   NOT NULL,
    "state" varchar(50)   NOT NULL,
    "state_code" varchar(10)   NOT NULL,
    "male" int   NOT NULL,
    "female" int   NOT NULL,
    "median_age" int   NOT NULL,
    "population" int   NOT NULL,
    "female_percent" int   NOT NULL,
    "lat" int   NOT NULL,
    "long" int   NOT NULL,
    CONSTRAINT "pk_ca_county" PRIMARY KEY (
        "county"
     )
);

CREATE TABLE "zip_county_fips" (
    "zip" int   NOT NULL,
    "fips" int   NOT NULL,
    "city" varchar(100)   NOT NULL,
    "county" varchar(50)   NOT NULL,
    "classfp" varchar(10)   NOT NULL,
    CONSTRAINT "pk_zip_county_fips" PRIMARY KEY (
        "county"
     )
);

ALTER TABLE "ca_covid_county" ADD CONSTRAINT "fk_ca_covid_county_county" FOREIGN KEY("county")
REFERENCES "zip_county_fips" ("county");

ALTER TABLE "ca_county" ADD CONSTRAINT "fk_ca_county_county" FOREIGN KEY("county")
REFERENCES "zip_county_fips" ("county");

ALTER TABLE "zip_county_fips" ADD CONSTRAINT "fk_zip_county_fips_zip" FOREIGN KEY("zip")
REFERENCES "PPP_loan_CA" ("Zip");

