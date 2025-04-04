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

# Error required for this code: distinct usubjid
# Error if some of the variables are missing in the dataset 
#    - 'Empty' is ok, but they  cannot be found is Error
# Test if number of rows equals to number of treatments
# Warning if some treatments have 0 as the summary


###################################################################
###################################################################


# Please add the Libraries used and the code description
# Example input - output

Big_N_calcs<-
    function(
     ds_in #Dataset in
    ,iid            = quo(usubjid)
    ,by_group       = trtan #variable name - use the NUMERIC version
    ,by_group_char  = trta
    ,ds_out #Dataset out
    ){
      # add quotations to use in dplyr:
      # Dtaset summary
      ds_out<-ds_in %>%
            count( {{by_group}})
      
      unique_chars<-
          ds_in %>%
          select({{by_group}}, {{by_group_char}}) %>%
          distinct()
            
      ds_out_char<-
        ds_out%>%
        left_join(unique_chars
                 ,by = join_by({{by_group}}== {{by_group}}))%>%
        select({{by_group}},{{by_group_char}},Big_N = n) #neat order

    return(ds_out_char)       
    }


####
#  This area to test function:

out<-Big_N_calcs(ds_in = ex_baseline2, ds_out=output)


out 
