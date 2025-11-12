-- Extract the year from all patient arrival dates.
SELECT *, 
extract(YEAR FROM arrival_date) AS arrival_year 
FROM patients;

-- Calculate the length of stay for each patient (departure_date - arrival_date).
SELECT *, 
datediff(departure_date, arrival_date) AS lenght_of_stay
FROM patients;

-- Find all patients who arrived in a specific month.
SELECT *
FROM patients
WHERE MONTH(arrival_date) = 3;

