# SQL-Project
This project is part of my Data Analysis Portfolio.

# Data Cleaning: Companies Layoffs Analysis

## Objective
This project involves cleaning and standardizing a dataset of company layoffs to prepare it for analysis. 
The cleaned data will enable meaningful insights into trends in layoffs by industry, location, and other factors.

## Steps Taken
1. **Backup Creation**:
   - A staging table was created to preserve the original data.

2. **Deduplication**:
   - Removed duplicate rows using the `DISTINCT` keyword.

3. **Standardization**:
   - Whitespace was trimmed from text fields.
   - Industries and countries were standardized for consistency.
   - Dates were converted to the `MM-DD-YYYY` format.

4. **Handling Missing Data**:
   - Filled missing industry values based on business rules.
   - Removed rows with insufficient data for analysis.

5. **Final Cleanup**:
   - Verified the dataset for consistency and completeness.

## Technologies Used
- MySQL Workbench
- SQL

## Dataset
- **Source**: https://github.com/EBenati/Datasets/blob/main/companies_layoffs.csv

## Outcomes
The cleaned dataset is ready for analysis and can help answer questions such as:
- Which industries experienced the most layoffs?
- Are layoffs more frequent in certain countries or stages of company growth?

## Usage
Clone this repository and execute the SQL scripts in MySQL Workbench to recreate the cleaned dataset.

## SQL Scripts
The data cleaning process is implemented in SQL and includes:
- Removes duplicates, standardizes data, and handles missing values.

You can find all the scripts in the [Data_Cleaning_Project.sql](SQL-Project/Data_Cleaning_Project.sql) folder.


## Contact
Feel free to reach out via [LinkedIn](https://www.linkedin.com/in/everton-benati-536b491a8/) or email: e.benati.dev@gmail.com
