function add_pcolor_subplot_diff_plot(figh, subplt, DT, BS, VOL, ttxt,ylab, xlab, cbarflag, ytic,xtic, contourData, conflag)
    figure(figh)
    try
    subplot(subplt)
    catch err
    subplot(subplt(1), subplt(2), subplt(3))
    end
    pcolor(DT, BS, VOL)
    shading interp
%    shading flat
    set(gca,'TickDir','out', 'TickLength',[.02 .02])

    xticks([2 2.5 3 3.5 4]);
    yticks([0.05 0.1 0.15 0.2])
    if xtic == 1
        xticklabels({'2', '2.5', '3', '3.5','4'});
    else
        xticklabels({'','','','',''})
    end
    if ytic == 1
        yticklabels({'0.05', '0.1', '0.15', '0.2'});
    else
        yticklabels({'','','','',''})
    end

    if ylab == 1
        ylabel('tan \beta (m/m)','FontSize',12);
    end
    if xlab == 1
        xlabel('z_{toe} (m)','FontSize', 12);
    end
    title(ttxt)
    hold on
    %contour(DT, BS, VOL, [0 0], 'k--', 'LineWidth', 3)
   

    h = colorbarpzn(-5, 5,'dft', 'bwg');
    freezeColors
    set(gca, 'LineWidth', 1, 'FontSize', 9.5, 'FontWeight', 'bold')
    ylabel(h, '$\Delta V_{dune} (m^3/m)$', 'FontSize', 12, 'FontWeight', 'bold')

    if cbarflag ==1
        colorbar('hide');
    elseif cbarflag == 3
        colorbar(h, 'eastoutside');  % attach colorbar to h
    end
    if conflag ==1
        plot(contourData(1, 2:end-3), contourData(2, 2:end-3), 'black', 'LineWidth', 2, 'LineStyle','--');
    else
        plot(contourData(1, 2:end), contourData(2, 2:end), 'black', 'LineWidth', 2, 'LineStyle','--');
    end  

end