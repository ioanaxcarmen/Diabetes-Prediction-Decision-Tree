############################################################
# Diabetes Prediction using Decision Tree (R)
# Author: Ioana Moldovan
# Project Type: Machine Learning Classification
############################################################

# =========================
# 1. Load Libraries
# =========================
# Required libraries for data splitting, modeling, visualization and evaluation
library(caTools)
library(rpart)
library(rpart.plot)
library(caret)

# =========================
# 2. Load Dataset
# =========================
# Load the diabetes dataset
diabetes <- read.csv("Diabetes Data.csv")

# Inspect the structure and summary of the dataset
head(diabetes)
str(diabetes)
summary(diabetes)

# Check for missing values
colSums(is.na(diabetes))

# =========================
# 3. Data Preparation
# =========================
# Convert the outcome variable into a factor for classification
diabetes$Outcome <- as.factor(diabetes$Outcome)

# Examine class distribution of the target variable
table(diabetes$Outcome)
prop.table(table(diabetes$Outcome))

# =========================
# 4. Train/Test Split
# =========================
# Split the dataset into training and testing sets
set.seed(123)

split <- sample.split(diabetes$Outcome, SplitRatio = 0.75)
train_data <- subset(diabetes, split == TRUE)
test_data  <- subset(diabetes, split == FALSE)

# Remove helper column if created during splitting
train_data$split <- NULL
test_data$split <- NULL

# =========================
# 5. Train Decision Tree Model
# =========================
# Train a decision tree model using selected medical predictors
decision_tree_model <- rpart(
  Outcome ~ Age + BMI + Glucose,
  data = train_data,
  method = "class"
)

# Display model structure
print(decision_tree_model)

# Visualize the trained decision tree
rpart.plot(
  decision_tree_model,
  type = 2,
  extra = 104,
  fallen.leaves = TRUE,
  main = "Decision Tree for Diabetes Prediction"
)

# =========================
# 6. Make Predictions
# =========================
# Predict diabetes outcome on the test dataset
predicted_class <- predict(
  decision_tree_model,
  newdata = test_data,
  type = "class"
)

# Predict class probabilities
predicted_prob <- predict(
  decision_tree_model,
  newdata = test_data,
  type = "prob"
)

head(predicted_prob)

# =========================
# 7. Model Evaluation
# =========================
# Evaluate model performance using a confusion matrix
conf_matrix <- confusionMatrix(
  predicted_class,
  test_data$Outcome,
  positive = "1"
)

print(conf_matrix)

# Extract evaluation metrics
accuracy <- conf_matrix$overall["Accuracy"]
sensitivity <- conf_matrix$byClass["Sensitivity"]
specificity <- conf_matrix$byClass["Specificity"]

accuracy
sensitivity
specificity

# =========================
# 8. Class Distribution
# =========================
# Check overall class distribution in the dataset
class_counts <- table(diabetes$Outcome)
class_counts
