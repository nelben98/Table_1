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


###################################################################
###################################################################

# Error required for this code: distinct usubjid
#test if number of rows equals to number of treatments
# warning if some treatments have 0 as the summary


###################################################################
###################################################################




Big_N_calcs<-
    function(
     ds_in #Dataset in
    ,iid            = quo(usubjid)
    ,by_group       = quo(trtan) #variable name - use the NUMERIC version
    ,by_group_char  = quo(trta)
    ,ds_out #Dataset out
    ){
      
      ds_out<-ds_in %>%
            count(!!by_group) 

    return(ds_out)       
      #test if number rows not equal to number distinct treatments
      #warning - some of the treatments (is 0)

    }

