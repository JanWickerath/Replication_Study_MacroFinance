
% path_original_data = project_paths('IN_DATA');
path_original_data = '../original_data/';

path_financial_accounts = strcat(path_original_data, ...
                                 'Financial_accounts_original.csv');
path_business_gdp = strcat(path_original_data, ...
                           'business_value_added_nipa_original.xls');

financial_accounts_original = csvread(path_financial_accounts, 6, 1);
corporate_equities = financial_accounts_original(:, 1);
corporate_dividends = financial_accounts_original(:, 2);
farm_dividends = financial_accounts_original(:, 3);
prop_invest = financial_accounts_original(:, 4);
corporate_debt = financial_accounts_original(:, 5);
corporate_capital_consumption = financial_accounts_original(:, 6);
noncorporate_capital_consumption = financial_accounts_original(:, 7);
capital_expenditures = financial_accounts_original(:, 8);
business_gdp = xlsread(path_business_gdp, 'Sheet0', 'C9:IV9')

% Equity Payout is calculated as net dividends farm and nonfarm sector minus
% net increase in corporate equitiesminus proprietors’ net investment and
% normalized by Business GDP times 10 (to meet scale in the paper).
equity_payout.full_sample = (corporate_dividends + farm_dividends - corporate_equities - prop_invest)

