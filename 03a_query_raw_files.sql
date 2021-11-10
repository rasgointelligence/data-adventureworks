USE ROLE SYSADMIN;
USE DATABASE ADVENTUREWORKS;

-- Query Raw files
SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
FROM @AWS_ADVENTUREWORKS/DimAccount.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29
FROM @AWS_ADVENTUREWORKS/DimCustomer.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3
FROM @AWS_ADVENTUREWORKS/DimCurrency.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19
FROM @AWS_ADVENTUREWORKS/DimDate.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3
FROM @AWS_ADVENTUREWORKS/DimDepartmentGroup.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $30, $31
FROM @AWS_ADVENTUREWORKS/DimEmployee.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
FROM @AWS_ADVENTUREWORKS/DimGeography.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5
FROM @AWS_ADVENTUREWORKS/DimOrganization.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $30, $31, $32, $33, $34, $35, $36
FROM @AWS_ADVENTUREWORKS/DimProduct.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5
FROM @AWS_ADVENTUREWORKS/DimProductCategory.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6
FROM @AWS_ADVENTUREWORKS/DimProductSubcategory.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16
FROM @AWS_ADVENTUREWORKS/DimPromotion.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20
FROM @AWS_ADVENTUREWORKS/DimReseller.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4
FROM @AWS_ADVENTUREWORKS/DimSalesReason.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6
FROM @AWS_ADVENTUREWORKS/DimSalesTerritory.csv (FILE_FORMAT => AW_CSV);

SELECT $1,  $2
FROM @AWS_ADVENTUREWORKS/DimScenario.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3
FROM @AWS_ADVENTUREWORKS/FactAdditionalInternationalProductDescription.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14
FROM @AWS_ADVENTUREWORKS/FactCallCenter.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5
FROM @AWS_ADVENTUREWORKS/FactCurrencyRate.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8
FROM @AWS_ADVENTUREWORKS/FactFinance.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26
FROM @AWS_ADVENTUREWORKS/FactInternetSales.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3
FROM @AWS_ADVENTUREWORKS/FactInternetSalesReason.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9
FROM @AWS_ADVENTUREWORKS/FactProductInventory.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27
FROM @AWS_ADVENTUREWORKS/FactResellerSales.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7
FROM @AWS_ADVENTUREWORKS/FactSalesQuota.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8
FROM @AWS_ADVENTUREWORKS/FactSurveyResponse.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6
FROM @AWS_ADVENTUREWORKS/NewFactCurrencyRate.csv (FILE_FORMAT => AW_CSV);

SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24
FROM @AWS_ADVENTUREWORKS/ProspectiveBuyer.csv (FILE_FORMAT => AW_CSV);
