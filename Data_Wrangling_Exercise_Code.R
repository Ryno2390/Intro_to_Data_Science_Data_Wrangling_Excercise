Data <- read.csv("refine_original.csv")

Data$company <- tolower(Data$company)

Data$Product.code...number <- as.character(Data$Product.code...number)
str(Data)

library(tidyr)
Data <- separate(Data, Product.code...number, c("Product.code", "Product.number"), sep = "-", remove = TRUE)