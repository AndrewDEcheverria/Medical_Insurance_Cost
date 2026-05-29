SELECT * FROM medical_insurance_cost
LIMIT 10;

-- 1
SELECT
	gender, 
	smoker, 
    ROUND(AVG(annual_medical_cost_usd), 2) AS avg_medical_cost
FROM medical_insurance_cost
GROUP BY 
	gender, 
    smoker
ORDER BY avg_medical_cost ASC;

-- 2
SELECT 
	customer_id, 
	age, 
	bmi, 
	chronic_diseases, 
	doctor_visits_per_year, 
	annual_medical_cost_usd
FROM medical_insurance_cost
WHERE BMI > 30
AND
	chronic_diseases >= 2
AND
	doctor_visits_per_year >= 5;

-- 3
SELECT 
	insurance_plan,
	COUNT(insurance_plan) AS Total_Customers,
    ROUND(AVG(annual_income_usd), 2)as avg_annual_income,
    ROUND(AVG(annual_medical_cost_usd), 2)as avg_medical_cost,
    ROUND(
		100.0 * SUM(
		CASE WHEN smoker = 'Yes' THEN 1
        ELSE 0
	END
    ) / COUNT(*),
    2
     )AS smoker_percentage
FROM medical_insurance_cost
GROUP BY insurance_plan
ORDER BY avg_medical_cost DESC;


-- 4

SELECT 
customer_id,
region,
annual_medical_cost_usd,
RANK() OVER(
	PARTITION BY region
	ORDER BY annual_medical_cost_usd DESC
)AS regional_cost_rank
FROM medical_insurance_cost;

--5

SELECT
	exercise_level,
	ROUND(AVG(bmi), 2) as avg_bmi,
    ROUND(AVG(doctor_visits_pe), 2) as avg_doctor_visits_per_year,
    ROUND(AVG(hospitalizations), 2)as avg_hospitalizations
from medical_insurance_cost_dataset
GROUP BY exercise_level;

-- 6 


