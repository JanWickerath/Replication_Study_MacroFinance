% Print the Autoregressive matrix in a tex file so that it can be easily
% synced with the paper.

%% Path settings

% path_out_analysis = project_paths('OUT_ANALYSIS', 'shock_innovations.mat');
% path_out_table = project_paths('OUT_TABLES', 'ar_matrix.tex');
path_out_analysis = '../../bld/out/analysis/shock_innovations.mat';
% path_out_table = '../../bld/out/tables/shock_innovations.mat');
path_out_table = 'ar_matrix.tex';
%% Load variables from the shock creation script
load(path_out_analysis);

%% Print matrix to a latex table

fid = fopen(path_out_table, 'w');
fprintf(fid,'%12.4f & %12.4f \\\\ \r\n', ar_mat(1,:));
fprintf(fid,'%12.4f & %12.4f \\\\ \r\n', ar_mat(2,:));
fclose(fid);