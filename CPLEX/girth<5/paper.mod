/*********************************************
 * OPL 20.1.0.0 Model
 * Author: ozan
 * Creation Date: 02.10.2021 at 14:33:59
 *********************************************/

//girth5

 int lowerI = 1;
 int higherI = 3;
 
 //the ranges i can have
 range I = lowerI..higherI;
 range I2 = lowerI..higherI-1;
 range I3 = 4..higherI;
 
 //decision variables as arrays
 dvar float+ d[I];
 dvar float+ r[I];
 
 //maximize the sum of A_i
 maximize sum(i in I) (d[i]);
 
 // our equations
 subject to
 {
   forall(i in I) r[i] <= i+1;
   
   forall(i in I2) r[i] <=  r[i+1]  -  ((( 3*i-7 ) /5 )* d[i+1]);
   
   forall(i in I3) d[i] <= ((5 * r[i])  /  ( 3 * i -10 ));
   
   forall(i in I) r[i] >= sum(x in 1..i)d[x];
 }
  execute
 {
   var f=new IloOplOutputFile("results_girth.txt");
   f.writeln("i d[i]");
   for(i in thisOplModel.I) {
     f.writeln(i + " " + d[i]);
   }
   f.close();
 }