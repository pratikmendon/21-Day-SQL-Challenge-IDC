SELECT 
    p.patient_id,
    p.`name`,
    p.service,
    p.satisfaction
FROM patients AS p
WHERE p.service IN (
    SELECT DISTINCT service -- select services having patient refused > 0
    FROM services_weekly
    WHERE patients_refused > 0
)
AND p.service IN (
    SELECT service
    FROM (
        SELECT 
            service,
            AVG(patient_satisfaction) AS avg_service_satisfaction -- Average satisfation in every service
        FROM services_weekly
        GROUP BY service
    ) AS svc
    WHERE avg_service_satisfaction < (
        SELECT AVG(patient_satisfaction)  -- -- Average satisfation overall
        FROM services_weekly
    )
);
