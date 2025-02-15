function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

  y_interp = zeros(size(x_interp));

	% TODO: Calculate y_interp using the Spline coefficients
	for k = 1:length(x_interp)
        xi = x_interp(k);

        for i = 1:length(x) - 1
            if xi >= x(i) && xi <= x(i+1)
                y_interp(k) = coef((i-1)*4 + 1) + coef((i-1)*4 + 2)*(xi - x(i)) + coef((i-1)*4 + 3)*(xi - x(i))^2 + coef((i-1)*4 + 4)*(xi - x(i))^3;
                break;
            end
        end
    end
end
