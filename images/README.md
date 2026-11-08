# Project images

### 1. General Methodology

#### 1.1.  SQL Queries
| | |
|--|--|
|Mortgage Credit Risk Database Development <img width="700" height="350" alt="Screenshot 2026-11-06 210443" src="https://github.com/user-attachments/assets/ffc4c361-0c19-4d41-9962-40227c1bc009" /> | Creation of the Origination table <img width="700" height="350" alt="Screenshot 2026-11-06 210653" src="https://github.com/user-attachments/assets/7d74cfa9-12da-4479-ba76-3e17e831a2b4" /> |
| Creation of the Monthly Performance table <img width="700" height="350" alt="Screenshot 2026-11-06 210834" src="https://github.com/user-attachments/assets/111716d3-d332-4f69-bda1-3b3f3ef918ae" /> | Primary/Foreign Key - Loan Sequence Number <img width="700" height="350" alt="Screenshot 2026-11-06 212217" src="https://github.com/user-attachments/assets/84566406-2c2b-44d6-baf2-a2035f619f0c" /> |

#### 1.2. Further Preprocessing on Python

| | |
|--|--|
| Origination Data Structure <img width="1338" height="711" alt="Screenshot 2026-11-06 212411" src="https://github.com/user-attachments/assets/12c82841-6b18-460e-9fa9-2ead8ceeba04" /> | Statistical Description (Origination) <img width="1333" height="542" alt="Screenshot 2026-11-06 212442" src="https://github.com/user-attachments/assets/8b0b2e0b-d2da-495a-bdfb-4c25dfd214e8" />|
|Distinct Value Counts for Origination Variables <img width="1334" height="654" alt="Screenshot 2026-11-07 001136" src="https://github.com/user-attachments/assets/976cda9e-fa68-43cd-908e-e9120a10fba8" />| Missing Values (Origination) <img width="1378" height="714" alt="Screenshot 2026-11-06 212657" src="https://github.com/user-attachments/assets/91303b02-c57b-41f3-a5ac-abb843285a2c" /> |
|Continuous Variables (Origination) <img width="1337" height="490" alt="Screenshot 2026-11-07 001336" src="https://github.com/user-attachments/assets/e4be65b5-9e5a-4bfd-a71a-699c653ea1d7" />|Correlation on Continuous Variables in Tabular Form (Origination) <img width="1377" height="618" alt="Screenshot 2026-11-06 212741" src="https://github.com/user-attachments/assets/c1f29cce-88a7-4dc8-868f-8b26340d67ff" />|
|Correlation on Continuous Variables (Origination) <img width="1318" height="639" alt="Screenshot 2026-11-06 235606" src="https://github.com/user-attachments/assets/7b6171fe-f813-4491-b524-325f4282c550" />|Pairwise Plots (Origination) <img width="1334" height="711" alt="Screenshot 2026-11-07 001410" src="https://github.com/user-attachments/assets/8f0eca52-d0ac-4778-bd60-4e6a587bdec9" />|
|Monthly Performance Data Structure <img width="1338" height="687" alt="Screenshot 2026-11-06 235641" src="https://github.com/user-attachments/assets/d8de4ff4-0a1c-46c3-88db-cd80938bebc7" /> |Missing Values (Monthly Performance) <img width="1365" height="651" alt="Screenshot 2026-11-07 001233" src="https://github.com/user-attachments/assets/55c1f0ac-45d4-465f-a28b-d277c700eb40" />|
|Correlation on Continuous Variables (Monthly Performance) <img width="1336" height="703" alt="Screenshot 2026-11-07 001308" src="https://github.com/user-attachments/assets/857fe5a5-db6b-46b9-b15e-d3ff978fdf38" />||


### 2. Probability of Default Data Preparation

#### 2.1. Construction of the Indicator/Target Variable

| | | 
|--|--|
| Exploring the Current Loan Delinquency Status <img width="1377" height="688" alt="Screenshot 2026-11-07 002413" src="https://github.com/user-attachments/assets/8ebb9b53-2652-4c43-89df-e2621076b735" />| Creating the Indicator/Target Variable <img width="1377" height="536" alt="Screenshot 2026-11-07 002500" src="https://github.com/user-attachments/assets/d6608b01-a4b0-461a-98c9-85131c84ce88" />|
| Saving the Target Variable in the Database <img width="1852" height="283" alt="unnamed" src="https://github.com/user-attachments/assets/4e87c1fd-7466-4483-b94a-d19464563de5" />| Merging the Target(Bad) Variable to the Preprocessed Origination Table (SQL Query)<img width="1824" height="386" alt="unnamed1" src="https://github.com/user-attachments/assets/fcfe75f7-4a72-4452-89f0-25b3debe4111" />| 

#### 2.2. Feature Selection

##### 2.2.1. General Analysis 

| | |
|--|--|
|Exploring the pd-data (The Merged table) <img width="1351" height="654" alt="Screenshot 2026-11-07 002607" src="https://github.com/user-attachments/assets/ec28b7f4-cdd2-4aa6-aca3-c8dd77ab1e0f" />| Exploratory Data Analysis (1) <img width="1321" height="437" alt="Screenshot 2026-11-07 002701" src="https://github.com/user-attachments/assets/56bcc1a6-5b08-4f4d-bcda-bcd17a473a04" /> |
| Exploratory Data Analysis (2) <img width="1288" height="717" alt="Screenshot 2026-11-07 002818" src="https://github.com/user-attachments/assets/82bcf11e-5c78-4e07-b5e3-a58ddfec40ef" /> | Exploratory Data Analysis (2) <img width="1328" height="453" alt="Screenshot 2026-11-07 002907" src="https://github.com/user-attachments/assets/9adce6a7-630c-4344-97f8-a0347d1ec7f5" /> |
| Exploratory Data Analysis (4)<img width="1284" height="423" alt="Screenshot 2026-11-07 002919" src="https://github.com/user-attachments/assets/eb0931f5-b79d-48cc-970f-6d647970f4e3" /> | Exploratory Data Analysis (5) <img width="1337" height="529" alt="Screenshot 2026-11-07 003459" src="https://github.com/user-attachments/assets/11d77ece-42b3-427c-b6be-fa2737a01b10" />|
| Correlation on pd-data (To avoid multi-collinearity) <img width="1330" height="672" alt="Screenshot 2026-11-07 003656" src="https://github.com/user-attachments/assets/6516c156-d41c-4a55-9d81-d207f0b837bc" /> | Dropping the Nulls and Splitting the Data into Train and Test sets <img width="1352" height="557" alt="Screenshot 2026-11-07 003745" src="https://github.com/user-attachments/assets/00c83f97-ae64-4eb0-9434-f09edeb4e95e" />|

##### 2.2.2. Weight of Evidence and Information Values

| | |
| | |
|--|--|
|Weight of Evidence Function for Categorical Variables <img width="1339" height="577" alt="Screenshot 2026-11-07 003812" src="https://github.com/user-attachments/assets/77eb0d00-e38e-4212-9c06-16f6fa0fa4cf" />| Weight of Evidence for Property State - (Example of WoE for Categorical Variables) <img width="1336" height="709" alt="Screenshot 2026-11-07 003926" src="https://github.com/user-attachments/assets/f798c295-65d6-4c4a-9b12-e536e04ae83d" />| 
| Collecting the Categorical Variables' Names <img width="1336" height="76" alt="Screenshot 2026-11-07 004403" src="https://github.com/user-attachments/assets/8c45607c-e70d-4937-9aab-15d5fa9e25bf" />|  Weight of Evidence Function for Continuous Variables <img width="1337" height="588" alt="Screenshot 2026-11-07 004018" src="https://github.com/user-attachments/assets/1d3b0581-9533-421c-a415-890efaa10372" />|
| Weight of Evidence for Original Combined Loan-to-Value (CLTV) (Fine Classed) - (Example of WoE for Continuous Variables) <img width="1330" height="722" alt="Screenshot 2026-11-07 004119" src="https://github.com/user-attachments/assets/8d01a701-e268-45d2-a8ac-efbfa7e2c482" />| Collecting the Continuous Variables' Names <img width="1335" height="77" alt="Screenshot 2026-11-07 004319" src="https://github.com/user-attachments/assets/49e30ee1-de7f-4088-bb84-a87c839a8d8c" />|








 





















