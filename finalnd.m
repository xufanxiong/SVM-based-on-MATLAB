function  finalnd(X, y, Xnew, ynew, type, type_k, Z, powern)
    %X - (m, n) Data with features, m: number of examples, n: number of
    %features
    %y - (m, 1) labels (1 or 0)
    %Xnew - (mnew, n) new data that need to predict
    %ynew - (mnew, 1) labels (1 or 0)
    %type - hard margin with dual is 1, soft margin with dual is 2
    %type_k - liner kernel is 1, poly kernel is 2, gauss kernel is 3
    %Z - tunning parameter
    %powern - number of power in poly kernel
    
    [alpha, bias] = svmkernel(X, y, type, type_k, Z, powern);
    accuracy = acc(X, y, Xnew, ynew, alpha, bias, type_k, powern);
    fprintf('The accuracy is: %4.2f %%.\n', accuracy*100);
    
end