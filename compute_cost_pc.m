function [cost] = compute_cost_pc(points, centroids)
    [number, D] = size(points);
    [NC ,D] = size(centroids);
    cost = 0;
    %calculare distantei minime
    for i = 1:number
      distance = norm(points(i,1:D) - centroids(1,1:D),2);
      for dis = 2:NC
        if (distance > norm(points(i,1:D) - centroids(dis,1:D),2))
          distance = norm(points(i,1:D) - centroids(dis,1:D),2);
        endif
      endfor
      %adaugarea distantei la cost
      cost = cost + distance;
    endfor
endfunction

