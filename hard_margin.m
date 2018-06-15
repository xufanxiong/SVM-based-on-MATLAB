function betaall = hard_margin(X, y)
    %X - (m, n) Data with features, m: number of examples, n: number of
    %features
    %y - (m, 1) labels (1 or 0)
    %betaall - the parameters of boundary
    [m, n] = size(X);
    y(y == 0) = -1;
    cvx_begin
        variables beta0(1) betab(n, 1);
        minimize(norm(betab));
        subject to
            y .* (betab' * X' + beta0)' >= 1;
    cvx_end
    betaall = [beta0; betab];    
end
    
    