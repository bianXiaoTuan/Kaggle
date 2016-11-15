function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
m = length(y); 

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

addpath(genpath('../../lib'));

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