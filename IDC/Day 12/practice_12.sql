-- Find all weeks in services_weekly where no special event occurred.
SELECT `WEEK`, str_to_date(concat('2025', `week`, 'Sunday'), '%X %V %W') AS week_start_date
FROM services_weekly 
WHERE (`event` IS NULL) OR (`event` = 'none');

-- Count how many records have null or empty event values.
SELECT Count(*)
FROM services_weekly 
WHERE (`event` IS NULL) OR (`event` = 'none');

-- List all services that had at least one week with a special event.
SELECT service, Count(*) AS COUNTS
FROM services_weekly
WHERE (`event` IS NOT NULL) AND (`event` != 'none')
GROUP BY service
HAVING Counts >= 1;



