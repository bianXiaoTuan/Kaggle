%% Draw Lambda Curve of Logistic Regression

%% ============ Load Data ============
clear ; close all; clc
addpath(genpath('../../lib'));

x_train = load('../data/x_train.mat');
x_train = double(x_train.data);

y_train = load('../data/y_train.mat');
y_train = double(y_train.data);

x_cv = load('../data/x_cv.mat');
x_cv = double(x_cv.data);

y_cv = load('../data/y_cv.mat');
y_cv = double(y_cv.data);

%% ============ Computer Error ============
iter_num = 50;
num_labels = 10;
lambda_vec = [0 0.01 0.02 0.04 0.08 0.1 0.2 0.4 0.8 1 2 4 8 10]';

lrLambdaCurve(x_train, y_train, ...
  x_cv, y_cv, ... 
  num_labels, ... 
  iter_num, ... 
  lambda_vec);
