%% Draw Lambda Curve of Logistic Regression

%% ============ Load Data ============
clear ; close all; clc

load('./data/splitData.mat');

%% ============ Computer Error ============
iter_num = 5;
num_labels = 10;
% lambda_vec = [0 0.01 0.02 0.1 0.2 1 2 3 4 5 6 7]';
lambda_vec = [0 0.01 0.02 0.1 0.2 1]';

 lrLambdaCurve(x_train, y_train, ...
  x_cv, y_cv, ... 
  num_labels, ... 
  iter_num, ... 
  lambda_vec);
