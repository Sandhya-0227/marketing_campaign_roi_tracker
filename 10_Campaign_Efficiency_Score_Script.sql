/* 10. Campaign Efficiency Score
Create a comprehensive efficiency score for each campaign combining:
ROI (higher is better)
CTR (higher is better)
Conversion Rate (higher is better)
CPA (lower is better)
Rank campaigns from most efficient to least efficient! */

WITH averages AS (
    SELECT
        AVG((revenue - actual_cost) / actual_cost * 100.0) AS Avg_ROI,
        AVG(CAST(clicks AS FLOAT) / impressions * 100) AS Avg_CTR,
        AVG(CAST(conversions AS FLOAT) / clicks * 100) AS Avg_Conv_Rate,
        AVG(actual_cost / CAST(conversions AS FLOAT)) AS Avg_CPA
    FROM campaign_data
),
campaign_metrics AS (
    SELECT
        campaign_name,
        channel_name,
        (revenue - actual_cost) / actual_cost * 100.0 AS ROI,
        CAST(clicks AS FLOAT) / impressions * 100 AS CTR,
        CAST(conversions AS FLOAT) / clicks * 100 AS Conv_Rate,
        actual_cost / CAST(conversions AS FLOAT) AS CPA
    FROM campaign_data
),
campaign_scores AS (
    SELECT
        cm.campaign_name,
        cm.channel_name,
        ROUND(cm.ROI, 2) AS ROI,
        ROUND(cm.CTR, 2) AS CTR,
        ROUND(cm.Conv_Rate, 2) AS Conv_Rate,
        ROUND(cm.CPA, 2) AS CPA,
        CASE
            WHEN cm.ROI > av.Avg_ROI THEN 3
            WHEN cm.ROI > av.Avg_ROI * 0.8 THEN 2
            ELSE 1
        END AS ROI_Score,
        CASE
            WHEN cm.CTR > av.Avg_CTR THEN 3
            WHEN cm.CTR > av.Avg_CTR * 0.8 THEN 2
            ELSE 1
        END AS CTR_Score,
        CASE
            WHEN cm.Conv_Rate > av.Avg_Conv_Rate THEN 3
            WHEN cm.Conv_Rate > av.Avg_Conv_Rate * 0.8 THEN 2
            ELSE 1
        END AS Conv_Score,
        CASE
            WHEN cm.CPA < av.Avg_CPA THEN 3
            WHEN cm.CPA < av.Avg_CPA * 1.2 THEN 2
            ELSE 1
        END AS CPA_Score
    FROM campaign_metrics cm
    CROSS JOIN averages av
),
final_scores AS (
    SELECT
        campaign_name,
        channel_name,
        ROI,
        CTR,
        Conv_Rate,
        CPA,
        ROI_Score + CTR_Score + Conv_Score + CPA_Score AS Total_Score,
        CASE
            WHEN ROI_Score + CTR_Score + Conv_Score + CPA_Score >= 10 THEN 'Highly Efficient'
            WHEN ROI_Score + CTR_Score + Conv_Score + CPA_Score >= 7 THEN 'Efficient'
            WHEN ROI_Score + CTR_Score + Conv_Score + CPA_Score >= 4 THEN 'Average'
            ELSE 'Inefficient'
        END AS Efficiency_Rating
    FROM campaign_scores
)
SELECT
    campaign_name,
    channel_name,
    ROI,
    CTR,
    Conv_Rate,
    CPA,
    Total_Score,
    Efficiency_Rating
FROM final_scores
ORDER BY Total_Score DESC;



