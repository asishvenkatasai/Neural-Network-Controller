s=tf('s');
plant=1 /(s^2 + 6*s +15);

kp=491.5658
ki=499.9623
kd=60.9015
N =375.1837
 
cont = kp+ ki/s + (kd*s)/(1+(s/N));

dt=0.01;
t=0:dt:1;
e=1-step(feedback(plant*cont,1),t);
J =sum(t'.*abs(e)*dt);
