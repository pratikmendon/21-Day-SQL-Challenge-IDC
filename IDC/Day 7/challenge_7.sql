/*
Identify services that refused more than 100 patients in total and 
had an average patient satisfaction below 80. 
Show service name, total refused, and average satisfaction.
*/

SELECT service, 
	   SUM(patients_refused) AS total_refused,
       ROUND(AVG(patient_satisfaction),2) AS avg_satisfaction
FROM services_weekly
GROUP BY service
HAVING total_refused > 100 AND avg_satisfaction < 80;