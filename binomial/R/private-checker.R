# title: Check probability function
# description: to test if an input prob is a valid probability value (i.e. 0 ??? p ??? 1).
# param: prob
# return: with valid value of prob, it will return TRUE,if invalid, it will stop with error message.

check_prob <- function(prob){
  if(length(prob) != 1){
    stop("p is length of 1")
  }else if(!is.numeric(prob)){
    stop("p has to be numeric")
  }else if(prob<0 | prob >1){
    stop("p has to be a number betwen 0 and 1")
  }else{
          return(TRUE)
    }
}

# title: Check trials function
# description:  to test if an input trials is a valid value for number of trials
# param: trials
# return: with valid trials, return TRUE,else stop with error message.
check_trials <- function(trials){
  if(length(trials) != 1){
    stop("trials is length of 1")
  }else if(trials != round(trials) | trials < 0){
    stop("invalid trials value, trials must be an integer greater than or equal to 0")
  }else{
   return(TRUE)
  }
}

# title: Success function
# description: to test if an input success is a valid value for number of successes (i.e. 0 ??? k ??? n)
# param: success, tirals
# return: with valid success, return TRUE, else stop with error message

check_success <- function(success,trials){

  if(sum(success !=round(success)) >0 | sum(success < 0)>0){
    stop("invalid success valuse")
  }else if(trials != round(trials) | trials < 0 ){
    stop("invalid trials input")
  }else if(sum(success > trials)>0){
    stop("success cannot be greater than trials")
  }else{
    return(TRUE)
  }

}





