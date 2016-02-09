% Plot the level of productivity and financial conditions as well as their
% innovations as calculated in the shock construction script.

%% Path settings

path_to_data = project_paths('OUT_DATA', 'dataset.mat');
path_to_shocks = project_paths('OUT_ANALYSIS', 'shock_innovations.mat');
path_out_figure = project_paths('OUT_FIGURES', 'figure2.pdf');
% path_to_shocks = '../../bld/out/analysis/shock_innovations.mat';
% path_to_data = '../../bld/out/data/dataset.mat';
% path_out_figure = '../../bld/out/figures/figure2.pdf';

%% Load data
load(path_to_shocks);
load(path_to_data);

%% Plot results in a 2 by 2 matrix of plots

figure
set(gcf, 'visible', 'off')
    subplot(2, 2, 1)
    plot(timeline.estimation_sample(2:end-1), productivity_state(1:end-1)* ...
         100)
    ylim([-8 8]);
    xlim([1985 2015.5]);
    title('Level of productivity, z')
    
    subplot(2, 2, 2)
    plot(timeline.estimation_sample(2:end-1), financial_state(1:end-1)*100)
    ylim([-8 8]);
    xlim([1985 2015.5]);
    title('Level of financial conditions, \xi')
    
    subplot(2, 2, 3)
    plot(timeline.estimation_sample(2:end-1), prod_innovations*100)
    ylim([-3.5 3.5]);
    xlim([1985 2015.5]);
    title('Innvoations to productivity, \epsilon_z')
    
    subplot(2, 2, 4)
    plot(timeline.estimation_sample(2:end-1), fin_innovations*100)
    ylim([-3.5 3.5]);
    xlim([1985 2015.5]);
    title('Innovations to financial conditions, \epsilon_{\xi}')
    
% Get rid of whitespace
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [10 6.25]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 10 6.25]);

%% Save figure as pdf
saveas(gcf, path_out_figure)