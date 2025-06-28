
/**********************************************************************************
* Indexes for the Urban Retail Co. Analytics Database
**********************************************************************************/

-- =================================================================================
-- Step 1: Create indexes on all Foreign Key columns in the Fact Table.
-- =================================================================================

-- Index on the Date foreign key in Fact_Inventory_Sales
CREATE INDEX IX_Fact_Inventory_Sales_Date_SK
ON Fact_Inventory_Sales (Date_SK);

-- Index on the Store foreign key in Fact_Inventory_Sales
CREATE INDEX IX_Fact_Inventory_Sales_Store_SK
ON Fact_Inventory_Sales (Store_SK);

-- Index on the Product foreign key in Fact_Inventory_Sales
CREATE INDEX IX_Fact_Inventory_Sales_Product_SK
ON Fact_Inventory_Sales (Product_SK);

-- Index on the Weather foreign key in Fact_Inventory_Sales
CREATE INDEX IX_Fact_Inventory_Sales_Weather_SK
ON Fact_Inventory_Sales (Weather_SK);


-- =================================================================================
-- Step 2: Create indexes on commonly filtered columns in the Dimension Tables.
-- =================================================================================

-- Index on the actual Date column in Dim_Date for fast range queries
CREATE INDEX IX_Dim_Date_Date
ON Dim_Date (Date);

-- Index on the business key for Products for potential lookups
CREATE INDEX IX_Dim_Product_Product_ID
ON Dim_Product (Product_ID);

-- Index on the business key for Stores for potential lookups
CREATE INDEX IX_Dim_Store_Store_ID
ON Dim_Store (Store_ID);