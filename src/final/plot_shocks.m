% Plot the level of productivity and financial conditions as well as their
% innovations as calculated in the shock construction script.

%% Path settings

% path_to_shocks = project_paths('OUT_ANALYSIS', 'shock_innovations.mat');
path_to_shocks = '../../bld/out/analysis/shock_innovations.mat';

%% Load data
load(path_to_shocks);

%% Plot results in a 2 by 2 matrix of plots

figure
% set(gcf, 'visible', 'off')
    subplot(2, 2, 1)
    plot(productivity_state)
    
    subplot(2, 2, 2)
    plot(financial_state)
    
    subplot(2, 2, 3)
    plot(prod_innovations)
    
    subplot(2, 2, 4)
    plot(fin_innovations)