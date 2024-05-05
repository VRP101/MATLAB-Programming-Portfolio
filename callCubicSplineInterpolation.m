% Example data for cubic spline interpolation
breaks = [0, 1, 2, 3];
coefs = [1, 2, 3, 4; 5, 6, 7, 8; 9, 10, 11, 12];

% Create the structure with breaks and coefs
p.breaks = breaks;
p.coefs = coefs;

% Input vector for evaluation
x = linspace(0, 3, 100); % Evaluate the interpolation between 0 and 3

% Call the cubicSplineInterpolation function to compute the y-values
y = cubicSplineInterpolation(p, x);

% Now, y contains the interpolated values corresponding to the x-values in x.
