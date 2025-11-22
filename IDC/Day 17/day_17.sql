-- Show each patient with their service's average satisfaction as an additional column.
SELECT p.patient_id, p.`name`, p.service, p.satisfaction,
	(SELECT ROUND(AVG(satisfaction),2) FROM patients s 
		WHERE s.service = p.service) AS avg_satisfaction
FROM patients p;

-- Create a derived table of service statistics and query from it.
select dt.service, dt.total_admissions, dt.max_refusal from
(SELECT service, sum(patients_admitted) as total_admissions, max(patients_refused) as max_refusal
FROM services_weekly group by service) AS dt
where dt.total_admissions > 500;

-- Display staff with their service's total patient count as a calculated field.
SELECT s.staff_id, s.staff_name, s.`role`, s.service,
	(SELECT COUNT(*) FROM patients p WHERE s.service = p.service) AS total_patient_count
FROM staff s



