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
)

-- combining data from multiple tables to get one source has all details for each product

SELECT  p.productCode,
		P.productName,
		p.quantityInStock, 
        p.buyPrice,
        -- converting each null value to zero to be able to do math calculations
        w.warehouseName,
        w.warehousePctCap,
        IFNULL((o.sumRevenue - o.totalOrderedQuantity*p.buyPrice), 0) AS profit,
        (IFNULL(o.totalOrderedQuantity, 0) / quantityInStock) * 100 AS orderedToStock_pct
        
FROM products p
LEFT JOIN CTE_orders o
ON o.productCode = p.productCode
INNER JOIN warehouses w
ON p.warehouseCode = w.warehouseCode













