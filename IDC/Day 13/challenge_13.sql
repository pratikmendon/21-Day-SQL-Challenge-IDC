/*
Create a comprehensive report showing patient_id, patient name, age, service, 
and the total number of staff members available in their service. 
Only include patients from services that have more than 5 staff members. 
Order by number of staff descending, then by patient name.
*/

SELECT p.patient_id, p.`name`, p.age, p.service, COUNT(s.staff_id) AS total_staff_members
FROM patients p
INNER JOIN staff s
ON p.service = s.service
GROUP BY 1,2,3,4 -- Numbers refer to SELECT column positions: 1=patient_id, 2=name, 3=age, 4=service
HAVING total_staff_members > 5
ORDER BY total_staff_members DESC;
