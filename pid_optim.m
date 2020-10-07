function [J] =pid_optim(x)

s=tf('s');

plant=1 /(s^2 + 10*s +20);

kp=x(1)
ki=x(2)
kd=x(3)
 
cont = kp+ ki/s + kd*s;

step(feedback(plant*cont,1))

dt=0.01;
t=0:dt:1;

e=1-step(feedback(plant*cont,1),t);

J =sum(t'.*abs(e)*dt);