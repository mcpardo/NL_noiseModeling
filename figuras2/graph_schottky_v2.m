%% sdsd
close all,  clc
% Interprete de LaTeX
interpreter();

% Grosor de línea de graficos predeterminada
set(0, 'DefaultLineLineWidth',2);
% set(0, 'defaultMarkerSize',8);

data = readmatrix("resultados_diodo.txt");
Vdc_values = data(1,:);
VnR_exact = data(2,:);
VnR_1d_exact = data(3,:);
VnR_2d_exact = data(4,:);
VnR_3d_exact = data(5,:);
VnR_1d_2f = data(6,:);
VnR_2d_2f = data(7,:);
VnR_3d_2f = data(8,:);

figure
loglog(Vdc_values, VnR_exact,'color','black','DisplayName','Exact model')
hold on
loglog(Vdc_values, VnR_1d_exact,'color',[0 0.4470 0.7410],'marker','none','DisplayName','1st exact','linestyle','--','markersize',8)
loglog(Vdc_values, VnR_1d_2f,'color',[0 0.4470 0.7410],'marker','.','DisplayName','1st two fonts','linestyle','none','markersize',8)
loglog(Vdc_values, VnR_2d_exact,'color',[0.8500 0.3250 0.0980],'marker','none','DisplayName','2nd exact','linestyle','--','markersize',8)
loglog(Vdc_values, VnR_2d_2f,'color',[0.8500 0.3250 0.0980],'marker','.','DisplayName','2nd two fonts','linestyle','none','markersize',8)
loglog(Vdc_values, VnR_3d_exact,'color',[0.4660 0.6740 0.1880],'marker','none','DisplayName','3rd exact','linestyle','--','markersize',8)
loglog(Vdc_values, VnR_3d_2f,'color',[0.4660 0.6740 0.1880],'marker','.','DisplayName','3rd two fonts','linestyle','none','markersize',8)
xticks(logspace(-3, 1, 5))
xticklabels({'1 mV','10 mV','100 mV','1 V'})
yticks([1e-10, 3e-10, 1e-9])
yticklabels({'0.1', '0.3', '1'})
xlim([1e-3 3])
grid on
xlabel('Bias voltage (V)')
ylabel('$V_{n,R}$ (nV)')
legend('show','Location','northwest')
% Add a rectangle to highlight the region between x = 0.1 and x = 0.2
x_rect = [0.1, 0.2, 0.2, 0.1];
y_rect = [1e-10, 1e-10, 1e-9, 1e-9];
patch(x_rect, y_rect, 'yellow', 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'HandleVisibility', 'off')


% create a new pair of axes inside current figure
axes('position',[.2 .3 .25 .25])
box on % put box around new pair of axes
indexOfInterest = (Vdc_values < 0.2) & (Vdc_values > 0.1); % range of t near perturbation
loglog(Vdc_values(indexOfInterest), VnR_exact(indexOfInterest),'color','black','DisplayName','Exact')
hold on
loglog(Vdc_values(indexOfInterest),VnR_1d_exact(indexOfInterest),'color',[0 0.4470 0.7410],'marker','none','DisplayName','1st exact','linestyle','--','markersize',8) % plot on new axes
loglog(Vdc_values(indexOfInterest),VnR_2d_exact(indexOfInterest),'color',[0.8500 0.3250 0.0980],'marker','none','DisplayName','2nd exact','linestyle','--','markersize',8) % plot on new axes
loglog(Vdc_values(indexOfInterest),VnR_3d_exact(indexOfInterest),'color',[0.4660 0.6740 0.1880],'marker','none','DisplayName','3rd exact','linestyle','--','markersize',8) % plot on new axes
loglog(Vdc_values(indexOfInterest),VnR_1d_2f(indexOfInterest),'color',[0 0.4470 0.7410],'marker','none','DisplayName','1st two fonts','linestyle',':','linewidth',2,'markersize',8)% plot on new axes
loglog(Vdc_values(indexOfInterest),VnR_2d_2f(indexOfInterest),'color',[0.8500 0.3250 0.0980],'marker','none','DisplayName','2nd two fonts','linestyle',':','linewidth',2,'markersize',8) % plot on new axes
loglog(Vdc_values(indexOfInterest),VnR_3d_2f(indexOfInterest),'color',[0.4660 0.6740 0.1880],'marker','none','DisplayName','3rd two fonts','linestyle',':','linewidth',2,'markersize',8) % plot on new axe
axis tight
grid on
% xticks((120:20:180) * 1e-3)
% xticklabels({'120','140','160','180 mV'})
yticks([2e-10, 3e-10, 4e-10, 5e-10])
yticklabels({'0.2', '0.3', '0.4', '0.5'})
ylim([0.14e-9 0.53e-9])
% Save the figure as an SVG file
saveas(gcf, 'pv_v3.svg')