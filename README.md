# Project_3

Project 3 overview:

For Project 3, we selected the Data Visualization track. Data sources used were the United States Census data from the 2020 census and New Jersey Crime Statistics from the New Jersey State Police for 2018, 2019, ad 2020. 

Using these data sources, a comparison by county of median household income, educational statistics, and crime data was conducted. 

Utilizing jupyter notebook & visual studio code, code was written to extract, transform, and load data into the csv files for database intergation with pgAdmin. 

Using quickdatabasediagrams.com, an Entity Relationship Diagram (ERD) was created for the CSV files establishing both primary and foregin keys. A table schema from the ERD was created.




Instructions on how to use and interact with the project




Ethical considerations made in the project:

Data sources used were publicly available from the US Census & New Jersey State Police. The US Census data is a highly standardized data set that has had some changes to demographic data, but our data set contained only median household income, population, and educational achievement statistics. The New Jersey Crime statistics were summarized by agency and did not contain actual names or references to case files. All data sources were either by town or county within New Jersey and did not contain any private peronsal information. 



References for the data source(s):

US Census Data sources
https://pypi.org/project/censusdis/
https://api.census.gov/data/2020.html
https://api.census.gov/data/2020/acs/acs5/variables.html

New Jersey Crime Statistics
https://www.nj.gov/njsp/ucr/uniform-crime-reports.shtml

NJ County Boundaries
https://njogis-newjersey.opendata.arcgis.com/datasets/newjersey::county-boundaries-of-nj/explore?showTable=true

# Source code detail
1. Data Files: the source data files and the csv files after cleaning up.
2. SQL Schema and ERD: SQL exported from QuickDBD and data schema ERD graph.
3. API folder: Using Python Flask to create API function to get census and crime data view from Postgres database
4. Mapping folder: The dashboard uses Leaflet and plotly to visualize chorspleth map and bar chart to visualize the crime, census and geography data correlation.
5. ETL folder: the ETL function uses openpyxl library to extract data from excel spreadsheet files: 2018_Uniform_Crime_Report.xlsx, 2019_Uniform_Crime_Report.xlsx and 2020_Uniform_Crime_Report.xlsx and output as csv: Crime_Data.csv
6. Jupyter notebook files:
     * Graphs.ipynb: visualization of correlation between crime, household median income, population and education in NJ.
     * Census CSV.ipynb: one of ETL process to get census data using censusdis library.
     * Project_3_Census.ipynb: one of ETL process to get census data using censusdis library and plot chorospleth map.

