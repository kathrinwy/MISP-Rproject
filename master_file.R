

# Demographic indicators ------------------------------------------------------------------------

####---------------------------------------------------------------------------------------------
####
####    Decision-tree:
####
####    1. Iteration: COD-PS (lowest AB available)
####            -> 2. Iteration: HH survey/wpp estimate (AB1)
####                      -> 3. Iteration: wPP (AB0)
####
####---------------------------------------------------------------------------------------------

# 1. Iteration 

# The preferred data source for interventions in humanitarian settings is the COD-PS

source("COD_collector.R")
# loops through HDX online and finds all datasets with available age/sex disaggregation available
# saves the files in "./uniform/"

source("COD_extract.R")
# calculates number of people and percentage of women of reproductive age at lowest disaggregation level
# available (only a matter of filtering the data and combining 0-4, ... 45-49 to WRA)


# 2. Iteration

# If no COS-PS is availalbe, the next best solution is to combine WPP
# and the latest available household survey in order to estimate ADMIN level 1 disaggregations

source("survey_collector.R")
# Loops through DHS website, and through the MICS survey catalogue (Excel file that has to be downloaded)
# to find latest household survey, discards surveys older than 10 years 
# ! only run once in a while as it runs roughly 10 hours

source("survey_hh_extract_dhs.R")
source("survey_hh_extract_mics.R")
# Downloads the relevant household members dataset and estimates percentages 
# per 5 year age groups and region (i. e. % of 0-4 living in region 1, etc.)
# add column of percentage of women of reproductive age in region 1

source("wpp1.R")
# downloads datafile for men and women for total populations by age (single year age groups)
# and combines 'estimates' and 'medium' projections in one sheet to include years beyond 2015
# extracts national population per 5 year age groups and sex for the year
# that matches the latest household survey

source("combine_wpp_survey.R")
# multiply outcome of survey_extract with wpp_extract to obtain  
# total population by Admin level 1


# 3. Iteration

source("wpp2.R")
# Extracts 1 year age groups by sex, for current year

# Fertiltiy indicators --------------------------------------------------------------------------

####---------------------------------------------------------------------------------------------
####
####    Decision-tree:
####
####    1. Iteration: Latest household survey (AB1)
####                 ->  2. Iteration: World population prospect (AB0)
####
####---------------------------------------------------------------------------------------------

# 1. Iteration

source("survey_wm_extract.R")
# loads women questionnaire files 
# extracts the crude birth rate (cbr) by AB1

# 2. Iteration
source("wpp_cbr.R")
# loads crude birth rate (cbr) 

source("wcu_cbr_extract.R")
# extract crude birth (cbr) by country


# Family planning indicators --------------------------------------------------------------------

####---------------------------------------------------------------------------------------------
####
####    Decision-tree:
####
####    1. Iteration: Latest household survey (AB1)
####                 ->  2. Iteration: World contraceptive use (AB0)
####
####---------------------------------------------------------------------------------------------

# 1. Iteration

source("survey_wm_extract.R")
# loads women questionnaire files 
# extract: use of modern contraceptives, and method mix (AB1)
# contains an if statement that filters for dhs (including mis) or mics

# 2. Iteration
source("wcu_collector.R")
# loads world contraceptive use 

source("wcu_extract.R")
# extract modern contraceptive use by country for the current years


# Combine output --------------------------------------------------------------------------------

source("combine_add_export.R")
# Combines output and 
# adds other default parameters, both for variables for which no data is available and certain 
# indicators out of our competence
# add resulting table to exsiting data file that includes template








