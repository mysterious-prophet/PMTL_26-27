function parseLogStrings()
    log_data = [
        "INFO: System boot successful";
        "WARNING: CPU temperature elevated";
        "INFO: Network connection established";
        "ERROR: Failed to write to disk sector 4";
        "INFO: User login detected";
        "ERROR: Memory segmentation fault"
    ];
    
    % write by line into a .txt file
    writelines(log_data, 'system_log.txt');
    
    % read by line into an array of strings
    logs = readlines('system_log.txt');

    if logs(end) == ""
        logs(end) = [];
    end

    is_error = contains(logs, "ERROR");
    error_logs = logs(is_error);

    num_errors = length(error_logs);
    fprintf('Found %d critical errors in the log:\n', num_errors);

    for i = 1:num_errors
        fprintf(' -> %s\n', error_logs(i));
    end
end