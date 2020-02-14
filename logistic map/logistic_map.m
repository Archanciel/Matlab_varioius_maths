N = 100;
r = 2.9;
x1 = 0.5;
;

X = zeros(1,N);
X(1) = x1;

for i = 1:N - 1
    X(i + 1) = r * X(i) * (1 - X(i));
end

close all
figure()

subplot(2,1,1)
p = plot([1:N], X, 'b.');
set(p, 'markersize', 4)
set(gca,'ylim',[0 1],'xlim',[0 N],'xtick',0:N/10:N,'ytick',0:0.1:1)
grid on

xlabel('N');
ylabel('X_{n+1}');
hold on
subplot(2,1,2)
Xn_plus_one = X(2:end);
p = plot(X(1:N - 1), Xn_plus_one, 'r.');
set(gca,'ylim',[0 1],'xlim',[0 1],'xtick',0:0.05:1,'ytick',0:0.05:1)
set(p, 'markersize', 10)
grid on

xlabel('X_{n}');
ylabel('X_{n+1}');
currentFigure = gcf;
title(currentFigure.Children(end),[sprintf('x_{n+1} = rx_n(1 - x_n)\n') sprintf('x = %.2f\n', x1) sprintf('r = %.1f', r)], 'FontSize', 14);

