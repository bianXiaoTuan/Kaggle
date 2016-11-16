%% Draw Learning Curve of Logistic Regression

%% ============ Load Data ============
clear ; close all; clc
addpath(genpath('../../lib'));

x_train = load('../data/x.mat');
x_train = double(x_train.data);

y_train = load('../data/y.mat');
y_train = double(y_train.data);

x_cv = load('../data/x_cv.mat');
x_cv = double(x_cv.data);

y_cv = load('../data/y_cv.mat');
y_cv = double(y_cv.data);

disp(size(x_train));
disp(size(y_train));
disp(size(x_cv));
disp(size(y_cv));

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
