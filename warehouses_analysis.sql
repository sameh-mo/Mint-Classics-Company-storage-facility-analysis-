USE mintclassics;
/**
- find products with lowest order quanitiy 
- find products with highest quantity in stock 
- find the warehouse with lowest pct capacity
**/ 

-- aggregating total revenue and quantity orderd  for each product that has ordered and shipped successfully
WITH CTE_orders AS(
SELECT  productCode,
		SUM(quantityOrdered) AS totalOrderedQuantity,
        SUM(quantityOrdered * priceEach) AS sumRevenue
FROM orderdetails
INNER JOIN orders 
ON orderdetails.orderNumber = orders.orderNumber
WHERE status = 'Shipped'
GROUP BY productCode
), 

-- combining data from multiple tables to get one source has all details for each product
products_info AS(
SELECT  p.productCode,
		P.productName,
		p.quantityInStock, 
        p.buyPrice,
        -- converting each null value to zero to be able to do math calculations
        w.warehouseName,
        w.warehousePctCap,
        IFNULL((o.sumRevenue - o.totalOrderedQuantity*p.buyPrice), 0) AS profit,
        (IFNULL(o.totalOrderedQuantity, 0) / quantityInStock) AS orderedToStock 
        
FROM products p
LEFT JOIN CTE_orders o
ON o.productCode = p.productCode
INNER JOIN warehouses w
ON p.warehouseCode = w.warehouseCode

),

suggested_stock AS (
SELECT  *,
		ROUND(orderedToStock * quantityInStock )AS suggested_stock_quantity
FROM products_info 

),

suggested_stock_effect AS (

SELECT 
	   warehouseName,
	   SUM(quantityInStock * buyPrice )AS actual_stock_cost,
       SUM(suggested_stock_quantity * buyPrice )AS suggested_stock_cost,
       (SUM(suggested_stock_quantity * buyPrice ) - SUM(quantityInStock * buyPrice )) AS cost_difference,
	   SUM(quantityInStock ) quantityInStock,
       SUM(suggested_stock_quantity)AS suggested_stock_quantity,
       SUM(suggested_stock_quantity ) - SUM(quantityInStock) AS  quantity_difference,
       warehousePctCap AS old_warehousePctCap
       FROM suggested_stock
       GROUP BY 
				1,
				warehousePctCap
)

SELECT *, 
		ROUND((((quantity_difference  / quantityInStock ) + 1) * (old_warehousePctCap/100) ) * 100, 2)  AS new_warehousePctCap


FROM suggested_stock_effect










