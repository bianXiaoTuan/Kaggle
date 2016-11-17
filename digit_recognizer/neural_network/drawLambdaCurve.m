%% Draw Learning Curve of Logistic Regression

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
num = 10;
lambda = 0.1;
iter_num = 50;
num_labels = 10;
hidden_layer_size = 24;

nnLearningCurve(x_train, y_train, x_cv, y_cv, num_labels, num, lambda, iter_num, hidden_layer_size)

