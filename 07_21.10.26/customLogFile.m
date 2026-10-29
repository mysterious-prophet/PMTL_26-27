function customLogFile()
    sim_steps = 5;
    temperatures = [22.1, 23.4, 25.0, 26.2, 24.8];
    
    % open file for writing
    fileID = fopen('simulation_log.txt', 'w');

    if fileID == -1
        error('Could not open file for writing.');
    end

    for i = 1:sim_steps
        fprintf(fileID, 'Step %d: Temp is %.1f deg C\n', i, temperatures(i));
    end

    % close and save file
    fclose(fileID);
    disp('Log successfully written to simulation_log.txt');
end