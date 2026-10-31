# Quant-Credit-Risk-Modelling
End-to-end quantitative credit risk modelling using SQL, Python, machine learning, model validation and IFRS 9-style ECL analysis.

### 1. Project Overview

The project builds an end-to-end quantitative credit risk model for residential mortgages, using Freddie Mac's publicly available Data. It is designed to demonstrate practical application in credit risk modelling, data engineering, and regulatory-aligned analysis informed by Basel II/III & IFRS 9 concepts, while remaining manageble, well scoped portfolio project.


### 2. Objectives

   - Build a clean, SQL/Python pipeline that collects the raw Freddie Mac origination and monthly performance data.
   - Engineer a loan-level dataset that tracks each mortgage from origination through its performance history (delinquency, prepayment, default)
   - Develop a Probability of Default (PD) Model using delinquency/default outcomes.
   - Estimate Loss Given Default (LGD) and Exposure at Default (EAD) measures to support a full expected-loss framework
   - Combine PD, LGD and EAD into an Expected Credit Loss (ECL) estimate aligned with IFRS9 principles.
   - Validate the models (discrimination, calibration, stability) using standard credit-risk metrics
   - Utilize Streamlit for model deployment, provided that the validation is good to strong.
   - Run basic stress-testing scenarios to see how ECL and default rates change under extreme macro conditions
   - Present findings in clear, professional format (report + visuals) suitable for a portfolio

### 3.  Data Scope

|Aspect|Description|
|------|------------|
|Source| Freddie Mac Single-Family Loan-Level Dataset - [Freddie Mac 2020](https://claritydownload.fmapps.freddiemac.com/CRT/?_gl=1*1vz5e7s*_gcl_au*MjAyMzI2MDQzMy4xNzkzNDU3MjE4Li0uLS4xNzkzNDU3MjM3LjExNDU4MzI4NTEuMTc5MzQ1NzIzOC4xNzkzNDU3MjYy*_ga*MjAwMDAxMjA3Mi4xNzkzNDU3MjQ2*_ga_B5N0FKC09S*czE3OTM0NTcyNDUkbzEkZzEkdDE3OTM0NTcyNjMkajQyJGwwJGgw#/sflld)|
|Dataset Type|Sample dataset, collected exported as text files |
|Vintage| 2020 origination year (starting point)|
|Sample Size| Close to 50 000 unique records(Loans)|
|Files Used| Origination file + Monthly Performance file for 2020 vintage|

<img width="800" height="400" alt="image" src="https://github.com/user-attachments/assets/573bdaf8-ee68-437c-abf8-7be25fc92d11" />



The dataset is exported in this completely unstructured format with no column names included:
<img width="800" height="400" alt="image" src="https://github.com/user-attachments/assets/5dda235c-216c-4670-a70a-92bc7eba2345" />

### 4. Technical Tools/Software Involved.

|Tool|The Use|
|------|------------|
|Excel |For simple understanding of the data, and preparing the column names for the datasets|
|Pg Admin & PostgreSQL Server|SQL for querying the data, and preparing it for modelling|
|Visual Studio Code|Python for Data Preparation and Modelling|

### 5. Methodology 

#### 5.1. General Data Preparation 

   - Data Acquisition - Download Freddie Mac 2020 sample dataset, Origination & Performance files
   - Mortgage Credit Risk Database - PostgreSQL/PgAdmin schema for the two tables (This involves creating the tables ; mortgage_2020_orig & mortgage_2020_perf with the column names specified on the Freddie mac page, and lastly inserting the exported data into the two tables)
   - Primary/Foreign Keys - Loan Sequence Number (mortgage_2020_orig); Loan Sequence Number + Monthly Reporting Period (mortgage_2020_perf)
   - Python For Further Preprocessing - Applying df.info() to understand the data structures and data types, df.describe() for statistical description, Handling Null values using seaborn heatmap(),  Exploratory Data Analysis using seaborn, matplotlib, plotly libraries.

#### 5.1. Probability of Default Model 

##### 5.1.1. Data Preparation for the PD-Model







