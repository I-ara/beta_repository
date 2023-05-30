%Makes file folders for BV

%This is the raw data file, from Leo rn
cd('\\ca-um-nas201\fpn_rdm$\DM0571_LP_FoodBrainObesity\07_Raw_data\Raw_data')

%Makes list of participant names and calculates number of participants
file_list = dir;
participant_names = {file_list.name};
participant_names(:, 1:2) = [];
number_of_participants = numel(participant_names);

%Choose new location
sorted_location = 'D:\LeoData\Raw_data';


for cur_participant = 1:number_of_participants

    participant_id = participant_names(cur_participant);
    fprintf('We.re on Participant %s \n', participant_id{1,1})

    sorted_participant_file_og1 = fullfile(sorted_location, participant_id);
    sorted_participant_file = char(sorted_participant_file_og1);  
    
    %Creates participant number folder, goes in
    mkdir(sorted_participant_file)
    cd(sorted_participant_file)

    %Creates DCMs folder and First Analysis Folder, goes in
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

    %Creates Functional folders
    func1_loc = fullfile(fun_loc, strcat('S', participant_id, '_3T_01'));
    mkdir(char(func1_loc))

    func2_loc = fullfile(fun_loc, strcat('S', participant_id, '_3T_02'));
    mkdir(char(func2_loc))

    func3_loc = fullfile(fun_loc, strcat('S', participant_id, '_3T_03'));
    mkdir(char(func3_loc))

    func4_loc = fullfile(fun_loc, strcat('S', participant_id, '_3T_04'));
    mkdir(char(func4_loc))

end