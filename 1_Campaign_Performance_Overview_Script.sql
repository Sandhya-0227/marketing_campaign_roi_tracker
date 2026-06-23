/* 1. Campaign Performance Overview
List all campaigns with their channel name, budget, actual cost and revenue. 
Also show budget variance (budget minus actual cost). */

SELECT 
	ca.campaign_id,
	ca.campaign_name,
	ch.channel_name,
	FORMAT(ca.budget, 'N2') AS Budget,
	FORMAT(cp.actual_cost, 'N2') AS Actual_Cost,
	FORMAT(cp.revenue, 'N2') AS Revenue,
	FORMAT((ca.budget - cp.actual_cost), 'N2') AS Variance
FROM campaigns_info ca
INNER JOIN  channel_info ch
ON ca.channel_id = ch.channel_id
INNER JOIN campaign_performance cp
ON ca.campaign_id = cp.campaign_id
ORDER BY Variance DESC;
