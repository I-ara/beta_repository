
%% When you get MRI and fMRI raw data, it often needs some organisation into functional runs and anatomy runs. 
%% This script creates a directory with dedicated folders for easy Brain Voyager access

%% Disclaimer: This script comes as it is - there might be errors at runtime and results might be wrong although the code was tested and did work as expected. 
%% made by: Iara de Almeida Ivo

% Add here your raw data_file
cd('D:\local\Raw_data_OG')

%Makes list of participant names and calculates number of participants
file_list = dir;
participant_names = {file_list.name};
participant_names(:, 1:2) = [];
number_of_participants = numel(participant_names);

%Choose your new location
sorted_location = 'D:\local\Raw_data_BV';


for cur_participant = 1:number_of_participants

    participant_id = participant_names(cur_participant);
    fprintf('We.re on Participant %s \n', participant_id{1,1})

    sorted_participant_file_og1 = fullfile(sorted_location, participant_id);
    sorted_participant_file = char(sorted_participant_file_og1);  
    
    %Creates participant number folder, goes in
    mkdir(sorted_participant_file)
    cd(sorted_participant_file)

    %Creates DCMs folder and a First Analysis Folder, goes in
    sorted_participant_file_og2 = fullfile(sorted_participant_file_og1, strcat(participant_id, '_DCMs'));
    mkdir(char(sorted_participant_file_og2))

    analysis_file = fullfile(sorted_participant_file_og1, strcat(participant_id, '_FirstAnalysis'));
    mkdir(char(analysis_file))

    cd(char(sorted_participant_file_og2))

    %Creates Anatomy Folder
    anatomy_loc = fullfile(sorted_participant_file_og2, 'Anatomy');
    mkdir(char(anatomy_loc))

    %Creates Functional Folder, goes in
    fun_loc = fullfile(sorted_participant_file_og2, 'Functional');
    mkdir(char(fun_loc))
    cd(char(fun_loc))

    %Creates Functional folders (this example has four runs and it was a 3T experiment)
    func1_loc = fullfile(fun_loc, strcat('S', participant_id, '_3T_01'));
    mkdir(char(func1_loc))

    func2_loc = fullfile(fun_loc, strcat('S', participant_id, '_3T_02'));
    mkdir(char(func2_loc))

    func3_loc = fullfile(fun_loc, strcat('S', participant_id, '_3T_03'));
    mkdir(char(func3_loc))

    func4_loc = fullfile(fun_loc, strcat('S', participant_id, '_3T_04'));
    mkdir(char(func4_loc))

end