# x1 and n1
# X2 and n2
# c_level: Confidence Level   

TwoPropZInt <- function(X1, n1, X2, n2, c_level = 0.95)
{
  phat1 <- X1/n1
  
  phat2 <- X2/n2
  
  z.crit <- qnorm(c_level + (1-c_level)/2)
  
  se <- sqrt((phat1*(1 - phat1)/n1) + (phat2*(1 - phat2)/n2))
  
  margin_of_error <- z.crit*se
  
  LCL <- (phat1 - phat2) - margin_of_error
  
  UCL <- (phat1 - phat2) + margin_of_error
  
  dat <- round(c((phat1 - phat2), z.crit, se, margin_of_error, LCL, UCL), 4)
  
  names(dat) <- c("Difference of proportions", "Z Critical", "Std Error", "Margin of Error", "LCL", "UCL")
  
  return(dat) 
}

# Example usage:

TwoPropZInt(174, 300, 111, 300, 0.95)
