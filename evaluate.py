from statsmodels.formula.api import ols
import seaborn as sns
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings('ignore')
from math import sqrt

# plot_residuals(y, yhat): creates a residual plot 
def plot_residuals(actual, prediction):

    residual = prediction - actual
    
    sns.scatterplot(x=actual,y=residual)
    plt.title("residuals")

# regression_errors(y, yhat): returns the following values: 
# sum of squared errors (SSE) 
# explained sum of squares (ESS) 
# total sum of squares (TSS) 
# mean squared error (MSE) 
# root mean squared error (RMSE) 

def regression_errors(prediction, actual):

    baseline = actual.mean()

    ESS = ((prediction-baseline)**2).sum()
    TSS = ((actual-baseline)**2).sum()

    residual = prediction - actual
    r_square = residual**2

    SSE = r_square.sum()
    MSE = r_square.sum()/len(r_square)
    RMSE = sqrt(r_square.sum()/len(r_square))

    return SSE,ESS,TSS,MSE,RMSE
# baseline_mean_errors(y): 
# computes the SSE, MSE, and RMSE for the baseline model 

def baseline_mean_errors(actual):

    baseline = actual.mean()

    residual_base = baseline - actual
    r_square_base = residual_base**2

    SSE_base = r_square_base.sum()
    MSE_base = r_square_base.sum()/len(r_square_base)
    RMSE_base = sqrt(r_square_base.sum()/len(r_square_base))

    return SSE_base,MSE_base,RMSE_base

# better_than_baseline(y, yhat): 
# returns true if your model performs better than the baseline, otherwise false 

def better_then_baseline(actual,prediction):

    # get RMSE for model
    residual = prediction - actual
    r_square = residual**2
    RMSE = sqrt(r_square.sum()/len(r_square))

    # get RMSE for baseline
    baseline = actual.mean()
    residual_base = baseline - actual
    r_square_base = residual_base**2
    RMSE_base = sqrt(r_square_base.sum()/len(r_square_base))

    # compare RMSE for model and baseline return true if model is better
    if RMSE < RMSE_base:
        return True
    else:
        return False

# model_significance(ols_model): 
# that takes the ols model as input and 
# returns the amount of variance explained in your model, and
# the value telling you whether your model is significantly better than the baseline model 
# (Hint: use the rsquared and 
# f_pvalue properties from the ols model) 

def model_significance(ols_model): 

    f_pval = ols_model.f_pvalue

    r2 = ols_model.rsquared

    return f_pval, r2