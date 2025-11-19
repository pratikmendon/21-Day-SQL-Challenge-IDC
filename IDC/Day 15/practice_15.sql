-- Join patients, staff, and staff_schedule to show patient service and staff availability.
SELECT p.`name`, p.service, s.staff_name, ss.`week`, ss.present
FROM patients p
JOIN staff s
ON p.service = s.service
JOIN staff_schedule ss
ON s.staff_id = ss.staff_id;

-- Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
SELECT  sw.`week`, sw.service, sw.available_beds, 
		sw.patients_admitted, sw.patient_satisfaction, sw.staff_morale, 
        s.staff_name, ss.present
FROM services_weekly sw
JOIN staff s
ON sw.service = s.service
JOIN staff_schedule ss
ON s.staff_id = ss.staff_id;

-- Create a multi-table report showing patient admissions with staff information.
SELECT p.service ,p.patient_id, p.`name` AS patient_name, 
		p.age, p.arrival_date,  s.staff_id, s.staff_name, s.`role` , ss.`week`, ss.present
FROM patients p
JOIN staff s
ON  p.service = s.service
JOIN staff_schedule ss
ON s.staff_name = ss.staff_name
order by p.service;
