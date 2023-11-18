-- ----------------------------
-- ANALYZING INTERNATIONAL DEBT
-- ----------------------------
USE international_debt;

-- 1. What is the total amount of debt that is owed by the countries listed in the dataset?
select 
    country_name,
    round(sum(debt),1) as total_debt
from international_debt
group by country_name;

-- 2. Which country owns the maximum amount of debt and what does that amount look like?
select 
    country_name as highest_country_debt,
    round(sum(debt),1) as total_debt
from international_debt
group by country_name
order by 2 desc
limit 1;

-- 3. What is the average amount of debt owed by countries across different debt indicators?
select 
    country_name, 
    indicator_name,
    indicator_code, 
    round(avg(debt),1) as average_debt
from international_debt
group by country_name, indicator_code, indicator_name
order by country_name;
