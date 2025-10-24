clear all
close all
clc 

%{ 
Si valuta come un cilindro di egual massa ma di diverso raggio possa essere 
preso dal gripper. 

L'oggetto ha massa m=35 gr.

La coppia è fissata a 150 Nmm, la forza è valutata al variare dell'apertura
del gripper.
%}


angle = [83 75 66 58];          %Gradi
force = [2.17 2.23 2.34 2.54];  %N
distance = [3 13 22 32];        %mm


figure(1)
plot(angle,force,'b-o')
grid minor
title('Force wrt Angle')
xlabel("Theta_1 [°]")
ylabel("Contact force [N]")
xlim([min(angle) - 3, max(angle) + 2]); 
ylim([min(force) - 0.05, max(force) + 0.05]); 


figure(2)
plot(distance,force,'b-o')
grid minor
title('Force wrt Distance')
xlabel("Distance [mm]")
ylabel("Contact force [N]")
xlim([min(distance) - 3, max(distance) + 3]); 
ylim([min(force) - 0.05, max(force) + 0.05]); 


%{
Al diminuire di theta_1 la forza esercitata dal gripper tende ad aumentare.

All'aumentare della distanza tra le falangi del gripper la forza esercitata
dal gripper tende ad aumentare
%}
