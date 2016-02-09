% Plot the level of productivity and financial conditions as well as their
% innovations as calculated in the shock construction script.

%% Path settings

% path_to_data = project_paths('OUT_DATA', 'dataset.mat');
% path_to_shocks = project_paths('OUT_ANALYSIS', 'shock_innovations.mat');
path_to_shocks = '../../bld/out/analysis/shock_innovations.mat';
path_to_data = '../../bld/out/data/dataset.mat';

%% Load data
load(path_to_shocks);
load(path_to_data);

%% Plot results in a 2 by 2 matrix of plots

figure
% set(gcf, 'visible', 'off')
    subplot(2, 2, 1)
    plot(timeline.estimation_sample(2:end-1), productivity_state(1:end-1)* ...
         100)
    title('Level of productivity, z')
    
    subplot(2, 2, 2)
    plot(timeline.estimation_sample(2:end-1), financial_state(1:end-1)*100)
    title('Level of financial conditions, \xi')
    
    subplot(2, 2, 3)
    plot(timeline.estimation_sample(2:end-1), prod_innovations*100)
    title('Innvoations to productivity, \epsilon_z')
    
    subplot(2, 2, 4)
    plot(timeline.estimation_sample(2:end-1), fin_innovations*100)
    title('Innovations to financial conditions, \epsilon_{\xi}')