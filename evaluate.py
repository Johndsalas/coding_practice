# plot_residuals(y, yhat): creates a residual plot 


# regression_errors(y, yhat): returns the following values: 
# sum of squared errors (SSE) 
# explained sum of squares (ESS) 
# total sum of squares (TSS) 
# mean squared error (MSE) 
# root mean squared error (RMSE) 

# baseline_mean_errors(y): 
# computes the SSE, MSE, and RMSE for the baseline model 


# better_than_baseline(y, yhat): 
# returns true if your model performs better than the baseline, otherwise false 

# model_significance(ols_model): 
# that takes the ols model as input and 
# returns the amount of variance explained in your model, and
# the value telling you whether your model is significantly better than the baseline model (Hint: use the rsquared and 
# f_pvalue properties from the ols model) Load the mpg dataset and 
# fit a model that predicts highway mileage based on engine displacement. 
# Take a look at all the regression evaluation metrics,
#  and determine whether this model is better than the baseline model. 
#  Use the functions from your evaluate.py to help accomplish this.