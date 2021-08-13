        function S=load_file(S)
            if isfile([S.save_location,S.file_name,'.mat'])
                load([S.save_location,S.file_name,'.mat'],'S');
            end
        end