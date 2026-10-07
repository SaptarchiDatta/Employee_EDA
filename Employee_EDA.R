
# Create dataset
df <- data.frame(
  Employee_ID = 1:20,
  Age = c(22,25,28,31,35,29,24,27,40,33,26,30,37,23,32,28,41,36,25,34),
  Gender = c("Male","Female","Male","Female","Male","Female","Male","Female","Male","Female",
             "Male","Female","Male","Female","Male","Female","Male","Female","Male","Female"),
  Department = c("IT","HR","IT","Finance","IT","Marketing","HR","IT","Finance","Marketing",
                 "IT","Finance","IT","HR","Marketing","IT","Finance","IT","HR","Marketing"),
  Experience = c(1,3,5,7,10,6,2,4,15,9,3,8,12,1,7,5,14,11,3,10),
  Education = c("Bachelor","Master","Master","Master","PhD","Bachelor","Bachelor","Master","PhD","Master",
                "Bachelor","Master","PhD","Bachelor","Master","Master","PhD","Master","Bachelor","Master"),
  Salary = c(35000,42000,55000,65000,95000,58000,38000,52000,120000,72000,
             45000,68000,105000,33000,70000,60000,115000,90000,41000,78000),
  Performance_Score = c(65,72,80,85,95,78,60,82,92,88,70,86,94,58,84,79,96,91,68,89),
  Projects = c(2,3,5,6,9,5,2,4,12,7,3,6,10,1,6,5,11,9,3,8),
  Remote = c("Yes","No","Yes","No","Yes","Yes","No","Yes","No","Yes",
             "Yes","No","Yes","No","Yes","No","Yes","No","Yes","No")
)

# View dataset
View(df)

# Display first rows
head(df)

# Display last rows
tail(df)

# Check dataset dimensions
dim(df)

# Check number of rows
nrow(df)

# Check number of columns
ncol(df)

# Display column names
names(df)

# Check dataset structure
str(df)

# Check data types
sapply(df, class)

# Generate summary statistics
summary(df)

# Check missing values
colSums(is.na(df))

# Check total missing values
sum(is.na(df))

# Check duplicate rows
sum(duplicated(df))

# Display duplicate rows
df[duplicated(df), ]

# Find unique departments
unique(df$Department)

# Find unique genders
unique(df$Gender)

# Find unique education levels
unique(df$Education)

# Find unique remote values
unique(df$Remote)

# Count unique departments
length(unique(df$Department))

# Count unique genders
length(unique(df$Gender))

# Count unique education levels
length(unique(df$Education))

# Count employees by department
table(df$Department)

# Count employees by gender
table(df$Gender)

# Count employees by education
table(df$Education)

# Count remote employees
table(df$Remote)

# Calculate department percentages
prop.table(table(df$Department)) * 100

# Calculate gender percentages
prop.table(table(df$Gender)) * 100

# Calculate education percentages
prop.table(table(df$Education)) * 100

# Calculate remote percentages
prop.table(table(df$Remote)) * 100

# Calculate average age
mean(df$Age)

# Calculate median age
median(df$Age)

# Find minimum age
min(df$Age)

# Find maximum age
max(df$Age)

# Calculate average experience
mean(df$Experience)

# Calculate median experience
median(df$Experience)

# Find minimum experience
min(df$Experience)

# Find maximum experience
max(df$Experience)

# Calculate average salary
mean(df$Salary)

# Calculate median salary
median(df$Salary)

# Find minimum salary
min(df$Salary)

# Find maximum salary
max(df$Salary)

# Calculate average performance
mean(df$Performance_Score)

# Calculate median performance
median(df$Performance_Score)

# Find minimum performance
min(df$Performance_Score)

# Find maximum performance
max(df$Performance_Score)

# Calculate average projects
mean(df$Projects)

# Calculate median projects
median(df$Projects)

# Calculate average salary by department
dept_salary <- aggregate(
  Salary ~ Department,
  data = df,
  FUN = mean
)

dept_salary

# Calculate average performance by department
dept_performance <- aggregate(
  Performance_Score ~ Department,
  data = df,
  FUN = mean
)

dept_performance

# Calculate average experience by department
dept_experience <- aggregate(
  Experience ~ Department,
  data = df,
  FUN = mean
)

dept_experience

# Count employees by department
dept_count <- as.data.frame(table(df$Department))

names(dept_count) <- c("Department", "Employee_Count")

dept_count

# Load dplyr
library(dplyr)

# Create department summary
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

department_summary

# Sort departments by salary
salary_sorted <- department_summary %>%
  arrange(desc(Average_Salary))

salary_sorted

# Find highest paid employee
highest_paid <- df %>%
  arrange(desc(Salary)) %>%
  head(1)

highest_paid

# Find lowest paid employee
lowest_paid <- df %>%
  arrange(Salary) %>%
  head(1)

lowest_paid

# Find highest performing employee
highest_performer <- df %>%
  arrange(desc(Performance_Score)) %>%
  head(1)

highest_performer

# Find lowest performing employee
lowest_performer <- df %>%
  arrange(Performance_Score) %>%
  head(1)

lowest_performer

# Filter experienced employees
experienced_employees <- df %>%
  filter(Experience > 5)

experienced_employees

# Filter high salary employees
high_salary_employees <- df %>%
  filter(Salary > 70000)

high_salary_employees

# Filter high performing employees
high_performers <- df %>%
  filter(Performance_Score > 90)

high_performers

# Filter IT employees
it_employees <- df %>%
  filter(Department == "IT")

it_employees

# Filter master degree employees
master_employees <- df %>%
  filter(Education == "Master")

master_employees

# Calculate salary by education
education_salary <- df %>%
  group_by(Education) %>%
  summarise(
    Average_Salary = mean(Salary),
    Employee_Count = n()
  )

education_salary

# Calculate salary by gender
gender_salary <- df %>%
  group_by(Gender) %>%
  summarise(
    Average_Salary = mean(Salary),
    Employee_Count = n()
  )

gender_salary

# Calculate performance by gender
gender_performance <- df %>%
  group_by(Gender) %>%
  summarise(
    Average_Performance = mean(Performance_Score),
    Employee_Count = n()
  )

gender_performance

# Analyze remote employees
remote_analysis <- df %>%
  group_by(Remote) %>%
  summarise(
    Average_Salary = mean(Salary),
    Average_Performance = mean(Performance_Score),
    Average_Experience = mean(Experience),
    Employee_Count = n()
  )

remote_analysis

# Calculate experience and salary correlation
cor(df$Experience, df$Salary)

# Calculate experience and performance correlation
cor(df$Experience, df$Performance_Score)

# Calculate projects and performance correlation
cor(df$Projects, df$Performance_Score)

# Calculate projects and salary correlation
cor(df$Projects, df$Salary)

# Select numerical columns
numeric_columns <- df[, c(
  "Age",
  "Experience",
  "Salary",
  "Performance_Score",
  "Projects"
)]

# Create correlation matrix
correlation_matrix <- cor(numeric_columns)

correlation_matrix

# Plot salary distribution
hist(
  df$Salary,
  main = "Salary Distribution",
  xlab = "Salary",
  ylab = "Number of Employees"
)

# Plot age distribution
hist(
  df$Age,
  main = "Age Distribution",
  xlab = "Age",
  ylab = "Number of Employees"
)

# Plot experience distribution
hist(
  df$Experience,
  main = "Experience Distribution",
  xlab = "Years of Experience",
  ylab = "Number of Employees"
)

# Plot performance distribution
hist(
  df$Performance_Score,
  main = "Performance Distribution",
  xlab = "Performance Score",
  ylab = "Number of Employees"
)

# Plot department employee count
barplot(
  table(df$Department),
  main = "Employees by Department",
  xlab = "Department",
  ylab = "Number of Employees"
)

# Plot salary by department
boxplot(
  Salary ~ Department,
  data = df,
  main = "Salary by Department",
  xlab = "Department",
  ylab = "Salary"
)

# Plot experience versus salary
plot(
  df$Experience,
  df$Salary,
  main = "Experience vs Salary",
  xlab = "Years of Experience",
  ylab = "Salary",
  pch = 19
)

# Add regression line
abline(lm(Salary ~ Experience, data = df))

# Plot experience versus performance
plot(
  df$Experience,
  df$Performance_Score,
  main = "Experience vs Performance",
  xlab = "Years of Experience",
  ylab = "Performance Score",
  pch = 19
)

# Plot projects versus performance
plot(
  df$Projects,
  df$Performance_Score,
  main = "Projects vs Performance",
  xlab = "Number of Projects",
  ylab = "Performance Score",
  pch = 19
)

# Plot education versus salary
boxplot(
  Salary ~ Education,
  data = df,
  main = "Salary by Education",
  xlab = "Education",
  ylab = "Salary"
)

# Save dataset as CSV
write.csv(
  df,
  "employee_performance_data.csv",
  row.names = FALSE
)

# Confirm completion
print("EDA completed successfully!")

