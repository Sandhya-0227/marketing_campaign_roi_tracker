/* 8. Channel wise ROI Comparison
For each channel calculate:
Total spend
Total revenue
Overall ROI
Average CTR
Average Conversion Rate */

WITH total_spend_n_total_revenue AS (
	SELECT 
	channel_name,
	FORMAT(SUM(budget), 'N2') AS Total_Budget,
	FORMAT(SUM(actual_cost), 'N2') AS Total_Actual_Cost,
	FORMAT(SUM(revenue), 'N2') AS Total_revenue
FROM campaign_data
GROUP BY channel_name
),

roi_calculation AS (
	SELECT 
	campaign_name,
	channel_name,
	FORMAT(actual_cost, 'N2') AS Actual_Cost,
	FORMAT(revenue, 'N2') AS Revenue,
	FORMAT((revenue - actual_cost) / actual_cost * 100.0, 'N2') AS ROI_Pct
FROM campaign_data
--ORDER BY ROUND((revenue - actual_cost) / actual_cost * 100.0, 2) DESC;
),

ctr_calculation AS (
	SELECT 
	campaign_name,
	channel_name,
	impressions,
	clicks,
	ROUND((CAST(clicks AS FLOAT)/ impressions) * 100, 2) AS CTR_Pct
FROM campaign_data
),

conversion_rate AS (
	SELECT
	campaign_name,
	channel_name,
	clicks,
	conversions,
	ROUND((conversions / CAST(clicks AS FLOAT)) * 100, 2) AS Conversion_Rate
FROM campaign_data
),

overall_list AS (
	SELECT 
		rc.campaign_name,
		sr.channel_name,
		sr.Total_Actual_Cost,
		sr.Total_revenue,
		rc.ROI_Pct,
		cc.CTR_Pct,
		cr.Conversion_Rate
	FROM total_spend_n_total_revenue sr
	INNER JOIN roi_calculation rc
	ON sr.channel_name = rc.channel_name
	INNER JOIN ctr_calculation cc
	ON sr.channel_name = cc.channel_name
	INNER JOIN conversion_rate cr
	ON sr.channel_name = cr.channel_name
),

channel_wise_data AS (
    SELECT
        channel_name,
        ROUND((SUM(revenue) - SUM(actual_cost)) / 
              SUM(actual_cost) * 100.0, 2) AS Overall_ROI,
        ROUND(AVG(CAST(clicks AS FLOAT) / 
              impressions * 100), 2) AS Avg_CTR_Pct,
        ROUND(AVG(CAST(conversions AS FLOAT) / 
              clicks * 100), 2) AS Avg_Conversion_Rate
    FROM campaign_data
    GROUP BY channel_name
)

SELECT 
	tt.channel_name,
	Total_Actual_Cost,
	Total_revenue,
	Overall_ROI,
	Avg_CTR_Pct,
	Avg_Conversion_Rate
FROM total_spend_n_total_revenue tt
INNER JOIN channel_wise_data cd
ON tt.channel_name = cd.channel_name
ORDER BY Overall_ROI DESC;


---Simplified Query

WITH channel_metrics AS (
    SELECT
        channel_name,
        SUM(budget) AS Total_Budget,
        SUM(actual_cost) AS Total_Actual_Cost,
        SUM(revenue) AS Total_Revenue,
        ROUND((SUM(revenue) - SUM(actual_cost)) /
              SUM(actual_cost) * 100.0, 2) AS Overall_ROI,
        ROUND(AVG(CAST(clicks AS FLOAT) /
              impressions * 100), 2) AS Avg_CTR_Pct,
        ROUND(AVG(CAST(conversions AS FLOAT) /
              clicks * 100), 2) AS Avg_Conversion_Rate
    FROM campaign_data
    GROUP BY channel_name
)
SELECT
    channel_name,
    FORMAT(Total_Budget, 'N2') AS Total_Budget,
    FORMAT(Total_Actual_Cost, 'N2') AS Total_Actual_Cost,
    FORMAT(Total_Revenue, 'N2') AS Total_Revenue,
    FORMAT(Overall_ROI, 'N2') AS Overall_ROI_Pct,
    FORMAT(Avg_CTR_Pct, 'N2') AS Avg_CTR_Pct,
    FORMAT(Avg_Conversion_Rate, 'N2') AS Avg_Conversion_Rate
FROM channel_metrics
ORDER BY Overall_ROI DESC;