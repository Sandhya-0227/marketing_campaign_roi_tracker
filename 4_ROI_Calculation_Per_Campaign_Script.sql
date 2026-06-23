/* 4. ROI Calculation per Campaign
Calculate ROI for each campaign:
ROI = (Revenue - Actual Cost) / Actual Cost * 100 */

SELECT 
	campaign_name,
	channel_name,
	FORMAT(actual_cost, 'N2') AS Actual_Cost,
	FORMAT(revenue, 'N2') AS Revenue,
	FORMAT((revenue - actual_cost) / actual_cost * 100.0, 'N2') AS ROI_Pct
FROM campaign_data
ORDER BY ROUND((revenue - actual_cost) / actual_cost * 100.0, 2) DESC;