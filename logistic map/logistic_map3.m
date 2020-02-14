R_STEPS = 10000;
N_PERIODS = 10000;
X_INIT = 0.5;
X(R_STEPS, N_PERIODS) = 0;
size(X)
r = 0:4/(R_STEPS - 1):4;
length(r)
for i = 1:R_STEPS
%for i = 1:length(r)
    x(i, 1) = X_INIT;
    
    for n = 1:N_PERIODS - 1
        X(i, n + 1) = r(i) * X(i, n) * (1 - X(i, n));
    end  
end
size(X)
close all
figure
plot(r, X(:,:), '.')
