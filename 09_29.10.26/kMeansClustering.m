function kMeansClustering(K, num_iters)
    if nargin < 2
        K = 4;
        num_iters = 10;
    end
    % generate 3 distinct blobs of data
    blob1 = [randn(30,1)+2, randn(30,1)+2];
    blob2 = [randn(30,1)+8, randn(30,1)+2];
    blob3 = [randn(30,1)+5, randn(30,1)+8];
    all_data = [blob1; blob2; blob3];
    
    % shuffle the data and save to .csv
    all_data = all_data(randperm(90), :);
    writematrix(all_data, 'unlabeled_data.csv');
    
    % read data into a table
    data = readmatrix('unlabeled_data.csv');
    n = length(data);
    
    % select random centroids
    centroids = data(randperm(n, K), :);
    
    % prealloc. labels
    labels = zeros(n, 1);
    
    for iter = 1:num_iters
        for i = 1:n
            % distance to centroids
            pt = data(i, :);
            dist1 = (pt(1)-centroids(1,1))^2 + (pt(2)-centroids(1,2))^2;
            dist2 = (pt(1)-centroids(2,1))^2 + (pt(2)-centroids(2,2))^2;
            dist3 = (pt(1)-centroids(3,1))^2 + (pt(2)-centroids(3,2))^2;
            
            % predict class
            [~, best_idx] = min([dist1, dist2, dist3]);
            labels(i) = best_idx;
        end
        
        % update centroids
        for c = 1:K
            cluster_points = data(labels == c, :);
            if ~isempty(cluster_points)
                centroids(c, :) = mean(cluster_points, 1);
            end
        end
    end
    
    % save final matrix
    final_output = [data, labels];
    writematrix(final_output, 'clustered_data.csv');
    disp('Clustering complete! Saved to clustered_data.csv.');
    
    % visualize
    figure;
    hold on;
    grid on;
    % add colors here if necessary for larger K
    colors = ['r', 'g', 'b'];
    for c = 1:K
        scatter(data(labels==c, 1), data(labels==c, 2), 36, colors(c), 'filled');
        plot(centroids(c,1), centroids(c,2), 'kx', 'MarkerSize', 15, 'LineWidth', 3);
    end
    title(sprintf('K-Means Clustering (K=%d)', K));
end