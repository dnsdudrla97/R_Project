# if-else
job.type <- 'A'
if (job.type == 'B') {
  bouns <- 200
} else {
  bouns <- 100
}
print(bouns)


# else 생략 if
job.type <- 'B'
bouns <- 100
if (job.type == 'A') {
  bouns <- 200
}
print(bouns)

# multi if-else
score <- 85
if (score > 90) {
  grade <- 'A'
} else if (score > 80) {
  grade <- 'B'
} else if (score > 70) {
  grade <- 'C'
} else if (score > 60) {
  grade <- 'D'
} else {
  grade <- 'F'
}
print(grade)

#if logical |(oring) &(andring)
a <- 10
b <- 20
if (a > 5 & b > 5) {
  print(a + b)
}
if (a > 5 | b > 30) {
  print(a * b)
}

#ifelse -> 삼항연산자
a<-10
b<-20
if (a>b) {
    c<-a
} else {
    c<-b
}
print(c)

a<-10
b<-20

c<-ifelse(a>b, a, b)
print(c)
