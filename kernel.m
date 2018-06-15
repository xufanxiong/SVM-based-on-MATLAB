function output = kernel(x1, x2, type, powern)
    %x1, x2 - (1, n) Data with features, n: number of features
    %type - liner kernel is 1, poly kernel is 2, gauss kernel is 3
    %powern - number of power in poly kernel
    %sigma - the parameter in gauss kernel
    n = size(x1, 2);
    if type == 1
        output = x1*x2;
    elseif type == 2
        output = (1 + x1*x2).^powern;
    elseif type == 3
        output = exp(-norm(x1-x2)^2/(2*0.5^2));
    end
end