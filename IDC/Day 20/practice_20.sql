-- Calculate running total of patients admitted by week for each service.
SELECT 
	service,
    patients_admitted,
    `week`,
    SUM(patients_admitted) OVER (PARTITION BY service ORDER BY `week`) AS running_total_admitted
FROM services_weekly;

-- Find the moving average of patient satisfaction over 4-week periods.
SELECT 
	`week`,
    patient_satisfaction,
    ROUND(AVG(patient_satisfaction) OVER (ORDER BY `week` ROWS BETWEEN 3 preceding and current row),2)
	AS running_avg_sat
FROM services_weekly;

-- Show cumulative patient refusals by week across all services.
SELECT 
	`week`,
    service,
    patients_refused,
    SUM(patients_refused) OVER (order BY `week` rows unbounded preceding) AS running_total_refused
FROM services_weekly;



