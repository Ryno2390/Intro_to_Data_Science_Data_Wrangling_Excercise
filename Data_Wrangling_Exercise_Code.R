library(tidyr)
library(dplyr)

Data <- read.csv("refine_original.csv")
Data <- tbl_df(Data)

Data$company <- tolower(Data$company)
Data$company <- replace(Data$company, Data$company == "phillips", "philips")
Data$company <- replace(Data$company, Data$company == "phllips", "philips")
Data$company <- replace(Data$company, Data$company == "phillps", "philips")
Data$company <- replace(Data$company, Data$company == "fillips", "philips")
Data$company <- replace(Data$company, Data$company == "phlips", "philips")
Data$company <- replace(Data$company, Data$company == "akz0", "akzo")
Data$company <- replace(Data$company, Data$company == "ak zo", "akzo")
Data$company <- replace(Data$company, Data$company == "unilver", "unilever")

Data$Product.code...number <- as.character(Data$Product.code...number)

Data <- separate(Data, Product.code...number, c("Product.code", "Product.number"), sep = "-", remove = TRUE)

Product.category <- c("p" = "Smartphone", "v" = "TV", "x" = "Laptop", "q" = "Tablet")
Data$Product.category <- Product.category[Data$Product.code]

Data <- mutate(Data, full_address = paste(address, city, country, sep = ", "))
Data