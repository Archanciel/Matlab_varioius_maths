% Logistics Map 
%       Classic chaos example. Plots semi-stable values of
%       x(n+1) = r*x(n)*(1-x(n)) as r increases to 4.
%
% Michael Hanchak, Dayton OH, USA, 2011

clear
scale = 10000; % determines the level of rounding
maxpoints = 200; % determines maximum values to plot
N = 3000; % number of "r" values to simulate
a = 0.0; % starting value of "r"
b = 4; % final value of "r"... anything higher diverges.
rs = linspace(a,b,N); % vector of "r" values
M = 500; % number of iterations of logistics equation

% Loop through the "r" values
for j = 1:length(rs)
    
    r=rs(j); % get current "r"
    x=zeros(M,1); % allocate memory
    x(1) = 0.5; % initial condition (can be anything from 0 to 1)
    
    for i = 1:M, % iterate
        x(i+1) = r*x(i)*(1-x(i));
    end
    % only save those unique, semi-stable values
    out{j} = unique(round(scale*x(end-maxpoints:end)));
end

% Rearrange cell array into a large n-by-2 vector for plotting
data = [];

for k = 1:length(rs)
    n = length(out{k});
    arrayOfNLinesForSpecific_r_Value = [rs(k) * ones(n,1)];
    unique_x_ValuesForEvery_r_Value = [arrayOfNLinesForSpecific_r_Value, out{k} / scale];
    data = [data;  unique_x_ValuesForEvery_r_Value];
end

start_d = 2390;
end_d = 2455;

find(data(start_d:end_d,1) >= 2.97)
find(data(start_d:end_d,1) <= 2.98)
data(start_d:end_d,:)
%size(data)
% Plot the data
close all
figure();clf
h=plot(data(start_d:end_d,1),data(start_d:end_d,2),'k.');
set(h,'markersize',10)
axis tight
%set(gca,'units','normalized','position',[0 0 1 1])
set(gcf,'color','white')
%axis off
grid on