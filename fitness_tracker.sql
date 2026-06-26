--Query 1 — What is the average activity level per user?
SELECT 
    "Id",
    ROUND(AVG("TotalSteps")::numeric, 0) AS avg_steps,
    ROUND(AVG("Calories")::numeric, 0) AS avg_calories,
    ROUND(AVG("VeryActiveMinutes")::numeric, 1) AS avg_very_active_mins,
    ROUND(AVG("SedentaryMinutes")::numeric, 1) AS avg_sedentary_mins
FROM daily_activity
GROUP BY "Id"
ORDER BY avg_steps DESC;


--Query 2 — Which users meet the 10,000 steps goal consistently?
SELECT 
    "Id",
    COUNT(*) AS total_days,
    SUM(CASE WHEN "TotalSteps" >= 10000 THEN 1 ELSE 0 END) AS days_goal_met,
    ROUND(SUM(CASE WHEN "TotalSteps" >= 10000 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS goal_achievement_pct
FROM daily_activity
GROUP BY "Id"
ORDER BY goal_achievement_pct DESC;


--Query 3 — What percentage of time do users spend sedentary?
SELECT
    "Id",
    ROUND(AVG("SedentaryMinutes") * 100.0 / 
          (AVG("VeryActiveMinutes") + AVG("FairlyActiveMinutes") + 
           AVG("LightlyActiveMinutes") + AVG("SedentaryMinutes")), 1) AS sedentary_pct
FROM daily_activity  
GROUP BY "Id"
ORDER BY sedentary_pct DESC;

--Query 4 — How does sleep affect next day's step count?
SET datestyle = 'ISO, MDY';

SELECT
    s."Id",
    ROUND(AVG(s."TotalMinutesAsleep") / 60.0, 1) AS avg_hours_sleep,
    ROUND(AVG(d."TotalSteps")::numeric, 0) AS avg_steps,
    ROUND(AVG(d."Calories")::numeric, 0) AS avg_calories
FROM sleep_day s
JOIN daily_activity d ON s."Id" = d."Id"
GROUP BY s."Id"
ORDER BY avg_hours_sleep DESC;

--Query 5 — What are the most and least active hours across all users?
SELECT
    EXTRACT(HOUR FROM "ActivityHour"::timestamp) AS hour_of_day,
    ROUND(AVG("StepTotal")::numeric, 0) AS avg_steps,
    SUM("StepTotal") AS total_steps
FROM hourly_steps
GROUP BY hour_of_day
ORDER BY avg_steps DESC;