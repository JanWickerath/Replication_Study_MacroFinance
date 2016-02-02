% Read in the data from the original data files and prepare them for use
% across differents modules of this project.

%% Equity payout and debt repurchase

% Equity Payout is calculated as net dividends farm and nonfarm sector minus
% net increase in corporate equitiesminus proprietors’ net investment and
% normalized by Business GDP times 10 (to meet scale in the paper).

% Debt Repurchase is the negative of net increase in debt, normalized by
% Business GDP times 10.

% Cyclical components for debt and equity for the subset from 1984 to 2015
% received from band pass filtering the original data on that subperiod.

% Calculate linearly detrended series for equity payout and debt repurchase
% from 1984 onwards as they are used for comparing both model simulations to
% the data.

%% Capital

% Capital construction for the whole sample. 

% Find initial value for capital such that there is no trend in the ratio of
% capital to real business gdp over the entire sample.

% Calculate proportional deviations of capital via log differencing and
% demeaning for the 1984-2015 subsample. Note that here the trend is not
% necessarily zero, so a difference between linearly detrending and
% demeaning might exist.

%% Debt

% Debt construction for the whole sample

% Calculate proportional deviations of debt by the same procedure described
% for capital.

%% Output

% Real business value added calculated for whole sample by dividing the series
% for business value added by the business price index.

% Proportional deviations as described above

% Real total gdp for the entire sample.

% Proportional deviations for subsample as above.

%% Working hours

% Import working hours for whole sample

% Proportional deviations for subsample as above