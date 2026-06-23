/* 6. Conversion Rate per Campaign
Calculate conversion rate: 
Conversion Rate = Conversions / Clicks * 100*/

SELECT
	campaign_name,
	channel_name,
	clicks,
	conversions,
	ROUND((conversions / CAST(clicks AS FLOAT)) * 100, 2) AS Conversion_Rate
FROM campaign_data
ORDER BY Conversion_Rate DESC;