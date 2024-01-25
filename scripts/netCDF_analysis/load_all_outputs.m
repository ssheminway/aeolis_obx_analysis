clear all
close all
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')

%Load all folders of data
dune_toe_elevs = 2:0.25:4;
beach_slopes = 0.05:0.025:0.2;

modern_day_0p1_folder = 'C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\Outputs0.1\';
modern_day_0p5_folder = 'C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\Outputs0.5\';
modern_day_0p9_folder = 'C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\Outputs0.9\';
low_0p1_folder = 'C:\Users\sshem\Downloads\Thesis_Data\LowRisk_Veg_Uniform\Outputs0.1\';
low_0p5_folder = 'C:\Users\sshem\Downloads\Thesis_Data\LowRisk_Veg_Uniform\Outputs0.5\';
low_0p9_folder = 'C:\Users\sshem\Downloads\Thesis_Data\LowRisk_Veg_Uniform\Outputs0.9\';
high_0p1_folder = 'C:\Users\sshem\Downloads\Thesis_Data\HighRisk_Veg_Uniform\Outputs0.1\';
high_0p5_folder = 'C:\Users\sshem\Downloads\Thesis_Data\HighRisk_Veg_Uniform\Outputs0.5\';
high_0p9_folder = 'C:\Users\sshem\Downloads\Thesis_Data\HighRisk_Veg_Uniform\Outputs0.9\';
modern_day_0p03_folder = 'C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\Outputs0.03\';
modern_day_0p35_folder = 'C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\Outputs0.35\';
modern_day_0p67_folder = 'C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\Outputs0.67\';
low_0p03_folder = 'C:\Users\sshem\Downloads\Thesis_Data\LowRisk_Veg_Gradients\Outputs0.03\';
low_0p35_folder = 'C:\Users\sshem\Downloads\Thesis_Data\LowRisk_Veg_Gradients\Outputs0.35\';
low_0p67_folder = 'C:\Users\sshem\Downloads\Thesis_Data\LowRisk_Veg_Gradients\Outputs0.67\';
high_0p03_folder = 'C:\Users\sshem\Downloads\Thesis_Data\HighRisk_Veg_Gradients\Outputs0.03\';
high_0p35_folder = 'C:\Users\sshem\Downloads\Thesis_Data\HighRisk_Veg_Gradients\Outputs0.35\';
high_0p67_folder = 'C:\Users\sshem\Downloads\Thesis_Data\HighRisk_Veg_Gradients\Outputs0.67';
modern_day_0p3_folder = 'C:\Users\sshem\Downloads\Thesis_Data\Baseline_netCDFs\ModDay\';
low_day_0p3_folder = 'C:\Users\sshem\Downloads\Thesis_Data\Baseline_netCDFs\LowRisk\';
high_day_0p3_folder = 'C:\Users\sshem\Downloads\Thesis_Data\Baseline_netCDFs\HighRisk\';

cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
%genpath(pwd)

%Creating matrix for calculating dune volume change-----------------------

[DT, BS, VOLCHANGE_MODERN_0p1, dt_array, bs_array, vol_array_modern_0p1] = volchange_matrix_aeolis_runs(modern_day_0p1_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_MODERN_0p5, dt_array, bs_array, vol_array_modern_0p5] = volchange_matrix_aeolis_runs(modern_day_0p5_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_MODERN_0p9, dt_array, bs_array, vol_array_modern_0p9] = volchange_matrix_aeolis_runs(modern_day_0p9_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_LOW_0p1, dt_array, bs_array, vol_array_low0p1] = volchange_matrix_aeolis_runs(low_0p1_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_LOW_0p5, dt_array, bs_array, vol_array_low0p5] = volchange_matrix_aeolis_runs(low_0p5_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_LOW_0p9, dt_array, bs_array, vol_array_low0p9] = volchange_matrix_aeolis_runs(low_0p9_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_HIGH_0p1, dt_array, bs_array, vol_array_high0p1] = volchange_matrix_aeolis_runs(high_0p1_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_HIGH_0p5, dt_array, bs_array, vol_array_high0p5] = volchange_matrix_aeolis_runs(high_0p5_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_HIGH_0p9, dt_array, bs_array, vol_array_high0p9] = volchange_matrix_aeolis_runs(high_0p9_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_MODERN_0p03, dt_array, bs_array, vol_array_modern_0p03] = volchange_matrix_aeolis_runs(modern_day_0p03_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_MODERN_0p35, dt_array, bs_array, vol_array_modern_0p35] = volchange_matrix_aeolis_runs(modern_day_0p35_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_MODERN_0p67, dt_array, bs_array, vol_array_modern_0p67] = volchange_matrix_aeolis_runs(modern_day_0p67_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_LOW_0p03, dt_array, bs_array, vol_array_low_0p03] = volchange_matrix_aeolis_runs(low_0p03_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_LOW_0p35, dt_array, bs_array, vol_array_low_0p35] = volchange_matrix_aeolis_runs(low_0p35_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_LOW_0p67, dt_array, bs_array, vol_array_low_0p67] = volchange_matrix_aeolis_runs(low_0p67_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_HIGH_0p03, dt_array, bs_array, vol_array_high_0p03] = volchange_matrix_aeolis_runs(high_0p03_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_HIGH_0p35, dt_array, bs_array, vol_array_high_0p35] = volchange_matrix_aeolis_runs(high_0p35_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_HIGH_0p67, dt_array, bs_array, vol_array_high_0p67] = volchange_matrix_aeolis_runs(high_0p67_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_MODERN_0p3, dt_array, bs_array, vol_array_modern_0p3] = volchange_matrix_aeolis_runs(modern_day_0p3_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_LOW_0p3, dt_array, bs_array, vol_array_low_0p3] = volchange_matrix_aeolis_runs(low_day_0p3_folder, dune_toe_elevs, beach_slopes,2);
[DT, BS, VOLCHANGE_HIGH_0p3, dt_array, bs_array, vol_array_high_0p3] = volchange_matrix_aeolis_runs(high_day_0p3_folder, dune_toe_elevs, beach_slopes,2);
%% Calculating dz and formatting matrix

cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_high0p9, dz_array_high0p9] = dzchange_matrix_aeolis_runs(high_0p9_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_high0p1, dz_array_high0p1] = dzchange_matrix_aeolis_runs(high_0p1_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_high0p5, dz_array_high0p5] = dzchange_matrix_aeolis_runs(high_0p5_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_high0p03, dz_array_high0p03] = dzchange_matrix_aeolis_runs(high_0p03_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_high0p35, dz_array_high0p35] = dzchange_matrix_aeolis_runs(high_0p35_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_high0p67, dz_array_high0p67] = dzchange_matrix_aeolis_runs(high_0p67_folder, dune_toe_elevs, beach_slopes,2);cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_low0p9, dz_array_low0p9] = dzchange_matrix_aeolis_runs(low_0p9_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_low0p1, dz_array_low0p1] = dzchange_matrix_aeolis_runs(low_0p1_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_low0p5, dz_array_low0p5] = dzchange_matrix_aeolis_runs(low_0p5_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_low0p03, dz_array_low0p03] = dzchange_matrix_aeolis_runs(low_0p03_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_low0p35, dz_array_low0p35] = dzchange_matrix_aeolis_runs(low_0p35_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_low0p67, dz_array_low0p67] = dzchange_matrix_aeolis_runs(low_0p67_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_modern0p9, dz_array_modern0p9] = dzchange_matrix_aeolis_runs(modern_day_0p9_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_modern0p1, dz_array_modern0p1] = dzchange_matrix_aeolis_runs(modern_day_0p1_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_modern0p5, dz_array_modern0p5] = dzchange_matrix_aeolis_runs(modern_day_0p5_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_modern0p03, dz_array_modern0p03] = dzchange_matrix_aeolis_runs(modern_day_0p03_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_modern0p35, dz_array_modern0p35] = dzchange_matrix_aeolis_runs(modern_day_0p35_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_modern0p67, dz_array_modern0p67] = dzchange_matrix_aeolis_runs(modern_day_0p67_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_modern0p3, dz_array_modern0p3] = dzchange_matrix_aeolis_runs(modern_day_0p3_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_low0p3, dz_array_low0p3] = dzchange_matrix_aeolis_runs(low_day_0p3_folder, dune_toe_elevs, beach_slopes,2);
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
[dt_array, bs_array, dx_array_high0p3, dz_array_high0p3] = dzchange_matrix_aeolis_runs(high_day_0p3_folder, dune_toe_elevs, beach_slopes,2);


%% Calculating maximum depositon zone (Figure 11)

hfig = figure('units','normalized','outerposition',[0 0 0.6 0.5]);
clear datdiff
for ifind = 1:63
dat1 = [dx_array_modern0p1(ifind) dx_array_modern0p3(ifind) dx_array_modern0p5(ifind) dx_array_modern0p9(ifind)];
dat2 = [dx_array_modern0p03(ifind) dx_array_modern0p35(ifind) dx_array_modern0p67(ifind)];
dat3 = [dat1 dat2]';
dat3x = [0.1 0.3 0.5 0.9 0.05 0.35 0.67];
datdiff(ifind, :) = dat3;
end

out = datdiff./datdiff(:,3);
out(isinf(out)) = NaN;
outmean = nanmean(out);

subplot(121)
hold on
plot(dat3x([1])*100, outmean([1]), '.', 'MarkerSize', 40, 'Color', [0.4 0.7 0.4])
plot(dat3x([3:4])*100, outmean([3:4]), '.', 'MarkerSize', 40, 'Color', [0.4 0.7 0.4])
plot(dat3x([2])*100, outmean([2]), 'd', 'MarkerSize', 10, 'Color', [0 0 0],'MarkerFaceColor', [0 0 0])
plot(dat3x([5:7])*100, outmean([5:7]), 's','MarkerSize', 12, 'MarkerFaceColor', [0.2 0.2 0.8], 'MarkerEdgeColor', [0.2 0.2 0.8])
grid on
xticks([0,25,50,75,100])
xlabel('\rho_{veg} (%)')
ylabel([{'Normalized Max'; 'Deposition Distance (m)'}])
set(gca, 'LineWidth', 2, 'FontSize', 14, 'FontWeight', 'bold')


for ifind = 1:63
dat1 = [dz_array_modern0p1(ifind) dz_array_modern0p3(ifind) dz_array_modern0p5(ifind) dz_array_modern0p9(ifind)];
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
dat2 = [dz_array_modern0p03(ifind) dz_array_modern0p35(ifind) dz_array_modern0p67(ifind)];
dat3 = [dat1 dat2]';
dat3x = [0.1 0.3 0.5 0.9 0.05 0.35 0.67];
datdiff(ifind, :) = dat3;
end

temp = datdiff(:,3);
temp(temp<0.1) = NaN;
datdiff(:,3) = temp;
out = datdiff./datdiff(:,3);
out(isinf(out)) = NaN;
outmean = nanmean(out);

subplot(122)
hold on
pu1=plot(dat3x([1])*100, outmean([1]), '.', 'MarkerSize', 40, 'Color', [0.4 0.7 0.4])
pu=plot(dat3x([3:4])*100, outmean([3:4]), '.', 'MarkerSize', 40, 'Color', [0.4 0.7 0.4])
pb =plot(dat3x([2])*100, outmean([2]), 'd', 'MarkerSize', 10, 'MarkerFaceColor', [0 0 0], 'MarkerEdgeColor', [0 0 0])
pg=plot(dat3x([5:7])*100, outmean([5:7]),'s', 'MarkerSize', 12, 'MarkerFaceColor', [0.2 0.2 0.8], 'MarkerEdgeColor', [0.2 0.2 0.8])
grid on
xticks([0,25,50,75,100])
xlabel('\rho_{veg} (%)')
ylabel([{'Normalized Max';'Deposition Height (m)'}])
set(gca,'TickDir','out', 'TickLength',[.02 .02])

set(gca, 'LineWidth', 2, 'FontSize', 14, 'FontWeight', 'bold')
%legend('Uniform Veg Cases', 'Gradient Veg Cases')
legend([pb,pu1,pg],'Baseline Veg Case','Uniform Veg Cases', 'Gradient Veg Cases', Location='southeast')
sublabel('fontsize',20,'fontweight','bold','backgroundcolor','none')
exportgraphics(hfig,'norm_dep_plot.png','Resolution',300)

%saveas(hfig,'norm_dep_plots.jpg')

%% Creating P-color Plot (Figure 6)

VOLCHANGE_HIGH_0p9(7,9) = 0;
VOLCHANGE_LOW_0p03(7,9) = 0;
VOLCHANGE_LOW_0p9(7,9) = 0;
VOLCHANGE_HIGH_0p3(7,9) = 0
VOLCHANGE_HIGH_0p67(7,9) = -5
VOLCHANGE_HIGH_0p67(6,9) = -5


hfig = figure('units','normalized','outerposition',[0 0 0.5 1]);
%hfig = tiledlayout('TileSpacing','tight')
contourmod01 = add_pcolor_subplot_aeolis_volumes2(hfig, [731], DT, BS, VOLCHANGE_MODERN_0p1, 'a. 10%',0,0,1,1,0);
add_pcolor_subplot_aeolis_volumes2(hfig, [734], DT, BS, VOLCHANGE_MODERN_0p3, 'b. 30%',0,0,1,1,0);
contourmod05 = add_pcolor_subplot_aeolis_volumes2(hfig, [737], DT, BS, VOLCHANGE_MODERN_0p5, 'c. 50%',0,0,1,1,0);
contourmod09 = add_pcolor_subplot_aeolis_volumes2(hfig, [7,3,10], DT, BS, VOLCHANGE_MODERN_0p9, 'd. 90%',1,0,1,1,0);
contourmod003 = add_pcolor_subplot_aeolis_volumes2(hfig, [7,3,13], DT, BS, VOLCHANGE_MODERN_0p03, 'e. 3%',0,0,1,1,0);
contourmod035 = add_pcolor_subplot_aeolis_volumes2(hfig, [7,3,16], DT, BS, VOLCHANGE_MODERN_0p35, 'f. 35%',0,0,1,1,0);
contourmod067 = add_pcolor_subplot_aeolis_volumes2(hfig, [7,3,19], DT, BS, VOLCHANGE_MODERN_0p67, 'g. 67%',0,0,1,1,1);

contourlow01 = add_pcolor_subplot_aeolis_volumes2(hfig, [732], DT, BS, VOLCHANGE_LOW_0p1, 'h. 10%',0,0,1,0,0);
add_pcolor_subplot_aeolis_volumes2(hfig, [735], DT, BS, VOLCHANGE_LOW_0p3, 'i. 30%',0,0,1,0,0);
contourlow05 = add_pcolor_subplot_aeolis_volumes2(hfig, [738], DT, BS, VOLCHANGE_LOW_0p5, 'j. 50%',0,0,1,0,0);
contourlow09 = add_pcolor_subplot_aeolis_volumes2(hfig, [7,3,11], DT, BS, VOLCHANGE_LOW_0p9, 'k. 90%',0,0,1,0,0);
contourlow003 = add_pcolor_subplot_aeolis_volumes2(hfig, [7,3,14], DT, BS, VOLCHANGE_LOW_0p03, 'l. 3%',0,0,1,0,0);
contourlow035 = add_pcolor_subplot_aeolis_volumes2(hfig, [7,3,17], DT, BS, VOLCHANGE_LOW_0p35, 'm. 35%',0,0,1,0,0);
contourlow067 = add_pcolor_subplot_aeolis_volumes2(hfig, [7,3,20], DT, BS, VOLCHANGE_LOW_0p67, 'n. 67%',0,1,1,0,1);

add_pcolor_subplot_aeolis_volumes2(hfig, [733], DT, BS, VOLCHANGE_HIGH_0p1, 'o. 10%',0,0,1,0,0);
add_pcolor_subplot_aeolis_volumes2(hfig, [736], DT, BS, VOLCHANGE_HIGH_0p3, 'p. 30%',0,0,1,0,0);
add_pcolor_subplot_aeolis_volumes2(hfig, [739], DT, BS, VOLCHANGE_HIGH_0p5, 'q. 50%',0,0,1,0,0);
add_pcolor_subplot_aeolis_volumes2(hfig, [7,3,12], DT, BS, VOLCHANGE_HIGH_0p9, 'r. 90%',0,0,1,0,0);
add_pcolor_subplot_aeolis_volumes2(hfig, [7,3,15], DT, BS, VOLCHANGE_HIGH_0p03, 's. 3%',0,0,1,0,0);
add_pcolor_subplot_aeolis_volumes2(hfig, [7,3,18], DT, BS, VOLCHANGE_HIGH_0p35, 't. 35%',0,0,1,0,0);
add_pcolor_subplot_aeolis_volumes2(hfig, [7,3,21], DT, BS, VOLCHANGE_HIGH_0p67, 'u. 67%',0,0,1,0,1);
h =colorbar('Position',[0.92 0.109 0.015 0.439]);
ylabel(h,'\Delta V_{dune} (m^3/m)', 'FontSize', 10, 'FontWeight','bold')
annotation(hfig,"textbox", [0.16, 0.932, 0.2 , 0.04], 'String','Modern Day','FontSize',12, 'FontWeight','Bold', 'EdgeColor','white')
annotation(hfig,"textbox", [0.46, 0.932, 0.2 , 0.04], 'String','Low Risk','FontSize',12, 'FontWeight','Bold', 'EdgeColor','white')
annotation(hfig,"textbox", [0.74, 0.932, 0.2 , 0.04], 'String','High Risk','FontSize',12, 'FontWeight','Bold', 'EdgeColor','white')
exportgraphics(hfig,'p-color.png','Resolution',300)

%sublabel('fontsize',12,'fontweight','bold','backgroundcolor','none')
saveas(gcf, 'pcolor_plot.png');

%% Calculating diff. in volume change compared to baseline (Figure 10)

mod_diff_90 = VOLCHANGE_MODERN_0p9-VOLCHANGE_MODERN_0p3
mod_diff_50 = VOLCHANGE_MODERN_0p5 - VOLCHANGE_MODERN_0p3
mod_diff_10 = VOLCHANGE_MODERN_0p1 - VOLCHANGE_MODERN_0p3

mod_diff_67 = VOLCHANGE_MODERN_0p67 - VOLCHANGE_MODERN_0p3
mod_diff_35 = VOLCHANGE_MODERN_0p35 - VOLCHANGE_MODERN_0p3
mod_diff_03 = VOLCHANGE_MODERN_0p03 - VOLCHANGE_MODERN_0p3

low_diff_90 = VOLCHANGE_LOW_0p9-VOLCHANGE_LOW_0p3
low_diff_50 = VOLCHANGE_LOW_0p5 - VOLCHANGE_LOW_0p3
low_diff_10 = VOLCHANGE_LOW_0p1 - VOLCHANGE_LOW_0p3

low_diff_67 = VOLCHANGE_LOW_0p67 - VOLCHANGE_LOW_0p3
low_diff_35 = VOLCHANGE_LOW_0p35 - VOLCHANGE_LOW_0p3
low_diff_03 = VOLCHANGE_LOW_0p03 - VOLCHANGE_LOW_0p3

cfig = figure('units','normalized','outerposition',[0 0 0.45 0.6]);
add_pcolor_subplot_diff_plot(cfig, [3,4,1], DT, BS, mod_diff_10, 'a. 10%',0,0,1,1,0, contourmod01,0);
add_pcolor_subplot_diff_plot(cfig, [3,4,5], DT, BS, mod_diff_50, 'b. 50%',1,0,1,1,0, contourmod05,0);
add_pcolor_subplot_diff_plot(cfig, [3,4,9], DT, BS, mod_diff_90, 'c. 90%',0,0,1,1,1, contourmod09,0);
add_pcolor_subplot_diff_plot(cfig, [3,4,2], DT, BS, mod_diff_03, 'd. 3%',0,0,1,0,0, contourmod003,0);
add_pcolor_subplot_diff_plot(cfig, [3,4,6], DT, BS, mod_diff_35, 'e. 35%',0,0,1,0,0, contourmod035,0);
add_pcolor_subplot_diff_plot(cfig, [3,4,10], DT, BS, mod_diff_67, 'f. 67%',0,0,1,0,1, contourmod067,0);

add_pcolor_subplot_diff_plot(cfig, [3,4,3], DT, BS, low_diff_10, 'g. 10%',0,0,1,0,0, contourlow01,0);
add_pcolor_subplot_diff_plot(cfig, [3,4,7], DT, BS, low_diff_50, 'h. 50%',0,0,1,0,0, contourlow05,0);
add_pcolor_subplot_diff_plot(cfig, [3,4,11], DT, BS, low_diff_90, 'i. 90%',0,0,1,0,1, contourlow09,0);
add_pcolor_subplot_diff_plot(cfig, [3,4,4], DT, BS, low_diff_03, 'j. 3%',0,0,1,0,0, contourlow003,1);
add_pcolor_subplot_diff_plot(cfig, [3,4,8], DT, BS, low_diff_35, 'k. 35%',0,0,1,0,0, contourlow035,0);
add_pcolor_subplot_diff_plot(cfig, [3,4,12], DT, BS, low_diff_67, 'l. 67%',0,0,1,0,1,contourlow067,0);
h2 =colorbar('Position',[0.92 0.109 0.015 0.5]);
ylabel(h2,'Diff. in \Delta V_{dune} (m^3/m)', 'FontSize', 10, 'FontWeight','bold')
%sublabel('fontsize',12,'fontweight','bold','backgroundcolor','none')
%text(0.1,0.5, 'tan \beta (m/m)', Rotation=90,FontSize=12, FontWeight='bold')
annotation(cfig,"textbox", [0.24, 0.96, 0.2 , 0.04], 'String','Modern Day','FontSize',12, 'FontWeight','Bold', 'EdgeColor','white')
annotation(cfig,"textbox", [0.65, 0.96, 0.2 , 0.04], 'String','Low Risk','FontSize',12, 'FontWeight','Bold', 'EdgeColor','white')
annotation(cfig,"textbox", [0.451, 0.025, 0.1 , 0.04], 'String','z_{toe} (m)','FontSize',11, 'FontWeight','Bold', 'EdgeColor','white')
exportgraphics(cfig,'_veg-p-color_final.png','Resolution',300)

%saveas(cfig,'Final_veg_diff_plot.jpg')

%% Creating Box PLot (Figure 5)

vector0p3 = reshape(VOLCHANGE_MODERN_0p3,[],1)
vector0p03 = reshape(VOLCHANGE_MODERN_0p03,[],1)
vector0p35 = reshape(VOLCHANGE_MODERN_0p35,[],1)
vector0p67 = reshape(VOLCHANGE_MODERN_0p67,[],1)
vector0p1 = reshape(VOLCHANGE_MODERN_0p1,[],1)
vector0p5 = reshape(VOLCHANGE_MODERN_0p5,[],1)
vector0p9 = reshape(VOLCHANGE_MODERN_0p9,[],1)

vector_low0p3 = reshape(VOLCHANGE_LOW_0p3,[],1)
vector_low0p03 = reshape(VOLCHANGE_LOW_0p03,[],1)
vector_low0p35 = reshape(VOLCHANGE_LOW_0p35,[],1)
vector_low0p67 = reshape(VOLCHANGE_LOW_0p67,[],1)
vector_low0p1 = reshape(VOLCHANGE_LOW_0p1,[],1)
vector_low0p5 = reshape(VOLCHANGE_LOW_0p5,[],1)
vector_low0p9 = reshape(VOLCHANGE_LOW_0p9,[],1)

vector_high0p3 = reshape(VOLCHANGE_HIGH_0p3,[],1)
vector_high0p03 = reshape(VOLCHANGE_HIGH_0p03,[],1)
vector_high0p35 = reshape(VOLCHANGE_HIGH_0p35,[],1)
vector_high0p67 = reshape(VOLCHANGE_HIGH_0p67,[],1)
vector_high0p1 = reshape(VOLCHANGE_HIGH_0p1,[],1)
vector_high0p5 = reshape(VOLCHANGE_HIGH_0p5,[],1)
vector_high0p9 = reshape(VOLCHANGE_HIGH_0p9,[],1)

modern_day = horzcat(vector0p3,vector0p1,vector0p5,vector0p9, vector0p03, vector0p35, vector0p67)
low_risk = horzcat(vector_low0p3,vector_low0p1, vector_low0p5, vector_low0p9,vector_low0p03, vector_low0p35, vector_low0p67)
high_risk = horzcat(vector_high0p3,vector_high0p1, vector_high0p5, vector_high0p9,vector_high0p03, vector_high0p35,vector_high0p67)

Labels = ['Baseline 30%', '10%', '50%', '90%', '3%', '35%', '67']

f = figure('units','normalized','outerposition',[0 0 0.45 0.75]);

subplot(3,1,1)
boxchart(modern_day, 'BoxFaceColor',[0 0 0], MarkerStyle='.', BoxEdgeColor='k',MarkerColor='k')
xticklabels({'', '', '', '', '', '', ''})
ylim([-100 20])
text(0.21, 0.92, 'a.', 'FontSize',12, FontWeight='bold')
set(gca, 'LineWidth', 1, 'FontSize', 12, 'FontWeight', 'bold', 'YGrid','on', 'TickDir','out')
subplot(3,1,2)
boxchart(low_risk,'BoxFaceColor',[0.9290 0.6940 0.1250], MarkerStyle='.', BoxEdgeColor='k',MarkerColor='k')
ylabel('\Delta V_{dune} (m^3/m)')
xticklabels({'', '', '', '', '', '', ''})
ylim([-100 20])
text(0.21, 0.52, 'b.', 'FontSize',12, FontWeight='bold')
set(gca, 'LineWidth', 1, 'FontSize', 12, 'FontWeight', 'bold', 'YGrid', 'on', 'TickDir','out')


subplot(3,1,3)
boxchart(high_risk,'BoxFaceColor','r', MarkerStyle='.', BoxEdgeColor='k',MarkerColor='k')
ylim([-100 20])

xticklabels({'30%', '10%', '50%', '90%', '3%', '35%', '67%'})
xlabel('\rho_{veg}')
text(0.21, 0.22, 'c.', 'FontSize',12, FontWeight='bold')
set(gca, 'LineWidth', 1, 'FontSize', 12, 'FontWeight', 'bold', 'YGrid','on', 'TickDir','out')
annotation('line',[.561 .561],[.121 .325], 'LineStyle','--', 'LineWidth',1)
annotation('line',[.561 .561],[.417 .618], 'LineStyle','--', 'LineWidth',1)
annotation('line',[.561 .561],[.725 .923], 'LineStyle','--', 'LineWidth',1)


exportgraphics(f,'box_chart.png','Resolution',300)

%saveas(f,'boxchart.jpg')

%% Creating scatter plot of dune volume change examples (Figure 9)

cd('C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Baseline\simulation00063')
file = ['aeolis.nc'];
dat_30_modday = ncread(file, 'zb')

cd('C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\simulation00063')
file = ['run00063.nc'];
dat_10_modday = ncread(file, 'zb');
cd('C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\simulation00126')
file = ['run00126.nc'];
dat_50_modday = ncread(file, 'zb');
cd('C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\simulation00189')
file = ['run00189.nc'];
dat_90_modday = ncread(file, 'zb');

cd('C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\simulation00063')
file = ['run00063.nc'];
dat_03_modday = ncread(file, 'zb');
cd('C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\simulation00126')
file = ['run00126.nc'];
dat_35_modday = ncread(file, 'zb');
cd('C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\simulation00189')
file = ['run00189.nc'];
dat_67_modday = ncread(file, 'zb');

files = {'C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\simulation00063\run00063.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Baseline\simulation00063\aeolis.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\simulation00126\run00126.nc', 'C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\simulation00189\run00189.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\simulation00063\run00063.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\simulation00126\run00126.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\simulation00189\run00189.nc'};

labels = {'10%','30%', '50%', '90%', '3%', '35%', '67%'};
x = [0.1,0.3,0.5,0.9,0.03,0.35,0.67]
volChange_mod = [0,0,0,0,0,0,0];
for i = 1:7
    disp(i)
    dat = ncread(files{i},'zb');
    start_prof = squeeze(dat(:,2, 1));
    end_prof = squeeze(dat(:,2, end));
    dx = 0.5;
        
    iuse = find(start_prof>=4.0);
    
    inan = find(isnan(end_prof(iuse)) == 1);
    if numel(inan) == 0
                volChange_mod(i) = nansum((end_prof(iuse)-start_prof(iuse)).*dx);
    else
                volChange_mod(i) = NaN;
    end
end

files_2 = {'C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\simulation00031\run00031.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Baseline\simulation00031\aeolis.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\simulation00094\run00094.nc', 'C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\simulation00157\run00157.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\simulation00031\run00031.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\simulation00094\run00094.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\simulation00157\run00157.nc'};
volChange_2 = [0,0,0,0,0,0,0];
x2 = [0.1,0.3,0.5,0.9,0.03,0.35,0.67]

for i = 1:7
    disp(i)
    dat = ncread(files_2{i},'zb');
    start_prof = squeeze(dat(:,2, 1));
    end_prof = squeeze(dat(:,2, end));
    dx = 0.5;
        
    iuse = find(start_prof>=4.0);
    
    inan = find(isnan(end_prof(iuse)) == 1);
    if numel(inan) == 0
                volChange_2(i) = nansum((end_prof(iuse)-start_prof(iuse)).*dx);
    else
                volChange_2(i) = NaN;
    end
end

files_3 = {'C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\simulation00019\run00019.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Baseline\simulation00019\aeolis.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\simulation00082\run00082.nc', 'C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Uniform\simulation00145\run00145.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\simulation00019\run00019.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\simulation00082\run00082.nc','C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Gradients\simulation00145\run00145.nc'};

volChange_3 = [0,0,0,0,0,0,0];
x3 = [0.1,0.3,0.5,0.9,0.03,0.35,0.67]

for i = 1:7
    disp(i)
    dat = ncread(files_3{i},'zb');
    start_prof = squeeze(dat(:,2, 1));
    end_prof = squeeze(dat(:,2, end));
    dx = 0.5;
        
    iuse = find(start_prof>=4.0);
    
    inan = find(isnan(end_prof(iuse)) == 1);
    if numel(inan) == 0
                volChange_3(i) = nansum((end_prof(iuse)-start_prof(iuse)).*dx);
    else
                volChange_3(i) = NaN;
    end
end

f2 = figure('units','normalized','outerposition',[0 0 0.45 0.5]);

p1 = scatter(x([1:4]),volChange_mod([1:4]),75,'filled','Marker','o','MarkerFaceColor','#0072BD', DisplayName='z_{toe}: 4 m & tan\beta: 0.2 m/m')
hold on
p2 = scatter(x([5:7]),volChange_mod([5:7]),75,'LineWidth',2,'Marker','o','MarkerEdgeColor','#0072BD')

xticks([0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9])
set(gca, 'LineWidth', 1, 'FontSize', 12, 'FontWeight', 'bold', 'TickDir', 'out')
hold on
p3 = scatter(x2([1:4]), volChange_2([1:4]),75,'filled','Marker', 'd','MarkerFaceColor','#EDB120', DisplayName = 'z_{toe}: 2.75 m & tan\beta: 0.175 m/m')
p4 = scatter(x2([5:7]), volChange_2([5:7]),75,'LineWidth',2,'Marker', 'd','MarkerEdgeColor','#EDB120')

p5 = scatter(x3([1:4]), volChange_3([1:4]), 75,'filled','Marker', 's','MarkerFaceColor','#A2142F', DisplayName =  'z_{toe}: 2 m & tan\beta: 0.1 m/m')
p6 = scatter(x3([5:7]), volChange_3([5:7]), 75,'Marker', 's','LineWidth', 2,'MarkerEdgeColor','#A2142F', DisplayName =  'z_{toe}: 2 m & tan\beta: 0.1 m/m')

grid on

xlabel('\rho_{veg} (% Cover)')
ylabel('\Delta V_{dune} (m^3/m)')
legend([p1,p3,p5], location = 'best', Box='on', Position=[0.54 0.24 0.3 0.2], EdgeColor='white')
ylim([-15 6])
set(gca, 'LineWidth', 1, 'FontSize', 14, 'FontWeight', 'bold', 'TickDir', 'out')
xticklabels({'10', '20','30','40', '50', '60', '70','80','90'})
cd('C:\Users\sshem\Downloads\Thesis_Data\Matlab_Figs\new_scripts')
exportgraphics(f2,'scatter.png','Resolution',300)

%saveas(f2, 'morph_scatter.jpg')
