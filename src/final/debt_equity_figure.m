% Replicate the figure of debt repurchases and equity payouts with the
% newest data available.

%% Path settings

% Use this path when compiling the entire project with waf.
% path_to_data = project_paths('OUT_DATA', 'dataset.mat');
% path_out_figure = project_paths('OUT_FIGURES', 'figure1.pdf');
% Alternatively us the relative path below to run the script from the Matlab
% IDE.
path_to_data = '../../bld/out/data/dataset.mat';
path_out_figure = '../../out/figures/figure1.pdf';

%% Load in data
load(path_to_data);
load recessiondates;

%% Plot figure
figure
% set(gcf, 'visible', 'off')
plot(timeline.full_sample, equity_payout.full_sample,'--r');
hold on
plot(timeline.full_sample, debt_repurchase.full_sample, 'b');

% Set limits for x and y-axis as in the paper
ylim([-16,16]);
xlim([1952,2012]);

% Plot zero reference line in the graph
hline = refline(0,0);
hline.Color = 'black';

% Add recessiondates to the graph
plot_NBER_recessions(gcf, recessiondates);

% Add legend to the graph
leg = legend('Equity Payout','Debt repurchase');
set(leg, 'Location', 'northwest')

% % get rid of whitespace
% Get rid of whitespace
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [10 6.25]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 10 6.25]);

% Save figure as pdf
% saveas(gcf, path_out_figure)
saveas(gcf, 'figure1.pdf')