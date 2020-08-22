select * from ca_covid_county
select * from PPP_loan_CA
select * from ca_county
select * from zip_county_fips

-- Join tables on county and zip
SELECT p.BusinessName , p.Address, p.City, p.State, p.zip, p.BusinessType, p.JObsRetained, p.Lender,
	ca.county, ca.cases, ca.deaths, county.male, county.female, 
	county.median_age, county.population, county.female_percent, county.lat, county.long
FROM PPP_loan_CA p 
INNER JOIN zip_county_fips z ON p.zip = z.zip
INNER JOIN ca_covid_county ca ON ca.county = z.county
INNER JOIN ca_county county on county.county = z.county;