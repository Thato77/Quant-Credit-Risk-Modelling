-- Database: Mortgage Credit Risk

-- DROP DATABASE IF EXISTS "Mortgage Credit Risk";

CREATE DATABASE "Mortgage Credit Risk"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

DROP TABLE mortgage_orig_2020;

CREATE TABLE mortgage_orig_2020(
"Credit Score" NUMERIC(4,0),
"First Payment Date" VARCHAR(6),
"First Time Homebuyer Flag" VARCHAR(1),
"Maturity Date" VARCHAR(6),
"Metropolitan Statistical Area (MSA) Or Metropolitan Division" NUMERIC(5,0),
"Mortgage Insurance Percentage (MI %)" NUMERIC(3,0),
"Number of Units" NUMERIC(2,0),
"Occupancy Status" VARCHAR(1),
"Original Combined Loan-to-Value (CLTV)" NUMERIC(3,0),
"Original Debt-to-Income (DTI) Ratio" NUMERIC(3,0),
"Original UPB" NUMERIC(12,0),
"Original Loan-to-Value (LTV)" NUMERIC(3,0),
"Original Interest Rate" NUMERIC(6,3),
"Channel" VARCHAR(1),
"Prepayment Penalty Mortgage (PPM) Flag" VARCHAR(1),
"Amortization Type (Formerly Product Type)" VARCHAR(5),
"Property State" VARCHAR(2),
"Property Type" VARCHAR(2),
"Postal Code" VARCHAR(5),
"Loan Sequence Number" VARCHAR(12),
"Loan Purpose" VARCHAR(1),
"Original Loan Term" NUMERIC(3,0),
"Number of Borrowers" NUMERIC(2,0),
"Seller Name" VARCHAR(60),
"Servicer Name" VARCHAR(60),
"Super Conforming Flag" VARCHAR(1),
"Pre-HARP Loan Sequence Number" VARCHAR(12),
"Program Indicator" VARCHAR(1),
"HARP Indicator" VARCHAR(1),
"Property Valuation Method" VARCHAR(1),
"Interest Only (I/O) Indicator" VARCHAR(4)
);

DROP TABLE mortgage_perf_2020;

CREATE TABLE mortgage_perf_2020(
"Loan Sequence Number" VARCHAR(12),
"Monthly Reporting Period" VARCHAR(6),
"Current Actual UPB" NUMERIC(12,2),
"Current Loan Delinquency Status" VARCHAR(3),
"Loan Age" NUMERIC(3,0) ,
"Remaining Months to Legal Maturity" NUMERIC(3,0) ,
"Defect Settlement Date" VARCHAR(6),
"Modification Flag" VARCHAR(1),
"Zero Balance Code" VARCHAR(2),
"Zero Balance Effective Date" VARCHAR(6),
"Current Interest Rate" NUMERIC(8,3),
"Current Deferred UPB" NUMERIC(12,0),
"Due Date of Last Paid Installment (DDLPI)" VARCHAR(6),
"MI Recoveries" NUMERIC(12,2),
"Net Sales Proceeds" VARCHAR(14),
"Non MI Recoveries" NUMERIC(12,2),
"Expenses" NUMERIC(12,2),
"Legal Costs" NUMERIC(12,2),
"Maintenance and Preservation Costs" NUMERIC(12,2),
"Taxes and Insurance" NUMERIC(12,2),
"Miscellaneous Expenses" NUMERIC(12,2),
"Actual Loss Calculation" NUMERIC(12,2),
"Modification Cost" NUMERIC(12,2),
"Step Modification Flag" VARCHAR(1),
"Deferred Payment Plan" VARCHAR(1),
"Estimated Loan-to-Value (ELTV)" NUMERIC(4,0),
"Zero Balance Removal UPB" NUMERIC(12,2),
"Delinquent Accrued Interest" NUMERIC(12,2),
"Delinquency Due to Disaster" VARCHAR(1),
"Borrower Assistance Status Code" VARCHAR(1),
"Current Month Modification Cost" NUMERIC(12,2),
"Interest Bearing UPB" NUMERIC(12,2),
"Extra Column 1" VARCHAR(1),
"Extra Column 2" VARCHAR(60),
"Extra Column 3" VARCHAR(5)
);

SELECT * FROM mortgage_orig_2020;
SELECT * FROM mortgage_perf_2020;

COPY mortgage_orig_2020
FROM  'C:\Temp\sample_orig_2020.txt'
WITH(FORMAT csv, DELIMITER '|',HEADER FALSE);

COPY mortgage_perf_2020
FROM  'C:\Temp\sample_perf_2020.txt'
WITH(FORMAT csv, DELIMITER '|',HEADER FALSE);

SELECT * FROM mortgage_perf_2020;