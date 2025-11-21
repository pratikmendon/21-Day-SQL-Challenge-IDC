-- Find patients who are in services with above-average staff count.
SELECT *
FROM patients
WHERE service IN (
	SELECT service
	FROM (
			SELECT service, COUNT(*) AS staff_count
			FROM staff
			GROUP BY service
		) AS service_staff
		WHERE staff_count >
			(SELECT AVG(staff_count)
			FROM (
				SELECT service, COUNT(*) AS staff_count
				FROM staff
				GROUP BY service
				) AS avg_calc
			)
	);

-- List staff who work in services that had any week with patient satisfaction below 70.

SELECT DISTINCT s.staff_id, s.staff_name, s.role, s.service
FROM staff AS s
WHERE s.service IN (
    SELECT DISTINCT service
    FROM services_weekly
    WHERE patient_satisfaction < 70
);


-- Show patients from services where total admitted patients exceed 1000.
SELECT *
FROM patients
WHERE service IN(
		select service
		from services_weekly
		group by service
		having sum(patients_admitted) > 1000);

