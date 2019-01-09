---
layout: post
title: Data Prepocessing, way-to-ds-ep02
tags:
    - ds
---
### Data Proprocessing

There are essentially 6 steps to do data preprocessing.

## Step 1: Importing the libraries
```Python
import numpy as np
import pandas as pd
```

# Step 2: Importing dataset
```python
dataset = pd.read_csv('dataset.csv')
X = dataset.iloc[ : , :-1].values
y = dataset.iloc[ : , 3].values
```

## Step 3: Handling the missing data
```python
from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values = "NaN", strategy = "mean", axis = 0)
imputer = imputer.fit(X[ : , 1:3])
X[ : , 1:3] = imputer.transform(X[ : , 1:3])
```

## Step 4: Encoding categorical data
Some features are not numeric values but text, so to encode the categories into numbers
```python
from sklearn.preprocessing import LabelEncoder
labelencoder_X = LabelEncoder()
X[ : , 0] = labelencoder_X.fit_transform(X[ : , 0])
```

## Step 5: Splitting the dataset into training sets and Test sets 
```python
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split( X , y , test_size = 0.33, random_state = 7)
```

## Step 6: Feature Scaling
Some features are in different standardization, so they should be scaled into normalization
```python
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.fit_transform(X_test)
```