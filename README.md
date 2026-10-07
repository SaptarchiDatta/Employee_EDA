````markdown
# Employee Performance EDA with R

## Project Overview

This project performs Exploratory Data Analysis (EDA) on an employee performance dataset using R.

The dataset contains information about employee demographics, education, department, experience, salary, performance, projects, and remote work status.

The goal of this project is to understand the dataset, identify patterns and relationships, and generate useful business insights through statistical analysis and visualization.

---

## Objectives

The main objectives of this project are:

- Understand the structure of the dataset
- Inspect rows and columns
- Identify data types
- Check for missing values
- Check for duplicate records
- Analyze categorical variables
- Analyze numerical variables
- Calculate descriptive statistics
- Compare salaries across departments
- Analyze employee performance
- Study the relationship between experience and salary
- Study the relationship between projects and performance
- Analyze salary by education level
- Analyze remote and non-remote employees
- Calculate correlations
- Create visualizations
- Generate a summary dataset for further analysis

---

## Dataset

The dataset contains 20 employee records and 10 variables.

| Column | Description | Data Type |
|---|---|---|
| Employee_ID | Unique employee identifier | Integer |
| Age | Employee age | Integer |
| Gender | Employee gender | Categorical |
| Department | Employee department | Categorical |
| Experience | Years of professional experience | Integer |
| Education | Highest education level | Categorical |
| Salary | Employee salary | Integer |
| Performance_Score | Employee performance score | Integer |
| Projects | Number of projects completed | Integer |
| Remote | Whether the employee works remotely | Categorical |

---

## Dataset Structure

```text
Employee Performance Dataset
│
├── Employee_ID
├── Age
├── Gender
├── Department
├── Experience
├── Education
├── Salary
├── Performance_Score
├── Projects
└── Remote
````

---

## Tools and Technologies

* R
* RStudio
* Base R
* dplyr
* Data Visualization
* Statistical Analysis

---

## R Packages

The project primarily uses:

```r
library(dplyr)
```

If `dplyr` is not installed:

```r
install.packages("dplyr")
```

---

## Project Workflow

The analysis follows a structured EDA workflow:

```text
Create Dataset
      ↓
Understand Dataset
      ↓
Check Data Types
      ↓
Check Missing Values
      ↓
Check Duplicates
      ↓
Analyze Categorical Variables
      ↓
Analyze Numerical Variables
      ↓
Group-Based Analysis
      ↓
Correlation Analysis
      ↓
Visualization
      ↓
Business Insights
```

---

## Exploratory Data Analysis

### 1. Dataset Inspection

The following R functions are used to understand the dataset:

```r
head(df)
tail(df)
dim(df)
nrow(df)
ncol(df)
names(df)
str(df)
summary(df)
```

---

### 2. Missing Value Analysis

Missing values are checked using:

```r
colSums(is.na(df))
```

The total number of missing values is calculated using:

```r
sum(is.na(df))
```

---

### 3. Duplicate Analysis

Duplicate records are identified using:

```r
sum(duplicated(df))
```

---

### 4. Categorical Analysis

The project analyzes:

* Department
* Gender
* Education
* Remote status

Frequency analysis is performed using:

```r
table(df$Department)
table(df$Gender)
table(df$Education)
table(df$Remote)
```

---

## Numerical Analysis

The following variables are analyzed:

* Age
* Experience
* Salary
* Performance Score
* Projects

Descriptive statistics include:

* Mean
* Median
* Minimum
* Maximum

Example:

```r
mean(df$Salary)
median(df$Salary)
min(df$Salary)
max(df$Salary)
```

---

## Department Analysis

The project calculates department-level statistics such as:

* Average salary
* Average experience
* Average performance
* Average projects
* Total projects
* Employee count

Using `dplyr`:

```r
department_summary <- df %>%
  group_by(Department) %>%
  summarise(
    Average_Salary = mean(Salary),
    Average_Experience = mean(Experience),
    Average_Performance = mean(Performance_Score),
    Average_Projects = mean(Projects),
    Total_Projects = sum(Projects),
    Employee_Count = n()
  )
```

---

## Employee Analysis

The project identifies:

### Highest Paid Employee

```r
df %>%
  arrange(desc(Salary)) %>%
  head(1)
```

### Lowest Paid Employee

```r
df %>%
  arrange(Salary) %>%
  head(1)
```

### Highest Performing Employee

```r
df %>%
  arrange(desc(Performance_Score)) %>%
  head(1)
```

### Employees with More Than 5 Years of Experience

```r
df %>%
  filter(Experience > 5)
```

### Employees with Salary Above 70,000

```r
df %>%
  filter(Salary > 70000)
```

---

## Correlation Analysis

Correlation is used to examine relationships between numerical variables.

The project analyzes:

```text
Experience ↔ Salary
Experience ↔ Performance
Projects ↔ Performance
Projects ↔ Salary
```

Example:

```r
cor(df$Experience, df$Salary)
```

A complete correlation matrix is also created:

```r
numeric_columns <- df[, c(
  "Age",
  "Experience",
  "Salary",
  "Performance_Score",
  "Projects"
)]

correlation_matrix <- cor(numeric_columns)

correlation_matrix
```

---

## Data Visualization

The project creates several visualizations using Base R.

### Salary Distribution

```r
hist(df$Salary)
```

### Age Distribution

```r
hist(df$Age)
```

### Experience Distribution

```r
hist(df$Experience)
```

### Performance Distribution

```r
hist(df$Performance_Score)
```

### Employees by Department

```r
barplot(table(df$Department))
```

### Salary by Department

```r
boxplot(Salary ~ Department, data = df)
```

### Experience vs Salary

```r
plot(df$Experience, df$Salary)
```

### Experience vs Performance

```r
plot(df$Experience, df$Performance_Score)
```

### Projects vs Performance

```r
plot(df$Projects, df$Performance_Score)
```

### Salary by Education

```r
boxplot(Salary ~ Education, data = df)
```

---

## Project Files

The recommended project structure is:

```text
Employee-Performance-EDA/
│
├── README.md
│
├── Employee_Performance_EDA.R
│
├── employee_performance_data.csv
│
└── visualizations/
```

---

## How to Run the Project

### Step 1

Install R from the official R website.

### Step 2

Install RStudio.

### Step 3

Open:

```text
Employee_Performance_EDA.R
```

### Step 4

Install the required package:

```r
install.packages("dplyr")
```

### Step 5

Run the complete R script.

The script will:

1. Create the dataset
2. Perform data inspection
3. Analyze missing values
4. Check duplicates
5. Perform statistical analysis
6. Perform group-based analysis
7. Calculate correlations
8. Create visualizations
9. Export the dataset as CSV

---

## Key Questions Answered

This project is designed to answer questions such as:

1. Which department has the highest average salary?
2. Which department has the highest average performance?
3. Does salary increase with experience?
4. Does experience relate to performance?
5. Does the number of projects relate to performance?
6. Which education level has the highest average salary?
7. What percentage of employees work remotely?
8. Which employee has the highest salary?
9. Which employee has the highest performance score?
10. How are salaries distributed across departments?

---

## Skills Demonstrated

This project demonstrates practical skills in:

* R Programming
* Data Frames
* Data Cleaning
* Exploratory Data Analysis
* Descriptive Statistics
* Data Aggregation
* Data Filtering
* Grouped Analysis
* Correlation Analysis
* Data Visualization
* `dplyr`
* Business-oriented Data Analysis

---

## Future Improvements

The project can be extended by adding:

* Missing-value treatment
* Outlier detection
* Advanced data cleaning
* ggplot2 visualizations
* Correlation heatmaps
* Interactive visualizations
* Statistical hypothesis testing
* Regression analysis
* Employee salary prediction
* Employee performance prediction
* Power BI dashboard
* Tableau dashboard

---

## Author

**Saptarchi Datta**

BCA–MCA Dual Degree
Techno India University, West Bengal

---

## Conclusion

This project demonstrates a complete beginner-friendly Exploratory Data Analysis workflow in R, starting from dataset creation and progressing through data inspection, statistical analysis, grouping, correlation analysis, and visualization.

The project can serve as a foundation for more advanced data analysis, statistical modeling, machine learning, and business intelligence projects.

```

This README is suitable for a **GitHub portfolio project** and matches the R script we created.
```
