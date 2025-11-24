-- Combine patient names and staff names into a single list.
SELECT `name` AS `names`
FROM patients
UNION ALL
SELECT staff_name
FROM staff;

-- Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
SELECT `name`, IF(satisfaction > 90, "High Satisfaction","") AS satisfaction_score
FROM patients
WHERE satisfaction > 90
UNION ALL
SELECT `name`, IF(satisfaction < 50, "Low Satisfaction","") AS satisfaction_score
FROM patients
WHERE satisfaction < 50;


-- List all unique names from both patients and staff tables.
SELECT `name` AS `names`
FROM patients
UNION
SELECT staff_name
FROM staff;
