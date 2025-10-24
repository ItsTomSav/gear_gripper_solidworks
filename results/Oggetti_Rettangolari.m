clear all
close all
clc 

%{ 
Si valuta come un prisma rettangolare di egual massa ma di diverse dimensioni 
possa essere preso dal gripper. 

L'oggetto ha massa m=35 gr.

La coppia è fissata a 150 Nmm, la forza è valutata al variare dell'apertura
del gripper.
%}


angle = [77 64 44 20];     %Gradi
force = [2.2 2.4 3.1 6.2]; %N
distance = [10 25 45 60];  %mm


figure(1)
plot(angle,force,'b-o')
grid minor
title('Force wrt Angle')
xlabel("theta_1 [°]")
ylabel("Contact force [N]")
xlim([min(angle) - 5, max(angle) + 5]); 
ylim([min(force) - 0.5, max(force) + 0.5]); 


figure(2)
plot(distance,force,'b-o')
grid minor
title('Force wrt Distance')
xlabel("Distance [mm]")
ylabel("Contact force [N]")
xlim([min(distance) - 5, max(distance) + 5]); 
ylim([min(force) - 0.5, max(force) + 0.5]); 
 
%{
Al diminuire di theta_1 la forza esercitata dal gripper tende ad aumentare.

All'aumentare della distanza tra le falangi del gripper la forza esercitata
dal gripper tende ad aumentare
%}
