function mysteryCipher()
    secret_message = 'Khoor/#iulhqg1'; 
    
    % open .txt file in write mode
    fileID = fopen('evidence_log.txt', 'w');
    fprintf(fileID, '%s', secret_message);
    % close and save file
    fclose(fileID);
    disp('Encrypted file evidence_log.txt created.');

    % open in read mode
    fileID = fopen('evidence_log.txt', 'r');

    % get line from file
    garbled_text = fgetl(fileID);
    fclose(fileID);

    ascii_vals = double(garbled_text);
    shifted_vals = ascii_vals - 3;

    decrypted_text = char(shifted_vals);
    fprintf('Decrypted Message: %s\n', decrypted_text);
end