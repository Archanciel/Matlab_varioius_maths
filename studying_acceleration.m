clearvars
%{
% meters per second
p1 = [0 0]
p2 = [1 8.33]
p3 = [2 18.33]
p4 = [3 25]
p5 = [4 27.77]
%}

% kilometers per second

p1 = [0 0]
p2 = [1 30]
p3 = [2 66]
p4 = [3 90]
p5 = [4 100]

Pn = [p1;p2;p3;p4;p5]
C = [p1(1,1)^4 p1(1,1)^3 p1(1,1)^2 p1(1,1) 1;
     p2(1,1)^4 p2(1,1)^3 p2(1,1)^2 p2(1,1) 1;
     p3(1,1)^4 p3(1,1)^3 p3(1,1)^2 p3(1,1) 1;
     p4(1,1)^4 p4(1,1)^3 p4(1,1)^2 p4(1,1) 1;
     p5(1,1)^4 p5(1,1)^3 p5(1,1)^2 p5(1,1) 1]
Ci = inv(C)
Y = [p1(1,2);p2(1,2);p3(1,2);p4(1,2);p5(1,2)]
A = Ci * Y
syms x
y = A(1,1) * x^4 + A(2,1) * x^3 + A(3,1) * x^2 + A(4,1) * x + + A(5,1);
vpa(y)

%plotting
close all
figure
xx = linspace(0,5);
yy = subs(y, x, xx);
plot(xx, yy, 'b')
hold on
scatter(Pn(:,1),Pn(:,2),50,'filled')
text(p1(1,1)+0.1, p1(1,2)-0.1, 'P_0');
text(p2(1,1)+0.1, p2(1,2)-0.1, 'P_1');
text(p3(1,1)+0.1, p3(1,2)-0.1, 'P_2');
text(p4(1,1)+0.1, p4(1,2)-0.1, 'P_3');
text(p5(1,1)+0.1, p5(1,2)-0.1, 'P_4');

ax = gca
ax.XAxis.FontSize = 15;
ax.YAxis.FontSize = 15;
xlabel('t')
ylabel('m / sec^{2}')

% formating the polynomial function as string
functionString = "F(x)=";
power = size(A, 1) - 1;

for i = 1:size(A)
    if power > 1
        valueStr = sprintf("%+0.3gx^{%d}", A(i), power)
    elseif power == 1
        valueStr = sprintf("%+0.3gx", A(i))
    else
        valueStr = sprintf("%+0.3g", A(i))
    end
    
    functionString = strcat(functionString, valueStr)
    power = power - 1;
end
    
title(["Acceleration 0 - 100 in 4 seconds", functionString])
grid
set(gca,'ylim',[0 108],'xlim',[0 5],'xtick',0:5,'ytick',0:10:110)

%centeraxes(gca,opt);