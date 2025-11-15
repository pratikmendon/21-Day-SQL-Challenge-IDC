/*
Analyze the event impact by comparing weeks with events vs weeks without events. 
Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, 
and average staff morale. Order by average patient satisfaction descending.
*/
SELECT
	CASE
		WHEN (`event` IS NOT NULL) AND (`event` != 'none') THEN 'With Event'
        ELSE 'Without Event'
	END AS event_status,
    COUNT(`week`) AS week_count,
    ROUND(AVG(patient_satisfaction),2) AS avg_patient_satisfaction,
    ROUND(AVG(staff_morale),2) AS avg_staff_morale
FROM services_weekly
GROUP BY event_status
ORDER BY avg_patient_satisfaction DESC;
