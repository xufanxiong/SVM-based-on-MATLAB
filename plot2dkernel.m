function plot2dkernel(X, y, alpha, bias, type, powern)
    %X - (m, n) Data with features, m: number of examples, n: number of
    %features
    %y - (m, 1) labels (1 or 0)
    %alpha - (m, 1) parameter vector
    %bias - (double) parameter vector
    %type - liner kernel is 1, poly kernel is 2, gauss kernel is 3
    %powern - number of power in poly kernel
    plotdata2d(X, y);
    
    x1plot = linspace(min(X(:,1)), max(X(:,1)), 100)';
    x2plot = linspace(min(X(:,2)), max(X(:,2)), 100)';
    
    [X1, X2] = meshgrid(x1plot, x2plot);
    tem = zeros(size(X1));
    for i = 1:size(X1, 2)
        Xnew = [X1(:, i), X2(:, i)];
        for j = 1:size(Xnew, 1)
            xnew = Xnew(j, :);
            tem(j, i) = predictkernel(X, y, xnew, alpha, bias, type, powern);
        end
    end
    tem(tem==-1) = 0;
    hold on;
    [~, h] = contour(X1, X2, tem, [1,1], 'k');
    h.LineWidth = 2;
    box on;
    hold off;
    
end
    
    