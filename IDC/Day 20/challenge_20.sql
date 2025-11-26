/*
Create a trend analysis showing for each service and week: 
week number, patients_admitted, running total of patients admitted (cumulative), 
3-week moving average of patient satisfaction (current week and 2 prior weeks), 
and the difference between current week admissions and the service average. 
Filter for weeks 10-20 only.
*/




SELECT 
	service,
	`week`,
    patients_admitted,
    SUM(patients_admitted) OVER (partition by service ORDER BY `week`) AS running_total_admitted,
    ROUND(AVG(patient_satisfaction) OVER (partition by service ORDER BY `week` ROWS BETWEEN 2 preceding AND current row),2) AS running_avg_sat,
    (patients_admitted - avg(patients_admitted) over (partition by service)) AS diff_from_service_avg 
FROM services_weekly
WHERE `week` BETWEEN 10 AND 20;



