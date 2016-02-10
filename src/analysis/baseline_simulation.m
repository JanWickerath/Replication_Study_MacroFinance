%initialize IRF generation
initial_condition_states = repmat(oo_.dr.ys,1,M_.maximum_lag);

% figure('Name','Figure 6: Impulse Responses')
%         plot(y_sim)
shck = load('../../../../output/shocks_repl.mat');
shock_matrix = horzcat(shck.tfp_resid, shck.fin_resid);

% Import the updated shock series,
shck_update = load('../../../../output/shocks_update.mat');
shock_matrix_update = horzcat(shck_update.tfp_busgdp_resid, shck_update.fin_busgdp_resid);

% Simulate with original innovation processes
y2 = simult_(initial_condition_states,oo_.dr,shock_matrix,1);
%y_IRF = y2(:,M_.maximum_lag+1:end)-repmat(oo_.dr.ys,1,options_.irf); %deviation from steady state

y3 = simult_(initial_condition_states,oo_.dr,horzcat(shck.tfp_resid, ...
                                                  zeros(length(shck ...
                                                  .fin_resid),1)),1);

y4 = simult_(initial_condition_states,oo_.dr, ...
             horzcat(zeros(length(shck.tfp_resid),1), shck.fin_resid),1);

% Simulate with updated simulation processes
y5 = simult_(initial_condition_states,oo_.dr,shock_matrix_update,1);
y6 = simult_(initial_condition_states,oo_.dr, ... 
             horzcat(shck_update.tfp_busgdp_resid, ... 
                     zeros(length(shck_update.fin_busgdp_resid),1)),1);
y7 = simult_(initial_condition_states,oo_.dr, ...
             horzcat(zeros(length(shck_update.fin_busgdp_resid),1), ... 
                     shck_update.fin_busgdp_resid),1);


% c_sim = y2(strmatch('c',M_.endo_names, 'exact'),:);
% n_sim = y2(strmatch('n',M_.endo_names, 'exact'),:);
% w_sim = y2(strmatch('w',M_.endo_names, 'exact'),:);
% k_sim = y2(strmatch('k',M_.endo_names, 'exact'),:);
% R_sim = y2(strmatch('R',M_.endo_names, 'exact'),:);
% r_sim = y2(strmatch('r',M_.endo_names, 'exact'),:);
% d_sim = y2(strmatch('d',M_.endo_names, 'exact'),:);
% b_sim = y2(strmatch('b',M_.endo_names, 'exact'),:);
% mu_sim = y2(strmatch('mu',M_.endo_names, 'exact'),:);
% v_sim = y2(strmatch('v',M_.endo_names, 'exact'),:);
% z_sim = y2(strmatch('z',M_.endo_names, 'exact'),:);
% xi_sim = y2(strmatch('xi',M_.endo_names, 'exact'),:);
% y_sim = y2(strmatch('y',M_.endo_names, 'exact'),:);
% inv_sim = y2(strmatch('inv',M_.endo_names, 'exact'),:);
% yhat_sim = y2(strmatch('yhat',M_.endo_names, 'exact'), :);
% chat_sim = y2(strmatch('chat',M_.endo_names, 'exact'),:); 
% ihat_sim = y2(strmatch('ihat',M_.endo_names, 'exact'),:); 
% nhat_sim = y2(strmatch('nhat',M_.endo_names, 'exact'),:); 
% byhat_sim = y2(strmatch('byhat',M_.endo_names, 'exact'),:); 
% dyhat_sim = y2(strmatch('dyhat',M_.endo_names, 'exact'),:) - ...
%             oo_.dr.ys(strmatch('dyhat',M_.endo_names, 'exact'));
% muhat_sim = y2(strmatch('muhat',M_.endo_names, 'exact'),:); 
% vyhat_sim = y2(strmatch('vyhat',M_.endo_names, 'exact'),:); 

% % csvwrite('../simulated.csv',yhat_sim');
% save('../../../../output/simul_all', 'yhat_sim', 'nhat_sim', 'byhat_sim', 'dyhat_sim');
% yhat_tfp_sim = y3(strmatch('yhat',M_.endo_names, 'exact'),:);
% nhat_tfp_sim = y3(strmatch('nhat',M_.endo_names, 'exact'),:);
% byhat_tfp_sim = y3(strmatch('byhat',M_.endo_names, 'exact'),:);
% dyhat_tfp_sim = y3(strmatch('dyhat',M_.endo_names, 'exact'),:) - ...
%                 oo_.dr.ys(strmatch('dyhat',M_.endo_names, 'exact'));
% save('../../../../output/simul_tfp', 'yhat_tfp_sim', 'nhat_tfp_sim', 'byhat_tfp_sim', 'dyhat_tfp_sim');
% yhat_fin_sim = y4(strmatch('yhat',M_.endo_names, 'exact'),:);
% nhat_fin_sim = y4(strmatch('nhat',M_.endo_names, 'exact'),:);
% byhat_fin_sim = y4(strmatch('byhat',M_.endo_names, 'exact'),:);
% dyhat_fin_sim = y4(strmatch('dyhat',M_.endo_names, 'exact'),:) - ... 
%                 oo_.dr.ys(strmatch('dyhat',M_.endo_names, 'exact'));
% save('../../../../output/simul_fin', 'yhat_fin_sim', 'nhat_fin_sim', 'byhat_fin_sim', 'dyhat_fin_sim');
% yhat_sim_update = y5(strmatch('yhat',M_.endo_names, 'exact'),:);
% nhat_sim_update = y5(strmatch('nhat',M_.endo_names, 'exact'),:);
% byhat_sim_update = y5(strmatch('byhat',M_.endo_names, 'exact'),:);
% dyhat_sim_update = y5(strmatch('dyhat',M_.endo_names, 'exact'),:) - ... 
%                    oo_.dr.ys(strmatch('dyhat',M_.endo_names, 'exact'));
% save('../../../../output/simul_all_update', 'yhat_sim_update', 'nhat_sim_update', 'byhat_sim_update', 'dyhat_sim_update');
% yhat_tfp_sim_update = y6(strmatch('yhat',M_.endo_names, 'exact'),:);
% nhat_tfp_sim_update = y6(strmatch('nhat',M_.endo_names, 'exact'),:);
% byhat_tfp_sim_update = y6(strmatch('byhat',M_.endo_names, 'exact'),:);
% dyhat_tfp_sim_update = y6(strmatch('dyhat',M_.endo_names, 'exact'),:) - ...
%                        oo_.dr.ys(strmatch('dyhat',M_.endo_names, 'exact'));
% save('../../../../output/simul_tfp_update', 'yhat_tfp_sim_update', 'nhat_tfp_sim_update', 'byhat_tfp_sim_update', 'dyhat_tfp_sim_update');
% yhat_fin_sim_update = y7(strmatch('yhat',M_.endo_names, 'exact'),:);
% nhat_fin_sim_update = y7(strmatch('nhat',M_.endo_names, 'exact'),:);
% byhat_fin_sim_update = y7(strmatch('byhat',M_.endo_names, 'exact'),:);
% dyhat_fin_sim_update = y7(strmatch('dyhat',M_.endo_names, 'exact'),:) - ...
%                        oo_.dr.ys(strmatch('dyhat',M_.endo_names, 'exact'));
% save('../../../../output/simul_fin_update', 'yhat_fin_sim_update', 'nhat_fin_sim_update', 'byhat_fin_sim_update', 'dyhat_fin_sim_update');
% % figure('Name','Figure 6: Impulse Responses')
% %         plot(y_sim);
% % 	y_lim = ([-14 8]);
