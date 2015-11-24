function flujo = heuristica(nodos, arcos)
[V, B] = textread(nodos,'%d %d');
[F,D, C, U] = textread(arcos, '%d %d %d %d')
flujo = zeros(length(V),length(V));
capacidad = zeros(length(V),length(V));
NoHayCamino = false;
cAumentado = zeros(length(V),length(V));
for i = 1 : length(F)
    capacidad(F(i),D(i))=U(i);
end

while ~NoHayCamino
    
    for i = 1 : length(F)
       cAumentado(F(i),D(i)) = capacidad(F(i),D(i)) - flujo(F(i),D(i));
    end  
end

