X = load('../data/test.mat');
X = X.data;

sel = X(224, :);

displayData(sel);

fprintf('Program paused. Press enter to continue.\n');
pause;