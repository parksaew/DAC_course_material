### Practice Problems: Session 1


##Problem 1

#1. Load the civil war dataset.

civilwar <- read.csv("fearon03.csv")

#2. Select 3 numerical variables of interest. Create a data frame with just those three variables along 
#with the variables “country” and “year.”

cw_sel <- civilwar[ , c("country", "year", "war", "pop", "gdppc")] #can be other columns too


#3. Of those three variables that you selected, find their means, medians, maximums, and minimums.

summary(cw_sel)
#or
summary(cw_sel$pop) #same for other variables
#or
mean(cw_sel$pop, na.rm = T) #same for max, min and other variables


#####

##Problem 2

#1. Using the data frame you created above, create a new data frame that only contains observations from
#Argentina, Chile, Paraguay, and Uruguay. Calculate the averages of those three variables that you
#selected.

cw_sel2 <- cw_sel[cw_sel$country %in% c("ARGENTINA",
                                        "CHILE",
                                        "PARAGUAY",
                                        "URUGUAY"), ]

mean(cw_sel2$war)
mean(cw_sel2$pop, na.rm = T)
mean(cw_sel2$gdppc, na.rm = T)


#2. Select one of the three variables and calculate its average separately for Argentina and Chile. What is
#the difference in the two means?

arg <- mean(cw_sel2[cw_sel2$country == "ARGENTINA", ]$gdppc, na.rm = T)
chi <- mean(cw_sel2[cw_sel2$country == "CHILE", ]$gdppc, na.rm = T)

arg - chi

#####

##Problem 3

#1. Using the original data, create a “dummy” variable for observations where the value is 1 if the country
#is located in Sub-Saharan Africa and 0 otherwise.
civilwar$africa <- ifelse(civilwar$region == "sub-saharan africa", 1, 0)


#2. Then create a data frame with only those observations from Sub-Saharan Africa. How many observations
#are there?

cw_africa <- civilwar[civilwar$africa == 1, ]
#or
cw_africa <- civilwar[civilwar$region == "sub-saharan africa", ]

nrow(cw_africa)

#3. Bonus: Can you create a dataframe for only oil-exporting countries in Sub-Saharan Africa? What is
#the median GDP per capita in these countries? How does this compare with all of the countries in
#Sub-Saharan Africa?

cw_africa_oil <- cw_africa[cw_africa$oil == 1, ]

median(cw_africa$gdppc, na.rm = T)
median(cw_africa_oil$gdppc, na.rm = T)
