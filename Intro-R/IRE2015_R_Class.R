#
#                                       ____________________________
#                                      !\_________________________/!\
#                                      !!                         !! \
#                                      !!C:\> GETTING STARTED     !!  \
#                                      !!         WITH R          !!  !
#                                      !!           ie            !!  !
#                                      !!     HOW TO OVERCOME     !!  !
#                                      !!        YOUR FEAR        !!  !
#                                      !!            &            !!  !
#                                      !!     LEARN TO LOVE R     !!  /
#                                      !!_________________________!! /
#                                      !/_________________________\!/
#                                       __\_________________/__/!_  )
#                                       !_______________________!/   )
#                                       |________________________|  (__
#                                       /oooo  oooo  oooo  oooo /!   _  )_
#                                     /ooooooooooooooooooooooo/ /  (_)_(_)
#                                    /ooooooooooooooooooooooo/ /    (o o)
#                                   /o=_____________________/_/    ==\o/==


#Notes from hands-on R class, June 5, 2015
#IRE 2015, Philadelphia, PA
#Ryann Grochowski Jones, ryann.jones@propublica.org
#Coulter Jones, cjones@medpagetoday.com
#Annie Waldman, annie.waldman@propublica.org

#This file contains all the code shown at our hands-on session, plus some extras. This file is based on the excellent R primer Annie created for her NICAR2015 R classes!


#TIME TO GET COMFORTABLE WITH R!

#R has a bit of a learning curve but once you get used to it, you’re off to the races. Keep in mind you will get a ton of errors while you’re learning R — in fact, you’ll still deal with errors even if you’re a master user! Google is your friend — copy and paste the error into Google and see what others have written.

#PRO TIP: R is VERY VERY VERY case-sensitive. A misplaced capital letter or double-quote where there should be a single-quote might just be the culprit to your error.

#And don’t forget — save EVERYTHING! RStudio allows you to save your data, your scripts, your history, your entire RStudio workspace — save it all and save often.

#RStudio is a great interface to the R language. The interface has 4 panes. You’ll do your coding in the Console (lower left, looks like Terminal/command line). The Environment and History (upper left) panes keep track of all your data and commands. The Source pane is on the upper right and displays your data tables. The lower left pane does a bunch of stuff — holds files, displays the graphs you’ve made, shows the packages you have installed, and more.

#Perhaps the most important tab of that lower right pane is Help. R has two help functions. Forget what an average or mean is? Try this.

?mean
or
help(mean)

#OTHER PLACES TO GET HELP!

#Annie put together this list, and it’s awesome. I personally can recommend Using R for Intro Stats and the Princeton guide.

#The main R site: http://cran.r-project.org/
#This has everything from guides to R updates. It also has a comprehensive list of packages and lots
#of great tips on how to use R. 

#Official R Language Definition: http://cran.r-project.org/doc/manuals/r-release/R-lang.html

#An In-Depth Introduction to R: http://cran.r-project.org/doc/contrib/usingR.pdf

#Using R for Intro Stats: http://cran.r-project.org/doc/contrib/Verzani-SimpleR.pdf

#Quick R: http://www.statmethods.net/

#R Documentation Search: http://www.rdocumentation.org/

#R-bloggers: find out awesome things people are doing with R http://www.r-bloggers.com/

#Coursera Course on R: https://www.coursera.org/course/rprog

#Princeton Guide to R: http://libguides.princeton.edu/dss/R

#UCLA Guide to R: http://www.ats.ucla.edu/stat/r/sk/books_usingr.htm

#Stack overflow: http://stackoverflow.com/


#NOW LET’S CODE!
#Annie does a great job explaining the different elements of R, so read on. You will recognize many of these basic functions from the class — be sure to try out some of the others that we didn’t get to include!

#R has multiple named data structures and elements:

####Object: most basic element, includes variables, data, functions you make, results, etc, are kept in the active memory of your computer as objects -- you can find them in your workspace ("Environment" pane)

#What does an object look like?
#In R, everything is an object. So whatever you assign to a vector, a data frame, a function, those are all objects.

#The best method to get the internal structure of an object is str():
?str

#Creating some data types
#Remember you can use <- or = to assign values.
x = c(1,2,3)
y = c("a","b","c")
str(x)
str(y)


objects()
#or
ls()

#will print out all of your objects.

rm(x)
#will remove those objects in your workspace. In the case above, this will remove the object named x.


####Class: Of course, there are different types of objects in R, and each object has a class.

class(x)
class(y)

#There are many kinds of classes:
#"character"
#"complex"
#"double"
#"expression"
#"integer"
#"list"
#"logical"
#"numeric"
#"single"
#"raw"


###Vector: simplest type of data structure, just an ordered collection of objects.

#assigning a to a set of numbers with function c():
?c

a = c(10,20,30,40,50) 
a

#assigning b to a set of numbers with function c()
b =  c(2,3,6,8,10) 
b


#You can also do basic math with vectors:
c = 2*a + 3 - b
c


#Can also apply some simple mathematical functions to vectors:
# maximum:
max(c) 

# minimum:
min(c) 

# length of the vector in values:
range(c)

#number of elements:
length(c) 

#sum all the elements:
sum(c) 

#product of all the elements:
prod(c) 

#gives you the average:
mean(c) 

#gives you the median
median(c) 

#sorts the data in increasing order ***more on sorting down below
sort(c) 

#Generating sequences can also be an important part of working with R.
#This generates a sequence between 1 and 30:
1:30 

seq(1:30) 
#gives you the same thing:

seq(from=1, to=30) 
#also gives you the same thing.

#you can also tell it what the increment should be:
seq(from=1, to=30, by=2) 

#this gives you a sequence based on length:
seq(from=1, by=3, length=30) 

#You can also generate sequences with repeated objects.
#repeating elements 1-5 over and over again:
rep(a, times=4) 

#repeating elements in a row:
rep(a, each=6) 

###Vectors with characters:
#You can build vectors not only with numbers but strings or characters as well using the double or single matched quotes. 

a = c("this","is", "a", "character", "vector", "!")
a


#Vectors are "atomic" structures, meaning that they all have the same mode or type (numeric, complex, logical, character, etc...). The only exception is NA.
#Try some out:
x = c(T, F, "hello", 2)
str(x)

y = c(T,F,F,T,T)
str(y)

z = c(1,2,3,4,5)
str(z)

w = c(1i,2,3,4,5)
str(w)


###Other data structures:
#Matrices or Arrays: multi-dimensional vectors.
?matrix
matrix(c(1, 2, 3, 4, 5), nrow=3, ncol=5) 
matrix(c(1, 2, 3, 4, 5), nrow=5, ncol=3) 

#Factors: this should be used for categorical data.
factor(1:20, labels = "category_")

#Lists: vector where the data need not be the same mode (not atomic)
?list
x = list(1, "two", T, 3i)
x
str(x)

#Data frames: your basic table. One row per observational unit.
?data.frame
new_df = as.data.frame(matrix(c(1, 2, 3, 4, 5), nrow=3, ncol=5))
?as.data.frame
View(new_df)

#Let’s expand the idea of data frames by working with some REAL data. Time to import a data file!
#Here’s some basic info, with more details on how to read data that’s not in a CSV file:

#First things first, you have to set the working directory to tell your program where your main folder
#is with all your data (csv, xls, dat, scripts, project files, etc...)

setwd("~/FOLDER/NICAR_R") #If you don't know the path, find the folder in the files pane. Then
#go to dropdown Session > Set Working Directory > To Files Pane Location. This will also show you the path.

#You can check your working directory if you think you're in the wrong place:
getwd()

setwd(“C:/training/R”)


##### Reading data into R from a file #####
#The data being used for this session can be found at this link: http://bit.ly/IRE15-R


##From a CSV (best file type to read in with R):
internal_docs = read.csv("~/Desktop/PartD_Providers_FORCLASS.csv", header = T, strip.white = T, sep=",")
View(internal_docs)


##Other important arguments that you can add to the data import command:
#1. header - is there a header? T or F
#2. sep = "," - what is separating the data; for csv, it's ","
#3. quote = "\"'" - how do quotes appear in the strings (here it is single quote)
#4. dec = "." - what does the decimal look like.
#5. row.names = c(x,x,x,etc...) - you can set row names if you like.
#6. col.names = c(x,x,x,etc...) - you can reset the column names. 
#7. stringsAsFactors = TRUE or FALSE - you can set the strings to character mode instead of factor (default is factor)
#8. na.strings = "NA" - what does NA look like.
#9. colClasses = c(x,x,x,etc) - set the type of data in each column.
#10. nrows = 100 - sets the number of rows.
#11. skip = 10 - sets how many rows you want to skip at the beginning.
#12. fill = TRUE or FALSE - if rows have different number of columns, this will fill the rest with blanks.
#13. strip.white = TRUE or FALSE - strip the white spaces from the columns


##From a tab delim. file:
delim_table = read.delim(filename, header=TRUE, sep="\t") #this is just an example.

##From an XLS:
install.packages("xlsx")
require("xlsx")
ceos_raw_from_xlsx = read.xlsx("top_100_ceos.xlsx", 1, header=TRUE) #read first sheet from this xlsx
View(ceos_raw_from_xlsx)

##From a DAT file:
read.table() #works with many file formats

##Read Fixed Width Formatted Files:
read.fwf()

###For more on importing files, check out: http://cran.r-project.org/doc/manuals/r-release/R-data.html


#Let's get started working with data. Have you loaded the file yet? Let's check?
ls()

#If not, load it using the read.csv()we used earlier. 
#If you haven't already download the file from here: http://bit.ly/IRE15-R 
#Also, make sure that you direct the command to where your file is located. The big difference between a Mac and PC is the way it references files.
	#On a Mac use ~/file_location/
	#On a PC use C:\file_lcocation\
internal_docs = read.csv("~/Desktop/PartD_Providers_FORCLASS.csv", header = T, strip.white = T, sep=",")

#Remember you can <- or = to assign values. Another way to import the data is this.
#Also, with read.csv() you don't have to tell it to strip.white or that the separator is ",". Both are already assumed.
internal_docs <- read.csv("~/Desktop/PartD_Providers_FORCLASS.csv", header = T)


#Let's see what field types the data was imported with using the str() commna.d
#To do that we use the following command: str(data_frame)
str(internal_docs)

#In R there are often multiple ways to do the same thing. 
#For example, ls() list objects, like the data frames we've uploaded.
ls()

#You can also use ls() around a data frame to list the columns
ls(internal_docs)

#You can see also the column names using names()
names(internal_docs)

#If we want $ separates the data frame for variables, (ie. data_frame$variable). If you're used to SQL, think of it like table.field)
#So, if we type in the data frame name it shows the whole table.
internal_docs

#If we type in just one field it shows the whole variable field.
internal_docs$ZIP

#Let's go back to the structure of data frame
str(internal_docs)

#In doing that we noticed that we don't like how one of the of our fields was imported incorrectly.
#We don't want ZIP as a integer, we want it as factor.
#To convert a field type use as.field_type(). So, as.factor(data_frame$variable) turns it in to a factor.

#This would convert ZIP from a integer to a factor.
as.factor(data$ZIP)

#All that did was temporarily convert the field. We have to replace the existing field using the = or <- field.
internal_docs$ZIP <- as.factor(internal_docs$ZIP)

#If we wanted to change it back to integer, we would use
internal_docs$ZIP <- as.integer(internal_docs$ZIP)

#Now let's get into what the data has. Part of R's core package includes summary(), which gives summary statistics on every variable, or field.
summary(internal_docs)


#If you want to see the top of your data frame, use the head() function. It shows the top six. 
head(internal_docs)

#The opposite function is tail(), which shows the bottom six. 
tail(internal_docs) 


#If you want to change the number printed, use a comma and the number you want to see.
#So, this would show the top 20
head(internal_docs, 20)

#So, this would show the bottom 200
tail(internal_docs, 200)

#Head and tail are helpful when we want to use it along with other functions. 
#For example, order() will order a data frame based on a variable. 
#Which data the most 
order(internal_docs$CLAIM_COUNT)

#That's not very helpful because it only shows that variable ordered. We need to use a wrapped function to show the whole data frame.
#This breaks down to data_frame[order(data_frame$variable_orderedby), ] 
internal_docs[order(internal_docs$CLAIM_COUNT), ]

#As a journalist, we care about who had the most claims. Not the least. To order by descending, use a "-" before the variable you're ordering by. Order like a journalist
internal_docs[order(-internal_docs$CLAIM_COUNT), ]

#Still not great.Let's a try that with just the top ones.
head(internal_docs[order(-internal_docs$CLAIM_COUNT), ])

#Hmm...but our editor wants us to mention the top 20 physicians. Let's pull those.
head(internal_docs[order(-internal_docs$CLAIM_COUNT), ], 20)


#Are those guys out of bounds? Let's do some quick calculations
#What's the average
mean(internal_docs$CLAIM_COUNT)

#What's the median
median(internal_docs$CLAIM_COUNT)

#What's the standard deviation?
#Remember the rule with Standard Deviations
	#68% within 1 sd
	#95% within 2 sds
	#99.7% within 2 sds
sd(internal_docs$CLAIM_COUNT)

#Let's look at our data overall. 
#Basic charts follow the same pattern. This will give a histogram of the variable CLAIM_COUNT
hist(internal_docs$CLAIM_COUNT)

#Boxplot, sometimes called a box-and-whisker plot
boxplot(internal_docs$CLAIM_COUNT)

#You can add things like a title and x and y labels to make it more clear.
hist(internal_docs$CLAIM_COUNT, main = "Histogram of Claim Count", xlab = "Number of claims by physician")

#Here are a few other simple charts.
barplot(internal_docs$CLAIM_COUNT, main = "Claims by Physicans", xlab = "Number of claims by physician", ylab = "Number of doctors")
plot(internal_docs$CLAIM_COUNT, main = "Claims by Physicans", xlab = "Number of claims by physician", ylab = "Number of doctors")

#Plot works well when you want to compare how two variables interact. 
#For example, claims vs. brand name
plot(internal_docs$CLAIM_COUNT, internal_docs$BENE_COUNT, main = "Total claims vs. Name Brands", xlab = "Number of claims by physician", ylab = "Name Brand Claims")


#If you want to look at just one area use, subset()
#Let's look at Docs only from PA
subset(internal_docs, STATE == "PA")

#Now, let's create a new data frame for those docs
PA = subset(internal_docs, STATE == "PA")
#or
PA <- subset(internal_docs, STATE == "PA")

#We can answer a lot of the same questions with just the PA data. 
#Who has the most claims in just Pennsylvania?
head(PA[order(-PA$CLAIM_COUNT), ])

#How many PA doctors are named Jones?
subset(PA, LAST_NAME == "JONES")

#How many PA doctors have 40,000 or more claims?
subset(PA, CLAIM_COUNT > 40000)

#Remember, we can do math in the terminal. We can also create a new field based on that math. 
#How many of each physican's total claim are brand names?
PA$BRAND_PCT<- PA$BRAND_COUNT/PA$CLAIM_COUNT

#Lastly, let's go through creating a Pivot Table with our data.
#To do that we need to use a package called plyr. 
#If you don't have plyr installed you need to do that first. 
install.pacakages("plyr")

#Then you have to use library() to let this session of R know you want to use plyr

#Now, let's create a pivot table of claims by state name using (ddply)
ddply(internal_docs, c("STATE"), summarise, claims = sum(CLAIM_COUNT))

#We can add as many factors or summary fields as we want to that. For example
ddply(internal_docs, c("STATE"), summarise, claims = sum(CLAIM_COUNT), brand = sum(BRAND_COUNT), total_cost = sum(COST_SUM))
#OR
ddply(internal_docs, c("STATE", "CITY"), summarise, claims = sum(CLAIM_COUNT), brand = sum(BRAND_COUNT), total_cost = sum(COST_SUM))