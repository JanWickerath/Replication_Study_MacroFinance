% Update calculation of tfp shocks and financial shocks, with most recent data
% available (2015 third quarter).

%% Path settings

% Use this path when compiling the entire project with waf.
path_to_data = project_paths('OUT_DATA', 'dataset.mat');
path_to_model_specs = project_paths('OUT_DATA', 'parameters.mat');
path_analysis_output = project_paths('OUT_ANALYSIS', 'shock_innovations.mat');
% Alternatively us the relative path below to run the script from the Matlab
% IDE.
% path_to_data = '../../bld/out/data/dataset.mat';
% path_to_model_specs = '../../bld/out/data/parameters.mat';
% path_analysis_output = '../../bld/out/analysis/shock_innovations.mat'

%% Load in data
load(path_to_data);
load(path_to_model_specs);

%% Calculate financial state and productivity state of the economy

% Calculate proportional deviations of the financial state according to the
% linearized enforcement constraint as stated in the paper.
financial_state = param.phi_k * capital.log_diff(2:end) + param.phi_b * ...
    real_debt.log_diff(2:end) + business_output.log_diff(2:end);

% Calculate proportional deviations of the productivity state according to
% the linearized production function.
productivity_state = business_output.log_diff(2:end) - param.theta * ...
    capital.log_diff(1:end - 1) - (1 - param.theta) * ...
    working_hours.log_diff(2:end);

%% Estimate the autoregressive system in the paper

% Create the matrix of lagged variables that can be used in the VAR
regression_data = horzcat(productivity_state(1:end-1), financial_state(1: ...
                                                  end-1));

% Initialize the matrix of coefficients in the VAR
ar_mat = NaN(2, 2);

% Regress productivity on lagged productivity and lagged financial state
[ar_mat(1,:), ~, prod_innovations] = regress(productivity_state(2:end), ...
                                             regression_data);

% Regress financial state on lagged productivity and lagged financial state
[ar_mat(2,:), ~, fin_innovations] = regress(financial_state(2:end), ...
                                            regression_data);


save(path_analysis_output, 'prod_innovations', 'fin_innovations', 'ar_mat');