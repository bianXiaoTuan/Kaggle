addpath(genpath('../lib'));

X = load('./data/test.mat');
X = X.data;

displayData(X([3, 4, 5, 16, 17, 23, 29, 48], :));