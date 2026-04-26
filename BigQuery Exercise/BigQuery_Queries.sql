SELECT *
FROM `brightlearn-493417.default.retail_sales` LIMIT 10

-- 1: Filter all transactions that occurred in the year 2023.
SELECT *
FROM `brightlearn-493417.default.retail_sales`
WHERE EXTRACT(YEAR FROM Date) = 2023;

-- 2: Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset.
SELECT *
FROM `brightlearn-493417.default.retail_sales`
WHERE `Total Amount` > ( SELECT AVG(`Total Amount`)
    FROM `brightlearn-493417.default.retail_sales`);

-- 3: Calculate the total revenue (sum of Total Amount). (456000)
SELECT SUM(`Total Amount`) AS Total_Revenue
FROM `brightlearn-493417.default.retail_sales`;

-- 4: Display all distinct Product Categories in the dataset. (3 types)
SELECT DISTINCT `Product Category`
FROM `brightlearn-493417.default.retail_sales`;

-- 5: For each Product Category, calculate the total quantity sold.
SELECT
    `Product Category`,
    SUM(Quantity) AS Total_Quantity
FROM `brightlearn-493417.default.retail_sales`
GROUP BY `Product Category`;

-- 6: Create a column called Age_Group that classifies customers
SELECT
    `Customer ID`,
    Age,
    CASE
        WHEN Age < 30 THEN 'Youth'
        WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
        WHEN Age >= 60 THEN 'Senior'
    END AS Age_Group
FROM `brightlearn-493417.default.retail_sales`;

-- 7: For each Gender, count how many high-value transactions occurred (where Total Amount > 500).
SELECT
    Gender,
    COUNT(*) AS High_Value_Transactions
FROM `brightlearn-493417.default.retail_sales`
WHERE `Total Amount` > 500
GROUP BY Gender;

-- 8: For each Product Category, show only those categories where the total revenue exceeds 5,000.
SELECT
    `Product Category`,
    SUM(`Total Amount`) AS Total_Revenue
FROM `brightlearn-493417.default.retail_sales`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;

-- 9: Display a new column called Unit_Cost_Category that labels a transaction
SELECT
    `Transaction ID`,
    `Price per Unit`,
    CASE
        WHEN `Price per Unit` < 50 THEN 'Cheap'
        WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
        ELSE 'Expensive'
    END AS Unit_Cost_Category
FROM `brightlearn-493417.default.retail_sales`;

-- 10: Display all transactions from customers aged 40 or older and add a column Spending_Level
SELECT
    `Customer ID`,
    Age,
    `Total Amount`,
    CASE
        WHEN `Total Amount` > 1000 THEN 'High'
        ELSE 'Low'
    END AS Spending_Level
FROM `brightlearn-493417.default.retail_sales`
WHERE Age >= 40;
