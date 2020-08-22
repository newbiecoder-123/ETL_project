-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
select * from ca_covid_county
select * from PPP_loan_CA
select * from ca_county
select * from zip_county_fips

CREATE TABLE PPP_loan_CA (
    BusinessName varchar(50) NOT NULL,
    Address varchar(100) NOT NULL,
    City varchar(100) NOT NULL,
    State varchar(50) NOT NULL,
    Zip int NOT NULL,
    NAICSCode int NOT NULL,
    BusinessType varchar(100) NOT NULL,
    JobsRetained int NOT NULL,
    DateApproved date NOT NULL,
    Lender varchar(100) NOT NULL,
	PRIMARY KEY (Zip)
);

CREATE TABLE zip_county_fips (
    zip int   NOT NULL,
    fips int   NOT NULL,
    city varchar(100) NOT NULL,
    county varchar(50) NOT NULL,
    classfp varchar(10) NOT NULL,
	FOREIGN KEY (zip) REFERENCES PPP_loan_CA(Zip),
	PRIMARY KEY (county)
);

CREATE TABLE ca_covid_county (
    fips int NOT NULL,
    county varchar(50) NOT NULL,
    state varchar(50) NOT NULL,
    state_code varchar(10)   NOT NULL,
    cases int NOT NULL,
    deaths int NOT NULL,
	FOREIGN KEY (county) REFERENCES zip_county_fips(county),
    PRIMARY KEY (county)
);

CREATE TABLE ca_county (
    fips int NOT NULL,
    county varchar(50) NOT NULL,
    state varchar(50) NOT NULL,
    state_code varchar(10) NOT NULL,
    male int NOT NULL,
    female int NOT NULL,
    median_age int NOT NULL,
    population int NOT NULL,
    female_percent int NOT NULL,
    lat int NOT NULL,
    long int NOT NULL,
	FOREIGN KEY (county) REFERENCES zip_county_fips(county),
	PRIMARY KEY (county)
);


