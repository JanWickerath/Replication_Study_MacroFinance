.. _analysis:

The simulation of the baseline model and the estimation of the extended model
is done using dynare. Since the dynare outputfiles cannot be easily guided I
create a separate subfolder in the analysis folder for them. Within this folder
I put the dynare model files :file:`baseline_model.mod` and
:file:`extended_model.mod` as well as the matlab scripts
:file:`run_baseline_model.m` and :file:`run_extended_model.m` that will run the
dynare model files and copy the necessary output file, for the baseline model
that is :file:`baseline_model_results.mat`, to the analysis output folder in
`bld`. Note that these scripts have to live in the same directory as the dynare
model files to work properly. Therefore I also added the `dynare_files` to the
project paths in the project roots wscript.
