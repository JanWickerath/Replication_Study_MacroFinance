.. _analysis:

Analysis
========

The analysis consists of two parts. The construction of shocks in the
baseline model and the simulation and estimation of both models using dynare.

shock_construction.m
--------------------

The :file:`shock_construction.m` script loads data and parameter specifications
from the data management stage and calculates financial states and tfp states
from them. It then estimates the innovations to these states and stores all
those vectors in the :file:`shock_innovations.mat` file in the analysis output
folder.


Dynare files
------------

The simulation of the baseline model and the estimation of the extended model
is done using dynare. Since the dynare outputfiles cannot be easily guided I
create a separate subfolder in the analysis folder for them. Within this folder
I put the dynare model files :file:`baseline_model.mod` and
:file:`extended_model.mod` as well as the matlab scripts
:file:`run_baseline_model.m` and :file:`run_extended_model.m` that will run the
dynare model files and copy the necessary output file to the analysis output folder in
`bld`. Note that these scripts have to live in the same directory as the dynare
model files to work properly. Therefore I also added the `dynare_files` to the
project paths in the project roots wscript.

For the baseline model all the :file:`run_baseline_model.m` has to do is to run
dynare and copy the file :file:`baseline_model_results.mat` to the analysis
output folder.

To run the estimation of the extended model with dynare, the data that are used
for the estimation has to be in the same folder as the dynare model
file. Therefore the :file:`run_extended_model.m` first has to copy the data
that are prepared in the :file:`simulation_data_prep.m` file in the data
management section to the dynare files directory. Then it runs the extended
model with dynare. After that traceplots and autocorrelation graphs for the
Metropolis-Hastings draws are created. Note that dynare will clear the entire
workspace before it starts its actual work. This means that variables in the
run script defined before the dynare command are not available after dynare is
finished running. Hence the path settings for saving the output have to be
defined after the dynare command.


baseline_simulation.m
---------------------

The file :file:`baseline_simulation.m` simulates the baseline model with the
shock vectors obtained from :file:`shock_construction.m`. To do so it uses the
results (policy functions, steady state) from dynare, which are saved in the
:file:`baseline_model_results.mat` file. The simulated series for output, labor
hours, equity payouts and debt repurchases are saved for later use.


