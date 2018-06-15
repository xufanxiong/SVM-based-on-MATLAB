function output = predictkernel(X, y, xnew, alpha, bias, type, powern)
    %X - (m, n) Data with features, m: number of examples, n: number of
    %features
    %xnew - (m, 1) new data that need to predict
    %y - (m, 1) labels (1 or 0)
    %alpha, bias - the result of svmkernel
    %type - liner kernel is 1, poly kernel is 2, gauss kernel is 3
    %powern - number of power in poly kernel
    [m, n] = size(X);
    y(y==0) = -1;
    K = zeros(m, 1);
    for i = 1:m
        K(i) = kernel(X(i, :), xnew', type, powern);
    end
    output = sign((alpha.*y)'*K - bias);
end