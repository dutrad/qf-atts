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

for N=1:20
    A=zeros(length(ret),(2*N)+1);
    teta=zeros(1+2*N,1);
    psi=zeros(1,1+2*N);
    
    for k=(N+1):length(ret)
    
        for i=1:N
            psi(i)=ret(k-i);
        end    
        A(k,:)=psi';

     end
        teta=mldivide(A,ret);
        erro=ret-A*teta;
        aic(N)=length(ret)*log(var(erro))+2*length(psi);
end

figure
plot(aic)
title('AIC para modelos de ordem 1 até 50')

%%
phi = [ret(2:end-1) ret(1:end-2)];
sys_hat = phi\ret(3:end);

%Simulation
ret_hat = zeros(length(ret));
for k = 3:length(ret)
    ret_hat(k) = sys_hat'*[ret(k-1); ret(k-2)];
end

figure
plot(ret-ret_hat)