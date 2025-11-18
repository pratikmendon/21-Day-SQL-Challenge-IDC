/*
Create a staff utilisation report showing all staff members 
(staff_id, staff_name, role, service) and the count of weeks they were present (from staff_schedule). 
Include staff members even if they have no schedule records. Order by weeks present descending.
*/
SELECT s.staff_id, s.staff_name, s.`role`, s.service, 
		coalesce(SUM(ss.present), 0) as total_weeks_present
FROM staff s
left JOIN staff_schedule ss
ON s.staff_id = ss.staff_id
GROUP BY 1,2,3,4
ORDER BY total_weeks_present DESC;




