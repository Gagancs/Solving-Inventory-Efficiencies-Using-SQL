
-- Populate Dim_Date
INSERT INTO Dim_Date (Date, Day, Month, Year, Seasonality)
SELECT DISTINCT CONVERT(DATE, Date), DAY(CONVERT(DATE, Date)), MONTH(CONVERT(DATE, Date)), YEAR(CONVERT(DATE, Date)), Seasonality
FROM Raw_Data;
-- Populate Dim_Store
INSERT INTO Dim_Store (Store_ID, Region)
SELECT DISTINCT [Store ID], Region
FROM Raw_Data;
-- Populate Dim_Product
INSERT INTO Dim_Product (Product_ID, Category)
SELECT DISTINCT [Product ID], Category
FROM Raw_Data;
-- Populate Dim_Weather
INSERT INTO Dim_Weather (Weather_Condition)
SELECT DISTINCT [Weather Condition]
FROM Raw_Data;
-- Populate Fact_Inventory_Sales
INSERT INTO Fact_Inventory_Sales ( Date_SK, Store_SK, Product_SK, Weather_SK, Inventory_Level, Units_Sold, Units_Ordered, Demand_Forecast, Price, Discount, Holiday_Promotion, Competitor_Pricing
)
SELECT d.Date_SK, s.Store_SK, p.Product_SK, w.Weather_SK, r.[Inventory Level], r.[Units Sold], r.[Units Ordered], r.[Demand Forecast], r.Price, r.Discount, r.[Holiday/Promotion], r.[Competitor Pricing]
FROM Raw_Data r
JOIN Dim_Date d ON CONVERT(DATE, r.Date) = d.Date AND r.Seasonality = d.Seasonality
JOIN Dim_Store s ON r.[Store ID] = s.Store_ID AND r.Region = s.Region
JOIN Dim_Product p ON r.[Product ID] = p.Product_ID AND r.Category = p.Category
JOIN Dim_Weather w ON r.[Weather Condition] = w.Weather_Condition;