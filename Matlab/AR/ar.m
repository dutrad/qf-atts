clc;
clear all;
close all;

len = 1000;
e = normrnd(0, .01, len, 1);
sys = [0.6 -0.4];

y = zeros(len, 1);
y(1:2) = 1;
for k = 3:len
    y(k) = sys*[y(k-1); y(k-2)] + e(k);
end

figure
autocorr(y)

figure
plot(y)
hold on
grid on

%Ident
phi = [y(2:end-1) y(1:end-2)];
sys_hat = phi\y(3:end);

y_hat = zeros(len, 1);
y_hat(1:2) = 1;
for k=3:len
    y_hat(k) = sys_hat'*[y(k-1); y(k-2)];
end

plot(y_hat)

figure
autocorr(y-y_hat)