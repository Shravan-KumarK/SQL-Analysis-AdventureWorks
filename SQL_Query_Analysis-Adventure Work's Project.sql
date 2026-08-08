Create database Adventure_Works;
use adventure_works;
Show tables;

### Q0-Union of Fact Internet sales and Fact internet sales new
CREATE VIEW Sales AS SELECT *FROM FactInternetSales UNION ALL SELECT *FROM Fact_Internet_Sales_New;

# Verify the View
SELECT *FROM Sales LIMIT 10;

### Q1
CREATE VIEW sales_1 AS 
SELECT f.*,
    p.EnglishProductName AS ProductName
FROM sales f
LEFT JOIN dimproduct p
ON f.ProductKey = p.ProductKey;

# Verify
select *from sales_1 LIMIT 10;

### Q2
CREATE VIEW sales_2 AS
SELECT s.*,
    CONCAT(c.FirstName, ' ' , c.MiddleName , ' ', c.LastName) AS CustomerFullName,
    p.EnglishProductName AS ProductName,
    p.ListPrice AS Unit_Price
FROM sales s
LEFT JOIN dimcustomer c
    ON s.CustomerKey = c.CustomerKey
LEFT JOIN dimproduct p
    ON s.ProductKey = p.ProductKey;
    
### Q3
CREATE VIEW Sales_Date AS
SELECT
    OrderDateKey,
    STR_TO_DATE(OrderDateKey, '%Y%m%d') AS OrderDate,
    YEAR(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS Year,
    MONTH(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS MonthNo,

### Q3(C,D,E)
 MONTHNAME(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS MonthFullName,
    CONCAT('Q', QUARTER(STR_TO_DATE(OrderDateKey, '%Y%m%d'))) AS Quarter,
    CONCAT(YEAR(STR_TO_DATE(OrderDateKey, '%Y%m%d')),'-',
           LEFT(MONTHNAME(STR_TO_DATE(OrderDateKey, '%Y%m%d')), 3)) AS YearMonth,
           
-- Q3(F,G,H,I)

DAYOFWEEK(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS WeekdayNo,
DAYNAME(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS WeekdayName,
CASE
    WHEN MONTH(STR_TO_DATE(OrderDateKey, '%Y%m%d')) >= 4 THEN MONTH(STR_TO_DATE(OrderDateKey, '%Y%m%d')) - 3
    ELSE MONTH(STR_TO_DATE(OrderDateKey, '%Y%m%d')) + 9
END AS FinancialMonth,
CASE
    WHEN MONTH(STR_TO_DATE(OrderDateKey, '%Y%m%d')) BETWEEN 4 AND 6 THEN 'Q1'
    WHEN MONTH(STR_TO_DATE(OrderDateKey, '%Y%m%d')) BETWEEN 7 AND 9 THEN 'Q2'
    WHEN MONTH(STR_TO_DATE(OrderDateKey, '%Y%m%d')) BETWEEN 10 AND 12 THEN 'Q3'
    ELSE 'Q4'
END AS FinancialQuarter
FROM sales_2;
select * from sales_Date;

-- Q4 & Q5
DROP VIEW IF EXISTS Sales_Calculations;

CREATE VIEW Sales_Calculations AS
SELECT
    s.*,

    (s.Unit_Price * s.OrderQuantity * (1 - s.UnitPriceDiscountPct))
    AS CalculatedSalesAmount,

    (s.ProductStandardCost * s.OrderQuantity)
    AS ProductionCost

FROM sales_2 s;


SELECT
    ProductName,
    CustomerFullName,
    OrderQuantity,
    Unit_Price,
    ProductStandardCost,
    CalculatedSalesAmount,
    ProductionCost
FROM Sales_Calculations;

-- Q6, Q7, Q8

DESCRIBE sales;
DESCRIBE sales_2;

-- Q6 Profit
SELECT
    CalculatedSalesAmount,
    ProductionCost,
    ROUND((CalculatedSalesAmount - ProductionCost),2) AS Profit
FROM sales_calculations;

-- Q7 Year-wise Sales
SELECT
    YEAR(STR_TO_DATE(OrderDateKey,'%Y%m%d')) AS Year,
    round(SUM(SalesAmount),2) AS Total_Sales
FROM sales
GROUP BY YEAR(STR_TO_DATE(OrderDateKey,'%Y%m%d'))
ORDER BY Year;

-- Q8 Month-wise Sales
SELECT
    MONTHNAME(STR_TO_DATE(OrderDateKey,'%Y%m%d')) AS Month_Name,
    round(SUM(SalesAmount),2) AS Total_Sales
FROM sales
GROUP BY
    MONTH(STR_TO_DATE(OrderDateKey,'%Y%m%d')),
    MONTHNAME(STR_TO_DATE(OrderDateKey,'%Y%m%d'))
ORDER BY MONTH(STR_TO_DATE(OrderDateKey,'%Y%m%d'));

#Q9- QUARTER-WISE SALES
SELECT 
    CONCAT("Q",QUARTER(STR_TO_DATE(OrderDateKey,'%Y%m%d'))) AS QUARTER,
    ROUND(SUM(SALESAMOUNT),2) AS TOTAL_SALES
FROM SALES 
GROUP BY QUARTER
ORDER BY QUARTER;

#Q10- TOP 10 PRODUCTS BY SALES 
SELECT 
    CONCAT(ROUND(SUM(S.SALESAMOUNT)/1000,2),'K') AS SALES,
    P.EnglishProductName AS PRODUCTNAME
FROM SALES S 
JOIN DIMPRODUCT P
ON S.ProductKey=P.ProductKey
GROUP BY P.EnglishProductName
ORDER BY sales DESC
LIMIT 10;

#Q11- TOP 10 CUSTOMERS BY SALES 
SELECT
	CONCAT(ROUND(SUM(S.SALESAMOUNT)/1000,2),'K') AS SALES,
    CONCAT(c.FirstName, ' ' , c.MiddleName , ' ', c.LastName) AS CustomerFullName
FROM SALES S 
JOIN DIMCUSTOMER C 
ON S.CUSTOMERKEY=C.CUSTOMERKEY
GROUP BY CustomerFullName
ORDER BY SALES DESC
LIMIT 10;

SELECT *FROM DIMSALESTERRITORY;
#Q-12 - REGION BY SALES 
SELECT
    T.SalesTerritoryRegion AS REGION,
    CONCAT(ROUND(SUM(S.SALESAMOUNT)/1000,2),'K') AS SALES
FROM SALES S 
JOIN DIMSALESTERRITORY T
ON S.SalesterritoryKey=T.SalesterritoryKey
GROUP BY REGION
ORDER BY SALES DESC;

    
     