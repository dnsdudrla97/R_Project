#1
plot(speed~dist, data=cars)
res<-lm(speed~dist, data=cars)
abline(res)
cor(cars$speed, cars$dist)

#2 cor지수가 0.7544923으로 높다. 상관관계가 높다.
str(pressure)
plot(temperature~pressure, data=pressure)
res<-lm(temperature~pressure, data=pressure)
abline(res)
cor(pressure$temperature, pressure$pressure)

#3
str(state.x77)
colnames(state.x77)
pairs(state.x77[,c("Population", "Income", "Illiteracy", "Area")])

cor(state.x77[,"Population"], state.x77[,"Area"]) # 
cor(state.x77[,"Income"], state.x77[,"Illiteracy"]) # 상관 관계가 없다.
#4
points<-as.numeric(iris[,"Species"])
levels(iris[,"Species"])
points
class(points)
colors<-c("red", "green", "blue")
plot(Sepal.Length~Sepal.Width, data=iris, pch=c(points)+5, col=colors[points], main="red:setosa, green:versicolor, blue:virginica")
res<-lm(Sepal.Length~Sepal.Width, iris)
abline(res)
cor(iris$Sepal.Length, iris$Sepal.Width)
#5
income<-c(121,99,41,35,40,29,35,24,50,60)
period<-c(19,20,16,16,18,12,14,12,16,17)
Edu<-data.frame(income, period)
plot(period~income, data=Edu)
res<-lm(period~income, data=Edu)
abline(res)
cor(Edu$income, Edu$period)

#6
score<-c(77.5,60,50,95,55,85,72.5,80,92.5,87.5)
TV<-c(14,10,20,7,25,9,15,13,4,21)
ScoreTV<-data.frame(score, TV)
plot(TV~score, data=ScoreTV)
res<-lm(TV~score, data=ScoreTV)
abline(res)
cor(ScoreTV$score, ScoreTV$TV)

#7
colnames(mtcars)
ncol(mtcars)
mtcars.cor<-c()
for(i in 2:11) {
    cat("mpg and", colnames(mtcars)[i], ":", cor(mtcars$mpg, mtcars[,i]), "\n")
    mtcars.cor[i-1] <-cor(mtcars$mpg, mtcars[,i])
}
cat("mostly relative property : ", colnames(mtcars)[which.max(abs(mtcars.cor))+ 1], "\n")

#8
year<-c(2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026)
population<-c(51014,51245,51446,51635,51811,51973,52123,52261,52388,52504,52609,52704)
plot(x=year, y=population, main="2015~2026 예상 인구수 추계자료", lty=1, type="b", col="red", ylab="population", xlab="year")

#9
year<-c(20144,20151,20152,20153,20154,20161,20162,20163,20164,20171,20172,20173)
men<-c(73.9,73.1,74.4,74.2,73.5,73,74.2,74.5,73.8,73.1,74.5,74.2)
women<-c(51.4,50.5,52.4,52.4,51.9,50.9,52.6,52.7,52.2,51.5,53.2,53.1)
plot(x=year, y=men, main="남녀 경제활동참가율", lty=2, type="b", col="red", ylab="percentage", ylim=c(50,75))
lines(x=year, y=women, type='b', col="blue")

#10-1
Girth<-trees$Girth
Height<-trees$Height 
new.trees <- data.frame(Girth, Height)
plot(Height~Girth, data=new.trees) #산점도
res<-lm(Height~Girth, data=new.trees)
abline(res)
cor(new.trees$Girth, new.trees$Height) #상관계수

#10-2
Girth<-trees$Girth
Height<-trees$Height 
Volume<-trees$Volume
new.trees <- data.frame(Girth, Height, Volume)
#다중 산점도
vars<-c("Girth", "Height", "Volume")
target<-new.trees[, vars]
plot(target, data=new.trees) #산점도
pairs(target, main="trees") #산점도

res<-lm(Height~Girth, data=new.trees)
abline(res)
cor(target) #다중 상관계수

#11
str(Orange)
colnames(Orange)
points <- as.numeric(Orange[,"Tree"])
colors<-c("azure2", "coral", "cornflowerblue", "chartreuse2", "cadetblue1") #색깔 수정좀...
plot(age~circumference, data=Orange, pch=points, col=colors[points], main="1-azure2, 2-coral, 3-cornflowerblue, 4-chartreuse2, 5-cadetblue1")

#12
install.packages("mlbench") 
library(mlbench)
data("Glass")
myds<-Glass

dev.off(dev.list()["RStudioGD"])
#12-2
par(mfrow=c(3,3))
for(i in 1:(ncol(myds)-2)) {
    for(j in i+1:(ncol(myds)-(i+1))) {
        plot(x=myds[,i], y=myds[,j], main=paste(colnames(myds)[i], "and", colnames(myds)[j], sep=" "))
    }
}

#12-3
lines<-0
for(i in 1:(ncol(myds)-2)) {
    for(j in i+1:(ncol(myds)-(i+1))){
        cat(colnames(myds)[i], "and", colnames(myds)[j],":", cor(myds[,i], myds[,j]),"\t\t")
        lines<-lines+1
        if(lines %% 2 == 0) {
            cat("\n")
        }
    }
}

#12-4
pts<-as.numeric(myds[,"Type"])
colors<-c("red", "green", "blue", "orange", "purple", "brown")
par(mfrow=c(3,3))
for(i in 1:(ncol(myds)-2)) {
    for(j in i+1:(ncol(myds)-(i+1))) {
        plot(x=myds[,i], y=myds[,j], main=paste(colnames(myds)[i], "and", colnames(myds)[j], sep=" "), col=colors[pts])
    }
}

#13
#13-1
library(mlbench)
data("Ionosphere")
myds<-Ionosphere[,3:12]

#13-2
cors<-c()
k<-1
for(i in 1:(ncol(myds)-1)) {
    for(j in i+1:(ncol(myds)-i)){
        cors[3*k-2]<-i
        cors[3*k-1]<-j
        cors[3*k]<-cor(myds[,i], myds[,j])
        k<-k+1
    }
}

length(cors)
idx<-1:length(cors)
idx.max<-which.max(abs(cors[idx%%3==0]))
cat("most relative properties are", colnames(myds)[cors[idx.max*3-2]], "and", colnames(myds)[cors[idx.max*3-1]], "\nand value of cor :", cors[idx.max*3], "\n")

#14
year<-1875:1972
hlevel<-as.vector(LakeHuron)
plot(x=year, y=hlevel, type='l', col='blue')

#15
colnames(AirPassengers)
extMonthPsg<-function(y) {
    return (AirPassengers[((y-1949)*12+1):((y-1949)*12+12)])
}
year1949<-extMonthPsg(1949)
year1955<-extMonthPsg(1955)
year1960<-extMonthPsg(1960)
months<-1:12
plot(year1949 ~ months,
    ylim = (c(min(c(min(year1949), min(year1955), min(year1960))),
        max(c(max(year1949), max(year1955), max(year1960))))),
    col = "red",
    main = "red:1949, blue:1955, green:1960",
    type = "l",
    ylab = "passengers"
)
lines(year1955~months, col="blue", type='l')
lines(year1960~months, col="green", type='l')

#16
colnames(USAccDeaths)
extMonthUs<-function(y) {
    return (USAccDeaths[((y-1973)*12+1):((y-1973)*12+12)])
}
year1973<-extMonthUs(1973)
year1975<-extMonthUs(1975)
year1977<-extMonthUs(1977)
months<-1:12
plot(year1973 ~ months,
    ylim = (c(min(c(min(year1973), min(year1975), min(year1977))),
        max(c(max(year1973), max(year1975), max(year1977))))),
    col = "red",
    main = "red:1973, blue:1975, green:1977",
    type = "l",
    ylab = "passengers"
)
lines(year1975~months, col="blue", type='l')
lines(year1977~months, col="green", type='l')

