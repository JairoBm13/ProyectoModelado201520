function [max_flow] = ford_fulkerson(source,sink,graph,g_size)
    max_flow = spalloc(g_size(1),g_size(2),10);
    %max_flow = zeros(g_size);
    path = find_path(source,sink,graph, max_flow, g_size); 
    
    % path contains [from_node to_node capacity]
    while ~isempty(path)
        cf = min(path(:,3));
        from = path(:,1);
        to = path(:,2);
        indexes = sub2ind(g_size, from, to); 
        reverse_ind = sub2ind(g_size, to, from); 
        max_flow(indexes) = max_flow(indexes) + cf;
        max_flow(reverse_ind) = max_flow(reverse_ind) -cf;
        path = find_path(source, sink, graph, max_flow,g_size);
    end
end


%to find paths previously not found
function [path] = find_path(source,sink, graph, max_flow, g_size)
    q = []; %enqueue
    gsize = size(graph);
    visited = zeros(1,gsize(1));
    parent = zeros(1,gsize(1));
    q = [source q];
    visited(source) = 1; %mark source
    path = [];
    while ~isempty(q)
        %deque t
        t = q(end);
        q(end) = [];
        visited(t) = 2;
        [row,col] = find_edges(graph, t);
        edge_indexes = sub2ind(g_size,row*t,col);
        valid_visited = visited(col) == 0;
        valid_capacities = graph(edge_indexes) > max_flow(edge_indexes);
        valid = valid_visited & valid_capacities;
        valid_edges = col(valid);
        q = [valid_edges(end:-1:1) q];
        parent(valid_edges) = t;
        visited(valid_edges) = 1;
    end
    if(visited(sink) == 2)
       to=sink;
       while to~=source
           from = parent(to);
           path = [from to ( graph(from,to)-max_flow(from,to) ) ; path];
           to = from;
       end
    else
        path = [];
    end
end

function [row,col] = find_edges(graph, t)
    edges = graph(t,:) > 0;
    [row, col] = find(edges);
end