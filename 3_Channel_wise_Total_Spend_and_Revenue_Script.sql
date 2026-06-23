/* 3. Channel wise Total Spend and Revenue
For each channel show total budget, total actual cost and total revenue. */

SELECT 
	channel_name,
	FORMAT(SUM(budget), 'N2') AS Total_Budget,
	FORMAT(SUM(actual_cost), 'N2') AS Total_Actual_Cost,
	FORMAT(SUM(revenue), 'N2') AS Total_revenue
FROM campaign_data
GROUP BY channel_name
ORDER BY SUM(revenue) DESC;
