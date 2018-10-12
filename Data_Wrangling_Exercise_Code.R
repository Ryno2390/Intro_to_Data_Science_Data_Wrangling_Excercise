library(tidyr)
library(dplyr)

Data <- read.csv("refine_original.csv")

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

company_philips <- replace(Data$company, Data$company == "philips", 1)
company_philips <- replace(company_philips, company_philips != 1, 0)
Data$company_philips <- company_philips

company_akzo <- replace(Data$company, Data$company == "akzo", 1)
company_akzo <- replace(company_akzo, company_akzo != 1, 0)
Data$company_akzo <- company_akzo

company_van_houten <- replace(Data$company, Data$company == "van houten", 1)
company_van_houten <- replace(company_van_houten, company_van_houten != 1, 0)
Data$company_van_houten <- company_van_houten

company_unilever <- replace(Data$company, Data$company == "unilever", 1)
company_unilever <- replace(company_unilever, company_unilever != 1, 0)
Data$company_unilever <- company_unilever

product_smartphone <- replace(Data$Product.category, Data$Product.category == "Smartphone", 1)
product_smartphone <- replace(product_smartphone, product_smartphone != 1, 0)
Data$product_smartphone <- product_smartphone

product_tv <- replace(Data$Product.category, Data$Product.category == "TV", 1)
product_tv <- replace(product_tv, product_tv != 1, 0)
Data$product_tv <- product_tv

product_laptop <- replace(Data$Product.category, Data$Product.category == "Laptop", 1)
product_laptop <- replace(product_laptop, product_laptop != 1, 0)
Data$product_laptop <- product_laptop

product_tablet <- replace(Data$Product.category, Data$Product.category == "Tablet", 1)
product_tablet <- replace(product_tablet, product_tablet != 1, 0)
Data$product_tablet <- product_tablet

Data