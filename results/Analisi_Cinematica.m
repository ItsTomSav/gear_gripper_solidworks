clc
clear all
close all

%Lunghezze link
l1 = 33;
l2 = 18.5;
l3 = 33;
l3_p = 18.5;

%Angoli iniziali
theta1 = deg2rad(20);
theta2 = deg2rad(90);
theta3 = deg2rad(90);
beta = deg2rad(110);

%Variazione di theta_1
var_theta1 = [0:0.1:85];
N = length(var_theta1);

%Equazioni di vincolo ottenute da Matrici di Trasformazione
f = @(x,theta1v) [...
                l1*cos(theta1+theta1v) + l2*cos(theta1+theta1v+theta2+x(1)) + l3*cos(theta1+theta1v+theta2+x(1)+theta3+x(2)) - l3_p*cos(beta);
                l1*sin(theta1+theta1v) + l2*sin(theta1+theta1v+theta2+x(1)) + l3*sin(theta1+theta1v+theta2+x(1)+theta3+x(2)) - l3_p*sin(beta)];

theta2v = ones(N,1)*Inf;
theta3v= ones(N,1)*Inf;
thetaf=zeros(N,1);

options = optimoptions('fsolve','Display','off');
x0 = [0, 0];

for i=1:N
    theta1v = var_theta1(i) * pi / 180;
    [x fval] = fsolve(f, x0, options, theta1v);
    
        if sum(fval.^2) > 1e-5
           continue;
        end

    theta2v_g(i) = x(1)*180/pi; % è il valore della variazione di theta2 in gradi
    theta3v_g(i) = x(2)*180/pi;  % è il valore della variazione di theta3 in gradi

    theta2v(i) = x(1); % il valore della variazione di theta2 in radianti
    theta3v(i) = x(2); % il valore della variazione di theta3 in radianti

    thetaf(i) = (theta1 + theta1v)*180/pi;
    theta1v_g(i) = theta1v*180/pi;
    x0 = x;

end


%Plot degli angoli rispetto al loro sistema di riferimento
figure(2)
subplot(2,1,1);
plot((theta2)*180/pi +theta2v_g,thetaf)
title('Andamento \theta_2 in funzione di \theta_1 in X_1/Y_1');
xlabel('\theta_2 [deg]')
ylabel('\theta_1 [deg]')
grid on

subplot(2,1,2)
plot((theta3)*180/pi + theta3v_g,thetaf)
title('Andamento \theta_3 in funzione di \theta_1 in X_2/Y_2');
xlabel('\theta_3 [deg]')
ylabel('\theta_1 [deg]')
grid on


%Plot degli angoli rispetto al sistema di riferimento inerziale
% figure(3)
% subplot(2,1,1);
% plot(round((theta1)*180/pi + theta1v_g + 90 + theta2v_g),thetaf)
% title('Andamento \theta_2 in funzione di \theta_1 in X_0/Y_0');
% xlabel('\theta_2 [deg]')
% ylabel('\theta_1 [deg]')
% grid on
% 
% subplot(2,1,2)
% plot((theta1)*180/pi + theta1v_g + 90 + theta2v_g + 90 + theta3v_g,thetaf)
% title('Andamento \theta_3 in funzione di \theta_1 in X_0/Y_0');
% xlabel('\theta_3 [deg]')
% ylabel('\theta_1 [deg]')
% grid on