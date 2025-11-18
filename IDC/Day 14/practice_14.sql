-- Show all staff members and their schedule information (including those with no schedule entries).
SELECT s.*, ss.present,ss.`week`
FROM staff s
LEFT JOIN staff_schedule ss
ON s.staff_id = ss.staff_id;

-- List all services from services_weekly and their corresponding staff 
-- (show services even if no staff assigned).
SELECT sw.*, s.`role`, s.staff_name
FROM services_weekly sw
LEFT JOIN staff s
ON sw.service = s.service;

-- Display all patients and their service's weekly statistics (if available).
SELECT p.patient_id, p.`name`, p.age, sw.`week`, sw.`month`, 
	sw.service, sw.available_beds,sw.patients_admitted, sw.patients_refused, 
    sw.patients_request, sw.patient_satisfaction
FROM patients p
right JOIN services_weekly sw
ON sw.service = p.service;




