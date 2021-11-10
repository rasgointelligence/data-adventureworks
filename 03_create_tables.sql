USE ROLE SYSADMIN;

-- Create DB
CREATE DATABASE IF NOT EXISTS ADVENTUREWORKS;

-- Create Tables
USE DATABASE ADVENTUREWORKS;
CREATE OR REPLACE TABLE AdventureWorksDWBuildVersion(
	DBVersion nvarchar(50) NULL,
	VersionDate datetime NULL
);

/*
Note:
Changes from MSFT original script:
  - change BIT to TINYTINT
  - change MONEY to DECIMAL(38,4)
  - set two fields in DimProduct to Nullable
*/

CREATE OR REPLACE TABLE DimAccount(
	AccountKey int IDENTITY(1,1) NOT NULL,
	ParentAccountKey int NULL,
	AccountCodeAlternateKey int NULL,
	ParentAccountCodeAlternateKey int NULL,
	AccountDescription nvarchar(50) NULL,
	AccountType nvarchar(50) NULL,
	Operator nvarchar(50) NULL,
	CustomMembers nvarchar(300) NULL,
	ValueType nvarchar(50) NULL,
	CustomMemberOptions nvarchar(200) NULL
);

CREATE OR REPLACE TABLE DimCurrency(
	CurrencyKey int IDENTITY(1,1) NOT NULL,
	CurrencyAlternateKey nchar(3) NOT NULL,
	CurrencyName nvarchar(50) NOT NULL
);

CREATE OR REPLACE TABLE DimCustomer(
	CustomerKey int IDENTITY(1,1) NOT NULL,
	GeographyKey int NULL,
	CustomerAlternateKey nvarchar(15) NOT NULL,
	Title nvarchar(8) NULL,
	FirstName nvarchar(50) NULL,
	MiddleName nvarchar(50) NULL,
	LastName nvarchar(50) NULL,
	NameStyle TINYINT NULL,
	BirthDate date NULL,
	MaritalStatus nchar(1) NULL,
	Suffix nvarchar(10) NULL,
	Gender nvarchar(1) NULL,
	EmailAddress nvarchar(50) NULL,
	YearlyIncome DECIMAL(38,4) NULL,
	TotalChildren tinyint NULL,
	NumberChildrenAtHome tinyint NULL,
	EnglishEducation nvarchar(40) NULL,
	SpanishEducation nvarchar(40) NULL,
	FrenchEducation nvarchar(40) NULL,
	EnglishOccupation nvarchar(100) NULL,
	SpanishOccupation nvarchar(100) NULL,
	FrenchOccupation nvarchar(100) NULL,
	HouseOwnerFlag nchar(1) NULL,
	NumberCarsOwned tinyint NULL,
	AddressLine1 nvarchar(120) NULL,
	AddressLine2 nvarchar(120) NULL,
	Phone nvarchar(20) NULL,
	DateFirstPurchase date NULL,
	CommuteDistance nvarchar(15) NULL
);

CREATE OR REPLACE TABLE DimDate(
	DateKey int NOT NULL,
	FullDateAlternateKey date NOT NULL,
	DayNumberOfWeek tinyint NOT NULL,
	EnglishDayNameOfWeek nvarchar(10) NOT NULL,
	SpanishDayNameOfWeek nvarchar(10) NOT NULL,
	FrenchDayNameOfWeek nvarchar(10) NOT NULL,
	DayNumberOfMonth tinyint NOT NULL,
	DayNumberOfYear smallint NOT NULL,
	WeekNumberOfYear tinyint NOT NULL,
	EnglishMonthName nvarchar(10) NOT NULL,
	SpanishMonthName nvarchar(10) NOT NULL,
	FrenchMonthName nvarchar(10) NOT NULL,
	MonthNumberOfYear tinyint NOT NULL,
	CalendarQuarter tinyint NOT NULL,
	CalendarYear smallint NOT NULL,
	CalendarSemester tinyint NOT NULL,
	FiscalQuarter tinyint NOT NULL,
	FiscalYear smallint NOT NULL,
	FiscalSemester tinyint NOT NULL
);

CREATE OR REPLACE TABLE DimDepartmentGroup(
	DepartmentGroupKey int IDENTITY(1,1) NOT NULL,
	ParentDepartmentGroupKey int NULL,
	DepartmentGroupName nvarchar(50) NULL
);

CREATE OR REPLACE TABLE DimEmployee(
	EmployeeKey int IDENTITY(1,1) NOT NULL,
	ParentEmployeeKey int NULL,
	EmployeeNationalIDAlternateKey nvarchar(15) NULL,
	ParentEmployeeNationalIDAlternateKey nvarchar(15) NULL,
	SalesTerritoryKey int NULL,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	MiddleName nvarchar(50) NULL,
	NameStyle TINYINT NOT NULL,
	Title nvarchar(50) NULL,
	HireDate date NULL,
	BirthDate date NULL,
	LoginID nvarchar(256) NULL,
	EmailAddress nvarchar(50) NULL,
	Phone nvarchar(25) NULL,
	MaritalStatus nchar(1) NULL,
	EmergencyContactName nvarchar(50) NULL,
	EmergencyContactPhone nvarchar(25) NULL,
	SalariedFlag TINYINT NULL,
	Gender nchar(1) NULL,
	PayFrequency tinyint NULL,
	BaseRate DECIMAL(38,4) NULL,
	VacationHours smallint NULL,
	SickLeaveHours smallint NULL,
	CurrentFlag TINYINT NOT NULL,
	SalesPersonFlag TINYINT NOT NULL,
	DepartmentName nvarchar(50) NULL,
	StartDate date NULL,
	EndDate date NULL,
	Status nvarchar(50) NULL,
	EmployeePhoto varbinary NULL
);

CREATE OR REPLACE TABLE DimGeography(
	GeographyKey int IDENTITY(1,1) NOT NULL,
	City nvarchar(30) NULL,
	StateProvinceCode nvarchar(3) NULL,
	StateProvinceName nvarchar(50) NULL,
	CountryRegionCode nvarchar(3) NULL,
	EnglishCountryRegionName nvarchar(50) NULL,
	SpanishCountryRegionName nvarchar(50) NULL,
	FrenchCountryRegionName nvarchar(50) NULL,
	PostalCode nvarchar(15) NULL,
	SalesTerritoryKey int NULL,
	IpAddressLocator nvarchar(15) NULL
);

CREATE OR REPLACE TABLE DimOrganization(
	OrganizationKey int IDENTITY(1,1) NOT NULL,
	ParentOrganizationKey int NULL,
	PercentageOfOwnership nvarchar(16) NULL,
	OrganizationName nvarchar(50) NULL,
	CurrencyKey int NULL
);

CREATE OR REPLACE TABLE DimProduct(
	ProductKey int IDENTITY(1,1) NOT NULL,
	ProductAlternateKey nvarchar(25) NULL,
	ProductSubcategoryKey int NULL,
	WeightUnitMeasureCode nchar(3) NULL,
	SizeUnitMeasureCode nchar(3) NULL,
	EnglishProductName nvarchar(50) NOT NULL,
	SpanishProductName nvarchar(50) NULL, --Needed to set this to Nullable to fix import error
	FrenchProductName nvarchar(50) NULL, --Needed to set this to Nullable to fix import error
	StandardCost DECIMAL(38,4) NULL,
	FinishedGoodsFlag TINYINT NOT NULL,
	Color nvarchar(15) NOT NULL,
	SafetyStockLevel smallint NULL,
	ReorderPoint smallint NULL,
	ListPrice DECIMAL(38,4) NULL,
	Size nvarchar(50) NULL,
	SizeRange nvarchar(50) NULL,
	Weight float NULL,
	DaysToManufacture int NULL,
	ProductLine nchar(2) NULL,
	DealerPrice DECIMAL(38,4) NULL,
	Class nchar(2) NULL,
	Style nchar(2) NULL,
	ModelName nvarchar(50) NULL,
	LargePhoto varbinary NULL,
	EnglishDescription nvarchar(400) NULL,
	FrenchDescription nvarchar(400) NULL,
	ChineseDescription nvarchar(400) NULL,
	ArabicDescription nvarchar(400) NULL,
	HebrewDescription nvarchar(400) NULL,
	ThaiDescription nvarchar(400) NULL,
	GermanDescription nvarchar(400) NULL,
	JapaneseDescription nvarchar(400) NULL,
	TurkishDescription nvarchar(400) NULL,
	StartDate datetime NULL,
	EndDate datetime NULL,
	Status nvarchar(7) NULL
);

CREATE OR REPLACE TABLE DimProductCategory(
	ProductCategoryKey int IDENTITY(1,1) NOT NULL,
	ProductCategoryAlternateKey int NULL,
	EnglishProductCategoryName nvarchar(50) NOT NULL,
	SpanishProductCategoryName nvarchar(50) NOT NULL,
	FrenchProductCategoryName nvarchar(50) NOT NULL
);

CREATE OR REPLACE TABLE DimProductSubcategory(
	ProductSubcategoryKey int IDENTITY(1,1) NOT NULL,
	ProductSubcategoryAlternateKey int NULL,
	EnglishProductSubcategoryName nvarchar(50) NOT NULL,
	SpanishProductSubcategoryName nvarchar(50) NOT NULL,
	FrenchProductSubcategoryName nvarchar(50) NOT NULL,
	ProductCategoryKey int NULL
);

CREATE OR REPLACE TABLE DimPromotion(
	PromotionKey int IDENTITY(1,1) NOT NULL,
	PromotionAlternateKey int NULL,
	EnglishPromotionName nvarchar(255) NULL,
	SpanishPromotionName nvarchar(255) NULL,
	FrenchPromotionName nvarchar(255) NULL,
	DiscountPct float NULL,
	EnglishPromotionType nvarchar(50) NULL,
	SpanishPromotionType nvarchar(50) NULL,
	FrenchPromotionType nvarchar(50) NULL,
	EnglishPromotionCategory nvarchar(50) NULL,
	SpanishPromotionCategory nvarchar(50) NULL,
	FrenchPromotionCategory nvarchar(50) NULL,
	StartDate datetime NOT NULL,
	EndDate datetime NULL,
	MinQty int NULL,
	MaxQty int NULL
);

CREATE OR REPLACE TABLE DimReseller(
	ResellerKey int IDENTITY(1,1) NOT NULL,
	GeographyKey int NULL,
	ResellerAlternateKey nvarchar(15) NULL,
	Phone nvarchar(25) NULL,
	BusinessType varchar(20) NOT NULL,
	ResellerName nvarchar(50) NOT NULL,
	NumberEmployees int NULL,
	OrderFrequency char(1) NULL,
	OrderMonth tinyint NULL,
	FirstOrderYear int NULL,
	LastOrderYear int NULL,
	ProductLine nvarchar(50) NULL,
	AddressLine1 nvarchar(60) NULL,
	AddressLine2 nvarchar(60) NULL,
	AnnualSales DECIMAL(38,4) NULL,
	BankName nvarchar(50) NULL,
	MinPaymentType tinyint NULL,
	MinPaymentAmount DECIMAL(38,4) NULL,
	AnnualRevenue DECIMAL(38,4) NULL,
	YearOpened int NULL
);

CREATE OR REPLACE TABLE DimSalesReason(
	SalesReasonKey int IDENTITY(1,1) NOT NULL,
	SalesReasonAlternateKey int NOT NULL,
	SalesReasonName nvarchar(50) NOT NULL,
	SalesReasonReasonType nvarchar(50) NOT NULL
);

CREATE OR REPLACE TABLE DimSalesTerritory(
	SalesTerritoryKey int IDENTITY(1,1) NOT NULL,
	SalesTerritoryAlternateKey int NULL,
	SalesTerritoryRegion nvarchar(50) NOT NULL,
	SalesTerritoryCountry nvarchar(50) NOT NULL,
	SalesTerritoryGroup nvarchar(50) NULL,
	SalesTerritoryImage varbinary NULL
);

CREATE OR REPLACE TABLE DimScenario(
	ScenarioKey int IDENTITY(1,1) NOT NULL,
	ScenarioName nvarchar(50) NULL
);

CREATE OR REPLACE TABLE FactAdditionalInternationalProductDescription(
	ProductKey int NOT NULL,
	CultureName nvarchar(50) NOT NULL,
	ProductDescription nvarchar NOT NULL
);

CREATE OR REPLACE TABLE FactCallCenter(
	FactCallCenterID int IDENTITY(1,1) NOT NULL,
	DateKey int NOT NULL,
	WageType nvarchar(15) NOT NULL,
	Shift nvarchar(20) NOT NULL,
	LevelOneOperators smallint NOT NULL,
	LevelTwoOperators smallint NOT NULL,
	TotalOperators smallint NOT NULL,
	Calls int NOT NULL,
	AutomaticResponses int NOT NULL,
	Orders int NOT NULL,
	IssuesRaised smallint NOT NULL,
	AverageTimePerIssue smallint NOT NULL,
	ServiceGrade float NOT NULL,
	Date datetime NULL
);

CREATE OR REPLACE TABLE FactCurrencyRate(
	CurrencyKey int NOT NULL,
	DateKey int NOT NULL,
	AverageRate float NOT NULL,
	EndOfDayRate float NOT NULL,
	Date datetime NULL
);

CREATE OR REPLACE TABLE FactFinance(
	FinanceKey int IDENTITY(1,1) NOT NULL,
	DateKey int NOT NULL,
	OrganizationKey int NOT NULL,
	DepartmentGroupKey int NOT NULL,
	ScenarioKey int NOT NULL,
	AccountKey int NOT NULL,
	Amount float NOT NULL,
	Date datetime NULL
);

CREATE OR REPLACE TABLE FactInternetSales(
	ProductKey int NOT NULL,
	OrderDateKey int NOT NULL,
	DueDateKey int NOT NULL,
	ShipDateKey int NOT NULL,
	CustomerKey int NOT NULL,
	PromotionKey int NOT NULL,
	CurrencyKey int NOT NULL,
	SalesTerritoryKey int NOT NULL,
	SalesOrderNumber nvarchar(20) NOT NULL,
	SalesOrderLineNumber tinyint NOT NULL,
	RevisionNumber tinyint NOT NULL,
	OrderQuantity smallint NOT NULL,
	UnitPrice DECIMAL(38,4) NOT NULL,
	ExtendedAmount DECIMAL(38,4) NOT NULL,
	UnitPriceDiscountPct float NOT NULL,
	DiscountAmount float NOT NULL,
	ProductStandardCost DECIMAL(38,4) NOT NULL,
	TotalProductCost DECIMAL(38,4) NOT NULL,
	SalesAmount DECIMAL(38,4) NOT NULL,
	TaxAmt DECIMAL(38,4) NOT NULL,
	Freight DECIMAL(38,4) NOT NULL,
	CarrierTrackingNumber nvarchar(25) NULL,
	CustomerPONumber nvarchar(25) NULL,
	OrderDate datetime NULL,
	DueDate datetime NULL,
	ShipDate datetime NULL
);

CREATE OR REPLACE TABLE FactInternetSalesReason(
	SalesOrderNumber nvarchar(20) NOT NULL,
	SalesOrderLineNumber tinyint NOT NULL,
	SalesReasonKey int NOT NULL
);

CREATE OR REPLACE TABLE FactProductInventory(
	ProductKey int NOT NULL,
	DateKey int NOT NULL,
	MovementDate date NOT NULL,
	UnitCost DECIMAL(38,4) NOT NULL,
	UnitsIn int NOT NULL,
	UnitsOut int NOT NULL,
	UnitsBalance int NOT NULL
);

CREATE OR REPLACE TABLE FactResellerSales(
	ProductKey int NOT NULL,
	OrderDateKey int NOT NULL,
	DueDateKey int NOT NULL,
	ShipDateKey int NOT NULL,
	ResellerKey int NOT NULL,
	EmployeeKey int NOT NULL,
	PromotionKey int NOT NULL,
	CurrencyKey int NOT NULL,
	SalesTerritoryKey int NOT NULL,
	SalesOrderNumber nvarchar(20) NOT NULL,
	SalesOrderLineNumber tinyint NOT NULL,
	RevisionNumber tinyint NULL,
	OrderQuantity smallint NULL,
	UnitPrice DECIMAL(38,4) NULL,
	ExtendedAmount DECIMAL(38,4) NULL,
	UnitPriceDiscountPct float NULL,
	DiscountAmount float NULL,
	ProductStandardCost DECIMAL(38,4) NULL,
	TotalProductCost DECIMAL(38,4) NULL,
	SalesAmount DECIMAL(38,4) NULL,
	TaxAmt DECIMAL(38,4) NULL,
	Freight DECIMAL(38,4) NULL,
	CarrierTrackingNumber nvarchar(25) NULL,
	CustomerPONumber nvarchar(25) NULL,
	OrderDate datetime NULL,
	DueDate datetime NULL,
	ShipDate datetime NULL
);

CREATE OR REPLACE TABLE FactSalesQuota(
	SalesQuotaKey int IDENTITY(1,1) NOT NULL,
	EmployeeKey int NOT NULL,
	DateKey int NOT NULL,
	CalendarYear smallint NOT NULL,
	CalendarQuarter tinyint NOT NULL,
	SalesAmountQuota DECIMAL(38,4) NOT NULL,
	Date datetime NULL
);

CREATE OR REPLACE TABLE FactSurveyResponse(
	SurveyResponseKey int IDENTITY(1,1) NOT NULL,
	DateKey int NOT NULL,
	CustomerKey int NOT NULL,
	ProductCategoryKey int NOT NULL,
	EnglishProductCategoryName nvarchar(50) NOT NULL,
	ProductSubcategoryKey int NOT NULL,
	EnglishProductSubcategoryName nvarchar(50) NOT NULL,
	Date datetime NULL
);

CREATE OR REPLACE TABLE NewFactCurrencyRate(
	AverageRate real NULL,
	CurrencyID nvarchar(3) NULL,
	CurrencyDate date NULL,
	EndOfDayRate real NULL,
	CurrencyKey int NULL,
	DateKey int NULL
);

CREATE OR REPLACE TABLE ProspectiveBuyer(
	ProspectiveBuyerKey int IDENTITY(1,1) NOT NULL,
	ProspectAlternateKey nvarchar(15) NULL,
	FirstName nvarchar(50) NULL,
	MiddleName nvarchar(50) NULL,
	LastName nvarchar(50) NULL,
	BirthDate datetime NULL,
	MaritalStatus nchar(1) NULL,
	Gender nvarchar(1) NULL,
	EmailAddress nvarchar(50) NULL,
	YearlyIncome DECIMAL(38,4) NULL,
	TotalChildren tinyint NULL,
	NumberChildrenAtHome tinyint NULL,
	Education nvarchar(40) NULL,
	Occupation nvarchar(100) NULL,
	HouseOwnerFlag nchar(1) NULL,
	NumberCarsOwned tinyint NULL,
	AddressLine1 nvarchar(120) NULL,
	AddressLine2 nvarchar(120) NULL,
	City nvarchar(30) NULL,
	StateProvinceCode nvarchar(3) NULL,
	PostalCode nvarchar(15) NULL,
	Phone nvarchar(20) NULL,
	Salutation nvarchar(8) NULL,
	Unknown int NULL
);

-- Grant permissions (if necessary)
GRANT USAGE ON DATABASE ADVENTUREWORKS TO ROLE <YOURROLE>;
GRANT USAGE ON SCHEMA ADVENTUREWORKS.PUBLIC TO ROLE <YOURROLE>;
GRANT SELECT ON ALL TABLES IN SCHEMA ADVENTUREWORKS.PUBLIC TO ROLE <YOURROLE>;