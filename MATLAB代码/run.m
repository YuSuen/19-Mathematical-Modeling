
% # the number of years to consider 
years = 100;

% # population in the 1st year(2010)
p = csvread('2010age.csv');
p = p(1:end,:);
p = p';

% # death rate at the age of i (in all years)
death = csvread('death_rate.csv');

% # population proportion of women at the age of i (in all years)
women_p = csvread('women proportion.csv');
% # add to 100*1
women_p = [women_p;0;0];

% # beta change from 1 to 2 in 2016
% beta = ones(years,1);
% beta = beta + [zeros(6,1);ones(years-6,1)];
beta=zeros(years,1);
for i=1:years
    beta(i,1)=beta(i,1)+1.8-(0.25./(i))
end

X = compute_population(years, 1, p, death, women_p);
X1 = compute_population(years, beta, p, death, women_p);
years = size(X,1);
T = 2010:1:(years+2010-1);


%plot(T,X,'+',T,X1,'o');
plot(T,X1,'o');
legend('二胎政策')
set(gca,'fontsize',18);
xlabel('年份');
ylabel('人口数/人');
title('保持二胎政策下的人口预测');
