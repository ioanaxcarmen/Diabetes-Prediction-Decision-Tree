# Diabetes Prediction - Decision Tree (R)

## Project Overview
This project applies a **machine learning classification model** to predict whether a patient is likely to develop diabetes based on medical attributes.

The objective is to explore how clinical features such as **age, BMI, and glucose levels** contribute to diabetes risk and to evaluate the performance of a predictive model.

Machine learning models for medical prediction can help support **early diagnosis and preventive healthcare decisions**.

---

## Dataset
The dataset is based on medical diagnostic measurements originally collected by the **National Institute of Diabetes and Digestive and Kidney Diseases**.

All patients in the dataset are female individuals of **Pima Indian heritage aged 21 years or older**.

Key variables used in the model include:

- Age
- Body Mass Index (BMI)
- Glucose level
- Diabetes outcome (target variable)

---

## Methodology

### 1. Data Preparation
- Inspection of dataset structure and missing values
- Conversion of the target variable into a categorical factor
- Data splitting into **training and testing sets**

### 2. Model Development
A **Decision Tree classification model** was trained using selected medical predictors to estimate diabetes risk.

The model was implemented using the **rpart** package in R.

### 3. Model Evaluation
Model performance was evaluated using a **confusion matrix**, including metrics such as:

- Accuracy
- True Positive Rate
- True Negative Rate

### 4. Interpretation
The decision tree structure allows for interpretation of how variables such as **Age, BMI, and Glucose levels** influence the prediction outcome.

---

## Key Insights
The model achieved a classification accuracy of approximately **75%**, demonstrating that the selected medical features provide meaningful predictive power for diabetes risk.

The analysis also highlighted a **class imbalance** in the dataset, which may influence model performance and suggests potential improvements through balanced sampling techniques.

---

## Technologies Used

- R
- rpart
- rpart.plot
- caret

---

## Future Improvements

Possible next steps include:

- Addressing class imbalance through resampling techniques
- Testing additional classification models (Random Forest, Logistic Regression)
- Including more predictive medical features
- Evaluating performance using cross-validation
