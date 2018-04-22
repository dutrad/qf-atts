clc;
clear all;
close all;

data = csvread("..\..\Data\PETR4.SA.csv", 2, 1);

adj = data(:,5);

figure
plot(adj)
grid on

mean(adj)
var(adj)
std(adj)

figure
autocorr(diff(adj))