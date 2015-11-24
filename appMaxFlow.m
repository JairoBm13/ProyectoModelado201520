clc, clear all, close all

   %   1  2  3 4 5 6 
graph=[0 15 18 0 0 0;   % 1
       0 0 10 0 12 0;   % 2
       0 0 0 11 6 15;   % 3
       0 0 0 0 14 12;   % 4
       0 7 0 26 0  9;   % 5
       0 0 0  0 0  0];  % 6
source=1;
sink=6;
num_nodes=6;
g_size=[num_nodes num_nodes];
          
[max_flow] = ford_fulk(source,sink,graph,g_size);

[m,n,vec_maxFlow] = find(max_flow); %pasamos de una sparse matrix a vectores.

%organizamos los vectores en una celda.
cellMaxFlow{1,1}=m;
cellMaxFlow{1,2}=n;
cellMaxFlow{1,3}=vec_maxFlow;

%extraemos los flujos de cada enlace.
fprintf('Los flujos de cada enlace son: \n ');
for i=1:length(cellMaxFlow{1,3})
    if cellMaxFlow{1,3}(i,1)>0
        fprintf('Enlace %d - %d = %d \n ',cellMaxFlow{1,1}(i,1),cellMaxFlow{1,2}(i,1),cellMaxFlow{1,3}(i,1));
    end            
end

%extraemos el flujo máximo del destino
sumFlows=0;
for i=1:length(cellMaxFlow{1,3})
     if cellMaxFlow{1,3}(i,1)>0 && cellMaxFlow{1,2}(i,1)==sink
         sumFlows=sumFlows + cellMaxFlow{1,3}(i,1);
     end
end
fprintf('\n');
fprintf('El flujo máximo al nodo destino %d es %d \n \n', sink, sumFlows);

