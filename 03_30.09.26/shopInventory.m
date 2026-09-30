clear; clc;

%% initialize an array of structs to hold some inventory data
inventory(1).Brand = "Fender";
inventory(1).Model = "Jazzmaster Heritage 60s";
inventory(1).Type = "Electric";
inventory(1).Origin = "Japan";

inventory(2).Brand = "Martin";
inventory(2).Model = "D-28";
inventory(2).Type = "Acoustic";
inventory(2).Origin = "USA";

disp('Full Inventory Loaded.');
disp('---');

%% add another item, iterate through the inventory
inventory(3).Brand = "Yamaha";
inventory(3).Model = "Model unknown";
inventory(3).Type = "Bass";
inventory(3).Origin = "Indonesia";

for i = 1:length(inventory)
    if inventory(i).Origin == "Japan"
        fprintf('%s %s was imported from Japan.\n', ...
            inventory(i).Brand, inventory(i).Model);
    end
end