%Free Parameters
num_events= 10; %How many events do you want to modify
duration = 12; %What is the duration of each event in hours to modify
increase = 1.50; %What is the proportional increase in energy (1 for keeping the same, 1.2 = 20% increase in wave height, surge, and wind speed)

%File Inputs
winds = load('wind.txt');
waves = load('wave.txt');
tides = load('tide.txt');


%Code
days = waves(:,1)/(3600*24);
max_days = ceil(max(days));
count = 0;
for iday = 0:max_days-1
    count = count+1;
    ifind = find(days>=iday & days<[iday+1]);
    [max_wind(count), max_wind_i(count)] = max(winds(ifind,2));
    max_wind_i(count) = ifind(max_wind_i(count));
    [max_wave(count), max_wave_i(count)] = max(waves(ifind,2));
    max_wave_i(count) = ifind(max_wave_i(count));
    [max_tide(count), max_tide_i(count)] = max(tides(ifind,2));
    max_tide_i(count) = ifind(max_tide_i(count));
end
[sort_wave, isort] = sort(max_wave, 'descend');
windspeeds = winds(:,2);
waveheights = waves(:,2);
tideheights = tides(1:end-1,2);
windspeeds_orig = winds(:,2);
waveheights_orig = waves(:,2);
tideheights_orig = tides(1:end-1,2);

for ix = 1:num_events

    iloc = max_wave_i(isort(ix));
    ilocs = [iloc-round(duration/2)]:[iloc+round(duration/2)];

    new_max_wave_height = waveheights_orig(iloc)*increase;
    new_max_wind_speed = windspeeds_orig(iloc)*increase;
    new_max_tide_height = tideheights_orig(iloc)*increase;


    wind_time_series = windspeeds(ilocs);
    wind_time_series1 = [linspace(wind_time_series(1), new_max_wind_speed, round(duration/2)+1)];
    wind_time_series2 = [linspace(new_max_wind_speed, wind_time_series(end), round(duration/2)+1)];
    wind_time_seriesnew = [wind_time_series1 wind_time_series2(2:end)];
    ichange = find(wind_time_series(:) > wind_time_seriesnew(:));
    wind_time_seriesnew(ichange) = wind_time_series(ichange);

    wave_time_series = waveheights(ilocs);
    wave_time_series1 = [linspace(wave_time_series(1), new_max_wave_height, round(duration/2)+1)];
    wave_time_series2 = [linspace(new_max_wave_height, wave_time_series(end), round(duration/2)+1)];
    wave_time_seriesnew = [wave_time_series1 wave_time_series2(2:end)];
    ichange = find(wave_time_series(:) > wave_time_seriesnew(:));
    wave_time_seriesnew(ichange) = wave_time_series(ichange);

    tide_time_series = tideheights(ilocs);
    tide_time_series1 = [linspace(0, new_max_tide_height-tideheights(iloc), round(duration/2)+1)];
    tide_time_series2 = [linspace(new_max_tide_height-tideheights(iloc), 0, round(duration/2)+1)];
    tide_time_seriesnew = [tide_time_series1 tide_time_series2(2:end)]+tideheights(ilocs)';
    tide_time_seriesnew = tide_time_seriesnew(:)';
  
    windspeeds(ilocs) = wind_time_seriesnew;
    waveheights(ilocs) = wave_time_seriesnew;
    tideheights(ilocs) = tide_time_seriesnew;

end

%Plotting
f = figure;
f.Position = [50 50 1200 700];
subplot(311)
hold on
plot(days, windspeeds, 'r')
plot(days, winds(:,2), 'k')
xlabel('Days')
ylabel('Wind Speed (m/s)')
grid on
set(gca, 'fontsize', 15)
subplot(312)
hold on
plot(days, waveheights, 'r')
plot(days, waves(:,2), 'k')
xlabel('Days')
ylabel('Wave Height (m)')
grid on
set(gca, 'fontsize', 15)
subplot(313)
hold on
plot(days, tideheights, 'r')
plot(days, tides(1:end-1,2), 'k')
xlabel('Days')
ylabel('Tide (m)')
grid on
legend('Modified Time Series', 'Original Time Series', 'Location', 'NorthWest')
set(gca, 'fontsize', 15)

%legend('Old Time Series', 'Location', 'NorthWest')

% %File Export
% tideout = [days(:)*24*60*60 tideheights(:)];
% waveout = [days(:)*24*60*60 waveheights(:) waves(:,3)];
% windout = [days(:)*24*60*60 windspeeds(:) winds(:,3)];
% dlmwrite('105_wind.txt', windout, 'delimiter', ' ');
% dlmwrite('15_105_tide.txt', tideout, 'delimiter', ' ');
% dlmwrite('105_wave.txt', waveout, 'delimiter', ' ');

