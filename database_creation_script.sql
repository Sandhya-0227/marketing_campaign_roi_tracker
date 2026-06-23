USE master;

DROP DATABASE IF EXISTS marketing_campaign_database;

CREATE DATABASE marketing_campaign_database;

USE marketing_campaign_database;

-- Drop in correct order (child table first)
DROP TABLE IF EXISTS campaign_performance;
DROP TABLE IF EXISTS campaigns_info;
DROP TABLE IF EXISTS channel_info;

CREATE TABLE channel_info(
    channel_id INT NOT NULL,
    channel_name VARCHAR(50),
    CONSTRAINT pk_channel_id PRIMARY KEY(channel_id)
);

CREATE TABLE campaigns_info(
    campaign_id INT NOT NULL,
    campaign_name VARCHAR(150),
    channel_id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10,2),
    CONSTRAINT pk_campaign_id PRIMARY KEY(campaign_id),
    CONSTRAINT fk_channel_id FOREIGN KEY(channel_id) 
    REFERENCES channel_info(channel_id)
);

CREATE TABLE campaign_performance(
    performance_id INT NOT NULL,
    campaign_id INT NOT NULL,
    impressions INT,
    clicks INT,
    leads INT,
    conversions INT,
    actual_cost DECIMAL(10,2),
    revenue DECIMAL(10,2),
    CONSTRAINT pk_performance_id PRIMARY KEY(performance_id),
    CONSTRAINT fk_campaign_id FOREIGN KEY(campaign_id) 
    REFERENCES campaigns_info(campaign_id)
);