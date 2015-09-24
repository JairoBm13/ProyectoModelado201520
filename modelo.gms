Sets
 i nodos ingreso enlace /n1*n10/
 j nodos egreso enlace  /n1*n10/

Table tiempo(i,j) tiempo maximo para estar en cada enlace
                 n1      n2      n3      n4      n5      n6      n7      n8      n9      n10
n1               999     999     999     0       0       0       0       0       0       0
n2               0       0       0       0       10      5       0       0       0       0
n3               0       0       0       0       7       0       6       0       0       0
n4               0       0       4       0       0       8       11      0       0       0
n5               0       0       0       0       0       3       0       11      0       0
n6               0       0       0       0       0       0       0       8       6       0
n7               0       0       0       0       0       0       0       0       12      0
n8               0       0       0       0       0       0       0       0       0       999
n9               0       0       0       0       0       0       0       0       0       999
n10              0       0       0       0       0       0       0       0       0       0

Table costoT(i,j) costo por unidad de tiempo en cada enlace
                 n1      n2      n3      n4      n5      n6      n7      n8      n9      n10
n1               0       0       0       999     999     999     999     999     999     999
n2               999     999     999     999     4       5       999     999     999     999
n3               999     999     999     999     5       999     3       999     999     999
n4               999     999     1       999     999     5       2       999     999     999
n5               999     999     999     999     999     1       999     5       999     999
n6               999     999     999     999     999     999     999     3       4       999
n7               999     999     999     999     999     999     999     999     2       999
n8               999     999     999     999     999     999     999     999     999     0
n9               999     999     999     999     999     999     999     999     999     0
n10              999     999     999     999     999     999     999     999     999     999     ;

Parameters
 t(i,j) tiempo maximo en el enlace
 c(i,j) costo por unidad de tiempo en el enlace
 i(i) informacion ganada por segundo por acceso al nodo i /n1 0, n2 0, n3 0, n4 0, n5 0, n6 0, n7 0, n8 21, n9 25, n10 0/;
t(i,j)=tiempo(i,j);
c(i,j)=costoT(i,j);

Scalars
 PMAX presupuesto maximo en dolares para incursion /120/
 TMAX tiempo maximo en segundos para realizar incursion /30/;

Variables
 x(i,j) tiempo gastado en cada enlace
 z maxim;
Positive variable x;









