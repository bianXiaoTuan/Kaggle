%% Kaggle | Digit Recognizer Predict

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use
input_layer_size  = 784;  % 20x20 Input Images of Digits
num_labels = 10;          % 10 labels, from 0 to 9

%% =========== Part 1: Loading and Visualizing Data =============

fprintf('Loading Data\n')

X = load('../data/test.mat');
X = double(X.data);

all_theta = load('../data/all_theta.mat');
all_theta = double(all_theta.all_theta);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 2: Predict for One-Vs-All ================

m = size(X, 1);
X = [ones(m, 1) X];

h = sigmoid(X * all_theta');

[v, index] = max(h');
index = int32(index');

% Save predict data to predict.mat
save('../data/predict.mat', 'index', '-ascii');
