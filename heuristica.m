function flujo = heuristica(nodos, arcos)
[V, B] = textread(nodos,'%d %d');
[F,D, C, U] = textread(arcos, '%d %d %d %d');
first = [];
for i = 1 : length(V) + 1
    first = [first -1];
end
arcos = zeros(4,length(F)*2);
numArcs =  1;
for i = 1 : length(F)

end