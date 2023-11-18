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
