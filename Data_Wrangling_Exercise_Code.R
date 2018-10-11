Data <- read.csv("refine_original.csv")

Data$company <- tolower(Data$company)

Data$Product.code...number <- as.character(Data$Product.code...number)

library(tidyr)
Data <- separate(Data, Product.code...number, c("Product.code", "Product.number"), sep = "-", remove = TRUE)

Product.category <- c("p" = "Smartphone", "v" = "TV", "x" = "Laptop", "q" = "Tablet")
Data$Product.category <- Product.category[Data$Product.code]