set
         t /M1, M2, M3, M4/;

alias(t,j);
parameter
         request(t)/M1 100, M2 200, M3 50, M4 150/;
variable
         x(t)
         xprime(t)
         y(t)
         w(t)
         q(t,j)
         z;

integer variable
         x(t), xprime(t), y(t), w(t), q(t,j);

equation objectiveFunction,supply(t), employee1, employee(t), hiring(t), const1(t), const2(t);

objectiveFunction..
         z=e=sum(t,5000*y(t))+sum(t,2000*x(t))+sum(t,1000*xprime(t))+sum(t,100*w(t))+70*sum(t,q(t,t+1))+140*sum(t,q(t,t+2))+210*sum(t,q(t,t+3));
supply(t)..
         15*y(t)+w(t-1)=e=request(t)+w(t)+sum(j$(ord(j)<ord(t)),q(j,t))-sum(j$(ord(j)>ord(t)),q(t,j));
employee1..
         y('M1')=e=7+x('M1')-xprime('M1');
employee(t)$(ord(t)<>1)..
         y(t)=e=y(t-1)+x(t)-xprime(t);
hiring(t)..
         x(t)=l=2;
const1(t)..
         sum(j$(ord(j)>ord(t)),q(t,j))=l=request(t);
const2(t)..
         15*y(t)+w(t-1)=g=sum(j$(ord(j)<ord(t)),q(j,t));
model question1 /All/;
solve question1 minimizing z using MIP;
display x.l, xprime.l, y.l, w.l, q.l, z.l;
