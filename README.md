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
|Source|
|Dataset Type|
|Vintage|
|Sample Size|
|Files Used|

