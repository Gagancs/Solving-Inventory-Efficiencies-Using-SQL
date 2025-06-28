
-- Create the Date Dimension Table
CREATE TABLE Dim_Date ( Date_SK INT IDENTITY(1,1) PRIMARY KEY, Date DATE, Day INT, Month INT, Year INT, Seasonality NVARCHAR(50)
);
-- Create the Store Dimension Table
CREATE TABLE Dim_Store ( Store_SK INT IDENTITY(1,1) PRIMARY KEY, Store_ID NVARCHAR(50), Region NVARCHAR(50)
);
-- Create the Product Dimension Table
CREATE TABLE Dim_Product ( Product_SK INT IDENTITY(1,1) PRIMARY KEY, Product_ID NVARCHAR(50), Category NVARCHAR(255)
);
-- Create the Weather Dimension Table
CREATE TABLE Dim_Weather ( Weather_SK INT IDENTITY(1,1) PRIMARY KEY, Weather_Condition NVARCHAR(255)
);
-- Create the Fact Table
CREATE TABLE Fact_Inventory_Sales ( Inventory_Sales_SK INT IDENTITY(1,1) PRIMARY KEY, Date_SK INT FOREIGN KEY REFERENCES Dim_Date(Date_SK), Store_SK INT FOREIGN KEY REFERENCES Dim_Store(Store_SK), Product_SK INT FOREIGN KEY REFERENCES Dim_Product(Product_SK), Weather_SK INT FOREIGN KEY REFERENCES Dim_Weather(Weather_SK), Inventory_Level INT, Units_Sold INT, Units_Ordered INT, Demand_Forecast DECIMAL(10, 2), Price DECIMAL(10, 2), Discount DECIMAL(10, 2), Holiday_Promotion INT, Competitor_Pricing DECIMAL(10, 2)
);