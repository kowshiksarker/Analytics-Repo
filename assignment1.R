##1. From the USJudgeRatings dataset find the mean and standard delivation of the oevrall ratings of the judges
overallratings<-USJudgeRatings
overallratings<-transform(overallratings,Mean=apply(USJudgeRatings,1,mean),SD=apply(USJudgeRatings,1,sd))
overallratings<-as.data.frame(overallratings[,c(13:14)])
View(overallratings)

##2. Read the Aids2.csv file
aids<- read.csv("Aids2.csv")
View(aids)
##3. create a subset of the data without the state "Other"
subset_aids<-subset(aids,aids$state!="Other")
View(subset_aids)

##4. Add a new variable called 'agebracket'
##if age is below 20, agebracket is "0-20"
##if age is between 20 to 40, agebracket is "20-40"
##if age is between 40 to 60, agebracket is "40-60"
##if age is above 60, agebracket is ">60"
subset_aids$agebracket<-ifelse(subset_aids$age<"20",c("0-20"),
                               ifelse(subset_aids$age>="20" & subset_aids$age<"40",c("20-40"),
                                      ifelse(subset_aids$age>="40" & subset_aids$age<"60",c("40-60"),
                                             ifelse(subset_aids$age>"60",c(">60"),"NA"))))
      
View(subset_aids)

##5. Sort the data from high to low based on the variable "diag" and then low to high based on "death"
subset_aids<-subset_aids[order(-subset_aids$diag,subset_aids$death),]
View(subset_aids)

##6. Calculate and add one more variable which is (diag^2/death) and name it as "dd"
subset_aids$dd<-subset_aids$diag^2/subset_aids$death
View(subset_aids)
