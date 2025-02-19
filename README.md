# Insurance-Analytics
nsurance analytics refers to the use of data-driven insights, statistical models, and AI-powered tools to optimize decision-making in the insurance industry. It helps in risk assessment, fraud detection, customer segmentation, pricing strategies, and claims management.
Database Selection
Retrieve All Invoice Data
SELECT * FROM branch_dashboard.invoice;
Count of Invoices by Account Executive

SELECT 
  `Account Executive`,
  COUNT(invoice_number) AS NumberOfInvoices
FROM
  invoice
GROUP BY
  `Account Executive`;
Retrieve All Meeting Data

SELECT * FROM branch_dashboard.meeting;
Yearly Meeting Count

SELECT 
  Year,
  COUNT(*) AS MeetingCount
FROM
  meeting
GROUP BY
  Year;
Fetching KPI-Related Data (Cross Sell, New, Renewal)

Fetching targets:

SELECT * FROM target_fy;
Fetching achieved targets:

SELECT * FROM placement_achieved;
Fetching new invoices:

SELECT * FROM invoice_achievement;
Cross Sell Performance Calculation

SELECT 
  (SELECT SUM(`Cross sell bugdet`) FROM target_fy) AS Total_Target,
  (SELECT SUM(Amount) FROM placement_achieved WHERE income_class = 'Cross Sell') AS Total_Achieved,
  (SELECT SUM(Amount) FROM invoice_achievement WHERE income_class = 'Cross Sell') AS Total_New;
New Business Performance Calculation

SELECT 
  (SELECT SUM(`New Budget`) FROM target_fy) AS Total_Target,
  (SELECT SUM(Amount) FROM placement_achieved WHERE income_class = 'New') AS Total_Achieved,
  (SELECT SUM(Amount) FROM invoice_achievement WHERE income_class = 'New') AS Total_New;
