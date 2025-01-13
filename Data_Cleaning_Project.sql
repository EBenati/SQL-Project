-- 1 - CREATING BACKUP TABLE FOR RECOVERING IN CASE IT'S NECESSARY.
-- 1.1 - Creating backup table
CREATE TABLE companies_layoffs_staging
LIKE companies_layoffs;	

-- 1.2 - Inserting the data on staging table
INSERT companies_layoffs_staging
SELECT *
FROM companies_layoffs;

SELECT *
FROM companies_layoffs_staging;

-- 2 - REMOVING DUPLICATES USING DISTINCT
CREATE TABLE companies_layoffs_staging_cleaning AS
SELECT DISTINCT company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions 
FROM companies_layoffs_staging;

-- 3 - STANDARDIZING DATA
-- 3.1 - Removing white spaces
UPDATE companies_layoffs_staging_cleaning
SET company = TRIM(company);

-- 3.2 - Standardizing values
SELECT DISTINCT(industry) FROM companies_layoffs_staging_cleaning ORDER BY 1; -- Inconsistences found in the industry column

UPDATE companies_layoffs_staging_cleaning
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT(country) FROM companies_layoffs_staging_cleaning ORDER BY 1;
UPDATE companies_layoffs_staging_cleaning
SET country = 'United States'
WHERE country = 'United States.'
;

-- 3.3 - Change date type and format
SELECT `date`FROM companies_layoffs_staging_cleaning; -- Verifying date format

UPDATE companies_layoffs_staging_cleaning-- Modifying data format
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE companies_layoffs_staging_cleaning-- -- Modifying data type
MODIFY COLUMN `date` DATE;

-- 3.4 - Deal with NULL and blancs
SELECT * FROM companies_layoffs_staging_cleaning -- Finding blancs and NULL's values in columns (ex: industry)
WHERE industry IS NULL OR industry = '';

UPDATE companies_layoffs_staging_cleaning
SET industry = 'Entertainment'
WHERE company = "Bally's Interactive";

UPDATE companies_layoffs_staging_cleaning
SET industry = 'Consumer'
WHERE company = "Juul";

UPDATE companies_layoffs_staging_cleaning
SET industry = 'Travel'
WHERE company = "Airbnb";

UPDATE companies_layoffs_staging_cleaning
SET industry = 'Transportation'
WHERE company = "Carvana";

SELECT * FROM companies_layoffs_staging_cleaning -- Finding NULL's and blancs in key columns for analyses.
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

-- The whole point is to analyse companies layoffs and without this data blanc or NULL rows are useless.
DELETE 
FROM companies_layoffs_staging_cleaning
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;
