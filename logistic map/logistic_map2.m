MAX_R = 4;
R_STEP = 0.01;
N_PERIODS = 300;
x_1 = 0.5;
XX = zeros(2, MAX_R / R_STEP * N_PERIODS);
xx_index = 1;

for r = 0:R_STEP:MAX_R
    x_n = x_1;
    x_prev = x_n;
    for n = 1:N_PERIODS
        x_n = r * x_n * (1 - x_n);
        %x_n = r * (x_n - x_n^2);
        XX(1, xx_index) = r;
        XX(2, xx_index) = x_n;
        if abs(x_n - x_prev) < 0.001
            break;
        else
            x_prev = x_n;
            xx_index = xx_index + 1;
        end
    end
end

close all
figure
plot(XX(1,:), XX(2,:), 'b.', 'markersize',1)
xlabel = 'r';
ylabel = x_n;