%% GradientChecking

%% Initialization
clear ; close all; clc

%% =========== Part 1: Loading and Visualizing Data =============

fprintf('Loading and Visualizing Data\n')

X = load('../data/x.mat');
X = double(X.data);

y = load('../data/y.mat');
y = double(y.data);

all_theta = load('../data/all_theta.mat');
all_theta = double(all_theta.all_theta);

%disp(size(X));    % 1000 * 784
%disp(size(y));    % 1000 * 1
%disp(size(all_theta));    % 10 * 785

m = size(X, 1);
n = size(X, 2);
num_labels = 10;

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 2: 导数  ================
X = [ones(m, 1) X];    % 785 * 1000

for k = 1:num_labels
	v = sigmoid(X * all_theta(k, :)');    % 1000 * 1

	J = -1 * sum(y .* log(v) + (1.0 - y) .* log(1.0 - v)) / m;
	grad = X' * (log(v) - y);


end	

%% ================ Part 2: Numeric Gradient  ================


