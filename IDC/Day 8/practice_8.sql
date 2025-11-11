-- Convert all patient names to uppercase.
SELECT `name` , UPPER(`name`) AS upper_name
FROM patients;

-- Find the length of each staff member's name.
SELECT staff_name, LENGTH(staff_name) AS name_length
FROM staff;

-- Concatenate staff_id and staff_name with a hyphen separator.
SELECT staff_id, staff_name, CONCAT_WS("-", staff_id, staff_name) AS staff_id_name
FROM staff;

