CREATE DATABASE telco_churn;
USE telco_churn;

show tables;
drop table telco_customer_churn;

SELECT COUNT(*) FROM customers;

/* Checking how many TotalCharges values are NULL */

select count(*) AS total_rows, sum(TotalCharges IS NULL) AS null_totalcharges from customers;

/* Confirming no accidental duplicates */
select count(CustomerID) AS  total_ids,count(distinct CustomerID) as unique_ids from customers;

/*Confirming target variable is usable*/
select churn, count(*) as customer_count from customers group by Churn


/* Confirms numeric columns are actually numeric*/
SELECT  min(tenure) as min_tenure,
	   max(tenure) as max_tenure,
       min(MonthlyCharges) as min_monthlycharges,
       max(MonthlyCharges) as max_monthlycharges,
       min(TotalCharges) as min_totalchrges,
       max(TotalCharges) as max_totalcharges
       from customers;

/* Confirming categorical columns don’t have random junk values */
select distinct gender from customers;
select distinct InternetService from customers;
select distinct Contract from customers;
select distinct PaymentMethod from customers;

/* overall churn rate*/
select round(sum(case when Churn='Yes' then 1 else 0 end)*100.0/count(*),2) as churn_rate_percent from customers;

/* churn by contract type*/
select Contract,count(*) as total_customers, sum(case when Churn='Yes' then 1 else 0 end) as churned_customers,
											 round(sum(case when Churn='Yes' then 1 else 0 end)* 100.0/count(*),2) as churn_rate_percent
                                             from customers
                                             group by contract
                                             order by churn_rate_percent desc;
                                             
/* churn by internet serivice*/
select InternetService, count(*) as totoal_customers, sum(case when Churn='Yes' then 1 else 0 end) as churned_customers,
													  round(sum(case when Churn='Yes' then 1 else 0 end) * 100.0/count(*),2) as churn_rate_percent_by_internet_service
                                                      from customers
                                                      group by InternetService
                                                      order by churn_rate_percent_by_internet_service desc;
                                                      
/* comparing the churn(month and year)*/
select case when Contract = 'Month-to-month' then 'month-to-month' else 'Lomg=term(1Y/2Y)' end as contract_group,
		count(*) as total_custemers,
        sum(case when churn='Yes' then 1 else 0 end ) as churmed_customers,
        round(sum(case when Churn='Yes' then 1 else 0 end )*100.0/count(*),2) as churn_rate_percentage
        from customers 
        group by contract_group
        order by churn_rate_percentage desc;
      
/* which payment method has more churn*/
select PaymentMethod, count(*) as total_customers, sum(case when Churn='Yes' then 1 else 0 end) as churned_customers,
												   round(sum(case when Churn='Yes' then 1 else 0 end )* 100.0/count(*),2) as churn_rate_percentage
                                                   from Customers
                                                   group by PaymentMethod
                                                   order by churn_rate_percentage desc;
                                                   
/* converting a tenure number to categories and performing the churn rate percentage according to tenure */
select case 
			when tenure between 0 and 12 then '0-12 months'
            when tenure between 13 and 24 then '13-24 months'
            when tenure between 25 and 48 then '25-48 months'
            else '49+ months' end as tenure_bucket,
            count(*) as total_customers,
            sum(case when Churn='Yes' then 1 else 0 end) as churned_customers,
			round(sum(case when Churn='Yes' then 1 else 0 end )* 100.0/count(*),2) as churn_rate_percentage
			from  customers
            group by tenure_bucket
            order by case
            when tenure_bucket = '0-12 months' then 1
            when tenure_bucket = '13-24 months' then 2
            when tenure_bucket = '25-48 months' then 3
            else 4 end;
            
            
/* checking how mauch revenue has lost due to churned customers(monthly) */
select round(sum(MonthlyCharges),2) as monthly_charges from Customers
where Churn='Yes';

/* checking how mauch revenue has lost due to churned customers(monthly) interms of percentage */
select round((sum(case when Churn='Yes' then MonthlyCharges else 0 end)/sum(MonthlyCharges)) *100,2)  as revenue_loss_percentage
from Customers;

/* revenue lost by contract type */
SELECT
    Contract,
    count(*) AS churned_customers,
    round(sum(MonthlyCharges), 2) AS monthly_revenue_lost,
    round(avg(MonthlyCharges), 2) AS avg_monthly_charge
    from customers
    where Churn = 'Yes'
    group by Contract
	order by monthly_revenue_lost desc;
    
/* number of high value churned customers */
select count(*) as high_value_churned_customers,
		round(sum(MonthlyCharges),2) as monthly_revenur_lost,
        round(avg(MonthlyCharges),2) as avg_monthly_charges
        from Customers
        where Churn='Yes'
        and MonthlyCharges > (select avg(MonthlyCharges) from Customers);
        
/* out of the total revenue loss, what percent is caused by high value churned customers */
select round(sum(case when Churn='Yes' and monthlyCharges >( select avg(MonthlyCharges) from customers) then MonthlyCharges else 0 end)/
sum(case when Churn='Yes' then MonthlyCharges else 0 end)*100,2) as high_value_churn_revenue_percentage from Customers;

