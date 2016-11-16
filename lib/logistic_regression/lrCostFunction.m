function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Binary Logisitc Regression

addpath(genpath('../../lib'));

% Initialize some useful values
m = length(y); 

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% disp(size(X));    % 100 * 401
% disp(size(theta));   % 401 * 100

% ====================== YOUR CODE HERE ======================

% Cost Function
v = sigmoid(X * theta);
J = -1 * sum(y .* log(v) + (1.0 - y) .* log(1.0 - v)) / m + sum(theta(2:end, 1) .^ 2) * lambda / (2 * m);

% Gradient
theta(1) = 0;
grad = X' * (v - y) / m + theta * lambda / m;

% =============================================================

grad = grad(:);

end