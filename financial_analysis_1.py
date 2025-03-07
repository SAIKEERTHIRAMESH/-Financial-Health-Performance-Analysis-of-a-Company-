# 1. ---------------------------------------------------------------------

import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Database connection details (UPDATE THESE!)
conn = mysql.connector.connect(host="localhost", user="root", password="Keerthi@2503", database="Financial_performance8DB")
cursor = conn.cursor()

# Fetch Income Statement data
query = "SELECT fiscal_year, fiscal_month, revenue, cogs, operating_expenses, interest_expense, tax_expense FROM IncomeStatement ORDER BY fiscal_year, fiscal_month;"
cursor.execute(query)
data = cursor.fetchall()
df_income = pd.DataFrame(data, columns=['Fiscal Year', 'Fiscal Month', 'Revenue', 'COGS', 'Operating Expenses', 'Interest Expense', 'Tax Expense'])

# 1. Line Chart: Revenue Trend Over Time
plt.figure(figsize=(12, 6))
df_income['Period'] = pd.to_datetime(df_income['Fiscal Year'].astype(str) + '-' + df_income['Fiscal Month'].astype(str), format='%Y-%m')
sns.lineplot(x='Period', y='Revenue', data=df_income, marker='o')
plt.title('Revenue Trend Over Time (Quarterly)')
plt.xlabel('Period')
plt.ylabel('Revenue (Millions)')
plt.grid(True)
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

# 2. ----------------------------------------------------------------------

import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Database connection details (UPDATE THESE!)
conn = mysql.connector.connect(host="localhost", user="root", password="Keerthi@2503", database="Financial_performance8DB")
cursor = conn.cursor()

# Fetch Balance Sheet data
query = "SELECT fiscal_year, fiscal_month, current_assets, non_current_assets, current_liabilities, non_current_liabilities, shareholders_equity FROM BalanceSheet ORDER BY fiscal_year, fiscal_month;"
cursor.execute(query)
data = cursor.fetchall()
df_balance = pd.DataFrame(data, columns=['Fiscal Year', 'Fiscal Month', 'Current Assets', 'Non-Current Assets', 'Current Liabilities', 'Non-Current Liabilities', 'Shareholders Equity'])

# 1. Stacked Area Chart: Asset Composition Over Time
plt.figure(figsize=(12, 7))
df_balance['Period'] = pd.to_datetime(df_balance['Fiscal Year'].astype(str) + '-' + df_balance['Fiscal Month'].astype(str), format='%Y-%m')
plt.stackplot(df_balance['Period'], df_balance['Current Assets'], df_balance['Non-Current Assets'],
              labels=['Current Assets', 'Non-Current Assets'], colors=['skyblue', 'lightcoral'])
plt.title('Asset Composition Over Time')
plt.xlabel('Period')
plt.ylabel('Amount (Millions)')
plt.legend(loc='upper left')
plt.grid(axis='y')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()


# 2. Bar Chart: Liabilities and Equity Comparison (Latest Year)
latest_year_balance = df_balance[df_balance['Fiscal Year'] == df_balance['Fiscal Year'].max()].copy()
latest_year_balance['Total Liabilities'] = latest_year_balance['Current Liabilities'] + latest_year_balance['Non-Current Liabilities']

plt.figure(figsize=(10, 6))
bar_width = 0.35
index = range(len(latest_year_balance))

plt.bar(index, latest_year_balance['Total Liabilities'], bar_width, label='Total Liabilities', color='orange')
plt.bar([i + bar_width for i in index], latest_year_balance['Shareholders Equity'], bar_width, label='Shareholders Equity', color='green')

plt.xlabel('Fiscal Quarter (Latest Year)')
plt.ylabel('Amount (Millions)')
plt.title('Liabilities vs. Shareholders Equity (Latest Year)')
plt.xticks([i + bar_width / 2 for i in index], ['Q1', 'Q2', 'Q3', 'Q4']) # Assuming data is quarterly
plt.legend()
plt.tight_layout()
plt.show()


cursor.close()
conn.close()

# 3. -----------------------------------------------------------------------------

import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Database connection details (UPDATE THESE!)
conn = mysql.connector.connect(host="localhost", user="root", password="Keerthi@2503", database="Financial_performance8DB")
cursor = conn.cursor()

# Fetch Cash Flow Statement data
query = "SELECT fiscal_year, fiscal_month, cash_flow_operating, cash_flow_investing, cash_flow_financing FROM CashFlowStatement ORDER BY fiscal_year, fiscal_month;"
cursor.execute(query)
data = cursor.fetchall()
df_cash_flow = pd.DataFrame(data, columns=['Fiscal Year', 'Fiscal Month', 'Operating Cash Flow', 'Investing Cash Flow', 'Financing Cash Flow'])

# 1. Grouped Bar Chart: Cash Flow Components Over Quarters (Latest Year)
latest_year_cash_flow = df_cash_flow[df_cash_flow['Fiscal Year'] == df_cash_flow['Fiscal Year'].max()].copy()
cash_flow_components = ['Operating Cash Flow', 'Investing Cash Flow', 'Financing Cash Flow']

plt.figure(figsize=(10, 7))
bar_width = 0.2
index = range(len(latest_year_cash_flow))

for i, component in enumerate(cash_flow_components):
    plt.bar([pos + i * bar_width for pos in index], latest_year_cash_flow[component], bar_width, label=component)

plt.xlabel('Fiscal Quarter (Latest Year)')
plt.ylabel('Cash Flow (Millions)')
plt.title('Cash Flow Components by Quarter (Latest Year)')
plt.xticks([pos + bar_width for pos in index], ['Q1', 'Q2', 'Q3', 'Q4']) # Assuming data is quarterly
plt.legend()
plt.tight_layout()
plt.show()


# 2. Area Chart: Cumulative Cash Flow Over Time
plt.figure(figsize=(12, 6))
df_cash_flow['Period'] = pd.to_datetime(df_cash_flow['Fiscal Year'].astype(str) + '-' + df_cash_flow['Fiscal Month'].astype(str), format='%Y-%m')

plt.plot(df_cash_flow['Period'], df_cash_flow['Operating Cash Flow'].cumsum(), label='Cumulative Operating Cash Flow', marker='o')
plt.plot(df_cash_flow['Period'], df_cash_flow['Investing Cash Flow'].cumsum(), label='Cumulative Investing Cash Flow', marker='o')
plt.plot(df_cash_flow['Period'], df_cash_flow['Financing Cash Flow'].cumsum(), label='Cumulative Financing Cash Flow', marker='o')

plt.title('Cumulative Cash Flow Trends Over Time')
plt.xlabel('Period')
plt.ylabel('Cumulative Cash Flow (Millions)')
plt.legend()
plt.grid(True)
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()


cursor.close()
conn.close()

# 4. -------------------------------------------------------------------

import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Database connection details (UPDATE THESE!)
conn = mysql.connector.connect(host="localhost", user="root", password="Keerthi@2503", database="Financial_performance8DB")
cursor = conn.cursor()

# Fetch R&D Expenses data
query = "SELECT fiscal_year, fiscal_month, department, expense_amount FROM RnDExpenses ORDER BY fiscal_year, fiscal_month, department;"
cursor.execute(query)
data = cursor.fetchall()
df_rnd = pd.DataFrame(data, columns=['Fiscal Year', 'Fiscal Month', 'Department', 'Expense Amount'])

# 1. Bar Chart: R&D Expenses by Department (Latest Year, Q4)
latest_year_q4_rnd = df_rnd[(df_rnd['Fiscal Year'] == df_rnd['Fiscal Year'].max()) & (df_rnd['Fiscal Month'] == 12)]

plt.figure(figsize=(10, 6))
sns.barplot(x='Department', y='Expense Amount', data=latest_year_q4_rnd, palette='viridis')
plt.title('R&D Expenses by Department (Latest Year - Q4)')
plt.xlabel('Department')
plt.ylabel('Expense Amount (Millions)')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()

# 2. Pie Chart: Proportion of R&D Expenses by Department (Latest Year, Q4)
plt.figure(figsize=(8, 8))
plt.pie(latest_year_q4_rnd['Expense Amount'], labels=latest_year_q4_rnd['Department'], autopct='%1.1f%%', startangle=140, colors=sns.color_palette("pastel"))
plt.title('R&D Expense Distribution by Department (Latest Year - Q4)')
plt.tight_layout()
plt.show()


cursor.close()
conn.close()

# 5. -------------------------------------------------------------------

import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Database connection details (UPDATE THESE!)
conn = mysql.connector.connect(host="localhost", user="root", password="Keerthi@2503", database="Financial_performance8DB")
cursor = conn.cursor()

# Fetch Customer Transactions data (example: top categories)
query = """
SELECT fiscal_year, fiscal_month, product_service_category, SUM(transaction_amount) as total_transaction_amount
FROM CustomerTransactions
GROUP BY fiscal_year, fiscal_month, product_service_category
ORDER BY fiscal_year, fiscal_month, total_transaction_amount DESC;
"""
cursor.execute(query)
data = cursor.fetchall()
df_transactions = pd.DataFrame(data, columns=['Fiscal Year', 'Fiscal Month', 'Product Category', 'Total Transaction Amount'])

# Convert 'Total Transaction Amount' to numeric, handling errors
df_transactions['Total Transaction Amount'] = pd.to_numeric(df_transactions['Total Transaction Amount'], errors='coerce')

# Print data types to verify
print(df_transactions.dtypes)

# 1. Bar Chart: Top Product Categories by Sales (Latest Year, Q4)
latest_year_q4_transactions = df_transactions[(df_transactions['Fiscal Year'] == df_transactions['Fiscal Year'].max()) & (df_transactions['Fiscal Month'] == 12)]
top_categories = latest_year_q4_transactions.groupby('Product Category')['Total Transaction Amount'].sum().nlargest(10).index
top_categories_sales = latest_year_q4_transactions[latest_year_q4_transactions['Product Category'].isin(top_categories)]

plt.figure(figsize=(12, 6))
sns.barplot(x='Product Category', y='Total Transaction Amount', data=top_categories_sales, palette='muted')
plt.title('Top Product Categories by Sales (Latest Year - Q4)')
plt.xlabel('Product Category')
plt.ylabel('Total Sales Amount (Millions)')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()


# 2. Time Series Line Chart: Sales Trend Over Time by Category (Top 3)
df_transactions['Period'] = pd.to_datetime(df_transactions['Fiscal Year'].astype(str) + '-' + df_transactions['Fiscal Month'].astype(str), format='%Y-%m')
top_3_categories = df_transactions.groupby('Product Category')['Total Transaction Amount'].sum().nlargest(3).index
top_3_categories_trends = df_transactions[df_transactions['Product Category'].isin(top_3_categories)]

plt.figure(figsize=(12, 7))
for category in top_3_categories:
    category_data = top_3_categories_trends[top_3_categories_trends['Product Category'] == category]
    sns.lineplot(x='Period', y='Total Transaction Amount', data=category_data, label=category, marker='o')

plt.title('Sales Trend Over Time for Top 3 Product Categories')
plt.xlabel('Period')
plt.ylabel('Total Sales Amount (Millions)')
plt.legend()
plt.grid(True)
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()


cursor.close()
conn.close()

# 6. ------------------------------------------------------------

import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Database connection details (UPDATE THESE!)
conn = mysql.connector.connect(host="localhost", user="root", password="Keerthi@2503", database="Financial_performance8DB")
cursor = conn.cursor()

# Fetch Employee Compensation data
query = "SELECT fiscal_year, department, monthly_salary, annual_salary FROM EmployeeCompensation WHERE fiscal_year = (SELECT MAX(fiscal_year) FROM EmployeeCompensation);"
cursor.execute(query)
data = cursor.fetchall()
df_compensation = pd.DataFrame(data, columns=['Fiscal Year', 'Department', 'Monthly Salary', 'Annual Salary'])

# 1. Box Plot: Salary Distribution by Department (Latest Year)
plt.figure(figsize=(10, 6))
sns.boxplot(x='Department', y='Annual Salary', data=df_compensation, palette='Set2')
plt.title('Annual Salary Distribution by Department (Latest Year)')
plt.xlabel('Department')
plt.ylabel('Annual Salary (USD)')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()


# 2. Bar Chart: Average Annual Salary by Department (Latest Year)
avg_salary_dept = df_compensation.groupby('Department')['Annual Salary'].mean().sort_values(ascending=False)

plt.figure(figsize=(10, 6))
avg_salary_dept.plot(kind='bar', color=sns.color_palette('viridis'))
plt.title('Average Annual Salary by Department (Latest Year)')
plt.xlabel('Department')
plt.ylabel('Average Annual Salary (USD)')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()


cursor.close()
conn.close()

# 7. -----------------------------------------------------------------

import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Database connection details (UPDATE THESE!)
conn = mysql.connector.connect(host="localhost", user="root", password="Keerthi@2503", database="Financial_performance8DB")
cursor = conn.cursor()

# Fetch Income Statement data (Revenue and Net Income)
query = "SELECT fiscal_year, fiscal_month, revenue, net_income FROM IncomeStatement ORDER BY fiscal_year, fiscal_month;"
cursor.execute(query)
data = cursor.fetchall()
df_profitability = pd.DataFrame(data, columns=['Fiscal Year', 'Fiscal Month', 'Revenue', 'Net Income'])

# Calculate Net Income Margin
df_profitability['Net Income Margin'] = (df_profitability['Net Income'] / df_profitability['Revenue']) * 100
df_profitability['Period'] = pd.to_datetime(df_profitability['Fiscal Year'].astype(str) + '-' + df_profitability['Fiscal Month'].astype(str), format='%Y-%m')

# Plotting Net Income Margin Trend
plt.figure(figsize=(12, 6))
sns.lineplot(x='Period', y='Net Income Margin', data=df_profitability, marker='o', color='coral')
plt.title('Net Income Margin Trend Over Time (Quarterly)')
plt.xlabel('Period')
plt.ylabel('Net Income Margin (%)')
plt.grid(True, axis='y', linestyle='--', alpha=0.7)
plt.axhline(y=0, color='gray', linestyle='-', linewidth=0.8) # Zero line for reference
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

cursor.close()
conn.close()

# 8. --------------------------------------------------------------

import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Database connection details (UPDATE THESE!)
conn = mysql.connector.connect(host="localhost", user="root", password="Keerthi@2503", database="Financial_performance8DB")
cursor = conn.cursor()

# Fetch Balance Sheet data (Liabilities and Equity)
query = "SELECT fiscal_year, fiscal_month, total_liabilities, shareholders_equity FROM BalanceSheet ORDER BY fiscal_year, fiscal_month;"
cursor.execute(query)
data = cursor.fetchall()
df_stability = pd.DataFrame(data, columns=['Fiscal Year', 'Fiscal Month', 'Total Liabilities', 'Shareholders Equity'])

# Calculate Debt-to-Equity Ratio
df_stability['Debt-to-Equity Ratio'] = df_stability['Total Liabilities'] / df_stability['Shareholders Equity']
df_stability['Period'] = pd.to_datetime(df_stability['Fiscal Year'].astype(str) + '-' + df_stability['Fiscal Month'].astype(str), format='%Y-%m')

# Plotting Debt-to-Equity Ratio Trend
plt.figure(figsize=(12, 6))
plt.fill_between(df_stability['Period'], df_stability['Debt-to-Equity Ratio'], color='skyblue', alpha=0.6)
plt.plot(df_stability['Period'], df_stability['Debt-to-Equity Ratio'], color='navy', marker='o', linestyle='-')

plt.title('Debt-to-Equity Ratio Trend Over Time (Quarterly)')
plt.xlabel('Period')
plt.ylabel('Debt-to-Equity Ratio')
plt.grid(True, axis='y', linestyle='--', alpha=0.7)
plt.axhline(y=1.5, color='red', linestyle='--', linewidth=1, label='Threshold (Example: 1.5)') # Example threshold
plt.legend()
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

cursor.close()
conn.close()

# 9. ----------------------------------------------------------------

import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Database connection details (UPDATE THESE!)
conn = mysql.connector.connect(host="localhost", user="root", password="Keerthi@2503", database="Financial_performance8DB")
cursor = conn.cursor()

# Fetch Cash Flow data (Operating and Investing)
query = "SELECT fiscal_year, fiscal_month, cash_flow_operating, cash_flow_investing FROM CashFlowStatement ORDER BY fiscal_year, fiscal_month;"
cursor.execute(query)
data = cursor.fetchall()
df_cash_gen = pd.DataFrame(data, columns=['Fiscal Year', 'Fiscal Month', 'Operating Cash Flow', 'Investing Cash Flow'])

# Calculate Free Cash Flow (Simplified: Operating + Investing - Assuming Investing is mainly Capex, often negative)
df_cash_gen['Free Cash Flow'] = df_cash_gen['Operating Cash Flow'] + df_cash_gen['Investing Cash Flow'] # Investing Cash Flow is typically negative
df_cash_gen['Period'] = pd.to_datetime(df_cash_gen['Fiscal Year'].astype(str) + '-' + df_cash_gen['Fiscal Month'].astype(str), format='%Y-%m')

# Plotting Free Cash Flow Trend (Stacked Bar - showing components)
plt.figure(figsize=(12, 7))
bar_width = 0.6
index = range(len(df_cash_gen))

plt.bar(index, df_cash_gen['Operating Cash Flow'], bar_width, label='Operating Cash Flow', color='mediumseagreen')
plt.bar(index, df_cash_gen['Investing Cash Flow'], bar_width, bottom=df_cash_gen['Operating Cash Flow'], label='Investing Cash Flow', color='lightcoral') # Stacked

plt.xlabel('Fiscal Quarter (Over Time)')
plt.ylabel('Cash Flow (Millions)')
plt.title('Free Cash Flow Trend (Components Stacked)')
plt.xticks(index, [f'Q{m//3 + 1} {y}' for y, m in zip(df_cash_gen['Fiscal Year'], df_cash_gen['Fiscal Month'])], rotation=45) # Quarter labels
plt.legend()
plt.grid(axis='y', linestyle='--', alpha=0.7)
plt.tight_layout()
plt.show()


cursor.close()
conn.close()

# 10. -------------------------------------------------------------

import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Database connection details (UPDATE THESE!)
conn = mysql.connector.connect(host="localhost", user="root", password="Keerthi@2503", database="Financial_performance8DB")
cursor = conn.cursor()

# Fetch RnD Expenses data (department and expense amount per period)
query_rnd = """
SELECT fiscal_year, fiscal_month, department, SUM(expense_amount) as total_rnd_expense
FROM RnDExpenses
GROUP BY fiscal_year, fiscal_month, department
ORDER BY fiscal_year, fiscal_month, department;
"""
cursor.execute(query_rnd)
rnd_data = cursor.fetchall()
df_rnd_expenses = pd.DataFrame(rnd_data, columns=['Fiscal Year', 'Fiscal Month', 'Department', 'Total RnD Expense'])
df_rnd_expenses['Period'] = pd.to_datetime(df_rnd_expenses['Fiscal Year'].astype(str) + '-' + df_rnd_expenses['Fiscal Month'].astype(str), format='%Y-%m')

# Pivot the table to have departments as columns for grouped bar chart
df_pivot_rnd = df_rnd_expenses.pivot_table(index='Period', columns='Department', values='Total RnD Expense', fill_value=0).reset_index()

# Departments for visualization (you can customize this list)
departments_to_plot = df_pivot_rnd.columns[1:] # Exclude 'Period' column

# Plotting Grouped Bar Chart - R&D Expenses by Department over time
plt.figure(figsize=(14, 8)) # Increased figure size for better readability

bar_width = 0.15 # Narrower bars for grouped chart
index = range(len(df_pivot_rnd['Period']))

positions = [pos + bar_width*i for i in range(len(departments_to_plot)) for pos in index] # Calculate positions for grouped bars

for i, department in enumerate(departments_to_plot):
    plt.bar([pos + bar_width * i for pos in index], df_pivot_rnd[department], bar_width, label=department)


plt.xlabel('Period (Quarterly)')
plt.ylabel('Total RnD Expense (Millions)')
plt.title('RnD Expenses by Department Over Time (Grouped Bar Chart)')
plt.xticks([pos + bar_width * (len(departments_to_plot)-1)/2 for pos in index], [pd.Timestamp(p).strftime('%Y-%m') for p in df_pivot_rnd['Period']], rotation=45, ha='right') # Centered xticks
plt.legend(title='Departments')
plt.grid(axis='y', linestyle='--', alpha=0.6)
plt.tight_layout()
plt.show()


cursor.close()
conn.close()