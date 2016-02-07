function plot_NBER_recessions(plothandle,recessiondates,legend_strings)
axis tight
aaa=ylim;
bottom=aaa(1,1);
top=aaa(1,2);

%delete dates that happen before first data point
x_dates=xlim;
recessiondates(recessiondates(:,2)<x_dates(1),:)=[];

for ii=1:length(recessiondates)
hold on
ha = area([recessiondates(ii,1) recessiondates(ii,2)], [bottom top-bottom; bottom top-bottom],'FaceColor',[0.9 0.9 0.9],'EdgeColor','white');
set(ha(1), 'FaceColor', 'none') % this makes the bottom area invisible
set(ha, 'LineStyle', '-')
end
ylim(aaa)

if nargin==3
    legend(plothandle,legend_strings)
end
uistack(plothandle,'top')
set(gca,'Layer','top')
