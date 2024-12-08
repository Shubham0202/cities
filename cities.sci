function [minTour, minDistance] = travelingSalesmanBruteForce(distMatrix)
    [n, m] = size(distMatrix);
    cities = 1:n;
    minTour = [];
    minDistance = %inf;
    
    perm = perms(cities);
    
    for i = 1:size(perm, 1)
        tour = perm(i, :);
        tourDistance = 0;
        
        for j = 1:(n - 1)
            tourDistance = tourDistance + distMatrix(tour(j), tour(j + 1));
        end
        tourDistance = tourDistance + distMatrix(tour(n), tour(1));
        
        if tourDistance < minDistance then
            minDistance = tourDistance;
            minTour = tour;
        end
    end
end

distMatrix = [
    0, 10, 15, 20, 25;
    10, 0, 35, 25, 30;
    15, 35, 0, 30, 5;
    20, 25, 30, 0, 15;
    25, 30, 5, 15, 0
];

[minTour, minDistance] = travelingSalesmanBruteForce(distMatrix);

disp("Optimal Tour:");
disp(minTour);
disp("Minimum Distance of the Tour:");
disp(minDistance);


