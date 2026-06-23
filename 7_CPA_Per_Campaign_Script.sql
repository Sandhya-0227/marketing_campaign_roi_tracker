/* 7. Cost Per Acquisition (CPA) per Campaign
Calculate CPA:
CPA = Actual Cost / Conversions */

SELECT
	campaign_name,
	channel_name,
	FORMAT(actual_cost, 'N2') AS Actual_Cost,
	conversions,
	FORMAT((Actual_Cost / CAST(conversions AS FLOAT)), 'N2') AS CPA
FROM campaign_data
ORDER BY (Actual_Cost / CAST(conversions AS FLOAT)) ASC;