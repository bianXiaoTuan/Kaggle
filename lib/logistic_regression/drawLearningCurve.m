%% Draw Learning Curve of Logistic Regression

%% ============ Load Data ============
clear ; close all; clc

load('./data/splitData.mat');

%% ============ Computer Error ============
num = 10;
lambda = 0;
iter_num = 5;
num_labels = 10;

lrLearningCurve(x_train, y_train, ... 
	x_cv, y_cv, ...
	num_labels, ...
	num, ...
	lambda, ...
	iter_num);
