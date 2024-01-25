function contourData = add_pcolor_subplot_aeolis_volumes2(figh, subplt, DT, BS, VOL, ttxt,ylab, xlab, cbarflag, ytic,xtic)
    figure(figh)
    try
    subplot(subplt)
    catch err
    subplot(subplt(1), subplt(2), subplt(3))
    end
    pcolor(DT, BS, VOL)
    %pcolor(DT, BS, vol_array)
    shading interp
%    shading flat
    xticks([2 2.5 3 3.5 4]);
    yticks([0.05 0.1 0.15 0.2])
    set(gca,'TickDir','out', 'TickLength',[.02 .02])

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
        ylabel('tan \beta (m/m)','FontSize',18);
    end
    if xlab == 1
        xlabel('z_{toe} (m)','FontSize', 14);
    end
    title(ttxt)
    hold on
    contourData = contour(DT, BS, VOL, [0 0], 'k--', 'LineWidth', 3)
    h = colorbarpzn(-85, 5, 'rev');
    freezeColors
    set(gca, 'LineWidth', 1, 'FontSize', 9.5, 'FontWeight', 'bold')
    ylabel(h, '$\Delta V_{dune} (m^3/m)$', 'FontSize', 13, 'FontWeight', 'bold')
    grid on
    if cbarflag ==1
        colorbar('hide');
    elseif cbarflag == 3
        colorbar(subplt,'Position',...
    [0.918645908234514 0.107179752066116 0.0160467631602855 0.440082644628099]);
    end
end