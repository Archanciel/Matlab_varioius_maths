N = 20;
r = 3.5;
x1 = 0.05;
;

X = zeros(1,N);
X(1) = x1;

for i = 1:N - 1
    X(i + 1) = r * X(i) * (1 - X(i));
end

close all
figure()

subplot(2,1,1)
plot([1:N], X);
set(gca,'ylim',[0 1],'xlim',[0 N],'xtick',0:N/10:N,'ytick',0:0.1:1)

xlabel('N');
ylabel('X_{n+1}');
hold on
subplot(2,1,2)
Xn_plus_one = X(2:end);
plot(X(1:N - 1), Xn_plus_one);
set(gca,'ylim',[0 1],'xlim',[0 1],'xtick',0:0.1:1,'ytick',0:0.1:1)

xlabel('X_{n}');
ylabel('X_{n+1}');
currentFigure = gcf;
title(currentFigure.Children(end),[sprintf('x_{n+1} = rx_n(1 - x_n)\n') sprintf('x = %.2f\n', x1) sprintf('r = %.1f', r)], 'FontSize', 14);

