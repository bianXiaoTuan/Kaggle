X = load('../data/test.mat');
X = X.data;

sel = X(1:4, :);

displayData(sel);

fprintf('Program paused. Press enter to continue.\n');
pause;