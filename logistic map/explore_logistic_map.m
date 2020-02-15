rr = 0:0.001:4;
PERIODS = 500;
MAX_POINTS = 200;
%MAX_POINTS = 499;
TITLE = 'LOGISTIC MAP NO MAX POINTS'
TITLE = 'LOGISTIC MAP (MAX POINTS == 200)'
%TITLE = 'LOGISTIC MAP (MAX POINTS == 200, no unique, no rounding)'
%TITLE = 'LOGISTIC MAP (MAX POINTS == 200, no unique but rounding)'
XX_START = 0.5;
SCALE = 10000;
data = [];
for i = 1:length(rr)
    r = rr(i);
    xx = zeros(1, PERIODS);
    xx(1) = XX_START;
    
    for j = 1:PERIODS - 1
        xx(j + 1) = r * xx(j) * (1 - xx(j));
    end
    xx_unique = unique(round(SCALE * xx(end-MAX_POINTS:end)));
    %xx_unique = round(SCALE * xx(end-MAX_POINTS:end));
    %xx_unique = xx(end-MAX_POINTS:end);
    %length(xx)
    %length(xx_unique)
    for k = 1:length(xx_unique)
        data = [data; [r xx_unique(k) / SCALE]];
        %data = [data; [r xx_unique(k)]];
    end
end
        
close all
figure
p = plot(data(:,1), data(:,2), 'bo', 'MarkerSize', 1, 'MarkerFaceColor', 'b');
xlabel('r');
ylabel('x_{n+1}');
grid on

currentFigure = gcf;
title(currentFigure.Children(end), [sprintf('%s\n', TITLE)]);