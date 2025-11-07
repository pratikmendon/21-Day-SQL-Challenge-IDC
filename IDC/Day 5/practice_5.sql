-- Count the total number of patients in the hospital.
SELECT COUNT(*) AS patient_count
FROM patients ;

-- Calculate the average satisfaction score of all patients.
SELECT ROUND(AVG(satisfaction),2) AS avg_satisfaction_score 
FROM patients;

-- Find the minimum and maximum age of patients.
SELECT MIN(age) AS min_age, MAX(age) AS max_age
FROM patients;

