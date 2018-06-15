function betaall = soft_margin(X, y, Z)
    %X - (m, n) Data with features, m: number of examples, n: number of
    %features
    %y - (m, 1) labels (1 or 0)
    %Z - tunning parameter
    %betaall - the parameters of boundary
    [m, n] = size(X);
    y(y == 0) = -1;
    cvx_begin
        variables beta0(1) betab(n, 1) cosin(m, 1);
        %minimize(0.5*sum(betab.^2) + Z*sum(cosin)/m);
        minimize(norm(betab))
        subject to
            y .* (betab' * X' + beta0)' >= 1 - cosin;
            cosin >= 0;
            sum(cosin) <= Z;
    cvx_end
    betaall = [beta0; betab];
end