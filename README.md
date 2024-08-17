# Mint-Classics-Company-storage-facility-analysis-
In this project, I will step into the shoes of an entry-level data analyst at the fictional Mint Classics Company, helping to analyze data in a relational database with the goal of supporting inventory-related business decisions that lead to the closure of a storage facility using SQL

# Problem
  helping to analyze data in a relational database with the goal of supporting inventory-related business decisions that lead to the closure of a storage facility using SQL

# Analysis framework  
  i will use **PACE** framework in conducting this analysis  

# 1) Plan 
>## Project Objectives
  1. Explore products currently in inventory.
  2. Determine important factors that may influence inventory reorganization/reduction.
  3. Provide analytic insights and data-driven recommendations.
      
    
> ## Tools Used
  - MySQL Workbench

# 2) Analyze
> through this step, I used EDA techniques to get insights and understand the company's inventory Data

>### 1. Discovering
>> I started to discover and understand the data and its structure by reading ERD and using SQL queries familiraize myself with tables, columns and its content to start conducting our analysis.
      
>### 2. Structure
>> after exploration and selecting the appropiate tables and columns for our analysis, i started to structure the data by altering columns to make the data ready for analysis process.

>>>1. [_**scale**_ column] was in string Datatype with fromat like **[1:18]**. so spliting and converting columns like [scale column] with string Datatype to interger Datatype to ease the process of filtering and doing math on them
               + adding columns to assist in analysis process and drawing conclusions
                     profit : profit for each product (revenue - cost)* total_ordered_quantity
                     category : split the whole products into 4 categories based on their profits {1 is lowest}
                     orderedToStock : to define the percentage of ordered quantity to stored quantity 
                     profit_score : give score out of 37 based on the rank of product {1 for lowest profit product}
                     orderToStock_score : give score out of 37 based on the rank of product {1 for lowest orders/stock product}
                     scale_score : give score out of 6 based on the rank of product {1 for highest scale product}
                     total_points: sum of all 3 scores
           
                 
               + create multiple CTEs to make quires simple to read 
               + select columns from each table
      
>### 3. Clean
               + replace any null values in columns like number of orders and any column could be used to perform statistical methods
      
>### 4. JOIN
               + joining tables to create one source to start performing analysis 
      
>### 5. Validate
               + ensure the data is qualified and ready to start performing analysis 
      
>### 6. Presenting ===> conclusion
            i used three main factors to evaluate the products in the company's facilities(profit, scale_ranking, ordered_quantity To Stock_quantity )and the perfect combination of product to eliminate from stock is                     {low_profit, high_scale_items, low order/stock}. and as it hard to get the perfect combination, so i will show each factor and how it will affect the decision of rearranging the facilities structure and                    eliminating some product to reduce the number of stores the company have :
                  
            1) Where are items stored and if they were rearranged, could a warehouse be eliminated?
                
            2) How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?
      
            3) Are we storing items that are not moving? Are any items candidates for being dropped from the product line?
      
      
      #Conclusion 
 
