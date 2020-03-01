# myfile.R
#* Print to log
#* @filter logger
logger = function(req){
  
  cat("\n", as.character(Sys.time()), 
      "\n", req$REQUEST_METHOD, req$PATH_INFO, 
      "\n", req$HTTP_USER_AGENT, "@", req$REMOTE_ADDR)
  
  plumber::forward()
  
}

#* @param txt A string value, the text to categorise.
#* @get /textcat
#* @description Perform language categorisation
guessLanguage = function(txt) {
  
  input = txt
  
  output = textcat(txt)
  
  cat(
    "\n   Input: ", input,
    "\n   Most likely: ", output
  )
  
  return(output)
  
}


#* @get /mean
normalMean <- function(samples=10){
  data <- rnorm(samples)
  mean(data)
}

#* @post /sum
addTwo <- function(a, b){
  as.numeric(a) + as.numeric(b)
}
