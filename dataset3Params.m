function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;
values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
solutions = [];
for i=1:size(values, 2),
  for j=1:size(values, 2),
    C = values(i);
    sigma = values(j);
    model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~=yval));
    solutions = [solutions; C sigma error];
  endfor
  [m, index] = min(solutions);
  C = solutions(index(3), 1);
  sigma = solutions(index(3), 2);
endfor

end
