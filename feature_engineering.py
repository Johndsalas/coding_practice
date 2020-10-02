
import sklearn.preprocessing
import pandas as pd
from sklearn.feature_selection import SelectKBest, f_regression
from sklearn.linear_model import LinearRegression
from sklearn.feature_selection import RFE

def select_k_best(X,y,k):
    
    # create select k best object and choose number of features
    f_selector = SelectKBest(f_regression, k=k)

    # fit object to data
    f_selector.fit(X, y)

    # transform data
    X_reduced = f_selector.transform(X)
    
    # get bool mask for each column where True = selected feature and False = non-selected feature 
    f_support = f_selector.get_support()
    
    # get list of selected columns
    f_feature = X.loc[:,f_support].columns.tolist()
    
    # return list of selected columns
    return f_feature

def rfe(X,y,k):
    
    # create regression and rfe objects
    lm = LinearRegression()
    rfe = RFE(lm, k)

    # fit data to those objects
    X_rfe = rfe.fit_transform(X,y)  
    lm.fit(X_rfe,y)

    # get bool mask for each column where True = selected feature and False = non-selected feature 
    mask = rfe.support_

    # get list of selected columns
    rfe_features = X.loc[:,mask].columns.tolist()
    
    # return list of selected columns
    return rfe_features