---
layout: post
title: K Nearest Neighbours, way-to-ds-ep06
tags:
    - ds
---
# Conventional Methods -- KNN

## Defination

It is used to do classification solving by regression which gives 0 or 1 outcome. This is achieved by applying a thredhold classifier.

## Steps with code example

### Step 1: Data Preprocessing

#### Importing the libraries
```python
import pandas as pd
import numpy as np
```
#### Importing the dataset
```python
dataset = pd.read_csv('Social_Network_Ads.csv')
X = dataset.iloc[:, [2, 3]].values
y = dataset.iloc[:, 4].values
```

#### Splitting the dataset into the Training set and Test set
```python
from sklearn.cross_validation import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(sel_X, Y, test_size = 0.2, random_state = 0)
```

#### Do features scaling
```python
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)
```

### Step 2: Fitting Multiple Linear Regression to the Training set
```python
from sklearn.linear_model import LogisticRegression
classifier = LogisticRegression()
classifier.fit(X_train, y_train)
```

### Step 3: Predicting the Test set results
```python
y_pred = regressor.predict(X_test)
```

### Step 4: Evaluate the prediction
```python
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)
```