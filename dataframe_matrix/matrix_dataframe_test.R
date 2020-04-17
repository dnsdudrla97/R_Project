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
