function plot2dbound(X, y, type, Z)
    %X - (m, n) Data with features, m: number of examples, n: number of
    %features
    %y - (m, 1) labels (1 or 0)
    %type - hard margin is 1, soft margin is 2, hard margin with dual is 3,
    %soft margin with dual is 4
    %Z - tunning parameter
    label_0 = find(y == 0);
    label_1 = find(y == 1);
    if type == 1
        w = hard_margin(X, y);
        x1 = linspace(min(X(:,1)), max(X(:,1)), 200)';
        x2 = -(w(2)*x1 + w(1))/w(3);
        plot(x1, x2, 'k','LineWidth',2);
        hold on;
    elseif type == 2
        w = soft_margin(X, y, Z);
        x1 = linspace(min(X(:,1)), max(X(:,1)), 200)';
        x2 = -(w(2)*x1 + w(1))/w(3);
        plot(x1, x2, 'k','LineWidth',2);
        hold on;
    elseif type == 3
        w = dualhard(X, y);
        x1 = linspace(min(X(:,1)), max(X(:,1)), 200)';
        x2 = -(w(2)*x1 + w(1))/w(3);
        plot(x1, x2, 'k','LineWidth',2);
        hold on;
    elseif type == 4
        w = dualsoft(X, y, Z);
        x1 = linspace(min(X(:,1)), max(X(:,1)), 200)';
        x2 = -(w(2)*x1 + w(1))/w(3);
        plot(x1, x2, 'k','LineWidth',2);
        hold on;
    end
    scatter(X(label_0, 1), X(label_0, 2), 80, 'r', 'filled')
    hold on;
    scatter(X(label_1, 1), X(label_1, 2), 80, 'b', 'x')
    box on;
    hold off;
end