clear all
close all
clc 

% Calcolo della forza di presa del gripper in funzione della massa
% dell'oggetto.

mu = 0.25;           % refers to metal-metal contact 
S = 2;               % Safety factor, it is 2 in normal operational conditions;
g = 9.81;            % [m/s^2];
a = 0;               % [m/s^2], Acceleration of the end effector;
m = 0.01:0.01:0.1;   % [Kg], mass of the grasped object;
n = 2;               % Number of phalanges in contact with the object;


% The gripper force is:
    for i=1:length(m)
        Fg(i)= (m(i)*(g+a)/(mu*n))*S;
    end


%% Plotting

figure(1)
plot(m,Fg(1,:),'b-o')
grid minor
title('Behaviour of gripping force')
legend("\mu = 0.25")
xlabel("Mass [Kg]")
ylabel("Force Fg [N]")

% Required Torque for equilibrium from Solidworks simulations;
T=[28 56 83 110 138 165 192 220 247 274];  % [Nmm]


figure(2)
plot(m,T,'r-o')
grid minor
title("Required torque")
xlabel('Object mass [Kg]')
ylabel('Torque [Nmm]')


