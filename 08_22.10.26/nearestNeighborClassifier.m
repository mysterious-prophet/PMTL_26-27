function nearestNeighborClassifier(k)
    if nargin < 1
        k = 3;
    end

    % generate synthetic training data: [feature1, feature2]
    class0 = [2 + randn(20,1), 2 + randn(20,1), zeros(20,1)];
    class1 = [7 + randn(20,1), 7 + randn(20,1), ones(20,1)];
    training_data = [class0; class1];
    
    % save the array into a .csv file
    writematrix(training_data, 'clinical_features.csv');
    
    % new unclassified patient
    new_patient = [5 + randn(), 5 + randn()];
    fprintf('New patient features: [%.1f, %.1f]\n', new_patient(1), new_patient(2));

    % read the .csv file
    data = readmatrix('clinical_features.csv');
    distances = sqrt((data(:, 1) - new_patient(1)).^2 + (data(:, 2) - new_patient(2)).^2);
    data(:, 4) = distances;

    sort_dists = sortrows(data, 4);
    k_nearest = sort_dists(1:k, :);
    predicted_class = round(mean(k_nearest(:, 3)));

    fprintf('Patient classified as: Class %d\n', predicted_class);

    % plot the two classes and the new data point
    f1 = data(:, 1);
    f2 = data(:, 2);
    labels = data(:, 3);
    
    figure; 
    hold on;
    scatter(f1(labels==0), f2(labels==0), 'bo', 'DisplayName', 'Class 0');
    scatter(f1(labels==1), f2(labels==1), 'ro', 'DisplayName', 'Class 1');
    scatter(new_patient(1), new_patient(2), 100, 'k*', 'DisplayName', 'New Patient');
    legend('show', 'Location', 'best');
    title('k-NN Classification (k=1)');
end