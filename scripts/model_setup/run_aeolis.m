
baseFolder = 'C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\';

numberSims = 135;
aeolisExe = 'C:\Users\sshem\anaconda3\Scripts\aeolis.exe';
numCores = 7;

%p = parpool(numCores);
for i = 135:numberSims
    netCDFFile = [baseFolder, 'simulation', num2str(i, '%05.0f'), filesep, 'aeolis.nc']
    if isfile(netCDFFile) 
        disp(netCDFFile)
    else
        simFolder = [baseFolder, 'simulation', num2str(i, '%05.0f'), filesep, 'aeolis.txt'];
        %simFolder = [baseFolder, 'aeolis.txt'];
        system([aeolisExe, ' ', simFolder]);
    end
end

delete(gcp('nocreate'))