function [centroids] = clustering_pc(points, NC)
  [number, D] = size(points);
  centroids = zeros(NC,D);
  dimension = zeros(1,NC);
  distance = 0;
  %intializare centroizi
  for i = 1:NC
    [a dimension(i)] = size(i:NC:number);
    cluster(i,1:dimension(i)) = i:NC:number;
  endfor
  for i = 1:NC
    centroids(i,:) = sum(points(cluster(i,1:dimension(i)),:))./dimension(i);
  endfor

  for k = 1:1000;
    dimension = zeros(1,NC);
  %impartirea punctelor in clustere
    for i = 1:number
      distance = norm(points(i,:) - centroids(1,:),2);
      index = 1;
      for dis = 2:NC
        if (distance > norm(points(i,:) - centroids(dis,:),2))
          distance = norm(points(i,:) - centroids(dis,:),2);
          index = dis;
        endif
      endfor
      dimension(index) = dimension(index) + 1;
      cluster(index,dimension(index)) = i;
    endfor

    %calcularea noilor centroizi
      for i = 1:NC
        if (dimension(i) ~= 0)
          if (dimension(i) == 1)
            new_centroids(i,:) = points(cluster(i,1:dimension(i)),:);
          else
            new_centroids(i,:) = sum(points(cluster(i,1:dimension(i)),:))./dimension(i);
          endif
        endif
      endfor
    %conditia de iesire, in cazul in care s-au stabilizat centroizii
   if (norm(new_centroids - centroids,2) == 0)
     break
   endif
       centroids = new_centroids; 
  endfor
endfunction
