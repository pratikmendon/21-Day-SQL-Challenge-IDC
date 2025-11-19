/*
Create a comprehensive service analysis report for week 20 showing: 
service name, total patients admitted that week, total patients refused, average patient satisfaction, 
count of staff assigned to service, and count of staff present that week. 
Order by patients admitted descending.
*/





SELECT sw.service,
		SUM(sw.patients_admitted) AS total_patients_admitted,
        SUM(sw.patients_refused) AS total_patients_refused,
        ROUND(AVG(sw.patient_satisfaction),2) AS avg_patient_satisfaction,
        COUNT(DISTINCT ss.staff_id) AS staff_service_count,
        SUM(ss.present) AS actual_staff_service_present 
FROM services_weekly sw
INNER JOIN staff_schedule ss
ON sw.`week` = ss.`week` AND sw.service = ss.service
WHERE sw.`week` = 20
GROUP BY sw.service
ORDER BY total_patients_admitted DESC;


