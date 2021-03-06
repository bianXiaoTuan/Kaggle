%% Kaggle | Digit Recognizer

%% Initialization
clear ; close all; clc
addpath(genpath('../../lib'));

%% =============== Part 1: Loading Data ================

fprintf('Loading Data ...\n')

X = load('../data/x.mat');
X = double(X.data);

y = load('../data/y.mat');
y = double(y.data);

%% ================ Part 2: Initializing Pameters ================

fprintf('Test Neural Network\n')

lambda = 0.1;
iter_num = 100;
num_labels = 10;
hidden_layer_size = 784;

[Theta1 Theta2] = neuralNetwork(X, y, lambda, iter_num, hidden_layer_size, num_labels);

save('../data/theta1', 'Theta1');
save('../data/theta2', 'Theta2');

%% ================= Part 10: Implement Predict =================

pred = predictBynn(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);