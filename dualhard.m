function betaall = dualhard(X, y)
    %X - (m, n) Data with features, m: number of examples, n: number of
    %features
    %y - (m, 1) labels (1 or 0)
    [m, n] = size(X);
    y(y == 0) = -1;
    Q = zeros(m, m);
    for i = 1:m 
        for j = 1:m
            Q(i, j) = y(i)*y(j)*(X(i,:)*X(j,:)');
        end
    end
    cvx_begin
        variable a(m,1)
        minimize(0.5*a'*Q*a - ones(m,1)'*a)
        subject to
            y'*a == 0
            a >= 0
    cvx_end
    betab = sum(a.*y.*ones(size(X)).*X)';
    beta0 = -(max(betab'*X(y==-1, :)') + min(betab'*X(y==1, :)'))/2;
    betaall = [beta0; betab];
end