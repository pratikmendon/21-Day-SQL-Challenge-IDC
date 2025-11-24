/*
Create a comprehensive personnel and patient list showing: 
identifier (patient_id or staff_id), full name, type ('Patient' or 'Staff'), and associated service. 
Include only those in 'surgery' or 'emergency' services. Order by type, then service, then name.
*/
SELECT 
	patient_id AS identifier_id,
    `name` AS full_name,
    "Patient" AS `type`, 
    service
FROM patients
WHERE service IN ("emergency", "surgery")
UNION ALL
SELECT 
	staff_id AS identifier_id,
    staff_name AS full_name,
    "Staff" AS `type`,
    service
FROM staff
WHERE service IN ("emergency", "surgery")
ORDER BY `type`, service, full_name;



