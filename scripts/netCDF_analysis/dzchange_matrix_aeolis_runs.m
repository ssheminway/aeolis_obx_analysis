function [dt_array, bs_array, dx_array, dz_array] = dzchange_matrix_aeolis_runs(master_folder, dune_toe_elevs, beach_slopes, type)

    count = 0;
    for islope = 1:numel(beach_slopes)
        for itoe = 1:numel(dune_toe_elevs)
            count = count+1;
            dune_toe_elevs_all(count) = dune_toe_elevs(itoe);
            beach_slopes_all(count) = beach_slopes(islope);
        end
    end
    
    numsims = numel(dune_toe_elevs_all);
    
    for isim = 1:numsims
    
        if type ==1
            folder = [master_folder, 'simulation', num2str(isim, '%05.0f')];
            cd(folder)
            dat = ncread('aeolis.nc', 'zb');
        else
            cd(master_folder);
            try
                file = ['run', num2str(isim, '%05.0f'), '.nc'];
                dat = ncread(file, 'zb');
            catch err
                try
                    file = ['run', num2str(isim+63, '%05.0f'), '.nc'];
                    dat = ncread(file, 'zb');
                catch err
                      file = ['run', num2str(isim+126, '%05.0f'), '.nc'];
                      dat = ncread(file, 'zb');
                end
            end

        end

        start_prof = squeeze(dat(:,2, 1));
        end_prof = squeeze(dat(:,2, end));
        dx = 0.5;
    
        
        iuse = find(start_prof>=dune_toe_elevs_all(isim));

        inan = find(isnan(end_prof(iuse)) == 1);
        if numel(inan) == 0
            [dz_max(isim) nx_max(isim)]  = nanmax(end_prof(iuse)-start_prof(iuse));
        else
            dz_max(isim) = NaN;
            nx_max(isim) = NaN;
        end
    end
    dx_array = [nx_max-1]*dx;
    dz_array = dz_max;
    bs_array = beach_slopes_all;
    dt_array = dune_toe_elevs_all;

    %cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
end