-- Count the number of patients by each service.
SELECT service, COUNT(patient_id) as total_count
FROM patients
GROUP BY service;

-- Calculate the average age of patients grouped by service.
SELECT service, ROUND(AVG(age),2) AS avg_age
FROM patients
GROUP BY service;

-- Find the total number of staff members per role.
SELECT `role`, COUNT(staff_id) AS total_count 
FROM staff
GROUP BY `role`;

