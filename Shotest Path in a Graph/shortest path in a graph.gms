set
         i /1, 2, 3, 4, 5, 6, 7, 8, 9/;
alias (i,j);
parameter
         a(i,j) /1 .1 0, 1 .2 1, 1 .3 1, 1 .4 1, 1 .5 0, 1 .6 0, 1 .7 0, 1 .8 0, 1 .9 0,
                 2 .1 0, 2 .2 0, 2 .3 1, 2 .4 0, 2 .5 0, 2 .6 1, 2 .7 0, 2 .8 0, 2 .9 0,
                 3 .1 0, 3 .2 0, 3 .3 0, 3 .4 0, 3 .5 1, 3 .6 0, 3 .7 0, 3 .8 0, 3 .9 0,
                 4 .1 0, 4 .2 0, 4 .3 1, 4 .4 0, 4 .5 0, 4 .6 0, 4 .7 0, 4 .8 0, 4 .9 0,
                 5 .1 0, 5 .2 0, 5 .3 0, 5 .4 0, 5 .5 0, 5 .6 0, 5 .7 0, 5 .8 1, 5 .9 0,
                 6 .1 0, 6 .2 0, 6 .3 1, 6 .4 1, 6 .5 0, 6 .6 0, 6 .7 0, 6 .8 0, 6 .9 0,
                 7 .1 0, 7 .2 0, 7 .3 0, 7 .4 0, 7 .5 0, 7 .6 0, 7 .7 0, 7 .8 0, 7 .9 1,
                 8 .1 0, 8 .2 0, 8 .3 0, 8 .4 0, 8 .5 0, 8 .6 0, 8 .7 1, 8 .8 0, 8 .9 0,
                 9 .1 0, 9 .2 0, 9 .3 0, 9 .4 0, 9 .5 0, 9 .6 0, 9 .7 0, 9 .8 0, 9 .9 0/

         c(i,j) /1 .1 0, 1 .2 30, 1 .3 90, 1 .4 30, 1 .5 0, 1 .6 0, 1 .7 0, 1 .8 0, 1 .9 0,
                 2 .1 0, 2 .2 0, 2 .3 40, 2 .4 0, 2 .5 0, 2 .6 50, 2 .7 0, 2 .8 0, 2 .9 0,
                 3 .1 0, 3 .2 0, 3 .3 0, 3 .4 0, 3 .5 20, 3 .6 0, 3 .7 0, 3 .8 0, 3 .9 0,
                 4 .1 0, 4 .2 0, 4 .3 40, 4 .4 0, 4 .5 0, 4 .6 0, 4 .7 0, 4 .8 0, 4 .9 0,
                 5 .1 0, 5 .2 0, 5 .3 0, 5 .4 0, 5 .5 0, 5 .6 0, 5 .7 0, 5 .8 20, 5 .9 0,
                 6 .1 0, 6 .2 0, 6 .3 40, 6 .4 50, 6 .5 0, 6 .6 0, 6 .7 0, 6 .8 0, 6 .9 0,
                 7 .1 0, 7 .2 0, 7 .3 0, 7 .4 0, 7 .5 0, 7 .6 0, 7 .7 0, 7 .8 0, 7 .9 20,
                 8 .1 0, 8 .2 0, 8 .3 0, 8 .4 0, 8 .5 0, 8 .6 0, 8 .7 20, 8 .8 0, 8 .9 0,
                 9 .1 0, 9 .2 0, 9 .3 0, 9 .4 0, 9 .5 0, 9 .6 0, 9 .7 0, 9 .8 0, 9 .9 0/;
variable
         x(i,j)
         z;
nonnegative variable x(i,j);

equation objectiveFunction, start , end , definex(i,j) , const1, const2, const3, const4, const5, const6, const7;

objectiveFunction..
         z=e=sum((i,j),c(i,j)*x(i,j));
start..
         sum(j,x('1',j))=e=1;
end..
         sum(i,x(i,'9'))=e=1;
definex(i,j)..
         x(i,j)=l=a(i,j);
*didn't know how to except 1 and 9 so i had to write constraints for 2-8 :
const1..
         sum(i,x(i,'2'))=e=sum(i,x('2',i));
const2..
         sum(i,x(i,'3'))=e=sum(i,x('3',i));
const3..
         sum(i,x(i,'4'))=e=sum(i,x('4',i));
const4..
         sum(i,x(i,'5'))=e=sum(i,x('5',i));
const5..
         sum(i,x(i,'6'))=e=sum(i,x('6',i));
const6..
         sum(i,x(i,'7'))=e=sum(i,x('7',i));
const7..
         sum(i,x(i,'8'))=e=sum(i,x('8',i));

model graph /objectiveFunction, start , end , definex, const1, const2, const3, const4, const5, const6, const7/;
solve graph minimizing z using LP;
display x.l , z.l;