# Select all employees and their compensation for a specific year:

SELECT *
FROM EmployeeCompensation
WHERE fiscal_year = 2024;

#  Select employee names and annual salaries for the 'Software Development' department in 2024.

SELECT employee_name, annual_salary
FROM EmployeeCompensation
WHERE fiscal_year = '2024' AND department = 'IT'

#   Calculate the average monthly salary for each department in 2024:

SELECT department, AVG(monthly_salary) AS average_monthly_salary
FROM EmployeeCompensation
WHERE fiscal_year = 2024
GROUP BY department;

#   Find employees with an annual salary greater than $100,000 in 2023:

SELECT employee_name, department, annual_salary
FROM EmployeeCompensation
WHERE annual_salary > 100000.00
  AND fiscal_year = 2023;
  
#  Get total transaction amount for each product/service category in Q3 of 2023 (July, August, September - months 7, 8, 9):

SELECT product_service_category, SUM(transaction_amount) AS total_sales_amount
FROM CustomerTransactions
WHERE fiscal_year = 2023
  AND fiscal_month IN (7, 8, 9)
GROUP BY product_service_category
ORDER BY total_sales_amount DESC;

#  Calculate the average transaction amount for each sales region in December 2024:

SELECT sales_region, AVG(transaction_amount) AS average_transaction_amount
FROM CustomerTransactions
WHERE fiscal_year = 2024 AND fiscal_month = 12
GROUP BY sales_region;

#  Join CustomerTransactions with EmployeeCompensation to get the department of the employee for each transaction in 2025:

SELECT
    ct.transaction_id,
    ct.transaction_date,
    ct.transaction_amount,
    ec.department AS employee_department
FROM CustomerTransactions ct
JOIN EmployeeCompensation ec
    ON ct.employee_id = ec.employee_id AND ct.fiscal_year = ec.fiscal_year
WHERE ct.fiscal_year = 2025;

#  Calculate the total cash flow from operating, investing, and financing activities for each quarter of 2025:

SELECT
    fiscal_year,
    CASE
        WHEN fiscal_month BETWEEN 1 AND 3 THEN 'Q1'
        WHEN fiscal_month BETWEEN 4 AND 6 THEN 'Q2'
        WHEN fiscal_month BETWEEN 7 AND 9 THEN 'Q3'
        WHEN fiscal_month BETWEEN 10 AND 12 THEN 'Q4'
        ELSE 'Unknown'
    END AS quarter,
    SUM(cash_flow_operating) AS total_operating_cash_flow,
    SUM(cash_flow_investing) AS total_investing_cash_flow,
    SUM(cash_flow_financing) AS total_financing_cash_flow
FROM CashFlowStatement
WHERE fiscal_year = 2025
GROUP BY fiscal_year, quarter
ORDER BY quarter;

#  Calculate key metrics (Gross Profit, Operating Income, Net Income) for in 2025.

SELECT
    fiscal_year,
    SUM(revenue) AS total_revenue,
    SUM(cogs) AS total_cogs,
    SUM(revenue - cogs) AS calculated_gross_profit,
    SUM(operating_expenses) AS total_operating_expenses,
    SUM((revenue - cogs) - operating_expenses) AS calculated_operating_income,
    SUM(interest_expense) AS total_interest_expense,
    SUM(tax_expense) AS total_tax_expense,
    SUM((revenue - cogs) - operating_expenses - interest_expense - tax_expense) AS calculated_net_income
FROM IncomeStatement
WHERE fiscal_year = 2025
GROUP BY fiscal_year

#  Calculate key metrics (Total Assets, Total Liabilities, Shareholders Equity) for 2025:

SELECT
    fiscal_year,
    SUM(current_assets),
    SUM(current_assets),
	sum((current_assets + non_current_assets)) AS calculated_total_assets,
    SUM(current_liabilities),
    SUM(non_current_liabilities),
    SUM((current_liabilities + non_current_liabilities)) AS calculated_total_liabilities,
    SUM((current_assets + non_current_assets) - (current_liabilities + non_current_liabilities)) AS calculated_shareholders_equity
FROM BalanceSheet
WHERE fiscal_year = 2025

#  Compare total assets between Q1 and Q4 of 2024:

SELECT
    SUM(CASE WHEN fiscal_month = 3 THEN total_assets ELSE 0 END) AS q1_total_assets,
    SUM(CASE WHEN fiscal_month = 12 THEN total_assets ELSE 0 END) AS q4_total_assets
FROM BalanceSheet
WHERE fiscal_year = 2024;

#  