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
  #print(input)
  #logger("las col son:")
  #logger(names(input))
  output = summary(input)
  readr::write_file("Inicializando Rscript modelo.", "/tmp/capstone.html")
  readr::write_file("Dataset de entrada:", append = TRUE, "/tmp/capstone.html")
  input_hux <- 
    hux(input) %>% 
    add_colnames() %>% 
    set_bold(row = 1, col = everywhere, value = TRUE) %>% 
    set_all_borders(TRUE)
  print_screen(input_hux)
  
  kable_out <- knitr::kable(input, "html") %>% kableExtra::kable_styling(bootstrap_options = c("striped", "hover"))
  readr::write_file(kable_out, append = TRUE, "/tmp/capstone.html")
  readr::write_file("Finaliza", append = TRUE, "/tmp/capstone.html")
  
  
  
  return('/tmp/capstone.html')
}
