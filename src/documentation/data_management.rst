.. _data_management:

Data management
===============

The data management part consists of three parts. The first prepares updated
data from the original data sources. The second uses the original dataset
provided by Jerman and Quadrini and prepares it for the estimation of the
extended model. The third one is not really a data management part. It defines
a set of parameters and and loads them to a matlab ``.mat`` data structure.

prepare_data.m
--------------

The **prepare_data.m** script reads in the data from the original data files
and prepares them for use across differents modules of this project.

Equity payout and debt repurchase are calculated for the full sample. Detrended
equity payouts and debt repurchases are calculated only for the analysis
subsample. Capital, debt and output are calculated for the whole
sample. Log-detrended versions of the same variables are calculated only for
the analysis subsample. Working hours are saved in the original version as well
as log-detrended for the analysis subsample.

simulation_data_prep.m
----------------------

The **simulation_data_prep.m** script reads in the data from the Excel data
sheet provided by Jerman and Quadrini and computes variables log differences
and demeans them for output, consumption, investment, price deflator, working
hours and wage growths. It just demeans the interest rate and detrends debt
repurchases.

All constructed variables are stored in a ``.mat`` datafile that can be read by dynare.

parameter.m
-----------

The **parameter.m** script initializes a set of parameters and saves them in a
``.mat`` datafile, so that they can be used later. This is not, strictly
speaking, a data management task. An alternative way would be to store the
parameters in a accessible file format, e.g. a plain text file or a JSon file,
and call this file whenever it is needed. However, since loading ``.mat`` files
is the most efficient way of loading data in matlab I use this approach.


