-- Join patients and staff based on their common service field (show patient and staff who work in same service)
SELECT p.`name`, s.staff_name
FROM patients p
INNER JOIN staff s
ON p.service = s.service;

-- Join services_weekly with staff to show weekly service data with staff information.
SELECT sw.*, s.staff_name, s.`role`
FROM services_weekly sw
INNER JOIN staff s
ON sw.service = s.service;

-- Create a report showing patient information along with staff assigned to their service.
SELECT p.*, s.`role`, s.staff_id, s.staff_name
FROM patients p
INNER JOIN staff s
ON p.service = s.service;

