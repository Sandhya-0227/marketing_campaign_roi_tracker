CREATE VIEW campaign_data AS 
	SELECT 
		ca.campaign_id,
		ca.campaign_name,
		ch.channel_id,
		ch.channel_name,
		ca.start_date,
		ca.end_date,
		ca.budget,
		cp.performance_id,
		cp.impressions,
		cp.clicks,
		cp.leads,
		cp.conversions,
		cp.actual_cost,
		cp.revenue
	FROM campaigns_info ca
	INNER JOIN campaign_performance cp
	ON ca.campaign_id = cp.campaign_id
	INNER JOIN channel_info ch
	ON ca.channel_id = ch.channel_id


	