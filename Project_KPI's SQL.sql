use branch_dashboard;

select * from branch_dashboard.invoice;
-- Q1 No.of Invoice by Acc executive
select 
  `Account Executive`,
  count(invoice_number) AS NumberOfInvoices
from
  invoice
group by
  `Account Executive`; 
  
select * from branch_dashboard.meeting;

-- Q2 Yearly meeting count

  select 
  Year,
  count(*) AS MeetingCount
from
  meeting
group by
  year;
  
-- Q3 3.1Cross Sell-Target,Achive,new
--    3.1New-Target,Achive,new
--    3.1Renewal-Target, Achive,new


select * from target_fy; -- target
select * from placement_achieved; -- Achieve
select * from invoice_achievement; -- New
-- CROSS SELL
	
   SELECT 
    (SELECT SUM(`Cross sell bugdet`) 
     FROM target_fy) AS Total_Target,
    (SELECT SUM(Amount) 
     FROM placement_achieved 
     WHERE income_class = 'Cross Sell') AS Total_Achieved,
    (SELECT SUM(Amount) 
     FROM invoice_achievement 
     WHERE income_class = 'Cross Sell') AS Total_New;
    
-- NEW
	
     SELECT 
    (SELECT SUM(`New Budget`) 
     FROM target_fy) AS Total_Target,
    (SELECT SUM(Amount) 
     FROM placement_achieved 
     WHERE income_class = 'New') AS Total_Achieved,
    (SELECT SUM(Amount) 
     FROM invoice_achievement 
     WHERE income_class = 'New') AS Total_New;

-- RENEWAL
     
    SELECT 
    (SELECT SUM(`Renewal Budget`) 
     FROM target_fy) AS Total_Target,
    (SELECT SUM(Amount) 
     FROM placement_achieved 
     WHERE income_class = 'Renewal') AS Total_Achieved,
    (SELECT SUM(Amount) 
     FROM invoice_achievement 
     WHERE income_class = 'Renewal') AS Total_New;
  
SELECT * FROM branch_dashboard.opportunity;

-- Q4 Stage Funnel by Revenue
SELECT 
    stage, 
    SUM(revenue_amount) AS total_revenue
FROM 
    opportunity
GROUP BY 
    stage
ORDER BY 
    FIELD(stage, 'Qualify Oportunity', 'Negotiate', 'Propose Solution');
    
SELECT * FROM branch_dashboard.meetings;

-- Q5. No.of meetings by Account Executive
select count(*) AS num_meetings
from meetings;
    
-- Q6. Top 10 open opportunity
select * from branch_dashboard.opportunity
where stage IN('Qualify Opportunity', 'Negotiate')
order by premium_amount DESC
LIMIT 10;


