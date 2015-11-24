clc, clear all, close all

%Inicializacion de parámetros y variables
NMAX=30;

%vectores para mostrar grafica al final de la simulación
vec_ganancia=[]; %almacena el valor del tiempo en cada iteración
intentos = [];
%inicialización del tiempo y red
beneficio = [0 0 0 0 0 0 0 21 25 0];
costo = [
    0       0       0       0     999     999     999     999     999     999
  999     999     999     999       4       5     999     999     999     999
  999     999     999     999       5     999       3     999     999     999
  999     999       1     999     999       5       2     999     999     999
  999     999     999     999     999       1     999       5     999     999
  999     999     999     999     999     999     999       3       4     999
  999     999     999     999     999     999     999     999       2     999
  999     999     999     999     999     999     999     999     999       0
  999     999     999     999     999     999     999     999     999       0
  999     999     999     999     999     999     999     999     999     999  ];
capacidad = [
    0   999     999     999     0       0       0       0       0       0
    0 	  0       0       0    10       5       0       0       0       0
    0 	  0       0       0     7       0       6       0       0       0
    0     0       4       0     0       8      11       0       0       0
    0     0       0       0     0       3       0      11       0       0
    0     0       0       0     0       0       0       8       6       0
    0     0       0       0     0       0       0       0      12       0
    0     0       0       0     0       0       0       0       0     999
    0     0       0       0     0       0       0       0       0     999
    0     0       0       0     0       0       0       0       0       0];
intento = 1;
%Desarrollo de la simulacion
while intento <= NMAX
    intento
    flow = 0;
    ganancia = 0;
    inicio = 1;
    encontro = 0;
   while inicio ~= 10
       k = 1;
       baseProb = 0;
       escogencia = rand;
        while k <= length(capacidad(inicio,:)) && encontro == 0 
            if capacidad(inicio,k) ~= 0
                fun = probabilidadArco(costo, capacidad, inicio, k);
                baseProb
                fun + baseProb
                escogencia
                if escogencia >= baseProb && escogencia <= fun + baseProb
                    encontro = 1;
                    if k ~= length(capacidad(inicio,:))
                        flow = unidrnd(capacidad(inicio, k)-1)+1;
                    end
                    
                    ganancia = ganancia + beneficio(inicio)*flow
                    inicio
                    inicio = k;
                else
                    fprintf('----------------\n');
                    baseProp = baseProb + fun
                end
            end
            k = k + 1;
        end
        encontro = 0;
    end
    vec_ganancia = [vec_ganancia ganancia];
    intentos = [intentos intento];
    intento = intento + 1;
end

figure
plot(intentos, vec_ganancia, '-o')
title('Desempeño del Callcenter');
xlabel('Tiempo [min]');
ylabel('% de aceptación de llamadas');

