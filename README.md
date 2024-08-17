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
      
    
> ## Tools Used
  - MySQL Workbench

# 2) Analyze  📈
> through this step, I used EDA techniques to get insights and understand the company's inventory Data

>### 1. Discovering
>> I started to discover and understand the data and its structure by reading ERD and using SQL queries familiraize myself with tables, columns and its content to start conducting our analysis.
      
>### 2. Structure
>> after exploration and selecting the appropiate tables and columns for our analysis, i started to structure the data by altering columns to make the data ready for analysis process.

>>>1. [_**productScale**_ column] was in string Datatype with fromat like **[1:18]**. so i dorped '1:' using SUBSTR() and casted the resulted substring to __INTEGER__ Datatype to ease the process of filtering and doing some calculations on such column.
>>>2. adding some columns to assist in analysis process and drawing conclusions


| table name  | description |
| -------------  | -------------  |
| profit  | profit for each product (revenue - cost)* total_ordered_quantity  |
| category  | split the whole products into 4 categories based on their profits {1 is lowest}  |
| orderedToStock | to define the percentage of ordered quantity to stored quantity  |
| profit_score  | give score out of 37 based on the rank of product {1 for lowest profit product}  |
| orderToStock_score  | give score out of 37 based on the rank of product {1 for lowest orders/stock product}  |
| scale_score  | give score out of 6 based on the rank of product {1 for highest scale product}  |
| total_points  | sum of all 3 scores |


                 
>>>3. create multiple CTEs to make quires simple to read 
>>>4. selecting appropriate columns needed for our analysis from each table 
      
>### 3. Cleaning
>>- replacing null values in columns like [**totalOrderedQuantity**] with 0 to avoid any problems while doing data analysis
      
>### 4. Joining
 >>- joining tables [products, CTE_orders, warehouses] to create one source to perform our analysis on.
      
>### 5. Validating 
>>- ensure the data is qualified and ready to start performing analysis 
      

            i used three main factors to evaluate the products in the company's facilities(profit, scale_ranking, ordered_quantity To Stock_quantity )and the perfect combination of product to eliminate from stock is                     {low_profit, high_scale_items, low order/stock}. and as it hard to get the perfect combination, so i will show each factor and how it will affect the decision of rearranging the facilities structure and                    eliminating some product to reduce the number of stores the company have :
                  
            1) Where are items stored and if they were rearranged, could a warehouse be eliminated?
                
            2) How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?
      
            3) Are we storing items that are not moving? Are any items candidates for being dropped from the product line?
            
>### 6. presenting
>> - As our goal is to minimize the storage facility by  reorganization or reduction our inventory. so after investigation and data analysis of company's inventory i found there are 3 main important factors that may influence inventory reorganization/reduction which are [product scale, ordered to Stock quantity percentage,  profit]
>> - Before conducting analysis based on the preceeding factors, i will narrow the scope of analysis by split the products into four quartiles based on *profits* they achieved and i will take the least 25% profit achieving products.
>>- The qualified products to make some changes on (reduction or reorganizing) are products that have
<h6 align="center">([highest] product scale +  [lowest] ordered to Stock quantity percentage +  [lowest] profit)</h6> 
>> - Ifaced a problem to find porducts with this criteria [**highest** +  **lowest** +  **lowest**]. so, to solve this problem i used **scoring method** to rank each product according to each variable such that **(the worst takes least rank)** which means if a product has the lowest profit, it will take rank 1. and if it has highest scale which means it is unfavorable. so it will take least rank and so on.
>> - After giving each factor for each product rank. i will sum them up and give some focus to the least scoring product to do more investigations  

  # 3) Execute📄
  >> after exploring and analyzing the data of Mint Classics Company 
>>>- according to my analysis 3 main important factors that may influence inventory reorganization/reduction which are 
>>>>1. product scale
>>>>2. ordered to Stock quantity percentage
>>>>3. profit
>> the 

      
      
 
