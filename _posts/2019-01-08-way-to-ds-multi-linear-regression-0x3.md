---
layout: post
title: Multi-linear Regression, way-to-ds-ep04
tags:
    - ds
---
# Conventional Methods -- Multiple Linear Regression

## Defination

It attempts to build a predictive model using two or more features to get result y by fitting a linear equation.
y = w0 + w1x1 + w2x2 + ... + wnxn

## Problem with too many features
Having too many features could cause model less accurate. So it is neccessary to select features before we train the model.
We can remove features with low variance, or other methods provided by sklearn: https://scikit-learn.org/stable/modules/feature_selection.html

## Steps with code example

### Step 1: Data Preprocessing

#### Importing the libraries
```python
import pandas as pd
import numpy as np
```
#### Importing the dataset
```python
dataset = pd.read_csv('50_Startups.csv')
X = dataset.iloc[ : , :-1].values
Y = dataset.iloc[ : ,  4 ].values
```

#### Encoding Categorical data
```python
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder = LabelEncoder()
X[: , 3] = labelencoder.fit_transform(X[ : , 3])
onehotencoder = OneHotEncoder(categorical_features = [3])
X = onehotencoder.fit_transform(X).toarray()
```

#### Avoiding Dummy Variable Trap
```python
X = X[: , 1:]
```

#### Do features selection
```python
from sklearn.feature_selection import VarianceThreshold

sel_X = VarianceThreshold(threshold=(.8 * (1 - .8)))
sel_X.fit_transform(X)
```

#### Splitting the dataset into the Training set and Test set
```python
from sklearn.cross_validation import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(sel_X, Y, test_size = 0.2, random_state = 0)
```
### Step 2: Fitting Multiple Linear Regression to the Training set
```python
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, Y_train)
```

### Step 3: Predicting the Test set results
```python
y_pred = regressor.predict(X_test)
```