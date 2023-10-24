install.packages(rvest)
install.packages(tidyr)
library(rvest) 
library(tidyr)

# Read the HTML content of the website 
webpage <- read_html("https://electionresults.sos.mn.gov/Results/Index?ersElectionId=156&scenario=ResultsByPrecinctCrosstab&OfficeInElectionId=33119&QuestionId=0") 

# Select the table using CSS selector 
table_node <- html_nodes(webpage, "table") 

# Extract the table content 
table_content <- html_table(table_node)[[3]] 

table_real <- separate(table_content,1, into=c("County", "Precinct"), sep = ": ")

  
# Print the table 
head(table_content)
