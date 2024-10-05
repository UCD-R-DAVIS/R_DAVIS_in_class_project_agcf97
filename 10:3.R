#working directory and file paths ----
getwd()
"/Users/christianfuentes/Desktop/R_Studio/R_DAVIS_in_class_project_agcf97.git/R_DAVIS_in_class_project_agcf97"
setwd()


d <- read.csv("./data/tail_length.csv")
#dir.create("./Homework")
#code and Data Organization

#Best Practices

#How R Thinks About Data----
weight_g <- c(50,60,65,82)
weight_one_value <- c(50)
animals <- c("mouse", "rat", "dog")
#Vectors

### Inspection -----
length(weight_g)
str(weight_g)





#Treat raw data as read only
#Treat raw data output

### Change Vectors ----
weight_g <- c(weight_g,90)
weight_g
num_char <- c(1, 2, 3, "a") # chooses lowest common denominator 
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")



##subsetting ----
animals <- c("mouse", "rat", "dog", "cat")
animals
animals[2]
animals[c(2,3)]

### Conditional subsetting ----

weight_g <- c(21, 34, 39, 54, 55)
weight_g > 50
weight_g[weight_g > 50]
j

### Symbols 
#%in%
animals
animals %in% c("rat", "cat", "dog", "duck", "goat")
#seeing if it exists in other vector
#%in% within a bucket
# == pairwise matching -- ORDER MATTERS

