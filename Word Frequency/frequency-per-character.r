#Generates a Cleveland Dot Plot using ggplot2 and plyr
library("ggplot2", lib.loc="/Library/Frameworks/R.framework/Versions/2.15/Resources/library")
library("plyr", lib.loc="/Library/Frameworks/R.framework/Versions/2.15/Resources/library")

shakes <- read.csv("shakes.csv", header=F)
shakes <- rename(shakes, c("V1" = "Character", "V2" = "Count"))

#Remove duplicated characters
shakes <- shakes[-13,]
shakes <- shakes[-9,]
shakes <- shakes[-26,]

# Adapted from Winston Chang, *R Graphics Cookbook*, 3.10
ggplot(shakes, aes(x=Count, y=reorder(Character, Count))) 
	+ geom_point(size=3) 
	+ theme_bw() 
	+ theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank(), panel.grid.major.y = element_line(colour="grey60", linetype="dashed")) 
	+ ylab("Character") 
	+ labs(title="Words Per Speaker in Much Ado about Nothing")

