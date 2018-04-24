clc;
clear all;
close all;

data = csvread("..\..\Data\SP500.csv", 2, 1);

adj = data(:,5);

figure
plot(adj)
grid on

ret = diff(log(adj));

figure
plot(ret)
grid on

e = diff(ret);

%Ident
phi = [e(2:end-1) e(1:end-2)];
sys_hat = phi\ret(3:end-1);

y_hat = zeros(length(ret), 1);
y_hat(1:2) = 1;
for k=3:length(ret)
    y_hat(k) = sys_hat'*[e(k-1); e(k-2)];
end

plot(y_hat)

figure
autocorr(ret-y_hat)
