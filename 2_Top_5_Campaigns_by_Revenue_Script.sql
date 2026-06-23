/* 2. Top 5 Campaigns by Revenue
Which 5 campaigns generated the highest revenue? */

SELECT TOP 5
	ca.campaign_name,
	ch.channel_name,
	FORMAT(cp.revenue, 'N2') AS Revenue
FROM campaign_performance cp
INNER JOIN campaigns_info ca
ON cp.campaign_id = ca.campaign_id
INNER JOIN channel_info ch
ON ca.channel_id = ch.channel_id
ORDER BY cp.revenue DESC;