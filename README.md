# House Price Predictor

A MATLAB/Octave implementation of various regression techniques for predicting house prices.

## Overview

This project implements different regression algorithms to predict house prices based on various features. It includes implementations of:

- Linear Regression
- Ridge Regression
- Lasso Regression
- Normal Equation method

## Files Description

- `gradient_descent.m` - Implementation of the gradient descent optimization algorithm
- `linear_regression_cost_function.m` - Cost function for linear regression
- `ridge_regression_cost_function.m` - Cost function for ridge regression (L2 regularization)
- `lasso_regression_cost_function.m` - Cost function for lasso regression (L1 regularization)
- `normal_equation.m` - Implementation of the normal equation method for linear regression
- `parse_csv_file.m` - Utility function to parse CSV input files
- `parse_data_set_file.m` - Data set parsing functionality
- `prepare_for_regression.m` - Data preparation and preprocessing for regression

## Requirements

- MATLAB or GNU Octave

## Usage

1. Prepare your dataset in CSV format
2. Use `parse_csv_file.m` to load your data
3. Process the data using `prepare_for_regression.m`
4. Choose your preferred regression method:
   - Linear Regression
   - Ridge Regression (for handling multicollinearity)
   - Lasso Regression (for feature selection)
   - Normal Equation (for smaller datasets)
