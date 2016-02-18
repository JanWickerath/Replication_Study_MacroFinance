% Use output from the extended model estimation to create an update of table
% 3.

%% Path settings
% path_out_analysis = project_paths('OUT_ANALYSIS', ...
%                                   'extended_model_results.mat');
path_out_analysis = '../../bld/out/analysis/extended_model_results.mat';

%% Load results
load(path_out_analysis);

%% Table of calibrated parameters

% Create list of names for calibrated parameters in the order they shall
% appear in the final table.
cal_par = {'betta ',
           'tau   ',
           'alppha',
           'theta ',
           'delta ',
           'xi_bar',
           'G_bar '};

fid = fopen('cal_params.tex', 'w');

for idx = 1:length(cal_par)
    param = cal_par(idx,:);
    long_name = M_.param_names_long(strmatch(param, M_.param_names, ...
                                             'exact'),:);
    tex_name = M_.param_names_tex(strmatch(param, M_.param_names, 'exact'),: ...
                                  );
    par_val = M_.params(strmatch(param, M_.param_names, 'exact'),:);
    
    fprintf(fid, '%s, $%s$ & %.3f \\\\ \r\n', long_name, tex_name, par_val);
end

fclose(fid);

% %% Table of estimated parameters

% fid = fopen(path_out_table, 'w');
% fprintf(fid,'%12.4f & %12.4f \\\\ \r\n', ar_mat(1,:));
% fprintf(fid,'%12.4f & %12.4f \\\\ \r\n', ar_mat(2,:));
% fclose(fid);