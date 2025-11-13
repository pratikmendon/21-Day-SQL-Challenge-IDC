-- Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
SELECT *,
	   CASE
			WHEN satisfaction >= 80 THEN "High"
            WHEN satisfaction >= 50 THEN "Medium"
            ELSE "Low"
		END AS satisfaction_category
FROM patients;


-- Label staff roles as 'Medical' or 'Support' based on role type.
SELECT *,
	   CASE 
			WHEN `role` = "Doctor" THEN "Medical"
            ELSE "Support"
		END AS staff_category
FROM staff;


-- Create age groups for patients (0-18, 19-40, 41-65, 65+).
SELECT *,
	   CASE 
			WHEN age >= 65 then "65+"
            WHEN age BETWEEN 41 AND 65 THEN "41-65"
            WHEN age BETWEEN 19 AND 40 THEN "19-40"
			else "0-18"
		END AS age_category
FROM patients;