clear; clc;

% array of strings containing titles and years
movie_db = ["Zodiac (2007)", "Prisoners (2013)", "Watcher (2022)", ...
            "The Silence of the Lambs (1991)", "Longlegs (2024)", "Brick (2005)"];

disp('Extracting data from the first entry as an example:');
example_entry = movie_db(1);
example_title = extractBefore(example_entry, " (");
example_year = extractBetween(example_entry, "(", ")");

fprintf('Title: %s | Year: %s\n\n', example_title, example_year);

for i = 1:length(movie_db)
    year_str = extractBetween(movie_db(i), "(", ")");
    year_num = str2double(year_str);
    
    if year_num >= 2015
        title_str = extractBefore(movie_db(i), " (");
        fprintf('- %s\n', upper(title_str));
    end
end