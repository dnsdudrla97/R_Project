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
ncol(st);
nrow(st);
dim(st);
#02-6
str(st)
#02-7
rowMeans(st)
rowSums(st)
#02-8
colMeans(st)
colSums(st)
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
subset(st, Population >= 4500 & Income >= 4500 & Area >= 4500)
#02-15
nrow(subset(st, Income >= 4500))
#02-16
rownames(subset(st, Area >= 10000 & Frost >= 120))
#02-17
rownames(subset(st, Population < 2000 & Murder < 12))
#02-18
colMeans(subset(st[3], Illiteracy >= 2.0))
#02-19
colMeans(subset(st[3], Illiteracy < 2.0)) - colMeans(subset(st[3], Illiteracy >= 2.0))
#02-20
max(st$Life.Exp)
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
rownames(subset(mtcars, gear == 4 & mpg == min(mtcars$mpg)))
mtcars[c("Cadillac Fleetwood", "Lincoln Continental"),"mpg"]
rownames(subset(mtcars, gear==4))

#03-7
mtcars["Honda Civic", c("mpg", "gear")]

#03-8
mtcars["Pontiac Firebird", "mpg"]
rownames(subset(mtcars, mpg > mtcars["Pontiac Firebird", "mpg"]))

#03-9
mean(mtcars$mpg)
colMeans(mtcars[1])

#03-10
mtcars[10]

#04
str(airquality)
#04-1
class(airquality)
#04-2
head(airquality, 10)
#04-3
airquality[rownames(subset(airquality, Temp == max(airquality$Temp))), c("Month", "Day")]

#04-4
max.wind<-max(airquality["Wind"])

subset(airquality, Month == 6 & Wind == max.wind)

airquality[,-c(1, 2, 4, 6)]
subset(airquality[,-c(1, 2, 4, 6)], Month == 6)

subset(airquality, select=c("Wind", "Month"), Month == 6 & Wind == max(Wind))