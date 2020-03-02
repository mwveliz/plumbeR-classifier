# print to to log
#logger = function(msg){
#  cat("\t", as.character(Sys.time()), 
#      "\t", msg)
#}

#* @param df matrix of numeric energies weekly (double).
#* @post /clasificar
#* @description Clasifica clientes
clasifica_clientes = function(req) {
  input = jsonlite::fromJSON(req$postBody)
  print(input)
  #logger("las col son:")
  #logger(names(input))
  output = summary(input)
  print("Dataset de entrada:")
  input_hux <- 
    hux(input) %>% 
    add_colnames() %>% 
    set_bold(row = 1, col = everywhere, value = TRUE) %>% 
    set_all_borders(TRUE)
  print_screen(input_hux)

  return(output)
}
