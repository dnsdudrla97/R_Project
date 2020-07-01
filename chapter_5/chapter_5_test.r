#1
typeof(infert)
infert
#1-1
edu<-infert[,"education"]
edu

#1-2
unique(edu)
levels(edu)
#1-3
table(edu)/length(edu)
#1-4
barplot(table(edu)/length(edu), main="education")

#2
#1-1
gender<-c("F", "F", "F", "M", "M", "F", "F", "F", "M", "M")
#1-2
table(gender)/length(gender)
#1-3
par(mfrow=c(1,2))
barplot(table(gender)/length(gender), main="gender")
#1-4
pie(table(gender)/length(gender), main="gender")

#3
#3-1
season <- c("summer", "winter", "string", "fall", "summer", "fall", "winter", "summer", "summer", "fall")
#3-2
table(season)/length(season)
#3-3
par(mfrow=c(1,2))
barplot(table(season)/length(season), main="season")
#3-4
pie(table(season)/length(season), main="season")

#4
#4-1
score<-c(90,85,73,80,85,65,78,50,68,96)
names(score)<-c("KOR","ENG","ATH","HIST","SOC","MUSIC","BIO","EARTH","PHY","ART")
#4-2
score
#4-3
mean(score)
median(score)
#4-4
sd(score)
#4-5
names(score[which.max(score)])
#4-6
boxplot(score)
boxplot.stats(score)$out #boxplot.stats(score)
#4-7
hist(score, main="학생성적", border="black", col="purple")

#5
#5-1
mean(mtcars[,"wt"])     #평균값
median(mtcars[,"wt"])   #중앙값
mean(mtcars[,"wt"], trim=0.15)  # 절사평균값(절사범위:15%)
sd(mtcars[,"wt"])               # 표준편차
#5-2
summary(mtcars[,"wt"])
#5-3 도수분포표
table(mtcars[,"cyl"])/length(mtcars[,"cyl"])
#5-4 이름이 없어~
barplot(table(mtcars[,"cyl"])/length(mtcars[,"cyl"]))
#5-5
hist(mtcars[,"wt"]) # 히스토그램
#5-6
boxplot(mtcars[,"wt"], main="mtcars 중량(wt)")
#5-7
boxplot(mtcars[,"disp"], main="mtcars 배기량(disp)")
#5-8
boxplot(mpg~gear, mtcars, main="mtcars 기어(gear) 연비(mpg)")

#6
#6-1
head(trees)
#6-2
mean(trees[,"Girth"])
median(trees[,"Girth"])
mean(trees[,"Girth"], trim=0.15)
sd(trees[,"Girth"])
#6-3
hist(trees[,"Girth"])
#6-4
boxplot(trees[,"Girth"], main="나무 지름")
#6-5
mean(trees[,"Height"])
median(trees[,"Height"])
mean(trees[,"Height"], trim=0.15)
sd(trees[,"Height"])
#6-6
hist(trees[,"Height"])
#6-7
boxplot(trees[,"Height"], main="나무 높이")

#7
typeof(Orange)
#7-1
head(Orange)
#7-2
mean(Orange[,"age"])
median(Orange[,"age"])
mean(Orange[,"age"], trim=0.15)
sd(Orange[,"age"])
#7-3
hist(Orange[,"age"])
#7-4
boxplot(age~Tree, data=Orange)
#7-5 (수정 필요)
mean(Orange[,"circumference"])
median(Orange[,"circumference"])
mean(Orange[,"circumference"], trim=0.15)
sd(Orange[,"circumference"])
#7-6 (수정 필요)
hist(Orange[,"circumference"])
#7-7
boxplot(circumference~Tree, data=Orange)



##### dumy ####
Orange$Tree
Orange[,"age"]
Orange[,"circumference"]-
Orange[,!(Orange$Tree==2)]

mean((Orange[,"circumference"]) & !(Orange[,"Tree"]==2))

Orange[,c("Tree")]==2

