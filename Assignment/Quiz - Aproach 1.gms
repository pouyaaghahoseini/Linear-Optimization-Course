set
         t /M1, M2, M3, M4/;
parameter
         request(t)/M1 100, M2 200, M3 50, M4 150/;
variable
         x(t)
         xprime(t)
         y(t)
         w(t)
         u(t)
         z;

integer variable
         x(t), xprime(t), y(t), w(t), u(t);

equation objectiveFunction, supply(t), employee1, employee(t), hiring(t), fulfil;

objectiveFunction..
         z=e=sum(t,5000*y(t))+sum(t,2000*x(t))+sum(t,1000*xprime(t))+sum(t,100*w(t))+sum(t,70*u(t));
supply(t)..
         15*y(t)+w(t-1)=e=request(t)+u(t-1)+w(t)-u(t);
employee1..
         y('M1')=e=7+x('M1')-xprime('M1');
employee(t)$(ord(t)<>1)..
         y(t)=e=y(t-1)+x(t)-xprime(t);
hiring(t)..
         x(t)=l=2;
fulfil..
         u('M4')=e=0;
model question1 /All/;
solve question1 minimizing z using MIP;
display x.l, xprime.l, y.l, w.l, u.l, z.l;
