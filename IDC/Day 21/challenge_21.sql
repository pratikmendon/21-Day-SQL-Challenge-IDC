-- service level metrics
WITH cte_service AS (
	SELECT
		service,
		SUM(patients_admitted) AS total_admission,
		SUM(patients_refused) AS total_refusals,
		ROUND(AVG(patient_satisfaction),2) AS avg_satisfaction
	FROM services_weekly
	GROUP BY service
),
-- staff metrics per service
cte_staff AS (
	SELECT 
    service,
    COUNT(DISTINCT staff_id) AS total_staff,
    ROUND(SUM(present) / COUNT(DISTINCT staff_id), 2) AS avg_weeks_present
FROM staff_schedule
GROUP BY service
),
-- patient demographics
cte_patient AS (
	SELECT 
		service,
		ROUND(AVG(age),2) AS avg_patient_age,
		COUNT(*) as total_patients
	FROM patients
	GROUP BY service
)
SELECT
	csv.service,
    csv.total_admission,
    csv.total_refusals,
    csv.avg_satisfaction,
    csf.total_staff,
    csf.avg_weeks_present,
    cp.avg_patient_age,
	cp.total_patients,
    ROUND((csv.total_admission * 0.3/ NULLIF(csv.total_admission + csv.total_refusals,0)) + (csv.avg_satisfaction * 0.7/100),2)*100
    AS overall_perf_score
FROM cte_service csv
JOIN cte_staff 	csf
ON csv.service = csf.service
JOIN cte_patient cp
ON csf.service = cp.service
ORDER BY overall_perf_score DESC;

 