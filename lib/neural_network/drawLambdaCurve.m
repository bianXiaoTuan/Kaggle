%% Draw Lambda Curve of Logistic Regression

%% ============ Load Data ============
clear ; close all; clc

load('./data/splitData.mat');

%% ============ Computer Error ============
iter_num = 1;
num_labels = 10;
lambda_vec = [0 1 10]';
hidden_layer_size = 24;

nnLambdaCurve(x_train, y_train, x_cv, y_cv, num_labels, lambda_vec, iter_num, hidden_layer_size)
