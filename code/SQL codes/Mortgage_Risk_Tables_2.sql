

SELECT * FROM mortgage_perf_2020_1;

COPY mortgage_perf_2020_1
FROM 'C:\Temp\mortgage_perf_2020_1.txt'
WITH(FORMAT csv,DELIMITER '|',HEADER TRUE);

