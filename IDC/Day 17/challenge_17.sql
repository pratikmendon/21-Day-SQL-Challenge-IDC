SELECT
	s.service,
	s.total_admitted,
CASE WHEN s.total_admitted > avg_admitted THEN 'Above Average'
   WHEN s.total_admitted = avg_admitted THEN 'Average'
   ELSE 'Below Average'
   END AS rank_indicator
FROM 
   (
    SELECT 
    service,
    SUM(patients_admitted) AS total_admitted
   FROM services_weekly
   GROUP BY service) AS s
CROSS JOIN (
     SELECT 
       AVG(patients_admitted) AS avg_admitted
		 FROM services_weekly) AS overall
ORDER BY s.total_admitted DESC;