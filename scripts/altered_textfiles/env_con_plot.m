% modday_winds= load('wind.txt')
% modday_waves= load('wave.txt')
% modday_tides= load('tide.txt')
% 
% lowrisk_winds= load('wind_5%Storms.txt')
% lowrisk_waves= load('wave_5%Storms.txt')
% lowrisk_tides= load('tide_0.5mSLR_5%Storms.txt')
% 
% highrisk_tides = load('tide_1.5mSLR_5%Storms.txt')

clear
timePull = 'time';
time = []
windspeedPull = 'windSpeed';
windSpeed = []
windDirectionPull = 'windDirection';
windDirection = []
wavehsPull = 'waveHs'
waveHs = []
wavetpPull = 'waveTp'
wavetp = []
api1 = 'https://tidesandcurrents.noaa.gov/api/datagetter?product=hourly_height&application=UF&begin_date='
startDate = '20190101'
endDate = '20191231'
url1 = [api1,startDate, '&end_date=', endDate, '&datum=NAVD&station=8651370&time_zone=lst_ldt&units=metric&format=csv']
csv = readtable(url1)
%%
for i = 1:12
    month = sprintf('%02s',num2str(i))
    disp(month)
    url = ['https://chldata.erdc.dren.mil/thredds/dodsC/wis/Atlantic/ST63218/2019/WIS-ocean_waves_ST63218_2019' num2str(month) '.nc']
    ncid = netcdf.open(url);
    time1 = ncread(url, timePull);
    time = [time;time1];
    windspeed1 = ncread(url, windspeedPull);
    windSpeed = [windSpeed;windspeed1];
    winddirection1 = ncread(url,windDirectionPull)
    windDirection = [windDirection; winddirection1]
    waveheight = ncread(url,wavehsPull)
    waveHs = [waveHs;waveheight]
    waveperiod = ncread(url,wavetpPull)
    wavetp = [wavetp;waveperiod]
    netcdf.close(ncid);
end

%%
waterlevel = csv(:,"WaterLevel")
watertimes = datenum(datetime(csv.DateTime,'InputFormat','dd-MMM-yyyy HH:mm:ss'))
days = time/86400 + datenum(1970,1,1);
zerom = csv.WaterLevel


%Free Parameters
num_events= 10; %How many events do you want to modify
duration = 12; %What is the duration of each event in hours to modify
increase = 1.05; %What is the proportional increase in energy (1 for keeping the same, 1.2 = 20% increase in wave height, surge, and wind speed)
days_orig = days;
days = days-days(1);
%File Inputs
winds = [days,windSpeed];
waves = [days,waveHs];
tides = [days,zerom];

%%

%Code
%days = waves(:,1)/(3600*24);
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
%%
fivem = tideheights+0.5
onem = tideheights+1.0
%%
f = figure
%f.Position = [50 50 1200 700]
f.Position = [50 50 900 700]

subplot(521)
plot(days, windDirection, 'k')
hold on
datetick('x', 'mm-dd');
xticklabels([])
ylim([0 360])
grid on
%xlabel('Days')
ylabel('D_{wind} (^o)')
set(gca, 'fontsize', 14, 'FontWeight', 'bold')


subplot(523)
hold on
plot(days, windspeeds, 'r')
plot(days, windSpeed, 'k')
datetick('x', 'mm-dd');
xticklabels([])
set(gca, 'fontsize', 14, 'FontWeight', 'bold')
area([5000, 6000], ylim, 'FaceColor', 'blue', 'FaceAlpha', 0.3);

ylabel('u_{wind} (m/s)')
hold on
grid on
set(gca, 'fontsize', 14)

subplot(525)
hold on
plot(days, waveheights, 'r')
plot(days, waveHs, 'k')
%plot(days, modday_waves(:,2), 'k')
%legend('Low/High Risk Climate', Location='best')
datetick('x', 'mm-dd');
xticklabels([])
grid on
set(gca, 'fontsize', 14, 'FontWeight', 'bold')
%xlabel('Days')
ylabel('H_s (m)')

subplot(527)
hold on
plot(days, wavetp, 'k')
%plot(days, modday_waves(:,3), 'k')
datetick('x', 'mm-dd');
xticks([])
grid on
set(gca, 'fontsize', 14, 'FontWeight', 'bold')
%xlabel('Days')
ylabel('T_p (s)')
grid on
%set(gca, 'fontsize', 15)

subplot(529)
hold on
plot(days,zerom, 'k')
plot(days(1:(end-1)), fivem,'Color',"#EDB120")
plot(days(1:(end-1)), onem, 'r')
% plot(times, fivem,'y')
% plot(times,onem,'r')
datetick('x', 'mm/dd');
ylabel('SWL (m)')
grid on
set(gca, 'fontsize', 14, 'FontWeight', 'bold') 

subplot(524)
% plot(days(5850:6000), modday_winds(5850:6000,2), 'k')
% plot(days(5850:6000), lowrisk_winds(5850:6000,2), 'y')
hold on
plot(days(7500:7850), windspeeds(7500:7850), 'r', 'LineWidth', 3)
plot(days(7500:7850), windSpeed(7500:7850), 'k', 'LineWidth', 2)

%legend('Modern Day Climate', 'Low Risk Climate', 'High Risk Climate', 'Location', 'northoutside', Orientation=' horizontal')
hold on
%plot(days(5850:6300), modday_winds(5850:6300,2), 'k')
%xlim([6000 6300])
hold on
%ylabel('u_{wind} (m/s)')
ylim([0 21])
datetick('x', 'mm/dd', 'keeplimits');
%xticklabels([])
set(gca, 'fontsize', 14, 'FontWeight', 'bold') 
grid on

subplot(526)
hold on
plot(days(7500:7850), waveheights(7500:7850), 'r', 'LineWidth', 3)
plot(days(7500:7850), waveHs(7500:7850), 'k', 'LineWidth', 2)

datetick('x', 'mm/dd', 'keeplimits');
%ylabel('H_s (m)')
hold on
%plot(days(5850:6300), modday_waves(5850:6300,2), 'k')
hold on
%xlim([5900 6000])
ylim([0 6])
set(gca, 'fontsize', 14, 'FontWeight', 'bold') 
%ylim([5 20])
grid on
annotation('rectangle',[0.4 0.461 0.03 0.12], LineWidth=2, Color='k', LineStyle='--')
line_start = [0.429 0.54]
line_end = [0.55 0.529]
annotation('line',[line_start(1), line_end(1)],[line_start(2), line_end(2)], LineStyle='--', LineWidth= 2)
annotation('rectangle',[0.4 0.635 0.03 0.12], LineWidth=2, Color='k', LineStyle=':')
% annotation('rectangle',[0.7 0.635 0.2 0.12], LineWidth=2, Color='k', LineStyle=':')
% annotation('rectangle',[0.7 0.461 0.2 0.12], LineWidth=2, Color='k', LineStyle='--')

line_start2 = [0.429 0.73]
line_end2 = [0.548 0.71]

annotation('line',[line_start2(1), line_end2(1)],[line_start2(2), line_end2(2)], LineStyle=':', LineWidth= 2)
a = annotation('textbox',[0.13 0.838 0.1 0.1],'String', 'a.', 'FontSize',16, EdgeColor='none', FontWeight='bold', color = 'black')
a2 = annotation('textbox',[0.13 0.838 0.1 0.1],'String', 'a.', 'FontSize',14, EdgeColor='none', FontWeight='bold', color = 'white')

%set(a, 'BackgroundColor', [1 1 1]);
%set(a, 'FaceAlpha', 1);
annotation('textbox',[0.13 0.66 0.1 0.1],'String', 'b.', 'FontSize',14, EdgeColor='none', FontWeight='bold')
annotation('textbox',[0.13 0.49 0.1 0.1],'String', 'c.', 'FontSize',14, EdgeColor='none', FontWeight='bold')
annotation('textbox',[0.13 0.315 0.1 0.1],'String', 'd.', 'FontSize',14, EdgeColor='none', FontWeight='bold')
annotation('textbox',[0.13 0.148 0.1 0.1],'String', 'e.', 'FontSize',14, EdgeColor='none', FontWeight='bold')
annotation('textbox',[0.57 0.66 0.1 0.1],'String', 'f.', 'FontSize',14, EdgeColor='none', FontWeight='bold')
annotation('textbox',[0.57 0.49 0.1 0.1],'String', 'g.', 'FontSize',14, EdgeColor='none', FontWeight='bold')
annotation('line', [0.65 0.68], [0.305 0.305], LineWidth=2, Color='k')
annotation('textbox',[0.7 0.23 0.1 0.1],'String', 'Modern Day', 'FontSize',14, EdgeColor='none', FontWeight='bold')
annotation('line', [0.65 0.68], [0.25 0.25],'Color',"#EDB120", LineWidth=2 )
annotation('textbox',[0.7 0.18 0.1 0.1],'String', 'Low Risk', 'FontSize',14, EdgeColor='none', FontWeight='bold')
annotation('textbox',[0.7 0.13 0.1 0.1],'String', 'High Risk', 'FontSize',14, EdgeColor='none', FontWeight='bold')
annotation('line', [0.65 0.68], [0.20 0.20], LineWidth=2, Color='r')
exportgraphics(f,'enviro_cons.png','Resolution',300)

%saveas(gcf,'enviro_con.png', 'png','-r300')