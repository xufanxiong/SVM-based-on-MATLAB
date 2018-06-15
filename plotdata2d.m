function plotdata2d(X, y)
    %X - (m, n) Data with features, m: number of examples, n: number of
    %features
    %y - (m, 1) labels (1 or 0)
    label_0 = find(y == 0);
    label_1 = find(y == 1);
    scatter(X(label_0, 1), X(label_0, 2), 80, 'r', 'filled')
    hold on;
    scatter(X(label_1, 1), X(label_1, 2), 80, 'b', 'x')
    box on;
    hold off;
end