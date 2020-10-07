
function [J]= p(x)

s=tf('s');
plant=1 /(s^2 + 6*s +15);

kp=x(1)
ki=x(2)
kd=x(3)
N =x(4)
 
cont = kp+ ki/s + (kd*s)/(1+(s/N));

dt=0.01;
t=0:dt:1;
e=1-step(feedback(plant*cont,1),t);
J =sum(t'.*abs(e)*dt);