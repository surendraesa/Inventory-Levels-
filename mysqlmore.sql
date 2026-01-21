SELECT * FROM more.chain limit 20;
--Q1.  Where items have a stock level below their minimum required stock?
 SELECT item , total_soh, min_stock
 FROM chain
 WHERE  total_soh < min_stock ;
 --Q2.  Top 5 departments based on the total value of stock on hand?
 SELECT dep_name
 SUM(StockQuantity * UnitPrice) AS TotalStockValue
FROM chain
GROUP BY DepartmentName
ORDER BY TotalStockValue DESC
LIMIT 5;
--Q3.   Which items have more total_value than currently on hand?
SELECT 
    item, 
    item_desc, 
    total_value, 
    StockOnHand
FROM chain
WHERE total_value> StockOnHand ;
 --Q4.  What is the average unit cost of items within each family_name?
 SELECT 
    family_name, 
    AVG(unit_cost) AS average_unit_cost
FROM chain
GROUP BY family_name;
--Q5. How many distinct items are stored in each default_wh (warehouse)?
SELECT 
    default_wh, 
    COUNT(DISTINCT item_id) AS total_distinct_items
FROM chain
GROUP BY default_wh;

 