#solved

#01
m <- c(10, 40, 60, 20)
f <- c(21, 60, 70, 30)
score <- cbind(m, f)
score

#01-2
colnames(score) <- c("male", 'female')
score

#01-3
score[2,]

#01-4
score[, 'female']

#01-5
score[3, 2]


#02
st <- data.frame(state.x77)
#02-2
st
#02-3
colnames(st)
#02-4
rownames(st)
#02-5
# ncol(st);
# nrow(st);
dim(st);
#02-6
str(st)
#02-7
rowSums(st)
rowMeans(st)
#02-8
colSums(st)
colMeans(st)
#02-9
st['Florida',]
#02-10
st[, 'Income']
#02-11
st['Texas', 'Area']
#02-12
st['Ohio', c('Population', 'Income')]
#02-13
subset(st, Population >= 5000)
#02-14
subset(st, Income >= 4500)[,c('Population', 'Income', 'Area')]
#02-15
nrow(subset(st, Income >= 4500))
#02-16
rownames(subset(st, Area >= 100000 & Frost >= 120))
subset(st, Area >= 100000 & Frost >= 120)
#02-17
rownames(subset(st, Population < 2000 & Murder < 12))
subset(st, Population < 2000 & Murder < 12)
#02-18
# colMeans(subset(st[3], Illiteracy >= 2.0))
mean(subset(st, Illiteracy >= 2.0)[,'Income'])
#02-19
# colMeans(subset(st[3], Illiteracy < 2.0)) - colMeans(subset(st[3], Illiteracy >= 2.0))
mean(subset(st, Illiteracy < 2.0)[, 'Income']) - mean(subset(st, Illiteracy >= 2.0)[,'Income'])
#02-20
max(st$Life.Exp)
rownames(subset(st, Life.Exp == max(st[,"Life.Exp"])))
#02-21
rownames(subset(st, Income > st['Pennsylvania','Income']))

#03
class(mtcars)
#03-2
dim(mtcars)
#03-3
str(mtcars)
#03-5
rownames(subset(mtcars, mpg == max(mtcars$mpg)))
#03-6
# rownames(subset(mtcars, gear == 4))
# rownames(subset(mtcars, mpg == min(mtcars$mpg)))
# mtcars[c("Cadillac Fleetwood", "Lincoln Continental"),"mpg"]
rownames(subset(mtcars, mpg == min(subset(mtcars, gear==4)[,'mpg'])))

#03-7
mtcars["Honda Civic", c("mpg", "gear")]

#03-8
mtcars["Pontiac Firebird", "mpg"]
rownames(subset(mtcars, mpg > mtcars["Pontiac Firebird", "mpg"]))

#03-9
mean(mtcars$mpg)
colMeans(mtcars[1])

#03-10 -> 애매 함
mtcars[10]

#04
str(airquality)
#04-1
class(airquality)
#04-2
head(airquality)
#04-3 
airquality[rownames(subset(airquality, Temp == max(airquality$Temp))), c("Month", "Day")]

#04-4 -> gg
# max.wind<-max(airquality["Wind"])
# subset(airquality, Month == 6 & Wind == max.wind)
max(subset(airquality, Month == 6)['Wind'])

#04-05
mean(as.matrix(subset(airquality, Month == 7)['Temp']))
#04-06
mean(as.matrix(subset(airquality, Month == 5 & (Ozone > 0))['Ozone']))
#04-07
nrow(subset(airquality, Ozone>100))

#05-1 ?
str(swiss)
summary(swiss)
#05-2
head(swiss, 10)
rownames(subset(swiss, Agriculture == max(swiss$Agriculture)))
#05-3

swiss.new<-swiss[order(swiss$Agriculture, decreasing = T),]
swiss.new['Agriculture']


#05-4
subset(swiss, Catholic >= 80)['Agriculture']

#05-5
subset(swiss, Catholic >= 80)['Agriculture']
subset(swiss, Examination < 20 & Agriculture < 50)[c('Examination', 'Agriculture')]

#06-1
class(state.x77)
setwd("C:/Users/Younsle/Desktop/R/dataframe_matrix/test")   
test_06_1 = subset(as.data.frame(state.x77), Income >= 5000)[c('Income','Population', 'Area')]
write.csv(test_06_1, "rich_state.csv")        
#06-2
ds<-read.csv(file.choose(), header=T)
ds<-read.csv("C:/Users/Younsle/Desktop/R/dataframe_matrix/test/rich_state.csv", header=T)
ds         







 


