pacman::p_load(tidyverse, rvest, httr, devtools, webdriver,writexl)
url<-"https://www.investing.com/equities/bacanora-minerals-ltd-historical-data"
url%>%  
  GET()%>%
  http_status()


bacanora_table<-url%>%
  read_html()%>%
  html_node('#curr_table')%>%
  html_table()%>%
  tbl_df()

write_excel_csv2(bacanora_table, "Documents/tabla_scrapper.csv")
write_xlsx(x = bacanora_table, path = "Documents/tabla_scrapper.xlsx")
