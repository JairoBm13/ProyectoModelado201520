function [sp, spcost] = dijkstra(matriz_costo, s, d)
n=size(matriz_costo,1);
S(1:n) = 0;     %s, vector, set of visited vectors
dist(1:n) = inf;   % it stores the shortest distance between the source node and any other node;
prev(1:n) = n+1;    % Previous node, informs about the best previous node known to reach each  network node 

dist(s) = 0;


while sum(S)~=n
    candidate=[];
    for i=1:n
        if S(i)==0
            candidate=[candidate dist(i)];
        else
            candidate=[candidate inf];
        end
    end
    [u_index u]=min(candidate);
    S(u)=1;
    for i=1:n
        if(dist(u)+matriz_costo(u,i))<dist(i)
            dist(i)=dist(u)+matriz_costo(u,i);
            prev(i)=u;
        end
    end
end


sp = [d];

while sp(1) ~= s
    if prev(sp(1))<=n
        sp=[prev(sp(1)) sp];
    else
        error;
    end
end;
spcost = dist(d);