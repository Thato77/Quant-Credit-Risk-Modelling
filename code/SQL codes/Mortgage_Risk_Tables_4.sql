SELECT orig_1.*,target."Bad" FROM mortgage_orig_2020_1 orig_1
JOIN mortgage_pd_target_2020 target ON  orig_1."Loan Sequence Number" = target."Loan Sequence Number";
SELECT * FROM mortgage_pd_target_2020;

CREATE TABLE pd_mortgage_data AS 
SELECT orig_1.*,target."Bad" FROM mortgage_orig_2020_1 orig_1
JOIN mortgage_pd_target_2020 target ON  orig_1."Loan Sequence Number" = target."Loan Sequence Number";

SELECT * FROM pd_mortgage_data;

SELECT COUNT(*) FROM mortgage_perf_2020_1
WHERE "Current Loan Delinquency Status" IN ('00','01','02');

SELECT "Bad",COUNT(*) FROM pd_mortgage_data
GROUP BY "Bad";