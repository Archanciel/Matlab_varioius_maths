clearvars
p1 = [0 0]
p2 = [1 8.33]
p3 = [2 18.33]
p4 = [3 27.77]
Pn = [p1;p2;p3;p4]
C = [p1(1,1)^3 p1(1,1)^2 p1(1,1) 1;
     p2(1,1)^3 p2(1,1)^2 p2(1,1) 1;
     p3(1,1)^3 p3(1,1)^2 p3(1,1) 1;
     p4(1,1)^3 p4(1,1)^2 p4(1,1) 1]
Ci = inv(C)
Y = [p1(1,2);p2(1,2);p3(1,2);p4(1,2)]
A = Ci * Y
syms x
y = A(1,1) * x^3 + A(2,1) * x^2 + A(3,1) * x + A(4,1);
vpa(y)

%plotting
close all
figure
xx = linspace(0,4);
yy = subs(y, x, xx);
plot(xx, yy, 'b')
hold on
scatter(Pn(:,1),Pn(:,2),50,'filled')
text(p1(1,1)+0.1, p1(1,2)-0.1, 'P_0');
text(p2(1,1)+0.1, p2(1,2)-0.1, 'P_1');
text(p3(1,1)+0.1, p3(1,2)-0.1, 'P_2');
text(p4(1,1)+0.1, p4(1,2)-0.1, 'P_3');

ax = gca
ax.XAxis.FontSize = 15;
ax.YAxis.FontSize = 15;
xlabel('t')
ylabel('m / sec^{2}')
title("Acceleration 0 - 100 in 3 seconds")
grid
set(gca,'ylim',[0 30],'xlim',[0 4],'xtick',0:4,'ytick',0:30)

%centeraxes(gca,opt);