%% Draw Learning Curve of Logistic Regression

%% ============ Load Data ============
clear ; close all; clc

load('./data/splitData.mat');

%% ============ Learning Curve ============
num = 10;
lambda = 0.1;
iter_num = 50;
num_labels = 10;
hidden_layer_size = 24;

nnLearningCurve(x_train, y_train, x_cv, y_cv, num_labels, num, lambda, iter_num, hidden_layer_size)
