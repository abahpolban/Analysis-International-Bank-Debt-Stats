## 📂 **Analyzing International Debt**

It's not that we humans only take debts to manage our necessities. A country may also take debt to manage its economy. For example, infrastructure spending is one costly ingredient required for a country's citizens to lead comfortable lives. The World Bank is the organization that provides debt to countries.

In this notebook, we are going to analyze international debt data collected by The World Bank. The dataset contains information about the amount of debt (in USD) owed by developing countries across several categories.  
**We are asked to answer the following question :**

    1. What is the total amount of debt that is owed by the countries listed in the dataset?
    2. Which country owns the maximum amount of debt and what does that amount look like?
    3. What is the average amount of debt owed by countries across different debt indicators?

### 📌 **Get knowledge about the datasets**

Before answers the question, we have to know what kind of data we are working with, to do that we can simply do these following steps :

1. breakdown the data we are working with

**query :**
```sql
describe international_debt;
```
**result:**

![image](https://github.com/abahpolban/Analysis-International-Bank-Debt-Stats/assets/87195694/43ef0249-50dd-49a3-9b11-24573630773c)

from that result, we can know that we are working with the international_debt table that have 5 column ; country_name, country_code, indicator_name, indicator_code, and debt. We can also see the type of data of every column in the table.

2. breakdown the number of country we are working with

**query :**
```sql
select count(distinct country_name) as number_of_country
from international_debt;
```
**result:**

![image](https://github.com/abahpolban/Analysis-International-Bank-Debt-Stats/assets/87195694/88f4f8d9-0b74-4fa0-b466-eba49dd098db)

We can see that we are working with 124 different country in the table.

3. cleaning null's data

This steps is optional, we need to check the data we are working with is clean. We can do this by simply check for every column, is there null value. If we find null's value, we can either delete the data that has null value or we can update the data by ask the source's about the data. If we not find null's value, it mean that the data is ready to go.

**query :**
```sql
select * from international_debt
where country_name is null or country_code is null or indicator_code is null
    or indicator_name is null or debt is null;
```
**result:**

   ![image](https://github.com/abahpolban/Analysis-International-Bank-Debt-Stats/assets/87195694/7f4c9e0e-38d7-4a17-9b97-0d0e8086732f)

we can see that the query we run showed no result. This mean that the data we are working with is already clean and not contain null value.


### 📌 **Anlyze the International Bank Debt datasets**

Now that the data we are working with is ready to go, we can start analyzing the data by answering the question. 

### 1. What is the total amount of debt that is owed by the countries listed in the dataset?

The first question is 'What is the total amount of debt that is owed by the countries listed in the dataset?'. From the data, we know that the debts is categorized by the country_name and then by the indicator_name. To categorized the total ammount of debt owned by the countries, we can use the group by clause on country_name and then summerize all the debt to get the total ammount of debts. Here are the following steps we can do:
- get the total debts using sum clause
- call country_name column
- group it by country_name 

**query:**
  
```sql
select 
    country_name,
    round(sum(debt),1) as total_debt
from international_debt
group by country_name;
```

**result:**

![image](https://github.com/abahpolban/Analysis-International-Bank-Debt-Stats/assets/87195694/5ba4d5f0-ca16-414b-86e4-08031cd924f3)

from the result, we can see that we accomplish to get totals of 124 value listed according to their total amount of debt. 

###  2. Which country owns the maximum amount of debt and what does that amount look like?

steps: 
- summerize the total debt that every countries have
- order it by the total debt descending
- filter the query so that it shows only 1 value using limit clause
**query:**
  
```sql
select 
    country_name as highest_country_debt,
    round(sum(debt),1) as total_debt
from international_debt
group by country_name
order by 2 desc
limit 1;
```

**result:**
![image](https://github.com/abahpolban/Analysis-International-Bank-Debt-Stats/assets/87195694/0d203c49-4659-4686-9ac5-6cd74c939cbd)

We can see that from the data, we only get 1 result. We can conclude that China has the highest total amount of debt compared to 123 others countries.

###  3. What is the average amount of debt owed by countries across different debt indicators?


steps: 
- calculate the average of debt
- apply group by country_name,indicator_name, and indicator_code

**query:**
  
```sql
select 
    country_name, 
    indicator_name,
    indicator_code, 
    round(avg(debt),1) as average_debt
from international_debt
group by country_name, indicator_code, indicator_name
order by country_name;
```

**result:**
![image](https://github.com/abahpolban/Analysis-International-Bank-Debt-Stats/assets/87195694/bb3a6f53-cc0b-4aad-9d50-dc13cbfbbd91)

![image](https://github.com/abahpolban/Analysis-International-Bank-Debt-Stats/assets/87195694/134ebc03-2f97-494c-83ef-99977ecf0323)


from the result, it shows the average of debts that every country have to each indicators. For example, afganistan have total debts to 12 different indicators and each average debts listed in the table.  
