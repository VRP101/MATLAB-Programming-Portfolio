function y = cubicSplineInterpolation(p,x)

    breaks = p.breaks;

    coefs = p.coefs;

    y = zeros(size(x));

    for i = 1:length(x)

        j = find(x(i) >= breaks, 1, 'last');

        y(i) = coefs(j,:) * [1 x(i) x(i)^2 x(i)^3]';

    end

end