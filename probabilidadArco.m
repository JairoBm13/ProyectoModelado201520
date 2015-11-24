function probabilidad = probabilidadArco(costo, capacidad, i, j)
if i ~= 1 & j ~= length(capacidad)
    destinos = 0;
    for k = 1 : length(capacidad)
        if capacidad(i,k)~=0
            destinos = destinos + 1;
        end
    end
    denominador = sum(capacidad(i,:).*costo(i,:));
    razon = capacidad(i,j)*costo(i,j)/denominador;
    probabilidad = 1 - razon;
    probabilidad = probabilidad/(destinos-1);
elseif i==1
    arcos = 0;
    for k = 1 : length(capacidad)
        if capacidad(i,k) == 999
            arcos = arcos + 1;
        end
    end
    probabilidad = 1/arcos;
elseif j==length(capacidad)
    arcos = 0;
    for k = 1 : length(capacidad)
        if capacidad(k, j) == 999
            arcos = arcos + 1;
        end
    end
    probabilidad = 1/arcos;
end   
