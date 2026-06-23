/* 9. Budget vs Actual Cost Analysis
Find campaigns that went over budget and under budget. 
Show variance amount and variance percentage. 
Flag campaigns as Over Budget or Under Budget. */

SELECT 
	campaign_name,
	FORMAT(budget, 'N2') AS Budget,
	FORMAT(actual_cost, 'N2') AS Actual_Cost,
	(budget - actual_cost) AS Variance,
	FORMAT((budget - actual_cost) / budget * 100, 'N2') AS Variance_Pct,
	CASE 
		WHEN actual_cost > budget THEN 'over_budget'
		ELSE 'under_budget'
	END AS Flag,
	CASE
    WHEN (budget - actual_cost) / budget * 100 < 2 THEN 'Near Limit'
    WHEN (budget - actual_cost) / budget * 100 < 5 THEN 'Tight'
    ELSE 'Comfortable'
END AS Budget_Health
FROM campaign_data
ORDER BY Variance DESC;