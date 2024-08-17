# Mint-Classics-Company-storage-facility-analysis-
In this project, I will step into the shoes of an entry-level data analyst at the fictional Mint Classics Company, helping to analyze data in a relational database with the goal of supporting inventory-related business decisions that lead to the closure of a storage facility using SQL

# Problem
  helping to analyze data in a relational database with the goal of supporting inventory-related business decisions that lead to the closure of a storage facility using SQL

# Analysis framework  
  i will use **PACE** framework in conducting this analysis  

# 1) Plan ✏
>## Project Objectives
  1. Explore products currently in inventory.
  2. Determine important factors that may influence inventory reorganization/reduction.
  3. Provide analytic insights and data-driven recommendations.
  4. answering the stackholders questions related to inventory and the possibility of redusing number of warehouses
     
     >>1) Where are items stored and if they were rearranged, could a warehouse be eliminated?
                
     >>2) How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?
      
     >>3) Are we storing items that are not moving? Are any items candidates for being dropped from the product line?
      
    
> ## Tools Used
  - MySQL Workbench

# 2) Analyze  📈
> through this step, I used EDA techniques to get insights and understand the company's inventory Data

>### 1. Discovering
>> I started to discover and understand the data and its structure by reading ERD and using SQL queries familiraize myself with tables, columns and its content to start conducting our analysis.
      
>### 2. Structuring
>>1. isolate and identify parts of the data that could be useful in deciding how to reduce inventory. 
>>>2. adding some columns to assist in analysis process and drawing conclusions


| cloumn name  | description |
| -------------  | -------------  |
| profit  | profit for each product (revenue - cost)* total_ordered_quantity  |
| actual_stock_cost  |  the total cost for the stock  |
| orderedToStock |  the percentage of ordered quantity to stored quantity  |
| suggested_stock_cost  | total cost for the suggested quanitiy to keep in stock to maintain the low time required to ship orders  |
| cost_difference  | difference between suggested_stock_cost and actual  |
| suggested_stock_quantity  | suggested quanitiy to keep in stock to maintain the low time required to ship orders  |
| quantityInStock  | actual quantity in stock |
| quantity_difference  | difference between suggested_stock_quantity and actual |
| new_warehousePctCap  | the new capacity of warehouses after restructuring inventory suggestions |
| cost_savings_pct  | cost of stock percentage saved due to applying new suggestions  |
                 
>>>3. create multiple CTEs to make quires simple to read 
>>>4. selecting appropriate columns needed for our analysis from each table 
      
>### 3. Cleaning
>>- replacing null values in columns like [**totalOrderedQuantity**] with 0 to avoid any problems while doing data analysis
      
>### 4. Joining
 >>- joining tables [products, CTE_orders, warehouses] to create one source to perform our analysis on.
      
>### 5. Validating 
>>- ensure the data is qualified and ready to start performing analysis 
                 
>### 6. presenting
>> - As our goal is to minimize number of facilities by  reorganization or reduction our inventory. so after investigation and data analysis of company's inventory i found there is a main factor **ordersToStock** that plays a key role in our analysis. after investigating that factor. I found there are many products through the period i analyze [from 2003-01-06 to 2005-05-31] have huge stock with approximately no orders. However, there are products have high orders quantities exceeds the stock we have. so depending on that factor i suggested quantites that are suitable for each product based on the ordersToStock ratio to reduce the amount of inventory that don't have low orders and increase the stock for some products to be suitabel for the high order rate compared to the stock we have. for the purpose of maintaining the high level of order response i doubled the amount required to be kept in stock so that the selling don't stop if there is high demand for specific product.
>> - applying such suggestions will decrease the stock in each facility to be able to rearrange inventory stock in order to decrease the number of facilites we have
![image](https://github.com/user-attachments/assets/abb715d8-e176-4b35-9fbc-995719b587e9)


  # 3) Execute📄
  >> after exploring and analyzing the data of Mint Classics Company 
>>>- it is recommended to give more focus for inventory levels and make it fit with number of orders  
>>>>1. after rearranging process of inventory levels in the company's warehousses. it will be much space enable us to empty one or even two of our warehouses
>>>>2. restructring process of inventory will reduce costs of holding inventory that have low profit rate
>>>>3. there is a product needs to be dropped form the product line as it achives zero profits  ['1985 Toyota Supra']
 ![image](https://github.com/user-attachments/assets/ac1eac04-cebe-422b-af48-b65267930c2f)



      
      
 
