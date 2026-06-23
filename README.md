# marketing_campaign_roi_tracker
End-to-end Data Analyst project using SQL, Excel and PowerBI

# Marketing Campaign ROI Tracker — 2024

## Project Overview
An end-to-end data analytics project analyzing 50 marketing campaigns across 5 channels (Email, Social Media, Paid Ads, SMS and Influencer) to identify the most profitable channels, top performing campaigns and efficiency patterns — enabling data driven marketing budget decisions.

## Tools Used
- SQL Server — Database design, SQL View and 10 analytical queries
- Microsoft Excel — Data cleaning, KPI summary and 3 charts
- Microsoft Power BI — 3 page interactive dashboard

## Database Schema
- channel_info — 5 marketing channels
- campaigns_info — 50 campaigns with budget and dates
- campaign_performance — Impressions, clicks, leads, 
  conversions, actual cost and revenue per campaign

## Key Insights
- Email delivers highest ROI of 462% — 22x better than SMS at 20.59%
- New Year Sale Email Blast is the single best campaign at 566.67% ROI
- 58% of campaigns classified as Highly Efficient using weighted scorecard
- SMS campaigns barely breaking even — average CPA of Rs.244 vs Email's Rs.68
- Paid Ads generated highest total revenue of Rs.73,12,000
- Top 9 out of 10 highest ROI campaigns are Email campaigns
- September SMS Campaign recorded negative ROI of -3.23%

## Business Recommendations
- Reallocate SMS budget to Email campaigns — saving Rs.2,04,000 annually with significantly better returns
- Increase Email marketing budget — highest ROI, CTR and Conversion Rate across all channels
- Review Influencer campaigns — high spend (Rs.14,03,000) but only 196.51% ROI vs Email's 462%
- Scale festive season campaigns — Diwali, Navratri and Independence Day consistently outperform regular campaigns
- Introduce performance based budgeting — allocate more to channels with CPA below Rs.100

## SQL Queries
10 analytical queries covering:
1. Campaign Performance Overview
2. Top 5 Campaigns by Revenue
3. Channel wise Total Spend and Revenue
4. ROI Calculation per Campaign
5. Click Through Rate (CTR) per Campaign
6. Conversion Rate per Campaign
7. Cost Per Acquisition (CPA) per Campaign
8. Channel wise ROI Comparison
9. Budget vs Actual Cost Analysis
10. Campaign Efficiency Score

## Campaign Efficiency Scorecard
Built a weighted efficiency model combining 4 metrics:
- ROI — Higher is better (scored 1-3 vs dataset average)
- CTR — Higher is better (scored 1-3 vs dataset average)
- Conversion Rate — Higher is better (scored 1-3 vs average)
- CPA — Lower is better (scored 1-3 vs dataset average)

Final Efficiency Ratings:
- Score 10-12 → Highly Efficient (29 campaigns — 58%)
- Score 7-9  → Efficient (14 campaigns — 28%)
- Score 4-6  → Average (7 campaigns — 14%)
- Below 4   → Inefficient (0 campaigns — 0%)

## Power BI Dashboard

### Page 1 — Campaign Overview
![Campaign Overview]C:\Users\Sandhya\OneDrive\Desktop\MARKETING CAMPAIGN ROI TRACKER\PowerBI Reports

### Page 2 — Channel Analysis
![Channel Analysis]C:\Users\Sandhya\OneDrive\Desktop\MARKETING CAMPAIGN ROI TRACKER\PowerBI Reports

### Page 3 — Efficiency Analysis
![Efficiency Analysis]C:\Users\Sandhya\OneDrive\Desktop\MARKETING CAMPAIGN ROI TRACKER\PowerBI Reports

## Contact
Your Name: Nadimidoddi Sandhya Rani
Email: nsandhyarani729@gmail.com
