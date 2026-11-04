# Quantitative Credit Risk Modelling
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
|Files Used| Origination file + Monthly Performance file for 2020 vintage and File Layout for the features|

###### Features
|Origination |Monthly Performance|
|--|--|
|Credit Score|Loan Sequence Number|
|First Payment Date|Monthly Reporting Period|
|First Time Homebuyer Flag|Current Actual UPB|
|Maturity Date|Current Loan Delinquency Status|
|Metropolitan Statistical Area (MSA) Or Metropolitan Division|Loan Age|
|Mortgage Insurance Percentage (MI %)|Remaining Months to Legal Maturity|
|Number of Units|Defect Settlement Date|
|Occupancy Status|Modification Flag|
|Original Combined Loan-to-Value (CLTV)|Zero Balance Code|
|Original Debt-to-Income (DTI) Ratio|Zero Balance Effective Date|
|Original UPB|Current Interest Rate|
|Original Loan-to-Value (LTV)|Current Deferred UPB|
|Original Interest Rate|Due Date of Last Paid Installment (DDLPI)|
|Channel|MI Recoveries|
|Prepayment Penalty Mortgage (PPM) Flag|Net Sales Proceeds|
|Amortization Type (Formerly Product Type)|Non MI Recoveries|
|Property State|Expenses|
|Property Type|Legal Costs|
|Postal Code|Maintenance and Preservation Costs|
|Loan Sequence Number|Taxes and Insurance|
|Loan Purpose|Miscellaneous Expenses|
|Original Loan Term|Actual Loss Calculation|
|Number of Borrowers|Modification Cost|
|Seller Name|Step Modification Flag|
|Servicer Name|Deferred Payment Plan|
|Super Conforming Flag|Estimated Loan-to-Value (ELTV)|
|Pre-HARP Loan Sequence Number|Zero Balance Removal UPB|
|Program Indicator|Delinquent Accrued Interest|
|HARP Indicator|Delinquency Due to Disaster|
|Property Valuation Method|Borrower Assistance Status Code|
|Interest Only (I/O) Indicator|Current Month Modification Cost|
|Mortgage Insurance Cancellation Indicator|Interest Bearing UPB|



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

The PD-Model is built on the data that is available before the borrower actually defaults, and this essentially most of the features from **mortgage_2020_orig** table. We use the \line{Current Loan Delinquency Status} to derive the default indicator variable. The default variable(indicator) is created by setting the indicator as *Good(as 0)* if the *Current Loan Delinquency Status* is within the set **{00,01,02}**, otherwise set it to *Bad(as 1)*. Here Good means the borrower did not default and Bad means the borrower defaulted. The Default Indicator table is then joined to **mortgage_2020_orig** table.  One thing we are supposed to watch out here, is to not use the data that was only available after the default, as it will cause leakage. The flow is as follows:

- Indicator/Target variable construction: 90+ DPD default default definition from *Current Loan Delinquency Status*, loan-level "ever-bad" aggregation
- Use the SQL Joins on *Loan Sequence Number* as a primary & foreign key, to merge the target variable to **mortgage_2020_orig**
- Feature Selection
   - Exploratory Data Analysis, using the target variable as hue(category on the plots) to observe the relationship.
   - Build the correlation matrix, and the heatmap plot for correlation to determine the pairwise relationships for the numerical/continuous features. If two variables have very high correlation, then drop one of them to avoid the multi-collinearity problem.
   - Drop the features that are nulls almost everywhere.
   - Create dummy variable for categorical variables using pd.get_dummies()
   - Weight of Evidence (To find the predictive power of each categorical feature)
     - We first split the dataset, into train and test sets.
     -  Build the general WoE function, which takes the *var* as an argument. The function perform the proportions of goods and bad, and return the table for the Weight of Evidence and Information Value
     -  Build a general function that takes the WoE table and plots the WoE values by the categories for that variable *var*
     -  Consider variables that have large IV values, greater than *0.3* (strong predictive power). But the variables with very high IV, we delete them as that is too good to be true or they might be of the data leakage set.
     -  To built the WoE on the continuous variables, each variable is *fine classed*, to obtain the intervals and then those intervals are put into the WoE function, as the new categorical representation for that particular continuous variable.
   - Collect the column names, for the columns to be used, including the ones that are newly constructed through WoE.[Reference Variables & All the Variables]
   - Create the two tables for the training set, as *pd_data_inputs_train* and *pd_data_target_train* and save them into the database.

  - We do not create the new Weight of Evidences and select variables on the test set, in fact we apply the WoE derived from the train set, and obtain the same column names. !!!


 ##### 5.1.2. Model Estimation and Validation

- **Training the Model**
   - Set up the data for training, by setting the train as the variable selected for the PD-Model and drop the reference variables. The target train is the column named *Bad*( i.e it shows 0 for non-default and 1 for default)
   - Import the $LogisticRegression()$ algorithm  from sklean.linear_model, and fit (X_train,y_train), for the model pd_model to learn.
   - Display the model coefficients, including the intercept.
- **Model Estimation(Part 1 - Default Prediction)**
   - Apply the pd_model.predict() on X_test, to predict the default target (*Bad*)
   - Notice that when we predict, the default cutoff/threshold to decide whether the loan is Bad is *0.5*, but this type of prediction only applies to a balanced class problem.
   - In our case we have 14661 Goods and 339 Goods, so we are having an imbalanced class problem. 
   - We obtained that the maximum probability of being Bad = 0.43. So $P(y_test = \text{Bad})<default threshold$*
     $\therefore$ The model does not catch any bad borrower, with this particular threshold.
   - *precision, recall and f1-score* are all *0.00*
   - To solve this, a threshold choice strategy must be used. 

- **Model Estimation(Part 2 - Choosing a better Threshold)**
   A natural idea of picking the threshold, is to use the average probability of being Bad (i.e the Bad rate = $\frac{789}{35000}$, the expectation of the actual target from the training set (X_train,y_train). However, the data has to satisfy the calibration condition first.
   - Calibration Check
     In short a model predicted probabilities are calibrated if among all cases predicted to have probability p of being Bad, approximately p proportion actually are Bad.
     - Mathematically (If the statement : $E[\hat p] \approx E[y] = P( y = \text{Bad}$ is true we set threshold $\approx p$)
     - The expectation of the actual target (Bad) is *0.0226000*, and it is approximately equal to the average predicted probability across the whole population which is *0.0226145*
       $\therefore$ The calibration condition is satisfied, and threshold is chosen to be *0.0226*

     Connecting the Threshold problem to Bayes Theorem.
     
     Recall Bayes Theorem :
     
      $$P( A | B ) = \frac{P(A)P( B | A)}{P(B)}$$
     
     In our case we have :

      $$P( y = 1 | X ) = \frac{P( y = 1 )P( X | y = 1)}{P(X)}$$
     
     Where
  
      $P( y = 1 | X )$: Probability of being Bad, given the features X (Sometimes called Posterior),
     
      $P( y = 1)$: Proportion of Bad loans( The initial Bad Rate (Sometimes called Prior),
     
      $P(X)$: How common these features are, across all loans.
     
      $P( X | y = 1)$: How do the features $\text{X}$ behave for Bad loans.

     Here $P ( y = 1) = 2.3$ %, implying that $P( y = 1 | X )$ get smaller, and this lowers the threshold for Bad loans.
     
     In summary; every prediction the model makes, is the likelihood features multiplied by the Bad rate, and since the Bad rate is smaller, every Posterior gets pulled down to zero, which is why the $0.5$ does not apply in this imbalanced class case, and why the threshold close to prior fixes the problem.

 - **Model Evaluation & Validation**
   - Confusion Matrix structured as :
     
   |Actual Good/Bad|Predicted Good|Predicted Bad|
   |--|--|--|
   |Actual Good |True Negative (TN)|False Positive (FP)|
   |Actual Bad |False Negative (FN)|True Positive (TP)|

   We have obtained :
   
   - Classification Report.

Recall the classification metrices: Accuracy, Precision, Recall are defined as follows,

$Accuracy = \frac{TP+TN}{TP+TN+FP+FN}$ (The proportion of all predictions that were correctly classified)

$Precision = \frac{TP}{TP+FP}$ (Out of all loans flagged as Bad, how much was actually Bad)

$Recall = \frac{TP}{TP+FN}$ (Out of all loans that were actually Bad, how much did the model catch)

Observe that the number of loans that the model flagged as Bad and were actually Bad has improved to 245. The precision for Bad loans increased from *0.00* to *0.05*, as well as the recall and f1-score with the respective values *0.72* and *0.10*.

Accuracy is not a good metric to rely on in situations of imbalanced class, because it will be more shifted to the class with higher rate. Initially it was *0.98*, and it has reduced to *0.691$, because more Bad were now predicted correctly. The higher accuracy does not generally imply that the model is doing well!.

   - Receiver Operating Characteristic(ROC).
  
     The ROC simply show the relationship between *False Positive Rate* and *True Positive Rate* across every possible threshold in $\text{[0,1]}$.
     
      - False Positive Rate (FPR), refers to the proportion of actually *Good* loans that were incorrectly flagged as *Bad*.
    
         $FPR = \frac{FP}{TP+TN} = P(thr >= t_0 | y = 0)$
    
      - True Positive Rate (TPR), refers to the proportion of actually *Bad* loans that were correctly classified (This is Recall)
 
         $TPR = \frac{TP}{TP+FN} = P(thr >= t_0 | y = 1)$

     We now show the visual representation (ROC Curve), to show how well the model separate the classes across every possible decision threshold.(2D & 3D)

     From the plot, we see the model does have some discrimination power, with the *AUC = 0.759*. This falls in the *acceptable to good* category for risk models.
     AUC is known as the Area Under Curve score, and it summarizes the models' ability to rank correctly, completely separate from wherever the classification threshold ends up being set. [Note this is a property of the model, not used as a decision rule for prediction]

     - Gini Coefficient and CAP Lorentz Curve

       The CAP Lorentz Curve, also known as Gini Curve is used to visualize the cumulative accuracy profile of the model. It shows the *Cumulative Proportion of Bad Loans* (Proportion of Bad loans captured so far) versus *Cumulative Proportion of the Population* (Proportion of the population included so far).
       The Gini tells us the net rate at which the model correctly ranks a random *Bad* loan above a random *Good* loan. We obtained :
  $\text{Gini} = 2\text{AUC}-1 = 2\times{0.759} - 1 = 0.518$.

       So the model strongly separates  Bad borrowers from Good borrowers. Across 100 random comparisons  between defaulting and non-defaulting loans, it correctly identifies one roughly and gets it backwards about 24-times ($100\times{(1-0.76)}$), for a net discriminatory power of *0.518*.        This is consistent with , and upper end of a typical performance for a mortgage PD-Scorecards.


 - Kolmogorov-Sminorv (KS) Statistic and the Curve

   The KS curve plots two separate cumulative distribution against the predicted probability of being *Bad*.

     - Cum_%_Bad/Good - Cumulative proportion of actual *Bad*/*Good loans as probability increases.
       
     The KS-Statistic (Coefficient) is the maximum vertical distance between the two cumulative curves at any given probability value. It is intuitively the point where the model does best job of separating the two population classes (i.e the probability value at which *Bad* loans captured by far and *Good* loans captured by far, diverge the most).
     Here *KS = 0.42*, which indicates a strong separation band. Actually if you observe carefully, the strongest KS value, is approximately positioned in the chosen threshold, which creates an additional empirical support for the threshold we chose. Mathematically :
If we define

$$g(p) =$$ Cum_%_Bad(p),

$h(p) =$ Cum_%_Good(p),

$f(p) = g(p) - h(p)$
 
 $\implies$
 
 $KS_{Coeff} = \text{Max}\{f(p) : p \in [0,1]\}$

 
 $f^{-1}(KS_{Coeff}) \approx 2.3$%
 
  
     




     





