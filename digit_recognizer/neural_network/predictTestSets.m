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

theta1 = load('../data/theta1.mat');
theta1 = double(theta1.Theta1);

theta2 = load('../data/theta2.mat');
theta2 = double(theta2.Theta2);

% disp(size(X));    % 28000 * 784
% disp(size(theta1));    % 784 * 785
% disp(size(theta2));    % 10 * 785

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 2: Predict for One-Vs-All ================

% Useful values
m = size(X, 1);
num_labels = size(theta2, 1);

% You need to return the following variables correctly
p = zeros(size(X, 1), 1);

h1 = sigmoid([ones(m, 1) X] * theta1');
h2 = sigmoid([ones(m, 1) h1] * theta2');
[dummy, p] = max(h2, [], 2);

disp(size(p));
disp(size(dummy));

% Save predict data to predict.mat
save('../data/predict.mat', 'p', '-ascii');