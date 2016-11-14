function [all_theta] = multiLogisticRegression(X, y, num_labels, lambda)
%MULTILOGISTICREGRESSION trains multiple logistic regression classifiers 
%and returns all the classifiers in a matrix all_theta, where the i-th row of 
%all_theta corresponds to the classifier for label i
%   [all_theta] = multiLogisticRegression(X, y, num_labels, lambda) trains num_labels
%   logisitc regression classifiers and returns each of these classifiers
%   in a matrix all_theta, where the i-th row of all_theta corresponds
%   to the classifier for label i

% disp(size(X));    % 1000 * 784
% disp(size(y));    % 1000 * 1

% Some useful variables
m = size(X, 1);    % 1000
n = size(X, 2);    % 784

% 返回参数
all_theta = zeros(num_labels, n + 1);    % 10 * 785

% Add ones to the X data matrix
X = [ones(m, 1) X];

initial_theta = zeros(n + 1, 1);

options = optimset('GradObj', 'on', 'MaxIter', 100);

for k = 1:num_labels
    [theta] = fmincg(@(t)lrCostFunction(t, X, (y == k), lambda), initial_theta, options);
    all_theta(k, : ) = theta';
end

% =========================================================================

end