function result = quadSolver(a, b, c)
    % calculate the discriminant
    disc = b^2 - 4*a*c;
    
    if disc > 0
        x1 = (-b+sqrt(disc))/(2*a);
        x2 = (-b-sqrt(disc))/(2*a);
        result = {x1, x2};
    elseif disc == 0
        result = -b/(2*a);
    else
        disp('Error: No real solution!');
        result = {};
    end
end