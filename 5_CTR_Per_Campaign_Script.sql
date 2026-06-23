/* 5. Click Through Rate (CTR) per Campaign
Calculate CTR for each campaign:
CTR = Clicks / Impressions * 100*/

SELECT 
	campaign_name,
	channel_name,
	impressions,
	clicks,
	ROUND((CAST(clicks AS FLOAT)/ impressions) * 100, 2) AS CTR_Pct
FROM campaign_data
ORDER BY CTR_Pct DESC;