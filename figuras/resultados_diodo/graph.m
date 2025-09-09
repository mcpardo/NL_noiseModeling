%% sdsd
clear all, close all,  clc
set(groot,'defaulttextinterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');
% Grosor de línea de graficos predeterminada
set(0, 'DefaultLineLineWidth',1.2);
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
loglog(Vdc_values, VnR_exact,'color','black','DisplayName','Exact')
hold on
loglog(Vdc_values, VnR_1d_exact,'color',[0 0.4470 0.7410],'marker','none','DisplayName','1st exact','linestyle','--','markersize',8)
loglog(Vdc_values, VnR_1d_2f,'color',[0 0.4470 0.7410],'marker','none','DisplayName','1st two fonts','linestyle',':','linewidth',2,'markersize',8)
loglog(Vdc_values, VnR_2d_exact,'color',[0.8500 0.3250 0.0980],'marker','none','DisplayName','2nd exact','linestyle','--','markersize',8)
loglog(Vdc_values, VnR_2d_2f,'color',[0.8500 0.3250 0.0980],'marker','none','DisplayName','2nd two fonts','linestyle',':','linewidth',2,'markersize',8)
loglog(Vdc_values, VnR_3d_exact,'color',[0.4660 0.6740 0.1880],'marker','none','DisplayName','3rd exact','linestyle','--','markersize',8)
loglog(Vdc_values, VnR_3d_2f,'color',[0.4660 0.6740 0.1880],'marker','none','DisplayName','3rd two fonts','linestyle',':','linewidth',2,'markersize',8)

grid on
xlabel('Biasing (V)')
xlim([1e-3 1])
legend('show','Location','northwest')
% create a new pair of axes inside current figure
axes('position',[.2 .3 .25 .25])
box on % put box around new pair of axes
indexOfInterest = (Vdc_values < 0.2) & (Vdc_values > 0.1); % range of t near perturbation
loglog(Vdc_values(indexOfInterest),VnR_1d_exact(indexOfInterest),'color',[0 0.4470 0.7410],'marker','none','DisplayName','1st exact','linestyle','--','markersize',8) % plot on new axes
hold on
loglog(Vdc_values(indexOfInterest),VnR_2d_exact(indexOfInterest),'color',[0.8500 0.3250 0.0980],'marker','none','DisplayName','2nd exact','linestyle','--','markersize',8) % plot on new axes
loglog(Vdc_values(indexOfInterest),VnR_3d_exact(indexOfInterest),'color',[0.4660 0.6740 0.1880],'marker','none','DisplayName','3rd exact','linestyle','--','markersize',8) % plot on new axes
loglog(Vdc_values(indexOfInterest),VnR_1d_2f(indexOfInterest),'color',[0 0.4470 0.7410],'marker','none','DisplayName','1st two fonts','linestyle',':','linewidth',2,'markersize',8)% plot on new axes
loglog(Vdc_values(indexOfInterest),VnR_2d_2f(indexOfInterest),'color',[0.8500 0.3250 0.0980],'marker','none','DisplayName','2nd two fonts','linestyle',':','linewidth',2,'markersize',8) % plot on new axes
loglog(Vdc_values(indexOfInterest),VnR_3d_2f(indexOfInterest),'color',[0.4660 0.6740 0.1880],'marker','none','DisplayName','3rd two fonts','linestyle',':','linewidth',2,'markersize',8) % plot on new axes
axis tight
