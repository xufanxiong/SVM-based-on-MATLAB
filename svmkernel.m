function [alpha, bias] = svmkernel(X, y, type, type_k, Z, powern)
    %X - (m, n) Data with features, m: number of examples, n: number of
    %features
    %y - (m, 1) labels (1 or 0)
    %type - hard margin with dual is 1, soft margin with dual is 2
    %type_k - liner kernel is 1, poly kernel is 2, gauss kernel is 3
    %Z - tunning parameter
    %powern - number of power in poly kernel
    [m, n] = size(X);
    K = zeros(m, m);
    y(y==0) = -1;
    for i = 1:m
        for j = 1:m
            K(i, j) = y(i)*y(j)*(kernel(X(i,:), X(j,:)', type_k, powern));
        end
    end
    if type == 1
        cvx_begin
        variable a(m,1)
        minimize(0.5*a'*K*a - ones(m,1)'*a)
        subject to
            y'*a == 0
            a >= 0
        cvx_end
        alpha = a; 
        epsilon = 1e-4; 
        index = find(alpha > epsilon);
        k = length(index);
        K2 = zeros(k, k);
        for i = 1:k
            for j = 1:k
                K2(i, j) = kernel(X(index(i),:), X(index(j),:)', type_k, powern);
            end
        end
        bias = mean((alpha(index).*y(index))'*K2 - y(index)');
    elseif type == 2
        cvx_begin
        variable a(m,1)
        minimize(0.5*a'*K*a - ones(m,1)'*a)
        subject to
            y'*a == 0
            a >= 0 
            a <= Z
        cvx_end
        alpha = a;
        epsilon = 1e-4;
        index = find(alpha > epsilon & alpha < Z);
        k = length(index);
        K2 = zeros(k, k);
        for i = 1:k
            for j = 1:k
                K2(i, j) = kernel(X(index(i),:), X(index(j),:)', type_k, powern);
            end
        end
        bias = mean((alpha(index).*y(index))'*K2 - y(index)');
    end
end
                
    