#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
df <- data.frame(HairEyeColor)
write.csv(df,"People.csv")
print(df)

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
print("print Top Five rows")
data <- data.frame(HairEyeColor)
result = data[1:5,]
print(result)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")
library(dplyr)


#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)
print("Hair column")
hair <- read.csv("People.csv")
hair %>% select(Hair)

print("sex column")
sex  <- data.frame(HairEyeColor)
sex  %>% select(Sex)
#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
pple <- read.csv("People.csv")
df <- data.frame(Hair = c(pple %>% select(Hair)),Sex= c(pple %>% select(Sex)))
write.csv(df,"HairSex.csv")
df
#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)

print("deselecting sex column")
HairSex <- read.csv("HairSex.csv")
select(HairSex,-c(Sex))
#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'
print("Renaming sex column")
HairSex <- read.csv("HairSex.csv")
rename(HairSex, Gender=Sex)
#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
HairSex <- read.csv("HairSex.csv")
df <- rename(HairSex, Gender=Sex)
write.csv(df,"HairGender.csv")
print(df)
#Let's mak
#Let's 'filter' just the females from our dataset
#TASK: Write the function that includes only rows that are 'female'

HairGender <- read.csv("HairGender.csv")
HairGender %>% filter(Gender == "Male")
write.csv(HairGender,"Male.csv")
#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)
HairGender <- read.csv("HairGender.csv")
HairGender %>% group_by(Gender)

#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#TASK: After you run it, write the total here:____
data <- data.frame(HairEyeColor)
total=mutate(datasetname, total=cumsum(Freq))
total

#Since we have a females dataset, let's make a males dataset
#TASK: Write the function that includes only rows that are 'male'
HairGender <- read.csv("HairGender.csv")
HairGender %>% filter(Gender == "Female")
write.csv(HairGender,"Female.csv")

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
male <- read.csv("Male.csv")
female <- read.csv("Female.csv")
inner_join(male, female)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
data <- data.frame(HairEyeColor)
data %>% arrange(desc(Freq)) # arrange function
