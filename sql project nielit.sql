
-- Create Database called Banking with 3 tables Customer ,Loan and FD

-- Question 1 : (Table 1 :Customer Table ,5 Marks)
CREATE DATABASE IF NOT EXISTS Banking;

USE Banking;

-- Question 2: Create Table 2 – Loans ( 5 Marks)

CREATE TABLE IF NOT EXISTS Customer (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    AccountType ENUM('Savings', 'Current', 'Loan Account', 'FD'),
    TransactionNumber INT,
    TransactionDate DATE,
    TransactionType ENUM('Credit', 'Debit'),
    Amount DECIMAL(15, 2)
);

-- Question 2: Create Table 2 – Loans ( 5 Marks)

CREATE TABLE IF NOT EXISTS Loan (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT,
    LoanDate DATE,
    LoanType ENUM('Vehicle Loan', 'Housing Loan', 'Personal Loan'),
    LoanAmount DECIMAL(30, 2),
    DurationYears INT,
    InterestRate DECIMAL(5, 2),
    InterestAmount DECIMAL(15, 2),
    TotalRepaymentBank DECIMAL(15, 2),
    TotalRepaidByCustomer DECIMAL(15, 2),
    TotalOutstanding DECIMAL(15, 2),
    FOREIGN KEY (AccountID) REFERENCES Customer(AccountID)
);
-- Create FixedDeposit table:

CREATE TABLE IF NOT EXISTS FixedDeposit (
    DepositID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT,
    Amount DECIMAL(15, 2),
    InterestPayableMonths INT,
    InterestRate DECIMAL(5, 2),
    InterestAmount DECIMAL(15, 2),
    MaturityAmount DECIMAL(15, 2),
    FOREIGN KEY (AccountID) REFERENCES Customer(AccountID)
);
-- Insert data into the customer
INSERT INTO Customer (AccountID, AccountType, TransactionNumber, TransactionDate, TransactionType, Amount) VALUES
(1,'Savings', 1001, '2024-01-01', 'Credit', 500000.00),
(2,'Savings', 1002, '2024-02-02', 'Debit',504200.00),
(3,'Savings', 1003, '2024-03-05', 'Credit',600000.00),
(4,'Current', 1004, '2024-04-10', 'Credit', 750000.00),
(5,'Current', 1005, '2024-11-15', 'Debit', 50500.00),
(6,'Current', 1006, '2024-11-20', 'Credit', 350000.00),
(7,'Loan account', 1007, '2024-10-25', 'Credit', 450000.00),
(8,'Loan account', 1008, '2024-07-30', 'Debit', 500000.00),
(9,'Loan account', 1009, '2024-07-05', 'Credit', 430000.00),
(10,'FD', 1010, '2024-11-10', 'Credit', 350000.00),
(11,'FD', 1011, '2024-12-15', 'Debit', 550000.00),
(12,'FD', 1012, '2024-06-20', 'Credit', 500000.00),
(13,'Savings', 1013, '2024-02-25', 'Credit', 350000.00),
(14,'Savings', 1014, '2024-09-26', 'Debit',450500.00);

UPDATE Customer SET Amount=550000 WHERE AccountID =5;
UPDATE  Customer SET Amount=650000 WHERE AccountID =6 ;
UPDATE  Customer SET TransactionType = 'debit' WHERE AccountID =6 ;

-- Insert data into the loan

INSERT INTO Loan ( AccountID, LoanDate, LoanType, LoanAmount, DurationYears, InterestRate, 
InterestAmount, TotalRepaymentBank, TotalRepaidByCustomer, TotalOutstanding) VALUES
(1, '2023-01-01', 'Vehicle Loan', 25000.00, 5, 5.0, 1250.00, 26250.00, 0.00, 26250.00),
(2, '2023-02-01', 'Housing Loan', 100000.00, 10, 6.0, 6000.00, 106000.00, 0.00, 106000.00),
(3, '2023-03-01', 'Personal Loan', 5000.00, 2, 8.0, 800.00, 5800.00, 0.00, 5800.00),
(4, '2023-04-01', 'Vehicle Loan', 30000.00, 6, 5.5, 1650.00, 31650.00, 0.00, 31650.00),
(5, '2023-05-01', 'Housing Loan', 150000.00, 15, 6.5, 9750.00, 159750.00, 0.00, 159750.00),
(6, '2023-06-01', 'Personal Loan', 7000.00, 3, 7.0, 1470.00, 8470.00, 0.00, 8470.00),
(7, '2023-07-01', 'Vehicle Loan', 35000.00, 7, 6.0, 2100.00, 37100.00, 0.00, 37100.00),
(8, '2023-08-01', 'Housing Loan', 200000.00, 20, 7.0, 14000.00, 214000.00, 0.00, 214000.00),
(9, '2023-09-01', 'Personal Loan', 8000.00, 4, 7.5, 2400.00, 10400.00, 0.00, 10400.00),
(10, '2023-10-01', 'Vehicle Loan', 40000.00, 8, 6.5, 2600.00, 42600.00, 0.00, 42600.00),
(11, '2023-11-01', 'Housing Loan', 250000.00, 25, 7.5, 18750.00, 268750.00, 0.00, 268750.00),
(12, '2023-12-01', 'Personal Loan', 10000.00, 5, 8.0, 4000.00, 14000.00, 0.00, 14000.00),
(13, '2024-01-01', 'Vehicle Loan', 45000.00, 9, 7.0, 3150.00, 48150.00, 0.00, 48150.00),
(14, '2024-02-01', 'Housing Loan', 300000.00, 30, 8.0, 24000.00, 324000.00, 0.00, 324000.00);

-- Insert data into the FixedDeposit table (at least 10 customers):

-- Sample data insertion
INSERT INTO FixedDeposit (AccountID, Amount, InterestPayableMonths, InterestRate) VALUES
(1, 10000.00, 12, 5.0),
(2, 20000.00, 6, 6.0),
(3, 15000.00, 9, 7.5),
(4, 25000.00, 12, 6.5),
(5, 30000.00, 6, 8.0),
(6, 20000.00, 9, 7.0),
(7, 18000.00, 12, 5.5),
(8, 22000.00, 6, 6.5),
(9, 28000.00, 9, 7.0),
(10, 32000.00, 12, 8.5);

SELECT * FROM Customer;
SELECT * FROM Loan;
SELECT * FROM FixedDeposit;

-- Question 3 : (5 Marks)
-- Display the customers with debit >=500000 during the month of November.

SELECT DISTINCT c.AccountID,c.AccountType,c.TransactionNumber,c.TransactionDate,c.TransactionType,c.Amount
FROM Customer JOIN
    Loan l ON c.AccountID = l.AccountID
WHERE
    c.TransactionType = 'Debit'
    AND MONTH(c.TransactionDate) =11
    AND c.Amount >= 500000;
    
SELECT DISTINCT c.AccountID,c.AccountType,c.TransactionNumber,c.TransactionDate,c.TransactionType,c.Amount
FROM Customer c JOIN
    Loan l ON c.AccountID = l.AccountID
WHERE
    c.TransactionType = 'credit'
   AND c.Amount >= 500000;
  
-- Display the highest loan obtained by each customer using window function.
   
WITH RankedLoans AS (SELECT l.AccountID,l.LoanID, l.LoanType,l.LoanAmount,
ROW_NUMBER() OVER (PARTITION BY l.AccountID ORDER BY l.LoanAmount DESC) AS LoanRank
FROM Loan l)
SELECT c.AccountID,c.AccountType,rl.LoanID,rl.LoanType,rl.LoanAmount
FROM Customer c
INNER JOIN RankedLoans rl ON c.AccountID = rl.AccountID
WHERE rl.LoanRank = 1;
   
/* Display the loan repayment to bank and total amount to be repaid by the
customer for each type of loan using with clause.*/
    
WITH LoanRepayments AS (
SELECT LoanType,
        SUM(TotalRepaymentBank) AS TotalRepaymentBank,
        SUM(TotalRepaidByCustomer) AS TotalRepaidByCustomer
FROM Loan
GROUP BY LoanType) 
SELECT LoanType,TotalRepaymentBank,TotalRepaidByCustomer,TotalRepaymentBank - TotalRepaidByCustomer AS TotalOutstanding
FROM LoanRepayments;

-- Question 4 : (3 Marks)   
 /* Create a trigger and calculate total outstanding automatically as data is
entered into the table.*/   
    
DELIMITER //

CREATE TRIGGER calculate_total_outstanding
after INSERT ON Loan
FOR EACH ROW
BEGIN
DECLARE total_repayment DECIMAL(15, 2);
DECLARE total_repaid DECIMAL(15, 2);
SET total_repayment = NEW.LoanAmount + (NEW.LoanAmount * NEW.InterestRate * NEW.DurationYears) / 100;
SELECT COALESCE(SUM(TotalRepaidByCustomer), 0) INTO total_repaid
FROM Loan
WHERE AccountID = NEW.AccountID;
SET NEW.TotalOutstanding = total_repayment - total_repaid;
END;
// DELIMITER ;

-- Question 5: (2 Marks)
-- Display the total interest paid by each customer.  

SELECT c.AccountID,c.AccountType,
    SUM(l.InterestAmount) AS TotalInterestPaid
FROM Customer c
INNER JOIN Loan l ON c.AccountID = l.AccountID
GROUP BY c.AccountID, c.AccountType;

-- Question 6: (5 Marks)
/* Display the total loan amount availed by every customer.
and display the total loan amount availed under each loan type.*/ 
    
SELECT c.AccountID,c.AccountType,
    SUM(l.LoanAmount) AS TotalLoanAmountAvailed
FROM Customer c
INNER JOIN Loan l ON c.AccountID = l.AccountID
GROUP BY c.AccountID, c.AccountType;
    
SELECT LoanType,
    SUM(LoanAmount) AS TotalLoanAmountAvailed
FROM Loan
GROUP BY LoanType;
   
-- Question 7
/* Calculate interest amount and Display the total and average amount of money to be paid as interest to the
customers by the bank.*/
 
SELECT
    SUM(InterestAmount) AS TotalInterestPaid,
    AVG(InterestAmount) AS AverageInterestPaid
FROM FixedDeposit;
    
UPDATE Loan
SET InterestAmount = (LoanAmount * InterestRate * DurationYears) / 100,
    TotalRepaymentBank = LoanAmount + (LoanAmount * InterestRate * DurationYears) / 100,
    TotalOutstanding = TotalRepaymentBank - TotalRepaidByCustomer;