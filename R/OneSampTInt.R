TInterval <- function(n, xbar, s, c_level = 0.95)
{
  df <- n - 1
  
  t.crit <- qt((c_level + (1-c_level)/2), df)
  
  se <- s/sqrt(n)
    
  margin_of_error <- t.crit*se
  
  LCL_t <- xbar - margin_of_error
  
  UCL_t <- xbar + margin_of_error

  dat <- round(c(xbar, t.crit, se, LCL_t, UCL_t), 4)
  
  names(dat) <- c("Sample Mean", "T Critical", "Std Error", "LCL", "UCL")
  
  return(dat)
}

# Example usage:

TInterval(18, 103.5375, 4.78, 0.95)
