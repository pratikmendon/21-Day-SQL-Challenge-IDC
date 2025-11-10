-- Find services that have admitted more than 500 patients in total.
SELECT service, SUM(patients_admitted) AS total_patients_admitted
FROM services_weekly
GROUP BY service
HAVING total_patients_admitted > 500;

-- Show services where average patient satisfaction is below 75.
SELECT service, 
	   ROUND(AVG(patient_satisfaction),2) AS avg_patient_satisfaction
FROM services_weekly
GROUP BY service
HAVING avg_patient_satisfaction < 75;


-- List weeks where total staff presence across all services was less than 50.
SELECT `week`, 
		SUM(present) AS total_staff_presence 
FROM staff_schedule
GROUP BY `week`
HAVING total_staff_presence < 50;