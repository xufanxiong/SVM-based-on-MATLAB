function output = acc(X, y, Xnew, ynew, alpha, bias, type, powern)
    %X - (m, n) Data with features, m: number of examples, n: number of
    %features
    %y - (m, 1) labels (1 or 0)
    %Xnew - (mnew, n) new data that need to predict
    %ynew - (mnew, 1) labels (1 or 0)
    %alpha, bias - the result of svmkernel
    %type - liner kernel is 1, poly kernel is 2, gauss kernel is 3
    %powern - number of power in poly kernel
    y(y==0) = -1;
    ynew(ynew==0) = -1;
    m = size(y, 1);
    mnew = size(ynew, 1);
    tem = zeros(mnew, 1);
    for i = 1:mnew
        tem(i) = predictkernel(X, y, Xnew(i, :), alpha, bias, type, powern);
    end
    output = sum(ynew == tem)/mnew;
end
        