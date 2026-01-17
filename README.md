# Customer Churn Analysis & Prediction (SQL | Power BI | Machine Learning)

## Project Overview

This project is an end-to-end customer churn analysis and prediction system built using SQL, Power BI, and Machine Learning.
The goal is to identify churn drivers, quantify revenue impact, and predict high-risk customers to support data-driven retention strategies.

## Tools & Technologies

- MySQL (Data storage & analysis)
- SQL (EDA, churn analysis, revenue impact)
- Power BI (Interactive dashboards & KPIs)
- Python (Pandas, NumPy, Scikit-learn)
- Machine Learning (Logistic Regression, Decision Tree, Random Forest)

## Dataset

- IBM Telco Customer Churn Dataset
- 7,032 customers with demographic, service, billing, and churn information

## Project Structure

Telco-Churn-Analysis/
├── SQL/
│ └── telco_churn_analysis.sql
├── PowerBI/
│ └── telco_churn_dashboard.pbix
├── Notebook/
│ └── telco_churn_ml.ipynb
├── Screenshots/
│ ├── churn_kpis.png
│ ├── churn_drivers.png
│ ├── revenue_impact.png
│ └── model_results.png
└── README.md

## SQL Analysis

- Data validation and cleaning
- Churn rate analysis (26.58%)
- Churn by contract type, internet service, payment method
- Tenure-based churn analysis
- Revenue loss due to churn (30.53%)
- Identification of high-value churn customers

## Power BI Dashboard

**KPIs**

- Total Customers
- Churn Rate
- Revenue Lost
- Revenue at Risk

**Visuals**

- Churn by Contract Type
- Churn by Internet Service
- Churn by Payment Method
- Churn by Tenure Buckets
- Revenue Impact Analysis

## Machine Learning (Data Science)

- Feature engineering & encoding
- Feature scaling
- Model training and comparison:
  - Logistic Regression (baseline)
  - Decision Tree
  - Random Forest (final model)

**Final Model**

- Random Forest Classifier
- Churn Recall: 78%
- Selected to maximize detection of at-risk customers

## Key Insights

- New customers churn significantly more than long-tenure customers
- Month-to-month contracts have the highest churn
- Fiber optic customers show elevated churn risk
- Electronic check users churn more frequently
- High monthly charges increase churn probability

## Business Recommendations

- Focus retention efforts on customers with tenure < 12 months
- Incentivize upgrades from month-to-month to long-term contracts
- Investigate service quality issues for fiber optic users
- Promote auto-pay methods to reduce churn risk

## Notes

- Project built for portfolio and learning purposes
- No credentials included in Power BI files
