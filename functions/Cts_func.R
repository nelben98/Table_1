###################################################################
###################################################################

#     888  e88~-_  ~~~888~~~ 888   | 
#     888 d888   \    888    888   | 
#     888 8888        888    888   | 
#     888 8888        888    888   | 
#     888 Y888   /    888    Y88   | 
#     888  "88_-~     888     "8__/  

###################################################################
###################################################################
# Purpose
# requirements
# input
# Author + Date

###################################################################
###################################################################


# ERRORS TO BE ADDED:



###################################################################
###################################################################

library(tidyverse) #first load tidyverse then filter through:

continuous_block<- function(
                       ds_in #Dataset in
                      ,by_group       = trtan #variable name - use the NUMERIC version
                      ,by_group_char  = trta
                      ,dps = 1
                      ,statistics = c('n','Mean','SD','Median','IQR','MinMax')
                      ,ds_out #Dataset out
                      ){
  
  Big_N_calcs(ds_in
             ,by_group
             ,by_group_char)
  
  ds_in |> 
    group_by({{by_group}}) |>
    summarise(
      mean = mean({{ expr }}),
      sum = sum({{ expr }}),
      n = n()
    )
          
  
  
}
  
  
  
  
  

