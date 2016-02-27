.. _final:

Visualisation and results formatting
=====================================

Documentation of the code in **final**.


Financial flows plot
====================

:file:`debt_equity_figure.m` Replicate the figure of debt repurchases and
equity payouts with the newest data available. To do so I need to helpfiles:
:file:`recessiondates.mat` is a dataset that contains dates of
recessions. Since it is only used for plotting I decided to put in this
directory.
:file:`plot_NBER_recessions.m` plots grey bars for the recession periods.
      

Baseline model
==============

:file:`create_ar_matrix.m`: Print the Autoregressive matrix in a tex file so
that it can be easily synced with the paper.

:file:`plot_shocks.m` Plots the level of productivity and financial conditions
as well as their innovations as calculated in the shock construction script.

The file :file:`baseline_model_data_plot.m` creates a plot to compare the
simulated series for output, working hours, equity payout and debt repurchases
to its observed couterparts as done in figure 5 in the original paper.


Extended model
==============

:file:`table_3.m` Uses output from the extended model estimation to create an
update of table 3.
