%{
Programme to prepare the data provided in the online appendix of Jerman and
Quadrini (2012) to match the observation equations used in the simulation.
%}

%% Path settings

% Use these paths for waf...
path_original_data = project_paths('IN_DATA', 'DataSet.xlsx');
path_output_data = project_paths('OUT_DATA', 'estimation_data.mat');

% ... and these for use in Matlab IDE.
% path_original_data = '../original_data/DataSet.xlsx';
% path_output_data = '../../bld/out/data/estimation_data.mat';

%% Import original data and name them

% Following the description in the paper I only import data from the first
% quarter of 1984 onwards.
data_orig = xlsread(path_original_data, '4-Data For Estimation', 'A152:I257');

timeline    = data_orig(:,1);
gdp         = data_orig(:,2);
consumption = data_orig(:,3);
investment  = data_orig(:,4);
price_defl  = data_orig(:,5);
fed_funds   = data_orig(:,6);
debt_rep    = data_orig(:,7);
hours       = data_orig(:,8);
wages       = data_orig(:,9);


%% Detrend and demean
gdp_growth = log(gdp(2:end)) - log(gdp(1:end-1));
y_obs = gdp_growth - mean(gdp_growth);

consum_growth = log(consumption(2:end)) - log(consumption(1:end-1));
c_obs = consum_growth - mean(consum_growth);

invest_growth = log(investment(2:end)) - log(investment(1:end-1));
invest_obs = invest_growth - mean(invest_growth);

inflation = log(price_defl(2:end)) - log(price_defl(1:end-1));
pi_obs = inflation - mean(inflation);   

% Assuming that there is no trend in the federal funds rate, I just demean
% the series.
r_obs = fed_funds(2:end) - mean(fed_funds(2:end)); 

hours_growth = log(hours(2:end)) - log(hours(1:end-1));
n_obs = hours_growth - mean(hours_growth);

% Note that wage data are already quoted in real terms. So no normalizing by
% prices is required here.
wage_growth = log(wages(2:end)) - log(wages(1:end-1)); 
W_obs = wage_growth - mean(wage_growth);

% Here I use the same procedure to fit the observed data to the model that
% was used for the comparison of the simple model with the data.
debt_repurchase_obs = detrend(debt_rep(2:end));

% Save all variables in a .mat file that can be used by dynare for
% estimating the variables
save(path_output_data, 'y_obs', 'c_obs', 'invest_obs', 'pi_obs', 'r_obs', 'n_obs', ...
     'W_obs', 'debt_repurchase_obs')
