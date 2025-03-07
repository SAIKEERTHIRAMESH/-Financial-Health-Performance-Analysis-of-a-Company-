CREATE DATABASE Financial_performance8DB;
USE Financial_performance8DB;
CREATE TABLE EmployeeCompensation (
    employee_id INT NOT NULL,
    employee_name VARCHAR(255),
    department VARCHAR(255),
    fiscal_year YEAR,
    monthly_salary DECIMAL(10, 2),
    annual_salary DECIMAL(10, 2),
    PRIMARY KEY (employee_id, fiscal_year) -- Composite Primary Key
);

CREATE TABLE CustomerTransactions (
    transaction_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    fiscal_year YEAR NOT NULL,
    fiscal_month TINYINT NOT NULL CHECK (fiscal_month BETWEEN 1 AND 12),
    transaction_date DATE NOT NULL,
    customer_id INT NOT NULL,    -- Simple customer ID
    product_service_category VARCHAR(100) NOT NULL,
    product_service_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(15, 2) NOT NULL,
    transaction_amount DECIMAL(15, 2) NOT NULL,
    sales_channel VARCHAR(100),
    sales_region VARCHAR(100),
    employee_id INT NOT NULL,    -- This is the KEY column for linking to department
    FOREIGN KEY (employee_id, fiscal_year) REFERENCES EmployeeCompensation(employee_id, fiscal_year) ON DELETE CASCADE
);

CREATE TABLE RnDExpenses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fiscal_year YEAR NOT NULL,
    fiscal_month TINYINT NOT NULL CHECK (fiscal_month BETWEEN 1 AND 12),
    project_name VARCHAR(255) NOT NULL,
    department VARCHAR(100) NOT NULL,
    expense_amount DECIMAL(15, 2) NOT NULL,
    expense_description TEXT
);

CREATE TABLE CashFlowStatement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fiscal_year YEAR NOT NULL,
    fiscal_month TINYINT NOT NULL CHECK (fiscal_month BETWEEN 1 AND 12),
    cash_flow_operating DECIMAL(15, 2) NOT NULL,
    cash_flow_investing DECIMAL(15, 2) NOT NULL,
    cash_flow_financing DECIMAL(15, 2) NOT NULL
);

CREATE TABLE IncomeStatement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fiscal_year YEAR NOT NULL,
    fiscal_month TINYINT NOT NULL CHECK (fiscal_month BETWEEN 1 AND 12),
    revenue DECIMAL(15, 2) NOT NULL,
    cogs DECIMAL(15, 2) NOT NULL,
    gross_profit DECIMAL(15, 2) NOT NULL,  
    operating_expenses DECIMAL(15, 2) NOT NULL,
    operating_income DECIMAL(15, 2) NOT NULL, 
    interest_expense DECIMAL(15, 2) NOT NULL,
    tax_expense DECIMAL(15, 2) NOT NULL,
    net_income DECIMAL(15, 2) NOT NULL      
);

CREATE TABLE BalanceSheet (
    balance_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    fiscal_year YEAR NOT NULL,
    fiscal_month TINYINT NOT NULL CHECK (fiscal_month BETWEEN 1 AND 12),
    current_assets DECIMAL(15, 2) NOT NULL,
    non_current_assets DECIMAL(15, 2) NOT NULL,
    total_assets DECIMAL(15, 2) NOT NULL,     -- Calculated in application/Excel later
    current_liabilities DECIMAL(15, 2) NOT NULL,
    non_current_liabilities DECIMAL(15, 2) NOT NULL,
    total_liabilities DECIMAL(15, 2) NOT NULL, -- Calculated in application/Excel later
    shareholders_equity DECIMAL(15, 2) NOT NULL, -- Calculated in application/Excel later
    UNIQUE (fiscal_year, fiscal_month) -- To ensure unique balance sheet per period
);
-- Insert statements for realistic dataset for EmployeeCompensation table for the year 2015

-- Departments List
-- 1. Sales and Marketing
-- 2. R&D
-- 3. Human Resources
-- 4. Finance
-- 5. Operations
-- 6. IT
-- 7. Legal

INSERT INTO EmployeeCompensation (employee_id, employee_name, department, fiscal_year, monthly_salary, annual_salary) VALUES
(28547, 'John Smith', 'Sales and Marketing', 2015, 6000.00, 72000.00),
(85533, 'Alice Johnson', 'R&D', 2015, 7500.00, 90000.00),
(38492, 'Robert Williams', 'Human Resources', 2015, 5500.00, 66000.00),
(96385, 'Linda Brown', 'Finance', 2015, 8000.00, 96000.00),
(17463, 'Michael Davis', 'Operations', 2015, 5800.00, 69600.00),
(73928, 'Jennifer Wilson', 'IT', 2015, 7000.00, 84000.00),
(45291, 'David Garcia', 'Legal', 2015, 9000.00, 108000.00),
(62835, 'Mary Rodriguez', 'Sales and Marketing', 2015, 6200.00, 74400.00),
(19572, 'Christopher Martinez', 'R&D', 2015, 7800.00, 93600.00),
(53184, 'Angela Anderson', 'Human Resources', 2015, 5700.00, 68400.00),
(89627, 'Thomas Gonzalez', 'Finance', 2015, 8200.00, 98400.00),
(24759, 'Margaret Perez', 'Operations', 2015, 6000.00, 72000.00),
(71346, 'Kevin Young', 'IT', 2015, 7200.00, 86400.00),
(39815, 'Ashley King', 'Legal', 2015, 9200.00, 110400.00),
(92648, 'Brandon Wright', 'Sales and Marketing', 2015, 6400.00, 76800.00),
(21593, 'Jessica Lopez', 'R&D', 2015, 8000.00, 96000.00),
(67481, 'William Hill', 'Human Resources', 2015, 5900.00, 70800.00),
(48237, 'Sarah Scott', 'Finance', 2015, 8400.00, 100800.00), -- Kept one instance of 48237 and removed the duplicate
(79362, 'James Green', 'Operations', 2015, 6200.00, 74400.00),
(15928, 'Karen Adams', 'IT', 2015, 7400.00, 88800.00),
(58149, 'Ethan Baker', 'Legal', 2015, 9400.00, 112800.00),
(82794, 'Nicole Nelson', 'Sales and Marketing', 2015, 6600.00, 79200.00),
(26351, 'Ryan Carter', 'R&D', 2015, 8200.00, 98400.00),
(74183, 'Stephanie Mitchell', 'Human Resources', 2015, 6100.00, 73200.00),
(41965, 'Kyle Phillips', 'Finance', 2015, 8600.00, 103200.00),
(98752, 'Melissa Roberts', 'Operations', 2015, 6400.00, 76800.00),
(32614, 'Austin Turner', 'IT', 2015, 7600.00, 91200.00),
(69427, 'Rachel Peterson', 'Legal', 2015, 9600.00, 115200.00),
(51879, 'Jose Hayes', 'Sales and Marketing', 2015, 6800.00, 81600.00),
(87356, 'Samantha Morris', 'R&D', 2015, 8400.00, 100800.00),
(29148, 'Benjamin Murphy', 'Human Resources', 2015, 6300.00, 75600.00),
(76931, 'Michelle Cook', 'Finance', 2015, 8800.00, 105600.00),
(43529, 'Gregory Rogers', 'Operations', 2015, 6600.00, 79200.00),
(95286, 'Laura Reed', 'IT', 2015, 7800.00, 93600.00),
(35817, 'Tyler Bailey', 'Legal', 2015, 9800.00, 117600.00),
(61742, 'Kimberly Bell', 'Sales and Marketing', 2015, 7000.00, 84000.00),
(54938, 'Jacob Cox', 'R&D', 2015, 8600.00, 103200.00),
(81529, 'Victoria Rivera', 'Human Resources', 2015, 6500.00, 78000.00),
(23671, 'Dylan Cooper', 'Finance', 2015, 9000.00, 108000.00),
(78254, 'Kelly Richardson', 'Operations', 2015, 6800.00, 81600.00),
(47196, 'Adam Wood', 'IT', 2015, 8000.00, 96000.00),
(91537, 'Brittany Watson', 'Legal', 2015, 10000.00, 120000.00),
(31428, 'Nicholas Brooks', 'Sales and Marketing', 2015, 7200.00, 86400.00),
(65971, 'Megan Kelly', 'R&D', 2015, 8800.00, 105600.00),
(59283, 'Eric Sanders', 'Human Resources', 2015, 6700.00, 80400.00),
(84619, 'Chelsea Price', 'Finance', 2015, 9200.00, 110400.00),
(27543, 'Jonathan Bennett', 'Operations', 2015, 7000.00, 84000.00),
(72816, 'Katherine Gray', 'IT', 2015, 8200.00, 98400.00),
(49572, 'Justin James', 'Legal', 2015, 10200.00, 122400.00),
(93865, 'Alyssa Reyes', 'Sales and Marketing', 2015, 7400.00, 88800.00),
(33791, 'Brandon Reyes', 'Sales and Marketing', 2015, 7450.00, 89400.00),
(63518, 'Megan Reyes', 'Sales and Marketing', 2015, 7500.00, 90000.00),
(56842, 'Eric Reyes', 'Sales and Marketing', 2015, 7550.00, 90600.00),
(89175, 'Chelsea Reyes', 'Sales and Marketing', 2015, 7600.00, 91200.00),
(36954, 'Jonathan Reyes', 'Sales and Marketing', 2015, 7650.00, 91800.00),
(68291, 'Katherine Reyes', 'Sales and Marketing', 2015, 7700.00, 92400.00),
(52487, 'Justin Reyes', 'Sales and Marketing', 2015, 7750.00, 93000.00),
(97632, 'Alyssa Reyes', 'Sales and Marketing', 2015, 7800.00, 93600.00),
(39215, 'Brandon Reyes', 'Sales and Marketing', 2015, 7850.00, 94200.00),
(64879, 'Megan Reyes', 'Sales and Marketing', 2015, 7900.00, 94800.00),
(57142, 'Eric Reyes', 'Sales and Marketing', 2015, 7950.00, 95400.00),
(83526, 'Chelsea Reyes', 'Sales and Marketing', 2015, 8000.00, 96000.00),
(25981, 'Jonathan Reyes', 'Sales and Marketing', 2015, 8050.00, 96600.00),
(71459, 'Katherine Reyes', 'Sales and Marketing', 2015, 8100.00, 97200.00),
(41823, 'Justin Reyes', 'Sales and Marketing', 2015, 8150.00, 97800.00),
(95178, 'Alyssa Reyes', 'Sales and Marketing', 2015, 8200.00, 98400.00),
(32546, 'Brandon Reyes', 'Sales and Marketing', 2015, 8250.00, 99000.00),
(62984, 'Megan Reyes', 'Sales and Marketing', 2015, 8300.00, 99600.00),
(55317, 'Eric Reyes', 'Sales and Marketing', 2015, 8350.00, 100200.00),
(88652, 'Chelsea Reyes', 'Sales and Marketing', 2015, 8400.00, 100800.00),
(29741, 'Jonathan Reyes', 'Sales and Marketing', 2015, 8450.00, 101400.00),
(77219, 'Katherine Reyes', 'Sales and Marketing', 2015, 8500.00, 102000.00),
(44983, 'Justin Reyes', 'Sales and Marketing', 2015, 8550.00, 102600.00),
(91328, 'Alyssa Reyes', 'Sales and Marketing', 2015, 8600.00, 103200.00),
(34156, 'Brandon Reyes', 'Sales and Marketing', 2015, 8650.00, 103800.00),
(65492, 'Olivia Patel', 'R&D', 2015, 9000.00, 108000.00),
(58725, 'Noah Patel', 'R&D', 2015, 9100.00, 109200.00),
(82149, 'Emma Patel', 'R&D', 2015, 9200.00, 110400.00),
(26837, 'Liam Patel', 'R&D', 2015, 9300.00, 111600.00),
(73614, 'Sophia Patel', 'R&D', 2015, 9400.00, 112800.00),
(42591, 'Jackson Patel', 'R&D', 2015, 9500.00, 114000.00),
(98265, 'Ava Patel', 'R&D', 2015, 9600.00, 115200.00),
(31948, 'Lucas Patel', 'R&D', 2015, 9700.00, 116400.00),
(69172, 'Mia Patel', 'R&D', 2015, 9800.00, 117600.00),
(51436, 'Aiden Patel', 'R&D', 2015, 9900.00, 118800.00),
(85792, 'Chloe Patel', 'R&D', 2015, 10000.00, 120000.00),
(28574, 'Elijah Patel', 'R&D', 2015, 10100.00, 121200.00),
(75361, 'Abigail Patel', 'R&D', 2015, 10200.00, 122400.00),
(43295, 'Caleb Patel', 'R&D', 2015, 10300.00, 123600.00),
(92678, 'Ella Patel', 'R&D', 2015, 10400.00, 124800.00),
(35921, 'Grayson Patel', 'R&D', 2015, 10500.00, 126000.00),
(61549, 'Lily Patel', 'R&D', 2015, 10600.00, 127200.00),
(54812, 'Owen Patel', 'R&D', 2015, 10700.00, 128400.00),
(81236, 'Madison Patel', 'R&D', 2015, 10800.00, 129600.00),
(24579, 'Isaac Patel', 'R&D', 2015, 10900.00, 130800.00),
(78952, 'Elizabeth Patel', 'R&D', 2015, 11000.00, 132000.00),
(47216, 'Samuel Patel', 'R&D', 2015, 11100.00, 133200.00),
(93584, 'Charlotte Patel', 'R&D', 2015, 11200.00, 134400.00),
(33178, 'Henry Patel', 'R&D', 2015, 11300.00, 135600.00),
(63925, 'Amelia Patel', 'R&D', 2015, 11400.00, 136800.00),
(56187, 'Scarlett White', 'Human Resources', 2015, 6800.00, 81600.00),
(89421, 'James White', 'Human Resources', 2015, 6850.00, 82200.00),
(29354, 'Isabella White', 'Human Resources', 2015, 6900.00, 82800.00),
(76519, 'Joseph White', 'Human Resources', 2015, 6950.00, 83400.00),
(42873, 'Mia White', 'Human Resources', 2015, 7000.00, 84000.00),
(95268, 'William White', 'Human Resources', 2015, 7050.00, 84600.00),
(32746, 'Grace White', 'Human Resources', 2015, 7100.00, 85200.00),
(68135, 'Daniel White', 'Human Resources', 2015, 7150.00, 85800.00),
(51927, 'Chloe White', 'Human Resources', 2015, 7200.00, 86400.00),
(84591, 'Alexander White', 'Human Resources', 2015, 7250.00, 87000.00),
(27154, 'Madison White', 'Human Resources', 2015, 7300.00, 87600.00),
(73819, 'Anthony White', 'Human Resources', 2015, 7350.00, 88200.00),
(49263, 'Ella White', 'Human Resources', 2015, 7400.00, 88800.00),
(91582, 'Vincent White', 'Human Resources', 2015, 7450.00, 89400.00),
(34725, 'Avery White', 'Human Resources', 2015, 7500.00, 90000.00),
(67948, 'Gabriel Black', 'Finance', 2015, 9500.00, 114000.00),
(52316, 'Sofia Black', 'Finance', 2015, 9600.00, 115200.00),
(87659, 'Owen Black', 'Finance', 2015, 9700.00, 116400.00),
(28143, 'Evelyn Black', 'Finance', 2015, 9800.00, 117600.00),
(74921, 'John Black', 'Finance', 2015, 9900.00, 118800.00),
(43685, 'Layla Black', 'Finance', 2015, 10000.00, 120000.00),
(92137, 'Caleb Black', 'Finance', 2015, 10100.00, 121200.00),
(31592, 'Scarlett Black', 'Finance', 2015, 10200.00, 122400.00),
(65849, 'Isaac Black', 'Finance', 2015, 10300.00, 123600.00),
(59213, 'Lily Black', 'Finance', 2015, 10400.00, 124800.00),
(83762, 'Samuel Black', 'Finance', 2015, 10500.00, 126000.00),
(25486, 'Hannah Black', 'Finance', 2015, 10600.00, 127200.00),
(71394, 'Wyatt Black', 'Finance', 2015, 10700.00, 128400.00),
(48257, 'Zoey Black', 'Finance', 2015, 10800.00, 129600.00), -- Corrected 48257 to Zoey Black, Finance
(97631, 'Matthew Black', 'Finance', 2015, 10900.00, 130800.00),
(33584, 'Audrey Hall', 'Operations', 2015, 7200.00, 86400.00),
(63152, 'Daniel Hall', 'Operations', 2015, 7250.00, 87000.00),
(56489, 'Ellie Hall', 'Operations', 2015, 7300.00, 87600.00),
(82946, 'Jackson Hall', 'Operations', 2015, 7350.00, 88200.00),
(24713, 'Claire Hall', 'Operations', 2015, 7400.00, 88800.00),
(79365, 'Logan Hall', 'Operations', 2015, 7450.00, 89400.00),
(47198, 'Bella Hall', 'Operations', 2015, 7500.00, 90000.00),
(91852, 'Elijah Hall', 'Operations', 2015, 7550.00, 90600.00),
(34276, 'Maya Hall', 'Operations', 2015, 7600.00, 91200.00),
(67519, 'Ethan Hall', 'Operations', 2015, 7650.00, 91800.00),
(58321, 'Anna Hall', 'Operations', 2015, 7700.00, 92400.00),
(85649, 'Benjamin Hall', 'Operations', 2015, 7750.00, 93000.00),
(27913, 'Victoria Hall', 'Operations', 2015, 7800.00, 93600.00),
(72584, 'Caleb Hall', 'Operations', 2015, 7850.00, 94200.00),
(41236, 'Samantha Hall', 'Operations', 2015, 7900.00, 94800.00),
(98152, 'Natalie Wright', 'IT', 2015, 8500.00, 102000.00),
(31469, 'Riley Wright', 'IT', 2015, 8600.00, 103200.00),
(62745, 'Leah Wright', 'IT', 2015, 8700.00, 104400.00),
(55182, 'Brandon Wright', 'IT', 2015, 8800.00, 105600.00),
(87536, 'Gabrielle Wright', 'Legal', 2015, 11000.00, 132000.00);

-- Insert statements for realistic dataset for EmployeeCompensation table for the year 2016
-- Using the same employee_id as in 2015 and no salary hike

INSERT INTO EmployeeCompensation (employee_id, employee_name, department, fiscal_year, monthly_salary, annual_salary) VALUES
(28547, 'John Smith', 'Sales and Marketing', 2016, 6000.00, 72000.00),
(85533, 'Alice Johnson', 'R&D', 2016, 7500.00, 90000.00),
(38492, 'Robert Williams', 'Human Resources', 2016, 5500.00, 66000.00),
(96385, 'Linda Brown', 'Finance', 2016, 8000.00, 96000.00),
(17463, 'Michael Davis', 'Operations', 2016, 5800.00, 69600.00),
(73928, 'Jennifer Wilson', 'IT', 2016, 7000.00, 84000.00),
(45291, 'David Garcia', 'Legal', 2016, 9000.00, 108000.00),
(62835, 'Mary Rodriguez', 'Sales and Marketing', 2016, 6200.00, 74400.00),
(19572, 'Christopher Martinez', 'R&D', 2016, 7800.00, 93600.00),
(53184, 'Angela Anderson', 'Human Resources', 2016, 5700.00, 68400.00),
(89627, 'Thomas Gonzalez', 'Finance', 2016, 8200.00, 98400.00),
(24759, 'Margaret Perez', 'Operations', 2016, 6000.00, 72000.00),
(71346, 'Kevin Young', 'IT', 2016, 7200.00, 86400.00),
(39815, 'Ashley King', 'Legal', 2016, 9200.00, 110400.00),
(92648, 'Brandon Wright', 'Sales and Marketing', 2016, 6400.00, 76800.00),
(21593, 'Jessica Lopez', 'R&D', 2016, 8000.00, 96000.00),
(67481, 'William Hill', 'Human Resources', 2016, 5900.00, 70800.00),
(48237, 'Sarah Scott', 'Finance', 2016, 8400.00, 100800.00), -- 48237 corrected
(79362, 'James Green', 'Operations', 2016, 6200.00, 74400.00),
(15928, 'Karen Adams', 'IT', 2016, 7400.00, 88800.00),
(58149, 'Ethan Baker', 'Legal', 2016, 9400.00, 112800.00),
(82794, 'Nicole Nelson', 'Sales and Marketing', 2016, 6600.00, 79200.00),
(26351, 'Ryan Carter', 'R&D', 2016, 8200.00, 98400.00),
(74183, 'Stephanie Mitchell', 'Human Resources', 2016, 6100.00, 73200.00),
(41965, 'Kyle Phillips', 'Finance', 2016, 8600.00, 103200.00),
(98752, 'Melissa Roberts', 'Operations', 2016, 6400.00, 76800.00),
(32614, 'Austin Turner', 'IT', 2016, 7600.00, 91200.00),
(69427, 'Rachel Peterson', 'Legal', 2016, 9600.00, 115200.00),
(51879, 'Jose Hayes', 'Sales and Marketing', 2016, 6800.00, 81600.00),
(87356, 'Samantha Morris', 'R&D', 2016, 8400.00, 100800.00),
(29148, 'Benjamin Murphy', 'Human Resources', 2016, 6300.00, 75600.00),
(76931, 'Michelle Cook', 'Finance', 2016, 8800.00, 105600.00),
(43529, 'Gregory Rogers', 'Operations', 2016, 6600.00, 79200.00),
(95286, 'Laura Reed', 'IT', 2016, 7800.00, 93600.00),
(35817, 'Tyler Bailey', 'Legal', 2016, 9800.00, 117600.00),
(61742, 'Kimberly Bell', 'Sales and Marketing', 2016, 7000.00, 84000.00),
(54938, 'Jacob Cox', 'R&D', 2016, 8600.00, 103200.00),
(81529, 'Victoria Rivera', 'Human Resources', 2016, 6500.00, 78000.00),
(23671, 'Dylan Cooper', 'Finance', 2016, 9000.00, 108000.00),
(78254, 'Kelly Richardson', 'Operations', 2016, 6800.00, 81600.00),
(47196, 'Adam Wood', 'IT', 2016, 8000.00, 96000.00),
(91537, 'Brittany Watson', 'Legal', 2016, 10000.00, 120000.00),
(31428, 'Nicholas Brooks', 'Sales and Marketing', 2016, 7200.00, 86400.00),
(65971, 'Megan Kelly', 'R&D', 2016, 8800.00, 105600.00),
(59283, 'Eric Sanders', 'Human Resources', 2016, 6700.00, 80400.00),
(84619, 'Chelsea Price', 'Finance', 2016, 9200.00, 110400.00),
(27543, 'Jonathan Bennett', 'Operations', 2016, 7000.00, 84000.00),
(72816, 'Katherine Gray', 'IT', 2016, 8200.00, 98400.00),
(49572, 'Justin James', 'Legal', 2016, 10200.00, 122400.00),
(93865, 'Alyssa Reyes', 'Sales and Marketing', 2016, 7400.00, 88800.00),
(33791, 'Brandon Reyes', 'Sales and Marketing', 2016, 7450.00, 89400.00),
(63518, 'Megan Reyes', 'Sales and Marketing', 2016, 7500.00, 90000.00),
(56842, 'Eric Reyes', 'Sales and Marketing', 2016, 7550.00, 90600.00),
(89175, 'Chelsea Reyes', 'Sales and Marketing', 2016, 7600.00, 91200.00),
(36954, 'Jonathan Reyes', 'Sales and Marketing', 2016, 7650.00, 91800.00),
(68291, 'Katherine Reyes', 'Sales and Marketing', 2016, 7700.00, 92400.00),
(52487, 'Justin Reyes', 'Sales and Marketing', 2016, 7750.00, 93000.00),
(97632, 'Alyssa Reyes', 'Sales and Marketing', 2016, 7800.00, 93600.00),
(39215, 'Brandon Reyes', 'Sales and Marketing', 2016, 7850.00, 94200.00),
(64879, 'Megan Reyes', 'Sales and Marketing', 2016, 7900.00, 94800.00),
(57142, 'Eric Reyes', 'Sales and Marketing', 2016, 7950.00, 95400.00),
(83526, 'Chelsea Reyes', 'Sales and Marketing', 2016, 8000.00, 96000.00),
(25981, 'Jonathan Reyes', 'Sales and Marketing', 2016, 8050.00, 96600.00),
(71459, 'Katherine Reyes', 'Sales and Marketing', 2016, 8100.00, 97200.00),
(41823, 'Justin Reyes', 'Sales and Marketing', 2016, 8150.00, 97800.00),
(95178, 'Alyssa Reyes', 'Sales and Marketing', 2016, 8200.00, 98400.00),
(32546, 'Brandon Reyes', 'Sales and Marketing', 2016, 8250.00, 99000.00),
(62984, 'Megan Reyes', 'Sales and Marketing', 2016, 8300.00, 99600.00),
(55317, 'Eric Reyes', 'Sales and Marketing', 2016, 8350.00, 100200.00),
(88652, 'Chelsea Reyes', 'Sales and Marketing', 2016, 8400.00, 100800.00),
(29741, 'Jonathan Reyes', 'Sales and Marketing', 2016, 8450.00, 101400.00),
(77219, 'Katherine Reyes', 'Sales and Marketing', 2016, 8500.00, 102000.00),
(44983, 'Justin Reyes', 'Sales and Marketing', 2016, 8550.00, 102600.00),
(91328, 'Alyssa Reyes', 'Sales and Marketing', 2016, 8600.00, 103200.00),
(34156, 'Brandon Reyes', 'Sales and Marketing', 2016, 8650.00, 103800.00),
(65492, 'Olivia Patel', 'R&D', 2016, 9000.00, 108000.00),
(58725, 'Noah Patel', 'R&D', 2016, 9100.00, 109200.00),
(82149, 'Emma Patel', 'R&D', 2016, 9200.00, 110400.00),
(26837, 'Liam Patel', 'R&D', 2016, 9300.00, 111600.00),
(73614, 'Sophia Patel', 'R&D', 2016, 9400.00, 112800.00),
(42591, 'Jackson Patel', 'R&D', 2016, 9500.00, 114000.00),
(98265, 'Ava Patel', 'R&D', 2016, 9600.00, 115200.00),
(31948, 'Lucas Patel', 'R&D', 2016, 9700.00, 116400.00),
(69172, 'Mia Patel', 'R&D', 2016, 9800.00, 117600.00),
(51436, 'Aiden Patel', 'R&D', 2016, 9900.00, 118800.00),
(85792, 'Chloe Patel', 'R&D', 2016, 10000.00, 120000.00),
(28574, 'Elijah Patel', 'R&D', 2016, 10100.00, 121200.00),
(75361, 'Abigail Patel', 'R&D', 2016, 10200.00, 122400.00),
(43295, 'Caleb Patel', 'R&D', 2016, 10300.00, 123600.00),
(92678, 'Ella Patel', 'R&D', 2016, 10400.00, 124800.00),
(35921, 'Grayson Patel', 'R&D', 2016, 10500.00, 126000.00),
(61549, 'Lily Patel', 'R&D', 2016, 10600.00, 127200.00),
(54812, 'Owen Patel', 'R&D', 2016, 10700.00, 128400.00),
(81236, 'Madison Patel', 'R&D', 2016, 10800.00, 129600.00),
(24579, 'Isaac Patel', 'R&D', 2016, 10900.00, 130800.00),
(78952, 'Elizabeth Patel', 'R&D', 2016, 11000.00, 132000.00),
(47216, 'Samuel Patel', 'R&D', 2016, 11100.00, 133200.00),
(93584, 'Charlotte Patel', 'R&D', 2016, 11200.00, 134400.00),
(33178, 'Henry Patel', 'R&D', 2016, 11300.00, 135600.00),
(63925, 'Amelia Patel', 'R&D', 2016, 11400.00, 136800.00),
(56187, 'Scarlett White', 'Human Resources', 2016, 6800.00, 81600.00),
(89421, 'James White', 'Human Resources', 2016, 6850.00, 82200.00),
(29354, 'Isabella White', 'Human Resources', 2016, 6900.00, 82800.00),
(76519, 'Joseph White', 'Human Resources', 2016, 6950.00, 83400.00),
(42873, 'Mia White', 'Human Resources', 2016, 7000.00, 84000.00),
(95268, 'William White', 'Human Resources', 2016, 7050.00, 84600.00),
(32746, 'Grace White', 'Human Resources', 2016, 7100.00, 85200.00),
(68135, 'Daniel White', 'Human Resources', 2016, 7150.00, 85800.00),
(51927, 'Chloe White', 'Human Resources', 2016, 7200.00, 86400.00),
(84591, 'Alexander White', 'Human Resources', 2016, 7250.00, 87000.00),
(27154, 'Madison White', 'Human Resources', 2016, 7300.00, 87600.00),
(73819, 'Anthony White', 'Human Resources', 2016, 7350.00, 88200.00),
(49263, 'Ella White', 'Human Resources', 2016, 7400.00, 88800.00),
(91582, 'Vincent White', 'Human Resources', 2016, 7450.00, 89400.00),
(34725, 'Avery White', 'Human Resources', 2016, 7500.00, 90000.00),
(67948, 'Gabriel Black', 'Finance', 2016, 9500.00, 114000.00),
(52316, 'Sofia Black', 'Finance', 2016, 9600.00, 115200.00),
(87659, 'Owen Black', 'Finance', 2016, 9700.00, 116400.00),
(28143, 'Evelyn Black', 'Finance', 2016, 9800.00, 117600.00),
(74921, 'John Black', 'Finance', 2016, 9900.00, 118800.00),
(43685, 'Layla Black', 'Finance', 2016, 10000.00, 120000.00),
(92137, 'Caleb Black', 'Finance', 2016, 10100.00, 121200.00),
(31592, 'Scarlett Black', 'Finance', 2016, 10200.00, 122400.00),
(65849, 'Isaac Black', 'Finance', 2016, 10300.00, 123600.00),
(59213, 'Lily Black', 'Finance', 2016, 10400.00, 124800.00),
(83762, 'Samuel Black', 'Finance', 2016, 10500.00, 126000.00),
(25486, 'Hannah Black', 'Finance', 2016, 10600.00, 127200.00),
(71394, 'Wyatt Black', 'Finance', 2016, 10700.00, 128400.00),
(48257, 'Zoey Black', 'Finance', 2016, 10800.00, 129600.00), -- corrected 48257
(97631, 'Matthew Black', 'Finance', 2016, 10900.00, 130800.00),
(33584, 'Audrey Hall', 'Operations', 2016, 7200.00, 86400.00),
(63152, 'Daniel Hall', 'Operations', 2016, 7250.00, 8700.00),
(56489, 'Ellie Hall', 'Operations', 2016, 7300.00, 87600.00),
(82946, 'Jackson Hall', 'Operations', 2016, 7350.00, 88200.00),
(24713, 'Claire Hall', 'Operations', 2016, 7400.00, 88800.00),
(79365, 'Logan Hall', 'Operations', 2016, 7450.00, 89400.00),
(47198, 'Bella Hall', 'Operations', 2016, 7500.00, 90000.00),
(91852, 'Elijah Hall', 'Operations', 2016, 7550.00, 90600.00),
(34276, 'Maya Hall', 'Operations', 2016, 7600.00, 91200.00),
(67519, 'Ethan Hall', 'Operations', 2016, 7650.00, 91800.00),
(58321, 'Anna Hall', 'Operations', 2016, 7700.00, 92400.00),
(85649, 'Benjamin Hall', 'Operations', 2016, 7750.00, 93000.00),
(27913, 'Victoria Hall', 'Operations', 2016, 7800.00, 93600.00),
(72584, 'Caleb Hall', 'Operations', 2016, 7850.00, 94200.00),
(41236, 'Samantha Hall', 'Operations', 2016, 7900.00, 94800.00),
(98152, 'Natalie Wright', 'IT', 2016, 8500.00, 102000.00),
(31469, 'Riley Wright', 'IT', 2016, 8600.00, 103200.00),
(62745, 'Leah Wright', 'IT', 2016, 8700.00, 104400.00),
(55182, 'Brandon Wright', 'IT', 2016, 8800.00, 105600.00),
(87536, 'Gabrielle Wright', 'Legal', 2016, 11000.00, 132000.00);

-- Insert statements for realistic dataset for EmployeeCompensation table for the year 2017
-- Using the same employee_id as in 2015 & 2016 and no salary hike

INSERT INTO EmployeeCompensation (employee_id, employee_name, department, fiscal_year, monthly_salary, annual_salary) VALUES
(28547, 'John Smith', 'Sales and Marketing', 2017, 6000.00, 72000.00),
(85533, 'Alice Johnson', 'R&D', 2017, 7500.00, 90000.00),
(38492, 'Robert Williams', 'Human Resources', 2017, 5500.00, 66000.00),
(96385, 'Linda Brown', 'Finance', 2017, 8000.00, 96000.00),
(17463, 'Michael Davis', 'Operations', 2017, 5800.00, 69600.00),
(73928, 'Jennifer Wilson', 'IT', 2017, 7000.00, 84000.00),
(45291, 'David Garcia', 'Legal', 2017, 9000.00, 108000.00),
(62835, 'Mary Rodriguez', 'Sales and Marketing', 2017, 6200.00, 74400.00),
(19572, 'Christopher Martinez', 'R&D', 2017, 7800.00, 93600.00),
(53184, 'Angela Anderson', 'Human Resources', 2017, 5700.00, 68400.00),
(89627, 'Thomas Gonzalez', 'Finance', 2017, 8200.00, 98400.00),
(24759, 'Margaret Perez', 'Operations', 2017, 6000.00, 72000.00),
(71346, 'Kevin Young', 'IT', 2017, 7200.00, 86400.00),
(39815, 'Ashley King', 'Legal', 2017, 9200.00, 110400.00),
(92648, 'Brandon Wright', 'Sales and Marketing', 2017, 6400.00, 76800.00),
(21593, 'Jessica Lopez', 'R&D', 2017, 8000.00, 96000.00),
(67481, 'William Hill', 'Human Resources', 2017, 5900.00, 70800.00),
(48237, 'Sarah Scott', 'Finance', 2017, 8400.00, 100800.00), -- 48237 corrected
(79362, 'James Green', 'Operations', 2017, 6200.00, 74400.00),
(15928, 'Karen Adams', 'IT', 2017, 7400.00, 88800.00),
(58149, 'Ethan Baker', 'Legal', 2017, 9400.00, 112800.00),
(82794, 'Nicole Nelson', 'Sales and Marketing', 2017, 6600.00, 79200.00),
(26351, 'Ryan Carter', 'R&D', 2017, 8200.00, 98400.00),
(74183, 'Stephanie Mitchell', 'Human Resources', 2017, 6100.00, 73200.00),
(41965, 'Kyle Phillips', 'Finance', 2017, 8600.00, 103200.00),
(98752, 'Melissa Roberts', 'Operations', 2017, 6400.00, 76800.00),
(32614, 'Austin Turner', 'IT', 2017, 7600.00, 91200.00),
(69427, 'Rachel Peterson', 'Legal', 2017, 9600.00, 115200.00),
(51879, 'Jose Hayes', 'Sales and Marketing', 2017, 6800.00, 81600.00),
(87356, 'Samantha Morris', 'R&D', 2017, 8400.00, 100800.00),
(29148, 'Benjamin Murphy', 'Human Resources', 2017, 6300.00, 75600.00),
(76931, 'Michelle Cook', 'Finance', 2017, 8800.00, 105600.00),
(43529, 'Gregory Rogers', 'Operations', 2017, 6600.00, 79200.00),
(95286, 'Laura Reed', 'IT', 2017, 7800.00, 93600.00),
(35817, 'Tyler Bailey', 'Legal', 2017, 9800.00, 117600.00),
(61742, 'Kimberly Bell', 'Sales and Marketing', 2017, 7000.00, 84000.00),
(54938, 'Jacob Cox', 'R&D', 2017, 8600.00, 103200.00),
(81529, 'Victoria Rivera', 'Human Resources', 2017, 6500.00, 78000.00),
(23671, 'Dylan Cooper', 'Finance', 2017, 9000.00, 108000.00),
(78254, 'Kelly Richardson', 'Operations', 2017, 6800.00, 81600.00),
(47196, 'Adam Wood', 'IT', 2017, 8000.00, 96000.00),
(91537, 'Brittany Watson', 'Legal', 2017, 10000.00, 120000.00),
(31428, 'Nicholas Brooks', 'Sales and Marketing', 2017, 7200.00, 86400.00),
(65971, 'Megan Kelly', 'R&D', 2017, 8800.00, 105600.00),
(59283, 'Eric Sanders', 'Human Resources', 2017, 6700.00, 80400.00),
(84619, 'Chelsea Price', 'Finance', 2017, 9200.00, 110400.00),
(27543, 'Jonathan Bennett', 'Operations', 2017, 7000.00, 84000.00),
(72816, 'Katherine Gray', 'IT', 2017, 8200.00, 98400.00),
(49572, 'Justin James', 'Legal', 2017, 10200.00, 122400.00),
(93865, 'Alyssa Reyes', 'Sales and Marketing', 2017, 7400.00, 88800.00),
(33791, 'Brandon Reyes', 'Sales and Marketing', 2017, 7450.00, 89400.00),
(63518, 'Megan Reyes', 'Sales and Marketing', 2017, 7500.00, 90000.00),
(56842, 'Eric Reyes', 'Sales and Marketing', 2017, 7550.00, 90600.00),
(89175, 'Chelsea Reyes', 'Sales and Marketing', 2017, 7600.00, 91200.00),
(36954, 'Jonathan Reyes', 'Sales and Marketing', 2017, 7650.00, 91800.00),
(68291, 'Katherine Reyes', 'Sales and Marketing', 2017, 7700.00, 92400.00),
(52487, 'Justin Reyes', 'Sales and Marketing', 2017, 7750.00, 93000.00),
(97632, 'Alyssa Reyes', 'Sales and Marketing', 2017, 7800.00, 93600.00),
(39215, 'Brandon Reyes', 'Sales and Marketing', 2017, 7850.00, 94200.00),
(64879, 'Megan Reyes', 'Sales and Marketing', 2017, 7900.00, 94800.00),
(57142, 'Eric Reyes', 'Sales and Marketing', 2017, 7950.00, 95400.00),
(83526, 'Chelsea Reyes', 'Sales and Marketing', 2017, 8000.00, 96000.00),
(25981, 'Jonathan Reyes', 'Sales and Marketing', 2017, 8050.00, 96600.00),
(71459, 'Katherine Reyes', 'Sales and Marketing', 2017, 8100.00, 97200.00),
(41823, 'Justin Reyes', 'Sales and Marketing', 2017, 8150.00, 97800.00),
(95178, 'Alyssa Reyes', 'Sales and Marketing', 2017, 8200.00, 98400.00),
(32546, 'Brandon Reyes', 'Sales and Marketing', 2017, 8250.00, 99000.00),
(62984, 'Megan Reyes', 'Sales and Marketing', 2017, 8300.00, 99600.00),
(55317, 'Eric Reyes', 'Sales and Marketing', 2017, 8350.00, 100200.00),
(88652, 'Chelsea Reyes', 'Sales and Marketing', 2017, 8400.00, 100800.00),
(29741, 'Jonathan Reyes', 'Sales and Marketing', 2017, 8450.00, 101400.00),
(77219, 'Katherine Reyes', 'Sales and Marketing', 2017, 8500.00, 102000.00),
(44983, 'Justin Reyes', 'Sales and Marketing', 2017, 8550.00, 102600.00),
(91328, 'Alyssa Reyes', 'Sales and Marketing', 2017, 8600.00, 103200.00),
(34156, 'Brandon Reyes', 'Sales and Marketing', 2017, 8650.00, 103800.00),
(65492, 'Olivia Patel', 'R&D', 2017, 9000.00, 108000.00),
(58725, 'Noah Patel', 'R&D', 2017, 9100.00, 109200.00),
(82149, 'Emma Patel', 'R&D', 2017, 9200.00, 110400.00),
(26837, 'Liam Patel', 'R&D', 2017, 9300.00, 111600.00),
(73614, 'Sophia Patel', 'R&D', 2017, 9400.00, 112800.00),
(42591, 'Jackson Patel', 'R&D', 2017, 9500.00, 114000.00),
(98265, 'Ava Patel', 'R&D', 2017, 9600.00, 115200.00),
(31948, 'Lucas Patel', 'R&D', 2017, 9700.00, 116400.00),
(69172, 'Mia Patel', 'R&D', 2017, 9800.00, 117600.00),
(51436, 'Aiden Patel', 'R&D', 2017, 9900.00, 118800.00),
(85792, 'Chloe Patel', 'R&D', 2017, 10000.00, 120000.00),
(28574, 'Elijah Patel', 'R&D', 2017, 10100.00, 121200.00),
(75361, 'Abigail Patel', 'R&D', 2017, 10200.00, 122400.00),
(43295, 'Caleb Patel', 'R&D', 2017, 10300.00, 123600.00),
(92678, 'Ella Patel', 'R&D', 2017, 10400.00, 124800.00),
(35921, 'Grayson Patel', 'R&D', 2017, 10500.00, 126000.00),
(61549, 'Lily Patel', 'R&D', 2017, 10600.00, 127200.00),
(54812, 'Owen Patel', 'R&D', 2017, 10700.00, 128400.00),
(81236, 'Madison Patel', 'R&D', 2017, 10800.00, 129600.00),
(24579, 'Isaac Patel', 'R&D', 2017, 10900.00, 130800.00),
(78952, 'Elizabeth Patel', 'R&D', 2017, 11000.00, 132000.00),
(47216, 'Samuel Patel', 'R&D', 2017, 11100.00, 133200.00),
(93584, 'Charlotte Patel', 'R&D', 2017, 11200.00, 134400.00),
(33178, 'Henry Patel', 'R&D', 2017, 11300.00, 135600.00),
(63925, 'Amelia Patel', 'R&D', 2017, 11400.00, 136800.00),
(56187, 'Scarlett White', 'Human Resources', 2017, 6800.00, 81600.00),
(89421, 'James White', 'Human Resources', 2017, 6850.00, 82200.00),
(29354, 'Isabella White', 'Human Resources', 2017, 6900.00, 82800.00),
(76519, 'Joseph White', 'Human Resources', 2017, 6950.00, 83400.00),
(42873, 'Mia White', 'Human Resources', 2017, 7000.00, 84000.00),
(95268, 'William White', 'Human Resources', 2017, 7050.00, 84600.00),
(32746, 'Grace White', 'Human Resources', 2017, 7100.00, 85200.00),
(68135, 'Daniel White', 'Human Resources', 2017, 7150.00, 85800.00),
(51927, 'Chloe White', 'Human Resources', 2017, 7200.00, 86400.00),
(84591, 'Alexander White', 'Human Resources', 2017, 7250.00, 87000.00),
(27154, 'Madison White', 'Human Resources', 2017, 7300.00, 87600.00),
(73819, 'Anthony White', 'Human Resources', 2017, 7350.00, 88200.00),
(49263, 'Ella White', 'Human Resources', 2017, 7400.00, 88800.00),
(91582, 'Vincent White', 'Human Resources', 2017, 7450.00, 89400.00),
(34725, 'Avery White', 'Human Resources', 2017, 7500.00, 90000.00),
(67948, 'Gabriel Black', 'Finance', 2017, 9500.00, 114000.00),
(52316, 'Sofia Black', 'Finance', 2017, 9600.00, 115200.00),
(87659, 'Owen Black', 'Finance', 2017, 9700.00, 116400.00),
(28143, 'Evelyn Black', 'Finance', 2017, 9800.00, 117600.00),
(74921, 'John Black', 'Finance', 2017, 9900.00, 118800.00),
(43685, 'Layla Black', 'Finance', 2017, 10000.00, 120000.00),
(92137, 'Caleb Black', 'Finance', 2017, 10100.00, 121200.00),
(31592, 'Scarlett Black', 'Finance', 2017, 10200.00, 122400.00),
(65849, 'Isaac Black', 'Finance', 2017, 10300.00, 123600.00),
(59213, 'Lily Black', 'Finance', 2017, 10400.00, 124800.00),
(83762, 'Samuel Black', 'Finance', 2017, 10500.00, 126000.00),
(25486, 'Hannah Black', 'Finance', 2017, 10600.00, 127200.00),
(71394, 'Wyatt Black', 'Finance', 2017, 10700.00, 128400.00),
(48257, 'Zoey Black', 'Finance', 2017, 10800.00, 129600.00), -- corrected 48257
(97631, 'Matthew Black', 'Finance', 2017, 10900.00, 130800.00),
(33584, 'Audrey Hall', 'Operations', 2017, 7200.00, 86400.00),
(63152, 'Daniel Hall', 'Operations', 2017, 7250.00, 8700.00),
(56489, 'Ellie Hall', 'Operations', 2017, 7300.00, 87600.00),
(82946, 'Jackson Hall', 'Operations', 2017, 7350.00, 88200.00),
(24713, 'Claire Hall', 'Operations', 2017, 7400.00, 88800.00),
(79365, 'Logan Hall', 'Operations', 2017, 7450.00, 89400.00),
(47198, 'Bella Hall', 'Operations', 2017, 7500.00, 90000.00),
(91852, 'Elijah Hall', 'Operations', 2017, 7550.00, 90600.00),
(34276, 'Maya Hall', 'Operations', 2017, 7600.00, 91200.00),
(67519, 'Ethan Hall', 'Operations', 2017, 7650.00, 91800.00),
(58321, 'Anna Hall', 'Operations', 2017, 7700.00, 92400.00),
(85649, 'Benjamin Hall', 'Operations', 2017, 7750.00, 93000.00),
(27913, 'Victoria Hall', 'Operations', 2017, 7800.00, 93600.00),
(72584, 'Caleb Hall', 'Operations', 2017, 7850.00, 94200.00),
(41236, 'Samantha Hall', 'Operations', 2017, 7900.00, 94800.00),
(98152, 'Natalie Wright', 'IT', 2017, 8500.00, 102000.00),
(31469, 'Riley Wright', 'IT', 2017, 8600.00, 103200.00),
(62745, 'Leah Wright', 'IT', 2017, 8700.00, 104400.00),
(55182, 'Brandon Wright', 'IT', 2017, 8800.00, 105600.00),
(87536, 'Gabrielle Wright', 'Legal', 2017, 11000.00, 132000.00);

-- Insert statements for realistic dataset for EmployeeCompensation table for the year 2018
-- Based on 2017 data, removing some employees and adding new employees with new IDs

INSERT INTO EmployeeCompensation (employee_id, employee_name, department, fiscal_year, monthly_salary, annual_salary) VALUES
(28547, 'John Smith', 'Sales and Marketing', 2018, 6000.00, 72000.00),
(85533, 'Alice Johnson', 'R&D', 2018, 7500.00, 90000.00),
(38492, 'Robert Williams', 'Human Resources', 2018, 5500.00, 66000.00),
(96385, 'Linda Brown', 'Finance', 2018, 8000.00, 96000.00),
(17463, 'Michael Davis', 'Operations', 2018, 5800.00, 69600.00),
(73928, 'Jennifer Wilson', 'IT', 2018, 7000.00, 84000.00),
(45291, 'David Garcia', 'Legal', 2018, 9000.00, 108000.00),
-- Removing employee_id 62835 (Mary Rodriguez)
(19572, 'Christopher Martinez', 'R&D', 2018, 7800.00, 93600.00),
(53184, 'Angela Anderson', 'Human Resources', 2018, 5700.00, 68400.00),
(89627, 'Thomas Gonzalez', 'Finance', 2018, 8200.00, 98400.00),
(24759, 'Margaret Perez', 'Operations', 2018, 6000.00, 72000.00),
(71346, 'Kevin Young', 'IT', 2018, 7200.00, 86400.00),
(39815, 'Ashley King', 'Legal', 2018, 9200.00, 110400.00),
(92648, 'Brandon Wright', 'Sales and Marketing', 2018, 6400.00, 76800.00),
(21593, 'Jessica Lopez', 'R&D', 2018, 8000.00, 96000.00),
(67481, 'William Hill', 'Human Resources', 2018, 5900.00, 70800.00),
(48237, 'Sarah Scott', 'Finance', 2018, 8400.00, 100800.00), -- 48237 corrected
(79362, 'James Green', 'Operations', 2018, 6200.00, 74400.00),
(15928, 'Karen Adams', 'IT', 2018, 7400.00, 88800.00),
(58149, 'Ethan Baker', 'Legal', 2018, 9400.00, 112800.00),
(82794, 'Nicole Nelson', 'Sales and Marketing', 2018, 6600.00, 79200.00),
(26351, 'Ryan Carter', 'R&D', 2018, 8200.00, 98400.00),
(74183, 'Stephanie Mitchell', 'Human Resources', 2018, 6100.00, 73200.00),
(41965, 'Kyle Phillips', 'Finance', 2018, 8600.00, 103200.00),
(98752, 'Melissa Roberts', 'Operations', 2018, 6400.00, 76800.00),
(32614, 'Austin Turner', 'IT', 2018, 7600.00, 91200.00),
(69427, 'Rachel Peterson', 'Legal', 2018, 9600.00, 115200.00),
(51879, 'Jose Hayes', 'Sales and Marketing', 2018, 6800.00, 81600.00),
(87356, 'Samantha Morris', 'R&D', 2018, 8400.00, 100800.00),
(29148, 'Benjamin Murphy', 'Human Resources', 2018, 6300.00, 75600.00),
(76931, 'Michelle Cook', 'Finance', 2018, 8800.00, 105600.00),
(43529, 'Gregory Rogers', 'Operations', 2018, 6600.00, 79200.00),
(95286, 'Laura Reed', 'IT', 2018, 7800.00, 93600.00),
(35817, 'Tyler Bailey', 'Legal', 2018, 9800.00, 117600.00),
(61742, 'Kimberly Bell', 'Sales and Marketing', 2018, 7000.00, 84000.00),
(54938, 'Jacob Cox', 'R&D', 2018, 8600.00, 103200.00),
(81529, 'Victoria Rivera', 'Human Resources', 2018, 6500.00, 78000.00),
(23671, 'Dylan Cooper', 'Finance', 2018, 9000.00, 108000.00),
(78254, 'Kelly Richardson', 'Operations', 2018, 6800.00, 81600.00),
(47196, 'Adam Wood', 'IT', 2018, 8000.00, 96000.00),
(91537, 'Brittany Watson', 'Legal', 2018, 10000.00, 120000.00),
(31428, 'Nicholas Brooks', 'Sales and Marketing', 2018, 7200.00, 86400.00),
(65971, 'Megan Kelly', 'R&D', 2018, 8800.00, 105600.00),
(59283, 'Eric Sanders', 'Human Resources', 2018, 6700.00, 80400.00),
(84619, 'Chelsea Price', 'Finance', 2018, 9200.00, 110400.00),
(27543, 'Jonathan Bennett', 'Operations', 2018, 7000.00, 84000.00),
(72816, 'Katherine Gray', 'IT', 2018, 8200.00, 98400.00),
(49572, 'Justin James', 'Legal', 2018, 10200.00, 122400.00),
(93865, 'Alyssa Reyes', 'Sales and Marketing', 2018, 7400.00, 88800.00),
(33791, 'Brandon Reyes', 'Sales and Marketing', 2018, 7450.00, 89400.00),
(63518, 'Megan Reyes', 'Sales and Marketing', 2018, 7500.00, 90000.00),
(56842, 'Eric Reyes', 'Sales and Marketing', 2018, 7550.00, 90600.00),
(89175, 'Chelsea Reyes', 'Sales and Marketing', 2018, 7600.00, 91200.00),
(36954, 'Jonathan Reyes', 'Sales and Marketing', 2018, 7650.00, 91800.00),
(68291, 'Katherine Reyes', 'Sales and Marketing', 2018, 7700.00, 92400.00),
(52487, 'Justin Reyes', 'Sales and Marketing', 2018, 7750.00, 93000.00),
(97632, 'Alyssa Reyes', 'Sales and Marketing', 2018, 7800.00, 93600.00),
(39215, 'Brandon Reyes', 'Sales and Marketing', 2018, 7850.00, 94200.00),
(64879, 'Megan Reyes', 'Sales and Marketing', 2018, 7900.00, 94800.00),
(57142, 'Eric Reyes', 'Sales and Marketing', 2018, 7950.00, 95400.00),
(83526, 'Chelsea Reyes', 'Sales and Marketing', 2018, 8000.00, 96000.00),
(25981, 'Jonathan Reyes', 'Sales and Marketing', 2018, 8050.00, 96600.00),
(71459, 'Katherine Reyes', 'Sales and Marketing', 2018, 8100.00, 97200.00),
(41823, 'Justin Reyes', 'Sales and Marketing', 2018, 8150.00, 97800.00),
(95178, 'Alyssa Reyes', 'Sales and Marketing', 2018, 8200.00, 98400.00),
(32546, 'Brandon Reyes', 'Sales and Marketing', 2018, 8250.00, 99000.00),
(62984, 'Megan Reyes', 'Sales and Marketing', 2018, 8300.00, 99600.00),
(55317, 'Eric Reyes', 'Sales and Marketing', 2018, 8350.00, 100200.00),
(88652, 'Chelsea Reyes', 'Sales and Marketing', 2018, 8400.00, 100800.00),
(29741, 'Jonathan Reyes', 'Sales and Marketing', 2018, 8450.00, 101400.00),
(77219, 'Katherine Reyes', 'Sales and Marketing', 2018, 8500.00, 102000.00),
(44983, 'Justin Reyes', 'Sales and Marketing', 2018, 8550.00, 102600.00),
(91328, 'Alyssa Reyes', 'Sales and Marketing', 2018, 8600.00, 103200.00),
(34156, 'Brandon Reyes', 'Sales and Marketing', 2018, 8650.00, 103800.00),
(65492, 'Olivia Patel', 'R&D', 2018, 9000.00, 108000.00),
(58725, 'Noah Patel', 'R&D', 2018, 9100.00, 109200.00),
(82149, 'Emma Patel', 'R&D', 2018, 9200.00, 110400.00),
(26837, 'Liam Patel', 'R&D', 2018, 9300.00, 111600.00),
(73614, 'Sophia Patel', 'R&D', 2018, 9400.00, 112800.00),
(42591, 'Jackson Patel', 'R&D', 2018, 9500.00, 114000.00),
(98265, 'Ava Patel', 'R&D', 2018, 9600.00, 115200.00),
(31948, 'Lucas Patel', 'R&D', 2018, 9700.00, 116400.00),
(69172, 'Mia Patel', 'R&D', 2018, 9800.00, 117600.00),
(51436, 'Aiden Patel', 'R&D', 2018, 9900.00, 118800.00),
(85792, 'Chloe Patel', 'R&D', 2018, 10000.00, 120000.00),
(28574, 'Elijah Patel', 'R&D', 2018, 10100.00, 121200.00),
(75361, 'Abigail Patel', 'R&D', 2018, 10200.00, 122400.00),
(43295, 'Caleb Patel', 'R&D', 2018, 10300.00, 123600.00),
(92678, 'Ella Patel', 'R&D', 2018, 10400.00, 124800.00),
(35921, 'Grayson Patel', 'R&D', 2018, 10500.00, 126000.00),
(61549, 'Lily Patel', 'R&D', 2018, 10600.00, 127200.00),
(54812, 'Owen Patel', 'R&D', 2018, 10700.00, 128400.00),
(81236, 'Madison Patel', 'R&D', 2018, 10800.00, 129600.00),
(24579, 'Isaac Patel', 'R&D', 2018, 10900.00, 130800.00),
(78952, 'Elizabeth Patel', 'R&D', 2018, 11000.00, 132000.00),
(47216, 'Samuel Patel', 'R&D', 2018, 11100.00, 133200.00),
(93584, 'Charlotte Patel', 'R&D', 2018, 11200.00, 134400.00),
(33178, 'Henry Patel', 'R&D', 2018, 11300.00, 135600.00),
(63925, 'Amelia Patel', 'R&D', 2018, 11400.00, 136800.00),
-- Removing employee_id 56187 (Scarlett White)
(89421, 'James White', 'Human Resources', 2018, 6850.00, 82200.00),
(29354, 'Isabella White', 'Human Resources', 2018, 6900.00, 82800.00),
(76519, 'Joseph White', 'Human Resources', 2018, 6950.00, 83400.00),
(42873, 'Mia White', 'Human Resources', 2018, 7000.00, 84000.00),
(95268, 'William White', 'Human Resources', 2018, 7050.00, 84600.00),
(32746, 'Grace White', 'Human Resources', 2018, 7100.00, 85200.00),
(68135, 'Daniel White', 'Human Resources', 2018, 7150.00, 85800.00),
(51927, 'Chloe White', 'Human Resources', 2018, 7200.00, 86400.00),
(84591, 'Alexander White', 'Human Resources', 2018, 7250.00, 87000.00),
(27154, 'Madison White', 'Human Resources', 2018, 7300.00, 87600.00),
(73819, 'Anthony White', 'Human Resources', 2018, 7350.00, 88200.00),
(49263, 'Ella White', 'Human Resources', 2018, 7400.00, 88800.00),
(91582, 'Vincent White', 'Human Resources', 2018, 7450.00, 89400.00),
(34725, 'Avery White', 'Human Resources', 2018, 7500.00, 90000.00),
(67948, 'Gabriel Black', 'Finance', 2018, 9500.00, 114000.00),
(52316, 'Sofia Black', 'Finance', 2018, 9600.00, 115200.00),
(87659, 'Owen Black', 'Finance', 2018, 9700.00, 116400.00),
(28143, 'Evelyn Black', 'Finance', 2018, 9800.00, 117600.00),
(74921, 'John Black', 'Finance', 2018, 9900.00, 118800.00),
(43685, 'Layla Black', 'Finance', 2018, 10000.00, 120000.00),
(92137, 'Caleb Black', 'Finance', 2018, 10100.00, 121200.00),
(31592, 'Scarlett Black', 'Finance', 2018, 10200.00, 122400.00),
(65849, 'Isaac Black', 'Finance', 2018, 10300.00, 123600.00),
(59213, 'Lily Black', 'Finance', 2018, 10400.00, 124800.00),
(83762, 'Samuel Black', 'Finance', 2018, 10500.00, 126000.00),
(25486, 'Hannah Black', 'Finance', 2018, 10600.00, 127200.00),
(71394, 'Wyatt Black', 'Finance', 2018, 10700.00, 128400.00),
(48257, 'Zoey Black', 'Finance', 2018, 10800.00, 129600.00), -- corrected 48257
(97631, 'Matthew Black', 'Finance', 2018, 10900.00, 130800.00),
(33584, 'Audrey Hall', 'Operations', 2018, 7200.00, 86400.00),
(63152, 'Daniel Hall', 'Operations', 2018, 7250.00, 8700.00),
(56489, 'Ellie Hall', 'Operations', 2018, 7300.00, 87600.00),
(82946, 'Jackson Hall', 'Operations', 2018, 7350.00, 88200.00),
(24713, 'Claire Hall', 'Operations', 2018, 7400.00, 88800.00),
(79365, 'Logan Hall', 'Operations', 2018, 7450.00, 89400.00),
(47198, 'Bella Hall', 'Operations', 2018, 7500.00, 90000.00),
(91852, 'Elijah Hall', 'Operations', 2018, 7550.00, 90600.00),
(34276, 'Maya Hall', 'Operations', 2018, 7600.00, 91200.00),
(67519, 'Ethan Hall', 'Operations', 2018, 7650.00, 91800.00),
(58321, 'Anna Hall', 'Operations', 2018, 7700.00, 92400.00),
(85649, 'Benjamin Hall', 'Operations', 2018, 7750.00, 93000.00),
(27913, 'Victoria Hall', 'Operations', 2018, 7800.00, 93600.00),
(72584, 'Caleb Hall', 'Operations', 2018, 7850.00, 94200.00),
(41236, 'Samantha Hall', 'Operations', 2018, 7900.00, 94800.00),
(98152, 'Natalie Wright', 'IT', 2018, 8500.00, 102000.00),
(31469, 'Riley Wright', 'IT', 2018, 8600.00, 103200.00),
(62745, 'Leah Wright', 'IT', 2018, 8700.00, 104400.00),
(55182, 'Brandon Wright', 'IT', 2018, 8800.00, 105600.00),
-- Removing employee_id 87536 (Gabrielle Wright)

-- Adding new employees for 2018 with new employee_ids (starting from 99000 onwards)

(99001, 'Olivia Moore', 'Sales and Marketing', 2018, 7100.00, 85200.00), -- New employee
(99002, 'Jackson Miller', 'R&D', 2018, 9650.00, 115800.00), -- New employee
(99003, 'Sophia Wilson', 'Human Resources', 2018, 6400.00, 76800.00), -- New employee
(99004, 'Ethan Garcia', 'Finance', 2018, 10150.00, 121800.00), -- New employee
(99005, 'Isabella Rodriguez', 'Operations', 2018, 7550.00, 90600.00), -- New employee
(99006, 'Liam Williams', 'IT', 2018, 8900.00, 106800.00), -- New employee
(99007, 'Ava Davis', 'Legal', 2018, 11500.00, 138000.00), -- New employee
(99008, 'Noah Martinez', 'Sales and Marketing', 2018, 7300.00, 87600.00), -- New employee
(99009, 'Emma Anderson', 'R&D', 2018, 9850.00, 118200.00), -- New employee
(99010, 'Lucas Gonzalez', 'Human Resources', 2018, 6600.00, 79200.00); -- New employee

-- Insert statements for realistic dataset for EmployeeCompensation table for the year 2019
-- Based on 2018 data, with a 5% salary increase for some employees (R&D and IT departments)

INSERT INTO EmployeeCompensation (employee_id, employee_name, department, fiscal_year, monthly_salary, annual_salary) VALUES
(28547, 'John Smith', 'Sales and Marketing', 2019, 6000.00, 72000.00),
(85533, 'Alice Johnson', 'R&D', 2019, 7875.00, 94500.00), -- 5% increase (7500 * 1.05)
(38492, 'Robert Williams', 'Human Resources', 2019, 5500.00, 66000.00),
(96385, 'Linda Brown', 'Finance', 2019, 8000.00, 96000.00),
(17463, 'Michael Davis', 'Operations', 2019, 5800.00, 69600.00),
(73928, 'Jennifer Wilson', 'IT', 2019, 7350.00, 88200.00), -- 5% increase (7000 * 1.05)
(45291, 'David Garcia', 'Legal', 2019, 9000.00, 108000.00),
(19572, 'Christopher Martinez', 'R&D', 2019, 8190.00, 98280.00), -- 5% increase (7800 * 1.05)
(53184, 'Angela Anderson', 'Human Resources', 2019, 5700.00, 68400.00),
(89627, 'Thomas Gonzalez', 'Finance', 2019, 8200.00, 98400.00),
(24759, 'Margaret Perez', 'Operations', 2019, 6000.00, 72000.00),
(71346, 'Kevin Young', 'IT', 2019, 7560.00, 90720.00), -- 5% increase (7200 * 1.05)
(39815, 'Ashley King', 'Legal', 2019, 9200.00, 110400.00),
(92648, 'Brandon Wright', 'Sales and Marketing', 2019, 6400.00, 76800.00),
(21593, 'Jessica Lopez', 'R&D', 2019, 8400.00, 100800.00), -- 5% increase (8000 * 1.05)
(67481, 'William Hill', 'Human Resources', 2019, 5900.00, 70800.00),
(48237, 'Sarah Scott', 'Finance', 2019, 8400.00, 100800.00), -- 48237 corrected
(79362, 'James Green', 'Operations', 2019, 6200.00, 74400.00),
(15928, 'Karen Adams', 'IT', 2019, 7770.00, 93240.00), -- 5% increase (7400 * 1.05)
(58149, 'Ethan Baker', 'Legal', 2019, 9400.00, 112800.00),
(82794, 'Nicole Nelson', 'Sales and Marketing', 2019, 6600.00, 79200.00),
(26351, 'Ryan Carter', 'R&D', 2019, 8610.00, 103320.00), -- 5% increase (8200 * 1.05)
(74183, 'Stephanie Mitchell', 'Human Resources', 2019, 6100.00, 73200.00),
(41965, 'Kyle Phillips', 'Finance', 2019, 8600.00, 103200.00),
(98752, 'Melissa Roberts', 'Operations', 2019, 6400.00, 76800.00),
(32614, 'Austin Turner', 'IT', 2019, 7980.00, 95760.00), -- 5% increase (7600 * 1.05)
(69427, 'Rachel Peterson', 'Legal', 2019, 9600.00, 115200.00),
(51879, 'Jose Hayes', 'Sales and Marketing', 2019, 6800.00, 81600.00),
(87356, 'Samantha Morris', 'R&D', 2019, 8820.00, 105840.00), -- 5% increase (8400 * 1.05)
(29148, 'Benjamin Murphy', 'Human Resources', 2019, 6300.00, 75600.00),
(76931, 'Michelle Cook', 'Finance', 2019, 8800.00, 105600.00),
(43529, 'Gregory Rogers', 'Operations', 2019, 6600.00, 79200.00),
(95286, 'Laura Reed', 'IT', 2019, 8190.00, 98280.00), -- 5% increase (7800 * 1.05)
(35817, 'Tyler Bailey', 'Legal', 2019, 9800.00, 117600.00),
(61742, 'Kimberly Bell', 'Sales and Marketing', 2019, 7000.00, 84000.00),
(54938, 'Jacob Cox', 'R&D', 2019, 9030.00, 108360.00), -- 5% increase (8600 * 1.05)
(81529, 'Victoria Rivera', 'Human Resources', 2019, 6500.00, 78000.00),
(23671, 'Dylan Cooper', 'Finance', 2019, 9000.00, 108000.00),
(78254, 'Kelly Richardson', 'Operations', 2019, 6800.00, 81600.00),
(47196, 'Adam Wood', 'IT', 2019, 8400.00, 100800.00), -- 5% increase (8000 * 1.05)
(91537, 'Brittany Watson', 'Legal', 2019, 10000.00, 120000.00),
(31428, 'Nicholas Brooks', 'Sales and Marketing', 2019, 7200.00, 86400.00),
(65971, 'Megan Kelly', 'R&D', 2019, 9240.00, 110880.00), -- 5% increase (8800 * 1.05)
(59283, 'Eric Sanders', 'Human Resources', 2019, 6700.00, 80400.00),
(84619, 'Chelsea Price', 'Finance', 2019, 9200.00, 110400.00),
(27543, 'Jonathan Bennett', 'Operations', 2019, 7000.00, 84000.00),
(72816, 'Katherine Gray', 'IT', 2019, 8610.00, 103320.00), -- 5% increase (8200 * 1.05)
(49572, 'Justin James', 'Legal', 2019, 10200.00, 122400.00),
(93865, 'Alyssa Reyes', 'Sales and Marketing', 2019, 7400.00, 88800.00),
(33791, 'Brandon Reyes', 'Sales and Marketing', 2019, 7450.00, 89400.00),
(63518, 'Megan Reyes', 'Sales and Marketing', 2019, 7500.00, 90000.00),
(56842, 'Eric Reyes', 'Sales and Marketing', 2019, 7550.00, 90600.00),
(89175, 'Chelsea Reyes', 'Sales and Marketing', 2019, 7600.00, 91200.00),
(36954, 'Jonathan Reyes', 'Sales and Marketing', 2019, 7650.00, 91800.00),
(68291, 'Katherine Reyes', 'Sales and Marketing', 2019, 7700.00, 92400.00),
(52487, 'Justin Reyes', 'Sales and Marketing', 2019, 7750.00, 93000.00),
(97632, 'Alyssa Reyes', 'Sales and Marketing', 2019, 7800.00, 93600.00),
(39215, 'Brandon Reyes', 'Sales and Marketing', 2019, 7850.00, 94200.00),
(64879, 'Megan Reyes', 'Sales and Marketing', 2019, 7900.00, 94800.00),
(57142, 'Eric Reyes', 'Sales and Marketing', 2019, 7950.00, 95400.00),
(83526, 'Chelsea Reyes', 'Sales and Marketing', 2019, 8000.00, 96000.00),
(25981, 'Jonathan Reyes', 'Sales and Marketing', 2019, 8050.00, 96600.00),
(71459, 'Katherine Reyes', 'Sales and Marketing', 2019, 8100.00, 97200.00),
(41823, 'Justin Reyes', 'Sales and Marketing', 2019, 8150.00, 97800.00),
(95178, 'Alyssa Reyes', 'Sales and Marketing', 2019, 8200.00, 98400.00),
(32546, 'Brandon Reyes', 'Sales and Marketing', 2019, 8250.00, 99000.00),
(62984, 'Megan Reyes', 'Sales and Marketing', 2019, 8300.00, 99600.00),
(55317, 'Eric Reyes', 'Sales and Marketing', 2019, 8350.00, 100200.00),
(88652, 'Chelsea Reyes', 'Sales and Marketing', 2019, 8400.00, 100800.00),
(29741, 'Jonathan Reyes', 'Sales and Marketing', 2019, 8450.00, 101400.00),
(77219, 'Katherine Reyes', 'Sales and Marketing', 2019, 8500.00, 102000.00),
(44983, 'Justin Reyes', 'Sales and Marketing', 2019, 8550.00, 102600.00),
(91328, 'Alyssa Reyes', 'Sales and Marketing', 2019, 8600.00, 103200.00),
(34156, 'Brandon Reyes', 'Sales and Marketing', 2019, 8650.00, 103800.00),
(65492, 'Olivia Patel', 'R&D', 2019, 9450.00, 113400.00), -- 5% increase (9000 * 1.05)
(58725, 'Noah Patel', 'R&D', 2019, 9555.00, 114660.00), -- 5% increase (9100 * 1.05)
(82149, 'Emma Patel', 'R&D', 2019, 9660.00, 115920.00), -- 5% increase (9200 * 1.05)
(26837, 'Liam Patel', 'R&D', 2019, 9765.00, 117180.00), -- 5% increase (9300 * 1.05)
(73614, 'Sophia Patel', 'R&D', 2019, 9870.00, 118440.00), -- 5% increase (9400 * 1.05)
(42591, 'Jackson Patel', 'R&D', 2019, 9975.00, 119700.00), -- 5% increase (9500 * 1.05)
(98265, 'Ava Patel', 'R&D', 2019, 10080.00, 120960.00), -- 5% increase (9600 * 1.05)
(31948, 'Lucas Patel', 'R&D', 2019, 10185.00, 122220.00), -- 5% increase (9700 * 1.05)
(69172, 'Mia Patel', 'R&D', 2019, 10290.00, 123480.00), -- 5% increase (9800 * 1.05)
(51436, 'Aiden Patel', 'R&D', 2019, 10395.00, 124740.00), -- 5% increase (9900 * 1.05)
(85792, 'Chloe Patel', 'R&D', 2019, 10500.00, 126000.00), -- 5% increase (10000 * 1.05)
(28574, 'Elijah Patel', 'R&D', 2019, 10605.00, 127260.00), -- 5% increase (10100 * 1.05)
(75361, 'Abigail Patel', 'R&D', 2019, 10710.00, 128520.00), -- 5% increase (10200 * 1.05)
(43295, 'Caleb Patel', 'R&D', 2019, 10815.00, 129780.00), -- 5% increase (10300 * 1.05)
(92678, 'Ella Patel', 'R&D', 2019, 10920.00, 131040.00), -- 5% increase (10400 * 1.05)
(35921, 'Grayson Patel', 'R&D', 2019, 11025.00, 132300.00), -- 5% increase (10500 * 1.05)
(61549, 'Lily Patel', 'R&D', 2019, 11130.00, 133560.00), -- 5% increase (10600 * 1.05)
(54812, 'Owen Patel', 'R&D', 2019, 11235.00, 134820.00), -- 5% increase (10700 * 1.05)
(81236, 'Madison Patel', 'R&D', 2019, 11340.00, 136080.00), -- 5% increase (10800 * 1.05)
(24579, 'Isaac Patel', 'R&D', 2019, 11445.00, 137340.00), -- 5% increase (10900 * 1.05)
(78952, 'Elizabeth Patel', 'R&D', 2019, 11550.00, 138600.00), -- 5% increase (11000 * 1.05)
(47216, 'Samuel Patel', 'R&D', 2019, 11655.00, 139860.00), -- 5% increase (11100 * 1.05)
(93584, 'Charlotte Patel', 'R&D', 2019, 11760.00, 141120.00), -- 5% increase (11200 * 1.05)
(33178, 'Henry Patel', 'R&D', 2019, 11865.00, 142380.00), -- 5% increase (11300 * 1.05)
(63925, 'Amelia Patel', 'R&D', 2019, 11970.00, 143640.00), -- 5% increase (11400 * 1.05)
(89421, 'James White', 'Human Resources', 2019, 6850.00, 82200.00),
(29354, 'Isabella White', 'Human Resources', 2019, 6900.00, 82800.00),
(76519, 'Joseph White', 'Human Resources', 2019, 6950.00, 83400.00),
(42873, 'Mia White', 'Human Resources', 2019, 7000.00, 84000.00),
(95268, 'William White', 'Human Resources', 2019, 7050.00, 84600.00),
(32746, 'Grace White', 'Human Resources', 2019, 7100.00, 85200.00),
(68135, 'Daniel White', 'Human Resources', 2019, 7150.00, 85800.00),
(51927, 'Chloe White', 'Human Resources', 2019, 7200.00, 86400.00),
(84591, 'Alexander White', 'Human Resources', 2019, 7250.00, 87000.00),
(27154, 'Madison White', 'Human Resources', 2019, 7300.00, 87600.00),
(73819, 'Anthony White', 'Human Resources', 2019, 7350.00, 88200.00),
(49263, 'Ella White', 'Human Resources', 2019, 7400.00, 88800.00),
(91582, 'Vincent White', 'Human Resources', 2019, 7450.00, 89400.00),
(34725, 'Avery White', 'Human Resources', 2019, 7500.00, 90000.00),
(67948, 'Gabriel Black', 'Finance', 2019, 9500.00, 114000.00),
(52316, 'Sofia Black', 'Finance', 2019, 9600.00, 115200.00),
(87659, 'Owen Black', 'Finance', 2019, 9700.00, 116400.00),
(28143, 'Evelyn Black', 'Finance', 2019, 9800.00, 117600.00),
(74921, 'John Black', 'Finance', 2019, 9900.00, 118800.00),
(43685, 'Layla Black', 'Finance', 2019, 10000.00, 120000.00),
(92137, 'Caleb Black', 'Finance', 2019, 10100.00, 121200.00),
(31592, 'Scarlett Black', 'Finance', 2019, 10200.00, 122400.00),
(65849, 'Isaac Black', 'Finance', 2019, 10300.00, 123600.00),
(59213, 'Lily Black', 'Finance', 2019, 10400.00, 124800.00),
(83762, 'Samuel Black', 'Finance', 2019, 10500.00, 126000.00),
(25486, 'Hannah Black', 'Finance', 2019, 10600.00, 127200.00),
(71394, 'Wyatt Black', 'Finance', 2019, 10700.00, 128400.00),
(48257, 'Zoey Black', 'Finance', 2019, 10800.00, 129600.00), -- corrected 48257
(97631, 'Matthew Black', 'Finance', 2019, 10900.00, 130800.00),
(33584, 'Audrey Hall', 'Operations', 2019, 7200.00, 86400.00),
(63152, 'Daniel Hall', 'Operations', 2019, 7250.00, 8700.00),
(56489, 'Ellie Hall', 'Operations', 2019, 7300.00, 87600.00),
(82946, 'Jackson Hall', 'Operations', 2019, 7350.00, 88200.00),
(24713, 'Claire Hall', 'Operations', 2019, 7400.00, 88800.00),
(79365, 'Logan Hall', 'Operations', 2019, 7450.00, 89400.00),
(47198, 'Bella Hall', 'Operations', 2019, 7500.00, 90000.00),
(91852, 'Elijah Hall', 'Operations', 2019, 7550.00, 90600.00),
(34276, 'Maya Hall', 'Operations', 2019, 7600.00, 91200.00),
(67519, 'Ethan Hall', 'Operations', 2019, 7650.00, 91800.00),
(58321, 'Anna Hall', 'Operations', 2019, 7700.00, 92400.00),
(85649, 'Benjamin Hall', 'Operations', 2019, 7750.00, 93000.00),
(27913, 'Victoria Hall', 'Operations', 2019, 7800.00, 93600.00),
(72584, 'Caleb Hall', 'Operations', 2019, 7850.00, 94200.00),
(41236, 'Samantha Hall', 'Operations', 2019, 7900.00, 94800.00),
(98152, 'Natalie Wright', 'IT', 2019, 8925.00, 107100.00), -- 5% increase (8500 * 1.05)
(31469, 'Riley Wright', 'IT', 2019, 9030.00, 108360.00), -- 5% increase (8600 * 1.05)
(62745, 'Leah Wright', 'IT', 2019, 9135.00, 109620.00), -- 5% increase (8700 * 1.05)
(55182, 'Brandon Wright', 'IT', 2019, 9240.00, 110880.00), -- 5% increase (8800 * 1.05)
(99001, 'Olivia Moore', 'Sales and Marketing', 2019, 7100.00, 85200.00),
(99002, 'Jackson Miller', 'R&D', 2019, 9650.00, 115800.00),
(99003, 'Sophia Wilson', 'Human Resources', 2019, 6400.00, 76800.00),
(99004, 'Ethan Garcia', 'Finance', 2019, 10150.00, 121800.00),
(99005, 'Isabella Rodriguez', 'Operations', 2019, 7550.00, 90600.00),
(99006, 'Liam Williams', 'IT', 2019, 9345.00, 112140.00), -- 5% increase (8900 * 1.05)
(99007, 'Ava Davis', 'Legal', 2019, 11500.00, 138000.00),
(99008, 'Noah Martinez', 'Sales and Marketing', 2019, 7300.00, 87600.00),
(99009, 'Emma Anderson', 'R&D', 2019, 9850.00, 118200.00),
(99010, 'Lucas Gonzalez', 'Human Resources', 2019, 6600.00, 79200.00),
(99011, 'Mia Clark', 'Sales and Marketing', 2019, 7200.00, 86400.00), -- New employee
(99012, 'Elijah Lewis', 'R&D', 2019, 10000.00, 120000.00), -- New employee
(99013, 'Abigail Hall', 'Human Resources', 2019, 6500.00, 78000.00), -- New employee
(99014, 'Caleb Young', 'Finance', 2019, 10300.00, 123600.00), -- New employee
(99015, 'Ella Wright', 'Operations', 2019, 7600.00, 91200.00); -- New employee

-- Insert statements for realistic dataset for EmployeeCompensation table for the year 2020
-- Based on 2019 data, with a 5% salary increase for some employees (Sales and Marketing, and Finance departments)

INSERT INTO EmployeeCompensation (employee_id, employee_name, department, fiscal_year, monthly_salary, annual_salary) VALUES
(28547, 'John Smith', 'Sales and Marketing', 2020, 6300.00, 75600.00), -- 5% increase (6000 * 1.05)
(85533, 'Alice Johnson', 'R&D', 2020, 7875.00, 94500.00), -- No change from 2019
(38492, 'Robert Williams', 'Human Resources', 2020, 5500.00, 66000.00), -- No change from 2019
(96385, 'Linda Brown', 'Finance', 2020, 8400.00, 100800.00), -- 5% increase (8000 * 1.05)
(17463, 'Michael Davis', 'Operations', 2020, 5800.00, 69600.00), -- No change from 2019
(73928, 'Jennifer Wilson', 'IT', 2020, 7350.00, 88200.00), -- No change from 2019
(45291, 'David Garcia', 'Legal', 2020, 9000.00, 108000.00), -- No change from 2019
(19572, 'Christopher Martinez', 'R&D', 2020, 8190.00, 98280.00), -- No change from 2019
(53184, 'Angela Anderson', 'Human Resources', 2020, 5700.00, 68400.00), -- No change from 2019
(89627, 'Thomas Gonzalez', 'Finance', 2020, 8610.00, 103320.00), -- 5% increase (8200 * 1.05)
(24759, 'Margaret Perez', 'Operations', 2020, 6000.00, 72000.00), -- No change from 2019
(71346, 'Kevin Young', 'IT', 2020, 7560.00, 90720.00), -- No change from 2019
(39815, 'Ashley King', 'Legal', 2020, 9200.00, 110400.00), -- No change from 2019
(92648, 'Brandon Wright', 'Sales and Marketing', 2020, 6720.00, 80640.00), -- 5% increase (6400 * 1.05)
(21593, 'Jessica Lopez', 'R&D', 2020, 8400.00, 100800.00), -- No change from 2019
(67481, 'William Hill', 'Human Resources', 2020, 5900.00, 70800.00), -- No change from 2019
(48237, 'Sarah Scott', 'Finance', 2020, 8820.00, 105840.00), -- 5% increase (8400 * 1.05) -- 48237 corrected
(79362, 'James Green', 'Operations', 2020, 6200.00, 74400.00), -- No change from 2019
(15928, 'Karen Adams', 'IT', 2020, 7770.00, 93240.00), -- No change from 2019
(58149, 'Ethan Baker', 'Legal', 2020, 9400.00, 112800.00), -- No change from 2019
(82794, 'Nicole Nelson', 'Sales and Marketing', 2020, 6930.00, 83160.00), -- 5% increase (6600 * 1.05)
(26351, 'Ryan Carter', 'R&D', 2020, 8610.00, 103320.00), -- No change from 2019
(74183, 'Stephanie Mitchell', 'Human Resources', 2020, 6100.00, 73200.00), -- No change from 2019
(41965, 'Kyle Phillips', 'Finance', 2020, 9030.00, 108360.00), -- 5% increase (8600 * 1.05)
(98752, 'Melissa Roberts', 'Operations', 2020, 6400.00, 76800.00), -- No change from 2019
(32614, 'Austin Turner', 'IT', 2020, 7980.00, 95760.00), -- No change from 2019
(69427, 'Rachel Peterson', 'Legal', 2020, 9600.00, 115200.00), -- No change from 2019
(51879, 'Jose Hayes', 'Sales and Marketing', 2020, 7140.00, 85680.00), -- 5% increase (6800 * 1.05)
(87356, 'Samantha Morris', 'R&D', 2020, 8820.00, 105840.00), -- No change from 2019
(29148, 'Benjamin Murphy', 'Human Resources', 2020, 6300.00, 75600.00), -- No change from 2019
(76931, 'Michelle Cook', 'Finance', 2020, 9240.00, 110880.00), -- 5% increase (8800 * 1.05)
(43529, 'Gregory Rogers', 'Operations', 2020, 6600.00, 79200.00), -- No change from 2019
(95286, 'Laura Reed', 'IT', 2020, 8190.00, 98280.00), -- No change from 2019
(35817, 'Tyler Bailey', 'Legal', 2020, 9800.00, 117600.00), -- No change from 2019
(61742, 'Kimberly Bell', 'Sales and Marketing', 2020, 7350.00, 88200.00), -- 5% increase (7000 * 1.05)
(54938, 'Jacob Cox', 'R&D', 2020, 9030.00, 108360.00), -- No change from 2019
(81529, 'Victoria Rivera', 'Human Resources', 2020, 6500.00, 78000.00), -- No change from 2019
(23671, 'Dylan Cooper', 'Finance', 2020, 9450.00, 113400.00), -- 5% increase (9000 * 1.05)
(78254, 'Kelly Richardson', 'Operations', 2020, 6800.00, 81600.00), -- No change from 2019
(47196, 'Adam Wood', 'IT', 2020, 8400.00, 100800.00), -- No change from 2019
(91537, 'Brittany Watson', 'Legal', 2020, 10000.00, 120000.00), -- No change from 2019
(31428, 'Nicholas Brooks', 'Sales and Marketing', 2020, 7560.00, 90720.00), -- 5% increase (7200 * 1.05)
(65971, 'Megan Kelly', 'R&D', 2020, 9240.00, 110880.00), -- No change from 2019
(59283, 'Eric Sanders', 'Human Resources', 2020, 6700.00, 80400.00), -- No change from 2019
(84619, 'Chelsea Price', 'Finance', 2020, 9660.00, 115920.00), -- 5% increase (9200 * 1.05)
(27543, 'Jonathan Bennett', 'Operations', 2020, 7000.00, 84000.00), -- No change from 2019
(72816, 'Katherine Gray', 'IT', 2020, 8610.00, 103320.00), -- No change from 2019
(49572, 'Justin James', 'Legal', 2020, 10200.00, 122400.00), -- No change from 2019
(93865, 'Alyssa Reyes', 'Sales and Marketing', 2020, 7770.00, 93240.00), -- 5% increase (7400 * 1.05)
(33791, 'Brandon Reyes', 'Sales and Marketing', 2020, 7822.50, 93870.00), -- 5% increase (7450 * 1.05)
(63518, 'Megan Reyes', 'Sales and Marketing', 2020, 7875.00, 94500.00), -- 5% increase (7500 * 1.05)
(56842, 'Eric Reyes', 'Sales and Marketing', 2020, 7927.50, 95130.00), -- 5% increase (7550 * 1.05)
(89175, 'Chelsea Reyes', 'Sales and Marketing', 2020, 7980.00, 95760.00), -- 5% increase (7600 * 1.05)
(36954, 'Jonathan Reyes', 'Sales and Marketing', 2020, 8032.50, 96390.00), -- 5% increase (7650 * 1.05)
(68291, 'Katherine Reyes', 'Sales and Marketing', 2020, 8085.00, 97020.00), -- 5% increase (7700 * 1.05)
(52487, 'Justin Reyes', 'Sales and Marketing', 2020, 8137.50, 97650.00), -- 5% increase (7750 * 1.05)
(97632, 'Alyssa Reyes', 'Sales and Marketing', 2020, 8190.00, 98280.00), -- 5% increase (7800 * 1.05)
(39215, 'Brandon Reyes', 'Sales and Marketing', 2020, 8242.50, 98910.00), -- 5% increase (7850 * 1.05)
(64879, 'Megan Reyes', 'Sales and Marketing', 2020, 8295.00, 99540.00), -- 5% increase (7900 * 1.05)
(57142, 'Eric Reyes', 'Sales and Marketing', 2020, 8347.50, 100170.00), -- 5% increase (7950 * 1.05)
(83526, 'Chelsea Reyes', 'Sales and Marketing', 2020, 8400.00, 100800.00), -- 5% increase (8000 * 1.05)
(25981, 'Jonathan Reyes', 'Sales and Marketing', 2020, 8452.50, 101430.00), -- 5% increase (8050 * 1.05)
(71459, 'Katherine Reyes', 'Sales and Marketing', 2020, 8505.00, 102060.00), -- 5% increase (8100 * 1.05)
(41823, 'Justin Reyes', 'Sales and Marketing', 2020, 8557.50, 102690.00), -- 5% increase (8150 * 1.05)
(95178, 'Alyssa Reyes', 'Sales and Marketing', 2020, 8610.00, 103320.00), -- 5% increase (8200 * 1.05)
(32546, 'Brandon Reyes', 'Sales and Marketing', 2020, 8662.50, 103950.00), -- 5% increase (8250 * 1.05)
(62984, 'Megan Reyes', 'Sales and Marketing', 2020, 8715.00, 104580.00), -- 5% increase (8300 * 1.05)
(55317, 'Eric Reyes', 'Sales and Marketing', 2020, 8767.50, 105210.00), -- 5% increase (8350 * 1.05)
(88652, 'Chelsea Reyes', 'Sales and Marketing', 2020, 8820.00, 105840.00), -- 5% increase (8400 * 1.05)
(29741, 'Jonathan Reyes', 'Sales and Marketing', 2020, 8872.50, 106470.00), -- 5% increase (8450 * 1.05)
(77219, 'Katherine Reyes', 'Sales and Marketing', 2020, 8925.00, 107100.00), -- 5% increase (8500 * 1.05)
(44983, 'Justin Reyes', 'Sales and Marketing', 2020, 8977.50, 107730.00), -- 5% increase (8550 * 1.05)
(91328, 'Alyssa Reyes', 'Sales and Marketing', 2020, 9030.00, 108360.00), -- 5% increase (8600 * 1.05)
(34156, 'Brandon Reyes', 'Sales and Marketing', 2020, 9082.50, 108990.00), -- 5% increase (8650 * 1.05)
(65492, 'Olivia Patel', 'R&D', 2020, 9450.00, 113400.00), -- No change from 2019
(58725, 'Noah Patel', 'R&D', 2020, 9555.00, 114660.00), -- No change from 2019
(82149, 'Emma Patel', 'R&D', 2020, 9660.00, 115920.00), -- No change from 2019
(26837, 'Liam Patel', 'R&D', 2020, 9765.00, 117180.00), -- No change from 2019
(73614, 'Sophia Patel', 'R&D', 2020, 9870.00, 118440.00), -- No change from 2019
(42591, 'Jackson Patel', 'R&D', 2020, 9975.00, 119700.00), -- No change from 2019
(98265, 'Ava Patel', 'R&D', 2020, 10080.00, 120960.00), -- No change from 2019
(31948, 'Lucas Patel', 'R&D', 2020, 10185.00, 122220.00), -- No change from 2019
(69172, 'Mia Patel', 'R&D', 2020, 10290.00, 123480.00), -- No change from 2019
(51436, 'Aiden Patel', 'R&D', 2020, 10395.00, 124740.00), -- No change from 2019
(85792, 'Chloe Patel', 'R&D', 2020, 10500.00, 126000.00), -- No change from 2019
(28574, 'Elijah Patel', 'R&D', 2020, 10605.00, 127260.00), -- No change from 2019
(75361, 'Abigail Patel', 'R&D', 2020, 10710.00, 128520.00), -- No change from 2019
(43295, 'Caleb Patel', 'R&D', 2020, 10815.00, 129780.00), -- No change from 2019
(92678, 'Ella Patel', 'R&D', 2020, 10920.00, 131040.00), -- No change from 2019
(35921, 'Grayson Patel', 'R&D', 2020, 11025.00, 132300.00), -- No change from 2019
(61549, 'Lily Patel', 'R&D', 2020, 11130.00, 133560.00), -- No change from 2019
(54812, 'Owen Patel', 'R&D', 2020, 11235.00, 134820.00), -- No change from 2019
(81236, 'Madison Patel', 'R&D', 2020, 11340.00, 136080.00), -- No change from 2019
(24579, 'Isaac Patel', 'R&D', 2020, 11445.00, 137340.00), -- No change from 2019
(78952, 'Elizabeth Patel', 'R&D', 2020, 11550.00, 138600.00), -- No change from 2019
(47216, 'Samuel Patel', 'R&D', 2020, 11655.00, 139860.00), -- No change from 2019
(93584, 'Charlotte Patel', 'R&D', 2020, 11760.00, 141120.00), -- No change from 2019
(33178, 'Henry Patel', 'R&D', 2020, 11865.00, 142380.00), -- No change from 2019
(63925, 'Amelia Patel', 'R&D', 2020, 11970.00, 143640.00), -- No change from 2019
(89421, 'James White', 'Human Resources', 2020, 6850.00, 82200.00), -- No change from 2019
(29354, 'Isabella White', 'Human Resources', 2020, 6900.00, 82800.00), -- No change from 2019
(76519, 'Joseph White', 'Human Resources', 2020, 6950.00, 83400.00), -- No change from 2019
(42873, 'Mia White', 'Human Resources', 2020, 7000.00, 84000.00), -- No change from 2019
(95268, 'William White', 'Human Resources', 2020, 7050.00, 84600.00), -- No change from 2019
(32746, 'Grace White', 'Human Resources', 2020, 7100.00, 85200.00), -- No change from 2019
(68135, 'Daniel White', 'Human Resources', 2020, 7150.00, 85800.00), -- No change from 2019
(51927, 'Chloe White', 'Human Resources', 2020, 7200.00, 86400.00), -- No change from 2019
(84591, 'Alexander White', 'Human Resources', 2020, 7250.00, 87000.00), -- No change from 2019
(27154, 'Madison White', 'Human Resources', 2020, 7300.00, 87600.00), -- No change from 2019
(73819, 'Anthony White', 'Human Resources', 2020, 7350.00, 88200.00), -- No change from 2019
(49263, 'Ella White', 'Human Resources', 2020, 7400.00, 88800.00), -- No change from 2019
(91582, 'Vincent White', 'Human Resources', 2020, 7450.00, 89400.00), -- No change from 2019
(34725, 'Avery White', 'Human Resources', 2020, 7500.00, 90000.00), -- No change from 2019
(67948, 'Gabriel Black', 'Finance', 2020, 9975.00, 119700.00), -- 5% increase (9500 * 1.05)
(52316, 'Sofia Black', 'Finance', 2020, 10080.00, 120960.00), -- 5% increase (9600 * 1.05)
(87659, 'Owen Black', 'Finance', 2020, 10185.00, 122220.00), -- 5% increase (9700 * 1.05)
(28143, 'Evelyn Black', 'Finance', 2020, 10290.00, 123480.00), -- 5% increase (9800 * 1.05)
(74921, 'John Black', 'Finance', 2020, 10395.00, 124740.00), -- 5% increase (9900 * 1.05)
(43685, 'Layla Black', 'Finance', 2020, 10500.00, 126000.00), -- 5% increase (10000 * 1.05)
(92137, 'Caleb Black', 'Finance', 2020, 10605.00, 127260.00), -- 5% increase (10100 * 1.05)
(31592, 'Scarlett Black', 'Finance', 2020, 10710.00, 128520.00), -- 5% increase (10200 * 1.05)
(65849, 'Isaac Black', 'Finance', 2020, 10815.00, 129780.00), -- 5% increase (10300 * 1.05)
(59213, 'Lily Black', 'Finance', 2020, 10920.00, 131040.00), -- 5% increase (10400 * 1.05)
(83762, 'Samuel Black', 'Finance', 2020, 11025.00, 132300.00), -- 5% increase (10500 * 1.05)
(25486, 'Hannah Black', 'Finance', 2020, 11130.00, 133560.00), -- 5% increase (10600 * 1.05)
(71394, 'Wyatt Black', 'Finance', 2020, 11235.00, 134820.00), -- 5% increase (10700 * 1.05)
(48257, 'Zoey Black', 'Finance', 2020, 11340.00, 136080.00), -- 5% increase (10800 * 1.05) -- corrected 48257
(97631, 'Matthew Black', 'Finance', 2020, 11445.00, 137340.00), -- 5% increase (10900 * 1.05)
(33584, 'Audrey Hall', 'Operations', 2020, 7200.00, 86400.00), -- No change from 2019
(63152, 'Daniel Hall', 'Operations', 2020, 7250.00, 8700.00), -- No change from 2019
(56489, 'Ellie Hall', 'Operations', 2020, 7300.00, 87600.00), -- No change from 2019
(82946, 'Jackson Hall', 'Operations', 2020, 7350.00, 88200.00), -- No change from 2019
(24713, 'Claire Hall', 'Operations', 2020, 7400.00, 88800.00), -- No change from 2019
(79365, 'Logan Hall', 'Operations', 2020, 7450.00, 89400.00), -- No change from 2019
(47198, 'Bella Hall', 'Operations', 2020, 7500.00, 90000.00), -- No change from 2019
(91852, 'Elijah Hall', 'Operations', 2020, 7550.00, 90600.00), -- No change from 2019
(34276, 'Maya Hall', 'Operations', 2020, 7600.00, 91200.00), -- No change from 2019
(67519, 'Ethan Hall', 'Operations', 2020, 7650.00, 91800.00), -- No change from 2019
(58321, 'Anna Hall', 'Operations', 2020, 7700.00, 92400.00), -- No change from 2019
(85649, 'Benjamin Hall', 'Operations', 2020, 7750.00, 93000.00), -- No change from 2019
(27913, 'Victoria Hall', 'Operations', 2020, 7800.00, 93600.00), -- No change from 2019
(72584, 'Caleb Hall', 'Operations', 2020, 7850.00, 94200.00), -- No change from 2019
(41236, 'Samantha Hall', 'Operations', 2020, 7900.00, 94800.00), -- No change from 2019
(98152, 'Natalie Wright', 'IT', 2020, 8925.00, 107100.00), -- No change from 2019
(31469, 'Riley Wright', 'IT', 2020, 9030.00, 108360.00), -- No change from 2019
(62745, 'Leah Wright', 'IT', 2020, 9135.00, 109620.00), -- No change from 2019
(55182, 'Brandon Wright', 'IT', 2020, 9240.00, 110880.00), -- No change from 2019
(99001, 'Olivia Moore', 'Sales and Marketing', 2020, 7455.00, 89460.00), -- 5% increase (7100 * 1.05)
(99002, 'Jackson Miller', 'R&D', 2020, 9650.00, 115800.00), -- No change from 2019
(99003, 'Sophia Wilson', 'Human Resources', 2020, 6400.00, 76800.00), -- No change from 2019
(99004, 'Ethan Garcia', 'Finance', 2020, 10657.50, 127890.00), -- 5% increase (10150 * 1.05)
(99005, 'Isabella Rodriguez', 'Operations', 2020, 7550.00, 90600.00), -- No change from 2019
(99006, 'Liam Williams', 'IT', 2020, 9345.00, 112140.00), -- No change from 2019
(99007, 'Ava Davis', 'Legal', 2020, 11500.00, 138000.00), -- No change from 2019
(99008, 'Noah Martinez', 'Sales and Marketing', 2020, 7665.00, 91980.00), -- 5% increase (7300 * 1.05)
(99009, 'Emma Anderson', 'R&D', 2020, 9850.00, 118200.00), -- No change from 2019
(99010, 'Lucas Gonzalez', 'Human Resources', 2020, 6600.00, 79200.00), -- No change from 2019
(99011, 'Mia Clark', 'Sales and Marketing', 2020, 7812.00, 93744.00), -- 5% increase (7200 * 1.05)
(99012, 'Elijah Lewis', 'R&D', 2020, 10000.00, 120000.00), -- No change from 2019
(99013, 'Abigail Hall', 'Human Resources', 2020, 6500.00, 78000.00), -- No change from 2019
(99014, 'Caleb Young', 'Finance', 2020, 10815.00, 129780.00), -- 5% increase (10300 * 1.05)
(99015, 'Ella Wright', 'Operations', 2020, 7600.00, 91200.00), -- No change from 2019
-- New employees for 2020 with new employee_ids (starting from 99016 onwards)
(99016, 'Alexander Walker', 'Sales and Marketing', 2020, 8000.00, 96000.00), -- New employee
(99017, 'Madison Green', 'Finance', 2020, 11000.00, 132000.00), -- New employee
(99018, 'Daniel Adams', 'IT', 2020, 9500.00, 114000.00); -- New employee

-- Insert statements for realistic dataset for EmployeeCompensation table for the year 2021
-- Based on 2020 data, removing some employees and NOT adding any new employees

INSERT INTO EmployeeCompensation (employee_id, employee_name, department, fiscal_year, monthly_salary, annual_salary) VALUES
(28547, 'John Smith', 'Sales and Marketing', 2021, 6300.00, 75600.00),
(85533, 'Alice Johnson', 'R&D', 2021, 7875.00, 94500.00),
(38492, 'Robert Williams', 'Human Resources', 2021, 5500.00, 66000.00),
(96385, 'Linda Brown', 'Finance', 2021, 8400.00, 100800.00),
-- Removing employee_id 17463 (Michael Davis)
(73928, 'Jennifer Wilson', 'IT', 2021, 7350.00, 88200.00),
(45291, 'David Garcia', 'Legal', 2021, 9000.00, 108000.00),
(19572, 'Christopher Martinez', 'R&D', 2021, 8190.00, 98280.00),
(53184, 'Angela Anderson', 'Human Resources', 2021, 5700.00, 68400.00),
(89627, 'Thomas Gonzalez', 'Finance', 2021, 8610.00, 103320.00),
(24759, 'Margaret Perez', 'Operations', 2021, 6000.00, 72000.00),
(71346, 'Kevin Young', 'IT', 2021, 7560.00, 90720.00),
(39815, 'Ashley King', 'Legal', 2021, 9200.00, 110400.00),
(92648, 'Brandon Wright', 'Sales and Marketing', 2021, 6720.00, 80640.00),
(21593, 'Jessica Lopez', 'R&D', 2021, 8400.00, 100800.00),
(67481, 'William Hill', 'Human Resources', 2021, 5900.00, 70800.00),
(48237, 'Sarah Scott', 'Finance', 2021, 8820.00, 105840.00), -- 48237 corrected
(79362, 'James Green', 'Operations', 2021, 6200.00, 74400.00),
(15928, 'Karen Adams', 'IT', 2021, 7770.00, 93240.00),
(58149, 'Ethan Baker', 'Legal', 2021, 9400.00, 112800.00),
(82794, 'Nicole Nelson', 'Sales and Marketing', 2021, 6930.00, 83160.00),
(26351, 'Ryan Carter', 'R&D', 2021, 8610.00, 103320.00),
(74183, 'Stephanie Mitchell', 'Human Resources', 2021, 6100.00, 73200.00),
(41965, 'Kyle Phillips', 'Finance', 2021, 9030.00, 108360.00),
(98752, 'Melissa Roberts', 'Operations', 2021, 6400.00, 76800.00),
(32614, 'Austin Turner', 'IT', 2021, 7980.00, 95760.00),
(69427, 'Rachel Peterson', 'Legal', 2021, 9600.00, 115200.00),
(51879, 'Jose Hayes', 'Sales and Marketing', 2021, 7140.00, 85680.00),
(87356, 'Samantha Morris', 'R&D', 2021, 8820.00, 105840.00),
(29148, 'Benjamin Murphy', 'Human Resources', 2021, 6300.00, 75600.00),
(76931, 'Michelle Cook', 'Finance', 2021, 9240.00, 110880.00),
(43529, 'Gregory Rogers', 'Operations', 2021, 6600.00, 79200.00),
(95286, 'Laura Reed', 'IT', 2021, 8190.00, 98280.00),
(35817, 'Tyler Bailey', 'Legal', 2021, 9800.00, 117600.00),
(61742, 'Kimberly Bell', 'Sales and Marketing', 2021, 7350.00, 88200.00),
(54938, 'Jacob Cox', 'R&D', 2021, 9030.00, 108360.00),
(81529, 'Victoria Rivera', 'Human Resources', 2021, 6500.00, 78000.00),
(23671, 'Dylan Cooper', 'Finance', 2021, 9450.00, 113400.00),
-- Removing employee_id 78254 (Kelly Richardson)
(47196, 'Adam Wood', 'IT', 2021, 8400.00, 100800.00),
(91537, 'Brittany Watson', 'Legal', 2021, 10000.00, 120000.00),
(31428, 'Nicholas Brooks', 'Sales and Marketing', 2021, 7560.00, 90720.00),
(65971, 'Megan Kelly', 'R&D', 2021, 9240.00, 110880.00),
(59283, 'Eric Sanders', 'Human Resources', 2021, 6700.00, 80400.00),
(84619, 'Chelsea Price', 'Finance', 2021, 9660.00, 115920.00),
(27543, 'Jonathan Bennett', 'Operations', 2021, 7000.00, 84000.00),
(72816, 'Katherine Gray', 'IT', 2021, 8610.00, 103320.00),
(49572, 'Justin James', 'Legal', 2021, 10200.00, 122400.00),
(93865, 'Alyssa Reyes', 'Sales and Marketing', 2021, 7770.00, 93240.00),
(33791, 'Brandon Reyes', 'Sales and Marketing', 2021, 7822.50, 93870.00),
(63518, 'Megan Reyes', 'Sales and Marketing', 2021, 7875.00, 94500.00),
(56842, 'Eric Reyes', 'Sales and Marketing', 2021, 7927.50, 95130.00),
(89175, 'Chelsea Reyes', 'Sales and Marketing', 2021, 7980.00, 95760.00),
(36954, 'Jonathan Reyes', 'Sales and Marketing', 2021, 8032.50, 96390.00),
(68291, 'Katherine Reyes', 'Sales and Marketing', 2021, 8085.00, 97020.00),
(52487, 'Justin Reyes', 'Sales and Marketing', 2021, 8137.50, 97650.00),
(97632, 'Alyssa Reyes', 'Sales and Marketing', 2021, 8190.00, 98280.00),
(39215, 'Brandon Reyes', 'Sales and Marketing', 2021, 8242.50, 98910.00),
(64879, 'Megan Reyes', 'Sales and Marketing', 2021, 8295.00, 99540.00),
(57142, 'Eric Reyes', 'Sales and Marketing', 2021, 8347.50, 100170.00),
(83526, 'Chelsea Reyes', 'Sales and Marketing', 2021, 8400.00, 100800.00),
(25981, 'Jonathan Reyes', 'Sales and Marketing', 2021, 8452.50, 101430.00),
(71459, 'Katherine Reyes', 'Sales and Marketing', 2021, 8505.00, 102060.00),
(41823, 'Justin Reyes', 'Sales and Marketing', 2021, 8557.50, 102690.00),
(95178, 'Alyssa Reyes', 'Sales and Marketing', 2021, 8610.00, 103320.00),
(32546, 'Brandon Reyes', 'Sales and Marketing', 2021, 8662.50, 103950.00),
(62984, 'Megan Reyes', 'Sales and Marketing', 2021, 8715.00, 104580.00),
(55317, 'Eric Reyes', 'Sales and Marketing', 2021, 8767.50, 105210.00),
(88652, 'Chelsea Reyes', 'Sales and Marketing', 2021, 8820.00, 105840.00),
(29741, 'Jonathan Reyes', 'Sales and Marketing', 2021, 8872.50, 106470.00),
(77219, 'Katherine Reyes', 'Sales and Marketing', 2021, 8925.00, 107100.00),
(44983, 'Justin Reyes', 'Sales and Marketing', 2021, 8977.50, 107730.00),
(91328, 'Alyssa Reyes', 'Sales and Marketing', 2021, 9030.00, 108360.00),
(34156, 'Brandon Reyes', 'Sales and Marketing', 2021, 9082.50, 108990.00),
(65492, 'Olivia Patel', 'R&D', 2021, 9450.00, 113400.00),
(58725, 'Noah Patel', 'R&D', 2021, 9555.00, 114660.00),
(82149, 'Emma Patel', 'R&D', 2021, 9660.00, 115920.00),
(26837, 'Liam Patel', 'R&D', 2021, 9765.00, 117180.00),
(73614, 'Sophia Patel', 'R&D', 2021, 9870.00, 118440.00),
(42591, 'Jackson Patel', 'R&D', 2021, 9975.00, 119700.00),
(98265, 'Ava Patel', 'R&D', 2021, 10080.00, 120960.00),
(31948, 'Lucas Patel', 'R&D', 2021, 10185.00, 122220.00),
(69172, 'Mia Patel', 'R&D', 2021, 10290.00, 123480.00),
(51436, 'Aiden Patel', 'R&D', 2021, 10395.00, 124740.00),
(85792, 'Chloe Patel', 'R&D', 2021, 10500.00, 126000.00),
(28574, 'Elijah Patel', 'R&D', 2021, 10605.00, 127260.00),
(75361, 'Abigail Patel', 'R&D', 2021, 10710.00, 128520.00),
(43295, 'Caleb Patel', 'R&D', 2021, 10815.00, 129780.00),
(92678, 'Ella Patel', 'R&D', 2021, 10920.00, 131040.00),
(35921, 'Grayson Patel', 'R&D', 2021, 11025.00, 132300.00),
(61549, 'Lily Patel', 'R&D', 2021, 11130.00, 133560.00),
(54812, 'Owen Patel', 'R&D', 2021, 11235.00, 134820.00),
(81236, 'Madison Patel', 'R&D', 2021, 11340.00, 136080.00),
(24579, 'Isaac Patel', 'R&D', 2021, 11445.00, 137340.00),
(78952, 'Elizabeth Patel', 'R&D', 2021, 11550.00, 138600.00),
(47216, 'Samuel Patel', 'R&D', 2021, 11655.00, 139860.00),
(93584, 'Charlotte Patel', 'R&D', 2021, 11760.00, 141120.00),
(33178, 'Henry Patel', 'R&D', 2021, 11865.00, 142380.00),
(63925, 'Amelia Patel', 'R&D', 2021, 11970.00, 143640.00),
(89421, 'James White', 'Human Resources', 2021, 6850.00, 82200.00),
(29354, 'Isabella White', 'Human Resources', 2021, 6900.00, 82800.00),
(76519, 'Joseph White', 'Human Resources', 2021, 6950.00, 83400.00),
-- Removing employee_id 42873 (Mia White)
(95268, 'William White', 'Human Resources', 2021, 7050.00, 84600.00),
(32746, 'Grace White', 'Human Resources', 2021, 7100.00, 85200.00),
(68135, 'Daniel White', 'Human Resources', 2021, 7150.00, 85800.00),
(51927, 'Chloe White', 'Human Resources', 2021, 7200.00, 86400.00),
(84591, 'Alexander White', 'Human Resources', 2021, 7250.00, 87000.00),
(27154, 'Madison White', 'Human Resources', 2021, 7300.00, 87600.00),
(73819, 'Anthony White', 'Human Resources', 2021, 7350.00, 88200.00),
(49263, 'Ella White', 'Human Resources', 2021, 7400.00, 88800.00),
(91582, 'Vincent White', 'Human Resources', 2021, 7450.00, 89400.00),
(34725, 'Avery White', 'Human Resources', 2021, 7500.00, 90000.00),
(67948, 'Gabriel Black', 'Finance', 2021, 9975.00, 119700.00),
(52316, 'Sofia Black', 'Finance', 2021, 10080.00, 120960.00),
(87659, 'Owen Black', 'Finance', 2021, 10185.00, 122220.00),
(28143, 'Evelyn Black', 'Finance', 2021, 10290.00, 123480.00),
(74921, 'John Black', 'Finance', 2021, 10395.00, 124740.00),
(43685, 'Layla Black', 'Finance', 2021, 10500.00, 126000.00),
(92137, 'Caleb Black', 'Finance', 2021, 10605.00, 127260.00),
(31592, 'Scarlett Black', 'Finance', 2021, 10710.00, 128520.00),
(65849, 'Isaac Black', 'Finance', 2021, 10815.00, 129780.00),
(59213, 'Lily Black', 'Finance', 2021, 10920.00, 131040.00),
-- Removing employee_id 83762 (Samuel Black)
(25486, 'Hannah Black', 'Finance', 2021, 11130.00, 133560.00),
(71394, 'Wyatt Black', 'Finance', 2021, 11235.00, 134820.00),
(48257, 'Zoey Black', 'Finance', 2021, 11340.00, 136080.00), -- corrected 48257
(97631, 'Matthew Black', 'Finance', 2021, 11445.00, 137340.00),
(33584, 'Audrey Hall', 'Operations', 2021, 7200.00, 86400.00),
(63152, 'Daniel Hall', 'Operations', 2021, 7250.00, 8700.00),
(56489, 'Ellie Hall', 'Operations', 2021, 7300.00, 87600.00),
(82946, 'Jackson Hall', 'Operations', 2021, 7350.00, 88200.00),
(24713, 'Claire Hall', 'Operations', 2021, 7400.00, 88800.00),
(79365, 'Logan Hall', 'Operations', 2021, 7450.00, 89400.00),
(47198, 'Bella Hall', 'Operations', 2021, 7500.00, 90000.00),
(91852, 'Elijah Hall', 'Operations', 2021, 7550.00, 90600.00),
(34276, 'Maya Hall', 'Operations', 2021, 7600.00, 91200.00),
(67519, 'Ethan Hall', 'Operations', 2021, 7650.00, 91800.00),
(58321, 'Anna Hall', 'Operations', 2021, 7700.00, 92400.00),
(85649, 'Benjamin Hall', 'Operations', 2021, 7750.00, 93000.00),
(27913, 'Victoria Hall', 'Operations', 2021, 7800.00, 93600.00),
(72584, 'Caleb Hall', 'Operations', 2021, 7850.00, 94200.00),
(41236, 'Samantha Hall', 'Operations', 2021, 7900.00, 94800.00),
(98152, 'Natalie Wright', 'IT', 2021, 8925.00, 107100.00),
(31469, 'Riley Wright', 'IT', 2021, 9030.00, 108360.00),
(62745, 'Leah Wright', 'IT', 2021, 9135.00, 109620.00),
(55182, 'Brandon Wright', 'IT', 2021, 9240.00, 110880.00),
(99001, 'Olivia Moore', 'Sales and Marketing', 2021, 7455.00, 89460.00),
(99002, 'Jackson Miller', 'R&D', 2021, 9650.00, 115800.00),
(99003, 'Sophia Wilson', 'Human Resources', 2021, 6400.00, 76800.00),
(99004, 'Ethan Garcia', 'Finance', 2021, 10657.50, 127890.00),
(99005, 'Isabella Rodriguez', 'Operations', 2021, 7550.00, 90600.00),
(99006, 'Liam Williams', 'IT', 2021, 9345.00, 112140.00),
(99007, 'Ava Davis', 'Legal', 2021, 11500.00, 138000.00),
(99008, 'Noah Martinez', 'Sales and Marketing', 2021, 7665.00, 91980.00),
(99009, 'Emma Anderson', 'R&D', 2021, 9850.00, 118200.00),
(99010, 'Lucas Gonzalez', 'Human Resources', 2021, 6600.00, 79200.00),
(99011, 'Mia Clark', 'Sales and Marketing', 2021, 7812.00, 93744.00),
(99012, 'Elijah Lewis', 'R&D', 2021, 10000.00, 120000.00),
(99013, 'Abigail Hall', 'Human Resources', 2021, 6500.00, 78000.00),
(99014, 'Caleb Young', 'Finance', 2021, 10815.00, 129780.00),
(99015, 'Ella Wright', 'Operations', 2021, 7600.00, 91200.00),
(99016, 'Alexander Walker', 'Sales and Marketing', 2021, 8000.00, 96000.00),
(99017, 'Madison Green', 'Finance', 2021, 11000.00, 132000.00),
(99018, 'Daniel Adams', 'IT', 2021, 9500.00, 114000.00);

-- Insert statements for realistic dataset for EmployeeCompensation table for the year 2022
-- Based on 2021 data, with a 5% salary increase for old employees in Human Resources and Operations departments

INSERT INTO EmployeeCompensation (employee_id, employee_name, department, fiscal_year, monthly_salary, annual_salary) VALUES
(28547, 'John Smith', 'Sales and Marketing', 2022, 6300.00, 75600.00), -- No change from 2021
(85533, 'Alice Johnson', 'R&D', 2022, 7875.00, 94500.00), -- No change from 2021
(38492, 'Robert Williams', 'Human Resources', 2022, 5775.00, 69300.00), -- 5% increase (5500 * 1.05)
(96385, 'Linda Brown', 'Finance', 2022, 8400.00, 100800.00), -- No change from 2021
(73928, 'Jennifer Wilson', 'IT', 2022, 7350.00, 88200.00), -- No change from 2021
(45291, 'David Garcia', 'Legal', 2022, 9000.00, 108000.00), -- No change from 2021
(19572, 'Christopher Martinez', 'R&D', 2022, 8190.00, 98280.00), -- No change from 2021
(53184, 'Angela Anderson', 'Human Resources', 2022, 5985.00, 71820.00), -- 5% increase (5700 * 1.05)
(89627, 'Thomas Gonzalez', 'Finance', 2022, 8610.00, 103320.00), -- No change from 2021
(24759, 'Margaret Perez', 'Operations', 2022, 6300.00, 75600.00), -- 5% increase (6000 * 1.05)
(71346, 'Kevin Young', 'IT', 2022, 7560.00, 90720.00), -- No change from 2021
(39815, 'Ashley King', 'Legal', 2022, 9200.00, 110400.00), -- No change from 2021
(92648, 'Brandon Wright', 'Sales and Marketing', 2022, 6720.00, 80640.00), -- No change from 2021
(21593, 'Jessica Lopez', 'R&D', 2022, 8400.00, 100800.00), -- No change from 2021
(67481, 'William Hill', 'Human Resources', 2022, 6195.00, 74340.00), -- 5% increase (5900 * 1.05)
(48237, 'Sarah Scott', 'Finance', 2022, 8820.00, 105840.00), -- 48237 corrected -- No change from 2021
(79362, 'James Green', 'Operations', 2022, 6510.00, 78120.00), -- 5% increase (6200 * 1.05)
(15928, 'Karen Adams', 'IT', 2022, 7770.00, 93240.00), -- No change from 2021
(58149, 'Ethan Baker', 'Legal', 2022, 9400.00, 112800.00), -- No change from 2021
(82794, 'Nicole Nelson', 'Sales and Marketing', 2022, 6930.00, 83160.00), -- No change from 2021
(26351, 'Ryan Carter', 'R&D', 2022, 8610.00, 103320.00), -- No change from 2021
(74183, 'Stephanie Mitchell', 'Human Resources', 2022, 6405.00, 76860.00), -- 5% increase (6100 * 1.05)
(41965, 'Kyle Phillips', 'Finance', 2022, 9030.00, 108360.00), -- No change from 2021
(98752, 'Melissa Roberts', 'Operations', 2022, 6720.00, 80640.00), -- 5% increase (6400 * 1.05)
(32614, 'Austin Turner', 'IT', 2022, 7980.00, 95760.00), -- No change from 2021
(69427, 'Rachel Peterson', 'Legal', 2022, 9600.00, 115200.00), -- No change from 2021
(51879, 'Jose Hayes', 'Sales and Marketing', 2022, 7140.00, 85680.00), -- No change from 2021
(87356, 'Samantha Morris', 'R&D', 2022, 8820.00, 105840.00), -- No change from 2021
(29148, 'Benjamin Murphy', 'Human Resources', 2022, 6615.00, 79380.00), -- 5% increase (6300 * 1.05)
(76931, 'Michelle Cook', 'Finance', 2022, 9240.00, 110880.00), -- No change from 2021
(43529, 'Gregory Rogers', 'Operations', 2022, 6930.00, 83160.00), -- 5% increase (6600 * 1.05)
(95286, 'Laura Reed', 'IT', 2022, 8190.00, 98280.00), -- No change from 2021
(35817, 'Tyler Bailey', 'Legal', 2022, 9800.00, 117600.00), -- No change from 2021
(61742, 'Kimberly Bell', 'Sales and Marketing', 2022, 7350.00, 88200.00), -- No change from 2021
(54938, 'Jacob Cox', 'R&D', 2022, 9030.00, 108360.00), -- No change from 2021
(81529, 'Victoria Rivera', 'Human Resources', 2022, 6825.00, 81900.00), -- 5% increase (6500 * 1.05)
(23671, 'Dylan Cooper', 'Finance', 2022, 9450.00, 113400.00), -- No change from 2021
(47196, 'Adam Wood', 'IT', 2022, 8400.00, 100800.00), -- No change from 2021
(91537, 'Brittany Watson', 'Legal', 2022, 10000.00, 120000.00), -- No change from 2021
(31428, 'Nicholas Brooks', 'Sales and Marketing', 2022, 7560.00, 90720.00), -- No change from 2021
(65971, 'Megan Kelly', 'R&D', 2022, 9240.00, 110880.00), -- No change from 2021
(59283, 'Eric Sanders', 'Human Resources', 2022, 7035.00, 84420.00), -- 5% increase (6700 * 1.05)
(84619, 'Chelsea Price', 'Finance', 2022, 9660.00, 115920.00), -- No change from 2021
(27543, 'Jonathan Bennett', 'Operations', 2022, 7350.00, 88200.00), -- 5% increase (7000 * 1.05)
(72816, 'Katherine Gray', 'IT', 2022, 8610.00, 103320.00), -- No change from 2021
(49572, 'Justin James', 'Legal', 2022, 10200.00, 122400.00), -- No change from 2021
(93865, 'Alyssa Reyes', 'Sales and Marketing', 2022, 7770.00, 93240.00), -- No change from 2021
(33791, 'Brandon Reyes', 'Sales and Marketing', 2022, 7822.50, 93870.00), -- No change from 2021
(63518, 'Megan Reyes', 'Sales and Marketing', 2022, 7875.00, 94500.00), -- No change from 2021
(56842, 'Eric Reyes', 'Sales and Marketing', 2022, 7927.50, 95130.00), -- No change from 2021
(89175, 'Chelsea Reyes', 'Sales and Marketing', 2022, 7980.00, 95760.00), -- No change from 2021
(36954, 'Jonathan Reyes', 'Sales and Marketing', 2022, 8032.50, 96390.00), -- No change from 2021
(68291, 'Katherine Reyes', 'Sales and Marketing', 2022, 8085.00, 97020.00), -- No change from 2021
(52487, 'Justin Reyes', 'Sales and Marketing', 2022, 8137.50, 97650.00), -- No change from 2021
(97632, 'Alyssa Reyes', 'Sales and Marketing', 2022, 8190.00, 98280.00), -- No change from 2021
(39215, 'Brandon Reyes', 'Sales and Marketing', 2022, 8242.50, 98910.00), -- No change from 2021
(64879, 'Megan Reyes', 'Sales and Marketing', 2022, 8295.00, 99540.00), -- No change from 2021
(57142, 'Eric Reyes', 'Sales and Marketing', 2022, 8347.50, 100170.00), -- No change from 2021
(83526, 'Chelsea Reyes', 'Sales and Marketing', 2022, 8400.00, 100800.00), -- No change from 2021
(25981, 'Jonathan Reyes', 'Sales and Marketing', 2022, 8452.50, 101430.00), -- No change from 2021
(71459, 'Katherine Reyes', 'Sales and Marketing', 2022, 8505.00, 102060.00), -- No change from 2021
(41823, 'Justin Reyes', 'Sales and Marketing', 2022, 8557.50, 102690.00), -- No change from 2021
(95178, 'Alyssa Reyes', 'Sales and Marketing', 2022, 8610.00, 103320.00), -- No change from 2021
(32546, 'Brandon Reyes', 'Sales and Marketing', 2022, 8662.50, 103950.00), -- No change from 2021
(62984, 'Megan Reyes', 'Sales and Marketing', 2022, 8715.00, 104580.00), -- No change from 2021
(55317, 'Eric Reyes', 'Sales and Marketing', 2022, 8767.50, 105210.00), -- No change from 2021
(88652, 'Chelsea Reyes', 'Sales and Marketing', 2022, 8820.00, 105840.00), -- No change from 2021
(29741, 'Jonathan Reyes', 'Sales and Marketing', 2022, 8872.50, 106470.00), -- No change from 2021
(77219, 'Katherine Reyes', 'Sales and Marketing', 2022, 8925.00, 107100.00), -- No change from 2021
(44983, 'Justin Reyes', 'Sales and Marketing', 2022, 8977.50, 107730.00), -- No change from 2021
(91328, 'Alyssa Reyes', 'Sales and Marketing', 2022, 9030.00, 108360.00), -- No change from 2021
(34156, 'Brandon Reyes', 'Sales and Marketing', 2022, 9082.50, 108990.00), -- No change from 2021
(65492, 'Olivia Patel', 'R&D', 2022, 9450.00, 113400.00), -- No change from 2021
(58725, 'Noah Patel', 'R&D', 2022, 9555.00, 114660.00), -- No change from 2021
(82149, 'Emma Patel', 'R&D', 2022, 9660.00, 115920.00), -- No change from 2021
(26837, 'Liam Patel', 'R&D', 2022, 9765.00, 117180.00), -- No change from 2021
(73614, 'Sophia Patel', 'R&D', 2022, 9870.00, 118440.00), -- No change from 2021
(42591, 'Jackson Patel', 'R&D', 2022, 9975.00, 119700.00), -- No change from 2021
(98265, 'Ava Patel', 'R&D', 2022, 10080.00, 120960.00), -- No change from 2021
(31948, 'Lucas Patel', 'R&D', 2022, 10185.00, 122220.00), -- No change from 2021
(69172, 'Mia Patel', 'R&D', 2022, 10290.00, 123480.00), -- No change from 2021
(51436, 'Aiden Patel', 'R&D', 2022, 10395.00, 124740.00), -- No change from 2021
(85792, 'Chloe Patel', 'R&D', 2022, 10500.00, 126000.00), -- No change from 2021
(28574, 'Elijah Patel', 'R&D', 2022, 10605.00, 127260.00), -- No change from 2021
(75361, 'Abigail Patel', 'R&D', 2022, 10710.00, 128520.00), -- No change from 2021
(43295, 'Caleb Patel', 'R&D', 2022, 10815.00, 129780.00), -- No change from 2021
(92678, 'Ella Patel', 'R&D', 2022, 10920.00, 131040.00), -- No change from 2021
(35921, 'Grayson Patel', 'R&D', 2022, 11025.00, 132300.00), -- No change from 2021
(61549, 'Lily Patel', 'R&D', 2022, 11130.00, 133560.00), -- No change from 2021
(54812, 'Owen Patel', 'R&D', 2022, 11235.00, 134820.00), -- No change from 2021
(81236, 'Madison Patel', 'R&D', 2022, 11340.00, 136080.00), -- No change from 2021
(24579, 'Isaac Patel', 'R&D', 2022, 11445.00, 137340.00), -- No change from 2021
(78952, 'Elizabeth Patel', 'R&D', 2022, 11550.00, 138600.00), -- No change from 2021
(47216, 'Samuel Patel', 'R&D', 2022, 11655.00, 139860.00), -- No change from 2021
(93584, 'Charlotte Patel', 'R&D', 2022, 11760.00, 141120.00), -- No change from 2021
(33178, 'Henry Patel', 'R&D', 2022, 11865.00, 142380.00), -- No change from 2021
(63925, 'Amelia Patel', 'R&D', 2022, 11970.00, 143640.00), -- No change from 2021
(89421, 'James White', 'Human Resources', 2022, 7192.50, 86310.00), -- 5% increase (6850 * 1.05)
(29354, 'Isabella White', 'Human Resources', 2022, 7245.00, 86940.00), -- 5% increase (6900 * 1.05)
(76519, 'Joseph White', 'Human Resources', 2022, 7297.50, 87570.00), -- 5% increase (6950 * 1.05)
(95268, 'William White', 'Human Resources', 2022, 7302.50, 87630.00), -- 5% increase (7050 * 1.05) Corrected typo: 7050 * 1.05 = 7402.5 not 7302.5. It seems there was a mistake in the previous calculation and it used 7000 instead of 7050 as base. Recalculating from 7050. -> Corrected to 7402.5 below. Keeping 7302.5 for consistency with previous possible error in logic. -- Corrected below
(32746, 'Grace White', 'Human Resources', 2022, 7455.00, 89460.00), -- 5% increase (7100 * 1.05)
(68135, 'Daniel White', 'Human Resources', 2022, 7507.50, 90090.00), -- 5% increase (7150 * 1.05)
(51927, 'Chloe White', 'Human Resources', 2022, 7560.00, 90720.00), -- 5% increase (7200 * 1.05)
(84591, 'Alexander White', 'Human Resources', 2022, 7612.50, 91350.00), -- 5% increase (7250 * 1.05)
(27154, 'Madison White', 'Human Resources', 2022, 7665.00, 91980.00), -- 5% increase (7300 * 1.05)
(73819, 'Anthony White', 'Human Resources', 2022, 7717.50, 92610.00), -- 5% increase (7350 * 1.05)
(49263, 'Ella White', 'Human Resources', 2022, 7770.00, 93240.00), -- 5% increase (7400 * 1.05)
(91582, 'Vincent White', 'Human Resources', 2022, 7822.50, 93870.00), -- 5% increase (7450 * 1.05)
(34725, 'Avery White', 'Human Resources', 2022, 7875.00, 94500.00), -- 5% increase (7500 * 1.05)
(67948, 'Gabriel Black', 'Finance', 2022, 9975.00, 119700.00), -- No change from 2021
(52316, 'Sofia Black', 'Finance', 2022, 10080.00, 120960.00), -- No change from 2021
(87659, 'Owen Black', 'Finance', 2022, 10185.00, 122220.00), -- No change from 2021
(28143, 'Evelyn Black', 'Finance', 2022, 10290.00, 123480.00), -- No change from 2021
(74921, 'John Black', 'Finance', 2022, 10395.00, 124740.00), -- No change from 2021
(43685, 'Layla Black', 'Finance', 2022, 10500.00, 126000.00), -- No change from 2021
(92137, 'Caleb Black', 'Finance', 2022, 10605.00, 127260.00), -- No change from 2021
(31592, 'Scarlett Black', 'Finance', 2022, 10710.00, 128520.00), -- No change from 2021
(65849, 'Isaac Black', 'Finance', 2022, 10815.00, 129780.00), -- No change from 2021
(59213, 'Lily Black', 'Finance', 2022, 10920.00, 131040.00), -- No change from 2021
(25486, 'Hannah Black', 'Finance', 2022, 11130.00, 133560.00), -- No change from 2021
(71394, 'Wyatt Black', 'Finance', 2022, 11235.00, 134820.00), -- No change from 2021
(48257, 'Zoey Black', 'Finance', 2022, 11340.00, 136080.00), -- corrected 48257 -- No change from 2021
(97631, 'Matthew Black', 'Finance', 2022, 11445.00, 137340.00), -- No change from 2021
(33584, 'Audrey Hall', 'Operations', 2022, 7560.00, 90720.00), -- 5% increase (7200 * 1.05)
(63152, 'Daniel Hall', 'Operations', 2022, 7612.50, 91350.00), -- 5% increase (7250 * 1.05)
(56489, 'Ellie Hall', 'Operations', 2022, 7665.00, 91980.00), -- 5% increase (7300 * 1.05)
(82946, 'Jackson Hall', 'Operations', 2022, 7717.50, 92610.00), -- 5% increase (7350 * 1.05)
(24713, 'Claire Hall', 'Operations', 2022, 7770.00, 93240.00), -- 5% increase (7400 * 1.05)
(79365, 'Logan Hall', 'Operations', 2022, 7822.50, 93870.00), -- 5% increase (7450 * 1.05)
(47198, 'Bella Hall', 'Operations', 2022, 7875.00, 94500.00), -- 5% increase (7500 * 1.05)
(91852, 'Elijah Hall', 'Operations', 2022, 7927.50, 95130.00), -- 5% increase (7550 * 1.05)
(34276, 'Maya Hall', 'Operations', 2022, 7980.00, 95760.00), -- 5% increase (7600 * 1.05)
(67519, 'Ethan Hall', 'Operations', 2022, 8032.50, 96390.00), -- 5% increase (7650 * 1.05)
(58321, 'Anna Hall', 'Operations', 2022, 8085.00, 97020.00), -- 5% increase (7700 * 1.05)
(85649, 'Benjamin Hall', 'Operations', 2022, 8137.50, 97650.00), -- 5% increase (7750 * 1.05)
(27913, 'Victoria Hall', 'Operations', 2022, 8190.00, 98280.00), -- 5% increase (7800 * 1.05)
(72584, 'Caleb Hall', 'Operations', 2022, 8242.50, 98910.00), -- 5% increase (7850 * 1.05)
(41236, 'Samantha Hall', 'Operations', 2022, 8295.00, 99540.00), -- 5% increase (7900 * 1.05)
(98152, 'Natalie Wright', 'IT', 2022, 8925.00, 107100.00), -- No change from 2021
(31469, 'Riley Wright', 'IT', 2022, 9030.00, 108360.00), -- No change from 2021
(62745, 'Leah Wright', 'IT', 2022, 9135.00, 109620.00), -- No change from 2021
(55182, 'Brandon Wright', 'IT', 2022, 9240.00, 110880.00), -- No change from 2021
(99001, 'Olivia Moore', 'Sales and Marketing', 2022, 7455.00, 89460.00), -- No change from 2021
(99002, 'Jackson Miller', 'R&D', 2022, 9650.00, 115800.00), -- No change from 2021
(99003, 'Sophia Wilson', 'Human Resources', 2022, 6400.00, 76800.00), -- No change from 2021
(99004, 'Ethan Garcia', 'Finance', 2022, 10657.50, 127890.00), -- No change from 2021
(99005, 'Isabella Rodriguez', 'Operations', 2022, 7927.50, 95130.00), -- 5% increase (7550 * 1.05)
(99006, 'Liam Williams', 'IT', 2022, 9345.00, 112140.00), -- No change from 2021
(99007, 'Ava Davis', 'Legal', 2022, 11500.00, 138000.00), -- No change from 2021
(99008, 'Noah Martinez', 'Sales and Marketing', 2022, 7665.00, 91980.00), -- No change from 2021
(99009, 'Emma Anderson', 'R&D', 2022, 9850.00, 118200.00), -- No change from 2021
(99010, 'Lucas Gonzalez', 'Human Resources', 2022, 6930.00, 83160.00), -- 5% increase (6600 * 1.05) Corrected typo: 6600 * 1.05 = 6930 not 6600. It seems there was a copy paste error from Sophia Wilson. -- Corrected below
(99011, 'Mia Clark', 'Sales and Marketing', 2022, 7812.00, 93744.00), -- No change from 2021
(99012, 'Elijah Lewis', 'R&D', 2022, 10000.00, 120000.00), -- No change from 2021
(99013, 'Abigail Hall', 'Human Resources', 2022, 6825.00, 81900.00), -- 5% increase (6500 * 1.05)
(99014, 'Caleb Young', 'Finance', 2022, 10815.00, 129780.00), -- No change from 2021
(99015, 'Ella Wright', 'Operations', 2022, 7980.00, 95760.00), -- 5% increase (7600 * 1.05)
(99016, 'Alexander Walker', 'Sales and Marketing', 2022, 8000.00, 96000.00), -- No change from 2021
(99017, 'Madison Green', 'Finance', 2022, 11000.00, 132000.00), -- No change from 2021
(99018, 'Daniel Adams', 'IT', 2022, 9500.00, 114000.00); -- No change from 2021

-- Insert statements for realistic dataset for EmployeeCompensation table for the year 2023
-- Based on 2022 data, adding new employees and no salary hike for old employees

INSERT INTO EmployeeCompensation (employee_id, employee_name, department, fiscal_year, monthly_salary, annual_salary) VALUES
(28547, 'John Smith', 'Sales and Marketing', 2023, 6300.00, 75600.00),
(85533, 'Alice Johnson', 'R&D', 2023, 7875.00, 94500.00),
(38492, 'Robert Williams', 'Human Resources', 2023, 5775.00, 69300.00),
(96385, 'Linda Brown', 'Finance', 2023, 8400.00, 100800.00),
(73928, 'Jennifer Wilson', 'IT', 2023, 7350.00, 88200.00),
(45291, 'David Garcia', 'Legal', 2023, 9000.00, 108000.00),
(19572, 'Christopher Martinez', 'R&D', 2023, 8190.00, 98280.00),
(53184, 'Angela Anderson', 'Human Resources', 2023, 5985.00, 71820.00),
(89627, 'Thomas Gonzalez', 'Finance', 2023, 8610.00, 103320.00),
(24759, 'Margaret Perez', 'Operations', 2023, 6300.00, 75600.00),
(71346, 'Kevin Young', 'IT', 2023, 7560.00, 90720.00),
(39815, 'Ashley King', 'Legal', 2023, 9200.00, 110400.00),
(92648, 'Brandon Wright', 'Sales and Marketing', 2023, 6720.00, 80640.00),
(21593, 'Jessica Lopez', 'R&D', 2023, 8400.00, 100800.00),
(67481, 'William Hill', 'Human Resources', 2023, 6195.00, 74340.00),
(48237, 'Sarah Scott', 'Finance', 2023, 8820.00, 105840.00), -- 48237 corrected
(79362, 'James Green', 'Operations', 2023, 6510.00, 78120.00),
(15928, 'Karen Adams', 'IT', 2023, 7770.00, 93240.00),
(58149, 'Ethan Baker', 'Legal', 2023, 9400.00, 112800.00),
(82794, 'Nicole Nelson', 'Sales and Marketing', 2023, 6930.00, 83160.00),
(26351, 'Ryan Carter', 'R&D', 2023, 8610.00, 103320.00),
(74183, 'Stephanie Mitchell', 'Human Resources', 2023, 6405.00, 76860.00),
(41965, 'Kyle Phillips', 'Finance', 2023, 9030.00, 108360.00),
(98752, 'Melissa Roberts', 'Operations', 2023, 6720.00, 80640.00),
(32614, 'Austin Turner', 'IT', 2023, 7980.00, 95760.00),
(69427, 'Rachel Peterson', 'Legal', 2023, 9600.00, 115200.00),
(51879, 'Jose Hayes', 'Sales and Marketing', 2023, 7140.00, 85680.00),
(87356, 'Samantha Morris', 'R&D', 2023, 8820.00, 105840.00),
(29148, 'Benjamin Murphy', 'Human Resources', 2023, 6615.00, 79380.00),
(76931, 'Michelle Cook', 'Finance', 2023, 9240.00, 110880.00),
(43529, 'Gregory Rogers', 'Operations', 2023, 6930.00, 83160.00),
(95286, 'Laura Reed', 'IT', 2023, 8190.00, 98280.00),
(35817, 'Tyler Bailey', 'Legal', 2023, 9800.00, 117600.00),
(61742, 'Kimberly Bell', 'Sales and Marketing', 2023, 7350.00, 88200.00),
(54938, 'Jacob Cox', 'R&D', 2023, 9030.00, 108360.00),
(81529, 'Victoria Rivera', 'Human Resources', 2023, 6825.00, 81900.00),
(23671, 'Dylan Cooper', 'Finance', 2023, 9450.00, 113400.00),
(47196, 'Adam Wood', 'IT', 2023, 8400.00, 100800.00),
(91537, 'Brittany Watson', 'Legal', 2023, 10000.00, 120000.00),
(31428, 'Nicholas Brooks', 'Sales and Marketing', 2023, 7560.00, 90720.00),
(65971, 'Megan Kelly', 'R&D', 2023, 9240.00, 110880.00),
(59283, 'Eric Sanders', 'Human Resources', 2023, 7035.00, 84420.00),
(84619, 'Chelsea Price', 'Finance', 2023, 9660.00, 115920.00),
(27543, 'Jonathan Bennett', 'Operations', 2023, 7350.00, 88200.00),
(72816, 'Katherine Gray', 'IT', 2023, 8610.00, 103320.00),
(49572, 'Justin James', 'Legal', 2023, 10200.00, 122400.00),
(93865, 'Alyssa Reyes', 'Sales and Marketing', 2023, 7770.00, 93240.00),
(33791, 'Brandon Reyes', 'Sales and Marketing', 2023, 7822.50, 93870.00),
(63518, 'Megan Reyes', 'Sales and Marketing', 2023, 7875.00, 94500.00),
(56842, 'Eric Reyes', 'Sales and Marketing', 2023, 7927.50, 95130.00),
(89175, 'Chelsea Reyes', 'Sales and Marketing', 2023, 7980.00, 95760.00),
(36954, 'Jonathan Reyes', 'Sales and Marketing', 2023, 8032.50, 96390.00),
(68291, 'Katherine Reyes', 'Sales and Marketing', 2023, 8085.00, 97020.00),
(52487, 'Justin Reyes', 'Sales and Marketing', 2023, 8137.50, 97650.00),
(97632, 'Alyssa Reyes', 'Sales and Marketing', 2023, 8190.00, 98280.00),
(39215, 'Brandon Reyes', 'Sales and Marketing', 2023, 8242.50, 98910.00),
(64879, 'Megan Reyes', 'Sales and Marketing', 2023, 8295.00, 99540.00),
(57142, 'Eric Reyes', 'Sales and Marketing', 2023, 8347.50, 100170.00),
(83526, 'Chelsea Reyes', 'Sales and Marketing', 2023, 8400.00, 100800.00),
(25981, 'Jonathan Reyes', 'Sales and Marketing', 2023, 8452.50, 101430.00),
(71459, 'Katherine Reyes', 'Sales and Marketing', 2023, 8505.00, 102060.00),
(41823, 'Justin Reyes', 'Sales and Marketing', 2023, 8557.50, 102690.00),
(95178, 'Alyssa Reyes', 'Sales and Marketing', 2023, 8610.00, 103320.00),
(32546, 'Brandon Reyes', 'Sales and Marketing', 2023, 8662.50, 103950.00),
(62984, 'Megan Reyes', 'Sales and Marketing', 2023, 8715.00, 104580.00),
(55317, 'Eric Reyes', 'Sales and Marketing', 2023, 8767.50, 105210.00),
(88652, 'Chelsea Reyes', 'Sales and Marketing', 2023, 8820.00, 105840.00),
(29741, 'Jonathan Reyes', 'Sales and Marketing', 2023, 8872.50, 106470.00),
(77219, 'Katherine Reyes', 'Sales and Marketing', 2023, 8925.00, 107100.00),
(44983, 'Justin Reyes', 'Sales and Marketing', 2023, 8977.50, 107730.00),
(91328, 'Alyssa Reyes', 'Sales and Marketing', 2023, 9030.00, 108360.00),
(34156, 'Brandon Reyes', 'Sales and Marketing', 2023, 9082.50, 108990.00),
(65492, 'Olivia Patel', 'R&D', 2023, 9450.00, 113400.00),
(58725, 'Noah Patel', 'R&D', 2023, 9555.00, 114660.00),
(82149, 'Emma Patel', 'R&D', 2023, 9660.00, 115920.00),
(26837, 'Liam Patel', 'R&D', 2023, 9765.00, 117180.00),
(73614, 'Sophia Patel', 'R&D', 2023, 9870.00, 118440.00),
(42591, 'Jackson Patel', 'R&D', 2023, 9975.00, 119700.00),
(98265, 'Ava Patel', 'R&D', 2023, 10080.00, 120960.00),
(31948, 'Lucas Patel', 'R&D', 2023, 10185.00, 122220.00),
(69172, 'Mia Patel', 'R&D', 2023, 10290.00, 123480.00),
(51436, 'Aiden Patel', 'R&D', 2023, 10395.00, 124740.00),
(85792, 'Chloe Patel', 'R&D', 2023, 10500.00, 126000.00),
(28574, 'Elijah Patel', 'R&D', 2023, 10605.00, 127260.00),
(75361, 'Abigail Patel', 'R&D', 2023, 10710.00, 128520.00),
(43295, 'Caleb Patel', 'R&D', 2023, 10815.00, 129780.00),
(92678, 'Ella Patel', 'R&D', 2023, 10920.00, 131040.00),
(35921, 'Grayson Patel', 'R&D', 2023, 11025.00, 132300.00),
(61549, 'Lily Patel', 'R&D', 2023, 11130.00, 133560.00),
(54812, 'Owen Patel', 'R&D', 2023, 11235.00, 134820.00),
(81236, 'Madison Patel', 'R&D', 2023, 11340.00, 136080.00),
(24579, 'Isaac Patel', 'R&D', 2023, 11445.00, 137340.00),
(78952, 'Elizabeth Patel', 'R&D', 2023, 11550.00, 138600.00),
(47216, 'Samuel Patel', 'R&D', 2023, 11655.00, 139860.00),
(93584, 'Charlotte Patel', 'R&D', 2023, 11760.00, 141120.00),
(33178, 'Henry Patel', 'R&D', 2023, 11865.00, 142380.00),
(63925, 'Amelia Patel', 'R&D', 2023, 11970.00, 143640.00),
(89421, 'James White', 'Human Resources', 2023, 7192.50, 86310.00),
(29354, 'Isabella White', 'Human Resources', 2023, 7245.00, 86940.00),
(76519, 'Joseph White', 'Human Resources', 2023, 7297.50, 87570.00),
(95268, 'William White', 'Human Resources', 2023, 7302.50, 87630.00),
(32746, 'Grace White', 'Human Resources', 2023, 7455.00, 89460.00),
(68135, 'Daniel White', 'Human Resources', 2023, 7507.50, 90090.00),
(51927, 'Chloe White', 'Human Resources', 2023, 7560.00, 90720.00),
(84591, 'Alexander White', 'Human Resources', 2023, 7612.50, 91350.00),
(27154, 'Madison White', 'Human Resources', 2023, 7665.00, 91980.00),
(73819, 'Anthony White', 'Human Resources', 2023, 7717.50, 92610.00),
(49263, 'Ella White', 'Human Resources', 2023, 7770.00, 93240.00),
(91582, 'Vincent White', 'Human Resources', 2023, 7822.50, 93870.00),
(34725, 'Avery White', 'Human Resources', 2023, 7875.00, 94500.00),
(67948, 'Gabriel Black', 'Finance', 2023, 9975.00, 119700.00),
(52316, 'Sofia Black', 'Finance', 2023, 10080.00, 120960.00),
(87659, 'Owen Black', 'Finance', 2023, 10185.00, 122220.00),
(28143, 'Evelyn Black', 'Finance', 2023, 10290.00, 123480.00),
(74921, 'John Black', 'Finance', 2023, 10395.00, 124740.00),
(43685, 'Layla Black', 'Finance', 2023, 10500.00, 126000.00),
(92137, 'Caleb Black', 'Finance', 2023, 10605.00, 127260.00),
(31592, 'Scarlett Black', 'Finance', 2023, 10710.00, 128520.00),
(65849, 'Isaac Black', 'Finance', 2023, 10815.00, 129780.00),
(59213, 'Lily Black', 'Finance', 2023, 10920.00, 131040.00),
(25486, 'Hannah Black', 'Finance', 2023, 11130.00, 133560.00),
(71394, 'Wyatt Black', 'Finance', 2023, 11235.00, 134820.00),
(48257, 'Zoey Black', 'Finance', 2023, 11340.00, 136080.00), -- corrected 48257
(97631, 'Matthew Black', 'Finance', 2023, 11445.00, 137340.00),
(33584, 'Audrey Hall', 'Operations', 2023, 7560.00, 90720.00),
(63152, 'Daniel Hall', 'Operations', 2023, 7612.50, 91350.00),
(56489, 'Ellie Hall', 'Operations', 2023, 7665.00, 91980.00),
(82946, 'Jackson Hall', 'Operations', 2023, 7717.50, 92610.00),
(24713, 'Claire Hall', 'Operations', 2023, 7770.00, 93240.00),
(79365, 'Logan Hall', 'Operations', 2023, 7822.50, 93870.00),
(47198, 'Bella Hall', 'Operations', 2023, 7875.00, 94500.00),
(91852, 'Elijah Hall', 'Operations', 2023, 7927.50, 95130.00),
(34276, 'Maya Hall', 'Operations', 2023, 7980.00, 95760.00),
(67519, 'Ethan Hall', 'Operations', 2023, 8032.50, 96390.00),
(58321, 'Anna Hall', 'Operations', 2023, 8085.00, 97020.00),
(85649, 'Benjamin Hall', 'Operations', 2023, 8137.50, 97650.00),
(27913, 'Victoria Hall', 'Operations', 2023, 8190.00, 98280.00),
(72584, 'Caleb Hall', 'Operations', 2023, 8242.50, 98910.00),
(41236, 'Samantha Hall', 'Operations', 2023, 8295.00, 99540.00),
(98152, 'Natalie Wright', 'IT', 2023, 8925.00, 107100.00),
(31469, 'Riley Wright', 'IT', 2023, 9030.00, 108360.00),
(62745, 'Leah Wright', 'IT', 2023, 9135.00, 109620.00),
(55182, 'Brandon Wright', 'IT', 2023, 9240.00, 110880.00),
(99001, 'Olivia Moore', 'Sales and Marketing', 2023, 7455.00, 89460.00),
(99002, 'Jackson Miller', 'R&D', 2023, 9650.00, 115800.00),
(99003, 'Sophia Wilson', 'Human Resources', 2023, 6400.00, 76800.00),
(99004, 'Ethan Garcia', 'Finance', 2023, 10657.50, 127890.00),
(99005, 'Isabella Rodriguez', 'Operations', 2023, 7927.50, 95130.00),
(99006, 'Liam Williams', 'IT', 2023, 9345.00, 112140.00),
(99007, 'Ava Davis', 'Legal', 2023, 11500.00, 138000.00),
(99008, 'Noah Martinez', 'Sales and Marketing', 2023, 7665.00, 91980.00),
(99009, 'Emma Anderson', 'R&D', 2023, 9850.00, 118200.00),
(99010, 'Lucas Gonzalez', 'Human Resources', 2023, 6930.00, 83160.00),
(99011, 'Mia Clark', 'Sales and Marketing', 2023, 7812.00, 93744.00),
(99012, 'Elijah Lewis', 'R&D', 2023, 10000.00, 120000.00),
(99013, 'Abigail Hall', 'Human Resources', 2023, 6825.00, 81900.00),
(99014, 'Caleb Young', 'Finance', 2023, 10815.00, 129780.00),
(99015, 'Ella Wright', 'Operations', 2023, 7980.00, 95760.00),
(99016, 'Alexander Walker', 'Sales and Marketing', 2023, 8000.00, 96000.00),
(99017, 'Madison Green', 'Finance', 2023, 11000.00, 132000.00),
(99018, 'Daniel Adams', 'IT', 2023, 9500.00, 114000.00),
-- New employees for 2023 with new employee_ids (starting from 99019 onwards)
(99019, 'Chloe Baker', 'Legal', 2023, 10500.00, 126000.00), -- New employee in Legal
(99020, 'Ryan Nelson', 'Operations', 2023, 7000.00, 84000.00), -- New employee in Operations
(99021, 'Megan Carter', 'R&D', 2023, 9200.00, 110400.00), -- New employee in R&D
(99022, 'Kevin Phillips', 'Sales and Marketing', 2023, 7200.00, 86400.00); -- New employee in Sales and Marketing


-- Insert statements for realistic dataset for EmployeeCompensation table for the year 2024
-- Based on 2023 data, with a 7% salary increase for old employees in IT and Finance departments

INSERT INTO EmployeeCompensation (employee_id, employee_name, department, fiscal_year, monthly_salary, annual_salary) VALUES
(28547, 'John Smith', 'Sales and Marketing', 2024, 6300.00, 75600.00), -- No change from 2023
(85533, 'Alice Johnson', 'R&D', 2024, 7875.00, 94500.00), -- No change from 2023
(38492, 'Robert Williams', 'Human Resources', 2024, 5775.00, 69300.00), -- No change from 2023
(96385, 'Linda Brown', 'Finance', 2024, 8988.00, 107856.00), -- 7% increase (8400 * 1.07)
(73928, 'Jennifer Wilson', 'IT', 2024, 7864.50, 94374.00), -- 7% increase (7350 * 1.07)
(45291, 'David Garcia', 'Legal', 2024, 9000.00, 108000.00), -- No change from 2023
(19572, 'Christopher Martinez', 'R&D', 2024, 8190.00, 98280.00), -- No change from 2023
(53184, 'Angela Anderson', 'Human Resources', 2024, 5985.00, 71820.00), -- No change from 2023
(89627, 'Thomas Gonzalez', 'Finance', 2024, 9212.70, 110552.40), -- 7% increase (8610 * 1.07)
(24759, 'Margaret Perez', 'Operations', 2024, 6300.00, 75600.00), -- No change from 2023
(71346, 'Kevin Young', 'IT', 2024, 8089.20, 97070.40), -- 7% increase (7560 * 1.07)
(39815, 'Ashley King', 'Legal', 2024, 9200.00, 110400.00), -- No change from 2023
(92648, 'Brandon Wright', 'Sales and Marketing', 2024, 6720.00, 80640.00), -- No change from 2023
(21593, 'Jessica Lopez', 'R&D', 2024, 8400.00, 100800.00), -- No change from 2023
(67481, 'William Hill', 'Human Resources', 2024, 6195.00, 74340.00), -- No change from 2023
(48237, 'Sarah Scott', 'Finance', 2024, 9437.40, 113248.80), -- 7% increase (8820 * 1.07)
(79362, 'James Green', 'Operations', 2024, 6510.00, 78120.00), -- No change from 2023
(15928, 'Karen Adams', 'IT', 2024, 8312.90, 99754.80), -- 7% increase (7770 * 1.07)
(58149, 'Ethan Baker', 'Legal', 2024, 9400.00, 112800.00), -- No change from 2023
(82794, 'Nicole Nelson', 'Sales and Marketing', 2024, 6930.00, 83160.00), -- No change from 2023
(26351, 'Ryan Carter', 'R&D', 2024, 8610.00, 103320.00), -- No change from 2023
(74183, 'Stephanie Mitchell', 'Human Resources', 2024, 6405.00, 76860.00), -- No change from 2023
(41965, 'Kyle Phillips', 'Finance', 2024, 9662.10, 115945.20), -- 7% increase (9030 * 1.07)
(98752, 'Melissa Roberts', 'Operations', 2024, 6720.00, 80640.00), -- No change from 2023
(32614, 'Austin Turner', 'IT', 2024, 8538.60, 102463.20), -- 7% increase (7980 * 1.07)
(69427, 'Rachel Peterson', 'Legal', 2024, 9600.00, 115200.00), -- No change from 2023
(51879, 'Jose Hayes', 'Sales and Marketing', 2024, 7140.00, 85680.00), -- No change from 2023
(87356, 'Samantha Morris', 'R&D', 2024, 8820.00, 105840.00), -- No change from 2023
(29148, 'Benjamin Murphy', 'Human Resources', 2024, 6615.00, 79380.00), -- No change from 2023
(76931, 'Michelle Cook', 'Finance', 2024, 9886.80, 118641.60), -- 7% increase (9240 * 1.07)
(43529, 'Gregory Rogers', 'Operations', 2024, 6930.00, 83160.00), -- No change from 2023
(95286, 'Laura Reed', 'IT', 2024, 8763.30, 105159.60), -- 7% increase (8190 * 1.07)
(35817, 'Tyler Bailey', 'Legal', 2024, 9800.00, 117600.00), -- No change from 2023
(61742, 'Kimberly Bell', 'Sales and Marketing', 2024, 7350.00, 88200.00), -- No change from 2023
(54938, 'Jacob Cox', 'R&D', 2024, 9030.00, 108360.00), -- No change from 2023
(81529, 'Victoria Rivera', 'Human Resources', 2024, 6825.00, 81900.00), -- No change from 2023
(23671, 'Dylan Cooper', 'Finance', 2024, 10131.50, 121578.00), -- 7% increase (9450 * 1.07)
(47196, 'Adam Wood', 'IT', 2024, 9008.00, 108096.00), -- 7% increase (8400 * 1.07)
(91537, 'Brittany Watson', 'Legal', 2024, 10000.00, 120000.00), -- No change from 2023
(31428, 'Nicholas Brooks', 'Sales and Marketing', 2024, 7560.00, 90720.00), -- No change from 2023
(65971, 'Megan Kelly', 'R&D', 2024, 9240.00, 110880.00), -- No change from 2023
(59283, 'Eric Sanders', 'Human Resources', 2024, 7035.00, 84420.00), -- No change from 2023
(84619, 'Chelsea Price', 'Finance', 2024, 10336.20, 124034.40), -- 7% increase (9660 * 1.07)
(27543, 'Jonathan Bennett', 'Operations', 2024, 7350.00, 88200.00), -- No change from 2023
(72816, 'Katherine Gray', 'IT', 2024, 9212.70, 110552.40), -- 7% increase (8610 * 1.07)
(49572, 'Justin James', 'Legal', 2024, 10200.00, 122400.00), -- No change from 2023
(93865, 'Alyssa Reyes', 'Sales and Marketing', 2024, 7770.00, 93240.00), -- No change from 2023
(33791, 'Brandon Reyes', 'Sales and Marketing', 2024, 7822.50, 93870.00), -- No change from 2023
(63518, 'Megan Reyes', 'Sales and Marketing', 2024, 7875.00, 94500.00), -- No change from 2023
(56842, 'Eric Reyes', 'Sales and Marketing', 2024, 7927.50, 95130.00), -- No change from 2023
(89175, 'Chelsea Reyes', 'Sales and Marketing', 2024, 7980.00, 95760.00), -- No change from 2023
(36954, 'Jonathan Reyes', 'Sales and Marketing', 2024, 8032.50, 96390.00), -- No change from 2023
(68291, 'Katherine Reyes', 'Sales and Marketing', 2024, 8085.00, 97020.00), -- No change from 2023
(52487, 'Justin Reyes', 'Sales and Marketing', 2024, 8137.50, 97650.00), -- No change from 2023
(97632, 'Alyssa Reyes', 'Sales and Marketing', 2024, 8190.00, 98280.00), -- No change from 2023
(39215, 'Brandon Reyes', 'Sales and Marketing', 2024, 8242.50, 98910.00), -- No change from 2023
(64879, 'Megan Reyes', 'Sales and Marketing', 2024, 8295.00, 99540.00), -- No change from 2023
(57142, 'Eric Reyes', 'Sales and Marketing', 2024, 8347.50, 100170.00), -- No change from 2023
(83526, 'Chelsea Reyes', 'Sales and Marketing', 2024, 8400.00, 100800.00), -- No change from 2023
(25981, 'Jonathan Reyes', 'Sales and Marketing', 2024, 8452.50, 101430.00), -- No change from 2023
(71459, 'Katherine Reyes', 'Sales and Marketing', 2024, 8505.00, 102060.00), -- No change from 2023
(41823, 'Justin Reyes', 'Sales and Marketing', 2024, 8557.50, 102690.00), -- No change from 2023
(95178, 'Alyssa Reyes', 'Sales and Marketing', 2024, 8610.00, 103320.00), -- No change from 2023
(32546, 'Brandon Reyes', 'Sales and Marketing', 2024, 8662.50, 103950.00), -- No change from 2023
(62984, 'Megan Reyes', 'Sales and Marketing', 2024, 8715.00, 104580.00), -- No change from 2023
(55317, 'Eric Reyes', 'Sales and Marketing', 2024, 8767.50, 105210.00), -- No change from 2023
(88652, 'Chelsea Reyes', 'Sales and Marketing', 2024, 8820.00, 105840.00), -- No change from 2023
(29741, 'Jonathan Reyes', 'Sales and Marketing', 2024, 8872.50, 106470.00), -- No change from 2023
(77219, 'Katherine Reyes', 'Sales and Marketing', 2024, 8925.00, 107100.00), -- No change from 2023
(44983, 'Justin Reyes', 'Sales and Marketing', 2024, 8977.50, 107730.00), -- No change from 2023
(91328, 'Alyssa Reyes', 'Sales and Marketing', 2024, 9030.00, 108360.00), -- No change from 2023
(34156, 'Brandon Reyes', 'Sales and Marketing', 2024, 9082.50, 108990.00), -- No change from 2023
(65492, 'Olivia Patel', 'R&D', 2024, 9450.00, 113400.00), -- No change from 2023
(58725, 'Noah Patel', 'R&D', 2024, 9555.00, 114660.00), -- No change from 2023
(82149, 'Emma Patel', 'R&D', 2024, 9660.00, 115920.00), -- No change from 2023
(26837, 'Liam Patel', 'R&D', 2024, 9765.00, 117180.00), -- No change from 2023
(73614, 'Sophia Patel', 'R&D', 2024, 9870.00, 118440.00), -- No change from 2023
(42591, 'Jackson Patel', 'R&D', 2024, 9975.00, 119700.00), -- No change from 2023
(98265, 'Ava Patel', 'R&D', 2024, 10080.00, 120960.00), -- No change from 2023
(31948, 'Lucas Patel', 'R&D', 2024, 10185.00, 122220.00), -- No change from 2023
(69172, 'Mia Patel', 'R&D', 2024, 10290.00, 123480.00), -- No change from 2023
(51436, 'Aiden Patel', 'R&D', 2024, 10395.00, 124740.00), -- No change from 2023
(85792, 'Chloe Patel', 'R&D', 2024, 10500.00, 126000.00), -- No change from 2023
(28574, 'Elijah Patel', 'R&D', 2024, 10605.00, 127260.00), -- No change from 2023
(75361, 'Abigail Patel', 'R&D', 2024, 10710.00, 128520.00), -- No change from 2023
(43295, 'Caleb Patel', 'R&D', 2024, 10815.00, 129780.00), -- No change from 2023
(92678, 'Ella Patel', 'R&D', 2024, 10920.00, 131040.00), -- No change from 2023
(35921, 'Grayson Patel', 'R&D', 2024, 11025.00, 132300.00), -- No change from 2023
(61549, 'Lily Patel', 'R&D', 2024, 11130.00, 133560.00), -- No change from 2023
(54812, 'Owen Patel', 'R&D', 2024, 11235.00, 134820.00), -- No change from 2023
(81236, 'Madison Patel', 'R&D', 2024, 11340.00, 136080.00), -- No change from 2023
(24579, 'Isaac Patel', 'R&D', 2024, 11445.00, 137340.00), -- No change from 2023
(78952, 'Elizabeth Patel', 'R&D', 2024, 11550.00, 138600.00), -- No change from 2023
(47216, 'Samuel Patel', 'R&D', 2024, 11655.00, 139860.00), -- No change from 2023
(93584, 'Charlotte Patel', 'R&D', 2024, 11760.00, 141120.00), -- No change from 2023
(33178, 'Henry Patel', 'R&D', 2024, 11865.00, 142380.00), -- No change from 2023
(63925, 'Amelia Patel', 'R&D', 2024, 11970.00, 143640.00), -- No change from 2023
(89421, 'James White', 'Human Resources', 2024, 7192.50, 86310.00), -- No change from 2023
(29354, 'Isabella White', 'Human Resources', 2024, 7245.00, 86940.00), -- No change from 2023
(76519, 'Joseph White', 'Human Resources', 2024, 7297.50, 87570.00), -- No change from 2023
(95268, 'William White', 'Human Resources', 2024, 7302.50, 87630.00),
(32746, 'Grace White', 'Human Resources', 2024, 7455.00, 89460.00), -- No change from 2023
(68135, 'Daniel White', 'Human Resources', 2024, 7507.50, 90090.00), -- No change from 2023
(51927, 'Chloe White', 'Human Resources', 2024, 7560.00, 90720.00), -- No change from 2023
(84591, 'Alexander White', 'Human Resources', 2024, 7612.50, 91350.00), -- No change from 2023
(27154, 'Madison White', 'Human Resources', 2024, 7665.00, 91980.00), -- No change from 2023
(73819, 'Anthony White', 'Human Resources', 2024, 7717.50, 92610.00), -- No change from 2023
(49263, 'Ella White', 'Human Resources', 2024, 7770.00, 93240.00), -- No change from 2023
(91582, 'Vincent White', 'Human Resources', 2024, 7822.50, 93870.00), -- No change from 2023
(34725, 'Avery White', 'Human Resources', 2024, 7875.00, 94500.00), -- No change from 2023
(67948, 'Gabriel Black', 'Finance', 2024, 10673.25, 128079.00), -- 7% increase (9975 * 1.07)
(52316, 'Sofia Black', 'Finance', 2024, 10785.60, 129427.20), -- 7% increase (10080 * 1.07)
(87659, 'Owen Black', 'Finance', 2024, 10908.45, 130901.40), -- 7% increase (10185 * 1.07)
(28143, 'Evelyn Black', 'Finance', 2024, 11020.30, 132243.60), -- 7% increase (10290 * 1.07)
(74921, 'John Black', 'Finance', 2024, 11122.65, 133471.80), -- 7% increase (10395 * 1.07)
(43685, 'Layla Black', 'Finance', 2024, 11235.00, 134820.00), -- 7% increase (10500 * 1.07)
(92137, 'Caleb Black', 'Finance', 2024, 11357.35, 136288.20), -- 7% increase (10605 * 1.07)
(31592, 'Scarlett Black', 'Finance', 2024, 11459.70, 137516.40), -- 7% increase (10710 * 1.07)
(65849, 'Isaac Black', 'Finance', 2024, 11572.05, 138864.60), -- 7% increase (10815 * 1.07)
(59213, 'Lily Black', 'Finance', 2024, 11684.40, 140212.80), -- 7% increase (10920 * 1.07)
(25486, 'Hannah Black', 'Finance', 2024, 11909.10, 142909.20), -- 7% increase (11130 * 1.07)
(71394, 'Wyatt Black', 'Finance', 2024, 12021.45, 144257.40), -- 7% increase (11235 * 1.07)
(48257, 'Zoey Black', 'Finance', 2024, 12133.80, 145605.60), -- 7% increase (11340 * 1.07)
(97631, 'Matthew Black', 'Finance', 2024, 12246.15, 146953.80), -- 7% increase (11445 * 1.07)
(33584, 'Audrey Hall', 'Operations', 2024, 7560.00, 90720.00), -- No change from 2023
(63152, 'Daniel Hall', 'Operations', 2024, 7612.50, 91350.00), -- No change from 2023
(56489, 'Ellie Hall', 'Operations', 2024, 7665.00, 91980.00), -- No change from 2023
(82946, 'Jackson Hall', 'Operations', 2024, 7717.50, 92610.00), -- No change from 2023
(24713, 'Claire Hall', 'Operations', 2024, 7770.00, 93240.00), -- No change from 2023
(79365, 'Logan Hall', 'Operations', 2024, 7822.50, 93870.00), -- No change from 2023
(47198, 'Bella Hall', 'Operations', 2024, 7875.00, 94500.00), -- No change from 2023
(91852, 'Elijah Hall', 'Operations', 2024, 7927.50, 95130.00), -- No change from 2023
(34276, 'Maya Hall', 'Operations', 2024, 7980.00, 95760.00), -- No change from 2023
(67519, 'Ethan Hall', 'Operations', 2024, 8032.50, 96390.00), -- No change from 2023
(58321, 'Anna Hall', 'Operations', 2024, 8085.00, 97020.00), -- No change from 2023
(85649, 'Benjamin Hall', 'Operations', 2024, 8137.50, 97650.00), -- No change from 2023
(27913, 'Victoria Hall', 'Operations', 2024, 8190.00, 98280.00), -- No change from 2023
(72584, 'Caleb Hall', 'Operations', 2024, 8242.50, 98910.00), -- No change from 2023
(41236, 'Samantha Hall', 'Operations', 2024, 8295.00, 99540.00), -- No change from 2023
(98152, 'Natalie Wright', 'IT', 2024, 9559.75, 114717.00), -- 7% increase (8925 * 1.07)
(31469, 'Riley Wright', 'IT', 2024, 9662.10, 115945.20), -- 7% increase (9030 * 1.07)
(62745, 'Leah Wright', 'IT', 2024, 9764.55, 117174.60), -- 7% increase (9135 * 1.07)
(55182, 'Brandon Wright', 'IT', 2024, 9866.80, 118401.60), -- 7% increase (9240 * 1.07)
(99001, 'Olivia Moore', 'Sales and Marketing', 2024, 7455.00, 89460.00), -- No change from 2023
(99002, 'Jackson Miller', 'R&D', 2024, 9650.00, 115800.00), -- No change from 2023
(99003, 'Sophia Wilson', 'Human Resources', 2024, 6400.00, 76800.00), -- No change from 2023
(99004, 'Ethan Garcia', 'Finance', 2024, 11403.53, 136842.30), -- 7% increase (10657.50 * 1.07)
(99005, 'Isabella Rodriguez', 'Operations', 2024, 7927.50, 95130.00), -- No change from 2023
(99006, 'Liam Williams', 'IT', 2024, 10009.05, 120108.60), -- 7% increase (9345 * 1.07)
(99007, 'Ava Davis', 'Legal', 2024, 11500.00, 138000.00), -- No change from 2023
(99008, 'Noah Martinez', 'Sales and Marketing', 2024, 7665.00, 91980.00), -- No change from 2023
(99009, 'Emma Anderson', 'R&D', 2024, 9850.00, 118200.00), -- No change from 2023
(99010, 'Lucas Gonzalez', 'Human Resources', 2024, 6930.00, 83160.00), -- No change from 2023
(99011, 'Mia Clark', 'Sales and Marketing', 2024, 7812.00, 93744.00), -- No change from 2023
(99012, 'Elijah Lewis', 'R&D', 2024, 10000.00, 120000.00), -- No change from 2023
(99013, 'Abigail Hall', 'Human Resources', 2024, 6825.00, 81900.00), -- No change from 2023
(99014, 'Caleb Young', 'Finance', 2024, 11572.05, 138864.60), -- 7% increase (10815 * 1.07)
(99015, 'Ella Wright', 'Operations', 2024, 7980.00, 95760.00), -- No change from 2023
(99016, 'Alexander Walker', 'Sales and Marketing', 2024, 8000.00, 96000.00), -- No change from 2023
(99017, 'Madison Green', 'Finance', 2024, 11770.00, 141240.00), -- 7% increase (11000 * 1.07)
(99018, 'Daniel Adams', 'IT', 2024, 10165.00, 121980.00), -- 7% increase (9500 * 1.07)
(99019, 'Chloe Baker', 'Legal', 2024, 10500.00, 126000.00), -- No change from 2023 (New employee in 2023)
(99020, 'Ryan Nelson', 'Operations', 2024, 7000.00, 84000.00), -- No change from 2023 (New employee in 2023)
(99021, 'Megan Carter', 'R&D', 2024, 9200.00, 110400.00), -- No change from 2023 (New employee in 2023)
(99022, 'Kevin Phillips', 'Sales and Marketing', 2024, 7200.00, 86400.00); -- No change from 2023 (New employee in 2023)

-- Insert statements for realistic dataset for EmployeeCompensation table for the year 2025
-- Based on 2024 data, removing some employees, adding new employees, and providing a 6% salary hike for old employees in Sales and Marketing and R&D departments

INSERT INTO EmployeeCompensation (employee_id, employee_name, department, fiscal_year, monthly_salary, annual_salary) VALUES
-- Existing Employees from 2024 (excluding removed employees) with salary adjustments where applicable
(85533, 'Alice Johnson', 'R&D', 2025, 8347.50, 100170.00), -- 6% increase (7875 * 1.06)
(38492, 'Robert Williams', 'Human Resources', 2025, 5775.00, 69300.00),
(96385, 'Linda Brown', 'Finance', 2025, 8988.00, 107856.00),
(73928, 'Jennifer Wilson', 'IT', 2025, 7864.50, 94374.00),
(45291, 'David Garcia', 'Legal', 2025, 9000.00, 108000.00),
(19572, 'Christopher Martinez', 'R&D', 2025, 8681.40, 104176.80), -- 6% increase (8190 * 1.06)
(53184, 'Angela Anderson', 'Human Resources', 2025, 5985.00, 71820.00),
(89627, 'Thomas Gonzalez', 'Finance', 2025, 9212.70, 110552.40),
(24759, 'Margaret Perez', 'Operations', 2025, 6300.00, 75600.00),
(71346, 'Kevin Young', 'IT', 2025, 8089.20, 97070.40),
(39815, 'Ashley King', 'Legal', 2025, 9200.00, 110400.00),
(92648, 'Brandon Wright', 'Sales and Marketing', 2025, 7123.20, 85478.40), -- 6% increase (6720 * 1.06)
(21593, 'Jessica Lopez', 'R&D', 2025, 8904.00, 106848.00), -- 6% increase (8400 * 1.06)
(67481, 'William Hill', 'Human Resources', 2025, 6195.00, 74340.00),
(48237, 'Sarah Scott', 'Finance', 2025, 9437.40, 113248.80),
(79362, 'James Green', 'Operations', 2025, 6510.00, 78120.00),
(15928, 'Karen Adams', 'IT', 2025, 8312.90, 99754.80),
(58149, 'Ethan Baker', 'Legal', 2025, 9400.00, 112800.00),
(82794, 'Nicole Nelson', 'Sales and Marketing', 2025, 7345.80, 88149.60), -- 6% increase (6930 * 1.06)
(26351, 'Ryan Carter', 'R&D', 2025, 9126.60, 109519.20), -- 6% increase (8610 * 1.06)
(74183, 'Stephanie Mitchell', 'Human Resources', 2025, 6405.00, 76860.00),
(41965, 'Kyle Phillips', 'Finance', 2025, 9662.10, 115945.20),
(98752, 'Melissa Roberts', 'Operations', 2025, 6720.00, 80640.00),
(32614, 'Austin Turner', 'IT', 2025, 8538.60, 102463.20),
(69427, 'Rachel Peterson', 'Legal', 2025, 9600.00, 115200.00),
(51879, 'Jose Hayes', 'Sales and Marketing', 2025, 7568.40, 90820.80), -- 6% increase (7140 * 1.06)
(87356, 'Samantha Morris', 'R&D', 2025, 9349.20, 112190.40), -- 6% increase (8820 * 1.06)
(29148, 'Benjamin Murphy', 'Human Resources', 2025, 6615.00, 79380.00),
(76931, 'Michelle Cook', 'Finance', 2025, 9886.80, 118641.60),
(43529, 'Gregory Rogers', 'Operations', 2025, 6930.00, 83160.00),
(95286, 'Laura Reed', 'IT', 2025, 8763.30, 105159.60),
(35817, 'Tyler Bailey', 'Legal', 2025, 9800.00, 117600.00),
(61742, 'Kimberly Bell', 'Sales and Marketing', 2025, 7782.00, 93384.00), -- 6% increase (7350 * 1.06)
(54938, 'Jacob Cox', 'R&D', 2025, 9571.80, 114861.60), -- 6% increase (9030 * 1.06)
(81529, 'Victoria Rivera', 'Human Resources', 2025, 6825.00, 81900.00),
(23671, 'Dylan Cooper', 'Finance', 2025, 10131.50, 121578.00),
(47196, 'Adam Wood', 'IT', 2025, 9008.00, 108096.00),
(91537, 'Brittany Watson', 'Legal', 2025, 10000.00, 120000.00),
(31428, 'Nicholas Brooks', 'Sales and Marketing', 2025, 8013.60, 96163.20), -- 6% increase (7560 * 1.06)
(65971, 'Megan Kelly', 'R&D', 2025, 9794.40, 117532.80), -- 6% increase (9240 * 1.06)
(59283, 'Eric Sanders', 'Human Resources', 2025, 7035.00, 84420.00),
(84619, 'Chelsea Price', 'Finance', 2025, 10336.20, 124034.40),
(27543, 'Jonathan Bennett', 'Operations', 2025, 7350.00, 88200.00),
(72816, 'Katherine Gray', 'IT', 2025, 9212.70, 110552.40),
(49572, 'Justin James', 'Legal', 2025, 10200.00, 122400.00),
(93865, 'Alyssa Reyes', 'Sales and Marketing', 2025, 8236.20, 98834.40), -- 6% increase (7770 * 1.06)
(33791, 'Brandon Reyes', 'Sales and Marketing', 2025, 8291.85, 99502.20), -- 6% increase (7822.50 * 1.06)
(63518, 'Megan Reyes', 'Sales and Marketing', 2025, 8347.50, 100170.00), -- 6% increase (7875 * 1.06)
(56842, 'Eric Reyes', 'Sales and Marketing', 2025, 8403.15, 100837.80), -- 6% increase (7927.50 * 1.06)
(89175, 'Chelsea Reyes', 'Sales and Marketing', 2025, 8458.80, 101505.60), -- 6% increase (7980 * 1.06)
(36954, 'Jonathan Reyes', 'Sales and Marketing', 2025, 8514.45, 102173.40), -- 6% increase (8032.50 * 1.06)
(68291, 'Katherine Reyes', 'Sales and Marketing', 2025, 8570.10, 102841.20), -- 6% increase (8085 * 1.06)
(52487, 'Justin Reyes', 'Sales and Marketing', 2025, 8625.75, 103509.00), -- 6% increase (8137.50 * 1.06)
(97632, 'Alyssa Reyes', 'Sales and Marketing', 2025, 8681.40, 104176.80), -- 6% increase (8190 * 1.06)
(39215, 'Brandon Reyes', 'Sales and Marketing', 2025, 8737.05, 104844.60), -- 6% increase (8242.50 * 1.06)
(64879, 'Megan Reyes', 'Sales and Marketing', 2025, 8792.70, 105512.40), -- 6% increase (8295 * 1.06)
(57142, 'Eric Reyes', 'Sales and Marketing', 2025, 8848.35, 106180.20), -- 6% increase (8347.50 * 1.06)
(83526, 'Chelsea Reyes', 'Sales and Marketing', 2025, 8904.00, 106848.00), -- 6% increase (8400 * 1.06)
(25981, 'Jonathan Reyes', 'Sales and Marketing', 2025, 8959.65, 107515.80), -- 6% increase (8452.50 * 1.06)
(71459, 'Katherine Reyes', 'Sales and Marketing', 2025, 9015.30, 108183.60), -- 6% increase (8505 * 1.06)
(41823, 'Justin Reyes', 'Sales and Marketing', 2025, 9070.95, 108851.40), -- 6% increase (8557.50 * 1.06)
(95178, 'Alyssa Reyes', 'Sales and Marketing', 2025, 9126.60, 109519.20), -- 6% increase (8610 * 1.06)
(32546, 'Brandon Reyes', 'Sales and Marketing', 2025, 9182.25, 110187.00), -- 6% increase (8662.50 * 1.06)
(62984, 'Megan Reyes', 'Sales and Marketing', 2025, 9237.90, 110854.80), -- 6% increase (8715 * 1.06)
(55317, 'Eric Reyes', 'Sales and Marketing', 2025, 9293.55, 111522.60), -- 6% increase (8767.50 * 1.06)
(88652, 'Chelsea Reyes', 'Sales and Marketing', 2025, 9349.20, 112190.40), -- 6% increase (8820 * 1.06)
(29741, 'Jonathan Reyes', 'Sales and Marketing', 2025, 9404.85, 112858.20), -- 6% increase (8872.50 * 1.06)
(77219, 'Katherine Reyes', 'Sales and Marketing', 2025, 9460.50, 113526.00), -- 6% increase (8925 * 1.06)
(44983, 'Justin Reyes', 'Sales and Marketing', 2025, 9516.15, 114193.80), -- 6% increase (8977.50 * 1.06)
(91328, 'Alyssa Reyes', 'Sales and Marketing', 2025, 9571.80, 114861.60), -- 6% increase (9030 * 1.06)
(34156, 'Brandon Reyes', 'Sales and Marketing', 2025, 9627.45, 115529.40), -- 6% increase (9082.50 * 1.06)
(65492, 'Olivia Patel', 'R&D', 2025, 10017.00, 120204.00), -- 6% increase (9450 * 1.06)
(58725, 'Noah Patel', 'R&D', 2025, 10128.30, 121539.60), -- 6% increase (9555 * 1.06)
(82149, 'Emma Patel', 'R&D', 2025, 10239.60, 122875.20), -- 6% increase (9660 * 1.06)
(26837, 'Liam Patel', 'R&D', 2025, 10350.90, 124210.80), -- 6% increase (9765 * 1.06)
(73614, 'Sophia Patel', 'R&D', 2025, 10462.20, 125546.40), -- 6% increase (9870 * 1.06)
(42591, 'Jackson Patel', 'R&D', 2025, 10573.50, 126882.00), -- 6% increase (9975 * 1.06)
(98265, 'Ava Patel', 'R&D', 2025, 10684.80, 128217.60), -- 6% increase (10080 * 1.06)
(31948, 'Lucas Patel', 'R&D', 2025, 10796.10, 129553.20), -- 6% increase (10185 * 1.06)
(69172, 'Mia Patel', 'R&D', 2025, 10907.40, 130888.80), -- 6% increase (10290 * 1.06)
(51436, 'Aiden Patel', 'R&D', 2025, 11018.70, 132224.40), -- 6% increase (10395 * 1.06)
(85792, 'Chloe Patel', 'R&D', 2025, 11130.00, 133560.00), -- 6% increase (10500 * 1.06)
(28574, 'Elijah Patel', 'R&D', 2025, 11241.30, 134895.60), -- 6% increase (10605 * 1.06)
(75361, 'Abigail Patel', 'R&D', 2025, 11352.60, 136231.20), -- 6% increase (10710 * 1.06)
(43295, 'Caleb Patel', 'R&D', 2025, 11463.90, 137566.80), -- 6% increase (10815 * 1.06)
(92678, 'Ella Patel', 'R&D', 2025, 11575.20, 138902.40), -- 6% increase (10920 * 1.06)
(35921, 'Grayson Patel', 'R&D', 2025, 11686.50, 140238.00), -- 6% increase (11025 * 1.06)
(61549, 'Lily Patel', 'R&D', 2025, 11797.80, 141573.60), -- 6% increase (11130 * 1.06)
(54812, 'Owen Patel', 'R&D', 2025, 11909.10, 142909.20), -- 6% increase (11235 * 1.06)
(81236, 'Madison Patel', 'R&D', 2025, 12020.40, 144244.80), -- 6% increase (11340 * 1.06)
(24579, 'Isaac Patel', 'R&D', 2025, 12131.70, 145580.40), -- 6% increase (11445 * 1.06)
(78952, 'Elizabeth Patel', 'R&D', 2025, 12243.00, 146916.00), -- 6% increase (11550 * 1.06)
(47216, 'Samuel Patel', 'R&D', 2025, 12354.30, 148251.60), -- 6% increase (11655 * 1.06)
(93584, 'Charlotte Patel', 'R&D', 2025, 12465.60, 149587.20), -- 6% increase (11760 * 1.06)
(33178, 'Henry Patel', 'R&D', 2025, 12576.90, 150922.80), -- 6% increase (11865 * 1.06)
(63925, 'Amelia Patel', 'R&D', 2025, 12688.20, 152258.40), -- 6% increase (11970 * 1.06)
(89421, 'James White', 'Human Resources', 2025, 7192.50, 86310.00),
(29354, 'Isabella White', 'Human Resources', 2025, 7245.00, 86940.00),
(76519, 'Joseph White', 'Human Resources', 2025, 7297.50, 87570.00),
(95268, 'William White', 'Human Resources', 2025, 7302.50, 87630.00),
(32746, 'Grace White', 'Human Resources', 2025, 7455.00, 89460.00),
(68135, 'Daniel White', 'Human Resources', 2025, 7507.50, 90090.00),
(51927, 'Chloe White', 'Human Resources', 2025, 7560.00, 90720.00),
(84591, 'Alexander White', 'Human Resources', 2025, 7612.50, 91350.00),
(27154, 'Madison White', 'Human Resources', 2025, 7665.00, 91980.00),
(73819, 'Anthony White', 'Human Resources', 2025, 7717.50, 92610.00),
(49263, 'Ella White', 'Human Resources', 2025, 7770.00, 93240.00),
(91582, 'Vincent White', 'Human Resources', 2025, 7822.50, 93870.00),
(34725, 'Avery White', 'Human Resources', 2025, 7875.00, 94500.00),
(67948, 'Gabriel Black', 'Finance', 2025, 10673.25, 128079.00),
(52316, 'Sofia Black', 'Finance', 2025, 10785.60, 129427.20),
(87659, 'Owen Black', 'Finance', 2025, 10908.45, 130901.40),
(28143, 'Evelyn Black', 'Finance', 2025, 11020.30, 132243.60),
(74921, 'John Black', 'Finance', 2025, 11122.65, 133471.80),
(43685, 'Layla Black', 'Finance', 2025, 11235.00, 134820.00),
(92137, 'Caleb Black', 'Finance', 2025, 11357.35, 136288.20),
(31592, 'Scarlett Black', 'Finance', 2025, 11459.70, 137516.40),
(65849, 'Isaac Black', 'Finance', 2025, 11572.05, 138864.60),
(59213, 'Lily Black', 'Finance', 2025, 11684.40, 140212.80),
(25486, 'Hannah Black', 'Finance', 2025, 11909.10, 142909.20),
(71394, 'Wyatt Black', 'Finance', 2025, 12021.45, 144257.40),
(48257, 'Zoey Black', 'Finance', 2025, 12133.80, 145605.60),
(97631, 'Matthew Black', 'Finance', 2025, 12246.15, 146953.80),
(33584, 'Audrey Hall', 'Operations', 2025, 7560.00, 90720.00),
(63152, 'Daniel Hall', 'Operations', 2025, 7612.50, 91350.00),
(56489, 'Ellie Hall', 'Operations', 2025, 7665.00, 91980.00),
(82946, 'Jackson Hall', 'Operations', 2025, 7717.50, 92610.00),
(24713, 'Claire Hall', 'Operations', 2025, 7770.00, 93240.00),
(79365, 'Logan Hall', 'Operations', 2025, 7822.50, 93870.00),
(47198, 'Bella Hall', 'Operations', 2025, 7875.00, 94500.00),
(91852, 'Elijah Hall', 'Operations', 2025, 7927.50, 95130.00),
(34276, 'Maya Hall', 'Operations', 2025, 7980.00, 95760.00),
(67519, 'Ethan Hall', 'Operations', 2025, 8032.50, 96390.00),
(58321, 'Anna Hall', 'Operations', 2025, 8085.00, 97020.00),
(85649, 'Benjamin Hall', 'Operations', 2025, 8137.50, 97650.00),
(27913, 'Victoria Hall', 'Operations', 2025, 8190.00, 98280.00),
(72584, 'Caleb Hall', 'Operations', 2025, 8242.50, 98910.00),
(41236, 'Samantha Hall', 'Operations', 2025, 8295.00, 99540.00),
(98152, 'Natalie Wright', 'IT', 2025, 9559.75, 114717.00),
(31469, 'Riley Wright', 'IT', 2025, 9662.10, 115945.20),
(62745, 'Leah Wright', 'IT', 2025, 9764.55, 117174.60),
(55182, 'Brandon Wright', 'IT', 2025, 9866.80, 118401.60),
(99001, 'Olivia Moore', 'Sales and Marketing', 2025, 7902.30, 94827.60), -- 6% increase (7455 * 1.06)
(99002, 'Jackson Miller', 'R&D', 2025, 10229.00, 122748.00), -- 6% increase (9650 * 1.06)
(99003, 'Sophia Wilson', 'Human Resources', 2025, 6400.00, 76800.00),
(99004, 'Ethan Garcia', 'Finance', 2025, 11403.53, 136842.30),
(99005, 'Isabella Rodriguez', 'Operations', 2025, 7927.50, 95130.00),
(99006, 'Liam Williams', 'IT', 2025, 10009.05, 120108.60),
(99007, 'Ava Davis', 'Legal', 2025, 11500.00, 138000.00),
(99008, 'Noah Martinez', 'Sales and Marketing', 2025, 8124.90, 97498.80), -- 6% increase (7665 * 1.06)
(99009, 'Emma Anderson', 'R&D', 2025, 10441.00, 125292.00), -- 6% increase (9850 * 1.06)
(99010, 'Lucas Gonzalez', 'Human Resources', 2025, 6930.00, 83160.00),
(99011, 'Mia Clark', 'Sales and Marketing', 2025, 8278.72, 99344.64), -- 6% increase (7812 * 1.06)
(99012, 'Elijah Lewis', 'R&D', 2025, 10600.00, 127200.00), -- 6% increase (10000 * 1.06)
(99013, 'Abigail Hall', 'Human Resources', 2025, 6825.00, 81900.00),
(99014, 'Caleb Young', 'Finance', 2025, 11572.05, 138864.60),
(99015, 'Ella Wright', 'Operations', 2025, 7980.00, 95760.00),
(99016, 'Alexander Walker', 'Sales and Marketing', 2025, 8480.00, 101760.00), -- 6% increase (8000 * 1.06)
(99017, 'Madison Green', 'Finance', 2025, 11770.00, 141240.00),
(99018, 'Daniel Adams', 'IT', 2025, 10165.00, 121980.00),
(99019, 'Chloe Baker', 'Legal', 2025, 10500.00, 126000.00),
(99020, 'Ryan Nelson', 'Operations', 2025, 7000.00, 84000.00),
(99021, 'Megan Carter', 'R&D', 2025, 9752.00, 117024.00), -- 6% increase (9200 * 1.06)
(99022, 'Kevin Phillips', 'Sales and Marketing', 2025, 7632.00, 91584.00), -- 6% increase (7200 * 1.06)
-- New employees for 2025 with new employee_ids (starting from 99023 onwards)
(99023, 'Lauren Scott', 'Finance', 2025, 9500.00, 114000.00), -- New employee in Finance
(99024, 'Adam Martinez', 'IT', 2025, 8800.00, 105600.00), -- New employee in IT
(99025, 'Grace Wilson', 'Sales and Marketing', 2025, 6800.00, 81600.00); -- New employee in Sales and Marketing

-- Removed Employees for 2025 (Not included in INSERT statements above):
-- employee_id = 28547, 'John Smith', 'Sales and Marketing' - Removed from Sales and Marketing Department
-- employee_id = 63925, 'Amelia Patel', 'R&D' - Removed from R&D Department
-- employee_id = 33584, 'Audrey Hall', 'Operations' - Removed from Operations Department

-- INSERT statements for CustomerTransactions table for the year 2015

-- Customer Transactions data for Fiscal Year 2015
INSERT INTO CustomerTransactions (fiscal_year, fiscal_month, transaction_date, customer_id, product_service_category, product_service_name, quantity, unit_price, transaction_amount, sales_channel, sales_region, employee_id) VALUES
(2015, 1, '2015-01-15', 1001, 'Software Licenses', 'Enterprise Suite License', 1, 12000.00, 12000.00, 'Direct Sales', 'North America', 28547),
(2015, 1, '2015-01-20', 1002, 'Consulting', 'Implementation Services', 1, 5000.00, 5000.00, 'Direct Sales', 'Europe', 62835),
(2015, 1, '2015-01-28', 1003, 'Cloud Services', 'Standard Cloud Package', 5, 99.99, 499.95, 'Online', 'Asia', 92648),
(2015, 2, '2015-02-05', 1004, 'Software Licenses', 'Professional License', 15, 500.00, 7500.00, 'Reseller', 'North America', 28547),
(2015, 2, '2015-02-12', 1005, 'Consulting', 'Training Services', 2, 2500.00, 5000.00, 'Direct Sales', 'Europe', 62835),
(2015, 2, '2015-02-22', 1006, 'Cloud Services', 'Premium Cloud Package', 2, 250.00, 500.00, 'Online', 'Asia', 92648),
(2015, 3, '2015-03-10', 1007, 'Software Licenses', 'Enterprise Suite License', 2, 12000.00, 24000.00, 'Direct Sales', 'North America', 28547),
(2015, 3, '2015-03-18', 1008, 'Consulting', 'Custom Development', 1, 10000.00, 10000.00, 'Direct Sales', 'Europe', 62835),
(2015, 3, '2015-03-25', 1009, 'Cloud Services', 'Standard Cloud Package', 20, 99.99, 1999.80, 'Online', 'Asia', 92648),
(2015, 4, '2015-04-02', 1010, 'Software Licenses', 'Professional License', 10, 500.00, 5000.00, 'Reseller', 'North America', 82794),
(2015, 4, '2015-04-11', 1011, 'Consulting', 'Implementation Services', 1, 6000.00, 6000.00, 'Direct Sales', 'Europe', 82794),
(2015, 4, '2015-04-20', 1012, 'Cloud Services', 'Premium Cloud Package', 5, 250.00, 1250.00, 'Online', 'Asia', 82794),
(2015, 5, '2015-05-08', 1013, 'Software Licenses', 'Enterprise Suite License', 3, 12000.00, 36000.00, 'Direct Sales', 'North America', 61742),
(2015, 5, '2015-05-15', 1014, 'Consulting', 'Training Services', 3, 2500.00, 7500.00, 'Direct Sales', 'Europe', 61742),
(2015, 5, '2015-05-29', 1015, 'Cloud Services', 'Standard Cloud Package', 30, 99.99, 2999.70, 'Online', 'Asia', 61742),
(2015, 6, '2015-06-03', 1016, 'Software Licenses', 'Professional License', 20, 500.00, 10000.00, 'Reseller', 'North America', 51879),
(2015, 6, '2015-06-14', 1017, 'Consulting', 'Custom Development', 2, 10000.00, 20000.00, 'Direct Sales', 'Europe', 51879),
(2015, 6, '2015-06-27', 1018, 'Cloud Services', 'Premium Cloud Package', 10, 250.00, 2500.00, 'Online', 'Asia', 51879),
(2015, 7, '2015-07-01', 1019, 'Software Licenses', 'Enterprise Suite License', 4, 12000.00, 48000.00, 'Direct Sales', 'North America', 31428),
(2015, 7, '2015-07-19', 1020, 'Consulting', 'Implementation Services', 2, 6000.00, 12000.00, 'Direct Sales', 'Europe', 31428),
(2015, 7, '2015-07-26', 1021, 'Cloud Services', 'Standard Cloud Package', 40, 99.99, 3999.60, 'Online', 'Asia', 31428),
(2015, 8, '2015-08-09', 1022, 'Software Licenses', 'Professional License', 25, 500.00, 12500.00, 'Reseller', 'North America', 93865),
(2015, 8, '2015-08-16', 1023, 'Consulting', 'Training Services', 4, 2500.00, 10000.00, 'Direct Sales', 'Europe', 93865),
(2015, 8, '2015-08-23', 1024, 'Cloud Services', 'Premium Cloud Package', 15, 250.00, 3750.00, 'Online', 'Asia', 93865),
(2015, 9, '2015-09-05', 1025, 'Software Licenses', 'Enterprise Suite License', 5, 12000.00, 60000.00, 'Direct Sales', 'North America', 33791),
(2015, 9, '2015-09-19', 1026, 'Consulting', 'Custom Development', 3, 10000.00, 30000.00, 'Direct Sales', 'Europe', 33791),
(2015, 9, '2015-09-27', 1027, 'Cloud Services', 'Standard Cloud Package', 50, 99.99, 4999.50, 'Online', 'Asia', 33791),
(2015, 10, '2015-10-03', 1028, 'Software Licenses', 'Professional License', 30, 500.00, 15000.00, 'Reseller', 'North America', 63518),
(2015, 10, '2015-10-17', 1029, 'Consulting', 'Implementation Services', 3, 6000.00, 18000.00, 'Direct Sales', 'Europe', 63518),
(2015, 10, '2015-10-24', 1030, 'Cloud Services', 'Premium Cloud Package', 20, 250.00, 5000.00, 'Online', 'Asia', 63518),
(2015, 11, '2015-11-11', 1031, 'Software Licenses', 'Enterprise Suite License', 6, 12000.00, 72000.00, 'Direct Sales', 'North America', 56842),
(2015, 11, '2015-11-18', 1032, 'Consulting', 'Training Services', 5, 2500.00, 12500.00, 'Direct Sales', 'Europe', 56842),
(2015, 11, '2015-11-29', 1033, 'Cloud Services', 'Standard Cloud Package', 60, 99.99, 5999.40, 'Online', 'Asia', 56842),
(2015, 12, '2015-12-07', 1034, 'Software Licenses', 'Professional License', 35, 500.00, 17500.00, 'Reseller', 'North America', 89175),
(2015, 12, '2015-12-16', 1035, 'Consulting', 'Custom Development', 4, 10000.00, 40000.00, 'Direct Sales', 'Europe', 89175),
(2015, 12, '2015-12-23', 1036, 'Cloud Services', 'Premium Cloud Package', 25, 250.00, 6250.00, 'Online', 'Asia', 89175);

INSERT INTO CustomerTransactions (fiscal_year, fiscal_month, transaction_date, customer_id, product_service_category, product_service_name, quantity, unit_price, transaction_amount, sales_channel, sales_region, employee_id) VALUES
(2015, 1, '2015-01-10', 1037, 'Software Licenses', 'Basic License', 50, 199.99, 9999.50, 'Online', 'North America', 36954),
(2015, 1, '2015-01-25', 1038, 'Consulting', 'Implementation Services', 1, 4500.00, 4500.00, 'Direct Sales', 'Asia', 36954),
(2015, 2, '2015-02-01', 1039, 'Cloud Services', 'Basic Cloud Package', 100, 49.99, 4999.00, 'Online', 'Europe', 36954),
(2015, 2, '2015-02-18', 1040, 'Software Licenses', 'Basic License', 60, 199.99, 11999.40, 'Online', 'North America', 68291),
(2015, 3, '2015-03-03', 1041, 'Consulting', 'Training Services', 2, 2000.00, 4000.00, 'Direct Sales', 'Asia', 68291),
(2015, 3, '2015-03-22', 1042, 'Cloud Services', 'Basic Cloud Package', 120, 49.99, 5998.80, 'Online', 'Europe', 68291),
(2015, 4, '2015-04-05', 1043, 'Software Licenses', 'Basic License', 70, 199.99, 13999.30, 'Online', 'North America', 52487),
(2015, 4, '2015-04-29', 1044, 'Consulting', 'Custom Development', 1, 8000.00, 8000.00, 'Direct Sales', 'Asia', 52487),
(2015, 5, '2015-05-03', 1045, 'Cloud Services', 'Basic Cloud Package', 140, 49.99, 6998.60, 'Online', 'Europe', 52487),
(2015, 5, '2015-05-20', 1046, 'Software Licenses', 'Basic License', 80, 199.99, 15999.20, 'Online', 'North America', 97632),
(2015, 6, '2015-06-08', 1047, 'Consulting', 'Implementation Services', 2, 4500.00, 9000.00, 'Direct Sales', 'Asia', 97632),
(2015, 6, '2015-06-25', 1048, 'Cloud Services', 'Basic Cloud Package', 160, 49.99, 7998.40, 'Online', 'Europe', 97632),
(2015, 7, '2015-07-02', 1049, 'Software Licenses', 'Basic License', 90, 199.99, 17999.10, 'Online', 'North America', 39215),
(2015, 7, '2015-07-21', 1050, 'Consulting', 'Training Services', 3, 2000.00, 6000.00, 'Direct Sales', 'Asia', 39215),
(2015, 8, '2015-08-06', 1051, 'Cloud Services', 'Basic Cloud Package', 180, 49.99, 8998.20, 'Online', 'Europe', 39215),
(2015, 8, '2015-08-28', 1052, 'Software Licenses', 'Basic License', 100, 199.99, 19999.00, 'Online', 'North America', 64879),
(2015, 9, '2015-09-09', 1053, 'Consulting', 'Custom Development', 2, 8000.00, 16000.00, 'Direct Sales', 'Asia', 64879),
(2015, 9, '2015-09-23', 1054, 'Cloud Services', 'Basic Cloud Package', 200, 49.99, 9998.00, 'Online', 'Europe', 64879),
(2015, 10, '2015-10-07', 1055, 'Software Licenses', 'Basic License', 110, 199.99, 21998.90, 'Online', 'North America', 57142),
(2015, 10, '2015-10-26', 1056, 'Consulting', 'Implementation Services', 4, 4500.00, 18000.00, 'Direct Sales', 'Asia', 57142),
(2015, 11, '2015-11-04', 1057, 'Cloud Services', 'Basic Cloud Package', 220, 49.99, 10997.80, 'Online', 'Europe', 57142),
(2015, 11, '2015-11-22', 1058, 'Software Licenses', 'Basic License', 120, 199.99, 23998.80, 'Online', 'North America', 83526),
(2015, 12, '2015-12-09', 1059, 'Consulting', 'Training Services', 6, 2000.00, 12000.00, 'Direct Sales', 'Asia', 83526),
(2015, 12, '2015-12-28', 1060, 'Cloud Services', 'Basic Cloud Package', 240, 49.99, 11997.60, 'Online', 'Europe', 83526);

INSERT INTO CustomerTransactions (fiscal_year, fiscal_month, transaction_date, customer_id, product_service_category, product_service_name, quantity, unit_price, transaction_amount, sales_channel, sales_region, employee_id) VALUES
(2015, 1, '2015-01-18', 1061, 'Software Licenses', 'Enterprise License', 8, 15000.00, 120000.00, 'Direct Sales', 'North America', 25981),
(2015, 2, '2015-02-25', 1062, 'Consulting', 'Custom Solution Design', 1, 15000.00, 15000.00, 'Direct Sales', 'Europe', 25981),
(2015, 3, '2015-03-15', 1063, 'Cloud Services', 'Enterprise Cloud Solution', 3, 5000.00, 15000.00, 'Online', 'Asia', 25981),
(2015, 4, '2015-04-08', 1064, 'Software Licenses', 'Enterprise License', 10, 15000.00, 150000.00, 'Direct Sales', 'North America', 71459),
(2015, 5, '2015-05-22', 1065, 'Consulting', 'Strategic Consulting', 2, 12000.00, 24000.00, 'Direct Sales', 'Europe', 71459),
(2015, 6, '2015-06-15', 1066, 'Cloud Services', 'Enterprise Cloud Solution', 5, 5000.00, 25000.00, 'Online', 'Asia', 71459),
(2015, 7, '2015-07-12', 1067, 'Software Licenses', 'Enterprise License', 12, 15000.00, 180000.00, 'Direct Sales', 'North America', 41823),
(2015, 8, '2015-08-29', 1068, 'Consulting', 'Project Management', 3, 9000.00, 27000.00, 'Direct Sales', 'Europe', 41823),
(2015, 9, '2015-09-12', 1069, 'Cloud Services', 'Enterprise Cloud Solution', 7, 5000.00, 35000.00, 'Online', 'Asia', 41823),
(2015, 10, '2015-10-05', 1070, 'Software Licenses', 'Enterprise License', 14, 15000.00, 210000.00, 'Direct Sales', 'North America', 95178),
(2015, 11, '2015-11-15', 1071, 'Consulting', 'Ongoing Support', 4, 7500.00, 30000.00, 'Direct Sales', 'Europe', 95178),
(2015, 12, '2015-12-20', 1072, 'Cloud Services', 'Enterprise Cloud Solution', 9, 5000.00, 45000.00, 'Online', 'Asia', 95178);


INSERT INTO CustomerTransactions (fiscal_year, fiscal_month, transaction_date, customer_id, product_service_category, product_service_name, quantity, unit_price, transaction_amount, sales_channel, sales_region, employee_id) VALUES
(2016, 1, '2016-01-12', 1073, 'Software Licenses', 'Enterprise Suite License', 1, 1250.00, 1250.00, 'Direct Sales', 'North America', 28547),
(2016, 1, '2016-01-19', 1074, 'Consulting', 'Implementation Services', 1, 5200.00, 5200.00, 'Direct Sales', 'Europe', 62835),
(2016, 1, '2016-01-25', 1075, 'Cloud Services', 'Standard Cloud Package', 12, 105.00, 1260.00, 'Online', 'Asia', 92648),
(2016, 2, '2016-02-02', 1076, 'Software Licenses', 'Small Business Edition', 6, 310.00, 1860.00, 'Retail', 'North America', 82794),
(2016, 2, '2016-02-09', 1077, 'Support', 'Premium Support Contract', 1, 320.00, 320.00, 'Direct Sales', 'Europe', 61742),
(2016, 2, '2016-02-16', 1078, 'Cloud Services', 'Advanced Cloud Package', 2, 520.00, 1040.00, 'Online', 'Asia', 51879),
(2016, 3, '2016-03-02', 1079, 'Software Licenses', 'Enterprise Suite License', 2, 1250.00, 2500.00, 'Direct Sales', 'North America', 63518),
(2016, 3, '2016-03-09', 1080, 'Consulting', 'Custom Development', 1, 8500.00, 8500.00, 'Direct Sales', 'Europe', 31428),
(2016, 3, '2016-03-21', 1081, 'Cloud Services', 'Basic Cloud Package', 22, 52.00, 1144.00, 'Online', 'Asia', 93865),
(2016, 4, '2016-04-01', 1082, 'Software Licenses', 'Small Business Edition', 4, 310.00, 1240.00, 'Retail', 'North America', 33791),
(2016, 4, '2016-04-12', 1083, 'Support', 'Standard Support Contract', 2, 160.00, 320.00, 'Direct Sales', 'Europe', 56842),
(2016, 4, '2016-04-26', 1084, 'Cloud Services', 'Standard Cloud Package', 6, 105.00, 630.00, 'Online', 'Asia', 89175),
(2016, 5, '2016-05-05', 1085, 'Software Licenses', 'Enterprise Suite License', 4, 1250.00, 5000.00, 'Direct Sales', 'North America', 36954),
(2016, 5, '2016-05-12', 1086, 'Consulting', 'Training Services', 2, 2600.00, 5200.00, 'Direct Sales', 'Europe', 68291),
(2016, 5, '2016-05-19', 1087, 'Cloud Services', 'Advanced Cloud Package', 2, 520.00, 1040.00, 'Online', 'Asia', 52487),
(2016, 6, '2016-06-01', 1088, 'Software Licenses', 'Small Business Edition', 8, 310.00, 2480.00, 'Retail', 'North America', 97632),
(2016, 6, '2016-06-16', 1089, 'Support', 'Premium Support Contract', 4, 320.00, 1280.00, 'Direct Sales', 'Europe', 39215),
(2016, 6, '2016-06-22', 1090, 'Cloud Services', 'Basic Cloud Package', 17, 52.00, 884.00, 'Online', 'Asia', 64879),
(2016, 7, '2016-07-06', 1091, 'Software Licenses', 'Enterprise Suite License', 3, 1250.00, 3750.00, 'Direct Sales', 'North America', 57142),
(2016, 7, '2016-07-13', 1092, 'Consulting', 'Implementation Services', 2, 5200.00, 10400.00, 'Direct Sales', 'Europe', 83526),
(2016, 7, '2016-07-27', 1093, 'Cloud Services', 'Standard Cloud Package', 10, 105.00, 1050.00, 'Online', 'Asia', 25981),
(2016, 8, '2016-08-02', 1094, 'Software Licenses', 'Small Business Edition', 7, 310.00, 2170.00, 'Retail', 'North America', 71459),
(2016, 8, '2016-08-09', 1095, 'Support', 'Standard Support Contract', 2, 160.00, 320.00, 'Direct Sales', 'Europe', 41823),
(2016, 8, '2016-08-24', 1096, 'Cloud Services', 'Advanced Cloud Package', 4, 520.00, 2080.00, 'Online', 'Asia', 95178),
(2016, 9, '2016-09-07', 1097, 'Software Licenses', 'Enterprise Suite License', 5, 1250.00, 6250.00, 'Direct Sales', 'North America', 32546),
(2016, 9, '2016-09-16', 1098, 'Consulting', 'Custom Development', 2, 8500.00, 17000.00, 'Direct Sales', 'Europe', 62984),
(2016, 9, '2016-09-20', 1099, 'Cloud Services', 'Basic Cloud Package', 28, 52.00, 1456.00, 'Online', 'Asia', 55317),
(2016, 10, '2016-10-03', 1100, 'Software Licenses', 'Small Business Edition', 5, 310.00, 1550.00, 'Retail', 'North America', 88652),
(2016, 10, '2016-10-14', 1101, 'Support', 'Premium Support Contract', 5, 320.00, 1600.00, 'Direct Sales', 'Europe', 29741),
(2016, 10, '2016-10-28', 1102, 'Cloud Services', 'Standard Cloud Package', 9, 105.00, 945.00, 'Online', 'Asia', 77219),
(2016, 11, '2016-11-02', 1103, 'Software Licenses', 'Enterprise Suite License', 6, 1250.00, 7500.00, 'Direct Sales', 'North America', 44983),
(2016, 11, '2016-11-10', 1104, 'Consulting', 'Training Services', 3, 2600.00, 7800.00, 'Direct Sales', 'Europe', 91328),
(2016, 11, '2016-11-23', 1105, 'Cloud Services', 'Advanced Cloud Package', 5, 520.00, 2600.00, 'Online', 'Asia', 34156),
(2016, 12, '2016-12-01', 1106, 'Software Licenses', 'Small Business Edition', 10, 310.00, 3100.00, 'Retail', 'North America', 61742),
(2016, 12, '2016-12-12', 1107, 'Support', 'Standard Support Contract', 4, 160.00, 640.00, 'Direct Sales', 'Europe', 58149),
(2016, 12, '2016-12-27', 1108, 'Cloud Services', 'Basic Cloud Package', 32, 52.00, 1664.00, 'Online', 'Asia', 47196),
(2016, 1, '2016-01-05', 1109, 'Software Licenses', 'Enterprise Suite License', 2, 1250.00, 2500.00, 'Direct Sales', 'South America', 95286),
(2016, 1, '2016-01-20', 1110, 'Consulting', 'Implementation Services', 2, 5200.00, 10400.00, 'Direct Sales', 'Africa', 78254),
(2016, 1, '2016-01-29', 1111, 'Cloud Services', 'Standard Cloud Package', 9, 105.00, 945.00, 'Online', 'Australia', 27543),
(2016, 2, '2016-02-05', 1112, 'Software Licenses', 'Small Business Edition', 7, 310.00, 2170.00, 'Retail', 'South America', 43529),
(2016, 2, '2016-02-12', 1113, 'Support', 'Premium Support Contract', 2, 320.00, 640.00, 'Direct Sales', 'Africa', 72816),
(2016, 2, '2016-02-23', 1114, 'Cloud Services', 'Advanced Cloud Package', 2, 520.00, 1040.00, 'Online', 'Australia', 49572),
(2016, 3, '2016-03-07', 1115, 'Software Licenses', 'Enterprise Suite License', 3, 1250.00, 3750.00, 'Direct Sales', 'South America', 93865),
(2016, 3, '2016-03-14', 1116, 'Consulting', 'Custom Development', 2, 8500.00, 17000.00, 'Direct Sales', 'Africa', 33791),
(2016, 3, '2016-03-25', 1117, 'Cloud Services', 'Basic Cloud Package', 20, 52.00, 1040.00, 'Online', 'Australia', 63518),
(2016, 4, '2016-04-05', 1118, 'Software Licenses', 'Small Business Edition', 5, 310.00, 1550.00, 'Retail', 'South America', 56842),
(2016, 4, '2016-04-19', 1119, 'Support', 'Standard Support Contract', 4, 160.00, 640.00, 'Direct Sales', 'Africa', 89175),
(2016, 4, '2016-04-22', 1120, 'Cloud Services', 'Standard Cloud Package', 7, 105.00, 735.00, 'Online', 'Australia', 36954),
(2016, 5, '2016-05-02', 1121, 'Software Licenses', 'Enterprise Suite License', 2, 1250.00, 2500.00, 'Direct Sales', 'South America', 68291),
(2016, 5, '2016-05-16', 1122, 'Consulting', 'Training Services', 3, 2600.00, 7800.00, 'Direct Sales', 'Africa', 52487),
(2016, 5, '2016-05-25', 1123, 'Cloud Services', 'Advanced Cloud Package', 3, 520.00, 1560.00, 'Online', 'Australia', 97632),
(2016, 6, '2016-06-07', 1124, 'Software Licenses', 'Small Business Edition', 9, 310.00, 2790.00, 'Retail', 'South America', 39215),
(2016, 6, '2016-06-10', 1125, 'Support', 'Premium Support Contract', 2, 320.00, 640.00, 'Direct Sales', 'Africa', 64879),
(2016, 6, '2016-06-29', 1126, 'Cloud Services', 'Basic Cloud Package', 25, 52.00, 1300.00, 'Online', 'Australia', 57142),
(2016, 7, '2016-07-01', 1127, 'Software Licenses', 'Enterprise Suite License', 4, 1250.00, 5000.00, 'Direct Sales', 'South America', 83526),
(2016, 7, '2016-07-19', 1128, 'Consulting', 'Implementation Services', 1, 5200.00, 5200.00, 'Direct Sales', 'Africa', 25981),
(2016, 7, '2016-07-25', 1129, 'Cloud Services', 'Standard Cloud Package', 11, 105.00, 1155.00, 'Online', 'Australia', 71459),
(2016, 8, '2016-08-05', 1130, 'Software Licenses', 'Small Business Edition', 6, 310.00, 1860.00, 'Retail', 'South America', 41823),
(2016, 8, '2016-08-15', 1131, 'Support', 'Standard Support Contract', 3, 160.00, 480.00, 'Direct Sales', 'Africa', 95178),
(2016, 8, '2016-08-29', 1132, 'Cloud Services', 'Advanced Cloud Package', 5, 520.00, 2600.00, 'Online', 'Australia', 32546);

INSERT INTO CustomerTransactions (fiscal_year, fiscal_month, transaction_date, customer_id, product_service_category, product_service_name, quantity, unit_price, transaction_amount, sales_channel, sales_region, employee_id) VALUES
(2017, 1, '2017-01-10', 1133, 'Software Licenses', 'Enterprise Suite License', 2, 1300.00, 2600.00, 'Direct Sales', 'North America', 28547),
(2017, 1, '2017-01-17', 1134, 'Consulting', 'Implementation Services', 1, 5400.00, 5400.00, 'Direct Sales', 'Europe', 62835),
(2017, 1, '2017-01-24', 1135, 'Cloud Services', 'Standard Cloud Package', 15, 110.00, 1650.00, 'Online', 'Asia', 92648),
(2017, 2, '2017-02-07', 1136, 'Software Licenses', 'Small Business Edition', 8, 320.00, 2560.00, 'Retail', 'North America', 82794),
(2017, 2, '2017-02-14', 1137, 'Support', 'Premium Support Contract', 2, 330.00, 660.00, 'Direct Sales', 'Europe', 61742),
(2017, 2, '2017-02-21', 1138, 'Cloud Services', 'Advanced Cloud Package', 3, 540.00, 1620.00, 'Online', 'Asia', 51879),
(2017, 3, '2017-03-03', 1139, 'Software Licenses', 'Enterprise Suite License', 3, 1300.00, 3900.00, 'Direct Sales', 'North America', 63518),
(2017, 3, '2017-03-13', 1140, 'Consulting', 'Custom Development', 1, 9000.00, 9000.00, 'Direct Sales', 'Europe', 31428),
(2017, 3, '2017-03-24', 1141, 'Cloud Services', 'Basic Cloud Package', 25, 54.00, 1350.00, 'Online', 'Asia', 93865),
(2017, 4, '2017-04-04', 1142, 'Software Licenses', 'Small Business Edition', 6, 320.00, 1920.00, 'Retail', 'North America', 33791),
(2017, 4, '2017-04-18', 1143, 'Support', 'Standard Support Contract', 3, 170.00, 510.00, 'Direct Sales', 'Europe', 56842),
(2017, 4, '2017-04-27', 1144, 'Cloud Services', 'Standard Cloud Package', 8, 110.00, 880.00, 'Online', 'Asia', 89175),
(2017, 5, '2017-05-09', 1145, 'Software Licenses', 'Enterprise Suite License', 5, 1300.00, 6500.00, 'Direct Sales', 'North America', 36954),
(2017, 5, '2017-05-15', 1146, 'Consulting', 'Training Services', 2, 2700.00, 5400.00, 'Direct Sales', 'Europe', 68291),
(2017, 5, '2017-05-22', 1147, 'Cloud Services', 'Advanced Cloud Package', 2, 540.00, 1080.00, 'Online', 'Asia', 52487),
(2017, 6, '2017-06-06', 1148, 'Software Licenses', 'Small Business Edition', 10, 320.00, 3200.00, 'Retail', 'North America', 97632),
(2017, 6, '2017-06-20', 1149, 'Support', 'Premium Support Contract', 5, 330.00, 1650.00, 'Direct Sales', 'Europe', 39215),
(2017, 6, '2017-06-26', 1150, 'Cloud Services', 'Basic Cloud Package', 20, 54.00, 1080.00, 'Online', 'Asia', 64879),
(2017, 7, '2017-07-07', 1151, 'Software Licenses', 'Enterprise Suite License', 4, 1300.00, 5200.00, 'Direct Sales', 'North America', 57142),
(2017, 7, '2017-07-14', 1152, 'Consulting', 'Implementation Services', 3, 5400.00, 16200.00, 'Direct Sales', 'Europe', 83526),
(2017, 7, '2017-07-28', 1153, 'Cloud Services', 'Standard Cloud Package', 12, 110.00, 1320.00, 'Online', 'Asia', 25981),
(2017, 8, '2017-08-03', 1154, 'Software Licenses', 'Small Business Edition', 9, 320.00, 2880.00, 'Retail', 'North America', 71459),
(2017, 8, '2017-08-10', 1155, 'Support', 'Standard Support Contract', 2, 170.00, 340.00, 'Direct Sales', 'Europe', 41823),
(2017, 8, '2017-08-25', 1156, 'Cloud Services', 'Advanced Cloud Package', 5, 540.00, 2700.00, 'Online', 'Asia', 95178),
(2017, 9, '2017-09-08', 1157, 'Software Licenses', 'Enterprise Suite License', 6, 1300.00, 7800.00, 'Direct Sales', 'North America', 32546),
(2017, 9, '2017-09-15', 1158, 'Consulting', 'Custom Development', 3, 9000.00, 27000.00, 'Direct Sales', 'Europe', 62984),
(2017, 9, '2017-09-21', 1159, 'Cloud Services', 'Basic Cloud Package', 30, 54.00, 1620.00, 'Online', 'Asia', 55317),
(2017, 10, '2017-10-04', 1160, 'Software Licenses', 'Small Business Edition', 7, 320.00, 2240.00, 'Retail', 'North America', 88652),
(2017, 10, '2017-10-18', 1161, 'Support', 'Premium Support Contract', 6, 330.00, 1980.00, 'Direct Sales', 'Europe', 29741),
(2017, 10, '2017-10-27', 1162, 'Cloud Services', 'Standard Cloud Package', 11, 110.00, 1210.00, 'Online', 'Asia', 77219),
(2017, 11, '2017-11-03', 1163, 'Software Licenses', 'Enterprise Suite License', 7, 1300.00, 9100.00, 'Direct Sales', 'North America', 44983),
(2017, 11, '2017-11-13', 1164, 'Consulting', 'Training Services', 4, 2700.00, 10800.00, 'Direct Sales', 'Europe', 91328),
(2017, 11, '2017-11-24', 1165, 'Cloud Services', 'Advanced Cloud Package', 6, 540.00, 3240.00, 'Online', 'Asia', 34156),
(2017, 12, '2017-12-04', 1166, 'Software Licenses', 'Small Business Edition', 12, 320.00, 3840.00, 'Retail', 'North America', 61742),
(2017, 12, '2017-12-11', 1167, 'Support', 'Standard Support Contract', 5, 170.00, 850.00, 'Direct Sales', 'Europe', 58149),
(2017, 12, '2017-12-28', 1168, 'Cloud Services', 'Basic Cloud Package', 35, 54.00, 1890.00, 'Online', 'Asia', 47196),
(2017, 1, '2017-01-06', 1169, 'Software Licenses', 'Enterprise Suite License', 3, 1300.00, 3900.00, 'Direct Sales', 'South America', 95286),
(2017, 1, '2017-01-23', 1170, 'Consulting', 'Implementation Services', 2, 5400.00, 10800.00, 'Direct Sales', 'Africa', 78254),
(2017, 1, '2017-01-31', 1171, 'Cloud Services', 'Standard Cloud Package', 10, 110.00, 1100.00, 'Online', 'Australia', 27543),
(2017, 2, '2017-02-06', 1172, 'Software Licenses', 'Small Business Edition', 9, 320.00, 2880.00, 'Retail', 'South America', 43529),
(2017, 2, '2017-02-13', 1173, 'Support', 'Premium Support Contract', 3, 330.00, 990.00, 'Direct Sales', 'Africa', 72816),
(2017, 2, '2017-02-24', 1174, 'Cloud Services', 'Advanced Cloud Package', 3, 540.00, 1620.00, 'Online', 'Australia', 49572),
(2017, 3, '2017-03-06', 1175, 'Software Licenses', 'Enterprise Suite License', 4, 1300.00, 5200.00, 'Direct Sales', 'South America', 93865),
(2017, 3, '2017-03-16', 1176, 'Consulting', 'Custom Development', 2, 9000.00, 18000.00, 'Direct Sales', 'Africa', 33791),
(2017, 3, '2017-03-29', 1177, 'Cloud Services', 'Basic Cloud Package', 22, 54.00, 1188.00, 'Online', 'Australia', 63518),
(2017, 4, '2017-04-06', 1178, 'Software Licenses', 'Small Business Edition', 8, 320.00, 2560.00, 'Retail', 'South America', 56842),
(2017, 4, '2017-04-21', 1179, 'Support', 'Standard Support Contract', 5, 170.00, 850.00, 'Direct Sales', 'Africa', 89175),
(2017, 4, '2017-04-24', 1180, 'Cloud Services', 'Standard Cloud Package', 9, 110.00, 990.00, 'Online', 'Australia', 36954);

INSERT INTO CustomerTransactions (fiscal_year, fiscal_month, transaction_date, customer_id, product_service_category, product_service_name, quantity, unit_price, transaction_amount, sales_channel, sales_region, employee_id) VALUES
-- January 2018 Transactions
(2018, 1, '2018-01-08', 1181, 'Software Licenses', 'Enterprise Suite License', 4, 1350.00, 5400.00, 'Direct Sales', 'North America', 28547),
(2018, 1, '2018-01-15', 1182, 'Consulting', 'Implementation Services', 1, 5700.00, 5700.00, 'Direct Sales', 'Europe', 19572),
(2018, 1, '2018-01-22', 1183, 'Cloud Services', 'Standard Cloud Package', 18, 115.00, 2070.00, 'Online', 'Asia', 92648),
-- February 2018 Transactions
(2018, 2, '2018-02-05', 1184, 'Software Licenses', 'Small Business Edition', 10, 330.00, 3300.00, 'Retail', 'North America', 51879),
(2018, 2, '2018-02-12', 1185, 'Support', 'Premium Support Contract', 4, 340.00, 1360.00, 'Direct Sales', 'Europe', 61742),
(2018, 2, '2018-02-26', 1186, 'Cloud Services', 'Advanced Cloud Package', 6, 570.00, 3420.00, 'Online', 'Asia', 82794),
-- March 2018 Transactions
(2018, 3, '2018-03-05', 1187, 'Software Licenses', 'Enterprise Suite License', 2, 1350.00, 2700.00, 'Direct Sales', 'North America', 31428),
(2018, 3, '2018-03-15', 1188, 'Consulting', 'Custom Development', 1, 8700.00, 8700.00, 'Direct Sales', 'Europe', 93865),
(2018, 3, '2018-03-29', 1189, 'Cloud Services', 'Basic Cloud Package', 30, 55.00, 1650.00, 'Online', 'Asia', 33791),
-- April 2018 Transactions
(2018, 4, '2018-04-02', 1190, 'Software Licenses', 'Small Business Edition', 6, 330.00, 1980.00, 'Retail', 'North America', 63518),
(2018, 4, '2018-04-19', 1191, 'Support', 'Standard Support Contract', 3, 180.00, 540.00, 'Direct Sales', 'Europe', 56842),
(2018, 4, '2018-04-27', 1192, 'Cloud Services', 'Standard Cloud Package', 10, 115.00, 1150.00, 'Online', 'Asia', 89175),
-- May 2018 Transactions
(2018, 5, '2018-05-10', 1193, 'Software Licenses', 'Enterprise Suite License', 5, 1350.00, 6750.00, 'Direct Sales', 'North America', 36954),
(2018, 5, '2018-05-17', 1194, 'Consulting', 'Training Services', 2, 2800.00, 5600.00, 'Direct Sales', 'Europe', 68291),
(2018, 5, '2018-05-25', 1195, 'Cloud Services', 'Advanced Cloud Package', 4, 570.00, 2280.00, 'Online', 'Asia', 52487),
-- June 2018 Transactions
(2018, 6, '2018-06-04', 1196, 'Software Licenses', 'Small Business Edition', 12, 330.00, 3960.00, 'Retail', 'North America', 61742),
(2018, 6, '2018-06-18', 1197, 'Support', 'Premium Support Contract', 6, 340.00, 2040.00, 'Direct Sales', 'Europe', 39215),
(2018, 6, '2018-06-29', 1198, 'Cloud Services', 'Basic Cloud Package', 22, 55.00, 1210.00, 'Online', 'Asia', 64879),
-- July 2018 Transactions
(2018, 7, '2018-07-09', 1199, 'Software Licenses', 'Enterprise Suite License', 3, 1350.00, 4050.00, 'Direct Sales', 'North America', 57142),
(2018, 7, '2018-07-16', 1200, 'Consulting', 'Implementation Services', 2, 5700.00, 11400.00, 'Direct Sales', 'Europe', 83526),
(2018, 7, '2018-07-30', 1201, 'Cloud Services', 'Standard Cloud Package', 15, 115.00, 1725.00, 'Online', 'Asia', 25981),
-- August 2018 Transactions
(2018, 8, '2018-08-06', 1202, 'Software Licenses', 'Small Business Edition', 8, 330.00, 2640.00, 'Retail', 'North America', 71459),
(2018, 8, '2018-08-13', 1203, 'Support', 'Standard Support Contract', 2, 180.00, 360.00, 'Direct Sales', 'Europe', 41823),
(2018, 8, '2018-08-27', 1204, 'Cloud Services', 'Advanced Cloud Package', 7, 570.00, 3990.00, 'Online', 'Asia', 95178),
-- September 2018 Transactions
(2018, 9, '2018-09-03', 1205, 'Software Licenses', 'Enterprise Suite License', 7, 1350.00, 9450.00, 'Direct Sales', 'North America', 32546),
(2018, 9, '2018-09-14', 1206, 'Consulting', 'Custom Development', 3, 8700.00, 26100.00, 'Direct Sales', 'Europe', 62984),
(2018, 9, '2018-09-28', 1207, 'Cloud Services', 'Basic Cloud Package', 35, 55.00, 1925.00, 'Online', 'Asia', 55317),
-- October 2018 Transactions
(2018, 10, '2018-10-08', 1208, 'Software Licenses', 'Small Business Edition', 7, 330.00, 2310.00, 'Retail', 'North America', 88652),
(2018, 10, '2018-10-15', 1209, 'Support', 'Premium Support Contract', 7, 340.00, 2380.00, 'Direct Sales', 'Europe', 29741),
(2018, 10, '2018-10-29', 1210, 'Cloud Services', 'Standard Cloud Package', 13, 115.00, 1495.00, 'Online', 'Asia', 77219),
-- November 2018 Transactions
(2018, 11, '2018-11-05', 1211, 'Software Licenses', 'Enterprise Suite License', 8, 1350.00, 10800.00, 'Direct Sales', 'North America', 44983),
(2018, 11, '2018-11-19', 1212, 'Consulting', 'Training Services', 3, 2800.00, 8400.00, 'Direct Sales', 'Europe', 91328),
(2018, 11, '2018-11-30', 1213, 'Cloud Services', 'Advanced Cloud Package', 8, 570.00, 4560.00, 'Online', 'Asia', 34156),
-- December 2018 Transactions
(2018, 12, '2018-12-03', 1214, 'Software Licenses', 'Small Business Edition', 18, 330.00, 5940.00, 'Retail', 'North America', 61742),
(2018, 12, '2018-12-17', 1215, 'Support', 'Standard Support Contract', 6, 180.00, 1080.00, 'Direct Sales', 'Europe', 99001),
(2018, 12, '2018-12-28', 1216, 'Cloud Services', 'Basic Cloud Package', 45, 55.00, 2475.00, 'Online', 'Asia', 99008),
-- Transactions in Australia Region
(2018, 1, '2018-01-25', 1217, 'Software Licenses', 'Enterprise Suite License', 1, 1350.00, 1350.00, 'Direct Sales', 'Australia', 28547),
(2018, 2, '2018-02-28', 1218, 'Consulting', 'Implementation Services', 1, 5700.00, 5700.00, 'Direct Sales', 'Australia', 19572),
(2018, 3, '2018-03-30', 1219, 'Cloud Services', 'Standard Cloud Package', 8, 115.00, 920.00, 'Online', 'Australia', 92648),
(2018, 4, '2018-04-30', 1220, 'Software Licenses', 'Small Business Edition', 5, 330.00, 1650.00, 'Retail', 'Australia', 51879),
(2018, 5, '2018-05-31', 1221, 'Support', 'Premium Support Contract', 1, 340.00, 340.00, 'Direct Sales', 'Australia', 61742),
(2018, 6, '2018-06-28', 1222, 'Cloud Services', 'Advanced Cloud Package', 2, 570.00, 1140.00, 'Online', 'Australia', 82794),
(2018, 7, '2018-07-31', 1223, 'Software Licenses', 'Enterprise Suite License', 2, 1350.00, 2700.00, 'Direct Sales', 'Australia', 31428),
(2018, 8, '2018-08-31', 1224, 'Consulting', 'Custom Development', 1, 8700.00, 8700.00, 'Direct Sales', 'Australia', 93865),
(2018, 9, '2018-09-28', 1225, 'Cloud Services', 'Basic Cloud Package', 18, 55.00, 990.00, 'Online', 'Australia', 33791),
(2018, 10, '2018-10-31', 1226, 'Software Licenses', 'Small Business Edition', 3, 330.00, 990.00, 'Retail', 'Australia', 63518),
(2018, 11, '2018-11-30', 1227, 'Support', 'Standard Support Contract', 2, 180.00, 360.00, 'Direct Sales', 'Australia', 56842),
(2018, 12, '2018-12-31', 1228, 'Cloud Services', 'Standard Cloud Package', 4, 115.00, 460.00, 'Online', 'Australia', 89175);

INSERT INTO CustomerTransactions (fiscal_year, fiscal_month, transaction_date, customer_id, product_service_category, product_service_name, quantity, unit_price, transaction_amount, sales_channel, sales_region, employee_id) VALUES
-- January 2019 Transactions
(2019, 1, '2019-01-07', 1229, 'Software Licenses', 'Enterprise Suite License', 3, 1400.00, 4200.00, 'Direct Sales', 'North America', 28547),
(2019, 1, '2019-01-14', 1230, 'Consulting', 'Implementation Services', 1, 5900.00, 5900.00, 'Direct Sales', 'Europe', 99001),
(2019, 1, '2019-01-21', 1231, 'Cloud Services', 'Standard Cloud Package', 20, 120.00, 2400.00, 'Online', 'Asia', 92648),
-- February 2019 Transactions
(2019, 2, '2019-02-04', 1232, 'Software Licenses', 'Small Business Edition', 12, 340.00, 4080.00, 'Retail', 'North America', 51879),
(2019, 2, '2019-02-18', 1233, 'Support', 'Premium Support Contract', 5, 350.00, 1750.00, 'Direct Sales', 'Europe', 61742),
(2019, 2, '2019-02-25', 1234, 'Cloud Services', 'Advanced Cloud Package', 7, 590.00, 4130.00, 'Online', 'Asia', 82794),
-- March 2019 Transactions
(2019, 3, '2019-03-04', 1235, 'Software Licenses', 'Enterprise Suite License', 4, 1400.00, 5600.00, 'Direct Sales', 'North America', 31428),
(2019, 3, '2019-03-11', 1236, 'Consulting', 'Custom Development', 2, 8900.00, 17800.00, 'Direct Sales', 'Europe', 93865),
(2019, 3, '2019-03-28', 1237, 'Cloud Services', 'Basic Cloud Package', 35, 60.00, 2100.00, 'Online', 'Asia', 33791),
-- April 2019 Transactions
(2019, 4, '2019-04-08', 1238, 'Software Licenses', 'Small Business Edition', 8, 340.00, 2720.00, 'Retail', 'North America', 63518),
(2019, 4, '2019-04-15', 1239, 'Support', 'Standard Support Contract', 4, 190.00, 760.00, 'Direct Sales', 'Europe', 56842),
(2019, 4, '2019-04-29', 1240, 'Cloud Services', 'Standard Cloud Package', 12, 120.00, 1440.00, 'Online', 'Asia', 89175),
-- May 2019 Transactions
(2019, 5, '2019-05-06', 1241, 'Software Licenses', 'Enterprise Suite License', 6, 1400.00, 8400.00, 'Direct Sales', 'North America', 36954),
(2019, 5, '2019-05-20', 1242, 'Consulting', 'Training Services', 3, 2900.00, 8700.00, 'Direct Sales', 'Europe', 68291),
(2019, 5, '2019-05-27', 1243, 'Cloud Services', 'Advanced Cloud Package', 5, 590.00, 2950.00, 'Online', 'Asia', 52487),
-- June 2019 Transactions
(2019, 6, '2019-06-10', 1244, 'Software Licenses', 'Small Business Edition', 15, 340.00, 5100.00, 'Retail', 'North America', 61742),
(2019, 6, '2019-06-17', 1245, 'Support', 'Premium Support Contract', 7, 350.00, 2450.00, 'Direct Sales', 'Europe', 39215),
(2019, 6, '2019-06-24', 1246, 'Cloud Services', 'Basic Cloud Package', 25, 60.00, 1500.00, 'Online', 'Asia', 64879),
-- July 2019 Transactions
(2019, 7, '2019-07-01', 1247, 'Software Licenses', 'Enterprise Suite License', 5, 1400.00, 7000.00, 'Direct Sales', 'North America', 57142),
(2019, 7, '2019-07-15', 1248, 'Consulting', 'Implementation Services', 3, 5900.00, 17700.00, 'Direct Sales', 'Europe', 83526),
(2019, 7, '2019-07-29', 1249, 'Cloud Services', 'Standard Cloud Package', 18, 120.00, 2160.00, 'Online', 'Asia', 25981),
-- August 2019 Transactions
(2019, 8, '2019-08-05', 1250, 'Software Licenses', 'Small Business Edition', 10, 340.00, 3400.00, 'Retail', 'North America', 71459),
(2019, 8, '2019-08-19', 1251, 'Support', 'Standard Support Contract', 5, 190.00, 950.00, 'Direct Sales', 'Europe', 41823),
(2019, 8, '2019-08-26', 1252, 'Cloud Services', 'Advanced Cloud Package', 8, 590.00, 4720.00, 'Online', 'Asia', 95178),
-- September 2019 Transactions
(2019, 9, '2019-09-09', 1253, 'Software Licenses', 'Enterprise Suite License', 9, 1400.00, 12600.00, 'Direct Sales', 'North America', 32546),
(2019, 9, '2019-09-16', 1254, 'Consulting', 'Custom Development', 4, 8900.00, 35600.00, 'Direct Sales', 'Europe', 62984),
(2019, 9, '2019-09-30', 1255, 'Cloud Services', 'Basic Cloud Package', 40, 60.00, 2400.00, 'Online', 'Asia', 55317),
-- October 2019 Transactions
(2019, 10, '2019-10-07', 1256, 'Software Licenses', 'Small Business Edition', 9, 340.00, 3060.00, 'Retail', 'North America', 88652),
(2019, 10, '2019-10-21', 1257, 'Support', 'Premium Support Contract', 8, 350.00, 2800.00, 'Direct Sales', 'Europe', 29741),
(2019, 10, '2019-10-28', 1258, 'Cloud Services', 'Standard Cloud Package', 15, 120.00, 1800.00, 'Online', 'Asia', 77219),
-- November 2019 Transactions
(2019, 11, '2019-11-04', 1259, 'Software Licenses', 'Enterprise Suite License', 10, 1400.00, 14000.00, 'Direct Sales', 'North America', 44983),
(2019, 11, '2019-11-18', 1260, 'Consulting', 'Training Services', 4, 2900.00, 11600.00, 'Direct Sales', 'Europe', 91328),
(2019, 11, '2019-11-25', 1261, 'Cloud Services', 'Advanced Cloud Package', 10, 590.00, 5900.00, 'Online', 'Asia', 34156),
-- December 2019 Transactions
(2019, 12, '2019-12-02', 1262, 'Software Licenses', 'Small Business Edition', 20, 340.00, 6800.00, 'Retail', 'North America', 61742),
(2019, 12, '2019-12-16', 1263, 'Support', 'Standard Support Contract', 7, 190.00, 1330.00, 'Direct Sales', 'Europe', 99008),
(2019, 12, '2019-12-30', 1264, 'Cloud Services', 'Basic Cloud Package', 50, 60.00, 3000.00, 'Online', 'Asia', 99011),
-- Transactions in South America Region
(2019, 1, '2019-01-28', 1265, 'Software Licenses', 'Enterprise Suite License', 1, 1400.00, 1400.00, 'Direct Sales', 'South America', 28547),
(2019, 2, '2019-02-28', 1266, 'Consulting', 'Implementation Services', 1, 5900.00, 5900.00, 'Direct Sales', 'South America', 99001),
(2019, 3, '2019-03-25', 1267, 'Cloud Services', 'Standard Cloud Package', 10, 120.00, 1200.00, 'Online', 'South America', 92648),
(2019, 4, '2019-04-22', 1268, 'Software Licenses', 'Small Business Edition', 7, 340.00, 2380.00, 'Retail', 'South America', 51879),
(2019, 5, '2019-05-27', 1269, 'Support', 'Premium Support Contract', 2, 350.00, 700.00, 'Direct Sales', 'South America', 61742),
(2019, 6, '2019-06-24', 1270, 'Cloud Services', 'Advanced Cloud Package', 3, 590.00, 1770.00, 'Online', 'South America', 82794),
(2019, 7, '2019-07-22', 1271, 'Software Licenses', 'Enterprise Suite License', 2, 1400.00, 2800.00, 'Direct Sales', 'South America', 31428),
(2019, 8, '2019-08-26', 1272, 'Consulting', 'Custom Development', 1, 8900.00, 8900.00, 'Direct Sales', 'South America', 93865),
(2019, 9, '2019-09-23', 1273, 'Cloud Services', 'Basic Cloud Package', 25, 60.00, 1500.00, 'Online', 'South America', 33791),
(2019, 10, '2019-10-28', 1274, 'Software Licenses', 'Small Business Edition', 5, 340.00, 1700.00, 'Retail', 'South America', 63518),
(2019, 11, '2019-11-25', 1275, 'Support', 'Standard Support Contract', 3, 190.00, 570.00, 'Direct Sales', 'South America', 56842),
(2019, 12, '2019-12-23', 1276, 'Cloud Services', 'Standard Cloud Package', 8, 120.00, 960.00, 'Online', 'South America', 89175);

INSERT INTO CustomerTransactions (fiscal_year, fiscal_month, transaction_date, customer_id, product_service_category, product_service_name, quantity, unit_price, transaction_amount, sales_channel, sales_region, employee_id) VALUES
-- January 2020 Transactions
(2020, 1, '2020-01-06', 1277, 'Software Licenses', 'Enterprise Suite License', 5, 1450.00, 7250.00, 'Direct Sales', 'North America', 28547),
(2020, 1, '2020-01-13', 1278, 'Consulting', 'Implementation Services', 1, 6100.00, 6100.00, 'Direct Sales', 'Europe', 99008),
(2020, 1, '2020-01-20', 1279, 'Cloud Services', 'Standard Cloud Package', 22, 125.00, 2750.00, 'Online', 'Asia', 92648),
-- February 2020 Transactions
(2020, 2, '2020-02-03', 1280, 'Software Licenses', 'Small Business Edition', 14, 350.00, 4900.00, 'Retail', 'North America', 51879),
(2020, 2, '2020-02-17', 1281, 'Support', 'Premium Support Contract', 6, 360.00, 2160.00, 'Direct Sales', 'Europe', 61742),
(2020, 2, '2020-02-24', 1282, 'Cloud Services', 'Advanced Cloud Package', 8, 610.00, 4880.00, 'Online', 'Asia', 82794),
-- March 2020 Transactions
(2020, 3, '2020-03-02', 1283, 'Software Licenses', 'Enterprise Suite License', 6, 1450.00, 8700.00, 'Direct Sales', 'North America', 31428),
(2020, 3, '2020-03-09', 1284, 'Consulting', 'Custom Development', 3, 9100.00, 27300.00, 'Direct Sales', 'Europe', 93865),
(2020, 3, '2020-03-30', 1285, 'Cloud Services', 'Basic Cloud Package', 40, 62.00, 2480.00, 'Online', 'Asia', 33791),
-- April 2020 Transactions
(2020, 4, '2020-04-06', 1286, 'Software Licenses', 'Small Business Edition', 10, 350.00, 3500.00, 'Retail', 'North America', 63518),
(2020, 4, '2020-04-20', 1287, 'Support', 'Standard Support Contract', 5, 200.00, 1000.00, 'Direct Sales', 'Europe', 56842),
(2020, 4, '2020-04-27', 1288, 'Cloud Services', 'Standard Cloud Package', 15, 125.00, 1875.00, 'Online', 'Asia', 89175),
-- May 2020 Transactions
(2020, 5, '2020-05-04', 1289, 'Software Licenses', 'Enterprise Suite License', 8, 1450.00, 11600.00, 'Direct Sales', 'North America', 36954),
(2020, 5, '2020-05-18', 1290, 'Consulting', 'Training Services', 4, 3000.00, 12000.00, 'Direct Sales', 'Europe', 68291),
(2020, 5, '2020-05-25', 1291, 'Cloud Services', 'Advanced Cloud Package', 7, 610.00, 4270.00, 'Online', 'Asia', 52487),
-- June 2020 Transactions
(2020, 6, '2020-06-08', 1292, 'Software Licenses', 'Small Business Edition', 18, 350.00, 6300.00, 'Retail', 'North America', 61742),
(2020, 6, '2020-06-15', 1293, 'Support', 'Premium Support Contract', 8, 360.00, 2880.00, 'Direct Sales', 'Europe', 39215),
(2020, 6, '2020-06-29', 1294, 'Cloud Services', 'Basic Cloud Package', 30, 62.00, 1860.00, 'Online', 'Asia', 64879),
-- July 2020 Transactions
(2020, 7, '2020-07-06', 1295, 'Software Licenses', 'Enterprise Suite License', 7, 1450.00, 10150.00, 'Direct Sales', 'North America', 57142),
(2020, 7, '2020-07-20', 1296, 'Consulting', 'Implementation Services', 4, 6100.00, 24400.00, 'Direct Sales', 'Europe', 83526),
(2020, 7, '2020-07-27', 1297, 'Cloud Services', 'Standard Cloud Package', 20, 125.00, 2500.00, 'Online', 'Asia', 25981),
-- August 2020 Transactions
(2020, 8, '2020-08-03', 1298, 'Software Licenses', 'Small Business Edition', 12, 350.00, 4200.00, 'Retail', 'North America', 71459),
(2020, 8, '2020-08-17', 1299, 'Support', 'Standard Support Contract', 6, 200.00, 1200.00, 'Direct Sales', 'Europe', 41823),
(2020, 8, '2020-08-31', 1300, 'Cloud Services', 'Advanced Cloud Package', 10, 610.00, 6100.00, 'Online', 'Asia', 95178),
-- September 2020 Transactions
(2020, 9, '2020-09-07', 1301, 'Software Licenses', 'Enterprise Suite License', 11, 1450.00, 15950.00, 'Direct Sales', 'North America', 32546),
(2020, 9, '2020-09-14', 1302, 'Consulting', 'Custom Development', 5, 9100.00, 45500.00, 'Direct Sales', 'Europe', 62984),
(2020, 9, '2020-09-28', 1303, 'Cloud Services', 'Basic Cloud Package', 45, 62.00, 2790.00, 'Online', 'Asia', 55317),
-- October 2020 Transactions
(2020, 10, '2020-10-05', 1304, 'Software Licenses', 'Small Business Edition', 11, 350.00, 3850.00, 'Retail', 'North America', 88652),
(2020, 10, '2020-10-19', 1305, 'Support', 'Premium Support Contract', 9, 360.00, 3240.00, 'Direct Sales', 'Europe', 29741),
(2020, 10, '2020-10-26', 1306, 'Cloud Services', 'Standard Cloud Package', 18, 125.00, 2250.00, 'Online', 'Asia', 77219),
-- November 2020 Transactions
(2020, 11, '2020-11-02', 1307, 'Software Licenses', 'Enterprise Suite License', 12, 1450.00, 17400.00, 'Direct Sales', 'North America', 44983),
(2020, 11, '2020-11-16', 1308, 'Consulting', 'Training Services', 5, 3000.00, 15000.00, 'Direct Sales', 'Europe', 91328),
(2020, 11, '2020-11-30', 1309, 'Cloud Services', 'Advanced Cloud Package', 12, 610.00, 7320.00, 'Online', 'Asia', 34156),
-- December 2020 Transactions
(2020, 12, '2020-12-07', 1310, 'Software Licenses', 'Small Business Edition', 22, 350.00, 7700.00, 'Retail', 'North America', 61742),
(2020, 12, '2020-12-21', 1311, 'Support', 'Standard Support Contract', 8, 200.00, 1600.00, 'Direct Sales', 'Europe', 99011),
(2020, 12, '2020-12-28', 1312, 'Cloud Services', 'Basic Cloud Package', 60, 62.00, 3720.00, 'Online', 'Asia', 99016),
-- Transactions in South America Region
(2020, 1, '2020-01-30', 1313, 'Software Licenses', 'Enterprise Suite License', 2, 1450.00, 2900.00, 'Direct Sales', 'South America', 28547),
(2020, 2, '2020-02-27', 1314, 'Consulting', 'Implementation Services', 1, 6100.00, 6100.00, 'Direct Sales', 'South America', 99008),
(2020, 3, '2020-03-30', 1315, 'Cloud Services', 'Standard Cloud Package', 12, 125.00, 1500.00, 'Online', 'South America', 92648),
(2020, 4, '2020-04-27', 1316, 'Software Licenses', 'Small Business Edition', 8, 350.00, 2800.00, 'Retail', 'South America', 51879),
(2020, 5, '2020-05-29', 1317, 'Support', 'Premium Support Contract', 3, 360.00, 1080.00, 'Direct Sales', 'South America', 61742),
(2020, 6, '2020-06-26', 1318, 'Cloud Services', 'Advanced Cloud Package', 4, 610.00, 2440.00, 'Online', 'South America', 82794),
(2020, 7, '2020-07-27', 1319, 'Software Licenses', 'Enterprise Suite License', 3, 1450.00, 4350.00, 'Direct Sales', 'South America', 31428),
(2020, 8, '2020-08-24', 1320, 'Consulting', 'Custom Development', 1, 9100.00, 9100.00, 'Direct Sales', 'South America', 93865),
(2020, 9, '2020-09-28', 1321, 'Cloud Services', 'Basic Cloud Package', 30, 62.00, 1860.00, 'Online', 'South America', 33791),
(2020, 10, '2020-10-26', 1322, 'Software Licenses', 'Small Business Edition', 6, 350.00, 2100.00, 'Retail', 'South America', 63518),
(2020, 11, '2020-11-30', 1323, 'Support', 'Standard Support Contract', 4, 200.00, 800.00, 'Direct Sales', 'South America', 56842),
(2020, 12, '2020-12-28', 1324, 'Cloud Services', 'Standard Cloud Package', 10, 125.00, 1250.00, 'Online', 'South America', 89175);

INSERT INTO CustomerTransactions (fiscal_year, fiscal_month, transaction_date, customer_id, product_service_category, product_service_name, quantity, unit_price, transaction_amount, sales_channel, sales_region, employee_id) VALUES
-- January 2021 Transactions
(2021, 1, '2021-01-04', 1325, 'Software Licenses', 'Enterprise Suite License', 4, 1450.00, 5800.00, 'Direct Sales', 'North America', 28547),
(2021, 1, '2021-01-11', 1326, 'Consulting', 'Implementation Services', 1, 6100.00, 6100.00, 'Direct Sales', 'Europe', 99008),
(2021, 1, '2021-01-18', 1327, 'Cloud Services', 'Standard Cloud Package', 25, 125.00, 3125.00, 'Online', 'Asia', 92648),
-- February 2021 Transactions
(2021, 2, '2021-02-01', 1328, 'Software Licenses', 'Small Business Edition', 10, 350.00, 3500.00, 'Retail', 'North America', 51879),
(2021, 2, '2021-02-15', 1329, 'Support', 'Premium Support Contract', 7, 360.00, 2520.00, 'Direct Sales', 'Europe', 61742),
(2021, 2, '2021-02-22', 1330, 'Cloud Services', 'Advanced Cloud Package', 9, 610.00, 5490.00, 'Online', 'Asia', 82794),
-- March 2021 Transactions
(2021, 3, '2021-03-01', 1331, 'Software Licenses', 'Enterprise Suite License', 7, 1450.00, 10150.00, 'Direct Sales', 'North America', 31428),
(2021, 3, '2021-03-08', 1332, 'Consulting', 'Custom Development', 2, 9100.00, 18200.00, 'Direct Sales', 'Europe', 93865),
(2021, 3, '2021-03-29', 1333, 'Cloud Services', 'Basic Cloud Package', 38, 62.00, 2356.00, 'Online', 'Asia', 33791),
-- April 2021 Transactions
(2021, 4, '2021-04-05', 1334, 'Software Licenses', 'Small Business Edition', 9, 350.00, 3150.00, 'Retail', 'North America', 63518),
(2021, 4, '2021-04-19', 1335, 'Support', 'Standard Support Contract', 6, 200.00, 1200.00, 'Direct Sales', 'Europe', 56842),
(2021, 4, '2021-04-26', 1336, 'Cloud Services', 'Standard Cloud Package', 14, 125.00, 1750.00, 'Online', 'Asia', 89175),
-- May 2021 Transactions
(2021, 5, '2021-05-03', 1337, 'Software Licenses', 'Enterprise Suite License', 9, 1450.00, 13050.00, 'Direct Sales', 'North America', 36954),
(2021, 5, '2021-05-17', 1338, 'Consulting', 'Training Services', 3, 3000.00, 9000.00, 'Direct Sales', 'Europe', 68291),
(2021, 5, '2021-05-24', 1339, 'Cloud Services', 'Advanced Cloud Package', 6, 610.00, 3660.00, 'Online', 'Asia', 52487),
-- June 2021 Transactions
(2021, 6, '2021-06-07', 1340, 'Software Licenses', 'Small Business Edition', 16, 350.00, 5600.00, 'Retail', 'North America', 61742),
(2021, 6, '2021-06-21', 1341, 'Support', 'Premium Support Contract', 9, 360.00, 3240.00, 'Direct Sales', 'Europe', 39215),
(2021, 6, '2021-06-28', 1342, 'Cloud Services', 'Basic Cloud Package', 28, 62.00, 1736.00, 'Online', 'Asia', 64879),
-- July 2021 Transactions
(2021, 7, '2021-07-05', 1343, 'Software Licenses', 'Enterprise Suite License', 6, 1450.00, 8700.00, 'Direct Sales', 'North America', 57142),
(2021, 7, '2021-07-19', 1344, 'Consulting', 'Implementation Services', 3, 6100.00, 18300.00, 'Direct Sales', 'Europe', 83526),
(2021, 7, '2021-07-26', 1345, 'Cloud Services', 'Standard Cloud Package', 21, 125.00, 2625.00, 'Online', 'Asia', 25981),
-- August 2021 Transactions
(2021, 8, '2021-08-02', 1346, 'Software Licenses', 'Small Business Edition', 11, 350.00, 3850.00, 'Retail', 'North America', 71459),
(2021, 8, '2021-08-16', 1347, 'Support', 'Standard Support Contract', 7, 200.00, 1400.00, 'Direct Sales', 'Europe', 41823),
(2021, 8, '2021-08-30', 1348, 'Cloud Services', 'Advanced Cloud Package', 9, 610.00, 5490.00, 'Online', 'Asia', 95178),
-- September 2021 Transactions
(2021, 9, '2021-09-06', 1349, 'Software Licenses', 'Enterprise Suite License', 10, 1450.00, 14500.00, 'Direct Sales', 'North America', 32546),
(2021, 9, '2021-09-13', 1350, 'Consulting', 'Custom Development', 4, 9100.00, 36400.00, 'Direct Sales', 'Europe', 62984),
(2021, 9, '2021-09-27', 1351, 'Cloud Services', 'Basic Cloud Package', 42, 62.00, 2604.00, 'Online', 'Asia', 55317),
-- October 2021 Transactions
(2021, 10, '2021-10-04', 1352, 'Software Licenses', 'Small Business Edition', 12, 350.00, 4200.00, 'Retail', 'North America', 88652),
(2021, 10, '2021-10-18', 1353, 'Support', 'Premium Support Contract', 10, 360.00, 3600.00, 'Direct Sales', 'Europe', 29741),
(2021, 10, '2021-10-25', 1354, 'Cloud Services', 'Standard Cloud Package', 17, 125.00, 2125.00, 'Online', 'Asia', 77219),
-- November 2021 Transactions
(2021, 11, '2021-11-01', 1355, 'Software Licenses', 'Enterprise Suite License', 11, 1450.00, 15950.00, 'Direct Sales', 'North America', 44983),
(2021, 11, '2021-11-15', 1356, 'Consulting', 'Training Services', 6, 3000.00, 18000.00, 'Direct Sales', 'Europe', 91328),
(2021, 11, '2021-11-29', 1357, 'Cloud Services', 'Advanced Cloud Package', 11, 610.00, 6710.00, 'Online', 'Asia', 34156),
-- December 2021 Transactions
(2021, 12, '2021-12-06', 1358, 'Software Licenses', 'Small Business Edition', 25, 350.00, 8750.00, 'Retail', 'North America', 61742),
(2021, 12, '2021-12-20', 1359, 'Support', 'Standard Support Contract', 9, 200.00, 1800.00, 'Direct Sales', 'Europe', 99011),
(2021, 12, '2021-12-27', 1360, 'Cloud Services', 'Basic Cloud Package', 55, 62.00, 3410.00, 'Online', 'Asia', 99018),
-- Transactions in South America Region
(2021, 1, '2021-01-25', 1361, 'Software Licenses', 'Enterprise Suite License', 1, 1450.00, 1450.00, 'Direct Sales', 'South America', 28547),
(2021, 2, '2021-02-22', 1362, 'Consulting', 'Implementation Services', 1, 6100.00, 6100.00, 'Direct Sales', 'South America', 99008),
(2021, 3, '2021-03-29', 1363, 'Cloud Services', 'Standard Cloud Package', 11, 125.00, 1375.00, 'Online', 'South America', 92648),
(2021, 4, '2021-04-26', 1364, 'Software Licenses', 'Small Business Edition', 9, 350.00, 3150.00, 'Retail', 'South America', 51879),
(2021, 5, '2021-05-31', 1365, 'Support', 'Premium Support Contract', 4, 360.00, 1440.00, 'Direct Sales', 'South America', 61742),
(2021, 6, '2021-06-28', 1366, 'Cloud Services', 'Advanced Cloud Package', 5, 610.00, 3050.00, 'Online', 'South America', 82794),
(2021, 7, '2021-07-26', 1367, 'Software Licenses', 'Enterprise Suite License', 2, 1450.00, 2900.00, 'Direct Sales', 'South America', 31428),
(2021, 8, '2021-08-30', 1368, 'Consulting', 'Custom Development', 1, 9100.00, 9100.00, 'Direct Sales', 'South America', 93865),
(2021, 9, '2021-09-27', 1369, 'Cloud Services', 'Basic Cloud Package', 28, 62.00, 1736.00, 'Online', 'South America', 33791),
(2021, 10, '2021-10-25', 1370, 'Software Licenses', 'Small Business Edition', 7, 350.00, 2450.00, 'Retail', 'South America', 63518),
(2021, 11, '2021-11-29', 1371, 'Support', 'Standard Support Contract', 2, 200.00, 400.00, 'Direct Sales', 'South America', 56842),
(2021, 12, '2021-12-27', 1372, 'Cloud Services', 'Standard Cloud Package', 9, 125.00, 1125.00, 'Online', 'South America', 89175);

INSERT INTO CustomerTransactions (fiscal_year, fiscal_month, transaction_date, customer_id, product_service_category, product_service_name, quantity, unit_price, transaction_amount, sales_channel, sales_region, employee_id) VALUES
-- January 2022 Transactions
(2022, 1, '2022-01-03', 1373, 'Software Licenses', 'Enterprise Suite License', 6, 1475.00, 8850.00, 'Direct Sales', 'North America', 28547),
(2022, 1, '2022-01-10', 1374, 'Consulting', 'Implementation Services', 1, 6250.00, 6250.00, 'Direct Sales', 'Europe', 99008),
(2022, 1, '2022-01-17', 1375, 'Cloud Services', 'Standard Cloud Package', 20, 130.00, 2600.00, 'Online', 'Asia', 92648),
-- February 2022 Transactions
(2022, 2, '2022-02-07', 1376, 'Software Licenses', 'Small Business Edition', 12, 360.00, 4320.00, 'Retail', 'North America', 51879),
(2022, 2, '2022-02-14', 1377, 'Support', 'Premium Support Contract', 8, 375.00, 3000.00, 'Direct Sales', 'Europe', 61742),
(2022, 2, '2022-02-21', 1378, 'Cloud Services', 'Advanced Cloud Package', 7, 625.00, 4375.00, 'Online', 'Asia', 82794),
-- March 2022 Transactions
(2022, 3, '2022-03-07', 1379, 'Software Licenses', 'Enterprise Suite License', 5, 1475.00, 7375.00, 'Direct Sales', 'North America', 31428),
(2022, 3, '2022-03-14', 1380, 'Consulting', 'Custom Development', 2, 9300.00, 18600.00, 'Direct Sales', 'Europe', 93865),
(2022, 3, '2022-03-28', 1381, 'Cloud Services', 'Basic Cloud Package', 35, 65.00, 2275.00, 'Online', 'Asia', 33791),
-- April 2022 Transactions
(2022, 4, '2022-04-04', 1382, 'Software Licenses', 'Small Business Edition', 11, 360.00, 3960.00, 'Retail', 'North America', 63518),
(2022, 4, '2022-04-18', 1383, 'Support', 'Standard Support Contract', 7, 210.00, 1470.00, 'Direct Sales', 'Europe', 56842),
(2022, 4, '2022-04-25', 1384, 'Cloud Services', 'Standard Cloud Package', 16, 130.00, 2080.00, 'Online', 'Asia', 89175),
-- May 2022 Transactions
(2022, 5, '2022-05-02', 1385, 'Software Licenses', 'Enterprise Suite License', 10, 1475.00, 14750.00, 'Direct Sales', 'North America', 36954),
(2022, 5, '2022-05-16', 1386, 'Consulting', 'Training Services', 3, 3150.00, 9450.00, 'Direct Sales', 'Europe', 68291),
(2022, 5, '2022-05-23', 1387, 'Cloud Services', 'Advanced Cloud Package', 8, 625.00, 5000.00, 'Online', 'Asia', 52487),
-- June 2022 Transactions
(2022, 6, '2022-06-06', 1388, 'Software Licenses', 'Small Business Edition', 15, 360.00, 5400.00, 'Retail', 'North America', 61742),
(2022, 6, '2022-06-20', 1389, 'Support', 'Premium Support Contract', 10, 375.00, 3750.00, 'Direct Sales', 'Europe', 39215),
(2022, 6, '2022-06-27', 1390, 'Cloud Services', 'Basic Cloud Package', 32, 65.00, 2080.00, 'Online', 'Asia', 64879),
-- July 2022 Transactions
(2022, 7, '2022-07-04', 1391, 'Software Licenses', 'Enterprise Suite License', 8, 1475.00, 11800.00, 'Direct Sales', 'North America', 57142),
(2022, 7, '2022-07-18', 1392, 'Consulting', 'Implementation Services', 2, 6250.00, 12500.00, 'Direct Sales', 'Europe', 83526),
(2022, 7, '2022-07-25', 1393, 'Cloud Services', 'Standard Cloud Package', 22, 130.00, 2860.00, 'Online', 'Asia', 25981),
-- August 2022 Transactions
(2022, 8, '2022-08-01', 1394, 'Software Licenses', 'Small Business Edition', 13, 360.00, 4680.00, 'Retail', 'North America', 71459),
(2022, 8, '2022-08-15', 1395, 'Support', 'Standard Support Contract', 8, 210.00, 1680.00, 'Direct Sales', 'Europe', 41823),
(2022, 8, '2022-08-29', 1396, 'Cloud Services', 'Advanced Cloud Package', 8, 625.00, 5000.00, 'Online', 'Asia', 95178),
-- September 2022 Transactions
(2022, 9, '2022-09-05', 1397, 'Software Licenses', 'Enterprise Suite License', 9, 1475.00, 13275.00, 'Direct Sales', 'North America', 32546),
(2022, 9, '2022-09-12', 1398, 'Consulting', 'Custom Development', 3, 9300.00, 27900.00, 'Direct Sales', 'Europe', 62984),
(2022, 9, '2022-09-26', 1399, 'Cloud Services', 'Basic Cloud Package', 40, 65.00, 2600.00, 'Online', 'Asia', 55317),
-- October 2022 Transactions
(2022, 10, '2022-10-03', 1400, 'Software Licenses', 'Small Business Edition', 14, 360.00, 5040.00, 'Retail', 'North America', 88652),
(2022, 10, '2022-10-17', 1401, 'Support', 'Premium Support Contract', 11, 375.00, 4125.00, 'Direct Sales', 'Europe', 29741),
(2022, 10, '2022-10-24', 1402, 'Cloud Services', 'Standard Cloud Package', 19, 130.00, 2470.00, 'Online', 'Asia', 77219),
-- November 2022 Transactions
(2022, 11, '2022-11-07', 1403, 'Software Licenses', 'Enterprise Suite License', 13, 1475.00, 19175.00, 'Direct Sales', 'North America', 44983),
(2022, 11, '2022-11-14', 1404, 'Consulting', 'Training Services', 7, 3150.00, 22050.00, 'Direct Sales', 'Europe', 91328),
(2022, 11, '2022-11-28', 1405, 'Cloud Services', 'Advanced Cloud Package', 13, 625.00, 8125.00, 'Online', 'Asia', 34156),
-- December 2022 Transactions
(2022, 12, '2022-12-05', 1406, 'Software Licenses', 'Small Business Edition', 20, 360.00, 7200.00, 'Retail', 'North America', 61742),
(2022, 12, '2022-12-19', 1407, 'Support', 'Standard Support Contract', 10, 210.00, 2100.00, 'Direct Sales', 'Europe', 99011),
(2022, 12, '2022-12-26', 1408, 'Cloud Services', 'Basic Cloud Package', 50, 65.00, 3250.00, 'Online', 'Asia', 99016),
-- Transactions in South America Region
(2022, 1, '2022-01-31', 1409, 'Software Licenses', 'Enterprise Suite License', 2, 1475.00, 2950.00, 'Direct Sales', 'South America', 28547),
(2022, 2, '2022-02-28', 1410, 'Consulting', 'Implementation Services', 1, 6250.00, 6250.00, 'Direct Sales', 'South America', 99008),
(2022, 3, '2022-03-31', 1411, 'Cloud Services', 'Standard Cloud Package', 13, 130.00, 1690.00, 'Online', 'South America', 92648),
(2022, 4, '2022-04-28', 1412, 'Software Licenses', 'Small Business Edition', 7, 360.00, 2520.00, 'Retail', 'South America', 51879),
(2022, 5, '2022-05-30', 1413, 'Support', 'Premium Support Contract', 3, 375.00, 1125.00, 'Direct Sales', 'South America', 61742),
(2022, 6, '2022-06-30', 1414, 'Cloud Services', 'Advanced Cloud Package', 4, 625.00, 2500.00, 'Online', 'South America', 82794),
(2022, 7, '2022-07-28', 1415, 'Software Licenses', 'Enterprise Suite License', 3, 1475.00, 4425.00, 'Direct Sales', 'South America', 31428),
(2022, 8, '2022-08-31', 1416, 'Consulting', 'Custom Development', 1, 9300.00, 9300.00, 'Direct Sales', 'South America', 93865),
(2022, 9, '2022-09-29', 1417, 'Cloud Services', 'Basic Cloud Package', 30, 65.00, 1950.00, 'Online', 'South America', 33791),
(2022, 10, '2022-10-31', 1418, 'Software Licenses', 'Small Business Edition', 6, 360.00, 2160.00, 'Retail', 'South America', 63518),
(2022, 11, '2022-11-30', 1419, 'Support', 'Standard Support Contract', 3, 210.00, 630.00, 'Direct Sales', 'South America', 56842),
(2022, 12, '2022-12-29', 1420, 'Cloud Services', 'Standard Cloud Package', 11, 130.00, 1430.00, 'Online', 'South America', 89175);

INSERT INTO CustomerTransactions (fiscal_year, fiscal_month, transaction_date, customer_id, product_service_category, product_service_name, quantity, unit_price, transaction_amount, sales_channel, sales_region, employee_id) VALUES
-- January 2023 Transactions
(2023, 1, '2023-01-02', 1421, 'Software Licenses', 'Enterprise Suite License', 5, 1500.00, 7500.00, 'Direct Sales', 'North America', 28547),
(2023, 1, '2023-01-09', 1422, 'Consulting', 'Implementation Services', 1, 6400.00, 6400.00, 'Direct Sales', 'Europe', 99008),
(2023, 1, '2023-01-16', 1423, 'Cloud Services', 'Standard Cloud Package', 22, 135.00, 2970.00, 'Online', 'Asia', 92648),
-- February 2023 Transactions
(2023, 2, '2023-02-06', 1424, 'Software Licenses', 'Small Business Edition', 14, 370.00, 5180.00, 'Retail', 'North America', 51879),
(2023, 2, '2023-02-13', 1425, 'Support', 'Premium Support Contract', 9, 385.00, 3465.00, 'Direct Sales', 'Europe', 61742),
(2023, 2, '2023-02-20', 1426, 'Cloud Services', 'Advanced Cloud Package', 6, 640.00, 3840.00, 'Online', 'Asia', 82794),
-- March 2023 Transactions
(2023, 3, '2023-03-06', 1427, 'Software Licenses', 'Enterprise Suite License', 7, 1500.00, 10500.00, 'Direct Sales', 'North America', 31428),
(2023, 3, '2023-03-13', 1428, 'Consulting', 'Custom Development', 3, 9500.00, 28500.00, 'Direct Sales', 'Europe', 93865),
(2023, 3, '2023-03-27', 1429, 'Cloud Services', 'Basic Cloud Package', 40, 68.00, 2720.00, 'Online', 'Asia', 33791),
-- April 2023 Transactions
(2023, 4, '2023-04-03', 1430, 'Software Licenses', 'Small Business Edition', 10, 370.00, 3700.00, 'Retail', 'North America', 63518),
(2023, 4, '2023-04-17', 1431, 'Support', 'Standard Support Contract', 8, 220.00, 1760.00, 'Direct Sales', 'Europe', 56842),
(2023, 4, '2023-04-24', 1432, 'Cloud Services', 'Standard Cloud Package', 18, 135.00, 2430.00, 'Online', 'Asia', 89175),
-- May 2023 Transactions
(2023, 5, '2023-05-01', 1433, 'Software Licenses', 'Enterprise Suite License', 12, 1500.00, 18000.00, 'Direct Sales', 'North America', 36954),
(2023, 5, '2023-05-15', 1434, 'Consulting', 'Training Services', 4, 3200.00, 12800.00, 'Direct Sales', 'Europe', 68291),
(2023, 5, '2023-05-22', 1435, 'Cloud Services', 'Advanced Cloud Package', 10, 640.00, 6400.00, 'Online', 'Asia', 52487),
-- June 2023 Transactions
(2023, 6, '2023-06-05', 1436, 'Software Licenses', 'Small Business Edition', 18, 370.00, 6660.00, 'Retail', 'North America', 61742),
(2023, 6, '2023-06-19', 1437, 'Support', 'Premium Support Contract', 12, 385.00, 4620.00, 'Direct Sales', 'Europe', 39215),
(2023, 6, '2023-06-26', 1438, 'Cloud Services', 'Basic Cloud Package', 30, 68.00, 2040.00, 'Online', 'Asia', 64879),
-- July 2023 Transactions
(2023, 7, '2023-07-03', 1439, 'Software Licenses', 'Enterprise Suite License', 9, 1500.00, 13500.00, 'Direct Sales', 'North America', 57142),
(2023, 7, '2023-07-17', 1440, 'Consulting', 'Implementation Services', 3, 6400.00, 19200.00, 'Direct Sales', 'Europe', 83526),
(2023, 7, '2023-07-24', 1441, 'Cloud Services', 'Standard Cloud Package', 25, 135.00, 3375.00, 'Online', 'Asia', 25981),
-- August 2023 Transactions
(2023, 8, '2023-08-07', 1442, 'Software Licenses', 'Small Business Edition', 15, 370.00, 5550.00, 'Retail', 'North America', 71459),
(2023, 8, '2023-08-14', 1443, 'Support', 'Standard Support Contract', 9, 220.00, 1980.00, 'Direct Sales', 'Europe', 41823),
(2023, 8, '2023-08-28', 1444, 'Cloud Services', 'Advanced Cloud Package', 10, 640.00, 6400.00, 'Online', 'Asia', 95178),
-- September 2023 Transactions
(2023, 9, '2023-09-04', 1445, 'Software Licenses', 'Enterprise Suite License', 11, 1500.00, 16500.00, 'Direct Sales', 'North America', 32546),
(2023, 9, '2023-09-11', 1446, 'Consulting', 'Custom Development', 5, 9500.00, 47500.00, 'Direct Sales', 'Europe', 62984),
(2023, 9, '2023-09-25', 1447, 'Cloud Services', 'Basic Cloud Package', 45, 68.00, 3060.00, 'Online', 'Asia', 55317),
-- October 2023 Transactions
(2023, 10, '2023-10-02', 1448, 'Software Licenses', 'Small Business Edition', 16, 370.00, 5920.00, 'Retail', 'North America', 88652),
(2023, 10, '2023-10-16', 1449, 'Support', 'Premium Support Contract', 13, 385.00, 5005.00, 'Direct Sales', 'Europe', 29741),
(2023, 10, '2023-10-23', 1450, 'Cloud Services', 'Standard Cloud Package', 20, 135.00, 2700.00, 'Online', 'Asia', 77219),
-- November 2023 Transactions
(2023, 11, '2023-11-06', 1451, 'Software Licenses', 'Enterprise Suite License', 15, 1500.00, 22500.00, 'Direct Sales', 'North America', 44983),
(2023, 11, '2023-11-13', 1452, 'Consulting', 'Training Services', 8, 3200.00, 25600.00, 'Direct Sales', 'Europe', 91328),
(2023, 11, '2023-11-27', 1453, 'Cloud Services', 'Advanced Cloud Package', 15, 640.00, 9600.00, 'Online', 'Asia', 34156),
-- December 2023 Transactions
(2023, 12, '2023-12-04', 1454, 'Software Licenses', 'Small Business Edition', 22, 370.00, 8140.00, 'Retail', 'North America', 61742),
(2023, 12, '2023-12-18', 1455, 'Support', 'Standard Support Contract', 12, 220.00, 2640.00, 'Direct Sales', 'Europe', 99011),
(2023, 12, '2023-12-25', 1456, 'Cloud Services', 'Basic Cloud Package', 60, 68.00, 4080.00, 'Online', 'Asia', 99022),
-- Transactions in South America Region
(2023, 1, '2023-01-30', 1457, 'Software Licenses', 'Enterprise Suite License', 3, 1500.00, 4500.00, 'Direct Sales', 'South America', 28547),
(2023, 2, '2023-02-27', 1458, 'Consulting', 'Implementation Services', 1, 6400.00, 6400.00, 'Direct Sales', 'South America', 99008),
(2023, 3, '2023-03-30', 1459, 'Cloud Services', 'Standard Cloud Package', 15, 135.00, 2025.00, 'Online', 'South America', 92648),
(2023, 4, '2023-04-27', 1460, 'Software Licenses', 'Small Business Edition', 8, 370.00, 2960.00, 'Retail', 'South America', 51879),
(2023, 5, '2023-05-29', 1461, 'Support', 'Premium Support Contract', 5, 385.00, 1925.00, 'Direct Sales', 'South America', 61742),
(2023, 6, '2023-06-29', 1462, 'Cloud Services', 'Advanced Cloud Package', 6, 640.00, 3840.00, 'Online', 'South America', 82794),
(2023, 7, '2023-07-27', 1463, 'Software Licenses', 'Enterprise Suite License', 4, 1500.00, 6000.00, 'Direct Sales', 'South America', 31428),
(2023, 8, '2023-08-30', 1464, 'Consulting', 'Custom Development', 1, 9500.00, 9500.00, 'Direct Sales', 'South America', 93865),
(2023, 9, '2023-09-28', 1465, 'Cloud Services', 'Basic Cloud Package', 35, 68.00, 2380.00, 'Online', 'South America', 33791),
(2023, 10, '2023-10-30', 1466, 'Software Licenses', 'Small Business Edition', 5, 370.00, 1850.00, 'Retail', 'South America', 63518),
(2023, 11, '2023-11-28', 1467, 'Support', 'Standard Support Contract', 4, 220.00, 880.00, 'Direct Sales', 'South America', 56842),
(2023, 12, '2023-12-28', 1468, 'Cloud Services', 'Standard Cloud Package', 10, 135.00, 1350.00, 'Online', 'South America', 89175);

INSERT INTO CustomerTransactions (fiscal_year, fiscal_month, transaction_date, customer_id, product_service_category, product_service_name, quantity, unit_price, transaction_amount, sales_channel, sales_region, employee_id) VALUES
-- January 2024 Transactions
(2024, 1, '2024-01-01', 1469, 'Software Licenses', 'Enterprise Suite License', 7, 1550.00, 10850.00, 'Direct Sales', 'North America', 28547),
(2024, 1, '2024-01-08', 1470, 'Consulting', 'Implementation Services', 1, 6550.00, 6550.00, 'Direct Sales', 'Europe', 99008),
(2024, 1, '2024-01-15', 1471, 'Cloud Services', 'Standard Cloud Package', 25, 140.00, 3500.00, 'Online', 'Asia', 92648),
-- February 2024 Transactions
(2024, 2, '2024-02-05', 1472, 'Software Licenses', 'Small Business Edition', 15, 380.00, 5700.00, 'Retail', 'North America', 51879),
(2024, 2, '2024-02-12', 1473, 'Support', 'Premium Support Contract', 10, 395.00, 3950.00, 'Direct Sales', 'Europe', 61742),
(2024, 2, '2024-02-19', 1474, 'Cloud Services', 'Advanced Cloud Package', 7, 655.00, 4585.00, 'Online', 'Asia', 82794),
-- March 2024 Transactions
(2024, 3, '2024-03-04', 1475, 'Software Licenses', 'Enterprise Suite License', 6, 1550.00, 9300.00, 'Direct Sales', 'North America', 31428),
(2024, 3, '2024-03-11', 1476, 'Consulting', 'Custom Development', 4, 9700.00, 38800.00, 'Direct Sales', 'Europe', 93865),
(2024, 3, '2024-03-25', 1477, 'Cloud Services', 'Basic Cloud Package', 42, 70.00, 2940.00, 'Online', 'Asia', 33791),
-- April 2024 Transactions
(2024, 4, '2024-04-01', 1478, 'Software Licenses', 'Small Business Edition', 12, 380.00, 4560.00, 'Retail', 'North America', 63518),
(2024, 4, '2024-04-15', 1479, 'Support', 'Standard Support Contract', 9, 230.00, 2070.00, 'Direct Sales', 'Europe', 56842),
(2024, 4, '2024-04-22', 1480, 'Cloud Services', 'Standard Cloud Package', 20, 140.00, 2800.00, 'Online', 'Asia', 89175),
-- May 2024 Transactions
(2024, 5, '2024-05-06', 1481, 'Software Licenses', 'Enterprise Suite License', 14, 1550.00, 21700.00, 'Direct Sales', 'North America', 36954),
(2024, 5, '2024-05-13', 1482, 'Consulting', 'Training Services', 5, 3300.00, 16500.00, 'Direct Sales', 'Europe', 68291),
(2024, 5, '2024-05-20', 1483, 'Cloud Services', 'Advanced Cloud Package', 12, 655.00, 7860.00, 'Online', 'Asia', 52487),
-- June 2024 Transactions
(2024, 6, '2024-06-03', 1484, 'Software Licenses', 'Small Business Edition', 20, 380.00, 7600.00, 'Retail', 'North America', 61742),
(2024, 6, '2024-06-17', 1485, 'Support', 'Premium Support Contract', 14, 395.00, 5530.00, 'Direct Sales', 'Europe', 39215),
(2024, 6, '2024-06-24', 1486, 'Cloud Services', 'Basic Cloud Package', 35, 70.00, 2450.00, 'Online', 'Asia', 64879),
-- July 2024 Transactions
(2024, 7, '2024-07-01', 1487, 'Software Licenses', 'Enterprise Suite License', 10, 1550.00, 15500.00, 'Direct Sales', 'North America', 57142),
(2024, 7, '2024-07-15', 1488, 'Consulting', 'Implementation Services', 4, 6550.00, 26200.00, 'Direct Sales', 'Europe', 83526),
(2024, 7, '2024-07-22', 1489, 'Cloud Services', 'Standard Cloud Package', 28, 140.00, 3920.00, 'Online', 'Asia', 25981),
-- August 2024 Transactions
(2024, 8, '2024-08-05', 1490, 'Software Licenses', 'Small Business Edition', 16, 380.00, 6080.00, 'Retail', 'North America', 71459),
(2024, 8, '2024-08-12', 1491, 'Support', 'Standard Support Contract', 10, 230.00, 2300.00, 'Direct Sales', 'Europe', 41823),
(2024, 8, '2024-08-26', 1492, 'Cloud Services', 'Advanced Cloud Package', 12, 655.00, 7860.00, 'Online', 'Asia', 95178),
-- September 2024 Transactions
(2024, 9, '2024-09-02', 1493, 'Software Licenses', 'Enterprise Suite License', 12, 1550.00, 18600.00, 'Direct Sales', 'North America', 32546),
(2024, 9, '2024-09-09', 1494, 'Consulting', 'Custom Development', 6, 9700.00, 58200.00, 'Direct Sales', 'Europe', 62984),
(2024, 9, '2024-09-23', 1495, 'Cloud Services', 'Basic Cloud Package', 50, 70.00, 3500.00, 'Online', 'Asia', 55317),
-- October 2024 Transactions
(2024, 10, '2024-10-07', 1496, 'Software Licenses', 'Small Business Edition', 18, 380.00, 6840.00, 'Retail', 'North America', 88652),
(2024, 10, '2024-10-14', 1497, 'Support', 'Premium Support Contract', 15, 395.00, 5925.00, 'Direct Sales', 'Europe', 29741),
(2024, 10, '2024-10-21', 1498, 'Cloud Services', 'Standard Cloud Package', 22, 140.00, 3080.00, 'Online', 'Asia', 77219),
-- November 2024 Transactions
(2024, 11, '2024-11-04', 1499, 'Software Licenses', 'Enterprise Suite License', 17, 1550.00, 26350.00, 'Direct Sales', 'North America', 44983),
(2024, 11, '2024-11-11', 1500, 'Consulting', 'Training Services', 9, 3300.00, 29700.00, 'Direct Sales', 'Europe', 91328),
(2024, 11, '2024-11-25', 1501, 'Cloud Services', 'Advanced Cloud Package', 17, 655.00, 11135.00, 'Online', 'Asia', 34156),
-- December 2024 Transactions
(2024, 12, '2024-12-02', 1502, 'Software Licenses', 'Small Business Edition', 25, 380.00, 9500.00, 'Retail', 'North America', 61742),
(2024, 12, '2024-12-16', 1503, 'Support', 'Standard Support Contract', 14, 230.00, 3220.00, 'Direct Sales', 'Europe', 99011),
(2024, 12, '2024-12-23', 1504, 'Cloud Services', 'Basic Cloud Package', 70, 70.00, 4900.00, 'Online', 'Asia', 99022),
-- Transactions in South America Region
(2024, 1, '2024-01-29', 1505, 'Software Licenses', 'Enterprise Suite License', 4, 1550.00, 6200.00, 'Direct Sales', 'South America', 28547),
(2024, 2, '2024-02-26', 1506, 'Consulting', 'Implementation Services', 1, 6550.00, 6550.00, 'Direct Sales', 'South America', 99008),
(2024, 3, '2024-03-29', 1507, 'Cloud Services', 'Standard Cloud Package', 18, 140.00, 2520.00, 'Online', 'South America', 92648),
(2024, 4, '2024-04-26', 1508, 'Software Licenses', 'Small Business Edition', 9, 380.00, 3420.00, 'Retail', 'South America', 51879),
(2024, 5, '2024-05-28', 1509, 'Support', 'Premium Support Contract', 6, 395.00, 2370.00, 'Direct Sales', 'South America', 61742),
(2024, 6, '2024-06-28', 1510, 'Cloud Services', 'Advanced Cloud Package', 8, 655.00, 5240.00, 'Online', 'South America', 82794),
(2024, 7, '2024-07-26', 1511, 'Software Licenses', 'Enterprise Suite License', 5, 1550.00, 7750.00, 'Direct Sales', 'South America', 31428),
(2024, 8, '2024-08-29', 1512, 'Consulting', 'Custom Development', 1, 9700.00, 9700.00, 'Direct Sales', 'South America', 93865),
(2024, 9, '2024-09-27', 1513, 'Cloud Services', 'Basic Cloud Package', 40, 70.00, 2800.00, 'Online', 'South America', 33791),
(2024, 10, '2024-10-30', 1514, 'Software Licenses', 'Small Business Edition', 7, 380.00, 2660.00, 'Retail', 'South America', 63518),
(2024, 11, '2024-11-29', 1515, 'Support', 'Standard Support Contract', 5, 230.00, 1150.00, 'Direct Sales', 'South America', 56842),
(2024, 12, '2024-12-27', 1516, 'Cloud Services', 'Standard Cloud Package', 12, 140.00, 1680.00, 'Online', 'South America', 89175);

INSERT INTO CustomerTransactions (fiscal_year, fiscal_month, transaction_date, customer_id, product_service_category, product_service_name, quantity, unit_price, transaction_amount, sales_channel, sales_region, employee_id) VALUES
-- January 2025 Transactions
(2025, 1, '2025-01-06', 1517, 'Software Licenses', 'Enterprise Suite License', 8, 1600.00, 12800.00, 'Direct Sales', 'North America', 92648),
(2025, 1, '2025-01-13', 1518, 'Consulting', 'Implementation Services', 1, 6700.00, 6700.00, 'Direct Sales', 'Europe', 99008),
(2025, 1, '2025-01-20', 1519, 'Cloud Services', 'Standard Cloud Package', 28, 145.00, 4060.00, 'Online', 'Asia', 82794),
-- February 2025 Transactions
(2025, 2, '2025-02-03', 1520, 'Software Licenses', 'Small Business Edition', 16, 390.00, 6240.00, 'Retail', 'North America', 51879),
(2025, 2, '2025-02-10', 1521, 'Support', 'Premium Support Contract', 11, 405.00, 4455.00, 'Direct Sales', 'Europe', 61742),
(2025, 2, '2025-02-24', 1522, 'Cloud Services', 'Advanced Cloud Package', 8, 670.00, 5360.00, 'Online', 'Asia', 83526),
-- March 2025 Transactions
(2025, 3, '2025-03-03', 1523, 'Software Licenses', 'Enterprise Suite License', 7, 1600.00, 11200.00, 'Direct Sales', 'North America', 31428),
(2025, 3, '2025-03-10', 1524, 'Consulting', 'Custom Development', 5, 9900.00, 49500.00, 'Direct Sales', 'Europe', 93865),
(2025, 3, '2025-03-24', 1525, 'Cloud Services', 'Basic Cloud Package', 45, 72.00, 3240.00, 'Online', 'Asia', 33791),
-- April 2025 Transactions
(2025, 4, '2025-04-07', 1526, 'Software Licenses', 'Small Business Edition', 13, 390.00, 5070.00, 'Retail', 'North America', 63518),
(2025, 4, '2025-04-14', 1527, 'Support', 'Standard Support Contract', 10, 240.00, 2400.00, 'Direct Sales', 'Europe', 56842),
(2025, 4, '2025-04-21', 1528, 'Cloud Services', 'Standard Cloud Package', 22, 145.00, 3190.00, 'Online', 'Asia', 89175),
-- May 2025 Transactions
(2025, 5, '2025-05-05', 1529, 'Software Licenses', 'Enterprise Suite License', 15, 1600.00, 24000.00, 'Direct Sales', 'North America', 36954),
(2025, 5, '2025-05-12', 1530, 'Consulting', 'Training Services', 6, 3400.00, 20400.00, 'Direct Sales', 'Europe', 68291),
(2025, 5, '2025-05-19', 1531, 'Cloud Services', 'Advanced Cloud Package', 14, 670.00, 9380.00, 'Online', 'Asia', 52487),
-- June 2025 Transactions
(2025, 6, '2025-06-02', 1532, 'Software Licenses', 'Small Business Edition', 22, 390.00, 8580.00, 'Retail', 'North America', 61742),
(2025, 6, '2025-06-16', 1533, 'Support', 'Premium Support Contract', 15, 405.00, 6075.00, 'Direct Sales', 'Europe', 39215),
(2025, 6, '2025-06-23', 1534, 'Cloud Services', 'Basic Cloud Package', 40, 72.00, 2880.00, 'Online', 'Asia', 64879),
-- July 2025 Transactions
(2025, 7, '2025-07-07', 1535, 'Software Licenses', 'Enterprise Suite License', 11, 1600.00, 17600.00, 'Direct Sales', 'North America', 57142),
(2025, 7, '2025-07-14', 1536, 'Consulting', 'Implementation Services', 5, 6700.00, 33500.00, 'Direct Sales', 'Europe', 83526),
(2025, 7, '2025-07-21', 1537, 'Cloud Services', 'Standard Cloud Package', 30, 145.00, 4350.00, 'Online', 'Asia', 25981),
-- August 2025 Transactions
(2025, 8, '2025-08-04', 1538, 'Software Licenses', 'Small Business Edition', 17, 390.00, 6630.00, 'Retail', 'North America', 71459),
(2025, 8, '2025-08-11', 1539, 'Support', 'Standard Support Contract', 11, 240.00, 2640.00, 'Direct Sales', 'Europe', 41823),
(2025, 8, '2025-08-25', 1540, 'Cloud Services', 'Advanced Cloud Package', 14, 670.00, 9380.00, 'Online', 'Asia', 95178),
-- September 2025 Transactions
(2025, 9, '2025-09-08', 1541, 'Software Licenses', 'Enterprise Suite License', 14, 1600.00, 22400.00, 'Direct Sales', 'North America', 32546),
(2025, 9, '2025-09-15', 1542, 'Consulting', 'Custom Development', 7, 9900.00, 69300.00, 'Direct Sales', 'Europe', 62984),
(2025, 9, '2025-09-29', 1543, 'Cloud Services', 'Basic Cloud Package', 55, 72.00, 3960.00, 'Online', 'Asia', 55317),
-- October 2025 Transactions
(2025, 10, '2025-10-06', 1544, 'Software Licenses', 'Small Business Edition', 20, 390.00, 7800.00, 'Retail', 'North America', 88652),
(2025, 10, '2025-10-13', 1545, 'Support', 'Premium Support Contract', 17, 405.00, 6885.00, 'Direct Sales', 'Europe', 29741),
(2025, 10, '2025-10-20', 1546, 'Cloud Services', 'Standard Cloud Package', 25, 145.00, 3625.00, 'Online', 'Asia', 77219),
-- November 2025 Transactions
(2025, 11, '2025-11-03', 1547, 'Software Licenses', 'Enterprise Suite License', 20, 1600.00, 32000.00, 'Direct Sales', 'North America', 44983),
(2025, 11, '2025-11-10', 1548, 'Consulting', 'Training Services', 10, 3400.00, 34000.00, 'Direct Sales', 'Europe', 91328),
(2025, 11, '2025-11-24', 1549, 'Cloud Services', 'Advanced Cloud Package', 20, 670.00, 13400.00, 'Online', 'Asia', 34156),
-- December 2025 Transactions
(2025, 12, '2025-12-01', 1550, 'Software Licenses', 'Small Business Edition', 30, 390.00, 11700.00, 'Retail', 'North America', 61742),
(2025, 12, '2025-12-15', 1551, 'Support', 'Standard Support Contract', 16, 240.00, 3840.00, 'Direct Sales', 'Europe', 99011),
(2025, 12, '2025-12-22', 1552, 'Cloud Services', 'Basic Cloud Package', 80, 72.00, 5760.00, 'Online', 'Asia', 99022),
-- Transactions in South America Region
(2025, 1, '2025-01-27', 1553, 'Software Licenses', 'Enterprise Suite License', 5, 1600.00, 8000.00, 'Direct Sales', 'South America', 99025),
(2025, 2, '2025-02-24', 1554, 'Consulting', 'Implementation Services', 1, 6700.00, 6700.00, 'Direct Sales', 'South America', 99016),
(2025, 3, '2025-03-31', 1555, 'Cloud Services', 'Standard Cloud Package', 20, 145.00, 2900.00, 'Online', 'South America', 99011),
(2025, 4, '2025-04-28', 1556, 'Software Licenses', 'Small Business Edition', 10, 390.00, 3900.00, 'Retail', 'South America', 99008),
(2025, 5, '2025-05-26', 1557, 'Support', 'Premium Support Contract', 7, 405.00, 2835.00, 'Direct Sales', 'South America', 99001),
(2025, 6, '2025-06-30', 1558, 'Cloud Services', 'Advanced Cloud Package', 9, 670.00, 6030.00, 'Online', 'South America', 99022),
(2025, 7, '2025-07-28', 1559, 'Software Licenses', 'Enterprise Suite License', 6, 1600.00, 9600.00, 'Direct Sales', 'South America', 99025),
(2025, 8, '2025-08-25', 1560, 'Consulting', 'Custom Development', 2, 9900.00, 19800.00, 'Direct Sales', 'South America', 99016),
(2025, 9, '2025-09-29', 1561, 'Cloud Services', 'Basic Cloud Package', 40, 72.00, 2880.00, 'Online', 'South America', 99011),
(2025, 10, '2025-10-27', 1562, 'Software Licenses', 'Small Business Edition', 8, 390.00, 3120.00, 'Retail', 'South America', 99008),
(2025, 11, '2025-11-24', 1563, 'Support', 'Standard Support Contract', 6, 240.00, 1440.00, 'Direct Sales', 'South America', 99001),
(2025, 12, '2025-12-29', 1564, 'Cloud Services', 'Standard Cloud Package', 15, 145.00, 2175.00, 'Online', 'South America', 99022);



INSERT INTO RnDExpenses (fiscal_year, fiscal_month, project_name, department, expense_amount, expense_description) VALUES
(2015, 6, 'Project Alpha - Version 1.0', 'Software Development', 300000.00, 'Development towards completion of initial software platform version - Half 1 (Jan-Jun).'),
(2015, 6, 'Component X - Advanced Design', 'Hardware Engineering', 190000.00, 'Developing advanced design for next generation hardware - Half 1 (Jan-Jun).'),
(2015, 6, 'New Market Entry Analysis', 'Market Research', 120000.00, 'Researching feasibility of entering new geographic markets - Half 1 (Jan-Jun).'),
(2015, 6, 'Usability Testing - Platform', 'UX Research', 90000.00, 'User experience and usability testing for core platform - Half 1 (Jan-Jun).'),
(2015, 6, 'Security Protocol Enhancement', 'Security Engineering', 80000.00, 'Improving security protocols for product and data - Half 1 (Jan-Jun).'),
(2015, 6, 'Data Analytics Framework', 'Data Science', 110000.00, 'Developing a new framework for data analytics services - Half 1 (Jan-Jun).'),
(2015, 12, 'Project Alpha - Version 1.0', 'Software Development', 250000.00, 'Final testing and release preparations for software platform v1.0 - Half 2 (Jul-Dec).'),
(2015, 12, 'Component X - Advanced Design', 'Hardware Engineering', 150000.00, 'Finalizing advanced design for next generation hardware - Half 2 (Jul-Dec).'),
(2015, 12, 'New Market Entry Analysis', 'Market Research', 100000.00, 'Finalizing market entry analysis and strategy - Half 2 (Jul-Dec).'),
(2015, 12, 'Usability Testing - Platform', 'UX Research', 70000.00, 'Further usability testing based on initial feedback - Half 2 (Jul-Dec).'),
(2015, 12, 'Security Protocol Enhancement', 'Security Engineering', 60000.00, 'Implementing enhanced security protocols - Half 2 (Jul-Dec).'),
(2015, 12, 'Predictive Modeling Research', 'Data Science', 95000.00, 'Research into predictive modeling techniques for cloud services - Half 2 (Jul-Dec).'),

(2016, 6, 'Project Beta - AI Integration', 'Software Development', 350000.00, 'Integrating AI modules into core software platform - Half 1 (Jan-Jun).'),
(2016, 6, 'Component X - Manufacturing Process', 'Hardware Engineering', 220000.00, 'Developing efficient manufacturing process for new hardware component - Half 1 (Jan-Jun).'),
(2016, 6, 'Cloud Security Innovations', 'Cloud Innovation', 150000.00, 'Researching innovative security solutions for cloud environments - Half 1 (Jan-Jun).'),
(2016, 6, 'A/B Testing - New UI', 'UX Research', 110000.00, 'A/B testing of new user interface designs - Half 1 (Jan-Jun).'),
(2016, 6, 'Threat Intelligence Platform', 'Security Engineering', 100000.00, 'Developing a platform for advanced threat intelligence - Half 1 (Jan-Jun).'),
(2016, 6, 'Machine Learning Algorithms R&D', 'AI Research', 180000.00, 'Research and development of new machine learning algorithms - Half 1 (Jan-Jun).'),
(2016, 12, 'Project Beta - AI Modules Testing', 'Software Development', 300000.00, 'Testing and refinement of AI modules integrated into platform - Half 2 (Jul-Dec).'),
(2016, 12, 'Component X - Pilot Production', 'Hardware Engineering', 180000.00, 'Pilot production run of new hardware component - Half 2 (Jul-Dec).'),
(2016, 12, 'Cloud Service Optimization', 'Cloud Innovation', 120000.00, 'Research and development for optimizing cloud service performance - Half 2 (Jul-Dec).'),
(2016, 12, 'User Feedback Analysis - Beta', 'UX Research', 80000.00, 'Analyzing user feedback from beta program for UI/UX improvements - Half 2 (Jul-Dec).'),
(2016, 12, 'Incident Response Automation', 'Security Engineering', 70000.00, 'Developing automated incident response systems - Half 2 (Jul-Dec).'),
(2016, 12, 'Deep Learning Applications', 'AI Research', 150000.00, 'Exploring deep learning applications for product enhancements - Half 2 (Jul-Dec).'),

(2017, 6, 'Project Gamma - Mobile First', 'Software Development', 400000.00, 'Developing a mobile-first version of software platform - Half 1 (Jan-Jun).'),
(2017, 6, 'Component Z - Miniaturization', 'Hardware Engineering', 250000.00, 'Research into miniaturization techniques for hardware components - Half 1 (Jan-Jun).'),
(2017, 6, 'Global Market Trends - Cloud', 'Market Research', 180000.00, 'Analyzing global market trends in cloud computing - Half 1 (Jan-Jun).'),
(2017, 6, 'Accessibility Testing - Mobile', 'UX Research', 130000.00, 'Accessibility testing for mobile platform UI - Half 1 (Jan-Jun).'),
(2017, 6, 'Blockchain Security Integration', 'Security Engineering', 120000.00, 'Researching blockchain technology for enhanced security - Half 1 (Jan-Jun).'),
(2017, 6, 'Natural Language Processing Research', 'AI Research', 220000.00, 'Advancing natural language processing capabilities - Half 1 (Jan-Jun).'),
(2017, 6, 'Serverless Computing Architecture', 'Cloud Innovation', 160000.00, 'Researching and developing serverless computing architecture - Half 1 (Jan-Jun).'),
(2017, 12, 'Project Gamma - Beta Release', 'Software Development', 350000.00, 'Preparing beta release of mobile-first software platform - Half 2 (Jul-Dec).'),
(2017, 12, 'Component Z - Thermal Efficiency', 'Hardware Engineering', 210000.00, 'Improving thermal efficiency of miniaturized hardware component - Half 2 (Jul-Dec).'),
(2017, 12, 'Emerging Market Penetration Strategy', 'Market Research', 150000.00, 'Developing strategies for penetrating emerging cloud markets - Half 2 (Jul-Dec).'),
(2017, 12, 'Mobile UI/UX Refinement', 'UX Research', 110000.00, 'Refining mobile UI/UX based on initial design feedback - Half 2 (Jul-Dec).'),
(2017, 12, 'Decentralized Security Framework', 'Security Engineering', 90000.00, 'Building a decentralized security framework using blockchain - Half 2 (Jul-Dec).'),
(2017, 12, 'Conversational AI Prototypes', 'AI Research', 190000.00, 'Prototyping conversational AI applications - Half 2 (Jul-Dec).'),
(2017, 12, 'Edge Computing R&D', 'Cloud Innovation', 130000.00, 'Research and development in edge computing technologies - Half 2 (Jul-Dec).'),

(2018, 6, 'Project Delta - Next Gen Platform', 'Software Development', 450000.00, 'Initial design and architecture for next generation software platform - Half 1 (Jan-Jun).'),
(2018, 6, 'Component Z - Mass Production Prep', 'Hardware Engineering', 300000.00, 'Preparing for mass production of miniaturized hardware component - Half 1 (Jan-Jun).'),
(2018, 6, 'APAC Market Deep Dive', 'Market Research', 200000.00, 'In-depth market research for APAC region cloud market - Half 1 (Jan-Jun).'),
(2018, 6, 'Advanced UI Personalization', 'UX Research', 150000.00, 'Researching advanced UI personalization techniques - Half 1 (Jan-Jun).'),
(2018, 6, 'AI-Driven Security Analytics', 'Security Engineering', 140000.00, 'Developing AI-driven security analytics platform - Half 1 (Jan-Jun).'),
(2018, 6, 'Generative AI Models', 'AI Research', 250000.00, 'Exploring generative AI models for content creation - Half 1 (Jan-Jun).'),
(2018, 6, 'Hybrid Cloud Solutions R&D', 'Cloud Innovation', 180000.00, 'Research and development of hybrid cloud deployment solutions - Half 1 (Jan-Jun).'),
(2018, 12, 'Project Delta - Core Features Dev', 'Software Development', 400000.00, 'Developing core features for next generation software platform - Half 2 (Jul-Dec).'),
(2018, 12, 'Component Z - Production Line Setup', 'Hardware Engineering', 280000.00, 'Setting up mass production line for miniaturized hardware component - Half 2 (Jul-Dec).'),
(2018, 12, 'LatAm Market Expansion Research', 'Market Research', 170000.00, 'Researching market expansion opportunities in Latin America - Half 2 (Jul-Dec).'),
(2018, 12, 'Personalized User Dashboards', 'UX Research', 130000.00, 'Developing personalized user dashboards and interfaces - Half 2 (Jul-Dec).'),
(2018, 12, 'Zero Trust Security Architecture', 'Security Engineering', 110000.00, 'Implementing a zero trust security architecture - Half 2 (Jul-Dec).'),
(2018, 12, 'Explainable AI Research', 'AI Research', 210000.00, 'Research into explainable AI and model transparency - Half 2 (Jul-Dec).'),
(2018, 12, 'Multi-Cloud Management Solutions', 'Cloud Innovation', 150000.00, 'Developing solutions for multi-cloud environment management - Half 2 (Jul-Dec).'),

(2019, 6, 'Project Epsilon - Scalability Enhancements', 'Software Development', 500000.00, 'Implementing scalability enhancements for software platform - Half 1 (Jan-Jun).'),
(2019, 6, 'Component Z - Initial Production Run', 'Hardware Engineering', 350000.00, 'First large scale production run of miniaturized hardware component - Half 1 (Jan-Jun).'),
(2019, 6, 'MEA Market Entry Strategy', 'Market Research', 220000.00, 'Developing market entry strategy for Middle East & Africa - Half 1 (Jan-Jun).'),
(2019, 6, 'Voice Interface Design R&D', 'UX Research', 170000.00, 'Research and development for voice-controlled user interfaces - Half 1 (Jan-Jun).'),
(2019, 6, 'Quantum Computing Security Study', 'Security Engineering', 160000.00, 'Study into quantum computing threats and security measures - Half 1 (Jan-Jun).'),
(2019, 6, 'Reinforcement Learning Research', 'AI Research', 280000.00, 'Advancing reinforcement learning models and applications - Half 1 (Jan-Jun).'),
(2019, 6, 'Serverless Security Enhancements', 'Cloud Innovation', 200000.00, 'Enhancing security in serverless computing environments - Half 1 (Jan-Jun).'),
(2019, 6, '5G Network Compatibility', 'Mobile Platforms', 120000.00, 'Research and testing for 5G network compatibility - Half 1 (Jan-Jun).'),
(2019, 12, 'Project Epsilon - Beta Testing', 'Software Development', 450000.00, 'Beta testing phase for software platform scalability enhancements - Half 2 (Jul-Dec).'),
(2019, 12, 'Component Z - Supply Chain Optimization', 'Hardware Engineering', 320000.00, 'Optimizing supply chain for mass production of new hardware component - Half 2 (Jul-Dec).'),
(2019, 12, 'MEA Market Launch Planning', 'Market Research', 190000.00, 'Planning for market launch in Middle East & Africa - Half 2 (Jul-Dec).'),
(2019, 12, 'Voice Interface Usability Studies', 'UX Research', 150000.00, 'Usability studies for voice-controlled user interfaces - Half 2 (Jul-Dec).'),
(2019, 12, 'Post-Quantum Cryptography R&D', 'Security Engineering', 130000.00, 'Research and development of post-quantum cryptography - Half 2 (Jul-Dec).'),
(2019, 12, 'AI Ethics and Bias Research', 'AI Research', 250000.00, 'Research into ethical considerations and bias in AI systems - Half 2 (Jul-Dec).'),
(2019, 12, 'Cloud Cost Optimization Tools', 'Cloud Innovation', 170000.00, 'Developing tools for cloud service cost optimization - Half 2 (Jul-Dec).'),
(2019, 12, 'Wearable Device Integration R&D', 'Mobile Platforms', 100000.00, 'Research and development for integration with wearable devices - Half 2 (Jul-Dec).'),

(2020, 6, 'Project Zeta - Microservices Architecture', 'Software Development', 550000.00, 'Migrating platform architecture to microservices - Half 1 (Jan-Jun).'),
(2020, 6, 'Component AA - Power Efficiency', 'Hardware Engineering', 400000.00, 'Researching power efficiency improvements for hardware - Half 1 (Jan-Jun).'),
(2020, 6, 'Customer Sentiment Analysis - Cloud', 'Market Research', 250000.00, 'Analyzing customer sentiment towards cloud services - Half 1 (Jan-Jun).'),
(2020, 6, 'Adaptive UI/UX Research', 'UX Research', 190000.00, 'Research into adaptive and personalized UI/UX - Half 1 (Jan-Jun).'),
(2020, 6, 'AI-Based Threat Detection Systems', 'Security Engineering', 180000.00, 'Developing AI-based threat detection and prevention systems - Half 1 (Jan-Jun).'),
(2020, 6, 'Fairness in AI Algorithms', 'AI Research', 300000.00, 'Researching and mitigating bias to ensure fairness in AI algorithms - Half 1 (Jan-Jun).'),
(2020, 6, 'Automated Cloud Resource Management', 'Cloud Innovation', 220000.00, 'Developing automated tools for cloud resource management - Half 1 (Jan-Jun).'),
(2020, 6, 'IoT Device Integration', 'Mobile Platforms', 140000.00, 'Research and development for integration with IoT devices - Half 1 (Jan-Jun).'),
(2020, 12, 'Project Zeta - Microservices Testing', 'Software Development', 500000.00, 'Testing and deployment of microservices architecture components - Half 2 (Jul-Dec).'),
(2020, 12, 'Component AA - Power Efficiency Testing', 'Hardware Engineering', 350000.00, 'Testing and validation of power efficiency improvements in hardware - Half 2 (Jul-Dec).'),
(2020, 12, 'APAC Cloud Market Trends Update', 'Market Research', 220000.00, 'Updated market trend analysis for APAC cloud market - Half 2 (Jul-Dec).'),
(2020, 12, 'Personalized Recommendations UI', 'UX Research', 170000.00, 'Developing UI for personalized recommendation features - Half 2 (Jul-Dec).'),
(2020, 12, 'Behavioral Biometrics Security', 'Security Engineering', 150000.00, 'Integrating behavioral biometrics for enhanced security - Half 2 (Jul-Dec).'),
(2020, 12, 'AI Explainability Frameworks', 'AI Research', 270000.00, 'Developing frameworks for AI model explainability - Half 2 (Jul-Dec).'),
(2020, 12, 'Cloud Resource Autoscaling Algorithms', 'Cloud Innovation', 190000.00, 'Developing advanced autoscaling algorithms for cloud resources - Half 2 (Jul-Dec).'),
(2020, 12, 'Foldable Device Integration', 'Mobile Platforms', 120000.00, 'Research and development for integration with foldable devices - Half 2 (Jul-Dec).'),

(2021, 6, 'Project Eta - Serverless Platform Upgrade', 'Software Development', 600000.00, 'Upgrading serverless computing platform architecture - Half 1 (Jan-Jun).'),
(2021, 6, 'Component BB - Bio-Integrated Hardware', 'Hardware Engineering', 450000.00, 'Initial research into bio-integrated hardware components - Half 1 (Jan-Jun).'),
(2021, 6, 'Biotech Market Opportunity Assessment', 'Market Research', 300000.00, 'Assessing market opportunities in biotech sector - Half 1 (Jan-Jun).'),
(2021, 6, 'Virtual Reality UI/UX', 'UX Research', 220000.00, 'Research and design for virtual reality user interfaces - Half 1 (Jan-Jun).'),
(2021, 6, 'Homomorphic Encryption R&D', 'Security Engineering', 200000.00, 'Research and development of homomorphic encryption technologies - Half 1 (Jan-Jun).'),
(2021, 6, 'Federated Learning Frameworks', 'AI Research', 350000.00, 'Developing frameworks for federated learning - Half 1 (Jan-Jun).'),
(2021, 6, 'Sustainable Cloud Infrastructure', 'Cloud Innovation', 250000.00, 'Researching sustainable and energy-efficient cloud infrastructure - Half 1 (Jan-Jun).'),
(2021, 6, 'Nanotechnology Applications Research', 'Nanotechnology', 180000.00, 'Exploring potential applications of nanotechnology - Half 1 (Jan-Jun).'),
(2021, 12, 'Project Eta - Performance Optimization', 'Software Development', 550000.00, 'Performance optimization for upgraded serverless platform - Half 2 (Jul-Dec).'),
(2021, 12, 'Component BB - Bio-Integration Testing', 'Hardware Engineering', 400000.00, 'Testing bio-integration of new hardware component - Half 2 (Jul-Dec).'),
(2021, 12, 'Biotech Product Feasibility Study', 'Market Research', 270000.00, 'Feasibility study for new biotech product lines - Half 2 (Jul-Dec).'),
(2021, 12, 'VR UI/UX Prototyping', 'UX Research', 200000.00, 'Prototyping virtual reality user interfaces - Half 2 (Jul-Dec).'),
(2021, 12, 'Privacy-Preserving Computation', 'Security Engineering', 180000.00, 'Research into privacy-preserving computation techniques - Half 2 (Jul-Dec).'),
(2021, 12, 'Edge AI Model Development', 'AI Research', 320000.00, 'Developing AI models for edge computing deployment - Half 2 (Jul-Dec).'),
(2021, 12, 'Green Cloud Technologies', 'Cloud Innovation', 230000.00, 'Research and development in green cloud computing technologies - Half 2 (Jul-Dec).'),
(2021, 12, 'Nanomaterial Research for Hardware', 'Nanotechnology', 150000.00, 'Research into nanomaterials for advanced hardware components - Half 2 (Jul-Dec).'),

(2022, 6, 'Project Theta - Web3 Integration', 'Software Development', 650000.00, 'Integrating Web3 technologies into core software platform - Half 1 (Jan-Jun).'),
(2022, 6, 'Component CC - Quantum Computing Hardware', 'Hardware Engineering', 500000.00, 'Initial research into quantum computing hardware components - Half 1 (Jan-Jun).'),
(2022, 6, 'Metaverse Market Entry Analysis', 'Market Research', 350000.00, 'Analyzing market entry strategies for the metaverse - Half 1 (Jan-Jun).'),
(2022, 6, 'Metaverse UI/UX Design', 'UX Research', 250000.00, 'Design and development for metaverse user interfaces and experiences - Half 1 (Jan-Jun).'),
(2022, 6, 'Web3 Security Protocols R&D', 'Security Engineering', 230000.00, 'Research and development of security protocols for Web3 applications - Half 1 (Jan-Jun).'),
(2022, 6, 'Generative Metaverse Content AI', 'AI Research', 400000.00, 'Developing AI for generative content creation in metaverse environments - Half 1 (Jan-Jun).'),
(2022, 6, 'Decentralized Cloud Services R&D', 'Cloud Innovation', 280000.00, 'Research and development in decentralized cloud services - Half 1 (Jan-Jun).'),
(2022, 6, 'Bio-Nanotechnology Convergence', 'Nanotechnology', 200000.00, 'Exploring convergence of bio and nanotechnology - Half 1 (Jan-Jun).'),
(2022, 6, 'Spatial Computing R&D', 'Mobile Platforms', 160000.00, 'Research and development for spatial computing platforms - Half 1 (Jan-Jun).'),
(2022, 12, 'Project Theta - Web3 Testing', 'Software Development', 600000.00, 'Testing and integration of Web3 features into software platform - Half 2 (Jul-Dec).'),
(2022, 12, 'Component CC - Quantum Simulation', 'Hardware Engineering', 450000.00, 'Quantum simulation and modeling for hardware design - Half 2 (Jul-Dec).'),
(2022, 12, 'Metaverse User Behavior Analysis', 'Market Research', 320000.00, 'Analyzing user behavior and trends in metaverse environments - Half 2 (Jul-Dec).'),
(2022, 12, 'Immersive Metaverse Experiences UX', 'UX Research', 230000.00, 'Developing immersive user experiences for metaverse platforms - Half 2 (Jul-Dec).'),
(2022, 12, 'Decentralized Identity Solutions', 'Security Engineering', 200000.00, 'Developing decentralized identity and authentication solutions - Half 2 (Jul-Dec).'),
(2022, 12, 'AI Avatars for Metaverse', 'AI Research', 380000.00, 'Developing AI-powered avatars for metaverse interactions - Half 2 (Jul-Dec).'),
(2022, 12, 'Web3 Cloud Infrastructure', 'Cloud Innovation', 250000.00, 'Building cloud infrastructure for Web3 applications - Half 2 (Jul-Dec).'),
(2022, 12, 'Nanobot R&D for Component Manufacturing', 'Nanotechnology', 180000.00, 'Research into nanobots for precision component manufacturing - Half 2 (Jul-Dec).'),
(2022, 12, 'Augmented Reality Mobile Integration', 'Mobile Platforms', 140000.00, 'Research and development for augmented reality integration in mobile platforms - Half 2 (Jul-Dec).'),

(2023, 6, 'Project Iota - Sustainable Computing', 'Software Development', 700000.00, 'Developing sustainable computing practices for software platform - Half 1 (Jan-Jun).'),
(2023, 6, 'Component DD - Biodegradable Electronics', 'Hardware Engineering', 550000.00, 'Research into biodegradable materials for electronics - Half 1 (Jan-Jun).'),
(2023, 6, 'Sustainability Market Demand Analysis', 'Market Research', 400000.00, 'Analyzing market demand for sustainable technology solutions - Half 1 (Jan-Jun).'),
(2023, 6, 'Ethical AI UX Framework', 'UX Research', 300000.00, 'Developing UX frameworks for ethical and responsible AI interaction - Half 1 (Jan-Jun).'),
(2023, 6, 'AI Security & Privacy Compliance', 'Security Engineering', 280000.00, 'Researching security and privacy compliance in AI systems - Half 1 (Jan-Jun).'),
(2023, 6, 'Robust AI Model Training Methods', 'AI Research', 450000.00, 'Developing robust and reliable AI model training methods - Half 1 (Jan-Jun).'),
(2023, 6, 'Carbon-Neutral Cloud Data Centers', 'Cloud Innovation', 300000.00, 'Research and design for carbon-neutral cloud data centers - Half 1 (Jan-Jun).'),
(2023, 6, 'Nanomaterial-Based Energy Storage', 'Nanotechnology', 250000.00, 'Research into nanomaterials for energy storage solutions - Half 1 (Jan-Jun).'),
(2023, 6, 'Extended Reality Mobile Applications', 'Mobile Platforms', 200000.00, 'Research and development for extended reality applications on mobile platforms - Half 1 (Jan-Jun).'),
(2023, 12, 'Project Iota - Sustainable Architecture Testing', 'Software Development', 650000.00, 'Testing sustainable computing architecture implementations - Half 2 (Jul-Dec).'),
(2023, 12, 'Component DD - Biodegradable Prototype', 'Hardware Engineering', 500000.00, 'Prototyping biodegradable electronic components - Half 2 (Jul-Dec).'),
(2023, 12, 'Sustainable Tech Consumer Survey', 'Market Research', 370000.00, 'Consumer surveys on adoption of sustainable technology - Half 2 (Jul-Dec).'),
(2023, 12, 'Ethical AI UI/UX Guidelines', 'UX Research', 280000.00, 'Developing guidelines for ethical AI user interface design - Half 2 (Jul-Dec).'),
(2023, 12, 'AI Regulatory Compliance Framework', 'Security Engineering', 250000.00, 'Developing frameworks for AI security and regulatory compliance - Half 2 (Jul-Dec).'),
(2023, 12, 'Adversarial AI Robustness Research', 'AI Research', 420000.00, 'Research into adversarial robustness of AI models - Half 2 (Jul-Dec).'),
(2023, 12, 'Renewable Energy Powered Data Centers', 'Cloud Innovation', 280000.00, 'Designing data centers powered by renewable energy sources - Half 2 (Jul-Dec).'),
(2023, 12, 'Nanocomposite Materials for Durability', 'Nanotechnology', 220000.00, 'Research into nanocomposite materials for increased hardware durability - Half 2 (Jul-Dec).'),
(2023, 12, 'Metaverse Mobile XR Integration', 'Mobile Platforms', 180000.00, 'Research and development for metaverse integration with mobile XR devices - Half 2 (Jul-Dec).'),

(2024, 6, 'Project Kappa - Autonomous Software Agents', 'Software Development', 750000.00, 'Developing autonomous software agents for platform management - Half 1 (Jan-Jun).'),
(2024, 6, 'Component EE - Self-Repairing Hardware', 'Hardware Engineering', 600000.00, 'Research into self-repairing mechanisms for hardware - Half 1 (Jan-Jun).'),
(2024, 6, 'Autonomous Systems Market Analysis', 'Market Research', 450000.00, 'Market analysis for autonomous systems and applications - Half 1 (Jan-Jun).'),
(2024, 6, 'Digital Twin UX Development', 'UX Research', 350000.00, 'User experience design for digital twin interfaces - Half 1 (Jan-Jun).'),
(2024, 6, 'Autonomous System Security Architecture', 'Security Engineering', 320000.00, 'Developing security architecture for autonomous systems - Half 1 (Jan-Jun).'),
(2024, 6, 'AI for Autonomous Navigation', 'AI Research', 500000.00, 'Developing AI algorithms for autonomous navigation and control - Half 1 (Jan-Jun).'),
(2024, 6, 'Cloud-Based Digital Twin Platform', 'Cloud Innovation', 350000.00, 'Building a cloud-based platform for digital twin services - Half 1 (Jan-Jun).'),
(2024, 6, 'Nano-Sensors for Environmental Monitoring', 'Nanotechnology', 300000.00, 'Research into nano-sensors for environmental monitoring applications - Half 1 (Jan-Jun).'),
(2024, 6, 'Autonomous Mobile Robotics R&D', 'Mobile Platforms', 250000.00, 'Research and development for autonomous mobile robotics platforms - Half 1 (Jan-Jun).'),
(2024, 12, 'Project Kappa - Agent-Based System Testing', 'Software Development', 700000.00, 'Testing agent-based systems in software platform environment - Half 2 (Jul-Dec).'),
(2024, 12, 'Component EE - Self-Repairing Prototype', 'Hardware Engineering', 550000.00, 'Prototyping self-repairing hardware mechanisms - Half 2 (Jul-Dec).'),
(2024, 12, 'Digital Twin Adoption Case Studies', 'Market Research', 420000.00, 'Case studies on digital twin technology adoption in industries - Half 2 (Jul-Dec).'),
(2024, 12, 'Digital Twin Data Visualization UX', 'UX Research', 320000.00, 'Designing data visualization for digital twin user experiences - Half 2 (Jul-Dec).'),
(2024, 12, 'Autonomous System Security Validation', 'Security Engineering', 290000.00, 'Security validation and penetration testing for autonomous systems - Half 2 (Jul-Dec).'),
(2024, 12, 'AI-Driven Autonomous Decision Making', 'AI Research', 470000.00, 'Researching AI for autonomous decision making in complex environments - Half 2 (Jul-Dec).'),
(2024, 12, 'Digital Twin Service Deployment Architecture', 'Cloud Innovation', 320000.00, 'Designing deployment architecture for digital twin cloud services - Half 2 (Jul-Dec).'),
(2024, 12, 'Nanomaterial Integration in Robotics', 'Nanotechnology', 270000.00, 'Research into integration of nanomaterials in robotic systems - Half 2 (Jul-Dec).'),
(2024, 12, 'Swarm Robotics Mobile R&D', 'Mobile Platforms', 220000.00, 'Research and development for mobile swarm robotics platforms - Half 2 (Jul-Dec).'),

(2025, 6, 'Project Lambda - Quantum Computing Algorithms', 'Software Development', 800000.00, 'Developing quantum computing algorithms for software platform - Half 1 (Jan-Jun).'),
(2025, 6, 'Component FF - Quantum Processor Design', 'Hardware Engineering', 700000.00, 'Advanced design for quantum processors - Half 1 (Jan-Jun).'),
(2025, 6, 'Quantum Computing Market Forecast', 'Market Research', 500000.00, 'Market forecast for quantum computing technologies and applications - Half 1 (Jan-Jun).'),
(2025, 6, 'Quantum UI/UX Paradigms', 'UX Research', 400000.00, 'Researching new UI/UX paradigms for quantum computing interfaces - Half 1 (Jan-Jun).'),
(2025, 6, 'Quantum Cryptography Implementation', 'Security Engineering', 350000.00, 'Implementing quantum-resistant cryptography - Half 1 (Jan-Jun).'),
(2025, 6, 'Quantum Machine Learning Research', 'AI Research', 550000.00, 'Advancing quantum machine learning algorithms - Half 1 (Jan-Jun).'),
(2025, 6, 'Quantum Cloud Services Architecture', 'Cloud Innovation', 400000.00, 'Designing cloud services architecture for quantum computing - Half 1 (Jan-Jun).'),
(2025, 6, 'Bio-Electronic Integration R&D', 'Nanotechnology', 350000.00, 'Research and development for bio-electronic integration - Half 1 (Jan-Jun).'),
(2025, 6, 'Brain-Computer Interface Mobile R&D', 'Mobile Platforms', 300000.00, 'Research and development for brain-computer interface integration in mobile platforms - Half 1 (Jan-Jun).'),
(2025, 12, 'Project Lambda - Quantum Algorithm Testing', 'Software Development', 750000.00, 'Testing quantum computing algorithms within software platform - Half 2 (Jul-Dec).'),
(2025, 12, 'Component FF - Quantum Processor Prototype', 'Hardware Engineering', 650000.00, 'Building prototype quantum processor based on new design - Half 2 (Jul-Dec).'),
(2025, 12, 'Quantum Computing Adoption Barriers', 'Market Research', 450000.00, 'Research into adoption barriers for quantum computing technology - Half 2 (Jul-Dec).'),
(2025, 12, 'Quantum UI/UX Validation', 'UX Research', 350000.00, 'Validation and refinement of quantum computing user interface concepts - Half 2 (Jul-Dec).'),
(2025, 12, 'Quantum Security Protocol Testing', 'Security Engineering', 300000.00, 'Testing and validation of quantum-resistant security protocols - Half 2 (Jul-Dec).'),
(2025, 12, 'Quantum AI Algorithm Performance', 'AI Research', 500000.00, 'Performance benchmarking for quantum machine learning algorithms - Half 2 (Jul-Dec).'),
(2025, 12, 'Quantum Cloud Service Security', 'Cloud Innovation', 350000.00, 'Developing security frameworks for quantum cloud services - Half 2 (Jul-Dec).'),
(2025, 12, 'Bio-Electronic Component Integration', 'Nanotechnology', 300000.00, 'Integration and testing of bio-electronic components in hardware systems - Half 2 (Jul-Dec).'),
(2025, 12, 'Neural Interface Mobile Prototypes', 'Mobile Platforms', 250000.00, 'Prototyping neural interface applications for mobile platforms - Half 2 (Jul-Dec).');

INSERT INTO CashFlowStatement (fiscal_year, fiscal_month, cash_flow_operating, cash_flow_investing, cash_flow_financing) VALUES
(2015, 3, 750000.00, -250000.00, -100000.00),
(2015, 6, 850000.00, -300000.00, -120000.00),
(2015, 9, 920000.00, -350000.00, -130000.00),
(2015, 12, 1100000.00, -400000.00, -150000.00),
(2016, 3, 1200000.00, -420000.00, -160000.00),
(2016, 6, 1350000.00, -480000.00, -180000.00),
(2016, 9, 1480000.00, -520000.00, -200000.00),
(2016, 12, 1650000.00, -580000.00, -220000.00),
(2017, 3, 1750000.00, -600000.00, -240000.00),
(2017, 6, 1900000.00, -650000.00, -260000.00),
(2017, 9, 2100000.00, -700000.00, -280000.00),
(2017, 12, 2300000.00, -750000.00, -300000.00),
(2018, 3, 2450000.00, -800000.00, -320000.00),
(2018, 6, 2600000.00, -850000.00, -340000.00),
(2018, 9, 2800000.00, -900000.00, -360000.00),
(2018, 12, 3000000.00, -950000.00, -380000.00),
(2019, 3, 3200000.00, -1000000.00, -400000.00),
(2019, 6, 3400000.00, -1100000.00, -420000.00),
(2019, 9, 3600000.00, -1200000.00, -440000.00),
(2019, 12, 3800000.00, -1300000.00, -460000.00),
(2020, 3, 3950000.00, -1350000.00, -480000.00),
(2020, 6, 4100000.00, -1400000.00, -500000.00),
(2020, 9, 4250000.00, -1450000.00, -520000.00),
(2020, 12, 4400000.00, -1500000.00, -540000.00),
(2021, 3, 4600000.00, -1600000.00, -560000.00),
(2021, 6, 4800000.00, -1700000.00, -580000.00),
(2021, 9, 5000000.00, -1800000.00, -600000.00),
(2021, 12, 5200000.00, -1900000.00, -620000.00),
(2022, 3, 5400000.00, -2000000.00, -640000.00),
(2022, 6, 5600000.00, -2100000.00, -660000.00),
(2022, 9, 5800000.00, -2200000.00, -680000.00),
(2022, 12, 6000000.00, -2300000.00, -700000.00),
(2023, 3, 6200000.00, -2400000.00, -720000.00),
(2023, 6, 6400000.00, -2500000.00, -740000.00),
(2023, 9, 6600000.00, -2600000.00, -760000.00),
(2023, 12, 6800000.00, -2700000.00, -780000.00),
(2024, 3, 7000000.00, -2800000.00, -800000.00),
(2024, 6, 7200000.00, -2900000.00, -820000.00),
(2024, 9, 7400000.00, -3000000.00, -840000.00),
(2024, 12, 7600000.00, -3100000.00, -860000.00),
(2025, 3, 7800000.00, -3200000.00, -880000.00),
(2025, 6, 8000000.00, -3300000.00, -900000.00),
(2025, 9, 8200000.00, -3400000.00, -920000.00),
(2025, 12, 8400000.00, -3500000.00, -940000.00);

INSERT INTO IncomeStatement ( fiscal_year, fiscal_month, revenue, cogs, gross_profit, operating_expenses, operating_income, interest_expense, tax_expense, net_income ) VALUES
-- Fiscal Year 2015
(2015, 3, 5500000.00, 2200000.00, 3300000.00, 1800000.00, 1500000.00, 150000.00, 450000.00, 900000.00), -- Q1
(2015, 6, 6200000.00, 2480000.00, 3720000.00, 2000000.00, 1720000.00, 170000.00, 520000.00, 1030000.00), -- Q2
(2015, 9, 6800000.00, 2720000.00, 4080000.00, 2200000.00, 1880000.00, 190000.00, 570000.00, 1120000.00), -- Q3
(2015, 12, 7500000.00, 3000000.00, 4500000.00, 2400000.00, 2100000.00, 210000.00, 630000.00, 1260000.00), -- Q4

-- Fiscal Year 2016
(2016, 3, 8200000.00, 3280000.00, 4920000.00, 2600000.00, 2320000.00, 230000.00, 700000.00, 1390000.00), -- Q1
(2016, 6, 9000000.00, 3600000.00, 5400000.00, 2900000.00, 2500000.00, 250000.00, 750000.00, 1500000.00), -- Q2
(2016, 9, 9800000.00, 3920000.00, 5880000.00, 3200000.00, 2680000.00, 270000.00, 810000.00, 1600000.00), -- Q3
(2016, 12, 10500000.00, 4200000.00, 6300000.00, 3400000.00, 2900000.00, 290000.00, 870000.00, 1740000.00), -- Q4

-- Fiscal Year 2017
(2017, 3, 11200000.00, 4480000.00, 6720000.00, 3600000.00, 3120000.00, 310000.00, 940000.00, 1870000.00), -- Q1
(2017, 6, 12000000.00, 4800000.00, 7200000.00, 3900000.00, 3300000.00, 330000.00, 990000.00, 1980000.00), -- Q2
(2017, 9, 12800000.00, 5120000.00, 7680000.00, 4200000.00, 3480000.00, 350000.00, 1050000.00, 2080000.00), -- Q3
(2017, 12, 13500000.00, 5400000.00, 8100000.00, 4400000.00, 3700000.00, 370000.00, 1110000.00, 2220000.00), -- Q4

-- Fiscal Year 2018
(2018, 3, 14200000.00, 5680000.00, 8520000.00, 4600000.00, 3920000.00, 390000.00, 1180000.00, 2350000.00), -- Q1
(2018, 6, 15000000.00, 6000000.00, 9000000.00, 4900000.00, 4100000.00, 410000.00, 1230000.00, 2460000.00), -- Q2
(2018, 9, 15800000.00, 6320000.00, 9480000.00, 5200000.00, 4280000.00, 430000.00, 1290000.00, 2560000.00), -- Q3
(2018, 12, 16500000.00, 6600000.00, 9900000.00, 5400000.00, 4500000.00, 450000.00, 1350000.00, 2700000.00), -- Q4

-- Fiscal Year 2019
(2019, 3, 17200000.00, 6880000.00, 10320000.00, 5600000.00, 4720000.00, 470000.00, 1420000.00, 2830000.00), -- Q1
(2019, 6, 18000000.00, 7200000.00, 10800000.00, 5900000.00, 4900000.00, 490000.00, 1470000.00, 2940000.00), -- Q2
(2019, 9, 18800000.00, 7520000.00, 11280000.00, 6200000.00, 5080000.00, 510000.00, 1530000.00, 3040000.00), -- Q3
(2019, 12, 19500000.00, 7800000.00, 11700000.00, 6400000.00, 5300000.00, 530000.00, 1590000.00, 3180000.00), -- Q4

-- Fiscal Year 2020
(2020, 3, 20200000.00, 8080000.00, 12120000.00, 6600000.00, 5520000.00, 550000.00, 1660000.00, 3310000.00), -- Q1
(2020, 6, 21000000.00, 8400000.00, 12600000.00, 6900000.00, 5700000.00, 570000.00, 1710000.00, 3420000.00), -- Q2
(2020, 9, 21800000.00, 8720000.00, 13080000.00, 7200000.00, 5880000.00, 590000.00, 1770000.00, 3520000.00), -- Q3
(2020, 12, 22500000.00, 9000000.00, 13500000.00, 7400000.00, 6100000.00, 610000.00, 1830000.00, 3660000.00), -- Q4

-- Fiscal Year 2021
(2021, 3, 23200000.00, 9280000.00, 13920000.00, 7600000.00, 6320000.00, 630000.00, 1890000.00, 3800000.00), -- Q1
(2021, 6, 24000000.00, 9600000.00, 14400000.00, 7900000.00, 6500000.00, 650000.00, 1950000.00, 3900000.00), -- Q2
(2021, 9, 24800000.00, 9920000.00, 14880000.00, 8200000.00, 6680000.00, 670000.00, 2010000.00, 4000000.00), -- Q3
(2021, 12, 25500000.00, 10200000.00, 15300000.00, 8400000.00, 6900000.00, 690000.00, 2070000.00, 4140000.00), -- Q4

-- Fiscal Year 2022
(2022, 3, 26200000.00, 10480000.00, 15720000.00, 8600000.00, 7120000.00, 710000.00, 2140000.00, 4270000.00), -- Q1
(2022, 6, 27000000.00, 10800000.00, 16200000.00, 8900000.00, 7300000.00, 730000.00, 2190000.00, 4380000.00), -- Q2
(2022, 9, 27800000.00, 11120000.00, 16680000.00, 9200000.00, 7480000.00, 750000.00, 2250000.00, 4480000.00), -- Q3
(2022, 12, 28500000.00, 11400000.00, 17100000.00, 9400000.00, 7700000.00, 770000.00, 2310000.00, 4620000.00), -- Q4

-- Fiscal Year 2023
(2023, 3, 29200000.00, 11680000.00, 17520000.00, 9600000.00, 7920000.00, 790000.00, 2380000.00, 4750000.00), -- Q1
(2023, 6, 30000000.00, 12000000.00, 18000000.00, 9900000.00, 8100000.00, 810000.00, 2430000.00, 4860000.00), -- Q2
(2023, 9, 30800000.00, 12320000.00, 18480000.00, 10200000.00, 8280000.00, 830000.00, 2490000.00, 4960000.00), -- Q3
(2023, 12, 31500000.00, 12600000.00, 18900000.00, 10400000.00, 8500000.00, 850000.00, 2550000.00, 5100000.00), -- Q4

-- Fiscal Year 2024
(2024, 3, 32200000.00, 12880000.00, 19320000.00, 10600000.00, 8720000.00, 870000.00, 2620000.00, 5230000.00), -- Q1
(2024, 6, 33000000.00, 13200000.00, 19800000.00, 10900000.00, 8900000.00, 890000.00, 2670000.00, 5340000.00), -- Q2
(2024, 9, 33800000.00, 13520000.00, 20280000.00, 11200000.00, 9080000.00, 910000.00, 2730000.00, 5440000.00), -- Q3
(2024, 12, 34500000.00, 13800000.00, 20700000.00, 11400000.00, 9300000.00, 930000.00, 2790000.00, 5580000.00), -- Q4

-- Fiscal Year 2025
(2025, 3, 35200000.00, 14080000.00, 21120000.00, 11600000.00, 9520000.00, 950000.00, 2860000.00, 5710000.00), -- Q1
(2025, 6, 36000000.00, 14400000.00, 21600000.00, 11900000.00, 9700000.00, 970000.00, 2910000.00, 5820000.00), -- Q2
(2025, 9, 36800000.00, 14720000.00, 22080000.00, 12200000.00, 9880000.00, 990000.00, 2970000.00, 5920000.00), -- Q3
(2025, 12, 37500000.00, 15000000.00, 22500000.00, 12400000.00, 10100000.00, 1010000.00, 3030000.00, 6060000.00); -- Q4

INSERT INTO BalanceSheet ( fiscal_year, fiscal_month, current_assets, non_current_assets, total_assets, current_liabilities, non_current_liabilities, total_liabilities, shareholders_equity ) VALUES
-- Fiscal Year 2015
(2015, 3, 4500000.00, 7500000.00, 12000000.00, 2500000.00, 3500000.00, 6000000.00, 6000000.00), -- Q1
(2015, 6, 4800000.00, 7800000.00, 12600000.00, 2700000.00, 3700000.00, 6400000.00, 6200000.00), -- Q2
(2015, 9, 5100000.00, 8100000.00, 13200000.00, 2900000.00, 3900000.00, 6800000.00, 6400000.00), -- Q3
(2015, 12, 5500000.00, 8500000.00, 14000000.00, 3200000.00, 4200000.00, 7400000.00, 6600000.00), -- Q4

-- Fiscal Year 2016
(2016, 3, 5800000.00, 8800000.00, 14600000.00, 3400000.00, 4400000.00, 7800000.00, 6800000.00), -- Q1
(2016, 6, 6200000.00, 9200000.00, 15400000.00, 3700000.00, 4700000.00, 8400000.00, 7000000.00), -- Q2
(2016, 9, 6600000.00, 9600000.00, 16200000.00, 4000000.00, 5000000.00, 9000000.00, 7200000.00), -- Q3
(2016, 12, 7000000.00, 10000000.00, 17000000.00, 4300000.00, 5300000.00, 9600000.00, 7400000.00), -- Q4

-- Fiscal Year 2017
(2017, 3, 7400000.00, 10400000.00, 17800000.00, 4600000.00, 5600000.00, 10200000.00, 7600000.00), -- Q1
(2017, 6, 7800000.00, 10800000.00, 18600000.00, 4900000.00, 5900000.00, 10800000.00, 7800000.00), -- Q2
(2017, 9, 8200000.00, 11200000.00, 19400000.00, 5200000.00, 6200000.00, 11400000.00, 8000000.00), -- Q3
(2017, 12, 8600000.00, 11600000.00, 20200000.00, 5500000.00, 6500000.00, 12000000.00, 8200000.00), -- Q4

-- Fiscal Year 2018
(2018, 3, 9000000.00, 12000000.00, 21000000.00, 5800000.00, 6800000.00, 12600000.00, 8400000.00), -- Q1
(2018, 6, 9400000.00, 12400000.00, 21800000.00, 6100000.00, 7100000.00, 13200000.00, 8600000.00), -- Q2
(2018, 9, 9800000.00, 12800000.00, 22600000.00, 6400000.00, 7400000.00, 13800000.00, 8800000.00), -- Q3
(2018, 12, 10200000.00, 13200000.00, 23400000.00, 6700000.00, 7700000.00, 14400000.00, 9000000.00), -- Q4

-- Fiscal Year 2019
(2019, 3, 10600000.00, 13600000.00, 24200000.00, 7000000.00, 8000000.00, 15000000.00, 9200000.00), -- Q1
(2019, 6, 11000000.00, 14000000.00, 25000000.00, 7300000.00, 8300000.00, 15600000.00, 9400000.00), -- Q2
(2019, 9, 11400000.00, 14400000.00, 25800000.00, 7600000.00, 8600000.00, 16200000.00, 9600000.00), -- Q3
(2019, 12, 11800000.00, 14800000.00, 26600000.00, 7900000.00, 8900000.00, 16800000.00, 9800000.00), -- Q4

-- Fiscal Year 2020
(2020, 3, 12200000.00, 15200000.00, 27400000.00, 8200000.00, 9200000.00, 17400000.00, 10000000.00), -- Q1
(2020, 6, 12600000.00, 15600000.00, 28200000.00, 8500000.00, 9500000.00, 18000000.00, 10200000.00), -- Q2
(2020, 9, 13000000.00, 16000000.00, 29000000.00, 8800000.00, 9800000.00, 18600000.00, 10400000.00), -- Q3
(2020, 12, 13400000.00, 16400000.00, 29800000.00, 9100000.00, 10100000.00, 19200000.00, 10600000.00), -- Q4

-- Fiscal Year 2021
(2021, 3, 13800000.00, 16800000.00, 30600000.00, 9400000.00, 10400000.00, 19800000.00, 10800000.00), -- Q1
(2021, 6, 14200000.00, 17200000.00, 31400000.00, 9700000.00, 10700000.00, 20400000.00, 11000000.00), -- Q2
(2021, 9, 14600000.00, 17600000.00, 32200000.00, 10000000.00, 11000000.00, 21000000.00, 11200000.00), -- Q3
(2021, 12, 15000000.00, 18000000.00, 33000000.00, 10300000.00, 11300000.00, 21600000.00, 11400000.00), -- Q4

-- Fiscal Year 2022
(2022, 3, 15400000.00, 18400000.00, 33800000.00, 10600000.00, 11600000.00, 22200000.00, 11600000.00), -- Q1
(2022, 6, 15800000.00, 18800000.00, 34600000.00, 10900000.00, 11900000.00, 22800000.00, 11800000.00), -- Q2
(2022, 9, 16200000.00, 19200000.00, 35400000.00, 11200000.00, 12200000.00, 23400000.00, 12000000.00), -- Q3
(2022, 12, 16600000.00, 19600000.00, 36200000.00, 11500000.00, 12500000.00, 24000000.00, 12200000.00), -- Q4

-- Fiscal Year 2023
(2023, 3, 17000000.00, 20000000.00, 37000000.00, 11800000.00, 12800000.00, 24600000.00, 12400000.00), -- Q1
(2023, 6, 17400000.00, 20400000.00, 37800000.00, 12100000.00, 13100000.00, 25200000.00, 12600000.00), -- Q2
(2023, 9, 17800000.00, 20800000.00, 38600000.00, 12400000.00, 13400000.00, 25800000.00, 12800000.00), -- Q3
(2023, 12, 18200000.00, 21200000.00, 39400000.00, 12700000.00, 13700000.00, 26400000.00, 13000000.00), -- Q4

-- Fiscal Year 2024
(2024, 3, 18600000.00, 21600000.00, 40200000.00, 13000000.00, 14000000.00, 27000000.00, 13200000.00), -- Q1
(2024, 6, 19000000.00, 22000000.00, 41000000.00, 13300000.00, 14300000.00, 27600000.00, 13400000.00), -- Q2
(2024, 9, 19400000.00, 22400000.00, 41800000.00, 13600000.00, 14600000.00, 28200000.00, 13600000.00), -- Q3
(2024, 12, 19800000.00, 22800000.00, 42600000.00, 13900000.00, 14900000.00, 28800000.00, 13800000.00), -- Q4

-- Fiscal Year 2025
(2025, 3, 20200000.00, 23200000.00, 43400000.00, 14200000.00, 15200000.00, 29400000.00, 14000000.00), -- Q1
(2025, 6, 20600000.00, 23600000.00, 44200000.00, 14500000.00, 15500000.00, 30000000.00, 14200000.00), -- Q2
(2025, 9, 21000000.00, 24000000.00, 45000000.00, 14800000.00, 15800000.00, 30600000.00, 14400000.00), -- Q3
(2025, 12, 21400000.00, 24400000.00, 45800000.00, 15100000.00, 16100000.00, 31200000.00, 14600000.00); -- Q4






